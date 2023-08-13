target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_11 = constant [64 x i8] zeroinitializer, align 128
@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@3 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache2 = private addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache3 = private addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache4 = private addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache5 = private addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache6 = private addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache7 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache8 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache9 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache10 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache11 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@4 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache12 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @fusion_39(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
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
  br i1 %23, label %fusion_39.in_bounds-true, label %fusion_39.in_bounds-after

fusion_39.in_bounds-after:                        ; preds = %fusion_39.in_bounds-true, %entry
  ret void

fusion_39.in_bounds-true:                         ; preds = %entry
  %24 = mul nuw nsw i32 %4, 1
  %25 = add nuw nsw i32 0, %24
  %26 = mul nuw nsw i32 %7, 64
  %27 = add nuw nsw i32 %25, %26
  %28 = udiv i32 %27, 256
  %29 = mul nuw nsw i32 %6, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  %32 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %30, i32 %27
  %33 = load float, ptr %32, align 4, !invariant.load !48
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
  %44 = load float, ptr %43, align 4, !invariant.load !48
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
  %55 = load float, ptr %54, align 4, !invariant.load !48
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
  %66 = load float, ptr %65, align 4, !invariant.load !48
  %67 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %66, ptr %67, align 4
  br label %fusion_39.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @concatenate_3(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 128 dereferenceable(33816576) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !49
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2113536
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1032
  %5 = udiv i32 %linear_index_base, 1032
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 1032
  %8 = udiv i32 %linear_index1, 1032
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 1032
  %11 = udiv i32 %linear_index2, 1032
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 1032
  %14 = udiv i32 %linear_index3, 1032
  %15 = icmp ult i32 %linear_index_base, 8454144
  br i1 %15, label %concatenate_3.in_bounds-true, label %concatenate_3.in_bounds-after

concatenate_3.in_bounds-after:                    ; preds = %concatenate.3.merge14, %entry
  ret void

concatenate_3.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.64.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 1032
  %19 = mul i32 %18, 64
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 64
  %23 = udiv i32 %20, 64
  %24 = getelementptr inbounds float, ptr %arg0, i32 %20
  %25 = load float, ptr %24, align 4, !invariant.load !48
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %26 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %27 = sub nsw i32 %4, %26
  %28 = udiv i32 %linear_index_base, 1032
  %29 = mul i32 %28, 968
  %30 = add i32 %29, %27
  %31 = udiv i32 %30, 1
  %32 = urem i32 %31, 968
  %33 = udiv i32 %30, 968
  %34 = getelementptr inbounds float, ptr %arg1, i32 %30
  %35 = load float, ptr %34, align 4, !invariant.load !48
  br label %concatenate.3.merge

concatenate.pivot.64.:                            ; preds = %concatenate_3.in_bounds-true
  %36 = icmp ult i32 %4, 64
  br i1 %36, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %37 = phi float [ %25, %concat_index_from_operand_id0 ], [ %35, %concat_index_from_operand_id1 ]
  %38 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %37, ptr %38, align 4
  br label %concatenate.pivot.64.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %39 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %40 = sub nsw i32 %7, %39
  %41 = udiv i32 %linear_index1, 1032
  %42 = mul i32 %41, 64
  %43 = add i32 %42, %40
  %44 = udiv i32 %43, 1
  %45 = urem i32 %44, 64
  %46 = udiv i32 %43, 64
  %47 = getelementptr inbounds float, ptr %arg0, i32 %43
  %48 = load float, ptr %47, align 4, !invariant.load !48
  br label %concatenate.3.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.64.7
  %49 = phi i32 [ 64, %concatenate.pivot.64.7 ]
  %50 = sub nsw i32 %7, %49
  %51 = udiv i32 %linear_index1, 1032
  %52 = mul i32 %51, 968
  %53 = add i32 %52, %50
  %54 = udiv i32 %53, 1
  %55 = urem i32 %54, 968
  %56 = udiv i32 %53, 968
  %57 = getelementptr inbounds float, ptr %arg1, i32 %53
  %58 = load float, ptr %57, align 4, !invariant.load !48
  br label %concatenate.3.merge2

concatenate.pivot.64.5:                           ; preds = %concatenate.3.merge
  %59 = icmp ult i32 %7, 64
  br i1 %59, label %concatenate.pivot.0.6, label %concatenate.pivot.64.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.64.5
  br label %concat_index_from_operand_id03

concatenate.pivot.64.7:                           ; preds = %concatenate.pivot.64.5
  br label %concat_index_from_operand_id14

concatenate.3.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %60 = phi float [ %48, %concat_index_from_operand_id03 ], [ %58, %concat_index_from_operand_id14 ]
  %61 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %60, ptr %61, align 4
  br label %concatenate.pivot.64.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %62 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %63 = sub nsw i32 %10, %62
  %64 = udiv i32 %linear_index2, 1032
  %65 = mul i32 %64, 64
  %66 = add i32 %65, %63
  %67 = udiv i32 %66, 1
  %68 = urem i32 %67, 64
  %69 = udiv i32 %66, 64
  %70 = getelementptr inbounds float, ptr %arg0, i32 %66
  %71 = load float, ptr %70, align 4, !invariant.load !48
  br label %concatenate.3.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.64.13
  %72 = phi i32 [ 64, %concatenate.pivot.64.13 ]
  %73 = sub nsw i32 %10, %72
  %74 = udiv i32 %linear_index2, 1032
  %75 = mul i32 %74, 968
  %76 = add i32 %75, %73
  %77 = udiv i32 %76, 1
  %78 = urem i32 %77, 968
  %79 = udiv i32 %76, 968
  %80 = getelementptr inbounds float, ptr %arg1, i32 %76
  %81 = load float, ptr %80, align 4, !invariant.load !48
  br label %concatenate.3.merge8

concatenate.pivot.64.11:                          ; preds = %concatenate.3.merge2
  %82 = icmp ult i32 %10, 64
  br i1 %82, label %concatenate.pivot.0.12, label %concatenate.pivot.64.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.64.11
  br label %concat_index_from_operand_id09

concatenate.pivot.64.13:                          ; preds = %concatenate.pivot.64.11
  br label %concat_index_from_operand_id110

concatenate.3.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %83 = phi float [ %71, %concat_index_from_operand_id09 ], [ %81, %concat_index_from_operand_id110 ]
  %84 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %83, ptr %84, align 4
  br label %concatenate.pivot.64.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %85 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %86 = sub nsw i32 %13, %85
  %87 = udiv i32 %linear_index3, 1032
  %88 = mul i32 %87, 64
  %89 = add i32 %88, %86
  %90 = udiv i32 %89, 1
  %91 = urem i32 %90, 64
  %92 = udiv i32 %89, 64
  %93 = getelementptr inbounds float, ptr %arg0, i32 %89
  %94 = load float, ptr %93, align 4, !invariant.load !48
  br label %concatenate.3.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.64.19
  %95 = phi i32 [ 64, %concatenate.pivot.64.19 ]
  %96 = sub nsw i32 %13, %95
  %97 = udiv i32 %linear_index3, 1032
  %98 = mul i32 %97, 968
  %99 = add i32 %98, %96
  %100 = udiv i32 %99, 1
  %101 = urem i32 %100, 968
  %102 = udiv i32 %99, 968
  %103 = getelementptr inbounds float, ptr %arg1, i32 %99
  %104 = load float, ptr %103, align 4, !invariant.load !48
  br label %concatenate.3.merge14

concatenate.pivot.64.17:                          ; preds = %concatenate.3.merge8
  %105 = icmp ult i32 %13, 64
  br i1 %105, label %concatenate.pivot.0.18, label %concatenate.pivot.64.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.64.17
  br label %concat_index_from_operand_id015

concatenate.pivot.64.19:                          ; preds = %concatenate.pivot.64.17
  br label %concat_index_from_operand_id116

concatenate.3.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %106 = phi float [ %94, %concat_index_from_operand_id015 ], [ %104, %concat_index_from_operand_id116 ]
  %107 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %106, ptr %107, align 4
  br label %concatenate_3.in_bounds-after
}

define void @fusion_38(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 16 dereferenceable(13107200) %arg1, ptr noalias align 16 dereferenceable(838860800) %arg2, ptr noalias align 128 dereferenceable(838860800) %arg3, ptr noalias align 128 dereferenceable(13107200) %arg4) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !50
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_26_constant_19 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_26_constant_19, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 3276800
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 3276800
  %15 = udiv i32 %8, 3276800
  %16 = icmp eq i32 %14, 3276799
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
  br label %y_in_tile.loop_header, !llvm.loop !53

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
  %45 = mul nuw nsw i32 %tile_origin.0, 209715200
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 100
  %51 = udiv i32 %46, 6400
  %52 = urem i32 %51, 8192
  %53 = udiv i32 %46, 52428800
  %Arg_0.1 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 %53, i32 %52, i32 %48
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !48
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %46
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !48
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
  %60 = mul nuw nsw i32 %52, 6400
  %61 = add nuw nsw i32 %59, %60
  %62 = mul nuw nsw i32 %53, 52428800
  %63 = add nuw nsw i32 %61, %62
  %64 = urem i32 %63, 256
  %65 = udiv i32 %63, 256
  %66 = udiv i32 %65, 819200
  %67 = mul nuw nsw i32 %64, 1
  %68 = add nuw nsw i32 0, %67
  %69 = udiv i32 %68, 256
  %70 = mul nuw nsw i32 %65, 1
  %71 = add nuw nsw i32 0, %70
  %72 = urem i32 %71, 100
  %73 = udiv i32 %71, 100
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
  %83 = urem i32 %82, 100
  %84 = udiv i32 %79, 6400
  %85 = add i32 %73, 0
  %86 = add i32 %72, 0
  %87 = add i32 %76, 0
  %Arg_1.2 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg1, i32 0, i32 0, i32 %85, i32 0, i32 %86
  %Arg_1.25 = load float, ptr %Arg_1.2, align 4, !invariant.load !48
  %Arg_0.16 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 0, i32 %85, i32 %87
  %Arg_0.17 = load float, ptr %Arg_0.16, align 4, !invariant.load !48
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
  %96 = urem i32 %95, 100
  %97 = udiv i32 %92, 6400
  %98 = add i32 %73, 0
  %99 = add i32 %72, 0
  %100 = add i32 %89, 0
  %Arg_1.28 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg1, i32 0, i32 1, i32 %98, i32 0, i32 %99
  %Arg_1.29 = load float, ptr %Arg_1.28, align 4, !invariant.load !48
  %Arg_0.110 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 1, i32 %98, i32 %100
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !48
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
  %109 = urem i32 %108, 100
  %110 = udiv i32 %105, 6400
  %111 = add i32 %73, 0
  %112 = add i32 %72, 0
  %113 = add i32 %102, 0
  %Arg_1.213 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg1, i32 0, i32 2, i32 %111, i32 0, i32 %112
  %Arg_1.214 = load float, ptr %Arg_1.213, align 4, !invariant.load !48
  %Arg_0.115 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 2, i32 %111, i32 %113
  %Arg_0.116 = load float, ptr %Arg_0.115, align 4, !invariant.load !48
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
  %122 = urem i32 %121, 100
  %123 = udiv i32 %118, 6400
  %124 = add i32 %73, 0
  %125 = add i32 %72, 0
  %126 = add i32 %115, 0
  %Arg_1.218 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg1, i32 0, i32 3, i32 %124, i32 0, i32 %125
  %Arg_1.219 = load float, ptr %Arg_1.218, align 4, !invariant.load !48
  %Arg_0.120 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 3, i32 %124, i32 %126
  %Arg_0.121 = load float, ptr %Arg_0.120, align 4, !invariant.load !48
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
  %135 = mul nuw nsw i32 %52, 6400
  %136 = add nuw nsw i32 %134, %135
  %137 = mul nuw nsw i32 %53, 52428800
  %138 = add nuw nsw i32 %136, %137
  %139 = urem i32 %138, 256
  %140 = udiv i32 %138, 256
  %141 = udiv i32 %140, 819200
  %142 = getelementptr inbounds float, ptr %arg3, i32 %46
  store float %130, ptr %142, align 4
  br label %tile_loop.loop_header, !llvm.loop !55

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
  br label %tile_loop.loop_header27, !llvm.loop !57

tile_loop.loop_exit26:                            ; preds = %tile_loop.loop_header27
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body28
  %151 = mul nuw nsw i32 %149, 1
  %152 = add nuw nsw i32 0, %151
  %153 = mul nuw nsw i32 %148, 64
  %154 = add nuw nsw i32 %152, %153
  %155 = mul nuw nsw i32 %tile_origin.0, 209715200
  %156 = add nuw nsw i32 %154, %155
  %157 = udiv i32 %156, 1
  %158 = urem i32 %157, 64
  %159 = udiv i32 %156, 64
  %160 = urem i32 %159, 100
  %161 = udiv i32 %156, 6400
  %162 = urem i32 %161, 8192
  %163 = udiv i32 %156, 52428800
  %Arg_0.133 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 %163, i32 %162, i32 %158
  %Arg_0.134 = load float, ptr %Arg_0.133, align 4, !invariant.load !48
  %Arg_2.335 = getelementptr inbounds float, ptr %arg2, i32 %156
  %Arg_2.336 = load float, ptr %Arg_2.335, align 4, !invariant.load !48
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
  %170 = mul nuw nsw i32 %162, 6400
  %171 = add nuw nsw i32 %169, %170
  %172 = mul nuw nsw i32 %163, 52428800
  %173 = add nuw nsw i32 %171, %172
  %174 = urem i32 %173, 256
  %175 = udiv i32 %173, 256
  %176 = udiv i32 %175, 819200
  %177 = mul nuw nsw i32 %174, 1
  %178 = add nuw nsw i32 0, %177
  %179 = udiv i32 %178, 256
  %180 = mul nuw nsw i32 %175, 1
  %181 = add nuw nsw i32 0, %180
  %182 = urem i32 %181, 100
  %183 = udiv i32 %181, 100
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
  %193 = urem i32 %192, 100
  %194 = udiv i32 %189, 6400
  %195 = add i32 %183, 0
  %196 = add i32 %182, 0
  %197 = add i32 %186, 0
  %Arg_1.241 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg1, i32 0, i32 0, i32 %195, i32 0, i32 %196
  %Arg_1.242 = load float, ptr %Arg_1.241, align 4, !invariant.load !48
  %Arg_0.143 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 0, i32 %195, i32 %197
  %Arg_0.144 = load float, ptr %Arg_0.143, align 4, !invariant.load !48
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
  %206 = urem i32 %205, 100
  %207 = udiv i32 %202, 6400
  %208 = add i32 %183, 0
  %209 = add i32 %182, 0
  %210 = add i32 %199, 0
  %Arg_1.247 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg1, i32 0, i32 1, i32 %208, i32 0, i32 %209
  %Arg_1.248 = load float, ptr %Arg_1.247, align 4, !invariant.load !48
  %Arg_0.149 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 1, i32 %208, i32 %210
  %Arg_0.150 = load float, ptr %Arg_0.149, align 4, !invariant.load !48
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
  %219 = urem i32 %218, 100
  %220 = udiv i32 %215, 6400
  %221 = add i32 %183, 0
  %222 = add i32 %182, 0
  %223 = add i32 %212, 0
  %Arg_1.253 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg1, i32 0, i32 2, i32 %221, i32 0, i32 %222
  %Arg_1.254 = load float, ptr %Arg_1.253, align 4, !invariant.load !48
  %Arg_0.155 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 2, i32 %221, i32 %223
  %Arg_0.156 = load float, ptr %Arg_0.155, align 4, !invariant.load !48
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
  %232 = urem i32 %231, 100
  %233 = udiv i32 %228, 6400
  %234 = add i32 %183, 0
  %235 = add i32 %182, 0
  %236 = add i32 %225, 0
  %Arg_1.259 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg1, i32 0, i32 3, i32 %234, i32 0, i32 %235
  %Arg_1.260 = load float, ptr %Arg_1.259, align 4, !invariant.load !48
  %Arg_0.161 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr %arg0, i32 0, i32 3, i32 %234, i32 %236
  %Arg_0.162 = load float, ptr %Arg_0.161, align 4, !invariant.load !48
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
  %245 = mul nuw nsw i32 %162, 6400
  %246 = add nuw nsw i32 %244, %245
  %247 = mul nuw nsw i32 %163, 52428800
  %248 = add nuw nsw i32 %246, %247
  %249 = urem i32 %248, 256
  %250 = udiv i32 %248, 256
  %251 = udiv i32 %250, 819200
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
  %266 = urem i32 %265, 100
  %267 = udiv i32 %262, 100
  %268 = urem i32 %267, 8192
  %269 = udiv i32 %262, 819200
  %output_element_address = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg4, i32 0, i32 %269, i32 %268, i32 %266
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

define void @fusion_36(ptr noalias align 16 dereferenceable(8192) %arg0, ptr noalias align 128 dereferenceable(8192) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(8192) %arg3, ptr noalias align 128 dereferenceable(8192) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !58
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !59
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2048
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 2048
  br i1 %6, label %fusion_36.in_bounds-true, label %fusion_36.in_bounds-after

fusion_36.in_bounds-after:                        ; preds = %fusion_36.in_bounds-true, %entry
  ret void

fusion_36.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !48
  %9 = load float, ptr %arg2, align 4, !invariant.load !48
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !48
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
  br label %fusion_36.in_bounds-after
}

define void @fusion_32(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !50
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
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
  %tile_bound1 = select i1 %17, i32 100, i32 512
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
  br label %y_in_tile.loop_header, !llvm.loop !61

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
  %43 = mul nuw nsw i32 %39, 100
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 3276800
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 100
  %49 = udiv i32 %46, 100
  %50 = urem i32 %49, 8192
  %51 = udiv i32 %46, 819200
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !48
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !48
  %multiply.4 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.4, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !62

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
  br label %tile_loop.loop_header6, !llvm.loop !63

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %62 = mul nuw nsw i32 %60, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %59, 100
  %65 = add nuw nsw i32 %63, %64
  %66 = mul nuw nsw i32 %tile_origin.0, 3276800
  %67 = add nuw nsw i32 %65, %66
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 100
  %70 = udiv i32 %67, 100
  %71 = urem i32 %70, 8192
  %72 = udiv i32 %67, 819200
  %Arg_1.212 = getelementptr inbounds float, ptr %arg1, i32 %67
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !48
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !48
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

define void @fusion_31(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(13107200) %arg2, ptr noalias align 128 dereferenceable(13107200) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 100
  %5 = udiv i32 %linear_index_base, 100
  %6 = urem i32 %5, 1
  %7 = udiv i32 %linear_index_base, 100
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 819200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 100
  %13 = urem i32 %12, 1
  %14 = udiv i32 %linear_index1, 100
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 819200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 100
  %19 = udiv i32 %linear_index2, 100
  %20 = urem i32 %19, 1
  %21 = udiv i32 %linear_index2, 100
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 819200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 100
  %26 = udiv i32 %linear_index3, 100
  %27 = urem i32 %26, 1
  %28 = udiv i32 %linear_index3, 100
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 819200
  %31 = icmp ult i32 %linear_index_base, 3276800
  br i1 %31, label %fusion_31.in_bounds-true, label %fusion_31.in_bounds-after

fusion_31.in_bounds-after:                        ; preds = %fusion_31.in_bounds-true, %entry
  ret void

fusion_31.in_bounds-true:                         ; preds = %entry
  %32 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %33 = load float, ptr %32, align 4, !invariant.load !48
  %34 = udiv i32 %linear_index_base, 100
  %35 = getelementptr inbounds float, ptr %arg1, i32 %34
  %36 = load float, ptr %35, align 4, !invariant.load !48
  %subtract.6 = fsub float %33, %36
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %38 = load float, ptr %37, align 4, !invariant.load !48
  %multiply.7 = fmul float %subtract.6, %38
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %multiply.7, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %41 = load float, ptr %40, align 4, !invariant.load !48
  %42 = udiv i32 %linear_index1, 100
  %43 = getelementptr inbounds float, ptr %arg1, i32 %42
  %44 = load float, ptr %43, align 4, !invariant.load !48
  %subtract.61 = fsub float %41, %44
  %45 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %46 = load float, ptr %45, align 4, !invariant.load !48
  %multiply.72 = fmul float %subtract.61, %46
  %47 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %multiply.72, ptr %47, align 4
  %48 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %49 = load float, ptr %48, align 4, !invariant.load !48
  %50 = udiv i32 %linear_index2, 100
  %51 = getelementptr inbounds float, ptr %arg1, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !48
  %subtract.63 = fsub float %49, %52
  %53 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %54 = load float, ptr %53, align 4, !invariant.load !48
  %multiply.74 = fmul float %subtract.63, %54
  %55 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %multiply.74, ptr %55, align 4
  %56 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %57 = load float, ptr %56, align 4, !invariant.load !48
  %58 = udiv i32 %linear_index3, 100
  %59 = getelementptr inbounds float, ptr %arg1, i32 %58
  %60 = load float, ptr %59, align 4, !invariant.load !48
  %subtract.65 = fsub float %57, %60
  %61 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %62 = load float, ptr %61, align 4, !invariant.load !48
  %multiply.76 = fmul float %subtract.65, %62
  %63 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %multiply.76, ptr %63, align 4
  br label %fusion_31.in_bounds-after
}

define void @fusion_37(ptr noalias align 16 dereferenceable(155648) %arg0, ptr noalias align 128 dereferenceable(155648) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !65
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !59
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 38912
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 38912
  br i1 %6, label %fusion_37.in_bounds-true, label %fusion_37.in_bounds-after

fusion_37.in_bounds-after:                        ; preds = %fusion_37.in_bounds-true, %entry
  ret void

fusion_37.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !48
  %9 = load float, ptr %arg2, align 4, !invariant.load !48
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_37.in_bounds-after
}

define void @fusion_26(ptr noalias align 16 dereferenceable(3276800) %arg0, ptr noalias align 16 dereferenceable(16) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(13107200) %arg3, ptr noalias align 16 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(16) %arg5, ptr noalias align 16 dereferenceable(3276800) %arg6, ptr noalias align 16 dereferenceable(16) %arg7, ptr noalias align 16 dereferenceable(3276800) %arg8, ptr noalias align 16 dereferenceable(16) %arg9, ptr noalias align 128 dereferenceable(3276800) %arg10, ptr noalias align 128 dereferenceable(3276800) %arg11, ptr noalias align 128 dereferenceable(3276800) %arg12, ptr noalias align 128 dereferenceable(3276800) %arg13) {
entry:
  %return_buffer185 = alloca float, align 4
  %parameter_buffer184 = alloca float, align 4
  %parameter_buffer183 = alloca float, align 4
  %reduce.54.inner.invar_address.reduction_dim.0179 = alloca i32, align 4
  %accumulator_0174 = alloca float, align 4
  %return_buffer171 = alloca float, align 4
  %parameter_buffer170 = alloca float, align 4
  %parameter_buffer169 = alloca float, align 4
  %reduce.43.inner.invar_address.reduction_dim.0165 = alloca i32, align 4
  %accumulator_0160 = alloca float, align 4
  %return_buffer157 = alloca float, align 4
  %parameter_buffer156 = alloca float, align 4
  %parameter_buffer155 = alloca float, align 4
  %reduce.32.inner.invar_address.reduction_dim.0151 = alloca i32, align 4
  %accumulator_0146 = alloca float, align 4
  %return_buffer143 = alloca float, align 4
  %parameter_buffer142 = alloca float, align 4
  %parameter_buffer141 = alloca float, align 4
  %reduce.21.inner.invar_address.reduction_dim.0137 = alloca i32, align 4
  %accumulator_0132 = alloca float, align 4
  %return_buffer129 = alloca float, align 4
  %parameter_buffer128 = alloca float, align 4
  %parameter_buffer127 = alloca float, align 4
  %reduce.54.inner.invar_address.reduction_dim.0123 = alloca i32, align 4
  %accumulator_0118 = alloca float, align 4
  %return_buffer115 = alloca float, align 4
  %parameter_buffer114 = alloca float, align 4
  %parameter_buffer113 = alloca float, align 4
  %reduce.43.inner.invar_address.reduction_dim.0109 = alloca i32, align 4
  %accumulator_0104 = alloca float, align 4
  %return_buffer101 = alloca float, align 4
  %parameter_buffer100 = alloca float, align 4
  %parameter_buffer99 = alloca float, align 4
  %reduce.32.inner.invar_address.reduction_dim.095 = alloca i32, align 4
  %accumulator_090 = alloca float, align 4
  %return_buffer87 = alloca float, align 4
  %parameter_buffer86 = alloca float, align 4
  %parameter_buffer85 = alloca float, align 4
  %reduce.21.inner.invar_address.reduction_dim.081 = alloca i32, align 4
  %accumulator_076 = alloca float, align 4
  %return_buffer73 = alloca float, align 4
  %parameter_buffer72 = alloca float, align 4
  %parameter_buffer71 = alloca float, align 4
  %reduce.54.inner.invar_address.reduction_dim.067 = alloca i32, align 4
  %accumulator_062 = alloca float, align 4
  %return_buffer59 = alloca float, align 4
  %parameter_buffer58 = alloca float, align 4
  %parameter_buffer57 = alloca float, align 4
  %reduce.43.inner.invar_address.reduction_dim.053 = alloca i32, align 4
  %accumulator_048 = alloca float, align 4
  %return_buffer45 = alloca float, align 4
  %parameter_buffer44 = alloca float, align 4
  %parameter_buffer43 = alloca float, align 4
  %reduce.32.inner.invar_address.reduction_dim.039 = alloca i32, align 4
  %accumulator_034 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %parameter_buffer30 = alloca float, align 4
  %parameter_buffer29 = alloca float, align 4
  %reduce.21.inner.invar_address.reduction_dim.025 = alloca i32, align 4
  %accumulator_020 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %parameter_buffer18 = alloca float, align 4
  %parameter_buffer17 = alloca float, align 4
  %reduce.54.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_014 = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %parameter_buffer12 = alloca float, align 4
  %parameter_buffer11 = alloca float, align 4
  %reduce.43.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_08 = alloca float, align 4
  %return_buffer7 = alloca float, align 4
  %parameter_buffer6 = alloca float, align 4
  %parameter_buffer5 = alloca float, align 4
  %reduce.32.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.21.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !66
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 204800
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index_base, 1
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 100
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 100
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 1
  %15 = udiv i32 %linear_index2, 1
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 100
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 1
  %20 = udiv i32 %linear_index3, 1
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 100
  %23 = icmp ult i32 %linear_index_base, 819200
  br i1 %23, label %fusion_26.in_bounds-true, label %fusion_26.in_bounds-after

fusion_26.in_bounds-after:                        ; preds = %reduce.54.inner.loop_exit.reduction_dim.0176, %entry
  ret void

fusion_26.in_bounds-true:                         ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !48
  %26 = mul nuw nsw i32 %4, 1
  %27 = add nuw nsw i32 0, %26
  %28 = mul nuw nsw i32 %6, 1
  %29 = add nuw nsw i32 0, %28
  %30 = mul nuw nsw i32 %7, 100
  %31 = add nuw nsw i32 %29, %30
  %32 = udiv i32 %31, 819200
  %33 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_16 = load float, ptr @2, align 4
  store float %region_0_59_constant_16, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.21.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.21.inner.loop_header.reduction_dim.0

reduce.21.inner.loop_header.reduction_dim.0:      ; preds = %reduce.21.inner.loop_body.reduction_dim.0, %fusion_26.in_bounds-true
  %reduce.21.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.21.inner.invar_address.reduction_dim.0, align 4
  %34 = icmp uge i32 %reduce.21.inner.indvar.reduction_dim.0, 4
  br i1 %34, label %reduce.21.inner.loop_exit.reduction_dim.0, label %reduce.21.inner.loop_body.reduction_dim.0

reduce.21.inner.loop_body.reduction_dim.0:        ; preds = %reduce.21.inner.loop_header.reduction_dim.0
  %35 = load float, ptr %accumulator_0, align 4
  %36 = mul nuw nsw i32 %31, 1
  %37 = add nuw nsw i32 0, %36
  %38 = urem i32 %37, 100
  %39 = udiv i32 %37, 100
  %40 = udiv i32 %39, 1
  %41 = udiv i32 %40, 8192
  %42 = mul nuw nsw i32 %reduce.21.inner.indvar.reduction_dim.0, 1
  %43 = add nuw nsw i32 0, %42
  %44 = udiv i32 %43, 4
  %45 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %43, i32 %40, i32 0, i32 %38
  %46 = load float, ptr %45, align 4, !invariant.load !48
  %47 = getelementptr inbounds [1 x [4 x float]], ptr %arg1, i32 0, i32 0, i32 %reduce.21.inner.indvar.reduction_dim.0
  %48 = load float, ptr %47, align 4, !invariant.load !48
  %multiply.15 = fmul float %46, %48
  store float %35, ptr %parameter_buffer, align 4
  store float %multiply.15, ptr %parameter_buffer1, align 4
  call void @region_1_17(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %49 = load float, ptr %return_buffer, align 4
  store float %49, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.21.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.21.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.21.inner.loop_header.reduction_dim.0

reduce.21.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.21.inner.loop_header.reduction_dim.0
  %50 = load float, ptr %accumulator_0, align 4
  %multiply.22 = fmul float %33, %50
  %subtract.24 = fsub float %25, %multiply.22
  %51 = insertvalue { float, float, float, float } undef, float %subtract.24, 0
  %52 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %53 = load float, ptr %52, align 4, !invariant.load !48
  %54 = mul nuw nsw i32 %4, 1
  %55 = add nuw nsw i32 0, %54
  %56 = mul nuw nsw i32 %6, 1
  %57 = add nuw nsw i32 0, %56
  %58 = mul nuw nsw i32 %7, 100
  %59 = add nuw nsw i32 %57, %58
  %60 = udiv i32 %59, 819200
  %61 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_163 = load float, ptr @2, align 4
  store float %region_0_59_constant_163, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.32.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.0

reduce.32.inner.loop_header.reduction_dim.0:      ; preds = %reduce.32.inner.loop_body.reduction_dim.0, %reduce.21.inner.loop_exit.reduction_dim.0
  %reduce.32.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.32.inner.invar_address.reduction_dim.0, align 4
  %62 = icmp uge i32 %reduce.32.inner.indvar.reduction_dim.0, 4
  br i1 %62, label %reduce.32.inner.loop_exit.reduction_dim.0, label %reduce.32.inner.loop_body.reduction_dim.0

reduce.32.inner.loop_body.reduction_dim.0:        ; preds = %reduce.32.inner.loop_header.reduction_dim.0
  %63 = load float, ptr %accumulator_02, align 4
  %64 = mul nuw nsw i32 %59, 1
  %65 = add nuw nsw i32 0, %64
  %66 = urem i32 %65, 100
  %67 = udiv i32 %65, 100
  %68 = udiv i32 %67, 1
  %69 = udiv i32 %68, 8192
  %70 = mul nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.0, 1
  %71 = add nuw nsw i32 0, %70
  %72 = udiv i32 %71, 4
  %73 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %71, i32 %68, i32 0, i32 %66
  %74 = load float, ptr %73, align 4, !invariant.load !48
  %75 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %reduce.32.inner.indvar.reduction_dim.0
  %76 = load float, ptr %75, align 4, !invariant.load !48
  %multiply.27 = fmul float %74, %76
  store float %63, ptr %parameter_buffer5, align 4
  store float %multiply.27, ptr %parameter_buffer6, align 4
  call void @region_2_28(ptr %parameter_buffer5, ptr %parameter_buffer6, ptr %return_buffer7)
  %77 = load float, ptr %return_buffer7, align 4
  store float %77, ptr %accumulator_02, align 4
  %invar.inc4 = add nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.32.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.0

reduce.32.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.32.inner.loop_header.reduction_dim.0
  %78 = load float, ptr %accumulator_02, align 4
  %multiply.33 = fmul float %61, %78
  %subtract.35 = fsub float %53, %multiply.33
  %79 = insertvalue { float, float, float, float } %51, float %subtract.35, 1
  %80 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %81 = load float, ptr %80, align 4, !invariant.load !48
  %82 = mul nuw nsw i32 %4, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %6, 1
  %85 = add nuw nsw i32 0, %84
  %86 = mul nuw nsw i32 %7, 100
  %87 = add nuw nsw i32 %85, %86
  %88 = udiv i32 %87, 819200
  %89 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_169 = load float, ptr @2, align 4
  store float %region_0_59_constant_169, ptr %accumulator_08, align 4
  store i32 0, ptr %reduce.43.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.43.inner.loop_header.reduction_dim.0

reduce.43.inner.loop_header.reduction_dim.0:      ; preds = %reduce.43.inner.loop_body.reduction_dim.0, %reduce.32.inner.loop_exit.reduction_dim.0
  %reduce.43.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.43.inner.invar_address.reduction_dim.0, align 4
  %90 = icmp uge i32 %reduce.43.inner.indvar.reduction_dim.0, 4
  br i1 %90, label %reduce.43.inner.loop_exit.reduction_dim.0, label %reduce.43.inner.loop_body.reduction_dim.0

reduce.43.inner.loop_body.reduction_dim.0:        ; preds = %reduce.43.inner.loop_header.reduction_dim.0
  %91 = load float, ptr %accumulator_08, align 4
  %92 = mul nuw nsw i32 %87, 1
  %93 = add nuw nsw i32 0, %92
  %94 = urem i32 %93, 100
  %95 = udiv i32 %93, 100
  %96 = udiv i32 %95, 1
  %97 = udiv i32 %96, 8192
  %98 = mul nuw nsw i32 %reduce.43.inner.indvar.reduction_dim.0, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 4
  %101 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %99, i32 %96, i32 0, i32 %94
  %102 = load float, ptr %101, align 4, !invariant.load !48
  %103 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %reduce.43.inner.indvar.reduction_dim.0
  %104 = load float, ptr %103, align 4, !invariant.load !48
  %multiply.38 = fmul float %102, %104
  store float %91, ptr %parameter_buffer11, align 4
  store float %multiply.38, ptr %parameter_buffer12, align 4
  call void @region_3_39(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %105 = load float, ptr %return_buffer13, align 4
  store float %105, ptr %accumulator_08, align 4
  %invar.inc10 = add nuw nsw i32 %reduce.43.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc10, ptr %reduce.43.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.43.inner.loop_header.reduction_dim.0

reduce.43.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.43.inner.loop_header.reduction_dim.0
  %106 = load float, ptr %accumulator_08, align 4
  %multiply.44 = fmul float %89, %106
  %subtract.46 = fsub float %81, %multiply.44
  %107 = insertvalue { float, float, float, float } %79, float %subtract.46, 2
  %108 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  %109 = load float, ptr %108, align 4, !invariant.load !48
  %110 = mul nuw nsw i32 %4, 1
  %111 = add nuw nsw i32 0, %110
  %112 = mul nuw nsw i32 %6, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %7, 100
  %115 = add nuw nsw i32 %113, %114
  %116 = udiv i32 %115, 819200
  %117 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_1615 = load float, ptr @2, align 4
  store float %region_0_59_constant_1615, ptr %accumulator_014, align 4
  store i32 0, ptr %reduce.54.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.54.inner.loop_header.reduction_dim.0

reduce.54.inner.loop_header.reduction_dim.0:      ; preds = %reduce.54.inner.loop_body.reduction_dim.0, %reduce.43.inner.loop_exit.reduction_dim.0
  %reduce.54.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.54.inner.invar_address.reduction_dim.0, align 4
  %118 = icmp uge i32 %reduce.54.inner.indvar.reduction_dim.0, 4
  br i1 %118, label %reduce.54.inner.loop_exit.reduction_dim.0, label %reduce.54.inner.loop_body.reduction_dim.0

reduce.54.inner.loop_body.reduction_dim.0:        ; preds = %reduce.54.inner.loop_header.reduction_dim.0
  %119 = load float, ptr %accumulator_014, align 4
  %120 = mul nuw nsw i32 %115, 1
  %121 = add nuw nsw i32 0, %120
  %122 = urem i32 %121, 100
  %123 = udiv i32 %121, 100
  %124 = udiv i32 %123, 1
  %125 = udiv i32 %124, 8192
  %126 = mul nuw nsw i32 %reduce.54.inner.indvar.reduction_dim.0, 1
  %127 = add nuw nsw i32 0, %126
  %128 = udiv i32 %127, 4
  %129 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %127, i32 %124, i32 0, i32 %122
  %130 = load float, ptr %129, align 4, !invariant.load !48
  %131 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %reduce.54.inner.indvar.reduction_dim.0
  %132 = load float, ptr %131, align 4, !invariant.load !48
  %multiply.49 = fmul float %130, %132
  store float %119, ptr %parameter_buffer17, align 4
  store float %multiply.49, ptr %parameter_buffer18, align 4
  call void @region_4_50(ptr %parameter_buffer17, ptr %parameter_buffer18, ptr %return_buffer19)
  %133 = load float, ptr %return_buffer19, align 4
  store float %133, ptr %accumulator_014, align 4
  %invar.inc16 = add nuw nsw i32 %reduce.54.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc16, ptr %reduce.54.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.54.inner.loop_header.reduction_dim.0

reduce.54.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.54.inner.loop_header.reduction_dim.0
  %134 = load float, ptr %accumulator_014, align 4
  %multiply.55 = fmul float %117, %134
  %subtract.57 = fsub float %109, %multiply.55
  %135 = insertvalue { float, float, float, float } %107, float %subtract.57, 3
  %136 = extractvalue { float, float, float, float } %135, 0
  %137 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  store float %136, ptr %137, align 4
  %138 = extractvalue { float, float, float, float } %135, 1
  %139 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  store float %138, ptr %139, align 4
  %140 = extractvalue { float, float, float, float } %135, 2
  %141 = getelementptr inbounds float, ptr %arg12, i32 %linear_index_base
  store float %140, ptr %141, align 4
  %142 = extractvalue { float, float, float, float } %135, 3
  %143 = getelementptr inbounds float, ptr %arg13, i32 %linear_index_base
  store float %142, ptr %143, align 4
  %144 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %145 = load float, ptr %144, align 4, !invariant.load !48
  %146 = mul nuw nsw i32 %9, 1
  %147 = add nuw nsw i32 0, %146
  %148 = mul nuw nsw i32 %11, 1
  %149 = add nuw nsw i32 0, %148
  %150 = mul nuw nsw i32 %12, 100
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 819200
  %153 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_1621 = load float, ptr @2, align 4
  store float %region_0_59_constant_1621, ptr %accumulator_020, align 4
  store i32 0, ptr %reduce.21.inner.invar_address.reduction_dim.025, align 4
  br label %reduce.21.inner.loop_header.reduction_dim.023

reduce.21.inner.loop_header.reduction_dim.023:    ; preds = %reduce.21.inner.loop_body.reduction_dim.024, %reduce.54.inner.loop_exit.reduction_dim.0
  %reduce.21.inner.indvar.reduction_dim.026 = load i32, ptr %reduce.21.inner.invar_address.reduction_dim.025, align 4
  %154 = icmp uge i32 %reduce.21.inner.indvar.reduction_dim.026, 4
  br i1 %154, label %reduce.21.inner.loop_exit.reduction_dim.022, label %reduce.21.inner.loop_body.reduction_dim.024

reduce.21.inner.loop_body.reduction_dim.024:      ; preds = %reduce.21.inner.loop_header.reduction_dim.023
  %155 = load float, ptr %accumulator_020, align 4
  %156 = mul nuw nsw i32 %151, 1
  %157 = add nuw nsw i32 0, %156
  %158 = urem i32 %157, 100
  %159 = udiv i32 %157, 100
  %160 = udiv i32 %159, 1
  %161 = udiv i32 %160, 8192
  %162 = mul nuw nsw i32 %reduce.21.inner.indvar.reduction_dim.026, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 4
  %165 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %163, i32 %160, i32 0, i32 %158
  %166 = load float, ptr %165, align 4, !invariant.load !48
  %167 = getelementptr inbounds [1 x [4 x float]], ptr %arg1, i32 0, i32 0, i32 %reduce.21.inner.indvar.reduction_dim.026
  %168 = load float, ptr %167, align 4, !invariant.load !48
  %multiply.1528 = fmul float %166, %168
  store float %155, ptr %parameter_buffer29, align 4
  store float %multiply.1528, ptr %parameter_buffer30, align 4
  call void @region_1_17(ptr %parameter_buffer29, ptr %parameter_buffer30, ptr %return_buffer31)
  %169 = load float, ptr %return_buffer31, align 4
  store float %169, ptr %accumulator_020, align 4
  %invar.inc27 = add nuw nsw i32 %reduce.21.inner.indvar.reduction_dim.026, 1
  store i32 %invar.inc27, ptr %reduce.21.inner.invar_address.reduction_dim.025, align 4
  br label %reduce.21.inner.loop_header.reduction_dim.023

reduce.21.inner.loop_exit.reduction_dim.022:      ; preds = %reduce.21.inner.loop_header.reduction_dim.023
  %170 = load float, ptr %accumulator_020, align 4
  %multiply.2232 = fmul float %153, %170
  %subtract.2433 = fsub float %145, %multiply.2232
  %171 = insertvalue { float, float, float, float } undef, float %subtract.2433, 0
  %172 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %173 = load float, ptr %172, align 4, !invariant.load !48
  %174 = mul nuw nsw i32 %9, 1
  %175 = add nuw nsw i32 0, %174
  %176 = mul nuw nsw i32 %11, 1
  %177 = add nuw nsw i32 0, %176
  %178 = mul nuw nsw i32 %12, 100
  %179 = add nuw nsw i32 %177, %178
  %180 = udiv i32 %179, 819200
  %181 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_1635 = load float, ptr @2, align 4
  store float %region_0_59_constant_1635, ptr %accumulator_034, align 4
  store i32 0, ptr %reduce.32.inner.invar_address.reduction_dim.039, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.037

reduce.32.inner.loop_header.reduction_dim.037:    ; preds = %reduce.32.inner.loop_body.reduction_dim.038, %reduce.21.inner.loop_exit.reduction_dim.022
  %reduce.32.inner.indvar.reduction_dim.040 = load i32, ptr %reduce.32.inner.invar_address.reduction_dim.039, align 4
  %182 = icmp uge i32 %reduce.32.inner.indvar.reduction_dim.040, 4
  br i1 %182, label %reduce.32.inner.loop_exit.reduction_dim.036, label %reduce.32.inner.loop_body.reduction_dim.038

reduce.32.inner.loop_body.reduction_dim.038:      ; preds = %reduce.32.inner.loop_header.reduction_dim.037
  %183 = load float, ptr %accumulator_034, align 4
  %184 = mul nuw nsw i32 %179, 1
  %185 = add nuw nsw i32 0, %184
  %186 = urem i32 %185, 100
  %187 = udiv i32 %185, 100
  %188 = udiv i32 %187, 1
  %189 = udiv i32 %188, 8192
  %190 = mul nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.040, 1
  %191 = add nuw nsw i32 0, %190
  %192 = udiv i32 %191, 4
  %193 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %191, i32 %188, i32 0, i32 %186
  %194 = load float, ptr %193, align 4, !invariant.load !48
  %195 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %reduce.32.inner.indvar.reduction_dim.040
  %196 = load float, ptr %195, align 4, !invariant.load !48
  %multiply.2742 = fmul float %194, %196
  store float %183, ptr %parameter_buffer43, align 4
  store float %multiply.2742, ptr %parameter_buffer44, align 4
  call void @region_2_28(ptr %parameter_buffer43, ptr %parameter_buffer44, ptr %return_buffer45)
  %197 = load float, ptr %return_buffer45, align 4
  store float %197, ptr %accumulator_034, align 4
  %invar.inc41 = add nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.040, 1
  store i32 %invar.inc41, ptr %reduce.32.inner.invar_address.reduction_dim.039, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.037

reduce.32.inner.loop_exit.reduction_dim.036:      ; preds = %reduce.32.inner.loop_header.reduction_dim.037
  %198 = load float, ptr %accumulator_034, align 4
  %multiply.3346 = fmul float %181, %198
  %subtract.3547 = fsub float %173, %multiply.3346
  %199 = insertvalue { float, float, float, float } %171, float %subtract.3547, 1
  %200 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %201 = load float, ptr %200, align 4, !invariant.load !48
  %202 = mul nuw nsw i32 %9, 1
  %203 = add nuw nsw i32 0, %202
  %204 = mul nuw nsw i32 %11, 1
  %205 = add nuw nsw i32 0, %204
  %206 = mul nuw nsw i32 %12, 100
  %207 = add nuw nsw i32 %205, %206
  %208 = udiv i32 %207, 819200
  %209 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_1649 = load float, ptr @2, align 4
  store float %region_0_59_constant_1649, ptr %accumulator_048, align 4
  store i32 0, ptr %reduce.43.inner.invar_address.reduction_dim.053, align 4
  br label %reduce.43.inner.loop_header.reduction_dim.051

reduce.43.inner.loop_header.reduction_dim.051:    ; preds = %reduce.43.inner.loop_body.reduction_dim.052, %reduce.32.inner.loop_exit.reduction_dim.036
  %reduce.43.inner.indvar.reduction_dim.054 = load i32, ptr %reduce.43.inner.invar_address.reduction_dim.053, align 4
  %210 = icmp uge i32 %reduce.43.inner.indvar.reduction_dim.054, 4
  br i1 %210, label %reduce.43.inner.loop_exit.reduction_dim.050, label %reduce.43.inner.loop_body.reduction_dim.052

reduce.43.inner.loop_body.reduction_dim.052:      ; preds = %reduce.43.inner.loop_header.reduction_dim.051
  %211 = load float, ptr %accumulator_048, align 4
  %212 = mul nuw nsw i32 %207, 1
  %213 = add nuw nsw i32 0, %212
  %214 = urem i32 %213, 100
  %215 = udiv i32 %213, 100
  %216 = udiv i32 %215, 1
  %217 = udiv i32 %216, 8192
  %218 = mul nuw nsw i32 %reduce.43.inner.indvar.reduction_dim.054, 1
  %219 = add nuw nsw i32 0, %218
  %220 = udiv i32 %219, 4
  %221 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %219, i32 %216, i32 0, i32 %214
  %222 = load float, ptr %221, align 4, !invariant.load !48
  %223 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %reduce.43.inner.indvar.reduction_dim.054
  %224 = load float, ptr %223, align 4, !invariant.load !48
  %multiply.3856 = fmul float %222, %224
  store float %211, ptr %parameter_buffer57, align 4
  store float %multiply.3856, ptr %parameter_buffer58, align 4
  call void @region_3_39(ptr %parameter_buffer57, ptr %parameter_buffer58, ptr %return_buffer59)
  %225 = load float, ptr %return_buffer59, align 4
  store float %225, ptr %accumulator_048, align 4
  %invar.inc55 = add nuw nsw i32 %reduce.43.inner.indvar.reduction_dim.054, 1
  store i32 %invar.inc55, ptr %reduce.43.inner.invar_address.reduction_dim.053, align 4
  br label %reduce.43.inner.loop_header.reduction_dim.051

reduce.43.inner.loop_exit.reduction_dim.050:      ; preds = %reduce.43.inner.loop_header.reduction_dim.051
  %226 = load float, ptr %accumulator_048, align 4
  %multiply.4460 = fmul float %209, %226
  %subtract.4661 = fsub float %201, %multiply.4460
  %227 = insertvalue { float, float, float, float } %199, float %subtract.4661, 2
  %228 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  %229 = load float, ptr %228, align 4, !invariant.load !48
  %230 = mul nuw nsw i32 %9, 1
  %231 = add nuw nsw i32 0, %230
  %232 = mul nuw nsw i32 %11, 1
  %233 = add nuw nsw i32 0, %232
  %234 = mul nuw nsw i32 %12, 100
  %235 = add nuw nsw i32 %233, %234
  %236 = udiv i32 %235, 819200
  %237 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_1663 = load float, ptr @2, align 4
  store float %region_0_59_constant_1663, ptr %accumulator_062, align 4
  store i32 0, ptr %reduce.54.inner.invar_address.reduction_dim.067, align 4
  br label %reduce.54.inner.loop_header.reduction_dim.065

reduce.54.inner.loop_header.reduction_dim.065:    ; preds = %reduce.54.inner.loop_body.reduction_dim.066, %reduce.43.inner.loop_exit.reduction_dim.050
  %reduce.54.inner.indvar.reduction_dim.068 = load i32, ptr %reduce.54.inner.invar_address.reduction_dim.067, align 4
  %238 = icmp uge i32 %reduce.54.inner.indvar.reduction_dim.068, 4
  br i1 %238, label %reduce.54.inner.loop_exit.reduction_dim.064, label %reduce.54.inner.loop_body.reduction_dim.066

reduce.54.inner.loop_body.reduction_dim.066:      ; preds = %reduce.54.inner.loop_header.reduction_dim.065
  %239 = load float, ptr %accumulator_062, align 4
  %240 = mul nuw nsw i32 %235, 1
  %241 = add nuw nsw i32 0, %240
  %242 = urem i32 %241, 100
  %243 = udiv i32 %241, 100
  %244 = udiv i32 %243, 1
  %245 = udiv i32 %244, 8192
  %246 = mul nuw nsw i32 %reduce.54.inner.indvar.reduction_dim.068, 1
  %247 = add nuw nsw i32 0, %246
  %248 = udiv i32 %247, 4
  %249 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %247, i32 %244, i32 0, i32 %242
  %250 = load float, ptr %249, align 4, !invariant.load !48
  %251 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %reduce.54.inner.indvar.reduction_dim.068
  %252 = load float, ptr %251, align 4, !invariant.load !48
  %multiply.4970 = fmul float %250, %252
  store float %239, ptr %parameter_buffer71, align 4
  store float %multiply.4970, ptr %parameter_buffer72, align 4
  call void @region_4_50(ptr %parameter_buffer71, ptr %parameter_buffer72, ptr %return_buffer73)
  %253 = load float, ptr %return_buffer73, align 4
  store float %253, ptr %accumulator_062, align 4
  %invar.inc69 = add nuw nsw i32 %reduce.54.inner.indvar.reduction_dim.068, 1
  store i32 %invar.inc69, ptr %reduce.54.inner.invar_address.reduction_dim.067, align 4
  br label %reduce.54.inner.loop_header.reduction_dim.065

reduce.54.inner.loop_exit.reduction_dim.064:      ; preds = %reduce.54.inner.loop_header.reduction_dim.065
  %254 = load float, ptr %accumulator_062, align 4
  %multiply.5574 = fmul float %237, %254
  %subtract.5775 = fsub float %229, %multiply.5574
  %255 = insertvalue { float, float, float, float } %227, float %subtract.5775, 3
  %256 = extractvalue { float, float, float, float } %255, 0
  %257 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  store float %256, ptr %257, align 4
  %258 = extractvalue { float, float, float, float } %255, 1
  %259 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  store float %258, ptr %259, align 4
  %260 = extractvalue { float, float, float, float } %255, 2
  %261 = getelementptr inbounds float, ptr %arg12, i32 %linear_index1
  store float %260, ptr %261, align 4
  %262 = extractvalue { float, float, float, float } %255, 3
  %263 = getelementptr inbounds float, ptr %arg13, i32 %linear_index1
  store float %262, ptr %263, align 4
  %264 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %265 = load float, ptr %264, align 4, !invariant.load !48
  %266 = mul nuw nsw i32 %14, 1
  %267 = add nuw nsw i32 0, %266
  %268 = mul nuw nsw i32 %16, 1
  %269 = add nuw nsw i32 0, %268
  %270 = mul nuw nsw i32 %17, 100
  %271 = add nuw nsw i32 %269, %270
  %272 = udiv i32 %271, 819200
  %273 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_1677 = load float, ptr @2, align 4
  store float %region_0_59_constant_1677, ptr %accumulator_076, align 4
  store i32 0, ptr %reduce.21.inner.invar_address.reduction_dim.081, align 4
  br label %reduce.21.inner.loop_header.reduction_dim.079

reduce.21.inner.loop_header.reduction_dim.079:    ; preds = %reduce.21.inner.loop_body.reduction_dim.080, %reduce.54.inner.loop_exit.reduction_dim.064
  %reduce.21.inner.indvar.reduction_dim.082 = load i32, ptr %reduce.21.inner.invar_address.reduction_dim.081, align 4
  %274 = icmp uge i32 %reduce.21.inner.indvar.reduction_dim.082, 4
  br i1 %274, label %reduce.21.inner.loop_exit.reduction_dim.078, label %reduce.21.inner.loop_body.reduction_dim.080

reduce.21.inner.loop_body.reduction_dim.080:      ; preds = %reduce.21.inner.loop_header.reduction_dim.079
  %275 = load float, ptr %accumulator_076, align 4
  %276 = mul nuw nsw i32 %271, 1
  %277 = add nuw nsw i32 0, %276
  %278 = urem i32 %277, 100
  %279 = udiv i32 %277, 100
  %280 = udiv i32 %279, 1
  %281 = udiv i32 %280, 8192
  %282 = mul nuw nsw i32 %reduce.21.inner.indvar.reduction_dim.082, 1
  %283 = add nuw nsw i32 0, %282
  %284 = udiv i32 %283, 4
  %285 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %283, i32 %280, i32 0, i32 %278
  %286 = load float, ptr %285, align 4, !invariant.load !48
  %287 = getelementptr inbounds [1 x [4 x float]], ptr %arg1, i32 0, i32 0, i32 %reduce.21.inner.indvar.reduction_dim.082
  %288 = load float, ptr %287, align 4, !invariant.load !48
  %multiply.1584 = fmul float %286, %288
  store float %275, ptr %parameter_buffer85, align 4
  store float %multiply.1584, ptr %parameter_buffer86, align 4
  call void @region_1_17(ptr %parameter_buffer85, ptr %parameter_buffer86, ptr %return_buffer87)
  %289 = load float, ptr %return_buffer87, align 4
  store float %289, ptr %accumulator_076, align 4
  %invar.inc83 = add nuw nsw i32 %reduce.21.inner.indvar.reduction_dim.082, 1
  store i32 %invar.inc83, ptr %reduce.21.inner.invar_address.reduction_dim.081, align 4
  br label %reduce.21.inner.loop_header.reduction_dim.079

reduce.21.inner.loop_exit.reduction_dim.078:      ; preds = %reduce.21.inner.loop_header.reduction_dim.079
  %290 = load float, ptr %accumulator_076, align 4
  %multiply.2288 = fmul float %273, %290
  %subtract.2489 = fsub float %265, %multiply.2288
  %291 = insertvalue { float, float, float, float } undef, float %subtract.2489, 0
  %292 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %293 = load float, ptr %292, align 4, !invariant.load !48
  %294 = mul nuw nsw i32 %14, 1
  %295 = add nuw nsw i32 0, %294
  %296 = mul nuw nsw i32 %16, 1
  %297 = add nuw nsw i32 0, %296
  %298 = mul nuw nsw i32 %17, 100
  %299 = add nuw nsw i32 %297, %298
  %300 = udiv i32 %299, 819200
  %301 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_1691 = load float, ptr @2, align 4
  store float %region_0_59_constant_1691, ptr %accumulator_090, align 4
  store i32 0, ptr %reduce.32.inner.invar_address.reduction_dim.095, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.093

reduce.32.inner.loop_header.reduction_dim.093:    ; preds = %reduce.32.inner.loop_body.reduction_dim.094, %reduce.21.inner.loop_exit.reduction_dim.078
  %reduce.32.inner.indvar.reduction_dim.096 = load i32, ptr %reduce.32.inner.invar_address.reduction_dim.095, align 4
  %302 = icmp uge i32 %reduce.32.inner.indvar.reduction_dim.096, 4
  br i1 %302, label %reduce.32.inner.loop_exit.reduction_dim.092, label %reduce.32.inner.loop_body.reduction_dim.094

reduce.32.inner.loop_body.reduction_dim.094:      ; preds = %reduce.32.inner.loop_header.reduction_dim.093
  %303 = load float, ptr %accumulator_090, align 4
  %304 = mul nuw nsw i32 %299, 1
  %305 = add nuw nsw i32 0, %304
  %306 = urem i32 %305, 100
  %307 = udiv i32 %305, 100
  %308 = udiv i32 %307, 1
  %309 = udiv i32 %308, 8192
  %310 = mul nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.096, 1
  %311 = add nuw nsw i32 0, %310
  %312 = udiv i32 %311, 4
  %313 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %311, i32 %308, i32 0, i32 %306
  %314 = load float, ptr %313, align 4, !invariant.load !48
  %315 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %reduce.32.inner.indvar.reduction_dim.096
  %316 = load float, ptr %315, align 4, !invariant.load !48
  %multiply.2798 = fmul float %314, %316
  store float %303, ptr %parameter_buffer99, align 4
  store float %multiply.2798, ptr %parameter_buffer100, align 4
  call void @region_2_28(ptr %parameter_buffer99, ptr %parameter_buffer100, ptr %return_buffer101)
  %317 = load float, ptr %return_buffer101, align 4
  store float %317, ptr %accumulator_090, align 4
  %invar.inc97 = add nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.096, 1
  store i32 %invar.inc97, ptr %reduce.32.inner.invar_address.reduction_dim.095, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.093

reduce.32.inner.loop_exit.reduction_dim.092:      ; preds = %reduce.32.inner.loop_header.reduction_dim.093
  %318 = load float, ptr %accumulator_090, align 4
  %multiply.33102 = fmul float %301, %318
  %subtract.35103 = fsub float %293, %multiply.33102
  %319 = insertvalue { float, float, float, float } %291, float %subtract.35103, 1
  %320 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %321 = load float, ptr %320, align 4, !invariant.load !48
  %322 = mul nuw nsw i32 %14, 1
  %323 = add nuw nsw i32 0, %322
  %324 = mul nuw nsw i32 %16, 1
  %325 = add nuw nsw i32 0, %324
  %326 = mul nuw nsw i32 %17, 100
  %327 = add nuw nsw i32 %325, %326
  %328 = udiv i32 %327, 819200
  %329 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_16105 = load float, ptr @2, align 4
  store float %region_0_59_constant_16105, ptr %accumulator_0104, align 4
  store i32 0, ptr %reduce.43.inner.invar_address.reduction_dim.0109, align 4
  br label %reduce.43.inner.loop_header.reduction_dim.0107

reduce.43.inner.loop_header.reduction_dim.0107:   ; preds = %reduce.43.inner.loop_body.reduction_dim.0108, %reduce.32.inner.loop_exit.reduction_dim.092
  %reduce.43.inner.indvar.reduction_dim.0110 = load i32, ptr %reduce.43.inner.invar_address.reduction_dim.0109, align 4
  %330 = icmp uge i32 %reduce.43.inner.indvar.reduction_dim.0110, 4
  br i1 %330, label %reduce.43.inner.loop_exit.reduction_dim.0106, label %reduce.43.inner.loop_body.reduction_dim.0108

reduce.43.inner.loop_body.reduction_dim.0108:     ; preds = %reduce.43.inner.loop_header.reduction_dim.0107
  %331 = load float, ptr %accumulator_0104, align 4
  %332 = mul nuw nsw i32 %327, 1
  %333 = add nuw nsw i32 0, %332
  %334 = urem i32 %333, 100
  %335 = udiv i32 %333, 100
  %336 = udiv i32 %335, 1
  %337 = udiv i32 %336, 8192
  %338 = mul nuw nsw i32 %reduce.43.inner.indvar.reduction_dim.0110, 1
  %339 = add nuw nsw i32 0, %338
  %340 = udiv i32 %339, 4
  %341 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %339, i32 %336, i32 0, i32 %334
  %342 = load float, ptr %341, align 4, !invariant.load !48
  %343 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %reduce.43.inner.indvar.reduction_dim.0110
  %344 = load float, ptr %343, align 4, !invariant.load !48
  %multiply.38112 = fmul float %342, %344
  store float %331, ptr %parameter_buffer113, align 4
  store float %multiply.38112, ptr %parameter_buffer114, align 4
  call void @region_3_39(ptr %parameter_buffer113, ptr %parameter_buffer114, ptr %return_buffer115)
  %345 = load float, ptr %return_buffer115, align 4
  store float %345, ptr %accumulator_0104, align 4
  %invar.inc111 = add nuw nsw i32 %reduce.43.inner.indvar.reduction_dim.0110, 1
  store i32 %invar.inc111, ptr %reduce.43.inner.invar_address.reduction_dim.0109, align 4
  br label %reduce.43.inner.loop_header.reduction_dim.0107

reduce.43.inner.loop_exit.reduction_dim.0106:     ; preds = %reduce.43.inner.loop_header.reduction_dim.0107
  %346 = load float, ptr %accumulator_0104, align 4
  %multiply.44116 = fmul float %329, %346
  %subtract.46117 = fsub float %321, %multiply.44116
  %347 = insertvalue { float, float, float, float } %319, float %subtract.46117, 2
  %348 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  %349 = load float, ptr %348, align 4, !invariant.load !48
  %350 = mul nuw nsw i32 %14, 1
  %351 = add nuw nsw i32 0, %350
  %352 = mul nuw nsw i32 %16, 1
  %353 = add nuw nsw i32 0, %352
  %354 = mul nuw nsw i32 %17, 100
  %355 = add nuw nsw i32 %353, %354
  %356 = udiv i32 %355, 819200
  %357 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_16119 = load float, ptr @2, align 4
  store float %region_0_59_constant_16119, ptr %accumulator_0118, align 4
  store i32 0, ptr %reduce.54.inner.invar_address.reduction_dim.0123, align 4
  br label %reduce.54.inner.loop_header.reduction_dim.0121

reduce.54.inner.loop_header.reduction_dim.0121:   ; preds = %reduce.54.inner.loop_body.reduction_dim.0122, %reduce.43.inner.loop_exit.reduction_dim.0106
  %reduce.54.inner.indvar.reduction_dim.0124 = load i32, ptr %reduce.54.inner.invar_address.reduction_dim.0123, align 4
  %358 = icmp uge i32 %reduce.54.inner.indvar.reduction_dim.0124, 4
  br i1 %358, label %reduce.54.inner.loop_exit.reduction_dim.0120, label %reduce.54.inner.loop_body.reduction_dim.0122

reduce.54.inner.loop_body.reduction_dim.0122:     ; preds = %reduce.54.inner.loop_header.reduction_dim.0121
  %359 = load float, ptr %accumulator_0118, align 4
  %360 = mul nuw nsw i32 %355, 1
  %361 = add nuw nsw i32 0, %360
  %362 = urem i32 %361, 100
  %363 = udiv i32 %361, 100
  %364 = udiv i32 %363, 1
  %365 = udiv i32 %364, 8192
  %366 = mul nuw nsw i32 %reduce.54.inner.indvar.reduction_dim.0124, 1
  %367 = add nuw nsw i32 0, %366
  %368 = udiv i32 %367, 4
  %369 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %367, i32 %364, i32 0, i32 %362
  %370 = load float, ptr %369, align 4, !invariant.load !48
  %371 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %reduce.54.inner.indvar.reduction_dim.0124
  %372 = load float, ptr %371, align 4, !invariant.load !48
  %multiply.49126 = fmul float %370, %372
  store float %359, ptr %parameter_buffer127, align 4
  store float %multiply.49126, ptr %parameter_buffer128, align 4
  call void @region_4_50(ptr %parameter_buffer127, ptr %parameter_buffer128, ptr %return_buffer129)
  %373 = load float, ptr %return_buffer129, align 4
  store float %373, ptr %accumulator_0118, align 4
  %invar.inc125 = add nuw nsw i32 %reduce.54.inner.indvar.reduction_dim.0124, 1
  store i32 %invar.inc125, ptr %reduce.54.inner.invar_address.reduction_dim.0123, align 4
  br label %reduce.54.inner.loop_header.reduction_dim.0121

reduce.54.inner.loop_exit.reduction_dim.0120:     ; preds = %reduce.54.inner.loop_header.reduction_dim.0121
  %374 = load float, ptr %accumulator_0118, align 4
  %multiply.55130 = fmul float %357, %374
  %subtract.57131 = fsub float %349, %multiply.55130
  %375 = insertvalue { float, float, float, float } %347, float %subtract.57131, 3
  %376 = extractvalue { float, float, float, float } %375, 0
  %377 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  store float %376, ptr %377, align 4
  %378 = extractvalue { float, float, float, float } %375, 1
  %379 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  store float %378, ptr %379, align 4
  %380 = extractvalue { float, float, float, float } %375, 2
  %381 = getelementptr inbounds float, ptr %arg12, i32 %linear_index2
  store float %380, ptr %381, align 4
  %382 = extractvalue { float, float, float, float } %375, 3
  %383 = getelementptr inbounds float, ptr %arg13, i32 %linear_index2
  store float %382, ptr %383, align 4
  %384 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %385 = load float, ptr %384, align 4, !invariant.load !48
  %386 = mul nuw nsw i32 %19, 1
  %387 = add nuw nsw i32 0, %386
  %388 = mul nuw nsw i32 %21, 1
  %389 = add nuw nsw i32 0, %388
  %390 = mul nuw nsw i32 %22, 100
  %391 = add nuw nsw i32 %389, %390
  %392 = udiv i32 %391, 819200
  %393 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_16133 = load float, ptr @2, align 4
  store float %region_0_59_constant_16133, ptr %accumulator_0132, align 4
  store i32 0, ptr %reduce.21.inner.invar_address.reduction_dim.0137, align 4
  br label %reduce.21.inner.loop_header.reduction_dim.0135

reduce.21.inner.loop_header.reduction_dim.0135:   ; preds = %reduce.21.inner.loop_body.reduction_dim.0136, %reduce.54.inner.loop_exit.reduction_dim.0120
  %reduce.21.inner.indvar.reduction_dim.0138 = load i32, ptr %reduce.21.inner.invar_address.reduction_dim.0137, align 4
  %394 = icmp uge i32 %reduce.21.inner.indvar.reduction_dim.0138, 4
  br i1 %394, label %reduce.21.inner.loop_exit.reduction_dim.0134, label %reduce.21.inner.loop_body.reduction_dim.0136

reduce.21.inner.loop_body.reduction_dim.0136:     ; preds = %reduce.21.inner.loop_header.reduction_dim.0135
  %395 = load float, ptr %accumulator_0132, align 4
  %396 = mul nuw nsw i32 %391, 1
  %397 = add nuw nsw i32 0, %396
  %398 = urem i32 %397, 100
  %399 = udiv i32 %397, 100
  %400 = udiv i32 %399, 1
  %401 = udiv i32 %400, 8192
  %402 = mul nuw nsw i32 %reduce.21.inner.indvar.reduction_dim.0138, 1
  %403 = add nuw nsw i32 0, %402
  %404 = udiv i32 %403, 4
  %405 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %403, i32 %400, i32 0, i32 %398
  %406 = load float, ptr %405, align 4, !invariant.load !48
  %407 = getelementptr inbounds [1 x [4 x float]], ptr %arg1, i32 0, i32 0, i32 %reduce.21.inner.indvar.reduction_dim.0138
  %408 = load float, ptr %407, align 4, !invariant.load !48
  %multiply.15140 = fmul float %406, %408
  store float %395, ptr %parameter_buffer141, align 4
  store float %multiply.15140, ptr %parameter_buffer142, align 4
  call void @region_1_17(ptr %parameter_buffer141, ptr %parameter_buffer142, ptr %return_buffer143)
  %409 = load float, ptr %return_buffer143, align 4
  store float %409, ptr %accumulator_0132, align 4
  %invar.inc139 = add nuw nsw i32 %reduce.21.inner.indvar.reduction_dim.0138, 1
  store i32 %invar.inc139, ptr %reduce.21.inner.invar_address.reduction_dim.0137, align 4
  br label %reduce.21.inner.loop_header.reduction_dim.0135

reduce.21.inner.loop_exit.reduction_dim.0134:     ; preds = %reduce.21.inner.loop_header.reduction_dim.0135
  %410 = load float, ptr %accumulator_0132, align 4
  %multiply.22144 = fmul float %393, %410
  %subtract.24145 = fsub float %385, %multiply.22144
  %411 = insertvalue { float, float, float, float } undef, float %subtract.24145, 0
  %412 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %413 = load float, ptr %412, align 4, !invariant.load !48
  %414 = mul nuw nsw i32 %19, 1
  %415 = add nuw nsw i32 0, %414
  %416 = mul nuw nsw i32 %21, 1
  %417 = add nuw nsw i32 0, %416
  %418 = mul nuw nsw i32 %22, 100
  %419 = add nuw nsw i32 %417, %418
  %420 = udiv i32 %419, 819200
  %421 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_16147 = load float, ptr @2, align 4
  store float %region_0_59_constant_16147, ptr %accumulator_0146, align 4
  store i32 0, ptr %reduce.32.inner.invar_address.reduction_dim.0151, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.0149

reduce.32.inner.loop_header.reduction_dim.0149:   ; preds = %reduce.32.inner.loop_body.reduction_dim.0150, %reduce.21.inner.loop_exit.reduction_dim.0134
  %reduce.32.inner.indvar.reduction_dim.0152 = load i32, ptr %reduce.32.inner.invar_address.reduction_dim.0151, align 4
  %422 = icmp uge i32 %reduce.32.inner.indvar.reduction_dim.0152, 4
  br i1 %422, label %reduce.32.inner.loop_exit.reduction_dim.0148, label %reduce.32.inner.loop_body.reduction_dim.0150

reduce.32.inner.loop_body.reduction_dim.0150:     ; preds = %reduce.32.inner.loop_header.reduction_dim.0149
  %423 = load float, ptr %accumulator_0146, align 4
  %424 = mul nuw nsw i32 %419, 1
  %425 = add nuw nsw i32 0, %424
  %426 = urem i32 %425, 100
  %427 = udiv i32 %425, 100
  %428 = udiv i32 %427, 1
  %429 = udiv i32 %428, 8192
  %430 = mul nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.0152, 1
  %431 = add nuw nsw i32 0, %430
  %432 = udiv i32 %431, 4
  %433 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %431, i32 %428, i32 0, i32 %426
  %434 = load float, ptr %433, align 4, !invariant.load !48
  %435 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %reduce.32.inner.indvar.reduction_dim.0152
  %436 = load float, ptr %435, align 4, !invariant.load !48
  %multiply.27154 = fmul float %434, %436
  store float %423, ptr %parameter_buffer155, align 4
  store float %multiply.27154, ptr %parameter_buffer156, align 4
  call void @region_2_28(ptr %parameter_buffer155, ptr %parameter_buffer156, ptr %return_buffer157)
  %437 = load float, ptr %return_buffer157, align 4
  store float %437, ptr %accumulator_0146, align 4
  %invar.inc153 = add nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.0152, 1
  store i32 %invar.inc153, ptr %reduce.32.inner.invar_address.reduction_dim.0151, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.0149

reduce.32.inner.loop_exit.reduction_dim.0148:     ; preds = %reduce.32.inner.loop_header.reduction_dim.0149
  %438 = load float, ptr %accumulator_0146, align 4
  %multiply.33158 = fmul float %421, %438
  %subtract.35159 = fsub float %413, %multiply.33158
  %439 = insertvalue { float, float, float, float } %411, float %subtract.35159, 1
  %440 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %441 = load float, ptr %440, align 4, !invariant.load !48
  %442 = mul nuw nsw i32 %19, 1
  %443 = add nuw nsw i32 0, %442
  %444 = mul nuw nsw i32 %21, 1
  %445 = add nuw nsw i32 0, %444
  %446 = mul nuw nsw i32 %22, 100
  %447 = add nuw nsw i32 %445, %446
  %448 = udiv i32 %447, 819200
  %449 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_16161 = load float, ptr @2, align 4
  store float %region_0_59_constant_16161, ptr %accumulator_0160, align 4
  store i32 0, ptr %reduce.43.inner.invar_address.reduction_dim.0165, align 4
  br label %reduce.43.inner.loop_header.reduction_dim.0163

reduce.43.inner.loop_header.reduction_dim.0163:   ; preds = %reduce.43.inner.loop_body.reduction_dim.0164, %reduce.32.inner.loop_exit.reduction_dim.0148
  %reduce.43.inner.indvar.reduction_dim.0166 = load i32, ptr %reduce.43.inner.invar_address.reduction_dim.0165, align 4
  %450 = icmp uge i32 %reduce.43.inner.indvar.reduction_dim.0166, 4
  br i1 %450, label %reduce.43.inner.loop_exit.reduction_dim.0162, label %reduce.43.inner.loop_body.reduction_dim.0164

reduce.43.inner.loop_body.reduction_dim.0164:     ; preds = %reduce.43.inner.loop_header.reduction_dim.0163
  %451 = load float, ptr %accumulator_0160, align 4
  %452 = mul nuw nsw i32 %447, 1
  %453 = add nuw nsw i32 0, %452
  %454 = urem i32 %453, 100
  %455 = udiv i32 %453, 100
  %456 = udiv i32 %455, 1
  %457 = udiv i32 %456, 8192
  %458 = mul nuw nsw i32 %reduce.43.inner.indvar.reduction_dim.0166, 1
  %459 = add nuw nsw i32 0, %458
  %460 = udiv i32 %459, 4
  %461 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %459, i32 %456, i32 0, i32 %454
  %462 = load float, ptr %461, align 4, !invariant.load !48
  %463 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %reduce.43.inner.indvar.reduction_dim.0166
  %464 = load float, ptr %463, align 4, !invariant.load !48
  %multiply.38168 = fmul float %462, %464
  store float %451, ptr %parameter_buffer169, align 4
  store float %multiply.38168, ptr %parameter_buffer170, align 4
  call void @region_3_39(ptr %parameter_buffer169, ptr %parameter_buffer170, ptr %return_buffer171)
  %465 = load float, ptr %return_buffer171, align 4
  store float %465, ptr %accumulator_0160, align 4
  %invar.inc167 = add nuw nsw i32 %reduce.43.inner.indvar.reduction_dim.0166, 1
  store i32 %invar.inc167, ptr %reduce.43.inner.invar_address.reduction_dim.0165, align 4
  br label %reduce.43.inner.loop_header.reduction_dim.0163

reduce.43.inner.loop_exit.reduction_dim.0162:     ; preds = %reduce.43.inner.loop_header.reduction_dim.0163
  %466 = load float, ptr %accumulator_0160, align 4
  %multiply.44172 = fmul float %449, %466
  %subtract.46173 = fsub float %441, %multiply.44172
  %467 = insertvalue { float, float, float, float } %439, float %subtract.46173, 2
  %468 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  %469 = load float, ptr %468, align 4, !invariant.load !48
  %470 = mul nuw nsw i32 %19, 1
  %471 = add nuw nsw i32 0, %470
  %472 = mul nuw nsw i32 %21, 1
  %473 = add nuw nsw i32 0, %472
  %474 = mul nuw nsw i32 %22, 100
  %475 = add nuw nsw i32 %473, %474
  %476 = udiv i32 %475, 819200
  %477 = load float, ptr %arg2, align 4, !invariant.load !48
  %region_0_59_constant_16175 = load float, ptr @2, align 4
  store float %region_0_59_constant_16175, ptr %accumulator_0174, align 4
  store i32 0, ptr %reduce.54.inner.invar_address.reduction_dim.0179, align 4
  br label %reduce.54.inner.loop_header.reduction_dim.0177

reduce.54.inner.loop_header.reduction_dim.0177:   ; preds = %reduce.54.inner.loop_body.reduction_dim.0178, %reduce.43.inner.loop_exit.reduction_dim.0162
  %reduce.54.inner.indvar.reduction_dim.0180 = load i32, ptr %reduce.54.inner.invar_address.reduction_dim.0179, align 4
  %478 = icmp uge i32 %reduce.54.inner.indvar.reduction_dim.0180, 4
  br i1 %478, label %reduce.54.inner.loop_exit.reduction_dim.0176, label %reduce.54.inner.loop_body.reduction_dim.0178

reduce.54.inner.loop_body.reduction_dim.0178:     ; preds = %reduce.54.inner.loop_header.reduction_dim.0177
  %479 = load float, ptr %accumulator_0174, align 4
  %480 = mul nuw nsw i32 %475, 1
  %481 = add nuw nsw i32 0, %480
  %482 = urem i32 %481, 100
  %483 = udiv i32 %481, 100
  %484 = udiv i32 %483, 1
  %485 = udiv i32 %484, 8192
  %486 = mul nuw nsw i32 %reduce.54.inner.indvar.reduction_dim.0180, 1
  %487 = add nuw nsw i32 0, %486
  %488 = udiv i32 %487, 4
  %489 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr %arg3, i32 0, i32 %487, i32 %484, i32 0, i32 %482
  %490 = load float, ptr %489, align 4, !invariant.load !48
  %491 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %reduce.54.inner.indvar.reduction_dim.0180
  %492 = load float, ptr %491, align 4, !invariant.load !48
  %multiply.49182 = fmul float %490, %492
  store float %479, ptr %parameter_buffer183, align 4
  store float %multiply.49182, ptr %parameter_buffer184, align 4
  call void @region_4_50(ptr %parameter_buffer183, ptr %parameter_buffer184, ptr %return_buffer185)
  %493 = load float, ptr %return_buffer185, align 4
  store float %493, ptr %accumulator_0174, align 4
  %invar.inc181 = add nuw nsw i32 %reduce.54.inner.indvar.reduction_dim.0180, 1
  store i32 %invar.inc181, ptr %reduce.54.inner.invar_address.reduction_dim.0179, align 4
  br label %reduce.54.inner.loop_header.reduction_dim.0177

reduce.54.inner.loop_exit.reduction_dim.0176:     ; preds = %reduce.54.inner.loop_header.reduction_dim.0177
  %494 = load float, ptr %accumulator_0174, align 4
  %multiply.55186 = fmul float %477, %494
  %subtract.57187 = fsub float %469, %multiply.55186
  %495 = insertvalue { float, float, float, float } %467, float %subtract.57187, 3
  %496 = extractvalue { float, float, float, float } %495, 0
  %497 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  store float %496, ptr %497, align 4
  %498 = extractvalue { float, float, float, float } %495, 1
  %499 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  store float %498, ptr %499, align 4
  %500 = extractvalue { float, float, float, float } %495, 2
  %501 = getelementptr inbounds float, ptr %arg12, i32 %linear_index3
  store float %500, ptr %501, align 4
  %502 = extractvalue { float, float, float, float } %495, 3
  %503 = getelementptr inbounds float, ptr %arg13, i32 %linear_index3
  store float %502, ptr %503, align 4
  br label %fusion_26.in_bounds-after
}

define internal void @region_1_17(ptr dereferenceable(4) %Arg_0.18.typed, ptr dereferenceable(4) %Arg_1.19.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.20.typed = alloca float, align 4
  %Arg_0.18 = load float, ptr %Arg_0.18.typed, align 4
  %Arg_1.19 = load float, ptr %Arg_1.19.typed, align 4
  %add.20 = fadd float %Arg_0.18, %Arg_1.19
  store float %add.20, ptr %add.20.typed, align 4
  %load_ret_value = load float, ptr %add.20.typed, align 4
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

define internal void @region_3_39(ptr dereferenceable(4) %Arg_0.40.typed, ptr dereferenceable(4) %Arg_1.41.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.42.typed = alloca float, align 4
  %Arg_0.40 = load float, ptr %Arg_0.40.typed, align 4
  %Arg_1.41 = load float, ptr %Arg_1.41.typed, align 4
  %add.42 = fadd float %Arg_0.40, %Arg_1.41
  store float %add.42, ptr %add.42.typed, align 4
  %load_ret_value = load float, ptr %add.42.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_4_50(ptr dereferenceable(4) %Arg_0.51.typed, ptr dereferenceable(4) %Arg_1.52.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.53.typed = alloca float, align 4
  %Arg_0.51 = load float, ptr %Arg_0.51.typed, align 4
  %Arg_1.52 = load float, ptr %Arg_1.52.typed, align 4
  %add.53 = fadd float %Arg_0.51, %Arg_1.52
  store float %add.53, ptr %add.53.typed, align 4
  %load_ret_value = load float, ptr %add.53.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_12(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(3276800) %arg2, ptr noalias align 16 dereferenceable(3276800) %arg3, ptr noalias align 16 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(3276800) %arg5, ptr noalias align 128 dereferenceable(13107200) %arg6, ptr noalias align 128 dereferenceable(8192) %arg7, ptr noalias align 128 dereferenceable(8192) %arg8, ptr noalias align 128 dereferenceable(8192) %arg9, ptr noalias align 128 dereferenceable(8192) %arg10, ptr noalias align 128 dereferenceable(8192) %arg11) {
entry:
  %return_buffer322 = alloca float, align 4
  %result_from_other_lane320 = alloca float, align 4
  %return_buffer319 = alloca float, align 4
  %result_from_other_lane317 = alloca float, align 4
  %return_buffer316 = alloca float, align 4
  %result_from_other_lane314 = alloca float, align 4
  %return_buffer313 = alloca float, align 4
  %result_from_other_lane311 = alloca float, align 4
  %return_buffer310 = alloca float, align 4
  %result_from_other_lane308 = alloca float, align 4
  %initial_value_addr307 = alloca float, align 4
  %return_buffer302 = alloca float, align 4
  %result_from_other_lane300 = alloca float, align 4
  %return_buffer299 = alloca float, align 4
  %result_from_other_lane297 = alloca float, align 4
  %return_buffer296 = alloca float, align 4
  %result_from_other_lane294 = alloca float, align 4
  %return_buffer293 = alloca float, align 4
  %result_from_other_lane291 = alloca float, align 4
  %return_buffer290 = alloca float, align 4
  %result_from_other_lane288 = alloca float, align 4
  %return_buffer282 = alloca float, align 4
  %result_from_other_lane280 = alloca float, align 4
  %return_buffer279 = alloca float, align 4
  %result_from_other_lane277 = alloca float, align 4
  %return_buffer276 = alloca float, align 4
  %result_from_other_lane274 = alloca float, align 4
  %return_buffer273 = alloca float, align 4
  %result_from_other_lane271 = alloca float, align 4
  %return_buffer270 = alloca float, align 4
  %result_from_other_lane268 = alloca float, align 4
  %initial_value_addr267 = alloca float, align 4
  %return_buffer262 = alloca float, align 4
  %result_from_other_lane260 = alloca float, align 4
  %return_buffer259 = alloca float, align 4
  %result_from_other_lane257 = alloca float, align 4
  %return_buffer256 = alloca float, align 4
  %result_from_other_lane254 = alloca float, align 4
  %return_buffer253 = alloca float, align 4
  %result_from_other_lane251 = alloca float, align 4
  %return_buffer250 = alloca float, align 4
  %result_from_other_lane248 = alloca float, align 4
  %return_buffer242 = alloca float, align 4
  %result_from_other_lane240 = alloca float, align 4
  %return_buffer239 = alloca float, align 4
  %result_from_other_lane237 = alloca float, align 4
  %return_buffer236 = alloca float, align 4
  %result_from_other_lane234 = alloca float, align 4
  %return_buffer233 = alloca float, align 4
  %result_from_other_lane231 = alloca float, align 4
  %return_buffer230 = alloca float, align 4
  %result_from_other_lane228 = alloca float, align 4
  %initial_value_addr227 = alloca float, align 4
  %return_buffer222 = alloca float, align 4
  %result_from_other_lane220 = alloca float, align 4
  %return_buffer219 = alloca float, align 4
  %result_from_other_lane217 = alloca float, align 4
  %return_buffer216 = alloca float, align 4
  %result_from_other_lane214 = alloca float, align 4
  %return_buffer213 = alloca float, align 4
  %result_from_other_lane211 = alloca float, align 4
  %return_buffer210 = alloca float, align 4
  %result_from_other_lane208 = alloca float, align 4
  %return_buffer202 = alloca float, align 4
  %result_from_other_lane200 = alloca float, align 4
  %return_buffer199 = alloca float, align 4
  %result_from_other_lane197 = alloca float, align 4
  %return_buffer196 = alloca float, align 4
  %result_from_other_lane194 = alloca float, align 4
  %return_buffer193 = alloca float, align 4
  %result_from_other_lane191 = alloca float, align 4
  %return_buffer190 = alloca float, align 4
  %result_from_other_lane188 = alloca float, align 4
  %initial_value_addr187 = alloca float, align 4
  %return_buffer182 = alloca float, align 4
  %result_from_other_lane180 = alloca float, align 4
  %return_buffer179 = alloca float, align 4
  %result_from_other_lane177 = alloca float, align 4
  %return_buffer176 = alloca float, align 4
  %result_from_other_lane174 = alloca float, align 4
  %return_buffer173 = alloca float, align 4
  %result_from_other_lane171 = alloca float, align 4
  %return_buffer170 = alloca float, align 4
  %result_from_other_lane168 = alloca float, align 4
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
  %initial_value_addr = alloca float, align 4
  %return_buffer151 = alloca float, align 4
  %result_from_other_lane149 = alloca float, align 4
  %return_buffer148 = alloca float, align 4
  %result_from_other_lane146 = alloca float, align 4
  %return_buffer145 = alloca float, align 4
  %result_from_other_lane143 = alloca float, align 4
  %return_buffer142 = alloca float, align 4
  %result_from_other_lane140 = alloca float, align 4
  %return_buffer139 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer133 = alloca float, align 4
  %return_buffer127 = alloca float, align 4
  %return_buffer121 = alloca float, align 4
  %return_buffer115 = alloca float, align 4
  %return_buffer109 = alloca float, align 4
  %return_buffer99 = alloca float, align 4
  %return_buffer93 = alloca float, align 4
  %return_buffer87 = alloca float, align 4
  %return_buffer81 = alloca float, align 4
  %return_buffer75 = alloca float, align 4
  %tile_loop.invar_address69 = alloca i32, align 4
  %return_buffer61 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %return_buffer49 = alloca float, align 4
  %return_buffer43 = alloca float, align 4
  %return_buffer37 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result11 = alloca float, align 4
  %reduction_input_address10 = alloca float, align 4
  %partial_reduction_result8 = alloca float, align 4
  %reduction_input_address7 = alloca float, align 4
  %partial_reduction_result5 = alloca float, align 4
  %reduction_input_address4 = alloca float, align 4
  %partial_reduction_result2 = alloca float, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !50
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after306, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_55_constant_11 = load float, ptr @3, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_55_constant_11, ptr %2, align 4
  %region_0_55_constant_113 = load float, ptr @3, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_55_constant_113, ptr %3, align 4
  %region_0_55_constant_116 = load float, ptr @3, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  store float %region_0_55_constant_116, ptr %4, align 4
  %region_0_55_constant_119 = load float, ptr @3, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  store float %region_0_55_constant_119, ptr %5, align 4
  %region_0_55_constant_1112 = load float, ptr @3, align 4
  %6 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  store float %region_0_55_constant_1112, ptr %6, align 4
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !67
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %9 = urem i32 %7, 128
  %10 = udiv i32 %7, 128
  %11 = mul i32 %8, 1
  %12 = add i32 %11, %10
  %13 = icmp ult i32 %12, 2048
  br i1 %13, label %14, label %early_return

14:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %9, 128
  %thread_id.y = udiv i32 %9, 128
  %lane_id = urem i32 %9, 32
  %15 = udiv i32 %12, 1
  %16 = urem i32 %15, 1
  %17 = udiv i32 %12, 1
  %18 = urem i32 %17, 2048
  %19 = udiv i32 %12, 2048
  %20 = icmp eq i32 %18, 2047
  %tile_bound = select i1 %20, i32 1, i32 1
  %21 = icmp eq i32 %16, 0
  %tile_bound13 = select i1 %21, i32 1600, i32 2048
  %tile_origin.0 = mul i32 %19, 1
  %tile_origin.1 = mul i32 %18, 1
  %tile_origin.2 = mul i32 %16, 2048
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %14
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %22 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %22, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %23 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %24 = icmp eq i32 2048, %tile_bound13
  br i1 %24, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit66, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !68

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result138 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result138, i32 16, i32 31)
  store float %25, ptr %result_from_other_lane, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer139)
  %26 = load float, ptr %return_buffer139, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result141 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result141, i32 8, i32 31)
  store float %27, ptr %result_from_other_lane140, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane140, ptr %return_buffer142)
  %28 = load float, ptr %return_buffer142, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result144 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result144, i32 4, i32 31)
  store float %29, ptr %result_from_other_lane143, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane143, ptr %return_buffer145)
  %30 = load float, ptr %return_buffer145, align 4
  store float %30, ptr %current_output, align 4
  %partial_reduction_result147 = load float, ptr %current_output, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result147, i32 2, i32 31)
  store float %31, ptr %result_from_other_lane146, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane146, ptr %return_buffer148)
  %32 = load float, ptr %return_buffer148, align 4
  store float %32, ptr %current_output, align 4
  %partial_reduction_result150 = load float, ptr %current_output, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result150, i32 1, i32 31)
  store float %33, ptr %result_from_other_lane149, align 4
  call void @region_1_12(ptr %current_output, ptr %result_from_other_lane149, ptr %return_buffer151)
  %34 = load float, ptr %return_buffer151, align 4
  store float %34, ptr %current_output, align 4
  %35 = udiv i32 %thread_id.x, 32
  %36 = icmp eq i32 %lane_id, 0
  br i1 %36, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %37 = icmp eq i32 %35, 0
  br i1 %37, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  %current_output167 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %partial_reduction_result169 = load float, ptr %current_output167, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result169, i32 16, i32 31)
  store float %38, ptr %result_from_other_lane168, align 4
  call void @region_2_22(ptr %current_output167, ptr %result_from_other_lane168, ptr %return_buffer170)
  %39 = load float, ptr %return_buffer170, align 4
  store float %39, ptr %current_output167, align 4
  %partial_reduction_result172 = load float, ptr %current_output167, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result172, i32 8, i32 31)
  store float %40, ptr %result_from_other_lane171, align 4
  call void @region_2_22(ptr %current_output167, ptr %result_from_other_lane171, ptr %return_buffer173)
  %41 = load float, ptr %return_buffer173, align 4
  store float %41, ptr %current_output167, align 4
  %partial_reduction_result175 = load float, ptr %current_output167, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result175, i32 4, i32 31)
  store float %42, ptr %result_from_other_lane174, align 4
  call void @region_2_22(ptr %current_output167, ptr %result_from_other_lane174, ptr %return_buffer176)
  %43 = load float, ptr %return_buffer176, align 4
  store float %43, ptr %current_output167, align 4
  %partial_reduction_result178 = load float, ptr %current_output167, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result178, i32 2, i32 31)
  store float %44, ptr %result_from_other_lane177, align 4
  call void @region_2_22(ptr %current_output167, ptr %result_from_other_lane177, ptr %return_buffer179)
  %45 = load float, ptr %return_buffer179, align 4
  store float %45, ptr %current_output167, align 4
  %partial_reduction_result181 = load float, ptr %current_output167, align 4
  %46 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result181, i32 1, i32 31)
  store float %46, ptr %result_from_other_lane180, align 4
  call void @region_2_22(ptr %current_output167, ptr %result_from_other_lane180, ptr %return_buffer182)
  %47 = load float, ptr %return_buffer182, align 4
  store float %47, ptr %current_output167, align 4
  %48 = udiv i32 %thread_id.x, 32
  %49 = icmp eq i32 %lane_id, 0
  br i1 %49, label %intra_warp_reduce_write-true183, label %intra_warp_reduce_write-after184

