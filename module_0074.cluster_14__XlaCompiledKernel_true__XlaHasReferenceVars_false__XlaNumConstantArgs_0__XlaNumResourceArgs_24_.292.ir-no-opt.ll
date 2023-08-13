target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_2 = constant [64 x i8] c"\8C7\8C>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@0 = private unnamed_addr constant [4 x i8] c"\8C7\8C>"
@1 = private unnamed_addr constant [4 x i8] c"\8C7\0C\BE"

define void @fusion_24(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 16 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(65536) %arg2, ptr noalias align 16 dereferenceable(65536) %arg3, ptr noalias align 16 dereferenceable(65536) %arg4, ptr noalias align 16 dereferenceable(65536) %arg5, ptr noalias align 16 dereferenceable(65536) %arg6, ptr noalias align 16 dereferenceable(65536) %arg7, ptr noalias align 16 dereferenceable(65536) %arg8, ptr noalias align 16 dereferenceable(65536) %arg9, ptr noalias align 16 dereferenceable(65536) %arg10, ptr noalias align 16 dereferenceable(65536) %arg11, ptr noalias align 16 dereferenceable(65536) %arg12, ptr noalias align 16 dereferenceable(65536) %arg13, ptr noalias align 16 dereferenceable(65536) %arg14, ptr noalias align 16 dereferenceable(65536) %arg15, ptr noalias align 16 dereferenceable(65536) %arg16, ptr noalias align 16 dereferenceable(65536) %arg17, ptr noalias align 16 dereferenceable(65536) %arg18, ptr noalias align 16 dereferenceable(65536) %arg19, ptr noalias align 16 dereferenceable(65536) %arg20, ptr noalias align 16 dereferenceable(65536) %arg21, ptr noalias align 16 dereferenceable(65536) %arg22, ptr noalias align 16 dereferenceable(65536) %arg23, ptr noalias align 128 dereferenceable(65536) %arg24, ptr noalias align 128 dereferenceable(65536) %arg25, ptr noalias align 128 dereferenceable(65536) %arg26, ptr noalias align 128 dereferenceable(65536) %arg27, ptr noalias align 128 dereferenceable(65536) %arg28, ptr noalias align 128 dereferenceable(65536) %arg29, ptr noalias align 128 dereferenceable(65536) %arg30, ptr noalias align 128 dereferenceable(65536) %arg31, ptr noalias align 128 dereferenceable(65536) %arg32, ptr noalias align 128 dereferenceable(65536) %arg33, ptr noalias align 128 dereferenceable(65536) %arg34, ptr noalias align 128 dereferenceable(65536) %arg35, ptr noalias align 128 dereferenceable(65536) %arg36, ptr noalias align 128 dereferenceable(65536) %arg37, ptr noalias align 128 dereferenceable(65536) %arg38, ptr noalias align 128 dereferenceable(65536) %arg39, ptr noalias align 128 dereferenceable(65536) %arg40, ptr noalias align 128 dereferenceable(65536) %arg41, ptr noalias align 128 dereferenceable(65536) %arg42, ptr noalias align 128 dereferenceable(65536) %arg43, ptr noalias align 128 dereferenceable(65536) %arg44, ptr noalias align 128 dereferenceable(65536) %arg45, ptr noalias align 128 dereferenceable(65536) %arg46, ptr noalias align 128 dereferenceable(65536) %arg47) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %fusion_24.in_bounds-true, label %fusion_24.in_bounds-after

fusion_24.in_bounds-after:                        ; preds = %fusion_24.in_bounds-true, %entry
  ret void

