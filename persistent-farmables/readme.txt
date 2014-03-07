Persistent farmables, as programmed by JTE.
Please make sure you harvest all of your vanilla crops before installing or uninstalling this mod, as it will erase anything planted.

To install, put this jte_farming folder in your Starbound/mods folder, so that modinfo is "Starbounds/mods/jte_farming/jte_farming.modinfo".

This mod comes in two flavors at the moment:

* jte_farming-rt.pak (default) Keeps your crops growing in realtime EVEN WHILE THE GAME IS COMPLETELY CLOSED.
You will NEVER lose any growth on your crops with this option.

* jte_farming-gt.pak Keeps your crops growing ONLY WHILE THE GAME IS OPEN.
However, the jte_farming-gt version has some issues!
If you don't visit your crops again before logging off, any growth since the last visit will be reset.
Additionally, any time spent at the title screen or in menus will be added to your crops upon logging in.
There is nothing I can do about these issues unless a universe clock is one day added, which would tick only while the universe is loaded and never reset.

Switch which one you're using in jte_farming.modinfo



Multiplayer:
This mod DOES NOT work on vanilla servers (crops will stop growing!), and will need to be temporarily uninstalled if you want to go play on one.
However! If the server ALSO has some version of this mod installed, it should work correctly for all players!


Mod support:
See the mod page at http://community.playstarbound.com/index.php?resources/persistent-farmables.640/ for up to date information on mods which add support for custom crops from other mods.


Want to use the realtime system for your own custom mod crops?
Check the Templates/objects/farmables/mycrop/mycropseed.object file for an example. Replace all the "mycrop" with your farmable name.
You will ONLY need to make a new mycrop.animation file if you change the number of growth stages and harvesting states.
Unfortunately there is no way to make this mod a "soft dependancy" at this time, so I recommend making support for it an entirely new mod itself, which is dependant on both jte_farming and the mod you're trying to add support for.