intra_warp_reduce_write-after184:                 ; preds = %intra_warp_reduce_write-true183, %inter_warp_reduce-after
  call void @llvm.nvvm.barrier0()
  %50 = icmp eq i32 %48, 0
  br i1 %50, label %inter_warp_reduce-true185, label %inter_warp_reduce-after186

inter_warp_reduce-after186:                       ; preds = %reduction_write_output-after204, %intra_warp_reduce_write-after184
  %current_output207 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  %partial_reduction_result209 = load float, ptr %current_output207, align 4
  %51 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result209, i32 16, i32 31)
  store float %51, ptr %result_from_other_lane208, align 4
  call void @region_3_31(ptr %current_output207, ptr %result_from_other_lane208, ptr %return_buffer210)
  %52 = load float, ptr %return_buffer210, align 4
  store float %52, ptr %current_output207, align 4
  %partial_reduction_result212 = load float, ptr %current_output207, align 4
  %53 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result212, i32 8, i32 31)
  store float %53, ptr %result_from_other_lane211, align 4
  call void @region_3_31(ptr %current_output207, ptr %result_from_other_lane211, ptr %return_buffer213)
  %54 = load float, ptr %return_buffer213, align 4
  store float %54, ptr %current_output207, align 4
  %partial_reduction_result215 = load float, ptr %current_output207, align 4
  %55 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result215, i32 4, i32 31)
  store float %55, ptr %result_from_other_lane214, align 4
  call void @region_3_31(ptr %current_output207, ptr %result_from_other_lane214, ptr %return_buffer216)
  %56 = load float, ptr %return_buffer216, align 4
  store float %56, ptr %current_output207, align 4
  %partial_reduction_result218 = load float, ptr %current_output207, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result218, i32 2, i32 31)
  store float %57, ptr %result_from_other_lane217, align 4
  call void @region_3_31(ptr %current_output207, ptr %result_from_other_lane217, ptr %return_buffer219)
  %58 = load float, ptr %return_buffer219, align 4
  store float %58, ptr %current_output207, align 4
  %partial_reduction_result221 = load float, ptr %current_output207, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result221, i32 1, i32 31)
  store float %59, ptr %result_from_other_lane220, align 4
  call void @region_3_31(ptr %current_output207, ptr %result_from_other_lane220, ptr %return_buffer222)
  %60 = load float, ptr %return_buffer222, align 4
  store float %60, ptr %current_output207, align 4
  %61 = udiv i32 %thread_id.x, 32
  %62 = icmp eq i32 %lane_id, 0
  br i1 %62, label %intra_warp_reduce_write-true223, label %intra_warp_reduce_write-after224

