Version 6 of Flexible Windows (for Glulx only) by Jon Ingold begins here.

"An extension for constructing multiple-window games, which can be created and destroyed during play."

Include Glulx Entry Points by Emily Short.

Before starting the virtual machine:
	do nothing. [Hack that, for complicated reasons, prevents character streams going to the wrong place at game startup under some conditions.]

Chapter 1 - Initialisations, windows and values

section - definitions of properties and values

A g-window is a kind of thing.
g-present property translates into I6 as "light".

Include (-

Constant g_present = light;
Constant drawing_rule = initial;

-).

A g-window can be g-present or g-unpresent. A g-window can be g-required or g-unrequired.

A g-window is g-unpresent. A g-window is g-unrequired.

A g-window-position is a kind of value. The g-window-positions are g-placenull, g-placeleft, g-placeright, g-placeabove and g-placebelow.

A g-window-type is a kind of value. The g-window-types are g-proportional, g-using-minimum and g-fixed-size.

A g-window-kind is a kind of value. The g-window-kinds are g-text-buffer, g-text-grid and g-graphics.

Section - assigning properties to g-windows

A g-window has a g-window-position called position.
A g-window has a g-window-kind called type.
A g-window has a g-window-type called scale method.
A g-window has a number called measurement.
A g-window has a number called minimum size.

A g-window has a g-window called direct parent.

The minimum size of a g-window is usually 0.
The measurement of a g-window is usually 40.

A g-window has a number called rock-value.
A g-window has a number called ref-number.
Rock-value property translates into I6 as "rock_value".
Ref-number property translates into I6 as "ref_number".

direct parent property translates into I6 as "direct_parent".

A g-window has a rule called drawing rule.  
The drawing rule of a g-window is usually the do-nothing rule.

Drawing rule translates into I6 as "drawing_rule".

This is the do-nothing rule: do nothing.

Include
(- with rock_value 0, ref_number 0, direct_parent 0, -) when defining a g-window.


When play begins (this is the allocate rocks rule):
	let cnt be 200;
	repeat with item running through g-windows
	begin;
		set item rock to cnt;
		increase cnt by 10;
		now the direct parent of item is the direct-parent of item;
	end repeat;
	set main-window ref;

To set main-window ref:
(- MainWinRef(); -).

Include
(-  
[ MainWinRef;
     (+main-window+).rock_value = GG_MAINWIN_ROCK; 
     (+main-window+).ref_number = gg_mainwin;
     give (+main-window+) g_present;
];
 -).

To set (g - a g-window) rock to (n - a number):
(-   {g}.rock_value = {n};
-)


Section - the main-window object, to spawn windows from

The main-window is a g-window.
The main-window is g-present. The main-window is g-required.
The position of the main-window is g-placebelow.

The rock-value of the main-window is 100.

To decide if rocks are currently unassigned: 
	if rock-value of main-window is 100, yes; no.

Section - spawning relations

Spawning relates various g-window to various g-windows.

The verb to spawn (he spawns, they spawn, he spawned, it is spawned, he is spawning) implies the spawning relation.

The verb to be the spawner of implies the spawning relation.

Ancestry relates a g-window (called X) to a g-window (called Y) when the number of steps via the spawning relation from X to Y is at least 0. The verb to be ancestral to implies the ancestry relation.

Descendency relates a g-window (called X) to a g-window (called Y) when the number of steps via the spawning relation from Y to X is at least zero. The verb to be descended from implies the descendency relation.

Definition: a g-window is paternal if it spawns something g-present.
Definition: a g-window is childless if it is not paternal.

To decide which g-window is the direct-parent of (g - a g-window):
	repeat with item running through g-windows
	begin;
		if item spawns g, decide on item;
	end repeat.

section - test spawning relations - not for release

Peeping is an action applying to one thing.

Understand "peep through [any g-window]" as peeping.

Carry out peeping (this is the peep rule):
	say "[noun]: spawns [a list of g-windows spawned by the noun]."; 
	say "ancestors: [a list of g-windows ancestral to noun].";
	say "descendants: [a list of g-windows descended from noun].";
	if noun is paternal, say "(currently paternal) ";
	otherwise say "(currently childless) ";
	if noun is g-present, say "(present) "; otherwise say "(missing) ";
	if noun is g-required, say "(required)."; otherwise say "(unneeded).";

tracing it to is an action applying to two things.

