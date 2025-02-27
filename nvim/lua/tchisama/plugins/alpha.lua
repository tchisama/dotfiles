return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Define multiple ASCII arts
		local headers = {
			{
				"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢸⣿⣿⠏⣍⡛⠿⣿⣿⣿⣿⣿⠟⠉⢌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣯⠿⣭⡛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⢣⠳⡜⢼",
				"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⡜⠿⡟⢰⣣⡝⢶⡌⠛⣿⡿⠁⠠⠉⢄⠆⣿⣟⣛⣛⣛⡿⢿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣟⣧⣛⡖⣻⢿⣿⣿⣿⣿⣿⣿⢟⡱⢎⢲⠹⡜⢮",
				"⣿⣿⣿⣿⣿⣿⣿⣴⣶⣮⣭⠝⣛⣿⣶⡆⣙⠤⢭⣷⣜⣳⣬⣤⣴⣶⡿⣟⣻⣽⣿⣿⣿⣿⣿⣿⣛⣛⣶⡶⢭⣝⡛⠿⣿⣿⡿⣎⠇⢈⠱⢎⠭⡛⣝⢫⠛⡜⣌⠖⠉⠊⡓⣩⠞",
				"⣿⣿⣿⣿⣿⣿⠿⣫⣭⣶⣾⣿⣿⣿⣿⣇⠳⣎⠱⡈⢍⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣯⣗⠦⣉⠳⡋⢀⠎⡤⠈⠖⡱⢌⠦⠙⣠⠔⢢⢒⡥⣓⢦⢻",
				"⠿⣿⣿⡿⣛⣑⣿⡿⣿⣻⣩⣿⡿⢟⠋⢬⠓⣈⣴⣾⣿⣟⡻⡿⣿⣿⣿⣿⣿⣿⣷⣷⣾⣯⣿⣻⢿⡿⣿⣿⣿⣌⠿⣿⣿⣾⡗⢀⠎⡘⠤⢃⠈⡕⡊⢀⡼⠁⣈⢡⣈⣤⣭⣬⣭",
				"⣷⣮⡍⣛⠛⣛⠯⠭⣫⣿⡿⠫⠼⣃⣬⣶⣿⣿⢿⣽⣾⣿⢷⣨⡑⠾⢶⣶⡶⡾⠿⣻⢞⣭⣽⣛⣿⢿⢾⣝⣻⢿⣧⡹⣿⣻⠇⣈⠒⡩⠜⣡⠂⠁⣀⣿⣴⣿⣿⡿⠟⠋⣭⡴⢮",
				"⣿⣿⣼⠋⢴⣪⣵⣾⣿⣿⣶⣮⠍⢙⣩⣿⣾⣷⣿⣿⢿⡫⣻⣿⣿⡖⣠⣤⣤⡷⢋⣵⣿⣿⣿⣿⠏⣼⢐⡏⣽⣻⡾⣧⠙⣿⠂⠜⢠⡑⢃⠦⡁⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣝⠻",
				"⣿⡷⠶⣾⡿⡿⠿⣿⢻⣻⠟⡉⠒⠋⠙⣨⣾⡿⠋⣵⡾⣱⣿⡿⠛⠐⢛⠻⠋⢀⣾⣿⣿⢿⡟⠁⣸⠇⠸⣇⠳⢾⣿⣧⠡⡸⡁⠌⠠⣘⢡⠚⡄⠻⢭⣿⣿⣿⣿⡿⢿⣟⣿⣿⣿",
				"⢿⣿⣿⣧⣿⣿⡿⠿⠛⣣⣤⡄⠠⢀⣼⣿⠟⠀⣸⣿⢃⠟⡃⠀⢀⣿⠟⠀⠀⡼⣸⣿⢘⡿⠃⢀⡟⠀⠘⢧⢸⢻⣿⣿⠀⠠⡀⠀⠄⡀⠜⡸⢠⡘⠤⡘⠿⣿⣼⣿⣻⠿⣟⣿⣿",
				"⣷⣶⣤⣖⠒⠐⢊⣵⣾⣿⣿⠷⢀⣾⠟⣡⢈⢡⣿⠃⠰⠋⡠⣺⠀⡋⢠⠆⠰⣸⡿⢡⠏⢁⡴⢈⠄⢰⡆⢳⠀⢬⡙⢿⠀⣧⡈⠦⡀⠐⡌⡑⢆⡒⠐⣌⡒⢬⡙⢿⣿⣿⣱⢿⣿",
				"⣿⣿⠟⡁⢂⡴⠿⠛⢋⠉⡀⢠⡾⠋⠰⢀⡾⢸⡏⠀⠃⣼⡾⠟⠀⡁⠛⣵⠀⡟⠀⢃⣴⡿⢃⡴⢠⣿⣿⣄⠂⢘⣿⠆⠀⣿⣿⡆⠈⠃⠔⡉⢆⠸⡁⢌⢻⣤⠹⣷⣎⡻⣿⣿⣬",
				"⣿⠋⠤⣁⠢⠐⠢⠑⢠⠂⢁⡾⠁⠀⢀⡟⡃⢸⡁⠈⣼⢋⣴⡿⡆⠀⠀⣿⡇⢡⣾⣿⣿⣵⣏⣴⠟⠉⠉⠛⠆⡀⡿⠁⠀⣿⣿⣇⠀⠈⡐⢀⠢⢄⡁⠂⢆⠹⣷⣌⢿⣷⣮⢻⣿",
				"⠃⡜⠐⡠⠋⣀⠂⡜⠢⠈⠌⠁⠀⠌⢘⣼⡇⠐⠀⢸⠇⣼⡟⠀⠀⠀⠀⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⠻⠇⠁⢠⡀⠘⠀⠸⣿⣿⣿⡄⠀⠐⠠⠐⢢⠀⠈⠆⡁⢈⠣⠲⡹⣿⣧⡻",
				"⣠⡞⢘⣔⣠⢀⡜⢬⠁⢂⠀⢠⠃⠀⣊⠟⡠⠀⠄⢸⣷⣿⣧⠰⣴⡄⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⣷⠀⠂⡇⡟⣿⢸⣷⡀⠈⠄⡁⠆⠈⠄⠘⡀⢀⠈⠅⠒⣈⠻⣷",
				"⣿⣱⣿⣿⣏⣰⣊⠒⠀⠂⡜⠰⢀⡾⠏⡰⠁⠀⠀⢸⣿⣿⣿⣷⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢠⣀⣠⢃⣿⠀⣸⢑⡷⢻⡄⠻⣧⠀⡀⠈⢀⠐⡈⠄⠀⠂⡄⠈⠠⠀⢣⠹",
				"⣿⣿⣿⣿⣿⣿⣿⣀⡀⠘⠄⡵⠋⡴⢘⠀⠀⡀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣭⣴⣿⡟⣰⠯⣼⡟⢸⣇⠀⠙⣷⡀⠆⠀⢂⠐⢀⠀⠡⠄⡘⡀⠄⣦⡑",
				"⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠘⣠⢄⡷⠁⠠⠀⠄⠀⠘⣿⣿⣿⣿⣿⣿⡏⢡⣄⣢⣍⠙⠻⣿⣿⣿⣿⣿⣿⣿⠟⢈⣾⣱⣿⠃⢸⣹⠀⡂⠈⠙⠦⣀⠠⢠⢿⣷⣈⣄⠐⡡⢀⡿⢿",
				"⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣽⣯⢸⡓⢀⠖⠀⠠⡍⡄⠈⠻⣿⣿⣿⣿⣧⠻⣜⡷⣞⡿⢡⣿⣿⣙⢛⡛⢍⣠⢔⣾⣿⡿⠃⠀⡌⡇⠇⡐⠁⢂⠆⠀⣤⡹⣴⠙⠧⢹⣧⢶⡌⢻⣇",
				"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣿⣿⠀⡇⢪⠜⣢⢓⡘⢬⠱⡠⠈⠛⢿⣿⣿⣷⣮⣭⣭⣶⣿⣿⣿⣿⣿⣿⣿⢫⢞⡷⠟⠀⠐⢡⠀⡇⠂⠀⢌⠒⡘⢀⠘⣷⡐⠆⡀⢀⠹⠞⡇⣘⣼",
				"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⢇⠞⡰⢮⠜⣢⠱⡡⢋⠄⠀⠉⠙⠻⢿⣿⣿⣿⣿⡿⠿⠿⠛⠋⣁⠖⡋⠀⢀⠀⡠⠂⠀⠃⣀⠀⠀⡈⠱⢀⠎⣿⣧⡄⡘⢘⡓⠦⠧⢿⢻",
				"⣿⣿⣿⣿⣿⠿⣿⠿⢋⣅⠛⡿⢋⣥⣬⣬⣁⣉⣌⣠⢁⣁⠉⠆⠀⠀⠀⠈⠀⠀⠀⢀⠀⠀⠂⠀⠄⠊⠁⠀⢀⠠⠈⢀⠔⣢⠀⡔⠀⠀⠰⣤⣥⢾⠄⠈⢿⣿⣿⣷⣮⣕⢾⢻⣇",
				"⣻⣽⣞⡿⠁⠠⣰⣶⣌⠋⠟⢠⣿⣿⢿⣻⡿⠟⠖⡀⠂⢀⠁⣀⠀⠀⢠⠐⠤⢒⡰⢠⠄⠁⠄⠂⣐⣥⣶⣦⣤⣤⣤⣬⣤⣔⠉⢀⡤⢖⣫⡝⣶⢣⣶⣻⡈⢿⣿⣿⣿⣿⡇⣿⣿",
				"⣟⡾⣽⠂⡀⠸⣿⡟⢋⠃⠀⣛⣛⠺⠋⢁⡤⠾⢾⢗⣛⡃⣈⣐⣂⣕⢢⣷⣾⣷⡿⠁⢰⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠱⣺⡝⣶⡽⣳⣯⣷⢿⣳⣌⠛⢋⣉⣉⠍⠻⣿",
				"⣩⣱⣥⠀⣼⡿⣿⠖⡂⢀⣀⣬⣉⡀⠛⠳⢒⠛⣀⣬⣽⣶⣾⣥⣼⣧⡀⠾⠩⢍⡐⠇⣿⢸⣿⣟⣿⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⠸⣵⣻⣗⡿⣟⣷⢿⣻⡿⢁⣶⣿⣿⣿⣿⣧⡨",
				"⣿⣿⡇⢠⠘⠛⠁⠘⣵⣽⣿⣿⣿⡇⠀⢸⢫⢺⣿⣿⣿⣿⣿⣿⣿⣿⠃⣮⣿⠈⠛⠐⠛⠈⣵⣿⣿⣿⣿⣿⣿⢹⣾⣿⠛⡞⣿⢸⣿⢳⣿⣿⣿⣿⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣷",
				"⣿⡿⢥⠀⢰⠞⢸⢚⣼⣿⣿⣿⡿⢡⣾⢆⣳⣿⣿⣿⣿⣿⣿⣿⣿⣟⢂⣙⡁⣿⢆⠘⠃⠈⡘⢿⡻⠿⢛⡙⡉⠉⠁⠀⢀⡀⢀⣨⡭⣶⣶⠯⠉⢹⣭⠏⣼⣿⡿⠋⣿⣿⡟⢿⣿",
				"⡿⡝⢦⡀⠀⠀⡄⠘⣿⣿⣿⡿⣡⣿⢏⢶⣿⣿⣿⣿⣿⣿⣿⣿⣟⠄⡘⢟⡵⠋⣄⠣⠄⠓⠀⢄⠲⢟⣯⡟⠁⠀⠠⣾⣿⣿⡿⠒⠉⠳⠋⠠⠀⢾⡟⣴⡿⠛⣠⢍⢻⡿⠇⠈⠻",
				"⠴⣶⣖⡶⣤⡀⠁⢠⣿⣿⡿⠁⠼⡏⢮⣿⣿⣿⣿⣿⣿⣿⣿⣟⢡⣶⡧⢉⣠⠜⡠⠍⠀⡀⢨⠀⠆⢂⠉⠁⠀⢰⣦⡛⣿⠏⠀⠰⠀⡄⠀⠀⠀⢸⣍⡋⠀⣸⣏⣿⣆⢡⠀⠌⡁",
				"⠀⠂⠌⡛⠛⠇⡂⢸⣿⣿⢇⣸⣴⡌⣾⣿⣿⣿⣿⣿⣿⣿⠫⠂⢬⢉⣶⣿⡏⡰⠁⢄⠞⣡⣆⠳⣌⣂⣡⠀⢠⢹⣿⣿⣶⠄⡰⣴⠾⢿⣦⡀⢂⣼⣿⡇⢰⣿⣿⣜⢿⣯⠀⠒⡀",
				"⠤⣀⠀⠀⠈⠘⢣⣸⣿⣿⢆⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⡓⡡⣿⢢⣾⣿⡟⡠⢡⠜⣡⣾⣿⣿⣿⣶⣿⣶⣶⣸⠡⠟⠋⡅⢮⡽⣣⣾⣿⣿⣷⣌⠻⡿⢠⣿⣿⣿⣿⣿⣿⢸⣄⣢",
				"⠠⢁⠚⠤⣀⠈⠀⢿⣿⣿⢸⣿⠇⣿⣿⣿⣿⣿⣿⣿⡓⣀⡿⢈⣾⣿⡟⠡⡱⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣇⠀⠂⠘⣿⣷⣿⣿⣿⣿⣿⣿⡷⢡⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿",
				"⣄⣶⣷⣆⠀⢁⠂⠀⠙⠧⣿⢻⣼⣿⣿⣿⣿⣿⣿⢧⠁⢿⢃⣾⣿⡟⢠⡞⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣛⣉⣀⣤⣀⣈⢿⣿⣿⣿⣿⣿⡿⣰⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿",
				"⣸⣿⣿⣿⣷⡠⡐⠈⠄⡀⠀⠂⣿⣿⣿⣿⣿⣿⣯⢃⣯⡄⣿⣿⠏⢠⡟⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣝⢿⣿⣿⣿⣵⣿⣿⣿⣿⣿⣿⣿⣿⢧⣿⣿⣿",
			},
			{
				"⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷",
				"⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇",
				"⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽",
				"⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕",
				"⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕",
				"⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕",
				"⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄",
				"⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕",
				"⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿",
				"⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
				"⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟",
				"⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠",
				"⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙",
				"⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣",
			},
			{
				" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡿⣿⢏⡼⠀⢀⣾⢃⣼⠏⢠⡾⠃⣠⠏⠀⠁⣀⠀⡁⠀⠀⣠⡈⠉⡉⠉⢻⡄⠀⠀⠈⠈⢄⠐⣦",
				"⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣯⣾⠃⣼⢁⢠⡿⣡⣾⠃⣴⣿⠁⣠⡟⠀⠄⠡⢀⠈⠀⣠⣱⣿⠇⠡⠄⠀⠀⢿⡆⠈⠄⡁⠈⣳⣽",
				"⠄⠁⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣯⣿⠇⣼⡇⠀⣿⢓⣿⠧⣼⣻⠇⢠⣿⠁⠀⠌⠰⠀⢀⣴⣿⡟⣹⠀⠐⡌⠄⠸⡌⣿⠀⠀⠄⠄⢹⣿",
				"⠄⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣟⣟⢨⣿⠀⣼⣏⣾⡟⣰⣟⣿⢣⣿⡟⠀⠈⢀⢀⣄⣾⣿⡟⣇⣿⣀⡐⣈⡀⠐⣿⢹⡇⠀⠁⠂⢸⣿",
				"⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⣹⡇⣯⣿⠀⣿⣿⣿⣿⣿⣼⣧⡟⣽⡃⠀⢈⠈⣭⣿⡿⠃⠉⣿⣿⡍⢉⡏⠙⠻⣿⣼⡷⣬⣶⢷⣿⡟",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢽⣸⡗⣯⣿⢘⣿⢼⣿⣿⣿⣿⣿⢠⣿⠀⠀⣠⡾⣻⣟⣡⣄⡀⣽⡏⣧⢸⡇⠂⠱⢺⣿⣗⡻⣽⣾⣿⠘",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⡿⣷⣹⣿⡞⡿⣸⣿⣿⣿⣿⡏⢸⡿⠀⣰⡿⢣⡿⢻⣿⣿⣷⣿⣥⣿⣾⢡⠀⠐⣾⣿⡝⣧⣿⣿⢹⡀",
				"⠀⠀⠀⠀⢀⣠⣄⣀⣀⣀⣠⣸⣷⣿⣿⣿⢿⣇⠹⣟⡹⠿⡟⠀⠀⣿⣼⠏⢠⠋⠀⣿⣿⣿⣿⣿⣿⠿⣿⡇⠀⢨⣿⣿⡽⣟⡿⠁⢸⠅",
				"⠀⠀⠀⢰⣿⡟⠿⠿⢯⡿⣽⣿⣻⣿⣯⣿⣌⣷⠀⠉⠛⠁⠀⠀⢨⡿⠁⠀⠀⠀⠀⣿⠟⣿⢿⣿⠟⣰⡟⠀⠠⣼⣿⢯⣽⠟⣠⠀⢸⡇",
				"⠀⠀⢠⣿⣻⠃⢠⣄⣤⣔⣃⡀⠉⠉⠙⠛⠻⠾⢧⣤⣤⣤⣤⣀⣈⠀⠀⠀⠀⠀⠀⠙⠿⠶⠞⠁⣰⡿⠁⢀⣽⢻⣿⠟⠁⠀⢹⡄⠐⣿",
				"⡄⠀⣾⣧⡟⠀⣿⡏⠉⠉⠛⠁⢈⣿⠃⠀⠀⠀⢠⣦⡀⢠⣌⡉⠙⠛⠛⠷⠶⠶⠴⣶⣤⣦⣰⣾⡟⠁⢠⡾⢫⣿⡟⠀⠰⠈⢌⣧⠀⢿",
				"⡁⠀⣿⣽⠃⠀⠻⣿⣦⡀⠐⡁⢸⣟⠀⠀⠀⠀⢸⣿⡉⢸⡿⠁⠀⠁⠈⣷⡦⣷⣤⣤⣄⣠⡉⠉⠙⠛⣿⡿⣟⣿⣇⠀⠰⢈⠀⢿⡀⢈",
				"⢶⣴⣿⡟⠀⠀⠀⠀⠛⢿⣦⢀⣿⡟⠶⠶⢶⣦⣿⡇⡘⣿⡇⠀⠀⠀⢀⣿⠁⠀⠉⢹⣿⠛⠛⠋⠀⢠⣿⣗⡣⢿⣿⠀⠐⠠⠀⢸⣷⡀",
				"⣿⢿⣷⡇⠰⢷⣤⣤⣤⣿⢿⣸⣿⠁⠀⠀⠀⢠⣿⢱⢱⣿⠁⠀⠀⠀⣸⣿⠀⠈⡄⣿⡟⠀⠀⠀⠀⣸⣿⣶⢹⣻⣿⡄⠀⡁⠂⠈⣿⣷",
				"⣿⠉⢥⡂⠀⠀⠈⠉⠉⠀⠀⠛⠛⠀⠀⠀⠀⢼⣿⠘⠘⣿⣄⠀⠀⢢⣿⡇⠀⠐⢆⣿⠃⠀⠀⠀⢀⣿⣗⣻⣧⢚⣿⣧⠀⠐⠠⠄⢻⣿",
				"⣿⡀⡸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠿⠛⠋⠀⠀⠀⣸⣿⠀⠀⠐⡏⠹⣿⣧⢏⣷⢫⡜⣿⡆⠀⠃⠌⠘⣟",
				"⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢰⣶⠆⠀⠀⠀⣀⣀⠀⣁⠀⠀⠂⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠸⣿⠉⠁⢻⣎⢿⡧⡽⣹⣿⡄⠉⠄⠈⢷",
				"⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⠀⠀⠀⢀⣿⡏⠂⣿⡿⠿⣶⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⡶⠛⠙⣿⡞⣿⡱⣧⣛⣿⡄⠀⠈⠈",
				"⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠇⠀⠀⠀⢸⣿⠃⢰⣿⠃⢀⡝⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠄⣿⣳⢻⣧⡿⡹⡽⣷⡄⠀⠠",
				"⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⠀⠀⠀⠀⣸⡟⠀⣼⣯⣤⣼⣽⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣯⠘⠀⣿⣧⢻⡷⣿⡱⢏⡿⣿⣄⠀",
				"⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣦⣀⣀⣠⣿⠃⢡⣿⡇⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⢿⣄⣁⣿⣏⣯⣿⣿⠱⣏⣿⢿⣿⣦",
				"⣶⣶⢦⡤⣤⣄⣀⣀⠀⠀⠀⠀⠈⠉⠉⠉⠀⠀⠸⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣷⣬⠿⡻⣍⠯⣹⣿⢇⡿⡜⣿⡇⣿⣿",
				"⠋⠙⠛⠛⢲⠾⢯⣽⣟⣟⣶⡶⢦⣤⣤⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣍⡲⣍⠳⢎⡳⣽⡟⢮⡳⡝⣿⡇⢸⣿",
				"⠀⠀⠀⢀⣀⢀⡉⣴⣮⣉⣉⣹⣟⣿⡯⣭⣿⣻⣯⡿⣟⢳⡶⢤⡤⣤⣀⣀⣀⠀⠀⠀⠀⢰⣟⣛⣛⢳⡹⣎⣶⣿⣹⢣⣛⠵⣻⠆⠸⣿",
			},
			{

				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⢔⣦⣶⣿⣿⣿⣿⡷⠖⠒⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠉⠁⠂⠀⠀⢀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⣰⠶⣦⡤⣄⠀⠀⠀⠀⠀⠀⣠⠖⢩⣶⣿⣿⣿⣿⣿⠟⢉⣠⠔⠊⠁⠀⠀⠀⣀⣄⠀⠀⠉⠑⢦⣠⣤⣤⡀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠘⢷⣌⡧⡾⠀⠀⠀⠀⡠⠊⢁⣴⣿⣿⣿⣿⣿⢟⣠⡾⠟⠁⠀⣀⣤⣶⠞⣫⠟⠁⠀⢀⠄⠀⢀⠙⢿⣿⣿⣷⣄",
				"⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀⣠⣾⣶⣶⣿⣿⣿⣿⣿⣿⣷⡿⠋⣀⣤⣶⣿⣿⣋⣴⡞⠁⠀⠀⣠⠊⠀⠀⢸⡄⢨⣿⣿⣿⣿",
				"⠀⠀⠀⠀⠀⢃⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠿⠿⢻⣿⣿⣿⣿⣿⣿⠿⠛⢉⣴⣿⢿⣿⠏⠀⠀⠀⡴⠃⣰⢀⠀⢸⣿⣤⣏⢻⣿⣿",
				"⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⠀⢀⣾⡿⣿⡿⠁⠀⢀⣾⣿⣿⣿⡿⠋⠁⠀⣠⣿⠟⢡⣿⡟⠀⢀⣤⣾⠁⣼⣿⢸⡇⢸⣿⣿⣿⡈⣿⣿",
				"⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⢀⣾⠋⣼⣿⠁⢀⠀⣼⣿⣿⠟⠁⠀⠀⠀⣰⡿⠋⢠⣿⡿⠁⢠⣾⣿⡏⢀⣿⣿⣾⣿⢸⣿⣿⣿⡇⢹⣿",
				"⠀⠀⠀⢰⡶⣤⣤⣄⠀⠀⠀⡼⠁⣼⣿⣿⣾⣿⣰⣿⠟⠁⠀⠀⠀⠀⢠⡿⠁⠀⣾⣿⠃⢠⣿⢿⡿⠁⠸⢿⣿⣿⣿⣿⣿⣿⣿⣿⠸⣿",
				"⠀⠀⠀⠘⣧⣈⣷⡟⠀⠀⣰⠁⡼⢻⣿⣿⣿⣿⡿⠋⠀⠀⠂⠒⠒⠒⣾⠋⠀⢠⣿⡏⢠⣿⢃⡿⠁⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿",
				"⠀⠀⠀⠀⠈⠉⠁⠀⠀⢠⠇⣰⠁⠸⣹⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠐⡇⠀⠀⢸⣿⢃⣿⠋⣿⡀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⠀⡇",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣰⠃⡀⢀⣿⣿⡏⢘⣶⣶⣶⣷⣒⣄⠀⠀⠀⠀⠀⠸⣿⣾⠃⠰⠁⠙⢦⡀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⢠⡇",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⢁⠞⢁⣾⣿⣿⣷⠟⠁⣠⣾⣿⣿⣧⠀⠀⠀⠀⠀⠀⣿⡏⠀⠀⠀⠀⠀⠙⢦⡀⠀⢿⣿⣿⣿⣿⣿⣿⣸⠃",
				"⠀⠀⠀⠀⠀⠀⠀⣠⣾⡖⠁⣠⣾⣿⣿⣿⡏⠀⢰⠿⢿⣿⣯⣼⠁⠀⠀⠀⠀⠀⠹⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⢬⣿⣿⡘⣿⣿⣏⣿⠀",
				"⠀⠀⠀⠀⠀⣠⣾⢟⠋⣠⣾⣿⡿⠋⢿⣿⠀⠀⢼⠀⠀⢀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣙⣷⣴⣆⡀⠀⠀⠈⢿⣧⠸⣿⣿⣿⣿",
				"⠀⠀⢀⡤⠞⢋⣴⣯⣾⡿⠟⠋⠀⠀⢸⣿⡆⠀⠸⡀⠉⢉⡼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣶⣆⠀⠈⢿⣧⠹⣿⣿⣿",
				"⠀⠀⠀⣸⣶⣿⣿⠟⠋⠀⠀⠀⠀⣴⡎⠈⠻⡀⠈⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠿⠛⠛⠻⣿⣬⡏⠻⣷⡀⠈⢻⣿⣿⣿⣿",
				"⢂⣠⣴⣿⡿⢋⣼⣿⣿⣿⣿⣿⠋⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⡄⠀⠀⢀⡾⣿⠁⠀⢹⡇⠀⢠⣿⣿⣿⣿",
				"⣿⣿⣽⣯⣴⣿⣿⠿⡿⠟⠛⢻⡤⠚⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⠈⠉⢉⡴⠃⠀⠀⢸⠇⢠⣿⣿⣿⣿⣿",
				"⣿⡇⣿⠿⣯⡀⠀⠀⠈⣦⡴⠋⠀⠀⢀⠨⠓⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠷⠒⠋⠀⠀⠀⠀⠃⣴⣿⠿⣡⣿⠏⠀",
				"⠁⠀⠃⠀⠈⠳⣤⠴⡻⠋⠀⢀⡠⠊⠁⠀⠀⢀⡽⢄⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⠏⣺⠟⠁⠀⠀",
				"⠀⠀⠀⠀⠀⡰⠋⢰⠁⠀⠀⠀⠀⠀⣀⠤⠊⠁⠀⠀⢱⡀⠘⢆⡀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠖⠛⠛⢉⣤⠞⠁⠀⠀⠀⠀",
				"⠀⠀⠀⠀⡜⠁⠀⠈⢢⡀⠀⠀⠀⠀⠁⠀⠀⠀⣀⠔⠋⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡞⠉⠀⠀⠀⣀⠀⠀⠈",
				"⠀⠀⠀⡜⠀⠀⠀⠀⢰⠑⢄⠀⠀⠀⠀⠀⠀⠊⠀⢀⣀⢀⠇⠀⡠⠒⠒⢶⠈⠉⠑⡖⠈⠓⢢⠤⢄⣀⣴⣾⣏⠉⠛⠋⠉⠉⠀⠀⠀⢠",
				"⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠑⣄⡀⠀⠀⠀⠀⠀⠀⣹⡿⢤⣼⠃⠀⠀⢸⠀⠀⠀⡇⠀⠀⢸⠀⠀⠈⣿⣿⣿⣦⣀⣀⣀⣀⣀⣶⢶⣿",
				"⠀⠀⠀⠀⠀⣠⠔⠒⢻⠀⠀⠀⠃⠉⠒⠤⣀⡀⠤⠚⠁⣇⡰⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⠀⠀⣰⠟⠋⠁⠀⠀⠀⠀⠈⠉⠛⠦⡻",
				"⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⠹⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠀⠀⠈⠓⠤⣀⡀⠀⠀⠀⠀⠀⢀⣠⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠈⠉⠉⠉⠉⠉⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			},
			{
				"   ⠀⠰⠀⠀⢳⠀⠀⠀⢀⣠⠴⠚⠉⣁⡤⠖⣫⠟⠁⠄⡐⠠⠐⠠⡐⢀⢂⠐⠠⠉⠳⢤⡀⠂⠄⡉⠻⢶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀ ",
				"⠀⢀⠀⠀⠀⠀⠣⠀⠀⢣⡠⠖⠉⠠⠐⣈⡴⠋⡐⡜⢁⠐⡈⡐⠠⢁⠘⠠⠐⡀⠂⠌⠄⡑⠠⢂⠙⢮⡀⢁⠂⠄⡙⠻⣧⣄⠜⡆⠀⠀⠀⠀⠀⠀⠘⠠⢀⠀⣀⠠",
				"⠀⢀⠽⠀⠀⠀⠀⣱⠴⠉⡀⢂⠁⢢⡝⠡⢀⠡⠐⠠⢈⠐⠠⠄⡁⠂⠌⡐⠡⢀⠃⠌⡐⠠⢁⠂⠌⠠⠙⡔⢬⡐⢀⠂⡈⠹⣳⣄⠀⠀⠀⡖⡄⠀⠀⠀⠀⠈⠁⠀",
				"⠀⠀⠀⠀⠀⣠⠞⢁⠀⢂⠔⠂⡼⠋⡀⡁⢂⡗⢈⠐⠠⢁⠒⠠⢁⢸⠠⠠⢁⠂⠌⡐⠠⢁⠂⠌⣀⠃⠌⡘⢳⡌⢲⡠⢁⠂⡑⣟⣳⡄⢀⠇⠹⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⢀⡞⢁⠐⠠⡈⠄⠨⠐⠠⢁⡐⠀⡏⡐⠠⢈⡇⠂⠌⡐⢈⢸⢀⠁⡂⠌⡐⠠⢁⠂⠌⡐⠠⢈⠰⡄⡈⢷⠀⠙⢦⡐⠠⠈⢶⣛⣯⡠⠚⠁⠀⠀⠀⠀⠀⠀",
				"⠀⠀⡰⠣⠐⠠⡈⠔⠠⢈⠡⠌⣴⠠⠀⣽⠁⠄⠡⢘⡇⢈⠐⠠⡁⠸⡇⡐⢀⠒⠠⢁⠂⠌⡐⠈⢇⠄⢂⢸⠀⡘⣇⠌⡀⠑⢢⣅⡂⠑⣮⢷⡀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⡜⠡⠁⠌⡐⠠⠌⢰⡦⠐⣸⠇⠠⢁⡦⠁⠌⡐⢸⡇⠠⢈⠡⠠⢁⢣⠐⠂⠌⡐⠠⠌⡐⠠⢁⠚⡌⢀⠂⡇⠄⢻⡀⠤⠁⠌⠻⣵⢦⡘⡮⢽⡄⠀⠀⠀⠀⠀⠀",
				"⡜⠠⠁⠌⡐⠠⢁⢢⡟⢀⢸⣟⠠⠁⣾⡇⢈⠐⡀⢺⡇⠄⡁⢂⢁⠂⠄⡈⠔⠂⠄⡁⢂⠄⠡⠂⠌⡆⡐⠈⡇⡈⢼⡧⢀⠡⠌⡐⠈⢿⣞⠮⣧⢻⣆⠀⠀⠀⠀⠀",
				"⢀⠂⠡⠒⠠⢁⢂⣾⠁⠄⣾⡌⠠⢡⣎⡇⠄⠊⠄⣹⢿⡠⠐⠂⠄⢊⢰⠐⡈⢐⠈⡐⠠⢈⠄⡑⠠⡇⢠⠁⣇⠐⣸⡷⡀⠂⠔⠠⢁⠂⠻⣿⣔⡣⢟⣆⠀⠀⠀⠀",
				"⠠⢁⠂⠡⠒⠠⣼⡏⠐⢸⣿⠁⠂⢼⢹⡇⢈⠐⠂⠌⣿⣷⡀⢁⠊⠄⡘⡆⡐⢈⠐⠠⢁⠂⠰⢀⠡⡇⢂⢸⠀⠂⡏⠹⣇⠡⠈⠔⠂⠌⡐⢫⢷⡝⢮⣹⣄⣤⠀⠀",
				"⢀⠃⡈⠡⢈⣰⣟⠠⢈⣾⢣⠠⠁⡇⠘⢧⢀⠊⠌⡀⢿⡈⣷⡀⠌⡐⠠⢹⡀⠂⠌⡁⠂⠌⡁⠂⢄⠣⠀⡼⢀⢡⣃⠀⠈⢧⡈⠄⡁⠒⢠⠈⣗⣻⡧⢎⣽⠈⣳⣞",
				"⠠⢂⠐⡁⢂⡿⡞⠀⢸⢾⡆⠠⢩⠇⠀⢈⣧⡈⡐⢀⠚⣧⠈⢿⣄⠄⡁⠚⣧⡁⢂⠐⡁⠢⠐⡉⢠⠃⢬⠁⢂⣜⣈⡑⢄⠀⠳⡐⠠⢁⠂⠔⠸⣖⢻⣏⡼⣿⠃⠙",
				"⠐⠂⠌⡀⣟⣯⠅⠈⡾⡽⠀⠡⢸⡤⠊⢁⣀⣙⣶⣀⠌⠹⣆⠀⠻⢧⣀⣁⢚⣿⢦⣐⣠⣁⣢⠴⠾⣴⣾⣾⠾⡿⠿⣿⣿⣦⣄⠹⣅⠂⠌⡠⠁⣟⢎⢿⣔⣻⣷⣞",
				"⢈⠁⠢⢀⣿⣹⠀⢩⣗⡇⠌⣀⣳⣴⣿⣿⡿⠿⠿⣿⣟⠍⠁⠀⠀⠀⠀⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⡾⠋⢰⢩⠑⡓⣂⢍⠻⢿⣿⣷⡌⠐⠠⢁⢸⡎⡝⣷⢺⠉⠻",
				"⠠⢁⠂⣹⡟⡆⠠⡟⣼⢣⠐⠰⡿⠟⢉⠒⡠⢍⡑⢄⠉⠳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢌⠁⠈⣣⡑⢢⠎⡱⠈⠹⢿⣷⡁⠂⠌⡀⡟⡼⢹⣟⡇⣠",
				"⠠⢁⠂⣯⡷⡁⣼⡓⢾⡐⠈⢼⣱⢡⢃⢎⡑⢆⡩⠒⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠨⢍⢶⡹⣄⣊⠱⠩⡄⠈⠻⣷⡁⠂⠄⣛⡜⣣⢽⣿⣧",
				"⢀⠃⠄⣷⣏⢧⢧⣹⣿⠀⡉⢸⢰⠡⢎⢢⢝⣢⠡⢍⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢕⠁⠺⠵⠏⠀⠁⠃⢴⠀⠀⢹⣷⡌⠀⢷⡸⡱⢎⣿⣿",
				"⡄⠌⡐⣯⡷⢭⣒⣿⣿⡅⠄⣹⡆⢱⠜⠈⡶⡱⠊⠘⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠈⢲⠀⠀⠘⠹⣟⡄⣣⢳⡙⢮⡜⣿",
				"⡞⡤⢰⡛⣯⢖⣿⣿⣾⡇⠈⣽⢠⠃⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡽⡼⣡⢧⡹⢦⡹⣹",
				"⢧⡙⢶⡙⣧⠏⠆⠙⢻⡇⢁⡏⡛⠀⠤⠀⠐⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢷⡱⢎⡵⢣⢳⣹",
				"⢧⣙⠦⡝⣷⠀⢠⠀⢸⠃⠌⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡘⢧⡚⣥⢓⣾",
				"⡳⣌⢳⡹⢼⡗⡈⠀⢸⡁⢘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠐⠒⠀⠀⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢫⡝⢦⣙⢦⡿⢻",
				"⢳⡌⢧⡙⢦⢿⡹⣆⠀⡒⢨⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢏⣽⡹⢦⣹⠞⠀⠀",
				"⡦⡝⢮⡙⣎⢞⣳⡝⣄⡅⠠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠶⣩⢞⡸⣕⣷⠉⡄⢄⠣",
				"⠸⣽⢦⡹⡜⣎⠶⡹⢼⡇⠐⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⣮⣍⣳⡵⢾⡛⣽⢺⠰⣈⣦⣿",
				"⣧⣈⢽⡳⢷⣬⣳⣙⢎⣧⠈⣧⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⢴⡚⢿⡹⢭⡙⢦⣙⠦⣝⢺⣯⢿⣿⣿⣿",
				"⣿⣿⡟⡝⣎⠶⣩⢍⡏⢿⠀⢻⡝⣣⠳⡤⢤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢤⣲⢏⣿⢡⢿⡖⡹⢦⣙⢦⣋⠷⣌⡳⢎⡽⣿⣟⣿⣿⣿",
				"⣿⣿⢷⡛⣬⢳⡱⢎⡜⣻⡄⢺⣱⢣⡛⡼⣽⢆⡳⢎⣿⢭⡯⣝⡹⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣋⠶⣹⠮⣼⡓⢮⣿⡱⢣⠞⣦⡙⡞⡴⣙⠮⡜⣿⣿⣞⣿⣿",
				"⣿⣏⠶⣙⢦⢣⡝⢮⡜⣹⡇⢸⣥⢣⡝⣲⡟⣬⠳⣍⣯⡾⡱⢎⡝⠤⣇⡀⠀⠀⠀⠀⠀⠀⠀⠀⣘⠹⡧⢭⣗⢎⢿⡱⣚⣯⢇⡻⢴⡹⣜⡱⣍⢞⡱⢾⣿⣿⣾⢻",
				"⡟⣬⠳⣍⢎⡳⣜⢣⠞⣥⢻⠸⣦⠳⡜⣿⠱⣎⠳⣬⣷⣳⡽⢞⠀⠀⠀⠈⢁⡐⢀⠀⢀⢖⡀⡙⠀⠀⢹⠓⠾⢭⣞⣷⡥⣛⣯⡜⣣⠞⡴⢳⡜⢮⡱⢣⢿⣿⡽⣷",
			},
			{
				"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⢻⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣇⢿⡇⣯⢿⢿⣿⣿⣿⣿⣟⠕⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣟⠛⣀⣙⡘⠞⠎⢏⢿⣿⢟⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣴⣾⣿⣿⣿⣷⣮⣤⣤⡌⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿",
				"⣿⣿⣿⣿⣿⣿⣿⣿⣿⠹⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣬⣭⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿",
				"⡿⢛⡭⠶⠝⣻⠿⣿⡟⠇⠀⣰⠇⠀⠀⠀⠀⠀⠀⠀⣼⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿",
				"⡕⣵⣪⣽⣿⣯⡉⢼⣗⠀⢠⣿⠀⠀⢈⠀⠀⠀⠀⠀⡿⣟⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿",
				"⠀⠿⣿⣿⣿⣿⣿⡟⣿⠀⣿⣿⠀⠀⠘⠀⠀⠀⠀⢀⠄⠀⠃⠠⠄⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿",
				"⡂⠷⣥⣾⣥⣌⡹⠗⣏⠀⢻⣿⣇⠀⠀⠀⠀⠀⠀⣸⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡆⠀⠀⠀⠀⠀⠀⠀⢀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢊⢿⣿⣿⣿",
				"⣿⣷⣭⣍⣫⣭⣼⣿⣯⠀⠀⠟⠁⠀⠀⠀⠀⠀⢠⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢰⢻⠃⠀⠀⠀⠀⠀⠀⠀⢚⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠻⣿⣿",
				"⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⢀⣿⣟⢿⠀⠀⠀⠀⡆⢀⠀⠀⠀⣿⢸⠀⠀⠀⠀⠀⠀⢠⣾⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙",
				"⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⣼⣶⣿⣷⡄⠀⠀⢠⣷⣾⡀⠀⢸⣿⣸⠀⠀⠀⠀⠀⢠⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣿⣿⣿⣿⣿⣿⡿⢁⣴⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣦⣠⣾⣿⣿⣷⡸⣌⣿⣆⠀⠀⠀⠀⠜⣾⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣿⣿⣿⣿⣿⣿⠁⣾⠃⠀⠀⠀⠀⠀⠀⣌⡺⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠁⠁⠈⠉⠛⢿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣿⣿⣿⣿⣿⡏⠀⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⢰⣶⣶⡄⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣿⣿⣿⣿⣿⣧⠀⡏⠀⠀⠀⡀⠀⠀⠀⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⢻⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⣇⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡻⠇⠀⠀⠀⠀⠀⠀⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠘⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⣷⠀⠀⠀⠀⠹⣿⣿⣿⣿⣷⠀⠀⣀⣴⣦⣭⣟⣛⡿⠿⣿⣿⣿⣿⣷⣦⣄⡀⣀⣠⣶⣷⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⢸⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⢻⣧⠀⠀⠀⠀⢻⣿⣿⣿⣿⣧⢰⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣾⣷⣬⣿⣛⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣆⠀⠀⠀⠀⠀⠀⠀",
				"⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡠⠿⣦⠀⠀⠀⠀⠹⣿⣿⣿⣿⣧⠻⣿⣿⣿⣿⡿⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⢀⣿⠀⠀⠀⠀⠀⠀⠀",
				"⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⡿⢞⠷⣄⠀⠀⠀⠘⣿⣿⣿⣿⣷⣬⣩⣍⣩⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⡄⠀⣼⢿⡼⠃⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣿⣿⣿⣿⣿⣿⠟⣋⣭⣶⣿⢿⢃⣾⣿⣮⡳⣄⣀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠈⠀⠀⠀⠀⠀⣠⠞⠠⠾⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣿⣿⣿⠟⣫⣴⣾⣿⣿⣿⢣⢳⣿⣿⠿⣻⡿⢒⡩⠀⣠⠤⣠⠄⢨⡉⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣿⡟⣤⣿⣿⣿⣿⣿⣿⠃⣴⣿⢫⣵⠛⣥⣾⢫⣶⣾⣿⣾⣿⠀⢸⣿⣷⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣽⣶⢶⣿⣿⣿⣿⣿⣿⠋⢄⣫⡶⢟⣥⡾⢛⣵⣿⣿⣿⣿⣿⠏⣄⣾⣿⣿⣿⣿⣷⣶⣲⣤⣤⢄⣀⠠⠰⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⡿⡀⣿⣿⣿⣿⣿⢋⣴⣿⢏⣴⣿⢟⣴⣿⣿⣿⣿⣿⣿⠏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡇⠐⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣷⣷⣽⣿⡿⢋⣴⣿⢟⣵⣿⡟⠱⠿⠟⡛⠛⠛⠙⠛⠏⣤⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣴⡻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣿⣿⣟⣋⠁⠚⠙⠛⠁⠊⠓⠀⠒⠊⠒⠐⠂⠊⠀⠄⠙⠆⡀⢲⣤⣮⣥⣭⣭⣭⣬⣥⣬⣴⣶⣶⣶⣿⣿⡿⢊⡠⡀⠠⣤⡤⠄⠀⠀⠀⠤⠶⠋⢀⠴⠊⠀⠀⠀⠀⠀⢀⣈⣀⡀",
				"⣾⣿⡿⠃⢠⣀⣀⣀⣀⣀⣠⣤⡤⠤⠀⠐⢂⢄⠀⢀⠀⠂⣁⠰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣫⣾⣿⡿⣠⠂⠻⢿⣿⣿⣷⣶⣾⡿⠿⠿⠟⠓⣀⣠⣴⣾⣿⣿⣿⣿⣿",
				"⣿⣿⡇⠀⢸⣿⣿⣿⠿⠛⠋⠁⠀⠀⣀⣔⡥⡁⠀⠈⠁⠀⠙⣀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣛⣵⣾⣿⡿⢋⣼⣿⣿⣿⣶⣾⣭⣭⣟⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
				"⣿⣿⡆⠀⠀⡿⠋⠁⠀⠀⠠⢂⣴⣿⡿⣫⡞⠀⠀⣰⣇⠀⠀⠹⡞⢿⣿⣿⣿⣿⣿⡿⢟⣥⣾⣿⣿⣿⢟⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡿⢶⣌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
				"⣿⣿⡷⡀⠀⠐⠄⠠⠀⣠⠴⡟⠛⣉⣚⡟⠀⠀⠰⣽⣿⡀⠀⠀⠹⡌⠻⣿⠿⣋⣵⣾⣿⣿⣿⡿⢟⣵⣿⠿⠛⢯⣽⣽⣷⣶⣷⣾⣿⣿⣿⣿⣾⡎⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			},
		}

		-- Pick a random ASCII art from the list
		math.randomseed(os.time())
		local header = headers[math.random(#headers)]

		-- Set header
		dashboard.section.header.val = header

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			-- open wiki , by opening the ~/wiki/home.md
			dashboard.button("SPC w", "  > Open Wiki", "<cmd>edit ~/wiki/home.md<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
