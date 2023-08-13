target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_11 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 128
@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [1 x [1 x [4 x float]]] undef
@shared_cache6 = private unnamed_addr addrspace(3) global [1 x [1 x [4 x float]]] undef
@"shared_cache7_$_0" = internal unnamed_addr addrspace(3) global float undef
@shared_cache8 = private unnamed_addr addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache9 = private unnamed_addr addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache10 = private unnamed_addr addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache11 = private unnamed_addr addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache12 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_39(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 6
  %5 = and i32 %4, 8191
  %6 = and i32 %linear_index3, 63
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 62
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = and i32 %linear_index1, 61
  %9 = and i32 %3, 60
  %10 = lshr i32 %0, 3
  %11 = and i32 %10, 192
  %12 = or i32 %9, %11
  %13 = zext i32 %5 to i64
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %14
  %16 = load <2 x float>, ptr addrspace(1) %15, align 16, !invariant.load !49
  %17 = extractelement <2 x float> %16, i32 0
  %18 = extractelement <2 x float> %16, i32 1
  %19 = zext i32 %linear_index_base to i64
  %20 = getelementptr float, ptr addrspace(1) %arg13, i64 %19
  %21 = or i32 %8, %11
  %22 = zext i32 %21 to i64
  %23 = or i32 %7, %11
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 8, !invariant.load !49
  %27 = or i32 %6, %11
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !49
  %31 = insertelement <4 x float> poison, float %17, i32 0
  %32 = insertelement <4 x float> %31, float %18, i32 1
  %33 = insertelement <4 x float> %32, float %26, i32 2
  %34 = insertelement <4 x float> %33, float %30, i32 3
  store <4 x float> %34, ptr addrspace(1) %20, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_3(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(33816576) %arg2) local_unnamed_addr #2 {
entry:
  %arg240 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg138 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg036 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 1032
  %5 = mul i32 %4, 1032
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 1032
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 1032
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 1032
  %9 = icmp ult i32 %.decomposed, 64
  br i1 %9, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %entry
  %10 = udiv i32 %linear_index_base, 1032
  %11 = shl nuw nsw i32 %10, 6
  %12 = add nuw nsw i32 %11, %.decomposed
  br label %concatenate.3.merge

concatenate.pivot.64.1:                           ; preds = %entry
  %13 = add nsw i32 %.decomposed, -64
  %14 = udiv i32 %linear_index_base, 1032
  %15 = mul nuw nsw i32 %14, 968
  %16 = add nuw nsw i32 %13, %15
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.sink29 = phi i32 [ %16, %concatenate.pivot.64.1 ], [ %12, %concatenate.pivot.0. ]
  %arg1.sink = phi ptr addrspace(1) [ %arg138, %concatenate.pivot.64.1 ], [ %arg036, %concatenate.pivot.0. ]
  %17 = zext i32 %.sink29 to i64
  %18 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink, i64 %17
  %19 = load float, ptr addrspace(1) %18, align 4, !invariant.load !49
  %20 = zext i32 %linear_index_base to i64
  %21 = getelementptr float, ptr addrspace(1) %arg240, i64 %20
  store float %19, ptr addrspace(1) %21, align 16
  %22 = icmp ult i32 %6, 64
  br i1 %22, label %concatenate.pivot.0.6, label %concatenate.pivot.64.7

concatenate.pivot.0.6:                            ; preds = %concatenate.3.merge
  %23 = udiv i32 %linear_index_base, 1032
  %24 = shl nuw nsw i32 %23, 6
  %25 = add nuw nsw i32 %24, %6
  br label %concatenate.3.merge2

concatenate.pivot.64.7:                           ; preds = %concatenate.3.merge
  %26 = add nsw i32 %6, -64
  %27 = udiv i32 %linear_index_base, 1032
  %28 = mul nuw nsw i32 %27, 968
  %29 = add nuw nsw i32 %26, %28
  br label %concatenate.3.merge2

concatenate.3.merge2:                             ; preds = %concatenate.pivot.64.7, %concatenate.pivot.0.6
  %.sink31 = phi i32 [ %29, %concatenate.pivot.64.7 ], [ %25, %concatenate.pivot.0.6 ]
  %arg1.sink30 = phi ptr addrspace(1) [ %arg138, %concatenate.pivot.64.7 ], [ %arg036, %concatenate.pivot.0.6 ]
  %30 = zext i32 %.sink31 to i64
  %31 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink30, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !49
  %33 = getelementptr inbounds float, ptr addrspace(1) %21, i64 1
  store float %32, ptr addrspace(1) %33, align 4
  %34 = icmp ult i32 %7, 64
  br i1 %34, label %concatenate.pivot.0.12, label %concatenate.pivot.64.13

concatenate.pivot.0.12:                           ; preds = %concatenate.3.merge2
  %35 = udiv i32 %linear_index_base, 1032
  %36 = shl nuw nsw i32 %35, 6
  %37 = add nuw nsw i32 %36, %7
  br label %concatenate.3.merge8

concatenate.pivot.64.13:                          ; preds = %concatenate.3.merge2
  %38 = add nsw i32 %7, -64
  %39 = udiv i32 %linear_index_base, 1032
  %40 = mul nuw nsw i32 %39, 968
  %41 = add nuw nsw i32 %38, %40
  br label %concatenate.3.merge8

concatenate.3.merge8:                             ; preds = %concatenate.pivot.64.13, %concatenate.pivot.0.12
  %.sink33 = phi i32 [ %41, %concatenate.pivot.64.13 ], [ %37, %concatenate.pivot.0.12 ]
  %arg1.sink32 = phi ptr addrspace(1) [ %arg138, %concatenate.pivot.64.13 ], [ %arg036, %concatenate.pivot.0.12 ]
  %42 = zext i32 %.sink33 to i64
  %43 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink32, i64 %42
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !49
  %45 = getelementptr inbounds float, ptr addrspace(1) %21, i64 2
  store float %44, ptr addrspace(1) %45, align 8
  %46 = icmp ult i32 %8, 64
  br i1 %46, label %concatenate.pivot.0.18, label %concatenate.pivot.64.19

concatenate.pivot.0.18:                           ; preds = %concatenate.3.merge8
  %47 = udiv i32 %linear_index_base, 1032
  %48 = shl nuw nsw i32 %47, 6
  %49 = add nuw nsw i32 %48, %8
  br label %concatenate.3.merge14

concatenate.pivot.64.19:                          ; preds = %concatenate.3.merge8
  %50 = add nsw i32 %8, -64
  %51 = mul nuw nsw i32 %4, 968
  %52 = add nuw nsw i32 %50, %51
  br label %concatenate.3.merge14

concatenate.3.merge14:                            ; preds = %concatenate.pivot.64.19, %concatenate.pivot.0.18
  %.sink35 = phi i32 [ %52, %concatenate.pivot.64.19 ], [ %49, %concatenate.pivot.0.18 ]
  %arg1.sink34 = phi ptr addrspace(1) [ %arg138, %concatenate.pivot.64.19 ], [ %arg036, %concatenate.pivot.0.18 ]
  %53 = zext i32 %.sink35 to i64
  %54 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink34, i64 %53
  %55 = load float, ptr addrspace(1) %54, align 4, !invariant.load !49
  %56 = getelementptr inbounds float, ptr addrspace(1) %21, i64 3
  store float %55, ptr addrspace(1) %56, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_38(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(838860800) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg4) local_unnamed_addr #3 {
entry:
  %arg4108 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3106 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2104 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1102 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0100 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 3276800
  br i1 %6, label %tile_loop.loop_header27.preheader, label %common.ret

tile_loop.loop_header27.preheader:                ; preds = %entry
  %7 = shl nuw nsw i32 %5, 6
  %8 = or i32 %2, %7
  %9 = urem i32 %5, 100
  %10 = udiv i32 %5, 100
  %11 = and i32 %10, 8191
  %12 = udiv i32 %5, 819200
  %13 = zext i32 %12 to i64
  %14 = zext i32 %11 to i64
  %15 = zext i32 %2 to i64
  %Arg_0.133 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 %13, i64 %14, i64 %15
  %Arg_0.134 = load float, ptr addrspace(1) %Arg_0.133, align 4, !invariant.load !49
  %16 = zext i32 %8 to i64
  %Arg_2.335 = getelementptr inbounds float, ptr addrspace(1) %arg2104, i64 %16
  %Arg_2.336 = load float, ptr addrspace(1) %Arg_2.335, align 4, !invariant.load !49
  %multiply.1837 = fmul float %Arg_0.134, %Arg_2.336
  %add.23.i97 = fadd float %multiply.1837, 0.000000e+00
  %17 = shl nuw nsw i32 %9, 6
  %18 = mul nuw nsw i32 %11, 6400
  %19 = mul nuw nsw i32 %12, 52428800
  %20 = add nuw nsw i32 %18, %19
  %21 = add nuw nsw i32 %20, %17
  %.masked = and i32 %17, 192
  %22 = or i32 %.masked, %2
  %23 = lshr i32 %21, 8
  %24 = urem i32 %23, 100
  %25 = udiv i32 %21, 25600
  %26 = icmp ult i32 %22, 128
  br i1 %26, label %concatenate.pivot.64.65, label %concatenate.pivot.192.68

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %concatenate.16.merge39.1
  %27 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %27, label %reduction_write_output-true, label %common.ret

concatenate.pivot.192.68.1:                       ; preds = %concatenate.16.merge39
  %28 = icmp ult i32 %86, 192
  %29 = zext i32 %25 to i64
  %30 = zext i32 %24 to i64
  br i1 %28, label %concatenate.pivot.128.69.1, label %concatenate.pivot.192.70.1

concatenate.pivot.192.70.1:                       ; preds = %concatenate.pivot.192.68.1
  %31 = add nsw i32 %86, -192
  %32 = getelementptr [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %29, i64 0, i64 %30
  %Arg_1.259.1110 = getelementptr inbounds float, ptr addrspace(1) %32, i64 2457600
  %33 = zext i32 %31 to i64
  %34 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %29, i64 %33
  %Arg_0.161.1111 = getelementptr inbounds float, ptr addrspace(1) %34, i64 1572864
  br label %concatenate.16.merge39.1

concatenate.pivot.128.69.1:                       ; preds = %concatenate.pivot.192.68.1
  %35 = add nsw i32 %86, -128
  %36 = getelementptr [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %29, i64 0, i64 %30
  %Arg_1.253.1112 = getelementptr inbounds float, ptr addrspace(1) %36, i64 1638400
  %37 = zext i32 %35 to i64
  %38 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %29, i64 %37
  %Arg_0.155.1113 = getelementptr inbounds float, ptr addrspace(1) %38, i64 1048576
  br label %concatenate.16.merge39.1

concatenate.pivot.64.65.1:                        ; preds = %concatenate.16.merge39
  %39 = icmp ult i32 %86, 64
  br i1 %39, label %concatenate.pivot.0.66.1, label %concatenate.pivot.64.67.1

concatenate.pivot.64.67.1:                        ; preds = %concatenate.pivot.64.65.1
  %40 = add nsw i32 %86, -64
  %41 = zext i32 %25 to i64
  %42 = zext i32 %24 to i64
  %43 = getelementptr [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %41, i64 0, i64 %42
  %Arg_1.247.1114 = getelementptr inbounds float, ptr addrspace(1) %43, i64 819200
  %44 = zext i32 %40 to i64
  %45 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %41, i64 %44
  %Arg_0.149.1115 = getelementptr inbounds float, ptr addrspace(1) %45, i64 524288
  br label %concatenate.16.merge39.1

concatenate.pivot.0.66.1:                         ; preds = %concatenate.pivot.64.65.1
  %46 = zext i32 %25 to i64
  %47 = zext i32 %24 to i64
  %Arg_1.241.1 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %46, i64 0, i64 %47
  %48 = zext i32 %.masked to i64
  %49 = add i64 %48, %15
  %50 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %46, i64 %49
  %Arg_0.143.1117 = getelementptr inbounds float, ptr addrspace(1) %50, i64 32
  br label %concatenate.16.merge39.1

concatenate.16.merge39.1:                         ; preds = %concatenate.pivot.0.66.1, %concatenate.pivot.64.67.1, %concatenate.pivot.128.69.1, %concatenate.pivot.192.70.1
  %Arg_0.143.1.sink = phi ptr addrspace(1) [ %Arg_0.143.1117, %concatenate.pivot.0.66.1 ], [ %Arg_0.149.1115, %concatenate.pivot.64.67.1 ], [ %Arg_0.155.1113, %concatenate.pivot.128.69.1 ], [ %Arg_0.161.1111, %concatenate.pivot.192.70.1 ]
  %Arg_1.242.1.sink.in = phi ptr addrspace(1) [ %Arg_1.241.1, %concatenate.pivot.0.66.1 ], [ %Arg_1.247.1114, %concatenate.pivot.64.67.1 ], [ %Arg_1.253.1112, %concatenate.pivot.128.69.1 ], [ %Arg_1.259.1110, %concatenate.pivot.192.70.1 ]
  %Arg_1.242.1.sink = load float, ptr addrspace(1) %Arg_1.242.1.sink.in, align 4, !invariant.load !49
  %Arg_0.144.1 = load float, ptr addrspace(1) %Arg_0.143.1.sink, align 4, !invariant.load !49
  %multiply.745.1 = fmul float %Arg_1.242.1.sink, %Arg_0.144.1
  %51 = getelementptr float, ptr addrspace(1) %arg3106, i64 %84
  %52 = getelementptr inbounds float, ptr addrspace(1) %51, i64 32
  store float %multiply.745.1, ptr addrspace(1) %52, align 4
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i97.1, i32 16, i32 31)
  %add.23.i = fadd float %add.23.i97.1, %53
  %54 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i, i32 8, i32 31)
  %add.23.i93 = fadd float %add.23.i, %54
  %55 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i93, i32 4, i32 31)
  %add.23.i94 = fadd float %add.23.i93, %55
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i94, i32 2, i32 31)
  %add.23.i95 = fadd float %add.23.i94, %56
  %57 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i95, i32 1, i32 31)
  %58 = icmp eq i32 %2, 0
  %59 = zext i32 %3 to i64
  %60 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %59, i64 0, i64 0
  %add.23.i96 = fadd float %add.23.i95, %57
  br i1 %58, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

concatenate.pivot.64.65:                          ; preds = %tile_loop.loop_header27.preheader
  %61 = icmp ult i32 %22, 64
  br i1 %61, label %concatenate.pivot.0.66, label %concatenate.pivot.64.67

concatenate.pivot.0.66:                           ; preds = %concatenate.pivot.64.65
  %62 = zext i32 %25 to i64
  %63 = zext i32 %24 to i64
  %Arg_1.241 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %62, i64 0, i64 %63
  %64 = zext i32 %22 to i64
  %Arg_0.143 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %62, i64 %64
  br label %concatenate.16.merge39

