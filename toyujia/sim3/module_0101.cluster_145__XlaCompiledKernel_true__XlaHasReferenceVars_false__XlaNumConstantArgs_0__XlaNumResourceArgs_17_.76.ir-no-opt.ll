target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@3 = private unnamed_addr constant [4 x i8] c"\00\00\80?"

define void @add_8(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %add_8.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 2097152
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !11
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !12
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 256
  %7 = udiv i32 %linear_index_plus_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 256
  %10 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 256
  %13 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 256
  %16 = udiv i32 %linear_index3, 256
  %17 = icmp ult i32 %linear_index_plus_base, 2097152
  br i1 %17, label %add_8.in_bounds-true, label %add_8.in_bounds-after

add_8.in_bounds-after:                            ; preds = %add_8.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !13

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

add_8.in_bounds-true:                             ; preds = %loop.loop_body
  %18 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  %21 = load float, ptr %20, align 4, !invariant.load !15
  %add.3 = fadd float %19, %21
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  store float %add.3, ptr %22, align 4
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %24 = load float, ptr %23, align 4
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4, !invariant.load !15
  %add.31 = fadd float %24, %26
  %27 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %add.31, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %31 = load float, ptr %30, align 4, !invariant.load !15
  %add.32 = fadd float %29, %31
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %add.32, ptr %32, align 4
  %33 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %34 = load float, ptr %33, align 4
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %36 = load float, ptr %35, align 4, !invariant.load !15
  %add.33 = fadd float %34, %36
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %add.33, ptr %37, align 4
  br label %add_8.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_6(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 16 dereferenceable(1024) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
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

fusion_6.in_bounds-after:                         ; preds = %fusion_6.in_bounds-true, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !15
  %add.4 = fadd float %17, %19
  %region_0_8_constant_5 = load float, ptr @0, align 4
  %20 = fcmp oge float %add.4, %region_0_8_constant_5
  %21 = fcmp une float %add.4, %add.4
  %22 = or i1 %20, %21
  %maximum.7 = select i1 %22, float %add.4, float %region_0_8_constant_5
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  store float %maximum.7, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4
  %26 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %7
  %27 = load float, ptr %26, align 4, !invariant.load !15
  %add.41 = fadd float %25, %27
  %region_0_8_constant_52 = load float, ptr @0, align 4
  %28 = fcmp oge float %add.41, %region_0_8_constant_52
  %29 = fcmp une float %add.41, %add.41
  %30 = or i1 %28, %29
  %maximum.73 = select i1 %30, float %add.41, float %region_0_8_constant_52
  %31 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %maximum.73, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4
  %34 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %10
  %35 = load float, ptr %34, align 4, !invariant.load !15
  %add.44 = fadd float %33, %35
  %region_0_8_constant_55 = load float, ptr @0, align 4
  %36 = fcmp oge float %add.44, %region_0_8_constant_55
  %37 = fcmp une float %add.44, %add.44
  %38 = or i1 %36, %37
  %maximum.76 = select i1 %38, float %add.44, float %region_0_8_constant_55
  %39 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %maximum.76, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4
  %42 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %13
  %43 = load float, ptr %42, align 4, !invariant.load !15
  %add.47 = fadd float %41, %43
  %region_0_8_constant_58 = load float, ptr @0, align 4
  %44 = fcmp oge float %add.47, %region_0_8_constant_58
  %45 = fcmp une float %add.47, %add.47
  %46 = or i1 %44, %45
  %maximum.79 = select i1 %46, float %add.47, float %region_0_8_constant_58
  %47 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %maximum.79, ptr %47, align 4
  br label %fusion_6.in_bounds-after
}

define void @fusion_5(ptr noalias align 128 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(512) %arg1, ptr noalias align 128 dereferenceable(4194304) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !18
  %2 = mul nuw nsw i32 %0, 128
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !19
  %4 = mul nuw nsw i32 %3, 32
  %5 = add nuw nsw i32 %2, %4
  %linear_index = add nuw nsw i32 %5, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 262144
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %row_index = mul nuw nsw i32 %1, 4
  %6 = udiv i32 %linear_index_base, 1
  %7 = urem i32 %6, 128
  %8 = udiv i32 %linear_index_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %row_index_plus1 = add nuw nsw i32 %row_index, 1
  %9 = udiv i32 %linear_index1, 1
  %10 = urem i32 %9, 128
  %11 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %row_index_plus2 = add nuw nsw i32 %row_index, 2
  %12 = udiv i32 %linear_index2, 1
  %13 = urem i32 %12, 128
  %14 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %row_index_plus3 = add nuw nsw i32 %row_index, 3
  %15 = udiv i32 %linear_index3, 1
  %16 = urem i32 %15, 128
  %17 = udiv i32 %linear_index3, 128
  %18 = icmp ult i32 %linear_index_base, 1048576
  br i1 %18, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %fusion_5.in_bounds-true, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %19 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %20 = load float, ptr %19, align 4, !invariant.load !15
  %21 = getelementptr inbounds [128 x float], ptr %arg1, i32 0, i32 %row_index
  %22 = load float, ptr %21, align 4, !invariant.load !15
  %add.4 = fadd float %20, %22
  %region_0_8_constant_5 = load float, ptr @1, align 4
  %23 = fcmp oge float %add.4, %region_0_8_constant_5
  %24 = fcmp une float %add.4, %add.4
  %25 = or i1 %23, %24
  %maximum.7 = select i1 %25, float %add.4, float %region_0_8_constant_5
  %26 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %maximum.7, ptr %26, align 4
  %27 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %28 = load float, ptr %27, align 4, !invariant.load !15
  %29 = getelementptr inbounds [128 x float], ptr %arg1, i32 0, i32 %row_index_plus1
  %30 = load float, ptr %29, align 4, !invariant.load !15
  %add.41 = fadd float %28, %30
  %region_0_8_constant_52 = load float, ptr @1, align 4
  %31 = fcmp oge float %add.41, %region_0_8_constant_52
  %32 = fcmp une float %add.41, %add.41
  %33 = or i1 %31, %32
  %maximum.73 = select i1 %33, float %add.41, float %region_0_8_constant_52
  %34 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %maximum.73, ptr %34, align 4
  %35 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %36 = load float, ptr %35, align 4, !invariant.load !15
  %37 = getelementptr inbounds [128 x float], ptr %arg1, i32 0, i32 %row_index_plus2
  %38 = load float, ptr %37, align 4, !invariant.load !15
  %add.44 = fadd float %36, %38
  %region_0_8_constant_55 = load float, ptr @1, align 4
  %39 = fcmp oge float %add.44, %region_0_8_constant_55
  %40 = fcmp une float %add.44, %add.44
  %41 = or i1 %39, %40
  %maximum.76 = select i1 %41, float %add.44, float %region_0_8_constant_55
  %42 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %maximum.76, ptr %42, align 4
  %43 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %44 = load float, ptr %43, align 4, !invariant.load !15
  %45 = getelementptr inbounds [128 x float], ptr %arg1, i32 0, i32 %row_index_plus3
  %46 = load float, ptr %45, align 4, !invariant.load !15
  %add.47 = fadd float %44, %46
  %region_0_8_constant_58 = load float, ptr @1, align 4
  %47 = fcmp oge float %add.47, %region_0_8_constant_58
  %48 = fcmp une float %add.47, %add.47
  %49 = or i1 %47, %48
  %maximum.79 = select i1 %49, float %add.47, float %region_0_8_constant_58
  %50 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %maximum.79, ptr %50, align 4
  br label %fusion_5.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

define void @fusion_3(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 16 dereferenceable(512) %arg1, ptr noalias align 128 dereferenceable(4194304) %arg2, ptr noalias align 16 dereferenceable(512) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(4194304) %arg6) {
entry:
  %initial_value_addr68 = alloca float, align 4
  %return_buffer63 = alloca float, align 4
  %result_from_other_lane61 = alloca float, align 4
  %return_buffer60 = alloca float, align 4
  %result_from_other_lane58 = alloca float, align 4
  %return_buffer57 = alloca float, align 4
  %result_from_other_lane55 = alloca float, align 4
  %return_buffer54 = alloca float, align 4
  %result_from_other_lane52 = alloca float, align 4
  %return_buffer51 = alloca float, align 4
  %result_from_other_lane49 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer47 = alloca float, align 4
  %result_from_other_lane45 = alloca float, align 4
  %return_buffer44 = alloca float, align 4
  %result_from_other_lane42 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %tile_loop.invar_address15 = alloca i32, align 4
  %return_buffer11 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result2 = alloca float, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !20
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after67, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_27_constant_7 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_27_constant_7, ptr %2, align 4
  %region_0_27_constant_73 = load float, ptr @2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_27_constant_73, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %6 = urem i32 %4, 32
  %7 = udiv i32 %4, 32
  %8 = mul i32 %5, 3
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 8192
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %9, 1
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %9, 8192
  %17 = icmp eq i32 %15, 8191
  %tile_bound = select i1 %17, i32 1, i32 1
  %18 = icmp eq i32 %13, 0
  %tile_bound4 = select i1 %18, i32 128, i32 512
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
  %21 = icmp eq i32 512, %tile_bound4
  br i1 %21, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit12, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !23

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result34 = load float, ptr %current_output, align 4
  %22 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 16, i32 31)
  store float %22, ptr %result_from_other_lane, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer35)
  %23 = load float, ptr %return_buffer35, align 4
  store float %23, ptr %current_output, align 4
  %partial_reduction_result37 = load float, ptr %current_output, align 4
  %24 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 8, i32 31)
  store float %24, ptr %result_from_other_lane36, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane36, ptr %return_buffer38)
  %25 = load float, ptr %return_buffer38, align 4
  store float %25, ptr %current_output, align 4
  %partial_reduction_result40 = load float, ptr %current_output, align 4
  %26 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 4, i32 31)
  store float %26, ptr %result_from_other_lane39, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane39, ptr %return_buffer41)
  %27 = load float, ptr %return_buffer41, align 4
  store float %27, ptr %current_output, align 4
  %partial_reduction_result43 = load float, ptr %current_output, align 4
  %28 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result43, i32 2, i32 31)
  store float %28, ptr %result_from_other_lane42, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane42, ptr %return_buffer44)
  %29 = load float, ptr %return_buffer44, align 4
  store float %29, ptr %current_output, align 4
  %partial_reduction_result46 = load float, ptr %current_output, align 4
  %30 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result46, i32 1, i32 31)
  store float %30, ptr %result_from_other_lane45, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane45, ptr %return_buffer47)
  %31 = load float, ptr %return_buffer47, align 4
  store float %31, ptr %current_output, align 4
  %32 = udiv i32 %thread_id.x, 32
  %33 = icmp eq i32 %lane_id, 0
  br i1 %33, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %34 = icmp eq i32 %32, 0
  br i1 %34, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  %current_output48 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %partial_reduction_result50 = load float, ptr %current_output48, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result50, i32 16, i32 31)
  store float %35, ptr %result_from_other_lane49, align 4
  call void @region_2_21(ptr %current_output48, ptr %result_from_other_lane49, ptr %return_buffer51)
  %36 = load float, ptr %return_buffer51, align 4
  store float %36, ptr %current_output48, align 4
  %partial_reduction_result53 = load float, ptr %current_output48, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result53, i32 8, i32 31)
  store float %37, ptr %result_from_other_lane52, align 4
  call void @region_2_21(ptr %current_output48, ptr %result_from_other_lane52, ptr %return_buffer54)
  %38 = load float, ptr %return_buffer54, align 4
  store float %38, ptr %current_output48, align 4
  %partial_reduction_result56 = load float, ptr %current_output48, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result56, i32 4, i32 31)
  store float %39, ptr %result_from_other_lane55, align 4
  call void @region_2_21(ptr %current_output48, ptr %result_from_other_lane55, ptr %return_buffer57)
  %40 = load float, ptr %return_buffer57, align 4
  store float %40, ptr %current_output48, align 4
  %partial_reduction_result59 = load float, ptr %current_output48, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result59, i32 2, i32 31)
  store float %41, ptr %result_from_other_lane58, align 4
  call void @region_2_21(ptr %current_output48, ptr %result_from_other_lane58, ptr %return_buffer60)
  %42 = load float, ptr %return_buffer60, align 4
  store float %42, ptr %current_output48, align 4
  %partial_reduction_result62 = load float, ptr %current_output48, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result62, i32 1, i32 31)
  store float %43, ptr %result_from_other_lane61, align 4
  call void @region_2_21(ptr %current_output48, ptr %result_from_other_lane61, ptr %return_buffer63)
  %44 = load float, ptr %return_buffer63, align 4
  store float %44, ptr %current_output48, align 4
  %45 = udiv i32 %thread_id.x, 32
  %46 = icmp eq i32 %lane_id, 0
  br i1 %46, label %intra_warp_reduce_write-true64, label %intra_warp_reduce_write-after65

