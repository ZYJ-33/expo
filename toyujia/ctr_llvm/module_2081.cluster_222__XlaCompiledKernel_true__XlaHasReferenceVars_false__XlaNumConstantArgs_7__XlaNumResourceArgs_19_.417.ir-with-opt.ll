target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache6 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache7 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache8 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache10 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache11 = private unnamed_addr addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache12 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_32(ptr noalias nocapture readonly align 16 dereferenceable(524288) %arg0, ptr noalias nocapture align 128 dereferenceable(524288) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !47
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !47
  %12 = getelementptr float, ptr addrspace(1) %arg19, i64 %4
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %multiply.5 = fmul float %11, %14
  %subtract.6 = fsub float %7, %multiply.5
  %multiply.51 = fmul float %11, %15
  %subtract.62 = fsub float %8, %multiply.51
  %multiply.53 = fmul float %11, %16
  %subtract.64 = fsub float %9, %multiply.53
  %multiply.55 = fmul float %11, %17
  %subtract.66 = fsub float %10, %multiply.55
  %18 = insertelement <4 x float> poison, float %subtract.6, i32 0
  %19 = insertelement <4 x float> %18, float %subtract.62, i32 1
  %20 = insertelement <4 x float> %19, float %subtract.64, i32 2
  %21 = insertelement <4 x float> %20, float %subtract.66, i32 3
  store <4 x float> %21, ptr addrspace(1) %12, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_41(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg10) local_unnamed_addr #0 {
entry:
  %arg1048 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg946 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg844 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg742 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg640 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg538 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg436 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg334 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg232 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg130 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg028 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg844, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !47
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = getelementptr float, ptr addrspace(1) %arg946, i64 %4
  %12 = load <4 x float>, ptr addrspace(1) %11, align 16, !invariant.load !47
  %13 = extractelement <4 x float> %12, i32 0
  %14 = extractelement <4 x float> %12, i32 1
  %15 = extractelement <4 x float> %12, i32 2
  %16 = extractelement <4 x float> %12, i32 3
  %add.11 = fadd float %7, %13
  %17 = getelementptr float, ptr addrspace(1) %arg742, i64 %4
  %18 = load <4 x float>, ptr addrspace(1) %17, align 16, !invariant.load !47
  %19 = extractelement <4 x float> %18, i32 0
  %20 = extractelement <4 x float> %18, i32 1
  %21 = extractelement <4 x float> %18, i32 2
  %22 = extractelement <4 x float> %18, i32 3
  %add.12 = fadd float %add.11, %19
  %23 = getelementptr float, ptr addrspace(1) %arg640, i64 %4
  %24 = load <4 x float>, ptr addrspace(1) %23, align 16, !invariant.load !47
  %25 = extractelement <4 x float> %24, i32 0
  %26 = extractelement <4 x float> %24, i32 1
  %27 = extractelement <4 x float> %24, i32 2
  %28 = extractelement <4 x float> %24, i32 3
  %add.13 = fadd float %add.12, %25
  %29 = getelementptr float, ptr addrspace(1) %arg538, i64 %4
  %30 = load <4 x float>, ptr addrspace(1) %29, align 16, !invariant.load !47
  %31 = extractelement <4 x float> %30, i32 0
  %32 = extractelement <4 x float> %30, i32 1
  %33 = extractelement <4 x float> %30, i32 2
  %34 = extractelement <4 x float> %30, i32 3
  %add.14 = fadd float %add.13, %31
  %35 = getelementptr float, ptr addrspace(1) %arg436, i64 %4
  %36 = load <4 x float>, ptr addrspace(1) %35, align 16, !invariant.load !47
  %37 = extractelement <4 x float> %36, i32 0
  %38 = extractelement <4 x float> %36, i32 1
  %39 = extractelement <4 x float> %36, i32 2
  %40 = extractelement <4 x float> %36, i32 3
  %add.15 = fadd float %add.14, %37
  %41 = getelementptr float, ptr addrspace(1) %arg334, i64 %4
  %42 = load <4 x float>, ptr addrspace(1) %41, align 16, !invariant.load !47
  %43 = extractelement <4 x float> %42, i32 0
  %44 = extractelement <4 x float> %42, i32 1
  %45 = extractelement <4 x float> %42, i32 2
  %46 = extractelement <4 x float> %42, i32 3
  %add.16 = fadd float %add.15, %43
  %47 = getelementptr float, ptr addrspace(1) %arg232, i64 %4
  %48 = load <4 x float>, ptr addrspace(1) %47, align 16, !invariant.load !47
  %49 = extractelement <4 x float> %48, i32 0
  %50 = extractelement <4 x float> %48, i32 1
  %51 = extractelement <4 x float> %48, i32 2
  %52 = extractelement <4 x float> %48, i32 3
  %add.17 = fadd float %add.16, %49
  %53 = getelementptr float, ptr addrspace(1) %arg130, i64 %4
  %54 = load <4 x float>, ptr addrspace(1) %53, align 16, !invariant.load !47
  %55 = extractelement <4 x float> %54, i32 0
  %56 = extractelement <4 x float> %54, i32 1
  %57 = extractelement <4 x float> %54, i32 2
  %58 = extractelement <4 x float> %54, i32 3
  %add.18 = fadd float %add.17, %55
  %59 = getelementptr float, ptr addrspace(1) %arg028, i64 %4
  %60 = load <4 x float>, ptr addrspace(1) %59, align 16, !invariant.load !47
  %61 = extractelement <4 x float> %60, i32 0
  %62 = extractelement <4 x float> %60, i32 1
  %63 = extractelement <4 x float> %60, i32 2
  %64 = extractelement <4 x float> %60, i32 3
  %add.19 = fadd float %add.18, %61
  %65 = getelementptr float, ptr addrspace(1) %arg1048, i64 %4
  %add.111 = fadd float %8, %14
  %add.122 = fadd float %add.111, %20
  %add.133 = fadd float %add.122, %26
  %add.144 = fadd float %add.133, %32
  %add.155 = fadd float %add.144, %38
  %add.166 = fadd float %add.155, %44
  %add.177 = fadd float %add.166, %50
  %add.188 = fadd float %add.177, %56
  %add.199 = fadd float %add.188, %62
  %add.1110 = fadd float %9, %15
  %add.1211 = fadd float %add.1110, %21
  %add.1312 = fadd float %add.1211, %27
  %add.1413 = fadd float %add.1312, %33
  %add.1514 = fadd float %add.1413, %39
  %add.1615 = fadd float %add.1514, %45
  %add.1716 = fadd float %add.1615, %51
  %add.1817 = fadd float %add.1716, %57
  %add.1918 = fadd float %add.1817, %63
  %add.1119 = fadd float %10, %16
  %add.1220 = fadd float %add.1119, %22
  %add.1321 = fadd float %add.1220, %28
  %add.1422 = fadd float %add.1321, %34
  %add.1523 = fadd float %add.1422, %40
  %add.1624 = fadd float %add.1523, %46
  %add.1725 = fadd float %add.1624, %52
  %add.1826 = fadd float %add.1725, %58
  %add.1927 = fadd float %add.1826, %64
  %66 = insertelement <4 x float> poison, float %add.19, i32 0
  %67 = insertelement <4 x float> %66, float %add.199, i32 1
  %68 = insertelement <4 x float> %67, float %add.1918, i32 2
  %69 = insertelement <4 x float> %68, float %add.1927, i32 3
  store <4 x float> %69, ptr addrspace(1) %65, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_40(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(838860800) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg4) local_unnamed_addr #2 {
entry:
  %arg460 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg358 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg256 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg154 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg052 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %2 = lshr i32 %0, 5
  %3 = mul nuw nsw i32 %1, 3
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 3276800
  br i1 %5, label %tile_loop.loop_header9.preheader, label %common.ret

tile_loop.loop_header9.preheader:                 ; preds = %entry
  %6 = and i32 %0, 31
  %7 = shl nuw nsw i32 %4, 6
  %8 = or i32 %6, %7
  %9 = and i32 %4, 3
  %10 = udiv i32 %4, 400
  %11 = zext i32 %10 to i64
  %12 = zext i32 %9 to i64
  %13 = zext i32 %6 to i64
  %Arg_1.215 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr addrspace(1) %arg154, i64 0, i64 %11, i64 %12, i64 %13
  %Arg_1.216 = load float, ptr addrspace(1) %Arg_1.215, align 4, !invariant.load !47
  %14 = zext i32 %8 to i64
  %Arg_2.317 = getelementptr inbounds float, ptr addrspace(1) %arg256, i64 %14
  %Arg_2.318 = load float, ptr addrspace(1) %Arg_2.317, align 4, !invariant.load !47
  %multiply.919 = fmul float %Arg_1.216, %Arg_2.318
  %add.14.i49 = fadd float %multiply.919, 0.000000e+00
  %15 = zext i32 %4 to i64
  %Arg_0.123 = getelementptr inbounds float, ptr addrspace(1) %arg052, i64 %15
  %Arg_0.124 = load float, ptr addrspace(1) %Arg_0.123, align 4, !invariant.load !47
  %multiply.725 = fmul float %Arg_1.216, %Arg_0.124
  %16 = getelementptr inbounds float, ptr addrspace(1) %arg358, i64 %14
  store float %multiply.725, ptr addrspace(1) %16, align 4
  %Arg_1.215.163 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.215, i64 32
  %Arg_1.216.1 = load float, ptr addrspace(1) %Arg_1.215.163, align 4, !invariant.load !47
  %17 = zext i32 %7 to i64
  %18 = add i64 %13, %17
  %19 = getelementptr float, ptr addrspace(1) %arg256, i64 %18
  %Arg_2.317.165 = getelementptr inbounds float, ptr addrspace(1) %19, i64 32
  %Arg_2.318.1 = load float, ptr addrspace(1) %Arg_2.317.165, align 4, !invariant.load !47
  %multiply.919.1 = fmul float %Arg_1.216.1, %Arg_2.318.1
  %add.14.i49.1 = fadd float %add.14.i49, %multiply.919.1
  %multiply.725.1 = fmul float %Arg_1.216.1, %Arg_0.124
  %20 = getelementptr float, ptr addrspace(1) %arg358, i64 %18
  %21 = getelementptr inbounds float, ptr addrspace(1) %20, i64 32
  store float %multiply.725.1, ptr addrspace(1) %21, align 4
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i49.1, i32 16, i32 31)
  %add.14.i = fadd float %add.14.i49.1, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i, i32 8, i32 31)
  %add.14.i45 = fadd float %add.14.i, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i45, i32 4, i32 31)
  %add.14.i46 = fadd float %add.14.i45, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i46, i32 2, i32 31)
  %add.14.i47 = fadd float %add.14.i46, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i47, i32 1, i32 31)
  %27 = icmp eq i32 %6, 0
  %28 = zext i32 %2 to i64
  %29 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %28, i64 0, i64 0
  %add.14.i48 = fadd float %add.14.i47, %26
  br i1 %27, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %tile_loop.loop_header9.preheader
  %30 = icmp eq i32 %6, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %30, label %reduction_write_output-true, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %tile_loop.loop_header9.preheader
  store float %add.14.i48, ptr addrspace(3) %29, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %31 = lshr i32 %4, 2
  %32 = urem i32 %31, 100
  %33 = zext i32 %32 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg460, i64 0, i64 %11, i64 %12, i64 %33
  %output.then.val = load float, ptr addrspace(3) %29, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