intra_warp_reduce_write-after224:                 ; preds = %intra_warp_reduce_write-true223, %inter_warp_reduce-after186
  call void @llvm.nvvm.barrier0()
  %63 = icmp eq i32 %61, 0
  br i1 %63, label %inter_warp_reduce-true225, label %inter_warp_reduce-after226

inter_warp_reduce-after226:                       ; preds = %reduction_write_output-after244, %intra_warp_reduce_write-after224
  %current_output247 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  %partial_reduction_result249 = load float, ptr %current_output247, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result249, i32 16, i32 31)
  store float %64, ptr %result_from_other_lane248, align 4
  call void @region_4_40(ptr %current_output247, ptr %result_from_other_lane248, ptr %return_buffer250)
  %65 = load float, ptr %return_buffer250, align 4
  store float %65, ptr %current_output247, align 4
  %partial_reduction_result252 = load float, ptr %current_output247, align 4
  %66 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result252, i32 8, i32 31)
  store float %66, ptr %result_from_other_lane251, align 4
  call void @region_4_40(ptr %current_output247, ptr %result_from_other_lane251, ptr %return_buffer253)
  %67 = load float, ptr %return_buffer253, align 4
  store float %67, ptr %current_output247, align 4
  %partial_reduction_result255 = load float, ptr %current_output247, align 4
  %68 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result255, i32 4, i32 31)
  store float %68, ptr %result_from_other_lane254, align 4
  call void @region_4_40(ptr %current_output247, ptr %result_from_other_lane254, ptr %return_buffer256)
  %69 = load float, ptr %return_buffer256, align 4
  store float %69, ptr %current_output247, align 4
  %partial_reduction_result258 = load float, ptr %current_output247, align 4
  %70 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result258, i32 2, i32 31)
  store float %70, ptr %result_from_other_lane257, align 4
  call void @region_4_40(ptr %current_output247, ptr %result_from_other_lane257, ptr %return_buffer259)
  %71 = load float, ptr %return_buffer259, align 4
  store float %71, ptr %current_output247, align 4
  %partial_reduction_result261 = load float, ptr %current_output247, align 4
  %72 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result261, i32 1, i32 31)
  store float %72, ptr %result_from_other_lane260, align 4
  call void @region_4_40(ptr %current_output247, ptr %result_from_other_lane260, ptr %return_buffer262)
  %73 = load float, ptr %return_buffer262, align 4
  store float %73, ptr %current_output247, align 4
  %74 = udiv i32 %thread_id.x, 32
  %75 = icmp eq i32 %lane_id, 0
  br i1 %75, label %intra_warp_reduce_write-true263, label %intra_warp_reduce_write-after264

intra_warp_reduce_write-after264:                 ; preds = %intra_warp_reduce_write-true263, %inter_warp_reduce-after226
  call void @llvm.nvvm.barrier0()
  %76 = icmp eq i32 %74, 0
  br i1 %76, label %inter_warp_reduce-true265, label %inter_warp_reduce-after266

inter_warp_reduce-after266:                       ; preds = %reduction_write_output-after284, %intra_warp_reduce_write-after264
  %current_output287 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  %partial_reduction_result289 = load float, ptr %current_output287, align 4
  %77 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result289, i32 16, i32 31)
  store float %77, ptr %result_from_other_lane288, align 4
  call void @region_5_49(ptr %current_output287, ptr %result_from_other_lane288, ptr %return_buffer290)
  %78 = load float, ptr %return_buffer290, align 4
  store float %78, ptr %current_output287, align 4
  %partial_reduction_result292 = load float, ptr %current_output287, align 4
  %79 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result292, i32 8, i32 31)
  store float %79, ptr %result_from_other_lane291, align 4
  call void @region_5_49(ptr %current_output287, ptr %result_from_other_lane291, ptr %return_buffer293)
  %80 = load float, ptr %return_buffer293, align 4
  store float %80, ptr %current_output287, align 4
  %partial_reduction_result295 = load float, ptr %current_output287, align 4
  %81 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result295, i32 4, i32 31)
  store float %81, ptr %result_from_other_lane294, align 4
  call void @region_5_49(ptr %current_output287, ptr %result_from_other_lane294, ptr %return_buffer296)
  %82 = load float, ptr %return_buffer296, align 4
  store float %82, ptr %current_output287, align 4
  %partial_reduction_result298 = load float, ptr %current_output287, align 4
  %83 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result298, i32 2, i32 31)
  store float %83, ptr %result_from_other_lane297, align 4
  call void @region_5_49(ptr %current_output287, ptr %result_from_other_lane297, ptr %return_buffer299)
  %84 = load float, ptr %return_buffer299, align 4
  store float %84, ptr %current_output287, align 4
  %partial_reduction_result301 = load float, ptr %current_output287, align 4
  %85 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result301, i32 1, i32 31)
  store float %85, ptr %result_from_other_lane300, align 4
  call void @region_5_49(ptr %current_output287, ptr %result_from_other_lane300, ptr %return_buffer302)
  %86 = load float, ptr %return_buffer302, align 4
  store float %86, ptr %current_output287, align 4
  %87 = udiv i32 %thread_id.x, 32
  %88 = icmp eq i32 %lane_id, 0
  br i1 %88, label %intra_warp_reduce_write-true303, label %intra_warp_reduce_write-after304

intra_warp_reduce_write-after304:                 ; preds = %intra_warp_reduce_write-true303, %inter_warp_reduce-after266
  call void @llvm.nvvm.barrier0()
  %89 = icmp eq i32 %87, 0
  br i1 %89, label %inter_warp_reduce-true305, label %inter_warp_reduce-after306

