"Rover's Day Out" by Jack Welch and Ben Collins-Sussman

The story headline is "An Interactive Fiction".
The release number is 0.
The story genre is "Science Fiction".

Include Basic Screen Effects by Emily Short.
Include Menus by Emily Short.
Include Case Management by Emily Short.

Use full-length room descriptions, no scoring, american dialect and the serial comma.

Book 1 Mechanics

Chapter Declare Global Variables

Current memory usage is a number that varies. Current memory usage is 508.
Load average is a number that varies. Load average is 500.

Enroute is a truth state that varies. Enroute is false. [en route is a flag that the character is going towards a destination, and prevents the "going" routine from objecting to the use of a compass direction. The flag is reset when the attempt to go occurs.]

Chapter Class Definitions

A prop is a kind of thing. It is usually portable. [If props can be carried out of their initial room, they should not be in the room description, but appear in the room contents list.]

A furniture is a kind of thing. It is usually a supporter, scenery, and fixed in place. [In general, furniture descriptions should be integrated into room descriptions.]

A bed is a kind of furniture. It is usually enterable.

A refrigerator is a kind of container. A refrigerator is usually closed, openable, fixed in place, and scenery. Understand "fridge" as refrigerator. 

A sink is a kind of furniture. Understand "sink" as a sink.  A faucet is a kind of thing. A knob is a kind of thing. A drain is a kind of thing. A basin is a kind of container [redirect in/on the sink to the basin]. A basin is always open not openable.  A faucet, knob, drain and basin are parts of every sink.[this may be too detailed]

Wakefulness is a kind of value. The wakefulnesses are asleep, hypnopompic, groggy, and alert.

Insightfulness is a kind of value. The insightfulnesses are self-aware and clueless.

[Continuity is a kind of value. The continuities are intact and broken.]

Everything has some text called aware-description.  Everything has some text called clueless-description. The aware-description of a thing is usually "".  The clueless-description of a thing is usually "".  The description of a thing is usually "[if the player is self-aware][aware-description][otherwise][clueless-description]". Everything has some text called aware-name. The aware-name of a thing is usually "". Everything has some text called clueless-name. The clueless-name of a thing is usually "". 

Rule for printing the name of the a thing (called the item):
	if the player is self-aware and the aware-name of the item is not "":
		say the aware-name of the item;
	otherwise:
		if the player is clueless and the clueless-name of the item is not "":
			say the clueless-name of the item;
		otherwise:
			say the printed name of the item;
		
A simroom is a kind of room.  A simroom has some text called aware-name.  The aware-name is usually "location".  A simroom has some text called aware-description.  A simroom has some text called clueless-description.  The aware-description of a simroom is usually "".  The clueless-description of a simroom is usually "".  The description of a simroom is usually "[if the player is self-aware][aware-description][otherwise][clueless-description]".

An outside room is a kind of room. The description of an outside room is usually "You are outside.[inconsequential outside detail]". The printed name of an outside room is usually "The Park".

Satiety is a kind of value. The satieties are hungry, peckish, and stuffed.

A hole is a kind of container. A hole is always open not openable and fixed in place.

A bowl is a kind of container. The carrying capacity of a bowl is always 1.

An message is a kind of prop. A message has some text called inscription. The inscription of a message is usually "".

[classs-wise resettable properties:]
A person has an object called initial-enclosure. The initial-enclosure of a person is usually nothing.

A prop has an object called initial-enclosure. The initial-enclosure of a prop is usually nothing.

A container has a truth state called initial-overture. The initial-overture of a container is usually false.

A door has a truth state called initial-overture. The initial-overture of a door is usually false.

A device has an truth state called initial-onoff. The initial-onoff of a device is usually false.

Section Chests and Lids

[borrowed more or less whole cloth from example 49 in the I7 documentation. Instead of keeping track of whether the lid is up or down, keep track of the open/close status of the chest.]

A chest is a kind of container. A chest is always openable. A chest is usually fixed in place. A chest is usually closed. The specification of a chest is "Represents a container with a separately implemented lid; the lid is itself a supporter."

A lid is a kind of supporter. A lid is part of every chest. The specification of a lid is "A supporter attached to a chest, which can only support things when the chest is closed."

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

Chapter General Routines

