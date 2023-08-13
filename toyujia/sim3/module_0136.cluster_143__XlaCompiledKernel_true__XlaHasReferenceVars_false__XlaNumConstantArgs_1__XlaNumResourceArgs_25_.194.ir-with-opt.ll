target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_11(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1) local_unnamed_addr #0 {
entry:
  %arg171 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg069 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 60
  %5 = lshr i32 %linear_index_base, 6
  %6 = and i32 %5, 8191
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 61
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 62
  %linear_index3 = or i32 %linear_index_base, 3
  %9 = and i32 %linear_index3, 63
  %10 = icmp ult i32 %0, 1024
  br i1 %10, label %concatenate.pivot.1., label %concatenate.pivot.3.

concatenate.pivot.1.:                             ; preds = %entry
  %11 = icmp ult i32 %0, 512
  %12 = or i32 %4, 64
  %spec.select = select i1 %11, i32 %4, i32 %12
  br label %concatenate.11.merge

concatenate.pivot.3.:                             ; preds = %entry
  %.mask = and i32 %0, 1536
  %.not = icmp eq i32 %.mask, 1536
  br i1 %.not, label %concatenate.pivot.3.3, label %concatenate.pivot.2.2

concatenate.pivot.2.2:                            ; preds = %concatenate.pivot.3.
  %13 = or i32 %4, 128
  br label %concatenate.11.merge

concatenate.pivot.3.3:                            ; preds = %concatenate.pivot.3.
  %14 = or i32 %4, 192
  br label %concatenate.11.merge

concatenate.11.merge:                             ; preds = %concatenate.pivot.1., %concatenate.pivot.3.3, %concatenate.pivot.2.2
  %.sink56 = phi i32 [ %14, %concatenate.pivot.3.3 ], [ %13, %concatenate.pivot.2.2 ], [ %spec.select, %concatenate.pivot.1. ]
  %15 = icmp ult i32 %0, 1024
  %.sink = zext i32 %6 to i64
  %16 = zext i32 %.sink56 to i64
  %17 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %.sink, i64 %16
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !24
  %19 = zext i32 %linear_index_base to i64
  %20 = getelementptr float, ptr addrspace(1) %arg171, i64 %19
  store float %18, ptr addrspace(1) %20, align 16
  br i1 %15, label %concatenate.pivot.1.10, label %concatenate.pivot.3.13

concatenate.pivot.1.10:                           ; preds = %concatenate.11.merge
  %21 = icmp ult i32 %0, 512
  %22 = or i32 %7, 64
  %spec.select66 = select i1 %21, i32 %7, i32 %22
  br label %concatenate.11.merge4

concatenate.pivot.3.13:                           ; preds = %concatenate.11.merge
  %.mask52 = and i32 %0, 1536
  %.not46 = icmp eq i32 %.mask52, 1536
  br i1 %.not46, label %concatenate.pivot.3.15, label %concatenate.pivot.2.14

concatenate.pivot.2.14:                           ; preds = %concatenate.pivot.3.13
  %23 = or i32 %7, 128
  br label %concatenate.11.merge4

concatenate.pivot.3.15:                           ; preds = %concatenate.pivot.3.13
  %24 = or i32 %7, 192
  br label %concatenate.11.merge4

concatenate.11.merge4:                            ; preds = %concatenate.pivot.1.10, %concatenate.pivot.3.15, %concatenate.pivot.2.14
  %.sink59 = phi i32 [ %24, %concatenate.pivot.3.15 ], [ %23, %concatenate.pivot.2.14 ], [ %spec.select66, %concatenate.pivot.1.10 ]
  %25 = icmp ult i32 %0, 1024
  %26 = zext i32 %.sink59 to i64
  %27 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %.sink, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !24
  %29 = getelementptr inbounds float, ptr addrspace(1) %20, i64 1
  store float %28, ptr addrspace(1) %29, align 4
  br i1 %25, label %concatenate.pivot.1.22, label %concatenate.pivot.3.25

concatenate.pivot.1.22:                           ; preds = %concatenate.11.merge4
  %30 = icmp ult i32 %0, 512
  %31 = or i32 %8, 64
  %spec.select67 = select i1 %30, i32 %8, i32 %31
  br label %concatenate.11.merge16

concatenate.pivot.3.25:                           ; preds = %concatenate.11.merge4
  %.mask53 = and i32 %0, 1536
  %.not48 = icmp eq i32 %.mask53, 1536
  br i1 %.not48, label %concatenate.pivot.3.27, label %concatenate.pivot.2.26

concatenate.pivot.2.26:                           ; preds = %concatenate.pivot.3.25
  %32 = or i32 %8, 128
  br label %concatenate.11.merge16

concatenate.pivot.3.27:                           ; preds = %concatenate.pivot.3.25
  %33 = or i32 %8, 192
  br label %concatenate.11.merge16

concatenate.11.merge16:                           ; preds = %concatenate.pivot.1.22, %concatenate.pivot.3.27, %concatenate.pivot.2.26
  %.sink62 = phi i32 [ %33, %concatenate.pivot.3.27 ], [ %32, %concatenate.pivot.2.26 ], [ %spec.select67, %concatenate.pivot.1.22 ]
  %34 = icmp ult i32 %0, 1024
  %35 = zext i32 %.sink62 to i64
  %36 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %.sink, i64 %35
  %37 = load float, ptr addrspace(1) %36, align 4, !invariant.load !24
  %38 = getelementptr inbounds float, ptr addrspace(1) %20, i64 2
  store float %37, ptr addrspace(1) %38, align 8
  br i1 %34, label %concatenate.pivot.1.34, label %concatenate.pivot.3.37

concatenate.pivot.1.34:                           ; preds = %concatenate.11.merge16
  %39 = icmp ult i32 %0, 512
  %40 = or i32 %9, 64
  %spec.select68 = select i1 %39, i32 %9, i32 %40
  br label %concatenate.11.merge28

concatenate.pivot.3.37:                           ; preds = %concatenate.11.merge16
  %.mask54 = and i32 %0, 1536
  %.not50 = icmp eq i32 %.mask54, 1536
  br i1 %.not50, label %concatenate.pivot.3.39, label %concatenate.pivot.2.38

concatenate.pivot.2.38:                           ; preds = %concatenate.pivot.3.37
  %41 = or i32 %9, 128
  br label %concatenate.11.merge28

concatenate.pivot.3.39:                           ; preds = %concatenate.pivot.3.37
  %42 = or i32 %9, 192
  br label %concatenate.11.merge28

concatenate.11.merge28:                           ; preds = %concatenate.pivot.1.34, %concatenate.pivot.3.39, %concatenate.pivot.2.38
  %.sink65 = phi i32 [ %42, %concatenate.pivot.3.39 ], [ %41, %concatenate.pivot.2.38 ], [ %spec.select68, %concatenate.pivot.1.34 ]
  %43 = zext i32 %.sink65 to i64
  %44 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %.sink, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4, !invariant.load !24
  %46 = getelementptr inbounds float, ptr addrspace(1) %20, i64 3
  store float %45, ptr addrspace(1) %46, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_10(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(655360000) %arg4) local_unnamed_addr #2 {
entry:
  %arg474 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg372 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg270 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg066 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 200
  %5 = mul i32 %4, 200
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 200
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 200
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 200
  %9 = icmp ult i32 %.decomposed, 128
  br i1 %9, label %concatenate.pivot.64., label %concatenate.pivot.136.

concatenate.pivot.64.:                            ; preds = %entry
  %10 = icmp ult i32 %.decomposed, 64
  br i1 %10, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %11 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  %12 = add nsw i32 %.decomposed, -64
  %13 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge

concatenate.pivot.136.:                           ; preds = %entry
  %14 = icmp ult i32 %.decomposed, 136
  br i1 %14, label %concatenate.pivot.128.2, label %concatenate.pivot.136.3

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  %15 = add nsw i32 %.decomposed, -128
  %16 = shl nuw nsw i32 %4, 3
  br label %concatenate.6.merge

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.136.
  %17 = add nsw i32 %.decomposed, -136
  %18 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge

concatenate.6.merge:                              ; preds = %concatenate.pivot.136.3, %concatenate.pivot.128.2, %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.sink50 = phi i32 [ %18, %concatenate.pivot.136.3 ], [ %16, %concatenate.pivot.128.2 ], [ %13, %concatenate.pivot.64.1 ], [ %.decomposed, %concatenate.pivot.0. ]
  %.sink = phi i32 [ %17, %concatenate.pivot.136.3 ], [ %15, %concatenate.pivot.128.2 ], [ %12, %concatenate.pivot.64.1 ], [ %11, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg372, %concatenate.pivot.136.3 ], [ %arg270, %concatenate.pivot.128.2 ], [ %arg168, %concatenate.pivot.64.1 ], [ %arg066, %concatenate.pivot.0. ]
  %19 = add nuw nsw i32 %.sink, %.sink50
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !24
  %23 = zext i32 %linear_index_base to i64
  %24 = getelementptr float, ptr addrspace(1) %arg474, i64 %23
  store float %22, ptr addrspace(1) %24, align 16
  %25 = icmp ult i32 %6, 128
  br i1 %25, label %concatenate.pivot.64.10, label %concatenate.pivot.136.13

concatenate.pivot.64.10:                          ; preds = %concatenate.6.merge
  %26 = icmp ult i32 %6, 64
  br i1 %26, label %concatenate.pivot.0.11, label %concatenate.pivot.64.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.64.10
  %27 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge4

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.64.10
  %28 = add nsw i32 %6, -64
  %29 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge4

concatenate.pivot.136.13:                         ; preds = %concatenate.6.merge
  %30 = icmp ult i32 %6, 136
  br i1 %30, label %concatenate.pivot.128.14, label %concatenate.pivot.136.15

concatenate.pivot.128.14:                         ; preds = %concatenate.pivot.136.13
  %31 = add nsw i32 %6, -128
  %32 = shl nuw nsw i32 %4, 3
  br label %concatenate.6.merge4

concatenate.pivot.136.15:                         ; preds = %concatenate.pivot.136.13
  %33 = add nsw i32 %6, -136
  %34 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge4

concatenate.6.merge4:                             ; preds = %concatenate.pivot.136.15, %concatenate.pivot.128.14, %concatenate.pivot.64.12, %concatenate.pivot.0.11
  %.sink55 = phi i32 [ %34, %concatenate.pivot.136.15 ], [ %32, %concatenate.pivot.128.14 ], [ %29, %concatenate.pivot.64.12 ], [ %6, %concatenate.pivot.0.11 ]
  %.sink54 = phi i32 [ %33, %concatenate.pivot.136.15 ], [ %31, %concatenate.pivot.128.14 ], [ %28, %concatenate.pivot.64.12 ], [ %27, %concatenate.pivot.0.11 ]
  %arg3.sink51 = phi ptr addrspace(1) [ %arg372, %concatenate.pivot.136.15 ], [ %arg270, %concatenate.pivot.128.14 ], [ %arg168, %concatenate.pivot.64.12 ], [ %arg066, %concatenate.pivot.0.11 ]
  %35 = add nuw nsw i32 %.sink54, %.sink55
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink51, i64 %36
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !24
  %39 = getelementptr inbounds float, ptr addrspace(1) %24, i64 1
  store float %38, ptr addrspace(1) %39, align 4
  %40 = icmp ult i32 %7, 128
  br i1 %40, label %concatenate.pivot.64.22, label %concatenate.pivot.136.25

concatenate.pivot.64.22:                          ; preds = %concatenate.6.merge4
  %41 = icmp ult i32 %7, 64
  br i1 %41, label %concatenate.pivot.0.23, label %concatenate.pivot.64.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.64.22
  %42 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge16

concatenate.pivot.64.24:                          ; preds = %concatenate.pivot.64.22
  %43 = add nsw i32 %7, -64
  %44 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge16

concatenate.pivot.136.25:                         ; preds = %concatenate.6.merge4
  %45 = icmp ult i32 %7, 136
  br i1 %45, label %concatenate.pivot.128.26, label %concatenate.pivot.136.27

concatenate.pivot.128.26:                         ; preds = %concatenate.pivot.136.25
  %46 = add nsw i32 %7, -128
  %47 = shl nuw nsw i32 %4, 3
  br label %concatenate.6.merge16

concatenate.pivot.136.27:                         ; preds = %concatenate.pivot.136.25
  %48 = add nsw i32 %7, -136
  %49 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge16

concatenate.6.merge16:                            ; preds = %concatenate.pivot.136.27, %concatenate.pivot.128.26, %concatenate.pivot.64.24, %concatenate.pivot.0.23
  %.sink60 = phi i32 [ %49, %concatenate.pivot.136.27 ], [ %47, %concatenate.pivot.128.26 ], [ %44, %concatenate.pivot.64.24 ], [ %7, %concatenate.pivot.0.23 ]
  %.sink59 = phi i32 [ %48, %concatenate.pivot.136.27 ], [ %46, %concatenate.pivot.128.26 ], [ %43, %concatenate.pivot.64.24 ], [ %42, %concatenate.pivot.0.23 ]
  %arg3.sink56 = phi ptr addrspace(1) [ %arg372, %concatenate.pivot.136.27 ], [ %arg270, %concatenate.pivot.128.26 ], [ %arg168, %concatenate.pivot.64.24 ], [ %arg066, %concatenate.pivot.0.23 ]
  %50 = add nuw nsw i32 %.sink59, %.sink60
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink56, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !24
  %54 = getelementptr inbounds float, ptr addrspace(1) %24, i64 2
  store float %53, ptr addrspace(1) %54, align 8
  %55 = icmp ult i32 %8, 128
  br i1 %55, label %concatenate.pivot.64.34, label %concatenate.pivot.136.37

