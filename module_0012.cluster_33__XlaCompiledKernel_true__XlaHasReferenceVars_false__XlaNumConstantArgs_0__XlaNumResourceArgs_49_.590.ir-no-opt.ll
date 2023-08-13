target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"\D7\B3\DD>"
@1 = private unnamed_addr constant [4 x i8] c"\D7\B3]\BE"
@2 = private unnamed_addr constant [4 x i8] c"\D7\B3\DD>"
@3 = private unnamed_addr constant [4 x i8] c"\D7\B3]\BE"
@4 = private unnamed_addr constant [4 x i8] c"\D7\B3\DD>"
@5 = private unnamed_addr constant [4 x i8] c"\D7\B3]\BE"

define void @fusion_50(ptr noalias align 16 dereferenceable(256) %arg0, ptr noalias align 16 dereferenceable(256) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 16 dereferenceable(256) %arg3, ptr noalias align 16 dereferenceable(256) %arg4, ptr noalias align 16 dereferenceable(256) %arg5, ptr noalias align 16 dereferenceable(256) %arg6, ptr noalias align 16 dereferenceable(256) %arg7, ptr noalias align 16 dereferenceable(256) %arg8, ptr noalias align 16 dereferenceable(256) %arg9, ptr noalias align 16 dereferenceable(256) %arg10, ptr noalias align 16 dereferenceable(256) %arg11, ptr noalias align 16 dereferenceable(256) %arg12, ptr noalias align 16 dereferenceable(256) %arg13, ptr noalias align 16 dereferenceable(256) %arg14, ptr noalias align 128 dereferenceable(256) %arg15, ptr noalias align 128 dereferenceable(256) %arg16, ptr noalias align 128 dereferenceable(256) %arg17, ptr noalias align 128 dereferenceable(256) %arg18, ptr noalias align 128 dereferenceable(256) %arg19, ptr noalias align 128 dereferenceable(256) %arg20, ptr noalias align 128 dereferenceable(256) %arg21, ptr noalias align 128 dereferenceable(256) %arg22, ptr noalias align 128 dereferenceable(256) %arg23, ptr noalias align 128 dereferenceable(256) %arg24, ptr noalias align 128 dereferenceable(256) %arg25, ptr noalias align 128 dereferenceable(256) %arg26, ptr noalias align 128 dereferenceable(256) %arg27, ptr noalias align 128 dereferenceable(256) %arg28, ptr noalias align 128 dereferenceable(256) %arg29) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 64
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 64
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 64
  br i1 %4, label %fusion_50.in_bounds-true, label %fusion_50.in_bounds-after

fusion_50.in_bounds-after:                        ; preds = %fusion_50.in_bounds-true, %entry
  ret void

