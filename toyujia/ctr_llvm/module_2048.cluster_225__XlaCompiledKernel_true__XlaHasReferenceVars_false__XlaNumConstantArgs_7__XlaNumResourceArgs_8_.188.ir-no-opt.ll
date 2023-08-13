target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache2 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @fusion_14(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 16 dereferenceable(8388608) %arg1, ptr noalias align 16 dereferenceable(48496640) %arg2, ptr noalias align 128 dereferenceable(8388608) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 524288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %linear_index1, 64
  %11 = urem i32 %10, 4
  %12 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 64
  %15 = udiv i32 %linear_index2, 64
  %16 = urem i32 %15, 4
  %17 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 64
  %20 = udiv i32 %linear_index3, 64
  %21 = urem i32 %20, 4
  %22 = udiv i32 %linear_index3, 256
  %23 = icmp ult i32 %linear_index_base, 2097152
  br i1 %23, label %fusion_14.in_bounds-true, label %fusion_14.in_bounds-after

fusion_14.in_bounds-after:                        ; preds = %fusion_14.in_bounds-true, %entry
  ret void

fusion_14.in_bounds-true:                         ; preds = %entry
  %24 = mul nuw nsw i32 %4, 1
  %25 = add nuw nsw i32 0, %24
  %26 = mul nuw nsw i32 %6, 64
  %27 = add nuw nsw i32 %25, %26
  %28 = udiv i32 %27, 256
  %29 = mul nuw nsw i32 %7, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  %32 = add i32 %30, 0
  %33 = add i32 %27, 968
  %34 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg2, i32 0, i32 %32, i32 %33
  %35 = load float, ptr %34, align 4, !invariant.load !24
  %36 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %37 = load float, ptr %36, align 4, !invariant.load !24
  %add.5 = fadd float %35, %37
  %38 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %39 = load float, ptr %38, align 4, !invariant.load !24
  %add.6 = fadd float %add.5, %39
  %40 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %add.6, ptr %40, align 4
  %41 = mul nuw nsw i32 %9, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %11, 64
  %44 = add nuw nsw i32 %42, %43
  %45 = udiv i32 %44, 256
  %46 = mul nuw nsw i32 %12, 1
  %47 = add nuw nsw i32 0, %46
  %48 = udiv i32 %47, 8192
  %49 = add i32 %47, 0
  %50 = add i32 %44, 968
  %51 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg2, i32 0, i32 %49, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !24
  %53 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %54 = load float, ptr %53, align 4, !invariant.load !24
  %add.51 = fadd float %52, %54
  %55 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %56 = load float, ptr %55, align 4, !invariant.load !24
  %add.62 = fadd float %add.51, %56
  %57 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %add.62, ptr %57, align 4
  %58 = mul nuw nsw i32 %14, 1
  %59 = add nuw nsw i32 0, %58
  %60 = mul nuw nsw i32 %16, 64
  %61 = add nuw nsw i32 %59, %60
  %62 = udiv i32 %61, 256
  %63 = mul nuw nsw i32 %17, 1
  %64 = add nuw nsw i32 0, %63
  %65 = udiv i32 %64, 8192
  %66 = add i32 %64, 0
  %67 = add i32 %61, 968
  %68 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg2, i32 0, i32 %66, i32 %67
  %69 = load float, ptr %68, align 4, !invariant.load !24
  %70 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %71 = load float, ptr %70, align 4, !invariant.load !24
  %add.53 = fadd float %69, %71
  %72 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %73 = load float, ptr %72, align 4, !invariant.load !24
  %add.64 = fadd float %add.53, %73
  %74 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %add.64, ptr %74, align 4
  %75 = mul nuw nsw i32 %19, 1
  %76 = add nuw nsw i32 0, %75
  %77 = mul nuw nsw i32 %21, 64
  %78 = add nuw nsw i32 %76, %77
  %79 = udiv i32 %78, 256
  %80 = mul nuw nsw i32 %22, 1
  %81 = add nuw nsw i32 0, %80
  %82 = udiv i32 %81, 8192
  %83 = add i32 %81, 0
  %84 = add i32 %78, 968
  %85 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg2, i32 0, i32 %83, i32 %84
  %86 = load float, ptr %85, align 4, !invariant.load !24
  %87 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %88 = load float, ptr %87, align 4, !invariant.load !24
  %add.55 = fadd float %86, %88
  %89 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %90 = load float, ptr %89, align 4, !invariant.load !24
  %add.66 = fadd float %add.55, %90
  %91 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %add.66, ptr %91, align 4
  br label %fusion_14.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @slice_1(ptr noalias align 16 dereferenceable(48496640) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
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
  br i1 %15, label %slice_1.in_bounds-true, label %slice_1.in_bounds-after

slice_1.in_bounds-after:                          ; preds = %slice_1.in_bounds-true, %entry
  ret void

slice_1.in_bounds-true:                           ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 1224
  %18 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg0, i32 0, i32 %16, i32 %17
  %19 = load float, ptr %18, align 4, !invariant.load !24
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %19, ptr %20, align 4
  %21 = add i32 %8, 0
  %22 = add i32 %7, 1224
  %23 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg0, i32 0, i32 %21, i32 %22
  %24 = load float, ptr %23, align 4, !invariant.load !24
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %24, ptr %25, align 4
  %26 = add i32 %11, 0
  %27 = add i32 %10, 1224
  %28 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !24
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %29, ptr %30, align 4
  %31 = add i32 %14, 0
  %32 = add i32 %13, 1224
  %33 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg0, i32 0, i32 %31, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !24
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %34, ptr %35, align 4
  br label %slice_1.in_bounds-after
}

define void @slice(ptr noalias align 16 dereferenceable(48496640) %arg0, ptr noalias align 128 dereferenceable(31719424) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1982464
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 968
  %5 = udiv i32 %linear_index_base, 968
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 968
  %8 = udiv i32 %linear_index1, 968
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 968
  %11 = udiv i32 %linear_index2, 968
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 968
  %14 = udiv i32 %linear_index3, 968
  %15 = icmp ult i32 %linear_index_base, 7929856
  br i1 %15, label %slice.in_bounds-true, label %slice.in_bounds-after

slice.in_bounds-after:                            ; preds = %slice.in_bounds-true, %entry
  ret void

slice.in_bounds-true:                             ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 0
  %18 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg0, i32 0, i32 %16, i32 %17
  %19 = load float, ptr %18, align 4, !invariant.load !24
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %19, ptr %20, align 4
  %21 = add i32 %8, 0
  %22 = add i32 %7, 0
  %23 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg0, i32 0, i32 %21, i32 %22
  %24 = load float, ptr %23, align 4, !invariant.load !24
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %24, ptr %25, align 4
  %26 = add i32 %11, 0
  %27 = add i32 %10, 0
  %28 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !24
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %29, ptr %30, align 4
  %31 = add i32 %14, 0
  %32 = add i32 %13, 0
  %33 = getelementptr inbounds [8192 x [1480 x float]], ptr %arg0, i32 0, i32 %31, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !24
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %34, ptr %35, align 4
  br label %slice.in_bounds-after
}

define void @fusion_13(ptr noalias align 16 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1, ptr noalias align 16 dereferenceable(419430400) %arg2, ptr noalias align 128 dereferenceable(419430400) %arg3, ptr noalias align 128 dereferenceable(6553600) %arg4) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %result_from_other_lane34 = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
  %return_buffer30 = alloca float, align 4
  %result_from_other_lane28 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %tile_loop.invar_address11 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !26
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_17_constant_10 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_17_constant_10, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit8, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !29

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result26 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer27)
  %22 = load float, ptr %return_buffer27, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result29 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result29, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane28, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane28, ptr %return_buffer30)
  %24 = load float, ptr %return_buffer30, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result32 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane31, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane31, ptr %return_buffer33)
  %26 = load float, ptr %return_buffer33, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result35 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result35, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane34, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane34, ptr %return_buffer36)
  %28 = load float, ptr %return_buffer36, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result38 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane37, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane37, ptr %return_buffer39)
  %30 = load float, ptr %return_buffer39, align 4
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
  %43 = mul nuw nsw i32 %39, 64
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 104857600
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 256
  %52 = urem i32 %51, 50
  %53 = udiv i32 %46, 12800
  %Arg_1.2 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg1, i32 0, i32 %53, i32 %50, i32 %48
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !24
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %46
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !24
  %multiply.9 = fmul float %Arg_1.23, %Arg_2.34
  store float %multiply.9, ptr %reduction_input_address, align 4
  %54 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11(ptr %54, ptr %reduction_input_address, ptr %return_buffer)
  %55 = load float, ptr %return_buffer, align 4
  store float %55, ptr %54, align 4
  %56 = mul nuw nsw i32 %48, 1
  %57 = add nuw nsw i32 0, %56
  %58 = mul nuw nsw i32 %50, 64
  %59 = add nuw nsw i32 %57, %58
  %60 = udiv i32 %59, 256
  %61 = mul nuw nsw i32 %52, 1
  %62 = add nuw nsw i32 0, %61
  %63 = mul nuw nsw i32 %53, 50
  %64 = add nuw nsw i32 %62, %63
  %65 = udiv i32 %64, 409600
  %66 = mul nuw nsw i32 %59, 1
  %67 = add nuw nsw i32 0, %66
  %68 = urem i32 %67, 64
  %69 = udiv i32 %67, 64
  %70 = udiv i32 %69, 4
  %71 = mul nuw nsw i32 %64, 1
  %72 = add nuw nsw i32 0, %71
  %73 = urem i32 %72, 50
  %74 = udiv i32 %72, 50
  %75 = udiv i32 %74, 8192
  %Arg_1.25 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg1, i32 0, i32 %74, i32 %69, i32 %68
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !24
  %76 = udiv i32 %46, 64
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %76
  %Arg_0.17 = load float, ptr %Arg_0.1, align 4, !invariant.load !24
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  %77 = mul nuw nsw i32 %48, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %50, 64
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 256
  %82 = mul nuw nsw i32 %52, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %53, 50
  %85 = add nuw nsw i32 %83, %84
  %86 = udiv i32 %85, 409600
  %87 = getelementptr inbounds float, ptr %arg3, i32 %46
  store float %multiply.7, ptr %87, align 4
  br label %tile_loop.loop_header, !llvm.loop !31

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %88 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address11, align 4
  br label %tile_loop.loop_header9