Understand "spawn [any g-window] to [any g-window]" as tracing it to.

Carry out tracing it to:
	say "no. =>: [number of steps via the spawning relation from noun to second noun].";
	say "no. <=: [number of steps via the spawning relation from second noun to noun].";

Chapter 2 - opening, closing and calibrating

Section - opening window chains
[ set opening flags for necessary parents, then call open window safely routine ]
[ which then calls back to the construct window routine given here ]

To open up (g - a g-window):
	if g is g-unpresent and the main-window is ancestral to g
	begin;
		now every g-window ancestral to g is g-required;
		calibrate windows;
	end if.

section - closing window chains
[ so set deletion flags for children too, then call delete window safely routine ]

To shut down (g - a g-window):
	if g is g-present and g is not the main-window
	begin;
		now every g-window descended from g is g-unrequired;
		calibrate windows;
	end if;

Section - calibrating the window set to match expectations

Definition: a g-window is a next-step if it is spawned by something g-present.

To calibrate windows:
[ open g-required ung-present windows. start with directly spawned windows.
  close g-unrequired g-present windows. start with childless! ]
	let h be a random g-unrequired g-present childless g-window;
	while h is a g-window
	begin;
		g-destroy h;
		let h be a random g-unrequired g-present childless g-window;
	end while;
	let g be a random next-step g-required g-unpresent g-window;
	while g is a g-window
	begin;
		g-make g;
		let g be a random next-step g-required g-unpresent g-window;
	end while;


Chapter - I6 and Glulx Calls

Section - i6 for making a window

Constructing something is an activity.

The pending g-window is a g-window that varies.

To g-make (g - a g-window):
	now g is g-present;
	change the pending g-window to g;
	begin the constructing activity with the pending g-window;
	let p1 be the pos-val for g of the position of g + method-val of the scale method of g;
	if the scale method of g is g-using-minimum, let p2 be the minimum size of g; 
	otherwise let p2 be the measurement of g;
	let p3 be the kind-val of the type of g;
	let p0 be the ref-number of the direct parent of g;	
	now the  ref-number of g is the reference created from p0 with p1 and p2 and p3 and rock value rock-value of g;
	end the constructing activity with the pending g-window;

To decide which number is the reference created from (p0 - a number) with (p1 - a number) and (p2 - a number) and (p3 - a number) and rock value (rock - a number):
(- (glk_window_open({p0},{p1}, {p2}, {p3}, {rock}))
-)

To decide which number is the pos-val for (g - a g-window) of (N - a g-window-position): (-  (GetPos({N}, {g})) -).
To decide which number is the method-val of (N - a g-window-type): (- (GetMethod({N})) -).
To decide which number is the kind-val of (N - a g-window-kind): (- (GetKind({N})) -).

Include (-

[ GetKind kind;
	switch(kind)
	{
		(+g-text-buffer+):	return wintype_textbuffer;
		(+g-text-grid+):		return wintype_textgrid;
		(+g-graphics+):		return wintype_graphics;
	}
];

[ GetMethod type;
	switch(type)
	{	
		(+g-proportional+): 	return winmethod_Proportional;
		default:		  	return winmethod_Fixed;	
	}
];

[ GetPos pos win;
	switch(pos)
	{
		(+g-placeabove+): return winmethod_Above;
		(+g-placebelow+): return winmethod_Below;
		(+g-placeleft+): return winmethod_Left;
		(+g-placeright+): return winmethod_Right;
	} 

];

-)

Section - i6 for destroying a window

To g-destroy (g - a g-window):
	now g is g-unpresent;
	delete ref-number of g;

To delete (N - a number):	(- glk_window_close({N}, 0); 	-)

section - identify glx rubbish

A glulx zeroing-reference rule (this is the default removing references rule):
	doll-up properties; 	[ rebuild I7 properties, if we need to. ]
	if rocks are currently unassigned, follow the allocate rocks rule;
	repeat with g running through g-windows begin;
		if g is not main-window
		begin;
			now the ref-number of g is zero;
			now g is g-unpresent;
		end if;
	end repeat;

To doll-up properties: (- CreatePropertyOffsets(); -)

Definition: a g-window is on-call if the rock-value of it is the current glulx rock.

A glulx resetting-windows rule (this is the default reobtaining references rule):
	let g be a random on-call g-window;
	if g is a g-window and the current glulx rock is not zero begin;
		now the ref-number of g is the current glulx rock-ref;
		now g is g-present;
	end if;
	
