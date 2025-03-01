-- {
--   "Console Log": {
--     "prefix": "clg",
--     "body": "console.log('$1');",
--     "description": "Console log shortcut"
--   },
--   "Arrow Function": {
--     "prefix": "af",
--     "body": "const $1 = ($2) => {\n  $3\n};",
--     "description": "Arrow function snippet"
--   },
--   "Hello World": {
--     "prefix": "hw",
--     "body": "console.log('Hello World');",
--     "description": "Hello World snippet"
--   }
-- }

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("javascript", {
	s("clg", { t("console.log('Hello, World!');") }),
	s("hw", { t("console.log('Hello World');") }),
})