concatenate.pivot.64.67:                          ; preds = %concatenate.pivot.64.65
  %65 = add nsw i32 %22, -64
  %66 = zext i32 %25 to i64
  %67 = zext i32 %24 to i64
  %68 = getelementptr [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %66, i64 0, i64 %67
  %Arg_1.247119 = getelementptr inbounds float, ptr addrspace(1) %68, i64 819200
  %69 = zext i32 %65 to i64
  %70 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %66, i64 %69
  %Arg_0.149120 = getelementptr inbounds float, ptr addrspace(1) %70, i64 524288
  br label %concatenate.16.merge39

concatenate.pivot.192.68:                         ; preds = %tile_loop.loop_header27.preheader
  %71 = icmp ult i32 %22, 192
  %72 = zext i32 %25 to i64
  %73 = zext i32 %24 to i64
  br i1 %71, label %concatenate.pivot.128.69, label %concatenate.pivot.192.70

concatenate.pivot.128.69:                         ; preds = %concatenate.pivot.192.68
  %74 = add nsw i32 %22, -128
  %75 = getelementptr [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %72, i64 0, i64 %73
  %Arg_1.253121 = getelementptr inbounds float, ptr addrspace(1) %75, i64 1638400
  %76 = zext i32 %74 to i64
  %77 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %72, i64 %76
  %Arg_0.155122 = getelementptr inbounds float, ptr addrspace(1) %77, i64 1048576
  br label %concatenate.16.merge39

concatenate.pivot.192.70:                         ; preds = %concatenate.pivot.192.68
  %78 = add nsw i32 %22, -192
  %79 = getelementptr [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %72, i64 0, i64 %73
  %Arg_1.259123 = getelementptr inbounds float, ptr addrspace(1) %79, i64 2457600
  %80 = zext i32 %78 to i64
  %81 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %72, i64 %80
  %Arg_0.161124 = getelementptr inbounds float, ptr addrspace(1) %81, i64 1572864
  br label %concatenate.16.merge39

concatenate.16.merge39:                           ; preds = %concatenate.pivot.192.70, %concatenate.pivot.128.69, %concatenate.pivot.64.67, %concatenate.pivot.0.66
  %Arg_0.161.sink = phi ptr addrspace(1) [ %Arg_0.161124, %concatenate.pivot.192.70 ], [ %Arg_0.155122, %concatenate.pivot.128.69 ], [ %Arg_0.149120, %concatenate.pivot.64.67 ], [ %Arg_0.143, %concatenate.pivot.0.66 ]
  %Arg_1.260.sink.in = phi ptr addrspace(1) [ %Arg_1.259123, %concatenate.pivot.192.70 ], [ %Arg_1.253121, %concatenate.pivot.128.69 ], [ %Arg_1.247119, %concatenate.pivot.64.67 ], [ %Arg_1.241, %concatenate.pivot.0.66 ]
  %Arg_1.260.sink = load float, ptr addrspace(1) %Arg_1.260.sink.in, align 4, !invariant.load !49
  %Arg_0.162 = load float, ptr addrspace(1) %Arg_0.161.sink, align 4, !invariant.load !49
  %multiply.763 = fmul float %Arg_1.260.sink, %Arg_0.162
  %82 = getelementptr inbounds float, ptr addrspace(1) %arg3106, i64 %16
  store float %multiply.763, ptr addrspace(1) %82, align 4
  %x_loc32.1 = or i32 %2, 32
  %Arg_0.133.1126 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.133, i64 32
  %Arg_0.134.1 = load float, ptr addrspace(1) %Arg_0.133.1126, align 4, !invariant.load !49
  %83 = zext i32 %7 to i64
  %84 = add i64 %15, %83
  %85 = getelementptr float, ptr addrspace(1) %arg2104, i64 %84
  %Arg_2.335.1128 = getelementptr inbounds float, ptr addrspace(1) %85, i64 32
  %Arg_2.336.1 = load float, ptr addrspace(1) %Arg_2.335.1128, align 4, !invariant.load !49
  %multiply.1837.1 = fmul float %Arg_0.134.1, %Arg_2.336.1
  %add.23.i97.1 = fadd float %add.23.i97, %multiply.1837.1
  %86 = or i32 %.masked, %x_loc32.1
  %87 = icmp ult i32 %86, 128
  br i1 %87, label %concatenate.pivot.64.65.1, label %concatenate.pivot.192.68.1

intra_warp_reduce_write-true:                     ; preds = %concatenate.16.merge39.1
  store float %add.23.i96, ptr addrspace(3) %60, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %.frozen = freeze i32 %5
  %88 = udiv i32 %.frozen, 100
  %89 = mul i32 %88, 100
  %.decomposed = sub i32 %.frozen, %89
  %90 = and i32 %88, 8191
  %91 = zext i32 %90 to i64
  %92 = zext i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg4108, i64 0, i64 %13, i64 %91, i64 %92
  %output.then.val = load float, ptr addrspace(3) %60, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #1

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #4

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #5

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_36(ptr noalias nocapture readonly align 16 dereferenceable(8192) %arg0, ptr noalias nocapture align 128 dereferenceable(8192) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(8192) %arg3, ptr noalias nocapture align 128 dereferenceable(8192) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !53
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !49
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !49
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !49
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %3
  %12 = load float, ptr addrspace(1) %11, align 4
  %multiply.9 = fmul float %6, %12
  %subtract.10 = fsub float %10, %multiply.9
  store float %subtract.8, ptr addrspace(1) %11, align 4
  store float %subtract.10, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_32(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #3 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
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
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !49
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !49
  %multiply.416 = fmul float %Arg_1.213, %Arg_0.115
  %add.10.i41 = fadd float %multiply.416, 0.000000e+00
  %10 = zext i32 %7 to i64
  %11 = zext i32 %2 to i64
  %12 = add i64 %11, %10
  %13 = getelementptr float, ptr addrspace(1) %arg044, i64 %12
  %Arg_0.114.151 = getelementptr inbounds float, ptr addrspace(1) %13, i64 32
  %14 = getelementptr float, ptr addrspace(1) %arg146, i64 %12
  %Arg_1.212.153 = getelementptr inbounds float, ptr addrspace(1) %14, i64 32
  %Arg_1.213.1 = load float, ptr addrspace(1) %Arg_1.212.153, align 4, !invariant.load !49
  %Arg_0.115.1 = load float, ptr addrspace(1) %Arg_0.114.151, align 4, !invariant.load !49
  %multiply.416.1 = fmul float %Arg_1.213.1, %Arg_0.115.1
  %add.10.i41.1 = fadd float %add.10.i41, %multiply.416.1
  %Arg_0.114.255 = getelementptr inbounds float, ptr addrspace(1) %13, i64 64
  %Arg_1.212.257 = getelementptr inbounds float, ptr addrspace(1) %14, i64 64
  %Arg_1.213.2 = load float, ptr addrspace(1) %Arg_1.212.257, align 4, !invariant.load !49
  %Arg_0.115.2 = load float, ptr addrspace(1) %Arg_0.114.255, align 4, !invariant.load !49
  %multiply.416.2 = fmul float %Arg_1.213.2, %Arg_0.115.2
  %add.10.i41.2 = fadd float %add.10.i41.1, %multiply.416.2
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
  %19 = lshr i32 %5, 13
  %20 = zext i32 %19 to i64
  %21 = and i32 %5, 8191
  %22 = zext i32 %21 to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr addrspace(1) %arg248, i64 0, i64 %20, i64 %22
  br i1 %18, label %reduction_write_output-true, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header6.preheader
  %Arg_1.213.3 = load float, ptr addrspace(1) %Arg_1.212.3, align 4, !invariant.load !49
  %Arg_0.115.3 = load float, ptr addrspace(1) %Arg_0.114.3, align 4, !invariant.load !49
  %multiply.416.3 = fmul float %Arg_1.213.3, %Arg_0.115.3
  %add.10.i41.3 = fadd float %add.10.i41.2, %multiply.416.3
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header6.preheader
  %partial_reduction_result.1.3 = phi float [ %add.10.i41.3, %x_in_tile-true.3 ], [ %add.10.i41.2, %tile_loop.loop_header6.preheader ]
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %add.10.i = fadd float %partial_reduction_result.1.3, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i, i32 8, i32 31)
  %add.10.i37 = fadd float %add.10.i, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i37, i32 4, i32 31)
  %add.10.i38 = fadd float %add.10.i37, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i38, i32 2, i32 31)
  %add.10.i39 = fadd float %add.10.i38, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i39, i32 1, i32 31)
  %28 = icmp eq i32 %2, 0
  %29 = zext i32 %3 to i64
  %30 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %29, i64 0, i64 0
  %add.10.i40 = fadd float %add.10.i39, %27
  br i1 %28, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.10.i40, ptr addrspace(3) %30, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %30, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_31(ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = udiv i32 %linear_index_base, 100
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %arg211, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16, !invariant.load !49
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %12 = zext i32 %4 to i64
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg19, i64 %12
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !49
  %subtract.6 = fsub float %8, %14
  %15 = getelementptr float, ptr addrspace(1) %arg07, i64 %5
  %16 = load <4 x float>, ptr addrspace(1) %15, align 16, !invariant.load !49
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
define void @fusion_37(ptr noalias nocapture readonly align 16 dereferenceable(155648) %arg0, ptr noalias nocapture align 128 dereferenceable(155648) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !57
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !49
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !49
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_26(ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(3276800) %arg13) local_unnamed_addr #0 {
entry:
  %arg13279 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg12277 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11275 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10273 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9271 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8269 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7267 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6265 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5263 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4261 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3259 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2257 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1255 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0253 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !58
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.fr = freeze i32 %linear_index_base
  %linear_index1 = or i32 %linear_index_base.fr, 1
  %linear_index2 = or i32 %linear_index_base.fr, 2
  %linear_index3 = or i32 %linear_index_base.fr, 3
  %4 = udiv i32 %linear_index_base.fr, 100
  %5 = mul i32 %4, 100
  %.decomposed = sub i32 %linear_index_base.fr, %5
  %6 = zext i32 %linear_index_base.fr to i64
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg0253, i64 %6
  %8 = load float, ptr addrspace(1) %7, align 16, !invariant.load !49
  %9 = load float, ptr addrspace(1) %arg2257, align 16, !invariant.load !49
  %10 = zext i32 %4 to i64
  %11 = zext i32 %.decomposed to i64
  %12 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg3259, i64 0, i64 0, i64 %10, i64 0, i64 %11
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !49
  %14 = load <4 x float>, ptr addrspace(1) %arg1255, align 16, !invariant.load !49
  %15 = extractelement <4 x float> %14, i32 0
  %16 = extractelement <4 x float> %14, i32 1
  %17 = extractelement <4 x float> %14, i32 2
  %18 = extractelement <4 x float> %14, i32 3
  %multiply.15 = fmul float %13, %15
  %add.20.i = fadd float %multiply.15, 0.000000e+00
  %19 = getelementptr inbounds float, ptr addrspace(1) %12, i64 819200
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !49
  %multiply.15.1 = fmul float %20, %16
  %add.20.i.1 = fadd float %add.20.i, %multiply.15.1
  %21 = getelementptr inbounds float, ptr addrspace(1) %12, i64 1638400
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !49
  %multiply.15.2 = fmul float %22, %17
  %add.20.i.2 = fadd float %add.20.i.1, %multiply.15.2
  %23 = getelementptr inbounds float, ptr addrspace(1) %12, i64 2457600
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !49
  %multiply.15.3 = fmul float %24, %18
  %add.20.i.3 = fadd float %add.20.i.2, %multiply.15.3
  %25 = urem i32 %linear_index1, 100
  %26 = urem i32 %linear_index3, 100
  %multiply.22 = fmul float %9, %add.20.i.3
  %27 = sext i32 %linear_index_base.fr to i64
  %28 = getelementptr inbounds float, ptr addrspace(1) %arg4261, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !49
  %30 = load <4 x float>, ptr addrspace(1) %arg5263, align 16, !invariant.load !49
  %31 = extractelement <4 x float> %30, i32 0
  %32 = extractelement <4 x float> %30, i32 1
  %33 = extractelement <4 x float> %30, i32 2
  %34 = extractelement <4 x float> %30, i32 3
  %multiply.27 = fmul float %13, %31
  %add.31.i = fadd float %multiply.27, 0.000000e+00
  %multiply.27.1 = fmul float %20, %32
  %add.31.i.1 = fadd float %add.31.i, %multiply.27.1
  %multiply.27.2 = fmul float %22, %33
  %add.31.i.2 = fadd float %add.31.i.1, %multiply.27.2
  %multiply.27.3 = fmul float %24, %34
  %add.31.i.3 = fadd float %add.31.i.2, %multiply.27.3
  %multiply.33 = fmul float %9, %add.31.i.3
  %35 = getelementptr inbounds float, ptr addrspace(1) %arg6265, i64 %27
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !49
  %37 = load <4 x float>, ptr addrspace(1) %arg7267, align 16, !invariant.load !49
  %38 = extractelement <4 x float> %37, i32 0
  %39 = extractelement <4 x float> %37, i32 1
  %40 = extractelement <4 x float> %37, i32 2
  %41 = extractelement <4 x float> %37, i32 3
  %multiply.38 = fmul float %13, %38
  %add.42.i = fadd float %multiply.38, 0.000000e+00
  %multiply.38.1 = fmul float %20, %39
  %add.42.i.1 = fadd float %add.42.i, %multiply.38.1
  %multiply.38.2 = fmul float %22, %40
  %add.42.i.2 = fadd float %add.42.i.1, %multiply.38.2
  %multiply.38.3 = fmul float %24, %41
  %add.42.i.3 = fadd float %add.42.i.2, %multiply.38.3
  %subtract.24 = fsub float %8, %multiply.22
  %multiply.44 = fmul float %9, %add.42.i.3
  %42 = getelementptr inbounds float, ptr addrspace(1) %arg8269, i64 %27
  %43 = load float, ptr addrspace(1) %42, align 4, !invariant.load !49
  %44 = load <4 x float>, ptr addrspace(1) %arg9271, align 16, !invariant.load !49
  %45 = extractelement <4 x float> %44, i32 0
  %46 = extractelement <4 x float> %44, i32 1
  %47 = extractelement <4 x float> %44, i32 2
  %48 = extractelement <4 x float> %44, i32 3
  %multiply.49 = fmul float %13, %45
  %add.53.i = fadd float %multiply.49, 0.000000e+00
  %multiply.49.1 = fmul float %20, %46
  %add.53.i.1 = fadd float %add.53.i, %multiply.49.1
  %multiply.49.2 = fmul float %22, %47
  %add.53.i.2 = fadd float %add.53.i.1, %multiply.49.2
  %multiply.49.3 = fmul float %24, %48
  %add.53.i.3 = fadd float %add.53.i.2, %multiply.49.3
  %subtract.35 = fsub float %29, %multiply.33
  %subtract.46 = fsub float %36, %multiply.44
  %multiply.55 = fmul float %9, %add.53.i.3
  %subtract.57 = fsub float %43, %multiply.55
  %49 = getelementptr inbounds float, ptr addrspace(1) %arg10273, i64 %27
  store float %subtract.24, ptr addrspace(1) %49, align 4
  %50 = getelementptr inbounds float, ptr addrspace(1) %arg11275, i64 %27
  store float %subtract.35, ptr addrspace(1) %50, align 4
  %51 = getelementptr inbounds float, ptr addrspace(1) %arg12277, i64 %27
  store float %subtract.46, ptr addrspace(1) %51, align 4
  %52 = getelementptr inbounds float, ptr addrspace(1) %arg13279, i64 %27
  store float %subtract.57, ptr addrspace(1) %52, align 4
  %53 = sext i32 %linear_index1 to i64
  %54 = getelementptr inbounds float, ptr addrspace(1) %arg0253, i64 %53
  %55 = load float, ptr addrspace(1) %54, align 4, !invariant.load !49
  %56 = add nuw nsw i32 %25, %5
  %.frozen = freeze i32 %56
  %57 = udiv i32 %.frozen, 100
  %58 = mul i32 %57, 100
  %.decomposed248 = sub i32 %.frozen, %58
  %59 = zext i32 %57 to i64
  %60 = zext i32 %.decomposed248 to i64
  %61 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg3259, i64 0, i64 0, i64 %59, i64 0, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4, !invariant.load !49
  %multiply.1528 = fmul float %62, %15
  %add.20.i204 = fadd float %multiply.1528, 0.000000e+00
  %63 = getelementptr inbounds float, ptr addrspace(1) %61, i64 819200
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !49
  %multiply.1528.1 = fmul float %64, %16
  %add.20.i204.1 = fadd float %add.20.i204, %multiply.1528.1
  %65 = getelementptr inbounds float, ptr addrspace(1) %61, i64 1638400
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !49
  %multiply.1528.2 = fmul float %66, %17
  %add.20.i204.2 = fadd float %add.20.i204.1, %multiply.1528.2
  %67 = getelementptr inbounds float, ptr addrspace(1) %61, i64 2457600
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !49
  %multiply.1528.3 = fmul float %68, %18
  %add.20.i204.3 = fadd float %add.20.i204.2, %multiply.1528.3
  %multiply.2232 = fmul float %9, %add.20.i204.3
  %69 = getelementptr inbounds float, ptr addrspace(1) %arg4261, i64 %53
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !49
  %multiply.2742 = fmul float %62, %31
  %add.31.i205 = fadd float %multiply.2742, 0.000000e+00
  %multiply.2742.1 = fmul float %64, %32
  %add.31.i205.1 = fadd float %add.31.i205, %multiply.2742.1
  %multiply.2742.2 = fmul float %66, %33
  %add.31.i205.2 = fadd float %add.31.i205.1, %multiply.2742.2
  %multiply.2742.3 = fmul float %68, %34
  %add.31.i205.3 = fadd float %add.31.i205.2, %multiply.2742.3
  %71 = urem i32 %linear_index2, 100
  %multiply.3346 = fmul float %9, %add.31.i205.3
  %72 = getelementptr inbounds float, ptr addrspace(1) %arg6265, i64 %53
  %73 = load float, ptr addrspace(1) %72, align 4, !invariant.load !49
  %multiply.3856 = fmul float %62, %38
  %add.42.i206 = fadd float %multiply.3856, 0.000000e+00
  %multiply.3856.1 = fmul float %64, %39
  %add.42.i206.1 = fadd float %add.42.i206, %multiply.3856.1
  %multiply.3856.2 = fmul float %66, %40
  %add.42.i206.2 = fadd float %add.42.i206.1, %multiply.3856.2
  %multiply.3856.3 = fmul float %68, %41
  %add.42.i206.3 = fadd float %add.42.i206.2, %multiply.3856.3
  %subtract.2433 = fsub float %55, %multiply.2232
  %multiply.4460 = fmul float %9, %add.42.i206.3
  %74 = getelementptr inbounds float, ptr addrspace(1) %arg8269, i64 %53
  %75 = load float, ptr addrspace(1) %74, align 4, !invariant.load !49
  %multiply.4970 = fmul float %62, %45
  %add.53.i207 = fadd float %multiply.4970, 0.000000e+00
  %multiply.4970.1 = fmul float %64, %46
  %add.53.i207.1 = fadd float %add.53.i207, %multiply.4970.1
  %multiply.4970.2 = fmul float %66, %47
  %add.53.i207.2 = fadd float %add.53.i207.1, %multiply.4970.2
  %multiply.4970.3 = fmul float %68, %48
  %add.53.i207.3 = fadd float %add.53.i207.2, %multiply.4970.3
  %subtract.3547 = fsub float %70, %multiply.3346
  %subtract.4661 = fsub float %73, %multiply.4460
  %multiply.5574 = fmul float %9, %add.53.i207.3
  %subtract.5775 = fsub float %75, %multiply.5574
  %76 = getelementptr inbounds float, ptr addrspace(1) %arg10273, i64 %53
  store float %subtract.2433, ptr addrspace(1) %76, align 4
  %77 = getelementptr inbounds float, ptr addrspace(1) %arg11275, i64 %53
  store float %subtract.3547, ptr addrspace(1) %77, align 4
  %78 = getelementptr inbounds float, ptr addrspace(1) %arg12277, i64 %53
  store float %subtract.4661, ptr addrspace(1) %78, align 4
  %79 = getelementptr inbounds float, ptr addrspace(1) %arg13279, i64 %53
  store float %subtract.5775, ptr addrspace(1) %79, align 4
  %80 = sext i32 %linear_index2 to i64
  %81 = getelementptr inbounds float, ptr addrspace(1) %arg0253, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4, !invariant.load !49
  %83 = add nuw nsw i32 %71, %5
  %.frozen249 = freeze i32 %83
  %84 = udiv i32 %.frozen249, 100
  %85 = mul i32 %84, 100
  %.decomposed250 = sub i32 %.frozen249, %85
  %86 = zext i32 %84 to i64
  %87 = zext i32 %.decomposed250 to i64
  %88 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg3259, i64 0, i64 0, i64 %86, i64 0, i64 %87
  %89 = load float, ptr addrspace(1) %88, align 4, !invariant.load !49
  %multiply.1584 = fmul float %89, %15
  %add.20.i208 = fadd float %multiply.1584, 0.000000e+00
  %90 = getelementptr inbounds float, ptr addrspace(1) %88, i64 819200
  %91 = load float, ptr addrspace(1) %90, align 4, !invariant.load !49
  %multiply.1584.1 = fmul float %91, %16
  %add.20.i208.1 = fadd float %add.20.i208, %multiply.1584.1
  %92 = getelementptr inbounds float, ptr addrspace(1) %88, i64 1638400
  %93 = load float, ptr addrspace(1) %92, align 4, !invariant.load !49
  %multiply.1584.2 = fmul float %93, %17
  %add.20.i208.2 = fadd float %add.20.i208.1, %multiply.1584.2
  %94 = getelementptr inbounds float, ptr addrspace(1) %88, i64 2457600
  %95 = load float, ptr addrspace(1) %94, align 4, !invariant.load !49
  %multiply.1584.3 = fmul float %95, %18
  %add.20.i208.3 = fadd float %add.20.i208.2, %multiply.1584.3
  %multiply.2288 = fmul float %9, %add.20.i208.3
  %96 = getelementptr inbounds float, ptr addrspace(1) %arg4261, i64 %80
  %97 = load float, ptr addrspace(1) %96, align 4, !invariant.load !49
  %multiply.2798 = fmul float %89, %31
  %add.31.i209 = fadd float %multiply.2798, 0.000000e+00
  %multiply.2798.1 = fmul float %91, %32
  %add.31.i209.1 = fadd float %add.31.i209, %multiply.2798.1
  %multiply.2798.2 = fmul float %93, %33
  %add.31.i209.2 = fadd float %add.31.i209.1, %multiply.2798.2
  %multiply.2798.3 = fmul float %95, %34
  %add.31.i209.3 = fadd float %add.31.i209.2, %multiply.2798.3
  %multiply.33102 = fmul float %9, %add.31.i209.3
  %98 = getelementptr inbounds float, ptr addrspace(1) %arg6265, i64 %80
  %99 = load float, ptr addrspace(1) %98, align 4, !invariant.load !49
  %multiply.38112 = fmul float %89, %38
  %add.42.i210 = fadd float %multiply.38112, 0.000000e+00
  %multiply.38112.1 = fmul float %91, %39
  %add.42.i210.1 = fadd float %add.42.i210, %multiply.38112.1
  %multiply.38112.2 = fmul float %93, %40
  %add.42.i210.2 = fadd float %add.42.i210.1, %multiply.38112.2
  %multiply.38112.3 = fmul float %95, %41
  %add.42.i210.3 = fadd float %add.42.i210.2, %multiply.38112.3
  %subtract.2489 = fsub float %82, %multiply.2288
  %multiply.44116 = fmul float %9, %add.42.i210.3
  %100 = getelementptr inbounds float, ptr addrspace(1) %arg8269, i64 %80
  %101 = load float, ptr addrspace(1) %100, align 4, !invariant.load !49
  %multiply.49126 = fmul float %89, %45
  %add.53.i211 = fadd float %multiply.49126, 0.000000e+00
  %multiply.49126.1 = fmul float %91, %46
  %add.53.i211.1 = fadd float %add.53.i211, %multiply.49126.1
  %multiply.49126.2 = fmul float %93, %47
  %add.53.i211.2 = fadd float %add.53.i211.1, %multiply.49126.2
  %multiply.49126.3 = fmul float %95, %48
  %add.53.i211.3 = fadd float %add.53.i211.2, %multiply.49126.3
  %subtract.35103 = fsub float %97, %multiply.33102
  %subtract.46117 = fsub float %99, %multiply.44116
  %multiply.55130 = fmul float %9, %add.53.i211.3
  %subtract.57131 = fsub float %101, %multiply.55130
  %102 = getelementptr inbounds float, ptr addrspace(1) %arg10273, i64 %80
  store float %subtract.2489, ptr addrspace(1) %102, align 4
  %103 = getelementptr inbounds float, ptr addrspace(1) %arg11275, i64 %80
  store float %subtract.35103, ptr addrspace(1) %103, align 4
  %104 = getelementptr inbounds float, ptr addrspace(1) %arg12277, i64 %80
  store float %subtract.46117, ptr addrspace(1) %104, align 4
  %105 = getelementptr inbounds float, ptr addrspace(1) %arg13279, i64 %80
  store float %subtract.57131, ptr addrspace(1) %105, align 4
  %106 = sext i32 %linear_index3 to i64
  %107 = getelementptr inbounds float, ptr addrspace(1) %arg0253, i64 %106
  %108 = load float, ptr addrspace(1) %107, align 4, !invariant.load !49
  %109 = add nuw nsw i32 %26, %5
  %.frozen251 = freeze i32 %109
  %110 = udiv i32 %.frozen251, 100
  %111 = mul i32 %110, 100
  %.decomposed252 = sub i32 %.frozen251, %111
  %112 = zext i32 %110 to i64
  %113 = zext i32 %.decomposed252 to i64
  %114 = getelementptr inbounds [4 x [8192 x [1 x [100 x float]]]], ptr addrspace(1) %arg3259, i64 0, i64 0, i64 %112, i64 0, i64 %113
  %115 = load float, ptr addrspace(1) %114, align 4, !invariant.load !49
  %multiply.15140 = fmul float %115, %15
  %116 = getelementptr inbounds float, ptr addrspace(1) %114, i64 819200
  %117 = load float, ptr addrspace(1) %116, align 4, !invariant.load !49
  %multiply.15140.1 = fmul float %117, %16
  %118 = getelementptr inbounds float, ptr addrspace(1) %114, i64 1638400
  %119 = load float, ptr addrspace(1) %118, align 4, !invariant.load !49
  %multiply.15140.2 = fmul float %119, %17
  %120 = getelementptr inbounds float, ptr addrspace(1) %114, i64 2457600
  %121 = load float, ptr addrspace(1) %120, align 4, !invariant.load !49
  %multiply.15140.3 = fmul float %121, %18
  %122 = getelementptr inbounds float, ptr addrspace(1) %arg4261, i64 %106
  %123 = load float, ptr addrspace(1) %122, align 4, !invariant.load !49
  %multiply.27154 = fmul float %115, %31
  %multiply.27154.1 = fmul float %117, %32
  %multiply.27154.2 = fmul float %119, %33
  %multiply.27154.3 = fmul float %121, %34
  %add.20.i212 = fadd float %multiply.15140, 0.000000e+00
  %add.20.i212.1 = fadd float %add.20.i212, %multiply.15140.1
  %add.20.i212.2 = fadd float %add.20.i212.1, %multiply.15140.2
  %124 = getelementptr inbounds float, ptr addrspace(1) %arg6265, i64 %106
  %125 = load float, ptr addrspace(1) %124, align 4, !invariant.load !49
  %multiply.38168 = fmul float %115, %38
  %multiply.38168.1 = fmul float %117, %39
  %multiply.38168.2 = fmul float %119, %40
  %multiply.38168.3 = fmul float %121, %41
  %add.31.i213 = fadd float %multiply.27154, 0.000000e+00
  %add.31.i213.1 = fadd float %add.31.i213, %multiply.27154.1
  %add.31.i213.2 = fadd float %add.31.i213.1, %multiply.27154.2
  %add.31.i213.3 = fadd float %add.31.i213.2, %multiply.27154.3
  %126 = getelementptr inbounds float, ptr addrspace(1) %arg8269, i64 %106
  %127 = load float, ptr addrspace(1) %126, align 4, !invariant.load !49
  %multiply.49182 = fmul float %115, %45
  %add.53.i215 = fadd float %multiply.49182, 0.000000e+00
  %multiply.49182.1 = fmul float %117, %46
  %add.53.i215.1 = fadd float %add.53.i215, %multiply.49182.1
  %multiply.49182.2 = fmul float %119, %47
  %add.53.i215.2 = fadd float %add.53.i215.1, %multiply.49182.2
  %multiply.49182.3 = fmul float %121, %48
  %add.53.i215.3 = fadd float %add.53.i215.2, %multiply.49182.3
  %add.42.i214 = fadd float %multiply.38168, 0.000000e+00
  %add.42.i214.1 = fadd float %add.42.i214, %multiply.38168.1
  %add.42.i214.2 = fadd float %add.42.i214.1, %multiply.38168.2
  %add.42.i214.3 = fadd float %add.42.i214.2, %multiply.38168.3
  %add.20.i212.3 = fadd float %add.20.i212.2, %multiply.15140.3
  %multiply.44172 = fmul float %9, %add.42.i214.3
  %subtract.46173 = fsub float %125, %multiply.44172
  %multiply.33158 = fmul float %9, %add.31.i213.3
  %subtract.35159 = fsub float %123, %multiply.33158
  %multiply.22144 = fmul float %9, %add.20.i212.3
  %subtract.24145 = fsub float %108, %multiply.22144
  %multiply.55186 = fmul float %9, %add.53.i215.3
  %subtract.57187 = fsub float %127, %multiply.55186
  %128 = getelementptr inbounds float, ptr addrspace(1) %arg10273, i64 %106
  store float %subtract.24145, ptr addrspace(1) %128, align 4
  %129 = getelementptr inbounds float, ptr addrspace(1) %arg11275, i64 %106
  store float %subtract.35159, ptr addrspace(1) %129, align 4
  %130 = getelementptr inbounds float, ptr addrspace(1) %arg12277, i64 %106
  store float %subtract.46173, ptr addrspace(1) %130, align 4
  %131 = getelementptr inbounds float, ptr addrspace(1) %arg13279, i64 %106
  store float %subtract.57187, ptr addrspace(1) %131, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_12(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8192) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8192) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8192) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8192) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8192) %arg11) local_unnamed_addr #3 {