fusion_50.in_bounds-true:                         ; preds = %entry
  %region_0_51_constant_16 = load float, ptr @1, align 4
  %region_0_51_constant_18 = load float, ptr @0, align 4
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !8
  %multiply.20 = fmul float %region_0_51_constant_18, %6
  %add.21 = fadd float %region_0_51_constant_16, %multiply.20
  %7 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.21, 0
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4, !invariant.load !8
  %multiply.22 = fmul float %region_0_51_constant_18, %9
  %add.23 = fadd float %region_0_51_constant_16, %multiply.22
  %10 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %7, float %add.23, 1
  %11 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !8
  %multiply.24 = fmul float %region_0_51_constant_18, %12
  %add.25 = fadd float %region_0_51_constant_16, %multiply.24
  %13 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %10, float %add.25, 2
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %15 = load float, ptr %14, align 4, !invariant.load !8
  %multiply.26 = fmul float %region_0_51_constant_18, %15
  %add.27 = fadd float %region_0_51_constant_16, %multiply.26
  %16 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %13, float %add.27, 3
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %18 = load float, ptr %17, align 4, !invariant.load !8
  %multiply.28 = fmul float %region_0_51_constant_18, %18
  %add.29 = fadd float %region_0_51_constant_16, %multiply.28
  %19 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %16, float %add.29, 4
  %20 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %21 = load float, ptr %20, align 4, !invariant.load !8
  %multiply.30 = fmul float %region_0_51_constant_18, %21
  %add.31 = fadd float %region_0_51_constant_16, %multiply.30
  %22 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %19, float %add.31, 5
  %23 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %24 = load float, ptr %23, align 4, !invariant.load !8
  %multiply.32 = fmul float %region_0_51_constant_18, %24
  %add.33 = fadd float %region_0_51_constant_16, %multiply.32
  %25 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %22, float %add.33, 6
  %26 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %27 = load float, ptr %26, align 4, !invariant.load !8
  %multiply.34 = fmul float %region_0_51_constant_18, %27
  %add.35 = fadd float %region_0_51_constant_16, %multiply.34
  %28 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %25, float %add.35, 7
  %29 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %30 = load float, ptr %29, align 4, !invariant.load !8
  %multiply.36 = fmul float %region_0_51_constant_18, %30
  %add.37 = fadd float %region_0_51_constant_16, %multiply.36
  %31 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %28, float %add.37, 8
  %32 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %33 = load float, ptr %32, align 4, !invariant.load !8
  %multiply.38 = fmul float %region_0_51_constant_18, %33
  %add.39 = fadd float %region_0_51_constant_16, %multiply.38
  %34 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %31, float %add.39, 9
  %35 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %36 = load float, ptr %35, align 4, !invariant.load !8
  %multiply.40 = fmul float %region_0_51_constant_18, %36
  %add.41 = fadd float %region_0_51_constant_16, %multiply.40
  %37 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %34, float %add.41, 10
  %38 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %39 = load float, ptr %38, align 4, !invariant.load !8
  %multiply.42 = fmul float %region_0_51_constant_18, %39
  %add.43 = fadd float %region_0_51_constant_16, %multiply.42
  %40 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %37, float %add.43, 11
  %41 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %42 = load float, ptr %41, align 4, !invariant.load !8
  %multiply.44 = fmul float %region_0_51_constant_18, %42
  %add.45 = fadd float %region_0_51_constant_16, %multiply.44
  %43 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %40, float %add.45, 12
  %44 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  %45 = load float, ptr %44, align 4, !invariant.load !8
  %multiply.46 = fmul float %region_0_51_constant_18, %45
  %add.47 = fadd float %region_0_51_constant_16, %multiply.46
  %46 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %43, float %add.47, 13
  %47 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  %48 = load float, ptr %47, align 4, !invariant.load !8
  %multiply.48 = fmul float %region_0_51_constant_18, %48
  %add.49 = fadd float %region_0_51_constant_16, %multiply.48
  %49 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %46, float %add.49, 14
  %50 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 0
  %51 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  store float %50, ptr %51, align 4
  %52 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 1
  %53 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  store float %52, ptr %53, align 4
  %54 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 2
  %55 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  store float %54, ptr %55, align 4
  %56 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 3
  %57 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  store float %56, ptr %57, align 4
  %58 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 4
  %59 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  store float %58, ptr %59, align 4
  %60 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 5
  %61 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  store float %60, ptr %61, align 4
  %62 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 6
  %63 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  store float %62, ptr %63, align 4
  %64 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 7
  %65 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  store float %64, ptr %65, align 4
  %66 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 8
  %67 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  store float %66, ptr %67, align 4
  %68 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 9
  %69 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  store float %68, ptr %69, align 4
  %70 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 10
  %71 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  store float %70, ptr %71, align 4
  %72 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 11
  %73 = getelementptr inbounds float, ptr %arg26, i32 %linear_index
  store float %72, ptr %73, align 4
  %74 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 12
  %75 = getelementptr inbounds float, ptr %arg27, i32 %linear_index
  store float %74, ptr %75, align 4
  %76 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 13
  %77 = getelementptr inbounds float, ptr %arg28, i32 %linear_index
  store float %76, ptr %77, align 4
  %78 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, 14
  %79 = getelementptr inbounds float, ptr %arg29, i32 %linear_index
  store float %78, ptr %79, align 4
  br label %fusion_50.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_49(ptr noalias align 16 dereferenceable(256) %arg0, ptr noalias align 16 dereferenceable(256) %arg1, ptr noalias align 16 dereferenceable(256) %arg2, ptr noalias align 16 dereferenceable(256) %arg3, ptr noalias align 16 dereferenceable(256) %arg4, ptr noalias align 16 dereferenceable(256) %arg5, ptr noalias align 16 dereferenceable(256) %arg6, ptr noalias align 16 dereferenceable(256) %arg7, ptr noalias align 16 dereferenceable(256) %arg8, ptr noalias align 16 dereferenceable(256) %arg9, ptr noalias align 16 dereferenceable(256) %arg10, ptr noalias align 16 dereferenceable(256) %arg11, ptr noalias align 16 dereferenceable(256) %arg12, ptr noalias align 16 dereferenceable(256) %arg13, ptr noalias align 16 dereferenceable(256) %arg14, ptr noalias align 16 dereferenceable(256) %arg15, ptr noalias align 16 dereferenceable(256) %arg16, ptr noalias align 16 dereferenceable(256) %arg17, ptr noalias align 16 dereferenceable(256) %arg18, ptr noalias align 16 dereferenceable(256) %arg19, ptr noalias align 16 dereferenceable(256) %arg20, ptr noalias align 16 dereferenceable(256) %arg21, ptr noalias align 16 dereferenceable(256) %arg22, ptr noalias align 16 dereferenceable(256) %arg23, ptr noalias align 16 dereferenceable(256) %arg24, ptr noalias align 16 dereferenceable(256) %arg25, ptr noalias align 16 dereferenceable(256) %arg26, ptr noalias align 16 dereferenceable(256) %arg27, ptr noalias align 16 dereferenceable(256) %arg28, ptr noalias align 16 dereferenceable(256) %arg29, ptr noalias align 16 dereferenceable(256) %arg30, ptr noalias align 16 dereferenceable(256) %arg31, ptr noalias align 128 dereferenceable(256) %arg32, ptr noalias align 128 dereferenceable(256) %arg33, ptr noalias align 128 dereferenceable(256) %arg34, ptr noalias align 128 dereferenceable(256) %arg35, ptr noalias align 128 dereferenceable(256) %arg36, ptr noalias align 128 dereferenceable(256) %arg37, ptr noalias align 128 dereferenceable(256) %arg38, ptr noalias align 128 dereferenceable(256) %arg39, ptr noalias align 128 dereferenceable(256) %arg40, ptr noalias align 128 dereferenceable(256) %arg41, ptr noalias align 128 dereferenceable(256) %arg42, ptr noalias align 128 dereferenceable(256) %arg43, ptr noalias align 128 dereferenceable(256) %arg44, ptr noalias align 128 dereferenceable(256) %arg45, ptr noalias align 128 dereferenceable(256) %arg46, ptr noalias align 128 dereferenceable(256) %arg47, ptr noalias align 128 dereferenceable(256) %arg48, ptr noalias align 128 dereferenceable(256) %arg49, ptr noalias align 128 dereferenceable(256) %arg50, ptr noalias align 128 dereferenceable(256) %arg51, ptr noalias align 128 dereferenceable(256) %arg52, ptr noalias align 128 dereferenceable(256) %arg53, ptr noalias align 128 dereferenceable(256) %arg54, ptr noalias align 128 dereferenceable(256) %arg55, ptr noalias align 128 dereferenceable(256) %arg56, ptr noalias align 128 dereferenceable(256) %arg57, ptr noalias align 128 dereferenceable(256) %arg58, ptr noalias align 128 dereferenceable(256) %arg59, ptr noalias align 128 dereferenceable(256) %arg60, ptr noalias align 128 dereferenceable(256) %arg61, ptr noalias align 128 dereferenceable(256) %arg62, ptr noalias align 128 dereferenceable(256) %arg63) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %2 = mul nuw nsw i32 %0, 64
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 64
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 64
  br i1 %4, label %fusion_49.in_bounds-true, label %fusion_49.in_bounds-after