; Function Attrs: nounwind
define void @fusion_38(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #2 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !51
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %8 = add nuw nsw i32 %2, %7
  %9 = zext i32 %8 to i64
  %Arg_0.114 = getelementptr inbounds float, ptr addrspace(1) %arg044, i64 %9
  %Arg_1.212 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %9
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !47
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !47
  %multiply.416 = fmul float %Arg_1.213, %Arg_0.115
  %add.9.i41 = fadd float %multiply.416, 0.000000e+00
  %10 = zext i32 %7 to i64
  %11 = zext i32 %2 to i64
  %12 = add i64 %11, %10
  %13 = getelementptr float, ptr addrspace(1) %arg044, i64 %12
  %Arg_0.114.151 = getelementptr inbounds float, ptr addrspace(1) %13, i64 32
  %14 = getelementptr float, ptr addrspace(1) %arg146, i64 %12
  %Arg_1.212.153 = getelementptr inbounds float, ptr addrspace(1) %14, i64 32
  %Arg_1.213.1 = load float, ptr addrspace(1) %Arg_1.212.153, align 4, !invariant.load !47
  %Arg_0.115.1 = load float, ptr addrspace(1) %Arg_0.114.151, align 4, !invariant.load !47
  %multiply.416.1 = fmul float %Arg_1.213.1, %Arg_0.115.1
  %add.9.i41.1 = fadd float %add.9.i41, %multiply.416.1
  %Arg_0.114.255 = getelementptr inbounds float, ptr addrspace(1) %13, i64 64
  %Arg_1.212.257 = getelementptr inbounds float, ptr addrspace(1) %14, i64 64
  %Arg_1.213.2 = load float, ptr addrspace(1) %Arg_1.212.257, align 4, !invariant.load !47
  %Arg_0.115.2 = load float, ptr addrspace(1) %Arg_0.114.255, align 4, !invariant.load !47
  %multiply.416.2 = fmul float %Arg_1.213.2, %Arg_0.115.2
  %add.9.i41.2 = fadd float %add.9.i41.1, %multiply.416.2
  %x_loc11.3 = or i32 %0, 96
  %15 = icmp ult i32 %x_loc11.3, 100
  %16 = add nuw nsw i32 %x_loc11.3, %7
  %17 = zext i32 %16 to i64
  %Arg_0.114.3 = getelementptr inbounds float, ptr addrspace(1) %arg044, i64 %17
  %Arg_1.212.3 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %17
  br i1 %15, label %x_in_tile-true.3, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %18 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %19 = lshr i32 %5, 2
  %20 = zext i32 %19 to i64
  %21 = and i32 %5, 3
  %22 = zext i32 %21 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg248, i64 0, i64 %20, i64 %22
  br i1 %18, label %reduction_write_output-true, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header6.preheader
  %Arg_1.213.3 = load float, ptr addrspace(1) %Arg_1.212.3, align 4, !invariant.load !47
  %Arg_0.115.3 = load float, ptr addrspace(1) %Arg_0.114.3, align 4, !invariant.load !47
  %multiply.416.3 = fmul float %Arg_1.213.3, %Arg_0.115.3
  %add.9.i41.3 = fadd float %add.9.i41.2, %multiply.416.3
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header6.preheader
  %partial_reduction_result.1.3 = phi float [ %add.9.i41.3, %x_in_tile-true.3 ], [ %add.9.i41.2, %tile_loop.loop_header6.preheader ]
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %add.9.i = fadd float %partial_reduction_result.1.3, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i, i32 8, i32 31)
  %add.9.i37 = fadd float %add.9.i, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i37, i32 4, i32 31)
  %add.9.i38 = fadd float %add.9.i37, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i38, i32 2, i32 31)
  %add.9.i39 = fadd float %add.9.i38, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i39, i32 1, i32 31)
  %28 = icmp eq i32 %2, 0
  %29 = zext i32 %3 to i64
  %30 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %29, i64 0, i64 0
  %add.9.i40 = fadd float %add.9.i39, %27
  br i1 %28, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.9.i40, ptr addrspace(3) %30, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %30, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_37(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = udiv i32 %linear_index_base, 100
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %arg211, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !47
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %12 = zext i32 %4 to i64
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg19, i64 %12
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !47
  %subtract.6 = fsub float %8, %14
  %15 = getelementptr float, ptr addrspace(1) %arg07, i64 %5
  %16 = load <4 x float>, ptr addrspace(1) %15, align 16, !invariant.load !47
  %17 = extractelement <4 x float> %16, i32 0
  %18 = extractelement <4 x float> %16, i32 1
  %19 = extractelement <4 x float> %16, i32 2
  %20 = extractelement <4 x float> %16, i32 3
  %multiply.7 = fmul float %subtract.6, %17
  %21 = getelementptr float, ptr addrspace(1) %arg313, i64 %5
  %subtract.61 = fsub float %9, %14
  %multiply.72 = fmul float %subtract.61, %18
  %subtract.63 = fsub float %10, %14
  %multiply.74 = fmul float %subtract.63, %19
  %subtract.65 = fsub float %11, %14
  %multiply.76 = fmul float %subtract.65, %20
  %22 = insertelement <4 x float> poison, float %multiply.7, i32 0
  %23 = insertelement <4 x float> %22, float %multiply.72, i32 1
  %24 = insertelement <4 x float> %23, float %multiply.74, i32 2
  %25 = insertelement <4 x float> %24, float %multiply.76, i32 3
  store <4 x float> %25, ptr addrspace(1) %21, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_30(ptr noalias nocapture readonly align 16 dereferenceable(8192) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(237568) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8192) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8192) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8192) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !53
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !47
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !47
  %9 = zext i32 %4 to i64
  %10 = zext i32 %3 to i64
  %11 = getelementptr [232 x [256 x float]], ptr addrspace(1) %arg13, i64 0, i64 %10, i64 %9
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 38912
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !47
  %multiply.7 = fmul float %8, %13
  %subtract.8 = fsub float %7, %multiply.7
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !47
  %16 = getelementptr inbounds float, ptr addrspace(1) %11, i64 40960
  %17 = load float, ptr addrspace(1) %16, align 4, !invariant.load !47
  %multiply.10 = fmul float %8, %17
  %subtract.11 = fsub float %15, %multiply.10
  %18 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %5
  store float %subtract.8, ptr addrspace(1) %18, align 4
  %19 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %5
  store float %subtract.11, ptr addrspace(1) %19, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_31(ptr noalias nocapture readonly align 16 dereferenceable(155648) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(237568) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(155648) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !47
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !47
  %9 = zext i32 %3 to i64
  %10 = zext i32 %4 to i64
  %11 = getelementptr inbounds [232 x [256 x float]], ptr addrspace(1) %arg13, i64 0, i64 %9, i64 %10
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !47
  %multiply.6 = fmul float %8, %12
  %subtract.7 = fsub float %7, %multiply.6
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  store float %subtract.7, ptr addrspace(1) %13, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_23(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg12) local_unnamed_addr #2 {
entry:
  %arg12273 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11271 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10269 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9267 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8265 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7263 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6261 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5259 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4257 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3255 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2253 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1251 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0249 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !51
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header37.preheader, label %common.ret

tile_loop.loop_header37.preheader:                ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %Arg_5.670 = load float, ptr addrspace(1) %arg5259, align 16
  %8 = add nuw nsw i32 %2, %7
  %9 = urem i32 %8, 100
  %.frozen = freeze i32 %8
  %10 = udiv i32 %.frozen, 400
  %11 = zext i32 %10 to i64
  %12 = zext i32 %9 to i64
  %Arg_1.243 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1251, i64 0, i64 %11, i64 %12, i64 0
  %Arg_1.244 = load float, ptr addrspace(1) %Arg_1.243, align 4, !invariant.load !47
  %13 = zext i32 %8 to i64
  %Arg_0.145 = getelementptr inbounds float, ptr addrspace(1) %arg0249, i64 %13
  %Arg_0.146 = load float, ptr addrspace(1) %Arg_0.145, align 4, !invariant.load !47
  %multiply.947 = fmul float %Arg_1.244, %Arg_0.146
  %add.14.i235 = fadd float %multiply.947, 0.000000e+00
  %Arg_2.349 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2253, i64 0, i64 %11, i64 %12, i64 0
  %Arg_2.350 = load float, ptr addrspace(1) %Arg_2.349, align 4, !invariant.load !47
  %multiply.1853 = fmul float %Arg_0.146, %Arg_2.350
  %add.22.i236 = fadd float %multiply.1853, 0.000000e+00
  %Arg_3.455 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3255, i64 0, i64 %11, i64 %12, i64 0
  %Arg_3.456 = load float, ptr addrspace(1) %Arg_3.455, align 4, !invariant.load !47
  %multiply.2659 = fmul float %Arg_0.146, %Arg_3.456
  %add.30.i237 = fadd float %multiply.2659, 0.000000e+00
  %Arg_4.561 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4257, i64 0, i64 %11, i64 %12, i64 0
  %Arg_4.562 = load float, ptr addrspace(1) %Arg_4.561, align 4, !invariant.load !47
  %multiply.3465 = fmul float %Arg_0.146, %Arg_4.562
  %add.38.i238 = fadd float %multiply.3465, 0.000000e+00
  %add.48.i239 = fadd float %Arg_0.146, 0.000000e+00
  %14 = mul i32 %10, 400
  %urem.decomposed = sub i32 %.frozen, %14
  %15 = and i32 %urem.decomposed, 3
  %16 = lshr i32 %urem.decomposed, 2
  %17 = zext i32 %15 to i64
  %18 = zext i32 %16 to i64
  %Arg_0.171 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %11, i64 %17, i64 %18
  %Arg_0.172 = load float, ptr addrspace(1) %Arg_0.171, align 4, !invariant.load !47
  %multiply.4173 = fmul float %Arg_5.670, %Arg_0.172
  %19 = lshr i32 %.frozen, 2
  %20 = urem i32 %19, 100
  %21 = zext i32 %20 to i64
  %Arg_0.174 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %11, i64 %17, i64 %21
  %Arg_0.175 = load float, ptr addrspace(1) %Arg_0.174, align 4, !invariant.load !47
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg11271, i64 %13
  store float %Arg_0.175, ptr addrspace(1) %22, align 4
  %23 = getelementptr inbounds float, ptr addrspace(1) %arg10269, i64 %13
  store float %multiply.4173, ptr addrspace(1) %23, align 4
  %x_loc42.1 = or i32 %2, 32
  %24 = add nuw nsw i32 %x_loc42.1, %7
  %25 = urem i32 %24, 100
  %.frozen246 = freeze i32 %24
  %26 = udiv i32 %.frozen246, 400
  %27 = zext i32 %26 to i64
  %28 = zext i32 %25 to i64
  %Arg_1.243.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1251, i64 0, i64 %27, i64 %28, i64 0
  %Arg_1.244.1 = load float, ptr addrspace(1) %Arg_1.243.1, align 4, !invariant.load !47
  %29 = zext i32 %7 to i64
  %30 = zext i32 %2 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr float, ptr addrspace(1) %arg0249, i64 %31
  %Arg_0.145.1276 = getelementptr inbounds float, ptr addrspace(1) %32, i64 32
  %Arg_0.146.1 = load float, ptr addrspace(1) %Arg_0.145.1276, align 4, !invariant.load !47
  %multiply.947.1 = fmul float %Arg_1.244.1, %Arg_0.146.1
  %add.14.i235.1 = fadd float %add.14.i235, %multiply.947.1
  %Arg_2.349.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2253, i64 0, i64 %27, i64 %28, i64 0
  %Arg_2.350.1 = load float, ptr addrspace(1) %Arg_2.349.1, align 4, !invariant.load !47
  %multiply.1853.1 = fmul float %Arg_0.146.1, %Arg_2.350.1
  %add.22.i236.1 = fadd float %add.22.i236, %multiply.1853.1
  %Arg_3.455.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3255, i64 0, i64 %27, i64 %28, i64 0
  %Arg_3.456.1 = load float, ptr addrspace(1) %Arg_3.455.1, align 4, !invariant.load !47
  %multiply.2659.1 = fmul float %Arg_0.146.1, %Arg_3.456.1
  %add.30.i237.1 = fadd float %add.30.i237, %multiply.2659.1
  %Arg_4.561.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4257, i64 0, i64 %27, i64 %28, i64 0
  %Arg_4.562.1 = load float, ptr addrspace(1) %Arg_4.561.1, align 4, !invariant.load !47
  %multiply.3465.1 = fmul float %Arg_0.146.1, %Arg_4.562.1
  %add.38.i238.1 = fadd float %add.38.i238, %multiply.3465.1
  %add.48.i239.1 = fadd float %add.48.i239, %Arg_0.146.1
  %33 = mul i32 %26, 400
  %urem.1.decomposed = sub i32 %.frozen246, %33
  %34 = and i32 %urem.1.decomposed, 3
  %35 = lshr i32 %urem.1.decomposed, 2
  %36 = zext i32 %34 to i64
  %37 = zext i32 %35 to i64
  %Arg_0.171.1 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %27, i64 %36, i64 %37
  %Arg_0.172.1 = load float, ptr addrspace(1) %Arg_0.171.1, align 4, !invariant.load !47
  %multiply.4173.1 = fmul float %Arg_5.670, %Arg_0.172.1
  %38 = lshr i32 %.frozen246, 2
  %39 = urem i32 %38, 100
  %40 = zext i32 %39 to i64
  %Arg_0.174.1 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %27, i64 %36, i64 %40
  %Arg_0.175.1 = load float, ptr addrspace(1) %Arg_0.174.1, align 4, !invariant.load !47
  %41 = getelementptr float, ptr addrspace(1) %arg11271, i64 %31
  %42 = getelementptr inbounds float, ptr addrspace(1) %41, i64 32
  store float %Arg_0.175.1, ptr addrspace(1) %42, align 4
  %43 = getelementptr float, ptr addrspace(1) %arg10269, i64 %31
  %44 = getelementptr inbounds float, ptr addrspace(1) %43, i64 32
  store float %multiply.4173.1, ptr addrspace(1) %44, align 4
  %x_loc42.2 = or i32 %2, 64
  %45 = add nuw nsw i32 %x_loc42.2, %7
  %46 = urem i32 %45, 100
  %.frozen247 = freeze i32 %45
  %47 = udiv i32 %.frozen247, 400
  %48 = zext i32 %47 to i64
  %49 = zext i32 %46 to i64
  %Arg_1.243.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1251, i64 0, i64 %48, i64 %49, i64 0
  %Arg_1.244.2 = load float, ptr addrspace(1) %Arg_1.243.2, align 4, !invariant.load !47
  %Arg_0.145.2280 = getelementptr inbounds float, ptr addrspace(1) %32, i64 64
  %Arg_0.146.2 = load float, ptr addrspace(1) %Arg_0.145.2280, align 4, !invariant.load !47
  %multiply.947.2 = fmul float %Arg_1.244.2, %Arg_0.146.2
  %add.14.i235.2 = fadd float %add.14.i235.1, %multiply.947.2
  %Arg_2.349.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2253, i64 0, i64 %48, i64 %49, i64 0
  %Arg_2.350.2 = load float, ptr addrspace(1) %Arg_2.349.2, align 4, !invariant.load !47
  %multiply.1853.2 = fmul float %Arg_0.146.2, %Arg_2.350.2
  %add.22.i236.2 = fadd float %add.22.i236.1, %multiply.1853.2
  %Arg_3.455.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3255, i64 0, i64 %48, i64 %49, i64 0
  %Arg_3.456.2 = load float, ptr addrspace(1) %Arg_3.455.2, align 4, !invariant.load !47
  %multiply.2659.2 = fmul float %Arg_0.146.2, %Arg_3.456.2
  %add.30.i237.2 = fadd float %add.30.i237.1, %multiply.2659.2
  %Arg_4.561.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4257, i64 0, i64 %48, i64 %49, i64 0
  %Arg_4.562.2 = load float, ptr addrspace(1) %Arg_4.561.2, align 4, !invariant.load !47
  %multiply.3465.2 = fmul float %Arg_0.146.2, %Arg_4.562.2
  %add.38.i238.2 = fadd float %add.38.i238.1, %multiply.3465.2
  %add.48.i239.2 = fadd float %add.48.i239.1, %Arg_0.146.2
  %50 = mul i32 %47, 400
  %urem.2.decomposed = sub i32 %.frozen247, %50
  %51 = and i32 %urem.2.decomposed, 3
  %52 = lshr i32 %urem.2.decomposed, 2
  %53 = zext i32 %51 to i64
  %54 = zext i32 %52 to i64
  %Arg_0.171.2 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %48, i64 %53, i64 %54
  %Arg_0.172.2 = load float, ptr addrspace(1) %Arg_0.171.2, align 4, !invariant.load !47
  %multiply.4173.2 = fmul float %Arg_5.670, %Arg_0.172.2
  %55 = lshr i32 %.frozen247, 2
  %56 = urem i32 %55, 100
  %57 = zext i32 %56 to i64
  %Arg_0.174.2 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %48, i64 %53, i64 %57
  %Arg_0.175.2 = load float, ptr addrspace(1) %Arg_0.174.2, align 4, !invariant.load !47
  %58 = getelementptr inbounds float, ptr addrspace(1) %41, i64 64
  store float %Arg_0.175.2, ptr addrspace(1) %58, align 4
  %59 = getelementptr inbounds float, ptr addrspace(1) %43, i64 64
  store float %multiply.4173.2, ptr addrspace(1) %59, align 4
  %x_loc42.3 = or i32 %0, 96
  %60 = icmp ult i32 %x_loc42.3, 100
  br i1 %60, label %x_in_tile-true.3, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after182, %reduction_write_output-true186, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %x_in_tile-after.15, %intra_warp_reduce_write-true
  %61 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %62 = lshr i32 %5, 2
  %63 = zext i32 %62 to i64
  %64 = and i32 %5, 3
  %65 = zext i32 %64 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg6261, i64 0, i64 %63, i64 %65
  %66 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 %125, i64 0, i64 %30
  br i1 %61, label %reduction_write_output-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  %67 = icmp eq i32 %2, 0
  %68 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result2.1.3, i32 16, i32 31)
  %add.22.i = fadd float %partial_reduction_result2.1.3, %68
  %69 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i, i32 8, i32 31)
  %add.22.i219 = fadd float %add.22.i, %69
  %70 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i219, i32 4, i32 31)
  %add.22.i220 = fadd float %add.22.i219, %70
  %71 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i220, i32 2, i32 31)
  %add.22.i221 = fadd float %add.22.i220, %71
  %72 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i221, i32 1, i32 31)
  %73 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i64 0, i64 %125, i64 0, i64 0
  %add.22.i222 = fadd float %add.22.i221, %72
  br i1 %67, label %intra_warp_reduce_write-true106, label %intra_warp_reduce_write-after107

intra_warp_reduce_write-after107:                 ; preds = %intra_warp_reduce_write-true106, %inter_warp_reduce-after
  %74 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address113 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg7263, i64 0, i64 %63, i64 %65
  %75 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i64 0, i64 %125, i64 0, i64 %30
  br i1 %74, label %reduction_write_output-true111, label %inter_warp_reduce-after109

inter_warp_reduce-after109:                       ; preds = %intra_warp_reduce_write-after107, %reduction_write_output-true111
  %76 = icmp eq i32 %2, 0
  %77 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result5.1.3, i32 16, i32 31)
  %add.30.i = fadd float %partial_reduction_result5.1.3, %77
  %78 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.30.i, i32 8, i32 31)
  %add.30.i223 = fadd float %add.30.i, %78
  %79 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.30.i223, i32 4, i32 31)
  %add.30.i224 = fadd float %add.30.i223, %79
  %80 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.30.i224, i32 2, i32 31)
  %add.30.i225 = fadd float %add.30.i224, %80
  %81 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.30.i225, i32 1, i32 31)
  %82 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i64 0, i64 %125, i64 0, i64 0
  %add.30.i226 = fadd float %add.30.i225, %81
  br i1 %76, label %intra_warp_reduce_write-true131, label %intra_warp_reduce_write-after132

