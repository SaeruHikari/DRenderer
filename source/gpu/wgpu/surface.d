module gpu.wgpu.surface;
import bindbc.wgpu;
import gpu.wgpu.device;
import gpu.api;

class WGPUSurface : GPUSurface
{
public:
    const WGPUSurfaceId surface_;

    this(WGPUSurfaceId surface)
    {
        surface_ = surface;
    }
    ~this()
    {
        
    }
}