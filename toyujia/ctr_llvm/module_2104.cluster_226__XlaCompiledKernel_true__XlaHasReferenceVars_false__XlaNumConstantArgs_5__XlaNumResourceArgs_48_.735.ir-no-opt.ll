target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@2 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache1 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@buffer_for_constant_4 = constant [64 x i8] c"\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@shared_cache2 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache3 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@3 = private unnamed_addr constant [4 x i8] zeroinitializer
@4 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache4 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache5 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache6 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@5 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache7 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache8 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@7 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@8 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache9 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache10 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache11 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache12 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@9 = private unnamed_addr constant [4 x i8] zeroinitializer
@10 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache13 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache14 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache15 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@11 = private unnamed_addr constant [4 x i8] zeroinitializer
@12 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache16 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache17 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef

define void @fusion_71(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(2097152) %arg3, ptr noalias align 128 dereferenceable(16384) %arg4, ptr noalias align 128 dereferenceable(2097152) %arg5, ptr noalias align 128 dereferenceable(16384) %arg6, ptr noalias align 128 dereferenceable(2097152) %arg7) {
entry:
  %return_buffer210 = alloca float, align 4
  %result_from_other_lane208 = alloca float, align 4
  %return_buffer207 = alloca float, align 4
  %result_from_other_lane205 = alloca float, align 4
  %return_buffer204 = alloca float, align 4
  %result_from_other_lane202 = alloca float, align 4
  %return_buffer201 = alloca float, align 4
  %result_from_other_lane199 = alloca float, align 4
  %return_buffer198 = alloca float, align 4
  %result_from_other_lane196 = alloca float, align 4
  %return_buffer188 = alloca float, align 4
  %result_from_other_lane186 = alloca float, align 4
  %return_buffer185 = alloca float, align 4
  %result_from_other_lane183 = alloca float, align 4
  %return_buffer182 = alloca float, align 4
  %result_from_other_lane180 = alloca float, align 4
  %return_buffer179 = alloca float, align 4
  %result_from_other_lane177 = alloca float, align 4
  %return_buffer176 = alloca float, align 4
  %result_from_other_lane174 = alloca float, align 4
  %return_buffer166 = alloca float, align 4
  %result_from_other_lane164 = alloca float, align 4
  %return_buffer163 = alloca float, align 4
  %result_from_other_lane161 = alloca float, align 4
  %return_buffer160 = alloca float, align 4
  %result_from_other_lane158 = alloca float, align 4
  %return_buffer157 = alloca float, align 4
  %result_from_other_lane155 = alloca float, align 4
  %return_buffer154 = alloca float, align 4
  %result_from_other_lane152 = alloca float, align 4
  %return_buffer148 = alloca float, align 4
  %result_from_other_lane146 = alloca float, align 4
  %return_buffer145 = alloca float, align 4
  %result_from_other_lane143 = alloca float, align 4
  %return_buffer142 = alloca float, align 4
  %result_from_other_lane140 = alloca float, align 4
  %return_buffer139 = alloca float, align 4
  %result_from_other_lane137 = alloca float, align 4
  %return_buffer136 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer100 = alloca float, align 4
  %return_buffer82 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result2 = alloca float, i32 2, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !74
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after212, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_34_constant_18 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_34_constant_18, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_34_constant_18, ptr %3, align 4
  %region_0_34_constant_183 = load float, ptr @2, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_34_constant_183, ptr %4, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 1
  store float %region_0_34_constant_183, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %8 = urem i32 %6, 1024
  %9 = udiv i32 %6, 1024
  %10 = mul i32 %7, 1
  %11 = add i32 %10, %9
  %12 = icmp ult i32 %11, 64
  br i1 %12, label %13, label %early_return

13:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %8, 32
  %thread_id.y = udiv i32 %8, 32
  %lane_id = urem i32 %8, 32
  %14 = udiv i32 %11, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %11, 1
  %17 = urem i32 %16, 1
  %18 = udiv i32 %11, 1
  %19 = icmp eq i32 %17, 0
  %tile_bound = select i1 %19, i32 128, i32 4096
  %20 = icmp eq i32 %15, 0
  %tile_bound4 = select i1 %20, i32 64, i32 64
  %tile_origin.0 = mul i32 %18, 1
  %tile_origin.1 = mul i32 %17, 4096
  %tile_origin.2 = mul i32 %15, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %13
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %21 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %21, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %22 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %23 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after64, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %24 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %24, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc5 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc5, ptr %tile_loop.invar_address, align 4
  %25 = icmp eq i32 %tile_loop.indvar, 0
  %26 = mul i32 %tile_loop.indvar, 2
  %27 = add i32 %26, 0
  %x_loc = add i32 %27, %23
  %28 = add i32 %tile_origin.1, %y_in_tile.indvar
  %29 = add i32 %tile_origin.2, %x_loc
  %30 = icmp ult i32 %x_loc, %tile_bound4
  br i1 %30, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %31 = mul i32 %tile_loop.indvar, 2
  %32 = add i32 %31, 1
  %x_loc62 = add i32 %32, %23
  %33 = add i32 %tile_origin.1, %y_in_tile.indvar
  %34 = add i32 %tile_origin.2, %x_loc62
  %35 = icmp ult i32 %x_loc62, %tile_bound4
  br i1 %35, label %x_in_tile-true63, label %x_in_tile-after64

x_in_tile-after64:                                ; preds = %x_in_tile-true63, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !77

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !80

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache, i32 0, i32 %9, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %36 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %37 = load float, ptr %current_output, align 4
  store float %37, ptr %36, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache, i32 0, i32 %9, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %38 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result135 = load float, ptr %38, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result135, i32 16, i32 31)
  store float %39, ptr %result_from_other_lane, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane, ptr %return_buffer136)
  %40 = load float, ptr %return_buffer136, align 4
  store float %40, ptr %38, align 4
  %partial_reduction_result138 = load float, ptr %38, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result138, i32 8, i32 31)
  store float %41, ptr %result_from_other_lane137, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane137, ptr %return_buffer139)
  %42 = load float, ptr %return_buffer139, align 4
  store float %42, ptr %38, align 4
  %partial_reduction_result141 = load float, ptr %38, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result141, i32 4, i32 31)
  store float %43, ptr %result_from_other_lane140, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane140, ptr %return_buffer142)
  %44 = load float, ptr %return_buffer142, align 4
  store float %44, ptr %38, align 4
  %partial_reduction_result144 = load float, ptr %38, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result144, i32 2, i32 31)
  store float %45, ptr %result_from_other_lane143, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane143, ptr %return_buffer145)
  %46 = load float, ptr %return_buffer145, align 4
  store float %46, ptr %38, align 4
  %partial_reduction_result147 = load float, ptr %38, align 4
  %47 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result147, i32 1, i32 31)
  store float %47, ptr %result_from_other_lane146, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane146, ptr %return_buffer148)
  %48 = load float, ptr %return_buffer148, align 4
  store float %48, ptr %38, align 4
  %49 = icmp ult i32 %thread_id.x, %tile_bound
  %50 = mul i32 %thread_id.y, 2
  %51 = icmp ult i32 %50, %tile_bound4
  %52 = and i1 %51, %49
  %53 = icmp eq i32 %lane_id, 0
  %54 = and i1 %52, %53
  br i1 %54, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address149 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache, i32 0, i32 %9, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %55 = addrspacecast ptr addrspace(3) %shmem_output_address149 to ptr
  %current_output150 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %56 = load float, ptr %current_output150, align 4
  store float %56, ptr %55, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr151 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache, i32 0, i32 %9, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %57 = addrspacecast ptr addrspace(3) %shmem_transposed_addr151 to ptr
  %partial_reduction_result153 = load float, ptr %57, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result153, i32 16, i32 31)
  store float %58, ptr %result_from_other_lane152, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane152, ptr %return_buffer154)
  %59 = load float, ptr %return_buffer154, align 4
  store float %59, ptr %57, align 4
  %partial_reduction_result156 = load float, ptr %57, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result156, i32 8, i32 31)
  store float %60, ptr %result_from_other_lane155, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane155, ptr %return_buffer157)
  %61 = load float, ptr %return_buffer157, align 4
  store float %61, ptr %57, align 4
  %partial_reduction_result159 = load float, ptr %57, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result159, i32 4, i32 31)
  store float %62, ptr %result_from_other_lane158, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane158, ptr %return_buffer160)
  %63 = load float, ptr %return_buffer160, align 4
  store float %63, ptr %57, align 4
  %partial_reduction_result162 = load float, ptr %57, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result162, i32 2, i32 31)
  store float %64, ptr %result_from_other_lane161, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane161, ptr %return_buffer163)
  %65 = load float, ptr %return_buffer163, align 4
  store float %65, ptr %57, align 4
  %partial_reduction_result165 = load float, ptr %57, align 4
  %66 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result165, i32 1, i32 31)
  store float %66, ptr %result_from_other_lane164, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane164, ptr %return_buffer166)
  %67 = load float, ptr %return_buffer166, align 4
  store float %67, ptr %57, align 4
  %68 = icmp ult i32 %thread_id.x, %tile_bound
  %69 = mul i32 %thread_id.y, 2
  %70 = icmp ult i32 %69, %tile_bound4
  %71 = and i1 %70, %68
  %72 = icmp eq i32 %lane_id, 0
  %73 = and i1 %71, %72
  br i1 %73, label %reduction_write_output-true167, label %reduction_write_output-after168

reduction_write_output-after168:                  ; preds = %reduction_write_output-true167, %reduction_write_output-after
  %shmem_output_address171 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %9, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %74 = addrspacecast ptr addrspace(3) %shmem_output_address171 to ptr
  %current_output172 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %75 = load float, ptr %current_output172, align 4
  store float %75, ptr %74, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr173 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %9, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %76 = addrspacecast ptr addrspace(3) %shmem_transposed_addr173 to ptr
  %partial_reduction_result175 = load float, ptr %76, align 4
  %77 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result175, i32 16, i32 31)
  store float %77, ptr %result_from_other_lane174, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane174, ptr %return_buffer176)
  %78 = load float, ptr %return_buffer176, align 4
  store float %78, ptr %76, align 4
  %partial_reduction_result178 = load float, ptr %76, align 4
  %79 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result178, i32 8, i32 31)
  store float %79, ptr %result_from_other_lane177, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane177, ptr %return_buffer179)
  %80 = load float, ptr %return_buffer179, align 4
  store float %80, ptr %76, align 4
  %partial_reduction_result181 = load float, ptr %76, align 4
  %81 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result181, i32 4, i32 31)
  store float %81, ptr %result_from_other_lane180, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane180, ptr %return_buffer182)
  %82 = load float, ptr %return_buffer182, align 4
  store float %82, ptr %76, align 4
  %partial_reduction_result184 = load float, ptr %76, align 4
  %83 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result184, i32 2, i32 31)
  store float %83, ptr %result_from_other_lane183, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane183, ptr %return_buffer185)
  %84 = load float, ptr %return_buffer185, align 4
  store float %84, ptr %76, align 4
  %partial_reduction_result187 = load float, ptr %76, align 4
  %85 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result187, i32 1, i32 31)
  store float %85, ptr %result_from_other_lane186, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane186, ptr %return_buffer188)
  %86 = load float, ptr %return_buffer188, align 4
  store float %86, ptr %76, align 4
  %87 = icmp ult i32 %thread_id.x, %tile_bound
  %88 = mul i32 %thread_id.y, 2
  %89 = icmp ult i32 %88, %tile_bound4
  %90 = and i1 %89, %87
  %91 = icmp eq i32 %lane_id, 0
  %92 = and i1 %90, %91
  br i1 %92, label %reduction_write_output-true189, label %reduction_write_output-after190

reduction_write_output-after190:                  ; preds = %reduction_write_output-true189, %reduction_write_output-after168
  %shmem_output_address193 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %9, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %93 = addrspacecast ptr addrspace(3) %shmem_output_address193 to ptr
  %current_output194 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 1
  %94 = load float, ptr %current_output194, align 4
  store float %94, ptr %93, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr195 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %9, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %95 = addrspacecast ptr addrspace(3) %shmem_transposed_addr195 to ptr
  %partial_reduction_result197 = load float, ptr %95, align 4
  %96 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result197, i32 16, i32 31)
  store float %96, ptr %result_from_other_lane196, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane196, ptr %return_buffer198)
  %97 = load float, ptr %return_buffer198, align 4
  store float %97, ptr %95, align 4
  %partial_reduction_result200 = load float, ptr %95, align 4
  %98 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result200, i32 8, i32 31)
  store float %98, ptr %result_from_other_lane199, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane199, ptr %return_buffer201)
  %99 = load float, ptr %return_buffer201, align 4
  store float %99, ptr %95, align 4
  %partial_reduction_result203 = load float, ptr %95, align 4
  %100 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result203, i32 4, i32 31)
  store float %100, ptr %result_from_other_lane202, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane202, ptr %return_buffer204)
  %101 = load float, ptr %return_buffer204, align 4
  store float %101, ptr %95, align 4
  %partial_reduction_result206 = load float, ptr %95, align 4
  %102 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result206, i32 2, i32 31)
  store float %102, ptr %result_from_other_lane205, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane205, ptr %return_buffer207)
  %103 = load float, ptr %return_buffer207, align 4
  store float %103, ptr %95, align 4
  %partial_reduction_result209 = load float, ptr %95, align 4
  %104 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result209, i32 1, i32 31)
  store float %104, ptr %result_from_other_lane208, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane208, ptr %return_buffer210)
  %105 = load float, ptr %return_buffer210, align 4
  store float %105, ptr %95, align 4
  %106 = icmp ult i32 %thread_id.x, %tile_bound
  %107 = mul i32 %thread_id.y, 2
  %108 = icmp ult i32 %107, %tile_bound4
  %109 = and i1 %108, %106
  %110 = icmp eq i32 %lane_id, 0
  %111 = and i1 %109, %110
  br i1 %111, label %reduction_write_output-true211, label %reduction_write_output-after212

reduction_write_output-after212:                  ; preds = %reduction_write_output-true211, %reduction_write_output-after190
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %112 = mul nuw nsw i32 %29, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %28, 64
  %115 = add nuw nsw i32 %113, %114
  %116 = mul nuw nsw i32 %tile_origin.0, 8192
  %117 = add nuw nsw i32 %115, %116
  %118 = udiv i32 %117, 1
  %119 = urem i32 %118, 64
  %120 = udiv i32 %117, 64
  %121 = urem i32 %120, 128
  %122 = udiv i32 %117, 8192
  %123 = mul i32 %thread_id.x, 2
  %124 = sub i32 %x_loc, %123
  %125 = mul nuw nsw i32 %119, 1
  %126 = add nuw nsw i32 0, %125
  %127 = udiv i32 %126, 64
  %128 = mul nuw nsw i32 %121, 1
  %129 = add nuw nsw i32 0, %128
  %130 = mul nuw nsw i32 %122, 128
  %131 = add nuw nsw i32 %129, %130
  %132 = udiv i32 %131, 8192
  %Arg_3.4 = getelementptr inbounds [8192 x [64 x float]], ptr %arg3, i32 0, i32 %131, i32 %126
  %Arg_3.46 = load float, ptr %Arg_3.4, align 4, !invariant.load !81
  %region_0_34_constant_5 = load float, ptr @0, align 4
  %compare.7 = fcmp ogt float %Arg_3.46, %region_0_34_constant_5
  %133 = zext i1 %compare.7 to i8
  %Arg_2.3 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %131, i32 0
  %Arg_2.37 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  %Arg_1.2 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %131, i32 0
  %Arg_1.28 = load float, ptr %Arg_1.2, align 4, !invariant.load !81
  %multiply.8 = fmul float %Arg_2.37, %Arg_1.28
  %region_0_34_constant_9 = load float, ptr @1, align 4
  %Arg_1.29 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %131, i32 0
  %Arg_1.210 = load float, ptr %Arg_1.29, align 4, !invariant.load !81
  %subtract.11 = fsub float %region_0_34_constant_9, %Arg_1.210
  %multiply.12 = fmul float %multiply.8, %subtract.11
  %Arg_0.1 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %131, i32 %126
  %Arg_0.111 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  %multiply.15 = fmul float %multiply.12, %Arg_0.111
  %134 = trunc i8 %133 to i1
  %135 = select i1 %134, float %multiply.15, float %region_0_34_constant_5
  store float %135, ptr %reduction_input_address, align 4
  %136 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %124
  call void @region_1_19(ptr %136, ptr %reduction_input_address, ptr %return_buffer)
  %137 = load float, ptr %return_buffer, align 4
  store float %137, ptr %136, align 4
  %138 = mul nuw nsw i32 %119, 1
  %139 = add nuw nsw i32 0, %138
  %140 = udiv i32 %139, 64
  %141 = mul nuw nsw i32 %121, 1
  %142 = add nuw nsw i32 0, %141
  %143 = mul nuw nsw i32 %122, 128
  %144 = add nuw nsw i32 %142, %143
  %145 = udiv i32 %144, 8192
  %Arg_0.112 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %144, i32 %139
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !81
  %region_0_34_constant_514 = load float, ptr @0, align 4
  %compare.24 = fcmp ogt float %Arg_0.113, %region_0_34_constant_514
  %146 = zext i1 %compare.24 to i8
  %Arg_2.315 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %144, i32 0
  %Arg_2.316 = load float, ptr %Arg_2.315, align 4, !invariant.load !81
  %Arg_1.217 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %144, i32 0
  %Arg_1.218 = load float, ptr %Arg_1.217, align 4, !invariant.load !81
  %multiply.819 = fmul float %Arg_2.316, %Arg_1.218
  %region_0_34_constant_920 = load float, ptr @1, align 4
  %Arg_1.221 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %144, i32 0
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !81
  %subtract.1123 = fsub float %region_0_34_constant_920, %Arg_1.222
  %multiply.1224 = fmul float %multiply.819, %subtract.1123
  %Arg_3.425 = getelementptr inbounds [8192 x [64 x float]], ptr %arg3, i32 0, i32 %144, i32 %139
  %Arg_3.426 = load float, ptr %Arg_3.425, align 4, !invariant.load !81
  %multiply.25 = fmul float %multiply.1224, %Arg_3.426
  %147 = trunc i8 %146 to i1
  %148 = select i1 %147, float %multiply.25, float %region_0_34_constant_514
  store float %148, ptr %reduction_input_address1, align 4
  %149 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %124
  call void @region_2_28(ptr %149, ptr %reduction_input_address1, ptr %return_buffer27)
  %150 = load float, ptr %return_buffer27, align 4
  store float %150, ptr %149, align 4
  %151 = mul nuw nsw i32 %119, 1
  %152 = add nuw nsw i32 0, %151
  %153 = udiv i32 %152, 64
  %154 = mul nuw nsw i32 %121, 1
  %155 = add nuw nsw i32 0, %154
  %156 = mul nuw nsw i32 %122, 128
  %157 = add nuw nsw i32 %155, %156
  %158 = udiv i32 %157, 8192
  %Arg_3.428 = getelementptr inbounds float, ptr %arg3, i32 %117
  %Arg_3.429 = load float, ptr %Arg_3.428, align 4, !invariant.load !81
  %region_0_34_constant_530 = load float, ptr @0, align 4
  %compare.731 = fcmp ogt float %Arg_3.429, %region_0_34_constant_530
  %159 = zext i1 %compare.731 to i8
  %Arg_2.332 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %157, i32 0
  %Arg_2.333 = load float, ptr %Arg_2.332, align 4, !invariant.load !81
  %Arg_1.234 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %157, i32 0
  %Arg_1.235 = load float, ptr %Arg_1.234, align 4, !invariant.load !81
  %multiply.836 = fmul float %Arg_2.333, %Arg_1.235
  %region_0_34_constant_937 = load float, ptr @1, align 4
  %Arg_1.238 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %157, i32 0
  %Arg_1.239 = load float, ptr %Arg_1.238, align 4, !invariant.load !81
  %subtract.1140 = fsub float %region_0_34_constant_937, %Arg_1.239
  %multiply.1241 = fmul float %multiply.836, %subtract.1140
  %Arg_0.142 = getelementptr inbounds float, ptr %arg0, i32 %117
  %Arg_0.143 = load float, ptr %Arg_0.142, align 4, !invariant.load !81
  %multiply.1544 = fmul float %multiply.1241, %Arg_0.143
  %160 = trunc i8 %159 to i1
  %161 = select i1 %160, float %multiply.1544, float %region_0_34_constant_530
  %162 = mul nuw nsw i32 %119, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 64
  %165 = mul nuw nsw i32 %121, 1
  %166 = add nuw nsw i32 0, %165
  %167 = mul nuw nsw i32 %122, 128
  %168 = add nuw nsw i32 %166, %167
  %169 = udiv i32 %168, 8192
  %Arg_0.145 = getelementptr inbounds float, ptr %arg0, i32 %117
  %Arg_0.146 = load float, ptr %Arg_0.145, align 4, !invariant.load !81
  %region_0_34_constant_547 = load float, ptr @0, align 4
  %compare.2448 = fcmp ogt float %Arg_0.146, %region_0_34_constant_547
  %170 = zext i1 %compare.2448 to i8
  %Arg_2.349 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %168, i32 0
  %Arg_2.350 = load float, ptr %Arg_2.349, align 4, !invariant.load !81
  %Arg_1.251 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %168, i32 0
  %Arg_1.252 = load float, ptr %Arg_1.251, align 4, !invariant.load !81
  %multiply.853 = fmul float %Arg_2.350, %Arg_1.252
  %region_0_34_constant_954 = load float, ptr @1, align 4
  %Arg_1.255 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %168, i32 0
  %Arg_1.256 = load float, ptr %Arg_1.255, align 4, !invariant.load !81
  %subtract.1157 = fsub float %region_0_34_constant_954, %Arg_1.256
  %multiply.1258 = fmul float %multiply.853, %subtract.1157
  %Arg_3.459 = getelementptr inbounds float, ptr %arg3, i32 %117
  %Arg_3.460 = load float, ptr %Arg_3.459, align 4, !invariant.load !81
  %multiply.2561 = fmul float %multiply.1258, %Arg_3.460
  %171 = trunc i8 %170 to i1
  %172 = select i1 %171, float %multiply.2561, float %region_0_34_constant_547
  %173 = mul nuw nsw i32 %119, 1
  %174 = add nuw nsw i32 0, %173
  %175 = udiv i32 %174, 64
  %176 = mul nuw nsw i32 %121, 1
  %177 = add nuw nsw i32 0, %176
  %178 = mul nuw nsw i32 %122, 128
  %179 = add nuw nsw i32 %177, %178
  %180 = udiv i32 %179, 8192
  %181 = getelementptr inbounds [8192 x [64 x float]], ptr %arg5, i32 0, i32 %179, i32 %174
  store float %161, ptr %181, align 4
  %182 = mul nuw nsw i32 %119, 1
  %183 = add nuw nsw i32 0, %182
  %184 = udiv i32 %183, 64
  %185 = mul nuw nsw i32 %121, 1
  %186 = add nuw nsw i32 0, %185
  %187 = mul nuw nsw i32 %122, 128
  %188 = add nuw nsw i32 %186, %187
  %189 = udiv i32 %188, 8192
  %190 = getelementptr inbounds [8192 x [64 x float]], ptr %arg7, i32 0, i32 %188, i32 %183
  store float %172, ptr %190, align 4
  br label %x_in_tile-after

x_in_tile-true63:                                 ; preds = %x_in_tile-after
  %191 = mul nuw nsw i32 %34, 1
  %192 = add nuw nsw i32 0, %191
  %193 = mul nuw nsw i32 %33, 64
  %194 = add nuw nsw i32 %192, %193
  %195 = mul nuw nsw i32 %tile_origin.0, 8192
  %196 = add nuw nsw i32 %194, %195
  %197 = udiv i32 %196, 1
  %198 = urem i32 %197, 64
  %199 = udiv i32 %196, 64
  %200 = urem i32 %199, 128
  %201 = udiv i32 %196, 8192
  %202 = mul i32 %thread_id.x, 2
  %203 = sub i32 %x_loc62, %202
  %204 = mul nuw nsw i32 %198, 1
  %205 = add nuw nsw i32 0, %204
  %206 = udiv i32 %205, 64
  %207 = mul nuw nsw i32 %200, 1
  %208 = add nuw nsw i32 0, %207
  %209 = mul nuw nsw i32 %201, 128
  %210 = add nuw nsw i32 %208, %209
  %211 = udiv i32 %210, 8192
  %Arg_3.465 = getelementptr inbounds [8192 x [64 x float]], ptr %arg3, i32 0, i32 %210, i32 %205
  %Arg_3.466 = load float, ptr %Arg_3.465, align 4, !invariant.load !81
  %region_0_34_constant_567 = load float, ptr @0, align 4
  %compare.768 = fcmp ogt float %Arg_3.466, %region_0_34_constant_567
  %212 = zext i1 %compare.768 to i8
  %Arg_2.369 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %210, i32 0
  %Arg_2.370 = load float, ptr %Arg_2.369, align 4, !invariant.load !81
  %Arg_1.271 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %210, i32 0
  %Arg_1.272 = load float, ptr %Arg_1.271, align 4, !invariant.load !81
  %multiply.873 = fmul float %Arg_2.370, %Arg_1.272
  %region_0_34_constant_974 = load float, ptr @1, align 4
  %Arg_1.275 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %210, i32 0
  %Arg_1.276 = load float, ptr %Arg_1.275, align 4, !invariant.load !81
  %subtract.1177 = fsub float %region_0_34_constant_974, %Arg_1.276
  %multiply.1278 = fmul float %multiply.873, %subtract.1177
  %Arg_0.179 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %210, i32 %205
  %Arg_0.180 = load float, ptr %Arg_0.179, align 4, !invariant.load !81
  %multiply.1581 = fmul float %multiply.1278, %Arg_0.180
  %213 = trunc i8 %212 to i1
  %214 = select i1 %213, float %multiply.1581, float %region_0_34_constant_567
  store float %214, ptr %reduction_input_address, align 4
  %215 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %203
  call void @region_1_19(ptr %215, ptr %reduction_input_address, ptr %return_buffer82)
  %216 = load float, ptr %return_buffer82, align 4
  store float %216, ptr %215, align 4
  %217 = mul nuw nsw i32 %198, 1
  %218 = add nuw nsw i32 0, %217
  %219 = udiv i32 %218, 64
  %220 = mul nuw nsw i32 %200, 1
  %221 = add nuw nsw i32 0, %220
  %222 = mul nuw nsw i32 %201, 128
  %223 = add nuw nsw i32 %221, %222
  %224 = udiv i32 %223, 8192
  %Arg_0.183 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %223, i32 %218
  %Arg_0.184 = load float, ptr %Arg_0.183, align 4, !invariant.load !81
  %region_0_34_constant_585 = load float, ptr @0, align 4
  %compare.2486 = fcmp ogt float %Arg_0.184, %region_0_34_constant_585
  %225 = zext i1 %compare.2486 to i8
  %Arg_2.387 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %223, i32 0
  %Arg_2.388 = load float, ptr %Arg_2.387, align 4, !invariant.load !81
  %Arg_1.289 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %223, i32 0
  %Arg_1.290 = load float, ptr %Arg_1.289, align 4, !invariant.load !81
  %multiply.891 = fmul float %Arg_2.388, %Arg_1.290
  %region_0_34_constant_992 = load float, ptr @1, align 4
  %Arg_1.293 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %223, i32 0
  %Arg_1.294 = load float, ptr %Arg_1.293, align 4, !invariant.load !81
  %subtract.1195 = fsub float %region_0_34_constant_992, %Arg_1.294
  %multiply.1296 = fmul float %multiply.891, %subtract.1195
  %Arg_3.497 = getelementptr inbounds [8192 x [64 x float]], ptr %arg3, i32 0, i32 %223, i32 %218
  %Arg_3.498 = load float, ptr %Arg_3.497, align 4, !invariant.load !81
  %multiply.2599 = fmul float %multiply.1296, %Arg_3.498
  %226 = trunc i8 %225 to i1
  %227 = select i1 %226, float %multiply.2599, float %region_0_34_constant_585
  store float %227, ptr %reduction_input_address1, align 4
  %228 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %203
  call void @region_2_28(ptr %228, ptr %reduction_input_address1, ptr %return_buffer100)
  %229 = load float, ptr %return_buffer100, align 4
  store float %229, ptr %228, align 4
  %230 = mul nuw nsw i32 %198, 1
  %231 = add nuw nsw i32 0, %230
  %232 = udiv i32 %231, 64
  %233 = mul nuw nsw i32 %200, 1
  %234 = add nuw nsw i32 0, %233
  %235 = mul nuw nsw i32 %201, 128
  %236 = add nuw nsw i32 %234, %235
  %237 = udiv i32 %236, 8192
  %Arg_3.4101 = getelementptr inbounds float, ptr %arg3, i32 %196
  %Arg_3.4102 = load float, ptr %Arg_3.4101, align 4, !invariant.load !81
  %region_0_34_constant_5103 = load float, ptr @0, align 4
  %compare.7104 = fcmp ogt float %Arg_3.4102, %region_0_34_constant_5103
  %238 = zext i1 %compare.7104 to i8
  %Arg_2.3105 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %236, i32 0
  %Arg_2.3106 = load float, ptr %Arg_2.3105, align 4, !invariant.load !81
  %Arg_1.2107 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %236, i32 0
  %Arg_1.2108 = load float, ptr %Arg_1.2107, align 4, !invariant.load !81
  %multiply.8109 = fmul float %Arg_2.3106, %Arg_1.2108
  %region_0_34_constant_9110 = load float, ptr @1, align 4
  %Arg_1.2111 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %236, i32 0
  %Arg_1.2112 = load float, ptr %Arg_1.2111, align 4, !invariant.load !81
  %subtract.11113 = fsub float %region_0_34_constant_9110, %Arg_1.2112
  %multiply.12114 = fmul float %multiply.8109, %subtract.11113
  %Arg_0.1115 = getelementptr inbounds float, ptr %arg0, i32 %196
  %Arg_0.1116 = load float, ptr %Arg_0.1115, align 4, !invariant.load !81
  %multiply.15117 = fmul float %multiply.12114, %Arg_0.1116
  %239 = trunc i8 %238 to i1
  %240 = select i1 %239, float %multiply.15117, float %region_0_34_constant_5103
  %241 = mul nuw nsw i32 %198, 1
  %242 = add nuw nsw i32 0, %241
  %243 = udiv i32 %242, 64
  %244 = mul nuw nsw i32 %200, 1
  %245 = add nuw nsw i32 0, %244
  %246 = mul nuw nsw i32 %201, 128
  %247 = add nuw nsw i32 %245, %246
  %248 = udiv i32 %247, 8192
  %Arg_0.1118 = getelementptr inbounds float, ptr %arg0, i32 %196
  %Arg_0.1119 = load float, ptr %Arg_0.1118, align 4, !invariant.load !81
  %region_0_34_constant_5120 = load float, ptr @0, align 4
  %compare.24121 = fcmp ogt float %Arg_0.1119, %region_0_34_constant_5120
  %249 = zext i1 %compare.24121 to i8
  %Arg_2.3122 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %247, i32 0
  %Arg_2.3123 = load float, ptr %Arg_2.3122, align 4, !invariant.load !81
  %Arg_1.2124 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %247, i32 0
  %Arg_1.2125 = load float, ptr %Arg_1.2124, align 4, !invariant.load !81
  %multiply.8126 = fmul float %Arg_2.3123, %Arg_1.2125
  %region_0_34_constant_9127 = load float, ptr @1, align 4
  %Arg_1.2128 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %247, i32 0
  %Arg_1.2129 = load float, ptr %Arg_1.2128, align 4, !invariant.load !81
  %subtract.11130 = fsub float %region_0_34_constant_9127, %Arg_1.2129
  %multiply.12131 = fmul float %multiply.8126, %subtract.11130
  %Arg_3.4132 = getelementptr inbounds float, ptr %arg3, i32 %196
  %Arg_3.4133 = load float, ptr %Arg_3.4132, align 4, !invariant.load !81
  %multiply.25134 = fmul float %multiply.12131, %Arg_3.4133
  %250 = trunc i8 %249 to i1
  %251 = select i1 %250, float %multiply.25134, float %region_0_34_constant_5120
  %252 = mul nuw nsw i32 %198, 1
  %253 = add nuw nsw i32 0, %252
  %254 = udiv i32 %253, 64
  %255 = mul nuw nsw i32 %200, 1
  %256 = add nuw nsw i32 0, %255
  %257 = mul nuw nsw i32 %201, 128
  %258 = add nuw nsw i32 %256, %257
  %259 = udiv i32 %258, 8192
  %260 = getelementptr inbounds [8192 x [64 x float]], ptr %arg5, i32 0, i32 %258, i32 %253
  store float %240, ptr %260, align 4
  %261 = mul nuw nsw i32 %198, 1
  %262 = add nuw nsw i32 0, %261
  %263 = udiv i32 %262, 64
  %264 = mul nuw nsw i32 %200, 1
  %265 = add nuw nsw i32 0, %264
  %266 = mul nuw nsw i32 %201, 128
  %267 = add nuw nsw i32 %265, %266
  %268 = udiv i32 %267, 8192
  %269 = getelementptr inbounds [8192 x [64 x float]], ptr %arg7, i32 0, i32 %267, i32 %262
  store float %251, ptr %269, align 4
  br label %x_in_tile-after64

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %270 = mul i32 %thread_id.y, 2
  %271 = add i32 %tile_origin.1, %thread_id.x
  %272 = add i32 %tile_origin.2, %270
  %273 = add i32 %272, 0
  %274 = mul i32 %tile_origin.0, 64
  %275 = add i32 %274, %273
  %276 = udiv i32 %275, 1
  %277 = urem i32 %276, 64
  %278 = udiv i32 %275, 64
  %output_element_address = getelementptr inbounds [64 x [64 x float]], ptr %arg4, i32 0, i32 %278, i32 %277
  %output = load float, ptr %38, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true167:                   ; preds = %reduction_write_output-after
  %279 = mul i32 %thread_id.y, 2
  %280 = add i32 %tile_origin.1, %thread_id.x
  %281 = add i32 %tile_origin.2, %279
  %282 = add i32 %281, 1
  %283 = mul i32 %tile_origin.0, 64
  %284 = add i32 %283, %282
  %285 = udiv i32 %284, 1
  %286 = urem i32 %285, 64
  %287 = udiv i32 %284, 64
  %output_element_address169 = getelementptr inbounds [64 x [64 x float]], ptr %arg4, i32 0, i32 %287, i32 %286
  %output170 = load float, ptr %57, align 4
  store float %output170, ptr %output_element_address169, align 4
  br label %reduction_write_output-after168

reduction_write_output-true189:                   ; preds = %reduction_write_output-after168
  %288 = mul i32 %thread_id.y, 2
  %289 = add i32 %tile_origin.1, %thread_id.x
  %290 = add i32 %tile_origin.2, %288
  %291 = add i32 %290, 0
  %292 = mul i32 %tile_origin.0, 64
  %293 = add i32 %292, %291
  %294 = udiv i32 %293, 1
  %295 = urem i32 %294, 64
  %296 = udiv i32 %293, 64
  %output_element_address191 = getelementptr inbounds [64 x [64 x float]], ptr %arg6, i32 0, i32 %296, i32 %295
  %output192 = load float, ptr %76, align 4
  store float %output192, ptr %output_element_address191, align 4
  br label %reduction_write_output-after190

reduction_write_output-true211:                   ; preds = %reduction_write_output-after190
  %297 = mul i32 %thread_id.y, 2
  %298 = add i32 %tile_origin.1, %thread_id.x
  %299 = add i32 %tile_origin.2, %297
  %300 = add i32 %299, 1
  %301 = mul i32 %tile_origin.0, 64
  %302 = add i32 %301, %300
  %303 = udiv i32 %302, 1
  %304 = urem i32 %303, 64
  %305 = udiv i32 %302, 64
  %output_element_address213 = getelementptr inbounds [64 x [64 x float]], ptr %arg6, i32 0, i32 %305, i32 %304
  %output214 = load float, ptr %95, align 4
  store float %output214, ptr %output_element_address213, align 4
  br label %reduction_write_output-after212
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_1_19(ptr dereferenceable(4) %Arg_0.20.typed, ptr dereferenceable(4) %Arg_1.21.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.22.typed = alloca float, align 4
  %Arg_0.20 = load float, ptr %Arg_0.20.typed, align 4
  %Arg_1.21 = load float, ptr %Arg_1.21.typed, align 4
  %add.22 = fadd float %Arg_0.20, %Arg_1.21
  store float %add.22, ptr %add.22.typed, align 4
  %load_ret_value = load float, ptr %add.22.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_28(ptr dereferenceable(4) %Arg_0.29.typed, ptr dereferenceable(4) %Arg_1.30.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.31.typed = alloca float, align 4
  %Arg_0.29 = load float, ptr %Arg_0.29.typed, align 4
  %Arg_1.30 = load float, ptr %Arg_1.30.typed, align 4
  %add.31 = fadd float %Arg_0.29, %Arg_1.30
  store float %add.31, ptr %add.31.typed, align 4
  %load_ret_value = load float, ptr %add.31.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

define void @fusion_79(ptr noalias align 128 dereferenceable(16384) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(16384) %arg2, ptr noalias align 128 dereferenceable(256) %arg3, ptr noalias align 128 dereferenceable(256) %arg4) {
entry:
  %return_buffer120 = alloca float, align 4
  %result_from_other_lane118 = alloca float, align 4
  %return_buffer117 = alloca float, align 4
  %result_from_other_lane115 = alloca float, align 4
  %return_buffer114 = alloca float, align 4
  %result_from_other_lane112 = alloca float, align 4
  %return_buffer111 = alloca float, align 4
  %result_from_other_lane109 = alloca float, align 4
  %return_buffer108 = alloca float, align 4
  %result_from_other_lane106 = alloca float, align 4
  %return_buffer98 = alloca float, align 4
  %result_from_other_lane96 = alloca float, align 4
  %return_buffer95 = alloca float, align 4
  %result_from_other_lane93 = alloca float, align 4
  %return_buffer92 = alloca float, align 4
  %result_from_other_lane90 = alloca float, align 4
  %return_buffer89 = alloca float, align 4
  %result_from_other_lane87 = alloca float, align 4
  %return_buffer86 = alloca float, align 4
  %result_from_other_lane84 = alloca float, align 4
  %return_buffer80 = alloca float, align 4
  %return_buffer74 = alloca float, align 4
  %tile_loop.invar_address67 = alloca i32, align 4
  %y_in_tile.invar_address61 = alloca i32, align 4
  %partial_reduction_result47 = alloca float, i32 2, align 4
  %reduction_input_address46 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer9 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !82
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after122, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !81
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %3, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %7 = urem i32 %5, 1024
  %8 = udiv i32 %5, 1024
  %9 = mul i32 %6, 1
  %10 = add i32 %9, %8
  %11 = icmp ult i32 %10, 1
  br i1 %11, label %12, label %early_return

12:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %7, 32
  %thread_id.y = udiv i32 %7, 32
  %lane_id = urem i32 %7, 32
  %13 = udiv i32 %10, 1
  %14 = urem i32 %13, 1
  %15 = udiv i32 %10, 1
  %16 = urem i32 %15, 1
  %17 = udiv i32 %10, 1
  %18 = icmp eq i32 %16, 0
  %tile_bound = select i1 %18, i32 64, i32 4096
  %19 = icmp eq i32 %14, 0
  %tile_bound1 = select i1 %19, i32 64, i32 64
  %tile_origin.0 = mul i32 %17, 1
  %tile_origin.1 = mul i32 %16, 4096
  %tile_origin.2 = mul i32 %14, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %12
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %20 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %20, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %21 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %22 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %23 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %23, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %24 = icmp eq i32 %tile_loop.indvar, 0
  %25 = mul i32 %tile_loop.indvar, 2
  %26 = add i32 %25, 0
  %x_loc = add i32 %26, %22
  %27 = add i32 %tile_origin.1, %y_in_tile.indvar
  %28 = add i32 %tile_origin.2, %x_loc
  %29 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %29, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %30 = mul i32 %tile_loop.indvar, 2
  %31 = add i32 %30, 1
  %x_loc4 = add i32 %31, %22
  %32 = add i32 %tile_origin.1, %y_in_tile.indvar
  %33 = add i32 %tile_origin.2, %x_loc4
  %34 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %34, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !83

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !84

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %35 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %36 = load float, ptr %current_output, align 4
  store float %36, ptr %35, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %37 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %37, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %38, ptr %result_from_other_lane, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane, ptr %return_buffer11)
  %39 = load float, ptr %return_buffer11, align 4
  store float %39, ptr %37, align 4
  %partial_reduction_result13 = load float, ptr %37, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %40, ptr %result_from_other_lane12, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane12, ptr %return_buffer14)
  %41 = load float, ptr %return_buffer14, align 4
  store float %41, ptr %37, align 4
  %partial_reduction_result16 = load float, ptr %37, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %42, ptr %result_from_other_lane15, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane15, ptr %return_buffer17)
  %43 = load float, ptr %return_buffer17, align 4
  store float %43, ptr %37, align 4
  %partial_reduction_result19 = load float, ptr %37, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %44, ptr %result_from_other_lane18, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane18, ptr %return_buffer20)
  %45 = load float, ptr %return_buffer20, align 4
  store float %45, ptr %37, align 4
  %partial_reduction_result22 = load float, ptr %37, align 4
  %46 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %46, ptr %result_from_other_lane21, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane21, ptr %return_buffer23)
  %47 = load float, ptr %return_buffer23, align 4
  store float %47, ptr %37, align 4
  %48 = icmp ult i32 %thread_id.x, %tile_bound
  %49 = mul i32 %thread_id.y, 2
  %50 = icmp ult i32 %49, %tile_bound1
  %51 = and i1 %50, %48
  %52 = icmp eq i32 %lane_id, 0
  %53 = and i1 %51, %52
  br i1 %53, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %8, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %54 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %55 = load float, ptr %current_output25, align 4
  store float %55, ptr %54, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %8, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %56 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %56, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %57, ptr %result_from_other_lane27, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane27, ptr %return_buffer29)
  %58 = load float, ptr %return_buffer29, align 4
  store float %58, ptr %56, align 4
  %partial_reduction_result31 = load float, ptr %56, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %59, ptr %result_from_other_lane30, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane30, ptr %return_buffer32)
  %60 = load float, ptr %return_buffer32, align 4
  store float %60, ptr %56, align 4
  %partial_reduction_result34 = load float, ptr %56, align 4
  %61 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %61, ptr %result_from_other_lane33, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane33, ptr %return_buffer35)
  %62 = load float, ptr %return_buffer35, align 4
  store float %62, ptr %56, align 4
  %partial_reduction_result37 = load float, ptr %56, align 4
  %63 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %63, ptr %result_from_other_lane36, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane36, ptr %return_buffer38)
  %64 = load float, ptr %return_buffer38, align 4
  store float %64, ptr %56, align 4
  %partial_reduction_result40 = load float, ptr %56, align 4
  %65 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %65, ptr %result_from_other_lane39, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane39, ptr %return_buffer41)
  %66 = load float, ptr %return_buffer41, align 4
  store float %66, ptr %56, align 4
  %67 = icmp ult i32 %thread_id.x, %tile_bound
  %68 = mul i32 %thread_id.y, 2
  %69 = icmp ult i32 %68, %tile_bound1
  %70 = and i1 %69, %67
  %71 = icmp eq i32 %lane_id, 0
  %72 = and i1 %70, %71
  br i1 %72, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %73 = mul i32 %thread_id.x, 2
  %74 = sub i32 %x_loc, %73
  %Arg_0.1 = getelementptr inbounds [64 x [64 x float]], ptr %arg0, i32 0, i32 %27, i32 %28
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %74
  call void @region_1_4(ptr %75, ptr %reduction_input_address, ptr %return_buffer)
  %76 = load float, ptr %return_buffer, align 4
  store float %76, ptr %75, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %77 = mul i32 %thread_id.x, 2
  %78 = sub i32 %x_loc4, %77
  %Arg_0.17 = getelementptr inbounds [64 x [64 x float]], ptr %arg0, i32 0, i32 %32, i32 %33
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !81
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %79 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %78
  call void @region_1_4(ptr %79, ptr %reduction_input_address, ptr %return_buffer9)
  %80 = load float, ptr %return_buffer9, align 4
  store float %80, ptr %79, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %81 = mul i32 %thread_id.y, 2
  %82 = add i32 %tile_origin.1, %thread_id.x
  %83 = add i32 %tile_origin.2, %81
  %84 = add i32 %83, 0
  %85 = mul i32 %tile_origin.0, 64
  %86 = add i32 %85, %84
  %87 = udiv i32 %86, 1
  %output_element_address = getelementptr inbounds [64 x float], ptr %arg3, i32 0, i32 %87
  %output = load float, ptr %37, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %88 = mul i32 %thread_id.y, 2
  %89 = add i32 %tile_origin.1, %thread_id.x
  %90 = add i32 %tile_origin.2, %88
  %91 = add i32 %90, 1
  %92 = mul i32 %tile_origin.0, 64
  %93 = add i32 %92, %91
  %94 = udiv i32 %93, 1
  %output_element_address44 = getelementptr inbounds [64 x float], ptr %arg3, i32 0, i32 %94
  %output45 = load float, ptr %56, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.248 = load float, ptr %arg1, align 4, !invariant.load !81
  %95 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  store float %Arg_1.248, ptr %95, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  store float %Arg_1.248, ptr %96, align 4
  %97 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %98 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %99 = urem i32 %97, 1024
  %100 = udiv i32 %97, 1024
  %101 = mul i32 %98, 1
  %102 = add i32 %101, %100
  %103 = icmp ult i32 %102, 1
  br i1 %103, label %104, label %early_return49

104:                                              ; preds = %reduce-group-1-true
  %thread_id.x50 = urem i32 %99, 32
  %thread_id.y51 = udiv i32 %99, 32
  %lane_id52 = urem i32 %99, 32
  %105 = udiv i32 %102, 1
  %106 = urem i32 %105, 1
  %107 = udiv i32 %102, 1
  %108 = urem i32 %107, 1
  %109 = udiv i32 %102, 1
  %110 = icmp eq i32 %108, 0
  %tile_bound53 = select i1 %110, i32 64, i32 4096
  %111 = icmp eq i32 %106, 0
  %tile_bound54 = select i1 %111, i32 64, i32 64
  %tile_origin.055 = mul i32 %109, 1
  %tile_origin.156 = mul i32 %108, 4096
  %tile_origin.257 = mul i32 %106, 64
  store i32 %thread_id.y51, ptr %y_in_tile.invar_address61, align 4
  br label %y_in_tile.loop_header59

y_in_tile.loop_header59:                          ; preds = %tile_loop.loop_exit64, %104
  %y_in_tile.indvar62 = load i32, ptr %y_in_tile.invar_address61, align 4
  %112 = icmp uge i32 %y_in_tile.indvar62, %tile_bound53
  br i1 %112, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_body60:                            ; preds = %y_in_tile.loop_header59
  %invar.inc63 = add nuw nsw i32 %y_in_tile.indvar62, 32
  store i32 %invar.inc63, ptr %y_in_tile.invar_address61, align 4
  %113 = icmp eq i32 %y_in_tile.indvar62, %thread_id.y51
  %114 = mul i32 %thread_id.x50, 2
  store i32 0, ptr %tile_loop.invar_address67, align 4
  br label %tile_loop.loop_header65

tile_loop.loop_header65:                          ; preds = %x_in_tile-after77, %y_in_tile.loop_body60
  %tile_loop.indvar68 = load i32, ptr %tile_loop.invar_address67, align 4
  %115 = icmp uge i32 %tile_loop.indvar68, 1
  br i1 %115, label %tile_loop.loop_exit64, label %tile_loop.loop_body66

tile_loop.loop_body66:                            ; preds = %tile_loop.loop_header65
  %invar.inc69 = add nuw nsw i32 %tile_loop.indvar68, 1
  store i32 %invar.inc69, ptr %tile_loop.invar_address67, align 4
  %116 = icmp eq i32 %tile_loop.indvar68, 0
  %117 = mul i32 %tile_loop.indvar68, 2
  %118 = add i32 %117, 0
  %x_loc70 = add i32 %118, %114
  %119 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %120 = add i32 %tile_origin.257, %x_loc70
  %121 = icmp ult i32 %x_loc70, %tile_bound54
  br i1 %121, label %x_in_tile-true71, label %x_in_tile-after72

x_in_tile-after72:                                ; preds = %x_in_tile-true71, %tile_loop.loop_body66
  %122 = mul i32 %tile_loop.indvar68, 2
  %123 = add i32 %122, 1
  %x_loc75 = add i32 %123, %114
  %124 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %125 = add i32 %tile_origin.257, %x_loc75
  %126 = icmp ult i32 %x_loc75, %tile_bound54
  br i1 %126, label %x_in_tile-true76, label %x_in_tile-after77

x_in_tile-after77:                                ; preds = %x_in_tile-true76, %x_in_tile-after72
  br label %tile_loop.loop_header65, !llvm.loop !85

tile_loop.loop_exit64:                            ; preds = %tile_loop.loop_header65
  br label %y_in_tile.loop_header59, !llvm.loop !86

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_header59
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %100, i32 0, i32 %thread_id.x50, i32 %thread_id.y51
  %127 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  %128 = load float, ptr %current_output82, align 4
  store float %128, ptr %127, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %100, i32 0, i32 %thread_id.y51, i32 %thread_id.x50
  %129 = addrspacecast ptr addrspace(3) %shmem_transposed_addr83 to ptr
  %partial_reduction_result85 = load float, ptr %129, align 4
  %130 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  store float %130, ptr %result_from_other_lane84, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane84, ptr %return_buffer86)
  %131 = load float, ptr %return_buffer86, align 4
  store float %131, ptr %129, align 4
  %partial_reduction_result88 = load float, ptr %129, align 4
  %132 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 8, i32 31)
  store float %132, ptr %result_from_other_lane87, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane87, ptr %return_buffer89)
  %133 = load float, ptr %return_buffer89, align 4
  store float %133, ptr %129, align 4
  %partial_reduction_result91 = load float, ptr %129, align 4
  %134 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result91, i32 4, i32 31)
  store float %134, ptr %result_from_other_lane90, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane90, ptr %return_buffer92)
  %135 = load float, ptr %return_buffer92, align 4
  store float %135, ptr %129, align 4
  %partial_reduction_result94 = load float, ptr %129, align 4
  %136 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result94, i32 2, i32 31)
  store float %136, ptr %result_from_other_lane93, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane93, ptr %return_buffer95)
  %137 = load float, ptr %return_buffer95, align 4
  store float %137, ptr %129, align 4
  %partial_reduction_result97 = load float, ptr %129, align 4
  %138 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result97, i32 1, i32 31)
  store float %138, ptr %result_from_other_lane96, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane96, ptr %return_buffer98)
  %139 = load float, ptr %return_buffer98, align 4
  store float %139, ptr %129, align 4
  %140 = icmp ult i32 %thread_id.x50, %tile_bound53
  %141 = mul i32 %thread_id.y51, 2
  %142 = icmp ult i32 %141, %tile_bound54
  %143 = and i1 %142, %140
  %144 = icmp eq i32 %lane_id52, 0
  %145 = and i1 %143, %144
  br i1 %145, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %y_in_tile.loop_exit58
  %shmem_output_address103 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %100, i32 1, i32 %thread_id.x50, i32 %thread_id.y51
  %146 = addrspacecast ptr addrspace(3) %shmem_output_address103 to ptr
  %current_output104 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  %147 = load float, ptr %current_output104, align 4
  store float %147, ptr %146, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %100, i32 1, i32 %thread_id.y51, i32 %thread_id.x50
  %148 = addrspacecast ptr addrspace(3) %shmem_transposed_addr105 to ptr
  %partial_reduction_result107 = load float, ptr %148, align 4
  %149 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  store float %149, ptr %result_from_other_lane106, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane106, ptr %return_buffer108)
  %150 = load float, ptr %return_buffer108, align 4
  store float %150, ptr %148, align 4
  %partial_reduction_result110 = load float, ptr %148, align 4
  %151 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result110, i32 8, i32 31)
  store float %151, ptr %result_from_other_lane109, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane109, ptr %return_buffer111)
  %152 = load float, ptr %return_buffer111, align 4
  store float %152, ptr %148, align 4
  %partial_reduction_result113 = load float, ptr %148, align 4
  %153 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result113, i32 4, i32 31)
  store float %153, ptr %result_from_other_lane112, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane112, ptr %return_buffer114)
  %154 = load float, ptr %return_buffer114, align 4
  store float %154, ptr %148, align 4
  %partial_reduction_result116 = load float, ptr %148, align 4
  %155 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result116, i32 2, i32 31)
  store float %155, ptr %result_from_other_lane115, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane115, ptr %return_buffer117)
  %156 = load float, ptr %return_buffer117, align 4
  store float %156, ptr %148, align 4
  %partial_reduction_result119 = load float, ptr %148, align 4
  %157 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result119, i32 1, i32 31)
  store float %157, ptr %result_from_other_lane118, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane118, ptr %return_buffer120)
  %158 = load float, ptr %return_buffer120, align 4
  store float %158, ptr %148, align 4
  %159 = icmp ult i32 %thread_id.x50, %tile_bound53
  %160 = mul i32 %thread_id.y51, 2
  %161 = icmp ult i32 %160, %tile_bound54
  %162 = and i1 %161, %159
  %163 = icmp eq i32 %lane_id52, 0
  %164 = and i1 %162, %163
  br i1 %164, label %reduction_write_output-true121, label %reduction_write_output-after122

reduction_write_output-after122:                  ; preds = %reduction_write_output-true121, %reduction_write_output-after100
  br label %reduce-group-1-after

early_return49:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true71:                                 ; preds = %tile_loop.loop_body66
  %165 = mul i32 %thread_id.x50, 2
  %166 = sub i32 %x_loc70, %165
  %Arg_2.3 = getelementptr inbounds [64 x [64 x float]], ptr %arg2, i32 0, i32 %119, i32 %120
  %Arg_2.373 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  store float %Arg_2.373, ptr %reduction_input_address46, align 4
  %167 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %166
  call void @region_2_9(ptr %167, ptr %reduction_input_address46, ptr %return_buffer74)
  %168 = load float, ptr %return_buffer74, align 4
  store float %168, ptr %167, align 4
  br label %x_in_tile-after72

x_in_tile-true76:                                 ; preds = %x_in_tile-after72
  %169 = mul i32 %thread_id.x50, 2
  %170 = sub i32 %x_loc75, %169
  %Arg_2.378 = getelementptr inbounds [64 x [64 x float]], ptr %arg2, i32 0, i32 %124, i32 %125
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !81
  store float %Arg_2.379, ptr %reduction_input_address46, align 4
  %171 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %170
  call void @region_2_9(ptr %171, ptr %reduction_input_address46, ptr %return_buffer80)
  %172 = load float, ptr %return_buffer80, align 4
  store float %172, ptr %171, align 4
  br label %x_in_tile-after77

reduction_write_output-true99:                    ; preds = %y_in_tile.loop_exit58
  %173 = mul i32 %thread_id.y51, 2
  %174 = add i32 %tile_origin.156, %thread_id.x50
  %175 = add i32 %tile_origin.257, %173
  %176 = add i32 %175, 0
  %177 = mul i32 %tile_origin.055, 64
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %output_element_address101 = getelementptr inbounds [64 x float], ptr %arg4, i32 0, i32 %179
  %output102 = load float, ptr %129, align 4
  store float %output102, ptr %output_element_address101, align 4
  br label %reduction_write_output-after100

reduction_write_output-true121:                   ; preds = %reduction_write_output-after100
  %180 = mul i32 %thread_id.y51, 2
  %181 = add i32 %tile_origin.156, %thread_id.x50
  %182 = add i32 %tile_origin.257, %180
  %183 = add i32 %182, 1
  %184 = mul i32 %tile_origin.055, 64
  %185 = add i32 %184, %183
  %186 = udiv i32 %185, 1
  %output_element_address123 = getelementptr inbounds [64 x float], ptr %arg4, i32 0, i32 %186
  %output124 = load float, ptr %148, align 4
  store float %output124, ptr %output_element_address123, align 4
  br label %reduction_write_output-after122
}

define internal void @region_1_4(ptr dereferenceable(4) %Arg_0.5.typed, ptr dereferenceable(4) %Arg_1.6.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.7.typed = alloca float, align 4
  %Arg_0.5 = load float, ptr %Arg_0.5.typed, align 4
  %Arg_1.6 = load float, ptr %Arg_1.6.typed, align 4
  %add.7 = fadd float %Arg_0.5, %Arg_1.6
  store float %add.7, ptr %add.7.typed, align 4
  %load_ret_value = load float, ptr %add.7.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_9(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_73(ptr noalias align 16 dereferenceable(256) %arg0, ptr noalias align 128 dereferenceable(256) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(256) %arg3, ptr noalias align 128 dereferenceable(256) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %2 = mul nuw nsw i32 %0, 64
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 64
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 64
  br i1 %4, label %fusion_73.in_bounds-true, label %fusion_73.in_bounds-after

fusion_73.in_bounds-after:                        ; preds = %fusion_73.in_bounds-true, %entry
  ret void

fusion_73.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !81
  %7 = load float, ptr %arg2, align 4, !invariant.load !81
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.7 = fmul float %7, %9
  %subtract.8 = fsub float %6, %multiply.7
  %10 = insertvalue { float, float } undef, float %subtract.8, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !81
  %13 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %14 = load float, ptr %13, align 4
  %multiply.9 = fmul float %7, %14
  %subtract.10 = fsub float %12, %multiply.9
  %15 = insertvalue { float, float } %10, float %subtract.10, 1
  %16 = extractvalue { float, float } %15, 0
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %16, ptr %17, align 4
  %18 = extractvalue { float, float } %15, 1
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %18, ptr %19, align 4
  br label %fusion_73.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #3

define void @fusion_69(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index, 64
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_69.in_bounds-true, label %fusion_69.in_bounds-after

fusion_69.in_bounds-after:                        ; preds = %fusion_69.in_bounds-true, %entry
  ret void

fusion_69.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !81
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.9 = fmul float %9, %16
  %subtract.10 = fsub float %14, %multiply.9
  %17 = insertvalue { float, float } %12, float %subtract.10, 1
  %18 = extractvalue { float, float } %17, 0
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %18, ptr %19, align 4
  %20 = extractvalue { float, float } %17, 1
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %20, ptr %21, align 4
  br label %fusion_69.in_bounds-after
}

define void @fusion_66(ptr noalias align 128 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(4194304) %arg3) {
entry:
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane50 = alloca float, align 4
  %return_buffer49 = alloca float, align 4
  %result_from_other_lane47 = alloca float, align 4
  %return_buffer46 = alloca float, align 4
  %result_from_other_lane44 = alloca float, align 4
  %return_buffer40 = alloca float, align 4
  %result_from_other_lane38 = alloca float, align 4
  %return_buffer37 = alloca float, align 4
  %result_from_other_lane35 = alloca float, align 4
  %return_buffer34 = alloca float, align 4
  %result_from_other_lane32 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !74
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after60, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_15_constant_8 = load float, ptr @4, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_15_constant_8, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_15_constant_8, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !88
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 128
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 2
  %14 = udiv i32 %9, 2
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 2
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 128, i32 4096
  %18 = icmp eq i32 %13, 1
  %tile_bound1 = select i1 %18, i32 64, i32 64
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 4096
  %tile_origin.2 = mul i32 %13, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after13, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %22 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %22, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %23 = icmp eq i32 %tile_loop.indvar, 0
  %24 = mul i32 %tile_loop.indvar, 2
  %25 = add i32 %24, 0
  %x_loc = add i32 %25, %21
  %26 = add i32 %tile_origin.1, %y_in_tile.indvar
  %27 = add i32 %tile_origin.2, %x_loc
  %28 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %28, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %29 = mul i32 %tile_loop.indvar, 2
  %30 = add i32 %29, 1
  %x_loc11 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc11
  %33 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %33, label %x_in_tile-true12, label %x_in_tile-after13

x_in_tile-after13:                                ; preds = %x_in_tile-true12, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !89

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !90

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result27 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane, ptr %return_buffer28)
  %38 = load float, ptr %return_buffer28, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result30 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane29, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane29, ptr %return_buffer31)
  %40 = load float, ptr %return_buffer31, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result33 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result33, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane32, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane32, ptr %return_buffer34)
  %42 = load float, ptr %return_buffer34, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result36 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result36, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane35, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane35, ptr %return_buffer37)
  %44 = load float, ptr %return_buffer37, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result39 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result39, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane38, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane38, ptr %return_buffer40)
  %46 = load float, ptr %return_buffer40, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address41 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address41 to ptr
  %current_output42 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output42, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr43 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr43 to ptr
  %partial_reduction_result45 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane44, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane44, ptr %return_buffer46)
  %57 = load float, ptr %return_buffer46, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result48 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result48, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane47, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane47, ptr %return_buffer49)
  %59 = load float, ptr %return_buffer49, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result51 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane50, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane50, ptr %return_buffer52)
  %61 = load float, ptr %return_buffer52, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result54 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane53, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane53, ptr %return_buffer55)
  %63 = load float, ptr %return_buffer55, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result57 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane56, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane56, ptr %return_buffer58)
  %65 = load float, ptr %return_buffer58, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true59, label %reduction_write_output-after60

reduction_write_output-after60:                   ; preds = %reduction_write_output-true59, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 128
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 16384
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 128
  %80 = udiv i32 %77, 128
  %81 = urem i32 %80, 128
  %82 = udiv i32 %77, 16384
  %83 = mul i32 %thread_id.x, 2
  %84 = sub i32 %x_loc, %83
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 128
  %88 = mul nuw nsw i32 %81, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 128
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 8192
  %Arg_1.2 = getelementptr inbounds [8192 x [128 x float]], ptr %arg1, i32 0, i32 %91, i32 %86
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !81
  %region_0_15_constant_3 = load float, ptr @3, align 4
  %compare.5 = fcmp ogt float %Arg_1.23, %region_0_15_constant_3
  %93 = zext i1 %compare.5 to i8
  %Arg_0.1 = getelementptr inbounds [8192 x [128 x float]], ptr %arg0, i32 0, i32 %91, i32 %86
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  %94 = trunc i8 %93 to i1
  %95 = select i1 %94, float %Arg_0.14, float %region_0_15_constant_3
  store float %95, ptr %reduction_input_address, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %84
  call void @region_1_9(ptr %96, ptr %reduction_input_address, ptr %return_buffer)
  %97 = load float, ptr %return_buffer, align 4
  store float %97, ptr %96, align 4
  %98 = mul nuw nsw i32 %79, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 128
  %101 = mul nuw nsw i32 %81, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %82, 128
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 8192
  %Arg_1.25 = getelementptr inbounds float, ptr %arg1, i32 %77
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !81
  %region_0_15_constant_37 = load float, ptr @3, align 4
  %compare.58 = fcmp ogt float %Arg_1.26, %region_0_15_constant_37
  %106 = zext i1 %compare.58 to i8
  %Arg_0.19 = getelementptr inbounds float, ptr %arg0, i32 %77
  %Arg_0.110 = load float, ptr %Arg_0.19, align 4, !invariant.load !81
  %107 = trunc i8 %106 to i1
  %108 = select i1 %107, float %Arg_0.110, float %region_0_15_constant_37
  %109 = mul nuw nsw i32 %79, 1
  %110 = add nuw nsw i32 0, %109
  %111 = udiv i32 %110, 128
  %112 = mul nuw nsw i32 %81, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %82, 128
  %115 = add nuw nsw i32 %113, %114
  %116 = udiv i32 %115, 8192
  %117 = getelementptr inbounds [8192 x [128 x float]], ptr %arg3, i32 0, i32 %115, i32 %110
  store float %108, ptr %117, align 4
  br label %x_in_tile-after

x_in_tile-true12:                                 ; preds = %x_in_tile-after
  %118 = mul nuw nsw i32 %32, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %31, 128
  %121 = add nuw nsw i32 %119, %120
  %122 = mul nuw nsw i32 %tile_origin.0, 16384
  %123 = add nuw nsw i32 %121, %122
  %124 = udiv i32 %123, 1
  %125 = urem i32 %124, 128
  %126 = udiv i32 %123, 128
  %127 = urem i32 %126, 128
  %128 = udiv i32 %123, 16384
  %129 = mul i32 %thread_id.x, 2
  %130 = sub i32 %x_loc11, %129
  %131 = mul nuw nsw i32 %125, 1
  %132 = add nuw nsw i32 0, %131
  %133 = udiv i32 %132, 128
  %134 = mul nuw nsw i32 %127, 1
  %135 = add nuw nsw i32 0, %134
  %136 = mul nuw nsw i32 %128, 128
  %137 = add nuw nsw i32 %135, %136
  %138 = udiv i32 %137, 8192
  %Arg_1.214 = getelementptr inbounds [8192 x [128 x float]], ptr %arg1, i32 0, i32 %137, i32 %132
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !81
  %region_0_15_constant_316 = load float, ptr @3, align 4
  %compare.517 = fcmp ogt float %Arg_1.215, %region_0_15_constant_316
  %139 = zext i1 %compare.517 to i8
  %Arg_0.118 = getelementptr inbounds [8192 x [128 x float]], ptr %arg0, i32 0, i32 %137, i32 %132
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !81
  %140 = trunc i8 %139 to i1
  %141 = select i1 %140, float %Arg_0.119, float %region_0_15_constant_316
  store float %141, ptr %reduction_input_address, align 4
  %142 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %130
  call void @region_1_9(ptr %142, ptr %reduction_input_address, ptr %return_buffer20)
  %143 = load float, ptr %return_buffer20, align 4
  store float %143, ptr %142, align 4
  %144 = mul nuw nsw i32 %125, 1
  %145 = add nuw nsw i32 0, %144
  %146 = udiv i32 %145, 128
  %147 = mul nuw nsw i32 %127, 1
  %148 = add nuw nsw i32 0, %147
  %149 = mul nuw nsw i32 %128, 128
  %150 = add nuw nsw i32 %148, %149
  %151 = udiv i32 %150, 8192
  %Arg_1.221 = getelementptr inbounds float, ptr %arg1, i32 %123
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !81
  %region_0_15_constant_323 = load float, ptr @3, align 4
  %compare.524 = fcmp ogt float %Arg_1.222, %region_0_15_constant_323
  %152 = zext i1 %compare.524 to i8
  %Arg_0.125 = getelementptr inbounds float, ptr %arg0, i32 %123
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !81
  %153 = trunc i8 %152 to i1
  %154 = select i1 %153, float %Arg_0.126, float %region_0_15_constant_323
  %155 = mul nuw nsw i32 %125, 1
  %156 = add nuw nsw i32 0, %155
  %157 = udiv i32 %156, 128
  %158 = mul nuw nsw i32 %127, 1
  %159 = add nuw nsw i32 0, %158
  %160 = mul nuw nsw i32 %128, 128
  %161 = add nuw nsw i32 %159, %160
  %162 = udiv i32 %161, 8192
  %163 = getelementptr inbounds [8192 x [128 x float]], ptr %arg3, i32 0, i32 %161, i32 %156
  store float %154, ptr %163, align 4
  br label %x_in_tile-after13

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %164 = mul i32 %thread_id.y, 2
  %165 = add i32 %tile_origin.1, %thread_id.x
  %166 = add i32 %tile_origin.2, %164
  %167 = add i32 %166, 0
  %168 = mul i32 %tile_origin.0, 128
  %169 = add i32 %168, %167
  %170 = udiv i32 %169, 1
  %171 = urem i32 %170, 128
  %172 = udiv i32 %169, 128
  %output_element_address = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %172, i32 %171
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true59:                    ; preds = %reduction_write_output-after
  %173 = mul i32 %thread_id.y, 2
  %174 = add i32 %tile_origin.1, %thread_id.x
  %175 = add i32 %tile_origin.2, %173
  %176 = add i32 %175, 1
  %177 = mul i32 %tile_origin.0, 128
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %180 = urem i32 %179, 128
  %181 = udiv i32 %178, 128
  %output_element_address61 = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %181, i32 %180
  %output62 = load float, ptr %55, align 4
  store float %output62, ptr %output_element_address61, align 4
  br label %reduction_write_output-after60
}

define internal void @region_1_9(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_81(ptr noalias align 128 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(512) %arg3, ptr noalias align 128 dereferenceable(512) %arg4) {
entry:
  %return_buffer120 = alloca float, align 4
  %result_from_other_lane118 = alloca float, align 4
  %return_buffer117 = alloca float, align 4
  %result_from_other_lane115 = alloca float, align 4
  %return_buffer114 = alloca float, align 4
  %result_from_other_lane112 = alloca float, align 4
  %return_buffer111 = alloca float, align 4
  %result_from_other_lane109 = alloca float, align 4
  %return_buffer108 = alloca float, align 4
  %result_from_other_lane106 = alloca float, align 4
  %return_buffer98 = alloca float, align 4
  %result_from_other_lane96 = alloca float, align 4
  %return_buffer95 = alloca float, align 4
  %result_from_other_lane93 = alloca float, align 4
  %return_buffer92 = alloca float, align 4
  %result_from_other_lane90 = alloca float, align 4
  %return_buffer89 = alloca float, align 4
  %result_from_other_lane87 = alloca float, align 4
  %return_buffer86 = alloca float, align 4
  %result_from_other_lane84 = alloca float, align 4
  %return_buffer80 = alloca float, align 4
  %return_buffer74 = alloca float, align 4
  %tile_loop.invar_address67 = alloca i32, align 4
  %y_in_tile.invar_address61 = alloca i32, align 4
  %partial_reduction_result47 = alloca float, i32 2, align 4
  %reduction_input_address46 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer9 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !82
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after122, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !81
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %3, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !82
  %7 = urem i32 %5, 1024
  %8 = udiv i32 %5, 1024
  %9 = mul i32 %6, 1
  %10 = add i32 %9, %8
  %11 = icmp ult i32 %10, 2
  br i1 %11, label %12, label %early_return

12:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %7, 32
  %thread_id.y = udiv i32 %7, 32
  %lane_id = urem i32 %7, 32
  %13 = udiv i32 %10, 1
  %14 = urem i32 %13, 2
  %15 = udiv i32 %10, 2
  %16 = urem i32 %15, 1
  %17 = udiv i32 %10, 2
  %18 = icmp eq i32 %16, 0
  %tile_bound = select i1 %18, i32 64, i32 4096
  %19 = icmp eq i32 %14, 1
  %tile_bound1 = select i1 %19, i32 64, i32 64
  %tile_origin.0 = mul i32 %17, 1
  %tile_origin.1 = mul i32 %16, 4096
  %tile_origin.2 = mul i32 %14, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %12
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %20 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %20, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %21 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %22 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %23 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %23, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %24 = icmp eq i32 %tile_loop.indvar, 0
  %25 = mul i32 %tile_loop.indvar, 2
  %26 = add i32 %25, 0
  %x_loc = add i32 %26, %22
  %27 = add i32 %tile_origin.1, %y_in_tile.indvar
  %28 = add i32 %tile_origin.2, %x_loc
  %29 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %29, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %30 = mul i32 %tile_loop.indvar, 2
  %31 = add i32 %30, 1
  %x_loc4 = add i32 %31, %22
  %32 = add i32 %tile_origin.1, %y_in_tile.indvar
  %33 = add i32 %tile_origin.2, %x_loc4
  %34 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %34, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !91

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !92

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %35 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %36 = load float, ptr %current_output, align 4
  store float %36, ptr %35, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %37 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %37, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %38, ptr %result_from_other_lane, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane, ptr %return_buffer11)
  %39 = load float, ptr %return_buffer11, align 4
  store float %39, ptr %37, align 4
  %partial_reduction_result13 = load float, ptr %37, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %40, ptr %result_from_other_lane12, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane12, ptr %return_buffer14)
  %41 = load float, ptr %return_buffer14, align 4
  store float %41, ptr %37, align 4
  %partial_reduction_result16 = load float, ptr %37, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %42, ptr %result_from_other_lane15, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane15, ptr %return_buffer17)
  %43 = load float, ptr %return_buffer17, align 4
  store float %43, ptr %37, align 4
  %partial_reduction_result19 = load float, ptr %37, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %44, ptr %result_from_other_lane18, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane18, ptr %return_buffer20)
  %45 = load float, ptr %return_buffer20, align 4
  store float %45, ptr %37, align 4
  %partial_reduction_result22 = load float, ptr %37, align 4
  %46 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %46, ptr %result_from_other_lane21, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane21, ptr %return_buffer23)
  %47 = load float, ptr %return_buffer23, align 4
  store float %47, ptr %37, align 4
  %48 = icmp ult i32 %thread_id.x, %tile_bound
  %49 = mul i32 %thread_id.y, 2
  %50 = icmp ult i32 %49, %tile_bound1
  %51 = and i1 %50, %48
  %52 = icmp eq i32 %lane_id, 0
  %53 = and i1 %51, %52
  br i1 %53, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %8, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %54 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %55 = load float, ptr %current_output25, align 4
  store float %55, ptr %54, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %8, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %56 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %56, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %57, ptr %result_from_other_lane27, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane27, ptr %return_buffer29)
  %58 = load float, ptr %return_buffer29, align 4
  store float %58, ptr %56, align 4
  %partial_reduction_result31 = load float, ptr %56, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %59, ptr %result_from_other_lane30, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane30, ptr %return_buffer32)
  %60 = load float, ptr %return_buffer32, align 4
  store float %60, ptr %56, align 4
  %partial_reduction_result34 = load float, ptr %56, align 4
  %61 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %61, ptr %result_from_other_lane33, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane33, ptr %return_buffer35)
  %62 = load float, ptr %return_buffer35, align 4
  store float %62, ptr %56, align 4
  %partial_reduction_result37 = load float, ptr %56, align 4
  %63 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %63, ptr %result_from_other_lane36, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane36, ptr %return_buffer38)
  %64 = load float, ptr %return_buffer38, align 4
  store float %64, ptr %56, align 4
  %partial_reduction_result40 = load float, ptr %56, align 4
  %65 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %65, ptr %result_from_other_lane39, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane39, ptr %return_buffer41)
  %66 = load float, ptr %return_buffer41, align 4
  store float %66, ptr %56, align 4
  %67 = icmp ult i32 %thread_id.x, %tile_bound
  %68 = mul i32 %thread_id.y, 2
  %69 = icmp ult i32 %68, %tile_bound1
  %70 = and i1 %69, %67
  %71 = icmp eq i32 %lane_id, 0
  %72 = and i1 %70, %71
  br i1 %72, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %73 = mul i32 %thread_id.x, 2
  %74 = sub i32 %x_loc, %73
  %Arg_0.1 = getelementptr inbounds [64 x [128 x float]], ptr %arg0, i32 0, i32 %27, i32 %28
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %74
  call void @region_1_4__1(ptr %75, ptr %reduction_input_address, ptr %return_buffer)
  %76 = load float, ptr %return_buffer, align 4
  store float %76, ptr %75, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %77 = mul i32 %thread_id.x, 2
  %78 = sub i32 %x_loc4, %77
  %Arg_0.17 = getelementptr inbounds [64 x [128 x float]], ptr %arg0, i32 0, i32 %32, i32 %33
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !81
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %79 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %78
  call void @region_1_4__1(ptr %79, ptr %reduction_input_address, ptr %return_buffer9)
  %80 = load float, ptr %return_buffer9, align 4
  store float %80, ptr %79, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %81 = mul i32 %thread_id.y, 2
  %82 = add i32 %tile_origin.1, %thread_id.x
  %83 = add i32 %tile_origin.2, %81
  %84 = add i32 %83, 0
  %85 = mul i32 %tile_origin.0, 128
  %86 = add i32 %85, %84
  %87 = udiv i32 %86, 1
  %output_element_address = getelementptr inbounds [128 x float], ptr %arg3, i32 0, i32 %87
  %output = load float, ptr %37, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %88 = mul i32 %thread_id.y, 2
  %89 = add i32 %tile_origin.1, %thread_id.x
  %90 = add i32 %tile_origin.2, %88
  %91 = add i32 %90, 1
  %92 = mul i32 %tile_origin.0, 128
  %93 = add i32 %92, %91
  %94 = udiv i32 %93, 1
  %output_element_address44 = getelementptr inbounds [128 x float], ptr %arg3, i32 0, i32 %94
  %output45 = load float, ptr %56, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.248 = load float, ptr %arg1, align 4, !invariant.load !81
  %95 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  store float %Arg_1.248, ptr %95, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  store float %Arg_1.248, ptr %96, align 4
  %97 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %98 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !82
  %99 = urem i32 %97, 1024
  %100 = udiv i32 %97, 1024
  %101 = mul i32 %98, 1
  %102 = add i32 %101, %100
  %103 = icmp ult i32 %102, 2
  br i1 %103, label %104, label %early_return49

104:                                              ; preds = %reduce-group-1-true
  %thread_id.x50 = urem i32 %99, 32
  %thread_id.y51 = udiv i32 %99, 32
  %lane_id52 = urem i32 %99, 32
  %105 = udiv i32 %102, 1
  %106 = urem i32 %105, 2
  %107 = udiv i32 %102, 2
  %108 = urem i32 %107, 1
  %109 = udiv i32 %102, 2
  %110 = icmp eq i32 %108, 0
  %tile_bound53 = select i1 %110, i32 64, i32 4096
  %111 = icmp eq i32 %106, 1
  %tile_bound54 = select i1 %111, i32 64, i32 64
  %tile_origin.055 = mul i32 %109, 1
  %tile_origin.156 = mul i32 %108, 4096
  %tile_origin.257 = mul i32 %106, 64
  store i32 %thread_id.y51, ptr %y_in_tile.invar_address61, align 4
  br label %y_in_tile.loop_header59

y_in_tile.loop_header59:                          ; preds = %tile_loop.loop_exit64, %104
  %y_in_tile.indvar62 = load i32, ptr %y_in_tile.invar_address61, align 4
  %112 = icmp uge i32 %y_in_tile.indvar62, %tile_bound53
  br i1 %112, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_body60:                            ; preds = %y_in_tile.loop_header59
  %invar.inc63 = add nuw nsw i32 %y_in_tile.indvar62, 32
  store i32 %invar.inc63, ptr %y_in_tile.invar_address61, align 4
  %113 = icmp eq i32 %y_in_tile.indvar62, %thread_id.y51
  %114 = mul i32 %thread_id.x50, 2
  store i32 0, ptr %tile_loop.invar_address67, align 4
  br label %tile_loop.loop_header65

tile_loop.loop_header65:                          ; preds = %x_in_tile-after77, %y_in_tile.loop_body60
  %tile_loop.indvar68 = load i32, ptr %tile_loop.invar_address67, align 4
  %115 = icmp uge i32 %tile_loop.indvar68, 1
  br i1 %115, label %tile_loop.loop_exit64, label %tile_loop.loop_body66

tile_loop.loop_body66:                            ; preds = %tile_loop.loop_header65
  %invar.inc69 = add nuw nsw i32 %tile_loop.indvar68, 1
  store i32 %invar.inc69, ptr %tile_loop.invar_address67, align 4
  %116 = icmp eq i32 %tile_loop.indvar68, 0
  %117 = mul i32 %tile_loop.indvar68, 2
  %118 = add i32 %117, 0
  %x_loc70 = add i32 %118, %114
  %119 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %120 = add i32 %tile_origin.257, %x_loc70
  %121 = icmp ult i32 %x_loc70, %tile_bound54
  br i1 %121, label %x_in_tile-true71, label %x_in_tile-after72

x_in_tile-after72:                                ; preds = %x_in_tile-true71, %tile_loop.loop_body66
  %122 = mul i32 %tile_loop.indvar68, 2
  %123 = add i32 %122, 1
  %x_loc75 = add i32 %123, %114
  %124 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %125 = add i32 %tile_origin.257, %x_loc75
  %126 = icmp ult i32 %x_loc75, %tile_bound54
  br i1 %126, label %x_in_tile-true76, label %x_in_tile-after77

x_in_tile-after77:                                ; preds = %x_in_tile-true76, %x_in_tile-after72
  br label %tile_loop.loop_header65, !llvm.loop !93

tile_loop.loop_exit64:                            ; preds = %tile_loop.loop_header65
  br label %y_in_tile.loop_header59, !llvm.loop !94

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_header59
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %100, i32 0, i32 %thread_id.x50, i32 %thread_id.y51
  %127 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  %128 = load float, ptr %current_output82, align 4
  store float %128, ptr %127, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %100, i32 0, i32 %thread_id.y51, i32 %thread_id.x50
  %129 = addrspacecast ptr addrspace(3) %shmem_transposed_addr83 to ptr
  %partial_reduction_result85 = load float, ptr %129, align 4
  %130 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  store float %130, ptr %result_from_other_lane84, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane84, ptr %return_buffer86)
  %131 = load float, ptr %return_buffer86, align 4
  store float %131, ptr %129, align 4
  %partial_reduction_result88 = load float, ptr %129, align 4
  %132 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 8, i32 31)
  store float %132, ptr %result_from_other_lane87, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane87, ptr %return_buffer89)
  %133 = load float, ptr %return_buffer89, align 4
  store float %133, ptr %129, align 4
  %partial_reduction_result91 = load float, ptr %129, align 4
  %134 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result91, i32 4, i32 31)
  store float %134, ptr %result_from_other_lane90, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane90, ptr %return_buffer92)
  %135 = load float, ptr %return_buffer92, align 4
  store float %135, ptr %129, align 4
  %partial_reduction_result94 = load float, ptr %129, align 4
  %136 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result94, i32 2, i32 31)
  store float %136, ptr %result_from_other_lane93, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane93, ptr %return_buffer95)
  %137 = load float, ptr %return_buffer95, align 4
  store float %137, ptr %129, align 4
  %partial_reduction_result97 = load float, ptr %129, align 4
  %138 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result97, i32 1, i32 31)
  store float %138, ptr %result_from_other_lane96, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane96, ptr %return_buffer98)
  %139 = load float, ptr %return_buffer98, align 4
  store float %139, ptr %129, align 4
  %140 = icmp ult i32 %thread_id.x50, %tile_bound53
  %141 = mul i32 %thread_id.y51, 2
  %142 = icmp ult i32 %141, %tile_bound54
  %143 = and i1 %142, %140
  %144 = icmp eq i32 %lane_id52, 0
  %145 = and i1 %143, %144
  br i1 %145, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %y_in_tile.loop_exit58
  %shmem_output_address103 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %100, i32 1, i32 %thread_id.x50, i32 %thread_id.y51
  %146 = addrspacecast ptr addrspace(3) %shmem_output_address103 to ptr
  %current_output104 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  %147 = load float, ptr %current_output104, align 4
  store float %147, ptr %146, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %100, i32 1, i32 %thread_id.y51, i32 %thread_id.x50
  %148 = addrspacecast ptr addrspace(3) %shmem_transposed_addr105 to ptr
  %partial_reduction_result107 = load float, ptr %148, align 4
  %149 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  store float %149, ptr %result_from_other_lane106, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane106, ptr %return_buffer108)
  %150 = load float, ptr %return_buffer108, align 4
  store float %150, ptr %148, align 4
  %partial_reduction_result110 = load float, ptr %148, align 4
  %151 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result110, i32 8, i32 31)
  store float %151, ptr %result_from_other_lane109, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane109, ptr %return_buffer111)
  %152 = load float, ptr %return_buffer111, align 4
  store float %152, ptr %148, align 4
  %partial_reduction_result113 = load float, ptr %148, align 4
  %153 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result113, i32 4, i32 31)
  store float %153, ptr %result_from_other_lane112, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane112, ptr %return_buffer114)
  %154 = load float, ptr %return_buffer114, align 4
  store float %154, ptr %148, align 4
  %partial_reduction_result116 = load float, ptr %148, align 4
  %155 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result116, i32 2, i32 31)
  store float %155, ptr %result_from_other_lane115, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane115, ptr %return_buffer117)
  %156 = load float, ptr %return_buffer117, align 4
  store float %156, ptr %148, align 4
  %partial_reduction_result119 = load float, ptr %148, align 4
  %157 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result119, i32 1, i32 31)
  store float %157, ptr %result_from_other_lane118, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane118, ptr %return_buffer120)
  %158 = load float, ptr %return_buffer120, align 4
  store float %158, ptr %148, align 4
  %159 = icmp ult i32 %thread_id.x50, %tile_bound53
  %160 = mul i32 %thread_id.y51, 2
  %161 = icmp ult i32 %160, %tile_bound54
  %162 = and i1 %161, %159
  %163 = icmp eq i32 %lane_id52, 0
  %164 = and i1 %162, %163
  br i1 %164, label %reduction_write_output-true121, label %reduction_write_output-after122

reduction_write_output-after122:                  ; preds = %reduction_write_output-true121, %reduction_write_output-after100
  br label %reduce-group-1-after

early_return49:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true71:                                 ; preds = %tile_loop.loop_body66
  %165 = mul i32 %thread_id.x50, 2
  %166 = sub i32 %x_loc70, %165
  %Arg_2.3 = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %119, i32 %120
  %Arg_2.373 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  store float %Arg_2.373, ptr %reduction_input_address46, align 4
  %167 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %166
  call void @region_2_9__1(ptr %167, ptr %reduction_input_address46, ptr %return_buffer74)
  %168 = load float, ptr %return_buffer74, align 4
  store float %168, ptr %167, align 4
  br label %x_in_tile-after72

x_in_tile-true76:                                 ; preds = %x_in_tile-after72
  %169 = mul i32 %thread_id.x50, 2
  %170 = sub i32 %x_loc75, %169
  %Arg_2.378 = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %124, i32 %125
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !81
  store float %Arg_2.379, ptr %reduction_input_address46, align 4
  %171 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %170
  call void @region_2_9__1(ptr %171, ptr %reduction_input_address46, ptr %return_buffer80)
  %172 = load float, ptr %return_buffer80, align 4
  store float %172, ptr %171, align 4
  br label %x_in_tile-after77

reduction_write_output-true99:                    ; preds = %y_in_tile.loop_exit58
  %173 = mul i32 %thread_id.y51, 2
  %174 = add i32 %tile_origin.156, %thread_id.x50
  %175 = add i32 %tile_origin.257, %173
  %176 = add i32 %175, 0
  %177 = mul i32 %tile_origin.055, 128
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %output_element_address101 = getelementptr inbounds [128 x float], ptr %arg4, i32 0, i32 %179
  %output102 = load float, ptr %129, align 4
  store float %output102, ptr %output_element_address101, align 4
  br label %reduction_write_output-after100

reduction_write_output-true121:                   ; preds = %reduction_write_output-after100
  %180 = mul i32 %thread_id.y51, 2
  %181 = add i32 %tile_origin.156, %thread_id.x50
  %182 = add i32 %tile_origin.257, %180
  %183 = add i32 %182, 1
  %184 = mul i32 %tile_origin.055, 128
  %185 = add i32 %184, %183
  %186 = udiv i32 %185, 1
  %output_element_address123 = getelementptr inbounds [128 x float], ptr %arg4, i32 0, i32 %186
  %output124 = load float, ptr %148, align 4
  store float %output124, ptr %output_element_address123, align 4
  br label %reduction_write_output-after122
}

define internal void @region_1_4__1(ptr dereferenceable(4) %Arg_0.5.typed, ptr dereferenceable(4) %Arg_1.6.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.7.typed = alloca float, align 4
  %Arg_0.5 = load float, ptr %Arg_0.5.typed, align 4
  %Arg_1.6 = load float, ptr %Arg_1.6.typed, align 4
  %add.7 = fadd float %Arg_0.5, %Arg_1.6
  store float %add.7, ptr %add.7.typed, align 4
  %load_ret_value = load float, ptr %add.7.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_9__1(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_65(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 128 dereferenceable(512) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(512) %arg3, ptr noalias align 128 dereferenceable(512) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !88
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 128
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 128
  br i1 %4, label %fusion_65.in_bounds-true, label %fusion_65.in_bounds-after

fusion_65.in_bounds-after:                        ; preds = %fusion_65.in_bounds-true, %entry
  ret void

fusion_65.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !81
  %7 = load float, ptr %arg2, align 4, !invariant.load !81
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.7 = fmul float %7, %9
  %subtract.8 = fsub float %6, %multiply.7
  %10 = insertvalue { float, float } undef, float %subtract.8, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !81
  %13 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %14 = load float, ptr %13, align 4
  %multiply.9 = fmul float %7, %14
  %subtract.10 = fsub float %12, %multiply.9
  %15 = insertvalue { float, float } %10, float %subtract.10, 1
  %16 = extractvalue { float, float } %15, 0
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %16, ptr %17, align 4
  %18 = extractvalue { float, float } %15, 1
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %18, ptr %19, align 4
  br label %fusion_65.in_bounds-after
}

define void @fusion_61(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !95
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %fusion_61.in_bounds-true, label %fusion_61.in_bounds-after

fusion_61.in_bounds-after:                        ; preds = %fusion_61.in_bounds-true, %entry
  ret void

fusion_61.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !81
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.9 = fmul float %9, %16
  %subtract.10 = fsub float %14, %multiply.9
  %17 = insertvalue { float, float } %12, float %subtract.10, 1
  %18 = extractvalue { float, float } %17, 0
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %18, ptr %19, align 4
  %20 = extractvalue { float, float } %17, 1
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %20, ptr %21, align 4
  br label %fusion_61.in_bounds-after
}

define void @fusion_58(ptr noalias align 16 dereferenceable(27262976) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 16 dereferenceable(27262976) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 16 dereferenceable(31719424) %arg4, ptr noalias align 128 dereferenceable(425984) %arg5, ptr noalias align 128 dereferenceable(425984) %arg6) {
entry:
  %initial_value_addr102 = alloca float, align 4
  %return_buffer97 = alloca float, align 4
  %result_from_other_lane95 = alloca float, align 4
  %return_buffer94 = alloca float, align 4
  %result_from_other_lane92 = alloca float, align 4
  %return_buffer91 = alloca float, align 4
  %result_from_other_lane89 = alloca float, align 4
  %return_buffer88 = alloca float, align 4
  %result_from_other_lane86 = alloca float, align 4
  %return_buffer85 = alloca float, align 4
  %result_from_other_lane83 = alloca float, align 4
  %return_buffer81 = alloca float, align 4
  %tile_loop.invar_address67 = alloca i32, align 4
  %return_buffer63 = alloca float, align 4
  %tile_loop.invar_address56 = alloca i32, align 4
  %y_in_tile.invar_address47 = alloca i32, align 4
  %partial_reduction_result33 = alloca float, align 4
  %reduction_input_address32 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane26 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %result_from_other_lane23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %result_from_other_lane20 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !82
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %inter_warp_reduce-after101, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_25_constant_9 = load float, ptr @5, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_25_constant_9, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !96
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !97
  %6 = urem i32 %4, 32
  %7 = udiv i32 %4, 32
  %8 = mul i32 %5, 3
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 106496
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %9, 1
  %15 = urem i32 %14, 106496
  %16 = udiv i32 %9, 106496
  %17 = icmp eq i32 %15, 106495
  %tile_bound = select i1 %17, i32 1, i32 1
  %18 = icmp eq i32 %13, 0
  %tile_bound1 = select i1 %18, i32 64, i32 512
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 1
  %tile_origin.2 = mul i32 %13, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = icmp eq i32 512, %tile_bound1
  br i1 %21, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !98

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %22 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %22, ptr %result_from_other_lane, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %23 = load float, ptr %return_buffer19, align 4
  store float %23, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %24 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %24, ptr %result_from_other_lane20, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %25 = load float, ptr %return_buffer22, align 4
  store float %25, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %26 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %26, ptr %result_from_other_lane23, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %27 = load float, ptr %return_buffer25, align 4
  store float %27, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %28 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %28, ptr %result_from_other_lane26, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %29 = load float, ptr %return_buffer28, align 4
  store float %29, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %30 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %30, ptr %result_from_other_lane29, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
  %31 = load float, ptr %return_buffer31, align 4
  store float %31, ptr %current_output, align 4
  %32 = udiv i32 %thread_id.x, 32
  %33 = icmp eq i32 %lane_id, 0
  br i1 %33, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %34 = icmp eq i32 %32, 0
  br i1 %34, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %35 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %36 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %36, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %37 = icmp eq i32 %tile_loop.indvar, 0
  %38 = mul i32 %tile_loop.indvar, 32
  %39 = add i32 %38, 0
  %x_loc = add i32 %39, %35
  %40 = add i32 %tile_origin.1, %y_in_tile.indvar
  %41 = add i32 %tile_origin.2, %x_loc
  %42 = mul nuw nsw i32 %41, 1
  %43 = add nuw nsw i32 0, %42
  %44 = mul nuw nsw i32 %40, 64
  %45 = add nuw nsw i32 %43, %44
  %46 = mul nuw nsw i32 %tile_origin.0, 6815744
  %47 = add nuw nsw i32 %45, %46
  %48 = udiv i32 %47, 1
  %49 = urem i32 %48, 64
  %50 = udiv i32 %47, 64
  %51 = urem i32 %50, 13
  %52 = udiv i32 %47, 832
  %53 = mul nuw nsw i32 %49, 1
  %54 = add nuw nsw i32 0, %53
  %55 = mul nuw nsw i32 %51, 64
  %56 = add nuw nsw i32 %54, %55
  %57 = udiv i32 %56, 832
  %58 = mul nuw nsw i32 %52, 1
  %59 = add nuw nsw i32 0, %58
  %60 = udiv i32 %59, 8192
  %61 = add i32 %59, 0
  %62 = add i32 %56, 0
  %Arg_1.2 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %61, i32 %62
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !81
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %47
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  %multiply.8 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.8, ptr %reduction_input_address, align 4
  %63 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10(ptr %63, ptr %reduction_input_address, ptr %return_buffer)
  %64 = load float, ptr %return_buffer, align 4
  store float %64, ptr %63, align 4
  br label %tile_loop.loop_header, !llvm.loop !99

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %65 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %66 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %66, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %67 = icmp eq i32 %tile_loop.indvar9, 0
  %68 = mul i32 %tile_loop.indvar9, 32
  %69 = add i32 %68, 0
  %x_loc11 = add i32 %69, %65
  %70 = add i32 %tile_origin.1, %y_in_tile.indvar
  %71 = add i32 %tile_origin.2, %x_loc11
  %72 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %72, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !100

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %73 = mul nuw nsw i32 %71, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %70, 64
  %76 = add nuw nsw i32 %74, %75
  %77 = mul nuw nsw i32 %tile_origin.0, 6815744
  %78 = add nuw nsw i32 %76, %77
  %79 = udiv i32 %78, 1
  %80 = urem i32 %79, 64
  %81 = udiv i32 %78, 64
  %82 = urem i32 %81, 13
  %83 = udiv i32 %78, 832
  %84 = mul nuw nsw i32 %80, 1
  %85 = add nuw nsw i32 0, %84
  %86 = mul nuw nsw i32 %82, 64
  %87 = add nuw nsw i32 %85, %86
  %88 = udiv i32 %87, 832
  %89 = mul nuw nsw i32 %83, 1
  %90 = add nuw nsw i32 0, %89
  %91 = udiv i32 %90, 8192
  %92 = add i32 %90, 0
  %93 = add i32 %87, 0
  %Arg_1.212 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %92, i32 %93
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !81
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %78
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !81
  %multiply.816 = fmul float %Arg_1.213, %Arg_0.115
  store float %multiply.816, ptr %reduction_input_address, align 4
  %94 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10(ptr %94, ptr %reduction_input_address, ptr %return_buffer17)
  %95 = load float, ptr %return_buffer17, align 4
  store float %95, ptr %94, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %96 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %7, i32 0, i32 %32
  %97 = addrspacecast ptr addrspace(3) %96 to ptr
  %98 = load float, ptr %current_output, align 4
  store float %98, ptr %97, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %99 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %7, i32 0, i32 %lane_id
  %100 = addrspacecast ptr addrspace(3) %99 to ptr
  store float %region_0_25_constant_9, ptr %initial_value_addr, align 4
  %101 = icmp ult i32 %thread_id.x, 1
  %102 = select i1 %101, ptr %100, ptr %initial_value_addr
  %103 = icmp eq i32 %thread_id.x, 0
  br i1 %103, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %104 = mul i32 %thread_id.x, 1
  %105 = add i32 %tile_origin.1, %thread_id.y
  %106 = add i32 %tile_origin.2, %104
  %107 = add i32 %106, 0
  %108 = udiv i32 %105, 1
  %109 = urem i32 %108, 13
  %110 = udiv i32 %105, 13
  %output_element_address = getelementptr inbounds [8192 x [13 x float]], ptr %arg5, i32 0, i32 %110, i32 %109
  %output = load float, ptr %102, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %region_0_25_constant_934 = load float, ptr @5, align 4
  %111 = getelementptr inbounds float, ptr %partial_reduction_result33, i32 0
  store float %region_0_25_constant_934, ptr %111, align 4
  %112 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !96
  %113 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !97
  %114 = urem i32 %112, 32
  %115 = udiv i32 %112, 32
  %116 = mul i32 %113, 3
  %117 = add i32 %116, %115
  %118 = icmp ult i32 %117, 106496
  br i1 %118, label %119, label %early_return35

119:                                              ; preds = %reduce-group-1-true
  %thread_id.x36 = urem i32 %114, 32
  %thread_id.y37 = udiv i32 %114, 32
  %lane_id38 = urem i32 %114, 32
  %120 = udiv i32 %117, 1
  %121 = urem i32 %120, 1
  %122 = udiv i32 %117, 1
  %123 = urem i32 %122, 106496
  %124 = udiv i32 %117, 106496
  %125 = icmp eq i32 %123, 106495
  %tile_bound39 = select i1 %125, i32 1, i32 1
  %126 = icmp eq i32 %121, 0
  %tile_bound40 = select i1 %126, i32 64, i32 512
  %tile_origin.041 = mul i32 %124, 1
  %tile_origin.142 = mul i32 %123, 1
  %tile_origin.243 = mul i32 %121, 512
  store i32 %thread_id.y37, ptr %y_in_tile.invar_address47, align 4
  br label %y_in_tile.loop_header45

y_in_tile.loop_header45:                          ; preds = %is_full_tile-after52, %119
  %y_in_tile.indvar48 = load i32, ptr %y_in_tile.invar_address47, align 4
  %127 = icmp uge i32 %y_in_tile.indvar48, %tile_bound39
  br i1 %127, label %y_in_tile.loop_exit44, label %y_in_tile.loop_body46

y_in_tile.loop_body46:                            ; preds = %y_in_tile.loop_header45
  %invar.inc49 = add nuw nsw i32 %y_in_tile.indvar48, 1
  store i32 %invar.inc49, ptr %y_in_tile.invar_address47, align 4
  %128 = icmp eq i32 %y_in_tile.indvar48, %thread_id.y37
  %129 = icmp eq i32 512, %tile_bound40
  br i1 %129, label %is_full_tile-true50, label %is_full_tile-false51

is_full_tile-after52:                             ; preds = %tile_loop.loop_exit64, %tile_loop.loop_exit53
  br label %y_in_tile.loop_header45, !llvm.loop !101

y_in_tile.loop_exit44:                            ; preds = %y_in_tile.loop_header45
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result33, i32 0
  %partial_reduction_result84 = load float, ptr %current_output82, align 4
  %130 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result84, i32 16, i32 31)
  store float %130, ptr %result_from_other_lane83, align 4
  call void @region_2_19(ptr %current_output82, ptr %result_from_other_lane83, ptr %return_buffer85)
  %131 = load float, ptr %return_buffer85, align 4
  store float %131, ptr %current_output82, align 4
  %partial_reduction_result87 = load float, ptr %current_output82, align 4
  %132 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result87, i32 8, i32 31)
  store float %132, ptr %result_from_other_lane86, align 4
  call void @region_2_19(ptr %current_output82, ptr %result_from_other_lane86, ptr %return_buffer88)
  %133 = load float, ptr %return_buffer88, align 4
  store float %133, ptr %current_output82, align 4
  %partial_reduction_result90 = load float, ptr %current_output82, align 4
  %134 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result90, i32 4, i32 31)
  store float %134, ptr %result_from_other_lane89, align 4
  call void @region_2_19(ptr %current_output82, ptr %result_from_other_lane89, ptr %return_buffer91)
  %135 = load float, ptr %return_buffer91, align 4
  store float %135, ptr %current_output82, align 4
  %partial_reduction_result93 = load float, ptr %current_output82, align 4
  %136 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result93, i32 2, i32 31)
  store float %136, ptr %result_from_other_lane92, align 4
  call void @region_2_19(ptr %current_output82, ptr %result_from_other_lane92, ptr %return_buffer94)
  %137 = load float, ptr %return_buffer94, align 4
  store float %137, ptr %current_output82, align 4
  %partial_reduction_result96 = load float, ptr %current_output82, align 4
  %138 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result96, i32 1, i32 31)
  store float %138, ptr %result_from_other_lane95, align 4
  call void @region_2_19(ptr %current_output82, ptr %result_from_other_lane95, ptr %return_buffer97)
  %139 = load float, ptr %return_buffer97, align 4
  store float %139, ptr %current_output82, align 4
  %140 = udiv i32 %thread_id.x36, 32
  %141 = icmp eq i32 %lane_id38, 0
  br i1 %141, label %intra_warp_reduce_write-true98, label %intra_warp_reduce_write-after99

intra_warp_reduce_write-after99:                  ; preds = %intra_warp_reduce_write-true98, %y_in_tile.loop_exit44
  call void @llvm.nvvm.barrier0()
  %142 = icmp eq i32 %140, 0
  br i1 %142, label %inter_warp_reduce-true100, label %inter_warp_reduce-after101

inter_warp_reduce-after101:                       ; preds = %reduction_write_output-after104, %intra_warp_reduce_write-after99
  br label %reduce-group-1-after

early_return35:                                   ; preds = %reduce-group-1-true
  ret void

is_full_tile-true50:                              ; preds = %y_in_tile.loop_body46
  %143 = mul i32 %thread_id.x36, 1
  store i32 0, ptr %tile_loop.invar_address56, align 4
  br label %tile_loop.loop_header54

tile_loop.loop_header54:                          ; preds = %tile_loop.loop_body55, %is_full_tile-true50
  %tile_loop.indvar57 = load i32, ptr %tile_loop.invar_address56, align 4
  %144 = icmp uge i32 %tile_loop.indvar57, 16
  br i1 %144, label %tile_loop.loop_exit53, label %tile_loop.loop_body55

tile_loop.loop_body55:                            ; preds = %tile_loop.loop_header54
  %invar.inc58 = add nuw nsw i32 %tile_loop.indvar57, 1
  store i32 %invar.inc58, ptr %tile_loop.invar_address56, align 4
  %145 = icmp eq i32 %tile_loop.indvar57, 0
  %146 = mul i32 %tile_loop.indvar57, 32
  %147 = add i32 %146, 0
  %x_loc59 = add i32 %147, %143
  %148 = add i32 %tile_origin.142, %y_in_tile.indvar48
  %149 = add i32 %tile_origin.243, %x_loc59
  %150 = mul nuw nsw i32 %149, 1
  %151 = add nuw nsw i32 0, %150
  %152 = mul nuw nsw i32 %148, 64
  %153 = add nuw nsw i32 %151, %152
  %154 = mul nuw nsw i32 %tile_origin.041, 6815744
  %155 = add nuw nsw i32 %153, %154
  %156 = udiv i32 %155, 1
  %157 = urem i32 %156, 64
  %158 = udiv i32 %155, 64
  %159 = urem i32 %158, 13
  %160 = udiv i32 %155, 832
  %161 = mul nuw nsw i32 %157, 1
  %162 = add nuw nsw i32 0, %161
  %163 = mul nuw nsw i32 %159, 64
  %164 = add nuw nsw i32 %162, %163
  %165 = udiv i32 %164, 832
  %166 = mul nuw nsw i32 %160, 1
  %167 = add nuw nsw i32 0, %166
  %168 = udiv i32 %167, 8192
  %169 = add i32 %167, 0
  %170 = add i32 %164, 0
  %Arg_3.4 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %169, i32 %170
  %Arg_3.460 = load float, ptr %Arg_3.4, align 4, !invariant.load !81
  %Arg_4.5 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %169, i32 %170
  %Arg_4.561 = load float, ptr %Arg_4.5, align 4, !invariant.load !81
  %add.15 = fadd float %Arg_3.460, %Arg_4.561
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %155
  %Arg_2.362 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  %multiply.18 = fmul float %add.15, %Arg_2.362
  store float %multiply.18, ptr %reduction_input_address32, align 4
  %171 = getelementptr inbounds float, ptr %partial_reduction_result33, i32 0
  call void @region_2_19(ptr %171, ptr %reduction_input_address32, ptr %return_buffer63)
  %172 = load float, ptr %return_buffer63, align 4
  store float %172, ptr %171, align 4
  br label %tile_loop.loop_header54, !llvm.loop !102

tile_loop.loop_exit53:                            ; preds = %tile_loop.loop_header54
  br label %is_full_tile-after52

is_full_tile-false51:                             ; preds = %y_in_tile.loop_body46
  %173 = mul i32 %thread_id.x36, 1
  store i32 0, ptr %tile_loop.invar_address67, align 4
  br label %tile_loop.loop_header65

tile_loop.loop_header65:                          ; preds = %x_in_tile-after72, %is_full_tile-false51
  %tile_loop.indvar68 = load i32, ptr %tile_loop.invar_address67, align 4
  %174 = icmp uge i32 %tile_loop.indvar68, 16
  br i1 %174, label %tile_loop.loop_exit64, label %tile_loop.loop_body66

tile_loop.loop_body66:                            ; preds = %tile_loop.loop_header65
  %invar.inc69 = add nuw nsw i32 %tile_loop.indvar68, 1
  store i32 %invar.inc69, ptr %tile_loop.invar_address67, align 4
  %175 = icmp eq i32 %tile_loop.indvar68, 0
  %176 = mul i32 %tile_loop.indvar68, 32
  %177 = add i32 %176, 0
  %x_loc70 = add i32 %177, %173
  %178 = add i32 %tile_origin.142, %y_in_tile.indvar48
  %179 = add i32 %tile_origin.243, %x_loc70
  %180 = icmp ult i32 %x_loc70, %tile_bound40
  br i1 %180, label %x_in_tile-true71, label %x_in_tile-after72

x_in_tile-after72:                                ; preds = %x_in_tile-true71, %tile_loop.loop_body66
  br label %tile_loop.loop_header65, !llvm.loop !103

tile_loop.loop_exit64:                            ; preds = %tile_loop.loop_header65
  br label %is_full_tile-after52

x_in_tile-true71:                                 ; preds = %tile_loop.loop_body66
  %181 = mul nuw nsw i32 %179, 1
  %182 = add nuw nsw i32 0, %181
  %183 = mul nuw nsw i32 %178, 64
  %184 = add nuw nsw i32 %182, %183
  %185 = mul nuw nsw i32 %tile_origin.041, 6815744
  %186 = add nuw nsw i32 %184, %185
  %187 = udiv i32 %186, 1
  %188 = urem i32 %187, 64
  %189 = udiv i32 %186, 64
  %190 = urem i32 %189, 13
  %191 = udiv i32 %186, 832
  %192 = mul nuw nsw i32 %188, 1
  %193 = add nuw nsw i32 0, %192
  %194 = mul nuw nsw i32 %190, 64
  %195 = add nuw nsw i32 %193, %194
  %196 = udiv i32 %195, 832
  %197 = mul nuw nsw i32 %191, 1
  %198 = add nuw nsw i32 0, %197
  %199 = udiv i32 %198, 8192
  %200 = add i32 %198, 0
  %201 = add i32 %195, 0
  %Arg_3.473 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %200, i32 %201
  %Arg_3.474 = load float, ptr %Arg_3.473, align 4, !invariant.load !81
  %Arg_4.575 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %200, i32 %201
  %Arg_4.576 = load float, ptr %Arg_4.575, align 4, !invariant.load !81
  %add.1577 = fadd float %Arg_3.474, %Arg_4.576
  %Arg_2.378 = getelementptr inbounds float, ptr %arg2, i32 %186
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !81
  %multiply.1880 = fmul float %add.1577, %Arg_2.379
  store float %multiply.1880, ptr %reduction_input_address32, align 4
  %202 = getelementptr inbounds float, ptr %partial_reduction_result33, i32 0
  call void @region_2_19(ptr %202, ptr %reduction_input_address32, ptr %return_buffer81)
  %203 = load float, ptr %return_buffer81, align 4
  store float %203, ptr %202, align 4
  br label %x_in_tile-after72

intra_warp_reduce_write-true98:                   ; preds = %y_in_tile.loop_exit44
  %204 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %115, i32 0, i32 %140
  %205 = addrspacecast ptr addrspace(3) %204 to ptr
  %206 = load float, ptr %current_output82, align 4
  store float %206, ptr %205, align 4
  br label %intra_warp_reduce_write-after99

inter_warp_reduce-true100:                        ; preds = %intra_warp_reduce_write-after99
  %207 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %115, i32 0, i32 %lane_id38
  %208 = addrspacecast ptr addrspace(3) %207 to ptr
  store float %region_0_25_constant_934, ptr %initial_value_addr102, align 4
  %209 = icmp ult i32 %thread_id.x36, 1
  %210 = select i1 %209, ptr %208, ptr %initial_value_addr102
  %211 = icmp eq i32 %thread_id.x36, 0
  br i1 %211, label %reduction_write_output-true103, label %reduction_write_output-after104

reduction_write_output-after104:                  ; preds = %reduction_write_output-true103, %inter_warp_reduce-true100
  br label %inter_warp_reduce-after101

reduction_write_output-true103:                   ; preds = %inter_warp_reduce-true100
  %212 = mul i32 %thread_id.x36, 1
  %213 = add i32 %tile_origin.142, %thread_id.y37
  %214 = add i32 %tile_origin.243, %212
  %215 = add i32 %214, 0
  %216 = udiv i32 %213, 1
  %217 = urem i32 %216, 13
  %218 = udiv i32 %213, 13
  %output_element_address105 = getelementptr inbounds [8192 x [13 x float]], ptr %arg6, i32 0, i32 %218, i32 %217
  %output106 = load float, ptr %210, align 4
  store float %output106, ptr %output_element_address105, align 4
  br label %reduction_write_output-after104
}

define internal void @region_1_10(ptr dereferenceable(4) %Arg_0.11.typed, ptr dereferenceable(4) %Arg_1.12.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.13.typed = alloca float, align 4
  %Arg_0.11 = load float, ptr %Arg_0.11.typed, align 4
  %Arg_1.12 = load float, ptr %Arg_1.12.typed, align 4
  %add.13 = fadd float %Arg_0.11, %Arg_1.12
  store float %add.13, ptr %add.13.typed, align 4
  %load_ret_value = load float, ptr %add.13.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_19(ptr dereferenceable(4) %Arg_0.20.typed, ptr dereferenceable(4) %Arg_1.21.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.22.typed = alloca float, align 4
  %Arg_0.20 = load float, ptr %Arg_0.20.typed, align 4
  %Arg_1.21 = load float, ptr %Arg_1.21.typed, align 4
  %add.22 = fadd float %Arg_0.20, %Arg_1.21
  store float %add.22, ptr %add.22.typed, align 4
  %load_ret_value = load float, ptr %add.22.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_56(ptr noalias align 16 dereferenceable(4456448) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 16 dereferenceable(4456448) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 16 dereferenceable(31719424) %arg4, ptr noalias align 128 dereferenceable(557056) %arg5, ptr noalias align 128 dereferenceable(557056) %arg6) {
entry:
  %return_buffer85 = alloca float, align 4
  %result_from_other_lane83 = alloca float, align 4
  %return_buffer82 = alloca float, align 4
  %result_from_other_lane80 = alloca float, align 4
  %return_buffer79 = alloca float, align 4
  %result_from_other_lane77 = alloca float, align 4
  %return_buffer75 = alloca float, align 4
  %tile_loop.invar_address61 = alloca i32, align 4
  %return_buffer57 = alloca float, align 4
  %tile_loop.invar_address50 = alloca i32, align 4
  %y_in_tile.invar_address41 = alloca i32, align 4
  %partial_reduction_result27 = alloca float, align 4
  %reduction_input_address26 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %result_from_other_lane23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %result_from_other_lane20 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !82
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after87, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_25_constant_9 = load float, ptr @6, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_25_constant_9, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !96
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !104
  %6 = urem i32 %4, 8
  %7 = udiv i32 %4, 8
  %8 = mul i32 %5, 12
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 139264
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 8
  %thread_id.y = udiv i32 %6, 8
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %9, 1
  %15 = urem i32 %14, 139264
  %16 = udiv i32 %9, 139264
  %17 = icmp eq i32 %15, 139263
  %tile_bound = select i1 %17, i32 1, i32 1
  %18 = icmp eq i32 %13, 0
  %tile_bound1 = select i1 %18, i32 8, i32 128
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 1
  %tile_origin.2 = mul i32 %13, 128
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = icmp eq i32 128, %tile_bound1
  br i1 %21, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !105

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %22 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 4, i32 31)
  store float %22, ptr %result_from_other_lane, align 4
  call void @region_1_10__1(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %23 = load float, ptr %return_buffer19, align 4
  store float %23, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %24 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 2, i32 31)
  store float %24, ptr %result_from_other_lane20, align 4
  call void @region_1_10__1(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %25 = load float, ptr %return_buffer22, align 4
  store float %25, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %26 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 1, i32 31)
  store float %26, ptr %result_from_other_lane23, align 4
  call void @region_1_10__1(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %27 = load float, ptr %return_buffer25, align 4
  store float %27, ptr %current_output, align 4
  %28 = udiv i32 %thread_id.x, 32
  %29 = and i32 %thread_id.x, 7
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %31 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %32 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %32, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %33 = icmp eq i32 %tile_loop.indvar, 0
  %34 = mul i32 %tile_loop.indvar, 8
  %35 = add i32 %34, 0
  %x_loc = add i32 %35, %31
  %36 = add i32 %tile_origin.1, %y_in_tile.indvar
  %37 = add i32 %tile_origin.2, %x_loc
  %38 = mul nuw nsw i32 %37, 1
  %39 = add nuw nsw i32 0, %38
  %40 = mul nuw nsw i32 %36, 8
  %41 = add nuw nsw i32 %39, %40
  %42 = mul nuw nsw i32 %tile_origin.0, 1114112
  %43 = add nuw nsw i32 %41, %42
  %44 = udiv i32 %43, 1
  %45 = urem i32 %44, 8
  %46 = udiv i32 %43, 8
  %47 = urem i32 %46, 17
  %48 = udiv i32 %43, 136
  %49 = mul nuw nsw i32 %45, 1
  %50 = add nuw nsw i32 0, %49
  %51 = mul nuw nsw i32 %47, 8
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 136
  %54 = mul nuw nsw i32 %48, 1
  %55 = add nuw nsw i32 0, %54
  %56 = udiv i32 %55, 8192
  %57 = add i32 %55, 0
  %58 = add i32 %52, 832
  %Arg_1.2 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %57, i32 %58
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !81
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %43
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  %multiply.8 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.8, ptr %reduction_input_address, align 4
  %59 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10__1(ptr %59, ptr %reduction_input_address, ptr %return_buffer)
  %60 = load float, ptr %return_buffer, align 4
  store float %60, ptr %59, align 4
  br label %tile_loop.loop_header, !llvm.loop !106

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %61 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %62 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %62, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %63 = icmp eq i32 %tile_loop.indvar9, 0
  %64 = mul i32 %tile_loop.indvar9, 8
  %65 = add i32 %64, 0
  %x_loc11 = add i32 %65, %61
  %66 = add i32 %tile_origin.1, %y_in_tile.indvar
  %67 = add i32 %tile_origin.2, %x_loc11
  %68 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %68, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !107

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %69 = mul nuw nsw i32 %67, 1
  %70 = add nuw nsw i32 0, %69
  %71 = mul nuw nsw i32 %66, 8
  %72 = add nuw nsw i32 %70, %71
  %73 = mul nuw nsw i32 %tile_origin.0, 1114112
  %74 = add nuw nsw i32 %72, %73
  %75 = udiv i32 %74, 1
  %76 = urem i32 %75, 8
  %77 = udiv i32 %74, 8
  %78 = urem i32 %77, 17
  %79 = udiv i32 %74, 136
  %80 = mul nuw nsw i32 %76, 1
  %81 = add nuw nsw i32 0, %80
  %82 = mul nuw nsw i32 %78, 8
  %83 = add nuw nsw i32 %81, %82
  %84 = udiv i32 %83, 136
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 8192
  %88 = add i32 %86, 0
  %89 = add i32 %83, 832
  %Arg_1.212 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %88, i32 %89
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !81
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %74
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !81
  %multiply.816 = fmul float %Arg_1.213, %Arg_0.115
  store float %multiply.816, ptr %reduction_input_address, align 4
  %90 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10__1(ptr %90, ptr %reduction_input_address, ptr %return_buffer17)
  %91 = load float, ptr %return_buffer17, align 4
  store float %91, ptr %90, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %92 = mul i32 %thread_id.x, 1
  %93 = add i32 %tile_origin.1, %thread_id.y
  %94 = add i32 %tile_origin.2, %92
  %95 = add i32 %94, 0
  %96 = udiv i32 %93, 1
  %97 = urem i32 %96, 17
  %98 = udiv i32 %93, 17
  %output_element_address = getelementptr inbounds [8192 x [17 x float]], ptr %arg5, i32 0, i32 %98, i32 %97
  %output = load float, ptr %current_output, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %region_0_25_constant_928 = load float, ptr @6, align 4
  %99 = getelementptr inbounds float, ptr %partial_reduction_result27, i32 0
  store float %region_0_25_constant_928, ptr %99, align 4
  %100 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !96
  %101 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !104
  %102 = urem i32 %100, 8
  %103 = udiv i32 %100, 8
  %104 = mul i32 %101, 12
  %105 = add i32 %104, %103
  %106 = icmp ult i32 %105, 139264
  br i1 %106, label %107, label %early_return29

107:                                              ; preds = %reduce-group-1-true
  %thread_id.x30 = urem i32 %102, 8
  %thread_id.y31 = udiv i32 %102, 8
  %lane_id32 = urem i32 %102, 32
  %108 = udiv i32 %105, 1
  %109 = urem i32 %108, 1
  %110 = udiv i32 %105, 1
  %111 = urem i32 %110, 139264
  %112 = udiv i32 %105, 139264
  %113 = icmp eq i32 %111, 139263
  %tile_bound33 = select i1 %113, i32 1, i32 1
  %114 = icmp eq i32 %109, 0
  %tile_bound34 = select i1 %114, i32 8, i32 128
  %tile_origin.035 = mul i32 %112, 1
  %tile_origin.136 = mul i32 %111, 1
  %tile_origin.237 = mul i32 %109, 128
  store i32 %thread_id.y31, ptr %y_in_tile.invar_address41, align 4
  br label %y_in_tile.loop_header39

y_in_tile.loop_header39:                          ; preds = %is_full_tile-after46, %107
  %y_in_tile.indvar42 = load i32, ptr %y_in_tile.invar_address41, align 4
  %115 = icmp uge i32 %y_in_tile.indvar42, %tile_bound33
  br i1 %115, label %y_in_tile.loop_exit38, label %y_in_tile.loop_body40

y_in_tile.loop_body40:                            ; preds = %y_in_tile.loop_header39
  %invar.inc43 = add nuw nsw i32 %y_in_tile.indvar42, 1
  store i32 %invar.inc43, ptr %y_in_tile.invar_address41, align 4
  %116 = icmp eq i32 %y_in_tile.indvar42, %thread_id.y31
  %117 = icmp eq i32 128, %tile_bound34
  br i1 %117, label %is_full_tile-true44, label %is_full_tile-false45

is_full_tile-after46:                             ; preds = %tile_loop.loop_exit58, %tile_loop.loop_exit47
  br label %y_in_tile.loop_header39, !llvm.loop !108

y_in_tile.loop_exit38:                            ; preds = %y_in_tile.loop_header39
  %current_output76 = getelementptr inbounds float, ptr %partial_reduction_result27, i32 0
  %partial_reduction_result78 = load float, ptr %current_output76, align 4
  %118 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result78, i32 4, i32 31)
  store float %118, ptr %result_from_other_lane77, align 4
  call void @region_2_19__1(ptr %current_output76, ptr %result_from_other_lane77, ptr %return_buffer79)
  %119 = load float, ptr %return_buffer79, align 4
  store float %119, ptr %current_output76, align 4
  %partial_reduction_result81 = load float, ptr %current_output76, align 4
  %120 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result81, i32 2, i32 31)
  store float %120, ptr %result_from_other_lane80, align 4
  call void @region_2_19__1(ptr %current_output76, ptr %result_from_other_lane80, ptr %return_buffer82)
  %121 = load float, ptr %return_buffer82, align 4
  store float %121, ptr %current_output76, align 4
  %partial_reduction_result84 = load float, ptr %current_output76, align 4
  %122 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result84, i32 1, i32 31)
  store float %122, ptr %result_from_other_lane83, align 4
  call void @region_2_19__1(ptr %current_output76, ptr %result_from_other_lane83, ptr %return_buffer85)
  %123 = load float, ptr %return_buffer85, align 4
  store float %123, ptr %current_output76, align 4
  %124 = udiv i32 %thread_id.x30, 32
  %125 = and i32 %thread_id.x30, 7
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %reduction_write_output-true86, label %reduction_write_output-after87

reduction_write_output-after87:                   ; preds = %reduction_write_output-true86, %y_in_tile.loop_exit38
  br label %reduce-group-1-after

early_return29:                                   ; preds = %reduce-group-1-true
  ret void

is_full_tile-true44:                              ; preds = %y_in_tile.loop_body40
  %127 = mul i32 %thread_id.x30, 1
  store i32 0, ptr %tile_loop.invar_address50, align 4
  br label %tile_loop.loop_header48

tile_loop.loop_header48:                          ; preds = %tile_loop.loop_body49, %is_full_tile-true44
  %tile_loop.indvar51 = load i32, ptr %tile_loop.invar_address50, align 4
  %128 = icmp uge i32 %tile_loop.indvar51, 16
  br i1 %128, label %tile_loop.loop_exit47, label %tile_loop.loop_body49

tile_loop.loop_body49:                            ; preds = %tile_loop.loop_header48
  %invar.inc52 = add nuw nsw i32 %tile_loop.indvar51, 1
  store i32 %invar.inc52, ptr %tile_loop.invar_address50, align 4
  %129 = icmp eq i32 %tile_loop.indvar51, 0
  %130 = mul i32 %tile_loop.indvar51, 8
  %131 = add i32 %130, 0
  %x_loc53 = add i32 %131, %127
  %132 = add i32 %tile_origin.136, %y_in_tile.indvar42
  %133 = add i32 %tile_origin.237, %x_loc53
  %134 = mul nuw nsw i32 %133, 1
  %135 = add nuw nsw i32 0, %134
  %136 = mul nuw nsw i32 %132, 8
  %137 = add nuw nsw i32 %135, %136
  %138 = mul nuw nsw i32 %tile_origin.035, 1114112
  %139 = add nuw nsw i32 %137, %138
  %140 = udiv i32 %139, 1
  %141 = urem i32 %140, 8
  %142 = udiv i32 %139, 8
  %143 = urem i32 %142, 17
  %144 = udiv i32 %139, 136
  %145 = mul nuw nsw i32 %141, 1
  %146 = add nuw nsw i32 0, %145
  %147 = mul nuw nsw i32 %143, 8
  %148 = add nuw nsw i32 %146, %147
  %149 = udiv i32 %148, 136
  %150 = mul nuw nsw i32 %144, 1
  %151 = add nuw nsw i32 0, %150
  %152 = udiv i32 %151, 8192
  %153 = add i32 %151, 0
  %154 = add i32 %148, 832
  %Arg_3.4 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %153, i32 %154
  %Arg_3.454 = load float, ptr %Arg_3.4, align 4, !invariant.load !81
  %Arg_4.5 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %153, i32 %154
  %Arg_4.555 = load float, ptr %Arg_4.5, align 4, !invariant.load !81
  %add.15 = fadd float %Arg_3.454, %Arg_4.555
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %139
  %Arg_2.356 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  %multiply.18 = fmul float %add.15, %Arg_2.356
  store float %multiply.18, ptr %reduction_input_address26, align 4
  %155 = getelementptr inbounds float, ptr %partial_reduction_result27, i32 0
  call void @region_2_19__1(ptr %155, ptr %reduction_input_address26, ptr %return_buffer57)
  %156 = load float, ptr %return_buffer57, align 4
  store float %156, ptr %155, align 4
  br label %tile_loop.loop_header48, !llvm.loop !109

tile_loop.loop_exit47:                            ; preds = %tile_loop.loop_header48
  br label %is_full_tile-after46

is_full_tile-false45:                             ; preds = %y_in_tile.loop_body40
  %157 = mul i32 %thread_id.x30, 1
  store i32 0, ptr %tile_loop.invar_address61, align 4
  br label %tile_loop.loop_header59

tile_loop.loop_header59:                          ; preds = %x_in_tile-after66, %is_full_tile-false45
  %tile_loop.indvar62 = load i32, ptr %tile_loop.invar_address61, align 4
  %158 = icmp uge i32 %tile_loop.indvar62, 16
  br i1 %158, label %tile_loop.loop_exit58, label %tile_loop.loop_body60

tile_loop.loop_body60:                            ; preds = %tile_loop.loop_header59
  %invar.inc63 = add nuw nsw i32 %tile_loop.indvar62, 1
  store i32 %invar.inc63, ptr %tile_loop.invar_address61, align 4
  %159 = icmp eq i32 %tile_loop.indvar62, 0
  %160 = mul i32 %tile_loop.indvar62, 8
  %161 = add i32 %160, 0
  %x_loc64 = add i32 %161, %157
  %162 = add i32 %tile_origin.136, %y_in_tile.indvar42
  %163 = add i32 %tile_origin.237, %x_loc64
  %164 = icmp ult i32 %x_loc64, %tile_bound34
  br i1 %164, label %x_in_tile-true65, label %x_in_tile-after66

x_in_tile-after66:                                ; preds = %x_in_tile-true65, %tile_loop.loop_body60
  br label %tile_loop.loop_header59, !llvm.loop !110

tile_loop.loop_exit58:                            ; preds = %tile_loop.loop_header59
  br label %is_full_tile-after46

x_in_tile-true65:                                 ; preds = %tile_loop.loop_body60
  %165 = mul nuw nsw i32 %163, 1
  %166 = add nuw nsw i32 0, %165
  %167 = mul nuw nsw i32 %162, 8
  %168 = add nuw nsw i32 %166, %167
  %169 = mul nuw nsw i32 %tile_origin.035, 1114112
  %170 = add nuw nsw i32 %168, %169
  %171 = udiv i32 %170, 1
  %172 = urem i32 %171, 8
  %173 = udiv i32 %170, 8
  %174 = urem i32 %173, 17
  %175 = udiv i32 %170, 136
  %176 = mul nuw nsw i32 %172, 1
  %177 = add nuw nsw i32 0, %176
  %178 = mul nuw nsw i32 %174, 8
  %179 = add nuw nsw i32 %177, %178
  %180 = udiv i32 %179, 136
  %181 = mul nuw nsw i32 %175, 1
  %182 = add nuw nsw i32 0, %181
  %183 = udiv i32 %182, 8192
  %184 = add i32 %182, 0
  %185 = add i32 %179, 832
  %Arg_3.467 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %184, i32 %185
  %Arg_3.468 = load float, ptr %Arg_3.467, align 4, !invariant.load !81
  %Arg_4.569 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %184, i32 %185
  %Arg_4.570 = load float, ptr %Arg_4.569, align 4, !invariant.load !81
  %add.1571 = fadd float %Arg_3.468, %Arg_4.570
  %Arg_2.372 = getelementptr inbounds float, ptr %arg2, i32 %170
  %Arg_2.373 = load float, ptr %Arg_2.372, align 4, !invariant.load !81
  %multiply.1874 = fmul float %add.1571, %Arg_2.373
  store float %multiply.1874, ptr %reduction_input_address26, align 4
  %186 = getelementptr inbounds float, ptr %partial_reduction_result27, i32 0
  call void @region_2_19__1(ptr %186, ptr %reduction_input_address26, ptr %return_buffer75)
  %187 = load float, ptr %return_buffer75, align 4
  store float %187, ptr %186, align 4
  br label %x_in_tile-after66

reduction_write_output-true86:                    ; preds = %y_in_tile.loop_exit38
  %188 = mul i32 %thread_id.x30, 1
  %189 = add i32 %tile_origin.136, %thread_id.y31
  %190 = add i32 %tile_origin.237, %188
  %191 = add i32 %190, 0
  %192 = udiv i32 %189, 1
  %193 = urem i32 %192, 17
  %194 = udiv i32 %189, 17
  %output_element_address88 = getelementptr inbounds [8192 x [17 x float]], ptr %arg6, i32 0, i32 %194, i32 %193
  %output89 = load float, ptr %current_output76, align 4
  store float %output89, ptr %output_element_address88, align 4
  br label %reduction_write_output-after87
}

define internal void @region_1_10__1(ptr dereferenceable(4) %Arg_0.11.typed, ptr dereferenceable(4) %Arg_1.12.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.13.typed = alloca float, align 4
  %Arg_0.11 = load float, ptr %Arg_0.11.typed, align 4
  %Arg_1.12 = load float, ptr %Arg_1.12.typed, align 4
  %add.13 = fadd float %Arg_0.11, %Arg_1.12
  store float %add.13, ptr %add.13.typed, align 4
  %load_ret_value = load float, ptr %add.13.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_19__1(ptr dereferenceable(4) %Arg_0.20.typed, ptr dereferenceable(4) %Arg_1.21.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.22.typed = alloca float, align 4
  %Arg_0.20 = load float, ptr %Arg_0.20.typed, align 4
  %Arg_1.21 = load float, ptr %Arg_1.21.typed, align 4
  %add.22 = fadd float %Arg_0.20, %Arg_1.21
  store float %add.22, ptr %add.22.typed, align 4
  %load_ret_value = load float, ptr %add.22.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_54(ptr noalias align 16 dereferenceable(983040) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(425984) %arg2, ptr noalias align 128 dereferenceable(557056) %arg3, ptr noalias align 16 dereferenceable(983040) %arg4, ptr noalias align 128 dereferenceable(425984) %arg5, ptr noalias align 128 dereferenceable(557056) %arg6, ptr noalias align 128 dereferenceable(7680) %arg7, ptr noalias align 128 dereferenceable(983040) %arg8, ptr noalias align 128 dereferenceable(7680) %arg9, ptr noalias align 128 dereferenceable(983040) %arg10) {
entry:
  %return_buffer96 = alloca float, align 4
  %result_from_other_lane94 = alloca float, align 4
  %return_buffer93 = alloca float, align 4
  %result_from_other_lane91 = alloca float, align 4
  %return_buffer90 = alloca float, align 4
  %result_from_other_lane88 = alloca float, align 4
  %return_buffer87 = alloca float, align 4
  %result_from_other_lane85 = alloca float, align 4
  %return_buffer84 = alloca float, align 4
  %result_from_other_lane82 = alloca float, align 4
  %return_buffer78 = alloca float, align 4
  %result_from_other_lane76 = alloca float, align 4
  %return_buffer75 = alloca float, align 4
  %result_from_other_lane73 = alloca float, align 4
  %return_buffer72 = alloca float, align 4
  %result_from_other_lane70 = alloca float, align 4
  %return_buffer69 = alloca float, align 4
  %result_from_other_lane67 = alloca float, align 4
  %return_buffer66 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result2 = alloca float, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !74
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after98, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_35_constant_17 = load float, ptr @8, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_35_constant_17, ptr %2, align 4
  %region_0_35_constant_173 = load float, ptr @8, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_35_constant_173, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 64
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %9, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 1
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 128, i32 4096
  %18 = icmp eq i32 %13, 0
  %tile_bound4 = select i1 %18, i32 30, i32 32
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 4096
  %tile_origin.2 = mul i32 %13, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %22 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %22, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc5 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc5, ptr %tile_loop.invar_address, align 4
  %23 = icmp eq i32 %tile_loop.indvar, 0
  %24 = mul i32 %tile_loop.indvar, 1
  %25 = add i32 %24, 0
  %x_loc = add i32 %25, %21
  %26 = add i32 %tile_origin.1, %y_in_tile.indvar
  %27 = add i32 %tile_origin.2, %x_loc
  %28 = icmp ult i32 %x_loc, %tile_bound4
  br i1 %28, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.23.merge45, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !111

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !112

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %29 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %30 = load float, ptr %current_output, align 4
  store float %30, ptr %29, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %31 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result65 = load float, ptr %31, align 4
  %32 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result65, i32 16, i32 31)
  store float %32, ptr %result_from_other_lane, align 4
  call void @region_1_18(ptr %31, ptr %result_from_other_lane, ptr %return_buffer66)
  %33 = load float, ptr %return_buffer66, align 4
  store float %33, ptr %31, align 4
  %partial_reduction_result68 = load float, ptr %31, align 4
  %34 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result68, i32 8, i32 31)
  store float %34, ptr %result_from_other_lane67, align 4
  call void @region_1_18(ptr %31, ptr %result_from_other_lane67, ptr %return_buffer69)
  %35 = load float, ptr %return_buffer69, align 4
  store float %35, ptr %31, align 4
  %partial_reduction_result71 = load float, ptr %31, align 4
  %36 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result71, i32 4, i32 31)
  store float %36, ptr %result_from_other_lane70, align 4
  call void @region_1_18(ptr %31, ptr %result_from_other_lane70, ptr %return_buffer72)
  %37 = load float, ptr %return_buffer72, align 4
  store float %37, ptr %31, align 4
  %partial_reduction_result74 = load float, ptr %31, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result74, i32 2, i32 31)
  store float %38, ptr %result_from_other_lane73, align 4
  call void @region_1_18(ptr %31, ptr %result_from_other_lane73, ptr %return_buffer75)
  %39 = load float, ptr %return_buffer75, align 4
  store float %39, ptr %31, align 4
  %partial_reduction_result77 = load float, ptr %31, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result77, i32 1, i32 31)
  store float %40, ptr %result_from_other_lane76, align 4
  call void @region_1_18(ptr %31, ptr %result_from_other_lane76, ptr %return_buffer78)
  %41 = load float, ptr %return_buffer78, align 4
  store float %41, ptr %31, align 4
  %42 = icmp ult i32 %thread_id.x, %tile_bound
  %43 = mul i32 %thread_id.y, 1
  %44 = icmp ult i32 %43, %tile_bound4
  %45 = and i1 %44, %42
  %46 = icmp eq i32 %lane_id, 0
  %47 = and i1 %45, %46
  br i1 %47, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address79 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %48 = addrspacecast ptr addrspace(3) %shmem_output_address79 to ptr
  %current_output80 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %49 = load float, ptr %current_output80, align 4
  store float %49, ptr %48, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr81 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %50 = addrspacecast ptr addrspace(3) %shmem_transposed_addr81 to ptr
  %partial_reduction_result83 = load float, ptr %50, align 4
  %51 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result83, i32 16, i32 31)
  store float %51, ptr %result_from_other_lane82, align 4
  call void @region_2_29(ptr %50, ptr %result_from_other_lane82, ptr %return_buffer84)
  %52 = load float, ptr %return_buffer84, align 4
  store float %52, ptr %50, align 4
  %partial_reduction_result86 = load float, ptr %50, align 4
  %53 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result86, i32 8, i32 31)
  store float %53, ptr %result_from_other_lane85, align 4
  call void @region_2_29(ptr %50, ptr %result_from_other_lane85, ptr %return_buffer87)
  %54 = load float, ptr %return_buffer87, align 4
  store float %54, ptr %50, align 4
  %partial_reduction_result89 = load float, ptr %50, align 4
  %55 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result89, i32 4, i32 31)
  store float %55, ptr %result_from_other_lane88, align 4
  call void @region_2_29(ptr %50, ptr %result_from_other_lane88, ptr %return_buffer90)
  %56 = load float, ptr %return_buffer90, align 4
  store float %56, ptr %50, align 4
  %partial_reduction_result92 = load float, ptr %50, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result92, i32 2, i32 31)
  store float %57, ptr %result_from_other_lane91, align 4
  call void @region_2_29(ptr %50, ptr %result_from_other_lane91, ptr %return_buffer93)
  %58 = load float, ptr %return_buffer93, align 4
  store float %58, ptr %50, align 4
  %partial_reduction_result95 = load float, ptr %50, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result95, i32 1, i32 31)
  store float %59, ptr %result_from_other_lane94, align 4
  call void @region_2_29(ptr %50, ptr %result_from_other_lane94, ptr %return_buffer96)
  %60 = load float, ptr %return_buffer96, align 4
  store float %60, ptr %50, align 4
  %61 = icmp ult i32 %thread_id.x, %tile_bound
  %62 = mul i32 %thread_id.y, 1
  %63 = icmp ult i32 %62, %tile_bound4
  %64 = and i1 %63, %61
  %65 = icmp eq i32 %lane_id, 0
  %66 = and i1 %64, %65
  br i1 %66, label %reduction_write_output-true97, label %reduction_write_output-after98

reduction_write_output-after98:                   ; preds = %reduction_write_output-true97, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %67 = mul nuw nsw i32 %27, 1
  %68 = add nuw nsw i32 0, %67
  %69 = mul nuw nsw i32 %26, 30
  %70 = add nuw nsw i32 %68, %69
  %71 = mul nuw nsw i32 %tile_origin.0, 3840
  %72 = add nuw nsw i32 %70, %71
  %73 = udiv i32 %72, 1
  %74 = urem i32 %73, 30
  %75 = udiv i32 %72, 30
  %76 = urem i32 %75, 128
  %77 = udiv i32 %72, 3840
  %78 = mul i32 %thread_id.x, 1
  %79 = sub i32 %x_loc, %78
  %80 = mul nuw nsw i32 %74, 1
  %81 = add nuw nsw i32 0, %80
  %82 = udiv i32 %81, 30
  %83 = mul nuw nsw i32 %76, 1
  %84 = add nuw nsw i32 0, %83
  %85 = mul nuw nsw i32 %77, 128
  %86 = add nuw nsw i32 %84, %85
  %87 = udiv i32 %86, 8192
  br label %concatenate.pivot.13.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %88 = phi i32 [ 0, %concatenate.pivot.0. ]
  %89 = sub nsw i32 %81, %88
  %90 = udiv i32 %72, 30
  %91 = mul i32 %90, 13
  %92 = add i32 %91, %89
  %93 = udiv i32 %92, 1
  %94 = urem i32 %93, 13
  %95 = udiv i32 %92, 13
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %92
  %Arg_2.36 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  br label %concatenate.8.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.13.8
  %96 = phi i32 [ 13, %concatenate.pivot.13.8 ]
  %97 = sub nsw i32 %81, %96
  %98 = udiv i32 %72, 30
  %99 = mul i32 %98, 17
  %100 = add i32 %99, %97
  %101 = udiv i32 %100, 1
  %102 = urem i32 %101, 17
  %103 = udiv i32 %100, 17
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %100
  %Arg_3.47 = load float, ptr %Arg_3.4, align 4, !invariant.load !81
  br label %concatenate.8.merge

concatenate.pivot.13.:                            ; preds = %x_in_tile-true
  %104 = icmp ult i32 %81, 13
  br i1 %104, label %concatenate.pivot.0., label %concatenate.pivot.13.8

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.13.
  br label %concat_index_from_operand_id0

concatenate.pivot.13.8:                           ; preds = %concatenate.pivot.13.
  br label %concat_index_from_operand_id1

concatenate.8.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %105 = phi float [ %Arg_2.36, %concat_index_from_operand_id0 ], [ %Arg_3.47, %concat_index_from_operand_id1 ]
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !81
  %multiply.10 = fmul float %105, %Arg_1.2
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %72
  %Arg_0.19 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  %multiply.11 = fmul float %multiply.10, %Arg_0.19
  %region_0_35_constant_12 = load float, ptr @7, align 4
  %Arg_0.110 = getelementptr inbounds float, ptr %arg0, i32 %72
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !81
  %subtract.14 = fsub float %region_0_35_constant_12, %Arg_0.111
  %multiply.15 = fmul float %multiply.11, %subtract.14
  store float %multiply.15, ptr %reduction_input_address, align 4
  %106 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %79
  call void @region_1_18(ptr %106, ptr %reduction_input_address, ptr %return_buffer)
  %107 = load float, ptr %return_buffer, align 4
  store float %107, ptr %106, align 4
  %108 = mul nuw nsw i32 %74, 1
  %109 = add nuw nsw i32 0, %108
  %110 = udiv i32 %109, 30
  %111 = mul nuw nsw i32 %76, 1
  %112 = add nuw nsw i32 0, %111
  %113 = mul nuw nsw i32 %77, 128
  %114 = add nuw nsw i32 %112, %113
  %115 = udiv i32 %114, 8192
  br label %concatenate.pivot.13.16

concat_index_from_operand_id012:                  ; preds = %concatenate.pivot.0.17
  %116 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %117 = sub nsw i32 %109, %116
  %118 = udiv i32 %72, 30
  %119 = mul i32 %118, 13
  %120 = add i32 %119, %117
  %121 = udiv i32 %120, 1
  %122 = urem i32 %121, 13
  %123 = udiv i32 %120, 13
  %Arg_5.6 = getelementptr inbounds float, ptr %arg5, i32 %120
  %Arg_5.613 = load float, ptr %Arg_5.6, align 4, !invariant.load !81
  br label %concatenate.23.merge

concat_index_from_operand_id114:                  ; preds = %concatenate.pivot.13.18
  %124 = phi i32 [ 13, %concatenate.pivot.13.18 ]
  %125 = sub nsw i32 %109, %124
  %126 = udiv i32 %72, 30
  %127 = mul i32 %126, 17
  %128 = add i32 %127, %125
  %129 = udiv i32 %128, 1
  %130 = urem i32 %129, 17
  %131 = udiv i32 %128, 17
  %Arg_6.7 = getelementptr inbounds float, ptr %arg6, i32 %128
  %Arg_6.715 = load float, ptr %Arg_6.7, align 4, !invariant.load !81
  br label %concatenate.23.merge

concatenate.pivot.13.16:                          ; preds = %concatenate.8.merge
  %132 = icmp ult i32 %109, 13
  br i1 %132, label %concatenate.pivot.0.17, label %concatenate.pivot.13.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.13.16
  br label %concat_index_from_operand_id012

concatenate.pivot.13.18:                          ; preds = %concatenate.pivot.13.16
  br label %concat_index_from_operand_id114

concatenate.23.merge:                             ; preds = %concat_index_from_operand_id114, %concat_index_from_operand_id012
  %133 = phi float [ %Arg_5.613, %concat_index_from_operand_id012 ], [ %Arg_6.715, %concat_index_from_operand_id114 ]
  %Arg_1.219 = load float, ptr %arg1, align 4, !invariant.load !81
  %multiply.24 = fmul float %133, %Arg_1.219
  %Arg_4.5 = getelementptr inbounds float, ptr %arg4, i32 %72
  %Arg_4.520 = load float, ptr %Arg_4.5, align 4, !invariant.load !81
  %multiply.25 = fmul float %multiply.24, %Arg_4.520
  %region_0_35_constant_1221 = load float, ptr @7, align 4
  %Arg_4.522 = getelementptr inbounds float, ptr %arg4, i32 %72
  %Arg_4.523 = load float, ptr %Arg_4.522, align 4, !invariant.load !81
  %subtract.26 = fsub float %region_0_35_constant_1221, %Arg_4.523
  %multiply.27 = fmul float %multiply.25, %subtract.26
  store float %multiply.27, ptr %reduction_input_address1, align 4
  %134 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %79
  call void @region_2_29(ptr %134, ptr %reduction_input_address1, ptr %return_buffer24)
  %135 = load float, ptr %return_buffer24, align 4
  store float %135, ptr %134, align 4
  %136 = mul nuw nsw i32 %74, 1
  %137 = add nuw nsw i32 0, %136
  %138 = udiv i32 %137, 30
  %139 = mul nuw nsw i32 %76, 1
  %140 = add nuw nsw i32 0, %139
  %141 = mul nuw nsw i32 %77, 128
  %142 = add nuw nsw i32 %140, %141
  %143 = udiv i32 %142, 8192
  br label %concatenate.pivot.13.32

concat_index_from_operand_id026:                  ; preds = %concatenate.pivot.0.33
  %144 = phi i32 [ 0, %concatenate.pivot.0.33 ]
  %145 = sub nsw i32 %137, %144
  %146 = udiv i32 %72, 30
  %147 = mul i32 %146, 13
  %148 = add i32 %147, %145
  %149 = udiv i32 %148, 1
  %150 = urem i32 %149, 13
  %151 = udiv i32 %148, 13
  %Arg_2.327 = getelementptr inbounds float, ptr %arg2, i32 %148
  %Arg_2.328 = load float, ptr %Arg_2.327, align 4, !invariant.load !81
  br label %concatenate.8.merge25

concat_index_from_operand_id129:                  ; preds = %concatenate.pivot.13.34
  %152 = phi i32 [ 13, %concatenate.pivot.13.34 ]
  %153 = sub nsw i32 %137, %152
  %154 = udiv i32 %72, 30
  %155 = mul i32 %154, 17
  %156 = add i32 %155, %153
  %157 = udiv i32 %156, 1
  %158 = urem i32 %157, 17
  %159 = udiv i32 %156, 17
  %Arg_3.430 = getelementptr inbounds float, ptr %arg3, i32 %156
  %Arg_3.431 = load float, ptr %Arg_3.430, align 4, !invariant.load !81
  br label %concatenate.8.merge25

concatenate.pivot.13.32:                          ; preds = %concatenate.23.merge
  %160 = icmp ult i32 %137, 13
  br i1 %160, label %concatenate.pivot.0.33, label %concatenate.pivot.13.34

concatenate.pivot.0.33:                           ; preds = %concatenate.pivot.13.32
  br label %concat_index_from_operand_id026

concatenate.pivot.13.34:                          ; preds = %concatenate.pivot.13.32
  br label %concat_index_from_operand_id129

concatenate.8.merge25:                            ; preds = %concat_index_from_operand_id129, %concat_index_from_operand_id026
  %161 = phi float [ %Arg_2.328, %concat_index_from_operand_id026 ], [ %Arg_3.431, %concat_index_from_operand_id129 ]
  %Arg_1.235 = load float, ptr %arg1, align 4, !invariant.load !81
  %multiply.1036 = fmul float %161, %Arg_1.235
  %Arg_0.137 = getelementptr inbounds float, ptr %arg0, i32 %72
  %Arg_0.138 = load float, ptr %Arg_0.137, align 4, !invariant.load !81
  %multiply.1139 = fmul float %multiply.1036, %Arg_0.138
  %region_0_35_constant_1240 = load float, ptr @7, align 4
  %Arg_0.141 = getelementptr inbounds float, ptr %arg0, i32 %72
  %Arg_0.142 = load float, ptr %Arg_0.141, align 4, !invariant.load !81
  %subtract.1443 = fsub float %region_0_35_constant_1240, %Arg_0.142
  %multiply.1544 = fmul float %multiply.1139, %subtract.1443
  %162 = mul nuw nsw i32 %74, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 30
  %165 = mul nuw nsw i32 %76, 1
  %166 = add nuw nsw i32 0, %165
  %167 = mul nuw nsw i32 %77, 128
  %168 = add nuw nsw i32 %166, %167
  %169 = udiv i32 %168, 8192
  br label %concatenate.pivot.13.52

concat_index_from_operand_id046:                  ; preds = %concatenate.pivot.0.53
  %170 = phi i32 [ 0, %concatenate.pivot.0.53 ]
  %171 = sub nsw i32 %163, %170
  %172 = udiv i32 %72, 30
  %173 = mul i32 %172, 13
  %174 = add i32 %173, %171
  %175 = udiv i32 %174, 1
  %176 = urem i32 %175, 13
  %177 = udiv i32 %174, 13
  %Arg_5.647 = getelementptr inbounds float, ptr %arg5, i32 %174
  %Arg_5.648 = load float, ptr %Arg_5.647, align 4, !invariant.load !81
  br label %concatenate.23.merge45

concat_index_from_operand_id149:                  ; preds = %concatenate.pivot.13.54
  %178 = phi i32 [ 13, %concatenate.pivot.13.54 ]
  %179 = sub nsw i32 %163, %178
  %180 = udiv i32 %72, 30
  %181 = mul i32 %180, 17
  %182 = add i32 %181, %179
  %183 = udiv i32 %182, 1
  %184 = urem i32 %183, 17
  %185 = udiv i32 %182, 17
  %Arg_6.750 = getelementptr inbounds float, ptr %arg6, i32 %182
  %Arg_6.751 = load float, ptr %Arg_6.750, align 4, !invariant.load !81
  br label %concatenate.23.merge45

concatenate.pivot.13.52:                          ; preds = %concatenate.8.merge25
  %186 = icmp ult i32 %163, 13
  br i1 %186, label %concatenate.pivot.0.53, label %concatenate.pivot.13.54

concatenate.pivot.0.53:                           ; preds = %concatenate.pivot.13.52
  br label %concat_index_from_operand_id046

concatenate.pivot.13.54:                          ; preds = %concatenate.pivot.13.52
  br label %concat_index_from_operand_id149

concatenate.23.merge45:                           ; preds = %concat_index_from_operand_id149, %concat_index_from_operand_id046
  %187 = phi float [ %Arg_5.648, %concat_index_from_operand_id046 ], [ %Arg_6.751, %concat_index_from_operand_id149 ]
  %Arg_1.255 = load float, ptr %arg1, align 4, !invariant.load !81
  %multiply.2456 = fmul float %187, %Arg_1.255
  %Arg_4.557 = getelementptr inbounds float, ptr %arg4, i32 %72
  %Arg_4.558 = load float, ptr %Arg_4.557, align 4, !invariant.load !81
  %multiply.2559 = fmul float %multiply.2456, %Arg_4.558
  %region_0_35_constant_1260 = load float, ptr @7, align 4
  %Arg_4.561 = getelementptr inbounds float, ptr %arg4, i32 %72
  %Arg_4.562 = load float, ptr %Arg_4.561, align 4, !invariant.load !81
  %subtract.2663 = fsub float %region_0_35_constant_1260, %Arg_4.562
  %multiply.2764 = fmul float %multiply.2559, %subtract.2663
  %188 = mul nuw nsw i32 %74, 1
  %189 = add nuw nsw i32 0, %188
  %190 = udiv i32 %189, 30
  %191 = mul nuw nsw i32 %76, 1
  %192 = add nuw nsw i32 0, %191
  %193 = mul nuw nsw i32 %77, 128
  %194 = add nuw nsw i32 %192, %193
  %195 = udiv i32 %194, 8192
  %196 = getelementptr inbounds float, ptr %arg8, i32 %72
  store float %multiply.1544, ptr %196, align 4
  %197 = mul nuw nsw i32 %74, 1
  %198 = add nuw nsw i32 0, %197
  %199 = udiv i32 %198, 30
  %200 = mul nuw nsw i32 %76, 1
  %201 = add nuw nsw i32 0, %200
  %202 = mul nuw nsw i32 %77, 128
  %203 = add nuw nsw i32 %201, %202
  %204 = udiv i32 %203, 8192
  %205 = getelementptr inbounds float, ptr %arg10, i32 %72
  store float %multiply.2764, ptr %205, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %206 = mul i32 %thread_id.y, 1
  %207 = add i32 %tile_origin.1, %thread_id.x
  %208 = add i32 %tile_origin.2, %206
  %209 = add i32 %208, 0
  %210 = mul i32 %tile_origin.0, 30
  %211 = add i32 %210, %209
  %212 = udiv i32 %211, 1
  %213 = urem i32 %212, 30
  %214 = udiv i32 %211, 30
  %output_element_address = getelementptr inbounds [64 x [30 x float]], ptr %arg7, i32 0, i32 %214, i32 %213
  %output = load float, ptr %31, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true97:                    ; preds = %reduction_write_output-after
  %215 = mul i32 %thread_id.y, 1
  %216 = add i32 %tile_origin.1, %thread_id.x
  %217 = add i32 %tile_origin.2, %215
  %218 = add i32 %217, 0
  %219 = mul i32 %tile_origin.0, 30
  %220 = add i32 %219, %218
  %221 = udiv i32 %220, 1
  %222 = urem i32 %221, 30
  %223 = udiv i32 %220, 30
  %output_element_address99 = getelementptr inbounds [64 x [30 x float]], ptr %arg9, i32 0, i32 %223, i32 %222
  %output100 = load float, ptr %50, align 4
  store float %output100, ptr %output_element_address99, align 4
  br label %reduction_write_output-after98
}

define internal void @region_1_18(ptr dereferenceable(4) %Arg_0.19.typed, ptr dereferenceable(4) %Arg_1.20.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.21.typed = alloca float, align 4
  %Arg_0.19 = load float, ptr %Arg_0.19.typed, align 4
  %Arg_1.20 = load float, ptr %Arg_1.20.typed, align 4
  %add.21 = fadd float %Arg_0.19, %Arg_1.20
  store float %add.21, ptr %add.21.typed, align 4
  %load_ret_value = load float, ptr %add.21.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_29(ptr dereferenceable(4) %Arg_0.30.typed, ptr dereferenceable(4) %Arg_1.31.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.32.typed = alloca float, align 4
  %Arg_0.30 = load float, ptr %Arg_0.30.typed, align 4
  %Arg_1.31 = load float, ptr %Arg_1.31.typed, align 4
  %add.32 = fadd float %Arg_0.30, %Arg_1.31
  store float %add.32, ptr %add.32.typed, align 4
  %load_ret_value = load float, ptr %add.32.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_83(ptr noalias align 128 dereferenceable(7680) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(7680) %arg2, ptr noalias align 128 dereferenceable(120) %arg3, ptr noalias align 128 dereferenceable(120) %arg4) {
entry:
  %return_buffer64 = alloca float, align 4
  %result_from_other_lane62 = alloca float, align 4
  %return_buffer61 = alloca float, align 4
  %result_from_other_lane59 = alloca float, align 4
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane50 = alloca float, align 4
  %return_buffer46 = alloca float, align 4
  %tile_loop.invar_address39 = alloca i32, align 4
  %y_in_tile.invar_address33 = alloca i32, align 4
  %partial_reduction_result19 = alloca float, align 4
  %reduction_input_address18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane9 = alloca float, align 4
  %return_buffer8 = alloca float, align 4
  %result_from_other_lane6 = alloca float, align 4
  %return_buffer5 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !82
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after66, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !81
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 1
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %9, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 1
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 64, i32 4096
  %18 = icmp eq i32 %13, 0
  %tile_bound1 = select i1 %18, i32 30, i32 32
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 4096
  %tile_origin.2 = mul i32 %13, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %22 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %22, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %23 = icmp eq i32 %tile_loop.indvar, 0
  %24 = mul i32 %tile_loop.indvar, 1
  %25 = add i32 %24, 0
  %x_loc = add i32 %25, %21
  %26 = add i32 %tile_origin.1, %y_in_tile.indvar
  %27 = add i32 %tile_origin.2, %x_loc
  %28 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %28, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !113

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !114

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %29 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %30 = load float, ptr %current_output, align 4
  store float %30, ptr %29, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %31 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result4 = load float, ptr %31, align 4
  %32 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  store float %32, ptr %result_from_other_lane, align 4
  call void @region_1_4__2(ptr %31, ptr %result_from_other_lane, ptr %return_buffer5)
  %33 = load float, ptr %return_buffer5, align 4
  store float %33, ptr %31, align 4
  %partial_reduction_result7 = load float, ptr %31, align 4
  %34 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result7, i32 8, i32 31)
  store float %34, ptr %result_from_other_lane6, align 4
  call void @region_1_4__2(ptr %31, ptr %result_from_other_lane6, ptr %return_buffer8)
  %35 = load float, ptr %return_buffer8, align 4
  store float %35, ptr %31, align 4
  %partial_reduction_result10 = load float, ptr %31, align 4
  %36 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 4, i32 31)
  store float %36, ptr %result_from_other_lane9, align 4
  call void @region_1_4__2(ptr %31, ptr %result_from_other_lane9, ptr %return_buffer11)
  %37 = load float, ptr %return_buffer11, align 4
  store float %37, ptr %31, align 4
  %partial_reduction_result13 = load float, ptr %31, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 2, i32 31)
  store float %38, ptr %result_from_other_lane12, align 4
  call void @region_1_4__2(ptr %31, ptr %result_from_other_lane12, ptr %return_buffer14)
  %39 = load float, ptr %return_buffer14, align 4
  store float %39, ptr %31, align 4
  %partial_reduction_result16 = load float, ptr %31, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 1, i32 31)
  store float %40, ptr %result_from_other_lane15, align 4
  call void @region_1_4__2(ptr %31, ptr %result_from_other_lane15, ptr %return_buffer17)
  %41 = load float, ptr %return_buffer17, align 4
  store float %41, ptr %31, align 4
  %42 = icmp ult i32 %thread_id.x, %tile_bound
  %43 = mul i32 %thread_id.y, 1
  %44 = icmp ult i32 %43, %tile_bound1
  %45 = and i1 %44, %42
  %46 = icmp eq i32 %lane_id, 0
  %47 = and i1 %45, %46
  br i1 %47, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %48 = mul i32 %thread_id.x, 1
  %49 = sub i32 %x_loc, %48
  %Arg_0.1 = getelementptr inbounds [64 x [30 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %50 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %49
  call void @region_1_4__2(ptr %50, ptr %reduction_input_address, ptr %return_buffer)
  %51 = load float, ptr %return_buffer, align 4
  store float %51, ptr %50, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %52 = mul i32 %thread_id.y, 1
  %53 = add i32 %tile_origin.1, %thread_id.x
  %54 = add i32 %tile_origin.2, %52
  %55 = add i32 %54, 0
  %56 = mul i32 %tile_origin.0, 30
  %57 = add i32 %56, %55
  %58 = udiv i32 %57, 1
  %output_element_address = getelementptr inbounds [30 x float], ptr %arg3, i32 0, i32 %58
  %output = load float, ptr %31, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.220 = load float, ptr %arg1, align 4, !invariant.load !81
  %59 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 0
  store float %Arg_1.220, ptr %59, align 4
  %60 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %61 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %62 = urem i32 %60, 1024
  %63 = udiv i32 %60, 1024
  %64 = mul i32 %61, 1
  %65 = add i32 %64, %63
  %66 = icmp ult i32 %65, 1
  br i1 %66, label %67, label %early_return21

67:                                               ; preds = %reduce-group-1-true
  %thread_id.x22 = urem i32 %62, 32
  %thread_id.y23 = udiv i32 %62, 32
  %lane_id24 = urem i32 %62, 32
  %68 = udiv i32 %65, 1
  %69 = urem i32 %68, 1
  %70 = udiv i32 %65, 1
  %71 = urem i32 %70, 1
  %72 = udiv i32 %65, 1
  %73 = icmp eq i32 %71, 0
  %tile_bound25 = select i1 %73, i32 64, i32 4096
  %74 = icmp eq i32 %69, 0
  %tile_bound26 = select i1 %74, i32 30, i32 32
  %tile_origin.027 = mul i32 %72, 1
  %tile_origin.128 = mul i32 %71, 4096
  %tile_origin.229 = mul i32 %69, 32
  store i32 %thread_id.y23, ptr %y_in_tile.invar_address33, align 4
  br label %y_in_tile.loop_header31

y_in_tile.loop_header31:                          ; preds = %tile_loop.loop_exit36, %67
  %y_in_tile.indvar34 = load i32, ptr %y_in_tile.invar_address33, align 4
  %75 = icmp uge i32 %y_in_tile.indvar34, %tile_bound25
  br i1 %75, label %y_in_tile.loop_exit30, label %y_in_tile.loop_body32

y_in_tile.loop_body32:                            ; preds = %y_in_tile.loop_header31
  %invar.inc35 = add nuw nsw i32 %y_in_tile.indvar34, 32
  store i32 %invar.inc35, ptr %y_in_tile.invar_address33, align 4
  %76 = icmp eq i32 %y_in_tile.indvar34, %thread_id.y23
  %77 = mul i32 %thread_id.x22, 1
  store i32 0, ptr %tile_loop.invar_address39, align 4
  br label %tile_loop.loop_header37

tile_loop.loop_header37:                          ; preds = %x_in_tile-after44, %y_in_tile.loop_body32
  %tile_loop.indvar40 = load i32, ptr %tile_loop.invar_address39, align 4
  %78 = icmp uge i32 %tile_loop.indvar40, 1
  br i1 %78, label %tile_loop.loop_exit36, label %tile_loop.loop_body38

tile_loop.loop_body38:                            ; preds = %tile_loop.loop_header37
  %invar.inc41 = add nuw nsw i32 %tile_loop.indvar40, 1
  store i32 %invar.inc41, ptr %tile_loop.invar_address39, align 4
  %79 = icmp eq i32 %tile_loop.indvar40, 0
  %80 = mul i32 %tile_loop.indvar40, 1
  %81 = add i32 %80, 0
  %x_loc42 = add i32 %81, %77
  %82 = add i32 %tile_origin.128, %y_in_tile.indvar34
  %83 = add i32 %tile_origin.229, %x_loc42
  %84 = icmp ult i32 %x_loc42, %tile_bound26
  br i1 %84, label %x_in_tile-true43, label %x_in_tile-after44

x_in_tile-after44:                                ; preds = %x_in_tile-true43, %tile_loop.loop_body38
  br label %tile_loop.loop_header37, !llvm.loop !115

tile_loop.loop_exit36:                            ; preds = %tile_loop.loop_header37
  br label %y_in_tile.loop_header31, !llvm.loop !116

y_in_tile.loop_exit30:                            ; preds = %y_in_tile.loop_header31
  %shmem_output_address47 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %63, i32 0, i32 %thread_id.x22, i32 %thread_id.y23
  %85 = addrspacecast ptr addrspace(3) %shmem_output_address47 to ptr
  %current_output48 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 0
  %86 = load float, ptr %current_output48, align 4
  store float %86, ptr %85, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr49 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %63, i32 0, i32 %thread_id.y23, i32 %thread_id.x22
  %87 = addrspacecast ptr addrspace(3) %shmem_transposed_addr49 to ptr
  %partial_reduction_result51 = load float, ptr %87, align 4
  %88 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  store float %88, ptr %result_from_other_lane50, align 4
  call void @region_2_9__2(ptr %87, ptr %result_from_other_lane50, ptr %return_buffer52)
  %89 = load float, ptr %return_buffer52, align 4
  store float %89, ptr %87, align 4
  %partial_reduction_result54 = load float, ptr %87, align 4
  %90 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 8, i32 31)
  store float %90, ptr %result_from_other_lane53, align 4
  call void @region_2_9__2(ptr %87, ptr %result_from_other_lane53, ptr %return_buffer55)
  %91 = load float, ptr %return_buffer55, align 4
  store float %91, ptr %87, align 4
  %partial_reduction_result57 = load float, ptr %87, align 4
  %92 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 4, i32 31)
  store float %92, ptr %result_from_other_lane56, align 4
  call void @region_2_9__2(ptr %87, ptr %result_from_other_lane56, ptr %return_buffer58)
  %93 = load float, ptr %return_buffer58, align 4
  store float %93, ptr %87, align 4
  %partial_reduction_result60 = load float, ptr %87, align 4
  %94 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result60, i32 2, i32 31)
  store float %94, ptr %result_from_other_lane59, align 4
  call void @region_2_9__2(ptr %87, ptr %result_from_other_lane59, ptr %return_buffer61)
  %95 = load float, ptr %return_buffer61, align 4
  store float %95, ptr %87, align 4
  %partial_reduction_result63 = load float, ptr %87, align 4
  %96 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result63, i32 1, i32 31)
  store float %96, ptr %result_from_other_lane62, align 4
  call void @region_2_9__2(ptr %87, ptr %result_from_other_lane62, ptr %return_buffer64)
  %97 = load float, ptr %return_buffer64, align 4
  store float %97, ptr %87, align 4
  %98 = icmp ult i32 %thread_id.x22, %tile_bound25
  %99 = mul i32 %thread_id.y23, 1
  %100 = icmp ult i32 %99, %tile_bound26
  %101 = and i1 %100, %98
  %102 = icmp eq i32 %lane_id24, 0
  %103 = and i1 %101, %102
  br i1 %103, label %reduction_write_output-true65, label %reduction_write_output-after66

reduction_write_output-after66:                   ; preds = %reduction_write_output-true65, %y_in_tile.loop_exit30
  br label %reduce-group-1-after

early_return21:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true43:                                 ; preds = %tile_loop.loop_body38
  %104 = mul i32 %thread_id.x22, 1
  %105 = sub i32 %x_loc42, %104
  %Arg_2.3 = getelementptr inbounds [64 x [30 x float]], ptr %arg2, i32 0, i32 %82, i32 %83
  %Arg_2.345 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  store float %Arg_2.345, ptr %reduction_input_address18, align 4
  %106 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 %105
  call void @region_2_9__2(ptr %106, ptr %reduction_input_address18, ptr %return_buffer46)
  %107 = load float, ptr %return_buffer46, align 4
  store float %107, ptr %106, align 4
  br label %x_in_tile-after44

reduction_write_output-true65:                    ; preds = %y_in_tile.loop_exit30
  %108 = mul i32 %thread_id.y23, 1
  %109 = add i32 %tile_origin.128, %thread_id.x22
  %110 = add i32 %tile_origin.229, %108
  %111 = add i32 %110, 0
  %112 = mul i32 %tile_origin.027, 30
  %113 = add i32 %112, %111
  %114 = udiv i32 %113, 1
  %output_element_address67 = getelementptr inbounds [30 x float], ptr %arg4, i32 0, i32 %114
  %output68 = load float, ptr %87, align 4
  store float %output68, ptr %output_element_address67, align 4
  br label %reduction_write_output-after66
}

define internal void @region_1_4__2(ptr dereferenceable(4) %Arg_0.5.typed, ptr dereferenceable(4) %Arg_1.6.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.7.typed = alloca float, align 4
  %Arg_0.5 = load float, ptr %Arg_0.5.typed, align 4
  %Arg_1.6 = load float, ptr %Arg_1.6.typed, align 4
  %add.7 = fadd float %Arg_0.5, %Arg_1.6
  store float %add.7, ptr %add.7.typed, align 4
  %load_ret_value = load float, ptr %add.7.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_9__2(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_53(ptr noalias align 16 dereferenceable(120) %arg0, ptr noalias align 128 dereferenceable(120) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(120) %arg3, ptr noalias align 128 dereferenceable(120) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !117
  %2 = mul nuw nsw i32 %0, 30
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 30
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 30
  br i1 %4, label %fusion_53.in_bounds-true, label %fusion_53.in_bounds-after

fusion_53.in_bounds-after:                        ; preds = %fusion_53.in_bounds-true, %entry
  ret void

fusion_53.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !81
  %7 = load float, ptr %arg2, align 4, !invariant.load !81
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.7 = fmul float %7, %9
  %subtract.8 = fsub float %6, %multiply.7
  %10 = insertvalue { float, float } undef, float %subtract.8, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !81
  %13 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %14 = load float, ptr %13, align 4
  %multiply.9 = fmul float %7, %14
  %subtract.10 = fsub float %12, %multiply.9
  %15 = insertvalue { float, float } %10, float %subtract.10, 1
  %16 = extractvalue { float, float } %15, 0
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %16, ptr %17, align 4
  %18 = extractvalue { float, float } %15, 1
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %18, ptr %19, align 4
  br label %fusion_53.in_bounds-after
}

define void @fusion_52(ptr noalias align 16 dereferenceable(61440) %arg0, ptr noalias align 128 dereferenceable(61440) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(61440) %arg3, ptr noalias align 128 dereferenceable(61440) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !118
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 15360
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 30
  %5 = udiv i32 %linear_index, 30
  %6 = icmp ult i32 %linear_index, 15360
  br i1 %6, label %fusion_52.in_bounds-true, label %fusion_52.in_bounds-after

fusion_52.in_bounds-after:                        ; preds = %fusion_52.in_bounds-true, %entry
  ret void

fusion_52.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !81
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.9 = fmul float %9, %16
  %subtract.10 = fsub float %14, %multiply.9
  %17 = insertvalue { float, float } %12, float %subtract.10, 1
  %18 = extractvalue { float, float } %17, 0
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %18, ptr %19, align 4
  %20 = extractvalue { float, float } %17, 1
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %20, ptr %21, align 4
  br label %fusion_52.in_bounds-after
}

define void @fusion_50(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 16 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(16777216) %arg3) {
entry:
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane50 = alloca float, align 4
  %return_buffer49 = alloca float, align 4
  %result_from_other_lane47 = alloca float, align 4
  %return_buffer46 = alloca float, align 4
  %result_from_other_lane44 = alloca float, align 4
  %return_buffer40 = alloca float, align 4
  %result_from_other_lane38 = alloca float, align 4
  %return_buffer37 = alloca float, align 4
  %result_from_other_lane35 = alloca float, align 4
  %return_buffer34 = alloca float, align 4
  %result_from_other_lane32 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !74
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after60, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_15_constant_8 = load float, ptr @10, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_15_constant_8, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_15_constant_8, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 512
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 8
  %14 = udiv i32 %9, 8
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 8
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 128, i32 4096
  %18 = icmp eq i32 %13, 7
  %tile_bound1 = select i1 %18, i32 64, i32 64
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 4096
  %tile_origin.2 = mul i32 %13, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after13, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %22 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %22, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %23 = icmp eq i32 %tile_loop.indvar, 0
  %24 = mul i32 %tile_loop.indvar, 2
  %25 = add i32 %24, 0
  %x_loc = add i32 %25, %21
  %26 = add i32 %tile_origin.1, %y_in_tile.indvar
  %27 = add i32 %tile_origin.2, %x_loc
  %28 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %28, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %29 = mul i32 %tile_loop.indvar, 2
  %30 = add i32 %29, 1
  %x_loc11 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc11
  %33 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %33, label %x_in_tile-true12, label %x_in_tile-after13

x_in_tile-after13:                                ; preds = %x_in_tile-true12, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !120

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !121

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result27 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane, ptr %return_buffer28)
  %38 = load float, ptr %return_buffer28, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result30 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane29, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane29, ptr %return_buffer31)
  %40 = load float, ptr %return_buffer31, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result33 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result33, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane32, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane32, ptr %return_buffer34)
  %42 = load float, ptr %return_buffer34, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result36 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result36, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane35, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane35, ptr %return_buffer37)
  %44 = load float, ptr %return_buffer37, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result39 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result39, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane38, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane38, ptr %return_buffer40)
  %46 = load float, ptr %return_buffer40, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address41 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address41 to ptr
  %current_output42 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output42, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr43 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr43 to ptr
  %partial_reduction_result45 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane44, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane44, ptr %return_buffer46)
  %57 = load float, ptr %return_buffer46, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result48 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result48, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane47, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane47, ptr %return_buffer49)
  %59 = load float, ptr %return_buffer49, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result51 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane50, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane50, ptr %return_buffer52)
  %61 = load float, ptr %return_buffer52, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result54 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane53, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane53, ptr %return_buffer55)
  %63 = load float, ptr %return_buffer55, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result57 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane56, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane56, ptr %return_buffer58)
  %65 = load float, ptr %return_buffer58, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true59, label %reduction_write_output-after60

reduction_write_output-after60:                   ; preds = %reduction_write_output-true59, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 512
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 65536
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 512
  %80 = udiv i32 %77, 512
  %81 = urem i32 %80, 128
  %82 = udiv i32 %77, 65536
  %83 = mul i32 %thread_id.x, 2
  %84 = sub i32 %x_loc, %83
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 512
  %88 = mul nuw nsw i32 %81, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 128
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 8192
  %Arg_1.2 = getelementptr inbounds [8192 x [512 x float]], ptr %arg1, i32 0, i32 %91, i32 %86
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !81
  %region_0_15_constant_3 = load float, ptr @9, align 4
  %compare.5 = fcmp ogt float %Arg_1.23, %region_0_15_constant_3
  %93 = zext i1 %compare.5 to i8
  %Arg_0.1 = getelementptr inbounds [8192 x [512 x float]], ptr %arg0, i32 0, i32 %91, i32 %86
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  %94 = trunc i8 %93 to i1
  %95 = select i1 %94, float %Arg_0.14, float %region_0_15_constant_3
  store float %95, ptr %reduction_input_address, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %84
  call void @region_1_9__1(ptr %96, ptr %reduction_input_address, ptr %return_buffer)
  %97 = load float, ptr %return_buffer, align 4
  store float %97, ptr %96, align 4
  %98 = mul nuw nsw i32 %79, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 512
  %101 = mul nuw nsw i32 %81, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %82, 128
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 8192
  %Arg_1.25 = getelementptr inbounds float, ptr %arg1, i32 %77
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !81
  %region_0_15_constant_37 = load float, ptr @9, align 4
  %compare.58 = fcmp ogt float %Arg_1.26, %region_0_15_constant_37
  %106 = zext i1 %compare.58 to i8
  %Arg_0.19 = getelementptr inbounds float, ptr %arg0, i32 %77
  %Arg_0.110 = load float, ptr %Arg_0.19, align 4, !invariant.load !81
  %107 = trunc i8 %106 to i1
  %108 = select i1 %107, float %Arg_0.110, float %region_0_15_constant_37
  %109 = mul nuw nsw i32 %79, 1
  %110 = add nuw nsw i32 0, %109
  %111 = udiv i32 %110, 512
  %112 = mul nuw nsw i32 %81, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %82, 128
  %115 = add nuw nsw i32 %113, %114
  %116 = udiv i32 %115, 8192
  %117 = getelementptr inbounds [8192 x [512 x float]], ptr %arg3, i32 0, i32 %115, i32 %110
  store float %108, ptr %117, align 4
  br label %x_in_tile-after

x_in_tile-true12:                                 ; preds = %x_in_tile-after
  %118 = mul nuw nsw i32 %32, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %31, 512
  %121 = add nuw nsw i32 %119, %120
  %122 = mul nuw nsw i32 %tile_origin.0, 65536
  %123 = add nuw nsw i32 %121, %122
  %124 = udiv i32 %123, 1
  %125 = urem i32 %124, 512
  %126 = udiv i32 %123, 512
  %127 = urem i32 %126, 128
  %128 = udiv i32 %123, 65536
  %129 = mul i32 %thread_id.x, 2
  %130 = sub i32 %x_loc11, %129
  %131 = mul nuw nsw i32 %125, 1
  %132 = add nuw nsw i32 0, %131
  %133 = udiv i32 %132, 512
  %134 = mul nuw nsw i32 %127, 1
  %135 = add nuw nsw i32 0, %134
  %136 = mul nuw nsw i32 %128, 128
  %137 = add nuw nsw i32 %135, %136
  %138 = udiv i32 %137, 8192
  %Arg_1.214 = getelementptr inbounds [8192 x [512 x float]], ptr %arg1, i32 0, i32 %137, i32 %132
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !81
  %region_0_15_constant_316 = load float, ptr @9, align 4
  %compare.517 = fcmp ogt float %Arg_1.215, %region_0_15_constant_316
  %139 = zext i1 %compare.517 to i8
  %Arg_0.118 = getelementptr inbounds [8192 x [512 x float]], ptr %arg0, i32 0, i32 %137, i32 %132
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !81
  %140 = trunc i8 %139 to i1
  %141 = select i1 %140, float %Arg_0.119, float %region_0_15_constant_316
  store float %141, ptr %reduction_input_address, align 4
  %142 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %130
  call void @region_1_9__1(ptr %142, ptr %reduction_input_address, ptr %return_buffer20)
  %143 = load float, ptr %return_buffer20, align 4
  store float %143, ptr %142, align 4
  %144 = mul nuw nsw i32 %125, 1
  %145 = add nuw nsw i32 0, %144
  %146 = udiv i32 %145, 512
  %147 = mul nuw nsw i32 %127, 1
  %148 = add nuw nsw i32 0, %147
  %149 = mul nuw nsw i32 %128, 128
  %150 = add nuw nsw i32 %148, %149
  %151 = udiv i32 %150, 8192
  %Arg_1.221 = getelementptr inbounds float, ptr %arg1, i32 %123
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !81
  %region_0_15_constant_323 = load float, ptr @9, align 4
  %compare.524 = fcmp ogt float %Arg_1.222, %region_0_15_constant_323
  %152 = zext i1 %compare.524 to i8
  %Arg_0.125 = getelementptr inbounds float, ptr %arg0, i32 %123
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !81
  %153 = trunc i8 %152 to i1
  %154 = select i1 %153, float %Arg_0.126, float %region_0_15_constant_323
  %155 = mul nuw nsw i32 %125, 1
  %156 = add nuw nsw i32 0, %155
  %157 = udiv i32 %156, 512
  %158 = mul nuw nsw i32 %127, 1
  %159 = add nuw nsw i32 0, %158
  %160 = mul nuw nsw i32 %128, 128
  %161 = add nuw nsw i32 %159, %160
  %162 = udiv i32 %161, 8192
  %163 = getelementptr inbounds [8192 x [512 x float]], ptr %arg3, i32 0, i32 %161, i32 %156
  store float %154, ptr %163, align 4
  br label %x_in_tile-after13

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %164 = mul i32 %thread_id.y, 2
  %165 = add i32 %tile_origin.1, %thread_id.x
  %166 = add i32 %tile_origin.2, %164
  %167 = add i32 %166, 0
  %168 = mul i32 %tile_origin.0, 512
  %169 = add i32 %168, %167
  %170 = udiv i32 %169, 1
  %171 = urem i32 %170, 512
  %172 = udiv i32 %169, 512
  %output_element_address = getelementptr inbounds [64 x [512 x float]], ptr %arg2, i32 0, i32 %172, i32 %171
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true59:                    ; preds = %reduction_write_output-after
  %173 = mul i32 %thread_id.y, 2
  %174 = add i32 %tile_origin.1, %thread_id.x
  %175 = add i32 %tile_origin.2, %173
  %176 = add i32 %175, 1
  %177 = mul i32 %tile_origin.0, 512
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %180 = urem i32 %179, 512
  %181 = udiv i32 %178, 512
  %output_element_address61 = getelementptr inbounds [64 x [512 x float]], ptr %arg2, i32 0, i32 %181, i32 %180
  %output62 = load float, ptr %55, align 4
  store float %output62, ptr %output_element_address61, align 4
  br label %reduction_write_output-after60
}

define internal void @region_1_9__1(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_85(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(2048) %arg4) {
entry:
  %return_buffer120 = alloca float, align 4
  %result_from_other_lane118 = alloca float, align 4
  %return_buffer117 = alloca float, align 4
  %result_from_other_lane115 = alloca float, align 4
  %return_buffer114 = alloca float, align 4
  %result_from_other_lane112 = alloca float, align 4
  %return_buffer111 = alloca float, align 4
  %result_from_other_lane109 = alloca float, align 4
  %return_buffer108 = alloca float, align 4
  %result_from_other_lane106 = alloca float, align 4
  %return_buffer98 = alloca float, align 4
  %result_from_other_lane96 = alloca float, align 4
  %return_buffer95 = alloca float, align 4
  %result_from_other_lane93 = alloca float, align 4
  %return_buffer92 = alloca float, align 4
  %result_from_other_lane90 = alloca float, align 4
  %return_buffer89 = alloca float, align 4
  %result_from_other_lane87 = alloca float, align 4
  %return_buffer86 = alloca float, align 4
  %result_from_other_lane84 = alloca float, align 4
  %return_buffer80 = alloca float, align 4
  %return_buffer74 = alloca float, align 4
  %tile_loop.invar_address67 = alloca i32, align 4
  %y_in_tile.invar_address61 = alloca i32, align 4
  %partial_reduction_result47 = alloca float, i32 2, align 4
  %reduction_input_address46 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer9 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !82
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after122, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !81
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %3, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %7 = urem i32 %5, 1024
  %8 = udiv i32 %5, 1024
  %9 = mul i32 %6, 1
  %10 = add i32 %9, %8
  %11 = icmp ult i32 %10, 8
  br i1 %11, label %12, label %early_return

12:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %7, 32
  %thread_id.y = udiv i32 %7, 32
  %lane_id = urem i32 %7, 32
  %13 = udiv i32 %10, 1
  %14 = urem i32 %13, 8
  %15 = udiv i32 %10, 8
  %16 = urem i32 %15, 1
  %17 = udiv i32 %10, 8
  %18 = icmp eq i32 %16, 0
  %tile_bound = select i1 %18, i32 64, i32 4096
  %19 = icmp eq i32 %14, 7
  %tile_bound1 = select i1 %19, i32 64, i32 64
  %tile_origin.0 = mul i32 %17, 1
  %tile_origin.1 = mul i32 %16, 4096
  %tile_origin.2 = mul i32 %14, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %12
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %20 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %20, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %21 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %22 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %23 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %23, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %24 = icmp eq i32 %tile_loop.indvar, 0
  %25 = mul i32 %tile_loop.indvar, 2
  %26 = add i32 %25, 0
  %x_loc = add i32 %26, %22
  %27 = add i32 %tile_origin.1, %y_in_tile.indvar
  %28 = add i32 %tile_origin.2, %x_loc
  %29 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %29, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %30 = mul i32 %tile_loop.indvar, 2
  %31 = add i32 %30, 1
  %x_loc4 = add i32 %31, %22
  %32 = add i32 %tile_origin.1, %y_in_tile.indvar
  %33 = add i32 %tile_origin.2, %x_loc4
  %34 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %34, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !122

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !123

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %35 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %36 = load float, ptr %current_output, align 4
  store float %36, ptr %35, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %37 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %37, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %38, ptr %result_from_other_lane, align 4
  call void @region_1_4__3(ptr %37, ptr %result_from_other_lane, ptr %return_buffer11)
  %39 = load float, ptr %return_buffer11, align 4
  store float %39, ptr %37, align 4
  %partial_reduction_result13 = load float, ptr %37, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %40, ptr %result_from_other_lane12, align 4
  call void @region_1_4__3(ptr %37, ptr %result_from_other_lane12, ptr %return_buffer14)
  %41 = load float, ptr %return_buffer14, align 4
  store float %41, ptr %37, align 4
  %partial_reduction_result16 = load float, ptr %37, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %42, ptr %result_from_other_lane15, align 4
  call void @region_1_4__3(ptr %37, ptr %result_from_other_lane15, ptr %return_buffer17)
  %43 = load float, ptr %return_buffer17, align 4
  store float %43, ptr %37, align 4
  %partial_reduction_result19 = load float, ptr %37, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %44, ptr %result_from_other_lane18, align 4
  call void @region_1_4__3(ptr %37, ptr %result_from_other_lane18, ptr %return_buffer20)
  %45 = load float, ptr %return_buffer20, align 4
  store float %45, ptr %37, align 4
  %partial_reduction_result22 = load float, ptr %37, align 4
  %46 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %46, ptr %result_from_other_lane21, align 4
  call void @region_1_4__3(ptr %37, ptr %result_from_other_lane21, ptr %return_buffer23)
  %47 = load float, ptr %return_buffer23, align 4
  store float %47, ptr %37, align 4
  %48 = icmp ult i32 %thread_id.x, %tile_bound
  %49 = mul i32 %thread_id.y, 2
  %50 = icmp ult i32 %49, %tile_bound1
  %51 = and i1 %50, %48
  %52 = icmp eq i32 %lane_id, 0
  %53 = and i1 %51, %52
  br i1 %53, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i32 0, i32 %8, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %54 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %55 = load float, ptr %current_output25, align 4
  store float %55, ptr %54, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i32 0, i32 %8, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %56 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %56, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %57, ptr %result_from_other_lane27, align 4
  call void @region_1_4__3(ptr %56, ptr %result_from_other_lane27, ptr %return_buffer29)
  %58 = load float, ptr %return_buffer29, align 4
  store float %58, ptr %56, align 4
  %partial_reduction_result31 = load float, ptr %56, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %59, ptr %result_from_other_lane30, align 4
  call void @region_1_4__3(ptr %56, ptr %result_from_other_lane30, ptr %return_buffer32)
  %60 = load float, ptr %return_buffer32, align 4
  store float %60, ptr %56, align 4
  %partial_reduction_result34 = load float, ptr %56, align 4
  %61 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %61, ptr %result_from_other_lane33, align 4
  call void @region_1_4__3(ptr %56, ptr %result_from_other_lane33, ptr %return_buffer35)
  %62 = load float, ptr %return_buffer35, align 4
  store float %62, ptr %56, align 4
  %partial_reduction_result37 = load float, ptr %56, align 4
  %63 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %63, ptr %result_from_other_lane36, align 4
  call void @region_1_4__3(ptr %56, ptr %result_from_other_lane36, ptr %return_buffer38)
  %64 = load float, ptr %return_buffer38, align 4
  store float %64, ptr %56, align 4
  %partial_reduction_result40 = load float, ptr %56, align 4
  %65 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %65, ptr %result_from_other_lane39, align 4
  call void @region_1_4__3(ptr %56, ptr %result_from_other_lane39, ptr %return_buffer41)
  %66 = load float, ptr %return_buffer41, align 4
  store float %66, ptr %56, align 4
  %67 = icmp ult i32 %thread_id.x, %tile_bound
  %68 = mul i32 %thread_id.y, 2
  %69 = icmp ult i32 %68, %tile_bound1
  %70 = and i1 %69, %67
  %71 = icmp eq i32 %lane_id, 0
  %72 = and i1 %70, %71
  br i1 %72, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %73 = mul i32 %thread_id.x, 2
  %74 = sub i32 %x_loc, %73
  %Arg_0.1 = getelementptr inbounds [64 x [512 x float]], ptr %arg0, i32 0, i32 %27, i32 %28
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %74
  call void @region_1_4__3(ptr %75, ptr %reduction_input_address, ptr %return_buffer)
  %76 = load float, ptr %return_buffer, align 4
  store float %76, ptr %75, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %77 = mul i32 %thread_id.x, 2
  %78 = sub i32 %x_loc4, %77
  %Arg_0.17 = getelementptr inbounds [64 x [512 x float]], ptr %arg0, i32 0, i32 %32, i32 %33
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !81
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %79 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %78
  call void @region_1_4__3(ptr %79, ptr %reduction_input_address, ptr %return_buffer9)
  %80 = load float, ptr %return_buffer9, align 4
  store float %80, ptr %79, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %81 = mul i32 %thread_id.y, 2
  %82 = add i32 %tile_origin.1, %thread_id.x
  %83 = add i32 %tile_origin.2, %81
  %84 = add i32 %83, 0
  %85 = mul i32 %tile_origin.0, 512
  %86 = add i32 %85, %84
  %87 = udiv i32 %86, 1
  %output_element_address = getelementptr inbounds [512 x float], ptr %arg3, i32 0, i32 %87
  %output = load float, ptr %37, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %88 = mul i32 %thread_id.y, 2
  %89 = add i32 %tile_origin.1, %thread_id.x
  %90 = add i32 %tile_origin.2, %88
  %91 = add i32 %90, 1
  %92 = mul i32 %tile_origin.0, 512
  %93 = add i32 %92, %91
  %94 = udiv i32 %93, 1
  %output_element_address44 = getelementptr inbounds [512 x float], ptr %arg3, i32 0, i32 %94
  %output45 = load float, ptr %56, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.248 = load float, ptr %arg1, align 4, !invariant.load !81
  %95 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  store float %Arg_1.248, ptr %95, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  store float %Arg_1.248, ptr %96, align 4
  %97 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %98 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %99 = urem i32 %97, 1024
  %100 = udiv i32 %97, 1024
  %101 = mul i32 %98, 1
  %102 = add i32 %101, %100
  %103 = icmp ult i32 %102, 8
  br i1 %103, label %104, label %early_return49

104:                                              ; preds = %reduce-group-1-true
  %thread_id.x50 = urem i32 %99, 32
  %thread_id.y51 = udiv i32 %99, 32
  %lane_id52 = urem i32 %99, 32
  %105 = udiv i32 %102, 1
  %106 = urem i32 %105, 8
  %107 = udiv i32 %102, 8
  %108 = urem i32 %107, 1
  %109 = udiv i32 %102, 8
  %110 = icmp eq i32 %108, 0
  %tile_bound53 = select i1 %110, i32 64, i32 4096
  %111 = icmp eq i32 %106, 7
  %tile_bound54 = select i1 %111, i32 64, i32 64
  %tile_origin.055 = mul i32 %109, 1
  %tile_origin.156 = mul i32 %108, 4096
  %tile_origin.257 = mul i32 %106, 64
  store i32 %thread_id.y51, ptr %y_in_tile.invar_address61, align 4
  br label %y_in_tile.loop_header59

y_in_tile.loop_header59:                          ; preds = %tile_loop.loop_exit64, %104
  %y_in_tile.indvar62 = load i32, ptr %y_in_tile.invar_address61, align 4
  %112 = icmp uge i32 %y_in_tile.indvar62, %tile_bound53
  br i1 %112, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_body60:                            ; preds = %y_in_tile.loop_header59
  %invar.inc63 = add nuw nsw i32 %y_in_tile.indvar62, 32
  store i32 %invar.inc63, ptr %y_in_tile.invar_address61, align 4
  %113 = icmp eq i32 %y_in_tile.indvar62, %thread_id.y51
  %114 = mul i32 %thread_id.x50, 2
  store i32 0, ptr %tile_loop.invar_address67, align 4
  br label %tile_loop.loop_header65

tile_loop.loop_header65:                          ; preds = %x_in_tile-after77, %y_in_tile.loop_body60
  %tile_loop.indvar68 = load i32, ptr %tile_loop.invar_address67, align 4
  %115 = icmp uge i32 %tile_loop.indvar68, 1
  br i1 %115, label %tile_loop.loop_exit64, label %tile_loop.loop_body66

tile_loop.loop_body66:                            ; preds = %tile_loop.loop_header65
  %invar.inc69 = add nuw nsw i32 %tile_loop.indvar68, 1
  store i32 %invar.inc69, ptr %tile_loop.invar_address67, align 4
  %116 = icmp eq i32 %tile_loop.indvar68, 0
  %117 = mul i32 %tile_loop.indvar68, 2
  %118 = add i32 %117, 0
  %x_loc70 = add i32 %118, %114
  %119 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %120 = add i32 %tile_origin.257, %x_loc70
  %121 = icmp ult i32 %x_loc70, %tile_bound54
  br i1 %121, label %x_in_tile-true71, label %x_in_tile-after72

x_in_tile-after72:                                ; preds = %x_in_tile-true71, %tile_loop.loop_body66
  %122 = mul i32 %tile_loop.indvar68, 2
  %123 = add i32 %122, 1
  %x_loc75 = add i32 %123, %114
  %124 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %125 = add i32 %tile_origin.257, %x_loc75
  %126 = icmp ult i32 %x_loc75, %tile_bound54
  br i1 %126, label %x_in_tile-true76, label %x_in_tile-after77

x_in_tile-after77:                                ; preds = %x_in_tile-true76, %x_in_tile-after72
  br label %tile_loop.loop_header65, !llvm.loop !124

tile_loop.loop_exit64:                            ; preds = %tile_loop.loop_header65
  br label %y_in_tile.loop_header59, !llvm.loop !125

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_header59
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i32 0, i32 %100, i32 0, i32 %thread_id.x50, i32 %thread_id.y51
  %127 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  %128 = load float, ptr %current_output82, align 4
  store float %128, ptr %127, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i32 0, i32 %100, i32 0, i32 %thread_id.y51, i32 %thread_id.x50
  %129 = addrspacecast ptr addrspace(3) %shmem_transposed_addr83 to ptr
  %partial_reduction_result85 = load float, ptr %129, align 4
  %130 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  store float %130, ptr %result_from_other_lane84, align 4
  call void @region_2_9__3(ptr %129, ptr %result_from_other_lane84, ptr %return_buffer86)
  %131 = load float, ptr %return_buffer86, align 4
  store float %131, ptr %129, align 4
  %partial_reduction_result88 = load float, ptr %129, align 4
  %132 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 8, i32 31)
  store float %132, ptr %result_from_other_lane87, align 4
  call void @region_2_9__3(ptr %129, ptr %result_from_other_lane87, ptr %return_buffer89)
  %133 = load float, ptr %return_buffer89, align 4
  store float %133, ptr %129, align 4
  %partial_reduction_result91 = load float, ptr %129, align 4
  %134 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result91, i32 4, i32 31)
  store float %134, ptr %result_from_other_lane90, align 4
  call void @region_2_9__3(ptr %129, ptr %result_from_other_lane90, ptr %return_buffer92)
  %135 = load float, ptr %return_buffer92, align 4
  store float %135, ptr %129, align 4
  %partial_reduction_result94 = load float, ptr %129, align 4
  %136 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result94, i32 2, i32 31)
  store float %136, ptr %result_from_other_lane93, align 4
  call void @region_2_9__3(ptr %129, ptr %result_from_other_lane93, ptr %return_buffer95)
  %137 = load float, ptr %return_buffer95, align 4
  store float %137, ptr %129, align 4
  %partial_reduction_result97 = load float, ptr %129, align 4
  %138 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result97, i32 1, i32 31)
  store float %138, ptr %result_from_other_lane96, align 4
  call void @region_2_9__3(ptr %129, ptr %result_from_other_lane96, ptr %return_buffer98)
  %139 = load float, ptr %return_buffer98, align 4
  store float %139, ptr %129, align 4
  %140 = icmp ult i32 %thread_id.x50, %tile_bound53
  %141 = mul i32 %thread_id.y51, 2
  %142 = icmp ult i32 %141, %tile_bound54
  %143 = and i1 %142, %140
  %144 = icmp eq i32 %lane_id52, 0
  %145 = and i1 %143, %144
  br i1 %145, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %y_in_tile.loop_exit58
  %shmem_output_address103 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i32 0, i32 %100, i32 1, i32 %thread_id.x50, i32 %thread_id.y51
  %146 = addrspacecast ptr addrspace(3) %shmem_output_address103 to ptr
  %current_output104 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  %147 = load float, ptr %current_output104, align 4
  store float %147, ptr %146, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i32 0, i32 %100, i32 1, i32 %thread_id.y51, i32 %thread_id.x50
  %148 = addrspacecast ptr addrspace(3) %shmem_transposed_addr105 to ptr
  %partial_reduction_result107 = load float, ptr %148, align 4
  %149 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  store float %149, ptr %result_from_other_lane106, align 4
  call void @region_2_9__3(ptr %148, ptr %result_from_other_lane106, ptr %return_buffer108)
  %150 = load float, ptr %return_buffer108, align 4
  store float %150, ptr %148, align 4
  %partial_reduction_result110 = load float, ptr %148, align 4
  %151 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result110, i32 8, i32 31)
  store float %151, ptr %result_from_other_lane109, align 4
  call void @region_2_9__3(ptr %148, ptr %result_from_other_lane109, ptr %return_buffer111)
  %152 = load float, ptr %return_buffer111, align 4
  store float %152, ptr %148, align 4
  %partial_reduction_result113 = load float, ptr %148, align 4
  %153 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result113, i32 4, i32 31)
  store float %153, ptr %result_from_other_lane112, align 4
  call void @region_2_9__3(ptr %148, ptr %result_from_other_lane112, ptr %return_buffer114)
  %154 = load float, ptr %return_buffer114, align 4
  store float %154, ptr %148, align 4
  %partial_reduction_result116 = load float, ptr %148, align 4
  %155 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result116, i32 2, i32 31)
  store float %155, ptr %result_from_other_lane115, align 4
  call void @region_2_9__3(ptr %148, ptr %result_from_other_lane115, ptr %return_buffer117)
  %156 = load float, ptr %return_buffer117, align 4
  store float %156, ptr %148, align 4
  %partial_reduction_result119 = load float, ptr %148, align 4
  %157 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result119, i32 1, i32 31)
  store float %157, ptr %result_from_other_lane118, align 4
  call void @region_2_9__3(ptr %148, ptr %result_from_other_lane118, ptr %return_buffer120)
  %158 = load float, ptr %return_buffer120, align 4
  store float %158, ptr %148, align 4
  %159 = icmp ult i32 %thread_id.x50, %tile_bound53
  %160 = mul i32 %thread_id.y51, 2
  %161 = icmp ult i32 %160, %tile_bound54
  %162 = and i1 %161, %159
  %163 = icmp eq i32 %lane_id52, 0
  %164 = and i1 %162, %163
  br i1 %164, label %reduction_write_output-true121, label %reduction_write_output-after122

reduction_write_output-after122:                  ; preds = %reduction_write_output-true121, %reduction_write_output-after100
  br label %reduce-group-1-after

early_return49:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true71:                                 ; preds = %tile_loop.loop_body66
  %165 = mul i32 %thread_id.x50, 2
  %166 = sub i32 %x_loc70, %165
  %Arg_2.3 = getelementptr inbounds [64 x [512 x float]], ptr %arg2, i32 0, i32 %119, i32 %120
  %Arg_2.373 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  store float %Arg_2.373, ptr %reduction_input_address46, align 4
  %167 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %166
  call void @region_2_9__3(ptr %167, ptr %reduction_input_address46, ptr %return_buffer74)
  %168 = load float, ptr %return_buffer74, align 4
  store float %168, ptr %167, align 4
  br label %x_in_tile-after72

x_in_tile-true76:                                 ; preds = %x_in_tile-after72
  %169 = mul i32 %thread_id.x50, 2
  %170 = sub i32 %x_loc75, %169
  %Arg_2.378 = getelementptr inbounds [64 x [512 x float]], ptr %arg2, i32 0, i32 %124, i32 %125
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !81
  store float %Arg_2.379, ptr %reduction_input_address46, align 4
  %171 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %170
  call void @region_2_9__3(ptr %171, ptr %reduction_input_address46, ptr %return_buffer80)
  %172 = load float, ptr %return_buffer80, align 4
  store float %172, ptr %171, align 4
  br label %x_in_tile-after77

reduction_write_output-true99:                    ; preds = %y_in_tile.loop_exit58
  %173 = mul i32 %thread_id.y51, 2
  %174 = add i32 %tile_origin.156, %thread_id.x50
  %175 = add i32 %tile_origin.257, %173
  %176 = add i32 %175, 0
  %177 = mul i32 %tile_origin.055, 512
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %output_element_address101 = getelementptr inbounds [512 x float], ptr %arg4, i32 0, i32 %179
  %output102 = load float, ptr %129, align 4
  store float %output102, ptr %output_element_address101, align 4
  br label %reduction_write_output-after100

reduction_write_output-true121:                   ; preds = %reduction_write_output-after100
  %180 = mul i32 %thread_id.y51, 2
  %181 = add i32 %tile_origin.156, %thread_id.x50
  %182 = add i32 %tile_origin.257, %180
  %183 = add i32 %182, 1
  %184 = mul i32 %tile_origin.055, 512
  %185 = add i32 %184, %183
  %186 = udiv i32 %185, 1
  %output_element_address123 = getelementptr inbounds [512 x float], ptr %arg4, i32 0, i32 %186
  %output124 = load float, ptr %148, align 4
  store float %output124, ptr %output_element_address123, align 4
  br label %reduction_write_output-after122
}

define internal void @region_1_4__3(ptr dereferenceable(4) %Arg_0.5.typed, ptr dereferenceable(4) %Arg_1.6.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.7.typed = alloca float, align 4
  %Arg_0.5 = load float, ptr %Arg_0.5.typed, align 4
  %Arg_1.6 = load float, ptr %Arg_1.6.typed, align 4
  %add.7 = fadd float %Arg_0.5, %Arg_1.6
  store float %add.7, ptr %add.7.typed, align 4
  %load_ret_value = load float, ptr %add.7.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_9__3(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_49(ptr noalias align 16 dereferenceable(2048) %arg0, ptr noalias align 128 dereferenceable(2048) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 128 dereferenceable(2048) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 512
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 512
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 512
  br i1 %4, label %fusion_49.in_bounds-true, label %fusion_49.in_bounds-after

fusion_49.in_bounds-after:                        ; preds = %fusion_49.in_bounds-true, %entry
  ret void

fusion_49.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !81
  %7 = load float, ptr %arg2, align 4, !invariant.load !81
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.7 = fmul float %7, %9
  %subtract.8 = fsub float %6, %multiply.7
  %10 = insertvalue { float, float } undef, float %subtract.8, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !81
  %13 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %14 = load float, ptr %13, align 4
  %multiply.9 = fmul float %7, %14
  %subtract.10 = fsub float %12, %multiply.9
  %15 = insertvalue { float, float } %10, float %subtract.10, 1
  %16 = extractvalue { float, float } %15, 0
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %16, ptr %17, align 4
  %18 = extractvalue { float, float } %15, 1
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %18, ptr %19, align 4
  br label %fusion_49.in_bounds-after
}

define void @fusion_48(ptr noalias align 16 dereferenceable(2375680) %arg0, ptr noalias align 128 dereferenceable(2375680) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !126
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !127
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 148480
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index_base, 512
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 512
  %8 = udiv i32 %linear_index1, 512
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 512
  %11 = udiv i32 %linear_index2, 512
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 512
  %14 = udiv i32 %linear_index3, 512
  %15 = icmp ult i32 %linear_index_base, 593920
  br i1 %15, label %fusion_48.in_bounds-true, label %fusion_48.in_bounds-after

fusion_48.in_bounds-after:                        ; preds = %fusion_48.in_bounds-true, %entry
  ret void

fusion_48.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !81
  %18 = load float, ptr %arg2, align 4, !invariant.load !81
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4
  %multiply.5 = fmul float %18, %20
  %subtract.6 = fsub float %17, %multiply.5
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %subtract.6, ptr %21, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %23 = load float, ptr %22, align 4, !invariant.load !81
  %24 = load float, ptr %arg2, align 4, !invariant.load !81
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4
  %multiply.51 = fmul float %24, %26
  %subtract.62 = fsub float %23, %multiply.51
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %subtract.62, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4, !invariant.load !81
  %30 = load float, ptr %arg2, align 4, !invariant.load !81
  %31 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %32 = load float, ptr %31, align 4
  %multiply.53 = fmul float %30, %32
  %subtract.64 = fsub float %29, %multiply.53
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %subtract.64, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %35 = load float, ptr %34, align 4, !invariant.load !81
  %36 = load float, ptr %arg2, align 4, !invariant.load !81
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %multiply.55 = fmul float %36, %38
  %subtract.66 = fsub float %35, %multiply.55
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %subtract.66, ptr %39, align 4
  br label %fusion_48.in_bounds-after
}

define void @fusion_78(ptr noalias align 16 dereferenceable(425984) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 16 dereferenceable(31719424) %arg2, ptr noalias align 16 dereferenceable(425984) %arg3, ptr noalias align 16 dereferenceable(31719424) %arg4, ptr noalias align 16 dereferenceable(4194304) %arg5, ptr noalias align 16 dereferenceable(4) %arg6, ptr noalias align 16 dereferenceable(4194304) %arg7, ptr noalias align 128 dereferenceable(38010880) %arg8, ptr noalias align 128 dereferenceable(4194304) %arg9, ptr noalias align 128 dereferenceable(4194304) %arg10, ptr noalias align 128 dereferenceable(4194304) %arg11, ptr noalias align 128 dereferenceable(4194304) %arg12) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !75
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !127
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 262144
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 128
  %8 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 128
  %11 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 128
  %14 = udiv i32 %linear_index3, 128
  %15 = icmp ult i32 %linear_index_base, 1048576
  br i1 %15, label %fusion_78.in_bounds-true, label %fusion_78.in_bounds-after

fusion_78.in_bounds-after:                        ; preds = %fusion_78.in_bounds-true, %entry
  ret void

fusion_78.in_bounds-true:                         ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 704
  %18 = mul nuw nsw i32 %17, 1
  %19 = add nuw nsw i32 0, %18
  %20 = urem i32 %19, 64
  %21 = udiv i32 %19, 64
  %22 = udiv i32 %21, 13
  %23 = mul nuw nsw i32 %16, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 8192
  %26 = mul nuw nsw i32 %20, 1
  %27 = add nuw nsw i32 0, %26
  %28 = mul nuw nsw i32 %21, 64
  %29 = add nuw nsw i32 %27, %28
  %30 = udiv i32 %29, 832
  %31 = mul nuw nsw i32 %24, 1
  %32 = add nuw nsw i32 0, %31
  %33 = udiv i32 %32, 8192
  %34 = add i32 %32, 0
  %35 = add i32 %29, 0
  %36 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %34, i32 %35
  %37 = load float, ptr %36, align 4, !invariant.load !81
  %38 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %24, i32 %21, i32 0
  %39 = load float, ptr %38, align 4, !invariant.load !81
  %multiply.14 = fmul float %37, %39
  %40 = mul nuw nsw i32 %20, 1
  %41 = add nuw nsw i32 0, %40
  %42 = mul nuw nsw i32 %21, 64
  %43 = add nuw nsw i32 %41, %42
  %44 = udiv i32 %43, 832
  %45 = mul nuw nsw i32 %24, 1
  %46 = add nuw nsw i32 0, %45
  %47 = udiv i32 %46, 8192
  %48 = add i32 %46, 0
  %49 = add i32 %43, 0
  %50 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %48, i32 %49
  %51 = load float, ptr %50, align 4, !invariant.load !81
  %52 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %48, i32 %49
  %53 = load float, ptr %52, align 4, !invariant.load !81
  %add.15 = fadd float %51, %53
  %54 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %24, i32 %21, i32 0
  %55 = load float, ptr %54, align 4, !invariant.load !81
  %multiply.20 = fmul float %add.15, %55
  %add.21 = fadd float %multiply.14, %multiply.20
  %56 = insertvalue { float, float, float, float } undef, float %add.21, 0
  %57 = add i32 %5, 0
  %58 = add i32 %4, 576
  %59 = mul nuw nsw i32 %58, 1
  %60 = add nuw nsw i32 0, %59
  %61 = urem i32 %60, 64
  %62 = udiv i32 %60, 64
  %63 = udiv i32 %62, 13
  %64 = mul nuw nsw i32 %57, 1
  %65 = add nuw nsw i32 0, %64
  %66 = udiv i32 %65, 8192
  %67 = mul nuw nsw i32 %61, 1
  %68 = add nuw nsw i32 0, %67
  %69 = mul nuw nsw i32 %62, 64
  %70 = add nuw nsw i32 %68, %69
  %71 = udiv i32 %70, 832
  %72 = mul nuw nsw i32 %65, 1
  %73 = add nuw nsw i32 0, %72
  %74 = udiv i32 %73, 8192
  %75 = add i32 %73, 0
  %76 = add i32 %70, 0
  %77 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %75, i32 %76
  %78 = load float, ptr %77, align 4, !invariant.load !81
  %79 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %65, i32 %62, i32 0
  %80 = load float, ptr %79, align 4, !invariant.load !81
  %multiply.141 = fmul float %78, %80
  %81 = mul nuw nsw i32 %61, 1
  %82 = add nuw nsw i32 0, %81
  %83 = mul nuw nsw i32 %62, 64
  %84 = add nuw nsw i32 %82, %83
  %85 = udiv i32 %84, 832
  %86 = mul nuw nsw i32 %65, 1
  %87 = add nuw nsw i32 0, %86
  %88 = udiv i32 %87, 8192
  %89 = add i32 %87, 0
  %90 = add i32 %84, 0
  %91 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %89, i32 %90
  %92 = load float, ptr %91, align 4, !invariant.load !81
  %93 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %89, i32 %90
  %94 = load float, ptr %93, align 4, !invariant.load !81
  %add.152 = fadd float %92, %94
  %95 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %65, i32 %62, i32 0
  %96 = load float, ptr %95, align 4, !invariant.load !81
  %multiply.203 = fmul float %add.152, %96
  %add.214 = fadd float %multiply.141, %multiply.203
  %97 = insertvalue { float, float, float, float } %56, float %add.214, 1
  %98 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %99 = load float, ptr %98, align 4, !invariant.load !81
  %100 = load float, ptr %arg6, align 4, !invariant.load !81
  %101 = add i32 %5, 0
  %102 = add i32 %4, 448
  %103 = mul nuw nsw i32 %102, 1
  %104 = add nuw nsw i32 0, %103
  %105 = urem i32 %104, 64
  %106 = udiv i32 %104, 64
  %107 = udiv i32 %106, 13
  %108 = mul nuw nsw i32 %101, 1
  %109 = add nuw nsw i32 0, %108
  %110 = udiv i32 %109, 8192
  %111 = mul nuw nsw i32 %105, 1
  %112 = add nuw nsw i32 0, %111
  %113 = mul nuw nsw i32 %106, 64
  %114 = add nuw nsw i32 %112, %113
  %115 = udiv i32 %114, 832
  %116 = mul nuw nsw i32 %109, 1
  %117 = add nuw nsw i32 0, %116
  %118 = udiv i32 %117, 8192
  %119 = add i32 %117, 0
  %120 = add i32 %114, 0
  %121 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %119, i32 %120
  %122 = load float, ptr %121, align 4, !invariant.load !81
  %123 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %109, i32 %106, i32 0
  %124 = load float, ptr %123, align 4, !invariant.load !81
  %multiply.145 = fmul float %122, %124
  %125 = mul nuw nsw i32 %105, 1
  %126 = add nuw nsw i32 0, %125
  %127 = mul nuw nsw i32 %106, 64
  %128 = add nuw nsw i32 %126, %127
  %129 = udiv i32 %128, 832
  %130 = mul nuw nsw i32 %109, 1
  %131 = add nuw nsw i32 0, %130
  %132 = udiv i32 %131, 8192
  %133 = add i32 %131, 0
  %134 = add i32 %128, 0
  %135 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %133, i32 %134
  %136 = load float, ptr %135, align 4, !invariant.load !81
  %137 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %133, i32 %134
  %138 = load float, ptr %137, align 4, !invariant.load !81
  %add.156 = fadd float %136, %138
  %139 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %109, i32 %106, i32 0
  %140 = load float, ptr %139, align 4, !invariant.load !81
  %multiply.207 = fmul float %add.156, %140
  %add.218 = fadd float %multiply.145, %multiply.207
  %multiply.27 = fmul float %100, %add.218
  %subtract.28 = fsub float %99, %multiply.27
  %141 = insertvalue { float, float, float, float } %97, float %subtract.28, 2
  %142 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %143 = load float, ptr %142, align 4, !invariant.load !81
  %144 = add i32 %5, 0
  %145 = add i32 %4, 64
  %146 = getelementptr inbounds [8192 x [1160 x float]], ptr %arg8, i32 0, i32 %144, i32 %145
  %147 = load float, ptr %146, align 4, !invariant.load !81
  %multiply.30 = fmul float %100, %147
  %subtract.31 = fsub float %143, %multiply.30
  %148 = insertvalue { float, float, float, float } %141, float %subtract.31, 3
  %149 = extractvalue { float, float, float, float } %148, 0
  %150 = getelementptr inbounds float, ptr %arg9, i32 %linear_index_base
  store float %149, ptr %150, align 4
  %151 = extractvalue { float, float, float, float } %148, 1
  %152 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  store float %151, ptr %152, align 4
  %153 = extractvalue { float, float, float, float } %148, 2
  %154 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  store float %153, ptr %154, align 4
  %155 = extractvalue { float, float, float, float } %148, 3
  %156 = getelementptr inbounds float, ptr %arg12, i32 %linear_index_base
  store float %155, ptr %156, align 4
  %157 = add i32 %8, 0
  %158 = add i32 %7, 704
  %159 = mul nuw nsw i32 %158, 1
  %160 = add nuw nsw i32 0, %159
  %161 = urem i32 %160, 64
  %162 = udiv i32 %160, 64
  %163 = udiv i32 %162, 13
  %164 = mul nuw nsw i32 %157, 1
  %165 = add nuw nsw i32 0, %164
  %166 = udiv i32 %165, 8192
  %167 = mul nuw nsw i32 %161, 1
  %168 = add nuw nsw i32 0, %167
  %169 = mul nuw nsw i32 %162, 64
  %170 = add nuw nsw i32 %168, %169
  %171 = udiv i32 %170, 832
  %172 = mul nuw nsw i32 %165, 1
  %173 = add nuw nsw i32 0, %172
  %174 = udiv i32 %173, 8192
  %175 = add i32 %173, 0
  %176 = add i32 %170, 0
  %177 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %175, i32 %176
  %178 = load float, ptr %177, align 4, !invariant.load !81
  %179 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %165, i32 %162, i32 0
  %180 = load float, ptr %179, align 4, !invariant.load !81
  %multiply.149 = fmul float %178, %180
  %181 = mul nuw nsw i32 %161, 1
  %182 = add nuw nsw i32 0, %181
  %183 = mul nuw nsw i32 %162, 64
  %184 = add nuw nsw i32 %182, %183
  %185 = udiv i32 %184, 832
  %186 = mul nuw nsw i32 %165, 1
  %187 = add nuw nsw i32 0, %186
  %188 = udiv i32 %187, 8192
  %189 = add i32 %187, 0
  %190 = add i32 %184, 0
  %191 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %189, i32 %190
  %192 = load float, ptr %191, align 4, !invariant.load !81
  %193 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %189, i32 %190
  %194 = load float, ptr %193, align 4, !invariant.load !81
  %add.1510 = fadd float %192, %194
  %195 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %165, i32 %162, i32 0
  %196 = load float, ptr %195, align 4, !invariant.load !81
  %multiply.2011 = fmul float %add.1510, %196
  %add.2112 = fadd float %multiply.149, %multiply.2011
  %197 = insertvalue { float, float, float, float } undef, float %add.2112, 0
  %198 = add i32 %8, 0
  %199 = add i32 %7, 576
  %200 = mul nuw nsw i32 %199, 1
  %201 = add nuw nsw i32 0, %200
  %202 = urem i32 %201, 64
  %203 = udiv i32 %201, 64
  %204 = udiv i32 %203, 13
  %205 = mul nuw nsw i32 %198, 1
  %206 = add nuw nsw i32 0, %205
  %207 = udiv i32 %206, 8192
  %208 = mul nuw nsw i32 %202, 1
  %209 = add nuw nsw i32 0, %208
  %210 = mul nuw nsw i32 %203, 64
  %211 = add nuw nsw i32 %209, %210
  %212 = udiv i32 %211, 832
  %213 = mul nuw nsw i32 %206, 1
  %214 = add nuw nsw i32 0, %213
  %215 = udiv i32 %214, 8192
  %216 = add i32 %214, 0
  %217 = add i32 %211, 0
  %218 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %216, i32 %217
  %219 = load float, ptr %218, align 4, !invariant.load !81
  %220 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %206, i32 %203, i32 0
  %221 = load float, ptr %220, align 4, !invariant.load !81
  %multiply.1413 = fmul float %219, %221
  %222 = mul nuw nsw i32 %202, 1
  %223 = add nuw nsw i32 0, %222
  %224 = mul nuw nsw i32 %203, 64
  %225 = add nuw nsw i32 %223, %224
  %226 = udiv i32 %225, 832
  %227 = mul nuw nsw i32 %206, 1
  %228 = add nuw nsw i32 0, %227
  %229 = udiv i32 %228, 8192
  %230 = add i32 %228, 0
  %231 = add i32 %225, 0
  %232 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %230, i32 %231
  %233 = load float, ptr %232, align 4, !invariant.load !81
  %234 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %230, i32 %231
  %235 = load float, ptr %234, align 4, !invariant.load !81
  %add.1514 = fadd float %233, %235
  %236 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %206, i32 %203, i32 0
  %237 = load float, ptr %236, align 4, !invariant.load !81
  %multiply.2015 = fmul float %add.1514, %237
  %add.2116 = fadd float %multiply.1413, %multiply.2015
  %238 = insertvalue { float, float, float, float } %197, float %add.2116, 1
  %239 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %240 = load float, ptr %239, align 4, !invariant.load !81
  %241 = load float, ptr %arg6, align 4, !invariant.load !81
  %242 = add i32 %8, 0
  %243 = add i32 %7, 448
  %244 = mul nuw nsw i32 %243, 1
  %245 = add nuw nsw i32 0, %244
  %246 = urem i32 %245, 64
  %247 = udiv i32 %245, 64
  %248 = udiv i32 %247, 13
  %249 = mul nuw nsw i32 %242, 1
  %250 = add nuw nsw i32 0, %249
  %251 = udiv i32 %250, 8192
  %252 = mul nuw nsw i32 %246, 1
  %253 = add nuw nsw i32 0, %252
  %254 = mul nuw nsw i32 %247, 64
  %255 = add nuw nsw i32 %253, %254
  %256 = udiv i32 %255, 832
  %257 = mul nuw nsw i32 %250, 1
  %258 = add nuw nsw i32 0, %257
  %259 = udiv i32 %258, 8192
  %260 = add i32 %258, 0
  %261 = add i32 %255, 0
  %262 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %260, i32 %261
  %263 = load float, ptr %262, align 4, !invariant.load !81
  %264 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %250, i32 %247, i32 0
  %265 = load float, ptr %264, align 4, !invariant.load !81
  %multiply.1417 = fmul float %263, %265
  %266 = mul nuw nsw i32 %246, 1
  %267 = add nuw nsw i32 0, %266
  %268 = mul nuw nsw i32 %247, 64
  %269 = add nuw nsw i32 %267, %268
  %270 = udiv i32 %269, 832
  %271 = mul nuw nsw i32 %250, 1
  %272 = add nuw nsw i32 0, %271
  %273 = udiv i32 %272, 8192
  %274 = add i32 %272, 0
  %275 = add i32 %269, 0
  %276 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %274, i32 %275
  %277 = load float, ptr %276, align 4, !invariant.load !81
  %278 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %274, i32 %275
  %279 = load float, ptr %278, align 4, !invariant.load !81
  %add.1518 = fadd float %277, %279
  %280 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %250, i32 %247, i32 0
  %281 = load float, ptr %280, align 4, !invariant.load !81
  %multiply.2019 = fmul float %add.1518, %281
  %add.2120 = fadd float %multiply.1417, %multiply.2019
  %multiply.2721 = fmul float %241, %add.2120
  %subtract.2822 = fsub float %240, %multiply.2721
  %282 = insertvalue { float, float, float, float } %238, float %subtract.2822, 2
  %283 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %284 = load float, ptr %283, align 4, !invariant.load !81
  %285 = add i32 %8, 0
  %286 = add i32 %7, 64
  %287 = getelementptr inbounds [8192 x [1160 x float]], ptr %arg8, i32 0, i32 %285, i32 %286
  %288 = load float, ptr %287, align 4, !invariant.load !81
  %multiply.3023 = fmul float %241, %288
  %subtract.3124 = fsub float %284, %multiply.3023
  %289 = insertvalue { float, float, float, float } %282, float %subtract.3124, 3
  %290 = extractvalue { float, float, float, float } %289, 0
  %291 = getelementptr inbounds float, ptr %arg9, i32 %linear_index1
  store float %290, ptr %291, align 4
  %292 = extractvalue { float, float, float, float } %289, 1
  %293 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  store float %292, ptr %293, align 4
  %294 = extractvalue { float, float, float, float } %289, 2
  %295 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  store float %294, ptr %295, align 4
  %296 = extractvalue { float, float, float, float } %289, 3
  %297 = getelementptr inbounds float, ptr %arg12, i32 %linear_index1
  store float %296, ptr %297, align 4
  %298 = add i32 %11, 0
  %299 = add i32 %10, 704
  %300 = mul nuw nsw i32 %299, 1
  %301 = add nuw nsw i32 0, %300
  %302 = urem i32 %301, 64
  %303 = udiv i32 %301, 64
  %304 = udiv i32 %303, 13
  %305 = mul nuw nsw i32 %298, 1
  %306 = add nuw nsw i32 0, %305
  %307 = udiv i32 %306, 8192
  %308 = mul nuw nsw i32 %302, 1
  %309 = add nuw nsw i32 0, %308
  %310 = mul nuw nsw i32 %303, 64
  %311 = add nuw nsw i32 %309, %310
  %312 = udiv i32 %311, 832
  %313 = mul nuw nsw i32 %306, 1
  %314 = add nuw nsw i32 0, %313
  %315 = udiv i32 %314, 8192
  %316 = add i32 %314, 0
  %317 = add i32 %311, 0
  %318 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %316, i32 %317
  %319 = load float, ptr %318, align 4, !invariant.load !81
  %320 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %306, i32 %303, i32 0
  %321 = load float, ptr %320, align 4, !invariant.load !81
  %multiply.1425 = fmul float %319, %321
  %322 = mul nuw nsw i32 %302, 1
  %323 = add nuw nsw i32 0, %322
  %324 = mul nuw nsw i32 %303, 64
  %325 = add nuw nsw i32 %323, %324
  %326 = udiv i32 %325, 832
  %327 = mul nuw nsw i32 %306, 1
  %328 = add nuw nsw i32 0, %327
  %329 = udiv i32 %328, 8192
  %330 = add i32 %328, 0
  %331 = add i32 %325, 0
  %332 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %330, i32 %331
  %333 = load float, ptr %332, align 4, !invariant.load !81
  %334 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %330, i32 %331
  %335 = load float, ptr %334, align 4, !invariant.load !81
  %add.1526 = fadd float %333, %335
  %336 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %306, i32 %303, i32 0
  %337 = load float, ptr %336, align 4, !invariant.load !81
  %multiply.2027 = fmul float %add.1526, %337
  %add.2128 = fadd float %multiply.1425, %multiply.2027
  %338 = insertvalue { float, float, float, float } undef, float %add.2128, 0
  %339 = add i32 %11, 0
  %340 = add i32 %10, 576
  %341 = mul nuw nsw i32 %340, 1
  %342 = add nuw nsw i32 0, %341
  %343 = urem i32 %342, 64
  %344 = udiv i32 %342, 64
  %345 = udiv i32 %344, 13
  %346 = mul nuw nsw i32 %339, 1
  %347 = add nuw nsw i32 0, %346
  %348 = udiv i32 %347, 8192
  %349 = mul nuw nsw i32 %343, 1
  %350 = add nuw nsw i32 0, %349
  %351 = mul nuw nsw i32 %344, 64
  %352 = add nuw nsw i32 %350, %351
  %353 = udiv i32 %352, 832
  %354 = mul nuw nsw i32 %347, 1
  %355 = add nuw nsw i32 0, %354
  %356 = udiv i32 %355, 8192
  %357 = add i32 %355, 0
  %358 = add i32 %352, 0
  %359 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %357, i32 %358
  %360 = load float, ptr %359, align 4, !invariant.load !81
  %361 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %347, i32 %344, i32 0
  %362 = load float, ptr %361, align 4, !invariant.load !81
  %multiply.1429 = fmul float %360, %362
  %363 = mul nuw nsw i32 %343, 1
  %364 = add nuw nsw i32 0, %363
  %365 = mul nuw nsw i32 %344, 64
  %366 = add nuw nsw i32 %364, %365
  %367 = udiv i32 %366, 832
  %368 = mul nuw nsw i32 %347, 1
  %369 = add nuw nsw i32 0, %368
  %370 = udiv i32 %369, 8192
  %371 = add i32 %369, 0
  %372 = add i32 %366, 0
  %373 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %371, i32 %372
  %374 = load float, ptr %373, align 4, !invariant.load !81
  %375 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %371, i32 %372
  %376 = load float, ptr %375, align 4, !invariant.load !81
  %add.1530 = fadd float %374, %376
  %377 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %347, i32 %344, i32 0
  %378 = load float, ptr %377, align 4, !invariant.load !81
  %multiply.2031 = fmul float %add.1530, %378
  %add.2132 = fadd float %multiply.1429, %multiply.2031
  %379 = insertvalue { float, float, float, float } %338, float %add.2132, 1
  %380 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %381 = load float, ptr %380, align 4, !invariant.load !81
  %382 = load float, ptr %arg6, align 4, !invariant.load !81
  %383 = add i32 %11, 0
  %384 = add i32 %10, 448
  %385 = mul nuw nsw i32 %384, 1
  %386 = add nuw nsw i32 0, %385
  %387 = urem i32 %386, 64
  %388 = udiv i32 %386, 64
  %389 = udiv i32 %388, 13
  %390 = mul nuw nsw i32 %383, 1
  %391 = add nuw nsw i32 0, %390
  %392 = udiv i32 %391, 8192
  %393 = mul nuw nsw i32 %387, 1
  %394 = add nuw nsw i32 0, %393
  %395 = mul nuw nsw i32 %388, 64
  %396 = add nuw nsw i32 %394, %395
  %397 = udiv i32 %396, 832
  %398 = mul nuw nsw i32 %391, 1
  %399 = add nuw nsw i32 0, %398
  %400 = udiv i32 %399, 8192
  %401 = add i32 %399, 0
  %402 = add i32 %396, 0
  %403 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %401, i32 %402
  %404 = load float, ptr %403, align 4, !invariant.load !81
  %405 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %391, i32 %388, i32 0
  %406 = load float, ptr %405, align 4, !invariant.load !81
  %multiply.1433 = fmul float %404, %406
  %407 = mul nuw nsw i32 %387, 1
  %408 = add nuw nsw i32 0, %407
  %409 = mul nuw nsw i32 %388, 64
  %410 = add nuw nsw i32 %408, %409
  %411 = udiv i32 %410, 832
  %412 = mul nuw nsw i32 %391, 1
  %413 = add nuw nsw i32 0, %412
  %414 = udiv i32 %413, 8192
  %415 = add i32 %413, 0
  %416 = add i32 %410, 0
  %417 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %415, i32 %416
  %418 = load float, ptr %417, align 4, !invariant.load !81
  %419 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %415, i32 %416
  %420 = load float, ptr %419, align 4, !invariant.load !81
  %add.1534 = fadd float %418, %420
  %421 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %391, i32 %388, i32 0
  %422 = load float, ptr %421, align 4, !invariant.load !81
  %multiply.2035 = fmul float %add.1534, %422
  %add.2136 = fadd float %multiply.1433, %multiply.2035
  %multiply.2737 = fmul float %382, %add.2136
  %subtract.2838 = fsub float %381, %multiply.2737
  %423 = insertvalue { float, float, float, float } %379, float %subtract.2838, 2
  %424 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %425 = load float, ptr %424, align 4, !invariant.load !81
  %426 = add i32 %11, 0
  %427 = add i32 %10, 64
  %428 = getelementptr inbounds [8192 x [1160 x float]], ptr %arg8, i32 0, i32 %426, i32 %427
  %429 = load float, ptr %428, align 4, !invariant.load !81
  %multiply.3039 = fmul float %382, %429
  %subtract.3140 = fsub float %425, %multiply.3039
  %430 = insertvalue { float, float, float, float } %423, float %subtract.3140, 3
  %431 = extractvalue { float, float, float, float } %430, 0
  %432 = getelementptr inbounds float, ptr %arg9, i32 %linear_index2
  store float %431, ptr %432, align 4
  %433 = extractvalue { float, float, float, float } %430, 1
  %434 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  store float %433, ptr %434, align 4
  %435 = extractvalue { float, float, float, float } %430, 2
  %436 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  store float %435, ptr %436, align 4
  %437 = extractvalue { float, float, float, float } %430, 3
  %438 = getelementptr inbounds float, ptr %arg12, i32 %linear_index2
  store float %437, ptr %438, align 4
  %439 = add i32 %14, 0
  %440 = add i32 %13, 704
  %441 = mul nuw nsw i32 %440, 1
  %442 = add nuw nsw i32 0, %441
  %443 = urem i32 %442, 64
  %444 = udiv i32 %442, 64
  %445 = udiv i32 %444, 13
  %446 = mul nuw nsw i32 %439, 1
  %447 = add nuw nsw i32 0, %446
  %448 = udiv i32 %447, 8192
  %449 = mul nuw nsw i32 %443, 1
  %450 = add nuw nsw i32 0, %449
  %451 = mul nuw nsw i32 %444, 64
  %452 = add nuw nsw i32 %450, %451
  %453 = udiv i32 %452, 832
  %454 = mul nuw nsw i32 %447, 1
  %455 = add nuw nsw i32 0, %454
  %456 = udiv i32 %455, 8192
  %457 = add i32 %455, 0
  %458 = add i32 %452, 0
  %459 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %457, i32 %458
  %460 = load float, ptr %459, align 4, !invariant.load !81
  %461 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %447, i32 %444, i32 0
  %462 = load float, ptr %461, align 4, !invariant.load !81
  %multiply.1441 = fmul float %460, %462
  %463 = mul nuw nsw i32 %443, 1
  %464 = add nuw nsw i32 0, %463
  %465 = mul nuw nsw i32 %444, 64
  %466 = add nuw nsw i32 %464, %465
  %467 = udiv i32 %466, 832
  %468 = mul nuw nsw i32 %447, 1
  %469 = add nuw nsw i32 0, %468
  %470 = udiv i32 %469, 8192
  %471 = add i32 %469, 0
  %472 = add i32 %466, 0
  %473 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %471, i32 %472
  %474 = load float, ptr %473, align 4, !invariant.load !81
  %475 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %471, i32 %472
  %476 = load float, ptr %475, align 4, !invariant.load !81
  %add.1542 = fadd float %474, %476
  %477 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %447, i32 %444, i32 0
  %478 = load float, ptr %477, align 4, !invariant.load !81
  %multiply.2043 = fmul float %add.1542, %478
  %add.2144 = fadd float %multiply.1441, %multiply.2043
  %479 = insertvalue { float, float, float, float } undef, float %add.2144, 0
  %480 = add i32 %14, 0
  %481 = add i32 %13, 576
  %482 = mul nuw nsw i32 %481, 1
  %483 = add nuw nsw i32 0, %482
  %484 = urem i32 %483, 64
  %485 = udiv i32 %483, 64
  %486 = udiv i32 %485, 13
  %487 = mul nuw nsw i32 %480, 1
  %488 = add nuw nsw i32 0, %487
  %489 = udiv i32 %488, 8192
  %490 = mul nuw nsw i32 %484, 1
  %491 = add nuw nsw i32 0, %490
  %492 = mul nuw nsw i32 %485, 64
  %493 = add nuw nsw i32 %491, %492
  %494 = udiv i32 %493, 832
  %495 = mul nuw nsw i32 %488, 1
  %496 = add nuw nsw i32 0, %495
  %497 = udiv i32 %496, 8192
  %498 = add i32 %496, 0
  %499 = add i32 %493, 0
  %500 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %498, i32 %499
  %501 = load float, ptr %500, align 4, !invariant.load !81
  %502 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %488, i32 %485, i32 0
  %503 = load float, ptr %502, align 4, !invariant.load !81
  %multiply.1445 = fmul float %501, %503
  %504 = mul nuw nsw i32 %484, 1
  %505 = add nuw nsw i32 0, %504
  %506 = mul nuw nsw i32 %485, 64
  %507 = add nuw nsw i32 %505, %506
  %508 = udiv i32 %507, 832
  %509 = mul nuw nsw i32 %488, 1
  %510 = add nuw nsw i32 0, %509
  %511 = udiv i32 %510, 8192
  %512 = add i32 %510, 0
  %513 = add i32 %507, 0
  %514 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %512, i32 %513
  %515 = load float, ptr %514, align 4, !invariant.load !81
  %516 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %512, i32 %513
  %517 = load float, ptr %516, align 4, !invariant.load !81
  %add.1546 = fadd float %515, %517
  %518 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %488, i32 %485, i32 0
  %519 = load float, ptr %518, align 4, !invariant.load !81
  %multiply.2047 = fmul float %add.1546, %519
  %add.2148 = fadd float %multiply.1445, %multiply.2047
  %520 = insertvalue { float, float, float, float } %479, float %add.2148, 1
  %521 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %522 = load float, ptr %521, align 4, !invariant.load !81
  %523 = load float, ptr %arg6, align 4, !invariant.load !81
  %524 = add i32 %14, 0
  %525 = add i32 %13, 448
  %526 = mul nuw nsw i32 %525, 1
  %527 = add nuw nsw i32 0, %526
  %528 = urem i32 %527, 64
  %529 = udiv i32 %527, 64
  %530 = udiv i32 %529, 13
  %531 = mul nuw nsw i32 %524, 1
  %532 = add nuw nsw i32 0, %531
  %533 = udiv i32 %532, 8192
  %534 = mul nuw nsw i32 %528, 1
  %535 = add nuw nsw i32 0, %534
  %536 = mul nuw nsw i32 %529, 64
  %537 = add nuw nsw i32 %535, %536
  %538 = udiv i32 %537, 832
  %539 = mul nuw nsw i32 %532, 1
  %540 = add nuw nsw i32 0, %539
  %541 = udiv i32 %540, 8192
  %542 = add i32 %540, 0
  %543 = add i32 %537, 0
  %544 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %542, i32 %543
  %545 = load float, ptr %544, align 4, !invariant.load !81
  %546 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg3, i32 0, i32 %532, i32 %529, i32 0
  %547 = load float, ptr %546, align 4, !invariant.load !81
  %multiply.1449 = fmul float %545, %547
  %548 = mul nuw nsw i32 %528, 1
  %549 = add nuw nsw i32 0, %548
  %550 = mul nuw nsw i32 %529, 64
  %551 = add nuw nsw i32 %549, %550
  %552 = udiv i32 %551, 832
  %553 = mul nuw nsw i32 %532, 1
  %554 = add nuw nsw i32 0, %553
  %555 = udiv i32 %554, 8192
  %556 = add i32 %554, 0
  %557 = add i32 %551, 0
  %558 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %556, i32 %557
  %559 = load float, ptr %558, align 4, !invariant.load !81
  %560 = getelementptr inbounds [8192 x [968 x float]], ptr %arg2, i32 0, i32 %556, i32 %557
  %561 = load float, ptr %560, align 4, !invariant.load !81
  %add.1550 = fadd float %559, %561
  %562 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %532, i32 %529, i32 0
  %563 = load float, ptr %562, align 4, !invariant.load !81
  %multiply.2051 = fmul float %add.1550, %563
  %add.2152 = fadd float %multiply.1449, %multiply.2051
  %multiply.2753 = fmul float %523, %add.2152
  %subtract.2854 = fsub float %522, %multiply.2753
  %564 = insertvalue { float, float, float, float } %520, float %subtract.2854, 2
  %565 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %566 = load float, ptr %565, align 4, !invariant.load !81
  %567 = add i32 %14, 0
  %568 = add i32 %13, 64
  %569 = getelementptr inbounds [8192 x [1160 x float]], ptr %arg8, i32 0, i32 %567, i32 %568
  %570 = load float, ptr %569, align 4, !invariant.load !81
  %multiply.3055 = fmul float %523, %570
  %subtract.3156 = fsub float %566, %multiply.3055
  %571 = insertvalue { float, float, float, float } %564, float %subtract.3156, 3
  %572 = extractvalue { float, float, float, float } %571, 0
  %573 = getelementptr inbounds float, ptr %arg9, i32 %linear_index3
  store float %572, ptr %573, align 4
  %574 = extractvalue { float, float, float, float } %571, 1
  %575 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  store float %574, ptr %575, align 4
  %576 = extractvalue { float, float, float, float } %571, 2
  %577 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  store float %576, ptr %577, align 4
  %578 = extractvalue { float, float, float, float } %571, 3
  %579 = getelementptr inbounds float, ptr %arg12, i32 %linear_index3
  store float %578, ptr %579, align 4
  br label %fusion_78.in_bounds-after
}

define void @fusion_46(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 128 dereferenceable(38010880) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(2097152) %arg3, ptr noalias align 128 dereferenceable(2097152) %arg4, ptr noalias align 16 dereferenceable(2097152) %arg5, ptr noalias align 128 dereferenceable(2097152) %arg6, ptr noalias align 16 dereferenceable(2097152) %arg7, ptr noalias align 16 dereferenceable(557056) %arg8, ptr noalias align 16 dereferenceable(31719424) %arg9, ptr noalias align 16 dereferenceable(557056) %arg10, ptr noalias align 16 dereferenceable(31719424) %arg11, ptr noalias align 16 dereferenceable(31719424) %arg12, ptr noalias align 128 dereferenceable(2097152) %arg13, ptr noalias align 128 dereferenceable(2097152) %arg14) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !127
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 131072
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 64
  %8 = udiv i32 %linear_index1, 64
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 64
  %11 = udiv i32 %linear_index2, 64
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 64
  %14 = udiv i32 %linear_index3, 64
  %15 = icmp ult i32 %linear_index_base, 524288
  br i1 %15, label %fusion_46.in_bounds-true, label %fusion_46.in_bounds-after

fusion_46.in_bounds-after:                        ; preds = %fusion_46.in_bounds-true, %entry
  ret void

fusion_46.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !81
  %18 = load float, ptr %arg2, align 4, !invariant.load !81
  %19 = add i32 %5, 0
  %20 = add i32 %4, 0
  %21 = getelementptr inbounds [8192 x [1160 x float]], ptr %arg1, i32 0, i32 %19, i32 %20
  %22 = load float, ptr %21, align 4, !invariant.load !81
  %multiply.16 = fmul float %18, %22
  %subtract.17 = fsub float %17, %multiply.16
  %23 = insertvalue { float, float, float, float } undef, float %subtract.17, 0
  %24 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !81
  %26 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %27 = load float, ptr %26, align 4
  %multiply.18 = fmul float %18, %27
  %subtract.19 = fsub float %25, %multiply.18
  %28 = insertvalue { float, float, float, float } %23, float %subtract.19, 1
  %29 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %30 = load float, ptr %29, align 4, !invariant.load !81
  %31 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %32 = load float, ptr %31, align 4
  %multiply.20 = fmul float %18, %32
  %subtract.21 = fsub float %30, %multiply.20
  %33 = insertvalue { float, float, float, float } %28, float %subtract.21, 2
  %34 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %35 = load float, ptr %34, align 4, !invariant.load !81
  %36 = add i32 %5, 0
  %37 = add i32 %4, 48
  %38 = mul nuw nsw i32 %37, 1
  %39 = add nuw nsw i32 0, %38
  %40 = urem i32 %39, 8
  %41 = udiv i32 %39, 8
  %42 = udiv i32 %41, 17
  %43 = mul nuw nsw i32 %36, 1
  %44 = add nuw nsw i32 0, %43
  %45 = udiv i32 %44, 8192
  %46 = mul nuw nsw i32 %40, 1
  %47 = add nuw nsw i32 0, %46
  %48 = mul nuw nsw i32 %41, 8
  %49 = add nuw nsw i32 %47, %48
  %50 = udiv i32 %49, 136
  %51 = mul nuw nsw i32 %44, 1
  %52 = add nuw nsw i32 0, %51
  %53 = udiv i32 %52, 8192
  %54 = add i32 %52, 0
  %55 = add i32 %49, 832
  %56 = getelementptr inbounds [8192 x [968 x float]], ptr %arg11, i32 0, i32 %54, i32 %55
  %57 = load float, ptr %56, align 4, !invariant.load !81
  %58 = getelementptr inbounds [8192 x [968 x float]], ptr %arg12, i32 0, i32 %54, i32 %55
  %59 = load float, ptr %58, align 4, !invariant.load !81
  %add.22 = fadd float %57, %59
  %60 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg10, i32 0, i32 %44, i32 %41, i32 0
  %61 = load float, ptr %60, align 4, !invariant.load !81
  %multiply.27 = fmul float %add.22, %61
  %62 = mul nuw nsw i32 %40, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %41, 8
  %65 = add nuw nsw i32 %63, %64
  %66 = udiv i32 %65, 136
  %67 = mul nuw nsw i32 %44, 1
  %68 = add nuw nsw i32 0, %67
  %69 = udiv i32 %68, 8192
  %70 = add i32 %68, 0
  %71 = add i32 %65, 832
  %72 = getelementptr inbounds [8192 x [968 x float]], ptr %arg9, i32 0, i32 %70, i32 %71
  %73 = load float, ptr %72, align 4, !invariant.load !81
  %74 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg8, i32 0, i32 %44, i32 %41, i32 0
  %75 = load float, ptr %74, align 4, !invariant.load !81
  %multiply.32 = fmul float %73, %75
  %add.33 = fadd float %multiply.27, %multiply.32
  %multiply.36 = fmul float %18, %add.33
  %subtract.37 = fsub float %35, %multiply.36
  %76 = insertvalue { float, float, float, float } %33, float %subtract.37, 3
  %77 = extractvalue { float, float, float, float } %76, 0
  %78 = getelementptr inbounds float, ptr %arg13, i32 %linear_index_base
  store float %77, ptr %78, align 4
  %79 = extractvalue { float, float, float, float } %76, 1
  %80 = getelementptr inbounds float, ptr %arg14, i32 %linear_index_base
  store float %79, ptr %80, align 4
  %81 = extractvalue { float, float, float, float } %76, 2
  %82 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %81, ptr %82, align 4
  %83 = extractvalue { float, float, float, float } %76, 3
  %84 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %83, ptr %84, align 4
  %85 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %86 = load float, ptr %85, align 4, !invariant.load !81
  %87 = load float, ptr %arg2, align 4, !invariant.load !81
  %88 = add i32 %8, 0
  %89 = add i32 %7, 0
  %90 = getelementptr inbounds [8192 x [1160 x float]], ptr %arg1, i32 0, i32 %88, i32 %89
  %91 = load float, ptr %90, align 4, !invariant.load !81
  %multiply.161 = fmul float %87, %91
  %subtract.172 = fsub float %86, %multiply.161
  %92 = insertvalue { float, float, float, float } undef, float %subtract.172, 0
  %93 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %94 = load float, ptr %93, align 4, !invariant.load !81
  %95 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %96 = load float, ptr %95, align 4
  %multiply.183 = fmul float %87, %96
  %subtract.194 = fsub float %94, %multiply.183
  %97 = insertvalue { float, float, float, float } %92, float %subtract.194, 1
  %98 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %99 = load float, ptr %98, align 4, !invariant.load !81
  %100 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %101 = load float, ptr %100, align 4
  %multiply.205 = fmul float %87, %101
  %subtract.216 = fsub float %99, %multiply.205
  %102 = insertvalue { float, float, float, float } %97, float %subtract.216, 2
  %103 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %104 = load float, ptr %103, align 4, !invariant.load !81
  %105 = add i32 %8, 0
  %106 = add i32 %7, 48
  %107 = mul nuw nsw i32 %106, 1
  %108 = add nuw nsw i32 0, %107
  %109 = urem i32 %108, 8
  %110 = udiv i32 %108, 8
  %111 = udiv i32 %110, 17
  %112 = mul nuw nsw i32 %105, 1
  %113 = add nuw nsw i32 0, %112
  %114 = udiv i32 %113, 8192
  %115 = mul nuw nsw i32 %109, 1
  %116 = add nuw nsw i32 0, %115
  %117 = mul nuw nsw i32 %110, 8
  %118 = add nuw nsw i32 %116, %117
  %119 = udiv i32 %118, 136
  %120 = mul nuw nsw i32 %113, 1
  %121 = add nuw nsw i32 0, %120
  %122 = udiv i32 %121, 8192
  %123 = add i32 %121, 0
  %124 = add i32 %118, 832
  %125 = getelementptr inbounds [8192 x [968 x float]], ptr %arg11, i32 0, i32 %123, i32 %124
  %126 = load float, ptr %125, align 4, !invariant.load !81
  %127 = getelementptr inbounds [8192 x [968 x float]], ptr %arg12, i32 0, i32 %123, i32 %124
  %128 = load float, ptr %127, align 4, !invariant.load !81
  %add.227 = fadd float %126, %128
  %129 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg10, i32 0, i32 %113, i32 %110, i32 0
  %130 = load float, ptr %129, align 4, !invariant.load !81
  %multiply.278 = fmul float %add.227, %130
  %131 = mul nuw nsw i32 %109, 1
  %132 = add nuw nsw i32 0, %131
  %133 = mul nuw nsw i32 %110, 8
  %134 = add nuw nsw i32 %132, %133
  %135 = udiv i32 %134, 136
  %136 = mul nuw nsw i32 %113, 1
  %137 = add nuw nsw i32 0, %136
  %138 = udiv i32 %137, 8192
  %139 = add i32 %137, 0
  %140 = add i32 %134, 832
  %141 = getelementptr inbounds [8192 x [968 x float]], ptr %arg9, i32 0, i32 %139, i32 %140
  %142 = load float, ptr %141, align 4, !invariant.load !81
  %143 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg8, i32 0, i32 %113, i32 %110, i32 0
  %144 = load float, ptr %143, align 4, !invariant.load !81
  %multiply.329 = fmul float %142, %144
  %add.3310 = fadd float %multiply.278, %multiply.329
  %multiply.3611 = fmul float %87, %add.3310
  %subtract.3712 = fsub float %104, %multiply.3611
  %145 = insertvalue { float, float, float, float } %102, float %subtract.3712, 3
  %146 = extractvalue { float, float, float, float } %145, 0
  %147 = getelementptr inbounds float, ptr %arg13, i32 %linear_index1
  store float %146, ptr %147, align 4
  %148 = extractvalue { float, float, float, float } %145, 1
  %149 = getelementptr inbounds float, ptr %arg14, i32 %linear_index1
  store float %148, ptr %149, align 4
  %150 = extractvalue { float, float, float, float } %145, 2
  %151 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %150, ptr %151, align 4
  %152 = extractvalue { float, float, float, float } %145, 3
  %153 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %152, ptr %153, align 4
  %154 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %155 = load float, ptr %154, align 4, !invariant.load !81
  %156 = load float, ptr %arg2, align 4, !invariant.load !81
  %157 = add i32 %11, 0
  %158 = add i32 %10, 0
  %159 = getelementptr inbounds [8192 x [1160 x float]], ptr %arg1, i32 0, i32 %157, i32 %158
  %160 = load float, ptr %159, align 4, !invariant.load !81
  %multiply.1613 = fmul float %156, %160
  %subtract.1714 = fsub float %155, %multiply.1613
  %161 = insertvalue { float, float, float, float } undef, float %subtract.1714, 0
  %162 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %163 = load float, ptr %162, align 4, !invariant.load !81
  %164 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %165 = load float, ptr %164, align 4
  %multiply.1815 = fmul float %156, %165
  %subtract.1916 = fsub float %163, %multiply.1815
  %166 = insertvalue { float, float, float, float } %161, float %subtract.1916, 1
  %167 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %168 = load float, ptr %167, align 4, !invariant.load !81
  %169 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %170 = load float, ptr %169, align 4
  %multiply.2017 = fmul float %156, %170
  %subtract.2118 = fsub float %168, %multiply.2017
  %171 = insertvalue { float, float, float, float } %166, float %subtract.2118, 2
  %172 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %173 = load float, ptr %172, align 4, !invariant.load !81
  %174 = add i32 %11, 0
  %175 = add i32 %10, 48
  %176 = mul nuw nsw i32 %175, 1
  %177 = add nuw nsw i32 0, %176
  %178 = urem i32 %177, 8
  %179 = udiv i32 %177, 8
  %180 = udiv i32 %179, 17
  %181 = mul nuw nsw i32 %174, 1
  %182 = add nuw nsw i32 0, %181
  %183 = udiv i32 %182, 8192
  %184 = mul nuw nsw i32 %178, 1
  %185 = add nuw nsw i32 0, %184
  %186 = mul nuw nsw i32 %179, 8
  %187 = add nuw nsw i32 %185, %186
  %188 = udiv i32 %187, 136
  %189 = mul nuw nsw i32 %182, 1
  %190 = add nuw nsw i32 0, %189
  %191 = udiv i32 %190, 8192
  %192 = add i32 %190, 0
  %193 = add i32 %187, 832
  %194 = getelementptr inbounds [8192 x [968 x float]], ptr %arg11, i32 0, i32 %192, i32 %193
  %195 = load float, ptr %194, align 4, !invariant.load !81
  %196 = getelementptr inbounds [8192 x [968 x float]], ptr %arg12, i32 0, i32 %192, i32 %193
  %197 = load float, ptr %196, align 4, !invariant.load !81
  %add.2219 = fadd float %195, %197
  %198 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg10, i32 0, i32 %182, i32 %179, i32 0
  %199 = load float, ptr %198, align 4, !invariant.load !81
  %multiply.2720 = fmul float %add.2219, %199
  %200 = mul nuw nsw i32 %178, 1
  %201 = add nuw nsw i32 0, %200
  %202 = mul nuw nsw i32 %179, 8
  %203 = add nuw nsw i32 %201, %202
  %204 = udiv i32 %203, 136
  %205 = mul nuw nsw i32 %182, 1
  %206 = add nuw nsw i32 0, %205
  %207 = udiv i32 %206, 8192
  %208 = add i32 %206, 0
  %209 = add i32 %203, 832
  %210 = getelementptr inbounds [8192 x [968 x float]], ptr %arg9, i32 0, i32 %208, i32 %209
  %211 = load float, ptr %210, align 4, !invariant.load !81
  %212 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg8, i32 0, i32 %182, i32 %179, i32 0
  %213 = load float, ptr %212, align 4, !invariant.load !81
  %multiply.3221 = fmul float %211, %213
  %add.3322 = fadd float %multiply.2720, %multiply.3221
  %multiply.3623 = fmul float %156, %add.3322
  %subtract.3724 = fsub float %173, %multiply.3623
  %214 = insertvalue { float, float, float, float } %171, float %subtract.3724, 3
  %215 = extractvalue { float, float, float, float } %214, 0
  %216 = getelementptr inbounds float, ptr %arg13, i32 %linear_index2
  store float %215, ptr %216, align 4
  %217 = extractvalue { float, float, float, float } %214, 1
  %218 = getelementptr inbounds float, ptr %arg14, i32 %linear_index2
  store float %217, ptr %218, align 4
  %219 = extractvalue { float, float, float, float } %214, 2
  %220 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %219, ptr %220, align 4
  %221 = extractvalue { float, float, float, float } %214, 3
  %222 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %221, ptr %222, align 4
  %223 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %224 = load float, ptr %223, align 4, !invariant.load !81
  %225 = load float, ptr %arg2, align 4, !invariant.load !81
  %226 = add i32 %14, 0
  %227 = add i32 %13, 0
  %228 = getelementptr inbounds [8192 x [1160 x float]], ptr %arg1, i32 0, i32 %226, i32 %227
  %229 = load float, ptr %228, align 4, !invariant.load !81
  %multiply.1625 = fmul float %225, %229
  %subtract.1726 = fsub float %224, %multiply.1625
  %230 = insertvalue { float, float, float, float } undef, float %subtract.1726, 0
  %231 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %232 = load float, ptr %231, align 4, !invariant.load !81
  %233 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %234 = load float, ptr %233, align 4
  %multiply.1827 = fmul float %225, %234
  %subtract.1928 = fsub float %232, %multiply.1827
  %235 = insertvalue { float, float, float, float } %230, float %subtract.1928, 1
  %236 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %237 = load float, ptr %236, align 4, !invariant.load !81
  %238 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %239 = load float, ptr %238, align 4
  %multiply.2029 = fmul float %225, %239
  %subtract.2130 = fsub float %237, %multiply.2029
  %240 = insertvalue { float, float, float, float } %235, float %subtract.2130, 2
  %241 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %242 = load float, ptr %241, align 4, !invariant.load !81
  %243 = add i32 %14, 0
  %244 = add i32 %13, 48
  %245 = mul nuw nsw i32 %244, 1
  %246 = add nuw nsw i32 0, %245
  %247 = urem i32 %246, 8
  %248 = udiv i32 %246, 8
  %249 = udiv i32 %248, 17
  %250 = mul nuw nsw i32 %243, 1
  %251 = add nuw nsw i32 0, %250
  %252 = udiv i32 %251, 8192
  %253 = mul nuw nsw i32 %247, 1
  %254 = add nuw nsw i32 0, %253
  %255 = mul nuw nsw i32 %248, 8
  %256 = add nuw nsw i32 %254, %255
  %257 = udiv i32 %256, 136
  %258 = mul nuw nsw i32 %251, 1
  %259 = add nuw nsw i32 0, %258
  %260 = udiv i32 %259, 8192
  %261 = add i32 %259, 0
  %262 = add i32 %256, 832
  %263 = getelementptr inbounds [8192 x [968 x float]], ptr %arg11, i32 0, i32 %261, i32 %262
  %264 = load float, ptr %263, align 4, !invariant.load !81
  %265 = getelementptr inbounds [8192 x [968 x float]], ptr %arg12, i32 0, i32 %261, i32 %262
  %266 = load float, ptr %265, align 4, !invariant.load !81
  %add.2231 = fadd float %264, %266
  %267 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg10, i32 0, i32 %251, i32 %248, i32 0
  %268 = load float, ptr %267, align 4, !invariant.load !81
  %multiply.2732 = fmul float %add.2231, %268
  %269 = mul nuw nsw i32 %247, 1
  %270 = add nuw nsw i32 0, %269
  %271 = mul nuw nsw i32 %248, 8
  %272 = add nuw nsw i32 %270, %271
  %273 = udiv i32 %272, 136
  %274 = mul nuw nsw i32 %251, 1
  %275 = add nuw nsw i32 0, %274
  %276 = udiv i32 %275, 8192
  %277 = add i32 %275, 0
  %278 = add i32 %272, 832
  %279 = getelementptr inbounds [8192 x [968 x float]], ptr %arg9, i32 0, i32 %277, i32 %278
  %280 = load float, ptr %279, align 4, !invariant.load !81
  %281 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg8, i32 0, i32 %251, i32 %248, i32 0
  %282 = load float, ptr %281, align 4, !invariant.load !81
  %multiply.3233 = fmul float %280, %282
  %add.3334 = fadd float %multiply.2732, %multiply.3233
  %multiply.3635 = fmul float %225, %add.3334
  %subtract.3736 = fsub float %242, %multiply.3635
  %283 = insertvalue { float, float, float, float } %240, float %subtract.3736, 3
  %284 = extractvalue { float, float, float, float } %283, 0
  %285 = getelementptr inbounds float, ptr %arg13, i32 %linear_index3
  store float %284, ptr %285, align 4
  %286 = extractvalue { float, float, float, float } %283, 1
  %287 = getelementptr inbounds float, ptr %arg14, i32 %linear_index3
  store float %286, ptr %287, align 4
  %288 = extractvalue { float, float, float, float } %283, 2
  %289 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %288, ptr %289, align 4
  %290 = extractvalue { float, float, float, float } %283, 3
  %291 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %290, ptr %291, align 4
  br label %fusion_46.in_bounds-after
}

define void @fusion_44(ptr noalias align 16 dereferenceable(31719424) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 16 dereferenceable(31719424) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 128 dereferenceable(247808) %arg4, ptr noalias align 128 dereferenceable(31719424) %arg5) {
entry:
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer26 = alloca float, align 4
  %result_from_other_lane24 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !74
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_19_constant_12 = load float, ptr @12, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_19_constant_12, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !128
  %5 = urem i32 %3, 1024
  %6 = udiv i32 %3, 1024
  %7 = mul i32 %4, 1
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 1984
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 31
  %13 = udiv i32 %8, 31
  %14 = urem i32 %13, 1
  %15 = udiv i32 %8, 31
  %16 = icmp eq i32 %14, 0
  %tile_bound = select i1 %16, i32 128, i32 4096
  %17 = icmp eq i32 %12, 30
  %tile_bound1 = select i1 %17, i32 8, i32 32
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 4096
  %tile_origin.2 = mul i32 %12, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %21 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %21, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %22 = icmp eq i32 %tile_loop.indvar, 0
  %23 = mul i32 %tile_loop.indvar, 1
  %24 = add i32 %23, 0
  %x_loc = add i32 %24, %20
  %25 = add i32 %tile_origin.1, %y_in_tile.indvar
  %26 = add i32 %tile_origin.2, %x_loc
  %27 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %27, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !129

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !130

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache16, i32 0, i32 %6, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %28 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %29 = load float, ptr %current_output, align 4
  store float %29, ptr %28, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache16, i32 0, i32 %6, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %30 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result19 = load float, ptr %30, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 16, i32 31)
  store float %31, ptr %result_from_other_lane, align 4
  call void @region_1_13(ptr %30, ptr %result_from_other_lane, ptr %return_buffer20)
  %32 = load float, ptr %return_buffer20, align 4
  store float %32, ptr %30, align 4
  %partial_reduction_result22 = load float, ptr %30, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 8, i32 31)
  store float %33, ptr %result_from_other_lane21, align 4
  call void @region_1_13(ptr %30, ptr %result_from_other_lane21, ptr %return_buffer23)
  %34 = load float, ptr %return_buffer23, align 4
  store float %34, ptr %30, align 4
  %partial_reduction_result25 = load float, ptr %30, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result25, i32 4, i32 31)
  store float %35, ptr %result_from_other_lane24, align 4
  call void @region_1_13(ptr %30, ptr %result_from_other_lane24, ptr %return_buffer26)
  %36 = load float, ptr %return_buffer26, align 4
  store float %36, ptr %30, align 4
  %partial_reduction_result28 = load float, ptr %30, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 2, i32 31)
  store float %37, ptr %result_from_other_lane27, align 4
  call void @region_1_13(ptr %30, ptr %result_from_other_lane27, ptr %return_buffer29)
  %38 = load float, ptr %return_buffer29, align 4
  store float %38, ptr %30, align 4
  %partial_reduction_result31 = load float, ptr %30, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 1, i32 31)
  store float %39, ptr %result_from_other_lane30, align 4
  call void @region_1_13(ptr %30, ptr %result_from_other_lane30, ptr %return_buffer32)
  %40 = load float, ptr %return_buffer32, align 4
  store float %40, ptr %30, align 4
  %41 = icmp ult i32 %thread_id.x, %tile_bound
  %42 = mul i32 %thread_id.y, 1
  %43 = icmp ult i32 %42, %tile_bound1
  %44 = and i1 %43, %41
  %45 = icmp eq i32 %lane_id, 0
  %46 = and i1 %44, %45
  br i1 %46, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %47 = mul nuw nsw i32 %26, 1
  %48 = add nuw nsw i32 0, %47
  %49 = mul nuw nsw i32 %25, 968
  %50 = add nuw nsw i32 %48, %49
  %51 = mul nuw nsw i32 %tile_origin.0, 123904
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 968
  %55 = udiv i32 %52, 968
  %56 = urem i32 %55, 128
  %57 = udiv i32 %52, 123904
  %58 = mul i32 %thread_id.x, 1
  %59 = sub i32 %x_loc, %58
  %60 = mul nuw nsw i32 %54, 1
  %61 = add nuw nsw i32 0, %60
  %62 = udiv i32 %61, 968
  %63 = mul nuw nsw i32 %56, 1
  %64 = add nuw nsw i32 0, %63
  %65 = mul nuw nsw i32 %57, 128
  %66 = add nuw nsw i32 %64, %65
  %67 = udiv i32 %66, 8192
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %52
  %Arg_3.43 = load float, ptr %Arg_3.4, align 4, !invariant.load !81
  %region_0_19_constant_5 = load float, ptr @11, align 4
  %compare.7 = fcmp ogt float %Arg_3.43, %region_0_19_constant_5
  %68 = zext i1 %compare.7 to i8
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %52
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !81
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %52
  %Arg_2.35 = load float, ptr %Arg_2.3, align 4, !invariant.load !81
  %add.8 = fadd float %Arg_1.24, %Arg_2.35
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.16 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  %add.9 = fadd float %add.8, %Arg_0.16
  %69 = trunc i8 %68 to i1
  %70 = select i1 %69, float %add.9, float %region_0_19_constant_5
  store float %70, ptr %reduction_input_address, align 4
  %71 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %59
  call void @region_1_13(ptr %71, ptr %reduction_input_address, ptr %return_buffer)
  %72 = load float, ptr %return_buffer, align 4
  store float %72, ptr %71, align 4
  %73 = mul nuw nsw i32 %54, 1
  %74 = add nuw nsw i32 0, %73
  %75 = udiv i32 %74, 968
  %76 = mul nuw nsw i32 %56, 1
  %77 = add nuw nsw i32 0, %76
  %78 = mul nuw nsw i32 %57, 128
  %79 = add nuw nsw i32 %77, %78
  %80 = udiv i32 %79, 8192
  %Arg_3.47 = getelementptr inbounds float, ptr %arg3, i32 %52
  %Arg_3.48 = load float, ptr %Arg_3.47, align 4, !invariant.load !81
  %region_0_19_constant_59 = load float, ptr @11, align 4
  %compare.710 = fcmp ogt float %Arg_3.48, %region_0_19_constant_59
  %81 = zext i1 %compare.710 to i8
  %Arg_1.211 = getelementptr inbounds float, ptr %arg1, i32 %52
  %Arg_1.212 = load float, ptr %Arg_1.211, align 4, !invariant.load !81
  %Arg_2.313 = getelementptr inbounds float, ptr %arg2, i32 %52
  %Arg_2.314 = load float, ptr %Arg_2.313, align 4, !invariant.load !81
  %add.815 = fadd float %Arg_1.212, %Arg_2.314
  %Arg_0.116 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.117 = load float, ptr %Arg_0.116, align 4, !invariant.load !81
  %add.918 = fadd float %add.815, %Arg_0.117
  %82 = trunc i8 %81 to i1
  %83 = select i1 %82, float %add.918, float %region_0_19_constant_59
  %84 = mul nuw nsw i32 %54, 1
  %85 = add nuw nsw i32 0, %84
  %86 = udiv i32 %85, 968
  %87 = mul nuw nsw i32 %56, 1
  %88 = add nuw nsw i32 0, %87
  %89 = mul nuw nsw i32 %57, 128
  %90 = add nuw nsw i32 %88, %89
  %91 = udiv i32 %90, 8192
  %92 = getelementptr inbounds float, ptr %arg5, i32 %52
  store float %83, ptr %92, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %93 = mul i32 %thread_id.y, 1
  %94 = add i32 %tile_origin.1, %thread_id.x
  %95 = add i32 %tile_origin.2, %93
  %96 = add i32 %95, 0
  %97 = mul i32 %tile_origin.0, 968
  %98 = add i32 %97, %96
  %99 = udiv i32 %98, 1
  %100 = urem i32 %99, 968
  %101 = udiv i32 %98, 968
  %output_element_address = getelementptr inbounds [64 x [968 x float]], ptr %arg4, i32 0, i32 %101, i32 %100
  %output = load float, ptr %30, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_13(ptr dereferenceable(4) %Arg_0.14.typed, ptr dereferenceable(4) %Arg_1.15.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.16.typed = alloca float, align 4
  %Arg_0.14 = load float, ptr %Arg_0.14.typed, align 4
  %Arg_1.15 = load float, ptr %Arg_1.15.typed, align 4
  %add.16 = fadd float %Arg_0.14, %Arg_1.15
  store float %add.16, ptr %add.16.typed, align 4
  %load_ret_value = load float, ptr %add.16.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @reduce_208(ptr noalias align 128 dereferenceable(247808) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(3872) %arg2) {
entry:
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane9 = alloca float, align 4
  %return_buffer8 = alloca float, align 4
  %result_from_other_lane6 = alloca float, align 4
  %return_buffer5 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !74
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !81
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !131
  %5 = urem i32 %3, 1024
  %6 = udiv i32 %3, 1024
  %7 = mul i32 %4, 1
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 31
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 31
  %13 = udiv i32 %8, 31
  %14 = urem i32 %13, 1
  %15 = udiv i32 %8, 31
  %16 = icmp eq i32 %14, 0
  %tile_bound = select i1 %16, i32 64, i32 4096
  %17 = icmp eq i32 %12, 30
  %tile_bound1 = select i1 %17, i32 8, i32 32
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 4096
  %tile_origin.2 = mul i32 %12, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %21 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %21, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %22 = icmp eq i32 %tile_loop.indvar, 0
  %23 = mul i32 %tile_loop.indvar, 1
  %24 = add i32 %23, 0
  %x_loc = add i32 %24, %20
  %25 = add i32 %tile_origin.1, %y_in_tile.indvar
  %26 = add i32 %tile_origin.2, %x_loc
  %27 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %27, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !132

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !133

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache17, i32 0, i32 %6, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %28 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %29 = load float, ptr %current_output, align 4
  store float %29, ptr %28, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache17, i32 0, i32 %6, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %30 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result4 = load float, ptr %30, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  store float %31, ptr %result_from_other_lane, align 4
  call void @region_1_3(ptr %30, ptr %result_from_other_lane, ptr %return_buffer5)
  %32 = load float, ptr %return_buffer5, align 4
  store float %32, ptr %30, align 4
  %partial_reduction_result7 = load float, ptr %30, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result7, i32 8, i32 31)
  store float %33, ptr %result_from_other_lane6, align 4
  call void @region_1_3(ptr %30, ptr %result_from_other_lane6, ptr %return_buffer8)
  %34 = load float, ptr %return_buffer8, align 4
  store float %34, ptr %30, align 4
  %partial_reduction_result10 = load float, ptr %30, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 4, i32 31)
  store float %35, ptr %result_from_other_lane9, align 4
  call void @region_1_3(ptr %30, ptr %result_from_other_lane9, ptr %return_buffer11)
  %36 = load float, ptr %return_buffer11, align 4
  store float %36, ptr %30, align 4
  %partial_reduction_result13 = load float, ptr %30, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 2, i32 31)
  store float %37, ptr %result_from_other_lane12, align 4
  call void @region_1_3(ptr %30, ptr %result_from_other_lane12, ptr %return_buffer14)
  %38 = load float, ptr %return_buffer14, align 4
  store float %38, ptr %30, align 4
  %partial_reduction_result16 = load float, ptr %30, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 1, i32 31)
  store float %39, ptr %result_from_other_lane15, align 4
  call void @region_1_3(ptr %30, ptr %result_from_other_lane15, ptr %return_buffer17)
  %40 = load float, ptr %return_buffer17, align 4
  store float %40, ptr %30, align 4
  %41 = icmp ult i32 %thread_id.x, %tile_bound
  %42 = mul i32 %thread_id.y, 1
  %43 = icmp ult i32 %42, %tile_bound1
  %44 = and i1 %43, %41
  %45 = icmp eq i32 %lane_id, 0
  %46 = and i1 %44, %45
  br i1 %46, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %47 = mul i32 %thread_id.x, 1
  %48 = sub i32 %x_loc, %47
  %Arg_0.1 = getelementptr inbounds [64 x [968 x float]], ptr %arg0, i32 0, i32 %25, i32 %26
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !81
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %49 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %48
  call void @region_1_3(ptr %49, ptr %reduction_input_address, ptr %return_buffer)
  %50 = load float, ptr %return_buffer, align 4
  store float %50, ptr %49, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %51 = mul i32 %thread_id.y, 1
  %52 = add i32 %tile_origin.1, %thread_id.x
  %53 = add i32 %tile_origin.2, %51
  %54 = add i32 %53, 0
  %55 = mul i32 %tile_origin.0, 968
  %56 = add i32 %55, %54
  %57 = udiv i32 %56, 1
  %output_element_address = getelementptr inbounds [968 x float], ptr %arg2, i32 0, i32 %57
  %output = load float, ptr %30, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_3(ptr dereferenceable(4) %Arg_0.4.typed, ptr dereferenceable(4) %Arg_1.5.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.6.typed = alloca float, align 4
  %Arg_0.4 = load float, ptr %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, ptr %Arg_1.5.typed, align 4
  %add.6 = fadd float %Arg_0.4, %Arg_1.5
  store float %add.6, ptr %add.6.typed, align 4
  %load_ret_value = load float, ptr %add.6.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_43(ptr noalias align 16 dereferenceable(3872) %arg0, ptr noalias align 128 dereferenceable(3872) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !134
  %2 = mul nuw nsw i32 %0, 968
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 968
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 968
  br i1 %4, label %fusion_43.in_bounds-true, label %fusion_43.in_bounds-after

fusion_43.in_bounds-after:                        ; preds = %fusion_43.in_bounds-true, %entry
  ret void

fusion_43.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !81
  %7 = load float, ptr %arg2, align 4, !invariant.load !81
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.5 = fmul float %7, %9
  %subtract.6 = fsub float %6, %multiply.5
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %10, align 4
  br label %fusion_43.in_bounds-after
}

define void @fusion_42(ptr noalias align 16 dereferenceable(524288) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !88
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !127
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 16
  %5 = udiv i32 %linear_index_base, 16
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 16
  %8 = udiv i32 %linear_index1, 16
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 16
  %11 = udiv i32 %linear_index2, 16
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 16
  %14 = udiv i32 %linear_index3, 16
  %15 = icmp ult i32 %linear_index_base, 131072
  br i1 %15, label %fusion_42.in_bounds-true, label %fusion_42.in_bounds-after

fusion_42.in_bounds-after:                        ; preds = %fusion_42.in_bounds-true, %entry
  ret void

fusion_42.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !81
  %18 = load float, ptr %arg2, align 4, !invariant.load !81
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4
  %multiply.5 = fmul float %18, %20
  %subtract.6 = fsub float %17, %multiply.5
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %subtract.6, ptr %21, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %23 = load float, ptr %22, align 4, !invariant.load !81
  %24 = load float, ptr %arg2, align 4, !invariant.load !81
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4
  %multiply.51 = fmul float %24, %26
  %subtract.62 = fsub float %23, %multiply.51
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %subtract.62, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4, !invariant.load !81
  %30 = load float, ptr %arg2, align 4, !invariant.load !81
  %31 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %32 = load float, ptr %31, align 4
  %multiply.53 = fmul float %30, %32
  %subtract.64 = fsub float %29, %multiply.53
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %subtract.64, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %35 = load float, ptr %34, align 4, !invariant.load !81
  %36 = load float, ptr %arg2, align 4, !invariant.load !81
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %multiply.55 = fmul float %36, %38
  %subtract.66 = fsub float %35, %multiply.55
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %subtract.66, ptr %39, align 4
  br label %fusion_42.in_bounds-after
}

define void @fusion_41(ptr noalias align 16 dereferenceable(61952) %arg0, ptr noalias align 128 dereferenceable(61952) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !95
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 968
  %5 = udiv i32 %linear_index, 968
  %6 = icmp ult i32 %linear_index, 15488
  br i1 %6, label %fusion_41.in_bounds-true, label %fusion_41.in_bounds-after

fusion_41.in_bounds-after:                        ; preds = %fusion_41.in_bounds-true, %entry
  ret void

fusion_41.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_41.in_bounds-after
}

define void @fusion_40(ptr noalias align 16 dereferenceable(262144) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 16 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6, ptr noalias align 16 dereferenceable(262144) %arg7, ptr noalias align 128 dereferenceable(262144) %arg8, ptr noalias align 16 dereferenceable(262144) %arg9, ptr noalias align 128 dereferenceable(262144) %arg10, ptr noalias align 128 dereferenceable(262144) %arg11, ptr noalias align 128 dereferenceable(262144) %arg12, ptr noalias align 128 dereferenceable(262144) %arg13) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 65536
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 8
  %5 = udiv i32 %linear_index, 8
  %6 = icmp ult i32 %linear_index, 65536
  br i1 %6, label %fusion_40.in_bounds-true, label %fusion_40.in_bounds-after

fusion_40.in_bounds-after:                        ; preds = %fusion_40.in_bounds-true, %entry
  ret void

fusion_40.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !81
  %multiply.13 = fmul float %9, %11
  %subtract.14 = fsub float %8, %multiply.13
  %12 = insertvalue { float, float, float, float, float } undef, float %subtract.14, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !81
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4, !invariant.load !81
  %multiply.15 = fmul float %9, %16
  %subtract.16 = fsub float %14, %multiply.15
  %17 = insertvalue { float, float, float, float, float } %12, float %subtract.16, 1
  %18 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %19 = load float, ptr %18, align 4, !invariant.load !81
  %20 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %21 = load float, ptr %20, align 4, !invariant.load !81
  %multiply.17 = fmul float %9, %21
  %subtract.18 = fsub float %19, %multiply.17
  %22 = insertvalue { float, float, float, float, float } %17, float %subtract.18, 2
  %23 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %24 = load float, ptr %23, align 4, !invariant.load !81
  %25 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %26 = load float, ptr %25, align 4
  %multiply.19 = fmul float %9, %26
  %subtract.20 = fsub float %24, %multiply.19
  %27 = insertvalue { float, float, float, float, float } %22, float %subtract.20, 3
  %28 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %29 = load float, ptr %28, align 4, !invariant.load !81
  %30 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %31 = load float, ptr %30, align 4
  %multiply.21 = fmul float %9, %31
  %subtract.22 = fsub float %29, %multiply.21
  %32 = insertvalue { float, float, float, float, float } %27, float %subtract.22, 4
  %33 = extractvalue { float, float, float, float, float } %32, 0
  %34 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %33, ptr %34, align 4
  %35 = extractvalue { float, float, float, float, float } %32, 1
  %36 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  store float %35, ptr %36, align 4
  %37 = extractvalue { float, float, float, float, float } %32, 2
  %38 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  store float %37, ptr %38, align 4
  %39 = extractvalue { float, float, float, float, float } %32, 3
  %40 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %39, ptr %40, align 4
  %41 = extractvalue { float, float, float, float, float } %32, 4
  %42 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  store float %41, ptr %42, align 4
  br label %fusion_40.in_bounds-after
}

define void @fusion_39(ptr noalias align 16 dereferenceable(30976) %arg0, ptr noalias align 128 dereferenceable(30976) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(30976) %arg3, ptr noalias align 128 dereferenceable(30976) %arg4, ptr noalias align 16 dereferenceable(30976) %arg5, ptr noalias align 128 dereferenceable(30976) %arg6, ptr noalias align 16 dereferenceable(30976) %arg7, ptr noalias align 128 dereferenceable(30976) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 968
  %5 = udiv i32 %linear_index, 968
  %6 = icmp ult i32 %linear_index, 7744
  br i1 %6, label %fusion_39.in_bounds-true, label %fusion_39.in_bounds-after

fusion_39.in_bounds-after:                        ; preds = %fusion_39.in_bounds-true, %entry
  ret void

fusion_39.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.11 = fmul float %9, %11
  %subtract.12 = fsub float %8, %multiply.11
  %12 = insertvalue { float, float, float, float } undef, float %subtract.12, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !81
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.13 = fmul float %9, %16
  %subtract.14 = fsub float %14, %multiply.13
  %17 = insertvalue { float, float, float, float } %12, float %subtract.14, 1
  %18 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %19 = load float, ptr %18, align 4, !invariant.load !81
  %20 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %21 = load float, ptr %20, align 4
  %multiply.15 = fmul float %9, %21
  %subtract.16 = fsub float %19, %multiply.15
  %22 = insertvalue { float, float, float, float } %17, float %subtract.16, 2
  %23 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %24 = load float, ptr %23, align 4, !invariant.load !81
  %25 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %26 = load float, ptr %25, align 4
  %multiply.17 = fmul float %9, %26
  %subtract.18 = fsub float %24, %multiply.17
  %27 = insertvalue { float, float, float, float } %22, float %subtract.18, 3
  %28 = extractvalue { float, float, float, float } %27, 0
  %29 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  store float %28, ptr %29, align 4
  %30 = extractvalue { float, float, float, float } %27, 1
  %31 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %30, ptr %31, align 4
  %32 = extractvalue { float, float, float, float } %27, 2
  %33 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %32, ptr %33, align 4
  %34 = extractvalue { float, float, float, float } %27, 3
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %34, ptr %35, align 4
  br label %fusion_39.in_bounds-after
}

define void @fusion_30(ptr noalias align 16 dereferenceable(14680064) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(425984) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 16 dereferenceable(31719424) %arg4, ptr noalias align 16 dereferenceable(425984) %arg5, ptr noalias align 16 dereferenceable(31719424) %arg6, ptr noalias align 128 dereferenceable(14680064) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !135
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !127
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 917504
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 448
  %5 = udiv i32 %linear_index_base, 448
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 448
  %8 = udiv i32 %linear_index1, 448
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 448
  %11 = udiv i32 %linear_index2, 448
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 448
  %14 = udiv i32 %linear_index3, 448
  %15 = icmp ult i32 %linear_index_base, 3670016
  br i1 %15, label %fusion_30.in_bounds-true, label %fusion_30.in_bounds-after

fusion_30.in_bounds-after:                        ; preds = %fusion_30.in_bounds-true, %entry
  ret void

fusion_30.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !81
  %18 = load float, ptr %arg1, align 4, !invariant.load !81
  %19 = add i32 %5, 0
  %20 = add i32 %4, 0
  %21 = mul nuw nsw i32 %20, 1
  %22 = add nuw nsw i32 0, %21
  %23 = urem i32 %22, 64
  %24 = udiv i32 %22, 64
  %25 = udiv i32 %24, 13
  %26 = mul nuw nsw i32 %19, 1
  %27 = add nuw nsw i32 0, %26
  %28 = udiv i32 %27, 8192
  %29 = mul nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 0, %29
  %31 = mul nuw nsw i32 %24, 64
  %32 = add nuw nsw i32 %30, %31
  %33 = udiv i32 %32, 832
  %34 = mul nuw nsw i32 %27, 1
  %35 = add nuw nsw i32 0, %34
  %36 = udiv i32 %35, 8192
  %37 = add i32 %35, 0
  %38 = add i32 %32, 0
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !81
  %41 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg5, i32 0, i32 %27, i32 %24, i32 0
  %42 = load float, ptr %41, align 4, !invariant.load !81
  %multiply.13 = fmul float %40, %42
  %43 = mul nuw nsw i32 %23, 1
  %44 = add nuw nsw i32 0, %43
  %45 = mul nuw nsw i32 %24, 64
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 832
  %48 = mul nuw nsw i32 %27, 1
  %49 = add nuw nsw i32 0, %48
  %50 = udiv i32 %49, 8192
  %51 = add i32 %49, 0
  %52 = add i32 %46, 0
  %53 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %51, i32 %52
  %54 = load float, ptr %53, align 4, !invariant.load !81
  %55 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %51, i32 %52
  %56 = load float, ptr %55, align 4, !invariant.load !81
  %add.14 = fadd float %54, %56
  %57 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg2, i32 0, i32 %27, i32 %24, i32 0
  %58 = load float, ptr %57, align 4, !invariant.load !81
  %multiply.19 = fmul float %add.14, %58
  %add.20 = fadd float %multiply.13, %multiply.19
  %multiply.23 = fmul float %18, %add.20
  %subtract.24 = fsub float %17, %multiply.23
  %59 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %subtract.24, ptr %59, align 4
  %60 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %61 = load float, ptr %60, align 4, !invariant.load !81
  %62 = load float, ptr %arg1, align 4, !invariant.load !81
  %63 = add i32 %8, 0
  %64 = add i32 %7, 0
  %65 = mul nuw nsw i32 %64, 1
  %66 = add nuw nsw i32 0, %65
  %67 = urem i32 %66, 64
  %68 = udiv i32 %66, 64
  %69 = udiv i32 %68, 13
  %70 = mul nuw nsw i32 %63, 1
  %71 = add nuw nsw i32 0, %70
  %72 = udiv i32 %71, 8192
  %73 = mul nuw nsw i32 %67, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %68, 64
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 832
  %78 = mul nuw nsw i32 %71, 1
  %79 = add nuw nsw i32 0, %78
  %80 = udiv i32 %79, 8192
  %81 = add i32 %79, 0
  %82 = add i32 %76, 0
  %83 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %81, i32 %82
  %84 = load float, ptr %83, align 4, !invariant.load !81
  %85 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg5, i32 0, i32 %71, i32 %68, i32 0
  %86 = load float, ptr %85, align 4, !invariant.load !81
  %multiply.131 = fmul float %84, %86
  %87 = mul nuw nsw i32 %67, 1
  %88 = add nuw nsw i32 0, %87
  %89 = mul nuw nsw i32 %68, 64
  %90 = add nuw nsw i32 %88, %89
  %91 = udiv i32 %90, 832
  %92 = mul nuw nsw i32 %71, 1
  %93 = add nuw nsw i32 0, %92
  %94 = udiv i32 %93, 8192
  %95 = add i32 %93, 0
  %96 = add i32 %90, 0
  %97 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %95, i32 %96
  %98 = load float, ptr %97, align 4, !invariant.load !81
  %99 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %95, i32 %96
  %100 = load float, ptr %99, align 4, !invariant.load !81
  %add.142 = fadd float %98, %100
  %101 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg2, i32 0, i32 %71, i32 %68, i32 0
  %102 = load float, ptr %101, align 4, !invariant.load !81
  %multiply.193 = fmul float %add.142, %102
  %add.204 = fadd float %multiply.131, %multiply.193
  %multiply.235 = fmul float %62, %add.204
  %subtract.246 = fsub float %61, %multiply.235
  %103 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %subtract.246, ptr %103, align 4
  %104 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %105 = load float, ptr %104, align 4, !invariant.load !81
  %106 = load float, ptr %arg1, align 4, !invariant.load !81
  %107 = add i32 %11, 0
  %108 = add i32 %10, 0
  %109 = mul nuw nsw i32 %108, 1
  %110 = add nuw nsw i32 0, %109
  %111 = urem i32 %110, 64
  %112 = udiv i32 %110, 64
  %113 = udiv i32 %112, 13
  %114 = mul nuw nsw i32 %107, 1
  %115 = add nuw nsw i32 0, %114
  %116 = udiv i32 %115, 8192
  %117 = mul nuw nsw i32 %111, 1
  %118 = add nuw nsw i32 0, %117
  %119 = mul nuw nsw i32 %112, 64
  %120 = add nuw nsw i32 %118, %119
  %121 = udiv i32 %120, 832
  %122 = mul nuw nsw i32 %115, 1
  %123 = add nuw nsw i32 0, %122
  %124 = udiv i32 %123, 8192
  %125 = add i32 %123, 0
  %126 = add i32 %120, 0
  %127 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %125, i32 %126
  %128 = load float, ptr %127, align 4, !invariant.load !81
  %129 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg5, i32 0, i32 %115, i32 %112, i32 0
  %130 = load float, ptr %129, align 4, !invariant.load !81
  %multiply.137 = fmul float %128, %130
  %131 = mul nuw nsw i32 %111, 1
  %132 = add nuw nsw i32 0, %131
  %133 = mul nuw nsw i32 %112, 64
  %134 = add nuw nsw i32 %132, %133
  %135 = udiv i32 %134, 832
  %136 = mul nuw nsw i32 %115, 1
  %137 = add nuw nsw i32 0, %136
  %138 = udiv i32 %137, 8192
  %139 = add i32 %137, 0
  %140 = add i32 %134, 0
  %141 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %139, i32 %140
  %142 = load float, ptr %141, align 4, !invariant.load !81
  %143 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %139, i32 %140
  %144 = load float, ptr %143, align 4, !invariant.load !81
  %add.148 = fadd float %142, %144
  %145 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg2, i32 0, i32 %115, i32 %112, i32 0
  %146 = load float, ptr %145, align 4, !invariant.load !81
  %multiply.199 = fmul float %add.148, %146
  %add.2010 = fadd float %multiply.137, %multiply.199
  %multiply.2311 = fmul float %106, %add.2010
  %subtract.2412 = fsub float %105, %multiply.2311
  %147 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %subtract.2412, ptr %147, align 4
  %148 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %149 = load float, ptr %148, align 4, !invariant.load !81
  %150 = load float, ptr %arg1, align 4, !invariant.load !81
  %151 = add i32 %14, 0
  %152 = add i32 %13, 0
  %153 = mul nuw nsw i32 %152, 1
  %154 = add nuw nsw i32 0, %153
  %155 = urem i32 %154, 64
  %156 = udiv i32 %154, 64
  %157 = udiv i32 %156, 13
  %158 = mul nuw nsw i32 %151, 1
  %159 = add nuw nsw i32 0, %158
  %160 = udiv i32 %159, 8192
  %161 = mul nuw nsw i32 %155, 1
  %162 = add nuw nsw i32 0, %161
  %163 = mul nuw nsw i32 %156, 64
  %164 = add nuw nsw i32 %162, %163
  %165 = udiv i32 %164, 832
  %166 = mul nuw nsw i32 %159, 1
  %167 = add nuw nsw i32 0, %166
  %168 = udiv i32 %167, 8192
  %169 = add i32 %167, 0
  %170 = add i32 %164, 0
  %171 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %169, i32 %170
  %172 = load float, ptr %171, align 4, !invariant.load !81
  %173 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg5, i32 0, i32 %159, i32 %156, i32 0
  %174 = load float, ptr %173, align 4, !invariant.load !81
  %multiply.1313 = fmul float %172, %174
  %175 = mul nuw nsw i32 %155, 1
  %176 = add nuw nsw i32 0, %175
  %177 = mul nuw nsw i32 %156, 64
  %178 = add nuw nsw i32 %176, %177
  %179 = udiv i32 %178, 832
  %180 = mul nuw nsw i32 %159, 1
  %181 = add nuw nsw i32 0, %180
  %182 = udiv i32 %181, 8192
  %183 = add i32 %181, 0
  %184 = add i32 %178, 0
  %185 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %183, i32 %184
  %186 = load float, ptr %185, align 4, !invariant.load !81
  %187 = getelementptr inbounds [8192 x [968 x float]], ptr %arg4, i32 0, i32 %183, i32 %184
  %188 = load float, ptr %187, align 4, !invariant.load !81
  %add.1414 = fadd float %186, %188
  %189 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg2, i32 0, i32 %159, i32 %156, i32 0
  %190 = load float, ptr %189, align 4, !invariant.load !81
  %multiply.1915 = fmul float %add.1414, %190
  %add.2016 = fadd float %multiply.1313, %multiply.1915
  %multiply.2317 = fmul float %150, %add.2016
  %subtract.2418 = fsub float %149, %multiply.2317
  %191 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %subtract.2418, ptr %191, align 4
  br label %fusion_30.in_bounds-after
}

define void @fusion_27(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 128 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 128 dereferenceable(4194304) %arg4, ptr noalias align 128 dereferenceable(4194304) %arg5) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %fusion_27.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 1048576
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !136
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !88
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 128
  %7 = udiv i32 %linear_index_plus_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 128
  %10 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 128
  %13 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 128
  %16 = udiv i32 %linear_index3, 128
  %17 = icmp ult i32 %linear_index_plus_base, 1048576
  br i1 %17, label %fusion_27.in_bounds-true, label %fusion_27.in_bounds-after

fusion_27.in_bounds-after:                        ; preds = %fusion_27.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !137

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

fusion_27.in_bounds-true:                         ; preds = %loop.loop_body
  %18 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  %19 = load float, ptr %18, align 4, !invariant.load !81
  %20 = load float, ptr %arg2, align 4, !invariant.load !81
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  %22 = load float, ptr %21, align 4
  %multiply.7 = fmul float %20, %22
  %subtract.8 = fsub float %19, %multiply.7
  %23 = insertvalue { float, float } undef, float %subtract.8, 0
  %24 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_plus_base
  %25 = load float, ptr %24, align 4, !invariant.load !81
  %26 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_plus_base
  %27 = load float, ptr %26, align 4, !invariant.load !81
  %multiply.9 = fmul float %20, %27
  %subtract.10 = fsub float %25, %multiply.9
  %28 = insertvalue { float, float } %23, float %subtract.10, 1
  %29 = extractvalue { float, float } %28, 0
  %30 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_plus_base
  store float %29, ptr %30, align 4
  %31 = extractvalue { float, float } %28, 1
  %32 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  store float %31, ptr %32, align 4
  %33 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %34 = load float, ptr %33, align 4, !invariant.load !81
  %35 = load float, ptr %arg2, align 4, !invariant.load !81
  %36 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %37 = load float, ptr %36, align 4
  %multiply.71 = fmul float %35, %37
  %subtract.82 = fsub float %34, %multiply.71
  %38 = insertvalue { float, float } undef, float %subtract.82, 0
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %40 = load float, ptr %39, align 4, !invariant.load !81
  %41 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %42 = load float, ptr %41, align 4, !invariant.load !81
  %multiply.93 = fmul float %35, %42
  %subtract.104 = fsub float %40, %multiply.93
  %43 = insertvalue { float, float } %38, float %subtract.104, 1
  %44 = extractvalue { float, float } %43, 0
  %45 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %44, ptr %45, align 4
  %46 = extractvalue { float, float } %43, 1
  %47 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %46, ptr %47, align 4
  %48 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %49 = load float, ptr %48, align 4, !invariant.load !81
  %50 = load float, ptr %arg2, align 4, !invariant.load !81
  %51 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %52 = load float, ptr %51, align 4
  %multiply.75 = fmul float %50, %52
  %subtract.86 = fsub float %49, %multiply.75
  %53 = insertvalue { float, float } undef, float %subtract.86, 0
  %54 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %55 = load float, ptr %54, align 4, !invariant.load !81
  %56 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %57 = load float, ptr %56, align 4, !invariant.load !81
  %multiply.97 = fmul float %50, %57
  %subtract.108 = fsub float %55, %multiply.97
  %58 = insertvalue { float, float } %53, float %subtract.108, 1
  %59 = extractvalue { float, float } %58, 0
  %60 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %59, ptr %60, align 4
  %61 = extractvalue { float, float } %58, 1
  %62 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %61, ptr %62, align 4
  %63 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %64 = load float, ptr %63, align 4, !invariant.load !81
  %65 = load float, ptr %arg2, align 4, !invariant.load !81
  %66 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %67 = load float, ptr %66, align 4
  %multiply.79 = fmul float %65, %67
  %subtract.810 = fsub float %64, %multiply.79
  %68 = insertvalue { float, float } undef, float %subtract.810, 0
  %69 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %70 = load float, ptr %69, align 4, !invariant.load !81
  %71 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %72 = load float, ptr %71, align 4, !invariant.load !81
  %multiply.911 = fmul float %65, %72
  %subtract.1012 = fsub float %70, %multiply.911
  %73 = insertvalue { float, float } %68, float %subtract.1012, 1
  %74 = extractvalue { float, float } %73, 0
  %75 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %74, ptr %75, align 4
  %76 = extractvalue { float, float } %73, 1
  %77 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %76, ptr %77, align 4
  br label %fusion_27.in_bounds-after
}

define void @fusion_24(ptr noalias align 16 dereferenceable(1572864) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(557056) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 16 dereferenceable(557056) %arg4, ptr noalias align 16 dereferenceable(31719424) %arg5, ptr noalias align 16 dereferenceable(31719424) %arg6, ptr noalias align 128 dereferenceable(1572864) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !138
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !127
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 98304
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 48
  %5 = udiv i32 %linear_index_base, 48
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 48
  %8 = udiv i32 %linear_index1, 48
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 48
  %11 = udiv i32 %linear_index2, 48
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 48
  %14 = udiv i32 %linear_index3, 48
  %15 = icmp ult i32 %linear_index_base, 393216
  br i1 %15, label %fusion_24.in_bounds-true, label %fusion_24.in_bounds-after

fusion_24.in_bounds-after:                        ; preds = %fusion_24.in_bounds-true, %entry
  ret void

fusion_24.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !81
  %18 = load float, ptr %arg1, align 4, !invariant.load !81
  %19 = add i32 %5, 0
  %20 = add i32 %4, 0
  %21 = mul nuw nsw i32 %20, 1
  %22 = add nuw nsw i32 0, %21
  %23 = urem i32 %22, 8
  %24 = udiv i32 %22, 8
  %25 = udiv i32 %24, 17
  %26 = mul nuw nsw i32 %19, 1
  %27 = add nuw nsw i32 0, %26
  %28 = udiv i32 %27, 8192
  %29 = mul nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 0, %29
  %31 = mul nuw nsw i32 %24, 8
  %32 = add nuw nsw i32 %30, %31
  %33 = udiv i32 %32, 136
  %34 = mul nuw nsw i32 %27, 1
  %35 = add nuw nsw i32 0, %34
  %36 = udiv i32 %35, 8192
  %37 = add i32 %35, 0
  %38 = add i32 %32, 832
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr %arg5, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !81
  %41 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %37, i32 %38
  %42 = load float, ptr %41, align 4, !invariant.load !81
  %add.9 = fadd float %40, %42
  %43 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg4, i32 0, i32 %27, i32 %24, i32 0
  %44 = load float, ptr %43, align 4, !invariant.load !81
  %multiply.14 = fmul float %add.9, %44
  %45 = mul nuw nsw i32 %23, 1
  %46 = add nuw nsw i32 0, %45
  %47 = mul nuw nsw i32 %24, 8
  %48 = add nuw nsw i32 %46, %47
  %49 = udiv i32 %48, 136
  %50 = mul nuw nsw i32 %27, 1
  %51 = add nuw nsw i32 0, %50
  %52 = udiv i32 %51, 8192
  %53 = add i32 %51, 0
  %54 = add i32 %48, 832
  %55 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %53, i32 %54
  %56 = load float, ptr %55, align 4, !invariant.load !81
  %57 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %27, i32 %24, i32 0
  %58 = load float, ptr %57, align 4, !invariant.load !81
  %multiply.19 = fmul float %56, %58
  %add.20 = fadd float %multiply.14, %multiply.19
  %multiply.23 = fmul float %18, %add.20
  %subtract.24 = fsub float %17, %multiply.23
  %59 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %subtract.24, ptr %59, align 4
  %60 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %61 = load float, ptr %60, align 4, !invariant.load !81
  %62 = load float, ptr %arg1, align 4, !invariant.load !81
  %63 = add i32 %8, 0
  %64 = add i32 %7, 0
  %65 = mul nuw nsw i32 %64, 1
  %66 = add nuw nsw i32 0, %65
  %67 = urem i32 %66, 8
  %68 = udiv i32 %66, 8
  %69 = udiv i32 %68, 17
  %70 = mul nuw nsw i32 %63, 1
  %71 = add nuw nsw i32 0, %70
  %72 = udiv i32 %71, 8192
  %73 = mul nuw nsw i32 %67, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %68, 8
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 136
  %78 = mul nuw nsw i32 %71, 1
  %79 = add nuw nsw i32 0, %78
  %80 = udiv i32 %79, 8192
  %81 = add i32 %79, 0
  %82 = add i32 %76, 832
  %83 = getelementptr inbounds [8192 x [968 x float]], ptr %arg5, i32 0, i32 %81, i32 %82
  %84 = load float, ptr %83, align 4, !invariant.load !81
  %85 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %81, i32 %82
  %86 = load float, ptr %85, align 4, !invariant.load !81
  %add.91 = fadd float %84, %86
  %87 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg4, i32 0, i32 %71, i32 %68, i32 0
  %88 = load float, ptr %87, align 4, !invariant.load !81
  %multiply.142 = fmul float %add.91, %88
  %89 = mul nuw nsw i32 %67, 1
  %90 = add nuw nsw i32 0, %89
  %91 = mul nuw nsw i32 %68, 8
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 136
  %94 = mul nuw nsw i32 %71, 1
  %95 = add nuw nsw i32 0, %94
  %96 = udiv i32 %95, 8192
  %97 = add i32 %95, 0
  %98 = add i32 %92, 832
  %99 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %97, i32 %98
  %100 = load float, ptr %99, align 4, !invariant.load !81
  %101 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %71, i32 %68, i32 0
  %102 = load float, ptr %101, align 4, !invariant.load !81
  %multiply.193 = fmul float %100, %102
  %add.204 = fadd float %multiply.142, %multiply.193
  %multiply.235 = fmul float %62, %add.204
  %subtract.246 = fsub float %61, %multiply.235
  %103 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %subtract.246, ptr %103, align 4
  %104 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %105 = load float, ptr %104, align 4, !invariant.load !81
  %106 = load float, ptr %arg1, align 4, !invariant.load !81
  %107 = add i32 %11, 0
  %108 = add i32 %10, 0
  %109 = mul nuw nsw i32 %108, 1
  %110 = add nuw nsw i32 0, %109
  %111 = urem i32 %110, 8
  %112 = udiv i32 %110, 8
  %113 = udiv i32 %112, 17
  %114 = mul nuw nsw i32 %107, 1
  %115 = add nuw nsw i32 0, %114
  %116 = udiv i32 %115, 8192
  %117 = mul nuw nsw i32 %111, 1
  %118 = add nuw nsw i32 0, %117
  %119 = mul nuw nsw i32 %112, 8
  %120 = add nuw nsw i32 %118, %119
  %121 = udiv i32 %120, 136
  %122 = mul nuw nsw i32 %115, 1
  %123 = add nuw nsw i32 0, %122
  %124 = udiv i32 %123, 8192
  %125 = add i32 %123, 0
  %126 = add i32 %120, 832
  %127 = getelementptr inbounds [8192 x [968 x float]], ptr %arg5, i32 0, i32 %125, i32 %126
  %128 = load float, ptr %127, align 4, !invariant.load !81
  %129 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %125, i32 %126
  %130 = load float, ptr %129, align 4, !invariant.load !81
  %add.97 = fadd float %128, %130
  %131 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg4, i32 0, i32 %115, i32 %112, i32 0
  %132 = load float, ptr %131, align 4, !invariant.load !81
  %multiply.148 = fmul float %add.97, %132
  %133 = mul nuw nsw i32 %111, 1
  %134 = add nuw nsw i32 0, %133
  %135 = mul nuw nsw i32 %112, 8
  %136 = add nuw nsw i32 %134, %135
  %137 = udiv i32 %136, 136
  %138 = mul nuw nsw i32 %115, 1
  %139 = add nuw nsw i32 0, %138
  %140 = udiv i32 %139, 8192
  %141 = add i32 %139, 0
  %142 = add i32 %136, 832
  %143 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %141, i32 %142
  %144 = load float, ptr %143, align 4, !invariant.load !81
  %145 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %115, i32 %112, i32 0
  %146 = load float, ptr %145, align 4, !invariant.load !81
  %multiply.199 = fmul float %144, %146
  %add.2010 = fadd float %multiply.148, %multiply.199
  %multiply.2311 = fmul float %106, %add.2010
  %subtract.2412 = fsub float %105, %multiply.2311
  %147 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %subtract.2412, ptr %147, align 4
  %148 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %149 = load float, ptr %148, align 4, !invariant.load !81
  %150 = load float, ptr %arg1, align 4, !invariant.load !81
  %151 = add i32 %14, 0
  %152 = add i32 %13, 0
  %153 = mul nuw nsw i32 %152, 1
  %154 = add nuw nsw i32 0, %153
  %155 = urem i32 %154, 8
  %156 = udiv i32 %154, 8
  %157 = udiv i32 %156, 17
  %158 = mul nuw nsw i32 %151, 1
  %159 = add nuw nsw i32 0, %158
  %160 = udiv i32 %159, 8192
  %161 = mul nuw nsw i32 %155, 1
  %162 = add nuw nsw i32 0, %161
  %163 = mul nuw nsw i32 %156, 8
  %164 = add nuw nsw i32 %162, %163
  %165 = udiv i32 %164, 136
  %166 = mul nuw nsw i32 %159, 1
  %167 = add nuw nsw i32 0, %166
  %168 = udiv i32 %167, 8192
  %169 = add i32 %167, 0
  %170 = add i32 %164, 832
  %171 = getelementptr inbounds [8192 x [968 x float]], ptr %arg5, i32 0, i32 %169, i32 %170
  %172 = load float, ptr %171, align 4, !invariant.load !81
  %173 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %169, i32 %170
  %174 = load float, ptr %173, align 4, !invariant.load !81
  %add.913 = fadd float %172, %174
  %175 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg4, i32 0, i32 %159, i32 %156, i32 0
  %176 = load float, ptr %175, align 4, !invariant.load !81
  %multiply.1414 = fmul float %add.913, %176
  %177 = mul nuw nsw i32 %155, 1
  %178 = add nuw nsw i32 0, %177
  %179 = mul nuw nsw i32 %156, 8
  %180 = add nuw nsw i32 %178, %179
  %181 = udiv i32 %180, 136
  %182 = mul nuw nsw i32 %159, 1
  %183 = add nuw nsw i32 0, %182
  %184 = udiv i32 %183, 8192
  %185 = add i32 %183, 0
  %186 = add i32 %180, 832
  %187 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %185, i32 %186
  %188 = load float, ptr %187, align 4, !invariant.load !81
  %189 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %159, i32 %156, i32 0
  %190 = load float, ptr %189, align 4, !invariant.load !81
  %multiply.1915 = fmul float %188, %190
  %add.2016 = fadd float %multiply.1414, %multiply.1915
  %multiply.2317 = fmul float %150, %add.2016
  %subtract.2418 = fsub float %149, %multiply.2317
  %191 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %subtract.2418, ptr %191, align 4
  br label %fusion_24.in_bounds-after
}

define void @fusion_23(ptr noalias align 16 dereferenceable(786432) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(557056) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 16 dereferenceable(557056) %arg4, ptr noalias align 16 dereferenceable(31719424) %arg5, ptr noalias align 16 dereferenceable(31719424) %arg6, ptr noalias align 128 dereferenceable(786432) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !139
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !127
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 49152
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 24
  %5 = udiv i32 %linear_index_base, 24
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 24
  %8 = udiv i32 %linear_index1, 24
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 24
  %11 = udiv i32 %linear_index2, 24
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 24
  %14 = udiv i32 %linear_index3, 24
  %15 = icmp ult i32 %linear_index_base, 196608
  br i1 %15, label %fusion_23.in_bounds-true, label %fusion_23.in_bounds-after

fusion_23.in_bounds-after:                        ; preds = %fusion_23.in_bounds-true, %entry
  ret void

fusion_23.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !81
  %18 = load float, ptr %arg1, align 4, !invariant.load !81
  %19 = add i32 %5, 0
  %20 = add i32 %4, 112
  %21 = mul nuw nsw i32 %20, 1
  %22 = add nuw nsw i32 0, %21
  %23 = urem i32 %22, 8
  %24 = udiv i32 %22, 8
  %25 = udiv i32 %24, 17
  %26 = mul nuw nsw i32 %19, 1
  %27 = add nuw nsw i32 0, %26
  %28 = udiv i32 %27, 8192
  %29 = mul nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 0, %29
  %31 = mul nuw nsw i32 %24, 8
  %32 = add nuw nsw i32 %30, %31
  %33 = udiv i32 %32, 136
  %34 = mul nuw nsw i32 %27, 1
  %35 = add nuw nsw i32 0, %34
  %36 = udiv i32 %35, 8192
  %37 = add i32 %35, 0
  %38 = add i32 %32, 832
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr %arg5, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !81
  %41 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %37, i32 %38
  %42 = load float, ptr %41, align 4, !invariant.load !81
  %add.9 = fadd float %40, %42
  %43 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg4, i32 0, i32 %27, i32 %24, i32 0
  %44 = load float, ptr %43, align 4, !invariant.load !81
  %multiply.14 = fmul float %add.9, %44
  %45 = mul nuw nsw i32 %23, 1
  %46 = add nuw nsw i32 0, %45
  %47 = mul nuw nsw i32 %24, 8
  %48 = add nuw nsw i32 %46, %47
  %49 = udiv i32 %48, 136
  %50 = mul nuw nsw i32 %27, 1
  %51 = add nuw nsw i32 0, %50
  %52 = udiv i32 %51, 8192
  %53 = add i32 %51, 0
  %54 = add i32 %48, 832
  %55 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %53, i32 %54
  %56 = load float, ptr %55, align 4, !invariant.load !81
  %57 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %27, i32 %24, i32 0
  %58 = load float, ptr %57, align 4, !invariant.load !81
  %multiply.19 = fmul float %56, %58
  %add.20 = fadd float %multiply.14, %multiply.19
  %multiply.23 = fmul float %18, %add.20
  %subtract.24 = fsub float %17, %multiply.23
  %59 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %subtract.24, ptr %59, align 4
  %60 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %61 = load float, ptr %60, align 4, !invariant.load !81
  %62 = load float, ptr %arg1, align 4, !invariant.load !81
  %63 = add i32 %8, 0
  %64 = add i32 %7, 112
  %65 = mul nuw nsw i32 %64, 1
  %66 = add nuw nsw i32 0, %65
  %67 = urem i32 %66, 8
  %68 = udiv i32 %66, 8
  %69 = udiv i32 %68, 17
  %70 = mul nuw nsw i32 %63, 1
  %71 = add nuw nsw i32 0, %70
  %72 = udiv i32 %71, 8192
  %73 = mul nuw nsw i32 %67, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %68, 8
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 136
  %78 = mul nuw nsw i32 %71, 1
  %79 = add nuw nsw i32 0, %78
  %80 = udiv i32 %79, 8192
  %81 = add i32 %79, 0
  %82 = add i32 %76, 832
  %83 = getelementptr inbounds [8192 x [968 x float]], ptr %arg5, i32 0, i32 %81, i32 %82
  %84 = load float, ptr %83, align 4, !invariant.load !81
  %85 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %81, i32 %82
  %86 = load float, ptr %85, align 4, !invariant.load !81
  %add.91 = fadd float %84, %86
  %87 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg4, i32 0, i32 %71, i32 %68, i32 0
  %88 = load float, ptr %87, align 4, !invariant.load !81
  %multiply.142 = fmul float %add.91, %88
  %89 = mul nuw nsw i32 %67, 1
  %90 = add nuw nsw i32 0, %89
  %91 = mul nuw nsw i32 %68, 8
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 136
  %94 = mul nuw nsw i32 %71, 1
  %95 = add nuw nsw i32 0, %94
  %96 = udiv i32 %95, 8192
  %97 = add i32 %95, 0
  %98 = add i32 %92, 832
  %99 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %97, i32 %98
  %100 = load float, ptr %99, align 4, !invariant.load !81
  %101 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %71, i32 %68, i32 0
  %102 = load float, ptr %101, align 4, !invariant.load !81
  %multiply.193 = fmul float %100, %102
  %add.204 = fadd float %multiply.142, %multiply.193
  %multiply.235 = fmul float %62, %add.204
  %subtract.246 = fsub float %61, %multiply.235
  %103 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %subtract.246, ptr %103, align 4
  %104 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %105 = load float, ptr %104, align 4, !invariant.load !81
  %106 = load float, ptr %arg1, align 4, !invariant.load !81
  %107 = add i32 %11, 0
  %108 = add i32 %10, 112
  %109 = mul nuw nsw i32 %108, 1
  %110 = add nuw nsw i32 0, %109
  %111 = urem i32 %110, 8
  %112 = udiv i32 %110, 8
  %113 = udiv i32 %112, 17
  %114 = mul nuw nsw i32 %107, 1
  %115 = add nuw nsw i32 0, %114
  %116 = udiv i32 %115, 8192
  %117 = mul nuw nsw i32 %111, 1
  %118 = add nuw nsw i32 0, %117
  %119 = mul nuw nsw i32 %112, 8
  %120 = add nuw nsw i32 %118, %119
  %121 = udiv i32 %120, 136
  %122 = mul nuw nsw i32 %115, 1
  %123 = add nuw nsw i32 0, %122
  %124 = udiv i32 %123, 8192
  %125 = add i32 %123, 0
  %126 = add i32 %120, 832
  %127 = getelementptr inbounds [8192 x [968 x float]], ptr %arg5, i32 0, i32 %125, i32 %126
  %128 = load float, ptr %127, align 4, !invariant.load !81
  %129 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %125, i32 %126
  %130 = load float, ptr %129, align 4, !invariant.load !81
  %add.97 = fadd float %128, %130
  %131 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg4, i32 0, i32 %115, i32 %112, i32 0
  %132 = load float, ptr %131, align 4, !invariant.load !81
  %multiply.148 = fmul float %add.97, %132
  %133 = mul nuw nsw i32 %111, 1
  %134 = add nuw nsw i32 0, %133
  %135 = mul nuw nsw i32 %112, 8
  %136 = add nuw nsw i32 %134, %135
  %137 = udiv i32 %136, 136
  %138 = mul nuw nsw i32 %115, 1
  %139 = add nuw nsw i32 0, %138
  %140 = udiv i32 %139, 8192
  %141 = add i32 %139, 0
  %142 = add i32 %136, 832
  %143 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %141, i32 %142
  %144 = load float, ptr %143, align 4, !invariant.load !81
  %145 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %115, i32 %112, i32 0
  %146 = load float, ptr %145, align 4, !invariant.load !81
  %multiply.199 = fmul float %144, %146
  %add.2010 = fadd float %multiply.148, %multiply.199
  %multiply.2311 = fmul float %106, %add.2010
  %subtract.2412 = fsub float %105, %multiply.2311
  %147 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %subtract.2412, ptr %147, align 4
  %148 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %149 = load float, ptr %148, align 4, !invariant.load !81
  %150 = load float, ptr %arg1, align 4, !invariant.load !81
  %151 = add i32 %14, 0
  %152 = add i32 %13, 112
  %153 = mul nuw nsw i32 %152, 1
  %154 = add nuw nsw i32 0, %153
  %155 = urem i32 %154, 8
  %156 = udiv i32 %154, 8
  %157 = udiv i32 %156, 17
  %158 = mul nuw nsw i32 %151, 1
  %159 = add nuw nsw i32 0, %158
  %160 = udiv i32 %159, 8192
  %161 = mul nuw nsw i32 %155, 1
  %162 = add nuw nsw i32 0, %161
  %163 = mul nuw nsw i32 %156, 8
  %164 = add nuw nsw i32 %162, %163
  %165 = udiv i32 %164, 136
  %166 = mul nuw nsw i32 %159, 1
  %167 = add nuw nsw i32 0, %166
  %168 = udiv i32 %167, 8192
  %169 = add i32 %167, 0
  %170 = add i32 %164, 832
  %171 = getelementptr inbounds [8192 x [968 x float]], ptr %arg5, i32 0, i32 %169, i32 %170
  %172 = load float, ptr %171, align 4, !invariant.load !81
  %173 = getelementptr inbounds [8192 x [968 x float]], ptr %arg6, i32 0, i32 %169, i32 %170
  %174 = load float, ptr %173, align 4, !invariant.load !81
  %add.913 = fadd float %172, %174
  %175 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg4, i32 0, i32 %159, i32 %156, i32 0
  %176 = load float, ptr %175, align 4, !invariant.load !81
  %multiply.1414 = fmul float %add.913, %176
  %177 = mul nuw nsw i32 %155, 1
  %178 = add nuw nsw i32 0, %177
  %179 = mul nuw nsw i32 %156, 8
  %180 = add nuw nsw i32 %178, %179
  %181 = udiv i32 %180, 136
  %182 = mul nuw nsw i32 %159, 1
  %183 = add nuw nsw i32 0, %182
  %184 = udiv i32 %183, 8192
  %185 = add i32 %183, 0
  %186 = add i32 %180, 832
  %187 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %185, i32 %186
  %188 = load float, ptr %187, align 4, !invariant.load !81
  %189 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %159, i32 %156, i32 0
  %190 = load float, ptr %189, align 4, !invariant.load !81
  %multiply.1915 = fmul float %188, %190
  %add.2016 = fadd float %multiply.1414, %multiply.1915
  %multiply.2317 = fmul float %150, %add.2016
  %subtract.2418 = fsub float %149, %multiply.2317
  %191 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %subtract.2418, ptr %191, align 4
  br label %fusion_23.in_bounds-after
}

define void @fusion_11(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !140
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_11.in_bounds-true, label %fusion_11.in_bounds-after

fusion_11.in_bounds-after:                        ; preds = %fusion_11.in_bounds-true, %entry
  ret void

fusion_11.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.9 = fmul float %9, %11
  %subtract.10 = fsub float %8, %multiply.9
  %12 = insertvalue { float, float, float } undef, float %subtract.10, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !81
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.11 = fmul float %9, %16
  %subtract.12 = fsub float %14, %multiply.11
  %17 = insertvalue { float, float, float } %12, float %subtract.12, 1
  %18 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %19 = load float, ptr %18, align 4, !invariant.load !81
  %20 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %21 = load float, ptr %20, align 4
  %multiply.13 = fmul float %9, %21
  %subtract.14 = fsub float %19, %multiply.13
  %22 = insertvalue { float, float, float } %17, float %subtract.14, 2
  %23 = extractvalue { float, float, float } %22, 0
  %24 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %23, ptr %24, align 4
  %25 = extractvalue { float, float, float } %22, 1
  %26 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %25, ptr %26, align 4
  %27 = extractvalue { float, float, float } %22, 2
  %28 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %27, ptr %28, align 4
  br label %fusion_11.in_bounds-after
}

define void @fusion_7(ptr noalias align 16 dereferenceable(16384) %arg0, ptr noalias align 128 dereferenceable(16384) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !141
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 4096
  br i1 %6, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %fusion_7.in_bounds-true, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_7.in_bounds-after
}

define void @fusion_6(ptr noalias align 16 dereferenceable(917504) %arg0, ptr noalias align 128 dereferenceable(917504) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !142
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !127
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 57344
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index_base, 512
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 512
  %8 = udiv i32 %linear_index1, 512
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 512
  %11 = udiv i32 %linear_index2, 512
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 512
  %14 = udiv i32 %linear_index3, 512
  %15 = icmp ult i32 %linear_index_base, 229376
  br i1 %15, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %fusion_6.in_bounds-true, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !81
  %18 = load float, ptr %arg2, align 4, !invariant.load !81
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4
  %multiply.5 = fmul float %18, %20
  %subtract.6 = fsub float %17, %multiply.5
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %subtract.6, ptr %21, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %23 = load float, ptr %22, align 4, !invariant.load !81
  %24 = load float, ptr %arg2, align 4, !invariant.load !81
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4
  %multiply.51 = fmul float %24, %26
  %subtract.62 = fsub float %23, %multiply.51
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %subtract.62, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4, !invariant.load !81
  %30 = load float, ptr %arg2, align 4, !invariant.load !81
  %31 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %32 = load float, ptr %31, align 4
  %multiply.53 = fmul float %30, %32
  %subtract.64 = fsub float %29, %multiply.53
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %subtract.64, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %35 = load float, ptr %34, align 4, !invariant.load !81
  %36 = load float, ptr %arg2, align 4, !invariant.load !81
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %multiply.55 = fmul float %36, %38
  %subtract.66 = fsub float %35, %multiply.55
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %subtract.66, ptr %39, align 4
  br label %fusion_6.in_bounds-after
}

define void @fusion_5(ptr noalias align 16 dereferenceable(262144) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 16 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 65536
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 65536
  br i1 %6, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %fusion_5.in_bounds-true, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.9 = fmul float %9, %11
  %subtract.10 = fsub float %8, %multiply.9
  %12 = insertvalue { float, float, float } undef, float %subtract.10, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !81
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.11 = fmul float %9, %16
  %subtract.12 = fsub float %14, %multiply.11
  %17 = insertvalue { float, float, float } %12, float %subtract.12, 1
  %18 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %19 = load float, ptr %18, align 4, !invariant.load !81
  %20 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %21 = load float, ptr %20, align 4
  %multiply.13 = fmul float %9, %21
  %subtract.14 = fsub float %19, %multiply.13
  %22 = insertvalue { float, float, float } %17, float %subtract.14, 2
  %23 = extractvalue { float, float, float } %22, 0
  %24 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %23, ptr %24, align 4
  %25 = extractvalue { float, float, float } %22, 1
  %26 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %25, ptr %26, align 4
  %27 = extractvalue { float, float, float } %22, 2
  %28 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %27, ptr %28, align 4
  br label %fusion_5.in_bounds-after
}

define void @fusion_2(ptr noalias align 16 dereferenceable(98304) %arg0, ptr noalias align 128 dereferenceable(98304) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !143
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24576
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 24576
  br i1 %6, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %fusion_2.in_bounds-true, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_2.in_bounds-after
}

define void @fusion(ptr noalias align 16 dereferenceable(49152) %arg0, ptr noalias align 128 dereferenceable(49152) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !144
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !75
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 12288
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 12288
  br i1 %6, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !81
  %9 = load float, ptr %arg2, align 4, !invariant.load !81
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}

!0 = !{ptr @fusion_71, !"kernel", i32 1}
!1 = !{ptr @fusion_71, !"reqntidx", i32 1024}
!2 = !{ptr @fusion_79, !"kernel", i32 1}
!3 = !{ptr @fusion_79, !"reqntidx", i32 1024}
!4 = !{ptr @fusion_73, !"kernel", i32 1}
!5 = !{ptr @fusion_73, !"reqntidx", i32 64}
!6 = !{ptr @fusion_69, !"kernel", i32 1}
!7 = !{ptr @fusion_69, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_66, !"kernel", i32 1}
!9 = !{ptr @fusion_66, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_81, !"kernel", i32 1}
!11 = !{ptr @fusion_81, !"reqntidx", i32 1024}
!12 = !{ptr @fusion_65, !"kernel", i32 1}
!13 = !{ptr @fusion_65, !"reqntidx", i32 128}
!14 = !{ptr @fusion_61, !"kernel", i32 1}
!15 = !{ptr @fusion_61, !"reqntidx", i32 1024}
!16 = !{ptr @fusion_58, !"kernel", i32 1}
!17 = !{ptr @fusion_58, !"reqntidx", i32 96}
!18 = !{ptr @fusion_56, !"kernel", i32 1}
!19 = !{ptr @fusion_56, !"reqntidx", i32 96}
!20 = !{ptr @fusion_54, !"kernel", i32 1}
!21 = !{ptr @fusion_54, !"reqntidx", i32 1024}
!22 = !{ptr @fusion_83, !"kernel", i32 1}
!23 = !{ptr @fusion_83, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_53, !"kernel", i32 1}
!25 = !{ptr @fusion_53, !"reqntidx", i32 30}
!26 = !{ptr @fusion_52, !"kernel", i32 1}
!27 = !{ptr @fusion_52, !"reqntidx", i32 1024}
!28 = !{ptr @fusion_50, !"kernel", i32 1}
!29 = !{ptr @fusion_50, !"reqntidx", i32 1024}
!30 = !{ptr @fusion_85, !"kernel", i32 1}
!31 = !{ptr @fusion_85, !"reqntidx", i32 1024}
!32 = !{ptr @fusion_49, !"kernel", i32 1}
!33 = !{ptr @fusion_49, !"reqntidx", i32 512}
!34 = !{ptr @fusion_48, !"kernel", i32 1}
!35 = !{ptr @fusion_48, !"reqntidx", i32 256}
!36 = !{ptr @fusion_78, !"kernel", i32 1}
!37 = !{ptr @fusion_78, !"reqntidx", i32 256}
!38 = !{ptr @fusion_46, !"kernel", i32 1}
!39 = !{ptr @fusion_46, !"reqntidx", i32 256}
!40 = !{ptr @fusion_44, !"kernel", i32 1}
!41 = !{ptr @fusion_44, !"reqntidx", i32 1024}
!42 = !{ptr @reduce_208, !"kernel", i32 1}
!43 = !{ptr @reduce_208, !"reqntidx", i32 1024}
!44 = !{ptr @fusion_43, !"kernel", i32 1}
!45 = !{ptr @fusion_43, !"reqntidx", i32 968}
!46 = !{ptr @fusion_42, !"kernel", i32 1}
!47 = !{ptr @fusion_42, !"reqntidx", i32 256}
!48 = !{ptr @fusion_41, !"kernel", i32 1}
!49 = !{ptr @fusion_41, !"reqntidx", i32 1024}
!50 = !{ptr @fusion_40, !"kernel", i32 1}
!51 = !{ptr @fusion_40, !"reqntidx", i32 1024}
!52 = !{ptr @fusion_39, !"kernel", i32 1}
!53 = !{ptr @fusion_39, !"reqntidx", i32 1024}
!54 = !{ptr @fusion_30, !"kernel", i32 1}
!55 = !{ptr @fusion_30, !"reqntidx", i32 256}
!56 = !{ptr @fusion_27, !"kernel", i32 1}
!57 = !{ptr @fusion_27, !"reqntidx", i32 128}
!58 = !{ptr @fusion_24, !"kernel", i32 1}
!59 = !{ptr @fusion_24, !"reqntidx", i32 256}
!60 = !{ptr @fusion_23, !"kernel", i32 1}
!61 = !{ptr @fusion_23, !"reqntidx", i32 256}
!62 = !{ptr @fusion_11, !"kernel", i32 1}
!63 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!64 = !{ptr @fusion_7, !"kernel", i32 1}
!65 = !{ptr @fusion_7, !"reqntidx", i32 1024}
!66 = !{ptr @fusion_6, !"kernel", i32 1}
!67 = !{ptr @fusion_6, !"reqntidx", i32 256}
!68 = !{ptr @fusion_5, !"kernel", i32 1}
!69 = !{ptr @fusion_5, !"reqntidx", i32 1024}
!70 = !{ptr @fusion_2, !"kernel", i32 1}
!71 = !{ptr @fusion_2, !"reqntidx", i32 1024}
!72 = !{ptr @fusion, !"kernel", i32 1}
!73 = !{ptr @fusion, !"reqntidx", i32 1024}
!74 = !{i32 0, i32 1}
!75 = !{i32 0, i32 1024}
!76 = !{i32 0, i32 64}
!77 = distinct !{!77, !78, !79}
!78 = !{!"llvm.loop.vectorize.enable", i1 false}
!79 = !{!"llvm.loop.unroll.full"}
!80 = distinct !{!80, !78}
!81 = !{}
!82 = !{i32 0, i32 2}
!83 = distinct !{!83, !78, !79}
!84 = distinct !{!84, !78}
!85 = distinct !{!85, !78, !79}
!86 = distinct !{!86, !78}
!87 = !{i32 0, i32 8}
!88 = !{i32 0, i32 128}
!89 = distinct !{!89, !78, !79}
!90 = distinct !{!90, !78}
!91 = distinct !{!91, !78, !79}
!92 = distinct !{!92, !78}
!93 = distinct !{!93, !78, !79}
!94 = distinct !{!94, !78}
!95 = !{i32 0, i32 16}
!96 = !{i32 0, i32 96}
!97 = !{i32 0, i32 35499}
!98 = distinct !{!98, !78}
!99 = distinct !{!99, !78, !79}
!100 = distinct !{!100, !78, !79}
!101 = distinct !{!101, !78}
!102 = distinct !{!102, !78, !79}
!103 = distinct !{!103, !78, !79}
!104 = !{i32 0, i32 11606}
!105 = distinct !{!105, !78}
!106 = distinct !{!106, !78, !79}
!107 = distinct !{!107, !78, !79}
!108 = distinct !{!108, !78}
!109 = distinct !{!109, !78, !79}
!110 = distinct !{!110, !78, !79}
!111 = distinct !{!111, !78, !79}
!112 = distinct !{!112, !78}
!113 = distinct !{!113, !78, !79}
!114 = distinct !{!114, !78}
!115 = distinct !{!115, !78, !79}
!116 = distinct !{!116, !78}
!117 = !{i32 0, i32 30}
!118 = !{i32 0, i32 15}
!119 = !{i32 0, i32 512}
!120 = distinct !{!120, !78, !79}
!121 = distinct !{!121, !78}
!122 = distinct !{!122, !78, !79}
!123 = distinct !{!123, !78}
!124 = distinct !{!124, !78, !79}
!125 = distinct !{!125, !78}
!126 = !{i32 0, i32 580}
!127 = !{i32 0, i32 256}
!128 = !{i32 0, i32 1984}
!129 = distinct !{!129, !78, !79}
!130 = distinct !{!130, !78}
!131 = !{i32 0, i32 31}
!132 = distinct !{!132, !78, !79}
!133 = distinct !{!133, !78}
!134 = !{i32 0, i32 968}
!135 = !{i32 0, i32 3584}
!136 = !{i32 0, i32 864}
!137 = distinct !{!137, !78}
!138 = !{i32 0, i32 384}
!139 = !{i32 0, i32 192}
!140 = !{i32 0, i32 32}
!141 = !{i32 0, i32 4}
!142 = !{i32 0, i32 224}
!143 = !{i32 0, i32 24}
!144 = !{i32 0, i32 12}
