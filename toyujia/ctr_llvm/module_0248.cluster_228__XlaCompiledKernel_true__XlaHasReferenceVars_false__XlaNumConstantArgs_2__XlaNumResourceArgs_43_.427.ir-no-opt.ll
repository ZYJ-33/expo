target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_23 = constant [64 x i8] c"\F3\045>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_22 = constant [64 x i8] c"\00\00\80>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_18 = constant [64 x i8] c"\00\00\80\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF"
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@2 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@3 = private unnamed_addr constant [4 x i8] zeroinitializer
@tr_tile_0 = private addrspace(3) global [1 x [32 x [33 x float]]] undef
@4 = private unnamed_addr constant [4 x i8] zeroinitializer
@5 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@6 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@8 = private unnamed_addr constant [4 x i8] c"1\0C\C3;"
@9 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@10 = private unnamed_addr constant [4 x i8] c"1\0C\C3;"
@11 = private unnamed_addr constant [4 x i8] c"\AC\C5'7"
@12 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache2 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache3 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@13 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache4 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@14 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache5 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @copy_fusion(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(4) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !73
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = icmp ult i32 %linear_index, 1
  br i1 %3, label %copy_fusion.in_bounds-true, label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %copy_fusion.in_bounds-true, %entry
  ret void

copy_fusion.in_bounds-true:                       ; preds = %entry
  %4 = load float, ptr %arg0, align 4, !invariant.load !74
  %5 = insertvalue { float, float } undef, float %4, 0
  %6 = load float, ptr %arg1, align 4, !invariant.load !74
  %7 = insertvalue { float, float } %5, float %6, 1
  %8 = extractvalue { float, float } %7, 0
  store float %8, ptr %arg2, align 4
  %9 = extractvalue { float, float } %7, 1
  store float %9, ptr %arg3, align 4
  br label %copy_fusion.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @concatenate_17(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(40960) %arg1, ptr noalias align 128 dereferenceable(172032) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !75
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 43008
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 43008
  br i1 %6, label %concatenate_17.in_bounds-true, label %concatenate_17.in_bounds-after

concatenate_17.in_bounds-after:                   ; preds = %concatenate.3.merge, %entry
  ret void

concatenate_17.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %7 = phi i32 [ 0, %concatenate.pivot.0. ]
  %8 = sub nsw i32 %5, %7
  %9 = getelementptr inbounds [128 x [256 x float]], ptr %arg0, i32 0, i32 %8, i32 %4
  %10 = load float, ptr %9, align 4, !invariant.load !74
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.128.1
  %11 = phi i32 [ 128, %concatenate.pivot.128.1 ]
  %12 = sub nsw i32 %5, %11
  %13 = getelementptr inbounds [40 x [256 x float]], ptr %arg1, i32 0, i32 %12, i32 %4
  %14 = load float, ptr %13, align 4, !invariant.load !74
  br label %concatenate.3.merge

concatenate.pivot.128.:                           ; preds = %concatenate_17.in_bounds-true
  %15 = icmp ult i32 %5, 128
  br i1 %15, label %concatenate.pivot.0., label %concatenate.pivot.128.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.128.
  br label %concat_index_from_operand_id0

concatenate.pivot.128.1:                          ; preds = %concatenate.pivot.128.
  br label %concat_index_from_operand_id1

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %16 = phi float [ %10, %concat_index_from_operand_id0 ], [ %14, %concat_index_from_operand_id1 ]
  %17 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  store float %16, ptr %17, align 4
  br label %concatenate_17.in_bounds-after
}

define void @concatenate_19(ptr noalias align 16 dereferenceable(991232) %arg0, ptr noalias align 16 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(1056768) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !77
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 66048
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
  %15 = icmp ult i32 %linear_index_base, 264192
  br i1 %15, label %concatenate_19.in_bounds-true, label %concatenate_19.in_bounds-after

concatenate_19.in_bounds-after:                   ; preds = %concatenate.3.merge14, %entry
  ret void

concatenate_19.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.968.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %5, %16
  %18 = getelementptr inbounds [968 x [256 x float]], ptr %arg0, i32 0, i32 %17, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !74
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.968.1
  %20 = phi i32 [ 968, %concatenate.pivot.968.1 ]
  %21 = sub nsw i32 %5, %20
  %22 = getelementptr inbounds [64 x [256 x float]], ptr %arg1, i32 0, i32 %21, i32 %4
  %23 = load float, ptr %22, align 4, !invariant.load !74
  br label %concatenate.3.merge

concatenate.pivot.968.:                           ; preds = %concatenate_19.in_bounds-true
  %24 = icmp ult i32 %5, 968
  br i1 %24, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id0

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id1

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %25 = phi float [ %19, %concat_index_from_operand_id0 ], [ %23, %concat_index_from_operand_id1 ]
  %26 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %25, ptr %26, align 4
  br label %concatenate.pivot.968.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %27 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %28 = sub nsw i32 %8, %27
  %29 = getelementptr inbounds [968 x [256 x float]], ptr %arg0, i32 0, i32 %28, i32 %7
  %30 = load float, ptr %29, align 4, !invariant.load !74
  br label %concatenate.3.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.968.7
  %31 = phi i32 [ 968, %concatenate.pivot.968.7 ]
  %32 = sub nsw i32 %8, %31
  %33 = getelementptr inbounds [64 x [256 x float]], ptr %arg1, i32 0, i32 %32, i32 %7
  %34 = load float, ptr %33, align 4, !invariant.load !74
  br label %concatenate.3.merge2

concatenate.pivot.968.5:                          ; preds = %concatenate.3.merge
  %35 = icmp ult i32 %8, 968
  br i1 %35, label %concatenate.pivot.0.6, label %concatenate.pivot.968.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.968.5
  br label %concat_index_from_operand_id03

concatenate.pivot.968.7:                          ; preds = %concatenate.pivot.968.5
  br label %concat_index_from_operand_id14

concatenate.3.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %36 = phi float [ %30, %concat_index_from_operand_id03 ], [ %34, %concat_index_from_operand_id14 ]
  %37 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %36, ptr %37, align 4
  br label %concatenate.pivot.968.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %38 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %39 = sub nsw i32 %11, %38
  %40 = getelementptr inbounds [968 x [256 x float]], ptr %arg0, i32 0, i32 %39, i32 %10
  %41 = load float, ptr %40, align 4, !invariant.load !74
  br label %concatenate.3.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.968.13
  %42 = phi i32 [ 968, %concatenate.pivot.968.13 ]
  %43 = sub nsw i32 %11, %42
  %44 = getelementptr inbounds [64 x [256 x float]], ptr %arg1, i32 0, i32 %43, i32 %10
  %45 = load float, ptr %44, align 4, !invariant.load !74
  br label %concatenate.3.merge8

concatenate.pivot.968.11:                         ; preds = %concatenate.3.merge2
  %46 = icmp ult i32 %11, 968
  br i1 %46, label %concatenate.pivot.0.12, label %concatenate.pivot.968.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.968.11
  br label %concat_index_from_operand_id09

concatenate.pivot.968.13:                         ; preds = %concatenate.pivot.968.11
  br label %concat_index_from_operand_id110

concatenate.3.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %47 = phi float [ %41, %concat_index_from_operand_id09 ], [ %45, %concat_index_from_operand_id110 ]
  %48 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %47, ptr %48, align 4
  br label %concatenate.pivot.968.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %49 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %50 = sub nsw i32 %14, %49
  %51 = getelementptr inbounds [968 x [256 x float]], ptr %arg0, i32 0, i32 %50, i32 %13
  %52 = load float, ptr %51, align 4, !invariant.load !74
  br label %concatenate.3.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.968.19
  %53 = phi i32 [ 968, %concatenate.pivot.968.19 ]
  %54 = sub nsw i32 %14, %53
  %55 = getelementptr inbounds [64 x [256 x float]], ptr %arg1, i32 0, i32 %54, i32 %13
  %56 = load float, ptr %55, align 4, !invariant.load !74
  br label %concatenate.3.merge14

concatenate.pivot.968.17:                         ; preds = %concatenate.3.merge8
  %57 = icmp ult i32 %14, 968
  br i1 %57, label %concatenate.pivot.0.18, label %concatenate.pivot.968.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.968.17
  br label %concat_index_from_operand_id015

concatenate.pivot.968.19:                         ; preds = %concatenate.pivot.968.17
  br label %concat_index_from_operand_id116

concatenate.3.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %58 = phi float [ %52, %concat_index_from_operand_id015 ], [ %56, %concat_index_from_operand_id116 ]
  %59 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %58, ptr %59, align 4
  br label %concatenate_19.in_bounds-after
}

define void @fusion_6(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 128 dereferenceable(33816576) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !79
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
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
  br i1 %15, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %concatenate.5.merge14, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  br label %concatenate.pivot.968.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 1032
  %19 = mul i32 %18, 968
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 968
  %23 = udiv i32 %20, 968
  %24 = urem i32 %23, 8192
  %25 = udiv i32 %20, 7929856
  %26 = getelementptr inbounds float, ptr %arg1, i32 %20
  %27 = load float, ptr %26, align 4, !invariant.load !74
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.968.1
  %28 = phi i32 [ 968, %concatenate.pivot.968.1 ]
  %29 = sub nsw i32 %4, %28
  %30 = udiv i32 %linear_index_base, 1032
  %31 = mul i32 %30, 64
  %32 = add i32 %31, %29
  %33 = udiv i32 %32, 1
  %34 = urem i32 %33, 64
  %35 = udiv i32 %32, 64
  %36 = urem i32 %35, 8192
  %37 = udiv i32 %32, 524288
  %38 = getelementptr inbounds float, ptr %arg0, i32 %32
  %39 = load float, ptr %38, align 4, !invariant.load !74
  br label %concatenate.5.merge

concatenate.pivot.968.:                           ; preds = %fusion_6.in_bounds-true
  %40 = icmp ult i32 %4, 968
  br i1 %40, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id0

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.968.
  br label %concat_index_from_operand_id1

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %41 = phi float [ %27, %concat_index_from_operand_id0 ], [ %39, %concat_index_from_operand_id1 ]
  %42 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %41, ptr %42, align 4
  br label %concatenate.pivot.968.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %43 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %44 = sub nsw i32 %7, %43
  %45 = udiv i32 %linear_index1, 1032
  %46 = mul i32 %45, 968
  %47 = add i32 %46, %44
  %48 = udiv i32 %47, 1
  %49 = urem i32 %48, 968
  %50 = udiv i32 %47, 968
  %51 = urem i32 %50, 8192
  %52 = udiv i32 %47, 7929856
  %53 = getelementptr inbounds float, ptr %arg1, i32 %47
  %54 = load float, ptr %53, align 4, !invariant.load !74
  br label %concatenate.5.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.968.7
  %55 = phi i32 [ 968, %concatenate.pivot.968.7 ]
  %56 = sub nsw i32 %7, %55
  %57 = udiv i32 %linear_index1, 1032
  %58 = mul i32 %57, 64
  %59 = add i32 %58, %56
  %60 = udiv i32 %59, 1
  %61 = urem i32 %60, 64
  %62 = udiv i32 %59, 64
  %63 = urem i32 %62, 8192
  %64 = udiv i32 %59, 524288
  %65 = getelementptr inbounds float, ptr %arg0, i32 %59
  %66 = load float, ptr %65, align 4, !invariant.load !74
  br label %concatenate.5.merge2

concatenate.pivot.968.5:                          ; preds = %concatenate.5.merge
  %67 = icmp ult i32 %7, 968
  br i1 %67, label %concatenate.pivot.0.6, label %concatenate.pivot.968.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.968.5
  br label %concat_index_from_operand_id03

concatenate.pivot.968.7:                          ; preds = %concatenate.pivot.968.5
  br label %concat_index_from_operand_id14

concatenate.5.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %68 = phi float [ %54, %concat_index_from_operand_id03 ], [ %66, %concat_index_from_operand_id14 ]
  %69 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %68, ptr %69, align 4
  br label %concatenate.pivot.968.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %70 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %71 = sub nsw i32 %10, %70
  %72 = udiv i32 %linear_index2, 1032
  %73 = mul i32 %72, 968
  %74 = add i32 %73, %71
  %75 = udiv i32 %74, 1
  %76 = urem i32 %75, 968
  %77 = udiv i32 %74, 968
  %78 = urem i32 %77, 8192
  %79 = udiv i32 %74, 7929856
  %80 = getelementptr inbounds float, ptr %arg1, i32 %74
  %81 = load float, ptr %80, align 4, !invariant.load !74
  br label %concatenate.5.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.968.13
  %82 = phi i32 [ 968, %concatenate.pivot.968.13 ]
  %83 = sub nsw i32 %10, %82
  %84 = udiv i32 %linear_index2, 1032
  %85 = mul i32 %84, 64
  %86 = add i32 %85, %83
  %87 = udiv i32 %86, 1
  %88 = urem i32 %87, 64
  %89 = udiv i32 %86, 64
  %90 = urem i32 %89, 8192
  %91 = udiv i32 %86, 524288
  %92 = getelementptr inbounds float, ptr %arg0, i32 %86
  %93 = load float, ptr %92, align 4, !invariant.load !74
  br label %concatenate.5.merge8

concatenate.pivot.968.11:                         ; preds = %concatenate.5.merge2
  %94 = icmp ult i32 %10, 968
  br i1 %94, label %concatenate.pivot.0.12, label %concatenate.pivot.968.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.968.11
  br label %concat_index_from_operand_id09

concatenate.pivot.968.13:                         ; preds = %concatenate.pivot.968.11
  br label %concat_index_from_operand_id110

concatenate.5.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %95 = phi float [ %81, %concat_index_from_operand_id09 ], [ %93, %concat_index_from_operand_id110 ]
  %96 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %95, ptr %96, align 4
  br label %concatenate.pivot.968.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %97 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %98 = sub nsw i32 %13, %97
  %99 = udiv i32 %linear_index3, 1032
  %100 = mul i32 %99, 968
  %101 = add i32 %100, %98
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 968
  %104 = udiv i32 %101, 968
  %105 = urem i32 %104, 8192
  %106 = udiv i32 %101, 7929856
  %107 = getelementptr inbounds float, ptr %arg1, i32 %101
  %108 = load float, ptr %107, align 4, !invariant.load !74
  br label %concatenate.5.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.968.19
  %109 = phi i32 [ 968, %concatenate.pivot.968.19 ]
  %110 = sub nsw i32 %13, %109
  %111 = udiv i32 %linear_index3, 1032
  %112 = mul i32 %111, 64
  %113 = add i32 %112, %110
  %114 = udiv i32 %113, 1
  %115 = urem i32 %114, 64
  %116 = udiv i32 %113, 64
  %117 = urem i32 %116, 8192
  %118 = udiv i32 %113, 524288
  %119 = getelementptr inbounds float, ptr %arg0, i32 %113
  %120 = load float, ptr %119, align 4, !invariant.load !74
  br label %concatenate.5.merge14

concatenate.pivot.968.17:                         ; preds = %concatenate.5.merge8
  %121 = icmp ult i32 %13, 968
  br i1 %121, label %concatenate.pivot.0.18, label %concatenate.pivot.968.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.968.17
  br label %concat_index_from_operand_id015

concatenate.pivot.968.19:                         ; preds = %concatenate.pivot.968.17
  br label %concat_index_from_operand_id116

concatenate.5.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %122 = phi float [ %108, %concat_index_from_operand_id015 ], [ %120, %concat_index_from_operand_id116 ]
  %123 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %122, ptr %123, align 4
  br label %fusion_6.in_bounds-after
}

define void @concatenate_14(ptr noalias align 16 dereferenceable(26214400) %arg0, ptr noalias align 16 dereferenceable(26214400) %arg1, ptr noalias align 16 dereferenceable(26214400) %arg2, ptr noalias align 16 dereferenceable(26214400) %arg3, ptr noalias align 16 dereferenceable(26214400) %arg4, ptr noalias align 128 dereferenceable(131072000) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !80
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192000
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 40
  %5 = udiv i32 %linear_index_base, 40
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 4000
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 40
  %10 = udiv i32 %linear_index1, 40
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 4000
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 40
  %15 = udiv i32 %linear_index2, 40
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 4000
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 40
  %20 = udiv i32 %linear_index3, 40
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 4000
  %23 = icmp ult i32 %linear_index_base, 32768000
  br i1 %23, label %concatenate_14.in_bounds-true, label %concatenate_14.in_bounds-after

concatenate_14.in_bounds-after:                   ; preds = %concatenate.6.merge35, %entry
  ret void

concatenate_14.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.16.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %4, %24
  %26 = udiv i32 %linear_index_base, 40
  %27 = mul i32 %26, 8
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 8
  %31 = udiv i32 %28, 8
  %32 = urem i32 %31, 100
  %33 = udiv i32 %28, 800
  %34 = getelementptr inbounds float, ptr %arg0, i32 %28
  %35 = load float, ptr %34, align 4, !invariant.load !74
  br label %concatenate.6.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.8.1
  %36 = phi i32 [ 8, %concatenate.pivot.8.1 ]
  %37 = sub nsw i32 %4, %36
  %38 = udiv i32 %linear_index_base, 40
  %39 = mul i32 %38, 8
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 8
  %43 = udiv i32 %40, 8
  %44 = urem i32 %43, 100
  %45 = udiv i32 %40, 800
  %46 = getelementptr inbounds float, ptr %arg1, i32 %40
  %47 = load float, ptr %46, align 4, !invariant.load !74
  br label %concatenate.6.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.16.2
  %48 = phi i32 [ 16, %concatenate.pivot.16.2 ]
  %49 = sub nsw i32 %4, %48
  %50 = udiv i32 %linear_index_base, 40
  %51 = mul i32 %50, 8
  %52 = add i32 %51, %49
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 8
  %55 = udiv i32 %52, 8
  %56 = urem i32 %55, 100
  %57 = udiv i32 %52, 800
  %58 = getelementptr inbounds float, ptr %arg2, i32 %52
  %59 = load float, ptr %58, align 4, !invariant.load !74
  br label %concatenate.6.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.24.3
  %60 = phi i32 [ 24, %concatenate.pivot.24.3 ]
  %61 = sub nsw i32 %4, %60
  %62 = udiv i32 %linear_index_base, 40
  %63 = mul i32 %62, 8
  %64 = add i32 %63, %61
  %65 = udiv i32 %64, 1
  %66 = urem i32 %65, 8
  %67 = udiv i32 %64, 8
  %68 = urem i32 %67, 100
  %69 = udiv i32 %64, 800
  %70 = getelementptr inbounds float, ptr %arg3, i32 %64
  %71 = load float, ptr %70, align 4, !invariant.load !74
  br label %concatenate.6.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.32.4
  %72 = phi i32 [ 32, %concatenate.pivot.32.4 ]
  %73 = sub nsw i32 %4, %72
  %74 = udiv i32 %linear_index_base, 40
  %75 = mul i32 %74, 8
  %76 = add i32 %75, %73
  %77 = udiv i32 %76, 1
  %78 = urem i32 %77, 8
  %79 = udiv i32 %76, 8
  %80 = urem i32 %79, 100
  %81 = udiv i32 %76, 800
  %82 = getelementptr inbounds float, ptr %arg4, i32 %76
  %83 = load float, ptr %82, align 4, !invariant.load !74
  br label %concatenate.6.merge

concatenate.pivot.16.:                            ; preds = %concatenate_14.in_bounds-true
  %84 = icmp ult i32 %4, 16
  br i1 %84, label %concatenate.pivot.8., label %concatenate.pivot.24.

concatenate.pivot.8.:                             ; preds = %concatenate.pivot.16.
  %85 = icmp ult i32 %4, 8
  br i1 %85, label %concatenate.pivot.0., label %concatenate.pivot.8.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id0

concatenate.pivot.8.1:                            ; preds = %concatenate.pivot.8.
  br label %concat_index_from_operand_id1

concatenate.pivot.24.:                            ; preds = %concatenate.pivot.16.
  %86 = icmp ult i32 %4, 24
  br i1 %86, label %concatenate.pivot.16.2, label %concatenate.pivot.32.

concatenate.pivot.16.2:                           ; preds = %concatenate.pivot.24.
  br label %concat_index_from_operand_id2

concatenate.pivot.32.:                            ; preds = %concatenate.pivot.24.
  %87 = icmp ult i32 %4, 32
  br i1 %87, label %concatenate.pivot.24.3, label %concatenate.pivot.32.4

concatenate.pivot.24.3:                           ; preds = %concatenate.pivot.32.
  br label %concat_index_from_operand_id3

concatenate.pivot.32.4:                           ; preds = %concatenate.pivot.32.
  br label %concat_index_from_operand_id4

concatenate.6.merge:                              ; preds = %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %88 = phi float [ %35, %concat_index_from_operand_id0 ], [ %47, %concat_index_from_operand_id1 ], [ %59, %concat_index_from_operand_id2 ], [ %71, %concat_index_from_operand_id3 ], [ %83, %concat_index_from_operand_id4 ]
  %89 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %88, ptr %89, align 4
  br label %concatenate.pivot.16.11

concat_index_from_operand_id06:                   ; preds = %concatenate.pivot.0.13
  %90 = phi i32 [ 0, %concatenate.pivot.0.13 ]
  %91 = sub nsw i32 %9, %90
  %92 = udiv i32 %linear_index1, 40
  %93 = mul i32 %92, 8
  %94 = add i32 %93, %91
  %95 = udiv i32 %94, 1
  %96 = urem i32 %95, 8
  %97 = udiv i32 %94, 8
  %98 = urem i32 %97, 100
  %99 = udiv i32 %94, 800
  %100 = getelementptr inbounds float, ptr %arg0, i32 %94
  %101 = load float, ptr %100, align 4, !invariant.load !74
  br label %concatenate.6.merge5

concat_index_from_operand_id17:                   ; preds = %concatenate.pivot.8.14
  %102 = phi i32 [ 8, %concatenate.pivot.8.14 ]
  %103 = sub nsw i32 %9, %102
  %104 = udiv i32 %linear_index1, 40
  %105 = mul i32 %104, 8
  %106 = add i32 %105, %103
  %107 = udiv i32 %106, 1
  %108 = urem i32 %107, 8
  %109 = udiv i32 %106, 8
  %110 = urem i32 %109, 100
  %111 = udiv i32 %106, 800
  %112 = getelementptr inbounds float, ptr %arg1, i32 %106
  %113 = load float, ptr %112, align 4, !invariant.load !74
  br label %concatenate.6.merge5

concat_index_from_operand_id28:                   ; preds = %concatenate.pivot.16.16
  %114 = phi i32 [ 16, %concatenate.pivot.16.16 ]
  %115 = sub nsw i32 %9, %114
  %116 = udiv i32 %linear_index1, 40
  %117 = mul i32 %116, 8
  %118 = add i32 %117, %115
  %119 = udiv i32 %118, 1
  %120 = urem i32 %119, 8
  %121 = udiv i32 %118, 8
  %122 = urem i32 %121, 100
  %123 = udiv i32 %118, 800
  %124 = getelementptr inbounds float, ptr %arg2, i32 %118
  %125 = load float, ptr %124, align 4, !invariant.load !74
  br label %concatenate.6.merge5

concat_index_from_operand_id39:                   ; preds = %concatenate.pivot.24.18
  %126 = phi i32 [ 24, %concatenate.pivot.24.18 ]
  %127 = sub nsw i32 %9, %126
  %128 = udiv i32 %linear_index1, 40
  %129 = mul i32 %128, 8
  %130 = add i32 %129, %127
  %131 = udiv i32 %130, 1
  %132 = urem i32 %131, 8
  %133 = udiv i32 %130, 8
  %134 = urem i32 %133, 100
  %135 = udiv i32 %130, 800
  %136 = getelementptr inbounds float, ptr %arg3, i32 %130
  %137 = load float, ptr %136, align 4, !invariant.load !74
  br label %concatenate.6.merge5

concat_index_from_operand_id410:                  ; preds = %concatenate.pivot.32.19
  %138 = phi i32 [ 32, %concatenate.pivot.32.19 ]
  %139 = sub nsw i32 %9, %138
  %140 = udiv i32 %linear_index1, 40
  %141 = mul i32 %140, 8
  %142 = add i32 %141, %139
  %143 = udiv i32 %142, 1
  %144 = urem i32 %143, 8
  %145 = udiv i32 %142, 8
  %146 = urem i32 %145, 100
  %147 = udiv i32 %142, 800
  %148 = getelementptr inbounds float, ptr %arg4, i32 %142
  %149 = load float, ptr %148, align 4, !invariant.load !74
  br label %concatenate.6.merge5

concatenate.pivot.16.11:                          ; preds = %concatenate.6.merge
  %150 = icmp ult i32 %9, 16
  br i1 %150, label %concatenate.pivot.8.12, label %concatenate.pivot.24.15

concatenate.pivot.8.12:                           ; preds = %concatenate.pivot.16.11
  %151 = icmp ult i32 %9, 8
  br i1 %151, label %concatenate.pivot.0.13, label %concatenate.pivot.8.14

concatenate.pivot.0.13:                           ; preds = %concatenate.pivot.8.12
  br label %concat_index_from_operand_id06

concatenate.pivot.8.14:                           ; preds = %concatenate.pivot.8.12
  br label %concat_index_from_operand_id17

concatenate.pivot.24.15:                          ; preds = %concatenate.pivot.16.11
  %152 = icmp ult i32 %9, 24
  br i1 %152, label %concatenate.pivot.16.16, label %concatenate.pivot.32.17

concatenate.pivot.16.16:                          ; preds = %concatenate.pivot.24.15
  br label %concat_index_from_operand_id28

concatenate.pivot.32.17:                          ; preds = %concatenate.pivot.24.15
  %153 = icmp ult i32 %9, 32
  br i1 %153, label %concatenate.pivot.24.18, label %concatenate.pivot.32.19

concatenate.pivot.24.18:                          ; preds = %concatenate.pivot.32.17
  br label %concat_index_from_operand_id39

concatenate.pivot.32.19:                          ; preds = %concatenate.pivot.32.17
  br label %concat_index_from_operand_id410

concatenate.6.merge5:                             ; preds = %concat_index_from_operand_id410, %concat_index_from_operand_id39, %concat_index_from_operand_id28, %concat_index_from_operand_id17, %concat_index_from_operand_id06
  %154 = phi float [ %101, %concat_index_from_operand_id06 ], [ %113, %concat_index_from_operand_id17 ], [ %125, %concat_index_from_operand_id28 ], [ %137, %concat_index_from_operand_id39 ], [ %149, %concat_index_from_operand_id410 ]
  %155 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %154, ptr %155, align 4
  br label %concatenate.pivot.16.26

concat_index_from_operand_id021:                  ; preds = %concatenate.pivot.0.28
  %156 = phi i32 [ 0, %concatenate.pivot.0.28 ]
  %157 = sub nsw i32 %14, %156
  %158 = udiv i32 %linear_index2, 40
  %159 = mul i32 %158, 8
  %160 = add i32 %159, %157
  %161 = udiv i32 %160, 1
  %162 = urem i32 %161, 8
  %163 = udiv i32 %160, 8
  %164 = urem i32 %163, 100
  %165 = udiv i32 %160, 800
  %166 = getelementptr inbounds float, ptr %arg0, i32 %160
  %167 = load float, ptr %166, align 4, !invariant.load !74
  br label %concatenate.6.merge20

concat_index_from_operand_id122:                  ; preds = %concatenate.pivot.8.29
  %168 = phi i32 [ 8, %concatenate.pivot.8.29 ]
  %169 = sub nsw i32 %14, %168
  %170 = udiv i32 %linear_index2, 40
  %171 = mul i32 %170, 8
  %172 = add i32 %171, %169
  %173 = udiv i32 %172, 1
  %174 = urem i32 %173, 8
  %175 = udiv i32 %172, 8
  %176 = urem i32 %175, 100
  %177 = udiv i32 %172, 800
  %178 = getelementptr inbounds float, ptr %arg1, i32 %172
  %179 = load float, ptr %178, align 4, !invariant.load !74
  br label %concatenate.6.merge20

concat_index_from_operand_id223:                  ; preds = %concatenate.pivot.16.31
  %180 = phi i32 [ 16, %concatenate.pivot.16.31 ]
  %181 = sub nsw i32 %14, %180
  %182 = udiv i32 %linear_index2, 40
  %183 = mul i32 %182, 8
  %184 = add i32 %183, %181
  %185 = udiv i32 %184, 1
  %186 = urem i32 %185, 8
  %187 = udiv i32 %184, 8
  %188 = urem i32 %187, 100
  %189 = udiv i32 %184, 800
  %190 = getelementptr inbounds float, ptr %arg2, i32 %184
  %191 = load float, ptr %190, align 4, !invariant.load !74
  br label %concatenate.6.merge20

concat_index_from_operand_id324:                  ; preds = %concatenate.pivot.24.33
  %192 = phi i32 [ 24, %concatenate.pivot.24.33 ]
  %193 = sub nsw i32 %14, %192
  %194 = udiv i32 %linear_index2, 40
  %195 = mul i32 %194, 8
  %196 = add i32 %195, %193
  %197 = udiv i32 %196, 1
  %198 = urem i32 %197, 8
  %199 = udiv i32 %196, 8
  %200 = urem i32 %199, 100
  %201 = udiv i32 %196, 800
  %202 = getelementptr inbounds float, ptr %arg3, i32 %196
  %203 = load float, ptr %202, align 4, !invariant.load !74
  br label %concatenate.6.merge20

concat_index_from_operand_id425:                  ; preds = %concatenate.pivot.32.34
  %204 = phi i32 [ 32, %concatenate.pivot.32.34 ]
  %205 = sub nsw i32 %14, %204
  %206 = udiv i32 %linear_index2, 40
  %207 = mul i32 %206, 8
  %208 = add i32 %207, %205
  %209 = udiv i32 %208, 1
  %210 = urem i32 %209, 8
  %211 = udiv i32 %208, 8
  %212 = urem i32 %211, 100
  %213 = udiv i32 %208, 800
  %214 = getelementptr inbounds float, ptr %arg4, i32 %208
  %215 = load float, ptr %214, align 4, !invariant.load !74
  br label %concatenate.6.merge20

concatenate.pivot.16.26:                          ; preds = %concatenate.6.merge5
  %216 = icmp ult i32 %14, 16
  br i1 %216, label %concatenate.pivot.8.27, label %concatenate.pivot.24.30

concatenate.pivot.8.27:                           ; preds = %concatenate.pivot.16.26
  %217 = icmp ult i32 %14, 8
  br i1 %217, label %concatenate.pivot.0.28, label %concatenate.pivot.8.29

concatenate.pivot.0.28:                           ; preds = %concatenate.pivot.8.27
  br label %concat_index_from_operand_id021

concatenate.pivot.8.29:                           ; preds = %concatenate.pivot.8.27
  br label %concat_index_from_operand_id122

concatenate.pivot.24.30:                          ; preds = %concatenate.pivot.16.26
  %218 = icmp ult i32 %14, 24
  br i1 %218, label %concatenate.pivot.16.31, label %concatenate.pivot.32.32

concatenate.pivot.16.31:                          ; preds = %concatenate.pivot.24.30
  br label %concat_index_from_operand_id223

concatenate.pivot.32.32:                          ; preds = %concatenate.pivot.24.30
  %219 = icmp ult i32 %14, 32
  br i1 %219, label %concatenate.pivot.24.33, label %concatenate.pivot.32.34

concatenate.pivot.24.33:                          ; preds = %concatenate.pivot.32.32
  br label %concat_index_from_operand_id324

concatenate.pivot.32.34:                          ; preds = %concatenate.pivot.32.32
  br label %concat_index_from_operand_id425

concatenate.6.merge20:                            ; preds = %concat_index_from_operand_id425, %concat_index_from_operand_id324, %concat_index_from_operand_id223, %concat_index_from_operand_id122, %concat_index_from_operand_id021
  %220 = phi float [ %167, %concat_index_from_operand_id021 ], [ %179, %concat_index_from_operand_id122 ], [ %191, %concat_index_from_operand_id223 ], [ %203, %concat_index_from_operand_id324 ], [ %215, %concat_index_from_operand_id425 ]
  %221 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %220, ptr %221, align 4
  br label %concatenate.pivot.16.41

concat_index_from_operand_id036:                  ; preds = %concatenate.pivot.0.43
  %222 = phi i32 [ 0, %concatenate.pivot.0.43 ]
  %223 = sub nsw i32 %19, %222
  %224 = udiv i32 %linear_index3, 40
  %225 = mul i32 %224, 8
  %226 = add i32 %225, %223
  %227 = udiv i32 %226, 1
  %228 = urem i32 %227, 8
  %229 = udiv i32 %226, 8
  %230 = urem i32 %229, 100
  %231 = udiv i32 %226, 800
  %232 = getelementptr inbounds float, ptr %arg0, i32 %226
  %233 = load float, ptr %232, align 4, !invariant.load !74
  br label %concatenate.6.merge35

concat_index_from_operand_id137:                  ; preds = %concatenate.pivot.8.44
  %234 = phi i32 [ 8, %concatenate.pivot.8.44 ]
  %235 = sub nsw i32 %19, %234
  %236 = udiv i32 %linear_index3, 40
  %237 = mul i32 %236, 8
  %238 = add i32 %237, %235
  %239 = udiv i32 %238, 1
  %240 = urem i32 %239, 8
  %241 = udiv i32 %238, 8
  %242 = urem i32 %241, 100
  %243 = udiv i32 %238, 800
  %244 = getelementptr inbounds float, ptr %arg1, i32 %238
  %245 = load float, ptr %244, align 4, !invariant.load !74
  br label %concatenate.6.merge35

concat_index_from_operand_id238:                  ; preds = %concatenate.pivot.16.46
  %246 = phi i32 [ 16, %concatenate.pivot.16.46 ]
  %247 = sub nsw i32 %19, %246
  %248 = udiv i32 %linear_index3, 40
  %249 = mul i32 %248, 8
  %250 = add i32 %249, %247
  %251 = udiv i32 %250, 1
  %252 = urem i32 %251, 8
  %253 = udiv i32 %250, 8
  %254 = urem i32 %253, 100
  %255 = udiv i32 %250, 800
  %256 = getelementptr inbounds float, ptr %arg2, i32 %250
  %257 = load float, ptr %256, align 4, !invariant.load !74
  br label %concatenate.6.merge35

concat_index_from_operand_id339:                  ; preds = %concatenate.pivot.24.48
  %258 = phi i32 [ 24, %concatenate.pivot.24.48 ]
  %259 = sub nsw i32 %19, %258
  %260 = udiv i32 %linear_index3, 40
  %261 = mul i32 %260, 8
  %262 = add i32 %261, %259
  %263 = udiv i32 %262, 1
  %264 = urem i32 %263, 8
  %265 = udiv i32 %262, 8
  %266 = urem i32 %265, 100
  %267 = udiv i32 %262, 800
  %268 = getelementptr inbounds float, ptr %arg3, i32 %262
  %269 = load float, ptr %268, align 4, !invariant.load !74
  br label %concatenate.6.merge35

concat_index_from_operand_id440:                  ; preds = %concatenate.pivot.32.49
  %270 = phi i32 [ 32, %concatenate.pivot.32.49 ]
  %271 = sub nsw i32 %19, %270
  %272 = udiv i32 %linear_index3, 40
  %273 = mul i32 %272, 8
  %274 = add i32 %273, %271
  %275 = udiv i32 %274, 1
  %276 = urem i32 %275, 8
  %277 = udiv i32 %274, 8
  %278 = urem i32 %277, 100
  %279 = udiv i32 %274, 800
  %280 = getelementptr inbounds float, ptr %arg4, i32 %274
  %281 = load float, ptr %280, align 4, !invariant.load !74
  br label %concatenate.6.merge35

concatenate.pivot.16.41:                          ; preds = %concatenate.6.merge20
  %282 = icmp ult i32 %19, 16
  br i1 %282, label %concatenate.pivot.8.42, label %concatenate.pivot.24.45

concatenate.pivot.8.42:                           ; preds = %concatenate.pivot.16.41
  %283 = icmp ult i32 %19, 8
  br i1 %283, label %concatenate.pivot.0.43, label %concatenate.pivot.8.44

concatenate.pivot.0.43:                           ; preds = %concatenate.pivot.8.42
  br label %concat_index_from_operand_id036

concatenate.pivot.8.44:                           ; preds = %concatenate.pivot.8.42
  br label %concat_index_from_operand_id137

concatenate.pivot.24.45:                          ; preds = %concatenate.pivot.16.41
  %284 = icmp ult i32 %19, 24
  br i1 %284, label %concatenate.pivot.16.46, label %concatenate.pivot.32.47

concatenate.pivot.16.46:                          ; preds = %concatenate.pivot.24.45
  br label %concat_index_from_operand_id238

concatenate.pivot.32.47:                          ; preds = %concatenate.pivot.24.45
  %285 = icmp ult i32 %19, 32
  br i1 %285, label %concatenate.pivot.24.48, label %concatenate.pivot.32.49

concatenate.pivot.24.48:                          ; preds = %concatenate.pivot.32.47
  br label %concat_index_from_operand_id339

concatenate.pivot.32.49:                          ; preds = %concatenate.pivot.32.47
  br label %concat_index_from_operand_id440

concatenate.6.merge35:                            ; preds = %concat_index_from_operand_id440, %concat_index_from_operand_id339, %concat_index_from_operand_id238, %concat_index_from_operand_id137, %concat_index_from_operand_id036
  %286 = phi float [ %233, %concat_index_from_operand_id036 ], [ %245, %concat_index_from_operand_id137 ], [ %257, %concat_index_from_operand_id238 ], [ %269, %concat_index_from_operand_id339 ], [ %281, %concat_index_from_operand_id440 ]
  %287 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %286, ptr %287, align 4
  br label %concatenate_14.in_bounds-after
}

define void @fusion_31(ptr noalias align 128 dereferenceable(131072000) %arg0, ptr noalias align 128 dereferenceable(20971520) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !81
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1310720
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 40
  %5 = udiv i32 %linear_index_base, 40
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 40
  %8 = udiv i32 %linear_index1, 40
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 40
  %11 = udiv i32 %linear_index2, 40
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 40
  %14 = udiv i32 %linear_index3, 40
  %15 = icmp ult i32 %linear_index_base, 5242880
  br i1 %15, label %fusion_31.in_bounds-true, label %fusion_31.in_bounds-after

fusion_31.in_bounds-after:                        ; preds = %fusion_31.in_bounds-true, %entry
  ret void

fusion_31.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 40
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 16
  %22 = udiv i32 %20, 16
  %23 = udiv i32 %22, 8192
  %24 = add i32 %22, 0
  %25 = add i32 %21, 0
  %26 = add i32 %17, 0
  %27 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %24, i32 %25, i32 %26
  %28 = load float, ptr %27, align 4, !invariant.load !74
  %29 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %28, ptr %29, align 4
  %30 = mul nuw nsw i32 %7, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 40
  %33 = mul nuw nsw i32 %8, 1
  %34 = add nuw nsw i32 0, %33
  %35 = urem i32 %34, 16
  %36 = udiv i32 %34, 16
  %37 = udiv i32 %36, 8192
  %38 = add i32 %36, 0
  %39 = add i32 %35, 0
  %40 = add i32 %31, 0
  %41 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %38, i32 %39, i32 %40
  %42 = load float, ptr %41, align 4, !invariant.load !74
  %43 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %42, ptr %43, align 4
  %44 = mul nuw nsw i32 %10, 1
  %45 = add nuw nsw i32 0, %44
  %46 = udiv i32 %45, 40
  %47 = mul nuw nsw i32 %11, 1
  %48 = add nuw nsw i32 0, %47
  %49 = urem i32 %48, 16
  %50 = udiv i32 %48, 16
  %51 = udiv i32 %50, 8192
  %52 = add i32 %50, 0
  %53 = add i32 %49, 0
  %54 = add i32 %45, 0
  %55 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %52, i32 %53, i32 %54
  %56 = load float, ptr %55, align 4, !invariant.load !74
  %57 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %56, ptr %57, align 4
  %58 = mul nuw nsw i32 %13, 1
  %59 = add nuw nsw i32 0, %58
  %60 = udiv i32 %59, 40
  %61 = mul nuw nsw i32 %14, 1
  %62 = add nuw nsw i32 0, %61
  %63 = urem i32 %62, 16
  %64 = udiv i32 %62, 16
  %65 = udiv i32 %64, 8192
  %66 = add i32 %64, 0
  %67 = add i32 %63, 0
  %68 = add i32 %59, 0
  %69 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %66, i32 %67, i32 %68
  %70 = load float, ptr %69, align 4, !invariant.load !74
  %71 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %70, ptr %71, align 4
  br label %fusion_31.in_bounds-after
}

define void @fusion_41(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(16777216) %arg2, ptr noalias align 128 dereferenceable(16777216) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !82
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 16
  %5 = udiv i32 %linear_index_base, 16
  %6 = urem i32 %5, 16
  %7 = udiv i32 %linear_index_base, 256
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 2097152
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 16
  %12 = udiv i32 %linear_index1, 16
  %13 = urem i32 %12, 16
  %14 = udiv i32 %linear_index1, 256
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 2097152
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 16
  %19 = udiv i32 %linear_index2, 16
  %20 = urem i32 %19, 16
  %21 = udiv i32 %linear_index2, 256
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 2097152
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 16
  %26 = udiv i32 %linear_index3, 16
  %27 = urem i32 %26, 16
  %28 = udiv i32 %linear_index3, 256
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 2097152
  %31 = icmp ult i32 %linear_index_base, 4194304
  br i1 %31, label %fusion_41.in_bounds-true, label %fusion_41.in_bounds-after

fusion_41.in_bounds-after:                        ; preds = %concatenate.14.merge37, %entry
  ret void

fusion_41.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %32 = phi i32 [ 0, %concatenate.pivot.0. ]
  %33 = sub nsw i32 %9, %32
  %34 = add i32 %8, 0
  %35 = add i32 %6, 0
  %36 = add i32 %4, 0
  %37 = mul nuw nsw i32 %36, 1
  %38 = add nuw nsw i32 0, %37
  %39 = udiv i32 %38, 32
  %40 = mul nuw nsw i32 %35, 1
  %41 = add nuw nsw i32 0, %40
  %42 = mul nuw nsw i32 %34, 16
  %43 = add nuw nsw i32 %41, %42
  %44 = udiv i32 %43, 131072
  %45 = getelementptr inbounds [131072 x [32 x float]], ptr %arg0, i32 0, i32 %43, i32 %38
  %46 = load float, ptr %45, align 4, !invariant.load !74
  br label %concatenate.8.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %47 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %48 = sub nsw i32 %9, %47
  %49 = add i32 %8, 0
  %50 = add i32 %6, 0
  %51 = add i32 %4, 16
  %52 = mul nuw nsw i32 %51, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 32
  %55 = mul nuw nsw i32 %50, 1
  %56 = add nuw nsw i32 0, %55
  %57 = mul nuw nsw i32 %49, 16
  %58 = add nuw nsw i32 %56, %57
  %59 = udiv i32 %58, 131072
  %60 = getelementptr inbounds [131072 x [32 x float]], ptr %arg0, i32 0, i32 %58, i32 %53
  %61 = load float, ptr %60, align 4, !invariant.load !74
  br label %concatenate.8.merge

concatenate.pivot.1.:                             ; preds = %fusion_41.in_bounds-true
  %62 = icmp ult i32 %9, 1
  br i1 %62, label %concatenate.pivot.0., label %concatenate.pivot.1.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.8.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %63 = phi float [ %46, %concat_index_from_operand_id0 ], [ %61, %concat_index_from_operand_id1 ]
  %64 = insertvalue { float, float } undef, float %63, 0
  br label %concatenate.pivot.1.4

concat_index_from_operand_id02:                   ; preds = %concatenate.pivot.0.5
  %65 = phi i32 [ 0, %concatenate.pivot.0.5 ]
  %66 = sub nsw i32 %9, %65
  %67 = add i32 %8, 0
  %68 = add i32 %6, 0
  %69 = add i32 %4, 0
  %70 = mul nuw nsw i32 %69, 1
  %71 = add nuw nsw i32 0, %70
  %72 = udiv i32 %71, 32
  %73 = mul nuw nsw i32 %68, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %67, 16
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 131072
  %78 = getelementptr inbounds [131072 x [32 x float]], ptr %arg1, i32 0, i32 %76, i32 %71
  %79 = load float, ptr %78, align 4, !invariant.load !74
  br label %concatenate.14.merge

concat_index_from_operand_id13:                   ; preds = %concatenate.pivot.1.6
  %80 = phi i32 [ 1, %concatenate.pivot.1.6 ]
  %81 = sub nsw i32 %9, %80
  %82 = add i32 %8, 0
  %83 = add i32 %6, 0
  %84 = add i32 %4, 16
  %85 = mul nuw nsw i32 %84, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 32
  %88 = mul nuw nsw i32 %83, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 16
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 131072
  %93 = getelementptr inbounds [131072 x [32 x float]], ptr %arg1, i32 0, i32 %91, i32 %86
  %94 = load float, ptr %93, align 4, !invariant.load !74
  br label %concatenate.14.merge

concatenate.pivot.1.4:                            ; preds = %concatenate.8.merge
  %95 = icmp ult i32 %9, 1
  br i1 %95, label %concatenate.pivot.0.5, label %concatenate.pivot.1.6

concatenate.pivot.0.5:                            ; preds = %concatenate.pivot.1.4
  br label %concat_index_from_operand_id02

concatenate.pivot.1.6:                            ; preds = %concatenate.pivot.1.4
  br label %concat_index_from_operand_id13

concatenate.14.merge:                             ; preds = %concat_index_from_operand_id13, %concat_index_from_operand_id02
  %96 = phi float [ %79, %concat_index_from_operand_id02 ], [ %94, %concat_index_from_operand_id13 ]
  %97 = insertvalue { float, float } %64, float %96, 1
  %98 = extractvalue { float, float } %97, 0
  %99 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %98, ptr %99, align 4
  %100 = extractvalue { float, float } %97, 1
  %101 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %100, ptr %101, align 4
  br label %concatenate.pivot.1.10

concat_index_from_operand_id08:                   ; preds = %concatenate.pivot.0.11
  %102 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %103 = sub nsw i32 %16, %102
  %104 = add i32 %15, 0
  %105 = add i32 %13, 0
  %106 = add i32 %11, 0
  %107 = mul nuw nsw i32 %106, 1
  %108 = add nuw nsw i32 0, %107
  %109 = udiv i32 %108, 32
  %110 = mul nuw nsw i32 %105, 1
  %111 = add nuw nsw i32 0, %110
  %112 = mul nuw nsw i32 %104, 16
  %113 = add nuw nsw i32 %111, %112
  %114 = udiv i32 %113, 131072
  %115 = getelementptr inbounds [131072 x [32 x float]], ptr %arg0, i32 0, i32 %113, i32 %108
  %116 = load float, ptr %115, align 4, !invariant.load !74
  br label %concatenate.8.merge7

concat_index_from_operand_id19:                   ; preds = %concatenate.pivot.1.12
  %117 = phi i32 [ 1, %concatenate.pivot.1.12 ]
  %118 = sub nsw i32 %16, %117
  %119 = add i32 %15, 0
  %120 = add i32 %13, 0
  %121 = add i32 %11, 16
  %122 = mul nuw nsw i32 %121, 1
  %123 = add nuw nsw i32 0, %122
  %124 = udiv i32 %123, 32
  %125 = mul nuw nsw i32 %120, 1
  %126 = add nuw nsw i32 0, %125
  %127 = mul nuw nsw i32 %119, 16
  %128 = add nuw nsw i32 %126, %127
  %129 = udiv i32 %128, 131072
  %130 = getelementptr inbounds [131072 x [32 x float]], ptr %arg0, i32 0, i32 %128, i32 %123
  %131 = load float, ptr %130, align 4, !invariant.load !74
  br label %concatenate.8.merge7

concatenate.pivot.1.10:                           ; preds = %concatenate.14.merge
  %132 = icmp ult i32 %16, 1
  br i1 %132, label %concatenate.pivot.0.11, label %concatenate.pivot.1.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.1.10
  br label %concat_index_from_operand_id08

concatenate.pivot.1.12:                           ; preds = %concatenate.pivot.1.10
  br label %concat_index_from_operand_id19

concatenate.8.merge7:                             ; preds = %concat_index_from_operand_id19, %concat_index_from_operand_id08
  %133 = phi float [ %116, %concat_index_from_operand_id08 ], [ %131, %concat_index_from_operand_id19 ]
  %134 = insertvalue { float, float } undef, float %133, 0
  br label %concatenate.pivot.1.16

concat_index_from_operand_id014:                  ; preds = %concatenate.pivot.0.17
  %135 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %136 = sub nsw i32 %16, %135
  %137 = add i32 %15, 0
  %138 = add i32 %13, 0
  %139 = add i32 %11, 0
  %140 = mul nuw nsw i32 %139, 1
  %141 = add nuw nsw i32 0, %140
  %142 = udiv i32 %141, 32
  %143 = mul nuw nsw i32 %138, 1
  %144 = add nuw nsw i32 0, %143
  %145 = mul nuw nsw i32 %137, 16
  %146 = add nuw nsw i32 %144, %145
  %147 = udiv i32 %146, 131072
  %148 = getelementptr inbounds [131072 x [32 x float]], ptr %arg1, i32 0, i32 %146, i32 %141
  %149 = load float, ptr %148, align 4, !invariant.load !74
  br label %concatenate.14.merge13

concat_index_from_operand_id115:                  ; preds = %concatenate.pivot.1.18
  %150 = phi i32 [ 1, %concatenate.pivot.1.18 ]
  %151 = sub nsw i32 %16, %150
  %152 = add i32 %15, 0
  %153 = add i32 %13, 0
  %154 = add i32 %11, 16
  %155 = mul nuw nsw i32 %154, 1
  %156 = add nuw nsw i32 0, %155
  %157 = udiv i32 %156, 32
  %158 = mul nuw nsw i32 %153, 1
  %159 = add nuw nsw i32 0, %158
  %160 = mul nuw nsw i32 %152, 16
  %161 = add nuw nsw i32 %159, %160
  %162 = udiv i32 %161, 131072
  %163 = getelementptr inbounds [131072 x [32 x float]], ptr %arg1, i32 0, i32 %161, i32 %156
  %164 = load float, ptr %163, align 4, !invariant.load !74
  br label %concatenate.14.merge13

concatenate.pivot.1.16:                           ; preds = %concatenate.8.merge7
  %165 = icmp ult i32 %16, 1
  br i1 %165, label %concatenate.pivot.0.17, label %concatenate.pivot.1.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.1.16
  br label %concat_index_from_operand_id014

concatenate.pivot.1.18:                           ; preds = %concatenate.pivot.1.16
  br label %concat_index_from_operand_id115

concatenate.14.merge13:                           ; preds = %concat_index_from_operand_id115, %concat_index_from_operand_id014
  %166 = phi float [ %149, %concat_index_from_operand_id014 ], [ %164, %concat_index_from_operand_id115 ]
  %167 = insertvalue { float, float } %134, float %166, 1
  %168 = extractvalue { float, float } %167, 0
  %169 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %168, ptr %169, align 4
  %170 = extractvalue { float, float } %167, 1
  %171 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %170, ptr %171, align 4
  br label %concatenate.pivot.1.22

concat_index_from_operand_id020:                  ; preds = %concatenate.pivot.0.23
  %172 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %173 = sub nsw i32 %23, %172
  %174 = add i32 %22, 0
  %175 = add i32 %20, 0
  %176 = add i32 %18, 0
  %177 = mul nuw nsw i32 %176, 1
  %178 = add nuw nsw i32 0, %177
  %179 = udiv i32 %178, 32
  %180 = mul nuw nsw i32 %175, 1
  %181 = add nuw nsw i32 0, %180
  %182 = mul nuw nsw i32 %174, 16
  %183 = add nuw nsw i32 %181, %182
  %184 = udiv i32 %183, 131072
  %185 = getelementptr inbounds [131072 x [32 x float]], ptr %arg0, i32 0, i32 %183, i32 %178
  %186 = load float, ptr %185, align 4, !invariant.load !74
  br label %concatenate.8.merge19

concat_index_from_operand_id121:                  ; preds = %concatenate.pivot.1.24
  %187 = phi i32 [ 1, %concatenate.pivot.1.24 ]
  %188 = sub nsw i32 %23, %187
  %189 = add i32 %22, 0
  %190 = add i32 %20, 0
  %191 = add i32 %18, 16
  %192 = mul nuw nsw i32 %191, 1
  %193 = add nuw nsw i32 0, %192
  %194 = udiv i32 %193, 32
  %195 = mul nuw nsw i32 %190, 1
  %196 = add nuw nsw i32 0, %195
  %197 = mul nuw nsw i32 %189, 16
  %198 = add nuw nsw i32 %196, %197
  %199 = udiv i32 %198, 131072
  %200 = getelementptr inbounds [131072 x [32 x float]], ptr %arg0, i32 0, i32 %198, i32 %193
  %201 = load float, ptr %200, align 4, !invariant.load !74
  br label %concatenate.8.merge19

concatenate.pivot.1.22:                           ; preds = %concatenate.14.merge13
  %202 = icmp ult i32 %23, 1
  br i1 %202, label %concatenate.pivot.0.23, label %concatenate.pivot.1.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.1.22
  br label %concat_index_from_operand_id020

concatenate.pivot.1.24:                           ; preds = %concatenate.pivot.1.22
  br label %concat_index_from_operand_id121

concatenate.8.merge19:                            ; preds = %concat_index_from_operand_id121, %concat_index_from_operand_id020
  %203 = phi float [ %186, %concat_index_from_operand_id020 ], [ %201, %concat_index_from_operand_id121 ]
  %204 = insertvalue { float, float } undef, float %203, 0
  br label %concatenate.pivot.1.28

concat_index_from_operand_id026:                  ; preds = %concatenate.pivot.0.29
  %205 = phi i32 [ 0, %concatenate.pivot.0.29 ]
  %206 = sub nsw i32 %23, %205
  %207 = add i32 %22, 0
  %208 = add i32 %20, 0
  %209 = add i32 %18, 0
  %210 = mul nuw nsw i32 %209, 1
  %211 = add nuw nsw i32 0, %210
  %212 = udiv i32 %211, 32
  %213 = mul nuw nsw i32 %208, 1
  %214 = add nuw nsw i32 0, %213
  %215 = mul nuw nsw i32 %207, 16
  %216 = add nuw nsw i32 %214, %215
  %217 = udiv i32 %216, 131072
  %218 = getelementptr inbounds [131072 x [32 x float]], ptr %arg1, i32 0, i32 %216, i32 %211
  %219 = load float, ptr %218, align 4, !invariant.load !74
  br label %concatenate.14.merge25

concat_index_from_operand_id127:                  ; preds = %concatenate.pivot.1.30
  %220 = phi i32 [ 1, %concatenate.pivot.1.30 ]
  %221 = sub nsw i32 %23, %220
  %222 = add i32 %22, 0
  %223 = add i32 %20, 0
  %224 = add i32 %18, 16
  %225 = mul nuw nsw i32 %224, 1
  %226 = add nuw nsw i32 0, %225
  %227 = udiv i32 %226, 32
  %228 = mul nuw nsw i32 %223, 1
  %229 = add nuw nsw i32 0, %228
  %230 = mul nuw nsw i32 %222, 16
  %231 = add nuw nsw i32 %229, %230
  %232 = udiv i32 %231, 131072
  %233 = getelementptr inbounds [131072 x [32 x float]], ptr %arg1, i32 0, i32 %231, i32 %226
  %234 = load float, ptr %233, align 4, !invariant.load !74
  br label %concatenate.14.merge25

concatenate.pivot.1.28:                           ; preds = %concatenate.8.merge19
  %235 = icmp ult i32 %23, 1
  br i1 %235, label %concatenate.pivot.0.29, label %concatenate.pivot.1.30

concatenate.pivot.0.29:                           ; preds = %concatenate.pivot.1.28
  br label %concat_index_from_operand_id026

concatenate.pivot.1.30:                           ; preds = %concatenate.pivot.1.28
  br label %concat_index_from_operand_id127

concatenate.14.merge25:                           ; preds = %concat_index_from_operand_id127, %concat_index_from_operand_id026
  %236 = phi float [ %219, %concat_index_from_operand_id026 ], [ %234, %concat_index_from_operand_id127 ]
  %237 = insertvalue { float, float } %204, float %236, 1
  %238 = extractvalue { float, float } %237, 0
  %239 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %238, ptr %239, align 4
  %240 = extractvalue { float, float } %237, 1
  %241 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %240, ptr %241, align 4
  br label %concatenate.pivot.1.34

concat_index_from_operand_id032:                  ; preds = %concatenate.pivot.0.35
  %242 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %243 = sub nsw i32 %30, %242
  %244 = add i32 %29, 0
  %245 = add i32 %27, 0
  %246 = add i32 %25, 0
  %247 = mul nuw nsw i32 %246, 1
  %248 = add nuw nsw i32 0, %247
  %249 = udiv i32 %248, 32
  %250 = mul nuw nsw i32 %245, 1
  %251 = add nuw nsw i32 0, %250
  %252 = mul nuw nsw i32 %244, 16
  %253 = add nuw nsw i32 %251, %252
  %254 = udiv i32 %253, 131072
  %255 = getelementptr inbounds [131072 x [32 x float]], ptr %arg0, i32 0, i32 %253, i32 %248
  %256 = load float, ptr %255, align 4, !invariant.load !74
  br label %concatenate.8.merge31

concat_index_from_operand_id133:                  ; preds = %concatenate.pivot.1.36
  %257 = phi i32 [ 1, %concatenate.pivot.1.36 ]
  %258 = sub nsw i32 %30, %257
  %259 = add i32 %29, 0
  %260 = add i32 %27, 0
  %261 = add i32 %25, 16
  %262 = mul nuw nsw i32 %261, 1
  %263 = add nuw nsw i32 0, %262
  %264 = udiv i32 %263, 32
  %265 = mul nuw nsw i32 %260, 1
  %266 = add nuw nsw i32 0, %265
  %267 = mul nuw nsw i32 %259, 16
  %268 = add nuw nsw i32 %266, %267
  %269 = udiv i32 %268, 131072
  %270 = getelementptr inbounds [131072 x [32 x float]], ptr %arg0, i32 0, i32 %268, i32 %263
  %271 = load float, ptr %270, align 4, !invariant.load !74
  br label %concatenate.8.merge31

concatenate.pivot.1.34:                           ; preds = %concatenate.14.merge25
  %272 = icmp ult i32 %30, 1
  br i1 %272, label %concatenate.pivot.0.35, label %concatenate.pivot.1.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.1.34
  br label %concat_index_from_operand_id032

concatenate.pivot.1.36:                           ; preds = %concatenate.pivot.1.34
  br label %concat_index_from_operand_id133

concatenate.8.merge31:                            ; preds = %concat_index_from_operand_id133, %concat_index_from_operand_id032
  %273 = phi float [ %256, %concat_index_from_operand_id032 ], [ %271, %concat_index_from_operand_id133 ]
  %274 = insertvalue { float, float } undef, float %273, 0
  br label %concatenate.pivot.1.40

concat_index_from_operand_id038:                  ; preds = %concatenate.pivot.0.41
  %275 = phi i32 [ 0, %concatenate.pivot.0.41 ]
  %276 = sub nsw i32 %30, %275
  %277 = add i32 %29, 0
  %278 = add i32 %27, 0
  %279 = add i32 %25, 0
  %280 = mul nuw nsw i32 %279, 1
  %281 = add nuw nsw i32 0, %280
  %282 = udiv i32 %281, 32
  %283 = mul nuw nsw i32 %278, 1
  %284 = add nuw nsw i32 0, %283
  %285 = mul nuw nsw i32 %277, 16
  %286 = add nuw nsw i32 %284, %285
  %287 = udiv i32 %286, 131072
  %288 = getelementptr inbounds [131072 x [32 x float]], ptr %arg1, i32 0, i32 %286, i32 %281
  %289 = load float, ptr %288, align 4, !invariant.load !74
  br label %concatenate.14.merge37

concat_index_from_operand_id139:                  ; preds = %concatenate.pivot.1.42
  %290 = phi i32 [ 1, %concatenate.pivot.1.42 ]
  %291 = sub nsw i32 %30, %290
  %292 = add i32 %29, 0
  %293 = add i32 %27, 0
  %294 = add i32 %25, 16
  %295 = mul nuw nsw i32 %294, 1
  %296 = add nuw nsw i32 0, %295
  %297 = udiv i32 %296, 32
  %298 = mul nuw nsw i32 %293, 1
  %299 = add nuw nsw i32 0, %298
  %300 = mul nuw nsw i32 %292, 16
  %301 = add nuw nsw i32 %299, %300
  %302 = udiv i32 %301, 131072
  %303 = getelementptr inbounds [131072 x [32 x float]], ptr %arg1, i32 0, i32 %301, i32 %296
  %304 = load float, ptr %303, align 4, !invariant.load !74
  br label %concatenate.14.merge37

concatenate.pivot.1.40:                           ; preds = %concatenate.8.merge31
  %305 = icmp ult i32 %30, 1
  br i1 %305, label %concatenate.pivot.0.41, label %concatenate.pivot.1.42

concatenate.pivot.0.41:                           ; preds = %concatenate.pivot.1.40
  br label %concat_index_from_operand_id038

concatenate.pivot.1.42:                           ; preds = %concatenate.pivot.1.40
  br label %concat_index_from_operand_id139

concatenate.14.merge37:                           ; preds = %concat_index_from_operand_id139, %concat_index_from_operand_id038
  %306 = phi float [ %289, %concat_index_from_operand_id038 ], [ %304, %concat_index_from_operand_id139 ]
  %307 = insertvalue { float, float } %274, float %306, 1
  %308 = extractvalue { float, float } %307, 0
  %309 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %308, ptr %309, align 4
  %310 = extractvalue { float, float } %307, 1
  %311 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %310, ptr %311, align 4
  br label %fusion_41.in_bounds-after
}

define void @concatenate_12(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(209715200) %arg1, ptr noalias align 128 dereferenceable(419430400) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !83
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 26214400
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index_base, 128
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 12800
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 128
  %10 = udiv i32 %linear_index1, 128
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 12800
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 128
  %15 = udiv i32 %linear_index2, 128
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 12800
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 128
  %20 = udiv i32 %linear_index3, 128
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 12800
  %23 = icmp ult i32 %linear_index_base, 104857600
  br i1 %23, label %concatenate_12.in_bounds-true, label %concatenate_12.in_bounds-after

concatenate_12.in_bounds-after:                   ; preds = %concatenate.3.merge14, %entry
  ret void

concatenate_12.in_bounds-true:                    ; preds = %entry
  br label %concatenate.pivot.64.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %4, %24
  %26 = udiv i32 %linear_index_base, 128
  %27 = mul i32 %26, 64
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 64
  %31 = udiv i32 %28, 64
  %32 = urem i32 %31, 100
  %33 = udiv i32 %28, 6400
  %34 = getelementptr inbounds float, ptr %arg0, i32 %28
  %35 = load float, ptr %34, align 4, !invariant.load !74
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %36 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %37 = sub nsw i32 %4, %36
  %38 = udiv i32 %linear_index_base, 128
  %39 = mul i32 %38, 64
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 64
  %43 = udiv i32 %40, 64
  %44 = urem i32 %43, 100
  %45 = udiv i32 %40, 6400
  %46 = getelementptr inbounds float, ptr %arg1, i32 %40
  %47 = load float, ptr %46, align 4, !invariant.load !74
  br label %concatenate.3.merge

concatenate.pivot.64.:                            ; preds = %concatenate_12.in_bounds-true
  %48 = icmp ult i32 %4, 64
  br i1 %48, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %49 = phi float [ %35, %concat_index_from_operand_id0 ], [ %47, %concat_index_from_operand_id1 ]
  %50 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %49, ptr %50, align 4
  br label %concatenate.pivot.64.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %51 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %52 = sub nsw i32 %9, %51
  %53 = udiv i32 %linear_index1, 128
  %54 = mul i32 %53, 64
  %55 = add i32 %54, %52
  %56 = udiv i32 %55, 1
  %57 = urem i32 %56, 64
  %58 = udiv i32 %55, 64
  %59 = urem i32 %58, 100
  %60 = udiv i32 %55, 6400
  %61 = getelementptr inbounds float, ptr %arg0, i32 %55
  %62 = load float, ptr %61, align 4, !invariant.load !74
  br label %concatenate.3.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.64.7
  %63 = phi i32 [ 64, %concatenate.pivot.64.7 ]
  %64 = sub nsw i32 %9, %63
  %65 = udiv i32 %linear_index1, 128
  %66 = mul i32 %65, 64
  %67 = add i32 %66, %64
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 64
  %70 = udiv i32 %67, 64
  %71 = urem i32 %70, 100
  %72 = udiv i32 %67, 6400
  %73 = getelementptr inbounds float, ptr %arg1, i32 %67
  %74 = load float, ptr %73, align 4, !invariant.load !74
  br label %concatenate.3.merge2

concatenate.pivot.64.5:                           ; preds = %concatenate.3.merge
  %75 = icmp ult i32 %9, 64
  br i1 %75, label %concatenate.pivot.0.6, label %concatenate.pivot.64.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.64.5
  br label %concat_index_from_operand_id03

concatenate.pivot.64.7:                           ; preds = %concatenate.pivot.64.5
  br label %concat_index_from_operand_id14

concatenate.3.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %76 = phi float [ %62, %concat_index_from_operand_id03 ], [ %74, %concat_index_from_operand_id14 ]
  %77 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %76, ptr %77, align 4
  br label %concatenate.pivot.64.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %78 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %79 = sub nsw i32 %14, %78
  %80 = udiv i32 %linear_index2, 128
  %81 = mul i32 %80, 64
  %82 = add i32 %81, %79
  %83 = udiv i32 %82, 1
  %84 = urem i32 %83, 64
  %85 = udiv i32 %82, 64
  %86 = urem i32 %85, 100
  %87 = udiv i32 %82, 6400
  %88 = getelementptr inbounds float, ptr %arg0, i32 %82
  %89 = load float, ptr %88, align 4, !invariant.load !74
  br label %concatenate.3.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.64.13
  %90 = phi i32 [ 64, %concatenate.pivot.64.13 ]
  %91 = sub nsw i32 %14, %90
  %92 = udiv i32 %linear_index2, 128
  %93 = mul i32 %92, 64
  %94 = add i32 %93, %91
  %95 = udiv i32 %94, 1
  %96 = urem i32 %95, 64
  %97 = udiv i32 %94, 64
  %98 = urem i32 %97, 100
  %99 = udiv i32 %94, 6400
  %100 = getelementptr inbounds float, ptr %arg1, i32 %94
  %101 = load float, ptr %100, align 4, !invariant.load !74
  br label %concatenate.3.merge8

concatenate.pivot.64.11:                          ; preds = %concatenate.3.merge2
  %102 = icmp ult i32 %14, 64
  br i1 %102, label %concatenate.pivot.0.12, label %concatenate.pivot.64.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.64.11
  br label %concat_index_from_operand_id09

concatenate.pivot.64.13:                          ; preds = %concatenate.pivot.64.11
  br label %concat_index_from_operand_id110

concatenate.3.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %103 = phi float [ %89, %concat_index_from_operand_id09 ], [ %101, %concat_index_from_operand_id110 ]
  %104 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %103, ptr %104, align 4
  br label %concatenate.pivot.64.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %105 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %106 = sub nsw i32 %19, %105
  %107 = udiv i32 %linear_index3, 128
  %108 = mul i32 %107, 64
  %109 = add i32 %108, %106
  %110 = udiv i32 %109, 1
  %111 = urem i32 %110, 64
  %112 = udiv i32 %109, 64
  %113 = urem i32 %112, 100
  %114 = udiv i32 %109, 6400
  %115 = getelementptr inbounds float, ptr %arg0, i32 %109
  %116 = load float, ptr %115, align 4, !invariant.load !74
  br label %concatenate.3.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.64.19
  %117 = phi i32 [ 64, %concatenate.pivot.64.19 ]
  %118 = sub nsw i32 %19, %117
  %119 = udiv i32 %linear_index3, 128
  %120 = mul i32 %119, 64
  %121 = add i32 %120, %118
  %122 = udiv i32 %121, 1
  %123 = urem i32 %122, 64
  %124 = udiv i32 %121, 64
  %125 = urem i32 %124, 100
  %126 = udiv i32 %121, 6400
  %127 = getelementptr inbounds float, ptr %arg1, i32 %121
  %128 = load float, ptr %127, align 4, !invariant.load !74
  br label %concatenate.3.merge14

concatenate.pivot.64.17:                          ; preds = %concatenate.3.merge8
  %129 = icmp ult i32 %19, 64
  br i1 %129, label %concatenate.pivot.0.18, label %concatenate.pivot.64.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.64.17
  br label %concat_index_from_operand_id015

concatenate.pivot.64.19:                          ; preds = %concatenate.pivot.64.17
  br label %concat_index_from_operand_id116

concatenate.3.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %130 = phi float [ %116, %concat_index_from_operand_id015 ], [ %128, %concat_index_from_operand_id116 ]
  %131 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %130, ptr %131, align 4
  br label %concatenate_12.in_bounds-after
}

define void @fusion_32(ptr noalias align 128 dereferenceable(419430400) %arg0, ptr noalias align 128 dereferenceable(67108864) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4194304
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
  %15 = icmp ult i32 %linear_index_base, 16777216
  br i1 %15, label %fusion_32.in_bounds-true, label %fusion_32.in_bounds-after

fusion_32.in_bounds-after:                        ; preds = %fusion_32.in_bounds-true, %entry
  ret void

fusion_32.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 128
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 16
  %22 = udiv i32 %20, 16
  %23 = udiv i32 %22, 8192
  %24 = add i32 %22, 0
  %25 = add i32 %21, 0
  %26 = add i32 %17, 0
  %27 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg0, i32 0, i32 %24, i32 %25, i32 %26
  %28 = load float, ptr %27, align 4, !invariant.load !74
  %29 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %28, ptr %29, align 4
  %30 = mul nuw nsw i32 %7, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 128
  %33 = mul nuw nsw i32 %8, 1
  %34 = add nuw nsw i32 0, %33
  %35 = urem i32 %34, 16
  %36 = udiv i32 %34, 16
  %37 = udiv i32 %36, 8192
  %38 = add i32 %36, 0
  %39 = add i32 %35, 0
  %40 = add i32 %31, 0
  %41 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg0, i32 0, i32 %38, i32 %39, i32 %40
  %42 = load float, ptr %41, align 4, !invariant.load !74
  %43 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %42, ptr %43, align 4
  %44 = mul nuw nsw i32 %10, 1
  %45 = add nuw nsw i32 0, %44
  %46 = udiv i32 %45, 128
  %47 = mul nuw nsw i32 %11, 1
  %48 = add nuw nsw i32 0, %47
  %49 = urem i32 %48, 16
  %50 = udiv i32 %48, 16
  %51 = udiv i32 %50, 8192
  %52 = add i32 %50, 0
  %53 = add i32 %49, 0
  %54 = add i32 %45, 0
  %55 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg0, i32 0, i32 %52, i32 %53, i32 %54
  %56 = load float, ptr %55, align 4, !invariant.load !74
  %57 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %56, ptr %57, align 4
  %58 = mul nuw nsw i32 %13, 1
  %59 = add nuw nsw i32 0, %58
  %60 = udiv i32 %59, 128
  %61 = mul nuw nsw i32 %14, 1
  %62 = add nuw nsw i32 0, %61
  %63 = urem i32 %62, 16
  %64 = udiv i32 %62, 16
  %65 = udiv i32 %64, 8192
  %66 = add i32 %64, 0
  %67 = add i32 %63, 0
  %68 = add i32 %59, 0
  %69 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg0, i32 0, i32 %66, i32 %67, i32 %68
  %70 = load float, ptr %69, align 4, !invariant.load !74
  %71 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %70, ptr %71, align 4
  br label %fusion_32.in_bounds-after
}

define void @fusion_42(ptr noalias align 128 dereferenceable(33554432) %arg0, ptr noalias align 128 dereferenceable(33554432) %arg1, ptr noalias align 128 dereferenceable(33554432) %arg2, ptr noalias align 128 dereferenceable(33554432) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2097152
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 32
  %5 = udiv i32 %linear_index_base, 32
  %6 = urem i32 %5, 16
  %7 = udiv i32 %linear_index_base, 512
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 4194304
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 32
  %12 = udiv i32 %linear_index1, 32
  %13 = urem i32 %12, 16
  %14 = udiv i32 %linear_index1, 512
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 4194304
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 32
  %19 = udiv i32 %linear_index2, 32
  %20 = urem i32 %19, 16
  %21 = udiv i32 %linear_index2, 512
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 4194304
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 32
  %26 = udiv i32 %linear_index3, 32
  %27 = urem i32 %26, 16
  %28 = udiv i32 %linear_index3, 512
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 4194304
  %31 = icmp ult i32 %linear_index_base, 8388608
  br i1 %31, label %fusion_42.in_bounds-true, label %fusion_42.in_bounds-after

fusion_42.in_bounds-after:                        ; preds = %concatenate.14.merge37, %entry
  ret void

fusion_42.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %32 = phi i32 [ 0, %concatenate.pivot.0. ]
  %33 = sub nsw i32 %9, %32
  %34 = add i32 %8, 0
  %35 = add i32 %6, 0
  %36 = add i32 %4, 0
  %37 = mul nuw nsw i32 %36, 1
  %38 = add nuw nsw i32 0, %37
  %39 = udiv i32 %38, 64
  %40 = mul nuw nsw i32 %35, 1
  %41 = add nuw nsw i32 0, %40
  %42 = mul nuw nsw i32 %34, 16
  %43 = add nuw nsw i32 %41, %42
  %44 = udiv i32 %43, 131072
  %45 = getelementptr inbounds [131072 x [64 x float]], ptr %arg0, i32 0, i32 %43, i32 %38
  %46 = load float, ptr %45, align 4, !invariant.load !74
  br label %concatenate.8.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %47 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %48 = sub nsw i32 %9, %47
  %49 = add i32 %8, 0
  %50 = add i32 %6, 0
  %51 = add i32 %4, 32
  %52 = mul nuw nsw i32 %51, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 64
  %55 = mul nuw nsw i32 %50, 1
  %56 = add nuw nsw i32 0, %55
  %57 = mul nuw nsw i32 %49, 16
  %58 = add nuw nsw i32 %56, %57
  %59 = udiv i32 %58, 131072
  %60 = getelementptr inbounds [131072 x [64 x float]], ptr %arg0, i32 0, i32 %58, i32 %53
  %61 = load float, ptr %60, align 4, !invariant.load !74
  br label %concatenate.8.merge

concatenate.pivot.1.:                             ; preds = %fusion_42.in_bounds-true
  %62 = icmp ult i32 %9, 1
  br i1 %62, label %concatenate.pivot.0., label %concatenate.pivot.1.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.8.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %63 = phi float [ %46, %concat_index_from_operand_id0 ], [ %61, %concat_index_from_operand_id1 ]
  %64 = insertvalue { float, float } undef, float %63, 0
  br label %concatenate.pivot.1.4

concat_index_from_operand_id02:                   ; preds = %concatenate.pivot.0.5
  %65 = phi i32 [ 0, %concatenate.pivot.0.5 ]
  %66 = sub nsw i32 %9, %65
  %67 = add i32 %8, 0
  %68 = add i32 %6, 0
  %69 = add i32 %4, 0
  %70 = mul nuw nsw i32 %69, 1
  %71 = add nuw nsw i32 0, %70
  %72 = udiv i32 %71, 64
  %73 = mul nuw nsw i32 %68, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %67, 16
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 131072
  %78 = getelementptr inbounds [131072 x [64 x float]], ptr %arg1, i32 0, i32 %76, i32 %71
  %79 = load float, ptr %78, align 4, !invariant.load !74
  br label %concatenate.14.merge

concat_index_from_operand_id13:                   ; preds = %concatenate.pivot.1.6
  %80 = phi i32 [ 1, %concatenate.pivot.1.6 ]
  %81 = sub nsw i32 %9, %80
  %82 = add i32 %8, 0
  %83 = add i32 %6, 0
  %84 = add i32 %4, 32
  %85 = mul nuw nsw i32 %84, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 64
  %88 = mul nuw nsw i32 %83, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 16
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 131072
  %93 = getelementptr inbounds [131072 x [64 x float]], ptr %arg1, i32 0, i32 %91, i32 %86
  %94 = load float, ptr %93, align 4, !invariant.load !74
  br label %concatenate.14.merge

concatenate.pivot.1.4:                            ; preds = %concatenate.8.merge
  %95 = icmp ult i32 %9, 1
  br i1 %95, label %concatenate.pivot.0.5, label %concatenate.pivot.1.6

concatenate.pivot.0.5:                            ; preds = %concatenate.pivot.1.4
  br label %concat_index_from_operand_id02

concatenate.pivot.1.6:                            ; preds = %concatenate.pivot.1.4
  br label %concat_index_from_operand_id13

concatenate.14.merge:                             ; preds = %concat_index_from_operand_id13, %concat_index_from_operand_id02
  %96 = phi float [ %79, %concat_index_from_operand_id02 ], [ %94, %concat_index_from_operand_id13 ]
  %97 = insertvalue { float, float } %64, float %96, 1
  %98 = extractvalue { float, float } %97, 0
  %99 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %98, ptr %99, align 4
  %100 = extractvalue { float, float } %97, 1
  %101 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %100, ptr %101, align 4
  br label %concatenate.pivot.1.10

concat_index_from_operand_id08:                   ; preds = %concatenate.pivot.0.11
  %102 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %103 = sub nsw i32 %16, %102
  %104 = add i32 %15, 0
  %105 = add i32 %13, 0
  %106 = add i32 %11, 0
  %107 = mul nuw nsw i32 %106, 1
  %108 = add nuw nsw i32 0, %107
  %109 = udiv i32 %108, 64
  %110 = mul nuw nsw i32 %105, 1
  %111 = add nuw nsw i32 0, %110
  %112 = mul nuw nsw i32 %104, 16
  %113 = add nuw nsw i32 %111, %112
  %114 = udiv i32 %113, 131072
  %115 = getelementptr inbounds [131072 x [64 x float]], ptr %arg0, i32 0, i32 %113, i32 %108
  %116 = load float, ptr %115, align 4, !invariant.load !74
  br label %concatenate.8.merge7

concat_index_from_operand_id19:                   ; preds = %concatenate.pivot.1.12
  %117 = phi i32 [ 1, %concatenate.pivot.1.12 ]
  %118 = sub nsw i32 %16, %117
  %119 = add i32 %15, 0
  %120 = add i32 %13, 0
  %121 = add i32 %11, 32
  %122 = mul nuw nsw i32 %121, 1
  %123 = add nuw nsw i32 0, %122
  %124 = udiv i32 %123, 64
  %125 = mul nuw nsw i32 %120, 1
  %126 = add nuw nsw i32 0, %125
  %127 = mul nuw nsw i32 %119, 16
  %128 = add nuw nsw i32 %126, %127
  %129 = udiv i32 %128, 131072
  %130 = getelementptr inbounds [131072 x [64 x float]], ptr %arg0, i32 0, i32 %128, i32 %123
  %131 = load float, ptr %130, align 4, !invariant.load !74
  br label %concatenate.8.merge7

concatenate.pivot.1.10:                           ; preds = %concatenate.14.merge
  %132 = icmp ult i32 %16, 1
  br i1 %132, label %concatenate.pivot.0.11, label %concatenate.pivot.1.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.1.10
  br label %concat_index_from_operand_id08

concatenate.pivot.1.12:                           ; preds = %concatenate.pivot.1.10
  br label %concat_index_from_operand_id19

concatenate.8.merge7:                             ; preds = %concat_index_from_operand_id19, %concat_index_from_operand_id08
  %133 = phi float [ %116, %concat_index_from_operand_id08 ], [ %131, %concat_index_from_operand_id19 ]
  %134 = insertvalue { float, float } undef, float %133, 0
  br label %concatenate.pivot.1.16

concat_index_from_operand_id014:                  ; preds = %concatenate.pivot.0.17
  %135 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %136 = sub nsw i32 %16, %135
  %137 = add i32 %15, 0
  %138 = add i32 %13, 0
  %139 = add i32 %11, 0
  %140 = mul nuw nsw i32 %139, 1
  %141 = add nuw nsw i32 0, %140
  %142 = udiv i32 %141, 64
  %143 = mul nuw nsw i32 %138, 1
  %144 = add nuw nsw i32 0, %143
  %145 = mul nuw nsw i32 %137, 16
  %146 = add nuw nsw i32 %144, %145
  %147 = udiv i32 %146, 131072
  %148 = getelementptr inbounds [131072 x [64 x float]], ptr %arg1, i32 0, i32 %146, i32 %141
  %149 = load float, ptr %148, align 4, !invariant.load !74
  br label %concatenate.14.merge13

concat_index_from_operand_id115:                  ; preds = %concatenate.pivot.1.18
  %150 = phi i32 [ 1, %concatenate.pivot.1.18 ]
  %151 = sub nsw i32 %16, %150
  %152 = add i32 %15, 0
  %153 = add i32 %13, 0
  %154 = add i32 %11, 32
  %155 = mul nuw nsw i32 %154, 1
  %156 = add nuw nsw i32 0, %155
  %157 = udiv i32 %156, 64
  %158 = mul nuw nsw i32 %153, 1
  %159 = add nuw nsw i32 0, %158
  %160 = mul nuw nsw i32 %152, 16
  %161 = add nuw nsw i32 %159, %160
  %162 = udiv i32 %161, 131072
  %163 = getelementptr inbounds [131072 x [64 x float]], ptr %arg1, i32 0, i32 %161, i32 %156
  %164 = load float, ptr %163, align 4, !invariant.load !74
  br label %concatenate.14.merge13

concatenate.pivot.1.16:                           ; preds = %concatenate.8.merge7
  %165 = icmp ult i32 %16, 1
  br i1 %165, label %concatenate.pivot.0.17, label %concatenate.pivot.1.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.1.16
  br label %concat_index_from_operand_id014

concatenate.pivot.1.18:                           ; preds = %concatenate.pivot.1.16
  br label %concat_index_from_operand_id115

concatenate.14.merge13:                           ; preds = %concat_index_from_operand_id115, %concat_index_from_operand_id014
  %166 = phi float [ %149, %concat_index_from_operand_id014 ], [ %164, %concat_index_from_operand_id115 ]
  %167 = insertvalue { float, float } %134, float %166, 1
  %168 = extractvalue { float, float } %167, 0
  %169 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %168, ptr %169, align 4
  %170 = extractvalue { float, float } %167, 1
  %171 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %170, ptr %171, align 4
  br label %concatenate.pivot.1.22

concat_index_from_operand_id020:                  ; preds = %concatenate.pivot.0.23
  %172 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %173 = sub nsw i32 %23, %172
  %174 = add i32 %22, 0
  %175 = add i32 %20, 0
  %176 = add i32 %18, 0
  %177 = mul nuw nsw i32 %176, 1
  %178 = add nuw nsw i32 0, %177
  %179 = udiv i32 %178, 64
  %180 = mul nuw nsw i32 %175, 1
  %181 = add nuw nsw i32 0, %180
  %182 = mul nuw nsw i32 %174, 16
  %183 = add nuw nsw i32 %181, %182
  %184 = udiv i32 %183, 131072
  %185 = getelementptr inbounds [131072 x [64 x float]], ptr %arg0, i32 0, i32 %183, i32 %178
  %186 = load float, ptr %185, align 4, !invariant.load !74
  br label %concatenate.8.merge19

concat_index_from_operand_id121:                  ; preds = %concatenate.pivot.1.24
  %187 = phi i32 [ 1, %concatenate.pivot.1.24 ]
  %188 = sub nsw i32 %23, %187
  %189 = add i32 %22, 0
  %190 = add i32 %20, 0
  %191 = add i32 %18, 32
  %192 = mul nuw nsw i32 %191, 1
  %193 = add nuw nsw i32 0, %192
  %194 = udiv i32 %193, 64
  %195 = mul nuw nsw i32 %190, 1
  %196 = add nuw nsw i32 0, %195
  %197 = mul nuw nsw i32 %189, 16
  %198 = add nuw nsw i32 %196, %197
  %199 = udiv i32 %198, 131072
  %200 = getelementptr inbounds [131072 x [64 x float]], ptr %arg0, i32 0, i32 %198, i32 %193
  %201 = load float, ptr %200, align 4, !invariant.load !74
  br label %concatenate.8.merge19

concatenate.pivot.1.22:                           ; preds = %concatenate.14.merge13
  %202 = icmp ult i32 %23, 1
  br i1 %202, label %concatenate.pivot.0.23, label %concatenate.pivot.1.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.1.22
  br label %concat_index_from_operand_id020

concatenate.pivot.1.24:                           ; preds = %concatenate.pivot.1.22
  br label %concat_index_from_operand_id121

concatenate.8.merge19:                            ; preds = %concat_index_from_operand_id121, %concat_index_from_operand_id020
  %203 = phi float [ %186, %concat_index_from_operand_id020 ], [ %201, %concat_index_from_operand_id121 ]
  %204 = insertvalue { float, float } undef, float %203, 0
  br label %concatenate.pivot.1.28

concat_index_from_operand_id026:                  ; preds = %concatenate.pivot.0.29
  %205 = phi i32 [ 0, %concatenate.pivot.0.29 ]
  %206 = sub nsw i32 %23, %205
  %207 = add i32 %22, 0
  %208 = add i32 %20, 0
  %209 = add i32 %18, 0
  %210 = mul nuw nsw i32 %209, 1
  %211 = add nuw nsw i32 0, %210
  %212 = udiv i32 %211, 64
  %213 = mul nuw nsw i32 %208, 1
  %214 = add nuw nsw i32 0, %213
  %215 = mul nuw nsw i32 %207, 16
  %216 = add nuw nsw i32 %214, %215
  %217 = udiv i32 %216, 131072
  %218 = getelementptr inbounds [131072 x [64 x float]], ptr %arg1, i32 0, i32 %216, i32 %211
  %219 = load float, ptr %218, align 4, !invariant.load !74
  br label %concatenate.14.merge25

concat_index_from_operand_id127:                  ; preds = %concatenate.pivot.1.30
  %220 = phi i32 [ 1, %concatenate.pivot.1.30 ]
  %221 = sub nsw i32 %23, %220
  %222 = add i32 %22, 0
  %223 = add i32 %20, 0
  %224 = add i32 %18, 32
  %225 = mul nuw nsw i32 %224, 1
  %226 = add nuw nsw i32 0, %225
  %227 = udiv i32 %226, 64
  %228 = mul nuw nsw i32 %223, 1
  %229 = add nuw nsw i32 0, %228
  %230 = mul nuw nsw i32 %222, 16
  %231 = add nuw nsw i32 %229, %230
  %232 = udiv i32 %231, 131072
  %233 = getelementptr inbounds [131072 x [64 x float]], ptr %arg1, i32 0, i32 %231, i32 %226
  %234 = load float, ptr %233, align 4, !invariant.load !74
  br label %concatenate.14.merge25

concatenate.pivot.1.28:                           ; preds = %concatenate.8.merge19
  %235 = icmp ult i32 %23, 1
  br i1 %235, label %concatenate.pivot.0.29, label %concatenate.pivot.1.30

concatenate.pivot.0.29:                           ; preds = %concatenate.pivot.1.28
  br label %concat_index_from_operand_id026

concatenate.pivot.1.30:                           ; preds = %concatenate.pivot.1.28
  br label %concat_index_from_operand_id127

concatenate.14.merge25:                           ; preds = %concat_index_from_operand_id127, %concat_index_from_operand_id026
  %236 = phi float [ %219, %concat_index_from_operand_id026 ], [ %234, %concat_index_from_operand_id127 ]
  %237 = insertvalue { float, float } %204, float %236, 1
  %238 = extractvalue { float, float } %237, 0
  %239 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %238, ptr %239, align 4
  %240 = extractvalue { float, float } %237, 1
  %241 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %240, ptr %241, align 4
  br label %concatenate.pivot.1.34

concat_index_from_operand_id032:                  ; preds = %concatenate.pivot.0.35
  %242 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %243 = sub nsw i32 %30, %242
  %244 = add i32 %29, 0
  %245 = add i32 %27, 0
  %246 = add i32 %25, 0
  %247 = mul nuw nsw i32 %246, 1
  %248 = add nuw nsw i32 0, %247
  %249 = udiv i32 %248, 64
  %250 = mul nuw nsw i32 %245, 1
  %251 = add nuw nsw i32 0, %250
  %252 = mul nuw nsw i32 %244, 16
  %253 = add nuw nsw i32 %251, %252
  %254 = udiv i32 %253, 131072
  %255 = getelementptr inbounds [131072 x [64 x float]], ptr %arg0, i32 0, i32 %253, i32 %248
  %256 = load float, ptr %255, align 4, !invariant.load !74
  br label %concatenate.8.merge31

concat_index_from_operand_id133:                  ; preds = %concatenate.pivot.1.36
  %257 = phi i32 [ 1, %concatenate.pivot.1.36 ]
  %258 = sub nsw i32 %30, %257
  %259 = add i32 %29, 0
  %260 = add i32 %27, 0
  %261 = add i32 %25, 32
  %262 = mul nuw nsw i32 %261, 1
  %263 = add nuw nsw i32 0, %262
  %264 = udiv i32 %263, 64
  %265 = mul nuw nsw i32 %260, 1
  %266 = add nuw nsw i32 0, %265
  %267 = mul nuw nsw i32 %259, 16
  %268 = add nuw nsw i32 %266, %267
  %269 = udiv i32 %268, 131072
  %270 = getelementptr inbounds [131072 x [64 x float]], ptr %arg0, i32 0, i32 %268, i32 %263
  %271 = load float, ptr %270, align 4, !invariant.load !74
  br label %concatenate.8.merge31

concatenate.pivot.1.34:                           ; preds = %concatenate.14.merge25
  %272 = icmp ult i32 %30, 1
  br i1 %272, label %concatenate.pivot.0.35, label %concatenate.pivot.1.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.1.34
  br label %concat_index_from_operand_id032

concatenate.pivot.1.36:                           ; preds = %concatenate.pivot.1.34
  br label %concat_index_from_operand_id133

concatenate.8.merge31:                            ; preds = %concat_index_from_operand_id133, %concat_index_from_operand_id032
  %273 = phi float [ %256, %concat_index_from_operand_id032 ], [ %271, %concat_index_from_operand_id133 ]
  %274 = insertvalue { float, float } undef, float %273, 0
  br label %concatenate.pivot.1.40

concat_index_from_operand_id038:                  ; preds = %concatenate.pivot.0.41
  %275 = phi i32 [ 0, %concatenate.pivot.0.41 ]
  %276 = sub nsw i32 %30, %275
  %277 = add i32 %29, 0
  %278 = add i32 %27, 0
  %279 = add i32 %25, 0
  %280 = mul nuw nsw i32 %279, 1
  %281 = add nuw nsw i32 0, %280
  %282 = udiv i32 %281, 64
  %283 = mul nuw nsw i32 %278, 1
  %284 = add nuw nsw i32 0, %283
  %285 = mul nuw nsw i32 %277, 16
  %286 = add nuw nsw i32 %284, %285
  %287 = udiv i32 %286, 131072
  %288 = getelementptr inbounds [131072 x [64 x float]], ptr %arg1, i32 0, i32 %286, i32 %281
  %289 = load float, ptr %288, align 4, !invariant.load !74
  br label %concatenate.14.merge37

concat_index_from_operand_id139:                  ; preds = %concatenate.pivot.1.42
  %290 = phi i32 [ 1, %concatenate.pivot.1.42 ]
  %291 = sub nsw i32 %30, %290
  %292 = add i32 %29, 0
  %293 = add i32 %27, 0
  %294 = add i32 %25, 32
  %295 = mul nuw nsw i32 %294, 1
  %296 = add nuw nsw i32 0, %295
  %297 = udiv i32 %296, 64
  %298 = mul nuw nsw i32 %293, 1
  %299 = add nuw nsw i32 0, %298
  %300 = mul nuw nsw i32 %292, 16
  %301 = add nuw nsw i32 %299, %300
  %302 = udiv i32 %301, 131072
  %303 = getelementptr inbounds [131072 x [64 x float]], ptr %arg1, i32 0, i32 %301, i32 %296
  %304 = load float, ptr %303, align 4, !invariant.load !74
  br label %concatenate.14.merge37

concatenate.pivot.1.40:                           ; preds = %concatenate.8.merge31
  %305 = icmp ult i32 %30, 1
  br i1 %305, label %concatenate.pivot.0.41, label %concatenate.pivot.1.42

concatenate.pivot.0.41:                           ; preds = %concatenate.pivot.1.40
  br label %concat_index_from_operand_id038

concatenate.pivot.1.42:                           ; preds = %concatenate.pivot.1.40
  br label %concat_index_from_operand_id139

concatenate.14.merge37:                           ; preds = %concat_index_from_operand_id139, %concat_index_from_operand_id038
  %306 = phi float [ %289, %concat_index_from_operand_id038 ], [ %304, %concat_index_from_operand_id139 ]
  %307 = insertvalue { float, float } %274, float %306, 1
  %308 = extractvalue { float, float } %307, 0
  %309 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %308, ptr %309, align 4
  %310 = extractvalue { float, float } %307, 1
  %311 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %310, ptr %311, align 4
  br label %fusion_42.in_bounds-after
}

define void @fusion_30(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(33554432) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2097152
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
  %15 = icmp ult i32 %linear_index_base, 8388608
  br i1 %15, label %fusion_30.in_bounds-true, label %fusion_30.in_bounds-after

fusion_30.in_bounds-after:                        ; preds = %concatenate.3.merge14, %entry
  ret void

fusion_30.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 32
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 16
  %22 = udiv i32 %20, 16
  %23 = urem i32 %22, 8192
  %24 = udiv i32 %22, 8192
  %25 = udiv i32 %24, 2
  br label %concatenate.pivot.16.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %26 = phi i32 [ 0, %concatenate.pivot.0. ]
  %27 = sub nsw i32 %17, %26
  %28 = udiv i32 %linear_index_base, 32
  %29 = mul i32 %28, 16
  %30 = add i32 %29, %27
  %31 = udiv i32 %30, 1
  %32 = urem i32 %31, 16
  %33 = udiv i32 %30, 16
  %34 = urem i32 %33, 16
  %35 = udiv i32 %30, 256
  %36 = urem i32 %35, 8192
  %37 = udiv i32 %30, 2097152
  %38 = getelementptr inbounds float, ptr %arg0, i32 %30
  %39 = load float, ptr %38, align 4, !invariant.load !74
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.16.1
  %40 = phi i32 [ 16, %concatenate.pivot.16.1 ]
  %41 = sub nsw i32 %17, %40
  %42 = udiv i32 %linear_index_base, 32
  %43 = mul i32 %42, 16
  %44 = add i32 %43, %41
  %45 = udiv i32 %44, 1
  %46 = urem i32 %45, 16
  %47 = udiv i32 %44, 16
  %48 = urem i32 %47, 16
  %49 = udiv i32 %44, 256
  %50 = urem i32 %49, 8192
  %51 = udiv i32 %44, 2097152
  %52 = getelementptr inbounds float, ptr %arg1, i32 %44
  %53 = load float, ptr %52, align 4, !invariant.load !74
  br label %concatenate.3.merge

concatenate.pivot.16.:                            ; preds = %fusion_30.in_bounds-true
  %54 = icmp ult i32 %17, 16
  br i1 %54, label %concatenate.pivot.0., label %concatenate.pivot.16.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id0

concatenate.pivot.16.1:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id1

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %55 = phi float [ %39, %concat_index_from_operand_id0 ], [ %53, %concat_index_from_operand_id1 ]
  %56 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %55, ptr %56, align 4
  %57 = mul nuw nsw i32 %7, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 32
  %60 = mul nuw nsw i32 %8, 1
  %61 = add nuw nsw i32 0, %60
  %62 = urem i32 %61, 16
  %63 = udiv i32 %61, 16
  %64 = urem i32 %63, 8192
  %65 = udiv i32 %63, 8192
  %66 = udiv i32 %65, 2
  br label %concatenate.pivot.16.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %67 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %68 = sub nsw i32 %58, %67
  %69 = udiv i32 %linear_index1, 32
  %70 = mul i32 %69, 16
  %71 = add i32 %70, %68
  %72 = udiv i32 %71, 1
  %73 = urem i32 %72, 16
  %74 = udiv i32 %71, 16
  %75 = urem i32 %74, 16
  %76 = udiv i32 %71, 256
  %77 = urem i32 %76, 8192
  %78 = udiv i32 %71, 2097152
  %79 = getelementptr inbounds float, ptr %arg0, i32 %71
  %80 = load float, ptr %79, align 4, !invariant.load !74
  br label %concatenate.3.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.16.7
  %81 = phi i32 [ 16, %concatenate.pivot.16.7 ]
  %82 = sub nsw i32 %58, %81
  %83 = udiv i32 %linear_index1, 32
  %84 = mul i32 %83, 16
  %85 = add i32 %84, %82
  %86 = udiv i32 %85, 1
  %87 = urem i32 %86, 16
  %88 = udiv i32 %85, 16
  %89 = urem i32 %88, 16
  %90 = udiv i32 %85, 256
  %91 = urem i32 %90, 8192
  %92 = udiv i32 %85, 2097152
  %93 = getelementptr inbounds float, ptr %arg1, i32 %85
  %94 = load float, ptr %93, align 4, !invariant.load !74
  br label %concatenate.3.merge2

concatenate.pivot.16.5:                           ; preds = %concatenate.3.merge
  %95 = icmp ult i32 %58, 16
  br i1 %95, label %concatenate.pivot.0.6, label %concatenate.pivot.16.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.16.5
  br label %concat_index_from_operand_id03

concatenate.pivot.16.7:                           ; preds = %concatenate.pivot.16.5
  br label %concat_index_from_operand_id14

concatenate.3.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %96 = phi float [ %80, %concat_index_from_operand_id03 ], [ %94, %concat_index_from_operand_id14 ]
  %97 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %96, ptr %97, align 4
  %98 = mul nuw nsw i32 %10, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 32
  %101 = mul nuw nsw i32 %11, 1
  %102 = add nuw nsw i32 0, %101
  %103 = urem i32 %102, 16
  %104 = udiv i32 %102, 16
  %105 = urem i32 %104, 8192
  %106 = udiv i32 %104, 8192
  %107 = udiv i32 %106, 2
  br label %concatenate.pivot.16.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %108 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %109 = sub nsw i32 %99, %108
  %110 = udiv i32 %linear_index2, 32
  %111 = mul i32 %110, 16
  %112 = add i32 %111, %109
  %113 = udiv i32 %112, 1
  %114 = urem i32 %113, 16
  %115 = udiv i32 %112, 16
  %116 = urem i32 %115, 16
  %117 = udiv i32 %112, 256
  %118 = urem i32 %117, 8192
  %119 = udiv i32 %112, 2097152
  %120 = getelementptr inbounds float, ptr %arg0, i32 %112
  %121 = load float, ptr %120, align 4, !invariant.load !74
  br label %concatenate.3.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.16.13
  %122 = phi i32 [ 16, %concatenate.pivot.16.13 ]
  %123 = sub nsw i32 %99, %122
  %124 = udiv i32 %linear_index2, 32
  %125 = mul i32 %124, 16
  %126 = add i32 %125, %123
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 16
  %129 = udiv i32 %126, 16
  %130 = urem i32 %129, 16
  %131 = udiv i32 %126, 256
  %132 = urem i32 %131, 8192
  %133 = udiv i32 %126, 2097152
  %134 = getelementptr inbounds float, ptr %arg1, i32 %126
  %135 = load float, ptr %134, align 4, !invariant.load !74
  br label %concatenate.3.merge8

concatenate.pivot.16.11:                          ; preds = %concatenate.3.merge2
  %136 = icmp ult i32 %99, 16
  br i1 %136, label %concatenate.pivot.0.12, label %concatenate.pivot.16.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.16.11
  br label %concat_index_from_operand_id09

concatenate.pivot.16.13:                          ; preds = %concatenate.pivot.16.11
  br label %concat_index_from_operand_id110

concatenate.3.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %137 = phi float [ %121, %concat_index_from_operand_id09 ], [ %135, %concat_index_from_operand_id110 ]
  %138 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %137, ptr %138, align 4
  %139 = mul nuw nsw i32 %13, 1
  %140 = add nuw nsw i32 0, %139
  %141 = udiv i32 %140, 32
  %142 = mul nuw nsw i32 %14, 1
  %143 = add nuw nsw i32 0, %142
  %144 = urem i32 %143, 16
  %145 = udiv i32 %143, 16
  %146 = urem i32 %145, 8192
  %147 = udiv i32 %145, 8192
  %148 = udiv i32 %147, 2
  br label %concatenate.pivot.16.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %149 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %150 = sub nsw i32 %140, %149
  %151 = udiv i32 %linear_index3, 32
  %152 = mul i32 %151, 16
  %153 = add i32 %152, %150
  %154 = udiv i32 %153, 1
  %155 = urem i32 %154, 16
  %156 = udiv i32 %153, 16
  %157 = urem i32 %156, 16
  %158 = udiv i32 %153, 256
  %159 = urem i32 %158, 8192
  %160 = udiv i32 %153, 2097152
  %161 = getelementptr inbounds float, ptr %arg0, i32 %153
  %162 = load float, ptr %161, align 4, !invariant.load !74
  br label %concatenate.3.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.16.19
  %163 = phi i32 [ 16, %concatenate.pivot.16.19 ]
  %164 = sub nsw i32 %140, %163
  %165 = udiv i32 %linear_index3, 32
  %166 = mul i32 %165, 16
  %167 = add i32 %166, %164
  %168 = udiv i32 %167, 1
  %169 = urem i32 %168, 16
  %170 = udiv i32 %167, 16
  %171 = urem i32 %170, 16
  %172 = udiv i32 %167, 256
  %173 = urem i32 %172, 8192
  %174 = udiv i32 %167, 2097152
  %175 = getelementptr inbounds float, ptr %arg1, i32 %167
  %176 = load float, ptr %175, align 4, !invariant.load !74
  br label %concatenate.3.merge14

concatenate.pivot.16.17:                          ; preds = %concatenate.3.merge8
  %177 = icmp ult i32 %140, 16
  br i1 %177, label %concatenate.pivot.0.18, label %concatenate.pivot.16.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.16.17
  br label %concat_index_from_operand_id015

concatenate.pivot.16.19:                          ; preds = %concatenate.pivot.16.17
  br label %concat_index_from_operand_id116

concatenate.3.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %178 = phi float [ %162, %concat_index_from_operand_id015 ], [ %176, %concat_index_from_operand_id116 ]
  %179 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %178, ptr %179, align 4
  br label %fusion_30.in_bounds-after
}

define void @concatenate_7(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(33554432) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2097152
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 32
  %5 = udiv i32 %linear_index_base, 32
  %6 = urem i32 %5, 16
  %7 = udiv i32 %linear_index_base, 512
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 4194304
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 32
  %12 = udiv i32 %linear_index1, 32
  %13 = urem i32 %12, 16
  %14 = udiv i32 %linear_index1, 512
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 4194304
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 32
  %19 = udiv i32 %linear_index2, 32
  %20 = urem i32 %19, 16
  %21 = udiv i32 %linear_index2, 512
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 4194304
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 32
  %26 = udiv i32 %linear_index3, 32
  %27 = urem i32 %26, 16
  %28 = udiv i32 %linear_index3, 512
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 4194304
  %31 = icmp ult i32 %linear_index_base, 8388608
  br i1 %31, label %concatenate_7.in_bounds-true, label %concatenate_7.in_bounds-after

concatenate_7.in_bounds-after:                    ; preds = %concatenate.3.merge14, %entry
  ret void

concatenate_7.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.16.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %32 = phi i32 [ 0, %concatenate.pivot.0. ]
  %33 = sub nsw i32 %4, %32
  %34 = udiv i32 %linear_index_base, 32
  %35 = mul i32 %34, 16
  %36 = add i32 %35, %33
  %37 = udiv i32 %36, 1
  %38 = urem i32 %37, 16
  %39 = udiv i32 %36, 16
  %40 = urem i32 %39, 16
  %41 = udiv i32 %36, 256
  %42 = urem i32 %41, 8192
  %43 = udiv i32 %36, 2097152
  %44 = getelementptr inbounds float, ptr %arg0, i32 %36
  %45 = load float, ptr %44, align 4, !invariant.load !74
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.16.1
  %46 = phi i32 [ 16, %concatenate.pivot.16.1 ]
  %47 = sub nsw i32 %4, %46
  %48 = udiv i32 %linear_index_base, 32
  %49 = mul i32 %48, 16
  %50 = add i32 %49, %47
  %51 = udiv i32 %50, 1
  %52 = urem i32 %51, 16
  %53 = udiv i32 %50, 16
  %54 = urem i32 %53, 16
  %55 = udiv i32 %50, 256
  %56 = urem i32 %55, 8192
  %57 = udiv i32 %50, 2097152
  %58 = getelementptr inbounds float, ptr %arg1, i32 %50
  %59 = load float, ptr %58, align 4, !invariant.load !74
  br label %concatenate.3.merge

concatenate.pivot.16.:                            ; preds = %concatenate_7.in_bounds-true
  %60 = icmp ult i32 %4, 16
  br i1 %60, label %concatenate.pivot.0., label %concatenate.pivot.16.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id0

concatenate.pivot.16.1:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id1

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %61 = phi float [ %45, %concat_index_from_operand_id0 ], [ %59, %concat_index_from_operand_id1 ]
  %62 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %61, ptr %62, align 4
  br label %concatenate.pivot.16.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %63 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %64 = sub nsw i32 %11, %63
  %65 = udiv i32 %linear_index1, 32
  %66 = mul i32 %65, 16
  %67 = add i32 %66, %64
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 16
  %70 = udiv i32 %67, 16
  %71 = urem i32 %70, 16
  %72 = udiv i32 %67, 256
  %73 = urem i32 %72, 8192
  %74 = udiv i32 %67, 2097152
  %75 = getelementptr inbounds float, ptr %arg0, i32 %67
  %76 = load float, ptr %75, align 4, !invariant.load !74
  br label %concatenate.3.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.16.7
  %77 = phi i32 [ 16, %concatenate.pivot.16.7 ]
  %78 = sub nsw i32 %11, %77
  %79 = udiv i32 %linear_index1, 32
  %80 = mul i32 %79, 16
  %81 = add i32 %80, %78
  %82 = udiv i32 %81, 1
  %83 = urem i32 %82, 16
  %84 = udiv i32 %81, 16
  %85 = urem i32 %84, 16
  %86 = udiv i32 %81, 256
  %87 = urem i32 %86, 8192
  %88 = udiv i32 %81, 2097152
  %89 = getelementptr inbounds float, ptr %arg1, i32 %81
  %90 = load float, ptr %89, align 4, !invariant.load !74
  br label %concatenate.3.merge2

concatenate.pivot.16.5:                           ; preds = %concatenate.3.merge
  %91 = icmp ult i32 %11, 16
  br i1 %91, label %concatenate.pivot.0.6, label %concatenate.pivot.16.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.16.5
  br label %concat_index_from_operand_id03

concatenate.pivot.16.7:                           ; preds = %concatenate.pivot.16.5
  br label %concat_index_from_operand_id14

concatenate.3.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %92 = phi float [ %76, %concat_index_from_operand_id03 ], [ %90, %concat_index_from_operand_id14 ]
  %93 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %92, ptr %93, align 4
  br label %concatenate.pivot.16.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %94 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %95 = sub nsw i32 %18, %94
  %96 = udiv i32 %linear_index2, 32
  %97 = mul i32 %96, 16
  %98 = add i32 %97, %95
  %99 = udiv i32 %98, 1
  %100 = urem i32 %99, 16
  %101 = udiv i32 %98, 16
  %102 = urem i32 %101, 16
  %103 = udiv i32 %98, 256
  %104 = urem i32 %103, 8192
  %105 = udiv i32 %98, 2097152
  %106 = getelementptr inbounds float, ptr %arg0, i32 %98
  %107 = load float, ptr %106, align 4, !invariant.load !74
  br label %concatenate.3.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.16.13
  %108 = phi i32 [ 16, %concatenate.pivot.16.13 ]
  %109 = sub nsw i32 %18, %108
  %110 = udiv i32 %linear_index2, 32
  %111 = mul i32 %110, 16
  %112 = add i32 %111, %109
  %113 = udiv i32 %112, 1
  %114 = urem i32 %113, 16
  %115 = udiv i32 %112, 16
  %116 = urem i32 %115, 16
  %117 = udiv i32 %112, 256
  %118 = urem i32 %117, 8192
  %119 = udiv i32 %112, 2097152
  %120 = getelementptr inbounds float, ptr %arg1, i32 %112
  %121 = load float, ptr %120, align 4, !invariant.load !74
  br label %concatenate.3.merge8

concatenate.pivot.16.11:                          ; preds = %concatenate.3.merge2
  %122 = icmp ult i32 %18, 16
  br i1 %122, label %concatenate.pivot.0.12, label %concatenate.pivot.16.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.16.11
  br label %concat_index_from_operand_id09

concatenate.pivot.16.13:                          ; preds = %concatenate.pivot.16.11
  br label %concat_index_from_operand_id110

concatenate.3.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %123 = phi float [ %107, %concat_index_from_operand_id09 ], [ %121, %concat_index_from_operand_id110 ]
  %124 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %123, ptr %124, align 4
  br label %concatenate.pivot.16.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %125 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %126 = sub nsw i32 %25, %125
  %127 = udiv i32 %linear_index3, 32
  %128 = mul i32 %127, 16
  %129 = add i32 %128, %126
  %130 = udiv i32 %129, 1
  %131 = urem i32 %130, 16
  %132 = udiv i32 %129, 16
  %133 = urem i32 %132, 16
  %134 = udiv i32 %129, 256
  %135 = urem i32 %134, 8192
  %136 = udiv i32 %129, 2097152
  %137 = getelementptr inbounds float, ptr %arg0, i32 %129
  %138 = load float, ptr %137, align 4, !invariant.load !74
  br label %concatenate.3.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.16.19
  %139 = phi i32 [ 16, %concatenate.pivot.16.19 ]
  %140 = sub nsw i32 %25, %139
  %141 = udiv i32 %linear_index3, 32
  %142 = mul i32 %141, 16
  %143 = add i32 %142, %140
  %144 = udiv i32 %143, 1
  %145 = urem i32 %144, 16
  %146 = udiv i32 %143, 16
  %147 = urem i32 %146, 16
  %148 = udiv i32 %143, 256
  %149 = urem i32 %148, 8192
  %150 = udiv i32 %143, 2097152
  %151 = getelementptr inbounds float, ptr %arg1, i32 %143
  %152 = load float, ptr %151, align 4, !invariant.load !74
  br label %concatenate.3.merge14

concatenate.pivot.16.17:                          ; preds = %concatenate.3.merge8
  %153 = icmp ult i32 %25, 16
  br i1 %153, label %concatenate.pivot.0.18, label %concatenate.pivot.16.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.16.17
  br label %concat_index_from_operand_id015

concatenate.pivot.16.19:                          ; preds = %concatenate.pivot.16.17
  br label %concat_index_from_operand_id116

concatenate.3.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %154 = phi float [ %138, %concat_index_from_operand_id015 ], [ %152, %concat_index_from_operand_id116 ]
  %155 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %154, ptr %155, align 4
  br label %concatenate_7.in_bounds-after
}

define void @fusion_36(ptr noalias align 16 dereferenceable(64) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(1048576) %arg2) {
entry:
  %return_buffer30 = alloca float, align 4
  %result_from_other_lane28 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %result_from_other_lane22 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !73
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_15_constant_9 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_15_constant_9, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !86
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %5 = urem i32 %3, 16
  %6 = udiv i32 %3, 16
  %7 = mul i32 %4, 6
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 262144
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 16
  %thread_id.y = udiv i32 %5, 16
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 262144
  %15 = udiv i32 %8, 262144
  %16 = icmp eq i32 %14, 262143
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 16, i32 256
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 256
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
  %20 = icmp eq i32 256, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !88

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result20 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 8, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer21)
  %22 = load float, ptr %return_buffer21, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result23 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 4, i32 31)
  store float %23, ptr %result_from_other_lane22, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane22, ptr %return_buffer24)
  %24 = load float, ptr %return_buffer24, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result26 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 2, i32 31)
  store float %25, ptr %result_from_other_lane25, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane25, ptr %return_buffer27)
  %26 = load float, ptr %return_buffer27, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result29 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result29, i32 1, i32 31)
  store float %27, ptr %result_from_other_lane28, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane28, ptr %return_buffer30)
  %28 = load float, ptr %return_buffer30, align 4
  store float %28, ptr %current_output, align 4
  %29 = udiv i32 %thread_id.x, 32
  %30 = and i32 %thread_id.x, 15
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %32 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %33 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %33, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %34 = icmp eq i32 %tile_loop.indvar, 0
  %35 = mul i32 %tile_loop.indvar, 16
  %36 = add i32 %35, 0
  %x_loc = add i32 %36, %32
  %37 = add i32 %tile_origin.1, %y_in_tile.indvar
  %38 = add i32 %tile_origin.2, %x_loc
  %39 = mul nuw nsw i32 %38, 1
  %40 = add nuw nsw i32 0, %39
  %41 = mul nuw nsw i32 %37, 16
  %42 = add nuw nsw i32 %40, %41
  %43 = mul nuw nsw i32 %tile_origin.0, 4194304
  %44 = add nuw nsw i32 %42, %43
  %45 = udiv i32 %44, 1
  %46 = urem i32 %45, 16
  %47 = udiv i32 %44, 16
  %48 = urem i32 %47, 16
  %49 = udiv i32 %44, 256
  %50 = urem i32 %49, 8192
  %51 = udiv i32 %44, 2097152
  %52 = mul nuw nsw i32 %46, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 16
  %55 = mul nuw nsw i32 %48, 1
  %56 = add nuw nsw i32 0, %55
  %57 = mul nuw nsw i32 %50, 16
  %58 = add nuw nsw i32 %56, %57
  %59 = mul nuw nsw i32 %51, 131072
  %60 = add nuw nsw i32 %58, %59
  %61 = udiv i32 %60, 262144
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %44
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !74
  %Arg_0.1 = getelementptr inbounds [16 x float], ptr %arg0, i32 0, i32 %46
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  %add.5 = fadd float %Arg_1.23, %Arg_0.14
  %region_0_15_constant_6 = load float, ptr @1, align 4
  %62 = fcmp oge float %add.5, %region_0_15_constant_6
  %63 = fcmp une float %add.5, %add.5
  %64 = or i1 %62, %63
  %maximum.8 = select i1 %64, float %add.5, float %region_0_15_constant_6
  store float %maximum.8, ptr %reduction_input_address, align 4
  %65 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10(ptr %65, ptr %reduction_input_address, ptr %return_buffer)
  %66 = load float, ptr %return_buffer, align 4
  store float %66, ptr %65, align 4
  br label %tile_loop.loop_header, !llvm.loop !90

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %67 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %68 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %68, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %69 = icmp eq i32 %tile_loop.indvar9, 0
  %70 = mul i32 %tile_loop.indvar9, 16
  %71 = add i32 %70, 0
  %x_loc11 = add i32 %71, %67
  %72 = add i32 %tile_origin.1, %y_in_tile.indvar
  %73 = add i32 %tile_origin.2, %x_loc11
  %74 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %74, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !92

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %75 = mul nuw nsw i32 %73, 1
  %76 = add nuw nsw i32 0, %75
  %77 = mul nuw nsw i32 %72, 16
  %78 = add nuw nsw i32 %76, %77
  %79 = mul nuw nsw i32 %tile_origin.0, 4194304
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 1
  %82 = urem i32 %81, 16
  %83 = udiv i32 %80, 16
  %84 = urem i32 %83, 16
  %85 = udiv i32 %80, 256
  %86 = urem i32 %85, 8192
  %87 = udiv i32 %80, 2097152
  %88 = mul nuw nsw i32 %82, 1
  %89 = add nuw nsw i32 0, %88
  %90 = udiv i32 %89, 16
  %91 = mul nuw nsw i32 %84, 1
  %92 = add nuw nsw i32 0, %91
  %93 = mul nuw nsw i32 %86, 16
  %94 = add nuw nsw i32 %92, %93
  %95 = mul nuw nsw i32 %87, 131072
  %96 = add nuw nsw i32 %94, %95
  %97 = udiv i32 %96, 262144
  %Arg_1.212 = getelementptr inbounds float, ptr %arg1, i32 %80
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !74
  %Arg_0.114 = getelementptr inbounds [16 x float], ptr %arg0, i32 0, i32 %82
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !74
  %add.516 = fadd float %Arg_1.213, %Arg_0.115
  %region_0_15_constant_617 = load float, ptr @1, align 4
  %98 = fcmp oge float %add.516, %region_0_15_constant_617
  %99 = fcmp une float %add.516, %add.516
  %100 = or i1 %98, %99
  %maximum.818 = select i1 %100, float %add.516, float %region_0_15_constant_617
  store float %maximum.818, ptr %reduction_input_address, align 4
  %101 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10(ptr %101, ptr %reduction_input_address, ptr %return_buffer19)
  %102 = load float, ptr %return_buffer19, align 4
  store float %102, ptr %101, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %103 = mul i32 %thread_id.x, 1
  %104 = add i32 %tile_origin.1, %thread_id.y
  %105 = add i32 %tile_origin.2, %103
  %106 = add i32 %105, 0
  %107 = udiv i32 %104, 1
  %108 = urem i32 %107, 16
  %109 = udiv i32 %104, 16
  %110 = urem i32 %109, 8192
  %111 = udiv i32 %104, 131072
  %output_element_address = getelementptr inbounds [2 x [8192 x [16 x float]]], ptr %arg2, i32 0, i32 %111, i32 %110, i32 %108
  %output = load float, ptr %current_output, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_10(ptr dereferenceable(4) %Arg_0.11.typed, ptr dereferenceable(4) %Arg_1.12.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %maximum.13.typed = alloca float, align 4
  %Arg_0.11 = load float, ptr %Arg_0.11.typed, align 4
  %Arg_1.12 = load float, ptr %Arg_1.12.typed, align 4
  %0 = fcmp oge float %Arg_0.11, %Arg_1.12
  %1 = fcmp une float %Arg_0.11, %Arg_0.11
  %2 = or i1 %0, %1
  %maximum.13 = select i1 %2, float %Arg_0.11, float %Arg_1.12
  store float %maximum.13, ptr %maximum.13.typed, align 4
  %load_ret_value = load float, ptr %maximum.13.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

define void @fusion_37(ptr noalias align 128 dereferenceable(1048576) %arg0, ptr noalias align 16 dereferenceable(64) %arg1, ptr noalias align 128 dereferenceable(16777216) %arg2, ptr noalias align 128 dereferenceable(1048576) %arg3) {
entry:
  %return_buffer34 = alloca float, align 4
  %result_from_other_lane32 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane26 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %tile_loop.invar_address9 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !73
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_19_constant_13 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_19_constant_13, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !86
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %5 = urem i32 %3, 16
  %6 = udiv i32 %3, 16
  %7 = mul i32 %4, 6
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 262144
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 16
  %thread_id.y = udiv i32 %5, 16
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 262144
  %15 = udiv i32 %8, 262144
  %16 = icmp eq i32 %14, 262143
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 16, i32 256
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 256
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
  %20 = icmp eq i32 256, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit6, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !93

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 8, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer25)
  %22 = load float, ptr %return_buffer25, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 4, i32 31)
  store float %23, ptr %result_from_other_lane26, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %24 = load float, ptr %return_buffer28, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 2, i32 31)
  store float %25, ptr %result_from_other_lane29, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
  %26 = load float, ptr %return_buffer31, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result33 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result33, i32 1, i32 31)
  store float %27, ptr %result_from_other_lane32, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane32, ptr %return_buffer34)
  %28 = load float, ptr %return_buffer34, align 4
  store float %28, ptr %current_output, align 4
  %29 = udiv i32 %thread_id.x, 32
  %30 = and i32 %thread_id.x, 15
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %32 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %33 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %33, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %34 = icmp eq i32 %tile_loop.indvar, 0
  %35 = mul i32 %tile_loop.indvar, 16
  %36 = add i32 %35, 0
  %x_loc = add i32 %36, %32
  %37 = add i32 %tile_origin.1, %y_in_tile.indvar
  %38 = add i32 %tile_origin.2, %x_loc
  %39 = mul nuw nsw i32 %38, 1
  %40 = add nuw nsw i32 0, %39
  %41 = mul nuw nsw i32 %37, 16
  %42 = add nuw nsw i32 %40, %41
  %43 = mul nuw nsw i32 %tile_origin.0, 4194304
  %44 = add nuw nsw i32 %42, %43
  %45 = udiv i32 %44, 1
  %46 = urem i32 %45, 16
  %47 = udiv i32 %44, 16
  %48 = urem i32 %47, 16
  %49 = udiv i32 %44, 256
  %50 = urem i32 %49, 8192
  %51 = udiv i32 %44, 2097152
  %52 = mul nuw nsw i32 %46, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 16
  %55 = mul nuw nsw i32 %48, 1
  %56 = add nuw nsw i32 0, %55
  %57 = mul nuw nsw i32 %50, 16
  %58 = add nuw nsw i32 %56, %57
  %59 = mul nuw nsw i32 %51, 131072
  %60 = add nuw nsw i32 %58, %59
  %61 = udiv i32 %60, 262144
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %44
  %Arg_2.33 = load float, ptr %Arg_2.3, align 4, !invariant.load !74
  %Arg_1.2 = getelementptr inbounds [16 x float], ptr %arg1, i32 0, i32 %46
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !74
  %add.6 = fadd float %Arg_2.33, %Arg_1.24
  %region_0_19_constant_7 = load float, ptr @3, align 4
  %62 = fcmp oge float %add.6, %region_0_19_constant_7
  %63 = fcmp une float %add.6, %add.6
  %64 = or i1 %62, %63
  %maximum.9 = select i1 %64, float %add.6, float %region_0_19_constant_7
  %65 = udiv i32 %44, 16
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %65
  %Arg_0.15 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  %subtract.11 = fsub float %maximum.9, %Arg_0.15
  %66 = call float @__nv_expf(float %subtract.11)
  store float %66, ptr %reduction_input_address, align 4
  %67 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_14(ptr %67, ptr %reduction_input_address, ptr %return_buffer)
  %68 = load float, ptr %return_buffer, align 4
  store float %68, ptr %67, align 4
  br label %tile_loop.loop_header, !llvm.loop !94

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %69 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address9, align 4
  br label %tile_loop.loop_header7