concatenate.pivot.64.34:                          ; preds = %concatenate.6.merge16
  %56 = icmp ult i32 %8, 64
  br i1 %56, label %concatenate.pivot.0.35, label %concatenate.pivot.64.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.64.34
  %57 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge28

concatenate.pivot.64.36:                          ; preds = %concatenate.pivot.64.34
  %58 = add nsw i32 %8, -64
  %59 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge28

concatenate.pivot.136.37:                         ; preds = %concatenate.6.merge16
  %60 = icmp ult i32 %8, 136
  br i1 %60, label %concatenate.pivot.128.38, label %concatenate.pivot.136.39

concatenate.pivot.128.38:                         ; preds = %concatenate.pivot.136.37
  %61 = add nsw i32 %8, -128
  %62 = shl nuw nsw i32 %4, 3
  br label %concatenate.6.merge28

concatenate.pivot.136.39:                         ; preds = %concatenate.pivot.136.37
  %63 = add nsw i32 %8, -136
  %64 = shl nuw nsw i32 %4, 6
  br label %concatenate.6.merge28

concatenate.6.merge28:                            ; preds = %concatenate.pivot.136.39, %concatenate.pivot.128.38, %concatenate.pivot.64.36, %concatenate.pivot.0.35
  %.sink65 = phi i32 [ %64, %concatenate.pivot.136.39 ], [ %62, %concatenate.pivot.128.38 ], [ %59, %concatenate.pivot.64.36 ], [ %8, %concatenate.pivot.0.35 ]
  %.sink64 = phi i32 [ %63, %concatenate.pivot.136.39 ], [ %61, %concatenate.pivot.128.38 ], [ %58, %concatenate.pivot.64.36 ], [ %57, %concatenate.pivot.0.35 ]
  %arg3.sink61 = phi ptr addrspace(1) [ %arg372, %concatenate.pivot.136.39 ], [ %arg270, %concatenate.pivot.128.38 ], [ %arg168, %concatenate.pivot.64.36 ], [ %arg066, %concatenate.pivot.0.35 ]
  %65 = add nuw nsw i32 %.sink64, %.sink65
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink61, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !24
  %69 = getelementptr inbounds float, ptr addrspace(1) %24, i64 3
  store float %68, ptr addrspace(1) %69, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(838860800) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg3) local_unnamed_addr #3 {
entry:
  %arg391 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg289 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg187 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg085 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !26
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !27
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 3276800
  br i1 %6, label %tile_loop.loop_header15.preheader, label %common.ret

tile_loop.loop_header15.preheader:                ; preds = %entry
  %7 = shl nuw nsw i32 %5, 6
  %8 = or i32 %2, %7
  %9 = udiv i32 %5, 100
  %10 = and i32 %9, 8191
  %11 = udiv i32 %5, 819200
  %12 = zext i32 %11 to i64
  %13 = zext i32 %10 to i64
  %14 = zext i32 %2 to i64
  %Arg_0.121 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg085, i64 0, i64 %12, i64 %13, i64 0, i64 %14
  %Arg_0.122 = load float, ptr addrspace(1) %Arg_0.121, align 4, !invariant.load !24
  %15 = icmp ult i32 %8, 104857600
  br i1 %15, label %concatenate.pivot.1.37, label %concatenate.pivot.3.40

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %concatenate.14.merge23.1
  %16 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %16, label %reduction_write_output-true, label %common.ret

concatenate.pivot.3.40.1:                         ; preds = %concatenate.14.merge23
  %17 = icmp ult i32 %51, 157286400
  br i1 %17, label %concatenate.pivot.2.41.1, label %concatenate.pivot.3.42.1

concatenate.pivot.3.42.1:                         ; preds = %concatenate.pivot.3.40.1
  %18 = or i32 %0, 224
  %19 = zext i32 %18 to i64
  br label %concatenate.14.merge23.1

concatenate.pivot.2.41.1:                         ; preds = %concatenate.pivot.3.40.1
  %20 = or i32 %2, 160
  %21 = zext i32 %20 to i64
  br label %concatenate.14.merge23.1

concatenate.pivot.1.37.1:                         ; preds = %concatenate.14.merge23
  %22 = icmp ult i32 %51, 52428800
  %23 = or i32 %0, 96
  %24 = zext i32 %23 to i64
  br i1 %22, label %concatenate.14.merge23.1, label %concatenate.pivot.1.39.1

concatenate.pivot.1.39.1:                         ; preds = %concatenate.pivot.1.37.1
  br label %concatenate.14.merge23.1

concatenate.14.merge23.1:                         ; preds = %concatenate.pivot.1.37.1, %concatenate.pivot.1.39.1, %concatenate.pivot.2.41.1, %concatenate.pivot.3.42.1
  %.sink81 = phi i64 [ %24, %concatenate.pivot.1.39.1 ], [ %21, %concatenate.pivot.2.41.1 ], [ %19, %concatenate.pivot.3.42.1 ], [ %52, %concatenate.pivot.1.37.1 ]
  %.sink.in = urem i32 %5, 819200
  %.sink = zext i32 %.sink.in to i64
  %Arg_1.225.1 = getelementptr inbounds [819200 x [256 x float]], ptr addrspace(1) %arg187, i64 0, i64 %.sink, i64 %.sink81
  %25 = load float, ptr addrspace(1) %Arg_1.225.1, align 4, !invariant.load !24
  %multiply.1543.1 = fmul float %Arg_0.122.1, %25
  %add.20.i71.1 = fadd float %add.20.i71, %multiply.1543.1
  %26 = zext i32 %7 to i64
  %27 = add i64 %14, %26
  %28 = getelementptr float, ptr addrspace(1) %arg391, i64 %27
  %29 = getelementptr inbounds float, ptr addrspace(1) %28, i64 32
  store float %25, ptr addrspace(1) %29, align 4
  %30 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i71.1, i32 16, i32 31)
  %add.20.i = fadd float %add.20.i71.1, %30
  %31 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i, i32 8, i32 31)
  %add.20.i67 = fadd float %add.20.i, %31
  %32 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i67, i32 4, i32 31)
  %add.20.i68 = fadd float %add.20.i67, %32
  %33 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i68, i32 2, i32 31)
  %add.20.i69 = fadd float %add.20.i68, %33
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i69, i32 1, i32 31)
  %35 = icmp eq i32 %2, 0
  %36 = zext i32 %3 to i64
  %37 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %36, i64 0, i64 0
  %add.20.i70 = fadd float %add.20.i69, %34
  br i1 %35, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

concatenate.pivot.1.37:                           ; preds = %tile_loop.loop_header15.preheader
  %38 = icmp ult i32 %8, 52428800
  %39 = or i32 %2, 64
  %40 = zext i32 %39 to i64
  br i1 %38, label %concatenate.14.merge23, label %concatenate.pivot.1.39

concatenate.pivot.1.39:                           ; preds = %concatenate.pivot.1.37
  br label %concatenate.14.merge23

concatenate.pivot.3.40:                           ; preds = %tile_loop.loop_header15.preheader
  %41 = icmp ult i32 %8, 157286400
  br i1 %41, label %concatenate.pivot.2.41, label %concatenate.pivot.3.42

concatenate.pivot.2.41:                           ; preds = %concatenate.pivot.3.40
  %42 = or i32 %2, 128
  %43 = zext i32 %42 to i64
  br label %concatenate.14.merge23

concatenate.pivot.3.42:                           ; preds = %concatenate.pivot.3.40
  %44 = or i32 %2, 192
  %45 = zext i32 %44 to i64
  br label %concatenate.14.merge23

concatenate.14.merge23:                           ; preds = %concatenate.pivot.1.37, %concatenate.pivot.3.42, %concatenate.pivot.2.41, %concatenate.pivot.1.39
  %.sink83 = phi i64 [ %45, %concatenate.pivot.3.42 ], [ %43, %concatenate.pivot.2.41 ], [ %40, %concatenate.pivot.1.39 ], [ %14, %concatenate.pivot.1.37 ]
  %.frozen = freeze i32 %5
  %46 = udiv i32 %.frozen, 819200
  %47 = mul i32 %46, 819200
  %.sink82.in.decomposed = sub i32 %.frozen, %47
  %.sink82 = zext i32 %.sink82.in.decomposed to i64
  %Arg_1.234 = getelementptr inbounds [819200 x [256 x float]], ptr addrspace(1) %arg187, i64 0, i64 %.sink82, i64 %.sink83
  %48 = load float, ptr addrspace(1) %Arg_1.234, align 4, !invariant.load !24
  %multiply.1543 = fmul float %Arg_0.122, %48
  %add.20.i71 = fadd float %multiply.1543, 0.000000e+00
  %49 = zext i32 %8 to i64
  %50 = getelementptr inbounds float, ptr addrspace(1) %arg391, i64 %49
  store float %48, ptr addrspace(1) %50, align 4
  %x_loc20.1 = or i32 %2, 32
  %51 = or i32 %x_loc20.1, %7
  %52 = zext i32 %x_loc20.1 to i64
  %Arg_0.121.195 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.121, i64 32
  %Arg_0.122.1 = load float, ptr addrspace(1) %Arg_0.121.195, align 4, !invariant.load !24
  %53 = icmp ult i32 %51, 104857600
  br i1 %53, label %concatenate.pivot.1.37.1, label %concatenate.pivot.3.40.1

intra_warp_reduce_write-true:                     ; preds = %concatenate.14.merge23.1
  store float %add.20.i70, ptr addrspace(3) %37, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %54 = udiv i32 %.frozen, 100
  %55 = mul i32 %54, 100
  %.decomposed = sub i32 %.frozen, %55
  %56 = and i32 %54, 8191
  %57 = zext i32 %46 to i64
  %58 = zext i32 %56 to i64
  %59 = zext i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x [100 x float]]], ptr addrspace(1) %arg289, i64 0, i64 %57, i64 %58, i64 %59
  %output.then.val = load float, ptr addrspace(3) %37, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #4

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #5

; Function Attrs: nounwind
define void @fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg11) local_unnamed_addr #3 {
entry:
  %arg11106 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10104 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9102 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8100 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg798 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg696 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg594 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg492 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg390 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg288 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg186 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg084 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !26
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header14.preheader, label %common.ret

