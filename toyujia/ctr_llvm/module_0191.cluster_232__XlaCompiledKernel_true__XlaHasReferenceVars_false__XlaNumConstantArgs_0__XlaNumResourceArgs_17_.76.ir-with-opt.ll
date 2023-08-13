target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @add_8(ptr noalias nocapture align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg1) local_unnamed_addr #0 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !14
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg05, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = getelementptr float, ptr addrspace(1) %arg17, i64 %4
  %12 = load <4 x float>, ptr addrspace(1) %11, align 16, !invariant.load !15
  %13 = extractelement <4 x float> %12, i32 0
  %14 = extractelement <4 x float> %12, i32 1
  %15 = extractelement <4 x float> %12, i32 2
  %16 = extractelement <4 x float> %12, i32 3
  %add.3 = fadd float %7, %13
  %17 = getelementptr inbounds float, ptr addrspace(1) %5, i64 1
  %18 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1
  %add.31 = fadd float %8, %14
  %19 = getelementptr inbounds float, ptr addrspace(1) %5, i64 2
  %20 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2
  %add.32 = fadd float %9, %15
  %21 = getelementptr inbounds float, ptr addrspace(1) %5, i64 3
  %22 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3
  %add.33 = fadd float %10, %16
  %23 = insertelement <4 x float> poison, float %add.3, i32 0
  %24 = insertelement <4 x float> %23, float %add.31, i32 1
  %25 = insertelement <4 x float> %24, float %add.32, i32 2
  %26 = insertelement <4 x float> %25, float %add.33, i32 3
  store <4 x float> %26, ptr addrspace(1) %5, align 16
  %27 = getelementptr inbounds float, ptr addrspace(1) %5, i64 442368
  %28 = load <4 x float>, ptr addrspace(1) %27, align 16
  %29 = extractelement <4 x float> %28, i32 0
  %30 = extractelement <4 x float> %28, i32 1
  %31 = extractelement <4 x float> %28, i32 2
  %32 = extractelement <4 x float> %28, i32 3
  %33 = getelementptr inbounds float, ptr addrspace(1) %11, i64 442368
  %34 = load <4 x float>, ptr addrspace(1) %33, align 16, !invariant.load !15
  %35 = extractelement <4 x float> %34, i32 0
  %36 = extractelement <4 x float> %34, i32 1
  %37 = extractelement <4 x float> %34, i32 2
  %38 = extractelement <4 x float> %34, i32 3
  %add.3.1 = fadd float %29, %35
  %add.31.1 = fadd float %30, %36
  %add.32.1 = fadd float %31, %37
  %add.33.1 = fadd float %32, %38
  %39 = insertelement <4 x float> poison, float %add.3.1, i32 0
  %40 = insertelement <4 x float> %39, float %add.31.1, i32 1
  %41 = insertelement <4 x float> %40, float %add.32.1, i32 2
  %42 = insertelement <4 x float> %41, float %add.33.1, i32 3
  store <4 x float> %42, ptr addrspace(1) %27, align 16
  %43 = getelementptr inbounds float, ptr addrspace(1) %5, i64 884736
  %44 = load <4 x float>, ptr addrspace(1) %43, align 16
  %45 = extractelement <4 x float> %44, i32 0
  %46 = extractelement <4 x float> %44, i32 1
  %47 = extractelement <4 x float> %44, i32 2
  %48 = extractelement <4 x float> %44, i32 3
  %49 = getelementptr inbounds float, ptr addrspace(1) %11, i64 884736
  %50 = load <4 x float>, ptr addrspace(1) %49, align 16, !invariant.load !15
  %51 = extractelement <4 x float> %50, i32 0
  %52 = extractelement <4 x float> %50, i32 1
  %53 = extractelement <4 x float> %50, i32 2
  %54 = extractelement <4 x float> %50, i32 3
  %add.3.2 = fadd float %45, %51
  %add.31.2 = fadd float %46, %52
  %add.32.2 = fadd float %47, %53
  %add.33.2 = fadd float %48, %54
  %55 = insertelement <4 x float> poison, float %add.3.2, i32 0
  %56 = insertelement <4 x float> %55, float %add.31.2, i32 1
  %57 = insertelement <4 x float> %56, float %add.32.2, i32 2
  %58 = insertelement <4 x float> %57, float %add.33.2, i32 3
  store <4 x float> %58, ptr addrspace(1) %43, align 16
  %59 = getelementptr inbounds float, ptr addrspace(1) %5, i64 1327104
  %60 = load <4 x float>, ptr addrspace(1) %59, align 16
  %61 = extractelement <4 x float> %60, i32 0
  %62 = extractelement <4 x float> %60, i32 1
  %63 = extractelement <4 x float> %60, i32 2
  %64 = extractelement <4 x float> %60, i32 3
  %65 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1327104
  %66 = load <4 x float>, ptr addrspace(1) %65, align 16, !invariant.load !15
  %67 = extractelement <4 x float> %66, i32 0
  %68 = extractelement <4 x float> %66, i32 1
  %69 = extractelement <4 x float> %66, i32 2
  %70 = extractelement <4 x float> %66, i32 3
  %add.3.3 = fadd float %61, %67
  %add.31.3 = fadd float %62, %68
  %add.32.3 = fadd float %63, %69
  %add.33.3 = fadd float %64, %70
  %71 = insertelement <4 x float> poison, float %add.3.3, i32 0
  %72 = insertelement <4 x float> %71, float %add.31.3, i32 1
  %73 = insertelement <4 x float> %72, float %add.32.3, i32 2
  %74 = insertelement <4 x float> %73, float %add.33.3, i32 3
  store <4 x float> %74, ptr addrspace(1) %59, align 16
  %75 = icmp ult i32 %linear_index_base, 327680
  br i1 %75, label %add_8.in_bounds-true.4, label %add_8.in_bounds-after.4

