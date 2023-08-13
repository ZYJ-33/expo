target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_9 = constant [64 x i8] zeroinitializer, align 128
@buffer_for_constant_8 = constant [64 x i8] c"\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache = private addrspace(3) global [1 x [1 x [16 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@shared_cache1 = private addrspace(3) global [1 x [1 x [16 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@3 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@4 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache2 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache3 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache4 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache5 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache6 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@5 = private unnamed_addr constant [4 x i8] zeroinitializer
@6 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache7 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@8 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache8 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache9 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @fusion_27(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(4) %arg4, ptr noalias align 128 dereferenceable(4) %arg5) {
entry:
  %return_buffer195 = alloca float, align 4
  %result_from_other_lane193 = alloca float, align 4
  %return_buffer192 = alloca float, align 4
  %result_from_other_lane190 = alloca float, align 4
  %return_buffer189 = alloca float, align 4
  %result_from_other_lane187 = alloca float, align 4
  %return_buffer186 = alloca float, align 4
  %result_from_other_lane184 = alloca float, align 4
  %return_buffer183 = alloca float, align 4
  %result_from_other_lane181 = alloca float, align 4
  %initial_value_addr180 = alloca float, align 4
  %return_buffer175 = alloca float, align 4
  %result_from_other_lane173 = alloca float, align 4
  %return_buffer172 = alloca float, align 4
  %result_from_other_lane170 = alloca float, align 4
  %return_buffer169 = alloca float, align 4
  %result_from_other_lane167 = alloca float, align 4
  %return_buffer166 = alloca float, align 4
  %result_from_other_lane164 = alloca float, align 4
  %return_buffer163 = alloca float, align 4
  %result_from_other_lane161 = alloca float, align 4
  %return_buffer159 = alloca float, align 4
  %return_buffer145 = alloca float, align 4
  %tile_loop.invar_address129 = alloca i32, align 4
  %return_buffer125 = alloca float, align 4
  %return_buffer113 = alloca float, align 4
  %tile_loop.invar_address104 = alloca i32, align 4
  %y_in_tile.invar_address95 = alloca i32, align 4
  %partial_reduction_result81 = alloca float, align 4
  %reduction_input_address80 = alloca float, align 4
  %return_buffer79 = alloca float, align 4
  %result_from_other_lane77 = alloca float, align 4
  %return_buffer76 = alloca float, align 4
  %result_from_other_lane74 = alloca float, align 4
  %return_buffer73 = alloca float, align 4
  %result_from_other_lane71 = alloca float, align 4
  %return_buffer70 = alloca float, align 4
  %result_from_other_lane68 = alloca float, align 4
  %return_buffer67 = alloca float, align 4
  %result_from_other_lane65 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer64 = alloca float, align 4
  %result_from_other_lane62 = alloca float, align 4
  %return_buffer61 = alloca float, align 4
  %result_from_other_lane59 = alloca float, align 4
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer50 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %tile_loop.invar_address22 = alloca i32, align 4
  %return_buffer18 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !38
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %inter_warp_reduce-after179, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_27_constant_11 = load float, ptr @0, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_27_constant_11, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %6 = urem i32 %4, 512
  %7 = udiv i32 %4, 512
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 1
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 512
  %thread_id.y = udiv i32 %6, 512
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %9, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 1
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 1, i32 1
  %18 = icmp eq i32 %13, 0
  %tile_bound1 = select i1 %18, i32 8192, i32 8192
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 1
  %tile_origin.2 = mul i32 %13, 8192
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
  %21 = icmp eq i32 8192, %tile_bound1
  br i1 %21, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit19, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !41

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result51 = load float, ptr %current_output, align 4
  %22 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  store float %22, ptr %result_from_other_lane, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer52)
  %23 = load float, ptr %return_buffer52, align 4
  store float %23, ptr %current_output, align 4
  %partial_reduction_result54 = load float, ptr %current_output, align 4
  %24 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 8, i32 31)
  store float %24, ptr %result_from_other_lane53, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane53, ptr %return_buffer55)
  %25 = load float, ptr %return_buffer55, align 4
  store float %25, ptr %current_output, align 4
  %partial_reduction_result57 = load float, ptr %current_output, align 4
  %26 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 4, i32 31)
  store float %26, ptr %result_from_other_lane56, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane56, ptr %return_buffer58)
  %27 = load float, ptr %return_buffer58, align 4
  store float %27, ptr %current_output, align 4
  %partial_reduction_result60 = load float, ptr %current_output, align 4
  %28 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result60, i32 2, i32 31)
  store float %28, ptr %result_from_other_lane59, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane59, ptr %return_buffer61)
  %29 = load float, ptr %return_buffer61, align 4
  store float %29, ptr %current_output, align 4
  %partial_reduction_result63 = load float, ptr %current_output, align 4
  %30 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result63, i32 1, i32 31)
  store float %30, ptr %result_from_other_lane62, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane62, ptr %return_buffer64)
  %31 = load float, ptr %return_buffer64, align 4
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
  %35 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %36 = icmp uge i32 %tile_loop.indvar, 8
  br i1 %36, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %37 = icmp eq i32 %tile_loop.indvar, 0
  %38 = mul i32 %tile_loop.indvar, 1024
  %39 = add i32 %38, 0
  %x_loc = add i32 %39, %35
  %40 = add i32 %tile_origin.1, %y_in_tile.indvar
  %41 = add i32 %tile_origin.2, %x_loc
  %42 = mul nuw nsw i32 %41, 1
  %43 = add nuw nsw i32 0, %42
  %44 = mul nuw nsw i32 %40, 8192
  %45 = add nuw nsw i32 %43, %44
  %46 = mul nuw nsw i32 %tile_origin.0, 8192
  %47 = add nuw nsw i32 %45, %46
  %48 = udiv i32 %47, 1
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %47
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !43
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %47
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !43
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  %region_0_27_constant_6 = load float, ptr @1, align 4
  %Arg_0.15 = getelementptr inbounds float, ptr %arg0, i32 %47
  %Arg_0.16 = load float, ptr %Arg_0.15, align 4, !invariant.load !43
  %subtract.8 = fsub float %region_0_27_constant_6, %Arg_0.16
  %multiply.9 = fmul float %multiply.5, %subtract.8
  store float %multiply.9, ptr %reduction_input_address, align 4
  %49 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_12(ptr %49, ptr %reduction_input_address, ptr %return_buffer)
  %50 = load float, ptr %return_buffer, align 4
  store float %50, ptr %49, align 4
  %51 = mul i32 %tile_loop.indvar, 1024
  %52 = add i32 %51, 1
  %x_loc7 = add i32 %52, %35
  %53 = add i32 %tile_origin.1, %y_in_tile.indvar
  %54 = add i32 %tile_origin.2, %x_loc7
  %55 = mul nuw nsw i32 %54, 1
  %56 = add nuw nsw i32 0, %55
  %57 = mul nuw nsw i32 %53, 8192
  %58 = add nuw nsw i32 %56, %57
  %59 = mul nuw nsw i32 %tile_origin.0, 8192
  %60 = add nuw nsw i32 %58, %59
  %61 = udiv i32 %60, 1
  %Arg_1.28 = getelementptr inbounds float, ptr %arg1, i32 %60
  %Arg_1.29 = load float, ptr %Arg_1.28, align 4, !invariant.load !43
  %Arg_0.110 = getelementptr inbounds float, ptr %arg0, i32 %60
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !43
  %multiply.512 = fmul float %Arg_1.29, %Arg_0.111
  %region_0_27_constant_613 = load float, ptr @1, align 4
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %60
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !43
  %subtract.816 = fsub float %region_0_27_constant_613, %Arg_0.115
  %multiply.917 = fmul float %multiply.512, %subtract.816
  store float %multiply.917, ptr %reduction_input_address, align 4
  %62 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_12(ptr %62, ptr %reduction_input_address, ptr %return_buffer18)
  %63 = load float, ptr %return_buffer18, align 4
  store float %63, ptr %62, align 4
  br label %tile_loop.loop_header, !llvm.loop !44

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %64 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address22, align 4
  br label %tile_loop.loop_header20

tile_loop.loop_header20:                          ; preds = %x_in_tile-after39, %is_full_tile-false
  %tile_loop.indvar23 = load i32, ptr %tile_loop.invar_address22, align 4
  %65 = icmp uge i32 %tile_loop.indvar23, 8
  br i1 %65, label %tile_loop.loop_exit19, label %tile_loop.loop_body21

tile_loop.loop_body21:                            ; preds = %tile_loop.loop_header20
  %invar.inc24 = add nuw nsw i32 %tile_loop.indvar23, 1
  store i32 %invar.inc24, ptr %tile_loop.invar_address22, align 4
  %66 = icmp eq i32 %tile_loop.indvar23, 0
  %67 = mul i32 %tile_loop.indvar23, 1024
  %68 = add i32 %67, 0
  %x_loc25 = add i32 %68, %64
  %69 = add i32 %tile_origin.1, %y_in_tile.indvar
  %70 = add i32 %tile_origin.2, %x_loc25
  %71 = icmp ult i32 %x_loc25, %tile_bound1
  br i1 %71, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body21
  %72 = mul i32 %tile_loop.indvar23, 1024
  %73 = add i32 %72, 1
  %x_loc37 = add i32 %73, %64
  %74 = add i32 %tile_origin.1, %y_in_tile.indvar
  %75 = add i32 %tile_origin.2, %x_loc37
  %76 = icmp ult i32 %x_loc37, %tile_bound1
  br i1 %76, label %x_in_tile-true38, label %x_in_tile-after39

x_in_tile-after39:                                ; preds = %x_in_tile-true38, %x_in_tile-after
  br label %tile_loop.loop_header20, !llvm.loop !46

tile_loop.loop_exit19:                            ; preds = %tile_loop.loop_header20
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body21
  %77 = mul nuw nsw i32 %70, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %69, 8192
  %80 = add nuw nsw i32 %78, %79
  %81 = mul nuw nsw i32 %tile_origin.0, 8192
  %82 = add nuw nsw i32 %80, %81
  %83 = udiv i32 %82, 1
  %Arg_1.226 = getelementptr inbounds float, ptr %arg1, i32 %82
  %Arg_1.227 = load float, ptr %Arg_1.226, align 4, !invariant.load !43
  %Arg_0.128 = getelementptr inbounds float, ptr %arg0, i32 %82
  %Arg_0.129 = load float, ptr %Arg_0.128, align 4, !invariant.load !43
  %multiply.530 = fmul float %Arg_1.227, %Arg_0.129
  %region_0_27_constant_631 = load float, ptr @1, align 4
  %Arg_0.132 = getelementptr inbounds float, ptr %arg0, i32 %82
  %Arg_0.133 = load float, ptr %Arg_0.132, align 4, !invariant.load !43
  %subtract.834 = fsub float %region_0_27_constant_631, %Arg_0.133
  %multiply.935 = fmul float %multiply.530, %subtract.834
  store float %multiply.935, ptr %reduction_input_address, align 4
  %84 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_12(ptr %84, ptr %reduction_input_address, ptr %return_buffer36)
  %85 = load float, ptr %return_buffer36, align 4
  store float %85, ptr %84, align 4
  br label %x_in_tile-after

