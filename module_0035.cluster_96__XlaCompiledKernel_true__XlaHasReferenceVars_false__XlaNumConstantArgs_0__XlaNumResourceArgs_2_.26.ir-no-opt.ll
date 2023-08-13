target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"i\CA\91>"
@1 = private unnamed_addr constant [4 x i8] c"i\CA\11\BE"

define void @fusion_2(ptr noalias align 16 dereferenceable(40960) %arg0, ptr noalias align 16 dereferenceable(86016) %arg1, ptr noalias align 128 dereferenceable(40960) %arg2, ptr noalias align 128 dereferenceable(86016) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 31744
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 31744
  br i1 %4, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %slice1-after, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  br label %concatenate.pivot.10240.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 256
  %10 = udiv i32 %8, 256
  %11 = udiv i32 %10, 40
  %region_0_19_constant_3 = load float, ptr @1, align 4
  %region_0_19_constant_5 = load float, ptr @0, align 4
  %12 = getelementptr inbounds [40 x [256 x float]], ptr %arg0, i32 0, i32 %10, i32 %9
  %13 = load float, ptr %12, align 4, !invariant.load !4
  %multiply.7 = fmul float %region_0_19_constant_5, %13
  %add.8 = fadd float %region_0_19_constant_3, %multiply.7
  br label %concatenate.15.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.10240.3
  %14 = phi i32 [ 10240, %concatenate.pivot.10240.3 ]
  %15 = sub nsw i32 %3, %14
  %16 = mul nuw nsw i32 %15, 1
  %17 = add nuw nsw i32 0, %16
  %18 = urem i32 %17, 128
  %19 = udiv i32 %17, 128
  %20 = udiv i32 %19, 168
  %region_0_19_constant_31 = load float, ptr @1, align 4
  %21 = getelementptr inbounds [168 x [128 x float]], ptr %arg1, i32 0, i32 %19, i32 %18
  %22 = load float, ptr %21, align 4, !invariant.load !4
  %region_0_19_constant_52 = load float, ptr @0, align 4
  %multiply.12 = fmul float %22, %region_0_19_constant_52
  %add.13 = fadd float %region_0_19_constant_31, %multiply.12
  br label %concatenate.15.merge

concatenate.pivot.10240.:                         ; preds = %fusion_2.in_bounds-true
  %23 = icmp ult i32 %3, 10240
  br i1 %23, label %concatenate.pivot.0., label %concatenate.pivot.10240.3

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.10240.
  br label %concat_index_from_operand_id0

concatenate.pivot.10240.3:                        ; preds = %concatenate.pivot.10240.
  br label %concat_index_from_operand_id1

concatenate.15.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %24 = phi float [ %add.8, %concat_index_from_operand_id0 ], [ %add.13, %concat_index_from_operand_id1 ]
  %25 = icmp sge i32 %3, 0
  %26 = icmp slt i32 %3, 10240
  %27 = and i1 %25, %26
  br i1 %27, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.15.merge
  %28 = icmp sge i32 %3, 10240
  %29 = icmp slt i32 %3, 31744
  %30 = and i1 %28, %29
  br i1 %30, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %fusion_2.in_bounds-after

slice0-true:                                      ; preds = %concatenate.15.merge
  %31 = sub i32 %3, 0
  %32 = getelementptr inbounds [10240 x float], ptr %arg2, i32 0, i32 %31
  store float %24, ptr %32, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %33 = sub i32 %3, 10240
  %34 = getelementptr inbounds [21504 x float], ptr %arg3, i32 0, i32 %33
  store float %24, ptr %34, align 4
  br label %slice1-after
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
!2 = !{i32 0, i32 31}
!3 = !{i32 0, i32 1024}
!4 = !{}