intra_warp_reduce_write-after65:                  ; preds = %intra_warp_reduce_write-true64, %inter_warp_reduce-after
  call void @llvm.nvvm.barrier0()
  %47 = icmp eq i32 %45, 0
  br i1 %47, label %inter_warp_reduce-true66, label %inter_warp_reduce-after67

inter_warp_reduce-after67:                        ; preds = %reduction_write_output-after70, %intra_warp_reduce_write-after65
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %48 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %49 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %49, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc5 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc5, ptr %tile_loop.invar_address, align 4
  %50 = icmp eq i32 %tile_loop.indvar, 0
  %51 = mul i32 %tile_loop.indvar, 32
  %52 = add i32 %51, 0
  %x_loc = add i32 %52, %48
  %53 = add i32 %tile_origin.1, %y_in_tile.indvar
  %54 = add i32 %tile_origin.2, %x_loc
  %Arg_2.3 = getelementptr inbounds [8192 x [128 x float]], ptr %arg2, i32 0, i32 %53, i32 %54
  %Arg_2.36 = load float, ptr %Arg_2.3, align 4, !invariant.load !15
  %Arg_3.4 = getelementptr inbounds [128 x float], ptr %arg3, i32 0, i32 %54
  %Arg_3.47 = load float, ptr %Arg_3.4, align 4, !invariant.load !15
  %add.6 = fadd float %Arg_2.36, %Arg_3.47
  %region_0_27_constant_78 = load float, ptr @2, align 4
  %55 = fcmp oge float %add.6, %region_0_27_constant_78
  %56 = fcmp une float %add.6, %add.6
  %57 = or i1 %55, %56
  %maximum.9 = select i1 %57, float %add.6, float %region_0_27_constant_78
  %Arg_0.1 = getelementptr inbounds [128 x [1 x float]], ptr %arg0, i32 0, i32 %54, i32 0
  %Arg_0.19 = load float, ptr %Arg_0.1, align 4, !invariant.load !15
  %multiply.12 = fmul float %maximum.9, %Arg_0.19
  store float %multiply.12, ptr %reduction_input_address, align 4
  %58 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_13(ptr %58, ptr %reduction_input_address, ptr %return_buffer)
  %59 = load float, ptr %return_buffer, align 4
  store float %59, ptr %58, align 4
  %Arg_1.2 = getelementptr inbounds [128 x [1 x float]], ptr %arg1, i32 0, i32 %54, i32 0
  %Arg_1.210 = load float, ptr %Arg_1.2, align 4, !invariant.load !15
  %multiply.20 = fmul float %maximum.9, %Arg_1.210
  store float %multiply.20, ptr %reduction_input_address1, align 4
  %60 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_21(ptr %60, ptr %reduction_input_address1, ptr %return_buffer11)
  %61 = load float, ptr %return_buffer11, align 4
  store float %61, ptr %60, align 4
  %62 = getelementptr inbounds [8192 x [128 x float]], ptr %arg6, i32 0, i32 %53, i32 %54
  store float %maximum.9, ptr %62, align 4
  br label %tile_loop.loop_header, !llvm.loop !24

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %63 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address15, align 4
  br label %tile_loop.loop_header13