x_in_tile-true38:                                 ; preds = %x_in_tile-after
  %86 = mul nuw nsw i32 %75, 1
  %87 = add nuw nsw i32 0, %86
  %88 = mul nuw nsw i32 %74, 8192
  %89 = add nuw nsw i32 %87, %88
  %90 = mul nuw nsw i32 %tile_origin.0, 8192
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 1
  %Arg_1.240 = getelementptr inbounds float, ptr %arg1, i32 %91
  %Arg_1.241 = load float, ptr %Arg_1.240, align 4, !invariant.load !43
  %Arg_0.142 = getelementptr inbounds float, ptr %arg0, i32 %91
  %Arg_0.143 = load float, ptr %Arg_0.142, align 4, !invariant.load !43
  %multiply.544 = fmul float %Arg_1.241, %Arg_0.143
  %region_0_27_constant_645 = load float, ptr @1, align 4
  %Arg_0.146 = getelementptr inbounds float, ptr %arg0, i32 %91
  %Arg_0.147 = load float, ptr %Arg_0.146, align 4, !invariant.load !43
  %subtract.848 = fsub float %region_0_27_constant_645, %Arg_0.147
  %multiply.949 = fmul float %multiply.544, %subtract.848
  store float %multiply.949, ptr %reduction_input_address, align 4
  %93 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_12(ptr %93, ptr %reduction_input_address, ptr %return_buffer50)
  %94 = load float, ptr %return_buffer50, align 4
  store float %94, ptr %93, align 4
  br label %x_in_tile-after39

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %95 = getelementptr inbounds [1 x [1 x [16 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %7, i32 0, i32 %32
  %96 = addrspacecast ptr addrspace(3) %95 to ptr
  %97 = load float, ptr %current_output, align 4
  store float %97, ptr %96, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %98 = getelementptr inbounds [1 x [1 x [16 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %7, i32 0, i32 %lane_id
  %99 = addrspacecast ptr addrspace(3) %98 to ptr
  store float %region_0_27_constant_11, ptr %initial_value_addr, align 4
  %100 = icmp ult i32 %thread_id.x, 16
  %101 = select i1 %100, ptr %99, ptr %initial_value_addr
  %partial_reduction_result66 = load float, ptr %101, align 4
  %102 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result66, i32 16, i32 31)
  store float %102, ptr %result_from_other_lane65, align 4
  call void @region_1_12(ptr %101, ptr %result_from_other_lane65, ptr %return_buffer67)
  %103 = load float, ptr %return_buffer67, align 4
  store float %103, ptr %101, align 4
  %partial_reduction_result69 = load float, ptr %101, align 4
  %104 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result69, i32 8, i32 31)
  store float %104, ptr %result_from_other_lane68, align 4
  call void @region_1_12(ptr %101, ptr %result_from_other_lane68, ptr %return_buffer70)
  %105 = load float, ptr %return_buffer70, align 4
  store float %105, ptr %101, align 4
  %partial_reduction_result72 = load float, ptr %101, align 4
  %106 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result72, i32 4, i32 31)
  store float %106, ptr %result_from_other_lane71, align 4
  call void @region_1_12(ptr %101, ptr %result_from_other_lane71, ptr %return_buffer73)
  %107 = load float, ptr %return_buffer73, align 4
  store float %107, ptr %101, align 4
  %partial_reduction_result75 = load float, ptr %101, align 4
  %108 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result75, i32 2, i32 31)
  store float %108, ptr %result_from_other_lane74, align 4
  call void @region_1_12(ptr %101, ptr %result_from_other_lane74, ptr %return_buffer76)
  %109 = load float, ptr %return_buffer76, align 4
  store float %109, ptr %101, align 4
  %partial_reduction_result78 = load float, ptr %101, align 4
  %110 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result78, i32 1, i32 31)
  store float %110, ptr %result_from_other_lane77, align 4
  call void @region_1_12(ptr %101, ptr %result_from_other_lane77, ptr %return_buffer79)
  %111 = load float, ptr %return_buffer79, align 4
  store float %111, ptr %101, align 4
  %112 = icmp eq i32 %thread_id.x, 0
  br i1 %112, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %113 = mul i32 %thread_id.x, 2
  %114 = add i32 %tile_origin.1, %thread_id.y
  %115 = add i32 %tile_origin.2, %113
  %116 = add i32 %115, 0
  %output = load float, ptr %101, align 4
  store float %output, ptr %arg4, align 4
  br label %reduction_write_output-after

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %region_0_27_constant_1182 = load float, ptr @0, align 4
  %117 = getelementptr inbounds float, ptr %partial_reduction_result81, i32 0
  store float %region_0_27_constant_1182, ptr %117, align 4
  %118 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %119 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %120 = urem i32 %118, 512
  %121 = udiv i32 %118, 512
  %122 = mul i32 %119, 1
  %123 = add i32 %122, %121
  %124 = icmp ult i32 %123, 1
  br i1 %124, label %125, label %early_return83

125:                                              ; preds = %reduce-group-1-true
  %thread_id.x84 = urem i32 %120, 512
  %thread_id.y85 = udiv i32 %120, 512
  %lane_id86 = urem i32 %120, 32
  %126 = udiv i32 %123, 1
  %127 = urem i32 %126, 1
  %128 = udiv i32 %123, 1
  %129 = urem i32 %128, 1
  %130 = udiv i32 %123, 1
  %131 = icmp eq i32 %129, 0
  %tile_bound87 = select i1 %131, i32 1, i32 1
  %132 = icmp eq i32 %127, 0
  %tile_bound88 = select i1 %132, i32 8192, i32 8192
  %tile_origin.089 = mul i32 %130, 1
  %tile_origin.190 = mul i32 %129, 1
  %tile_origin.291 = mul i32 %127, 8192
  store i32 %thread_id.y85, ptr %y_in_tile.invar_address95, align 4
  br label %y_in_tile.loop_header93

y_in_tile.loop_header93:                          ; preds = %is_full_tile-after100, %125
  %y_in_tile.indvar96 = load i32, ptr %y_in_tile.invar_address95, align 4
  %133 = icmp uge i32 %y_in_tile.indvar96, %tile_bound87
  br i1 %133, label %y_in_tile.loop_exit92, label %y_in_tile.loop_body94

y_in_tile.loop_body94:                            ; preds = %y_in_tile.loop_header93
  %invar.inc97 = add nuw nsw i32 %y_in_tile.indvar96, 1
  store i32 %invar.inc97, ptr %y_in_tile.invar_address95, align 4
  %134 = icmp eq i32 %y_in_tile.indvar96, %thread_id.y85
  %135 = icmp eq i32 8192, %tile_bound88
  br i1 %135, label %is_full_tile-true98, label %is_full_tile-false99

is_full_tile-after100:                            ; preds = %tile_loop.loop_exit126, %tile_loop.loop_exit101
  br label %y_in_tile.loop_header93, !llvm.loop !47

y_in_tile.loop_exit92:                            ; preds = %y_in_tile.loop_header93
  %current_output160 = getelementptr inbounds float, ptr %partial_reduction_result81, i32 0
  %partial_reduction_result162 = load float, ptr %current_output160, align 4
  %136 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result162, i32 16, i32 31)
  store float %136, ptr %result_from_other_lane161, align 4
  call void @region_2_21(ptr %current_output160, ptr %result_from_other_lane161, ptr %return_buffer163)
  %137 = load float, ptr %return_buffer163, align 4
  store float %137, ptr %current_output160, align 4
  %partial_reduction_result165 = load float, ptr %current_output160, align 4
  %138 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result165, i32 8, i32 31)
  store float %138, ptr %result_from_other_lane164, align 4
  call void @region_2_21(ptr %current_output160, ptr %result_from_other_lane164, ptr %return_buffer166)
  %139 = load float, ptr %return_buffer166, align 4
  store float %139, ptr %current_output160, align 4
  %partial_reduction_result168 = load float, ptr %current_output160, align 4
  %140 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result168, i32 4, i32 31)
  store float %140, ptr %result_from_other_lane167, align 4
  call void @region_2_21(ptr %current_output160, ptr %result_from_other_lane167, ptr %return_buffer169)
  %141 = load float, ptr %return_buffer169, align 4
  store float %141, ptr %current_output160, align 4
  %partial_reduction_result171 = load float, ptr %current_output160, align 4
  %142 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result171, i32 2, i32 31)
  store float %142, ptr %result_from_other_lane170, align 4
  call void @region_2_21(ptr %current_output160, ptr %result_from_other_lane170, ptr %return_buffer172)
  %143 = load float, ptr %return_buffer172, align 4
  store float %143, ptr %current_output160, align 4
  %partial_reduction_result174 = load float, ptr %current_output160, align 4
  %144 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result174, i32 1, i32 31)
  store float %144, ptr %result_from_other_lane173, align 4
  call void @region_2_21(ptr %current_output160, ptr %result_from_other_lane173, ptr %return_buffer175)
  %145 = load float, ptr %return_buffer175, align 4
  store float %145, ptr %current_output160, align 4
  %146 = udiv i32 %thread_id.x84, 32
  %147 = icmp eq i32 %lane_id86, 0
  br i1 %147, label %intra_warp_reduce_write-true176, label %intra_warp_reduce_write-after177

intra_warp_reduce_write-after177:                 ; preds = %intra_warp_reduce_write-true176, %y_in_tile.loop_exit92
  call void @llvm.nvvm.barrier0()
  %148 = icmp eq i32 %146, 0
  br i1 %148, label %inter_warp_reduce-true178, label %inter_warp_reduce-after179

inter_warp_reduce-after179:                       ; preds = %reduction_write_output-after197, %intra_warp_reduce_write-after177
  br label %reduce-group-1-after

early_return83:                                   ; preds = %reduce-group-1-true
  ret void

is_full_tile-true98:                              ; preds = %y_in_tile.loop_body94
  %149 = mul i32 %thread_id.x84, 2
  store i32 0, ptr %tile_loop.invar_address104, align 4
  br label %tile_loop.loop_header102

tile_loop.loop_header102:                         ; preds = %tile_loop.loop_body103, %is_full_tile-true98
  %tile_loop.indvar105 = load i32, ptr %tile_loop.invar_address104, align 4
  %150 = icmp uge i32 %tile_loop.indvar105, 8
  br i1 %150, label %tile_loop.loop_exit101, label %tile_loop.loop_body103

tile_loop.loop_body103:                           ; preds = %tile_loop.loop_header102
  %invar.inc106 = add nuw nsw i32 %tile_loop.indvar105, 1
  store i32 %invar.inc106, ptr %tile_loop.invar_address104, align 4
  %151 = icmp eq i32 %tile_loop.indvar105, 0
  %152 = mul i32 %tile_loop.indvar105, 1024
  %153 = add i32 %152, 0
  %x_loc107 = add i32 %153, %149
  %154 = add i32 %tile_origin.190, %y_in_tile.indvar96
  %155 = add i32 %tile_origin.291, %x_loc107
  %156 = mul nuw nsw i32 %155, 1
  %157 = add nuw nsw i32 0, %156
  %158 = mul nuw nsw i32 %154, 8192
  %159 = add nuw nsw i32 %157, %158
  %160 = mul nuw nsw i32 %tile_origin.089, 8192
  %161 = add nuw nsw i32 %159, %160
  %162 = udiv i32 %161, 1
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %161
  %Arg_3.4108 = load float, ptr %Arg_3.4, align 4, !invariant.load !43
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %161
  %Arg_2.3109 = load float, ptr %Arg_2.3, align 4, !invariant.load !43
  %multiply.17 = fmul float %Arg_3.4108, %Arg_2.3109
  %region_0_27_constant_6110 = load float, ptr @1, align 4
  %Arg_2.3111 = getelementptr inbounds float, ptr %arg2, i32 %161
  %Arg_2.3112 = load float, ptr %Arg_2.3111, align 4, !invariant.load !43
  %subtract.18 = fsub float %region_0_27_constant_6110, %Arg_2.3112
  %multiply.19 = fmul float %multiply.17, %subtract.18
  store float %multiply.19, ptr %reduction_input_address80, align 4
  %163 = getelementptr inbounds float, ptr %partial_reduction_result81, i32 0
  call void @region_2_21(ptr %163, ptr %reduction_input_address80, ptr %return_buffer113)
  %164 = load float, ptr %return_buffer113, align 4
  store float %164, ptr %163, align 4
  %165 = mul i32 %tile_loop.indvar105, 1024
  %166 = add i32 %165, 1
  %x_loc114 = add i32 %166, %149
  %167 = add i32 %tile_origin.190, %y_in_tile.indvar96
  %168 = add i32 %tile_origin.291, %x_loc114
  %169 = mul nuw nsw i32 %168, 1
  %170 = add nuw nsw i32 0, %169
  %171 = mul nuw nsw i32 %167, 8192
  %172 = add nuw nsw i32 %170, %171
  %173 = mul nuw nsw i32 %tile_origin.089, 8192
  %174 = add nuw nsw i32 %172, %173
  %175 = udiv i32 %174, 1
  %Arg_3.4115 = getelementptr inbounds float, ptr %arg3, i32 %174
  %Arg_3.4116 = load float, ptr %Arg_3.4115, align 4, !invariant.load !43
  %Arg_2.3117 = getelementptr inbounds float, ptr %arg2, i32 %174
  %Arg_2.3118 = load float, ptr %Arg_2.3117, align 4, !invariant.load !43
  %multiply.17119 = fmul float %Arg_3.4116, %Arg_2.3118
  %region_0_27_constant_6120 = load float, ptr @1, align 4
  %Arg_2.3121 = getelementptr inbounds float, ptr %arg2, i32 %174
  %Arg_2.3122 = load float, ptr %Arg_2.3121, align 4, !invariant.load !43
  %subtract.18123 = fsub float %region_0_27_constant_6120, %Arg_2.3122
  %multiply.19124 = fmul float %multiply.17119, %subtract.18123
  store float %multiply.19124, ptr %reduction_input_address80, align 4
  %176 = getelementptr inbounds float, ptr %partial_reduction_result81, i32 0
  call void @region_2_21(ptr %176, ptr %reduction_input_address80, ptr %return_buffer125)
  %177 = load float, ptr %return_buffer125, align 4
  store float %177, ptr %176, align 4
  br label %tile_loop.loop_header102, !llvm.loop !48

tile_loop.loop_exit101:                           ; preds = %tile_loop.loop_header102
  br label %is_full_tile-after100

is_full_tile-false99:                             ; preds = %y_in_tile.loop_body94
  %178 = mul i32 %thread_id.x84, 2
  store i32 0, ptr %tile_loop.invar_address129, align 4
  br label %tile_loop.loop_header127

tile_loop.loop_header127:                         ; preds = %x_in_tile-after148, %is_full_tile-false99
  %tile_loop.indvar130 = load i32, ptr %tile_loop.invar_address129, align 4
  %179 = icmp uge i32 %tile_loop.indvar130, 8
  br i1 %179, label %tile_loop.loop_exit126, label %tile_loop.loop_body128

tile_loop.loop_body128:                           ; preds = %tile_loop.loop_header127
  %invar.inc131 = add nuw nsw i32 %tile_loop.indvar130, 1
  store i32 %invar.inc131, ptr %tile_loop.invar_address129, align 4
  %180 = icmp eq i32 %tile_loop.indvar130, 0
  %181 = mul i32 %tile_loop.indvar130, 1024
  %182 = add i32 %181, 0
  %x_loc132 = add i32 %182, %178
  %183 = add i32 %tile_origin.190, %y_in_tile.indvar96
  %184 = add i32 %tile_origin.291, %x_loc132
  %185 = icmp ult i32 %x_loc132, %tile_bound88
  br i1 %185, label %x_in_tile-true133, label %x_in_tile-after134

x_in_tile-after134:                               ; preds = %x_in_tile-true133, %tile_loop.loop_body128
  %186 = mul i32 %tile_loop.indvar130, 1024
  %187 = add i32 %186, 1
  %x_loc146 = add i32 %187, %178
  %188 = add i32 %tile_origin.190, %y_in_tile.indvar96
  %189 = add i32 %tile_origin.291, %x_loc146
  %190 = icmp ult i32 %x_loc146, %tile_bound88
  br i1 %190, label %x_in_tile-true147, label %x_in_tile-after148

x_in_tile-after148:                               ; preds = %x_in_tile-true147, %x_in_tile-after134
  br label %tile_loop.loop_header127, !llvm.loop !49

tile_loop.loop_exit126:                           ; preds = %tile_loop.loop_header127
  br label %is_full_tile-after100

x_in_tile-true133:                                ; preds = %tile_loop.loop_body128
  %191 = mul nuw nsw i32 %184, 1
  %192 = add nuw nsw i32 0, %191
  %193 = mul nuw nsw i32 %183, 8192
  %194 = add nuw nsw i32 %192, %193
  %195 = mul nuw nsw i32 %tile_origin.089, 8192
  %196 = add nuw nsw i32 %194, %195
  %197 = udiv i32 %196, 1
  %Arg_3.4135 = getelementptr inbounds float, ptr %arg3, i32 %196
  %Arg_3.4136 = load float, ptr %Arg_3.4135, align 4, !invariant.load !43
  %Arg_2.3137 = getelementptr inbounds float, ptr %arg2, i32 %196
  %Arg_2.3138 = load float, ptr %Arg_2.3137, align 4, !invariant.load !43
  %multiply.17139 = fmul float %Arg_3.4136, %Arg_2.3138
  %region_0_27_constant_6140 = load float, ptr @1, align 4
  %Arg_2.3141 = getelementptr inbounds float, ptr %arg2, i32 %196
  %Arg_2.3142 = load float, ptr %Arg_2.3141, align 4, !invariant.load !43
  %subtract.18143 = fsub float %region_0_27_constant_6140, %Arg_2.3142
  %multiply.19144 = fmul float %multiply.17139, %subtract.18143
  store float %multiply.19144, ptr %reduction_input_address80, align 4
  %198 = getelementptr inbounds float, ptr %partial_reduction_result81, i32 0
  call void @region_2_21(ptr %198, ptr %reduction_input_address80, ptr %return_buffer145)
  %199 = load float, ptr %return_buffer145, align 4
  store float %199, ptr %198, align 4
  br label %x_in_tile-after134

