target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = constant [64 x i8] c"\F3\04\B5>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"\F3\04\B5>"
@1 = private unnamed_addr constant [4 x i8] c"\F3\045\BE"
@2 = private unnamed_addr constant [4 x i8] c"\F3\04\B5>"
@3 = private unnamed_addr constant [4 x i8] c"\F3\045\BE"
@4 = private unnamed_addr constant [4 x i8] c"\F3\04\B5>"
@5 = private unnamed_addr constant [4 x i8] c"\F3\045\BE"
@6 = private unnamed_addr constant [4 x i8] c"\F3\04\B5>"
@7 = private unnamed_addr constant [4 x i8] c"\F3\045\BE"
@8 = private unnamed_addr constant [4 x i8] c"\F3\04\B5>"
@9 = private unnamed_addr constant [4 x i8] c"\F3\045\BE"

define void @fusion_27(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 16384
  br i1 %4, label %fusion_27.in_bounds-true, label %fusion_27.in_bounds-after

fusion_27.in_bounds-after:                        ; preds = %slice1-after, %entry
  ret void

fusion_27.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.8192.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 64
  %10 = udiv i32 %8, 64
  %11 = udiv i32 %10, 128
  %region_0_17_constant_3 = load float, ptr @1, align 4
  %region_0_17_constant_5 = load float, ptr @0, align 4
  %12 = getelementptr inbounds [128 x [64 x float]], ptr %arg0, i32 0, i32 %10, i32 %9
  %13 = load float, ptr %12, align 4, !invariant.load !12
  %multiply.7 = fmul float %region_0_17_constant_5, %13
  %add.8 = fadd float %region_0_17_constant_3, %multiply.7
  br label %concatenate.13.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.8192.3
  %14 = phi i32 [ 8192, %concatenate.pivot.8192.3 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 64
  %19 = udiv i32 %17, 64
  %20 = udiv i32 %19, 128
  %region_0_17_constant_31 = load float, ptr @1, align 4
  %region_0_17_constant_52 = load float, ptr @0, align 4
  %21 = getelementptr inbounds [128 x [64 x float]], ptr %arg1, i32 0, i32 %19, i32 %18
  %22 = load float, ptr %21, align 4, !invariant.load !12
  %multiply.10 = fmul float %region_0_17_constant_52, %22
  %add.11 = fadd float %region_0_17_constant_31, %multiply.10
  br label %concatenate.13.merge

concatenate.pivot.8192.:                          ; preds = %fusion_27.in_bounds-true
  %23 = icmp ult i32 %3, 8192
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.8192.3

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.8192.
  br label %concat_index_from_operand_id0

concatenate.pivot.8192.3:                         ; preds = %concatenate.pivot.8192.
  br label %concat_index_from_operand_id1

concatenate.13.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %24 = phi float [ %add.8, %concat_index_from_operand_id0 ], [ %add.11, %concat_index_from_operand_id1 ]
  %25 = icmp sge i32 %3, 0
  %26 = icmp slt i32 %3, 8192
  %27 = and i1 %25, %26
  br i1 %27, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.13.merge
  %28 = icmp sge i32 %3, 8192
  %29 = icmp slt i32 %3, 16384
  %30 = and i1 %28, %29
  br i1 %30, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %fusion_27.in_bounds-after

slice0-true:                                      ; preds = %concatenate.13.merge
  %31 = sub i32 %3, 0
  %32 = getelementptr inbounds [8192 x float], ptr %arg2, i32 0, i32 %31
  store float %24, ptr %32, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %33 = sub i32 %3, 8192
  %34 = getelementptr inbounds [8192 x float], ptr %arg3, i32 0, i32 %33
  store float %24, ptr %34, align 4
  br label %slice1-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_24(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index, 64
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_24.in_bounds-true, label %fusion_24.in_bounds-after

fusion_24.in_bounds-after:                        ; preds = %fusion_24.in_bounds-true, %entry
  ret void

fusion_24.in_bounds-true:                         ; preds = %entry
  %region_0_15_constant_4 = load float, ptr @3, align 4
  %region_0_15_constant_6 = load float, ptr @2, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !12
  %multiply.8 = fmul float %region_0_15_constant_6, %8
  %add.9 = fadd float %region_0_15_constant_4, %multiply.8
  %9 = insertvalue { float, float, float } undef, float %add.9, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !12
  %multiply.10 = fmul float %region_0_15_constant_6, %11
  %add.11 = fadd float %region_0_15_constant_4, %multiply.10
  %12 = insertvalue { float, float, float } %9, float %add.11, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !12
  %multiply.12 = fmul float %region_0_15_constant_6, %14
  %add.13 = fadd float %region_0_15_constant_4, %multiply.12
  %15 = insertvalue { float, float, float } %12, float %add.13, 2
  %16 = extractvalue { float, float, float } %15, 0
  %17 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %16, ptr %17, align 4
  %18 = extractvalue { float, float, float } %15, 1
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %18, ptr %19, align 4
  %20 = extractvalue { float, float, float } %15, 2
  %21 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %20, ptr %21, align 4
  br label %fusion_24.in_bounds-after
}

define void @fusion_23(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_23.in_bounds-true, label %fusion_23.in_bounds-after

fusion_23.in_bounds-after:                        ; preds = %fusion_23.in_bounds-true, %entry
  ret void

fusion_23.in_bounds-true:                         ; preds = %entry
  %region_0_18_constant_5 = load float, ptr @5, align 4
  %region_0_18_constant_7 = load float, ptr @4, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !12
  %multiply.9 = fmul float %region_0_18_constant_7, %8
  %add.10 = fadd float %region_0_18_constant_5, %multiply.9
  %9 = insertvalue { float, float, float, float } undef, float %add.10, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !12
  %multiply.11 = fmul float %region_0_18_constant_7, %11
  %add.12 = fadd float %region_0_18_constant_5, %multiply.11
  %12 = insertvalue { float, float, float, float } %9, float %add.12, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !12
  %multiply.13 = fmul float %region_0_18_constant_7, %14
  %add.14 = fadd float %region_0_18_constant_5, %multiply.13
  %15 = insertvalue { float, float, float, float } %12, float %add.14, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !12
  %multiply.15 = fmul float %region_0_18_constant_7, %17
  %add.16 = fadd float %region_0_18_constant_5, %multiply.15
  %18 = insertvalue { float, float, float, float } %15, float %add.16, 3
  %19 = extractvalue { float, float, float, float } %18, 0
  %20 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %19, ptr %20, align 4
  %21 = extractvalue { float, float, float, float } %18, 1
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %21, ptr %22, align 4
  %23 = extractvalue { float, float, float, float } %18, 2
  %24 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %23, ptr %24, align 4
  %25 = extractvalue { float, float, float, float } %18, 3
  %26 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  store float %25, ptr %26, align 4
  br label %fusion_23.in_bounds-after
}

define void @fusion_25(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(32768) %arg3, ptr noalias align 16 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(32768) %arg5, ptr noalias align 128 dereferenceable(32768) %arg6, ptr noalias align 128 dereferenceable(32768) %arg7, ptr noalias align 128 dereferenceable(32768) %arg8, ptr noalias align 128 dereferenceable(32768) %arg9) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_25.in_bounds-true, label %fusion_25.in_bounds-after

fusion_25.in_bounds-after:                        ; preds = %fusion_25.in_bounds-true, %entry
  ret void

fusion_25.in_bounds-true:                         ; preds = %entry
  %region_0_21_constant_6 = load float, ptr @7, align 4
  %region_0_21_constant_8 = load float, ptr @6, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !12
  %multiply.10 = fmul float %region_0_21_constant_8, %8
  %add.11 = fadd float %region_0_21_constant_6, %multiply.10
  %9 = insertvalue { float, float, float, float, float } undef, float %add.11, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !12
  %multiply.12 = fmul float %region_0_21_constant_8, %11
  %add.13 = fadd float %region_0_21_constant_6, %multiply.12
  %12 = insertvalue { float, float, float, float, float } %9, float %add.13, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !12
  %multiply.14 = fmul float %region_0_21_constant_8, %14
  %add.15 = fadd float %region_0_21_constant_6, %multiply.14
  %15 = insertvalue { float, float, float, float, float } %12, float %add.15, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !12
  %multiply.16 = fmul float %region_0_21_constant_8, %17
  %add.17 = fadd float %region_0_21_constant_6, %multiply.16
  %18 = insertvalue { float, float, float, float, float } %15, float %add.17, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !12
  %multiply.18 = fmul float %20, %region_0_21_constant_8
  %add.19 = fadd float %region_0_21_constant_6, %multiply.18
  %21 = insertvalue { float, float, float, float, float } %18, float %add.19, 4
  %22 = extractvalue { float, float, float, float, float } %21, 0
  %23 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %22, ptr %23, align 4
  %24 = extractvalue { float, float, float, float, float } %21, 1
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %24, ptr %25, align 4
  %26 = extractvalue { float, float, float, float, float } %21, 2
  %27 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  store float %26, ptr %27, align 4
  %28 = extractvalue { float, float, float, float, float } %21, 3
  %29 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  store float %28, ptr %29, align 4
  %30 = extractvalue { float, float, float, float, float } %21, 4
  %31 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  store float %30, ptr %31, align 4
  br label %fusion_25.in_bounds-after
}

define void @fusion_26(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(32768) %arg3, ptr noalias align 16 dereferenceable(32768) %arg4, ptr noalias align 16 dereferenceable(32768) %arg5, ptr noalias align 16 dereferenceable(32768) %arg6, ptr noalias align 16 dereferenceable(32768) %arg7, ptr noalias align 16 dereferenceable(32768) %arg8, ptr noalias align 128 dereferenceable(32768) %arg9, ptr noalias align 128 dereferenceable(32768) %arg10, ptr noalias align 128 dereferenceable(32768) %arg11, ptr noalias align 128 dereferenceable(32768) %arg12, ptr noalias align 128 dereferenceable(32768) %arg13, ptr noalias align 128 dereferenceable(32768) %arg14, ptr noalias align 128 dereferenceable(32768) %arg15, ptr noalias align 128 dereferenceable(32768) %arg16, ptr noalias align 128 dereferenceable(32768) %arg17) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !11
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_26.in_bounds-true, label %fusion_26.in_bounds-after

fusion_26.in_bounds-after:                        ; preds = %fusion_26.in_bounds-true, %entry
  ret void

fusion_26.in_bounds-true:                         ; preds = %entry
  %region_0_33_constant_10 = load float, ptr @9, align 4
  %region_0_33_constant_12 = load float, ptr @8, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !12
  %multiply.14 = fmul float %region_0_33_constant_12, %8
  %add.15 = fadd float %region_0_33_constant_10, %multiply.14
  %9 = insertvalue { float, float, float, float, float, float, float, float, float } undef, float %add.15, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !12
  %multiply.16 = fmul float %region_0_33_constant_12, %11
  %add.17 = fadd float %region_0_33_constant_10, %multiply.16
  %12 = insertvalue { float, float, float, float, float, float, float, float, float } %9, float %add.17, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !12
  %multiply.18 = fmul float %region_0_33_constant_12, %14
  %add.19 = fadd float %region_0_33_constant_10, %multiply.18
  %15 = insertvalue { float, float, float, float, float, float, float, float, float } %12, float %add.19, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !12
  %multiply.20 = fmul float %region_0_33_constant_12, %17
  %add.21 = fadd float %region_0_33_constant_10, %multiply.20
  %18 = insertvalue { float, float, float, float, float, float, float, float, float } %15, float %add.21, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !12
  %multiply.22 = fmul float %region_0_33_constant_12, %20
  %add.23 = fadd float %region_0_33_constant_10, %multiply.22
  %21 = insertvalue { float, float, float, float, float, float, float, float, float } %18, float %add.23, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !12
  %multiply.24 = fmul float %region_0_33_constant_12, %23
  %add.25 = fadd float %region_0_33_constant_10, %multiply.24
  %24 = insertvalue { float, float, float, float, float, float, float, float, float } %21, float %add.25, 5
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !12
  %multiply.26 = fmul float %region_0_33_constant_12, %26
  %add.27 = fadd float %region_0_33_constant_10, %multiply.26
  %27 = insertvalue { float, float, float, float, float, float, float, float, float } %24, float %add.27, 6
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %29 = load float, ptr %28, align 4, !invariant.load !12
  %multiply.28 = fmul float %region_0_33_constant_12, %29
  %add.29 = fadd float %region_0_33_constant_10, %multiply.28
  %30 = insertvalue { float, float, float, float, float, float, float, float, float } %27, float %add.29, 7
  %31 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %32 = load float, ptr %31, align 4, !invariant.load !12
  %multiply.30 = fmul float %region_0_33_constant_12, %32
  %add.31 = fadd float %region_0_33_constant_10, %multiply.30
  %33 = insertvalue { float, float, float, float, float, float, float, float, float } %30, float %add.31, 8
  %34 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 0
  %35 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  store float %34, ptr %35, align 4
  %36 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 1
  %37 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %36, ptr %37, align 4
  %38 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 2
  %39 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %38, ptr %39, align 4
  %40 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 3
  %41 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  store float %40, ptr %41, align 4
  %42 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 4
  %43 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  store float %42, ptr %43, align 4
  %44 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 5
  %45 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  store float %44, ptr %45, align 4
  %46 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 6
  %47 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  store float %46, ptr %47, align 4
  %48 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 7
  %49 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  store float %48, ptr %49, align 4
  %50 = extractvalue { float, float, float, float, float, float, float, float, float } %33, 8
  %51 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  store float %50, ptr %51, align 4
  br label %fusion_26.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9}

!0 = !{ptr @fusion_27, !"kernel", i32 1}
!1 = !{ptr @fusion_27, !"reqntidx", i32 1024}
!2 = !{ptr @fusion_24, !"kernel", i32 1}
!3 = !{ptr @fusion_24, !"reqntidx", i32 1024}
!4 = !{ptr @fusion_23, !"kernel", i32 1}
!5 = !{ptr @fusion_23, !"reqntidx", i32 1024}
!6 = !{ptr @fusion_25, !"kernel", i32 1}
!7 = !{ptr @fusion_25, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_26, !"kernel", i32 1}
!9 = !{ptr @fusion_26, !"reqntidx", i32 1024}
!10 = !{i32 0, i32 16}
!11 = !{i32 0, i32 1024}
!12 = !{}
!13 = !{i32 0, i32 8}
