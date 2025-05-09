require("blackjack").setup({
	card_style = "mini", -- Can be "mini" or "large".
	suit_style = "black", -- Can be "black" or "white".
	scores_path = "/home/jose/Games/blackjack/blackjack_scores.json", -- Default location to store the scores.json file.
	keybindings = {
		["next"] = "j",
		["finish"] = "k",
		["quit"] = "q",
	},
})
-- :BlackJackNewGame
-- :BlackJackQuit
-- :BlackJackResetScores