The first glulx object-updating rule:
	set main-window ref;
	follow the delete-unrequired rule;
	follow the create-required rule.

This is the delete-unrequired rule:
	while the number of g-unrequired g-present g-windows is not zero
	begin; 
		shut down a random g-unrequired g-present g-window;
	end while.

This is the create-required rule:
	while the number of g-required g-unpresent g-windows is not zero
	begin;
		open up a random g-required g-unpresent g-window;
	end while.

Section - updating the contents of the windows

A glulx arranging rule (this is the arranging all rule): 
	follow the refresh windows rule.

A glulx redrawing rule (this is the redrawing all rule):
	follow the refresh windows rule.

A glulx object-updating rule (this is the updating-after-undo all rule):
	follow the refresh windows rule.

This is the refresh windows rule:
	let old current be the current g-window;
	repeat with item running through g-present g-windows begin;
		change current g-window to the item;
		follow the drawing rule of the item;
	end repeat;
	if the old current is g-present
	begin;
		change current g-window to the old current;
		set focus to the current g-window;
	end if.

Section - Some useful little functions

To decide which number is the measure of (g - a g-window):
	if the position of g is at least g-placeabove, decide on the height of g;
	decide on the width of g.

To decide which number is the width of (g - a g-window):
(-  	WindowSize({g}, 0); 	-).

To decide which number is the height of (g - a g-window):
(-  	WindowSize({g}, 1); 	-).

Include (-  

[ WindowSize g  index result;
	if (g hasnt g_present) return 0;
	result = glk_window_get_size(g.ref_number, gg_arguments, gg_arguments+WORDSIZE);
            return  gg_arguments-->index;
];

-)

Chapter - the constructing activity

Section - fixing problems with window scaling 

Before constructing a g-window when the scale method of the pending g-window is g-using-minimum (this is the reset minimum rule): 
	now the scale method of the pending g-window is g-proportional; 

The reset minimum rule is listed before the use minimum size instead rule in the Before constructing rulebook.

Before constructing a g-window when the scale method of the pending g-window is g-proportional (this is the fix broken proportions rule):
	if the measurement of the pending g-window > 100 or the measurement of the pending g-window < 0, 
	now the scale method of the pending g-window is g-fixed-size;  

Before constructing a g-window when the position of the pending g-window is g-placenull (this is the tile automatically windows rule):
	if the position of the direct parent of the pending g-window is at least g-placeabove, now the position of the pending g-window is g-placeright; 
	otherwise now the position of the pending g-window is g-placeabove.

Before constructing a g-window when the scale method of the pending g-window is g-proportional  (this is the use minimum size instead rule):
	let p1 be 100 multiplied by the minimum size of the pending g-window;
