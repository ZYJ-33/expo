target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_23 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\F3\045>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_22 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\80>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_18 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\80\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@tr_tile_0 = private unnamed_addr addrspace(3) global [1 x [32 x [33 x float]]] undef
@"shared_cache_$_0" = internal unnamed_addr addrspace(3) global float undef
@"shared_cache1_$_0" = internal unnamed_addr addrspace(3) global float undef
@shared_cache2 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache4 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache5 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define void @copy_fusion(ptr noalias nocapture readonly align 128 dereferenceable(4) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(4) %arg3) local_unnamed_addr #0 {
entry:
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = load float, ptr addrspace(1) %arg01, align 128, !invariant.load !75
  %1 = load float, ptr addrspace(1) %arg13, align 128, !invariant.load !75
  store float %0, ptr addrspace(1) %arg25, align 128
  store float %1, ptr addrspace(1) %arg37, align 128
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_17(ptr noalias nocapture readonly align 16 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(40960) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(172032) %arg2) local_unnamed_addr #2 {
entry:
  %arg26 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg14 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg02 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !76
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !77
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = and i32 %1, 255
  %4 = lshr i32 %linear_index, 8
  %5 = icmp ult i32 %linear_index, 32768
  br i1 %5, label %concatenate.pivot.0., label %concatenate.pivot.128.1

concatenate.pivot.0.:                             ; preds = %entry
  %6 = zext i32 %4 to i64
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds [128 x [256 x float]], ptr addrspace(1) %arg02, i64 0, i64 %6, i64 %7
  br label %concatenate.3.merge

concatenate.pivot.128.1:                          ; preds = %entry
  %9 = zext i32 %3 to i64
  %10 = sext i32 %4 to i64
  %11 = getelementptr [40 x [256 x float]], ptr addrspace(1) %arg14, i64 0, i64 %10, i64 %9
  %12 = getelementptr inbounds float, ptr addrspace(1) %11, i64 -32768
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.128.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %8, %concatenate.pivot.0. ], [ %12, %concatenate.pivot.128.1 ]
  %13 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !75
  %14 = zext i32 %linear_index to i64
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg26, i64 %14
  store float %13, ptr addrspace(1) %15, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_19(ptr noalias nocapture readonly align 16 dereferenceable(991232) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1056768) %arg2) local_unnamed_addr #2 {
entry:
  %arg233 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg131 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg029 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !78
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
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
  %9 = icmp ult i32 %linear_index_base, 247808
  br i1 %9, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %entry
  %10 = zext i32 %5 to i64
  %11 = zext i32 %4 to i64
  %12 = getelementptr inbounds [968 x [256 x float]], ptr addrspace(1) %arg029, i64 0, i64 %10, i64 %11
  br label %concatenate.3.merge

concatenate.pivot.968.1:                          ; preds = %entry
  %13 = zext i32 %4 to i64
  %14 = sext i32 %5 to i64
  %15 = getelementptr [64 x [256 x float]], ptr addrspace(1) %arg131, i64 0, i64 %14, i64 %13
  %16 = getelementptr inbounds float, ptr addrspace(1) %15, i64 -247808
  br label %concatenate.3.merge

concatenate.3.merge:                              ; preds = %concatenate.pivot.968.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %12, %concatenate.pivot.0. ], [ %16, %concatenate.pivot.968.1 ]
  %17 = icmp ult i32 %linear_index_base, 247808
  %18 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !75
  %19 = zext i32 %linear_index_base to i64
  %20 = getelementptr float, ptr addrspace(1) %arg233, i64 %19
  store float %18, ptr addrspace(1) %20, align 16
  br i1 %17, label %concatenate.pivot.0.6, label %concatenate.pivot.968.7

concatenate.pivot.0.6:                            ; preds = %concatenate.3.merge
  %21 = zext i32 %5 to i64
  %22 = zext i32 %6 to i64
  %23 = getelementptr inbounds [968 x [256 x float]], ptr addrspace(1) %arg029, i64 0, i64 %21, i64 %22
  br label %concatenate.3.merge2

concatenate.pivot.968.7:                          ; preds = %concatenate.3.merge
  %24 = zext i32 %6 to i64
  %25 = sext i32 %5 to i64
  %26 = getelementptr [64 x [256 x float]], ptr addrspace(1) %arg131, i64 0, i64 %25, i64 %24
  %27 = getelementptr inbounds float, ptr addrspace(1) %26, i64 -247808
  br label %concatenate.3.merge2

concatenate.3.merge2:                             ; preds = %concatenate.pivot.968.7, %concatenate.pivot.0.6
  %.in26 = phi ptr addrspace(1) [ %23, %concatenate.pivot.0.6 ], [ %27, %concatenate.pivot.968.7 ]
  %28 = icmp ult i32 %linear_index_base, 247808
  %29 = load float, ptr addrspace(1) %.in26, align 4, !invariant.load !75
  %30 = getelementptr inbounds float, ptr addrspace(1) %20, i64 1
  store float %29, ptr addrspace(1) %30, align 4
  br i1 %28, label %concatenate.pivot.0.12, label %concatenate.pivot.968.13

concatenate.pivot.0.12:                           ; preds = %concatenate.3.merge2
  %31 = zext i32 %5 to i64
  %32 = zext i32 %7 to i64
  %33 = getelementptr inbounds [968 x [256 x float]], ptr addrspace(1) %arg029, i64 0, i64 %31, i64 %32
  br label %concatenate.3.merge8

concatenate.pivot.968.13:                         ; preds = %concatenate.3.merge2
  %34 = zext i32 %7 to i64
  %35 = sext i32 %5 to i64
  %36 = getelementptr [64 x [256 x float]], ptr addrspace(1) %arg131, i64 0, i64 %35, i64 %34
  %37 = getelementptr inbounds float, ptr addrspace(1) %36, i64 -247808
  br label %concatenate.3.merge8

concatenate.3.merge8:                             ; preds = %concatenate.pivot.968.13, %concatenate.pivot.0.12
  %.in27 = phi ptr addrspace(1) [ %33, %concatenate.pivot.0.12 ], [ %37, %concatenate.pivot.968.13 ]
  %38 = icmp ult i32 %linear_index_base, 247808
  %39 = load float, ptr addrspace(1) %.in27, align 4, !invariant.load !75
  %40 = getelementptr inbounds float, ptr addrspace(1) %20, i64 2
  store float %39, ptr addrspace(1) %40, align 8
  br i1 %38, label %concatenate.pivot.0.18, label %concatenate.pivot.968.19

concatenate.pivot.0.18:                           ; preds = %concatenate.3.merge8
  %41 = zext i32 %5 to i64
  %42 = zext i32 %8 to i64
  %43 = getelementptr inbounds [968 x [256 x float]], ptr addrspace(1) %arg029, i64 0, i64 %41, i64 %42
  br label %concatenate.3.merge14

concatenate.pivot.968.19:                         ; preds = %concatenate.3.merge8
  %44 = zext i32 %8 to i64
  %45 = sext i32 %5 to i64
  %46 = getelementptr [64 x [256 x float]], ptr addrspace(1) %arg131, i64 0, i64 %45, i64 %44
  %47 = getelementptr inbounds float, ptr addrspace(1) %46, i64 -247808
  br label %concatenate.3.merge14

concatenate.3.merge14:                            ; preds = %concatenate.pivot.968.19, %concatenate.pivot.0.18
  %.in28 = phi ptr addrspace(1) [ %43, %concatenate.pivot.0.18 ], [ %47, %concatenate.pivot.968.19 ]
  %48 = load float, ptr addrspace(1) %.in28, align 4, !invariant.load !75
  %49 = getelementptr inbounds float, ptr addrspace(1) %20, i64 3
  store float %48, ptr addrspace(1) %49, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(33816576) %arg2) local_unnamed_addr #2 {
entry:
  %arg240 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg138 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg036 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !80
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
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
  %9 = icmp ult i32 %.decomposed, 968
  br i1 %9, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %entry
  %10 = udiv i32 %linear_index_base, 1032
  %11 = mul nuw nsw i32 %10, 968
  %12 = add nuw nsw i32 %11, %.decomposed
  br label %concatenate.5.merge

concatenate.pivot.968.1:                          ; preds = %entry
  %13 = add nsw i32 %.decomposed, -968
  %14 = udiv i32 %linear_index_base, 1032
  %15 = shl nuw nsw i32 %14, 6
  %16 = add nuw nsw i32 %13, %15
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.968.1, %concatenate.pivot.0.
  %.sink29 = phi i32 [ %16, %concatenate.pivot.968.1 ], [ %12, %concatenate.pivot.0. ]
  %arg0.sink = phi ptr addrspace(1) [ %arg036, %concatenate.pivot.968.1 ], [ %arg138, %concatenate.pivot.0. ]
  %17 = zext i32 %.sink29 to i64
  %18 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink, i64 %17
  %19 = load float, ptr addrspace(1) %18, align 4, !invariant.load !75
  %20 = zext i32 %linear_index_base to i64
  %21 = getelementptr float, ptr addrspace(1) %arg240, i64 %20
  store float %19, ptr addrspace(1) %21, align 16
  %22 = icmp ult i32 %6, 968
  br i1 %22, label %concatenate.pivot.0.6, label %concatenate.pivot.968.7

concatenate.pivot.0.6:                            ; preds = %concatenate.5.merge
  %23 = udiv i32 %linear_index_base, 1032
  %24 = mul nuw nsw i32 %23, 968
  %25 = add nuw nsw i32 %24, %6
  br label %concatenate.5.merge2

concatenate.pivot.968.7:                          ; preds = %concatenate.5.merge
  %26 = add nsw i32 %6, -968
  %27 = udiv i32 %linear_index_base, 1032
  %28 = shl nuw nsw i32 %27, 6
  %29 = add nuw nsw i32 %26, %28
  br label %concatenate.5.merge2

concatenate.5.merge2:                             ; preds = %concatenate.pivot.968.7, %concatenate.pivot.0.6
  %.sink31 = phi i32 [ %29, %concatenate.pivot.968.7 ], [ %25, %concatenate.pivot.0.6 ]
  %arg0.sink30 = phi ptr addrspace(1) [ %arg036, %concatenate.pivot.968.7 ], [ %arg138, %concatenate.pivot.0.6 ]
  %30 = zext i32 %.sink31 to i64
  %31 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink30, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !75
  %33 = getelementptr inbounds float, ptr addrspace(1) %21, i64 1
  store float %32, ptr addrspace(1) %33, align 4
  %34 = icmp ult i32 %7, 968
  br i1 %34, label %concatenate.pivot.0.12, label %concatenate.pivot.968.13

concatenate.pivot.0.12:                           ; preds = %concatenate.5.merge2
  %35 = udiv i32 %linear_index_base, 1032
  %36 = mul nuw nsw i32 %35, 968
  %37 = add nuw nsw i32 %36, %7
  br label %concatenate.5.merge8

concatenate.pivot.968.13:                         ; preds = %concatenate.5.merge2
  %38 = add nsw i32 %7, -968
  %39 = udiv i32 %linear_index_base, 1032
  %40 = shl nuw nsw i32 %39, 6
  %41 = add nuw nsw i32 %38, %40
  br label %concatenate.5.merge8

concatenate.5.merge8:                             ; preds = %concatenate.pivot.968.13, %concatenate.pivot.0.12
  %.sink33 = phi i32 [ %41, %concatenate.pivot.968.13 ], [ %37, %concatenate.pivot.0.12 ]
  %arg0.sink32 = phi ptr addrspace(1) [ %arg036, %concatenate.pivot.968.13 ], [ %arg138, %concatenate.pivot.0.12 ]
  %42 = zext i32 %.sink33 to i64
  %43 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink32, i64 %42
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !75
  %45 = getelementptr inbounds float, ptr addrspace(1) %21, i64 2
  store float %44, ptr addrspace(1) %45, align 8
  %46 = icmp ult i32 %8, 968
  br i1 %46, label %concatenate.pivot.0.18, label %concatenate.pivot.968.19

concatenate.pivot.0.18:                           ; preds = %concatenate.5.merge8
  %47 = udiv i32 %linear_index_base, 1032
  %48 = mul nuw nsw i32 %47, 968
  %49 = add nuw nsw i32 %48, %8
  br label %concatenate.5.merge14

concatenate.pivot.968.19:                         ; preds = %concatenate.5.merge8
  %50 = add nsw i32 %8, -968
  %51 = shl nuw nsw i32 %4, 6
  %52 = add nuw nsw i32 %50, %51
  br label %concatenate.5.merge14

concatenate.5.merge14:                            ; preds = %concatenate.pivot.968.19, %concatenate.pivot.0.18
  %.sink35 = phi i32 [ %52, %concatenate.pivot.968.19 ], [ %49, %concatenate.pivot.0.18 ]
  %arg0.sink34 = phi ptr addrspace(1) [ %arg036, %concatenate.pivot.968.19 ], [ %arg138, %concatenate.pivot.0.18 ]
  %53 = zext i32 %.sink35 to i64
  %54 = getelementptr inbounds float, ptr addrspace(1) %arg0.sink34, i64 %53
  %55 = load float, ptr addrspace(1) %54, align 4, !invariant.load !75
  %56 = getelementptr inbounds float, ptr addrspace(1) %21, i64 3
  store float %55, ptr addrspace(1) %56, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_14(ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(131072000) %arg5) local_unnamed_addr #2 {
entry:
  %arg576 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg474 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg372 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg270 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg066 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !81
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 40
  %5 = mul i32 %4, 40
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 40
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 40
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 40
  %9 = icmp ult i32 %.decomposed, 16
  br i1 %9, label %concatenate.pivot.8., label %concatenate.pivot.24.

concatenate.pivot.8.:                             ; preds = %entry
  %10 = icmp ult i32 %.decomposed, 8
  br i1 %10, label %concatenate.pivot.0., label %concatenate.pivot.8.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.8.
  %11 = shl nuw nsw i32 %4, 3
  %12 = add nuw nsw i32 %11, %.decomposed
  br label %concatenate.6.merge

concatenate.pivot.8.1:                            ; preds = %concatenate.pivot.8.
  %13 = add nsw i32 %.decomposed, -8
  %14 = shl nuw nsw i32 %4, 3
  %15 = add nuw nsw i32 %13, %14
  br label %concatenate.6.merge

concatenate.pivot.24.:                            ; preds = %entry
  %16 = icmp ult i32 %.decomposed, 24
  %17 = shl nuw nsw i32 %4, 3
  br i1 %16, label %concatenate.pivot.16.2, label %concatenate.pivot.32.

concatenate.pivot.16.2:                           ; preds = %concatenate.pivot.24.
  %18 = add nsw i32 %.decomposed, -16
  %19 = add nuw nsw i32 %18, %17
  br label %concatenate.6.merge

concatenate.pivot.32.:                            ; preds = %concatenate.pivot.24.
  %20 = icmp ult i32 %.decomposed, 32
  br i1 %20, label %concatenate.pivot.24.3, label %concatenate.pivot.32.4

concatenate.pivot.24.3:                           ; preds = %concatenate.pivot.32.
  %21 = add nsw i32 %.decomposed, -24
  %22 = add nuw nsw i32 %21, %17
  br label %concatenate.6.merge

concatenate.pivot.32.4:                           ; preds = %concatenate.pivot.32.
  %23 = add nsw i32 %.decomposed, -32
  %24 = add nuw nsw i32 %23, %17
  br label %concatenate.6.merge

concatenate.6.merge:                              ; preds = %concatenate.pivot.32.4, %concatenate.pivot.24.3, %concatenate.pivot.16.2, %concatenate.pivot.8.1, %concatenate.pivot.0.
  %.sink59 = phi i32 [ %24, %concatenate.pivot.32.4 ], [ %22, %concatenate.pivot.24.3 ], [ %19, %concatenate.pivot.16.2 ], [ %15, %concatenate.pivot.8.1 ], [ %12, %concatenate.pivot.0. ]
  %arg4.sink = phi ptr addrspace(1) [ %arg474, %concatenate.pivot.32.4 ], [ %arg372, %concatenate.pivot.24.3 ], [ %arg270, %concatenate.pivot.16.2 ], [ %arg168, %concatenate.pivot.8.1 ], [ %arg066, %concatenate.pivot.0. ]
  %25 = zext i32 %.sink59 to i64
  %26 = getelementptr inbounds float, ptr addrspace(1) %arg4.sink, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !75
  %28 = zext i32 %linear_index_base to i64
  %29 = getelementptr float, ptr addrspace(1) %arg576, i64 %28
  store float %27, ptr addrspace(1) %29, align 16
  %30 = icmp ult i32 %6, 16
  br i1 %30, label %concatenate.pivot.8.12, label %concatenate.pivot.24.15

concatenate.pivot.8.12:                           ; preds = %concatenate.6.merge
  %31 = icmp ult i32 %6, 8
  br i1 %31, label %concatenate.pivot.0.13, label %concatenate.pivot.8.14

concatenate.pivot.0.13:                           ; preds = %concatenate.pivot.8.12
  %32 = shl nuw nsw i32 %4, 3
  %33 = add nuw nsw i32 %32, %6
  br label %concatenate.6.merge5

concatenate.pivot.8.14:                           ; preds = %concatenate.pivot.8.12
  %34 = add nsw i32 %6, -8
  %35 = shl nuw nsw i32 %4, 3
  %36 = add nuw nsw i32 %34, %35
  br label %concatenate.6.merge5

concatenate.pivot.24.15:                          ; preds = %concatenate.6.merge
  %37 = icmp ult i32 %6, 24
  %38 = shl nuw nsw i32 %4, 3
  br i1 %37, label %concatenate.pivot.16.16, label %concatenate.pivot.32.17

concatenate.pivot.16.16:                          ; preds = %concatenate.pivot.24.15
  %39 = add nsw i32 %6, -16
  %40 = add nuw nsw i32 %39, %38
  br label %concatenate.6.merge5

concatenate.pivot.32.17:                          ; preds = %concatenate.pivot.24.15
  %41 = icmp ult i32 %6, 32
  br i1 %41, label %concatenate.pivot.24.18, label %concatenate.pivot.32.19

concatenate.pivot.24.18:                          ; preds = %concatenate.pivot.32.17
  %42 = add nsw i32 %6, -24
  %43 = add nuw nsw i32 %42, %38
  br label %concatenate.6.merge5

concatenate.pivot.32.19:                          ; preds = %concatenate.pivot.32.17
  %44 = add nsw i32 %6, -32
  %45 = add nuw nsw i32 %44, %38
  br label %concatenate.6.merge5

concatenate.6.merge5:                             ; preds = %concatenate.pivot.32.19, %concatenate.pivot.24.18, %concatenate.pivot.16.16, %concatenate.pivot.8.14, %concatenate.pivot.0.13
  %.sink61 = phi i32 [ %45, %concatenate.pivot.32.19 ], [ %43, %concatenate.pivot.24.18 ], [ %40, %concatenate.pivot.16.16 ], [ %36, %concatenate.pivot.8.14 ], [ %33, %concatenate.pivot.0.13 ]
  %arg4.sink60 = phi ptr addrspace(1) [ %arg474, %concatenate.pivot.32.19 ], [ %arg372, %concatenate.pivot.24.18 ], [ %arg270, %concatenate.pivot.16.16 ], [ %arg168, %concatenate.pivot.8.14 ], [ %arg066, %concatenate.pivot.0.13 ]
  %46 = zext i32 %.sink61 to i64
  %47 = getelementptr inbounds float, ptr addrspace(1) %arg4.sink60, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !75
  %49 = getelementptr inbounds float, ptr addrspace(1) %29, i64 1
  store float %48, ptr addrspace(1) %49, align 4
  %50 = icmp ult i32 %7, 16
  br i1 %50, label %concatenate.pivot.8.27, label %concatenate.pivot.24.30

concatenate.pivot.8.27:                           ; preds = %concatenate.6.merge5
  %51 = icmp ult i32 %7, 8
  br i1 %51, label %concatenate.pivot.0.28, label %concatenate.pivot.8.29

concatenate.pivot.0.28:                           ; preds = %concatenate.pivot.8.27
  %52 = shl nuw nsw i32 %4, 3
  %53 = add nuw nsw i32 %52, %7
  br label %concatenate.6.merge20

concatenate.pivot.8.29:                           ; preds = %concatenate.pivot.8.27
  %54 = add nsw i32 %7, -8
  %55 = shl nuw nsw i32 %4, 3
  %56 = add nuw nsw i32 %54, %55
  br label %concatenate.6.merge20

concatenate.pivot.24.30:                          ; preds = %concatenate.6.merge5
  %57 = icmp ult i32 %7, 24
  %58 = shl nuw nsw i32 %4, 3
  br i1 %57, label %concatenate.pivot.16.31, label %concatenate.pivot.32.32

concatenate.pivot.16.31:                          ; preds = %concatenate.pivot.24.30
  %59 = add nsw i32 %7, -16
  %60 = add nuw nsw i32 %59, %58
  br label %concatenate.6.merge20

concatenate.pivot.32.32:                          ; preds = %concatenate.pivot.24.30
  %61 = icmp ult i32 %7, 32
  br i1 %61, label %concatenate.pivot.24.33, label %concatenate.pivot.32.34

concatenate.pivot.24.33:                          ; preds = %concatenate.pivot.32.32
  %62 = add nsw i32 %7, -24
  %63 = add nuw nsw i32 %62, %58
  br label %concatenate.6.merge20

concatenate.pivot.32.34:                          ; preds = %concatenate.pivot.32.32
  %64 = add nsw i32 %7, -32
  %65 = add nuw nsw i32 %64, %58
  br label %concatenate.6.merge20

concatenate.6.merge20:                            ; preds = %concatenate.pivot.32.34, %concatenate.pivot.24.33, %concatenate.pivot.16.31, %concatenate.pivot.8.29, %concatenate.pivot.0.28
  %.sink63 = phi i32 [ %65, %concatenate.pivot.32.34 ], [ %63, %concatenate.pivot.24.33 ], [ %60, %concatenate.pivot.16.31 ], [ %56, %concatenate.pivot.8.29 ], [ %53, %concatenate.pivot.0.28 ]
  %arg4.sink62 = phi ptr addrspace(1) [ %arg474, %concatenate.pivot.32.34 ], [ %arg372, %concatenate.pivot.24.33 ], [ %arg270, %concatenate.pivot.16.31 ], [ %arg168, %concatenate.pivot.8.29 ], [ %arg066, %concatenate.pivot.0.28 ]
  %66 = zext i32 %.sink63 to i64
  %67 = getelementptr inbounds float, ptr addrspace(1) %arg4.sink62, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !75
  %69 = getelementptr inbounds float, ptr addrspace(1) %29, i64 2
  store float %68, ptr addrspace(1) %69, align 8
  %70 = icmp ult i32 %8, 16
  br i1 %70, label %concatenate.pivot.8.42, label %concatenate.pivot.24.45

