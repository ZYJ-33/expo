target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"\D7\B3\DD\BF"
@1 = private unnamed_addr constant [4 x i8] c"\D7\B3]@"
@2 = private unnamed_addr constant [4 x i8] c"\D7\B3\DD\BF"
@3 = private unnamed_addr constant [4 x i8] c"\D7\B3]@"

define void @fusion_96(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(4) %arg3, ptr noalias align 16 dereferenceable(4) %arg4, ptr noalias align 16 dereferenceable(4) %arg5, ptr noalias align 16 dereferenceable(4) %arg6, ptr noalias align 16 dereferenceable(4) %arg7, ptr noalias align 16 dereferenceable(4) %arg8, ptr noalias align 16 dereferenceable(4) %arg9, ptr noalias align 16 dereferenceable(4) %arg10, ptr noalias align 16 dereferenceable(4) %arg11, ptr noalias align 16 dereferenceable(4) %arg12, ptr noalias align 16 dereferenceable(4) %arg13, ptr noalias align 16 dereferenceable(4) %arg14, ptr noalias align 16 dereferenceable(4) %arg15, ptr noalias align 16 dereferenceable(4) %arg16, ptr noalias align 16 dereferenceable(4) %arg17, ptr noalias align 16 dereferenceable(4) %arg18, ptr noalias align 16 dereferenceable(4) %arg19, ptr noalias align 16 dereferenceable(4) %arg20, ptr noalias align 16 dereferenceable(4) %arg21, ptr noalias align 16 dereferenceable(4) %arg22, ptr noalias align 16 dereferenceable(4) %arg23, ptr noalias align 16 dereferenceable(4) %arg24, ptr noalias align 16 dereferenceable(4) %arg25, ptr noalias align 16 dereferenceable(4) %arg26, ptr noalias align 16 dereferenceable(4) %arg27, ptr noalias align 16 dereferenceable(4) %arg28, ptr noalias align 16 dereferenceable(4) %arg29, ptr noalias align 128 dereferenceable(4) %arg30, ptr noalias align 128 dereferenceable(4) %arg31, ptr noalias align 128 dereferenceable(4) %arg32, ptr noalias align 128 dereferenceable(4) %arg33, ptr noalias align 128 dereferenceable(4) %arg34, ptr noalias align 128 dereferenceable(4) %arg35, ptr noalias align 128 dereferenceable(4) %arg36, ptr noalias align 128 dereferenceable(4) %arg37, ptr noalias align 128 dereferenceable(4) %arg38, ptr noalias align 128 dereferenceable(4) %arg39, ptr noalias align 128 dereferenceable(4) %arg40, ptr noalias align 128 dereferenceable(4) %arg41, ptr noalias align 128 dereferenceable(4) %arg42, ptr noalias align 128 dereferenceable(4) %arg43, ptr noalias align 128 dereferenceable(4) %arg44, ptr noalias align 128 dereferenceable(4) %arg45, ptr noalias align 128 dereferenceable(4) %arg46, ptr noalias align 128 dereferenceable(4) %arg47, ptr noalias align 128 dereferenceable(4) %arg48, ptr noalias align 128 dereferenceable(4) %arg49, ptr noalias align 128 dereferenceable(4) %arg50, ptr noalias align 128 dereferenceable(4) %arg51, ptr noalias align 128 dereferenceable(4) %arg52, ptr noalias align 128 dereferenceable(4) %arg53, ptr noalias align 128 dereferenceable(4) %arg54, ptr noalias align 128 dereferenceable(4) %arg55, ptr noalias align 128 dereferenceable(4) %arg56, ptr noalias align 128 dereferenceable(4) %arg57, ptr noalias align 128 dereferenceable(4) %arg58, ptr noalias align 128 dereferenceable(4) %arg59) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %fusion_96.in_bounds-true, label %fusion_96.in_bounds-after

fusion_96.in_bounds-after:                        ; preds = %fusion_96.in_bounds-true, %entry
  ret void