tile_loop.loop_header7:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar10 = load i32, ptr %tile_loop.invar_address9, align 4
  %70 = icmp uge i32 %tile_loop.indvar10, 16
  br i1 %70, label %tile_loop.loop_exit6, label %tile_loop.loop_body8

tile_loop.loop_body8:                             ; preds = %tile_loop.loop_header7
  %invar.inc11 = add nuw nsw i32 %tile_loop.indvar10, 1
  store i32 %invar.inc11, ptr %tile_loop.invar_address9, align 4
  %71 = icmp eq i32 %tile_loop.indvar10, 0
  %72 = mul i32 %tile_loop.indvar10, 16
  %73 = add i32 %72, 0
  %x_loc12 = add i32 %73, %69
  %74 = add i32 %tile_origin.1, %y_in_tile.indvar
  %75 = add i32 %tile_origin.2, %x_loc12
  %76 = icmp ult i32 %x_loc12, %tile_bound1
  br i1 %76, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body8
  br label %tile_loop.loop_header7, !llvm.loop !95

tile_loop.loop_exit6:                             ; preds = %tile_loop.loop_header7
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body8
  %77 = mul nuw nsw i32 %75, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %74, 16
  %80 = add nuw nsw i32 %78, %79
  %81 = mul nuw nsw i32 %tile_origin.0, 4194304
  %82 = add nuw nsw i32 %80, %81
  %83 = udiv i32 %82, 1
  %84 = urem i32 %83, 16
  %85 = udiv i32 %82, 16
  %86 = urem i32 %85, 16
  %87 = udiv i32 %82, 256
  %88 = urem i32 %87, 8192
  %89 = udiv i32 %82, 2097152
  %90 = mul nuw nsw i32 %84, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 16
  %93 = mul nuw nsw i32 %86, 1
  %94 = add nuw nsw i32 0, %93
  %95 = mul nuw nsw i32 %88, 16
  %96 = add nuw nsw i32 %94, %95
  %97 = mul nuw nsw i32 %89, 131072
  %98 = add nuw nsw i32 %96, %97
  %99 = udiv i32 %98, 262144
  %Arg_2.313 = getelementptr inbounds float, ptr %arg2, i32 %82
  %Arg_2.314 = load float, ptr %Arg_2.313, align 4, !invariant.load !74
  %Arg_1.215 = getelementptr inbounds [16 x float], ptr %arg1, i32 0, i32 %84
  %Arg_1.216 = load float, ptr %Arg_1.215, align 4, !invariant.load !74
  %add.617 = fadd float %Arg_2.314, %Arg_1.216
  %region_0_19_constant_718 = load float, ptr @3, align 4
  %100 = fcmp oge float %add.617, %region_0_19_constant_718
  %101 = fcmp une float %add.617, %add.617
  %102 = or i1 %100, %101
  %maximum.919 = select i1 %102, float %add.617, float %region_0_19_constant_718
  %103 = udiv i32 %82, 16
  %Arg_0.120 = getelementptr inbounds float, ptr %arg0, i32 %103
  %Arg_0.121 = load float, ptr %Arg_0.120, align 4, !invariant.load !74
  %subtract.1122 = fsub float %maximum.919, %Arg_0.121
  %104 = call float @__nv_expf(float %subtract.1122)
  store float %104, ptr %reduction_input_address, align 4
  %105 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_14(ptr %105, ptr %reduction_input_address, ptr %return_buffer23)
  %106 = load float, ptr %return_buffer23, align 4
  store float %106, ptr %105, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %107 = mul i32 %thread_id.x, 1
  %108 = add i32 %tile_origin.1, %thread_id.y
  %109 = add i32 %tile_origin.2, %107
  %110 = add i32 %109, 0
  %111 = udiv i32 %108, 1
  %112 = urem i32 %111, 16
  %113 = udiv i32 %108, 16
  %114 = urem i32 %113, 8192
  %115 = udiv i32 %108, 131072
  %output_element_address = getelementptr inbounds [2 x [8192 x [16 x float]]], ptr %arg3, i32 0, i32 %115, i32 %114, i32 %112
  %output = load float, ptr %current_output, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_expf(float) #3