entry:
  %arg11533 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10531 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9529 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8527 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7525 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6523 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5521 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4519 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3517 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2515 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1513 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0511 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !59
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %2 = shl nuw nsw i32 %0, 1
  %3 = mul nuw nsw i32 %1, 1600
  %Arg_1.2100 = load float, ptr addrspace(1) %arg1513, align 16
  %4 = add nuw nsw i32 %2, %3
  %urem327 = urem i32 %4, 819200
  %urem327.frozen = freeze i32 %urem327
  %5 = udiv i32 %urem327.frozen, 100
  %6 = zext i32 %4 to i64
  %Arg_0.173 = getelementptr inbounds float, ptr addrspace(1) %arg0511, i64 %6
  %7 = load <2 x float>, ptr addrspace(1) %Arg_0.173, align 8, !invariant.load !49
  %Arg_0.174574 = extractelement <2 x float> %7, i32 0
  %Arg_0.1108575 = extractelement <2 x float> %7, i32 1
  %add.15.i407 = fadd float %Arg_0.174574, 0.000000e+00
  %8 = mul i32 %5, 100
  %.decomposed = sub i32 %urem327.frozen, %8
  %9 = zext i32 %5 to i64
  %10 = zext i32 %.decomposed to i64
  %Arg_2.378 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %9, i64 %10, i64 0
  %Arg_2.379 = load float, ptr addrspace(1) %Arg_2.378, align 4, !invariant.load !49
  %multiply.2080 = fmul float %Arg_0.174574, %Arg_2.379
  %add.25.i408 = fadd float %multiply.2080, 0.000000e+00
  %Arg_3.484 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %9, i64 %10, i64 0
  %Arg_3.485 = load float, ptr addrspace(1) %Arg_3.484, align 4, !invariant.load !49
  %multiply.2986 = fmul float %Arg_0.174574, %Arg_3.485
  %add.34.i409 = fadd float %multiply.2986, 0.000000e+00
  %Arg_4.590 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %9, i64 %10, i64 0
  %Arg_4.591 = load float, ptr addrspace(1) %Arg_4.590, align 4, !invariant.load !49
  %multiply.3892 = fmul float %Arg_0.174574, %Arg_4.591
  %add.43.i410 = fadd float %multiply.3892, 0.000000e+00
  %Arg_5.696 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %9, i64 %10, i64 0
  %Arg_5.697 = load float, ptr addrspace(1) %Arg_5.696, align 4, !invariant.load !49
  %multiply.4798 = fmul float %Arg_0.174574, %Arg_5.697
  %add.52.i411 = fadd float %multiply.4798, 0.000000e+00
  %multiply.8103 = fmul float %Arg_0.174574, %Arg_1.2100
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg6523, i64 %6
  %x_loc104 = or i32 %2, 1
  %12 = add nuw nsw i32 %x_loc104, %3
  %urem = urem i32 %12, 819200
  %urem.frozen = freeze i32 %urem
  %13 = udiv i32 %urem.frozen, 100
  %14 = zext i32 %3 to i64
  %15 = zext i32 %2 to i64
  %16 = add i64 %15, %14
  %17 = getelementptr float, ptr addrspace(1) %arg0511, i64 %16
  %add.15.i412 = fadd float %add.15.i407, %Arg_0.1108575
  %18 = mul i32 %13, 100
  %.decomposed498 = sub i32 %urem.frozen, %18
  %19 = zext i32 %13 to i64
  %20 = zext i32 %.decomposed498 to i64
  %Arg_2.3112 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %19, i64 %20, i64 0
  %Arg_2.3113 = load float, ptr addrspace(1) %Arg_2.3112, align 4, !invariant.load !49
  %multiply.20114 = fmul float %Arg_0.1108575, %Arg_2.3113
  %add.25.i413 = fadd float %add.25.i408, %multiply.20114
  %Arg_3.4118 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %19, i64 %20, i64 0
  %Arg_3.4119 = load float, ptr addrspace(1) %Arg_3.4118, align 4, !invariant.load !49
  %multiply.29120 = fmul float %Arg_0.1108575, %Arg_3.4119
  %add.34.i414 = fadd float %add.34.i409, %multiply.29120
  %Arg_4.5124 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %19, i64 %20, i64 0
  %Arg_4.5125 = load float, ptr addrspace(1) %Arg_4.5124, align 4, !invariant.load !49
  %multiply.38126 = fmul float %Arg_0.1108575, %Arg_4.5125
  %add.43.i415 = fadd float %add.43.i410, %multiply.38126
  %Arg_5.6130 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %19, i64 %20, i64 0
  %Arg_5.6131 = load float, ptr addrspace(1) %Arg_5.6130, align 4, !invariant.load !49
  %multiply.47132 = fmul float %Arg_0.1108575, %Arg_5.6131
  %add.52.i416 = fadd float %add.52.i411, %multiply.47132
  %multiply.8137 = fmul float %Arg_0.1108575, %Arg_1.2100
  %21 = getelementptr float, ptr addrspace(1) %arg6523, i64 %16
  %22 = insertelement <2 x float> poison, float %multiply.8103, i32 0
  %23 = insertelement <2 x float> %22, float %multiply.8137, i32 1
  store <2 x float> %23, ptr addrspace(1) %11, align 8
  %x_loc72.1 = or i32 %2, 256
  %24 = add nuw nsw i32 %x_loc72.1, %3
  %urem327.1 = urem i32 %24, 819200
  %urem327.1.frozen = freeze i32 %urem327.1
  %25 = udiv i32 %urem327.1.frozen, 100
  %Arg_0.173.1539 = getelementptr inbounds float, ptr addrspace(1) %17, i64 256
  %26 = load <2 x float>, ptr addrspace(1) %Arg_0.173.1539, align 8, !invariant.load !49
  %Arg_0.174.1576 = extractelement <2 x float> %26, i32 0
  %Arg_0.1108.1577 = extractelement <2 x float> %26, i32 1
  %add.15.i407.1 = fadd float %add.15.i412, %Arg_0.174.1576
  %27 = mul i32 %25, 100
  %.decomposed499 = sub i32 %urem327.1.frozen, %27
  %28 = zext i32 %25 to i64
  %29 = zext i32 %.decomposed499 to i64
  %Arg_2.378.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %28, i64 %29, i64 0
  %Arg_2.379.1 = load float, ptr addrspace(1) %Arg_2.378.1, align 4, !invariant.load !49
  %multiply.2080.1 = fmul float %Arg_0.174.1576, %Arg_2.379.1
  %add.25.i408.1 = fadd float %add.25.i413, %multiply.2080.1
  %Arg_3.484.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %28, i64 %29, i64 0
  %Arg_3.485.1 = load float, ptr addrspace(1) %Arg_3.484.1, align 4, !invariant.load !49
  %multiply.2986.1 = fmul float %Arg_0.174.1576, %Arg_3.485.1
  %add.34.i409.1 = fadd float %add.34.i414, %multiply.2986.1
  %Arg_4.590.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %28, i64 %29, i64 0
  %Arg_4.591.1 = load float, ptr addrspace(1) %Arg_4.590.1, align 4, !invariant.load !49
  %multiply.3892.1 = fmul float %Arg_0.174.1576, %Arg_4.591.1
  %add.43.i410.1 = fadd float %add.43.i415, %multiply.3892.1
  %Arg_5.696.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %28, i64 %29, i64 0
  %Arg_5.697.1 = load float, ptr addrspace(1) %Arg_5.696.1, align 4, !invariant.load !49
  %multiply.4798.1 = fmul float %Arg_0.174.1576, %Arg_5.697.1
  %add.52.i411.1 = fadd float %add.52.i416, %multiply.4798.1
  %multiply.8103.1 = fmul float %Arg_0.174.1576, %Arg_1.2100
  %30 = getelementptr inbounds float, ptr addrspace(1) %21, i64 256
  %x_loc104.1 = or i32 %2, 257
  %31 = add nuw nsw i32 %x_loc104.1, %3
  %urem.1 = urem i32 %31, 819200
  %urem.1.frozen = freeze i32 %urem.1
  %32 = udiv i32 %urem.1.frozen, 100
  %add.15.i412.1 = fadd float %add.15.i407.1, %Arg_0.1108.1577
  %33 = mul i32 %32, 100
  %.decomposed500 = sub i32 %urem.1.frozen, %33
  %34 = zext i32 %32 to i64
  %35 = zext i32 %.decomposed500 to i64
  %Arg_2.3112.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %34, i64 %35, i64 0
  %Arg_2.3113.1 = load float, ptr addrspace(1) %Arg_2.3112.1, align 4, !invariant.load !49
  %multiply.20114.1 = fmul float %Arg_0.1108.1577, %Arg_2.3113.1
  %add.25.i413.1 = fadd float %add.25.i408.1, %multiply.20114.1
  %Arg_3.4118.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %34, i64 %35, i64 0
  %Arg_3.4119.1 = load float, ptr addrspace(1) %Arg_3.4118.1, align 4, !invariant.load !49
  %multiply.29120.1 = fmul float %Arg_0.1108.1577, %Arg_3.4119.1
  %add.34.i414.1 = fadd float %add.34.i409.1, %multiply.29120.1
  %Arg_4.5124.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %34, i64 %35, i64 0
  %Arg_4.5125.1 = load float, ptr addrspace(1) %Arg_4.5124.1, align 4, !invariant.load !49
  %multiply.38126.1 = fmul float %Arg_0.1108.1577, %Arg_4.5125.1
  %add.43.i415.1 = fadd float %add.43.i410.1, %multiply.38126.1
  %Arg_5.6130.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %34, i64 %35, i64 0
  %Arg_5.6131.1 = load float, ptr addrspace(1) %Arg_5.6130.1, align 4, !invariant.load !49
  %multiply.47132.1 = fmul float %Arg_0.1108.1577, %Arg_5.6131.1
  %add.52.i416.1 = fadd float %add.52.i411.1, %multiply.47132.1
  %multiply.8137.1 = fmul float %Arg_0.1108.1577, %Arg_1.2100
  %36 = insertelement <2 x float> poison, float %multiply.8103.1, i32 0
  %37 = insertelement <2 x float> %36, float %multiply.8137.1, i32 1
  store <2 x float> %37, ptr addrspace(1) %30, align 8
  %x_loc72.2 = or i32 %2, 512
  %38 = add nuw nsw i32 %x_loc72.2, %3
  %urem327.2 = urem i32 %38, 819200
  %urem327.2.frozen = freeze i32 %urem327.2
  %39 = udiv i32 %urem327.2.frozen, 100
  %Arg_0.173.2545 = getelementptr inbounds float, ptr addrspace(1) %17, i64 512
  %40 = load <2 x float>, ptr addrspace(1) %Arg_0.173.2545, align 8, !invariant.load !49
  %Arg_0.174.2578 = extractelement <2 x float> %40, i32 0
  %Arg_0.1108.2579 = extractelement <2 x float> %40, i32 1
  %add.15.i407.2 = fadd float %add.15.i412.1, %Arg_0.174.2578
  %41 = mul i32 %39, 100
  %.decomposed501 = sub i32 %urem327.2.frozen, %41
  %42 = zext i32 %39 to i64
  %43 = zext i32 %.decomposed501 to i64
  %Arg_2.378.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %42, i64 %43, i64 0
  %Arg_2.379.2 = load float, ptr addrspace(1) %Arg_2.378.2, align 4, !invariant.load !49
  %multiply.2080.2 = fmul float %Arg_0.174.2578, %Arg_2.379.2
  %add.25.i408.2 = fadd float %add.25.i413.1, %multiply.2080.2
  %Arg_3.484.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %42, i64 %43, i64 0
  %Arg_3.485.2 = load float, ptr addrspace(1) %Arg_3.484.2, align 4, !invariant.load !49
  %multiply.2986.2 = fmul float %Arg_0.174.2578, %Arg_3.485.2
  %add.34.i409.2 = fadd float %add.34.i414.1, %multiply.2986.2
  %Arg_4.590.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %42, i64 %43, i64 0
  %Arg_4.591.2 = load float, ptr addrspace(1) %Arg_4.590.2, align 4, !invariant.load !49
  %multiply.3892.2 = fmul float %Arg_0.174.2578, %Arg_4.591.2
  %add.43.i410.2 = fadd float %add.43.i415.1, %multiply.3892.2
  %Arg_5.696.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %42, i64 %43, i64 0
  %Arg_5.697.2 = load float, ptr addrspace(1) %Arg_5.696.2, align 4, !invariant.load !49
  %multiply.4798.2 = fmul float %Arg_0.174.2578, %Arg_5.697.2
  %add.52.i411.2 = fadd float %add.52.i416.1, %multiply.4798.2
  %multiply.8103.2 = fmul float %Arg_0.174.2578, %Arg_1.2100
  %44 = getelementptr inbounds float, ptr addrspace(1) %21, i64 512
  %x_loc104.2 = or i32 %2, 513
  %45 = add nuw nsw i32 %x_loc104.2, %3
  %urem.2 = urem i32 %45, 819200
  %urem.2.frozen = freeze i32 %urem.2
  %46 = udiv i32 %urem.2.frozen, 100
  %add.15.i412.2 = fadd float %add.15.i407.2, %Arg_0.1108.2579
  %47 = mul i32 %46, 100
  %.decomposed502 = sub i32 %urem.2.frozen, %47
  %48 = zext i32 %46 to i64
  %49 = zext i32 %.decomposed502 to i64
  %Arg_2.3112.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %48, i64 %49, i64 0
  %Arg_2.3113.2 = load float, ptr addrspace(1) %Arg_2.3112.2, align 4, !invariant.load !49
  %multiply.20114.2 = fmul float %Arg_0.1108.2579, %Arg_2.3113.2
  %add.25.i413.2 = fadd float %add.25.i408.2, %multiply.20114.2
  %Arg_3.4118.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %48, i64 %49, i64 0
  %Arg_3.4119.2 = load float, ptr addrspace(1) %Arg_3.4118.2, align 4, !invariant.load !49
  %multiply.29120.2 = fmul float %Arg_0.1108.2579, %Arg_3.4119.2
  %add.34.i414.2 = fadd float %add.34.i409.2, %multiply.29120.2
  %Arg_4.5124.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %48, i64 %49, i64 0
  %Arg_4.5125.2 = load float, ptr addrspace(1) %Arg_4.5124.2, align 4, !invariant.load !49
  %multiply.38126.2 = fmul float %Arg_0.1108.2579, %Arg_4.5125.2
  %add.43.i415.2 = fadd float %add.43.i410.2, %multiply.38126.2
  %Arg_5.6130.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %48, i64 %49, i64 0
  %Arg_5.6131.2 = load float, ptr addrspace(1) %Arg_5.6130.2, align 4, !invariant.load !49
  %multiply.47132.2 = fmul float %Arg_0.1108.2579, %Arg_5.6131.2
  %add.52.i416.2 = fadd float %add.52.i411.2, %multiply.47132.2
  %multiply.8137.2 = fmul float %Arg_0.1108.2579, %Arg_1.2100
  %50 = insertelement <2 x float> poison, float %multiply.8103.2, i32 0
  %51 = insertelement <2 x float> %50, float %multiply.8137.2, i32 1
  store <2 x float> %51, ptr addrspace(1) %44, align 8
  %x_loc72.3 = or i32 %2, 768
  %52 = add nuw nsw i32 %x_loc72.3, %3
  %urem327.3 = urem i32 %52, 819200
  %urem327.3.frozen = freeze i32 %urem327.3
  %53 = udiv i32 %urem327.3.frozen, 100
  %Arg_0.173.3551 = getelementptr inbounds float, ptr addrspace(1) %17, i64 768
  %54 = load <2 x float>, ptr addrspace(1) %Arg_0.173.3551, align 8, !invariant.load !49
  %Arg_0.174.3580 = extractelement <2 x float> %54, i32 0
  %Arg_0.1108.3581 = extractelement <2 x float> %54, i32 1
  %add.15.i407.3 = fadd float %add.15.i412.2, %Arg_0.174.3580
  %55 = mul i32 %53, 100
  %.decomposed503 = sub i32 %urem327.3.frozen, %55
  %56 = zext i32 %53 to i64
  %57 = zext i32 %.decomposed503 to i64
  %Arg_2.378.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %56, i64 %57, i64 0
  %Arg_2.379.3 = load float, ptr addrspace(1) %Arg_2.378.3, align 4, !invariant.load !49
  %multiply.2080.3 = fmul float %Arg_0.174.3580, %Arg_2.379.3
  %add.25.i408.3 = fadd float %add.25.i413.2, %multiply.2080.3
  %Arg_3.484.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %56, i64 %57, i64 0
  %Arg_3.485.3 = load float, ptr addrspace(1) %Arg_3.484.3, align 4, !invariant.load !49
  %multiply.2986.3 = fmul float %Arg_0.174.3580, %Arg_3.485.3
  %add.34.i409.3 = fadd float %add.34.i414.2, %multiply.2986.3
  %Arg_4.590.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %56, i64 %57, i64 0
  %Arg_4.591.3 = load float, ptr addrspace(1) %Arg_4.590.3, align 4, !invariant.load !49
  %multiply.3892.3 = fmul float %Arg_0.174.3580, %Arg_4.591.3
  %add.43.i410.3 = fadd float %add.43.i415.2, %multiply.3892.3
  %Arg_5.696.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %56, i64 %57, i64 0
  %Arg_5.697.3 = load float, ptr addrspace(1) %Arg_5.696.3, align 4, !invariant.load !49
  %multiply.4798.3 = fmul float %Arg_0.174.3580, %Arg_5.697.3
  %add.52.i411.3 = fadd float %add.52.i416.2, %multiply.4798.3
  %multiply.8103.3 = fmul float %Arg_0.174.3580, %Arg_1.2100
  %58 = getelementptr inbounds float, ptr addrspace(1) %21, i64 768
  %x_loc104.3 = or i32 %2, 769
  %59 = add nuw nsw i32 %x_loc104.3, %3
  %urem.3 = urem i32 %59, 819200
  %urem.3.frozen = freeze i32 %urem.3
  %60 = udiv i32 %urem.3.frozen, 100
  %add.15.i412.3 = fadd float %add.15.i407.3, %Arg_0.1108.3581
  %61 = mul i32 %60, 100
  %.decomposed504 = sub i32 %urem.3.frozen, %61
  %62 = zext i32 %60 to i64
  %63 = zext i32 %.decomposed504 to i64
  %Arg_2.3112.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %62, i64 %63, i64 0
  %Arg_2.3113.3 = load float, ptr addrspace(1) %Arg_2.3112.3, align 4, !invariant.load !49
  %multiply.20114.3 = fmul float %Arg_0.1108.3581, %Arg_2.3113.3
  %add.25.i413.3 = fadd float %add.25.i408.3, %multiply.20114.3
  %Arg_3.4118.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %62, i64 %63, i64 0
  %Arg_3.4119.3 = load float, ptr addrspace(1) %Arg_3.4118.3, align 4, !invariant.load !49
  %multiply.29120.3 = fmul float %Arg_0.1108.3581, %Arg_3.4119.3
  %add.34.i414.3 = fadd float %add.34.i409.3, %multiply.29120.3
  %Arg_4.5124.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %62, i64 %63, i64 0
  %Arg_4.5125.3 = load float, ptr addrspace(1) %Arg_4.5124.3, align 4, !invariant.load !49
  %multiply.38126.3 = fmul float %Arg_0.1108.3581, %Arg_4.5125.3
  %add.43.i415.3 = fadd float %add.43.i410.3, %multiply.38126.3
  %Arg_5.6130.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %62, i64 %63, i64 0
  %Arg_5.6131.3 = load float, ptr addrspace(1) %Arg_5.6130.3, align 4, !invariant.load !49
  %multiply.47132.3 = fmul float %Arg_0.1108.3581, %Arg_5.6131.3
  %add.52.i416.3 = fadd float %add.52.i411.3, %multiply.47132.3
  %multiply.8137.3 = fmul float %Arg_0.1108.3581, %Arg_1.2100
  %64 = insertelement <2 x float> poison, float %multiply.8103.3, i32 0
  %65 = insertelement <2 x float> %64, float %multiply.8137.3, i32 1
  store <2 x float> %65, ptr addrspace(1) %58, align 8
  %x_loc72.4 = or i32 %2, 1024
  %66 = add nuw nsw i32 %x_loc72.4, %3
  %urem327.4 = urem i32 %66, 819200
  %urem327.4.frozen = freeze i32 %urem327.4
  %67 = udiv i32 %urem327.4.frozen, 100
  %Arg_0.173.4557 = getelementptr inbounds float, ptr addrspace(1) %17, i64 1024
  %68 = load <2 x float>, ptr addrspace(1) %Arg_0.173.4557, align 8, !invariant.load !49
  %Arg_0.174.4582 = extractelement <2 x float> %68, i32 0
  %Arg_0.1108.4583 = extractelement <2 x float> %68, i32 1
  %add.15.i407.4 = fadd float %add.15.i412.3, %Arg_0.174.4582
  %69 = mul i32 %67, 100
  %.decomposed505 = sub i32 %urem327.4.frozen, %69
  %70 = zext i32 %67 to i64
  %71 = zext i32 %.decomposed505 to i64
  %Arg_2.378.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %70, i64 %71, i64 0
  %Arg_2.379.4 = load float, ptr addrspace(1) %Arg_2.378.4, align 4, !invariant.load !49
  %multiply.2080.4 = fmul float %Arg_0.174.4582, %Arg_2.379.4
  %add.25.i408.4 = fadd float %add.25.i413.3, %multiply.2080.4
  %Arg_3.484.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %70, i64 %71, i64 0
  %Arg_3.485.4 = load float, ptr addrspace(1) %Arg_3.484.4, align 4, !invariant.load !49
  %multiply.2986.4 = fmul float %Arg_0.174.4582, %Arg_3.485.4
  %add.34.i409.4 = fadd float %add.34.i414.3, %multiply.2986.4
  %Arg_4.590.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %70, i64 %71, i64 0
  %Arg_4.591.4 = load float, ptr addrspace(1) %Arg_4.590.4, align 4, !invariant.load !49
  %multiply.3892.4 = fmul float %Arg_0.174.4582, %Arg_4.591.4
  %add.43.i410.4 = fadd float %add.43.i415.3, %multiply.3892.4
  %Arg_5.696.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %70, i64 %71, i64 0
  %Arg_5.697.4 = load float, ptr addrspace(1) %Arg_5.696.4, align 4, !invariant.load !49
  %multiply.4798.4 = fmul float %Arg_0.174.4582, %Arg_5.697.4
  %add.52.i411.4 = fadd float %add.52.i416.3, %multiply.4798.4
  %multiply.8103.4 = fmul float %Arg_0.174.4582, %Arg_1.2100
  %72 = getelementptr inbounds float, ptr addrspace(1) %21, i64 1024
  %x_loc104.4 = or i32 %2, 1025
  %73 = add nuw nsw i32 %x_loc104.4, %3
  %urem.4 = urem i32 %73, 819200
  %urem.4.frozen = freeze i32 %urem.4
  %74 = udiv i32 %urem.4.frozen, 100
  %add.15.i412.4 = fadd float %add.15.i407.4, %Arg_0.1108.4583
  %75 = mul i32 %74, 100
  %.decomposed506 = sub i32 %urem.4.frozen, %75
  %76 = zext i32 %74 to i64
  %77 = zext i32 %.decomposed506 to i64
  %Arg_2.3112.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %76, i64 %77, i64 0
  %Arg_2.3113.4 = load float, ptr addrspace(1) %Arg_2.3112.4, align 4, !invariant.load !49
  %multiply.20114.4 = fmul float %Arg_0.1108.4583, %Arg_2.3113.4
  %add.25.i413.4 = fadd float %add.25.i408.4, %multiply.20114.4
  %Arg_3.4118.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %76, i64 %77, i64 0
  %Arg_3.4119.4 = load float, ptr addrspace(1) %Arg_3.4118.4, align 4, !invariant.load !49
  %multiply.29120.4 = fmul float %Arg_0.1108.4583, %Arg_3.4119.4
  %add.34.i414.4 = fadd float %add.34.i409.4, %multiply.29120.4
  %Arg_4.5124.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %76, i64 %77, i64 0
  %Arg_4.5125.4 = load float, ptr addrspace(1) %Arg_4.5124.4, align 4, !invariant.load !49
  %multiply.38126.4 = fmul float %Arg_0.1108.4583, %Arg_4.5125.4
  %add.43.i415.4 = fadd float %add.43.i410.4, %multiply.38126.4
  %Arg_5.6130.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %76, i64 %77, i64 0
  %Arg_5.6131.4 = load float, ptr addrspace(1) %Arg_5.6130.4, align 4, !invariant.load !49
  %multiply.47132.4 = fmul float %Arg_0.1108.4583, %Arg_5.6131.4
  %add.52.i416.4 = fadd float %add.52.i411.4, %multiply.47132.4
  %multiply.8137.4 = fmul float %Arg_0.1108.4583, %Arg_1.2100
  %78 = insertelement <2 x float> poison, float %multiply.8103.4, i32 0
  %79 = insertelement <2 x float> %78, float %multiply.8137.4, i32 1
  store <2 x float> %79, ptr addrspace(1) %72, align 8
  %x_loc72.5 = or i32 %2, 1280
  %80 = add nuw nsw i32 %x_loc72.5, %3
  %urem327.5 = urem i32 %80, 819200
  %urem327.5.frozen = freeze i32 %urem327.5
  %81 = udiv i32 %urem327.5.frozen, 100
  %Arg_0.173.5563 = getelementptr inbounds float, ptr addrspace(1) %17, i64 1280
  %82 = load <2 x float>, ptr addrspace(1) %Arg_0.173.5563, align 8, !invariant.load !49
  %Arg_0.174.5584 = extractelement <2 x float> %82, i32 0
  %Arg_0.1108.5585 = extractelement <2 x float> %82, i32 1
  %add.15.i407.5 = fadd float %add.15.i412.4, %Arg_0.174.5584
  %83 = mul i32 %81, 100
  %.decomposed507 = sub i32 %urem327.5.frozen, %83
  %84 = zext i32 %81 to i64
  %85 = zext i32 %.decomposed507 to i64
  %Arg_2.378.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %84, i64 %85, i64 0
  %Arg_2.379.5 = load float, ptr addrspace(1) %Arg_2.378.5, align 4, !invariant.load !49
  %multiply.2080.5 = fmul float %Arg_0.174.5584, %Arg_2.379.5
  %add.25.i408.5 = fadd float %add.25.i413.4, %multiply.2080.5
  %Arg_3.484.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %84, i64 %85, i64 0
  %Arg_3.485.5 = load float, ptr addrspace(1) %Arg_3.484.5, align 4, !invariant.load !49
  %multiply.2986.5 = fmul float %Arg_0.174.5584, %Arg_3.485.5
  %add.34.i409.5 = fadd float %add.34.i414.4, %multiply.2986.5
  %Arg_4.590.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %84, i64 %85, i64 0
  %Arg_4.591.5 = load float, ptr addrspace(1) %Arg_4.590.5, align 4, !invariant.load !49
  %multiply.3892.5 = fmul float %Arg_0.174.5584, %Arg_4.591.5
  %add.43.i410.5 = fadd float %add.43.i415.4, %multiply.3892.5
  %Arg_5.696.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %84, i64 %85, i64 0
  %Arg_5.697.5 = load float, ptr addrspace(1) %Arg_5.696.5, align 4, !invariant.load !49
  %multiply.4798.5 = fmul float %Arg_0.174.5584, %Arg_5.697.5
  %add.52.i411.5 = fadd float %add.52.i416.4, %multiply.4798.5
  %multiply.8103.5 = fmul float %Arg_0.174.5584, %Arg_1.2100
  %86 = getelementptr inbounds float, ptr addrspace(1) %21, i64 1280
  %x_loc104.5 = or i32 %2, 1281
  %87 = add nuw nsw i32 %x_loc104.5, %3
  %urem.5 = urem i32 %87, 819200
  %urem.5.frozen = freeze i32 %urem.5
  %88 = udiv i32 %urem.5.frozen, 100
  %add.15.i412.5 = fadd float %add.15.i407.5, %Arg_0.1108.5585
  %89 = mul i32 %88, 100
  %.decomposed508 = sub i32 %urem.5.frozen, %89
  %90 = zext i32 %88 to i64
  %91 = zext i32 %.decomposed508 to i64
  %Arg_2.3112.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %90, i64 %91, i64 0
  %Arg_2.3113.5 = load float, ptr addrspace(1) %Arg_2.3112.5, align 4, !invariant.load !49
  %multiply.20114.5 = fmul float %Arg_0.1108.5585, %Arg_2.3113.5
  %add.25.i413.5 = fadd float %add.25.i408.5, %multiply.20114.5
  %Arg_3.4118.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %90, i64 %91, i64 0
  %Arg_3.4119.5 = load float, ptr addrspace(1) %Arg_3.4118.5, align 4, !invariant.load !49
  %multiply.29120.5 = fmul float %Arg_0.1108.5585, %Arg_3.4119.5
  %add.34.i414.5 = fadd float %add.34.i409.5, %multiply.29120.5
  %Arg_4.5124.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %90, i64 %91, i64 0
  %Arg_4.5125.5 = load float, ptr addrspace(1) %Arg_4.5124.5, align 4, !invariant.load !49
  %multiply.38126.5 = fmul float %Arg_0.1108.5585, %Arg_4.5125.5
  %add.43.i415.5 = fadd float %add.43.i410.5, %multiply.38126.5
  %Arg_5.6130.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %90, i64 %91, i64 0
  %Arg_5.6131.5 = load float, ptr addrspace(1) %Arg_5.6130.5, align 4, !invariant.load !49
  %multiply.47132.5 = fmul float %Arg_0.1108.5585, %Arg_5.6131.5
  %add.52.i416.5 = fadd float %add.52.i411.5, %multiply.47132.5
  %multiply.8137.5 = fmul float %Arg_0.1108.5585, %Arg_1.2100
  %92 = insertelement <2 x float> poison, float %multiply.8103.5, i32 0
  %93 = insertelement <2 x float> %92, float %multiply.8137.5, i32 1
  store <2 x float> %93, ptr addrspace(1) %86, align 8
  %x_loc72.6 = or i32 %2, 1536
  %94 = icmp ult i32 %x_loc72.6, 1600
  br i1 %94, label %x_in_tile-true.6, label %x_in_tile-after.6

common.ret:                                       ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont.cont.cont, %reduction_write_output-true323, %intra_warp_reduce_write-after304
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after106.7
  tail call void @llvm.nvvm.barrier0()
  %95 = icmp ult i32 %0, 32
  br i1 %95, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont, %reduction_write_output-true, %intra_warp_reduce_write-after
  %96 = icmp eq i32 %lane_id, 0
  %97 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result2.2.6, i32 16, i32 31)
  %add.25.i = fadd float %partial_reduction_result2.2.6, %97
  %98 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.25.i, i32 8, i32 31)
  %add.25.i391 = fadd float %add.25.i, %98
  %99 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.25.i391, i32 4, i32 31)
  %add.25.i392 = fadd float %add.25.i391, %99
  %100 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.25.i392, i32 2, i32 31)
  %add.25.i393 = fadd float %add.25.i392, %100
  %101 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.25.i393, i32 1, i32 31)
  %102 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %148
  %add.25.i394 = fadd float %add.25.i393, %101
  br i1 %96, label %intra_warp_reduce_write-true183, label %intra_warp_reduce_write-after184

intra_warp_reduce_write-after184:                 ; preds = %intra_warp_reduce_write-true183, %inter_warp_reduce-after
  %103 = icmp ult i32 %0, 32
  tail call void @llvm.nvvm.barrier0()
  br i1 %103, label %inter_warp_reduce-true185, label %inter_warp_reduce-after186

inter_warp_reduce-after186:                       ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont.cont.cont, %reduction_write_output-true203, %intra_warp_reduce_write-after184
  %104 = icmp eq i32 %lane_id, 0
  %105 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result5.2.6, i32 16, i32 31)
  %add.34.i = fadd float %partial_reduction_result5.2.6, %105
  %106 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.34.i, i32 8, i32 31)
  %add.34.i395 = fadd float %add.34.i, %106
  %107 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.34.i395, i32 4, i32 31)
  %add.34.i396 = fadd float %add.34.i395, %107
  %108 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.34.i396, i32 2, i32 31)
  %add.34.i397 = fadd float %add.34.i396, %108
  %109 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.34.i397, i32 1, i32 31)
  %110 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache4, i64 0, i64 0, i64 0, i64 %148
  %add.34.i398 = fadd float %add.34.i397, %109
  br i1 %104, label %intra_warp_reduce_write-true223, label %intra_warp_reduce_write-after224

intra_warp_reduce_write-after224:                 ; preds = %intra_warp_reduce_write-true223, %inter_warp_reduce-after186
  %111 = icmp ult i32 %0, 32
  tail call void @llvm.nvvm.barrier0()
  br i1 %111, label %inter_warp_reduce-true225, label %inter_warp_reduce-after226

inter_warp_reduce-after226:                       ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont.cont.cont, %reduction_write_output-true243, %intra_warp_reduce_write-after224
  %112 = icmp eq i32 %lane_id, 0
  %113 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result8.2.6, i32 16, i32 31)
  %add.43.i = fadd float %partial_reduction_result8.2.6, %113
  %114 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.43.i, i32 8, i32 31)
  %add.43.i399 = fadd float %add.43.i, %114
  %115 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.43.i399, i32 4, i32 31)
  %add.43.i400 = fadd float %add.43.i399, %115
  %116 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.43.i400, i32 2, i32 31)
  %add.43.i401 = fadd float %add.43.i400, %116
  %117 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.43.i401, i32 1, i32 31)
  %118 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache5, i64 0, i64 0, i64 0, i64 %148
  %add.43.i402 = fadd float %add.43.i401, %117
  br i1 %112, label %intra_warp_reduce_write-true263, label %intra_warp_reduce_write-after264

intra_warp_reduce_write-after264:                 ; preds = %intra_warp_reduce_write-true263, %inter_warp_reduce-after226
  %119 = icmp ult i32 %0, 32
  tail call void @llvm.nvvm.barrier0()
  br i1 %119, label %inter_warp_reduce-true265, label %inter_warp_reduce-after266

inter_warp_reduce-after266:                       ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont.cont.cont, %reduction_write_output-true283, %intra_warp_reduce_write-after264
  %120 = icmp eq i32 %lane_id, 0
  %121 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result11.2.6, i32 16, i32 31)
  %add.52.i = fadd float %partial_reduction_result11.2.6, %121
  %122 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.52.i, i32 8, i32 31)
  %add.52.i403 = fadd float %add.52.i, %122
  %123 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.52.i403, i32 4, i32 31)
  %add.52.i404 = fadd float %add.52.i403, %123
  %124 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.52.i404, i32 2, i32 31)
  %add.52.i405 = fadd float %add.52.i404, %124
  %125 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.52.i405, i32 1, i32 31)
  %126 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache6, i64 0, i64 0, i64 0, i64 %148
  %add.52.i406 = fadd float %add.52.i405, %125
  br i1 %120, label %intra_warp_reduce_write-true303, label %intra_warp_reduce_write-after304

intra_warp_reduce_write-after304:                 ; preds = %intra_warp_reduce_write-true303, %inter_warp_reduce-after266
  %127 = icmp ult i32 %0, 32
  tail call void @llvm.nvvm.barrier0()
  br i1 %127, label %inter_warp_reduce-true305, label %common.ret

x_in_tile-true.6:                                 ; preds = %entry
  %128 = add nuw nsw i32 %x_loc72.6, %3
  %urem327.6 = urem i32 %128, 819200
  %urem327.6.frozen = freeze i32 %urem327.6
  %129 = udiv i32 %urem327.6.frozen, 100
  %Arg_0.173.6569 = getelementptr inbounds float, ptr addrspace(1) %17, i64 1536
  %Arg_0.174.6 = load float, ptr addrspace(1) %Arg_0.173.6569, align 8, !invariant.load !49
  %add.15.i407.6 = fadd float %add.15.i412.5, %Arg_0.174.6
  %130 = mul i32 %129, 100
  %.decomposed509 = sub i32 %urem327.6.frozen, %130
  %131 = zext i32 %129 to i64
  %132 = zext i32 %.decomposed509 to i64
  %Arg_2.378.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %131, i64 %132, i64 0
  %Arg_2.379.6 = load float, ptr addrspace(1) %Arg_2.378.6, align 4, !invariant.load !49
  %multiply.2080.6 = fmul float %Arg_0.174.6, %Arg_2.379.6
  %add.25.i408.6 = fadd float %add.25.i413.5, %multiply.2080.6
  %Arg_3.484.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %131, i64 %132, i64 0
  %Arg_3.485.6 = load float, ptr addrspace(1) %Arg_3.484.6, align 4, !invariant.load !49
  %multiply.2986.6 = fmul float %Arg_0.174.6, %Arg_3.485.6
  %add.34.i409.6 = fadd float %add.34.i414.5, %multiply.2986.6
  %Arg_4.590.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %131, i64 %132, i64 0
  %Arg_4.591.6 = load float, ptr addrspace(1) %Arg_4.590.6, align 4, !invariant.load !49
  %multiply.3892.6 = fmul float %Arg_0.174.6, %Arg_4.591.6
  %add.43.i410.6 = fadd float %add.43.i415.5, %multiply.3892.6
  %Arg_5.696.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %131, i64 %132, i64 0
  %Arg_5.697.6 = load float, ptr addrspace(1) %Arg_5.696.6, align 4, !invariant.load !49
  %multiply.4798.6 = fmul float %Arg_0.174.6, %Arg_5.697.6
  %add.52.i411.6 = fadd float %add.52.i416.5, %multiply.4798.6
  %multiply.8103.6 = fmul float %Arg_0.174.6, %Arg_1.2100
  %133 = getelementptr inbounds float, ptr addrspace(1) %21, i64 1536
  store float %multiply.8103.6, ptr addrspace(1) %133, align 8
  br label %x_in_tile-after.6