x_in_tile-true147:                                ; preds = %x_in_tile-after134
  %200 = mul nuw nsw i32 %189, 1
  %201 = add nuw nsw i32 0, %200
  %202 = mul nuw nsw i32 %188, 8192
  %203 = add nuw nsw i32 %201, %202
  %204 = mul nuw nsw i32 %tile_origin.089, 8192
  %205 = add nuw nsw i32 %203, %204
  %206 = udiv i32 %205, 1
  %Arg_3.4149 = getelementptr inbounds float, ptr %arg3, i32 %205
  %Arg_3.4150 = load float, ptr %Arg_3.4149, align 4, !invariant.load !43
  %Arg_2.3151 = getelementptr inbounds float, ptr %arg2, i32 %205
  %Arg_2.3152 = load float, ptr %Arg_2.3151, align 4, !invariant.load !43
  %multiply.17153 = fmul float %Arg_3.4150, %Arg_2.3152
  %region_0_27_constant_6154 = load float, ptr @1, align 4
  %Arg_2.3155 = getelementptr inbounds float, ptr %arg2, i32 %205
  %Arg_2.3156 = load float, ptr %Arg_2.3155, align 4, !invariant.load !43
  %subtract.18157 = fsub float %region_0_27_constant_6154, %Arg_2.3156
  %multiply.19158 = fmul float %multiply.17153, %subtract.18157
  store float %multiply.19158, ptr %reduction_input_address80, align 4
  %207 = getelementptr inbounds float, ptr %partial_reduction_result81, i32 0
  call void @region_2_21(ptr %207, ptr %reduction_input_address80, ptr %return_buffer159)
  %208 = load float, ptr %return_buffer159, align 4
  store float %208, ptr %207, align 4
  br label %x_in_tile-after148

intra_warp_reduce_write-true176:                  ; preds = %y_in_tile.loop_exit92
  %209 = getelementptr inbounds [1 x [1 x [16 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %121, i32 0, i32 %146
  %210 = addrspacecast ptr addrspace(3) %209 to ptr
  %211 = load float, ptr %current_output160, align 4
  store float %211, ptr %210, align 4
  br label %intra_warp_reduce_write-after177

inter_warp_reduce-true178:                        ; preds = %intra_warp_reduce_write-after177
  %212 = getelementptr inbounds [1 x [1 x [16 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %121, i32 0, i32 %lane_id86
  %213 = addrspacecast ptr addrspace(3) %212 to ptr
  store float %region_0_27_constant_1182, ptr %initial_value_addr180, align 4
  %214 = icmp ult i32 %thread_id.x84, 16
  %215 = select i1 %214, ptr %213, ptr %initial_value_addr180
  %partial_reduction_result182 = load float, ptr %215, align 4
  %216 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result182, i32 16, i32 31)
  store float %216, ptr %result_from_other_lane181, align 4
  call void @region_2_21(ptr %215, ptr %result_from_other_lane181, ptr %return_buffer183)
  %217 = load float, ptr %return_buffer183, align 4
  store float %217, ptr %215, align 4
  %partial_reduction_result185 = load float, ptr %215, align 4
  %218 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result185, i32 8, i32 31)
  store float %218, ptr %result_from_other_lane184, align 4
  call void @region_2_21(ptr %215, ptr %result_from_other_lane184, ptr %return_buffer186)
  %219 = load float, ptr %return_buffer186, align 4
  store float %219, ptr %215, align 4
  %partial_reduction_result188 = load float, ptr %215, align 4
  %220 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result188, i32 4, i32 31)
  store float %220, ptr %result_from_other_lane187, align 4
  call void @region_2_21(ptr %215, ptr %result_from_other_lane187, ptr %return_buffer189)
  %221 = load float, ptr %return_buffer189, align 4
  store float %221, ptr %215, align 4
  %partial_reduction_result191 = load float, ptr %215, align 4
  %222 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result191, i32 2, i32 31)
  store float %222, ptr %result_from_other_lane190, align 4
  call void @region_2_21(ptr %215, ptr %result_from_other_lane190, ptr %return_buffer192)
  %223 = load float, ptr %return_buffer192, align 4
  store float %223, ptr %215, align 4
  %partial_reduction_result194 = load float, ptr %215, align 4
  %224 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result194, i32 1, i32 31)
  store float %224, ptr %result_from_other_lane193, align 4
  call void @region_2_21(ptr %215, ptr %result_from_other_lane193, ptr %return_buffer195)
  %225 = load float, ptr %return_buffer195, align 4
  store float %225, ptr %215, align 4
  %226 = icmp eq i32 %thread_id.x84, 0
  br i1 %226, label %reduction_write_output-true196, label %reduction_write_output-after197

reduction_write_output-after197:                  ; preds = %reduction_write_output-true196, %inter_warp_reduce-true178
  br label %inter_warp_reduce-after179

reduction_write_output-true196:                   ; preds = %inter_warp_reduce-true178
  %227 = mul i32 %thread_id.x84, 2
  %228 = add i32 %tile_origin.190, %thread_id.y85
  %229 = add i32 %tile_origin.291, %227
  %230 = add i32 %229, 0
  %output198 = load float, ptr %215, align 4
  store float %output198, ptr %arg5, align 4
  br label %reduction_write_output-after197
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

define internal void @region_1_12(ptr dereferenceable(4) %Arg_0.13.typed, ptr dereferenceable(4) %Arg_1.14.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.15.typed = alloca float, align 4
  %Arg_0.13 = load float, ptr %Arg_0.13.typed, align 4
  %Arg_1.14 = load float, ptr %Arg_1.14.typed, align 4
  %add.15 = fadd float %Arg_0.13, %Arg_1.14
  store float %add.15, ptr %add.15.typed, align 4
  %load_ret_value = load float, ptr %add.15.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #1

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

define internal void @region_2_21(ptr dereferenceable(4) %Arg_0.22.typed, ptr dereferenceable(4) %Arg_1.23.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.24.typed = alloca float, align 4
  %Arg_0.22 = load float, ptr %Arg_0.22.typed, align 4
  %Arg_1.23 = load float, ptr %Arg_1.23.typed, align 4
  %add.24 = fadd float %Arg_0.22, %Arg_1.23
  store float %add.24, ptr %add.24.typed, align 4
  %load_ret_value = load float, ptr %add.24.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_20(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(4) %arg3, ptr noalias align 128 dereferenceable(4) %arg4, ptr noalias align 128 dereferenceable(4) %arg5, ptr noalias align 128 dereferenceable(4) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !40
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %fusion_20.in_bounds-true, label %fusion_20.in_bounds-after

fusion_20.in_bounds-after:                        ; preds = %fusion_20.in_bounds-true, %entry
  ret void

fusion_20.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !43
  %7 = load float, ptr %arg2, align 4, !invariant.load !43
  %8 = load float, ptr %arg1, align 4, !invariant.load !43
  %multiply.8 = fmul float %7, %8
  %subtract.9 = fsub float %6, %multiply.8
  %9 = insertvalue { float, float } undef, float %subtract.9, 0
  %10 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !43
  %12 = load float, ptr %arg4, align 4, !invariant.load !43
  %multiply.11 = fmul float %7, %12
  %subtract.12 = fsub float %11, %multiply.11
  %13 = insertvalue { float, float } %9, float %subtract.12, 1
  %14 = extractvalue { float, float } %13, 0
  %15 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %14, ptr %15, align 4
  %16 = extractvalue { float, float } %13, 1
  %17 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %16, ptr %17, align 4
  br label %fusion_20.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #3

define void @concatenate_10(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(65536) %arg2, ptr noalias align 16 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(229376) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 57344
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 57344
  br i1 %6, label %concatenate_10.in_bounds-true, label %concatenate_10.in_bounds-after

concatenate_10.in_bounds-after:                   ; preds = %concatenate.5.merge, %entry
  ret void

concatenate_10.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.96.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %7 = phi i32 [ 0, %concatenate.pivot.0. ]
  %8 = sub nsw i32 %5, %7
  %9 = getelementptr inbounds [64 x [256 x float]], ptr %arg0, i32 0, i32 %8, i32 %4
  %10 = load float, ptr %9, align 4, !invariant.load !43
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %11 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %12 = sub nsw i32 %5, %11
  %13 = getelementptr inbounds [32 x [256 x float]], ptr %arg1, i32 0, i32 %12, i32 %4
  %14 = load float, ptr %13, align 4, !invariant.load !43
  br label %concatenate.5.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.96.2
  %15 = phi i32 [ 96, %concatenate.pivot.96.2 ]
  %16 = sub nsw i32 %5, %15
  %17 = getelementptr inbounds [64 x [256 x float]], ptr %arg2, i32 0, i32 %16, i32 %4
  %18 = load float, ptr %17, align 4, !invariant.load !43
  br label %concatenate.5.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.160.3
  %19 = phi i32 [ 160, %concatenate.pivot.160.3 ]
  %20 = sub nsw i32 %5, %19
  %21 = getelementptr inbounds [64 x [256 x float]], ptr %arg3, i32 0, i32 %20, i32 %4
  %22 = load float, ptr %21, align 4, !invariant.load !43
  br label %concatenate.5.merge

concatenate.pivot.96.:                            ; preds = %concatenate_10.in_bounds-true
  %23 = icmp ult i32 %5, 96
  br i1 %23, label %concatenate.pivot.64., label %concatenate.pivot.160.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.96.
  %24 = icmp ult i32 %5, 64
  br i1 %24, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.160.:                           ; preds = %concatenate.pivot.96.
  %25 = icmp ult i32 %5, 160
  br i1 %25, label %concatenate.pivot.96.2, label %concatenate.pivot.160.3

concatenate.pivot.96.2:                           ; preds = %concatenate.pivot.160.
  br label %concat_index_from_operand_id2

concatenate.pivot.160.3:                          ; preds = %concatenate.pivot.160.
  br label %concat_index_from_operand_id3

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %26 = phi float [ %10, %concat_index_from_operand_id0 ], [ %14, %concat_index_from_operand_id1 ], [ %18, %concat_index_from_operand_id2 ], [ %22, %concat_index_from_operand_id3 ]
  %27 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %26, ptr %27, align 4
  br label %concatenate_10.in_bounds-after
}

define void @fusion_14(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 16 dereferenceable(4194304) %arg4, ptr noalias align 16 dereferenceable(4194304) %arg5, ptr noalias align 16 dereferenceable(4194304) %arg6, ptr noalias align 16 dereferenceable(4194304) %arg7, ptr noalias align 16 dereferenceable(4194304) %arg8, ptr noalias align 16 dereferenceable(512) %arg9, ptr noalias align 16 dereferenceable(32768) %arg10, ptr noalias align 16 dereferenceable(32768) %arg11, ptr noalias align 16 dereferenceable(512) %arg12, ptr noalias align 16 dereferenceable(32768) %arg13, ptr noalias align 16 dereferenceable(32768) %arg14, ptr noalias align 16 dereferenceable(4194304) %arg15, ptr noalias align 128 dereferenceable(32768) %arg16, ptr noalias align 128 dereferenceable(4194304) %arg17, ptr noalias align 128 dereferenceable(32768) %arg18, ptr noalias align 128 dereferenceable(32768) %arg19) {
entry:
  %return_buffer165 = alloca float, align 4
  %result_from_other_lane163 = alloca float, align 4
  %return_buffer162 = alloca float, align 4
  %result_from_other_lane160 = alloca float, align 4
  %return_buffer159 = alloca float, align 4
  %result_from_other_lane157 = alloca float, align 4
  %return_buffer156 = alloca float, align 4
  %result_from_other_lane154 = alloca float, align 4
  %return_buffer153 = alloca float, align 4
  %result_from_other_lane151 = alloca float, align 4
  %return_buffer143 = alloca float, align 4
  %result_from_other_lane141 = alloca float, align 4
  %return_buffer140 = alloca float, align 4
  %result_from_other_lane138 = alloca float, align 4
  %return_buffer137 = alloca float, align 4
  %result_from_other_lane135 = alloca float, align 4
  %return_buffer134 = alloca float, align 4
  %result_from_other_lane132 = alloca float, align 4
  %return_buffer131 = alloca float, align 4
  %result_from_other_lane129 = alloca float, align 4
  %return_buffer125 = alloca float, align 4
  %result_from_other_lane123 = alloca float, align 4
  %return_buffer122 = alloca float, align 4
  %result_from_other_lane120 = alloca float, align 4
  %return_buffer119 = alloca float, align 4
  %result_from_other_lane117 = alloca float, align 4
  %return_buffer116 = alloca float, align 4
  %result_from_other_lane114 = alloca float, align 4
  %return_buffer113 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer54 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result4 = alloca float, align 4
  %reduction_input_address3 = alloca float, align 4
  %partial_reduction_result2 = alloca float, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !40
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after167, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_71_constant_50 = load float, ptr @4, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_71_constant_50, ptr %2, align 4
  %region_0_71_constant_17 = load float, ptr @2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_71_constant_17, ptr %3, align 4
  %region_0_71_constant_175 = load float, ptr @2, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result4, i32 0
  store float %region_0_71_constant_175, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %7 = urem i32 %5, 1024
  %8 = udiv i32 %5, 1024
  %9 = mul i32 %6, 1
  %10 = add i32 %9, %8
  %11 = icmp ult i32 %10, 256
  br i1 %11, label %12, label %early_return

12:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %7, 32
  %thread_id.y = udiv i32 %7, 32
  %lane_id = urem i32 %7, 32
  %13 = udiv i32 %10, 1
  %14 = urem i32 %13, 4
  %15 = udiv i32 %10, 4
  %16 = urem i32 %15, 1
  %17 = udiv i32 %10, 4
  %18 = icmp eq i32 %16, 0
  %tile_bound = select i1 %18, i32 128, i32 4096
  %19 = icmp eq i32 %14, 3
  %tile_bound6 = select i1 %19, i32 32, i32 32
  %tile_origin.0 = mul i32 %17, 1
  %tile_origin.1 = mul i32 %16, 4096
  %tile_origin.2 = mul i32 %14, 32
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
  %22 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %23 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %23, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc7 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc7, ptr %tile_loop.invar_address, align 4
  %24 = icmp eq i32 %tile_loop.indvar, 0
  %25 = mul i32 %tile_loop.indvar, 1
  %26 = add i32 %25, 0
  %x_loc = add i32 %26, %22
  %27 = add i32 %tile_origin.1, %y_in_tile.indvar
  %28 = add i32 %tile_origin.2, %x_loc
  %29 = icmp ult i32 %x_loc, %tile_bound6
  br i1 %29, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !53

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !54

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %30 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %31 = load float, ptr %current_output, align 4
  store float %31, ptr %30, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %32 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result112 = load float, ptr %32, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result112, i32 16, i32 31)
  store float %33, ptr %result_from_other_lane, align 4
  call void @region_1_51(ptr %32, ptr %result_from_other_lane, ptr %return_buffer113)
  %34 = load float, ptr %return_buffer113, align 4
  store float %34, ptr %32, align 4
  %partial_reduction_result115 = load float, ptr %32, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result115, i32 8, i32 31)
  store float %35, ptr %result_from_other_lane114, align 4
  call void @region_1_51(ptr %32, ptr %result_from_other_lane114, ptr %return_buffer116)
  %36 = load float, ptr %return_buffer116, align 4
  store float %36, ptr %32, align 4
  %partial_reduction_result118 = load float, ptr %32, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result118, i32 4, i32 31)
  store float %37, ptr %result_from_other_lane117, align 4
  call void @region_1_51(ptr %32, ptr %result_from_other_lane117, ptr %return_buffer119)
  %38 = load float, ptr %return_buffer119, align 4
  store float %38, ptr %32, align 4
  %partial_reduction_result121 = load float, ptr %32, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result121, i32 2, i32 31)
  store float %39, ptr %result_from_other_lane120, align 4
  call void @region_1_51(ptr %32, ptr %result_from_other_lane120, ptr %return_buffer122)
  %40 = load float, ptr %return_buffer122, align 4
  store float %40, ptr %32, align 4
  %partial_reduction_result124 = load float, ptr %32, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result124, i32 1, i32 31)
  store float %41, ptr %result_from_other_lane123, align 4
  call void @region_1_51(ptr %32, ptr %result_from_other_lane123, ptr %return_buffer125)
  %42 = load float, ptr %return_buffer125, align 4
  store float %42, ptr %32, align 4
  %43 = icmp ult i32 %thread_id.x, %tile_bound
  %44 = mul i32 %thread_id.y, 1
  %45 = icmp ult i32 %44, %tile_bound6
  %46 = and i1 %45, %43
  %47 = icmp eq i32 %lane_id, 0
  %48 = and i1 %46, %47
  br i1 %48, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address126 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %49 = addrspacecast ptr addrspace(3) %shmem_output_address126 to ptr
  %current_output127 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %50 = load float, ptr %current_output127, align 4
  store float %50, ptr %49, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr128 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %51 = addrspacecast ptr addrspace(3) %shmem_transposed_addr128 to ptr
  %partial_reduction_result130 = load float, ptr %51, align 4
  %52 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result130, i32 16, i32 31)
  store float %52, ptr %result_from_other_lane129, align 4
  call void @region_2_58(ptr %51, ptr %result_from_other_lane129, ptr %return_buffer131)
  %53 = load float, ptr %return_buffer131, align 4
  store float %53, ptr %51, align 4
  %partial_reduction_result133 = load float, ptr %51, align 4
  %54 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result133, i32 8, i32 31)
  store float %54, ptr %result_from_other_lane132, align 4
  call void @region_2_58(ptr %51, ptr %result_from_other_lane132, ptr %return_buffer134)
  %55 = load float, ptr %return_buffer134, align 4
  store float %55, ptr %51, align 4
  %partial_reduction_result136 = load float, ptr %51, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result136, i32 4, i32 31)
  store float %56, ptr %result_from_other_lane135, align 4
  call void @region_2_58(ptr %51, ptr %result_from_other_lane135, ptr %return_buffer137)
  %57 = load float, ptr %return_buffer137, align 4
  store float %57, ptr %51, align 4
  %partial_reduction_result139 = load float, ptr %51, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result139, i32 2, i32 31)
  store float %58, ptr %result_from_other_lane138, align 4
  call void @region_2_58(ptr %51, ptr %result_from_other_lane138, ptr %return_buffer140)
  %59 = load float, ptr %return_buffer140, align 4
  store float %59, ptr %51, align 4
  %partial_reduction_result142 = load float, ptr %51, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result142, i32 1, i32 31)
  store float %60, ptr %result_from_other_lane141, align 4
  call void @region_2_58(ptr %51, ptr %result_from_other_lane141, ptr %return_buffer143)
  %61 = load float, ptr %return_buffer143, align 4
  store float %61, ptr %51, align 4
  %62 = icmp ult i32 %thread_id.x, %tile_bound
  %63 = mul i32 %thread_id.y, 1
  %64 = icmp ult i32 %63, %tile_bound6
  %65 = and i1 %64, %62
  %66 = icmp eq i32 %lane_id, 0
  %67 = and i1 %65, %66
  br i1 %67, label %reduction_write_output-true144, label %reduction_write_output-after145

