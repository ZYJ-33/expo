target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c":\CD\93>"
@1 = private unnamed_addr constant [4 x i8] c":\CD\13\BE"

define void @fusion_23(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(32768) %arg3, ptr noalias align 16 dereferenceable(32768) %arg4, ptr noalias align 16 dereferenceable(32768) %arg5, ptr noalias align 16 dereferenceable(32768) %arg6, ptr noalias align 16 dereferenceable(32768) %arg7, ptr noalias align 16 dereferenceable(32768) %arg8, ptr noalias align 16 dereferenceable(32768) %arg9, ptr noalias align 16 dereferenceable(32768) %arg10, ptr noalias align 16 dereferenceable(32768) %arg11, ptr noalias align 16 dereferenceable(32768) %arg12, ptr noalias align 16 dereferenceable(32768) %arg13, ptr noalias align 16 dereferenceable(32768) %arg14, ptr noalias align 16 dereferenceable(32768) %arg15, ptr noalias align 16 dereferenceable(32768) %arg16, ptr noalias align 16 dereferenceable(32768) %arg17, ptr noalias align 16 dereferenceable(32768) %arg18, ptr noalias align 16 dereferenceable(32768) %arg19, ptr noalias align 16 dereferenceable(32768) %arg20, ptr noalias align 16 dereferenceable(32768) %arg21, ptr noalias align 16 dereferenceable(32768) %arg22, ptr noalias align 128 dereferenceable(32768) %arg23, ptr noalias align 128 dereferenceable(32768) %arg24, ptr noalias align 128 dereferenceable(32768) %arg25, ptr noalias align 128 dereferenceable(32768) %arg26, ptr noalias align 128 dereferenceable(32768) %arg27, ptr noalias align 128 dereferenceable(32768) %arg28, ptr noalias align 128 dereferenceable(32768) %arg29, ptr noalias align 128 dereferenceable(32768) %arg30, ptr noalias align 128 dereferenceable(32768) %arg31, ptr noalias align 128 dereferenceable(32768) %arg32, ptr noalias align 128 dereferenceable(32768) %arg33, ptr noalias align 128 dereferenceable(32768) %arg34, ptr noalias align 128 dereferenceable(32768) %arg35, ptr noalias align 128 dereferenceable(32768) %arg36, ptr noalias align 128 dereferenceable(32768) %arg37, ptr noalias align 128 dereferenceable(32768) %arg38, ptr noalias align 128 dereferenceable(32768) %arg39, ptr noalias align 128 dereferenceable(32768) %arg40, ptr noalias align 128 dereferenceable(32768) %arg41, ptr noalias align 128 dereferenceable(32768) %arg42, ptr noalias align 128 dereferenceable(32768) %arg43, ptr noalias align 128 dereferenceable(32768) %arg44, ptr noalias align 128 dereferenceable(32768) %arg45) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_23.in_bounds-true, label %fusion_23.in_bounds-after

fusion_23.in_bounds-after:                        ; preds = %fusion_23.in_bounds-true, %entry
  ret void

