local ok, avante = pcall(require, "avante")

if not ok then
	vim.notify("avante.nvim not found!", vim.log.levels.ERROR)
	return
end

avante.setup({
	provider = "gemini", -- change at will

	openai = {
		-- grab key from env; must export PROVIDER_API_KEY
		-- api_key = os.getenv("OPENAI_API_KEY"),
		api_key_name = OPENAI_API_KEY,

		-- which model to talk to
		model    = "gpt-4o-mini",
		-- endpoint = "https://api.openai.com/v1/chat/completions",
		-- params
		timeout      = 30000,
		temperature  = 0.2,
		max_tokens   = 2048,
	},

	gemini = {
		model = "gemini-2.0-flash",
		-- Set your Gemini API key in your environment as GEMINI_API_KEY
		api_key_name = GEMINI_API_KEY,
		-- api_key = os.getenv("GEMINI_API_KEY"),

		timeout = 30000,
		temperature = 0,
		max_tokens = 8192,
	},

	-- claude = {
	-- 	-- Set your Anthropic API key in your environment as CLAUDE_API_KEY
	-- 	api_key = os.getenv("CLAUDE_API_KEY"),
	-- 	-- Free-tier model choice (adjust as needed)
	-- 	model = "claude-3.5-sonnet",
	-- 	-- Default endpoint for Anthropic's Claude API (verify with your provider)
	-- 	endpoint = "https://api.anthropic.com/v1/complete",
	-- 	timeout = 30000,
	-- 	temperature = 0.2,
	-- 	max_tokens = 2048,
	-- },

	mappings = {
		ask     = "<leader>qw",   -- open a chat prompt (normal & visual)
		edit    = "<leader>qq",   -- apply selected suggestion
		refresh = "<leader>qa",   -- ask to improve visual coverage
		cancel_request = "<leader>qc",  -- cancel ongoing suggestions/request
		undo_last      = "<leader>qu",  -- undo the last applied suggestion
		toggle_ai      = "<leader>qt",  -- toggle AI suggestions on/off
		save_last      = "<leader>qs",  -- save the last generated response/text
		quick_retry    = "<leader>qr",  -- quick retry of the last prompt/query
	},
})