add_8.in_bounds-true.4:                           ; preds = %entry
  %76 = getelementptr inbounds float, ptr addrspace(1) %5, i64 1769472
  %77 = load <4 x float>, ptr addrspace(1) %76, align 16
  %78 = extractelement <4 x float> %77, i32 0
  %79 = extractelement <4 x float> %77, i32 1
  %80 = extractelement <4 x float> %77, i32 2
  %81 = extractelement <4 x float> %77, i32 3
  %82 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1769472
  %83 = load <4 x float>, ptr addrspace(1) %82, align 16, !invariant.load !15
  %84 = extractelement <4 x float> %83, i32 0
  %85 = extractelement <4 x float> %83, i32 1
  %86 = extractelement <4 x float> %83, i32 2
  %87 = extractelement <4 x float> %83, i32 3
  %add.3.4 = fadd float %78, %84
  %add.31.4 = fadd float %79, %85
  %add.32.4 = fadd float %80, %86
  %add.33.4 = fadd float %81, %87
  %88 = insertelement <4 x float> poison, float %add.3.4, i32 0
  %89 = insertelement <4 x float> %88, float %add.31.4, i32 1
  %90 = insertelement <4 x float> %89, float %add.32.4, i32 2
  %91 = insertelement <4 x float> %90, float %add.33.4, i32 3
  store <4 x float> %91, ptr addrspace(1) %76, align 16
  br label %add_8.in_bounds-after.4

add_8.in_bounds-after.4:                          ; preds = %add_8.in_bounds-true.4, %entry
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_6(ptr noalias nocapture align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg1) local_unnamed_addr #0 {
entry:
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = and i32 %linear_index3, 255
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = and i32 %linear_index2, 254
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = and i32 %linear_index1, 253
  %7 = and i32 %3, 252
  %8 = zext i32 %linear_index_base to i64
  %9 = getelementptr float, ptr addrspace(1) %arg013, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg115, i64 0, i64 %15
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !15
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.4 = fadd float %11, %18
  %.inv = fcmp olt float %add.4, 0.000000e+00
  %maximum.7 = select i1 %.inv, float 0.000000e+00, float %add.4
  %20 = zext i32 %6 to i64
  %add.41 = fadd float %12, %19
  %.inv10 = fcmp olt float %add.41, 0.000000e+00
  %maximum.73 = select i1 %.inv10, float 0.000000e+00, float %add.41
  %21 = zext i32 %5 to i64
  %22 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg115, i64 0, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 8, !invariant.load !15
  %add.44 = fadd float %13, %23
  %.inv11 = fcmp olt float %add.44, 0.000000e+00
  %maximum.76 = select i1 %.inv11, float 0.000000e+00, float %add.44
  %24 = zext i32 %4 to i64
  %25 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg115, i64 0, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !15
  %add.47 = fadd float %14, %26
  %.inv12 = fcmp olt float %add.47, 0.000000e+00
  %maximum.79 = select i1 %.inv12, float 0.000000e+00, float %add.47
  %27 = insertelement <4 x float> poison, float %maximum.7, i32 0
  %28 = insertelement <4 x float> %27, float %maximum.73, i32 1
  %29 = insertelement <4 x float> %28, float %maximum.76, i32 2
  %30 = insertelement <4 x float> %29, float %maximum.79, i32 3
  store <4 x float> %30, ptr addrspace(1) %9, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_5(ptr noalias nocapture readonly align 128 dereferenceable(4194304) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg2) local_unnamed_addr #0 {