define internal void @region_1_14(ptr dereferenceable(4) %Arg_0.15.typed, ptr dereferenceable(4) %Arg_1.16.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.17.typed = alloca float, align 4
  %Arg_0.15 = load float, ptr %Arg_0.15.typed, align 4
  %Arg_1.16 = load float, ptr %Arg_1.16.typed, align 4
  %add.17 = fadd float %Arg_0.15, %Arg_1.16
  store float %add.17, ptr %add.17.typed, align 4
  %load_ret_value = load float, ptr %add.17.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_35(ptr noalias align 16 dereferenceable(64) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(1048576) %arg2, ptr noalias align 128 dereferenceable(1048576) %arg3, ptr noalias align 128 dereferenceable(16777216) %arg4, ptr noalias align 128 dereferenceable(16777216) %arg5) {
entry:
  %tile_loop.invar_address23 = alloca i32, align 4
  %y_in_tile.invar_address17 = alloca i32, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !96
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %2 = urem i32 %0, 128
  %3 = udiv i32 %0, 128
  %4 = mul i32 %1, 1
  %5 = add i32 %4, %3
  %6 = icmp ult i32 %5, 8192
  br i1 %6, label %7, label %early_return

7:                                                ; preds = %entry
  %thread_id.x = urem i32 %2, 32
  %thread_id.y = udiv i32 %2, 32
  %lane_id = urem i32 %2, 32
  %8 = udiv i32 %5, 1
  %9 = urem i32 %8, 1
  %10 = udiv i32 %5, 1
  %11 = urem i32 %10, 4096
  %12 = udiv i32 %5, 4096
  %13 = icmp eq i32 %11, 4095
  %tile_bound = select i1 %13, i32 32, i32 32
  %14 = icmp eq i32 %9, 0
  %tile_bound1 = select i1 %14, i32 16, i32 32
  %tile_origin.0 = mul i32 %12, 1
  %tile_origin.1 = mul i32 %11, 32
  %tile_origin.2 = mul i32 %9, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %7
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %15 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %15, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 4
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %16 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %17 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %18 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %18, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %19 = icmp eq i32 %tile_loop.indvar, 0
  %20 = mul i32 %tile_loop.indvar, 1
  %21 = add i32 %20, 0
  %x_loc = add i32 %21, %17
  %22 = add i32 %tile_origin.1, %y_in_tile.indvar
  %23 = add i32 %tile_origin.2, %x_loc
  %24 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %24, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !97

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !98

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  call void @llvm.nvvm.barrier0()
  store i32 %thread_id.y, ptr %y_in_tile.invar_address17, align 4
  br label %y_in_tile.loop_header15

y_in_tile.loop_header15:                          ; preds = %tile_loop.loop_exit20, %y_in_tile.loop_exit
  %y_in_tile.indvar18 = load i32, ptr %y_in_tile.invar_address17, align 4
  %25 = icmp uge i32 %y_in_tile.indvar18, %tile_bound1
  br i1 %25, label %y_in_tile.loop_exit14, label %y_in_tile.loop_body16

y_in_tile.loop_body16:                            ; preds = %y_in_tile.loop_header15
  %invar.inc19 = add nuw nsw i32 %y_in_tile.indvar18, 4
  store i32 %invar.inc19, ptr %y_in_tile.invar_address17, align 4
  %26 = icmp eq i32 %y_in_tile.indvar18, %thread_id.y
  %27 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address23, align 4
  br label %tile_loop.loop_header21

tile_loop.loop_header21:                          ; preds = %x_in_tile-after28, %y_in_tile.loop_body16
  %tile_loop.indvar24 = load i32, ptr %tile_loop.invar_address23, align 4
  %28 = icmp uge i32 %tile_loop.indvar24, 1
  br i1 %28, label %tile_loop.loop_exit20, label %tile_loop.loop_body22

tile_loop.loop_body22:                            ; preds = %tile_loop.loop_header21
  %invar.inc25 = add nuw nsw i32 %tile_loop.indvar24, 1
  store i32 %invar.inc25, ptr %tile_loop.invar_address23, align 4
  %29 = icmp eq i32 %tile_loop.indvar24, 0
  %30 = mul i32 %tile_loop.indvar24, 1
  %31 = add i32 %30, 0
  %x_loc26 = add i32 %31, %27
  %32 = add i32 %tile_origin.2, %y_in_tile.indvar18
  %33 = add i32 %tile_origin.1, %x_loc26
  %34 = icmp ult i32 %x_loc26, %tile_bound
  br i1 %34, label %x_in_tile-true27, label %x_in_tile-after28

x_in_tile-after28:                                ; preds = %x_in_tile-true27, %tile_loop.loop_body22
  br label %tile_loop.loop_header21, !llvm.loop !99

tile_loop.loop_exit20:                            ; preds = %tile_loop.loop_header21
  br label %y_in_tile.loop_header15, !llvm.loop !100

y_in_tile.loop_exit14:                            ; preds = %y_in_tile.loop_header15
  ret void

early_return:                                     ; preds = %entry
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %35 = mul nuw nsw i32 %23, 1
  %36 = add nuw nsw i32 0, %35
  %37 = mul nuw nsw i32 %22, 16
  %38 = add nuw nsw i32 %36, %37
  %39 = mul nuw nsw i32 %tile_origin.0, 2097152
  %40 = add nuw nsw i32 %38, %39
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 16
  %43 = udiv i32 %40, 16
  %44 = urem i32 %43, 16
  %45 = udiv i32 %40, 256
  %46 = urem i32 %45, 8192
  %47 = udiv i32 %40, 2097152
  %48 = mul nuw nsw i32 %42, 1
  %49 = add nuw nsw i32 0, %48
  %50 = udiv i32 %49, 16
  %51 = mul nuw nsw i32 %44, 1
  %52 = add nuw nsw i32 0, %51
  %53 = mul nuw nsw i32 %46, 16
  %54 = add nuw nsw i32 %52, %53
  %55 = mul nuw nsw i32 %47, 131072
  %56 = add nuw nsw i32 %54, %55
  %57 = udiv i32 %56, 262144
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %40
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !74
  %Arg_0.1 = getelementptr inbounds [16 x float], ptr %arg0, i32 0, i32 %42
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  %add.7 = fadd float %Arg_1.23, %Arg_0.14
  %region_0_18_constant_8 = load float, ptr @4, align 4
  %58 = fcmp oge float %add.7, %region_0_18_constant_8
  %59 = fcmp une float %add.7, %add.7
  %60 = or i1 %58, %59
  %maximum.10 = select i1 %60, float %add.7, float %region_0_18_constant_8
  %61 = getelementptr inbounds [1 x [32 x [33 x float]]], ptr addrspace(3) @tr_tile_0, i32 0, i32 %3, i32 %y_in_tile.indvar, i32 %x_loc
  %62 = addrspacecast ptr addrspace(3) %61 to ptr
  store float %maximum.10, ptr %62, align 4
  %63 = mul nuw nsw i32 %23, 1
  %64 = add nuw nsw i32 0, %63
  %65 = mul nuw nsw i32 %22, 16
  %66 = add nuw nsw i32 %64, %65
  %67 = mul nuw nsw i32 %tile_origin.0, 2097152
  %68 = add nuw nsw i32 %66, %67
  %69 = udiv i32 %68, 1
  %70 = urem i32 %69, 16
  %71 = udiv i32 %68, 16
  %72 = urem i32 %71, 16
  %73 = udiv i32 %68, 256
  %74 = urem i32 %73, 8192
  %75 = udiv i32 %68, 2097152
  %76 = mul nuw nsw i32 %70, 1
  %77 = add nuw nsw i32 0, %76
  %78 = udiv i32 %77, 16
  %79 = mul nuw nsw i32 %72, 1
  %80 = add nuw nsw i32 0, %79
  %81 = mul nuw nsw i32 %74, 16
  %82 = add nuw nsw i32 %80, %81
  %83 = mul nuw nsw i32 %75, 131072
  %84 = add nuw nsw i32 %82, %83
  %85 = udiv i32 %84, 262144
  %Arg_1.25 = getelementptr inbounds float, ptr %arg1, i32 %68
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !74
  %Arg_0.17 = getelementptr inbounds [16 x float], ptr %arg0, i32 0, i32 %70
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !74
  %add.79 = fadd float %Arg_1.26, %Arg_0.18
  %region_0_18_constant_810 = load float, ptr @4, align 4
  %86 = fcmp oge float %add.79, %region_0_18_constant_810
  %87 = fcmp une float %add.79, %add.79
  %88 = or i1 %86, %87
  %maximum.1011 = select i1 %88, float %add.79, float %region_0_18_constant_810
  %89 = udiv i32 %68, 16
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %89
  %Arg_3.412 = load float, ptr %Arg_3.4, align 4, !invariant.load !74
  %subtract.13 = fsub float %maximum.1011, %Arg_3.412
  %90 = call float @__nv_expf(float %subtract.13)
  %91 = udiv i32 %68, 16
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %91
  %Arg_2.313 = load float, ptr %Arg_2.3, align 4, !invariant.load !74
  %divide.16 = fdiv float %90, %Arg_2.313
  %92 = getelementptr inbounds float, ptr %arg5, i32 %68
  store float %divide.16, ptr %92, align 4
  br label %x_in_tile-after

x_in_tile-true27:                                 ; preds = %tile_loop.loop_body22
  %93 = mul nuw nsw i32 %33, 1
  %94 = add nuw nsw i32 0, %93
  %95 = mul nuw nsw i32 %32, 131072
  %96 = add nuw nsw i32 %94, %95
  %97 = mul nuw nsw i32 %tile_origin.0, 2097152
  %98 = add nuw nsw i32 %96, %97
  %99 = udiv i32 %98, 1
  %100 = urem i32 %99, 16
  %101 = udiv i32 %98, 16
  %102 = urem i32 %101, 8192
  %103 = udiv i32 %98, 131072
  %104 = urem i32 %103, 16
  %105 = udiv i32 %98, 2097152
  %106 = getelementptr inbounds [1 x [32 x [33 x float]]], ptr addrspace(3) @tr_tile_0, i32 0, i32 %3, i32 %x_loc26, i32 %y_in_tile.indvar18
  %107 = addrspacecast ptr addrspace(3) %106 to ptr
  %tiled_buffer = load float, ptr %107, align 4
  %108 = getelementptr inbounds float, ptr %arg4, i32 %98
  store float %tiled_buffer, ptr %108, align 4
  br label %x_in_tile-after28
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

define void @fusion_29(ptr noalias align 128 dereferenceable(419430400) %arg0, ptr noalias align 128 dereferenceable(131072000) %arg1, ptr noalias align 128 dereferenceable(88080384) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !101
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 5505024
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 168
  %5 = udiv i32 %linear_index_base, 168
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 168
  %8 = udiv i32 %linear_index1, 168
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 168
  %11 = udiv i32 %linear_index2, 168
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 168
  %14 = udiv i32 %linear_index3, 168
  %15 = icmp ult i32 %linear_index_base, 22020096
  br i1 %15, label %fusion_29.in_bounds-true, label %fusion_29.in_bounds-after

fusion_29.in_bounds-after:                        ; preds = %concatenate.5.merge14, %entry
  ret void

fusion_29.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 168
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 16
  %22 = udiv i32 %20, 16
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 168
  %27 = mul i32 %26, 128
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 128
  %31 = udiv i32 %28, 128
  %32 = urem i32 %31, 16
  %33 = udiv i32 %28, 2048
  %34 = add i32 %22, 0
  %35 = add i32 %21, 0
  %36 = add i32 %25, 0
  %37 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg0, i32 0, i32 %34, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !74
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.128.1
  %39 = phi i32 [ 128, %concatenate.pivot.128.1 ]
  %40 = sub nsw i32 %17, %39
  %41 = udiv i32 %linear_index_base, 168
  %42 = mul i32 %41, 40
  %43 = add i32 %42, %40
  %44 = udiv i32 %43, 1
  %45 = urem i32 %44, 40
  %46 = udiv i32 %43, 40
  %47 = urem i32 %46, 16
  %48 = udiv i32 %43, 640
  %49 = add i32 %22, 0
  %50 = add i32 %21, 0
  %51 = add i32 %40, 0
  %52 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg1, i32 0, i32 %49, i32 %50, i32 %51
  %53 = load float, ptr %52, align 4, !invariant.load !74
  br label %concatenate.5.merge

concatenate.pivot.128.:                           ; preds = %fusion_29.in_bounds-true
  %54 = icmp ult i32 %17, 128
  br i1 %54, label %concatenate.pivot.0., label %concatenate.pivot.128.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.128.
  br label %concat_index_from_operand_id0

concatenate.pivot.128.1:                          ; preds = %concatenate.pivot.128.
  br label %concat_index_from_operand_id1

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %55 = phi float [ %38, %concat_index_from_operand_id0 ], [ %53, %concat_index_from_operand_id1 ]
  %56 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %55, ptr %56, align 4
  %57 = mul nuw nsw i32 %7, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 168
  %60 = mul nuw nsw i32 %8, 1
  %61 = add nuw nsw i32 0, %60
  %62 = urem i32 %61, 16
  %63 = udiv i32 %61, 16
  %64 = udiv i32 %63, 8192
  br label %concatenate.pivot.128.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %65 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %66 = sub nsw i32 %58, %65
  %67 = udiv i32 %linear_index1, 168
  %68 = mul i32 %67, 128
  %69 = add i32 %68, %66
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 128
  %72 = udiv i32 %69, 128
  %73 = urem i32 %72, 16
  %74 = udiv i32 %69, 2048
  %75 = add i32 %63, 0
  %76 = add i32 %62, 0
  %77 = add i32 %66, 0
  %78 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg0, i32 0, i32 %75, i32 %76, i32 %77
  %79 = load float, ptr %78, align 4, !invariant.load !74
  br label %concatenate.5.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.128.7
  %80 = phi i32 [ 128, %concatenate.pivot.128.7 ]
  %81 = sub nsw i32 %58, %80
  %82 = udiv i32 %linear_index1, 168
  %83 = mul i32 %82, 40
  %84 = add i32 %83, %81
  %85 = udiv i32 %84, 1
  %86 = urem i32 %85, 40
  %87 = udiv i32 %84, 40
  %88 = urem i32 %87, 16
  %89 = udiv i32 %84, 640
  %90 = add i32 %63, 0
  %91 = add i32 %62, 0
  %92 = add i32 %81, 0
  %93 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg1, i32 0, i32 %90, i32 %91, i32 %92
  %94 = load float, ptr %93, align 4, !invariant.load !74
  br label %concatenate.5.merge2

concatenate.pivot.128.5:                          ; preds = %concatenate.5.merge
  %95 = icmp ult i32 %58, 128
  br i1 %95, label %concatenate.pivot.0.6, label %concatenate.pivot.128.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.128.5
  br label %concat_index_from_operand_id03

concatenate.pivot.128.7:                          ; preds = %concatenate.pivot.128.5
  br label %concat_index_from_operand_id14

concatenate.5.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %96 = phi float [ %79, %concat_index_from_operand_id03 ], [ %94, %concat_index_from_operand_id14 ]
  %97 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %96, ptr %97, align 4
  %98 = mul nuw nsw i32 %10, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 168
  %101 = mul nuw nsw i32 %11, 1
  %102 = add nuw nsw i32 0, %101
  %103 = urem i32 %102, 16
  %104 = udiv i32 %102, 16
  %105 = udiv i32 %104, 8192
  br label %concatenate.pivot.128.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %106 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %107 = sub nsw i32 %99, %106
  %108 = udiv i32 %linear_index2, 168
  %109 = mul i32 %108, 128
  %110 = add i32 %109, %107
  %111 = udiv i32 %110, 1
  %112 = urem i32 %111, 128
  %113 = udiv i32 %110, 128
  %114 = urem i32 %113, 16
  %115 = udiv i32 %110, 2048
  %116 = add i32 %104, 0
  %117 = add i32 %103, 0
  %118 = add i32 %107, 0
  %119 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg0, i32 0, i32 %116, i32 %117, i32 %118
  %120 = load float, ptr %119, align 4, !invariant.load !74
  br label %concatenate.5.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.128.13
  %121 = phi i32 [ 128, %concatenate.pivot.128.13 ]
  %122 = sub nsw i32 %99, %121
  %123 = udiv i32 %linear_index2, 168
  %124 = mul i32 %123, 40
  %125 = add i32 %124, %122
  %126 = udiv i32 %125, 1
  %127 = urem i32 %126, 40
  %128 = udiv i32 %125, 40
  %129 = urem i32 %128, 16
  %130 = udiv i32 %125, 640
  %131 = add i32 %104, 0
  %132 = add i32 %103, 0
  %133 = add i32 %122, 0
  %134 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg1, i32 0, i32 %131, i32 %132, i32 %133
  %135 = load float, ptr %134, align 4, !invariant.load !74
  br label %concatenate.5.merge8

concatenate.pivot.128.11:                         ; preds = %concatenate.5.merge2
  %136 = icmp ult i32 %99, 128
  br i1 %136, label %concatenate.pivot.0.12, label %concatenate.pivot.128.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.128.11
  br label %concat_index_from_operand_id09

concatenate.pivot.128.13:                         ; preds = %concatenate.pivot.128.11
  br label %concat_index_from_operand_id110

concatenate.5.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %137 = phi float [ %120, %concat_index_from_operand_id09 ], [ %135, %concat_index_from_operand_id110 ]
  %138 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %137, ptr %138, align 4
  %139 = mul nuw nsw i32 %13, 1
  %140 = add nuw nsw i32 0, %139
  %141 = udiv i32 %140, 168
  %142 = mul nuw nsw i32 %14, 1
  %143 = add nuw nsw i32 0, %142
  %144 = urem i32 %143, 16
  %145 = udiv i32 %143, 16
  %146 = udiv i32 %145, 8192
  br label %concatenate.pivot.128.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %147 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %148 = sub nsw i32 %140, %147
  %149 = udiv i32 %linear_index3, 168
  %150 = mul i32 %149, 128
  %151 = add i32 %150, %148
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 128
  %154 = udiv i32 %151, 128
  %155 = urem i32 %154, 16
  %156 = udiv i32 %151, 2048
  %157 = add i32 %145, 0
  %158 = add i32 %144, 0
  %159 = add i32 %148, 0
  %160 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg0, i32 0, i32 %157, i32 %158, i32 %159
  %161 = load float, ptr %160, align 4, !invariant.load !74
  br label %concatenate.5.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.128.19
  %162 = phi i32 [ 128, %concatenate.pivot.128.19 ]
  %163 = sub nsw i32 %140, %162
  %164 = udiv i32 %linear_index3, 168
  %165 = mul i32 %164, 40
  %166 = add i32 %165, %163
  %167 = udiv i32 %166, 1
  %168 = urem i32 %167, 40
  %169 = udiv i32 %166, 40
  %170 = urem i32 %169, 16
  %171 = udiv i32 %166, 640
  %172 = add i32 %145, 0
  %173 = add i32 %144, 0
  %174 = add i32 %163, 0
  %175 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg1, i32 0, i32 %172, i32 %173, i32 %174
  %176 = load float, ptr %175, align 4, !invariant.load !74
  br label %concatenate.5.merge14

concatenate.pivot.128.17:                         ; preds = %concatenate.5.merge8
  %177 = icmp ult i32 %140, 128
  br i1 %177, label %concatenate.pivot.0.18, label %concatenate.pivot.128.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.128.17
  br label %concat_index_from_operand_id015

concatenate.pivot.128.19:                         ; preds = %concatenate.pivot.128.17
  br label %concat_index_from_operand_id116

concatenate.5.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %178 = phi float [ %161, %concat_index_from_operand_id015 ], [ %176, %concat_index_from_operand_id116 ]
  %179 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %178, ptr %179, align 4
  br label %fusion_29.in_bounds-after
}

define void @fusion_20(ptr noalias align 128 dereferenceable(67108864) %arg0, ptr noalias align 128 dereferenceable(67108864) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4194304
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 16
  %7 = udiv i32 %linear_index_base, 1024
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 8388608
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 64
  %12 = udiv i32 %linear_index1, 64
  %13 = urem i32 %12, 16
  %14 = udiv i32 %linear_index1, 1024
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 8388608
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 64
  %19 = udiv i32 %linear_index2, 64
  %20 = urem i32 %19, 16
  %21 = udiv i32 %linear_index2, 1024
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 8388608
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 64
  %26 = udiv i32 %linear_index3, 64
  %27 = urem i32 %26, 16
  %28 = udiv i32 %linear_index3, 1024
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 8388608
  %31 = icmp ult i32 %linear_index_base, 16777216
  br i1 %31, label %fusion_20.in_bounds-true, label %fusion_20.in_bounds-after

fusion_20.in_bounds-after:                        ; preds = %concatenate.7.merge14, %entry
  ret void

fusion_20.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.1.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %32 = phi i32 [ 0, %concatenate.pivot.0. ]
  %33 = sub nsw i32 %9, %32
  %34 = add i32 %8, 0
  %35 = add i32 %6, 0
  %36 = add i32 %4, 0
  %37 = mul nuw nsw i32 %36, 1
  %38 = add nuw nsw i32 0, %37
  %39 = udiv i32 %38, 128
  %40 = mul nuw nsw i32 %35, 1
  %41 = add nuw nsw i32 0, %40
  %42 = mul nuw nsw i32 %34, 16
  %43 = add nuw nsw i32 %41, %42
  %44 = udiv i32 %43, 131072
  %45 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %43, i32 %38
  %46 = load float, ptr %45, align 4, !invariant.load !74
  br label %concatenate.7.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.1.1
  %47 = phi i32 [ 1, %concatenate.pivot.1.1 ]
  %48 = sub nsw i32 %9, %47
  %49 = add i32 %8, 0
  %50 = add i32 %6, 0
  %51 = add i32 %4, 64
  %52 = mul nuw nsw i32 %51, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 128
  %55 = mul nuw nsw i32 %50, 1
  %56 = add nuw nsw i32 0, %55
  %57 = mul nuw nsw i32 %49, 16
  %58 = add nuw nsw i32 %56, %57
  %59 = udiv i32 %58, 131072
  %60 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %58, i32 %53
  %61 = load float, ptr %60, align 4, !invariant.load !74
  br label %concatenate.7.merge

concatenate.pivot.1.:                             ; preds = %fusion_20.in_bounds-true
  %62 = icmp ult i32 %9, 1
  br i1 %62, label %concatenate.pivot.0., label %concatenate.pivot.1.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id0

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  br label %concat_index_from_operand_id1

concatenate.7.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %63 = phi float [ %46, %concat_index_from_operand_id0 ], [ %61, %concat_index_from_operand_id1 ]
  %64 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %63, ptr %64, align 4
  br label %concatenate.pivot.1.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %65 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %66 = sub nsw i32 %16, %65
  %67 = add i32 %15, 0
  %68 = add i32 %13, 0
  %69 = add i32 %11, 0
  %70 = mul nuw nsw i32 %69, 1
  %71 = add nuw nsw i32 0, %70
  %72 = udiv i32 %71, 128
  %73 = mul nuw nsw i32 %68, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %67, 16
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 131072
  %78 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %76, i32 %71
  %79 = load float, ptr %78, align 4, !invariant.load !74
  br label %concatenate.7.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.1.7
  %80 = phi i32 [ 1, %concatenate.pivot.1.7 ]
  %81 = sub nsw i32 %16, %80
  %82 = add i32 %15, 0
  %83 = add i32 %13, 0
  %84 = add i32 %11, 64
  %85 = mul nuw nsw i32 %84, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 128
  %88 = mul nuw nsw i32 %83, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 16
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 131072
  %93 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %91, i32 %86
  %94 = load float, ptr %93, align 4, !invariant.load !74
  br label %concatenate.7.merge2

concatenate.pivot.1.5:                            ; preds = %concatenate.7.merge
  %95 = icmp ult i32 %16, 1
  br i1 %95, label %concatenate.pivot.0.6, label %concatenate.pivot.1.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.1.5
  br label %concat_index_from_operand_id03

concatenate.pivot.1.7:                            ; preds = %concatenate.pivot.1.5
  br label %concat_index_from_operand_id14

concatenate.7.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %96 = phi float [ %79, %concat_index_from_operand_id03 ], [ %94, %concat_index_from_operand_id14 ]
  %97 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %96, ptr %97, align 4
  br label %concatenate.pivot.1.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %98 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %99 = sub nsw i32 %23, %98
  %100 = add i32 %22, 0
  %101 = add i32 %20, 0
  %102 = add i32 %18, 0
  %103 = mul nuw nsw i32 %102, 1
  %104 = add nuw nsw i32 0, %103
  %105 = udiv i32 %104, 128
  %106 = mul nuw nsw i32 %101, 1
  %107 = add nuw nsw i32 0, %106
  %108 = mul nuw nsw i32 %100, 16
  %109 = add nuw nsw i32 %107, %108
  %110 = udiv i32 %109, 131072
  %111 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %109, i32 %104
  %112 = load float, ptr %111, align 4, !invariant.load !74
  br label %concatenate.7.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.1.13
  %113 = phi i32 [ 1, %concatenate.pivot.1.13 ]
  %114 = sub nsw i32 %23, %113
  %115 = add i32 %22, 0
  %116 = add i32 %20, 0
  %117 = add i32 %18, 64
  %118 = mul nuw nsw i32 %117, 1
  %119 = add nuw nsw i32 0, %118
  %120 = udiv i32 %119, 128
  %121 = mul nuw nsw i32 %116, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %115, 16
  %124 = add nuw nsw i32 %122, %123
  %125 = udiv i32 %124, 131072
  %126 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %124, i32 %119
  %127 = load float, ptr %126, align 4, !invariant.load !74
  br label %concatenate.7.merge8

concatenate.pivot.1.11:                           ; preds = %concatenate.7.merge2
  %128 = icmp ult i32 %23, 1
  br i1 %128, label %concatenate.pivot.0.12, label %concatenate.pivot.1.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.1.11
  br label %concat_index_from_operand_id09

concatenate.pivot.1.13:                           ; preds = %concatenate.pivot.1.11
  br label %concat_index_from_operand_id110

concatenate.7.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %129 = phi float [ %112, %concat_index_from_operand_id09 ], [ %127, %concat_index_from_operand_id110 ]
  %130 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %129, ptr %130, align 4
  br label %concatenate.pivot.1.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %131 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %132 = sub nsw i32 %30, %131
  %133 = add i32 %29, 0
  %134 = add i32 %27, 0
  %135 = add i32 %25, 0
  %136 = mul nuw nsw i32 %135, 1
  %137 = add nuw nsw i32 0, %136
  %138 = udiv i32 %137, 128
  %139 = mul nuw nsw i32 %134, 1
  %140 = add nuw nsw i32 0, %139
  %141 = mul nuw nsw i32 %133, 16
  %142 = add nuw nsw i32 %140, %141
  %143 = udiv i32 %142, 131072
  %144 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %142, i32 %137
  %145 = load float, ptr %144, align 4, !invariant.load !74
  br label %concatenate.7.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.1.19
  %146 = phi i32 [ 1, %concatenate.pivot.1.19 ]
  %147 = sub nsw i32 %30, %146
  %148 = add i32 %29, 0
  %149 = add i32 %27, 0
  %150 = add i32 %25, 64
  %151 = mul nuw nsw i32 %150, 1
  %152 = add nuw nsw i32 0, %151
  %153 = udiv i32 %152, 128
  %154 = mul nuw nsw i32 %149, 1
  %155 = add nuw nsw i32 0, %154
  %156 = mul nuw nsw i32 %148, 16
  %157 = add nuw nsw i32 %155, %156
  %158 = udiv i32 %157, 131072
  %159 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %157, i32 %152
  %160 = load float, ptr %159, align 4, !invariant.load !74
  br label %concatenate.7.merge14

concatenate.pivot.1.17:                           ; preds = %concatenate.7.merge8
  %161 = icmp ult i32 %30, 1
  br i1 %161, label %concatenate.pivot.0.18, label %concatenate.pivot.1.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.1.17
  br label %concat_index_from_operand_id015

concatenate.pivot.1.19:                           ; preds = %concatenate.pivot.1.17
  br label %concat_index_from_operand_id116

concatenate.7.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %162 = phi float [ %145, %concat_index_from_operand_id015 ], [ %160, %concat_index_from_operand_id116 ]
  %163 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %162, ptr %163, align 4
  br label %fusion_20.in_bounds-after
}

define void @fusion_19(ptr noalias align 128 dereferenceable(67108864) %arg0, ptr noalias align 128 dereferenceable(67108864) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4194304
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
  %15 = icmp ult i32 %linear_index_base, 16777216
  br i1 %15, label %fusion_19.in_bounds-true, label %fusion_19.in_bounds-after

fusion_19.in_bounds-after:                        ; preds = %fusion_19.in_bounds-true, %entry
  ret void

fusion_19.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 64
  %19 = udiv i32 %17, 64
  %20 = udiv i32 %19, 2
  %21 = mul nuw nsw i32 %5, 1
  %22 = add nuw nsw i32 0, %21
  %23 = urem i32 %22, 16
  %24 = udiv i32 %22, 16
  %25 = udiv i32 %24, 8192
  %26 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 %19, i32 %24, i32 %23, i32 %18
  %27 = load float, ptr %26, align 4, !invariant.load !74
  %28 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %27, ptr %28, align 4
  %29 = mul nuw nsw i32 %7, 1
  %30 = add nuw nsw i32 0, %29
  %31 = urem i32 %30, 64
  %32 = udiv i32 %30, 64
  %33 = udiv i32 %32, 2
  %34 = mul nuw nsw i32 %8, 1
  %35 = add nuw nsw i32 0, %34
  %36 = urem i32 %35, 16
  %37 = udiv i32 %35, 16
  %38 = udiv i32 %37, 8192
  %39 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 %32, i32 %37, i32 %36, i32 %31
  %40 = load float, ptr %39, align 4, !invariant.load !74
  %41 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %40, ptr %41, align 4
  %42 = mul nuw nsw i32 %10, 1
  %43 = add nuw nsw i32 0, %42
  %44 = urem i32 %43, 64
  %45 = udiv i32 %43, 64
  %46 = udiv i32 %45, 2
  %47 = mul nuw nsw i32 %11, 1
  %48 = add nuw nsw i32 0, %47
  %49 = urem i32 %48, 16
  %50 = udiv i32 %48, 16
  %51 = udiv i32 %50, 8192
  %52 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 %45, i32 %50, i32 %49, i32 %44
  %53 = load float, ptr %52, align 4, !invariant.load !74
  %54 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %53, ptr %54, align 4
  %55 = mul nuw nsw i32 %13, 1
  %56 = add nuw nsw i32 0, %55
  %57 = urem i32 %56, 64
  %58 = udiv i32 %56, 64
  %59 = udiv i32 %58, 2
  %60 = mul nuw nsw i32 %14, 1
  %61 = add nuw nsw i32 0, %60
  %62 = urem i32 %61, 16
  %63 = udiv i32 %61, 16
  %64 = udiv i32 %63, 8192
  %65 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 %58, i32 %63, i32 %62, i32 %57
  %66 = load float, ptr %65, align 4, !invariant.load !74
  %67 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %66, ptr %67, align 4
  br label %fusion_19.in_bounds-after
}

define void @fusion_40(ptr noalias align 128 dereferenceable(134217728) %arg0, ptr noalias align 16 dereferenceable(1024) %arg1, ptr noalias align 128 dereferenceable(134217728) %arg2, ptr noalias align 16 dereferenceable(1024) %arg3, ptr noalias align 128 dereferenceable(134217728) %arg4, ptr noalias align 128 dereferenceable(134217728) %arg5, ptr noalias align 128 dereferenceable(134217728) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !102
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8388608
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
  %15 = icmp ult i32 %linear_index_base, 33554432
  br i1 %15, label %fusion_40.in_bounds-true, label %fusion_40.in_bounds-after

fusion_40.in_bounds-after:                        ; preds = %fusion_40.in_bounds-true, %entry
  ret void

fusion_40.in_bounds-true:                         ; preds = %entry
  %region_0_17_constant_5 = load float, ptr @5, align 4
  %16 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !74
  %18 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !74
  %add.8 = fadd float %17, %19
  %20 = fneg float %add.8
  %21 = call float @__nv_expf(float %20)
  %add.11 = fadd float %region_0_17_constant_5, %21
  %divide.12 = fdiv float %region_0_17_constant_5, %add.11
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %23 = load float, ptr %22, align 4, !invariant.load !74
  %24 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %4
  %25 = load float, ptr %24, align 4, !invariant.load !74
  %add.14 = fadd float %23, %25
  %multiply.15 = fmul float %divide.12, %add.14
  %26 = insertvalue { float, float, float } undef, float %multiply.15, 0
  %27 = insertvalue { float, float, float } %26, float %add.14, 1
  %28 = insertvalue { float, float, float } %27, float %divide.12, 2
  %29 = extractvalue { float, float, float } %28, 0
  %30 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %29, ptr %30, align 4
  %31 = extractvalue { float, float, float } %28, 1
  %32 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %31, ptr %32, align 4
  %33 = extractvalue { float, float, float } %28, 2
  %34 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %33, ptr %34, align 4
  %region_0_17_constant_51 = load float, ptr @5, align 4
  %35 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %36 = load float, ptr %35, align 4, !invariant.load !74
  %37 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %7
  %38 = load float, ptr %37, align 4, !invariant.load !74
  %add.82 = fadd float %36, %38
  %39 = fneg float %add.82
  %40 = call float @__nv_expf(float %39)
  %add.113 = fadd float %region_0_17_constant_51, %40
  %divide.124 = fdiv float %region_0_17_constant_51, %add.113
  %41 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %42 = load float, ptr %41, align 4, !invariant.load !74
  %43 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %7
  %44 = load float, ptr %43, align 4, !invariant.load !74
  %add.145 = fadd float %42, %44
  %multiply.156 = fmul float %divide.124, %add.145
  %45 = insertvalue { float, float, float } undef, float %multiply.156, 0
  %46 = insertvalue { float, float, float } %45, float %add.145, 1
  %47 = insertvalue { float, float, float } %46, float %divide.124, 2
  %48 = extractvalue { float, float, float } %47, 0
  %49 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %48, ptr %49, align 4
  %50 = extractvalue { float, float, float } %47, 1
  %51 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %50, ptr %51, align 4
  %52 = extractvalue { float, float, float } %47, 2
  %53 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %52, ptr %53, align 4
  %region_0_17_constant_57 = load float, ptr @5, align 4
  %54 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %55 = load float, ptr %54, align 4, !invariant.load !74
  %56 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %10
  %57 = load float, ptr %56, align 4, !invariant.load !74
  %add.88 = fadd float %55, %57
  %58 = fneg float %add.88
  %59 = call float @__nv_expf(float %58)
  %add.119 = fadd float %region_0_17_constant_57, %59
  %divide.1210 = fdiv float %region_0_17_constant_57, %add.119
  %60 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %61 = load float, ptr %60, align 4, !invariant.load !74
  %62 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %10
  %63 = load float, ptr %62, align 4, !invariant.load !74
  %add.1411 = fadd float %61, %63
  %multiply.1512 = fmul float %divide.1210, %add.1411
  %64 = insertvalue { float, float, float } undef, float %multiply.1512, 0
  %65 = insertvalue { float, float, float } %64, float %add.1411, 1
  %66 = insertvalue { float, float, float } %65, float %divide.1210, 2
  %67 = extractvalue { float, float, float } %66, 0
  %68 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %67, ptr %68, align 4
  %69 = extractvalue { float, float, float } %66, 1
  %70 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %69, ptr %70, align 4
  %71 = extractvalue { float, float, float } %66, 2
  %72 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %71, ptr %72, align 4
  %region_0_17_constant_513 = load float, ptr @5, align 4
  %73 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %74 = load float, ptr %73, align 4, !invariant.load !74
  %75 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %13
  %76 = load float, ptr %75, align 4, !invariant.load !74
  %add.814 = fadd float %74, %76
  %77 = fneg float %add.814
  %78 = call float @__nv_expf(float %77)
  %add.1115 = fadd float %region_0_17_constant_513, %78
  %divide.1216 = fdiv float %region_0_17_constant_513, %add.1115
  %79 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %80 = load float, ptr %79, align 4, !invariant.load !74
  %81 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %13
  %82 = load float, ptr %81, align 4, !invariant.load !74
  %add.1417 = fadd float %80, %82
  %multiply.1518 = fmul float %divide.1216, %add.1417
  %83 = insertvalue { float, float, float } undef, float %multiply.1518, 0
  %84 = insertvalue { float, float, float } %83, float %add.1417, 1
  %85 = insertvalue { float, float, float } %84, float %divide.1216, 2
  %86 = extractvalue { float, float, float } %85, 0
  %87 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %86, ptr %87, align 4
  %88 = extractvalue { float, float, float } %85, 1
  %89 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %88, ptr %89, align 4
  %90 = extractvalue { float, float, float } %85, 2
  %91 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %90, ptr %91, align 4
  br label %fusion_40.in_bounds-after
}

define void @fusion_16(ptr noalias align 128 dereferenceable(67108864) %arg0, ptr noalias align 16 dereferenceable(512) %arg1) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %fusion_16.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 16777216
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 8388608
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !103
  %4 = mul nuw nsw i32 %2, 128
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !104
  %6 = mul nuw nsw i32 %5, 32
  %7 = add nuw nsw i32 %4, %6
  %linear_index = add nuw nsw i32 %7, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 2097152
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %row_index = mul nuw nsw i32 %3, 4
  %8 = udiv i32 %linear_index_plus_base, 1
  %9 = urem i32 %8, 128
  %10 = udiv i32 %linear_index_plus_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %row_index_plus1 = add nuw nsw i32 %row_index, 1
  %11 = udiv i32 %linear_index1, 1
  %12 = urem i32 %11, 128
  %13 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %row_index_plus2 = add nuw nsw i32 %row_index, 2
  %14 = udiv i32 %linear_index2, 1
  %15 = urem i32 %14, 128
  %16 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %row_index_plus3 = add nuw nsw i32 %row_index, 3
  %17 = udiv i32 %linear_index3, 1
  %18 = urem i32 %17, 128
  %19 = udiv i32 %linear_index3, 128
  %20 = icmp ult i32 %linear_index_plus_base, 16777216
  br i1 %20, label %fusion_16.in_bounds-true, label %fusion_16.in_bounds-after

fusion_16.in_bounds-after:                        ; preds = %fusion_16.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !105

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

fusion_16.in_bounds-true:                         ; preds = %loop.loop_body
  %21 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  %22 = load float, ptr %21, align 4
  %23 = getelementptr inbounds [128 x float], ptr %arg1, i32 0, i32 %row_index
  %24 = load float, ptr %23, align 4, !invariant.load !74
  %add.4 = fadd float %22, %24
  %25 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  store float %add.4, ptr %25, align 4
  %26 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %27 = load float, ptr %26, align 4
  %28 = getelementptr inbounds [128 x float], ptr %arg1, i32 0, i32 %row_index_plus1
  %29 = load float, ptr %28, align 4, !invariant.load !74
  %add.41 = fadd float %27, %29
  %30 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %add.41, ptr %30, align 4
  %31 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %32 = load float, ptr %31, align 4
  %33 = getelementptr inbounds [128 x float], ptr %arg1, i32 0, i32 %row_index_plus2
  %34 = load float, ptr %33, align 4, !invariant.load !74
  %add.42 = fadd float %32, %34
  %35 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %add.42, ptr %35, align 4
  %36 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %37 = load float, ptr %36, align 4
  %38 = getelementptr inbounds [128 x float], ptr %arg1, i32 0, i32 %row_index_plus3
  %39 = load float, ptr %38, align 4, !invariant.load !74
  %add.43 = fadd float %37, %39
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %add.43, ptr %40, align 4
  br label %fusion_16.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #0

define void @fusion_39(ptr noalias align 128 dereferenceable(134217728) %arg0, ptr noalias align 16 dereferenceable(1024) %arg1, ptr noalias align 128 dereferenceable(134217728) %arg2, ptr noalias align 16 dereferenceable(1024) %arg3, ptr noalias align 128 dereferenceable(134217728) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !102
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8388608
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
  %15 = icmp ult i32 %linear_index_base, 33554432
  br i1 %15, label %fusion_39.in_bounds-true, label %fusion_39.in_bounds-after

fusion_39.in_bounds-after:                        ; preds = %fusion_39.in_bounds-true, %entry
  ret void

fusion_39.in_bounds-true:                         ; preds = %entry
  %region_0_17_constant_5 = load float, ptr @6, align 4
  %16 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !74
  %add.8 = fadd float %17, %19
  %20 = fneg float %add.8
  %21 = call float @__nv_expf(float %20)
  %add.11 = fadd float %region_0_17_constant_5, %21
  %divide.12 = fdiv float %region_0_17_constant_5, %add.11
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %23 = load float, ptr %22, align 4
  %24 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %4
  %25 = load float, ptr %24, align 4, !invariant.load !74
  %add.14 = fadd float %23, %25
  %multiply.15 = fmul float %divide.12, %add.14
  %26 = insertvalue { float, float, float } undef, float %multiply.15, 0
  %27 = insertvalue { float, float, float } %26, float %add.14, 1
  %28 = insertvalue { float, float, float } %27, float %divide.12, 2
  %29 = extractvalue { float, float, float } %28, 0
  %30 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %29, ptr %30, align 4
  %31 = extractvalue { float, float, float } %28, 1
  %32 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %31, ptr %32, align 4
  %33 = extractvalue { float, float, float } %28, 2
  %34 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  store float %33, ptr %34, align 4
  %region_0_17_constant_51 = load float, ptr @6, align 4
  %35 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %36 = load float, ptr %35, align 4
  %37 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %7
  %38 = load float, ptr %37, align 4, !invariant.load !74
  %add.82 = fadd float %36, %38
  %39 = fneg float %add.82
  %40 = call float @__nv_expf(float %39)
  %add.113 = fadd float %region_0_17_constant_51, %40
  %divide.124 = fdiv float %region_0_17_constant_51, %add.113
  %41 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %42 = load float, ptr %41, align 4
  %43 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %7
  %44 = load float, ptr %43, align 4, !invariant.load !74
  %add.145 = fadd float %42, %44
  %multiply.156 = fmul float %divide.124, %add.145
  %45 = insertvalue { float, float, float } undef, float %multiply.156, 0
  %46 = insertvalue { float, float, float } %45, float %add.145, 1
  %47 = insertvalue { float, float, float } %46, float %divide.124, 2
  %48 = extractvalue { float, float, float } %47, 0
  %49 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %48, ptr %49, align 4
  %50 = extractvalue { float, float, float } %47, 1
  %51 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %50, ptr %51, align 4
  %52 = extractvalue { float, float, float } %47, 2
  %53 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %52, ptr %53, align 4
  %region_0_17_constant_57 = load float, ptr @6, align 4
  %54 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %55 = load float, ptr %54, align 4
  %56 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %10
  %57 = load float, ptr %56, align 4, !invariant.load !74
  %add.88 = fadd float %55, %57
  %58 = fneg float %add.88
  %59 = call float @__nv_expf(float %58)
  %add.119 = fadd float %region_0_17_constant_57, %59
  %divide.1210 = fdiv float %region_0_17_constant_57, %add.119
  %60 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %61 = load float, ptr %60, align 4
  %62 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %10
  %63 = load float, ptr %62, align 4, !invariant.load !74
  %add.1411 = fadd float %61, %63
  %multiply.1512 = fmul float %divide.1210, %add.1411
  %64 = insertvalue { float, float, float } undef, float %multiply.1512, 0
  %65 = insertvalue { float, float, float } %64, float %add.1411, 1
  %66 = insertvalue { float, float, float } %65, float %divide.1210, 2
  %67 = extractvalue { float, float, float } %66, 0
  %68 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %67, ptr %68, align 4
  %69 = extractvalue { float, float, float } %66, 1
  %70 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %69, ptr %70, align 4
  %71 = extractvalue { float, float, float } %66, 2
  %72 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %71, ptr %72, align 4
  %region_0_17_constant_513 = load float, ptr @6, align 4
  %73 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %74 = load float, ptr %73, align 4
  %75 = getelementptr inbounds [256 x float], ptr %arg3, i32 0, i32 %13
  %76 = load float, ptr %75, align 4, !invariant.load !74
  %add.814 = fadd float %74, %76
  %77 = fneg float %add.814
  %78 = call float @__nv_expf(float %77)
  %add.1115 = fadd float %region_0_17_constant_513, %78
  %divide.1216 = fdiv float %region_0_17_constant_513, %add.1115
  %79 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %80 = load float, ptr %79, align 4
  %81 = getelementptr inbounds [256 x float], ptr %arg1, i32 0, i32 %13
  %82 = load float, ptr %81, align 4, !invariant.load !74
  %add.1417 = fadd float %80, %82
  %multiply.1518 = fmul float %divide.1216, %add.1417
  %83 = insertvalue { float, float, float } undef, float %multiply.1518, 0
  %84 = insertvalue { float, float, float } %83, float %add.1417, 1
  %85 = insertvalue { float, float, float } %84, float %divide.1216, 2
  %86 = extractvalue { float, float, float } %85, 0
  %87 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %86, ptr %87, align 4
  %88 = extractvalue { float, float, float } %85, 1
  %89 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %88, ptr %89, align 4
  %90 = extractvalue { float, float, float } %85, 2
  %91 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %90, ptr %91, align 4
  br label %fusion_39.in_bounds-after
}

define void @fusion_38(ptr noalias align 128 dereferenceable(131072000) %arg0, ptr noalias align 128 dereferenceable(419430400) %arg1, ptr noalias align 128 dereferenceable(88080384) %arg2, ptr noalias align 16 dereferenceable(672) %arg3, ptr noalias align 128 dereferenceable(524288) %arg4, ptr noalias align 128 dereferenceable(88080384) %arg5) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer45 = alloca float, align 4
  %result_from_other_lane43 = alloca float, align 4
  %return_buffer42 = alloca float, align 4
  %result_from_other_lane40 = alloca float, align 4
  %return_buffer39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %result_from_other_lane34 = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %tile_loop.invar_address11 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !73
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_19_constant_12 = load float, ptr @7, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_19_constant_12, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !103
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !106
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 1
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 131072
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 131072
  %15 = udiv i32 %8, 131072
  %16 = icmp eq i32 %14, 131071
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 168, i32 512
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
  br label %y_in_tile.loop_header, !llvm.loop !107

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result32 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer33)
  %22 = load float, ptr %return_buffer33, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result35 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result35, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane34, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane34, ptr %return_buffer36)
  %24 = load float, ptr %return_buffer36, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result38 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane37, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane37, ptr %return_buffer39)
  %26 = load float, ptr %return_buffer39, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result41 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane40, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane40, ptr %return_buffer42)
  %28 = load float, ptr %return_buffer42, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result44 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result44, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane43, align 4
  call void @region_1_13(ptr %current_output, ptr %result_from_other_lane43, ptr %return_buffer45)
  %30 = load float, ptr %return_buffer45, align 4
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

