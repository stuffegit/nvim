return {
	"quentingruber/pomodoro.nvim",
	lazy = false, -- needed so the pomodoro can start at launch
	opts = {
		start_at_launch = true, -- Disable automatic start at launch
		work_duration = 25,
		break_duration = 5,
		delay_duration = 1, -- The additional work time you get when you delay a break
		long_break_duration = 15,
		breaks_before_long = 4,
	},
	config = function()
		-- Start the Pomodoro timer manually after Neovim has fully loaded
		vim.cmd("silent! PomodoroStart") -- Start the timer silently to avoid messages
	end,
}