fusion_49.in_bounds-after:                        ; preds = %fusion_49.in_bounds-true, %entry
  ret void

fusion_49.in_bounds-true:                         ; preds = %entry
  %region_0_102_constant_33 = load float, ptr @3, align 4
  %region_0_102_constant_35 = load float, ptr @2, align 4
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !8
  %multiply.37 = fmul float %region_0_102_constant_35, %6
  %add.38 = fadd float %region_0_102_constant_33, %multiply.37
  %7 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.38, 0
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4, !invariant.load !8
  %multiply.39 = fmul float %9, %region_0_102_constant_35
  %add.40 = fadd float %region_0_102_constant_33, %multiply.39
  %10 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %7, float %add.40, 1
  %11 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !8
  %multiply.41 = fmul float %region_0_102_constant_35, %12
  %add.42 = fadd float %region_0_102_constant_33, %multiply.41
  %13 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %10, float %add.42, 2
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %15 = load float, ptr %14, align 4, !invariant.load !8
  %multiply.43 = fmul float %region_0_102_constant_35, %15
  %add.44 = fadd float %region_0_102_constant_33, %multiply.43
  %16 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %13, float %add.44, 3
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %18 = load float, ptr %17, align 4, !invariant.load !8
  %multiply.45 = fmul float %region_0_102_constant_35, %18
  %add.46 = fadd float %region_0_102_constant_33, %multiply.45
  %19 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %16, float %add.46, 4
  %20 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %21 = load float, ptr %20, align 4, !invariant.load !8
  %multiply.47 = fmul float %region_0_102_constant_35, %21
  %add.48 = fadd float %region_0_102_constant_33, %multiply.47
  %22 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %19, float %add.48, 5
  %23 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %24 = load float, ptr %23, align 4, !invariant.load !8
  %multiply.49 = fmul float %region_0_102_constant_35, %24
  %add.50 = fadd float %region_0_102_constant_33, %multiply.49
  %25 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %22, float %add.50, 6
  %26 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %27 = load float, ptr %26, align 4, !invariant.load !8
  %multiply.51 = fmul float %region_0_102_constant_35, %27
  %add.52 = fadd float %region_0_102_constant_33, %multiply.51
  %28 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %25, float %add.52, 7
  %29 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %30 = load float, ptr %29, align 4, !invariant.load !8
  %multiply.53 = fmul float %region_0_102_constant_35, %30
  %add.54 = fadd float %region_0_102_constant_33, %multiply.53
  %31 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %28, float %add.54, 8
  %32 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %33 = load float, ptr %32, align 4, !invariant.load !8
  %multiply.55 = fmul float %region_0_102_constant_35, %33
  %add.56 = fadd float %region_0_102_constant_33, %multiply.55
  %34 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %31, float %add.56, 9
  %35 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %36 = load float, ptr %35, align 4, !invariant.load !8
  %multiply.57 = fmul float %region_0_102_constant_35, %36
  %add.58 = fadd float %region_0_102_constant_33, %multiply.57
  %37 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %34, float %add.58, 10
  %38 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %39 = load float, ptr %38, align 4, !invariant.load !8
  %multiply.59 = fmul float %region_0_102_constant_35, %39
  %add.60 = fadd float %region_0_102_constant_33, %multiply.59
  %40 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %37, float %add.60, 11
  %41 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %42 = load float, ptr %41, align 4, !invariant.load !8
  %multiply.61 = fmul float %region_0_102_constant_35, %42
  %add.62 = fadd float %region_0_102_constant_33, %multiply.61
  %43 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %40, float %add.62, 12
  %44 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  %45 = load float, ptr %44, align 4, !invariant.load !8
  %multiply.63 = fmul float %region_0_102_constant_35, %45
  %add.64 = fadd float %region_0_102_constant_33, %multiply.63
  %46 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %43, float %add.64, 13
  %47 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  %48 = load float, ptr %47, align 4, !invariant.load !8
  %multiply.65 = fmul float %region_0_102_constant_35, %48
  %add.66 = fadd float %region_0_102_constant_33, %multiply.65
  %49 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %46, float %add.66, 14
  %50 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  %51 = load float, ptr %50, align 4, !invariant.load !8
  %multiply.67 = fmul float %region_0_102_constant_35, %51
  %add.68 = fadd float %region_0_102_constant_33, %multiply.67
  %52 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, float %add.68, 15
  %53 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  %54 = load float, ptr %53, align 4, !invariant.load !8
  %multiply.69 = fmul float %region_0_102_constant_35, %54
  %add.70 = fadd float %region_0_102_constant_33, %multiply.69
  %55 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %52, float %add.70, 16
  %56 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  %57 = load float, ptr %56, align 4, !invariant.load !8
  %multiply.71 = fmul float %region_0_102_constant_35, %57
  %add.72 = fadd float %region_0_102_constant_33, %multiply.71
  %58 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %55, float %add.72, 17
  %59 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  %60 = load float, ptr %59, align 4, !invariant.load !8
  %multiply.73 = fmul float %region_0_102_constant_35, %60
  %add.74 = fadd float %region_0_102_constant_33, %multiply.73
  %61 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %58, float %add.74, 18
  %62 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  %63 = load float, ptr %62, align 4, !invariant.load !8
  %multiply.75 = fmul float %region_0_102_constant_35, %63
  %add.76 = fadd float %region_0_102_constant_33, %multiply.75
  %64 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %61, float %add.76, 19
  %65 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  %66 = load float, ptr %65, align 4, !invariant.load !8
  %multiply.77 = fmul float %region_0_102_constant_35, %66
  %add.78 = fadd float %region_0_102_constant_33, %multiply.77
  %67 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %64, float %add.78, 20
  %68 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  %69 = load float, ptr %68, align 4, !invariant.load !8
  %multiply.79 = fmul float %region_0_102_constant_35, %69
  %add.80 = fadd float %region_0_102_constant_33, %multiply.79
  %70 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %67, float %add.80, 21
  %71 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  %72 = load float, ptr %71, align 4, !invariant.load !8
  %multiply.81 = fmul float %region_0_102_constant_35, %72
  %add.82 = fadd float %region_0_102_constant_33, %multiply.81
  %73 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %70, float %add.82, 22
  %74 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  %75 = load float, ptr %74, align 4, !invariant.load !8
  %multiply.83 = fmul float %region_0_102_constant_35, %75
  %add.84 = fadd float %region_0_102_constant_33, %multiply.83
  %76 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %73, float %add.84, 23
  %77 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  %78 = load float, ptr %77, align 4, !invariant.load !8
  %multiply.85 = fmul float %region_0_102_constant_35, %78
  %add.86 = fadd float %region_0_102_constant_33, %multiply.85
  %79 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %76, float %add.86, 24
  %80 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  %81 = load float, ptr %80, align 4, !invariant.load !8
  %multiply.87 = fmul float %region_0_102_constant_35, %81
  %add.88 = fadd float %region_0_102_constant_33, %multiply.87
  %82 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %79, float %add.88, 25
  %83 = getelementptr inbounds float, ptr %arg26, i32 %linear_index
  %84 = load float, ptr %83, align 4, !invariant.load !8
  %multiply.89 = fmul float %region_0_102_constant_35, %84
  %add.90 = fadd float %region_0_102_constant_33, %multiply.89
  %85 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %82, float %add.90, 26
  %86 = getelementptr inbounds float, ptr %arg27, i32 %linear_index
  %87 = load float, ptr %86, align 4, !invariant.load !8
  %multiply.91 = fmul float %region_0_102_constant_35, %87
  %add.92 = fadd float %region_0_102_constant_33, %multiply.91
  %88 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %85, float %add.92, 27
  %89 = getelementptr inbounds float, ptr %arg28, i32 %linear_index
  %90 = load float, ptr %89, align 4, !invariant.load !8
  %multiply.93 = fmul float %region_0_102_constant_35, %90
  %add.94 = fadd float %region_0_102_constant_33, %multiply.93
  %91 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %88, float %add.94, 28
  %92 = getelementptr inbounds float, ptr %arg29, i32 %linear_index
  %93 = load float, ptr %92, align 4, !invariant.load !8
  %multiply.95 = fmul float %region_0_102_constant_35, %93
  %add.96 = fadd float %region_0_102_constant_33, %multiply.95
  %94 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %91, float %add.96, 29
  %95 = getelementptr inbounds float, ptr %arg30, i32 %linear_index
  %96 = load float, ptr %95, align 4, !invariant.load !8
  %multiply.97 = fmul float %region_0_102_constant_35, %96
  %add.98 = fadd float %region_0_102_constant_33, %multiply.97
  %97 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, float %add.98, 30
  %98 = getelementptr inbounds float, ptr %arg31, i32 %linear_index
  %99 = load float, ptr %98, align 4, !invariant.load !8
  %multiply.99 = fmul float %region_0_102_constant_35, %99
  %add.100 = fadd float %region_0_102_constant_33, %multiply.99
  %100 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %97, float %add.100, 31
  %101 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 0
  %102 = getelementptr inbounds float, ptr %arg32, i32 %linear_index
  store float %101, ptr %102, align 4
  %103 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 1
  %104 = getelementptr inbounds float, ptr %arg33, i32 %linear_index
  store float %103, ptr %104, align 4
  %105 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 2
  %106 = getelementptr inbounds float, ptr %arg34, i32 %linear_index
  store float %105, ptr %106, align 4
  %107 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 3
  %108 = getelementptr inbounds float, ptr %arg35, i32 %linear_index
  store float %107, ptr %108, align 4
  %109 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 4
  %110 = getelementptr inbounds float, ptr %arg36, i32 %linear_index
  store float %109, ptr %110, align 4
  %111 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 5
  %112 = getelementptr inbounds float, ptr %arg37, i32 %linear_index
  store float %111, ptr %112, align 4
  %113 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 6
  %114 = getelementptr inbounds float, ptr %arg38, i32 %linear_index
  store float %113, ptr %114, align 4
  %115 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 7
  %116 = getelementptr inbounds float, ptr %arg39, i32 %linear_index
  store float %115, ptr %116, align 4
  %117 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 8
  %118 = getelementptr inbounds float, ptr %arg40, i32 %linear_index
  store float %117, ptr %118, align 4
  %119 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 9
  %120 = getelementptr inbounds float, ptr %arg41, i32 %linear_index
  store float %119, ptr %120, align 4
  %121 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 10
  %122 = getelementptr inbounds float, ptr %arg42, i32 %linear_index
  store float %121, ptr %122, align 4
  %123 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 11
  %124 = getelementptr inbounds float, ptr %arg43, i32 %linear_index
  store float %123, ptr %124, align 4
  %125 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 12
  %126 = getelementptr inbounds float, ptr %arg44, i32 %linear_index
  store float %125, ptr %126, align 4
  %127 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 13
  %128 = getelementptr inbounds float, ptr %arg45, i32 %linear_index
  store float %127, ptr %128, align 4
  %129 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 14
  %130 = getelementptr inbounds float, ptr %arg46, i32 %linear_index
  store float %129, ptr %130, align 4
  %131 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 15
  %132 = getelementptr inbounds float, ptr %arg47, i32 %linear_index
  store float %131, ptr %132, align 4
  %133 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 16
  %134 = getelementptr inbounds float, ptr %arg48, i32 %linear_index
  store float %133, ptr %134, align 4
  %135 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 17
  %136 = getelementptr inbounds float, ptr %arg49, i32 %linear_index
  store float %135, ptr %136, align 4
  %137 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 18
  %138 = getelementptr inbounds float, ptr %arg50, i32 %linear_index
  store float %137, ptr %138, align 4
  %139 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 19
  %140 = getelementptr inbounds float, ptr %arg51, i32 %linear_index
  store float %139, ptr %140, align 4
  %141 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 20
  %142 = getelementptr inbounds float, ptr %arg52, i32 %linear_index
  store float %141, ptr %142, align 4
  %143 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 21
  %144 = getelementptr inbounds float, ptr %arg53, i32 %linear_index
  store float %143, ptr %144, align 4
  %145 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 22
  %146 = getelementptr inbounds float, ptr %arg54, i32 %linear_index
  store float %145, ptr %146, align 4
  %147 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 23
  %148 = getelementptr inbounds float, ptr %arg55, i32 %linear_index
  store float %147, ptr %148, align 4
  %149 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 24
  %150 = getelementptr inbounds float, ptr %arg56, i32 %linear_index
  store float %149, ptr %150, align 4
  %151 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 25
  %152 = getelementptr inbounds float, ptr %arg57, i32 %linear_index
  store float %151, ptr %152, align 4
  %153 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 26
  %154 = getelementptr inbounds float, ptr %arg58, i32 %linear_index
  store float %153, ptr %154, align 4
  %155 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 27
  %156 = getelementptr inbounds float, ptr %arg59, i32 %linear_index
  store float %155, ptr %156, align 4
  %157 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 28
  %158 = getelementptr inbounds float, ptr %arg60, i32 %linear_index
  store float %157, ptr %158, align 4
  %159 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 29
  %160 = getelementptr inbounds float, ptr %arg61, i32 %linear_index
  store float %159, ptr %160, align 4
  %161 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 30
  %162 = getelementptr inbounds float, ptr %arg62, i32 %linear_index
  store float %161, ptr %162, align 4
  %163 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, 31
  %164 = getelementptr inbounds float, ptr %arg63, i32 %linear_index
  store float %163, ptr %164, align 4
  br label %fusion_49.in_bounds-after
}