tile_loop.loop_header:                            ; preds = %concatenate.10.merge, %is_full_tile-true
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
  %43 = mul nuw nsw i32 %39, 168
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 22020096
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 168
  %49 = udiv i32 %46, 168
  %50 = urem i32 %49, 16
  %51 = udiv i32 %46, 2688
  %52 = mul nuw nsw i32 %48, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 168
  %55 = mul nuw nsw i32 %50, 1
  %56 = add nuw nsw i32 0, %55
  %57 = mul nuw nsw i32 %51, 16
  %58 = add nuw nsw i32 %56, %57
  %59 = udiv i32 %58, 131072
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %46
  %Arg_2.33 = load float, ptr %Arg_2.3, align 4, !invariant.load !74
  %Arg_3.4 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %53
  %Arg_3.44 = load float, ptr %Arg_3.4, align 4, !invariant.load !74
  %add.6 = fadd float %Arg_2.33, %Arg_3.44
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %60 = phi i32 [ 0, %concatenate.pivot.0. ]
  %61 = sub nsw i32 %48, %60
  %62 = udiv i32 %46, 168
  %63 = mul i32 %62, 128
  %64 = add i32 %63, %61
  %65 = udiv i32 %64, 1
  %66 = urem i32 %65, 128
  %67 = udiv i32 %64, 128
  %68 = urem i32 %67, 16
  %69 = udiv i32 %64, 2048
  %70 = add i32 %51, 0
  %71 = add i32 %50, 0
  %72 = add i32 %61, 0
  %Arg_1.2 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %70, i32 %71, i32 %72
  %Arg_1.25 = load float, ptr %Arg_1.2, align 4, !invariant.load !74
  br label %concatenate.10.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.128.7
  %73 = phi i32 [ 128, %concatenate.pivot.128.7 ]
  %74 = sub nsw i32 %48, %73
  %75 = udiv i32 %46, 168
  %76 = mul i32 %75, 40
  %77 = add i32 %76, %74
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 40
  %80 = udiv i32 %77, 40
  %81 = urem i32 %80, 16
  %82 = udiv i32 %77, 640
  %83 = add i32 %51, 0
  %84 = add i32 %50, 0
  %85 = add i32 %74, 0
  %Arg_0.1 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %83, i32 %84, i32 %85
  %Arg_0.16 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  br label %concatenate.10.merge