inter_warp_reduce-after306:                       ; preds = %reduction_write_output-after324, %intra_warp_reduce_write-after304
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %90 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %91 = icmp uge i32 %tile_loop.indvar, 8
  br i1 %91, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc14 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc14, ptr %tile_loop.invar_address, align 4
  %92 = icmp eq i32 %tile_loop.indvar, 0
  %93 = mul i32 %tile_loop.indvar, 256
  %94 = add i32 %93, 0
  %x_loc = add i32 %94, %90
  %95 = add i32 %tile_origin.1, %y_in_tile.indvar
  %96 = add i32 %tile_origin.2, %x_loc
  %97 = mul nuw nsw i32 %96, 1
  %98 = add nuw nsw i32 0, %97
  %99 = mul nuw nsw i32 %95, 1600
  %100 = add nuw nsw i32 %98, %99
  %101 = mul nuw nsw i32 %tile_origin.0, 3276800
  %102 = add nuw nsw i32 %100, %101
  %103 = udiv i32 %102, 1
  %104 = urem i32 %103, 1600
  %105 = udiv i32 %102, 1600
  %106 = urem i32 %105, 512
  %107 = udiv i32 %102, 819200
  %108 = mul nuw nsw i32 %104, 1
  %109 = add nuw nsw i32 0, %108
  %110 = mul nuw nsw i32 %106, 1600
  %111 = add nuw nsw i32 %109, %110
  %112 = urem i32 %111, 100
  %113 = udiv i32 %111, 100
  %114 = udiv i32 %113, 1
  %115 = udiv i32 %114, 8192
  %116 = mul nuw nsw i32 %107, 1
  %117 = add nuw nsw i32 0, %116
  %118 = udiv i32 %117, 4
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.115 = load float, ptr %Arg_0.1, align 4, !invariant.load !48
  store float %Arg_0.115, ptr %reduction_input_address, align 4
  %119 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_12(ptr %119, ptr %reduction_input_address, ptr %return_buffer)
  %120 = load float, ptr %return_buffer, align 4
  store float %120, ptr %119, align 4
  %121 = mul nuw nsw i32 %104, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %106, 1600
  %124 = add nuw nsw i32 %122, %123
  %125 = udiv i32 %124, 819200
  %126 = mul nuw nsw i32 %107, 1
  %127 = add nuw nsw i32 0, %126
  %128 = udiv i32 %127, 4
  %129 = mul nuw nsw i32 %124, 1
  %130 = add nuw nsw i32 0, %129
  %131 = urem i32 %130, 100
  %132 = udiv i32 %130, 100
  %133 = udiv i32 %132, 1
  %134 = udiv i32 %133, 8192
  %135 = mul nuw nsw i32 %127, 1
  %136 = add nuw nsw i32 0, %135
  %137 = udiv i32 %136, 4
  %Arg_0.116 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.117 = load float, ptr %Arg_0.116, align 4, !invariant.load !48
  %138 = mul nuw nsw i32 %124, 1
  %139 = add nuw nsw i32 0, %138
  %140 = urem i32 %139, 100
  %141 = udiv i32 %139, 100
  %142 = udiv i32 %141, 8192
  %Arg_2.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg2, i32 0, i32 %141, i32 %140, i32 0
  %Arg_2.318 = load float, ptr %Arg_2.3, align 4, !invariant.load !48
  %multiply.20 = fmul float %Arg_0.117, %Arg_2.318
  store float %multiply.20, ptr %reduction_input_address1, align 4
  %143 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_22(ptr %143, ptr %reduction_input_address1, ptr %return_buffer19)
  %144 = load float, ptr %return_buffer19, align 4
  store float %144, ptr %143, align 4
  %145 = mul nuw nsw i32 %104, 1
  %146 = add nuw nsw i32 0, %145
  %147 = mul nuw nsw i32 %106, 1600
  %148 = add nuw nsw i32 %146, %147
  %149 = udiv i32 %148, 819200
  %150 = mul nuw nsw i32 %107, 1
  %151 = add nuw nsw i32 0, %150
  %152 = udiv i32 %151, 4
  %153 = mul nuw nsw i32 %148, 1
  %154 = add nuw nsw i32 0, %153
  %155 = urem i32 %154, 100
  %156 = udiv i32 %154, 100
  %157 = udiv i32 %156, 1
  %158 = udiv i32 %157, 8192
  %159 = mul nuw nsw i32 %151, 1
  %160 = add nuw nsw i32 0, %159
  %161 = udiv i32 %160, 4
  %Arg_0.120 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.121 = load float, ptr %Arg_0.120, align 4, !invariant.load !48
  %162 = mul nuw nsw i32 %148, 1
  %163 = add nuw nsw i32 0, %162
  %164 = urem i32 %163, 100
  %165 = udiv i32 %163, 100
  %166 = udiv i32 %165, 8192
  %Arg_3.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg3, i32 0, i32 %165, i32 %164, i32 0
  %Arg_3.422 = load float, ptr %Arg_3.4, align 4, !invariant.load !48
  %multiply.29 = fmul float %Arg_0.121, %Arg_3.422
  store float %multiply.29, ptr %reduction_input_address4, align 4
  %167 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_31(ptr %167, ptr %reduction_input_address4, ptr %return_buffer23)
  %168 = load float, ptr %return_buffer23, align 4
  store float %168, ptr %167, align 4
  %169 = mul nuw nsw i32 %104, 1
  %170 = add nuw nsw i32 0, %169
  %171 = mul nuw nsw i32 %106, 1600
  %172 = add nuw nsw i32 %170, %171
  %173 = udiv i32 %172, 819200
  %174 = mul nuw nsw i32 %107, 1
  %175 = add nuw nsw i32 0, %174
  %176 = udiv i32 %175, 4
  %177 = mul nuw nsw i32 %172, 1
  %178 = add nuw nsw i32 0, %177
  %179 = urem i32 %178, 100
  %180 = udiv i32 %178, 100
  %181 = udiv i32 %180, 1
  %182 = udiv i32 %181, 8192
  %183 = mul nuw nsw i32 %175, 1
  %184 = add nuw nsw i32 0, %183
  %185 = udiv i32 %184, 4
  %Arg_0.124 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.125 = load float, ptr %Arg_0.124, align 4, !invariant.load !48
  %186 = mul nuw nsw i32 %172, 1
  %187 = add nuw nsw i32 0, %186
  %188 = urem i32 %187, 100
  %189 = udiv i32 %187, 100
  %190 = udiv i32 %189, 8192
  %Arg_4.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %189, i32 %188, i32 0
  %Arg_4.526 = load float, ptr %Arg_4.5, align 4, !invariant.load !48
  %multiply.38 = fmul float %Arg_0.125, %Arg_4.526
  store float %multiply.38, ptr %reduction_input_address7, align 4
  %191 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_40(ptr %191, ptr %reduction_input_address7, ptr %return_buffer27)
  %192 = load float, ptr %return_buffer27, align 4
  store float %192, ptr %191, align 4
  %193 = mul nuw nsw i32 %104, 1
  %194 = add nuw nsw i32 0, %193
  %195 = mul nuw nsw i32 %106, 1600
  %196 = add nuw nsw i32 %194, %195
  %197 = udiv i32 %196, 819200
  %198 = mul nuw nsw i32 %107, 1
  %199 = add nuw nsw i32 0, %198
  %200 = udiv i32 %199, 4
  %201 = mul nuw nsw i32 %196, 1
  %202 = add nuw nsw i32 0, %201
  %203 = urem i32 %202, 100
  %204 = udiv i32 %202, 100
  %205 = udiv i32 %204, 1
  %206 = udiv i32 %205, 8192
  %207 = mul nuw nsw i32 %199, 1
  %208 = add nuw nsw i32 0, %207
  %209 = udiv i32 %208, 4
  %Arg_0.128 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.129 = load float, ptr %Arg_0.128, align 4, !invariant.load !48
  %210 = mul nuw nsw i32 %196, 1
  %211 = add nuw nsw i32 0, %210
  %212 = urem i32 %211, 100
  %213 = udiv i32 %211, 100
  %214 = udiv i32 %213, 8192
  %Arg_5.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg5, i32 0, i32 %213, i32 %212, i32 0
  %Arg_5.630 = load float, ptr %Arg_5.6, align 4, !invariant.load !48
  %multiply.47 = fmul float %Arg_0.129, %Arg_5.630
  store float %multiply.47, ptr %reduction_input_address10, align 4
  %215 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  call void @region_5_49(ptr %215, ptr %reduction_input_address10, ptr %return_buffer31)
  %216 = load float, ptr %return_buffer31, align 4
  store float %216, ptr %215, align 4
  %217 = mul nuw nsw i32 %104, 1
  %218 = add nuw nsw i32 0, %217
  %219 = mul nuw nsw i32 %106, 1600
  %220 = add nuw nsw i32 %218, %219
  %221 = urem i32 %220, 100
  %222 = udiv i32 %220, 100
  %223 = udiv i32 %222, 8192
  %224 = mul nuw nsw i32 %107, 1
  %225 = add nuw nsw i32 0, %224
  %226 = udiv i32 %225, 4
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !48
  %Arg_0.132 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.133 = load float, ptr %Arg_0.132, align 4, !invariant.load !48
  %multiply.8 = fmul float %Arg_1.2, %Arg_0.133
  %227 = mul nuw nsw i32 %104, 1
  %228 = add nuw nsw i32 0, %227
  %229 = mul nuw nsw i32 %106, 1600
  %230 = add nuw nsw i32 %228, %229
  %231 = urem i32 %230, 100
  %232 = udiv i32 %230, 100
  %233 = udiv i32 %232, 8192
  %234 = mul nuw nsw i32 %107, 1
  %235 = add nuw nsw i32 0, %234
  %236 = udiv i32 %235, 4
  %237 = getelementptr inbounds float, ptr %arg6, i32 %102
  store float %multiply.8, ptr %237, align 4
  %238 = mul i32 %tile_loop.indvar, 256
  %239 = add i32 %238, 1
  %x_loc34 = add i32 %239, %90
  %240 = add i32 %tile_origin.1, %y_in_tile.indvar
  %241 = add i32 %tile_origin.2, %x_loc34
  %242 = mul nuw nsw i32 %241, 1
  %243 = add nuw nsw i32 0, %242
  %244 = mul nuw nsw i32 %240, 1600
  %245 = add nuw nsw i32 %243, %244
  %246 = mul nuw nsw i32 %tile_origin.0, 3276800
  %247 = add nuw nsw i32 %245, %246
  %248 = udiv i32 %247, 1
  %249 = urem i32 %248, 1600
  %250 = udiv i32 %247, 1600
  %251 = urem i32 %250, 512
  %252 = udiv i32 %247, 819200
  %253 = mul nuw nsw i32 %249, 1
  %254 = add nuw nsw i32 0, %253
  %255 = mul nuw nsw i32 %251, 1600
  %256 = add nuw nsw i32 %254, %255
  %257 = urem i32 %256, 100
  %258 = udiv i32 %256, 100
  %259 = udiv i32 %258, 1
  %260 = udiv i32 %259, 8192
  %261 = mul nuw nsw i32 %252, 1
  %262 = add nuw nsw i32 0, %261
  %263 = udiv i32 %262, 4
  %Arg_0.135 = getelementptr inbounds float, ptr %arg0, i32 %247
  %Arg_0.136 = load float, ptr %Arg_0.135, align 4, !invariant.load !48
  store float %Arg_0.136, ptr %reduction_input_address, align 4
  %264 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_12(ptr %264, ptr %reduction_input_address, ptr %return_buffer37)
  %265 = load float, ptr %return_buffer37, align 4
  store float %265, ptr %264, align 4
  %266 = mul nuw nsw i32 %249, 1
  %267 = add nuw nsw i32 0, %266
  %268 = mul nuw nsw i32 %251, 1600
  %269 = add nuw nsw i32 %267, %268
  %270 = udiv i32 %269, 819200
  %271 = mul nuw nsw i32 %252, 1
  %272 = add nuw nsw i32 0, %271
  %273 = udiv i32 %272, 4
  %274 = mul nuw nsw i32 %269, 1
  %275 = add nuw nsw i32 0, %274
  %276 = urem i32 %275, 100
  %277 = udiv i32 %275, 100
  %278 = udiv i32 %277, 1
  %279 = udiv i32 %278, 8192
  %280 = mul nuw nsw i32 %272, 1
  %281 = add nuw nsw i32 0, %280
  %282 = udiv i32 %281, 4
  %Arg_0.138 = getelementptr inbounds float, ptr %arg0, i32 %247
  %Arg_0.139 = load float, ptr %Arg_0.138, align 4, !invariant.load !48
  %283 = mul nuw nsw i32 %269, 1
  %284 = add nuw nsw i32 0, %283
  %285 = urem i32 %284, 100
  %286 = udiv i32 %284, 100
  %287 = udiv i32 %286, 8192
  %Arg_2.340 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg2, i32 0, i32 %286, i32 %285, i32 0
  %Arg_2.341 = load float, ptr %Arg_2.340, align 4, !invariant.load !48
  %multiply.2042 = fmul float %Arg_0.139, %Arg_2.341
  store float %multiply.2042, ptr %reduction_input_address1, align 4
  %288 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_22(ptr %288, ptr %reduction_input_address1, ptr %return_buffer43)
  %289 = load float, ptr %return_buffer43, align 4
  store float %289, ptr %288, align 4
  %290 = mul nuw nsw i32 %249, 1
  %291 = add nuw nsw i32 0, %290
  %292 = mul nuw nsw i32 %251, 1600
  %293 = add nuw nsw i32 %291, %292
  %294 = udiv i32 %293, 819200
  %295 = mul nuw nsw i32 %252, 1
  %296 = add nuw nsw i32 0, %295
  %297 = udiv i32 %296, 4
  %298 = mul nuw nsw i32 %293, 1
  %299 = add nuw nsw i32 0, %298
  %300 = urem i32 %299, 100
  %301 = udiv i32 %299, 100
  %302 = udiv i32 %301, 1
  %303 = udiv i32 %302, 8192
  %304 = mul nuw nsw i32 %296, 1
  %305 = add nuw nsw i32 0, %304
  %306 = udiv i32 %305, 4
  %Arg_0.144 = getelementptr inbounds float, ptr %arg0, i32 %247
  %Arg_0.145 = load float, ptr %Arg_0.144, align 4, !invariant.load !48
  %307 = mul nuw nsw i32 %293, 1
  %308 = add nuw nsw i32 0, %307
  %309 = urem i32 %308, 100
  %310 = udiv i32 %308, 100
  %311 = udiv i32 %310, 8192
  %Arg_3.446 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg3, i32 0, i32 %310, i32 %309, i32 0
  %Arg_3.447 = load float, ptr %Arg_3.446, align 4, !invariant.load !48
  %multiply.2948 = fmul float %Arg_0.145, %Arg_3.447
  store float %multiply.2948, ptr %reduction_input_address4, align 4
  %312 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_31(ptr %312, ptr %reduction_input_address4, ptr %return_buffer49)
  %313 = load float, ptr %return_buffer49, align 4
  store float %313, ptr %312, align 4
  %314 = mul nuw nsw i32 %249, 1
  %315 = add nuw nsw i32 0, %314
  %316 = mul nuw nsw i32 %251, 1600
  %317 = add nuw nsw i32 %315, %316
  %318 = udiv i32 %317, 819200
  %319 = mul nuw nsw i32 %252, 1
  %320 = add nuw nsw i32 0, %319
  %321 = udiv i32 %320, 4
  %322 = mul nuw nsw i32 %317, 1
  %323 = add nuw nsw i32 0, %322
  %324 = urem i32 %323, 100
  %325 = udiv i32 %323, 100
  %326 = udiv i32 %325, 1
  %327 = udiv i32 %326, 8192
  %328 = mul nuw nsw i32 %320, 1
  %329 = add nuw nsw i32 0, %328
  %330 = udiv i32 %329, 4
  %Arg_0.150 = getelementptr inbounds float, ptr %arg0, i32 %247
  %Arg_0.151 = load float, ptr %Arg_0.150, align 4, !invariant.load !48
  %331 = mul nuw nsw i32 %317, 1
  %332 = add nuw nsw i32 0, %331
  %333 = urem i32 %332, 100
  %334 = udiv i32 %332, 100
  %335 = udiv i32 %334, 8192
  %Arg_4.552 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %334, i32 %333, i32 0
  %Arg_4.553 = load float, ptr %Arg_4.552, align 4, !invariant.load !48
  %multiply.3854 = fmul float %Arg_0.151, %Arg_4.553
  store float %multiply.3854, ptr %reduction_input_address7, align 4
  %336 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_40(ptr %336, ptr %reduction_input_address7, ptr %return_buffer55)
  %337 = load float, ptr %return_buffer55, align 4
  store float %337, ptr %336, align 4
  %338 = mul nuw nsw i32 %249, 1
  %339 = add nuw nsw i32 0, %338
  %340 = mul nuw nsw i32 %251, 1600
  %341 = add nuw nsw i32 %339, %340
  %342 = udiv i32 %341, 819200
  %343 = mul nuw nsw i32 %252, 1
  %344 = add nuw nsw i32 0, %343
  %345 = udiv i32 %344, 4
  %346 = mul nuw nsw i32 %341, 1
  %347 = add nuw nsw i32 0, %346
  %348 = urem i32 %347, 100
  %349 = udiv i32 %347, 100
  %350 = udiv i32 %349, 1
  %351 = udiv i32 %350, 8192
  %352 = mul nuw nsw i32 %344, 1
  %353 = add nuw nsw i32 0, %352
  %354 = udiv i32 %353, 4
  %Arg_0.156 = getelementptr inbounds float, ptr %arg0, i32 %247
  %Arg_0.157 = load float, ptr %Arg_0.156, align 4, !invariant.load !48
  %355 = mul nuw nsw i32 %341, 1
  %356 = add nuw nsw i32 0, %355
  %357 = urem i32 %356, 100
  %358 = udiv i32 %356, 100
  %359 = udiv i32 %358, 8192
  %Arg_5.658 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg5, i32 0, i32 %358, i32 %357, i32 0
  %Arg_5.659 = load float, ptr %Arg_5.658, align 4, !invariant.load !48
  %multiply.4760 = fmul float %Arg_0.157, %Arg_5.659
  store float %multiply.4760, ptr %reduction_input_address10, align 4
  %360 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  call void @region_5_49(ptr %360, ptr %reduction_input_address10, ptr %return_buffer61)
  %361 = load float, ptr %return_buffer61, align 4
  store float %361, ptr %360, align 4
  %362 = mul nuw nsw i32 %249, 1
  %363 = add nuw nsw i32 0, %362
  %364 = mul nuw nsw i32 %251, 1600
  %365 = add nuw nsw i32 %363, %364
  %366 = urem i32 %365, 100
  %367 = udiv i32 %365, 100
  %368 = udiv i32 %367, 8192
  %369 = mul nuw nsw i32 %252, 1
  %370 = add nuw nsw i32 0, %369
  %371 = udiv i32 %370, 4
  %Arg_1.262 = load float, ptr %arg1, align 4, !invariant.load !48
  %Arg_0.163 = getelementptr inbounds float, ptr %arg0, i32 %247
  %Arg_0.164 = load float, ptr %Arg_0.163, align 4, !invariant.load !48
  %multiply.865 = fmul float %Arg_1.262, %Arg_0.164
  %372 = mul nuw nsw i32 %249, 1
  %373 = add nuw nsw i32 0, %372
  %374 = mul nuw nsw i32 %251, 1600
  %375 = add nuw nsw i32 %373, %374
  %376 = urem i32 %375, 100
  %377 = udiv i32 %375, 100
  %378 = udiv i32 %377, 8192
  %379 = mul nuw nsw i32 %252, 1
  %380 = add nuw nsw i32 0, %379
  %381 = udiv i32 %380, 4
  %382 = getelementptr inbounds float, ptr %arg6, i32 %247
  store float %multiply.865, ptr %382, align 4
  br label %tile_loop.loop_header, !llvm.loop !69

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %383 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address69, align 4
  br label %tile_loop.loop_header67

tile_loop.loop_header67:                          ; preds = %x_in_tile-after106, %is_full_tile-false
  %tile_loop.indvar70 = load i32, ptr %tile_loop.invar_address69, align 4
  %384 = icmp uge i32 %tile_loop.indvar70, 8
  br i1 %384, label %tile_loop.loop_exit66, label %tile_loop.loop_body68

tile_loop.loop_body68:                            ; preds = %tile_loop.loop_header67
  %invar.inc71 = add nuw nsw i32 %tile_loop.indvar70, 1
  store i32 %invar.inc71, ptr %tile_loop.invar_address69, align 4
  %385 = icmp eq i32 %tile_loop.indvar70, 0
  %386 = mul i32 %tile_loop.indvar70, 256
  %387 = add i32 %386, 0
  %x_loc72 = add i32 %387, %383
  %388 = add i32 %tile_origin.1, %y_in_tile.indvar
  %389 = add i32 %tile_origin.2, %x_loc72
  %390 = icmp ult i32 %x_loc72, %tile_bound13
  br i1 %390, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body68
  %391 = mul i32 %tile_loop.indvar70, 256
  %392 = add i32 %391, 1
  %x_loc104 = add i32 %392, %383
  %393 = add i32 %tile_origin.1, %y_in_tile.indvar
  %394 = add i32 %tile_origin.2, %x_loc104
  %395 = icmp ult i32 %x_loc104, %tile_bound13
  br i1 %395, label %x_in_tile-true105, label %x_in_tile-after106

x_in_tile-after106:                               ; preds = %x_in_tile-true105, %x_in_tile-after
  br label %tile_loop.loop_header67, !llvm.loop !70

tile_loop.loop_exit66:                            ; preds = %tile_loop.loop_header67
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body68
  %396 = mul nuw nsw i32 %389, 1
  %397 = add nuw nsw i32 0, %396
  %398 = mul nuw nsw i32 %388, 1600
  %399 = add nuw nsw i32 %397, %398
  %400 = mul nuw nsw i32 %tile_origin.0, 3276800
  %401 = add nuw nsw i32 %399, %400
  %402 = udiv i32 %401, 1
  %403 = urem i32 %402, 1600
  %404 = udiv i32 %401, 1600
  %405 = urem i32 %404, 512
  %406 = udiv i32 %401, 819200
  %407 = mul nuw nsw i32 %403, 1
  %408 = add nuw nsw i32 0, %407
  %409 = mul nuw nsw i32 %405, 1600
  %410 = add nuw nsw i32 %408, %409
  %411 = urem i32 %410, 100
  %412 = udiv i32 %410, 100
  %413 = udiv i32 %412, 1
  %414 = udiv i32 %413, 8192
  %415 = mul nuw nsw i32 %406, 1
  %416 = add nuw nsw i32 0, %415
  %417 = udiv i32 %416, 4
  %Arg_0.173 = getelementptr inbounds float, ptr %arg0, i32 %401
  %Arg_0.174 = load float, ptr %Arg_0.173, align 4, !invariant.load !48
  store float %Arg_0.174, ptr %reduction_input_address, align 4
  %418 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_12(ptr %418, ptr %reduction_input_address, ptr %return_buffer75)
  %419 = load float, ptr %return_buffer75, align 4
  store float %419, ptr %418, align 4
  %420 = mul nuw nsw i32 %403, 1
  %421 = add nuw nsw i32 0, %420
  %422 = mul nuw nsw i32 %405, 1600
  %423 = add nuw nsw i32 %421, %422
  %424 = udiv i32 %423, 819200
  %425 = mul nuw nsw i32 %406, 1
  %426 = add nuw nsw i32 0, %425
  %427 = udiv i32 %426, 4
  %428 = mul nuw nsw i32 %423, 1
  %429 = add nuw nsw i32 0, %428
  %430 = urem i32 %429, 100
  %431 = udiv i32 %429, 100
  %432 = udiv i32 %431, 1
  %433 = udiv i32 %432, 8192
  %434 = mul nuw nsw i32 %426, 1
  %435 = add nuw nsw i32 0, %434
  %436 = udiv i32 %435, 4
  %Arg_0.176 = getelementptr inbounds float, ptr %arg0, i32 %401
  %Arg_0.177 = load float, ptr %Arg_0.176, align 4, !invariant.load !48
  %437 = mul nuw nsw i32 %423, 1
  %438 = add nuw nsw i32 0, %437
  %439 = urem i32 %438, 100
  %440 = udiv i32 %438, 100
  %441 = udiv i32 %440, 8192
  %Arg_2.378 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg2, i32 0, i32 %440, i32 %439, i32 0
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !48
  %multiply.2080 = fmul float %Arg_0.177, %Arg_2.379
  store float %multiply.2080, ptr %reduction_input_address1, align 4
  %442 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_22(ptr %442, ptr %reduction_input_address1, ptr %return_buffer81)
  %443 = load float, ptr %return_buffer81, align 4
  store float %443, ptr %442, align 4
  %444 = mul nuw nsw i32 %403, 1
  %445 = add nuw nsw i32 0, %444
  %446 = mul nuw nsw i32 %405, 1600
  %447 = add nuw nsw i32 %445, %446
  %448 = udiv i32 %447, 819200
  %449 = mul nuw nsw i32 %406, 1
  %450 = add nuw nsw i32 0, %449
  %451 = udiv i32 %450, 4
  %452 = mul nuw nsw i32 %447, 1
  %453 = add nuw nsw i32 0, %452
  %454 = urem i32 %453, 100
  %455 = udiv i32 %453, 100
  %456 = udiv i32 %455, 1
  %457 = udiv i32 %456, 8192
  %458 = mul nuw nsw i32 %450, 1
  %459 = add nuw nsw i32 0, %458
  %460 = udiv i32 %459, 4
  %Arg_0.182 = getelementptr inbounds float, ptr %arg0, i32 %401
  %Arg_0.183 = load float, ptr %Arg_0.182, align 4, !invariant.load !48
  %461 = mul nuw nsw i32 %447, 1
  %462 = add nuw nsw i32 0, %461
  %463 = urem i32 %462, 100
  %464 = udiv i32 %462, 100
  %465 = udiv i32 %464, 8192
  %Arg_3.484 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg3, i32 0, i32 %464, i32 %463, i32 0
  %Arg_3.485 = load float, ptr %Arg_3.484, align 4, !invariant.load !48
  %multiply.2986 = fmul float %Arg_0.183, %Arg_3.485
  store float %multiply.2986, ptr %reduction_input_address4, align 4
  %466 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_31(ptr %466, ptr %reduction_input_address4, ptr %return_buffer87)
  %467 = load float, ptr %return_buffer87, align 4
  store float %467, ptr %466, align 4
  %468 = mul nuw nsw i32 %403, 1
  %469 = add nuw nsw i32 0, %468
  %470 = mul nuw nsw i32 %405, 1600
  %471 = add nuw nsw i32 %469, %470
  %472 = udiv i32 %471, 819200
  %473 = mul nuw nsw i32 %406, 1
  %474 = add nuw nsw i32 0, %473
  %475 = udiv i32 %474, 4
  %476 = mul nuw nsw i32 %471, 1
  %477 = add nuw nsw i32 0, %476
  %478 = urem i32 %477, 100
  %479 = udiv i32 %477, 100
  %480 = udiv i32 %479, 1
  %481 = udiv i32 %480, 8192
  %482 = mul nuw nsw i32 %474, 1
  %483 = add nuw nsw i32 0, %482
  %484 = udiv i32 %483, 4
  %Arg_0.188 = getelementptr inbounds float, ptr %arg0, i32 %401
  %Arg_0.189 = load float, ptr %Arg_0.188, align 4, !invariant.load !48
  %485 = mul nuw nsw i32 %471, 1
  %486 = add nuw nsw i32 0, %485
  %487 = urem i32 %486, 100
  %488 = udiv i32 %486, 100
  %489 = udiv i32 %488, 8192
  %Arg_4.590 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %488, i32 %487, i32 0
  %Arg_4.591 = load float, ptr %Arg_4.590, align 4, !invariant.load !48
  %multiply.3892 = fmul float %Arg_0.189, %Arg_4.591
  store float %multiply.3892, ptr %reduction_input_address7, align 4
  %490 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_40(ptr %490, ptr %reduction_input_address7, ptr %return_buffer93)
  %491 = load float, ptr %return_buffer93, align 4
  store float %491, ptr %490, align 4
  %492 = mul nuw nsw i32 %403, 1
  %493 = add nuw nsw i32 0, %492
  %494 = mul nuw nsw i32 %405, 1600
  %495 = add nuw nsw i32 %493, %494
  %496 = udiv i32 %495, 819200
  %497 = mul nuw nsw i32 %406, 1
  %498 = add nuw nsw i32 0, %497
  %499 = udiv i32 %498, 4
  %500 = mul nuw nsw i32 %495, 1
  %501 = add nuw nsw i32 0, %500
  %502 = urem i32 %501, 100
  %503 = udiv i32 %501, 100
  %504 = udiv i32 %503, 1
  %505 = udiv i32 %504, 8192
  %506 = mul nuw nsw i32 %498, 1
  %507 = add nuw nsw i32 0, %506
  %508 = udiv i32 %507, 4
  %Arg_0.194 = getelementptr inbounds float, ptr %arg0, i32 %401
  %Arg_0.195 = load float, ptr %Arg_0.194, align 4, !invariant.load !48
  %509 = mul nuw nsw i32 %495, 1
  %510 = add nuw nsw i32 0, %509
  %511 = urem i32 %510, 100
  %512 = udiv i32 %510, 100
  %513 = udiv i32 %512, 8192
  %Arg_5.696 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg5, i32 0, i32 %512, i32 %511, i32 0
  %Arg_5.697 = load float, ptr %Arg_5.696, align 4, !invariant.load !48
  %multiply.4798 = fmul float %Arg_0.195, %Arg_5.697
  store float %multiply.4798, ptr %reduction_input_address10, align 4
  %514 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  call void @region_5_49(ptr %514, ptr %reduction_input_address10, ptr %return_buffer99)
  %515 = load float, ptr %return_buffer99, align 4
  store float %515, ptr %514, align 4
  %516 = mul nuw nsw i32 %403, 1
  %517 = add nuw nsw i32 0, %516
  %518 = mul nuw nsw i32 %405, 1600
  %519 = add nuw nsw i32 %517, %518
  %520 = urem i32 %519, 100
  %521 = udiv i32 %519, 100
  %522 = udiv i32 %521, 8192
  %523 = mul nuw nsw i32 %406, 1
  %524 = add nuw nsw i32 0, %523
  %525 = udiv i32 %524, 4
  %Arg_1.2100 = load float, ptr %arg1, align 4, !invariant.load !48
  %Arg_0.1101 = getelementptr inbounds float, ptr %arg0, i32 %401
  %Arg_0.1102 = load float, ptr %Arg_0.1101, align 4, !invariant.load !48
  %multiply.8103 = fmul float %Arg_1.2100, %Arg_0.1102
  %526 = mul nuw nsw i32 %403, 1
  %527 = add nuw nsw i32 0, %526
  %528 = mul nuw nsw i32 %405, 1600
  %529 = add nuw nsw i32 %527, %528
  %530 = urem i32 %529, 100
  %531 = udiv i32 %529, 100
  %532 = udiv i32 %531, 8192
  %533 = mul nuw nsw i32 %406, 1
  %534 = add nuw nsw i32 0, %533
  %535 = udiv i32 %534, 4
  %536 = getelementptr inbounds float, ptr %arg6, i32 %401
  store float %multiply.8103, ptr %536, align 4
  br label %x_in_tile-after

x_in_tile-true105:                                ; preds = %x_in_tile-after
  %537 = mul nuw nsw i32 %394, 1
  %538 = add nuw nsw i32 0, %537
  %539 = mul nuw nsw i32 %393, 1600
  %540 = add nuw nsw i32 %538, %539
  %541 = mul nuw nsw i32 %tile_origin.0, 3276800
  %542 = add nuw nsw i32 %540, %541
  %543 = udiv i32 %542, 1
  %544 = urem i32 %543, 1600
  %545 = udiv i32 %542, 1600
  %546 = urem i32 %545, 512
  %547 = udiv i32 %542, 819200
  %548 = mul nuw nsw i32 %544, 1
  %549 = add nuw nsw i32 0, %548
  %550 = mul nuw nsw i32 %546, 1600
  %551 = add nuw nsw i32 %549, %550
  %552 = urem i32 %551, 100
  %553 = udiv i32 %551, 100
  %554 = udiv i32 %553, 1
  %555 = udiv i32 %554, 8192
  %556 = mul nuw nsw i32 %547, 1
  %557 = add nuw nsw i32 0, %556
  %558 = udiv i32 %557, 4
  %Arg_0.1107 = getelementptr inbounds float, ptr %arg0, i32 %542
  %Arg_0.1108 = load float, ptr %Arg_0.1107, align 4, !invariant.load !48
  store float %Arg_0.1108, ptr %reduction_input_address, align 4
  %559 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_12(ptr %559, ptr %reduction_input_address, ptr %return_buffer109)
  %560 = load float, ptr %return_buffer109, align 4
  store float %560, ptr %559, align 4
  %561 = mul nuw nsw i32 %544, 1
  %562 = add nuw nsw i32 0, %561
  %563 = mul nuw nsw i32 %546, 1600
  %564 = add nuw nsw i32 %562, %563
  %565 = udiv i32 %564, 819200
  %566 = mul nuw nsw i32 %547, 1
  %567 = add nuw nsw i32 0, %566
  %568 = udiv i32 %567, 4
  %569 = mul nuw nsw i32 %564, 1
  %570 = add nuw nsw i32 0, %569
  %571 = urem i32 %570, 100
  %572 = udiv i32 %570, 100
  %573 = udiv i32 %572, 1
  %574 = udiv i32 %573, 8192
  %575 = mul nuw nsw i32 %567, 1
  %576 = add nuw nsw i32 0, %575
  %577 = udiv i32 %576, 4
  %Arg_0.1110 = getelementptr inbounds float, ptr %arg0, i32 %542
  %Arg_0.1111 = load float, ptr %Arg_0.1110, align 4, !invariant.load !48
  %578 = mul nuw nsw i32 %564, 1
  %579 = add nuw nsw i32 0, %578
  %580 = urem i32 %579, 100
  %581 = udiv i32 %579, 100
  %582 = udiv i32 %581, 8192
  %Arg_2.3112 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg2, i32 0, i32 %581, i32 %580, i32 0
  %Arg_2.3113 = load float, ptr %Arg_2.3112, align 4, !invariant.load !48
  %multiply.20114 = fmul float %Arg_0.1111, %Arg_2.3113
  store float %multiply.20114, ptr %reduction_input_address1, align 4
  %583 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_22(ptr %583, ptr %reduction_input_address1, ptr %return_buffer115)
  %584 = load float, ptr %return_buffer115, align 4
  store float %584, ptr %583, align 4
  %585 = mul nuw nsw i32 %544, 1
  %586 = add nuw nsw i32 0, %585
  %587 = mul nuw nsw i32 %546, 1600
  %588 = add nuw nsw i32 %586, %587
  %589 = udiv i32 %588, 819200
  %590 = mul nuw nsw i32 %547, 1
  %591 = add nuw nsw i32 0, %590
  %592 = udiv i32 %591, 4
  %593 = mul nuw nsw i32 %588, 1
  %594 = add nuw nsw i32 0, %593
  %595 = urem i32 %594, 100
  %596 = udiv i32 %594, 100
  %597 = udiv i32 %596, 1
  %598 = udiv i32 %597, 8192
  %599 = mul nuw nsw i32 %591, 1
  %600 = add nuw nsw i32 0, %599
  %601 = udiv i32 %600, 4
  %Arg_0.1116 = getelementptr inbounds float, ptr %arg0, i32 %542
  %Arg_0.1117 = load float, ptr %Arg_0.1116, align 4, !invariant.load !48
  %602 = mul nuw nsw i32 %588, 1
  %603 = add nuw nsw i32 0, %602
  %604 = urem i32 %603, 100
  %605 = udiv i32 %603, 100
  %606 = udiv i32 %605, 8192
  %Arg_3.4118 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg3, i32 0, i32 %605, i32 %604, i32 0
  %Arg_3.4119 = load float, ptr %Arg_3.4118, align 4, !invariant.load !48
  %multiply.29120 = fmul float %Arg_0.1117, %Arg_3.4119
  store float %multiply.29120, ptr %reduction_input_address4, align 4
  %607 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_31(ptr %607, ptr %reduction_input_address4, ptr %return_buffer121)
  %608 = load float, ptr %return_buffer121, align 4
  store float %608, ptr %607, align 4
  %609 = mul nuw nsw i32 %544, 1
  %610 = add nuw nsw i32 0, %609
  %611 = mul nuw nsw i32 %546, 1600
  %612 = add nuw nsw i32 %610, %611
  %613 = udiv i32 %612, 819200
  %614 = mul nuw nsw i32 %547, 1
  %615 = add nuw nsw i32 0, %614
  %616 = udiv i32 %615, 4
  %617 = mul nuw nsw i32 %612, 1
  %618 = add nuw nsw i32 0, %617
  %619 = urem i32 %618, 100
  %620 = udiv i32 %618, 100
  %621 = udiv i32 %620, 1
  %622 = udiv i32 %621, 8192
  %623 = mul nuw nsw i32 %615, 1
  %624 = add nuw nsw i32 0, %623
  %625 = udiv i32 %624, 4
  %Arg_0.1122 = getelementptr inbounds float, ptr %arg0, i32 %542
  %Arg_0.1123 = load float, ptr %Arg_0.1122, align 4, !invariant.load !48
  %626 = mul nuw nsw i32 %612, 1
  %627 = add nuw nsw i32 0, %626
  %628 = urem i32 %627, 100
  %629 = udiv i32 %627, 100
  %630 = udiv i32 %629, 8192
  %Arg_4.5124 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %629, i32 %628, i32 0
  %Arg_4.5125 = load float, ptr %Arg_4.5124, align 4, !invariant.load !48
  %multiply.38126 = fmul float %Arg_0.1123, %Arg_4.5125
  store float %multiply.38126, ptr %reduction_input_address7, align 4
  %631 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_40(ptr %631, ptr %reduction_input_address7, ptr %return_buffer127)
  %632 = load float, ptr %return_buffer127, align 4
  store float %632, ptr %631, align 4
  %633 = mul nuw nsw i32 %544, 1
  %634 = add nuw nsw i32 0, %633
  %635 = mul nuw nsw i32 %546, 1600
  %636 = add nuw nsw i32 %634, %635
  %637 = udiv i32 %636, 819200
  %638 = mul nuw nsw i32 %547, 1
  %639 = add nuw nsw i32 0, %638
  %640 = udiv i32 %639, 4
  %641 = mul nuw nsw i32 %636, 1
  %642 = add nuw nsw i32 0, %641
  %643 = urem i32 %642, 100
  %644 = udiv i32 %642, 100
  %645 = udiv i32 %644, 1
  %646 = udiv i32 %645, 8192
  %647 = mul nuw nsw i32 %639, 1
  %648 = add nuw nsw i32 0, %647
  %649 = udiv i32 %648, 4
  %Arg_0.1128 = getelementptr inbounds float, ptr %arg0, i32 %542
  %Arg_0.1129 = load float, ptr %Arg_0.1128, align 4, !invariant.load !48
  %650 = mul nuw nsw i32 %636, 1
  %651 = add nuw nsw i32 0, %650
  %652 = urem i32 %651, 100
  %653 = udiv i32 %651, 100
  %654 = udiv i32 %653, 8192
  %Arg_5.6130 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg5, i32 0, i32 %653, i32 %652, i32 0
  %Arg_5.6131 = load float, ptr %Arg_5.6130, align 4, !invariant.load !48
  %multiply.47132 = fmul float %Arg_0.1129, %Arg_5.6131
  store float %multiply.47132, ptr %reduction_input_address10, align 4
  %655 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  call void @region_5_49(ptr %655, ptr %reduction_input_address10, ptr %return_buffer133)
  %656 = load float, ptr %return_buffer133, align 4
  store float %656, ptr %655, align 4
  %657 = mul nuw nsw i32 %544, 1
  %658 = add nuw nsw i32 0, %657
  %659 = mul nuw nsw i32 %546, 1600
  %660 = add nuw nsw i32 %658, %659
  %661 = urem i32 %660, 100
  %662 = udiv i32 %660, 100
  %663 = udiv i32 %662, 8192
  %664 = mul nuw nsw i32 %547, 1
  %665 = add nuw nsw i32 0, %664
  %666 = udiv i32 %665, 4
  %Arg_1.2134 = load float, ptr %arg1, align 4, !invariant.load !48
  %Arg_0.1135 = getelementptr inbounds float, ptr %arg0, i32 %542
  %Arg_0.1136 = load float, ptr %Arg_0.1135, align 4, !invariant.load !48
  %multiply.8137 = fmul float %Arg_1.2134, %Arg_0.1136
  %667 = mul nuw nsw i32 %544, 1
  %668 = add nuw nsw i32 0, %667
  %669 = mul nuw nsw i32 %546, 1600
  %670 = add nuw nsw i32 %668, %669
  %671 = urem i32 %670, 100
  %672 = udiv i32 %670, 100
  %673 = udiv i32 %672, 8192
  %674 = mul nuw nsw i32 %547, 1
  %675 = add nuw nsw i32 0, %674
  %676 = udiv i32 %675, 4
  %677 = getelementptr inbounds float, ptr %arg6, i32 %542
  store float %multiply.8137, ptr %677, align 4
  br label %x_in_tile-after106

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %678 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %10, i32 0, i32 %35
  %679 = addrspacecast ptr addrspace(3) %678 to ptr
  %680 = load float, ptr %current_output, align 4
  store float %680, ptr %679, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %681 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %10, i32 0, i32 %lane_id
  %682 = addrspacecast ptr addrspace(3) %681 to ptr
  store float %region_0_55_constant_11, ptr %initial_value_addr, align 4
  %683 = icmp ult i32 %thread_id.x, 4
  %684 = select i1 %683, ptr %682, ptr %initial_value_addr
  %partial_reduction_result153 = load float, ptr %684, align 4
  %685 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result153, i32 16, i32 31)
  store float %685, ptr %result_from_other_lane152, align 4
  call void @region_1_12(ptr %684, ptr %result_from_other_lane152, ptr %return_buffer154)
  %686 = load float, ptr %return_buffer154, align 4
  store float %686, ptr %684, align 4
  %partial_reduction_result156 = load float, ptr %684, align 4
  %687 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result156, i32 8, i32 31)
  store float %687, ptr %result_from_other_lane155, align 4
  call void @region_1_12(ptr %684, ptr %result_from_other_lane155, ptr %return_buffer157)
  %688 = load float, ptr %return_buffer157, align 4
  store float %688, ptr %684, align 4
  %partial_reduction_result159 = load float, ptr %684, align 4
  %689 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result159, i32 4, i32 31)
  store float %689, ptr %result_from_other_lane158, align 4
  call void @region_1_12(ptr %684, ptr %result_from_other_lane158, ptr %return_buffer160)
  %690 = load float, ptr %return_buffer160, align 4
  store float %690, ptr %684, align 4
  %partial_reduction_result162 = load float, ptr %684, align 4
  %691 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result162, i32 2, i32 31)
  store float %691, ptr %result_from_other_lane161, align 4
  call void @region_1_12(ptr %684, ptr %result_from_other_lane161, ptr %return_buffer163)
  %692 = load float, ptr %return_buffer163, align 4
  store float %692, ptr %684, align 4
  %partial_reduction_result165 = load float, ptr %684, align 4
  %693 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result165, i32 1, i32 31)
  store float %693, ptr %result_from_other_lane164, align 4
  call void @region_1_12(ptr %684, ptr %result_from_other_lane164, ptr %return_buffer166)
  %694 = load float, ptr %return_buffer166, align 4
  store float %694, ptr %684, align 4
  %695 = icmp eq i32 %thread_id.x, 0
  br i1 %695, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %696 = mul i32 %thread_id.x, 2
  %697 = add i32 %tile_origin.1, %thread_id.y
  %698 = add i32 %tile_origin.2, %696
  %699 = add i32 %698, 0
  %700 = udiv i32 %697, 1
  %701 = urem i32 %700, 512
  %702 = udiv i32 %697, 512
  %output_element_address = getelementptr inbounds [4 x [512 x float]], ptr %arg7, i32 0, i32 %702, i32 %701
  %output = load float, ptr %684, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