tile_loop.loop_header9:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar12 = load i32, ptr %tile_loop.invar_address11, align 4
  %89 = icmp uge i32 %tile_loop.indvar12, 16
  br i1 %89, label %tile_loop.loop_exit8, label %tile_loop.loop_body10

tile_loop.loop_body10:                            ; preds = %tile_loop.loop_header9
  %invar.inc13 = add nuw nsw i32 %tile_loop.indvar12, 1
  store i32 %invar.inc13, ptr %tile_loop.invar_address11, align 4
  %90 = icmp eq i32 %tile_loop.indvar12, 0
  %91 = mul i32 %tile_loop.indvar12, 32
  %92 = add i32 %91, 0
  %x_loc14 = add i32 %92, %88
  %93 = add i32 %tile_origin.1, %y_in_tile.indvar
  %94 = add i32 %tile_origin.2, %x_loc14
  %95 = icmp ult i32 %x_loc14, %tile_bound1
  br i1 %95, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body10
  br label %tile_loop.loop_header9, !llvm.loop !33

tile_loop.loop_exit8:                             ; preds = %tile_loop.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body10
  %96 = mul nuw nsw i32 %94, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %93, 64
  %99 = add nuw nsw i32 %97, %98
  %100 = mul nuw nsw i32 %tile_origin.0, 104857600
  %101 = add nuw nsw i32 %99, %100
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 64
  %104 = udiv i32 %101, 64
  %105 = urem i32 %104, 4
  %106 = udiv i32 %101, 256
  %107 = urem i32 %106, 50
  %108 = udiv i32 %101, 12800
  %Arg_1.215 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg1, i32 0, i32 %108, i32 %105, i32 %103
  %Arg_1.216 = load float, ptr %Arg_1.215, align 4, !invariant.load !24
  %Arg_2.317 = getelementptr inbounds float, ptr %arg2, i32 %101
  %Arg_2.318 = load float, ptr %Arg_2.317, align 4, !invariant.load !24
  %multiply.919 = fmul float %Arg_1.216, %Arg_2.318
  store float %multiply.919, ptr %reduction_input_address, align 4
  %109 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11(ptr %109, ptr %reduction_input_address, ptr %return_buffer20)
  %110 = load float, ptr %return_buffer20, align 4
  store float %110, ptr %109, align 4
  %111 = mul nuw nsw i32 %103, 1
  %112 = add nuw nsw i32 0, %111
  %113 = mul nuw nsw i32 %105, 64
  %114 = add nuw nsw i32 %112, %113
  %115 = udiv i32 %114, 256
  %116 = mul nuw nsw i32 %107, 1
  %117 = add nuw nsw i32 0, %116
  %118 = mul nuw nsw i32 %108, 50
  %119 = add nuw nsw i32 %117, %118
  %120 = udiv i32 %119, 409600
  %121 = mul nuw nsw i32 %114, 1
  %122 = add nuw nsw i32 0, %121
  %123 = urem i32 %122, 64
  %124 = udiv i32 %122, 64
  %125 = udiv i32 %124, 4
  %126 = mul nuw nsw i32 %119, 1
  %127 = add nuw nsw i32 0, %126
  %128 = urem i32 %127, 50
  %129 = udiv i32 %127, 50
  %130 = udiv i32 %129, 8192
  %Arg_1.221 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg1, i32 0, i32 %129, i32 %124, i32 %123
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !24
  %131 = udiv i32 %101, 64
  %Arg_0.123 = getelementptr inbounds float, ptr %arg0, i32 %131
  %Arg_0.124 = load float, ptr %Arg_0.123, align 4, !invariant.load !24
  %multiply.725 = fmul float %Arg_1.222, %Arg_0.124
  %132 = mul nuw nsw i32 %103, 1
  %133 = add nuw nsw i32 0, %132
  %134 = mul nuw nsw i32 %105, 64
  %135 = add nuw nsw i32 %133, %134
  %136 = udiv i32 %135, 256
  %137 = mul nuw nsw i32 %107, 1
  %138 = add nuw nsw i32 0, %137
  %139 = mul nuw nsw i32 %108, 50
  %140 = add nuw nsw i32 %138, %139
  %141 = udiv i32 %140, 409600
  %142 = getelementptr inbounds float, ptr %arg3, i32 %101
  store float %multiply.725, ptr %142, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %143 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %144 = addrspacecast ptr addrspace(3) %143 to ptr
  %145 = load float, ptr %current_output, align 4
  store float %145, ptr %144, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %146 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %147 = addrspacecast ptr addrspace(3) %146 to ptr
  store float %region_0_17_constant_10, ptr %initial_value_addr, align 4
  %148 = icmp ult i32 %thread_id.x, 1
  %149 = select i1 %148, ptr %147, ptr %initial_value_addr
  %150 = icmp eq i32 %thread_id.x, 0
  br i1 %150, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %151 = mul i32 %thread_id.x, 1
  %152 = add i32 %tile_origin.1, %thread_id.y
  %153 = add i32 %tile_origin.2, %151
  %154 = add i32 %153, 0
  %155 = udiv i32 %152, 1
  %156 = urem i32 %155, 4
  %157 = udiv i32 %152, 4
  %158 = urem i32 %157, 50
  %159 = udiv i32 %152, 200
  %output_element_address = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg4, i32 0, i32 %159, i32 %156, i32 %158
  %output = load float, ptr %149, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_11(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.14.typed = alloca float, align 4
  %Arg_0.12 = load float, ptr %Arg_0.12.typed, align 4
  %Arg_1.13 = load float, ptr %Arg_1.13.typed, align 4
  %add.14 = fadd float %Arg_0.12, %Arg_1.13
  store float %add.14, ptr %add.14.typed, align 4
  %load_ret_value = load float, ptr %add.14.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define void @fusion_10(ptr noalias align 16 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(6553600) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !26
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_11_constant_5 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_11_constant_5, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
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
  br label %y_in_tile.loop_header, !llvm.loop !35

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
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
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 200
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !24
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !24
  %multiply.4 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.4, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_6(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !36

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
  br label %tile_loop.loop_header6, !llvm.loop !37

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
  %71 = urem i32 %70, 4
  %72 = udiv i32 %67, 200
  %Arg_1.212 = getelementptr inbounds float, ptr %arg1, i32 %67
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !24
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !24
  %multiply.416 = fmul float %Arg_1.213, %Arg_0.115
  store float %multiply.416, ptr %reduction_input_address, align 4
  %73 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_6(ptr %73, ptr %reduction_input_address, ptr %return_buffer17)
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
  store float %region_0_11_constant_5, ptr %initial_value_addr, align 4
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
  %88 = urem i32 %87, 4
  %89 = udiv i32 %84, 4
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr %arg2, i32 0, i32 %89, i32 %88
  %output = load float, ptr %81, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_6(ptr dereferenceable(4) %Arg_0.7.typed, ptr dereferenceable(4) %Arg_1.8.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.9.typed = alloca float, align 4
  %Arg_0.7 = load float, ptr %Arg_0.7.typed, align 4
  %Arg_1.8 = load float, ptr %Arg_1.8.typed, align 4
  %add.9 = fadd float %Arg_0.7, %Arg_1.8
  store float %add.9, ptr %add.9.typed, align 4
  %load_ret_value = load float, ptr %add.9.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_9(ptr noalias align 16 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(6553600) %arg3, ptr noalias align 128 dereferenceable(6553600) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 409600
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index_base, 4
  %6 = urem i32 %5, 50
  %7 = udiv i32 %linear_index_base, 200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 4
  %10 = udiv i32 %linear_index1, 4
  %11 = urem i32 %10, 50
  %12 = udiv i32 %linear_index1, 200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 4
  %15 = udiv i32 %linear_index2, 4
  %16 = urem i32 %15, 50
  %17 = udiv i32 %linear_index2, 200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 4
  %20 = udiv i32 %linear_index3, 4
  %21 = urem i32 %20, 50
  %22 = udiv i32 %linear_index3, 200
  %23 = icmp ult i32 %linear_index_base, 1638400
  br i1 %23, label %fusion_9.in_bounds-true, label %fusion_9.in_bounds-after

fusion_9.in_bounds-after:                         ; preds = %fusion_9.in_bounds-true, %entry
  ret void

fusion_9.in_bounds-true:                          ; preds = %entry
  %24 = load float, ptr %arg2, align 4, !invariant.load !24
  %25 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg3, i32 0, i32 %7, i32 %4, i32 %6
  %26 = load float, ptr %25, align 4, !invariant.load !24
  %27 = getelementptr inbounds [8192 x [4 x float]], ptr %arg1, i32 0, i32 %7, i32 %4
  %28 = load float, ptr %27, align 4, !invariant.load !24
  %subtract.8 = fsub float %26, %28
  %29 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %7, i32 %4, i32 %6
  %30 = load float, ptr %29, align 4, !invariant.load !24
  %multiply.9 = fmul float %subtract.8, %30
  %multiply.10 = fmul float %24, %multiply.9
  %31 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %multiply.10, ptr %31, align 4
  %32 = load float, ptr %arg2, align 4, !invariant.load !24
  %33 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg3, i32 0, i32 %12, i32 %9, i32 %11
  %34 = load float, ptr %33, align 4, !invariant.load !24
  %35 = getelementptr inbounds [8192 x [4 x float]], ptr %arg1, i32 0, i32 %12, i32 %9
  %36 = load float, ptr %35, align 4, !invariant.load !24
  %subtract.81 = fsub float %34, %36
  %37 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %12, i32 %9, i32 %11
  %38 = load float, ptr %37, align 4, !invariant.load !24
  %multiply.92 = fmul float %subtract.81, %38
  %multiply.103 = fmul float %32, %multiply.92
  %39 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %multiply.103, ptr %39, align 4
  %40 = load float, ptr %arg2, align 4, !invariant.load !24
  %41 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg3, i32 0, i32 %17, i32 %14, i32 %16
  %42 = load float, ptr %41, align 4, !invariant.load !24
  %43 = getelementptr inbounds [8192 x [4 x float]], ptr %arg1, i32 0, i32 %17, i32 %14
  %44 = load float, ptr %43, align 4, !invariant.load !24
  %subtract.84 = fsub float %42, %44
  %45 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %17, i32 %14, i32 %16
  %46 = load float, ptr %45, align 4, !invariant.load !24
  %multiply.95 = fmul float %subtract.84, %46
  %multiply.106 = fmul float %40, %multiply.95
  %47 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %multiply.106, ptr %47, align 4
  %48 = load float, ptr %arg2, align 4, !invariant.load !24
  %49 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg3, i32 0, i32 %22, i32 %19, i32 %21
  %50 = load float, ptr %49, align 4, !invariant.load !24
  %51 = getelementptr inbounds [8192 x [4 x float]], ptr %arg1, i32 0, i32 %22, i32 %19
  %52 = load float, ptr %51, align 4, !invariant.load !24
  %subtract.87 = fsub float %50, %52
  %53 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %22, i32 %19, i32 %21
  %54 = load float, ptr %53, align 4, !invariant.load !24
  %multiply.98 = fmul float %subtract.87, %54
  %multiply.109 = fmul float %48, %multiply.98
  %55 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %multiply.109, ptr %55, align 4
  br label %fusion_9.in_bounds-after
}

define void @fusion_8(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(6553600) %arg1, ptr noalias align 16 dereferenceable(419430400) %arg2, ptr noalias align 128 dereferenceable(419430400) %arg3, ptr noalias align 128 dereferenceable(8388608) %arg4) {
entry:
  %return_buffer53 = alloca float, align 4
  %result_from_other_lane51 = alloca float, align 4
  %return_buffer50 = alloca float, align 4
  %result_from_other_lane48 = alloca float, align 4
  %return_buffer47 = alloca float, align 4
  %result_from_other_lane45 = alloca float, align 4
  %return_buffer44 = alloca float, align 4
  %result_from_other_lane42 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer26 = alloca float, align 4
  %result_from_other_lane24 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer16 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !26
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after55, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_17_constant_10 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_17_constant_10, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_17_constant_10, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
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
  %13 = urem i32 %12, 4
  %14 = udiv i32 %9, 4
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 4
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 50, i32 4096
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after10, %y_in_tile.loop_body
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
  %x_loc8 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc8
  %33 = icmp ult i32 %x_loc8, %tile_bound1
  br i1 %33, label %x_in_tile-true9, label %x_in_tile-after10

x_in_tile-after10:                                ; preds = %x_in_tile-true9, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !41

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !42

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result22 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_11__1(ptr %36, ptr %result_from_other_lane, ptr %return_buffer23)
  %38 = load float, ptr %return_buffer23, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result25 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result25, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane24, align 4
  call void @region_1_11__1(ptr %36, ptr %result_from_other_lane24, ptr %return_buffer26)
  %40 = load float, ptr %return_buffer26, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result28 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane27, align 4
  call void @region_1_11__1(ptr %36, ptr %result_from_other_lane27, ptr %return_buffer29)
  %42 = load float, ptr %return_buffer29, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result31 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane30, align 4
  call void @region_1_11__1(ptr %36, ptr %result_from_other_lane30, ptr %return_buffer32)
  %44 = load float, ptr %return_buffer32, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result34 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane33, align 4
  call void @region_1_11__1(ptr %36, ptr %result_from_other_lane33, ptr %return_buffer35)
  %46 = load float, ptr %return_buffer35, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address36 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address36 to ptr
  %current_output37 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output37, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr38 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr38 to ptr
  %partial_reduction_result40 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane39, align 4
  call void @region_1_11__1(ptr %55, ptr %result_from_other_lane39, ptr %return_buffer41)
  %57 = load float, ptr %return_buffer41, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result43 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result43, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane42, align 4
  call void @region_1_11__1(ptr %55, ptr %result_from_other_lane42, ptr %return_buffer44)
  %59 = load float, ptr %return_buffer44, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result46 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result46, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane45, align 4
  call void @region_1_11__1(ptr %55, ptr %result_from_other_lane45, ptr %return_buffer47)
  %61 = load float, ptr %return_buffer47, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result49 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result49, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane48, align 4
  call void @region_1_11__1(ptr %55, ptr %result_from_other_lane48, ptr %return_buffer50)
  %63 = load float, ptr %return_buffer50, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result52 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result52, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane51, align 4
  call void @region_1_11__1(ptr %55, ptr %result_from_other_lane51, ptr %return_buffer53)
  %65 = load float, ptr %return_buffer53, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true54, label %reduction_write_output-after55

reduction_write_output-after55:                   ; preds = %reduction_write_output-true54, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 256
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 12800
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 4
  %82 = udiv i32 %77, 256
  %83 = urem i32 %82, 50
  %84 = udiv i32 %77, 12800
  %85 = mul i32 %thread_id.x, 2
  %86 = sub i32 %x_loc, %85
  %Arg_1.2 = getelementptr inbounds [8192 x [50 x [4 x float]]], ptr %arg1, i32 0, i32 %84, i32 %83, i32 %81
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !24
  %Arg_2.3 = getelementptr inbounds [8192 x [50 x [4 x [64 x float]]]], ptr %arg2, i32 0, i32 %84, i32 %83, i32 %81, i32 %79
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !24
  %multiply.9 = fmul float %Arg_1.23, %Arg_2.34
  store float %multiply.9, ptr %reduction_input_address, align 4
  %87 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %86
  call void @region_1_11__1(ptr %87, ptr %reduction_input_address, ptr %return_buffer)
  %88 = load float, ptr %return_buffer, align 4
  store float %88, ptr %87, align 4
  %89 = mul nuw nsw i32 %79, 1
  %90 = add nuw nsw i32 0, %89
  %91 = mul nuw nsw i32 %81, 64
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 256
  %94 = mul nuw nsw i32 %83, 1
  %95 = add nuw nsw i32 0, %94
  %96 = mul nuw nsw i32 %84, 50
  %97 = add nuw nsw i32 %95, %96
  %98 = udiv i32 %97, 409600
  %99 = mul nuw nsw i32 %92, 1
  %100 = add nuw nsw i32 0, %99
  %101 = urem i32 %100, 64
  %102 = udiv i32 %100, 64
  %103 = udiv i32 %102, 4
  %104 = mul nuw nsw i32 %97, 1
  %105 = add nuw nsw i32 0, %104
  %106 = urem i32 %105, 50
  %107 = udiv i32 %105, 50
  %108 = udiv i32 %107, 8192
  %109 = udiv i32 %77, 64
  %Arg_1.25 = getelementptr inbounds float, ptr %arg1, i32 %109
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !24
  %Arg_0.1 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr %arg0, i32 0, i32 %107, i32 0, i32 %102, i32 %101
  %Arg_0.17 = load float, ptr %Arg_0.1, align 4, !invariant.load !24
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  %110 = mul nuw nsw i32 %79, 1
  %111 = add nuw nsw i32 0, %110
  %112 = mul nuw nsw i32 %81, 64
  %113 = add nuw nsw i32 %111, %112
  %114 = udiv i32 %113, 256
  %115 = mul nuw nsw i32 %83, 1
  %116 = add nuw nsw i32 0, %115
  %117 = mul nuw nsw i32 %84, 50
  %118 = add nuw nsw i32 %116, %117
  %119 = udiv i32 %118, 409600
  %120 = getelementptr inbounds [409600 x [256 x float]], ptr %arg3, i32 0, i32 %118, i32 %113
  store float %multiply.7, ptr %120, align 4
  br label %x_in_tile-after

x_in_tile-true9:                                  ; preds = %x_in_tile-after
  %121 = mul nuw nsw i32 %32, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %31, 256
  %124 = add nuw nsw i32 %122, %123
  %125 = mul nuw nsw i32 %tile_origin.0, 12800
  %126 = add nuw nsw i32 %124, %125
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 64
  %129 = udiv i32 %126, 64
  %130 = urem i32 %129, 4
  %131 = udiv i32 %126, 256
  %132 = urem i32 %131, 50
  %133 = udiv i32 %126, 12800
  %134 = mul i32 %thread_id.x, 2
  %135 = sub i32 %x_loc8, %134
  %Arg_1.211 = getelementptr inbounds [8192 x [50 x [4 x float]]], ptr %arg1, i32 0, i32 %133, i32 %132, i32 %130
  %Arg_1.212 = load float, ptr %Arg_1.211, align 4, !invariant.load !24
  %Arg_2.313 = getelementptr inbounds [8192 x [50 x [4 x [64 x float]]]], ptr %arg2, i32 0, i32 %133, i32 %132, i32 %130, i32 %128
  %Arg_2.314 = load float, ptr %Arg_2.313, align 4, !invariant.load !24
  %multiply.915 = fmul float %Arg_1.212, %Arg_2.314
  store float %multiply.915, ptr %reduction_input_address, align 4
  %136 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %135
  call void @region_1_11__1(ptr %136, ptr %reduction_input_address, ptr %return_buffer16)
  %137 = load float, ptr %return_buffer16, align 4
  store float %137, ptr %136, align 4
  %138 = mul nuw nsw i32 %128, 1
  %139 = add nuw nsw i32 0, %138
  %140 = mul nuw nsw i32 %130, 64
  %141 = add nuw nsw i32 %139, %140
  %142 = udiv i32 %141, 256
  %143 = mul nuw nsw i32 %132, 1
  %144 = add nuw nsw i32 0, %143
  %145 = mul nuw nsw i32 %133, 50
  %146 = add nuw nsw i32 %144, %145
  %147 = udiv i32 %146, 409600
  %148 = mul nuw nsw i32 %141, 1
  %149 = add nuw nsw i32 0, %148
  %150 = urem i32 %149, 64
  %151 = udiv i32 %149, 64
  %152 = udiv i32 %151, 4
  %153 = mul nuw nsw i32 %146, 1
  %154 = add nuw nsw i32 0, %153
  %155 = urem i32 %154, 50
  %156 = udiv i32 %154, 50
  %157 = udiv i32 %156, 8192
  %158 = udiv i32 %126, 64
  %Arg_1.217 = getelementptr inbounds float, ptr %arg1, i32 %158
  %Arg_1.218 = load float, ptr %Arg_1.217, align 4, !invariant.load !24
  %Arg_0.119 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr %arg0, i32 0, i32 %156, i32 0, i32 %151, i32 %150
  %Arg_0.120 = load float, ptr %Arg_0.119, align 4, !invariant.load !24
  %multiply.721 = fmul float %Arg_1.218, %Arg_0.120
  %159 = mul nuw nsw i32 %128, 1
  %160 = add nuw nsw i32 0, %159
  %161 = mul nuw nsw i32 %130, 64
  %162 = add nuw nsw i32 %160, %161
  %163 = udiv i32 %162, 256
  %164 = mul nuw nsw i32 %132, 1
  %165 = add nuw nsw i32 0, %164
  %166 = mul nuw nsw i32 %133, 50
  %167 = add nuw nsw i32 %165, %166
  %168 = udiv i32 %167, 409600
  %169 = getelementptr inbounds [409600 x [256 x float]], ptr %arg3, i32 0, i32 %167, i32 %162
  store float %multiply.721, ptr %169, align 4
  br label %x_in_tile-after10

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %170 = mul i32 %thread_id.y, 2
  %171 = add i32 %tile_origin.1, %thread_id.x
  %172 = add i32 %tile_origin.2, %170
  %173 = add i32 %172, 0
  %174 = mul i32 %tile_origin.0, 256
  %175 = add i32 %174, %173
  %176 = udiv i32 %175, 1
  %177 = urem i32 %176, 64
  %178 = udiv i32 %175, 64
  %179 = urem i32 %178, 4
  %180 = udiv i32 %175, 256
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg4, i32 0, i32 %180, i32 %179, i32 %177
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true54:                    ; preds = %reduction_write_output-after
  %181 = mul i32 %thread_id.y, 2
  %182 = add i32 %tile_origin.1, %thread_id.x
  %183 = add i32 %tile_origin.2, %181
  %184 = add i32 %183, 1
  %185 = mul i32 %tile_origin.0, 256
  %186 = add i32 %185, %184
  %187 = udiv i32 %186, 1
  %188 = urem i32 %187, 64
  %189 = udiv i32 %186, 64
  %190 = urem i32 %189, 4
  %191 = udiv i32 %186, 256
  %output_element_address56 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg4, i32 0, i32 %191, i32 %190, i32 %188
  %output57 = load float, ptr %55, align 4
  store float %output57, ptr %output_element_address56, align 4
  br label %reduction_write_output-after55
}

define internal void @region_1_11__1(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.14.typed = alloca float, align 4
  %Arg_0.12 = load float, ptr %Arg_0.12.typed, align 4
  %Arg_1.13 = load float, ptr %Arg_1.13.typed, align 4
  %add.14 = fadd float %Arg_0.12, %Arg_1.13
  store float %add.14, ptr %add.14.typed, align 4
  %load_ret_value = load float, ptr %add.14.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_5(ptr noalias align 16 dereferenceable(991232) %arg0, ptr noalias align 128 dereferenceable(991232) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
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
  %17 = load float, ptr %16, align 4, !invariant.load !24
  %18 = load float, ptr %arg2, align 4, !invariant.load !24
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4
  %multiply.5 = fmul float %18, %20
  %subtract.6 = fsub float %17, %multiply.5
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %subtract.6, ptr %21, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %23 = load float, ptr %22, align 4, !invariant.load !24
  %24 = load float, ptr %arg2, align 4, !invariant.load !24
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4
  %multiply.51 = fmul float %24, %26
  %subtract.62 = fsub float %23, %multiply.51
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %subtract.62, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4, !invariant.load !24
  %30 = load float, ptr %arg2, align 4, !invariant.load !24
  %31 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %32 = load float, ptr %31, align 4
  %multiply.53 = fmul float %30, %32
  %subtract.64 = fsub float %29, %multiply.53
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %subtract.64, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %35 = load float, ptr %34, align 4, !invariant.load !24
  %36 = load float, ptr %arg2, align 4, !invariant.load !24
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %multiply.55 = fmul float %36, %38
  %subtract.66 = fsub float %35, %multiply.55
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %subtract.66, ptr %39, align 4
  br label %fusion_5.in_bounds-after
}

define void @fusion_12(ptr noalias align 16 dereferenceable(155648) %arg0, ptr noalias align 128 dereferenceable(155648) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(155648) %arg3, ptr noalias align 128 dereferenceable(155648) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 38912
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 38912
  br i1 %6, label %fusion_12.in_bounds-true, label %fusion_12.in_bounds-after

fusion_12.in_bounds-after:                        ; preds = %fusion_12.in_bounds-true, %entry
  ret void

fusion_12.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !24
  %9 = load float, ptr %arg2, align 4, !invariant.load !24
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !24
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
  br label %fusion_12.in_bounds-after
}

define void @fusion(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(249036800) %arg2, ptr noalias align 16 dereferenceable(13107200) %arg3, ptr noalias align 16 dereferenceable(13107200) %arg4, ptr noalias align 128 dereferenceable(13107200) %arg5, ptr noalias align 128 dereferenceable(13107200) %arg6, ptr noalias align 128 dereferenceable(13107200) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
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
  %25 = load float, ptr %24, align 4, !invariant.load !24
  %26 = load float, ptr %arg1, align 4, !invariant.load !24
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
  %39 = load float, ptr %38, align 4, !invariant.load !24
  %multiply.9 = fmul float %26, %39
  %subtract.10 = fsub float %25, %multiply.9
  %40 = insertvalue { float, float, float } undef, float %subtract.10, 0
  %41 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %42 = load float, ptr %41, align 4, !invariant.load !24
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
  %55 = load float, ptr %54, align 4, !invariant.load !24
  %multiply.12 = fmul float %26, %55
  %subtract.13 = fsub float %42, %multiply.12
  %56 = insertvalue { float, float, float } %40, float %subtract.13, 1
  %57 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %58 = load float, ptr %57, align 4, !invariant.load !24
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
  %71 = load float, ptr %70, align 4, !invariant.load !24
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
  %80 = load float, ptr %79, align 4, !invariant.load !24
  %81 = load float, ptr %arg1, align 4, !invariant.load !24
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
  %94 = load float, ptr %93, align 4, !invariant.load !24
  %multiply.91 = fmul float %81, %94
  %subtract.102 = fsub float %80, %multiply.91
  %95 = insertvalue { float, float, float } undef, float %subtract.102, 0
  %96 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %97 = load float, ptr %96, align 4, !invariant.load !24
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
  %110 = load float, ptr %109, align 4, !invariant.load !24
  %multiply.123 = fmul float %81, %110
  %subtract.134 = fsub float %97, %multiply.123
  %111 = insertvalue { float, float, float } %95, float %subtract.134, 1
  %112 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %113 = load float, ptr %112, align 4, !invariant.load !24
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
  %126 = load float, ptr %125, align 4, !invariant.load !24
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
  %135 = load float, ptr %134, align 4, !invariant.load !24
  %136 = load float, ptr %arg1, align 4, !invariant.load !24
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
  %149 = load float, ptr %148, align 4, !invariant.load !24
  %multiply.97 = fmul float %136, %149
  %subtract.108 = fsub float %135, %multiply.97
  %150 = insertvalue { float, float, float } undef, float %subtract.108, 0
  %151 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %152 = load float, ptr %151, align 4, !invariant.load !24
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
  %165 = load float, ptr %164, align 4, !invariant.load !24
  %multiply.129 = fmul float %136, %165
  %subtract.1310 = fsub float %152, %multiply.129
  %166 = insertvalue { float, float, float } %150, float %subtract.1310, 1
  %167 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %168 = load float, ptr %167, align 4, !invariant.load !24
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
  %181 = load float, ptr %180, align 4, !invariant.load !24
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
  %190 = load float, ptr %189, align 4, !invariant.load !24
  %191 = load float, ptr %arg1, align 4, !invariant.load !24
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
  %204 = load float, ptr %203, align 4, !invariant.load !24
  %multiply.913 = fmul float %191, %204
  %subtract.1014 = fsub float %190, %multiply.913
  %205 = insertvalue { float, float, float } undef, float %subtract.1014, 0
  %206 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %207 = load float, ptr %206, align 4, !invariant.load !24
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
  %220 = load float, ptr %219, align 4, !invariant.load !24
  %multiply.1215 = fmul float %191, %220
  %subtract.1316 = fsub float %207, %multiply.1215
  %221 = insertvalue { float, float, float } %205, float %subtract.1316, 1
  %222 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %223 = load float, ptr %222, align 4, !invariant.load !24
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
  %236 = load float, ptr %235, align 4, !invariant.load !24
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
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
  %25 = load float, ptr %24, align 4, !invariant.load !24
  %26 = load float, ptr %arg1, align 4, !invariant.load !24
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
  %39 = load float, ptr %38, align 4, !invariant.load !24
  %multiply.8 = fmul float %26, %39
  %subtract.9 = fsub float %25, %multiply.8
  %40 = insertvalue { float, float } undef, float %subtract.9, 0
  %41 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %42 = load float, ptr %41, align 4, !invariant.load !24
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
  %55 = load float, ptr %54, align 4, !invariant.load !24
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
  %62 = load float, ptr %61, align 4, !invariant.load !24
  %63 = load float, ptr %arg1, align 4, !invariant.load !24
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
  %76 = load float, ptr %75, align 4, !invariant.load !24
  %multiply.81 = fmul float %63, %76
  %subtract.92 = fsub float %62, %multiply.81
  %77 = insertvalue { float, float } undef, float %subtract.92, 0
  %78 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %79 = load float, ptr %78, align 4, !invariant.load !24
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
  %92 = load float, ptr %91, align 4, !invariant.load !24
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
  %99 = load float, ptr %98, align 4, !invariant.load !24
  %100 = load float, ptr %arg1, align 4, !invariant.load !24
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
  %113 = load float, ptr %112, align 4, !invariant.load !24
  %multiply.85 = fmul float %100, %113
  %subtract.96 = fsub float %99, %multiply.85
  %114 = insertvalue { float, float } undef, float %subtract.96, 0
  %115 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %116 = load float, ptr %115, align 4, !invariant.load !24
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
  %129 = load float, ptr %128, align 4, !invariant.load !24
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
  %136 = load float, ptr %135, align 4, !invariant.load !24
  %137 = load float, ptr %arg1, align 4, !invariant.load !24
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
  %150 = load float, ptr %149, align 4, !invariant.load !24
  %multiply.89 = fmul float %137, %150
  %subtract.910 = fsub float %136, %multiply.89
  %151 = insertvalue { float, float } undef, float %subtract.910, 0
  %152 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %153 = load float, ptr %152, align 4, !invariant.load !24
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
  %166 = load float, ptr %165, align 4, !invariant.load !24
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

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21}

!0 = !{ptr @fusion_14, !"kernel", i32 1}
!1 = !{ptr @fusion_14, !"reqntidx", i32 256}
!2 = !{ptr @slice_1, !"kernel", i32 1}
!3 = !{ptr @slice_1, !"reqntidx", i32 256}
!4 = !{ptr @slice, !"kernel", i32 1}
!5 = !{ptr @slice, !"reqntidx", i32 256}
!6 = !{ptr @fusion_13, !"kernel", i32 1}
!7 = !{ptr @fusion_13, !"reqntidx", i32 96}
!8 = !{ptr @fusion_10, !"kernel", i32 1}
!9 = !{ptr @fusion_10, !"reqntidx", i32 96}
!10 = !{ptr @fusion_9, !"kernel", i32 1}
!11 = !{ptr @fusion_9, !"reqntidx", i32 256}
!12 = !{ptr @fusion_8, !"kernel", i32 1}
!13 = !{ptr @fusion_8, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_5, !"kernel", i32 1}
!15 = !{ptr @fusion_5, !"reqntidx", i32 256}
!16 = !{ptr @fusion_12, !"kernel", i32 1}
!17 = !{ptr @fusion_12, !"reqntidx", i32 1024}
!18 = !{ptr @fusion, !"kernel", i32 1}
!19 = !{ptr @fusion, !"reqntidx", i32 256}
!20 = !{ptr @fusion_4, !"kernel", i32 1}
!21 = !{ptr @fusion_4, !"reqntidx", i32 256}
!22 = !{i32 0, i32 2048}
!23 = !{i32 0, i32 256}
!24 = !{}
!25 = !{i32 0, i32 7744}
!26 = !{i32 0, i32 1}
!27 = !{i32 0, i32 96}
!28 = !{i32 0, i32 546134}
!29 = distinct !{!29, !30}
!30 = !{!"llvm.loop.vectorize.enable", i1 false}
!31 = distinct !{!31, !30, !32}
!32 = !{!"llvm.loop.unroll.full"}
!33 = distinct !{!33, !30, !32}
!34 = !{i32 0, i32 10923}
!35 = distinct !{!35, !30}
!36 = distinct !{!36, !30, !32}
!37 = distinct !{!37, !30, !32}
!38 = !{i32 0, i32 1600}
!39 = !{i32 0, i32 1024}
!40 = !{i32 0, i32 32768}
!41 = distinct !{!41, !30, !32}
!42 = distinct !{!42, !30}
!43 = !{i32 0, i32 242}
!44 = !{i32 0, i32 38}
!45 = !{i32 0, i32 3200}
!46 = !{i32 0, i32 25600}