reduction_write_output-after145:                  ; preds = %reduction_write_output-true144, %reduction_write_output-after
  %shmem_output_address148 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %68 = addrspacecast ptr addrspace(3) %shmem_output_address148 to ptr
  %current_output149 = getelementptr inbounds float, ptr %partial_reduction_result4, i32 0
  %69 = load float, ptr %current_output149, align 4
  store float %69, ptr %68, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr150 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %70 = addrspacecast ptr addrspace(3) %shmem_transposed_addr150 to ptr
  %partial_reduction_result152 = load float, ptr %70, align 4
  %71 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result152, i32 16, i32 31)
  store float %71, ptr %result_from_other_lane151, align 4
  call void @region_3_65(ptr %70, ptr %result_from_other_lane151, ptr %return_buffer153)
  %72 = load float, ptr %return_buffer153, align 4
  store float %72, ptr %70, align 4
  %partial_reduction_result155 = load float, ptr %70, align 4
  %73 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result155, i32 8, i32 31)
  store float %73, ptr %result_from_other_lane154, align 4
  call void @region_3_65(ptr %70, ptr %result_from_other_lane154, ptr %return_buffer156)
  %74 = load float, ptr %return_buffer156, align 4
  store float %74, ptr %70, align 4
  %partial_reduction_result158 = load float, ptr %70, align 4
  %75 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result158, i32 4, i32 31)
  store float %75, ptr %result_from_other_lane157, align 4
  call void @region_3_65(ptr %70, ptr %result_from_other_lane157, ptr %return_buffer159)
  %76 = load float, ptr %return_buffer159, align 4
  store float %76, ptr %70, align 4
  %partial_reduction_result161 = load float, ptr %70, align 4
  %77 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result161, i32 2, i32 31)
  store float %77, ptr %result_from_other_lane160, align 4
  call void @region_3_65(ptr %70, ptr %result_from_other_lane160, ptr %return_buffer162)
  %78 = load float, ptr %return_buffer162, align 4
  store float %78, ptr %70, align 4
  %partial_reduction_result164 = load float, ptr %70, align 4
  %79 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result164, i32 1, i32 31)
  store float %79, ptr %result_from_other_lane163, align 4
  call void @region_3_65(ptr %70, ptr %result_from_other_lane163, ptr %return_buffer165)
  %80 = load float, ptr %return_buffer165, align 4
  store float %80, ptr %70, align 4
  %81 = icmp ult i32 %thread_id.x, %tile_bound
  %82 = mul i32 %thread_id.y, 1
  %83 = icmp ult i32 %82, %tile_bound6
  %84 = and i1 %83, %81
  %85 = icmp eq i32 %lane_id, 0
  %86 = and i1 %84, %85
  br i1 %86, label %reduction_write_output-true166, label %reduction_write_output-after167

