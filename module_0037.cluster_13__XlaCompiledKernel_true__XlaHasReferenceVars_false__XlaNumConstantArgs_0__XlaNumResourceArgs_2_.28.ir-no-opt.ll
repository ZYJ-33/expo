target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = constant [64 x i8] c"\81c\0F>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"\81c\0F>"
@1 = private unnamed_addr constant [4 x i8] c"\81c\8F\BD"

define void @fusion_2(ptr noalias align 16 dereferenceable(991232) %arg0, ptr noalias align 16 dereferenceable(991232) %arg1, ptr noalias align 128 dereferenceable(991232) %arg2, ptr noalias align 128 dereferenceable(991232) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 61952
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 256
  %8 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 256
  %11 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 256
  %14 = udiv i32 %linear_index3, 256
  %15 = icmp ult i32 %linear_index_base, 247808
  br i1 %15, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %fusion_2.in_bounds-true, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %region_0_12_constant_3 = load float, ptr @1, align 4
  %region_0_12_constant_5 = load float, ptr @0, align 4
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !4
  %multiply.7 = fmul float %region_0_12_constant_5, %17
  %add.8 = fadd float %region_0_12_constant_3, %multiply.7
  %18 = insertvalue { float, float } undef, float %add.8, 0
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4, !invariant.load !4
  %multiply.9 = fmul float %region_0_12_constant_5, %20
  %add.10 = fadd float %region_0_12_constant_3, %multiply.9
  %21 = insertvalue { float, float } %18, float %add.10, 1
  %22 = extractvalue { float, float } %21, 0
  %23 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %22, ptr %23, align 4
  %24 = extractvalue { float, float } %21, 1
  %25 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %24, ptr %25, align 4
  %region_0_12_constant_31 = load float, ptr @1, align 4
  %region_0_12_constant_52 = load float, ptr @0, align 4
  %26 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %27 = load float, ptr %26, align 4, !invariant.load !4
  %multiply.73 = fmul float %region_0_12_constant_52, %27
  %add.84 = fadd float %region_0_12_constant_31, %multiply.73
  %28 = insertvalue { float, float } undef, float %add.84, 0
  %29 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %30 = load float, ptr %29, align 4, !invariant.load !4
  %multiply.95 = fmul float %region_0_12_constant_52, %30
  %add.106 = fadd float %region_0_12_constant_31, %multiply.95
  %31 = insertvalue { float, float } %28, float %add.106, 1
  %32 = extractvalue { float, float } %31, 0
  %33 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %32, ptr %33, align 4
  %34 = extractvalue { float, float } %31, 1
  %35 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %34, ptr %35, align 4
  %region_0_12_constant_37 = load float, ptr @1, align 4
  %region_0_12_constant_58 = load float, ptr @0, align 4
  %36 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %37 = load float, ptr %36, align 4, !invariant.load !4
  %multiply.79 = fmul float %region_0_12_constant_58, %37
  %add.810 = fadd float %region_0_12_constant_37, %multiply.79
  %38 = insertvalue { float, float } undef, float %add.810, 0
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %40 = load float, ptr %39, align 4, !invariant.load !4
  %multiply.911 = fmul float %region_0_12_constant_58, %40
  %add.1012 = fadd float %region_0_12_constant_37, %multiply.911
  %41 = insertvalue { float, float } %38, float %add.1012, 1
  %42 = extractvalue { float, float } %41, 0
  %43 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %42, ptr %43, align 4
  %44 = extractvalue { float, float } %41, 1
  %45 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %44, ptr %45, align 4
  %region_0_12_constant_313 = load float, ptr @1, align 4
  %region_0_12_constant_514 = load float, ptr @0, align 4
  %46 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %47 = load float, ptr %46, align 4, !invariant.load !4
  %multiply.715 = fmul float %region_0_12_constant_514, %47
  %add.816 = fadd float %region_0_12_constant_313, %multiply.715
  %48 = insertvalue { float, float } undef, float %add.816, 0
  %49 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %50 = load float, ptr %49, align 4, !invariant.load !4
  %multiply.917 = fmul float %region_0_12_constant_514, %50
  %add.1018 = fadd float %region_0_12_constant_313, %multiply.917
  %51 = insertvalue { float, float } %48, float %add.1018, 1
  %52 = extractvalue { float, float } %51, 0
  %53 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %52, ptr %53, align 4
  %54 = extractvalue { float, float } %51, 1
  %55 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %54, ptr %55, align 4
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
!1 = !{ptr @fusion_2, !"reqntidx", i32 256}
!2 = !{i32 0, i32 242}
!3 = !{i32 0, i32 256}
!4 = !{}
