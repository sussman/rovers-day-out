"Rover's Day Out" by Jack Welch and Ben Collins-Sussman
[###jack sez: Is the title too close to "A Bear's Night Out"?  An alternative title would be "Walkies for Rover"]

The story headline is "An Interactive Fiction".
The release number is 0.
The story genre is "Science Fiction".

Include Glulx Text Effects by Emily Short.
Include Basic Screen Effects by Emily Short.
Include Menus by Emily Short.
Include Case Management by Emily Short.

Use full-length room descriptions, no scoring, american dialect and the serial comma.

Book 1 Mechanics

Chapter Rules Modifications

[Supporters are explicitly responsible for mentioning their contents throughout the game. If things seem to be going missing for no good reason, keep this in mind:]
The describe what's on scenery supporters in room descriptions rule is not listed in any rulebook.

[Devices are responsible for giving their on/off status -- if desired -- as part of their description. There's only a few devices in the game, so not a biggie.]
The examine described devices rule is not listed in any rulebook.

Chapter Declare Global Variables

Current memory usage is a number that varies. Current memory usage is 508.
Malloc is a number that varies. Malloc is 500.
[Malloc takes a dive after the switch from Windex to Flosix.]

Enroute is a truth state that varies. Enroute is false. [en route is a flag that the character is going towards a destination, and prevents the "going" routine from objecting to the use of a compass direction. The flag is reset when the attempt to go occurs. TOCONSIDER: should this be an action variable a la example 196?]

Aware-references is a number that varies. Aware-references is 1.
[Tracks the number of times, up to 3, that the ACU has referred to objects by their aware-names. Used to switch between David/Janet comments]

Remember-invoked is a truth state that varies. Remember-invoked is false.
[tracks use of remember; used to trigger david/janet commentary]

David-remembered is a number that varies. David-remembered is 1.
[tracks whether an attempt has been made to remember david; used to trigger david/janet commentary]

Dream index is a number that varies. Dream index is 1.
[points to the next dream]

[Magpaper-related]
The IPL_pid, enamel_pid, ignite_pid, landing_pid, rover_pid, and epoch_pid are numbers that vary. The IPL_pid, enamel_pid, ignite_pid, landing_pid, rover_pid, and epoch_pid are zero.

[Ship orientation]
Roll, pitch, and yaw are numbers that vary. 
The roll is -60.
The yaw is 90.
The pitch is 30.

The last mentioned thing is a thing that varies.

Chapter Class Definitions

A prop is a kind of thing. It is usually portable. [If props can be carried out of their initial room, they should not be in the room description, but appear in the room contents list.]

A furniture is a kind of supporter. It is usually scenery and fixed in place. [In general, furniture descriptions should be integrated into room descriptions.]

A bed is a kind of furniture. It is usually enterable.

A refrigerator is a kind of container. A refrigerator is usually closed, openable, fixed in place, and scenery. Understand "fridge" as refrigerator. 

A sink is a kind of furniture. Sinks are privately-named. Understand "sink" and "faucet" and "knob" and "drain" as a sink.  

Wakefulness is a kind of value. The wakefulnesses are asleep, groggy, and alert.

Insightfulness is a kind of value. The insightfulnesses are self-aware and clueless.

[Continuity is a kind of value. The continuities are intact and broken.]

Everything has some text called aware-description.  Everything has some text called clueless-description. The aware-description of a thing is usually "".  The clueless-description of a thing is usually "".  The description of a thing is usually "[if the player is self-aware][aware-description][otherwise][clueless-description]". Everything has some text called aware-name. The aware-name of a thing is usually "". Everything has some text called clueless-name. The clueless-name of a thing is usually "". 

Everything has some text called scent. The scent of something is usually "". Every room has some text called scent. The scent of a room is usually "".

Rule for printing the name of the a thing (called the item):
	if the player is self-aware and the aware-name of the item is not "":
		say the aware-name of the item;
	otherwise:
		if the player is clueless and the clueless-name of the item is not "":
			say the clueless-name of the item;
		otherwise:
			say the printed name of the item;
			
An aware-proxy is a kind of thing. The aware-name of an aware-proxy is usually "#REF".  Aware-proxies are always privately-named.

A simroom is a kind of room.  A simroom has some text called aware-name.  The aware-name is usually "location". A simroom has some text called clueless-name. The clueless-name is usually "".  A simroom has some text called aware-description.  A simroom has some text called clueless-description.  The aware-description of a simroom is usually "".  The clueless-description of a simroom is usually "".  The description of a simroom is usually "[if the player is self-aware][aware-description][otherwise][clueless-description]".

An outside room is a kind of room. The description of an outside room is usually "You are outside.[inconsequential outside detail]". The printed name of an outside room is usually "The Park".

Satiety is a kind of value. The satieties are hungry, peckish, and stuffed.

A hole is a kind of container. A hole is always open, not openable and fixed in place.

A bowl is a kind of container. The carrying capacity of a bowl is one. 

Definition: a bowl is full if something is in it.

A message is a kind of prop. A message has some text called inscription. The inscription of a message is usually "".  [ben said: Props are portable by default.  Do we want this to be portable? Jack replied: I think so. I wasn't sure how many messages we would have in the game, and what they'd be. The message is the item that bears the inscription rather than the inscription itself. Most things I can think of that have writing on them (books, coins, birthday cards, etc.) are portable, so this seemed natural. If there is an inscription-bearing object that is not portable, we can always override it.]

forwards is a direction. The opposite of forwards is backwards.
backwards is a direction. The opposite of backwards is forwards.
leftwards is a direction. The opposite of leftwards is rightwards.
rightwards is a direction. The opposite of rightwards is leftwards.
clockwise is a direction. The opposite of clockwise is counterclockwise.
counterclockwise is a direction. The opposite of counterclockwise is clockwise.
 Understand "forward", "front", "down" as forwards. Understand "backward", "back", and "up" as backwards. Understand "left", "port" and "leftward" as leftwards. Understand "right", "starboard" and "rightward" as rightwards. Understand "widdershins", "withershins" and "anticlockwise" as counterclockwise.  [ben said:  how about "left" and "right"? Jack replied: Yes, I've added them. Leftwards and rightwards were originally left and right, so left/right were implicitly understood, but then I added "-wards" for consistency. We might need to add some disambiguation versus other left/right objects like arms.]

A direction can be built-in or custom. A direction is usually built-in. Forwards, backwards, leftwards, rightwards, clockwise and counterclockwise are custom.

[class-wise resettable properties:]
A person has an object called initial-enclosure. The initial-enclosure of a person is usually nothing.

A prop has an object called initial-enclosure. The initial-enclosure of a prop is usually nothing.

A container has a truth state called initial-overture. The initial-overture of a container is usually false.

A door has a truth state called initial-overture. The initial-overture of a door is usually false.

A device has an truth state called initial-onoff. The initial-onoff of a device is usually false.

A water is a kind of thing. Waters are privately-named. The indefinite article of a water is usually "some".

Section Chests and Lids

[borrowed more or less whole cloth from example 49 in the I7 documentation. Instead of keeping track of whether the lid is up or down, keep track of the open/close status of the chest.]

A chest is a kind of container. A chest is always openable. A chest is usually fixed in place. A chest is usually closed. The specification of a chest is "Represents a container with a separately implemented lid; the lid is itself a supporter."

A lid is a kind of supporter. A lid is part of every chest. Lids can be raisable. Lids are usually raisable. The specification of a lid is "A supporter attached to a chest, which can only support things when the chest is closed."

Before opening a lid which is part of a chest (called the item): 
	try opening the item instead.
Before closing a lid which is part of a chest (called the item): 
	try closing the item instead.
Before opening a chest when something is on the lid (called the obstruction) which is part of the noun: 
	repeat with item running through things on the obstruction: 
		say "(first removing [the item])"; 
		try taking the item.

Instead of opening a chest when something is on a lid (called the item) which is part of the noun: 
	say "You'd have to remove [the list of things on the item] from the lid first." instead.
	
Instead of looking under a lid which is part of a chest (called the item): 
    try opening the item.

Before inserting something into a lid which is part of a chest (called the item): 
	try inserting the noun into the item instead.
	
Before putting something on a chest when a lid (called the item) is part of the second noun: 
	try putting the noun on the item instead.
	
Instead of examining a closed chest when something is on a lid (called the top) which is part of the noun: 
	say "[The noun] is closed, and there [is-are a list of things on the top] on top."
	
[closely related is the flipchair:]

A flipchair is a kind of furniture. Flipchairs are enterable scenery. Flipchairs can be raisable. Flipchairs are usually raisable. Flipchairs can be open or closed. Flipchairs are usually open.


Chapter General Routines

[Text styles defined by Glulx]
Table of Common Color Values (continued)
glulx color value	assigned number
g-pure-blue	255

Table of User Styles (continued)
style name	justification	obliquity		indentation	first-line indentation		boldness		fixed width	relative size 	glulx color
special-style-1	left-justified	no-obliquity	0		0			light-weight	fixed-width-font	0		g-pure-blue


[Let's do a random walk, shall we?  :-) ]
Memory-updating is an action applying to nothing.
Carry out memory-updating:
	let memdelta be a random number from -25 to 25;
	now the current memory usage is the current memory usage plus memdelta;
	if current memory usage is greater than malloc + 140:
		now the current memory usage is malloc + 120;
	if current memory usage is less than malloc - 100:
		now the current memory usage is malloc. [ben said:  are we really conflating memory usage with cpu usage?  my inner computer scientist cringes.  :-) jack replied: Sometimes you grab a nice sounding variable name out of the air without really thinking about it. The first thing that occurred to me was "commit charge", but that's very microsofty.]

To say ACU Boot Banner:
	say "[bold type]Rover's Day Out[roman type]";
	say line break;
	say "An Interactive Fiction by Janet Xiang[if the Real Thing is happening] and David Venkatachalam[end if]";
	say line break;
	if First Sim is happening:
		let release be "beta 732";
		let serial be "23920401";
	otherwise if Second Sim is happening:
		let release be "beta810";
		let serial be "23920415";
	otherwise if Real Thing is happening:
		let release be "1";
		let serial be "23920416";
	otherwise:
		say "Boot banner error.";
	say "Release [release] / Serial number [serial] / Inform 10.6 build Mu-013 (I6/v.7.1 lib 7/18N)";
	say paragraph break.

[General routine for displaying dialogue between Janet and David.]
To say (dialogue - some text) in metaspeak:
	say line break; 
	say "[first custom style][dialogue]";
	say roman type;
	say variable letter spacing;
	say paragraph break;
	
BSODing is an action applying to nothing.
Carry out BSODing:
	say "*** STOP:  0x76A59BEE200198D2F99:  Fatal Exception.  Press a key to continue.";
	wait for any key;
	[###TODO:  how do we make the background blue in glulx?  my guess is to open a new blue window on "top" of existing window, of exactly the same size, and then kill the window to resume]
	clear the screen;
	say "[bold type]WINDEX[paragraph break]A fatal exception F1 has occurred at 0013AF3411BC:5D00193D39B4 in DLL 35A32492 in kernel ring beta. The current application will be terminated.[paragraph break]* Press any key to terminate the current application.[line break]* Press CTRL+ALT+DEL again to restart the ACU. You will lose all state information.  Sorry.[paragraph break]Press a key to continue.[roman type]";
	wait for any key;
	clear the screen.
	
[borrowed from example I7 documentation, example 424 Odins:]
After printing the name of something (called the target): 
    change the last mentioned thing to the target.

To say is-are: 
    if the last mentioned thing is plural-named, say "are"; 
    otherwise say "is".

To say it-they: 
    if the last mentioned thing is plural-named, say "they"; 
    otherwise say "it".

Chapter Verbs
	
Section Computer Humor

[ben said:  this is hilarious! Jack said: Thanks; feel free to add more as they occur to you.]

Before touching something (called the item):
	if the player is the acu and the player is self-aware:
		say "[aware-name of the item]: file timestamp updated.";
		
Before jumping:
	if the player is the acu and the player is self-aware:
		say "Branch instruction ignored. Instruction pointer unaffected.";
		rule succeeds.
		
Understand "ls" as looking when the player is self-aware.

Understand "grep [something]" as searching when the player is self-aware.

Understand "man" as asking for help when the player is self-aware.

Understand "cd [any room]" as going towards when the player is self-aware.

Whoing is an action applying to nothing. Understand "who" as whoing when the player is self-aware.

Carry out whoing:
	say "ACU        console        [right justify turn count minus epoch_pid][paragraph break]".
		
Section Reading
		
Understand the command "read" as something new. Reading is an action applying to one thing. Understand "read [some message]" as reading.

Check reading:
	If the player is rover:
		say "Dogs can't read." instead;
	otherwise:
		if the inscription of the noun is "":
			say "Nothing is printed on [the noun]." instead.
			
Carry out reading:
	say the inscription of the noun;
	say paragraph break.
	
Section Going Towards

Going towards is an action applying to one thing.

Understand "go [any room]" or "go to [any room]" or "go toward [any room]" or "go towards [any room]"  or "go [any person]" or "go to [any person]" or "go toward [any person]" or "go towards [any person]" as going towards.  

Check going towards:
	if the noun is a person:
		if the noun is the actor:		
			say "How much more here do you want to be?" instead;
		if the noun is in the location:
			say "[The noun] is already here." instead;
		otherwise:
			if the player is the ACU:
				say "You'd have to look for [the noun]." instead;
	if the noun is the location, say "You're already here." instead;
	if the player is the ACU and the noun is not in the Valkyrie, say "You're not ready to go out yet." instead.

Carry out going towards:
	let the way be the best route from the location to the location of the noun, using even locked doors;
	if the way is not a direction, say "You can't figure out how to get there." instead;
	let the destination be the room the way from the location; [ben said:  huh?  english grammar parse failure...Jack said: OK, I've replaced "the heading" with "the way" which seems to be the favorite word choice in the examples. Still sounds stilted.]
	now enroute is true;
	try going the way;
	if the player is not in the destination, rule fails.
	
Rule for reaching inside a room when the current action is going towards: 
    allow access.[necessary to allow the going towards rule to work on a person that is out of local scope; otherwise would throw a "you can't reach inside the kitchen" sort of error.]

Before going a direction (called the way):
	if enroute is true:
		now enroute is false;
		continue the action;
	if the way is up or the way is down:
		continue the action;
	if the way is custom:
		say "You move slightly [the way].";
		the rule succeeds;
	if the ACU is the player: 
		if the player is clueless:
			say "Compass directions? On Mars? The magnetic field here is too weak.";
		otherwise:
			say "That term is undefined in the present reference frame.";
	otherwise: [maybe safer to say 'if Rover is the player'?]
		say "Woof?";
	rule succeeds;

Instead of going towards when the player is in the living room and the futon is not folded:
	if the futon is not obstructed and (the First Sim is happening or the Second Sim is happening):
		now the futon is obstructed;
		if the First Sim is happening:	
			let metatext be "David: Isn't that a tad inconvenient?[line break]Janet: Yeah, but it kind of made sense when I got it.";
			say "[metatext in metaspeak] ";
		otherwise if the Second Sim is happening:
			let metatext be "Janet: Inconvenient, yes, but it does have its advantages.[line break]David: Agreed.";
			say "[metatext in metaspeak]";
	otherwise:
		say "You can't really move around much because of the futon. It takes up a lot of room.";

Section Folding and Unfolding

Folding is an action applying to one thing. Understand "fold [something]" as folding. Understand "fold up [something]" as folding. Understand "collapse [something]" as folding.  

Check folding:
	say "You can't fold [the noun]."
	
Instead of folding the futon:
	if the futon is folded:
		say "It's already as small as it gets.";
	otherwise if the futon encloses the player:
		say "That would be painful.";
	otherwise:
		now the futon is folded;
		say "With a little effort, the futon folds up, snug against the wall, leaving more room to walk around the cramped cottage."
	
Unfolding is an action applying to one thing. Understand "unfold [something]" as unfolding.  

Check unfolding:
	say "[The noun] is not something you can just go around unfolding."
	
Instead of unfolding the futon:
	if the futon is not folded:
		say "What?  Doesn't it already take up just about the entire living room?";
	otherwise:
		say "It's too early in the day to head back to bed."
		
Instead of pushing the futon:
	try folding the futon.
	
Instead of pulling the futon:
	try unfolding the futon.

Instead of folding or pushing the mattress:
	try folding the futon.
	
Instead of unfolding or pulling the mattress:
	try unfolding the futon.
	
Instead folding or pushing the frame:
	try folding the futon.
	
Instead of unfolding or pulling the frame:
	try unfolding the mattress. 	
	
Instead of taking the mattress:
	say "The mattress is molecularly bonded to the bed's frame. Besides, it would be awfully unwieldy to carry about."
	
Instead of taking the frame:
	say "The frame is an integral part of the futon."
	
Chapter General Insteads

Instead of examining a room:
	try looking;

Instead of examining something (called the item):
	if player is self-aware:
		if the aware-description of the item is not "":	
			say aware-description of the item;
			say line break;
			rule succeeds;
	continue the action;
	
Instead of looking:
	if player is self-aware:
		if the aware-description of the location is not "":	
			say aware-description of the location;
			say line break;
			rule succeeds;
	continue the action;
	
Instead of doing something when the player is clueless and the noun is an aware-proxy:
	say "You can't see any such thing.";
	if the Real Thing has not happened:
		if aware-references is less than 4:
			if aware-references is 1:
				let metatext be "David: How can it be aware of that?[line break]Janet: It can’t. That’s outside the simulation. I sometimes mumble to myself about whatever is on my mind from work. That must have carried over during the scan.[line break]David: Hmph.";
			otherwise if aware-references is 2:
				let metatext be "David: So that was another random association? It seemed pretty purposeful to me.[line break]Janet: With the cognitive constraints in place, it would have to be, although the synaptic scan might be somewhat confounded because I was working on the program when the scan was made.[line break]David: Kind of like a feedback loop?[line break]Janet: No, not at all.[line break]David: Hmph.";
			otherwise if aware-references is 3:
				let metatext be "Janet: Before you say it, yes. Nothing to do with the landing cycle, just another background musing.[line break]David: I was going to let that one slide without comment, actually.";
			say "[metatext in metaspeak]";
			now aware-references is aware-references + 1.
	
[ben said:  how do I trigger this next rule to test it?  When I reorient myself to self-aware, commands like 'x walls' and 'fold futon' work fine...? Jack replied: Since the ACU only accepts the non-aware dictionary words, you need to trigger the error by referring to items using one of their aware synonyms, e.g., 'x bulkheads' and 'x drive']
Instead of doing something when the player is self-aware and the noun is an aware-proxy:
	say "You can't see that here; but you vaguely [one of]recollect[or]remember[or]recall[at random] something [one of]called[or]termed[or]referred to as[at random] the [quotation mark][the clueless-name of the holder of the noun][quotation mark]."[I'd prefer to put "the" in the brackets, but it is not substituted properly here; just ignored.]
	
Instead of taking inventory when Rover is the player:
	if the player holds nothing:
		say "You haven’t picked up anything.";
	otherwise:
		say "In your mouth, you are carrying [a list of props held by Rover]."
		
Instead of smelling:
	if the noun is nothing:
		try smelling the location;
	otherwise:
		if the player is the ACU and the ACU is self-aware:
			say "Internal atmospheric analysis: 78% diatomic nitrogen, 21% diatomic oxygen, less than 1% carbon dioxide and trace gases, no particulate matter. Pressure 101.325 kPa.";[This is flight configuration, and should change after the ship is on the planet or if the ship is vented as a countermeasure against the pirates.]
			the rule succeeds;
		otherwise:
			if the noun is the player:
				say "You smell ";				
			otherwise if the noun is not a room:
				if the noun is a part of the player:
					say "Your [noun]";
				otherwise:
					say "[The noun]";
				say " smell[if the last mentioned thing is not plural-named]s[end if] ";
			otherwise:
				say "It smells ";
			if the scent of the noun is "":
				say "[one of]unremarkable[or]ordinary[or]not particularly interesting[at random]";
			otherwise:
				say the scent of the noun;
			if the noun is a room:
				say " here"; [add directional cues for Rover]
			say "."

Chapter Not Ready For Prime Time - Not for release

Section Reorienting

Reorienting is an action applying to nothing. Understand "reorient" as reorienting.

Carry out reorienting:
	if the player is self-aware:
		now the player is clueless;
	otherwise:
		if the player is Rover:
			say "Sorry, Rover is [italic type]always[roman type] clueless. [run paragraph on]";
		otherwise:
			now the player is self-aware.
		
Report reorienting:
	say "The player is now [if player is self-aware]self-aware[otherwise]clueless[end if].";
	
Instead of attacking the chain: [consider leaving something like this in the game]
	if the chain is intact:
		now the chain is broken;
		say "No doubt for legitimate purposes of testing rather than out of frustration, you break the chain with your brutish strength."
		
Section Possessing
		
Possessing is an action applying to nothing. Understand "possess" as possessing.

Carry out possessing:
	if the player is the ACU:
		now the player is Rover;
	otherwise:
		now the player is the ACU;
	say "POV switched: now that of [the player], who is [if the player is self-aware]self aware[otherwise]clueless[end if].[paragraph break]";
	try looking.
	
Section Resetting

Resetting is an action applying to nothing. Understand "reset" as resetting.

Carry out resetting:
	Restore the World;
	Setup the World.
	
Report resetting:
	say "World Reset!".
	
Chapter Initialize

When play begins:
	[recurrent setup]	
	Save the World;
	Setup the World;
	
After printing the banner text:
	say "Type [quotation mark]help[quotation mark] for instructions, credits and license or just blaze on impetuously.";
	say paragraph break;
	let metatext be "Janet: David, are you hooked in?[line break]David: Ready to go. Is this the final version of the ACU, or another beta?[line break]Janet: A program is never finished, but I think we're ready to go.[line break]David: I hope so, Earth could launch any day now.[line break]Janet: Run program.";
	say "[metatext in metaspeak]";
	say variable letter spacing;
	say paragraph break;
	wait for any key;
	clear the screen;
	[display setup]
	change the left hand status line to "[last-noun in upper case] -> [status-line-action] : [last-success]";
	change the right hand status line to "Memory: [current memory usage].[a random number from 0 to 9]PB";
	say "[ACU Boot Banner]";
	try dreaming;
	try beeping.
	
To Save the World: [programmatically store inital state of class properties]
	Repeat with selection running through persons:
		now the initial-enclosure of the selection is the holder of the selection;
	Repeat with selection running through props:
		now the initial-enclosure of the selection is the holder of the selection;
	Repeat with selection running through containers:
		if the selection is open:
			now the initial-overture of the selection is true;
		otherwise:
			now the initial-overture of the selection is false;
	Repeat with selection running through doors:
		if the selection is open:
			now the initial-overture of the selection is true;
		otherwise:
			now the initial-overture of the selection is false;
	Repeat with selection running through devices:
		if the selection is switched on:
			now the initial-onoff of the selection is true;
		otherwise:
			now the initial-onoff of the selection is false.
	
To Setup the World: [explictly set initial conditions]
[globals]
	now epoch_pid is the turn count;	
	now the time of day is 5:30 am;
	reset magpaper;
[persons]
	now the player is the ACU;
	now the ACU is dry;
	now the ACU is asleep;
	now Rover is hungry;
[ship orientation]
	reset the yoke;
[other obects with specific properties]
	now the alarm clock is on the futon;
	now the ACU wears the flight suit;
	now the flight suit is not already-doffed;
	now the soap button is not pressed;
	now the shampoo button is not pressed;
	now the futon is not obstructed;
	now the living is not visited-during-havoc;
	now the futon is not folded.

To Restore The World: [programmatically reset by class]
[reset all rooms visited]
	Repeat with selection running through rooms:
		now selection is not visited;
[reset all things handled]
	Repeat with selection running through things:
		now selection is not handled;
[reset containment of persons, props, and anything else not nailed down]
	Repeat with selection running through persons:
		move the selection to the initial-enclosure of the selection;
	Repeat with selection running through props:
		if the selection is not a part of the initial-enclosure of the selection:
			[otherwise the magpaper ends up *in* the fridge]
			move the selection to the initial-enclosure of the selection;
[reset the open/closed or on/off properties of containers, doors, and devices]
	Repeat with selection running through containers:	
		if the initial-overture of the selection is true:
			now the selection is open;
		otherwise:
			now the selection is closed;
	Repeat with selection running through doors:
		if the initial-overture of the selection is true:
			now the selection is open;
		otherwise:
			now the selection is closed;
	Repeat with selection running through devices:
		if the initial-onoff of the selection is true:
			now the selection is switched on;
		otherwise:
			now the selection is switched off.
			
To reset the yoke:
	now pitch is the new vector;
	now roll is the new vector;
	now yaw is the new vector;
	while pitch is 0 and roll is 0 and yaw is 0:
	[unlikely, but don't want the landing puzzle to be too easy]
		reset the yoke.
			
To decide what number is the new vector:
	decide on (a random number from 0 to 12) times 30 plus -180.


Chapter Teaching An Old Dog

Section Barking

Persuasion rule for asking an animal to try barking:
	persuasion succeeds.

Barking is an action applying to nothing. Understand "bark" as barking.

Check barking:
	if the player is not an animal:
		if the player is self-aware:
			say "Your byte is worse than your bark.";
		otherwise:
			say "Leave barking to the dogs." instead.
		
Carry out barking:
	say "[doggerel]".
	
Instead of an animal barking:
	say "[The actor] barks out a meaty, [doggerel]";
	if the actor encloses the delicious bone:
		now the delicious bone is in the holder of the actor;	
		say "The bone drops to [the actor]'s feet.";
	rule succeeds.
	
To say doggerel:
	say "[quotation mark][one of]Woof! Woof[or]Arf! Arf[or]Bow! Wow[or]Gaa....Ruffff[or]Gurrah[or]Rrrrrrrrrrrrrrrr[or]Yap! Yap[or]Buhwahwahwahwahwah[at random]![quotation mark][paragraph break]".

Section Attacking

Persuasion rule for asking an animal to try attacking:
	persuasion succeeds.
	
Instead of an animal attacking when Rover is enclosed by the Valkyrie Area:
	if the second noun is not David Venkatachalam:
		say "Rover's fur stands on edge and he growls momentarily, but then realizes that there is nothing threatening here.";
	otherwise:
		say "Rover stomps on David, coming down like a truckload of bricks.";
	rule succeeds.
	
Section Lying Down

Persuasion rule for asking an animal to try lying down:
	persuasion succeeds.

Lying down is an action applying to nothing. Understand "lie" or "lie down" as lying down.
		
check lying down:
	if the player is an animal:
		say "You're too excited to lie down! Woof!pos" instead;
	otherwise:
		say "[if player is clueless]You know that if you lie down this early in the morning you'll feel weird the entire day and that no amount of coffee in the afternoon with put things right again[otherwise]You rest for 0.0[a random number from 100 to 999][a random number from 100 to 999] femtoseconds. How [one of]refreshing[or]invigorating[or]energizing[or]exhilarating[or]stimulating[at random][end if]." instead.
			
carry out lying down:
	do nothing.
	
Instead of lying down when the player is the ACU and the player is not alert:
	say "Snooze the Alarm."
	[TODO: write a Snooze the Alarm routine]
	
Instead of an animal lying down:
	say "[The actor] dives towards the floor, holds the required position as briefly as he dares, and then jumps back on all fours in front of you, ready to play again.";
	rule succeeds.
	
Persuasion rule for asking an animal to try lying on:
	persuasion succeeds.
	
Lying on is an action applying to one thing. Understand "lie on [something]" or "lie down on [something]" or "lie in [something]" as Lying on.

check lying on:
	try lying down instead.
	
Instead of an animal lying on:
	say "[The actor] looks at [the noun] and wonders if this is some sort of trick. [if the noun is a bed]Dogs aren't allowed on people furniture, are they?[otherwise]That's not a good place for a dog to lie![end if]";
	rule succeeds.

Section Rolling Over

Section Digging

Section Coming

Persuasion rule for asking an animal to try coming:
	persuasion succeeds.

Coming is an action applying to nothing. Understand "come" or "come here" or "here boy" or "food" as coming.

check coming:
	if the player is Rover:
		say "You are already here." instead;
	
carry out coming:
	if Rover is in the location:
		say "Rover cocks his head quizzically.";
	otherwise:
		now Rover is in the location;
		say "Rover tears around the corner excitedly, arriving in [the location]."
		
Instead of Rover coming when Rover is not the player:
	[e.g., if Rover is in the room (and therefore scope) and you say "Rover, come" ]
	say "Rover scratches his ears and wonders to whom you are talking.";
	rule succeeds;

Section Giving Kisses

Section Going Walkies

Chapter The Valkyrie

[ben said:  why no janet proxy as well?  because presumably you'd be examining yourself?  we need something for 'x janet'. Jack said: the purpose of the David-proxy is to catch any mention of David by the ACU. During the first and second sim, David makes metaremarks the first few times his name is mentioned. The David-proxy is everywhere just to be sure that his name is in scope. When the ACU is clueless, "Janet" is understood as referring to the ACU itself, the word should always be in scope when appropriate. Later in the game, when the real Janet is present in the final scene, the ACU will be aware, and Janet will refer to the person.]

David-proxy is a backdrop. David-proxy is everywhere. The description of David-proxy is "x". David-proxy is privately-named. Understand "David" and "Venkatachalam" and "boss" and "director" as David-proxy. The aware-name of David-proxy is "Authority".

David-mentioned is a number that varies. David-mentioned is zero.

Instead of doing something when the noun is David-proxy:
	[ok as a general rule since david-proxy is hidden away after the simulations]
	now David-mentioned is David-mentioned plus one;
	say "Your boss isn't here.";
	if David-mentioned is one:
		let metatext be "David: Why would it expect to see me in your cottage?[line break]Janet: Probably a random association.[line break]David: Do you think the ACU can hear us talking?[line break]Janet: That’s a philosophical issue. It has sound sensors, and they might be on, but it’s all bits. Bits in, bits out. I don’t think you could say that it really hears us in any meaningful way.";
		say "[metatext in metaspeak]";
	otherwise if David-mentioned is two:
		let metatext be "David: Again, about me![line break]Janet: Whoa Nelly, let[apostrophe]s reign in that ego, cowboy. ";
		say "[metatext in metaspeak]";
	do nothing.
		
Section Living Room
 
The Valkyrie Area is a region.  The Living Room, The Kitchen, The Bathroom and The Shower are simrooms in the Valkyrie Area.

The living room is west of the kitchen, south of the bathroom, and east of the front door.  The living room contains the player. The living room can be visited-during-havoc. The living room is not visited-during-havoc.[Keeps track of whether the living room has been visited for the first time during the recurring "Cry Havoc" scene.]

Instead of going towards the living room:
	if the player carries the dog dish or the player carries the dog food or the player carries the white egg or the player carries the toothbrush or the player carries the floss dispenser:
		if the player carries the dog dish:		
			say "Rover can be a messy eater.  By force of habit you never bring the dog dish out of the kitchen, so you set it down.  [run paragraph on]";
			move the dog dish to the kitchen;
		if the player carries the dog food:
			say "[if the player is clueless]It took a lot of training to get Rover to eat it in the kitchen, so rather than walk out with a handful of dog food, you put it in his bowl as a good example[otherwise]Instead of contaminating the ship with thermoisotope, you put it into the fuel reservoir before switching out of engineering[end if]. [run paragraph on]";
			move the dog food to the food trough;
		if the player carries the white egg:	
			say "[if the player is clueless]Carrying a fragile egg around the cottage is surely asking for disaster. You lay it back in the frige before walking out of the kitchen[otherwise]You place the He-4 back into the cryochamber before returning to operations[end if].[run paragraph on]";
			move the white egg to the old fridge;
		if the player carries the toothbrush:
			say "[if the player is clueless]The last time you walked out of the bathroom with your toothbrush, you never found it again. You toss it on the counter[otherwise]The pit scrubber can only be activated from flight control, so you deaccess it[end if]. [run paragraph on]";
			move the toothbrush to the marble counter;
		if the player carries the floss dispenser:
			say "[if the player is clueless]The floss dispenser almost makes it out of the bathroom, but you remember to set it down before stepping back into the living room[otherwise]You disengage the object linker and reassign it to the flight console before transferring to operations[end if]. [run paragraph on]";
			move the floss dispenser to the marble counter;	
		say paragraph break; 
		try going towards the living room;
	otherwise if the player is wet:[###TODO This needs to be more general -- fails to catch a "go kitchen" if the player is in the bathroom. Consider pooling all of the "instead of going towards" rules and then winnowing down according to location]
		say "[if the player is clueless]You are still dripping wet! Before you drench the living room floor, it would make sense to dry off[otherwise]The ablative coating is applied but not polymerized. It requires UV irradiation to cure fully[end if].";
	otherwise:
		continue the action.

The walls are a backdrop.  They are in the living room and kitchen.  The walls are plural-named. Understand "wall" or "walls" as walls.  The aware-name of the walls is "bulkheads". The clueless-name of the walls is "walls". The clueless-description of the walls is "You painted the walls white a few months ago, but they've already taken on a slightly reddish hue thanks to the fine Martian dust in the air."  The aware-description of the walls is "Solid metal bulkheads, backed by tons of reinforcing composite alloy, line the interior of the cargo bay."  The walls-proxy is an aware-proxy that is part of the walls. Understand "bulkhead" and "bulkheads" as the walls-proxy.

The ceiling is a backdrop. It is in the living room and kitchen.  Understand "roof" or "stucco" as ceiling. The clueless-description of the ceiling is "The ceiling is an off-white stucco material designed to absorb sound." The aware-description of the ceiling is "The domed roof of the cargo bay, like the ceiling of a gothic cathedral, looms 35 meters above the floor." 

The clueless-name of the living room is "living room". The clueless-description of the living room is "[living room status]." The aware-name of the living room is "operations". The aware-description of the living room is "The Valkyrie's cargo bay is like a great, metal cave.  On one wall, the Casimir Drive intrudes slightly into the cargo area. From this section of the ship, there are connections to the engineering and flight control decks. The cargo bay doors are [if the front door is open]open[otherwise]closed." 

To say living room status:
	if the drapes are in the living room and the drapes are closed:
		say "Where the heavy drapes meet, a sliver of sunlight shines into the otherwise dark living room";
	otherwise:
		say "You are in the living room of a small cottage, actually more of a studio apartment. Light pours in through the room's single window [if the drapes are in Limbo]-- strangely, your drapes are nowhere to be seen [end if]. The principle furnishing is a king-size purple futon which takes up almost all the floor space. From the living room you can see the entrance to the kitchen and bathroom. The cottage's front door is [if the front door is open]open[otherwise]closed"

The futon is a bed in the living room. The futon can be folded. The futon is not folded. The futon can be functional. The futon is functional. The clueless-name of the futon is "purple futon".  The aware-name of the futon is "casimir drive". Understand "couch" or "bed" or "purple" as the futon. The aware-description of the futon is "The casimir drive system is [if the futon is folded]retracted[otherwise]extended[end if] and [if the futon is functional]intact[otherwise]damaged[end if].[if the alarm clock is on the futon] A temporal transgressor is nestled into its port." The clueless-description of the futon is "Your futon is huge, and oh so comfy. [if the Second Sim is happening]It is far too large to be practical in your minimalist living room, particularly when the futon is unfolded. [end if]The wooden frame supports a king-size mattress[if the futon is not folded] that is pulled out to form a bed[end if].[if the alarm clock is on the futon] An alarm clock is balanced precariously near the edge of the futon.".  The futon-proxy is an aware-proxy that is part of the futon. Understand "casimir" and "drive" as the futon-proxy. The futon can be discussed. The futon is not discussed. The futon can be obstructed. The futon is not obstructed. 

After examining the futon:
	if the futon is not discussed and the Second Sim is happening:
		now the futon is discussed;
		let metatext be "David: Maybe the problem isn’t that the futon is too big, but that the apartment is too small.[line break]Janet: No, the problem is the futon. If the futon were a cantaloupe of the same size, it would still be too large.[line break]David: I can’t argue that logic.[line break]Janet: That’s why you are management and why I do the computer programming.";
		say "[metatext in metaspeak]".

The mattress and frame are parts of the futon. The clueless-name of the mattress is "mattress". The aware-name of the mattress is "spatial manifold attenuator".The clueless-description of the mattress is "A thick, heavy purple mattress." The aware-description of the mattress is "The spatial manifold attenuator is [if the futon is folded]offline[otherwise]online[end if]." The mattress-proxy is an aware-proxy that is part of the mattress. Understand "spatial" and "manifold" and "attenuator" as the mattress-proxy.

Before opening the futon:
	try unfolding the futon;
	rule succeeds.
	
Before closing the futon:
	try folding the futon;
	rule succeeds.
	
The clueless-name of the frame is "bed frame". The clueless-description of the frame is "A wooden frame designed to some how fold up into a third of the space that it normally occupies when the bed is pulled out. A true feat of engineering and geometry." The aware-description of the frame is "The casimir drive extension strut is [if the futon is folded]contracted[otherwise]extended[end if]." The aware-name of the frame is "extension strut".  The frame-proxy is an aware-proxy that is part of the frame. Understand "extension" and "strut" as the frame-proxy.

On the futon is a woman called the ACU. The ACU is privately-named. The player is the ACU. She is wearing a flight suit. A left arm and a right arm, back, belly, body, teeth and giblets are parts of the ACU. 

The ACU has wakefulness. The ACU has insightfulness. The ACU is asleep. The ACU is clueless. The aware-name of the ACU is "ACU". The clueless-name of the ACU is "Janet". The ACU is proper-named. The clueless-description of the ACU is "You seem just like you have every other day of your life. [if the ACU wears the flight suit]You are wearing a blue flight suit[otherwise][paragraph break]By the way, it's not big deal because you're in your own cottage, but it's worth mentioning that you are completely naked[end if]." The aware-description of the ACU is "Your consciousness extends throughout the many systems that comprise the Valkyrie." The acu-proxy is an aware-proxy that is part of the acu. Understand "acu" as the acu-proxy. The ACU can be wet or dry. The ACU is dry.  Understand "Janet" as the ACU when the ACU is clueless.

To reset the ACU:
	now the ACU is dry;
	now the ACU is asleep.
	[###ben sez;  and wearing the flight suit too?  I realize you've got this happening elsewhere, but I'm a bit confounded by the way things are divided up among our global 'save world', 'reset world', etc.]

The clueless-name of the left arm is "left arm". The clueless-description of the left arm is "[if the player is the ACU]Your left arm. The one that you throw frisbees with[otherwise][the clueless-name of the ACU]'s left arm[end if]." The aware-name of the left arm is "laser gyro". The aware-description of the left arm is "The multiaxial ring laser gyroscope is buried deep in the ship's inertial reference system." The left arm-proxy is an aware-proxy that is part of the left arm. Understand "multiaxial" and "laser" and "ring" and "gyro" and "gyroscope" and "fiber" and "optic" and "optical" and "inertial" and "reference" and "system" as the left arm-proxy.

The clueless-name of the right arm is "right arm". The clueless-description of the right arm is "[if the player is the ACU]Your right arm. The one that you don't throw frisbees with[otherwise][the clueless-name of the ACU]'s right arm[end if]." The aware-name of the right arm is "tachyon sieve". The aware-description of the right arm is "The tachyon sieve feeds into the temporal transgressor." The right arm-proxy is an aware-proxy that is part of the right arm. Understand "tachyon" and "sieve" as the right arm-proxy.

The clueless-name of the back is "back". The clueless-description of the back is "[if the player is the ACU]Your[otherwise][the clueless-name of the ACU]'s [end if]back." The aware-name of the back is "dorsal hull". The aware-description of the back is "The dorsal hull." The back-proxy is an aware-proxy that is part of the back. Understand "dorsal" and "hull" as back-proxy.

The clueless-name of the belly is "belly". Understand "stomach" and "chest" as belly. The clueless-description of the belly is "[if the player is the ACU]Your[otherwise][the clueless-name of the ACU]'s [end if]belly." The aware-name of the belly is "heat shield". The aware-description of the belly is "The outer plating of the lower hull of the ship, which is thicker than the dorsal hull to better withstand the heat and pressure of an atmospheric landing." The belly-proxy is an aware-proxy that is part of the belly. Understand "ventral" and "plating" and "shield" as belly-proxy.

The clueless-name of the body is "body". The clueless-description of the body is "[if the player is the ACU]Your[otherwise][the clueless-name of the ACU]'s[end if] body. Nothing too special -- two arms, two legs, the usual really." The aware-name of the body is "superstructure". The aware-description of the body is "The superstructure of the Valkyrie, a network of metal and composite scaffolding built to withstand the stresses of interstellar flight and planetary landings." The body-proxy is an aware-proxy that is part of the body. Understand "superstructure" as body-proxy.

The clueless-name of the giblets is "parts". Understand "eye", "eyes", "ear", "ears", "nose",  "neck", "hair", "shoulder", "shoulders", "groin", "buttocks", "leg", "legs", and "tongue" as giblets. The clueless-description of the giblets is "Yet another part of [if the player is the ACU]your[otherwise][the clueless-name of the ACU]'s[end if] anatomy." The aware-name of the giblets is "subsystems". The aware-description of the parts is "Software and hardware components serving multiple functions." Understand "subsystem" and "component" and "hardware" and "software" as the body-proxy.

The clueless-name of teeth is "teeth". Understand "teeth" or "tooth" as teeth. Teeth are plural-named. The clueless-description of teeth is "Your pearly whites." The aware-name of teeth is "hull plating". The aware-description of the teeth is "The polyduramide surface of the hull plating". The teeth-proxy is an aware-proxy that is part of the teeth. Understand "polyduramide", "surface", "hull", and "plating" as the teeth-proxy.

[TOCONSIDER: implement hair]

Audio is a device which is part of the ACU. The aware-name of Audio is "Internal Microphones". Audio is switched off.

The flight suit is a wearable prop. The ACU wears the flight suit. Understand "flight" or "suit" or "flightsuit" or "jump suit" or "clothing" or "clothes" or "jumpsuit" as the flight suit.  The clueless-name of the flight suit is "flight suit". The aware-name of the flight suit is "ACU quantum isolator". The clueless-description of the flight suit is "[if the flight suit is worn]You are wearing[otherwise]It is[end if] a loose-fitting blue flight suit with a MARSpace insignia. Some letters are also sewn on the front." The aware-description of the flight suit is "The ACU is contained in a quantum-isolated housing which bears the insignia of MARSpace and an identification code." The flight suit-proxy is an aware-proxy that is part of the flight suit. Understand "quantum" and "isolator" as the flight suit-proxy. The flight suit can be already-doffed. The flight suit is not already-doffed.

Before wearing the flight suit when the player is wet:
	say "[if the player is clueless]Yuck. If you put the flight suit on right out of the shower, it would be damp all day (and you'd chaffe in all sorts of places that are best left unchaffed)[otherwise]If the enamel is not activated by UV irradiation, it will not harden into a protective coating[end if].";
	the rule succeeds.

After taking off the flight suit:
	say "You take off your blue flight suit and it ";
	if the player is on a supporter:
		say "bunches up in a crumpled heap on the [holder of the player]";
	otherwise:
		say "falls to [the location] floor";
	say ". You are naked.";
	if the flight suit is not already-doffed:
		now the flight suit is already-doffed;
		if the First Sim is happening:
			let metatext be "David: I don't think I should be seeing this. I mean, I'm your boss. There's that whole power dynamic thing.[line break]Janet: Don't worry: I'm not inclined to sue you for staring at a simulation.[line break]David: I'm not staring at the stimulation.[line break]Janet: You said stimulation. That's funny.[line break]David: No, I said simulation - and I'm not staring.[line break]Janet: Alright -- you're the boss.";
			say "[metatext in metaspeak]";
		if the Second Sim is happening:
			let metatext be "David: That mole should be on your left side.[line break]Janet: Good eye for detail -- I’ll flip the UV coordinates on the next run.";
			say "[metatext in metaspeak]".
		
[###TODO add verbs/synonyms to enable "get dressed/dress/dress up", "get undressed/strip/disrobe/etc.", ]

The lettering is a message that is part of the flight suit. Understand "lettering" and "letters" and "tag" and "identification" and "code" as the lettering. The clueless-name of the lettering is "lettering on the flight suit". The aware-name of the lettering is "127.0.0.1". The clueless-description of the lettering is "The letters on the flight suit are embroidered in white on a red background". The aware-description of the lettering is "A machine-readable identification code." The inscription of the lettering is "[if the player is clueless]There are only three letters: [quotation mark]ACU[quotation mark][otherwise]The code designates you as the Valkyrie's autonomous control unit[end if]."

After reading the lettering for the first time:
	let metatext be "David: If the ACU knows what you know, why doesn[apostrophe]t the ACU realize that it is the ACU? I mean, isn[apostrophe]t that what you would suspect if you woke up in a flight suit labeled ACU?[line break]Janet: Cognitive constraints are implemented – the willing suspension of disbelief is a programmatic imperative.[line break]David: I love it when you use big words![line break]Janet: You are a doofus, sir.";
	say "[metatext in metaspeak]".

The insignia is part of the flight suit. The clueless-description of the insignia is "The insignia depicts the planet Mars. A stylized rocket ship that looks like it came from the pages of a ancient pulp novel points away from the ship, and its exhaust plume encircles the planet. The symbol evokes the spear and sword of Ares, the symbol of Mars back to alchemical times." To say the aware-description of the insignia: say the clueless-description of the insignia. The aware-name of the insignia is "insignia". The clueless-name of the insignia is "insignia".

The alarm clock is furniture on the futon.  The clueless-name of the alarm clock is "alarm clock". The clueless-description of the alarm clock is "It[apostrophe]s a cheap, white plastic alarm clock with bright green LEDs that read [time of day].  A large button juts out of the top.". A large button and a switch are part of the alarm clock. The aware-name of the alarm clock is "temporal transgressor". The aware-description of the alarm clock is "The casimir drive's temporal transgressor glows green as usual.  A basic toggle is on top." The alarm clock-proxy is an aware-proxy that is part of the alarm clock. Understand "temporal" and "transgressor" as the alarm clock-proxy.  

The clueless-name of the large button is "large button". Understand "snoo" or "snooze" as the large button. The aware-name of the button is "mf toggle".  The clueless-description of the large button is "Mounted almost flush with the top of the clock, you can barely make out the word [quotation mark]snoo[quotation mark]."  The aware-description of the large button is "Mounted on top of the temporal transgressor is a slightly worn magno-fluctuator toggle." The large button-proxy is an aware-proxy that is part of the large button. Understand "mf" and "magno-fluctuator" and "toggle" as the large button-proxy.

After examining the alarm clock for the second time:
	let metatext be "David:  Why is it so interested in the clock?[line break]Janet:  Not sure.";
	say "[metatext in metaspeak]";

Some drapes are furniture in the living room. Understand "curtains" or "curtain" as the drapes. The drapes can be open. The drapes are closed. The clueless-name of the drapes is "drapes". The aware-name of the drapes is "solar shield". The clueless-description of the drapes is "The heavy brown drapes are [if open]open[otherwise]closed[end if]. [if open]Light pours in.[otherwise]The room is dark."[no aware-description is given since the drapes are missing in that part of the story]

Instead of opening the drapes:
	if the futon encloses the player:
		say "You'll need to stand up first."; [### perhaps better handled by limiting the scope to the futon and things on it -- prevents the player from opening
		  the front door, touching the floor, etc.]
		rule succeeds;
	otherwise:
		say "You push aside the drapes.";
		now the drapes are open;
		now the window is in the living room;
		say "[line break][the description of the living room][line break]";

Instead of closing the drapes:
	if the drapes are open:
		say "It would be too dark to move around if you close the drapes and you’d risk falling back to sleep. You reconsider and leave the drapes open.";
	otherwise:
		say "They are as closed as they're going to get."
		
Instead of examining when the player is in the living room and the drapes are closed:
	if the noun is the player or the noun is the futon, or the noun is the mattress, or the noun is the frame, or the noun is the drapes or the noun is the flight suit:
		continue the action;
	otherwise:
		say "[one of]Darkness is great for sleeping, not so good for looking at stuff[or]A sliver of sunlight only goes so far; you can't see that well in the dim light[or]With the drapes closed, you can't see very well[or]It's too dark to see much[stopping].";
	
Instead of going towards when the player is in the living room and the drapes are closed:
	say "It's too dark to move around much[one of]. Grues and all that, you know[or][stopping]." [ben said:  this is too cute to be a 1 in 20.  Maybe just use 'the first time'?  We want judges to see it.  Jack replied: OK, had originally considered this a low-frequency easter egg, but agree that if it is never seen, the value is somewhat lost -- made it a one-shot.]

The living room floor is privately-named scenery in the living room. Understand "floor" and "hardwood" as the living room floor. The clueless-name of the living room floor is "living room floor". The aware-name of the living room floor is "cargo bay floor". The clueless-description of the living room floor is "A hardwood floor." The aware-description of the living room floor is "The cargo bay's high-friction floor has been scratched and scuffed by Rover's tractors." The cargo bay floor-proxy is an aware-proxy that is part of the living room floor. Understand "cargo" and "bay" and "floor" as the cargo bay floor-proxy.

The front door is east of the front yard. It is a door and scenery. The clueless-name of the front door is "front door". The aware-name of the front door is "cargo bay door". The aware-description of the front door is "The massive titanium cargo bay door are [if closed]hermetically sealed against the harsh external environment[otherwise]wide open, exposing the cargo bay to the hellish maelstrom outside the ship[end if]." The clueless-description of the front door is "[front door status].". The front door-proxy is an aware-proxy that is part of the front door. Understand "cargo" and "bay" and "door" as the front door-proxy.

To say front door status:
	say "The front door of the cottage is ";
	if the front door is closed: 
		say "closed";
	otherwise:
		say "open. ";
		if the player is in the front yard:
			say "You can see light from inside the house, and the smell of home wafts out the front door";
		otherwise:
			say "Outside, it looks like a nice day".  
			
Instead of opening the front door when the front door is closed:
	if the landing_pid is not zero:
		if the player is clueless:
			say "[one of]You open the front door, confident that Rover will walk about the park and then return. Rover hears the door open and is out in a flash[or]Rover wiggles his butt through the door before you have it even half-way open, his tail slapping back and forth against the gate as it disappears[or]Rover slips out the door[at random].";
		otherwise: [aware]
			say "[one of]The ROVER deploys to the planet surface through the cargo bay doors[or]ROVER spins his tractors in anticipation and then jets out the cargo bay doors into the swirling mist outside the ship[or]ROVER oscillates his aft sensor array at high frequency and rolls down the cargo ramp, disappearing into the sand storm[at random].";
		if the Real Thing is happening:
			move Rover to the Front Yard;
		now the front door is open;
	otherwise:
		say "[if the player is clueless]If you open the front door, Rover will get all excited and expect to go walkies. Better get your morning routine out of the way first[otherwise]ROVER release is not the current task[end if]."
		
Rover is a male animal in the Living Room. Rover has satiety. Rover is hungry.  Rover has insightfulness. Rover is clueless. The doggie bits are a privately-named part of Rover. 

The clueless-name of Rover is "Rover". The aware-name of Rover is "ROVER". The clueless-description of Rover is "[if the player is the ACU]He's a big, happy dalmation[otherwise]You're a big dog with white fur and dark spots. You smell clean[end if]."  The aware-description of Rover is "Rover is a 45 metric ton mobile mining rig designed to operate under harsh off-world conditions.[if rover has the space probe] He is chewing a piece of the Musashi-5 space probe[end if]." The rover-proxy is an aware-proxy that is part of rover. Understand "robot" and "tractor" and "mining" and "rig" as the rover-proxy.

Understand "ear" and "ears" and "nose" and "neck" and "back" and "stomach" and "tummy" and "belly" and "paw" and "paws" as doggie bits. The clueless-name of the doggie bits is "Rover". The aware-name of doggie bits is "rover subsystems". The clueless-description of doggie bits is "Rover is covered from nose to tail with white fur dotted with black splotches." The aware-description of the doggie bits is "A complicated-looking mechanical subsystem bolted to the ROVER platform." The doggie bits-proxy is an aware-proxy that is part of the doggie bits. Understand "subsystem" and "mechanical" and "complicated" as the doggie bits-proxy.

Section Kitchen

The Kitchen is a room. The clueless-name of the kitchen is "kitchen". The aware-name of the kitchen is "engineering".  The clueless-description of the kitchen is "[if the kitchen is unvisited]You walk from the tiny living room to the adjoining kitchen, which is an even tighter squeeze. [paragraph break][end if]The kitchen is small but functional, with a space-saver refrigerator and a glass-top electric range. There is a drawer under the range. On the opposite wall there is a sink and under it, a storage cabinet. In a corner where it won't get kicked accidentally, there is a dog dish on the floor."  The aware-description of the kitchen is "Swaths of engineering controls -- both holographic and physical -- cover the humming consoles which line the boundaries of this alcove.".

After going towards the kitchen:
	if the counter is not discussed and the Second Sim is happening:
		now the counter is discussed;
		let metatext be "David: Where are your coffee machine and toaster?[line break]Janet: I mapped the ship functions to the minimum number of objects. More objects means more ways for things to go wrong and more time debugging. Call me lazy.[line break]David: Lazy.[line break]Janet: You don’t know the crazy things that the ACU does! Sometimes it walks around trying to eat or take everything in sight. Sometimes it sings and jumps around. It’s based on my neural bindings, but the ACU definitely has a mind of its own, and I don’t want to have to worry about what it might try do with a toaster.";
		say "[metatext in metaspeak]".

The old fridge is a refrigerator in the kitchen. Understand "refrigerator" as the old fridge.  The aware-name of the old fridge is "cryochamber".  The clueless-name of the old fridge is "old fridge". The clueless-description of the old fridge is "The small refrigerator dates back to the international era, but is still in good working order, if somewhat small by today's standards. The glossy, white enameled unit has a single compartment. A strip of yellow magpaper is attached to the refrigerator door." The aware-description of the old fridge is "A state-of-the-art cryochamber designed to house heavy helium. The unit is [if closed]closed[otherwise]open, chilling the air around it[end if]." The old fridge-proxy is an aware-proxy which is part of the old fridge. Understand "cryo" and "unit" and "cryochamber" as the old fridge-proxy.

Instead of searching a refrigerator (called R):
	if the player is clueless:
		say "You poke around in the fridge and find [a list of things in R][if nothing is in R] at all[end if].";
	otherwise:
		say "The cryo unit contains [a list of things in R][if nothing is in R] but the super-chilled interior of the cryo unit itself[end if]."

The magpaper is message which is part of the the old fridge. Understand "note" and "post-it" and "sticky" and "paper" and "list" as magpaper.  The clueless-name of the magpaper is "magpaper to-do list". The aware-name of the magpaper is "task manager".  The clueless-description of the magpaper is "It is a to-do list, in your own writing."  The aware-description of the magpaper is "It is a list of jobs in your priority queue." The magpaper-proxy is an aware-proxy which is part of the magpaper. Understand "job" and "jobs" and "list" and "queue" and "priority" and "task" and "manager" as the magpaper-proxy.  The inscription of the magpaper is "[if the player is clueless][magpaper-clueless][otherwise][magpaper-aware]." 

To reset magpaper:
	Now the IPL_pid is zero;
	Now the enamel_pid is zero;
	Now the ignite_pid is zero;
	Now the landing_pid is zero;
	Now the rover_pid is zero.

To say magpaper-clueless:
	say "Morning:[line break]X. Get up[line break][if enamel_pid is zero]2[otherwise]X[end if]. Shower[line break][if ignite_pid is zero]3[otherwise]X[end if]. Breakfast[line break][if landing_pid is zero]4[otherwise]X[end if]. Take care of business[line break][if the rover_pid is zero]5[otherwise]X[end if]. Let Rover go walkies";
		
To say magpaper-aware:
	say "[fixed letter spacing]PID     TTY          STATUS    CMD[line break][if IPL_pid is zero]-----[otherwise][right justify IPL_pid minus epoch_pid][end if]   ttys000      [doneness of IPL_pid]Initial Program Load [line break][if enamel_pid is zero]-----[otherwise][right justify enamel_pid minus epoch_pid][end if]	  ttys000      [doneness of enamel_pid]Apply Ablative Enamel [line break][if ignite_pid is zero]-----[otherwise][right justify ignite_pid minus epoch_pid][end if]   ttys000      [doneness of ignite_pid]Ignite Fusion Reactor [line break][if landing_pid is zero]-----[otherwise][right justify landing_pid minus epoch_pid][end if]   ttys000      [doneness of landing_pid]Landing Sequence [line break][if rover_pid is zero]-----[otherwise][right justify rover_pid minus epoch_pid][end if]	  ttys000      [doneness of rover_pid]Send Probe Data[variable letter spacing]".
	
To say doneness of (process - a number):
	if process is zero:
		say "Pending.  ";
	otherwise:
		say "Done.     ".
		
To say right justify (process - a number):
	if process is less than 10:
		say "0000";
	else if process is less than 100:
		say "000";
	else if process is less than 1000:
		say "00";
	else if the process is less than 10000:
		say "0";
	say process.

Instead of taking the magpaper:
	if the player is clueless:
		say "If you moved the 'to do' list, you'd need another note to remind you where you put the list. Better to just leave it there.";
	otherwise:
		say "The task list cannot be relocated; it has a fixed address in system priority memory."

After reading the magpaper for the first time:
	let metatext be "David: 'Take care of business'? Is that a euphemism?[line break]Janet: Yes. I had a heck of a time mapping the landing sequence to my daily routine.";
	say "[metatext in metaspeak]".

After examining the old fridge for the first time:
	let metatext be "David: Isn't a 'to-do' list a little heavy handed?[line break]Janet: Sure, but stuff has to happen in a certain order, and it's just more efficient this way.[line break]David: I think it would be better if it were less linear and more rule-based.[line break]Janet: Okay, mister critic, then you write the code. If we want to recover that probe before Earth gets to it, we are on a very tight development and testing schedule.";
	say "[metatext in metaspeak]";

The white egg is an edible prop in the old fridge. Understand "neoegg" as the white egg. The white egg can be raw or cooked. The white egg is raw. The white egg can be broken or intact. The white egg is intact. The clueless-name of the white egg is "white egg". The aware-name of the white egg is "heavy helium sphere".  The aware-description of the white egg is "A reinforced carboy [if the white egg is cooked]that once contained[otherwise]of[end if] super-chilled metallic Helium-4." The white egg-proxy is an aware-proxy that is part of the white egg. Understand "helium" and "heavy" and "sphere"as the white egg-proxy. The clueless-description of the white egg is "[if cooked]A perfectly fried egg: The yellow yolk lies at the geometric center of a white disc, like the star at the center of a nascent system. The yolk is just a notch short of congealing, and the white is neither runny nor burnt. Another culinary success[otherwise if the egg is broken]A raw egg, with bright yellow yolk[otherwise]A big white neoegg[end if]."

Instead of attacking the white egg:
	if the white egg is in the frying pan:
		try cracking the white egg into the frying pan;
	otherwise:
		say "That would make a mess. You'd only break the egg into a pan."
	
Cracking it into is an action applying to two things. Understand "crack [something] into/in/on/over [something]" as cracking it into. Understand "open [something] into/in/on/over [something]" as cracking it into. Understand "break [something] into/in/on/over [something]" as cracking it into.

Check cracking it into:
	if the enamel_pid is zero:
		say "You feel kind of grimy and not entirely awake. From past experience you know that cooking before your morning shower often ends in disaster." instead;
	if the noun is not the white egg:
		say "Could you rephrase that?" instead;
	otherwise:
		if the second noun is not the frying pan:
			say "[if the player is clueless]That's crazy talk[otherwise]It would be in advisable to vent the heavy helium into anything but a magnetic containment bottle[end if]." instead.

Carry out cracking it into:
	move the white egg to the frying pan;
	now the white egg is broken;
	if the player is clueless:
		say "You crack the egg into the frying pan. The neoegg shell sublimates as the contents spread over the pan's non-stick surface. [run paragraph on]";
	otherwise:
		say "The heavy helium feed is now coupled to the input port of the magnetic bottle. [run paragraph on]";
	if the frying pan is on the range:
		fry the white egg;
	otherwise:
		say paragraph break.
		
After putting the frying pan on the range:
	if the white egg is in the frying pan and the white egg is raw and the white egg is broken:
		fry the white egg;
	otherwise:
		continue the action.
		
Instead of putting the white egg on a supporter:
	say "The egg might roll of its flat surface, leaving you with no breakfast. You hang onto the egg."
	
To fry the white egg:
	now the white egg is cooked;
	say "[if the player is clueless]Immediately, the surface of the range glows red. When the egg is cooked sunny-side up to perfection, the glow fades[otherwise]A spherical array of powerful lasers discharges instantly, their combined output focused on the heavy helium being injected into the magnetic bottle within the reactor chamber. The ship surges with power as the fusion rockets are energized[end if].";
	if the Second Sim is happening:
		let metatext be "Janet: If there were some heavy helium left after landing, could the ship take off again?[line break]David: Hypothetically, yes, but the planet has essentially no atmosphere to break against and it has about nine times Earth gravity. Even with optimal approach we’ll have to fuse every gram of that heavy helium to make a soft landing.[line break]Janet: I just hate to leave the ship there. It could take years before our next Casimir ship will be built, and who knows if Valkyrie will survive that long on that chthonian rock.[line break]David: Nice word. From MARSpace perspective, all that matters is that the probe data are recovered.";
		say "[metatext in metaspeak]".	
	
Instead of doing something to the white egg when the white egg is broken:
	if the current action is examining:
		continue the action;
	otherwise:
		if the player is clueless:
			say "[one of]Momma always said, [quotation mark]don't play with your food[quotation mark][or]Are you going to eat it, or what?[or]Cooked eggs are good for one thing (well, two if you count modern art)[or]You can eat the egg, or not eat the egg. It doesn't seem to care[or]To eat the egg or not. That is the question[at random].";
		otherwise:
			say "The He-4 carboy is empty and can be recycled."
			
Before eating the white egg:
	if the player is rover:
		say "You know that you are not supposed to eat eggs.[if rover is stuffed] Besides, you are full right now.";
		the rule succeeds;
	otherwise:
		if the white egg is raw:
			if the player is clueless:
				say "A raw egg? Disgusting!";
			otherwise:
				say "The fuel has not been ignited; it would be premature to recycle the containment unit.";
			the rule succeeds;
		otherwise:[cooked]
			say "[if the player is clueless]You gobble down what might well have been the best neoegg you've ever had[otherwise]The components are the heavy helium containment unit are reallocated to ship's needs[end if].";
			if the Second Sim is happening:
				let metatext be "David: Wait a minute! She just scoops the egg out of the pan with her hand and eats it like a grizzly bear raking salmon out of a river?[line break]Janet: Works for me, yeah.[line break]David: How about a plate and fork?[line break]Janet: The ACU doesn’t miss them, and it’s less programming overhead. And bonus: fewer dishes to clean.";	
				say "[metatext in metaspeak]";
			now the ignite_pid is the turn count;
			move the white egg to the cold box;
			now the white egg is not cooked;
			now the white egg is not broken;	
			the rule succeeds;
			
After taking the white egg for the first time:
	say "You pluck the white egg out of the fridge.";
	let metatext be "Janet: It[apostrophe]s a shame we don[apostrophe]t have enough heavy helium to bring the ship back.[line break]David: I[apostrophe]m afraid we[apostrophe]ve put all our baskets in one egg, as it were. That one egg represents every bit of heavy helium refined on Mars since Phobos was destroyed.[line break]Janet: [quotation mark]All Your Egg Are Belong to Us?[quotation mark][line break]David: Huh? Didn[apostrophe]t quite catch that.[line break]Janet: Never mind.";
	say "[metatext in metaspeak]".

The range is enterable furniture in the kitchen[enterable so you can sit on it]. The drawer is an openable closed container that is part of the range.

The clueless-name of the range is "the cooking range". Understand "cooking" and "stove" as the range. The aware-name of the range is "fusion chamber". The clueless-description of the range is "The top of the glass range is flush with the kitchen counter. The surface of the stove is not glowing, indicating that it is not hot. The stove does not have an oven, but below the cooking surface, a drawer [if the drawer is closed]is flush with the kitchen counter[otherwise]hangs open[end if]." The aware-description of the range is "The majority of the engineering deck is occupied by the towering hulk of the industrial fusion reactor that powers the ship[apostrophe]s landing thrusters. The reactor core at the base of the fusion reactor is [if the drawer is closed]closed[otherwise]open[end if].[if the frying pan is on the range] It is illuminated from above by the faint plasma glow of a magnetic bottle which has formed at the focal point of multiple ignition lasers." The range-proxy is an aware-proxy that is part of the range. Understand "fusion" and "chamber" as the range-proxy.

Before switching on the range:
	say "[if the player is clueless]Your stove is a Cupertino SmartRange[unicode 174] -- there are no controls, just a stylish glass surface with rounded corners[otherwise]The fusion chamber is designed to activate automatically when heavy helium is contained in a magnetic bottle at the focal point[end if].";
	the rule succeeds.
	
After touching the range:
	say "The stove is cool to the touch."
	
Before opening the range:
	say "There is no obvious way to open the range.";
	the rule succeeds. 
	
A frying pan is in the drawer. It is an open not openable container.  The carrying capacity of the pan is 1. The clueless-name of the the frying pan is "frying pan". The aware-name of the frying pan is "magnetic bottle". The clueless-description of the frying pan is "A small, non-stick frying pan [if the white egg is not in the frying pan][otherwise if the white egg is cooked]from which a single cooked egg stares up at you[otherwise if the egg is broken]containing a gooky, uncooked egg[otherwise]in which a big white neoegg rolls around[end if]." The aware-description of the frying pan is "A powerful magnetic field capable of confining the fusion reaction within a tight volume, at the heart of the Valkyrie's fusion lasers." The frying pan-proxy is an aware-proxy that is part of the frying pan. Understand "magnetic" and "bottle" and "containment" as the frying pan-proxy.

The clueless-name of the drawer is "drawer". The aware-name of the drawer is "reactor core". The clueless-description of the drawer is "A deep [drawer] under [the range]. [The drawer][if open]has been opened[otherwise]is shut[end if]." The aware-description of the drawer is "[if the drawer is open]The closed [drawer] shields the engineering section of the ship from residual radiation[otherwise]With [the drawer] open, hard radiation bathes the engineering section[end if]." The drawer-proxy is an aware-proxy that is part of the drawer. Understand "reactor" and "core" and "shielding" and "shield" as the drawer-proxy. 

The dog dish is a prop in the kitchen. Understand "dog" and "bowl" and "bowls" and "dish" as the dog dish. The water trough and the food trough are bowls which are parts of the dog dish. The water trough and the food trough are privately-named. The clueless-name of the dog dish is "dog dish". The aware-name of the dog dish is "transfer device". The clueless-description of the dog dish is "Rover[apostrophe]s dog dish is divided into two sections, a bowl marked [quotation mark]water[quotation mark], and another labeled [quotation mark]chow[quotation mark]. [dog dish status]."  The aware-description of the dog dish is "A ROVER servicing unit with hoses and clamps for connecting fuel and coolant lines to the ROVER prior to field deployment. [dog dish status]." The dog dish-proxy is an aware-proxy that is part of the dog dish. Understand "transfer" and "system" and "device" as the dog dish-proxy.

To say dog dish status:
	If the water trough is full and the food trough is full:
		say "Both [the water trough] and [the food trough] are full";
	otherwise if the water trough is not full and the food trough is not full:
		say "Both [the water trough] and [the food trough] are empty";
	otherwise:
		say "[The food trough] [if the food trough is full]is full[otherwise]is empty[end if], but [the water trough] is [if the water trough is full]full[otherwise]empty[end if]".

Understand "water" and "bowl" as the water trough. The clueless-name of the water trough is "water bowl". The aware-name of the water trough is "coolant reservoir". The clueless-description of the water trough is "[emptyness of the water trough]." The aware-description of the water trough is the "[emptyness of the water trough]." The water trough-proxy is an aware-proxy that is part of the water trough. Understand "coolant" and "line" and "reservoir" and "transfer" and "device" as the water trough-proxy.

Understand "food" and "bowl" and "chow" as the food trough. The clueless-name of the food trough is "food bowl". The aware-name of the food trough is "fuel reservoir". The clueless-description of the food trough is "[emptyness  of the food trough]." The aware-description of the food trough is "[emptyness of the food trough]". The food trough-proxy is an aware-proxy that is part of the food trough. Understand "fuel" and "line" and "reservoir" and "transfer" and "device" as the food trough-proxy.

To say emptyness of (vessel - a bowl):
	say "[The vessel] is [if the vessel is not full]empty[otherwise]full".

Before doing something to a bowl in the kitchen:
	[to make sure that the two bowls are treated as a united object in most cases]
	if the current action is filling it with or examining:
		continue the action;
	otherwise:
		now the noun is the dog dish.
		
After dropping the dog dish:
	say "You carefully place the dog dish on the kitchen floor."

Filling it with is an action applying to two things. Understand "fill [a bowl] with [something]" as filling it with.   

Check filling it with:
	if the noun is full:
		say "[The noun] is already full." instead;
	if the noun is the water trough:
		if the second noun is not tap water:
			say "Rover would not appreciate it if you put anything aside from [if the player is clueless]water[otherwise]coolant[end if] in his [water trough]." instead;
	if the noun is the food trough:
		if the second noun is not dog food:
			say "[if the player is clueless]Only dog food in the dog bowl. Vet's orders[otherwise]The fuel reservoir was designed only to handle Rover's radioisotopic fuel[end if]." instead;
		otherwise:
			if the dog chow bag is not held by the player:
				say "([if the player is clueless]taking the bag of dog chow[otherwise]accessing the conduit output valve[end if])";
				try silently taking the dog chow bag.
			
Carry out filling it with:
	move the second noun to the noun.
	
Report filling it with:
	say "You fill the [noun] with some [second noun]."
	
Instead of inserting something into a bowl in the kitchen:
	[try to route anything going into the bowls through the filling it wth action]
	try filling the second noun with the noun.
	
To say pick a side:
	say "Which side of the dog dish?"
	
Instead of inserting something into the dog dish:
	say pick a side.
	
Instead of filling the dog dish with something:
	say pick a side.
	
Instead of doing something with the tap water:
	if the kitchen sink encloses the tap water:
		say "You don't see any.";
	otherwise:
		if the current action is examining:
			continue the action;
		otherwise:
			say "You don't want to mess with Rover's [tap water]."
			
Instead of doing something with the dog food:
	if the current action is examining:
		continue the action;
	otherwise:
		if the dog chow bag encloses the dog food:
			say "[if the player is clueless]You're not very keen to reach into a bag of stinky dog food[otherwise]For optimal containment, the fuel isotopes should remain in the fuel conduit or reservoir[end if].";
		otherwise:
			say "You don't want to mess with Rover's [dog food]."
	
The counter is an enterable furniture in the kitchen. The clueless-name of the counter is "kitchen counter". The aware-name of the counter is "bulkhead". The clueless-description of the counter is "A scratch-resistant white counter into which a cooking range has been set." The aware-description of the counter is "Thick bulkheads provide radiation shielding around the fusion chamber." The counter-proxy is an aware-proxy that is part of the counter. Understand "bulkhead" as the counter-proxy. The counter can be discussed. The counter is not discussed.

The kitchen sink is a sink in the kitchen. The clueless-name of the sink is "sink". The aware-name of the sink is "coolant output". The clueless-description of the sink is "A small, utilitarian kitchen sink. Below the sink, there is a small cabinet." The aware-description of the kitchen sink is "The coolant output nozzle leads towards the Rover transfer system." The kitchen sink-proxy is an aware-proxy that is part of the kitchen sink. Understand "coolant" and "output" and "nozzle" as the kitchen sink-proxy.

The tap water is a water that is part of the kitchen sink. The clueless-name of the tap water is "water". The aware-name of the tap water is "coolant". The clueless-description of the tap water is "Clear, cool water." The aware-description of the tap water is "Clear, thermoconductive liquid." Understand "water" as tap water. 

Does the player mean filling a bowl with the tap water: it is very likely. Does the player mean doing something with a bowl: it is likely. Does the player mean filling a bowl with the dog food: it is very likely. Does the player mean inserting tap water into something: it is very likely. Does the player mean inserting dog food into something: it is very likely.

Instead of opening or switching on a sink:
	if the player is clueless:
		say "You run the water momentarily, and then turn off the tap to conserve water.";
	otherwise:
		say "You verify that coolant pressure is nominal."
		
Instead of closing or switching off a sink:
	if the player is clueless:
		say "It's already shut off.";
	otherwise:
		say "Coolant output flow is already zero."

The cabinet is part of the kitchen sink.  The cabinet is an openable closed scenery container.  The dog chow bag and the reward nuggets box are in the cabinet.  

The clueless-name of the cabinet is "cabinet". The aware-name of the cabinet is "fuel storage depot". The clueless-description of the cabinet is "Under the sink, the cabinet is [if the cabinet is open]open[otherwise]closed[end if]." The aware-description of the cabinet is "A lead-lined vault in which radioisotope fuel is stored for the ROVER. The vault is presently [if the cabinet is open]sealed[otherwise]unsealed[end if]." The cabinet-proxy is an aware-proxy that is part of the cabinet. Understand "fuel" and "storage" and "depot" as the cabinet-proxy.

The dog chow bag is an open openable container.  The carrying capacity of the dog chow bag is 1.  The dog chow bag contains some dog food.

The clueless-name of the dog chow bag is "20 kilo bag of dog chow". Understand "20" and "kilo" and "food" and "chow" as the dog chow bag. The aware-name of the dog chow bag is "fuel conduit". The clueless-description of the dog chow bag is "The bag features a picture of a grotesquely (in your opinion) fat white husky seated at a fancy dinner table. In front of him, steak, turkey, and ham are piled high on silver dishes. He stares rapaciously at the feast, clenching a fork and knife in his paws. The bag is labeled [quotation mark]Happy Dogz Mix[quotation mark]". The aware-description of the dog chow bag is "A fully automated delivery system designed to safely pump radionuclide fuels from the storage unit to the ROVER transfer device." The dog chow bag-proxy is an aware-proxy that is part of the dog chow bag. Understand "fuel" and "conduit" as the dog chow bag-proxy.

The clueless-name of the dog food is "doggie kibbles". Understand "kibble" and "kibbles" and "doggie" as dog food. The aware-name of the dog food is "polonium 210". The clueless-description of the dog food is "Tasty brown kibbles." The aware-description of the dog food is "Red hot pellets of Polonium 210". The dog food-proxy is an aware-proxy that is part of the dog food. Understand "polonium" and "210" and "radionuclide" and "isotope" and "pellet" and "pellets" as the dog food-proxy.

Before eating dog food:
	say "[if the player is clueless]Eww. Yech. So not[otherwise]Po-210 is not a suitable fuel source for the Valkyrie. The limited quantity, and its slow rate of heat production would not significantly contribute to the ship's power budget[end if].";
	the rule succeeds.

The reward nuggets box is an open not openable container. The carrying capacity of the reward nuggets box is 1. The reward nuggets box contains a dog treat. 

The clueless-name of the reward nuggets box is "small box of liver-flavored reward nuggets". Understand "small" and "box" and "liver" and "flavor" and "reward" and "nugget" and "nuggets" as the reward nuggets box. The aware-name of the reward nuggets  box is "token dispenser". The clueless-description of the reward nuggets box is "The bright red box is labeled [quotation mark]Reward Nuggets[quotation mark] and has a picture of a dog with angel wings and a halo above its head."  The aware-description of the reward nuggets box is "A virtual device for reinforcing the weighting of positive behaviors in the ROVER neural net."  The reward nuggets box-proxy is an aware-proxy that is part of the reward nuggets box. Understand "token" and "dispenser" as the reward nuggets box-proxy.

The dog treat is edible. The clueless-name of the dog treat is "dog treat". Understand "nugget" and "nuggets" and "reward" as the dog treat. The aware-name of the dog treat is "neural net reinforcement token". The clueless-description of the dog treat is "A bone-shaped dog treat. It doesn't seem very appetizing to you, but Rover likes them.". The aware-description of the dog treat is "A positive feedback method within Rover's neural net.". The dog treat-proxy is an aware-proxy that is part of the dog treat. Understand "neural" and "net" and "reinforcement" and "token" and "positive" and "feedback" as the dog treat-proxy.

Instead of eating the dog treat:
	say "[if the player is clueless]The thought of eating anything liver-flavored puts you off[otherwise]The checksum on Rover's reward tokens is not valid within your neural net[end if]."

The kitchen floor is a privately-named scenery supporter in the kitchen. The clueless-name of the kitchen floor is "kitchen floor". The aware-name of the kitchen floor is "engineering section floor". The clueless-description of the kitchen floor is "Mars-tone tiling." The aware-description of the kitchen floor is "A strong metal mesh overlying the girders and struts that brace the engines against ship's inner hull." The kitchen floor-proxy is an aware-proxy that is part of the kitchen floor. Understand "girder" and "girders" and "strut" and "struts" and "mesh" and "metal" and "hull" and "inner" as the kitchen floor-proxy.

Section Bathroom

The clueless-name of the bathroom is "bathroom". The aware-name of the bathroom is "flight control". The clueless-description of the bathroom is "Your cottage[apostrophe]s living room is palatial compared to your bathroom. There is a pink marble counter, with a toothbrush and some floss on it. A shallow sink is inset into the counter, and above it, you[apostrophe]ve mounted mirror on the wall. To the right of the mirror is a black glass touch plate. Between the counter and the shower is a white, porcelain toilet." The aware-description of the bathroom is "The flight control and avionics hub of the ship bristles with controls and readouts related to setting the ship's attitude in space, adjusting the control surfaces in atmospheric flight, and for firing the breaking thrusters during the landing sequence." The bathroom can be really-visited. The bathroom is not really-visited. [this is used instead of visited because the mere attempt to go somewhere makes a place visited, whereas what we're interested in is whether it player actually reached the bathroom, so this flag is set as an after-action]

After going towards the bathroom:
	if the bathroom is not really-visited and the Second Sim is happening:
		now the bathroom is really-visited;
		let metatext be "Janet: Let’s hope the simulation doesn’t crash again. I’d really like to run it all the way through to the Rover release.[line break]David: It’s looked good this far.";
		say "[metatext in metaspeak]".
	
The marble counter is furniture in the bathroom.  On the marble counter are a toothbrush and a floss dispenser. The toothbrush and floss dispenser are props.

The clueless-name of the marble counter is "marble counter". Understand "pink" and "faux" as the marble counter. The aware-name of the marble counter is "flight console". The clueless-description of the marble counter is "A counter of that pink faux marble that is so common in Martian bathrooms.[if something is on the marble counter] On it [is-are a list of things on the marble counter]."  The aware-description of the marble counter is "A fully automated flight control console. [if something is on the marble counter]On it [is-are a list of things on the marble counter]." The marble counter-proxy is an aware-proxy that is part of the marble counter. Understand "flight" and "console" as the marble counter-proxy.

The clueless-name of the floss dispenser is "floss dispenser". Understand "white" and "box" as the floss dispenser. The aware-name of the floss dispenser is "object linker". The clueless-description of the floss dispenser is "A small white box with a blue button just below where the floss comes out." The aware-description of the floss dispenser is "A featureless and perfectly cube-shaped grey box." The floss dispenser-proxy is an aware-proxy that is part of the floss dispenser. Understand "object" and "linker" as the floss dispenser-proxy.

The blue button is part of the floss dispenser.  The clueless-name of the blue button is "blue button". The aware-name of the blue button is "linkage actuation circuit". The clueless-description of the blue button is "A blue plastic button on the side of the ergonomically designed floss dispenser." The aware-description of the blue button is "A transputer circuit modulating quantum entanglement within the flight control subsystem." The blue button-proxy is an aware-proxy that is part of the blue button. Understand "linkage" and "actuation" and "circuit" as the blue button-proxy.

The strand of dental floss is an edible prop. It is in Limbo. Understand "light" and "green" as the strand of dental floss. The clueless-name of the strand of dental floss is "strand of dental floss". The aware-name of the strand of dental floss is "entangled key pair". The clueless-description of the strand of dental floss is "A strand of pale green dental floss". The aware-description of the strand of dental floss is "A pair of quantum-entangled keys which can be linked transputer control nodes". The strand-proxy is an aware-proxy that is part of the strand of dental floss. Understand "key" and "pair" as the strand-proxy.

Instead of pushing the blue button:
	if the player does not hold the floss dispenser:
		say "(first [if the player is clueless]taking[otherwise]accessing[end if] [the floss dispenser])[command clarification break]";
		try silently taking the floss dispenser;
		if the player does not hold the floss dispenser:
			the rule fails;
	if the strand of dental floss is in limbo:
		move the strand of dental floss to the player;
		say "[if the player is clueless]You grab a strand of light green dental floss as it reels out of the dispenser[otherwise]You push the entanglement key pair onto the stack for rapid retrieval[end if].";
	otherwise:
		say "[if the player is clueless]The floss dispenser beeps, indicating that it is waiting for you to use the dental floss that it has already dispensed. Never underestimate the intelligence of your average floss dispenser[otherwise]The object linker flags an error: a quantum entanglement key pair has already been generated[end if]."
	
Instead of eating the dental floss:
	move dental floss to Limbo;
	say "[if the player is clueless]Mmm. Quite tasty[otherwise]Key pair decohered and ready for regeneration[end if]."
	
Flossing is an action applying to one thing. Understand "floss [something]" as flossing.

Check flossing:
	if the strand of dental floss is not held by the player:
		say "[if the player is clueless]You don't have any floss[otherwise]Before linking anything, you will need to generate a pair of mutually entangled keys[end if].";
		rule fails;
	if the noun is not teeth:
		say "[if the player is clueless]Floss [the noun]? Flossing is for teeth. You could tie the floss to [the noun] if that would float your boat, but that's hardly the same as flossing it[otherwise]The key pair is usually used to link transputational intellinodes within the hull plating. If you want to bind other nodal representations, you should tie the keys to those specific nodes[end if].";
		rule fails.
		
Carry out flossing:
	move dental floss to Limbo;
	say "[if the player is clueless]You floss your teeth and then swallow the tasty (and nutritious) floss. You feel so much better now[otherwise]The hull plating is now synchronously enmeshed[end if]."
	
Instead of putting the strand of dental floss on teeth:
	try flossing teeth.
	
[TODO: tie ends of floss to stuff]

The clueless-name of the toothbrush is "toothbrush".  Understand "brush" and "green" and "bristle" and "bristles" and "sonic" as the toothbrush. The aware-name of the toothbrush is "pit scrubber". The clueless-description of the toothbrush is "A green sonic toothbrush with slightly worn bristles." The aware-description of the toothbrush is "The pit scrubber system appears to be operational. The countless nanobots it contains are dormant until they are released on the skin of the ship to polish out micropits from collisions with microscopic particles during the flight." The toothbrush-proxy is an aware-proxy that is part of the toothbrush. Understand "pit" and "scrubber" and "nanobot" and "nanobots" as the toothbrush-proxy. The scent of the toothbrush is "strongly of spearmint".

Instead of listening to the toothbrush:
	say "[if the player is clueless]It must be off, because it's silent at the moment[otherwise]The pit scrubber is silent when not activated[end if]."
	
Brushing is an action applying to one thing. Understand "brush [something]" as brushing.

Check brushing:
	if the toothbrush is not held by the player:
		say "[if the player is clueless]The first rule of brushing stuff is that you need to have a brush. No brush, no brushing. QED[otherwise]You need to access the pit scrubber first[end if].";
		rule fails;
	if the noun is not teeth:
		say "[if the player is clueless][one of]Your fascination with dental hygiene has gotten out of hand[or]The toothbrush is best used on teeth (hence the name)[or]If you want to brush [the noun] use a [noun]-brush[or]Teeth, sure, [noun], no[at random][otherwise]Low level failsafes restrict nanobristle distribution to the hull. The pit scrubber cannot be applied to [the noun][end if].";
		rule fails.
		
Carry out brushing:
	say "[if the player is clueless]The toothbrush sprays each tooth with a fizzy foam, vibrates it into lather and rinses. Your teeth feel smooth and your breath is much improved[otherwise]Nanobristles wake from dormancy and begin reproducing through the ship, sending waves of their progeny across the surface of the ship. The uncountable hordes of microscopic scrubbers oxidize and buff the ship to a brilliant, gleaming silver[end if]."
		
The bathroom floor is privately-named scenery in the bathroom.  Understand "floor" and "glass" and "micropore" as the bathroom floor. The clueless-name of the bathroom floor is "bathroom floor". The aware-name of the bathroom floor is "decking". The clueless-description of the bathroom floor is "The black bathroom floor sparkles thanks to microscopic bits of volcanic glass which assure that the floor is never slippery, even when wet. The micropores in the floor also assure that water does not collect for long on the bathroom floor." The aware-description of the bathroom floor is "The deck plating in the flight deck is painted bright yellow." The bathroom floor-proxy is an aware-proxy that is part of the bathroom floor. Understand "yellow" and "deck" and "plating" and "decking" as the bathroom floor-proxy.

The bathroom walls are privately-named scenery in the bathroom.  Understand "walls" or "wall" as the bathroom walls. The mirror is part of the bathroom walls.  The black plate is a device which is part of the bathroom walls. Understand "wall" as bathroom walls. 

The clueless-name of the bathroom walls is "bathroom walls". Understand "tan" and "tiles" and "tile" and "hexagon" and "hexagonal" as the bathroom walls. The aware-name of the bathroom walls is "panels". The clueless-description of the bathroom walls is "Tan hexagonal tiles cover the walls." The aware-description of the bathroom walls is "Panels with indicators showing the orientation of the ship in space, heading and speed, and other information useful for piloting and landing the ship." The bathroom walls-proxy is an aware-proxy that is part of the bathroom walls. Understand "panel" and "panels" and "indicator" and "indicators" and "heading" and "speed" and "information" as the bathroom walls-proxy.
 
The clueless-name of the mirror is "mirror". The aware-name of mirror is "inspector". The clueless-description of the mirror is "[if the mirror is steamed]The mirror is covered with condensation[otherwise]You see yourself in the mirror: a young woman with dark brown hair, high cheekbones and a look of determination[end if]." The aware-description of the mirror is "[if the mirror is steamed]The inspector buffer is full and requires wiping[otherwise]About this ACU: You are a Burroughs model DT69105 mainframe running version 210LTS of the Flosix Operating System, [quotation mark]Hysterical Hydrax[quotation mark][end if]." The mirror-proxy is an aware-proxy which is part of the mirror. Understand "inspector" as the mirror-proxy. The mirror can be steamed. The mirror is not steamed.

Instead of rubbing the mirror:
	if the mirror is steamed:
		now the mirror is not steamed;
		if the player is clueless:
			say "You wipe away the condensation and can see yourself in the mirror. [run paragraph on]";
			if the player is wet or the player is not wearing the flight suit:
				say "You are ";
				if player is wet: 
					say "wet";
					if player is not wearing the flight suit:
						say " and ";
				if player is not wearing the flight suit:
					 say "naked";
				say ".";
		otherwise:
			say "You calibrate the inspector.";
	otherwise:
		say "[if the player is clueless]It makes a squeaky noise[otherwise]The inspector voltage reference goes low, signaling normal operation[end if]."

Instead of looking in the mirror:  
	try examining the mirror.

After examining the mirror for the first time:
	let metatext be "David:  Wait, is that memory usage correct?[line break]Janet:  Sure, it's fairly conservative.  The system has 640 PB available.[line break]David:  That's it?[line break]Janet:  C'mon, nobody will ever need more than 640 PB.";
	say "[metatext in metaspeak]";

The bathroom ceiling is privately-named scenery in the bathroom. The irradiator is a switched off device which is part of the bathroom ceiling.  

The clueless-name of the bathroom ceiling is "bathroom ceiling". Understand "ceiling" and "roof" as the bathroom ceiling. The aware-name of the bathroom ceiling is "canopy". The clueless-description of the bathroom ceiling is "The bathroom ceiling is slightly concave to promote drainage towards the walls. A heat lamp is mounted in the center of the ceiling." The aware-description of the bathroom ceiling is "The roof of the flight control section is the nose of the ship, containing the RCS thrusters and the equipment that secretes the ablative coating that protects the ship during planetary landings." The bathroom ceiling-proxy is an aware-proxy which is part of the bathroom ceiling. Understand "canopy" as the bathroom ceiling-proxy.

The clueless-name of the irradiator is the "heat lamp". The aware-name of the irradiator is "UV emitter". The clueless-description of the irradiator is "The fresnel lens of a heat lamp is mounted at the apex of the bathroom ceiling." The aware-description of the irradiator is "A distributed system of ultraviolet emitters lining the tubes of the system responsible for secreting an ablative enamel onto the surface of the ship before planetary landings. The ultraviolet light accelerates the polymerization of the neoadamite enamel, forming a protective barrier around the ship. The emitters are [if the irradiator is switched on]energized[otherwise]powered down[end if] at present."  Understand "heat" or "lamp" or "fresnel" or "lens" or "heater" or "dryer" as irradiator. The irradiator can be buggy or patched. The irradiator is buggy. The irradiator-proxy is an aware-proxy which is part of the irradiator. Understand "UV" and "emitter" and "emitters" and "light" as the irradiator-proxy.

The clueless-name of the black plate is the "black plate". The black plate is switched off. The aware-name of the black plate is "irradiator switch". The clueless-description of the black plate is "A glossy black plate that is just to the right of the bathroom mirror." The aware-description of the black plate is "The relay circuit that actuates the UV emitter in the enamel polymerization system." The black plate-proxy is an aware-proxy which is part of the black plate. Understand "irradiator" and "switch" and "control" and "relay" and "circuit" and "actuator" as the black plate-proxy.

Instead of attacking, pushing, or touching the black plate:
	try switching on the black plate.
	
Before switching on the black plate:
	if the player is not wet:
		say "[if player is clueless]The heat lamp senses that you are not wet. Its power conservation settings prevent it from turning on[otherwise]Monomer and accelerant are not present on the surface of the hull. Powering the irradiator would waste energy[end if].";
		the rule succeeds
		
After switching on the black plate when the First Sim is not happening:
	say "[if the player is clueless]The heat lamp on the ceiling flares to a brilliant red, and you dry in an instant. You now feel fresh and ready to face the day[otherwise]The UV light diffuses over the entire surface of the ship and causes the chemical mixture on the hull to polymerize into an durable, clear ablative coating[end if].";
	if the enamel_pid is 0 and the Second Sim is happening:
		let metatext be "Janet: I was holding my breath there. Looks like our patch worked.[line break]David: I had my fingers crossed too.";
		say "[metatext in metaspeak]";
	now the enamel_pid is the turn count;
	now the player is dry;
	now the black plate is switched off.

The bathroom sink is a privately-named sink in the bathroom.  The clueless-name of the bathroom sink is "bathroom sink". The aware-name of the bathroom sink is "decontamination protocol". The clueless-description of the bathroom sink is "A sink with just enough room to wash your hands." The aware-description of the bathroom sink is "The biohazard response protocol is controlled from here, but its effectors are scattered throughout the interior portions of the ship. In the event of biological contamination, the system sterilizes the interior of the ship with gamma radiation and chlorine gas -- both harmless to the ship itself, but likely to be effective against all biological agents." The bathroom sink-proxy is an aware-proxy that is part of the bathroom sink. Understand "decontamination" and "sterilization" and "biohazard" and "response" and "system" and "protocol" as the bathroom sink-proxy.

The toilet is furniture in the bathroom. Does the player mean doing something with the toilet: it is likely.

The clueless-name of the toilet is the "toilet". The aware-name of the toilet is "retros".  The clueless-description of the toilet is "[if the holder of the player is the toilet seat or the holder of the player is the toilet cover]You are sitting on a[otherwise]A[end if] plain vanilla toilet, having a water tank and bowl. Nothing to write home about. [throne status].[paragraph break]A plunger stands next to the toilet, between it and the shower." The aware-description of the toilet is "The retrorocket assembly is an engineering marvel which channels the monumental power output from the fusion reactors to thrusters. That power should slow the ship's descent enough to make a soft landing almost anywhere. [throne status]." The toilet-proxy is an aware-proxy that is part of the toilet. Understand "retro" and "retros" and "rocket" and "assembly" as the toilet-proxy. 

The water tank is a scenery chest in the bathroom. The tank top is a lid which is part of the water tank. The toilet#interior is a privately-named fixed in place thing in the water tank. The flapper valve is a scenery which is part of the toilet#interior. The chain is part of the toilet#interior. The lever is scenery which is part of the toilet#interior. The silver handle is scenery which is part of the water tank.

The clueless-name of the water tank is the "water tank". The aware-name of the water tank is "plasma constrictor". The clueless-description of the water tank is "A porcelain reservoir containing several liters of water to flush the toilet. On the front of the tank there is a silver handle used to flush the toilet and on the top of the tank there is a lid[if the water tank is open] which has been flipped up[end if]." The aware-description of the water tank is "A ring of supercooled rare earth magnets directs the engine's plasma output into the reaction chamber of the retro assembly. At the top, the plasma constrictor access hatch [if the water tank is open]has been swung open[otherwise]is tightly sealed[end if]."  The water tank-proxy is an aware-proxy which is part of the water tank. Understand "plasma" and "constrictor" and "ring" as the water tank-proxy. 

The clueless-name of the tank top is the "tank lid". The aware-name of the tank top is "plasma constrictor hatch". The clueless-description of the tank top is "A lid made of the same porcelain material as the water tank itself.[if the tank top is open] The lid has been flipped up and you can see into the tank." The aware-description of the tank top is "A hatch providing access to the plasma constrictor ring. [if the tank top is open] The hatch is open allowing access to the inner workings of the plasma constrictor." Understand "lid" as the tank top. The tank top-proxy is an aware-proxy that is part of the tank top. Understand "hatch" as the tank top-proxy.

The clueless-name of the flapper valve is the "flapper valve".  The aware-name of the flapper valve is "thrust aperture". The clueless-description of the flapper valve is "A black rubber valve that seals the bottom of the water tank, allowing the toilet to flush only when it is pulled upward by the chain that connects it to the flush lever." The aware-description of the flapper valve is "The most critical component of the retro assembly, and its only moving part, the thrust aperature controls the flow rate of the ship's breaking thrusters." The flapper valve-proxy is an aware-proxy that is part of the flapper valve. Understand "thrust" and "aperture" as the flapper valve-proxy.

The clueless-name of the chain is the "flush chain". The aware-name of the chain is "thruster linkage servo". The clueless-description of the chain is "A metal chain that [if the chain is intact]connects[otherwise]would normally connect[end if] the flush lever to the flapper valve.[if the chain is broken] The chain has broken, however, and there is no longer any connection between the flush lever and the flapper valve." The aware-description of the chain is "A servo linkage connects the thruster actuation relay to the thruster aperature. The servo linkage status board shows [if the chain is intact]nominal function[otherwise]a fault: there is loss of continuity between the thruster actuation relay and the thrust aperture." The chain-proxy is an aware-proxy that is part of the chain. Understand "thruster" and "linkage" and "servo" and "link" as the chain-proxy. The chain can be broken or intact. The chain is intact.

The clueless-name of the lever is the "flush lever". The aware-name of the lever is "thruster actuation relay". The clueless-description of the lever is "The small white plastic lever on the inside of the water tank pivots up and down when the silver handle on the outside of the tank is turned. The lever in turn pulls on the chain that runs down to the flapper valve.[if the chain is broken] Unforunately, that chain has broken." The aware-description of the lever is "A high power relay attached to the thruster trigger circuit, this device controls the thruster aperature through a servo linkage.[if the chain is broken] Unfortunately, that linkage has been broken." The lever-proxy is an aware-proxy that is part of the lever. Understand "thruster" and "actuation" and "relay" as the lever-proxy.

The clueless-name of the silver handle is the "silver handle". The aware-name of the silver handle is "trigger circuit". The clueless-description of the silver handle is "A silver-plated handle on upper part of the toilet's water tank." The aware-description of the silver handle is "A high-speed circuit connected directly to the flight control system, the  trigger circuit controls the precise timing required to fire the fusion retros during planetary landings." The silver handle-proxy is an aware-proxy that is part of the silver handle. Understand "trigger" and "circuit" as the silver handle-proxy. 

The clueless-name of the toilet#interior is the "inside of the tank". The aware-name of the toilet#interior is "interior of the plasma constrictor ring." The clueless-description of the toilet#interior is "The hardware that makes the toilet work can be seen within the tank. A plastic lever goes up and down according to the position of a silver knob on the outside of the tank, pulling on a chain that operates a flapper valve.[if the chain is broken] The situation here is slightly complication, however, as the chain is broken." The aware-description of the toilet#interior is "Inside the plasma constrictor ring, you can trace the control signal from the thruster trigger through the actuation relay [if the chain is broken]but here there is a discontinuity and the signal does not reach[otherwise]and the servo linkage to the[end if] thrust aperature. [if the chain is broken] It looks like the servo linkage has been damaged."

The toilet bowl is an enterable scenery furniture in the bathroom. 

The clueless-name of the toilet bowl is the "toilet bowl". The aware-name of the toilet bowl is the "reaction chamber".  The clueless-description of the toilet bowl is "The white porcelain bowl is the bottom part of the toilet. [throne status]." The aware-description of the toilet bowl is "The fusion output mixes with reactant in the glossy white chamber at the bottom of the retro assembly, just distal to the thrust aperature. [throne status]." The toilet bowl-proxy is an aware-proxy that is part of the toilet bowl. Understand "reaction" and "chamber" as the toilet bowl-proxy.

The toilet seat is a flipchair which is in the bathroom. The clueless-name of the toilet seat is the "toilet seat". The aware-name of the toilet seat is "pressure seating". The clueless-description of the toilet seat is "A padded and heated seat, which is presently [if the toilet seat is open]raised[otherwise]in the down position[end if]." The aware-description of the toilet seat is "A black mevolar gasket that assures a perfect seal between the shield and the reactant chamber. The pressure seating is presently [if the toilet seat is open]not [end if]making a seal with the chamber."  The toilet seat-proxy is an aware-proxy which is part of the toilet seat. Understand "pressure" and "seating" and "mevolar" and "gasket" as the toilet seat-proxy.

The toilet cover is a flipchair which is in the bathroom. The clueless-name of the toilet cover is the "toilet cover". The aware-name of the toilet cover is "reactant shield". The clueless-description of the toilet cover is "The cover is made of plastic, but has been laminated to give it the appearance of unstained wood. It toilet cover is [if toilet bowl is open]open[otherwise]closed[end if]." The aware-description of the toilet cover is "The neoadamite shield over the reaction chamber is presently [if the toilet bowl is open]not [end if]secured." Understand "lid" as the toilet cover. The toilet cover-proxy is an aware-proxy that is part of the toilet cover. Understand "reactant" and "shield" as the toilet cover-proxy.

Does the player mean opening the toilet cover: it is likely.
Does the player mean closing the toilet cover: it is likely.

[The toilet bowl, cover and seat are not part of the toilet because it would great all kinds of problems regardng entering (i.e., sitting) on the toilet -- deflecting the entering action aimed at the toilet to the seat would create a recursive situation, as enter the seat would require entering the parent object, the toilet. Also, entering a part of the toilet or bowl would result in darkness. The solution seems to be to put discrete items into the room, but to make them scenery]

To say throne status:
	if the toilet seat is closed:
		if the toilet cover is closed:
			say "[if the player is clueless]Both the cover and seat are down[otherwise]Both the reactant shield and pressure seating are clamped down";
		otherwise:
			say "[if the player is clueless]The toilet seat is down, but the cover is raised[otherwise]The pressure seating is engaged but the reactant shield is raised";
	otherwise:
		say "[if the player is clueless]Someone left both the cover and seat up. How rude[otherwise]Both the reactant shield and the pressure seating are presently disengaged";
		
Before entering the toilet:
	if the toilet cover is closed:
		try entering the toilet cover;
		the rule succeeds;
	otherwise if the toilet seat is closed:
		try entering the toilet seat;
		the rule succeeds;
	otherwise:
		say "[if the player is clueless]Sitting on the ceramic rim of the toilet bowl would be absolutely too gross to contemplate[otherwise]The mevolar pressure seating is not in place[end if].";
		the rule fails.

Before opening a flipchair (called the flop):
	if a flipchair holds the player:
		say "You can't do that while you are [if the player is clueless]on[otherwise]accessing[end if] [the holder of the player].";
		the rule fails;
	if the flop is open:
		say "[The flop] is already [if the player is clueless]raised[otherwise]disengaged[end if].";
		the rule fails;
	otherwise:	
		now the flop is open;
		if the toilet seat is open:
			now the toilet cover is open;
		say "You [if the player is clueless]lift[otherwise]disengage[end if] [the flop].";
		the rule succeeds.
		
Before closing a flipchair (called the flop):
	if a flipchair holds the player:
		say "You can't do that while you are [if the player is clueless]on[otherwise]accessing[end if] [the holder of the player].";
		the rule fails;
	if the flop is closed:
		say "[The flop] is already [if the player is clueless]down[otherwise]in position[end if].";
		the rule fails;
	otherwise:
		now the flop is closed;	
		if the toilet cover is closed:
			now the toilet seat is closed;
		say "You lower [the flop] into position.";
		rule succeeds.

After opening a flipchair (called the flop):
	say "You [if the player is clueless]raise[otherwise]access[end if] [the flop]."
	
After closing a flipchair (called the flop):
	say "You [if the player is clueless]lower[otherwise]raise[end if] [the flop]."
	
Understand "raise [something raisable]" as opening. Understand "lift [something raisable]" as opening.

Understand "lower [something raisable]" as closing.

Before entering a flipchair (called the flop):
	if the flop is open:
		say "(first [if the player is clueless]lowering[otherwise]engaging[end if] [the flop])[command clarification break]";
		if the flop is the toilet cover:
			now the toilet cover is closed;
		now the toilet seat is closed;
	if the flop is the toilet seat and the toilet cover is closed:
		say "(first [if the player is clueless]raising[otherwise]disengaging[end if] [the toilet cover])[command clarification break]";
		now the toilet cover is open.
		
Instead of taking the toilet:
	say "That's hardly potable."
	
Flushing is an action applying to one thing.  Understand "flush [something]" as flushing.

Check flushing:
	if the noun is the toilet or the noun is the silver handle:
		if the Landing Sequence is happening:
			if the pitch is not 0 or the roll is not 0 or the yaw is not 0:
				say "Not yet, you’re not done.";
				the rule fails;
			otherwise:			
				continue the action;
		otherwise:
			say "[if the player is clueless]Water isn't as expensive as it used to be in the international days, but there's no sense in wasting it willy nilly with unnecessary flushing[otherwise]The ship is not on planetary approach. Retros are offline[end if].";
			the rule fails; 
	otherwise: 
		say "[if the player is clueless]That would be difficult to explain to the plumber[otherwise]Thruster discharge can only be actuated via the retro trigger circuit[end if].";
		the rule fails.
		
Carry out flushing:
	move the player to the bathroom, without printing a room description;
	now the landing_pid is the turn count.
	
Report flushing:
	say "You reach behind you, flush the toilet and stand up. The cottage’s aging plumbing rumbles and vibrates as the toilet flushes."
	
Instead of exiting when holder of the player is the toilet seat and the landing sequence is happening:
	try flushing the toilet.
	
Instead of entering a flipchair (called the flop):
	move the player to the flop, without printing a room description;
	say "You sit on the [flop]."

The plunger is furniture in the bathroom. The [john] shaft and the red rubber cup are part of the plunger.

The clueless-name of the plunger is "plunger". The aware-name of the plunger is "attitude control". The clueless-description of the plunger is "A common plumber's plunger, consisting of a wooden shaft and red rubber cup. [yoke position]". The aware-description of the plunger is "An integrated system for controlling the pitch, roll, and yaw of the ship through the nose cone RCS thrusters. Currently, pitch is [pitch] degrees, roll [roll] degrees and yaw [yaw] degrees." The plunger-proxy is an aware-proxy that is part of the plunger. Understand "attitude" and "control" and "RCS" as the plunger.

The clueless-name of the shaft is "shaft". The aware-name of the shaft is "vector input port". The clueless-description of the shaft is "A wooden stick." The aware-description of the shaft is "A multiaxial control device which outputs ship orientation instructions to the nose cone drivers." Understand "handle" as the shaft. The shaft-proxy is an aware-proxy that is part of the shaft. Understand "vector" and "input" and "port" as the shaft-proxy.

The clueless-name of the red rubber cup is the "red rubber cup". The aware-name of the red rubber cup is the "nose cone driver". The clueless-description of the red rubber cup is "The business end of the plunger.[if a random chance of one in eight succeeds] [quotation mark]Exterminate! Exterminate![quotation mark]". The red rubber cup-proxy is an aware-proxy that is part of the red rubber cup. Understand "nose" and "cone" and "driver" as the red rubber cup-proxy.

To say yoke position:
	if the player is clueless:
		if the pitch is zero and the roll is zero and the yaw is zero:
			say "The plunger stands perfectly straight, just the way you like it."; 
		otherwise:
			say "Something about the plunger is not right, though. The handle of the plunger is ";
			if the pitch is not zero:
				say "tilted [magnitude of pitch] [if the pitch is greater than zero]backwards[otherwise]forwards[end if][run paragraph on]";
				if the roll is not zero:
					say " and it's also [run paragraph on]";
			if the roll is not zero:
				say "leaning [magnitude of roll] to the [if the roll is greater than zero]right[otherwise]left[end if][run paragraph on]"; 
			if the yaw is not zero:
				if pitch is not zero or the roll is not zero:
					say ". Furthermore, its handle is ";
				say "twisted [magnitude of yaw][if the yaw is less than zero]counter[end if]clockwise[run paragraph on]";
			say "."
							
To say magnitude of (degrees - a number):
	if degrees is less than zero:
		now degrees is degrees times -1;
	if degrees is greater than 180:
		say "error - angle magnitude out of limits";
		[for debuggage only -- bad orc, exceeded pi]
		rule fails;
	say the Inclination corresponding to the Angle of degrees in the Table of Orientations.

Yoking it more is an action applying to one thing and one visible thing.

Check yoking it more:
	if the noun is the shaft:
		now the noun is the plunger;
	if the noun is not the plunger:
		try pushing the noun.
		
Carry out yoking it more: 
	let A be the axis corresponding to the custom-direction of second noun in the Table of Axes;
	let D be the delta corresponding to the custom-direction of second noun in the Table of Axes;
	if A is 1:
		now pitch is pitch plus 30 times D;
		now the pitch is the limited pitch range;
	otherwise if A is 2:
		now roll is roll plus 30 times D;
		now the roll is the limited roll range;
	otherwise if A is 3:
		now yaw is yaw plus 30 times D;
		now the yaw is the limited yaw range;
	otherwise:
		say "error in the yoking it more table look up :-(".
		
Report yoking it more:
	let A be the axis corresponding to the custom-direction of second noun in the Table of Axes;
	let D be the delta corresponding to the custom-direction of second noun in the Table of Axes;
	say "You adjust the plunger handle [second noun]. [run paragraph on]";
	if A is 1:
		let the angle be the pitch;
	otherwise if A is 2:
		let the angle be the roll;
	otherwise if A is 3:
		let the angle be the yaw;
	if the angle is 180 times D:
		say "It doesn't look like it will move any further in that direction.";
	otherwise:
		say yoke position.

To decide what number is the limited (measured - a number) range:
	if measured is greater than 180:
		let measured be 180;
	otherwise if measured is less than -180:
		let measured be -180;
	decide on measured.
	
Table of Axes
custom-direction		axis			delta				
forwards					1[pitch]		-1
backwards					1			 	1
leftwards					2[roll]			-1
rightwards				2			 	1
counterclockwise		3[yaw]			-1
clockwise					3				1

Table of Orientations
Angle		Inclination
0				"perfect"
30				"just the tinyest little bit"
60				"a tad"
90				""
120				"strongly"
150				"almost completely"
180				"completely"

Understand "push [something] [a custom direction]" as yoking it more.
Understand "pull [something] [a custom direction]" as yoking it more.
Understand "twist [something] [a custom direction]" as yoking it more.
Understand "turn [something] [a custom direction]" as yoking it more.
Understand "spin [something] [a custom direction]" as yoking it more.

The shower door is a door and scenery.  It is north of the bathroom and south of the shower. 

The clueless-name of the shower door is "shower door". The aware-name of the shower door is "extruder latch". The clueless-description of the shower door is "[if the location is the bathroom]A translucent polyglass door at the back of the bathroom leads into the shower stall[otherwise]The polyglass door leads back to the bathroom[end if]. It is [if open]open[otherwise]closed." The aware-description of the shower door is "A circuit which enables or disables the extruder." The shower door-proxy is an aware-proxy that is part of the shower door. Understand "extruder" and "latch" as the shower door.

Before entering the shower door:
	try silently opening the shower door.

After opening the shower door for the first time:
	say "You open the shower door, which is more flimsy that it would at first appear.[paragraph break]You miss having a bath, but when you were selecting a place to live only the high-rises had true baths. The garden cottages on the edge of the park all had these no-frills shower stalls.";
	let metatext be "David: Actually, I live just in a cottage on the other side of the park, and I have a regular bathtub.[line break]Janet: You want me to come over and take my baths there?[line break]David: Well, no, I mean, it would be okay, I guess, but that wasn't my point.[line break]Janet: Your point was...?[line break]David: Just that some of the cottages do have baths.[line break]Janet: I see.";
	say "[metatext in metaspeak]";
	
The clueless-name of the shower is "shower". The aware-name of the shower is "extruder". The shower can be a new experience. The shower is a new experience. The aware-description of the shower is "The extruder delivers activated enamel solution to the surface of the ship through a fluidics network where it hardens into an ablative coating." The clueless-description of the shower is "[if the player is not wearing the flight suit]You are in your shower and water of just the right temperature is raining down on you. [end if]Two buttons are molded into the wall of the shower stall. One is labeled [quotation mark]soap[quotation mark], and the other, [quotation mark]shampoo[quotation mark]. [if the player is wearing the flight suit]The shower has not activated because you are still wearing clothes." The shower can be sprayed. The shower is not sprayed.

Every turn when the player is in the shower:
	if the player is self-aware and the player is not wearing the flight suit:
		now the player is wet;
		now the mirror is steamed;
	otherwise: [clueless]
		if the player is wearing the flight suit: 
			if shower is a new experience:[new experience triggers following metatext]
				now the shower is not a new experience;
				let metatext be "David: I should probably check on the Casimir Drive harmonic suppressor; it still isn't stable.[line break]Janet: I'd like you to see everything.[line break]David: Well... If you think so....[line break]Janet: I do -- I need you to sign off budget authorization on the ACU before we burn it to firmware.[line break]David: Oh.";
				say "[metatext in metaspeak]";
		otherwise:
			now the player is wet;
			now the mirror is steamed;
			if the shower is not sprayed:[sprayed triggers following metatext]
				now the shower is sprayed;
				let metatext be "David: Janet, I...[line break]Janet: David, if it were anyone but you, I would have a problem. Just let it go.[line break]David: Anyone else? Like who?[line break]Janet: Can we get back to the program?[line break]David: Okay, I'm paying attention.[line break]Janet: Obviously.";
				say "[metatext in metaspeak]".	
				
Instead of taking off the flight suit when the player is in the shower:
	say "Your flight suit would get soaked if you took it off in here."
	
Instead of exiting:
	if the player is in the shower:
		try going towards bathroom;
	otherwise if the player is in the kitchen:
		try going towards living room;
	otherwise if the player is in the bathroom:
		if the player is on the toilet seat and the Landing Sequence is happening:		
			say "You haven’t finished your business here. The plunger handle is tilted to the XXXXXX and upsets your sense of order.";
			[TOCONSIDER: is this ever hit?]
		otherwise:
			try going towards the living room;
	otherwise:
		continue the action.
	
Instead of going towards when the player is in the shower:
	if the player is wearing the flight suit:
		continue the action;
	if the player is not wearing the flight suit:
		if the soap button is pressed and the shampoo button is pressed:
			continue the action;
		otherwise:
			if the soap button is unpressed:
				say "[one of]Leaving the shower without washing? What's the point?[or]But you're still feeling grimy. A little soap would fix that right up.[or]As Thomasz used to point out, a little soap goes a long way.[at random]";
				the rule succeeds;
			if the shampoo button is unpressed:
				say "Your hair will be an unmanageable rat's nest for the rest of the day if you don't shampoo it."

The soap dispenser and the shampoo dispenser are scenery in the shower. The shower walls are scenery in the shower. Understand "wall" as shower walls. The soap button is part of the shower walls. The shampoo button is part of the shower walls.

The clueless-name of the soap dispenser is "soap dispenser". The aware-name of the soap dispenser is "ablative enamel injector". The clueless-description of the soap dispenser is "The soap button is molded into the wall of the shower stall." The aware-description of the soap dispenser is "A high pressure injector which delivers the solution to the extruder system for mixing with accelerant." The soap dispenser-proxy is an aware-proxy that is part of the soap dispenser. Understand "ablative" and "neoadamite" and "monomer" and "precursor" and "solution" and "injector" and "high" and "pressure" as the soap dispenser-proxy.

The clueless-name of the shampoo dispenser is "shampoo dispenser". The aware-name of the shampoo dispenser is "accelerant pump". The clueless-description of the shampoo dispenser is "The button for the shampoo dispenser is right next to the one for the soap dispenser". The aware-description of the shampoo dispenser is "A solenoid pump which delivers a catalyst to the extruder system for mixing with monomer solution." The shampoo dispenser-proxy is an aware-proxy that is part of the shampoo dispenser. Understand "accelerant" and "pump" and "solenoid" as the shampoo dispenser-proxy. 

The clueless-name of the shower walls is "shower walls". The shower walls are privately-named. Understand "walls" as the shower walls. The aware-name of the shower walls is "fluidics network". The clueless-description of the shower walls is "The walls of the shower are made of slick white plastic. Two buttons are on the wall, one marked [quotation mark]soap[quotation mark] and the other, [quotation mark]shampoo[quotation mark]." The aware-description of the shower walls is "A distribution network of tubes, pumps and valves that runs throughout the ship, just under the outer hull." The shower walls-proxy is an aware-proxy that is part of the shower walls. Understand "fluidics", "network" , "tubes", "valves" and "pumps" as the shower walls-proxy.

Before switching on the shower door:
	say "[if the player is clueless]The shower is fully automated and adjusts temperature, pressure and direction of the water stream as needed[otherwise]The fluidics network is slaved to the ships autonomic network and activates automatically, as needed[end if].";
	the rule succeeds.
	
The clueless-name of the shampoo button is "shampoo button". Understand "yellow" as the shampoo button. The aware-name of the shampoo button is "accelerant release". The clueless-description of the shampoo button is "A small yellow button on the wall of the shower. It is marked [quotation mark]Shampoo[quotation mark]." The aware-description of the shampoo button is "A monostable vibrator operating the accelerant solenoid." The shampoo button-proxy is an aware-proxy that is part of the shampoo button. Understand "monostable" and "vibrator" as the button-proxy. The shampoo button can be pressed or unpressed. The shampoo button is unpressed.

The clueless-name of the soap button is "soap button". Understand "green" as the soap button. The aware-name of the soap button is "enamel release". The clueless-description of the soap button is "A small green button on the wall of the shower. It is marked [quotation mark]Soap[quotation mark]." The aware-description of the soap button is "The enamel release enable signal." The soap button-proxy is an aware-proxy which is part of the soap button. Understand "enamel" and "release" and "signal" as the soap button-proxy. The soap button can be unpressed or pressed. The soap button is unpressed.

Instead of pushing or touching the soap dispenser:
	try pushing the soap button.
	
Instead of pushing or touching the shampoo dispenser:
	try pushing the shampoo button.
	
Instead of pushing or touching the soap button:
	if the player is wearing the flight suit:
		say "[if the player is clueless]You can't lather up while wearing your flight suit[otherwise]The ACU quantum isolator is interfering with emission of the accelerant[end if].";
		the rule succeeds;
	otherwise:
		if the player is clueless:
			if the First Sim is happening:
				say "A stream of hot, pearlescent white soap is ejected forcefully from the throbbing button, and pools in your hand. You rub it over your entire body with wanton abandon and then wash it off.";
			otherwise:
				say "A soapy paste is dispensed from the button, and you lather up.";
		otherwise:	
			say "The accelerant for the ablative enamel spreads quickly over the ship's hull.";
		if the soap button is unpressed:
			now the soap button is pressed;
			if the First Sim is happening:
				let metatext be "David: No comment.[line break]Janet: I don't know what I was thinking when I wrote that.";
			otherwise if the Second Sim is happening:
				let metatext be "David: That was my favorite part! Why did you rewrite it?[line break]Janet: I thought it might be too distracting for the ACU.";
			say "[metatext in metaspeak]".
	
Instead of pushing or touching the shampoo button:
	if the player is wearing the flight suit:
		say "[if the player is clueless]You don't want to get shampoo all over the flight suit[otherwise]The monomer ejection system is dampened by the ACU quantum isolator[end if].";
	otherwise:
		say "[if the player is clueless]You wash your hair. It no longer feels like a straw-encrusted swarm of yellow-headed tommygoffs[otherwise]Monomer solution is spread uniformly over the ship's hull[end if].";
		if the shampoo button is unpressed:
			now the shampoo button is pressed;
			if the Second Sim is happening:
				let metatext be "Janet: David, what’s the ablative coating for? I thought that most of that planet’s atmosphere had been cooked off long ago.[line break]David: Not really my department. Maybe it’s supposed to help with the heat.[line break]Janet: I’ve heard temps up to 1000 Kelvin?[line break]David: In that ballpark. They think the probe impacted on the star-facing side of the planet. Estimates put the surface temp there between 800 and 1200K.";
				say "[metatext in metaspeak]".

Chapter The Planet

The Planet Area is a region. The Front Yard, The Barren Plain, The Dug-Up Field, The Smoking Pit, The Featureless Desert, and The Strange Porch are outside rooms in the Planet Area.

To say inconsequential outside detail:
	say " You can't see far because it is so dusty here. [one of][or]The wind picks up, making it even more difficult to see.[or]A gust of wind lifts a sheet of dust and rains it down on you.[or]Dust spins in the air.[or]Ominous clouds of dust loom on the ever-darkening horizon.[or]The sky rumbles and rolls, and flashes of lightning snap between billowing clouds of dirt-colored dust.[or]The ground shakes forcefully.[as decreasingly likely outcomes]"

The Front Yard is west of the front door. The description of the front yard is "You are right outside the front door to your home.[inconsequential outside detail]". The printed name of the Front Yard is "Front Yard".  

Home is a scenery fixed in place thing in the Front Yard. Understand "house" as home.

[###TODO redirect actions as necessary from home towards livingroom]

The Barren Plain is west of the Front Yard. A rock is a prop in the Barren Plain. 

The clueless-name of the rock is "rock". The aware-name of the rock is "thorium ore". The clueless-description of the rock is "[if the player is rover]You lick the rock. Not edible. Not a bone. Not interesting.[otherwise]A fist-sized rock that Rover brought in."  The aware-description of the rock is "A black 800 kilogram chunk of low grade thorium ore." The rock-proxy is an aware-proxy that is part of the rock. Understand "black" and "ore" as the rock.

Dug-Up Field is west of the Barren Plain. The small ditch is a not enterable hole in the Dug-Up Field. The description of the small ditch is "It smells like fresh dirt and you can see somes paw marks. Someone has recently dug this hole." The carrying capacity of the ditch is 1.

The Smoking Pit is west of the Dug-Up Field. A long furrow is an enterable hole in the Smoking Pit. 

The description of the long furrow is "The long, deep furrow smells burnt." The carrying capacity of the furrow is 5.

The furrow walls is scenery. It is part of the furrow. The description of the furrow walls is "The walls and the floor of the furrow are hard and shiny, more like glass. The dirt here smells burnt." Understand "wall" or "walls" or "floor" or "dirt" or "soil" or "ground" or "crater" or "ditch" or "excavation" as the furrow walls.

The Featureless Desert is west of the Smoking Pit. 

The Black Bulldog is a male animal in the Featureless Desert. He is carrying the delicious bone. The delicious bone is a prop. 

The clueless-description of the Black Bulldog is "A squat little beast with bristly fur and tiny, unintelligent eyes.[if the black bulldog carries the delicious bone] In his mouth, he is carrying a bone almost as big as he is." The aware-description of the black bulldog is "A modified ten-ton bulldozer." The clueless-name of the black bulldog is "black bulldog". The aware-name of the black bulldog is "robotic bulldozer". The black bulldog-proxy is an aware-proxy that is part of the black bulldog. Understand "bulldozer" and "robot" and "robotic" as the black bulldog-proxy.

The clueless-name of the delicious bone is "delicious bone". The aware-name of the delicious bone is the "space probe". The clueless-description of the delicious bone is "[delicious bone status]." The aware-description of the delicious bone is "The Musashi-5 probe was severely damaged at some point during its journey[if the holder of the delicious bone is an animal] and even more so now that [the clueless-name of the holder of the delicious bone] is munching on it[end if], but its data have been downloaded to you and are safe." 

To say delicious bone status:
	if the player is rover:
		say "It is the biggest, juiciest bone you’ve ever scene. It smells like marrow";
		if the delicious bone is carried by the bulldog:
			say "The bulldog notices your interest in the bone, and the corners of his mouth rise, revealing sharp teeth";
	otherwise:
		say "It the bone the dog dragged in from the park. He's already gnawed on it a bit".
		
Instead of taking the delicious bone when the player is the acu:
	say "Rover growls mildly reminding you that it is [italic type]his[if the player is self-aware]space probe[otherwise]bone[end if][roman type]."

The Strange Porch is west of the Featureless Desert. The printed name of the the featureless desert is "The Park". The description of the Strange Porch is "You are right outside a strange house. [inconsequential outside detail]"

The Strange House is scenery in the strange porch.  The description of the Strange House is "A house just like where you and Janet live, except it doesn't smell like home. [inconsequential outside detail]"

The Splintered Door is west of the Strange Porch and east of the Studio.  It is an open not openable scenery door. The description of the splintered door is "The door of the stranger's house does not close all the way." 

The sky is a backdrop. It is in the Planet Area. The description of the sky is "Through the dust, you can see little more than dim light from above."

Chapter The Ginsu

The Ginsu Area [i.e., the Earth ship] is a region.  The Studio and the Galley are rooms in the Ginsu Area.

The description of the Studio is "[if The Studio is not visited]You walk into the building. There is a man here who looks old and grumpy. Like your home, this place has a sleep room and a food room. It looks like you've walked right into the sleep room.[paragraph break]The man yells at you and you tuck your head down. [quotation mark]Blah, blah, blah![quotation mark] He doesn[apostrophe]t seem to move though. Maybe he can[apostrophe]t move. You don[apostrophe]t feel so afraid of him.[otherwise]The stranger[apostrophe]s house is boring. The only furniture in the room is a bed. In one direction lies the eating room, in the other, the door that leads back to the park. The stranger is still here and carrying on, [rantings] You ignore him."

In The Studio is a man called the stranger. He is scenery. The description of the stranger is "The man seems flat like a rug, rather than round like a ball. He makes a lot of noise, but he doesn’t move around at all. Boy, does he seem mad, [rantings]!" The clueless-name of the stranger is "stranger". The aware-name of the stranger is "Myomita AI".

To say rantings:
 say "[quotation mark][one of]Blah, blah, blah, dog, blah, bad[or]Bad dog! Blah[or]Blah, blah, blah, blah, dog? Blah! Blah, blah[or]Blah, blah, blah, blah, blah, blah[or]Blah, out, blah, blah, dog[at random]![quotation mark]".

The pullout sofa is bed in The Studio. The pillow is a prop on the pullout sofa.

The description of the pullout sofa is "The sofa looks wrong somehow, like maybe it[apostrophe]s broken. It is more or less unfolded and looks even bigger than Janet[apostrophe]s futon." The clueless-name of the pullout sofa is "pullout sofa". The aware-name of the sofa is "casimir drive".

The Galley is north of the Studio.

The description of the Galley is "[if the Galley is not visited]You enter the eating room.[paragraph break][end if]The room has big cold box just like the eating room in your home. It[apostrophe]s less loud in this room, but you can hear the man in the other room yelling, [rantings]".

A cold box is a refrigerator in the Galley.  The description of the cold box is "A bright orange box, just like the one that Janet keeps food in at home." The aware-name of the cold box is "cryochamber". The clueless-name of the cold box is "cold box".
[there is no egg in the Ginsu's fridge because it's the same egg as in the Valkyrie. A byte saved is a byte earned.]

The water maker is a sink in the Galley. The description of the water maker is "A thing that people have in their homes.  They can get water out of it to put in your bowl." The clueless-name of the water maker is "kitchen sink". The aware-name of the water maker is "coolant output". 

The table is an enterable furniture in the Galley. The description of the table is "A big wooden table. Probably used for cooking stuff.[if nothing is on the table] Unfortunately, there is nothing, food or otherwise, on the table at the moment." The aware-name of the table is "reactor core". The clueless-name of the table is "table".

The bulldog water bowl and the bulldog food bowl are fixed in place bowls in the Galley.

The description of the bulldog food bowl is "[if the bulldog food bowl is not full]Even empty, the[otherwise]The [end if]bulldog's food bowl smells much better than yours." The clueless-name of the bulldog food bowl is "food bowl". The aware-name of the bulldog food bowl is "fuel reservoir".

The description of the bulldog water bowl is "[if the bulldog water bowl is not full]Even empty, the [otherwise]The [end if]bulldog's water bowl looks much better than yours." The clueless-name of the bulldog water bowl is "water bowl". The aware-name of the bulldog water bowl is "coolant reservoir".

Chapter Offstage
[Items that are tangible, but initially out of play] 

David Venkatachalam is a man. The description of David Venkatachalam is "David is of medium build, slightly bald, and has a pointed goatee. He is wearing a blue MARSpace flightsuit. [if audio is switched off]He is talking to Janet; you can see their lips moving." The clueless-name of David Venkatachalam is "David Venkatachalam". The aware-name of David Venkatachalam is "EXTERNAL".

Janet Xiang is a woman. The description of Janet Xiang is "Janet is short and athletic, with long brown hair. She is wearing the lavender summer dress that you picked up at a flea market last year. [if audio is switched off]She is talking to David; you can see their lips moving." The clueless-name of Janet Xiang is "Janet Xiang". The aware-name of Janet Xiang is "EXTERNAL". 

There are some assault ships. They are scenery. The description of the assault ships is "The black hulls of the Lamprey Class assault ships are barely visible against the background of space."

There are some gunships. They are scenery. The description of the gunships is "A tight cluster of highly maneuverable gunships, each of which mounts a single-powerful excimer laser."

[the window, skylights, park, grass, etc., are hidden when the drapes are drawn]

The window is a transparent scenery closed not openable container. The window can be on or off. The window is off. Understand "outside" or "outdoors" as the window. The clueless-name of the window is "window". The aware-name of the window is "viewer". The clueless-description of the windows is "[if the Real Thing is happening]The garden skylights are just coming on. They cast long shadows from a stand of Norwegian Spruce trees at the far side of the park[otherwise]The window is triple-paned pressure glass, mounted flush with the wall.  Through the window you can see [a list of things in the window][end if]." The aware-description of the window is "The external viewport [if the window is off]is off[otherwise]shows [a list of things in the window][end if]." The window-proxy is an aware-proxy which is part of the window. Understand "viewer" and "viewport" as the window-proxy.
		
Some garden skylights are in the window. The indefinite article of the garden skylights is "an array of". The description of the garden skylights is "Early morning sunlight piped from the surface of the planet shines brightly on the well-manicured lawn of the park." The clueless-name of the garden skylights is "skylights". The aware-name of the skylights is "viewer". Understand "lights" as the garden skylights.

The park is scenery in the window. The description of the park is "Lincoln Park is the largest park dome in Cydonia. Later today, you'd expect it to be full of people playing frisbee, picnicking and otherwise enjoying the great outdoors." The clueless-name of the park is "park". Understand "lincoln" and "dome" as the park. The aware-name of the park is "viewer".

Some grass is scenery in the window. The description of the grass is "A closely trimmed sea of luscious orange grass." The clueless-name of the grass is "grass". The aware-name of the grass is "viewer". Understand "orange" and "lawn" and "luscious" as the grass.

Some trees are scenery in the window. The clueless-description of the trees is "A line of tall, dark green [trees] stands at the far edge of the park." The clueless-name of the trees is "[if the trees are debated and the Real Thing is happening]Norway Spruce [end if]trees". Understand "tree", "douglas", "firs" and "fir" as the trees. Understand "norway" and "spruce" as the trees when the trees are debated and the Real Thing is happening. The aware-name of the trees is "viewer". The trees can be debated. The trees are not debated. 

After examining the window:
	debate trees.
	
After examining the trees:
	debate trees.
	
To debate trees:
	if the trees are not debated and the Second Sim is happening:
		now the trees are debated;
		let metatext be "David: Look, you can almost see my cottage over there, behind the Spruce trees.[line break]Janet: The Douglas Firs?[line break]David: No, I mean the Norway Spruce, over there.[line break]Janet: I know which one you mean, and believe me, they are Douglas Firs.[line break]David: I concede. Can we make up now?";
		say "[metatext in metaspeak]".

Limbo is a room. David Venkatachalam, Janet Xiang, the space probe, the assault ships, the gunships, the window, and the spruce trees are in Limbo.

Chapter Memories

Remembering is an action applying to one topic.  Understand "remember [text]" as remembering.  Understand "recall [text]" as remembering.  Understand "think about [text]" as remembering.

Carry out remembering:
	say "That doesn't ring a bell.";
	
Instead of remembering a topic listed in the Table of Remembered Stuff:
	if the player is self-aware:
		say "You consult your memory banks: ";
	say "[description entry][paragraph break]";
	if remember-invoked is false and (the First Sim is happening or the Second Sim is happening):[I hope parens work here, as I assume that "and" binds tighter than "or" operator]
		let metatext be "David: Why did we lose audio?[line break]Janet: I've muted the memories -- they are, after all, a bit personal. Besides, it's just back story for this mission.[line break]David: Fine, we'll skip the boring parts.";
		say "[metatext in metaspeak]";
	otherwise:
		if the topic is "David Venkatachalam" and (the First Sim is happening or the Second Sim is happening):
			if david-remembered is less than three:
				if david-remembered is 1:
					let metatext be "David: I think I'd like to have heard that one.[line break]Janet: Not a chance.";
				otherwise if david-remembered is 2:
					let metatext be "David: I’m half tempted to decompile the code just to see what it said about me.[line break]Janet: My code is not for the faint of heart. If you wander in there, watch out for grues.[line break]David: Grooze?";
				say "[metatext in metaspeak]";
			now david-remembered is david-remembered plus one;
	now remember-invoked is true.
	
Table of Remembered Stuff
topic							description
"trick" or "tricks"		"You recall that since Rover was a puppy, he[apostrophe]s been good at the basic tricks like sit, lay down, roll over, and kiss. During the war, he was also trained to rescue people trapped in cave-ins, and knows the command [quotation mark]dig[quotation mark]. Similarly, from the war, he knows the command [quotation mark]attack[quotation mark], but you doubt he would ever really attack anyone except to protect you."
"war"							"Five years ago, you were a graduate student in computational cognition when the situation with Earth deteriorated, and Earth ships attacked the colonial government. The fighting destroyed most of the surface installations in the first few days, but Earth backed down when Martian missiles struck Luna City, Beijing and São Paulo. Under terms of the treaty, the Martian government was granted autonomy, but Mars remains economically dominated by Earth, except for MARSpace."
"marspace"					"MARSpace began as an extension of the Myomita corporation space program, but was absorbed by the Martian government after the War of Independence. Before the war, MARSpace serviced almost all Condensate Drive vessels engaged in commerce between the Solar System and Earth[apostrophe]s Interstellar Territories. Since the war, MARSpace has slowly rebuilt, and its first Casimir Drive ship, the Valkyrie, is nearly ready for launch."
"me" or "self" or "myself" or "Janet"		"You are Janet Xiang, age 36, citizen of Mars, and employee of MARSpace. You grew up in the suburbs of Cydonia, and your mother taught Applied Cybernetics at U of C. Your father was an environmental technician who worked at the local reclamation center. Like many Martian women of your generation, you intended to wed early, and you were engaged to Tomasz Kowalski when the Independence War began. Tomasz was working in the power station located on Phobos when that moon was destroyed. The same day, you adopted your dog, Rover, whose owners were killed during an attack which destroyed part of the U of C. You have raised him from a puppy, and he is your most loyal friend."
"cydonia"							"You don't have many memories of Cydonia itself despite having grown up just a few klicks from the city center -- and it is not like you had time to go their as a graduate student. You recall Cydonia[apostrophe]s overly complicated public transport systems, the food vendors who ply the walkways with their tempting carts of fried food, and the tube-people who beg for money."
"mars"								"Mars has been home to your family for three generations, your grandparents having been life contractors for the Myomita corporation. Since its colonization by national and later corporate entities beginning more than two hundred years ago, Mars has been subservient to the interests of Earth. Since the Independence War, the situation has improved, and income from off-world commerce is slowly balancing the equation."
"rover"							"Rover is your dog, a five year old dalmation. When his original owners were killed during the Independence War, you adopted him as a puppy. He is a clever dog, and you have taught him to perform a number of tricks on command. Rover is house trained, but loves to explore outside. He can be trusted to go out on his own, and always comes back."
"david" or "venkatachalam"	"David Venkatachalam, age 42, citizen of Mars, and Project Leader for the Valkyrie program. David was raised in an undersea community just north of Sri Lanka, so he had less difficulty adapting to Mars and its life support requirements than most Earthers. He studied mathematics in New Delhi and Novosibirsk before working on theoretical aspects of the Casimir propulsion system at Myomita Corporation in Sapporo. He was cut off from Earth by the events preceding the Independence War, and after the war naturalized as a Martian Citizen, joining the Valkyrie program at MARSpace. David is single, attractive, and most importantly, he likes dogs."
"ACU"									"Your project for the last two years has been design of the autonomous control unit, an artificially intelligent agent that controls all operations aboard the Valkyrie. Originally, the ACU would have been modeled on synaptic scans of experts from relevant fields of study, but given the short time frame, you have only had time to incorporate your own synaptic scans and you have jury-rigged the ACU-to-ship interface."
"valkyrie" or "ship"						"The potential for interstellar commerce has been constrained by time and distance. Although Condensate Drive has allowed vessels to reach nearby stars, it is expensive and slow, and holds little promise for commercial exploitation. The Valkyrie is the first ship to incorporate Casimir Drive, giving it unprecedented speed and range. It is rumored that since the Valkyrie project fell into MARSpace hands after the Independence War, Earth[apostrophe]s Myomita corporation has been working on a sister ship based on similar technology."
"helium" or "heavy helium"							"Heavy helium is consumed as a fuel in fusion reactors, including the fusion rockets aboard the Valkyrie. Heavy helium is confined in a magnetic bottle, and the reaction is initiated by a flash of tightly concentrated laser energy. Subsequently, the reaction is self-sustaining. Mars has limited production capacity for heavy helium, and the isotope is scarce and understandably expensive."
"casimir" or "casimir drive"							"Casimir, or zero-point energy drive, was developed in the last ten years. By doing largely incomprehensible things to time/space, the Casimir Drive can translate a ship incredible distances in a fraction of the time and energy that would be required by a ship equipped with Condensate Drive. The one drawback to Casimir technology, at least in its current implementation, is that such trips are lethal to biological organisms, hence the need for the ACU."
"myomita" or "myomita corporation"							"The Myomita Corporation is Earth's largest zaibatsu, with a strangle hold on Earth's computer and space exploration sectors. For all intents and purposes, Myomita [italic type]is[roman type] Earth[apostrophe]s government. The company is based in Kyoto, but has offices throughout the Solar System. The company is controlled by the Ishegawa family, who follow a profit-oriented reinterpretation of the bushido code. The company is ruthless and unforgiving, but unquestionably successful."
"probe"							"In 2108, shortly after the invention of Condensate Drive, the Myomita Corporation launched a number of deep space probes from their Martian Headquarters at Cydonia. More than thirty probes were launched, programmed to jump from system to system in search of planets with evidence of life. Refueling from the stellar wind in each system, the probes were designed to return only if successful. Three months ago, the Mushashi-5 transponder signal was detected, originating at a planet 38 light years from Earth. According to the telemetry, the probe was returning to the Solar System when it crashed. Both Mars and Earth have claimed ownership of the probe and the data it contains, and have mounted a program to retrieve the probe from where it crashed almost four decades ago."
"windex"						"A proprietary computer operating system owned by the Myomita Corporation."
"inform"						"An interpreted computer language originally designed for interactive fiction. The Valkyrie's ACU controls the ship through an interface implemented entirely in Inform version 10.5.4."
"interactive fiction"		"Any of a number of literary forms implemented as an immersive, interactive experience. Interactive fiction (IF) arguably began with primitive text-based [quotation mark]adventure[quotation mark] programs in the 20th century, and has matured in parallel to technology. Today, IF dominates the entertainment industry, and IF programmers are among the most highly valued members of society."
"flosix"						"A modern operating system supported by a community of users throughout known space."	

Chapter Dreams

Table of Dreams
index		description		comment
1	"Rover draws pensively on his stubby cigar, the tip glowing red below his dealer's hat. He paws nonchalantly at the scotch and water he has been nursing for the last half hour. Despite the tower of chips in front of him, he's either in trouble now, or trying to play the rest of the table for suckers. His tail is no longer wagging, though, and you suspect that the scotch may be getting the better of him. He can't mass more than about 30 kilos, and he's been putting them away tonight. You push all in, figuring that even if you lose it all, at least you'll get some sleep before you need to get back to the MARSpace. Elva the cleaning lady folds, as does Isaac Asimov and that boy that you kissed in fourth grade. Wait...don't go....where is everyone going?"	"David: You have some weird dreams.[line break]Janet: You can't hold me responsible for the subconscious ramblings of the ACU."
2	"The alarm clock rolls into a ball, and flies the length of the vehicle construction facility, chased by an eager, slobbering dalmation. In the Martian gravity, Rover bounds three meters into the air and sails over the heads of an annoyed crew in cleanroom suits working frantically on the Valkyrie's starboard Casimir Drive assembly. The mission director, David Venkatachalam, grimaces, but your mother offers you a comforting cup of tea."		"David: The ACU certainly has that dog on its mind.[line break]Janet: Well, I do think about Rover a lot. Besides, the Rover is central to the mission, so a lot of the code is dedicated to the Rover.[line break]David: Was that what it was like?[line break]Janet: Yes, that was the last day of War of Independence."	
3	"A pudgy puppy hastily rounds a corner, sliding awkwardly on the polished dormitory floor. Behind it, there are flashes of light, and a rolling cloud, a mixture of smoke and Martian atmosphere. As the above-ground structures are ripped apart and lose pressure, the shivering ball of white fur leaps into your arms, burying its snout in the fold of your elbow. The Earth missiles continue to pound the university, but cannot penetrate to this depth. Huddled under a sturdy desk, you pet the frightened dog and hug it tight."		"David: Do you always hit the snooze button so many times?[line break]Janet: Yeah. That[apostrophe]s why the alarm is set so early -- I don't have to be at the spaceport until 08:30. It serves its purpose in the simulation, though. Minimal resources are expended on each wake cycle, but if there were a problem during the approach, the ACU would elevate to full op status rapidly.[line break]David: I don[apostrophe]t really make that expression do I? I looked pouty.[line break]Janet: All the time, but I like the word [quotation mark]petulant[quotation mark] better than [quotation mark]pouty[quotation mark].[line break]David: I’ll stick with pouty."
4	"Rover sniffs the air and tears away from the picnic blanket. You and Tomasz watch with surprise as he runs, for once, away from the food. Rover bounds over the hedges, howling wildly, and spooks a xihuahua which had been playing with a tiny red ball. The so-called [quotation mark]shaved rat[quotation mark] gulps an oversized portion of air, extends its membranous ears and flys across the park into the arms of a douty grey-haired woman with a cane. Rover picks up the ball triumphantly, ignoring the piercing wavetrain of yips and indignant scolding coming, respectively, from the xihuahua and its owner. Shaking her cane limply towards Rover, she admonishes in an a strong Earth accent [quotation mark]That mongrel should be on a leash![quotation mark] Her own, unleashed, uncollared neodog stares accusingly from the safety of her arms, its distensible ribs alternately inflating and deflating like bellows. [quotation mark]Your kind is ruining Mars, ignoring every law, dissing your elders! You never lived on the surface, you never don't know what you've got![quotation mark]. You try to give the ball back to her, but she pushes it away in disgust, [quotation mark]Kids. Meh.[quotation mark]"		"David: Hey, different dream sequence. Is it glitching?[line break]Janet: No, the ACU's dreams are heavily influenced by power-up state of the processor and internal noise.[line break]David: Good, I'd hate to think that we wasted two weeks of programming.[line break]Janet: I wouldn't say wasted.[line break]David: Huh? I didn't mean us.[line break]Janet: Cross you fingers and hope the whole thing doesn't crash again on the heat lamp."
5	"The image of Tomasz blinks momentarily as the relay is handed off from ground station to ground station, trying to keep line of sight to Phobos. Behind him, you can see the tubular structure of the power station jutting over the edge of Stickley Crater. He is taking the news rather well, all things considered. Tomasz guesses your thoughts as you glance at your diamond engagement ring. [quotation mark]Don’t sweat it,[quotation mark]he says. [quotation mark]This whole rock is carbon, so plenty more where that came from.[quotation mark] There is blinding flash of light and the screen goes black."			"David: Is the ACU referring to me?[line break]Janet: As much as I’d like to say [quotation mark]yes[quotation mark], I don’t see how. The synaptic scans were frozen before we started seeing each other.[line break]David: Maybe you[apostrophe]ve had your eye on me for longer than you think.[line break]Janet: I wonder how many relationships have been ruined by armchair psychoanalysis?"
6	"A dwarf emerges from under the kitchen sink, spilling dog chow all over the floor. He throws you a menacing look, pries the fridge open with a black rod, and snatches an egg off the shelf. Sand pours out of the fridge. [quotation mark]Hey,[quotation mark] you yell from the futon, [quotation mark]put that back[quotation mark]. You stop short, realizing that this sort of distraction is exactly why you haven’t completed your dissertation. You feel around under the futon, where you think you will have put the dissertation so you could find it in the past, and grab the stubby snout of a pig. The fleet-footed porcine slaps a fish into its ear, jumps into a dumbwaiter and disappears."			"David: That was surreal.[line break]Janet: And sometimes a cigar is just a cigar.[line break]David: Indeed."
7	"Even mildly drugged and reclining on an overstuffed couch in the MARSpace human resources office, it's hard to relax in the presence of the MARSpace political officer conducting the final interview. You didn't catch her name, probably because she never mentioned it. After three such interviews and six months of background check, what more could they want?  [paragraph break][quotation mark]Ms. Xiang, thank you for your cooperation. Your tests show no hint of disloyalty to the Republic or MARSpace. We hope you understand the need for these measures, particularly for personnel with access to the Valkyrie's command and control functions. Now that you are cleared, I can inform you that credible sources have warned that the project may have been infiltrated by[quotation mark]"	""

Chapter Menus

Understand "help" or "hint" or "hints" or "about" or "info" as asking for help.

Asking for help is an action out of world.

Carry out asking for help:
	change the current menu to the Table of Options;
	carry out the displaying activity;
	clear the screen;
	try looking.

Table of Options
title	subtable	description	toggle
"What is this?"		Table of Adventures	""	--
"How does this work?"	Table of How		--		--
"Help! I'm stuck!"	Table of Stuck	--	--
"Entomology"		Table of Bugs	--	--
"Acknowledgements"	Table of Acknowledgements	--	--
"License"		Table of License	--		--

Table of Adventures
title	subtable	description	toggle
"Adventure Games"	--	"It is hard to imagine a time when interactive fiction was not a daily part of people's lives, but just a few centuries ago, when your great-grandparents were still using digital computers, the first adventure games were written as a form of entertainment. These early games lacked experiential displays and neuroendocrine interfaces, but they still managed to convey a story in which the player could take an active role and change the course of events. Up until then, stories had only been available as static archives encoded with pigment on biostarch films. Even in the first generation of games, around the turn of the 21st Century, the computer presented a situation to players, and players decided what they would do next. Given the technology of the time, instructions were often very simple, just a verb or maybe a verb and a noun.  Players would say their action (or, in an earlier era, enter it using a piano-like keyboard), such as [quotation mark]look[quotation mark], or [quotation mark]get key[quotation mark] and the computer would react to that action, further advancing the plot. Today, children are exposed to interactive fiction from their first days in creche, and interactive fiction is the cornerstone of the Martian economy."	--
"Learn More"		--		"There are a number of good online resources regarding interactive fiction; presumably you can find these on your own. We can recommend two well-written summaries which date back more than three centuries. The Inform Design Manual by Sir Graham Nelson contains a few chapters on the history of the interactive fiction, as well as some observations and recommendations for both game designers and players. Twisty Little Passages by Nick Montfort, an academician at MIT (Earth campus), is a more literary treatment of the same subject. First editions of both works are on display in the special collections section of the University of Cydonia."	--

Table of How
title	subtable	description	toggle
"How To Play"	--	"Most adventure games are turn-based, rather than timed. Take as long as you want to think about your actions. The game gives you some information, like a description of the room that you are in, and what objects it contains, and then it is up to you to say what you are doing. You can enter your [quotation mark]move[quotation mark] by typing it at the command prompt, which looks like a [quotation mark]greater than[quotation mark] sign: >[paragraph break]For example, let's say you are in the kitchen, and there is an avocado on the counter. To get more information about the avocado, you could say [quotation mark][fixed letter spacing]examine avocado[variable letter spacing][quotation mark], and learn what it looks like.[paragraph break]Not every command that you can think of will work, so you might need to try some rephrasing. In general, you should not use punctuation. The only exception is when you want to direct a question or command to someone or something else. In such cases, you can say the name of the person or thing to whom you are addressing your remark, followed by a command and then the question or command. For example, you could say:  [quotation mark][fixed letter spacing]Eugene, give me the axe[variable letter spacing][quotation mark]."		--
"Commands"	--		"If you have played other adventure games, chances are that you already know most of the [quotation mark]utility[quotation mark] commands used in this game. If not, however, you should start on an equal footing with more experienced players, so here they are:[paragraph break]
[fixed letter spacing]   look         - [variable letter spacing]look at your surroundings[line break]
[fixed letter spacing]   examine      - [variable letter spacing]look at something in detail[line break]
[fixed letter spacing]   go           - [variable letter spacing]followed by destination/direction[line break]
[fixed letter spacing]   take/drop    - [variable letter spacing]pick up or drop an item[variable letter spacing]"	--
"Common Actions"	--	"Since you are likely to do some actions frequently, there are some short cuts. You can use the letter in [fixed letter spacing]<brackets>[variable letter spacing] instead of typing out the whole word for the following:[paragraph break]
[fixed letter spacing]   <i>nventory      - [variable letter spacing]what are you carrying?[line break]
[fixed letter spacing]   <l>ook           - [variable letter spacing]describe the area around you[line break]
[fixed letter spacing]   e<x>amine        - [variable letter spacing]examine a specific item in detail[line break]
[fixed letter spacing]   <z>zzzz          - [variable letter spacing]don't do anything; just wait for a bit[line break]
[fixed letter spacing]   a<g>ain          - [variable letter spacing]repeat your last action[line break]
[fixed letter spacing]   <o>ops           - [variable letter spacing]type this to correct spelling mistakes[variable letter spacing]"	--
"Conversation"	--	"A couple of verbs are helpful for conversation; these
  include:[paragraph break]
[fixed letter spacing]   SAY  [variable letter spacing]something[line break]
[fixed letter spacing]   TELL [variable letter spacing]someone[fixed letter spacing] ABOUT [variable letter spacing]some topic[line break]
[fixed letter spacing]   ASK  [variable letter spacing]someone[fixed letter spacing] ABOUT [variable letter spacing]some topic[line break]
[fixed letter spacing]   SHOW [variable letter spacing]someone something[line break]
[fixed letter spacing]   SHOW [variable letter spacing]something[fixed letter spacing] TO [variable letter spacing]someone[paragraph break]With all of these commands, you do not need to, indeed you should not, use quotation marks."		--
"Saving and Restoring"	--	"Assuming there is free space on your machine, you can save games and then reload them later. You can make multiple save files. You can also restart a game (wiping out the current game). In an act of desperation, you can quit.[paragraph break]
[fixed letter spacing]   SAVE      - [variable letter spacing]save the game at the current point[line break]
[fixed letter spacing]   RESTORE   - [variable letter spacing]load and then continue the game[line break]
[fixed letter spacing]   RESTART   - [variable letter spacing]start over again[line break]
[fixed letter spacing]   QUIT      - [variable letter spacing]a last resort!"	--

Table of Stuck
title	subtable	description	toggle
"General Pointers"		--		"Here are some practical pointers for this game:[paragraph break]* Try everything you can think of. If it doesn't work, try rephrasing.[line break]* Reread text to make sure you didn't miss anything.[line break]* Leave no stone unturned; conversely, don't obsess.[line break]* This game follows many, but not all, of the conventions of computer adventure games. If something makes sense to you, try it even though it [quotation mark]shouldn't work[quotation mark].[line break]* As far as we know, it is not possible to get trapped in an unwinnable situation. By winning, we mean you can complete the game. Achieving good outcomes is another matter.[line break]* If you are really stuck, put the game aside and let it percolate through your subconscious for a while. Come back fresh.[line break]* If you are really really stuck, con someone else into playing the game and watch them. You might get some ideas.[line break]* If you are really and truly stuck, you could search the Internet 
  and see if someone has already posted a similar question/answer. Since you could be playing this years after it was released, maybe we've even created a FAQ about it. If you do post a question or answer, preface your message with a spoiler warning and skip down a bunch of lines before writing anything too revealing.[line break]* Failing all else, you can email us at: rover@templaro.com and tell us in detail how our game has defeated your best efforts. We may be able to give you a hint that wouldn't spoil the rest of the game for you."		--
"Hints"	--	"The game does not presently have a specific hint system."	--
"Spelling"	--		"This game employs the standard Martian dialect and Roman characters rather than the ideographic characters more common on Earth."	--

Table of Bugs
title	subtable	description	toggle
"A Matter of Interpretation"		--	"This game is designed to run on a virtual machine, the z-machine. You are, no doubt, using some implementation of the z-machine written for your specific hardware -- it could be your entertainment corner, hologoggles, dishwasher, cortical implant -- whatever.  Even if you are using some old silicon-semiconductor clunker from the international days, it should still work. Some implementations are more faithful to the z-machine standard than others, though, and if your z-machine interpreter is too far off the standard, the game might not run as intended. We've made every effort to test it on a number of platforms, but these tests are far from comprehensive. So far as we know, there are no interpreter-specific issues.  However, if the 
  game doesn't run right for you, you could try another z-machine interpreter and see if that fixes the situation. Whether you think the problem is interpreter or the game itself, we'd appreciate it if you'd let us know. (see [quotation mark]Zapping Bugs[quotation mark])"	--
"Zapping Bugs"	--		"Help us splotch bugs! In this case, we're not referring the plastic-eating cockroaches responsible for so many dome failures in the last few years, but errors in the game itself. This game was, in part, written by humans, so eras are all but certainly present. The more freedom you have in your actions, the more likely it is that you'll expose some unknown weakness in the game. What should you do if you elicit such an error?  First, you can gloat for a reasonable amount of time (this is a judgement call) about how very slick you are to have uncovered the hitherto unknown fault. Then, you can be a good citizen and us know about it so we can fix it in the next update, and spare the next several billion people the same painful experience. There's no monetary reward for finding errors, but your name will appear on the next version of the ultra-prestigious bug finders list. Now [italic type]there's[roman type] something you can show to your grand-children with pride. Report bugs to:[paragraph break]rover@templaro.com[paragraph break][quotation mark]Splotches welcome.[quotation mark]"		--

Table of Acknowledgements
title	subtable	description	toggle
"Beta Testers"	--	"Who are the fearless, dedicated individuals who put their very lives on the line to test this game?[paragraph break]* John Doe, Sleepy Hollow[line break]* Jimmy Tester, Utopia Planetia[line break]* Betty TestSweet, Lake Eridania[line break]* Joe Keypounder, Deimos Colony[paragraph break]Note: Any omissions, errors, or outright offensive bits of the game that made it through beta-testing are not the fault of the beta-testers, nor, we should point out of the authors, who would take be entirely ready to take the blame were it their fault. The truth is that any fault whatsoever lies with Richard Millhouse Nixon, the 37th (depending on the method of counting) President of the United States of America. We will be held accountable for his poor spelling, loose grammar, and penchant for elaborate data structures named after the suprising numerous flavors of goat cheeses."	--
"The Ultra-Prestigious Bug Finder List"	--	"So far, no one aside from beta testers has reported a bug... you could be the first..."	--
"Giant Shoulders"	--	"This is built upon work... Graham for Inform, Emily and others for modules ###TODO - finish this as game nears completion."		--
"Consultants"	--		"During writing, on several occassions we asked the community for help and advice...Rob Newcomb, Andrew Plotkin, etc. ###TODO - flush this out as game nears completion."	--
"Animals"		--		"No animals, not even cybernetic ones, were harmed in the creation of this work."	--

Table of License
title	subtable	description	toggle
"Creative Commons License"	--	"This game is released under the Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States license. As a consequence, you are free to copy, distribute, display and use this work and to make derivative works under the following conditions:[paragraph break]Attribution. You must attribute such works mentioning our names [story author] and the title of this work [quotation mark][story title][quotation mark]. This can 
  appear in the title, with the Release Information, or in the 
  acknowledgements section of a menu system. Attribution does not 
  suggest my endorsement of derivative works or their authors.[paragraph break]Noncommercial. You may not use this work for commercial purposes.[paragraph break]Share Alike. If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.[paragraph break]If you would like a copy of the Inform7 source for this game, please let us know by email: rover@templaro.com"	--

Chapter Status Line Magic

[See the "every turn" and "initialize" sections to understand how this works.  Big thanks to Andrew Plotkin and Ron Newcomb for helping with this stuff.]
Last-noun, last-success, and the status-line-action are texts that vary.
Last-noun is usually "ACU".  Last-success is usually "NIL".   Status-line-action is usually "NOOP".
Test-action is an action-name which varies.
Got-action is a truth state that varies.  Got-action is usually false.

         
After reading a command (this is the re-initialize rule):
        change last-noun to "ACU"; 
        change last-success to "NIL";
        change the status-line-action to "NOOP";
        change got-action to false.

First before an actor doing something (this is the catch failed actions rule):
	if got-action is true:
		do nothing;
	otherwise:
		if the action-name part of the current action is a verb listed in the Table of Technoverbs:
			change got-action to true;
			change the status-line-action to technoverb entry;
	if the noun is something then change last-noun to "[aware-name of the noun]".

First after an actor doing something (this is the catch successful actions rule):
	if got-action is true:
		do nothing;
	otherwise:
		change got-action to true;
		change test-action to the action-name part of the current action;
		if test-action is a verb listed in the Table of Technoverbs:
			change the status-line-action to technoverb entry;
		otherwise:
			if test-action is:  [ignore these actions, they shouldn't be reported]
				-- the memory-updating action:
					continue the action;
				-- otherwise:
					say "(Note:  [test-action] isn't in technoverb-table)" in metaspeak;
					continue the action;
	if the noun is something then change last-noun to "[aware-name of the noun]";
	change last-success to "TRUE";
	continue the action.


[a first approximation here:  we're going to need a system to make special exceptions for certain situations.  We should probably map all of the Actions listed in the game-generated index!]

Table of Technoverbs
Verb				Technoverb
the going action			"SELECT"  [go, or any compass direction]
the taking off action		"DISENGAGE"  [take off, remove]
the wearing action		"ENGAGE"  [put on, wear]
the taking action		"SELECT"  [take, get]
the dropping action		"DESELECT"  [drop]
the inserting it into action	"TRANSFER"  [put]
the searching action		"MANIFEST"  [look in]
the looking action		"STATUS"  [look]
the examining action		"DIAGNOSTIC" [examine, read]
the entering action		"ACTIVATE"  [enter, sit on]
the exiting action		"DEACTIVATE" [exit, stand up]
the opening action		"ACCESS"  [open]
the closing action		"DEACCESS" [close]
the eating action		"RECYCLE"  [eat]
the pushing action		"APPLY"  [press]
the remembering action		"DATA_FETCH" [remember]
the dreaming action	"RANDOMIZE ADDRESS SPACE" [dream]
the rubbing action		"ENERGIZE" [rub, clean, scratch]
the touching action		"UPDATE" [touch]
the folding action		"RETRACT" [fold]
the unfolding action	"EXTEND" [unfold]
the reading action		"READLINE" [read]
the putting it on action	"TRANSFER" [put on]
the cracking it into action	"DISCHARGE" [crack, break, etc.]
the taking inventory action		"MANIFEST" [inventory]
the switching on action	"TRIGGER"		[turn on, switch on]
the switching off action 	"RESET"		[turn off]
the yoking it more action	"VECTOR ADJUST" [push, pull, twist...plunger]

[some other verbs to deal with later, probably.  Their proper gerundives need to be discovered or defined:
	
waiting
flossing
brushing
looking under
 

"fill"		"ADD"
"scratch"		"NEUTRALIZE STATIC CHARGE"
"wake"		"INITIALIZE"
"sleep"		"SUSPEND"
"give"		"DISPENSE"
"flush"		"THRUST"
"roll over"	"LATERAL JETS"
"lay down"	"DEFENSIVE MODE"
"lie down"	"DEFENSIVE MODE"
"attack"		"OFFENSIVE MODE"
"kill"		"OFFENSIVE MODE"
"sit"		"STANDBY"
"kiss"		"SHIP INTERFACE"
"dig"		"MINING SUBSYSTEM" ]

Chapter Triggered Events

At the time when the player is self-aware:
	change the command prompt to "READY>";
	
After reading a command:
	let N be indexed text;
	let N be the player's command;
	replace the regular expression "\b(ask|tell|order) (.+?) to (.+)" in N with "\2, \3";
	change the text of the player's command to N.

Chapter Every Turn

Every turn:
	[update memory usage]
	try memory-updating;
	change the right hand status line to "Memory: [current memory usage].[a random number from 0 to 9] PB";
	[update prompt]
	if the player is self-aware:
		change the command prompt to "READY>";
	otherwise:
		change the command prompt to ">";
	[avoid penalizing time for non-actions, a nuance]
	if the current action is taking inventory or the current action is looking:
		change the time of day to 1 minute before the time of day.


[	say "action: [current action][line break]"; 
	say "action-name: [action-name part of the current action][line break]"; 
	if the noun is something: 
		say "noun: [noun][line break]"; 
	if the second noun is something: 
		say "second noun: [second noun][line break]"; ]
		
Book 2  Scenes

Chapter Bedtime

Bedtime is a recurring scene. Bedtime begins when the ACU is asleep. Bedtime ends when the player is not enclosed by the futon. 

[unfortunately, there is no way to "locally" zero the scene, so that you could, for instance, "look for the first time" during the first simulation and again during the second simulation]

Bedtime-did-look is a number that varies.
Bedtime-dream-sequence-complaint is a truth state that varies. Bedtime-dream-sequence-complaint is false.
Bedtime-did-examine-button is a truth state that varies.
Bedtime-did-examine-flight-suit is a truth state that varies.
Bedtime-did-examine-player is a truth state that varies.
Bedtime-did-take-inventory is a truth state that varies.
Bedtime-did-examine-alarm-clock is a truth state that varies.

To ResetBedtime:
	now Bedtime-did-look is 0;
	[note: bedtime-dream-sequence-complaint is not reset]
	now Bedtime-did-examine-button is false;
	now Bedtime-did-examine-flight-suit is false;
	now Bedtime-did-examine-player is false;
	now Bedtime-did-take-inventory is false;	
	now Bedtime-did-examine-alarm-clock is false.

When Bedtime begins:
	ResetBedTime;
	now the player is groggy.
	
Every turn during Bedtime:
	try beeping;
	if a random chance of 1 in 12 succeeds:
		say "[one of]Rover howls; clearly, he is not very fond of the alarm clock either[or]From somewhere in the cottage, Rover sneezes loudly to let you know that he's annoyed by the alarm clock[or]Rover scratches at the side of the futon[or]Rover tip-taps loudly across the living room floor[or]Rover is licking your right arm with gusto. Either you really taste good or he really wants you to get up. Rover tugs on your arm[at random].";
	
When Bedtime ends:
	now the player is alert;
	now the IPL_pid is the turn count;
	if dream index is greater than one and bedtime-dream-sequence-complaint is false:
		let metatext be "David: Thank you. I can only take so many dream sequences.[line break]Janet: No problem. So, at this point, the Valkyrie would be at the edge of the probe's stellar system, and ready to switch over from Casimir to Condensate Drive and begin the approach.";
		say "[metatext in metaspeak]";
	if First Sim is happening:
		now arm-numb is 1.

	
Instead of doing something other than beeping, dreaming, opening, closing, waiting, looking, listening, examining, exiting, getting off, pushing, reading, remembering, rude-awakening,  snoozing, touching, waking up, memory-updating, or taking inventory during Bedtime:
	say "[one of]First things first, you're still in bed[or]Six impossible things before breakfast is one thing, but you have to at least get out of bed[or]Not while you're in your futon, you won't[or]Maybe after you get up[at random].";
	say paragraph break;

Instead of examining the player when the Bedtime-did-examine-player is false during bedtime:
	now Bedtime-did-examine-player is true;
	say "Laying down. Wearing pajamas. That's all the description you can handle at this time in the morning." 
	
Instead of taking inventory when Bedtime-did-take-inventory is false during bedtime:
	now Bedtime-did-take-inventory is true;
	say "You are carrying nothing, which is more often than not the case when you wake up most days."
	
Instead of examining the flight suit when the Bedtime-did-examine-flight-suit is false during bedtime:
	now Bedtime-did-examine-flight-suit is true;
	say "Actually, you are wearing a plain blue flight suit just like the one that pilots wear. It has a MARSpace insignia, and some lettering."
	
Instead of examining the alarm clock when Bedtime-did-examine-alarm-clock is false during bedtime:
	now Bedtime-did-examine-alarm-clock is true;
	say "Alarm clock. That annoying alarm clock. The alarm clock is beeping." 
	
Understand "pajama" and "pajamas" as the flight suit when bedtime is happening.	
	
Instead of looking when Bedtime-did-look is zero during First Sim:
	now Bedtime-did-look is Bedtime-did-look plus one;
	do nothing. [to avoid the room description at the start of bedtime, to convey the sense that the beeping of the alarm clock is waking the player].
	
Instead of looking when Bedtime-did-look is less than five during bedtime:
	now Bedtime-did-look is Bedtime-did-look plus one;
	if the player is not enclosed by the bed: 
		do nothing;[suppresses the "look" after the player is moved to the living rm]
	otherwise:
		say "[one of]Alarm clock. Next to bed. Make it stop[or]Must wake up. Eyes blurry[or]Morning difficult. Alarm on. Turn off alarm[or]Evil, evil beeping alarm clock. So loud. Stop the beeping[stopping]."
		
Instead of taking the alarm clock during Bedtime:
	say "[one of]You reach clumsily in the general direction of the alarm clock and graze the over-sized snooze button[or]You fumble with the alarm clock and accidentally push the snooze button[or]In your early morning stupor, you squeeze the alarm clock like a water melon pit, sending it even nearer to the edge of the bed and incidentally hitting the snooze button[or]You poke the clock smartly in the middle of the snooze button[or]The alarm clock tumbles off the bed, but you catch it before it hits the ground. Setting it back on the bed, you depress the snooze button[or]A dalmation paw beats you to the alarm clock and scrapes the snooze button before you even have a chance to accidentally do it yourself[at random].";
	try snoozing.
	
Instead of switching on or switching off the alarm clock during Bedtime, try taking the alarm clock.
	
After examining the large button when the Bedtime-did-examine-button is false:
	now Bedtime-did-examine-button is true;
	let metatext be "David: You could use a new alarm clock.[line break]Janet: You could increase my salary.";
	say "[metatext in metaspeak]".
	
After dreaming:
	let metatext be the comment corresponding to the index of dream index in the Table of Dreams;
	if metatext is not "":
		say "[metatext in metaspeak]".

Instead of attacking, touching, switching on, or switching off the large button during bedtime:
	try pushing the large button.

Instead of pushing the large button during bedtime:
	say must have more sleep;
	try snoozing.
	
Instead of waking up during bedtime:
	say "Gathering your resolve, you slowly slide off the side of the futon, inadvertantly sending the alarm clock on a death spiral behind the futon. Oh well, you can dig it out tonight. Meanwhile, you slowly stand up, recapitulating millions of years of evolution in a few seconds.";
	move the alarm clock to Limbo;
	move the player to the living room.
	
Instead of getting off during bedtime:[context is everything]
	try waking up instead.
		
To say must have more sleep:
	say "[one of]With as much coordination as you can muster in the morning, you brush your fingers over the snooze button[or]Your fingers drum reflexively against the snooze button[or]The snooze button clicks[or]The weight of your hand lands on the snooze button[or]You press the snooze button[at random].".
	
Dreaming is an action applying to nothing.
	
Carry out dreaming:
	say description in row dream index of the Table of Dreams;
	say paragraph break;
	wait for any key.

Beeping is an action applying to nothing.
	
Carry out beeping:
	say "<beep> <beep> <beep>";
	say line break.
	
Snoozing is an action applying to nothing.

Understand "snooze" as snoozing.

Understand "sleep" as snoozing when bedtime is happening.

Check snoozing:
	if (the dream index is 3 and First Sim is happening)
		 or (the dream index is 6 and Second Sim is happening):
		try rude-awakening instead. 

Carry out snoozing:
	now dream index is dream index + 1;
	try dreaming.
	
Instead of snoozing when bedtime is not happening:
	say "You're too wired to snooze!"
	
Rude-awakening is an action applying to nothing.

Carry out rude-awakening:
	say "As you reach for the alarm clock, your excited dog deftly bats it off the cushion with his tail. The clock tumbles behind your futon and thuds smartly as it hits the floor, ending the beeping. Rover looks puzzled that the noise has stopped.[paragraph break]Realizing that without the alarm clock you would probably sleep through the entire day, you reluctantly get out of bed.";
	move the alarm clock to Limbo;
	move the player to the living room.
	
Instead of listening during bedtime:
	say "You hear a little something like...".
	
Instead of searching or looking under the futon:
	say "It's too early to delve into the dust-bunny infested recesses of the futon. Certainly not before some strong coffee."

Chapter Arm Hurts

Arm Hurts is a scene. Arm Hurts begins when Arm-numb is one.

Arm-numb is a number that varies. Arm-numb is zero.

Arm Hurts ends when arm-numb is zero.

When Arm Hurts begins:
	say "As you get out of bed, you notice that your left arm is numb -- must have been the way you were sleeping."
	
When Arm Hurts ends:
	if the First Sim is happening: [suppresses message at start of second sim if Arm Hurts was not resolved before the First Sim ended -- e.g., if the player manages to press the black plate before rubbing the left arm]
		let metatext be "David: Is the the gimbal lock part of the script?[line break]Janet: No, that's the point of the ACU -- it isn't a set script. As we throw malfunctions at it in these simulations, the ACU responds appropriately.[line break]David: Like you would.[line break]Janet: Subject to the resolution of the synaptic scan, yes.";
		say "[metatext in metaspeak]".

Every turn during Arm Hurts:
	now Arm-numb is Arm-numb plus one;
	if Arm-numb is greater than 36:
		say "The pain in your left arm is so strong that you can think of little else!";
	otherwise if Arm-numb is greater than 24:
		if a random chance of 1 in 2 succeeds:
			say "[one of]Your left arm is rather painful[or]You are unconfortable; your left arm hurts[or]Something is not at all right with your left arm, it feels alternately numb and painful[at random].";
	otherwise if Arm-numb is greater than 12:
		if a random chance of 1 in 3 succeeds:
			say "[one of]Your left arm is bothering you[or]You feel sharp little pains in your left arm, like little pin pricks[or]Your left arm is smarting a bit[at random].";
	otherwise if Arm-numb is greater than 2:
		if a random chance of 1 in 4 succeeds:
			say "[one of]Your left arm is all pins and needles[or]Your left arm feels weird[or]There is a strange, electrical sensation running up and down your left arm[or]You left arm feels strange. Not quite itchy, not quite painful[at random].";

Instead of doing something during Arm Hurts:
	if arm-numb is greater than 36:
		if the noun is left arm and the current action is examining, rubbing, or touching:
			continue the action;
		otherwise if the current action is memory-updating or waving hands:
			continue the action;
		otherwise:
			say "You can't! Your arm hurts too much. [run paragraph on]";
	otherwise:
		continue the action.
		
Instead of waving the left arm during Arm Hurts:
	try waving hands.
		
Instead of waving hands during Arm Hurts:
	say "You flail your left arm back and forth, slowly restoring feeling. [if arm-numb is greater than 30]It's a great relief![otherwise if arm-numb is greater than 20]That's much, much better[otherwise if arm-numb is greater than 10]Ah, the tingling has gone away.[otherwise]That did the trick. Your left arm is back to its old, frisbee-throwing self[end if]."; 
	now arm-numb is zero;
	the rule succeeds.


Understand "scratch [something]" as rubbing.

Instead of rubbing the left arm during Arm Hurts :
	now arm-numb is zero;
	say "Ooooo. Ahhhh...slowly, the sensation returns in your left arm. That feels [italic type]so[roman type] good.".

				
Chapter First Sim

First Sim is a scene. First Sim begins when play begins. First Sim ends when the black plate is switched on for the first time.

When First Sim ends:
	try BSODing;
	let metatext be "Janet: Crap.[line break]David: Windex?[line break]Janet: It's the Myomita operating system. It's backwards compatible to the 20th century. Maybe earlier.[line break]David: We can't use Windex as the substrate for the ACU -- it's too critical. Can it run under Flosix?[line break]Janet: Yes, but it will take some time to install and debug.[line break]David: I can help you, the rest of the ship is Flosix, stem to stern. I live and breathe Flosix.[line break]Janet: Happy to have the help -- how about dinner first?[line break]David: Do you like Thai?";
	say "[metatext in metaspeak]";
	wait for any key;
	clear the screen;
	now the irradiator is patched;
	now the current memory usage is 260;
	now malloc is 256;
	
Chapter Second Sim

Second Sim is a scene. Second Sim begins when the First Sim ends. Second Sim ends when the front door is open.

When Second Sim begins:
	Restore the World;
	Setup the World;
	clear the screen;
	now arm-numb is zero;
	say "[ACU Boot Banner]";
	now the dream index is 4;
	try dreaming.
	
Every turn when the Second Sim is happening and the landing_pid is not 0:
	if the player is in the living room and the living room is not visited-during-havoc:
		now the living room is visited-during-havoc;
		[TODO: programmed in either here, or within Rover object: his behavior -- either bouncing around near the door if he is full, or indicating that he needs to be fed before going out]
		let metatext be "Janet: When Rover brings the probe back to the ship, it will automatically extract the data and send it back by ansible. Did you enter the ansible parameters?[line break]David: Yes, I had to do it manually since the frequency and coordinates are encrypted. It’s too bad they didn’t have FTL communications when they built the probes – it would have saved us the trip.[line break]Janet: Yes, but then Earth would get the information as well -- even encrypted, I wouldn't want it to fall into their hands.";
		say "[metatext in metaspeak]".

When Second Sim ends:
	let metatext be "Janet: So, that’s it. Rover goes out, gets the probe, brings it back to the ship, and then the information is squirted back to MARSpace.[line break]David: Well, congratulations, Doctor Xiang, on a job well done. I say we celebrate tonight, and get up early for the launch tomorrow morning.[line break]Janet: It’s a deal. Give me ten minutes to make the final commit, and I’ll join you.[line break]David: I’ll put the champagne on ice.";
	say "[metatext in metaspeak]";
	wait for any key;
	Restore the World;
	Setup the World.
	
Chapter Landing Sequence

Landing Sequence is a recurring scene. Landing Sequence begins when white egg is in the cold box and the landing_pid is zero and the location of the player is the Bathroom.

When Landing Sequence begins:
	reset the yoke;
	now the toilet cover is open;
	now the toilet seat is closed;
	move the player to the toilet seat, without printing a room description;
	say "You walk into the bathroom, flip up the toilet cover and sit down. You notice that the plunger is a bit tilted.";
	if the Second Sim is happening:
		let metatext be "Janet: So now we begin the landing cycle. This is where the ACU really shines.[line break]David: What about timing? The ship has to be in the right orientation and to fire the fusion thrusters at exactly the right time.[line break]Janet: The ACU works so fast that no matter how many individual steps it takes, the effect occurs at the right time.";
		say "[metatext in metaspeak]".
	
Landing Sequence ends when the landing_pid is not zero.

When the Landing Sequence ends:
	if the Second Sim is happening:
		let metatext be "David: That’s it. One long burn down to the planet’s surface.[line break]Janet: And then, the ACU just needs to deploy the Rover.";
		say "[metatext in metaspeak]".
	
Chapter Real Thing
	
Real Thing is a scene.  Real Thing begins when the Second Sim ends. Real Thing ends when the ACU is self-aware and the white egg is nowhere. [###TODO figure out the real out point later]

When Real Thing begins:
	Restore the World;
	Setup the World;
	clear the screen;
	say "[ACU Boot Banner]";
	now the dream index is 7;
	try dreaming;
	say "<BEEP> <BEEP> <BEEP>[paragraph break]You realize that something is wrong when the bed begins to shake. Several scenarios flash through your mind: explosive decompression of the dome? Volcanic activity? Meteor impact? Before you can even consider your next action, you are thrown from the futon onto the living room floor. Light pours in from the window. It looks like the drapes were somehow torn away from the window.";
	now the drapes are in Limbo;
	now the drawer is open;
	now the cabinet is open;
	now the chain is broken;
	now the player is alert;
	move the player to the living room, without printing a room description.
	
Chapter Walkies

Walkies is a recurring scene. Walkies begins when Rover is in the Front Yard and the Real Thing is happening. Walkies ends when Rover is in the Living Room.

When Walkies begins:
	say "You go bounding out the front door, full of energy.";
	now the player is Rover;
	try looking.
	
When Walkies ends:
	now the front door is closed;
	now the player is the ACU.

Chapter Boarding Party

Boarding Party is a scene.  Boarding Party begins when Real Thing ends. Boarding Party ends when the ACU is not asleep.

Chapter Back On Mars

Back on Mars is a scene.  Back on Mars begins when Boarding Party ends. 

	