intra_warp_reduce_write-true183:                  ; preds = %inter_warp_reduce-after
  %703 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %10, i32 0, i32 %48
  %704 = addrspacecast ptr addrspace(3) %703 to ptr
  %705 = load float, ptr %current_output167, align 4
  store float %705, ptr %704, align 4
  br label %intra_warp_reduce_write-after184

inter_warp_reduce-true185:                        ; preds = %intra_warp_reduce_write-after184
  %706 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %10, i32 0, i32 %lane_id
  %707 = addrspacecast ptr addrspace(3) %706 to ptr
  store float %region_0_55_constant_113, ptr %initial_value_addr187, align 4
  %708 = icmp ult i32 %thread_id.x, 4
  %709 = select i1 %708, ptr %707, ptr %initial_value_addr187
  %partial_reduction_result189 = load float, ptr %709, align 4
  %710 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result189, i32 16, i32 31)
  store float %710, ptr %result_from_other_lane188, align 4
  call void @region_2_22(ptr %709, ptr %result_from_other_lane188, ptr %return_buffer190)
  %711 = load float, ptr %return_buffer190, align 4
  store float %711, ptr %709, align 4
  %partial_reduction_result192 = load float, ptr %709, align 4
  %712 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result192, i32 8, i32 31)
  store float %712, ptr %result_from_other_lane191, align 4
  call void @region_2_22(ptr %709, ptr %result_from_other_lane191, ptr %return_buffer193)
  %713 = load float, ptr %return_buffer193, align 4
  store float %713, ptr %709, align 4
  %partial_reduction_result195 = load float, ptr %709, align 4
  %714 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result195, i32 4, i32 31)
  store float %714, ptr %result_from_other_lane194, align 4
  call void @region_2_22(ptr %709, ptr %result_from_other_lane194, ptr %return_buffer196)
  %715 = load float, ptr %return_buffer196, align 4
  store float %715, ptr %709, align 4
  %partial_reduction_result198 = load float, ptr %709, align 4
  %716 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result198, i32 2, i32 31)
  store float %716, ptr %result_from_other_lane197, align 4
  call void @region_2_22(ptr %709, ptr %result_from_other_lane197, ptr %return_buffer199)
  %717 = load float, ptr %return_buffer199, align 4
  store float %717, ptr %709, align 4
  %partial_reduction_result201 = load float, ptr %709, align 4
  %718 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result201, i32 1, i32 31)
  store float %718, ptr %result_from_other_lane200, align 4
  call void @region_2_22(ptr %709, ptr %result_from_other_lane200, ptr %return_buffer202)
  %719 = load float, ptr %return_buffer202, align 4
  store float %719, ptr %709, align 4
  %720 = icmp eq i32 %thread_id.x, 0
  br i1 %720, label %reduction_write_output-true203, label %reduction_write_output-after204

reduction_write_output-after204:                  ; preds = %reduction_write_output-true203, %inter_warp_reduce-true185
  br label %inter_warp_reduce-after186

reduction_write_output-true203:                   ; preds = %inter_warp_reduce-true185
  %721 = mul i32 %thread_id.x, 2
  %722 = add i32 %tile_origin.1, %thread_id.y
  %723 = add i32 %tile_origin.2, %721
  %724 = add i32 %723, 0
  %725 = udiv i32 %722, 1
  %726 = urem i32 %725, 512
  %727 = udiv i32 %722, 512
  %output_element_address205 = getelementptr inbounds [4 x [512 x float]], ptr %arg8, i32 0, i32 %727, i32 %726
  %output206 = load float, ptr %709, align 4
  store float %output206, ptr %output_element_address205, align 4
  br label %reduction_write_output-after204

intra_warp_reduce_write-true223:                  ; preds = %inter_warp_reduce-after186
  %728 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %10, i32 0, i32 %61
  %729 = addrspacecast ptr addrspace(3) %728 to ptr
  %730 = load float, ptr %current_output207, align 4
  store float %730, ptr %729, align 4
  br label %intra_warp_reduce_write-after224

inter_warp_reduce-true225:                        ; preds = %intra_warp_reduce_write-after224
  %731 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %10, i32 0, i32 %lane_id
  %732 = addrspacecast ptr addrspace(3) %731 to ptr
  store float %region_0_55_constant_116, ptr %initial_value_addr227, align 4
  %733 = icmp ult i32 %thread_id.x, 4
  %734 = select i1 %733, ptr %732, ptr %initial_value_addr227
  %partial_reduction_result229 = load float, ptr %734, align 4
  %735 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result229, i32 16, i32 31)
  store float %735, ptr %result_from_other_lane228, align 4
  call void @region_3_31(ptr %734, ptr %result_from_other_lane228, ptr %return_buffer230)
  %736 = load float, ptr %return_buffer230, align 4
  store float %736, ptr %734, align 4
  %partial_reduction_result232 = load float, ptr %734, align 4
  %737 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result232, i32 8, i32 31)
  store float %737, ptr %result_from_other_lane231, align 4
  call void @region_3_31(ptr %734, ptr %result_from_other_lane231, ptr %return_buffer233)
  %738 = load float, ptr %return_buffer233, align 4
  store float %738, ptr %734, align 4
  %partial_reduction_result235 = load float, ptr %734, align 4
  %739 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result235, i32 4, i32 31)
  store float %739, ptr %result_from_other_lane234, align 4
  call void @region_3_31(ptr %734, ptr %result_from_other_lane234, ptr %return_buffer236)
  %740 = load float, ptr %return_buffer236, align 4
  store float %740, ptr %734, align 4
  %partial_reduction_result238 = load float, ptr %734, align 4
  %741 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result238, i32 2, i32 31)
  store float %741, ptr %result_from_other_lane237, align 4
  call void @region_3_31(ptr %734, ptr %result_from_other_lane237, ptr %return_buffer239)
  %742 = load float, ptr %return_buffer239, align 4
  store float %742, ptr %734, align 4
  %partial_reduction_result241 = load float, ptr %734, align 4
  %743 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result241, i32 1, i32 31)
  store float %743, ptr %result_from_other_lane240, align 4
  call void @region_3_31(ptr %734, ptr %result_from_other_lane240, ptr %return_buffer242)
  %744 = load float, ptr %return_buffer242, align 4
  store float %744, ptr %734, align 4
  %745 = icmp eq i32 %thread_id.x, 0
  br i1 %745, label %reduction_write_output-true243, label %reduction_write_output-after244

reduction_write_output-after244:                  ; preds = %reduction_write_output-true243, %inter_warp_reduce-true225
  br label %inter_warp_reduce-after226

reduction_write_output-true243:                   ; preds = %inter_warp_reduce-true225
  %746 = mul i32 %thread_id.x, 2
  %747 = add i32 %tile_origin.1, %thread_id.y
  %748 = add i32 %tile_origin.2, %746
  %749 = add i32 %748, 0
  %750 = udiv i32 %747, 1
  %751 = urem i32 %750, 512
  %752 = udiv i32 %747, 512
  %output_element_address245 = getelementptr inbounds [4 x [512 x float]], ptr %arg9, i32 0, i32 %752, i32 %751
  %output246 = load float, ptr %734, align 4
  store float %output246, ptr %output_element_address245, align 4
  br label %reduction_write_output-after244

intra_warp_reduce_write-true263:                  ; preds = %inter_warp_reduce-after226
  %753 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %10, i32 0, i32 %74
  %754 = addrspacecast ptr addrspace(3) %753 to ptr
  %755 = load float, ptr %current_output247, align 4
  store float %755, ptr %754, align 4
  br label %intra_warp_reduce_write-after264

inter_warp_reduce-true265:                        ; preds = %intra_warp_reduce_write-after264
  %756 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %10, i32 0, i32 %lane_id
  %757 = addrspacecast ptr addrspace(3) %756 to ptr
  store float %region_0_55_constant_119, ptr %initial_value_addr267, align 4
  %758 = icmp ult i32 %thread_id.x, 4
  %759 = select i1 %758, ptr %757, ptr %initial_value_addr267
  %partial_reduction_result269 = load float, ptr %759, align 4
  %760 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result269, i32 16, i32 31)
  store float %760, ptr %result_from_other_lane268, align 4
  call void @region_4_40(ptr %759, ptr %result_from_other_lane268, ptr %return_buffer270)
  %761 = load float, ptr %return_buffer270, align 4
  store float %761, ptr %759, align 4
  %partial_reduction_result272 = load float, ptr %759, align 4
  %762 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result272, i32 8, i32 31)
  store float %762, ptr %result_from_other_lane271, align 4
  call void @region_4_40(ptr %759, ptr %result_from_other_lane271, ptr %return_buffer273)
  %763 = load float, ptr %return_buffer273, align 4
  store float %763, ptr %759, align 4
  %partial_reduction_result275 = load float, ptr %759, align 4
  %764 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result275, i32 4, i32 31)
  store float %764, ptr %result_from_other_lane274, align 4
  call void @region_4_40(ptr %759, ptr %result_from_other_lane274, ptr %return_buffer276)
  %765 = load float, ptr %return_buffer276, align 4
  store float %765, ptr %759, align 4
  %partial_reduction_result278 = load float, ptr %759, align 4
  %766 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result278, i32 2, i32 31)
  store float %766, ptr %result_from_other_lane277, align 4
  call void @region_4_40(ptr %759, ptr %result_from_other_lane277, ptr %return_buffer279)
  %767 = load float, ptr %return_buffer279, align 4
  store float %767, ptr %759, align 4
  %partial_reduction_result281 = load float, ptr %759, align 4
  %768 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result281, i32 1, i32 31)
  store float %768, ptr %result_from_other_lane280, align 4
  call void @region_4_40(ptr %759, ptr %result_from_other_lane280, ptr %return_buffer282)
  %769 = load float, ptr %return_buffer282, align 4
  store float %769, ptr %759, align 4
  %770 = icmp eq i32 %thread_id.x, 0
  br i1 %770, label %reduction_write_output-true283, label %reduction_write_output-after284

reduction_write_output-after284:                  ; preds = %reduction_write_output-true283, %inter_warp_reduce-true265
  br label %inter_warp_reduce-after266

reduction_write_output-true283:                   ; preds = %inter_warp_reduce-true265
  %771 = mul i32 %thread_id.x, 2
  %772 = add i32 %tile_origin.1, %thread_id.y
  %773 = add i32 %tile_origin.2, %771
  %774 = add i32 %773, 0
  %775 = udiv i32 %772, 1
  %776 = urem i32 %775, 512
  %777 = udiv i32 %772, 512
  %output_element_address285 = getelementptr inbounds [4 x [512 x float]], ptr %arg10, i32 0, i32 %777, i32 %776
  %output286 = load float, ptr %759, align 4
  store float %output286, ptr %output_element_address285, align 4
  br label %reduction_write_output-after284

intra_warp_reduce_write-true303:                  ; preds = %inter_warp_reduce-after266
  %778 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %10, i32 0, i32 %87
  %779 = addrspacecast ptr addrspace(3) %778 to ptr
  %780 = load float, ptr %current_output287, align 4
  store float %780, ptr %779, align 4
  br label %intra_warp_reduce_write-after304

inter_warp_reduce-true305:                        ; preds = %intra_warp_reduce_write-after304
  %781 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %10, i32 0, i32 %lane_id
  %782 = addrspacecast ptr addrspace(3) %781 to ptr
  store float %region_0_55_constant_1112, ptr %initial_value_addr307, align 4
  %783 = icmp ult i32 %thread_id.x, 4
  %784 = select i1 %783, ptr %782, ptr %initial_value_addr307
  %partial_reduction_result309 = load float, ptr %784, align 4
  %785 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result309, i32 16, i32 31)
  store float %785, ptr %result_from_other_lane308, align 4
  call void @region_5_49(ptr %784, ptr %result_from_other_lane308, ptr %return_buffer310)
  %786 = load float, ptr %return_buffer310, align 4
  store float %786, ptr %784, align 4
  %partial_reduction_result312 = load float, ptr %784, align 4
  %787 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result312, i32 8, i32 31)
  store float %787, ptr %result_from_other_lane311, align 4
  call void @region_5_49(ptr %784, ptr %result_from_other_lane311, ptr %return_buffer313)
  %788 = load float, ptr %return_buffer313, align 4
  store float %788, ptr %784, align 4
  %partial_reduction_result315 = load float, ptr %784, align 4
  %789 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result315, i32 4, i32 31)
  store float %789, ptr %result_from_other_lane314, align 4
  call void @region_5_49(ptr %784, ptr %result_from_other_lane314, ptr %return_buffer316)
  %790 = load float, ptr %return_buffer316, align 4
  store float %790, ptr %784, align 4
  %partial_reduction_result318 = load float, ptr %784, align 4
  %791 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result318, i32 2, i32 31)
  store float %791, ptr %result_from_other_lane317, align 4
  call void @region_5_49(ptr %784, ptr %result_from_other_lane317, ptr %return_buffer319)
  %792 = load float, ptr %return_buffer319, align 4
  store float %792, ptr %784, align 4
  %partial_reduction_result321 = load float, ptr %784, align 4
  %793 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result321, i32 1, i32 31)
  store float %793, ptr %result_from_other_lane320, align 4
  call void @region_5_49(ptr %784, ptr %result_from_other_lane320, ptr %return_buffer322)
  %794 = load float, ptr %return_buffer322, align 4
  store float %794, ptr %784, align 4
  %795 = icmp eq i32 %thread_id.x, 0
  br i1 %795, label %reduction_write_output-true323, label %reduction_write_output-after324

reduction_write_output-after324:                  ; preds = %reduction_write_output-true323, %inter_warp_reduce-true305
  br label %inter_warp_reduce-after306

reduction_write_output-true323:                   ; preds = %inter_warp_reduce-true305
  %796 = mul i32 %thread_id.x, 2
  %797 = add i32 %tile_origin.1, %thread_id.y
  %798 = add i32 %tile_origin.2, %796
  %799 = add i32 %798, 0
  %800 = udiv i32 %797, 1
  %801 = urem i32 %800, 512
  %802 = udiv i32 %797, 512
  %output_element_address325 = getelementptr inbounds [4 x [512 x float]], ptr %arg11, i32 0, i32 %802, i32 %801
  %output326 = load float, ptr %784, align 4
  store float %output326, ptr %output_element_address325, align 4
  br label %reduction_write_output-after324
}

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

define internal void @region_2_22(ptr dereferenceable(4) %Arg_0.23.typed, ptr dereferenceable(4) %Arg_1.24.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.25.typed = alloca float, align 4
  %Arg_0.23 = load float, ptr %Arg_0.23.typed, align 4
  %Arg_1.24 = load float, ptr %Arg_1.24.typed, align 4
  %add.25 = fadd float %Arg_0.23, %Arg_1.24
  store float %add.25, ptr %add.25.typed, align 4
  %load_ret_value = load float, ptr %add.25.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_3_31(ptr dereferenceable(4) %Arg_0.32.typed, ptr dereferenceable(4) %Arg_1.33.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.34.typed = alloca float, align 4
  %Arg_0.32 = load float, ptr %Arg_0.32.typed, align 4
  %Arg_1.33 = load float, ptr %Arg_1.33.typed, align 4
  %add.34 = fadd float %Arg_0.32, %Arg_1.33
  store float %add.34, ptr %add.34.typed, align 4
  %load_ret_value = load float, ptr %add.34.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_4_40(ptr dereferenceable(4) %Arg_0.41.typed, ptr dereferenceable(4) %Arg_1.42.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.43.typed = alloca float, align 4
  %Arg_0.41 = load float, ptr %Arg_0.41.typed, align 4
  %Arg_1.42 = load float, ptr %Arg_1.42.typed, align 4
  %add.43 = fadd float %Arg_0.41, %Arg_1.42
  store float %add.43, ptr %add.43.typed, align 4
  %load_ret_value = load float, ptr %add.43.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_5_49(ptr dereferenceable(4) %Arg_0.50.typed, ptr dereferenceable(4) %Arg_1.51.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.52.typed = alloca float, align 4
  %Arg_0.50 = load float, ptr %Arg_0.50.typed, align 4
  %Arg_1.51 = load float, ptr %Arg_1.51.typed, align 4
  %add.52 = fadd float %Arg_0.50, %Arg_1.51
  store float %add.52, ptr %add.52.typed, align 4
  %load_ret_value = load float, ptr %add.52.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @reduce_114(ptr noalias align 128 dereferenceable(8192) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(16) %arg2) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %result_from_other_lane22 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %result_from_other_lane19 = alloca float, align 4
  %return_buffer18 = alloca float, align 4
  %result_from_other_lane16 = alloca float, align 4
  %return_buffer15 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %tile_loop.invar_address7 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !50
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !48
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !71
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !72
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 1
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 4
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 4
  %15 = udiv i32 %8, 4
  %16 = icmp eq i32 %14, 3
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 512, i32 512
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit4, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !73

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result14 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result14, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer15)
  %22 = load float, ptr %return_buffer15, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result17 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result17, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane16, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane16, ptr %return_buffer18)
  %24 = load float, ptr %return_buffer18, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result20 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane19, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane19, ptr %return_buffer21)
  %26 = load float, ptr %return_buffer21, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result23 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane22, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane22, ptr %return_buffer24)
  %28 = load float, ptr %return_buffer24, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result26 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane25, align 4
  call void @region_1_3(ptr %current_output, ptr %result_from_other_lane25, ptr %return_buffer27)
  %30 = load float, ptr %return_buffer27, align 4
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
  %Arg_0.1 = getelementptr inbounds [4 x [512 x float]], ptr %arg0, i32 0, i32 %39, i32 %40
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !48
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %41 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_3(ptr %41, ptr %reduction_input_address, ptr %return_buffer)
  %42 = load float, ptr %return_buffer, align 4
  store float %42, ptr %41, align 4
  br label %tile_loop.loop_header, !llvm.loop !74

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %43 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address7, align 4
  br label %tile_loop.loop_header5

tile_loop.loop_header5:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar8 = load i32, ptr %tile_loop.invar_address7, align 4
  %44 = icmp uge i32 %tile_loop.indvar8, 16
  br i1 %44, label %tile_loop.loop_exit4, label %tile_loop.loop_body6

tile_loop.loop_body6:                             ; preds = %tile_loop.loop_header5
  %invar.inc9 = add nuw nsw i32 %tile_loop.indvar8, 1
  store i32 %invar.inc9, ptr %tile_loop.invar_address7, align 4
  %45 = icmp eq i32 %tile_loop.indvar8, 0
  %46 = mul i32 %tile_loop.indvar8, 32
  %47 = add i32 %46, 0
  %x_loc10 = add i32 %47, %43
  %48 = add i32 %tile_origin.1, %y_in_tile.indvar
  %49 = add i32 %tile_origin.2, %x_loc10
  %50 = icmp ult i32 %x_loc10, %tile_bound1
  br i1 %50, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body6
  br label %tile_loop.loop_header5, !llvm.loop !75

tile_loop.loop_exit4:                             ; preds = %tile_loop.loop_header5
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body6
  %Arg_0.111 = getelementptr inbounds [4 x [512 x float]], ptr %arg0, i32 0, i32 %48, i32 %49
  %Arg_0.112 = load float, ptr %Arg_0.111, align 4, !invariant.load !48
  store float %Arg_0.112, ptr %reduction_input_address, align 4
  %51 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_3(ptr %51, ptr %reduction_input_address, ptr %return_buffer13)
  %52 = load float, ptr %return_buffer13, align 4
  store float %52, ptr %51, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %53 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %6, i32 0, i32 %31
  %54 = addrspacecast ptr addrspace(3) %53 to ptr
  %55 = load float, ptr %current_output, align 4
  store float %55, ptr %54, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %56 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %6, i32 0, i32 %lane_id
  %57 = addrspacecast ptr addrspace(3) %56 to ptr
  store float %Arg_1.2, ptr %initial_value_addr, align 4
  %58 = icmp ult i32 %thread_id.x, 1
  %59 = select i1 %58, ptr %57, ptr %initial_value_addr
  %60 = icmp eq i32 %thread_id.x, 0
  br i1 %60, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %61 = mul i32 %thread_id.x, 1
  %62 = add i32 %tile_origin.1, %thread_id.y
  %63 = add i32 %tile_origin.2, %61
  %64 = add i32 %63, 0
  %65 = udiv i32 %62, 1
  %output_element_address = getelementptr inbounds [4 x float], ptr %arg2, i32 0, i32 %65
  %output = load float, ptr %59, align 4
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

define void @fusion_40(ptr noalias align 128 dereferenceable(8192) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(8192) %arg2, ptr noalias align 128 dereferenceable(8192) %arg3, ptr noalias align 128 dereferenceable(8192) %arg4, ptr noalias align 128 dereferenceable(16) %arg5, ptr noalias align 128 dereferenceable(16) %arg6, ptr noalias align 128 dereferenceable(16) %arg7, ptr noalias align 128 dereferenceable(16) %arg8) {
entry:
  %initial_value_addr224 = alloca float, align 4
  %return_buffer219 = alloca float, align 4
  %result_from_other_lane217 = alloca float, align 4
  %return_buffer216 = alloca float, align 4
  %result_from_other_lane214 = alloca float, align 4
  %return_buffer213 = alloca float, align 4
  %result_from_other_lane211 = alloca float, align 4
  %return_buffer210 = alloca float, align 4
  %result_from_other_lane208 = alloca float, align 4
  %return_buffer207 = alloca float, align 4
  %result_from_other_lane205 = alloca float, align 4
  %return_buffer203 = alloca float, align 4
  %tile_loop.invar_address195 = alloca i32, align 4
  %return_buffer191 = alloca float, align 4
  %tile_loop.invar_address186 = alloca i32, align 4
  %y_in_tile.invar_address177 = alloca i32, align 4
  %partial_reduction_result163 = alloca float, align 4
  %reduction_input_address162 = alloca float, align 4
  %initial_value_addr157 = alloca float, align 4
  %return_buffer152 = alloca float, align 4
  %result_from_other_lane150 = alloca float, align 4
  %return_buffer149 = alloca float, align 4
  %result_from_other_lane147 = alloca float, align 4
  %return_buffer146 = alloca float, align 4
  %result_from_other_lane144 = alloca float, align 4
  %return_buffer143 = alloca float, align 4
  %result_from_other_lane141 = alloca float, align 4
  %return_buffer140 = alloca float, align 4
  %result_from_other_lane138 = alloca float, align 4
  %return_buffer136 = alloca float, align 4
  %tile_loop.invar_address128 = alloca i32, align 4
  %return_buffer124 = alloca float, align 4
  %tile_loop.invar_address119 = alloca i32, align 4
  %y_in_tile.invar_address110 = alloca i32, align 4
  %partial_reduction_result96 = alloca float, align 4
  %reduction_input_address95 = alloca float, align 4
  %initial_value_addr90 = alloca float, align 4
  %return_buffer85 = alloca float, align 4
  %result_from_other_lane83 = alloca float, align 4
  %return_buffer82 = alloca float, align 4
  %result_from_other_lane80 = alloca float, align 4
  %return_buffer79 = alloca float, align 4
  %result_from_other_lane77 = alloca float, align 4
  %return_buffer76 = alloca float, align 4
  %result_from_other_lane74 = alloca float, align 4
  %return_buffer73 = alloca float, align 4
  %result_from_other_lane71 = alloca float, align 4
  %return_buffer69 = alloca float, align 4
  %tile_loop.invar_address61 = alloca i32, align 4
  %return_buffer57 = alloca float, align 4
  %tile_loop.invar_address52 = alloca i32, align 4
  %y_in_tile.invar_address43 = alloca i32, align 4
  %partial_reduction_result29 = alloca float, align 4
  %reduction_input_address28 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %result_from_other_lane22 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %result_from_other_lane19 = alloca float, align 4
  %return_buffer18 = alloca float, align 4
  %result_from_other_lane16 = alloca float, align 4
  %return_buffer15 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %tile_loop.invar_address7 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !72
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %inter_warp_reduce-after89, %reduce-group-0-after
  %3 = icmp eq i32 %0, 2
  br i1 %3, label %reduce-group-2-true, label %reduce-group-2-after

reduce-group-2-after:                             ; preds = %inter_warp_reduce-after156, %reduce-group-1-after
  %4 = icmp eq i32 %0, 3
  br i1 %4, label %reduce-group-3-true, label %reduce-group-3-after

reduce-group-3-after:                             ; preds = %inter_warp_reduce-after223, %reduce-group-2-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !48
  %5 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !71
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !72
  %8 = urem i32 %6, 32
  %9 = udiv i32 %6, 32
  %10 = mul i32 %7, 1
  %11 = add i32 %10, %9
  %12 = icmp ult i32 %11, 4
  br i1 %12, label %13, label %early_return

13:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %8, 32
  %thread_id.y = udiv i32 %8, 32
  %lane_id = urem i32 %8, 32
  %14 = udiv i32 %11, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %11, 1
  %17 = urem i32 %16, 4
  %18 = udiv i32 %11, 4
  %19 = icmp eq i32 %17, 3
  %tile_bound = select i1 %19, i32 1, i32 1
  %20 = icmp eq i32 %15, 0
  %tile_bound1 = select i1 %20, i32 512, i32 512
  %tile_origin.0 = mul i32 %18, 1
  %tile_origin.1 = mul i32 %17, 1
  %tile_origin.2 = mul i32 %15, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %13
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %21 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %21, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %22 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %23 = icmp eq i32 512, %tile_bound1
  br i1 %23, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit4, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !76

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result14 = load float, ptr %current_output, align 4
  %24 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result14, i32 16, i32 31)
  store float %24, ptr %result_from_other_lane, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer15)
  %25 = load float, ptr %return_buffer15, align 4
  store float %25, ptr %current_output, align 4
  %partial_reduction_result17 = load float, ptr %current_output, align 4
  %26 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result17, i32 8, i32 31)
  store float %26, ptr %result_from_other_lane16, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane16, ptr %return_buffer18)
  %27 = load float, ptr %return_buffer18, align 4
  store float %27, ptr %current_output, align 4
  %partial_reduction_result20 = load float, ptr %current_output, align 4
  %28 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 4, i32 31)
  store float %28, ptr %result_from_other_lane19, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane19, ptr %return_buffer21)
  %29 = load float, ptr %return_buffer21, align 4
  store float %29, ptr %current_output, align 4
  %partial_reduction_result23 = load float, ptr %current_output, align 4
  %30 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 2, i32 31)
  store float %30, ptr %result_from_other_lane22, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane22, ptr %return_buffer24)
  %31 = load float, ptr %return_buffer24, align 4
  store float %31, ptr %current_output, align 4
  %partial_reduction_result26 = load float, ptr %current_output, align 4
  %32 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 1, i32 31)
  store float %32, ptr %result_from_other_lane25, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane25, ptr %return_buffer27)
  %33 = load float, ptr %return_buffer27, align 4
  store float %33, ptr %current_output, align 4
  %34 = udiv i32 %thread_id.x, 32
  %35 = icmp eq i32 %lane_id, 0
  br i1 %35, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %36 = icmp eq i32 %34, 0
  br i1 %36, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %37 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %38 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %38, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %39 = icmp eq i32 %tile_loop.indvar, 0
  %40 = mul i32 %tile_loop.indvar, 32
  %41 = add i32 %40, 0
  %x_loc = add i32 %41, %37
  %42 = add i32 %tile_origin.1, %y_in_tile.indvar
  %43 = add i32 %tile_origin.2, %x_loc
  %Arg_0.1 = getelementptr inbounds [4 x [512 x float]], ptr %arg0, i32 0, i32 %42, i32 %43
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !48
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %44 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_6(ptr %44, ptr %reduction_input_address, ptr %return_buffer)
  %45 = load float, ptr %return_buffer, align 4
  store float %45, ptr %44, align 4
  br label %tile_loop.loop_header, !llvm.loop !77

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %46 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address7, align 4
  br label %tile_loop.loop_header5

tile_loop.loop_header5:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar8 = load i32, ptr %tile_loop.invar_address7, align 4
  %47 = icmp uge i32 %tile_loop.indvar8, 16
  br i1 %47, label %tile_loop.loop_exit4, label %tile_loop.loop_body6

tile_loop.loop_body6:                             ; preds = %tile_loop.loop_header5
  %invar.inc9 = add nuw nsw i32 %tile_loop.indvar8, 1
  store i32 %invar.inc9, ptr %tile_loop.invar_address7, align 4
  %48 = icmp eq i32 %tile_loop.indvar8, 0
  %49 = mul i32 %tile_loop.indvar8, 32
  %50 = add i32 %49, 0
  %x_loc10 = add i32 %50, %46
  %51 = add i32 %tile_origin.1, %y_in_tile.indvar
  %52 = add i32 %tile_origin.2, %x_loc10
  %53 = icmp ult i32 %x_loc10, %tile_bound1
  br i1 %53, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body6
  br label %tile_loop.loop_header5, !llvm.loop !78

tile_loop.loop_exit4:                             ; preds = %tile_loop.loop_header5
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body6
  %Arg_0.111 = getelementptr inbounds [4 x [512 x float]], ptr %arg0, i32 0, i32 %51, i32 %52
  %Arg_0.112 = load float, ptr %Arg_0.111, align 4, !invariant.load !48
  store float %Arg_0.112, ptr %reduction_input_address, align 4
  %54 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_6(ptr %54, ptr %reduction_input_address, ptr %return_buffer13)
  %55 = load float, ptr %return_buffer13, align 4
  store float %55, ptr %54, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %56 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %9, i32 0, i32 %34
  %57 = addrspacecast ptr addrspace(3) %56 to ptr
  %58 = load float, ptr %current_output, align 4
  store float %58, ptr %57, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %59 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %9, i32 0, i32 %lane_id
  %60 = addrspacecast ptr addrspace(3) %59 to ptr
  store float %Arg_1.2, ptr %initial_value_addr, align 4
  %61 = icmp ult i32 %thread_id.x, 1
  %62 = select i1 %61, ptr %60, ptr %initial_value_addr
  %63 = icmp eq i32 %thread_id.x, 0
  br i1 %63, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %64 = mul i32 %thread_id.x, 1
  %65 = add i32 %tile_origin.1, %thread_id.y
  %66 = add i32 %tile_origin.2, %64
  %67 = add i32 %66, 0
  %68 = udiv i32 %65, 1
  %output_element_address = getelementptr inbounds [4 x float], ptr %arg5, i32 0, i32 %68
  %output = load float, ptr %62, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.230 = load float, ptr %arg1, align 4, !invariant.load !48
  %69 = getelementptr inbounds float, ptr %partial_reduction_result29, i32 0
  store float %Arg_1.230, ptr %69, align 4
  %70 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !71
  %71 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !72
  %72 = urem i32 %70, 32
  %73 = udiv i32 %70, 32
  %74 = mul i32 %71, 1
  %75 = add i32 %74, %73
  %76 = icmp ult i32 %75, 4
  br i1 %76, label %77, label %early_return31

