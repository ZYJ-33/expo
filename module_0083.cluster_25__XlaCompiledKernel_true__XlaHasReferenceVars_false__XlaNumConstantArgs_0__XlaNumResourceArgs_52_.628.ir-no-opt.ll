target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = constant [64 x i8] c"\00\00\80>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@1 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@2 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@3 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@4 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@5 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@6 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@7 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@8 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@9 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@10 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@11 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@12 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@13 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@14 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@15 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@16 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@17 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@18 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@19 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@20 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@21 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"
@22 = private unnamed_addr constant [4 x i8] c"\00\00\80>"
@23 = private unnamed_addr constant [4 x i8] c"\00\00\00\BE"

define void @fusion_54(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_54.in_bounds-true, label %fusion_54.in_bounds-after

fusion_54.in_bounds-after:                        ; preds = %fusion_54.in_bounds-true, %entry
  ret void

fusion_54.in_bounds-true:                         ; preds = %entry
  %region_0_15_constant_4 = load float, ptr @1, align 4
  %region_0_15_constant_6 = load float, ptr @0, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !18
  %multiply.8 = fmul float %region_0_15_constant_6, %8
  %add.9 = fadd float %region_0_15_constant_4, %multiply.8
  %9 = insertvalue { float, float, float } undef, float %add.9, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !18
  %multiply.10 = fmul float %region_0_15_constant_6, %11
  %add.11 = fadd float %region_0_15_constant_4, %multiply.10
  %12 = insertvalue { float, float, float } %9, float %add.11, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !18
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
  br label %fusion_54.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_57(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_57.in_bounds-true, label %fusion_57.in_bounds-after

fusion_57.in_bounds-after:                        ; preds = %fusion_57.in_bounds-true, %entry
  ret void

fusion_57.in_bounds-true:                         ; preds = %entry
  %region_0_18_constant_5 = load float, ptr @3, align 4
  %region_0_18_constant_7 = load float, ptr @2, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !18
  %multiply.9 = fmul float %region_0_18_constant_7, %8
  %add.10 = fadd float %region_0_18_constant_5, %multiply.9
  %9 = insertvalue { float, float, float, float } undef, float %add.10, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !18
  %multiply.11 = fmul float %region_0_18_constant_7, %11
  %add.12 = fadd float %region_0_18_constant_5, %multiply.11
  %12 = insertvalue { float, float, float, float } %9, float %add.12, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !18
  %multiply.13 = fmul float %region_0_18_constant_7, %14
  %add.14 = fadd float %region_0_18_constant_5, %multiply.13
  %15 = insertvalue { float, float, float, float } %12, float %add.14, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !18
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
  br label %fusion_57.in_bounds-after
}

define void @fusion_53(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(131072) %arg4, ptr noalias align 128 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_53.in_bounds-true, label %fusion_53.in_bounds-after

fusion_53.in_bounds-after:                        ; preds = %fusion_53.in_bounds-true, %entry
  ret void

fusion_53.in_bounds-true:                         ; preds = %entry
  %region_0_21_constant_6 = load float, ptr @5, align 4
  %region_0_21_constant_8 = load float, ptr @4, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !18
  %multiply.10 = fmul float %region_0_21_constant_8, %8
  %add.11 = fadd float %region_0_21_constant_6, %multiply.10
  %9 = insertvalue { float, float, float, float, float } undef, float %add.11, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !18
  %multiply.12 = fmul float %region_0_21_constant_8, %11
  %add.13 = fadd float %region_0_21_constant_6, %multiply.12
  %12 = insertvalue { float, float, float, float, float } %9, float %add.13, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !18
  %multiply.14 = fmul float %region_0_21_constant_8, %14
  %add.15 = fadd float %region_0_21_constant_6, %multiply.14
  %15 = insertvalue { float, float, float, float, float } %12, float %add.15, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !18
  %multiply.16 = fmul float %region_0_21_constant_8, %17
  %add.17 = fadd float %region_0_21_constant_6, %multiply.16
  %18 = insertvalue { float, float, float, float, float } %15, float %add.17, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !18
  %multiply.18 = fmul float %region_0_21_constant_8, %20
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
  br label %fusion_53.in_bounds-after
}

define void @fusion_61(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(131072) %arg10, ptr noalias align 128 dereferenceable(131072) %arg11) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_61.in_bounds-true, label %fusion_61.in_bounds-after

fusion_61.in_bounds-after:                        ; preds = %fusion_61.in_bounds-true, %entry
  ret void

fusion_61.in_bounds-true:                         ; preds = %entry
  %region_0_24_constant_7 = load float, ptr @7, align 4
  %region_0_24_constant_9 = load float, ptr @6, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !18
  %multiply.11 = fmul float %region_0_24_constant_9, %8
  %add.12 = fadd float %region_0_24_constant_7, %multiply.11
  %9 = insertvalue { float, float, float, float, float, float } undef, float %add.12, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !18
  %multiply.13 = fmul float %region_0_24_constant_9, %11
  %add.14 = fadd float %region_0_24_constant_7, %multiply.13
  %12 = insertvalue { float, float, float, float, float, float } %9, float %add.14, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !18
  %multiply.15 = fmul float %region_0_24_constant_9, %14
  %add.16 = fadd float %region_0_24_constant_7, %multiply.15
  %15 = insertvalue { float, float, float, float, float, float } %12, float %add.16, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !18
  %multiply.17 = fmul float %region_0_24_constant_9, %17
  %add.18 = fadd float %region_0_24_constant_7, %multiply.17
  %18 = insertvalue { float, float, float, float, float, float } %15, float %add.18, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !18
  %multiply.19 = fmul float %region_0_24_constant_9, %20
  %add.20 = fadd float %region_0_24_constant_7, %multiply.19
  %21 = insertvalue { float, float, float, float, float, float } %18, float %add.20, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !18
  %multiply.21 = fmul float %region_0_24_constant_9, %23
  %add.22 = fadd float %region_0_24_constant_7, %multiply.21
  %24 = insertvalue { float, float, float, float, float, float } %21, float %add.22, 5
  %25 = extractvalue { float, float, float, float, float, float } %24, 0
  %26 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %25, ptr %26, align 4
  %27 = extractvalue { float, float, float, float, float, float } %24, 1
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  store float %27, ptr %28, align 4
  %29 = extractvalue { float, float, float, float, float, float } %24, 2
  %30 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  store float %29, ptr %30, align 4
  %31 = extractvalue { float, float, float, float, float, float } %24, 3
  %32 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  store float %31, ptr %32, align 4
  %33 = extractvalue { float, float, float, float, float, float } %24, 4
  %34 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %33, ptr %34, align 4
  %35 = extractvalue { float, float, float, float, float, float } %24, 5
  %36 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %35, ptr %36, align 4
  br label %fusion_61.in_bounds-after
}

define void @copy_fusion(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(131072) %arg10, ptr noalias align 128 dereferenceable(131072) %arg11) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %copy_fusion.in_bounds-true, label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %copy_fusion.in_bounds-true, %entry
  ret void

copy_fusion.in_bounds-true:                       ; preds = %entry
  %region_0_28_constant_7 = load float, ptr @11, align 4
  %region_0_28_constant_9 = load float, ptr @10, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !18
  %multiply.11 = fmul float %region_0_28_constant_9, %8
  %add.12 = fadd float %region_0_28_constant_7, %multiply.11
  %9 = insertvalue { float, float, float, float, float, float } undef, float %add.12, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !18
  %multiply.13 = fmul float %region_0_28_constant_9, %11
  %add.14 = fadd float %region_0_28_constant_7, %multiply.13
  %12 = insertvalue { float, float, float, float, float, float } %9, float %add.14, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !18
  %multiply.15 = fmul float %region_0_28_constant_9, %14
  %add.16 = fadd float %region_0_28_constant_7, %multiply.15
  %15 = insertvalue { float, float, float, float, float, float } %12, float %add.16, 2
  %region_0_28_constant_17 = load float, ptr @9, align 4
  %region_0_28_constant_19 = load float, ptr @8, align 4
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !18
  %multiply.21 = fmul float %region_0_28_constant_19, %17
  %add.22 = fadd float %region_0_28_constant_17, %multiply.21
  %18 = insertvalue { float, float, float, float, float, float } %15, float %add.22, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !18
  %multiply.23 = fmul float %region_0_28_constant_19, %20
  %add.24 = fadd float %region_0_28_constant_17, %multiply.23
  %21 = insertvalue { float, float, float, float, float, float } %18, float %add.24, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !18
  %multiply.25 = fmul float %region_0_28_constant_19, %23
  %add.26 = fadd float %region_0_28_constant_17, %multiply.25
  %24 = insertvalue { float, float, float, float, float, float } %21, float %add.26, 5
  %25 = extractvalue { float, float, float, float, float, float } %24, 0
  %26 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %25, ptr %26, align 4
  %27 = extractvalue { float, float, float, float, float, float } %24, 1
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  store float %27, ptr %28, align 4
  %29 = extractvalue { float, float, float, float, float, float } %24, 2
  %30 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  store float %29, ptr %30, align 4
  %31 = extractvalue { float, float, float, float, float, float } %24, 3
  %32 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  store float %31, ptr %32, align 4
  %33 = extractvalue { float, float, float, float, float, float } %24, 4
  %34 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %33, ptr %34, align 4
  %35 = extractvalue { float, float, float, float, float, float } %24, 5
  %36 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %35, ptr %36, align 4
  br label %copy_fusion.in_bounds-after
}