reduction_write_output-after167:                  ; preds = %reduction_write_output-true166, %reduction_write_output-after145
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %87 = mul nuw nsw i32 %28, 1
  %88 = add nuw nsw i32 0, %87
  %89 = mul nuw nsw i32 %27, 128
  %90 = add nuw nsw i32 %88, %89
  %91 = mul nuw nsw i32 %tile_origin.0, 16384
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 1
  %94 = urem i32 %93, 128
  %95 = udiv i32 %92, 128
  %96 = urem i32 %95, 128
  %97 = udiv i32 %92, 16384
  %98 = mul i32 %thread_id.x, 1
  %99 = sub i32 %x_loc, %98
  %100 = mul nuw nsw i32 %94, 1
  %101 = add nuw nsw i32 0, %100
  %102 = udiv i32 %101, 128
  %103 = mul nuw nsw i32 %96, 1
  %104 = add nuw nsw i32 0, %103
  %105 = mul nuw nsw i32 %97, 128
  %106 = add nuw nsw i32 %104, %105
  %107 = udiv i32 %106, 8192
  %Arg_15.16 = getelementptr inbounds float, ptr %arg15, i32 %92
  %Arg_15.168 = load float, ptr %Arg_15.16, align 4, !invariant.load !43
  %region_0_71_constant_179 = load float, ptr @2, align 4
  %compare.19 = fcmp ogt float %Arg_15.168, %region_0_71_constant_179
  %108 = zext i1 %compare.19 to i8
  %Arg_14.15 = getelementptr inbounds [8192 x [1 x float]], ptr %arg14, i32 0, i32 %106, i32 0
  %Arg_14.1510 = load float, ptr %Arg_14.15, align 4, !invariant.load !43
  %Arg_13.14 = getelementptr inbounds [8192 x [1 x float]], ptr %arg13, i32 0, i32 %106, i32 0
  %Arg_13.1411 = load float, ptr %Arg_13.14, align 4, !invariant.load !43
  %multiply.20 = fmul float %Arg_14.1510, %Arg_13.1411
  %region_0_71_constant_21 = load float, ptr @3, align 4
  %Arg_13.1412 = getelementptr inbounds [8192 x [1 x float]], ptr %arg13, i32 0, i32 %106, i32 0
  %Arg_13.1413 = load float, ptr %Arg_13.1412, align 4, !invariant.load !43
  %subtract.23 = fsub float %region_0_71_constant_21, %Arg_13.1413
  %multiply.24 = fmul float %multiply.20, %subtract.23
  %Arg_12.13 = getelementptr inbounds [128 x [1 x float]], ptr %arg12, i32 0, i32 %101, i32 0
  %Arg_12.1314 = load float, ptr %Arg_12.13, align 4, !invariant.load !43
  %multiply.29 = fmul float %multiply.24, %Arg_12.1314
  %Arg_11.12 = getelementptr inbounds [8192 x [1 x float]], ptr %arg11, i32 0, i32 %106, i32 0
  %Arg_11.1215 = load float, ptr %Arg_11.12, align 4, !invariant.load !43
  %Arg_10.11 = getelementptr inbounds [8192 x [1 x float]], ptr %arg10, i32 0, i32 %106, i32 0
  %Arg_10.1116 = load float, ptr %Arg_10.11, align 4, !invariant.load !43
  %multiply.30 = fmul float %Arg_11.1215, %Arg_10.1116
  %Arg_10.1117 = getelementptr inbounds [8192 x [1 x float]], ptr %arg10, i32 0, i32 %106, i32 0
  %Arg_10.1118 = load float, ptr %Arg_10.1117, align 4, !invariant.load !43
  %subtract.31 = fsub float %region_0_71_constant_21, %Arg_10.1118
  %multiply.32 = fmul float %multiply.30, %subtract.31
  %Arg_9.10 = getelementptr inbounds [128 x [1 x float]], ptr %arg9, i32 0, i32 %101, i32 0
  %Arg_9.1019 = load float, ptr %Arg_9.10, align 4, !invariant.load !43
  %multiply.37 = fmul float %multiply.32, %Arg_9.1019
  %add.38 = fadd float %multiply.29, %multiply.37
  %Arg_8.9 = getelementptr inbounds float, ptr %arg8, i32 %92
  %Arg_8.920 = load float, ptr %Arg_8.9, align 4, !invariant.load !43
  %add.39 = fadd float %add.38, %Arg_8.920
  %Arg_7.8 = getelementptr inbounds float, ptr %arg7, i32 %92
  %Arg_7.821 = load float, ptr %Arg_7.8, align 4, !invariant.load !43
  %add.40 = fadd float %add.39, %Arg_7.821
  %Arg_6.7 = getelementptr inbounds float, ptr %arg6, i32 %92
  %Arg_6.722 = load float, ptr %Arg_6.7, align 4, !invariant.load !43
  %add.41 = fadd float %add.40, %Arg_6.722
  %Arg_5.6 = getelementptr inbounds float, ptr %arg5, i32 %92
  %Arg_5.623 = load float, ptr %Arg_5.6, align 4, !invariant.load !43
  %add.42 = fadd float %add.41, %Arg_5.623
  %Arg_4.5 = getelementptr inbounds float, ptr %arg4, i32 %92
  %Arg_4.524 = load float, ptr %Arg_4.5, align 4, !invariant.load !43
  %add.43 = fadd float %add.42, %Arg_4.524
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %92
  %Arg_3.425 = load float, ptr %Arg_3.4, align 4, !invariant.load !43
  %add.44 = fadd float %add.43, %Arg_3.425
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %92
  %Arg_2.326 = load float, ptr %Arg_2.3, align 4, !invariant.load !43
  %add.45 = fadd float %add.44, %Arg_2.326
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %92
  %Arg_1.227 = load float, ptr %Arg_1.2, align 4, !invariant.load !43
  %add.46 = fadd float %add.45, %Arg_1.227
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %92
  %Arg_0.128 = load float, ptr %Arg_0.1, align 4, !invariant.load !43
  %add.47 = fadd float %add.46, %Arg_0.128
  %109 = trunc i8 %108 to i1
  %110 = select i1 %109, float %add.47, float %region_0_71_constant_179
  store float %110, ptr %reduction_input_address, align 4
  %111 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %99
  call void @region_1_51(ptr %111, ptr %reduction_input_address, ptr %return_buffer)
  %112 = load float, ptr %return_buffer, align 4
  store float %112, ptr %111, align 4
  %113 = mul nuw nsw i32 %94, 1
  %114 = add nuw nsw i32 0, %113
  %115 = udiv i32 %114, 128
  %116 = mul nuw nsw i32 %96, 1
  %117 = add nuw nsw i32 0, %116
  %118 = mul nuw nsw i32 %97, 128
  %119 = add nuw nsw i32 %117, %118
  %120 = udiv i32 %119, 8192
  %Arg_15.1629 = getelementptr inbounds float, ptr %arg15, i32 %92
  %Arg_15.1630 = load float, ptr %Arg_15.1629, align 4, !invariant.load !43
  %Arg_14.1531 = getelementptr inbounds [8192 x [1 x float]], ptr %arg14, i32 0, i32 %119, i32 0
  %Arg_14.1532 = load float, ptr %Arg_14.1531, align 4, !invariant.load !43
  %Arg_13.1433 = getelementptr inbounds [8192 x [1 x float]], ptr %arg13, i32 0, i32 %119, i32 0
  %Arg_13.1434 = load float, ptr %Arg_13.1433, align 4, !invariant.load !43
  %multiply.2035 = fmul float %Arg_14.1532, %Arg_13.1434
  %region_0_71_constant_2136 = load float, ptr @3, align 4
  %Arg_13.1437 = getelementptr inbounds [8192 x [1 x float]], ptr %arg13, i32 0, i32 %119, i32 0
  %Arg_13.1438 = load float, ptr %Arg_13.1437, align 4, !invariant.load !43
  %subtract.2339 = fsub float %region_0_71_constant_2136, %Arg_13.1438
  %multiply.2440 = fmul float %multiply.2035, %subtract.2339
  %multiply.56 = fmul float %Arg_15.1630, %multiply.2440
  store float %multiply.56, ptr %reduction_input_address1, align 4
  %121 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %99
  call void @region_2_58(ptr %121, ptr %reduction_input_address1, ptr %return_buffer41)
  %122 = load float, ptr %return_buffer41, align 4
  store float %122, ptr %121, align 4
  %123 = mul nuw nsw i32 %94, 1
  %124 = add nuw nsw i32 0, %123
  %125 = udiv i32 %124, 128
  %126 = mul nuw nsw i32 %96, 1
  %127 = add nuw nsw i32 0, %126
  %128 = mul nuw nsw i32 %97, 128
  %129 = add nuw nsw i32 %127, %128
  %130 = udiv i32 %129, 8192
  %Arg_15.1642 = getelementptr inbounds float, ptr %arg15, i32 %92
  %Arg_15.1643 = load float, ptr %Arg_15.1642, align 4, !invariant.load !43
  %Arg_11.1244 = getelementptr inbounds [8192 x [1 x float]], ptr %arg11, i32 0, i32 %129, i32 0
  %Arg_11.1245 = load float, ptr %Arg_11.1244, align 4, !invariant.load !43
  %Arg_10.1146 = getelementptr inbounds [8192 x [1 x float]], ptr %arg10, i32 0, i32 %129, i32 0
  %Arg_10.1147 = load float, ptr %Arg_10.1146, align 4, !invariant.load !43
  %multiply.3048 = fmul float %Arg_11.1245, %Arg_10.1147
  %region_0_71_constant_2149 = load float, ptr @3, align 4
  %Arg_10.1150 = getelementptr inbounds [8192 x [1 x float]], ptr %arg10, i32 0, i32 %129, i32 0
  %Arg_10.1151 = load float, ptr %Arg_10.1150, align 4, !invariant.load !43
  %subtract.3152 = fsub float %region_0_71_constant_2149, %Arg_10.1151
  %multiply.3253 = fmul float %multiply.3048, %subtract.3152
  %multiply.63 = fmul float %Arg_15.1643, %multiply.3253
  store float %multiply.63, ptr %reduction_input_address3, align 4
  %131 = getelementptr inbounds float, ptr %partial_reduction_result4, i32 %99
  call void @region_3_65(ptr %131, ptr %reduction_input_address3, ptr %return_buffer54)
  %132 = load float, ptr %return_buffer54, align 4
  store float %132, ptr %131, align 4
  %133 = mul nuw nsw i32 %94, 1
  %134 = add nuw nsw i32 0, %133
  %135 = udiv i32 %134, 128
  %136 = mul nuw nsw i32 %96, 1
  %137 = add nuw nsw i32 0, %136
  %138 = mul nuw nsw i32 %97, 128
  %139 = add nuw nsw i32 %137, %138
  %140 = udiv i32 %139, 8192
  %Arg_15.1655 = getelementptr inbounds float, ptr %arg15, i32 %92
  %Arg_15.1656 = load float, ptr %Arg_15.1655, align 4, !invariant.load !43
  %region_0_71_constant_1757 = load float, ptr @2, align 4
  %compare.1958 = fcmp ogt float %Arg_15.1656, %region_0_71_constant_1757
  %141 = zext i1 %compare.1958 to i8
  %Arg_14.1559 = getelementptr inbounds [8192 x [1 x float]], ptr %arg14, i32 0, i32 %139, i32 0
  %Arg_14.1560 = load float, ptr %Arg_14.1559, align 4, !invariant.load !43
  %Arg_13.1461 = getelementptr inbounds [8192 x [1 x float]], ptr %arg13, i32 0, i32 %139, i32 0
  %Arg_13.1462 = load float, ptr %Arg_13.1461, align 4, !invariant.load !43
  %multiply.2063 = fmul float %Arg_14.1560, %Arg_13.1462
  %region_0_71_constant_2164 = load float, ptr @3, align 4
  %Arg_13.1465 = getelementptr inbounds [8192 x [1 x float]], ptr %arg13, i32 0, i32 %139, i32 0
  %Arg_13.1466 = load float, ptr %Arg_13.1465, align 4, !invariant.load !43
  %subtract.2367 = fsub float %region_0_71_constant_2164, %Arg_13.1466
  %multiply.2468 = fmul float %multiply.2063, %subtract.2367
  %Arg_12.1369 = getelementptr inbounds [128 x [1 x float]], ptr %arg12, i32 0, i32 %134, i32 0
  %Arg_12.1370 = load float, ptr %Arg_12.1369, align 4, !invariant.load !43
  %multiply.2971 = fmul float %multiply.2468, %Arg_12.1370
  %Arg_11.1272 = getelementptr inbounds [8192 x [1 x float]], ptr %arg11, i32 0, i32 %139, i32 0
  %Arg_11.1273 = load float, ptr %Arg_11.1272, align 4, !invariant.load !43
  %Arg_10.1174 = getelementptr inbounds [8192 x [1 x float]], ptr %arg10, i32 0, i32 %139, i32 0
  %Arg_10.1175 = load float, ptr %Arg_10.1174, align 4, !invariant.load !43
  %multiply.3076 = fmul float %Arg_11.1273, %Arg_10.1175
  %Arg_10.1177 = getelementptr inbounds [8192 x [1 x float]], ptr %arg10, i32 0, i32 %139, i32 0
  %Arg_10.1178 = load float, ptr %Arg_10.1177, align 4, !invariant.load !43
  %subtract.3179 = fsub float %region_0_71_constant_2164, %Arg_10.1178
  %multiply.3280 = fmul float %multiply.3076, %subtract.3179
  %Arg_9.1081 = getelementptr inbounds [128 x [1 x float]], ptr %arg9, i32 0, i32 %134, i32 0
  %Arg_9.1082 = load float, ptr %Arg_9.1081, align 4, !invariant.load !43
  %multiply.3783 = fmul float %multiply.3280, %Arg_9.1082
  %add.3884 = fadd float %multiply.2971, %multiply.3783
  %Arg_8.985 = getelementptr inbounds float, ptr %arg8, i32 %92
  %Arg_8.986 = load float, ptr %Arg_8.985, align 4, !invariant.load !43
  %add.3987 = fadd float %add.3884, %Arg_8.986
  %Arg_7.888 = getelementptr inbounds float, ptr %arg7, i32 %92
  %Arg_7.889 = load float, ptr %Arg_7.888, align 4, !invariant.load !43
  %add.4090 = fadd float %add.3987, %Arg_7.889
  %Arg_6.791 = getelementptr inbounds float, ptr %arg6, i32 %92
  %Arg_6.792 = load float, ptr %Arg_6.791, align 4, !invariant.load !43
  %add.4193 = fadd float %add.4090, %Arg_6.792
  %Arg_5.694 = getelementptr inbounds float, ptr %arg5, i32 %92
  %Arg_5.695 = load float, ptr %Arg_5.694, align 4, !invariant.load !43
  %add.4296 = fadd float %add.4193, %Arg_5.695
  %Arg_4.597 = getelementptr inbounds float, ptr %arg4, i32 %92
  %Arg_4.598 = load float, ptr %Arg_4.597, align 4, !invariant.load !43
  %add.4399 = fadd float %add.4296, %Arg_4.598
  %Arg_3.4100 = getelementptr inbounds float, ptr %arg3, i32 %92
  %Arg_3.4101 = load float, ptr %Arg_3.4100, align 4, !invariant.load !43
  %add.44102 = fadd float %add.4399, %Arg_3.4101
  %Arg_2.3103 = getelementptr inbounds float, ptr %arg2, i32 %92
  %Arg_2.3104 = load float, ptr %Arg_2.3103, align 4, !invariant.load !43
  %add.45105 = fadd float %add.44102, %Arg_2.3104
  %Arg_1.2106 = getelementptr inbounds float, ptr %arg1, i32 %92
  %Arg_1.2107 = load float, ptr %Arg_1.2106, align 4, !invariant.load !43
  %add.46108 = fadd float %add.45105, %Arg_1.2107
  %Arg_0.1109 = getelementptr inbounds float, ptr %arg0, i32 %92
  %Arg_0.1110 = load float, ptr %Arg_0.1109, align 4, !invariant.load !43
  %add.47111 = fadd float %add.46108, %Arg_0.1110
  %142 = trunc i8 %141 to i1
  %143 = select i1 %142, float %add.47111, float %region_0_71_constant_1757
  %144 = mul nuw nsw i32 %94, 1
  %145 = add nuw nsw i32 0, %144
  %146 = udiv i32 %145, 128
  %147 = mul nuw nsw i32 %96, 1
  %148 = add nuw nsw i32 0, %147
  %149 = mul nuw nsw i32 %97, 128
  %150 = add nuw nsw i32 %148, %149
  %151 = udiv i32 %150, 8192
  %152 = getelementptr inbounds float, ptr %arg17, i32 %92
  store float %143, ptr %152, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %153 = mul i32 %thread_id.y, 1
  %154 = add i32 %tile_origin.1, %thread_id.x
  %155 = add i32 %tile_origin.2, %153
  %156 = add i32 %155, 0
  %157 = mul i32 %tile_origin.0, 128
  %158 = add i32 %157, %156
  %159 = udiv i32 %158, 1
  %160 = urem i32 %159, 128
  %161 = udiv i32 %158, 128
  %output_element_address = getelementptr inbounds [64 x [128 x float]], ptr %arg16, i32 0, i32 %161, i32 %160
  %output = load float, ptr %32, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true144:                   ; preds = %reduction_write_output-after
  %162 = mul i32 %thread_id.y, 1
  %163 = add i32 %tile_origin.1, %thread_id.x
  %164 = add i32 %tile_origin.2, %162
  %165 = add i32 %164, 0
  %166 = mul i32 %tile_origin.0, 128
  %167 = add i32 %166, %165
  %168 = udiv i32 %167, 1
  %169 = urem i32 %168, 128
  %170 = udiv i32 %167, 128
  %output_element_address146 = getelementptr inbounds [64 x [128 x float]], ptr %arg18, i32 0, i32 %170, i32 %169
  %output147 = load float, ptr %51, align 4
  store float %output147, ptr %output_element_address146, align 4
  br label %reduction_write_output-after145

reduction_write_output-true166:                   ; preds = %reduction_write_output-after145
  %171 = mul i32 %thread_id.y, 1
  %172 = add i32 %tile_origin.1, %thread_id.x
  %173 = add i32 %tile_origin.2, %171
  %174 = add i32 %173, 0
  %175 = mul i32 %tile_origin.0, 128
  %176 = add i32 %175, %174
  %177 = udiv i32 %176, 1
  %178 = urem i32 %177, 128
  %179 = udiv i32 %176, 128
  %output_element_address168 = getelementptr inbounds [64 x [128 x float]], ptr %arg19, i32 0, i32 %179, i32 %178
  %output169 = load float, ptr %70, align 4
  store float %output169, ptr %output_element_address168, align 4
  br label %reduction_write_output-after167
}