concatenate.pivot.8.42:                           ; preds = %concatenate.6.merge20
  %71 = icmp ult i32 %8, 8
  br i1 %71, label %concatenate.pivot.0.43, label %concatenate.pivot.8.44

concatenate.pivot.0.43:                           ; preds = %concatenate.pivot.8.42
  %72 = shl nuw nsw i32 %4, 3
  %73 = add nuw nsw i32 %72, %8
  br label %concatenate.6.merge35

concatenate.pivot.8.44:                           ; preds = %concatenate.pivot.8.42
  %74 = add nsw i32 %8, -8
  %75 = shl nuw nsw i32 %4, 3
  %76 = add nuw nsw i32 %74, %75
  br label %concatenate.6.merge35

concatenate.pivot.24.45:                          ; preds = %concatenate.6.merge20
  %77 = icmp ult i32 %8, 24
  %78 = shl nuw nsw i32 %4, 3
  br i1 %77, label %concatenate.pivot.16.46, label %concatenate.pivot.32.47

concatenate.pivot.16.46:                          ; preds = %concatenate.pivot.24.45
  %79 = add nsw i32 %8, -16
  %80 = add nuw nsw i32 %79, %78
  br label %concatenate.6.merge35

concatenate.pivot.32.47:                          ; preds = %concatenate.pivot.24.45
  %81 = icmp ult i32 %8, 32
  br i1 %81, label %concatenate.pivot.24.48, label %concatenate.pivot.32.49

concatenate.pivot.24.48:                          ; preds = %concatenate.pivot.32.47
  %82 = add nsw i32 %8, -24
  %83 = add nuw nsw i32 %82, %78
  br label %concatenate.6.merge35

concatenate.pivot.32.49:                          ; preds = %concatenate.pivot.32.47
  %84 = add nsw i32 %8, -32
  %85 = add nuw nsw i32 %84, %78
  br label %concatenate.6.merge35

concatenate.6.merge35:                            ; preds = %concatenate.pivot.32.49, %concatenate.pivot.24.48, %concatenate.pivot.16.46, %concatenate.pivot.8.44, %concatenate.pivot.0.43
  %.sink65 = phi i32 [ %85, %concatenate.pivot.32.49 ], [ %83, %concatenate.pivot.24.48 ], [ %80, %concatenate.pivot.16.46 ], [ %76, %concatenate.pivot.8.44 ], [ %73, %concatenate.pivot.0.43 ]
  %arg4.sink64 = phi ptr addrspace(1) [ %arg474, %concatenate.pivot.32.49 ], [ %arg372, %concatenate.pivot.24.48 ], [ %arg270, %concatenate.pivot.16.46 ], [ %arg168, %concatenate.pivot.8.44 ], [ %arg066, %concatenate.pivot.0.43 ]
  %86 = zext i32 %.sink65 to i64
  %87 = getelementptr inbounds float, ptr addrspace(1) %arg4.sink64, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4, !invariant.load !75
  %89 = getelementptr inbounds float, ptr addrspace(1) %29, i64 3
  store float %88, ptr addrspace(1) %89, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_31(ptr noalias nocapture readonly align 128 dereferenceable(131072000) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(20971520) %arg1) local_unnamed_addr #3 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !82
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 40
  %5 = urem i32 %linear_index3, 40
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = urem i32 %linear_index2, 40
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = urem i32 %linear_index1, 40
  %8 = mul i32 %4, 40
  %.decomposed = sub i32 %linear_index_base.frozen, %8
  %9 = and i32 %4, 15
  %10 = udiv i32 %linear_index_base, 640
  %11 = zext i32 %10 to i64
  %12 = zext i32 %9 to i64
  %13 = zext i32 %.decomposed to i64
  %14 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !75
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg13, i64 %16
  %18 = zext i32 %7 to i64
  %19 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 %18
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !75
  %21 = zext i32 %6 to i64
  %22 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !75
  %24 = zext i32 %5 to i64
  %25 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !75
  %27 = insertelement <4 x float> poison, float %15, i32 0
  %28 = insertelement <4 x float> %27, float %20, i32 1
  %29 = insertelement <4 x float> %28, float %23, i32 2
  %30 = insertelement <4 x float> %29, float %26, i32 3
  store <4 x float> %30, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_41(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg3) local_unnamed_addr #3 {
entry:
  %arg383 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg281 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg179 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg077 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !83
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 12
  %5 = lshr i32 %1, 2
  %6 = and i32 %5, 15
  %7 = lshr i32 %linear_index_base, 8
  %8 = and i32 %7, 8191
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = and i32 %linear_index1, 13
  %linear_index2 = or i32 %linear_index_base, 2
  %10 = and i32 %linear_index2, 14
  %linear_index3 = or i32 %linear_index_base, 3
  %11 = and i32 %linear_index3, 15
  %.not.not = icmp ult i32 %0, 2048
  %12 = or i32 %4, 16
  %.sink54 = select i1 %.not.not, i32 %4, i32 %12
  %13 = shl nuw nsw i32 %8, 4
  %14 = or i32 %13, %6
  %15 = zext i32 %14 to i64
  %16 = zext i32 %.sink54 to i64
  %17 = getelementptr inbounds [131072 x [32 x float]], ptr addrspace(1) %arg077, i64 0, i64 %15, i64 %16
  %18 = load float, ptr addrspace(1) %17, align 16, !invariant.load !75
  %19 = getelementptr inbounds [131072 x [32 x float]], ptr addrspace(1) %arg179, i64 0, i64 %15, i64 %16
  %20 = load float, ptr addrspace(1) %19, align 16, !invariant.load !75
  %21 = zext i32 %linear_index_base to i64
  %22 = getelementptr float, ptr addrspace(1) %arg281, i64 %21
  %23 = getelementptr float, ptr addrspace(1) %arg383, i64 %21
  %24 = or i32 %9, 16
  %.sink60 = select i1 %.not.not, i32 %9, i32 %24
  %25 = zext i32 %.sink60 to i64
  %26 = getelementptr inbounds [131072 x [32 x float]], ptr addrspace(1) %arg077, i64 0, i64 %15, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !75
  %28 = getelementptr inbounds [131072 x [32 x float]], ptr addrspace(1) %arg179, i64 0, i64 %15, i64 %25
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !75
  %30 = or i32 %10, 16
  %.sink66 = select i1 %.not.not, i32 %10, i32 %30
  %31 = zext i32 %.sink66 to i64
  %32 = getelementptr inbounds [131072 x [32 x float]], ptr addrspace(1) %arg077, i64 0, i64 %15, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 8, !invariant.load !75
  %34 = getelementptr inbounds [131072 x [32 x float]], ptr addrspace(1) %arg179, i64 0, i64 %15, i64 %31
  %35 = load float, ptr addrspace(1) %34, align 8, !invariant.load !75
  %36 = or i32 %11, 16
  %.sink72 = select i1 %.not.not, i32 %11, i32 %36
  %37 = zext i32 %.sink72 to i64
  %38 = getelementptr inbounds [131072 x [32 x float]], ptr addrspace(1) %arg077, i64 0, i64 %15, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4, !invariant.load !75
  %40 = getelementptr inbounds [131072 x [32 x float]], ptr addrspace(1) %arg179, i64 0, i64 %15, i64 %37
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !75
  %42 = insertelement <4 x float> poison, float %18, i32 0
  %43 = insertelement <4 x float> %42, float %27, i32 1
  %44 = insertelement <4 x float> %43, float %33, i32 2
  %45 = insertelement <4 x float> %44, float %39, i32 3
  store <4 x float> %45, ptr addrspace(1) %22, align 16
  %46 = insertelement <4 x float> poison, float %20, i32 0
  %47 = insertelement <4 x float> %46, float %29, i32 1
  %48 = insertelement <4 x float> %47, float %35, i32 2
  %49 = insertelement <4 x float> %48, float %41, i32 3
  store <4 x float> %49, ptr addrspace(1) %23, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_12(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(419430400) %arg2) local_unnamed_addr #2 {
entry:
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 124
  %5 = lshr i32 %linear_index_base, 7
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = and i32 %linear_index1, 125
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 126
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = and i32 %linear_index3, 127
  %9 = icmp ult i32 %4, 64
  %10 = add nsw i32 %4, -64
  %11 = shl nuw nsw i32 %5, 6
  %.sink30 = select i1 %9, i32 %4, i32 %11
  %.sink = select i1 %9, i32 %11, i32 %10
  %arg1.sink = select i1 %9, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %12 = add nuw nsw i32 %.sink, %.sink30
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 16, !invariant.load !75
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg250, i64 %16
  %18 = icmp ult i32 %6, 64
  %19 = add nsw i32 %6, -64
  %.sink35 = select i1 %18, i32 %6, i32 %11
  %.sink34 = select i1 %18, i32 %11, i32 %19
  %arg1.sink31 = select i1 %18, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %20 = add nuw nsw i32 %.sink34, %.sink35
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink31, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !75
  %24 = icmp ult i32 %7, 64
  %25 = add nsw i32 %7, -64
  %.sink40 = select i1 %24, i32 %7, i32 %11
  %.sink39 = select i1 %24, i32 %11, i32 %25
  %arg1.sink36 = select i1 %24, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %26 = add nuw nsw i32 %.sink39, %.sink40
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink36, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !75
  %30 = icmp ult i32 %8, 64
  %31 = add nsw i32 %8, -64
  %.sink45 = select i1 %30, i32 %8, i32 %11
  %.sink44 = select i1 %30, i32 %11, i32 %31
  %arg1.sink41 = select i1 %30, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %32 = add nuw nsw i32 %.sink44, %.sink45
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink41, i64 %33
  %35 = load float, ptr addrspace(1) %34, align 4, !invariant.load !75
  %36 = insertelement <4 x float> poison, float %15, i32 0
  %37 = insertelement <4 x float> %36, float %23, i32 1
  %38 = insertelement <4 x float> %37, float %29, i32 2
  %39 = insertelement <4 x float> %38, float %35, i32 3
  store <4 x float> %39, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_32(ptr noalias nocapture readonly align 128 dereferenceable(419430400) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(67108864) %arg1) local_unnamed_addr #3 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 7
  %5 = and i32 %linear_index3, 127
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 126
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 125
  %8 = and i32 %3, 124
  %9 = and i32 %4, 15
  %10 = lshr i32 %0, 1
  %11 = zext i32 %10 to i64
  %12 = zext i32 %9 to i64
  %13 = zext i32 %8 to i64
  %14 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 %13
  %15 = load <2 x float>, ptr addrspace(1) %14, align 16, !invariant.load !75
  %16 = extractelement <2 x float> %15, i32 0
  %17 = extractelement <2 x float> %15, i32 1
  %18 = zext i32 %linear_index_base to i64
  %19 = getelementptr float, ptr addrspace(1) %arg13, i64 %18
  %20 = zext i32 %7 to i64
  %21 = zext i32 %6 to i64
  %22 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 8, !invariant.load !75
  %24 = zext i32 %5 to i64
  %25 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %11, i64 %12, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !75
  %27 = insertelement <4 x float> poison, float %16, i32 0
  %28 = insertelement <4 x float> %27, float %17, i32 1
  %29 = insertelement <4 x float> %28, float %23, i32 2
  %30 = insertelement <4 x float> %29, float %26, i32 3
  store <4 x float> %30, ptr addrspace(1) %19, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_42(ptr noalias nocapture readonly align 128 dereferenceable(33554432) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(33554432) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(33554432) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(33554432) %arg3) local_unnamed_addr #3 {
entry:
  %arg383 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg281 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg179 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg077 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !86
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 28
  %5 = lshr i32 %1, 3
  %6 = and i32 %5, 15
  %7 = lshr i32 %linear_index_base, 9
  %8 = and i32 %7, 8191
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = and i32 %linear_index1, 29
  %linear_index2 = or i32 %linear_index_base, 2
  %10 = and i32 %linear_index2, 30
  %linear_index3 = or i32 %linear_index_base, 3
  %11 = and i32 %linear_index3, 31
  %.not.not = icmp ult i32 %0, 4096
  %12 = or i32 %4, 32
  %.sink54 = select i1 %.not.not, i32 %4, i32 %12
  %13 = shl nuw nsw i32 %8, 4
  %14 = or i32 %13, %6
  %15 = zext i32 %14 to i64
  %16 = zext i32 %.sink54 to i64
  %17 = getelementptr inbounds [131072 x [64 x float]], ptr addrspace(1) %arg077, i64 0, i64 %15, i64 %16
  %18 = load float, ptr addrspace(1) %17, align 16, !invariant.load !75
  %19 = getelementptr inbounds [131072 x [64 x float]], ptr addrspace(1) %arg179, i64 0, i64 %15, i64 %16
  %20 = load float, ptr addrspace(1) %19, align 16, !invariant.load !75
  %21 = zext i32 %linear_index_base to i64
  %22 = getelementptr float, ptr addrspace(1) %arg281, i64 %21
  %23 = getelementptr float, ptr addrspace(1) %arg383, i64 %21
  %24 = or i32 %9, 32
  %.sink60 = select i1 %.not.not, i32 %9, i32 %24
  %25 = zext i32 %.sink60 to i64
  %26 = getelementptr inbounds [131072 x [64 x float]], ptr addrspace(1) %arg077, i64 0, i64 %15, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !75
  %28 = getelementptr inbounds [131072 x [64 x float]], ptr addrspace(1) %arg179, i64 0, i64 %15, i64 %25
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !75
  %30 = or i32 %10, 32
  %.sink66 = select i1 %.not.not, i32 %10, i32 %30
  %31 = zext i32 %.sink66 to i64
  %32 = getelementptr inbounds [131072 x [64 x float]], ptr addrspace(1) %arg077, i64 0, i64 %15, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 8, !invariant.load !75
  %34 = getelementptr inbounds [131072 x [64 x float]], ptr addrspace(1) %arg179, i64 0, i64 %15, i64 %31
  %35 = load float, ptr addrspace(1) %34, align 8, !invariant.load !75
  %36 = or i32 %11, 32
  %.sink72 = select i1 %.not.not, i32 %11, i32 %36
  %37 = zext i32 %.sink72 to i64
  %38 = getelementptr inbounds [131072 x [64 x float]], ptr addrspace(1) %arg077, i64 0, i64 %15, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4, !invariant.load !75
  %40 = getelementptr inbounds [131072 x [64 x float]], ptr addrspace(1) %arg179, i64 0, i64 %15, i64 %37
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !75
  %42 = insertelement <4 x float> poison, float %18, i32 0
  %43 = insertelement <4 x float> %42, float %27, i32 1
  %44 = insertelement <4 x float> %43, float %33, i32 2
  %45 = insertelement <4 x float> %44, float %39, i32 3
  store <4 x float> %45, ptr addrspace(1) %22, align 16
  %46 = insertelement <4 x float> poison, float %20, i32 0
  %47 = insertelement <4 x float> %46, float %29, i32 1
  %48 = insertelement <4 x float> %47, float %35, i32 2
  %49 = insertelement <4 x float> %48, float %41, i32 3
  store <4 x float> %49, ptr addrspace(1) %23, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_30(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(33554432) %arg2) local_unnamed_addr #2 {
entry:
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !86
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 28
  %5 = lshr i32 %linear_index_base, 5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = and i32 %linear_index1, 29
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 30
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = and i32 %linear_index3, 31
  %9 = icmp ult i32 %4, 16
  %10 = add nsw i32 %4, -16
  %11 = shl nuw nsw i32 %5, 4
  %.sink30 = select i1 %9, i32 %4, i32 %11
  %.sink = select i1 %9, i32 %11, i32 %10
  %arg1.sink = select i1 %9, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %12 = add nuw nsw i32 %.sink, %.sink30
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 16, !invariant.load !75
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg250, i64 %16
  %18 = icmp ult i32 %6, 16
  %19 = add nsw i32 %6, -16
  %.sink35 = select i1 %18, i32 %6, i32 %11
  %.sink34 = select i1 %18, i32 %11, i32 %19
  %arg1.sink31 = select i1 %18, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %20 = add nuw nsw i32 %.sink34, %.sink35
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink31, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !75
  %24 = icmp ult i32 %7, 16
  %25 = add nsw i32 %7, -16
  %.sink40 = select i1 %24, i32 %7, i32 %11
  %.sink39 = select i1 %24, i32 %11, i32 %25
  %arg1.sink36 = select i1 %24, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %26 = add nuw nsw i32 %.sink39, %.sink40
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink36, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !75
  %30 = icmp ult i32 %8, 16
  %31 = add nsw i32 %8, -16
  %.sink45 = select i1 %30, i32 %8, i32 %11
  %.sink44 = select i1 %30, i32 %11, i32 %31
  %arg1.sink41 = select i1 %30, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %32 = add nuw nsw i32 %.sink44, %.sink45
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink41, i64 %33
  %35 = load float, ptr addrspace(1) %34, align 4, !invariant.load !75
  %36 = insertelement <4 x float> poison, float %15, i32 0
  %37 = insertelement <4 x float> %36, float %23, i32 1
  %38 = insertelement <4 x float> %37, float %29, i32 2
  %39 = insertelement <4 x float> %38, float %35, i32 3
  store <4 x float> %39, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_7(ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(33554432) %arg2) local_unnamed_addr #2 {
entry:
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !86
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 28
  %5 = lshr i32 %linear_index_base, 5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = and i32 %linear_index1, 29
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = and i32 %linear_index2, 30
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = and i32 %linear_index3, 31
  %9 = icmp ult i32 %4, 16
  %10 = add nsw i32 %4, -16
  %11 = shl nuw nsw i32 %5, 4
  %.sink30 = select i1 %9, i32 %4, i32 %11
  %.sink = select i1 %9, i32 %11, i32 %10
  %arg1.sink = select i1 %9, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %12 = add nuw nsw i32 %.sink, %.sink30
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 16, !invariant.load !75
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg250, i64 %16
  %18 = icmp ult i32 %6, 16
  %19 = add nsw i32 %6, -16
  %.sink35 = select i1 %18, i32 %6, i32 %11
  %.sink34 = select i1 %18, i32 %11, i32 %19
  %arg1.sink31 = select i1 %18, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %20 = add nuw nsw i32 %.sink34, %.sink35
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink31, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !75
  %24 = icmp ult i32 %7, 16
  %25 = add nsw i32 %7, -16
  %.sink40 = select i1 %24, i32 %7, i32 %11
  %.sink39 = select i1 %24, i32 %11, i32 %25
  %arg1.sink36 = select i1 %24, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %26 = add nuw nsw i32 %.sink39, %.sink40
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink36, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !75
  %30 = icmp ult i32 %8, 16
  %31 = add nsw i32 %8, -16
  %.sink45 = select i1 %30, i32 %8, i32 %11
  %.sink44 = select i1 %30, i32 %11, i32 %31
  %arg1.sink41 = select i1 %30, ptr addrspace(1) %arg046, ptr addrspace(1) %arg148
  %32 = add nuw nsw i32 %.sink44, %.sink45
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, ptr addrspace(1) %arg1.sink41, i64 %33
  %35 = load float, ptr addrspace(1) %34, align 4, !invariant.load !75
  %36 = insertelement <4 x float> poison, float %15, i32 0
  %37 = insertelement <4 x float> %36, float %23, i32 1
  %38 = insertelement <4 x float> %37, float %29, i32 2
  %39 = insertelement <4 x float> %38, float %35, i32 3
  store <4 x float> %39, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @fusion_36(ptr noalias nocapture readonly align 16 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1048576) %arg2) local_unnamed_addr #4 {
entry:
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !87
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !88
  %2 = lshr i32 %0, 4
  %3 = mul nuw nsw i32 %1, 6
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 262144
  br i1 %5, label %x_in_tile-true, label %common.ret

common.ret:                                       ; preds = %entry, %x_in_tile-true, %reduction_write_output-true
  ret void

x_in_tile-true:                                   ; preds = %entry
  %6 = and i32 %0, 15
  %7 = zext i32 %6 to i64
  %Arg_0.114 = getelementptr inbounds [16 x float], ptr addrspace(1) %arg041, i64 0, i64 %7
  %8 = shl nuw nsw i32 %4, 4
  %9 = or i32 %6, %8
  %10 = zext i32 %9 to i64
  %Arg_1.212 = getelementptr inbounds float, ptr addrspace(1) %arg143, i64 %10
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !75
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !75
  %add.516 = fadd float %Arg_1.213, %Arg_0.115
  %.inv = fcmp olt float %add.516, 0.000000e+00
  %maximum.818 = select i1 %.inv, float 0.000000e+00, float %add.516
  %11 = fcmp ole float %maximum.818, 0xFFF0000000000000
  %maximum.13.i38 = select i1 %11, float 0xFFF0000000000000, float %maximum.818
  %12 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.13.i38, i32 8, i32 31)
  %13 = fcmp oge float %maximum.13.i38, %12
  %14 = fcmp uno float %maximum.13.i38, 0.000000e+00
  %15 = or i1 %14, %13
  %maximum.13.i = select i1 %15, float %maximum.13.i38, float %12
  %16 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.13.i, i32 4, i32 31)
  %17 = fcmp oge float %maximum.13.i, %16
  %18 = fcmp uno float %maximum.13.i, 0.000000e+00
  %19 = or i1 %18, %17
  %maximum.13.i35 = select i1 %19, float %maximum.13.i, float %16
  %20 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.13.i35, i32 2, i32 31)
  %21 = fcmp oge float %maximum.13.i35, %20
  %22 = fcmp uno float %maximum.13.i35, 0.000000e+00
  %23 = or i1 %22, %21
  %maximum.13.i36 = select i1 %23, float %maximum.13.i35, float %20
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.13.i36, i32 1, i32 31)
  %25 = icmp eq i32 %6, 0
  br i1 %25, label %reduction_write_output-true, label %common.ret

