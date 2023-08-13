target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] c"n\D7\DC>"
@1 = private unnamed_addr constant [4 x i8] c"n\D7\\\BE"
@2 = private unnamed_addr constant [4 x i8] c"n\D7\DC>"
@3 = private unnamed_addr constant [4 x i8] c"n\D7\\\BE"
@4 = private unnamed_addr constant [4 x i8] c"n\D7\DC>"
@5 = private unnamed_addr constant [4 x i8] c"n\D7\\\BE"

define void @fusion_80(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 16 dereferenceable(512) %arg1, ptr noalias align 16 dereferenceable(512) %arg2, ptr noalias align 16 dereferenceable(512) %arg3, ptr noalias align 16 dereferenceable(512) %arg4, ptr noalias align 16 dereferenceable(512) %arg5, ptr noalias align 16 dereferenceable(512) %arg6, ptr noalias align 16 dereferenceable(512) %arg7, ptr noalias align 16 dereferenceable(512) %arg8, ptr noalias align 16 dereferenceable(512) %arg9, ptr noalias align 16 dereferenceable(512) %arg10, ptr noalias align 16 dereferenceable(512) %arg11, ptr noalias align 16 dereferenceable(512) %arg12, ptr noalias align 16 dereferenceable(512) %arg13, ptr noalias align 128 dereferenceable(512) %arg14, ptr noalias align 128 dereferenceable(512) %arg15, ptr noalias align 128 dereferenceable(512) %arg16, ptr noalias align 128 dereferenceable(512) %arg17, ptr noalias align 128 dereferenceable(512) %arg18, ptr noalias align 128 dereferenceable(512) %arg19, ptr noalias align 128 dereferenceable(512) %arg20, ptr noalias align 128 dereferenceable(512) %arg21, ptr noalias align 128 dereferenceable(512) %arg22, ptr noalias align 128 dereferenceable(512) %arg23, ptr noalias align 128 dereferenceable(512) %arg24, ptr noalias align 128 dereferenceable(512) %arg25, ptr noalias align 128 dereferenceable(512) %arg26, ptr noalias align 128 dereferenceable(512) %arg27) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 128
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index, 1
  %6 = icmp ult i32 %linear_index, 128
  br i1 %6, label %fusion_80.in_bounds-true, label %fusion_80.in_bounds-after

fusion_80.in_bounds-after:                        ; preds = %fusion_80.in_bounds-true, %entry
  ret void

