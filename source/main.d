module main;
import std.stdio;
import std.conv;
import system.window;
import dlib.core.memory;
import bindbc.wgpu;
import utilities.fatal;

void main()
{
    SDL2Window window = New!SDL2Window(1440, 720, "D Renderer");

    import gpu.api;
    import gpu.wgpu.device;
    import glue.sdl_wgpu_surface;

    auto wgpuSupport = loadWGPU();
    writeln("wgpuSupport: ", wgpuSupport);

    if (wgpuSupport == WGPUSupport.noLibrary)
        fatal("Error: WGPU is not installed");

    GPUSurface surface = Create(window);
    GPUDevice device = New!WGPUDevice(surface);

    GPUSwapChain swap_chain = device.create_swap_chain(surface, window.width(), window.height());
    GPUColorAttachment attachment = swap_chain.attachment();

    GPUTextureDescriptor ds_descriptor =
    {
        label: "depthTextureDescriptor0",
        extent: GPUTextureExtent3d(window.width(), window.height(), 1),
        mip_level_count: 1,
        sample_count: 1,
        dimension: EGPUTextureDimension.D2,
        format: EGPUTextureFormat.Depth24PlusStencil8,
        usage: EGPUTextureUsage.OUTPUT_ATTACHMENT
    };
    GPUTexture ds_tex = device.create_texture(&ds_descriptor);
    const GPUTextureViewDescriptor dsViewDescriptor =
    {
        label: "depthTextureViewDescriptor0",
        format: EGPUTextureFormat.Depth24PlusStencil8,
        dimension: EGPUTextureViewDimension.D2,
        aspect: EGPUTextureAspect.DepthOnly,
        base_mip_level: 0,
        level_count: 1,
        base_array_layer: 0,
        array_layer_count: 1
    };
    GPUTextureView ds_view = ds_tex.view(&dsViewDescriptor);

}