fusion_24.in_bounds-true:                         ; preds = %entry
  %region_0_78_constant_25 = load float, ptr @1, align 4
  %region_0_78_constant_27 = load float, ptr @0, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !4
  %multiply.29 = fmul float %region_0_78_constant_27, %8
  %add.30 = fadd float %region_0_78_constant_25, %multiply.29
  %9 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.30, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !4
  %multiply.31 = fmul float %region_0_78_constant_27, %11
  %add.32 = fadd float %region_0_78_constant_25, %multiply.31
  %12 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %9, float %add.32, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !4
  %multiply.33 = fmul float %region_0_78_constant_27, %14
  %add.34 = fadd float %region_0_78_constant_25, %multiply.33
  %15 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %12, float %add.34, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !4
  %multiply.35 = fmul float %region_0_78_constant_27, %17
  %add.36 = fadd float %region_0_78_constant_25, %multiply.35
  %18 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %15, float %add.36, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !4
  %multiply.37 = fmul float %region_0_78_constant_27, %20
  %add.38 = fadd float %region_0_78_constant_25, %multiply.37
  %21 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %18, float %add.38, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !4
  %multiply.39 = fmul float %region_0_78_constant_27, %23
  %add.40 = fadd float %region_0_78_constant_25, %multiply.39
  %24 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %21, float %add.40, 5
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !4
  %multiply.41 = fmul float %region_0_78_constant_27, %26
  %add.42 = fadd float %region_0_78_constant_25, %multiply.41
  %27 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %24, float %add.42, 6
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %29 = load float, ptr %28, align 4, !invariant.load !4
  %multiply.43 = fmul float %region_0_78_constant_27, %29
  %add.44 = fadd float %region_0_78_constant_25, %multiply.43
  %30 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %27, float %add.44, 7
  %31 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %32 = load float, ptr %31, align 4, !invariant.load !4
  %multiply.45 = fmul float %region_0_78_constant_27, %32
  %add.46 = fadd float %region_0_78_constant_25, %multiply.45
  %33 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %30, float %add.46, 8
  %34 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %35 = load float, ptr %34, align 4, !invariant.load !4
  %multiply.47 = fmul float %region_0_78_constant_27, %35
  %add.48 = fadd float %region_0_78_constant_25, %multiply.47
  %36 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %33, float %add.48, 9
  %37 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %38 = load float, ptr %37, align 4, !invariant.load !4
  %multiply.49 = fmul float %region_0_78_constant_27, %38
  %add.50 = fadd float %region_0_78_constant_25, %multiply.49
  %39 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %36, float %add.50, 10
  %40 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %41 = load float, ptr %40, align 4, !invariant.load !4
  %multiply.51 = fmul float %region_0_78_constant_27, %41
  %add.52 = fadd float %region_0_78_constant_25, %multiply.51
  %42 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %39, float %add.52, 11
  %43 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %44 = load float, ptr %43, align 4, !invariant.load !4
  %multiply.53 = fmul float %44, %region_0_78_constant_27
  %add.54 = fadd float %region_0_78_constant_25, %multiply.53
  %45 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %42, float %add.54, 12
  %46 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  %47 = load float, ptr %46, align 4, !invariant.load !4
  %multiply.55 = fmul float %region_0_78_constant_27, %47
  %add.56 = fadd float %region_0_78_constant_25, %multiply.55
  %48 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %45, float %add.56, 13
  %49 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  %50 = load float, ptr %49, align 4, !invariant.load !4
  %multiply.57 = fmul float %region_0_78_constant_27, %50
  %add.58 = fadd float %region_0_78_constant_25, %multiply.57
  %51 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, float %add.58, 14
  %52 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  %53 = load float, ptr %52, align 4, !invariant.load !4
  %multiply.59 = fmul float %region_0_78_constant_27, %53
  %add.60 = fadd float %region_0_78_constant_25, %multiply.59
  %54 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %51, float %add.60, 15
  %55 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  %56 = load float, ptr %55, align 4, !invariant.load !4
  %multiply.61 = fmul float %region_0_78_constant_27, %56
  %add.62 = fadd float %region_0_78_constant_25, %multiply.61
  %57 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %54, float %add.62, 16
  %58 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  %59 = load float, ptr %58, align 4, !invariant.load !4
  %multiply.63 = fmul float %region_0_78_constant_27, %59
  %add.64 = fadd float %region_0_78_constant_25, %multiply.63
  %60 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %57, float %add.64, 17
  %61 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  %62 = load float, ptr %61, align 4, !invariant.load !4
  %multiply.65 = fmul float %region_0_78_constant_27, %62
  %add.66 = fadd float %region_0_78_constant_25, %multiply.65
  %63 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %60, float %add.66, 18
  %64 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  %65 = load float, ptr %64, align 4, !invariant.load !4
  %multiply.67 = fmul float %region_0_78_constant_27, %65
  %add.68 = fadd float %region_0_78_constant_25, %multiply.67
  %66 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %63, float %add.68, 19
  %67 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  %68 = load float, ptr %67, align 4, !invariant.load !4
  %multiply.69 = fmul float %region_0_78_constant_27, %68
  %add.70 = fadd float %region_0_78_constant_25, %multiply.69
  %69 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %66, float %add.70, 20
  %70 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  %71 = load float, ptr %70, align 4, !invariant.load !4
  %multiply.71 = fmul float %region_0_78_constant_27, %71
  %add.72 = fadd float %region_0_78_constant_25, %multiply.71
  %72 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %69, float %add.72, 21
  %73 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  %74 = load float, ptr %73, align 4, !invariant.load !4
  %multiply.73 = fmul float %region_0_78_constant_27, %74
  %add.74 = fadd float %region_0_78_constant_25, %multiply.73
  %75 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %72, float %add.74, 22
  %76 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  %77 = load float, ptr %76, align 4, !invariant.load !4
  %multiply.75 = fmul float %region_0_78_constant_27, %77
  %add.76 = fadd float %region_0_78_constant_25, %multiply.75
  %78 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, float %add.76, 23
  %79 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 0
  %80 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  store float %79, ptr %80, align 4
  %81 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 1
  %82 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  store float %81, ptr %82, align 4
  %83 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 2
  %84 = getelementptr inbounds float, ptr %arg26, i32 %linear_index
  store float %83, ptr %84, align 4
  %85 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 3
  %86 = getelementptr inbounds float, ptr %arg27, i32 %linear_index
  store float %85, ptr %86, align 4
  %87 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 4
  %88 = getelementptr inbounds float, ptr %arg28, i32 %linear_index
  store float %87, ptr %88, align 4
  %89 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 5
  %90 = getelementptr inbounds float, ptr %arg29, i32 %linear_index
  store float %89, ptr %90, align 4
  %91 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 6
  %92 = getelementptr inbounds float, ptr %arg30, i32 %linear_index
  store float %91, ptr %92, align 4
  %93 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 7
  %94 = getelementptr inbounds float, ptr %arg31, i32 %linear_index
  store float %93, ptr %94, align 4
  %95 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 8
  %96 = getelementptr inbounds float, ptr %arg32, i32 %linear_index
  store float %95, ptr %96, align 4
  %97 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 9
  %98 = getelementptr inbounds float, ptr %arg33, i32 %linear_index
  store float %97, ptr %98, align 4
  %99 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 10
  %100 = getelementptr inbounds float, ptr %arg34, i32 %linear_index
  store float %99, ptr %100, align 4
  %101 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 11
  %102 = getelementptr inbounds float, ptr %arg35, i32 %linear_index
  store float %101, ptr %102, align 4
  %103 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 12
  %104 = getelementptr inbounds float, ptr %arg36, i32 %linear_index
  store float %103, ptr %104, align 4
  %105 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 13
  %106 = getelementptr inbounds float, ptr %arg37, i32 %linear_index
  store float %105, ptr %106, align 4
  %107 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 14
  %108 = getelementptr inbounds float, ptr %arg38, i32 %linear_index
  store float %107, ptr %108, align 4
  %109 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 15
  %110 = getelementptr inbounds float, ptr %arg39, i32 %linear_index
  store float %109, ptr %110, align 4
  %111 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 16
  %112 = getelementptr inbounds float, ptr %arg40, i32 %linear_index
  store float %111, ptr %112, align 4
  %113 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 17
  %114 = getelementptr inbounds float, ptr %arg41, i32 %linear_index
  store float %113, ptr %114, align 4
  %115 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 18
  %116 = getelementptr inbounds float, ptr %arg42, i32 %linear_index
  store float %115, ptr %116, align 4
  %117 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 19
  %118 = getelementptr inbounds float, ptr %arg43, i32 %linear_index
  store float %117, ptr %118, align 4
  %119 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 20
  %120 = getelementptr inbounds float, ptr %arg44, i32 %linear_index
  store float %119, ptr %120, align 4
  %121 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 21
  %122 = getelementptr inbounds float, ptr %arg45, i32 %linear_index
  store float %121, ptr %122, align 4
  %123 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 22
  %124 = getelementptr inbounds float, ptr %arg46, i32 %linear_index
  store float %123, ptr %124, align 4
  %125 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, 23
  %126 = getelementptr inbounds float, ptr %arg47, i32 %linear_index
  store float %125, ptr %126, align 4
  br label %fusion_24.in_bounds-after
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

!0 = !{ptr @fusion_24, !"kernel", i32 1}
!1 = !{ptr @fusion_24, !"reqntidx", i32 1024}
!2 = !{i32 0, i32 16}
!3 = !{i32 0, i32 1024}
!4 = !{}