concatenate.pivot.128.:                           ; preds = %tile_loop.loop_body
  %86 = icmp ult i32 %48, 128
  br i1 %86, label %concatenate.pivot.0., label %concatenate.pivot.128.7

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.128.
  br label %concat_index_from_operand_id0

concatenate.pivot.128.7:                          ; preds = %concatenate.pivot.128.
  br label %concat_index_from_operand_id1

concatenate.10.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %87 = phi float [ %Arg_1.25, %concat_index_from_operand_id0 ], [ %Arg_0.16, %concat_index_from_operand_id1 ]
  %add.11 = fadd float %add.6, %87
  store float %add.11, ptr %reduction_input_address, align 4
  %88 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_13(ptr %88, ptr %reduction_input_address, ptr %return_buffer)
  %89 = load float, ptr %return_buffer, align 4
  store float %89, ptr %88, align 4
  %90 = getelementptr inbounds float, ptr %arg5, i32 %46
  store float %add.11, ptr %90, align 4
  br label %tile_loop.loop_header, !llvm.loop !108

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %91 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address11, align 4
  br label %tile_loop.loop_header9

tile_loop.loop_header9:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar12 = load i32, ptr %tile_loop.invar_address11, align 4
  %92 = icmp uge i32 %tile_loop.indvar12, 16
  br i1 %92, label %tile_loop.loop_exit8, label %tile_loop.loop_body10

