module gpu.api;

struct GPUTextureExtent3d
{
    uint width;
    uint height;
    uint depth;
}

struct GPUTextureDescriptor
{
    const char* label;
    uint sample_count;
    uint mip_level_count;
    GPUTextureExtent3d extent;
    EGPUTextureDimension dimension;
    EGPUTextureFormat format;
    EGPUTextureUsage usage;
}

struct GPUTextureViewDescriptor
{
    const char* label;
    EGPUTextureFormat format;
    EGPUTextureViewDimension dimension;
    EGPUTextureAspect aspect;
    uint base_mip_level;
    uint level_count;
    uint base_array_layer;
    uint array_layer_count;
}

struct GPUColorAttachmentDescriptor
{

}

struct GPUDSAttachmentDescriptor
{

}

interface GPUTextureView
{

}

interface GPUTexture
{
    GPUTextureView view(const(GPUTextureViewDescriptor)* descriptor);
    //GPUDSAttachment attachment(const GPUDSAttachmentDescriptor* desc);
    //GPUColorAttachment attachment(const GPUColorAttachmentDescriptor* desc);
}

struct GPUColorAttachment
{

}

struct GPUDSAttachment
{

}

interface GPUSwapChain
{
    GPUColorAttachment attachment();
}

interface GPUDevice
{
    GPUTexture create_texture(const GPUTextureDescriptor* descriptor);
    GPUSwapChain create_swap_chain(GPUSurface surface, uint w, uint h);
}

interface GPUSurface
{
    
}

enum EGPUTextureAspect
{
   /**
    * Depth, Stencil, and Color.
    */
    All,
   /**
    * Stencil.
    */
    StencilOnly,
   /**
    * Depth.
    */
    DepthOnly
}

enum EGPUTextureUsage: uint
{
   /**
    * Allows a texture to be the source in a [`CommandEncoder::copy_texture_to_buffer`] or
    * [`CommandEncoder::copy_texture_to_texture`] operation.
    */
    COPY_SRC = 1,
   /**
    * Allows a texture to be the destination in a  [`CommandEncoder::copy_texture_to_buffer`],
    * [`CommandEncoder::copy_texture_to_texture`], or [`Queue::write_texture`] operation.
    */
    COPY_DST = 2,
   /**
    * Allows a texture to be a [`BindingType::SampledTexture`] in a bind group.
    */
    SAMPLED = 4,
   /**
    * Allows a texture to be a [`BindingType::StorageTexture`] in a bind group.
    */
    STORAGE = 8,
   /**
    * Allows a texture to be a output attachment of a renderpass.
    */
    OUTPUT_ATTACHMENT = 16
}


enum EGPUTextureDimension
{
    D1,
    D2,
    D3
}

enum EGPUTextureViewDimension
{
    D1,
    D2,
    D2Array,
    Cube,
    CubeArray,
    D3
}

