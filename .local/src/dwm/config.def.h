/* For Volume Keys */
#include <X11/XF86keysym.h>


/* appearance */
static const unsigned int borderpx = 2;   /* border pixel of windows */
static const unsigned int snap     = 32;  /* snap pixel */
static const unsigned int gappx    = 2;   /* pixel gap between clients */
static const int showbar           = 1;   /* 0 means no bar */
static const int topbar            = 1;   /* 0 means bottom bar */
static const int horizpadbar       = 0;   /* horizontal padding for statusbar */
static const int vertpadbar        = 0;   /* vertical padding for statusbar */
static const int vertpad            = 5;       /* vertical padding of bar */
static const int sidepad            = 5;       /* horizontal padding of bar */
static const char *fonts[]     = {"FiraCode Nerd Font:size=14:antialias=true:autohint=true",
                                  "Hack:size=8:antialias=true:autohint=true",
                                  "JoyPixels:size=10:antialias=true:autohint=true"
				 };

// Py-wal
#include "/home/devildev/.cache/wal/colors-wal-dwm.h"						     	

/* static const char col_1[]  = "#282c34"; /1* background color of bar *1/ */
/* static const char col_2[]  = "#282c34"; /1* border color unfocused windows *1/ */
/* static const char col_3[]  = "#d7d7d7"; */
/* static const char col_4[]  = "#924441"; /1* border color focused windows and tags *1/ */
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]        = {
 	/*               fg         bg         border   */
	[SchemeNorm] = { norm_fg,  norm_bg, norm_border },
	[SchemeSel]  = { sel_bg,   norm_bg,  sel_border },
};

/* bar opacity 
 * 0xff is no transparency.
 * 0xee adds wee bit of transparency.
 * 0xdd adds adds a bit more transparency.
 * Play with the value to get desired transparency.
 */
static const unsigned int baralpha    = 0xdd; 
static const unsigned int borderalpha = OPAQUE;
static const unsigned int alphas[][3] = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
/* static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }; */
// static const char *tags[] = { "", "", "", "", "", "", "", "", "" };
static const char *tags[] = { "", "", "", "", "" };