x_in_tile-after.6:                                ; preds = %x_in_tile-true.6, %entry
  %partial_reduction_result11.1.6 = phi float [ %add.52.i411.6, %x_in_tile-true.6 ], [ %add.52.i416.5, %entry ]
  %partial_reduction_result8.1.6 = phi float [ %add.43.i410.6, %x_in_tile-true.6 ], [ %add.43.i415.5, %entry ]
  %partial_reduction_result5.1.6 = phi float [ %add.34.i409.6, %x_in_tile-true.6 ], [ %add.34.i414.5, %entry ]
  %partial_reduction_result2.1.6 = phi float [ %add.25.i408.6, %x_in_tile-true.6 ], [ %add.25.i413.5, %entry ]
  %partial_reduction_result.1.6 = phi float [ %add.15.i407.6, %x_in_tile-true.6 ], [ %add.15.i412.5, %entry ]
  %x_loc104.6 = or i32 %2, 1537
  %134 = icmp ult i32 %x_loc104.6, 1600
  br i1 %134, label %x_in_tile-true105.6, label %x_in_tile-after106.7

x_in_tile-true105.6:                              ; preds = %x_in_tile-after.6
  %135 = add nuw nsw i32 %x_loc104.6, %3
  %urem.6 = urem i32 %135, 819200
  %urem.6.frozen = freeze i32 %urem.6
  %136 = udiv i32 %urem.6.frozen, 100
  %Arg_0.1107.6572 = getelementptr inbounds float, ptr addrspace(1) %17, i64 1537
  %Arg_0.1108.6 = load float, ptr addrspace(1) %Arg_0.1107.6572, align 4, !invariant.load !49
  %add.15.i412.6 = fadd float %partial_reduction_result.1.6, %Arg_0.1108.6
  %137 = mul i32 %136, 100
  %.decomposed510 = sub i32 %urem.6.frozen, %137
  %138 = zext i32 %136 to i64
  %139 = zext i32 %.decomposed510 to i64
  %Arg_2.3112.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg2515, i64 0, i64 %138, i64 %139, i64 0
  %Arg_2.3113.6 = load float, ptr addrspace(1) %Arg_2.3112.6, align 4, !invariant.load !49
  %multiply.20114.6 = fmul float %Arg_0.1108.6, %Arg_2.3113.6
  %add.25.i413.6 = fadd float %partial_reduction_result2.1.6, %multiply.20114.6
  %Arg_3.4118.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg3517, i64 0, i64 %138, i64 %139, i64 0
  %Arg_3.4119.6 = load float, ptr addrspace(1) %Arg_3.4118.6, align 4, !invariant.load !49
  %multiply.29120.6 = fmul float %Arg_0.1108.6, %Arg_3.4119.6
  %add.34.i414.6 = fadd float %partial_reduction_result5.1.6, %multiply.29120.6
  %Arg_4.5124.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg4519, i64 0, i64 %138, i64 %139, i64 0
  %Arg_4.5125.6 = load float, ptr addrspace(1) %Arg_4.5124.6, align 4, !invariant.load !49
  %multiply.38126.6 = fmul float %Arg_0.1108.6, %Arg_4.5125.6
  %add.43.i415.6 = fadd float %partial_reduction_result8.1.6, %multiply.38126.6
  %Arg_5.6130.6 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg5521, i64 0, i64 %138, i64 %139, i64 0
  %Arg_5.6131.6 = load float, ptr addrspace(1) %Arg_5.6130.6, align 4, !invariant.load !49
  %multiply.47132.6 = fmul float %Arg_0.1108.6, %Arg_5.6131.6
  %add.52.i416.6 = fadd float %partial_reduction_result11.1.6, %multiply.47132.6
  %multiply.8137.6 = fmul float %Arg_0.1108.6, %Arg_1.2100
  %140 = getelementptr inbounds float, ptr addrspace(1) %21, i64 1537
  store float %multiply.8137.6, ptr addrspace(1) %140, align 4
  br label %x_in_tile-after106.7

x_in_tile-after106.7:                             ; preds = %x_in_tile-true105.6, %x_in_tile-after.6
  %partial_reduction_result11.2.6 = phi float [ %add.52.i416.6, %x_in_tile-true105.6 ], [ %partial_reduction_result11.1.6, %x_in_tile-after.6 ]
  %partial_reduction_result8.2.6 = phi float [ %add.43.i415.6, %x_in_tile-true105.6 ], [ %partial_reduction_result8.1.6, %x_in_tile-after.6 ]
  %partial_reduction_result5.2.6 = phi float [ %add.34.i414.6, %x_in_tile-true105.6 ], [ %partial_reduction_result5.1.6, %x_in_tile-after.6 ]
  %partial_reduction_result2.2.6 = phi float [ %add.25.i413.6, %x_in_tile-true105.6 ], [ %partial_reduction_result2.1.6, %x_in_tile-after.6 ]
  %partial_reduction_result.2.6 = phi float [ %add.15.i412.6, %x_in_tile-true105.6 ], [ %partial_reduction_result.1.6, %x_in_tile-after.6 ]
  %lane_id = and i32 %0, 31
  %141 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.2.6, i32 16, i32 31)
  %add.15.i = fadd float %partial_reduction_result.2.6, %141
  %142 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i, i32 8, i32 31)
  %add.15.i387 = fadd float %add.15.i, %142
  %143 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i387, i32 4, i32 31)
  %add.15.i388 = fadd float %add.15.i387, %143
  %144 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i388, i32 2, i32 31)
  %add.15.i389 = fadd float %add.15.i388, %144
  %145 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i389, i32 1, i32 31)
  %146 = lshr i32 %0, 5
  %147 = icmp eq i32 %lane_id, 0
  %148 = zext i32 %146 to i64
  %149 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %148
  %add.15.i390 = fadd float %add.15.i389, %145
  br i1 %147, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after106.7
  store float %add.15.i390, ptr addrspace(3) %149, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %150 = zext i32 %lane_id to i64
  %151 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %150
  %152 = icmp ult i32 %0, 4
  br i1 %152, label %inter_warp_reduce-true.then451, label %inter_warp_reduce-true.cont450

inter_warp_reduce-true.then451:                   ; preds = %inter_warp_reduce-true
  %partial_reduction_result153.then.val = load float, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont450

inter_warp_reduce-true.cont450:                   ; preds = %inter_warp_reduce-true, %inter_warp_reduce-true.then451
  %partial_reduction_result153 = phi float [ %partial_reduction_result153.then.val, %inter_warp_reduce-true.then451 ], [ 0.000000e+00, %inter_warp_reduce-true ]
  %153 = icmp ult i32 %0, 4
  %154 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result153, i32 16, i32 31)
  br i1 %153, label %inter_warp_reduce-true.then, label %inter_warp_reduce-true.cont

inter_warp_reduce-true.then:                      ; preds = %inter_warp_reduce-true.cont450
  %.val331.then.val = load float, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont

inter_warp_reduce-true.cont:                      ; preds = %inter_warp_reduce-true.cont450, %inter_warp_reduce-true.then
  %.val331 = phi float [ %.val331.then.val, %inter_warp_reduce-true.then ], [ 0.000000e+00, %inter_warp_reduce-true.cont450 ]
  %155 = icmp ult i32 %0, 4
  %add.15.i417 = fadd float %154, %.val331
  br i1 %155, label %inter_warp_reduce-true.cont.then449, label %inter_warp_reduce-true.cont.cont448

inter_warp_reduce-true.cont.then449:              ; preds = %inter_warp_reduce-true.cont
  store float %add.15.i417, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont448

inter_warp_reduce-true.cont.cont448:              ; preds = %inter_warp_reduce-true.cont, %inter_warp_reduce-true.cont.then449
  %initial_value_addr.0 = phi float [ 0.000000e+00, %inter_warp_reduce-true.cont.then449 ], [ %add.15.i417, %inter_warp_reduce-true.cont ]
  %156 = icmp ult i32 %0, 4
  %157 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i417, i32 8, i32 31)
  br i1 %156, label %inter_warp_reduce-true.cont.then, label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.then:                 ; preds = %inter_warp_reduce-true.cont.cont448
  %.val330.then.val = load float, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont

inter_warp_reduce-true.cont.cont:                 ; preds = %inter_warp_reduce-true.cont.cont448, %inter_warp_reduce-true.cont.then
  %.val330 = phi float [ %.val330.then.val, %inter_warp_reduce-true.cont.then ], [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont448 ]
  %158 = icmp ult i32 %0, 4
  %add.15.i418 = fadd float %157, %.val330
  br i1 %158, label %inter_warp_reduce-true.cont.cont.then447, label %inter_warp_reduce-true.cont.cont.cont446

inter_warp_reduce-true.cont.cont.then447:         ; preds = %inter_warp_reduce-true.cont.cont
  store float %add.15.i418, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont.cont446

inter_warp_reduce-true.cont.cont.cont446:         ; preds = %inter_warp_reduce-true.cont.cont, %inter_warp_reduce-true.cont.cont.then447
  %initial_value_addr.1 = phi float [ %initial_value_addr.0, %inter_warp_reduce-true.cont.cont.then447 ], [ %add.15.i418, %inter_warp_reduce-true.cont.cont ]
  %159 = icmp ult i32 %0, 4
  %160 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i418, i32 4, i32 31)
  br i1 %159, label %inter_warp_reduce-true.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.then:            ; preds = %inter_warp_reduce-true.cont.cont.cont446
  %.val329.then.val = load float, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont:            ; preds = %inter_warp_reduce-true.cont.cont.cont446, %inter_warp_reduce-true.cont.cont.then
  %.val329 = phi float [ %.val329.then.val, %inter_warp_reduce-true.cont.cont.then ], [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont446 ]
  %161 = icmp ult i32 %0, 4
  %add.15.i419 = fadd float %160, %.val329
  br i1 %161, label %inter_warp_reduce-true.cont.cont.cont.then445, label %inter_warp_reduce-true.cont.cont.cont.cont444

inter_warp_reduce-true.cont.cont.cont.then445:    ; preds = %inter_warp_reduce-true.cont.cont.cont
  store float %add.15.i419, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont444

inter_warp_reduce-true.cont.cont.cont.cont444:    ; preds = %inter_warp_reduce-true.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.then445
  %initial_value_addr.2 = phi float [ %initial_value_addr.1, %inter_warp_reduce-true.cont.cont.cont.then445 ], [ %add.15.i419, %inter_warp_reduce-true.cont.cont.cont ]
  %162 = icmp ult i32 %0, 4
  %163 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i419, i32 2, i32 31)
  br i1 %162, label %inter_warp_reduce-true.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.then:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont444
  %.val328.then.val = load float, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont:       ; preds = %inter_warp_reduce-true.cont.cont.cont.cont444, %inter_warp_reduce-true.cont.cont.cont.then
  %.val328 = phi float [ %.val328.then.val, %inter_warp_reduce-true.cont.cont.cont.then ], [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont444 ]
  %164 = icmp ult i32 %0, 4
  %add.15.i420 = fadd float %163, %.val328
  br i1 %164, label %inter_warp_reduce-true.cont.cont.cont.cont.then443, label %inter_warp_reduce-true.cont.cont.cont.cont.cont442

inter_warp_reduce-true.cont.cont.cont.cont.then443: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont
  store float %add.15.i420, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont442

inter_warp_reduce-true.cont.cont.cont.cont.cont442: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.then443
  %initial_value_addr.3 = phi float [ %initial_value_addr.2, %inter_warp_reduce-true.cont.cont.cont.cont.then443 ], [ %add.15.i420, %inter_warp_reduce-true.cont.cont.cont.cont ]
  %165 = icmp ult i32 %0, 4
  %166 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i420, i32 1, i32 31)
  br i1 %165, label %inter_warp_reduce-true.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.then:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont442
  %.val.then.val = load float, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont:  ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont442, %inter_warp_reduce-true.cont.cont.cont.cont.then
  %.val = phi float [ %.val.then.val, %inter_warp_reduce-true.cont.cont.cont.cont.then ], [ %initial_value_addr.3, %inter_warp_reduce-true.cont.cont.cont.cont.cont442 ]
  %167 = icmp ult i32 %0, 4
  %add.15.i421 = fadd float %166, %.val
  br i1 %167, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont
  store float %add.15.i421, ptr addrspace(3) %151, align 4
  br label %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont, %inter_warp_reduce-true.cont.cont.cont.cont.cont.then
  %168 = icmp eq i32 %0, 0
  %169 = lshr i32 %1, 9
  %170 = zext i32 %169 to i64
  %171 = and i32 %1, 511
  %172 = zext i32 %171 to i64
  %output_element_address = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg7525, i64 0, i64 %170, i64 %172
  br i1 %168, label %reduction_write_output-true, label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true.cont.cont.cont.cont.cont.cont
  store float %add.15.i421, ptr addrspace(1) %output_element_address, align 4
  br label %inter_warp_reduce-after

intra_warp_reduce_write-true183:                  ; preds = %inter_warp_reduce-after
  store float %add.25.i394, ptr addrspace(3) %102, align 4
  br label %intra_warp_reduce_write-after184

inter_warp_reduce-true185:                        ; preds = %intra_warp_reduce_write-after184
  %173 = zext i32 %lane_id to i64
  %174 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %173
  %175 = icmp ult i32 %0, 4
  br i1 %175, label %inter_warp_reduce-true185.then461, label %inter_warp_reduce-true185.cont460

inter_warp_reduce-true185.then461:                ; preds = %inter_warp_reduce-true185
  %partial_reduction_result189.then.val = load float, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont460

inter_warp_reduce-true185.cont460:                ; preds = %inter_warp_reduce-true185, %inter_warp_reduce-true185.then461
  %partial_reduction_result189 = phi float [ %partial_reduction_result189.then.val, %inter_warp_reduce-true185.then461 ], [ 0.000000e+00, %inter_warp_reduce-true185 ]
  %176 = icmp ult i32 %0, 4
  %177 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result189, i32 16, i32 31)
  br i1 %176, label %inter_warp_reduce-true185.then, label %inter_warp_reduce-true185.cont

inter_warp_reduce-true185.then:                   ; preds = %inter_warp_reduce-true185.cont460
  %.val343.then.val = load float, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont

inter_warp_reduce-true185.cont:                   ; preds = %inter_warp_reduce-true185.cont460, %inter_warp_reduce-true185.then
  %.val343 = phi float [ %.val343.then.val, %inter_warp_reduce-true185.then ], [ 0.000000e+00, %inter_warp_reduce-true185.cont460 ]
  %178 = icmp ult i32 %0, 4
  %add.25.i422 = fadd float %177, %.val343
  br i1 %178, label %inter_warp_reduce-true185.cont.then459, label %inter_warp_reduce-true185.cont.cont458

inter_warp_reduce-true185.cont.then459:           ; preds = %inter_warp_reduce-true185.cont
  store float %add.25.i422, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont458

inter_warp_reduce-true185.cont.cont458:           ; preds = %inter_warp_reduce-true185.cont, %inter_warp_reduce-true185.cont.then459
  %initial_value_addr187.0 = phi float [ 0.000000e+00, %inter_warp_reduce-true185.cont.then459 ], [ %add.25.i422, %inter_warp_reduce-true185.cont ]
  %179 = icmp ult i32 %0, 4
  %180 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.25.i422, i32 8, i32 31)
  br i1 %179, label %inter_warp_reduce-true185.cont.then, label %inter_warp_reduce-true185.cont.cont

inter_warp_reduce-true185.cont.then:              ; preds = %inter_warp_reduce-true185.cont.cont458
  %.val342.then.val = load float, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont

inter_warp_reduce-true185.cont.cont:              ; preds = %inter_warp_reduce-true185.cont.cont458, %inter_warp_reduce-true185.cont.then
  %.val342 = phi float [ %.val342.then.val, %inter_warp_reduce-true185.cont.then ], [ %initial_value_addr187.0, %inter_warp_reduce-true185.cont.cont458 ]
  %181 = icmp ult i32 %0, 4
  %add.25.i423 = fadd float %180, %.val342
  br i1 %181, label %inter_warp_reduce-true185.cont.cont.then457, label %inter_warp_reduce-true185.cont.cont.cont456

inter_warp_reduce-true185.cont.cont.then457:      ; preds = %inter_warp_reduce-true185.cont.cont
  store float %add.25.i423, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont.cont456

inter_warp_reduce-true185.cont.cont.cont456:      ; preds = %inter_warp_reduce-true185.cont.cont, %inter_warp_reduce-true185.cont.cont.then457
  %initial_value_addr187.1 = phi float [ %initial_value_addr187.0, %inter_warp_reduce-true185.cont.cont.then457 ], [ %add.25.i423, %inter_warp_reduce-true185.cont.cont ]
  %182 = icmp ult i32 %0, 4
  %183 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.25.i423, i32 4, i32 31)
  br i1 %182, label %inter_warp_reduce-true185.cont.cont.then, label %inter_warp_reduce-true185.cont.cont.cont

inter_warp_reduce-true185.cont.cont.then:         ; preds = %inter_warp_reduce-true185.cont.cont.cont456
  %.val341.then.val = load float, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont.cont

inter_warp_reduce-true185.cont.cont.cont:         ; preds = %inter_warp_reduce-true185.cont.cont.cont456, %inter_warp_reduce-true185.cont.cont.then
  %.val341 = phi float [ %.val341.then.val, %inter_warp_reduce-true185.cont.cont.then ], [ %initial_value_addr187.1, %inter_warp_reduce-true185.cont.cont.cont456 ]
  %184 = icmp ult i32 %0, 4
  %add.25.i424 = fadd float %183, %.val341
  br i1 %184, label %inter_warp_reduce-true185.cont.cont.cont.then455, label %inter_warp_reduce-true185.cont.cont.cont.cont454

inter_warp_reduce-true185.cont.cont.cont.then455: ; preds = %inter_warp_reduce-true185.cont.cont.cont
  store float %add.25.i424, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont.cont.cont454

inter_warp_reduce-true185.cont.cont.cont.cont454: ; preds = %inter_warp_reduce-true185.cont.cont.cont, %inter_warp_reduce-true185.cont.cont.cont.then455
  %initial_value_addr187.2 = phi float [ %initial_value_addr187.1, %inter_warp_reduce-true185.cont.cont.cont.then455 ], [ %add.25.i424, %inter_warp_reduce-true185.cont.cont.cont ]
  %185 = icmp ult i32 %0, 4
  %186 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.25.i424, i32 2, i32 31)
  br i1 %185, label %inter_warp_reduce-true185.cont.cont.cont.then, label %inter_warp_reduce-true185.cont.cont.cont.cont

inter_warp_reduce-true185.cont.cont.cont.then:    ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont454
  %.val340.then.val = load float, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont.cont.cont

inter_warp_reduce-true185.cont.cont.cont.cont:    ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont454, %inter_warp_reduce-true185.cont.cont.cont.then
  %.val340 = phi float [ %.val340.then.val, %inter_warp_reduce-true185.cont.cont.cont.then ], [ %initial_value_addr187.2, %inter_warp_reduce-true185.cont.cont.cont.cont454 ]
  %187 = icmp ult i32 %0, 4
  %add.25.i425 = fadd float %186, %.val340
  br i1 %187, label %inter_warp_reduce-true185.cont.cont.cont.cont.then453, label %inter_warp_reduce-true185.cont.cont.cont.cont.cont452

inter_warp_reduce-true185.cont.cont.cont.cont.then453: ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont
  store float %add.25.i425, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont.cont.cont.cont452

inter_warp_reduce-true185.cont.cont.cont.cont.cont452: ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont, %inter_warp_reduce-true185.cont.cont.cont.cont.then453
  %initial_value_addr187.3 = phi float [ %initial_value_addr187.2, %inter_warp_reduce-true185.cont.cont.cont.cont.then453 ], [ %add.25.i425, %inter_warp_reduce-true185.cont.cont.cont.cont ]
  %188 = icmp ult i32 %0, 4
  %189 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.25.i425, i32 1, i32 31)
  br i1 %188, label %inter_warp_reduce-true185.cont.cont.cont.cont.then, label %inter_warp_reduce-true185.cont.cont.cont.cont.cont

inter_warp_reduce-true185.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont.cont452
  %.val339.then.val = load float, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont.cont.cont.cont

inter_warp_reduce-true185.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont.cont452, %inter_warp_reduce-true185.cont.cont.cont.cont.then
  %.val339 = phi float [ %.val339.then.val, %inter_warp_reduce-true185.cont.cont.cont.cont.then ], [ %initial_value_addr187.3, %inter_warp_reduce-true185.cont.cont.cont.cont.cont452 ]
  %190 = icmp ult i32 %0, 4
  %add.25.i426 = fadd float %189, %.val339
  br i1 %190, label %inter_warp_reduce-true185.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true185.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true185.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont.cont
  store float %add.25.i426, ptr addrspace(3) %174, align 4
  br label %inter_warp_reduce-true185.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true185.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont.cont, %inter_warp_reduce-true185.cont.cont.cont.cont.cont.then
  %191 = icmp eq i32 %0, 0
  %192 = lshr i32 %1, 9
  %193 = zext i32 %192 to i64
  %194 = and i32 %1, 511
  %195 = zext i32 %194 to i64
  %output_element_address205 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg8527, i64 0, i64 %193, i64 %195
  br i1 %191, label %reduction_write_output-true203, label %inter_warp_reduce-after186

reduction_write_output-true203:                   ; preds = %inter_warp_reduce-true185.cont.cont.cont.cont.cont.cont
  store float %add.25.i426, ptr addrspace(1) %output_element_address205, align 4
  br label %inter_warp_reduce-after186

intra_warp_reduce_write-true223:                  ; preds = %inter_warp_reduce-after186
  store float %add.34.i398, ptr addrspace(3) %110, align 4
  br label %intra_warp_reduce_write-after224

inter_warp_reduce-true225:                        ; preds = %intra_warp_reduce_write-after224
  %196 = zext i32 %lane_id to i64
  %197 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache4, i64 0, i64 0, i64 0, i64 %196
  %198 = icmp ult i32 %0, 4
  br i1 %198, label %inter_warp_reduce-true225.then471, label %inter_warp_reduce-true225.cont470

inter_warp_reduce-true225.then471:                ; preds = %inter_warp_reduce-true225
  %partial_reduction_result229.then.val = load float, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont470

inter_warp_reduce-true225.cont470:                ; preds = %inter_warp_reduce-true225, %inter_warp_reduce-true225.then471
  %partial_reduction_result229 = phi float [ %partial_reduction_result229.then.val, %inter_warp_reduce-true225.then471 ], [ 0.000000e+00, %inter_warp_reduce-true225 ]
  %199 = icmp ult i32 %0, 4
  %200 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result229, i32 16, i32 31)
  br i1 %199, label %inter_warp_reduce-true225.then, label %inter_warp_reduce-true225.cont

inter_warp_reduce-true225.then:                   ; preds = %inter_warp_reduce-true225.cont470
  %.val355.then.val = load float, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont

inter_warp_reduce-true225.cont:                   ; preds = %inter_warp_reduce-true225.cont470, %inter_warp_reduce-true225.then
  %.val355 = phi float [ %.val355.then.val, %inter_warp_reduce-true225.then ], [ 0.000000e+00, %inter_warp_reduce-true225.cont470 ]
  %201 = icmp ult i32 %0, 4
  %add.34.i427 = fadd float %200, %.val355
  br i1 %201, label %inter_warp_reduce-true225.cont.then469, label %inter_warp_reduce-true225.cont.cont468

inter_warp_reduce-true225.cont.then469:           ; preds = %inter_warp_reduce-true225.cont
  store float %add.34.i427, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont468

inter_warp_reduce-true225.cont.cont468:           ; preds = %inter_warp_reduce-true225.cont, %inter_warp_reduce-true225.cont.then469
  %initial_value_addr227.0 = phi float [ 0.000000e+00, %inter_warp_reduce-true225.cont.then469 ], [ %add.34.i427, %inter_warp_reduce-true225.cont ]
  %202 = icmp ult i32 %0, 4
  %203 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.34.i427, i32 8, i32 31)
  br i1 %202, label %inter_warp_reduce-true225.cont.then, label %inter_warp_reduce-true225.cont.cont

inter_warp_reduce-true225.cont.then:              ; preds = %inter_warp_reduce-true225.cont.cont468
  %.val354.then.val = load float, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont

inter_warp_reduce-true225.cont.cont:              ; preds = %inter_warp_reduce-true225.cont.cont468, %inter_warp_reduce-true225.cont.then
  %.val354 = phi float [ %.val354.then.val, %inter_warp_reduce-true225.cont.then ], [ %initial_value_addr227.0, %inter_warp_reduce-true225.cont.cont468 ]
  %204 = icmp ult i32 %0, 4
  %add.34.i428 = fadd float %203, %.val354
  br i1 %204, label %inter_warp_reduce-true225.cont.cont.then467, label %inter_warp_reduce-true225.cont.cont.cont466

inter_warp_reduce-true225.cont.cont.then467:      ; preds = %inter_warp_reduce-true225.cont.cont
  store float %add.34.i428, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont.cont466

inter_warp_reduce-true225.cont.cont.cont466:      ; preds = %inter_warp_reduce-true225.cont.cont, %inter_warp_reduce-true225.cont.cont.then467
  %initial_value_addr227.1 = phi float [ %initial_value_addr227.0, %inter_warp_reduce-true225.cont.cont.then467 ], [ %add.34.i428, %inter_warp_reduce-true225.cont.cont ]
  %205 = icmp ult i32 %0, 4
  %206 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.34.i428, i32 4, i32 31)
  br i1 %205, label %inter_warp_reduce-true225.cont.cont.then, label %inter_warp_reduce-true225.cont.cont.cont

inter_warp_reduce-true225.cont.cont.then:         ; preds = %inter_warp_reduce-true225.cont.cont.cont466
  %.val353.then.val = load float, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont.cont

inter_warp_reduce-true225.cont.cont.cont:         ; preds = %inter_warp_reduce-true225.cont.cont.cont466, %inter_warp_reduce-true225.cont.cont.then
  %.val353 = phi float [ %.val353.then.val, %inter_warp_reduce-true225.cont.cont.then ], [ %initial_value_addr227.1, %inter_warp_reduce-true225.cont.cont.cont466 ]
  %207 = icmp ult i32 %0, 4
  %add.34.i429 = fadd float %206, %.val353
  br i1 %207, label %inter_warp_reduce-true225.cont.cont.cont.then465, label %inter_warp_reduce-true225.cont.cont.cont.cont464

inter_warp_reduce-true225.cont.cont.cont.then465: ; preds = %inter_warp_reduce-true225.cont.cont.cont
  store float %add.34.i429, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont.cont.cont464

inter_warp_reduce-true225.cont.cont.cont.cont464: ; preds = %inter_warp_reduce-true225.cont.cont.cont, %inter_warp_reduce-true225.cont.cont.cont.then465
  %initial_value_addr227.2 = phi float [ %initial_value_addr227.1, %inter_warp_reduce-true225.cont.cont.cont.then465 ], [ %add.34.i429, %inter_warp_reduce-true225.cont.cont.cont ]
  %208 = icmp ult i32 %0, 4
  %209 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.34.i429, i32 2, i32 31)
  br i1 %208, label %inter_warp_reduce-true225.cont.cont.cont.then, label %inter_warp_reduce-true225.cont.cont.cont.cont

inter_warp_reduce-true225.cont.cont.cont.then:    ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont464
  %.val352.then.val = load float, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont.cont.cont