[Let's do a random walk, shall we?  :-) ]
Memory-updating is an action applying to nothing.

Carry out memory-updating:
	let memdelta be a random number from -25 to 25;
	now the current memory usage is the current memory usage plus memdelta;
	if current memory usage is greater than load average + 140:
		now the current memory usage is load average + 120;
	if current memory usage is less than load average - 100:
		now the current memory usage is load average.

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
	say "[fixed letter spacing][blue letters][dialogue][default letters]";
	say variable letter spacing;
	say paragraph break;
	
Chapter Verbs
	
Section Computer Humor

Before touching something (called the item):
	if the player is the acu and the player is self-aware:
		say "[aware-name of the item]: file timestamp updated.";
		
Before jumping:
	if the player is the acu and the player is self-aware:
		say "Branch instruction ignored. Instruction pointer unaffected.";
		rule succeeds.
		
Understand "ls" as looking when the player is the ACU and the ACU is self-aware.

Understand "grep [something]" as searching when the player is the ACU and the ACU is self-aware.

Understand "man" as asking for help when the player is the ACU and the ACU is self-aware.

Understand "cd [any room]" as going towards when the player is the ACU and the ACU is self-aware.
		
Section Reading
		
Understand the command "read" as something new. Reading is an action applying to one thing. Understand "read [some message]" as reading.

Check reading:
	If the player is rover:
		say "Dogs can't read." instead;
	otherwise:
		if the inscription of the noun is "":
			say "Nothing is printed on [the noun]." instead.
			
Carry out reading:
	say "[inscription][paragraph break]".
	
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
	let the heading be the best route from the location to the location of the noun, using even locked doors;
	if heading is not a direction, say "You can't figure out how to get there." instead;
	let the destination be the room the heading from the location;
	now enroute is true;
	try going heading;
	if the player is not in the destination, rule fails.
	
Rule for reaching inside a room when the current action is going towards: 
    allow access.[necessary to allow the going towards rule to work on a person that is out of local scope; otherwise would throw a "you can't reach inside the kitchen" sort of error.]

Before going a direction (called the way):
	if enroute is true:
		now enroute is false;
		continue the action;
	if the way is up or the way is down:
		continue the action;
	if the ACU is the player: 
		if the player is clueless:
			say "Compass directions? On Mars? The magnetic field here is too weak.";
		otherwise:
			say "That term is undefined in the present reference frame.";
	otherwise: [maybe safer to say 'if Rover is the player'?]
		say "Woof?";
	rule succeeds;
	
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
	Save the World;
	Setup the World;
	change the left hand status line to "[last-noun in upper case] -> [status-line-action] : [last-success]";
	change the right hand status line to "Memory: [current memory usage].[a random number from 0 to 9] PB";
	
After printing the banner text:
	say "Type [quotation mark]help[quotation mark] for instructions, credits and license or just blaze on impetuously.";
	say paragraph break;
	let metatext be "Janet: David, are you hooked in?[line break]David: Ready to go. Is this the final version of the ACU, or another beta?[line break]Janet: A program is never finished, but I think we're ready to go.[line break]David: I hope so, Earth could launch any day now.[line break]Janet: Run program.";
	say "[metatext in metaspeak]";
	say variable letter spacing;
	say paragraph break;
	wait for any key;
	clear the screen;
	say "[ACU Boot Banner]".	
	
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
	now the time of day is 5:30 am;
[persons]
	now the player is the ACU;
	now Rover is hungry;
	now the ACU is asleep;


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
		move the 	selection to the initial-enclosure of the selection;
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

Chapter Teaching An Old Dog

Section Barking

Persuasion rule for asking an animal to try barking:
	persuasion succeeds.

Barking is an action applying to nothing. Understand "bark" as barking.

Check barking:
	if the player is not an animal:
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
		say "Rover's fur stands on edge and he growls momentarily, but then realizes that there is nothing threating here.";
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

Section Living Room
 
The Valkyrie Area is a region.  The Living Room, The Kitchen, The Bathroom and The Shower are simrooms in the Valkyrie Area.

The walls are a backdrop.  They are in the living room and kitchen.  Understand "wall" or "walls" as walls.  The clueless-description of the walls is "You painted the walls white a few months ago, but they've already taken on a slightly reddish hue thanks to the fine Martian dust in the air."  The aware-description of the walls is "Solid metal bulkheads, backed by tons of reinforcing composite alloy, line the interior of the cargo bay."

The ceiling is a backdrop. It is in the living room and kitchen.  Understand "roof" or "stucco" as ceiling. The clueless-description of the ceiling is "The ceiling is an off-white stucco material designed to absorb sound." The aware-description of the ceiling is "The domed roof of the cargo bay, like the ceiling of a gothic cathedral, looms 35 meters above the floor."

The aware-name of the living room is "operations". The clueless-description of the living room is "[if the drapes are closed]Where the heavy drapes meet, a sliver of sunlight shines into the otherwise dark living room.[otherwise]You are in the living room of a small cottage, actually more of a studio apartment. Light pours in through the room's single window. The principle furnishing is a king-size purple futon which takes up almost all the floor space. From the living room you can see the entrance to the kitchen and bathroom. The cottages's front door is closed." The aware-description of the living room is "The Valkyrie's cargo bay is like a great, metal cave.  On one wall, the Casimir Drive intrudes slightly into the cargo area. From this section of the ship, there are connections to the engineering and flight control decks." 

[TODO:  remove this part eventually, using 'go to X' as our main navigation device]
The living room is west of the kitchen, south of the bathroom, and east of the front door.  The living room contains the player. 

The futon is a bed in the living room. The clueless-name of the futon is "purple futon".  The aware-name of the futon is "casimir drive". Understand "couch" or "bed" or "purple" as the futon. The aware-description of the futon is "The Casimir Drive system is retracted and intact.[if the alarm clock is on the futon] A temporal transgressor is nestled into its port." The clueless-description of the futon is "Your futon is huge, and oh so comfy. The wooden frame supports a king-size mattress.[if the alarm clock is on the futon] An alarm clock is balanced precariously near the edge of the futon.".

The mattress and frame are parts of the futon.  The clueless-name of the mattress is "mattress". The aware-name of the mattress is "spatial manifold attenuator".The clueless-description of the mattress is "A thick, heavy purple mattress." The aware-description of the mattress is "The spatial manifold attenuator is offline."

The clueless-description of the frame is "A wooden frame designed to some how fold up into a third of the space that it normally occupies when the bed is pulled out. A true feat of engineering and geometry." The aware-description of the frame is "The casimir drive extension strut is contracted." The clueless-name of the frame is "bed frame". The aware-name of the frame is "extension strut".

On the futon is a woman called the ACU. The player is the ACU. She is wearing a flight suit. A left arm and a right arm are parts of the ACU. A back, a hair, and a body are parts of the ACU. [note -- remember to set the article appropriately, your/her, depending on POV.] The ACU has wakefulness. The ACU has insightfulness. The ACU is asleep. The ACU is clueless. The aware-name of the ACU is "ACU". The clueless-name of the ACU is "Janet". The ACU is proper-named. The clueless-description of the ACU is "You seem just like you have every other day of your life. [if the ACU wears the flight suit]You are wearing a blue flight suit[otherwise]It's not big deal because you're in your own cottage, but it's worth mentioning that you are completely naked[end if]." The aware-description of the ACU is "Your consciousness extends throughout the many systems that comprise the Valkyrie."

Audio is a device which is part of the ACU. The aware-name of Audio is "Internal Microphones". Audio is switched off.

The flight suit is a wearable prop. The ACU wears the flight suit. Understand "flight" or "suit" or "flightsuit" or "jump suit" or "clothing" as the flight suit.  The clueless-name of the flight suit is "flight suit". The aware-name of the flight suit is "ACU quantum isolator". The clueless-description of the flight suit is "[if the flight suit is worn]You are wearing[otherwise]It is[end if] a loose-fitting blue flight suit with a MARSpace insignia. On the right breast pocket, the letters [quotation mark]ACU[quotation mark] are embroidered in white on a red background." The aware-description of the flight suit is "The ACU is contained in a quantum-isolated housing which bears the insignia of MARSpace." 

The insignia is part of the flight suit. The clueless-description of the insignia is "The insignia depicts the planet Mars. A stylized rocket ship that looks like it came from the pages of a ancient pulp novel points away from the ship, and its exhaust plume encircles the planet. The symbol evokes the spear and sword of Ares, the symbol of Mars back to alchemical times." To say the aware-description of the insignia: say the clueless-description of the insignia. 

The alarm clock is furniture on the futon.  The clueless-description of the alarm clock is "It[apostrophe]s a cheap, white plastic alarm clock with bright green LEDs that read [time of day].  A large button juts out of the top.". A button and a switch are part of the alarm clock. The clueless-name of the alarm clock is "alarm clock". The aware-name of the alarm clock is "temporal transgressor". The aware-description of the alarm clock is "The casimir drive's temporal transgressor glows green as usual.  A basic toggle is on top.".  The aware-name of the button is "mf toggle".  The clueless-description of the button is "Mounted almost flush with the top of the clock, you can barely make out the word [quotation mark]snoo[quotation mark]."  The aware-description of the button is "Mounted on top of the temporal transgressor is a slightly worn magno-fluctuator toggle.".

After examining the alarm clock for the second time:
	let metatext be "David:  Why is it so interested in the clock?[line break]Janet:  Not sure.";
	say "[metatext in metaspeak]";

Some drapes are furniture in the living room. Understand "curtains" as the drapes. The drapes can be open. The drapes are closed. The clueless-name of the drapes is "drapes". The aware-name of the drapes is "solar shield". The clueless-description of the drapes is "The heavy brown drapes are [if open]open[otherwise]closed[end if]. [if open]Light pours in.[otherwise]The room is dark."[no aware-description is given since the drapes are missing in that part of the story]

Instead of opening the drapes:
	if the futon encloses the player:
		say "You'll need to stand up first."; [perhaps better handled by limiting the scope to the futon and things on it -- prevents the player from opening
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

The living room floor is scenery in the living room. The clueless-name of the living room floor is "living room floor". The aware-name of the living room floor is "cargo bay floor". The clueless-description of the living room floor is "A hardwood floor." The aware-description of the living room floor is "The cargo bay's high-friction floor has been scratched and scuffed by Rover's tractors." 

The front door is east of the front yard. It is a door and scenery. The clueless-name of the front door is "front door". The aware-name of the front door is "cargo bay door". 

The aware-description of the front door is "The massive titanium cargo bay door are [if closed]hermetically sealed against the harsh external environment[otherwise]wide open, exposing the cargo bay to the hellish maelstrom outside the ship[end if]."

The clueless-description of the front door is "[front door status]"

To say front door status:
	say "The front door of the cottage is ";
	if the front door is closed: 
		say "closed.";
	otherwise:
		say "open. ";
		if the player is in the front yard:
			say "You can see light from inside the house, and the smell of home wafts out the front door.";
		otherwise:
			say "Outside, it looks like a nice day."  

Section Kitchen

The Kitchen is a room. The aware-name of the kitchen is "engineering".  The clueless-description of the kitchen is "The kitchen is small but functional, with a space-saver refrigerator and a glass-top electric range. There is a drawer under the range. On the opposite wall there is a sink and under it, a storage cabinet. In a corner where it won't get kicked accidentally, there is a dog dish on the floor."  The aware-description of the kitchen is "Swaths of engineering controls -- both holographic and physical -- cover the humming consoles which line the boundaries of this alcove.".

The old fridge is a refrigerator in the kitchen. Understand "refrigerator" as the old fridge.  The aware-name of the old fridge is "cryochamber".  The clueless-name of the old fridge is "old fridge". The clueless-description of the old fridge is "The small refrigerator dates back to the international era, but is still in good working order, if somewhat small by today's standards. The glossy, white enameled unit has a single compartment. A strip of yellow magpaper is attached to the refrigerator door." The aware-description of the old fridge is "A state-of-the-art cryochamber designed to house heavy helium. The unit is [if closed]closed[otherwise]open, chilling the air around it[end if]."

Instead of searching a refrigerator (called R):
	if the player is clueless:
		say "You poke around in the fridge and find [a list of things in R][if nothing is in R] at all[end if].";
	otherwise:
		say "The cryo unit contains [a list of things in R][if nothing is in R] but the super-chilled interior of the cryo unit itself[end if]."

The magpaper is message which is part of the the old fridge.  The aware-name of the magpaper is "task manager".  The clueless-description of the magpaper is "It is a to-do list, in your own writing."  The aware-description of the magpaper is "It is a list of jobs in your priority queue."

The inscription of the magpaper is "[if the player is clueless]Morning:[line break]
X. Get up[line break]
2. Shower[line break]
3. Breakfast[line break]
4. Take care of business[line break]
5. Let Rover go walkies[otherwise][fixed letter spacing]PID   TTY          STATUS      CMD
[line break]301   ttys000      Done.       Initial Program Load
[line break]323	  ttys000      Done.       Apply Ablative Enamel
[line break]515   ttys000      Done.       Ignite Fusion Reactor
[line break]525   ttys000      Done.       Landing Sequence
[line break]540	  ttys000      Pending.    Send Probe Data[variable letter spacing]";

[for the advanced class -- make these process IDs correspond to the turn number in which these actions actually were accomplished!]

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

In the fridge is the white egg. It is an edible prop.  The clueless-name of the white egg is "white egg". The aware-name of the white egg is "helium-4 sphere".  The clueless-description of the white egg is "A big white egg.[if a random chance of 1 in 10 succeeds] From a chicken, if you had to guess."  The aware-description of the white egg is "A reinforced carboy of super-chilled metallic Helium-4."

The range is enterable furniture in the kitchen[enterable so you can sit on it]. The drawer is an openable closed container that is part of the range.

The clueless-name of the range is "the range". The aware-name of the range is "fusion chamber". The clueless-description of the range is "The top of the glass range is flush with the kitchen counter. The surface of the stove is not glowing, indicating that it is not hot. The stove does not have an oven, but below the cooking surface, a drawer [if the drawer is closed]is flush with the kitchen counter[otherwise]hangs open[end if]." The aware-description of the range is "The majority of the engineering deck is occupied by the towering hulk of the industrial fusion reactor that powers the ship[apostrophe]s landing thrusters. The reactor core at the base of the fusion reactor is [if the drawer is closed]closed[otherwise]open[end if].[if the frying pan is on the range] It is illuminated from above by the faint plasma glow of a magnetic bottle which has formed at the focal point of multiple ignition lasers." [TODO: indicate if fusion has occurred or not. egg cooked or not]

A frying pan is in the drawer. It is an open not openable container.  The carrying capacity of the pan is 1. The clueless-name of the the frying pan is "frying pan". The aware-name of the frying pan is "magnetic bottle". The clueless-description of the frying pan is "A small, non-stick frying pan." The aware-description of the frying pan is "A powerful magnetic field capable of confining the fusion reaction within a tight volume, at the heart of the Valkyrie's fusion lasers."

The clueless-name of the drawer is "drawer". The aware-name of the drawer is "reactor core". The clueless-description of the drawer is "A deep drawer under the cooking range. The drawer [if open]has been opened[otherwise]is shut[end if]."

The dog dish is a prop in the kitchen. The water trough and the food trough are bowls which are parts of the dog dish. The dog dish is proper-named. The clueless-name of the dog dish is "Rover's dog dish". The aware-name of the dog dish is "Rover's transfer device". The description of the dog dish is "Rover[apostrophe]s dog dish is divided into two sections, a bowl  marked [quotation mark]water[quotation mark], and another labeled [quotation mark]chow[quotation mark]. Both are empty." [TODO: handle empty/full]

The counter is an enterable furniture in the kitchen.[do not increment this counter] The clueless-name of the counter is "kitchen counter". The aware-name of the counter is "bulkhead". The clueless-description of the counter is "A scratch-resistant white counter into which a cooking range has been set." The aware-description of the counter is "Thick bulkheads provide radiation shielding around the fusion chamber."

The kitchen sink is a sink in the kitchen. The clueless-name of the sink is "sink". The aware-name of the sink is "coolant output". The clueless-description of the sink is "A small, utilitarian kitchen sink. Below the sink, there is a small cabinet." The aware-description of the kitchen sink is "The coolant output nozzle leads towards the Rover transfer system."

The cabinet is part of the kitchen sink.  The cabinet is an openable closed scenery container.  The dog chow bag and the reward nuggets box are in the cabinet.  

The clueless-name of the cabinet is "cabinet". The aware-name of the cabinet is "fuel storage unit". The clueless-description of the cabinet is "Under the sink, the cabinet is [if the cabinet is open]open[otherwise]closed[end if]." The aware-description of the cabinet is "A lead-lined vault in which radioisotope fuel is stored for the R.O.V.E.R. The vault is presently [if the cabinet is open]sealed[otherwise]unsealed[end if]."

The dog chow bag is an open openable container.  The carrying capacity of the dog chow bag is 1.  The dog chow bag contains some dog food.

The clueless-name of the dog chow bag is "bag of dog food". The aware-name of the dog chow bag is "fuel conduit". The clueless-description of the dog chow bag is "The bag features a picture of a grotesquely (in your opinion) fat white husky seated at a fancy dinner table. In front of him, steak, turkey, and ham are piled high on silver dishes. He stares rapaciously at the feast, clenching a fork and knife in his paws. The bag is labeled [quotation mark]Happy Dogz Mix[quotation mark]". The aware-description of the dog chow bag is "A fully automated delivery system designed to safely pump radionuclide fuels from the storage unit to the R.O.V.E.R transfer device."

The reward nuggets box is an open not openable container. The carrying capacity of the reward nuggets box is 1. The reward nuggets box contains some dog treats. 

The clueless-name of the reward nuggets box is "box of dog treats". The aware-name of the reward nuggets  box is "token dispenser". The clueless-description of the reward nuggets box is "The bright red box is labeled [quotation mark]Reward Nuggets[quotation mark] and has a picture of a dog with angel wings and a halo above its head."  The aware-description of the reward nuggets box is "A virtual device for reinforcing the weighting of positive behaviors in the R.O.V.E.R. neural net."

Rover is a male animal in the Kitchen. Rover has satiety. Rover is hungry.  Rover has insightfulness. Rover is clueless. The tail, paw, nose, ear, dorsum, tummy, and tongue are part of Rover.

The clueless-name of Rover is "Rover". The aware-name of Rover is "ROVER". The clueless-description of Rover is "[if the player is the ACU]He's[otherwise]You're[end if] a big, happy dalmation."  The aware-description of Rover is "Rover is a 45 metric ton mobile mining rig designed to operate under harsh off-world conditions.[if rover has the space probe] He is chewing a piece of the Musashi-5 space probe[end if]."

The kitchen floor is a scenery supporter in the kitchen. The clueless-name of the kitchen floor is "kitchen floor". The aware-name of the kitchen floor is "engineering section floor". The clueless-description of the kitchen floor is "Mars-tone tiling." The aware-description of the kitchen floor is "A strong metal mesh overlying the girders and struts that brace the engines against ship's inner hull." 

Section Bathroom

The aware-name of the bathroom is "flight control". The clueless-description of the bathroom is "Your cottage[apostrophe]s living room is palatial compared to your bathroom. There is a pink marble counter, with a toothbrush and some floss on it. A shallow sink is inset into the counter, and above it, you[apostrophe]ve mounted mirror on the wall. To the right of the mirror is a black glass touch plate. Between the counter and the shower is a white, porcelain toilet.[if the bathroom is unvisited][paragraph break]You miss having a bath, but when you were selecting a place to live only the high-rises had true baths. The garden cottages on the edge of the park all had these no-frills shower stalls." The aware-description of the bathroom is "The flight control and avionics hub of the ship bristles with controls and readouts related to setting the ship's attitude in space, adjusting the control surfaces in atmospheric flight, and for firing the breaking thrusters during the landing sequence."

At the time when the player goes towards the bathroom for the first time:
	try looking;
	let metatext be "David: Actually, I live just in a cottage on the other side of the park, and I have a regular bathtub.[line break]Janet: You want me to come over and take my baths there?[line break]David: Well, no, I mean, it would be okay, I guess, but that wasn't my point.[line break]Janet: Your point was...?[line break]David: Just that some of the cottages do have baths.[line break]Janet: I see.";
	say "[metatext in metaspeak]";

The marble counter is furniture in the bathroom.  On the marble counter are a toothbrush and a floss dispenser. The toothbrush and floss dispenser are props.

The clueless-name of the marble counter is "marble counter". The aware-name of the marble counter is "flight console". The clueless-description of the marble counter is "A counter of that pink faux marble that is so common in Martian bathrooms. [if the toothbrush is on the counter or the floss dispenser is on the counter] There are some toiletries on it.[end if] A small sink is inset just below the mirror on the wall."  The aware-description of the marble counter is "A fully automated flight control console."

The clueless-name of the floss dispenser is "floss dispenser". The aware-name of the floss dispenser is "object linker". The clueless-description of the floss dispenser is "A small white box with a blue button just below where the floss comes out." The aware-description of the floss dispenser is "A featureless and perfectly cube-shaped grey box."

The blue button is part of the floss dispenser.  The clueless-name of the blue button is "blue button". The aware-name of the blue button is "linkage actuation circuit". The clueless-description of the blue button is "A blue plastic button on the side of the ergonomically designed floss dispenser." The aware-description of the blue button is "A transputer circuit modulating quantum entanglement within the flight control subsystem."

The clueless-name of the toothbrush is "toothbrush".  Understand "brush" as the toothbrush. The aware-name of the toothbrush is "pit scrubber". The clueless-description of the toothbrush is "A green toothbrush with slightly worn bristles." The aware-description of the toothbrush is "The pit scrubber system appears to be operational. The countless nanobots it contains are dormant until they are released on the skin of the ship to polish out micropits from collisions with microscopic particles during the flight."

The bathroom floor is scenery in the bathroom.  The clueless-name of the bathroom floor is "bathroom floor". The aware-name of the bathroom floor is "flight control decking". The clueless-description of the bathroom floor is "The black bathroom floor sparkles thanks to microscopic bits of volcanic glass which assure that the floor is never slippery, even when wet. The micropores in the floor also assure that water does not collect for long on the bathroom floor." The aware-description of the bathroom floor is "The deck plating in the flight deck is painted bright yellow."

The bathroom walls are scenery in the bathroom.  The mirror is part of the bathroom walls.  The black plate is a device which is part of the bathroom walls. Understand "wall" as bathroom walls. 

The clueless-name of the bathroom walls is "bathroom wall". The aware-name of the bathroom walls is "flight control panels". The clueless-description of the bathroom walls is "Light pink tiles." The aware-description of the bathroom walls is "Panels with indicators showing the orientation of the ship in space, heading and speed, and other information useful for piloting and landing the ship."
 
The clueless-name of the mirror is "mirror". The aware-name of mirror is "inspector". The clueless-description of the mirror is "You see yourself in the mirror: a young woman with dark brown hair, high cheekbones and a look of determination." The aware-description of the mirror is "About this ACU: You are a Burroughs model DT69105 mainframe running version 210LTS of the Flosix Operating System, [quotation mark]Hysterical Hydrax[quotation mark]."

Instead of looking in the mirror:  try examining the mirror.

After examining the mirror for the first time:
	let metatext be "David:  Wait, is that memory usage correct?[line break]Janet:  Sure, it's fairly conservative.  The system has 640 PB available.[line break]David:  That's it?[line break]Janet:  C'mon, nobody will ever need more than 640 PB.";
	say "[metatext in metaspeak]";

The bathroom ceiling is scenery in the bathroom. The irradiator is a switched off device which is part of the bathroom ceiling.  

The clueless-name of the bathroom ceiling is "bathroom ceiling". The aware-name of the bathroom ceiling is "flight control canopy". The clueless-description of the bathroom ceiling is "The bathroom ceiling is slightly concave to promote drainage towards the walls. A red heat lamp is mounted in the center of the ceiling." The aware-description of the bathroom ceiling is "The roof of the flight control section is the nose of the ship, containing the RCS thrusters and the equipment that secretes the ablative coating that protects the ship during planetary landings."

The clueless-name of the irradiator is the "heat lamp". The aware-name of the irradiator is "UV emitter". The clueless-description is "The red lens of a heat lamp is mounted at the apex of the bathroom ceiling." The aware-description of the irradiator is "A distributed system of ultraviolet emitters lining the tubes of the system responsible for secreting an ablative enamel onto the surface of the ship before planetary landings. The ultraviolet light accelerates the polymerization of the neoadamite enamel, forming a protective barrier around the ship. The emitters are [if the irradiator is switched on]energized[otherwise]powered down[end if] at present."  Understand "heat" or "lamp" as irradiator. The irradiator can be buggy or patched. The irradiator is buggy.

The clueless-name of the black plate is the "black plate". The black plate is switched off. The aware-name of the black plate is "irradiator switch". The clueless-description of the black plate is "A glossy black glass plate that is just to the right of the bathroom mirror." The aware-description of the black plate is "The relay circuit that actuates the UV emitter in the enamel polymerization system."

The bathroom sink is a sink in the bathroom.  The clueless-name of the bathroom sink is "bathroom sink". The aware-name of the bathroom sink is "decontamination system". The clueless-description of the bathroom sink is "A sink with just enough room to wash your hands." The aware-description of the bathroom sink is "The biohazard response system is controlled from here, but its effectors are scattered throughout the interior portions of the ship. In the event of biological contamination, the system sterilizes the interior of the ship with gamma radiation and chlorine gas -- both harmless to the ship itself, but likely to be effective against all biological agents."

The toilet is furniture in the bathroom. The toilet bowl and water tank are chests which are parts of the toilet. The toilet#interior is a fixed in place thing in the water tank. The flapper valve is a scenery which is part of the toilet#interior. The chain is part of the toilet#interior. The lever is scenery which is part of the toilet#interior. The silver handle is scenery which is part of the water tank.  The tank top is a lid which is part of the water tank. The toilet cover is a lid which is part of the toilet bowl. The toilet seat is enterable furniture which is part of the toilet bowl.

The clueless-name of the toilet is the "toilet". The aware-name of the toilet is "Retros".  The clueless-description of the toilet is "A plain vanilla toilet, having a water tank and bowl. Nothing to write home about. [throne status].[paragraph break]A plunger stands next to the toilet, between it and the shower." The aware-description of the toilet is "The retro-rocket assembly is an engineering marvel which channels the monumental power output from the fusion reactors to thrusters designed to slow the ship enough to make a soft landing almost anywhere. [throne status]."

The clueless-name of the water tank is the "water tank". The aware-name of the water tank is "plasma constrictor". The clueless-description of the water tank is "A porcelain reservoir containing several liters of water to flush the toilet. On the front of the tank there is a silver handle used to flush the toilet and on the top of the tank there is a lid[if the water tank is open] which has been flipped up[end if]." The aware-description of the water tank is "A ring of supercooled rare earth magnets directs the engine's plasma output into the reaction chamber of the retro assembly. At the top, the plasma constrictor access hatch [if the water tank is open]has been swung open[otherwise]is tightly sealed[end if] ."

The clueless-name of the tank top is the "tank lid". The aware-name of the tank top is "plasma constrictor hatch". The clueless-description of the tank top is "A lid made of the same porcelain material as the water tank itself." The aware-description of the tank top is "A hatch providing access to the plasma constrictor ring." Understand "lid" as the tank top.

The clueless-name of the flapper valve is the "flapper valve".  The aware-name of the flapper valve is "thrust aperture". The clueless-description of the flapper valve is "A black rubber valve that seals the bottom of the water tank, allowing the toilet to flush only when it is pulled upward by the chain that connects it to the flush lever." The aware-description of the flapper valve is "The most critical component of the retro assembly, and its only moving part, the thrust aperature controls the flow rate of the ship's breaking thrusters."

The chain can be broken or intact. The chain is intact.

The clueless-name of the chain is the "flush chain." The aware-name of the chain is "thruster linkage servo." The clueless-description of the chain is "A metal chain that [if the chain is intact]connects[otherwise]would normally connect[end if] the flush lever to the flapper valve.[if the chain is broken] The chain has broken, however, and there is no longer any connection between the flush lever and the flapper valve." The aware-description of the chain is "A servo linkage connects the thruster actuation relay to the thruster aperature. The servo linkage status board shows [if the chain is intact]nominal function[otherwise]a fault: there is loss of continuity between the relay and the aperture."

The clueless-name of the lever is the "flush lever." The aware-name of the lever is "thruster actuation relay." The clueless-description of the lever is "The small white plastic lever on the inside of the water tank pivots up and down when the silver handle on the outside of the tank is turned. The lever in turn pulls on the chain that runs down to the flapper valve.[if the chain is broken] Unforunately, that chain has broken." The aware-description of the lever is "A high power relay attached to the thruster trigger circuit, this device controls the thruster aperature through a servo linkage.[if the chain is broken] Unfortunately, that linkage has been broken."

The clueless-name of the silver handle is the "silver handle." The aware-name of the silver handle is "thruster trigger circuit." The clueless-description of the silver handle is "A silver-plated handle on upper part of the toilet's water tank." The aware-description of the silver handle is "A high-speed circuit connected directly to the flight control system, the thruster trigger circuit controls the precise timing required to fire the fusion retros during planetary landings."

The clueless-name of the toilet#interior is the "inside of the tank." The aware-name of the toilet#interior is "interior of the plasma constrictor ring." The clueless-description of the toilet#interior is "The hardware that makes the toilet work can be seen within the tank. A plastic lever goes up and down according to the position of a silver knob on the outside of the tank, pulling on a chain that operates a flapper valve.[if the chain is broken] The situation here is slightly complication, however, as the chain is broken." The aware-description of the toilet#interior is "Inside the plasma constrictor ring, you can trace the control signal from the thruster trigger through the actuation relay [if the chain is broken]but here there is a discontinuity and the signal does not reach[otherwise]and the servo linkage to the[end if] thrust aperature. [if the chain is broken] It looks like the servo linkage has been damaged."

The clueless-name of the toilet bowl is the "toilet bowl." The aware-name of the toilet bowl is the "reaction chamber".  The clueless-description of the toilet bowl is "The white porcelain bowl is the bottom part of the toilet. [throne status]." The aware-description of the toilet bowl is "The fusion output mixes with reactant in the glossy white chamber at the bottom of the retro assembly, just distal to the thrust aperature. [throne status]." 

To say throne status:
	if the toilet seat is closed:
		if the toilet bowl is closed:
			say "[if the player is clueless]Both the the cover and seat are down[otherwise]Both the reactant shield and pressure seating are clamped down";
		otherwise:
			say "[if the player is clueless]The toilet seat is down, but the cover is raised[otherwise]The pressure seating is engaged but the reactant shield is raised";
	otherwise:
		say "[if the player is clueless]Someone left both the cover and seat up. How rude[otherwise]Both the reactant shield and the pressure seating are presently disengaged";

The toilet seat can be open or closed. The toilet seat is open.

[TODO: routine to intercept open/close of the toilet seat, taking into consideration the status of the toilet cover]

The clueless-name of the toilet seat is the "toilet seat". The aware-name of the toilet seat is "pressure seating". The clueless-description of the toilet seat is "A padded and heated seat, which is presently [if the toilet seat is open]raised[otherwise]in the down position[end if]." The aware-description of the toilet seat is "A black mevolar gasket that assures a perfect seal between the shield and the reactant chamber. The pressure seating is presently [if the toilet seat is open]not [end if]making a seal with the chamber."

The clueless-name of the toilet cover is the "toilet cover." The aware-name of the toilet cover is "reactant shield". The clueless-description of the toilet cover is "The cover is made of plastic, but has been laminated to give it the appearance of unstained wood. It toilet cover is [if toilet bowl is open]open[otherwise]closed[end if]." The aware-description of the toilet cover is "The neoadamite shield over the reaction chamber is presently [if the toilet bowl is open]not [end if]secured."

The plunger is furniture in the bathroom. The john shaft and the red rubber cup are part of the plunger.

The clueless-name of the plunger is "plunger". The aware-name of the plunger is "attitude control". The clueless-description of the plunger is "A common plumber's plunger, consisting of a wooden shaft and red rubber cup." The aware-description of the plunger is "An integrated system for controlling the pitch, roll, and yaw of the ship through the nose cone RCS thrusters."

The clueless-name of the john shaft is "shaft". The aware-name of the john shaft is "vector input port". The clueless-description of the john shaft is "A wooden stick." The aware-description of the john shaft is "A multiaxial control device which outputs ship orientation instructions to the nose cone drivers."

The clueless-name of the red rubber cup is the "red rubber cup". The aware-name of the red rubber cup is the "nose cone driver". The clueless-description of the red rubber cup is "The business end of the plunger.[if a random chance of one in eight succeeds] Exterminate! Exterminate!"

The shower door is a door and scenery.  It is north of the bathroom and south of the shower. 

The clueless-name of the shower door is "shower door". The aware-name of the shower door is "extruder latch". The clueless-description of the shower door is "A translucent polyglass door." The aware-description of the shower door is "A circuit which enables or disables the extruder."

The soap dispenser, the shampoo dispenser, and the shower drain are scenery in the shower. The shower walls are scenery in the shower. Understand "wall" as shower walls. The soap button is part of the shower walls. The shampoo button is part of the shower walls.

The clueless-name of the soap dispenser is "soap dispenser". The aware-name of the soap dispenser is "ablative enamel". The clueless-description of the soap dispenser is "The soap button is molded into the wall of the shower stall." The aware-description of the soap dispenser is "A solenoid pump which delivers the enamel solution to the extruder system for mixing with accelerant."

The clueless-name of the shampoo dispenser is "shampoo dispenser". The aware-name of the shampoo dispenser is "accelerant". The clueless-description of the shampoo dispenser is "The button for the shampoo dispenser is right next to the one for the soap dispenser". The aware-description of the shampoo dispenser is "A solenoid pump which delivers a catalyst to the extruder system for mixing with monomer solution."

The aware-name of the shower is "extruder". The clueless-description of the shower is "You are in your shower, and water is raining down on you. Two buttons are molded into the wall of the shower stall. One is labeled [quotation mark]soap[quotation mark], and the other, [quotation mark]shampoo[quotation mark]." The aware-description of the shower is "A fluidics network runs throughout the ship, designed to pump an enamel solution to the surface of the ship where it hardens into an ablative coating."

The clueless-name of the shower walls is "shower walls". The aware-name of the shower walls is "fluidics network". The clueless-description of the shower walls is "The walls of the shower are made of slick white plastic. Two buttons are on the wall, one marked [quotation mark]soap[quotation mark] and the other, [quotation mark]shampoo[quotation mark]." The aware-description of the shower walls is "A distribution network of tubes, pumps and valves that runs throughout the ship, just under the outer hull."

The clueless-name of the shampoo button is "shampoo button". The aware-name of the shampoo button is "accelerant release". The clueless-description of the shampoo button is "A small yellow button on the wall of the shower. It is marked [quotation mark]Shampoo[quotation mark]." The aware-description of the shampoo button is "A relay operating the accelerant solenoid."

The clueless-name of the soap button is "soap button". The aware-name of the soap button is "enamel release". The clueless-description of the soap button is "A small green button on the wall of the shower. It is marked [quotation mark]Soap[quotation mark]." The aware-description of the soap button is "A relay operating the enamel solenoid."


Chapter The Planet

The Planet Area is a region. The Front Yard, The Barren Plain, The Dug-Up Field, The Smoking Pit, The Featureless Desert, and The Strange Porch are outside rooms in the Planet Area.

To say inconsequential outside detail:
	say " You can't see far because it is so dusty here. [one of][or]The wind picks up, making it even more difficult to see.[or]A gust of wind lifts a sheet of dust and rains it down on you.[or]Dust spins in the air.[or]Ominous clouds of dust loom on the ever-darkening horizon.[or]The sky rumbles and rolls, and flashes of lightning snap between billowing clouds of dirt-colored dust.[as decreasingly likely outcomes]"

The Front Yard is west of the front door. The description of the front yard is "You are right outside the front door to your home.[inconsequential outside detail]". The printed name of the Front Yard is "Front Yard".

The Barren Plain is west of the Front Yard. A rock is a prop in the Barren Plain. The clueless-description of the rock is "[if the player is rover]You lick the rock. Not edible. Not a bone. Not interesting.[otherwise]A fist-sized rock that Rover brought in."  The aware-description of the rock is "A black 800 kilogram chunk of low grade thorium ore."

Dug-Up Field is west of the Barren Plain. The small ditch is a not enterable hole in the Dug-Up Field. The description of the small ditch is "It smells like fresh dirt and you can see somes paw marks. Someone has recently dug this hole." The carrying capacity of the ditch is 1.

The Smoking Pit is west of the Dug-Up Field. A long furrow is an enterable hole in the Smoking Pit. 

The description of the long furrow is "The long, deep furrow smells burnt." The carrying capacity of the furrow is 5.

The furrow walls is scenery. It is part of the furrow. The description of the furrow walls is "The walls and the floor of the furrow are hard and shiny, more like glass. The dirt here smells burnt." Understand "wall" or "walls" or "floor" or "dirt" or "soil" or "ground" or "crater" or "ditch" or "excavation" as the furrow walls.

The Featureless Desert is west of the Smoking Pit. 

The Black Bulldog is a male animal in the Featureless Desert. He is carrying the delicious bone. The delicious bone is a prop. 

The description of the Black Bulldog is "A squat little beast with bristly fur and tiny, unintelligent eyes.[if the black bulldog carries the delicious bone] In his mouth, he is carrying a bone almost as big as he is." 

The clueless-name of the delicious bone is "delicious bone". The aware-name of the delicious bone is the "space probe". The clueless-description of the delicious bone is "[delicious bone status]." The aware-description of the delicious bone is "The Musashi-5 probe was severely damaged at some point during its journey and even more so now that Rover is munching on it, but its data have been downloaded to you and are safe."  

To say delicious bone status:
	if the player is rover:
		say "It is the biggest, juiciest bone you’ve ever scene. It smells like marrow";
		if the delicious bone is carried by the bulldog:
			say "The bulldog notices your interest in the bone, and the corners of his mouth rise, revealing sharp teeth";
	otherwise:
		say "It the bone that Rover dragged in from the park. He's already gnawed on it a bit".

The Strange Porch is west of the Featureless Desert. The printed name of the the featureless desert is "The Park". The description of the Strange Porch is "You are right outside a strange house. [inconsequential outside detail]"

The Strange House is scenery in the strange porch.  The description of the Strange House is "A house just like where you and Janet live, except it doesn't smell like home. [inconsequential outside detail]"

The Splintered Door is west of the Strange Porch and east of the Studio.  It is an open not openable scenery door. The description of the splintered door is "The door of the stranger's house does not close all the way." 

The sky is a backdrop. It is in the Planet Area. The description of the sky is "Through the dust, you can see little more than dim light from above."

Chapter The Ginsu

The Ginsu Area [i.e., the Earth ship] is a region.  The Studio and the Galley are rooms in the Ginsu Area.

The description of the Studio is "[if The Studio is not visited]You walk into the building. There is a man here who looks old and grumpy. Like your home, this place has a sleep room and a food room. It looks like you've walked right into the sleep room.[paragraph break]The man yells at you and you tuck your head down. [quotation mark]Blah, blah, blah![quotation mark] He doesn[apostrophe]t seem to move though. Maybe he can[apostrophe]t move. You don[apostrophe]t feel so afraid of him.[otherwise]The stranger[apostrophe]s house is boring. The only furniture in the room is a bed. In one direction lies the eating room, in the other, the door that leads back to the park. The stranger is still here and carrying on, [rantings] You ignore him."

In The Studio is a man called the stranger. He is scenery. The description of the stranger is "The man seems flat like a rug, rather than round like a ball. He makes a lot of noise, but he doesn’t move around at all. Boy, does he seem mad, [rantings]!"

To say rantings:
 say "[quotation mark][one of]Blah, blah, blah, dog, blah, bad[or]Bad dog! Blah[or]Blah, blah, blah, blah, dog? Blah! Blah, blah[or]Blah, blah, blah, blah, blah, blah[or]Blah, out, blah, blah, dog[at random]![quotation mark]".

The pullout sofa is bed in The Studio. The pillow is a prop on the pullout sofa.

The description of the pullout sofa is "The sofa looks wrong somehow, like maybe it[apostrophe]s broken. It is more or less unfolded and looks even bigger than Janet[apostrophe]s futon."

The Galley is north of the Studio.

The description of the Galley is "[if the Galley is not visited]You enter the eating room.[paragraph break][end if]The room has big cold box just like the eating room in your home. It[apostrophe]s less loud in this room, but you can hear the man in the other room yelling, [rantings]".

A cold box is a refrigerator in the Galley.  The description of the cold box is "A bright orange box, just like the one that Janet keeps food in at home."
[there is no egg in the Ginsu's fridge because it's the same egg as in the Valkyrie. A byte saved is a byte earned.]

The water maker is a sink in the Galley. The description of the water maker is "A thing that people have in their homes.  They can get water out of it to put in your bowl."

The table is an enterable furniture in the Galley. The description of the table is "A big wooden table. Probably used for cooking stuff.[if nothing is on the table] Unfortunately, there is nothing, food or otherwise, on the table at the moment."

The bulldog water bowl and the bulldog food bowl are portable containers in the Galley. [portable, but slick, add a before action to prevent Rover from walking off with them].

The description of the bulldog food bowl is "The bulldog's food smells much better than yours."

The description of the bulldog water bowl is "The bulldog's water bowl smells much better than yours."[TODO think about how to handle water/food quantities in game; consider extension.]

Chapter Offstage
[Items that are tangible, but initially out of play] 

David Venkatachalam is a man. The description of David Venkatachalam is "David is of medium build, slightly bald, and has a pointed goatee. He is wearing a blue MARSpace flightsuit. [if audio is switched off]He is talking to Janet; you can see their lips moving."

Janet Xiang is a woman. The description of Janet Xiang is "Janet is short and athletic, with long brown hair. She is wearing the lavender summer dress that you picked up at a flea market last year. [if audio is switched off]She is talking to David; you can see their lips moving."  

The space probe is a prop. The clueless-name of the space probe is "dog bone". The aware-name of the space probe is "space probe". The clueless-description of the space probe is "A partially gnawed dog bone." The aware-description of the space probe is "The Musashi-5 probe was severely damaged at some point during its journey and even more so now that Rover is munching on it, but its data have been downloaded to you and are safe."

Instead of taking the space probe when the player is the acu:
	say "Rover growls mildly reminding you that it is [italic type]his[if the player is self-aware]space probe[otherwise]bone[end if][roman type]."

There are some assault ships. They are scenery. The description of the assault ships is "The black hulls of the Lamprey Class assault ships are barely visible against the background of space."

There are some gunships. They are scenery. The description of the gunships is "A tight cluster of highly maneuverable gunships, each of which mounts a single-powerful excimer laser."

[the window, skylights, park, grass, etc., are hidden when the drapes are drawn]

The window is a transparent scenery closed not openable container. Understand "outside" or "outdoors" as the window.
Instead of examining the window:
		say "The window is triple-paned pressure glass, mounted flush with the wall.  Through the window you can see [a list of things in the window]."
		
Some garden skylights are in the window. The indefinite article of the garden skylights is "an array of". The description of the garden skylights is "Early morning sunlight piped from the surface of the planet shines brightly on the well-manicured lawn of the park."

The park is scenery in the window. The description of the park is "Lincoln Park is the largest park dome in Cydonia. Later today, you'd expect it to be full of people playing frisbee, picnicking and otherwise enjoying the great outdoors."

Some grass is scenery in the window. The description of the grass is "A closely trimmed sea of luscious orange grass."

There are some spruce trees. They are scenery.  The description of the spruce trees is "A stand of Norwegian Spruce Trees is visible at far edge of the park."

Limbo is a room. David Venkatachalam, Janet Xiang, the space probe, the assault ships, the gunships, the window, and the spruce trees are in Limbo.

Chapter Memories

Remembering is an action applying to one topic.  Understand "remember [text]" as remembering.  Understand "recall [text]" as remembering.  Understand "think about [text]" as remembering.

Carry out remembering:
	say "That doesn't ring a bell.";
	
Instead of remembering a topic listed in the Table of Remembered Stuff:
	if the player is self-aware:
		say "You consult your memory banks: ";
	say "[description entry][paragraph break]".
	
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
index		description
1	"Rover draws pensively on his stubby cigar, the tip glowing red below his dealer's hat. He paws nonchalantly at the scotch and water he has been nursing for the last half hour. Despite the tower of chips in front of him, he's either in trouble now, or trying to play the rest of the table for suckers. His tail is no longer wagging, though, and you suspect that the scotch may be getting the better of him. He can't mass more than about 30 kilos, and he's been putting them away tonight. You push all in, figuring that even if you lose it all, at least you'll get some sleep before you need to get back to the MARSpace. Elva the cleaning lady folds, as does Isaac Asimov and that boy that you kissed in fourth grade. Wait...don't go....where is everyone going?"
2	"The alarm clock rolls into a ball, and flies the length of the vehicle construction facility, chased by an eager, slobbering dalmation. In the Martian gravity, Rover bounds three meters into the air and sails over the heads of an annoyed crew in cleanroom suits working frantically on the Valkyrie's starboard Casimir Drive assembly. The mission director, David Venkatachalam, grimaces, but your mother offers you a comforting cup of tea."
3	"A pudgy puppy hastily rounds a corner, sliding awkwardly on the polished dormitory floor. Behind it, there are flashes of light, and a rolling cloud, a mixture of smoke and Martian atmosphere. As the above-ground structures are ripped apart and lose pressure, the shivering ball of white fur leaps into your arms, burying its snout in the fold of your elbow. The Earth missiles continue to pound the university, but cannot penetrate to this depth. Huddled under a sturdy desk, you pet the frightened dog and hug it tight."
4	"xxxxxxxxxxxxx."
5	"The image of Tomasz blinks momentarily as the relay is handed off from ground station to ground station, trying to keep line of sight to Phobos. Behind him, you can see the tubular structure of the power station jutting over the edge of Stickley Crater. He is taking the news rather well, all things considered. Tomasz guesses your thoughts as you glance at your diamond engagement ring. [quotation mark]Don’t sweat it,[quotation mark]he says. [quotation mark]This whole rock is carbon, so plenty more where that came from.[quotation mark] There is blinding flash of light and the screen goes black."
6	"A dwarf emerges from under the kitchen sink, spilling dog chow all over the floor. He throws you a menacing look, pries the fridge open with a black rod, and snatches an egg off the shelf. Sand pours out of the fridge. [quotation mark]Hey,[quotation mark] you yell from the futon, [quotation mark]put that back[quotation mark]. You stop short, realizing that this sort of distraction is exactly why you haven’t completed your dissertation. You feel around under the futon, where you think you will have put the dissertation so you could find it in the past, and grab the stubby snout of a pig. The fleet-footed porcine slaps a fish into its ear, jumps into a dumbwaiter and disappears."
7	"xxxxxx."

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
"Beta Testers"	--	"Who are the fearless, dedicated individuals who put their very lives on the line to test this game?[paragraph break]* John Doe, Sleepy Hollow[line break]* Jimmy Tester, Utopia Planetia[line break]* Betty TestSweet, Lake Eridania[line break]* Joe Keypounder, Deimos Colony"	--
"The Ultra-Prestigious Bug Finder List"	--	"So far, no one aside from beta testers has reported a bug... you could be the first..."	--
"Creative Commons License"	--	"This game is released under the Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States license. As a consequence, you are free to copy, distribute, display and use this work and to make derivative works under the following conditions:[paragraph break]Attribution. You must attribute such works mentioning our names [story author] and the title of this work [quotation mark][story title][quotation mark]. This can 
  appear in the title, with the Release Information, or in the 
  acknowledgements section of a menu system. Attribution does not 
  suggest my endorsement of derivative works or their authors.[paragraph break]Noncommercial. You may not use this work for commercial purposes.[paragraph break]Share Alike. If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.[paragraph break]If you would like a copy of the Inform7 source for this game, please let us know by email: rover@templaro.com"	--

Chapter Status Line Magic

[See the "every turn" and "initialize" sections to understand how this works.]
Last-action is an action-name that varies.
Last-noun is a text that varies.  The last-noun is "ACU".
The status-line-action is a text that varies.  The status-line-action is "INITIAL PROGRAM LOAD".

Last-successful-action is an action-name that varies.
Last-success is a text that varies.  The last-success is "TRUE".

[This after-rule only gets called if the player's action succeeded.]
First after an actor doing something:
	change last-successful-action to the action-name part of the current action;
	continue the action.


[a first approximation here:  we're going to need a system to make special exceptions for certain situations.  We should probably map all of the Actions listed in the game-generated index!]

Table of Technoverbs
Verb				Technoverb
the going action			"SELECT"  [go, or any compass direction]
the taking off action		"RETRACT"  [take off, remove]
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
the eating action		"ROUTE"  [eat]
the pushing action		"APPLY"  [press]
the remembering action		"DATA_FETCH" [remember]

[some other verbs to deal with later, probably.  Their proper gerundives need to be discovered or defined:

"fold"		"RETRACT"
"unfold"		"EXTEND"
"fill"		"ADD"
"scratch"		"NEUTRALIZE STATIC CHARGE"
"wake"		"INITIALIZE"
"sleep"		"SUSPEND"
"give"		"DISPENSE"
"pull"		"ROLL"
"push"		"PITCH"
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
	[update status line]
	if the noun is something:
		change last-noun to "[aware-name of the noun]";
	otherwise:
		change last-noun to "nil";	
	now last-action is the action-name part of the current action;
	if last-action is a verb listed in the Table of Technoverbs:
		change the status-line-action to technoverb entry;
	otherwise:
		change the status-line-action to "NOP";
	if last-action is last-successful-action:
		change last-success to "TRUE";
	otherwise:
		change last-success to "NIL";
	[update memory usage]
	try memory-updating;
	change the right hand status line to "Memory: [current memory usage].[a random number from 0 to 9] PB";
	[update prompt]
	if the player is self-aware:
		change the command prompt to "READY>";
	otherwise:
		change the command prompt to ">";



[	say "action: [current action][line break]"; 
	say "action-name: [action-name part of the current action][line break]"; 
	if the noun is something: 
		say "noun: [noun][line break]"; 
	if the second noun is something: 
		say "second noun: [second noun][line break]"; ]
		
Book 2  Scenes

Chapter Bedtime

Bedtime is a recurring scene. Bedtime begins when play begins. Bedtime ends when the player is not enclosed by the futon. 
	
When Bedtime ends:
	move the alarm clock to Limbo;
	say "Rover bats the alarm clock off the bed.".

After exiting when a bed encloses the ACU:
	now the player is alert.	

Chapter First Sim

First Sim is a scene. First Sim begins when play begins. First Sim ends when the black plate is switched on for the first time.

When First Sim ends:
	say "BLUE SCREEN OF DEATH!!!!";
	now the irradiator is patched;
	now the current memory usage is 260;
	now load average is 256;
	Restore the World;
	Setup the World.

Chapter Second Sim

Second Sim is a scene. Second Sim begins when the First Sim ends. Second Sim ends when the front door is open for the first time.

When Second Sim ends:
	Restore the World;
	[description of waking up again]
	Setup the World.

Chapter Real Thing

Real Thing is a scene.  Real Thing begins when the Second Sim ends. Real Thing ends when the ACU is self-aware and the white egg is nowhere. [i.e., eaten]

Chapter Walkies

Walkies is a scene. Walkies begins when Rover is not in the Valkyrie Area. Walkies ends when Rover is in the Valkyrie Area.

Chapter Boarding Party

Boarding Party is a scene.  Boarding Party begins when Real Thing ends. Boarding Party ends when the ACU is not asleep.

Chapter Back On Mars

Back on Mars is a scene.  Back on Mars begins when Boarding Party ends. 

	