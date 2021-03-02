module glue.sdl_wgpu_surface;
import gpu.wgpu.device;
import gpu.wgpu.surface;
import gpu.api;
import system.window;
import bindbc.wgpu;
import bindbc.sdl;
import std.stdio;

GPUSurface Create(SDL2Window window)
{
    SDL_SysWMinfo wmInfo = window.wmInfo;
    writeln("Subsystem: ", wmInfo.subsystem);
    WGPUSurfaceId surf;

    version(Windows)
    {
        if (wmInfo.subsystem == SDL_SYSWM_WINDOWS)
        {
            auto win_hwnd = wmInfo.info.win.window;
            auto win_hinstance = wmInfo.info.win.hinstance;
            surf = wgpu_create_surface_from_windows_hwnd(win_hinstance, win_hwnd);
        }
        else
        {
            import utilities.fatal;
            fatal("Unsupported subsystem, sorry");
        }
    }
    else version(linux)
    {
        // Needs test!
        if (wmInfo.subsystem == SDL_SYSWM_X11)
        {
            auto x11_display = wmInfo.info.x11.display;
            auto x11_window = wmInfo.info.x11.window;
            surf = wgpu_create_surface_from_xlib(cast(void**)x11_display, x11_window);
        }
        else if (wmInfo.subsystem == SDL_SYSWM_WAYLAND)
        {
            auto wl_surface = wmInfo.info.wl.surface;
            auto wl_display = wmInfo.info.wl.display;
            surf = wgpu_create_surface_from_wayland(wl_surface, wl_display);
        }
        else
        {
            import utilities.fatal;
            fatal("Unsupported subsystem, sorry");
        }
    }
    else version(OSX)
    {
        // Needs test!
        SDL_Renderer* renderer = SDL_CreateRenderer(window.sdlWindow, -1, SDL_RENDERER_PRESENTVSYNC);
        auto m_layer = SDL_RenderGetMetalLayer(renderer);
        surf = wgpu_create_surface_from_metal_layer(m_layer);
        SDL_DestroyRenderer(renderer);
    }
    else
    {
        quit("Unsupported system, sorry");
    }

    return new WGPUSurface(surf);
}