tile_loop.loop_header14.preheader:                ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %Arg_2.343 = load float, ptr addrspace(1) %arg288, align 16
  %8 = add nuw nsw i32 %2, %7
  %.frozen = freeze i32 %8
  %9 = udiv i32 %.frozen, 819200
  %10 = mul i32 %9, 819200
  %urem.decomposed = sub i32 %.frozen, %10
  %11 = udiv i32 %urem.decomposed, 100
  %12 = mul i32 %11, 100
  %.decomposed = sub i32 %urem.decomposed, %12
  %13 = zext i32 %11 to i64
  %14 = zext i32 %.decomposed to i64
  %Arg_10.1120 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg10104, i64 0, i64 %13, i64 %14, i64 0
  %Arg_10.1121 = load float, ptr addrspace(1) %Arg_10.1120, align 4, !invariant.load !24
  %15 = zext i32 %9 to i64
  %Arg_9.1022 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg9102, i64 0, i64 0, i64 %15
  %Arg_9.1023 = load float, ptr addrspace(1) %Arg_9.1022, align 4, !invariant.load !24
  %multiply.1624 = fmul float %Arg_10.1121, %Arg_9.1023
  %Arg_8.925 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg8100, i64 0, i64 %13, i64 %14, i64 0
  %Arg_8.926 = load float, ptr addrspace(1) %Arg_8.925, align 4, !invariant.load !24
  %Arg_7.827 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg798, i64 0, i64 0, i64 %15
  %Arg_7.828 = load float, ptr addrspace(1) %Arg_7.827, align 4, !invariant.load !24
  %multiply.2129 = fmul float %Arg_8.926, %Arg_7.828
  %add.2230 = fadd float %multiply.1624, %multiply.2129
  %Arg_6.731 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg696, i64 0, i64 %13, i64 %14, i64 0
  %Arg_6.732 = load float, ptr addrspace(1) %Arg_6.731, align 4, !invariant.load !24
  %Arg_5.633 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg594, i64 0, i64 0, i64 %15
  %Arg_5.634 = load float, ptr addrspace(1) %Arg_5.633, align 4, !invariant.load !24
  %multiply.2735 = fmul float %Arg_6.732, %Arg_5.634
  %add.2836 = fadd float %add.2230, %multiply.2735
  %Arg_4.537 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg492, i64 0, i64 %13, i64 %14, i64 0
  %Arg_4.538 = load float, ptr addrspace(1) %Arg_4.537, align 4, !invariant.load !24
  %Arg_3.439 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg390, i64 0, i64 0, i64 %15
  %Arg_3.440 = load float, ptr addrspace(1) %Arg_3.439, align 4, !invariant.load !24
  %multiply.3341 = fmul float %Arg_4.538, %Arg_3.440
  %add.3442 = fadd float %add.2836, %multiply.3341
  %16 = zext i32 %8 to i64
  %Arg_1.244 = getelementptr inbounds float, ptr addrspace(1) %arg186, i64 %16
  %Arg_1.245 = load float, ptr addrspace(1) %Arg_1.244, align 4, !invariant.load !24
  %multiply.3746 = fmul float %Arg_2.343, %Arg_1.245
  %add.3847 = fadd float %add.3442, %multiply.3746
  %Arg_0.148 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg084, i64 0, i64 %15
  %Arg_0.149 = load float, ptr addrspace(1) %Arg_0.148, align 4, !invariant.load !24
  %add.4150 = fadd float %Arg_0.149, %add.3847
  %17 = fcmp ole float %add.4150, 0xFFF0000000000000
  %maximum.47.i75 = select i1 %17, float 0xFFF0000000000000, float %add.4150
  %x_loc19.1 = or i32 %2, 32
  %18 = add nuw nsw i32 %x_loc19.1, %7
  %.frozen78 = freeze i32 %18
  %19 = udiv i32 %.frozen78, 819200
  %20 = mul i32 %19, 819200
  %urem.1.decomposed = sub i32 %.frozen78, %20
  %21 = udiv i32 %urem.1.decomposed, 100
  %22 = mul i32 %21, 100
  %.decomposed79 = sub i32 %urem.1.decomposed, %22
  %23 = zext i32 %21 to i64
  %24 = zext i32 %.decomposed79 to i64
  %Arg_10.1120.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg10104, i64 0, i64 %23, i64 %24, i64 0
  %Arg_10.1121.1 = load float, ptr addrspace(1) %Arg_10.1120.1, align 4, !invariant.load !24
  %25 = zext i32 %19 to i64
  %Arg_9.1022.1 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg9102, i64 0, i64 0, i64 %25
  %Arg_9.1023.1 = load float, ptr addrspace(1) %Arg_9.1022.1, align 4, !invariant.load !24
  %multiply.1624.1 = fmul float %Arg_10.1121.1, %Arg_9.1023.1
  %Arg_8.925.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg8100, i64 0, i64 %23, i64 %24, i64 0
  %Arg_8.926.1 = load float, ptr addrspace(1) %Arg_8.925.1, align 4, !invariant.load !24
  %Arg_7.827.1 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg798, i64 0, i64 0, i64 %25
  %Arg_7.828.1 = load float, ptr addrspace(1) %Arg_7.827.1, align 4, !invariant.load !24
  %multiply.2129.1 = fmul float %Arg_8.926.1, %Arg_7.828.1
  %add.2230.1 = fadd float %multiply.1624.1, %multiply.2129.1
  %Arg_6.731.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg696, i64 0, i64 %23, i64 %24, i64 0
  %Arg_6.732.1 = load float, ptr addrspace(1) %Arg_6.731.1, align 4, !invariant.load !24
  %Arg_5.633.1 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg594, i64 0, i64 0, i64 %25
  %Arg_5.634.1 = load float, ptr addrspace(1) %Arg_5.633.1, align 4, !invariant.load !24
  %multiply.2735.1 = fmul float %Arg_6.732.1, %Arg_5.634.1
  %add.2836.1 = fadd float %add.2230.1, %multiply.2735.1
  %Arg_4.537.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg492, i64 0, i64 %23, i64 %24, i64 0
  %Arg_4.538.1 = load float, ptr addrspace(1) %Arg_4.537.1, align 4, !invariant.load !24
  %Arg_3.439.1 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg390, i64 0, i64 0, i64 %25
  %Arg_3.440.1 = load float, ptr addrspace(1) %Arg_3.439.1, align 4, !invariant.load !24
  %multiply.3341.1 = fmul float %Arg_4.538.1, %Arg_3.440.1
  %add.3442.1 = fadd float %add.2836.1, %multiply.3341.1
  %26 = zext i32 %7 to i64
  %27 = zext i32 %2 to i64
  %28 = add i64 %27, %26
  %29 = getelementptr float, ptr addrspace(1) %arg186, i64 %28
  %Arg_1.244.1109 = getelementptr inbounds float, ptr addrspace(1) %29, i64 32
  %Arg_1.245.1 = load float, ptr addrspace(1) %Arg_1.244.1109, align 4, !invariant.load !24
  %multiply.3746.1 = fmul float %Arg_2.343, %Arg_1.245.1
  %add.3847.1 = fadd float %add.3442.1, %multiply.3746.1
  %Arg_0.148.1 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg084, i64 0, i64 %25
  %Arg_0.149.1 = load float, ptr addrspace(1) %Arg_0.148.1, align 4, !invariant.load !24
  %add.4150.1 = fadd float %Arg_0.149.1, %add.3847.1
  %30 = fcmp oge float %maximum.47.i75, %add.4150.1
  %31 = fcmp uno float %maximum.47.i75, 0.000000e+00
  %32 = or i1 %31, %30
  %maximum.47.i75.1 = select i1 %32, float %maximum.47.i75, float %add.4150.1
  %x_loc19.2 = or i32 %2, 64
  %33 = add nuw nsw i32 %x_loc19.2, %7
  %.frozen80 = freeze i32 %33
  %34 = udiv i32 %.frozen80, 819200
  %35 = mul i32 %34, 819200
  %urem.2.decomposed = sub i32 %.frozen80, %35
  %36 = udiv i32 %urem.2.decomposed, 100
  %37 = mul i32 %36, 100
  %.decomposed81 = sub i32 %urem.2.decomposed, %37
  %38 = zext i32 %36 to i64
  %39 = zext i32 %.decomposed81 to i64
  %Arg_10.1120.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg10104, i64 0, i64 %38, i64 %39, i64 0
  %Arg_10.1121.2 = load float, ptr addrspace(1) %Arg_10.1120.2, align 4, !invariant.load !24
  %40 = zext i32 %34 to i64
  %Arg_9.1022.2 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg9102, i64 0, i64 0, i64 %40
  %Arg_9.1023.2 = load float, ptr addrspace(1) %Arg_9.1022.2, align 4, !invariant.load !24
  %multiply.1624.2 = fmul float %Arg_10.1121.2, %Arg_9.1023.2
  %Arg_8.925.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg8100, i64 0, i64 %38, i64 %39, i64 0
  %Arg_8.926.2 = load float, ptr addrspace(1) %Arg_8.925.2, align 4, !invariant.load !24
  %Arg_7.827.2 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg798, i64 0, i64 0, i64 %40
  %Arg_7.828.2 = load float, ptr addrspace(1) %Arg_7.827.2, align 4, !invariant.load !24
  %multiply.2129.2 = fmul float %Arg_8.926.2, %Arg_7.828.2
  %add.2230.2 = fadd float %multiply.1624.2, %multiply.2129.2
  %Arg_6.731.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg696, i64 0, i64 %38, i64 %39, i64 0
  %Arg_6.732.2 = load float, ptr addrspace(1) %Arg_6.731.2, align 4, !invariant.load !24
  %Arg_5.633.2 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg594, i64 0, i64 0, i64 %40
  %Arg_5.634.2 = load float, ptr addrspace(1) %Arg_5.633.2, align 4, !invariant.load !24
  %multiply.2735.2 = fmul float %Arg_6.732.2, %Arg_5.634.2
  %add.2836.2 = fadd float %add.2230.2, %multiply.2735.2
  %Arg_4.537.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg492, i64 0, i64 %38, i64 %39, i64 0
  %Arg_4.538.2 = load float, ptr addrspace(1) %Arg_4.537.2, align 4, !invariant.load !24
  %Arg_3.439.2 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg390, i64 0, i64 0, i64 %40
  %Arg_3.440.2 = load float, ptr addrspace(1) %Arg_3.439.2, align 4, !invariant.load !24
  %multiply.3341.2 = fmul float %Arg_4.538.2, %Arg_3.440.2
  %add.3442.2 = fadd float %add.2836.2, %multiply.3341.2
  %Arg_1.244.2111 = getelementptr inbounds float, ptr addrspace(1) %29, i64 64
  %Arg_1.245.2 = load float, ptr addrspace(1) %Arg_1.244.2111, align 4, !invariant.load !24
  %multiply.3746.2 = fmul float %Arg_2.343, %Arg_1.245.2
  %add.3847.2 = fadd float %add.3442.2, %multiply.3746.2
  %Arg_0.148.2 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg084, i64 0, i64 %40
  %Arg_0.149.2 = load float, ptr addrspace(1) %Arg_0.148.2, align 4, !invariant.load !24
  %add.4150.2 = fadd float %Arg_0.149.2, %add.3847.2
  %41 = fcmp oge float %maximum.47.i75.1, %add.4150.2
  %42 = fcmp uno float %maximum.47.i75.1, 0.000000e+00
  %43 = or i1 %42, %41
  %maximum.47.i75.2 = select i1 %43, float %maximum.47.i75.1, float %add.4150.2
  %x_loc19.3 = or i32 %0, 96
  %44 = icmp ult i32 %x_loc19.3, 100
  br i1 %44, label %x_in_tile-true.3, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %45 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %46 = lshr i32 %5, 13
  %47 = zext i32 %46 to i64
  %48 = and i32 %5, 8191
  %49 = zext i32 %48 to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr addrspace(1) %arg11106, i64 0, i64 %47, i64 %49
  br i1 %45, label %reduction_write_output-true, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header14.preheader
  %50 = add nuw nsw i32 %x_loc19.3, %7
  %.frozen82 = freeze i32 %50
  %51 = udiv i32 %.frozen82, 819200
  %52 = mul i32 %51, 819200
  %urem.3.decomposed = sub i32 %.frozen82, %52
  %53 = udiv i32 %urem.3.decomposed, 100
  %54 = mul i32 %53, 100
  %.decomposed83 = sub i32 %urem.3.decomposed, %54
  %55 = zext i32 %53 to i64
  %56 = zext i32 %.decomposed83 to i64
  %Arg_10.1120.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg10104, i64 0, i64 %55, i64 %56, i64 0
  %Arg_10.1121.3 = load float, ptr addrspace(1) %Arg_10.1120.3, align 4, !invariant.load !24
  %57 = zext i32 %51 to i64
  %Arg_9.1022.3 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg9102, i64 0, i64 0, i64 %57
  %Arg_9.1023.3 = load float, ptr addrspace(1) %Arg_9.1022.3, align 4, !invariant.load !24
  %multiply.1624.3 = fmul float %Arg_10.1121.3, %Arg_9.1023.3
  %Arg_8.925.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg8100, i64 0, i64 %55, i64 %56, i64 0
  %Arg_8.926.3 = load float, ptr addrspace(1) %Arg_8.925.3, align 4, !invariant.load !24
  %Arg_7.827.3 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg798, i64 0, i64 0, i64 %57
  %Arg_7.828.3 = load float, ptr addrspace(1) %Arg_7.827.3, align 4, !invariant.load !24
  %multiply.2129.3 = fmul float %Arg_8.926.3, %Arg_7.828.3
  %add.2230.3 = fadd float %multiply.1624.3, %multiply.2129.3
  %Arg_6.731.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg696, i64 0, i64 %55, i64 %56, i64 0
  %Arg_6.732.3 = load float, ptr addrspace(1) %Arg_6.731.3, align 4, !invariant.load !24
  %Arg_5.633.3 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg594, i64 0, i64 0, i64 %57
  %Arg_5.634.3 = load float, ptr addrspace(1) %Arg_5.633.3, align 4, !invariant.load !24
  %multiply.2735.3 = fmul float %Arg_6.732.3, %Arg_5.634.3
  %add.2836.3 = fadd float %add.2230.3, %multiply.2735.3
  %Arg_4.537.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg492, i64 0, i64 %55, i64 %56, i64 0
  %Arg_4.538.3 = load float, ptr addrspace(1) %Arg_4.537.3, align 4, !invariant.load !24
  %Arg_3.439.3 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg390, i64 0, i64 0, i64 %57
  %Arg_3.440.3 = load float, ptr addrspace(1) %Arg_3.439.3, align 4, !invariant.load !24
  %multiply.3341.3 = fmul float %Arg_4.538.3, %Arg_3.440.3
  %add.3442.3 = fadd float %add.2836.3, %multiply.3341.3
  %58 = zext i32 %50 to i64
  %Arg_1.244.3 = getelementptr inbounds float, ptr addrspace(1) %arg186, i64 %58
  %Arg_1.245.3 = load float, ptr addrspace(1) %Arg_1.244.3, align 4, !invariant.load !24
  %multiply.3746.3 = fmul float %Arg_2.343, %Arg_1.245.3
  %add.3847.3 = fadd float %add.3442.3, %multiply.3746.3
  %Arg_0.148.3 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg084, i64 0, i64 %57
  %Arg_0.149.3 = load float, ptr addrspace(1) %Arg_0.148.3, align 4, !invariant.load !24
  %add.4150.3 = fadd float %Arg_0.149.3, %add.3847.3
  %59 = fcmp oge float %maximum.47.i75.2, %add.4150.3
  %60 = fcmp uno float %maximum.47.i75.2, 0.000000e+00
  %61 = or i1 %60, %59
  %maximum.47.i75.3 = select i1 %61, float %maximum.47.i75.2, float %add.4150.3
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header14.preheader
  %partial_reduction_result.1.3 = phi float [ %maximum.47.i75.3, %x_in_tile-true.3 ], [ %maximum.47.i75.2, %tile_loop.loop_header14.preheader ]
  %62 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %63 = fcmp oge float %partial_reduction_result.1.3, %62
  %64 = fcmp uno float %partial_reduction_result.1.3, 0.000000e+00
  %65 = or i1 %64, %63
  %maximum.47.i = select i1 %65, float %partial_reduction_result.1.3, float %62
  %66 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.47.i, i32 8, i32 31)
  %67 = fcmp oge float %maximum.47.i, %66
  %68 = fcmp uno float %maximum.47.i, 0.000000e+00
  %69 = or i1 %68, %67
  %maximum.47.i71 = select i1 %69, float %maximum.47.i, float %66
  %70 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.47.i71, i32 4, i32 31)
  %71 = fcmp oge float %maximum.47.i71, %70
  %72 = fcmp uno float %maximum.47.i71, 0.000000e+00
  %73 = or i1 %72, %71
  %maximum.47.i72 = select i1 %73, float %maximum.47.i71, float %70
  %74 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.47.i72, i32 2, i32 31)
  %75 = fcmp oge float %maximum.47.i72, %74
  %76 = fcmp uno float %maximum.47.i72, 0.000000e+00
  %77 = or i1 %76, %75
  %maximum.47.i73 = select i1 %77, float %maximum.47.i72, float %74
  %78 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.47.i73, i32 1, i32 31)
  %79 = icmp eq i32 %2, 0
  %80 = zext i32 %3 to i64
  %81 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %80, i64 0, i64 0
  %82 = fcmp uno float %maximum.47.i73, 0.000000e+00
  %83 = fcmp oge float %maximum.47.i73, %78
  %84 = or i1 %82, %83
  %maximum.47.i74 = select i1 %84, float %maximum.47.i73, float %78
  br i1 %79, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %maximum.47.i74, ptr addrspace(3) %81, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %81, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg12) local_unnamed_addr #3 {
