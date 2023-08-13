target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"z\F5\EB="
@1 = private unnamed_addr constant [4 x i8] c"z\F5k\BD"
@2 = private unnamed_addr constant [4 x i8] c"z\F5\EB="
@3 = private unnamed_addr constant [4 x i8] c"z\F5k\BD"

define void @fusion_6(ptr noalias align 16 dereferenceable(3616) %arg0, ptr noalias align 16 dereferenceable(3616) %arg1, ptr noalias align 16 dereferenceable(3616) %arg2, ptr noalias align 128 dereferenceable(3616) %arg3, ptr noalias align 128 dereferenceable(3616) %arg4, ptr noalias align 128 dereferenceable(3616) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 904
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 904
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 904
  br i1 %4, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %fusion_6.in_bounds-true, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  %region_0_15_constant_4 = load float, ptr @1, align 4
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !6
  %region_0_15_constant_6 = load float, ptr @0, align 4
  %multiply.8 = fmul float %6, %region_0_15_constant_6
  %add.9 = fadd float %region_0_15_constant_4, %multiply.8
  %7 = insertvalue { float, float, float } undef, float %add.9, 0
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4, !invariant.load !6
  %multiply.10 = fmul float %region_0_15_constant_6, %9
  %add.11 = fadd float %region_0_15_constant_4, %multiply.10
  %10 = insertvalue { float, float, float } %7, float %add.11, 1
  %11 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !6
  %multiply.12 = fmul float %region_0_15_constant_6, %12
  %add.13 = fadd float %region_0_15_constant_4, %multiply.12
  %13 = insertvalue { float, float, float } %10, float %add.13, 2
  %14 = extractvalue { float, float, float } %13, 0
  %15 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %14, ptr %15, align 4
  %16 = extractvalue { float, float, float } %13, 1
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %16, ptr %17, align 4
  %18 = extractvalue { float, float, float } %13, 2
  %19 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %18, ptr %19, align 4
  br label %fusion_6.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_7(ptr noalias align 16 dereferenceable(3268864) %arg0, ptr noalias align 16 dereferenceable(3268864) %arg1, ptr noalias align 16 dereferenceable(3268864) %arg2, ptr noalias align 128 dereferenceable(3268864) %arg3, ptr noalias align 128 dereferenceable(3268864) %arg4, ptr noalias align 128 dereferenceable(3268864) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !8
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 204544
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 904
  %5 = udiv i32 %linear_index_base, 904
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 904
  %8 = udiv i32 %linear_index1, 904
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 904
  %11 = udiv i32 %linear_index2, 904
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 904
  %14 = udiv i32 %linear_index3, 904
  %15 = icmp ult i32 %linear_index_base, 817216
  br i1 %15, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %fusion_7.in_bounds-true, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %region_0_15_constant_4 = load float, ptr @3, align 4
  %region_0_15_constant_6 = load float, ptr @2, align 4
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !6
  %multiply.8 = fmul float %region_0_15_constant_6, %17
  %add.9 = fadd float %region_0_15_constant_4, %multiply.8
  %18 = insertvalue { float, float, float } undef, float %add.9, 0
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4, !invariant.load !6
  %multiply.10 = fmul float %region_0_15_constant_6, %20
  %add.11 = fadd float %region_0_15_constant_4, %multiply.10
  %21 = insertvalue { float, float, float } %18, float %add.11, 1
  %22 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %23 = load float, ptr %22, align 4, !invariant.load !6
  %multiply.12 = fmul float %region_0_15_constant_6, %23
  %add.13 = fadd float %region_0_15_constant_4, %multiply.12
  %24 = insertvalue { float, float, float } %21, float %add.13, 2
  %25 = extractvalue { float, float, float } %24, 0
  %26 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %25, ptr %26, align 4
  %27 = extractvalue { float, float, float } %24, 1
  %28 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %27, ptr %28, align 4
  %29 = extractvalue { float, float, float } %24, 2
  %30 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %29, ptr %30, align 4
  %region_0_15_constant_41 = load float, ptr @3, align 4
  %region_0_15_constant_62 = load float, ptr @2, align 4
  %31 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %32 = load float, ptr %31, align 4, !invariant.load !6
  %multiply.83 = fmul float %region_0_15_constant_62, %32
  %add.94 = fadd float %region_0_15_constant_41, %multiply.83
  %33 = insertvalue { float, float, float } undef, float %add.94, 0
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %35 = load float, ptr %34, align 4, !invariant.load !6
  %multiply.105 = fmul float %region_0_15_constant_62, %35
  %add.116 = fadd float %region_0_15_constant_41, %multiply.105
  %36 = insertvalue { float, float, float } %33, float %add.116, 1
  %37 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %38 = load float, ptr %37, align 4, !invariant.load !6
  %multiply.127 = fmul float %region_0_15_constant_62, %38
  %add.138 = fadd float %region_0_15_constant_41, %multiply.127
  %39 = insertvalue { float, float, float } %36, float %add.138, 2
  %40 = extractvalue { float, float, float } %39, 0
  %41 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %40, ptr %41, align 4
  %42 = extractvalue { float, float, float } %39, 1
  %43 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %42, ptr %43, align 4
  %44 = extractvalue { float, float, float } %39, 2
  %45 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %44, ptr %45, align 4
  %region_0_15_constant_49 = load float, ptr @3, align 4
  %region_0_15_constant_610 = load float, ptr @2, align 4
  %46 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %47 = load float, ptr %46, align 4, !invariant.load !6
  %multiply.811 = fmul float %region_0_15_constant_610, %47
  %add.912 = fadd float %region_0_15_constant_49, %multiply.811
  %48 = insertvalue { float, float, float } undef, float %add.912, 0
  %49 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %50 = load float, ptr %49, align 4, !invariant.load !6
  %multiply.1013 = fmul float %region_0_15_constant_610, %50
  %add.1114 = fadd float %region_0_15_constant_49, %multiply.1013
  %51 = insertvalue { float, float, float } %48, float %add.1114, 1
  %52 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %53 = load float, ptr %52, align 4, !invariant.load !6
  %multiply.1215 = fmul float %region_0_15_constant_610, %53
  %add.1316 = fadd float %region_0_15_constant_49, %multiply.1215
  %54 = insertvalue { float, float, float } %51, float %add.1316, 2
  %55 = extractvalue { float, float, float } %54, 0
  %56 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %55, ptr %56, align 4
  %57 = extractvalue { float, float, float } %54, 1
  %58 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %57, ptr %58, align 4
  %59 = extractvalue { float, float, float } %54, 2
  %60 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %59, ptr %60, align 4
  %region_0_15_constant_417 = load float, ptr @3, align 4
  %region_0_15_constant_618 = load float, ptr @2, align 4
  %61 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %62 = load float, ptr %61, align 4, !invariant.load !6
  %multiply.819 = fmul float %region_0_15_constant_618, %62
  %add.920 = fadd float %region_0_15_constant_417, %multiply.819
  %63 = insertvalue { float, float, float } undef, float %add.920, 0
  %64 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %65 = load float, ptr %64, align 4, !invariant.load !6
  %multiply.1021 = fmul float %region_0_15_constant_618, %65
  %add.1122 = fadd float %region_0_15_constant_417, %multiply.1021
  %66 = insertvalue { float, float, float } %63, float %add.1122, 1
  %67 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %68 = load float, ptr %67, align 4, !invariant.load !6
  %multiply.1223 = fmul float %region_0_15_constant_618, %68
  %add.1324 = fadd float %region_0_15_constant_417, %multiply.1223
  %69 = insertvalue { float, float, float } %66, float %add.1324, 2
  %70 = extractvalue { float, float, float } %69, 0
  %71 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %70, ptr %71, align 4
  %72 = extractvalue { float, float, float } %69, 1
  %73 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %72, ptr %73, align 4
  %74 = extractvalue { float, float, float } %69, 2
  %75 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %74, ptr %75, align 4
  br label %fusion_7.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @fusion_6, !"kernel", i32 1}
!1 = !{ptr @fusion_6, !"reqntidx", i32 904}
!2 = !{ptr @fusion_7, !"kernel", i32 1}
!3 = !{ptr @fusion_7, !"reqntidx", i32 256}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 904}
!6 = !{}
!7 = !{i32 0, i32 799}
!8 = !{i32 0, i32 256}