define void @fusion_63(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 16 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(131072) %arg10, ptr noalias align 128 dereferenceable(131072) %arg11, ptr noalias align 128 dereferenceable(131072) %arg12, ptr noalias align 128 dereferenceable(131072) %arg13) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !19
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 229376
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 229376
  br i1 %4, label %fusion_63.in_bounds-true, label %fusion_63.in_bounds-after

fusion_63.in_bounds-after:                        ; preds = %slice6-after, %entry
  ret void

fusion_63.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.98304.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 256
  %10 = udiv i32 %8, 256
  %11 = udiv i32 %10, 128
  %region_0_44_constant_8 = load float, ptr @13, align 4
  %region_0_44_constant_10 = load float, ptr @12, align 4
  %12 = getelementptr inbounds [128 x [256 x float]], ptr %arg0, i32 0, i32 %10, i32 %9
  %13 = load float, ptr %12, align 4, !invariant.load !18
  %multiply.12 = fmul float %region_0_44_constant_10, %13
  %add.13 = fadd float %region_0_44_constant_8, %multiply.12
  br label %concatenate.35.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.32768.13
  %14 = phi i32 [ 32768, %concatenate.pivot.32768.13 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 256
  %19 = udiv i32 %17, 256
  %20 = udiv i32 %19, 128
  %region_0_44_constant_81 = load float, ptr @13, align 4
  %region_0_44_constant_102 = load float, ptr @12, align 4
  %21 = getelementptr inbounds [128 x [256 x float]], ptr %arg1, i32 0, i32 %19, i32 %18
  %22 = load float, ptr %21, align 4, !invariant.load !18
  %multiply.15 = fmul float %region_0_44_constant_102, %22
  %add.16 = fadd float %region_0_44_constant_81, %multiply.15
  br label %concatenate.35.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.65536.14
  %23 = phi i32 [ 65536, %concatenate.pivot.65536.14 ]
  %24 = sub nsw i32 %3, %23
  %25 = mul nuw nsw i32 %24, 1
  %26 = add nuw nsw i32 0, %25
  %27 = urem i32 %26, 128
  %28 = udiv i32 %26, 128
  %29 = udiv i32 %28, 256
  %region_0_44_constant_83 = load float, ptr @13, align 4
  %region_0_44_constant_104 = load float, ptr @12, align 4
  %30 = getelementptr inbounds [256 x [128 x float]], ptr %arg2, i32 0, i32 %28, i32 %27
  %31 = load float, ptr %30, align 4, !invariant.load !18
  %multiply.20 = fmul float %region_0_44_constant_104, %31
  %add.21 = fadd float %region_0_44_constant_83, %multiply.20
  br label %concatenate.35.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.98304.15
  %32 = phi i32 [ 98304, %concatenate.pivot.98304.15 ]
  %33 = sub nsw i32 %3, %32
  %34 = mul nuw nsw i32 %33, 1
  %35 = add nuw nsw i32 0, %34
  %36 = urem i32 %35, 128
  %37 = udiv i32 %35, 128
  %38 = udiv i32 %37, 256
  %region_0_44_constant_85 = load float, ptr @13, align 4
  %region_0_44_constant_106 = load float, ptr @12, align 4
  %39 = getelementptr inbounds [256 x [128 x float]], ptr %arg3, i32 0, i32 %37, i32 %36
  %40 = load float, ptr %39, align 4, !invariant.load !18
  %multiply.23 = fmul float %region_0_44_constant_106, %40
  %add.24 = fadd float %region_0_44_constant_85, %multiply.23
  br label %concatenate.35.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.131072.16
  %41 = phi i32 [ 131072, %concatenate.pivot.131072.16 ]
  %42 = sub nsw i32 %3, %41
  %43 = mul nuw nsw i32 %42, 1
  %44 = add nuw nsw i32 0, %43
  %45 = urem i32 %44, 256
  %46 = udiv i32 %44, 256
  %47 = udiv i32 %46, 128
  %region_0_44_constant_87 = load float, ptr @13, align 4
  %region_0_44_constant_108 = load float, ptr @12, align 4
  %48 = getelementptr inbounds [128 x [256 x float]], ptr %arg4, i32 0, i32 %46, i32 %45
  %49 = load float, ptr %48, align 4, !invariant.load !18
  %multiply.26 = fmul float %region_0_44_constant_108, %49
  %add.27 = fadd float %region_0_44_constant_87, %multiply.26
  br label %concatenate.35.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.163840.17
  %50 = phi i32 [ 163840, %concatenate.pivot.163840.17 ]
  %51 = sub nsw i32 %3, %50
  %52 = mul nuw nsw i32 %51, 1
  %53 = add nuw nsw i32 0, %52
  %54 = urem i32 %53, 256
  %55 = udiv i32 %53, 256
  %56 = udiv i32 %55, 128
  %region_0_44_constant_89 = load float, ptr @13, align 4
  %region_0_44_constant_1010 = load float, ptr @12, align 4
  %57 = getelementptr inbounds [128 x [256 x float]], ptr %arg5, i32 0, i32 %55, i32 %54
  %58 = load float, ptr %57, align 4, !invariant.load !18
  %multiply.29 = fmul float %region_0_44_constant_1010, %58
  %add.30 = fadd float %region_0_44_constant_89, %multiply.29
  br label %concatenate.35.merge

concat_index_from_operand_id6:                    ; preds = %concatenate.pivot.196608.18
  %59 = phi i32 [ 196608, %concatenate.pivot.196608.18 ]
  %60 = sub nsw i32 %3, %59
  %61 = mul nuw nsw i32 %60, 1
  %62 = add nuw nsw i32 0, %61
  %63 = urem i32 %62, 256
  %64 = udiv i32 %62, 256
  %65 = udiv i32 %64, 128
  %region_0_44_constant_811 = load float, ptr @13, align 4
  %region_0_44_constant_1012 = load float, ptr @12, align 4
  %66 = getelementptr inbounds [128 x [256 x float]], ptr %arg6, i32 0, i32 %64, i32 %63
  %67 = load float, ptr %66, align 4, !invariant.load !18
  %multiply.32 = fmul float %region_0_44_constant_1012, %67
  %add.33 = fadd float %region_0_44_constant_811, %multiply.32
  br label %concatenate.35.merge

concatenate.pivot.98304.:                         ; preds = %fusion_63.in_bounds-true
  %68 = icmp ult i32 %3, 98304
  br i1 %68, label %concatenate.pivot.32768., label %concatenate.pivot.163840.

concatenate.pivot.32768.:                         ; preds = %concatenate.pivot.98304.
  %69 = icmp ult i32 %3, 32768
  br i1 %69, label %concatenate.pivot.0., label %concatenate.pivot.65536.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.32768.
  br label %concat_index_from_operand_id0

concatenate.pivot.65536.:                         ; preds = %concatenate.pivot.32768.
  %70 = icmp ult i32 %3, 65536
  br i1 %70, label %concatenate.pivot.32768.13, label %concatenate.pivot.65536.14

concatenate.pivot.32768.13:                       ; preds = %concatenate.pivot.65536.
  br label %concat_index_from_operand_id1

concatenate.pivot.65536.14:                       ; preds = %concatenate.pivot.65536.
  br label %concat_index_from_operand_id2

concatenate.pivot.163840.:                        ; preds = %concatenate.pivot.98304.
  %71 = icmp ult i32 %3, 163840
  br i1 %71, label %concatenate.pivot.131072., label %concatenate.pivot.196608.

concatenate.pivot.131072.:                        ; preds = %concatenate.pivot.163840.
  %72 = icmp ult i32 %3, 131072
  br i1 %72, label %concatenate.pivot.98304.15, label %concatenate.pivot.131072.16

concatenate.pivot.98304.15:                       ; preds = %concatenate.pivot.131072.
  br label %concat_index_from_operand_id3

concatenate.pivot.131072.16:                      ; preds = %concatenate.pivot.131072.
  br label %concat_index_from_operand_id4

concatenate.pivot.196608.:                        ; preds = %concatenate.pivot.163840.
  %73 = icmp ult i32 %3, 196608
  br i1 %73, label %concatenate.pivot.163840.17, label %concatenate.pivot.196608.18

concatenate.pivot.163840.17:                      ; preds = %concatenate.pivot.196608.
  br label %concat_index_from_operand_id5

concatenate.pivot.196608.18:                      ; preds = %concatenate.pivot.196608.
  br label %concat_index_from_operand_id6

concatenate.35.merge:                             ; preds = %concat_index_from_operand_id6, %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %74 = phi float [ %add.13, %concat_index_from_operand_id0 ], [ %add.16, %concat_index_from_operand_id1 ], [ %add.21, %concat_index_from_operand_id2 ], [ %add.24, %concat_index_from_operand_id3 ], [ %add.27, %concat_index_from_operand_id4 ], [ %add.30, %concat_index_from_operand_id5 ], [ %add.33, %concat_index_from_operand_id6 ]
  %75 = icmp sge i32 %3, 0
  %76 = icmp slt i32 %3, 32768
  %77 = and i1 %75, %76
  br i1 %77, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.35.merge
  %78 = icmp sge i32 %3, 32768
  %79 = icmp slt i32 %3, 65536
  %80 = and i1 %78, %79
  br i1 %80, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %81 = icmp sge i32 %3, 65536
  %82 = icmp slt i32 %3, 98304
  %83 = and i1 %81, %82
  br i1 %83, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %84 = icmp sge i32 %3, 98304
  %85 = icmp slt i32 %3, 131072
  %86 = and i1 %84, %85
  br i1 %86, label %slice3-true, label %slice3-after

slice3-after:                                     ; preds = %slice3-true, %slice2-after
  %87 = icmp sge i32 %3, 131072
  %88 = icmp slt i32 %3, 163840
  %89 = and i1 %87, %88
  br i1 %89, label %slice4-true, label %slice4-after

slice4-after:                                     ; preds = %slice4-true, %slice3-after
  %90 = icmp sge i32 %3, 163840
  %91 = icmp slt i32 %3, 196608
  %92 = and i1 %90, %91
  br i1 %92, label %slice5-true, label %slice5-after

slice5-after:                                     ; preds = %slice5-true, %slice4-after
  %93 = icmp sge i32 %3, 196608
  %94 = icmp slt i32 %3, 229376
  %95 = and i1 %93, %94
  br i1 %95, label %slice6-true, label %slice6-after

slice6-after:                                     ; preds = %slice6-true, %slice5-after
  br label %fusion_63.in_bounds-after

slice0-true:                                      ; preds = %concatenate.35.merge
  %96 = sub i32 %3, 0
  %97 = getelementptr inbounds [32768 x float], ptr %arg7, i32 0, i32 %96
  store float %74, ptr %97, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %98 = sub i32 %3, 32768
  %99 = getelementptr inbounds [32768 x float], ptr %arg8, i32 0, i32 %98
  store float %74, ptr %99, align 4
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %100 = sub i32 %3, 65536
  %101 = getelementptr inbounds [32768 x float], ptr %arg9, i32 0, i32 %100
  store float %74, ptr %101, align 4
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  %102 = sub i32 %3, 98304
  %103 = getelementptr inbounds [32768 x float], ptr %arg10, i32 0, i32 %102
  store float %74, ptr %103, align 4
  br label %slice3-after

slice4-true:                                      ; preds = %slice3-after
  %104 = sub i32 %3, 131072
  %105 = getelementptr inbounds [32768 x float], ptr %arg11, i32 0, i32 %104
  store float %74, ptr %105, align 4
  br label %slice4-after

slice5-true:                                      ; preds = %slice4-after
  %106 = sub i32 %3, 163840
  %107 = getelementptr inbounds [32768 x float], ptr %arg12, i32 0, i32 %106
  store float %74, ptr %107, align 4
  br label %slice5-after

slice6-true:                                      ; preds = %slice5-after
  %108 = sub i32 %3, 196608
  %109 = getelementptr inbounds [32768 x float], ptr %arg13, i32 0, i32 %108
  store float %74, ptr %109, align 4
  br label %slice6-after
}