tile_loop.loop_body10:                            ; preds = %tile_loop.loop_header9
  %invar.inc13 = add nuw nsw i32 %tile_loop.indvar12, 1
  store i32 %invar.inc13, ptr %tile_loop.invar_address11, align 4
  %93 = icmp eq i32 %tile_loop.indvar12, 0
  %94 = mul i32 %tile_loop.indvar12, 32
  %95 = add i32 %94, 0
  %x_loc14 = add i32 %95, %91
  %96 = add i32 %tile_origin.1, %y_in_tile.indvar
  %97 = add i32 %tile_origin.2, %x_loc14
  %98 = icmp ult i32 %x_loc14, %tile_bound1
  br i1 %98, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %concatenate.10.merge20, %tile_loop.loop_body10
  br label %tile_loop.loop_header9, !llvm.loop !109

tile_loop.loop_exit8:                             ; preds = %tile_loop.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body10
  %99 = mul nuw nsw i32 %97, 1
  %100 = add nuw nsw i32 0, %99
  %101 = mul nuw nsw i32 %96, 168
  %102 = add nuw nsw i32 %100, %101
  %103 = mul nuw nsw i32 %tile_origin.0, 22020096
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 1
  %106 = urem i32 %105, 168
  %107 = udiv i32 %104, 168
  %108 = urem i32 %107, 16
  %109 = udiv i32 %104, 2688
  %110 = mul nuw nsw i32 %106, 1
  %111 = add nuw nsw i32 0, %110
  %112 = udiv i32 %111, 168
  %113 = mul nuw nsw i32 %108, 1
  %114 = add nuw nsw i32 0, %113
  %115 = mul nuw nsw i32 %109, 16
  %116 = add nuw nsw i32 %114, %115
  %117 = udiv i32 %116, 131072
  %Arg_2.315 = getelementptr inbounds float, ptr %arg2, i32 %104
  %Arg_2.316 = load float, ptr %Arg_2.315, align 4, !invariant.load !74
  %Arg_3.417 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %111
  %Arg_3.418 = load float, ptr %Arg_3.417, align 4, !invariant.load !74
  %add.619 = fadd float %Arg_2.316, %Arg_3.418
  br label %concatenate.pivot.128.27

concat_index_from_operand_id021:                  ; preds = %concatenate.pivot.0.28
  %118 = phi i32 [ 0, %concatenate.pivot.0.28 ]
  %119 = sub nsw i32 %106, %118
  %120 = udiv i32 %104, 168
  %121 = mul i32 %120, 128
  %122 = add i32 %121, %119
  %123 = udiv i32 %122, 1
  %124 = urem i32 %123, 128
  %125 = udiv i32 %122, 128
  %126 = urem i32 %125, 16
  %127 = udiv i32 %122, 2048
  %128 = add i32 %109, 0
  %129 = add i32 %108, 0
  %130 = add i32 %119, 0
  %Arg_1.222 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %128, i32 %129, i32 %130
  %Arg_1.223 = load float, ptr %Arg_1.222, align 4, !invariant.load !74
  br label %concatenate.10.merge20

concat_index_from_operand_id124:                  ; preds = %concatenate.pivot.128.29
  %131 = phi i32 [ 128, %concatenate.pivot.128.29 ]
  %132 = sub nsw i32 %106, %131
  %133 = udiv i32 %104, 168
  %134 = mul i32 %133, 40
  %135 = add i32 %134, %132
  %136 = udiv i32 %135, 1
  %137 = urem i32 %136, 40
  %138 = udiv i32 %135, 40
  %139 = urem i32 %138, 16
  %140 = udiv i32 %135, 640
  %141 = add i32 %109, 0
  %142 = add i32 %108, 0
  %143 = add i32 %132, 0
  %Arg_0.125 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %141, i32 %142, i32 %143
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !74
  br label %concatenate.10.merge20

concatenate.pivot.128.27:                         ; preds = %x_in_tile-true
  %144 = icmp ult i32 %106, 128
  br i1 %144, label %concatenate.pivot.0.28, label %concatenate.pivot.128.29

concatenate.pivot.0.28:                           ; preds = %concatenate.pivot.128.27
  br label %concat_index_from_operand_id021

concatenate.pivot.128.29:                         ; preds = %concatenate.pivot.128.27
  br label %concat_index_from_operand_id124

concatenate.10.merge20:                           ; preds = %concat_index_from_operand_id124, %concat_index_from_operand_id021
  %145 = phi float [ %Arg_1.223, %concat_index_from_operand_id021 ], [ %Arg_0.126, %concat_index_from_operand_id124 ]
  %add.1130 = fadd float %add.619, %145
  store float %add.1130, ptr %reduction_input_address, align 4
  %146 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_13(ptr %146, ptr %reduction_input_address, ptr %return_buffer31)
  %147 = load float, ptr %return_buffer31, align 4
  store float %147, ptr %146, align 4
  %148 = getelementptr inbounds float, ptr %arg5, i32 %104
  store float %add.1130, ptr %148, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %149 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %150 = addrspacecast ptr addrspace(3) %149 to ptr
  %151 = load float, ptr %current_output, align 4
  store float %151, ptr %150, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %152 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %153 = addrspacecast ptr addrspace(3) %152 to ptr
  store float %region_0_19_constant_12, ptr %initial_value_addr, align 4
  %154 = icmp ult i32 %thread_id.x, 1
  %155 = select i1 %154, ptr %153, ptr %initial_value_addr
  %156 = icmp eq i32 %thread_id.x, 0
  br i1 %156, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %157 = mul i32 %thread_id.x, 1
  %158 = add i32 %tile_origin.1, %thread_id.y
  %159 = add i32 %tile_origin.2, %157
  %160 = add i32 %159, 0
  %161 = udiv i32 %158, 1
  %162 = urem i32 %161, 16
  %163 = udiv i32 %158, 16
  %output_element_address = getelementptr inbounds [8192 x [16 x float]], ptr %arg4, i32 0, i32 %163, i32 %162
  %output = load float, ptr %155, align 4
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

define void @fusion_12(ptr noalias align 128 dereferenceable(524288) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
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
  br i1 %15, label %fusion_12.in_bounds-true, label %fusion_12.in_bounds-after

fusion_12.in_bounds-after:                        ; preds = %fusion_12.in_bounds-true, %entry
  ret void

fusion_12.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !74
  %region_0_5_constant_2 = load float, ptr @8, align 4
  %multiply.4 = fmul float %17, %region_0_5_constant_2
  %18 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %multiply.4, ptr %18, align 4
  %19 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %20 = load float, ptr %19, align 4, !invariant.load !74
  %region_0_5_constant_21 = load float, ptr @8, align 4
  %multiply.42 = fmul float %20, %region_0_5_constant_21
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %multiply.42, ptr %21, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %23 = load float, ptr %22, align 4, !invariant.load !74
  %region_0_5_constant_23 = load float, ptr @8, align 4
  %multiply.44 = fmul float %23, %region_0_5_constant_23
  %24 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %multiply.44, ptr %24, align 4
  %25 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %26 = load float, ptr %25, align 4, !invariant.load !74
  %region_0_5_constant_25 = load float, ptr @8, align 4
  %multiply.46 = fmul float %26, %region_0_5_constant_25
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %multiply.46, ptr %27, align 4
  br label %fusion_12.in_bounds-after
}

define void @fusion_10(ptr noalias align 128 dereferenceable(88080384) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(524288) %arg2, ptr noalias align 128 dereferenceable(88080384) %arg3) {
entry:
  %initial_value_addr = alloca float, align 4
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
  %return_buffer18 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !73
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_13_constant_6 = load float, ptr @9, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_13_constant_6, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !103
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !106
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 1
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 131072
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 131072
  %15 = udiv i32 %8, 131072
  %16 = icmp eq i32 %14, 131071
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 168, i32 512
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
  br label %y_in_tile.loop_header, !llvm.loop !110

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result19 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer20)
  %22 = load float, ptr %return_buffer20, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result22 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane21, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane21, ptr %return_buffer23)
  %24 = load float, ptr %return_buffer23, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result25 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result25, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane24, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane24, ptr %return_buffer26)
  %26 = load float, ptr %return_buffer26, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result28 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane27, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane27, ptr %return_buffer29)
  %28 = load float, ptr %return_buffer29, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result31 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane30, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane30, ptr %return_buffer32)
  %30 = load float, ptr %return_buffer32, align 4
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
  %43 = mul nuw nsw i32 %39, 168
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 22020096
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 168
  %49 = udiv i32 %46, 168
  %50 = urem i32 %49, 16
  %51 = udiv i32 %46, 2688
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  %52 = udiv i32 %46, 168
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %52
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !74
  %subtract.4 = fsub float %Arg_0.13, %Arg_1.24
  %multiply.5 = fmul float %subtract.4, %subtract.4
  store float %multiply.5, ptr %reduction_input_address, align 4
  %53 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %53, ptr %reduction_input_address, ptr %return_buffer)
  %54 = load float, ptr %return_buffer, align 4
  store float %54, ptr %53, align 4
  %55 = getelementptr inbounds float, ptr %arg3, i32 %46
  store float %subtract.4, ptr %55, align 4
  br label %tile_loop.loop_header, !llvm.loop !111

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %56 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %57 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %57, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %58 = icmp eq i32 %tile_loop.indvar9, 0
  %59 = mul i32 %tile_loop.indvar9, 32
  %60 = add i32 %59, 0
  %x_loc11 = add i32 %60, %56
  %61 = add i32 %tile_origin.1, %y_in_tile.indvar
  %62 = add i32 %tile_origin.2, %x_loc11
  %63 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %63, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !112

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %64 = mul nuw nsw i32 %62, 1
  %65 = add nuw nsw i32 0, %64
  %66 = mul nuw nsw i32 %61, 168
  %67 = add nuw nsw i32 %65, %66
  %68 = mul nuw nsw i32 %tile_origin.0, 22020096
  %69 = add nuw nsw i32 %67, %68
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 168
  %72 = udiv i32 %69, 168
  %73 = urem i32 %72, 16
  %74 = udiv i32 %69, 2688
  %Arg_0.112 = getelementptr inbounds float, ptr %arg0, i32 %69
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !74
  %75 = udiv i32 %69, 168
  %Arg_1.214 = getelementptr inbounds float, ptr %arg1, i32 %75
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !74
  %subtract.416 = fsub float %Arg_0.113, %Arg_1.215
  %multiply.517 = fmul float %subtract.416, %subtract.416
  store float %multiply.517, ptr %reduction_input_address, align 4
  %76 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %76, ptr %reduction_input_address, ptr %return_buffer18)
  %77 = load float, ptr %return_buffer18, align 4
  store float %77, ptr %76, align 4
  %78 = getelementptr inbounds float, ptr %arg3, i32 %69
  store float %subtract.416, ptr %78, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %79 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %31
  %80 = addrspacecast ptr addrspace(3) %79 to ptr
  %81 = load float, ptr %current_output, align 4
  store float %81, ptr %80, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %82 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %lane_id
  %83 = addrspacecast ptr addrspace(3) %82 to ptr
  store float %region_0_13_constant_6, ptr %initial_value_addr, align 4
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
  %92 = urem i32 %91, 16
  %93 = udiv i32 %88, 16
  %output_element_address = getelementptr inbounds [8192 x [16 x float]], ptr %arg2, i32 0, i32 %93, i32 %92
  %output = load float, ptr %85, align 4
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

define void @fusion_9(ptr noalias align 128 dereferenceable(524288) %arg0) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
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
  br i1 %15, label %fusion_9.in_bounds-true, label %fusion_9.in_bounds-after

fusion_9.in_bounds-after:                         ; preds = %fusion_9.in_bounds-true, %entry
  ret void

fusion_9.in_bounds-true:                          ; preds = %entry
  %region_0_9_constant_2 = load float, ptr @11, align 4
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %region_0_9_constant_4 = load float, ptr @10, align 4
  %multiply.6 = fmul float %17, %region_0_9_constant_4
  %add.7 = fadd float %region_0_9_constant_2, %multiply.6
  %18 = call float @__nv_rsqrtf(float %add.7)
  %19 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  store float %18, ptr %19, align 4
  %region_0_9_constant_21 = load float, ptr @11, align 4
  %20 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %21 = load float, ptr %20, align 4
  %region_0_9_constant_42 = load float, ptr @10, align 4
  %multiply.63 = fmul float %21, %region_0_9_constant_42
  %add.74 = fadd float %region_0_9_constant_21, %multiply.63
  %22 = call float @__nv_rsqrtf(float %add.74)
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %22, ptr %23, align 4
  %region_0_9_constant_25 = load float, ptr @11, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %25 = load float, ptr %24, align 4
  %region_0_9_constant_46 = load float, ptr @10, align 4
  %multiply.67 = fmul float %25, %region_0_9_constant_46
  %add.78 = fadd float %region_0_9_constant_25, %multiply.67
  %26 = call float @__nv_rsqrtf(float %add.78)
  %27 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %26, ptr %27, align 4
  %region_0_9_constant_29 = load float, ptr @11, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %29 = load float, ptr %28, align 4
  %region_0_9_constant_410 = load float, ptr @10, align 4
  %multiply.611 = fmul float %29, %region_0_9_constant_410
  %add.712 = fadd float %region_0_9_constant_29, %multiply.611
  %30 = call float @__nv_rsqrtf(float %add.712)
  %31 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %30, ptr %31, align 4
  br label %fusion_9.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_rsqrtf(float) #3

define void @fusion_8(ptr noalias align 128 dereferenceable(88080384) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 128 dereferenceable(88080384) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !101
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 5505024
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 168
  %5 = udiv i32 %linear_index_base, 168
  %6 = urem i32 %5, 16
  %7 = udiv i32 %linear_index_base, 2688
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 168
  %10 = udiv i32 %linear_index1, 168
  %11 = urem i32 %10, 16
  %12 = udiv i32 %linear_index1, 2688
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 168
  %15 = udiv i32 %linear_index2, 168
  %16 = urem i32 %15, 16
  %17 = udiv i32 %linear_index2, 2688
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 168
  %20 = udiv i32 %linear_index3, 168
  %21 = urem i32 %20, 16
  %22 = udiv i32 %linear_index3, 2688
  %23 = icmp ult i32 %linear_index_base, 22020096
  br i1 %23, label %fusion_8.in_bounds-true, label %fusion_8.in_bounds-after

fusion_8.in_bounds-after:                         ; preds = %fusion_8.in_bounds-true, %entry
  ret void

fusion_8.in_bounds-true:                          ; preds = %entry
  %24 = udiv i32 %linear_index_base, 168
  %25 = getelementptr inbounds float, ptr %arg1, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !74
  %27 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %28 = load float, ptr %27, align 4, !invariant.load !74
  %multiply.4 = fmul float %26, %28
  %29 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %multiply.4, ptr %29, align 4
  %30 = udiv i32 %linear_index1, 168
  %31 = getelementptr inbounds float, ptr %arg1, i32 %30
  %32 = load float, ptr %31, align 4, !invariant.load !74
  %33 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %34 = load float, ptr %33, align 4, !invariant.load !74
  %multiply.41 = fmul float %32, %34
  %35 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %multiply.41, ptr %35, align 4
  %36 = udiv i32 %linear_index2, 168
  %37 = getelementptr inbounds float, ptr %arg1, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !74
  %39 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %40 = load float, ptr %39, align 4, !invariant.load !74
  %multiply.42 = fmul float %38, %40
  %41 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %multiply.42, ptr %41, align 4
  %42 = udiv i32 %linear_index3, 168
  %43 = getelementptr inbounds float, ptr %arg1, i32 %42
  %44 = load float, ptr %43, align 4, !invariant.load !74
  %45 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %46 = load float, ptr %45, align 4, !invariant.load !74
  %multiply.43 = fmul float %44, %46
  %47 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %multiply.43, ptr %47, align 4
  br label %fusion_8.in_bounds-after
}

define void @fusion_7(ptr noalias align 128 dereferenceable(131072000) %arg0, ptr noalias align 128 dereferenceable(419430400) %arg1, ptr noalias align 128 dereferenceable(88080384) %arg2, ptr noalias align 16 dereferenceable(672) %arg3, ptr noalias align 16 dereferenceable(672) %arg4, ptr noalias align 128 dereferenceable(550502400) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !113
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 34406400
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 168
  %5 = udiv i32 %linear_index_base, 168
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 168
  %8 = udiv i32 %linear_index1, 168
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 168
  %11 = udiv i32 %linear_index2, 168
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 168
  %14 = udiv i32 %linear_index3, 168
  %15 = icmp ult i32 %linear_index_base, 137625600
  br i1 %15, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %concatenate.20.merge61, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 168
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 100
  %22 = udiv i32 %20, 100
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.11
  %24 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 168
  %27 = mul i32 %26, 128
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 128
  %31 = udiv i32 %28, 128
  %32 = urem i32 %31, 100
  %33 = udiv i32 %28, 12800
  br label %concatenate.pivot.16.

concat_index_from_operand_id01:                   ; preds = %concatenate.pivot.0.
  %34 = phi i32 [ 0, %concatenate.pivot.0. ]
  %35 = sub nsw i32 %21, %34
  %36 = add i32 %22, 0
  %37 = add i32 %35, 0
  %38 = add i32 %25, 0
  %39 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %36, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !74
  %41 = add i32 %22, 0
  %42 = add i32 %35, 0
  %43 = add i32 %25, 0
  %44 = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %43
  %45 = load float, ptr %44, align 4, !invariant.load !74
  %46 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %43
  %47 = load float, ptr %46, align 4, !invariant.load !74
  %48 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr %arg2, i32 0, i32 %41, i32 %42, i32 %43
  %49 = load float, ptr %48, align 4, !invariant.load !74
  %multiply.9 = fmul float %47, %49
  %add.10 = fadd float %45, %multiply.9
  %add.12 = fadd float %40, %add.10
  br label %concatenate.14.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.16.2
  %50 = phi i32 [ 16, %concatenate.pivot.16.2 ]
  %51 = sub nsw i32 %21, %50
  %52 = add i32 %22, 0
  %53 = add i32 %51, 16
  %54 = add i32 %25, 0
  %55 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %52, i32 %53, i32 %54
  %56 = load float, ptr %55, align 4, !invariant.load !74
  br label %concatenate.14.merge

concatenate.pivot.16.:                            ; preds = %concat_index_from_operand_id0
  %57 = icmp ult i32 %21, 16
  br i1 %57, label %concatenate.pivot.0., label %concatenate.pivot.16.2

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id01

concatenate.pivot.16.2:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id1

concatenate.14.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id01
  %58 = phi float [ %add.12, %concat_index_from_operand_id01 ], [ %56, %concat_index_from_operand_id1 ]
  br label %concatenate.20.merge

concat_index_from_operand_id13:                   ; preds = %concatenate.pivot.128.12
  %59 = phi i32 [ 128, %concatenate.pivot.128.12 ]
  %60 = sub nsw i32 %17, %59
  %61 = udiv i32 %linear_index_base, 168
  %62 = mul i32 %61, 40
  %63 = add i32 %62, %60
  %64 = udiv i32 %63, 1
  %65 = urem i32 %64, 40
  %66 = udiv i32 %63, 40
  %67 = urem i32 %66, 100
  %68 = udiv i32 %63, 4000
  br label %concatenate.pivot.16.8

concat_index_from_operand_id04:                   ; preds = %concatenate.pivot.0.9
  %69 = phi i32 [ 0, %concatenate.pivot.0.9 ]
  %70 = sub nsw i32 %21, %69
  %71 = add i32 %22, 0
  %72 = add i32 %70, 0
  %73 = add i32 %60, 0
  %74 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %71, i32 %72, i32 %73
  %75 = load float, ptr %74, align 4, !invariant.load !74
  %76 = add i32 %22, 0
  %77 = add i32 %70, 0
  %78 = add i32 %60, 128
  %79 = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %78
  %80 = load float, ptr %79, align 4, !invariant.load !74
  %81 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %78
  %82 = load float, ptr %81, align 4, !invariant.load !74
  %83 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr %arg2, i32 0, i32 %76, i32 %77, i32 %78
  %84 = load float, ptr %83, align 4, !invariant.load !74
  %multiply.95 = fmul float %82, %84
  %add.106 = fadd float %80, %multiply.95
  %add.17 = fadd float %75, %add.106
  br label %concatenate.19.merge

concat_index_from_operand_id17:                   ; preds = %concatenate.pivot.16.10
  %85 = phi i32 [ 16, %concatenate.pivot.16.10 ]
  %86 = sub nsw i32 %21, %85
  %87 = add i32 %22, 0
  %88 = add i32 %86, 16
  %89 = add i32 %60, 0
  %90 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %87, i32 %88, i32 %89
  %91 = load float, ptr %90, align 4, !invariant.load !74
  br label %concatenate.19.merge

concatenate.pivot.16.8:                           ; preds = %concat_index_from_operand_id13
  %92 = icmp ult i32 %21, 16
  br i1 %92, label %concatenate.pivot.0.9, label %concatenate.pivot.16.10

concatenate.pivot.0.9:                            ; preds = %concatenate.pivot.16.8
  br label %concat_index_from_operand_id04

concatenate.pivot.16.10:                          ; preds = %concatenate.pivot.16.8
  br label %concat_index_from_operand_id17

concatenate.19.merge:                             ; preds = %concat_index_from_operand_id17, %concat_index_from_operand_id04
  %93 = phi float [ %add.17, %concat_index_from_operand_id04 ], [ %91, %concat_index_from_operand_id17 ]
  br label %concatenate.20.merge

concatenate.pivot.128.:                           ; preds = %fusion_7.in_bounds-true
  %94 = icmp ult i32 %17, 128
  br i1 %94, label %concatenate.pivot.0.11, label %concatenate.pivot.128.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.128.
  br label %concat_index_from_operand_id0

concatenate.pivot.128.12:                         ; preds = %concatenate.pivot.128.
  br label %concat_index_from_operand_id13

concatenate.20.merge:                             ; preds = %concatenate.19.merge, %concatenate.14.merge
  %95 = phi float [ %58, %concatenate.14.merge ], [ %93, %concatenate.19.merge ]
  %96 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %95, ptr %96, align 4
  %97 = mul nuw nsw i32 %7, 1
  %98 = add nuw nsw i32 0, %97
  %99 = udiv i32 %98, 168
  %100 = mul nuw nsw i32 %8, 1
  %101 = add nuw nsw i32 0, %100
  %102 = urem i32 %101, 100
  %103 = udiv i32 %101, 100
  %104 = udiv i32 %103, 8192
  br label %concatenate.pivot.128.34

concat_index_from_operand_id014:                  ; preds = %concatenate.pivot.0.35
  %105 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %106 = sub nsw i32 %98, %105
  %107 = udiv i32 %linear_index1, 168
  %108 = mul i32 %107, 128
  %109 = add i32 %108, %106
  %110 = udiv i32 %109, 1
  %111 = urem i32 %110, 128
  %112 = udiv i32 %109, 128
  %113 = urem i32 %112, 100
  %114 = udiv i32 %109, 12800
  br label %concatenate.pivot.16.21

concat_index_from_operand_id016:                  ; preds = %concatenate.pivot.0.22
  %115 = phi i32 [ 0, %concatenate.pivot.0.22 ]
  %116 = sub nsw i32 %102, %115
  %117 = add i32 %103, 0
  %118 = add i32 %116, 0
  %119 = add i32 %106, 0
  %120 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %117, i32 %118, i32 %119
  %121 = load float, ptr %120, align 4, !invariant.load !74
  %122 = add i32 %103, 0
  %123 = add i32 %116, 0
  %124 = add i32 %106, 0
  %125 = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %124
  %126 = load float, ptr %125, align 4, !invariant.load !74
  %127 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %124
  %128 = load float, ptr %127, align 4, !invariant.load !74
  %129 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr %arg2, i32 0, i32 %122, i32 %123, i32 %124
  %130 = load float, ptr %129, align 4, !invariant.load !74
  %multiply.917 = fmul float %128, %130
  %add.1018 = fadd float %126, %multiply.917
  %add.1219 = fadd float %121, %add.1018
  br label %concatenate.14.merge15

concat_index_from_operand_id120:                  ; preds = %concatenate.pivot.16.23
  %131 = phi i32 [ 16, %concatenate.pivot.16.23 ]
  %132 = sub nsw i32 %102, %131
  %133 = add i32 %103, 0
  %134 = add i32 %132, 16
  %135 = add i32 %106, 0
  %136 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %133, i32 %134, i32 %135
  %137 = load float, ptr %136, align 4, !invariant.load !74
  br label %concatenate.14.merge15

concatenate.pivot.16.21:                          ; preds = %concat_index_from_operand_id014
  %138 = icmp ult i32 %102, 16
  br i1 %138, label %concatenate.pivot.0.22, label %concatenate.pivot.16.23

concatenate.pivot.0.22:                           ; preds = %concatenate.pivot.16.21
  br label %concat_index_from_operand_id016

concatenate.pivot.16.23:                          ; preds = %concatenate.pivot.16.21
  br label %concat_index_from_operand_id120

concatenate.14.merge15:                           ; preds = %concat_index_from_operand_id120, %concat_index_from_operand_id016
  %139 = phi float [ %add.1219, %concat_index_from_operand_id016 ], [ %137, %concat_index_from_operand_id120 ]
  br label %concatenate.20.merge13

concat_index_from_operand_id124:                  ; preds = %concatenate.pivot.128.36
  %140 = phi i32 [ 128, %concatenate.pivot.128.36 ]
  %141 = sub nsw i32 %98, %140
  %142 = udiv i32 %linear_index1, 168
  %143 = mul i32 %142, 40
  %144 = add i32 %143, %141
  %145 = udiv i32 %144, 1
  %146 = urem i32 %145, 40
  %147 = udiv i32 %144, 40
  %148 = urem i32 %147, 100
  %149 = udiv i32 %144, 4000
  br label %concatenate.pivot.16.31

concat_index_from_operand_id026:                  ; preds = %concatenate.pivot.0.32
  %150 = phi i32 [ 0, %concatenate.pivot.0.32 ]
  %151 = sub nsw i32 %102, %150
  %152 = add i32 %103, 0
  %153 = add i32 %151, 0
  %154 = add i32 %141, 0
  %155 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %152, i32 %153, i32 %154
  %156 = load float, ptr %155, align 4, !invariant.load !74
  %157 = add i32 %103, 0
  %158 = add i32 %151, 0
  %159 = add i32 %141, 128
  %160 = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %159
  %161 = load float, ptr %160, align 4, !invariant.load !74
  %162 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %159
  %163 = load float, ptr %162, align 4, !invariant.load !74
  %164 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr %arg2, i32 0, i32 %157, i32 %158, i32 %159
  %165 = load float, ptr %164, align 4, !invariant.load !74
  %multiply.927 = fmul float %163, %165
  %add.1028 = fadd float %161, %multiply.927
  %add.1729 = fadd float %156, %add.1028
  br label %concatenate.19.merge25

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.16.33
  %166 = phi i32 [ 16, %concatenate.pivot.16.33 ]
  %167 = sub nsw i32 %102, %166
  %168 = add i32 %103, 0
  %169 = add i32 %167, 16
  %170 = add i32 %141, 0
  %171 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %168, i32 %169, i32 %170
  %172 = load float, ptr %171, align 4, !invariant.load !74
  br label %concatenate.19.merge25

concatenate.pivot.16.31:                          ; preds = %concat_index_from_operand_id124
  %173 = icmp ult i32 %102, 16
  br i1 %173, label %concatenate.pivot.0.32, label %concatenate.pivot.16.33

concatenate.pivot.0.32:                           ; preds = %concatenate.pivot.16.31
  br label %concat_index_from_operand_id026

concatenate.pivot.16.33:                          ; preds = %concatenate.pivot.16.31
  br label %concat_index_from_operand_id130

concatenate.19.merge25:                           ; preds = %concat_index_from_operand_id130, %concat_index_from_operand_id026
  %174 = phi float [ %add.1729, %concat_index_from_operand_id026 ], [ %172, %concat_index_from_operand_id130 ]
  br label %concatenate.20.merge13

concatenate.pivot.128.34:                         ; preds = %concatenate.20.merge
  %175 = icmp ult i32 %98, 128
  br i1 %175, label %concatenate.pivot.0.35, label %concatenate.pivot.128.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.128.34
  br label %concat_index_from_operand_id014

concatenate.pivot.128.36:                         ; preds = %concatenate.pivot.128.34
  br label %concat_index_from_operand_id124

concatenate.20.merge13:                           ; preds = %concatenate.19.merge25, %concatenate.14.merge15
  %176 = phi float [ %139, %concatenate.14.merge15 ], [ %174, %concatenate.19.merge25 ]
  %177 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %176, ptr %177, align 4
  %178 = mul nuw nsw i32 %10, 1
  %179 = add nuw nsw i32 0, %178
  %180 = udiv i32 %179, 168
  %181 = mul nuw nsw i32 %11, 1
  %182 = add nuw nsw i32 0, %181
  %183 = urem i32 %182, 100
  %184 = udiv i32 %182, 100
  %185 = udiv i32 %184, 8192
  br label %concatenate.pivot.128.58

concat_index_from_operand_id038:                  ; preds = %concatenate.pivot.0.59
  %186 = phi i32 [ 0, %concatenate.pivot.0.59 ]
  %187 = sub nsw i32 %179, %186
  %188 = udiv i32 %linear_index2, 168
  %189 = mul i32 %188, 128
  %190 = add i32 %189, %187
  %191 = udiv i32 %190, 1
  %192 = urem i32 %191, 128
  %193 = udiv i32 %190, 128
  %194 = urem i32 %193, 100
  %195 = udiv i32 %190, 12800
  br label %concatenate.pivot.16.45

concat_index_from_operand_id040:                  ; preds = %concatenate.pivot.0.46
  %196 = phi i32 [ 0, %concatenate.pivot.0.46 ]
  %197 = sub nsw i32 %183, %196
  %198 = add i32 %184, 0
  %199 = add i32 %197, 0
  %200 = add i32 %187, 0
  %201 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %198, i32 %199, i32 %200
  %202 = load float, ptr %201, align 4, !invariant.load !74
  %203 = add i32 %184, 0
  %204 = add i32 %197, 0
  %205 = add i32 %187, 0
  %206 = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %205
  %207 = load float, ptr %206, align 4, !invariant.load !74
  %208 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %205
  %209 = load float, ptr %208, align 4, !invariant.load !74
  %210 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr %arg2, i32 0, i32 %203, i32 %204, i32 %205
  %211 = load float, ptr %210, align 4, !invariant.load !74
  %multiply.941 = fmul float %209, %211
  %add.1042 = fadd float %207, %multiply.941
  %add.1243 = fadd float %202, %add.1042
  br label %concatenate.14.merge39

concat_index_from_operand_id144:                  ; preds = %concatenate.pivot.16.47
  %212 = phi i32 [ 16, %concatenate.pivot.16.47 ]
  %213 = sub nsw i32 %183, %212
  %214 = add i32 %184, 0
  %215 = add i32 %213, 16
  %216 = add i32 %187, 0
  %217 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %214, i32 %215, i32 %216
  %218 = load float, ptr %217, align 4, !invariant.load !74
  br label %concatenate.14.merge39

concatenate.pivot.16.45:                          ; preds = %concat_index_from_operand_id038
  %219 = icmp ult i32 %183, 16
  br i1 %219, label %concatenate.pivot.0.46, label %concatenate.pivot.16.47

concatenate.pivot.0.46:                           ; preds = %concatenate.pivot.16.45
  br label %concat_index_from_operand_id040

concatenate.pivot.16.47:                          ; preds = %concatenate.pivot.16.45
  br label %concat_index_from_operand_id144

concatenate.14.merge39:                           ; preds = %concat_index_from_operand_id144, %concat_index_from_operand_id040
  %220 = phi float [ %add.1243, %concat_index_from_operand_id040 ], [ %218, %concat_index_from_operand_id144 ]
  br label %concatenate.20.merge37

concat_index_from_operand_id148:                  ; preds = %concatenate.pivot.128.60
  %221 = phi i32 [ 128, %concatenate.pivot.128.60 ]
  %222 = sub nsw i32 %179, %221
  %223 = udiv i32 %linear_index2, 168
  %224 = mul i32 %223, 40
  %225 = add i32 %224, %222
  %226 = udiv i32 %225, 1
  %227 = urem i32 %226, 40
  %228 = udiv i32 %225, 40
  %229 = urem i32 %228, 100
  %230 = udiv i32 %225, 4000
  br label %concatenate.pivot.16.55

concat_index_from_operand_id050:                  ; preds = %concatenate.pivot.0.56
  %231 = phi i32 [ 0, %concatenate.pivot.0.56 ]
  %232 = sub nsw i32 %183, %231
  %233 = add i32 %184, 0
  %234 = add i32 %232, 0
  %235 = add i32 %222, 0
  %236 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %233, i32 %234, i32 %235
  %237 = load float, ptr %236, align 4, !invariant.load !74
  %238 = add i32 %184, 0
  %239 = add i32 %232, 0
  %240 = add i32 %222, 128
  %241 = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %240
  %242 = load float, ptr %241, align 4, !invariant.load !74
  %243 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %240
  %244 = load float, ptr %243, align 4, !invariant.load !74
  %245 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr %arg2, i32 0, i32 %238, i32 %239, i32 %240
  %246 = load float, ptr %245, align 4, !invariant.load !74
  %multiply.951 = fmul float %244, %246
  %add.1052 = fadd float %242, %multiply.951
  %add.1753 = fadd float %237, %add.1052
  br label %concatenate.19.merge49

concat_index_from_operand_id154:                  ; preds = %concatenate.pivot.16.57
  %247 = phi i32 [ 16, %concatenate.pivot.16.57 ]
  %248 = sub nsw i32 %183, %247
  %249 = add i32 %184, 0
  %250 = add i32 %248, 16
  %251 = add i32 %222, 0
  %252 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %249, i32 %250, i32 %251
  %253 = load float, ptr %252, align 4, !invariant.load !74
  br label %concatenate.19.merge49

concatenate.pivot.16.55:                          ; preds = %concat_index_from_operand_id148
  %254 = icmp ult i32 %183, 16
  br i1 %254, label %concatenate.pivot.0.56, label %concatenate.pivot.16.57

concatenate.pivot.0.56:                           ; preds = %concatenate.pivot.16.55
  br label %concat_index_from_operand_id050

concatenate.pivot.16.57:                          ; preds = %concatenate.pivot.16.55
  br label %concat_index_from_operand_id154

concatenate.19.merge49:                           ; preds = %concat_index_from_operand_id154, %concat_index_from_operand_id050
  %255 = phi float [ %add.1753, %concat_index_from_operand_id050 ], [ %253, %concat_index_from_operand_id154 ]
  br label %concatenate.20.merge37

concatenate.pivot.128.58:                         ; preds = %concatenate.20.merge13
  %256 = icmp ult i32 %179, 128
  br i1 %256, label %concatenate.pivot.0.59, label %concatenate.pivot.128.60

concatenate.pivot.0.59:                           ; preds = %concatenate.pivot.128.58
  br label %concat_index_from_operand_id038

concatenate.pivot.128.60:                         ; preds = %concatenate.pivot.128.58
  br label %concat_index_from_operand_id148

concatenate.20.merge37:                           ; preds = %concatenate.19.merge49, %concatenate.14.merge39
  %257 = phi float [ %220, %concatenate.14.merge39 ], [ %255, %concatenate.19.merge49 ]
  %258 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %257, ptr %258, align 4
  %259 = mul nuw nsw i32 %13, 1
  %260 = add nuw nsw i32 0, %259
  %261 = udiv i32 %260, 168
  %262 = mul nuw nsw i32 %14, 1
  %263 = add nuw nsw i32 0, %262
  %264 = urem i32 %263, 100
  %265 = udiv i32 %263, 100
  %266 = udiv i32 %265, 8192
  br label %concatenate.pivot.128.82

concat_index_from_operand_id062:                  ; preds = %concatenate.pivot.0.83
  %267 = phi i32 [ 0, %concatenate.pivot.0.83 ]
  %268 = sub nsw i32 %260, %267
  %269 = udiv i32 %linear_index3, 168
  %270 = mul i32 %269, 128
  %271 = add i32 %270, %268
  %272 = udiv i32 %271, 1
  %273 = urem i32 %272, 128
  %274 = udiv i32 %271, 128
  %275 = urem i32 %274, 100
  %276 = udiv i32 %271, 12800
  br label %concatenate.pivot.16.69

concat_index_from_operand_id064:                  ; preds = %concatenate.pivot.0.70
  %277 = phi i32 [ 0, %concatenate.pivot.0.70 ]
  %278 = sub nsw i32 %264, %277
  %279 = add i32 %265, 0
  %280 = add i32 %278, 0
  %281 = add i32 %268, 0
  %282 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %279, i32 %280, i32 %281
  %283 = load float, ptr %282, align 4, !invariant.load !74
  %284 = add i32 %265, 0
  %285 = add i32 %278, 0
  %286 = add i32 %268, 0
  %287 = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %286
  %288 = load float, ptr %287, align 4, !invariant.load !74
  %289 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %286
  %290 = load float, ptr %289, align 4, !invariant.load !74
  %291 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr %arg2, i32 0, i32 %284, i32 %285, i32 %286
  %292 = load float, ptr %291, align 4, !invariant.load !74
  %multiply.965 = fmul float %290, %292
  %add.1066 = fadd float %288, %multiply.965
  %add.1267 = fadd float %283, %add.1066
  br label %concatenate.14.merge63

concat_index_from_operand_id168:                  ; preds = %concatenate.pivot.16.71
  %293 = phi i32 [ 16, %concatenate.pivot.16.71 ]
  %294 = sub nsw i32 %264, %293
  %295 = add i32 %265, 0
  %296 = add i32 %294, 16
  %297 = add i32 %268, 0
  %298 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr %arg1, i32 0, i32 %295, i32 %296, i32 %297
  %299 = load float, ptr %298, align 4, !invariant.load !74
  br label %concatenate.14.merge63

concatenate.pivot.16.69:                          ; preds = %concat_index_from_operand_id062
  %300 = icmp ult i32 %264, 16
  br i1 %300, label %concatenate.pivot.0.70, label %concatenate.pivot.16.71

concatenate.pivot.0.70:                           ; preds = %concatenate.pivot.16.69
  br label %concat_index_from_operand_id064

concatenate.pivot.16.71:                          ; preds = %concatenate.pivot.16.69
  br label %concat_index_from_operand_id168

concatenate.14.merge63:                           ; preds = %concat_index_from_operand_id168, %concat_index_from_operand_id064
  %301 = phi float [ %add.1267, %concat_index_from_operand_id064 ], [ %299, %concat_index_from_operand_id168 ]
  br label %concatenate.20.merge61

concat_index_from_operand_id172:                  ; preds = %concatenate.pivot.128.84
  %302 = phi i32 [ 128, %concatenate.pivot.128.84 ]
  %303 = sub nsw i32 %260, %302
  %304 = udiv i32 %linear_index3, 168
  %305 = mul i32 %304, 40
  %306 = add i32 %305, %303
  %307 = udiv i32 %306, 1
  %308 = urem i32 %307, 40
  %309 = udiv i32 %306, 40
  %310 = urem i32 %309, 100
  %311 = udiv i32 %306, 4000
  br label %concatenate.pivot.16.79

concat_index_from_operand_id074:                  ; preds = %concatenate.pivot.0.80
  %312 = phi i32 [ 0, %concatenate.pivot.0.80 ]
  %313 = sub nsw i32 %264, %312
  %314 = add i32 %265, 0
  %315 = add i32 %313, 0
  %316 = add i32 %303, 0
  %317 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %314, i32 %315, i32 %316
  %318 = load float, ptr %317, align 4, !invariant.load !74
  %319 = add i32 %265, 0
  %320 = add i32 %313, 0
  %321 = add i32 %303, 128
  %322 = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %321
  %323 = load float, ptr %322, align 4, !invariant.load !74
  %324 = getelementptr inbounds [168 x float], ptr %arg3, i32 0, i32 %321
  %325 = load float, ptr %324, align 4, !invariant.load !74
  %326 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr %arg2, i32 0, i32 %319, i32 %320, i32 %321
  %327 = load float, ptr %326, align 4, !invariant.load !74
  %multiply.975 = fmul float %325, %327
  %add.1076 = fadd float %323, %multiply.975
  %add.1777 = fadd float %318, %add.1076
  br label %concatenate.19.merge73

concat_index_from_operand_id178:                  ; preds = %concatenate.pivot.16.81
  %328 = phi i32 [ 16, %concatenate.pivot.16.81 ]
  %329 = sub nsw i32 %264, %328
  %330 = add i32 %265, 0
  %331 = add i32 %329, 16
  %332 = add i32 %303, 0
  %333 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr %arg0, i32 0, i32 %330, i32 %331, i32 %332
  %334 = load float, ptr %333, align 4, !invariant.load !74
  br label %concatenate.19.merge73

concatenate.pivot.16.79:                          ; preds = %concat_index_from_operand_id172
  %335 = icmp ult i32 %264, 16
  br i1 %335, label %concatenate.pivot.0.80, label %concatenate.pivot.16.81

concatenate.pivot.0.80:                           ; preds = %concatenate.pivot.16.79
  br label %concat_index_from_operand_id074

concatenate.pivot.16.81:                          ; preds = %concatenate.pivot.16.79
  br label %concat_index_from_operand_id178

concatenate.19.merge73:                           ; preds = %concat_index_from_operand_id178, %concat_index_from_operand_id074
  %336 = phi float [ %add.1777, %concat_index_from_operand_id074 ], [ %334, %concat_index_from_operand_id178 ]
  br label %concatenate.20.merge61

concatenate.pivot.128.82:                         ; preds = %concatenate.20.merge37
  %337 = icmp ult i32 %260, 128
  br i1 %337, label %concatenate.pivot.0.83, label %concatenate.pivot.128.84

concatenate.pivot.0.83:                           ; preds = %concatenate.pivot.128.82
  br label %concat_index_from_operand_id062

concatenate.pivot.128.84:                         ; preds = %concatenate.pivot.128.82
  br label %concat_index_from_operand_id172

concatenate.20.merge61:                           ; preds = %concatenate.19.merge73, %concatenate.14.merge63
  %338 = phi float [ %301, %concatenate.14.merge63 ], [ %336, %concatenate.19.merge73 ]
  %339 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %338, ptr %339, align 4
  br label %fusion_7.in_bounds-after
}

