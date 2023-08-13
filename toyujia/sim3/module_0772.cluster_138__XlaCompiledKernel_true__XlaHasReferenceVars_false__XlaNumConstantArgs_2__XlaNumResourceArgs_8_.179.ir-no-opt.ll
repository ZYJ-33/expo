target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache2 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @fusion_15(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 524288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 8192
  %7 = udiv i32 %linear_index_base, 524288
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %linear_index1, 64
  %11 = urem i32 %10, 8192
  %12 = udiv i32 %linear_index1, 524288
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 64
  %15 = udiv i32 %linear_index2, 64
  %16 = urem i32 %15, 8192
  %17 = udiv i32 %linear_index2, 524288
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 64
  %20 = udiv i32 %linear_index3, 64
  %21 = urem i32 %20, 8192
  %22 = udiv i32 %linear_index3, 524288
  %23 = icmp ult i32 %linear_index_base, 2097152
  br i1 %23, label %fusion_15.in_bounds-true, label %fusion_15.in_bounds-after

fusion_15.in_bounds-after:                        ; preds = %fusion_15.in_bounds-true, %entry
  ret void

fusion_15.in_bounds-true:                         ; preds = %entry
  %24 = mul nuw nsw i32 %4, 1
  %25 = add nuw nsw i32 0, %24
  %26 = mul nuw nsw i32 %7, 64
  %27 = add nuw nsw i32 %25, %26
  %28 = udiv i32 %27, 256
  %29 = mul nuw nsw i32 %6, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  %32 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %30, i32 %27
  %33 = load float, ptr %32, align 4, !invariant.load !22
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %33, ptr %34, align 4
  %35 = mul nuw nsw i32 %9, 1
  %36 = add nuw nsw i32 0, %35
  %37 = mul nuw nsw i32 %12, 64
  %38 = add nuw nsw i32 %36, %37
  %39 = udiv i32 %38, 256
  %40 = mul nuw nsw i32 %11, 1
  %41 = add nuw nsw i32 0, %40
  %42 = udiv i32 %41, 8192
  %43 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %41, i32 %38
  %44 = load float, ptr %43, align 4, !invariant.load !22
  %45 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %44, ptr %45, align 4
  %46 = mul nuw nsw i32 %14, 1
  %47 = add nuw nsw i32 0, %46
  %48 = mul nuw nsw i32 %17, 64
  %49 = add nuw nsw i32 %47, %48
  %50 = udiv i32 %49, 256
  %51 = mul nuw nsw i32 %16, 1
  %52 = add nuw nsw i32 0, %51
  %53 = udiv i32 %52, 8192
  %54 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %52, i32 %49
  %55 = load float, ptr %54, align 4, !invariant.load !22
  %56 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %55, ptr %56, align 4
  %57 = mul nuw nsw i32 %19, 1
  %58 = add nuw nsw i32 0, %57
  %59 = mul nuw nsw i32 %22, 64
  %60 = add nuw nsw i32 %58, %59
  %61 = udiv i32 %60, 256
  %62 = mul nuw nsw i32 %21, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 8192
  %65 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %63, i32 %60
  %66 = load float, ptr %65, align 4, !invariant.load !22
  %67 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %66, ptr %67, align 4
  br label %fusion_15.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_14(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 16 dereferenceable(6553600) %arg1, ptr noalias align 16 dereferenceable(419430400) %arg2, ptr noalias align 128 dereferenceable(419430400) %arg3, ptr noalias align 128 dereferenceable(6553600) %arg4) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer84 = alloca float, align 4
  %result_from_other_lane82 = alloca float, align 4
  %return_buffer81 = alloca float, align 4
  %result_from_other_lane79 = alloca float, align 4
  %return_buffer78 = alloca float, align 4
  %result_from_other_lane76 = alloca float, align 4
  %return_buffer75 = alloca float, align 4
  %result_from_other_lane73 = alloca float, align 4
  %return_buffer72 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %tile_loop.invar_address29 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !23
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_26_constant_19 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_26_constant_19, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 1638400
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 1638400
  %15 = udiv i32 %8, 1638400
  %16 = icmp eq i32 %14, 1638399
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 64, i32 512
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = icmp eq i32 512, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit26, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !26

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result71 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result71, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_20(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer72)
  %22 = load float, ptr %return_buffer72, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result74 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result74, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane73, align 4
  call void @region_1_20(ptr %current_output, ptr %result_from_other_lane73, ptr %return_buffer75)
  %24 = load float, ptr %return_buffer75, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result77 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result77, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane76, align 4
  call void @region_1_20(ptr %current_output, ptr %result_from_other_lane76, ptr %return_buffer78)
  %26 = load float, ptr %return_buffer78, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result80 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result80, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane79, align 4
  call void @region_1_20(ptr %current_output, ptr %result_from_other_lane79, ptr %return_buffer81)
  %28 = load float, ptr %return_buffer81, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result83 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result83, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane82, align 4
  call void @region_1_20(ptr %current_output, ptr %result_from_other_lane82, ptr %return_buffer84)
  %30 = load float, ptr %return_buffer84, align 4
  store float %30, ptr %current_output, align 4
  %31 = udiv i32 %thread_id.x, 32
  %32 = icmp eq i32 %lane_id, 0
  br i1 %32, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %33 = icmp eq i32 %31, 0
  br i1 %33, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %34 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %concatenate.16.merge, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %35 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %35, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %36 = icmp eq i32 %tile_loop.indvar, 0
  %37 = mul i32 %tile_loop.indvar, 32
  %38 = add i32 %37, 0
  %x_loc = add i32 %38, %34
  %39 = add i32 %tile_origin.1, %y_in_tile.indvar
  %40 = add i32 %tile_origin.2, %x_loc
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %39, 64
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 104857600
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 50
  %51 = udiv i32 %46, 3200
  %52 = urem i32 %51, 8192
  %53 = udiv i32 %46, 26214400
  %Arg_0.1 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 %53, i32 %52, i32 %48
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !22
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %46
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !22
  %multiply.18 = fmul float %Arg_0.13, %Arg_2.34
  store float %multiply.18, ptr %reduction_input_address, align 4
  %54 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_20(ptr %54, ptr %reduction_input_address, ptr %return_buffer)
  %55 = load float, ptr %return_buffer, align 4
  store float %55, ptr %54, align 4
  %56 = mul nuw nsw i32 %48, 1
  %57 = add nuw nsw i32 0, %56
  %58 = mul nuw nsw i32 %50, 64
  %59 = add nuw nsw i32 %57, %58
  %60 = mul nuw nsw i32 %52, 3200
  %61 = add nuw nsw i32 %59, %60
  %62 = mul nuw nsw i32 %53, 26214400
  %63 = add nuw nsw i32 %61, %62
  %64 = urem i32 %63, 256
  %65 = udiv i32 %63, 256
  %66 = udiv i32 %65, 409600
  %67 = mul nuw nsw i32 %64, 1
  %68 = add nuw nsw i32 0, %67
  %69 = udiv i32 %68, 256
  %70 = mul nuw nsw i32 %65, 1
  %71 = add nuw nsw i32 0, %70
  %72 = urem i32 %71, 50
  %73 = udiv i32 %71, 50
  %74 = udiv i32 %73, 8192
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %75 = phi i32 [ 0, %concatenate.pivot.0. ]
  %76 = sub nsw i32 %68, %75
  %77 = udiv i32 %46, 256
  %78 = mul i32 %77, 64
  %79 = add i32 %78, %76
  %80 = udiv i32 %79, 1
  %81 = urem i32 %80, 64
  %82 = udiv i32 %79, 64
  %83 = urem i32 %82, 50
  %84 = udiv i32 %79, 3200
  %85 = add i32 %73, 0
  %86 = add i32 %72, 0
  %87 = add i32 %76, 0
  %Arg_1.2 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr %arg1, i32 0, i32 0, i32 %85, i32 0, i32 %86
  %Arg_1.25 = load float, ptr %Arg_1.2, align 4, !invariant.load !22
  %Arg_0.16 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 0, i32 %85, i32 %87
  %Arg_0.17 = load float, ptr %Arg_0.16, align 4, !invariant.load !22
  %multiply.7 = fmul float %Arg_1.25, %Arg_0.17
  br label %concatenate.16.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.23
  %88 = phi i32 [ 64, %concatenate.pivot.64.23 ]
  %89 = sub nsw i32 %68, %88
  %90 = udiv i32 %46, 256
  %91 = mul i32 %90, 64
  %92 = add i32 %91, %89
  %93 = udiv i32 %92, 1
  %94 = urem i32 %93, 64
  %95 = udiv i32 %92, 64
  %96 = urem i32 %95, 50
  %97 = udiv i32 %92, 3200
  %98 = add i32 %73, 0
  %99 = add i32 %72, 0
  %100 = add i32 %89, 0
  %Arg_1.28 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr %arg1, i32 0, i32 1, i32 %98, i32 0, i32 %99
  %Arg_1.29 = load float, ptr %Arg_1.28, align 4, !invariant.load !22
  %Arg_0.110 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 1, i32 %98, i32 %100
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !22
  %multiply.712 = fmul float %Arg_1.29, %Arg_0.111
  br label %concatenate.16.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.128.24
  %101 = phi i32 [ 128, %concatenate.pivot.128.24 ]
  %102 = sub nsw i32 %68, %101
  %103 = udiv i32 %46, 256
  %104 = mul i32 %103, 64
  %105 = add i32 %104, %102
  %106 = udiv i32 %105, 1
  %107 = urem i32 %106, 64
  %108 = udiv i32 %105, 64
  %109 = urem i32 %108, 50
  %110 = udiv i32 %105, 3200
  %111 = add i32 %73, 0
  %112 = add i32 %72, 0
  %113 = add i32 %102, 0
  %Arg_1.213 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr %arg1, i32 0, i32 2, i32 %111, i32 0, i32 %112
  %Arg_1.214 = load float, ptr %Arg_1.213, align 4, !invariant.load !22
  %Arg_0.115 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 2, i32 %111, i32 %113
  %Arg_0.116 = load float, ptr %Arg_0.115, align 4, !invariant.load !22
  %multiply.717 = fmul float %Arg_1.214, %Arg_0.116
  br label %concatenate.16.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.192.25
  %114 = phi i32 [ 192, %concatenate.pivot.192.25 ]
  %115 = sub nsw i32 %68, %114
  %116 = udiv i32 %46, 256
  %117 = mul i32 %116, 64
  %118 = add i32 %117, %115
  %119 = udiv i32 %118, 1
  %120 = urem i32 %119, 64
  %121 = udiv i32 %118, 64
  %122 = urem i32 %121, 50
  %123 = udiv i32 %118, 3200
  %124 = add i32 %73, 0
  %125 = add i32 %72, 0
  %126 = add i32 %115, 0
  %Arg_1.218 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr %arg1, i32 0, i32 3, i32 %124, i32 0, i32 %125
  %Arg_1.219 = load float, ptr %Arg_1.218, align 4, !invariant.load !22
  %Arg_0.120 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 3, i32 %124, i32 %126
  %Arg_0.121 = load float, ptr %Arg_0.120, align 4, !invariant.load !22
  %multiply.722 = fmul float %Arg_1.219, %Arg_0.121
  br label %concatenate.16.merge

concatenate.pivot.128.:                           ; preds = %tile_loop.loop_body
  %127 = icmp ult i32 %68, 128
  br i1 %127, label %concatenate.pivot.64., label %concatenate.pivot.192.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %128 = icmp ult i32 %68, 64
  br i1 %128, label %concatenate.pivot.0., label %concatenate.pivot.64.23

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.23:                          ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.192.:                           ; preds = %concatenate.pivot.128.
  %129 = icmp ult i32 %68, 192
  br i1 %129, label %concatenate.pivot.128.24, label %concatenate.pivot.192.25

concatenate.pivot.128.24:                         ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id2

concatenate.pivot.192.25:                         ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id3

concatenate.16.merge:                             ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %130 = phi float [ %multiply.7, %concat_index_from_operand_id0 ], [ %multiply.712, %concat_index_from_operand_id1 ], [ %multiply.717, %concat_index_from_operand_id2 ], [ %multiply.722, %concat_index_from_operand_id3 ]
  %131 = mul nuw nsw i32 %48, 1
  %132 = add nuw nsw i32 0, %131
  %133 = mul nuw nsw i32 %50, 64
  %134 = add nuw nsw i32 %132, %133
  %135 = mul nuw nsw i32 %52, 3200
  %136 = add nuw nsw i32 %134, %135
  %137 = mul nuw nsw i32 %53, 26214400
  %138 = add nuw nsw i32 %136, %137
  %139 = urem i32 %138, 256
  %140 = udiv i32 %138, 256
  %141 = udiv i32 %140, 409600
  %142 = getelementptr inbounds float, ptr %arg3, i32 %46
  store float %130, ptr %142, align 4
  br label %tile_loop.loop_header, !llvm.loop !28

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %143 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address29, align 4
  br label %tile_loop.loop_header27

tile_loop.loop_header27:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar30 = load i32, ptr %tile_loop.invar_address29, align 4
  %144 = icmp uge i32 %tile_loop.indvar30, 16
  br i1 %144, label %tile_loop.loop_exit26, label %tile_loop.loop_body28

tile_loop.loop_body28:                            ; preds = %tile_loop.loop_header27
  %invar.inc31 = add nuw nsw i32 %tile_loop.indvar30, 1
  store i32 %invar.inc31, ptr %tile_loop.invar_address29, align 4
  %145 = icmp eq i32 %tile_loop.indvar30, 0
  %146 = mul i32 %tile_loop.indvar30, 32
  %147 = add i32 %146, 0
  %x_loc32 = add i32 %147, %143
  %148 = add i32 %tile_origin.1, %y_in_tile.indvar
  %149 = add i32 %tile_origin.2, %x_loc32
  %150 = icmp ult i32 %x_loc32, %tile_bound1
  br i1 %150, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.16.merge39, %tile_loop.loop_body28
  br label %tile_loop.loop_header27, !llvm.loop !30

tile_loop.loop_exit26:                            ; preds = %tile_loop.loop_header27
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body28
  %151 = mul nuw nsw i32 %149, 1
  %152 = add nuw nsw i32 0, %151
  %153 = mul nuw nsw i32 %148, 64
  %154 = add nuw nsw i32 %152, %153
  %155 = mul nuw nsw i32 %tile_origin.0, 104857600
  %156 = add nuw nsw i32 %154, %155
  %157 = udiv i32 %156, 1
  %158 = urem i32 %157, 64
  %159 = udiv i32 %156, 64
  %160 = urem i32 %159, 50
  %161 = udiv i32 %156, 3200
  %162 = urem i32 %161, 8192
  %163 = udiv i32 %156, 26214400
  %Arg_0.133 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 %163, i32 %162, i32 %158
  %Arg_0.134 = load float, ptr %Arg_0.133, align 4, !invariant.load !22
  %Arg_2.335 = getelementptr inbounds float, ptr %arg2, i32 %156
  %Arg_2.336 = load float, ptr %Arg_2.335, align 4, !invariant.load !22
  %multiply.1837 = fmul float %Arg_0.134, %Arg_2.336
  store float %multiply.1837, ptr %reduction_input_address, align 4
  %164 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_20(ptr %164, ptr %reduction_input_address, ptr %return_buffer38)
  %165 = load float, ptr %return_buffer38, align 4
  store float %165, ptr %164, align 4
  %166 = mul nuw nsw i32 %158, 1
  %167 = add nuw nsw i32 0, %166
  %168 = mul nuw nsw i32 %160, 64
  %169 = add nuw nsw i32 %167, %168
  %170 = mul nuw nsw i32 %162, 3200
  %171 = add nuw nsw i32 %169, %170
  %172 = mul nuw nsw i32 %163, 26214400
  %173 = add nuw nsw i32 %171, %172
  %174 = urem i32 %173, 256
  %175 = udiv i32 %173, 256
  %176 = udiv i32 %175, 409600
  %177 = mul nuw nsw i32 %174, 1
  %178 = add nuw nsw i32 0, %177
  %179 = udiv i32 %178, 256
  %180 = mul nuw nsw i32 %175, 1
  %181 = add nuw nsw i32 0, %180
  %182 = urem i32 %181, 50
  %183 = udiv i32 %181, 50
  %184 = udiv i32 %183, 8192
  br label %concatenate.pivot.128.64

concat_index_from_operand_id040:                  ; preds = %concatenate.pivot.0.66
  %185 = phi i32 [ 0, %concatenate.pivot.0.66 ]
  %186 = sub nsw i32 %178, %185
  %187 = udiv i32 %156, 256
  %188 = mul i32 %187, 64
  %189 = add i32 %188, %186
  %190 = udiv i32 %189, 1
  %191 = urem i32 %190, 64
  %192 = udiv i32 %189, 64
  %193 = urem i32 %192, 50
  %194 = udiv i32 %189, 3200
  %195 = add i32 %183, 0
  %196 = add i32 %182, 0
  %197 = add i32 %186, 0
  %Arg_1.241 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr %arg1, i32 0, i32 0, i32 %195, i32 0, i32 %196
  %Arg_1.242 = load float, ptr %Arg_1.241, align 4, !invariant.load !22
  %Arg_0.143 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 0, i32 %195, i32 %197
  %Arg_0.144 = load float, ptr %Arg_0.143, align 4, !invariant.load !22
  %multiply.745 = fmul float %Arg_1.242, %Arg_0.144
  br label %concatenate.16.merge39

concat_index_from_operand_id146:                  ; preds = %concatenate.pivot.64.67
  %198 = phi i32 [ 64, %concatenate.pivot.64.67 ]
  %199 = sub nsw i32 %178, %198
  %200 = udiv i32 %156, 256
  %201 = mul i32 %200, 64
  %202 = add i32 %201, %199
  %203 = udiv i32 %202, 1
  %204 = urem i32 %203, 64
  %205 = udiv i32 %202, 64
  %206 = urem i32 %205, 50
  %207 = udiv i32 %202, 3200
  %208 = add i32 %183, 0
  %209 = add i32 %182, 0
  %210 = add i32 %199, 0
  %Arg_1.247 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr %arg1, i32 0, i32 1, i32 %208, i32 0, i32 %209
  %Arg_1.248 = load float, ptr %Arg_1.247, align 4, !invariant.load !22
  %Arg_0.149 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 1, i32 %208, i32 %210
  %Arg_0.150 = load float, ptr %Arg_0.149, align 4, !invariant.load !22
  %multiply.751 = fmul float %Arg_1.248, %Arg_0.150
  br label %concatenate.16.merge39

concat_index_from_operand_id252:                  ; preds = %concatenate.pivot.128.69
  %211 = phi i32 [ 128, %concatenate.pivot.128.69 ]
  %212 = sub nsw i32 %178, %211
  %213 = udiv i32 %156, 256
  %214 = mul i32 %213, 64
  %215 = add i32 %214, %212
  %216 = udiv i32 %215, 1
  %217 = urem i32 %216, 64
  %218 = udiv i32 %215, 64
  %219 = urem i32 %218, 50
  %220 = udiv i32 %215, 3200
  %221 = add i32 %183, 0
  %222 = add i32 %182, 0
  %223 = add i32 %212, 0
  %Arg_1.253 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr %arg1, i32 0, i32 2, i32 %221, i32 0, i32 %222
  %Arg_1.254 = load float, ptr %Arg_1.253, align 4, !invariant.load !22
  %Arg_0.155 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 2, i32 %221, i32 %223
  %Arg_0.156 = load float, ptr %Arg_0.155, align 4, !invariant.load !22
  %multiply.757 = fmul float %Arg_1.254, %Arg_0.156
  br label %concatenate.16.merge39

concat_index_from_operand_id358:                  ; preds = %concatenate.pivot.192.70
  %224 = phi i32 [ 192, %concatenate.pivot.192.70 ]
  %225 = sub nsw i32 %178, %224
  %226 = udiv i32 %156, 256
  %227 = mul i32 %226, 64
  %228 = add i32 %227, %225
  %229 = udiv i32 %228, 1
  %230 = urem i32 %229, 64
  %231 = udiv i32 %228, 64
  %232 = urem i32 %231, 50
  %233 = udiv i32 %228, 3200
  %234 = add i32 %183, 0
  %235 = add i32 %182, 0
  %236 = add i32 %225, 0
  %Arg_1.259 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr %arg1, i32 0, i32 3, i32 %234, i32 0, i32 %235
  %Arg_1.260 = load float, ptr %Arg_1.259, align 4, !invariant.load !22
  %Arg_0.161 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 3, i32 %234, i32 %236
  %Arg_0.162 = load float, ptr %Arg_0.161, align 4, !invariant.load !22
  %multiply.763 = fmul float %Arg_1.260, %Arg_0.162
  br label %concatenate.16.merge39

concatenate.pivot.128.64:                         ; preds = %x_in_tile-true
  %237 = icmp ult i32 %178, 128
  br i1 %237, label %concatenate.pivot.64.65, label %concatenate.pivot.192.68

concatenate.pivot.64.65:                          ; preds = %concatenate.pivot.128.64
  %238 = icmp ult i32 %178, 64
  br i1 %238, label %concatenate.pivot.0.66, label %concatenate.pivot.64.67

concatenate.pivot.0.66:                           ; preds = %concatenate.pivot.64.65
  br label %concat_index_from_operand_id040

concatenate.pivot.64.67:                          ; preds = %concatenate.pivot.64.65
  br label %concat_index_from_operand_id146

concatenate.pivot.192.68:                         ; preds = %concatenate.pivot.128.64
  %239 = icmp ult i32 %178, 192
  br i1 %239, label %concatenate.pivot.128.69, label %concatenate.pivot.192.70

concatenate.pivot.128.69:                         ; preds = %concatenate.pivot.192.68
  br label %concat_index_from_operand_id252

concatenate.pivot.192.70:                         ; preds = %concatenate.pivot.192.68
  br label %concat_index_from_operand_id358

concatenate.16.merge39:                           ; preds = %concat_index_from_operand_id358, %concat_index_from_operand_id252, %concat_index_from_operand_id146, %concat_index_from_operand_id040
  %240 = phi float [ %multiply.745, %concat_index_from_operand_id040 ], [ %multiply.751, %concat_index_from_operand_id146 ], [ %multiply.757, %concat_index_from_operand_id252 ], [ %multiply.763, %concat_index_from_operand_id358 ]
  %241 = mul nuw nsw i32 %158, 1
  %242 = add nuw nsw i32 0, %241
  %243 = mul nuw nsw i32 %160, 64
  %244 = add nuw nsw i32 %242, %243
  %245 = mul nuw nsw i32 %162, 3200
  %246 = add nuw nsw i32 %244, %245
  %247 = mul nuw nsw i32 %163, 26214400
  %248 = add nuw nsw i32 %246, %247
  %249 = urem i32 %248, 256
  %250 = udiv i32 %248, 256
  %251 = udiv i32 %250, 409600
  %252 = getelementptr inbounds float, ptr %arg3, i32 %156
  store float %240, ptr %252, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %253 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %254 = addrspacecast ptr addrspace(3) %253 to ptr
  %255 = load float, ptr %current_output, align 4
  store float %255, ptr %254, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %256 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %257 = addrspacecast ptr addrspace(3) %256 to ptr
  store float %region_0_26_constant_19, ptr %initial_value_addr, align 4
  %258 = icmp ult i32 %thread_id.x, 1
  %259 = select i1 %258, ptr %257, ptr %initial_value_addr
  %260 = icmp eq i32 %thread_id.x, 0
  br i1 %260, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %261 = mul i32 %thread_id.x, 1
  %262 = add i32 %tile_origin.1, %thread_id.y
  %263 = add i32 %tile_origin.2, %261
  %264 = add i32 %263, 0
  %265 = udiv i32 %262, 1
  %266 = urem i32 %265, 50
  %267 = udiv i32 %262, 50
  %268 = urem i32 %267, 8192
  %269 = udiv i32 %262, 409600
  %output_element_address = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg4, i32 0, i32 %269, i32 %268, i32 %266
  %output = load float, ptr %259, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_20(ptr dereferenceable(4) %Arg_0.21.typed, ptr dereferenceable(4) %Arg_1.22.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.23.typed = alloca float, align 4
  %Arg_0.21 = load float, ptr %Arg_0.21.typed, align 4
  %Arg_1.22 = load float, ptr %Arg_1.22.typed, align 4
  %add.23 = fadd float %Arg_0.21, %Arg_1.22
  store float %add.23, ptr %add.23.typed, align 4
  %load_ret_value = load float, ptr %add.23.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define void @fusion_11(ptr noalias align 16 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(6553600) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
entry:
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !23
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 32768
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 32768
  %15 = udiv i32 %8, 32768
  %16 = icmp eq i32 %14, 32767
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 50, i32 512
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = icmp eq i32 512, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !32

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
  %30 = load float, ptr %return_buffer31, align 4
  store float %30, ptr %current_output, align 4
  %31 = udiv i32 %thread_id.x, 32
  %32 = icmp eq i32 %lane_id, 0
  br i1 %32, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %33 = icmp eq i32 %31, 0
  br i1 %33, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %34 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %35 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %35, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %36 = icmp eq i32 %tile_loop.indvar, 0
  %37 = mul i32 %tile_loop.indvar, 32
  %38 = add i32 %37, 0
  %x_loc = add i32 %38, %34
  %39 = add i32 %tile_origin.1, %y_in_tile.indvar
  %40 = add i32 %tile_origin.2, %x_loc
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %39, 50
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 1638400
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 50
  %49 = udiv i32 %46, 50
  %50 = urem i32 %49, 8192
  %51 = udiv i32 %46, 409600
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !22
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !22
  %multiply.4 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.4, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !33

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %54 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %55 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %55, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %56 = icmp eq i32 %tile_loop.indvar9, 0
  %57 = mul i32 %tile_loop.indvar9, 32
  %58 = add i32 %57, 0
  %x_loc11 = add i32 %58, %54
  %59 = add i32 %tile_origin.1, %y_in_tile.indvar
  %60 = add i32 %tile_origin.2, %x_loc11
  %61 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %61, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !34

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %62 = mul nuw nsw i32 %60, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %59, 50
  %65 = add nuw nsw i32 %63, %64
  %66 = mul nuw nsw i32 %tile_origin.0, 1638400
  %67 = add nuw nsw i32 %65, %66
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 50
  %70 = udiv i32 %67, 50
  %71 = urem i32 %70, 8192
  %72 = udiv i32 %67, 409600
  %Arg_1.212 = getelementptr inbounds float, ptr %arg1, i32 %67
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !22
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !22
  %multiply.416 = fmul float %Arg_1.213, %Arg_0.115
  store float %multiply.416, ptr %reduction_input_address, align 4
  %73 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %73, ptr %reduction_input_address, ptr %return_buffer17)
  %74 = load float, ptr %return_buffer17, align 4
  store float %74, ptr %73, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %75 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %31
  %76 = addrspacecast ptr addrspace(3) %75 to ptr
  %77 = load float, ptr %current_output, align 4
  store float %77, ptr %76, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %78 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %lane_id
  %79 = addrspacecast ptr addrspace(3) %78 to ptr
  store float %region_0_12_constant_6, ptr %initial_value_addr, align 4
  %80 = icmp ult i32 %thread_id.x, 1
  %81 = select i1 %80, ptr %79, ptr %initial_value_addr
  %82 = icmp eq i32 %thread_id.x, 0
  br i1 %82, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %83 = mul i32 %thread_id.x, 1
  %84 = add i32 %tile_origin.1, %thread_id.y
  %85 = add i32 %tile_origin.2, %83
  %86 = add i32 %85, 0
  %87 = udiv i32 %84, 1
  %88 = urem i32 %87, 8192
  %89 = udiv i32 %84, 8192
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr %arg2, i32 0, i32 %89, i32 %88
  %output = load float, ptr %81, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_7(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.10.typed = alloca float, align 4
  %Arg_0.8 = load float, ptr %Arg_0.8.typed, align 4
  %Arg_1.9 = load float, ptr %Arg_1.9.typed, align 4
  %add.10 = fadd float %Arg_0.8, %Arg_1.9
  store float %add.10, ptr %add.10.typed, align 4
  %load_ret_value = load float, ptr %add.10.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_10(ptr noalias align 16 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(6553600) %arg3, ptr noalias align 128 dereferenceable(6553600) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 409600
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 50
  %5 = udiv i32 %linear_index_base, 50
  %6 = urem i32 %5, 8192
  %7 = udiv i32 %linear_index_base, 409600
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 50
  %10 = udiv i32 %linear_index1, 50
  %11 = urem i32 %10, 8192
  %12 = udiv i32 %linear_index1, 409600
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 50
  %15 = udiv i32 %linear_index2, 50
  %16 = urem i32 %15, 8192
  %17 = udiv i32 %linear_index2, 409600
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 50
  %20 = udiv i32 %linear_index3, 50
  %21 = urem i32 %20, 8192
  %22 = udiv i32 %linear_index3, 409600
  %23 = icmp ult i32 %linear_index_base, 1638400
  br i1 %23, label %fusion_10.in_bounds-true, label %fusion_10.in_bounds-after

fusion_10.in_bounds-after:                        ; preds = %fusion_10.in_bounds-true, %entry
  ret void

fusion_10.in_bounds-true:                         ; preds = %entry
  %24 = load float, ptr %arg2, align 4, !invariant.load !22
  %25 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %26 = load float, ptr %25, align 4, !invariant.load !22
  %27 = udiv i32 %linear_index_base, 50
  %28 = getelementptr inbounds float, ptr %arg1, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !22
  %subtract.8 = fsub float %26, %29
  %multiply.9 = fmul float %24, %subtract.8
  %30 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %31 = load float, ptr %30, align 4, !invariant.load !22
  %multiply.10 = fmul float %multiply.9, %31
  %32 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %multiply.10, ptr %32, align 4
  %33 = load float, ptr %arg2, align 4, !invariant.load !22
  %34 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %35 = load float, ptr %34, align 4, !invariant.load !22
  %36 = udiv i32 %linear_index1, 50
  %37 = getelementptr inbounds float, ptr %arg1, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !22
  %subtract.81 = fsub float %35, %38
  %multiply.92 = fmul float %33, %subtract.81
  %39 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %40 = load float, ptr %39, align 4, !invariant.load !22
  %multiply.103 = fmul float %multiply.92, %40
  %41 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %multiply.103, ptr %41, align 4
  %42 = load float, ptr %arg2, align 4, !invariant.load !22
  %43 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %44 = load float, ptr %43, align 4, !invariant.load !22
  %45 = udiv i32 %linear_index2, 50
  %46 = getelementptr inbounds float, ptr %arg1, i32 %45
  %47 = load float, ptr %46, align 4, !invariant.load !22
  %subtract.84 = fsub float %44, %47
  %multiply.95 = fmul float %42, %subtract.84
  %48 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %49 = load float, ptr %48, align 4, !invariant.load !22
  %multiply.106 = fmul float %multiply.95, %49
  %50 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %multiply.106, ptr %50, align 4
  %51 = load float, ptr %arg2, align 4, !invariant.load !22
  %52 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %53 = load float, ptr %52, align 4, !invariant.load !22
  %54 = udiv i32 %linear_index3, 50
  %55 = getelementptr inbounds float, ptr %arg1, i32 %54
  %56 = load float, ptr %55, align 4, !invariant.load !22
  %subtract.87 = fsub float %53, %56
  %multiply.98 = fmul float %51, %subtract.87
  %57 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %58 = load float, ptr %57, align 4, !invariant.load !22
  %multiply.109 = fmul float %multiply.98, %58
  %59 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %multiply.109, ptr %59, align 4
  br label %fusion_10.in_bounds-after
}

define void @fusion_9(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(6553600) %arg1, ptr noalias align 16 dereferenceable(419430400) %arg2, ptr noalias align 128 dereferenceable(419430400) %arg3, ptr noalias align 128 dereferenceable(8388608) %arg4) {
entry:
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
  %result_from_other_lane78 = alloca float, align 4
  %return_buffer77 = alloca float, align 4
  %result_from_other_lane75 = alloca float, align 4
  %return_buffer74 = alloca float, align 4
  %result_from_other_lane72 = alloca float, align 4
  %return_buffer71 = alloca float, align 4
  %result_from_other_lane69 = alloca float, align 4
  %return_buffer68 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer34 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !23
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after100, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_26_constant_19 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_26_constant_19, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_26_constant_19, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 32768
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
  %tile_bound = select i1 %17, i32 50, i32 4096
  %18 = icmp eq i32 %13, 0
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after28, %y_in_tile.loop_body
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

x_in_tile-after:                                  ; preds = %concatenate.16.merge, %tile_loop.loop_body
  %29 = mul i32 %tile_loop.indvar, 2
  %30 = add i32 %29, 1
  %x_loc26 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc26
  %33 = icmp ult i32 %x_loc26, %tile_bound1
  br i1 %33, label %x_in_tile-true27, label %x_in_tile-after28

x_in_tile-after28:                                ; preds = %concatenate.16.merge35, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !38

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !39

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result67 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_20__1(ptr %36, ptr %result_from_other_lane, ptr %return_buffer68)
  %38 = load float, ptr %return_buffer68, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result70 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result70, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane69, align 4
  call void @region_1_20__1(ptr %36, ptr %result_from_other_lane69, ptr %return_buffer71)
  %40 = load float, ptr %return_buffer71, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result73 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result73, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane72, align 4
  call void @region_1_20__1(ptr %36, ptr %result_from_other_lane72, ptr %return_buffer74)
  %42 = load float, ptr %return_buffer74, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result76 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result76, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane75, align 4
  call void @region_1_20__1(ptr %36, ptr %result_from_other_lane75, ptr %return_buffer77)
  %44 = load float, ptr %return_buffer77, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result79 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result79, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane78, align 4
  call void @region_1_20__1(ptr %36, ptr %result_from_other_lane78, ptr %return_buffer80)
  %46 = load float, ptr %return_buffer80, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output82, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr83 to ptr
  %partial_reduction_result85 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane84, align 4
  call void @region_1_20__1(ptr %55, ptr %result_from_other_lane84, ptr %return_buffer86)
  %57 = load float, ptr %return_buffer86, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result88 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane87, align 4
  call void @region_1_20__1(ptr %55, ptr %result_from_other_lane87, ptr %return_buffer89)
  %59 = load float, ptr %return_buffer89, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result91 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result91, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane90, align 4
  call void @region_1_20__1(ptr %55, ptr %result_from_other_lane90, ptr %return_buffer92)
  %61 = load float, ptr %return_buffer92, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result94 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result94, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane93, align 4
  call void @region_1_20__1(ptr %55, ptr %result_from_other_lane93, ptr %return_buffer95)
  %63 = load float, ptr %return_buffer95, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result97 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result97, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane96, align 4
  call void @region_1_20__1(ptr %55, ptr %result_from_other_lane96, ptr %return_buffer98)
  %65 = load float, ptr %return_buffer98, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 64
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 3200
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 50
  %82 = udiv i32 %77, 3200
  %83 = urem i32 %82, 8192
  %84 = udiv i32 %77, 26214400
  %85 = mul i32 %thread_id.x, 2
  %86 = sub i32 %x_loc, %85
  %Arg_1.2 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 %84, i32 %83, i32 %81
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !22
  %Arg_2.3 = getelementptr inbounds [4 x [8192 x [50 x [64 x float]]]], ptr %arg2, i32 0, i32 %84, i32 %83, i32 %81, i32 %79
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !22
  %multiply.18 = fmul float %Arg_1.23, %Arg_2.34
  store float %multiply.18, ptr %reduction_input_address, align 4
  %87 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %86
  call void @region_1_20__1(ptr %87, ptr %reduction_input_address, ptr %return_buffer)
  %88 = load float, ptr %return_buffer, align 4
  store float %88, ptr %87, align 4
  %89 = mul nuw nsw i32 %79, 1
  %90 = add nuw nsw i32 0, %89
  %91 = mul nuw nsw i32 %81, 64
  %92 = add nuw nsw i32 %90, %91
  %93 = mul nuw nsw i32 %83, 3200
  %94 = add nuw nsw i32 %92, %93
  %95 = mul nuw nsw i32 %84, 26214400
  %96 = add nuw nsw i32 %94, %95
  %97 = urem i32 %96, 256
  %98 = udiv i32 %96, 256
  %99 = udiv i32 %98, 409600
  %100 = mul nuw nsw i32 %97, 1
  %101 = add nuw nsw i32 0, %100
  %102 = udiv i32 %101, 256
  %103 = mul nuw nsw i32 %98, 1
  %104 = add nuw nsw i32 0, %103
  %105 = urem i32 %104, 50
  %106 = udiv i32 %104, 50
  %107 = udiv i32 %106, 8192
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %108 = phi i32 [ 0, %concatenate.pivot.0. ]
  %109 = sub nsw i32 %101, %108
  %110 = udiv i32 %77, 256
  %111 = mul i32 %110, 64
  %112 = add i32 %111, %109
  %113 = udiv i32 %112, 1
  %114 = urem i32 %113, 64
  %115 = udiv i32 %112, 64
  %116 = urem i32 %115, 50
  %117 = udiv i32 %112, 3200
  %118 = add i32 %106, 0
  %119 = add i32 %105, 0
  %120 = add i32 %109, 0
  %Arg_1.25 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 0, i32 %118, i32 %119
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !22
  %Arg_0.1 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 0, i32 %118, i32 0, i32 %120
  %Arg_0.17 = load float, ptr %Arg_0.1, align 4, !invariant.load !22
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  br label %concatenate.16.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.23
  %121 = phi i32 [ 64, %concatenate.pivot.64.23 ]
  %122 = sub nsw i32 %101, %121
  %123 = udiv i32 %77, 256
  %124 = mul i32 %123, 64
  %125 = add i32 %124, %122
  %126 = udiv i32 %125, 1
  %127 = urem i32 %126, 64
  %128 = udiv i32 %125, 64
  %129 = urem i32 %128, 50
  %130 = udiv i32 %125, 3200
  %131 = add i32 %106, 0
  %132 = add i32 %105, 0
  %133 = add i32 %122, 0
  %Arg_1.28 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 1, i32 %131, i32 %132
  %Arg_1.29 = load float, ptr %Arg_1.28, align 4, !invariant.load !22
  %Arg_0.110 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 1, i32 %131, i32 0, i32 %133
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !22
  %multiply.712 = fmul float %Arg_1.29, %Arg_0.111
  br label %concatenate.16.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.128.24
  %134 = phi i32 [ 128, %concatenate.pivot.128.24 ]
  %135 = sub nsw i32 %101, %134
  %136 = udiv i32 %77, 256
  %137 = mul i32 %136, 64
  %138 = add i32 %137, %135
  %139 = udiv i32 %138, 1
  %140 = urem i32 %139, 64
  %141 = udiv i32 %138, 64
  %142 = urem i32 %141, 50
  %143 = udiv i32 %138, 3200
  %144 = add i32 %106, 0
  %145 = add i32 %105, 0
  %146 = add i32 %135, 0
  %Arg_1.213 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 2, i32 %144, i32 %145
  %Arg_1.214 = load float, ptr %Arg_1.213, align 4, !invariant.load !22
  %Arg_0.115 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 2, i32 %144, i32 0, i32 %146
  %Arg_0.116 = load float, ptr %Arg_0.115, align 4, !invariant.load !22
  %multiply.717 = fmul float %Arg_1.214, %Arg_0.116
  br label %concatenate.16.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.192.25
  %147 = phi i32 [ 192, %concatenate.pivot.192.25 ]
  %148 = sub nsw i32 %101, %147
  %149 = udiv i32 %77, 256
  %150 = mul i32 %149, 64
  %151 = add i32 %150, %148
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 64
  %154 = udiv i32 %151, 64
  %155 = urem i32 %154, 50
  %156 = udiv i32 %151, 3200
  %157 = add i32 %106, 0
  %158 = add i32 %105, 0
  %159 = add i32 %148, 0
  %Arg_1.218 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 3, i32 %157, i32 %158
  %Arg_1.219 = load float, ptr %Arg_1.218, align 4, !invariant.load !22
  %Arg_0.120 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 3, i32 %157, i32 0, i32 %159
  %Arg_0.121 = load float, ptr %Arg_0.120, align 4, !invariant.load !22
  %multiply.722 = fmul float %Arg_1.219, %Arg_0.121
  br label %concatenate.16.merge

concatenate.pivot.128.:                           ; preds = %x_in_tile-true
  %160 = icmp ult i32 %101, 128
  br i1 %160, label %concatenate.pivot.64., label %concatenate.pivot.192.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %161 = icmp ult i32 %101, 64
  br i1 %161, label %concatenate.pivot.0., label %concatenate.pivot.64.23

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.23:                          ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.192.:                           ; preds = %concatenate.pivot.128.
  %162 = icmp ult i32 %101, 192
  br i1 %162, label %concatenate.pivot.128.24, label %concatenate.pivot.192.25

concatenate.pivot.128.24:                         ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id2

concatenate.pivot.192.25:                         ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id3

concatenate.16.merge:                             ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %163 = phi float [ %multiply.7, %concat_index_from_operand_id0 ], [ %multiply.712, %concat_index_from_operand_id1 ], [ %multiply.717, %concat_index_from_operand_id2 ], [ %multiply.722, %concat_index_from_operand_id3 ]
  %164 = mul nuw nsw i32 %79, 1
  %165 = add nuw nsw i32 0, %164
  %166 = mul nuw nsw i32 %81, 64
  %167 = add nuw nsw i32 %165, %166
  %168 = mul nuw nsw i32 %83, 3200
  %169 = add nuw nsw i32 %167, %168
  %170 = mul nuw nsw i32 %84, 26214400
  %171 = add nuw nsw i32 %169, %170
  %172 = urem i32 %171, 256
  %173 = udiv i32 %171, 256
  %174 = udiv i32 %173, 409600
  %175 = getelementptr inbounds [409600 x [256 x float]], ptr %arg3, i32 0, i32 %173, i32 %172
  store float %163, ptr %175, align 4
  br label %x_in_tile-after

x_in_tile-true27:                                 ; preds = %x_in_tile-after
  %176 = mul nuw nsw i32 %32, 1
  %177 = add nuw nsw i32 0, %176
  %178 = mul nuw nsw i32 %31, 64
  %179 = add nuw nsw i32 %177, %178
  %180 = mul nuw nsw i32 %tile_origin.0, 3200
  %181 = add nuw nsw i32 %179, %180
  %182 = udiv i32 %181, 1
  %183 = urem i32 %182, 64
  %184 = udiv i32 %181, 64
  %185 = urem i32 %184, 50
  %186 = udiv i32 %181, 3200
  %187 = urem i32 %186, 8192
  %188 = udiv i32 %181, 26214400
  %189 = mul i32 %thread_id.x, 2
  %190 = sub i32 %x_loc26, %189
  %Arg_1.229 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 %188, i32 %187, i32 %185
  %Arg_1.230 = load float, ptr %Arg_1.229, align 4, !invariant.load !22
  %Arg_2.331 = getelementptr inbounds [4 x [8192 x [50 x [64 x float]]]], ptr %arg2, i32 0, i32 %188, i32 %187, i32 %185, i32 %183
  %Arg_2.332 = load float, ptr %Arg_2.331, align 4, !invariant.load !22
  %multiply.1833 = fmul float %Arg_1.230, %Arg_2.332
  store float %multiply.1833, ptr %reduction_input_address, align 4
  %191 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %190
  call void @region_1_20__1(ptr %191, ptr %reduction_input_address, ptr %return_buffer34)
  %192 = load float, ptr %return_buffer34, align 4
  store float %192, ptr %191, align 4
  %193 = mul nuw nsw i32 %183, 1
  %194 = add nuw nsw i32 0, %193
  %195 = mul nuw nsw i32 %185, 64
  %196 = add nuw nsw i32 %194, %195
  %197 = mul nuw nsw i32 %187, 3200
  %198 = add nuw nsw i32 %196, %197
  %199 = mul nuw nsw i32 %188, 26214400
  %200 = add nuw nsw i32 %198, %199
  %201 = urem i32 %200, 256
  %202 = udiv i32 %200, 256
  %203 = udiv i32 %202, 409600
  %204 = mul nuw nsw i32 %201, 1
  %205 = add nuw nsw i32 0, %204
  %206 = udiv i32 %205, 256
  %207 = mul nuw nsw i32 %202, 1
  %208 = add nuw nsw i32 0, %207
  %209 = urem i32 %208, 50
  %210 = udiv i32 %208, 50
  %211 = udiv i32 %210, 8192
  br label %concatenate.pivot.128.60

concat_index_from_operand_id036:                  ; preds = %concatenate.pivot.0.62
  %212 = phi i32 [ 0, %concatenate.pivot.0.62 ]
  %213 = sub nsw i32 %205, %212
  %214 = udiv i32 %181, 256
  %215 = mul i32 %214, 64
  %216 = add i32 %215, %213
  %217 = udiv i32 %216, 1
  %218 = urem i32 %217, 64
  %219 = udiv i32 %216, 64
  %220 = urem i32 %219, 50
  %221 = udiv i32 %216, 3200
  %222 = add i32 %210, 0
  %223 = add i32 %209, 0
  %224 = add i32 %213, 0
  %Arg_1.237 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 0, i32 %222, i32 %223
  %Arg_1.238 = load float, ptr %Arg_1.237, align 4, !invariant.load !22
  %Arg_0.139 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 0, i32 %222, i32 0, i32 %224
  %Arg_0.140 = load float, ptr %Arg_0.139, align 4, !invariant.load !22
  %multiply.741 = fmul float %Arg_1.238, %Arg_0.140
  br label %concatenate.16.merge35

concat_index_from_operand_id142:                  ; preds = %concatenate.pivot.64.63
  %225 = phi i32 [ 64, %concatenate.pivot.64.63 ]
  %226 = sub nsw i32 %205, %225
  %227 = udiv i32 %181, 256
  %228 = mul i32 %227, 64
  %229 = add i32 %228, %226
  %230 = udiv i32 %229, 1
  %231 = urem i32 %230, 64
  %232 = udiv i32 %229, 64
  %233 = urem i32 %232, 50
  %234 = udiv i32 %229, 3200
  %235 = add i32 %210, 0
  %236 = add i32 %209, 0
  %237 = add i32 %226, 0
  %Arg_1.243 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 1, i32 %235, i32 %236
  %Arg_1.244 = load float, ptr %Arg_1.243, align 4, !invariant.load !22
  %Arg_0.145 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 1, i32 %235, i32 0, i32 %237
  %Arg_0.146 = load float, ptr %Arg_0.145, align 4, !invariant.load !22
  %multiply.747 = fmul float %Arg_1.244, %Arg_0.146
  br label %concatenate.16.merge35

concat_index_from_operand_id248:                  ; preds = %concatenate.pivot.128.65
  %238 = phi i32 [ 128, %concatenate.pivot.128.65 ]
  %239 = sub nsw i32 %205, %238
  %240 = udiv i32 %181, 256
  %241 = mul i32 %240, 64
  %242 = add i32 %241, %239
  %243 = udiv i32 %242, 1
  %244 = urem i32 %243, 64
  %245 = udiv i32 %242, 64
  %246 = urem i32 %245, 50
  %247 = udiv i32 %242, 3200
  %248 = add i32 %210, 0
  %249 = add i32 %209, 0
  %250 = add i32 %239, 0
  %Arg_1.249 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 2, i32 %248, i32 %249
  %Arg_1.250 = load float, ptr %Arg_1.249, align 4, !invariant.load !22
  %Arg_0.151 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 2, i32 %248, i32 0, i32 %250
  %Arg_0.152 = load float, ptr %Arg_0.151, align 4, !invariant.load !22
  %multiply.753 = fmul float %Arg_1.250, %Arg_0.152
  br label %concatenate.16.merge35

concat_index_from_operand_id354:                  ; preds = %concatenate.pivot.192.66
  %251 = phi i32 [ 192, %concatenate.pivot.192.66 ]
  %252 = sub nsw i32 %205, %251
  %253 = udiv i32 %181, 256
  %254 = mul i32 %253, 64
  %255 = add i32 %254, %252
  %256 = udiv i32 %255, 1
  %257 = urem i32 %256, 64
  %258 = udiv i32 %255, 64
  %259 = urem i32 %258, 50
  %260 = udiv i32 %255, 3200
  %261 = add i32 %210, 0
  %262 = add i32 %209, 0
  %263 = add i32 %252, 0
  %Arg_1.255 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr %arg1, i32 0, i32 3, i32 %261, i32 %262
  %Arg_1.256 = load float, ptr %Arg_1.255, align 4, !invariant.load !22
  %Arg_0.157 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 3, i32 %261, i32 0, i32 %263
  %Arg_0.158 = load float, ptr %Arg_0.157, align 4, !invariant.load !22
  %multiply.759 = fmul float %Arg_1.256, %Arg_0.158
  br label %concatenate.16.merge35

concatenate.pivot.128.60:                         ; preds = %x_in_tile-true27
  %264 = icmp ult i32 %205, 128
  br i1 %264, label %concatenate.pivot.64.61, label %concatenate.pivot.192.64

concatenate.pivot.64.61:                          ; preds = %concatenate.pivot.128.60
  %265 = icmp ult i32 %205, 64
  br i1 %265, label %concatenate.pivot.0.62, label %concatenate.pivot.64.63

concatenate.pivot.0.62:                           ; preds = %concatenate.pivot.64.61
  br label %concat_index_from_operand_id036

concatenate.pivot.64.63:                          ; preds = %concatenate.pivot.64.61
  br label %concat_index_from_operand_id142

concatenate.pivot.192.64:                         ; preds = %concatenate.pivot.128.60
  %266 = icmp ult i32 %205, 192
  br i1 %266, label %concatenate.pivot.128.65, label %concatenate.pivot.192.66

concatenate.pivot.128.65:                         ; preds = %concatenate.pivot.192.64
  br label %concat_index_from_operand_id248

concatenate.pivot.192.66:                         ; preds = %concatenate.pivot.192.64
  br label %concat_index_from_operand_id354

concatenate.16.merge35:                           ; preds = %concat_index_from_operand_id354, %concat_index_from_operand_id248, %concat_index_from_operand_id142, %concat_index_from_operand_id036
  %267 = phi float [ %multiply.741, %concat_index_from_operand_id036 ], [ %multiply.747, %concat_index_from_operand_id142 ], [ %multiply.753, %concat_index_from_operand_id248 ], [ %multiply.759, %concat_index_from_operand_id354 ]
  %268 = mul nuw nsw i32 %183, 1
  %269 = add nuw nsw i32 0, %268
  %270 = mul nuw nsw i32 %185, 64
  %271 = add nuw nsw i32 %269, %270
  %272 = mul nuw nsw i32 %187, 3200
  %273 = add nuw nsw i32 %271, %272
  %274 = mul nuw nsw i32 %188, 26214400
  %275 = add nuw nsw i32 %273, %274
  %276 = urem i32 %275, 256
  %277 = udiv i32 %275, 256
  %278 = udiv i32 %277, 409600
  %279 = getelementptr inbounds [409600 x [256 x float]], ptr %arg3, i32 0, i32 %277, i32 %276
  store float %267, ptr %279, align 4
  br label %x_in_tile-after28

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %280 = mul i32 %thread_id.y, 2
  %281 = add i32 %tile_origin.1, %thread_id.x
  %282 = add i32 %tile_origin.2, %280
  %283 = add i32 %282, 0
  %284 = mul i32 %tile_origin.0, 64
  %285 = add i32 %284, %283
  %286 = udiv i32 %285, 1
  %287 = urem i32 %286, 64
  %288 = udiv i32 %285, 64
  %289 = urem i32 %288, 8192
  %290 = udiv i32 %285, 524288
  %output_element_address = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg4, i32 0, i32 %290, i32 %289, i32 %287
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true99:                    ; preds = %reduction_write_output-after
  %291 = mul i32 %thread_id.y, 2
  %292 = add i32 %tile_origin.1, %thread_id.x
  %293 = add i32 %tile_origin.2, %291
  %294 = add i32 %293, 1
  %295 = mul i32 %tile_origin.0, 64
  %296 = add i32 %295, %294
  %297 = udiv i32 %296, 1
  %298 = urem i32 %297, 64
  %299 = udiv i32 %296, 64
  %300 = urem i32 %299, 8192
  %301 = udiv i32 %296, 524288
  %output_element_address101 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg4, i32 0, i32 %301, i32 %300, i32 %298
  %output102 = load float, ptr %55, align 4
  store float %output102, ptr %output_element_address101, align 4
  br label %reduction_write_output-after100
}

define internal void @region_1_20__1(ptr dereferenceable(4) %Arg_0.21.typed, ptr dereferenceable(4) %Arg_1.22.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.23.typed = alloca float, align 4
  %Arg_0.21 = load float, ptr %Arg_0.21.typed, align 4
  %Arg_1.22 = load float, ptr %Arg_1.22.typed, align 4
  %add.23 = fadd float %Arg_0.21, %Arg_1.22
  store float %add.23, ptr %add.23.typed, align 4
  %load_ret_value = load float, ptr %add.23.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_6(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 524288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 256
  %8 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 256
  %11 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 256
  %14 = udiv i32 %linear_index3, 256
  %15 = icmp ult i32 %linear_index_base, 2097152
  br i1 %15, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %concatenate.10.merge28, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 256
  %19 = mul i32 %18, 64
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 64
  %23 = udiv i32 %20, 64
  %24 = urem i32 %23, 8192
  %25 = udiv i32 %20, 524288
  %26 = add i32 %5, 0
  %27 = add i32 %17, 0
  %28 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !22
  br label %concatenate.10.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %30 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %31 = sub nsw i32 %4, %30
  %32 = udiv i32 %linear_index_base, 256
  %33 = mul i32 %32, 64
  %34 = add i32 %33, %31
  %35 = udiv i32 %34, 1
  %36 = urem i32 %35, 64
  %37 = udiv i32 %34, 64
  %38 = urem i32 %37, 8192
  %39 = udiv i32 %34, 524288
  %40 = add i32 %5, 0
  %41 = add i32 %31, 0
  %42 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 1, i32 %40, i32 %41
  %43 = load float, ptr %42, align 4, !invariant.load !22
  br label %concatenate.10.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.128.2
  %44 = phi i32 [ 128, %concatenate.pivot.128.2 ]
  %45 = sub nsw i32 %4, %44
  %46 = udiv i32 %linear_index_base, 256
  %47 = mul i32 %46, 64
  %48 = add i32 %47, %45
  %49 = udiv i32 %48, 1
  %50 = urem i32 %49, 64
  %51 = udiv i32 %48, 64
  %52 = urem i32 %51, 8192
  %53 = udiv i32 %48, 524288
  %54 = add i32 %5, 0
  %55 = add i32 %45, 0
  %56 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 2, i32 %54, i32 %55
  %57 = load float, ptr %56, align 4, !invariant.load !22
  br label %concatenate.10.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.192.3
  %58 = phi i32 [ 192, %concatenate.pivot.192.3 ]
  %59 = sub nsw i32 %4, %58
  %60 = udiv i32 %linear_index_base, 256
  %61 = mul i32 %60, 64
  %62 = add i32 %61, %59
  %63 = udiv i32 %62, 1
  %64 = urem i32 %63, 64
  %65 = udiv i32 %62, 64
  %66 = urem i32 %65, 8192
  %67 = udiv i32 %62, 524288
  %68 = add i32 %5, 0
  %69 = add i32 %59, 0
  %70 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 3, i32 %68, i32 %69
  %71 = load float, ptr %70, align 4, !invariant.load !22
  br label %concatenate.10.merge

concatenate.pivot.128.:                           ; preds = %fusion_6.in_bounds-true
  %72 = icmp ult i32 %4, 128
  br i1 %72, label %concatenate.pivot.64., label %concatenate.pivot.192.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %73 = icmp ult i32 %4, 64
  br i1 %73, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.192.:                           ; preds = %concatenate.pivot.128.
  %74 = icmp ult i32 %4, 192
  br i1 %74, label %concatenate.pivot.128.2, label %concatenate.pivot.192.3

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id2

concatenate.pivot.192.3:                          ; preds = %concatenate.pivot.192.
  br label %concat_index_from_operand_id3

concatenate.10.merge:                             ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %75 = phi float [ %29, %concat_index_from_operand_id0 ], [ %43, %concat_index_from_operand_id1 ], [ %57, %concat_index_from_operand_id2 ], [ %71, %concat_index_from_operand_id3 ]
  %76 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %75, ptr %76, align 4
  br label %concatenate.pivot.128.9

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.11
  %77 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %78 = sub nsw i32 %7, %77
  %79 = udiv i32 %linear_index1, 256
  %80 = mul i32 %79, 64
  %81 = add i32 %80, %78
  %82 = udiv i32 %81, 1
  %83 = urem i32 %82, 64
  %84 = udiv i32 %81, 64
  %85 = urem i32 %84, 8192
  %86 = udiv i32 %81, 524288
  %87 = add i32 %8, 0
  %88 = add i32 %78, 0
  %89 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 0, i32 %87, i32 %88
  %90 = load float, ptr %89, align 4, !invariant.load !22
  br label %concatenate.10.merge4

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.64.12
  %91 = phi i32 [ 64, %concatenate.pivot.64.12 ]
  %92 = sub nsw i32 %7, %91
  %93 = udiv i32 %linear_index1, 256
  %94 = mul i32 %93, 64
  %95 = add i32 %94, %92
  %96 = udiv i32 %95, 1
  %97 = urem i32 %96, 64
  %98 = udiv i32 %95, 64
  %99 = urem i32 %98, 8192
  %100 = udiv i32 %95, 524288
  %101 = add i32 %8, 0
  %102 = add i32 %92, 0
  %103 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 1, i32 %101, i32 %102
  %104 = load float, ptr %103, align 4, !invariant.load !22
  br label %concatenate.10.merge4

concat_index_from_operand_id27:                   ; preds = %concatenate.pivot.128.14
  %105 = phi i32 [ 128, %concatenate.pivot.128.14 ]
  %106 = sub nsw i32 %7, %105
  %107 = udiv i32 %linear_index1, 256
  %108 = mul i32 %107, 64
  %109 = add i32 %108, %106
  %110 = udiv i32 %109, 1
  %111 = urem i32 %110, 64
  %112 = udiv i32 %109, 64
  %113 = urem i32 %112, 8192
  %114 = udiv i32 %109, 524288
  %115 = add i32 %8, 0
  %116 = add i32 %106, 0
  %117 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 2, i32 %115, i32 %116
  %118 = load float, ptr %117, align 4, !invariant.load !22
  br label %concatenate.10.merge4

concat_index_from_operand_id38:                   ; preds = %concatenate.pivot.192.15
  %119 = phi i32 [ 192, %concatenate.pivot.192.15 ]
  %120 = sub nsw i32 %7, %119
  %121 = udiv i32 %linear_index1, 256
  %122 = mul i32 %121, 64
  %123 = add i32 %122, %120
  %124 = udiv i32 %123, 1
  %125 = urem i32 %124, 64
  %126 = udiv i32 %123, 64
  %127 = urem i32 %126, 8192
  %128 = udiv i32 %123, 524288
  %129 = add i32 %8, 0
  %130 = add i32 %120, 0
  %131 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 3, i32 %129, i32 %130
  %132 = load float, ptr %131, align 4, !invariant.load !22
  br label %concatenate.10.merge4

concatenate.pivot.128.9:                          ; preds = %concatenate.10.merge
  %133 = icmp ult i32 %7, 128
  br i1 %133, label %concatenate.pivot.64.10, label %concatenate.pivot.192.13

concatenate.pivot.64.10:                          ; preds = %concatenate.pivot.128.9
  %134 = icmp ult i32 %7, 64
  br i1 %134, label %concatenate.pivot.0.11, label %concatenate.pivot.64.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.64.10
  br label %concat_index_from_operand_id05

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.64.10
  br label %concat_index_from_operand_id16

concatenate.pivot.192.13:                         ; preds = %concatenate.pivot.128.9
  %135 = icmp ult i32 %7, 192
  br i1 %135, label %concatenate.pivot.128.14, label %concatenate.pivot.192.15

concatenate.pivot.128.14:                         ; preds = %concatenate.pivot.192.13
  br label %concat_index_from_operand_id27

concatenate.pivot.192.15:                         ; preds = %concatenate.pivot.192.13
  br label %concat_index_from_operand_id38

concatenate.10.merge4:                            ; preds = %concat_index_from_operand_id38, %concat_index_from_operand_id27, %concat_index_from_operand_id16, %concat_index_from_operand_id05
  %136 = phi float [ %90, %concat_index_from_operand_id05 ], [ %104, %concat_index_from_operand_id16 ], [ %118, %concat_index_from_operand_id27 ], [ %132, %concat_index_from_operand_id38 ]
  %137 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %136, ptr %137, align 4
  br label %concatenate.pivot.128.21

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.23
  %138 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %139 = sub nsw i32 %10, %138
  %140 = udiv i32 %linear_index2, 256
  %141 = mul i32 %140, 64
  %142 = add i32 %141, %139
  %143 = udiv i32 %142, 1
  %144 = urem i32 %143, 64
  %145 = udiv i32 %142, 64
  %146 = urem i32 %145, 8192
  %147 = udiv i32 %142, 524288
  %148 = add i32 %11, 0
  %149 = add i32 %139, 0
  %150 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 0, i32 %148, i32 %149
  %151 = load float, ptr %150, align 4, !invariant.load !22
  br label %concatenate.10.merge16

concat_index_from_operand_id118:                  ; preds = %concatenate.pivot.64.24
  %152 = phi i32 [ 64, %concatenate.pivot.64.24 ]
  %153 = sub nsw i32 %10, %152
  %154 = udiv i32 %linear_index2, 256
  %155 = mul i32 %154, 64
  %156 = add i32 %155, %153
  %157 = udiv i32 %156, 1
  %158 = urem i32 %157, 64
  %159 = udiv i32 %156, 64
  %160 = urem i32 %159, 8192
  %161 = udiv i32 %156, 524288
  %162 = add i32 %11, 0
  %163 = add i32 %153, 0
  %164 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 1, i32 %162, i32 %163
  %165 = load float, ptr %164, align 4, !invariant.load !22
  br label %concatenate.10.merge16

concat_index_from_operand_id219:                  ; preds = %concatenate.pivot.128.26
  %166 = phi i32 [ 128, %concatenate.pivot.128.26 ]
  %167 = sub nsw i32 %10, %166
  %168 = udiv i32 %linear_index2, 256
  %169 = mul i32 %168, 64
  %170 = add i32 %169, %167
  %171 = udiv i32 %170, 1
  %172 = urem i32 %171, 64
  %173 = udiv i32 %170, 64
  %174 = urem i32 %173, 8192
  %175 = udiv i32 %170, 524288
  %176 = add i32 %11, 0
  %177 = add i32 %167, 0
  %178 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 2, i32 %176, i32 %177
  %179 = load float, ptr %178, align 4, !invariant.load !22
  br label %concatenate.10.merge16

concat_index_from_operand_id320:                  ; preds = %concatenate.pivot.192.27
  %180 = phi i32 [ 192, %concatenate.pivot.192.27 ]
  %181 = sub nsw i32 %10, %180
  %182 = udiv i32 %linear_index2, 256
  %183 = mul i32 %182, 64
  %184 = add i32 %183, %181
  %185 = udiv i32 %184, 1
  %186 = urem i32 %185, 64
  %187 = udiv i32 %184, 64
  %188 = urem i32 %187, 8192
  %189 = udiv i32 %184, 524288
  %190 = add i32 %11, 0
  %191 = add i32 %181, 0
  %192 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 3, i32 %190, i32 %191
  %193 = load float, ptr %192, align 4, !invariant.load !22
  br label %concatenate.10.merge16

concatenate.pivot.128.21:                         ; preds = %concatenate.10.merge4
  %194 = icmp ult i32 %10, 128
  br i1 %194, label %concatenate.pivot.64.22, label %concatenate.pivot.192.25

concatenate.pivot.64.22:                          ; preds = %concatenate.pivot.128.21
  %195 = icmp ult i32 %10, 64
  br i1 %195, label %concatenate.pivot.0.23, label %concatenate.pivot.64.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.64.22
  br label %concat_index_from_operand_id017

concatenate.pivot.64.24:                          ; preds = %concatenate.pivot.64.22
  br label %concat_index_from_operand_id118

concatenate.pivot.192.25:                         ; preds = %concatenate.pivot.128.21
  %196 = icmp ult i32 %10, 192
  br i1 %196, label %concatenate.pivot.128.26, label %concatenate.pivot.192.27

concatenate.pivot.128.26:                         ; preds = %concatenate.pivot.192.25
  br label %concat_index_from_operand_id219

concatenate.pivot.192.27:                         ; preds = %concatenate.pivot.192.25
  br label %concat_index_from_operand_id320

concatenate.10.merge16:                           ; preds = %concat_index_from_operand_id320, %concat_index_from_operand_id219, %concat_index_from_operand_id118, %concat_index_from_operand_id017
  %197 = phi float [ %151, %concat_index_from_operand_id017 ], [ %165, %concat_index_from_operand_id118 ], [ %179, %concat_index_from_operand_id219 ], [ %193, %concat_index_from_operand_id320 ]
  %198 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %197, ptr %198, align 4
  br label %concatenate.pivot.128.33

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.35
  %199 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %200 = sub nsw i32 %13, %199
  %201 = udiv i32 %linear_index3, 256
  %202 = mul i32 %201, 64
  %203 = add i32 %202, %200
  %204 = udiv i32 %203, 1
  %205 = urem i32 %204, 64
  %206 = udiv i32 %203, 64
  %207 = urem i32 %206, 8192
  %208 = udiv i32 %203, 524288
  %209 = add i32 %14, 0
  %210 = add i32 %200, 0
  %211 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 0, i32 %209, i32 %210
  %212 = load float, ptr %211, align 4, !invariant.load !22
  br label %concatenate.10.merge28

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.64.36
  %213 = phi i32 [ 64, %concatenate.pivot.64.36 ]
  %214 = sub nsw i32 %13, %213
  %215 = udiv i32 %linear_index3, 256
  %216 = mul i32 %215, 64
  %217 = add i32 %216, %214
  %218 = udiv i32 %217, 1
  %219 = urem i32 %218, 64
  %220 = udiv i32 %217, 64
  %221 = urem i32 %220, 8192
  %222 = udiv i32 %217, 524288
  %223 = add i32 %14, 0
  %224 = add i32 %214, 0
  %225 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 1, i32 %223, i32 %224
  %226 = load float, ptr %225, align 4, !invariant.load !22
  br label %concatenate.10.merge28

concat_index_from_operand_id231:                  ; preds = %concatenate.pivot.128.38
  %227 = phi i32 [ 128, %concatenate.pivot.128.38 ]
  %228 = sub nsw i32 %13, %227
  %229 = udiv i32 %linear_index3, 256
  %230 = mul i32 %229, 64
  %231 = add i32 %230, %228
  %232 = udiv i32 %231, 1
  %233 = urem i32 %232, 64
  %234 = udiv i32 %231, 64
  %235 = urem i32 %234, 8192
  %236 = udiv i32 %231, 524288
  %237 = add i32 %14, 0
  %238 = add i32 %228, 0
  %239 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 2, i32 %237, i32 %238
  %240 = load float, ptr %239, align 4, !invariant.load !22
  br label %concatenate.10.merge28

concat_index_from_operand_id332:                  ; preds = %concatenate.pivot.192.39
  %241 = phi i32 [ 192, %concatenate.pivot.192.39 ]
  %242 = sub nsw i32 %13, %241
  %243 = udiv i32 %linear_index3, 256
  %244 = mul i32 %243, 64
  %245 = add i32 %244, %242
  %246 = udiv i32 %245, 1
  %247 = urem i32 %246, 64
  %248 = udiv i32 %245, 64
  %249 = urem i32 %248, 8192
  %250 = udiv i32 %245, 524288
  %251 = add i32 %14, 0
  %252 = add i32 %242, 0
  %253 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 3, i32 %251, i32 %252
  %254 = load float, ptr %253, align 4, !invariant.load !22
  br label %concatenate.10.merge28

concatenate.pivot.128.33:                         ; preds = %concatenate.10.merge16
  %255 = icmp ult i32 %13, 128
  br i1 %255, label %concatenate.pivot.64.34, label %concatenate.pivot.192.37

concatenate.pivot.64.34:                          ; preds = %concatenate.pivot.128.33
  %256 = icmp ult i32 %13, 64
  br i1 %256, label %concatenate.pivot.0.35, label %concatenate.pivot.64.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.64.34
  br label %concat_index_from_operand_id029

concatenate.pivot.64.36:                          ; preds = %concatenate.pivot.64.34
  br label %concat_index_from_operand_id130

concatenate.pivot.192.37:                         ; preds = %concatenate.pivot.128.33
  %257 = icmp ult i32 %13, 192
  br i1 %257, label %concatenate.pivot.128.38, label %concatenate.pivot.192.39

concatenate.pivot.128.38:                         ; preds = %concatenate.pivot.192.37
  br label %concat_index_from_operand_id231

concatenate.pivot.192.39:                         ; preds = %concatenate.pivot.192.37
  br label %concat_index_from_operand_id332

concatenate.10.merge28:                           ; preds = %concat_index_from_operand_id332, %concat_index_from_operand_id231, %concat_index_from_operand_id130, %concat_index_from_operand_id029
  %258 = phi float [ %212, %concat_index_from_operand_id029 ], [ %226, %concat_index_from_operand_id130 ], [ %240, %concat_index_from_operand_id231 ], [ %254, %concat_index_from_operand_id332 ]
  %259 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %258, ptr %259, align 4
  br label %fusion_6.in_bounds-after
}

define void @fusion_5(ptr noalias align 16 dereferenceable(991232) %arg0, ptr noalias align 128 dereferenceable(991232) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 61952
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 256
  %8 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 256
  %11 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 256
  %14 = udiv i32 %linear_index3, 256
  %15 = icmp ult i32 %linear_index_base, 247808
  br i1 %15, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %fusion_5.in_bounds-true, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !22
  %18 = load float, ptr %arg2, align 4, !invariant.load !22
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4
  %multiply.5 = fmul float %18, %20
  %subtract.6 = fsub float %17, %multiply.5
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %subtract.6, ptr %21, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %23 = load float, ptr %22, align 4, !invariant.load !22
  %24 = load float, ptr %arg2, align 4, !invariant.load !22
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4
  %multiply.51 = fmul float %24, %26
  %subtract.62 = fsub float %23, %multiply.51
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %subtract.62, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4, !invariant.load !22
  %30 = load float, ptr %arg2, align 4, !invariant.load !22
  %31 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %32 = load float, ptr %31, align 4
  %multiply.53 = fmul float %30, %32
  %subtract.64 = fsub float %29, %multiply.53
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %subtract.64, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %35 = load float, ptr %34, align 4, !invariant.load !22
  %36 = load float, ptr %arg2, align 4, !invariant.load !22
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %multiply.55 = fmul float %36, %38
  %subtract.66 = fsub float %35, %multiply.55
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %subtract.66, ptr %39, align 4
  br label %fusion_5.in_bounds-after
}

define void @fusion_13(ptr noalias align 16 dereferenceable(155648) %arg0, ptr noalias align 128 dereferenceable(155648) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(155648) %arg3, ptr noalias align 128 dereferenceable(155648) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !41
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 38912
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 38912
  br i1 %6, label %fusion_13.in_bounds-true, label %fusion_13.in_bounds-after

fusion_13.in_bounds-after:                        ; preds = %fusion_13.in_bounds-true, %entry
  ret void

fusion_13.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !22
  %9 = load float, ptr %arg2, align 4, !invariant.load !22
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !22
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
  br label %fusion_13.in_bounds-after
}

define void @fusion(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(249036800) %arg2, ptr noalias align 16 dereferenceable(13107200) %arg3, ptr noalias align 16 dereferenceable(13107200) %arg4, ptr noalias align 128 dereferenceable(13107200) %arg5, ptr noalias align 128 dereferenceable(13107200) %arg6, ptr noalias align 128 dereferenceable(13107200) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !42
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 8
  %5 = udiv i32 %linear_index_base, 8
  %6 = urem i32 %5, 50
  %7 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 8
  %10 = udiv i32 %linear_index1, 8
  %11 = urem i32 %10, 50
  %12 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 8
  %15 = udiv i32 %linear_index2, 8
  %16 = urem i32 %15, 50
  %17 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 8
  %20 = udiv i32 %linear_index3, 8
  %21 = urem i32 %20, 50
  %22 = udiv i32 %linear_index3, 400
  %23 = icmp ult i32 %linear_index_base, 3276800
  br i1 %23, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !22
  %26 = load float, ptr %arg1, align 4, !invariant.load !22
  %27 = add i32 %7, 0
  %28 = add i32 %6, 0
  %29 = add i32 %4, 144
  %30 = mul nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 152
  %33 = mul nuw nsw i32 %28, 1
  %34 = add nuw nsw i32 0, %33
  %35 = mul nuw nsw i32 %27, 50
  %36 = add nuw nsw i32 %34, %35
  %37 = udiv i32 %36, 409600
  %38 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %36, i32 %31
  %39 = load float, ptr %38, align 4, !invariant.load !22
  %multiply.9 = fmul float %26, %39
  %subtract.10 = fsub float %25, %multiply.9
  %40 = insertvalue { float, float, float } undef, float %subtract.10, 0
  %41 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %42 = load float, ptr %41, align 4, !invariant.load !22
  %43 = add i32 %7, 0
  %44 = add i32 %6, 0
  %45 = add i32 %4, 136
  %46 = mul nuw nsw i32 %45, 1
  %47 = add nuw nsw i32 0, %46
  %48 = udiv i32 %47, 152
  %49 = mul nuw nsw i32 %44, 1
  %50 = add nuw nsw i32 0, %49
  %51 = mul nuw nsw i32 %43, 50
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 409600
  %54 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %52, i32 %47
  %55 = load float, ptr %54, align 4, !invariant.load !22
  %multiply.12 = fmul float %26, %55
  %subtract.13 = fsub float %42, %multiply.12
  %56 = insertvalue { float, float, float } %40, float %subtract.13, 1
  %57 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %58 = load float, ptr %57, align 4, !invariant.load !22
  %59 = add i32 %7, 0
  %60 = add i32 %6, 0
  %61 = add i32 %4, 128
  %62 = mul nuw nsw i32 %61, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 152
  %65 = mul nuw nsw i32 %60, 1
  %66 = add nuw nsw i32 0, %65
  %67 = mul nuw nsw i32 %59, 50
  %68 = add nuw nsw i32 %66, %67
  %69 = udiv i32 %68, 409600
  %70 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %68, i32 %63
  %71 = load float, ptr %70, align 4, !invariant.load !22
  %multiply.15 = fmul float %26, %71
  %subtract.16 = fsub float %58, %multiply.15
  %72 = insertvalue { float, float, float } %56, float %subtract.16, 2
  %73 = extractvalue { float, float, float } %72, 0
  %74 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %73, ptr %74, align 4
  %75 = extractvalue { float, float, float } %72, 1
  %76 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %75, ptr %76, align 4
  %77 = extractvalue { float, float, float } %72, 2
  %78 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %77, ptr %78, align 4
  %79 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %80 = load float, ptr %79, align 4, !invariant.load !22
  %81 = load float, ptr %arg1, align 4, !invariant.load !22
  %82 = add i32 %12, 0
  %83 = add i32 %11, 0
  %84 = add i32 %9, 144
  %85 = mul nuw nsw i32 %84, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 152
  %88 = mul nuw nsw i32 %83, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 50
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 409600
  %93 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %91, i32 %86
  %94 = load float, ptr %93, align 4, !invariant.load !22
  %multiply.91 = fmul float %81, %94
  %subtract.102 = fsub float %80, %multiply.91
  %95 = insertvalue { float, float, float } undef, float %subtract.102, 0
  %96 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %97 = load float, ptr %96, align 4, !invariant.load !22
  %98 = add i32 %12, 0
  %99 = add i32 %11, 0
  %100 = add i32 %9, 136
  %101 = mul nuw nsw i32 %100, 1
  %102 = add nuw nsw i32 0, %101
  %103 = udiv i32 %102, 152
  %104 = mul nuw nsw i32 %99, 1
  %105 = add nuw nsw i32 0, %104
  %106 = mul nuw nsw i32 %98, 50
  %107 = add nuw nsw i32 %105, %106
  %108 = udiv i32 %107, 409600
  %109 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %107, i32 %102
  %110 = load float, ptr %109, align 4, !invariant.load !22
  %multiply.123 = fmul float %81, %110
  %subtract.134 = fsub float %97, %multiply.123
  %111 = insertvalue { float, float, float } %95, float %subtract.134, 1
  %112 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %113 = load float, ptr %112, align 4, !invariant.load !22
  %114 = add i32 %12, 0
  %115 = add i32 %11, 0
  %116 = add i32 %9, 128
  %117 = mul nuw nsw i32 %116, 1
  %118 = add nuw nsw i32 0, %117
  %119 = udiv i32 %118, 152
  %120 = mul nuw nsw i32 %115, 1
  %121 = add nuw nsw i32 0, %120
  %122 = mul nuw nsw i32 %114, 50
  %123 = add nuw nsw i32 %121, %122
  %124 = udiv i32 %123, 409600
  %125 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %123, i32 %118
  %126 = load float, ptr %125, align 4, !invariant.load !22
  %multiply.155 = fmul float %81, %126
  %subtract.166 = fsub float %113, %multiply.155
  %127 = insertvalue { float, float, float } %111, float %subtract.166, 2
  %128 = extractvalue { float, float, float } %127, 0
  %129 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %128, ptr %129, align 4
  %130 = extractvalue { float, float, float } %127, 1
  %131 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %130, ptr %131, align 4
  %132 = extractvalue { float, float, float } %127, 2
  %133 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %132, ptr %133, align 4
  %134 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %135 = load float, ptr %134, align 4, !invariant.load !22
  %136 = load float, ptr %arg1, align 4, !invariant.load !22
  %137 = add i32 %17, 0
  %138 = add i32 %16, 0
  %139 = add i32 %14, 144
  %140 = mul nuw nsw i32 %139, 1
  %141 = add nuw nsw i32 0, %140
  %142 = udiv i32 %141, 152
  %143 = mul nuw nsw i32 %138, 1
  %144 = add nuw nsw i32 0, %143
  %145 = mul nuw nsw i32 %137, 50
  %146 = add nuw nsw i32 %144, %145
  %147 = udiv i32 %146, 409600
  %148 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %146, i32 %141
  %149 = load float, ptr %148, align 4, !invariant.load !22
  %multiply.97 = fmul float %136, %149
  %subtract.108 = fsub float %135, %multiply.97
  %150 = insertvalue { float, float, float } undef, float %subtract.108, 0
  %151 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %152 = load float, ptr %151, align 4, !invariant.load !22
  %153 = add i32 %17, 0
  %154 = add i32 %16, 0
  %155 = add i32 %14, 136
  %156 = mul nuw nsw i32 %155, 1
  %157 = add nuw nsw i32 0, %156
  %158 = udiv i32 %157, 152
  %159 = mul nuw nsw i32 %154, 1
  %160 = add nuw nsw i32 0, %159
  %161 = mul nuw nsw i32 %153, 50
  %162 = add nuw nsw i32 %160, %161
  %163 = udiv i32 %162, 409600
  %164 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %162, i32 %157
  %165 = load float, ptr %164, align 4, !invariant.load !22
  %multiply.129 = fmul float %136, %165
  %subtract.1310 = fsub float %152, %multiply.129
  %166 = insertvalue { float, float, float } %150, float %subtract.1310, 1
  %167 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %168 = load float, ptr %167, align 4, !invariant.load !22
  %169 = add i32 %17, 0
  %170 = add i32 %16, 0
  %171 = add i32 %14, 128
  %172 = mul nuw nsw i32 %171, 1
  %173 = add nuw nsw i32 0, %172
  %174 = udiv i32 %173, 152
  %175 = mul nuw nsw i32 %170, 1
  %176 = add nuw nsw i32 0, %175
  %177 = mul nuw nsw i32 %169, 50
  %178 = add nuw nsw i32 %176, %177
  %179 = udiv i32 %178, 409600
  %180 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %178, i32 %173
  %181 = load float, ptr %180, align 4, !invariant.load !22
  %multiply.1511 = fmul float %136, %181
  %subtract.1612 = fsub float %168, %multiply.1511
  %182 = insertvalue { float, float, float } %166, float %subtract.1612, 2
  %183 = extractvalue { float, float, float } %182, 0
  %184 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %183, ptr %184, align 4
  %185 = extractvalue { float, float, float } %182, 1
  %186 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %185, ptr %186, align 4
  %187 = extractvalue { float, float, float } %182, 2
  %188 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %187, ptr %188, align 4
  %189 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %190 = load float, ptr %189, align 4, !invariant.load !22
  %191 = load float, ptr %arg1, align 4, !invariant.load !22
  %192 = add i32 %22, 0
  %193 = add i32 %21, 0
  %194 = add i32 %19, 144
  %195 = mul nuw nsw i32 %194, 1
  %196 = add nuw nsw i32 0, %195
  %197 = udiv i32 %196, 152
  %198 = mul nuw nsw i32 %193, 1
  %199 = add nuw nsw i32 0, %198
  %200 = mul nuw nsw i32 %192, 50
  %201 = add nuw nsw i32 %199, %200
  %202 = udiv i32 %201, 409600
  %203 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %201, i32 %196
  %204 = load float, ptr %203, align 4, !invariant.load !22
  %multiply.913 = fmul float %191, %204
  %subtract.1014 = fsub float %190, %multiply.913
  %205 = insertvalue { float, float, float } undef, float %subtract.1014, 0
  %206 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %207 = load float, ptr %206, align 4, !invariant.load !22
  %208 = add i32 %22, 0
  %209 = add i32 %21, 0
  %210 = add i32 %19, 136
  %211 = mul nuw nsw i32 %210, 1
  %212 = add nuw nsw i32 0, %211
  %213 = udiv i32 %212, 152
  %214 = mul nuw nsw i32 %209, 1
  %215 = add nuw nsw i32 0, %214
  %216 = mul nuw nsw i32 %208, 50
  %217 = add nuw nsw i32 %215, %216
  %218 = udiv i32 %217, 409600
  %219 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %217, i32 %212
  %220 = load float, ptr %219, align 4, !invariant.load !22
  %multiply.1215 = fmul float %191, %220
  %subtract.1316 = fsub float %207, %multiply.1215
  %221 = insertvalue { float, float, float } %205, float %subtract.1316, 1
  %222 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %223 = load float, ptr %222, align 4, !invariant.load !22
  %224 = add i32 %22, 0
  %225 = add i32 %21, 0
  %226 = add i32 %19, 128
  %227 = mul nuw nsw i32 %226, 1
  %228 = add nuw nsw i32 0, %227
  %229 = udiv i32 %228, 152
  %230 = mul nuw nsw i32 %225, 1
  %231 = add nuw nsw i32 0, %230
  %232 = mul nuw nsw i32 %224, 50
  %233 = add nuw nsw i32 %231, %232
  %234 = udiv i32 %233, 409600
  %235 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %233, i32 %228
  %236 = load float, ptr %235, align 4, !invariant.load !22
  %multiply.1517 = fmul float %191, %236
  %subtract.1618 = fsub float %223, %multiply.1517
  %237 = insertvalue { float, float, float } %221, float %subtract.1618, 2
  %238 = extractvalue { float, float, float } %237, 0
  %239 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %238, ptr %239, align 4
  %240 = extractvalue { float, float, float } %237, 1
  %241 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %240, ptr %241, align 4
  %242 = extractvalue { float, float, float } %237, 2
  %243 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %242, ptr %243, align 4
  br label %fusion.in_bounds-after
}

define void @fusion_4(ptr noalias align 16 dereferenceable(104857600) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(249036800) %arg2, ptr noalias align 16 dereferenceable(104857600) %arg3, ptr noalias align 128 dereferenceable(104857600) %arg4, ptr noalias align 128 dereferenceable(104857600) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 6553600
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 50
  %7 = udiv i32 %linear_index_base, 3200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %linear_index1, 64
  %11 = urem i32 %10, 50
  %12 = udiv i32 %linear_index1, 3200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 64
  %15 = udiv i32 %linear_index2, 64
  %16 = urem i32 %15, 50
  %17 = udiv i32 %linear_index2, 3200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 64
  %20 = udiv i32 %linear_index3, 64
  %21 = urem i32 %20, 50
  %22 = udiv i32 %linear_index3, 3200
  %23 = icmp ult i32 %linear_index_base, 26214400
  br i1 %23, label %fusion_4.in_bounds-true, label %fusion_4.in_bounds-after

fusion_4.in_bounds-after:                         ; preds = %fusion_4.in_bounds-true, %entry
  ret void

fusion_4.in_bounds-true:                          ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !22
  %26 = load float, ptr %arg1, align 4, !invariant.load !22
  %27 = add i32 %7, 0
  %28 = add i32 %6, 0
  %29 = add i32 %4, 0
  %30 = mul nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 152
  %33 = mul nuw nsw i32 %28, 1
  %34 = add nuw nsw i32 0, %33
  %35 = mul nuw nsw i32 %27, 50
  %36 = add nuw nsw i32 %34, %35
  %37 = udiv i32 %36, 409600
  %38 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %36, i32 %31
  %39 = load float, ptr %38, align 4, !invariant.load !22
  %multiply.8 = fmul float %26, %39
  %subtract.9 = fsub float %25, %multiply.8
  %40 = insertvalue { float, float } undef, float %subtract.9, 0
  %41 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %42 = load float, ptr %41, align 4, !invariant.load !22
  %43 = add i32 %7, 0
  %44 = add i32 %6, 0
  %45 = add i32 %4, 64
  %46 = mul nuw nsw i32 %45, 1
  %47 = add nuw nsw i32 0, %46
  %48 = udiv i32 %47, 152
  %49 = mul nuw nsw i32 %44, 1
  %50 = add nuw nsw i32 0, %49
  %51 = mul nuw nsw i32 %43, 50
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 409600
  %54 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %52, i32 %47
  %55 = load float, ptr %54, align 4, !invariant.load !22
  %multiply.11 = fmul float %26, %55
  %subtract.12 = fsub float %42, %multiply.11
  %56 = insertvalue { float, float } %40, float %subtract.12, 1
  %57 = extractvalue { float, float } %56, 0
  %58 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %57, ptr %58, align 4
  %59 = extractvalue { float, float } %56, 1
  %60 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %59, ptr %60, align 4
  %61 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %62 = load float, ptr %61, align 4, !invariant.load !22
  %63 = load float, ptr %arg1, align 4, !invariant.load !22
  %64 = add i32 %12, 0
  %65 = add i32 %11, 0
  %66 = add i32 %9, 0
  %67 = mul nuw nsw i32 %66, 1
  %68 = add nuw nsw i32 0, %67
  %69 = udiv i32 %68, 152
  %70 = mul nuw nsw i32 %65, 1
  %71 = add nuw nsw i32 0, %70
  %72 = mul nuw nsw i32 %64, 50
  %73 = add nuw nsw i32 %71, %72
  %74 = udiv i32 %73, 409600
  %75 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %73, i32 %68
  %76 = load float, ptr %75, align 4, !invariant.load !22
  %multiply.81 = fmul float %63, %76
  %subtract.92 = fsub float %62, %multiply.81
  %77 = insertvalue { float, float } undef, float %subtract.92, 0
  %78 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %79 = load float, ptr %78, align 4, !invariant.load !22
  %80 = add i32 %12, 0
  %81 = add i32 %11, 0
  %82 = add i32 %9, 64
  %83 = mul nuw nsw i32 %82, 1
  %84 = add nuw nsw i32 0, %83
  %85 = udiv i32 %84, 152
  %86 = mul nuw nsw i32 %81, 1
  %87 = add nuw nsw i32 0, %86
  %88 = mul nuw nsw i32 %80, 50
  %89 = add nuw nsw i32 %87, %88
  %90 = udiv i32 %89, 409600
  %91 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %89, i32 %84
  %92 = load float, ptr %91, align 4, !invariant.load !22
  %multiply.113 = fmul float %63, %92
  %subtract.124 = fsub float %79, %multiply.113
  %93 = insertvalue { float, float } %77, float %subtract.124, 1
  %94 = extractvalue { float, float } %93, 0
  %95 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %94, ptr %95, align 4
  %96 = extractvalue { float, float } %93, 1
  %97 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %96, ptr %97, align 4
  %98 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %99 = load float, ptr %98, align 4, !invariant.load !22
  %100 = load float, ptr %arg1, align 4, !invariant.load !22
  %101 = add i32 %17, 0
  %102 = add i32 %16, 0
  %103 = add i32 %14, 0
  %104 = mul nuw nsw i32 %103, 1
  %105 = add nuw nsw i32 0, %104
  %106 = udiv i32 %105, 152
  %107 = mul nuw nsw i32 %102, 1
  %108 = add nuw nsw i32 0, %107
  %109 = mul nuw nsw i32 %101, 50
  %110 = add nuw nsw i32 %108, %109
  %111 = udiv i32 %110, 409600
  %112 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %110, i32 %105
  %113 = load float, ptr %112, align 4, !invariant.load !22
  %multiply.85 = fmul float %100, %113
  %subtract.96 = fsub float %99, %multiply.85
  %114 = insertvalue { float, float } undef, float %subtract.96, 0
  %115 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %116 = load float, ptr %115, align 4, !invariant.load !22
  %117 = add i32 %17, 0
  %118 = add i32 %16, 0
  %119 = add i32 %14, 64
  %120 = mul nuw nsw i32 %119, 1
  %121 = add nuw nsw i32 0, %120
  %122 = udiv i32 %121, 152
  %123 = mul nuw nsw i32 %118, 1
  %124 = add nuw nsw i32 0, %123
  %125 = mul nuw nsw i32 %117, 50
  %126 = add nuw nsw i32 %124, %125
  %127 = udiv i32 %126, 409600
  %128 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %126, i32 %121
  %129 = load float, ptr %128, align 4, !invariant.load !22
  %multiply.117 = fmul float %100, %129
  %subtract.128 = fsub float %116, %multiply.117
  %130 = insertvalue { float, float } %114, float %subtract.128, 1
  %131 = extractvalue { float, float } %130, 0
  %132 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %131, ptr %132, align 4
  %133 = extractvalue { float, float } %130, 1
  %134 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %133, ptr %134, align 4
  %135 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %136 = load float, ptr %135, align 4, !invariant.load !22
  %137 = load float, ptr %arg1, align 4, !invariant.load !22
  %138 = add i32 %22, 0
  %139 = add i32 %21, 0
  %140 = add i32 %19, 0
  %141 = mul nuw nsw i32 %140, 1
  %142 = add nuw nsw i32 0, %141
  %143 = udiv i32 %142, 152
  %144 = mul nuw nsw i32 %139, 1
  %145 = add nuw nsw i32 0, %144
  %146 = mul nuw nsw i32 %138, 50
  %147 = add nuw nsw i32 %145, %146
  %148 = udiv i32 %147, 409600
  %149 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %147, i32 %142
  %150 = load float, ptr %149, align 4, !invariant.load !22
  %multiply.89 = fmul float %137, %150
  %subtract.910 = fsub float %136, %multiply.89
  %151 = insertvalue { float, float } undef, float %subtract.910, 0
  %152 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %153 = load float, ptr %152, align 4, !invariant.load !22
  %154 = add i32 %22, 0
  %155 = add i32 %21, 0
  %156 = add i32 %19, 64
  %157 = mul nuw nsw i32 %156, 1
  %158 = add nuw nsw i32 0, %157
  %159 = udiv i32 %158, 152
  %160 = mul nuw nsw i32 %155, 1
  %161 = add nuw nsw i32 0, %160
  %162 = mul nuw nsw i32 %154, 50
  %163 = add nuw nsw i32 %161, %162
  %164 = udiv i32 %163, 409600
  %165 = getelementptr inbounds [409600 x [152 x float]], ptr %arg2, i32 0, i32 %163, i32 %158
  %166 = load float, ptr %165, align 4, !invariant.load !22
  %multiply.1111 = fmul float %137, %166
  %subtract.1212 = fsub float %153, %multiply.1111
  %167 = insertvalue { float, float } %151, float %subtract.1212, 1
  %168 = extractvalue { float, float } %167, 0
  %169 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %168, ptr %169, align 4
  %170 = extractvalue { float, float } %167, 1
  %171 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %170, ptr %171, align 4
  br label %fusion_4.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19}

!0 = !{ptr @fusion_15, !"kernel", i32 1}
!1 = !{ptr @fusion_15, !"reqntidx", i32 256}
!2 = !{ptr @fusion_14, !"kernel", i32 1}
!3 = !{ptr @fusion_14, !"reqntidx", i32 96}
!4 = !{ptr @fusion_11, !"kernel", i32 1}
!5 = !{ptr @fusion_11, !"reqntidx", i32 96}
!6 = !{ptr @fusion_10, !"kernel", i32 1}
!7 = !{ptr @fusion_10, !"reqntidx", i32 256}
!8 = !{ptr @fusion_9, !"kernel", i32 1}
!9 = !{ptr @fusion_9, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_6, !"kernel", i32 1}
!11 = !{ptr @fusion_6, !"reqntidx", i32 256}
!12 = !{ptr @fusion_5, !"kernel", i32 1}
!13 = !{ptr @fusion_5, !"reqntidx", i32 256}
!14 = !{ptr @fusion_13, !"kernel", i32 1}
!15 = !{ptr @fusion_13, !"reqntidx", i32 1024}
!16 = !{ptr @fusion, !"kernel", i32 1}
!17 = !{ptr @fusion, !"reqntidx", i32 256}
!18 = !{ptr @fusion_4, !"kernel", i32 1}
!19 = !{ptr @fusion_4, !"reqntidx", i32 256}
!20 = !{i32 0, i32 2048}
!21 = !{i32 0, i32 256}
!22 = !{}
!23 = !{i32 0, i32 1}
!24 = !{i32 0, i32 96}
!25 = !{i32 0, i32 546134}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.vectorize.enable", i1 false}
!28 = distinct !{!28, !27, !29}
!29 = !{!"llvm.loop.unroll.full"}
!30 = distinct !{!30, !27, !29}
!31 = !{i32 0, i32 10923}
!32 = distinct !{!32, !27}
!33 = distinct !{!33, !27, !29}
!34 = distinct !{!34, !27, !29}
!35 = !{i32 0, i32 1600}
!36 = !{i32 0, i32 1024}
!37 = !{i32 0, i32 32768}
!38 = distinct !{!38, !27, !29}
!39 = distinct !{!39, !27}
!40 = !{i32 0, i32 242}
!41 = !{i32 0, i32 38}
!42 = !{i32 0, i32 3200}
!43 = !{i32 0, i32 25600}
