target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c":\CD\13?"
@1 = private unnamed_addr constant [4 x i8] c":\CD\93\BE"

define void @fusion_2(ptr noalias align 16 dereferenceable(5120) %arg0, ptr noalias align 16 dereferenceable(5120) %arg1, ptr noalias align 128 dereferenceable(5120) %arg2, ptr noalias align 128 dereferenceable(5120) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2048
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 32
  %5 = udiv i32 %linear_index, 32
  %6 = icmp ult i32 %linear_index, 1280
  br i1 %6, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %fusion_2.in_bounds-true, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %region_0_12_constant_3 = load float, ptr @1, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !4
  %region_0_12_constant_5 = load float, ptr @0, align 4
  %multiply.7 = fmul float %8, %region_0_12_constant_5
  %add.8 = fadd float %region_0_12_constant_3, %multiply.7
  %9 = insertvalue { float, float } undef, float %add.8, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !4
  %multiply.9 = fmul float %region_0_12_constant_5, %11
  %add.10 = fadd float %region_0_12_constant_3, %multiply.9
  %12 = insertvalue { float, float } %9, float %add.10, 1
  %13 = extractvalue { float, float } %12, 0
  %14 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  store float %13, ptr %14, align 4
  %15 = extractvalue { float, float } %12, 1
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %15, ptr %16, align 4
  br label %fusion_2.in_bounds-after
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

!0 = !{ptr @fusion_2, !"kernel", i32 1}
!1 = !{ptr @fusion_2, !"reqntidx", i32 1024}
!2 = !{i32 0, i32 2}
!3 = !{i32 0, i32 1024}
!4 = !{}