reduction_write_output-true:                      ; preds = %x_in_tile-true
  %26 = fcmp uno float %maximum.13.i36, 0.000000e+00
  %27 = fcmp oge float %maximum.13.i36, %24
  %28 = or i1 %26, %27
  %maximum.13.i37 = select i1 %28, float %maximum.13.i36, float %24
  %29 = and i32 %4, 15
  %30 = lshr i32 %4, 4
  %31 = and i32 %30, 8191
  %32 = lshr i32 %4, 17
  %33 = zext i32 %32 to i64
  %34 = zext i32 %31 to i64
  %35 = zext i32 %29 to i64
  %output_element_address = getelementptr inbounds [2 x [8192 x [16 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %33, i64 %34, i64 %35
  store float %maximum.13.i37, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #5

; Function Attrs: nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define void @fusion_37(ptr noalias nocapture readonly align 128 dereferenceable(1048576) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(64) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(1048576) %arg3) local_unnamed_addr #4 {
entry:
  %arg351 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg249 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg147 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg045 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !87
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !88
  %2 = lshr i32 %0, 4
  %3 = mul nuw nsw i32 %1, 6
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 262144
  br i1 %5, label %x_in_tile-true, label %common.ret

common.ret:                                       ; preds = %entry, %x_in_tile-true, %reduction_write_output-true
  ret void

x_in_tile-true:                                   ; preds = %entry
  %6 = and i32 %0, 15
  %7 = zext i32 %6 to i64
  %Arg_1.215 = getelementptr inbounds [16 x float], ptr addrspace(1) %arg147, i64 0, i64 %7
  %8 = shl nuw nsw i32 %4, 4
  %9 = or i32 %6, %8
  %10 = zext i32 %9 to i64
  %Arg_2.313 = getelementptr inbounds float, ptr addrspace(1) %arg249, i64 %10
  %Arg_2.314 = load float, ptr addrspace(1) %Arg_2.313, align 4, !invariant.load !75
  %Arg_1.216 = load float, ptr addrspace(1) %Arg_1.215, align 4, !invariant.load !75
  %add.617 = fadd float %Arg_2.314, %Arg_1.216
  %.inv = fcmp olt float %add.617, 0.000000e+00
  %maximum.919 = select i1 %.inv, float 0.000000e+00, float %add.617
  %11 = zext i32 %4 to i64
  %Arg_0.120 = getelementptr inbounds float, ptr addrspace(1) %arg045, i64 %11
  %Arg_0.121 = load float, ptr addrspace(1) %Arg_0.120, align 4, !invariant.load !75
  %subtract.1122 = fsub float %maximum.919, %Arg_0.121
  %12 = tail call float @llvm.fma.f32(float %subtract.1122, float 0x3F777313A0000000, float 5.000000e-01)
  %13 = tail call float @llvm.nvvm.saturate.f(float %12) #6
  %14 = tail call float @llvm.nvvm.fma.rm.f(float %13, float 2.520000e+02, float 0x4168000020000000) #6
  %15 = fadd float %14, 0xC168000FE0000000
  %16 = fneg float %15
  %17 = tail call float @llvm.fma.f32(float %subtract.1122, float 0x3FF7154760000000, float %16)
  %18 = tail call float @llvm.fma.f32(float %subtract.1122, float 0x3E54AE0C00000000, float %17)
  %19 = bitcast float %14 to i32
  %20 = shl i32 %19, 23
  %21 = bitcast i32 %20 to float
  %22 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %18) #6
  %23 = fmul float %22, %21
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %23, i32 8, i32 31)
  %add.17.i = fadd float %23, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.17.i, i32 4, i32 31)
  %add.17.i39 = fadd float %add.17.i, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.17.i39, i32 2, i32 31)
  %add.17.i40 = fadd float %add.17.i39, %26
  %27 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.17.i40, i32 1, i32 31)
  %28 = icmp eq i32 %6, 0
  br i1 %28, label %reduction_write_output-true, label %common.ret

reduction_write_output-true:                      ; preds = %x_in_tile-true
  %add.17.i41 = fadd float %add.17.i40, %27
  %29 = and i32 %4, 15
  %30 = lshr i32 %4, 4
  %31 = and i32 %30, 8191
  %32 = lshr i32 %4, 17
  %33 = zext i32 %32 to i64
  %34 = zext i32 %31 to i64
  %35 = zext i32 %29 to i64
  %output_element_address = getelementptr inbounds [2 x [8192 x [16 x float]]], ptr addrspace(1) %arg351, i64 0, i64 %33, i64 %34, i64 %35
  store float %add.17.i41, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_35(ptr noalias nocapture readonly align 16 dereferenceable(64) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(1048576) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(1048576) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(16777216) %arg5) local_unnamed_addr #6 {
entry:
  %arg542 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg440 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg338 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg236 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg134 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg032 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !86
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !89
  %thread_id.x = and i32 %1, 31
  %thread_id.y29 = lshr i32 %1, 5
  %2 = lshr i32 %0, 12
  %3 = shl nuw nsw i32 %0, 5
  %tile_origin.1 = and i32 %3, 131040
  %4 = shl i32 %2, 21
  %5 = and i32 %1, 15
  %6 = zext i32 %5 to i64
  %Arg_0.1 = getelementptr inbounds [16 x float], ptr addrspace(1) %arg032, i64 0, i64 %6
  %7 = zext i32 %thread_id.x to i64
  %8 = add nuw nsw i32 %thread_id.y29, -4
  %9 = trunc i32 %0 to i12
  %10 = zext i12 %9 to i32
  %11 = shl nuw nsw i32 %10, 9
  %12 = add i32 %4, %11
  %13 = shl nuw nsw i32 %thread_id.y29, 4
  %14 = add i32 %12, %13
  %15 = add i32 %14, %thread_id.x
  %16 = zext i32 %15 to i64
  %17 = shl nuw nsw i64 %16, 2
  %scevgep51 = getelementptr i8, ptr addrspace(1) %arg134, i64 %17
  %scevgep54 = getelementptr i8, ptr addrspace(1) %arg542, i64 %17
  %18 = lshr i64 %16, 4
  %19 = shl nuw nsw i64 %18, 2
  %scevgep57 = getelementptr i8, ptr addrspace(1) %arg338, i64 %19
  %scevgep60 = getelementptr i8, ptr addrspace(1) %arg236, i64 %19
  %20 = zext i32 %1 to i64
  %21 = lshr i64 %20, 5
  %22 = mul nuw nsw i64 %21, 132
  %23 = shl nuw nsw i64 %7, 2
  %24 = add i64 %22, %23
  %scevgep63 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %24
  br label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %entry, %x_in_tile-after
  %lsr.iv64 = phi ptr addrspace(3) [ %scevgep63, %entry ], [ %scevgep65, %x_in_tile-after ]
  %lsr.iv61 = phi ptr addrspace(1) [ %scevgep60, %entry ], [ %scevgep62, %x_in_tile-after ]
  %lsr.iv58 = phi ptr addrspace(1) [ %scevgep57, %entry ], [ %scevgep59, %x_in_tile-after ]
  %lsr.iv55 = phi ptr addrspace(1) [ %scevgep54, %entry ], [ %scevgep56, %x_in_tile-after ]
  %lsr.iv52 = phi ptr addrspace(1) [ %scevgep51, %entry ], [ %scevgep53, %x_in_tile-after ]
  %lsr.iv49 = phi i32 [ %8, %entry ], [ %lsr.iv.next50, %x_in_tile-after ]
  %25 = trunc i64 %7 to i32
  %26 = icmp ult i32 %25, 16
  br i1 %26, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %y_in_tile.loop_body
  %lsr.iv.next50 = add nsw i32 %lsr.iv49, 4
  %scevgep53 = getelementptr i8, ptr addrspace(1) %lsr.iv52, i64 256
  %scevgep56 = getelementptr i8, ptr addrspace(1) %lsr.iv55, i64 256
  %scevgep59 = getelementptr i8, ptr addrspace(1) %lsr.iv58, i64 16
  %scevgep62 = getelementptr i8, ptr addrspace(1) %lsr.iv61, i64 16
  %scevgep65 = getelementptr i8, ptr addrspace(3) %lsr.iv64, i64 528
  %27 = icmp ugt i32 %lsr.iv.next50, 27
  br i1 %27, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %x_in_tile-after
  %28 = trunc i64 %7 to i32
  tail call void @llvm.nvvm.barrier0()
  %29 = shl nuw nsw i32 %thread_id.y29, 17
  %30 = add i32 %4, %29
  %31 = add i32 %30, %tile_origin.1
  %32 = add i32 %31, %28
  %33 = zext i32 %32 to i64
  %34 = shl nuw nsw i64 %33, 2
  %scevgep = getelementptr i8, ptr addrspace(1) %arg440, i64 %34
  %35 = mul nuw nsw i64 %7, 132
  %36 = shl nuw nsw i64 %21, 2
  %37 = add i64 %35, %36
  %scevgep46 = getelementptr i8, ptr addrspace(3) @tr_tile_0, i64 %37
  br label %y_in_tile.loop_body16

y_in_tile.loop_body16:                            ; preds = %y_in_tile.loop_exit, %y_in_tile.loop_body16
  %lsr.iv47 = phi ptr addrspace(3) [ %scevgep46, %y_in_tile.loop_exit ], [ %scevgep48, %y_in_tile.loop_body16 ]
  %lsr.iv44 = phi ptr addrspace(1) [ %scevgep, %y_in_tile.loop_exit ], [ %scevgep45, %y_in_tile.loop_body16 ]
  %lsr.iv = phi i32 [ %8, %y_in_tile.loop_exit ], [ %lsr.iv.next, %y_in_tile.loop_body16 ]
  %tiled_buffer = load float, ptr addrspace(3) %lsr.iv47, align 4
  store float %tiled_buffer, ptr addrspace(1) %lsr.iv44, align 4
  %lsr.iv.next = add nsw i32 %lsr.iv, 4
  %scevgep45 = getelementptr i8, ptr addrspace(1) %lsr.iv44, i64 2097152
  %scevgep48 = getelementptr i8, ptr addrspace(3) %lsr.iv47, i64 16
  %38 = icmp ugt i32 %lsr.iv.next, 11
  br i1 %38, label %common.ret, label %y_in_tile.loop_body16

common.ret:                                       ; preds = %y_in_tile.loop_body16
  ret void

x_in_tile-true:                                   ; preds = %y_in_tile.loop_body
  %Arg_1.23 = load float, ptr addrspace(1) %lsr.iv52, align 4, !invariant.load !75
  %Arg_0.14 = load float, ptr addrspace(1) %Arg_0.1, align 4, !invariant.load !75
  %add.7 = fadd float %Arg_1.23, %Arg_0.14
  %.inv = fcmp olt float %add.7, 0.000000e+00
  %maximum.10 = select i1 %.inv, float 0.000000e+00, float %add.7
  store float %maximum.10, ptr addrspace(3) %lsr.iv64, align 4
  %Arg_3.412 = load float, ptr addrspace(1) %lsr.iv58, align 4, !invariant.load !75
  %subtract.13 = fsub float %maximum.10, %Arg_3.412
  %39 = tail call float @llvm.fma.f32(float %subtract.13, float 0x3F777313A0000000, float 5.000000e-01)
  %40 = tail call float @llvm.nvvm.saturate.f(float %39) #6
  %41 = tail call float @llvm.nvvm.fma.rm.f(float %40, float 2.520000e+02, float 0x4168000020000000) #6
  %42 = fadd float %41, 0xC168000FE0000000
  %43 = fneg float %42
  %44 = tail call float @llvm.fma.f32(float %subtract.13, float 0x3FF7154760000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %subtract.13, float 0x3E54AE0C00000000, float %44)
  %46 = bitcast float %41 to i32
  %47 = shl i32 %46, 23
  %48 = bitcast i32 %47 to float
  %49 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %45) #6
  %50 = fmul float %49, %48
  %Arg_2.313 = load float, ptr addrspace(1) %lsr.iv61, align 4, !invariant.load !75
  %divide.16 = fdiv float %50, %Arg_2.313
  store float %divide.16, ptr addrspace(1) %lsr.iv55, align 4
  br label %x_in_tile-after
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #7

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_29(ptr noalias nocapture readonly align 128 dereferenceable(419430400) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072000) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(88080384) %arg2) local_unnamed_addr #2 {
entry:
  %arg233 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg131 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg029 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !90
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 168
  %5 = mul i32 %4, 168
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 168
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 168
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 168
  %9 = and i32 %4, 15
  %10 = udiv i32 %linear_index_base, 2688
  %11 = icmp ult i32 %.decomposed, 128
  br i1 %11, label %concatenate.pivot.0., label %concatenate.pivot.128.1

concatenate.pivot.0.:                             ; preds = %entry
  %12 = zext i32 %10 to i64
  %13 = zext i32 %9 to i64
  %14 = zext i32 %.decomposed to i64
  %15 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg029, i64 0, i64 %12, i64 %13, i64 %14
  br label %concatenate.5.merge

concatenate.pivot.128.1:                          ; preds = %entry
  %16 = add nsw i32 %.decomposed, -128
  %17 = zext i32 %10 to i64
  %18 = zext i32 %9 to i64
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg131, i64 0, i64 %17, i64 %18, i64 %19
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.128.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %15, %concatenate.pivot.0. ], [ %20, %concatenate.pivot.128.1 ]
  %21 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !75
  %22 = zext i32 %linear_index_base to i64
  %23 = getelementptr float, ptr addrspace(1) %arg233, i64 %22
  store float %21, ptr addrspace(1) %23, align 16
  %24 = icmp ult i32 %6, 128
  br i1 %24, label %concatenate.pivot.0.6, label %concatenate.pivot.128.7

concatenate.pivot.0.6:                            ; preds = %concatenate.5.merge
  %25 = zext i32 %10 to i64
  %26 = zext i32 %9 to i64
  %27 = zext i32 %6 to i64
  %28 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg029, i64 0, i64 %25, i64 %26, i64 %27
  br label %concatenate.5.merge2

concatenate.pivot.128.7:                          ; preds = %concatenate.5.merge
  %29 = add nsw i32 %6, -128
  %30 = zext i32 %10 to i64
  %31 = zext i32 %9 to i64
  %32 = zext i32 %29 to i64
  %33 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg131, i64 0, i64 %30, i64 %31, i64 %32
  br label %concatenate.5.merge2

concatenate.5.merge2:                             ; preds = %concatenate.pivot.128.7, %concatenate.pivot.0.6
  %.in26 = phi ptr addrspace(1) [ %28, %concatenate.pivot.0.6 ], [ %33, %concatenate.pivot.128.7 ]
  %34 = load float, ptr addrspace(1) %.in26, align 4, !invariant.load !75
  %35 = getelementptr inbounds float, ptr addrspace(1) %23, i64 1
  store float %34, ptr addrspace(1) %35, align 4
  %36 = icmp ult i32 %7, 128
  br i1 %36, label %concatenate.pivot.0.12, label %concatenate.pivot.128.13

concatenate.pivot.0.12:                           ; preds = %concatenate.5.merge2
  %37 = zext i32 %10 to i64
  %38 = zext i32 %9 to i64
  %39 = zext i32 %7 to i64
  %40 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg029, i64 0, i64 %37, i64 %38, i64 %39
  br label %concatenate.5.merge8

concatenate.pivot.128.13:                         ; preds = %concatenate.5.merge2
  %41 = add nsw i32 %7, -128
  %42 = zext i32 %10 to i64
  %43 = zext i32 %9 to i64
  %44 = zext i32 %41 to i64
  %45 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg131, i64 0, i64 %42, i64 %43, i64 %44
  br label %concatenate.5.merge8

concatenate.5.merge8:                             ; preds = %concatenate.pivot.128.13, %concatenate.pivot.0.12
  %.in27 = phi ptr addrspace(1) [ %40, %concatenate.pivot.0.12 ], [ %45, %concatenate.pivot.128.13 ]
  %46 = load float, ptr addrspace(1) %.in27, align 4, !invariant.load !75
  %47 = getelementptr inbounds float, ptr addrspace(1) %23, i64 2
  store float %46, ptr addrspace(1) %47, align 8
  %48 = icmp ult i32 %8, 128
  br i1 %48, label %concatenate.pivot.0.18, label %concatenate.pivot.128.19

concatenate.pivot.0.18:                           ; preds = %concatenate.5.merge8
  %49 = zext i32 %10 to i64
  %50 = zext i32 %9 to i64
  %51 = zext i32 %8 to i64
  %52 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg029, i64 0, i64 %49, i64 %50, i64 %51
  br label %concatenate.5.merge14

concatenate.pivot.128.19:                         ; preds = %concatenate.5.merge8
  %53 = add nsw i32 %8, -128
  %54 = zext i32 %10 to i64
  %55 = zext i32 %9 to i64
  %56 = zext i32 %53 to i64
  %57 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg131, i64 0, i64 %54, i64 %55, i64 %56
  br label %concatenate.5.merge14

concatenate.5.merge14:                            ; preds = %concatenate.pivot.128.19, %concatenate.pivot.0.18
  %.in28 = phi ptr addrspace(1) [ %52, %concatenate.pivot.0.18 ], [ %57, %concatenate.pivot.128.19 ]
  %58 = load float, ptr addrspace(1) %.in28, align 4, !invariant.load !75
  %59 = getelementptr inbounds float, ptr addrspace(1) %23, i64 3
  store float %58, ptr addrspace(1) %59, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_20(ptr noalias nocapture readonly align 128 dereferenceable(67108864) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(67108864) %arg1) local_unnamed_addr #3 {