tile_loop.loop_header13:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar16 = load i32, ptr %tile_loop.invar_address15, align 4
  %64 = icmp uge i32 %tile_loop.indvar16, 16
  br i1 %64, label %tile_loop.loop_exit12, label %tile_loop.loop_body14

tile_loop.loop_body14:                            ; preds = %tile_loop.loop_header13
  %invar.inc17 = add nuw nsw i32 %tile_loop.indvar16, 1
  store i32 %invar.inc17, ptr %tile_loop.invar_address15, align 4
  %65 = icmp eq i32 %tile_loop.indvar16, 0
  %66 = mul i32 %tile_loop.indvar16, 32
  %67 = add i32 %66, 0
  %x_loc18 = add i32 %67, %63
  %68 = add i32 %tile_origin.1, %y_in_tile.indvar
  %69 = add i32 %tile_origin.2, %x_loc18
  %70 = icmp ult i32 %x_loc18, %tile_bound4
  br i1 %70, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body14
  br label %tile_loop.loop_header13, !llvm.loop !26

tile_loop.loop_exit12:                            ; preds = %tile_loop.loop_header13
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body14
  %Arg_2.319 = getelementptr inbounds [8192 x [128 x float]], ptr %arg2, i32 0, i32 %68, i32 %69
  %Arg_2.320 = load float, ptr %Arg_2.319, align 4, !invariant.load !15
  %Arg_3.421 = getelementptr inbounds [128 x float], ptr %arg3, i32 0, i32 %69
  %Arg_3.422 = load float, ptr %Arg_3.421, align 4, !invariant.load !15
  %add.623 = fadd float %Arg_2.320, %Arg_3.422
  %region_0_27_constant_724 = load float, ptr @2, align 4
  %71 = fcmp oge float %add.623, %region_0_27_constant_724
  %72 = fcmp une float %add.623, %add.623
  %73 = or i1 %71, %72
  %maximum.925 = select i1 %73, float %add.623, float %region_0_27_constant_724
  %Arg_0.126 = getelementptr inbounds [128 x [1 x float]], ptr %arg0, i32 0, i32 %69, i32 0
  %Arg_0.127 = load float, ptr %Arg_0.126, align 4, !invariant.load !15
  %multiply.1228 = fmul float %maximum.925, %Arg_0.127
  store float %multiply.1228, ptr %reduction_input_address, align 4
  %74 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_13(ptr %74, ptr %reduction_input_address, ptr %return_buffer29)
  %75 = load float, ptr %return_buffer29, align 4
  store float %75, ptr %74, align 4
  %Arg_1.230 = getelementptr inbounds [128 x [1 x float]], ptr %arg1, i32 0, i32 %69, i32 0
  %Arg_1.231 = load float, ptr %Arg_1.230, align 4, !invariant.load !15
  %multiply.2032 = fmul float %maximum.925, %Arg_1.231
  store float %multiply.2032, ptr %reduction_input_address1, align 4
  %76 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_21(ptr %76, ptr %reduction_input_address1, ptr %return_buffer33)
  %77 = load float, ptr %return_buffer33, align 4
  store float %77, ptr %76, align 4
  %78 = getelementptr inbounds [8192 x [128 x float]], ptr %arg6, i32 0, i32 %68, i32 %69
  store float %maximum.925, ptr %78, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %79 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %7, i32 0, i32 %32
  %80 = addrspacecast ptr addrspace(3) %79 to ptr
  %81 = load float, ptr %current_output, align 4
  store float %81, ptr %80, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %82 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %7, i32 0, i32 %lane_id
  %83 = addrspacecast ptr addrspace(3) %82 to ptr
  store float %region_0_27_constant_7, ptr %initial_value_addr, align 4
  %84 = icmp ult i32 %thread_id.x, 1
  %85 = select i1 %84, ptr %83, ptr %initial_value_addr
  %86 = icmp eq i32 %thread_id.x, 0
  br i1 %86, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %87 = mul i32 %thread_id.x, 1
  %88 = add i32 %tile_origin.1, %thread_id.y
  %89 = add i32 %tile_origin.2, %87
  %90 = add i32 %89, 0
  %91 = udiv i32 %88, 1
  %output_element_address = getelementptr inbounds [8192 x float], ptr %arg4, i32 0, i32 %91
  %output = load float, ptr %85, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