entry:
  %arg12112 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg11110 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg10108 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg9106 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg8104 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7102 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6100 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg598 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg496 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg394 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg292 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg190 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg088 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !26
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header15.preheader, label %common.ret

tile_loop.loop_header15.preheader:                ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %Arg_3.444 = load float, ptr addrspace(1) %arg394, align 16
  %8 = add nuw nsw i32 %2, %7
  %9 = udiv i32 %8, 100
  %.frozen = freeze i32 %8
  %10 = udiv i32 %.frozen, 819200
  %11 = mul i32 %10, 819200
  %urem.decomposed = sub i32 %.frozen, %11
  %12 = udiv i32 %urem.decomposed, 100
  %13 = mul i32 %12, 100
  %.decomposed = sub i32 %urem.decomposed, %13
  %14 = zext i32 %12 to i64
  %15 = zext i32 %.decomposed to i64
  %Arg_11.1221 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg11110, i64 0, i64 %14, i64 %15, i64 0
  %Arg_11.1222 = load float, ptr addrspace(1) %Arg_11.1221, align 4, !invariant.load !24
  %16 = zext i32 %10 to i64
  %Arg_10.1123 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg10108, i64 0, i64 0, i64 %16
  %Arg_10.1124 = load float, ptr addrspace(1) %Arg_10.1123, align 4, !invariant.load !24
  %multiply.1725 = fmul float %Arg_11.1222, %Arg_10.1124
  %Arg_9.1026 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg9106, i64 0, i64 %14, i64 %15, i64 0
  %Arg_9.1027 = load float, ptr addrspace(1) %Arg_9.1026, align 4, !invariant.load !24
  %Arg_8.928 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg8104, i64 0, i64 0, i64 %16
  %Arg_8.929 = load float, ptr addrspace(1) %Arg_8.928, align 4, !invariant.load !24
  %multiply.2230 = fmul float %Arg_9.1027, %Arg_8.929
  %add.2331 = fadd float %multiply.1725, %multiply.2230
  %Arg_7.832 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg7102, i64 0, i64 %14, i64 %15, i64 0
  %Arg_7.833 = load float, ptr addrspace(1) %Arg_7.832, align 4, !invariant.load !24
  %Arg_6.734 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg6100, i64 0, i64 0, i64 %16
  %Arg_6.735 = load float, ptr addrspace(1) %Arg_6.734, align 4, !invariant.load !24
  %multiply.2836 = fmul float %Arg_7.833, %Arg_6.735
  %add.2937 = fadd float %add.2331, %multiply.2836
  %Arg_5.638 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg598, i64 0, i64 %14, i64 %15, i64 0
  %Arg_5.639 = load float, ptr addrspace(1) %Arg_5.638, align 4, !invariant.load !24
  %Arg_4.540 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg496, i64 0, i64 0, i64 %16
  %Arg_4.541 = load float, ptr addrspace(1) %Arg_4.540, align 4, !invariant.load !24
  %multiply.3442 = fmul float %Arg_5.639, %Arg_4.541
  %add.3543 = fadd float %add.2937, %multiply.3442
  %17 = zext i32 %8 to i64
  %Arg_2.345 = getelementptr inbounds float, ptr addrspace(1) %arg292, i64 %17
  %Arg_2.346 = load float, ptr addrspace(1) %Arg_2.345, align 4, !invariant.load !24
  %multiply.3847 = fmul float %Arg_3.444, %Arg_2.346
  %add.3948 = fadd float %add.3543, %multiply.3847
  %Arg_1.249 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg190, i64 0, i64 %16
  %Arg_1.250 = load float, ptr addrspace(1) %Arg_1.249, align 4, !invariant.load !24
  %add.4251 = fadd float %Arg_1.250, %add.3948
  %18 = zext i32 %9 to i64
  %Arg_0.152 = getelementptr inbounds float, ptr addrspace(1) %arg088, i64 %18
  %Arg_0.153 = load float, ptr addrspace(1) %Arg_0.152, align 4, !invariant.load !24
  %subtract.4454 = fsub float %add.4251, %Arg_0.153
  %19 = tail call float @llvm.fma.f32(float %subtract.4454, float 0x3F777313A0000000, float 5.000000e-01)
  %20 = tail call float @llvm.nvvm.saturate.f(float %19) #3
  %21 = tail call float @llvm.nvvm.fma.rm.f(float %20, float 2.520000e+02, float 0x4168000020000000) #3
  %22 = fadd float %21, 0xC168000FE0000000
  %23 = fneg float %22
  %24 = tail call float @llvm.fma.f32(float %subtract.4454, float 0x3FF7154760000000, float %23)
  %25 = tail call float @llvm.fma.f32(float %subtract.4454, float 0x3E54AE0C00000000, float %24)
  %26 = bitcast float %21 to i32
  %27 = shl i32 %26, 23
  %28 = bitcast i32 %27 to float
  %29 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %25) #3
  %30 = fmul float %29, %28
  %x_loc20.1 = or i32 %2, 32
  %31 = add nuw nsw i32 %x_loc20.1, %7
  %32 = udiv i32 %31, 100
  %.frozen82 = freeze i32 %31
  %33 = udiv i32 %.frozen82, 819200
  %34 = mul i32 %33, 819200
  %urem.1.decomposed = sub i32 %.frozen82, %34
  %35 = udiv i32 %urem.1.decomposed, 100
  %36 = mul i32 %35, 100
  %.decomposed83 = sub i32 %urem.1.decomposed, %36
  %37 = zext i32 %35 to i64
  %38 = zext i32 %.decomposed83 to i64
  %Arg_11.1221.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg11110, i64 0, i64 %37, i64 %38, i64 0
  %Arg_11.1222.1 = load float, ptr addrspace(1) %Arg_11.1221.1, align 4, !invariant.load !24
  %39 = zext i32 %33 to i64
  %Arg_10.1123.1 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg10108, i64 0, i64 0, i64 %39
  %Arg_10.1124.1 = load float, ptr addrspace(1) %Arg_10.1123.1, align 4, !invariant.load !24
  %multiply.1725.1 = fmul float %Arg_11.1222.1, %Arg_10.1124.1
  %Arg_9.1026.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg9106, i64 0, i64 %37, i64 %38, i64 0
  %Arg_9.1027.1 = load float, ptr addrspace(1) %Arg_9.1026.1, align 4, !invariant.load !24
  %Arg_8.928.1 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg8104, i64 0, i64 0, i64 %39
  %Arg_8.929.1 = load float, ptr addrspace(1) %Arg_8.928.1, align 4, !invariant.load !24
  %multiply.2230.1 = fmul float %Arg_9.1027.1, %Arg_8.929.1
  %add.2331.1 = fadd float %multiply.1725.1, %multiply.2230.1
  %Arg_7.832.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg7102, i64 0, i64 %37, i64 %38, i64 0
  %Arg_7.833.1 = load float, ptr addrspace(1) %Arg_7.832.1, align 4, !invariant.load !24
  %Arg_6.734.1 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg6100, i64 0, i64 0, i64 %39
  %Arg_6.735.1 = load float, ptr addrspace(1) %Arg_6.734.1, align 4, !invariant.load !24
  %multiply.2836.1 = fmul float %Arg_7.833.1, %Arg_6.735.1
  %add.2937.1 = fadd float %add.2331.1, %multiply.2836.1
  %Arg_5.638.1 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg598, i64 0, i64 %37, i64 %38, i64 0
  %Arg_5.639.1 = load float, ptr addrspace(1) %Arg_5.638.1, align 4, !invariant.load !24
  %Arg_4.540.1 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg496, i64 0, i64 0, i64 %39
  %Arg_4.541.1 = load float, ptr addrspace(1) %Arg_4.540.1, align 4, !invariant.load !24
  %multiply.3442.1 = fmul float %Arg_5.639.1, %Arg_4.541.1
  %add.3543.1 = fadd float %add.2937.1, %multiply.3442.1
  %40 = zext i32 %7 to i64
  %41 = zext i32 %2 to i64
  %42 = add i64 %41, %40
  %43 = getelementptr float, ptr addrspace(1) %arg292, i64 %42
  %Arg_2.345.1115 = getelementptr inbounds float, ptr addrspace(1) %43, i64 32
  %Arg_2.346.1 = load float, ptr addrspace(1) %Arg_2.345.1115, align 4, !invariant.load !24
  %multiply.3847.1 = fmul float %Arg_3.444, %Arg_2.346.1
  %add.3948.1 = fadd float %add.3543.1, %multiply.3847.1
  %Arg_1.249.1 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg190, i64 0, i64 %39
  %Arg_1.250.1 = load float, ptr addrspace(1) %Arg_1.249.1, align 4, !invariant.load !24
  %add.4251.1 = fadd float %Arg_1.250.1, %add.3948.1
  %44 = zext i32 %32 to i64
  %Arg_0.152.1 = getelementptr inbounds float, ptr addrspace(1) %arg088, i64 %44
  %Arg_0.153.1 = load float, ptr addrspace(1) %Arg_0.152.1, align 4, !invariant.load !24
  %subtract.4454.1 = fsub float %add.4251.1, %Arg_0.153.1
  %45 = tail call float @llvm.fma.f32(float %subtract.4454.1, float 0x3F777313A0000000, float 5.000000e-01)
  %46 = tail call float @llvm.nvvm.saturate.f(float %45) #3
  %47 = tail call float @llvm.nvvm.fma.rm.f(float %46, float 2.520000e+02, float 0x4168000020000000) #3
  %48 = fadd float %47, 0xC168000FE0000000
  %49 = fneg float %48
  %50 = tail call float @llvm.fma.f32(float %subtract.4454.1, float 0x3FF7154760000000, float %49)
  %51 = tail call float @llvm.fma.f32(float %subtract.4454.1, float 0x3E54AE0C00000000, float %50)
  %52 = bitcast float %47 to i32
  %53 = shl i32 %52, 23
  %54 = bitcast i32 %53 to float
  %55 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %51) #3
  %56 = fmul float %55, %54
  %add.51.i79.1 = fadd float %30, %56
  %x_loc20.2 = or i32 %2, 64
  %57 = add nuw nsw i32 %x_loc20.2, %7
  %58 = udiv i32 %57, 100
  %.frozen84 = freeze i32 %57
  %59 = udiv i32 %.frozen84, 819200
  %60 = mul i32 %59, 819200
  %urem.2.decomposed = sub i32 %.frozen84, %60
  %61 = udiv i32 %urem.2.decomposed, 100
  %62 = mul i32 %61, 100
  %.decomposed85 = sub i32 %urem.2.decomposed, %62
  %63 = zext i32 %61 to i64
  %64 = zext i32 %.decomposed85 to i64
  %Arg_11.1221.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg11110, i64 0, i64 %63, i64 %64, i64 0
  %Arg_11.1222.2 = load float, ptr addrspace(1) %Arg_11.1221.2, align 4, !invariant.load !24
  %65 = zext i32 %59 to i64
  %Arg_10.1123.2 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg10108, i64 0, i64 0, i64 %65
  %Arg_10.1124.2 = load float, ptr addrspace(1) %Arg_10.1123.2, align 4, !invariant.load !24
  %multiply.1725.2 = fmul float %Arg_11.1222.2, %Arg_10.1124.2
  %Arg_9.1026.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg9106, i64 0, i64 %63, i64 %64, i64 0
  %Arg_9.1027.2 = load float, ptr addrspace(1) %Arg_9.1026.2, align 4, !invariant.load !24
  %Arg_8.928.2 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg8104, i64 0, i64 0, i64 %65
  %Arg_8.929.2 = load float, ptr addrspace(1) %Arg_8.928.2, align 4, !invariant.load !24
  %multiply.2230.2 = fmul float %Arg_9.1027.2, %Arg_8.929.2
  %add.2331.2 = fadd float %multiply.1725.2, %multiply.2230.2
  %Arg_7.832.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg7102, i64 0, i64 %63, i64 %64, i64 0
  %Arg_7.833.2 = load float, ptr addrspace(1) %Arg_7.832.2, align 4, !invariant.load !24
  %Arg_6.734.2 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg6100, i64 0, i64 0, i64 %65
  %Arg_6.735.2 = load float, ptr addrspace(1) %Arg_6.734.2, align 4, !invariant.load !24
  %multiply.2836.2 = fmul float %Arg_7.833.2, %Arg_6.735.2
  %add.2937.2 = fadd float %add.2331.2, %multiply.2836.2
  %Arg_5.638.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg598, i64 0, i64 %63, i64 %64, i64 0
  %Arg_5.639.2 = load float, ptr addrspace(1) %Arg_5.638.2, align 4, !invariant.load !24
  %Arg_4.540.2 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg496, i64 0, i64 0, i64 %65
  %Arg_4.541.2 = load float, ptr addrspace(1) %Arg_4.540.2, align 4, !invariant.load !24
  %multiply.3442.2 = fmul float %Arg_5.639.2, %Arg_4.541.2
  %add.3543.2 = fadd float %add.2937.2, %multiply.3442.2
  %Arg_2.345.2117 = getelementptr inbounds float, ptr addrspace(1) %43, i64 64
  %Arg_2.346.2 = load float, ptr addrspace(1) %Arg_2.345.2117, align 4, !invariant.load !24
  %multiply.3847.2 = fmul float %Arg_3.444, %Arg_2.346.2
  %add.3948.2 = fadd float %add.3543.2, %multiply.3847.2
  %Arg_1.249.2 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg190, i64 0, i64 %65
  %Arg_1.250.2 = load float, ptr addrspace(1) %Arg_1.249.2, align 4, !invariant.load !24
  %add.4251.2 = fadd float %Arg_1.250.2, %add.3948.2
  %66 = zext i32 %58 to i64
  %Arg_0.152.2 = getelementptr inbounds float, ptr addrspace(1) %arg088, i64 %66
  %Arg_0.153.2 = load float, ptr addrspace(1) %Arg_0.152.2, align 4, !invariant.load !24
  %subtract.4454.2 = fsub float %add.4251.2, %Arg_0.153.2
  %67 = tail call float @llvm.fma.f32(float %subtract.4454.2, float 0x3F777313A0000000, float 5.000000e-01)
  %68 = tail call float @llvm.nvvm.saturate.f(float %67) #3
  %69 = tail call float @llvm.nvvm.fma.rm.f(float %68, float 2.520000e+02, float 0x4168000020000000) #3
  %70 = fadd float %69, 0xC168000FE0000000
  %71 = fneg float %70
  %72 = tail call float @llvm.fma.f32(float %subtract.4454.2, float 0x3FF7154760000000, float %71)
  %73 = tail call float @llvm.fma.f32(float %subtract.4454.2, float 0x3E54AE0C00000000, float %72)
  %74 = bitcast float %69 to i32
  %75 = shl i32 %74, 23
  %76 = bitcast i32 %75 to float
  %77 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %73) #3
  %78 = fmul float %77, %76
  %add.51.i79.2 = fadd float %add.51.i79.1, %78
  %x_loc20.3 = or i32 %0, 96
  %79 = icmp ult i32 %x_loc20.3, 100
  br i1 %79, label %x_in_tile-true.3, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %80 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %81 = lshr i32 %5, 13
  %82 = zext i32 %81 to i64
  %83 = and i32 %5, 8191
  %84 = zext i32 %83 to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr addrspace(1) %arg12112, i64 0, i64 %82, i64 %84
  br i1 %80, label %reduction_write_output-true, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header15.preheader
  %85 = add nuw nsw i32 %x_loc20.3, %7
  %86 = udiv i32 %85, 100
  %.frozen86 = freeze i32 %85
  %87 = udiv i32 %.frozen86, 819200
  %88 = mul i32 %87, 819200
  %urem.3.decomposed = sub i32 %.frozen86, %88
  %89 = udiv i32 %urem.3.decomposed, 100
  %90 = mul i32 %89, 100
  %.decomposed87 = sub i32 %urem.3.decomposed, %90
  %91 = zext i32 %89 to i64
  %92 = zext i32 %.decomposed87 to i64
  %Arg_11.1221.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg11110, i64 0, i64 %91, i64 %92, i64 0
  %Arg_11.1222.3 = load float, ptr addrspace(1) %Arg_11.1221.3, align 4, !invariant.load !24
  %93 = zext i32 %87 to i64
  %Arg_10.1123.3 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg10108, i64 0, i64 0, i64 %93
  %Arg_10.1124.3 = load float, ptr addrspace(1) %Arg_10.1123.3, align 4, !invariant.load !24
  %multiply.1725.3 = fmul float %Arg_11.1222.3, %Arg_10.1124.3
  %Arg_9.1026.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg9106, i64 0, i64 %91, i64 %92, i64 0
  %Arg_9.1027.3 = load float, ptr addrspace(1) %Arg_9.1026.3, align 4, !invariant.load !24
  %Arg_8.928.3 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg8104, i64 0, i64 0, i64 %93
  %Arg_8.929.3 = load float, ptr addrspace(1) %Arg_8.928.3, align 4, !invariant.load !24
  %multiply.2230.3 = fmul float %Arg_9.1027.3, %Arg_8.929.3
  %add.2331.3 = fadd float %multiply.1725.3, %multiply.2230.3
  %Arg_7.832.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg7102, i64 0, i64 %91, i64 %92, i64 0
  %Arg_7.833.3 = load float, ptr addrspace(1) %Arg_7.832.3, align 4, !invariant.load !24
  %Arg_6.734.3 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg6100, i64 0, i64 0, i64 %93
  %Arg_6.735.3 = load float, ptr addrspace(1) %Arg_6.734.3, align 4, !invariant.load !24
  %multiply.2836.3 = fmul float %Arg_7.833.3, %Arg_6.735.3
  %add.2937.3 = fadd float %add.2331.3, %multiply.2836.3
  %Arg_5.638.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg598, i64 0, i64 %91, i64 %92, i64 0
  %Arg_5.639.3 = load float, ptr addrspace(1) %Arg_5.638.3, align 4, !invariant.load !24
  %Arg_4.540.3 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg496, i64 0, i64 0, i64 %93
  %Arg_4.541.3 = load float, ptr addrspace(1) %Arg_4.540.3, align 4, !invariant.load !24
  %multiply.3442.3 = fmul float %Arg_5.639.3, %Arg_4.541.3
  %add.3543.3 = fadd float %add.2937.3, %multiply.3442.3
  %94 = zext i32 %85 to i64
  %Arg_2.345.3 = getelementptr inbounds float, ptr addrspace(1) %arg292, i64 %94
  %Arg_2.346.3 = load float, ptr addrspace(1) %Arg_2.345.3, align 4, !invariant.load !24
  %multiply.3847.3 = fmul float %Arg_3.444, %Arg_2.346.3
  %add.3948.3 = fadd float %add.3543.3, %multiply.3847.3
  %Arg_1.249.3 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg190, i64 0, i64 %93
  %Arg_1.250.3 = load float, ptr addrspace(1) %Arg_1.249.3, align 4, !invariant.load !24
  %add.4251.3 = fadd float %Arg_1.250.3, %add.3948.3
  %95 = zext i32 %86 to i64
  %Arg_0.152.3 = getelementptr inbounds float, ptr addrspace(1) %arg088, i64 %95
  %Arg_0.153.3 = load float, ptr addrspace(1) %Arg_0.152.3, align 4, !invariant.load !24
  %subtract.4454.3 = fsub float %add.4251.3, %Arg_0.153.3
  %96 = tail call float @llvm.fma.f32(float %subtract.4454.3, float 0x3F777313A0000000, float 5.000000e-01)
  %97 = tail call float @llvm.nvvm.saturate.f(float %96) #3
  %98 = tail call float @llvm.nvvm.fma.rm.f(float %97, float 2.520000e+02, float 0x4168000020000000) #3
  %99 = fadd float %98, 0xC168000FE0000000
  %100 = fneg float %99
  %101 = tail call float @llvm.fma.f32(float %subtract.4454.3, float 0x3FF7154760000000, float %100)
  %102 = tail call float @llvm.fma.f32(float %subtract.4454.3, float 0x3E54AE0C00000000, float %101)
  %103 = bitcast float %98 to i32
  %104 = shl i32 %103, 23
  %105 = bitcast i32 %104 to float
  %106 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %102) #3
  %107 = fmul float %106, %105
  %add.51.i79.3 = fadd float %add.51.i79.2, %107
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header15.preheader
  %partial_reduction_result.1.3 = phi float [ %add.51.i79.3, %x_in_tile-true.3 ], [ %add.51.i79.2, %tile_loop.loop_header15.preheader ]
  %108 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %add.51.i = fadd float %partial_reduction_result.1.3, %108
  %109 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.51.i, i32 8, i32 31)
  %add.51.i75 = fadd float %add.51.i, %109
  %110 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.51.i75, i32 4, i32 31)
  %add.51.i76 = fadd float %add.51.i75, %110
  %111 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.51.i76, i32 2, i32 31)
  %add.51.i77 = fadd float %add.51.i76, %111
  %112 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.51.i77, i32 1, i32 31)
  %113 = icmp eq i32 %2, 0
  %114 = zext i32 %3 to i64
  %115 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 %114, i64 0, i64 0
  %add.51.i78 = fadd float %add.51.i77, %112
  br i1 %113, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.51.i78, ptr addrspace(3) %115, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %115, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg11, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg13) local_unnamed_addr #0 {