entry:
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !18
  %row_index = shl nuw nsw i32 %0, 2
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %2 = shl nuw nsw i32 %1, 7
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !19
  %4 = shl nuw nsw i32 %3, 5
  %5 = or i32 %2, %4
  %linear_index = or i32 %5, %0
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %6 = zext i32 %linear_index_base to i64
  %7 = getelementptr float, ptr addrspace(1) %arg013, i64 %6
  %8 = load <4 x float>, ptr addrspace(1) %7, align 16, !invariant.load !15
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %13 = zext i32 %row_index to i64
  %14 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg115, i64 0, i64 %13
  %15 = load <4 x float>, ptr addrspace(1) %14, align 16, !invariant.load !15
  %16 = extractelement <4 x float> %15, i32 0
  %17 = extractelement <4 x float> %15, i32 1
  %18 = extractelement <4 x float> %15, i32 2
  %19 = extractelement <4 x float> %15, i32 3
  %add.4 = fadd float %9, %16
  %.inv = fcmp olt float %add.4, 0.000000e+00
  %maximum.7 = select i1 %.inv, float 0.000000e+00, float %add.4
  %20 = getelementptr float, ptr addrspace(1) %arg217, i64 %6
  %add.41 = fadd float %10, %17
  %.inv10 = fcmp olt float %add.41, 0.000000e+00
  %maximum.73 = select i1 %.inv10, float 0.000000e+00, float %add.41
  %add.44 = fadd float %11, %18
  %.inv11 = fcmp olt float %add.44, 0.000000e+00
  %maximum.76 = select i1 %.inv11, float 0.000000e+00, float %add.44
  %add.47 = fadd float %12, %19
  %.inv12 = fcmp olt float %add.47, 0.000000e+00
  %maximum.79 = select i1 %.inv12, float 0.000000e+00, float %add.47
  %21 = insertelement <4 x float> poison, float %maximum.7, i32 0
  %22 = insertelement <4 x float> %21, float %maximum.73, i32 1
  %23 = insertelement <4 x float> %22, float %maximum.76, i32 2
  %24 = insertelement <4 x float> %23, float %maximum.79, i32 3
  store <4 x float> %24, ptr addrspace(1) %20, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: nounwind
define void @fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(512) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(4194304) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(4194304) %arg6) local_unnamed_addr #2 {
entry:
  %arg6108 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5106 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4104 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3102 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2100 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg198 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg096 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 8192
  br i1 %6, label %tile_loop.loop_header13.preheader, label %common.ret

