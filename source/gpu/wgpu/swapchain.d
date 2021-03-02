module gpu.wgpu.swapchain;
import bindbc.wgpu;
import gpu.wgpu.surface;
import gpu.wgpu.device;
import gpu.wgpu.attachment;
import gpu.api;

class WGPUSwapChain : GPUSwapChain
{
public:
    const WGPUSwapChainId swapchain_;
    this(WGPUDevice device, WGPUSurface surface, uint w, uint h)
    {
        WGPUSwapChainDescriptor sd = {
            usage: WGPUTextureUsage.OUTPUT_ATTACHMENT,
            format: WGPUTextureFormat.Bgra8Unorm,
            width: w,
            height: h,
            present_mode: WGPUPresentMode.Fifo
        };
        swapchain_ = wgpu_device_create_swap_chain(device.device_, surface.surface_, &sd);
    }
    ~this()
    {
        
    }

    void swap()
    {
        nextSwapchainOutput = wgpu_swap_chain_get_next_texture(swapchain_);
    }

    GPUColorAttachment attachment()
    {
        WGPUPassChannel_Color channel = {
            load_op: WGPULoadOp.Clear,
            store_op: WGPUStoreOp.Store,
            clear_value: WGPUColor(0.5, 0.5, 0.5, 1.0),
            read_only: false
        };
        
        WGPURenderPassColorAttachmentDescriptor colorAttachment =
        {
            attachment: nextSwapchainOutput.view_id,
            resolve_target: 0,
            channel: channel
        };
        WGPUColorAttachment result =
        {
            attachment_: colorAttachment
        };
        return result;
    }
protected:
    WGPUSwapChainOutput nextSwapchainOutput;
}