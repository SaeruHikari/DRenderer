module gpu.wgpu.attachment;
import gpu.api;
import bindbc.wgpu;

struct WGPUColorAttachment
{
    public GPUColorAttachment base;
    alias base this;
    const WGPURenderPassColorAttachmentDescriptor attachment_;
}

 struct WGPUDSAttachment
 {
    public GPUDSAttachment base;
    alias base this;
    const WGPURenderPassDepthStencilAttachmentDescriptor attachment_;
 }