tile_loop.loop_header13.preheader:                ; preds = %entry
  %7 = zext i32 %5 to i64
  %8 = zext i32 %2 to i64
  %Arg_2.319 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg2100, i64 0, i64 %7, i64 %8
  %Arg_2.320 = load float, ptr addrspace(1) %Arg_2.319, align 4, !invariant.load !15
  %Arg_3.421 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg3102, i64 0, i64 %8
  %Arg_3.422 = load float, ptr addrspace(1) %Arg_3.421, align 4, !invariant.load !15
  %add.623 = fadd float %Arg_2.320, %Arg_3.422
  %.inv = fcmp olt float %add.623, 0.000000e+00
  %maximum.925 = select i1 %.inv, float 0.000000e+00, float %add.623
  %Arg_0.126 = getelementptr inbounds [128 x [1 x float]], ptr addrspace(1) %arg096, i64 0, i64 %8, i64 0
  %Arg_0.127 = load float, ptr addrspace(1) %Arg_0.126, align 4, !invariant.load !15
  %multiply.1228 = fmul float %Arg_0.127, %maximum.925
  %add.16.i91 = fadd float %multiply.1228, 0.000000e+00
  %Arg_1.230 = getelementptr inbounds [128 x [1 x float]], ptr addrspace(1) %arg198, i64 0, i64 %8, i64 0
  %Arg_1.231 = load float, ptr addrspace(1) %Arg_1.230, align 4, !invariant.load !15
  %multiply.2032 = fmul float %Arg_1.231, %maximum.925
  %add.24.i92 = fadd float %multiply.2032, 0.000000e+00
  %9 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg6108, i64 0, i64 %7, i64 %8
  store float %maximum.925, ptr addrspace(1) %9, align 4
  %Arg_2.319.1111 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.319, i64 32
  %Arg_2.320.1 = load float, ptr addrspace(1) %Arg_2.319.1111, align 4, !invariant.load !15
  %Arg_3.421.1113 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.421, i64 32
  %Arg_3.422.1 = load float, ptr addrspace(1) %Arg_3.421.1113, align 4, !invariant.load !15
  %add.623.1 = fadd float %Arg_2.320.1, %Arg_3.422.1
  %.inv.1 = fcmp olt float %add.623.1, 0.000000e+00
  %maximum.925.1 = select i1 %.inv.1, float 0.000000e+00, float %add.623.1
  %Arg_0.126.1115 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.126, i64 32
  %Arg_0.127.1 = load float, ptr addrspace(1) %Arg_0.126.1115, align 4, !invariant.load !15
  %multiply.1228.1 = fmul float %Arg_0.127.1, %maximum.925.1
  %add.16.i91.1 = fadd float %add.16.i91, %multiply.1228.1
  %Arg_1.230.1117 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.230, i64 32
  %Arg_1.231.1 = load float, ptr addrspace(1) %Arg_1.230.1117, align 4, !invariant.load !15
  %multiply.2032.1 = fmul float %Arg_1.231.1, %maximum.925.1
  %add.24.i92.1 = fadd float %add.24.i92, %multiply.2032.1
  %10 = getelementptr inbounds float, ptr addrspace(1) %9, i64 32
  store float %maximum.925.1, ptr addrspace(1) %10, align 4
  %Arg_2.319.2120 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.319, i64 64
  %Arg_2.320.2 = load float, ptr addrspace(1) %Arg_2.319.2120, align 4, !invariant.load !15
  %Arg_3.421.2122 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.421, i64 64
  %Arg_3.422.2 = load float, ptr addrspace(1) %Arg_3.421.2122, align 4, !invariant.load !15
  %add.623.2 = fadd float %Arg_2.320.2, %Arg_3.422.2
  %.inv.2 = fcmp olt float %add.623.2, 0.000000e+00
  %maximum.925.2 = select i1 %.inv.2, float 0.000000e+00, float %add.623.2
  %Arg_0.126.2124 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.126, i64 64
  %Arg_0.127.2 = load float, ptr addrspace(1) %Arg_0.126.2124, align 4, !invariant.load !15
  %multiply.1228.2 = fmul float %Arg_0.127.2, %maximum.925.2
  %add.16.i91.2 = fadd float %add.16.i91.1, %multiply.1228.2
  %Arg_1.230.2126 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.230, i64 64
  %Arg_1.231.2 = load float, ptr addrspace(1) %Arg_1.230.2126, align 4, !invariant.load !15
  %multiply.2032.2 = fmul float %Arg_1.231.2, %maximum.925.2
  %add.24.i92.2 = fadd float %add.24.i92.1, %multiply.2032.2
  %11 = getelementptr inbounds float, ptr addrspace(1) %9, i64 64
  store float %maximum.925.2, ptr addrspace(1) %11, align 4
  %x_loc18.3 = or i32 %0, 96
  %12 = zext i32 %x_loc18.3 to i64
  %Arg_2.319.3 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg2100, i64 0, i64 %7, i64 %12
  %Arg_2.320.3 = load float, ptr addrspace(1) %Arg_2.319.3, align 4, !invariant.load !15
  %Arg_3.421.3 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg3102, i64 0, i64 %12
  %Arg_3.422.3 = load float, ptr addrspace(1) %Arg_3.421.3, align 4, !invariant.load !15
  %add.623.3 = fadd float %Arg_2.320.3, %Arg_3.422.3
  %.inv.3 = fcmp olt float %add.623.3, 0.000000e+00
  %maximum.925.3 = select i1 %.inv.3, float 0.000000e+00, float %add.623.3
  %Arg_0.126.3 = getelementptr inbounds [128 x [1 x float]], ptr addrspace(1) %arg096, i64 0, i64 %12, i64 0
  %Arg_0.127.3 = load float, ptr addrspace(1) %Arg_0.126.3, align 4, !invariant.load !15
  %multiply.1228.3 = fmul float %Arg_0.127.3, %maximum.925.3
  %add.16.i91.3 = fadd float %add.16.i91.2, %multiply.1228.3
  %Arg_1.230.3 = getelementptr inbounds [128 x [1 x float]], ptr addrspace(1) %arg198, i64 0, i64 %12, i64 0
  %Arg_1.231.3 = load float, ptr addrspace(1) %Arg_1.230.3, align 4, !invariant.load !15
  %multiply.2032.3 = fmul float %Arg_1.231.3, %maximum.925.3
  %add.24.i92.3 = fadd float %add.24.i92.2, %multiply.2032.3
  %13 = getelementptr inbounds [8192 x [128 x float]], ptr addrspace(1) %arg6108, i64 0, i64 %7, i64 %12
  store float %maximum.925.3, ptr addrspace(1) %13, align 4
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i91.3, i32 16, i32 31)
  %add.16.i = fadd float %add.16.i91.3, %14
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i, i32 8, i32 31)
  %add.16.i83 = fadd float %add.16.i, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i83, i32 4, i32 31)
  %add.16.i84 = fadd float %add.16.i83, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i84, i32 2, i32 31)
  %add.16.i85 = fadd float %add.16.i84, %17
  %18 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i85, i32 1, i32 31)
  %19 = icmp eq i32 %2, 0
  %20 = zext i32 %3 to i64
  %21 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %20, i64 0, i64 0
  %add.16.i86 = fadd float %add.16.i85, %18
  br i1 %19, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

