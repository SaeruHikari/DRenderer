module utilities.fatal;

import core.stdc.stdlib;
import std.stdio;

void fatal(string message = "")
{
    if (message.length)
        writeln(message);
    core.stdc.stdlib.exit(1);
}