intra_warp_reduce_write-after132:                 ; preds = %intra_warp_reduce_write-true131, %inter_warp_reduce-after109
  %83 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address138 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg8265, i64 0, i64 %63, i64 %65
  %84 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i64 0, i64 %125, i64 0, i64 %30
  br i1 %83, label %reduction_write_output-true136, label %inter_warp_reduce-after134

inter_warp_reduce-after134:                       ; preds = %intra_warp_reduce_write-after132, %reduction_write_output-true136
  %85 = icmp eq i32 %2, 0
  %86 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result8.1.3, i32 16, i32 31)
  %add.38.i = fadd float %partial_reduction_result8.1.3, %86
  %87 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.38.i, i32 8, i32 31)
  %add.38.i227 = fadd float %add.38.i, %87
  %88 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.38.i227, i32 4, i32 31)
  %add.38.i228 = fadd float %add.38.i227, %88
  %89 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.38.i228, i32 2, i32 31)
  %add.38.i229 = fadd float %add.38.i228, %89
  %90 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.38.i229, i32 1, i32 31)
  %91 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache5, i64 0, i64 %125, i64 0, i64 0
  %add.38.i230 = fadd float %add.38.i229, %90
  br i1 %85, label %intra_warp_reduce_write-true156, label %intra_warp_reduce_write-after157

intra_warp_reduce_write-after157:                 ; preds = %intra_warp_reduce_write-true156, %inter_warp_reduce-after134
  %92 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address163 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg9267, i64 0, i64 %63, i64 %65
  %93 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache5, i64 0, i64 %125, i64 0, i64 %30
  br i1 %92, label %reduction_write_output-true161, label %inter_warp_reduce-after159

inter_warp_reduce-after159:                       ; preds = %intra_warp_reduce_write-after157, %reduction_write_output-true161
  %94 = icmp eq i32 %2, 0
  %95 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result11.1.3, i32 16, i32 31)
  %add.48.i = fadd float %partial_reduction_result11.1.3, %95
  %96 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.48.i, i32 8, i32 31)
  %add.48.i231 = fadd float %add.48.i, %96
  %97 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.48.i231, i32 4, i32 31)
  %add.48.i232 = fadd float %add.48.i231, %97
  %98 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.48.i232, i32 2, i32 31)
  %add.48.i233 = fadd float %add.48.i232, %98
  %99 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.48.i233, i32 1, i32 31)
  %100 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache6, i64 0, i64 %125, i64 0, i64 0
  %add.48.i234 = fadd float %add.48.i233, %99
  br i1 %94, label %intra_warp_reduce_write-true181, label %intra_warp_reduce_write-after182

intra_warp_reduce_write-after182:                 ; preds = %intra_warp_reduce_write-true181, %inter_warp_reduce-after159
  %101 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address188 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg12273, i64 0, i64 %63, i64 %65
  %102 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache6, i64 0, i64 %125, i64 0, i64 %30
  br i1 %101, label %reduction_write_output-true186, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header37.preheader
  %103 = add nuw nsw i32 %x_loc42.3, %7
  %104 = urem i32 %103, 100
  %.frozen248 = freeze i32 %103
  %105 = udiv i32 %.frozen248, 400
  %106 = zext i32 %105 to i64
  %107 = zext i32 %104 to i64
  %Arg_1.243.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1251, i64 0, i64 %106, i64 %107, i64 0
  %Arg_1.244.3 = load float, ptr addrspace(1) %Arg_1.243.3, align 4, !invariant.load !47
  %108 = zext i32 %103 to i64
  %Arg_0.145.3 = getelementptr inbounds float, ptr addrspace(1) %arg0249, i64 %108
  %Arg_0.146.3 = load float, ptr addrspace(1) %Arg_0.145.3, align 4, !invariant.load !47
  %multiply.947.3 = fmul float %Arg_1.244.3, %Arg_0.146.3
  %add.14.i235.3 = fadd float %add.14.i235.2, %multiply.947.3
  %Arg_2.349.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2253, i64 0, i64 %106, i64 %107, i64 0
  %Arg_2.350.3 = load float, ptr addrspace(1) %Arg_2.349.3, align 4, !invariant.load !47
  %multiply.1853.3 = fmul float %Arg_0.146.3, %Arg_2.350.3
  %add.22.i236.3 = fadd float %add.22.i236.2, %multiply.1853.3
  %Arg_3.455.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3255, i64 0, i64 %106, i64 %107, i64 0
  %Arg_3.456.3 = load float, ptr addrspace(1) %Arg_3.455.3, align 4, !invariant.load !47
  %multiply.2659.3 = fmul float %Arg_0.146.3, %Arg_3.456.3
  %add.30.i237.3 = fadd float %add.30.i237.2, %multiply.2659.3
  %Arg_4.561.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4257, i64 0, i64 %106, i64 %107, i64 0
  %Arg_4.562.3 = load float, ptr addrspace(1) %Arg_4.561.3, align 4, !invariant.load !47
  %multiply.3465.3 = fmul float %Arg_0.146.3, %Arg_4.562.3
  %add.38.i238.3 = fadd float %add.38.i238.2, %multiply.3465.3
  %add.48.i239.3 = fadd float %add.48.i239.2, %Arg_0.146.3
  %109 = mul i32 %105, 400
  %urem.3.decomposed = sub i32 %.frozen248, %109
  %110 = and i32 %urem.3.decomposed, 3
  %111 = lshr i32 %urem.3.decomposed, 2
  %112 = zext i32 %110 to i64
  %113 = zext i32 %111 to i64
  %Arg_0.171.3 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %106, i64 %112, i64 %113
  %Arg_0.172.3 = load float, ptr addrspace(1) %Arg_0.171.3, align 4, !invariant.load !47
  %multiply.4173.3 = fmul float %Arg_5.670, %Arg_0.172.3
  %114 = lshr i32 %.frozen248, 2
  %115 = urem i32 %114, 100
  %116 = zext i32 %115 to i64
  %Arg_0.174.3 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg0249, i64 0, i64 %106, i64 %112, i64 %116
  %Arg_0.175.3 = load float, ptr addrspace(1) %Arg_0.174.3, align 4, !invariant.load !47
  %117 = getelementptr inbounds float, ptr addrspace(1) %arg11271, i64 %108
  store float %Arg_0.175.3, ptr addrspace(1) %117, align 4
  %118 = getelementptr inbounds float, ptr addrspace(1) %arg10269, i64 %108
  store float %multiply.4173.3, ptr addrspace(1) %118, align 4
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header37.preheader
  %partial_reduction_result5.1.3 = phi float [ %add.30.i237.3, %x_in_tile-true.3 ], [ %add.30.i237.2, %tile_loop.loop_header37.preheader ]
  %partial_reduction_result2.1.3 = phi float [ %add.22.i236.3, %x_in_tile-true.3 ], [ %add.22.i236.2, %tile_loop.loop_header37.preheader ]
  %partial_reduction_result8.1.3 = phi float [ %add.38.i238.3, %x_in_tile-true.3 ], [ %add.38.i238.2, %tile_loop.loop_header37.preheader ]
  %partial_reduction_result.1.3 = phi float [ %add.14.i235.3, %x_in_tile-true.3 ], [ %add.14.i235.2, %tile_loop.loop_header37.preheader ]
  %partial_reduction_result11.1.3 = phi float [ %add.48.i239.3, %x_in_tile-true.3 ], [ %add.48.i239.2, %tile_loop.loop_header37.preheader ]
  %119 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %add.14.i = fadd float %partial_reduction_result.1.3, %119
  %120 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i, i32 8, i32 31)
  %add.14.i215 = fadd float %add.14.i, %120
  %121 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i215, i32 4, i32 31)
  %add.14.i216 = fadd float %add.14.i215, %121
  %122 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i216, i32 2, i32 31)
  %add.14.i217 = fadd float %add.14.i216, %122
  %123 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i217, i32 1, i32 31)
  %124 = icmp eq i32 %2, 0
  %125 = zext i32 %3 to i64
  %126 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 %125, i64 0, i64 0
  %add.14.i218 = fadd float %add.14.i217, %123
  br i1 %124, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.14.i218, ptr addrspace(3) %126, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %66, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %inter_warp_reduce-after

intra_warp_reduce_write-true106:                  ; preds = %inter_warp_reduce-after
  store float %add.22.i222, ptr addrspace(3) %73, align 4
  br label %intra_warp_reduce_write-after107

reduction_write_output-true111:                   ; preds = %intra_warp_reduce_write-after107
  %output114.then.val = load float, ptr addrspace(3) %75, align 4
  store float %output114.then.val, ptr addrspace(1) %output_element_address113, align 4
  br label %inter_warp_reduce-after109

intra_warp_reduce_write-true131:                  ; preds = %inter_warp_reduce-after109
  store float %add.30.i226, ptr addrspace(3) %82, align 4
  br label %intra_warp_reduce_write-after132

reduction_write_output-true136:                   ; preds = %intra_warp_reduce_write-after132
  %output139.then.val = load float, ptr addrspace(3) %84, align 4
  store float %output139.then.val, ptr addrspace(1) %output_element_address138, align 4
  br label %inter_warp_reduce-after134

intra_warp_reduce_write-true156:                  ; preds = %inter_warp_reduce-after134
  store float %add.38.i230, ptr addrspace(3) %91, align 4
  br label %intra_warp_reduce_write-after157

reduction_write_output-true161:                   ; preds = %intra_warp_reduce_write-after157
  %output164.then.val = load float, ptr addrspace(3) %93, align 4
  store float %output164.then.val, ptr addrspace(1) %output_element_address163, align 4
  br label %inter_warp_reduce-after159

intra_warp_reduce_write-true181:                  ; preds = %inter_warp_reduce-after159
  store float %add.48.i234, ptr addrspace(3) %100, align 4
  br label %intra_warp_reduce_write-after182

reduction_write_output-true186:                   ; preds = %intra_warp_reduce_write-after182
  %output189.then.val = load float, ptr addrspace(3) %102, align 4
  store float %output189.then.val, ptr addrspace(1) %output_element_address188, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg7) local_unnamed_addr #2 {
entry:
  %arg7254 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6252 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5250 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4248 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3246 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2244 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1242 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0240 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !56
  switch i32 %0, label %entry.unreachabledefault [
    i32 0, label %reduce-group-0-true
    i32 1, label %reduce-group-1-true
    i32 2, label %entry.reduce-group-2-true_crit_edge
    i32 3, label %entry.reduce-group-3-true_crit_edge
  ]

entry.reduce-group-2-true_crit_edge:              ; preds = %entry
  %.pre = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %.pre225 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %.pre227 = and i32 %.pre225, 31
  %.pre228 = lshr i32 %.pre225, 5
  %1 = shl i32 %.pre, 9
  %2 = shl nuw nsw i32 %.pre228, 2
  %3 = add i32 %1, %2
  %4 = add i32 %3, %.pre227
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 2
  %scevgep267 = getelementptr i8, ptr addrspace(1) %arg2244, i64 %6
  %7 = add nuw nsw i32 %.pre228, -32
  br label %y_in_tile.loop_body83

entry.reduce-group-3-true_crit_edge:              ; preds = %entry
  %.pre229 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %.pre231 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %.pre233 = and i32 %.pre231, 31
  %.pre234 = lshr i32 %.pre231, 5
  %8 = shl nuw nsw i32 %.pre229, 9
  %9 = or i32 %8, %.pre233
  %10 = shl i32 %.pre234, 2
  %11 = add i32 %9, %10
  %12 = add i32 %.pre234, -32
  br label %y_in_tile.loop_body134

entry.unreachabledefault:                         ; preds = %entry
  unreachable

common.ret.sink.split:                            ; preds = %y_in_tile.loop_exit132, %y_in_tile.loop_exit30, %y_in_tile.loop_exit
  %.sink239 = phi i32 [ %19, %y_in_tile.loop_exit ], [ %39, %y_in_tile.loop_exit30 ], [ %.pre231, %y_in_tile.loop_exit132 ]
  %.sink238 = phi i32 [ %18, %y_in_tile.loop_exit ], [ %38, %y_in_tile.loop_exit30 ], [ %.pre229, %y_in_tile.loop_exit132 ]
  %thread_id.y23173.sink = phi i32 [ %thread_id.y174, %y_in_tile.loop_exit ], [ %thread_id.y23173, %y_in_tile.loop_exit30 ], [ %.pre234, %y_in_tile.loop_exit132 ]
  %arg5.sink = phi ptr addrspace(1) [ %arg4248, %y_in_tile.loop_exit ], [ %arg5250, %y_in_tile.loop_exit30 ], [ %arg7254, %y_in_tile.loop_exit132 ]
  %add.16.i202.sink = phi float [ %add.10.i197, %y_in_tile.loop_exit ], [ %add.16.i202, %y_in_tile.loop_exit30 ], [ %add.28.i212, %y_in_tile.loop_exit132 ]
  %13 = lshr i32 %.sink239, 7
  %14 = add nuw nsw i32 %13, %.sink238
  %15 = zext i32 %14 to i64
  %16 = and i32 %thread_id.y23173.sink, 3
  %17 = zext i32 %16 to i64
  %output_element_address67 = getelementptr inbounds [64 x [4 x float]], ptr addrspace(1) %arg5.sink, i64 0, i64 %15, i64 %17
  store float %add.16.i202.sink, ptr addrspace(1) %output_element_address67, align 4
  br label %common.ret

common.ret:                                       ; preds = %reduction_write_output-after117, %common.ret.sink.split, %y_in_tile.loop_exit30, %y_in_tile.loop_exit, %y_in_tile.loop_exit132
  ret void

reduce-group-0-true:                              ; preds = %entry
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %thread_id.x = and i32 %19, 31
  %thread_id.y174 = lshr i32 %19, 5
  %20 = shl i32 %18, 9
  %21 = shl nuw nsw i32 %thread_id.y174, 2
  %22 = add i32 %20, %21
  %23 = add i32 %22, %thread_id.x
  %24 = zext i32 %23 to i64
  %25 = shl nuw nsw i64 %24, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg0240, i64 %25
  %26 = add nuw nsw i32 %thread_id.y174, -32
  br label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %reduce-group-0-true, %x_in_tile-after
  %lsr.iv257 = phi i32 [ %26, %reduce-group-0-true ], [ %lsr.iv.next, %x_in_tile-after ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %reduce-group-0-true ], [ %scevgep256, %x_in_tile-after ]
  %partial_reduction_result.0222 = phi float [ 0.000000e+00, %reduce-group-0-true ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %27 = icmp ult i32 %thread_id.x, 4
  br i1 %27, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.10.i198, %x_in_tile-true ], [ %partial_reduction_result.0222, %y_in_tile.loop_body ]
  %scevgep256 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 512
  %lsr.iv.next = add nsw i32 %lsr.iv257, 32
  %28 = icmp ugt i32 %lsr.iv.next, 95
  br i1 %28, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %29 = zext i32 %thread_id.x to i64
  %30 = zext i32 %thread_id.y174 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i64 0, i64 0, i64 0, i64 %29, i64 %30
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i64 0, i64 0, i64 0, i64 %30, i64 %29
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %31 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.10.i = fadd float %partial_reduction_result4, %31
  %32 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i, i32 8, i32 31)
  %add.10.i194 = fadd float %add.10.i, %32
  %33 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i194, i32 4, i32 31)
  %add.10.i195 = fadd float %add.10.i194, %33
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i195, i32 2, i32 31)
  %add.10.i196 = fadd float %add.10.i195, %34
  %35 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i196, i32 1, i32 31)
  %add.10.i197 = fadd float %add.10.i196, %35
  store float %add.10.i197, ptr addrspace(3) %shmem_transposed_addr, align 4
  %36 = and i32 %19, 927
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %common.ret.sink.split, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_0.13 = load float, ptr addrspace(1) %lsr.iv, align 4, !invariant.load !47
  %add.10.i198 = fadd float %partial_reduction_result.0222, %Arg_0.13
  br label %x_in_tile-after