inter_warp_reduce-true225.cont.cont.cont.cont:    ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont464, %inter_warp_reduce-true225.cont.cont.cont.then
  %.val352 = phi float [ %.val352.then.val, %inter_warp_reduce-true225.cont.cont.cont.then ], [ %initial_value_addr227.2, %inter_warp_reduce-true225.cont.cont.cont.cont464 ]
  %210 = icmp ult i32 %0, 4
  %add.34.i430 = fadd float %209, %.val352
  br i1 %210, label %inter_warp_reduce-true225.cont.cont.cont.cont.then463, label %inter_warp_reduce-true225.cont.cont.cont.cont.cont462

inter_warp_reduce-true225.cont.cont.cont.cont.then463: ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont
  store float %add.34.i430, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont.cont.cont.cont462

inter_warp_reduce-true225.cont.cont.cont.cont.cont462: ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont, %inter_warp_reduce-true225.cont.cont.cont.cont.then463
  %initial_value_addr227.3 = phi float [ %initial_value_addr227.2, %inter_warp_reduce-true225.cont.cont.cont.cont.then463 ], [ %add.34.i430, %inter_warp_reduce-true225.cont.cont.cont.cont ]
  %211 = icmp ult i32 %0, 4
  %212 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.34.i430, i32 1, i32 31)
  br i1 %211, label %inter_warp_reduce-true225.cont.cont.cont.cont.then, label %inter_warp_reduce-true225.cont.cont.cont.cont.cont

inter_warp_reduce-true225.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont.cont462
  %.val351.then.val = load float, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont.cont.cont.cont

inter_warp_reduce-true225.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont.cont462, %inter_warp_reduce-true225.cont.cont.cont.cont.then
  %.val351 = phi float [ %.val351.then.val, %inter_warp_reduce-true225.cont.cont.cont.cont.then ], [ %initial_value_addr227.3, %inter_warp_reduce-true225.cont.cont.cont.cont.cont462 ]
  %213 = icmp ult i32 %0, 4
  %add.34.i431 = fadd float %212, %.val351
  br i1 %213, label %inter_warp_reduce-true225.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true225.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true225.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont.cont
  store float %add.34.i431, ptr addrspace(3) %197, align 4
  br label %inter_warp_reduce-true225.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true225.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont.cont, %inter_warp_reduce-true225.cont.cont.cont.cont.cont.then
  %214 = icmp eq i32 %0, 0
  %215 = lshr i32 %1, 9
  %216 = zext i32 %215 to i64
  %217 = and i32 %1, 511
  %218 = zext i32 %217 to i64
  %output_element_address245 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg9529, i64 0, i64 %216, i64 %218
  br i1 %214, label %reduction_write_output-true243, label %inter_warp_reduce-after226

reduction_write_output-true243:                   ; preds = %inter_warp_reduce-true225.cont.cont.cont.cont.cont.cont
  store float %add.34.i431, ptr addrspace(1) %output_element_address245, align 4
  br label %inter_warp_reduce-after226

intra_warp_reduce_write-true263:                  ; preds = %inter_warp_reduce-after226
  store float %add.43.i402, ptr addrspace(3) %118, align 4
  br label %intra_warp_reduce_write-after264

inter_warp_reduce-true265:                        ; preds = %intra_warp_reduce_write-after264
  %219 = zext i32 %lane_id to i64
  %220 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache5, i64 0, i64 0, i64 0, i64 %219
  %221 = icmp ult i32 %0, 4
  br i1 %221, label %inter_warp_reduce-true265.then481, label %inter_warp_reduce-true265.cont480

inter_warp_reduce-true265.then481:                ; preds = %inter_warp_reduce-true265
  %partial_reduction_result269.then.val = load float, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont480

inter_warp_reduce-true265.cont480:                ; preds = %inter_warp_reduce-true265, %inter_warp_reduce-true265.then481
  %partial_reduction_result269 = phi float [ %partial_reduction_result269.then.val, %inter_warp_reduce-true265.then481 ], [ 0.000000e+00, %inter_warp_reduce-true265 ]
  %222 = icmp ult i32 %0, 4
  %223 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result269, i32 16, i32 31)
  br i1 %222, label %inter_warp_reduce-true265.then, label %inter_warp_reduce-true265.cont

inter_warp_reduce-true265.then:                   ; preds = %inter_warp_reduce-true265.cont480
  %.val367.then.val = load float, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont

inter_warp_reduce-true265.cont:                   ; preds = %inter_warp_reduce-true265.cont480, %inter_warp_reduce-true265.then
  %.val367 = phi float [ %.val367.then.val, %inter_warp_reduce-true265.then ], [ 0.000000e+00, %inter_warp_reduce-true265.cont480 ]
  %224 = icmp ult i32 %0, 4
  %add.43.i432 = fadd float %223, %.val367
  br i1 %224, label %inter_warp_reduce-true265.cont.then479, label %inter_warp_reduce-true265.cont.cont478

inter_warp_reduce-true265.cont.then479:           ; preds = %inter_warp_reduce-true265.cont
  store float %add.43.i432, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont478

inter_warp_reduce-true265.cont.cont478:           ; preds = %inter_warp_reduce-true265.cont, %inter_warp_reduce-true265.cont.then479
  %initial_value_addr267.0 = phi float [ 0.000000e+00, %inter_warp_reduce-true265.cont.then479 ], [ %add.43.i432, %inter_warp_reduce-true265.cont ]
  %225 = icmp ult i32 %0, 4
  %226 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.43.i432, i32 8, i32 31)
  br i1 %225, label %inter_warp_reduce-true265.cont.then, label %inter_warp_reduce-true265.cont.cont

inter_warp_reduce-true265.cont.then:              ; preds = %inter_warp_reduce-true265.cont.cont478
  %.val366.then.val = load float, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont

inter_warp_reduce-true265.cont.cont:              ; preds = %inter_warp_reduce-true265.cont.cont478, %inter_warp_reduce-true265.cont.then
  %.val366 = phi float [ %.val366.then.val, %inter_warp_reduce-true265.cont.then ], [ %initial_value_addr267.0, %inter_warp_reduce-true265.cont.cont478 ]
  %227 = icmp ult i32 %0, 4
  %add.43.i433 = fadd float %226, %.val366
  br i1 %227, label %inter_warp_reduce-true265.cont.cont.then477, label %inter_warp_reduce-true265.cont.cont.cont476

inter_warp_reduce-true265.cont.cont.then477:      ; preds = %inter_warp_reduce-true265.cont.cont
  store float %add.43.i433, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont.cont476

inter_warp_reduce-true265.cont.cont.cont476:      ; preds = %inter_warp_reduce-true265.cont.cont, %inter_warp_reduce-true265.cont.cont.then477
  %initial_value_addr267.1 = phi float [ %initial_value_addr267.0, %inter_warp_reduce-true265.cont.cont.then477 ], [ %add.43.i433, %inter_warp_reduce-true265.cont.cont ]
  %228 = icmp ult i32 %0, 4
  %229 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.43.i433, i32 4, i32 31)
  br i1 %228, label %inter_warp_reduce-true265.cont.cont.then, label %inter_warp_reduce-true265.cont.cont.cont

inter_warp_reduce-true265.cont.cont.then:         ; preds = %inter_warp_reduce-true265.cont.cont.cont476
  %.val365.then.val = load float, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont.cont

inter_warp_reduce-true265.cont.cont.cont:         ; preds = %inter_warp_reduce-true265.cont.cont.cont476, %inter_warp_reduce-true265.cont.cont.then
  %.val365 = phi float [ %.val365.then.val, %inter_warp_reduce-true265.cont.cont.then ], [ %initial_value_addr267.1, %inter_warp_reduce-true265.cont.cont.cont476 ]
  %230 = icmp ult i32 %0, 4
  %add.43.i434 = fadd float %229, %.val365
  br i1 %230, label %inter_warp_reduce-true265.cont.cont.cont.then475, label %inter_warp_reduce-true265.cont.cont.cont.cont474

inter_warp_reduce-true265.cont.cont.cont.then475: ; preds = %inter_warp_reduce-true265.cont.cont.cont
  store float %add.43.i434, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont.cont.cont474

inter_warp_reduce-true265.cont.cont.cont.cont474: ; preds = %inter_warp_reduce-true265.cont.cont.cont, %inter_warp_reduce-true265.cont.cont.cont.then475
  %initial_value_addr267.2 = phi float [ %initial_value_addr267.1, %inter_warp_reduce-true265.cont.cont.cont.then475 ], [ %add.43.i434, %inter_warp_reduce-true265.cont.cont.cont ]
  %231 = icmp ult i32 %0, 4
  %232 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.43.i434, i32 2, i32 31)
  br i1 %231, label %inter_warp_reduce-true265.cont.cont.cont.then, label %inter_warp_reduce-true265.cont.cont.cont.cont

inter_warp_reduce-true265.cont.cont.cont.then:    ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont474
  %.val364.then.val = load float, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont.cont.cont

inter_warp_reduce-true265.cont.cont.cont.cont:    ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont474, %inter_warp_reduce-true265.cont.cont.cont.then
  %.val364 = phi float [ %.val364.then.val, %inter_warp_reduce-true265.cont.cont.cont.then ], [ %initial_value_addr267.2, %inter_warp_reduce-true265.cont.cont.cont.cont474 ]
  %233 = icmp ult i32 %0, 4
  %add.43.i435 = fadd float %232, %.val364
  br i1 %233, label %inter_warp_reduce-true265.cont.cont.cont.cont.then473, label %inter_warp_reduce-true265.cont.cont.cont.cont.cont472

inter_warp_reduce-true265.cont.cont.cont.cont.then473: ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont
  store float %add.43.i435, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont.cont.cont.cont472

inter_warp_reduce-true265.cont.cont.cont.cont.cont472: ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont, %inter_warp_reduce-true265.cont.cont.cont.cont.then473
  %initial_value_addr267.3 = phi float [ %initial_value_addr267.2, %inter_warp_reduce-true265.cont.cont.cont.cont.then473 ], [ %add.43.i435, %inter_warp_reduce-true265.cont.cont.cont.cont ]
  %234 = icmp ult i32 %0, 4
  %235 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.43.i435, i32 1, i32 31)
  br i1 %234, label %inter_warp_reduce-true265.cont.cont.cont.cont.then, label %inter_warp_reduce-true265.cont.cont.cont.cont.cont

inter_warp_reduce-true265.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont.cont472
  %.val363.then.val = load float, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont.cont.cont.cont

inter_warp_reduce-true265.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont.cont472, %inter_warp_reduce-true265.cont.cont.cont.cont.then
  %.val363 = phi float [ %.val363.then.val, %inter_warp_reduce-true265.cont.cont.cont.cont.then ], [ %initial_value_addr267.3, %inter_warp_reduce-true265.cont.cont.cont.cont.cont472 ]
  %236 = icmp ult i32 %0, 4
  %add.43.i436 = fadd float %235, %.val363
  br i1 %236, label %inter_warp_reduce-true265.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true265.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true265.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont.cont
  store float %add.43.i436, ptr addrspace(3) %220, align 4
  br label %inter_warp_reduce-true265.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true265.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont.cont, %inter_warp_reduce-true265.cont.cont.cont.cont.cont.then
  %237 = icmp eq i32 %0, 0
  %238 = lshr i32 %1, 9
  %239 = zext i32 %238 to i64
  %240 = and i32 %1, 511
  %241 = zext i32 %240 to i64
  %output_element_address285 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg10531, i64 0, i64 %239, i64 %241
  br i1 %237, label %reduction_write_output-true283, label %inter_warp_reduce-after266

reduction_write_output-true283:                   ; preds = %inter_warp_reduce-true265.cont.cont.cont.cont.cont.cont
  store float %add.43.i436, ptr addrspace(1) %output_element_address285, align 4
  br label %inter_warp_reduce-after266

intra_warp_reduce_write-true303:                  ; preds = %inter_warp_reduce-after266
  store float %add.52.i406, ptr addrspace(3) %126, align 4
  br label %intra_warp_reduce_write-after304

inter_warp_reduce-true305:                        ; preds = %intra_warp_reduce_write-after304
  %242 = zext i32 %lane_id to i64
  %243 = getelementptr inbounds [1 x [1 x [4 x float]]], ptr addrspace(3) @shared_cache6, i64 0, i64 0, i64 0, i64 %242
  %244 = icmp ult i32 %0, 4
  br i1 %244, label %inter_warp_reduce-true305.then491, label %inter_warp_reduce-true305.cont490

inter_warp_reduce-true305.then491:                ; preds = %inter_warp_reduce-true305
  %partial_reduction_result309.then.val = load float, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont490

inter_warp_reduce-true305.cont490:                ; preds = %inter_warp_reduce-true305, %inter_warp_reduce-true305.then491
  %partial_reduction_result309 = phi float [ %partial_reduction_result309.then.val, %inter_warp_reduce-true305.then491 ], [ 0.000000e+00, %inter_warp_reduce-true305 ]
  %245 = icmp ult i32 %0, 4
  %246 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result309, i32 16, i32 31)
  br i1 %245, label %inter_warp_reduce-true305.then, label %inter_warp_reduce-true305.cont

inter_warp_reduce-true305.then:                   ; preds = %inter_warp_reduce-true305.cont490
  %.val379.then.val = load float, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont

inter_warp_reduce-true305.cont:                   ; preds = %inter_warp_reduce-true305.cont490, %inter_warp_reduce-true305.then
  %.val379 = phi float [ %.val379.then.val, %inter_warp_reduce-true305.then ], [ 0.000000e+00, %inter_warp_reduce-true305.cont490 ]
  %247 = icmp ult i32 %0, 4
  %add.52.i437 = fadd float %246, %.val379
  br i1 %247, label %inter_warp_reduce-true305.cont.then489, label %inter_warp_reduce-true305.cont.cont488

inter_warp_reduce-true305.cont.then489:           ; preds = %inter_warp_reduce-true305.cont
  store float %add.52.i437, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont488

inter_warp_reduce-true305.cont.cont488:           ; preds = %inter_warp_reduce-true305.cont, %inter_warp_reduce-true305.cont.then489
  %initial_value_addr307.0 = phi float [ 0.000000e+00, %inter_warp_reduce-true305.cont.then489 ], [ %add.52.i437, %inter_warp_reduce-true305.cont ]
  %248 = icmp ult i32 %0, 4
  %249 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.52.i437, i32 8, i32 31)
  br i1 %248, label %inter_warp_reduce-true305.cont.then, label %inter_warp_reduce-true305.cont.cont

inter_warp_reduce-true305.cont.then:              ; preds = %inter_warp_reduce-true305.cont.cont488
  %.val378.then.val = load float, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont

inter_warp_reduce-true305.cont.cont:              ; preds = %inter_warp_reduce-true305.cont.cont488, %inter_warp_reduce-true305.cont.then
  %.val378 = phi float [ %.val378.then.val, %inter_warp_reduce-true305.cont.then ], [ %initial_value_addr307.0, %inter_warp_reduce-true305.cont.cont488 ]
  %250 = icmp ult i32 %0, 4
  %add.52.i438 = fadd float %249, %.val378
  br i1 %250, label %inter_warp_reduce-true305.cont.cont.then487, label %inter_warp_reduce-true305.cont.cont.cont486

inter_warp_reduce-true305.cont.cont.then487:      ; preds = %inter_warp_reduce-true305.cont.cont
  store float %add.52.i438, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont.cont486

inter_warp_reduce-true305.cont.cont.cont486:      ; preds = %inter_warp_reduce-true305.cont.cont, %inter_warp_reduce-true305.cont.cont.then487
  %initial_value_addr307.1 = phi float [ %initial_value_addr307.0, %inter_warp_reduce-true305.cont.cont.then487 ], [ %add.52.i438, %inter_warp_reduce-true305.cont.cont ]
  %251 = icmp ult i32 %0, 4
  %252 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.52.i438, i32 4, i32 31)
  br i1 %251, label %inter_warp_reduce-true305.cont.cont.then, label %inter_warp_reduce-true305.cont.cont.cont

inter_warp_reduce-true305.cont.cont.then:         ; preds = %inter_warp_reduce-true305.cont.cont.cont486
  %.val377.then.val = load float, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont.cont

inter_warp_reduce-true305.cont.cont.cont:         ; preds = %inter_warp_reduce-true305.cont.cont.cont486, %inter_warp_reduce-true305.cont.cont.then
  %.val377 = phi float [ %.val377.then.val, %inter_warp_reduce-true305.cont.cont.then ], [ %initial_value_addr307.1, %inter_warp_reduce-true305.cont.cont.cont486 ]
  %253 = icmp ult i32 %0, 4
  %add.52.i439 = fadd float %252, %.val377
  br i1 %253, label %inter_warp_reduce-true305.cont.cont.cont.then485, label %inter_warp_reduce-true305.cont.cont.cont.cont484

inter_warp_reduce-true305.cont.cont.cont.then485: ; preds = %inter_warp_reduce-true305.cont.cont.cont
  store float %add.52.i439, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont.cont.cont484

inter_warp_reduce-true305.cont.cont.cont.cont484: ; preds = %inter_warp_reduce-true305.cont.cont.cont, %inter_warp_reduce-true305.cont.cont.cont.then485
  %initial_value_addr307.2 = phi float [ %initial_value_addr307.1, %inter_warp_reduce-true305.cont.cont.cont.then485 ], [ %add.52.i439, %inter_warp_reduce-true305.cont.cont.cont ]
  %254 = icmp ult i32 %0, 4
  %255 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.52.i439, i32 2, i32 31)
  br i1 %254, label %inter_warp_reduce-true305.cont.cont.cont.then, label %inter_warp_reduce-true305.cont.cont.cont.cont

inter_warp_reduce-true305.cont.cont.cont.then:    ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont484
  %.val376.then.val = load float, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont.cont.cont

inter_warp_reduce-true305.cont.cont.cont.cont:    ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont484, %inter_warp_reduce-true305.cont.cont.cont.then
  %.val376 = phi float [ %.val376.then.val, %inter_warp_reduce-true305.cont.cont.cont.then ], [ %initial_value_addr307.2, %inter_warp_reduce-true305.cont.cont.cont.cont484 ]
  %256 = icmp ult i32 %0, 4
  %add.52.i440 = fadd float %255, %.val376
  br i1 %256, label %inter_warp_reduce-true305.cont.cont.cont.cont.then483, label %inter_warp_reduce-true305.cont.cont.cont.cont.cont482

inter_warp_reduce-true305.cont.cont.cont.cont.then483: ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont
  store float %add.52.i440, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont.cont.cont.cont482

inter_warp_reduce-true305.cont.cont.cont.cont.cont482: ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont, %inter_warp_reduce-true305.cont.cont.cont.cont.then483
  %initial_value_addr307.3 = phi float [ %initial_value_addr307.2, %inter_warp_reduce-true305.cont.cont.cont.cont.then483 ], [ %add.52.i440, %inter_warp_reduce-true305.cont.cont.cont.cont ]
  %257 = icmp ult i32 %0, 4
  %258 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.52.i440, i32 1, i32 31)
  br i1 %257, label %inter_warp_reduce-true305.cont.cont.cont.cont.then, label %inter_warp_reduce-true305.cont.cont.cont.cont.cont

inter_warp_reduce-true305.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont.cont482
  %.val375.then.val = load float, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont.cont.cont.cont

inter_warp_reduce-true305.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont.cont482, %inter_warp_reduce-true305.cont.cont.cont.cont.then
  %.val375 = phi float [ %.val375.then.val, %inter_warp_reduce-true305.cont.cont.cont.cont.then ], [ %initial_value_addr307.3, %inter_warp_reduce-true305.cont.cont.cont.cont.cont482 ]
  %259 = icmp ult i32 %0, 4
  %add.52.i441 = fadd float %258, %.val375
  br i1 %259, label %inter_warp_reduce-true305.cont.cont.cont.cont.cont.then, label %inter_warp_reduce-true305.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true305.cont.cont.cont.cont.cont.then: ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont.cont
  store float %add.52.i441, ptr addrspace(3) %243, align 4
  br label %inter_warp_reduce-true305.cont.cont.cont.cont.cont.cont

inter_warp_reduce-true305.cont.cont.cont.cont.cont.cont: ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont.cont, %inter_warp_reduce-true305.cont.cont.cont.cont.cont.then
  %260 = icmp eq i32 %0, 0
  %261 = lshr i32 %1, 9
  %262 = zext i32 %261 to i64
  %263 = and i32 %1, 511
  %264 = zext i32 %263 to i64
  %output_element_address325 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg11533, i64 0, i64 %262, i64 %264
  br i1 %260, label %reduction_write_output-true323, label %common.ret

reduction_write_output-true323:                   ; preds = %inter_warp_reduce-true305.cont.cont.cont.cont.cont.cont
  store float %add.52.i441, ptr addrspace(1) %output_element_address325, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @reduce_114(ptr noalias nocapture readonly align 128 dereferenceable(8192) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg2) local_unnamed_addr #3 {
entry:
  %arg244 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg142 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg040 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %Arg_1.2 = load float, ptr addrspace(1) %arg142, align 128, !invariant.load !49
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !60
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %2 = zext i32 %1 to i64
  %3 = zext i32 %0 to i64
  %Arg_0.1 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg040, i64 0, i64 %2, i64 %3
  %Arg_0.13 = load float, ptr addrspace(1) %Arg_0.1, align 4, !invariant.load !49
  %add.6.i37 = fadd float %Arg_1.2, %Arg_0.13
  %Arg_0.1.147 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 32
  %Arg_0.13.1 = load float, ptr addrspace(1) %Arg_0.1.147, align 4, !invariant.load !49
  %add.6.i37.1 = fadd float %add.6.i37, %Arg_0.13.1
  %Arg_0.1.249 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 64
  %Arg_0.13.2 = load float, ptr addrspace(1) %Arg_0.1.249, align 4, !invariant.load !49
  %add.6.i37.2 = fadd float %add.6.i37.1, %Arg_0.13.2
  %Arg_0.1.351 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 96
  %Arg_0.13.3 = load float, ptr addrspace(1) %Arg_0.1.351, align 4, !invariant.load !49
  %add.6.i37.3 = fadd float %add.6.i37.2, %Arg_0.13.3
  %Arg_0.1.453 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 128
  %Arg_0.13.4 = load float, ptr addrspace(1) %Arg_0.1.453, align 4, !invariant.load !49
  %add.6.i37.4 = fadd float %add.6.i37.3, %Arg_0.13.4
  %Arg_0.1.555 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 160
  %Arg_0.13.5 = load float, ptr addrspace(1) %Arg_0.1.555, align 4, !invariant.load !49
  %add.6.i37.5 = fadd float %add.6.i37.4, %Arg_0.13.5
  %Arg_0.1.657 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 192
  %Arg_0.13.6 = load float, ptr addrspace(1) %Arg_0.1.657, align 4, !invariant.load !49
  %add.6.i37.6 = fadd float %add.6.i37.5, %Arg_0.13.6
  %Arg_0.1.759 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 224
  %Arg_0.13.7 = load float, ptr addrspace(1) %Arg_0.1.759, align 4, !invariant.load !49
  %add.6.i37.7 = fadd float %add.6.i37.6, %Arg_0.13.7
  %Arg_0.1.861 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 256
  %Arg_0.13.8 = load float, ptr addrspace(1) %Arg_0.1.861, align 4, !invariant.load !49
  %add.6.i37.8 = fadd float %add.6.i37.7, %Arg_0.13.8
  %Arg_0.1.963 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 288
  %Arg_0.13.9 = load float, ptr addrspace(1) %Arg_0.1.963, align 4, !invariant.load !49
  %add.6.i37.9 = fadd float %add.6.i37.8, %Arg_0.13.9
  %Arg_0.1.1065 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 320
  %Arg_0.13.10 = load float, ptr addrspace(1) %Arg_0.1.1065, align 4, !invariant.load !49
  %add.6.i37.10 = fadd float %add.6.i37.9, %Arg_0.13.10
  %Arg_0.1.1167 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 352
  %Arg_0.13.11 = load float, ptr addrspace(1) %Arg_0.1.1167, align 4, !invariant.load !49
  %add.6.i37.11 = fadd float %add.6.i37.10, %Arg_0.13.11
  %Arg_0.1.1269 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 384
  %Arg_0.13.12 = load float, ptr addrspace(1) %Arg_0.1.1269, align 4, !invariant.load !49
  %add.6.i37.12 = fadd float %add.6.i37.11, %Arg_0.13.12
  %Arg_0.1.1371 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 416
  %Arg_0.13.13 = load float, ptr addrspace(1) %Arg_0.1.1371, align 4, !invariant.load !49
  %add.6.i37.13 = fadd float %add.6.i37.12, %Arg_0.13.13
  %Arg_0.1.1473 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 448
  %Arg_0.13.14 = load float, ptr addrspace(1) %Arg_0.1.1473, align 4, !invariant.load !49
  %add.6.i37.14 = fadd float %add.6.i37.13, %Arg_0.13.14
  %Arg_0.1.1575 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 480
  %Arg_0.13.15 = load float, ptr addrspace(1) %Arg_0.1.1575, align 4, !invariant.load !49
  %add.6.i37.15 = fadd float %add.6.i37.14, %Arg_0.13.15
  %4 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i37.15, i32 16, i32 31)
  %add.6.i = fadd float %add.6.i37.15, %4
  %5 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i, i32 8, i32 31)
  %add.6.i33 = fadd float %add.6.i, %5
  %6 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i33, i32 4, i32 31)
  %add.6.i34 = fadd float %add.6.i33, %6
  %7 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i34, i32 2, i32 31)
  %add.6.i35 = fadd float %add.6.i34, %7
  %8 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.6.i35, i32 1, i32 31)
  %9 = icmp eq i32 %0, 0
  %add.6.i36 = fadd float %add.6.i35, %8
  br i1 %9, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %entry
  %10 = icmp eq i32 %0, 0
  tail call void @llvm.nvvm.barrier0()
  %output_element_address = getelementptr inbounds [4 x float], ptr addrspace(1) %arg244, i64 0, i64 %2
  br i1 %10, label %reduction_write_output-true, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %entry
  store float %add.6.i36, ptr addrspace(3) @"shared_cache7_$_0", align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) @"shared_cache7_$_0", align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_40(ptr noalias nocapture readonly align 128 dereferenceable(8192) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8192) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8192) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8192) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg8) local_unnamed_addr #3 {
entry:
  %arg8399 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7397 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6395 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5393 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4391 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3389 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2387 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1385 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0383 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !61
  switch i32 %0, label %entry.unreachabledefault [
    i32 0, label %reduce-group-0-true
    i32 1, label %reduce-group-1-true
    i32 2, label %entry.reduce-group-2-true_crit_edge
    i32 3, label %entry.reduce-group-3-true_crit_edge
  ]