define internal void @region_1_51(ptr dereferenceable(4) %Arg_0.52.typed, ptr dereferenceable(4) %Arg_1.53.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.54.typed = alloca float, align 4
  %Arg_0.52 = load float, ptr %Arg_0.52.typed, align 4
  %Arg_1.53 = load float, ptr %Arg_1.53.typed, align 4
  %add.54 = fadd float %Arg_0.52, %Arg_1.53
  store float %add.54, ptr %add.54.typed, align 4
  %load_ret_value = load float, ptr %add.54.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_58(ptr dereferenceable(4) %Arg_0.59.typed, ptr dereferenceable(4) %Arg_1.60.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.61.typed = alloca float, align 4
  %Arg_0.59 = load float, ptr %Arg_0.59.typed, align 4
  %Arg_1.60 = load float, ptr %Arg_1.60.typed, align 4
  %add.61 = fadd float %Arg_0.59, %Arg_1.60
  store float %add.61, ptr %add.61.typed, align 4
  %load_ret_value = load float, ptr %add.61.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_3_65(ptr dereferenceable(4) %Arg_0.66.typed, ptr dereferenceable(4) %Arg_1.67.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.68.typed = alloca float, align 4
  %Arg_0.66 = load float, ptr %Arg_0.66.typed, align 4
  %Arg_1.67 = load float, ptr %Arg_1.67.typed, align 4
  %add.68 = fadd float %Arg_0.66, %Arg_1.67
  store float %add.68, ptr %add.68.typed, align 4
  %load_ret_value = load float, ptr %add.68.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_28(ptr noalias align 128 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(512) %arg3, ptr noalias align 128 dereferenceable(512) %arg4) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !38
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after122, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !43
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %3, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
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
  br label %tile_loop.loop_header, !llvm.loop !55

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !56

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
  %Arg_0.1 = getelementptr inbounds [64 x [128 x float]], ptr %arg0, i32 0, i32 %27, i32 %28
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !43
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %74
  call void @region_1_4(ptr %75, ptr %reduction_input_address, ptr %return_buffer)
  %76 = load float, ptr %return_buffer, align 4
  store float %76, ptr %75, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %77 = mul i32 %thread_id.x, 2
  %78 = sub i32 %x_loc4, %77
  %Arg_0.17 = getelementptr inbounds [64 x [128 x float]], ptr %arg0, i32 0, i32 %32, i32 %33
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !43
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
  %Arg_1.248 = load float, ptr %arg1, align 4, !invariant.load !43
  %95 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  store float %Arg_1.248, ptr %95, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  store float %Arg_1.248, ptr %96, align 4
  %97 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %98 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
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
  br label %tile_loop.loop_header65, !llvm.loop !57

tile_loop.loop_exit64:                            ; preds = %tile_loop.loop_header65
  br label %y_in_tile.loop_header59, !llvm.loop !58

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
  %Arg_2.3 = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %119, i32 %120
  %Arg_2.373 = load float, ptr %Arg_2.3, align 4, !invariant.load !43
  store float %Arg_2.373, ptr %reduction_input_address46, align 4
  %167 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %166
  call void @region_2_9(ptr %167, ptr %reduction_input_address46, ptr %return_buffer74)
  %168 = load float, ptr %return_buffer74, align 4
  store float %168, ptr %167, align 4
  br label %x_in_tile-after72

x_in_tile-true76:                                 ; preds = %x_in_tile-after72
  %169 = mul i32 %thread_id.x50, 2
  %170 = sub i32 %x_loc75, %169
  %Arg_2.378 = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %124, i32 %125
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !43
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

define void @fusion_17(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 128 dereferenceable(512) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(512) %arg3, ptr noalias align 128 dereferenceable(512) %arg4, ptr noalias align 128 dereferenceable(512) %arg5, ptr noalias align 128 dereferenceable(512) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !59
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 128
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index, 1
  %6 = icmp ult i32 %linear_index, 128
  br i1 %6, label %fusion_17.in_bounds-true, label %fusion_17.in_bounds-after

fusion_17.in_bounds-after:                        ; preds = %fusion_17.in_bounds-true, %entry
  ret void

fusion_17.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !43
  %9 = load float, ptr %arg2, align 4, !invariant.load !43
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !43
  %multiply.7 = fmul float %9, %11
  %subtract.9 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.9, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !43
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4, !invariant.load !43
  %multiply.10 = fmul float %9, %16
  %subtract.12 = fsub float %14, %multiply.10
  %17 = insertvalue { float, float } %12, float %subtract.12, 1
  %18 = extractvalue { float, float } %17, 0
  %19 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %18, ptr %19, align 4
  %20 = extractvalue { float, float } %17, 1
  %21 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %20, ptr %21, align 4
  br label %fusion_17.in_bounds-after
}

define void @fusion_12(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %fusion_12.in_bounds-true, label %fusion_12.in_bounds-after

fusion_12.in_bounds-after:                        ; preds = %fusion_12.in_bounds-true, %entry
  ret void

fusion_12.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !43
  %9 = load float, ptr %arg2, align 4, !invariant.load !43
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !43
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_12.in_bounds-after
}

define void @fusion_11(ptr noalias align 128 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(4194304) %arg3) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !40
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after60, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_15_constant_8 = load float, ptr @6, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_15_constant_8, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_15_constant_8, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !59
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
  br label %tile_loop.loop_header, !llvm.loop !61

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !62

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
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
  %shmem_output_address41 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address41 to ptr
  %current_output42 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output42, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr43 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
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
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !43
  %region_0_15_constant_3 = load float, ptr @5, align 4
  %compare.5 = fcmp ogt float %Arg_1.23, %region_0_15_constant_3
  %93 = zext i1 %compare.5 to i8
  %Arg_0.1 = getelementptr inbounds [8192 x [128 x float]], ptr %arg0, i32 0, i32 %91, i32 %86
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !43
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
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !43
  %region_0_15_constant_37 = load float, ptr @5, align 4
  %compare.58 = fcmp ogt float %Arg_1.26, %region_0_15_constant_37
  %106 = zext i1 %compare.58 to i8
  %Arg_0.19 = getelementptr inbounds float, ptr %arg0, i32 %77
  %Arg_0.110 = load float, ptr %Arg_0.19, align 4, !invariant.load !43
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
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !43
  %region_0_15_constant_316 = load float, ptr @5, align 4
  %compare.517 = fcmp ogt float %Arg_1.215, %region_0_15_constant_316
  %139 = zext i1 %compare.517 to i8
  %Arg_0.118 = getelementptr inbounds [8192 x [128 x float]], ptr %arg0, i32 0, i32 %137, i32 %132
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !43
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
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !43
  %region_0_15_constant_323 = load float, ptr @5, align 4
  %compare.524 = fcmp ogt float %Arg_1.222, %region_0_15_constant_323
  %152 = zext i1 %compare.524 to i8
  %Arg_0.125 = getelementptr inbounds float, ptr %arg0, i32 %123
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !43
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

define void @fusion_10(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 128 dereferenceable(512) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(512) %arg3, ptr noalias align 128 dereferenceable(512) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !59
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 128
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 128
  br i1 %4, label %fusion_10.in_bounds-true, label %fusion_10.in_bounds-after

fusion_10.in_bounds-after:                        ; preds = %fusion_10.in_bounds-true, %entry
  ret void

fusion_10.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !43
  %7 = load float, ptr %arg2, align 4, !invariant.load !43
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.7 = fmul float %7, %9
  %subtract.8 = fsub float %6, %multiply.7
  %10 = insertvalue { float, float } undef, float %subtract.8, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !43
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
  br label %fusion_10.in_bounds-after
}

define void @fusion_9(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !63
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_9.in_bounds-true, label %fusion_9.in_bounds-after

fusion_9.in_bounds-after:                         ; preds = %fusion_9.in_bounds-true, %entry
  ret void

fusion_9.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !43
  %9 = load float, ptr %arg2, align 4, !invariant.load !43
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_9.in_bounds-after
}

define void @fusion_8(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 16 dereferenceable(8388608) %arg1, ptr noalias align 128 dereferenceable(65536) %arg2, ptr noalias align 128 dereferenceable(8388608) %arg3) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !40
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after60, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_15_constant_8 = load float, ptr @8, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_15_constant_8, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_15_constant_8, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 256
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 4
  %14 = udiv i32 %9, 4
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 4
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 128, i32 4096
  %18 = icmp eq i32 %13, 3
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
  br label %tile_loop.loop_header, !llvm.loop !64

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !65

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
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
  %shmem_output_address41 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address41 to ptr
  %current_output42 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output42, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr43 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
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
  %74 = mul nuw nsw i32 %26, 256
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 32768
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 256
  %80 = udiv i32 %77, 256
  %81 = urem i32 %80, 128
  %82 = udiv i32 %77, 32768
  %83 = mul i32 %thread_id.x, 2
  %84 = sub i32 %x_loc, %83
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 256
  %88 = mul nuw nsw i32 %81, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 128
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 8192
  %Arg_1.2 = getelementptr inbounds [8192 x [256 x float]], ptr %arg1, i32 0, i32 %91, i32 %86
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !43
  %region_0_15_constant_3 = load float, ptr @7, align 4
  %compare.5 = fcmp ogt float %Arg_1.23, %region_0_15_constant_3
  %93 = zext i1 %compare.5 to i8
  %Arg_0.1 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %91, i32 %86
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !43
  %94 = trunc i8 %93 to i1
  %95 = select i1 %94, float %Arg_0.14, float %region_0_15_constant_3
  store float %95, ptr %reduction_input_address, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %84
  call void @region_1_9__1(ptr %96, ptr %reduction_input_address, ptr %return_buffer)
  %97 = load float, ptr %return_buffer, align 4
  store float %97, ptr %96, align 4
  %98 = mul nuw nsw i32 %79, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 256
  %101 = mul nuw nsw i32 %81, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %82, 128
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 8192
  %Arg_1.25 = getelementptr inbounds float, ptr %arg1, i32 %77
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !43
  %region_0_15_constant_37 = load float, ptr @7, align 4
  %compare.58 = fcmp ogt float %Arg_1.26, %region_0_15_constant_37
  %106 = zext i1 %compare.58 to i8
  %Arg_0.19 = getelementptr inbounds float, ptr %arg0, i32 %77
  %Arg_0.110 = load float, ptr %Arg_0.19, align 4, !invariant.load !43
  %107 = trunc i8 %106 to i1
  %108 = select i1 %107, float %Arg_0.110, float %region_0_15_constant_37
  %109 = mul nuw nsw i32 %79, 1
  %110 = add nuw nsw i32 0, %109
  %111 = udiv i32 %110, 256
  %112 = mul nuw nsw i32 %81, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %82, 128
  %115 = add nuw nsw i32 %113, %114
  %116 = udiv i32 %115, 8192
  %117 = getelementptr inbounds [8192 x [256 x float]], ptr %arg3, i32 0, i32 %115, i32 %110
  store float %108, ptr %117, align 4
  br label %x_in_tile-after

x_in_tile-true12:                                 ; preds = %x_in_tile-after
  %118 = mul nuw nsw i32 %32, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %31, 256
  %121 = add nuw nsw i32 %119, %120
  %122 = mul nuw nsw i32 %tile_origin.0, 32768
  %123 = add nuw nsw i32 %121, %122
  %124 = udiv i32 %123, 1
  %125 = urem i32 %124, 256
  %126 = udiv i32 %123, 256
  %127 = urem i32 %126, 128
  %128 = udiv i32 %123, 32768
  %129 = mul i32 %thread_id.x, 2
  %130 = sub i32 %x_loc11, %129
  %131 = mul nuw nsw i32 %125, 1
  %132 = add nuw nsw i32 0, %131
  %133 = udiv i32 %132, 256
  %134 = mul nuw nsw i32 %127, 1
  %135 = add nuw nsw i32 0, %134
  %136 = mul nuw nsw i32 %128, 128
  %137 = add nuw nsw i32 %135, %136
  %138 = udiv i32 %137, 8192
  %Arg_1.214 = getelementptr inbounds [8192 x [256 x float]], ptr %arg1, i32 0, i32 %137, i32 %132
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !43
  %region_0_15_constant_316 = load float, ptr @7, align 4
  %compare.517 = fcmp ogt float %Arg_1.215, %region_0_15_constant_316
  %139 = zext i1 %compare.517 to i8
  %Arg_0.118 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %137, i32 %132
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !43
  %140 = trunc i8 %139 to i1
  %141 = select i1 %140, float %Arg_0.119, float %region_0_15_constant_316
  store float %141, ptr %reduction_input_address, align 4
  %142 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %130
  call void @region_1_9__1(ptr %142, ptr %reduction_input_address, ptr %return_buffer20)
  %143 = load float, ptr %return_buffer20, align 4
  store float %143, ptr %142, align 4
  %144 = mul nuw nsw i32 %125, 1
  %145 = add nuw nsw i32 0, %144
  %146 = udiv i32 %145, 256
  %147 = mul nuw nsw i32 %127, 1
  %148 = add nuw nsw i32 0, %147
  %149 = mul nuw nsw i32 %128, 128
  %150 = add nuw nsw i32 %148, %149
  %151 = udiv i32 %150, 8192
  %Arg_1.221 = getelementptr inbounds float, ptr %arg1, i32 %123
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !43
  %region_0_15_constant_323 = load float, ptr @7, align 4
  %compare.524 = fcmp ogt float %Arg_1.222, %region_0_15_constant_323
  %152 = zext i1 %compare.524 to i8
  %Arg_0.125 = getelementptr inbounds float, ptr %arg0, i32 %123
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !43
  %153 = trunc i8 %152 to i1
  %154 = select i1 %153, float %Arg_0.126, float %region_0_15_constant_323
  %155 = mul nuw nsw i32 %125, 1
  %156 = add nuw nsw i32 0, %155
  %157 = udiv i32 %156, 256
  %158 = mul nuw nsw i32 %127, 1
  %159 = add nuw nsw i32 0, %158
  %160 = mul nuw nsw i32 %128, 128
  %161 = add nuw nsw i32 %159, %160
  %162 = udiv i32 %161, 8192
  %163 = getelementptr inbounds [8192 x [256 x float]], ptr %arg3, i32 0, i32 %161, i32 %156
  store float %154, ptr %163, align 4
  br label %x_in_tile-after13

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %164 = mul i32 %thread_id.y, 2
  %165 = add i32 %tile_origin.1, %thread_id.x
  %166 = add i32 %tile_origin.2, %164
  %167 = add i32 %166, 0
  %168 = mul i32 %tile_origin.0, 256
  %169 = add i32 %168, %167
  %170 = udiv i32 %169, 1
  %171 = urem i32 %170, 256
  %172 = udiv i32 %169, 256
  %output_element_address = getelementptr inbounds [64 x [256 x float]], ptr %arg2, i32 0, i32 %172, i32 %171
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true59:                    ; preds = %reduction_write_output-after
  %173 = mul i32 %thread_id.y, 2
  %174 = add i32 %tile_origin.1, %thread_id.x
  %175 = add i32 %tile_origin.2, %173
  %176 = add i32 %175, 1
  %177 = mul i32 %tile_origin.0, 256
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %180 = urem i32 %179, 256
  %181 = udiv i32 %178, 256
  %output_element_address61 = getelementptr inbounds [64 x [256 x float]], ptr %arg2, i32 0, i32 %181, i32 %180
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

define void @reduce_152(ptr noalias align 128 dereferenceable(65536) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(1024) %arg2) {
entry:
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !40
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !43
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !66
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 4
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 4
  %14 = udiv i32 %9, 4
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 4
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 64, i32 4096
  %18 = icmp eq i32 %13, 3
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
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
  %x_loc4 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc4
  %33 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %33, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !67

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !68

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane, ptr %return_buffer11)
  %38 = load float, ptr %return_buffer11, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result13 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane12, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane12, ptr %return_buffer14)
  %40 = load float, ptr %return_buffer14, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result16 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane15, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane15, ptr %return_buffer17)
  %42 = load float, ptr %return_buffer17, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result19 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane18, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane18, ptr %return_buffer20)
  %44 = load float, ptr %return_buffer20, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result22 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane21, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane21, ptr %return_buffer23)
  %46 = load float, ptr %return_buffer23, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output25, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane27, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane27, ptr %return_buffer29)
  %57 = load float, ptr %return_buffer29, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result31 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane30, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane30, ptr %return_buffer32)
  %59 = load float, ptr %return_buffer32, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result34 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane33, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane33, ptr %return_buffer35)
  %61 = load float, ptr %return_buffer35, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result37 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane36, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane36, ptr %return_buffer38)
  %63 = load float, ptr %return_buffer38, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result40 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane39, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane39, ptr %return_buffer41)
  %65 = load float, ptr %return_buffer41, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul i32 %thread_id.x, 2
  %73 = sub i32 %x_loc, %72
  %Arg_0.1 = getelementptr inbounds [64 x [256 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !43
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %74 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %73
  call void @region_1_3(ptr %74, ptr %reduction_input_address, ptr %return_buffer)
  %75 = load float, ptr %return_buffer, align 4
  store float %75, ptr %74, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %76 = mul i32 %thread_id.x, 2
  %77 = sub i32 %x_loc4, %76
  %Arg_0.17 = getelementptr inbounds [64 x [256 x float]], ptr %arg0, i32 0, i32 %31, i32 %32
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !43
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %78 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %77
  call void @region_1_3(ptr %78, ptr %reduction_input_address, ptr %return_buffer9)
  %79 = load float, ptr %return_buffer9, align 4
  store float %79, ptr %78, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %80 = mul i32 %thread_id.y, 2
  %81 = add i32 %tile_origin.1, %thread_id.x
  %82 = add i32 %tile_origin.2, %80
  %83 = add i32 %82, 0
  %84 = mul i32 %tile_origin.0, 256
  %85 = add i32 %84, %83
  %86 = udiv i32 %85, 1
  %output_element_address = getelementptr inbounds [256 x float], ptr %arg2, i32 0, i32 %86
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %87 = mul i32 %thread_id.y, 2
  %88 = add i32 %tile_origin.1, %thread_id.x
  %89 = add i32 %tile_origin.2, %87
  %90 = add i32 %89, 1
  %91 = mul i32 %tile_origin.0, 256
  %92 = add i32 %91, %90
  %93 = udiv i32 %92, 1
  %output_element_address44 = getelementptr inbounds [256 x float], ptr %arg2, i32 0, i32 %93
  %output45 = load float, ptr %55, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43
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

define void @fusion_7(ptr noalias align 16 dereferenceable(1024) %arg0, ptr noalias align 128 dereferenceable(1024) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 256
  br i1 %4, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %fusion_7.in_bounds-true, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !43
  %7 = load float, ptr %arg2, align 4, !invariant.load !43
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.5 = fmul float %7, %9
  %subtract.6 = fsub float %6, %multiply.5
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %10, align 4
  br label %fusion_7.in_bounds-after
}

define void @fusion_3(ptr noalias align 16 dereferenceable(1048576) %arg0, ptr noalias align 128 dereferenceable(7340032) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(1048576) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 65536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 32
  %5 = udiv i32 %linear_index_base, 32
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 32
  %8 = udiv i32 %linear_index1, 32
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 32
  %11 = udiv i32 %linear_index2, 32
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 32
  %14 = udiv i32 %linear_index3, 32
  %15 = icmp ult i32 %linear_index_base, 262144
  br i1 %15, label %fusion_3.in_bounds-true, label %fusion_3.in_bounds-after

fusion_3.in_bounds-after:                         ; preds = %fusion_3.in_bounds-true, %entry
  ret void

fusion_3.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !43
  %18 = load float, ptr %arg2, align 4, !invariant.load !43
  %19 = add i32 %5, 0
  %20 = add i32 %4, 64
  %21 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %19, i32 %20
  %22 = load float, ptr %21, align 4, !invariant.load !43
  %multiply.6 = fmul float %18, %22
  %subtract.7 = fsub float %17, %multiply.6
  %23 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %subtract.7, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4, !invariant.load !43
  %26 = load float, ptr %arg2, align 4, !invariant.load !43
  %27 = add i32 %8, 0
  %28 = add i32 %7, 64
  %29 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %27, i32 %28
  %30 = load float, ptr %29, align 4, !invariant.load !43
  %multiply.61 = fmul float %26, %30
  %subtract.72 = fsub float %25, %multiply.61
  %31 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %subtract.72, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4, !invariant.load !43
  %34 = load float, ptr %arg2, align 4, !invariant.load !43
  %35 = add i32 %11, 0
  %36 = add i32 %10, 64
  %37 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !43
  %multiply.63 = fmul float %34, %38
  %subtract.74 = fsub float %33, %multiply.63
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %subtract.74, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4, !invariant.load !43
  %42 = load float, ptr %arg2, align 4, !invariant.load !43
  %43 = add i32 %14, 0
  %44 = add i32 %13, 64
  %45 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %43, i32 %44
  %46 = load float, ptr %45, align 4, !invariant.load !43
  %multiply.65 = fmul float %42, %46
  %subtract.76 = fsub float %41, %multiply.65
  %47 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %subtract.76, ptr %47, align 4
  br label %fusion_3.in_bounds-after
}

define void @slice_20(ptr noalias align 128 dereferenceable(7340032) %arg0, ptr noalias align 128 dereferenceable(2097152) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
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
  br i1 %15, label %slice_20.in_bounds-true, label %slice_20.in_bounds-after

slice_20.in_bounds-after:                         ; preds = %slice_20.in_bounds-true, %entry
  ret void

slice_20.in_bounds-true:                          ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 160
  %18 = getelementptr inbounds [8192 x [224 x float]], ptr %arg0, i32 0, i32 %16, i32 %17
  %19 = load float, ptr %18, align 4, !invariant.load !43
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %19, ptr %20, align 4
  %21 = add i32 %8, 0
  %22 = add i32 %7, 160
  %23 = getelementptr inbounds [8192 x [224 x float]], ptr %arg0, i32 0, i32 %21, i32 %22
  %24 = load float, ptr %23, align 4, !invariant.load !43
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %24, ptr %25, align 4
  %26 = add i32 %11, 0
  %27 = add i32 %10, 160
  %28 = getelementptr inbounds [8192 x [224 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !43
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %29, ptr %30, align 4
  %31 = add i32 %14, 0
  %32 = add i32 %13, 160
  %33 = getelementptr inbounds [8192 x [224 x float]], ptr %arg0, i32 0, i32 %31, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !43
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %34, ptr %35, align 4
  br label %slice_20.in_bounds-after
}

define void @fusion_5(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 128 dereferenceable(7340032) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(2097152) %arg3, ptr noalias align 128 dereferenceable(2097152) %arg4, ptr noalias align 128 dereferenceable(2097152) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
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
  br i1 %15, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %fusion_5.in_bounds-true, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !43
  %18 = load float, ptr %arg2, align 4, !invariant.load !43
  %19 = add i32 %5, 0
  %20 = add i32 %4, 0
  %21 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %19, i32 %20
  %22 = load float, ptr %21, align 4, !invariant.load !43
  %multiply.7 = fmul float %18, %22
  %subtract.8 = fsub float %17, %multiply.7
  %23 = insertvalue { float, float } undef, float %subtract.8, 0
  %24 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !43
  %26 = add i32 %5, 0
  %27 = add i32 %4, 96
  %28 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !43
  %multiply.10 = fmul float %18, %29
  %subtract.11 = fsub float %25, %multiply.10
  %30 = insertvalue { float, float } %23, float %subtract.11, 1
  %31 = extractvalue { float, float } %30, 0
  %32 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %31, ptr %32, align 4
  %33 = extractvalue { float, float } %30, 1
  %34 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %33, ptr %34, align 4
  %35 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %36 = load float, ptr %35, align 4, !invariant.load !43
  %37 = load float, ptr %arg2, align 4, !invariant.load !43
  %38 = add i32 %8, 0
  %39 = add i32 %7, 0
  %40 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %38, i32 %39
  %41 = load float, ptr %40, align 4, !invariant.load !43
  %multiply.71 = fmul float %37, %41
  %subtract.82 = fsub float %36, %multiply.71
  %42 = insertvalue { float, float } undef, float %subtract.82, 0
  %43 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %44 = load float, ptr %43, align 4, !invariant.load !43
  %45 = add i32 %8, 0
  %46 = add i32 %7, 96
  %47 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %45, i32 %46
  %48 = load float, ptr %47, align 4, !invariant.load !43
  %multiply.103 = fmul float %37, %48
  %subtract.114 = fsub float %44, %multiply.103
  %49 = insertvalue { float, float } %42, float %subtract.114, 1
  %50 = extractvalue { float, float } %49, 0
  %51 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %50, ptr %51, align 4
  %52 = extractvalue { float, float } %49, 1
  %53 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %52, ptr %53, align 4
  %54 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %55 = load float, ptr %54, align 4, !invariant.load !43
  %56 = load float, ptr %arg2, align 4, !invariant.load !43
  %57 = add i32 %11, 0
  %58 = add i32 %10, 0
  %59 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %57, i32 %58
  %60 = load float, ptr %59, align 4, !invariant.load !43
  %multiply.75 = fmul float %56, %60
  %subtract.86 = fsub float %55, %multiply.75
  %61 = insertvalue { float, float } undef, float %subtract.86, 0
  %62 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %63 = load float, ptr %62, align 4, !invariant.load !43
  %64 = add i32 %11, 0
  %65 = add i32 %10, 96
  %66 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %64, i32 %65
  %67 = load float, ptr %66, align 4, !invariant.load !43
  %multiply.107 = fmul float %56, %67
  %subtract.118 = fsub float %63, %multiply.107
  %68 = insertvalue { float, float } %61, float %subtract.118, 1
  %69 = extractvalue { float, float } %68, 0
  %70 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %69, ptr %70, align 4
  %71 = extractvalue { float, float } %68, 1
  %72 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %71, ptr %72, align 4
  %73 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %74 = load float, ptr %73, align 4, !invariant.load !43
  %75 = load float, ptr %arg2, align 4, !invariant.load !43
  %76 = add i32 %14, 0
  %77 = add i32 %13, 0
  %78 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %76, i32 %77
  %79 = load float, ptr %78, align 4, !invariant.load !43
  %multiply.79 = fmul float %75, %79
  %subtract.810 = fsub float %74, %multiply.79
  %80 = insertvalue { float, float } undef, float %subtract.810, 0
  %81 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %82 = load float, ptr %81, align 4, !invariant.load !43
  %83 = add i32 %14, 0
  %84 = add i32 %13, 96
  %85 = getelementptr inbounds [8192 x [224 x float]], ptr %arg1, i32 0, i32 %83, i32 %84
  %86 = load float, ptr %85, align 4, !invariant.load !43
  %multiply.1011 = fmul float %75, %86
  %subtract.1112 = fsub float %82, %multiply.1011
  %87 = insertvalue { float, float } %80, float %subtract.1112, 1
  %88 = extractvalue { float, float } %87, 0
  %89 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %88, ptr %89, align 4
  %90 = extractvalue { float, float } %87, 1
  %91 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %90, ptr %91, align 4
  br label %fusion_5.in_bounds-after
}

define void @concatenate_11(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(1048576) %arg1, ptr noalias align 16 dereferenceable(2097152) %arg2, ptr noalias align 16 dereferenceable(2097152) %arg3, ptr noalias align 128 dereferenceable(7340032) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !69
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !52
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 458752
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 224
  %5 = udiv i32 %linear_index_base, 224
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 224
  %8 = udiv i32 %linear_index1, 224
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 224
  %11 = udiv i32 %linear_index2, 224
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 224
  %14 = udiv i32 %linear_index3, 224
  %15 = icmp ult i32 %linear_index_base, 1835008
  br i1 %15, label %concatenate_11.in_bounds-true, label %concatenate_11.in_bounds-after

concatenate_11.in_bounds-after:                   ; preds = %concatenate.5.merge28, %entry
  ret void

concatenate_11.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.96.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 224
  %19 = mul i32 %18, 64
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 64
  %23 = udiv i32 %20, 64
  %24 = getelementptr inbounds float, ptr %arg0, i32 %20
  %25 = load float, ptr %24, align 4, !invariant.load !43
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %26 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %27 = sub nsw i32 %4, %26
  %28 = udiv i32 %linear_index_base, 224
  %29 = mul i32 %28, 32
  %30 = add i32 %29, %27
  %31 = udiv i32 %30, 1
  %32 = urem i32 %31, 32
  %33 = udiv i32 %30, 32
  %34 = getelementptr inbounds float, ptr %arg1, i32 %30
  %35 = load float, ptr %34, align 4, !invariant.load !43
  br label %concatenate.5.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.96.2
  %36 = phi i32 [ 96, %concatenate.pivot.96.2 ]
  %37 = sub nsw i32 %4, %36
  %38 = udiv i32 %linear_index_base, 224
  %39 = mul i32 %38, 64
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 64
  %43 = udiv i32 %40, 64
  %44 = getelementptr inbounds float, ptr %arg2, i32 %40
  %45 = load float, ptr %44, align 4, !invariant.load !43
  br label %concatenate.5.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.160.3
  %46 = phi i32 [ 160, %concatenate.pivot.160.3 ]
  %47 = sub nsw i32 %4, %46
  %48 = udiv i32 %linear_index_base, 224
  %49 = mul i32 %48, 64
  %50 = add i32 %49, %47
  %51 = udiv i32 %50, 1
  %52 = urem i32 %51, 64
  %53 = udiv i32 %50, 64
  %54 = getelementptr inbounds float, ptr %arg3, i32 %50
  %55 = load float, ptr %54, align 4, !invariant.load !43
  br label %concatenate.5.merge

concatenate.pivot.96.:                            ; preds = %concatenate_11.in_bounds-true
  %56 = icmp ult i32 %4, 96
  br i1 %56, label %concatenate.pivot.64., label %concatenate.pivot.160.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.96.
  %57 = icmp ult i32 %4, 64
  br i1 %57, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.160.:                           ; preds = %concatenate.pivot.96.
  %58 = icmp ult i32 %4, 160
  br i1 %58, label %concatenate.pivot.96.2, label %concatenate.pivot.160.3

concatenate.pivot.96.2:                           ; preds = %concatenate.pivot.160.
  br label %concat_index_from_operand_id2

concatenate.pivot.160.3:                          ; preds = %concatenate.pivot.160.
  br label %concat_index_from_operand_id3

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %59 = phi float [ %25, %concat_index_from_operand_id0 ], [ %35, %concat_index_from_operand_id1 ], [ %45, %concat_index_from_operand_id2 ], [ %55, %concat_index_from_operand_id3 ]
  %60 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %59, ptr %60, align 4
  br label %concatenate.pivot.96.9

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.11
  %61 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %62 = sub nsw i32 %7, %61
  %63 = udiv i32 %linear_index1, 224
  %64 = mul i32 %63, 64
  %65 = add i32 %64, %62
  %66 = udiv i32 %65, 1
  %67 = urem i32 %66, 64
  %68 = udiv i32 %65, 64
  %69 = getelementptr inbounds float, ptr %arg0, i32 %65
  %70 = load float, ptr %69, align 4, !invariant.load !43
  br label %concatenate.5.merge4

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.64.12
  %71 = phi i32 [ 64, %concatenate.pivot.64.12 ]
  %72 = sub nsw i32 %7, %71
  %73 = udiv i32 %linear_index1, 224
  %74 = mul i32 %73, 32
  %75 = add i32 %74, %72
  %76 = udiv i32 %75, 1
  %77 = urem i32 %76, 32
  %78 = udiv i32 %75, 32
  %79 = getelementptr inbounds float, ptr %arg1, i32 %75
  %80 = load float, ptr %79, align 4, !invariant.load !43
  br label %concatenate.5.merge4

concat_index_from_operand_id27:                   ; preds = %concatenate.pivot.96.14
  %81 = phi i32 [ 96, %concatenate.pivot.96.14 ]
  %82 = sub nsw i32 %7, %81
  %83 = udiv i32 %linear_index1, 224
  %84 = mul i32 %83, 64
  %85 = add i32 %84, %82
  %86 = udiv i32 %85, 1
  %87 = urem i32 %86, 64
  %88 = udiv i32 %85, 64
  %89 = getelementptr inbounds float, ptr %arg2, i32 %85
  %90 = load float, ptr %89, align 4, !invariant.load !43
  br label %concatenate.5.merge4

concat_index_from_operand_id38:                   ; preds = %concatenate.pivot.160.15
  %91 = phi i32 [ 160, %concatenate.pivot.160.15 ]
  %92 = sub nsw i32 %7, %91
  %93 = udiv i32 %linear_index1, 224
  %94 = mul i32 %93, 64
  %95 = add i32 %94, %92
  %96 = udiv i32 %95, 1
  %97 = urem i32 %96, 64
  %98 = udiv i32 %95, 64
  %99 = getelementptr inbounds float, ptr %arg3, i32 %95
  %100 = load float, ptr %99, align 4, !invariant.load !43
  br label %concatenate.5.merge4

concatenate.pivot.96.9:                           ; preds = %concatenate.5.merge
  %101 = icmp ult i32 %7, 96
  br i1 %101, label %concatenate.pivot.64.10, label %concatenate.pivot.160.13

concatenate.pivot.64.10:                          ; preds = %concatenate.pivot.96.9
  %102 = icmp ult i32 %7, 64
  br i1 %102, label %concatenate.pivot.0.11, label %concatenate.pivot.64.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.64.10
  br label %concat_index_from_operand_id05

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.64.10
  br label %concat_index_from_operand_id16

concatenate.pivot.160.13:                         ; preds = %concatenate.pivot.96.9
  %103 = icmp ult i32 %7, 160
  br i1 %103, label %concatenate.pivot.96.14, label %concatenate.pivot.160.15

concatenate.pivot.96.14:                          ; preds = %concatenate.pivot.160.13
  br label %concat_index_from_operand_id27

concatenate.pivot.160.15:                         ; preds = %concatenate.pivot.160.13
  br label %concat_index_from_operand_id38

concatenate.5.merge4:                             ; preds = %concat_index_from_operand_id38, %concat_index_from_operand_id27, %concat_index_from_operand_id16, %concat_index_from_operand_id05
  %104 = phi float [ %70, %concat_index_from_operand_id05 ], [ %80, %concat_index_from_operand_id16 ], [ %90, %concat_index_from_operand_id27 ], [ %100, %concat_index_from_operand_id38 ]
  %105 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %104, ptr %105, align 4
  br label %concatenate.pivot.96.21

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.23
  %106 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %107 = sub nsw i32 %10, %106
  %108 = udiv i32 %linear_index2, 224
  %109 = mul i32 %108, 64
  %110 = add i32 %109, %107
  %111 = udiv i32 %110, 1
  %112 = urem i32 %111, 64
  %113 = udiv i32 %110, 64
  %114 = getelementptr inbounds float, ptr %arg0, i32 %110
  %115 = load float, ptr %114, align 4, !invariant.load !43
  br label %concatenate.5.merge16

concat_index_from_operand_id118:                  ; preds = %concatenate.pivot.64.24
  %116 = phi i32 [ 64, %concatenate.pivot.64.24 ]
  %117 = sub nsw i32 %10, %116
  %118 = udiv i32 %linear_index2, 224
  %119 = mul i32 %118, 32
  %120 = add i32 %119, %117
  %121 = udiv i32 %120, 1
  %122 = urem i32 %121, 32
  %123 = udiv i32 %120, 32
  %124 = getelementptr inbounds float, ptr %arg1, i32 %120
  %125 = load float, ptr %124, align 4, !invariant.load !43
  br label %concatenate.5.merge16

concat_index_from_operand_id219:                  ; preds = %concatenate.pivot.96.26
  %126 = phi i32 [ 96, %concatenate.pivot.96.26 ]
  %127 = sub nsw i32 %10, %126
  %128 = udiv i32 %linear_index2, 224
  %129 = mul i32 %128, 64
  %130 = add i32 %129, %127
  %131 = udiv i32 %130, 1
  %132 = urem i32 %131, 64
  %133 = udiv i32 %130, 64
  %134 = getelementptr inbounds float, ptr %arg2, i32 %130
  %135 = load float, ptr %134, align 4, !invariant.load !43
  br label %concatenate.5.merge16

concat_index_from_operand_id320:                  ; preds = %concatenate.pivot.160.27
  %136 = phi i32 [ 160, %concatenate.pivot.160.27 ]
  %137 = sub nsw i32 %10, %136
  %138 = udiv i32 %linear_index2, 224
  %139 = mul i32 %138, 64
  %140 = add i32 %139, %137
  %141 = udiv i32 %140, 1
  %142 = urem i32 %141, 64
  %143 = udiv i32 %140, 64
  %144 = getelementptr inbounds float, ptr %arg3, i32 %140
  %145 = load float, ptr %144, align 4, !invariant.load !43
  br label %concatenate.5.merge16

concatenate.pivot.96.21:                          ; preds = %concatenate.5.merge4
  %146 = icmp ult i32 %10, 96
  br i1 %146, label %concatenate.pivot.64.22, label %concatenate.pivot.160.25

concatenate.pivot.64.22:                          ; preds = %concatenate.pivot.96.21
  %147 = icmp ult i32 %10, 64
  br i1 %147, label %concatenate.pivot.0.23, label %concatenate.pivot.64.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.64.22
  br label %concat_index_from_operand_id017

concatenate.pivot.64.24:                          ; preds = %concatenate.pivot.64.22
  br label %concat_index_from_operand_id118

concatenate.pivot.160.25:                         ; preds = %concatenate.pivot.96.21
  %148 = icmp ult i32 %10, 160
  br i1 %148, label %concatenate.pivot.96.26, label %concatenate.pivot.160.27

concatenate.pivot.96.26:                          ; preds = %concatenate.pivot.160.25
  br label %concat_index_from_operand_id219

concatenate.pivot.160.27:                         ; preds = %concatenate.pivot.160.25
  br label %concat_index_from_operand_id320

concatenate.5.merge16:                            ; preds = %concat_index_from_operand_id320, %concat_index_from_operand_id219, %concat_index_from_operand_id118, %concat_index_from_operand_id017
  %149 = phi float [ %115, %concat_index_from_operand_id017 ], [ %125, %concat_index_from_operand_id118 ], [ %135, %concat_index_from_operand_id219 ], [ %145, %concat_index_from_operand_id320 ]
  %150 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %149, ptr %150, align 4
  br label %concatenate.pivot.96.33

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.35
  %151 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %152 = sub nsw i32 %13, %151
  %153 = udiv i32 %linear_index3, 224
  %154 = mul i32 %153, 64
  %155 = add i32 %154, %152
  %156 = udiv i32 %155, 1
  %157 = urem i32 %156, 64
  %158 = udiv i32 %155, 64
  %159 = getelementptr inbounds float, ptr %arg0, i32 %155
  %160 = load float, ptr %159, align 4, !invariant.load !43
  br label %concatenate.5.merge28

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.64.36
  %161 = phi i32 [ 64, %concatenate.pivot.64.36 ]
  %162 = sub nsw i32 %13, %161
  %163 = udiv i32 %linear_index3, 224
  %164 = mul i32 %163, 32
  %165 = add i32 %164, %162
  %166 = udiv i32 %165, 1
  %167 = urem i32 %166, 32
  %168 = udiv i32 %165, 32
  %169 = getelementptr inbounds float, ptr %arg1, i32 %165
  %170 = load float, ptr %169, align 4, !invariant.load !43
  br label %concatenate.5.merge28

concat_index_from_operand_id231:                  ; preds = %concatenate.pivot.96.38
  %171 = phi i32 [ 96, %concatenate.pivot.96.38 ]
  %172 = sub nsw i32 %13, %171
  %173 = udiv i32 %linear_index3, 224
  %174 = mul i32 %173, 64
  %175 = add i32 %174, %172
  %176 = udiv i32 %175, 1
  %177 = urem i32 %176, 64
  %178 = udiv i32 %175, 64
  %179 = getelementptr inbounds float, ptr %arg2, i32 %175
  %180 = load float, ptr %179, align 4, !invariant.load !43
  br label %concatenate.5.merge28

concat_index_from_operand_id332:                  ; preds = %concatenate.pivot.160.39
  %181 = phi i32 [ 160, %concatenate.pivot.160.39 ]
  %182 = sub nsw i32 %13, %181
  %183 = udiv i32 %linear_index3, 224
  %184 = mul i32 %183, 64
  %185 = add i32 %184, %182
  %186 = udiv i32 %185, 1
  %187 = urem i32 %186, 64
  %188 = udiv i32 %185, 64
  %189 = getelementptr inbounds float, ptr %arg3, i32 %185
  %190 = load float, ptr %189, align 4, !invariant.load !43
  br label %concatenate.5.merge28

concatenate.pivot.96.33:                          ; preds = %concatenate.5.merge16
  %191 = icmp ult i32 %13, 96
  br i1 %191, label %concatenate.pivot.64.34, label %concatenate.pivot.160.37

concatenate.pivot.64.34:                          ; preds = %concatenate.pivot.96.33
  %192 = icmp ult i32 %13, 64
  br i1 %192, label %concatenate.pivot.0.35, label %concatenate.pivot.64.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.64.34
  br label %concat_index_from_operand_id029

concatenate.pivot.64.36:                          ; preds = %concatenate.pivot.64.34
  br label %concat_index_from_operand_id130

concatenate.pivot.160.37:                         ; preds = %concatenate.pivot.96.33
  %193 = icmp ult i32 %13, 160
  br i1 %193, label %concatenate.pivot.96.38, label %concatenate.pivot.160.39

concatenate.pivot.96.38:                          ; preds = %concatenate.pivot.160.37
  br label %concat_index_from_operand_id231

concatenate.pivot.160.39:                         ; preds = %concatenate.pivot.160.37
  br label %concat_index_from_operand_id332

concatenate.5.merge28:                            ; preds = %concat_index_from_operand_id332, %concat_index_from_operand_id231, %concat_index_from_operand_id130, %concat_index_from_operand_id029
  %194 = phi float [ %160, %concat_index_from_operand_id029 ], [ %170, %concat_index_from_operand_id130 ], [ %180, %concat_index_from_operand_id231 ], [ %190, %concat_index_from_operand_id332 ]
  %195 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %194, ptr %195, align 4
  br label %concatenate_11.in_bounds-after
}

define void @fusion_2(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(229376) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !70
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %fusion_2.in_bounds-true, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !43
  %9 = load float, ptr %arg2, align 4, !invariant.load !43
  %10 = add i32 %5, 64
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [224 x [256 x float]], ptr %arg1, i32 0, i32 %10, i32 %11
  %13 = load float, ptr %12, align 4, !invariant.load !43
  %multiply.6 = fmul float %9, %13
  %subtract.7 = fsub float %8, %multiply.6
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %subtract.7, ptr %14, align 4
  br label %fusion_2.in_bounds-after
}

define void @fusion_6(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 128 dereferenceable(229376) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(65536) %arg3, ptr noalias align 16 dereferenceable(65536) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6, ptr noalias align 128 dereferenceable(65536) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %fusion_6.in_bounds-true, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !43
  %9 = load float, ptr %arg2, align 4, !invariant.load !43
  %10 = add i32 %5, 160
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [224 x [256 x float]], ptr %arg1, i32 0, i32 %10, i32 %11
  %13 = load float, ptr %12, align 4, !invariant.load !43
  %multiply.8 = fmul float %9, %13
  %subtract.9 = fsub float %8, %multiply.8
  %14 = insertvalue { float, float, float } undef, float %subtract.9, 0
  %15 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %16 = load float, ptr %15, align 4, !invariant.load !43
  %17 = add i32 %5, 0
  %18 = add i32 %4, 0
  %19 = getelementptr inbounds [224 x [256 x float]], ptr %arg1, i32 0, i32 %17, i32 %18
  %20 = load float, ptr %19, align 4, !invariant.load !43
  %multiply.11 = fmul float %9, %20
  %subtract.12 = fsub float %16, %multiply.11
  %21 = insertvalue { float, float, float } %14, float %subtract.12, 1
  %22 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !43
  %24 = add i32 %5, 96
  %25 = add i32 %4, 0
  %26 = getelementptr inbounds [224 x [256 x float]], ptr %arg1, i32 0, i32 %24, i32 %25
  %27 = load float, ptr %26, align 4, !invariant.load !43
  %multiply.14 = fmul float %9, %27
  %subtract.15 = fsub float %23, %multiply.14
  %28 = insertvalue { float, float, float } %21, float %subtract.15, 2
  %29 = extractvalue { float, float, float } %28, 0
  %30 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %29, ptr %30, align 4
  %31 = extractvalue { float, float, float } %28, 1
  %32 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %31, ptr %32, align 4
  %33 = extractvalue { float, float, float } %28, 2
  %34 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  store float %33, ptr %34, align 4
  br label %fusion_6.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37}

!0 = !{ptr @fusion_27, !"kernel", i32 1}
!1 = !{ptr @fusion_27, !"reqntidx", i32 512}
!2 = !{ptr @fusion_20, !"kernel", i32 1}
!3 = !{ptr @fusion_20, !"reqntidx", i32 1}
!4 = !{ptr @concatenate_10, !"kernel", i32 1}
!5 = !{ptr @concatenate_10, !"reqntidx", i32 1024}
!6 = !{ptr @fusion_14, !"kernel", i32 1}
!7 = !{ptr @fusion_14, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_28, !"kernel", i32 1}
!9 = !{ptr @fusion_28, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_17, !"kernel", i32 1}
!11 = !{ptr @fusion_17, !"reqntidx", i32 128}
!12 = !{ptr @fusion_12, !"kernel", i32 1}
!13 = !{ptr @fusion_12, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_11, !"kernel", i32 1}
!15 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!16 = !{ptr @fusion_10, !"kernel", i32 1}
!17 = !{ptr @fusion_10, !"reqntidx", i32 128}
!18 = !{ptr @fusion_9, !"kernel", i32 1}
!19 = !{ptr @fusion_9, !"reqntidx", i32 1024}
!20 = !{ptr @fusion_8, !"kernel", i32 1}
!21 = !{ptr @fusion_8, !"reqntidx", i32 1024}
!22 = !{ptr @reduce_152, !"kernel", i32 1}
!23 = !{ptr @reduce_152, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_7, !"kernel", i32 1}
!25 = !{ptr @fusion_7, !"reqntidx", i32 256}
!26 = !{ptr @fusion_3, !"kernel", i32 1}
!27 = !{ptr @fusion_3, !"reqntidx", i32 256}
!28 = !{ptr @slice_20, !"kernel", i32 1}
!29 = !{ptr @slice_20, !"reqntidx", i32 256}
!30 = !{ptr @fusion_5, !"kernel", i32 1}
!31 = !{ptr @fusion_5, !"reqntidx", i32 256}
!32 = !{ptr @concatenate_11, !"kernel", i32 1}
!33 = !{ptr @concatenate_11, !"reqntidx", i32 256}
!34 = !{ptr @fusion_2, !"kernel", i32 1}
!35 = !{ptr @fusion_2, !"reqntidx", i32 1024}
!36 = !{ptr @fusion_6, !"kernel", i32 1}
!37 = !{ptr @fusion_6, !"reqntidx", i32 1024}
!38 = !{i32 0, i32 2}
!39 = !{i32 0, i32 512}
!40 = !{i32 0, i32 1}
!41 = distinct !{!41, !42}
!42 = !{!"llvm.loop.vectorize.enable", i1 false}
!43 = !{}
!44 = distinct !{!44, !42, !45}
!45 = !{!"llvm.loop.unroll.full"}
!46 = distinct !{!46, !42, !45}
!47 = distinct !{!47, !42}
!48 = distinct !{!48, !42, !45}
!49 = distinct !{!49, !42, !45}
!50 = !{i32 0, i32 56}
!51 = !{i32 0, i32 1024}
!52 = !{i32 0, i32 256}
!53 = distinct !{!53, !42, !45}
!54 = distinct !{!54, !42}
!55 = distinct !{!55, !42, !45}
!56 = distinct !{!56, !42}
!57 = distinct !{!57, !42, !45}
!58 = distinct !{!58, !42}
!59 = !{i32 0, i32 128}
!60 = !{i32 0, i32 16}
!61 = distinct !{!61, !42, !45}
!62 = distinct !{!62, !42}
!63 = !{i32 0, i32 32}
!64 = distinct !{!64, !42, !45}
!65 = distinct !{!65, !42}
!66 = !{i32 0, i32 4}
!67 = distinct !{!67, !42, !45}
!68 = distinct !{!68, !42}
!69 = !{i32 0, i32 1792}
!70 = !{i32 0, i32 8}
