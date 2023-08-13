target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_14(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(48496640) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !23
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 8
  %5 = and i32 %linear_index3, 63
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 62
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 61
  %8 = and i32 %3, 192
  %9 = and i32 %3, 252
  %10 = zext i32 %4 to i64
  %11 = zext i32 %9 to i64
  %12 = getelementptr [8192 x [1480 x float]], ptr addrspace(1) %arg211, i64 0, i64 %10, i64 %11
  %13 = getelementptr inbounds float, ptr addrspace(1) %12, i64 968
  %14 = load float, ptr addrspace(1) %13, align 16, !invariant.load !25
  %15 = zext i32 %linear_index_base to i64
  %16 = getelementptr float, ptr addrspace(1) %arg19, i64 %15
  %17 = load <4 x float>, ptr addrspace(1) %16, align 16, !invariant.load !25
  %18 = extractelement <4 x float> %17, i32 0
  %19 = extractelement <4 x float> %17, i32 1
  %20 = extractelement <4 x float> %17, i32 2
  %21 = extractelement <4 x float> %17, i32 3
  %add.5 = fadd float %14, %18
  %22 = getelementptr float, ptr addrspace(1) %arg07, i64 %15
  %23 = load <4 x float>, ptr addrspace(1) %22, align 16, !invariant.load !25
  %24 = extractelement <4 x float> %23, i32 0
  %25 = extractelement <4 x float> %23, i32 1
  %26 = extractelement <4 x float> %23, i32 2
  %27 = extractelement <4 x float> %23, i32 3
  %add.6 = fadd float %add.5, %24
  %28 = getelementptr float, ptr addrspace(1) %arg313, i64 %15
  %29 = zext i32 %7 to i64
  %30 = zext i32 %8 to i64
  %31 = add i64 %30, %29
  %32 = getelementptr [8192 x [1480 x float]], ptr addrspace(1) %arg211, i64 0, i64 %10, i64 %31
  %33 = getelementptr inbounds float, ptr addrspace(1) %32, i64 968
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !25
  %add.51 = fadd float %34, %19
  %add.62 = fadd float %add.51, %25
  %35 = zext i32 %6 to i64
  %36 = add i64 %30, %35
  %37 = getelementptr [8192 x [1480 x float]], ptr addrspace(1) %arg211, i64 0, i64 %10, i64 %36
  %38 = getelementptr inbounds float, ptr addrspace(1) %37, i64 968
  %39 = load float, ptr addrspace(1) %38, align 8, !invariant.load !25
  %add.53 = fadd float %39, %20
  %add.64 = fadd float %add.53, %26
  %40 = zext i32 %5 to i64
  %41 = add i64 %30, %40
  %42 = getelementptr [8192 x [1480 x float]], ptr addrspace(1) %arg211, i64 0, i64 %10, i64 %41
  %43 = getelementptr inbounds float, ptr addrspace(1) %42, i64 968
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !25
  %add.55 = fadd float %44, %21
  %add.66 = fadd float %add.55, %27
  %45 = insertelement <4 x float> poison, float %add.6, i32 0
  %46 = insertelement <4 x float> %45, float %add.62, i32 1
  %47 = insertelement <4 x float> %46, float %add.64, i32 2
  %48 = insertelement <4 x float> %47, float %add.66, i32 3
  store <4 x float> %48, ptr addrspace(1) %28, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice_1(ptr noalias nocapture readonly align 16 dereferenceable(48496640) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !23
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
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
  %9 = zext i32 %4 to i64
  %10 = zext i32 %8 to i64
  %11 = getelementptr [8192 x [1480 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %10
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1224
  %13 = load <2 x float>, ptr addrspace(1) %12, align 16, !invariant.load !25
  %14 = extractelement <2 x float> %13, i32 0
  %15 = extractelement <2 x float> %13, i32 1
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg13, i64 %16
  %18 = zext i32 %7 to i64
  %19 = getelementptr [8192 x [1480 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %18
  %20 = zext i32 %6 to i64
  %21 = getelementptr [8192 x [1480 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %20
  %22 = getelementptr inbounds float, ptr addrspace(1) %21, i64 1224
  %23 = load float, ptr addrspace(1) %22, align 8, !invariant.load !25
  %24 = zext i32 %5 to i64
  %25 = getelementptr [8192 x [1480 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %24
  %26 = getelementptr inbounds float, ptr addrspace(1) %25, i64 1224
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !25
  %28 = insertelement <4 x float> poison, float %14, i32 0
  %29 = insertelement <4 x float> %28, float %15, i32 1
  %30 = insertelement <4 x float> %29, float %23, i32 2
  %31 = insertelement <4 x float> %30, float %27, i32 3
  store <4 x float> %31, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice(ptr noalias nocapture readonly align 16 dereferenceable(48496640) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(31719424) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 968
  %5 = urem i32 %linear_index3, 968
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 968
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 968
  %8 = mul i32 %4, 968
  %.decomposed = sub i32 %linear_index_base.frozen, %8
  %9 = zext i32 %4 to i64
  %10 = zext i32 %.decomposed to i64
  %11 = getelementptr inbounds [8192 x [1480 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %10
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !25
  %13 = zext i32 %linear_index_base to i64
  %14 = getelementptr float, ptr addrspace(1) %arg13, i64 %13
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [8192 x [1480 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 4, !invariant.load !25
  %18 = zext i32 %6 to i64
  %19 = getelementptr inbounds [8192 x [1480 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %18
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !25
  %21 = zext i32 %5 to i64
  %22 = getelementptr inbounds [8192 x [1480 x float]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !25
  %24 = insertelement <4 x float> poison, float %12, i32 0
  %25 = insertelement <4 x float> %24, float %17, i32 1
  %26 = insertelement <4 x float> %25, float %20, i32 2
  %27 = insertelement <4 x float> %26, float %23, i32 3
  store <4 x float> %27, ptr addrspace(1) %14, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_13(ptr noalias nocapture readonly align 16 dereferenceable(6553600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(419430400) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(419430400) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg4) local_unnamed_addr #2 {
entry:
  %arg460 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg358 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg256 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg154 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg052 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %2 = lshr i32 %0, 5
  %3 = mul nuw nsw i32 %1, 3
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 1638400
  br i1 %5, label %tile_loop.loop_header9.preheader, label %common.ret

tile_loop.loop_header9.preheader:                 ; preds = %entry
  %6 = and i32 %0, 31
  %7 = shl nuw nsw i32 %4, 6
  %8 = or i32 %6, %7
  %9 = and i32 %4, 3
  %10 = udiv i32 %4, 200
  %11 = zext i32 %10 to i64
  %12 = zext i32 %9 to i64
  %13 = zext i32 %6 to i64
  %Arg_1.215 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr addrspace(1) %arg154, i64 0, i64 %11, i64 %12, i64 %13
  %Arg_1.216 = load float, ptr addrspace(1) %Arg_1.215, align 4, !invariant.load !25
  %14 = zext i32 %8 to i64
  %Arg_2.317 = getelementptr inbounds float, ptr addrspace(1) %arg256, i64 %14
  %Arg_2.318 = load float, ptr addrspace(1) %Arg_2.317, align 4, !invariant.load !25
  %multiply.919 = fmul float %Arg_1.216, %Arg_2.318
  %add.14.i49 = fadd float %multiply.919, 0.000000e+00
  %15 = zext i32 %4 to i64
  %Arg_0.123 = getelementptr inbounds float, ptr addrspace(1) %arg052, i64 %15
  %Arg_0.124 = load float, ptr addrspace(1) %Arg_0.123, align 4, !invariant.load !25
  %multiply.725 = fmul float %Arg_1.216, %Arg_0.124
  %16 = getelementptr inbounds float, ptr addrspace(1) %arg358, i64 %14
  store float %multiply.725, ptr addrspace(1) %16, align 4
  %Arg_1.215.163 = getelementptr inbounds float, ptr addrspace(1) %Arg_1.215, i64 32
  %Arg_1.216.1 = load float, ptr addrspace(1) %Arg_1.215.163, align 4, !invariant.load !25
  %17 = zext i32 %7 to i64
  %18 = add i64 %13, %17
  %19 = getelementptr float, ptr addrspace(1) %arg256, i64 %18
  %Arg_2.317.165 = getelementptr inbounds float, ptr addrspace(1) %19, i64 32
  %Arg_2.318.1 = load float, ptr addrspace(1) %Arg_2.317.165, align 4, !invariant.load !25
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
  %32 = urem i32 %31, 50
  %33 = zext i32 %32 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr addrspace(1) %arg460, i64 0, i64 %11, i64 %12, i64 %33
  %output.then.val = load float, ptr addrspace(3) %29, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

; Function Attrs: nounwind
define void @fusion_10(ptr noalias nocapture readonly align 16 dereferenceable(6553600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #2 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !27
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !29
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %entry
  %7 = mul nuw nsw i32 %5, 50
  %8 = add nuw nsw i32 %2, %7
  %9 = zext i32 %8 to i64
  %Arg_0.114 = getelementptr inbounds float, ptr addrspace(1) %arg044, i64 %9
  %Arg_1.212 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %9
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !25
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !25
  %multiply.416 = fmul float %Arg_1.213, %Arg_0.115
  %add.9.i41 = fadd float %multiply.416, 0.000000e+00
  %x_loc11.1 = or i32 %2, 32
  %10 = icmp ult i32 %x_loc11.1, 50
  br i1 %10, label %x_in_tile-true.1, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %11 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %12 = lshr i32 %5, 2
  %13 = zext i32 %12 to i64
  %14 = and i32 %5, 3
  %15 = zext i32 %14 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg248, i64 0, i64 %13, i64 %15
  br i1 %11, label %reduction_write_output-true, label %common.ret

x_in_tile-true.1:                                 ; preds = %tile_loop.loop_header6.preheader
  %16 = zext i32 %7 to i64
  %17 = zext i32 %2 to i64
  %18 = add i64 %17, %16
  %19 = getelementptr float, ptr addrspace(1) %arg044, i64 %18
  %Arg_0.114.151 = getelementptr inbounds float, ptr addrspace(1) %19, i64 32
  %20 = getelementptr float, ptr addrspace(1) %arg146, i64 %18
  %Arg_1.212.153 = getelementptr inbounds float, ptr addrspace(1) %20, i64 32
  %Arg_1.213.1 = load float, ptr addrspace(1) %Arg_1.212.153, align 4, !invariant.load !25
  %Arg_0.115.1 = load float, ptr addrspace(1) %Arg_0.114.151, align 4, !invariant.load !25
  %multiply.416.1 = fmul float %Arg_1.213.1, %Arg_0.115.1
  %add.9.i41.1 = fadd float %add.9.i41, %multiply.416.1
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.1, %tile_loop.loop_header6.preheader
  %partial_reduction_result.1.1 = phi float [ %add.9.i41.1, %x_in_tile-true.1 ], [ %add.9.i41, %tile_loop.loop_header6.preheader ]
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.1, i32 16, i32 31)
  %add.9.i = fadd float %partial_reduction_result.1.1, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i, i32 8, i32 31)
  %add.9.i37 = fadd float %add.9.i, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i37, i32 4, i32 31)
  %add.9.i38 = fadd float %add.9.i37, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i38, i32 2, i32 31)
  %add.9.i39 = fadd float %add.9.i38, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i39, i32 1, i32 31)
  %26 = icmp eq i32 %2, 0
  %27 = zext i32 %3 to i64
  %28 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %27, i64 0, i64 0
  %add.9.i40 = fadd float %add.9.i39, %25
  br i1 %26, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.9.i40, ptr addrspace(3) %28, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %28, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_9(ptr noalias nocapture readonly align 16 dereferenceable(6553600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg4) local_unnamed_addr #0 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %1 = shl nuw nsw i32 %0, 8
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %linear_index = or i32 %1, %2
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 50
  %4 = mul i32 %3, 50
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = load float, ptr addrspace(1) %arg214, align 16, !invariant.load !25
  %6 = zext i32 %3 to i64
  %7 = zext i32 %.decomposed to i64
  %8 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr addrspace(1) %arg316, i64 0, i64 %6, i64 0, i64 %7
  %9 = load float, ptr addrspace(1) %8, align 4, !invariant.load !25
  %10 = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg112, i64 0, i64 %6, i64 0
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !25
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %subtract.8 = fsub float %9, %12
  %16 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr addrspace(1) %arg010, i64 0, i64 %6, i64 0, i64 %7
  %17 = load float, ptr addrspace(1) %16, align 4, !invariant.load !25
  %multiply.9 = fmul float %subtract.8, %17
  %multiply.10 = fmul float %5, %multiply.9
  %18 = zext i32 %linear_index_base to i64
  %19 = getelementptr float, ptr addrspace(1) %arg418, i64 %18
  %20 = getelementptr inbounds float, ptr addrspace(1) %8, i64 50
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !25
  %subtract.81 = fsub float %21, %13
  %22 = getelementptr inbounds float, ptr addrspace(1) %16, i64 50
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !25
  %multiply.92 = fmul float %subtract.81, %23
  %multiply.103 = fmul float %5, %multiply.92
  %24 = getelementptr inbounds float, ptr addrspace(1) %8, i64 100
  %25 = load float, ptr addrspace(1) %24, align 4, !invariant.load !25
  %subtract.84 = fsub float %25, %14
  %26 = getelementptr inbounds float, ptr addrspace(1) %16, i64 100
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !25
  %multiply.95 = fmul float %subtract.84, %27
  %multiply.106 = fmul float %5, %multiply.95
  %28 = getelementptr inbounds float, ptr addrspace(1) %8, i64 150
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !25
  %subtract.87 = fsub float %29, %15
  %30 = getelementptr inbounds float, ptr addrspace(1) %16, i64 150
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !25
  %multiply.98 = fmul float %subtract.87, %31
  %multiply.109 = fmul float %5, %multiply.98
  %32 = insertelement <4 x float> poison, float %multiply.10, i32 0
  %33 = insertelement <4 x float> %32, float %multiply.103, i32 1
  %34 = insertelement <4 x float> %33, float %multiply.106, i32 2
  %35 = insertelement <4 x float> %34, float %multiply.109, i32 3
  store <4 x float> %35, ptr addrspace(1) %19, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_8(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(419430400) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(419430400) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg4) local_unnamed_addr #2 {
entry:
  %arg494 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg392 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg290 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg188 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg086 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %thread_id.x = and i32 %1, 31
  %thread_id.y59 = lshr i32 %1, 5
  %2 = lshr i32 %0, 2
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 192
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = mul nuw nsw i32 %2, 12800
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
  %48 = udiv i64 %lsr.iv103, 12800
  %49 = mul nuw nsw i64 %48, 800
  %50 = add i64 %lsr.iv101, %49
  %51 = udiv i64 %lsr.iv105, 50
  %52 = mul nuw nsw i64 %51, 800
  %53 = sub i64 %50, %52
  %54 = mul nuw nsw i64 %48, 51200
  %55 = mul nuw nsw i64 %51, 51200
  %56 = sub i64 %54, %55
  %scevgep110 = getelementptr i8, ptr addrspace(1) %lsr.iv108, i64 %56
  %57 = udiv i32 %lsr142, 12800
  %58 = mul nuw nsw i32 %57, 50
  %59 = add i32 %27, %58
  %60 = udiv i32 %lsr.iv113, 50
  %61 = mul nuw nsw i32 %60, 50
  %62 = sub i32 %59, %61
  %63 = udiv i64 %lsr.iv123, 12800
  %64 = mul nuw nsw i64 %63, 51200
  %65 = udiv i64 %lsr.iv125, 50
  %66 = mul nuw nsw i64 %65, 51200
  %67 = sub i64 %64, %66
  %scevgep127 = getelementptr i8, ptr addrspace(1) %lsr.iv121, i64 %67
  %68 = mul nuw nsw i64 %63, 800
  %69 = add i64 %lsr.iv128, %68
  %70 = mul nuw nsw i64 %65, 800
  %71 = sub i64 %69, %70
  %72 = udiv i32 %lsr140, 12800
  %73 = mul nuw nsw i32 %72, 50
  %74 = add i32 %44, %73
  %75 = udiv i32 %lsr.iv133, 50
  %76 = mul nuw nsw i32 %75, 50
  %77 = sub i32 %74, %76
  %78 = and i32 %lsr.iv118, 3
  %79 = zext i32 %78 to i64
  %scevgep = getelementptr i8, ptr addrspace(1) %arg188, i64 %53
  %Arg_1.23 = load float, ptr addrspace(1) %scevgep, align 4, !invariant.load !25
  %Arg_2.34 = load float, ptr addrspace(1) %scevgep110, align 8, !invariant.load !25
  %multiply.9 = fmul float %Arg_1.23, %Arg_2.34
  %add.14.i = fadd float %partial_reduction_result58.sroa.0.082, %multiply.9
  %80 = shl nuw nsw i32 %78, 6
  %81 = or i32 %80, %47
  %82 = add i32 %lsr.iv, %62
  %83 = udiv i32 %82, 50
  %scevgep117 = getelementptr i8, ptr addrspace(1) %arg188, i64 %lsr.iv115
  %Arg_1.26 = load float, ptr addrspace(1) %scevgep117, align 4, !invariant.load !25
  %84 = zext i32 %83 to i64
  %Arg_0.1 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr addrspace(1) %arg086, i64 0, i64 %84, i64 0, i64 %79, i64 %6
  %Arg_0.17 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !25
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  %85 = zext i32 %82 to i64
  %86 = zext i32 %81 to i64
  %87 = getelementptr inbounds [409600 x [256 x float]], ptr addrspace(1) %arg392, i64 0, i64 %85, i64 %86
  store float %multiply.7, ptr addrspace(1) %87, align 8
  %88 = and i32 %lsr.iv138, 3
  %89 = zext i32 %88 to i64
  %scevgep130 = getelementptr i8, ptr addrspace(1) %arg188, i64 %71
  %Arg_1.212 = load float, ptr addrspace(1) %scevgep130, align 4, !invariant.load !25
  %Arg_2.314 = load float, ptr addrspace(1) %scevgep127, align 4, !invariant.load !25
  %multiply.915 = fmul float %Arg_1.212, %Arg_2.314
  %add.14.i71 = fadd float %partial_reduction_result58.sroa.4.083, %multiply.915
  %90 = shl nuw nsw i32 %88, 6
  %91 = add i32 %lsr.iv, %77
  %92 = udiv i32 %91, 50
  %scevgep137 = getelementptr i8, ptr addrspace(1) %arg188, i64 %lsr.iv135
  %Arg_1.218 = load float, ptr addrspace(1) %scevgep137, align 4, !invariant.load !25
  %93 = zext i32 %92 to i64
  %94 = getelementptr [8192 x [1 x [4 x [64 x float]]]], ptr addrspace(1) %arg086, i64 0, i64 %93, i64 0, i64 %89, i64 %6
  %Arg_0.11997 = getelementptr inbounds float, ptr addrspace(1) %94, i64 1
  %Arg_0.120 = load float, ptr addrspace(1) %Arg_0.11997, align 4, !invariant.load !25
  %multiply.721 = fmul float %Arg_1.218, %Arg_0.120
  %95 = zext i32 %91 to i64
  %96 = zext i32 %90 to i64
  %97 = add i64 %96, %6
  %98 = getelementptr [409600 x [256 x float]], ptr addrspace(1) %arg392, i64 0, i64 %95, i64 %97
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
  %101 = icmp ugt i32 %100, 17
  br i1 %101, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %102 = zext i32 %thread_id.x to i64
  %103 = zext i32 %thread_id.y59 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %102, i64 %103
  store float %add.14.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %103, i64 %102
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
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(991232) %arg0, ptr noalias nocapture align 128 dereferenceable(991232) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !33
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !25
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !25
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

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_12(ptr noalias nocapture readonly align 16 dereferenceable(155648) %arg0, ptr noalias nocapture align 128 dereferenceable(155648) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(155648) %arg3, ptr noalias nocapture align 128 dereferenceable(155648) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !25
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !25
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !25
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.9 = fmul float %6, %12
  %subtract.10 = fsub float %10, %multiply.9
  store float %subtract.8, ptr addrspace(1) %11, align 4
  store float %subtract.10, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(249036800) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg7) local_unnamed_addr #0 {
entry:
  %arg733 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 400
  %5 = lshr i32 %linear_index_base, 3
  %6 = urem i32 %5, 50
  %7 = and i32 %linear_index3, 7
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 6
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = and i32 %linear_index1, 5
  %10 = and i32 %3, 4
  %11 = zext i32 %linear_index_base to i64
  %12 = getelementptr float, ptr addrspace(1) %arg019, i64 %11
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !25
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %18 = load float, ptr addrspace(1) %arg121, align 16, !invariant.load !25
  %19 = mul nuw nsw i32 %4, 50
  %20 = add nuw nsw i32 %6, %19
  %21 = zext i32 %20 to i64
  %22 = zext i32 %10 to i64
  %23 = getelementptr [409600 x [152 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %22
  %24 = getelementptr inbounds float, ptr addrspace(1) %23, i64 144
  %25 = load <2 x float>, ptr addrspace(1) %24, align 16, !invariant.load !25
  %26 = extractelement <2 x float> %25, i32 0
  %27 = extractelement <2 x float> %25, i32 1
  %multiply.9 = fmul float %18, %26
  %subtract.10 = fsub float %14, %multiply.9
  %28 = getelementptr float, ptr addrspace(1) %arg325, i64 %11
  %29 = load <4 x float>, ptr addrspace(1) %28, align 16, !invariant.load !25
  %30 = extractelement <4 x float> %29, i32 0
  %31 = extractelement <4 x float> %29, i32 1
  %32 = extractelement <4 x float> %29, i32 2
  %33 = extractelement <4 x float> %29, i32 3
  %34 = getelementptr inbounds float, ptr addrspace(1) %23, i64 136
  %35 = load <2 x float>, ptr addrspace(1) %34, align 16, !invariant.load !25
  %36 = extractelement <2 x float> %35, i32 0
  %37 = extractelement <2 x float> %35, i32 1
  %multiply.12 = fmul float %18, %36
  %subtract.13 = fsub float %30, %multiply.12
  %38 = getelementptr float, ptr addrspace(1) %arg427, i64 %11
  %39 = load <4 x float>, ptr addrspace(1) %38, align 16, !invariant.load !25
  %40 = extractelement <4 x float> %39, i32 0
  %41 = extractelement <4 x float> %39, i32 1
  %42 = extractelement <4 x float> %39, i32 2
  %43 = extractelement <4 x float> %39, i32 3
  %44 = getelementptr inbounds float, ptr addrspace(1) %23, i64 128
  %45 = load <2 x float>, ptr addrspace(1) %44, align 16, !invariant.load !25
  %46 = extractelement <2 x float> %45, i32 0
  %47 = extractelement <2 x float> %45, i32 1
  %multiply.15 = fmul float %18, %46
  %subtract.16 = fsub float %40, %multiply.15
  %48 = getelementptr float, ptr addrspace(1) %arg529, i64 %11
  %49 = getelementptr float, ptr addrspace(1) %arg631, i64 %11
  %50 = getelementptr float, ptr addrspace(1) %arg733, i64 %11
  %51 = zext i32 %9 to i64
  %52 = getelementptr [409600 x [152 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %51
  %multiply.91 = fmul float %18, %27
  %subtract.102 = fsub float %15, %multiply.91
  %multiply.123 = fmul float %18, %37
  %subtract.134 = fsub float %31, %multiply.123
  %multiply.155 = fmul float %18, %47
  %subtract.166 = fsub float %41, %multiply.155
  %53 = zext i32 %8 to i64
  %54 = getelementptr [409600 x [152 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %53
  %55 = getelementptr inbounds float, ptr addrspace(1) %54, i64 144
  %56 = load float, ptr addrspace(1) %55, align 8, !invariant.load !25
  %multiply.97 = fmul float %18, %56
  %subtract.108 = fsub float %16, %multiply.97
  %57 = getelementptr inbounds float, ptr addrspace(1) %54, i64 136
  %58 = load float, ptr addrspace(1) %57, align 8, !invariant.load !25
  %multiply.129 = fmul float %18, %58
  %subtract.1310 = fsub float %32, %multiply.129
  %59 = getelementptr inbounds float, ptr addrspace(1) %54, i64 128
  %60 = load float, ptr addrspace(1) %59, align 8, !invariant.load !25
  %multiply.1511 = fmul float %18, %60
  %subtract.1612 = fsub float %42, %multiply.1511
  %61 = zext i32 %7 to i64
  %62 = getelementptr [409600 x [152 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %61
  %63 = getelementptr inbounds float, ptr addrspace(1) %62, i64 144
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !25
  %multiply.913 = fmul float %18, %64
  %subtract.1014 = fsub float %17, %multiply.913
  %65 = getelementptr inbounds float, ptr addrspace(1) %62, i64 136
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !25
  %multiply.1215 = fmul float %18, %66
  %subtract.1316 = fsub float %33, %multiply.1215
  %67 = getelementptr inbounds float, ptr addrspace(1) %62, i64 128
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !25
  %multiply.1517 = fmul float %18, %68
  %subtract.1618 = fsub float %43, %multiply.1517
  %69 = insertelement <4 x float> poison, float %subtract.10, i32 0
  %70 = insertelement <4 x float> %69, float %subtract.102, i32 1
  %71 = insertelement <4 x float> %70, float %subtract.108, i32 2
  %72 = insertelement <4 x float> %71, float %subtract.1014, i32 3
  store <4 x float> %72, ptr addrspace(1) %48, align 16
  %73 = insertelement <4 x float> poison, float %subtract.13, i32 0
  %74 = insertelement <4 x float> %73, float %subtract.134, i32 1
  %75 = insertelement <4 x float> %74, float %subtract.1310, i32 2
  %76 = insertelement <4 x float> %75, float %subtract.1316, i32 3
  store <4 x float> %76, ptr addrspace(1) %49, align 16
  %77 = insertelement <4 x float> poison, float %subtract.16, i32 0
  %78 = insertelement <4 x float> %77, float %subtract.166, i32 1
  %79 = insertelement <4 x float> %78, float %subtract.1612, i32 2
  %80 = insertelement <4 x float> %79, float %subtract.1618, i32 3
  store <4 x float> %80, ptr addrspace(1) %50, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_4(ptr noalias nocapture readonly align 16 dereferenceable(104857600) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(249036800) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(104857600) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(104857600) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(104857600) %arg5) local_unnamed_addr #0 {
entry:
  %arg523 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg421 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 3200
  %5 = lshr i32 %linear_index_base, 6
  %6 = urem i32 %5, 50
  %7 = and i32 %linear_index3, 63
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 62
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = and i32 %linear_index1, 61
  %10 = and i32 %3, 60
  %11 = zext i32 %linear_index_base to i64
  %12 = getelementptr float, ptr addrspace(1) %arg013, i64 %11
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !25
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %18 = load float, ptr addrspace(1) %arg115, align 16, !invariant.load !25
  %19 = mul nuw nsw i32 %4, 50
  %20 = add nuw nsw i32 %6, %19
  %21 = zext i32 %20 to i64
  %22 = zext i32 %10 to i64
  %23 = getelementptr inbounds [409600 x [152 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %22
  %24 = load <2 x float>, ptr addrspace(1) %23, align 16, !invariant.load !25
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %multiply.8 = fmul float %18, %25
  %subtract.9 = fsub float %14, %multiply.8
  %27 = getelementptr float, ptr addrspace(1) %arg319, i64 %11
  %28 = load <4 x float>, ptr addrspace(1) %27, align 16, !invariant.load !25
  %29 = extractelement <4 x float> %28, i32 0
  %30 = extractelement <4 x float> %28, i32 1
  %31 = extractelement <4 x float> %28, i32 2
  %32 = extractelement <4 x float> %28, i32 3
  %33 = getelementptr inbounds float, ptr addrspace(1) %23, i64 64
  %34 = load <2 x float>, ptr addrspace(1) %33, align 16, !invariant.load !25
  %35 = extractelement <2 x float> %34, i32 0
  %36 = extractelement <2 x float> %34, i32 1
  %multiply.11 = fmul float %18, %35
  %subtract.12 = fsub float %29, %multiply.11
  %37 = getelementptr float, ptr addrspace(1) %arg421, i64 %11
  %38 = getelementptr float, ptr addrspace(1) %arg523, i64 %11
  %39 = zext i32 %9 to i64
  %40 = getelementptr inbounds [409600 x [152 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %39
  %multiply.81 = fmul float %18, %26
  %subtract.92 = fsub float %15, %multiply.81
  %multiply.113 = fmul float %18, %36
  %subtract.124 = fsub float %30, %multiply.113
  %41 = zext i32 %8 to i64
  %42 = getelementptr inbounds [409600 x [152 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %41
  %43 = load float, ptr addrspace(1) %42, align 8, !invariant.load !25
  %multiply.85 = fmul float %18, %43
  %subtract.96 = fsub float %16, %multiply.85
  %44 = getelementptr inbounds float, ptr addrspace(1) %42, i64 64
  %45 = load float, ptr addrspace(1) %44, align 8, !invariant.load !25
  %multiply.117 = fmul float %18, %45
  %subtract.128 = fsub float %31, %multiply.117
  %46 = zext i32 %7 to i64
  %47 = getelementptr inbounds [409600 x [152 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !25
  %multiply.89 = fmul float %18, %48
  %subtract.910 = fsub float %17, %multiply.89
  %49 = getelementptr inbounds float, ptr addrspace(1) %47, i64 64
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !25
  %multiply.1111 = fmul float %18, %50
  %subtract.1212 = fsub float %32, %multiply.1111
  %51 = insertelement <4 x float> poison, float %subtract.9, i32 0
  %52 = insertelement <4 x float> %51, float %subtract.92, i32 1
  %53 = insertelement <4 x float> %52, float %subtract.96, i32 2
  %54 = insertelement <4 x float> %53, float %subtract.910, i32 3
  store <4 x float> %54, ptr addrspace(1) %37, align 16
  %55 = insertelement <4 x float> poison, float %subtract.12, i32 0
  %56 = insertelement <4 x float> %55, float %subtract.124, i32 1
  %57 = insertelement <4 x float> %56, float %subtract.128, i32 2
  %58 = insertelement <4 x float> %57, float %subtract.1212, i32 3
  store <4 x float> %58, ptr addrspace(1) %38, align 16
  ret void
}

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #4 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21}
!llvm.module.flags = !{!22}

!0 = !{ptr @fusion_14, !"kernel", i32 1}
!1 = !{ptr @fusion_14, !"reqntidx", i32 256}
!2 = !{ptr @slice_1, !"kernel", i32 1}
!3 = !{ptr @slice_1, !"reqntidx", i32 256}
!4 = !{ptr @slice, !"kernel", i32 1}
!5 = !{ptr @slice, !"reqntidx", i32 256}
!6 = !{ptr @fusion_13, !"kernel", i32 1}
!7 = !{ptr @fusion_13, !"reqntidx", i32 96}
!8 = !{ptr @fusion_10, !"kernel", i32 1}
!9 = !{ptr @fusion_10, !"reqntidx", i32 96}
!10 = !{ptr @fusion_9, !"kernel", i32 1}
!11 = !{ptr @fusion_9, !"reqntidx", i32 256}
!12 = !{ptr @fusion_8, !"kernel", i32 1}
!13 = !{ptr @fusion_8, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_5, !"kernel", i32 1}
!15 = !{ptr @fusion_5, !"reqntidx", i32 256}
!16 = !{ptr @fusion_12, !"kernel", i32 1}
!17 = !{ptr @fusion_12, !"reqntidx", i32 1024}
!18 = !{ptr @fusion, !"kernel", i32 1}
!19 = !{ptr @fusion, !"reqntidx", i32 256}
!20 = !{ptr @fusion_4, !"kernel", i32 1}
!21 = !{ptr @fusion_4, !"reqntidx", i32 256}
!22 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!23 = !{i32 0, i32 2048}
!24 = !{i32 0, i32 256}
!25 = !{}
!26 = !{i32 0, i32 7744}
!27 = !{i32 0, i32 96}
!28 = !{i32 0, i32 546134}
!29 = !{i32 0, i32 10923}
!30 = !{i32 0, i32 1600}
!31 = !{i32 0, i32 32768}
!32 = !{i32 0, i32 1024}
!33 = !{i32 0, i32 242}
!34 = !{i32 0, i32 38}
!35 = !{i32 0, i32 3200}
!36 = !{i32 0, i32 25600}
