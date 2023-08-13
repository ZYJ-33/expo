target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"\EC\05Q>"
@1 = private unnamed_addr constant [4 x i8] c"\EC\05\D1\BD"

define void @fusion_7(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 16 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(131072) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 16 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 16 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(131072) %arg10, ptr noalias align 128 dereferenceable(131072) %arg11, ptr noalias align 128 dereferenceable(131072) %arg12, ptr noalias align 128 dereferenceable(131072) %arg13) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %fusion_7.in_bounds-true, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %region_0_27_constant_8 = load float, ptr @1, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !4
  %region_0_27_constant_10 = load float, ptr @0, align 4
  %multiply.12 = fmul float %8, %region_0_27_constant_10
  %add.13 = fadd float %region_0_27_constant_8, %multiply.12
  %9 = insertvalue { float, float, float, float, float, float, float } undef, float %add.13, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !4
  %multiply.14 = fmul float %region_0_27_constant_10, %11
  %add.15 = fadd float %region_0_27_constant_8, %multiply.14
  %12 = insertvalue { float, float, float, float, float, float, float } %9, float %add.15, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !4
  %multiply.16 = fmul float %region_0_27_constant_10, %14
  %add.17 = fadd float %region_0_27_constant_8, %multiply.16
  %15 = insertvalue { float, float, float, float, float, float, float } %12, float %add.17, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !4
  %multiply.18 = fmul float %region_0_27_constant_10, %17
  %add.19 = fadd float %region_0_27_constant_8, %multiply.18
  %18 = insertvalue { float, float, float, float, float, float, float } %15, float %add.19, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !4
  %multiply.20 = fmul float %region_0_27_constant_10, %20
  %add.21 = fadd float %region_0_27_constant_8, %multiply.20
  %21 = insertvalue { float, float, float, float, float, float, float } %18, float %add.21, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !4
  %multiply.22 = fmul float %region_0_27_constant_10, %23
  %add.23 = fadd float %region_0_27_constant_8, %multiply.22
  %24 = insertvalue { float, float, float, float, float, float, float } %21, float %add.23, 5
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !4
  %multiply.24 = fmul float %region_0_27_constant_10, %26
  %add.25 = fadd float %region_0_27_constant_8, %multiply.24
  %27 = insertvalue { float, float, float, float, float, float, float } %24, float %add.25, 6
  %28 = extractvalue { float, float, float, float, float, float, float } %27, 0
  %29 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  store float %28, ptr %29, align 4
  %30 = extractvalue { float, float, float, float, float, float, float } %27, 1
  %31 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  store float %30, ptr %31, align 4
  %32 = extractvalue { float, float, float, float, float, float, float } %27, 2
  %33 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  store float %32, ptr %33, align 4
  %34 = extractvalue { float, float, float, float, float, float, float } %27, 3
  %35 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %34, ptr %35, align 4
  %36 = extractvalue { float, float, float, float, float, float, float } %27, 4
  %37 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %36, ptr %37, align 4
  %38 = extractvalue { float, float, float, float, float, float, float } %27, 5
  %39 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  store float %38, ptr %39, align 4
  %40 = extractvalue { float, float, float, float, float, float, float } %27, 6
  %41 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  store float %40, ptr %41, align 4
  br label %fusion_7.in_bounds-after
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

!0 = !{ptr @fusion_7, !"kernel", i32 1}
!1 = !{ptr @fusion_7, !"reqntidx", i32 1024}
!2 = !{i32 0, i32 32}
!3 = !{i32 0, i32 1024}
!4 = !{}