common.ret:                                       ; preds = %intra_warp_reduce_write-after65, %reduction_write_output-true69, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %tile_loop.loop_header13.preheader, %intra_warp_reduce_write-true
  %22 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg4104, i64 0, i64 %7
  %23 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %20, i64 0, i64 %8
  br i1 %22, label %reduction_write_output-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  %24 = icmp eq i32 %2, 0
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i92.3, i32 16, i32 31)
  %add.24.i = fadd float %add.24.i92.3, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i, i32 8, i32 31)
  %add.24.i87 = fadd float %add.24.i, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i87, i32 4, i32 31)
  %add.24.i88 = fadd float %add.24.i87, %27
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i88, i32 2, i32 31)
  %add.24.i89 = fadd float %add.24.i88, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i89, i32 1, i32 31)
  %30 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %20, i64 0, i64 0
  %add.24.i90 = fadd float %add.24.i89, %29
  br i1 %24, label %intra_warp_reduce_write-true64, label %intra_warp_reduce_write-after65

intra_warp_reduce_write-after65:                  ; preds = %intra_warp_reduce_write-true64, %inter_warp_reduce-after
  %31 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address71 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg5106, i64 0, i64 %7
  %32 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %20, i64 0, i64 %8
  br i1 %31, label %reduction_write_output-true69, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %tile_loop.loop_header13.preheader
  store float %add.16.i86, ptr addrspace(3) %21, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %23, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %inter_warp_reduce-after

intra_warp_reduce_write-true64:                   ; preds = %inter_warp_reduce-after
  store float %add.24.i90, ptr addrspace(3) %30, align 4
  br label %intra_warp_reduce_write-after65