define void @copy_fusion_1(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 16 dereferenceable(131072) %arg6, ptr noalias align 16 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(131072) %arg10, ptr noalias align 128 dereferenceable(131072) %arg11, ptr noalias align 128 dereferenceable(131072) %arg12, ptr noalias align 128 dereferenceable(131072) %arg13, ptr noalias align 128 dereferenceable(131072) %arg14, ptr noalias align 128 dereferenceable(131072) %arg15) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 131072
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 131072
  br i1 %4, label %copy_fusion_1.in_bounds-true, label %copy_fusion_1.in_bounds-after

copy_fusion_1.in_bounds-after:                    ; preds = %slice7-after, %entry
  ret void

copy_fusion_1.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.65536.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 256
  %10 = udiv i32 %8, 256
  %11 = udiv i32 %10, 128
  %region_0_60_constant_9 = load float, ptr @21, align 4
  %region_0_60_constant_11 = load float, ptr @20, align 4
  %12 = getelementptr inbounds [128 x [256 x float]], ptr %arg0, i32 0, i32 %10, i32 %9
  %13 = load float, ptr %12, align 4, !invariant.load !18
  %multiply.13 = fmul float %region_0_60_constant_11, %13
  %add.14 = fadd float %region_0_60_constant_9, %multiply.13
  br label %concatenate.37.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.32768.1
  %14 = phi i32 [ 32768, %concatenate.pivot.32768.1 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 128
  %19 = udiv i32 %17, 128
  %20 = udiv i32 %19, 256
  %region_0_60_constant_16 = load float, ptr @19, align 4
  %region_0_60_constant_18 = load float, ptr @18, align 4
  %21 = getelementptr inbounds [256 x [128 x float]], ptr %arg2, i32 0, i32 %19, i32 %18
  %22 = load float, ptr %21, align 4, !invariant.load !18
  %multiply.20 = fmul float %region_0_60_constant_18, %22
  %add.21 = fadd float %region_0_60_constant_16, %multiply.20
  br label %concatenate.37.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.65536.2
  %23 = phi i32 [ 65536, %concatenate.pivot.65536.2 ]
  %24 = sub nsw i32 %3, %23
  %25 = mul nuw nsw i32 %24, 1
  %26 = add nuw nsw i32 0, %25
  %27 = urem i32 %26, 256
  %28 = udiv i32 %26, 256
  %29 = udiv i32 %28, 128
  %region_0_60_constant_23 = load float, ptr @17, align 4
  %region_0_60_constant_25 = load float, ptr @16, align 4
  %30 = getelementptr inbounds [128 x [256 x float]], ptr %arg4, i32 0, i32 %28, i32 %27
  %31 = load float, ptr %30, align 4, !invariant.load !18
  %multiply.27 = fmul float %region_0_60_constant_25, %31
  %add.28 = fadd float %region_0_60_constant_23, %multiply.27
  br label %concatenate.37.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.98304.3
  %32 = phi i32 [ 98304, %concatenate.pivot.98304.3 ]
  %33 = sub nsw i32 %3, %32
  %34 = mul nuw nsw i32 %33, 1
  %35 = add nuw nsw i32 0, %34
  %36 = urem i32 %35, 128
  %37 = udiv i32 %35, 128
  %38 = udiv i32 %37, 256
  %region_0_60_constant_30 = load float, ptr @15, align 4
  %region_0_60_constant_32 = load float, ptr @14, align 4
  %39 = getelementptr inbounds [256 x [128 x float]], ptr %arg6, i32 0, i32 %37, i32 %36
  %40 = load float, ptr %39, align 4, !invariant.load !18
  %multiply.34 = fmul float %region_0_60_constant_32, %40
  %add.35 = fadd float %region_0_60_constant_30, %multiply.34
  br label %concatenate.37.merge

concatenate.pivot.65536.:                         ; preds = %copy_fusion_1.in_bounds-true
  %41 = icmp ult i32 %3, 65536
  br i1 %41, label %concatenate.pivot.32768., label %concatenate.pivot.98304.

concatenate.pivot.32768.:                         ; preds = %concatenate.pivot.65536.
  %42 = icmp ult i32 %3, 32768
  br i1 %42, label %concatenate.pivot.0., label %concatenate.pivot.32768.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.32768.
  br label %concat_index_from_operand_id0

concatenate.pivot.32768.1:                        ; preds = %concatenate.pivot.32768.
  br label %concat_index_from_operand_id1

concatenate.pivot.98304.:                         ; preds = %concatenate.pivot.65536.
  %43 = icmp ult i32 %3, 98304
  br i1 %43, label %concatenate.pivot.65536.2, label %concatenate.pivot.98304.3

concatenate.pivot.65536.2:                        ; preds = %concatenate.pivot.98304.
  br label %concat_index_from_operand_id2

concatenate.pivot.98304.3:                        ; preds = %concatenate.pivot.98304.
  br label %concat_index_from_operand_id3

concatenate.37.merge:                             ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %44 = phi float [ %add.14, %concat_index_from_operand_id0 ], [ %add.21, %concat_index_from_operand_id1 ], [ %add.28, %concat_index_from_operand_id2 ], [ %add.35, %concat_index_from_operand_id3 ]
  br label %concatenate.pivot.65536.16

concat_index_from_operand_id04:                   ; preds = %concatenate.pivot.0.18
  %45 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %46 = sub nsw i32 %3, %45
  %47 = mul nuw nsw i32 %46, 1
  %48 = add nuw nsw i32 0, %47
  %49 = urem i32 %48, 256
  %50 = udiv i32 %48, 256
  %51 = udiv i32 %50, 128
  %region_0_60_constant_95 = load float, ptr @21, align 4
  %52 = getelementptr inbounds [128 x [256 x float]], ptr %arg1, i32 0, i32 %50, i32 %49
  %53 = load float, ptr %52, align 4, !invariant.load !18
  %region_0_60_constant_116 = load float, ptr @20, align 4
  %multiply.39 = fmul float %53, %region_0_60_constant_116
  %add.40 = fadd float %region_0_60_constant_95, %multiply.39
  br label %concatenate.51.merge

concat_index_from_operand_id17:                   ; preds = %concatenate.pivot.32768.19
  %54 = phi i32 [ 32768, %concatenate.pivot.32768.19 ]
  %55 = sub nsw i32 %3, %54
  %56 = mul nuw nsw i32 %55, 1
  %57 = add nuw nsw i32 0, %56
  %58 = urem i32 %57, 128
  %59 = udiv i32 %57, 128
  %60 = udiv i32 %59, 256
  %region_0_60_constant_168 = load float, ptr @19, align 4
  %region_0_60_constant_189 = load float, ptr @18, align 4
  %61 = getelementptr inbounds [256 x [128 x float]], ptr %arg3, i32 0, i32 %59, i32 %58
  %62 = load float, ptr %61, align 4, !invariant.load !18
  %multiply.42 = fmul float %region_0_60_constant_189, %62
  %add.43 = fadd float %region_0_60_constant_168, %multiply.42
  br label %concatenate.51.merge

concat_index_from_operand_id210:                  ; preds = %concatenate.pivot.65536.21
  %63 = phi i32 [ 65536, %concatenate.pivot.65536.21 ]
  %64 = sub nsw i32 %3, %63
  %65 = mul nuw nsw i32 %64, 1
  %66 = add nuw nsw i32 0, %65
  %67 = urem i32 %66, 256
  %68 = udiv i32 %66, 256
  %69 = udiv i32 %68, 128
  %region_0_60_constant_2311 = load float, ptr @17, align 4
  %region_0_60_constant_2512 = load float, ptr @16, align 4
  %70 = getelementptr inbounds [128 x [256 x float]], ptr %arg5, i32 0, i32 %68, i32 %67
  %71 = load float, ptr %70, align 4, !invariant.load !18
  %multiply.45 = fmul float %region_0_60_constant_2512, %71
  %add.46 = fadd float %region_0_60_constant_2311, %multiply.45
  br label %concatenate.51.merge

concat_index_from_operand_id313:                  ; preds = %concatenate.pivot.98304.22
  %72 = phi i32 [ 98304, %concatenate.pivot.98304.22 ]
  %73 = sub nsw i32 %3, %72
  %74 = mul nuw nsw i32 %73, 1
  %75 = add nuw nsw i32 0, %74
  %76 = urem i32 %75, 128
  %77 = udiv i32 %75, 128
  %78 = udiv i32 %77, 256
  %region_0_60_constant_3014 = load float, ptr @15, align 4
  %region_0_60_constant_3215 = load float, ptr @14, align 4
  %79 = getelementptr inbounds [256 x [128 x float]], ptr %arg7, i32 0, i32 %77, i32 %76
  %80 = load float, ptr %79, align 4, !invariant.load !18
  %multiply.48 = fmul float %region_0_60_constant_3215, %80
  %add.49 = fadd float %region_0_60_constant_3014, %multiply.48
  br label %concatenate.51.merge

concatenate.pivot.65536.16:                       ; preds = %concatenate.37.merge
  %81 = icmp ult i32 %3, 65536
  br i1 %81, label %concatenate.pivot.32768.17, label %concatenate.pivot.98304.20

concatenate.pivot.32768.17:                       ; preds = %concatenate.pivot.65536.16
  %82 = icmp ult i32 %3, 32768
  br i1 %82, label %concatenate.pivot.0.18, label %concatenate.pivot.32768.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.32768.17
  br label %concat_index_from_operand_id04

concatenate.pivot.32768.19:                       ; preds = %concatenate.pivot.32768.17
  br label %concat_index_from_operand_id17

concatenate.pivot.98304.20:                       ; preds = %concatenate.pivot.65536.16
  %83 = icmp ult i32 %3, 98304
  br i1 %83, label %concatenate.pivot.65536.21, label %concatenate.pivot.98304.22

concatenate.pivot.65536.21:                       ; preds = %concatenate.pivot.98304.20
  br label %concat_index_from_operand_id210

concatenate.pivot.98304.22:                       ; preds = %concatenate.pivot.98304.20
  br label %concat_index_from_operand_id313

concatenate.51.merge:                             ; preds = %concat_index_from_operand_id313, %concat_index_from_operand_id210, %concat_index_from_operand_id17, %concat_index_from_operand_id04
  %84 = phi float [ %add.40, %concat_index_from_operand_id04 ], [ %add.43, %concat_index_from_operand_id17 ], [ %add.46, %concat_index_from_operand_id210 ], [ %add.49, %concat_index_from_operand_id313 ]
  br label %concatenate.pivot.65536.44

concat_index_from_operand_id024:                  ; preds = %concatenate.pivot.0.46
  %85 = phi i32 [ 0, %concatenate.pivot.0.46 ]
  %86 = sub nsw i32 %3, %85
  %87 = mul nuw nsw i32 %86, 1
  %88 = add nuw nsw i32 0, %87
  %89 = urem i32 %88, 256
  %90 = udiv i32 %88, 256
  %91 = udiv i32 %90, 128
  %region_0_60_constant_925 = load float, ptr @21, align 4
  %region_0_60_constant_1126 = load float, ptr @20, align 4
  %92 = getelementptr inbounds [128 x [256 x float]], ptr %arg0, i32 0, i32 %90, i32 %89
  %93 = load float, ptr %92, align 4, !invariant.load !18
  %multiply.1327 = fmul float %region_0_60_constant_1126, %93
  %add.1428 = fadd float %region_0_60_constant_925, %multiply.1327
  br label %concatenate.37.merge23

concat_index_from_operand_id129:                  ; preds = %concatenate.pivot.32768.47
  %94 = phi i32 [ 32768, %concatenate.pivot.32768.47 ]
  %95 = sub nsw i32 %3, %94
  %96 = mul nuw nsw i32 %95, 1
  %97 = add nuw nsw i32 0, %96
  %98 = urem i32 %97, 128
  %99 = udiv i32 %97, 128
  %100 = udiv i32 %99, 256
  %region_0_60_constant_1630 = load float, ptr @19, align 4
  %region_0_60_constant_1831 = load float, ptr @18, align 4
  %101 = getelementptr inbounds [256 x [128 x float]], ptr %arg2, i32 0, i32 %99, i32 %98
  %102 = load float, ptr %101, align 4, !invariant.load !18
  %multiply.2032 = fmul float %region_0_60_constant_1831, %102
  %add.2133 = fadd float %region_0_60_constant_1630, %multiply.2032
  br label %concatenate.37.merge23

concat_index_from_operand_id234:                  ; preds = %concatenate.pivot.65536.49
  %103 = phi i32 [ 65536, %concatenate.pivot.65536.49 ]
  %104 = sub nsw i32 %3, %103
  %105 = mul nuw nsw i32 %104, 1
  %106 = add nuw nsw i32 0, %105
  %107 = urem i32 %106, 256
  %108 = udiv i32 %106, 256
  %109 = udiv i32 %108, 128
  %region_0_60_constant_2335 = load float, ptr @17, align 4
  %region_0_60_constant_2536 = load float, ptr @16, align 4
  %110 = getelementptr inbounds [128 x [256 x float]], ptr %arg4, i32 0, i32 %108, i32 %107
  %111 = load float, ptr %110, align 4, !invariant.load !18
  %multiply.2737 = fmul float %region_0_60_constant_2536, %111
  %add.2838 = fadd float %region_0_60_constant_2335, %multiply.2737
  br label %concatenate.37.merge23

concat_index_from_operand_id339:                  ; preds = %concatenate.pivot.98304.50
  %112 = phi i32 [ 98304, %concatenate.pivot.98304.50 ]
  %113 = sub nsw i32 %3, %112
  %114 = mul nuw nsw i32 %113, 1
  %115 = add nuw nsw i32 0, %114
  %116 = urem i32 %115, 128
  %117 = udiv i32 %115, 128
  %118 = udiv i32 %117, 256
  %region_0_60_constant_3040 = load float, ptr @15, align 4
  %region_0_60_constant_3241 = load float, ptr @14, align 4
  %119 = getelementptr inbounds [256 x [128 x float]], ptr %arg6, i32 0, i32 %117, i32 %116
  %120 = load float, ptr %119, align 4, !invariant.load !18
  %multiply.3442 = fmul float %region_0_60_constant_3241, %120
  %add.3543 = fadd float %region_0_60_constant_3040, %multiply.3442
  br label %concatenate.37.merge23

concatenate.pivot.65536.44:                       ; preds = %concatenate.51.merge
  %121 = icmp ult i32 %3, 65536
  br i1 %121, label %concatenate.pivot.32768.45, label %concatenate.pivot.98304.48

concatenate.pivot.32768.45:                       ; preds = %concatenate.pivot.65536.44
  %122 = icmp ult i32 %3, 32768
  br i1 %122, label %concatenate.pivot.0.46, label %concatenate.pivot.32768.47

concatenate.pivot.0.46:                           ; preds = %concatenate.pivot.32768.45
  br label %concat_index_from_operand_id024

concatenate.pivot.32768.47:                       ; preds = %concatenate.pivot.32768.45
  br label %concat_index_from_operand_id129

concatenate.pivot.98304.48:                       ; preds = %concatenate.pivot.65536.44
  %123 = icmp ult i32 %3, 98304
  br i1 %123, label %concatenate.pivot.65536.49, label %concatenate.pivot.98304.50

concatenate.pivot.65536.49:                       ; preds = %concatenate.pivot.98304.48
  br label %concat_index_from_operand_id234

concatenate.pivot.98304.50:                       ; preds = %concatenate.pivot.98304.48
  br label %concat_index_from_operand_id339

concatenate.37.merge23:                           ; preds = %concat_index_from_operand_id339, %concat_index_from_operand_id234, %concat_index_from_operand_id129, %concat_index_from_operand_id024
  %124 = phi float [ %add.1428, %concat_index_from_operand_id024 ], [ %add.2133, %concat_index_from_operand_id129 ], [ %add.2838, %concat_index_from_operand_id234 ], [ %add.3543, %concat_index_from_operand_id339 ]
  br label %concatenate.pivot.65536.72

concat_index_from_operand_id052:                  ; preds = %concatenate.pivot.0.74
  %125 = phi i32 [ 0, %concatenate.pivot.0.74 ]
  %126 = sub nsw i32 %3, %125
  %127 = mul nuw nsw i32 %126, 1
  %128 = add nuw nsw i32 0, %127
  %129 = urem i32 %128, 256
  %130 = udiv i32 %128, 256
  %131 = udiv i32 %130, 128
  %region_0_60_constant_953 = load float, ptr @21, align 4
  %132 = getelementptr inbounds [128 x [256 x float]], ptr %arg1, i32 0, i32 %130, i32 %129
  %133 = load float, ptr %132, align 4, !invariant.load !18
  %region_0_60_constant_1154 = load float, ptr @20, align 4
  %multiply.3955 = fmul float %133, %region_0_60_constant_1154
  %add.4056 = fadd float %region_0_60_constant_953, %multiply.3955
  br label %concatenate.51.merge51

concat_index_from_operand_id157:                  ; preds = %concatenate.pivot.32768.75
  %134 = phi i32 [ 32768, %concatenate.pivot.32768.75 ]
  %135 = sub nsw i32 %3, %134
  %136 = mul nuw nsw i32 %135, 1
  %137 = add nuw nsw i32 0, %136
  %138 = urem i32 %137, 128
  %139 = udiv i32 %137, 128
  %140 = udiv i32 %139, 256
  %region_0_60_constant_1658 = load float, ptr @19, align 4
  %region_0_60_constant_1859 = load float, ptr @18, align 4
  %141 = getelementptr inbounds [256 x [128 x float]], ptr %arg3, i32 0, i32 %139, i32 %138
  %142 = load float, ptr %141, align 4, !invariant.load !18
  %multiply.4260 = fmul float %region_0_60_constant_1859, %142
  %add.4361 = fadd float %region_0_60_constant_1658, %multiply.4260
  br label %concatenate.51.merge51

concat_index_from_operand_id262:                  ; preds = %concatenate.pivot.65536.77
  %143 = phi i32 [ 65536, %concatenate.pivot.65536.77 ]
  %144 = sub nsw i32 %3, %143
  %145 = mul nuw nsw i32 %144, 1
  %146 = add nuw nsw i32 0, %145
  %147 = urem i32 %146, 256
  %148 = udiv i32 %146, 256
  %149 = udiv i32 %148, 128
  %region_0_60_constant_2363 = load float, ptr @17, align 4
  %region_0_60_constant_2564 = load float, ptr @16, align 4
  %150 = getelementptr inbounds [128 x [256 x float]], ptr %arg5, i32 0, i32 %148, i32 %147
  %151 = load float, ptr %150, align 4, !invariant.load !18
  %multiply.4565 = fmul float %region_0_60_constant_2564, %151
  %add.4666 = fadd float %region_0_60_constant_2363, %multiply.4565
  br label %concatenate.51.merge51

concat_index_from_operand_id367:                  ; preds = %concatenate.pivot.98304.78
  %152 = phi i32 [ 98304, %concatenate.pivot.98304.78 ]
  %153 = sub nsw i32 %3, %152
  %154 = mul nuw nsw i32 %153, 1
  %155 = add nuw nsw i32 0, %154
  %156 = urem i32 %155, 128
  %157 = udiv i32 %155, 128
  %158 = udiv i32 %157, 256
  %region_0_60_constant_3068 = load float, ptr @15, align 4
  %region_0_60_constant_3269 = load float, ptr @14, align 4
  %159 = getelementptr inbounds [256 x [128 x float]], ptr %arg7, i32 0, i32 %157, i32 %156
  %160 = load float, ptr %159, align 4, !invariant.load !18
  %multiply.4870 = fmul float %region_0_60_constant_3269, %160
  %add.4971 = fadd float %region_0_60_constant_3068, %multiply.4870
  br label %concatenate.51.merge51

concatenate.pivot.65536.72:                       ; preds = %concatenate.37.merge23
  %161 = icmp ult i32 %3, 65536
  br i1 %161, label %concatenate.pivot.32768.73, label %concatenate.pivot.98304.76

concatenate.pivot.32768.73:                       ; preds = %concatenate.pivot.65536.72
  %162 = icmp ult i32 %3, 32768
  br i1 %162, label %concatenate.pivot.0.74, label %concatenate.pivot.32768.75

concatenate.pivot.0.74:                           ; preds = %concatenate.pivot.32768.73
  br label %concat_index_from_operand_id052

concatenate.pivot.32768.75:                       ; preds = %concatenate.pivot.32768.73
  br label %concat_index_from_operand_id157

concatenate.pivot.98304.76:                       ; preds = %concatenate.pivot.65536.72
  %163 = icmp ult i32 %3, 98304
  br i1 %163, label %concatenate.pivot.65536.77, label %concatenate.pivot.98304.78

concatenate.pivot.65536.77:                       ; preds = %concatenate.pivot.98304.76
  br label %concat_index_from_operand_id262

concatenate.pivot.98304.78:                       ; preds = %concatenate.pivot.98304.76
  br label %concat_index_from_operand_id367

concatenate.51.merge51:                           ; preds = %concat_index_from_operand_id367, %concat_index_from_operand_id262, %concat_index_from_operand_id157, %concat_index_from_operand_id052
  %164 = phi float [ %add.4056, %concat_index_from_operand_id052 ], [ %add.4361, %concat_index_from_operand_id157 ], [ %add.4666, %concat_index_from_operand_id262 ], [ %add.4971, %concat_index_from_operand_id367 ]
  br label %concatenate.pivot.65536.100

concat_index_from_operand_id080:                  ; preds = %concatenate.pivot.0.102
  %165 = phi i32 [ 0, %concatenate.pivot.0.102 ]
  %166 = sub nsw i32 %3, %165
  %167 = mul nuw nsw i32 %166, 1
  %168 = add nuw nsw i32 0, %167
  %169 = urem i32 %168, 256
  %170 = udiv i32 %168, 256
  %171 = udiv i32 %170, 128
  %region_0_60_constant_981 = load float, ptr @21, align 4
  %region_0_60_constant_1182 = load float, ptr @20, align 4
  %172 = getelementptr inbounds [128 x [256 x float]], ptr %arg0, i32 0, i32 %170, i32 %169
  %173 = load float, ptr %172, align 4, !invariant.load !18
  %multiply.1383 = fmul float %region_0_60_constant_1182, %173
  %add.1484 = fadd float %region_0_60_constant_981, %multiply.1383
  br label %concatenate.37.merge79

concat_index_from_operand_id185:                  ; preds = %concatenate.pivot.32768.103
  %174 = phi i32 [ 32768, %concatenate.pivot.32768.103 ]
  %175 = sub nsw i32 %3, %174
  %176 = mul nuw nsw i32 %175, 1
  %177 = add nuw nsw i32 0, %176
  %178 = urem i32 %177, 128
  %179 = udiv i32 %177, 128
  %180 = udiv i32 %179, 256
  %region_0_60_constant_1686 = load float, ptr @19, align 4
  %region_0_60_constant_1887 = load float, ptr @18, align 4
  %181 = getelementptr inbounds [256 x [128 x float]], ptr %arg2, i32 0, i32 %179, i32 %178
  %182 = load float, ptr %181, align 4, !invariant.load !18
  %multiply.2088 = fmul float %region_0_60_constant_1887, %182
  %add.2189 = fadd float %region_0_60_constant_1686, %multiply.2088
  br label %concatenate.37.merge79

concat_index_from_operand_id290:                  ; preds = %concatenate.pivot.65536.105
  %183 = phi i32 [ 65536, %concatenate.pivot.65536.105 ]
  %184 = sub nsw i32 %3, %183
  %185 = mul nuw nsw i32 %184, 1
  %186 = add nuw nsw i32 0, %185
  %187 = urem i32 %186, 256
  %188 = udiv i32 %186, 256
  %189 = udiv i32 %188, 128
  %region_0_60_constant_2391 = load float, ptr @17, align 4
  %region_0_60_constant_2592 = load float, ptr @16, align 4
  %190 = getelementptr inbounds [128 x [256 x float]], ptr %arg4, i32 0, i32 %188, i32 %187
  %191 = load float, ptr %190, align 4, !invariant.load !18
  %multiply.2793 = fmul float %region_0_60_constant_2592, %191
  %add.2894 = fadd float %region_0_60_constant_2391, %multiply.2793
  br label %concatenate.37.merge79

concat_index_from_operand_id395:                  ; preds = %concatenate.pivot.98304.106
  %192 = phi i32 [ 98304, %concatenate.pivot.98304.106 ]
  %193 = sub nsw i32 %3, %192
  %194 = mul nuw nsw i32 %193, 1
  %195 = add nuw nsw i32 0, %194
  %196 = urem i32 %195, 128
  %197 = udiv i32 %195, 128
  %198 = udiv i32 %197, 256
  %region_0_60_constant_3096 = load float, ptr @15, align 4
  %region_0_60_constant_3297 = load float, ptr @14, align 4
  %199 = getelementptr inbounds [256 x [128 x float]], ptr %arg6, i32 0, i32 %197, i32 %196
  %200 = load float, ptr %199, align 4, !invariant.load !18
  %multiply.3498 = fmul float %region_0_60_constant_3297, %200
  %add.3599 = fadd float %region_0_60_constant_3096, %multiply.3498
  br label %concatenate.37.merge79

concatenate.pivot.65536.100:                      ; preds = %concatenate.51.merge51
  %201 = icmp ult i32 %3, 65536
  br i1 %201, label %concatenate.pivot.32768.101, label %concatenate.pivot.98304.104

concatenate.pivot.32768.101:                      ; preds = %concatenate.pivot.65536.100
  %202 = icmp ult i32 %3, 32768
  br i1 %202, label %concatenate.pivot.0.102, label %concatenate.pivot.32768.103

concatenate.pivot.0.102:                          ; preds = %concatenate.pivot.32768.101
  br label %concat_index_from_operand_id080

concatenate.pivot.32768.103:                      ; preds = %concatenate.pivot.32768.101
  br label %concat_index_from_operand_id185

concatenate.pivot.98304.104:                      ; preds = %concatenate.pivot.65536.100
  %203 = icmp ult i32 %3, 98304
  br i1 %203, label %concatenate.pivot.65536.105, label %concatenate.pivot.98304.106

concatenate.pivot.65536.105:                      ; preds = %concatenate.pivot.98304.104
  br label %concat_index_from_operand_id290

concatenate.pivot.98304.106:                      ; preds = %concatenate.pivot.98304.104
  br label %concat_index_from_operand_id395

concatenate.37.merge79:                           ; preds = %concat_index_from_operand_id395, %concat_index_from_operand_id290, %concat_index_from_operand_id185, %concat_index_from_operand_id080
  %204 = phi float [ %add.1484, %concat_index_from_operand_id080 ], [ %add.2189, %concat_index_from_operand_id185 ], [ %add.2894, %concat_index_from_operand_id290 ], [ %add.3599, %concat_index_from_operand_id395 ]
  br label %concatenate.pivot.65536.128

concat_index_from_operand_id0108:                 ; preds = %concatenate.pivot.0.130
  %205 = phi i32 [ 0, %concatenate.pivot.0.130 ]
  %206 = sub nsw i32 %3, %205
  %207 = mul nuw nsw i32 %206, 1
  %208 = add nuw nsw i32 0, %207
  %209 = urem i32 %208, 256
  %210 = udiv i32 %208, 256
  %211 = udiv i32 %210, 128
  %region_0_60_constant_9109 = load float, ptr @21, align 4
  %212 = getelementptr inbounds [128 x [256 x float]], ptr %arg1, i32 0, i32 %210, i32 %209
  %213 = load float, ptr %212, align 4, !invariant.load !18
  %region_0_60_constant_11110 = load float, ptr @20, align 4
  %multiply.39111 = fmul float %213, %region_0_60_constant_11110
  %add.40112 = fadd float %region_0_60_constant_9109, %multiply.39111
  br label %concatenate.51.merge107

concat_index_from_operand_id1113:                 ; preds = %concatenate.pivot.32768.131
  %214 = phi i32 [ 32768, %concatenate.pivot.32768.131 ]
  %215 = sub nsw i32 %3, %214
  %216 = mul nuw nsw i32 %215, 1
  %217 = add nuw nsw i32 0, %216
  %218 = urem i32 %217, 128
  %219 = udiv i32 %217, 128
  %220 = udiv i32 %219, 256
  %region_0_60_constant_16114 = load float, ptr @19, align 4
  %region_0_60_constant_18115 = load float, ptr @18, align 4
  %221 = getelementptr inbounds [256 x [128 x float]], ptr %arg3, i32 0, i32 %219, i32 %218
  %222 = load float, ptr %221, align 4, !invariant.load !18
  %multiply.42116 = fmul float %region_0_60_constant_18115, %222
  %add.43117 = fadd float %region_0_60_constant_16114, %multiply.42116
  br label %concatenate.51.merge107

concat_index_from_operand_id2118:                 ; preds = %concatenate.pivot.65536.133
  %223 = phi i32 [ 65536, %concatenate.pivot.65536.133 ]
  %224 = sub nsw i32 %3, %223
  %225 = mul nuw nsw i32 %224, 1
  %226 = add nuw nsw i32 0, %225
  %227 = urem i32 %226, 256
  %228 = udiv i32 %226, 256
  %229 = udiv i32 %228, 128
  %region_0_60_constant_23119 = load float, ptr @17, align 4
  %region_0_60_constant_25120 = load float, ptr @16, align 4
  %230 = getelementptr inbounds [128 x [256 x float]], ptr %arg5, i32 0, i32 %228, i32 %227
  %231 = load float, ptr %230, align 4, !invariant.load !18
  %multiply.45121 = fmul float %region_0_60_constant_25120, %231
  %add.46122 = fadd float %region_0_60_constant_23119, %multiply.45121
  br label %concatenate.51.merge107

concat_index_from_operand_id3123:                 ; preds = %concatenate.pivot.98304.134
  %232 = phi i32 [ 98304, %concatenate.pivot.98304.134 ]
  %233 = sub nsw i32 %3, %232
  %234 = mul nuw nsw i32 %233, 1
  %235 = add nuw nsw i32 0, %234
  %236 = urem i32 %235, 128
  %237 = udiv i32 %235, 128
  %238 = udiv i32 %237, 256
  %region_0_60_constant_30124 = load float, ptr @15, align 4
  %region_0_60_constant_32125 = load float, ptr @14, align 4
  %239 = getelementptr inbounds [256 x [128 x float]], ptr %arg7, i32 0, i32 %237, i32 %236
  %240 = load float, ptr %239, align 4, !invariant.load !18
  %multiply.48126 = fmul float %region_0_60_constant_32125, %240
  %add.49127 = fadd float %region_0_60_constant_30124, %multiply.48126
  br label %concatenate.51.merge107

concatenate.pivot.65536.128:                      ; preds = %concatenate.37.merge79
  %241 = icmp ult i32 %3, 65536
  br i1 %241, label %concatenate.pivot.32768.129, label %concatenate.pivot.98304.132

concatenate.pivot.32768.129:                      ; preds = %concatenate.pivot.65536.128
  %242 = icmp ult i32 %3, 32768
  br i1 %242, label %concatenate.pivot.0.130, label %concatenate.pivot.32768.131

concatenate.pivot.0.130:                          ; preds = %concatenate.pivot.32768.129
  br label %concat_index_from_operand_id0108

concatenate.pivot.32768.131:                      ; preds = %concatenate.pivot.32768.129
  br label %concat_index_from_operand_id1113

concatenate.pivot.98304.132:                      ; preds = %concatenate.pivot.65536.128
  %243 = icmp ult i32 %3, 98304
  br i1 %243, label %concatenate.pivot.65536.133, label %concatenate.pivot.98304.134

concatenate.pivot.65536.133:                      ; preds = %concatenate.pivot.98304.132
  br label %concat_index_from_operand_id2118

concatenate.pivot.98304.134:                      ; preds = %concatenate.pivot.98304.132
  br label %concat_index_from_operand_id3123

concatenate.51.merge107:                          ; preds = %concat_index_from_operand_id3123, %concat_index_from_operand_id2118, %concat_index_from_operand_id1113, %concat_index_from_operand_id0108
  %244 = phi float [ %add.40112, %concat_index_from_operand_id0108 ], [ %add.43117, %concat_index_from_operand_id1113 ], [ %add.46122, %concat_index_from_operand_id2118 ], [ %add.49127, %concat_index_from_operand_id3123 ]
  br label %concatenate.pivot.65536.156

concat_index_from_operand_id0136:                 ; preds = %concatenate.pivot.0.158
  %245 = phi i32 [ 0, %concatenate.pivot.0.158 ]
  %246 = sub nsw i32 %3, %245
  %247 = mul nuw nsw i32 %246, 1
  %248 = add nuw nsw i32 0, %247
  %249 = urem i32 %248, 256
  %250 = udiv i32 %248, 256
  %251 = udiv i32 %250, 128
  %region_0_60_constant_9137 = load float, ptr @21, align 4
  %region_0_60_constant_11138 = load float, ptr @20, align 4
  %252 = getelementptr inbounds [128 x [256 x float]], ptr %arg0, i32 0, i32 %250, i32 %249
  %253 = load float, ptr %252, align 4, !invariant.load !18
  %multiply.13139 = fmul float %region_0_60_constant_11138, %253
  %add.14140 = fadd float %region_0_60_constant_9137, %multiply.13139
  br label %concatenate.37.merge135

concat_index_from_operand_id1141:                 ; preds = %concatenate.pivot.32768.159
  %254 = phi i32 [ 32768, %concatenate.pivot.32768.159 ]
  %255 = sub nsw i32 %3, %254
  %256 = mul nuw nsw i32 %255, 1
  %257 = add nuw nsw i32 0, %256
  %258 = urem i32 %257, 128
  %259 = udiv i32 %257, 128
  %260 = udiv i32 %259, 256
  %region_0_60_constant_16142 = load float, ptr @19, align 4
  %region_0_60_constant_18143 = load float, ptr @18, align 4
  %261 = getelementptr inbounds [256 x [128 x float]], ptr %arg2, i32 0, i32 %259, i32 %258
  %262 = load float, ptr %261, align 4, !invariant.load !18
  %multiply.20144 = fmul float %region_0_60_constant_18143, %262
  %add.21145 = fadd float %region_0_60_constant_16142, %multiply.20144
  br label %concatenate.37.merge135

concat_index_from_operand_id2146:                 ; preds = %concatenate.pivot.65536.161
  %263 = phi i32 [ 65536, %concatenate.pivot.65536.161 ]
  %264 = sub nsw i32 %3, %263
  %265 = mul nuw nsw i32 %264, 1
  %266 = add nuw nsw i32 0, %265
  %267 = urem i32 %266, 256
  %268 = udiv i32 %266, 256
  %269 = udiv i32 %268, 128
  %region_0_60_constant_23147 = load float, ptr @17, align 4
  %region_0_60_constant_25148 = load float, ptr @16, align 4
  %270 = getelementptr inbounds [128 x [256 x float]], ptr %arg4, i32 0, i32 %268, i32 %267
  %271 = load float, ptr %270, align 4, !invariant.load !18
  %multiply.27149 = fmul float %region_0_60_constant_25148, %271
  %add.28150 = fadd float %region_0_60_constant_23147, %multiply.27149
  br label %concatenate.37.merge135

concat_index_from_operand_id3151:                 ; preds = %concatenate.pivot.98304.162
  %272 = phi i32 [ 98304, %concatenate.pivot.98304.162 ]
  %273 = sub nsw i32 %3, %272
  %274 = mul nuw nsw i32 %273, 1
  %275 = add nuw nsw i32 0, %274
  %276 = urem i32 %275, 128
  %277 = udiv i32 %275, 128
  %278 = udiv i32 %277, 256
  %region_0_60_constant_30152 = load float, ptr @15, align 4
  %region_0_60_constant_32153 = load float, ptr @14, align 4
  %279 = getelementptr inbounds [256 x [128 x float]], ptr %arg6, i32 0, i32 %277, i32 %276
  %280 = load float, ptr %279, align 4, !invariant.load !18
  %multiply.34154 = fmul float %region_0_60_constant_32153, %280
  %add.35155 = fadd float %region_0_60_constant_30152, %multiply.34154
  br label %concatenate.37.merge135

concatenate.pivot.65536.156:                      ; preds = %concatenate.51.merge107
  %281 = icmp ult i32 %3, 65536
  br i1 %281, label %concatenate.pivot.32768.157, label %concatenate.pivot.98304.160

concatenate.pivot.32768.157:                      ; preds = %concatenate.pivot.65536.156
  %282 = icmp ult i32 %3, 32768
  br i1 %282, label %concatenate.pivot.0.158, label %concatenate.pivot.32768.159

concatenate.pivot.0.158:                          ; preds = %concatenate.pivot.32768.157
  br label %concat_index_from_operand_id0136

concatenate.pivot.32768.159:                      ; preds = %concatenate.pivot.32768.157
  br label %concat_index_from_operand_id1141

concatenate.pivot.98304.160:                      ; preds = %concatenate.pivot.65536.156
  %283 = icmp ult i32 %3, 98304
  br i1 %283, label %concatenate.pivot.65536.161, label %concatenate.pivot.98304.162

concatenate.pivot.65536.161:                      ; preds = %concatenate.pivot.98304.160
  br label %concat_index_from_operand_id2146

concatenate.pivot.98304.162:                      ; preds = %concatenate.pivot.98304.160
  br label %concat_index_from_operand_id3151

concatenate.37.merge135:                          ; preds = %concat_index_from_operand_id3151, %concat_index_from_operand_id2146, %concat_index_from_operand_id1141, %concat_index_from_operand_id0136
  %284 = phi float [ %add.14140, %concat_index_from_operand_id0136 ], [ %add.21145, %concat_index_from_operand_id1141 ], [ %add.28150, %concat_index_from_operand_id2146 ], [ %add.35155, %concat_index_from_operand_id3151 ]
  br label %concatenate.pivot.65536.184

concat_index_from_operand_id0164:                 ; preds = %concatenate.pivot.0.186
  %285 = phi i32 [ 0, %concatenate.pivot.0.186 ]
  %286 = sub nsw i32 %3, %285
  %287 = mul nuw nsw i32 %286, 1
  %288 = add nuw nsw i32 0, %287
  %289 = urem i32 %288, 256
  %290 = udiv i32 %288, 256
  %291 = udiv i32 %290, 128
  %region_0_60_constant_9165 = load float, ptr @21, align 4
  %292 = getelementptr inbounds [128 x [256 x float]], ptr %arg1, i32 0, i32 %290, i32 %289
  %293 = load float, ptr %292, align 4, !invariant.load !18
  %region_0_60_constant_11166 = load float, ptr @20, align 4
  %multiply.39167 = fmul float %293, %region_0_60_constant_11166
  %add.40168 = fadd float %region_0_60_constant_9165, %multiply.39167
  br label %concatenate.51.merge163

concat_index_from_operand_id1169:                 ; preds = %concatenate.pivot.32768.187
  %294 = phi i32 [ 32768, %concatenate.pivot.32768.187 ]
  %295 = sub nsw i32 %3, %294
  %296 = mul nuw nsw i32 %295, 1
  %297 = add nuw nsw i32 0, %296
  %298 = urem i32 %297, 128
  %299 = udiv i32 %297, 128
  %300 = udiv i32 %299, 256
  %region_0_60_constant_16170 = load float, ptr @19, align 4
  %region_0_60_constant_18171 = load float, ptr @18, align 4
  %301 = getelementptr inbounds [256 x [128 x float]], ptr %arg3, i32 0, i32 %299, i32 %298
  %302 = load float, ptr %301, align 4, !invariant.load !18
  %multiply.42172 = fmul float %region_0_60_constant_18171, %302
  %add.43173 = fadd float %region_0_60_constant_16170, %multiply.42172
  br label %concatenate.51.merge163

concat_index_from_operand_id2174:                 ; preds = %concatenate.pivot.65536.189
  %303 = phi i32 [ 65536, %concatenate.pivot.65536.189 ]
  %304 = sub nsw i32 %3, %303
  %305 = mul nuw nsw i32 %304, 1
  %306 = add nuw nsw i32 0, %305
  %307 = urem i32 %306, 256
  %308 = udiv i32 %306, 256
  %309 = udiv i32 %308, 128
  %region_0_60_constant_23175 = load float, ptr @17, align 4
  %region_0_60_constant_25176 = load float, ptr @16, align 4
  %310 = getelementptr inbounds [128 x [256 x float]], ptr %arg5, i32 0, i32 %308, i32 %307
  %311 = load float, ptr %310, align 4, !invariant.load !18
  %multiply.45177 = fmul float %region_0_60_constant_25176, %311
  %add.46178 = fadd float %region_0_60_constant_23175, %multiply.45177
  br label %concatenate.51.merge163

concat_index_from_operand_id3179:                 ; preds = %concatenate.pivot.98304.190
  %312 = phi i32 [ 98304, %concatenate.pivot.98304.190 ]
  %313 = sub nsw i32 %3, %312
  %314 = mul nuw nsw i32 %313, 1
  %315 = add nuw nsw i32 0, %314
  %316 = urem i32 %315, 128
  %317 = udiv i32 %315, 128
  %318 = udiv i32 %317, 256
  %region_0_60_constant_30180 = load float, ptr @15, align 4
  %region_0_60_constant_32181 = load float, ptr @14, align 4
  %319 = getelementptr inbounds [256 x [128 x float]], ptr %arg7, i32 0, i32 %317, i32 %316
  %320 = load float, ptr %319, align 4, !invariant.load !18
  %multiply.48182 = fmul float %region_0_60_constant_32181, %320
  %add.49183 = fadd float %region_0_60_constant_30180, %multiply.48182
  br label %concatenate.51.merge163

concatenate.pivot.65536.184:                      ; preds = %concatenate.37.merge135
  %321 = icmp ult i32 %3, 65536
  br i1 %321, label %concatenate.pivot.32768.185, label %concatenate.pivot.98304.188

concatenate.pivot.32768.185:                      ; preds = %concatenate.pivot.65536.184
  %322 = icmp ult i32 %3, 32768
  br i1 %322, label %concatenate.pivot.0.186, label %concatenate.pivot.32768.187

concatenate.pivot.0.186:                          ; preds = %concatenate.pivot.32768.185
  br label %concat_index_from_operand_id0164

concatenate.pivot.32768.187:                      ; preds = %concatenate.pivot.32768.185
  br label %concat_index_from_operand_id1169

concatenate.pivot.98304.188:                      ; preds = %concatenate.pivot.65536.184
  %323 = icmp ult i32 %3, 98304
  br i1 %323, label %concatenate.pivot.65536.189, label %concatenate.pivot.98304.190

concatenate.pivot.65536.189:                      ; preds = %concatenate.pivot.98304.188
  br label %concat_index_from_operand_id2174

concatenate.pivot.98304.190:                      ; preds = %concatenate.pivot.98304.188
  br label %concat_index_from_operand_id3179

concatenate.51.merge163:                          ; preds = %concat_index_from_operand_id3179, %concat_index_from_operand_id2174, %concat_index_from_operand_id1169, %concat_index_from_operand_id0164
  %324 = phi float [ %add.40168, %concat_index_from_operand_id0164 ], [ %add.43173, %concat_index_from_operand_id1169 ], [ %add.46178, %concat_index_from_operand_id2174 ], [ %add.49183, %concat_index_from_operand_id3179 ]
  %325 = icmp sge i32 %3, 0
  %326 = icmp slt i32 %3, 32768
  %327 = and i1 %325, %326
  br i1 %327, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.51.merge163
  %328 = icmp sge i32 %3, 0
  %329 = icmp slt i32 %3, 32768
  %330 = and i1 %328, %329
  br i1 %330, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %331 = icmp sge i32 %3, 32768
  %332 = icmp slt i32 %3, 65536
  %333 = and i1 %331, %332
  br i1 %333, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %334 = icmp sge i32 %3, 32768
  %335 = icmp slt i32 %3, 65536
  %336 = and i1 %334, %335
  br i1 %336, label %slice3-true, label %slice3-after

slice3-after:                                     ; preds = %slice3-true, %slice2-after
  %337 = icmp sge i32 %3, 65536
  %338 = icmp slt i32 %3, 98304
  %339 = and i1 %337, %338
  br i1 %339, label %slice4-true, label %slice4-after

slice4-after:                                     ; preds = %slice4-true, %slice3-after
  %340 = icmp sge i32 %3, 65536
  %341 = icmp slt i32 %3, 98304
  %342 = and i1 %340, %341
  br i1 %342, label %slice5-true, label %slice5-after

slice5-after:                                     ; preds = %slice5-true, %slice4-after
  %343 = icmp sge i32 %3, 98304
  %344 = icmp slt i32 %3, 131072
  %345 = and i1 %343, %344
  br i1 %345, label %slice6-true, label %slice6-after

slice6-after:                                     ; preds = %slice6-true, %slice5-after
  %346 = icmp sge i32 %3, 98304
  %347 = icmp slt i32 %3, 131072
  %348 = and i1 %346, %347
  br i1 %348, label %slice7-true, label %slice7-after

slice7-after:                                     ; preds = %slice7-true, %slice6-after
  br label %copy_fusion_1.in_bounds-after

slice0-true:                                      ; preds = %concatenate.51.merge163
  %349 = sub i32 %3, 0
  %350 = getelementptr inbounds [32768 x float], ptr %arg8, i32 0, i32 %349
  store float %44, ptr %350, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %351 = sub i32 %3, 0
  %352 = getelementptr inbounds [32768 x float], ptr %arg9, i32 0, i32 %351
  store float %84, ptr %352, align 4
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %353 = sub i32 %3, 32768
  %354 = getelementptr inbounds [32768 x float], ptr %arg10, i32 0, i32 %353
  store float %124, ptr %354, align 4
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  %355 = sub i32 %3, 32768
  %356 = getelementptr inbounds [32768 x float], ptr %arg11, i32 0, i32 %355
  store float %164, ptr %356, align 4
  br label %slice3-after

slice4-true:                                      ; preds = %slice3-after
  %357 = sub i32 %3, 65536
  %358 = getelementptr inbounds [32768 x float], ptr %arg12, i32 0, i32 %357
  store float %204, ptr %358, align 4
  br label %slice4-after

slice5-true:                                      ; preds = %slice4-after
  %359 = sub i32 %3, 65536
  %360 = getelementptr inbounds [32768 x float], ptr %arg13, i32 0, i32 %359
  store float %244, ptr %360, align 4
  br label %slice5-after

slice6-true:                                      ; preds = %slice5-after
  %361 = sub i32 %3, 98304
  %362 = getelementptr inbounds [32768 x float], ptr %arg14, i32 0, i32 %361
  store float %284, ptr %362, align 4
  br label %slice6-after

slice7-true:                                      ; preds = %slice6-after
  %363 = sub i32 %3, 98304
  %364 = getelementptr inbounds [32768 x float], ptr %arg15, i32 0, i32 %363
  store float %324, ptr %364, align 4
  br label %slice7-after
}