fusion_23.in_bounds-true:                         ; preds = %entry
  %region_0_75_constant_24 = load float, ptr @1, align 4
  %region_0_75_constant_26 = load float, ptr @0, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !4
  %multiply.28 = fmul float %region_0_75_constant_26, %8
  %add.29 = fadd float %region_0_75_constant_24, %multiply.28
  %9 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.29, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !4
  %multiply.30 = fmul float %region_0_75_constant_26, %11
  %add.31 = fadd float %region_0_75_constant_24, %multiply.30
  %12 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %9, float %add.31, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !4
  %multiply.32 = fmul float %region_0_75_constant_26, %14
  %add.33 = fadd float %region_0_75_constant_24, %multiply.32
  %15 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %12, float %add.33, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !4
  %multiply.34 = fmul float %region_0_75_constant_26, %17
  %add.35 = fadd float %region_0_75_constant_24, %multiply.34
  %18 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %15, float %add.35, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !4
  %multiply.36 = fmul float %region_0_75_constant_26, %20
  %add.37 = fadd float %region_0_75_constant_24, %multiply.36
  %21 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %18, float %add.37, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !4
  %multiply.38 = fmul float %region_0_75_constant_26, %23
  %add.39 = fadd float %region_0_75_constant_24, %multiply.38
  %24 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %21, float %add.39, 5
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !4
  %multiply.40 = fmul float %region_0_75_constant_26, %26
  %add.41 = fadd float %region_0_75_constant_24, %multiply.40
  %27 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %24, float %add.41, 6
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %29 = load float, ptr %28, align 4, !invariant.load !4
  %multiply.42 = fmul float %region_0_75_constant_26, %29
  %add.43 = fadd float %region_0_75_constant_24, %multiply.42
  %30 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %27, float %add.43, 7
  %31 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %32 = load float, ptr %31, align 4, !invariant.load !4
  %multiply.44 = fmul float %region_0_75_constant_26, %32
  %add.45 = fadd float %region_0_75_constant_24, %multiply.44
  %33 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %30, float %add.45, 8
  %34 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %35 = load float, ptr %34, align 4, !invariant.load !4
  %multiply.46 = fmul float %region_0_75_constant_26, %35
  %add.47 = fadd float %region_0_75_constant_24, %multiply.46
  %36 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %33, float %add.47, 9
  %37 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %38 = load float, ptr %37, align 4, !invariant.load !4
  %multiply.48 = fmul float %region_0_75_constant_26, %38
  %add.49 = fadd float %region_0_75_constant_24, %multiply.48
  %39 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %36, float %add.49, 10
  %40 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %41 = load float, ptr %40, align 4, !invariant.load !4
  %multiply.50 = fmul float %region_0_75_constant_26, %41
  %add.51 = fadd float %region_0_75_constant_24, %multiply.50
  %42 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %39, float %add.51, 11
  %43 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %44 = load float, ptr %43, align 4, !invariant.load !4
  %multiply.52 = fmul float %44, %region_0_75_constant_26
  %add.53 = fadd float %region_0_75_constant_24, %multiply.52
  %45 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %42, float %add.53, 12
  %46 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  %47 = load float, ptr %46, align 4, !invariant.load !4
  %multiply.54 = fmul float %region_0_75_constant_26, %47
  %add.55 = fadd float %region_0_75_constant_24, %multiply.54
  %48 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %45, float %add.55, 13
  %49 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  %50 = load float, ptr %49, align 4, !invariant.load !4
  %multiply.56 = fmul float %region_0_75_constant_26, %50
  %add.57 = fadd float %region_0_75_constant_24, %multiply.56
  %51 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, float %add.57, 14
  %52 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  %53 = load float, ptr %52, align 4, !invariant.load !4
  %multiply.58 = fmul float %region_0_75_constant_26, %53
  %add.59 = fadd float %region_0_75_constant_24, %multiply.58
  %54 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %51, float %add.59, 15
  %55 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  %56 = load float, ptr %55, align 4, !invariant.load !4
  %multiply.60 = fmul float %region_0_75_constant_26, %56
  %add.61 = fadd float %region_0_75_constant_24, %multiply.60
  %57 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %54, float %add.61, 16
  %58 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  %59 = load float, ptr %58, align 4, !invariant.load !4
  %multiply.62 = fmul float %region_0_75_constant_26, %59
  %add.63 = fadd float %region_0_75_constant_24, %multiply.62
  %60 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %57, float %add.63, 17
  %61 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  %62 = load float, ptr %61, align 4, !invariant.load !4
  %multiply.64 = fmul float %region_0_75_constant_26, %62
  %add.65 = fadd float %region_0_75_constant_24, %multiply.64
  %63 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %60, float %add.65, 18
  %64 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  %65 = load float, ptr %64, align 4, !invariant.load !4
  %multiply.66 = fmul float %region_0_75_constant_26, %65
  %add.67 = fadd float %region_0_75_constant_24, %multiply.66
  %66 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %63, float %add.67, 19
  %67 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  %68 = load float, ptr %67, align 4, !invariant.load !4
  %multiply.68 = fmul float %region_0_75_constant_26, %68
  %add.69 = fadd float %region_0_75_constant_24, %multiply.68
  %69 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %66, float %add.69, 20
  %70 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  %71 = load float, ptr %70, align 4, !invariant.load !4
  %multiply.70 = fmul float %region_0_75_constant_26, %71
  %add.71 = fadd float %region_0_75_constant_24, %multiply.70
  %72 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %69, float %add.71, 21
  %73 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  %74 = load float, ptr %73, align 4, !invariant.load !4
  %multiply.72 = fmul float %region_0_75_constant_26, %74
  %add.73 = fadd float %region_0_75_constant_24, %multiply.72
  %75 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %72, float %add.73, 22
  %76 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 0
  %77 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  store float %76, ptr %77, align 4
  %78 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 1
  %79 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  store float %78, ptr %79, align 4
  %80 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 2
  %81 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  store float %80, ptr %81, align 4
  %82 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 3
  %83 = getelementptr inbounds float, ptr %arg26, i32 %linear_index
  store float %82, ptr %83, align 4
  %84 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 4
  %85 = getelementptr inbounds float, ptr %arg27, i32 %linear_index
  store float %84, ptr %85, align 4
  %86 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 5
  %87 = getelementptr inbounds float, ptr %arg28, i32 %linear_index
  store float %86, ptr %87, align 4
  %88 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 6
  %89 = getelementptr inbounds float, ptr %arg29, i32 %linear_index
  store float %88, ptr %89, align 4
  %90 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 7
  %91 = getelementptr inbounds float, ptr %arg30, i32 %linear_index
  store float %90, ptr %91, align 4
  %92 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 8
  %93 = getelementptr inbounds float, ptr %arg31, i32 %linear_index
  store float %92, ptr %93, align 4
  %94 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 9
  %95 = getelementptr inbounds float, ptr %arg32, i32 %linear_index
  store float %94, ptr %95, align 4
  %96 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 10
  %97 = getelementptr inbounds float, ptr %arg33, i32 %linear_index
  store float %96, ptr %97, align 4
  %98 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 11
  %99 = getelementptr inbounds float, ptr %arg34, i32 %linear_index
  store float %98, ptr %99, align 4
  %100 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 12
  %101 = getelementptr inbounds float, ptr %arg35, i32 %linear_index
  store float %100, ptr %101, align 4
  %102 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 13
  %103 = getelementptr inbounds float, ptr %arg36, i32 %linear_index
  store float %102, ptr %103, align 4
  %104 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 14
  %105 = getelementptr inbounds float, ptr %arg37, i32 %linear_index
  store float %104, ptr %105, align 4
  %106 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 15
  %107 = getelementptr inbounds float, ptr %arg38, i32 %linear_index
  store float %106, ptr %107, align 4
  %108 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 16
  %109 = getelementptr inbounds float, ptr %arg39, i32 %linear_index
  store float %108, ptr %109, align 4
  %110 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 17
  %111 = getelementptr inbounds float, ptr %arg40, i32 %linear_index
  store float %110, ptr %111, align 4
  %112 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 18
  %113 = getelementptr inbounds float, ptr %arg41, i32 %linear_index
  store float %112, ptr %113, align 4
  %114 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 19
  %115 = getelementptr inbounds float, ptr %arg42, i32 %linear_index
  store float %114, ptr %115, align 4
  %116 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 20
  %117 = getelementptr inbounds float, ptr %arg43, i32 %linear_index
  store float %116, ptr %117, align 4
  %118 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 21
  %119 = getelementptr inbounds float, ptr %arg44, i32 %linear_index
  store float %118, ptr %119, align 4
  %120 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, 22
  %121 = getelementptr inbounds float, ptr %arg45, i32 %linear_index
  store float %120, ptr %121, align 4
  br label %fusion_23.in_bounds-after
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

!0 = !{ptr @fusion_23, !"kernel", i32 1}
!1 = !{ptr @fusion_23, !"reqntidx", i32 1024}
!2 = !{i32 0, i32 8}
!3 = !{i32 0, i32 1024}
!4 = !{}