intra_warp_reduce_write-true64:                   ; preds = %inter_warp_reduce-after
  %92 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %7, i32 0, i32 %45
  %93 = addrspacecast ptr addrspace(3) %92 to ptr
  %94 = load float, ptr %current_output48, align 4
  store float %94, ptr %93, align 4
  br label %intra_warp_reduce_write-after65

inter_warp_reduce-true66:                         ; preds = %intra_warp_reduce_write-after65
  %95 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %7, i32 0, i32 %lane_id
  %96 = addrspacecast ptr addrspace(3) %95 to ptr
  store float %region_0_27_constant_73, ptr %initial_value_addr68, align 4
  %97 = icmp ult i32 %thread_id.x, 1
  %98 = select i1 %97, ptr %96, ptr %initial_value_addr68
  %99 = icmp eq i32 %thread_id.x, 0
  br i1 %99, label %reduction_write_output-true69, label %reduction_write_output-after70

reduction_write_output-after70:                   ; preds = %reduction_write_output-true69, %inter_warp_reduce-true66
  br label %inter_warp_reduce-after67

reduction_write_output-true69:                    ; preds = %inter_warp_reduce-true66
  %100 = mul i32 %thread_id.x, 1
  %101 = add i32 %tile_origin.1, %thread_id.y
  %102 = add i32 %tile_origin.2, %100
  %103 = add i32 %102, 0
  %104 = udiv i32 %101, 1
  %output_element_address71 = getelementptr inbounds [8192 x float], ptr %arg5, i32 0, i32 %104
  %output72 = load float, ptr %98, align 4
  store float %output72, ptr %output_element_address71, align 4
  br label %reduction_write_output-after70
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

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

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define void @fusion_7(ptr noalias align 128 dereferenceable(32768) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(4) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !27
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !28
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index, 1
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %fusion_7.in_bounds-true, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %region_0_24_constant_5 = load float, ptr @3, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !15
  %9 = getelementptr inbounds [1 x float], ptr %arg1, i32 0, i32 0
  %10 = load float, ptr %9, align 4, !invariant.load !15
  %add.9 = fadd float %8, %10
  %11 = fneg float %add.9
  %12 = call float @__nv_expf(float %11)
  %add.12 = fadd float %region_0_24_constant_5, %12
  %divide.13 = fdiv float %region_0_24_constant_5, %add.12
  %13 = insertvalue { float, float } undef, float %divide.13, 0
  %14 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %15 = load float, ptr %14, align 4, !invariant.load !15
  %16 = getelementptr inbounds [1 x float], ptr %arg3, i32 0, i32 0
  %17 = load float, ptr %16, align 4, !invariant.load !15
  %add.17 = fadd float %15, %17
  %18 = fneg float %add.17
  %19 = call float @__nv_expf(float %18)
  %add.20 = fadd float %region_0_24_constant_5, %19
  %divide.21 = fdiv float %region_0_24_constant_5, %add.20
  %20 = insertvalue { float, float } %13, float %divide.21, 1
  %21 = extractvalue { float, float } %20, 0
  %22 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %21, ptr %22, align 4
  %23 = extractvalue { float, float } %20, 1
  %24 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %23, ptr %24, align 4
  br label %fusion_7.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_expf(float) #4

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10}