fusion_96.in_bounds-true:                         ; preds = %entry
  %region_0_94_constant_31 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_311 = load float, ptr %region_0_94_constant_31, align 4
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !5
  %multiply.32 = fmul float %region_0_94_constant_311, %6
  %region_0_94_constant_33 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_332 = load float, ptr %region_0_94_constant_33, align 4
  %add.34 = fadd float %multiply.32, %region_0_94_constant_332
  %7 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.34, 0
  %region_0_94_constant_313 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_314 = load float, ptr %region_0_94_constant_313, align 4
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4, !invariant.load !5
  %multiply.35 = fmul float %region_0_94_constant_314, %9
  %region_0_94_constant_335 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_336 = load float, ptr %region_0_94_constant_335, align 4
  %add.36 = fadd float %multiply.35, %region_0_94_constant_336
  %10 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %7, float %add.36, 1
  %region_0_94_constant_317 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_318 = load float, ptr %region_0_94_constant_317, align 4
  %11 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !5
  %multiply.37 = fmul float %region_0_94_constant_318, %12
  %region_0_94_constant_339 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3310 = load float, ptr %region_0_94_constant_339, align 4
  %add.38 = fadd float %multiply.37, %region_0_94_constant_3310
  %13 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %10, float %add.38, 2
  %region_0_94_constant_3111 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3112 = load float, ptr %region_0_94_constant_3111, align 4
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %15 = load float, ptr %14, align 4, !invariant.load !5
  %multiply.39 = fmul float %region_0_94_constant_3112, %15
  %region_0_94_constant_3313 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3314 = load float, ptr %region_0_94_constant_3313, align 4
  %add.40 = fadd float %multiply.39, %region_0_94_constant_3314
  %16 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %13, float %add.40, 3
  %region_0_94_constant_3115 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3116 = load float, ptr %region_0_94_constant_3115, align 4
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %18 = load float, ptr %17, align 4, !invariant.load !5
  %multiply.41 = fmul float %region_0_94_constant_3116, %18
  %region_0_94_constant_3317 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3318 = load float, ptr %region_0_94_constant_3317, align 4
  %add.42 = fadd float %multiply.41, %region_0_94_constant_3318
  %19 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %16, float %add.42, 4
  %region_0_94_constant_3119 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3120 = load float, ptr %region_0_94_constant_3119, align 4
  %20 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %21 = load float, ptr %20, align 4, !invariant.load !5
  %multiply.43 = fmul float %region_0_94_constant_3120, %21
  %region_0_94_constant_3321 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3322 = load float, ptr %region_0_94_constant_3321, align 4
  %add.44 = fadd float %multiply.43, %region_0_94_constant_3322
  %22 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %19, float %add.44, 5
  %region_0_94_constant_3123 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3124 = load float, ptr %region_0_94_constant_3123, align 4
  %23 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %24 = load float, ptr %23, align 4, !invariant.load !5
  %multiply.45 = fmul float %region_0_94_constant_3124, %24
  %region_0_94_constant_3325 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3326 = load float, ptr %region_0_94_constant_3325, align 4
  %add.46 = fadd float %multiply.45, %region_0_94_constant_3326
  %25 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %22, float %add.46, 6
  %region_0_94_constant_3127 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3128 = load float, ptr %region_0_94_constant_3127, align 4
  %26 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %27 = load float, ptr %26, align 4, !invariant.load !5
  %multiply.47 = fmul float %region_0_94_constant_3128, %27
  %region_0_94_constant_3329 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3330 = load float, ptr %region_0_94_constant_3329, align 4
  %add.48 = fadd float %multiply.47, %region_0_94_constant_3330
  %28 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %25, float %add.48, 7
  %region_0_94_constant_3131 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3132 = load float, ptr %region_0_94_constant_3131, align 4
  %29 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %30 = load float, ptr %29, align 4, !invariant.load !5
  %multiply.49 = fmul float %region_0_94_constant_3132, %30
  %region_0_94_constant_3333 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3334 = load float, ptr %region_0_94_constant_3333, align 4
  %add.50 = fadd float %multiply.49, %region_0_94_constant_3334
  %31 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %28, float %add.50, 8
  %region_0_94_constant_3135 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3136 = load float, ptr %region_0_94_constant_3135, align 4
  %32 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %33 = load float, ptr %32, align 4, !invariant.load !5
  %multiply.51 = fmul float %region_0_94_constant_3136, %33
  %region_0_94_constant_3337 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3338 = load float, ptr %region_0_94_constant_3337, align 4
  %add.52 = fadd float %multiply.51, %region_0_94_constant_3338
  %34 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %31, float %add.52, 9
  %region_0_94_constant_3139 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3140 = load float, ptr %region_0_94_constant_3139, align 4
  %35 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %36 = load float, ptr %35, align 4, !invariant.load !5
  %multiply.53 = fmul float %region_0_94_constant_3140, %36
  %region_0_94_constant_3341 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3342 = load float, ptr %region_0_94_constant_3341, align 4
  %add.54 = fadd float %multiply.53, %region_0_94_constant_3342
  %37 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %34, float %add.54, 10
  %region_0_94_constant_3143 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3144 = load float, ptr %region_0_94_constant_3143, align 4
  %38 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %39 = load float, ptr %38, align 4, !invariant.load !5
  %multiply.55 = fmul float %region_0_94_constant_3144, %39
  %region_0_94_constant_3345 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3346 = load float, ptr %region_0_94_constant_3345, align 4
  %add.56 = fadd float %multiply.55, %region_0_94_constant_3346
  %40 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %37, float %add.56, 11
  %region_0_94_constant_3147 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3148 = load float, ptr %region_0_94_constant_3147, align 4
  %41 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %42 = load float, ptr %41, align 4, !invariant.load !5
  %multiply.57 = fmul float %region_0_94_constant_3148, %42
  %region_0_94_constant_3349 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3350 = load float, ptr %region_0_94_constant_3349, align 4
  %add.58 = fadd float %multiply.57, %region_0_94_constant_3350
  %43 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %40, float %add.58, 12
  %region_0_94_constant_3151 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3152 = load float, ptr %region_0_94_constant_3151, align 4
  %44 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  %45 = load float, ptr %44, align 4, !invariant.load !5
  %multiply.59 = fmul float %region_0_94_constant_3152, %45
  %region_0_94_constant_3353 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3354 = load float, ptr %region_0_94_constant_3353, align 4
  %add.60 = fadd float %multiply.59, %region_0_94_constant_3354
  %46 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %43, float %add.60, 13
  %region_0_94_constant_3155 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3156 = load float, ptr %region_0_94_constant_3155, align 4
  %47 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  %48 = load float, ptr %47, align 4, !invariant.load !5
  %multiply.61 = fmul float %region_0_94_constant_3156, %48
  %region_0_94_constant_3357 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3358 = load float, ptr %region_0_94_constant_3357, align 4
  %add.62 = fadd float %multiply.61, %region_0_94_constant_3358
  %49 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %46, float %add.62, 14
  %region_0_94_constant_3159 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3160 = load float, ptr %region_0_94_constant_3159, align 4
  %50 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  %51 = load float, ptr %50, align 4, !invariant.load !5
  %multiply.63 = fmul float %region_0_94_constant_3160, %51
  %region_0_94_constant_3361 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3362 = load float, ptr %region_0_94_constant_3361, align 4
  %add.64 = fadd float %multiply.63, %region_0_94_constant_3362
  %52 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, float %add.64, 15
  %region_0_94_constant_3163 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3164 = load float, ptr %region_0_94_constant_3163, align 4
  %53 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  %54 = load float, ptr %53, align 4, !invariant.load !5
  %multiply.65 = fmul float %region_0_94_constant_3164, %54
  %region_0_94_constant_3365 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3366 = load float, ptr %region_0_94_constant_3365, align 4
  %add.66 = fadd float %multiply.65, %region_0_94_constant_3366
  %55 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %52, float %add.66, 16
  %region_0_94_constant_3167 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3168 = load float, ptr %region_0_94_constant_3167, align 4
  %56 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  %57 = load float, ptr %56, align 4, !invariant.load !5
  %multiply.67 = fmul float %region_0_94_constant_3168, %57
  %region_0_94_constant_3369 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3370 = load float, ptr %region_0_94_constant_3369, align 4
  %add.68 = fadd float %multiply.67, %region_0_94_constant_3370
  %58 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %55, float %add.68, 17
  %region_0_94_constant_3171 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3172 = load float, ptr %region_0_94_constant_3171, align 4
  %59 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  %60 = load float, ptr %59, align 4, !invariant.load !5
  %multiply.69 = fmul float %region_0_94_constant_3172, %60
  %region_0_94_constant_3373 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3374 = load float, ptr %region_0_94_constant_3373, align 4
  %add.70 = fadd float %multiply.69, %region_0_94_constant_3374
  %61 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %58, float %add.70, 18
  %62 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  %63 = load float, ptr %62, align 4, !invariant.load !5
  %region_0_94_constant_3175 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3176 = load float, ptr %region_0_94_constant_3175, align 4
  %multiply.71 = fmul float %63, %region_0_94_constant_3176
  %region_0_94_constant_3377 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3378 = load float, ptr %region_0_94_constant_3377, align 4
  %add.72 = fadd float %multiply.71, %region_0_94_constant_3378
  %64 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %61, float %add.72, 19
  %region_0_94_constant_3179 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3180 = load float, ptr %region_0_94_constant_3179, align 4
  %65 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  %66 = load float, ptr %65, align 4, !invariant.load !5
  %multiply.73 = fmul float %region_0_94_constant_3180, %66
  %region_0_94_constant_3381 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3382 = load float, ptr %region_0_94_constant_3381, align 4
  %add.74 = fadd float %multiply.73, %region_0_94_constant_3382
  %67 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %64, float %add.74, 20
  %region_0_94_constant_3183 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3184 = load float, ptr %region_0_94_constant_3183, align 4
  %68 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  %69 = load float, ptr %68, align 4, !invariant.load !5
  %multiply.75 = fmul float %region_0_94_constant_3184, %69
  %region_0_94_constant_3385 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3386 = load float, ptr %region_0_94_constant_3385, align 4
  %add.76 = fadd float %multiply.75, %region_0_94_constant_3386
  %70 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %67, float %add.76, 21
  %region_0_94_constant_3187 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3188 = load float, ptr %region_0_94_constant_3187, align 4
  %71 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  %72 = load float, ptr %71, align 4, !invariant.load !5
  %multiply.77 = fmul float %region_0_94_constant_3188, %72
  %region_0_94_constant_3389 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3390 = load float, ptr %region_0_94_constant_3389, align 4
  %add.78 = fadd float %multiply.77, %region_0_94_constant_3390
  %73 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %70, float %add.78, 22
  %region_0_94_constant_3191 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3192 = load float, ptr %region_0_94_constant_3191, align 4
  %74 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  %75 = load float, ptr %74, align 4, !invariant.load !5
  %multiply.79 = fmul float %region_0_94_constant_3192, %75
  %region_0_94_constant_3393 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3394 = load float, ptr %region_0_94_constant_3393, align 4
  %add.80 = fadd float %multiply.79, %region_0_94_constant_3394
  %76 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %73, float %add.80, 23
  %region_0_94_constant_3195 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_3196 = load float, ptr %region_0_94_constant_3195, align 4
  %77 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  %78 = load float, ptr %77, align 4, !invariant.load !5
  %multiply.81 = fmul float %region_0_94_constant_3196, %78
  %region_0_94_constant_3397 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_3398 = load float, ptr %region_0_94_constant_3397, align 4
  %add.82 = fadd float %multiply.81, %region_0_94_constant_3398
  %79 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %76, float %add.82, 24
  %region_0_94_constant_3199 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_31100 = load float, ptr %region_0_94_constant_3199, align 4
  %80 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  %81 = load float, ptr %80, align 4, !invariant.load !5
  %multiply.83 = fmul float %region_0_94_constant_31100, %81
  %region_0_94_constant_33101 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_33102 = load float, ptr %region_0_94_constant_33101, align 4
  %add.84 = fadd float %multiply.83, %region_0_94_constant_33102
  %82 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %79, float %add.84, 25
  %region_0_94_constant_31103 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_31104 = load float, ptr %region_0_94_constant_31103, align 4
  %83 = getelementptr inbounds float, ptr %arg26, i32 %linear_index
  %84 = load float, ptr %83, align 4, !invariant.load !5
  %multiply.85 = fmul float %region_0_94_constant_31104, %84
  %region_0_94_constant_33105 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_33106 = load float, ptr %region_0_94_constant_33105, align 4
  %add.86 = fadd float %multiply.85, %region_0_94_constant_33106
  %85 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %82, float %add.86, 26
  %region_0_94_constant_31107 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_31108 = load float, ptr %region_0_94_constant_31107, align 4
  %86 = getelementptr inbounds float, ptr %arg27, i32 %linear_index
  %87 = load float, ptr %86, align 4, !invariant.load !5
  %multiply.87 = fmul float %region_0_94_constant_31108, %87
  %region_0_94_constant_33109 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_33110 = load float, ptr %region_0_94_constant_33109, align 4
  %add.88 = fadd float %multiply.87, %region_0_94_constant_33110
  %88 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %85, float %add.88, 27
  %region_0_94_constant_31111 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_31112 = load float, ptr %region_0_94_constant_31111, align 4
  %89 = getelementptr inbounds float, ptr %arg28, i32 %linear_index
  %90 = load float, ptr %89, align 4, !invariant.load !5
  %multiply.89 = fmul float %region_0_94_constant_31112, %90
  %region_0_94_constant_33113 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_33114 = load float, ptr %region_0_94_constant_33113, align 4
  %add.90 = fadd float %multiply.89, %region_0_94_constant_33114
  %91 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %88, float %add.90, 28
  %region_0_94_constant_31115 = getelementptr inbounds float, ptr @1, i32 %linear_index
  %region_0_94_constant_31116 = load float, ptr %region_0_94_constant_31115, align 4
  %92 = getelementptr inbounds float, ptr %arg29, i32 %linear_index
  %93 = load float, ptr %92, align 4, !invariant.load !5
  %multiply.91 = fmul float %region_0_94_constant_31116, %93
  %region_0_94_constant_33117 = getelementptr inbounds float, ptr @0, i32 %linear_index
  %region_0_94_constant_33118 = load float, ptr %region_0_94_constant_33117, align 4
  %add.92 = fadd float %multiply.91, %region_0_94_constant_33118
  %94 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %91, float %add.92, 29
  %95 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 0
  %96 = getelementptr inbounds float, ptr %arg30, i32 %linear_index
  store float %95, ptr %96, align 4
  %97 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 1
  %98 = getelementptr inbounds float, ptr %arg31, i32 %linear_index
  store float %97, ptr %98, align 4
  %99 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 2
  %100 = getelementptr inbounds float, ptr %arg32, i32 %linear_index
  store float %99, ptr %100, align 4
  %101 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 3
  %102 = getelementptr inbounds float, ptr %arg33, i32 %linear_index
  store float %101, ptr %102, align 4
  %103 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 4
  %104 = getelementptr inbounds float, ptr %arg34, i32 %linear_index
  store float %103, ptr %104, align 4
  %105 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 5
  %106 = getelementptr inbounds float, ptr %arg35, i32 %linear_index
  store float %105, ptr %106, align 4
  %107 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 6
  %108 = getelementptr inbounds float, ptr %arg36, i32 %linear_index
  store float %107, ptr %108, align 4
  %109 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 7
  %110 = getelementptr inbounds float, ptr %arg37, i32 %linear_index
  store float %109, ptr %110, align 4
  %111 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 8
  %112 = getelementptr inbounds float, ptr %arg38, i32 %linear_index
  store float %111, ptr %112, align 4
  %113 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 9
  %114 = getelementptr inbounds float, ptr %arg39, i32 %linear_index
  store float %113, ptr %114, align 4
  %115 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 10
  %116 = getelementptr inbounds float, ptr %arg40, i32 %linear_index
  store float %115, ptr %116, align 4
  %117 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 11
  %118 = getelementptr inbounds float, ptr %arg41, i32 %linear_index
  store float %117, ptr %118, align 4
  %119 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 12
  %120 = getelementptr inbounds float, ptr %arg42, i32 %linear_index
  store float %119, ptr %120, align 4
  %121 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 13
  %122 = getelementptr inbounds float, ptr %arg43, i32 %linear_index
  store float %121, ptr %122, align 4
  %123 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 14
  %124 = getelementptr inbounds float, ptr %arg44, i32 %linear_index
  store float %123, ptr %124, align 4
  %125 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 15
  %126 = getelementptr inbounds float, ptr %arg45, i32 %linear_index
  store float %125, ptr %126, align 4
  %127 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 16
  %128 = getelementptr inbounds float, ptr %arg46, i32 %linear_index
  store float %127, ptr %128, align 4
  %129 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 17
  %130 = getelementptr inbounds float, ptr %arg47, i32 %linear_index
  store float %129, ptr %130, align 4
  %131 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 18
  %132 = getelementptr inbounds float, ptr %arg48, i32 %linear_index
  store float %131, ptr %132, align 4
  %133 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 19
  %134 = getelementptr inbounds float, ptr %arg49, i32 %linear_index
  store float %133, ptr %134, align 4
  %135 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 20
  %136 = getelementptr inbounds float, ptr %arg50, i32 %linear_index
  store float %135, ptr %136, align 4
  %137 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 21
  %138 = getelementptr inbounds float, ptr %arg51, i32 %linear_index
  store float %137, ptr %138, align 4
  %139 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 22
  %140 = getelementptr inbounds float, ptr %arg52, i32 %linear_index
  store float %139, ptr %140, align 4
  %141 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 23
  %142 = getelementptr inbounds float, ptr %arg53, i32 %linear_index
  store float %141, ptr %142, align 4
  %143 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 24
  %144 = getelementptr inbounds float, ptr %arg54, i32 %linear_index
  store float %143, ptr %144, align 4
  %145 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 25
  %146 = getelementptr inbounds float, ptr %arg55, i32 %linear_index
  store float %145, ptr %146, align 4
  %147 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 26
  %148 = getelementptr inbounds float, ptr %arg56, i32 %linear_index
  store float %147, ptr %148, align 4
  %149 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 27
  %150 = getelementptr inbounds float, ptr %arg57, i32 %linear_index
  store float %149, ptr %150, align 4
  %151 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 28
  %152 = getelementptr inbounds float, ptr %arg58, i32 %linear_index
  store float %151, ptr %152, align 4
  %153 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, 29
  %154 = getelementptr inbounds float, ptr %arg59, i32 %linear_index
  store float %153, ptr %154, align 4
  br label %fusion_96.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_97(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(4) %arg3, ptr noalias align 16 dereferenceable(4) %arg4, ptr noalias align 16 dereferenceable(4) %arg5, ptr noalias align 16 dereferenceable(4) %arg6, ptr noalias align 16 dereferenceable(4) %arg7, ptr noalias align 16 dereferenceable(4) %arg8, ptr noalias align 16 dereferenceable(4) %arg9, ptr noalias align 16 dereferenceable(4) %arg10, ptr noalias align 16 dereferenceable(4) %arg11, ptr noalias align 16 dereferenceable(4) %arg12, ptr noalias align 16 dereferenceable(4) %arg13, ptr noalias align 16 dereferenceable(4) %arg14, ptr noalias align 16 dereferenceable(4) %arg15, ptr noalias align 16 dereferenceable(4) %arg16, ptr noalias align 16 dereferenceable(4) %arg17, ptr noalias align 16 dereferenceable(4) %arg18, ptr noalias align 16 dereferenceable(4) %arg19, ptr noalias align 16 dereferenceable(4) %arg20, ptr noalias align 16 dereferenceable(4) %arg21, ptr noalias align 16 dereferenceable(4) %arg22, ptr noalias align 16 dereferenceable(4) %arg23, ptr noalias align 16 dereferenceable(4) %arg24, ptr noalias align 16 dereferenceable(4) %arg25, ptr noalias align 16 dereferenceable(4) %arg26, ptr noalias align 16 dereferenceable(4) %arg27, ptr noalias align 16 dereferenceable(4) %arg28, ptr noalias align 16 dereferenceable(4) %arg29, ptr noalias align 16 dereferenceable(4) %arg30, ptr noalias align 16 dereferenceable(4) %arg31, ptr noalias align 16 dereferenceable(4) %arg32, ptr noalias align 16 dereferenceable(4) %arg33, ptr noalias align 16 dereferenceable(4) %arg34, ptr noalias align 16 dereferenceable(4) %arg35, ptr noalias align 16 dereferenceable(4) %arg36, ptr noalias align 16 dereferenceable(4) %arg37, ptr noalias align 16 dereferenceable(4) %arg38, ptr noalias align 16 dereferenceable(4) %arg39, ptr noalias align 16 dereferenceable(4) %arg40, ptr noalias align 16 dereferenceable(4) %arg41, ptr noalias align 16 dereferenceable(4) %arg42, ptr noalias align 16 dereferenceable(4) %arg43, ptr noalias align 16 dereferenceable(4) %arg44, ptr noalias align 16 dereferenceable(4) %arg45, ptr noalias align 16 dereferenceable(4) %arg46, ptr noalias align 16 dereferenceable(4) %arg47, ptr noalias align 16 dereferenceable(4) %arg48, ptr noalias align 16 dereferenceable(4) %arg49, ptr noalias align 16 dereferenceable(4) %arg50, ptr noalias align 16 dereferenceable(4) %arg51, ptr noalias align 16 dereferenceable(4) %arg52, ptr noalias align 16 dereferenceable(4) %arg53, ptr noalias align 16 dereferenceable(4) %arg54, ptr noalias align 16 dereferenceable(4) %arg55, ptr noalias align 16 dereferenceable(4) %arg56, ptr noalias align 16 dereferenceable(4) %arg57, ptr noalias align 16 dereferenceable(4) %arg58, ptr noalias align 16 dereferenceable(4) %arg59, ptr noalias align 16 dereferenceable(4) %arg60, ptr noalias align 16 dereferenceable(4) %arg61, ptr noalias align 16 dereferenceable(4) %arg62, ptr noalias align 16 dereferenceable(4) %arg63, ptr noalias align 128 dereferenceable(4) %arg64, ptr noalias align 128 dereferenceable(4) %arg65, ptr noalias align 128 dereferenceable(4) %arg66, ptr noalias align 128 dereferenceable(4) %arg67, ptr noalias align 128 dereferenceable(4) %arg68, ptr noalias align 128 dereferenceable(4) %arg69, ptr noalias align 128 dereferenceable(4) %arg70, ptr noalias align 128 dereferenceable(4) %arg71, ptr noalias align 128 dereferenceable(4) %arg72, ptr noalias align 128 dereferenceable(4) %arg73, ptr noalias align 128 dereferenceable(4) %arg74, ptr noalias align 128 dereferenceable(4) %arg75, ptr noalias align 128 dereferenceable(4) %arg76, ptr noalias align 128 dereferenceable(4) %arg77, ptr noalias align 128 dereferenceable(4) %arg78, ptr noalias align 128 dereferenceable(4) %arg79, ptr noalias align 128 dereferenceable(4) %arg80, ptr noalias align 128 dereferenceable(4) %arg81, ptr noalias align 128 dereferenceable(4) %arg82, ptr noalias align 128 dereferenceable(4) %arg83, ptr noalias align 128 dereferenceable(4) %arg84, ptr noalias align 128 dereferenceable(4) %arg85, ptr noalias align 128 dereferenceable(4) %arg86, ptr noalias align 128 dereferenceable(4) %arg87, ptr noalias align 128 dereferenceable(4) %arg88, ptr noalias align 128 dereferenceable(4) %arg89, ptr noalias align 128 dereferenceable(4) %arg90, ptr noalias align 128 dereferenceable(4) %arg91, ptr noalias align 128 dereferenceable(4) %arg92, ptr noalias align 128 dereferenceable(4) %arg93, ptr noalias align 128 dereferenceable(4) %arg94, ptr noalias align 128 dereferenceable(4) %arg95, ptr noalias align 128 dereferenceable(4) %arg96, ptr noalias align 128 dereferenceable(4) %arg97, ptr noalias align 128 dereferenceable(4) %arg98, ptr noalias align 128 dereferenceable(4) %arg99, ptr noalias align 128 dereferenceable(4) %arg100, ptr noalias align 128 dereferenceable(4) %arg101, ptr noalias align 128 dereferenceable(4) %arg102, ptr noalias align 128 dereferenceable(4) %arg103, ptr noalias align 128 dereferenceable(4) %arg104, ptr noalias align 128 dereferenceable(4) %arg105, ptr noalias align 128 dereferenceable(4) %arg106, ptr noalias align 128 dereferenceable(4) %arg107, ptr noalias align 128 dereferenceable(4) %arg108, ptr noalias align 128 dereferenceable(4) %arg109, ptr noalias align 128 dereferenceable(4) %arg110, ptr noalias align 128 dereferenceable(4) %arg111, ptr noalias align 128 dereferenceable(4) %arg112, ptr noalias align 128 dereferenceable(4) %arg113, ptr noalias align 128 dereferenceable(4) %arg114, ptr noalias align 128 dereferenceable(4) %arg115, ptr noalias align 128 dereferenceable(4) %arg116, ptr noalias align 128 dereferenceable(4) %arg117, ptr noalias align 128 dereferenceable(4) %arg118, ptr noalias align 128 dereferenceable(4) %arg119, ptr noalias align 128 dereferenceable(4) %arg120, ptr noalias align 128 dereferenceable(4) %arg121, ptr noalias align 128 dereferenceable(4) %arg122, ptr noalias align 128 dereferenceable(4) %arg123, ptr noalias align 128 dereferenceable(4) %arg124, ptr noalias align 128 dereferenceable(4) %arg125, ptr noalias align 128 dereferenceable(4) %arg126, ptr noalias align 128 dereferenceable(4) %arg127) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !4
  %2 = mul nuw nsw i32 %0, 1
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 1
  br i1 %4, label %fusion_97.in_bounds-true, label %fusion_97.in_bounds-after