entry:
  %arg1368 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1266 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1164 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1062 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg960 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg858 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg756 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg654 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg552 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg450 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg348 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg246 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg144 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg042 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !29
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %.lhs.trunc = trunc i32 %0 to i16
  %4 = udiv i16 %.lhs.trunc, 800
  %5 = udiv i32 %linear_index_base, 100
  %6 = and i32 %5, 8191
  %7 = urem i32 %linear_index3, 100
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = urem i32 %linear_index2, 100
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = urem i32 %linear_index1, 100
  %urem = urem i32 %linear_index_base, 819200
  %urem.frozen = freeze i32 %urem
  %10 = udiv i32 %urem.frozen, 100
  %11 = mul i32 %10, 100
  %.decomposed = sub i32 %urem.frozen, %11
  %12 = zext i32 %10 to i64
  %13 = zext i32 %.decomposed to i64
  %14 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1266, i64 0, i64 %12, i64 %13, i64 0
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !24
  %16 = zext i16 %4 to i64
  %17 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg1164, i64 0, i64 0, i64 %16
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !24
  %multiply.18 = fmul float %15, %18
  %19 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1062, i64 0, i64 %12, i64 %13, i64 0
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !24
  %21 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg960, i64 0, i64 0, i64 %16
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !24
  %multiply.23 = fmul float %20, %22
  %add.24 = fadd float %multiply.18, %multiply.23
  %23 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg858, i64 0, i64 %12, i64 %13, i64 0
  %24 = load float, ptr addrspace(1) %23, align 4, !invariant.load !24
  %25 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg756, i64 0, i64 0, i64 %16
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !24
  %multiply.29 = fmul float %24, %26
  %add.30 = fadd float %add.24, %multiply.29
  %27 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg654, i64 0, i64 %12, i64 %13, i64 0
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !24
  %29 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg552, i64 0, i64 0, i64 %16
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !24
  %multiply.35 = fmul float %28, %30
  %add.36 = fadd float %add.30, %multiply.35
  %31 = load float, ptr addrspace(1) %arg450, align 16, !invariant.load !24
  %32 = zext i32 %linear_index_base to i64
  %33 = getelementptr float, ptr addrspace(1) %arg348, i64 %32
  %34 = load <4 x float>, ptr addrspace(1) %33, align 16, !invariant.load !24
  %35 = extractelement <4 x float> %34, i32 0
  %36 = extractelement <4 x float> %34, i32 1
  %37 = extractelement <4 x float> %34, i32 2
  %38 = extractelement <4 x float> %34, i32 3
  %multiply.39 = fmul float %31, %35
  %add.40 = fadd float %add.36, %multiply.39
  %39 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg246, i64 0, i64 %16
  %40 = load float, ptr addrspace(1) %39, align 4, !invariant.load !24
  %add.43 = fadd float %40, %add.40
  %41 = zext i32 %5 to i64
  %42 = getelementptr inbounds float, ptr addrspace(1) %arg144, i64 %41
  %43 = load float, ptr addrspace(1) %42, align 4, !invariant.load !24
  %subtract.45 = fsub float %add.43, %43
  %44 = tail call float @llvm.fma.f32(float %subtract.45, float 0x3F777313A0000000, float 5.000000e-01)
  %45 = tail call float @llvm.nvvm.saturate.f(float %44) #3
  %46 = tail call float @llvm.nvvm.fma.rm.f(float %45, float 2.520000e+02, float 0x4168000020000000) #3
  %47 = fadd float %46, 0xC168000FE0000000
  %48 = fneg float %47
  %49 = tail call float @llvm.fma.f32(float %subtract.45, float 0x3FF7154760000000, float %48)
  %50 = tail call float @llvm.fma.f32(float %subtract.45, float 0x3E54AE0C00000000, float %49)
  %51 = bitcast float %46 to i32
  %52 = shl i32 %51, 23
  %53 = bitcast i32 %52 to float
  %54 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %50) #3
  %55 = fmul float %54, %53
  %56 = getelementptr inbounds float, ptr addrspace(1) %arg042, i64 %41
  %57 = load float, ptr addrspace(1) %56, align 4, !invariant.load !24
  %divide.48 = fdiv float %55, %57
  %58 = getelementptr float, ptr addrspace(1) %arg1368, i64 %32
  %59 = mul nuw nsw i32 %6, 100
  %60 = add nuw nsw i32 %59, %9
  %.frozen = freeze i32 %60
  %61 = udiv i32 %.frozen, 100
  %62 = mul i32 %61, 100
  %.decomposed37 = sub i32 %.frozen, %62
  %63 = zext i32 %61 to i64
  %64 = zext i32 %.decomposed37 to i64
  %65 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1266, i64 0, i64 %63, i64 %64, i64 0
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !24
  %multiply.181 = fmul float %18, %66
  %67 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1062, i64 0, i64 %63, i64 %64, i64 0
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !24
  %multiply.232 = fmul float %22, %68
  %add.243 = fadd float %multiply.181, %multiply.232
  %69 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg858, i64 0, i64 %63, i64 %64, i64 0
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !24
  %multiply.294 = fmul float %26, %70
  %add.305 = fadd float %add.243, %multiply.294
  %71 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg654, i64 0, i64 %63, i64 %64, i64 0
  %72 = load float, ptr addrspace(1) %71, align 4, !invariant.load !24
  %multiply.356 = fmul float %30, %72
  %add.367 = fadd float %add.305, %multiply.356
  %multiply.398 = fmul float %31, %36
  %add.409 = fadd float %add.367, %multiply.398
  %add.4310 = fadd float %40, %add.409
  %subtract.4511 = fsub float %add.4310, %43
  %73 = tail call float @llvm.fma.f32(float %subtract.4511, float 0x3F777313A0000000, float 5.000000e-01)
  %74 = tail call float @llvm.nvvm.saturate.f(float %73) #3
  %75 = tail call float @llvm.nvvm.fma.rm.f(float %74, float 2.520000e+02, float 0x4168000020000000) #3
  %76 = fadd float %75, 0xC168000FE0000000
  %77 = fneg float %76
  %78 = tail call float @llvm.fma.f32(float %subtract.4511, float 0x3FF7154760000000, float %77)
  %79 = tail call float @llvm.fma.f32(float %subtract.4511, float 0x3E54AE0C00000000, float %78)
  %80 = bitcast float %75 to i32
  %81 = shl i32 %80, 23
  %82 = bitcast i32 %81 to float
  %83 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %79) #3
  %84 = fmul float %83, %82
  %divide.4812 = fdiv float %84, %57
  %85 = add nuw nsw i32 %59, %8
  %.frozen38 = freeze i32 %85
  %86 = udiv i32 %.frozen38, 100
  %87 = mul i32 %86, 100
  %.decomposed39 = sub i32 %.frozen38, %87
  %88 = zext i32 %86 to i64
  %89 = zext i32 %.decomposed39 to i64
  %90 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1266, i64 0, i64 %88, i64 %89, i64 0
  %91 = load float, ptr addrspace(1) %90, align 4, !invariant.load !24
  %multiply.1813 = fmul float %18, %91
  %92 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1062, i64 0, i64 %88, i64 %89, i64 0
  %93 = load float, ptr addrspace(1) %92, align 4, !invariant.load !24
  %multiply.2314 = fmul float %22, %93
  %add.2415 = fadd float %multiply.1813, %multiply.2314
  %94 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg858, i64 0, i64 %88, i64 %89, i64 0
  %95 = load float, ptr addrspace(1) %94, align 4, !invariant.load !24
  %multiply.2916 = fmul float %26, %95
  %add.3017 = fadd float %add.2415, %multiply.2916
  %96 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg654, i64 0, i64 %88, i64 %89, i64 0
  %97 = load float, ptr addrspace(1) %96, align 4, !invariant.load !24
  %multiply.3518 = fmul float %30, %97
  %add.3619 = fadd float %add.3017, %multiply.3518
  %multiply.3920 = fmul float %31, %37
  %add.4021 = fadd float %add.3619, %multiply.3920
  %add.4322 = fadd float %40, %add.4021
  %subtract.4523 = fsub float %add.4322, %43
  %98 = tail call float @llvm.fma.f32(float %subtract.4523, float 0x3F777313A0000000, float 5.000000e-01)
  %99 = tail call float @llvm.nvvm.saturate.f(float %98) #3
  %100 = tail call float @llvm.nvvm.fma.rm.f(float %99, float 2.520000e+02, float 0x4168000020000000) #3
  %101 = fadd float %100, 0xC168000FE0000000
  %102 = fneg float %101
  %103 = tail call float @llvm.fma.f32(float %subtract.4523, float 0x3FF7154760000000, float %102)
  %104 = tail call float @llvm.fma.f32(float %subtract.4523, float 0x3E54AE0C00000000, float %103)
  %105 = bitcast float %100 to i32
  %106 = shl i32 %105, 23
  %107 = bitcast i32 %106 to float
  %108 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %104) #3
  %109 = fmul float %108, %107
  %divide.4824 = fdiv float %109, %57
  %110 = add nuw nsw i32 %59, %7
  %.frozen40 = freeze i32 %110
  %111 = udiv i32 %.frozen40, 100
  %112 = mul i32 %111, 100
  %.decomposed41 = sub i32 %.frozen40, %112
  %113 = zext i32 %111 to i64
  %114 = zext i32 %.decomposed41 to i64
  %115 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1266, i64 0, i64 %113, i64 %114, i64 0
  %116 = load float, ptr addrspace(1) %115, align 4, !invariant.load !24
  %multiply.1825 = fmul float %18, %116
  %117 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1062, i64 0, i64 %113, i64 %114, i64 0
  %118 = load float, ptr addrspace(1) %117, align 4, !invariant.load !24
  %multiply.2326 = fmul float %22, %118
  %add.2427 = fadd float %multiply.1825, %multiply.2326
  %119 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg858, i64 0, i64 %113, i64 %114, i64 0
  %120 = load float, ptr addrspace(1) %119, align 4, !invariant.load !24
  %multiply.2928 = fmul float %26, %120
  %add.3029 = fadd float %add.2427, %multiply.2928
  %121 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg654, i64 0, i64 %113, i64 %114, i64 0
  %122 = load float, ptr addrspace(1) %121, align 4, !invariant.load !24
  %multiply.3530 = fmul float %30, %122
  %add.3631 = fadd float %add.3029, %multiply.3530
  %multiply.3932 = fmul float %31, %38
  %add.4033 = fadd float %add.3631, %multiply.3932
  %add.4334 = fadd float %40, %add.4033
  %subtract.4535 = fsub float %add.4334, %43
  %123 = tail call float @llvm.fma.f32(float %subtract.4535, float 0x3F777313A0000000, float 5.000000e-01)
  %124 = tail call float @llvm.nvvm.saturate.f(float %123) #3
  %125 = tail call float @llvm.nvvm.fma.rm.f(float %124, float 2.520000e+02, float 0x4168000020000000) #3
  %126 = fadd float %125, 0xC168000FE0000000
  %127 = fneg float %126
  %128 = tail call float @llvm.fma.f32(float %subtract.4535, float 0x3FF7154760000000, float %127)
  %129 = tail call float @llvm.fma.f32(float %subtract.4535, float 0x3E54AE0C00000000, float %128)
  %130 = bitcast float %125 to i32
  %131 = shl i32 %130, 23
  %132 = bitcast i32 %131 to float
  %133 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %129) #3
  %134 = fmul float %133, %132
  %divide.4836 = fdiv float %134, %57
  %135 = insertelement <4 x float> poison, float %divide.48, i32 0
  %136 = insertelement <4 x float> %135, float %divide.4812, i32 1
  %137 = insertelement <4 x float> %136, float %divide.4824, i32 2
  %138 = insertelement <4 x float> %137, float %divide.4836, i32 3
  store <4 x float> %138, ptr addrspace(1) %58, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_2(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(498073600) %arg5) local_unnamed_addr #2 {
