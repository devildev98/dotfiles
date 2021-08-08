//Modify this file to change what commands output to your statusbar, and recompile using the make command.

#define PATH(name)  "/home/devildev/.local/bin/sb/"name

static const Block blocks[] = {
       /*Icon*/	 /*Command*/	 /*Update Interval*/	/*Update Signal*/
	//{"",	PATH("sb-music"),	        0,                11},
	//{"",	PATH("sb-debpackages"),	0,	           8},
	//{"",	PATH("sb-forcast"),	        18000,	           5},
	//{"",	PATH("sb-nettraf"),	         1,               16},
	//{"",	PATH("sb-volume"),	 	 0,     	  10},
	//{"",	PATH("sb-battery"),	   	 5,	           3},
	{"",	PATH("sb-clock"),		60,		   1},
	//{"",	PATH("sb-internet"),		 5,	 	   4},
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = " | ";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