77:                                               ; preds = %reduce-group-1-true
  %thread_id.x32 = urem i32 %72, 32
  %thread_id.y33 = udiv i32 %72, 32
  %lane_id34 = urem i32 %72, 32
  %78 = udiv i32 %75, 1
  %79 = urem i32 %78, 1
  %80 = udiv i32 %75, 1
  %81 = urem i32 %80, 4
  %82 = udiv i32 %75, 4
  %83 = icmp eq i32 %81, 3
  %tile_bound35 = select i1 %83, i32 1, i32 1
  %84 = icmp eq i32 %79, 0
  %tile_bound36 = select i1 %84, i32 512, i32 512
  %tile_origin.037 = mul i32 %82, 1
  %tile_origin.138 = mul i32 %81, 1
  %tile_origin.239 = mul i32 %79, 512
  store i32 %thread_id.y33, ptr %y_in_tile.invar_address43, align 4
  br label %y_in_tile.loop_header41

y_in_tile.loop_header41:                          ; preds = %is_full_tile-after48, %77
  %y_in_tile.indvar44 = load i32, ptr %y_in_tile.invar_address43, align 4
  %85 = icmp uge i32 %y_in_tile.indvar44, %tile_bound35
  br i1 %85, label %y_in_tile.loop_exit40, label %y_in_tile.loop_body42

y_in_tile.loop_body42:                            ; preds = %y_in_tile.loop_header41
  %invar.inc45 = add nuw nsw i32 %y_in_tile.indvar44, 1
  store i32 %invar.inc45, ptr %y_in_tile.invar_address43, align 4
  %86 = icmp eq i32 %y_in_tile.indvar44, %thread_id.y33
  %87 = icmp eq i32 512, %tile_bound36
  br i1 %87, label %is_full_tile-true46, label %is_full_tile-false47

is_full_tile-after48:                             ; preds = %tile_loop.loop_exit58, %tile_loop.loop_exit49
  br label %y_in_tile.loop_header41, !llvm.loop !79

y_in_tile.loop_exit40:                            ; preds = %y_in_tile.loop_header41
  %current_output70 = getelementptr inbounds float, ptr %partial_reduction_result29, i32 0
  %partial_reduction_result72 = load float, ptr %current_output70, align 4
  %88 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result72, i32 16, i32 31)
  store float %88, ptr %result_from_other_lane71, align 4
  call void @region_2_11(ptr %current_output70, ptr %result_from_other_lane71, ptr %return_buffer73)
  %89 = load float, ptr %return_buffer73, align 4
  store float %89, ptr %current_output70, align 4
  %partial_reduction_result75 = load float, ptr %current_output70, align 4
  %90 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result75, i32 8, i32 31)
  store float %90, ptr %result_from_other_lane74, align 4
  call void @region_2_11(ptr %current_output70, ptr %result_from_other_lane74, ptr %return_buffer76)
  %91 = load float, ptr %return_buffer76, align 4
  store float %91, ptr %current_output70, align 4
  %partial_reduction_result78 = load float, ptr %current_output70, align 4
  %92 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result78, i32 4, i32 31)
  store float %92, ptr %result_from_other_lane77, align 4
  call void @region_2_11(ptr %current_output70, ptr %result_from_other_lane77, ptr %return_buffer79)
  %93 = load float, ptr %return_buffer79, align 4
  store float %93, ptr %current_output70, align 4
  %partial_reduction_result81 = load float, ptr %current_output70, align 4
  %94 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result81, i32 2, i32 31)
  store float %94, ptr %result_from_other_lane80, align 4
  call void @region_2_11(ptr %current_output70, ptr %result_from_other_lane80, ptr %return_buffer82)
  %95 = load float, ptr %return_buffer82, align 4
  store float %95, ptr %current_output70, align 4
  %partial_reduction_result84 = load float, ptr %current_output70, align 4
  %96 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result84, i32 1, i32 31)
  store float %96, ptr %result_from_other_lane83, align 4
  call void @region_2_11(ptr %current_output70, ptr %result_from_other_lane83, ptr %return_buffer85)
  %97 = load float, ptr %return_buffer85, align 4
  store float %97, ptr %current_output70, align 4
  %98 = udiv i32 %thread_id.x32, 32
  %99 = icmp eq i32 %lane_id34, 0
  br i1 %99, label %intra_warp_reduce_write-true86, label %intra_warp_reduce_write-after87

intra_warp_reduce_write-after87:                  ; preds = %intra_warp_reduce_write-true86, %y_in_tile.loop_exit40
  call void @llvm.nvvm.barrier0()
  %100 = icmp eq i32 %98, 0
  br i1 %100, label %inter_warp_reduce-true88, label %inter_warp_reduce-after89

inter_warp_reduce-after89:                        ; preds = %reduction_write_output-after92, %intra_warp_reduce_write-after87
  br label %reduce-group-1-after

early_return31:                                   ; preds = %reduce-group-1-true
  ret void

is_full_tile-true46:                              ; preds = %y_in_tile.loop_body42
  %101 = mul i32 %thread_id.x32, 1
  store i32 0, ptr %tile_loop.invar_address52, align 4
  br label %tile_loop.loop_header50

tile_loop.loop_header50:                          ; preds = %tile_loop.loop_body51, %is_full_tile-true46
  %tile_loop.indvar53 = load i32, ptr %tile_loop.invar_address52, align 4
  %102 = icmp uge i32 %tile_loop.indvar53, 16
  br i1 %102, label %tile_loop.loop_exit49, label %tile_loop.loop_body51

tile_loop.loop_body51:                            ; preds = %tile_loop.loop_header50
  %invar.inc54 = add nuw nsw i32 %tile_loop.indvar53, 1
  store i32 %invar.inc54, ptr %tile_loop.invar_address52, align 4
  %103 = icmp eq i32 %tile_loop.indvar53, 0
  %104 = mul i32 %tile_loop.indvar53, 32
  %105 = add i32 %104, 0
  %x_loc55 = add i32 %105, %101
  %106 = add i32 %tile_origin.138, %y_in_tile.indvar44
  %107 = add i32 %tile_origin.239, %x_loc55
  %Arg_2.3 = getelementptr inbounds [4 x [512 x float]], ptr %arg2, i32 0, i32 %106, i32 %107
  %Arg_2.356 = load float, ptr %Arg_2.3, align 4, !invariant.load !48
  store float %Arg_2.356, ptr %reduction_input_address28, align 4
  %108 = getelementptr inbounds float, ptr %partial_reduction_result29, i32 0
  call void @region_2_11(ptr %108, ptr %reduction_input_address28, ptr %return_buffer57)
  %109 = load float, ptr %return_buffer57, align 4
  store float %109, ptr %108, align 4
  br label %tile_loop.loop_header50, !llvm.loop !80

tile_loop.loop_exit49:                            ; preds = %tile_loop.loop_header50
  br label %is_full_tile-after48

is_full_tile-false47:                             ; preds = %y_in_tile.loop_body42
  %110 = mul i32 %thread_id.x32, 1
  store i32 0, ptr %tile_loop.invar_address61, align 4
  br label %tile_loop.loop_header59

tile_loop.loop_header59:                          ; preds = %x_in_tile-after66, %is_full_tile-false47
  %tile_loop.indvar62 = load i32, ptr %tile_loop.invar_address61, align 4
  %111 = icmp uge i32 %tile_loop.indvar62, 16
  br i1 %111, label %tile_loop.loop_exit58, label %tile_loop.loop_body60

tile_loop.loop_body60:                            ; preds = %tile_loop.loop_header59
  %invar.inc63 = add nuw nsw i32 %tile_loop.indvar62, 1
  store i32 %invar.inc63, ptr %tile_loop.invar_address61, align 4
  %112 = icmp eq i32 %tile_loop.indvar62, 0
  %113 = mul i32 %tile_loop.indvar62, 32
  %114 = add i32 %113, 0
  %x_loc64 = add i32 %114, %110
  %115 = add i32 %tile_origin.138, %y_in_tile.indvar44
  %116 = add i32 %tile_origin.239, %x_loc64
  %117 = icmp ult i32 %x_loc64, %tile_bound36
  br i1 %117, label %x_in_tile-true65, label %x_in_tile-after66

x_in_tile-after66:                                ; preds = %x_in_tile-true65, %tile_loop.loop_body60
  br label %tile_loop.loop_header59, !llvm.loop !81

tile_loop.loop_exit58:                            ; preds = %tile_loop.loop_header59
  br label %is_full_tile-after48

x_in_tile-true65:                                 ; preds = %tile_loop.loop_body60
  %Arg_2.367 = getelementptr inbounds [4 x [512 x float]], ptr %arg2, i32 0, i32 %115, i32 %116
  %Arg_2.368 = load float, ptr %Arg_2.367, align 4, !invariant.load !48
  store float %Arg_2.368, ptr %reduction_input_address28, align 4
  %118 = getelementptr inbounds float, ptr %partial_reduction_result29, i32 0
  call void @region_2_11(ptr %118, ptr %reduction_input_address28, ptr %return_buffer69)
  %119 = load float, ptr %return_buffer69, align 4
  store float %119, ptr %118, align 4
  br label %x_in_tile-after66

intra_warp_reduce_write-true86:                   ; preds = %y_in_tile.loop_exit40
  %120 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %73, i32 0, i32 %98
  %121 = addrspacecast ptr addrspace(3) %120 to ptr
  %122 = load float, ptr %current_output70, align 4
  store float %122, ptr %121, align 4
  br label %intra_warp_reduce_write-after87

inter_warp_reduce-true88:                         ; preds = %intra_warp_reduce_write-after87
  %123 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %73, i32 0, i32 %lane_id34
  %124 = addrspacecast ptr addrspace(3) %123 to ptr
  store float %Arg_1.230, ptr %initial_value_addr90, align 4
  %125 = icmp ult i32 %thread_id.x32, 1
  %126 = select i1 %125, ptr %124, ptr %initial_value_addr90
  %127 = icmp eq i32 %thread_id.x32, 0
  br i1 %127, label %reduction_write_output-true91, label %reduction_write_output-after92

reduction_write_output-after92:                   ; preds = %reduction_write_output-true91, %inter_warp_reduce-true88
  br label %inter_warp_reduce-after89

reduction_write_output-true91:                    ; preds = %inter_warp_reduce-true88
  %128 = mul i32 %thread_id.x32, 1
  %129 = add i32 %tile_origin.138, %thread_id.y33
  %130 = add i32 %tile_origin.239, %128
  %131 = add i32 %130, 0
  %132 = udiv i32 %129, 1
  %output_element_address93 = getelementptr inbounds [4 x float], ptr %arg6, i32 0, i32 %132
  %output94 = load float, ptr %126, align 4
  store float %output94, ptr %output_element_address93, align 4
  br label %reduction_write_output-after92

reduce-group-2-true:                              ; preds = %reduce-group-1-after
  %Arg_1.297 = load float, ptr %arg1, align 4, !invariant.load !48
  %133 = getelementptr inbounds float, ptr %partial_reduction_result96, i32 0
  store float %Arg_1.297, ptr %133, align 4
  %134 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !71
  %135 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !72
  %136 = urem i32 %134, 32
  %137 = udiv i32 %134, 32
  %138 = mul i32 %135, 1
  %139 = add i32 %138, %137
  %140 = icmp ult i32 %139, 4
  br i1 %140, label %141, label %early_return98

141:                                              ; preds = %reduce-group-2-true
  %thread_id.x99 = urem i32 %136, 32
  %thread_id.y100 = udiv i32 %136, 32
  %lane_id101 = urem i32 %136, 32
  %142 = udiv i32 %139, 1
  %143 = urem i32 %142, 1
  %144 = udiv i32 %139, 1
  %145 = urem i32 %144, 4
  %146 = udiv i32 %139, 4
  %147 = icmp eq i32 %145, 3
  %tile_bound102 = select i1 %147, i32 1, i32 1
  %148 = icmp eq i32 %143, 0
  %tile_bound103 = select i1 %148, i32 512, i32 512
  %tile_origin.0104 = mul i32 %146, 1
  %tile_origin.1105 = mul i32 %145, 1
  %tile_origin.2106 = mul i32 %143, 512
  store i32 %thread_id.y100, ptr %y_in_tile.invar_address110, align 4
  br label %y_in_tile.loop_header108

y_in_tile.loop_header108:                         ; preds = %is_full_tile-after115, %141
  %y_in_tile.indvar111 = load i32, ptr %y_in_tile.invar_address110, align 4
  %149 = icmp uge i32 %y_in_tile.indvar111, %tile_bound102
  br i1 %149, label %y_in_tile.loop_exit107, label %y_in_tile.loop_body109

y_in_tile.loop_body109:                           ; preds = %y_in_tile.loop_header108
  %invar.inc112 = add nuw nsw i32 %y_in_tile.indvar111, 1
  store i32 %invar.inc112, ptr %y_in_tile.invar_address110, align 4
  %150 = icmp eq i32 %y_in_tile.indvar111, %thread_id.y100
  %151 = icmp eq i32 512, %tile_bound103
  br i1 %151, label %is_full_tile-true113, label %is_full_tile-false114

is_full_tile-after115:                            ; preds = %tile_loop.loop_exit125, %tile_loop.loop_exit116
  br label %y_in_tile.loop_header108, !llvm.loop !82

y_in_tile.loop_exit107:                           ; preds = %y_in_tile.loop_header108
  %current_output137 = getelementptr inbounds float, ptr %partial_reduction_result96, i32 0
  %partial_reduction_result139 = load float, ptr %current_output137, align 4
  %152 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result139, i32 16, i32 31)
  store float %152, ptr %result_from_other_lane138, align 4
  call void @region_3_16(ptr %current_output137, ptr %result_from_other_lane138, ptr %return_buffer140)
  %153 = load float, ptr %return_buffer140, align 4
  store float %153, ptr %current_output137, align 4
  %partial_reduction_result142 = load float, ptr %current_output137, align 4
  %154 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result142, i32 8, i32 31)
  store float %154, ptr %result_from_other_lane141, align 4
  call void @region_3_16(ptr %current_output137, ptr %result_from_other_lane141, ptr %return_buffer143)
  %155 = load float, ptr %return_buffer143, align 4
  store float %155, ptr %current_output137, align 4
  %partial_reduction_result145 = load float, ptr %current_output137, align 4
  %156 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result145, i32 4, i32 31)
  store float %156, ptr %result_from_other_lane144, align 4
  call void @region_3_16(ptr %current_output137, ptr %result_from_other_lane144, ptr %return_buffer146)
  %157 = load float, ptr %return_buffer146, align 4
  store float %157, ptr %current_output137, align 4
  %partial_reduction_result148 = load float, ptr %current_output137, align 4
  %158 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result148, i32 2, i32 31)
  store float %158, ptr %result_from_other_lane147, align 4
  call void @region_3_16(ptr %current_output137, ptr %result_from_other_lane147, ptr %return_buffer149)
  %159 = load float, ptr %return_buffer149, align 4
  store float %159, ptr %current_output137, align 4
  %partial_reduction_result151 = load float, ptr %current_output137, align 4
  %160 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result151, i32 1, i32 31)
  store float %160, ptr %result_from_other_lane150, align 4
  call void @region_3_16(ptr %current_output137, ptr %result_from_other_lane150, ptr %return_buffer152)
  %161 = load float, ptr %return_buffer152, align 4
  store float %161, ptr %current_output137, align 4
  %162 = udiv i32 %thread_id.x99, 32
  %163 = icmp eq i32 %lane_id101, 0
  br i1 %163, label %intra_warp_reduce_write-true153, label %intra_warp_reduce_write-after154

intra_warp_reduce_write-after154:                 ; preds = %intra_warp_reduce_write-true153, %y_in_tile.loop_exit107
  call void @llvm.nvvm.barrier0()
  %164 = icmp eq i32 %162, 0
  br i1 %164, label %inter_warp_reduce-true155, label %inter_warp_reduce-after156

inter_warp_reduce-after156:                       ; preds = %reduction_write_output-after159, %intra_warp_reduce_write-after154
  br label %reduce-group-2-after

early_return98:                                   ; preds = %reduce-group-2-true
  ret void

is_full_tile-true113:                             ; preds = %y_in_tile.loop_body109
  %165 = mul i32 %thread_id.x99, 1
  store i32 0, ptr %tile_loop.invar_address119, align 4
  br label %tile_loop.loop_header117

tile_loop.loop_header117:                         ; preds = %tile_loop.loop_body118, %is_full_tile-true113
  %tile_loop.indvar120 = load i32, ptr %tile_loop.invar_address119, align 4
  %166 = icmp uge i32 %tile_loop.indvar120, 16
  br i1 %166, label %tile_loop.loop_exit116, label %tile_loop.loop_body118

tile_loop.loop_body118:                           ; preds = %tile_loop.loop_header117
  %invar.inc121 = add nuw nsw i32 %tile_loop.indvar120, 1
  store i32 %invar.inc121, ptr %tile_loop.invar_address119, align 4
  %167 = icmp eq i32 %tile_loop.indvar120, 0
  %168 = mul i32 %tile_loop.indvar120, 32
  %169 = add i32 %168, 0
  %x_loc122 = add i32 %169, %165
  %170 = add i32 %tile_origin.1105, %y_in_tile.indvar111
  %171 = add i32 %tile_origin.2106, %x_loc122
  %Arg_3.4 = getelementptr inbounds [4 x [512 x float]], ptr %arg3, i32 0, i32 %170, i32 %171
  %Arg_3.4123 = load float, ptr %Arg_3.4, align 4, !invariant.load !48
  store float %Arg_3.4123, ptr %reduction_input_address95, align 4
  %172 = getelementptr inbounds float, ptr %partial_reduction_result96, i32 0
  call void @region_3_16(ptr %172, ptr %reduction_input_address95, ptr %return_buffer124)
  %173 = load float, ptr %return_buffer124, align 4
  store float %173, ptr %172, align 4
  br label %tile_loop.loop_header117, !llvm.loop !83

tile_loop.loop_exit116:                           ; preds = %tile_loop.loop_header117
  br label %is_full_tile-after115

is_full_tile-false114:                            ; preds = %y_in_tile.loop_body109
  %174 = mul i32 %thread_id.x99, 1
  store i32 0, ptr %tile_loop.invar_address128, align 4
  br label %tile_loop.loop_header126

tile_loop.loop_header126:                         ; preds = %x_in_tile-after133, %is_full_tile-false114
  %tile_loop.indvar129 = load i32, ptr %tile_loop.invar_address128, align 4
  %175 = icmp uge i32 %tile_loop.indvar129, 16
  br i1 %175, label %tile_loop.loop_exit125, label %tile_loop.loop_body127

tile_loop.loop_body127:                           ; preds = %tile_loop.loop_header126
  %invar.inc130 = add nuw nsw i32 %tile_loop.indvar129, 1
  store i32 %invar.inc130, ptr %tile_loop.invar_address128, align 4
  %176 = icmp eq i32 %tile_loop.indvar129, 0
  %177 = mul i32 %tile_loop.indvar129, 32
  %178 = add i32 %177, 0
  %x_loc131 = add i32 %178, %174
  %179 = add i32 %tile_origin.1105, %y_in_tile.indvar111
  %180 = add i32 %tile_origin.2106, %x_loc131
  %181 = icmp ult i32 %x_loc131, %tile_bound103
  br i1 %181, label %x_in_tile-true132, label %x_in_tile-after133

x_in_tile-after133:                               ; preds = %x_in_tile-true132, %tile_loop.loop_body127
  br label %tile_loop.loop_header126, !llvm.loop !84

tile_loop.loop_exit125:                           ; preds = %tile_loop.loop_header126
  br label %is_full_tile-after115

x_in_tile-true132:                                ; preds = %tile_loop.loop_body127
  %Arg_3.4134 = getelementptr inbounds [4 x [512 x float]], ptr %arg3, i32 0, i32 %179, i32 %180
  %Arg_3.4135 = load float, ptr %Arg_3.4134, align 4, !invariant.load !48
  store float %Arg_3.4135, ptr %reduction_input_address95, align 4
  %182 = getelementptr inbounds float, ptr %partial_reduction_result96, i32 0
  call void @region_3_16(ptr %182, ptr %reduction_input_address95, ptr %return_buffer136)
  %183 = load float, ptr %return_buffer136, align 4
  store float %183, ptr %182, align 4
  br label %x_in_tile-after133

intra_warp_reduce_write-true153:                  ; preds = %y_in_tile.loop_exit107
  %184 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %137, i32 0, i32 %162
  %185 = addrspacecast ptr addrspace(3) %184 to ptr
  %186 = load float, ptr %current_output137, align 4
  store float %186, ptr %185, align 4
  br label %intra_warp_reduce_write-after154

inter_warp_reduce-true155:                        ; preds = %intra_warp_reduce_write-after154
  %187 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %137, i32 0, i32 %lane_id101
  %188 = addrspacecast ptr addrspace(3) %187 to ptr
  store float %Arg_1.297, ptr %initial_value_addr157, align 4
  %189 = icmp ult i32 %thread_id.x99, 1
  %190 = select i1 %189, ptr %188, ptr %initial_value_addr157
  %191 = icmp eq i32 %thread_id.x99, 0
  br i1 %191, label %reduction_write_output-true158, label %reduction_write_output-after159

reduction_write_output-after159:                  ; preds = %reduction_write_output-true158, %inter_warp_reduce-true155
  br label %inter_warp_reduce-after156

reduction_write_output-true158:                   ; preds = %inter_warp_reduce-true155
  %192 = mul i32 %thread_id.x99, 1
  %193 = add i32 %tile_origin.1105, %thread_id.y100
  %194 = add i32 %tile_origin.2106, %192
  %195 = add i32 %194, 0
  %196 = udiv i32 %193, 1
  %output_element_address160 = getelementptr inbounds [4 x float], ptr %arg7, i32 0, i32 %196
  %output161 = load float, ptr %190, align 4
  store float %output161, ptr %output_element_address160, align 4
  br label %reduction_write_output-after159

reduce-group-3-true:                              ; preds = %reduce-group-2-after
  %Arg_1.2164 = load float, ptr %arg1, align 4, !invariant.load !48
  %197 = getelementptr inbounds float, ptr %partial_reduction_result163, i32 0
  store float %Arg_1.2164, ptr %197, align 4
  %198 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !71
  %199 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !72
  %200 = urem i32 %198, 32
  %201 = udiv i32 %198, 32
  %202 = mul i32 %199, 1
  %203 = add i32 %202, %201
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %205, label %early_return165

205:                                              ; preds = %reduce-group-3-true
  %thread_id.x166 = urem i32 %200, 32
  %thread_id.y167 = udiv i32 %200, 32
  %lane_id168 = urem i32 %200, 32
  %206 = udiv i32 %203, 1
  %207 = urem i32 %206, 1
  %208 = udiv i32 %203, 1
  %209 = urem i32 %208, 4
  %210 = udiv i32 %203, 4
  %211 = icmp eq i32 %209, 3
  %tile_bound169 = select i1 %211, i32 1, i32 1
  %212 = icmp eq i32 %207, 0
  %tile_bound170 = select i1 %212, i32 512, i32 512
  %tile_origin.0171 = mul i32 %210, 1
  %tile_origin.1172 = mul i32 %209, 1
  %tile_origin.2173 = mul i32 %207, 512
  store i32 %thread_id.y167, ptr %y_in_tile.invar_address177, align 4
  br label %y_in_tile.loop_header175

y_in_tile.loop_header175:                         ; preds = %is_full_tile-after182, %205
  %y_in_tile.indvar178 = load i32, ptr %y_in_tile.invar_address177, align 4
  %213 = icmp uge i32 %y_in_tile.indvar178, %tile_bound169
  br i1 %213, label %y_in_tile.loop_exit174, label %y_in_tile.loop_body176

y_in_tile.loop_body176:                           ; preds = %y_in_tile.loop_header175
  %invar.inc179 = add nuw nsw i32 %y_in_tile.indvar178, 1
  store i32 %invar.inc179, ptr %y_in_tile.invar_address177, align 4
  %214 = icmp eq i32 %y_in_tile.indvar178, %thread_id.y167
  %215 = icmp eq i32 512, %tile_bound170
  br i1 %215, label %is_full_tile-true180, label %is_full_tile-false181

is_full_tile-after182:                            ; preds = %tile_loop.loop_exit192, %tile_loop.loop_exit183
  br label %y_in_tile.loop_header175, !llvm.loop !85

y_in_tile.loop_exit174:                           ; preds = %y_in_tile.loop_header175
  %current_output204 = getelementptr inbounds float, ptr %partial_reduction_result163, i32 0
  %partial_reduction_result206 = load float, ptr %current_output204, align 4
  %216 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result206, i32 16, i32 31)
  store float %216, ptr %result_from_other_lane205, align 4
  call void @region_4_21(ptr %current_output204, ptr %result_from_other_lane205, ptr %return_buffer207)
  %217 = load float, ptr %return_buffer207, align 4
  store float %217, ptr %current_output204, align 4
  %partial_reduction_result209 = load float, ptr %current_output204, align 4
  %218 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result209, i32 8, i32 31)
  store float %218, ptr %result_from_other_lane208, align 4
  call void @region_4_21(ptr %current_output204, ptr %result_from_other_lane208, ptr %return_buffer210)
  %219 = load float, ptr %return_buffer210, align 4
  store float %219, ptr %current_output204, align 4
  %partial_reduction_result212 = load float, ptr %current_output204, align 4
  %220 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result212, i32 4, i32 31)
  store float %220, ptr %result_from_other_lane211, align 4
  call void @region_4_21(ptr %current_output204, ptr %result_from_other_lane211, ptr %return_buffer213)
  %221 = load float, ptr %return_buffer213, align 4
  store float %221, ptr %current_output204, align 4
  %partial_reduction_result215 = load float, ptr %current_output204, align 4
  %222 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result215, i32 2, i32 31)
  store float %222, ptr %result_from_other_lane214, align 4
  call void @region_4_21(ptr %current_output204, ptr %result_from_other_lane214, ptr %return_buffer216)
  %223 = load float, ptr %return_buffer216, align 4
  store float %223, ptr %current_output204, align 4
  %partial_reduction_result218 = load float, ptr %current_output204, align 4
  %224 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result218, i32 1, i32 31)
  store float %224, ptr %result_from_other_lane217, align 4
  call void @region_4_21(ptr %current_output204, ptr %result_from_other_lane217, ptr %return_buffer219)
  %225 = load float, ptr %return_buffer219, align 4
  store float %225, ptr %current_output204, align 4
  %226 = udiv i32 %thread_id.x166, 32
  %227 = icmp eq i32 %lane_id168, 0
  br i1 %227, label %intra_warp_reduce_write-true220, label %intra_warp_reduce_write-after221

intra_warp_reduce_write-after221:                 ; preds = %intra_warp_reduce_write-true220, %y_in_tile.loop_exit174
  call void @llvm.nvvm.barrier0()
  %228 = icmp eq i32 %226, 0
  br i1 %228, label %inter_warp_reduce-true222, label %inter_warp_reduce-after223

inter_warp_reduce-after223:                       ; preds = %reduction_write_output-after226, %intra_warp_reduce_write-after221
  br label %reduce-group-3-after

early_return165:                                  ; preds = %reduce-group-3-true
  ret void

is_full_tile-true180:                             ; preds = %y_in_tile.loop_body176
  %229 = mul i32 %thread_id.x166, 1
  store i32 0, ptr %tile_loop.invar_address186, align 4
  br label %tile_loop.loop_header184

tile_loop.loop_header184:                         ; preds = %tile_loop.loop_body185, %is_full_tile-true180
  %tile_loop.indvar187 = load i32, ptr %tile_loop.invar_address186, align 4
  %230 = icmp uge i32 %tile_loop.indvar187, 16
  br i1 %230, label %tile_loop.loop_exit183, label %tile_loop.loop_body185

tile_loop.loop_body185:                           ; preds = %tile_loop.loop_header184
  %invar.inc188 = add nuw nsw i32 %tile_loop.indvar187, 1
  store i32 %invar.inc188, ptr %tile_loop.invar_address186, align 4
  %231 = icmp eq i32 %tile_loop.indvar187, 0
  %232 = mul i32 %tile_loop.indvar187, 32
  %233 = add i32 %232, 0
  %x_loc189 = add i32 %233, %229
  %234 = add i32 %tile_origin.1172, %y_in_tile.indvar178
  %235 = add i32 %tile_origin.2173, %x_loc189
  %Arg_4.5 = getelementptr inbounds [4 x [512 x float]], ptr %arg4, i32 0, i32 %234, i32 %235
  %Arg_4.5190 = load float, ptr %Arg_4.5, align 4, !invariant.load !48
  store float %Arg_4.5190, ptr %reduction_input_address162, align 4
  %236 = getelementptr inbounds float, ptr %partial_reduction_result163, i32 0
  call void @region_4_21(ptr %236, ptr %reduction_input_address162, ptr %return_buffer191)
  %237 = load float, ptr %return_buffer191, align 4
  store float %237, ptr %236, align 4
  br label %tile_loop.loop_header184, !llvm.loop !86

tile_loop.loop_exit183:                           ; preds = %tile_loop.loop_header184
  br label %is_full_tile-after182

is_full_tile-false181:                            ; preds = %y_in_tile.loop_body176
  %238 = mul i32 %thread_id.x166, 1
  store i32 0, ptr %tile_loop.invar_address195, align 4
  br label %tile_loop.loop_header193

tile_loop.loop_header193:                         ; preds = %x_in_tile-after200, %is_full_tile-false181
  %tile_loop.indvar196 = load i32, ptr %tile_loop.invar_address195, align 4
  %239 = icmp uge i32 %tile_loop.indvar196, 16
  br i1 %239, label %tile_loop.loop_exit192, label %tile_loop.loop_body194

tile_loop.loop_body194:                           ; preds = %tile_loop.loop_header193
  %invar.inc197 = add nuw nsw i32 %tile_loop.indvar196, 1
  store i32 %invar.inc197, ptr %tile_loop.invar_address195, align 4
  %240 = icmp eq i32 %tile_loop.indvar196, 0
  %241 = mul i32 %tile_loop.indvar196, 32
  %242 = add i32 %241, 0
  %x_loc198 = add i32 %242, %238
  %243 = add i32 %tile_origin.1172, %y_in_tile.indvar178
  %244 = add i32 %tile_origin.2173, %x_loc198
  %245 = icmp ult i32 %x_loc198, %tile_bound170
  br i1 %245, label %x_in_tile-true199, label %x_in_tile-after200

x_in_tile-after200:                               ; preds = %x_in_tile-true199, %tile_loop.loop_body194
  br label %tile_loop.loop_header193, !llvm.loop !87

tile_loop.loop_exit192:                           ; preds = %tile_loop.loop_header193
  br label %is_full_tile-after182

x_in_tile-true199:                                ; preds = %tile_loop.loop_body194
  %Arg_4.5201 = getelementptr inbounds [4 x [512 x float]], ptr %arg4, i32 0, i32 %243, i32 %244
  %Arg_4.5202 = load float, ptr %Arg_4.5201, align 4, !invariant.load !48
  store float %Arg_4.5202, ptr %reduction_input_address162, align 4
  %246 = getelementptr inbounds float, ptr %partial_reduction_result163, i32 0
  call void @region_4_21(ptr %246, ptr %reduction_input_address162, ptr %return_buffer203)
  %247 = load float, ptr %return_buffer203, align 4
  store float %247, ptr %246, align 4
  br label %x_in_tile-after200

intra_warp_reduce_write-true220:                  ; preds = %y_in_tile.loop_exit174
  %248 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache11, i32 0, i32 %201, i32 0, i32 %226
  %249 = addrspacecast ptr addrspace(3) %248 to ptr
  %250 = load float, ptr %current_output204, align 4
  store float %250, ptr %249, align 4
  br label %intra_warp_reduce_write-after221

inter_warp_reduce-true222:                        ; preds = %intra_warp_reduce_write-after221
  %251 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache11, i32 0, i32 %201, i32 0, i32 %lane_id168
  %252 = addrspacecast ptr addrspace(3) %251 to ptr
  store float %Arg_1.2164, ptr %initial_value_addr224, align 4
  %253 = icmp ult i32 %thread_id.x166, 1
  %254 = select i1 %253, ptr %252, ptr %initial_value_addr224
  %255 = icmp eq i32 %thread_id.x166, 0
  br i1 %255, label %reduction_write_output-true225, label %reduction_write_output-after226

reduction_write_output-after226:                  ; preds = %reduction_write_output-true225, %inter_warp_reduce-true222
  br label %inter_warp_reduce-after223

reduction_write_output-true225:                   ; preds = %inter_warp_reduce-true222
  %256 = mul i32 %thread_id.x166, 1
  %257 = add i32 %tile_origin.1172, %thread_id.y167
  %258 = add i32 %tile_origin.2173, %256
  %259 = add i32 %258, 0
  %260 = udiv i32 %257, 1
  %output_element_address227 = getelementptr inbounds [4 x float], ptr %arg8, i32 0, i32 %260
  %output228 = load float, ptr %254, align 4
  store float %output228, ptr %output_element_address227, align 4
  br label %reduction_write_output-after226
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

