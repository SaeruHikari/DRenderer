module gpu.wgpu.device;
import gpu.api;
import gpu.wgpu.surface;
import gpu.wgpu.swapchain;
import gpu.wgpu.attachment;
import gpu.wgpu.texture;
import bindbc.wgpu;
import std.stdio;
import dlib.core.memory;

class WGPUDevice : GPUDevice
{
public:
    const WGPUAdapterId adapter_;
    const WGPUDeviceId device_;
    const WGPUQueueId default_queue_;
    this(GPUSurface localSurface)
    {
        adapter_ = requestAdapter(cast(WGPUSurface) localSurface);
        device_ = requestDevice();
        default_queue_ = wgpu_device_get_default_queue(device_);
    }

    ~this()
    {
        wgpu_device_destroy(device_);
        wgpu_adapter_destroy(adapter_);
    }

    GPUSwapChain create_swap_chain(GPUSurface surface, uint w, uint h)
    {
        return New!WGPUSwapChain(
            cast(WGPUDevice) this, cast(WGPUSurface) surface, w, h
        );
    }

    GPUTexture create_texture(const GPUTextureDescriptor* descriptor)
    {
        return New!WGPUTexture(cast(WGPUDevice) this, descriptor);
    }

protected:
    static extern(C) void __requestAdapterCallback(WGPUOption_AdapterId id, void* userdata)
    {
        *cast(WGPUOption_AdapterId*)userdata = id;
    }

    WGPUAdapterId requestAdapter(WGPUSurface localSurface)
    {
        WGPURequestAdapterOptions reqAdaptersOptions =
        {
            power_preference: WGPUPowerPreference.HighPerformance,
            compatible_surface: localSurface.surface_
        };
        WGPUAdapterId resAdapter;
        wgpu_request_adapter_async(&reqAdaptersOptions, 2 | 4 | 8, 1, &__requestAdapterCallback, &resAdapter);
        WGPUCAdapterInfo adapterInfo;
        wgpu_adapter_get_info(resAdapter, &adapterInfo);
        writeln("Adapter backend: ", adapterInfo.backend);
        return resAdapter;
    }

    WGPUDeviceId requestDevice()
    {
        WGPUCLimits limits = 
        {
            max_bind_groups: 1 //WGPUDEFAULT_BIND_GROUPS
        };
        
        return wgpu_adapter_request_device(adapter_, WGPUFeatures.NONE, &limits, true, "trace");
    }
}
