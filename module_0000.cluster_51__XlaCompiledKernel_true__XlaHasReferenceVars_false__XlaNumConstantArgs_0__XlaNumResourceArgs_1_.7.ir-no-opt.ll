target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant = constant [64 x i8] c"\00\00\80?\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128

define void @broadcast(ptr noalias align 128 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(672) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 168
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 168
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 168
  br i1 %4, label %broadcast.in_bounds-true, label %broadcast.in_bounds-after

broadcast.in_bounds-after:                        ; preds = %broadcast.in_bounds-true, %entry
  ret void

broadcast.in_bounds-true:                         ; preds = %entry
  %5 = load float, ptr %arg0, align 4, !invariant.load !4
  %6 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %5, ptr %6, align 4
  br label %broadcast.in_bounds-after
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

!0 = !{ptr @broadcast, !"kernel", i32 1}
!1 = !{ptr @broadcast, !"reqntidx", i32 168}
!2 = !{i32 0, i32 1}
!3 = !{i32 0, i32 168}
!4 = !{}