static const unsigned int ulinepad	= 7;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class        instance      title    tags mask     isfloating   monitor */
	{ "Gimp",         NULL,       NULL,       3,               1,           -1 },
	{ "firefox",      NULL,       NULL,       2,               0,           -1 },
	{ "st",           NULL,       NULL,       1,               0,           -1 },
	{ "Thunar",       NULL,       NULL,       4,               0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "layouts.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
        { "| 節 Tile |",      tile },    /* first entry is default */
	{ "| 﩯 Grid |",      grid },    /* Grid Layout */
	{ "|  Monocle |",      monocle },  /* Full Screen or Monocle */
        { "|  Float |",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(CHAIN,KEY,TAG) \
	{ MODKEY,                       CHAIN,    KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           CHAIN,    KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             CHAIN,    KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, CHAIN,    KEY,      toggletag,      {.ui = 1 << TAG} },
#define CMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* dmenu */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
/* If you are using the standard dmenu program, use the following. */
/* static const char *dmenucmd[]    = { "dmenu_run", "-i", NULL }; */
/* If you are using the dmenu-distrotube-git program, use the following for a cooler dmenu! */
static const char *dmenucmd[]    = { "dmenu_run", "-g", "4", "-l", "4", "-c", NULL };

/* the st terminal with fish */
static const char *termcmd[]     = { "st", "-e", "fish" };
/* Alacritty Terminal */
static const char *alacmd[]     = { "alacritty", "-e", "zsh" };
static const char *music[]     = { "st", "-e" "ncmpcpp" };
/* volume up and down */
static const char *upvol[]   = { "/usr/bin/pactl", "set-sink-volume", "0", "+5%",     NULL };
static const char *downvol[] = { "/usr/bin/pactl", "set-sink-volume", "0", "-5%",     NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute",   "0", "toggle",  NULL };
/* scratchpad */
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", NULL };

static Key keys[] = {
	/* modifier             chain key  key        function        argument */
	{ MODKEY,	        -1,        XK_p,     spawn,           {.v = dmenucmd } },
	{ MODKEY,	        -1,        XK_t,     spawn,           {.v = termcmd } },
	{ MODKEY,               -1,        XK_Return, spawn,          {.v = alacmd } },
	{ MODKEY,               -1,        XK_b,      togglebar,      {0} },
	{ MODKEY,               -1,       XK_grave,  togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY|ShiftMask,     -1,        XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,     -1,        XK_k,      rotatestack,    {.i = -1 } },
	{ MODKEY,               -1,        XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,               -1,        XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,               -1,        XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,               -1,        XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY|ControlMask,   -1,        XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ControlMask,   -1,        XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ControlMask,   -1,        XK_Return, zoom,           {0} },
	{ MODKEY,               -1,        XK_Tab,    view,           {0} },
	{ MODKEY,	        -1,        XK_q,      killclient,     {0} },

    /* Layout manipulation */
	{ MODKEY,               -1,        XK_Tab,    cyclelayout,    {.i = -1 } },
	{ MODKEY|ShiftMask,     -1,        XK_Tab,    cyclelayout,    {.i = +1 } },
	{ MODKEY,               -1,        XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,     -1,        XK_space,  togglefloating, {0} },

    /* Switch to specific layouts */
	{ MODKEY|ShiftMask,     -1,        XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,     -1,        XK_g,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,     -1,        XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,     -1,        XK_f,      setlayout,      {.v = &layouts[3]} },

	{ MODKEY,               -1,        XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,     -1,        XK_0,      tag,            {.ui = ~0 } },

    /* Switching between monitors */
	{ MODKEY,               -1,        XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,               -1,        XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,     -1,        XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,     -1,        XK_period, tagmon,         {.i = +1 } },
	
    /* Keybindings for programs using the format SUPER + ALT + "key" */
	{ MODKEY|Mod1Mask,      -1,        XK_b,      spawn,          CMD("firefox") },
	{ MODKEY|Mod1Mask,      -1,        XK_f,      spawn,          CMD("thunar") },
	{ MODKEY|Mod1Mask,      -1,        XK_m,      spawn,           { .v= music } },
	
    /* Dmenu scripts launched with emacs-style keychords SUPER + s followed by "key" */
	{ MODKEY,               XK_s,      XK_c,      spawn,          CMD("dmconf") },
	{ MODKEY,               XK_s,      XK_k,      spawn,          CMD("dmkill") },
	{ MODKEY,               XK_s,      XK_l,      spawn,          CMD("dmlogout") },
	{ MODKEY,               XK_s,      XK_e,      spawn,          CMD("dm-emoji") },
	{ MODKEY,               XK_s,      XK_m,      spawn,          CMD("dm-music") },
	{ MODKEY,               XK_s,      XK_u,      spawn,          CMD("dm-pacman") },
	{ MODKEY,               XK_s,      XK_s,      spawn,          CMD("dmsearch") },
	{ MODKEY,               XK_s,      XK_b,      spawn,          CMD("setwall") },
    
	TAGKEYS(                -1,        XK_1,                      0)
	TAGKEYS(                -1,        XK_2,                      1)
	TAGKEYS(                -1,        XK_3,                      2)
	TAGKEYS(                -1,        XK_4,                      3)
	TAGKEYS(                -1,        XK_5,                      4)
	TAGKEYS(                -1,        XK_6,                      5)
	TAGKEYS(                -1,        XK_7,                      6)
	TAGKEYS(                -1,        XK_8,                      7)
	TAGKEYS(                -1,        XK_9,                      8)
	{ MODKEY|ShiftMask,     -1,        XK_q,	  quit,      {0} },
        { MODKEY|ShiftMask,     -1,        XK_r,          quit,      {1} }, 
	/* For volume */
	{ MODKEY,                -1,       XK_F7,         spawn,  {.v = downvol } },
	{ MODKEY,                -1,       XK_F6,         spawn,  {.v = mutevol } },
	{ MODKEY,                -1,       XK_F8,         spawn,  {.v = upvol   } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click           event mask   button          function        argument */
	{ ClkLtSymbol,     0,           Button1,        setlayout,      {0} },
	{ ClkLtSymbol,     0,           Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,     0,           Button2,        zoom,           {0} },
	{ ClkStatusText,   0,           Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,    MODKEY,      Button1,        movemouse,      {0} },
	{ ClkClientWin,    MODKEY,      Button2,        togglefloating, {0} },
	{ ClkClientWin,    MODKEY,      Button3,        resizemouse,    {0} },
	{ ClkTagBar,       0,           Button1,        view,           {0} },
	{ ClkTagBar,       0,           Button3,        toggleview,     {0} },
	{ ClkTagBar,       MODKEY,      Button1,        tag,            {0} },
	{ ClkTagBar,       MODKEY,      Button3,        toggletag,      {0} },
};

