target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = constant [64 x i8] c"\8C7\0C@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"\8C7\0C@"
@1 = private unnamed_addr constant [4 x i8] c"\8C7\8C\BF"

define void @fusion_4(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 16 dereferenceable(16) %arg1, ptr noalias align 16 dereferenceable(16) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 128 dereferenceable(16) %arg4, ptr noalias align 128 dereferenceable(16) %arg5, ptr noalias align 128 dereferenceable(16) %arg6, ptr noalias align 128 dereferenceable(16) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index, 4
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %fusion_4.in_bounds-true, label %fusion_4.in_bounds-after

fusion_4.in_bounds-after:                         ; preds = %fusion_4.in_bounds-true, %entry
  ret void

fusion_4.in_bounds-true:                          ; preds = %entry
  %region_0_18_constant_5 = load float, ptr @1, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !4
  %region_0_18_constant_7 = load float, ptr @0, align 4
  %multiply.9 = fmul float %8, %region_0_18_constant_7
  %add.10 = fadd float %region_0_18_constant_5, %multiply.9
  %9 = insertvalue { float, float, float, float } undef, float %add.10, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !4
  %multiply.11 = fmul float %region_0_18_constant_7, %11
  %add.12 = fadd float %region_0_18_constant_5, %multiply.11
  %12 = insertvalue { float, float, float, float } %9, float %add.12, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !4
  %multiply.13 = fmul float %region_0_18_constant_7, %14
  %add.14 = fadd float %region_0_18_constant_5, %multiply.13
  %15 = insertvalue { float, float, float, float } %12, float %add.14, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !4
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
  br label %fusion_4.in_bounds-after
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

!0 = !{ptr @fusion_4, !"kernel", i32 1}
!1 = !{ptr @fusion_4, !"reqntidx", i32 4}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 4}
!4 = !{}
