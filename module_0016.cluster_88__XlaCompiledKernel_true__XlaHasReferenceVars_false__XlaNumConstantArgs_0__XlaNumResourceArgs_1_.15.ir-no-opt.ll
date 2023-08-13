target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"\F3\045?"
@1 = private unnamed_addr constant [4 x i8] c"\F3\04\B5\BE"

define void @fusion(ptr noalias align 16 dereferenceable(2048) %arg0, ptr noalias align 128 dereferenceable(2048) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 512
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 512
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 16
  %5 = udiv i32 %linear_index, 16
  %6 = icmp ult i32 %linear_index, 512
  br i1 %6, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %region_0_8_constant_2 = load float, ptr @1, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !4
  %region_0_8_constant_4 = load float, ptr @0, align 4
  %multiply.6 = fmul float %8, %region_0_8_constant_4
  %add.7 = fadd float %region_0_8_constant_2, %multiply.6
  %9 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %add.7, ptr %9, align 4
  br label %fusion.in_bounds-after
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

!0 = !{ptr @fusion, !"kernel", i32 1}
!1 = !{ptr @fusion, !"reqntidx", i32 512}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 512}
!4 = !{}