define void @fusion_58(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 16 dereferenceable(131072) %arg6, ptr noalias align 16 dereferenceable(131072) %arg7, ptr noalias align 16 dereferenceable(131072) %arg8, ptr noalias align 16 dereferenceable(131072) %arg9, ptr noalias align 16 dereferenceable(131072) %arg10, ptr noalias align 16 dereferenceable(131072) %arg11, ptr noalias align 16 dereferenceable(131072) %arg12, ptr noalias align 128 dereferenceable(131072) %arg13, ptr noalias align 128 dereferenceable(131072) %arg14, ptr noalias align 128 dereferenceable(131072) %arg15, ptr noalias align 128 dereferenceable(131072) %arg16, ptr noalias align 128 dereferenceable(131072) %arg17, ptr noalias align 128 dereferenceable(131072) %arg18, ptr noalias align 128 dereferenceable(131072) %arg19, ptr noalias align 128 dereferenceable(131072) %arg20, ptr noalias align 128 dereferenceable(131072) %arg21, ptr noalias align 128 dereferenceable(131072) %arg22, ptr noalias align 128 dereferenceable(131072) %arg23, ptr noalias align 128 dereferenceable(131072) %arg24, ptr noalias align 128 dereferenceable(131072) %arg25) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_58.in_bounds-true, label %fusion_58.in_bounds-after