reduction_write_output-true69:                    ; preds = %intra_warp_reduce_write-after65
  %output72.then.val = load float, ptr addrspace(3) %32, align 4
  store float %output72.then.val, ptr addrspace(1) %output_element_address71, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !15
  %6 = load float, ptr addrspace(1) %arg13, align 16, !invariant.load !15
  %add.9 = fadd float %5, %6
  %7 = fneg float %add.9
  %8 = tail call float @llvm.fma.f32(float %7, float 0x3F777313A0000000, float 5.000000e-01)
  %9 = tail call float @llvm.nvvm.saturate.f(float %8) #2
  %10 = tail call float @llvm.nvvm.fma.rm.f(float %9, float 2.520000e+02, float 0x4168000020000000) #2
  %11 = fadd float %10, 0xC168000FE0000000
  %12 = fneg float %11
  %13 = tail call float @llvm.fma.f32(float %7, float 0x3FF7154760000000, float %12)
  %14 = tail call float @llvm.fma.f32(float %7, float 0x3E54AE0C00000000, float %13)
  %15 = bitcast float %10 to i32
  %16 = shl i32 %15, 23
  %17 = bitcast i32 %16 to float
  %18 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %14) #2
  %19 = fmul float %18, %17
  %add.12 = fadd float %19, 1.000000e+00
  %divide.13 = fdiv float 1.000000e+00, %add.12
  %20 = getelementptr inbounds float, ptr addrspace(1) %arg25, i64 %3
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !15
  %22 = load float, ptr addrspace(1) %arg37, align 16, !invariant.load !15
  %add.17 = fadd float %21, %22
  %23 = fneg float %add.17
  %24 = tail call float @llvm.fma.f32(float %23, float 0x3F777313A0000000, float 5.000000e-01)
  %25 = tail call float @llvm.nvvm.saturate.f(float %24) #2
  %26 = tail call float @llvm.nvvm.fma.rm.f(float %25, float 2.520000e+02, float 0x4168000020000000) #2
  %27 = fadd float %26, 0xC168000FE0000000
  %28 = fneg float %27
  %29 = tail call float @llvm.fma.f32(float %23, float 0x3FF7154760000000, float %28)
  %30 = tail call float @llvm.fma.f32(float %23, float 0x3E54AE0C00000000, float %29)
  %31 = bitcast float %26 to i32
  %32 = shl i32 %31, 23
  %33 = bitcast i32 %32 to float
  %34 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %30) #2
  %35 = fmul float %34, %33
  %add.20 = fadd float %35, 1.000000e+00
  %divide.21 = fdiv float 1.000000e+00, %add.20
  %36 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  store float %divide.13, ptr addrspace(1) %36, align 4
  %37 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %3
  store float %divide.21, ptr addrspace(1) %37, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #6

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #4 = { convergent nocallback nounwind }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}
!llvm.module.flags = !{!12}

!0 = !{ptr @add_8, !"kernel", i32 1}
!1 = !{ptr @add_8, !"reqntidx", i32 128}
!2 = !{ptr @fusion_6, !"kernel", i32 1}
!3 = !{ptr @fusion_6, !"reqntidx", i32 256}
!4 = !{ptr @fusion_5, !"kernel", i32 1}
!5 = !{ptr @fusion_5, !"reqntidx", i32 32}
!6 = !{ptr @fusion_5, !"reqntidy", i32 4}
!7 = !{ptr @fusion_3, !"kernel", i32 1}
!8 = !{ptr @fusion_3, !"reqntidx", i32 96}
!9 = !{ptr @fusion_7, !"kernel", i32 1}
!10 = !{ptr @fusion_7, !"reqntidx", i32 1024}
!11 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!12 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!13 = !{i32 0, i32 864}
!14 = !{i32 0, i32 128}
!15 = !{}
!16 = !{i32 0, i32 2048}
!17 = !{i32 0, i32 256}
!18 = !{i32 0, i32 32}
!19 = !{i32 0, i32 4}
!20 = !{i32 0, i32 96}
!21 = !{i32 0, i32 2731}
!22 = !{i32 0, i32 8}
!23 = !{i32 0, i32 1024}