entry:
  %arg576 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg474 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg372 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg270 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg066 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !23
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 152
  %5 = mul i32 %4, 152
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 152
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 152
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 152
  %9 = icmp ult i32 %.decomposed, 128
  br i1 %9, label %concatenate.pivot.64., label %concatenate.pivot.136.

concatenate.pivot.64.:                            ; preds = %entry
  %10 = icmp ult i32 %.decomposed, 64
  br i1 %10, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %11 = shl nuw nsw i32 %4, 6
  %12 = add nuw nsw i32 %11, %.decomposed
  br label %concatenate.6.merge

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  %13 = add nsw i32 %.decomposed, -64
  %14 = shl nuw nsw i32 %4, 6
  %15 = add nuw nsw i32 %13, %14
  br label %concatenate.6.merge

concatenate.pivot.136.:                           ; preds = %entry
  %16 = icmp ult i32 %.decomposed, 136
  %17 = shl nuw nsw i32 %4, 3
  br i1 %16, label %concatenate.pivot.128.2, label %concatenate.pivot.144.

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  %18 = add nsw i32 %.decomposed, -128
  %19 = add nuw nsw i32 %18, %17
  br label %concatenate.6.merge

concatenate.pivot.144.:                           ; preds = %concatenate.pivot.136.
  %20 = icmp ult i32 %.decomposed, 144
  br i1 %20, label %concatenate.pivot.136.3, label %concatenate.pivot.144.4

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.144.
  %21 = add nsw i32 %.decomposed, -136
  %22 = add nuw nsw i32 %21, %17
  br label %concatenate.6.merge

concatenate.pivot.144.4:                          ; preds = %concatenate.pivot.144.
  %23 = add nsw i32 %.decomposed, -144
  %24 = add nuw nsw i32 %23, %17
  br label %concatenate.6.merge

concatenate.6.merge:                              ; preds = %concatenate.pivot.144.4, %concatenate.pivot.136.3, %concatenate.pivot.128.2, %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.sink59 = phi i32 [ %24, %concatenate.pivot.144.4 ], [ %22, %concatenate.pivot.136.3 ], [ %19, %concatenate.pivot.128.2 ], [ %15, %concatenate.pivot.64.1 ], [ %12, %concatenate.pivot.0. ]
  %arg4.sink = phi ptr addrspace(1) [ %arg474, %concatenate.pivot.144.4 ], [ %arg372, %concatenate.pivot.136.3 ], [ %arg270, %concatenate.pivot.128.2 ], [ %arg168, %concatenate.pivot.64.1 ], [ %arg066, %concatenate.pivot.0. ]
  %25 = zext i32 %.sink59 to i64
  %26 = getelementptr inbounds float, ptr addrspace(1) %arg4.sink, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !24
  %28 = zext i32 %linear_index_base to i64
  %29 = getelementptr float, ptr addrspace(1) %arg576, i64 %28
  store float %27, ptr addrspace(1) %29, align 16
  %30 = icmp ult i32 %6, 128
  br i1 %30, label %concatenate.pivot.64.12, label %concatenate.pivot.136.15

concatenate.pivot.64.12:                          ; preds = %concatenate.6.merge
  %31 = icmp ult i32 %6, 64
  br i1 %31, label %concatenate.pivot.0.13, label %concatenate.pivot.64.14

concatenate.pivot.0.13:                           ; preds = %concatenate.pivot.64.12
  %32 = shl nuw nsw i32 %4, 6
  %33 = add nuw nsw i32 %32, %6
  br label %concatenate.6.merge5

concatenate.pivot.64.14:                          ; preds = %concatenate.pivot.64.12
  %34 = add nsw i32 %6, -64
  %35 = shl nuw nsw i32 %4, 6
  %36 = add nuw nsw i32 %34, %35
  br label %concatenate.6.merge5

concatenate.pivot.136.15:                         ; preds = %concatenate.6.merge
  %37 = icmp ult i32 %6, 136
  %38 = shl nuw nsw i32 %4, 3
  br i1 %37, label %concatenate.pivot.128.16, label %concatenate.pivot.144.17

concatenate.pivot.128.16:                         ; preds = %concatenate.pivot.136.15
  %39 = add nsw i32 %6, -128
  %40 = add nuw nsw i32 %39, %38
  br label %concatenate.6.merge5

concatenate.pivot.144.17:                         ; preds = %concatenate.pivot.136.15
  %41 = icmp ult i32 %6, 144
  br i1 %41, label %concatenate.pivot.136.18, label %concatenate.pivot.144.19

concatenate.pivot.136.18:                         ; preds = %concatenate.pivot.144.17
  %42 = add nsw i32 %6, -136
  %43 = add nuw nsw i32 %42, %38
  br label %concatenate.6.merge5

concatenate.pivot.144.19:                         ; preds = %concatenate.pivot.144.17
  %44 = add nsw i32 %6, -144
  %45 = add nuw nsw i32 %44, %38
  br label %concatenate.6.merge5

concatenate.6.merge5:                             ; preds = %concatenate.pivot.144.19, %concatenate.pivot.136.18, %concatenate.pivot.128.16, %concatenate.pivot.64.14, %concatenate.pivot.0.13
  %.sink61 = phi i32 [ %45, %concatenate.pivot.144.19 ], [ %43, %concatenate.pivot.136.18 ], [ %40, %concatenate.pivot.128.16 ], [ %36, %concatenate.pivot.64.14 ], [ %33, %concatenate.pivot.0.13 ]
  %arg4.sink60 = phi ptr addrspace(1) [ %arg474, %concatenate.pivot.144.19 ], [ %arg372, %concatenate.pivot.136.18 ], [ %arg270, %concatenate.pivot.128.16 ], [ %arg168, %concatenate.pivot.64.14 ], [ %arg066, %concatenate.pivot.0.13 ]
  %46 = zext i32 %.sink61 to i64
  %47 = getelementptr inbounds float, ptr addrspace(1) %arg4.sink60, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !24
  %49 = getelementptr inbounds float, ptr addrspace(1) %29, i64 1
  store float %48, ptr addrspace(1) %49, align 4
  %50 = icmp ult i32 %7, 128
  br i1 %50, label %concatenate.pivot.64.27, label %concatenate.pivot.136.30

concatenate.pivot.64.27:                          ; preds = %concatenate.6.merge5
  %51 = icmp ult i32 %7, 64
  br i1 %51, label %concatenate.pivot.0.28, label %concatenate.pivot.64.29

concatenate.pivot.0.28:                           ; preds = %concatenate.pivot.64.27
  %52 = shl nuw nsw i32 %4, 6
  %53 = add nuw nsw i32 %52, %7
  br label %concatenate.6.merge20

concatenate.pivot.64.29:                          ; preds = %concatenate.pivot.64.27
  %54 = add nsw i32 %7, -64
  %55 = shl nuw nsw i32 %4, 6
  %56 = add nuw nsw i32 %54, %55
  br label %concatenate.6.merge20

concatenate.pivot.136.30:                         ; preds = %concatenate.6.merge5
  %57 = icmp ult i32 %7, 136
  %58 = shl nuw nsw i32 %4, 3
  br i1 %57, label %concatenate.pivot.128.31, label %concatenate.pivot.144.32