fusion_80.in_bounds-true:                         ; preds = %entry
  %region_0_48_constant_15 = load float, ptr @1, align 4
  %region_0_48_constant_17 = load float, ptr @0, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !6
  %multiply.19 = fmul float %region_0_48_constant_17, %8
  %add.20 = fadd float %region_0_48_constant_15, %multiply.19
  %9 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.20, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !6
  %multiply.21 = fmul float %region_0_48_constant_17, %11
  %add.22 = fadd float %region_0_48_constant_15, %multiply.21
  %12 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %9, float %add.22, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !6
  %multiply.23 = fmul float %region_0_48_constant_17, %14
  %add.24 = fadd float %region_0_48_constant_15, %multiply.23
  %15 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %12, float %add.24, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !6
  %multiply.25 = fmul float %region_0_48_constant_17, %17
  %add.26 = fadd float %region_0_48_constant_15, %multiply.25
  %18 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %15, float %add.26, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !6
  %multiply.27 = fmul float %region_0_48_constant_17, %20
  %add.28 = fadd float %region_0_48_constant_15, %multiply.27
  %21 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %18, float %add.28, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !6
  %multiply.29 = fmul float %23, %region_0_48_constant_17
  %add.30 = fadd float %region_0_48_constant_15, %multiply.29
  %24 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %21, float %add.30, 5
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !6
  %multiply.31 = fmul float %region_0_48_constant_17, %26
  %add.32 = fadd float %region_0_48_constant_15, %multiply.31
  %27 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %24, float %add.32, 6
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %29 = load float, ptr %28, align 4, !invariant.load !6
  %multiply.33 = fmul float %region_0_48_constant_17, %29
  %add.34 = fadd float %region_0_48_constant_15, %multiply.33
  %30 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %27, float %add.34, 7
  %31 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %32 = load float, ptr %31, align 4, !invariant.load !6
  %multiply.35 = fmul float %region_0_48_constant_17, %32
  %add.36 = fadd float %region_0_48_constant_15, %multiply.35
  %33 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %30, float %add.36, 8
  %34 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %35 = load float, ptr %34, align 4, !invariant.load !6
  %multiply.37 = fmul float %region_0_48_constant_17, %35
  %add.38 = fadd float %region_0_48_constant_15, %multiply.37
  %36 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %33, float %add.38, 9
  %37 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %38 = load float, ptr %37, align 4, !invariant.load !6
  %multiply.39 = fmul float %region_0_48_constant_17, %38
  %add.40 = fadd float %region_0_48_constant_15, %multiply.39
  %39 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %36, float %add.40, 10
  %40 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %41 = load float, ptr %40, align 4, !invariant.load !6
  %multiply.41 = fmul float %region_0_48_constant_17, %41
  %add.42 = fadd float %region_0_48_constant_15, %multiply.41
  %42 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %39, float %add.42, 11
  %43 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %44 = load float, ptr %43, align 4, !invariant.load !6
  %multiply.43 = fmul float %region_0_48_constant_17, %44
  %add.44 = fadd float %region_0_48_constant_15, %multiply.43
  %45 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %42, float %add.44, 12
  %46 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  %47 = load float, ptr %46, align 4, !invariant.load !6
  %multiply.45 = fmul float %region_0_48_constant_17, %47
  %add.46 = fadd float %region_0_48_constant_15, %multiply.45
  %48 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %45, float %add.46, 13
  %49 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  store float %49, ptr %50, align 4
  %51 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  store float %51, ptr %52, align 4
  %53 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  store float %53, ptr %54, align 4
  %55 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  store float %55, ptr %56, align 4
  %57 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  store float %57, ptr %58, align 4
  %59 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  store float %59, ptr %60, align 4
  %61 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  store float %61, ptr %62, align 4
  %63 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  store float %63, ptr %64, align 4
  %65 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 8
  %66 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  store float %65, ptr %66, align 4
  %67 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 9
  %68 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  store float %67, ptr %68, align 4
  %69 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 10
  %70 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  store float %69, ptr %70, align 4
  %71 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 11
  %72 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  store float %71, ptr %72, align 4
  %73 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 12
  %74 = getelementptr inbounds float, ptr %arg26, i32 %linear_index
  store float %73, ptr %74, align 4
  %75 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, 13
  %76 = getelementptr inbounds float, ptr %arg27, i32 %linear_index
  store float %75, ptr %76, align 4
  br label %fusion_80.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @copy_fusion(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 16 dereferenceable(512) %arg1, ptr noalias align 16 dereferenceable(512) %arg2, ptr noalias align 16 dereferenceable(512) %arg3, ptr noalias align 16 dereferenceable(512) %arg4, ptr noalias align 16 dereferenceable(512) %arg5, ptr noalias align 16 dereferenceable(512) %arg6, ptr noalias align 16 dereferenceable(512) %arg7, ptr noalias align 16 dereferenceable(512) %arg8, ptr noalias align 16 dereferenceable(512) %arg9, ptr noalias align 16 dereferenceable(512) %arg10, ptr noalias align 16 dereferenceable(512) %arg11, ptr noalias align 16 dereferenceable(512) %arg12, ptr noalias align 16 dereferenceable(512) %arg13, ptr noalias align 16 dereferenceable(512) %arg14, ptr noalias align 16 dereferenceable(512) %arg15, ptr noalias align 16 dereferenceable(512) %arg16, ptr noalias align 16 dereferenceable(512) %arg17, ptr noalias align 16 dereferenceable(512) %arg18, ptr noalias align 16 dereferenceable(512) %arg19, ptr noalias align 16 dereferenceable(512) %arg20, ptr noalias align 16 dereferenceable(512) %arg21, ptr noalias align 16 dereferenceable(512) %arg22, ptr noalias align 16 dereferenceable(512) %arg23, ptr noalias align 16 dereferenceable(512) %arg24, ptr noalias align 16 dereferenceable(512) %arg25, ptr noalias align 16 dereferenceable(512) %arg26, ptr noalias align 16 dereferenceable(512) %arg27, ptr noalias align 16 dereferenceable(512) %arg28, ptr noalias align 16 dereferenceable(512) %arg29, ptr noalias align 16 dereferenceable(512) %arg30, ptr noalias align 16 dereferenceable(512) %arg31, ptr noalias align 16 dereferenceable(512) %arg32, ptr noalias align 16 dereferenceable(512) %arg33, ptr noalias align 16 dereferenceable(512) %arg34, ptr noalias align 16 dereferenceable(512) %arg35, ptr noalias align 16 dereferenceable(512) %arg36, ptr noalias align 16 dereferenceable(512) %arg37, ptr noalias align 16 dereferenceable(512) %arg38, ptr noalias align 16 dereferenceable(512) %arg39, ptr noalias align 16 dereferenceable(512) %arg40, ptr noalias align 16 dereferenceable(512) %arg41, ptr noalias align 16 dereferenceable(512) %arg42, ptr noalias align 16 dereferenceable(512) %arg43, ptr noalias align 16 dereferenceable(512) %arg44, ptr noalias align 16 dereferenceable(512) %arg45, ptr noalias align 16 dereferenceable(512) %arg46, ptr noalias align 16 dereferenceable(512) %arg47, ptr noalias align 16 dereferenceable(512) %arg48, ptr noalias align 16 dereferenceable(512) %arg49, ptr noalias align 16 dereferenceable(512) %arg50, ptr noalias align 16 dereferenceable(512) %arg51, ptr noalias align 16 dereferenceable(512) %arg52, ptr noalias align 16 dereferenceable(512) %arg53, ptr noalias align 16 dereferenceable(512) %arg54, ptr noalias align 16 dereferenceable(512) %arg55, ptr noalias align 16 dereferenceable(512) %arg56, ptr noalias align 16 dereferenceable(512) %arg57, ptr noalias align 16 dereferenceable(512) %arg58, ptr noalias align 16 dereferenceable(512) %arg59, ptr noalias align 16 dereferenceable(512) %arg60, ptr noalias align 16 dereferenceable(512) %arg61, ptr noalias align 16 dereferenceable(512) %arg62, ptr noalias align 16 dereferenceable(512) %arg63, ptr noalias align 128 dereferenceable(512) %arg64, ptr noalias align 128 dereferenceable(512) %arg65, ptr noalias align 128 dereferenceable(512) %arg66, ptr noalias align 128 dereferenceable(512) %arg67, ptr noalias align 128 dereferenceable(512) %arg68, ptr noalias align 128 dereferenceable(512) %arg69, ptr noalias align 128 dereferenceable(512) %arg70, ptr noalias align 128 dereferenceable(512) %arg71, ptr noalias align 128 dereferenceable(512) %arg72, ptr noalias align 128 dereferenceable(512) %arg73, ptr noalias align 128 dereferenceable(512) %arg74, ptr noalias align 128 dereferenceable(512) %arg75, ptr noalias align 128 dereferenceable(512) %arg76, ptr noalias align 128 dereferenceable(512) %arg77, ptr noalias align 128 dereferenceable(512) %arg78, ptr noalias align 128 dereferenceable(512) %arg79, ptr noalias align 128 dereferenceable(512) %arg80, ptr noalias align 128 dereferenceable(512) %arg81, ptr noalias align 128 dereferenceable(512) %arg82, ptr noalias align 128 dereferenceable(512) %arg83, ptr noalias align 128 dereferenceable(512) %arg84, ptr noalias align 128 dereferenceable(512) %arg85, ptr noalias align 128 dereferenceable(512) %arg86, ptr noalias align 128 dereferenceable(512) %arg87, ptr noalias align 128 dereferenceable(512) %arg88, ptr noalias align 128 dereferenceable(512) %arg89, ptr noalias align 128 dereferenceable(512) %arg90, ptr noalias align 128 dereferenceable(512) %arg91, ptr noalias align 128 dereferenceable(512) %arg92, ptr noalias align 128 dereferenceable(512) %arg93, ptr noalias align 128 dereferenceable(512) %arg94, ptr noalias align 128 dereferenceable(512) %arg95, ptr noalias align 128 dereferenceable(512) %arg96, ptr noalias align 128 dereferenceable(512) %arg97, ptr noalias align 128 dereferenceable(512) %arg98, ptr noalias align 128 dereferenceable(512) %arg99, ptr noalias align 128 dereferenceable(512) %arg100, ptr noalias align 128 dereferenceable(512) %arg101, ptr noalias align 128 dereferenceable(512) %arg102, ptr noalias align 128 dereferenceable(512) %arg103, ptr noalias align 128 dereferenceable(512) %arg104, ptr noalias align 128 dereferenceable(512) %arg105, ptr noalias align 128 dereferenceable(512) %arg106, ptr noalias align 128 dereferenceable(512) %arg107, ptr noalias align 128 dereferenceable(512) %arg108, ptr noalias align 128 dereferenceable(512) %arg109, ptr noalias align 128 dereferenceable(512) %arg110, ptr noalias align 128 dereferenceable(512) %arg111, ptr noalias align 128 dereferenceable(512) %arg112, ptr noalias align 128 dereferenceable(512) %arg113, ptr noalias align 128 dereferenceable(512) %arg114, ptr noalias align 128 dereferenceable(512) %arg115, ptr noalias align 128 dereferenceable(512) %arg116, ptr noalias align 128 dereferenceable(512) %arg117, ptr noalias align 128 dereferenceable(512) %arg118, ptr noalias align 128 dereferenceable(512) %arg119, ptr noalias align 128 dereferenceable(512) %arg120, ptr noalias align 128 dereferenceable(512) %arg121, ptr noalias align 128 dereferenceable(512) %arg122, ptr noalias align 128 dereferenceable(512) %arg123, ptr noalias align 128 dereferenceable(512) %arg124, ptr noalias align 128 dereferenceable(512) %arg125, ptr noalias align 128 dereferenceable(512) %arg126, ptr noalias align 128 dereferenceable(512) %arg127) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !5
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 128
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index, 1
  %6 = icmp ult i32 %linear_index, 128
  br i1 %6, label %copy_fusion.in_bounds-true, label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %copy_fusion.in_bounds-true, %entry
  ret void

