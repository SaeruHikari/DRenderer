module gpu.wgpu.texture;
import gpu.wgpu.bridge;
import bindbc.wgpu;
import gpu.wgpu.device;
import gpu.api;
import dlib.core.memory;

class WGPUTextureView : GPUTextureView
{
    const WGPUTextureViewId texture_view_;
    this(WGPUTextureViewId view_id)
    {
        texture_view_ = view_id;
    }
    ~this()
    {
        wgpu_texture_view_destroy(texture_view_);
    }
}

class WGPUTexture : GPUTexture
{
public:
    const WGPUTextureId texture_;
    const GPUDevice device_;
    this(WGPUDevice device, const GPUTextureDescriptor* descriptor)
    {
        device_ = device;
        WGPUTextureDescriptor wgpu_t_descriptor =
        {
            label: descriptor.label,
            size: WGPUExtent3d(descriptor.extent.width, descriptor.extent.height, descriptor.extent.depth),
            mip_level_count: descriptor.mip_level_count,
            sample_count: descriptor.sample_count,
            dimension: translate(descriptor.dimension),
            format: translate(descriptor.format),
            usage: translate(descriptor.usage)
        };
        texture_ = wgpu_device_create_texture(device.device_, &wgpu_t_descriptor);
    }

    GPUTextureView view(const GPUTextureViewDescriptor* descriptor)
    {
        WGPUTextureViewDescriptor viewDescriptor =
        {
            label: descriptor.label,
            format: translate(descriptor.format),
            dimension: translate(descriptor.dimension),
            aspect: translate(descriptor.aspect),
            base_mip_level: descriptor.base_mip_level,
            level_count: descriptor.level_count,
            base_array_layer: descriptor.base_array_layer,
            array_layer_count: descriptor.array_layer_count
        };
        return New!WGPUTextureView(wgpu_texture_create_view(texture_, &viewDescriptor));
    }

    ~this()
    {
        wgpu_texture_destroy(texture_);
    }
}