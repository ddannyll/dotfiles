-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  enabled = true,
  event = 'VeryLazy',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',

    -- virtual text
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'debugpy',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<leader>dd', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.25 },
            { id = 'breakpoints', size = 0.25 },
            { id = 'stacks', size = 0.25 },
            { id = 'watches', size = 0.25 },
          },
          size = 40,
          position = 'right',
        },
        {
          elements = {
            { id = 'repl', size = 0.5 },
            { id = 'console', size = 0.5 },
          },
          size = 0.25,
          position = 'bottom',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = 8123,
      executable = {
        command = os.getenv 'HOME' .. '/.local/share/nvim-kickstart/mason/bin/js-debug-adapter',
      },
    }
    dap.adapters['chrome'] = {
      type = 'executable',
      command = 'node',
      args = {
        os.getenv 'HOME' .. '/.local/share/nvim-kickstart/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js',
      },
    }

    local js_based_languages = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }
    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        {
          name = 'Next.js: debug client-side',
          type = 'chrome',
          request = 'launch',
          url = 'http://localhost:3000',
          webRoot = '${workspaceFolder}',
          sourceMaps = true,
          sourceMapPathOverrides = {
            ['webpack://_N_E/*'] = '${webRoot}/*',
          },
        },
        {
          name = 'Next.js: debug server',
          type = 'pwa-node',
          request = 'launch',
          program = '${workspaceFolder}/node_modules/next/dist/bin/next',
          runtimeArgs = { '--inspect' },
          skipFiles = { '<node_internals>/**' },
          serverReadyAction = {
            action = 'debugWithChrome',
            killOnServerStop = true,
            pattern = '- Local:.+(https?://.+)',
            uriFormat = '%s',
            webRoot = '${workspaceFolder}',
          },
          cwd = '${workspaceFolder}',
        },
      }
    end

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }

    -- Python debugging with debugpy
    -- Uses Mason-installed debugpy by default
    require('dap-python').setup(os.getenv 'HOME' .. '/.local/share/nvim-kickstart/mason/packages/debugpy/venv/bin/python')

    -- Resolve a project-local Python interpreter.
    -- Order: in-tree .venv (uv) → poetry env → $VIRTUAL_ENV → system python.
    local function resolve_python()
      local cwd = vim.fn.getcwd()
      local uv_python = cwd .. '/.venv/bin/python'
      if vim.fn.executable(uv_python) == 1 then
        return uv_python
      end
      local poetry_venv = vim.fn.trim(vim.fn.system 'poetry env info -p 2>/dev/null')
      if vim.v.shell_error == 0 and poetry_venv ~= '' then
        return poetry_venv .. '/bin/python'
      end
      local active_venv = os.getenv 'VIRTUAL_ENV'
      if active_venv and active_venv ~= '' then
        return active_venv .. '/bin/python'
      end
      return 'python'
    end

    -- Pick a project .env file if it exists; debugpy will load it.
    local function resolve_env_file()
      local env_file = vim.fn.getcwd() .. '/.env'
      if vim.fn.filereadable(env_file) == 1 then
        return env_file
      end
      return nil
    end

    -- Extra env vars that mirror what `task dev` injects (ml-scribe-specific).
    -- WeasyPrint needs DYLD_FALLBACK_LIBRARY_PATH on macOS pointing at brew libs.
    local function project_env()
      local env = {}
      if vim.fn.has 'mac' == 1 and vim.fn.executable 'brew' == 1 then
        local brew_prefix = vim.fn.trim(vim.fn.system 'brew --prefix 2>/dev/null')
        if vim.v.shell_error == 0 and brew_prefix ~= '' then
          env.DYLD_FALLBACK_LIBRARY_PATH = brew_prefix .. '/lib'
        end
      end
      return env
    end

    -- Python configurations for FastAPI projects (ml-scribe uses uv).
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch current file',
        program = '${file}',
        pythonPath = resolve_python,
        cwd = '${workspaceFolder}',
        console = 'integratedTerminal',
        justMyCode = false,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'FastAPI: main.py (reload, follow subprocess)',
        program = '${workspaceFolder}/main.py',
        pythonPath = resolve_python,
        cwd = '${workspaceFolder}',
        console = 'integratedTerminal',
        justMyCode = false,
        subProcess = true,
        envFile = resolve_env_file,
        env = project_env,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'FastAPI: uvicorn main:app (no reload, single process)',
        module = 'uvicorn',
        args = { 'main:app', '--host', '0.0.0.0', '--port', '8080' },
        pythonPath = resolve_python,
        cwd = '${workspaceFolder}',
        console = 'integratedTerminal',
        justMyCode = false,
        envFile = resolve_env_file,
        env = project_env,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'FastAPI: uvicorn main:app (reload, follow subprocess)',
        module = 'uvicorn',
        args = { 'main:app', '--host', '0.0.0.0', '--port', '8080', '--reload' },
        pythonPath = resolve_python,
        cwd = '${workspaceFolder}',
        console = 'integratedTerminal',
        justMyCode = false,
        subProcess = true,
        envFile = resolve_env_file,
        env = project_env,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'Pytest: current file',
        module = 'pytest',
        args = { '${file}', '-v', '-s' },
        pythonPath = resolve_python,
        cwd = '${workspaceFolder}',
        console = 'integratedTerminal',
        justMyCode = false,
        envFile = resolve_env_file,
      },
      {
        type = 'python',
        request = 'launch',
        name = 'Pytest: nearest test (cursor word)',
        module = 'pytest',
        args = function()
          local node = vim.fn.expand '<cword>'
          return { '${file}::' .. node, '-v', '-s' }
        end,
        pythonPath = resolve_python,
        cwd = '${workspaceFolder}',
        console = 'integratedTerminal',
        justMyCode = false,
        envFile = resolve_env_file,
      },
      {
        type = 'python',
        request = 'attach',
        name = 'Attach to running process (port 5678)',
        connect = {
          host = '127.0.0.1',
          port = 5678,
        },
        pythonPath = resolve_python,
        justMyCode = false,
        pathMappings = {
          {
            localRoot = '${workspaceFolder}',
            remoteRoot = '${workspaceFolder}',
          },
        },
      },
    }
    require('nvim-dap-virtual-text').setup()
  end,
}