fusion_58.in_bounds-after:                        ; preds = %fusion_58.in_bounds-true, %entry
  ret void

fusion_58.in_bounds-true:                         ; preds = %entry
  %region_0_45_constant_14 = load float, ptr @23, align 4
  %region_0_45_constant_16 = load float, ptr @22, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !18
  %multiply.18 = fmul float %region_0_45_constant_16, %8
  %add.19 = fadd float %region_0_45_constant_14, %multiply.18
  %9 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.19, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !18
  %multiply.20 = fmul float %region_0_45_constant_16, %11
  %add.21 = fadd float %region_0_45_constant_14, %multiply.20
  %12 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %9, float %add.21, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !18
  %multiply.22 = fmul float %region_0_45_constant_16, %14
  %add.23 = fadd float %region_0_45_constant_14, %multiply.22
  %15 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %12, float %add.23, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !18
  %multiply.24 = fmul float %region_0_45_constant_16, %17
  %add.25 = fadd float %region_0_45_constant_14, %multiply.24
  %18 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %15, float %add.25, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !18
  %multiply.26 = fmul float %region_0_45_constant_16, %20
  %add.27 = fadd float %region_0_45_constant_14, %multiply.26
  %21 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %18, float %add.27, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !18
  %multiply.28 = fmul float %region_0_45_constant_16, %23
  %add.29 = fadd float %region_0_45_constant_14, %multiply.28
  %24 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %21, float %add.29, 5
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !18
  %multiply.30 = fmul float %region_0_45_constant_16, %26
  %add.31 = fadd float %region_0_45_constant_14, %multiply.30
  %27 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %24, float %add.31, 6
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %29 = load float, ptr %28, align 4, !invariant.load !18
  %multiply.32 = fmul float %region_0_45_constant_16, %29
  %add.33 = fadd float %region_0_45_constant_14, %multiply.32
  %30 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %27, float %add.33, 7
  %31 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %32 = load float, ptr %31, align 4, !invariant.load !18
  %multiply.34 = fmul float %region_0_45_constant_16, %32
  %add.35 = fadd float %region_0_45_constant_14, %multiply.34
  %33 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %30, float %add.35, 8
  %34 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %35 = load float, ptr %34, align 4, !invariant.load !18
  %multiply.36 = fmul float %region_0_45_constant_16, %35
  %add.37 = fadd float %region_0_45_constant_14, %multiply.36
  %36 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %33, float %add.37, 9
  %37 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %38 = load float, ptr %37, align 4, !invariant.load !18
  %multiply.38 = fmul float %region_0_45_constant_16, %38
  %add.39 = fadd float %region_0_45_constant_14, %multiply.38
  %39 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %36, float %add.39, 10
  %40 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %41 = load float, ptr %40, align 4, !invariant.load !18
  %multiply.40 = fmul float %region_0_45_constant_16, %41
  %add.41 = fadd float %region_0_45_constant_14, %multiply.40
  %42 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %39, float %add.41, 11
  %43 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %44 = load float, ptr %43, align 4, !invariant.load !18
  %multiply.42 = fmul float %region_0_45_constant_16, %44
  %add.43 = fadd float %region_0_45_constant_14, %multiply.42
  %45 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %42, float %add.43, 12
  %46 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 0
  %47 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  store float %46, ptr %47, align 4
  %48 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 1
  %49 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  store float %48, ptr %49, align 4
  %50 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 2
  %51 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  store float %50, ptr %51, align 4
  %52 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 3
  %53 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  store float %52, ptr %53, align 4
  %54 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 4
  %55 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  store float %54, ptr %55, align 4
  %56 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 5
  %57 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  store float %56, ptr %57, align 4
  %58 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 6
  %59 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  store float %58, ptr %59, align 4
  %60 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 7
  %61 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  store float %60, ptr %61, align 4
  %62 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 8
  %63 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  store float %62, ptr %63, align 4
  %64 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 9
  %65 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  store float %64, ptr %65, align 4
  %66 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 10
  %67 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  store float %66, ptr %67, align 4
  %68 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 11
  %69 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  store float %68, ptr %69, align 4
  %70 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float } %45, 12
  %71 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  store float %70, ptr %71, align 4
  br label %fusion_58.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15}

!0 = !{ptr @fusion_54, !"kernel", i32 1}
!1 = !{ptr @fusion_54, !"reqntidx", i32 1024}
!2 = !{ptr @fusion_57, !"kernel", i32 1}
!3 = !{ptr @fusion_57, !"reqntidx", i32 1024}
!4 = !{ptr @fusion_53, !"kernel", i32 1}
!5 = !{ptr @fusion_53, !"reqntidx", i32 1024}
!6 = !{ptr @fusion_61, !"kernel", i32 1}
!7 = !{ptr @fusion_61, !"reqntidx", i32 1024}
!8 = !{ptr @copy_fusion, !"kernel", i32 1}
!9 = !{ptr @copy_fusion, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_63, !"kernel", i32 1}
!11 = !{ptr @fusion_63, !"reqntidx", i32 1024}
!12 = !{ptr @copy_fusion_1, !"kernel", i32 1}
!13 = !{ptr @copy_fusion_1, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_58, !"kernel", i32 1}
!15 = !{ptr @fusion_58, !"reqntidx", i32 1024}
!16 = !{i32 0, i32 32}
!17 = !{i32 0, i32 1024}
!18 = !{}
!19 = !{i32 0, i32 224}
!20 = !{i32 0, i32 128}