define void @fusion_5(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(209715200) %arg1, ptr noalias align 16 dereferenceable(26214400) %arg2, ptr noalias align 16 dereferenceable(209715200) %arg3, ptr noalias align 128 dereferenceable(655360000) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !114
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 40960000
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 200
  %5 = udiv i32 %linear_index_base, 200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 200
  %8 = udiv i32 %linear_index1, 200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 200
  %11 = udiv i32 %linear_index2, 200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 200
  %14 = udiv i32 %linear_index3, 200
  %15 = icmp ult i32 %linear_index_base, 163840000
  br i1 %15, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %concatenate.5.merge28, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 200
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 100
  %22 = udiv i32 %20, 100
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 200
  %27 = mul i32 %26, 64
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 64
  %31 = udiv i32 %28, 64
  %32 = urem i32 %31, 100
  %33 = udiv i32 %28, 6400
  %34 = getelementptr inbounds float, ptr %arg0, i32 %28
  %35 = load float, ptr %34, align 4, !invariant.load !74
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %36 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %37 = sub nsw i32 %17, %36
  %38 = udiv i32 %linear_index_base, 200
  %39 = mul i32 %38, 64
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 64
  %43 = udiv i32 %40, 64
  %44 = urem i32 %43, 100
  %45 = udiv i32 %40, 6400
  %46 = getelementptr inbounds float, ptr %arg1, i32 %40
  %47 = load float, ptr %46, align 4, !invariant.load !74
  br label %concatenate.5.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.128.2
  %48 = phi i32 [ 128, %concatenate.pivot.128.2 ]
  %49 = sub nsw i32 %17, %48
  %50 = udiv i32 %linear_index_base, 200
  %51 = mul i32 %50, 8
  %52 = add i32 %51, %49
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 8
  %55 = udiv i32 %52, 8
  %56 = urem i32 %55, 100
  %57 = udiv i32 %52, 800
  %58 = getelementptr inbounds float, ptr %arg2, i32 %52
  %59 = load float, ptr %58, align 4, !invariant.load !74
  br label %concatenate.5.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.136.3
  %60 = phi i32 [ 136, %concatenate.pivot.136.3 ]
  %61 = sub nsw i32 %17, %60
  %62 = udiv i32 %linear_index_base, 200
  %63 = mul i32 %62, 64
  %64 = add i32 %63, %61
  %65 = udiv i32 %64, 1
  %66 = urem i32 %65, 64
  %67 = udiv i32 %64, 64
  %68 = urem i32 %67, 100
  %69 = udiv i32 %64, 6400
  %70 = getelementptr inbounds float, ptr %arg3, i32 %64
  %71 = load float, ptr %70, align 4, !invariant.load !74
  br label %concatenate.5.merge

concatenate.pivot.128.:                           ; preds = %fusion_5.in_bounds-true
  %72 = icmp ult i32 %17, 128
  br i1 %72, label %concatenate.pivot.64., label %concatenate.pivot.136.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %73 = icmp ult i32 %17, 64
  br i1 %73, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.136.:                           ; preds = %concatenate.pivot.128.
  %74 = icmp ult i32 %17, 136
  br i1 %74, label %concatenate.pivot.128.2, label %concatenate.pivot.136.3

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  br label %concat_index_from_operand_id2

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.136.
  br label %concat_index_from_operand_id3

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %75 = phi float [ %35, %concat_index_from_operand_id0 ], [ %47, %concat_index_from_operand_id1 ], [ %59, %concat_index_from_operand_id2 ], [ %71, %concat_index_from_operand_id3 ]
  %76 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %75, ptr %76, align 4
  %77 = mul nuw nsw i32 %7, 1
  %78 = add nuw nsw i32 0, %77
  %79 = udiv i32 %78, 200
  %80 = mul nuw nsw i32 %8, 1
  %81 = add nuw nsw i32 0, %80
  %82 = urem i32 %81, 100
  %83 = udiv i32 %81, 100
  %84 = udiv i32 %83, 8192
  br label %concatenate.pivot.128.9

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.11
  %85 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %86 = sub nsw i32 %78, %85
  %87 = udiv i32 %linear_index1, 200
  %88 = mul i32 %87, 64
  %89 = add i32 %88, %86
  %90 = udiv i32 %89, 1
  %91 = urem i32 %90, 64
  %92 = udiv i32 %89, 64
  %93 = urem i32 %92, 100
  %94 = udiv i32 %89, 6400
  %95 = getelementptr inbounds float, ptr %arg0, i32 %89
  %96 = load float, ptr %95, align 4, !invariant.load !74
  br label %concatenate.5.merge4

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.64.12
  %97 = phi i32 [ 64, %concatenate.pivot.64.12 ]
  %98 = sub nsw i32 %78, %97
  %99 = udiv i32 %linear_index1, 200
  %100 = mul i32 %99, 64
  %101 = add i32 %100, %98
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 64
  %104 = udiv i32 %101, 64
  %105 = urem i32 %104, 100
  %106 = udiv i32 %101, 6400
  %107 = getelementptr inbounds float, ptr %arg1, i32 %101
  %108 = load float, ptr %107, align 4, !invariant.load !74
  br label %concatenate.5.merge4

concat_index_from_operand_id27:                   ; preds = %concatenate.pivot.128.14
  %109 = phi i32 [ 128, %concatenate.pivot.128.14 ]
  %110 = sub nsw i32 %78, %109
  %111 = udiv i32 %linear_index1, 200
  %112 = mul i32 %111, 8
  %113 = add i32 %112, %110
  %114 = udiv i32 %113, 1
  %115 = urem i32 %114, 8
  %116 = udiv i32 %113, 8
  %117 = urem i32 %116, 100
  %118 = udiv i32 %113, 800
  %119 = getelementptr inbounds float, ptr %arg2, i32 %113
  %120 = load float, ptr %119, align 4, !invariant.load !74
  br label %concatenate.5.merge4

concat_index_from_operand_id38:                   ; preds = %concatenate.pivot.136.15
  %121 = phi i32 [ 136, %concatenate.pivot.136.15 ]
  %122 = sub nsw i32 %78, %121
  %123 = udiv i32 %linear_index1, 200
  %124 = mul i32 %123, 64
  %125 = add i32 %124, %122
  %126 = udiv i32 %125, 1
  %127 = urem i32 %126, 64
  %128 = udiv i32 %125, 64
  %129 = urem i32 %128, 100
  %130 = udiv i32 %125, 6400
  %131 = getelementptr inbounds float, ptr %arg3, i32 %125
  %132 = load float, ptr %131, align 4, !invariant.load !74
  br label %concatenate.5.merge4

concatenate.pivot.128.9:                          ; preds = %concatenate.5.merge
  %133 = icmp ult i32 %78, 128
  br i1 %133, label %concatenate.pivot.64.10, label %concatenate.pivot.136.13

concatenate.pivot.64.10:                          ; preds = %concatenate.pivot.128.9
  %134 = icmp ult i32 %78, 64
  br i1 %134, label %concatenate.pivot.0.11, label %concatenate.pivot.64.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.64.10
  br label %concat_index_from_operand_id05

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.64.10
  br label %concat_index_from_operand_id16

concatenate.pivot.136.13:                         ; preds = %concatenate.pivot.128.9
  %135 = icmp ult i32 %78, 136
  br i1 %135, label %concatenate.pivot.128.14, label %concatenate.pivot.136.15

concatenate.pivot.128.14:                         ; preds = %concatenate.pivot.136.13
  br label %concat_index_from_operand_id27

concatenate.pivot.136.15:                         ; preds = %concatenate.pivot.136.13
  br label %concat_index_from_operand_id38

concatenate.5.merge4:                             ; preds = %concat_index_from_operand_id38, %concat_index_from_operand_id27, %concat_index_from_operand_id16, %concat_index_from_operand_id05
  %136 = phi float [ %96, %concat_index_from_operand_id05 ], [ %108, %concat_index_from_operand_id16 ], [ %120, %concat_index_from_operand_id27 ], [ %132, %concat_index_from_operand_id38 ]
  %137 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %136, ptr %137, align 4
  %138 = mul nuw nsw i32 %10, 1
  %139 = add nuw nsw i32 0, %138
  %140 = udiv i32 %139, 200
  %141 = mul nuw nsw i32 %11, 1
  %142 = add nuw nsw i32 0, %141
  %143 = urem i32 %142, 100
  %144 = udiv i32 %142, 100
  %145 = udiv i32 %144, 8192
  br label %concatenate.pivot.128.21

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.23
  %146 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %147 = sub nsw i32 %139, %146
  %148 = udiv i32 %linear_index2, 200
  %149 = mul i32 %148, 64
  %150 = add i32 %149, %147
  %151 = udiv i32 %150, 1
  %152 = urem i32 %151, 64
  %153 = udiv i32 %150, 64
  %154 = urem i32 %153, 100
  %155 = udiv i32 %150, 6400
  %156 = getelementptr inbounds float, ptr %arg0, i32 %150
  %157 = load float, ptr %156, align 4, !invariant.load !74
  br label %concatenate.5.merge16

concat_index_from_operand_id118:                  ; preds = %concatenate.pivot.64.24
  %158 = phi i32 [ 64, %concatenate.pivot.64.24 ]
  %159 = sub nsw i32 %139, %158
  %160 = udiv i32 %linear_index2, 200
  %161 = mul i32 %160, 64
  %162 = add i32 %161, %159
  %163 = udiv i32 %162, 1
  %164 = urem i32 %163, 64
  %165 = udiv i32 %162, 64
  %166 = urem i32 %165, 100
  %167 = udiv i32 %162, 6400
  %168 = getelementptr inbounds float, ptr %arg1, i32 %162
  %169 = load float, ptr %168, align 4, !invariant.load !74
  br label %concatenate.5.merge16

concat_index_from_operand_id219:                  ; preds = %concatenate.pivot.128.26
  %170 = phi i32 [ 128, %concatenate.pivot.128.26 ]
  %171 = sub nsw i32 %139, %170
  %172 = udiv i32 %linear_index2, 200
  %173 = mul i32 %172, 8
  %174 = add i32 %173, %171
  %175 = udiv i32 %174, 1
  %176 = urem i32 %175, 8
  %177 = udiv i32 %174, 8
  %178 = urem i32 %177, 100
  %179 = udiv i32 %174, 800
  %180 = getelementptr inbounds float, ptr %arg2, i32 %174
  %181 = load float, ptr %180, align 4, !invariant.load !74
  br label %concatenate.5.merge16

concat_index_from_operand_id320:                  ; preds = %concatenate.pivot.136.27
  %182 = phi i32 [ 136, %concatenate.pivot.136.27 ]
  %183 = sub nsw i32 %139, %182
  %184 = udiv i32 %linear_index2, 200
  %185 = mul i32 %184, 64
  %186 = add i32 %185, %183
  %187 = udiv i32 %186, 1
  %188 = urem i32 %187, 64
  %189 = udiv i32 %186, 64
  %190 = urem i32 %189, 100
  %191 = udiv i32 %186, 6400
  %192 = getelementptr inbounds float, ptr %arg3, i32 %186
  %193 = load float, ptr %192, align 4, !invariant.load !74
  br label %concatenate.5.merge16

concatenate.pivot.128.21:                         ; preds = %concatenate.5.merge4
  %194 = icmp ult i32 %139, 128
  br i1 %194, label %concatenate.pivot.64.22, label %concatenate.pivot.136.25

concatenate.pivot.64.22:                          ; preds = %concatenate.pivot.128.21
  %195 = icmp ult i32 %139, 64
  br i1 %195, label %concatenate.pivot.0.23, label %concatenate.pivot.64.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.64.22
  br label %concat_index_from_operand_id017

concatenate.pivot.64.24:                          ; preds = %concatenate.pivot.64.22
  br label %concat_index_from_operand_id118

concatenate.pivot.136.25:                         ; preds = %concatenate.pivot.128.21
  %196 = icmp ult i32 %139, 136
  br i1 %196, label %concatenate.pivot.128.26, label %concatenate.pivot.136.27

concatenate.pivot.128.26:                         ; preds = %concatenate.pivot.136.25
  br label %concat_index_from_operand_id219

concatenate.pivot.136.27:                         ; preds = %concatenate.pivot.136.25
  br label %concat_index_from_operand_id320

concatenate.5.merge16:                            ; preds = %concat_index_from_operand_id320, %concat_index_from_operand_id219, %concat_index_from_operand_id118, %concat_index_from_operand_id017
  %197 = phi float [ %157, %concat_index_from_operand_id017 ], [ %169, %concat_index_from_operand_id118 ], [ %181, %concat_index_from_operand_id219 ], [ %193, %concat_index_from_operand_id320 ]
  %198 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %197, ptr %198, align 4
  %199 = mul nuw nsw i32 %13, 1
  %200 = add nuw nsw i32 0, %199
  %201 = udiv i32 %200, 200
  %202 = mul nuw nsw i32 %14, 1
  %203 = add nuw nsw i32 0, %202
  %204 = urem i32 %203, 100
  %205 = udiv i32 %203, 100
  %206 = udiv i32 %205, 8192
  br label %concatenate.pivot.128.33

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.35
  %207 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %208 = sub nsw i32 %200, %207
  %209 = udiv i32 %linear_index3, 200
  %210 = mul i32 %209, 64
  %211 = add i32 %210, %208
  %212 = udiv i32 %211, 1
  %213 = urem i32 %212, 64
  %214 = udiv i32 %211, 64
  %215 = urem i32 %214, 100
  %216 = udiv i32 %211, 6400
  %217 = getelementptr inbounds float, ptr %arg0, i32 %211
  %218 = load float, ptr %217, align 4, !invariant.load !74
  br label %concatenate.5.merge28

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.64.36
  %219 = phi i32 [ 64, %concatenate.pivot.64.36 ]
  %220 = sub nsw i32 %200, %219
  %221 = udiv i32 %linear_index3, 200
  %222 = mul i32 %221, 64
  %223 = add i32 %222, %220
  %224 = udiv i32 %223, 1
  %225 = urem i32 %224, 64
  %226 = udiv i32 %223, 64
  %227 = urem i32 %226, 100
  %228 = udiv i32 %223, 6400
  %229 = getelementptr inbounds float, ptr %arg1, i32 %223
  %230 = load float, ptr %229, align 4, !invariant.load !74
  br label %concatenate.5.merge28

concat_index_from_operand_id231:                  ; preds = %concatenate.pivot.128.38
  %231 = phi i32 [ 128, %concatenate.pivot.128.38 ]
  %232 = sub nsw i32 %200, %231
  %233 = udiv i32 %linear_index3, 200
  %234 = mul i32 %233, 8
  %235 = add i32 %234, %232
  %236 = udiv i32 %235, 1
  %237 = urem i32 %236, 8
  %238 = udiv i32 %235, 8
  %239 = urem i32 %238, 100
  %240 = udiv i32 %235, 800
  %241 = getelementptr inbounds float, ptr %arg2, i32 %235
  %242 = load float, ptr %241, align 4, !invariant.load !74
  br label %concatenate.5.merge28

concat_index_from_operand_id332:                  ; preds = %concatenate.pivot.136.39
  %243 = phi i32 [ 136, %concatenate.pivot.136.39 ]
  %244 = sub nsw i32 %200, %243
  %245 = udiv i32 %linear_index3, 200
  %246 = mul i32 %245, 64
  %247 = add i32 %246, %244
  %248 = udiv i32 %247, 1
  %249 = urem i32 %248, 64
  %250 = udiv i32 %247, 64
  %251 = urem i32 %250, 100
  %252 = udiv i32 %247, 6400
  %253 = getelementptr inbounds float, ptr %arg3, i32 %247
  %254 = load float, ptr %253, align 4, !invariant.load !74
  br label %concatenate.5.merge28

concatenate.pivot.128.33:                         ; preds = %concatenate.5.merge16
  %255 = icmp ult i32 %200, 128
  br i1 %255, label %concatenate.pivot.64.34, label %concatenate.pivot.136.37

concatenate.pivot.64.34:                          ; preds = %concatenate.pivot.128.33
  %256 = icmp ult i32 %200, 64
  br i1 %256, label %concatenate.pivot.0.35, label %concatenate.pivot.64.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.64.34
  br label %concat_index_from_operand_id029

concatenate.pivot.64.36:                          ; preds = %concatenate.pivot.64.34
  br label %concat_index_from_operand_id130

concatenate.pivot.136.37:                         ; preds = %concatenate.pivot.128.33
  %257 = icmp ult i32 %200, 136
  br i1 %257, label %concatenate.pivot.128.38, label %concatenate.pivot.136.39

concatenate.pivot.128.38:                         ; preds = %concatenate.pivot.136.37
  br label %concat_index_from_operand_id231

concatenate.pivot.136.39:                         ; preds = %concatenate.pivot.136.37
  br label %concat_index_from_operand_id332

concatenate.5.merge28:                            ; preds = %concat_index_from_operand_id332, %concat_index_from_operand_id231, %concat_index_from_operand_id130, %concat_index_from_operand_id029
  %258 = phi float [ %218, %concat_index_from_operand_id029 ], [ %230, %concat_index_from_operand_id130 ], [ %242, %concat_index_from_operand_id231 ], [ %254, %concat_index_from_operand_id332 ]
  %259 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %258, ptr %259, align 4
  br label %fusion_5.in_bounds-after
}