entry:
  %arg140 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg038 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 60
  %5 = lshr i32 %1, 4
  %6 = and i32 %0, 8191
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 61
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = and i32 %linear_index2, 62
  %linear_index3 = or i32 %linear_index_base, 3
  %9 = and i32 %linear_index3, 63
  %.not.not = icmp ult i32 %0, 8192
  %10 = or i32 %4, 64
  %.sink27 = select i1 %.not.not, i32 %4, i32 %10
  %11 = shl nuw nsw i32 %6, 4
  %12 = or i32 %11, %5
  %13 = zext i32 %12 to i64
  %14 = zext i32 %.sink27 to i64
  %15 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg038, i64 0, i64 %13, i64 %14
  %16 = load float, ptr addrspace(1) %15, align 16, !invariant.load !75
  %17 = zext i32 %linear_index_base to i64
  %18 = getelementptr float, ptr addrspace(1) %arg140, i64 %17
  %19 = or i32 %7, 64
  %.sink30 = select i1 %.not.not, i32 %7, i32 %19
  %20 = zext i32 %.sink30 to i64
  %21 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg038, i64 0, i64 %13, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !75
  %23 = or i32 %8, 64
  %.sink33 = select i1 %.not.not, i32 %8, i32 %23
  %24 = zext i32 %.sink33 to i64
  %25 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg038, i64 0, i64 %13, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 8, !invariant.load !75
  %27 = or i32 %9, 64
  %.sink36 = select i1 %.not.not, i32 %9, i32 %27
  %28 = zext i32 %.sink36 to i64
  %29 = getelementptr inbounds [131072 x [128 x float]], ptr addrspace(1) %arg038, i64 0, i64 %13, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !75
  %31 = insertelement <4 x float> poison, float %16, i32 0
  %32 = insertelement <4 x float> %31, float %22, i32 1
  %33 = insertelement <4 x float> %32, float %26, i32 2
  %34 = insertelement <4 x float> %33, float %30, i32 3
  store <4 x float> %34, ptr addrspace(1) %18, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_19(ptr noalias nocapture readonly align 128 dereferenceable(67108864) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(67108864) %arg1) local_unnamed_addr #3 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 7
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index1 = or i32 %linear_index_base, 1
  %5 = and i32 %3, 60
  %6 = lshr i32 %2, 4
  %7 = and i32 %6, 1
  %8 = and i32 %4, 15
  %9 = lshr i32 %0, 1
  %10 = zext i32 %7 to i64
  %11 = zext i32 %9 to i64
  %12 = zext i32 %8 to i64
  %13 = zext i32 %5 to i64
  %14 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr addrspace(1) %arg01, i64 0, i64 %10, i64 %11, i64 %12, i64 %13
  %15 = load <2 x float>, ptr addrspace(1) %14, align 16, !invariant.load !75
  %16 = extractelement <2 x float> %15, i32 0
  %17 = extractelement <2 x float> %15, i32 1
  %18 = zext i32 %linear_index_base to i64
  %19 = getelementptr float, ptr addrspace(1) %arg13, i64 %18
  %20 = and i32 %linear_index1, 61
  %21 = zext i32 %20 to i64
  %22 = and i32 %linear_index2, 62
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr addrspace(1) %arg01, i64 0, i64 %10, i64 %11, i64 %12, i64 %23
  %25 = load float, ptr addrspace(1) %24, align 8, !invariant.load !75
  %26 = and i32 %linear_index3, 63
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr addrspace(1) %arg01, i64 0, i64 %10, i64 %11, i64 %12, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !75
  %30 = insertelement <4 x float> poison, float %16, i32 0
  %31 = insertelement <4 x float> %30, float %17, i32 1
  %32 = insertelement <4 x float> %31, float %25, i32 2
  %33 = insertelement <4 x float> %32, float %29, i32 3
  store <4 x float> %33, ptr addrspace(1) %19, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_40(ptr noalias nocapture readonly align 128 dereferenceable(134217728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(134217728) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(134217728) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(134217728) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(134217728) %arg6) local_unnamed_addr #3 {
entry:
  %arg631 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg529 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !91
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
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
  %9 = getelementptr float, ptr addrspace(1) %arg223, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16, !invariant.load !75
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg325, i64 0, i64 %15
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !75
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.8 = fadd float %11, %18
  %20 = fneg float %add.8
  %21 = tail call float @llvm.fma.f32(float %20, float 0x3F777313A0000000, float 5.000000e-01)
  %22 = tail call float @llvm.nvvm.saturate.f(float %21) #6
  %23 = tail call float @llvm.nvvm.fma.rm.f(float %22, float 2.520000e+02, float 0x4168000020000000) #6
  %24 = fadd float %23, 0xC168000FE0000000
  %25 = fneg float %24
  %26 = tail call float @llvm.fma.f32(float %20, float 0x3FF7154760000000, float %25)
  %27 = tail call float @llvm.fma.f32(float %20, float 0x3E54AE0C00000000, float %26)
  %28 = bitcast float %23 to i32
  %29 = shl i32 %28, 23
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %27) #6
  %32 = fmul float %31, %30
  %add.11 = fadd float %32, 1.000000e+00
  %divide.12 = fdiv float 1.000000e+00, %add.11
  %33 = getelementptr float, ptr addrspace(1) %arg019, i64 %8
  %34 = load <4 x float>, ptr addrspace(1) %33, align 16, !invariant.load !75
  %35 = extractelement <4 x float> %34, i32 0
  %36 = extractelement <4 x float> %34, i32 1
  %37 = extractelement <4 x float> %34, i32 2
  %38 = extractelement <4 x float> %34, i32 3
  %39 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg121, i64 0, i64 %15
  %40 = load <2 x float>, ptr addrspace(1) %39, align 16, !invariant.load !75
  %41 = extractelement <2 x float> %40, i32 0
  %42 = extractelement <2 x float> %40, i32 1
  %add.14 = fadd float %35, %41
  %multiply.15 = fmul float %add.14, %divide.12
  %43 = getelementptr float, ptr addrspace(1) %arg427, i64 %8
  %44 = getelementptr float, ptr addrspace(1) %arg529, i64 %8
  %45 = getelementptr float, ptr addrspace(1) %arg631, i64 %8
  %46 = zext i32 %6 to i64
  %add.82 = fadd float %12, %19
  %47 = fneg float %add.82
  %48 = tail call float @llvm.fma.f32(float %47, float 0x3F777313A0000000, float 5.000000e-01)
  %49 = tail call float @llvm.nvvm.saturate.f(float %48) #6
  %50 = tail call float @llvm.nvvm.fma.rm.f(float %49, float 2.520000e+02, float 0x4168000020000000) #6
  %51 = fadd float %50, 0xC168000FE0000000
  %52 = fneg float %51
  %53 = tail call float @llvm.fma.f32(float %47, float 0x3FF7154760000000, float %52)
  %54 = tail call float @llvm.fma.f32(float %47, float 0x3E54AE0C00000000, float %53)
  %55 = bitcast float %50 to i32
  %56 = shl i32 %55, 23
  %57 = bitcast i32 %56 to float
  %58 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %54) #6
  %59 = fmul float %58, %57
  %add.113 = fadd float %59, 1.000000e+00
  %divide.124 = fdiv float 1.000000e+00, %add.113
  %add.145 = fadd float %36, %42
  %multiply.156 = fmul float %add.145, %divide.124
  %60 = zext i32 %5 to i64
  %61 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg325, i64 0, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 8, !invariant.load !75
  %add.88 = fadd float %13, %62
  %63 = fneg float %add.88
  %64 = tail call float @llvm.fma.f32(float %63, float 0x3F777313A0000000, float 5.000000e-01)
  %65 = tail call float @llvm.nvvm.saturate.f(float %64) #6
  %66 = tail call float @llvm.nvvm.fma.rm.f(float %65, float 2.520000e+02, float 0x4168000020000000) #6
  %67 = fadd float %66, 0xC168000FE0000000
  %68 = fneg float %67
  %69 = tail call float @llvm.fma.f32(float %63, float 0x3FF7154760000000, float %68)
  %70 = tail call float @llvm.fma.f32(float %63, float 0x3E54AE0C00000000, float %69)
  %71 = bitcast float %66 to i32
  %72 = shl i32 %71, 23
  %73 = bitcast i32 %72 to float
  %74 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %70) #6
  %75 = fmul float %74, %73
  %add.119 = fadd float %75, 1.000000e+00
  %divide.1210 = fdiv float 1.000000e+00, %add.119
  %76 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg121, i64 0, i64 %60
  %77 = load float, ptr addrspace(1) %76, align 8, !invariant.load !75
  %add.1411 = fadd float %37, %77
  %multiply.1512 = fmul float %add.1411, %divide.1210
  %78 = zext i32 %4 to i64
  %79 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg325, i64 0, i64 %78
  %80 = load float, ptr addrspace(1) %79, align 4, !invariant.load !75
  %add.814 = fadd float %14, %80
  %81 = fneg float %add.814
  %82 = tail call float @llvm.fma.f32(float %81, float 0x3F777313A0000000, float 5.000000e-01)
  %83 = tail call float @llvm.nvvm.saturate.f(float %82) #6
  %84 = tail call float @llvm.nvvm.fma.rm.f(float %83, float 2.520000e+02, float 0x4168000020000000) #6
  %85 = fadd float %84, 0xC168000FE0000000
  %86 = fneg float %85
  %87 = tail call float @llvm.fma.f32(float %81, float 0x3FF7154760000000, float %86)
  %88 = tail call float @llvm.fma.f32(float %81, float 0x3E54AE0C00000000, float %87)
  %89 = bitcast float %84 to i32
  %90 = shl i32 %89, 23
  %91 = bitcast i32 %90 to float
  %92 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %88) #6
  %93 = fmul float %92, %91
  %add.1115 = fadd float %93, 1.000000e+00
  %divide.1216 = fdiv float 1.000000e+00, %add.1115
  %94 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg121, i64 0, i64 %78
  %95 = load float, ptr addrspace(1) %94, align 4, !invariant.load !75
  %add.1417 = fadd float %38, %95
  %multiply.1518 = fmul float %add.1417, %divide.1216
  %96 = insertelement <4 x float> poison, float %multiply.15, i32 0
  %97 = insertelement <4 x float> %96, float %multiply.156, i32 1
  %98 = insertelement <4 x float> %97, float %multiply.1512, i32 2
  %99 = insertelement <4 x float> %98, float %multiply.1518, i32 3
  store <4 x float> %99, ptr addrspace(1) %43, align 16
  %100 = insertelement <4 x float> poison, float %add.14, i32 0
  %101 = insertelement <4 x float> %100, float %add.145, i32 1
  %102 = insertelement <4 x float> %101, float %add.1411, i32 2
  %103 = insertelement <4 x float> %102, float %add.1417, i32 3
  store <4 x float> %103, ptr addrspace(1) %44, align 16
  %104 = insertelement <4 x float> poison, float %divide.12, i32 0
  %105 = insertelement <4 x float> %104, float %divide.124, i32 1
  %106 = insertelement <4 x float> %105, float %divide.1210, i32 2
  %107 = insertelement <4 x float> %106, float %divide.1216, i32 3
  store <4 x float> %107, ptr addrspace(1) %45, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_16(ptr noalias nocapture align 128 dereferenceable(67108864) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(512) %arg1) local_unnamed_addr #3 {
entry:
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !92
  %2 = shl nuw nsw i32 %0, 7
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !range !93
  %4 = shl nuw nsw i32 %3, 5
  %5 = or i32 %2, %4
  %linear_index = or i32 %5, %1
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %row_index = shl nuw nsw i32 %1, 2
  %6 = zext i32 %row_index to i64
  %7 = getelementptr inbounds [128 x float], ptr addrspace(1) %arg17, i64 0, i64 %6
  %8 = load <4 x float>, ptr addrspace(1) %7, align 16, !invariant.load !75
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %13 = zext i32 %linear_index_base to i64
  %14 = getelementptr float, ptr addrspace(1) %arg05, i64 %13
  %15 = load <4 x float>, ptr addrspace(1) %14, align 16
  %16 = extractelement <4 x float> %15, i32 0
  %17 = extractelement <4 x float> %15, i32 1
  %18 = extractelement <4 x float> %15, i32 2
  %19 = extractelement <4 x float> %15, i32 3
  %add.4 = fadd float %16, %9
  %add.41 = fadd float %17, %10
  %add.42 = fadd float %18, %11
  %add.43 = fadd float %19, %12
  %20 = insertelement <4 x float> poison, float %add.4, i32 0
  %21 = insertelement <4 x float> %20, float %add.41, i32 1
  %22 = insertelement <4 x float> %21, float %add.42, i32 2
  %23 = insertelement <4 x float> %22, float %add.43, i32 3
  store <4 x float> %23, ptr addrspace(1) %14, align 16
  %24 = getelementptr inbounds float, ptr addrspace(1) %14, i64 8388608
  %25 = load <4 x float>, ptr addrspace(1) %24, align 16
  %26 = extractelement <4 x float> %25, i32 0
  %27 = extractelement <4 x float> %25, i32 1
  %28 = extractelement <4 x float> %25, i32 2
  %29 = extractelement <4 x float> %25, i32 3
  %add.4.1 = fadd float %26, %9
  %add.41.1 = fadd float %27, %10
  %add.42.1 = fadd float %28, %11
  %add.43.1 = fadd float %29, %12
  %30 = insertelement <4 x float> poison, float %add.4.1, i32 0
  %31 = insertelement <4 x float> %30, float %add.41.1, i32 1
  %32 = insertelement <4 x float> %31, float %add.42.1, i32 2
  %33 = insertelement <4 x float> %32, float %add.43.1, i32 3
  store <4 x float> %33, ptr addrspace(1) %24, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.y() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_39(ptr noalias nocapture align 128 dereferenceable(134217728) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg1, ptr noalias nocapture align 128 dereferenceable(134217728) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(134217728) %arg4) local_unnamed_addr #3 {
entry:
  %arg427 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg325 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg223 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg121 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg019 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !91
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
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
  %9 = getelementptr float, ptr addrspace(1) %arg223, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg325, i64 0, i64 %15
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !75
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.8 = fadd float %11, %18
  %20 = fneg float %add.8
  %21 = tail call float @llvm.fma.f32(float %20, float 0x3F777313A0000000, float 5.000000e-01)
  %22 = tail call float @llvm.nvvm.saturate.f(float %21) #6
  %23 = tail call float @llvm.nvvm.fma.rm.f(float %22, float 2.520000e+02, float 0x4168000020000000) #6
  %24 = fadd float %23, 0xC168000FE0000000
  %25 = fneg float %24
  %26 = tail call float @llvm.fma.f32(float %20, float 0x3FF7154760000000, float %25)
  %27 = tail call float @llvm.fma.f32(float %20, float 0x3E54AE0C00000000, float %26)
  %28 = bitcast float %23 to i32
  %29 = shl i32 %28, 23
  %30 = bitcast i32 %29 to float
  %31 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %27) #6
  %32 = fmul float %31, %30
  %add.11 = fadd float %32, 1.000000e+00
  %divide.12 = fdiv float 1.000000e+00, %add.11
  %33 = getelementptr float, ptr addrspace(1) %arg019, i64 %8
  %34 = load <4 x float>, ptr addrspace(1) %33, align 16
  %35 = extractelement <4 x float> %34, i32 0
  %36 = extractelement <4 x float> %34, i32 1
  %37 = extractelement <4 x float> %34, i32 2
  %38 = extractelement <4 x float> %34, i32 3
  %39 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg121, i64 0, i64 %15
  %40 = load <2 x float>, ptr addrspace(1) %39, align 16, !invariant.load !75
  %41 = extractelement <2 x float> %40, i32 0
  %42 = extractelement <2 x float> %40, i32 1
  %add.14 = fadd float %35, %41
  %multiply.15 = fmul float %add.14, %divide.12
  %43 = getelementptr float, ptr addrspace(1) %arg427, i64 %8
  %44 = zext i32 %6 to i64
  %add.82 = fadd float %12, %19
  %45 = fneg float %add.82
  %46 = tail call float @llvm.fma.f32(float %45, float 0x3F777313A0000000, float 5.000000e-01)
  %47 = tail call float @llvm.nvvm.saturate.f(float %46) #6
  %48 = tail call float @llvm.nvvm.fma.rm.f(float %47, float 2.520000e+02, float 0x4168000020000000) #6
  %49 = fadd float %48, 0xC168000FE0000000
  %50 = fneg float %49
  %51 = tail call float @llvm.fma.f32(float %45, float 0x3FF7154760000000, float %50)
  %52 = tail call float @llvm.fma.f32(float %45, float 0x3E54AE0C00000000, float %51)
  %53 = bitcast float %48 to i32
  %54 = shl i32 %53, 23
  %55 = bitcast i32 %54 to float
  %56 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %52) #6
  %57 = fmul float %56, %55
  %add.113 = fadd float %57, 1.000000e+00
  %divide.124 = fdiv float 1.000000e+00, %add.113
  %add.145 = fadd float %36, %42
  %multiply.156 = fmul float %add.145, %divide.124
  %58 = zext i32 %5 to i64
  %59 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg325, i64 0, i64 %58
  %60 = load float, ptr addrspace(1) %59, align 8, !invariant.load !75
  %add.88 = fadd float %13, %60
  %61 = fneg float %add.88
  %62 = tail call float @llvm.fma.f32(float %61, float 0x3F777313A0000000, float 5.000000e-01)
  %63 = tail call float @llvm.nvvm.saturate.f(float %62) #6
  %64 = tail call float @llvm.nvvm.fma.rm.f(float %63, float 2.520000e+02, float 0x4168000020000000) #6
  %65 = fadd float %64, 0xC168000FE0000000
  %66 = fneg float %65
  %67 = tail call float @llvm.fma.f32(float %61, float 0x3FF7154760000000, float %66)
  %68 = tail call float @llvm.fma.f32(float %61, float 0x3E54AE0C00000000, float %67)
  %69 = bitcast float %64 to i32
  %70 = shl i32 %69, 23
  %71 = bitcast i32 %70 to float
  %72 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %68) #6
  %73 = fmul float %72, %71
  %add.119 = fadd float %73, 1.000000e+00
  %divide.1210 = fdiv float 1.000000e+00, %add.119
  %74 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg121, i64 0, i64 %58
  %75 = load float, ptr addrspace(1) %74, align 8, !invariant.load !75
  %add.1411 = fadd float %37, %75
  %multiply.1512 = fmul float %add.1411, %divide.1210
  %76 = zext i32 %4 to i64
  %77 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg325, i64 0, i64 %76
  %78 = load float, ptr addrspace(1) %77, align 4, !invariant.load !75
  %add.814 = fadd float %14, %78
  %79 = fneg float %add.814
  %80 = tail call float @llvm.fma.f32(float %79, float 0x3F777313A0000000, float 5.000000e-01)
  %81 = tail call float @llvm.nvvm.saturate.f(float %80) #6
  %82 = tail call float @llvm.nvvm.fma.rm.f(float %81, float 2.520000e+02, float 0x4168000020000000) #6
  %83 = fadd float %82, 0xC168000FE0000000
  %84 = fneg float %83
  %85 = tail call float @llvm.fma.f32(float %79, float 0x3FF7154760000000, float %84)
  %86 = tail call float @llvm.fma.f32(float %79, float 0x3E54AE0C00000000, float %85)
  %87 = bitcast float %82 to i32
  %88 = shl i32 %87, 23
  %89 = bitcast i32 %88 to float
  %90 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %86) #6
  %91 = fmul float %90, %89
  %add.1115 = fadd float %91, 1.000000e+00
  %divide.1216 = fdiv float 1.000000e+00, %add.1115
  %92 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg121, i64 0, i64 %76
  %93 = load float, ptr addrspace(1) %92, align 4, !invariant.load !75
  %add.1417 = fadd float %38, %93
  %multiply.1518 = fmul float %add.1417, %divide.1216
  %94 = insertelement <4 x float> poison, float %multiply.15, i32 0
  %95 = insertelement <4 x float> %94, float %multiply.156, i32 1
  %96 = insertelement <4 x float> %95, float %multiply.1512, i32 2
  %97 = insertelement <4 x float> %96, float %multiply.1518, i32 3
  store <4 x float> %97, ptr addrspace(1) %43, align 16
  %98 = insertelement <4 x float> poison, float %add.14, i32 0
  %99 = insertelement <4 x float> %98, float %add.145, i32 1
  %100 = insertelement <4 x float> %99, float %add.1411, i32 2
  %101 = insertelement <4 x float> %100, float %add.1417, i32 3
  store <4 x float> %101, ptr addrspace(1) %9, align 16
  %102 = insertelement <4 x float> poison, float %divide.12, i32 0
  %103 = insertelement <4 x float> %102, float %divide.124, i32 1
  %104 = insertelement <4 x float> %103, float %divide.1210, i32 2
  %105 = insertelement <4 x float> %104, float %divide.1216, i32 3
  store <4 x float> %105, ptr addrspace(1) %33, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_38(ptr noalias nocapture readonly align 128 dereferenceable(131072000) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(419430400) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(88080384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(672) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(524288) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(88080384) %arg5) local_unnamed_addr #6 {
entry:
  %arg580 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg478 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg376 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg274 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg172 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg070 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !92
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !94
  %2 = mul nuw nsw i32 %1, 168
  %3 = add nuw nsw i32 %0, %2
  %.frozen = freeze i32 %3
  %4 = udiv i32 %.frozen, 168
  %5 = mul i32 %4, 168
  %.decomposed = sub i32 %.frozen, %5
  %6 = and i32 %4, 15
  %7 = udiv i32 %3, 2688
  %8 = zext i32 %3 to i64
  %Arg_2.315 = getelementptr inbounds float, ptr addrspace(1) %arg274, i64 %8
  %Arg_2.316 = load float, ptr addrspace(1) %Arg_2.315, align 4, !invariant.load !75
  %9 = zext i32 %.decomposed to i64
  %Arg_3.417 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg376, i64 0, i64 %9
  %Arg_3.418 = load float, ptr addrspace(1) %Arg_3.417, align 4, !invariant.load !75
  %add.619 = fadd float %Arg_2.316, %Arg_3.418
  %10 = icmp ult i32 %.decomposed, 128
  br i1 %10, label %concatenate.pivot.0.28, label %concatenate.pivot.128.29

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %11 = icmp eq i32 %0, 0
  tail call void @llvm.nvvm.barrier0()
  %12 = lshr i32 %1, 4
  %13 = zext i32 %12 to i64
  %14 = and i32 %1, 15
  %15 = zext i32 %14 to i64
  %output_element_address = getelementptr inbounds [8192 x [16 x float]], ptr addrspace(1) %arg478, i64 0, i64 %13, i64 %15
  br i1 %11, label %reduction_write_output-true, label %common.ret

concatenate.pivot.128.29.1:                       ; preds = %concatenate.10.merge20
  %16 = trunc i64 %115 to i32
  %17 = add nsw i32 %16, -128
  %18 = zext i32 %110 to i64
  %19 = zext i32 %109 to i64
  %20 = zext i32 %17 to i64
  %Arg_0.125.1 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg070, i64 0, i64 %18, i64 %19, i64 %20
  br label %concatenate.10.merge20.1

concatenate.pivot.0.28.1:                         ; preds = %concatenate.10.merge20
  %21 = zext i32 %110 to i64
  %22 = zext i32 %109 to i64
  %Arg_1.222.1 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg172, i64 0, i64 %21, i64 %22, i64 %115
  br label %concatenate.10.merge20.1

concatenate.10.merge20.1:                         ; preds = %concatenate.pivot.0.28.1, %concatenate.pivot.128.29.1
  %.in.1 = phi ptr addrspace(1) [ %Arg_1.222.1, %concatenate.pivot.0.28.1 ], [ %Arg_0.125.1, %concatenate.pivot.128.29.1 ]
  %23 = load float, ptr addrspace(1) %.in.1, align 4, !invariant.load !75
  %add.1130.1 = fadd float %add.619.1, %23
  %add.16.i57.1 = fadd float %add.16.i57, %add.1130.1
  %24 = getelementptr float, ptr addrspace(1) %arg580, i64 %113
  %25 = getelementptr inbounds float, ptr addrspace(1) %24, i64 32
  store float %add.1130.1, ptr addrspace(1) %25, align 4
  %x_loc14.2 = or i32 %0, 64
  %26 = add nuw nsw i32 %x_loc14.2, %2
  %.frozen60 = freeze i32 %26
  %27 = udiv i32 %.frozen60, 168
  %28 = mul i32 %27, 168
  %.decomposed61 = sub i32 %.frozen60, %28
  %29 = and i32 %27, 15
  %30 = udiv i32 %26, 2688
  %Arg_2.315.284 = getelementptr inbounds float, ptr addrspace(1) %114, i64 64
  %Arg_2.316.2 = load float, ptr addrspace(1) %Arg_2.315.284, align 4, !invariant.load !75
  %31 = zext i32 %.decomposed61 to i64
  %Arg_3.417.2 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg376, i64 0, i64 %31
  %Arg_3.418.2 = load float, ptr addrspace(1) %Arg_3.417.2, align 4, !invariant.load !75
  %add.619.2 = fadd float %Arg_2.316.2, %Arg_3.418.2
  %32 = icmp ult i32 %.decomposed61, 128
  br i1 %32, label %concatenate.pivot.0.28.2, label %concatenate.pivot.128.29.2

concatenate.pivot.128.29.2:                       ; preds = %concatenate.10.merge20.1
  %33 = trunc i64 %31 to i32
  %34 = add nsw i32 %33, -128
  %35 = zext i32 %30 to i64
  %36 = zext i32 %29 to i64
  %37 = zext i32 %34 to i64
  %Arg_0.125.2 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg070, i64 0, i64 %35, i64 %36, i64 %37
  br label %concatenate.10.merge20.2

concatenate.pivot.0.28.2:                         ; preds = %concatenate.10.merge20.1
  %38 = zext i32 %30 to i64
  %39 = zext i32 %29 to i64
  %Arg_1.222.2 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg172, i64 0, i64 %38, i64 %39, i64 %31
  br label %concatenate.10.merge20.2

concatenate.10.merge20.2:                         ; preds = %concatenate.pivot.0.28.2, %concatenate.pivot.128.29.2
  %.in.2 = phi ptr addrspace(1) [ %Arg_1.222.2, %concatenate.pivot.0.28.2 ], [ %Arg_0.125.2, %concatenate.pivot.128.29.2 ]
  %40 = load float, ptr addrspace(1) %.in.2, align 4, !invariant.load !75
  %add.1130.2 = fadd float %add.619.2, %40
  %add.16.i57.2 = fadd float %add.16.i57.1, %add.1130.2
  %41 = getelementptr inbounds float, ptr addrspace(1) %24, i64 64
  store float %add.1130.2, ptr addrspace(1) %41, align 4
  %x_loc14.3 = or i32 %0, 96
  %42 = add nuw nsw i32 %x_loc14.3, %2
  %.frozen62 = freeze i32 %42
  %43 = udiv i32 %.frozen62, 168
  %44 = mul i32 %43, 168
  %.decomposed63 = sub i32 %.frozen62, %44
  %45 = and i32 %43, 15
  %46 = udiv i32 %42, 2688
  %Arg_2.315.387 = getelementptr inbounds float, ptr addrspace(1) %114, i64 96
  %Arg_2.316.3 = load float, ptr addrspace(1) %Arg_2.315.387, align 4, !invariant.load !75
  %47 = zext i32 %.decomposed63 to i64
  %Arg_3.417.3 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg376, i64 0, i64 %47
  %Arg_3.418.3 = load float, ptr addrspace(1) %Arg_3.417.3, align 4, !invariant.load !75
  %add.619.3 = fadd float %Arg_2.316.3, %Arg_3.418.3
  %48 = icmp ult i32 %.decomposed63, 128
  br i1 %48, label %concatenate.pivot.0.28.3, label %concatenate.pivot.128.29.3

concatenate.pivot.128.29.3:                       ; preds = %concatenate.10.merge20.2
  %49 = trunc i64 %47 to i32
  %50 = add nsw i32 %49, -128
  %51 = zext i32 %46 to i64
  %52 = zext i32 %45 to i64
  %53 = zext i32 %50 to i64
  %Arg_0.125.3 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg070, i64 0, i64 %51, i64 %52, i64 %53
  br label %concatenate.10.merge20.3

concatenate.pivot.0.28.3:                         ; preds = %concatenate.10.merge20.2
  %54 = zext i32 %46 to i64
  %55 = zext i32 %45 to i64
  %Arg_1.222.3 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg172, i64 0, i64 %54, i64 %55, i64 %47
  br label %concatenate.10.merge20.3

concatenate.10.merge20.3:                         ; preds = %concatenate.pivot.0.28.3, %concatenate.pivot.128.29.3
  %.in.3 = phi ptr addrspace(1) [ %Arg_1.222.3, %concatenate.pivot.0.28.3 ], [ %Arg_0.125.3, %concatenate.pivot.128.29.3 ]
  %56 = load float, ptr addrspace(1) %.in.3, align 4, !invariant.load !75
  %add.1130.3 = fadd float %add.619.3, %56
  %add.16.i57.3 = fadd float %add.16.i57.2, %add.1130.3
  %57 = getelementptr inbounds float, ptr addrspace(1) %24, i64 96
  store float %add.1130.3, ptr addrspace(1) %57, align 4
  %x_loc14.4 = or i32 %0, 128
  %58 = add nuw nsw i32 %x_loc14.4, %2
  %.frozen64 = freeze i32 %58
  %59 = udiv i32 %.frozen64, 168
  %60 = mul i32 %59, 168
  %.decomposed65 = sub i32 %.frozen64, %60
  %61 = and i32 %59, 15
  %62 = udiv i32 %58, 2688
  %Arg_2.315.490 = getelementptr inbounds float, ptr addrspace(1) %114, i64 128
  %Arg_2.316.4 = load float, ptr addrspace(1) %Arg_2.315.490, align 4, !invariant.load !75
  %63 = zext i32 %.decomposed65 to i64
  %Arg_3.417.4 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg376, i64 0, i64 %63
  %Arg_3.418.4 = load float, ptr addrspace(1) %Arg_3.417.4, align 4, !invariant.load !75
  %add.619.4 = fadd float %Arg_2.316.4, %Arg_3.418.4
  %64 = icmp ult i32 %.decomposed65, 128
  br i1 %64, label %concatenate.pivot.0.28.4, label %concatenate.pivot.128.29.4

concatenate.pivot.128.29.4:                       ; preds = %concatenate.10.merge20.3
  %65 = trunc i64 %63 to i32
  %66 = add nsw i32 %65, -128
  %67 = zext i32 %62 to i64
  %68 = zext i32 %61 to i64
  %69 = zext i32 %66 to i64
  %Arg_0.125.4 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg070, i64 0, i64 %67, i64 %68, i64 %69
  br label %concatenate.10.merge20.4

concatenate.pivot.0.28.4:                         ; preds = %concatenate.10.merge20.3
  %70 = zext i32 %62 to i64
  %71 = zext i32 %61 to i64
  %Arg_1.222.4 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg172, i64 0, i64 %70, i64 %71, i64 %63
  br label %concatenate.10.merge20.4

concatenate.10.merge20.4:                         ; preds = %concatenate.pivot.0.28.4, %concatenate.pivot.128.29.4
  %.in.4 = phi ptr addrspace(1) [ %Arg_1.222.4, %concatenate.pivot.0.28.4 ], [ %Arg_0.125.4, %concatenate.pivot.128.29.4 ]
  %72 = load float, ptr addrspace(1) %.in.4, align 4, !invariant.load !75
  %add.1130.4 = fadd float %add.619.4, %72
  %add.16.i57.4 = fadd float %add.16.i57.3, %add.1130.4
  %73 = getelementptr inbounds float, ptr addrspace(1) %24, i64 128
  store float %add.1130.4, ptr addrspace(1) %73, align 4
  %x_loc14.5 = or i32 %0, 160
  %74 = icmp ult i32 %x_loc14.5, 168
  br i1 %74, label %x_in_tile-true.5, label %x_in_tile-after.15

x_in_tile-true.5:                                 ; preds = %concatenate.10.merge20.4
  %75 = add nuw nsw i32 %x_loc14.5, %2
  %.frozen66 = freeze i32 %75
  %76 = udiv i32 %.frozen66, 168
  %77 = mul i32 %76, 168
  %.decomposed67 = sub i32 %.frozen66, %77
  %78 = and i32 %76, 15
  %79 = udiv i32 %75, 2688
  %Arg_2.315.593 = getelementptr inbounds float, ptr addrspace(1) %114, i64 160
  %Arg_2.316.5 = load float, ptr addrspace(1) %Arg_2.315.593, align 4, !invariant.load !75
  %80 = zext i32 %.decomposed67 to i64
  %Arg_3.417.5 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg376, i64 0, i64 %80
  %Arg_3.418.5 = load float, ptr addrspace(1) %Arg_3.417.5, align 4, !invariant.load !75
  %add.619.5 = fadd float %Arg_2.316.5, %Arg_3.418.5
  %81 = icmp ult i32 %.decomposed67, 128
  br i1 %81, label %concatenate.pivot.0.28.5, label %concatenate.pivot.128.29.5

concatenate.pivot.128.29.5:                       ; preds = %x_in_tile-true.5
  %82 = trunc i64 %80 to i32
  %83 = add nsw i32 %82, -128
  %84 = zext i32 %79 to i64
  %85 = zext i32 %78 to i64
  %86 = zext i32 %83 to i64
  %Arg_0.125.5 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg070, i64 0, i64 %84, i64 %85, i64 %86
  br label %concatenate.10.merge20.5

concatenate.pivot.0.28.5:                         ; preds = %x_in_tile-true.5
  %87 = zext i32 %79 to i64
  %88 = zext i32 %78 to i64
  %Arg_1.222.5 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg172, i64 0, i64 %87, i64 %88, i64 %80
  br label %concatenate.10.merge20.5

concatenate.10.merge20.5:                         ; preds = %concatenate.pivot.0.28.5, %concatenate.pivot.128.29.5
  %.in.5 = phi ptr addrspace(1) [ %Arg_1.222.5, %concatenate.pivot.0.28.5 ], [ %Arg_0.125.5, %concatenate.pivot.128.29.5 ]
  %89 = load float, ptr addrspace(1) %.in.5, align 4, !invariant.load !75
  %add.1130.5 = fadd float %add.619.5, %89
  %add.16.i57.5 = fadd float %add.16.i57.4, %add.1130.5
  %90 = getelementptr inbounds float, ptr addrspace(1) %24, i64 160
  store float %add.1130.5, ptr addrspace(1) %90, align 4
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %concatenate.10.merge20.5, %concatenate.10.merge20.4
  %partial_reduction_result.1.5 = phi float [ %add.16.i57.5, %concatenate.10.merge20.5 ], [ %add.16.i57.4, %concatenate.10.merge20.4 ]
  %91 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.5, i32 16, i32 31)
  %add.16.i = fadd float %partial_reduction_result.1.5, %91
  %92 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i, i32 8, i32 31)
  %add.16.i53 = fadd float %add.16.i, %92
  %93 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i53, i32 4, i32 31)
  %add.16.i54 = fadd float %add.16.i53, %93
  %94 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i54, i32 2, i32 31)
  %add.16.i55 = fadd float %add.16.i54, %94
  %95 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.16.i55, i32 1, i32 31)
  %96 = icmp eq i32 %0, 0
  %add.16.i56 = fadd float %add.16.i55, %95
  br i1 %96, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

