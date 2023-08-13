target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"\B2_\9A>"
@1 = private unnamed_addr constant [4 x i8] c"\B2_\1A\BE"

define void @fusion_9(ptr noalias align 16 dereferenceable(8192) %arg0, ptr noalias align 16 dereferenceable(8192) %arg1, ptr noalias align 16 dereferenceable(8192) %arg2, ptr noalias align 16 dereferenceable(8192) %arg3, ptr noalias align 16 dereferenceable(8192) %arg4, ptr noalias align 16 dereferenceable(8192) %arg5, ptr noalias align 16 dereferenceable(8192) %arg6, ptr noalias align 16 dereferenceable(8192) %arg7, ptr noalias align 16 dereferenceable(8192) %arg8, ptr noalias align 128 dereferenceable(8192) %arg9, ptr noalias align 128 dereferenceable(8192) %arg10, ptr noalias align 128 dereferenceable(8192) %arg11, ptr noalias align 128 dereferenceable(8192) %arg12, ptr noalias align 128 dereferenceable(8192) %arg13, ptr noalias align 128 dereferenceable(8192) %arg14, ptr noalias align 128 dereferenceable(8192) %arg15, ptr noalias align 128 dereferenceable(8192) %arg16, ptr noalias align 128 dereferenceable(8192) %arg17) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2048
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 2048
  br i1 %6, label %fusion_9.in_bounds-true, label %fusion_9.in_bounds-after

fusion_9.in_bounds-after:                         ; preds = %fusion_9.in_bounds-true, %entry
  ret void

fusion_9.in_bounds-true:                          ; preds = %entry
  %region_0_33_constant_10 = load float, ptr @1, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !4
  %region_0_33_constant_12 = load float, ptr @0, align 4
  %multiply.14 = fmul float %8, %region_0_33_constant_12
  %add.15 = fadd float %region_0_33_constant_10, %multiply.14
  %9 = insertvalue { float, float, float, float, float, float, float, float, float } undef, float %add.15, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !4
  %multiply.16 = fmul float %region_0_33_constant_12, %11
  %add.17 = fadd float %region_0_33_constant_10, %multiply.16
  %12 = insertvalue { float, float, float, float, float, float, float, float, float } %9, float %add.17, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !4
  %multiply.18 = fmul float %region_0_33_constant_12, %14
  %add.19 = fadd float %region_0_33_constant_10, %multiply.18
  %15 = insertvalue { float, float, float, float, float, float, float, float, float } %12, float %add.19, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !4
  %multiply.20 = fmul float %region_0_33_constant_12, %17
  %add.21 = fadd float %region_0_33_constant_10, %multiply.20
  %18 = insertvalue { float, float, float, float, float, float, float, float, float } %15, float %add.21, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !4
  %multiply.22 = fmul float %region_0_33_constant_12, %20
  %add.23 = fadd float %region_0_33_constant_10, %multiply.22
  %21 = insertvalue { float, float, float, float, float, float, float, float, float } %18, float %add.23, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !4
  %multiply.24 = fmul float %region_0_33_constant_12, %23
  %add.25 = fadd float %region_0_33_constant_10, %multiply.24
  %24 = insertvalue { float, float, float, float, float, float, float, float, float } %21, float %add.25, 5
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !4
  %multiply.26 = fmul float %region_0_33_constant_12, %26
  %add.27 = fadd float %region_0_33_constant_10, %multiply.26
  %27 = insertvalue { float, float, float, float, float, float, float, float, float } %24, float %add.27, 6
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %29 = load float, ptr %28, align 4, !invariant.load !4
  %multiply.28 = fmul float %region_0_33_constant_12, %29
  %add.29 = fadd float %region_0_33_constant_10, %multiply.28
  %30 = insertvalue { float, float, float, float, float, float, float, float, float } %27, float %add.29, 7
  %31 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %32 = load float, ptr %31, align 4, !invariant.load !4
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
!1 = !{ptr @fusion_9, !"reqntidx", i32 1024}
!2 = !{i32 0, i32 2}
!3 = !{i32 0, i32 1024}
!4 = !{}
