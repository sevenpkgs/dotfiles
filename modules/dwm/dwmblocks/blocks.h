//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	//{" 󰕾 ", "amixer sget Master -q | amixer sget Master | tail -1 | grep -q 'off' && echo [muted] || amixer sget Master | tail -1 | awk '{print $5}'",	777,        5},
        
        {"  ", "sh ~/.dotfiles/modules/dwm/dwmblocks/wifi.sh",                   0,            2},
        {"", "sh ~/.dotfiles/modules/dwm/dwmblocks/vol.sh",	                777,            5},
	{"", "date '+%A, %B %d :: %I:%M %p ' | sed 's/\\([ap]\\)m/\\U\\1m/'",    60,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " :: ";
static unsigned int delimLen = 4;