reduce-group-1-true:                              ; preds = %entry
  %38 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %39 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %thread_id.x22 = and i32 %39, 31
  %thread_id.y23173 = lshr i32 %39, 5
  %40 = shl i32 %38, 9
  %41 = shl nuw nsw i32 %thread_id.y23173, 2
  %42 = add i32 %40, %41
  %43 = add i32 %42, %thread_id.x22
  %44 = zext i32 %43 to i64
  %45 = shl nuw nsw i64 %44, 2
  %scevgep258 = getelementptr i8, ptr addrspace(1) %arg1242, i64 %45
  %46 = add nuw nsw i32 %thread_id.y23173, -32
  br label %y_in_tile.loop_body32

y_in_tile.loop_body32:                            ; preds = %reduce-group-1-true, %x_in_tile-after44
  %lsr.iv261 = phi i32 [ %46, %reduce-group-1-true ], [ %lsr.iv.next262, %x_in_tile-after44 ]
  %lsr.iv259 = phi ptr addrspace(1) [ %scevgep258, %reduce-group-1-true ], [ %scevgep260, %x_in_tile-after44 ]
  %partial_reduction_result19.0214 = phi float [ 0.000000e+00, %reduce-group-1-true ], [ %partial_reduction_result19.1, %x_in_tile-after44 ]
  %47 = icmp ult i32 %thread_id.x22, 4
  br i1 %47, label %x_in_tile-true43, label %x_in_tile-after44

x_in_tile-after44:                                ; preds = %x_in_tile-true43, %y_in_tile.loop_body32
  %partial_reduction_result19.1 = phi float [ %add.16.i203, %x_in_tile-true43 ], [ %partial_reduction_result19.0214, %y_in_tile.loop_body32 ]
  %scevgep260 = getelementptr i8, ptr addrspace(1) %lsr.iv259, i64 512
  %lsr.iv.next262 = add nsw i32 %lsr.iv261, 32
  %48 = icmp ugt i32 %lsr.iv.next262, 95
  br i1 %48, label %y_in_tile.loop_exit30, label %y_in_tile.loop_body32

y_in_tile.loop_exit30:                            ; preds = %x_in_tile-after44
  %49 = zext i32 %thread_id.x22 to i64
  %50 = zext i32 %thread_id.y23173 to i64
  %shmem_output_address47 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i64 0, i64 0, i64 0, i64 %49, i64 %50
  store float %partial_reduction_result19.1, ptr addrspace(3) %shmem_output_address47, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr49 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i64 0, i64 0, i64 0, i64 %50, i64 %49
  %partial_reduction_result51 = load float, ptr addrspace(3) %shmem_transposed_addr49, align 4
  %51 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  %add.16.i = fadd float %partial_reduction_result51, %51
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i, i32 8, i32 31)
  %add.16.i199 = fadd float %add.16.i, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i199, i32 4, i32 31)
  %add.16.i200 = fadd float %add.16.i199, %53
  %54 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i200, i32 2, i32 31)
  %add.16.i201 = fadd float %add.16.i200, %54
  %55 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i201, i32 1, i32 31)
  %add.16.i202 = fadd float %add.16.i201, %55
  store float %add.16.i202, ptr addrspace(3) %shmem_transposed_addr49, align 4
  %56 = and i32 %39, 927
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %common.ret.sink.split, label %common.ret

x_in_tile-true43:                                 ; preds = %y_in_tile.loop_body32
  %Arg_1.245 = load float, ptr addrspace(1) %lsr.iv259, align 4, !invariant.load !47
  %add.16.i203 = fadd float %partial_reduction_result19.0214, %Arg_1.245
  br label %x_in_tile-after44

y_in_tile.loop_body83:                            ; preds = %entry.reduce-group-2-true_crit_edge, %x_in_tile-after95
  %lsr.iv270 = phi i32 [ %7, %entry.reduce-group-2-true_crit_edge ], [ %lsr.iv.next271, %x_in_tile-after95 ]
  %lsr.iv268 = phi ptr addrspace(1) [ %scevgep267, %entry.reduce-group-2-true_crit_edge ], [ %scevgep269, %x_in_tile-after95 ]
  %partial_reduction_result70.0216 = phi float [ 0.000000e+00, %entry.reduce-group-2-true_crit_edge ], [ %partial_reduction_result70.1, %x_in_tile-after95 ]
  %58 = icmp ult i32 %.pre227, 4
  br i1 %58, label %x_in_tile-true94, label %x_in_tile-after95

x_in_tile-after95:                                ; preds = %x_in_tile-true94, %y_in_tile.loop_body83
  %partial_reduction_result70.1 = phi float [ %add.22.i208, %x_in_tile-true94 ], [ %partial_reduction_result70.0216, %y_in_tile.loop_body83 ]
  %scevgep269 = getelementptr i8, ptr addrspace(1) %lsr.iv268, i64 512
  %lsr.iv.next271 = add nsw i32 %lsr.iv270, 32
  %59 = icmp ugt i32 %lsr.iv.next271, 95
  br i1 %59, label %y_in_tile.loop_exit81, label %y_in_tile.loop_body83

y_in_tile.loop_exit81:                            ; preds = %x_in_tile-after95
  %60 = zext i32 %.pre227 to i64
  %61 = zext i32 %.pre228 to i64
  %shmem_output_address98 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %60, i64 %61
  store float %partial_reduction_result70.1, ptr addrspace(3) %shmem_output_address98, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr100 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i64 0, i64 0, i64 0, i64 %61, i64 %60
  %partial_reduction_result102 = load float, ptr addrspace(3) %shmem_transposed_addr100, align 4
  %62 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result102, i32 16, i32 31)
  %add.22.i = fadd float %partial_reduction_result102, %62
  %63 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i, i32 8, i32 31)
  %add.22.i204 = fadd float %add.22.i, %63
  %64 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i204, i32 4, i32 31)
  %add.22.i205 = fadd float %add.22.i204, %64
  %65 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i205, i32 2, i32 31)
  %add.22.i206 = fadd float %add.22.i205, %65
  %66 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.22.i206, i32 1, i32 31)
  %add.22.i207 = fadd float %add.22.i206, %66
  store float %add.22.i207, ptr addrspace(3) %shmem_transposed_addr100, align 4
  %67 = and i32 %.pre225, 927
  %68 = icmp eq i32 %67, 0
  %69 = lshr i32 %.pre225, 7
  %70 = add nuw nsw i32 %69, %.pre
  %71 = zext i32 %70 to i64
  %72 = and i32 %.pre228, 3
  %73 = zext i32 %72 to i64
  %output_element_address118 = getelementptr inbounds [64 x [4 x float]], ptr addrspace(1) %arg6252, i64 0, i64 %71, i64 %73
  br i1 %68, label %reduction_write_output-true116, label %reduction_write_output-after117

reduction_write_output-after117:                  ; preds = %reduction_write_output-true116, %y_in_tile.loop_exit81
  br label %common.ret

x_in_tile-true94:                                 ; preds = %y_in_tile.loop_body83
  %Arg_2.396 = load float, ptr addrspace(1) %lsr.iv268, align 4, !invariant.load !47
  %add.22.i208 = fadd float %partial_reduction_result70.0216, %Arg_2.396
  br label %x_in_tile-after95

reduction_write_output-true116:                   ; preds = %y_in_tile.loop_exit81
  store float %add.22.i207, ptr addrspace(1) %output_element_address118, align 4
  br label %reduction_write_output-after117

y_in_tile.loop_body134:                           ; preds = %entry.reduce-group-3-true_crit_edge, %x_in_tile-after146
  %lsr.iv265 = phi i32 [ %12, %entry.reduce-group-3-true_crit_edge ], [ %lsr.iv.next266, %x_in_tile-after146 ]
  %lsr.iv263 = phi i32 [ %11, %entry.reduce-group-3-true_crit_edge ], [ %lsr.iv.next264, %x_in_tile-after146 ]
  %partial_reduction_result121.0219 = phi float [ 0.000000e+00, %entry.reduce-group-3-true_crit_edge ], [ %partial_reduction_result121.1, %x_in_tile-after146 ]
  %74 = icmp ult i32 %.pre233, 4
  %75 = zext i32 %lsr.iv263 to i64
  %Arg_3.4 = getelementptr inbounds float, ptr addrspace(1) %arg3246, i64 %75
  br i1 %74, label %x_in_tile-true145, label %x_in_tile-after146

x_in_tile-after146:                               ; preds = %x_in_tile-true145, %y_in_tile.loop_body134
  %partial_reduction_result121.1 = phi float [ %add.28.i213, %x_in_tile-true145 ], [ %partial_reduction_result121.0219, %y_in_tile.loop_body134 ]
  %lsr.iv.next264 = add i32 %lsr.iv263, 128
  %lsr.iv.next266 = add i32 %lsr.iv265, 32
  %76 = icmp ugt i32 %lsr.iv.next266, 95
  br i1 %76, label %y_in_tile.loop_exit132, label %y_in_tile.loop_body134

y_in_tile.loop_exit132:                           ; preds = %x_in_tile-after146
  %77 = zext i32 %.pre233 to i64
  %78 = zext i32 %.pre234 to i64
  %shmem_output_address149 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 0, i64 %77, i64 %78
  store float %partial_reduction_result121.1, ptr addrspace(3) %shmem_output_address149, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr151 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i64 0, i64 0, i64 0, i64 %78, i64 %77
  %partial_reduction_result153 = load float, ptr addrspace(3) %shmem_transposed_addr151, align 4
  %79 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result153, i32 16, i32 31)
  %add.28.i = fadd float %partial_reduction_result153, %79
  %80 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.28.i, i32 8, i32 31)
  %add.28.i209 = fadd float %add.28.i, %80
  %81 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.28.i209, i32 4, i32 31)
  %add.28.i210 = fadd float %add.28.i209, %81
  %82 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.28.i210, i32 2, i32 31)
  %add.28.i211 = fadd float %add.28.i210, %82
  %83 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.28.i211, i32 1, i32 31)
  %add.28.i212 = fadd float %add.28.i211, %83
  store float %add.28.i212, ptr addrspace(3) %shmem_transposed_addr151, align 4
  %84 = and i32 %.pre231, 927
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %common.ret.sink.split, label %common.ret

x_in_tile-true145:                                ; preds = %y_in_tile.loop_body134
  %Arg_3.4147 = load float, ptr addrspace(1) %Arg_3.4, align 4, !invariant.load !47
  %add.28.i213 = fadd float %partial_reduction_result121.0219, %Arg_3.4147
  br label %x_in_tile-after146
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg12) local_unnamed_addr #5 {
entry:
  %arg1259 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1157 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1055 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg953 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg851 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg749 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg647 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg545 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg443 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg341 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg239 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg137 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg035 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg035, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !47
  %4 = load float, ptr addrspace(1) %arg239, align 16, !invariant.load !47
  %5 = shl nuw nsw i64 %1, 2
  %6 = add nuw nsw i64 %5, 64
  %scevgep136 = getelementptr i8, ptr addrspace(1) %arg137, i64 %6
  br label %reduce.16.inner.loop_body.reduction_dim.0

reduce.16.inner.loop_body.reduction_dim.0:        ; preds = %reduce.16.inner.loop_body.reduction_dim.0, %entry
  %lsr.iv133 = phi i64 [ %lsr.iv.next134, %reduce.16.inner.loop_body.reduction_dim.0 ], [ 0, %entry ]
  %accumulator_0.025 = phi float [ 0.000000e+00, %entry ], [ %add.15.i.7, %reduce.16.inner.loop_body.reduction_dim.0 ]
  %scevgep138 = getelementptr i8, ptr addrspace(1) %scevgep136, i64 %lsr.iv133
  %scevgep139 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 -64
  %7 = load float, ptr addrspace(1) %scevgep139, align 4, !invariant.load !47
  %add.15.i = fadd float %accumulator_0.025, %7
  %scevgep142 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 -48
  %8 = load float, ptr addrspace(1) %scevgep142, align 4, !invariant.load !47
  %add.15.i.1 = fadd float %add.15.i, %8
  %scevgep144 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 -32
  %9 = load float, ptr addrspace(1) %scevgep144, align 4, !invariant.load !47
  %add.15.i.2 = fadd float %add.15.i.1, %9
  %scevgep145 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 -16
  %10 = load float, ptr addrspace(1) %scevgep145, align 4, !invariant.load !47
  %add.15.i.3 = fadd float %add.15.i.2, %10
  %11 = load float, ptr addrspace(1) %scevgep138, align 4, !invariant.load !47
  %add.15.i.4 = fadd float %add.15.i.3, %11
  %scevgep148 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 16
  %12 = load float, ptr addrspace(1) %scevgep148, align 4, !invariant.load !47
  %add.15.i.5 = fadd float %add.15.i.4, %12
  %scevgep147 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 32
  %13 = load float, ptr addrspace(1) %scevgep147, align 4, !invariant.load !47
  %add.15.i.6 = fadd float %add.15.i.5, %13
  %scevgep141 = getelementptr i8, ptr addrspace(1) %scevgep138, i64 48
  %14 = load float, ptr addrspace(1) %scevgep141, align 4, !invariant.load !47
  %add.15.i.7 = fadd float %add.15.i.6, %14
  %lsr.iv.next134 = add nuw nsw i64 %lsr.iv133, 128
  %tmp135 = trunc i64 %lsr.iv.next134 to i32
  %exitcond.7 = icmp eq i32 %tmp135, 1024
  br i1 %exitcond.7, label %reduce.16.inner.loop_exit.reduction_dim.0, label %reduce.16.inner.loop_body.reduction_dim.0

reduce.16.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.16.inner.loop_body.reduction_dim.0
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg341, i64 %1
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !47
  %scevgep120 = getelementptr i8, ptr addrspace(1) %arg443, i64 %6
  br label %reduce.24.inner.loop_body.reduction_dim.0

reduce.24.inner.loop_body.reduction_dim.0:        ; preds = %reduce.24.inner.loop_body.reduction_dim.0, %reduce.16.inner.loop_exit.reduction_dim.0
  %lsr.iv117 = phi i64 [ %lsr.iv.next118, %reduce.24.inner.loop_body.reduction_dim.0 ], [ 0, %reduce.16.inner.loop_exit.reduction_dim.0 ]
  %accumulator_02.027 = phi float [ 0.000000e+00, %reduce.16.inner.loop_exit.reduction_dim.0 ], [ %add.23.i.7, %reduce.24.inner.loop_body.reduction_dim.0 ]
  %scevgep122 = getelementptr i8, ptr addrspace(1) %scevgep120, i64 %lsr.iv117
  %scevgep123 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 -64
  %17 = load float, ptr addrspace(1) %scevgep123, align 4, !invariant.load !47
  %add.23.i = fadd float %accumulator_02.027, %17
  %scevgep126 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 -48
  %18 = load float, ptr addrspace(1) %scevgep126, align 4, !invariant.load !47
  %add.23.i.1 = fadd float %add.23.i, %18
  %scevgep128 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 -32
  %19 = load float, ptr addrspace(1) %scevgep128, align 4, !invariant.load !47
  %add.23.i.2 = fadd float %add.23.i.1, %19
  %scevgep129 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 -16
  %20 = load float, ptr addrspace(1) %scevgep129, align 4, !invariant.load !47
  %add.23.i.3 = fadd float %add.23.i.2, %20
  %21 = load float, ptr addrspace(1) %scevgep122, align 4, !invariant.load !47
  %add.23.i.4 = fadd float %add.23.i.3, %21
  %scevgep132 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 16
  %22 = load float, ptr addrspace(1) %scevgep132, align 4, !invariant.load !47
  %add.23.i.5 = fadd float %add.23.i.4, %22
  %scevgep131 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 32
  %23 = load float, ptr addrspace(1) %scevgep131, align 4, !invariant.load !47
  %add.23.i.6 = fadd float %add.23.i.5, %23
  %scevgep125 = getelementptr i8, ptr addrspace(1) %scevgep122, i64 48
  %24 = load float, ptr addrspace(1) %scevgep125, align 4, !invariant.load !47
  %add.23.i.7 = fadd float %add.23.i.6, %24
  %lsr.iv.next118 = add nuw nsw i64 %lsr.iv117, 128
  %tmp119 = trunc i64 %lsr.iv.next118 to i32
  %exitcond32.7 = icmp eq i32 %tmp119, 1024
  br i1 %exitcond32.7, label %reduce.24.inner.loop_exit.reduction_dim.0, label %reduce.24.inner.loop_body.reduction_dim.0