concatenate.pivot.0.28:                           ; preds = %entry
  %97 = zext i32 %7 to i64
  %98 = zext i32 %6 to i64
  %Arg_1.222 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg172, i64 0, i64 %97, i64 %98, i64 %9
  br label %concatenate.10.merge20

concatenate.pivot.128.29:                         ; preds = %entry
  %99 = trunc i64 %9 to i32
  %100 = add nsw i32 %99, -128
  %101 = zext i32 %7 to i64
  %102 = zext i32 %6 to i64
  %103 = zext i32 %100 to i64
  %Arg_0.125 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg070, i64 0, i64 %101, i64 %102, i64 %103
  br label %concatenate.10.merge20

concatenate.10.merge20:                           ; preds = %concatenate.pivot.128.29, %concatenate.pivot.0.28
  %.in = phi ptr addrspace(1) [ %Arg_1.222, %concatenate.pivot.0.28 ], [ %Arg_0.125, %concatenate.pivot.128.29 ]
  %104 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !75
  %add.1130 = fadd float %add.619, %104
  %add.16.i57 = fadd float %add.1130, 0.000000e+00
  %105 = getelementptr inbounds float, ptr addrspace(1) %arg580, i64 %8
  store float %add.1130, ptr addrspace(1) %105, align 4
  %x_loc14.1 = or i32 %0, 32
  %106 = add nuw nsw i32 %x_loc14.1, %2
  %.frozen68 = freeze i32 %106
  %107 = udiv i32 %.frozen68, 168
  %108 = mul i32 %107, 168
  %.decomposed69 = sub i32 %.frozen68, %108
  %109 = and i32 %107, 15
  %110 = udiv i32 %106, 2688
  %111 = zext i32 %2 to i64
  %112 = zext i32 %0 to i64
  %113 = add i64 %112, %111
  %114 = getelementptr float, ptr addrspace(1) %arg274, i64 %113
  %Arg_2.315.196 = getelementptr inbounds float, ptr addrspace(1) %114, i64 32
  %Arg_2.316.1 = load float, ptr addrspace(1) %Arg_2.315.196, align 4, !invariant.load !75
  %115 = zext i32 %.decomposed69 to i64
  %Arg_3.417.1 = getelementptr inbounds [168 x float], ptr addrspace(1) %arg376, i64 0, i64 %115
  %Arg_3.418.1 = load float, ptr addrspace(1) %Arg_3.417.1, align 4, !invariant.load !75
  %add.619.1 = fadd float %Arg_2.316.1, %Arg_3.418.1
  %116 = icmp ult i32 %.decomposed69, 128
  br i1 %116, label %concatenate.pivot.0.28.1, label %concatenate.pivot.128.29.1

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.16.i56, ptr addrspace(3) @"shared_cache_$_0", align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) @"shared_cache_$_0", align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_12(ptr noalias nocapture readonly align 128 dereferenceable(524288) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(524288) %arg1) local_unnamed_addr #3 {
entry:
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !89
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !75
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %multiply.4 = fmul float %7, 0x3F78618620000000
  %11 = getelementptr float, ptr addrspace(1) %arg19, i64 %4
  %multiply.42 = fmul float %8, 0x3F78618620000000
  %multiply.44 = fmul float %9, 0x3F78618620000000
  %multiply.46 = fmul float %10, 0x3F78618620000000
  %12 = insertelement <4 x float> poison, float %multiply.4, i32 0
  %13 = insertelement <4 x float> %12, float %multiply.42, i32 1
  %14 = insertelement <4 x float> %13, float %multiply.44, i32 2
  %15 = insertelement <4 x float> %14, float %multiply.46, i32 3
  store <4 x float> %15, ptr addrspace(1) %11, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(88080384) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(524288) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(524288) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(88080384) %arg3) local_unnamed_addr #6 {
entry:
  %arg351 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg249 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg147 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg045 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !92
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !94
  %2 = mul nuw nsw i32 %1, 168
  %3 = add nuw nsw i32 %0, %2
  %4 = udiv i32 %3, 168
  %5 = zext i32 %3 to i64
  %Arg_0.112 = getelementptr inbounds float, ptr addrspace(1) %arg045, i64 %5
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !75
  %6 = zext i32 %4 to i64
  %Arg_1.214 = getelementptr inbounds float, ptr addrspace(1) %arg147, i64 %6
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !75
  %subtract.416 = fsub float %Arg_0.113, %Arg_1.215
  %multiply.517 = fmul float %subtract.416, %subtract.416
  %add.10.i42 = fadd float %multiply.517, 0.000000e+00
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg351, i64 %5
  store float %subtract.416, ptr addrspace(1) %7, align 4
  %x_loc11.1 = or i32 %0, 32
  %8 = add nuw nsw i32 %x_loc11.1, %2
  %9 = udiv i32 %8, 168
  %10 = zext i32 %2 to i64
  %11 = zext i32 %0 to i64
  %12 = add i64 %11, %10
  %13 = getelementptr float, ptr addrspace(1) %arg045, i64 %12
  %Arg_0.112.154 = getelementptr inbounds float, ptr addrspace(1) %13, i64 32
  %Arg_0.113.1 = load float, ptr addrspace(1) %Arg_0.112.154, align 4, !invariant.load !75
  %14 = zext i32 %9 to i64
  %Arg_1.214.1 = getelementptr inbounds float, ptr addrspace(1) %arg147, i64 %14
  %Arg_1.215.1 = load float, ptr addrspace(1) %Arg_1.214.1, align 4, !invariant.load !75
  %subtract.416.1 = fsub float %Arg_0.113.1, %Arg_1.215.1
  %multiply.517.1 = fmul float %subtract.416.1, %subtract.416.1
  %add.10.i42.1 = fadd float %add.10.i42, %multiply.517.1
  %15 = getelementptr float, ptr addrspace(1) %arg351, i64 %12
  %16 = getelementptr inbounds float, ptr addrspace(1) %15, i64 32
  store float %subtract.416.1, ptr addrspace(1) %16, align 4
  %x_loc11.2 = or i32 %0, 64
  %17 = add nuw nsw i32 %x_loc11.2, %2
  %18 = udiv i32 %17, 168
  %Arg_0.112.257 = getelementptr inbounds float, ptr addrspace(1) %13, i64 64
  %Arg_0.113.2 = load float, ptr addrspace(1) %Arg_0.112.257, align 4, !invariant.load !75
  %19 = zext i32 %18 to i64
  %Arg_1.214.2 = getelementptr inbounds float, ptr addrspace(1) %arg147, i64 %19
  %Arg_1.215.2 = load float, ptr addrspace(1) %Arg_1.214.2, align 4, !invariant.load !75
  %subtract.416.2 = fsub float %Arg_0.113.2, %Arg_1.215.2
  %multiply.517.2 = fmul float %subtract.416.2, %subtract.416.2
  %add.10.i42.2 = fadd float %add.10.i42.1, %multiply.517.2
  %20 = getelementptr inbounds float, ptr addrspace(1) %15, i64 64
  store float %subtract.416.2, ptr addrspace(1) %20, align 4
  %x_loc11.3 = or i32 %0, 96
  %21 = add nuw nsw i32 %x_loc11.3, %2
  %22 = udiv i32 %21, 168
  %Arg_0.112.360 = getelementptr inbounds float, ptr addrspace(1) %13, i64 96
  %Arg_0.113.3 = load float, ptr addrspace(1) %Arg_0.112.360, align 4, !invariant.load !75
  %23 = zext i32 %22 to i64
  %Arg_1.214.3 = getelementptr inbounds float, ptr addrspace(1) %arg147, i64 %23
  %Arg_1.215.3 = load float, ptr addrspace(1) %Arg_1.214.3, align 4, !invariant.load !75
  %subtract.416.3 = fsub float %Arg_0.113.3, %Arg_1.215.3
  %multiply.517.3 = fmul float %subtract.416.3, %subtract.416.3
  %add.10.i42.3 = fadd float %add.10.i42.2, %multiply.517.3
  %24 = getelementptr inbounds float, ptr addrspace(1) %15, i64 96
  store float %subtract.416.3, ptr addrspace(1) %24, align 4
  %x_loc11.4 = or i32 %0, 128
  %25 = add nuw nsw i32 %x_loc11.4, %2
  %26 = udiv i32 %25, 168
  %Arg_0.112.463 = getelementptr inbounds float, ptr addrspace(1) %13, i64 128
  %Arg_0.113.4 = load float, ptr addrspace(1) %Arg_0.112.463, align 4, !invariant.load !75
  %27 = zext i32 %26 to i64
  %Arg_1.214.4 = getelementptr inbounds float, ptr addrspace(1) %arg147, i64 %27
  %Arg_1.215.4 = load float, ptr addrspace(1) %Arg_1.214.4, align 4, !invariant.load !75
  %subtract.416.4 = fsub float %Arg_0.113.4, %Arg_1.215.4
  %multiply.517.4 = fmul float %subtract.416.4, %subtract.416.4
  %add.10.i42.4 = fadd float %add.10.i42.3, %multiply.517.4
  %28 = getelementptr inbounds float, ptr addrspace(1) %15, i64 128
  store float %subtract.416.4, ptr addrspace(1) %28, align 4
  %x_loc11.5 = or i32 %0, 160
  %29 = icmp ult i32 %x_loc11.5, 168
  br i1 %29, label %x_in_tile-true.5, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %30 = icmp eq i32 %0, 0
  tail call void @llvm.nvvm.barrier0()
  %31 = lshr i32 %1, 4
  %32 = zext i32 %31 to i64
  %33 = and i32 %1, 15
  %34 = zext i32 %33 to i64
  %output_element_address = getelementptr inbounds [8192 x [16 x float]], ptr addrspace(1) %arg249, i64 0, i64 %32, i64 %34
  br i1 %30, label %reduction_write_output-true, label %common.ret

x_in_tile-true.5:                                 ; preds = %entry
  %35 = add nuw nsw i32 %x_loc11.5, %2
  %36 = udiv i32 %35, 168
  %Arg_0.112.566 = getelementptr inbounds float, ptr addrspace(1) %13, i64 160
  %Arg_0.113.5 = load float, ptr addrspace(1) %Arg_0.112.566, align 4, !invariant.load !75
  %37 = zext i32 %36 to i64
  %Arg_1.214.5 = getelementptr inbounds float, ptr addrspace(1) %arg147, i64 %37
  %Arg_1.215.5 = load float, ptr addrspace(1) %Arg_1.214.5, align 4, !invariant.load !75
  %subtract.416.5 = fsub float %Arg_0.113.5, %Arg_1.215.5
  %multiply.517.5 = fmul float %subtract.416.5, %subtract.416.5
  %add.10.i42.5 = fadd float %add.10.i42.4, %multiply.517.5
  %38 = getelementptr inbounds float, ptr addrspace(1) %15, i64 160
  store float %subtract.416.5, ptr addrspace(1) %38, align 4
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.5, %entry
  %partial_reduction_result.1.5 = phi float [ %add.10.i42.5, %x_in_tile-true.5 ], [ %add.10.i42.4, %entry ]
  %39 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.5, i32 16, i32 31)
  %add.10.i = fadd float %partial_reduction_result.1.5, %39
  %40 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i, i32 8, i32 31)
  %add.10.i38 = fadd float %add.10.i, %40
  %41 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i38, i32 4, i32 31)
  %add.10.i39 = fadd float %add.10.i38, %41
  %42 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i39, i32 2, i32 31)
  %add.10.i40 = fadd float %add.10.i39, %42
  %43 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i40, i32 1, i32 31)
  %44 = icmp eq i32 %0, 0
  %add.10.i41 = fadd float %add.10.i40, %43
  br i1 %44, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.10.i41, ptr addrspace(3) @"shared_cache1_$_0", align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) @"shared_cache1_$_0", align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_9(ptr noalias nocapture align 128 dereferenceable(524288) %arg0) local_unnamed_addr #3 {
entry:
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !89
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg013, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %multiply.6 = fmul float %7, 0x3F78618620000000
  %add.7 = fadd float %multiply.6, 0x3EE4F8B580000000
  %11 = tail call float @llvm.nvvm.rsqrt.approx.f(float %add.7)
  %multiply.63 = fmul float %8, 0x3F78618620000000
  %add.74 = fadd float %multiply.63, 0x3EE4F8B580000000
  %12 = tail call float @llvm.nvvm.rsqrt.approx.f(float %add.74)
  %multiply.67 = fmul float %9, 0x3F78618620000000
  %add.78 = fadd float %multiply.67, 0x3EE4F8B580000000
  %13 = tail call float @llvm.nvvm.rsqrt.approx.f(float %add.78)
  %multiply.611 = fmul float %10, 0x3F78618620000000
  %add.712 = fadd float %multiply.611, 0x3EE4F8B580000000
  %14 = tail call float @llvm.nvvm.rsqrt.approx.f(float %add.712)
  %15 = insertelement <4 x float> poison, float %11, i32 0
  %16 = insertelement <4 x float> %15, float %12, i32 1
  %17 = insertelement <4 x float> %16, float %13, i32 2
  %18 = insertelement <4 x float> %17, float %14, i32 3
  store <4 x float> %18, ptr addrspace(1) %5, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(88080384) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(524288) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(88080384) %arg2) local_unnamed_addr #3 {
entry:
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !90
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = udiv i32 %linear_index_base, 168
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg16, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !75
  %8 = zext i32 %linear_index_base to i64
  %9 = getelementptr float, ptr addrspace(1) %arg04, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16, !invariant.load !75
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %multiply.4 = fmul float %7, %11
  %15 = getelementptr float, ptr addrspace(1) %arg28, i64 %8
  %multiply.41 = fmul float %7, %12
  %multiply.42 = fmul float %7, %13
  %multiply.43 = fmul float %7, %14
  %16 = insertelement <4 x float> poison, float %multiply.4, i32 0
  %17 = insertelement <4 x float> %16, float %multiply.41, i32 1
  %18 = insertelement <4 x float> %17, float %multiply.42, i32 2
  %19 = insertelement <4 x float> %18, float %multiply.43, i32 3
  store <4 x float> %19, ptr addrspace(1) %15, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(131072000) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(419430400) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(88080384) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(672) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(672) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(550502400) %arg5) local_unnamed_addr #2 {
