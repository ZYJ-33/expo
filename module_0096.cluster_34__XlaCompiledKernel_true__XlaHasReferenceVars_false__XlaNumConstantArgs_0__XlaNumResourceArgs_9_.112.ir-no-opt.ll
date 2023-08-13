target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = constant [64 x i8] c"q\C4\1C>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"q\C4\1C>"
@1 = private unnamed_addr constant [4 x i8] c"q\C4\9C\BD"

define void @fusion_9(ptr noalias align 16 dereferenceable(2048) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 16 dereferenceable(2048) %arg2, ptr noalias align 16 dereferenceable(2048) %arg3, ptr noalias align 16 dereferenceable(2048) %arg4, ptr noalias align 16 dereferenceable(2048) %arg5, ptr noalias align 16 dereferenceable(2048) %arg6, ptr noalias align 16 dereferenceable(2048) %arg7, ptr noalias align 16 dereferenceable(2048) %arg8, ptr noalias align 128 dereferenceable(2048) %arg9, ptr noalias align 128 dereferenceable(2048) %arg10, ptr noalias align 128 dereferenceable(2048) %arg11, ptr noalias align 128 dereferenceable(2048) %arg12, ptr noalias align 128 dereferenceable(2048) %arg13, ptr noalias align 128 dereferenceable(2048) %arg14, ptr noalias align 128 dereferenceable(2048) %arg15, ptr noalias align 128 dereferenceable(2048) %arg16, ptr noalias align 128 dereferenceable(2048) %arg17) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 512
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 512
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 512
  br i1 %4, label %fusion_9.in_bounds-true, label %fusion_9.in_bounds-after

fusion_9.in_bounds-after:                         ; preds = %fusion_9.in_bounds-true, %entry
  ret void

fusion_9.in_bounds-true:                          ; preds = %entry
  %region_0_33_constant_10 = load float, ptr @1, align 4
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !4
  %region_0_33_constant_12 = load float, ptr @0, align 4
  %multiply.14 = fmul float %6, %region_0_33_constant_12
  %add.15 = fadd float %region_0_33_constant_10, %multiply.14
  %7 = insertvalue { float, float, float, float, float, float, float, float, float } undef, float %add.15, 0
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4, !invariant.load !4
  %multiply.16 = fmul float %region_0_33_constant_12, %9
  %add.17 = fadd float %region_0_33_constant_10, %multiply.16
  %10 = insertvalue { float, float, float, float, float, float, float, float, float } %7, float %add.17, 1
  %11 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !4
  %multiply.18 = fmul float %region_0_33_constant_12, %12
  %add.19 = fadd float %region_0_33_constant_10, %multiply.18
  %13 = insertvalue { float, float, float, float, float, float, float, float, float } %10, float %add.19, 2
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %15 = load float, ptr %14, align 4, !invariant.load !4
  %multiply.20 = fmul float %region_0_33_constant_12, %15
  %add.21 = fadd float %region_0_33_constant_10, %multiply.20
  %16 = insertvalue { float, float, float, float, float, float, float, float, float } %13, float %add.21, 3
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %18 = load float, ptr %17, align 4, !invariant.load !4
  %multiply.22 = fmul float %region_0_33_constant_12, %18
  %add.23 = fadd float %region_0_33_constant_10, %multiply.22
  %19 = insertvalue { float, float, float, float, float, float, float, float, float } %16, float %add.23, 4
  %20 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %21 = load float, ptr %20, align 4, !invariant.load !4
  %multiply.24 = fmul float %region_0_33_constant_12, %21
  %add.25 = fadd float %region_0_33_constant_10, %multiply.24
  %22 = insertvalue { float, float, float, float, float, float, float, float, float } %19, float %add.25, 5
  %23 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %24 = load float, ptr %23, align 4, !invariant.load !4
  %multiply.26 = fmul float %region_0_33_constant_12, %24
  %add.27 = fadd float %region_0_33_constant_10, %multiply.26
  %25 = insertvalue { float, float, float, float, float, float, float, float, float } %22, float %add.27, 6
  %26 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %27 = load float, ptr %26, align 4, !invariant.load !4
  %multiply.28 = fmul float %region_0_33_constant_12, %27
  %add.29 = fadd float %region_0_33_constant_10, %multiply.28
  %28 = insertvalue { float, float, float, float, float, float, float, float, float } %25, float %add.29, 7
  %29 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %30 = load float, ptr %29, align 4, !invariant.load !4
  %multiply.30 = fmul float %region_0_33_constant_12, %30
  %add.31 = fadd float %region_0_33_constant_10, %multiply.30
  %31 = insertvalue { float, float, float, float, float, float, float, float, float } %28, float %add.31, 8
  %32 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 0
  %33 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  store float %32, ptr %33, align 4
  %34 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 1
  %35 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %34, ptr %35, align 4
  %36 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 2
  %37 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %36, ptr %37, align 4
  %38 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 3
  %39 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  store float %38, ptr %39, align 4
  %40 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 4
  %41 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  store float %40, ptr %41, align 4
  %42 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 5
  %43 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  store float %42, ptr %43, align 4
  %44 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 6
  %45 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  store float %44, ptr %45, align 4
  %46 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 7
  %47 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  store float %46, ptr %47, align 4
  %48 = extractvalue { float, float, float, float, float, float, float, float, float } %31, 8
  %49 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  store float %48, ptr %49, align 4
  br label %fusion_9.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1}

!0 = !{ptr @fusion_9, !"kernel", i32 1}
!1 = !{ptr @fusion_9, !"reqntidx", i32 512}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 512}
!4 = !{}