copy_fusion.in_bounds-true:                       ; preds = %entry
  %region_0_202_constant_65 = load float, ptr @5, align 4
  %region_0_202_constant_67 = load float, ptr @4, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !6
  %multiply.69 = fmul float %region_0_202_constant_67, %8
  %add.70 = fadd float %region_0_202_constant_65, %multiply.69
  %9 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } undef, float %add.70, 0
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4, !invariant.load !6
  %multiply.71 = fmul float %region_0_202_constant_67, %11
  %add.72 = fadd float %region_0_202_constant_65, %multiply.71
  %12 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %9, float %add.72, 1
  %13 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !6
  %multiply.73 = fmul float %region_0_202_constant_67, %14
  %add.74 = fadd float %region_0_202_constant_65, %multiply.73
  %15 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %12, float %add.74, 2
  %16 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !6
  %multiply.75 = fmul float %region_0_202_constant_67, %17
  %add.76 = fadd float %region_0_202_constant_65, %multiply.75
  %18 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %15, float %add.76, 3
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %20 = load float, ptr %19, align 4, !invariant.load !6
  %multiply.77 = fmul float %region_0_202_constant_67, %20
  %add.78 = fadd float %region_0_202_constant_65, %multiply.77
  %21 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %18, float %add.78, 4
  %22 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %23 = load float, ptr %22, align 4, !invariant.load !6
  %multiply.79 = fmul float %region_0_202_constant_67, %23
  %add.80 = fadd float %region_0_202_constant_65, %multiply.79
  %24 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %21, float %add.80, 5
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !6
  %multiply.81 = fmul float %region_0_202_constant_67, %26
  %add.82 = fadd float %region_0_202_constant_65, %multiply.81
  %27 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %24, float %add.82, 6
  %28 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %29 = load float, ptr %28, align 4, !invariant.load !6
  %multiply.83 = fmul float %region_0_202_constant_67, %29
  %add.84 = fadd float %region_0_202_constant_65, %multiply.83
  %30 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %27, float %add.84, 7
  %31 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %32 = load float, ptr %31, align 4, !invariant.load !6
  %multiply.85 = fmul float %region_0_202_constant_67, %32
  %add.86 = fadd float %region_0_202_constant_65, %multiply.85
  %33 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %30, float %add.86, 8
  %34 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %35 = load float, ptr %34, align 4, !invariant.load !6
  %multiply.87 = fmul float %region_0_202_constant_67, %35
  %add.88 = fadd float %region_0_202_constant_65, %multiply.87
  %36 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %33, float %add.88, 9
  %37 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %38 = load float, ptr %37, align 4, !invariant.load !6
  %multiply.89 = fmul float %region_0_202_constant_67, %38
  %add.90 = fadd float %region_0_202_constant_65, %multiply.89
  %39 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %36, float %add.90, 10
  %40 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  %41 = load float, ptr %40, align 4, !invariant.load !6
  %multiply.91 = fmul float %region_0_202_constant_67, %41
  %add.92 = fadd float %region_0_202_constant_65, %multiply.91
  %42 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %39, float %add.92, 11
  %43 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  %44 = load float, ptr %43, align 4, !invariant.load !6
  %multiply.93 = fmul float %region_0_202_constant_67, %44
  %add.94 = fadd float %region_0_202_constant_65, %multiply.93
  %45 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %42, float %add.94, 12
  %46 = getelementptr inbounds float, ptr %arg13, i32 %linear_index
  %47 = load float, ptr %46, align 4, !invariant.load !6
  %multiply.95 = fmul float %region_0_202_constant_67, %47
  %add.96 = fadd float %region_0_202_constant_65, %multiply.95
  %48 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %45, float %add.96, 13
  %49 = getelementptr inbounds float, ptr %arg14, i32 %linear_index
  %50 = load float, ptr %49, align 4, !invariant.load !6
  %multiply.97 = fmul float %region_0_202_constant_67, %50
  %add.98 = fadd float %region_0_202_constant_65, %multiply.97
  %51 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %48, float %add.98, 14
  %52 = getelementptr inbounds float, ptr %arg15, i32 %linear_index
  %53 = load float, ptr %52, align 4, !invariant.load !6
  %multiply.99 = fmul float %region_0_202_constant_67, %53
  %add.100 = fadd float %region_0_202_constant_65, %multiply.99
  %54 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %51, float %add.100, 15
  %55 = getelementptr inbounds float, ptr %arg16, i32 %linear_index
  %56 = load float, ptr %55, align 4, !invariant.load !6
  %multiply.101 = fmul float %region_0_202_constant_67, %56
  %add.102 = fadd float %region_0_202_constant_65, %multiply.101
  %57 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %54, float %add.102, 16
  %58 = getelementptr inbounds float, ptr %arg17, i32 %linear_index
  %59 = load float, ptr %58, align 4, !invariant.load !6
  %multiply.103 = fmul float %region_0_202_constant_67, %59
  %add.104 = fadd float %region_0_202_constant_65, %multiply.103
  %60 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %57, float %add.104, 17
  %61 = getelementptr inbounds float, ptr %arg18, i32 %linear_index
  %62 = load float, ptr %61, align 4, !invariant.load !6
  %multiply.105 = fmul float %region_0_202_constant_67, %62
  %add.106 = fadd float %region_0_202_constant_65, %multiply.105
  %63 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %60, float %add.106, 18
  %64 = getelementptr inbounds float, ptr %arg19, i32 %linear_index
  %65 = load float, ptr %64, align 4, !invariant.load !6
  %multiply.107 = fmul float %region_0_202_constant_67, %65
  %add.108 = fadd float %region_0_202_constant_65, %multiply.107
  %66 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %63, float %add.108, 19
  %67 = getelementptr inbounds float, ptr %arg20, i32 %linear_index
  %68 = load float, ptr %67, align 4, !invariant.load !6
  %multiply.109 = fmul float %region_0_202_constant_67, %68
  %add.110 = fadd float %region_0_202_constant_65, %multiply.109
  %69 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %66, float %add.110, 20
  %70 = getelementptr inbounds float, ptr %arg21, i32 %linear_index
  %71 = load float, ptr %70, align 4, !invariant.load !6
  %multiply.111 = fmul float %region_0_202_constant_67, %71
  %add.112 = fadd float %region_0_202_constant_65, %multiply.111
  %72 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %69, float %add.112, 21
  %73 = getelementptr inbounds float, ptr %arg22, i32 %linear_index
  %74 = load float, ptr %73, align 4, !invariant.load !6
  %multiply.113 = fmul float %region_0_202_constant_67, %74
  %add.114 = fadd float %region_0_202_constant_65, %multiply.113
  %75 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %72, float %add.114, 22
  %76 = getelementptr inbounds float, ptr %arg23, i32 %linear_index
  %77 = load float, ptr %76, align 4, !invariant.load !6
  %multiply.115 = fmul float %region_0_202_constant_67, %77
  %add.116 = fadd float %region_0_202_constant_65, %multiply.115
  %78 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %75, float %add.116, 23
  %79 = getelementptr inbounds float, ptr %arg24, i32 %linear_index
  %80 = load float, ptr %79, align 4, !invariant.load !6
  %multiply.117 = fmul float %region_0_202_constant_67, %80
  %add.118 = fadd float %region_0_202_constant_65, %multiply.117
  %81 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %78, float %add.118, 24
  %82 = getelementptr inbounds float, ptr %arg25, i32 %linear_index
  %83 = load float, ptr %82, align 4, !invariant.load !6
  %multiply.119 = fmul float %region_0_202_constant_67, %83
  %add.120 = fadd float %region_0_202_constant_65, %multiply.119
  %84 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %81, float %add.120, 25
  %85 = getelementptr inbounds float, ptr %arg26, i32 %linear_index
  %86 = load float, ptr %85, align 4, !invariant.load !6
  %multiply.121 = fmul float %region_0_202_constant_67, %86
  %add.122 = fadd float %region_0_202_constant_65, %multiply.121
  %87 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %84, float %add.122, 26
  %88 = getelementptr inbounds float, ptr %arg27, i32 %linear_index
  %89 = load float, ptr %88, align 4, !invariant.load !6
  %multiply.123 = fmul float %region_0_202_constant_67, %89
  %add.124 = fadd float %region_0_202_constant_65, %multiply.123
  %90 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %87, float %add.124, 27
  %91 = getelementptr inbounds float, ptr %arg28, i32 %linear_index
  %92 = load float, ptr %91, align 4, !invariant.load !6
  %multiply.125 = fmul float %region_0_202_constant_67, %92
  %add.126 = fadd float %region_0_202_constant_65, %multiply.125
  %93 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %90, float %add.126, 28
  %94 = getelementptr inbounds float, ptr %arg29, i32 %linear_index
  %95 = load float, ptr %94, align 4, !invariant.load !6
  %multiply.127 = fmul float %region_0_202_constant_67, %95
  %add.128 = fadd float %region_0_202_constant_65, %multiply.127
  %96 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %93, float %add.128, 29
  %97 = getelementptr inbounds float, ptr %arg30, i32 %linear_index
  %98 = load float, ptr %97, align 4, !invariant.load !6
  %multiply.129 = fmul float %region_0_202_constant_67, %98
  %add.130 = fadd float %region_0_202_constant_65, %multiply.129
  %99 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %96, float %add.130, 30
  %100 = getelementptr inbounds float, ptr %arg31, i32 %linear_index
  %101 = load float, ptr %100, align 4, !invariant.load !6
  %multiply.131 = fmul float %region_0_202_constant_67, %101
  %add.132 = fadd float %region_0_202_constant_65, %multiply.131
  %102 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %99, float %add.132, 31
  %region_0_202_constant_133 = load float, ptr @3, align 4
  %region_0_202_constant_135 = load float, ptr @2, align 4
  %103 = getelementptr inbounds float, ptr %arg32, i32 %linear_index
  %104 = load float, ptr %103, align 4, !invariant.load !6
  %multiply.137 = fmul float %region_0_202_constant_135, %104
  %add.138 = fadd float %region_0_202_constant_133, %multiply.137
  %105 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %102, float %add.138, 32
  %106 = getelementptr inbounds float, ptr %arg33, i32 %linear_index
  %107 = load float, ptr %106, align 4, !invariant.load !6
  %multiply.139 = fmul float %region_0_202_constant_135, %107
  %add.140 = fadd float %region_0_202_constant_133, %multiply.139
  %108 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %105, float %add.140, 33
  %109 = getelementptr inbounds float, ptr %arg34, i32 %linear_index
  %110 = load float, ptr %109, align 4, !invariant.load !6
  %multiply.141 = fmul float %region_0_202_constant_135, %110
  %add.142 = fadd float %region_0_202_constant_133, %multiply.141
  %111 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %108, float %add.142, 34
  %112 = getelementptr inbounds float, ptr %arg35, i32 %linear_index
  %113 = load float, ptr %112, align 4, !invariant.load !6
  %multiply.143 = fmul float %region_0_202_constant_135, %113
  %add.144 = fadd float %region_0_202_constant_133, %multiply.143
  %114 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %111, float %add.144, 35
  %115 = getelementptr inbounds float, ptr %arg36, i32 %linear_index
  %116 = load float, ptr %115, align 4, !invariant.load !6
  %multiply.145 = fmul float %region_0_202_constant_135, %116
  %add.146 = fadd float %region_0_202_constant_133, %multiply.145
  %117 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %114, float %add.146, 36
  %118 = getelementptr inbounds float, ptr %arg37, i32 %linear_index
  %119 = load float, ptr %118, align 4, !invariant.load !6
  %multiply.147 = fmul float %region_0_202_constant_135, %119
  %add.148 = fadd float %region_0_202_constant_133, %multiply.147
  %120 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %117, float %add.148, 37
  %121 = getelementptr inbounds float, ptr %arg38, i32 %linear_index
  %122 = load float, ptr %121, align 4, !invariant.load !6
  %multiply.149 = fmul float %region_0_202_constant_135, %122
  %add.150 = fadd float %region_0_202_constant_133, %multiply.149
  %123 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %120, float %add.150, 38
  %124 = getelementptr inbounds float, ptr %arg39, i32 %linear_index
  %125 = load float, ptr %124, align 4, !invariant.load !6
  %multiply.151 = fmul float %region_0_202_constant_135, %125
  %add.152 = fadd float %region_0_202_constant_133, %multiply.151
  %126 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %123, float %add.152, 39
  %127 = getelementptr inbounds float, ptr %arg40, i32 %linear_index
  %128 = load float, ptr %127, align 4, !invariant.load !6
  %multiply.153 = fmul float %region_0_202_constant_135, %128
  %add.154 = fadd float %region_0_202_constant_133, %multiply.153
  %129 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %126, float %add.154, 40
  %130 = getelementptr inbounds float, ptr %arg41, i32 %linear_index
  %131 = load float, ptr %130, align 4, !invariant.load !6
  %multiply.155 = fmul float %region_0_202_constant_135, %131
  %add.156 = fadd float %region_0_202_constant_133, %multiply.155
  %132 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %129, float %add.156, 41
  %133 = getelementptr inbounds float, ptr %arg42, i32 %linear_index
  %134 = load float, ptr %133, align 4, !invariant.load !6
  %multiply.157 = fmul float %region_0_202_constant_135, %134
  %add.158 = fadd float %region_0_202_constant_133, %multiply.157
  %135 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %132, float %add.158, 42
  %136 = getelementptr inbounds float, ptr %arg43, i32 %linear_index
  %137 = load float, ptr %136, align 4, !invariant.load !6
  %multiply.159 = fmul float %region_0_202_constant_135, %137
  %add.160 = fadd float %region_0_202_constant_133, %multiply.159
  %138 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %135, float %add.160, 43
  %139 = getelementptr inbounds float, ptr %arg44, i32 %linear_index
  %140 = load float, ptr %139, align 4, !invariant.load !6
  %multiply.161 = fmul float %region_0_202_constant_135, %140
  %add.162 = fadd float %region_0_202_constant_133, %multiply.161
  %141 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %138, float %add.162, 44
  %142 = getelementptr inbounds float, ptr %arg45, i32 %linear_index
  %143 = load float, ptr %142, align 4, !invariant.load !6
  %multiply.163 = fmul float %region_0_202_constant_135, %143
  %add.164 = fadd float %region_0_202_constant_133, %multiply.163
  %144 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %141, float %add.164, 45
  %145 = getelementptr inbounds float, ptr %arg46, i32 %linear_index
  %146 = load float, ptr %145, align 4, !invariant.load !6
  %multiply.165 = fmul float %region_0_202_constant_135, %146
  %add.166 = fadd float %region_0_202_constant_133, %multiply.165
  %147 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %144, float %add.166, 46
  %148 = getelementptr inbounds float, ptr %arg47, i32 %linear_index
  %149 = load float, ptr %148, align 4, !invariant.load !6
  %multiply.167 = fmul float %region_0_202_constant_135, %149
  %add.168 = fadd float %region_0_202_constant_133, %multiply.167
  %150 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %147, float %add.168, 47
  %151 = getelementptr inbounds float, ptr %arg48, i32 %linear_index
  %152 = load float, ptr %151, align 4, !invariant.load !6
  %multiply.169 = fmul float %region_0_202_constant_135, %152
  %add.170 = fadd float %region_0_202_constant_133, %multiply.169
  %153 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %150, float %add.170, 48
  %154 = getelementptr inbounds float, ptr %arg49, i32 %linear_index
  %155 = load float, ptr %154, align 4, !invariant.load !6
  %multiply.171 = fmul float %region_0_202_constant_135, %155
  %add.172 = fadd float %region_0_202_constant_133, %multiply.171
  %156 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %153, float %add.172, 49
  %157 = getelementptr inbounds float, ptr %arg50, i32 %linear_index
  %158 = load float, ptr %157, align 4, !invariant.load !6
  %multiply.173 = fmul float %region_0_202_constant_135, %158
  %add.174 = fadd float %region_0_202_constant_133, %multiply.173
  %159 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %156, float %add.174, 50
  %160 = getelementptr inbounds float, ptr %arg51, i32 %linear_index
  %161 = load float, ptr %160, align 4, !invariant.load !6
  %multiply.175 = fmul float %region_0_202_constant_135, %161
  %add.176 = fadd float %region_0_202_constant_133, %multiply.175
  %162 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %159, float %add.176, 51
  %163 = getelementptr inbounds float, ptr %arg52, i32 %linear_index
  %164 = load float, ptr %163, align 4, !invariant.load !6
  %multiply.177 = fmul float %region_0_202_constant_135, %164
  %add.178 = fadd float %region_0_202_constant_133, %multiply.177
  %165 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %162, float %add.178, 52
  %166 = getelementptr inbounds float, ptr %arg53, i32 %linear_index
  %167 = load float, ptr %166, align 4, !invariant.load !6
  %multiply.179 = fmul float %region_0_202_constant_135, %167
  %add.180 = fadd float %region_0_202_constant_133, %multiply.179
  %168 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %165, float %add.180, 53
  %169 = getelementptr inbounds float, ptr %arg54, i32 %linear_index
  %170 = load float, ptr %169, align 4, !invariant.load !6
  %multiply.181 = fmul float %region_0_202_constant_135, %170
  %add.182 = fadd float %region_0_202_constant_133, %multiply.181
  %171 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %168, float %add.182, 54
  %172 = getelementptr inbounds float, ptr %arg55, i32 %linear_index
  %173 = load float, ptr %172, align 4, !invariant.load !6
  %multiply.183 = fmul float %region_0_202_constant_135, %173
  %add.184 = fadd float %region_0_202_constant_133, %multiply.183
  %174 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %171, float %add.184, 55
  %175 = getelementptr inbounds float, ptr %arg56, i32 %linear_index
  %176 = load float, ptr %175, align 4, !invariant.load !6
  %multiply.185 = fmul float %region_0_202_constant_135, %176
  %add.186 = fadd float %region_0_202_constant_133, %multiply.185
  %177 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %174, float %add.186, 56
  %178 = getelementptr inbounds float, ptr %arg57, i32 %linear_index
  %179 = load float, ptr %178, align 4, !invariant.load !6
  %multiply.187 = fmul float %region_0_202_constant_135, %179
  %add.188 = fadd float %region_0_202_constant_133, %multiply.187
  %180 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %177, float %add.188, 57
  %181 = getelementptr inbounds float, ptr %arg58, i32 %linear_index
  %182 = load float, ptr %181, align 4, !invariant.load !6
  %multiply.189 = fmul float %region_0_202_constant_135, %182
  %add.190 = fadd float %region_0_202_constant_133, %multiply.189
  %183 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %180, float %add.190, 58
  %184 = getelementptr inbounds float, ptr %arg59, i32 %linear_index
  %185 = load float, ptr %184, align 4, !invariant.load !6
  %multiply.191 = fmul float %region_0_202_constant_135, %185
  %add.192 = fadd float %region_0_202_constant_133, %multiply.191
  %186 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %183, float %add.192, 59
  %187 = getelementptr inbounds float, ptr %arg60, i32 %linear_index
  %188 = load float, ptr %187, align 4, !invariant.load !6
  %multiply.193 = fmul float %region_0_202_constant_135, %188
  %add.194 = fadd float %region_0_202_constant_133, %multiply.193
  %189 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %186, float %add.194, 60
  %190 = getelementptr inbounds float, ptr %arg61, i32 %linear_index
  %191 = load float, ptr %190, align 4, !invariant.load !6
  %multiply.195 = fmul float %region_0_202_constant_135, %191
  %add.196 = fadd float %region_0_202_constant_133, %multiply.195
  %192 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %189, float %add.196, 61
  %193 = getelementptr inbounds float, ptr %arg62, i32 %linear_index
  %194 = load float, ptr %193, align 4, !invariant.load !6
  %multiply.197 = fmul float %region_0_202_constant_135, %194
  %add.198 = fadd float %region_0_202_constant_133, %multiply.197
  %195 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %192, float %add.198, 62
  %196 = getelementptr inbounds float, ptr %arg63, i32 %linear_index
  %197 = load float, ptr %196, align 4, !invariant.load !6
  %multiply.199 = fmul float %region_0_202_constant_135, %197
  %add.200 = fadd float %region_0_202_constant_133, %multiply.199
  %198 = insertvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %195, float %add.200, 63
  %199 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 0
  %200 = getelementptr inbounds float, ptr %arg64, i32 %linear_index
  store float %199, ptr %200, align 4
  %201 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 1
  %202 = getelementptr inbounds float, ptr %arg65, i32 %linear_index
  store float %201, ptr %202, align 4
  %203 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 2
  %204 = getelementptr inbounds float, ptr %arg66, i32 %linear_index
  store float %203, ptr %204, align 4
  %205 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 3
  %206 = getelementptr inbounds float, ptr %arg67, i32 %linear_index
  store float %205, ptr %206, align 4
  %207 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 4
  %208 = getelementptr inbounds float, ptr %arg68, i32 %linear_index
  store float %207, ptr %208, align 4
  %209 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 5
  %210 = getelementptr inbounds float, ptr %arg69, i32 %linear_index
  store float %209, ptr %210, align 4
  %211 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 6
  %212 = getelementptr inbounds float, ptr %arg70, i32 %linear_index
  store float %211, ptr %212, align 4
  %213 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 7
  %214 = getelementptr inbounds float, ptr %arg71, i32 %linear_index
  store float %213, ptr %214, align 4
  %215 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 8
  %216 = getelementptr inbounds float, ptr %arg72, i32 %linear_index
  store float %215, ptr %216, align 4
  %217 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 9
  %218 = getelementptr inbounds float, ptr %arg73, i32 %linear_index
  store float %217, ptr %218, align 4
  %219 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 10
  %220 = getelementptr inbounds float, ptr %arg74, i32 %linear_index
  store float %219, ptr %220, align 4
  %221 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 11
  %222 = getelementptr inbounds float, ptr %arg75, i32 %linear_index
  store float %221, ptr %222, align 4
  %223 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 12
  %224 = getelementptr inbounds float, ptr %arg76, i32 %linear_index
  store float %223, ptr %224, align 4
  %225 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 13
  %226 = getelementptr inbounds float, ptr %arg77, i32 %linear_index
  store float %225, ptr %226, align 4
  %227 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 14
  %228 = getelementptr inbounds float, ptr %arg78, i32 %linear_index
  store float %227, ptr %228, align 4
  %229 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 15
  %230 = getelementptr inbounds float, ptr %arg79, i32 %linear_index
  store float %229, ptr %230, align 4
  %231 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 16
  %232 = getelementptr inbounds float, ptr %arg80, i32 %linear_index
  store float %231, ptr %232, align 4
  %233 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 17
  %234 = getelementptr inbounds float, ptr %arg81, i32 %linear_index
  store float %233, ptr %234, align 4
  %235 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 18
  %236 = getelementptr inbounds float, ptr %arg82, i32 %linear_index
  store float %235, ptr %236, align 4
  %237 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 19
  %238 = getelementptr inbounds float, ptr %arg83, i32 %linear_index
  store float %237, ptr %238, align 4
  %239 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 20
  %240 = getelementptr inbounds float, ptr %arg84, i32 %linear_index
  store float %239, ptr %240, align 4
  %241 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 21
  %242 = getelementptr inbounds float, ptr %arg85, i32 %linear_index
  store float %241, ptr %242, align 4
  %243 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 22
  %244 = getelementptr inbounds float, ptr %arg86, i32 %linear_index
  store float %243, ptr %244, align 4
  %245 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 23
  %246 = getelementptr inbounds float, ptr %arg87, i32 %linear_index
  store float %245, ptr %246, align 4
  %247 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 24
  %248 = getelementptr inbounds float, ptr %arg88, i32 %linear_index
  store float %247, ptr %248, align 4
  %249 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 25
  %250 = getelementptr inbounds float, ptr %arg89, i32 %linear_index
  store float %249, ptr %250, align 4
  %251 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 26
  %252 = getelementptr inbounds float, ptr %arg90, i32 %linear_index
  store float %251, ptr %252, align 4
  %253 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 27
  %254 = getelementptr inbounds float, ptr %arg91, i32 %linear_index
  store float %253, ptr %254, align 4
  %255 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 28
  %256 = getelementptr inbounds float, ptr %arg92, i32 %linear_index
  store float %255, ptr %256, align 4
  %257 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 29
  %258 = getelementptr inbounds float, ptr %arg93, i32 %linear_index
  store float %257, ptr %258, align 4
  %259 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 30
  %260 = getelementptr inbounds float, ptr %arg94, i32 %linear_index
  store float %259, ptr %260, align 4
  %261 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 31
  %262 = getelementptr inbounds float, ptr %arg95, i32 %linear_index
  store float %261, ptr %262, align 4
  %263 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 32
  %264 = getelementptr inbounds float, ptr %arg96, i32 %linear_index
  store float %263, ptr %264, align 4
  %265 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 33
  %266 = getelementptr inbounds float, ptr %arg97, i32 %linear_index
  store float %265, ptr %266, align 4
  %267 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 34
  %268 = getelementptr inbounds float, ptr %arg98, i32 %linear_index
  store float %267, ptr %268, align 4
  %269 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 35
  %270 = getelementptr inbounds float, ptr %arg99, i32 %linear_index
  store float %269, ptr %270, align 4
  %271 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 36
  %272 = getelementptr inbounds float, ptr %arg100, i32 %linear_index
  store float %271, ptr %272, align 4
  %273 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 37
  %274 = getelementptr inbounds float, ptr %arg101, i32 %linear_index
  store float %273, ptr %274, align 4
  %275 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 38
  %276 = getelementptr inbounds float, ptr %arg102, i32 %linear_index
  store float %275, ptr %276, align 4
  %277 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 39
  %278 = getelementptr inbounds float, ptr %arg103, i32 %linear_index
  store float %277, ptr %278, align 4
  %279 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 40
  %280 = getelementptr inbounds float, ptr %arg104, i32 %linear_index
  store float %279, ptr %280, align 4
  %281 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 41
  %282 = getelementptr inbounds float, ptr %arg105, i32 %linear_index
  store float %281, ptr %282, align 4
  %283 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 42
  %284 = getelementptr inbounds float, ptr %arg106, i32 %linear_index
  store float %283, ptr %284, align 4
  %285 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 43
  %286 = getelementptr inbounds float, ptr %arg107, i32 %linear_index
  store float %285, ptr %286, align 4
  %287 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 44
  %288 = getelementptr inbounds float, ptr %arg108, i32 %linear_index
  store float %287, ptr %288, align 4
  %289 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 45
  %290 = getelementptr inbounds float, ptr %arg109, i32 %linear_index
  store float %289, ptr %290, align 4
  %291 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 46
  %292 = getelementptr inbounds float, ptr %arg110, i32 %linear_index
  store float %291, ptr %292, align 4
  %293 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 47
  %294 = getelementptr inbounds float, ptr %arg111, i32 %linear_index
  store float %293, ptr %294, align 4
  %295 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 48
  %296 = getelementptr inbounds float, ptr %arg112, i32 %linear_index
  store float %295, ptr %296, align 4
  %297 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 49
  %298 = getelementptr inbounds float, ptr %arg113, i32 %linear_index
  store float %297, ptr %298, align 4
  %299 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 50
  %300 = getelementptr inbounds float, ptr %arg114, i32 %linear_index
  store float %299, ptr %300, align 4
  %301 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 51
  %302 = getelementptr inbounds float, ptr %arg115, i32 %linear_index
  store float %301, ptr %302, align 4
  %303 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 52
  %304 = getelementptr inbounds float, ptr %arg116, i32 %linear_index
  store float %303, ptr %304, align 4
  %305 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 53
  %306 = getelementptr inbounds float, ptr %arg117, i32 %linear_index
  store float %305, ptr %306, align 4
  %307 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 54
  %308 = getelementptr inbounds float, ptr %arg118, i32 %linear_index
  store float %307, ptr %308, align 4
  %309 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 55
  %310 = getelementptr inbounds float, ptr %arg119, i32 %linear_index
  store float %309, ptr %310, align 4
  %311 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 56
  %312 = getelementptr inbounds float, ptr %arg120, i32 %linear_index
  store float %311, ptr %312, align 4
  %313 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 57
  %314 = getelementptr inbounds float, ptr %arg121, i32 %linear_index
  store float %313, ptr %314, align 4
  %315 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 58
  %316 = getelementptr inbounds float, ptr %arg122, i32 %linear_index
  store float %315, ptr %316, align 4
  %317 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 59
  %318 = getelementptr inbounds float, ptr %arg123, i32 %linear_index
  store float %317, ptr %318, align 4
  %319 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 60
  %320 = getelementptr inbounds float, ptr %arg124, i32 %linear_index
  store float %319, ptr %320, align 4
  %321 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 61
  %322 = getelementptr inbounds float, ptr %arg125, i32 %linear_index
  store float %321, ptr %322, align 4
  %323 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 62
  %324 = getelementptr inbounds float, ptr %arg126, i32 %linear_index
  store float %323, ptr %324, align 4
  %325 = extractvalue { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float } %198, 63
  %326 = getelementptr inbounds float, ptr %arg127, i32 %linear_index
  store float %325, ptr %326, align 4
  br label %copy_fusion.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3}

!0 = !{ptr @fusion_80, !"kernel", i32 1}
!1 = !{ptr @fusion_80, !"reqntidx", i32 128}
!2 = !{ptr @copy_fusion, !"kernel", i32 1}
!3 = !{ptr @copy_fusion, !"reqntidx", i32 128}
!4 = !{i32 0, i32 1}
!5 = !{i32 0, i32 128}
!6 = !{}
