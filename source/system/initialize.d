module system.initialize;
import std.stdio;
import std.conv;
import std.string;
import bindbc.sdl;

static this()
{
    import utilities.fatal;

    auto sdlSupport = loadSDL();
    writeln("sdlSupport: ", sdlSupport);

    if (sdlSupport == SDLSupport.noLibrary)
        fatal("Error: SDL is not installed");

    version(OSX)
    {
        SDL_SetHint(SDL_HINT_RENDER_DRIVER, toStringz("metal"));
    }

    if (SDL_Init(SDL_INIT_EVERYTHING) == -1)
        fatal("Error: failed to init SDL: " ~ to!string(SDL_GetError()));
}

static ~this()
{
    SDL_Quit();
}