define void @fusion_4(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(838860800) %arg1, ptr noalias align 128 dereferenceable(13107200) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !73
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_13_constant_7 = load float, ptr @12, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_13_constant_7, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !86
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !115
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !116

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
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
  %43 = mul nuw nsw i32 %39, 64
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 209715200
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 256
  %52 = urem i32 %51, 100
  %53 = udiv i32 %46, 25600
  %54 = mul nuw nsw i32 %48, 1
  %55 = add nuw nsw i32 0, %54
  %56 = mul nuw nsw i32 %50, 64
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 256
  %59 = mul nuw nsw i32 %53, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 8192
  %Arg_0.1 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %60, i32 %57
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  %62 = mul nuw nsw i32 %48, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %50, 64
  %65 = add nuw nsw i32 %63, %64
  %66 = udiv i32 %65, 256
  %67 = mul nuw nsw i32 %52, 1
  %68 = add nuw nsw i32 0, %67
  %69 = mul nuw nsw i32 %53, 100
  %70 = add nuw nsw i32 %68, %69
  %71 = udiv i32 %70, 819200
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !74
  %multiply.6 = fmul float %Arg_0.13, %Arg_1.24
  store float %multiply.6, ptr %reduction_input_address, align 4
  %72 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_8(ptr %72, ptr %reduction_input_address, ptr %return_buffer)
  %73 = load float, ptr %return_buffer, align 4
  store float %73, ptr %72, align 4
  br label %tile_loop.loop_header, !llvm.loop !117

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %74 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %75 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %75, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %76 = icmp eq i32 %tile_loop.indvar9, 0
  %77 = mul i32 %tile_loop.indvar9, 32
  %78 = add i32 %77, 0
  %x_loc11 = add i32 %78, %74
  %79 = add i32 %tile_origin.1, %y_in_tile.indvar
  %80 = add i32 %tile_origin.2, %x_loc11
  %81 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %81, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !118

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %82 = mul nuw nsw i32 %80, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %79, 64
  %85 = add nuw nsw i32 %83, %84
  %86 = mul nuw nsw i32 %tile_origin.0, 209715200
  %87 = add nuw nsw i32 %85, %86
  %88 = udiv i32 %87, 1
  %89 = urem i32 %88, 64
  %90 = udiv i32 %87, 64
  %91 = urem i32 %90, 4
  %92 = udiv i32 %87, 256
  %93 = urem i32 %92, 100
  %94 = udiv i32 %87, 25600
  %95 = mul nuw nsw i32 %89, 1
  %96 = add nuw nsw i32 0, %95
  %97 = mul nuw nsw i32 %91, 64
  %98 = add nuw nsw i32 %96, %97
  %99 = udiv i32 %98, 256
  %100 = mul nuw nsw i32 %94, 1
  %101 = add nuw nsw i32 0, %100
  %102 = udiv i32 %101, 8192
  %Arg_0.112 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %101, i32 %98
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !74
  %103 = mul nuw nsw i32 %89, 1
  %104 = add nuw nsw i32 0, %103
  %105 = mul nuw nsw i32 %91, 64
  %106 = add nuw nsw i32 %104, %105
  %107 = udiv i32 %106, 256
  %108 = mul nuw nsw i32 %93, 1
  %109 = add nuw nsw i32 0, %108
  %110 = mul nuw nsw i32 %94, 100
  %111 = add nuw nsw i32 %109, %110
  %112 = udiv i32 %111, 819200
  %Arg_1.214 = getelementptr inbounds float, ptr %arg1, i32 %87
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !74
  %multiply.616 = fmul float %Arg_0.113, %Arg_1.215
  store float %multiply.616, ptr %reduction_input_address, align 4
  %113 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_8(ptr %113, ptr %reduction_input_address, ptr %return_buffer17)
  %114 = load float, ptr %return_buffer17, align 4
  store float %114, ptr %113, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %115 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %6, i32 0, i32 %31
  %116 = addrspacecast ptr addrspace(3) %115 to ptr
  %117 = load float, ptr %current_output, align 4
  store float %117, ptr %116, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %118 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %6, i32 0, i32 %lane_id
  %119 = addrspacecast ptr addrspace(3) %118 to ptr
  store float %region_0_13_constant_7, ptr %initial_value_addr, align 4
  %120 = icmp ult i32 %thread_id.x, 1
  %121 = select i1 %120, ptr %119, ptr %initial_value_addr
  %122 = icmp eq i32 %thread_id.x, 0
  br i1 %122, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %123 = mul i32 %thread_id.x, 1
  %124 = add i32 %tile_origin.1, %thread_id.y
  %125 = add i32 %tile_origin.2, %123
  %126 = add i32 %125, 0
  %127 = udiv i32 %124, 1
  %128 = urem i32 %127, 4
  %129 = udiv i32 %124, 4
  %130 = urem i32 %129, 100
  %131 = udiv i32 %124, 400
  %output_element_address = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg2, i32 0, i32 %131, i32 %128, i32 %130
  %output = load float, ptr %121, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_8(ptr dereferenceable(4) %Arg_0.9.typed, ptr dereferenceable(4) %Arg_1.10.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.11.typed = alloca float, align 4
  %Arg_0.9 = load float, ptr %Arg_0.9.typed, align 4
  %Arg_1.10 = load float, ptr %Arg_1.10.typed, align 4
  %add.11 = fadd float %Arg_0.9, %Arg_1.10
  store float %add.11, ptr %add.11.typed, align 4
  %load_ret_value = load float, ptr %add.11.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_3(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 16 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(16) %arg5, ptr noalias align 16 dereferenceable(3276800) %arg6, ptr noalias align 16 dereferenceable(16) %arg7, ptr noalias align 16 dereferenceable(3276800) %arg8, ptr noalias align 16 dereferenceable(16) %arg9, ptr noalias align 16 dereferenceable(3276800) %arg10, ptr noalias align 128 dereferenceable(13107200) %arg11) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 100
  %5 = udiv i32 %linear_index_base, 100
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 100
  %10 = udiv i32 %linear_index1, 100
  %11 = urem i32 %10, 4
  %12 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 100
  %15 = udiv i32 %linear_index2, 100
  %16 = urem i32 %15, 4
  %17 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 100
  %20 = udiv i32 %linear_index3, 100
  %21 = urem i32 %20, 4
  %22 = udiv i32 %linear_index3, 400
  %23 = icmp ult i32 %linear_index_base, 3276800
  br i1 %23, label %fusion_3.in_bounds-true, label %fusion_3.in_bounds-after

fusion_3.in_bounds-after:                         ; preds = %fusion_3.in_bounds-true, %entry
  ret void

fusion_3.in_bounds-true:                          ; preds = %entry
  %24 = mul nuw nsw i32 %6, 1
  %25 = add nuw nsw i32 0, %24
  %26 = udiv i32 %25, 4
  %27 = mul nuw nsw i32 %4, 1
  %28 = add nuw nsw i32 0, %27
  %29 = mul nuw nsw i32 %7, 100
  %30 = add nuw nsw i32 %28, %29
  %31 = udiv i32 %30, 819200
  %32 = mul nuw nsw i32 %30, 1
  %33 = add nuw nsw i32 0, %32
  %34 = urem i32 %33, 100
  %35 = udiv i32 %33, 100
  %36 = udiv i32 %35, 8192
  %37 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %35, i32 %34, i32 0
  %38 = load float, ptr %37, align 4, !invariant.load !74
  %39 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %25
  %40 = load float, ptr %39, align 4, !invariant.load !74
  %multiply.16 = fmul float %38, %40
  %41 = mul nuw nsw i32 %30, 1
  %42 = add nuw nsw i32 0, %41
  %43 = urem i32 %42, 100
  %44 = udiv i32 %42, 100
  %45 = udiv i32 %44, 8192
  %46 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %44, i32 %43, i32 0
  %47 = load float, ptr %46, align 4, !invariant.load !74
  %48 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %25
  %49 = load float, ptr %48, align 4, !invariant.load !74
  %multiply.21 = fmul float %47, %49
  %add.22 = fadd float %multiply.16, %multiply.21
  %50 = mul nuw nsw i32 %30, 1
  %51 = add nuw nsw i32 0, %50
  %52 = urem i32 %51, 100
  %53 = udiv i32 %51, 100
  %54 = udiv i32 %53, 8192
  %55 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %53, i32 %52, i32 0
  %56 = load float, ptr %55, align 4, !invariant.load !74
  %57 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %25
  %58 = load float, ptr %57, align 4, !invariant.load !74
  %multiply.27 = fmul float %56, %58
  %add.28 = fadd float %add.22, %multiply.27
  %59 = mul nuw nsw i32 %30, 1
  %60 = add nuw nsw i32 0, %59
  %61 = urem i32 %60, 100
  %62 = udiv i32 %60, 100
  %63 = udiv i32 %62, 8192
  %64 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %62, i32 %61, i32 0
  %65 = load float, ptr %64, align 4, !invariant.load !74
  %66 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %25
  %67 = load float, ptr %66, align 4, !invariant.load !74
  %multiply.33 = fmul float %65, %67
  %add.34 = fadd float %add.28, %multiply.33
  %68 = load float, ptr %arg2, align 4, !invariant.load !74
  %69 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %70 = load float, ptr %69, align 4, !invariant.load !74
  %multiply.39 = fmul float %68, %70
  %add.40 = fadd float %add.34, %multiply.39
  %71 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %6
  %72 = load float, ptr %71, align 4, !invariant.load !74
  %add.42 = fadd float %add.40, %72
  %73 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  store float %add.42, ptr %73, align 4
  %74 = mul nuw nsw i32 %11, 1
  %75 = add nuw nsw i32 0, %74
  %76 = udiv i32 %75, 4
  %77 = mul nuw nsw i32 %9, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %12, 100
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 819200
  %82 = mul nuw nsw i32 %80, 1
  %83 = add nuw nsw i32 0, %82
  %84 = urem i32 %83, 100
  %85 = udiv i32 %83, 100
  %86 = udiv i32 %85, 8192
  %87 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %85, i32 %84, i32 0
  %88 = load float, ptr %87, align 4, !invariant.load !74
  %89 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %75
  %90 = load float, ptr %89, align 4, !invariant.load !74
  %multiply.161 = fmul float %88, %90
  %91 = mul nuw nsw i32 %80, 1
  %92 = add nuw nsw i32 0, %91
  %93 = urem i32 %92, 100
  %94 = udiv i32 %92, 100
  %95 = udiv i32 %94, 8192
  %96 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %94, i32 %93, i32 0
  %97 = load float, ptr %96, align 4, !invariant.load !74
  %98 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %75
  %99 = load float, ptr %98, align 4, !invariant.load !74
  %multiply.212 = fmul float %97, %99
  %add.223 = fadd float %multiply.161, %multiply.212
  %100 = mul nuw nsw i32 %80, 1
  %101 = add nuw nsw i32 0, %100
  %102 = urem i32 %101, 100
  %103 = udiv i32 %101, 100
  %104 = udiv i32 %103, 8192
  %105 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %103, i32 %102, i32 0
  %106 = load float, ptr %105, align 4, !invariant.load !74
  %107 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %75
  %108 = load float, ptr %107, align 4, !invariant.load !74
  %multiply.274 = fmul float %106, %108
  %add.285 = fadd float %add.223, %multiply.274
  %109 = mul nuw nsw i32 %80, 1
  %110 = add nuw nsw i32 0, %109
  %111 = urem i32 %110, 100
  %112 = udiv i32 %110, 100
  %113 = udiv i32 %112, 8192
  %114 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %112, i32 %111, i32 0
  %115 = load float, ptr %114, align 4, !invariant.load !74
  %116 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %75
  %117 = load float, ptr %116, align 4, !invariant.load !74
  %multiply.336 = fmul float %115, %117
  %add.347 = fadd float %add.285, %multiply.336
  %118 = load float, ptr %arg2, align 4, !invariant.load !74
  %119 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %120 = load float, ptr %119, align 4, !invariant.load !74
  %multiply.398 = fmul float %118, %120
  %add.409 = fadd float %add.347, %multiply.398
  %121 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %11
  %122 = load float, ptr %121, align 4, !invariant.load !74
  %add.4210 = fadd float %add.409, %122
  %123 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  store float %add.4210, ptr %123, align 4
  %124 = mul nuw nsw i32 %16, 1
  %125 = add nuw nsw i32 0, %124
  %126 = udiv i32 %125, 4
  %127 = mul nuw nsw i32 %14, 1
  %128 = add nuw nsw i32 0, %127
  %129 = mul nuw nsw i32 %17, 100
  %130 = add nuw nsw i32 %128, %129
  %131 = udiv i32 %130, 819200
  %132 = mul nuw nsw i32 %130, 1
  %133 = add nuw nsw i32 0, %132
  %134 = urem i32 %133, 100
  %135 = udiv i32 %133, 100
  %136 = udiv i32 %135, 8192
  %137 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %135, i32 %134, i32 0
  %138 = load float, ptr %137, align 4, !invariant.load !74
  %139 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %125
  %140 = load float, ptr %139, align 4, !invariant.load !74
  %multiply.1611 = fmul float %138, %140
  %141 = mul nuw nsw i32 %130, 1
  %142 = add nuw nsw i32 0, %141
  %143 = urem i32 %142, 100
  %144 = udiv i32 %142, 100
  %145 = udiv i32 %144, 8192
  %146 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %144, i32 %143, i32 0
  %147 = load float, ptr %146, align 4, !invariant.load !74
  %148 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %125
  %149 = load float, ptr %148, align 4, !invariant.load !74
  %multiply.2112 = fmul float %147, %149
  %add.2213 = fadd float %multiply.1611, %multiply.2112
  %150 = mul nuw nsw i32 %130, 1
  %151 = add nuw nsw i32 0, %150
  %152 = urem i32 %151, 100
  %153 = udiv i32 %151, 100
  %154 = udiv i32 %153, 8192
  %155 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %153, i32 %152, i32 0
  %156 = load float, ptr %155, align 4, !invariant.load !74
  %157 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %125
  %158 = load float, ptr %157, align 4, !invariant.load !74
  %multiply.2714 = fmul float %156, %158
  %add.2815 = fadd float %add.2213, %multiply.2714
  %159 = mul nuw nsw i32 %130, 1
  %160 = add nuw nsw i32 0, %159
  %161 = urem i32 %160, 100
  %162 = udiv i32 %160, 100
  %163 = udiv i32 %162, 8192
  %164 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %162, i32 %161, i32 0
  %165 = load float, ptr %164, align 4, !invariant.load !74
  %166 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %125
  %167 = load float, ptr %166, align 4, !invariant.load !74
  %multiply.3316 = fmul float %165, %167
  %add.3417 = fadd float %add.2815, %multiply.3316
  %168 = load float, ptr %arg2, align 4, !invariant.load !74
  %169 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %170 = load float, ptr %169, align 4, !invariant.load !74
  %multiply.3918 = fmul float %168, %170
  %add.4019 = fadd float %add.3417, %multiply.3918
  %171 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %16
  %172 = load float, ptr %171, align 4, !invariant.load !74
  %add.4220 = fadd float %add.4019, %172
  %173 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  store float %add.4220, ptr %173, align 4
  %174 = mul nuw nsw i32 %21, 1
  %175 = add nuw nsw i32 0, %174
  %176 = udiv i32 %175, 4
  %177 = mul nuw nsw i32 %19, 1
  %178 = add nuw nsw i32 0, %177
  %179 = mul nuw nsw i32 %22, 100
  %180 = add nuw nsw i32 %178, %179
  %181 = udiv i32 %180, 819200
  %182 = mul nuw nsw i32 %180, 1
  %183 = add nuw nsw i32 0, %182
  %184 = urem i32 %183, 100
  %185 = udiv i32 %183, 100
  %186 = udiv i32 %185, 8192
  %187 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg10, i32 0, i32 %185, i32 %184, i32 0
  %188 = load float, ptr %187, align 4, !invariant.load !74
  %189 = getelementptr inbounds [1 x [4 x float]], ptr %arg9, i32 0, i32 0, i32 %175
  %190 = load float, ptr %189, align 4, !invariant.load !74
  %multiply.1621 = fmul float %188, %190
  %191 = mul nuw nsw i32 %180, 1
  %192 = add nuw nsw i32 0, %191
  %193 = urem i32 %192, 100
  %194 = udiv i32 %192, 100
  %195 = udiv i32 %194, 8192
  %196 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg8, i32 0, i32 %194, i32 %193, i32 0
  %197 = load float, ptr %196, align 4, !invariant.load !74
  %198 = getelementptr inbounds [1 x [4 x float]], ptr %arg7, i32 0, i32 0, i32 %175
  %199 = load float, ptr %198, align 4, !invariant.load !74
  %multiply.2122 = fmul float %197, %199
  %add.2223 = fadd float %multiply.1621, %multiply.2122
  %200 = mul nuw nsw i32 %180, 1
  %201 = add nuw nsw i32 0, %200
  %202 = urem i32 %201, 100
  %203 = udiv i32 %201, 100
  %204 = udiv i32 %203, 8192
  %205 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg6, i32 0, i32 %203, i32 %202, i32 0
  %206 = load float, ptr %205, align 4, !invariant.load !74
  %207 = getelementptr inbounds [1 x [4 x float]], ptr %arg5, i32 0, i32 0, i32 %175
  %208 = load float, ptr %207, align 4, !invariant.load !74
  %multiply.2724 = fmul float %206, %208
  %add.2825 = fadd float %add.2223, %multiply.2724
  %209 = mul nuw nsw i32 %180, 1
  %210 = add nuw nsw i32 0, %209
  %211 = urem i32 %210, 100
  %212 = udiv i32 %210, 100
  %213 = udiv i32 %212, 8192
  %214 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %212, i32 %211, i32 0
  %215 = load float, ptr %214, align 4, !invariant.load !74
  %216 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %175
  %217 = load float, ptr %216, align 4, !invariant.load !74
  %multiply.3326 = fmul float %215, %217
  %add.3427 = fadd float %add.2825, %multiply.3326
  %218 = load float, ptr %arg2, align 4, !invariant.load !74
  %219 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %220 = load float, ptr %219, align 4, !invariant.load !74
  %multiply.3928 = fmul float %218, %220
  %add.4029 = fadd float %add.3427, %multiply.3928
  %221 = getelementptr inbounds [4 x float], ptr %arg0, i32 0, i32 %21
  %222 = load float, ptr %221, align 4, !invariant.load !74
  %add.4230 = fadd float %add.4029, %222
  %223 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  store float %add.4230, ptr %223, align 4
  br label %fusion_3.in_bounds-after
}

define void @reduce_330(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !73
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !74
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !86
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !120
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit4, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !121

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
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %39, 100
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 3276800
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 100
  %49 = udiv i32 %46, 100
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 400
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_3(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !122

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %54 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address7, align 4
  br label %tile_loop.loop_header5

tile_loop.loop_header5:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar8 = load i32, ptr %tile_loop.invar_address7, align 4
  %55 = icmp uge i32 %tile_loop.indvar8, 16
  br i1 %55, label %tile_loop.loop_exit4, label %tile_loop.loop_body6

tile_loop.loop_body6:                             ; preds = %tile_loop.loop_header5
  %invar.inc9 = add nuw nsw i32 %tile_loop.indvar8, 1
  store i32 %invar.inc9, ptr %tile_loop.invar_address7, align 4
  %56 = icmp eq i32 %tile_loop.indvar8, 0
  %57 = mul i32 %tile_loop.indvar8, 32
  %58 = add i32 %57, 0
  %x_loc10 = add i32 %58, %54
  %59 = add i32 %tile_origin.1, %y_in_tile.indvar
  %60 = add i32 %tile_origin.2, %x_loc10
  %61 = icmp ult i32 %x_loc10, %tile_bound1
  br i1 %61, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body6
  br label %tile_loop.loop_header5, !llvm.loop !123

tile_loop.loop_exit4:                             ; preds = %tile_loop.loop_header5
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body6
  %62 = mul nuw nsw i32 %60, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %59, 100
  %65 = add nuw nsw i32 %63, %64
  %66 = mul nuw nsw i32 %tile_origin.0, 3276800
  %67 = add nuw nsw i32 %65, %66
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 100
  %70 = udiv i32 %67, 100
  %71 = urem i32 %70, 4
  %72 = udiv i32 %67, 400
  %Arg_0.111 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.112 = load float, ptr %Arg_0.111, align 4, !invariant.load !74
  store float %Arg_0.112, ptr %reduction_input_address, align 4
  %73 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_3(ptr %73, ptr %reduction_input_address, ptr %return_buffer13)
  %74 = load float, ptr %return_buffer13, align 4
  store float %74, ptr %73, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %75 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %6, i32 0, i32 %31
  %76 = addrspacecast ptr addrspace(3) %75 to ptr
  %77 = load float, ptr %current_output, align 4
  store float %77, ptr %76, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %78 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %6, i32 0, i32 %lane_id
  %79 = addrspacecast ptr addrspace(3) %78 to ptr
  store float %Arg_1.2, ptr %initial_value_addr, align 4
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

define internal void @region_1_3(ptr dereferenceable(4) %Arg_0.4.typed, ptr dereferenceable(4) %Arg_1.5.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %maximum.6.typed = alloca float, align 4
  %Arg_0.4 = load float, ptr %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, ptr %Arg_1.5.typed, align 4
  %0 = fcmp oge float %Arg_0.4, %Arg_1.5
  %1 = fcmp une float %Arg_0.4, %Arg_0.4
  %2 = or i1 %0, %1
  %maximum.6 = select i1 %2, float %Arg_0.4, float %Arg_1.5
  store float %maximum.6, ptr %maximum.6.typed, align 4
  %load_ret_value = load float, ptr %maximum.6.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_34(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !73
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @13, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !86
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !120
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
  br label %y_in_tile.loop_header, !llvm.loop !124

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
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
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 400
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  %52 = udiv i32 %46, 100
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %52
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !74
  %subtract.4 = fsub float %Arg_0.13, %Arg_1.24
  %53 = call float @__nv_expf(float %subtract.4)
  store float %53, ptr %reduction_input_address, align 4
  %54 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7__1(ptr %54, ptr %reduction_input_address, ptr %return_buffer)
  %55 = load float, ptr %return_buffer, align 4
  store float %55, ptr %54, align 4
  br label %tile_loop.loop_header, !llvm.loop !125

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %56 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %57 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %57, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %58 = icmp eq i32 %tile_loop.indvar9, 0
  %59 = mul i32 %tile_loop.indvar9, 32
  %60 = add i32 %59, 0
  %x_loc11 = add i32 %60, %56
  %61 = add i32 %tile_origin.1, %y_in_tile.indvar
  %62 = add i32 %tile_origin.2, %x_loc11
  %63 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %63, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !126

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %64 = mul nuw nsw i32 %62, 1
  %65 = add nuw nsw i32 0, %64
  %66 = mul nuw nsw i32 %61, 100
  %67 = add nuw nsw i32 %65, %66
  %68 = mul nuw nsw i32 %tile_origin.0, 3276800
  %69 = add nuw nsw i32 %67, %68
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 100
  %72 = udiv i32 %69, 100
  %73 = urem i32 %72, 4
  %74 = udiv i32 %69, 400
  %Arg_0.112 = getelementptr inbounds float, ptr %arg0, i32 %69
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !74
  %75 = udiv i32 %69, 100
  %Arg_1.214 = getelementptr inbounds float, ptr %arg1, i32 %75
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !74
  %subtract.416 = fsub float %Arg_0.113, %Arg_1.215
  %76 = call float @__nv_expf(float %subtract.416)
  store float %76, ptr %reduction_input_address, align 4
  %77 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7__1(ptr %77, ptr %reduction_input_address, ptr %return_buffer17)
  %78 = load float, ptr %return_buffer17, align 4
  store float %78, ptr %77, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %79 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %6, i32 0, i32 %31
  %80 = addrspacecast ptr addrspace(3) %79 to ptr
  %81 = load float, ptr %current_output, align 4
  store float %81, ptr %80, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %82 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %6, i32 0, i32 %lane_id
  %83 = addrspacecast ptr addrspace(3) %82 to ptr
  store float %region_0_12_constant_6, ptr %initial_value_addr, align 4
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
  %92 = urem i32 %91, 4
  %93 = udiv i32 %88, 4
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr %arg2, i32 0, i32 %93, i32 %92
  %output = load float, ptr %85, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_7__1(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
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

define void @fusion_1(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 100
  %5 = udiv i32 %linear_index_base, 100
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 100
  %10 = udiv i32 %linear_index1, 100
  %11 = urem i32 %10, 4
  %12 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 100
  %15 = udiv i32 %linear_index2, 100
  %16 = urem i32 %15, 4
  %17 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 100
  %20 = udiv i32 %linear_index3, 100
  %21 = urem i32 %20, 4
  %22 = udiv i32 %linear_index3, 400
  %23 = icmp ult i32 %linear_index_base, 3276800
  br i1 %23, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %fusion_1.in_bounds-true, %entry
  ret void

fusion_1.in_bounds-true:                          ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %25 = load float, ptr %24, align 4
  %26 = udiv i32 %linear_index_base, 100
  %27 = getelementptr inbounds float, ptr %arg2, i32 %26
  %28 = load float, ptr %27, align 4, !invariant.load !74
  %subtract.5 = fsub float %25, %28
  %29 = call float @__nv_expf(float %subtract.5)
  %30 = udiv i32 %linear_index_base, 100
  %31 = getelementptr inbounds float, ptr %arg0, i32 %30
  %32 = load float, ptr %31, align 4, !invariant.load !74
  %divide.8 = fdiv float %29, %32
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %divide.8, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %35 = load float, ptr %34, align 4
  %36 = udiv i32 %linear_index1, 100
  %37 = getelementptr inbounds float, ptr %arg2, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !74
  %subtract.51 = fsub float %35, %38
  %39 = call float @__nv_expf(float %subtract.51)
  %40 = udiv i32 %linear_index1, 100
  %41 = getelementptr inbounds float, ptr %arg0, i32 %40
  %42 = load float, ptr %41, align 4, !invariant.load !74
  %divide.82 = fdiv float %39, %42
  %43 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %divide.82, ptr %43, align 4
  %44 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %45 = load float, ptr %44, align 4
  %46 = udiv i32 %linear_index2, 100
  %47 = getelementptr inbounds float, ptr %arg2, i32 %46
  %48 = load float, ptr %47, align 4, !invariant.load !74
  %subtract.53 = fsub float %45, %48
  %49 = call float @__nv_expf(float %subtract.53)
  %50 = udiv i32 %linear_index2, 100
  %51 = getelementptr inbounds float, ptr %arg0, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !74
  %divide.84 = fdiv float %49, %52
  %53 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %divide.84, ptr %53, align 4
  %54 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %55 = load float, ptr %54, align 4
  %56 = udiv i32 %linear_index3, 100
  %57 = getelementptr inbounds float, ptr %arg2, i32 %56
  %58 = load float, ptr %57, align 4, !invariant.load !74
  %subtract.55 = fsub float %55, %58
  %59 = call float @__nv_expf(float %subtract.55)
  %60 = udiv i32 %linear_index3, 100
  %61 = getelementptr inbounds float, ptr %arg0, i32 %60
  %62 = load float, ptr %61, align 4, !invariant.load !74
  %divide.86 = fdiv float %59, %62
  %63 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %divide.86, ptr %63, align 4
  br label %fusion_1.in_bounds-after
}

define void @fusion_28(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index_base, 1
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 4
  %8 = urem i32 %7, 100
  %9 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 4
  %14 = udiv i32 %linear_index1, 4
  %15 = urem i32 %14, 100
  %16 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 1
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 4
  %21 = udiv i32 %linear_index2, 4
  %22 = urem i32 %21, 100
  %23 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 1
  %26 = udiv i32 %linear_index3, 1
  %27 = urem i32 %26, 4
  %28 = udiv i32 %linear_index3, 4
  %29 = urem i32 %28, 100
  %30 = udiv i32 %linear_index3, 400
  %31 = icmp ult i32 %linear_index_base, 3276800
  br i1 %31, label %fusion_28.in_bounds-true, label %fusion_28.in_bounds-after

fusion_28.in_bounds-after:                        ; preds = %fusion_28.in_bounds-true, %entry
  ret void

fusion_28.in_bounds-true:                         ; preds = %entry
  %32 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %9, i32 %6, i32 %8
  %33 = load float, ptr %32, align 4, !invariant.load !74
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %33, ptr %34, align 4
  %35 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %16, i32 %13, i32 %15
  %36 = load float, ptr %35, align 4, !invariant.load !74
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %36, ptr %37, align 4
  %38 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %23, i32 %20, i32 %22
  %39 = load float, ptr %38, align 4, !invariant.load !74
  %40 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %39, ptr %40, align 4
  %41 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %30, i32 %27, i32 %29
  %42 = load float, ptr %41, align 4, !invariant.load !74
  %43 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %42, ptr %43, align 4
  br label %fusion_28.in_bounds-after
}

define void @transpose_233(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !78
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index_base, 4
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 4
  %10 = udiv i32 %linear_index1, 4
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 4
  %15 = udiv i32 %linear_index2, 4
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 4
  %20 = udiv i32 %linear_index3, 4
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 400
  %23 = icmp ult i32 %linear_index_base, 3276800
  br i1 %23, label %transpose_233.in_bounds-true, label %transpose_233.in_bounds-after

transpose_233.in_bounds-after:                    ; preds = %transpose_233.in_bounds-true, %entry
  ret void

transpose_233.in_bounds-true:                     ; preds = %entry
  %24 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %7, i32 %4, i32 %6
  %25 = load float, ptr %24, align 4, !invariant.load !74
  %26 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %25, ptr %26, align 4
  %27 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %12, i32 %9, i32 %11
  %28 = load float, ptr %27, align 4, !invariant.load !74
  %29 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %28, ptr %29, align 4
  %30 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %17, i32 %14, i32 %16
  %31 = load float, ptr %30, align 4, !invariant.load !74
  %32 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %31, ptr %32, align 4
  %33 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %22, i32 %19, i32 %21
  %34 = load float, ptr %33, align 4, !invariant.load !74
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %34, ptr %35, align 4
  br label %transpose_233.in_bounds-after
}

define void @fusion(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(838860800) %arg1, ptr noalias align 128 dereferenceable(8388608) %arg2) {
entry:
  %return_buffer45 = alloca float, align 4
  %result_from_other_lane43 = alloca float, align 4
  %return_buffer42 = alloca float, align 4
  %result_from_other_lane40 = alloca float, align 4
  %return_buffer39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %result_from_other_lane34 = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
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
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !73
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after47, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @14, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_12_constant_6, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !76
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !102
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
  %tile_bound = select i1 %17, i32 100, i32 4096
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after7, %y_in_tile.loop_body
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
  %x_loc5 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc5
  %33 = icmp ult i32 %x_loc5, %tile_bound1
  br i1 %33, label %x_in_tile-true6, label %x_in_tile-after7

x_in_tile-after7:                                 ; preds = %x_in_tile-true6, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !127

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !128

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result14 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result14, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_7__2(ptr %36, ptr %result_from_other_lane, ptr %return_buffer15)
  %38 = load float, ptr %return_buffer15, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result17 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result17, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane16, align 4
  call void @region_1_7__2(ptr %36, ptr %result_from_other_lane16, ptr %return_buffer18)
  %40 = load float, ptr %return_buffer18, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result20 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane19, align 4
  call void @region_1_7__2(ptr %36, ptr %result_from_other_lane19, ptr %return_buffer21)
  %42 = load float, ptr %return_buffer21, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result23 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane22, align 4
  call void @region_1_7__2(ptr %36, ptr %result_from_other_lane22, ptr %return_buffer24)
  %44 = load float, ptr %return_buffer24, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result26 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane25, align 4
  call void @region_1_7__2(ptr %36, ptr %result_from_other_lane25, ptr %return_buffer27)
  %46 = load float, ptr %return_buffer27, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address28 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address28 to ptr
  %current_output29 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output29, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr30 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr30 to ptr
  %partial_reduction_result32 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane31, align 4
  call void @region_1_7__2(ptr %55, ptr %result_from_other_lane31, ptr %return_buffer33)
  %57 = load float, ptr %return_buffer33, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result35 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result35, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane34, align 4
  call void @region_1_7__2(ptr %55, ptr %result_from_other_lane34, ptr %return_buffer36)
  %59 = load float, ptr %return_buffer36, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result38 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane37, align 4
  call void @region_1_7__2(ptr %55, ptr %result_from_other_lane37, ptr %return_buffer39)
  %61 = load float, ptr %return_buffer39, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result41 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane40, align 4
  call void @region_1_7__2(ptr %55, ptr %result_from_other_lane40, ptr %return_buffer42)
  %63 = load float, ptr %return_buffer42, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result44 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result44, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane43, align 4
  call void @region_1_7__2(ptr %55, ptr %result_from_other_lane43, ptr %return_buffer45)
  %65 = load float, ptr %return_buffer45, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true46, label %reduction_write_output-after47

reduction_write_output-after47:                   ; preds = %reduction_write_output-true46, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 256
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 25600
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 4
  %82 = udiv i32 %77, 256
  %83 = urem i32 %82, 100
  %84 = udiv i32 %77, 25600
  %85 = mul i32 %thread_id.x, 2
  %86 = sub i32 %x_loc, %85
  %87 = mul nuw nsw i32 %79, 1
  %88 = add nuw nsw i32 0, %87
  %89 = mul nuw nsw i32 %81, 64
  %90 = add nuw nsw i32 %88, %89
  %91 = udiv i32 %90, 256
  %92 = mul nuw nsw i32 %83, 1
  %93 = add nuw nsw i32 0, %92
  %94 = mul nuw nsw i32 %84, 100
  %95 = add nuw nsw i32 %93, %94
  %96 = udiv i32 %95, 819200
  %Arg_1.2 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %95, i32 %90
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !74
  %Arg_0.1 = getelementptr inbounds [8192 x [100 x [4 x float]]], ptr %arg0, i32 0, i32 %84, i32 %83, i32 %81
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !74
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.5, ptr %reduction_input_address, align 4
  %97 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %86
  call void @region_1_7__2(ptr %97, ptr %reduction_input_address, ptr %return_buffer)
  %98 = load float, ptr %return_buffer, align 4
  store float %98, ptr %97, align 4
  br label %x_in_tile-after

x_in_tile-true6:                                  ; preds = %x_in_tile-after
  %99 = mul nuw nsw i32 %32, 1
  %100 = add nuw nsw i32 0, %99
  %101 = mul nuw nsw i32 %31, 256
  %102 = add nuw nsw i32 %100, %101
  %103 = mul nuw nsw i32 %tile_origin.0, 25600
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 1
  %106 = urem i32 %105, 64
  %107 = udiv i32 %104, 64
  %108 = urem i32 %107, 4
  %109 = udiv i32 %104, 256
  %110 = urem i32 %109, 100
  %111 = udiv i32 %104, 25600
  %112 = mul i32 %thread_id.x, 2
  %113 = sub i32 %x_loc5, %112
  %114 = mul nuw nsw i32 %106, 1
  %115 = add nuw nsw i32 0, %114
  %116 = mul nuw nsw i32 %108, 64
  %117 = add nuw nsw i32 %115, %116
  %118 = udiv i32 %117, 256
  %119 = mul nuw nsw i32 %110, 1
  %120 = add nuw nsw i32 0, %119
  %121 = mul nuw nsw i32 %111, 100
  %122 = add nuw nsw i32 %120, %121
  %123 = udiv i32 %122, 819200
  %Arg_1.28 = getelementptr inbounds [819200 x [256 x float]], ptr %arg1, i32 0, i32 %122, i32 %117
  %Arg_1.29 = load float, ptr %Arg_1.28, align 4, !invariant.load !74
  %Arg_0.110 = getelementptr inbounds [8192 x [100 x [4 x float]]], ptr %arg0, i32 0, i32 %111, i32 %110, i32 %108
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !74
  %multiply.512 = fmul float %Arg_1.29, %Arg_0.111
  store float %multiply.512, ptr %reduction_input_address, align 4
  %124 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %113
  call void @region_1_7__2(ptr %124, ptr %reduction_input_address, ptr %return_buffer13)
  %125 = load float, ptr %return_buffer13, align 4
  store float %125, ptr %124, align 4
  br label %x_in_tile-after7

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %126 = mul i32 %thread_id.y, 2
  %127 = add i32 %tile_origin.1, %thread_id.x
  %128 = add i32 %tile_origin.2, %126
  %129 = add i32 %128, 0
  %130 = mul i32 %tile_origin.0, 256
  %131 = add i32 %130, %129
  %132 = udiv i32 %131, 1
  %133 = urem i32 %132, 64
  %134 = udiv i32 %131, 64
  %135 = urem i32 %134, 4
  %136 = udiv i32 %131, 256
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg2, i32 0, i32 %136, i32 %135, i32 %133
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true46:                    ; preds = %reduction_write_output-after
  %137 = mul i32 %thread_id.y, 2
  %138 = add i32 %tile_origin.1, %thread_id.x
  %139 = add i32 %tile_origin.2, %137
  %140 = add i32 %139, 1
  %141 = mul i32 %tile_origin.0, 256
  %142 = add i32 %141, %140
  %143 = udiv i32 %142, 1
  %144 = urem i32 %143, 64
  %145 = udiv i32 %142, 64
  %146 = urem i32 %145, 4
  %147 = udiv i32 %142, 256
  %output_element_address48 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg2, i32 0, i32 %147, i32 %146, i32 %144
  %output49 = load float, ptr %55, align 4
  store float %output49, ptr %output_element_address48, align 4
  br label %reduction_write_output-after47
}

define internal void @region_1_7__2(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
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

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { nounwind memory(none) }
attributes #4 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72}

!0 = !{ptr @copy_fusion, !"kernel", i32 1}
!1 = !{ptr @copy_fusion, !"reqntidx", i32 1}
!2 = !{ptr @concatenate_17, !"kernel", i32 1}
!3 = !{ptr @concatenate_17, !"reqntidx", i32 1024}
!4 = !{ptr @concatenate_19, !"kernel", i32 1}
!5 = !{ptr @concatenate_19, !"reqntidx", i32 256}
!6 = !{ptr @fusion_6, !"kernel", i32 1}
!7 = !{ptr @fusion_6, !"reqntidx", i32 256}
!8 = !{ptr @concatenate_14, !"kernel", i32 1}
!9 = !{ptr @concatenate_14, !"reqntidx", i32 256}
!10 = !{ptr @fusion_31, !"kernel", i32 1}
!11 = !{ptr @fusion_31, !"reqntidx", i32 256}
!12 = !{ptr @fusion_41, !"kernel", i32 1}
!13 = !{ptr @fusion_41, !"reqntidx", i32 256}
!14 = !{ptr @concatenate_12, !"kernel", i32 1}
!15 = !{ptr @concatenate_12, !"reqntidx", i32 256}
!16 = !{ptr @fusion_32, !"kernel", i32 1}
!17 = !{ptr @fusion_32, !"reqntidx", i32 256}
!18 = !{ptr @fusion_42, !"kernel", i32 1}
!19 = !{ptr @fusion_42, !"reqntidx", i32 256}
!20 = !{ptr @fusion_30, !"kernel", i32 1}
!21 = !{ptr @fusion_30, !"reqntidx", i32 256}
!22 = !{ptr @concatenate_7, !"kernel", i32 1}
!23 = !{ptr @concatenate_7, !"reqntidx", i32 256}
!24 = !{ptr @fusion_36, !"kernel", i32 1}
!25 = !{ptr @fusion_36, !"reqntidx", i32 96}
!26 = !{ptr @fusion_37, !"kernel", i32 1}
!27 = !{ptr @fusion_37, !"reqntidx", i32 96}
!28 = !{ptr @fusion_35, !"kernel", i32 1}
!29 = !{ptr @fusion_35, !"reqntidx", i32 128}
!30 = !{ptr @fusion_29, !"kernel", i32 1}
!31 = !{ptr @fusion_29, !"reqntidx", i32 256}
!32 = !{ptr @fusion_20, !"kernel", i32 1}
!33 = !{ptr @fusion_20, !"reqntidx", i32 256}
!34 = !{ptr @fusion_19, !"kernel", i32 1}
!35 = !{ptr @fusion_19, !"reqntidx", i32 256}
!36 = !{ptr @fusion_40, !"kernel", i32 1}
!37 = !{ptr @fusion_40, !"reqntidx", i32 256}
!38 = !{ptr @fusion_16, !"kernel", i32 1}
!39 = !{ptr @fusion_16, !"reqntidx", i32 32}
!40 = !{ptr @fusion_16, !"reqntidy", i32 4}
!41 = !{ptr @fusion_39, !"kernel", i32 1}
!42 = !{ptr @fusion_39, !"reqntidx", i32 256}
!43 = !{ptr @fusion_38, !"kernel", i32 1}
!44 = !{ptr @fusion_38, !"reqntidx", i32 32}
!45 = !{ptr @fusion_12, !"kernel", i32 1}
!46 = !{ptr @fusion_12, !"reqntidx", i32 256}
!47 = !{ptr @fusion_10, !"kernel", i32 1}
!48 = !{ptr @fusion_10, !"reqntidx", i32 32}
!49 = !{ptr @fusion_9, !"kernel", i32 1}
!50 = !{ptr @fusion_9, !"reqntidx", i32 256}
!51 = !{ptr @fusion_8, !"kernel", i32 1}
!52 = !{ptr @fusion_8, !"reqntidx", i32 256}
!53 = !{ptr @fusion_7, !"kernel", i32 1}
!54 = !{ptr @fusion_7, !"reqntidx", i32 256}
!55 = !{ptr @fusion_5, !"kernel", i32 1}
!56 = !{ptr @fusion_5, !"reqntidx", i32 256}
!57 = !{ptr @fusion_4, !"kernel", i32 1}
!58 = !{ptr @fusion_4, !"reqntidx", i32 96}
!59 = !{ptr @fusion_3, !"kernel", i32 1}
!60 = !{ptr @fusion_3, !"reqntidx", i32 256}
!61 = !{ptr @reduce_330, !"kernel", i32 1}
!62 = !{ptr @reduce_330, !"reqntidx", i32 96}
!63 = !{ptr @fusion_34, !"kernel", i32 1}
!64 = !{ptr @fusion_34, !"reqntidx", i32 96}
!65 = !{ptr @fusion_1, !"kernel", i32 1}
!66 = !{ptr @fusion_1, !"reqntidx", i32 256}
!67 = !{ptr @fusion_28, !"kernel", i32 1}
!68 = !{ptr @fusion_28, !"reqntidx", i32 256}
!69 = !{ptr @transpose_233, !"kernel", i32 1}
!70 = !{ptr @transpose_233, !"reqntidx", i32 256}
!71 = !{ptr @fusion, !"kernel", i32 1}
!72 = !{ptr @fusion, !"reqntidx", i32 1024}
!73 = !{i32 0, i32 1}
!74 = !{}
!75 = !{i32 0, i32 42}
!76 = !{i32 0, i32 1024}
!77 = !{i32 0, i32 258}
!78 = !{i32 0, i32 256}
!79 = !{i32 0, i32 8256}
!80 = !{i32 0, i32 32000}
!81 = !{i32 0, i32 5120}
!82 = !{i32 0, i32 4096}
!83 = !{i32 0, i32 102400}
!84 = !{i32 0, i32 16384}
!85 = !{i32 0, i32 8192}
!86 = !{i32 0, i32 96}
!87 = !{i32 0, i32 43691}
!88 = distinct !{!88, !89}
!89 = !{!"llvm.loop.vectorize.enable", i1 false}
!90 = distinct !{!90, !89, !91}
!91 = !{!"llvm.loop.unroll.full"}
!92 = distinct !{!92, !89, !91}
!93 = distinct !{!93, !89}
!94 = distinct !{!94, !89, !91}
!95 = distinct !{!95, !89, !91}
!96 = !{i32 0, i32 128}
!97 = distinct !{!97, !89, !91}
!98 = distinct !{!98, !89}
!99 = distinct !{!99, !89, !91}
!100 = distinct !{!100, !89}
!101 = !{i32 0, i32 21504}
!102 = !{i32 0, i32 32768}
!103 = !{i32 0, i32 32}
!104 = !{i32 0, i32 4}
!105 = distinct !{!105, !89}
!106 = !{i32 0, i32 131072}
!107 = distinct !{!107, !89}
!108 = distinct !{!108, !89, !91}
!109 = distinct !{!109, !89, !91}
!110 = distinct !{!110, !89}
!111 = distinct !{!111, !89, !91}
!112 = distinct !{!112, !89, !91}
!113 = !{i32 0, i32 134400}
!114 = !{i32 0, i32 160000}
!115 = !{i32 0, i32 1092267}
!116 = distinct !{!116, !89}
!117 = distinct !{!117, !89, !91}
!118 = distinct !{!118, !89, !91}
!119 = !{i32 0, i32 3200}
!120 = !{i32 0, i32 10923}
!121 = distinct !{!121, !89}
!122 = distinct !{!122, !89, !91}
!123 = distinct !{!123, !89, !91}
!124 = distinct !{!124, !89}
!125 = distinct !{!125, !89, !91}
!126 = distinct !{!126, !89, !91}
!127 = distinct !{!127, !89, !91}
!128 = distinct !{!128, !89}
