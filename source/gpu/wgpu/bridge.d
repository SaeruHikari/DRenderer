module gpu.wgpu.bridge;
import bindbc.wgpu;
import gpu.api;

WGPUTextureDimension translate(EGPUTextureDimension d)
{
    switch (d)
    {
        case EGPUTextureDimension.D1: return WGPUTextureDimension.D1;
        case EGPUTextureDimension.D2: return WGPUTextureDimension.D2;
        case EGPUTextureDimension.D3: return WGPUTextureDimension.D3;
        default: assert(0);
    }
}

WGPUTextureUsage translate(EGPUTextureUsage u)
{
    switch (u)
    {
        case EGPUTextureUsage.COPY_SRC: return WGPUTextureUsage.COPY_SRC;
        case EGPUTextureUsage.COPY_DST: return WGPUTextureUsage.COPY_DST;
        case EGPUTextureUsage.SAMPLED: return WGPUTextureUsage.SAMPLED;
        case EGPUTextureUsage.STORAGE: return WGPUTextureUsage.STORAGE;
        case EGPUTextureUsage.OUTPUT_ATTACHMENT: return WGPUTextureUsage.OUTPUT_ATTACHMENT;
        default: assert(0);
    }
}


WGPUTextureViewDimension translate(EGPUTextureViewDimension d)
{
    switch (d)
    {
        case EGPUTextureViewDimension.D1: return WGPUTextureViewDimension.D1;
        case EGPUTextureViewDimension.D2: return WGPUTextureViewDimension.D2;
        case EGPUTextureViewDimension.D2Array: return WGPUTextureViewDimension.D2Array;
        case EGPUTextureViewDimension.Cube: return WGPUTextureViewDimension.Cube;
        case EGPUTextureViewDimension.CubeArray: return WGPUTextureViewDimension.CubeArray;
        case EGPUTextureViewDimension.D3: return WGPUTextureViewDimension.D3;
        default: assert(0);
    }
}

WGPUTextureAspect translate(EGPUTextureAspect a)
{
    switch (a)
    {
        case EGPUTextureAspect.DepthOnly: return WGPUTextureAspect.DepthOnly;
        case EGPUTextureAspect.StencilOnly: return WGPUTextureAspect.StencilOnly;
        case EGPUTextureAspect.All: return WGPUTextureAspect.All;
        default: assert(0);
    }
}