entry.reduce-group-3-true_crit_edge:              ; preds = %entry
  %Arg_1.2164.pre = load float, ptr addrspace(1) %arg1385, align 128, !invariant.load !49
  %.pre330 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !60
  %.pre332 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %.pre334 = zext i32 %.pre332 to i64
  %.pre336 = zext i32 %.pre330 to i64
  %Arg_4.5 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg4391, i64 0, i64 %.pre334, i64 %.pre336
  %Arg_4.5190 = load float, ptr addrspace(1) %Arg_4.5, align 4, !invariant.load !49
  %add.24.i268 = fadd float %Arg_1.2164.pre, %Arg_4.5190
  %Arg_4.5.1402 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 32
  %Arg_4.5190.1 = load float, ptr addrspace(1) %Arg_4.5.1402, align 4, !invariant.load !49
  %add.24.i268.1 = fadd float %add.24.i268, %Arg_4.5190.1
  %Arg_4.5.2404 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 64
  %Arg_4.5190.2 = load float, ptr addrspace(1) %Arg_4.5.2404, align 4, !invariant.load !49
  %add.24.i268.2 = fadd float %add.24.i268.1, %Arg_4.5190.2
  %Arg_4.5.3406 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 96
  %Arg_4.5190.3 = load float, ptr addrspace(1) %Arg_4.5.3406, align 4, !invariant.load !49
  %add.24.i268.3 = fadd float %add.24.i268.2, %Arg_4.5190.3
  %Arg_4.5.4408 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 128
  %Arg_4.5190.4 = load float, ptr addrspace(1) %Arg_4.5.4408, align 4, !invariant.load !49
  %add.24.i268.4 = fadd float %add.24.i268.3, %Arg_4.5190.4
  %Arg_4.5.5410 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 160
  %Arg_4.5190.5 = load float, ptr addrspace(1) %Arg_4.5.5410, align 4, !invariant.load !49
  %add.24.i268.5 = fadd float %add.24.i268.4, %Arg_4.5190.5
  %Arg_4.5.6412 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 192
  %Arg_4.5190.6 = load float, ptr addrspace(1) %Arg_4.5.6412, align 4, !invariant.load !49
  %add.24.i268.6 = fadd float %add.24.i268.5, %Arg_4.5190.6
  %Arg_4.5.7414 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 224
  %Arg_4.5190.7 = load float, ptr addrspace(1) %Arg_4.5.7414, align 4, !invariant.load !49
  %add.24.i268.7 = fadd float %add.24.i268.6, %Arg_4.5190.7
  %Arg_4.5.8416 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 256
  %Arg_4.5190.8 = load float, ptr addrspace(1) %Arg_4.5.8416, align 4, !invariant.load !49
  %add.24.i268.8 = fadd float %add.24.i268.7, %Arg_4.5190.8
  %Arg_4.5.9418 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 288
  %Arg_4.5190.9 = load float, ptr addrspace(1) %Arg_4.5.9418, align 4, !invariant.load !49
  %add.24.i268.9 = fadd float %add.24.i268.8, %Arg_4.5190.9
  %Arg_4.5.10420 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 320
  %Arg_4.5190.10 = load float, ptr addrspace(1) %Arg_4.5.10420, align 4, !invariant.load !49
  %add.24.i268.10 = fadd float %add.24.i268.9, %Arg_4.5190.10
  %Arg_4.5.11422 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 352
  %Arg_4.5190.11 = load float, ptr addrspace(1) %Arg_4.5.11422, align 4, !invariant.load !49
  %add.24.i268.11 = fadd float %add.24.i268.10, %Arg_4.5190.11
  %Arg_4.5.12424 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 384
  %Arg_4.5190.12 = load float, ptr addrspace(1) %Arg_4.5.12424, align 4, !invariant.load !49
  %add.24.i268.12 = fadd float %add.24.i268.11, %Arg_4.5190.12
  %Arg_4.5.13426 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 416
  %Arg_4.5190.13 = load float, ptr addrspace(1) %Arg_4.5.13426, align 4, !invariant.load !49
  %add.24.i268.13 = fadd float %add.24.i268.12, %Arg_4.5190.13
  %Arg_4.5.14428 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 448
  %Arg_4.5190.14 = load float, ptr addrspace(1) %Arg_4.5.14428, align 4, !invariant.load !49
  %add.24.i268.14 = fadd float %add.24.i268.13, %Arg_4.5190.14
  %Arg_4.5.15430 = getelementptr inbounds float, ptr addrspace(1) %Arg_4.5, i64 480
  %Arg_4.5190.15 = load float, ptr addrspace(1) %Arg_4.5.15430, align 4, !invariant.load !49
  %add.24.i268.15 = fadd float %add.24.i268.14, %Arg_4.5190.15
  %1 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i268.15, i32 16, i32 31)
  %add.24.i = fadd float %add.24.i268.15, %1
  %2 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i, i32 8, i32 31)
  %add.24.i264 = fadd float %add.24.i, %2
  %3 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i264, i32 4, i32 31)
  %add.24.i265 = fadd float %add.24.i264, %3
  %4 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i265, i32 2, i32 31)
  %add.24.i266 = fadd float %add.24.i265, %4
  %5 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.24.i266, i32 1, i32 31)
  %6 = icmp eq i32 %.pre330, 0
  %add.24.i267 = fadd float %add.24.i266, %5
  br i1 %6, label %intra_warp_reduce_write-true220, label %intra_warp_reduce_write-after221

entry.reduce-group-2-true_crit_edge:              ; preds = %entry
  %Arg_1.297.pre = load float, ptr addrspace(1) %arg1385, align 128, !invariant.load !49
  %.pre = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !60
  %.pre279 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %.pre281 = zext i32 %.pre279 to i64
  %.pre283 = zext i32 %.pre to i64
  %Arg_3.4 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg3389, i64 0, i64 %.pre281, i64 %.pre283
  %Arg_3.4123 = load float, ptr addrspace(1) %Arg_3.4, align 4, !invariant.load !49
  %add.19.i263 = fadd float %Arg_1.297.pre, %Arg_3.4123
  %Arg_3.4.1432 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 32
  %Arg_3.4123.1 = load float, ptr addrspace(1) %Arg_3.4.1432, align 4, !invariant.load !49
  %add.19.i263.1 = fadd float %add.19.i263, %Arg_3.4123.1
  %Arg_3.4.2434 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 64
  %Arg_3.4123.2 = load float, ptr addrspace(1) %Arg_3.4.2434, align 4, !invariant.load !49
  %add.19.i263.2 = fadd float %add.19.i263.1, %Arg_3.4123.2
  %Arg_3.4.3436 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 96
  %Arg_3.4123.3 = load float, ptr addrspace(1) %Arg_3.4.3436, align 4, !invariant.load !49
  %add.19.i263.3 = fadd float %add.19.i263.2, %Arg_3.4123.3
  %Arg_3.4.4438 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 128
  %Arg_3.4123.4 = load float, ptr addrspace(1) %Arg_3.4.4438, align 4, !invariant.load !49
  %add.19.i263.4 = fadd float %add.19.i263.3, %Arg_3.4123.4
  %Arg_3.4.5440 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 160
  %Arg_3.4123.5 = load float, ptr addrspace(1) %Arg_3.4.5440, align 4, !invariant.load !49
  %add.19.i263.5 = fadd float %add.19.i263.4, %Arg_3.4123.5
  %Arg_3.4.6442 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 192
  %Arg_3.4123.6 = load float, ptr addrspace(1) %Arg_3.4.6442, align 4, !invariant.load !49
  %add.19.i263.6 = fadd float %add.19.i263.5, %Arg_3.4123.6
  %Arg_3.4.7444 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 224
  %Arg_3.4123.7 = load float, ptr addrspace(1) %Arg_3.4.7444, align 4, !invariant.load !49
  %add.19.i263.7 = fadd float %add.19.i263.6, %Arg_3.4123.7
  %Arg_3.4.8446 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 256
  %Arg_3.4123.8 = load float, ptr addrspace(1) %Arg_3.4.8446, align 4, !invariant.load !49
  %add.19.i263.8 = fadd float %add.19.i263.7, %Arg_3.4123.8
  %Arg_3.4.9448 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 288
  %Arg_3.4123.9 = load float, ptr addrspace(1) %Arg_3.4.9448, align 4, !invariant.load !49
  %add.19.i263.9 = fadd float %add.19.i263.8, %Arg_3.4123.9
  %Arg_3.4.10450 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 320
  %Arg_3.4123.10 = load float, ptr addrspace(1) %Arg_3.4.10450, align 4, !invariant.load !49
  %add.19.i263.10 = fadd float %add.19.i263.9, %Arg_3.4123.10
  %Arg_3.4.11452 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 352
  %Arg_3.4123.11 = load float, ptr addrspace(1) %Arg_3.4.11452, align 4, !invariant.load !49
  %add.19.i263.11 = fadd float %add.19.i263.10, %Arg_3.4123.11
  %Arg_3.4.12454 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 384
  %Arg_3.4123.12 = load float, ptr addrspace(1) %Arg_3.4.12454, align 4, !invariant.load !49
  %add.19.i263.12 = fadd float %add.19.i263.11, %Arg_3.4123.12
  %Arg_3.4.13456 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 416
  %Arg_3.4123.13 = load float, ptr addrspace(1) %Arg_3.4.13456, align 4, !invariant.load !49
  %add.19.i263.13 = fadd float %add.19.i263.12, %Arg_3.4123.13
  %Arg_3.4.14458 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 448
  %Arg_3.4123.14 = load float, ptr addrspace(1) %Arg_3.4.14458, align 4, !invariant.load !49
  %add.19.i263.14 = fadd float %add.19.i263.13, %Arg_3.4123.14
  %Arg_3.4.15460 = getelementptr inbounds float, ptr addrspace(1) %Arg_3.4, i64 480
  %Arg_3.4123.15 = load float, ptr addrspace(1) %Arg_3.4.15460, align 4, !invariant.load !49
  %add.19.i263.15 = fadd float %add.19.i263.14, %Arg_3.4123.15
  %7 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i263.15, i32 16, i32 31)
  %add.19.i = fadd float %add.19.i263.15, %7
  %8 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i, i32 8, i32 31)
  %add.19.i259 = fadd float %add.19.i, %8
  %9 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i259, i32 4, i32 31)
  %add.19.i260 = fadd float %add.19.i259, %9
  %10 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i260, i32 2, i32 31)
  %add.19.i261 = fadd float %add.19.i260, %10
  %11 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.19.i261, i32 1, i32 31)
  %12 = icmp eq i32 %.pre, 0
  %add.19.i262 = fadd float %add.19.i261, %11
  br i1 %12, label %intra_warp_reduce_write-true153, label %intra_warp_reduce_write-after154

entry.unreachabledefault:                         ; preds = %entry
  unreachable

common.ret.sink.split:                            ; preds = %reduction_write_output-true225, %reduction_write_output-true, %reduction_write_output-true91, %reduction_write_output-true158
  %.sink = phi ptr addrspace(3) [ @shared_cache10, %reduction_write_output-true158 ], [ @shared_cache9, %reduction_write_output-true91 ], [ @shared_cache8, %reduction_write_output-true ], [ @shared_cache11, %reduction_write_output-true225 ]
  %output_element_address160.sink = phi ptr addrspace(1) [ %output_element_address160, %reduction_write_output-true158 ], [ %output_element_address93, %reduction_write_output-true91 ], [ %output_element_address, %reduction_write_output-true ], [ %output_element_address227, %reduction_write_output-true225 ]
  %output161.then.val = load float, ptr addrspace(3) %.sink, align 4
  store float %output161.then.val, ptr addrspace(1) %output_element_address160.sink, align 4
  br label %common.ret

common.ret:                                       ; preds = %common.ret.sink.split, %intra_warp_reduce_write-after154, %intra_warp_reduce_write-after87, %intra_warp_reduce_write-after, %intra_warp_reduce_write-after221
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr addrspace(1) %arg1385, align 128, !invariant.load !49
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !60
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %15 = zext i32 %14 to i64
  %16 = zext i32 %13 to i64
  %Arg_0.1 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg0383, i64 0, i64 %15, i64 %16
  %Arg_0.13 = load float, ptr addrspace(1) %Arg_0.1, align 4, !invariant.load !49
  %add.9.i253 = fadd float %Arg_1.2, %Arg_0.13
  %Arg_0.1.1462 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 32
  %Arg_0.13.1 = load float, ptr addrspace(1) %Arg_0.1.1462, align 4, !invariant.load !49
  %add.9.i253.1 = fadd float %add.9.i253, %Arg_0.13.1
  %Arg_0.1.2464 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 64
  %Arg_0.13.2 = load float, ptr addrspace(1) %Arg_0.1.2464, align 4, !invariant.load !49
  %add.9.i253.2 = fadd float %add.9.i253.1, %Arg_0.13.2
  %Arg_0.1.3466 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 96
  %Arg_0.13.3 = load float, ptr addrspace(1) %Arg_0.1.3466, align 4, !invariant.load !49
  %add.9.i253.3 = fadd float %add.9.i253.2, %Arg_0.13.3
  %Arg_0.1.4468 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 128
  %Arg_0.13.4 = load float, ptr addrspace(1) %Arg_0.1.4468, align 4, !invariant.load !49
  %add.9.i253.4 = fadd float %add.9.i253.3, %Arg_0.13.4
  %Arg_0.1.5470 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 160
  %Arg_0.13.5 = load float, ptr addrspace(1) %Arg_0.1.5470, align 4, !invariant.load !49
  %add.9.i253.5 = fadd float %add.9.i253.4, %Arg_0.13.5
  %Arg_0.1.6472 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 192
  %Arg_0.13.6 = load float, ptr addrspace(1) %Arg_0.1.6472, align 4, !invariant.load !49
  %add.9.i253.6 = fadd float %add.9.i253.5, %Arg_0.13.6
  %Arg_0.1.7474 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 224
  %Arg_0.13.7 = load float, ptr addrspace(1) %Arg_0.1.7474, align 4, !invariant.load !49
  %add.9.i253.7 = fadd float %add.9.i253.6, %Arg_0.13.7
  %Arg_0.1.8476 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 256
  %Arg_0.13.8 = load float, ptr addrspace(1) %Arg_0.1.8476, align 4, !invariant.load !49
  %add.9.i253.8 = fadd float %add.9.i253.7, %Arg_0.13.8
  %Arg_0.1.9478 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 288
  %Arg_0.13.9 = load float, ptr addrspace(1) %Arg_0.1.9478, align 4, !invariant.load !49
  %add.9.i253.9 = fadd float %add.9.i253.8, %Arg_0.13.9
  %Arg_0.1.10480 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 320
  %Arg_0.13.10 = load float, ptr addrspace(1) %Arg_0.1.10480, align 4, !invariant.load !49
  %add.9.i253.10 = fadd float %add.9.i253.9, %Arg_0.13.10
  %Arg_0.1.11482 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 352
  %Arg_0.13.11 = load float, ptr addrspace(1) %Arg_0.1.11482, align 4, !invariant.load !49
  %add.9.i253.11 = fadd float %add.9.i253.10, %Arg_0.13.11
  %Arg_0.1.12484 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 384
  %Arg_0.13.12 = load float, ptr addrspace(1) %Arg_0.1.12484, align 4, !invariant.load !49
  %add.9.i253.12 = fadd float %add.9.i253.11, %Arg_0.13.12
  %Arg_0.1.13486 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 416
  %Arg_0.13.13 = load float, ptr addrspace(1) %Arg_0.1.13486, align 4, !invariant.load !49
  %add.9.i253.13 = fadd float %add.9.i253.12, %Arg_0.13.13
  %Arg_0.1.14488 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 448
  %Arg_0.13.14 = load float, ptr addrspace(1) %Arg_0.1.14488, align 4, !invariant.load !49
  %add.9.i253.14 = fadd float %add.9.i253.13, %Arg_0.13.14
  %Arg_0.1.15490 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.1, i64 480
  %Arg_0.13.15 = load float, ptr addrspace(1) %Arg_0.1.15490, align 4, !invariant.load !49
  %add.9.i253.15 = fadd float %add.9.i253.14, %Arg_0.13.15
  %17 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i253.15, i32 16, i32 31)
  %add.9.i = fadd float %add.9.i253.15, %17
  %18 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i, i32 8, i32 31)
  %add.9.i249 = fadd float %add.9.i, %18
  %19 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i249, i32 4, i32 31)
  %add.9.i250 = fadd float %add.9.i249, %19
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i250, i32 2, i32 31)
  %add.9.i251 = fadd float %add.9.i250, %20
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.9.i251, i32 1, i32 31)
  %22 = icmp eq i32 %13, 0
  %add.9.i252 = fadd float %add.9.i251, %21
  br i1 %22, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %reduce-group-0-true
  %23 = icmp eq i32 %13, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %23, label %reduction_write_output-true, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %reduce-group-0-true
  store float %add.9.i252, ptr addrspace(3) @shared_cache8, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output_element_address = getelementptr inbounds [4 x float], ptr addrspace(1) %arg5393, i64 0, i64 %15
  br label %common.ret.sink.split

reduce-group-1-true:                              ; preds = %entry
  %Arg_1.230 = load float, ptr addrspace(1) %arg1385, align 128, !invariant.load !49
  %24 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !60
  %25 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %26 = zext i32 %25 to i64
  %27 = zext i32 %24 to i64
  %Arg_2.3 = getelementptr inbounds [4 x [512 x float]], ptr addrspace(1) %arg2387, i64 0, i64 %26, i64 %27
  %Arg_2.356 = load float, ptr addrspace(1) %Arg_2.3, align 4, !invariant.load !49
  %add.14.i258 = fadd float %Arg_1.230, %Arg_2.356
  %Arg_2.3.1492 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 32
  %Arg_2.356.1 = load float, ptr addrspace(1) %Arg_2.3.1492, align 4, !invariant.load !49
  %add.14.i258.1 = fadd float %add.14.i258, %Arg_2.356.1
  %Arg_2.3.2494 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 64
  %Arg_2.356.2 = load float, ptr addrspace(1) %Arg_2.3.2494, align 4, !invariant.load !49
  %add.14.i258.2 = fadd float %add.14.i258.1, %Arg_2.356.2
  %Arg_2.3.3496 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 96
  %Arg_2.356.3 = load float, ptr addrspace(1) %Arg_2.3.3496, align 4, !invariant.load !49
  %add.14.i258.3 = fadd float %add.14.i258.2, %Arg_2.356.3
  %Arg_2.3.4498 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 128
  %Arg_2.356.4 = load float, ptr addrspace(1) %Arg_2.3.4498, align 4, !invariant.load !49
  %add.14.i258.4 = fadd float %add.14.i258.3, %Arg_2.356.4
  %Arg_2.3.5500 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 160
  %Arg_2.356.5 = load float, ptr addrspace(1) %Arg_2.3.5500, align 4, !invariant.load !49
  %add.14.i258.5 = fadd float %add.14.i258.4, %Arg_2.356.5
  %Arg_2.3.6502 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 192
  %Arg_2.356.6 = load float, ptr addrspace(1) %Arg_2.3.6502, align 4, !invariant.load !49
  %add.14.i258.6 = fadd float %add.14.i258.5, %Arg_2.356.6
  %Arg_2.3.7504 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 224
  %Arg_2.356.7 = load float, ptr addrspace(1) %Arg_2.3.7504, align 4, !invariant.load !49
  %add.14.i258.7 = fadd float %add.14.i258.6, %Arg_2.356.7
  %Arg_2.3.8506 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 256
  %Arg_2.356.8 = load float, ptr addrspace(1) %Arg_2.3.8506, align 4, !invariant.load !49
  %add.14.i258.8 = fadd float %add.14.i258.7, %Arg_2.356.8
  %Arg_2.3.9508 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 288
  %Arg_2.356.9 = load float, ptr addrspace(1) %Arg_2.3.9508, align 4, !invariant.load !49
  %add.14.i258.9 = fadd float %add.14.i258.8, %Arg_2.356.9
  %Arg_2.3.10510 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 320
  %Arg_2.356.10 = load float, ptr addrspace(1) %Arg_2.3.10510, align 4, !invariant.load !49
  %add.14.i258.10 = fadd float %add.14.i258.9, %Arg_2.356.10
  %Arg_2.3.11512 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 352
  %Arg_2.356.11 = load float, ptr addrspace(1) %Arg_2.3.11512, align 4, !invariant.load !49
  %add.14.i258.11 = fadd float %add.14.i258.10, %Arg_2.356.11
  %Arg_2.3.12514 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 384
  %Arg_2.356.12 = load float, ptr addrspace(1) %Arg_2.3.12514, align 4, !invariant.load !49
  %add.14.i258.12 = fadd float %add.14.i258.11, %Arg_2.356.12
  %Arg_2.3.13516 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 416
  %Arg_2.356.13 = load float, ptr addrspace(1) %Arg_2.3.13516, align 4, !invariant.load !49
  %add.14.i258.13 = fadd float %add.14.i258.12, %Arg_2.356.13
  %Arg_2.3.14518 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 448
  %Arg_2.356.14 = load float, ptr addrspace(1) %Arg_2.3.14518, align 4, !invariant.load !49
  %add.14.i258.14 = fadd float %add.14.i258.13, %Arg_2.356.14
  %Arg_2.3.15520 = getelementptr inbounds float, ptr addrspace(1) %Arg_2.3, i64 480
  %Arg_2.356.15 = load float, ptr addrspace(1) %Arg_2.3.15520, align 4, !invariant.load !49
  %add.14.i258.15 = fadd float %add.14.i258.14, %Arg_2.356.15
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i258.15, i32 16, i32 31)
  %add.14.i = fadd float %add.14.i258.15, %28
  %29 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i, i32 8, i32 31)
  %add.14.i254 = fadd float %add.14.i, %29
  %30 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i254, i32 4, i32 31)
  %add.14.i255 = fadd float %add.14.i254, %30
  %31 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i255, i32 2, i32 31)
  %add.14.i256 = fadd float %add.14.i255, %31
  %32 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i256, i32 1, i32 31)
  %33 = icmp eq i32 %24, 0
  %add.14.i257 = fadd float %add.14.i256, %32
  br i1 %33, label %intra_warp_reduce_write-true86, label %intra_warp_reduce_write-after87

intra_warp_reduce_write-after87:                  ; preds = %intra_warp_reduce_write-true86, %reduce-group-1-true
  %34 = icmp eq i32 %24, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %34, label %reduction_write_output-true91, label %common.ret

intra_warp_reduce_write-true86:                   ; preds = %reduce-group-1-true
  store float %add.14.i257, ptr addrspace(3) @shared_cache9, align 4
  br label %intra_warp_reduce_write-after87

reduction_write_output-true91:                    ; preds = %intra_warp_reduce_write-after87
  %output_element_address93 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg6395, i64 0, i64 %26
  br label %common.ret.sink.split

intra_warp_reduce_write-after154:                 ; preds = %intra_warp_reduce_write-true153, %entry.reduce-group-2-true_crit_edge
  %35 = icmp eq i32 %.pre, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %35, label %reduction_write_output-true158, label %common.ret

intra_warp_reduce_write-true153:                  ; preds = %entry.reduce-group-2-true_crit_edge
  store float %add.19.i262, ptr addrspace(3) @shared_cache10, align 4
  br label %intra_warp_reduce_write-after154

reduction_write_output-true158:                   ; preds = %intra_warp_reduce_write-after154
  %output_element_address160 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg7397, i64 0, i64 %.pre281
  br label %common.ret.sink.split

intra_warp_reduce_write-after221:                 ; preds = %intra_warp_reduce_write-true220, %entry.reduce-group-3-true_crit_edge
  %36 = icmp eq i32 %.pre330, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %36, label %reduction_write_output-true225, label %common.ret

intra_warp_reduce_write-true220:                  ; preds = %entry.reduce-group-3-true_crit_edge
  store float %add.24.i267, ptr addrspace(3) @shared_cache11, align 4
  br label %intra_warp_reduce_write-after221

reduction_write_output-true225:                   ; preds = %intra_warp_reduce_write-after221
  %output_element_address227 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg8399, i64 0, i64 %.pre334
  br label %common.ret.sink.split
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_29(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !61
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !49
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !49
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4, !invariant.load !49
  %multiply.5 = fmul float %4, %6
  %subtract.6 = fsub float %3, %multiply.5
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_24(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(16) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(16) %arg12) local_unnamed_addr #0 {
entry:
  %arg1225 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1123 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1021 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg919 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg817 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg715 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg613 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !61
  %1 = zext i32 %0 to i64
  %2 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %1
  %3 = load float, ptr addrspace(1) %2, align 4, !invariant.load !49
  %4 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !49
  %5 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %1
  %6 = load float, ptr addrspace(1) %5, align 4, !invariant.load !49
  %multiply.11 = fmul float %4, %6
  %subtract.13 = fsub float %3, %multiply.11
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %1
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !49
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg49, i64 %1
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !49
  %multiply.14 = fmul float %4, %10
  %subtract.16 = fsub float %8, %multiply.14
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %1
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !49
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg613, i64 %1
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !49
  %multiply.17 = fmul float %4, %14
  %subtract.19 = fsub float %12, %multiply.17
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg715, i64 %1
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !49
  %17 = getelementptr inbounds float, ptr addrspace(1) %arg817, i64 %1
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !49
  %multiply.20 = fmul float %4, %18
  %subtract.22 = fsub float %16, %multiply.20
  %19 = getelementptr inbounds float, ptr addrspace(1) %arg919, i64 %1
  store float %subtract.13, ptr addrspace(1) %19, align 4
  %20 = getelementptr inbounds float, ptr addrspace(1) %arg1021, i64 %1
  store float %subtract.16, ptr addrspace(1) %20, align 4
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg1123, i64 %1
  store float %subtract.19, ptr addrspace(1) %21, align 4
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg1225, i64 %1
  store float %subtract.22, ptr addrspace(1) %22, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_11(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(838860800) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg4) local_unnamed_addr #3 {
entry:
  %arg4143 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3141 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2139 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1137 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0135 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !62
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %thread_id.x = and i32 %1, 31
  %thread_id.y107 = lshr i32 %1, 5
  %2 = shl nuw nsw i32 %thread_id.x, 1
  %3 = mul nuw nsw i32 %0, 6400
  %4 = zext i32 %2 to i64
  %5 = or i32 %2, 1
  %6 = add nuw nsw i32 %thread_id.y107, -32
  %7 = shl nuw nsw i32 %thread_id.y107, 6
  %8 = add i32 %3, %7
  %9 = add i32 %8, %2
  %10 = add i32 %9, 1
  %11 = lshr i32 %10, 6
  %12 = shl nuw nsw i32 %11, 6
  %13 = zext i32 %9 to i64
  %14 = add nuw nsw i64 %13, 1
  %15 = lshr i64 %14, 6
  %16 = shl nuw nsw i64 %15, 8
  %17 = trunc i32 %1 to i5
  %18 = zext i5 %17 to i64
  %19 = shl nuw nsw i64 %18, 3
  %20 = add i64 %16, %19
  %21 = add i64 %20, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg2139, i64 %21
  %22 = shl nuw nsw i64 %15, 2
  %scevgep175 = getelementptr i8, ptr addrspace(1) %arg1137, i64 %22
  %23 = lshr i32 %9, 6
  %24 = shl nuw nsw i32 %23, 6
  %25 = lshr i64 %13, 6
  %26 = shl nuw nsw i64 %25, 2
  %scevgep183 = getelementptr i8, ptr addrspace(1) %arg1137, i64 %26
  %27 = shl nuw nsw i64 %25, 8
  %28 = add i64 %27, %19
  %scevgep191 = getelementptr i8, ptr addrspace(1) %arg2139, i64 %28
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true99
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %concatenate.16.merge35
  %lsr.iv192 = phi ptr addrspace(1) [ %scevgep191, %entry ], [ %scevgep193, %concatenate.16.merge35 ]
  %lsr.iv188 = phi i64 [ %25, %entry ], [ %lsr.iv.next189, %concatenate.16.merge35 ]
  %lsr.iv186 = phi i64 [ %13, %entry ], [ %lsr.iv.next187, %concatenate.16.merge35 ]
  %lsr.iv184 = phi ptr addrspace(1) [ %scevgep183, %entry ], [ %scevgep185, %concatenate.16.merge35 ]
  %lsr.iv181 = phi i32 [ %23, %entry ], [ %lsr.iv.next182, %concatenate.16.merge35 ]
  %lsr.iv176 = phi ptr addrspace(1) [ %scevgep175, %entry ], [ %scevgep177, %concatenate.16.merge35 ]
  %lsr.iv172 = phi i64 [ %15, %entry ], [ %lsr.iv.next173, %concatenate.16.merge35 ]
  %lsr.iv170 = phi i64 [ %14, %entry ], [ %lsr.iv.next171, %concatenate.16.merge35 ]
  %lsr.iv168 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep169, %concatenate.16.merge35 ]
  %lsr.iv166 = phi i32 [ 0, %entry ], [ %lsr.iv.next167, %concatenate.16.merge35 ]
  %lsr.iv164 = phi i32 [ %11, %entry ], [ %lsr.iv.next165, %concatenate.16.merge35 ]
  %lsr.iv = phi i32 [ %6, %entry ], [ %lsr.iv.next, %concatenate.16.merge35 ]
  %partial_reduction_result106.sroa.0.0132 = phi float [ 0.000000e+00, %entry ], [ %add.23.i, %concatenate.16.merge35 ]
  %partial_reduction_result106.sroa.4.0131 = phi float [ 0.000000e+00, %entry ], [ %add.23.i130, %concatenate.16.merge35 ]
  %29 = trunc i64 %4 to i32
  %lsr197 = trunc i64 %lsr.iv170 to i32
  %lsr195 = trunc i64 %lsr.iv186 to i32
  %30 = udiv i32 %lsr197, 52428800
  %31 = mul nuw nsw i32 %30, 52428800
  %32 = add i32 %12, %31
  %33 = udiv i32 %lsr197, 6400
  %34 = trunc i32 %33 to i13
  %35 = zext i13 %34 to i32
  %36 = mul nuw nsw i32 %35, 6400
  %37 = add i32 %32, %36
  %38 = udiv i32 %lsr.iv164, 100
  %39 = mul nuw nsw i32 %38, 6400
  %40 = sub i32 %37, %39
  %41 = sub i32 %12, %39
  %42 = udiv i64 %lsr.iv170, 52428800
  %43 = mul nuw nsw i64 %42, 209715200
  %44 = zext i13 %34 to i64
  %45 = mul nuw nsw i64 %44, 25600
  %46 = add i64 %43, %45
  %47 = udiv i64 %lsr.iv172, 100
  %48 = mul nuw nsw i64 %47, 25600
  %49 = sub i64 %46, %48
  %scevgep174 = getelementptr i8, ptr addrspace(1) %lsr.iv168, i64 %49
  %50 = mul nuw nsw i64 %42, 3276800
  %51 = mul nuw nsw i64 %44, 400
  %52 = add i64 %50, %51
  %53 = mul nuw nsw i64 %47, 400
  %54 = sub i64 %52, %53
  %scevgep178 = getelementptr i8, ptr addrspace(1) %lsr.iv176, i64 %54
  %55 = udiv i32 %lsr195, 52428800
  %56 = mul nuw nsw i32 %55, 52428800
  %57 = add i32 %24, %56
  %58 = udiv i32 %lsr195, 6400
  %59 = trunc i32 %58 to i13
  %60 = zext i13 %59 to i32
  %61 = mul nuw nsw i32 %60, 6400
  %62 = add i32 %57, %61
  %63 = udiv i32 %lsr.iv181, 100
  %64 = mul nuw nsw i32 %63, 6400
  %65 = sub i32 %62, %64
  %66 = sub i32 %24, %64
  %67 = udiv i64 %lsr.iv186, 52428800
  %68 = mul nuw nsw i64 %67, 3276800
  %69 = zext i13 %59 to i64
  %70 = mul nuw nsw i64 %69, 400
  %71 = add i64 %68, %70
  %72 = udiv i64 %lsr.iv188, 100
  %73 = mul nuw nsw i64 %72, 400
  %74 = sub i64 %71, %73
  %scevgep190 = getelementptr i8, ptr addrspace(1) %lsr.iv184, i64 %74
  %75 = mul nuw nsw i64 %67, 209715200
  %76 = mul nuw nsw i64 %69, 25600
  %77 = add i64 %75, %76
  %78 = mul nuw nsw i64 %72, 25600
  %79 = sub i64 %77, %78
  %scevgep194 = getelementptr i8, ptr addrspace(1) %lsr.iv192, i64 %79
  %Arg_1.23 = load float, ptr addrspace(1) %scevgep190, align 4, !invariant.load !49
  %Arg_2.34 = load float, ptr addrspace(1) %scevgep194, align 8, !invariant.load !49
  %multiply.18 = fmul float %Arg_1.23, %Arg_2.34
  %add.23.i = fadd float %partial_reduction_result106.sroa.0.0132, %multiply.18
  %80 = add i32 %lsr.iv166, %66
  %81 = add i32 %lsr.iv166, %65
  %.masked = and i32 %80, 192
  %82 = or i32 %.masked, %29
  %83 = lshr i32 %81, 8
  %84 = urem i32 %83, 100
  %85 = udiv i32 %81, 25600
  %86 = icmp ult i32 %82, 128
  br i1 %86, label %concatenate.pivot.64., label %concatenate.pivot.192.

