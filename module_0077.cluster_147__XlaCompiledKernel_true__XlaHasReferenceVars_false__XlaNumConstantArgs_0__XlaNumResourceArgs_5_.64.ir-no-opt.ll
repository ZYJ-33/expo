target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = constant [64 x i8] c"\F8KF>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"\F8KF>"
@1 = private unnamed_addr constant [4 x i8] c"\F8K\C6\BD"

define void @fusion_5(ptr noalias align 16 dereferenceable(262144) %arg0, ptr noalias align 16 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(262144) %arg2, ptr noalias align 16 dereferenceable(262144) %arg3, ptr noalias align 16 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6, ptr noalias align 128 dereferenceable(262144) %arg7, ptr noalias align 128 dereferenceable(262144) %arg8, ptr noalias align 128 dereferenceable(262144) %arg9) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 65536
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 65536
  br i1 %6, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %fusion_5.in_bounds-true, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %region_0_21_constant_6 = load float, ptr @1, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !4
  %region_0_21_constant_8 = load float, ptr @0, align 4
  %multiply.10 = fmul float %8, %region_0_21_constant_8
  %add.11 = fadd float %region_0_21_constant_6, %multiply.10
  %9 = insertvalue { float, float, float, float, float } undef, float %add.11, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !4
  %multiply.12 = fmul float %region_0_21_constant_8, %11
  %add.13 = fadd float %region_0_21_constant_6, %multiply.12
  %12 = insertvalue { float, float, float, float, float } %9, float %add.13, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !4
  %multiply.14 = fmul float %region_0_21_constant_8, %14
  %add.15 = fadd float %region_0_21_constant_6, %multiply.14
  %15 = insertvalue { float, float, float, float, float } %12, float %add.15, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !4
  %multiply.16 = fmul float %region_0_21_constant_8, %17
  %add.17 = fadd float %region_0_21_constant_6, %multiply.16
  %18 = insertvalue { float, float, float, float, float } %15, float %add.17, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !4
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
  br label %fusion_5.in_bounds-after
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

!0 = !{ptr @fusion_5, !"kernel", i32 1}
!1 = !{ptr @fusion_5, !"reqntidx", i32 1024}
!2 = !{i32 0, i32 64}
!3 = !{i32 0, i32 1024}
!4 = !{}