enum EGPUTextureFormat
{
    /**
    * Red channel only. 8 bit integer per channel. [0, 255] converted to/from float [0, 1] in shader.
    */
    R8Unorm = 0,
   /**
    * Red channel only. 8 bit integer per channel. [-127, 127] converted to/from float [-1, 1] in shader.
    */
    R8Snorm = 1,
   /**
    * Red channel only. 8 bit integer per channel. Unsigned in shader.
    */
    R8Uint = 2,
   /**
    * Red channel only. 8 bit integer per channel. Signed in shader.
    */
    R8Sint = 3,
   /**
    * Red channel only. 16 bit integer per channel. Unsigned in shader.
    */
    R16Uint = 4,
   /**
    * Red channel only. 16 bit integer per channel. Signed in shader.
    */
    R16Sint = 5,
   /**
    * Red channel only. 16 bit float per channel. Float in shader.
    */
    R16Float = 6,
   /**
    * Red and green channels. 8 bit integer per channel. [0, 255] converted to/from float [0, 1] in shader.
    */
    Rg8Unorm = 7,
   /**
    * Red and green channels. 8 bit integer per channel. [-127, 127] converted to/from float [-1, 1] in shader.
    */
    Rg8Snorm = 8,
   /**
    * Red and green channels. 8 bit integer per channel. Unsigned in shader.
    */
    Rg8Uint = 9,
   /**
    * Red and green channel s. 8 bit integer per channel. Signed in shader.
    */
    Rg8Sint = 10,
   /**
    * Red channel only. 32 bit integer per channel. Unsigned in shader.
    */
    R32Uint = 11,
   /**
    * Red channel only. 32 bit integer per channel. Signed in shader.
    */
    R32Sint = 12,
   /**
    * Red channel only. 32 bit float per channel. Float in shader.
    */
    R32Float = 13,
   /**
    * Red and green channels. 16 bit integer per channel. Unsigned in shader.
    */
    Rg16Uint = 14,
   /**
    * Red and green channels. 16 bit integer per channel. Signed in shader.
    */
    Rg16Sint = 15,
   /**
    * Red and green channels. 16 bit float per channel. Float in shader.
    */
    Rg16Float = 16,
   /**
    * Red, green, blue, and alpha channels. 8 bit integer per channel. [0, 255] converted to/from float [0, 1] in shader.
    */
    Rgba8Unorm = 17,
   /**
    * Red, green, blue, and alpha channels. 8 bit integer per channel. Srgb-color [0, 255] converted to/from linear-color float [0, 1] in shader.
    */
    Rgba8UnormSrgb = 18,
   /**
    * Red, green, blue, and alpha channels. 8 bit integer per channel. [-127, 127] converted to/from float [-1, 1] in shader.
    */
    Rgba8Snorm = 19,
   /**
    * Red, green, blue, and alpha channels. 8 bit integer per channel. Unsigned in shader.
    */
    Rgba8Uint = 20,
   /**
    * Red, green, blue, and alpha channels. 8 bit integer per channel. Signed in shader.
    */
    Rgba8Sint = 21,
   /**
    * Blue, green, red, and alpha channels. 8 bit integer per channel. [0, 255] converted to/from float [0, 1] in shader.
    */
    Bgra8Unorm = 22,
   /**
    * Blue, green, red, and alpha channels. 8 bit integer per channel. Srgb-color [0, 255] converted to/from linear-color float [0, 1] in shader.
    */
    Bgra8UnormSrgb = 23,
   /**
    * Red, green, blue, and alpha channels. 10 bit integer for RGB channels, 2 bit integer for alpha channel. [0, 1023] ([0, 3] for alpha) converted to/from float [0, 1] in shader.
    */
    Rgb10a2Unorm = 24,
   /**
    * Red, green, and blue channels. 11 bit float with no sign bit for RG channels. 10 bit float with no sign bit for blue channel. Float in shader.
    */
    Rg11b10Float = 25,
   /**
    * Red and green channels. 32 bit integer per channel. Unsigned in shader.
    */
    Rg32Uint = 26,
   /**
    * Red and green channels. 32 bit integer per channel. Signed in shader.
    */
    Rg32Sint = 27,
   /**
    * Red and green channels. 32 bit float per channel. Float in shader.
    */
    Rg32Float = 28,
   /**
    * Red, green, blue, and alpha channels. 16 bit integer per channel. Unsigned in shader.
    */
    Rgba16Uint = 29,
   /**
    * Red, green, blue, and alpha channels. 16 bit integer per channel. Signed in shader.
    */
    Rgba16Sint = 30,
   /**
    * Red, green, blue, and alpha channels. 16 bit float per channel. Float in shader.
    */
    Rgba16Float = 31,
   /**
    * Red, green, blue, and alpha channels. 32 bit integer per channel. Unsigned in shader.
    */
    Rgba32Uint = 32,
   /**
    * Red, green, blue, and alpha channels. 32 bit integer per channel. Signed in shader.
    */
    Rgba32Sint = 33,
   /**
    * Red, green, blue, and alpha channels. 32 bit float per channel. Float in shader.
    */
    Rgba32Float = 34,
   /**
    * Special depth format with 32 bit floating point depth.
    */
    Depth32Float = 35,
   /**
    * Special depth format with at least 24 bit integer depth.
    */
    Depth24Plus = 36,
   /**
    * Special depth/stencil format with at least 24 bit integer depth and 8 bits integer stencil.
    */
    Depth24PlusStencil8 = 37,
   /**
    * 4x4 block compressed texture. 8 bytes per block (4 bit/px). 4 color + alpha pallet. 5 bit R + 6 bit G + 5 bit B + 1 bit alpha.
    * [0, 64] ([0, 1] for alpha) converted to/from float [0, 1] in shader.
    *
    * Also known as DXT1.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc1RgbaUnorm = 38,
   /**
    * 4x4 block compressed texture. 8 bytes per block (4 bit/px). 4 color + alpha pallet. 5 bit R + 6 bit G + 5 bit B + 1 bit alpha.
    * Srgb-color [0, 64] ([0, 16] for alpha) converted to/from linear-color float [0, 1] in shader.
    *
    * Also known as DXT1.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc1RgbaUnormSrgb = 39,
   /**
    * 4x4 block compressed texture. 16 bytes per block (8 bit/px). 4 color pallet. 5 bit R + 6 bit G + 5 bit B + 4 bit alpha.
    * [0, 64] ([0, 16] for alpha) converted to/from float [0, 1] in shader.
    *
    * Also known as DXT3.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc2RgbaUnorm = 40,
   /**
    * 4x4 block compressed texture. 16 bytes per block (8 bit/px). 4 color pallet. 5 bit R + 6 bit G + 5 bit B + 4 bit alpha.
    * Srgb-color [0, 64] ([0, 256] for alpha) converted to/from linear-color float [0, 1] in shader.
    *
    * Also known as DXT3.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc2RgbaUnormSrgb = 41,
   /**
    * 4x4 block compressed texture. 16 bytes per block (8 bit/px). 4 color pallet + 8 alpha pallet. 5 bit R + 6 bit G + 5 bit B + 8 bit alpha.
    * [0, 64] ([0, 256] for alpha) converted to/from float [0, 1] in shader.
    *
    * Also known as DXT5.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc3RgbaUnorm = 42,
   /**
    * 4x4 block compressed texture. 16 bytes per block (8 bit/px). 4 color pallet + 8 alpha pallet. 5 bit R + 6 bit G + 5 bit B + 8 bit alpha.
    * Srgb-color [0, 64] ([0, 256] for alpha) converted to/from linear-color float [0, 1] in shader.
    *
    * Also known as DXT5.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc3RgbaUnormSrgb = 43,
   /**
    * 4x4 block compressed texture. 8 bytes per block (4 bit/px). 8 color pallet. 8 bit R.
    * [0, 256] converted to/from float [0, 1] in shader.
    *
    * Also known as RGTC1.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc4RUnorm = 44,
   /**
    * 4x4 block compressed texture. 8 bytes per block (4 bit/px). 8 color pallet. 8 bit R.
    * [-127, 127] converted to/from float [-1, 1] in shader.
    *
    * Also known as RGTC1.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc4RSnorm = 45,
   /**
    * 4x4 block compressed texture. 16 bytes per block (16 bit/px). 8 color red pallet + 8 color green pallet. 8 bit RG.
    * [0, 256] converted to/from float [0, 1] in shader.
    *
    * Also known as RGTC2.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc5RgUnorm = 46,
   /**
    * 4x4 block compressed texture. 16 bytes per block (16 bit/px). 8 color red pallet + 8 color green pallet. 8 bit RG.
    * [-127, 127] converted to/from float [-1, 1] in shader.
    *
    * Also known as RGTC2.
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc5RgSnorm = 47,
   /**
    * 4x4 block compressed texture. 16 bytes per block (16 bit/px). Variable sized pallet. 16 bit unsigned float RGB. Float in shader.
    *
    * Also known as BPTC (float).
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc6hRgbUfloat = 48,
   /**
    * 4x4 block compressed texture. 16 bytes per block (16 bit/px). Variable sized pallet. 16 bit signed float RGB. Float in shader.
    *
    * Also known as BPTC (float).
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc6hRgbSfloat = 49,
   /**
    * 4x4 block compressed texture. 16 bytes per block (16 bit/px). Variable sized pallet. 8 bit integer RGBA.
    * [0, 256] converted to/from float [0, 1] in shader.
    *
    * Also known as BPTC (unorm).
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc7RgbaUnorm = 50,
   /**
    * 4x4 block compressed texture. 16 bytes per block (16 bit/px). Variable sized pallet. 8 bit integer RGBA.
    * Srgb-color [0, 255] converted to/from linear-color float [0, 1] in shader.
    *
    * Also known as BPTC (unorm).
    *
    * [`Features::TEXTURE_COMPRESSION_BC`] must be enabled to use this texture format.
    */
    Bc7RgbaUnormSrgb = 51
}