entry:
  %arg5141 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4139 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3137 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2135 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1133 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0131 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !95
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 168
  %5 = mul i32 %4, 168
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 168
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 168
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 168
  %9 = urem i32 %4, 100
  %10 = udiv i32 %linear_index_base, 16800
  %11 = icmp ult i32 %.decomposed, 128
  br i1 %11, label %concatenate.pivot.0.11, label %concatenate.pivot.128.12

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.0.11
  %12 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr addrspace(1) %arg2135, i64 0, i64 %16, i64 %17, i64 %18
  br label %concatenate.20.merge.sink.split

concatenate.pivot.0.9:                            ; preds = %concatenate.pivot.128.12
  %13 = zext i32 %.decomposed to i64
  %14 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr addrspace(1) %arg2135, i64 0, i64 %23, i64 %24, i64 %13
  br label %concatenate.20.merge.sink.split

concatenate.pivot.0.11:                           ; preds = %entry
  %15 = icmp ult i32 %9, 16
  %16 = zext i32 %10 to i64
  %17 = zext i32 %9 to i64
  %18 = zext i32 %.decomposed to i64
  %19 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg1133, i64 0, i64 %16, i64 %17, i64 %18
  %20 = load float, ptr addrspace(1) %19, align 4, !invariant.load !75
  br i1 %15, label %concatenate.pivot.0., label %concatenate.20.merge

concatenate.pivot.128.12:                         ; preds = %entry
  %21 = add nsw i32 %.decomposed, -128
  %22 = icmp ult i32 %9, 16
  %23 = zext i32 %10 to i64
  %24 = zext i32 %9 to i64
  %25 = zext i32 %21 to i64
  %26 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg0131, i64 0, i64 %23, i64 %24, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !75
  br i1 %22, label %concatenate.pivot.0.9, label %concatenate.20.merge

concatenate.20.merge.sink.split:                  ; preds = %concatenate.pivot.0., %concatenate.pivot.0.9
  %.sink108 = phi ptr addrspace(1) [ %14, %concatenate.pivot.0.9 ], [ %12, %concatenate.pivot.0. ]
  %.pn129 = phi i64 [ %13, %concatenate.pivot.0.9 ], [ %18, %concatenate.pivot.0. ]
  %.sink = phi float [ %27, %concatenate.pivot.0.9 ], [ %20, %concatenate.pivot.0. ]
  %.sink105.in = getelementptr inbounds [168 x float], ptr addrspace(1) %arg4139, i64 0, i64 %.pn129
  %.sink105 = load float, ptr addrspace(1) %.sink105.in, align 4, !invariant.load !75
  %.sink106.in = getelementptr inbounds [168 x float], ptr addrspace(1) %arg3137, i64 0, i64 %.pn129
  %.sink106 = load float, ptr addrspace(1) %.sink106.in, align 4, !invariant.load !75
  %28 = load float, ptr addrspace(1) %.sink108, align 4, !invariant.load !75
  %multiply.95 = fmul float %.sink106, %28
  %add.106 = fadd float %.sink105, %multiply.95
  %add.17 = fadd float %.sink, %add.106
  br label %concatenate.20.merge

concatenate.20.merge:                             ; preds = %concatenate.20.merge.sink.split, %concatenate.pivot.128.12, %concatenate.pivot.0.11
  %29 = phi float [ %20, %concatenate.pivot.0.11 ], [ %27, %concatenate.pivot.128.12 ], [ %add.17, %concatenate.20.merge.sink.split ]
  %30 = zext i32 %linear_index_base to i64
  %31 = getelementptr float, ptr addrspace(1) %arg5141, i64 %30
  store float %29, ptr addrspace(1) %31, align 16
  %32 = icmp ult i32 %6, 128
  br i1 %32, label %concatenate.pivot.0.35, label %concatenate.pivot.128.36

concatenate.pivot.0.22:                           ; preds = %concatenate.pivot.0.35
  %33 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr addrspace(1) %arg2135, i64 0, i64 %37, i64 %38, i64 %39
  br label %concatenate.20.merge13.sink.split

concatenate.pivot.0.32:                           ; preds = %concatenate.pivot.128.36
  %34 = zext i32 %6 to i64
  %35 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr addrspace(1) %arg2135, i64 0, i64 %44, i64 %45, i64 %34
  br label %concatenate.20.merge13.sink.split

concatenate.pivot.0.35:                           ; preds = %concatenate.20.merge
  %36 = icmp ult i32 %9, 16
  %37 = zext i32 %10 to i64
  %38 = zext i32 %9 to i64
  %39 = zext i32 %6 to i64
  %40 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg1133, i64 0, i64 %37, i64 %38, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !75
  br i1 %36, label %concatenate.pivot.0.22, label %concatenate.20.merge13

concatenate.pivot.128.36:                         ; preds = %concatenate.20.merge
  %42 = add nsw i32 %6, -128
  %43 = icmp ult i32 %9, 16
  %44 = zext i32 %10 to i64
  %45 = zext i32 %9 to i64
  %46 = zext i32 %42 to i64
  %47 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg0131, i64 0, i64 %44, i64 %45, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !75
  br i1 %43, label %concatenate.pivot.0.32, label %concatenate.20.merge13

concatenate.20.merge13.sink.split:                ; preds = %concatenate.pivot.0.22, %concatenate.pivot.0.32
  %.sink113 = phi ptr addrspace(1) [ %35, %concatenate.pivot.0.32 ], [ %33, %concatenate.pivot.0.22 ]
  %.pn127 = phi i64 [ %34, %concatenate.pivot.0.32 ], [ %39, %concatenate.pivot.0.22 ]
  %.sink109 = phi float [ %48, %concatenate.pivot.0.32 ], [ %41, %concatenate.pivot.0.22 ]
  %.sink110.in = getelementptr inbounds [168 x float], ptr addrspace(1) %arg4139, i64 0, i64 %.pn127
  %.sink110 = load float, ptr addrspace(1) %.sink110.in, align 4, !invariant.load !75
  %.sink111.in = getelementptr inbounds [168 x float], ptr addrspace(1) %arg3137, i64 0, i64 %.pn127
  %.sink111 = load float, ptr addrspace(1) %.sink111.in, align 4, !invariant.load !75
  %49 = load float, ptr addrspace(1) %.sink113, align 4, !invariant.load !75
  %multiply.927 = fmul float %.sink111, %49
  %add.1028 = fadd float %.sink110, %multiply.927
  %add.1729 = fadd float %.sink109, %add.1028
  br label %concatenate.20.merge13

concatenate.20.merge13:                           ; preds = %concatenate.20.merge13.sink.split, %concatenate.pivot.128.36, %concatenate.pivot.0.35
  %50 = phi float [ %41, %concatenate.pivot.0.35 ], [ %48, %concatenate.pivot.128.36 ], [ %add.1729, %concatenate.20.merge13.sink.split ]
  %51 = getelementptr inbounds float, ptr addrspace(1) %31, i64 1
  store float %50, ptr addrspace(1) %51, align 4
  %52 = icmp ult i32 %7, 128
  br i1 %52, label %concatenate.pivot.0.59, label %concatenate.pivot.128.60

concatenate.pivot.0.46:                           ; preds = %concatenate.pivot.0.59
  %53 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr addrspace(1) %arg2135, i64 0, i64 %57, i64 %58, i64 %59
  br label %concatenate.20.merge37.sink.split

concatenate.pivot.0.56:                           ; preds = %concatenate.pivot.128.60
  %54 = zext i32 %7 to i64
  %55 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr addrspace(1) %arg2135, i64 0, i64 %64, i64 %65, i64 %54
  br label %concatenate.20.merge37.sink.split

concatenate.pivot.0.59:                           ; preds = %concatenate.20.merge13
  %56 = icmp ult i32 %9, 16
  %57 = zext i32 %10 to i64
  %58 = zext i32 %9 to i64
  %59 = zext i32 %7 to i64
  %60 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg1133, i64 0, i64 %57, i64 %58, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4, !invariant.load !75
  br i1 %56, label %concatenate.pivot.0.46, label %concatenate.20.merge37

concatenate.pivot.128.60:                         ; preds = %concatenate.20.merge13
  %62 = add nsw i32 %7, -128
  %63 = icmp ult i32 %9, 16
  %64 = zext i32 %10 to i64
  %65 = zext i32 %9 to i64
  %66 = zext i32 %62 to i64
  %67 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg0131, i64 0, i64 %64, i64 %65, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !75
  br i1 %63, label %concatenate.pivot.0.56, label %concatenate.20.merge37

concatenate.20.merge37.sink.split:                ; preds = %concatenate.pivot.0.46, %concatenate.pivot.0.56
  %.sink118 = phi ptr addrspace(1) [ %55, %concatenate.pivot.0.56 ], [ %53, %concatenate.pivot.0.46 ]
  %.pn125 = phi i64 [ %54, %concatenate.pivot.0.56 ], [ %59, %concatenate.pivot.0.46 ]
  %.sink114 = phi float [ %68, %concatenate.pivot.0.56 ], [ %61, %concatenate.pivot.0.46 ]
  %.sink115.in = getelementptr inbounds [168 x float], ptr addrspace(1) %arg4139, i64 0, i64 %.pn125
  %.sink115 = load float, ptr addrspace(1) %.sink115.in, align 4, !invariant.load !75
  %.sink116.in = getelementptr inbounds [168 x float], ptr addrspace(1) %arg3137, i64 0, i64 %.pn125
  %.sink116 = load float, ptr addrspace(1) %.sink116.in, align 4, !invariant.load !75
  %69 = load float, ptr addrspace(1) %.sink118, align 4, !invariant.load !75
  %multiply.951 = fmul float %.sink116, %69
  %add.1052 = fadd float %.sink115, %multiply.951
  %add.1753 = fadd float %.sink114, %add.1052
  br label %concatenate.20.merge37

concatenate.20.merge37:                           ; preds = %concatenate.20.merge37.sink.split, %concatenate.pivot.128.60, %concatenate.pivot.0.59
  %70 = phi float [ %61, %concatenate.pivot.0.59 ], [ %68, %concatenate.pivot.128.60 ], [ %add.1753, %concatenate.20.merge37.sink.split ]
  %71 = getelementptr inbounds float, ptr addrspace(1) %31, i64 2
  store float %70, ptr addrspace(1) %71, align 8
  %72 = icmp ult i32 %8, 128
  br i1 %72, label %concatenate.pivot.0.83, label %concatenate.pivot.128.84

concatenate.pivot.0.70:                           ; preds = %concatenate.pivot.0.83
  %73 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr addrspace(1) %arg2135, i64 0, i64 %77, i64 %78, i64 %79
  br label %concatenate.20.merge61.sink.split

concatenate.pivot.0.80:                           ; preds = %concatenate.pivot.128.84
  %74 = zext i32 %8 to i64
  %75 = getelementptr inbounds [8192 x [16 x [168 x float]]], ptr addrspace(1) %arg2135, i64 0, i64 %84, i64 %85, i64 %74
  br label %concatenate.20.merge61.sink.split

concatenate.pivot.0.83:                           ; preds = %concatenate.20.merge37
  %76 = icmp ult i32 %9, 16
  %77 = zext i32 %10 to i64
  %78 = zext i32 %9 to i64
  %79 = zext i32 %8 to i64
  %80 = getelementptr inbounds [8192 x [100 x [128 x float]]], ptr addrspace(1) %arg1133, i64 0, i64 %77, i64 %78, i64 %79
  %81 = load float, ptr addrspace(1) %80, align 4, !invariant.load !75
  br i1 %76, label %concatenate.pivot.0.70, label %concatenate.20.merge61

concatenate.pivot.128.84:                         ; preds = %concatenate.20.merge37
  %82 = add nsw i32 %8, -128
  %83 = icmp ult i32 %9, 16
  %84 = zext i32 %10 to i64
  %85 = zext i32 %9 to i64
  %86 = zext i32 %82 to i64
  %87 = getelementptr inbounds [8192 x [100 x [40 x float]]], ptr addrspace(1) %arg0131, i64 0, i64 %84, i64 %85, i64 %86
  %88 = load float, ptr addrspace(1) %87, align 4, !invariant.load !75
  br i1 %83, label %concatenate.pivot.0.80, label %concatenate.20.merge61

concatenate.20.merge61.sink.split:                ; preds = %concatenate.pivot.0.70, %concatenate.pivot.0.80
  %.sink123 = phi ptr addrspace(1) [ %75, %concatenate.pivot.0.80 ], [ %73, %concatenate.pivot.0.70 ]
  %.pn = phi i64 [ %74, %concatenate.pivot.0.80 ], [ %79, %concatenate.pivot.0.70 ]
  %.sink119 = phi float [ %88, %concatenate.pivot.0.80 ], [ %81, %concatenate.pivot.0.70 ]
  %.sink120.in = getelementptr inbounds [168 x float], ptr addrspace(1) %arg4139, i64 0, i64 %.pn
  %.sink120 = load float, ptr addrspace(1) %.sink120.in, align 4, !invariant.load !75
  %.sink121.in = getelementptr inbounds [168 x float], ptr addrspace(1) %arg3137, i64 0, i64 %.pn
  %.sink121 = load float, ptr addrspace(1) %.sink121.in, align 4, !invariant.load !75
  %89 = load float, ptr addrspace(1) %.sink123, align 4, !invariant.load !75
  %multiply.975 = fmul float %.sink121, %89
  %add.1076 = fadd float %.sink120, %multiply.975
  %add.1777 = fadd float %.sink119, %add.1076
  br label %concatenate.20.merge61

concatenate.20.merge61:                           ; preds = %concatenate.20.merge61.sink.split, %concatenate.pivot.128.84, %concatenate.pivot.0.83
  %90 = phi float [ %81, %concatenate.pivot.0.83 ], [ %88, %concatenate.pivot.128.84 ], [ %add.1777, %concatenate.20.merge61.sink.split ]
  %91 = getelementptr inbounds float, ptr addrspace(1) %31, i64 3
  store float %90, ptr addrspace(1) %91, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(655360000) %arg4) local_unnamed_addr #2 {
entry:
  %arg474 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg372 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg270 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg066 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
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
  br label %concatenate.5.merge

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  %12 = add nsw i32 %.decomposed, -64
  %13 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge

concatenate.pivot.136.:                           ; preds = %entry
  %14 = icmp ult i32 %.decomposed, 136
  br i1 %14, label %concatenate.pivot.128.2, label %concatenate.pivot.136.3

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  %15 = add nsw i32 %.decomposed, -128
  %16 = shl nuw nsw i32 %4, 3
  br label %concatenate.5.merge

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.136.
  %17 = add nsw i32 %.decomposed, -136
  %18 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.136.3, %concatenate.pivot.128.2, %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.sink50 = phi i32 [ %18, %concatenate.pivot.136.3 ], [ %16, %concatenate.pivot.128.2 ], [ %13, %concatenate.pivot.64.1 ], [ %.decomposed, %concatenate.pivot.0. ]
  %.sink = phi i32 [ %17, %concatenate.pivot.136.3 ], [ %15, %concatenate.pivot.128.2 ], [ %12, %concatenate.pivot.64.1 ], [ %11, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg372, %concatenate.pivot.136.3 ], [ %arg270, %concatenate.pivot.128.2 ], [ %arg168, %concatenate.pivot.64.1 ], [ %arg066, %concatenate.pivot.0. ]
  %19 = add nuw nsw i32 %.sink, %.sink50
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !75
  %23 = zext i32 %linear_index_base to i64
  %24 = getelementptr float, ptr addrspace(1) %arg474, i64 %23
  store float %22, ptr addrspace(1) %24, align 16
  %25 = icmp ult i32 %6, 128
  br i1 %25, label %concatenate.pivot.64.10, label %concatenate.pivot.136.13

concatenate.pivot.64.10:                          ; preds = %concatenate.5.merge
  %26 = icmp ult i32 %6, 64
  br i1 %26, label %concatenate.pivot.0.11, label %concatenate.pivot.64.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.64.10
  %27 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge4

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.64.10
  %28 = add nsw i32 %6, -64
  %29 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge4

concatenate.pivot.136.13:                         ; preds = %concatenate.5.merge
  %30 = icmp ult i32 %6, 136
  br i1 %30, label %concatenate.pivot.128.14, label %concatenate.pivot.136.15

concatenate.pivot.128.14:                         ; preds = %concatenate.pivot.136.13
  %31 = add nsw i32 %6, -128
  %32 = shl nuw nsw i32 %4, 3
  br label %concatenate.5.merge4

concatenate.pivot.136.15:                         ; preds = %concatenate.pivot.136.13
  %33 = add nsw i32 %6, -136
  %34 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge4

concatenate.5.merge4:                             ; preds = %concatenate.pivot.136.15, %concatenate.pivot.128.14, %concatenate.pivot.64.12, %concatenate.pivot.0.11
  %.sink55 = phi i32 [ %34, %concatenate.pivot.136.15 ], [ %32, %concatenate.pivot.128.14 ], [ %29, %concatenate.pivot.64.12 ], [ %6, %concatenate.pivot.0.11 ]
  %.sink54 = phi i32 [ %33, %concatenate.pivot.136.15 ], [ %31, %concatenate.pivot.128.14 ], [ %28, %concatenate.pivot.64.12 ], [ %27, %concatenate.pivot.0.11 ]
  %arg3.sink51 = phi ptr addrspace(1) [ %arg372, %concatenate.pivot.136.15 ], [ %arg270, %concatenate.pivot.128.14 ], [ %arg168, %concatenate.pivot.64.12 ], [ %arg066, %concatenate.pivot.0.11 ]
  %35 = add nuw nsw i32 %.sink54, %.sink55
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink51, i64 %36
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !75
  %39 = getelementptr inbounds float, ptr addrspace(1) %24, i64 1
  store float %38, ptr addrspace(1) %39, align 4
  %40 = icmp ult i32 %7, 128
  br i1 %40, label %concatenate.pivot.64.22, label %concatenate.pivot.136.25

concatenate.pivot.64.22:                          ; preds = %concatenate.5.merge4
  %41 = icmp ult i32 %7, 64
  br i1 %41, label %concatenate.pivot.0.23, label %concatenate.pivot.64.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.64.22
  %42 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge16

concatenate.pivot.64.24:                          ; preds = %concatenate.pivot.64.22
  %43 = add nsw i32 %7, -64
  %44 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge16

concatenate.pivot.136.25:                         ; preds = %concatenate.5.merge4
  %45 = icmp ult i32 %7, 136
  br i1 %45, label %concatenate.pivot.128.26, label %concatenate.pivot.136.27

concatenate.pivot.128.26:                         ; preds = %concatenate.pivot.136.25
  %46 = add nsw i32 %7, -128
  %47 = shl nuw nsw i32 %4, 3
  br label %concatenate.5.merge16

concatenate.pivot.136.27:                         ; preds = %concatenate.pivot.136.25
  %48 = add nsw i32 %7, -136
  %49 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge16

concatenate.5.merge16:                            ; preds = %concatenate.pivot.136.27, %concatenate.pivot.128.26, %concatenate.pivot.64.24, %concatenate.pivot.0.23
  %.sink60 = phi i32 [ %49, %concatenate.pivot.136.27 ], [ %47, %concatenate.pivot.128.26 ], [ %44, %concatenate.pivot.64.24 ], [ %7, %concatenate.pivot.0.23 ]
  %.sink59 = phi i32 [ %48, %concatenate.pivot.136.27 ], [ %46, %concatenate.pivot.128.26 ], [ %43, %concatenate.pivot.64.24 ], [ %42, %concatenate.pivot.0.23 ]
  %arg3.sink56 = phi ptr addrspace(1) [ %arg372, %concatenate.pivot.136.27 ], [ %arg270, %concatenate.pivot.128.26 ], [ %arg168, %concatenate.pivot.64.24 ], [ %arg066, %concatenate.pivot.0.23 ]
  %50 = add nuw nsw i32 %.sink59, %.sink60
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink56, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !75
  %54 = getelementptr inbounds float, ptr addrspace(1) %24, i64 2
  store float %53, ptr addrspace(1) %54, align 8
  %55 = icmp ult i32 %8, 128
  br i1 %55, label %concatenate.pivot.64.34, label %concatenate.pivot.136.37

concatenate.pivot.64.34:                          ; preds = %concatenate.5.merge16
  %56 = icmp ult i32 %8, 64
  br i1 %56, label %concatenate.pivot.0.35, label %concatenate.pivot.64.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.64.34
  %57 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge28

concatenate.pivot.64.36:                          ; preds = %concatenate.pivot.64.34
  %58 = add nsw i32 %8, -64
  %59 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge28

concatenate.pivot.136.37:                         ; preds = %concatenate.5.merge16
  %60 = icmp ult i32 %8, 136
  br i1 %60, label %concatenate.pivot.128.38, label %concatenate.pivot.136.39

concatenate.pivot.128.38:                         ; preds = %concatenate.pivot.136.37
  %61 = add nsw i32 %8, -128
  %62 = shl nuw nsw i32 %4, 3
  br label %concatenate.5.merge28

concatenate.pivot.136.39:                         ; preds = %concatenate.pivot.136.37
  %63 = add nsw i32 %8, -136
  %64 = shl nuw nsw i32 %4, 6
  br label %concatenate.5.merge28