concatenate.pivot.128.31:                         ; preds = %concatenate.pivot.136.30
  %59 = add nsw i32 %7, -128
  %60 = add nuw nsw i32 %59, %58
  br label %concatenate.6.merge20

concatenate.pivot.144.32:                         ; preds = %concatenate.pivot.136.30
  %61 = icmp ult i32 %7, 144
  br i1 %61, label %concatenate.pivot.136.33, label %concatenate.pivot.144.34

concatenate.pivot.136.33:                         ; preds = %concatenate.pivot.144.32
  %62 = add nsw i32 %7, -136
  %63 = add nuw nsw i32 %62, %58
  br label %concatenate.6.merge20

concatenate.pivot.144.34:                         ; preds = %concatenate.pivot.144.32
  %64 = add nsw i32 %7, -144
  %65 = add nuw nsw i32 %64, %58
  br label %concatenate.6.merge20

concatenate.6.merge20:                            ; preds = %concatenate.pivot.144.34, %concatenate.pivot.136.33, %concatenate.pivot.128.31, %concatenate.pivot.64.29, %concatenate.pivot.0.28
  %.sink63 = phi i32 [ %65, %concatenate.pivot.144.34 ], [ %63, %concatenate.pivot.136.33 ], [ %60, %concatenate.pivot.128.31 ], [ %56, %concatenate.pivot.64.29 ], [ %53, %concatenate.pivot.0.28 ]
  %arg4.sink62 = phi ptr addrspace(1) [ %arg474, %concatenate.pivot.144.34 ], [ %arg372, %concatenate.pivot.136.33 ], [ %arg270, %concatenate.pivot.128.31 ], [ %arg168, %concatenate.pivot.64.29 ], [ %arg066, %concatenate.pivot.0.28 ]
  %66 = zext i32 %.sink63 to i64
  %67 = getelementptr inbounds float, ptr addrspace(1) %arg4.sink62, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !24
  %69 = getelementptr inbounds float, ptr addrspace(1) %29, i64 2
  store float %68, ptr addrspace(1) %69, align 8
  %70 = icmp ult i32 %8, 128
  br i1 %70, label %concatenate.pivot.64.42, label %concatenate.pivot.136.45

concatenate.pivot.64.42:                          ; preds = %concatenate.6.merge20
  %71 = icmp ult i32 %8, 64
  br i1 %71, label %concatenate.pivot.0.43, label %concatenate.pivot.64.44

concatenate.pivot.0.43:                           ; preds = %concatenate.pivot.64.42
  %72 = shl nuw nsw i32 %4, 6
  %73 = add nuw nsw i32 %72, %8
  br label %concatenate.6.merge35

concatenate.pivot.64.44:                          ; preds = %concatenate.pivot.64.42
  %74 = add nsw i32 %8, -64
  %75 = shl nuw nsw i32 %4, 6
  %76 = add nuw nsw i32 %74, %75
  br label %concatenate.6.merge35

concatenate.pivot.136.45:                         ; preds = %concatenate.6.merge20
  %77 = icmp ult i32 %8, 136
  %78 = shl nuw nsw i32 %4, 3
  br i1 %77, label %concatenate.pivot.128.46, label %concatenate.pivot.144.47

concatenate.pivot.128.46:                         ; preds = %concatenate.pivot.136.45
  %79 = add nsw i32 %8, -128
  %80 = add nuw nsw i32 %79, %78
  br label %concatenate.6.merge35

concatenate.pivot.144.47:                         ; preds = %concatenate.pivot.136.45
  %81 = icmp ult i32 %8, 144
  br i1 %81, label %concatenate.pivot.136.48, label %concatenate.pivot.144.49

concatenate.pivot.136.48:                         ; preds = %concatenate.pivot.144.47
  %82 = add nsw i32 %8, -136
  %83 = add nuw nsw i32 %82, %78
  br label %concatenate.6.merge35

concatenate.pivot.144.49:                         ; preds = %concatenate.pivot.144.47
  %84 = add nsw i32 %8, -144
  %85 = add nuw nsw i32 %84, %78
  br label %concatenate.6.merge35

concatenate.6.merge35:                            ; preds = %concatenate.pivot.144.49, %concatenate.pivot.136.48, %concatenate.pivot.128.46, %concatenate.pivot.64.44, %concatenate.pivot.0.43
  %.sink65 = phi i32 [ %85, %concatenate.pivot.144.49 ], [ %83, %concatenate.pivot.136.48 ], [ %80, %concatenate.pivot.128.46 ], [ %76, %concatenate.pivot.64.44 ], [ %73, %concatenate.pivot.0.43 ]
  %arg4.sink64 = phi ptr addrspace(1) [ %arg474, %concatenate.pivot.144.49 ], [ %arg372, %concatenate.pivot.136.48 ], [ %arg270, %concatenate.pivot.128.46 ], [ %arg168, %concatenate.pivot.64.44 ], [ %arg066, %concatenate.pivot.0.43 ]
  %86 = zext i32 %.sink65 to i64
  %87 = getelementptr inbounds float, ptr addrspace(1) %arg4.sink64, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4, !invariant.load !24
  %89 = getelementptr inbounds float, ptr addrspace(1) %29, i64 3
  store float %88, ptr addrspace(1) %89, align 4
  ret void
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @add_44(ptr noalias nocapture readonly align 128 dereferenceable(838860800) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(838860800) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg2) local_unnamed_addr #6 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = shl nuw nsw i64 %4, 2
  %6 = add nuw nsw i64 %5, 8
  %scevgep = getelementptr i8, ptr addrspace(1) %arg29, i64 %6
  %scevgep25 = getelementptr i8, ptr addrspace(1) %arg17, i64 %6
  %scevgep31 = getelementptr i8, ptr addrspace(1) %arg05, i64 %6
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %entry, %add_44.in_bounds-after
  %lsr.iv32 = phi ptr addrspace(1) [ %scevgep31, %entry ], [ %scevgep33, %add_44.in_bounds-after ]
  %lsr.iv26 = phi ptr addrspace(1) [ %scevgep25, %entry ], [ %scevgep27, %add_44.in_bounds-after ]
  %lsr.iv20 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep21, %add_44.in_bounds-after ]
  %lsr.iv = phi i32 [ -442368, %entry ], [ %lsr.iv.next, %add_44.in_bounds-after ]
  %7 = add i32 %linear_index_base, %lsr.iv
  %8 = add i32 %7, 442368
  %9 = icmp ult i32 %8, 209715200
  br i1 %9, label %add_44.in_bounds-true, label %add_44.in_bounds-after

add_44.in_bounds-after:                           ; preds = %add_44.in_bounds-true, %loop.loop_body
  %lsr.iv.next = add nsw i32 %lsr.iv, 442368
  %scevgep21 = getelementptr i8, ptr addrspace(1) %lsr.iv20, i64 1769472
  %scevgep27 = getelementptr i8, ptr addrspace(1) %lsr.iv26, i64 1769472
  %scevgep33 = getelementptr i8, ptr addrspace(1) %lsr.iv32, i64 1769472
  %10 = icmp ugt i32 %lsr.iv.next, 209272831
  br i1 %10, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !33

loop.loop_exit:                                   ; preds = %add_44.in_bounds-after
  ret void

add_44.in_bounds-true:                            ; preds = %loop.loop_body
  %scevgep34 = getelementptr i8, ptr addrspace(1) %lsr.iv32, i64 -8
  %11 = load <4 x float>, ptr addrspace(1) %scevgep34, align 16, !invariant.load !24
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %scevgep29 = getelementptr i8, ptr addrspace(1) %lsr.iv26, i64 -8
  %16 = load <4 x float>, ptr addrspace(1) %scevgep29, align 16, !invariant.load !24
  %17 = extractelement <4 x float> %16, i32 0
  %18 = extractelement <4 x float> %16, i32 1
  %19 = extractelement <4 x float> %16, i32 2
  %20 = extractelement <4 x float> %16, i32 3
  %add.3 = fadd float %12, %17
  %scevgep23 = getelementptr i8, ptr addrspace(1) %lsr.iv20, i64 -8
  %add.31 = fadd float %13, %18
  %add.32 = fadd float %14, %19
  %add.33 = fadd float %15, %20
  %21 = insertelement <4 x float> poison, float %add.3, i32 0
  %22 = insertelement <4 x float> %21, float %add.31, i32 1
  %23 = insertelement <4 x float> %22, float %add.32, i32 2
  %24 = insertelement <4 x float> %23, float %add.33, i32 3
  store <4 x float> %24, ptr addrspace(1) %scevgep23, align 16
  br label %add_44.in_bounds-after
}

