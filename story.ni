"Rover's Day Out" by Jack Welch and Ben Collins-Sussman

The story headline is "An interactive fiction".
The release number is 0.
The story genre is "Science Fiction".

Include Basic Screen Effects by Emily Short.
Use full-length room descriptions, no scoring, american dialect and the serial comma.

After printing the banner text:
    say "Type help for instructions, credits and license or just blaze on impetuously.";
    say paragraph break;
    let metatext be "Janet: David, are you hooked in?[line break]David: Ready to go. Is this the final version of the ACU, or another beta?[line break]Janet: A program is never finished, but I think we're ready to go.[line break]David: I hope so, Earth could launch any day now.[line break]Janet: Run program.";
    say "[metatext in metaspeak]";
    say variable letter spacing;
    say paragraph break;
    wait for any key;
    clear the screen;
    say "[ACU Boot Banner]".

To say ACU Boot Banner:
    say "[bold type]Rover's Day Out[roman type]";
    say line break;
    say "An Interactive Fiction by Janet Xiang";
    say line break;
    say "Release beta732 / Serial number 23920401 / Inform v10.5.4 Library 6/42";
    say paragraph break.

[General routine for displaying dialogue between Janet and David.]
To say (dialogue - some text) in metaspeak:
    say paragraph break;
    say "[fixed letter spacing][blue letters][dialogue][default letters]";
    say variable letter spacing;
    say paragraph break;

[TODO:  write awesome subroutine to update the status line.  In docs, see section 8.3]

The Valkyrie is a region.  The Living Room, Kitchen, and Bathroom are in the Valkyrie.

The Living Room is a room. "This is an ordinary living room. It contains a futon. From here you can see the kitchen, bathroom, a window and front door." The living room contains the player. The purple futon is an enterable scenery supporter in the Living Room. Understand "couch" or  "bed" or "sofa" as the futon. "A comfy purple futon. There is an alarm clock on the futon."  The alarm clock is a scenery on the futon.  The description of the alarm clock is "It's a white plastic alarm clock with bright green LEDs.".

After examining the alarm clock:
    let metatext be "David:  Why is it so interested in the clock?[line break]Janet:  Not sure.";
    say "[metatext in metaspeak]".

The window is in the Living Room. It is scenery. 
Instead of searching the window[ to catch "look through" window]:
        try examining the window.

The front door is scenery in the Living Room.

The Kitchen is a room."A small kitchen."

The fridge is an openable container in the Kitchen. It is closed. "[if open]The fridge is open, spilling cold air onto the floor of the kitchen.[otherwise]The fridge is closed."

An egg is in the fridge. It is edible.

Rover is a male animal in the Kitchen.

The Bathroom is a room."An ordinary bathroom."

The Planet is a region. The sky is a backdrop. It is in the Planet.  Outdoor1, Outdoor2, and Outdoor3 are rooms in the Planet.

The Ginsu [i.e., the Earth ship] is a region.  The Sleep Room and the Eating Room are rooms in the Ginsu.