concatenate.5.merge28:                            ; preds = %concatenate.pivot.136.39, %concatenate.pivot.128.38, %concatenate.pivot.64.36, %concatenate.pivot.0.35
  %.sink65 = phi i32 [ %64, %concatenate.pivot.136.39 ], [ %62, %concatenate.pivot.128.38 ], [ %59, %concatenate.pivot.64.36 ], [ %8, %concatenate.pivot.0.35 ]
  %.sink64 = phi i32 [ %63, %concatenate.pivot.136.39 ], [ %61, %concatenate.pivot.128.38 ], [ %58, %concatenate.pivot.64.36 ], [ %57, %concatenate.pivot.0.35 ]
  %arg3.sink61 = phi ptr addrspace(1) [ %arg372, %concatenate.pivot.136.39 ], [ %arg270, %concatenate.pivot.128.38 ], [ %arg168, %concatenate.pivot.64.36 ], [ %arg066, %concatenate.pivot.0.35 ]
  %65 = add nuw nsw i32 %.sink64, %.sink65
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink61, i64 %66
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !75
  %69 = getelementptr inbounds float, ptr addrspace(1) %24, i64 3
  store float %68, ptr addrspace(1) %69, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(838860800) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg2) local_unnamed_addr #6 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !87
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !97
  %2 = lshr i32 %0, 5
  %3 = mul nuw nsw i32 %1, 3
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 3276800
  br i1 %5, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %entry
  %6 = and i32 %0, 31
  %7 = shl nuw nsw i32 %4, 6
  %8 = or i32 %6, %7
  %9 = and i32 %7, 192
  %10 = udiv i32 %4, 400
  %11 = or i32 %9, %6
  %12 = zext i32 %10 to i64
  %13 = zext i32 %11 to i64
  %Arg_0.112 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg044, i64 0, i64 %12, i64 %13
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !75
  %14 = zext i32 %8 to i64
  %Arg_1.214 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %14
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !75
  %multiply.616 = fmul float %Arg_0.113, %Arg_1.215
  %add.11.i41 = fadd float %multiply.616, 0.000000e+00
  %15 = zext i32 %9 to i64
  %16 = zext i32 %6 to i64
  %17 = add i64 %15, %16
  %18 = getelementptr [8192 x [256 x float]], ptr addrspace(1) %arg044, i64 0, i64 %12, i64 %17
  %Arg_0.112.151 = getelementptr inbounds float, ptr addrspace(1) %18, i64 32
  %Arg_0.113.1 = load float, ptr addrspace(1) %Arg_0.112.151, align 4, !invariant.load !75
  %19 = zext i32 %7 to i64
  %20 = add i64 %16, %19
  %21 = getelementptr float, ptr addrspace(1) %arg146, i64 %20
  %Arg_1.214.153 = getelementptr inbounds float, ptr addrspace(1) %21, i64 32
  %Arg_1.215.1 = load float, ptr addrspace(1) %Arg_1.214.153, align 4, !invariant.load !75
  %multiply.616.1 = fmul float %Arg_0.113.1, %Arg_1.215.1
  %add.11.i41.1 = fadd float %add.11.i41, %multiply.616.1
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i41.1, i32 16, i32 31)
  %add.11.i = fadd float %add.11.i41.1, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i, i32 8, i32 31)
  %add.11.i37 = fadd float %add.11.i, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i37, i32 4, i32 31)
  %add.11.i38 = fadd float %add.11.i37, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i38, i32 2, i32 31)
  %add.11.i39 = fadd float %add.11.i38, %25
  %26 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.11.i39, i32 1, i32 31)
  %27 = icmp eq i32 %6, 0
  %28 = zext i32 %2 to i64
  %29 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 %28, i64 0, i64 0
  %add.11.i40 = fadd float %add.11.i39, %26
  br i1 %27, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %tile_loop.loop_header6.preheader
  %30 = icmp eq i32 %6, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %30, label %reduction_write_output-true, label %common.ret

intra_warp_reduce_write-true:                     ; preds = %tile_loop.loop_header6.preheader
  store float %add.11.i40, ptr addrspace(3) %29, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %31 = and i32 %4, 3
  %32 = lshr i32 %4, 2
  %33 = urem i32 %32, 100
  %34 = zext i32 %31 to i64
  %35 = zext i32 %33 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg248, i64 0, i64 %12, i64 %34, i64 %35
  %output.then.val = load float, ptr addrspace(3) %29, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg11) local_unnamed_addr #3 {
entry:
  %arg1160 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1058 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg956 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg854 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg752 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg650 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg548 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg446 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg344 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg242 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg140 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg038 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !98
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index_base, 400
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %5 = udiv i32 %linear_index_base.frozen, 100
  %6 = and i32 %5, 3
  %7 = urem i32 %linear_index3, 100
  %linear_index2 = or i32 %linear_index_base, 2
  %8 = urem i32 %linear_index2, 100
  %linear_index1 = or i32 %linear_index_base, 1
  %9 = urem i32 %linear_index1, 100
  %10 = mul i32 %5, 100
  %.decomposed = sub i32 %linear_index_base.frozen, %10
  %11 = mul nuw nsw i32 %4, 100
  %12 = add nuw nsw i32 %11, %.decomposed
  %.frozen = freeze i32 %12
  %13 = udiv i32 %.frozen, 100
  %14 = mul i32 %13, 100
  %.decomposed31 = sub i32 %.frozen, %14
  %15 = zext i32 %13 to i64
  %16 = zext i32 %.decomposed31 to i64
  %17 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1058, i64 0, i64 %15, i64 %16, i64 0
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !75
  %19 = zext i32 %6 to i64
  %20 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg956, i64 0, i64 0, i64 %19
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !75
  %multiply.16 = fmul float %18, %21
  %22 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg854, i64 0, i64 %15, i64 %16, i64 0
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !75
  %24 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg752, i64 0, i64 0, i64 %19
  %25 = load float, ptr addrspace(1) %24, align 4, !invariant.load !75
  %multiply.21 = fmul float %23, %25
  %add.22 = fadd float %multiply.16, %multiply.21
  %26 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg650, i64 0, i64 %15, i64 %16, i64 0
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !75
  %28 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg548, i64 0, i64 0, i64 %19
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !75
  %multiply.27 = fmul float %27, %29
  %add.28 = fadd float %add.22, %multiply.27
  %30 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg446, i64 0, i64 %15, i64 %16, i64 0
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !75
  %32 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg344, i64 0, i64 0, i64 %19
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !75
  %multiply.33 = fmul float %31, %33
  %add.34 = fadd float %add.28, %multiply.33
  %34 = load float, ptr addrspace(1) %arg242, align 16, !invariant.load !75
  %35 = zext i32 %linear_index_base to i64
  %36 = getelementptr float, ptr addrspace(1) %arg140, i64 %35
  %37 = load <4 x float>, ptr addrspace(1) %36, align 16, !invariant.load !75
  %38 = extractelement <4 x float> %37, i32 0
  %39 = extractelement <4 x float> %37, i32 1
  %40 = extractelement <4 x float> %37, i32 2
  %41 = extractelement <4 x float> %37, i32 3
  %multiply.39 = fmul float %34, %38
  %add.40 = fadd float %add.34, %multiply.39
  %42 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg038, i64 0, i64 %19
  %43 = load float, ptr addrspace(1) %42, align 4, !invariant.load !75
  %add.42 = fadd float %43, %add.40
  %44 = getelementptr float, ptr addrspace(1) %arg1160, i64 %35
  %45 = add nuw nsw i32 %9, %11
  %.frozen32 = freeze i32 %45
  %46 = udiv i32 %.frozen32, 100
  %47 = mul i32 %46, 100
  %.decomposed33 = sub i32 %.frozen32, %47
  %48 = zext i32 %46 to i64
  %49 = zext i32 %.decomposed33 to i64
  %50 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1058, i64 0, i64 %48, i64 %49, i64 0
  %51 = load float, ptr addrspace(1) %50, align 4, !invariant.load !75
  %multiply.161 = fmul float %21, %51
  %52 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg854, i64 0, i64 %48, i64 %49, i64 0
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !75
  %multiply.212 = fmul float %25, %53
  %add.223 = fadd float %multiply.161, %multiply.212
  %54 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg650, i64 0, i64 %48, i64 %49, i64 0
  %55 = load float, ptr addrspace(1) %54, align 4, !invariant.load !75
  %multiply.274 = fmul float %29, %55
  %add.285 = fadd float %add.223, %multiply.274
  %56 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg446, i64 0, i64 %48, i64 %49, i64 0
  %57 = load float, ptr addrspace(1) %56, align 4, !invariant.load !75
  %multiply.336 = fmul float %33, %57
  %add.347 = fadd float %add.285, %multiply.336
  %multiply.398 = fmul float %34, %39
  %add.409 = fadd float %add.347, %multiply.398
  %add.4210 = fadd float %43, %add.409
  %58 = add nuw nsw i32 %8, %11
  %.frozen34 = freeze i32 %58
  %59 = udiv i32 %.frozen34, 100
  %60 = mul i32 %59, 100
  %.decomposed35 = sub i32 %.frozen34, %60
  %61 = zext i32 %59 to i64
  %62 = zext i32 %.decomposed35 to i64
  %63 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1058, i64 0, i64 %61, i64 %62, i64 0
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !75
  %multiply.1611 = fmul float %21, %64
  %65 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg854, i64 0, i64 %61, i64 %62, i64 0
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !75
  %multiply.2112 = fmul float %25, %66
  %add.2213 = fadd float %multiply.1611, %multiply.2112
  %67 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg650, i64 0, i64 %61, i64 %62, i64 0
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !75
  %multiply.2714 = fmul float %29, %68
  %add.2815 = fadd float %add.2213, %multiply.2714
  %69 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg446, i64 0, i64 %61, i64 %62, i64 0
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !75
  %multiply.3316 = fmul float %33, %70
  %add.3417 = fadd float %add.2815, %multiply.3316
  %multiply.3918 = fmul float %34, %40
  %add.4019 = fadd float %add.3417, %multiply.3918
  %add.4220 = fadd float %43, %add.4019
  %71 = add nuw nsw i32 %7, %11
  %.frozen36 = freeze i32 %71
  %72 = udiv i32 %.frozen36, 100
  %73 = mul i32 %72, 100
  %.decomposed37 = sub i32 %.frozen36, %73
  %74 = zext i32 %72 to i64
  %75 = zext i32 %.decomposed37 to i64
  %76 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg1058, i64 0, i64 %74, i64 %75, i64 0
  %77 = load float, ptr addrspace(1) %76, align 4, !invariant.load !75
  %multiply.1621 = fmul float %21, %77
  %78 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg854, i64 0, i64 %74, i64 %75, i64 0
  %79 = load float, ptr addrspace(1) %78, align 4, !invariant.load !75
  %multiply.2122 = fmul float %25, %79
  %add.2223 = fadd float %multiply.1621, %multiply.2122
  %80 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg650, i64 0, i64 %74, i64 %75, i64 0
  %81 = load float, ptr addrspace(1) %80, align 4, !invariant.load !75
  %multiply.2724 = fmul float %29, %81
  %add.2825 = fadd float %add.2223, %multiply.2724
  %82 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg446, i64 0, i64 %74, i64 %75, i64 0
  %83 = load float, ptr addrspace(1) %82, align 4, !invariant.load !75
  %multiply.3326 = fmul float %33, %83
  %add.3427 = fadd float %add.2825, %multiply.3326
  %multiply.3928 = fmul float %34, %41
  %add.4029 = fadd float %add.3427, %multiply.3928
  %add.4230 = fadd float %43, %add.4029
  %84 = insertelement <4 x float> poison, float %add.42, i32 0
  %85 = insertelement <4 x float> %84, float %add.4210, i32 1
  %86 = insertelement <4 x float> %85, float %add.4220, i32 2
  %87 = insertelement <4 x float> %86, float %add.4230, i32 3
  store <4 x float> %87, ptr addrspace(1) %44, align 16
  ret void
}

; Function Attrs: nounwind
define void @reduce_330(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #6 {
entry:
  %arg244 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg142 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg040 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !87
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !99
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header5.preheader, label %common.ret

tile_loop.loop_header5.preheader:                 ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %Arg_1.2 = load float, ptr addrspace(1) %arg142, align 128, !invariant.load !75
  %8 = fcmp uno float %Arg_1.2, 0.000000e+00
  %9 = add nuw nsw i32 %2, %7
  %10 = zext i32 %9 to i64
  %Arg_0.111 = getelementptr inbounds float, ptr addrspace(1) %arg040, i64 %10
  %Arg_0.112 = load float, ptr addrspace(1) %Arg_0.111, align 4, !invariant.load !75
  %11 = fcmp oge float %Arg_1.2, %Arg_0.112
  %12 = or i1 %8, %11
  %maximum.6.i37 = select i1 %12, float %Arg_1.2, float %Arg_0.112
  %13 = fcmp uno float %maximum.6.i37, 0.000000e+00
  %14 = zext i32 %7 to i64
  %15 = zext i32 %2 to i64
  %16 = add i64 %15, %14
  %17 = getelementptr float, ptr addrspace(1) %arg040, i64 %16
  %Arg_0.111.147 = getelementptr inbounds float, ptr addrspace(1) %17, i64 32
  %Arg_0.112.1 = load float, ptr addrspace(1) %Arg_0.111.147, align 4, !invariant.load !75
  %18 = fcmp oge float %maximum.6.i37, %Arg_0.112.1
  %19 = or i1 %13, %18
  %maximum.6.i37.1 = select i1 %19, float %maximum.6.i37, float %Arg_0.112.1
  %20 = fcmp uno float %maximum.6.i37.1, 0.000000e+00
  %Arg_0.111.249 = getelementptr inbounds float, ptr addrspace(1) %17, i64 64
  %Arg_0.112.2 = load float, ptr addrspace(1) %Arg_0.111.249, align 4, !invariant.load !75
  %21 = fcmp oge float %maximum.6.i37.1, %Arg_0.112.2
  %22 = or i1 %20, %21
  %maximum.6.i37.2 = select i1 %22, float %maximum.6.i37.1, float %Arg_0.112.2
  %x_loc10.3 = or i32 %0, 96
  %23 = icmp ult i32 %x_loc10.3, 100
  %24 = add nuw nsw i32 %x_loc10.3, %7
  %25 = zext i32 %24 to i64
  %Arg_0.111.3 = getelementptr inbounds float, ptr addrspace(1) %arg040, i64 %25
  br i1 %23, label %x_in_tile-true.3, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %26 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %27 = lshr i32 %5, 2
  %28 = zext i32 %27 to i64
  %29 = and i32 %5, 3
  %30 = zext i32 %29 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg244, i64 0, i64 %28, i64 %30
  br i1 %26, label %reduction_write_output-true, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header5.preheader
  %31 = fcmp uno float %maximum.6.i37.2, 0.000000e+00
  %Arg_0.112.3 = load float, ptr addrspace(1) %Arg_0.111.3, align 4, !invariant.load !75
  %32 = fcmp oge float %maximum.6.i37.2, %Arg_0.112.3
  %33 = or i1 %31, %32
  %maximum.6.i37.3 = select i1 %33, float %maximum.6.i37.2, float %Arg_0.112.3
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header5.preheader
  %partial_reduction_result.1.3 = phi float [ %maximum.6.i37.3, %x_in_tile-true.3 ], [ %maximum.6.i37.2, %tile_loop.loop_header5.preheader ]
  %34 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %35 = fcmp oge float %partial_reduction_result.1.3, %34
  %36 = fcmp uno float %partial_reduction_result.1.3, 0.000000e+00
  %37 = or i1 %36, %35
  %maximum.6.i = select i1 %37, float %partial_reduction_result.1.3, float %34
  %38 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.6.i, i32 8, i32 31)
  %39 = fcmp oge float %maximum.6.i, %38
  %40 = fcmp uno float %maximum.6.i, 0.000000e+00
  %41 = or i1 %40, %39
  %maximum.6.i33 = select i1 %41, float %maximum.6.i, float %38
  %42 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.6.i33, i32 4, i32 31)
  %43 = fcmp oge float %maximum.6.i33, %42
  %44 = fcmp uno float %maximum.6.i33, 0.000000e+00
  %45 = or i1 %44, %43
  %maximum.6.i34 = select i1 %45, float %maximum.6.i33, float %42
  %46 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.6.i34, i32 2, i32 31)
  %47 = fcmp oge float %maximum.6.i34, %46
  %48 = fcmp uno float %maximum.6.i34, 0.000000e+00
  %49 = or i1 %48, %47
  %maximum.6.i35 = select i1 %49, float %maximum.6.i34, float %46
  %50 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.6.i35, i32 1, i32 31)
  %51 = icmp eq i32 %2, 0
  %52 = zext i32 %3 to i64
  %53 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i64 0, i64 %52, i64 0, i64 0
  %54 = fcmp uno float %maximum.6.i35, 0.000000e+00
  %55 = fcmp oge float %maximum.6.i35, %50
  %56 = or i1 %54, %55
  %maximum.6.i36 = select i1 %56, float %maximum.6.i35, float %50
  br i1 %51, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %maximum.6.i36, ptr addrspace(3) %53, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %53, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_34(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #6 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !87
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !99
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %8 = add nuw nsw i32 %2, %7
  %9 = udiv i32 %8, 100
  %10 = zext i32 %8 to i64
  %Arg_0.112 = getelementptr inbounds float, ptr addrspace(1) %arg044, i64 %10
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !75
  %11 = zext i32 %9 to i64
  %Arg_1.214 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %11
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !75
  %subtract.416 = fsub float %Arg_0.113, %Arg_1.215
  %12 = tail call float @llvm.fma.f32(float %subtract.416, float 0x3F777313A0000000, float 5.000000e-01)
  %13 = tail call float @llvm.nvvm.saturate.f(float %12) #6
  %14 = tail call float @llvm.nvvm.fma.rm.f(float %13, float 2.520000e+02, float 0x4168000020000000) #6
  %15 = fadd float %14, 0xC168000FE0000000
  %16 = fneg float %15
  %17 = tail call float @llvm.fma.f32(float %subtract.416, float 0x3FF7154760000000, float %16)
  %18 = tail call float @llvm.fma.f32(float %subtract.416, float 0x3E54AE0C00000000, float %17)
  %19 = bitcast float %14 to i32
  %20 = shl i32 %19, 23
  %21 = bitcast i32 %20 to float
  %22 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %18) #6
  %23 = fmul float %22, %21
  %x_loc11.1 = or i32 %2, 32
  %24 = add nuw nsw i32 %x_loc11.1, %7
  %25 = udiv i32 %24, 100
  %26 = zext i32 %7 to i64
  %27 = zext i32 %2 to i64
  %28 = add i64 %27, %26
  %29 = getelementptr float, ptr addrspace(1) %arg044, i64 %28
  %Arg_0.112.151 = getelementptr inbounds float, ptr addrspace(1) %29, i64 32
  %Arg_0.113.1 = load float, ptr addrspace(1) %Arg_0.112.151, align 4, !invariant.load !75
  %30 = zext i32 %25 to i64
  %Arg_1.214.1 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %30
  %Arg_1.215.1 = load float, ptr addrspace(1) %Arg_1.214.1, align 4, !invariant.load !75
  %subtract.416.1 = fsub float %Arg_0.113.1, %Arg_1.215.1
  %31 = tail call float @llvm.fma.f32(float %subtract.416.1, float 0x3F777313A0000000, float 5.000000e-01)
  %32 = tail call float @llvm.nvvm.saturate.f(float %31) #6
  %33 = tail call float @llvm.nvvm.fma.rm.f(float %32, float 2.520000e+02, float 0x4168000020000000) #6
  %34 = fadd float %33, 0xC168000FE0000000
  %35 = fneg float %34
  %36 = tail call float @llvm.fma.f32(float %subtract.416.1, float 0x3FF7154760000000, float %35)
  %37 = tail call float @llvm.fma.f32(float %subtract.416.1, float 0x3E54AE0C00000000, float %36)
  %38 = bitcast float %33 to i32
  %39 = shl i32 %38, 23
  %40 = bitcast i32 %39 to float
  %41 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %37) #6
  %42 = fmul float %41, %40
  %add.10.i41.1 = fadd float %23, %42
  %x_loc11.2 = or i32 %2, 64
  %43 = add nuw nsw i32 %x_loc11.2, %7
  %44 = udiv i32 %43, 100
  %Arg_0.112.253 = getelementptr inbounds float, ptr addrspace(1) %29, i64 64
  %Arg_0.113.2 = load float, ptr addrspace(1) %Arg_0.112.253, align 4, !invariant.load !75
  %45 = zext i32 %44 to i64
  %Arg_1.214.2 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %45
  %Arg_1.215.2 = load float, ptr addrspace(1) %Arg_1.214.2, align 4, !invariant.load !75
  %subtract.416.2 = fsub float %Arg_0.113.2, %Arg_1.215.2
  %46 = tail call float @llvm.fma.f32(float %subtract.416.2, float 0x3F777313A0000000, float 5.000000e-01)
  %47 = tail call float @llvm.nvvm.saturate.f(float %46) #6
  %48 = tail call float @llvm.nvvm.fma.rm.f(float %47, float 2.520000e+02, float 0x4168000020000000) #6
  %49 = fadd float %48, 0xC168000FE0000000
  %50 = fneg float %49
  %51 = tail call float @llvm.fma.f32(float %subtract.416.2, float 0x3FF7154760000000, float %50)
  %52 = tail call float @llvm.fma.f32(float %subtract.416.2, float 0x3E54AE0C00000000, float %51)
  %53 = bitcast float %48 to i32
  %54 = shl i32 %53, 23
  %55 = bitcast i32 %54 to float
  %56 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %52) #6
  %57 = fmul float %56, %55
  %add.10.i41.2 = fadd float %add.10.i41.1, %57
  %x_loc11.3 = or i32 %0, 96
  %58 = icmp ult i32 %x_loc11.3, 100
  br i1 %58, label %x_in_tile-true.3, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %59 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %60 = lshr i32 %5, 2
  %61 = zext i32 %60 to i64
  %62 = and i32 %5, 3
  %63 = zext i32 %62 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg248, i64 0, i64 %61, i64 %63
  br i1 %59, label %reduction_write_output-true, label %common.ret

