#include<cuda.h>
#include<iostream>
#include<time.h>
#include<stdio.h>

static void check(CUresult result, char const *const func,
                  const char *const file, int const line) {
    if (result) {
        fprintf(stderr, "CUDA error at %s:%d code=%d \"%s\" \n", file, line,
                static_cast<unsigned int>(result), func);
        exit(EXIT_FAILURE);
    }
}

#define checkCudaDrvErrors(val) check((val), #val, __FILE__, __LINE__)

int main(int argc, char** argv)
{
    CUdevice device;
    CUfunction func;
    CUmodule module;
    CUcontext ctx;

    double begin, end;

    checkCudaDrvErrors(cuInit(0));

    checkCudaDrvErrors(cuDeviceGet(&device, 0));
    checkCudaDrvErrors(cuCtxCreate(&ctx, 0, device));

    checkCudaDrvErrors(cuModuleLoad(&module, "test.cubin"));

    checkCudaDrvErrors(cuModuleGetFunction(&func, module, "cluster_1_convert_5"));
    CUdeviceptr pa;
    CUdeviceptr pb;

    checkCudaDrvErrors(cuMemAlloc(&pa, 67108864));
    checkCudaDrvErrors(cuMemAlloc(&pb, 67108864));

    int grid_x = 432;
    int grid_y = 1;
    int grid_z = 1;

    int thread_x = 128;
    int thread_y = 1;
    int thread_z = 1;

    int share_memory_byte = 0;
    CUstream stream = 0;
    void** extra = 0;

    void* paras[] = {&pa, &pb};

    begin = clock();
    cuLaunchKernel(func, grid_x, grid_y, grid_z, thread_x, thread_y, thread_z, share_memory_byte,stream, paras, extra);
    end = clock();

    std::cout << end - begin << std::endl;
    unload_cubin(image);
}