reduce.24.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.24.inner.loop_body.reduction_dim.0
  %25 = getelementptr inbounds float, ptr addrspace(1) %arg545, i64 %1
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !47
  %scevgep104 = getelementptr i8, ptr addrspace(1) %arg647, i64 %6
  br label %reduce.32.inner.loop_body.reduction_dim.0

reduce.32.inner.loop_body.reduction_dim.0:        ; preds = %reduce.32.inner.loop_body.reduction_dim.0, %reduce.24.inner.loop_exit.reduction_dim.0
  %lsr.iv101 = phi i64 [ %lsr.iv.next102, %reduce.32.inner.loop_body.reduction_dim.0 ], [ 0, %reduce.24.inner.loop_exit.reduction_dim.0 ]
  %accumulator_08.029 = phi float [ 0.000000e+00, %reduce.24.inner.loop_exit.reduction_dim.0 ], [ %add.31.i.7, %reduce.32.inner.loop_body.reduction_dim.0 ]
  %scevgep106 = getelementptr i8, ptr addrspace(1) %scevgep104, i64 %lsr.iv101
  %scevgep107 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 -64
  %27 = load float, ptr addrspace(1) %scevgep107, align 4, !invariant.load !47
  %add.31.i = fadd float %accumulator_08.029, %27
  %scevgep110 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 -48
  %28 = load float, ptr addrspace(1) %scevgep110, align 4, !invariant.load !47
  %add.31.i.1 = fadd float %add.31.i, %28
  %scevgep112 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 -32
  %29 = load float, ptr addrspace(1) %scevgep112, align 4, !invariant.load !47
  %add.31.i.2 = fadd float %add.31.i.1, %29
  %scevgep113 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 -16
  %30 = load float, ptr addrspace(1) %scevgep113, align 4, !invariant.load !47
  %add.31.i.3 = fadd float %add.31.i.2, %30
  %31 = load float, ptr addrspace(1) %scevgep106, align 4, !invariant.load !47
  %add.31.i.4 = fadd float %add.31.i.3, %31
  %scevgep116 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 16
  %32 = load float, ptr addrspace(1) %scevgep116, align 4, !invariant.load !47
  %add.31.i.5 = fadd float %add.31.i.4, %32
  %scevgep115 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 32
  %33 = load float, ptr addrspace(1) %scevgep115, align 4, !invariant.load !47
  %add.31.i.6 = fadd float %add.31.i.5, %33
  %scevgep109 = getelementptr i8, ptr addrspace(1) %scevgep106, i64 48
  %34 = load float, ptr addrspace(1) %scevgep109, align 4, !invariant.load !47
  %add.31.i.7 = fadd float %add.31.i.6, %34
  %lsr.iv.next102 = add nuw nsw i64 %lsr.iv101, 128
  %tmp103 = trunc i64 %lsr.iv.next102 to i32
  %exitcond33.7 = icmp eq i32 %tmp103, 1024
  br i1 %exitcond33.7, label %reduce.32.inner.loop_exit.reduction_dim.0, label %reduce.32.inner.loop_body.reduction_dim.0

reduce.32.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.32.inner.loop_body.reduction_dim.0
  %35 = getelementptr inbounds float, ptr addrspace(1) %arg749, i64 %1
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !47
  %scevgep = getelementptr i8, ptr addrspace(1) %arg851, i64 %6
  br label %reduce.40.inner.loop_body.reduction_dim.0

reduce.40.inner.loop_body.reduction_dim.0:        ; preds = %reduce.40.inner.loop_body.reduction_dim.0, %reduce.32.inner.loop_exit.reduction_dim.0
  %lsr.iv = phi i64 [ %lsr.iv.next, %reduce.40.inner.loop_body.reduction_dim.0 ], [ 0, %reduce.32.inner.loop_exit.reduction_dim.0 ]
  %accumulator_014.031 = phi float [ 0.000000e+00, %reduce.32.inner.loop_exit.reduction_dim.0 ], [ %add.39.i.7, %reduce.40.inner.loop_body.reduction_dim.0 ]
  %scevgep90 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %lsr.iv
  %scevgep91 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 -64
  %37 = load float, ptr addrspace(1) %scevgep91, align 4, !invariant.load !47
  %add.39.i = fadd float %accumulator_014.031, %37
  %scevgep94 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 -48
  %38 = load float, ptr addrspace(1) %scevgep94, align 4, !invariant.load !47
  %add.39.i.1 = fadd float %add.39.i, %38
  %scevgep96 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 -32
  %39 = load float, ptr addrspace(1) %scevgep96, align 4, !invariant.load !47
  %add.39.i.2 = fadd float %add.39.i.1, %39
  %scevgep97 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 -16
  %40 = load float, ptr addrspace(1) %scevgep97, align 4, !invariant.load !47
  %add.39.i.3 = fadd float %add.39.i.2, %40
  %41 = load float, ptr addrspace(1) %scevgep90, align 4, !invariant.load !47
  %add.39.i.4 = fadd float %add.39.i.3, %41
  %scevgep100 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 16
  %42 = load float, ptr addrspace(1) %scevgep100, align 4, !invariant.load !47
  %add.39.i.5 = fadd float %add.39.i.4, %42
  %scevgep99 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 32
  %43 = load float, ptr addrspace(1) %scevgep99, align 4, !invariant.load !47
  %add.39.i.6 = fadd float %add.39.i.5, %43
  %scevgep93 = getelementptr i8, ptr addrspace(1) %scevgep90, i64 48
  %44 = load float, ptr addrspace(1) %scevgep93, align 4, !invariant.load !47
  %add.39.i.7 = fadd float %add.39.i.6, %44
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 128
  %tmp = trunc i64 %lsr.iv.next to i32
  %exitcond34.7 = icmp eq i32 %tmp, 1024
  br i1 %exitcond34.7, label %reduce.40.inner.loop_exit.reduction_dim.0, label %reduce.40.inner.loop_body.reduction_dim.0

reduce.40.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.40.inner.loop_body.reduction_dim.0
  %multiply.33 = fmul float %4, %add.31.i.7
  %subtract.35 = fsub float %26, %multiply.33
  %multiply.25 = fmul float %4, %add.23.i.7
  %subtract.27 = fsub float %16, %multiply.25
  %multiply.17 = fmul float %4, %add.15.i.7
  %subtract.19 = fsub float %3, %multiply.17
  %multiply.41 = fmul float %4, %add.39.i.7
  %subtract.43 = fsub float %36, %multiply.41
  %45 = getelementptr inbounds float, ptr addrspace(1) %arg953, i64 %1
  store float %subtract.19, ptr addrspace(1) %45, align 4
  %46 = getelementptr inbounds float, ptr addrspace(1) %arg1055, i64 %1
  store float %subtract.27, ptr addrspace(1) %46, align 4
  %47 = getelementptr inbounds float, ptr addrspace(1) %arg1157, i64 %1
  store float %subtract.35, ptr addrspace(1) %47, align 4
  %48 = getelementptr inbounds float, ptr addrspace(1) %arg1259, i64 %1
  store float %subtract.43, ptr addrspace(1) %48, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_25(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(1024) %arg1) local_unnamed_addr #2 {
entry:
  %arg132 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg030 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %thread_id.x = and i32 %1, 31
  %thread_id.y18 = lshr i32 %1, 5
  %2 = shl i32 %0, 9
  %3 = shl nuw nsw i32 %thread_id.y18, 2
  %4 = add i32 %2, %3
  %5 = add i32 %4, %thread_id.x
  %6 = zext i32 %5 to i64
  %7 = shl nuw nsw i64 %6, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg030, i64 %7
  %8 = add nuw nsw i32 %thread_id.y18, -32
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %y_in_tile.loop_exit, %reduction_write_output-true
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv35 = phi i32 [ %8, %entry ], [ %lsr.iv.next, %x_in_tile-after ]
  %lsr.iv = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep34, %x_in_tile-after ]
  %partial_reduction_result.028 = phi float [ 0.000000e+00, %entry ], [ %partial_reduction_result.1, %x_in_tile-after ]
  %9 = icmp ult i32 %thread_id.x, 4
  br i1 %9, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %partial_reduction_result.1 = phi float [ %add.7.i27, %x_in_tile-true ], [ %partial_reduction_result.028, %y_in_tile.loop_body ]
  %scevgep34 = getelementptr i8, ptr addrspace(1) %lsr.iv, i64 512
  %lsr.iv.next = add nsw i32 %lsr.iv35, 32
  %10 = icmp ugt i32 %lsr.iv.next, 95
  br i1 %10, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %11 = zext i32 %thread_id.x to i64
  %12 = zext i32 %thread_id.y18 to i64
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i64 0, i64 0, i64 0, i64 %11, i64 %12
  store float %partial_reduction_result.1, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i64 0, i64 0, i64 0, i64 %12, i64 %11
  %partial_reduction_result4 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  %add.7.i = fadd float %partial_reduction_result4, %13
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i, i32 8, i32 31)
  %add.7.i23 = fadd float %add.7.i, %14
  %15 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i23, i32 4, i32 31)
  %add.7.i24 = fadd float %add.7.i23, %15
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i24, i32 2, i32 31)
  %add.7.i25 = fadd float %add.7.i24, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.7.i25, i32 1, i32 31)
  %add.7.i26 = fadd float %add.7.i25, %17
  store float %add.7.i26, ptr addrspace(3) %shmem_transposed_addr, align 4
  %18 = and i32 %1, 927
  %19 = icmp eq i32 %18, 0
  %20 = lshr i32 %1, 7
  %21 = add nuw nsw i32 %20, %0
  %22 = zext i32 %21 to i64
  %23 = and i32 %thread_id.y18, 3
  %24 = zext i32 %23 to i64
  %output_element_address = getelementptr inbounds [64 x [4 x float]], ptr addrspace(1) %arg132, i64 0, i64 %22, i64 %24
  br i1 %19, label %reduction_write_output-true, label %common.ret

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_0.13 = load float, ptr addrspace(1) %lsr.iv, align 4, !invariant.load !47
  %add.7.i27 = fadd float %partial_reduction_result.028, %Arg_0.13
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.7.i26, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @fusion_24(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg3) local_unnamed_addr #5 {
entry:
  %arg311 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !56
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg05, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !47
  %4 = load float, ptr addrspace(1) %arg29, align 16, !invariant.load !47
  %5 = shl nuw nsw i64 %1, 2
  %6 = add nuw nsw i64 %5, 64
  %scevgep = getelementptr i8, ptr addrspace(1) %arg17, i64 %6
  br label %reduce.10.inner.loop_body.reduction_dim.0

reduce.10.inner.loop_body.reduction_dim.0:        ; preds = %reduce.10.inner.loop_body.reduction_dim.0, %entry
  %lsr.iv = phi i64 [ %lsr.iv.next, %reduce.10.inner.loop_body.reduction_dim.0 ], [ 0, %entry ]
  %accumulator_0.04 = phi float [ 0.000000e+00, %entry ], [ %add.9.i.7, %reduce.10.inner.loop_body.reduction_dim.0 ]
  %scevgep21 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %lsr.iv
  %scevgep22 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 -64
  %7 = load float, ptr addrspace(1) %scevgep22, align 4, !invariant.load !47
  %add.9.i = fadd float %accumulator_0.04, %7
  %scevgep25 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 -48
  %8 = load float, ptr addrspace(1) %scevgep25, align 4, !invariant.load !47
  %add.9.i.1 = fadd float %add.9.i, %8
  %scevgep27 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 -32
  %9 = load float, ptr addrspace(1) %scevgep27, align 4, !invariant.load !47
  %add.9.i.2 = fadd float %add.9.i.1, %9
  %scevgep28 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 -16
  %10 = load float, ptr addrspace(1) %scevgep28, align 4, !invariant.load !47
  %add.9.i.3 = fadd float %add.9.i.2, %10
  %11 = load float, ptr addrspace(1) %scevgep21, align 4, !invariant.load !47
  %add.9.i.4 = fadd float %add.9.i.3, %11
  %scevgep31 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 16
  %12 = load float, ptr addrspace(1) %scevgep31, align 4, !invariant.load !47
  %add.9.i.5 = fadd float %add.9.i.4, %12
  %scevgep30 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 32
  %13 = load float, ptr addrspace(1) %scevgep30, align 4, !invariant.load !47
  %add.9.i.6 = fadd float %add.9.i.5, %13
  %scevgep24 = getelementptr i8, ptr addrspace(1) %scevgep21, i64 48
  %14 = load float, ptr addrspace(1) %scevgep24, align 4, !invariant.load !47
  %add.9.i.7 = fadd float %add.9.i.6, %14
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 128
  %tmp = trunc i64 %lsr.iv.next to i32
  %exitcond.7 = icmp eq i32 %tmp, 1024
  br i1 %exitcond.7, label %reduce.10.inner.loop_exit.reduction_dim.0, label %reduce.10.inner.loop_body.reduction_dim.0

reduce.10.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.10.inner.loop_body.reduction_dim.0
  %multiply.11 = fmul float %4, %add.9.i.7
  %subtract.12 = fsub float %3, %multiply.11
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg311, i64 %1
  store float %subtract.12, ptr addrspace(1) %15, align 4
  ret void
}

; Function Attrs: nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @fusion_19(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg8) local_unnamed_addr #6 {
entry:
  %arg8132 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7130 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6128 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5126 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4124 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3122 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2120 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0116 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !58
  %2 = lshr i32 %0, 2
  %3 = mul nuw nsw i32 %1, 24
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 819200
  br i1 %5, label %tile_loop.loop_header27.preheader, label %common.ret

tile_loop.loop_header27.preheader:                ; preds = %entry
  %6 = and i32 %0, 3
  %7 = zext i32 %4 to i64
  %8 = zext i32 %6 to i64
  %Arg_0.133 = getelementptr inbounds [819200 x [4 x float]], ptr addrspace(1) %arg0116, i64 0, i64 %7, i64 %8
  %Arg_0.134 = load float, ptr addrspace(1) %Arg_0.133, align 4, !invariant.load !47
  %Arg_1.235 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg1118, i64 0, i64 0, i64 %8
  %Arg_1.236 = load float, ptr addrspace(1) %Arg_1.235, align 4, !invariant.load !47
  %multiply.837 = fmul float %Arg_0.134, %Arg_1.236
  %add.13.i107 = fadd float %multiply.837, 0.000000e+00
  %Arg_2.341 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg2120, i64 0, i64 0, i64 %8
  %Arg_2.342 = load float, ptr addrspace(1) %Arg_2.341, align 4, !invariant.load !47
  %multiply.1743 = fmul float %Arg_0.134, %Arg_2.342
  %add.21.i108 = fadd float %multiply.1743, 0.000000e+00
  %Arg_3.447 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg3122, i64 0, i64 0, i64 %8
  %Arg_3.448 = load float, ptr addrspace(1) %Arg_3.447, align 4, !invariant.load !47
  %multiply.2549 = fmul float %Arg_0.134, %Arg_3.448
  %add.29.i109 = fadd float %multiply.2549, 0.000000e+00
  %Arg_4.553 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg4124, i64 0, i64 0, i64 %8
  %Arg_4.554 = load float, ptr addrspace(1) %Arg_4.553, align 4, !invariant.load !47
  %multiply.3355 = fmul float %Arg_0.134, %Arg_4.554
  %add.37.i110 = fadd float %multiply.3355, 0.000000e+00
  %9 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i107, i32 2, i32 31)
  %add.13.i = fadd float %add.13.i107, %9
  %10 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.13.i, i32 1, i32 31)
  %11 = icmp eq i32 %6, 0
  %output_element_address = getelementptr inbounds [819200 x float], ptr addrspace(1) %arg5126, i64 0, i64 %7
  %add.13.i103 = fadd float %add.13.i, %10
  br i1 %11, label %reduction_write_output-true, label %reduction_write_output-after