fusion_97.in_bounds-after:                        ; preds = %fusion_97.in_bounds-true, %entry
  ret void

fusion_97.in_bounds-true:                         ; preds = %entry
  %region_0_196_constant_65 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_651 = load float, ptr %region_0_196_constant_65, align 4
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !5
  %multiply.66 = fmul float %region_0_196_constant_651, %6
  %region_0_196_constant_67 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_672 = load float, ptr %region_0_196_constant_67, align 4
  %add.68 = fadd float %multiply.66, %region_0_196_constant_672
  %7 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.68, 0
  %region_0_196_constant_653 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_654 = load float, ptr %region_0_196_constant_653, align 4
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4, !invariant.load !5
  %multiply.69 = fmul float %region_0_196_constant_654, %9
  %region_0_196_constant_675 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_676 = load float, ptr %region_0_196_constant_675, align 4
  %add.70 = fadd float %multiply.69, %region_0_196_constant_676
  %10 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %7, float %add.70, 1
  %region_0_196_constant_657 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_658 = load float, ptr %region_0_196_constant_657, align 4
  %11 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !5
  %multiply.71 = fmul float %region_0_196_constant_658, %12
  %region_0_196_constant_679 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6710 = load float, ptr %region_0_196_constant_679, align 4
  %add.72 = fadd float %multiply.71, %region_0_196_constant_6710
  %13 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %10, float %add.72, 2
  %region_0_196_constant_6511 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6512 = load float, ptr %region_0_196_constant_6511, align 4
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %15 = load float, ptr %14, align 4, !invariant.load !5
  %multiply.73 = fmul float %region_0_196_constant_6512, %15
  %region_0_196_constant_6713 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6714 = load float, ptr %region_0_196_constant_6713, align 4
  %add.74 = fadd float %multiply.73, %region_0_196_constant_6714
  %16 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %13, float %add.74, 3
  %region_0_196_constant_6515 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6516 = load float, ptr %region_0_196_constant_6515, align 4
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %18 = load float, ptr %17, align 4, !invariant.load !5
  %multiply.75 = fmul float %region_0_196_constant_6516, %18
  %region_0_196_constant_6717 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6718 = load float, ptr %region_0_196_constant_6717, align 4
  %add.76 = fadd float %multiply.75, %region_0_196_constant_6718
  %19 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %16, float %add.76, 4
  %region_0_196_constant_6519 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6520 = load float, ptr %region_0_196_constant_6519, align 4
  %20 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %21 = load float, ptr %20, align 4, !invariant.load !5
  %multiply.77 = fmul float %region_0_196_constant_6520, %21
  %region_0_196_constant_6721 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6722 = load float, ptr %region_0_196_constant_6721, align 4
  %add.78 = fadd float %multiply.77, %region_0_196_constant_6722
  %22 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %19, float %add.78, 5
  %region_0_196_constant_6523 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6524 = load float, ptr %region_0_196_constant_6523, align 4
  %23 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %24 = load float, ptr %23, align 4, !invariant.load !5
  %multiply.79 = fmul float %region_0_196_constant_6524, %24
  %region_0_196_constant_6725 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6726 = load float, ptr %region_0_196_constant_6725, align 4
  %add.80 = fadd float %multiply.79, %region_0_196_constant_6726
  %25 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %22, float %add.80, 6
  %region_0_196_constant_6527 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6528 = load float, ptr %region_0_196_constant_6527, align 4
  %26 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %27 = load float, ptr %26, align 4, !invariant.load !5
  %multiply.81 = fmul float %region_0_196_constant_6528, %27
  %region_0_196_constant_6729 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6730 = load float, ptr %region_0_196_constant_6729, align 4
  %add.82 = fadd float %multiply.81, %region_0_196_constant_6730
  %28 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %25, float %add.82, 7
  %region_0_196_constant_6531 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6532 = load float, ptr %region_0_196_constant_6531, align 4
  %29 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %30 = load float, ptr %29, align 4, !invariant.load !5
  %multiply.83 = fmul float %region_0_196_constant_6532, %30
  %region_0_196_constant_6733 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6734 = load float, ptr %region_0_196_constant_6733, align 4
  %add.84 = fadd float %multiply.83, %region_0_196_constant_6734
  %31 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %28, float %add.84, 8
  %region_0_196_constant_6535 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6536 = load float, ptr %region_0_196_constant_6535, align 4
  %32 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %33 = load float, ptr %32, align 4, !invariant.load !5
  %multiply.85 = fmul float %region_0_196_constant_6536, %33
  %region_0_196_constant_6737 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6738 = load float, ptr %region_0_196_constant_6737, align 4
  %add.86 = fadd float %multiply.85, %region_0_196_constant_6738
  %34 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %31, float %add.86, 9
  %region_0_196_constant_6539 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6540 = load float, ptr %region_0_196_constant_6539, align 4
  %35 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %36 = load float, ptr %35, align 4, !invariant.load !5
  %multiply.87 = fmul float %region_0_196_constant_6540, %36
  %region_0_196_constant_6741 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6742 = load float, ptr %region_0_196_constant_6741, align 4
  %add.88 = fadd float %multiply.87, %region_0_196_constant_6742
  %37 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %34, float %add.88, 10
  %region_0_196_constant_6543 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6544 = load float, ptr %region_0_196_constant_6543, align 4
  %38 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %39 = load float, ptr %38, align 4, !invariant.load !5
  %multiply.89 = fmul float %region_0_196_constant_6544, %39
  %region_0_196_constant_6745 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6746 = load float, ptr %region_0_196_constant_6745, align 4
  %add.90 = fadd float %multiply.89, %region_0_196_constant_6746
  %40 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %37, float %add.90, 11
  %region_0_196_constant_6547 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6548 = load float, ptr %region_0_196_constant_6547, align 4
  %41 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %42 = load float, ptr %41, align 4, !invariant.load !5
  %multiply.91 = fmul float %region_0_196_constant_6548, %42
  %region_0_196_constant_6749 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6750 = load float, ptr %region_0_196_constant_6749, align 4
  %add.92 = fadd float %multiply.91, %region_0_196_constant_6750
  %43 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %40, float %add.92, 12
  %region_0_196_constant_6551 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6552 = load float, ptr %region_0_196_constant_6551, align 4
  %44 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  %45 = load float, ptr %44, align 4, !invariant.load !5
  %multiply.93 = fmul float %region_0_196_constant_6552, %45
  %region_0_196_constant_6753 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6754 = load float, ptr %region_0_196_constant_6753, align 4
  %add.94 = fadd float %multiply.93, %region_0_196_constant_6754
  %46 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %43, float %add.94, 13
  %region_0_196_constant_6555 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6556 = load float, ptr %region_0_196_constant_6555, align 4
  %47 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  %48 = load float, ptr %47, align 4, !invariant.load !5
  %multiply.95 = fmul float %region_0_196_constant_6556, %48
  %region_0_196_constant_6757 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6758 = load float, ptr %region_0_196_constant_6757, align 4
  %add.96 = fadd float %multiply.95, %region_0_196_constant_6758
  %49 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %46, float %add.96, 14
  %region_0_196_constant_6559 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6560 = load float, ptr %region_0_196_constant_6559, align 4
  %50 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  %51 = load float, ptr %50, align 4, !invariant.load !5
  %multiply.97 = fmul float %region_0_196_constant_6560, %51
  %region_0_196_constant_6761 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6762 = load float, ptr %region_0_196_constant_6761, align 4
  %add.98 = fadd float %multiply.97, %region_0_196_constant_6762
  %52 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %49, float %add.98, 15
  %region_0_196_constant_6563 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6564 = load float, ptr %region_0_196_constant_6563, align 4
  %53 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  %54 = load float, ptr %53, align 4, !invariant.load !5
  %multiply.99 = fmul float %region_0_196_constant_6564, %54
  %region_0_196_constant_6765 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6766 = load float, ptr %region_0_196_constant_6765, align 4
  %add.100 = fadd float %multiply.99, %region_0_196_constant_6766
  %55 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %52, float %add.100, 16
  %region_0_196_constant_6567 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6568 = load float, ptr %region_0_196_constant_6567, align 4
  %56 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  %57 = load float, ptr %56, align 4, !invariant.load !5
  %multiply.101 = fmul float %region_0_196_constant_6568, %57
  %region_0_196_constant_6769 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6770 = load float, ptr %region_0_196_constant_6769, align 4
  %add.102 = fadd float %multiply.101, %region_0_196_constant_6770
  %58 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %55, float %add.102, 17
  %region_0_196_constant_6571 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6572 = load float, ptr %region_0_196_constant_6571, align 4
  %59 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  %60 = load float, ptr %59, align 4, !invariant.load !5
  %multiply.103 = fmul float %region_0_196_constant_6572, %60
  %region_0_196_constant_6773 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6774 = load float, ptr %region_0_196_constant_6773, align 4
  %add.104 = fadd float %multiply.103, %region_0_196_constant_6774
  %61 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %58, float %add.104, 18
  %region_0_196_constant_6575 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6576 = load float, ptr %region_0_196_constant_6575, align 4
  %62 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  %63 = load float, ptr %62, align 4, !invariant.load !5
  %multiply.105 = fmul float %region_0_196_constant_6576, %63
  %region_0_196_constant_6777 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6778 = load float, ptr %region_0_196_constant_6777, align 4
  %add.106 = fadd float %multiply.105, %region_0_196_constant_6778
  %64 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %61, float %add.106, 19
  %region_0_196_constant_6579 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6580 = load float, ptr %region_0_196_constant_6579, align 4
  %65 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  %66 = load float, ptr %65, align 4, !invariant.load !5
  %multiply.107 = fmul float %region_0_196_constant_6580, %66
  %region_0_196_constant_6781 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6782 = load float, ptr %region_0_196_constant_6781, align 4
  %add.108 = fadd float %multiply.107, %region_0_196_constant_6782
  %67 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %64, float %add.108, 20
  %region_0_196_constant_6583 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6584 = load float, ptr %region_0_196_constant_6583, align 4
  %68 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  %69 = load float, ptr %68, align 4, !invariant.load !5
  %multiply.109 = fmul float %region_0_196_constant_6584, %69
  %region_0_196_constant_6785 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6786 = load float, ptr %region_0_196_constant_6785, align 4
  %add.110 = fadd float %multiply.109, %region_0_196_constant_6786
  %70 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %67, float %add.110, 21
  %region_0_196_constant_6587 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6588 = load float, ptr %region_0_196_constant_6587, align 4
  %71 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  %72 = load float, ptr %71, align 4, !invariant.load !5
  %multiply.111 = fmul float %region_0_196_constant_6588, %72
  %region_0_196_constant_6789 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6790 = load float, ptr %region_0_196_constant_6789, align 4
  %add.112 = fadd float %multiply.111, %region_0_196_constant_6790
  %73 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %70, float %add.112, 22
  %region_0_196_constant_6591 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6592 = load float, ptr %region_0_196_constant_6591, align 4
  %74 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  %75 = load float, ptr %74, align 4, !invariant.load !5
  %multiply.113 = fmul float %region_0_196_constant_6592, %75
  %region_0_196_constant_6793 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6794 = load float, ptr %region_0_196_constant_6793, align 4
  %add.114 = fadd float %multiply.113, %region_0_196_constant_6794
  %76 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %73, float %add.114, 23
  %region_0_196_constant_6595 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_6596 = load float, ptr %region_0_196_constant_6595, align 4
  %77 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  %78 = load float, ptr %77, align 4, !invariant.load !5
  %multiply.115 = fmul float %region_0_196_constant_6596, %78
  %region_0_196_constant_6797 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_6798 = load float, ptr %region_0_196_constant_6797, align 4
  %add.116 = fadd float %multiply.115, %region_0_196_constant_6798
  %79 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %76, float %add.116, 24
  %region_0_196_constant_6599 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65100 = load float, ptr %region_0_196_constant_6599, align 4
  %80 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  %81 = load float, ptr %80, align 4, !invariant.load !5
  %multiply.117 = fmul float %region_0_196_constant_65100, %81
  %region_0_196_constant_67101 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67102 = load float, ptr %region_0_196_constant_67101, align 4
  %add.118 = fadd float %multiply.117, %region_0_196_constant_67102
  %82 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %79, float %add.118, 25
  %region_0_196_constant_65103 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65104 = load float, ptr %region_0_196_constant_65103, align 4
  %83 = getelementptr inbounds float, ptr %arg26, i32 %linear_index
  %84 = load float, ptr %83, align 4, !invariant.load !5
  %multiply.119 = fmul float %region_0_196_constant_65104, %84
  %region_0_196_constant_67105 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67106 = load float, ptr %region_0_196_constant_67105, align 4
  %add.120 = fadd float %multiply.119, %region_0_196_constant_67106
  %85 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %82, float %add.120, 26
  %region_0_196_constant_65107 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65108 = load float, ptr %region_0_196_constant_65107, align 4
  %86 = getelementptr inbounds float, ptr %arg27, i32 %linear_index
  %87 = load float, ptr %86, align 4, !invariant.load !5
  %multiply.121 = fmul float %region_0_196_constant_65108, %87
  %region_0_196_constant_67109 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67110 = load float, ptr %region_0_196_constant_67109, align 4
  %add.122 = fadd float %multiply.121, %region_0_196_constant_67110
  %88 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %85, float %add.122, 27
  %region_0_196_constant_65111 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65112 = load float, ptr %region_0_196_constant_65111, align 4
  %89 = getelementptr inbounds float, ptr %arg28, i32 %linear_index
  %90 = load float, ptr %89, align 4, !invariant.load !5
  %multiply.123 = fmul float %region_0_196_constant_65112, %90
  %region_0_196_constant_67113 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67114 = load float, ptr %region_0_196_constant_67113, align 4
  %add.124 = fadd float %multiply.123, %region_0_196_constant_67114
  %91 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %88, float %add.124, 28
  %region_0_196_constant_65115 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65116 = load float, ptr %region_0_196_constant_65115, align 4
  %92 = getelementptr inbounds float, ptr %arg29, i32 %linear_index
  %93 = load float, ptr %92, align 4, !invariant.load !5
  %multiply.125 = fmul float %region_0_196_constant_65116, %93
  %region_0_196_constant_67117 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67118 = load float, ptr %region_0_196_constant_67117, align 4
  %add.126 = fadd float %multiply.125, %region_0_196_constant_67118
  %94 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %91, float %add.126, 29
  %region_0_196_constant_65119 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65120 = load float, ptr %region_0_196_constant_65119, align 4
  %95 = getelementptr inbounds float, ptr %arg30, i32 %linear_index
  %96 = load float, ptr %95, align 4, !invariant.load !5
  %multiply.127 = fmul float %region_0_196_constant_65120, %96
  %region_0_196_constant_67121 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67122 = load float, ptr %region_0_196_constant_67121, align 4
  %add.128 = fadd float %multiply.127, %region_0_196_constant_67122
  %97 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %94, float %add.128, 30
  %region_0_196_constant_65123 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65124 = load float, ptr %region_0_196_constant_65123, align 4
  %98 = getelementptr inbounds float, ptr %arg31, i32 %linear_index
  %99 = load float, ptr %98, align 4, !invariant.load !5
  %multiply.129 = fmul float %region_0_196_constant_65124, %99
  %region_0_196_constant_67125 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67126 = load float, ptr %region_0_196_constant_67125, align 4
  %add.130 = fadd float %multiply.129, %region_0_196_constant_67126
  %100 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %97, float %add.130, 31
  %region_0_196_constant_65127 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65128 = load float, ptr %region_0_196_constant_65127, align 4
  %101 = getelementptr inbounds float, ptr %arg32, i32 %linear_index
  %102 = load float, ptr %101, align 4, !invariant.load !5
  %multiply.131 = fmul float %region_0_196_constant_65128, %102
  %region_0_196_constant_67129 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67130 = load float, ptr %region_0_196_constant_67129, align 4
  %add.132 = fadd float %multiply.131, %region_0_196_constant_67130
  %103 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %100, float %add.132, 32
  %region_0_196_constant_65131 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65132 = load float, ptr %region_0_196_constant_65131, align 4
  %104 = getelementptr inbounds float, ptr %arg33, i32 %linear_index
  %105 = load float, ptr %104, align 4, !invariant.load !5
  %multiply.133 = fmul float %region_0_196_constant_65132, %105
  %region_0_196_constant_67133 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67134 = load float, ptr %region_0_196_constant_67133, align 4
  %add.134 = fadd float %multiply.133, %region_0_196_constant_67134
  %106 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %103, float %add.134, 33
  %region_0_196_constant_65135 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65136 = load float, ptr %region_0_196_constant_65135, align 4
  %107 = getelementptr inbounds float, ptr %arg34, i32 %linear_index
  %108 = load float, ptr %107, align 4, !invariant.load !5
  %multiply.135 = fmul float %region_0_196_constant_65136, %108
  %region_0_196_constant_67137 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67138 = load float, ptr %region_0_196_constant_67137, align 4
  %add.136 = fadd float %multiply.135, %region_0_196_constant_67138
  %109 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %106, float %add.136, 34
  %region_0_196_constant_65139 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65140 = load float, ptr %region_0_196_constant_65139, align 4
  %110 = getelementptr inbounds float, ptr %arg35, i32 %linear_index
  %111 = load float, ptr %110, align 4, !invariant.load !5
  %multiply.137 = fmul float %region_0_196_constant_65140, %111
  %region_0_196_constant_67141 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67142 = load float, ptr %region_0_196_constant_67141, align 4
  %add.138 = fadd float %multiply.137, %region_0_196_constant_67142
  %112 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %109, float %add.138, 35
  %region_0_196_constant_65143 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65144 = load float, ptr %region_0_196_constant_65143, align 4
  %113 = getelementptr inbounds float, ptr %arg36, i32 %linear_index
  %114 = load float, ptr %113, align 4, !invariant.load !5
  %multiply.139 = fmul float %region_0_196_constant_65144, %114
  %region_0_196_constant_67145 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67146 = load float, ptr %region_0_196_constant_67145, align 4
  %add.140 = fadd float %multiply.139, %region_0_196_constant_67146
  %115 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %112, float %add.140, 36
  %region_0_196_constant_65147 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65148 = load float, ptr %region_0_196_constant_65147, align 4
  %116 = getelementptr inbounds float, ptr %arg37, i32 %linear_index
  %117 = load float, ptr %116, align 4, !invariant.load !5
  %multiply.141 = fmul float %region_0_196_constant_65148, %117
  %region_0_196_constant_67149 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67150 = load float, ptr %region_0_196_constant_67149, align 4
  %add.142 = fadd float %multiply.141, %region_0_196_constant_67150
  %118 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %115, float %add.142, 37
  %region_0_196_constant_65151 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65152 = load float, ptr %region_0_196_constant_65151, align 4
  %119 = getelementptr inbounds float, ptr %arg38, i32 %linear_index
  %120 = load float, ptr %119, align 4, !invariant.load !5
  %multiply.143 = fmul float %region_0_196_constant_65152, %120
  %region_0_196_constant_67153 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67154 = load float, ptr %region_0_196_constant_67153, align 4
  %add.144 = fadd float %multiply.143, %region_0_196_constant_67154
  %121 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %118, float %add.144, 38
  %region_0_196_constant_65155 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65156 = load float, ptr %region_0_196_constant_65155, align 4
  %122 = getelementptr inbounds float, ptr %arg39, i32 %linear_index
  %123 = load float, ptr %122, align 4, !invariant.load !5
  %multiply.145 = fmul float %region_0_196_constant_65156, %123
  %region_0_196_constant_67157 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67158 = load float, ptr %region_0_196_constant_67157, align 4
  %add.146 = fadd float %multiply.145, %region_0_196_constant_67158
  %124 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %121, float %add.146, 39
  %region_0_196_constant_65159 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65160 = load float, ptr %region_0_196_constant_65159, align 4
  %125 = getelementptr inbounds float, ptr %arg40, i32 %linear_index
  %126 = load float, ptr %125, align 4, !invariant.load !5
  %multiply.147 = fmul float %region_0_196_constant_65160, %126
  %region_0_196_constant_67161 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67162 = load float, ptr %region_0_196_constant_67161, align 4
  %add.148 = fadd float %multiply.147, %region_0_196_constant_67162
  %127 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %124, float %add.148, 40
  %region_0_196_constant_65163 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65164 = load float, ptr %region_0_196_constant_65163, align 4
  %128 = getelementptr inbounds float, ptr %arg41, i32 %linear_index
  %129 = load float, ptr %128, align 4, !invariant.load !5
  %multiply.149 = fmul float %region_0_196_constant_65164, %129
  %region_0_196_constant_67165 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67166 = load float, ptr %region_0_196_constant_67165, align 4
  %add.150 = fadd float %multiply.149, %region_0_196_constant_67166
  %130 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %127, float %add.150, 41
  %region_0_196_constant_65167 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65168 = load float, ptr %region_0_196_constant_65167, align 4
  %131 = getelementptr inbounds float, ptr %arg42, i32 %linear_index
  %132 = load float, ptr %131, align 4, !invariant.load !5
  %multiply.151 = fmul float %region_0_196_constant_65168, %132
  %region_0_196_constant_67169 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67170 = load float, ptr %region_0_196_constant_67169, align 4
  %add.152 = fadd float %multiply.151, %region_0_196_constant_67170
  %133 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %130, float %add.152, 42
  %region_0_196_constant_65171 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65172 = load float, ptr %region_0_196_constant_65171, align 4
  %134 = getelementptr inbounds float, ptr %arg43, i32 %linear_index
  %135 = load float, ptr %134, align 4, !invariant.load !5
  %multiply.153 = fmul float %region_0_196_constant_65172, %135
  %region_0_196_constant_67173 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67174 = load float, ptr %region_0_196_constant_67173, align 4
  %add.154 = fadd float %multiply.153, %region_0_196_constant_67174
  %136 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %133, float %add.154, 43
  %region_0_196_constant_65175 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65176 = load float, ptr %region_0_196_constant_65175, align 4
  %137 = getelementptr inbounds float, ptr %arg44, i32 %linear_index
  %138 = load float, ptr %137, align 4, !invariant.load !5
  %multiply.155 = fmul float %region_0_196_constant_65176, %138
  %region_0_196_constant_67177 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67178 = load float, ptr %region_0_196_constant_67177, align 4
  %add.156 = fadd float %multiply.155, %region_0_196_constant_67178
  %139 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %136, float %add.156, 44
  %region_0_196_constant_65179 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65180 = load float, ptr %region_0_196_constant_65179, align 4
  %140 = getelementptr inbounds float, ptr %arg45, i32 %linear_index
  %141 = load float, ptr %140, align 4, !invariant.load !5
  %multiply.157 = fmul float %region_0_196_constant_65180, %141
  %region_0_196_constant_67181 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67182 = load float, ptr %region_0_196_constant_67181, align 4
  %add.158 = fadd float %multiply.157, %region_0_196_constant_67182
  %142 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %139, float %add.158, 45
  %region_0_196_constant_65183 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65184 = load float, ptr %region_0_196_constant_65183, align 4
  %143 = getelementptr inbounds float, ptr %arg46, i32 %linear_index
  %144 = load float, ptr %143, align 4, !invariant.load !5
  %multiply.159 = fmul float %region_0_196_constant_65184, %144
  %region_0_196_constant_67185 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67186 = load float, ptr %region_0_196_constant_67185, align 4
  %add.160 = fadd float %multiply.159, %region_0_196_constant_67186
  %145 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %142, float %add.160, 46
  %region_0_196_constant_65187 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65188 = load float, ptr %region_0_196_constant_65187, align 4
  %146 = getelementptr inbounds float, ptr %arg47, i32 %linear_index
  %147 = load float, ptr %146, align 4, !invariant.load !5
  %multiply.161 = fmul float %region_0_196_constant_65188, %147
  %region_0_196_constant_67189 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67190 = load float, ptr %region_0_196_constant_67189, align 4
  %add.162 = fadd float %multiply.161, %region_0_196_constant_67190
  %148 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %145, float %add.162, 47
  %region_0_196_constant_65191 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65192 = load float, ptr %region_0_196_constant_65191, align 4
  %149 = getelementptr inbounds float, ptr %arg48, i32 %linear_index
  %150 = load float, ptr %149, align 4, !invariant.load !5
  %multiply.163 = fmul float %region_0_196_constant_65192, %150
  %region_0_196_constant_67193 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67194 = load float, ptr %region_0_196_constant_67193, align 4
  %add.164 = fadd float %multiply.163, %region_0_196_constant_67194
  %151 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %148, float %add.164, 48
  %region_0_196_constant_65195 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65196 = load float, ptr %region_0_196_constant_65195, align 4
  %152 = getelementptr inbounds float, ptr %arg49, i32 %linear_index
  %153 = load float, ptr %152, align 4, !invariant.load !5
  %multiply.165 = fmul float %region_0_196_constant_65196, %153
  %region_0_196_constant_67197 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67198 = load float, ptr %region_0_196_constant_67197, align 4
  %add.166 = fadd float %multiply.165, %region_0_196_constant_67198
  %154 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %151, float %add.166, 49
  %region_0_196_constant_65199 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65200 = load float, ptr %region_0_196_constant_65199, align 4
  %155 = getelementptr inbounds float, ptr %arg50, i32 %linear_index
  %156 = load float, ptr %155, align 4, !invariant.load !5
  %multiply.167 = fmul float %region_0_196_constant_65200, %156
  %region_0_196_constant_67201 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67202 = load float, ptr %region_0_196_constant_67201, align 4
  %add.168 = fadd float %multiply.167, %region_0_196_constant_67202
  %157 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %154, float %add.168, 50
  %region_0_196_constant_65203 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65204 = load float, ptr %region_0_196_constant_65203, align 4
  %158 = getelementptr inbounds float, ptr %arg51, i32 %linear_index
  %159 = load float, ptr %158, align 4, !invariant.load !5
  %multiply.169 = fmul float %region_0_196_constant_65204, %159
  %region_0_196_constant_67205 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67206 = load float, ptr %region_0_196_constant_67205, align 4
  %add.170 = fadd float %multiply.169, %region_0_196_constant_67206
  %160 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %157, float %add.170, 51
  %region_0_196_constant_65207 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65208 = load float, ptr %region_0_196_constant_65207, align 4
  %161 = getelementptr inbounds float, ptr %arg52, i32 %linear_index
  %162 = load float, ptr %161, align 4, !invariant.load !5
  %multiply.171 = fmul float %region_0_196_constant_65208, %162
  %region_0_196_constant_67209 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67210 = load float, ptr %region_0_196_constant_67209, align 4
  %add.172 = fadd float %multiply.171, %region_0_196_constant_67210
  %163 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %160, float %add.172, 52
  %region_0_196_constant_65211 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65212 = load float, ptr %region_0_196_constant_65211, align 4
  %164 = getelementptr inbounds float, ptr %arg53, i32 %linear_index
  %165 = load float, ptr %164, align 4, !invariant.load !5
  %multiply.173 = fmul float %region_0_196_constant_65212, %165
  %region_0_196_constant_67213 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67214 = load float, ptr %region_0_196_constant_67213, align 4
  %add.174 = fadd float %multiply.173, %region_0_196_constant_67214
  %166 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %163, float %add.174, 53
  %region_0_196_constant_65215 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65216 = load float, ptr %region_0_196_constant_65215, align 4
  %167 = getelementptr inbounds float, ptr %arg54, i32 %linear_index
  %168 = load float, ptr %167, align 4, !invariant.load !5
  %multiply.175 = fmul float %region_0_196_constant_65216, %168
  %region_0_196_constant_67217 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67218 = load float, ptr %region_0_196_constant_67217, align 4
  %add.176 = fadd float %multiply.175, %region_0_196_constant_67218
  %169 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %166, float %add.176, 54
  %region_0_196_constant_65219 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65220 = load float, ptr %region_0_196_constant_65219, align 4
  %170 = getelementptr inbounds float, ptr %arg55, i32 %linear_index
  %171 = load float, ptr %170, align 4, !invariant.load !5
  %multiply.177 = fmul float %region_0_196_constant_65220, %171
  %region_0_196_constant_67221 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67222 = load float, ptr %region_0_196_constant_67221, align 4
  %add.178 = fadd float %multiply.177, %region_0_196_constant_67222
  %172 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %169, float %add.178, 55
  %region_0_196_constant_65223 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65224 = load float, ptr %region_0_196_constant_65223, align 4
  %173 = getelementptr inbounds float, ptr %arg56, i32 %linear_index
  %174 = load float, ptr %173, align 4, !invariant.load !5
  %multiply.179 = fmul float %region_0_196_constant_65224, %174
  %region_0_196_constant_67225 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67226 = load float, ptr %region_0_196_constant_67225, align 4
  %add.180 = fadd float %multiply.179, %region_0_196_constant_67226
  %175 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %172, float %add.180, 56
  %region_0_196_constant_65227 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65228 = load float, ptr %region_0_196_constant_65227, align 4
  %176 = getelementptr inbounds float, ptr %arg57, i32 %linear_index
  %177 = load float, ptr %176, align 4, !invariant.load !5
  %multiply.181 = fmul float %region_0_196_constant_65228, %177
  %region_0_196_constant_67229 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67230 = load float, ptr %region_0_196_constant_67229, align 4
  %add.182 = fadd float %multiply.181, %region_0_196_constant_67230
  %178 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %175, float %add.182, 57
  %region_0_196_constant_65231 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65232 = load float, ptr %region_0_196_constant_65231, align 4
  %179 = getelementptr inbounds float, ptr %arg58, i32 %linear_index
  %180 = load float, ptr %179, align 4, !invariant.load !5
  %multiply.183 = fmul float %region_0_196_constant_65232, %180
  %region_0_196_constant_67233 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67234 = load float, ptr %region_0_196_constant_67233, align 4
  %add.184 = fadd float %multiply.183, %region_0_196_constant_67234
  %181 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %178, float %add.184, 58
  %region_0_196_constant_65235 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65236 = load float, ptr %region_0_196_constant_65235, align 4
  %182 = getelementptr inbounds float, ptr %arg59, i32 %linear_index
  %183 = load float, ptr %182, align 4, !invariant.load !5
  %multiply.185 = fmul float %region_0_196_constant_65236, %183
  %region_0_196_constant_67237 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67238 = load float, ptr %region_0_196_constant_67237, align 4
  %add.186 = fadd float %multiply.185, %region_0_196_constant_67238
  %184 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %181, float %add.186, 59
  %region_0_196_constant_65239 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65240 = load float, ptr %region_0_196_constant_65239, align 4
  %185 = getelementptr inbounds float, ptr %arg60, i32 %linear_index
  %186 = load float, ptr %185, align 4, !invariant.load !5
  %multiply.187 = fmul float %region_0_196_constant_65240, %186
  %region_0_196_constant_67241 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67242 = load float, ptr %region_0_196_constant_67241, align 4
  %add.188 = fadd float %multiply.187, %region_0_196_constant_67242
  %187 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %184, float %add.188, 60
  %region_0_196_constant_65243 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65244 = load float, ptr %region_0_196_constant_65243, align 4
  %188 = getelementptr inbounds float, ptr %arg61, i32 %linear_index
  %189 = load float, ptr %188, align 4, !invariant.load !5
  %multiply.189 = fmul float %region_0_196_constant_65244, %189
  %region_0_196_constant_67245 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67246 = load float, ptr %region_0_196_constant_67245, align 4
  %add.190 = fadd float %multiply.189, %region_0_196_constant_67246
  %190 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %187, float %add.190, 61
  %region_0_196_constant_65247 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65248 = load float, ptr %region_0_196_constant_65247, align 4
  %191 = getelementptr inbounds float, ptr %arg62, i32 %linear_index
  %192 = load float, ptr %191, align 4, !invariant.load !5
  %multiply.191 = fmul float %region_0_196_constant_65248, %192
  %region_0_196_constant_67249 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67250 = load float, ptr %region_0_196_constant_67249, align 4
  %add.192 = fadd float %multiply.191, %region_0_196_constant_67250
  %193 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %190, float %add.192, 62
  %region_0_196_constant_65251 = getelementptr inbounds float, ptr @3, i32 %linear_index
  %region_0_196_constant_65252 = load float, ptr %region_0_196_constant_65251, align 4
  %194 = getelementptr inbounds float, ptr %arg63, i32 %linear_index
  %195 = load float, ptr %194, align 4, !invariant.load !5
  %multiply.193 = fmul float %region_0_196_constant_65252, %195
  %region_0_196_constant_67253 = getelementptr inbounds float, ptr @2, i32 %linear_index
  %region_0_196_constant_67254 = load float, ptr %region_0_196_constant_67253, align 4
  %add.194 = fadd float %multiply.193, %region_0_196_constant_67254
  %196 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %193, float %add.194, 63
  %197 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 0
  %198 = getelementptr inbounds float, ptr %arg64, i32 %linear_index
  store float %197, ptr %198, align 4
  %199 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 1
  %200 = getelementptr inbounds float, ptr %arg65, i32 %linear_index
  store float %199, ptr %200, align 4
  %201 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 2
  %202 = getelementptr inbounds float, ptr %arg66, i32 %linear_index
  store float %201, ptr %202, align 4
  %203 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 3
  %204 = getelementptr inbounds float, ptr %arg67, i32 %linear_index
  store float %203, ptr %204, align 4
  %205 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 4
  %206 = getelementptr inbounds float, ptr %arg68, i32 %linear_index
  store float %205, ptr %206, align 4
  %207 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 5
  %208 = getelementptr inbounds float, ptr %arg69, i32 %linear_index
  store float %207, ptr %208, align 4
  %209 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 6
  %210 = getelementptr inbounds float, ptr %arg70, i32 %linear_index
  store float %209, ptr %210, align 4
  %211 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 7
  %212 = getelementptr inbounds float, ptr %arg71, i32 %linear_index
  store float %211, ptr %212, align 4
  %213 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 8
  %214 = getelementptr inbounds float, ptr %arg72, i32 %linear_index
  store float %213, ptr %214, align 4
  %215 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 9
  %216 = getelementptr inbounds float, ptr %arg73, i32 %linear_index
  store float %215, ptr %216, align 4
  %217 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 10
  %218 = getelementptr inbounds float, ptr %arg74, i32 %linear_index
  store float %217, ptr %218, align 4
  %219 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 11
  %220 = getelementptr inbounds float, ptr %arg75, i32 %linear_index
  store float %219, ptr %220, align 4
  %221 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 12
  %222 = getelementptr inbounds float, ptr %arg76, i32 %linear_index
  store float %221, ptr %222, align 4
  %223 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 13
  %224 = getelementptr inbounds float, ptr %arg77, i32 %linear_index
  store float %223, ptr %224, align 4
  %225 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 14
  %226 = getelementptr inbounds float, ptr %arg78, i32 %linear_index
  store float %225, ptr %226, align 4
  %227 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 15
  %228 = getelementptr inbounds float, ptr %arg79, i32 %linear_index
  store float %227, ptr %228, align 4
  %229 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 16
  %230 = getelementptr inbounds float, ptr %arg80, i32 %linear_index
  store float %229, ptr %230, align 4
  %231 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 17
  %232 = getelementptr inbounds float, ptr %arg81, i32 %linear_index
  store float %231, ptr %232, align 4
  %233 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 18
  %234 = getelementptr inbounds float, ptr %arg82, i32 %linear_index
  store float %233, ptr %234, align 4
  %235 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 19
  %236 = getelementptr inbounds float, ptr %arg83, i32 %linear_index
  store float %235, ptr %236, align 4
  %237 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 20
  %238 = getelementptr inbounds float, ptr %arg84, i32 %linear_index
  store float %237, ptr %238, align 4
  %239 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 21
  %240 = getelementptr inbounds float, ptr %arg85, i32 %linear_index
  store float %239, ptr %240, align 4
  %241 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 22
  %242 = getelementptr inbounds float, ptr %arg86, i32 %linear_index
  store float %241, ptr %242, align 4
  %243 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 23
  %244 = getelementptr inbounds float, ptr %arg87, i32 %linear_index
  store float %243, ptr %244, align 4
  %245 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 24
  %246 = getelementptr inbounds float, ptr %arg88, i32 %linear_index
  store float %245, ptr %246, align 4
  %247 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 25
  %248 = getelementptr inbounds float, ptr %arg89, i32 %linear_index
  store float %247, ptr %248, align 4
  %249 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 26
  %250 = getelementptr inbounds float, ptr %arg90, i32 %linear_index
  store float %249, ptr %250, align 4
  %251 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 27
  %252 = getelementptr inbounds float, ptr %arg91, i32 %linear_index
  store float %251, ptr %252, align 4
  %253 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 28
  %254 = getelementptr inbounds float, ptr %arg92, i32 %linear_index
  store float %253, ptr %254, align 4
  %255 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 29
  %256 = getelementptr inbounds float, ptr %arg93, i32 %linear_index
  store float %255, ptr %256, align 4
  %257 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 30
  %258 = getelementptr inbounds float, ptr %arg94, i32 %linear_index
  store float %257, ptr %258, align 4
  %259 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 31
  %260 = getelementptr inbounds float, ptr %arg95, i32 %linear_index
  store float %259, ptr %260, align 4
  %261 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 32
  %262 = getelementptr inbounds float, ptr %arg96, i32 %linear_index
  store float %261, ptr %262, align 4
  %263 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 33
  %264 = getelementptr inbounds float, ptr %arg97, i32 %linear_index
  store float %263, ptr %264, align 4
  %265 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 34
  %266 = getelementptr inbounds float, ptr %arg98, i32 %linear_index
  store float %265, ptr %266, align 4
  %267 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 35
  %268 = getelementptr inbounds float, ptr %arg99, i32 %linear_index
  store float %267, ptr %268, align 4
  %269 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 36
  %270 = getelementptr inbounds float, ptr %arg100, i32 %linear_index
  store float %269, ptr %270, align 4
  %271 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 37
  %272 = getelementptr inbounds float, ptr %arg101, i32 %linear_index
  store float %271, ptr %272, align 4
  %273 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 38
  %274 = getelementptr inbounds float, ptr %arg102, i32 %linear_index
  store float %273, ptr %274, align 4
  %275 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 39
  %276 = getelementptr inbounds float, ptr %arg103, i32 %linear_index
  store float %275, ptr %276, align 4
  %277 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 40
  %278 = getelementptr inbounds float, ptr %arg104, i32 %linear_index
  store float %277, ptr %278, align 4
  %279 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 41
  %280 = getelementptr inbounds float, ptr %arg105, i32 %linear_index
  store float %279, ptr %280, align 4
  %281 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 42
  %282 = getelementptr inbounds float, ptr %arg106, i32 %linear_index
  store float %281, ptr %282, align 4
  %283 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 43
  %284 = getelementptr inbounds float, ptr %arg107, i32 %linear_index
  store float %283, ptr %284, align 4
  %285 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 44
  %286 = getelementptr inbounds float, ptr %arg108, i32 %linear_index
  store float %285, ptr %286, align 4
  %287 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 45
  %288 = getelementptr inbounds float, ptr %arg109, i32 %linear_index
  store float %287, ptr %288, align 4
  %289 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 46
  %290 = getelementptr inbounds float, ptr %arg110, i32 %linear_index
  store float %289, ptr %290, align 4
  %291 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 47
  %292 = getelementptr inbounds float, ptr %arg111, i32 %linear_index
  store float %291, ptr %292, align 4
  %293 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 48
  %294 = getelementptr inbounds float, ptr %arg112, i32 %linear_index
  store float %293, ptr %294, align 4
  %295 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 49
  %296 = getelementptr inbounds float, ptr %arg113, i32 %linear_index
  store float %295, ptr %296, align 4
  %297 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 50
  %298 = getelementptr inbounds float, ptr %arg114, i32 %linear_index
  store float %297, ptr %298, align 4
  %299 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 51
  %300 = getelementptr inbounds float, ptr %arg115, i32 %linear_index
  store float %299, ptr %300, align 4
  %301 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 52
  %302 = getelementptr inbounds float, ptr %arg116, i32 %linear_index
  store float %301, ptr %302, align 4
  %303 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 53
  %304 = getelementptr inbounds float, ptr %arg117, i32 %linear_index
  store float %303, ptr %304, align 4
  %305 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 54
  %306 = getelementptr inbounds float, ptr %arg118, i32 %linear_index
  store float %305, ptr %306, align 4
  %307 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 55
  %308 = getelementptr inbounds float, ptr %arg119, i32 %linear_index
  store float %307, ptr %308, align 4
  %309 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 56
  %310 = getelementptr inbounds float, ptr %arg120, i32 %linear_index
  store float %309, ptr %310, align 4
  %311 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 57
  %312 = getelementptr inbounds float, ptr %arg121, i32 %linear_index
  store float %311, ptr %312, align 4
  %313 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 58
  %314 = getelementptr inbounds float, ptr %arg122, i32 %linear_index
  store float %313, ptr %314, align 4
  %315 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 59
  %316 = getelementptr inbounds float, ptr %arg123, i32 %linear_index
  store float %315, ptr %316, align 4
  %317 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 60
  %318 = getelementptr inbounds float, ptr %arg124, i32 %linear_index
  store float %317, ptr %318, align 4
  %319 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 61
  %320 = getelementptr inbounds float, ptr %arg125, i32 %linear_index
  store float %319, ptr %320, align 4
  %321 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 62
  %322 = getelementptr inbounds float, ptr %arg126, i32 %linear_index
  store float %321, ptr %322, align 4
  %323 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %196, 63
  %324 = getelementptr inbounds float, ptr %arg127, i32 %linear_index
  store float %323, ptr %324, align 4
  br label %fusion_97.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @fusion_96, !"kernel", i32 1}
!1 = !{ptr @fusion_96, !"reqntidx", i32 1}
!2 = !{ptr @fusion_97, !"kernel", i32 1}
!3 = !{ptr @fusion_97, !"reqntidx", i32 1}
!4 = !{i32 0, i32 1}
!5 = !{}