define internal void @region_2_11(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
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

define internal void @region_3_16(ptr dereferenceable(4) %Arg_0.17.typed, ptr dereferenceable(4) %Arg_1.18.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.19.typed = alloca float, align 4
  %Arg_0.17 = load float, ptr %Arg_0.17.typed, align 4
  %Arg_1.18 = load float, ptr %Arg_1.18.typed, align 4
  %add.19 = fadd float %Arg_0.17, %Arg_1.18
  store float %add.19, ptr %add.19.typed, align 4
  %load_ret_value = load float, ptr %add.19.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_4_21(ptr dereferenceable(4) %Arg_0.22.typed, ptr dereferenceable(4) %Arg_1.23.typed, ptr dereferenceable(4) %output_arg) {
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

define void @fusion_29(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(16) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(16) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !72
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %fusion_29.in_bounds-true, label %fusion_29.in_bounds-after

fusion_29.in_bounds-after:                        ; preds = %fusion_29.in_bounds-true, %entry
  ret void

fusion_29.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !48
  %7 = load float, ptr %arg2, align 4, !invariant.load !48
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4, !invariant.load !48
  %multiply.5 = fmul float %7, %9
  %subtract.6 = fsub float %6, %multiply.5
  %10 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %subtract.6, ptr %10, align 4
  br label %fusion_29.in_bounds-after
}

define void @fusion_24(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(16) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 128 dereferenceable(16) %arg4, ptr noalias align 16 dereferenceable(16) %arg5, ptr noalias align 128 dereferenceable(16) %arg6, ptr noalias align 16 dereferenceable(16) %arg7, ptr noalias align 128 dereferenceable(16) %arg8, ptr noalias align 128 dereferenceable(16) %arg9, ptr noalias align 128 dereferenceable(16) %arg10, ptr noalias align 128 dereferenceable(16) %arg11, ptr noalias align 128 dereferenceable(16) %arg12) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !72
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index, 4
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %fusion_24.in_bounds-true, label %fusion_24.in_bounds-after

fusion_24.in_bounds-after:                        ; preds = %fusion_24.in_bounds-true, %entry
  ret void

fusion_24.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !48
  %9 = load float, ptr %arg2, align 4, !invariant.load !48
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !48
  %multiply.11 = fmul float %9, %11
  %subtract.13 = fsub float %8, %multiply.11
  %12 = insertvalue { float, float, float, float } undef, float %subtract.13, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !48
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4, !invariant.load !48
  %multiply.14 = fmul float %9, %16
  %subtract.16 = fsub float %14, %multiply.14
  %17 = insertvalue { float, float, float, float } %12, float %subtract.16, 1
  %18 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %19 = load float, ptr %18, align 4, !invariant.load !48
  %20 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %21 = load float, ptr %20, align 4, !invariant.load !48
  %multiply.17 = fmul float %9, %21
  %subtract.19 = fsub float %19, %multiply.17
  %22 = insertvalue { float, float, float, float } %17, float %subtract.19, 2
  %23 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %24 = load float, ptr %23, align 4, !invariant.load !48
  %25 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !48
  %multiply.20 = fmul float %9, %26
  %subtract.22 = fsub float %24, %multiply.20
  %27 = insertvalue { float, float, float, float } %22, float %subtract.22, 3
  %28 = extractvalue { float, float, float, float } %27, 0
  %29 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  store float %28, ptr %29, align 4
  %30 = extractvalue { float, float, float, float } %27, 1
  %31 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %30, ptr %31, align 4
  %32 = extractvalue { float, float, float, float } %27, 2
  %33 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %32, ptr %33, align 4
  %34 = extractvalue { float, float, float, float } %27, 3
  %35 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  store float %34, ptr %35, align 4
  br label %fusion_24.in_bounds-after
}

define void @fusion_11(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 16 dereferenceable(838860800) %arg2, ptr noalias align 128 dereferenceable(838860800) %arg3, ptr noalias align 128 dereferenceable(8388608) %arg4) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !50
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after100, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_26_constant_19 = load float, ptr @4, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_26_constant_19, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_26_constant_19, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !59
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !88
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
  %tile_bound = select i1 %17, i32 100, i32 4096
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
  br label %tile_loop.loop_header, !llvm.loop !89

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !90

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
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
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output82, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
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
  %76 = mul nuw nsw i32 %tile_origin.0, 6400
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 100
  %82 = udiv i32 %77, 6400
  %83 = urem i32 %82, 8192
  %84 = udiv i32 %77, 52428800
  %85 = mul i32 %thread_id.x, 2
  %86 = sub i32 %x_loc, %85
  %Arg_1.2 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 %84, i32 %83, i32 %81
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !48
  %Arg_2.3 = getelementptr inbounds [4 x [8192 x [100 x [64 x float]]]], ptr %arg2, i32 0, i32 %84, i32 %83, i32 %81, i32 %79
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !48
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
  %93 = mul nuw nsw i32 %83, 6400
  %94 = add nuw nsw i32 %92, %93
  %95 = mul nuw nsw i32 %84, 52428800
  %96 = add nuw nsw i32 %94, %95
  %97 = urem i32 %96, 256
  %98 = udiv i32 %96, 256
  %99 = udiv i32 %98, 819200
  %100 = mul nuw nsw i32 %97, 1
  %101 = add nuw nsw i32 0, %100
  %102 = udiv i32 %101, 256
  %103 = mul nuw nsw i32 %98, 1
  %104 = add nuw nsw i32 0, %103
  %105 = urem i32 %104, 100
  %106 = udiv i32 %104, 100
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
  %116 = urem i32 %115, 100
  %117 = udiv i32 %112, 6400
  %118 = add i32 %106, 0
  %119 = add i32 %105, 0
  %120 = add i32 %109, 0
  %Arg_1.25 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 0, i32 %118, i32 %119
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !48
  %Arg_0.1 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 0, i32 %118, i32 0, i32 %120
  %Arg_0.17 = load float, ptr %Arg_0.1, align 4, !invariant.load !48
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
  %129 = urem i32 %128, 100
  %130 = udiv i32 %125, 6400
  %131 = add i32 %106, 0
  %132 = add i32 %105, 0
  %133 = add i32 %122, 0
  %Arg_1.28 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 1, i32 %131, i32 %132
  %Arg_1.29 = load float, ptr %Arg_1.28, align 4, !invariant.load !48
  %Arg_0.110 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 1, i32 %131, i32 0, i32 %133
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !48
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
  %142 = urem i32 %141, 100
  %143 = udiv i32 %138, 6400
  %144 = add i32 %106, 0
  %145 = add i32 %105, 0
  %146 = add i32 %135, 0
  %Arg_1.213 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 2, i32 %144, i32 %145
  %Arg_1.214 = load float, ptr %Arg_1.213, align 4, !invariant.load !48
  %Arg_0.115 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 2, i32 %144, i32 0, i32 %146
  %Arg_0.116 = load float, ptr %Arg_0.115, align 4, !invariant.load !48
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
  %155 = urem i32 %154, 100
  %156 = udiv i32 %151, 6400
  %157 = add i32 %106, 0
  %158 = add i32 %105, 0
  %159 = add i32 %148, 0
  %Arg_1.218 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 3, i32 %157, i32 %158
  %Arg_1.219 = load float, ptr %Arg_1.218, align 4, !invariant.load !48
  %Arg_0.120 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 3, i32 %157, i32 0, i32 %159
  %Arg_0.121 = load float, ptr %Arg_0.120, align 4, !invariant.load !48
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
  %168 = mul nuw nsw i32 %83, 6400
  %169 = add nuw nsw i32 %167, %168
  %170 = mul nuw nsw i32 %84, 52428800
  %171 = add nuw nsw i32 %169, %170
  %172 = urem i32 %171, 256
  %173 = udiv i32 %171, 256
  %174 = udiv i32 %173, 819200
  %175 = getelementptr inbounds [819200 x [256 x float]], ptr %arg3, i32 0, i32 %173, i32 %172
  store float %163, ptr %175, align 4
  br label %x_in_tile-after

x_in_tile-true27:                                 ; preds = %x_in_tile-after
  %176 = mul nuw nsw i32 %32, 1
  %177 = add nuw nsw i32 0, %176
  %178 = mul nuw nsw i32 %31, 64
  %179 = add nuw nsw i32 %177, %178
  %180 = mul nuw nsw i32 %tile_origin.0, 6400
  %181 = add nuw nsw i32 %179, %180
  %182 = udiv i32 %181, 1
  %183 = urem i32 %182, 64
  %184 = udiv i32 %181, 64
  %185 = urem i32 %184, 100
  %186 = udiv i32 %181, 6400
  %187 = urem i32 %186, 8192
  %188 = udiv i32 %181, 52428800
  %189 = mul i32 %thread_id.x, 2
  %190 = sub i32 %x_loc26, %189
  %Arg_1.229 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 %188, i32 %187, i32 %185
  %Arg_1.230 = load float, ptr %Arg_1.229, align 4, !invariant.load !48
  %Arg_2.331 = getelementptr inbounds [4 x [8192 x [100 x [64 x float]]]], ptr %arg2, i32 0, i32 %188, i32 %187, i32 %185, i32 %183
  %Arg_2.332 = load float, ptr %Arg_2.331, align 4, !invariant.load !48
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
  %197 = mul nuw nsw i32 %187, 6400
  %198 = add nuw nsw i32 %196, %197
  %199 = mul nuw nsw i32 %188, 52428800
  %200 = add nuw nsw i32 %198, %199
  %201 = urem i32 %200, 256
  %202 = udiv i32 %200, 256
  %203 = udiv i32 %202, 819200
  %204 = mul nuw nsw i32 %201, 1
  %205 = add nuw nsw i32 0, %204
  %206 = udiv i32 %205, 256
  %207 = mul nuw nsw i32 %202, 1
  %208 = add nuw nsw i32 0, %207
  %209 = urem i32 %208, 100
  %210 = udiv i32 %208, 100
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
  %220 = urem i32 %219, 100
  %221 = udiv i32 %216, 6400
  %222 = add i32 %210, 0
  %223 = add i32 %209, 0
  %224 = add i32 %213, 0
  %Arg_1.237 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 0, i32 %222, i32 %223
  %Arg_1.238 = load float, ptr %Arg_1.237, align 4, !invariant.load !48
  %Arg_0.139 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 0, i32 %222, i32 0, i32 %224
  %Arg_0.140 = load float, ptr %Arg_0.139, align 4, !invariant.load !48
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
  %233 = urem i32 %232, 100
  %234 = udiv i32 %229, 6400
  %235 = add i32 %210, 0
  %236 = add i32 %209, 0
  %237 = add i32 %226, 0
  %Arg_1.243 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 1, i32 %235, i32 %236
  %Arg_1.244 = load float, ptr %Arg_1.243, align 4, !invariant.load !48
  %Arg_0.145 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 1, i32 %235, i32 0, i32 %237
  %Arg_0.146 = load float, ptr %Arg_0.145, align 4, !invariant.load !48
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
  %246 = urem i32 %245, 100
  %247 = udiv i32 %242, 6400
  %248 = add i32 %210, 0
  %249 = add i32 %209, 0
  %250 = add i32 %239, 0
  %Arg_1.249 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 2, i32 %248, i32 %249
  %Arg_1.250 = load float, ptr %Arg_1.249, align 4, !invariant.load !48
  %Arg_0.151 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 2, i32 %248, i32 0, i32 %250
  %Arg_0.152 = load float, ptr %Arg_0.151, align 4, !invariant.load !48
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
  %259 = urem i32 %258, 100
  %260 = udiv i32 %255, 6400
  %261 = add i32 %210, 0
  %262 = add i32 %209, 0
  %263 = add i32 %252, 0
  %Arg_1.255 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr %arg1, i32 0, i32 3, i32 %261, i32 %262
  %Arg_1.256 = load float, ptr %Arg_1.255, align 4, !invariant.load !48
  %Arg_0.157 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr %arg0, i32 0, i32 3, i32 %261, i32 0, i32 %263
  %Arg_0.158 = load float, ptr %Arg_0.157, align 4, !invariant.load !48
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
  %272 = mul nuw nsw i32 %187, 6400
  %273 = add nuw nsw i32 %271, %272
  %274 = mul nuw nsw i32 %188, 52428800
  %275 = add nuw nsw i32 %273, %274
  %276 = urem i32 %275, 256
  %277 = udiv i32 %275, 256
  %278 = udiv i32 %277, 819200
  %279 = getelementptr inbounds [819200 x [256 x float]], ptr %arg3, i32 0, i32 %277, i32 %276
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

define void @fusion_8(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
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
  br i1 %15, label %fusion_8.in_bounds-true, label %fusion_8.in_bounds-after

fusion_8.in_bounds-after:                         ; preds = %concatenate.10.merge28, %entry
  ret void

fusion_8.in_bounds-true:                          ; preds = %entry
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
  %29 = load float, ptr %28, align 4, !invariant.load !48
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
  %43 = load float, ptr %42, align 4, !invariant.load !48
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
  %57 = load float, ptr %56, align 4, !invariant.load !48
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
  %71 = load float, ptr %70, align 4, !invariant.load !48
  br label %concatenate.10.merge

concatenate.pivot.128.:                           ; preds = %fusion_8.in_bounds-true
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
  %90 = load float, ptr %89, align 4, !invariant.load !48
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
  %104 = load float, ptr %103, align 4, !invariant.load !48
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
  %118 = load float, ptr %117, align 4, !invariant.load !48
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
  %132 = load float, ptr %131, align 4, !invariant.load !48
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
  %151 = load float, ptr %150, align 4, !invariant.load !48
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
  %165 = load float, ptr %164, align 4, !invariant.load !48
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
  %179 = load float, ptr %178, align 4, !invariant.load !48
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
  %193 = load float, ptr %192, align 4, !invariant.load !48
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
  %212 = load float, ptr %211, align 4, !invariant.load !48
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
  %226 = load float, ptr %225, align 4, !invariant.load !48
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
  %240 = load float, ptr %239, align 4, !invariant.load !48
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
  %254 = load float, ptr %253, align 4, !invariant.load !48
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
  br label %fusion_8.in_bounds-after
}

define void @fusion_5(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 128 dereferenceable(2097152) %arg1, ptr noalias align 16 dereferenceable(2097152) %arg2, ptr noalias align 16 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !91
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
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
  %17 = load float, ptr %16, align 4, !invariant.load !48
  %18 = load float, ptr %arg3, align 4, !invariant.load !48
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4
  %21 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %22 = load float, ptr %21, align 4, !invariant.load !48
  %add.6 = fadd float %20, %22
  %multiply.7 = fmul float %18, %add.6
  %subtract.8 = fsub float %17, %multiply.7
  %23 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %subtract.8, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4, !invariant.load !48
  %26 = load float, ptr %arg3, align 4, !invariant.load !48
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %28 = load float, ptr %27, align 4
  %29 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %30 = load float, ptr %29, align 4, !invariant.load !48
  %add.61 = fadd float %28, %30
  %multiply.72 = fmul float %26, %add.61
  %subtract.83 = fsub float %25, %multiply.72
  %31 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %subtract.83, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4, !invariant.load !48
  %34 = load float, ptr %arg3, align 4, !invariant.load !48
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %36 = load float, ptr %35, align 4
  %37 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %38 = load float, ptr %37, align 4, !invariant.load !48
  %add.64 = fadd float %36, %38
  %multiply.75 = fmul float %34, %add.64
  %subtract.86 = fsub float %33, %multiply.75
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %subtract.86, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4, !invariant.load !48
  %42 = load float, ptr %arg3, align 4, !invariant.load !48
  %43 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %44 = load float, ptr %43, align 4
  %45 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %46 = load float, ptr %45, align 4, !invariant.load !48
  %add.67 = fadd float %44, %46
  %multiply.78 = fmul float %42, %add.67
  %subtract.89 = fsub float %41, %multiply.78
  %47 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %subtract.89, ptr %47, align 4
  br label %fusion_5.in_bounds-after
}

define void @fusion_34(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1056768) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !92
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !59
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %fusion_34.in_bounds-true, label %fusion_34.in_bounds-after

fusion_34.in_bounds-after:                        ; preds = %fusion_34.in_bounds-true, %entry
  ret void

fusion_34.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !48
  %9 = load float, ptr %arg2, align 4, !invariant.load !48
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !48
  %15 = add i32 %5, 0
  %16 = add i32 %4, 0
  %17 = getelementptr inbounds [1032 x [256 x float]], ptr %arg4, i32 0, i32 %15, i32 %16
  %18 = load float, ptr %17, align 4, !invariant.load !48
  %multiply.10 = fmul float %9, %18
  %subtract.11 = fsub float %14, %multiply.10
  %19 = insertvalue { float, float } %12, float %subtract.11, 1
  %20 = extractvalue { float, float } %19, 0
  %21 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %20, ptr %21, align 4
  %22 = extractvalue { float, float } %19, 1
  %23 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %22, ptr %23, align 4
  br label %fusion_34.in_bounds-after
}

define void @fusion_7(ptr noalias align 16 dereferenceable(991232) %arg0, ptr noalias align 128 dereferenceable(1056768) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(991232) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !93
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
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
  br i1 %15, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %fusion_7.in_bounds-true, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !48
  %18 = load float, ptr %arg2, align 4, !invariant.load !48
  %19 = add i32 %5, 64
  %20 = add i32 %4, 0
  %21 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %19, i32 %20
  %22 = load float, ptr %21, align 4, !invariant.load !48
  %multiply.6 = fmul float %18, %22
  %subtract.7 = fsub float %17, %multiply.6
  %23 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %subtract.7, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4, !invariant.load !48
  %26 = load float, ptr %arg2, align 4, !invariant.load !48
  %27 = add i32 %8, 64
  %28 = add i32 %7, 0
  %29 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %27, i32 %28
  %30 = load float, ptr %29, align 4, !invariant.load !48
  %multiply.61 = fmul float %26, %30
  %subtract.72 = fsub float %25, %multiply.61
  %31 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %subtract.72, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4, !invariant.load !48
  %34 = load float, ptr %arg2, align 4, !invariant.load !48
  %35 = add i32 %11, 64
  %36 = add i32 %10, 0
  %37 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !48
  %multiply.63 = fmul float %34, %38
  %subtract.74 = fsub float %33, %multiply.63
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %subtract.74, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4, !invariant.load !48
  %42 = load float, ptr %arg2, align 4, !invariant.load !48
  %43 = add i32 %14, 64
  %44 = add i32 %13, 0
  %45 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %43, i32 %44
  %46 = load float, ptr %45, align 4, !invariant.load !48
  %multiply.65 = fmul float %42, %46
  %subtract.76 = fsub float %41, %multiply.65
  %47 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %subtract.76, ptr %47, align 4
  br label %fusion_7.in_bounds-after
}

define void @fusion_10(ptr noalias align 16 dereferenceable(204800) %arg0, ptr noalias align 128 dereferenceable(204800) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !94
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !59
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 51200
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 51200
  br i1 %6, label %fusion_10.in_bounds-true, label %fusion_10.in_bounds-after

fusion_10.in_bounds-after:                        ; preds = %fusion_10.in_bounds-true, %entry
  ret void

fusion_10.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !48
  %9 = load float, ptr %arg2, align 4, !invariant.load !48
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_10.in_bounds-after
}

define void @fusion_14(ptr noalias align 16 dereferenceable(26214400) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(498073600) %arg2, ptr noalias align 16 dereferenceable(26214400) %arg3, ptr noalias align 128 dereferenceable(655360000) %arg4, ptr noalias align 16 dereferenceable(26214400) %arg5, ptr noalias align 16 dereferenceable(26214400) %arg6, ptr noalias align 128 dereferenceable(26214400) %arg7, ptr noalias align 16 dereferenceable(26214400) %arg8, ptr noalias align 128 dereferenceable(26214400) %arg9, ptr noalias align 128 dereferenceable(26214400) %arg10, ptr noalias align 128 dereferenceable(26214400) %arg11, ptr noalias align 128 dereferenceable(26214400) %arg12, ptr noalias align 128 dereferenceable(26214400) %arg13, ptr noalias align 128 dereferenceable(26214400) %arg14) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !95
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1638400
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 8
  %5 = udiv i32 %linear_index_base, 8
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 800
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 8
  %10 = udiv i32 %linear_index1, 8
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 800
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 8
  %15 = udiv i32 %linear_index2, 8
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 800
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 8
  %20 = udiv i32 %linear_index3, 8
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 800
  %23 = icmp ult i32 %linear_index_base, 6553600
  br i1 %23, label %fusion_14.in_bounds-true, label %fusion_14.in_bounds-after

fusion_14.in_bounds-after:                        ; preds = %fusion_14.in_bounds-true, %entry
  ret void

fusion_14.in_bounds-true:                         ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !48
  %26 = load float, ptr %arg1, align 4, !invariant.load !48
  %27 = add i32 %7, 0
  %28 = add i32 %6, 0
  %29 = add i32 %4, 144
  %30 = mul nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 152
  %33 = mul nuw nsw i32 %28, 1
  %34 = add nuw nsw i32 0, %33
  %35 = mul nuw nsw i32 %27, 100
  %36 = add nuw nsw i32 %34, %35
  %37 = udiv i32 %36, 819200
  %38 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %36, i32 %31
  %39 = load float, ptr %38, align 4, !invariant.load !48
  %multiply.14 = fmul float %26, %39
  %subtract.15 = fsub float %25, %multiply.14
  %40 = insertvalue { float, float, float, float, float } undef, float %subtract.15, 0
  %41 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %42 = load float, ptr %41, align 4, !invariant.load !48
  %43 = add i32 %7, 0
  %44 = add i32 %6, 0
  %45 = add i32 %4, 128
  %46 = mul nuw nsw i32 %45, 1
  %47 = add nuw nsw i32 0, %46
  %48 = udiv i32 %47, 200
  %49 = mul nuw nsw i32 %44, 1
  %50 = add nuw nsw i32 0, %49
  %51 = mul nuw nsw i32 %43, 100
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 819200
  %54 = getelementptr inbounds [819200 x [200 x float]], ptr %arg4, i32 0, i32 %52, i32 %47
  %55 = load float, ptr %54, align 4, !invariant.load !48
  %56 = add i32 %7, 0
  %57 = add i32 %6, 0
  %58 = add i32 %4, 128
  %59 = mul nuw nsw i32 %58, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 152
  %62 = mul nuw nsw i32 %57, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %56, 100
  %65 = add nuw nsw i32 %63, %64
  %66 = udiv i32 %65, 819200
  %67 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %65, i32 %60
  %68 = load float, ptr %67, align 4, !invariant.load !48
  %add.19 = fadd float %55, %68
  %multiply.20 = fmul float %26, %add.19
  %subtract.21 = fsub float %42, %multiply.20
  %69 = insertvalue { float, float, float, float, float } %40, float %subtract.21, 1
  %70 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %71 = load float, ptr %70, align 4, !invariant.load !48
  %72 = add i32 %7, 0
  %73 = add i32 %6, 0
  %74 = add i32 %4, 136
  %75 = mul nuw nsw i32 %74, 1
  %76 = add nuw nsw i32 0, %75
  %77 = udiv i32 %76, 152
  %78 = mul nuw nsw i32 %73, 1
  %79 = add nuw nsw i32 0, %78
  %80 = mul nuw nsw i32 %72, 100
  %81 = add nuw nsw i32 %79, %80
  %82 = udiv i32 %81, 819200
  %83 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %81, i32 %76
  %84 = load float, ptr %83, align 4, !invariant.load !48
  %multiply.23 = fmul float %26, %84
  %subtract.24 = fsub float %71, %multiply.23
  %85 = insertvalue { float, float, float, float, float } %69, float %subtract.24, 2
  %86 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %87 = load float, ptr %86, align 4, !invariant.load !48
  %88 = mul nuw nsw i32 %4, 1
  %89 = add nuw nsw i32 0, %88
  %90 = udiv i32 %89, 8
  %91 = mul nuw nsw i32 %6, 1
  %92 = add nuw nsw i32 0, %91
  %93 = mul nuw nsw i32 %7, 100
  %94 = add nuw nsw i32 %92, %93
  %95 = udiv i32 %94, 819200
  %96 = load float, ptr %arg1, align 4, !invariant.load !48
  %97 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %98 = load float, ptr %97, align 4, !invariant.load !48
  %multiply.26 = fmul float %96, %98
  %subtract.28 = fsub float %87, %multiply.26
  %99 = insertvalue { float, float, float, float, float } %85, float %subtract.28, 3
  %100 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  %101 = load float, ptr %100, align 4, !invariant.load !48
  %102 = mul nuw nsw i32 %4, 1
  %103 = add nuw nsw i32 0, %102
  %104 = udiv i32 %103, 8
  %105 = mul nuw nsw i32 %6, 1
  %106 = add nuw nsw i32 0, %105
  %107 = mul nuw nsw i32 %7, 100
  %108 = add nuw nsw i32 %106, %107
  %109 = udiv i32 %108, 819200
  %110 = load float, ptr %arg1, align 4, !invariant.load !48
  %111 = getelementptr inbounds float, ptr %arg9, i32 %linear_index_base
  %112 = load float, ptr %111, align 4, !invariant.load !48
  %multiply.29 = fmul float %110, %112
  %subtract.31 = fsub float %101, %multiply.29
  %113 = insertvalue { float, float, float, float, float } %99, float %subtract.31, 4
  %114 = extractvalue { float, float, float, float, float } %113, 0
  %115 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  store float %114, ptr %115, align 4
  %116 = extractvalue { float, float, float, float, float } %113, 1
  %117 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  store float %116, ptr %117, align 4
  %118 = extractvalue { float, float, float, float, float } %113, 2
  %119 = getelementptr inbounds float, ptr %arg12, i32 %linear_index_base
  store float %118, ptr %119, align 4
  %120 = extractvalue { float, float, float, float, float } %113, 3
  %121 = getelementptr inbounds float, ptr %arg13, i32 %linear_index_base
  store float %120, ptr %121, align 4
  %122 = extractvalue { float, float, float, float, float } %113, 4
  %123 = getelementptr inbounds float, ptr %arg14, i32 %linear_index_base
  store float %122, ptr %123, align 4
  %124 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %125 = load float, ptr %124, align 4, !invariant.load !48
  %126 = load float, ptr %arg1, align 4, !invariant.load !48
  %127 = add i32 %12, 0
  %128 = add i32 %11, 0
  %129 = add i32 %9, 144
  %130 = mul nuw nsw i32 %129, 1
  %131 = add nuw nsw i32 0, %130
  %132 = udiv i32 %131, 152
  %133 = mul nuw nsw i32 %128, 1
  %134 = add nuw nsw i32 0, %133
  %135 = mul nuw nsw i32 %127, 100
  %136 = add nuw nsw i32 %134, %135
  %137 = udiv i32 %136, 819200
  %138 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %136, i32 %131
  %139 = load float, ptr %138, align 4, !invariant.load !48
  %multiply.141 = fmul float %126, %139
  %subtract.152 = fsub float %125, %multiply.141
  %140 = insertvalue { float, float, float, float, float } undef, float %subtract.152, 0
  %141 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %142 = load float, ptr %141, align 4, !invariant.load !48
  %143 = add i32 %12, 0
  %144 = add i32 %11, 0
  %145 = add i32 %9, 128
  %146 = mul nuw nsw i32 %145, 1
  %147 = add nuw nsw i32 0, %146
  %148 = udiv i32 %147, 200
  %149 = mul nuw nsw i32 %144, 1
  %150 = add nuw nsw i32 0, %149
  %151 = mul nuw nsw i32 %143, 100
  %152 = add nuw nsw i32 %150, %151
  %153 = udiv i32 %152, 819200
  %154 = getelementptr inbounds [819200 x [200 x float]], ptr %arg4, i32 0, i32 %152, i32 %147
  %155 = load float, ptr %154, align 4, !invariant.load !48
  %156 = add i32 %12, 0
  %157 = add i32 %11, 0
  %158 = add i32 %9, 128
  %159 = mul nuw nsw i32 %158, 1
  %160 = add nuw nsw i32 0, %159
  %161 = udiv i32 %160, 152
  %162 = mul nuw nsw i32 %157, 1
  %163 = add nuw nsw i32 0, %162
  %164 = mul nuw nsw i32 %156, 100
  %165 = add nuw nsw i32 %163, %164
  %166 = udiv i32 %165, 819200
  %167 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %165, i32 %160
  %168 = load float, ptr %167, align 4, !invariant.load !48
  %add.193 = fadd float %155, %168
  %multiply.204 = fmul float %126, %add.193
  %subtract.215 = fsub float %142, %multiply.204
  %169 = insertvalue { float, float, float, float, float } %140, float %subtract.215, 1
  %170 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %171 = load float, ptr %170, align 4, !invariant.load !48
  %172 = add i32 %12, 0
  %173 = add i32 %11, 0
  %174 = add i32 %9, 136
  %175 = mul nuw nsw i32 %174, 1
  %176 = add nuw nsw i32 0, %175
  %177 = udiv i32 %176, 152
  %178 = mul nuw nsw i32 %173, 1
  %179 = add nuw nsw i32 0, %178
  %180 = mul nuw nsw i32 %172, 100
  %181 = add nuw nsw i32 %179, %180
  %182 = udiv i32 %181, 819200
  %183 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %181, i32 %176
  %184 = load float, ptr %183, align 4, !invariant.load !48
  %multiply.236 = fmul float %126, %184
  %subtract.247 = fsub float %171, %multiply.236
  %185 = insertvalue { float, float, float, float, float } %169, float %subtract.247, 2
  %186 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %187 = load float, ptr %186, align 4, !invariant.load !48
  %188 = mul nuw nsw i32 %9, 1
  %189 = add nuw nsw i32 0, %188
  %190 = udiv i32 %189, 8
  %191 = mul nuw nsw i32 %11, 1
  %192 = add nuw nsw i32 0, %191
  %193 = mul nuw nsw i32 %12, 100
  %194 = add nuw nsw i32 %192, %193
  %195 = udiv i32 %194, 819200
  %196 = load float, ptr %arg1, align 4, !invariant.load !48
  %197 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %198 = load float, ptr %197, align 4, !invariant.load !48
  %multiply.268 = fmul float %196, %198
  %subtract.289 = fsub float %187, %multiply.268
  %199 = insertvalue { float, float, float, float, float } %185, float %subtract.289, 3
  %200 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  %201 = load float, ptr %200, align 4, !invariant.load !48
  %202 = mul nuw nsw i32 %9, 1
  %203 = add nuw nsw i32 0, %202
  %204 = udiv i32 %203, 8
  %205 = mul nuw nsw i32 %11, 1
  %206 = add nuw nsw i32 0, %205
  %207 = mul nuw nsw i32 %12, 100
  %208 = add nuw nsw i32 %206, %207
  %209 = udiv i32 %208, 819200
  %210 = load float, ptr %arg1, align 4, !invariant.load !48
  %211 = getelementptr inbounds float, ptr %arg9, i32 %linear_index1
  %212 = load float, ptr %211, align 4, !invariant.load !48
  %multiply.2910 = fmul float %210, %212
  %subtract.3111 = fsub float %201, %multiply.2910
  %213 = insertvalue { float, float, float, float, float } %199, float %subtract.3111, 4
  %214 = extractvalue { float, float, float, float, float } %213, 0
  %215 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  store float %214, ptr %215, align 4
  %216 = extractvalue { float, float, float, float, float } %213, 1
  %217 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  store float %216, ptr %217, align 4
  %218 = extractvalue { float, float, float, float, float } %213, 2
  %219 = getelementptr inbounds float, ptr %arg12, i32 %linear_index1
  store float %218, ptr %219, align 4
  %220 = extractvalue { float, float, float, float, float } %213, 3
  %221 = getelementptr inbounds float, ptr %arg13, i32 %linear_index1
  store float %220, ptr %221, align 4
  %222 = extractvalue { float, float, float, float, float } %213, 4
  %223 = getelementptr inbounds float, ptr %arg14, i32 %linear_index1
  store float %222, ptr %223, align 4
  %224 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %225 = load float, ptr %224, align 4, !invariant.load !48
  %226 = load float, ptr %arg1, align 4, !invariant.load !48
  %227 = add i32 %17, 0
  %228 = add i32 %16, 0
  %229 = add i32 %14, 144
  %230 = mul nuw nsw i32 %229, 1
  %231 = add nuw nsw i32 0, %230
  %232 = udiv i32 %231, 152
  %233 = mul nuw nsw i32 %228, 1
  %234 = add nuw nsw i32 0, %233
  %235 = mul nuw nsw i32 %227, 100
  %236 = add nuw nsw i32 %234, %235
  %237 = udiv i32 %236, 819200
  %238 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %236, i32 %231
  %239 = load float, ptr %238, align 4, !invariant.load !48
  %multiply.1412 = fmul float %226, %239
  %subtract.1513 = fsub float %225, %multiply.1412
  %240 = insertvalue { float, float, float, float, float } undef, float %subtract.1513, 0
  %241 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %242 = load float, ptr %241, align 4, !invariant.load !48
  %243 = add i32 %17, 0
  %244 = add i32 %16, 0
  %245 = add i32 %14, 128
  %246 = mul nuw nsw i32 %245, 1
  %247 = add nuw nsw i32 0, %246
  %248 = udiv i32 %247, 200
  %249 = mul nuw nsw i32 %244, 1
  %250 = add nuw nsw i32 0, %249
  %251 = mul nuw nsw i32 %243, 100
  %252 = add nuw nsw i32 %250, %251
  %253 = udiv i32 %252, 819200
  %254 = getelementptr inbounds [819200 x [200 x float]], ptr %arg4, i32 0, i32 %252, i32 %247
  %255 = load float, ptr %254, align 4, !invariant.load !48
  %256 = add i32 %17, 0
  %257 = add i32 %16, 0
  %258 = add i32 %14, 128
  %259 = mul nuw nsw i32 %258, 1
  %260 = add nuw nsw i32 0, %259
  %261 = udiv i32 %260, 152
  %262 = mul nuw nsw i32 %257, 1
  %263 = add nuw nsw i32 0, %262
  %264 = mul nuw nsw i32 %256, 100
  %265 = add nuw nsw i32 %263, %264
  %266 = udiv i32 %265, 819200
  %267 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %265, i32 %260
  %268 = load float, ptr %267, align 4, !invariant.load !48
  %add.1914 = fadd float %255, %268
  %multiply.2015 = fmul float %226, %add.1914
  %subtract.2116 = fsub float %242, %multiply.2015
  %269 = insertvalue { float, float, float, float, float } %240, float %subtract.2116, 1
  %270 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %271 = load float, ptr %270, align 4, !invariant.load !48
  %272 = add i32 %17, 0
  %273 = add i32 %16, 0
  %274 = add i32 %14, 136
  %275 = mul nuw nsw i32 %274, 1
  %276 = add nuw nsw i32 0, %275
  %277 = udiv i32 %276, 152
  %278 = mul nuw nsw i32 %273, 1
  %279 = add nuw nsw i32 0, %278
  %280 = mul nuw nsw i32 %272, 100
  %281 = add nuw nsw i32 %279, %280
  %282 = udiv i32 %281, 819200
  %283 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %281, i32 %276
  %284 = load float, ptr %283, align 4, !invariant.load !48
  %multiply.2317 = fmul float %226, %284
  %subtract.2418 = fsub float %271, %multiply.2317
  %285 = insertvalue { float, float, float, float, float } %269, float %subtract.2418, 2
  %286 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %287 = load float, ptr %286, align 4, !invariant.load !48
  %288 = mul nuw nsw i32 %14, 1
  %289 = add nuw nsw i32 0, %288
  %290 = udiv i32 %289, 8
  %291 = mul nuw nsw i32 %16, 1
  %292 = add nuw nsw i32 0, %291
  %293 = mul nuw nsw i32 %17, 100
  %294 = add nuw nsw i32 %292, %293
  %295 = udiv i32 %294, 819200
  %296 = load float, ptr %arg1, align 4, !invariant.load !48
  %297 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %298 = load float, ptr %297, align 4, !invariant.load !48
  %multiply.2619 = fmul float %296, %298
  %subtract.2820 = fsub float %287, %multiply.2619
  %299 = insertvalue { float, float, float, float, float } %285, float %subtract.2820, 3
  %300 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  %301 = load float, ptr %300, align 4, !invariant.load !48
  %302 = mul nuw nsw i32 %14, 1
  %303 = add nuw nsw i32 0, %302
  %304 = udiv i32 %303, 8
  %305 = mul nuw nsw i32 %16, 1
  %306 = add nuw nsw i32 0, %305
  %307 = mul nuw nsw i32 %17, 100
  %308 = add nuw nsw i32 %306, %307
  %309 = udiv i32 %308, 819200
  %310 = load float, ptr %arg1, align 4, !invariant.load !48
  %311 = getelementptr inbounds float, ptr %arg9, i32 %linear_index2
  %312 = load float, ptr %311, align 4, !invariant.load !48
  %multiply.2921 = fmul float %310, %312
  %subtract.3122 = fsub float %301, %multiply.2921
  %313 = insertvalue { float, float, float, float, float } %299, float %subtract.3122, 4
  %314 = extractvalue { float, float, float, float, float } %313, 0
  %315 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  store float %314, ptr %315, align 4
  %316 = extractvalue { float, float, float, float, float } %313, 1
  %317 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  store float %316, ptr %317, align 4
  %318 = extractvalue { float, float, float, float, float } %313, 2
  %319 = getelementptr inbounds float, ptr %arg12, i32 %linear_index2
  store float %318, ptr %319, align 4
  %320 = extractvalue { float, float, float, float, float } %313, 3
  %321 = getelementptr inbounds float, ptr %arg13, i32 %linear_index2
  store float %320, ptr %321, align 4
  %322 = extractvalue { float, float, float, float, float } %313, 4
  %323 = getelementptr inbounds float, ptr %arg14, i32 %linear_index2
  store float %322, ptr %323, align 4
  %324 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %325 = load float, ptr %324, align 4, !invariant.load !48
  %326 = load float, ptr %arg1, align 4, !invariant.load !48
  %327 = add i32 %22, 0
  %328 = add i32 %21, 0
  %329 = add i32 %19, 144
  %330 = mul nuw nsw i32 %329, 1
  %331 = add nuw nsw i32 0, %330
  %332 = udiv i32 %331, 152
  %333 = mul nuw nsw i32 %328, 1
  %334 = add nuw nsw i32 0, %333
  %335 = mul nuw nsw i32 %327, 100
  %336 = add nuw nsw i32 %334, %335
  %337 = udiv i32 %336, 819200
  %338 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %336, i32 %331
  %339 = load float, ptr %338, align 4, !invariant.load !48
  %multiply.1423 = fmul float %326, %339
  %subtract.1524 = fsub float %325, %multiply.1423
  %340 = insertvalue { float, float, float, float, float } undef, float %subtract.1524, 0
  %341 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %342 = load float, ptr %341, align 4, !invariant.load !48
  %343 = add i32 %22, 0
  %344 = add i32 %21, 0
  %345 = add i32 %19, 128
  %346 = mul nuw nsw i32 %345, 1
  %347 = add nuw nsw i32 0, %346
  %348 = udiv i32 %347, 200
  %349 = mul nuw nsw i32 %344, 1
  %350 = add nuw nsw i32 0, %349
  %351 = mul nuw nsw i32 %343, 100
  %352 = add nuw nsw i32 %350, %351
  %353 = udiv i32 %352, 819200
  %354 = getelementptr inbounds [819200 x [200 x float]], ptr %arg4, i32 0, i32 %352, i32 %347
  %355 = load float, ptr %354, align 4, !invariant.load !48
  %356 = add i32 %22, 0
  %357 = add i32 %21, 0
  %358 = add i32 %19, 128
  %359 = mul nuw nsw i32 %358, 1
  %360 = add nuw nsw i32 0, %359
  %361 = udiv i32 %360, 152
  %362 = mul nuw nsw i32 %357, 1
  %363 = add nuw nsw i32 0, %362
  %364 = mul nuw nsw i32 %356, 100
  %365 = add nuw nsw i32 %363, %364
  %366 = udiv i32 %365, 819200
  %367 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %365, i32 %360
  %368 = load float, ptr %367, align 4, !invariant.load !48
  %add.1925 = fadd float %355, %368
  %multiply.2026 = fmul float %326, %add.1925
  %subtract.2127 = fsub float %342, %multiply.2026
  %369 = insertvalue { float, float, float, float, float } %340, float %subtract.2127, 1
  %370 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %371 = load float, ptr %370, align 4, !invariant.load !48
  %372 = add i32 %22, 0
  %373 = add i32 %21, 0
  %374 = add i32 %19, 136
  %375 = mul nuw nsw i32 %374, 1
  %376 = add nuw nsw i32 0, %375
  %377 = udiv i32 %376, 152
  %378 = mul nuw nsw i32 %373, 1
  %379 = add nuw nsw i32 0, %378
  %380 = mul nuw nsw i32 %372, 100
  %381 = add nuw nsw i32 %379, %380
  %382 = udiv i32 %381, 819200
  %383 = getelementptr inbounds [819200 x [152 x float]], ptr %arg2, i32 0, i32 %381, i32 %376
  %384 = load float, ptr %383, align 4, !invariant.load !48
  %multiply.2328 = fmul float %326, %384
  %subtract.2429 = fsub float %371, %multiply.2328
  %385 = insertvalue { float, float, float, float, float } %369, float %subtract.2429, 2
  %386 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %387 = load float, ptr %386, align 4, !invariant.load !48
  %388 = mul nuw nsw i32 %19, 1
  %389 = add nuw nsw i32 0, %388
  %390 = udiv i32 %389, 8
  %391 = mul nuw nsw i32 %21, 1
  %392 = add nuw nsw i32 0, %391
  %393 = mul nuw nsw i32 %22, 100
  %394 = add nuw nsw i32 %392, %393
  %395 = udiv i32 %394, 819200
  %396 = load float, ptr %arg1, align 4, !invariant.load !48
  %397 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %398 = load float, ptr %397, align 4, !invariant.load !48
  %multiply.2630 = fmul float %396, %398
  %subtract.2831 = fsub float %387, %multiply.2630
  %399 = insertvalue { float, float, float, float, float } %385, float %subtract.2831, 3
  %400 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  %401 = load float, ptr %400, align 4, !invariant.load !48
  %402 = mul nuw nsw i32 %19, 1
  %403 = add nuw nsw i32 0, %402
  %404 = udiv i32 %403, 8
  %405 = mul nuw nsw i32 %21, 1
  %406 = add nuw nsw i32 0, %405
  %407 = mul nuw nsw i32 %22, 100
  %408 = add nuw nsw i32 %406, %407
  %409 = udiv i32 %408, 819200
  %410 = load float, ptr %arg1, align 4, !invariant.load !48
  %411 = getelementptr inbounds float, ptr %arg9, i32 %linear_index3
  %412 = load float, ptr %411, align 4, !invariant.load !48
  %multiply.2932 = fmul float %410, %412
  %subtract.3133 = fsub float %401, %multiply.2932
  %413 = insertvalue { float, float, float, float, float } %399, float %subtract.3133, 4
  %414 = extractvalue { float, float, float, float, float } %413, 0
  %415 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  store float %414, ptr %415, align 4
  %416 = extractvalue { float, float, float, float, float } %413, 1
  %417 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  store float %416, ptr %417, align 4
  %418 = extractvalue { float, float, float, float, float } %413, 2
  %419 = getelementptr inbounds float, ptr %arg12, i32 %linear_index3
  store float %418, ptr %419, align 4
  %420 = extractvalue { float, float, float, float, float } %413, 3
  %421 = getelementptr inbounds float, ptr %arg13, i32 %linear_index3
  store float %420, ptr %421, align 4
  %422 = extractvalue { float, float, float, float, float } %413, 4
  %423 = getelementptr inbounds float, ptr %arg14, i32 %linear_index3
  store float %422, ptr %423, align 4
  br label %fusion_14.in_bounds-after
}

