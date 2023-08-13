target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"#^\F5="
@1 = private unnamed_addr constant [4 x i8] c"#^u\BD"

define void @fusion(ptr noalias align 16 dereferenceable(2375680) %arg0, ptr noalias align 128 dereferenceable(2375680) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 148480
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index_base, 512
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 512
  %8 = udiv i32 %linear_index1, 512
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 512
  %11 = udiv i32 %linear_index2, 512
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 512
  %14 = udiv i32 %linear_index3, 512
  %15 = icmp ult i32 %linear_index_base, 593920
  br i1 %15, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %region_0_8_constant_2 = load float, ptr @1, align 4
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !4
  %region_0_8_constant_4 = load float, ptr @0, align 4
  %multiply.6 = fmul float %17, %region_0_8_constant_4
  %add.7 = fadd float %region_0_8_constant_2, %multiply.6
  %18 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %add.7, ptr %18, align 4
  %region_0_8_constant_21 = load float, ptr @1, align 4
  %19 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %20 = load float, ptr %19, align 4, !invariant.load !4
  %region_0_8_constant_42 = load float, ptr @0, align 4
  %multiply.63 = fmul float %20, %region_0_8_constant_42
  %add.74 = fadd float %region_0_8_constant_21, %multiply.63
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %add.74, ptr %21, align 4
  %region_0_8_constant_25 = load float, ptr @1, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %23 = load float, ptr %22, align 4, !invariant.load !4
  %region_0_8_constant_46 = load float, ptr @0, align 4
  %multiply.67 = fmul float %23, %region_0_8_constant_46
  %add.78 = fadd float %region_0_8_constant_25, %multiply.67
  %24 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %add.78, ptr %24, align 4
  %region_0_8_constant_29 = load float, ptr @1, align 4
  %25 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %26 = load float, ptr %25, align 4, !invariant.load !4
  %region_0_8_constant_410 = load float, ptr @0, align 4
  %multiply.611 = fmul float %26, %region_0_8_constant_410
  %add.712 = fadd float %region_0_8_constant_29, %multiply.611
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %add.712, ptr %27, align 4
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
!1 = !{ptr @fusion, !"reqntidx", i32 256}
!2 = !{i32 0, i32 580}
!3 = !{i32 0, i32 256}
!4 = !{}