[actually, this should be the size of the direct parent, shouldn't it? ]
	let p2 be the measurement of the pending g-window multiplied by width of the direct parent of the pending g-window;
	if p1 > p2, now the scale method of the pending g-window is g-using-minimum.
 
The first after constructing a g-window :
	if the ref-number of the pending g-window is zero, now the pending g-window is g-unpresent instead.

The last After constructing a g-window :
	if the pending g-window is g-present, follow the drawing rule of the pending g-window;



Chapter - Writing to different windows

Section - shifting and knowing where we are

The current g-window is a g-window that varies. The current g-window is the main-window.

To set/move/shift focus to (g - a g-window), clearing the window:
	if g is g-present 
	begin;
		now the current g-window is g;
		set cursor to ref-number of g;	
		if clearing the window, clear the current g-window;
	end if.

To set cursor to (N - a number):
(-   	glk_set_window({n}); 
-)

To clear the (g - a g-window):
(-	if ({g} has g_present) glk_window_clear({g}.ref_number);
-).

To return to main screen/window: set focus to main-window.

Section - setting the cursor

To position the cursor in (g - a g-window) at row (y - a number) column (x - a number):
(-	SetCursorTo({g}, {x}, {y}); 		-).

Include (-

[ SetCursorTo win row col;
	if (win has g_present)
		glk($002B, win.ref_number, row-1, col-1); ! window_move_cursor
];

-).

Section - background colours

Include Glulx Text Effects by Emily Short.

Table of Common Color Values (continued)
glulx color value		assigned number
g-placenullcol		0
g-darkgreen	25600
g-green		32768
g-lime		65280
g-midnightblue	1644912
g-steelblue	4620980
g-terracotta	11674146
g-navy		128
g-mediumblue	205
g-blue		255
g-indigo		4915330
g-cornflowerblue	6591981
g-mediumslateblue	8087790
g-maroon	8388608
g-red		16711680
g-deeppink	16716947
g-brown		9127187
g-darkviolet	9699539
g-khaki		12433259
g-silver		12632256
g-crimson	14423100
g-orangered	16729344
g-gold		16766720	
g-darkorange	16747520
g-lavender	16773365
g-yellow		16776960
g-pink		16761035

A g-window has a glulx color value called back-colour. The back-colour of a g-window is usually g-placenullcol.
Back-colour property translates into I6 as "back_colour".

Before constructing  when the type of the pending g-window is g-text-buffer (this is the set text-colours rule):
	set the background text-colour of the pending g-window; 

After constructing when the type of the pending g-window is g-text-buffer (this is the reset text-colours rule):
	reset the background text-colour of the pending g-window;

After constructing when the type of the pending g-window is g-graphics (this is the colour-graphics rule):
	set the background colour of the pending g-window;

To set the background text-colour of (g - a g-window):
(-	SetBTcol({g});	-).

To reset the background text-colour of (g - a g-window):
(-	if ({g} has g_present) glk_window_clear({g}.ref_number);
	ResetBTCol();
-)

To set the background colour of (g - a g-window):
(-	if ({g} has g_present) SetBCol({g}.ref_number, {g}.back_colour);	
-).

Include 
(- 

Constant glulx_colour_table = (+Table of Common color Values+);

[ ColVal c i max;
	max=TableRows(glulx_colour_table);
	for ( i=1:i<=max:i++ ) {
		if (TableLookUpEntry(glulx_colour_table, 1, i) ==  c) 
			return TableLookUpEntry(glulx_colour_table, 2, i);
	} 
];

[ ResetBTCol i;
  for (i = 0: i < style_NUMSTYLES : i++)
	glk_stylehint_clear(wintype_textbuffer, i, stylehint_backcolor);
];


[ SetBTCol gwin col i;
  col = gwin.back_colour;
  if (col == (+g-placenullcol+)) rfalse;
  col = ColVal(col);
  for (i = 0: i < style_NUMSTYLES : i++)
 	 glk_stylehint_set(wintype_Textbuffer, i, stylehint_BackColor, col);
];

[ SetBCol win col result;
	if (col ~= (+g-placenullcol+)) glk_window_set_background_color(win, ColVal(col));
	glk_window_clear(win);
];

-)


Include
(-
	[ InitGlkWindow winrock i col;
		switch(winrock){
			GG_MAINWIN_ROCK:	
				if ((+main-window+).back_colour ~=  (+g-placenullcol+))
				{ 	col = ColVal((+main-window+).back_colour);
					for (i = 0: i < style_NUMSTYLES : i++)
					glk_stylehint_set(wintype_TextBuffer, i, stylehint_BackColor, col);
					glk_window_clear((+main-window+).ref_number);
  glk_stylehint_set(wintype_TextBuffer, style_Emphasized, stylehint_Oblique, 1);
  glk_stylehint_set(wintype_TextBuffer, style_Emphasized, stylehint_weight, 0);

					rfalse;
				}
		}
		rfalse;

	];

-) after "Definitions.i6t".   		


section - bordered g-windows

A bordered g-window is a kind of g-window. A bordered g-window has a glulx color value called border-colour.
A bordered g-window has a number called border-measure. The border-measure of a bordered g-window is usually 3.

A g-border is a kind of g-window. 
The type of a g-border is always g-graphics. The scale method of a g-border is always g-fixed-size.

Every bordered g-window spawns four g-borders.

After constructing a bordered g-window (called the main-panel) (this is the place-borders rule):
	apply borders to main-panel;

To apply borders to (main-panel - a g-window):
	let border piece be g-placeleft;
	repeat with item running through g-borders spawned by the main-panel 
	begin;
		now the back-colour of the item is the border-colour of the main-panel;
		now the measurement of the item is the border-measure of the main-panel;
		now the position of the item is border piece;
		let the border piece be the g-window-position after border piece;
		now the item is g-required;
	end repeat.

When play begins when the main-window is a bordered g-window:
	apply borders to main-window;

Flexible Windows ends here.

---- DOCUMENTATION ----

	Chapter: Introduction

	Section: Overview

Flexible Windows allows the Glulx author to construct and fill a series of multiple windows, which can be created and destroyed safely during the course of play. Restarts and restores are all handled properly. Windows can be graphical, text-buffers (like the main window is) or text-grids (in which case, glk calls can be used to place characters anywhere within them).

Although Flexible Windows does not supply any rules for using graphical windows beyond the most basic, several can be found in Emily Short's Simple Graphical Window extension. The examples below demonstrate some ideas. However, Flexible Windows is not compatible with Simple Graphical Window.

Flexible Windows requires Glulx Entry Points by Emily Short.

	Chapter: Constructing a Layout

	Section: Concepts

All games start, by default, with a status bar along the top of the screen, and the main window below. Glulx windows are formed from the main window by carving off segments using either horizontal or vertical strokes, with each stroke creating one new window, from which further windows can be cut. This automatically creates a tree-structure for windows, with each new window being sliced from one that came before. The extension refers to this process as "spawning", and you set up your layout of windows by telling the game which window spawns which. 

These relationships - which window spawns which - must be inflexible throughout the game: although they may be multiple structures which the game can chop and change between, altering which window spawns which will likely cause UNDO and RESTORE commands to fail in strange ways. However, in practice this isn't too much of a restriction, as two windows with different names can easily be made to do the same things (see the section on Using the Windows, below).

One g-window object is created by default, though its properties are unimportant. It is called main-window, and its purpose is to spawn other windows.

	Section: Positioning windows

Each window is a thing of the kind g-window, which has several properties relating to its layout.

The position of each new window is specified using one of four positions, g-placeabove, g-placebelow, g-placeleft and g-placeright. Note, these indicate where the new window will be, rather than the direction of the slice taken.

So for example, to creating a banner between the main screen and the status, we would write

	The banner-window is a g-window. The main-window spawns the banner-window. The position of the banner-window is g-placeabove.

For a more complicated layout, akin to a standard email client, with folder list, contacts, preview and files windows, we would write

	The contacts-pane, folder-list and preview-window are g-windows. The main-window spawns the preview-window and the contacts-pane. The contacts-pane spawns the folder-list.

	The position of the preview-window is g-placebelow. The position of the contacts-pane is g-placeleft. The position of the folder-list is g-placeabove.

(Try sketching it out on a piece of paper.)

	Section: Sizing Windows

Once the rough positions of the windows has been decided, the next thing to allocate is their size. This can be done two ways, either by taking a proportional of the window being spawned from (so a 40% slice or a 15% slice), or taking a window of fixed size (in pixels for graphics windows, and in columns/rows for text windows). The proportion to take, or the width of a fixed size side-window (equivalently, the height of a top or bottom window) is set using the "measurement" property of the g-window. So we could write

	The scale method of the side-window is g-proportional. The measurement of the side-window is 25.

	The scale method of the banner-window is g-fixed-size. The measure of the banner-window is 30.

Finally, if we are using proportional windows, we can optionally set a "minimum size", which if the window gets below, it will take, rather than using the proportional scale.

	Section: Specifying Window Type

As mentioned above there are three types of Glulx window, selected by specifying the type of the g-window. The choices are g-text-buffer, g-text-grid and g-graphics. Essentially, a text-buffer is akin to the main window, a graphics screen cannot accept text but can render images, and a text-grid allows for flexible positioning of text characters.

Window type can be changed during the game, however, it will only take effect when the window is opened.

	Section: Defaults and Corrections

Opening a new window is an activity that gets called for the pending window. This activity is the "constructing something" activity, and it's used to set background colours, neatly arranged unpositioned new windows, and apply the minimum width rules. New rules can be written before and after this activity. These rules may refer to "the pending g-window"; note that before, this window will not yet be in existence on the screen but its properties can be changed, and after it should be present on the screen.

Should you want to make changes to the styles for the windows, this is also the place to do it (see the Glk spec for more information on this). During the before phase, set the stylehint you want. During the after phase, remove it again, so that it doesn't affect other newly created windows. (See background colour rules for an example of this). 

For example: windows containing hyperlinks need to be "hyperlink-activated" before each click. To do this, use the following phrases:
	
	After constructing the conversation-window:
		expect links in conversation-window.

	To expect links in (g - a g-window):
	(-	glk_request_hyperlink_event({g}.ref_number);
	-).

After constructing is a good entry point for this, as it's after the window has appeared but before anything's been drawn inside it. 

Then after a link has been handled, you'll need to call this phrase again to reset hyperlink-watching.

	Chapter: Using Windows
	
	Section: Overview

This extension provides little in the way of support for graphics windows or text-grid windows, both of which can display images and draw shapes in a full range of colours. Text-grids can also locate the cursor (so, say, could be used to make a pac-man game). A few useful phrases for text-buffer windows are supplied.

	Section: Opening Windows

	open up side-window
	open up banner-window

The only point to note is that the "open up" command will, if necessary, also open any sub-windows required to reach the window you've asked for. So if the side-window is a spawn of the banner-window, and the banner-window is currently not open, the "open up side-window" command will open both. As mentioned above, spawning order is not editable once the game has started, so if you need flexibility on this, you'll need to make multiple, identical-acting windows (see Window Rules, below).

When writing and drawing to windows we should be careful they exist, otherwise the game will crash strangely. You can check the existence of a window at any time by testing for the g-present property.

	if side-window is g-present...
	if side-window is g-unpresent...

Since a lot of I6 code comes along with Glulx windows, these attributes exist cleanly in I6 too, (note the underscore replacing the hyphen).

	if ((+side-window+) has g_present)...
	if ((+banner-window+) hasnt g_present)...

	Section: Closing Windows
	
	shut down side-window

The point above applies here, in reverse: shutting a window will also shut all sub-windows contained by it.

	Section: Window Rules

When a window is opened or redrawn, its "drawing rule" is called. This is a rule that should (ideally) be able to reconstruct entirely the contents of the window (otherwise, after an UNDO or a RESTORE, information will be lost). Rules for graphical drawing will want to use glk calls to place images - see Simple Graphical Window for examples. 

Text windows are supplied with three important phrases: one to move the focus to a different window, one to clear that window (if required), and one to shift the focus back. A drawing rule for a window designed to display the player's inventory would use all three, and take the following form:

	The drawing rule of the side-window is the display inventory in side-window rule.

	This is the display inventory in side-window rule:
		move focus to side-window, clearing the window;
		try taking inventory;
		return to main screen;

Any text window can be cleared at any time using

	clear main-window;
	clear side-window;

	Section: Locating the current window

Side windows taking inventories and such-like might want to be able to tell the usual game rules that they're the ones doing so. Throughout the game, the variable "current g-window" tells the game where the output is going. So

	Rule for printing the name of the old book while taking inventory and the current g-window is side-window:
		say "The Meteor, the Stone (etc.)" instead.

We can position the cursor in text-grid windows using the following phrase

	... position the cursor in side-window at row 2 column 1;

where row and column start from (1,1) in the top left.

	Section: Redrawing windows

We can redraw a specific window by saying

	follow the drawing rule of the side-window

though this should really be more careful that the side-window exists at present. Better yet is

	if side-window is g-present, follow the drawing rule of the side window

If we want to update all the sub-windows quickly, we can invoke the refresh window rule

	follow the refresh windows rule

which does just that, carefully, and without bothering windows that aren't there.

	Chapter: Special features

	Section: Overview

Note: these don't render well across the spectrum of Glulx interpreters.

	Section: Background Colour

Windows can have a back-colour, specified as one from the (reasonably large) Table of Common Color Values (based but extended from Glulx Text Effects, by Emily Short). The possible colours are:

	g-darkgreen, g-green, g-lime, g-midnightblue, g-steelblue, g-terracotta, g-navy, g-mediumblue, g-blue, g-indigo, g-cornflowerblue, g-mediumslateblue, g-maroon, g-red, g-deeppink, g-brown, g-darkviolet, g-khaki, g-silver, g-crimson, g-orangered, g-gold, g-darkorange,g-lavender, g-yellow, g-pink.

and they are assigned by including a line like so:

	The side-window has back-colour g-red.
	The main-window has back-colour g-darkgreen.

At present, colours in graphics windows are reasonably well-supported (and if not, are unlikely to do any harm). Background colours in text windows can cause a series of ugly effects; such as the colour only appearing behind printed characters, or the background colour copying itself into all other text windows. 

The main-window can be supplied a background colour in the same way.

	Section: Borders

A window can be defined as a "bordered g-window", and it will then be produced with a border of "border-measure" thickness and "border-colour" colour. (This is wastefully done; it actually places four thin windows around the window constructed, but harmlessly so). 

The main-window can be bordered too, by declaring that "the main-window is a bordered g-window". 


Example: * Inventory Window - A simple example showing how to place an side window displaying the player's inventory.

	*: "Inventory Window"

	The study is a room. In the study is an old oak desk. On the desk is a Parker pen, a letter, an envelope and twenty dollars.

	Include Flexible Windows by Jon Ingold.

	The side-window is a g-window spawned by the main-window.

The default setting for position - on the right - will do here, but the window could be smaller.

	*: The measurement of the side-window is 30.

	The drawing rule of the side-window is the construct inventory rule.

	This is the construct inventory rule:
		move focus to side-window, clearing the window;
		try taking inventory;
		return to main screen.

Finally, two rules: one to make the window appear, and the other to keep it up-to-date.

	*: When play begins:
		open up the side-window.

	Every turn when the side-window is g-present: follow the drawing rule of the side-window.

	Test me with "take pen/take letter/i/take all".

Example: ** Inventory Window and Picture - A more complex example, that also provides an image panel above the inventory.

	*: "Inventory Window and Picture"

	The study is a room. In the study is an old oak desk. On the desk is a Parker pen, a letter, an envelope and twenty dollars.

	Include Flexible Windows by Jon Ingold.

	The side-window is a g-window spawned by the main-window.

	The measurement of the side-window is 30.

	The drawing rule of the side-window is the construct inventory rule.

	This is the construct inventory rule:
		move focus to side-window, clearing the window;
		try taking inventory;
		return to main screen.

	The graphics-window is a g-window spawned by the side-window.

	When play begins:
		open up the graphics-window.

	Every turn when the side-window is g-present: follow the drawing rule of the side-window.

Up to this point the code is the same, except the "when play begins" rule. Note that we don't need to open the inventory window, since it will be called into being by the graphics window that it's spawned. 

	*: The type of the graphics-window is g-graphics.

	The drawing rule of the graphics-window is the draw scaled image rule.

This is enough to set up the graphics panel. Now let's give it some images.

	*: The current image is a figure-name that varies. The internally selected picture is a figure-name that varies.

	Figure 1 is the file "letter.jpg". Figure 2 is the file "scraps.jpg."

	Carry out examining the letter:
		depict Figure 1;

	Instead of attacking the letter:
		remove the letter from play;
		depict Figure 2;
		say "You tear the letter to shreds." instead.

	To depict (f - a figure-name):
		change the current image to f;
		follow the drawing rule of the graphics-window.

Finally, here's the rule and routines to actually get the picture to display.
	
	*: This is the draw scaled image rule: 
		change the internally selected picture to the current image;
		if graphics-window is g-unpresent, rule fails;
		clear the graphics-window;
		draw scaled copy of internally selected picture in graphics-window;

	To draw scaled copy of (f - a figure-name) in (g - a g-window):
	(-	DrawScaled({f}, {g}); -).

What follows is some I6 code for handling the glulx imagery.

	*: Include (-

	! Doing scaling calculations in I6 lets us handle bigger numbers

	[ GetImageSize curimg index result;
		if (curimg == 0) rfalse;
		result = glk_image_get_info( curimg, gg_arguments,  gg_arguments+WORDSIZE);
		return gg_arguments-->index;
	];

	[ DrawScaled figure g w_total h_total graph_height graph_width w_offset h_offset;
	graph_height = WindowSize(g, 1);
	graph_width = gg_arguments-->0;
	w_total = GetImageSize(figure, 0);
	h_total = gg_arguments-->1;

	if (graph_height - h_total < 0) !	if the image won't fit, find the scaling factor
	{
		w_total = (graph_height * w_total)/h_total;
		h_total = graph_height;

	}

	if (graph_width - w_total < 0)
	{
		h_total = (graph_width * h_total)/w_total;
		w_total = graph_width;
	}

	w_offset = (graph_width - w_total)/2; if (w_offset < 0) w_offset = 0;
	h_offset = (graph_height - h_total)/2; if (h_offset < 0) h_offset = 0;

	glk_image_draw_scaled(g.ref_number, figure, w_offset, h_offset, w_total, h_total); 
	];
	
	-).

	Test me with "examine letter/z/attack letter".