; Function Attrs: nounwind
define void @fusion(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(838860800) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(838860800) %arg3) local_unnamed_addr #3 {
entry:
  %arg3120 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2118 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0114 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !36
  %thread_id.x = and i32 %1, 31
  %thread_id.y82 = lshr i32 %1, 5
  %2 = shl nuw nsw i32 %thread_id.x, 1
  %3 = mul nuw nsw i32 %0, 6400
  %4 = or i32 %2, 64
  %5 = zext i32 %4 to i64
  %6 = zext i32 %2 to i64
  %7 = or i32 %2, 1
  %8 = or i32 %2, 65
  %9 = add nuw nsw i32 %thread_id.y82, -32
  %10 = shl nuw nsw i32 %thread_id.y82, 6
  %11 = add i32 %3, %10
  %12 = add i32 %11, %2
  %13 = add i32 %12, 1
  %14 = zext i32 %12 to i64
  %15 = add nuw nsw i64 %14, 1
  %16 = lshr i64 %15, 6
  %17 = shl nuw nsw i64 %16, 8
  %18 = trunc i32 %1 to i5
  %19 = zext i5 %18 to i64
  %20 = shl nuw nsw i64 %19, 3
  %21 = add i64 %17, %20
  %22 = add i64 %21, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg3120, i64 %22
  %23 = shl nuw nsw i64 %16, 2
  %scevgep134 = getelementptr i8, ptr addrspace(1) %arg0114, i64 %23
  %24 = lshr i32 %13, 6
  %25 = lshr i64 %14, 6
  %26 = shl nuw nsw i64 %25, 2
  %scevgep140 = getelementptr i8, ptr addrspace(1) %arg0114, i64 %26
  %27 = shl nuw nsw i64 %25, 8
  %28 = add i64 %27, %20
  %scevgep150 = getelementptr i8, ptr addrspace(1) %arg3120, i64 %28
  %29 = lshr i32 %12, 6
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true73
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv154 = phi i32 [ %29, %entry ], [ %lsr.iv.next155, %y_in_tile.loop_body ]
  %lsr.iv151 = phi ptr addrspace(1) [ %scevgep150, %entry ], [ %scevgep152, %y_in_tile.loop_body ]
  %lsr.iv147 = phi i64 [ %25, %entry ], [ %lsr.iv.next148, %y_in_tile.loop_body ]
  %lsr.iv143 = phi i64 [ %14, %entry ], [ %lsr.iv.next144, %y_in_tile.loop_body ]
  %lsr.iv141 = phi ptr addrspace(1) [ %scevgep140, %entry ], [ %scevgep142, %y_in_tile.loop_body ]
  %lsr.iv138 = phi i32 [ %24, %entry ], [ %lsr.iv.next139, %y_in_tile.loop_body ]
  %lsr.iv135 = phi ptr addrspace(1) [ %scevgep134, %entry ], [ %scevgep136, %y_in_tile.loop_body ]
  %lsr.iv131 = phi i64 [ %16, %entry ], [ %lsr.iv.next132, %y_in_tile.loop_body ]
  %lsr.iv129 = phi i64 [ %15, %entry ], [ %lsr.iv.next130, %y_in_tile.loop_body ]
  %lsr.iv127 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep128, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ 0, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result81.sroa.0.0107 = phi float [ 0.000000e+00, %entry ], [ %add.20.i104, %y_in_tile.loop_body ]
  %partial_reduction_result81.sroa.4.0106 = phi float [ 0.000000e+00, %entry ], [ %add.20.i105, %y_in_tile.loop_body ]
  %30 = trunc i64 %6 to i32
  %31 = trunc i64 %6 to i32
  %lsr158 = trunc i64 %lsr.iv129 to i32
  %lsr156 = trunc i64 %lsr.iv143 to i32
  %32 = udiv i64 %lsr.iv129, 52428800
  %33 = mul nuw nsw i64 %32, 209715200
  %34 = udiv i32 %lsr158, 6400
  %35 = trunc i32 %34 to i13
  %36 = zext i13 %35 to i64
  %37 = mul nuw nsw i64 %36, 25600
  %38 = add i64 %33, %37
  %39 = udiv i64 %lsr.iv131, 100
  %40 = mul nuw nsw i64 %39, 25600
  %41 = sub i64 %38, %40
  %scevgep133 = getelementptr i8, ptr addrspace(1) %lsr.iv127, i64 %41
  %42 = mul nuw nsw i64 %32, 3276800
  %43 = mul nuw nsw i64 %36, 400
  %44 = add i64 %42, %43
  %45 = mul nuw nsw i64 %39, 400
  %46 = sub i64 %44, %45
  %scevgep137 = getelementptr i8, ptr addrspace(1) %lsr.iv135, i64 %46
  %47 = zext i13 %35 to i32
  %48 = mul nuw nsw i32 %47, 100
  %49 = add i32 %24, %48
  %50 = udiv i32 %lsr.iv138, 100
  %51 = mul nuw nsw i32 %50, 100
  %52 = sub i32 %49, %51
  %53 = udiv i64 %lsr.iv143, 52428800
  %54 = mul nuw nsw i64 %53, 3276800
  %55 = udiv i32 %lsr156, 6400
  %56 = trunc i32 %55 to i13
  %57 = zext i13 %56 to i64
  %58 = mul nuw nsw i64 %57, 400
  %59 = add i64 %54, %58
  %60 = udiv i64 %lsr.iv147, 100
  %61 = mul nuw nsw i64 %60, 400
  %62 = sub i64 %59, %61
  %scevgep149 = getelementptr i8, ptr addrspace(1) %lsr.iv141, i64 %62
  %63 = mul nuw nsw i64 %53, 209715200
  %64 = mul nuw nsw i64 %57, 25600
  %65 = add i64 %63, %64
  %66 = mul nuw nsw i64 %60, 25600
  %67 = sub i64 %65, %66
  %scevgep153 = getelementptr i8, ptr addrspace(1) %lsr.iv151, i64 %67
  %68 = zext i13 %56 to i32
  %69 = mul nuw nsw i32 %68, 100
  %70 = add i32 %29, %69
  %71 = udiv i32 %lsr.iv154, 100
  %72 = mul nuw nsw i32 %71, 100
  %73 = sub i32 %70, %72
  %74 = add i32 %lsr158, -1
  %Arg_0.13 = load float, ptr addrspace(1) %scevgep149, align 4, !invariant.load !24
  %75 = icmp ult i32 %74, 104857600
  %76 = add i32 %lsr.iv, %73
  %77 = zext i32 %76 to i64
  %78 = icmp ult i32 %74, 52428800
  %. = select i1 %78, i64 %6, i64 %5
  %79 = icmp ult i32 %74, 157286400
  %.110.v.v = select i1 %79, i32 128, i32 192
  %.110.v = or i32 %30, %.110.v.v
  %.110 = zext i32 %.110.v to i64
  %.sink = select i1 %75, i64 %., i64 %.110
  %Arg_1.29 = getelementptr inbounds [819200 x [256 x float]], ptr addrspace(1) %arg1116, i64 0, i64 %77, i64 %.sink
  %80 = load float, ptr addrspace(1) %Arg_1.29, align 8, !invariant.load !24
  %multiply.15 = fmul float %Arg_0.13, %80
  %add.20.i104 = fadd float %partial_reduction_result81.sroa.0.0107, %multiply.15
  store float %80, ptr addrspace(1) %scevgep153, align 8
  %Arg_0.118 = load float, ptr addrspace(1) %scevgep137, align 4, !invariant.load !24
  %81 = icmp ult i32 %lsr158, 104857600
  %82 = add i32 %lsr.iv, %52
  %83 = zext i32 %82 to i64
  %84 = icmp ult i32 %lsr158, 52428800
  %.112.v = select i1 %84, i32 %7, i32 %8
  %85 = icmp ult i32 %lsr158, 157286400
  %.113.v.v = select i1 %85, i32 129, i32 193
  %.113.v = or i32 %31, %.113.v.v
  %.sink111.v = select i1 %81, i32 %.112.v, i32 %.113.v
  %.sink111 = zext i32 %.sink111.v to i64
  %Arg_1.230 = getelementptr inbounds [819200 x [256 x float]], ptr addrspace(1) %arg1116, i64 0, i64 %83, i64 %.sink111
  %86 = load float, ptr addrspace(1) %Arg_1.230, align 4, !invariant.load !24
  %multiply.1539 = fmul float %Arg_0.118, %86
  %add.20.i105 = fadd float %partial_reduction_result81.sroa.4.0106, %multiply.1539
  store float %86, ptr addrspace(1) %scevgep133, align 4
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %87 = add i32 %9, %lsr.iv.next
  %lsr.iv.next130 = add nuw nsw i64 %lsr.iv129, 2048
  %scevgep128 = getelementptr i8, ptr addrspace(1) %lsr.iv127, i64 8192
  %lsr.iv.next132 = add nuw nsw i64 %lsr.iv131, 32
  %scevgep136 = getelementptr i8, ptr addrspace(1) %lsr.iv135, i64 128
  %lsr.iv.next139 = add nuw nsw i32 %lsr.iv138, 32
  %scevgep142 = getelementptr i8, ptr addrspace(1) %lsr.iv141, i64 128
  %lsr.iv.next144 = add nuw nsw i64 %lsr.iv143, 2048
  %lsr.iv.next148 = add nuw nsw i64 %lsr.iv147, 32
  %scevgep152 = getelementptr i8, ptr addrspace(1) %lsr.iv151, i64 8192
  %lsr.iv.next155 = add nuw nsw i32 %lsr.iv154, 32
  %88 = icmp ugt i32 %87, 67
  br i1 %88, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %89 = zext i32 %thread_id.x to i64
  %90 = zext i32 %thread_id.y82 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %89, i64 %90
  store float %add.20.i104, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %90, i64 %89
  %partial_reduction_result41 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %91 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 16, i32 31)
  %add.20.i = fadd float %partial_reduction_result41, %91
  %92 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i, i32 8, i32 31)
  %add.20.i95 = fadd float %add.20.i, %92
  %93 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i95, i32 4, i32 31)
  %add.20.i96 = fadd float %add.20.i95, %93
  %94 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i96, i32 2, i32 31)
  %add.20.i97 = fadd float %add.20.i96, %94
  %95 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i97, i32 1, i32 31)
  %add.20.i98 = fadd float %add.20.i97, %95
  store float %add.20.i98, ptr addrspace(3) %shmem_transposed_addr, align 4
  %96 = shl nuw nsw i32 %thread_id.y82, 1
  %97 = icmp eq i32 %thread_id.x, 0
  %98 = and i32 %0, 8191
  %99 = zext i32 %98 to i64
  %100 = lshr i32 %0, 13
  %101 = zext i32 %100 to i64
  %102 = zext i32 %96 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr addrspace(1) %arg2118, i64 0, i64 %99, i64 %101, i64 %102
  br i1 %97, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %103 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address55122 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.20.i105, ptr addrspace(3) %shmem_output_address55122, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr57123 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result59 = load float, ptr addrspace(3) %shmem_transposed_addr57123, align 4
  %104 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result59, i32 16, i32 31)
  %add.20.i99 = fadd float %partial_reduction_result59, %104
  %105 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i99, i32 8, i32 31)
  %add.20.i100 = fadd float %add.20.i99, %105
  %106 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i100, i32 4, i32 31)
  %add.20.i101 = fadd float %add.20.i100, %106
  %107 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i101, i32 2, i32 31)
  %add.20.i102 = fadd float %add.20.i101, %107
  %108 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.20.i102, i32 1, i32 31)
  %add.20.i103 = fadd float %add.20.i102, %108
  store float %add.20.i103, ptr addrspace(3) %shmem_transposed_addr57123, align 4
  br i1 %103, label %reduction_write_output-true73, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.20.i98, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true73:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.20.i103, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: nofree nosync nounwind memory(argmem: readwrite)
define void @copy_fusion(ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(26214400) %arg3) local_unnamed_addr #6 {
entry:
  %arg38 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !32
  %2 = shl nuw nsw i32 %0, 9
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = lshr i64 %4, 3
  %6 = shl nuw nsw i64 %5, 5
  %7 = add i32 %2, %3
  %8 = add i32 %7, 2
  %9 = lshr i32 %8, 1
  %10 = trunc i32 %9 to i2
  %11 = zext i2 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add i64 %6, %12
  %scevgep = getelementptr i8, ptr addrspace(1) %arg14, i64 %13
  %14 = shl nuw nsw i64 %4, 2
  %scevgep19 = getelementptr i8, ptr addrspace(1) %arg26, i64 %14
  %scevgep27 = getelementptr i8, ptr addrspace(1) %arg02, i64 %13
  %15 = trunc i32 %1 to i1
  %16 = zext i1 %15 to i64
  %17 = shl nuw nsw i64 %16, 4
  %18 = add i64 %6, %17
  %19 = add i64 %18, 12
  %scevgep29 = getelementptr i8, ptr addrspace(1) %arg14, i64 %19
  %scevgep35 = getelementptr i8, ptr addrspace(1) %arg02, i64 %19
  %scevgep41 = getelementptr i8, ptr addrspace(1) %arg38, i64 %14
  br label %loop.loop_body

loop.loop_body:                                   ; preds = %entry, %copy_fusion.in_bounds-after
  %lsr.iv16 = phi i64 [ 0, %entry ], [ %lsr.iv.next17, %copy_fusion.in_bounds-after ]
  %lsr.iv = phi i32 [ -442368, %entry ], [ %lsr.iv.next, %copy_fusion.in_bounds-after ]
  %20 = add i32 %linear_index_base, %lsr.iv
  %21 = add i32 %20, 442368
  %22 = icmp ult i32 %21, 6553600
  br i1 %22, label %copy_fusion.in_bounds-true, label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %copy_fusion.in_bounds-true, %loop.loop_body
  %lsr.iv.next = add nsw i32 %lsr.iv, 442368
  %lsr.iv.next17 = add nuw nsw i64 %lsr.iv16, 1769472
  %23 = icmp ugt i32 %lsr.iv.next, 6111231
  br i1 %23, label %loop.loop_exit, label %loop.loop_body, !llvm.loop !37

loop.loop_exit:                                   ; preds = %copy_fusion.in_bounds-after
  ret void

copy_fusion.in_bounds-true:                       ; preds = %loop.loop_body
  %scevgep37 = getelementptr i8, ptr addrspace(1) %scevgep35, i64 %lsr.iv16
  %scevgep38 = getelementptr i8, ptr addrspace(1) %scevgep37, i64 -12
  %24 = load <2 x float>, ptr addrspace(1) %scevgep38, align 16, !invariant.load !24
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %scevgep31 = getelementptr i8, ptr addrspace(1) %scevgep29, i64 %lsr.iv16
  %scevgep32 = getelementptr i8, ptr addrspace(1) %scevgep31, i64 -12
  %27 = load <2 x float>, ptr addrspace(1) %scevgep32, align 16, !invariant.load !24
  %28 = extractelement <2 x float> %27, i32 0
  %29 = extractelement <2 x float> %27, i32 1
  %scevgep20 = getelementptr i8, ptr addrspace(1) %scevgep19, i64 %lsr.iv16
  %scevgep42 = getelementptr i8, ptr addrspace(1) %scevgep41, i64 %lsr.iv16
  %scevgep28 = getelementptr i8, ptr addrspace(1) %scevgep27, i64 %lsr.iv16
  %30 = load float, ptr addrspace(1) %scevgep28, align 8, !invariant.load !24
  %scevgep18 = getelementptr i8, ptr addrspace(1) %scevgep, i64 %lsr.iv16
  %31 = load float, ptr addrspace(1) %scevgep18, align 8, !invariant.load !24
  %32 = load float, ptr addrspace(1) %scevgep37, align 4, !invariant.load !24
  %33 = load float, ptr addrspace(1) %scevgep31, align 4, !invariant.load !24
  %34 = insertelement <4 x float> poison, float %25, i32 0
  %35 = insertelement <4 x float> %34, float %26, i32 1
  %36 = insertelement <4 x float> %35, float %30, i32 2
  %37 = insertelement <4 x float> %36, float %32, i32 3
  store <4 x float> %37, ptr addrspace(1) %scevgep20, align 16
  %38 = insertelement <4 x float> poison, float %28, i32 0
  %39 = insertelement <4 x float> %38, float %29, i32 1
  %40 = insertelement <4 x float> %39, float %31, i32 2
  %41 = insertelement <4 x float> %40, float %33, i32 3
  store <4 x float> %41, ptr addrspace(1) %scevgep42, align 16
  br label %copy_fusion.in_bounds-after
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #8

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #3 = { nounwind }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { convergent nocallback nounwind }
attributes #6 = { nofree nosync nounwind memory(argmem: readwrite) }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #8 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}
!llvm.module.flags = !{!21}

!0 = !{ptr @fusion_11, !"kernel", i32 1}
!1 = !{ptr @fusion_11, !"reqntidx", i32 256}
!2 = !{ptr @fusion_10, !"kernel", i32 1}
!3 = !{ptr @fusion_10, !"reqntidx", i32 256}
!4 = !{ptr @fusion_8, !"kernel", i32 1}
!5 = !{ptr @fusion_8, !"reqntidx", i32 96}
!6 = !{ptr @fusion_6, !"kernel", i32 1}
!7 = !{ptr @fusion_6, !"reqntidx", i32 96}
!8 = !{ptr @fusion_4, !"kernel", i32 1}
!9 = !{ptr @fusion_4, !"reqntidx", i32 96}
!10 = !{ptr @fusion_3, !"kernel", i32 1}
!11 = !{ptr @fusion_3, !"reqntidx", i32 256}
!12 = !{ptr @fusion_2, !"kernel", i32 1}
!13 = !{ptr @fusion_2, !"reqntidx", i32 256}
!14 = !{ptr @add_44, !"kernel", i32 1}
!15 = !{ptr @add_44, !"reqntidx", i32 128}
!16 = !{ptr @fusion, !"kernel", i32 1}
!17 = !{ptr @fusion, !"reqntidx", i32 1024}
!18 = !{ptr @copy_fusion, !"kernel", i32 1}
!19 = !{ptr @copy_fusion, !"reqntidx", i32 128}
!20 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!21 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!22 = !{i32 0, i32 2048}
!23 = !{i32 0, i32 256}
!24 = !{}
!25 = !{i32 0, i32 160000}
!26 = !{i32 0, i32 96}
!27 = !{i32 0, i32 1092267}
!28 = !{i32 0, i32 10923}
!29 = !{i32 0, i32 3200}
!30 = !{i32 0, i32 121600}
!31 = !{i32 0, i32 864}
!32 = !{i32 0, i32 128}
!33 = distinct !{!33, !34}
!34 = !{!"llvm.loop.vectorize.enable", i1 false}
!35 = !{i32 0, i32 32768}
!36 = !{i32 0, i32 1024}
!37 = distinct !{!37, !34}