define void @fusion_4(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(655360000) %arg2, ptr noalias align 128 dereferenceable(498073600) %arg3, ptr noalias align 16 dereferenceable(209715200) %arg4, ptr noalias align 128 dereferenceable(209715200) %arg5, ptr noalias align 128 dereferenceable(209715200) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 13107200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 6400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %linear_index1, 64
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 6400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 64
  %15 = udiv i32 %linear_index2, 64
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 6400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 64
  %20 = udiv i32 %linear_index3, 64
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 6400
  %23 = icmp ult i32 %linear_index_base, 52428800
  br i1 %23, label %fusion_4.in_bounds-true, label %fusion_4.in_bounds-after

fusion_4.in_bounds-after:                         ; preds = %fusion_4.in_bounds-true, %entry
  ret void

fusion_4.in_bounds-true:                          ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !48
  %26 = load float, ptr %arg1, align 4, !invariant.load !48
  %27 = add i32 %7, 0
  %28 = add i32 %6, 0
  %29 = add i32 %4, 0
  %30 = mul nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 200
  %33 = mul nuw nsw i32 %28, 1
  %34 = add nuw nsw i32 0, %33
  %35 = mul nuw nsw i32 %27, 100
  %36 = add nuw nsw i32 %34, %35
  %37 = udiv i32 %36, 819200
  %38 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %36, i32 %31
  %39 = load float, ptr %38, align 4, !invariant.load !48
  %40 = add i32 %7, 0
  %41 = add i32 %6, 0
  %42 = add i32 %4, 0
  %43 = mul nuw nsw i32 %42, 1
  %44 = add nuw nsw i32 0, %43
  %45 = udiv i32 %44, 152
  %46 = mul nuw nsw i32 %41, 1
  %47 = add nuw nsw i32 0, %46
  %48 = mul nuw nsw i32 %40, 100
  %49 = add nuw nsw i32 %47, %48
  %50 = udiv i32 %49, 819200
  %51 = getelementptr inbounds [819200 x [152 x float]], ptr %arg3, i32 0, i32 %49, i32 %44
  %52 = load float, ptr %51, align 4, !invariant.load !48
  %add.11 = fadd float %39, %52
  %multiply.12 = fmul float %26, %add.11
  %subtract.13 = fsub float %25, %multiply.12
  %53 = insertvalue { float, float } undef, float %subtract.13, 0
  %54 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %55 = load float, ptr %54, align 4, !invariant.load !48
  %56 = add i32 %7, 0
  %57 = add i32 %6, 0
  %58 = add i32 %4, 64
  %59 = mul nuw nsw i32 %58, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 200
  %62 = mul nuw nsw i32 %57, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %56, 100
  %65 = add nuw nsw i32 %63, %64
  %66 = udiv i32 %65, 819200
  %67 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %65, i32 %60
  %68 = load float, ptr %67, align 4, !invariant.load !48
  %69 = add i32 %7, 0
  %70 = add i32 %6, 0
  %71 = add i32 %4, 64
  %72 = mul nuw nsw i32 %71, 1
  %73 = add nuw nsw i32 0, %72
  %74 = udiv i32 %73, 152
  %75 = mul nuw nsw i32 %70, 1
  %76 = add nuw nsw i32 0, %75
  %77 = mul nuw nsw i32 %69, 100
  %78 = add nuw nsw i32 %76, %77
  %79 = udiv i32 %78, 819200
  %80 = getelementptr inbounds [819200 x [152 x float]], ptr %arg3, i32 0, i32 %78, i32 %73
  %81 = load float, ptr %80, align 4, !invariant.load !48
  %add.16 = fadd float %68, %81
  %multiply.17 = fmul float %26, %add.16
  %subtract.18 = fsub float %55, %multiply.17
  %82 = insertvalue { float, float } %53, float %subtract.18, 1
  %83 = extractvalue { float, float } %82, 0
  %84 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %83, ptr %84, align 4
  %85 = extractvalue { float, float } %82, 1
  %86 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %85, ptr %86, align 4
  %87 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %88 = load float, ptr %87, align 4, !invariant.load !48
  %89 = load float, ptr %arg1, align 4, !invariant.load !48
  %90 = add i32 %12, 0
  %91 = add i32 %11, 0
  %92 = add i32 %9, 0
  %93 = mul nuw nsw i32 %92, 1
  %94 = add nuw nsw i32 0, %93
  %95 = udiv i32 %94, 200
  %96 = mul nuw nsw i32 %91, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %90, 100
  %99 = add nuw nsw i32 %97, %98
  %100 = udiv i32 %99, 819200
  %101 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %99, i32 %94
  %102 = load float, ptr %101, align 4, !invariant.load !48
  %103 = add i32 %12, 0
  %104 = add i32 %11, 0
  %105 = add i32 %9, 0
  %106 = mul nuw nsw i32 %105, 1
  %107 = add nuw nsw i32 0, %106
  %108 = udiv i32 %107, 152
  %109 = mul nuw nsw i32 %104, 1
  %110 = add nuw nsw i32 0, %109
  %111 = mul nuw nsw i32 %103, 100
  %112 = add nuw nsw i32 %110, %111
  %113 = udiv i32 %112, 819200
  %114 = getelementptr inbounds [819200 x [152 x float]], ptr %arg3, i32 0, i32 %112, i32 %107
  %115 = load float, ptr %114, align 4, !invariant.load !48
  %add.111 = fadd float %102, %115
  %multiply.122 = fmul float %89, %add.111
  %subtract.133 = fsub float %88, %multiply.122
  %116 = insertvalue { float, float } undef, float %subtract.133, 0
  %117 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %118 = load float, ptr %117, align 4, !invariant.load !48
  %119 = add i32 %12, 0
  %120 = add i32 %11, 0
  %121 = add i32 %9, 64
  %122 = mul nuw nsw i32 %121, 1
  %123 = add nuw nsw i32 0, %122
  %124 = udiv i32 %123, 200
  %125 = mul nuw nsw i32 %120, 1
  %126 = add nuw nsw i32 0, %125
  %127 = mul nuw nsw i32 %119, 100
  %128 = add nuw nsw i32 %126, %127
  %129 = udiv i32 %128, 819200
  %130 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %128, i32 %123
  %131 = load float, ptr %130, align 4, !invariant.load !48
  %132 = add i32 %12, 0
  %133 = add i32 %11, 0
  %134 = add i32 %9, 64
  %135 = mul nuw nsw i32 %134, 1
  %136 = add nuw nsw i32 0, %135
  %137 = udiv i32 %136, 152
  %138 = mul nuw nsw i32 %133, 1
  %139 = add nuw nsw i32 0, %138
  %140 = mul nuw nsw i32 %132, 100
  %141 = add nuw nsw i32 %139, %140
  %142 = udiv i32 %141, 819200
  %143 = getelementptr inbounds [819200 x [152 x float]], ptr %arg3, i32 0, i32 %141, i32 %136
  %144 = load float, ptr %143, align 4, !invariant.load !48
  %add.164 = fadd float %131, %144
  %multiply.175 = fmul float %89, %add.164
  %subtract.186 = fsub float %118, %multiply.175
  %145 = insertvalue { float, float } %116, float %subtract.186, 1
  %146 = extractvalue { float, float } %145, 0
  %147 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %146, ptr %147, align 4
  %148 = extractvalue { float, float } %145, 1
  %149 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %148, ptr %149, align 4
  %150 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %151 = load float, ptr %150, align 4, !invariant.load !48
  %152 = load float, ptr %arg1, align 4, !invariant.load !48
  %153 = add i32 %17, 0
  %154 = add i32 %16, 0
  %155 = add i32 %14, 0
  %156 = mul nuw nsw i32 %155, 1
  %157 = add nuw nsw i32 0, %156
  %158 = udiv i32 %157, 200
  %159 = mul nuw nsw i32 %154, 1
  %160 = add nuw nsw i32 0, %159
  %161 = mul nuw nsw i32 %153, 100
  %162 = add nuw nsw i32 %160, %161
  %163 = udiv i32 %162, 819200
  %164 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %162, i32 %157
  %165 = load float, ptr %164, align 4, !invariant.load !48
  %166 = add i32 %17, 0
  %167 = add i32 %16, 0
  %168 = add i32 %14, 0
  %169 = mul nuw nsw i32 %168, 1
  %170 = add nuw nsw i32 0, %169
  %171 = udiv i32 %170, 152
  %172 = mul nuw nsw i32 %167, 1
  %173 = add nuw nsw i32 0, %172
  %174 = mul nuw nsw i32 %166, 100
  %175 = add nuw nsw i32 %173, %174
  %176 = udiv i32 %175, 819200
  %177 = getelementptr inbounds [819200 x [152 x float]], ptr %arg3, i32 0, i32 %175, i32 %170
  %178 = load float, ptr %177, align 4, !invariant.load !48
  %add.117 = fadd float %165, %178
  %multiply.128 = fmul float %152, %add.117
  %subtract.139 = fsub float %151, %multiply.128
  %179 = insertvalue { float, float } undef, float %subtract.139, 0
  %180 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %181 = load float, ptr %180, align 4, !invariant.load !48
  %182 = add i32 %17, 0
  %183 = add i32 %16, 0
  %184 = add i32 %14, 64
  %185 = mul nuw nsw i32 %184, 1
  %186 = add nuw nsw i32 0, %185
  %187 = udiv i32 %186, 200
  %188 = mul nuw nsw i32 %183, 1
  %189 = add nuw nsw i32 0, %188
  %190 = mul nuw nsw i32 %182, 100
  %191 = add nuw nsw i32 %189, %190
  %192 = udiv i32 %191, 819200
  %193 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %191, i32 %186
  %194 = load float, ptr %193, align 4, !invariant.load !48
  %195 = add i32 %17, 0
  %196 = add i32 %16, 0
  %197 = add i32 %14, 64
  %198 = mul nuw nsw i32 %197, 1
  %199 = add nuw nsw i32 0, %198
  %200 = udiv i32 %199, 152
  %201 = mul nuw nsw i32 %196, 1
  %202 = add nuw nsw i32 0, %201
  %203 = mul nuw nsw i32 %195, 100
  %204 = add nuw nsw i32 %202, %203
  %205 = udiv i32 %204, 819200
  %206 = getelementptr inbounds [819200 x [152 x float]], ptr %arg3, i32 0, i32 %204, i32 %199
  %207 = load float, ptr %206, align 4, !invariant.load !48
  %add.1610 = fadd float %194, %207
  %multiply.1711 = fmul float %152, %add.1610
  %subtract.1812 = fsub float %181, %multiply.1711
  %208 = insertvalue { float, float } %179, float %subtract.1812, 1
  %209 = extractvalue { float, float } %208, 0
  %210 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %209, ptr %210, align 4
  %211 = extractvalue { float, float } %208, 1
  %212 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %211, ptr %212, align 4
  %213 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %214 = load float, ptr %213, align 4, !invariant.load !48
  %215 = load float, ptr %arg1, align 4, !invariant.load !48
  %216 = add i32 %22, 0
  %217 = add i32 %21, 0
  %218 = add i32 %19, 0
  %219 = mul nuw nsw i32 %218, 1
  %220 = add nuw nsw i32 0, %219
  %221 = udiv i32 %220, 200
  %222 = mul nuw nsw i32 %217, 1
  %223 = add nuw nsw i32 0, %222
  %224 = mul nuw nsw i32 %216, 100
  %225 = add nuw nsw i32 %223, %224
  %226 = udiv i32 %225, 819200
  %227 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %225, i32 %220
  %228 = load float, ptr %227, align 4, !invariant.load !48
  %229 = add i32 %22, 0
  %230 = add i32 %21, 0
  %231 = add i32 %19, 0
  %232 = mul nuw nsw i32 %231, 1
  %233 = add nuw nsw i32 0, %232
  %234 = udiv i32 %233, 152
  %235 = mul nuw nsw i32 %230, 1
  %236 = add nuw nsw i32 0, %235
  %237 = mul nuw nsw i32 %229, 100
  %238 = add nuw nsw i32 %236, %237
  %239 = udiv i32 %238, 819200
  %240 = getelementptr inbounds [819200 x [152 x float]], ptr %arg3, i32 0, i32 %238, i32 %233
  %241 = load float, ptr %240, align 4, !invariant.load !48
  %add.1113 = fadd float %228, %241
  %multiply.1214 = fmul float %215, %add.1113
  %subtract.1315 = fsub float %214, %multiply.1214
  %242 = insertvalue { float, float } undef, float %subtract.1315, 0
  %243 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %244 = load float, ptr %243, align 4, !invariant.load !48
  %245 = add i32 %22, 0
  %246 = add i32 %21, 0
  %247 = add i32 %19, 64
  %248 = mul nuw nsw i32 %247, 1
  %249 = add nuw nsw i32 0, %248
  %250 = udiv i32 %249, 200
  %251 = mul nuw nsw i32 %246, 1
  %252 = add nuw nsw i32 0, %251
  %253 = mul nuw nsw i32 %245, 100
  %254 = add nuw nsw i32 %252, %253
  %255 = udiv i32 %254, 819200
  %256 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %254, i32 %249
  %257 = load float, ptr %256, align 4, !invariant.load !48
  %258 = add i32 %22, 0
  %259 = add i32 %21, 0
  %260 = add i32 %19, 64
  %261 = mul nuw nsw i32 %260, 1
  %262 = add nuw nsw i32 0, %261
  %263 = udiv i32 %262, 152
  %264 = mul nuw nsw i32 %259, 1
  %265 = add nuw nsw i32 0, %264
  %266 = mul nuw nsw i32 %258, 100
  %267 = add nuw nsw i32 %265, %266
  %268 = udiv i32 %267, 819200
  %269 = getelementptr inbounds [819200 x [152 x float]], ptr %arg3, i32 0, i32 %267, i32 %262
  %270 = load float, ptr %269, align 4, !invariant.load !48
  %add.1616 = fadd float %257, %270
  %multiply.1717 = fmul float %215, %add.1616
  %subtract.1818 = fsub float %244, %multiply.1717
  %271 = insertvalue { float, float } %242, float %subtract.1818, 1
  %272 = extractvalue { float, float } %271, 0
  %273 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %272, ptr %273, align 4
  %274 = extractvalue { float, float } %271, 1
  %275 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %274, ptr %275, align 4
  br label %fusion_4.in_bounds-after
}

define void @fusion_1(ptr noalias align 128 dereferenceable(655360000) %arg0, ptr noalias align 128 dereferenceable(209715200) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 13107200
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
  %15 = icmp ult i32 %linear_index_base, 52428800
  br i1 %15, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %fusion_1.in_bounds-true, %entry
  ret void

fusion_1.in_bounds-true:                          ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 64
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 100
  %22 = udiv i32 %20, 100
  %23 = udiv i32 %22, 8192
  %24 = add i32 %22, 0
  %25 = add i32 %21, 0
  %26 = add i32 %17, 136
  %27 = mul nuw nsw i32 %26, 1
  %28 = add nuw nsw i32 0, %27
  %29 = udiv i32 %28, 200
  %30 = mul nuw nsw i32 %25, 1
  %31 = add nuw nsw i32 0, %30
  %32 = mul nuw nsw i32 %24, 100
  %33 = add nuw nsw i32 %31, %32
  %34 = udiv i32 %33, 819200
  %35 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %33, i32 %28
  %36 = load float, ptr %35, align 4, !invariant.load !48
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %36, ptr %37, align 4
  %38 = mul nuw nsw i32 %7, 1
  %39 = add nuw nsw i32 0, %38
  %40 = udiv i32 %39, 64
  %41 = mul nuw nsw i32 %8, 1
  %42 = add nuw nsw i32 0, %41
  %43 = urem i32 %42, 100
  %44 = udiv i32 %42, 100
  %45 = udiv i32 %44, 8192
  %46 = add i32 %44, 0
  %47 = add i32 %43, 0
  %48 = add i32 %39, 136
  %49 = mul nuw nsw i32 %48, 1
  %50 = add nuw nsw i32 0, %49
  %51 = udiv i32 %50, 200
  %52 = mul nuw nsw i32 %47, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %46, 100
  %55 = add nuw nsw i32 %53, %54
  %56 = udiv i32 %55, 819200
  %57 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %55, i32 %50
  %58 = load float, ptr %57, align 4, !invariant.load !48
  %59 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %58, ptr %59, align 4
  %60 = mul nuw nsw i32 %10, 1
  %61 = add nuw nsw i32 0, %60
  %62 = udiv i32 %61, 64
  %63 = mul nuw nsw i32 %11, 1
  %64 = add nuw nsw i32 0, %63
  %65 = urem i32 %64, 100
  %66 = udiv i32 %64, 100
  %67 = udiv i32 %66, 8192
  %68 = add i32 %66, 0
  %69 = add i32 %65, 0
  %70 = add i32 %61, 136
  %71 = mul nuw nsw i32 %70, 1
  %72 = add nuw nsw i32 0, %71
  %73 = udiv i32 %72, 200
  %74 = mul nuw nsw i32 %69, 1
  %75 = add nuw nsw i32 0, %74
  %76 = mul nuw nsw i32 %68, 100
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 819200
  %79 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %77, i32 %72
  %80 = load float, ptr %79, align 4, !invariant.load !48
  %81 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %80, ptr %81, align 4
  %82 = mul nuw nsw i32 %13, 1
  %83 = add nuw nsw i32 0, %82
  %84 = udiv i32 %83, 64
  %85 = mul nuw nsw i32 %14, 1
  %86 = add nuw nsw i32 0, %85
  %87 = urem i32 %86, 100
  %88 = udiv i32 %86, 100
  %89 = udiv i32 %88, 8192
  %90 = add i32 %88, 0
  %91 = add i32 %87, 0
  %92 = add i32 %83, 136
  %93 = mul nuw nsw i32 %92, 1
  %94 = add nuw nsw i32 0, %93
  %95 = udiv i32 %94, 200
  %96 = mul nuw nsw i32 %91, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %90, 100
  %99 = add nuw nsw i32 %97, %98
  %100 = udiv i32 %99, 819200
  %101 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %99, i32 %94
  %102 = load float, ptr %101, align 4, !invariant.load !48
  %103 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %102, ptr %103, align 4
  br label %fusion_1.in_bounds-after
}

define void @fusion(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 128 dereferenceable(209715200) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(209715200) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !47
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 13107200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 6400
  %5 = udiv i32 %linear_index_base, 6400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 6400
  %8 = udiv i32 %linear_index1, 6400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 6400
  %11 = udiv i32 %linear_index2, 6400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 6400
  %14 = udiv i32 %linear_index3, 6400
  %15 = icmp ult i32 %linear_index_base, 52428800
  br i1 %15, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !48
  %18 = mul nuw nsw i32 %4, 1
  %19 = add nuw nsw i32 0, %18
  %20 = urem i32 %19, 64
  %21 = udiv i32 %19, 64
  %22 = udiv i32 %21, 100
  %23 = mul nuw nsw i32 %5, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 8192
  %26 = load float, ptr %arg2, align 4, !invariant.load !48
  %27 = mul nuw nsw i32 %20, 1
  %28 = add nuw nsw i32 0, %27
  %29 = udiv i32 %28, 64
  %30 = mul nuw nsw i32 %21, 1
  %31 = add nuw nsw i32 0, %30
  %32 = mul nuw nsw i32 %24, 100
  %33 = add nuw nsw i32 %31, %32
  %34 = udiv i32 %33, 819200
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %36 = load float, ptr %35, align 4, !invariant.load !48
  %multiply.6 = fmul float %26, %36
  %subtract.8 = fsub float %17, %multiply.6
  %37 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %subtract.8, ptr %37, align 4
  %38 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %39 = load float, ptr %38, align 4, !invariant.load !48
  %40 = mul nuw nsw i32 %7, 1
  %41 = add nuw nsw i32 0, %40
  %42 = urem i32 %41, 64
  %43 = udiv i32 %41, 64
  %44 = udiv i32 %43, 100
  %45 = mul nuw nsw i32 %8, 1
  %46 = add nuw nsw i32 0, %45
  %47 = udiv i32 %46, 8192
  %48 = load float, ptr %arg2, align 4, !invariant.load !48
  %49 = mul nuw nsw i32 %42, 1
  %50 = add nuw nsw i32 0, %49
  %51 = udiv i32 %50, 64
  %52 = mul nuw nsw i32 %43, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %46, 100
  %55 = add nuw nsw i32 %53, %54
  %56 = udiv i32 %55, 819200
  %57 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %58 = load float, ptr %57, align 4, !invariant.load !48
  %multiply.61 = fmul float %48, %58
  %subtract.82 = fsub float %39, %multiply.61
  %59 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %subtract.82, ptr %59, align 4
  %60 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %61 = load float, ptr %60, align 4, !invariant.load !48
  %62 = mul nuw nsw i32 %10, 1
  %63 = add nuw nsw i32 0, %62
  %64 = urem i32 %63, 64
  %65 = udiv i32 %63, 64
  %66 = udiv i32 %65, 100
  %67 = mul nuw nsw i32 %11, 1
  %68 = add nuw nsw i32 0, %67
  %69 = udiv i32 %68, 8192
  %70 = load float, ptr %arg2, align 4, !invariant.load !48
  %71 = mul nuw nsw i32 %64, 1
  %72 = add nuw nsw i32 0, %71
  %73 = udiv i32 %72, 64
  %74 = mul nuw nsw i32 %65, 1
  %75 = add nuw nsw i32 0, %74
  %76 = mul nuw nsw i32 %68, 100
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 819200
  %79 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %80 = load float, ptr %79, align 4, !invariant.load !48
  %multiply.63 = fmul float %70, %80
  %subtract.84 = fsub float %61, %multiply.63
  %81 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %subtract.84, ptr %81, align 4
  %82 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %83 = load float, ptr %82, align 4, !invariant.load !48
  %84 = mul nuw nsw i32 %13, 1
  %85 = add nuw nsw i32 0, %84
  %86 = urem i32 %85, 64
  %87 = udiv i32 %85, 64
  %88 = udiv i32 %87, 100
  %89 = mul nuw nsw i32 %14, 1
  %90 = add nuw nsw i32 0, %89
  %91 = udiv i32 %90, 8192
  %92 = load float, ptr %arg2, align 4, !invariant.load !48
  %93 = mul nuw nsw i32 %86, 1
  %94 = add nuw nsw i32 0, %93
  %95 = udiv i32 %94, 64
  %96 = mul nuw nsw i32 %87, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %90, 100
  %99 = add nuw nsw i32 %97, %98
  %100 = udiv i32 %99, 819200
  %101 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %102 = load float, ptr %101, align 4, !invariant.load !48
  %multiply.65 = fmul float %92, %102
  %subtract.86 = fsub float %83, %multiply.65
  %103 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %subtract.86, ptr %103, align 4
  br label %fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45}

!0 = !{ptr @fusion_39, !"kernel", i32 1}
!1 = !{ptr @fusion_39, !"reqntidx", i32 256}
!2 = !{ptr @concatenate_3, !"kernel", i32 1}
!3 = !{ptr @concatenate_3, !"reqntidx", i32 256}
!4 = !{ptr @fusion_38, !"kernel", i32 1}
!5 = !{ptr @fusion_38, !"reqntidx", i32 96}
!6 = !{ptr @fusion_36, !"kernel", i32 1}
!7 = !{ptr @fusion_36, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_32, !"kernel", i32 1}
!9 = !{ptr @fusion_32, !"reqntidx", i32 96}
!10 = !{ptr @fusion_31, !"kernel", i32 1}
!11 = !{ptr @fusion_31, !"reqntidx", i32 256}
!12 = !{ptr @fusion_37, !"kernel", i32 1}
!13 = !{ptr @fusion_37, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_26, !"kernel", i32 1}
!15 = !{ptr @fusion_26, !"reqntidx", i32 256}
!16 = !{ptr @fusion_12, !"kernel", i32 1}
!17 = !{ptr @fusion_12, !"reqntidx", i32 128}
!18 = !{ptr @reduce_114, !"kernel", i32 1}
!19 = !{ptr @reduce_114, !"reqntidx", i32 32}
!20 = !{ptr @fusion_40, !"kernel", i32 1}
!21 = !{ptr @fusion_40, !"reqntidx", i32 32}
!22 = !{ptr @fusion_29, !"kernel", i32 1}
!23 = !{ptr @fusion_29, !"reqntidx", i32 4}
!24 = !{ptr @fusion_24, !"kernel", i32 1}
!25 = !{ptr @fusion_24, !"reqntidx", i32 4}
!26 = !{ptr @fusion_11, !"kernel", i32 1}
!27 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!28 = !{ptr @fusion_8, !"kernel", i32 1}
!29 = !{ptr @fusion_8, !"reqntidx", i32 256}
!30 = !{ptr @fusion_5, !"kernel", i32 1}
!31 = !{ptr @fusion_5, !"reqntidx", i32 256}
!32 = !{ptr @fusion_34, !"kernel", i32 1}
!33 = !{ptr @fusion_34, !"reqntidx", i32 1024}
!34 = !{ptr @fusion_7, !"kernel", i32 1}
!35 = !{ptr @fusion_7, !"reqntidx", i32 256}
!36 = !{ptr @fusion_10, !"kernel", i32 1}
!37 = !{ptr @fusion_10, !"reqntidx", i32 1024}
!38 = !{ptr @fusion_14, !"kernel", i32 1}
!39 = !{ptr @fusion_14, !"reqntidx", i32 256}
!40 = !{ptr @fusion_4, !"kernel", i32 1}
!41 = !{ptr @fusion_4, !"reqntidx", i32 256}
!42 = !{ptr @fusion_1, !"kernel", i32 1}
!43 = !{ptr @fusion_1, !"reqntidx", i32 256}
!44 = !{ptr @fusion, !"kernel", i32 1}
!45 = !{ptr @fusion, !"reqntidx", i32 256}
!46 = !{i32 0, i32 2048}
!47 = !{i32 0, i32 256}
!48 = !{}
!49 = !{i32 0, i32 8256}
!50 = !{i32 0, i32 1}
!51 = !{i32 0, i32 96}
!52 = !{i32 0, i32 1092267}
!53 = distinct !{!53, !54}
!54 = !{!"llvm.loop.vectorize.enable", i1 false}
!55 = distinct !{!55, !54, !56}
!56 = !{!"llvm.loop.unroll.full"}
!57 = distinct !{!57, !54, !56}
!58 = !{i32 0, i32 2}
!59 = !{i32 0, i32 1024}
!60 = !{i32 0, i32 10923}
!61 = distinct !{!61, !54}
!62 = distinct !{!62, !54, !56}
!63 = distinct !{!63, !54, !56}
!64 = !{i32 0, i32 3200}
!65 = !{i32 0, i32 38}
!66 = !{i32 0, i32 800}
!67 = !{i32 0, i32 128}
!68 = distinct !{!68, !54}
!69 = distinct !{!69, !54, !56}
!70 = distinct !{!70, !54, !56}
!71 = !{i32 0, i32 32}
!72 = !{i32 0, i32 4}
!73 = distinct !{!73, !54}
!74 = distinct !{!74, !54, !56}
!75 = distinct !{!75, !54, !56}
!76 = distinct !{!76, !54}
!77 = distinct !{!77, !54, !56}
!78 = distinct !{!78, !54, !56}
!79 = distinct !{!79, !54}
!80 = distinct !{!80, !54, !56}
!81 = distinct !{!81, !54, !56}
!82 = distinct !{!82, !54}
!83 = distinct !{!83, !54, !56}
!84 = distinct !{!84, !54, !56}
!85 = distinct !{!85, !54}
!86 = distinct !{!86, !54, !56}
!87 = distinct !{!87, !54, !56}
!88 = !{i32 0, i32 32768}
!89 = distinct !{!89, !54, !56}
!90 = distinct !{!90, !54}
!91 = !{i32 0, i32 512}
!92 = !{i32 0, i32 16}
!93 = !{i32 0, i32 242}
!94 = !{i32 0, i32 50}
!95 = !{i32 0, i32 6400}
!96 = !{i32 0, i32 51200}