x_in_tile-true.3:                                 ; preds = %tile_loop.loop_header6.preheader
  %64 = add nuw nsw i32 %x_loc11.3, %7
  %65 = udiv i32 %64, 100
  %66 = zext i32 %64 to i64
  %Arg_0.112.3 = getelementptr inbounds float, ptr addrspace(1) %arg044, i64 %66
  %Arg_0.113.3 = load float, ptr addrspace(1) %Arg_0.112.3, align 4, !invariant.load !75
  %67 = zext i32 %65 to i64
  %Arg_1.214.3 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %67
  %Arg_1.215.3 = load float, ptr addrspace(1) %Arg_1.214.3, align 4, !invariant.load !75
  %subtract.416.3 = fsub float %Arg_0.113.3, %Arg_1.215.3
  %68 = tail call float @llvm.fma.f32(float %subtract.416.3, float 0x3F777313A0000000, float 5.000000e-01)
  %69 = tail call float @llvm.nvvm.saturate.f(float %68) #6
  %70 = tail call float @llvm.nvvm.fma.rm.f(float %69, float 2.520000e+02, float 0x4168000020000000) #6
  %71 = fadd float %70, 0xC168000FE0000000
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %subtract.416.3, float 0x3FF7154760000000, float %72)
  %74 = tail call float @llvm.fma.f32(float %subtract.416.3, float 0x3E54AE0C00000000, float %73)
  %75 = bitcast float %70 to i32
  %76 = shl i32 %75, 23
  %77 = bitcast i32 %76 to float
  %78 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %74) #6
  %79 = fmul float %78, %77
  %add.10.i41.3 = fadd float %add.10.i41.2, %79
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.3, %tile_loop.loop_header6.preheader
  %partial_reduction_result.1.3 = phi float [ %add.10.i41.3, %x_in_tile-true.3 ], [ %add.10.i41.2, %tile_loop.loop_header6.preheader ]
  %80 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.3, i32 16, i32 31)
  %add.10.i = fadd float %partial_reduction_result.1.3, %80
  %81 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i, i32 8, i32 31)
  %add.10.i37 = fadd float %add.10.i, %81
  %82 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i37, i32 4, i32 31)
  %add.10.i38 = fadd float %add.10.i37, %82
  %83 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i38, i32 2, i32 31)
  %add.10.i39 = fadd float %add.10.i38, %83
  %84 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i39, i32 1, i32 31)
  %85 = icmp eq i32 %2, 0
  %86 = zext i32 %3 to i64
  %87 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i64 0, i64 %86, i64 0, i64 0
  %add.10.i40 = fadd float %add.10.i39, %84
  br i1 %85, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.10.i40, ptr addrspace(3) %87, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %87, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #3 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !98
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = udiv i32 %linear_index_base, 100
  %5 = zext i32 %linear_index_base to i64
  %6 = getelementptr float, ptr addrspace(1) %arg19, i64 %5
  %7 = load <4 x float>, ptr addrspace(1) %6, align 16
  %8 = extractelement <4 x float> %7, i32 0
  %9 = extractelement <4 x float> %7, i32 1
  %10 = extractelement <4 x float> %7, i32 2
  %11 = extractelement <4 x float> %7, i32 3
  %12 = zext i32 %4 to i64
  %13 = getelementptr inbounds float, ptr addrspace(1) %arg211, i64 %12
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !75
  %subtract.5 = fsub float %8, %14
  %15 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3F777313A0000000, float 5.000000e-01)
  %16 = tail call float @llvm.nvvm.saturate.f(float %15) #6
  %17 = tail call float @llvm.nvvm.fma.rm.f(float %16, float 2.520000e+02, float 0x4168000020000000) #6
  %18 = fadd float %17, 0xC168000FE0000000
  %19 = fneg float %18
  %20 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3FF7154760000000, float %19)
  %21 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3E54AE0C00000000, float %20)
  %22 = bitcast float %17 to i32
  %23 = shl i32 %22, 23
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %21) #6
  %26 = fmul float %25, %24
  %27 = getelementptr inbounds float, ptr addrspace(1) %arg07, i64 %12
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !75
  %divide.8 = fdiv float %26, %28
  %subtract.51 = fsub float %9, %14
  %29 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3F777313A0000000, float 5.000000e-01)
  %30 = tail call float @llvm.nvvm.saturate.f(float %29) #6
  %31 = tail call float @llvm.nvvm.fma.rm.f(float %30, float 2.520000e+02, float 0x4168000020000000) #6
  %32 = fadd float %31, 0xC168000FE0000000
  %33 = fneg float %32
  %34 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3FF7154760000000, float %33)
  %35 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3E54AE0C00000000, float %34)
  %36 = bitcast float %31 to i32
  %37 = shl i32 %36, 23
  %38 = bitcast i32 %37 to float
  %39 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %35) #6
  %40 = fmul float %39, %38
  %divide.82 = fdiv float %40, %28
  %subtract.53 = fsub float %10, %14
  %41 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3F777313A0000000, float 5.000000e-01)
  %42 = tail call float @llvm.nvvm.saturate.f(float %41) #6
  %43 = tail call float @llvm.nvvm.fma.rm.f(float %42, float 2.520000e+02, float 0x4168000020000000) #6
  %44 = fadd float %43, 0xC168000FE0000000
  %45 = fneg float %44
  %46 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3FF7154760000000, float %45)
  %47 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3E54AE0C00000000, float %46)
  %48 = bitcast float %43 to i32
  %49 = shl i32 %48, 23
  %50 = bitcast i32 %49 to float
  %51 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %47) #6
  %52 = fmul float %51, %50
  %divide.84 = fdiv float %52, %28
  %subtract.55 = fsub float %11, %14
  %53 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3F777313A0000000, float 5.000000e-01)
  %54 = tail call float @llvm.nvvm.saturate.f(float %53) #6
  %55 = tail call float @llvm.nvvm.fma.rm.f(float %54, float 2.520000e+02, float 0x4168000020000000) #6
  %56 = fadd float %55, 0xC168000FE0000000
  %57 = fneg float %56
  %58 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3FF7154760000000, float %57)
  %59 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3E54AE0C00000000, float %58)
  %60 = bitcast float %55 to i32
  %61 = shl i32 %60, 23
  %62 = bitcast i32 %61 to float
  %63 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %59) #6
  %64 = fmul float %63, %62
  %divide.86 = fdiv float %64, %28
  %65 = insertelement <4 x float> poison, float %divide.8, i32 0
  %66 = insertelement <4 x float> %65, float %divide.82, i32 1
  %67 = insertelement <4 x float> %66, float %divide.84, i32 2
  %68 = insertelement <4 x float> %67, float %divide.86, i32 3
  store <4 x float> %68, ptr addrspace(1) %6, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_28(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg1) local_unnamed_addr #3 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !98
  %1 = shl nuw nsw i32 %0, 8
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %linear_index = or i32 %1, %2
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 100
  %4 = mul i32 %3, 100
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = zext i32 %3 to i64
  %6 = zext i32 %.decomposed to i64
  %7 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 0, i64 %6
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !75
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg13, i64 %9
  %11 = getelementptr inbounds float, ptr addrspace(1) %7, i64 100
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !75
  %13 = getelementptr inbounds float, ptr addrspace(1) %7, i64 200
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !75
  %15 = getelementptr inbounds float, ptr addrspace(1) %7, i64 300
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !75
  %17 = insertelement <4 x float> poison, float %8, i32 0
  %18 = insertelement <4 x float> %17, float %12, i32 1
  %19 = insertelement <4 x float> %18, float %14, i32 2
  %20 = insertelement <4 x float> %19, float %16, i32 3
  store <4 x float> %20, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @transpose_233(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg1) local_unnamed_addr #3 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !98
  %1 = shl nuw nsw i32 %0, 8
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !79
  %linear_index = or i32 %1, %2
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 100
  %4 = mul i32 %3, 100
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = zext i32 %3 to i64
  %6 = zext i32 %.decomposed to i64
  %7 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 0, i64 %6
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !75
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg13, i64 %9
  %11 = getelementptr inbounds float, ptr addrspace(1) %7, i64 100
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !75
  %13 = getelementptr inbounds float, ptr addrspace(1) %7, i64 200
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !75
  %15 = getelementptr inbounds float, ptr addrspace(1) %7, i64 300
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !75
  %17 = insertelement <4 x float> poison, float %8, i32 0
  %18 = insertelement <4 x float> %17, float %12, i32 1
  %19 = insertelement <4 x float> %18, float %14, i32 2
  %20 = insertelement <4 x float> %19, float %16, i32 3
  store <4 x float> %20, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(838860800) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg2) local_unnamed_addr #6 {
entry:
  %arg282 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg180 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg078 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !91
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !77
  %thread_id.x = and i32 %1, 31
  %thread_id.y51 = lshr i32 %1, 5
  %2 = lshr i32 %0, 2
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 192
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = mul nuw nsw i32 %2, 25600
  %6 = and i32 %0, 3
  %7 = shl nuw nsw i32 %6, 6
  %8 = or i32 %4, %7
  %9 = zext i32 %8 to i64
  %10 = zext i32 %6 to i64
  %11 = add nuw nsw i32 %thread_id.y51, -32
  %12 = shl nuw nsw i32 %thread_id.y51, 8
  %13 = add i32 %5, %12
  %14 = add i32 %13, %tile_origin.2
  %15 = add i32 %14, %4
  %16 = zext i32 %15 to i64
  %17 = lshr i64 %16, 8
  %18 = shl nuw nsw i64 %17, 4
  %19 = shl nuw nsw i64 %10, 2
  %20 = add i64 %18, %19
  %scevgep = getelementptr i8, ptr addrspace(1) %arg078, i64 %20
  %21 = lshr i32 %15, 8
  %22 = add nuw nsw i64 %16, 1
  %23 = lshr i64 %22, 8
  %24 = shl nuw nsw i64 %23, 4
  %25 = add i64 %24, %19
  %scevgep99 = getelementptr i8, ptr addrspace(1) %arg078, i64 %25
  %26 = add i32 %15, 1
  %27 = lshr i32 %26, 8
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true46
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %y_in_tile.loop_body
  %lsr.iv109 = phi i32 [ %27, %entry ], [ %lsr.iv.next110, %y_in_tile.loop_body ]
  %lsr.iv104 = phi i64 [ %23, %entry ], [ %lsr.iv.next105, %y_in_tile.loop_body ]
  %lsr.iv102 = phi i64 [ %22, %entry ], [ %lsr.iv.next103, %y_in_tile.loop_body ]
  %lsr.iv100 = phi ptr addrspace(1) [ %scevgep99, %entry ], [ %scevgep101, %y_in_tile.loop_body ]
  %lsr.iv97 = phi i32 [ %21, %entry ], [ %lsr.iv.next98, %y_in_tile.loop_body ]
  %lsr.iv92 = phi i64 [ %17, %entry ], [ %lsr.iv.next93, %y_in_tile.loop_body ]
  %lsr.iv90 = phi i64 [ %16, %entry ], [ %lsr.iv.next91, %y_in_tile.loop_body ]
  %lsr.iv88 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep89, %y_in_tile.loop_body ]
  %lsr.iv = phi i32 [ 0, %entry ], [ %lsr.iv.next, %y_in_tile.loop_body ]
  %partial_reduction_result50.sroa.4.075 = phi float [ 0.000000e+00, %entry ], [ %add.10.i63, %y_in_tile.loop_body ]
  %partial_reduction_result50.sroa.0.074 = phi float [ 0.000000e+00, %entry ], [ %add.10.i, %y_in_tile.loop_body ]
  %lsr113 = trunc i64 %lsr.iv90 to i32
  %lsr111 = trunc i64 %lsr.iv102 to i32
  %28 = udiv i64 %lsr.iv90, 25600
  %29 = mul nuw nsw i64 %28, 1600
  %30 = udiv i64 %lsr.iv92, 100
  %31 = mul nuw nsw i64 %30, 1600
  %32 = sub i64 %29, %31
  %scevgep94 = getelementptr i8, ptr addrspace(1) %lsr.iv88, i64 %32
  %33 = udiv i32 %lsr113, 25600
  %34 = mul nuw nsw i32 %33, 100
  %35 = add i32 %21, %34
  %36 = udiv i32 %lsr.iv97, 100
  %37 = mul nuw nsw i32 %36, 100
  %38 = sub i32 %35, %37
  %39 = udiv i64 %lsr.iv102, 25600
  %40 = mul nuw nsw i64 %39, 1600
  %41 = udiv i64 %lsr.iv104, 100
  %42 = mul nuw nsw i64 %41, 1600
  %43 = sub i64 %40, %42
  %scevgep106 = getelementptr i8, ptr addrspace(1) %lsr.iv100, i64 %43
  %44 = udiv i32 %lsr111, 25600
  %45 = mul nuw nsw i32 %44, 100
  %46 = add i32 %27, %45
  %47 = udiv i32 %lsr.iv109, 100
  %48 = mul nuw nsw i32 %47, 100
  %49 = sub i32 %46, %48
  %50 = add i32 %lsr.iv, %38
  %51 = zext i32 %50 to i64
  %Arg_1.2 = getelementptr inbounds [819200 x [256 x float]], ptr addrspace(1) %arg180, i64 0, i64 %51, i64 %9
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !75
  %Arg_0.14 = load float, ptr addrspace(1) %scevgep94, align 4, !invariant.load !75
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  %add.10.i = fadd float %partial_reduction_result50.sroa.0.074, %multiply.5
  %52 = add i32 %lsr.iv, %49
  %53 = zext i32 %52 to i64
  %54 = getelementptr [819200 x [256 x float]], ptr addrspace(1) %arg180, i64 0, i64 %53, i64 %9
  %Arg_1.2884 = getelementptr inbounds float, ptr addrspace(1) %54, i64 1
  %Arg_1.29 = load float, ptr addrspace(1) %Arg_1.2884, align 4, !invariant.load !75
  %Arg_0.111 = load float, ptr addrspace(1) %scevgep106, align 4, !invariant.load !75
  %multiply.512 = fmul float %Arg_1.29, %Arg_0.111
  %add.10.i63 = fadd float %partial_reduction_result50.sroa.4.075, %multiply.512
  %lsr.iv.next = add nuw nsw i32 %lsr.iv, 32
  %55 = add i32 %11, %lsr.iv.next
  %scevgep89 = getelementptr i8, ptr addrspace(1) %lsr.iv88, i64 512
  %lsr.iv.next91 = add nuw nsw i64 %lsr.iv90, 8192
  %lsr.iv.next93 = add nuw nsw i64 %lsr.iv92, 32
  %lsr.iv.next98 = add nuw nsw i32 %lsr.iv97, 32
  %scevgep101 = getelementptr i8, ptr addrspace(1) %lsr.iv100, i64 512
  %lsr.iv.next103 = add nuw nsw i64 %lsr.iv102, 8192
  %lsr.iv.next105 = add nuw nsw i64 %lsr.iv104, 32
  %lsr.iv.next110 = add nuw nsw i32 %lsr.iv109, 32
  %56 = icmp ugt i32 %55, 67
  br i1 %56, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_body
  %57 = zext i32 %thread_id.x to i64
  %58 = zext i32 %thread_id.y51 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i64 0, i64 0, i64 0, i64 %57, i64 %58
  store float %add.10.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i64 0, i64 0, i64 0, i64 %58, i64 %57
  %partial_reduction_result14 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %59 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result14, i32 16, i32 31)
  %add.10.i64 = fadd float %partial_reduction_result14, %59
  %60 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i64, i32 8, i32 31)
  %add.10.i65 = fadd float %add.10.i64, %60
  %61 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i65, i32 4, i32 31)
  %add.10.i66 = fadd float %add.10.i65, %61
  %62 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i66, i32 2, i32 31)
  %add.10.i67 = fadd float %add.10.i66, %62
  %63 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i67, i32 1, i32 31)
  %add.10.i68 = fadd float %add.10.i67, %63
  store float %add.10.i68, ptr addrspace(3) %shmem_transposed_addr, align 4
  %64 = shl nuw nsw i32 %thread_id.y51, 1
  %65 = icmp eq i32 %thread_id.x, 0
  %66 = zext i32 %2 to i64
  %67 = zext i32 %64 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr addrspace(1) %arg282, i64 0, i64 %66, i64 %10, i64 %67
  br i1 %65, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %68 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address2885 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.10.i63, ptr addrspace(3) %shmem_output_address2885, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr3086 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result32 = load float, ptr addrspace(3) %shmem_transposed_addr3086, align 4
  %69 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 16, i32 31)
  %add.10.i69 = fadd float %partial_reduction_result32, %69
  %70 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i69, i32 8, i32 31)
  %add.10.i70 = fadd float %add.10.i69, %70
  %71 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i70, i32 4, i32 31)
  %add.10.i71 = fadd float %add.10.i70, %71
  %72 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i71, i32 2, i32 31)
  %add.10.i72 = fadd float %add.10.i71, %72
  %73 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i72, i32 1, i32 31)
  %add.10.i73 = fadd float %add.10.i72, %73
  store float %add.10.i73, ptr addrspace(3) %shmem_transposed_addr3086, align 4
  br i1 %68, label %reduction_write_output-true46, label %common.ret

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.10.i68, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true46:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.10.i73, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.rsqrt.approx.f(float) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #9

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #3 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) }
attributes #5 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #6 = { nounwind }
attributes #7 = { convergent nocallback nounwind }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72}
!llvm.ident = !{!73}
!llvm.module.flags = !{!74}

!0 = !{ptr @copy_fusion, !"kernel", i32 1}
!1 = !{ptr @copy_fusion, !"reqntidx", i32 1}
!2 = !{ptr @concatenate_17, !"kernel", i32 1}
!3 = !{ptr @concatenate_17, !"reqntidx", i32 1024}
!4 = !{ptr @concatenate_19, !"kernel", i32 1}
!5 = !{ptr @concatenate_19, !"reqntidx", i32 256}
!6 = !{ptr @fusion_6, !"kernel", i32 1}
!7 = !{ptr @fusion_6, !"reqntidx", i32 256}
!8 = !{ptr @concatenate_14, !"kernel", i32 1}
!9 = !{ptr @concatenate_14, !"reqntidx", i32 256}
!10 = !{ptr @fusion_31, !"kernel", i32 1}
!11 = !{ptr @fusion_31, !"reqntidx", i32 256}
!12 = !{ptr @fusion_41, !"kernel", i32 1}
!13 = !{ptr @fusion_41, !"reqntidx", i32 256}
!14 = !{ptr @concatenate_12, !"kernel", i32 1}
!15 = !{ptr @concatenate_12, !"reqntidx", i32 256}
!16 = !{ptr @fusion_32, !"kernel", i32 1}
!17 = !{ptr @fusion_32, !"reqntidx", i32 256}
!18 = !{ptr @fusion_42, !"kernel", i32 1}
!19 = !{ptr @fusion_42, !"reqntidx", i32 256}
!20 = !{ptr @fusion_30, !"kernel", i32 1}
!21 = !{ptr @fusion_30, !"reqntidx", i32 256}
!22 = !{ptr @concatenate_7, !"kernel", i32 1}
!23 = !{ptr @concatenate_7, !"reqntidx", i32 256}
!24 = !{ptr @fusion_36, !"kernel", i32 1}
!25 = !{ptr @fusion_36, !"reqntidx", i32 96}
!26 = !{ptr @fusion_37, !"kernel", i32 1}
!27 = !{ptr @fusion_37, !"reqntidx", i32 96}
!28 = !{ptr @fusion_35, !"kernel", i32 1}
!29 = !{ptr @fusion_35, !"reqntidx", i32 128}
!30 = !{ptr @fusion_29, !"kernel", i32 1}
!31 = !{ptr @fusion_29, !"reqntidx", i32 256}
!32 = !{ptr @fusion_20, !"kernel", i32 1}
!33 = !{ptr @fusion_20, !"reqntidx", i32 256}
!34 = !{ptr @fusion_19, !"kernel", i32 1}
!35 = !{ptr @fusion_19, !"reqntidx", i32 256}
!36 = !{ptr @fusion_40, !"kernel", i32 1}
!37 = !{ptr @fusion_40, !"reqntidx", i32 256}
!38 = !{ptr @fusion_16, !"kernel", i32 1}
!39 = !{ptr @fusion_16, !"reqntidx", i32 32}
!40 = !{ptr @fusion_16, !"reqntidy", i32 4}
!41 = !{ptr @fusion_39, !"kernel", i32 1}
!42 = !{ptr @fusion_39, !"reqntidx", i32 256}
!43 = !{ptr @fusion_38, !"kernel", i32 1}
!44 = !{ptr @fusion_38, !"reqntidx", i32 32}
!45 = !{ptr @fusion_12, !"kernel", i32 1}
!46 = !{ptr @fusion_12, !"reqntidx", i32 256}
!47 = !{ptr @fusion_10, !"kernel", i32 1}
!48 = !{ptr @fusion_10, !"reqntidx", i32 32}
!49 = !{ptr @fusion_9, !"kernel", i32 1}
!50 = !{ptr @fusion_9, !"reqntidx", i32 256}
!51 = !{ptr @fusion_8, !"kernel", i32 1}
!52 = !{ptr @fusion_8, !"reqntidx", i32 256}
!53 = !{ptr @fusion_7, !"kernel", i32 1}
!54 = !{ptr @fusion_7, !"reqntidx", i32 256}
!55 = !{ptr @fusion_5, !"kernel", i32 1}
!56 = !{ptr @fusion_5, !"reqntidx", i32 256}
!57 = !{ptr @fusion_4, !"kernel", i32 1}
!58 = !{ptr @fusion_4, !"reqntidx", i32 96}
!59 = !{ptr @fusion_3, !"kernel", i32 1}
!60 = !{ptr @fusion_3, !"reqntidx", i32 256}
!61 = !{ptr @reduce_330, !"kernel", i32 1}
!62 = !{ptr @reduce_330, !"reqntidx", i32 96}
!63 = !{ptr @fusion_34, !"kernel", i32 1}
!64 = !{ptr @fusion_34, !"reqntidx", i32 96}
!65 = !{ptr @fusion_1, !"kernel", i32 1}
!66 = !{ptr @fusion_1, !"reqntidx", i32 256}
!67 = !{ptr @fusion_28, !"kernel", i32 1}
!68 = !{ptr @fusion_28, !"reqntidx", i32 256}
!69 = !{ptr @transpose_233, !"kernel", i32 1}
!70 = !{ptr @transpose_233, !"reqntidx", i32 256}
!71 = !{ptr @fusion, !"kernel", i32 1}
!72 = !{ptr @fusion, !"reqntidx", i32 1024}
!73 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!74 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!75 = !{}
!76 = !{i32 0, i32 42}
!77 = !{i32 0, i32 1024}
!78 = !{i32 0, i32 258}
!79 = !{i32 0, i32 256}
!80 = !{i32 0, i32 8256}
!81 = !{i32 0, i32 32000}
!82 = !{i32 0, i32 5120}
!83 = !{i32 0, i32 4096}
!84 = !{i32 0, i32 102400}
!85 = !{i32 0, i32 16384}
!86 = !{i32 0, i32 8192}
!87 = !{i32 0, i32 96}
!88 = !{i32 0, i32 43691}
!89 = !{i32 0, i32 128}
!90 = !{i32 0, i32 21504}
!91 = !{i32 0, i32 32768}
!92 = !{i32 0, i32 32}
!93 = !{i32 0, i32 4}
!94 = !{i32 0, i32 131072}
!95 = !{i32 0, i32 134400}
!96 = !{i32 0, i32 160000}
!97 = !{i32 0, i32 1092267}
!98 = !{i32 0, i32 3200}
!99 = !{i32 0, i32 10923}