common.ret:                                       ; preds = %entry, %reduction_write_output-after81, %reduction_write_output-true91
  ret void

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %tile_loop.loop_header27.preheader
  %12 = icmp eq i32 %6, 0
  %13 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.21.i108, i32 2, i32 31)
  %add.21.i = fadd float %add.21.i108, %13
  %14 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.21.i, i32 1, i32 31)
  %output_element_address71 = getelementptr inbounds [819200 x float], ptr addrspace(1) %arg6128, i64 0, i64 %7
  %add.21.i104 = fadd float %add.21.i, %14
  br i1 %12, label %reduction_write_output-true69, label %reduction_write_output-after70

reduction_write_output-after70:                   ; preds = %reduction_write_output-true69, %reduction_write_output-after
  %15 = icmp eq i32 %6, 0
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.29.i109, i32 2, i32 31)
  %add.29.i = fadd float %add.29.i109, %16
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.29.i, i32 1, i32 31)
  %output_element_address82 = getelementptr inbounds [819200 x float], ptr addrspace(1) %arg7130, i64 0, i64 %7
  %add.29.i105 = fadd float %add.29.i, %17
  br i1 %15, label %reduction_write_output-true80, label %reduction_write_output-after81

reduction_write_output-after81:                   ; preds = %reduction_write_output-true80, %reduction_write_output-after70
  %18 = icmp eq i32 %6, 0
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.37.i110, i32 2, i32 31)
  %add.37.i = fadd float %add.37.i110, %19
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.37.i, i32 1, i32 31)
  %output_element_address93 = getelementptr inbounds [819200 x float], ptr addrspace(1) %arg8132, i64 0, i64 %7
  %add.37.i106 = fadd float %add.37.i, %20
  br i1 %18, label %reduction_write_output-true91, label %common.ret

reduction_write_output-true:                      ; preds = %tile_loop.loop_header27.preheader
  store float %add.13.i103, ptr addrspace(1) %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true69:                    ; preds = %reduction_write_output-after
  store float %add.21.i104, ptr addrspace(1) %output_element_address71, align 4
  br label %reduction_write_output-after70

reduction_write_output-true80:                    ; preds = %reduction_write_output-after70
  store float %add.29.i105, ptr addrspace(1) %output_element_address82, align 4
  br label %reduction_write_output-after81

reduction_write_output-true91:                    ; preds = %reduction_write_output-after81
  store float %add.37.i106, ptr addrspace(1) %output_element_address93, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_18(ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(3276800) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(3276800) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(3276800) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg12) local_unnamed_addr #0 {
entry:
  %arg1249 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1147 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1045 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg943 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg841 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg739 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg637 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg535 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg433 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg331 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg229 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg127 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg025 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !59
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg025, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !47
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg229, align 16, !invariant.load !47
  %12 = getelementptr float, ptr addrspace(1) %arg127, i64 %4
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !47
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %multiply.11 = fmul float %11, %14
  %subtract.13 = fsub float %7, %multiply.11
  %18 = getelementptr float, ptr addrspace(1) %arg331, i64 %4
  %19 = load <4 x float>, ptr addrspace(1) %18, align 16, !invariant.load !47
  %20 = extractelement <4 x float> %19, i32 0
  %21 = extractelement <4 x float> %19, i32 1
  %22 = extractelement <4 x float> %19, i32 2
  %23 = extractelement <4 x float> %19, i32 3
  %24 = getelementptr float, ptr addrspace(1) %arg433, i64 %4
  %25 = load <4 x float>, ptr addrspace(1) %24, align 16, !invariant.load !47
  %26 = extractelement <4 x float> %25, i32 0
  %27 = extractelement <4 x float> %25, i32 1
  %28 = extractelement <4 x float> %25, i32 2
  %29 = extractelement <4 x float> %25, i32 3
  %multiply.14 = fmul float %11, %26
  %subtract.16 = fsub float %20, %multiply.14
  %30 = getelementptr float, ptr addrspace(1) %arg535, i64 %4
  %31 = load <4 x float>, ptr addrspace(1) %30, align 16, !invariant.load !47
  %32 = extractelement <4 x float> %31, i32 0
  %33 = extractelement <4 x float> %31, i32 1
  %34 = extractelement <4 x float> %31, i32 2
  %35 = extractelement <4 x float> %31, i32 3
  %36 = getelementptr float, ptr addrspace(1) %arg637, i64 %4
  %37 = load <4 x float>, ptr addrspace(1) %36, align 16, !invariant.load !47
  %38 = extractelement <4 x float> %37, i32 0
  %39 = extractelement <4 x float> %37, i32 1
  %40 = extractelement <4 x float> %37, i32 2
  %41 = extractelement <4 x float> %37, i32 3
  %multiply.17 = fmul float %11, %38
  %subtract.19 = fsub float %32, %multiply.17
  %42 = getelementptr float, ptr addrspace(1) %arg739, i64 %4
  %43 = load <4 x float>, ptr addrspace(1) %42, align 16, !invariant.load !47
  %44 = extractelement <4 x float> %43, i32 0
  %45 = extractelement <4 x float> %43, i32 1
  %46 = extractelement <4 x float> %43, i32 2
  %47 = extractelement <4 x float> %43, i32 3
  %48 = getelementptr float, ptr addrspace(1) %arg841, i64 %4
  %49 = load <4 x float>, ptr addrspace(1) %48, align 16, !invariant.load !47
  %50 = extractelement <4 x float> %49, i32 0
  %51 = extractelement <4 x float> %49, i32 1
  %52 = extractelement <4 x float> %49, i32 2
  %53 = extractelement <4 x float> %49, i32 3
  %multiply.20 = fmul float %11, %50
  %subtract.22 = fsub float %44, %multiply.20
  %54 = getelementptr float, ptr addrspace(1) %arg943, i64 %4
  %55 = getelementptr float, ptr addrspace(1) %arg1045, i64 %4
  %56 = getelementptr float, ptr addrspace(1) %arg1147, i64 %4
  %57 = getelementptr float, ptr addrspace(1) %arg1249, i64 %4
  %multiply.111 = fmul float %11, %15
  %subtract.132 = fsub float %8, %multiply.111
  %multiply.143 = fmul float %11, %27
  %subtract.164 = fsub float %21, %multiply.143
  %multiply.175 = fmul float %11, %39
  %subtract.196 = fsub float %33, %multiply.175
  %multiply.207 = fmul float %11, %51
  %subtract.228 = fsub float %45, %multiply.207
  %multiply.119 = fmul float %11, %16
  %subtract.1310 = fsub float %9, %multiply.119
  %multiply.1411 = fmul float %11, %28
  %subtract.1612 = fsub float %22, %multiply.1411
  %multiply.1713 = fmul float %11, %40
  %subtract.1914 = fsub float %34, %multiply.1713
  %multiply.2015 = fmul float %11, %52
  %subtract.2216 = fsub float %46, %multiply.2015
  %multiply.1117 = fmul float %11, %17
  %subtract.1318 = fsub float %10, %multiply.1117
  %multiply.1419 = fmul float %11, %29
  %subtract.1620 = fsub float %23, %multiply.1419
  %multiply.1721 = fmul float %11, %41
  %subtract.1922 = fsub float %35, %multiply.1721
  %multiply.2023 = fmul float %11, %53
  %subtract.2224 = fsub float %47, %multiply.2023
  %58 = insertelement <4 x float> poison, float %subtract.13, i32 0
  %59 = insertelement <4 x float> %58, float %subtract.132, i32 1
  %60 = insertelement <4 x float> %59, float %subtract.1310, i32 2
  %61 = insertelement <4 x float> %60, float %subtract.1318, i32 3
  store <4 x float> %61, ptr addrspace(1) %54, align 16
  %62 = insertelement <4 x float> poison, float %subtract.16, i32 0
  %63 = insertelement <4 x float> %62, float %subtract.164, i32 1
  %64 = insertelement <4 x float> %63, float %subtract.1612, i32 2
  %65 = insertelement <4 x float> %64, float %subtract.1620, i32 3
  store <4 x float> %65, ptr addrspace(1) %55, align 16
  %66 = insertelement <4 x float> poison, float %subtract.19, i32 0
  %67 = insertelement <4 x float> %66, float %subtract.196, i32 1
  %68 = insertelement <4 x float> %67, float %subtract.1914, i32 2
  %69 = insertelement <4 x float> %68, float %subtract.1922, i32 3
  store <4 x float> %69, ptr addrspace(1) %56, align 16
  %70 = insertelement <4 x float> poison, float %subtract.22, i32 0
  %71 = insertelement <4 x float> %70, float %subtract.228, i32 1
  %72 = insertelement <4 x float> %71, float %subtract.2216, i32 2
  %73 = insertelement <4 x float> %72, float %subtract.2224, i32 3
  store <4 x float> %73, ptr addrspace(1) %57, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_27(ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(760217600) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg8) local_unnamed_addr #0 {
