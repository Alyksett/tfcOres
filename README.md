### What
The Minecraft modpack Terrafirmacraft has an [alloy system](https://1710-wiki.terrafirmacraft.com/Alloys), where the creation of different alloys depends on the ratios of the metals you melt. Each metal in it's ore form also takes the form of one of four purity levels (10, 15, 25, 35 units).

Given this, we can model this as an integer constraint program which Prolog is suited for. (Note this is basically my first time really using Prolog, so it's likely sloppy).

### Running
Currently, Bismuith Bronze is hard-coded into the program (although changing it is simple enough). 
1. Adjust the values of the amount of different ore purities in the partial rule `find/2`.
2. Call the partial rule `find/3` with `find(Copper, Bismuth, Zinc).` to query solutions.

You can also call `dump_solutions.` to write the results to a text file.

Note that in practice, the solution space is so large that any real-world quantities of ores is unfortunately infeasable to write. This does however work for smaller quantities. For example the commented out set of ore quantities (The actual set of quantities that motivated this project) will take (based on a rough benchmark) roughly `690134.0015038028` years to fully compute, which is likely impractical.