y_in_tile.loop_exit:                              ; preds = %concatenate.16.merge35
  %87 = zext i32 %thread_id.x to i64
  %88 = zext i32 %thread_id.y107 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i64 0, i64 0, i64 0, i64 %87, i64 %88
  store float %add.23.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i64 0, i64 0, i64 0, i64 %88, i64 %87
  %partial_reduction_result67 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %89 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 16, i32 31)
  %add.23.i120 = fadd float %partial_reduction_result67, %89
  %90 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i120, i32 8, i32 31)
  %add.23.i121 = fadd float %add.23.i120, %90
  %91 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i121, i32 4, i32 31)
  %add.23.i122 = fadd float %add.23.i121, %91
  %92 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i122, i32 2, i32 31)
  %add.23.i123 = fadd float %add.23.i122, %92
  %93 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i123, i32 1, i32 31)
  %add.23.i124 = fadd float %add.23.i123, %93
  store float %add.23.i124, ptr addrspace(3) %shmem_transposed_addr, align 4
  %94 = shl nuw nsw i32 %thread_id.y107, 1
  %95 = icmp eq i32 %thread_id.x, 0
  %96 = lshr i32 %0, 13
  %97 = zext i32 %96 to i64
  %98 = and i32 %0, 8191
  %99 = zext i32 %98 to i64
  %100 = zext i32 %94 to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg4143, i64 0, i64 %97, i64 %99, i64 %100
  br i1 %95, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %101 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address81145 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.23.i130, ptr addrspace(3) %shmem_output_address81145, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83146 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result85 = load float, ptr addrspace(3) %shmem_transposed_addr83146, align 4
  %102 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  %add.23.i125 = fadd float %partial_reduction_result85, %102
  %103 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i125, i32 8, i32 31)
  %add.23.i126 = fadd float %add.23.i125, %103
  %104 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i126, i32 4, i32 31)
  %add.23.i127 = fadd float %add.23.i126, %104
  %105 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i127, i32 2, i32 31)
  %add.23.i128 = fadd float %add.23.i127, %105
  %106 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i128, i32 1, i32 31)
  %add.23.i129 = fadd float %add.23.i128, %106
  store float %add.23.i129, ptr addrspace(3) %shmem_transposed_addr83146, align 4
  br i1 %101, label %reduction_write_output-true99, label %common.ret

concatenate.pivot.64.:                            ; preds = %y_in_tile.loop_body
  %107 = icmp ult i32 %82, 64
  br i1 %107, label %concatenate.pivot.0., label %concatenate.pivot.64.23

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %108 = zext i32 %85 to i64
  %109 = zext i32 %84 to i64
  %Arg_1.25 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg1137, i64 0, i64 0, i64 %108, i64 %109
  %110 = zext i32 %82 to i64
  %Arg_0.1 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0135, i64 0, i64 0, i64 %108, i64 0, i64 %110
  br label %concatenate.16.merge