!0 = !{ptr @add_8, !"kernel", i32 1}
!1 = !{ptr @add_8, !"reqntidx", i32 128}
!2 = !{ptr @fusion_6, !"kernel", i32 1}
!3 = !{ptr @fusion_6, !"reqntidx", i32 256}
!4 = !{ptr @fusion_5, !"kernel", i32 1}
!5 = !{ptr @fusion_5, !"reqntidx", i32 32}
!6 = !{ptr @fusion_5, !"reqntidy", i32 4}
!7 = !{ptr @fusion_3, !"kernel", i32 1}
!8 = !{ptr @fusion_3, !"reqntidx", i32 96}
!9 = !{ptr @fusion_7, !"kernel", i32 1}
!10 = !{ptr @fusion_7, !"reqntidx", i32 1024}
!11 = !{i32 0, i32 864}
!12 = !{i32 0, i32 128}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.vectorize.enable", i1 false}
!15 = !{}
!16 = !{i32 0, i32 2048}
!17 = !{i32 0, i32 256}
!18 = !{i32 0, i32 32}
!19 = !{i32 0, i32 4}
!20 = !{i32 0, i32 1}
!21 = !{i32 0, i32 96}
!22 = !{i32 0, i32 2731}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14, !25}
!25 = !{!"llvm.loop.unroll.full"}
!26 = distinct !{!26, !14, !25}
!27 = !{i32 0, i32 8}
!28 = !{i32 0, i32 1024}
