#include<cuda.h>
#include<iostream>
#include<time.h>
#include<stdio.h>

char* load_cubin(const char* cubin_name)
{
    FILE* file_ptr = fopen(cubin_name, "rb+");
    if(!file_ptr)
    {
        printf("open cubin file [[%s]] fail\n ", cubin_name);
        exit(1);
    }

    fseek(file_ptr, 0, SEEK_END);
    long file_size = ftell(file_ptr);
    fseek(file_ptr, 0, SEEK_SET);

    char* image = (char*) malloc(file_size+1);
    fread(image, file_size, 1, file_ptr);
    image[file_size] = '\0';
    
    return image;
}

void unload_cubin(char* cubin_image)
{
    free(cubin_image);
}


int main(int argc, char** argv)
{
    CUdevice device;
    CUfunction func;
    CUmodule module;
    CUcontext ctx;

    double begin, end;

    cuInit(0);
    
    cuDeviceGet(&device, 0);
    cuCtxCreate(&ctx, 0, device);
    
   char* image = load_cubin("test.cubin");
   auto res  =   cuModuleLoadData(&module, (const void*)image);

   //auto res =  cuModuleLoad(&module, "test.cubin");

    
    cuModuleGetFunction(&func, module, "cluster_1_convert_5");
    CUdeviceptr pa;
    CUdeviceptr pb;
    cuMemAlloc(&pa, 67108864);
    cuMemAlloc(&pb, 67108864);
    begin = clock();

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
    cuLaunchKernel(func, grid_x, grid_y, grid_z, thread_x, thread_y, thread_z, share_memory_byte,stream, paras, extra);

    end = clock();
    std::cout << end - begin << std::endl;
    unload_cubin(image);
}


