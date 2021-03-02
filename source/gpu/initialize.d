module gpu.initialize;
import bindbc.wgpu;
import std.stdio;

static this()
{
    import utilities.fatal;

    auto wgpuSupport = loadWGPU();
    writeln("wgpuSupport: ", wgpuSupport);

    if (wgpuSupport == WGPUSupport.noLibrary)
        fatal("Error: WGPU is not installed");
}