entry:
  %arg829 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg727 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg625 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 800
  %5 = lshr i32 %linear_index_base, 3
  %6 = urem i32 %5, 100
  %7 = and i32 %linear_index3, 7
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 6
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = and i32 %linear_index1, 5
  %10 = and i32 %3, 4
  %11 = zext i32 %linear_index_base to i64
  %12 = getelementptr float, ptr addrspace(1) %arg013, i64 %11
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !47
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %18 = load float, ptr addrspace(1) %arg115, align 16, !invariant.load !47
  %19 = mul nuw nsw i32 %4, 100
  %20 = add nuw nsw i32 %6, %19
  %21 = zext i32 %20 to i64
  %22 = zext i32 %10 to i64
  %23 = getelementptr [819200 x [232 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %22
  %24 = getelementptr inbounds float, ptr addrspace(1) %23, i64 152
  %25 = load <2 x float>, ptr addrspace(1) %24, align 16, !invariant.load !47
  %26 = extractelement <2 x float> %25, i32 0
  %27 = extractelement <2 x float> %25, i32 1
  %multiply.8 = fmul float %18, %26
  %subtract.9 = fsub float %14, %multiply.8
  %28 = getelementptr float, ptr addrspace(1) %arg319, i64 %11
  %29 = load <4 x float>, ptr addrspace(1) %28, align 16, !invariant.load !47
  %30 = extractelement <4 x float> %29, i32 0
  %31 = extractelement <4 x float> %29, i32 1
  %32 = extractelement <4 x float> %29, i32 2
  %33 = extractelement <4 x float> %29, i32 3
  %34 = getelementptr inbounds float, ptr addrspace(1) %23, i64 160
  %35 = load <2 x float>, ptr addrspace(1) %34, align 16, !invariant.load !47
  %36 = extractelement <2 x float> %35, i32 0
  %37 = extractelement <2 x float> %35, i32 1
  %multiply.11 = fmul float %18, %36
  %subtract.12 = fsub float %30, %multiply.11
  %38 = getelementptr inbounds float, ptr addrspace(1) %23, i64 144
  %39 = load <2 x float>, ptr addrspace(1) %38, align 16, !invariant.load !47
  %40 = extractelement <2 x float> %39, i32 0
  %41 = extractelement <2 x float> %39, i32 1
  %42 = getelementptr inbounds float, ptr addrspace(1) %23, i64 136
  %43 = load <2 x float>, ptr addrspace(1) %42, align 16, !invariant.load !47
  %44 = extractelement <2 x float> %43, i32 0
  %45 = extractelement <2 x float> %43, i32 1
  %46 = getelementptr inbounds float, ptr addrspace(1) %23, i64 128
  %47 = load <2 x float>, ptr addrspace(1) %46, align 16, !invariant.load !47
  %48 = extractelement <2 x float> %47, i32 0
  %49 = extractelement <2 x float> %47, i32 1
  %50 = getelementptr float, ptr addrspace(1) %arg421, i64 %11
  %51 = getelementptr float, ptr addrspace(1) %arg523, i64 %11
  %52 = getelementptr float, ptr addrspace(1) %arg625, i64 %11
  %53 = getelementptr float, ptr addrspace(1) %arg727, i64 %11
  %54 = getelementptr float, ptr addrspace(1) %arg829, i64 %11
  %55 = zext i32 %9 to i64
  %56 = getelementptr [819200 x [232 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %55
  %multiply.81 = fmul float %18, %27
  %subtract.92 = fsub float %15, %multiply.81
  %multiply.113 = fmul float %18, %37
  %subtract.124 = fsub float %31, %multiply.113
  %57 = zext i32 %8 to i64
  %58 = getelementptr [819200 x [232 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %57
  %59 = getelementptr inbounds float, ptr addrspace(1) %58, i64 152
  %60 = load float, ptr addrspace(1) %59, align 8, !invariant.load !47
  %multiply.85 = fmul float %18, %60
  %subtract.96 = fsub float %16, %multiply.85
  %61 = getelementptr inbounds float, ptr addrspace(1) %58, i64 160
  %62 = load float, ptr addrspace(1) %61, align 8, !invariant.load !47
  %multiply.117 = fmul float %18, %62
  %subtract.128 = fsub float %32, %multiply.117
  %63 = getelementptr inbounds float, ptr addrspace(1) %58, i64 144
  %64 = load float, ptr addrspace(1) %63, align 8, !invariant.load !47
  %65 = getelementptr inbounds float, ptr addrspace(1) %58, i64 136
  %66 = load float, ptr addrspace(1) %65, align 8, !invariant.load !47
  %67 = getelementptr inbounds float, ptr addrspace(1) %58, i64 128
  %68 = load float, ptr addrspace(1) %67, align 8, !invariant.load !47
  %69 = zext i32 %7 to i64
  %70 = getelementptr [819200 x [232 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %69
  %71 = getelementptr inbounds float, ptr addrspace(1) %70, i64 152
  %72 = load float, ptr addrspace(1) %71, align 4, !invariant.load !47
  %multiply.89 = fmul float %18, %72
  %subtract.910 = fsub float %17, %multiply.89
  %73 = getelementptr inbounds float, ptr addrspace(1) %70, i64 160
  %74 = load float, ptr addrspace(1) %73, align 4, !invariant.load !47
  %multiply.1111 = fmul float %18, %74
  %subtract.1212 = fsub float %33, %multiply.1111
  %75 = getelementptr inbounds float, ptr addrspace(1) %70, i64 144
  %76 = load float, ptr addrspace(1) %75, align 4, !invariant.load !47
  %77 = getelementptr inbounds float, ptr addrspace(1) %70, i64 136
  %78 = load float, ptr addrspace(1) %77, align 4, !invariant.load !47
  %79 = getelementptr inbounds float, ptr addrspace(1) %70, i64 128
  %80 = load float, ptr addrspace(1) %79, align 4, !invariant.load !47
  %81 = insertelement <4 x float> poison, float %subtract.9, i32 0
  %82 = insertelement <4 x float> %81, float %subtract.92, i32 1
  %83 = insertelement <4 x float> %82, float %subtract.96, i32 2
  %84 = insertelement <4 x float> %83, float %subtract.910, i32 3
  store <4 x float> %84, ptr addrspace(1) %50, align 16
  %85 = insertelement <4 x float> poison, float %subtract.12, i32 0
  %86 = insertelement <4 x float> %85, float %subtract.124, i32 1
  %87 = insertelement <4 x float> %86, float %subtract.128, i32 2
  %88 = insertelement <4 x float> %87, float %subtract.1212, i32 3
  store <4 x float> %88, ptr addrspace(1) %51, align 16
  %89 = insertelement <4 x float> poison, float %40, i32 0
  %90 = insertelement <4 x float> %89, float %41, i32 1
  %91 = insertelement <4 x float> %90, float %64, i32 2
  %92 = insertelement <4 x float> %91, float %76, i32 3
  store <4 x float> %92, ptr addrspace(1) %52, align 16
  %93 = insertelement <4 x float> poison, float %44, i32 0
  %94 = insertelement <4 x float> %93, float %45, i32 1
  %95 = insertelement <4 x float> %94, float %66, i32 2
  %96 = insertelement <4 x float> %95, float %78, i32 3
  store <4 x float> %96, ptr addrspace(1) %53, align 16
  %97 = insertelement <4 x float> poison, float %48, i32 0
  %98 = insertelement <4 x float> %97, float %49, i32 1
  %99 = insertelement <4 x float> %98, float %68, i32 2
  %100 = insertelement <4 x float> %99, float %80, i32 3
  store <4 x float> %100, ptr addrspace(1) %54, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_35(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(838860800) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg4) local_unnamed_addr #2 {
entry:
  %arg494 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg392 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg290 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg188 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg086 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %thread_id.x = and i32 %1, 31
  %thread_id.y59 = lshr i32 %1, 5
  %2 = lshr i32 %0, 2
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 192
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = mul nuw nsw i32 %2, 25600
  %6 = zext i32 %4 to i64
  %7 = add nuw nsw i32 %thread_id.y59, -32
  %8 = shl nuw nsw i32 %thread_id.y59, 8
  %9 = add i32 %5, %8
  %10 = add i32 %9, %tile_origin.2
  %11 = add i32 %10, %4
  %12 = zext i32 %11 to i64
  %13 = lshr i64 %12, 8
  %14 = shl nuw nsw i64 %13, 4
  %15 = lshr i32 %11, 6
  %16 = trunc i32 %15 to i2
  %17 = zext i2 %16 to i64
  %18 = shl nuw nsw i64 %17, 2
  %19 = add i64 %14, %18
  %20 = shl nuw nsw i64 %13, 10
  %21 = shl nuw nsw i64 %17, 8
  %22 = add i64 %20, %21
  %23 = trunc i32 %1 to i5
  %24 = zext i5 %23 to i64
  %25 = shl nuw nsw i64 %24, 3
  %26 = add i64 %22, %25
  %scevgep107 = getelementptr i8, ptr addrspace(1) %arg290, i64 %26
  %27 = lshr i32 %11, 8
  %28 = lshr i64 %12, 6
  %29 = shl nuw nsw i64 %28, 2
  %30 = add nuw nsw i64 %12, 1
  %31 = lshr i64 %30, 8
  %32 = shl nuw nsw i64 %31, 10
  %33 = add i32 %11, 1
  %34 = lshr i32 %33, 6
  %35 = trunc i32 %34 to i2
  %36 = zext i2 %35 to i64
  %37 = shl nuw nsw i64 %36, 8
  %38 = add i64 %32, %37
  %39 = add i64 %38, %25
  %40 = add i64 %39, 4
  %scevgep120 = getelementptr i8, ptr addrspace(1) %arg290, i64 %40
  %41 = shl nuw nsw i64 %31, 4
  %42 = shl nuw nsw i64 %36, 2
  %43 = add i64 %41, %42
  %44 = lshr i32 %33, 8
  %45 = lshr i64 %30, 6
  %46 = shl nuw nsw i64 %45, 2
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true54
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv138 = phi i32 [ %34, %entry ], [ %lsr.iv.next139, %y_in_tile.loop_body ]
  %lsr.iv135 = phi i64 [ %46, %entry ], [ %lsr.iv.next136, %y_in_tile.loop_body ]
  %lsr.iv133 = phi i32 [ %44, %entry ], [ %lsr.iv.next134, %y_in_tile.loop_body ]
  %lsr.iv128 = phi i64 [ %43, %entry ], [ %lsr.iv.next129, %y_in_tile.loop_body ]
  %lsr.iv125 = phi i64 [ %31, %entry ], [ %lsr.iv.next126, %y_in_tile.loop_body ]
  %lsr.iv123 = phi i64 [ %30, %entry ], [ %lsr.iv.next124, %y_in_tile.loop_body ]
  %lsr.iv121 = phi ptr addrspace(1) [ %scevgep120, %entry ], [ %scevgep122, %y_in_tile.loop_body ]
  %lsr.iv118 = phi i32 [ %15, %entry ], [ %lsr.iv.next119, %y_in_tile.loop_body ]
  %lsr.iv115 = phi i64 [ %29, %entry ], [ %lsr.iv.next116, %y_in_tile.loop_body ]
  %lsr.iv113 = phi i32 [ %27, %entry ], [ %lsr.iv.next114, %y_in_tile.loop_body ]
  %lsr.iv108 = phi ptr addrspace(1) [ %scevgep107, %entry ], [ %scevgep109, %y_in_tile.loop_body ]
  %lsr.iv105 = phi i64 [ %13, %entry ], [ %lsr.iv.next106, %y_in_tile.loop_body ]
  %lsr.iv103 = phi i64 [ %12, %entry ], [ %lsr.iv.next104, %y_in_tile.loop_body ]
  %lsr.iv101 = phi i64 [ %19, %entry ], [ %lsr.iv.next102, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ 0, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result58.sroa.4.083 = phi float [ 0.000000e+00, %entry ], [ %add.14.i71, %y_in_tile.loop_body ]
  %partial_reduction_result58.sroa.0.082 = phi float [ 0.000000e+00, %entry ], [ %add.14.i, %y_in_tile.loop_body ]
  %47 = trunc i64 %6 to i32
  %lsr142 = trunc i64 %lsr.iv103 to i32
  %lsr140 = trunc i64 %lsr.iv123 to i32
  %48 = udiv i64 %lsr.iv103, 25600
  %49 = mul nuw nsw i64 %48, 1600
  %50 = add i64 %lsr.iv101, %49
  %51 = udiv i64 %lsr.iv105, 100
  %52 = mul nuw nsw i64 %51, 1600
  %53 = sub i64 %50, %52
  %54 = mul nuw nsw i64 %48, 102400
  %55 = mul nuw nsw i64 %51, 102400
  %56 = sub i64 %54, %55
  %scevgep110 = getelementptr i8, ptr addrspace(1) %lsr.iv108, i64 %56
  %57 = udiv i32 %lsr142, 25600
  %58 = mul nuw nsw i32 %57, 100
  %59 = add i32 %27, %58
  %60 = udiv i32 %lsr.iv113, 100
  %61 = mul nuw nsw i32 %60, 100
  %62 = sub i32 %59, %61
  %63 = udiv i64 %lsr.iv123, 25600
  %64 = mul nuw nsw i64 %63, 102400
  %65 = udiv i64 %lsr.iv125, 100
  %66 = mul nuw nsw i64 %65, 102400
  %67 = sub i64 %64, %66
  %scevgep127 = getelementptr i8, ptr addrspace(1) %lsr.iv121, i64 %67
  %68 = mul nuw nsw i64 %63, 1600
  %69 = add i64 %lsr.iv128, %68
  %70 = mul nuw nsw i64 %65, 1600
  %71 = sub i64 %69, %70
  %72 = udiv i32 %lsr140, 25600
  %73 = mul nuw nsw i32 %72, 100
  %74 = add i32 %44, %73
  %75 = udiv i32 %lsr.iv133, 100
  %76 = mul nuw nsw i32 %75, 100
  %77 = sub i32 %74, %76
  %78 = and i32 %lsr.iv118, 3
  %79 = zext i32 %78 to i64
  %scevgep = getelementptr i8, ptr addrspace(1) %arg188, i64 %53
  %Arg_1.23 = load float, ptr addrspace(1) %scevgep, align 4, !invariant.load !47
  %Arg_2.34 = load float, ptr addrspace(1) %scevgep110, align 8, !invariant.load !47
  %multiply.9 = fmul float %Arg_1.23, %Arg_2.34
  %add.14.i = fadd float %partial_reduction_result58.sroa.0.082, %multiply.9
  %80 = shl nuw nsw i32 %78, 6
  %81 = or i32 %80, %47
  %82 = add i32 %lsr.iv, %62
  %83 = udiv i32 %82, 100
  %scevgep117 = getelementptr i8, ptr addrspace(1) %arg188, i64 %lsr.iv115
  %Arg_1.26 = load float, ptr addrspace(1) %scevgep117, align 4, !invariant.load !47
  %84 = zext i32 %83 to i64
  %Arg_0.1 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr addrspace(1) %arg086, i64 0, i64 %84, i64 0, i64 %79, i64 %6
  %Arg_0.17 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !47
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  %85 = zext i32 %82 to i64
  %86 = zext i32 %81 to i64
  %87 = getelementptr inbounds [819200 x [256 x float]], ptr addrspace(1) %arg392, i64 0, i64 %85, i64 %86
  store float %multiply.7, ptr addrspace(1) %87, align 8
  %88 = and i32 %lsr.iv138, 3
  %89 = zext i32 %88 to i64
  %scevgep130 = getelementptr i8, ptr addrspace(1) %arg188, i64 %71
  %Arg_1.212 = load float, ptr addrspace(1) %scevgep130, align 4, !invariant.load !47
  %Arg_2.314 = load float, ptr addrspace(1) %scevgep127, align 4, !invariant.load !47
  %multiply.915 = fmul float %Arg_1.212, %Arg_2.314
  %add.14.i71 = fadd float %partial_reduction_result58.sroa.4.083, %multiply.915
  %90 = shl nuw nsw i32 %88, 6
  %91 = add i32 %lsr.iv, %77
  %92 = udiv i32 %91, 100
  %scevgep137 = getelementptr i8, ptr addrspace(1) %arg188, i64 %lsr.iv135
  %Arg_1.218 = load float, ptr addrspace(1) %scevgep137, align 4, !invariant.load !47
  %93 = zext i32 %92 to i64
  %94 = getelementptr [8192 x [1 x [4 x [64 x float]]]], ptr addrspace(1) %arg086, i64 0, i64 %93, i64 0, i64 %89, i64 %6
  %Arg_0.11997 = getelementptr inbounds float, ptr addrspace(1) %94, i64 1
  %Arg_0.120 = load float, ptr addrspace(1) %Arg_0.11997, align 4, !invariant.load !47
  %multiply.721 = fmul float %Arg_1.218, %Arg_0.120
  %95 = zext i32 %91 to i64
  %96 = zext i32 %90 to i64
  %97 = add i64 %96, %6
  %98 = getelementptr [819200 x [256 x float]], ptr addrspace(1) %arg392, i64 0, i64 %95, i64 %97
  %99 = getelementptr inbounds float, ptr addrspace(1) %98, i64 1
  store float %multiply.721, ptr addrspace(1) %99, align 4
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %100 = add i32 %7, %lsr.iv.next
  %lsr.iv.next102 = add nuw nsw i64 %lsr.iv101, 512
  %lsr.iv.next104 = add nuw nsw i64 %lsr.iv103, 8192
  %lsr.iv.next106 = add nuw nsw i64 %lsr.iv105, 32
  %scevgep109 = getelementptr i8, ptr addrspace(1) %lsr.iv108, i64 32768
  %lsr.iv.next114 = add nuw nsw i32 %lsr.iv113, 32
  %lsr.iv.next116 = add nuw nsw i64 %lsr.iv115, 512
  %lsr.iv.next119 = add nuw nsw i32 %lsr.iv118, 128
  %scevgep122 = getelementptr i8, ptr addrspace(1) %lsr.iv121, i64 32768
  %lsr.iv.next124 = add nuw nsw i64 %lsr.iv123, 8192
  %lsr.iv.next126 = add nuw nsw i64 %lsr.iv125, 32
  %lsr.iv.next129 = add nuw nsw i64 %lsr.iv128, 512
  %lsr.iv.next134 = add nuw nsw i32 %lsr.iv133, 32
  %lsr.iv.next136 = add nuw nsw i64 %lsr.iv135, 512
  %lsr.iv.next139 = add nuw nsw i32 %lsr.iv138, 128
  %101 = icmp ugt i32 %100, 67
  br i1 %101, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %102 = zext i32 %thread_id.x to i64
  %103 = zext i32 %thread_id.y59 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i64 0, i64 0, i64 0, i64 %102, i64 %103
  store float %add.14.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i64 0, i64 0, i64 0, i64 %103, i64 %102
  %partial_reduction_result22 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %104 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 16, i32 31)
  %add.14.i72 = fadd float %partial_reduction_result22, %104
  %105 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i72, i32 8, i32 31)
  %add.14.i73 = fadd float %add.14.i72, %105
  %106 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i73, i32 4, i32 31)
  %add.14.i74 = fadd float %add.14.i73, %106
  %107 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i74, i32 2, i32 31)
  %add.14.i75 = fadd float %add.14.i74, %107
  %108 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i75, i32 1, i32 31)
  %add.14.i76 = fadd float %add.14.i75, %108
  store float %add.14.i76, ptr addrspace(3) %shmem_transposed_addr, align 4
  %109 = shl nuw nsw i32 %thread_id.y59, 1
  %110 = icmp eq i32 %thread_id.x, 0
  %111 = zext i32 %2 to i64
  %112 = and i32 %0, 3
  %113 = zext i32 %112 to i64
  %114 = zext i32 %109 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr addrspace(1) %arg494, i64 0, i64 %111, i64 %113, i64 %114
  br i1 %110, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %115 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address3698 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.14.i71, ptr addrspace(3) %shmem_output_address3698, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr3899 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result40 = load float, ptr addrspace(3) %shmem_transposed_addr3899, align 4
  %116 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 16, i32 31)
  %add.14.i77 = fadd float %partial_reduction_result40, %116
  %117 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i77, i32 8, i32 31)
  %add.14.i78 = fadd float %add.14.i77, %117
  %118 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i78, i32 4, i32 31)
  %add.14.i79 = fadd float %add.14.i78, %118
  %119 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i79, i32 2, i32 31)
  %add.14.i80 = fadd float %add.14.i79, %119
  %120 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i80, i32 1, i32 31)
  %add.14.i81 = fadd float %add.14.i80, %120
  store float %add.14.i81, ptr addrspace(3) %shmem_transposed_addr3899, align 4
  br i1 %115, label %reduction_write_output-true54, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.14.i76, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true54:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.14.i81, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(204800) %arg0, ptr noalias nocapture align 128 dereferenceable(204800) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !62
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !47
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !47
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_28(ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(237568) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(1056768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg6) local_unnamed_addr #0 {
entry:
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !63
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !47
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !47
  %9 = zext i32 %4 to i64
  %10 = zext i32 %3 to i64
  %11 = getelementptr [232 x [256 x float]], ptr addrspace(1) %arg13, i64 0, i64 %10, i64 %9
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 43008
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !47
  %multiply.8 = fmul float %8, %13
  %subtract.9 = fsub float %7, %multiply.8
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !47
  %16 = getelementptr [1032 x [256 x float]], ptr addrspace(1) %arg49, i64 0, i64 %10, i64 %9
  %17 = getelementptr inbounds float, ptr addrspace(1) %16, i64 247808
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !47
  %multiply.11 = fmul float %8, %18
  %subtract.12 = fsub float %15, %multiply.11
  %19 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %5
  store float %subtract.9, ptr addrspace(1) %19, align 4
  %20 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %5
  store float %subtract.12, ptr addrspace(1) %20, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_1(ptr noalias nocapture readonly align 16 dereferenceable(991232) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1056768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(991232) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 8
  %5 = and i32 %linear_index3, 255
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 254
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 253
  %8 = and i32 %3, 252
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg07, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !47
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !47
  %17 = zext i32 %4 to i64
  %18 = zext i32 %8 to i64
  %19 = getelementptr inbounds [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %18
  %20 = load <2 x float>, ptr addrspace(1) %19, align 16, !invariant.load !47
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %multiply.6 = fmul float %16, %21
  %subtract.7 = fsub float %12, %multiply.6
  %23 = getelementptr float, ptr addrspace(1) %arg313, i64 %9
  %24 = zext i32 %7 to i64
  %multiply.61 = fmul float %16, %22
  %subtract.72 = fsub float %13, %multiply.61
  %25 = zext i32 %6 to i64
  %26 = getelementptr inbounds [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 8, !invariant.load !47
  %multiply.63 = fmul float %16, %27
  %subtract.74 = fsub float %14, %multiply.63
  %28 = zext i32 %5 to i64
  %29 = getelementptr inbounds [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %17, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !47
  %multiply.65 = fmul float %16, %30
  %subtract.76 = fsub float %15, %multiply.65
  %31 = insertelement <4 x float> poison, float %subtract.7, i32 0
  %32 = insertelement <4 x float> %31, float %subtract.72, i32 1
  %33 = insertelement <4 x float> %32, float %subtract.74, i32 2
  %34 = insertelement <4 x float> %33, float %subtract.76, i32 3
  store <4 x float> %34, ptr addrspace(1) %23, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_33(ptr noalias nocapture readonly align 128 dereferenceable(33816576) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(2097152) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !65
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 6
  %5 = and i32 %linear_index3, 63
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 62
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 61
  %8 = and i32 %3, 60
  %9 = zext i32 %4 to i64
  %10 = zext i32 %8 to i64
  %11 = getelementptr [8192 x [1032 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %10
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 968
  %13 = load <2 x float>, ptr addrspace(1) %12, align 16, !invariant.load !47
  %14 = extractelement <2 x float> %13, i32 0
  %15 = extractelement <2 x float> %13, i32 1
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg13, i64 %16
  %18 = zext i32 %7 to i64
  %19 = getelementptr [8192 x [1032 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %18
  %20 = zext i32 %6 to i64
  %21 = getelementptr [8192 x [1032 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %20
  %22 = getelementptr inbounds float, ptr addrspace(1) %21, i64 968
  %23 = load float, ptr addrspace(1) %22, align 8, !invariant.load !47
  %24 = zext i32 %5 to i64
  %25 = getelementptr [8192 x [1032 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %24
  %26 = getelementptr inbounds float, ptr addrspace(1) %25, i64 968
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !47
  %28 = insertelement <4 x float> poison, float %14, i32 0
  %29 = insertelement <4 x float> %28, float %15, i32 1
  %30 = insertelement <4 x float> %29, float %23, i32 2
  %31 = insertelement <4 x float> %30, float %27, i32 3
  store <4 x float> %31, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_45(ptr noalias nocapture readonly align 128 dereferenceable(655360000) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 800
  %5 = lshr i32 %linear_index_base, 3
  %6 = urem i32 %5, 100
  %7 = and i32 %linear_index3, 7
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 6
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = and i32 %linear_index1, 5
  %10 = and i32 %3, 4
  %11 = mul nuw nsw i32 %4, 100
  %12 = add nuw nsw i32 %6, %11
  %13 = zext i32 %12 to i64
  %14 = zext i32 %10 to i64
  %15 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %14
  %16 = getelementptr inbounds float, ptr addrspace(1) %15, i64 128
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !47
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %20 = zext i32 %linear_index_base to i64
  %21 = getelementptr float, ptr addrspace(1) %arg13, i64 %20
  %22 = zext i32 %9 to i64
  %23 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %22
  %24 = zext i32 %8 to i64
  %25 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %24
  %26 = getelementptr inbounds float, ptr addrspace(1) %25, i64 128
  %27 = load float, ptr addrspace(1) %26, align 8, !invariant.load !47
  %28 = zext i32 %7 to i64
  %29 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %28
  %30 = getelementptr inbounds float, ptr addrspace(1) %29, i64 128
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !47
  %32 = insertelement <4 x float> poison, float %18, i32 0
  %33 = insertelement <4 x float> %32, float %19, i32 1
  %34 = insertelement <4 x float> %33, float %27, i32 2
  %35 = insertelement <4 x float> %34, float %31, i32 3
  store <4 x float> %35, ptr addrspace(1) %21, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_52(ptr noalias nocapture readonly align 128 dereferenceable(655360000) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(760217600) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg7) local_unnamed_addr #0 {
entry:
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !66
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !46
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 6400
  %5 = lshr i32 %linear_index_base, 6
  %6 = urem i32 %5, 100
  %7 = and i32 %linear_index3, 63
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 62
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = and i32 %linear_index1, 61
  %10 = and i32 %3, 60
  %11 = mul nuw nsw i32 %4, 100
  %12 = add nuw nsw i32 %6, %11
  %13 = zext i32 %12 to i64
  %14 = zext i32 %10 to i64
  %15 = getelementptr inbounds [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %14
  %16 = load <2 x float>, ptr addrspace(1) %15, align 16, !invariant.load !47
  %17 = extractelement <2 x float> %16, i32 0
  %18 = extractelement <2 x float> %16, i32 1
  %19 = getelementptr inbounds float, ptr addrspace(1) %15, i64 136
  %20 = load <2 x float>, ptr addrspace(1) %19, align 16, !invariant.load !47
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %23 = getelementptr inbounds float, ptr addrspace(1) %15, i64 64
  %24 = load <2 x float>, ptr addrspace(1) %23, align 16, !invariant.load !47
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %27 = getelementptr [819200 x [232 x float]], ptr addrspace(1) %arg13, i64 0, i64 %13, i64 %14
  %28 = getelementptr inbounds float, ptr addrspace(1) %27, i64 168
  %29 = load <2 x float>, ptr addrspace(1) %28, align 16, !invariant.load !47
  %30 = extractelement <2 x float> %29, i32 0
  %31 = extractelement <2 x float> %29, i32 1
  %32 = getelementptr inbounds float, ptr addrspace(1) %27, i64 64
  %33 = load <2 x float>, ptr addrspace(1) %32, align 16, !invariant.load !47
  %34 = extractelement <2 x float> %33, i32 0
  %35 = extractelement <2 x float> %33, i32 1
  %36 = load <2 x float>, ptr addrspace(1) %27, align 16, !invariant.load !47
  %37 = extractelement <2 x float> %36, i32 0
  %38 = extractelement <2 x float> %36, i32 1
  %39 = zext i32 %linear_index_base to i64
  %40 = getelementptr float, ptr addrspace(1) %arg25, i64 %39
  %41 = getelementptr float, ptr addrspace(1) %arg37, i64 %39
  %42 = getelementptr float, ptr addrspace(1) %arg49, i64 %39
  %43 = getelementptr float, ptr addrspace(1) %arg511, i64 %39
  %44 = getelementptr float, ptr addrspace(1) %arg613, i64 %39
  %45 = getelementptr float, ptr addrspace(1) %arg715, i64 %39
  %46 = zext i32 %9 to i64
  %47 = getelementptr inbounds [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %46
  %48 = zext i32 %8 to i64
  %49 = getelementptr inbounds [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %48
  %50 = load float, ptr addrspace(1) %49, align 8, !invariant.load !47
  %51 = getelementptr inbounds float, ptr addrspace(1) %49, i64 136
  %52 = load float, ptr addrspace(1) %51, align 8, !invariant.load !47
  %53 = getelementptr inbounds float, ptr addrspace(1) %49, i64 64
  %54 = load float, ptr addrspace(1) %53, align 8, !invariant.load !47
  %55 = getelementptr [819200 x [232 x float]], ptr addrspace(1) %arg13, i64 0, i64 %13, i64 %48
  %56 = getelementptr inbounds float, ptr addrspace(1) %55, i64 168
  %57 = load float, ptr addrspace(1) %56, align 8, !invariant.load !47
  %58 = getelementptr inbounds float, ptr addrspace(1) %55, i64 64
  %59 = load float, ptr addrspace(1) %58, align 8, !invariant.load !47
  %60 = load float, ptr addrspace(1) %55, align 8, !invariant.load !47
  %61 = zext i32 %7 to i64
  %62 = getelementptr inbounds [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4, !invariant.load !47
  %64 = getelementptr inbounds float, ptr addrspace(1) %62, i64 136
  %65 = load float, ptr addrspace(1) %64, align 4, !invariant.load !47
  %66 = getelementptr inbounds float, ptr addrspace(1) %62, i64 64
  %67 = load float, ptr addrspace(1) %66, align 4, !invariant.load !47
  %68 = getelementptr [819200 x [232 x float]], ptr addrspace(1) %arg13, i64 0, i64 %13, i64 %61
  %69 = getelementptr inbounds float, ptr addrspace(1) %68, i64 168
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !47
  %71 = getelementptr inbounds float, ptr addrspace(1) %68, i64 64
  %72 = load float, ptr addrspace(1) %71, align 4, !invariant.load !47
  %73 = load float, ptr addrspace(1) %68, align 4, !invariant.load !47
  %74 = insertelement <4 x float> poison, float %17, i32 0
  %75 = insertelement <4 x float> %74, float %18, i32 1
  %76 = insertelement <4 x float> %75, float %50, i32 2
  %77 = insertelement <4 x float> %76, float %63, i32 3
  store <4 x float> %77, ptr addrspace(1) %40, align 16
  %78 = insertelement <4 x float> poison, float %21, i32 0
  %79 = insertelement <4 x float> %78, float %22, i32 1
  %80 = insertelement <4 x float> %79, float %52, i32 2
  %81 = insertelement <4 x float> %80, float %65, i32 3
  store <4 x float> %81, ptr addrspace(1) %41, align 16
  %82 = insertelement <4 x float> poison, float %25, i32 0
  %83 = insertelement <4 x float> %82, float %26, i32 1
  %84 = insertelement <4 x float> %83, float %54, i32 2
  %85 = insertelement <4 x float> %84, float %67, i32 3
  store <4 x float> %85, ptr addrspace(1) %42, align 16
  %86 = insertelement <4 x float> poison, float %30, i32 0
  %87 = insertelement <4 x float> %86, float %31, i32 1
  %88 = insertelement <4 x float> %87, float %57, i32 2
  %89 = insertelement <4 x float> %88, float %70, i32 3
  store <4 x float> %89, ptr addrspace(1) %43, align 16
  %90 = insertelement <4 x float> poison, float %34, i32 0
  %91 = insertelement <4 x float> %90, float %35, i32 1
  %92 = insertelement <4 x float> %91, float %59, i32 2
  %93 = insertelement <4 x float> %92, float %72, i32 3
  store <4 x float> %93, ptr addrspace(1) %44, align 16
  %94 = insertelement <4 x float> poison, float %37, i32 0
  %95 = insertelement <4 x float> %94, float %38, i32 1
  %96 = insertelement <4 x float> %95, float %60, i32 2
  %97 = insertelement <4 x float> %96, float %73, i32 3
  store <4 x float> %97, ptr addrspace(1) %45, align 16
  ret void
}

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #4 = { convergent nocallback nounwind }
attributes #5 = { nofree nosync nounwind memory(argmem: readwrite) }
attributes #6 = { nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43}
!llvm.module.flags = !{!44}

!0 = !{ptr @fusion_32, !"kernel", i32 1}
!1 = !{ptr @fusion_32, !"reqntidx", i32 256}
!2 = !{ptr @fusion_41, !"kernel", i32 1}
!3 = !{ptr @fusion_41, !"reqntidx", i32 256}
!4 = !{ptr @fusion_40, !"kernel", i32 1}
!5 = !{ptr @fusion_40, !"reqntidx", i32 96}
!6 = !{ptr @fusion_38, !"kernel", i32 1}
!7 = !{ptr @fusion_38, !"reqntidx", i32 96}
!8 = !{ptr @fusion_37, !"kernel", i32 1}
!9 = !{ptr @fusion_37, !"reqntidx", i32 256}
!10 = !{ptr @fusion_30, !"kernel", i32 1}
!11 = !{ptr @fusion_30, !"reqntidx", i32 1024}
!12 = !{ptr @fusion_31, !"kernel", i32 1}
!13 = !{ptr @fusion_31, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_23, !"kernel", i32 1}
!15 = !{ptr @fusion_23, !"reqntidx", i32 96}
!16 = !{ptr @fusion_6, !"kernel", i32 1}
!17 = !{ptr @fusion_6, !"reqntidx", i32 1024}
!18 = !{ptr @fusion_5, !"kernel", i32 1}
!19 = !{ptr @fusion_5, !"reqntidx", i32 4}
!20 = !{ptr @fusion_25, !"kernel", i32 1}
!21 = !{ptr @fusion_25, !"reqntidx", i32 1024}
!22 = !{ptr @fusion_24, !"kernel", i32 1}
!23 = !{ptr @fusion_24, !"reqntidx", i32 4}
!24 = !{ptr @fusion_19, !"kernel", i32 1}
!25 = !{ptr @fusion_19, !"reqntidx", i32 96}
!26 = !{ptr @fusion_18, !"kernel", i32 1}
!27 = !{ptr @fusion_18, !"reqntidx", i32 256}
!28 = !{ptr @fusion_27, !"kernel", i32 1}
!29 = !{ptr @fusion_27, !"reqntidx", i32 256}
!30 = !{ptr @fusion_35, !"kernel", i32 1}
!31 = !{ptr @fusion_35, !"reqntidx", i32 1024}
!32 = !{ptr @fusion_2, !"kernel", i32 1}
!33 = !{ptr @fusion_2, !"reqntidx", i32 1024}
!34 = !{ptr @fusion_28, !"kernel", i32 1}
!35 = !{ptr @fusion_28, !"reqntidx", i32 1024}
!36 = !{ptr @fusion_1, !"kernel", i32 1}
!37 = !{ptr @fusion_1, !"reqntidx", i32 256}
!38 = !{ptr @fusion_33, !"kernel", i32 1}
!39 = !{ptr @fusion_33, !"reqntidx", i32 256}
!40 = !{ptr @fusion_45, !"kernel", i32 1}
!41 = !{ptr @fusion_45, !"reqntidx", i32 256}
!42 = !{ptr @fusion_52, !"kernel", i32 1}
!43 = !{ptr @fusion_52, !"reqntidx", i32 256}
!44 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!45 = !{i32 0, i32 128}
!46 = !{i32 0, i32 256}
!47 = !{}
!48 = !{i32 0, i32 2048}
!49 = !{i32 0, i32 96}
!50 = !{i32 0, i32 1092267}
!51 = !{i32 0, i32 10923}
!52 = !{i32 0, i32 3200}
!53 = !{i32 0, i32 2}
!54 = !{i32 0, i32 1024}
!55 = !{i32 0, i32 38}
!56 = !{i32 0, i32 4}
!57 = !{i32 0, i32 64}
!58 = !{i32 0, i32 34134}
!59 = !{i32 0, i32 800}
!60 = !{i32 0, i32 6400}
!61 = !{i32 0, i32 32768}
!62 = !{i32 0, i32 50}
!63 = !{i32 0, i32 16}
!64 = !{i32 0, i32 242}
!65 = !{i32 0, i32 512}
!66 = !{i32 0, i32 51200}