concatenate.pivot.64.23:                          ; preds = %concatenate.pivot.64.
  %111 = add nsw i32 %82, -64
  %112 = zext i32 %85 to i64
  %113 = zext i32 %84 to i64
  %114 = getelementptr [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg1137, i64 0, i64 0, i64 %112, i64 %113
  %Arg_1.28147 = getelementptr inbounds float, ptr addrspace(1) %114, i64 819200
  %115 = zext i32 %111 to i64
  %116 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0135, i64 0, i64 0, i64 %112, i64 0, i64 %115
  %Arg_0.110148 = getelementptr inbounds float, ptr addrspace(1) %116, i64 524288
  br label %concatenate.16.merge

concatenate.pivot.192.:                           ; preds = %y_in_tile.loop_body
  %117 = icmp ult i32 %82, 192
  %118 = zext i32 %85 to i64
  %119 = zext i32 %84 to i64
  br i1 %117, label %concatenate.pivot.128.24, label %concatenate.pivot.192.25

concatenate.pivot.128.24:                         ; preds = %concatenate.pivot.192.
  %120 = add nsw i32 %82, -128
  %121 = getelementptr [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg1137, i64 0, i64 0, i64 %118, i64 %119
  %Arg_1.213149 = getelementptr inbounds float, ptr addrspace(1) %121, i64 1638400
  %122 = zext i32 %120 to i64
  %123 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0135, i64 0, i64 0, i64 %118, i64 0, i64 %122
  %Arg_0.115150 = getelementptr inbounds float, ptr addrspace(1) %123, i64 1048576
  br label %concatenate.16.merge

concatenate.pivot.192.25:                         ; preds = %concatenate.pivot.192.
  %124 = getelementptr [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg1137, i64 0, i64 0, i64 %118, i64 %119
  %Arg_1.218151 = getelementptr inbounds float, ptr addrspace(1) %124, i64 2457600
  %125 = sext i32 %82 to i64
  %126 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0135, i64 0, i64 0, i64 %118, i64 0, i64 %125
  %Arg_0.120152 = getelementptr inbounds float, ptr addrspace(1) %126, i64 1572672
  br label %concatenate.16.merge

concatenate.16.merge:                             ; preds = %concatenate.pivot.192.25, %concatenate.pivot.128.24, %concatenate.pivot.64.23, %concatenate.pivot.0.
  %Arg_0.120.sink = phi ptr addrspace(1) [ %Arg_0.120152, %concatenate.pivot.192.25 ], [ %Arg_0.115150, %concatenate.pivot.128.24 ], [ %Arg_0.110148, %concatenate.pivot.64.23 ], [ %Arg_0.1, %concatenate.pivot.0. ]
  %Arg_1.219.sink.in = phi ptr addrspace(1) [ %Arg_1.218151, %concatenate.pivot.192.25 ], [ %Arg_1.213149, %concatenate.pivot.128.24 ], [ %Arg_1.28147, %concatenate.pivot.64.23 ], [ %Arg_1.25, %concatenate.pivot.0. ]
  %Arg_1.219.sink = load float, ptr addrspace(1) %Arg_1.219.sink.in, align 4, !invariant.load !49
  %Arg_0.121 = load float, ptr addrspace(1) %Arg_0.120.sink, align 8, !invariant.load !49
  %multiply.722 = fmul float %Arg_1.219.sink, %Arg_0.121
  %127 = zext i32 %83 to i64
  %128 = zext i32 %82 to i64
  %129 = getelementptr inbounds [819200 x [256 x float]], ptr addrspace(1) %arg3141, i64 0, i64 %127, i64 %128
  store float %multiply.722, ptr addrspace(1) %129, align 8
  %Arg_1.230 = load float, ptr addrspace(1) %scevgep178, align 4, !invariant.load !49
  %Arg_2.332 = load float, ptr addrspace(1) %scevgep174, align 4, !invariant.load !49
  %multiply.1833 = fmul float %Arg_1.230, %Arg_2.332
  %add.23.i130 = fadd float %partial_reduction_result106.sroa.4.0131, %multiply.1833
  %130 = add i32 %lsr.iv166, %41
  %131 = add i32 %lsr.iv166, %40
  %.masked108 = and i32 %130, 192
  %132 = or i32 %.masked108, %5
  %133 = lshr i32 %131, 8
  %134 = urem i32 %133, 100
  %135 = udiv i32 %131, 25600
  %136 = icmp ult i32 %132, 128
  br i1 %136, label %concatenate.pivot.64.61, label %concatenate.pivot.192.64

concatenate.pivot.64.61:                          ; preds = %concatenate.16.merge
  %137 = icmp ult i32 %132, 64
  br i1 %137, label %concatenate.pivot.0.62, label %concatenate.pivot.64.63

concatenate.pivot.0.62:                           ; preds = %concatenate.pivot.64.61
  %138 = zext i32 %135 to i64
  %139 = zext i32 %134 to i64
  %Arg_1.237 = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg1137, i64 0, i64 0, i64 %138, i64 %139
  %140 = zext i32 %.masked108 to i64
  %141 = add i64 %140, %4
  %142 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0135, i64 0, i64 0, i64 %138, i64 0, i64 %141
  %Arg_0.139154 = getelementptr inbounds float, ptr addrspace(1) %142, i64 1
  br label %concatenate.16.merge35

concatenate.pivot.64.63:                          ; preds = %concatenate.pivot.64.61
  %143 = add nsw i32 %132, -64
  %144 = zext i32 %135 to i64
  %145 = zext i32 %134 to i64
  %146 = getelementptr [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg1137, i64 0, i64 0, i64 %144, i64 %145
  %Arg_1.243155 = getelementptr inbounds float, ptr addrspace(1) %146, i64 819200
  %147 = zext i32 %143 to i64
  %148 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0135, i64 0, i64 0, i64 %144, i64 0, i64 %147
  %Arg_0.145156 = getelementptr inbounds float, ptr addrspace(1) %148, i64 524288
  br label %concatenate.16.merge35

concatenate.pivot.192.64:                         ; preds = %concatenate.16.merge
  %149 = icmp ult i32 %132, 192
  %150 = zext i32 %135 to i64
  %151 = zext i32 %134 to i64
  br i1 %149, label %concatenate.pivot.128.65, label %concatenate.pivot.192.66

concatenate.pivot.128.65:                         ; preds = %concatenate.pivot.192.64
  %152 = add nsw i32 %132, -128
  %153 = getelementptr [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg1137, i64 0, i64 0, i64 %150, i64 %151
  %Arg_1.249157 = getelementptr inbounds float, ptr addrspace(1) %153, i64 1638400
  %154 = zext i32 %152 to i64
  %155 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0135, i64 0, i64 0, i64 %150, i64 0, i64 %154
  %Arg_0.151158 = getelementptr inbounds float, ptr addrspace(1) %155, i64 1048576
  br label %concatenate.16.merge35

concatenate.pivot.192.66:                         ; preds = %concatenate.pivot.192.64
  %156 = add nsw i32 %132, -192
  %157 = getelementptr [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg1137, i64 0, i64 0, i64 %150, i64 %151
  %Arg_1.255159 = getelementptr inbounds float, ptr addrspace(1) %157, i64 2457600
  %158 = zext i32 %156 to i64
  %159 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0135, i64 0, i64 0, i64 %150, i64 0, i64 %158
  %Arg_0.157160 = getelementptr inbounds float, ptr addrspace(1) %159, i64 1572864
  br label %concatenate.16.merge35

concatenate.16.merge35:                           ; preds = %concatenate.pivot.192.66, %concatenate.pivot.128.65, %concatenate.pivot.64.63, %concatenate.pivot.0.62
  %Arg_0.157.sink = phi ptr addrspace(1) [ %Arg_0.157160, %concatenate.pivot.192.66 ], [ %Arg_0.151158, %concatenate.pivot.128.65 ], [ %Arg_0.145156, %concatenate.pivot.64.63 ], [ %Arg_0.139154, %concatenate.pivot.0.62 ]
  %Arg_1.256.sink.in = phi ptr addrspace(1) [ %Arg_1.255159, %concatenate.pivot.192.66 ], [ %Arg_1.249157, %concatenate.pivot.128.65 ], [ %Arg_1.243155, %concatenate.pivot.64.63 ], [ %Arg_1.237, %concatenate.pivot.0.62 ]
  %Arg_1.256.sink = load float, ptr addrspace(1) %Arg_1.256.sink.in, align 4, !invariant.load !49
  %Arg_0.158 = load float, ptr addrspace(1) %Arg_0.157.sink, align 4, !invariant.load !49
  %multiply.759 = fmul float %Arg_1.256.sink, %Arg_0.158
  %160 = zext i32 %133 to i64
  %161 = zext i32 %.masked108 to i64
  %162 = add i64 %161, %4
  %163 = getelementptr [819200 x [256 x float]], ptr addrspace(1) %arg3141, i64 0, i64 %160, i64 %162
  %164 = getelementptr inbounds float, ptr addrspace(1) %163, i64 1
  store float %multiply.759, ptr addrspace(1) %164, align 4
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %lsr.iv.next171 = add nuw nsw i64 %lsr.iv170, 2048
  %lsr.iv.next165 = add nuw nsw i32 %lsr.iv164, 32
  %lsr.iv.next167 = add nuw nsw i32 %lsr.iv166, 2048
  %scevgep169 = getelementptr i8, ptr addrspace(1) %lsr.iv168, i64 8192
  %lsr.iv.next173 = add nuw nsw i64 %lsr.iv172, 32
  %scevgep177 = getelementptr i8, ptr addrspace(1) %lsr.iv176, i64 128
  %lsr.iv.next187 = add nuw nsw i64 %lsr.iv186, 2048
  %lsr.iv.next182 = add nuw nsw i32 %lsr.iv181, 32
  %scevgep185 = getelementptr i8, ptr addrspace(1) %lsr.iv184, i64 128
  %lsr.iv.next189 = add nuw nsw i64 %lsr.iv188, 32
  %scevgep193 = getelementptr i8, ptr addrspace(1) %lsr.iv192, i64 8192
  %165 = icmp ugt i32 %lsr.iv.next, 67
  br i1 %165, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.23.i124, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true99:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.23.i129, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1) local_unnamed_addr #2 {
entry:
  %arg151 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg049 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 252
  %5 = lshr i32 %linear_index_base, 8
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = and i32 %linear_index1, 253
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 254
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = and i32 %linear_index3, 255
  %9 = icmp ult i32 %4, 128
  br i1 %9, label %concatenate.pivot.64., label %concatenate.pivot.192.

concatenate.pivot.64.:                            ; preds = %entry
  %10 = icmp ult i32 %4, 64
  br i1 %10, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %11 = zext i32 %5 to i64
  %12 = zext i32 %4 to i64
  %13 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %11, i64 %12
  br label %concatenate.10.merge

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  %14 = add nsw i32 %4, -64
  %15 = zext i32 %5 to i64
  %16 = zext i32 %14 to i64
  %17 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %15, i64 %16
  %18 = getelementptr inbounds float, ptr addrspace(1) %17, i64 524288
  br label %concatenate.10.merge

concatenate.pivot.192.:                           ; preds = %entry
  %19 = icmp ult i32 %4, 192
  %20 = zext i32 %5 to i64
  br i1 %19, label %concatenate.pivot.128.2, label %concatenate.pivot.192.3

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.192.
  %21 = add nsw i32 %4, -128
  %22 = zext i32 %21 to i64
  %23 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %20, i64 %22
  %24 = getelementptr inbounds float, ptr addrspace(1) %23, i64 1048576
  br label %concatenate.10.merge

concatenate.pivot.192.3:                          ; preds = %concatenate.pivot.192.
  %25 = add nsw i32 %4, -192
  %26 = zext i32 %25 to i64
  %27 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %20, i64 %26
  %28 = getelementptr inbounds float, ptr addrspace(1) %27, i64 1572864
  br label %concatenate.10.merge

concatenate.10.merge:                             ; preds = %concatenate.pivot.192.3, %concatenate.pivot.128.2, %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %13, %concatenate.pivot.0. ], [ %18, %concatenate.pivot.64.1 ], [ %24, %concatenate.pivot.128.2 ], [ %28, %concatenate.pivot.192.3 ]
  %29 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !49
  %30 = zext i32 %linear_index_base to i64
  %31 = getelementptr float, ptr addrspace(1) %arg151, i64 %30
  store float %29, ptr addrspace(1) %31, align 16
  %32 = icmp ult i32 %6, 128
  br i1 %32, label %concatenate.pivot.64.10, label %concatenate.pivot.192.13

concatenate.pivot.64.10:                          ; preds = %concatenate.10.merge
  %33 = icmp ult i32 %6, 64
  br i1 %33, label %concatenate.pivot.0.11, label %concatenate.pivot.64.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.64.10
  %34 = zext i32 %5 to i64
  %35 = zext i32 %6 to i64
  %36 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %34, i64 %35
  br label %concatenate.10.merge4

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.64.10
  %37 = add nsw i32 %6, -64
  %38 = zext i32 %5 to i64
  %39 = zext i32 %37 to i64
  %40 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %38, i64 %39
  %41 = getelementptr inbounds float, ptr addrspace(1) %40, i64 524288
  br label %concatenate.10.merge4

concatenate.pivot.192.13:                         ; preds = %concatenate.10.merge
  %42 = icmp ult i32 %6, 192
  %43 = zext i32 %5 to i64
  br i1 %42, label %concatenate.pivot.128.14, label %concatenate.pivot.192.15

concatenate.pivot.128.14:                         ; preds = %concatenate.pivot.192.13
  %44 = add nsw i32 %6, -128
  %45 = zext i32 %44 to i64
  %46 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %43, i64 %45
  %47 = getelementptr inbounds float, ptr addrspace(1) %46, i64 1048576
  br label %concatenate.10.merge4

concatenate.pivot.192.15:                         ; preds = %concatenate.pivot.192.13
  %48 = add nsw i32 %6, -192
  %49 = zext i32 %48 to i64
  %50 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %43, i64 %49
  %51 = getelementptr inbounds float, ptr addrspace(1) %50, i64 1572864
  br label %concatenate.10.merge4

concatenate.10.merge4:                            ; preds = %concatenate.pivot.192.15, %concatenate.pivot.128.14, %concatenate.pivot.64.12, %concatenate.pivot.0.11
  %.in46 = phi ptr addrspace(1) [ %36, %concatenate.pivot.0.11 ], [ %41, %concatenate.pivot.64.12 ], [ %47, %concatenate.pivot.128.14 ], [ %51, %concatenate.pivot.192.15 ]
  %52 = load float, ptr addrspace(1) %.in46, align 4, !invariant.load !49
  %53 = getelementptr inbounds float, ptr addrspace(1) %31, i64 1
  store float %52, ptr addrspace(1) %53, align 4
  %54 = icmp ult i32 %7, 128
  br i1 %54, label %concatenate.pivot.64.22, label %concatenate.pivot.192.25

concatenate.pivot.64.22:                          ; preds = %concatenate.10.merge4
  %55 = icmp ult i32 %7, 64
  br i1 %55, label %concatenate.pivot.0.23, label %concatenate.pivot.64.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.64.22
  %56 = zext i32 %5 to i64
  %57 = zext i32 %7 to i64
  %58 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %56, i64 %57
  br label %concatenate.10.merge16

concatenate.pivot.64.24:                          ; preds = %concatenate.pivot.64.22
  %59 = add nsw i32 %7, -64
  %60 = zext i32 %5 to i64
  %61 = zext i32 %59 to i64
  %62 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %60, i64 %61
  %63 = getelementptr inbounds float, ptr addrspace(1) %62, i64 524288
  br label %concatenate.10.merge16

concatenate.pivot.192.25:                         ; preds = %concatenate.10.merge4
  %64 = icmp ult i32 %7, 192
  %65 = zext i32 %5 to i64
  br i1 %64, label %concatenate.pivot.128.26, label %concatenate.pivot.192.27

concatenate.pivot.128.26:                         ; preds = %concatenate.pivot.192.25
  %66 = add nsw i32 %7, -128
  %67 = zext i32 %66 to i64
  %68 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %65, i64 %67
  %69 = getelementptr inbounds float, ptr addrspace(1) %68, i64 1048576
  br label %concatenate.10.merge16

concatenate.pivot.192.27:                         ; preds = %concatenate.pivot.192.25
  %70 = add nsw i32 %7, -192
  %71 = zext i32 %70 to i64
  %72 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %65, i64 %71
  %73 = getelementptr inbounds float, ptr addrspace(1) %72, i64 1572864
  br label %concatenate.10.merge16

concatenate.10.merge16:                           ; preds = %concatenate.pivot.192.27, %concatenate.pivot.128.26, %concatenate.pivot.64.24, %concatenate.pivot.0.23
  %.in47 = phi ptr addrspace(1) [ %58, %concatenate.pivot.0.23 ], [ %63, %concatenate.pivot.64.24 ], [ %69, %concatenate.pivot.128.26 ], [ %73, %concatenate.pivot.192.27 ]
  %74 = load float, ptr addrspace(1) %.in47, align 4, !invariant.load !49
  %75 = getelementptr inbounds float, ptr addrspace(1) %31, i64 2
  store float %74, ptr addrspace(1) %75, align 8
  %76 = icmp ult i32 %8, 128
  br i1 %76, label %concatenate.pivot.64.34, label %concatenate.pivot.192.37

concatenate.pivot.64.34:                          ; preds = %concatenate.10.merge16
  %77 = icmp ult i32 %8, 64
  br i1 %77, label %concatenate.pivot.0.35, label %concatenate.pivot.64.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.64.34
  %78 = zext i32 %5 to i64
  %79 = zext i32 %8 to i64
  %80 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %78, i64 %79
  br label %concatenate.10.merge28

concatenate.pivot.64.36:                          ; preds = %concatenate.pivot.64.34
  %81 = add nsw i32 %8, -64
  %82 = zext i32 %5 to i64
  %83 = zext i32 %81 to i64
  %84 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %82, i64 %83
  %85 = getelementptr inbounds float, ptr addrspace(1) %84, i64 524288
  br label %concatenate.10.merge28

concatenate.pivot.192.37:                         ; preds = %concatenate.10.merge16
  %86 = icmp ult i32 %8, 192
  %87 = zext i32 %5 to i64
  br i1 %86, label %concatenate.pivot.128.38, label %concatenate.pivot.192.39

concatenate.pivot.128.38:                         ; preds = %concatenate.pivot.192.37
  %88 = add nsw i32 %8, -128
  %89 = zext i32 %88 to i64
  %90 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %87, i64 %89
  %91 = getelementptr inbounds float, ptr addrspace(1) %90, i64 1048576
  br label %concatenate.10.merge28

concatenate.pivot.192.39:                         ; preds = %concatenate.pivot.192.37
  %92 = add nsw i32 %8, -192
  %93 = zext i32 %92 to i64
  %94 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg049, i64 0, i64 0, i64 %87, i64 %93
  %95 = getelementptr inbounds float, ptr addrspace(1) %94, i64 1572864
  br label %concatenate.10.merge28

concatenate.10.merge28:                           ; preds = %concatenate.pivot.192.39, %concatenate.pivot.128.38, %concatenate.pivot.64.36, %concatenate.pivot.0.35
  %.in48 = phi ptr addrspace(1) [ %80, %concatenate.pivot.0.35 ], [ %85, %concatenate.pivot.64.36 ], [ %91, %concatenate.pivot.128.38 ], [ %95, %concatenate.pivot.192.39 ]
  %96 = load float, ptr addrspace(1) %.in48, align 4, !invariant.load !49
  %97 = getelementptr inbounds float, ptr addrspace(1) %31, i64 3
  store float %96, ptr addrspace(1) %97, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture align 128 dereferenceable(2097152) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3) local_unnamed_addr #0 {
entry:
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !63
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg010, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !49
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg316, align 16, !invariant.load !49
  %12 = getelementptr float, ptr addrspace(1) %arg112, i64 %4
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %18 = getelementptr float, ptr addrspace(1) %arg214, i64 %4
  %19 = load <4 x float>, ptr addrspace(1) %18, align 16, !invariant.load !49
  %20 = extractelement <4 x float> %19, i32 0
  %21 = extractelement <4 x float> %19, i32 1
  %22 = extractelement <4 x float> %19, i32 2
  %23 = extractelement <4 x float> %19, i32 3
  %add.6 = fadd float %14, %20
  %multiply.7 = fmul float %11, %add.6
  %subtract.8 = fsub float %7, %multiply.7
  %add.61 = fadd float %15, %21
  %multiply.72 = fmul float %11, %add.61
  %subtract.83 = fsub float %8, %multiply.72
  %add.64 = fadd float %16, %22
  %multiply.75 = fmul float %11, %add.64
  %subtract.86 = fsub float %9, %multiply.75
  %add.67 = fadd float %17, %23
  %multiply.78 = fmul float %11, %add.67
  %subtract.89 = fsub float %10, %multiply.78
  %24 = insertelement <4 x float> poison, float %subtract.8, i32 0
  %25 = insertelement <4 x float> %24, float %subtract.83, i32 1
  %26 = insertelement <4 x float> %25, float %subtract.86, i32 2
  %27 = insertelement <4 x float> %26, float %subtract.89, i32 3
  store <4 x float> %27, ptr addrspace(1) %12, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_34(ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg0, ptr noalias nocapture align 128 dereferenceable(65536) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(1056768) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(65536) %arg5) local_unnamed_addr #0 {
entry:
  %arg511 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !64
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %linear_index = or i32 %1, %2
  %3 = lshr i32 %linear_index, 8
  %4 = and i32 %2, 255
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !49
  %8 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !49
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %5
  %10 = load float, ptr addrspace(1) %9, align 4
  %multiply.7 = fmul float %8, %10
  %subtract.8 = fsub float %7, %multiply.7
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %5
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !49
  %13 = zext i32 %3 to i64
  %14 = zext i32 %4 to i64
  %15 = getelementptr inbounds [1032 x [256 x float]], ptr addrspace(1) %arg49, i64 0, i64 %13, i64 %14
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !49
  %multiply.10 = fmul float %8, %16
  %subtract.11 = fsub float %12, %multiply.10
  %17 = getelementptr inbounds float, ptr addrspace(1) %arg511, i64 %5
  store float %subtract.8, ptr addrspace(1) %17, align 4
  store float %subtract.11, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(991232) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(1056768) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(991232) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !65
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
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
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !49
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !49
  %17 = zext i32 %8 to i64
  %18 = zext i32 %4 to i64
  %19 = getelementptr [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %18, i64 %17
  %20 = getelementptr inbounds float, ptr addrspace(1) %19, i64 16384
  %21 = load <2 x float>, ptr addrspace(1) %20, align 16, !invariant.load !49
  %22 = extractelement <2 x float> %21, i32 0
  %23 = extractelement <2 x float> %21, i32 1
  %multiply.6 = fmul float %16, %22
  %subtract.7 = fsub float %12, %multiply.6
  %24 = getelementptr float, ptr addrspace(1) %arg313, i64 %9
  %25 = zext i32 %7 to i64
  %26 = getelementptr [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %18, i64 %25
  %multiply.61 = fmul float %16, %23
  %subtract.72 = fsub float %13, %multiply.61
  %27 = zext i32 %6 to i64
  %28 = getelementptr [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %18, i64 %27
  %29 = getelementptr inbounds float, ptr addrspace(1) %28, i64 16384
  %30 = load float, ptr addrspace(1) %29, align 8, !invariant.load !49
  %multiply.63 = fmul float %16, %30
  %subtract.74 = fsub float %14, %multiply.63
  %31 = zext i32 %5 to i64
  %32 = getelementptr [1032 x [256 x float]], ptr addrspace(1) %arg19, i64 0, i64 %18, i64 %31
  %33 = getelementptr inbounds float, ptr addrspace(1) %32, i64 16384
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !49
  %multiply.65 = fmul float %16, %34
  %subtract.76 = fsub float %15, %multiply.65
  %35 = insertelement <4 x float> poison, float %subtract.7, i32 0
  %36 = insertelement <4 x float> %35, float %subtract.72, i32 1
  %37 = insertelement <4 x float> %36, float %subtract.74, i32 2
  %38 = insertelement <4 x float> %37, float %subtract.76, i32 3
  store <4 x float> %38, ptr addrspace(1) %24, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_10(ptr noalias nocapture readonly align 16 dereferenceable(204800) %arg0, ptr noalias nocapture align 128 dereferenceable(204800) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !66
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !49
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !49
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.5 = fmul float %6, %8
  %subtract.6 = fsub float %5, %multiply.5
  store float %subtract.6, ptr addrspace(1) %7, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_14(ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(498073600) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(655360000) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg6, ptr noalias nocapture readonly align 128 dereferenceable(26214400) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg8, ptr noalias nocapture readonly align 128 dereferenceable(26214400) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg14) local_unnamed_addr #0 {
entry:
  %arg1462 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1360 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1258 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1156 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1054 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg952 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg850 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg748 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg646 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg544 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg442 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg340 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg238 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg136 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg034 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !67
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
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
  %12 = getelementptr float, ptr addrspace(1) %arg034, i64 %11
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !49
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %18 = load float, ptr addrspace(1) %arg136, align 16, !invariant.load !49
  %19 = mul nuw nsw i32 %4, 100
  %20 = add nuw nsw i32 %6, %19
  %21 = zext i32 %20 to i64
  %22 = zext i32 %10 to i64
  %23 = getelementptr [819200 x [152 x float]], ptr addrspace(1) %arg238, i64 0, i64 %21, i64 %22
  %24 = getelementptr inbounds float, ptr addrspace(1) %23, i64 144
  %25 = load <2 x float>, ptr addrspace(1) %24, align 16, !invariant.load !49
  %26 = extractelement <2 x float> %25, i32 0
  %27 = extractelement <2 x float> %25, i32 1
  %multiply.14 = fmul float %18, %26
  %subtract.15 = fsub float %14, %multiply.14
  %28 = getelementptr float, ptr addrspace(1) %arg340, i64 %11
  %29 = load <4 x float>, ptr addrspace(1) %28, align 16, !invariant.load !49
  %30 = extractelement <4 x float> %29, i32 0
  %31 = extractelement <4 x float> %29, i32 1
  %32 = extractelement <4 x float> %29, i32 2
  %33 = extractelement <4 x float> %29, i32 3
  %34 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg442, i64 0, i64 %21, i64 %22
  %35 = getelementptr inbounds float, ptr addrspace(1) %34, i64 128
  %36 = load <2 x float>, ptr addrspace(1) %35, align 16, !invariant.load !49
  %37 = extractelement <2 x float> %36, i32 0
  %38 = extractelement <2 x float> %36, i32 1
  %39 = getelementptr inbounds float, ptr addrspace(1) %23, i64 128
  %40 = load <2 x float>, ptr addrspace(1) %39, align 16, !invariant.load !49
  %41 = extractelement <2 x float> %40, i32 0
  %42 = extractelement <2 x float> %40, i32 1
  %add.19 = fadd float %37, %41
  %multiply.20 = fmul float %18, %add.19
  %subtract.21 = fsub float %30, %multiply.20
  %43 = getelementptr float, ptr addrspace(1) %arg544, i64 %11
  %44 = load <4 x float>, ptr addrspace(1) %43, align 16, !invariant.load !49
  %45 = extractelement <4 x float> %44, i32 0
  %46 = extractelement <4 x float> %44, i32 1
  %47 = extractelement <4 x float> %44, i32 2
  %48 = extractelement <4 x float> %44, i32 3
  %49 = getelementptr inbounds float, ptr addrspace(1) %23, i64 136
  %50 = load <2 x float>, ptr addrspace(1) %49, align 16, !invariant.load !49
  %51 = extractelement <2 x float> %50, i32 0
  %52 = extractelement <2 x float> %50, i32 1
  %multiply.23 = fmul float %18, %51
  %subtract.24 = fsub float %45, %multiply.23
  %53 = getelementptr float, ptr addrspace(1) %arg646, i64 %11
  %54 = load <4 x float>, ptr addrspace(1) %53, align 16, !invariant.load !49
  %55 = extractelement <4 x float> %54, i32 0
  %56 = extractelement <4 x float> %54, i32 1
  %57 = extractelement <4 x float> %54, i32 2
  %58 = extractelement <4 x float> %54, i32 3
  %59 = getelementptr float, ptr addrspace(1) %arg748, i64 %11
  %60 = load <4 x float>, ptr addrspace(1) %59, align 16, !invariant.load !49
  %61 = extractelement <4 x float> %60, i32 0
  %62 = extractelement <4 x float> %60, i32 1
  %63 = extractelement <4 x float> %60, i32 2
  %64 = extractelement <4 x float> %60, i32 3
  %multiply.26 = fmul float %18, %61
  %subtract.28 = fsub float %55, %multiply.26
  %65 = getelementptr float, ptr addrspace(1) %arg850, i64 %11
  %66 = load <4 x float>, ptr addrspace(1) %65, align 16, !invariant.load !49
  %67 = extractelement <4 x float> %66, i32 0
  %68 = extractelement <4 x float> %66, i32 1
  %69 = extractelement <4 x float> %66, i32 2
  %70 = extractelement <4 x float> %66, i32 3
  %71 = getelementptr float, ptr addrspace(1) %arg952, i64 %11
  %72 = load <4 x float>, ptr addrspace(1) %71, align 16, !invariant.load !49
  %73 = extractelement <4 x float> %72, i32 0
  %74 = extractelement <4 x float> %72, i32 1
  %75 = extractelement <4 x float> %72, i32 2
  %76 = extractelement <4 x float> %72, i32 3
  %multiply.29 = fmul float %18, %73
  %subtract.31 = fsub float %67, %multiply.29
  %77 = getelementptr float, ptr addrspace(1) %arg1054, i64 %11
  %78 = getelementptr float, ptr addrspace(1) %arg1156, i64 %11
  %79 = getelementptr float, ptr addrspace(1) %arg1258, i64 %11
  %80 = getelementptr float, ptr addrspace(1) %arg1360, i64 %11
  %81 = getelementptr float, ptr addrspace(1) %arg1462, i64 %11
  %82 = zext i32 %9 to i64
  %83 = getelementptr [819200 x [152 x float]], ptr addrspace(1) %arg238, i64 0, i64 %21, i64 %82
  %multiply.141 = fmul float %18, %27
  %subtract.152 = fsub float %15, %multiply.141
  %84 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg442, i64 0, i64 %21, i64 %82
  %add.193 = fadd float %38, %42
  %multiply.204 = fmul float %18, %add.193
  %subtract.215 = fsub float %31, %multiply.204
  %multiply.236 = fmul float %18, %52
  %subtract.247 = fsub float %46, %multiply.236
  %multiply.268 = fmul float %18, %62
  %subtract.289 = fsub float %56, %multiply.268
  %multiply.2910 = fmul float %18, %74
  %subtract.3111 = fsub float %68, %multiply.2910
  %85 = zext i32 %8 to i64
  %86 = getelementptr [819200 x [152 x float]], ptr addrspace(1) %arg238, i64 0, i64 %21, i64 %85
  %87 = getelementptr inbounds float, ptr addrspace(1) %86, i64 144
  %88 = load float, ptr addrspace(1) %87, align 8, !invariant.load !49
  %multiply.1412 = fmul float %18, %88
  %subtract.1513 = fsub float %16, %multiply.1412
  %89 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg442, i64 0, i64 %21, i64 %85
  %90 = getelementptr inbounds float, ptr addrspace(1) %89, i64 128
  %91 = load float, ptr addrspace(1) %90, align 8, !invariant.load !49
  %92 = getelementptr inbounds float, ptr addrspace(1) %86, i64 128
  %93 = load float, ptr addrspace(1) %92, align 8, !invariant.load !49
  %add.1914 = fadd float %91, %93
  %multiply.2015 = fmul float %18, %add.1914
  %subtract.2116 = fsub float %32, %multiply.2015
  %94 = getelementptr inbounds float, ptr addrspace(1) %86, i64 136
  %95 = load float, ptr addrspace(1) %94, align 8, !invariant.load !49
  %multiply.2317 = fmul float %18, %95
  %subtract.2418 = fsub float %47, %multiply.2317
  %multiply.2619 = fmul float %18, %63
  %subtract.2820 = fsub float %57, %multiply.2619
  %multiply.2921 = fmul float %18, %75
  %subtract.3122 = fsub float %69, %multiply.2921
  %96 = zext i32 %7 to i64
  %97 = getelementptr [819200 x [152 x float]], ptr addrspace(1) %arg238, i64 0, i64 %21, i64 %96
  %98 = getelementptr inbounds float, ptr addrspace(1) %97, i64 144
  %99 = load float, ptr addrspace(1) %98, align 4, !invariant.load !49
  %multiply.1423 = fmul float %18, %99
  %subtract.1524 = fsub float %17, %multiply.1423
  %100 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg442, i64 0, i64 %21, i64 %96
  %101 = getelementptr inbounds float, ptr addrspace(1) %100, i64 128
  %102 = load float, ptr addrspace(1) %101, align 4, !invariant.load !49
  %103 = getelementptr inbounds float, ptr addrspace(1) %97, i64 128
  %104 = load float, ptr addrspace(1) %103, align 4, !invariant.load !49
  %add.1925 = fadd float %102, %104
  %multiply.2026 = fmul float %18, %add.1925
  %subtract.2127 = fsub float %33, %multiply.2026
  %105 = getelementptr inbounds float, ptr addrspace(1) %97, i64 136
  %106 = load float, ptr addrspace(1) %105, align 4, !invariant.load !49
  %multiply.2328 = fmul float %18, %106
  %subtract.2429 = fsub float %48, %multiply.2328
  %multiply.2630 = fmul float %18, %64
  %subtract.2831 = fsub float %58, %multiply.2630
  %multiply.2932 = fmul float %18, %76
  %subtract.3133 = fsub float %70, %multiply.2932
  %107 = insertelement <4 x float> poison, float %subtract.15, i32 0
  %108 = insertelement <4 x float> %107, float %subtract.152, i32 1
  %109 = insertelement <4 x float> %108, float %subtract.1513, i32 2
  %110 = insertelement <4 x float> %109, float %subtract.1524, i32 3
  store <4 x float> %110, ptr addrspace(1) %77, align 16
  %111 = insertelement <4 x float> poison, float %subtract.21, i32 0
  %112 = insertelement <4 x float> %111, float %subtract.215, i32 1
  %113 = insertelement <4 x float> %112, float %subtract.2116, i32 2
  %114 = insertelement <4 x float> %113, float %subtract.2127, i32 3
  store <4 x float> %114, ptr addrspace(1) %78, align 16
  %115 = insertelement <4 x float> poison, float %subtract.24, i32 0
  %116 = insertelement <4 x float> %115, float %subtract.247, i32 1
  %117 = insertelement <4 x float> %116, float %subtract.2418, i32 2
  %118 = insertelement <4 x float> %117, float %subtract.2429, i32 3
  store <4 x float> %118, ptr addrspace(1) %79, align 16
  %119 = insertelement <4 x float> poison, float %subtract.28, i32 0
  %120 = insertelement <4 x float> %119, float %subtract.289, i32 1
  %121 = insertelement <4 x float> %120, float %subtract.2820, i32 2
  %122 = insertelement <4 x float> %121, float %subtract.2831, i32 3
  store <4 x float> %122, ptr addrspace(1) %80, align 16
  %123 = insertelement <4 x float> poison, float %subtract.31, i32 0
  %124 = insertelement <4 x float> %123, float %subtract.3111, i32 1
  %125 = insertelement <4 x float> %124, float %subtract.3122, i32 2
  %126 = insertelement <4 x float> %125, float %subtract.3133, i32 3
  store <4 x float> %126, ptr addrspace(1) %81, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_4(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(655360000) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(498073600) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg6) local_unnamed_addr #0 {
entry:
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
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
  %11 = zext i32 %linear_index_base to i64
  %12 = getelementptr float, ptr addrspace(1) %arg019, i64 %11
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !49
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %18 = load float, ptr addrspace(1) %arg121, align 16, !invariant.load !49
  %19 = mul nuw nsw i32 %4, 100
  %20 = add nuw nsw i32 %6, %19
  %21 = zext i32 %20 to i64
  %22 = zext i32 %10 to i64
  %23 = getelementptr inbounds [819200 x [200 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %22
  %24 = load <2 x float>, ptr addrspace(1) %23, align 16, !invariant.load !49
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %27 = getelementptr inbounds [819200 x [152 x float]], ptr addrspace(1) %arg325, i64 0, i64 %21, i64 %22
  %28 = load <2 x float>, ptr addrspace(1) %27, align 16, !invariant.load !49
  %29 = extractelement <2 x float> %28, i32 0
  %30 = extractelement <2 x float> %28, i32 1
  %add.11 = fadd float %25, %29
  %multiply.12 = fmul float %18, %add.11
  %subtract.13 = fsub float %14, %multiply.12
  %31 = getelementptr float, ptr addrspace(1) %arg427, i64 %11
  %32 = load <4 x float>, ptr addrspace(1) %31, align 16, !invariant.load !49
  %33 = extractelement <4 x float> %32, i32 0
  %34 = extractelement <4 x float> %32, i32 1
  %35 = extractelement <4 x float> %32, i32 2
  %36 = extractelement <4 x float> %32, i32 3
  %37 = getelementptr inbounds float, ptr addrspace(1) %23, i64 64
  %38 = load <2 x float>, ptr addrspace(1) %37, align 16, !invariant.load !49
  %39 = extractelement <2 x float> %38, i32 0
  %40 = extractelement <2 x float> %38, i32 1
  %41 = getelementptr inbounds float, ptr addrspace(1) %27, i64 64
  %42 = load <2 x float>, ptr addrspace(1) %41, align 16, !invariant.load !49
  %43 = extractelement <2 x float> %42, i32 0
  %44 = extractelement <2 x float> %42, i32 1
  %add.16 = fadd float %39, %43
  %multiply.17 = fmul float %18, %add.16
  %subtract.18 = fsub float %33, %multiply.17
  %45 = getelementptr float, ptr addrspace(1) %arg529, i64 %11
  %46 = getelementptr float, ptr addrspace(1) %arg631, i64 %11
  %47 = zext i32 %9 to i64
  %48 = getelementptr inbounds [819200 x [200 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %47
  %49 = getelementptr inbounds [819200 x [152 x float]], ptr addrspace(1) %arg325, i64 0, i64 %21, i64 %47
  %add.111 = fadd float %26, %30
  %multiply.122 = fmul float %18, %add.111
  %subtract.133 = fsub float %15, %multiply.122
  %add.164 = fadd float %40, %44
  %multiply.175 = fmul float %18, %add.164
  %subtract.186 = fsub float %34, %multiply.175
  %50 = zext i32 %8 to i64
  %51 = getelementptr inbounds [819200 x [200 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %50
  %52 = load float, ptr addrspace(1) %51, align 8, !invariant.load !49
  %53 = getelementptr inbounds [819200 x [152 x float]], ptr addrspace(1) %arg325, i64 0, i64 %21, i64 %50
  %54 = load float, ptr addrspace(1) %53, align 8, !invariant.load !49
  %add.117 = fadd float %52, %54
  %multiply.128 = fmul float %18, %add.117
  %subtract.139 = fsub float %16, %multiply.128
  %55 = getelementptr inbounds float, ptr addrspace(1) %51, i64 64
  %56 = load float, ptr addrspace(1) %55, align 8, !invariant.load !49
  %57 = getelementptr inbounds float, ptr addrspace(1) %53, i64 64
  %58 = load float, ptr addrspace(1) %57, align 8, !invariant.load !49
  %add.1610 = fadd float %56, %58
  %multiply.1711 = fmul float %18, %add.1610
  %subtract.1812 = fsub float %35, %multiply.1711
  %59 = zext i32 %7 to i64
  %60 = getelementptr inbounds [819200 x [200 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4, !invariant.load !49
  %62 = getelementptr inbounds [819200 x [152 x float]], ptr addrspace(1) %arg325, i64 0, i64 %21, i64 %59
  %63 = load float, ptr addrspace(1) %62, align 4, !invariant.load !49
  %add.1113 = fadd float %61, %63
  %multiply.1214 = fmul float %18, %add.1113
  %subtract.1315 = fsub float %17, %multiply.1214
  %64 = getelementptr inbounds float, ptr addrspace(1) %60, i64 64
  %65 = load float, ptr addrspace(1) %64, align 4, !invariant.load !49
  %66 = getelementptr inbounds float, ptr addrspace(1) %62, i64 64
  %67 = load float, ptr addrspace(1) %66, align 4, !invariant.load !49
  %add.1616 = fadd float %65, %67
  %multiply.1717 = fmul float %18, %add.1616
  %subtract.1818 = fsub float %36, %multiply.1717
  %68 = insertelement <4 x float> poison, float %subtract.13, i32 0
  %69 = insertelement <4 x float> %68, float %subtract.133, i32 1
  %70 = insertelement <4 x float> %69, float %subtract.139, i32 2
  %71 = insertelement <4 x float> %70, float %subtract.1315, i32 3
  store <4 x float> %71, ptr addrspace(1) %45, align 16
  %72 = insertelement <4 x float> poison, float %subtract.18, i32 0
  %73 = insertelement <4 x float> %72, float %subtract.186, i32 1
  %74 = insertelement <4 x float> %73, float %subtract.1812, i32 2
  %75 = insertelement <4 x float> %74, float %subtract.1818, i32 3
  store <4 x float> %75, ptr addrspace(1) %46, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(655360000) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
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
  %9 = urem i32 %4, 100
  %10 = udiv i32 %linear_index_base, 6400
  %11 = mul nuw nsw i32 %10, 100
  %12 = add nuw nsw i32 %9, %11
  %13 = zext i32 %12 to i64
  %14 = zext i32 %8 to i64
  %15 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %14
  %16 = getelementptr inbounds float, ptr addrspace(1) %15, i64 136
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !49
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %20 = zext i32 %linear_index_base to i64
  %21 = getelementptr float, ptr addrspace(1) %arg13, i64 %20
  %22 = zext i32 %7 to i64
  %23 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %22
  %24 = zext i32 %6 to i64
  %25 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %24
  %26 = getelementptr inbounds float, ptr addrspace(1) %25, i64 136
  %27 = load float, ptr addrspace(1) %26, align 8, !invariant.load !49
  %28 = zext i32 %5 to i64
  %29 = getelementptr [819200 x [200 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %28
  %30 = getelementptr inbounds float, ptr addrspace(1) %29, i64 136
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !49
  %32 = insertelement <4 x float> poison, float %18, i32 0
  %33 = insertelement <4 x float> %32, float %19, i32 1
  %34 = insertelement <4 x float> %33, float %27, i32 2
  %35 = insertelement <4 x float> %34, float %31, i32 3
  store <4 x float> %35, ptr addrspace(1) %21, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(209715200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(209715200) %arg3) local_unnamed_addr #0 {
entry:
  %arg313 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !49
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !49
  %12 = getelementptr float, ptr addrspace(1) %arg19, i64 %4
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !49
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %multiply.6 = fmul float %11, %14
  %subtract.8 = fsub float %7, %multiply.6
  %18 = getelementptr float, ptr addrspace(1) %arg313, i64 %4
  %multiply.61 = fmul float %11, %15
  %subtract.82 = fsub float %8, %multiply.61
  %multiply.63 = fmul float %11, %16
  %subtract.84 = fsub float %9, %multiply.63
  %multiply.65 = fmul float %11, %17
  %subtract.86 = fsub float %10, %multiply.65
  %19 = insertelement <4 x float> poison, float %subtract.8, i32 0
  %20 = insertelement <4 x float> %19, float %subtract.82, i32 1
  %21 = insertelement <4 x float> %20, float %subtract.84, i32 2
  %22 = insertelement <4 x float> %21, float %subtract.86, i32 3
  store <4 x float> %22, ptr addrspace(1) %18, align 16
  ret void
}

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #3 = { nounwind }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45}
!llvm.module.flags = !{!46}

!0 = !{ptr @fusion_39, !"kernel", i32 1}
!1 = !{ptr @fusion_39, !"reqntidx", i32 256}
!2 = !{ptr @concatenate_3, !"kernel", i32 1}
!3 = !{ptr @concatenate_3, !"reqntidx", i32 256}
!4 = !{ptr @fusion_38, !"kernel", i32 1}
!5 = !{ptr @fusion_38, !"reqntidx", i32 96}
!6 = !{ptr @fusion_36, !"kernel", i32 1}
!7 = !{ptr @fusion_36, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_32, !"kernel", i32 1}
!9 = !{ptr @fusion_32, !"reqntidx", i32 96}
!10 = !{ptr @fusion_31, !"kernel", i32 1}
!11 = !{ptr @fusion_31, !"reqntidx", i32 256}
!12 = !{ptr @fusion_37, !"kernel", i32 1}
!13 = !{ptr @fusion_37, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_26, !"kernel", i32 1}
!15 = !{ptr @fusion_26, !"reqntidx", i32 256}
!16 = !{ptr @fusion_12, !"kernel", i32 1}
!17 = !{ptr @fusion_12, !"reqntidx", i32 128}
!18 = !{ptr @reduce_114, !"kernel", i32 1}
!19 = !{ptr @reduce_114, !"reqntidx", i32 32}
!20 = !{ptr @fusion_40, !"kernel", i32 1}
!21 = !{ptr @fusion_40, !"reqntidx", i32 32}
!22 = !{ptr @fusion_29, !"kernel", i32 1}
!23 = !{ptr @fusion_29, !"reqntidx", i32 4}
!24 = !{ptr @fusion_24, !"kernel", i32 1}
!25 = !{ptr @fusion_24, !"reqntidx", i32 4}
!26 = !{ptr @fusion_11, !"kernel", i32 1}
!27 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!28 = !{ptr @fusion_8, !"kernel", i32 1}
!29 = !{ptr @fusion_8, !"reqntidx", i32 256}
!30 = !{ptr @fusion_5, !"kernel", i32 1}
!31 = !{ptr @fusion_5, !"reqntidx", i32 256}
!32 = !{ptr @fusion_34, !"kernel", i32 1}
!33 = !{ptr @fusion_34, !"reqntidx", i32 1024}
!34 = !{ptr @fusion_7, !"kernel", i32 1}
!35 = !{ptr @fusion_7, !"reqntidx", i32 256}
!36 = !{ptr @fusion_10, !"kernel", i32 1}
!37 = !{ptr @fusion_10, !"reqntidx", i32 1024}
!38 = !{ptr @fusion_14, !"kernel", i32 1}
!39 = !{ptr @fusion_14, !"reqntidx", i32 256}
!40 = !{ptr @fusion_4, !"kernel", i32 1}
!41 = !{ptr @fusion_4, !"reqntidx", i32 256}
!42 = !{ptr @fusion_1, !"kernel", i32 1}
!43 = !{ptr @fusion_1, !"reqntidx", i32 256}
!44 = !{ptr @fusion, !"kernel", i32 1}
!45 = !{ptr @fusion, !"reqntidx", i32 256}
!46 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!47 = !{i32 0, i32 2048}
!48 = !{i32 0, i32 256}
!49 = !{}
!50 = !{i32 0, i32 8256}
!51 = !{i32 0, i32 96}
!52 = !{i32 0, i32 1092267}
!53 = !{i32 0, i32 2}
!54 = !{i32 0, i32 1024}
!55 = !{i32 0, i32 10923}
!56 = !{i32 0, i32 3200}
!57 = !{i32 0, i32 38}
!58 = !{i32 0, i32 800}
!59 = !{i32 0, i32 128}
!60 = !{i32 0, i32 32}
!61 = !{i32 0, i32 4}
!62 = !{i32 0, i32 32768}
!63 = !{i32 0, i32 512}
!64 = !{i32 0, i32 16}
!65 = !{i32 0, i32 242}
!66 = !{i32 0, i32 50}
!67 = !{i32 0, i32 6400}
!68 = !{i32 0, i32 51200}