WGPUTextureFormat translate(EGPUTextureFormat fmt)
{
    switch (fmt)
    {
        case EGPUTextureFormat.R8Unorm: return WGPUTextureFormat.R8Unorm;
        case EGPUTextureFormat.R8Snorm: return WGPUTextureFormat.R8Snorm;
        case EGPUTextureFormat.R8Uint: return WGPUTextureFormat.R8Uint;
        case EGPUTextureFormat.R8Sint: return WGPUTextureFormat.R8Sint;
        case EGPUTextureFormat.R16Uint: return WGPUTextureFormat.R16Uint;
        case EGPUTextureFormat.R16Sint: return WGPUTextureFormat.R16Sint;
        case EGPUTextureFormat.R16Float: return WGPUTextureFormat.R16Float;
        case EGPUTextureFormat.Rg8Unorm: return WGPUTextureFormat.Rg8Unorm;
        case EGPUTextureFormat.Rg8Snorm: return WGPUTextureFormat.Rg8Snorm;
        case EGPUTextureFormat.Rg8Uint: return WGPUTextureFormat.Rg8Uint;
        case EGPUTextureFormat.Rg8Sint: return WGPUTextureFormat.Rg8Sint;
        case EGPUTextureFormat.R32Uint: return WGPUTextureFormat.R32Uint;
        case EGPUTextureFormat.R32Sint: return WGPUTextureFormat.R32Sint;
        case EGPUTextureFormat.R32Float: return WGPUTextureFormat.R32Float;
        case EGPUTextureFormat.Rg16Uint: return WGPUTextureFormat.Rg16Uint;
        case EGPUTextureFormat.Rg16Sint: return WGPUTextureFormat.Rg16Sint;
        case EGPUTextureFormat.Rg16Float: return WGPUTextureFormat.Rg16Float;
        case EGPUTextureFormat.Rgba8Unorm: return WGPUTextureFormat.Rgba8Unorm;
        case EGPUTextureFormat.Rgba8UnormSrgb: return WGPUTextureFormat.Rgba8UnormSrgb;
        case EGPUTextureFormat.Rgba8Snorm: return WGPUTextureFormat.Rgba8Snorm;
        case EGPUTextureFormat.Rgba8Uint: return WGPUTextureFormat.Rgba8Uint;
        case EGPUTextureFormat.Rgba8Sint: return WGPUTextureFormat.Rgba8Sint;
        case EGPUTextureFormat.Bgra8Unorm: return WGPUTextureFormat.Bgra8Unorm;
        case EGPUTextureFormat.Bgra8UnormSrgb: return WGPUTextureFormat.Bgra8UnormSrgb;
        case EGPUTextureFormat.Rgb10a2Unorm: return WGPUTextureFormat.Rgb10a2Unorm;
        case EGPUTextureFormat.Rg11b10Float: return WGPUTextureFormat.Rg11b10Float;
        case EGPUTextureFormat.Rg32Uint: return WGPUTextureFormat.Rg32Uint;
        case EGPUTextureFormat.Rg32Sint: return WGPUTextureFormat.Rg32Sint;
        case EGPUTextureFormat.Rg32Float: return WGPUTextureFormat.Rg32Float;
        case EGPUTextureFormat.Rgba16Uint: return WGPUTextureFormat.Rgba16Uint;
        case EGPUTextureFormat.Rgba16Sint: return WGPUTextureFormat.Rgba16Sint;
        case EGPUTextureFormat.Rgba16Float: return WGPUTextureFormat.Rgba16Float;
        case EGPUTextureFormat.Rgba32Uint: return WGPUTextureFormat.Rgba32Uint;
        case EGPUTextureFormat.Rgba32Sint: return WGPUTextureFormat.Rgba32Sint;
        case EGPUTextureFormat.Rgba32Float: return WGPUTextureFormat.Rgba32Float;
        case EGPUTextureFormat.Depth32Float: return WGPUTextureFormat.Depth32Float;
        case EGPUTextureFormat.Depth24Plus: return WGPUTextureFormat.Depth24Plus;
        case EGPUTextureFormat.Depth24PlusStencil8: return WGPUTextureFormat.Depth24PlusStencil8;
        //case EGPUTextureFormat.Bc1RgbaUnorm: return WGPUTextureFormat.Bc1RgbaUnorm;
        //case EGPUTextureFormat.Bc1RgbaUnormSrgb: return WGPUTextureFormat.Bc1RgbaUnormSrgb;
        //case EGPUTextureFormat.Bc2RgbaUnorm: return WGPUTextureFormat.Bc2RgbaUnorm;
        //case EGPUTextureFormat.Bc2RgbaUnormSrgb: return WGPUTextureFormat.Bc2RgbaUnormSrgb;
        //case EGPUTextureFormat.Bc3RgbaUnorm: return WGPUTextureFormat.Bc3RgbaUnorm;
        //case EGPUTextureFormat.Bc3RgbaUnormSrgb: return WGPUTextureFormat.Bc3RgbaUnormSrgb;
        //case EGPUTextureFormat.Bc4RUnorm: return WGPUTextureFormat.Bc4RUnorm;
        //case EGPUTextureFormat.Bc4RSnorm: return WGPUTextureFormat.Bc4RSnorm;
        //case EGPUTextureFormat.Bc5RgUnorm: return WGPUTextureFormat.Bc5RgUnorm;
        //case EGPUTextureFormat.Bc5RgSnorm: return WGPUTextureFormat.Bc5RgSnorm;
        //case EGPUTextureFormat.Bc6hRgbUfloat: return WGPUTextureFormat.Bc6hRgbUfloat;
        //case EGPUTextureFormat.Bc6hRgbSfloat: return WGPUTextureFormat.Bc6hRgbSfloat;
        //case EGPUTextureFormat.Bc7RgbaUnorm: return WGPUTextureFormat.Bc7RgbaUnorm;
        //case EGPUTextureFormat.Bc7RgbaUnormSrgb: return WGPUTextureFormat.Bc7RgbaUnormSrgb;
        default: assert(0);
    }
}