define void @fusion_51(ptr noalias align 16 dereferenceable(16384) %arg0, ptr noalias align 16 dereferenceable(16384) %arg1, ptr noalias align 128 dereferenceable(16384) %arg2, ptr noalias align 128 dereferenceable(16384) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !10
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index, 64
  %6 = icmp ult i32 %linear_index, 4096
  br i1 %6, label %fusion_51.in_bounds-true, label %fusion_51.in_bounds-after

fusion_51.in_bounds-after:                        ; preds = %fusion_51.in_bounds-true, %entry
  ret void

fusion_51.in_bounds-true:                         ; preds = %entry
  %region_0_12_constant_3 = load float, ptr @5, align 4
  %region_0_12_constant_5 = load float, ptr @4, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !8
  %multiply.7 = fmul float %region_0_12_constant_5, %8
  %add.8 = fadd float %region_0_12_constant_3, %multiply.7
  %9 = insertvalue { float, float } undef, float %add.8, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !8
  %multiply.9 = fmul float %region_0_12_constant_5, %11
  %add.10 = fadd float %region_0_12_constant_3, %multiply.9
  %12 = insertvalue { float, float } %9, float %add.10, 1
  %13 = extractvalue { float, float } %12, 0
  %14 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  store float %13, ptr %14, align 4
  %15 = extractvalue { float, float } %12, 1
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %15, ptr %16, align 4
  br label %fusion_51.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5}

!0 = !{ptr @fusion_50, !"kernel", i32 1}
!1 = !{ptr @fusion_50, !"reqntidx", i32 64}
!2 = !{ptr @fusion_49, !"kernel", i32 1}
!3 = !{ptr @fusion_49, !"reqntidx", i32 64}
!4 = !{ptr @fusion_51, !"kernel", i32 1}
!5 = !{ptr @fusion_51, !"reqntidx", i32 1024}
!6 = !{i32 0, i32 1}
!7 = !{i32 0, i32 64}
!8 = !{}
!9 = !{i32 0, i32 4}
!10 = !{i32 0, i32 1024}
