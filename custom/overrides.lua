local overrides = {}
local cmp = require("cmp")
overrides.cmp = {
	-- mapping = {
	--   ["<Tab>"] = cmp.mapping.confirm({select = true}),
	--   ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	--   ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
	-- }
}
return overrides
