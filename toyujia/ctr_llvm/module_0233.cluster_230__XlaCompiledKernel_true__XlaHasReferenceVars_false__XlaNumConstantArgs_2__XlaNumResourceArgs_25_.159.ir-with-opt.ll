target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@buffer_for_constant_1 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\80\FF\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_6(ptr noalias nocapture readonly align 16 dereferenceable(2097152) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(33816576) %arg2) local_unnamed_addr #0 {
entry:
  %arg240 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg138 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg036 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
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
  %19 = load float, ptr addrspace(1) %18, align 4, !invariant.load !30
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
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !30
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
  %44 = load float, ptr addrspace(1) %43, align 4, !invariant.load !30
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
  %55 = load float, ptr addrspace(1) %54, align 4, !invariant.load !30
  %56 = getelementptr inbounds float, ptr addrspace(1) %21, i64 3
  store float %55, ptr addrspace(1) %56, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_4(ptr noalias nocapture readonly align 16 dereferenceable(991232) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(1056768) %arg2) local_unnamed_addr #0 {
entry:
  %arg233 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg131 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg029 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
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
  %18 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !30
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
  %29 = load float, ptr addrspace(1) %.in26, align 4, !invariant.load !30
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
  %39 = load float, ptr addrspace(1) %.in27, align 4, !invariant.load !30
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
  %48 = load float, ptr addrspace(1) %.in28, align 4, !invariant.load !30
  %49 = getelementptr inbounds float, ptr addrspace(1) %20, i64 3
  store float %48, ptr addrspace(1) %49, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(655360000) %arg4) local_unnamed_addr #0 {
entry:
  %arg474 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg372 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg270 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg066 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !32
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
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
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !30
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
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !30
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
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !30
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
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !30
  %69 = getelementptr inbounds float, ptr addrspace(1) %24, i64 3
  store float %68, ptr addrspace(1) %69, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(838860800) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg2) local_unnamed_addr #2 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
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
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !30
  %14 = zext i32 %8 to i64
  %Arg_1.214 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %14
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !30
  %multiply.616 = fmul float %Arg_0.113, %Arg_1.215
  %add.11.i41 = fadd float %multiply.616, 0.000000e+00
  %15 = zext i32 %9 to i64
  %16 = zext i32 %6 to i64
  %17 = add i64 %15, %16
  %18 = getelementptr [8192 x [256 x float]], ptr addrspace(1) %arg044, i64 0, i64 %12, i64 %17
  %Arg_0.112.151 = getelementptr inbounds float, ptr addrspace(1) %18, i64 32
  %Arg_0.113.1 = load float, ptr addrspace(1) %Arg_0.112.151, align 4, !invariant.load !30
  %19 = zext i32 %7 to i64
  %20 = add i64 %16, %19
  %21 = getelementptr float, ptr addrspace(1) %arg146, i64 %20
  %Arg_1.214.153 = getelementptr inbounds float, ptr addrspace(1) %21, i64 32
  %Arg_1.215.1 = load float, ptr addrspace(1) %Arg_1.214.153, align 4, !invariant.load !30
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
  %29 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %28, i64 0, i64 0
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

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_3(ptr noalias nocapture readonly align 16 dereferenceable(16) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg7, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(16) %arg9, ptr noalias nocapture readonly align 16 dereferenceable(3276800) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg11) local_unnamed_addr #5 {
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
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
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !30
  %19 = zext i32 %6 to i64
  %20 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg956, i64 0, i64 0, i64 %19
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !30
  %multiply.16 = fmul float %18, %21
  %22 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg854, i64 0, i64 %15, i64 %16, i64 0
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !30
  %24 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg752, i64 0, i64 0, i64 %19
  %25 = load float, ptr addrspace(1) %24, align 4, !invariant.load !30
  %multiply.21 = fmul float %23, %25
  %add.22 = fadd float %multiply.16, %multiply.21
  %26 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg650, i64 0, i64 %15, i64 %16, i64 0
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !30
  %28 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg548, i64 0, i64 0, i64 %19
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !30
  %multiply.27 = fmul float %27, %29
  %add.28 = fadd float %add.22, %multiply.27
  %30 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg446, i64 0, i64 %15, i64 %16, i64 0
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !30
  %32 = getelementptr inbounds [1 x [4 x float]], ptr addrspace(1) %arg344, i64 0, i64 0, i64 %19
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !30
  %multiply.33 = fmul float %31, %33
  %add.34 = fadd float %add.28, %multiply.33
  %34 = load float, ptr addrspace(1) %arg242, align 16, !invariant.load !30
  %35 = zext i32 %linear_index_base to i64
  %36 = getelementptr float, ptr addrspace(1) %arg140, i64 %35
  %37 = load <4 x float>, ptr addrspace(1) %36, align 16, !invariant.load !30
  %38 = extractelement <4 x float> %37, i32 0
  %39 = extractelement <4 x float> %37, i32 1
  %40 = extractelement <4 x float> %37, i32 2
  %41 = extractelement <4 x float> %37, i32 3
  %multiply.39 = fmul float %34, %38
  %add.40 = fadd float %add.34, %multiply.39
  %42 = getelementptr inbounds [4 x float], ptr addrspace(1) %arg038, i64 0, i64 %19
  %43 = load float, ptr addrspace(1) %42, align 4, !invariant.load !30
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
  %51 = load float, ptr addrspace(1) %50, align 4, !invariant.load !30
  %multiply.161 = fmul float %21, %51
  %52 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg854, i64 0, i64 %48, i64 %49, i64 0
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !30
  %multiply.212 = fmul float %25, %53
  %add.223 = fadd float %multiply.161, %multiply.212
  %54 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg650, i64 0, i64 %48, i64 %49, i64 0
  %55 = load float, ptr addrspace(1) %54, align 4, !invariant.load !30
  %multiply.274 = fmul float %29, %55
  %add.285 = fadd float %add.223, %multiply.274
  %56 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg446, i64 0, i64 %48, i64 %49, i64 0
  %57 = load float, ptr addrspace(1) %56, align 4, !invariant.load !30
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
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !30
  %multiply.1611 = fmul float %21, %64
  %65 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg854, i64 0, i64 %61, i64 %62, i64 0
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !30
  %multiply.2112 = fmul float %25, %66
  %add.2213 = fadd float %multiply.1611, %multiply.2112
  %67 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg650, i64 0, i64 %61, i64 %62, i64 0
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !30
  %multiply.2714 = fmul float %29, %68
  %add.2815 = fadd float %add.2213, %multiply.2714
  %69 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg446, i64 0, i64 %61, i64 %62, i64 0
  %70 = load float, ptr addrspace(1) %69, align 4, !invariant.load !30
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
  %77 = load float, ptr addrspace(1) %76, align 4, !invariant.load !30
  %multiply.1621 = fmul float %21, %77
  %78 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg854, i64 0, i64 %74, i64 %75, i64 0
  %79 = load float, ptr addrspace(1) %78, align 4, !invariant.load !30
  %multiply.2122 = fmul float %25, %79
  %add.2223 = fadd float %multiply.1621, %multiply.2122
  %80 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg650, i64 0, i64 %74, i64 %75, i64 0
  %81 = load float, ptr addrspace(1) %80, align 4, !invariant.load !30
  %multiply.2724 = fmul float %29, %81
  %add.2825 = fadd float %add.2223, %multiply.2724
  %82 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr addrspace(1) %arg446, i64 0, i64 %74, i64 %75, i64 0
  %83 = load float, ptr addrspace(1) %82, align 4, !invariant.load !30
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
define void @reduce_102(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(4) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #2 {
entry:
  %arg244 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg142 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg040 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header5.preheader, label %common.ret

tile_loop.loop_header5.preheader:                 ; preds = %entry
  %7 = mul nuw nsw i32 %5, 100
  %Arg_1.2 = load float, ptr addrspace(1) %arg142, align 128, !invariant.load !30
  %8 = fcmp uno float %Arg_1.2, 0.000000e+00
  %9 = add nuw nsw i32 %2, %7
  %10 = zext i32 %9 to i64
  %Arg_0.111 = getelementptr inbounds float, ptr addrspace(1) %arg040, i64 %10
  %Arg_0.112 = load float, ptr addrspace(1) %Arg_0.111, align 4, !invariant.load !30
  %11 = fcmp oge float %Arg_1.2, %Arg_0.112
  %12 = or i1 %8, %11
  %maximum.6.i37 = select i1 %12, float %Arg_1.2, float %Arg_0.112
  %13 = fcmp uno float %maximum.6.i37, 0.000000e+00
  %14 = zext i32 %7 to i64
  %15 = zext i32 %2 to i64
  %16 = add i64 %15, %14
  %17 = getelementptr float, ptr addrspace(1) %arg040, i64 %16
  %Arg_0.111.147 = getelementptr inbounds float, ptr addrspace(1) %17, i64 32
  %Arg_0.112.1 = load float, ptr addrspace(1) %Arg_0.111.147, align 4, !invariant.load !30
  %18 = fcmp oge float %maximum.6.i37, %Arg_0.112.1
  %19 = or i1 %13, %18
  %maximum.6.i37.1 = select i1 %19, float %maximum.6.i37, float %Arg_0.112.1
  %20 = fcmp uno float %maximum.6.i37.1, 0.000000e+00
  %Arg_0.111.249 = getelementptr inbounds float, ptr addrspace(1) %17, i64 64
  %Arg_0.112.2 = load float, ptr addrspace(1) %Arg_0.111.249, align 4, !invariant.load !30
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
  %Arg_0.112.3 = load float, ptr addrspace(1) %Arg_0.111.3, align 4, !invariant.load !30
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
  %53 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %52, i64 0, i64 0
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
define void @fusion_9(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #2 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
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
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !30
  %11 = zext i32 %9 to i64
  %Arg_1.214 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %11
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !30
  %subtract.416 = fsub float %Arg_0.113, %Arg_1.215
  %12 = tail call float @llvm.fma.f32(float %subtract.416, float 0x3F777313A0000000, float 5.000000e-01)
  %13 = tail call float @llvm.nvvm.saturate.f(float %12) #2
  %14 = tail call float @llvm.nvvm.fma.rm.f(float %13, float 2.520000e+02, float 0x4168000020000000) #2
  %15 = fadd float %14, 0xC168000FE0000000
  %16 = fneg float %15
  %17 = tail call float @llvm.fma.f32(float %subtract.416, float 0x3FF7154760000000, float %16)
  %18 = tail call float @llvm.fma.f32(float %subtract.416, float 0x3E54AE0C00000000, float %17)
  %19 = bitcast float %14 to i32
  %20 = shl i32 %19, 23
  %21 = bitcast i32 %20 to float
  %22 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %18) #2
  %23 = fmul float %22, %21
  %x_loc11.1 = or i32 %2, 32
  %24 = add nuw nsw i32 %x_loc11.1, %7
  %25 = udiv i32 %24, 100
  %26 = zext i32 %7 to i64
  %27 = zext i32 %2 to i64
  %28 = add i64 %27, %26
  %29 = getelementptr float, ptr addrspace(1) %arg044, i64 %28
  %Arg_0.112.151 = getelementptr inbounds float, ptr addrspace(1) %29, i64 32
  %Arg_0.113.1 = load float, ptr addrspace(1) %Arg_0.112.151, align 4, !invariant.load !30
  %30 = zext i32 %25 to i64
  %Arg_1.214.1 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %30
  %Arg_1.215.1 = load float, ptr addrspace(1) %Arg_1.214.1, align 4, !invariant.load !30
  %subtract.416.1 = fsub float %Arg_0.113.1, %Arg_1.215.1
  %31 = tail call float @llvm.fma.f32(float %subtract.416.1, float 0x3F777313A0000000, float 5.000000e-01)
  %32 = tail call float @llvm.nvvm.saturate.f(float %31) #2
  %33 = tail call float @llvm.nvvm.fma.rm.f(float %32, float 2.520000e+02, float 0x4168000020000000) #2
  %34 = fadd float %33, 0xC168000FE0000000
  %35 = fneg float %34
  %36 = tail call float @llvm.fma.f32(float %subtract.416.1, float 0x3FF7154760000000, float %35)
  %37 = tail call float @llvm.fma.f32(float %subtract.416.1, float 0x3E54AE0C00000000, float %36)
  %38 = bitcast float %33 to i32
  %39 = shl i32 %38, 23
  %40 = bitcast i32 %39 to float
  %41 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %37) #2
  %42 = fmul float %41, %40
  %add.10.i41.1 = fadd float %23, %42
  %x_loc11.2 = or i32 %2, 64
  %43 = add nuw nsw i32 %x_loc11.2, %7
  %44 = udiv i32 %43, 100
  %Arg_0.112.253 = getelementptr inbounds float, ptr addrspace(1) %29, i64 64
  %Arg_0.113.2 = load float, ptr addrspace(1) %Arg_0.112.253, align 4, !invariant.load !30
  %45 = zext i32 %44 to i64
  %Arg_1.214.2 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %45
  %Arg_1.215.2 = load float, ptr addrspace(1) %Arg_1.214.2, align 4, !invariant.load !30
  %subtract.416.2 = fsub float %Arg_0.113.2, %Arg_1.215.2
  %46 = tail call float @llvm.fma.f32(float %subtract.416.2, float 0x3F777313A0000000, float 5.000000e-01)
  %47 = tail call float @llvm.nvvm.saturate.f(float %46) #2
  %48 = tail call float @llvm.nvvm.fma.rm.f(float %47, float 2.520000e+02, float 0x4168000020000000) #2
  %49 = fadd float %48, 0xC168000FE0000000
  %50 = fneg float %49
  %51 = tail call float @llvm.fma.f32(float %subtract.416.2, float 0x3FF7154760000000, float %50)
  %52 = tail call float @llvm.fma.f32(float %subtract.416.2, float 0x3E54AE0C00000000, float %51)
  %53 = bitcast float %48 to i32
  %54 = shl i32 %53, 23
  %55 = bitcast i32 %54 to float
  %56 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %52) #2
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
  %Arg_0.113.3 = load float, ptr addrspace(1) %Arg_0.112.3, align 4, !invariant.load !30
  %67 = zext i32 %65 to i64
  %Arg_1.214.3 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %67
  %Arg_1.215.3 = load float, ptr addrspace(1) %Arg_1.214.3, align 4, !invariant.load !30
  %subtract.416.3 = fsub float %Arg_0.113.3, %Arg_1.215.3
  %68 = tail call float @llvm.fma.f32(float %subtract.416.3, float 0x3F777313A0000000, float 5.000000e-01)
  %69 = tail call float @llvm.nvvm.saturate.f(float %68) #2
  %70 = tail call float @llvm.nvvm.fma.rm.f(float %69, float 2.520000e+02, float 0x4168000020000000) #2
  %71 = fadd float %70, 0xC168000FE0000000
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %subtract.416.3, float 0x3FF7154760000000, float %72)
  %74 = tail call float @llvm.fma.f32(float %subtract.416.3, float 0x3E54AE0C00000000, float %73)
  %75 = bitcast float %70 to i32
  %76 = shl i32 %75, 23
  %77 = bitcast i32 %76 to float
  %78 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %74) #2
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
  %87 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 %86, i64 0, i64 0
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
define void @fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture align 128 dereferenceable(13107200) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #5 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
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
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !30
  %subtract.5 = fsub float %8, %14
  %15 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3F777313A0000000, float 5.000000e-01)
  %16 = tail call float @llvm.nvvm.saturate.f(float %15) #2
  %17 = tail call float @llvm.nvvm.fma.rm.f(float %16, float 2.520000e+02, float 0x4168000020000000) #2
  %18 = fadd float %17, 0xC168000FE0000000
  %19 = fneg float %18
  %20 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3FF7154760000000, float %19)
  %21 = tail call float @llvm.fma.f32(float %subtract.5, float 0x3E54AE0C00000000, float %20)
  %22 = bitcast float %17 to i32
  %23 = shl i32 %22, 23
  %24 = bitcast i32 %23 to float
  %25 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %21) #2
  %26 = fmul float %25, %24
  %27 = getelementptr inbounds float, ptr addrspace(1) %arg07, i64 %12
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !30
  %divide.8 = fdiv float %26, %28
  %subtract.51 = fsub float %9, %14
  %29 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3F777313A0000000, float 5.000000e-01)
  %30 = tail call float @llvm.nvvm.saturate.f(float %29) #2
  %31 = tail call float @llvm.nvvm.fma.rm.f(float %30, float 2.520000e+02, float 0x4168000020000000) #2
  %32 = fadd float %31, 0xC168000FE0000000
  %33 = fneg float %32
  %34 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3FF7154760000000, float %33)
  %35 = tail call float @llvm.fma.f32(float %subtract.51, float 0x3E54AE0C00000000, float %34)
  %36 = bitcast float %31 to i32
  %37 = shl i32 %36, 23
  %38 = bitcast i32 %37 to float
  %39 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %35) #2
  %40 = fmul float %39, %38
  %divide.82 = fdiv float %40, %28
  %subtract.53 = fsub float %10, %14
  %41 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3F777313A0000000, float 5.000000e-01)
  %42 = tail call float @llvm.nvvm.saturate.f(float %41) #2
  %43 = tail call float @llvm.nvvm.fma.rm.f(float %42, float 2.520000e+02, float 0x4168000020000000) #2
  %44 = fadd float %43, 0xC168000FE0000000
  %45 = fneg float %44
  %46 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3FF7154760000000, float %45)
  %47 = tail call float @llvm.fma.f32(float %subtract.53, float 0x3E54AE0C00000000, float %46)
  %48 = bitcast float %43 to i32
  %49 = shl i32 %48, 23
  %50 = bitcast i32 %49 to float
  %51 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %47) #2
  %52 = fmul float %51, %50
  %divide.84 = fdiv float %52, %28
  %subtract.55 = fsub float %11, %14
  %53 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3F777313A0000000, float 5.000000e-01)
  %54 = tail call float @llvm.nvvm.saturate.f(float %53) #2
  %55 = tail call float @llvm.nvvm.fma.rm.f(float %54, float 2.520000e+02, float 0x4168000020000000) #2
  %56 = fadd float %55, 0xC168000FE0000000
  %57 = fneg float %56
  %58 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3FF7154760000000, float %57)
  %59 = tail call float @llvm.fma.f32(float %subtract.55, float 0x3E54AE0C00000000, float %58)
  %60 = bitcast float %55 to i32
  %61 = shl i32 %60, 23
  %62 = bitcast i32 %61 to float
  %63 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %59) #2
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
define void @transpose_219(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg1) local_unnamed_addr #5 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = shl nuw nsw i32 %0, 8
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %linear_index = or i32 %1, %2
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 100
  %4 = mul i32 %3, 100
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = zext i32 %3 to i64
  %6 = zext i32 %.decomposed to i64
  %7 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 0, i64 %6
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !30
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg13, i64 %9
  %11 = getelementptr inbounds float, ptr addrspace(1) %7, i64 100
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !30
  %13 = getelementptr inbounds float, ptr addrspace(1) %7, i64 200
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !30
  %15 = getelementptr inbounds float, ptr addrspace(1) %7, i64 300
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !30
  %17 = insertelement <4 x float> poison, float %8, i32 0
  %18 = insertelement <4 x float> %17, float %12, i32 1
  %19 = insertelement <4 x float> %18, float %14, i32 2
  %20 = insertelement <4 x float> %19, float %16, i32 3
  store <4 x float> %20, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_7(ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg5, ptr noalias nocapture readonly align 16 dereferenceable(26214400) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(209715200) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(760217600) %arg8) local_unnamed_addr #0 {
entry:
  %arg8112 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg7110 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg6108 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg5106 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg4104 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3102 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2100 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg198 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg096 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 232
  %5 = mul i32 %4, 232
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 232
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 232
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 232
  %9 = icmp ult i32 %.decomposed, 144
  br i1 %9, label %concatenate.pivot.128., label %concatenate.pivot.160.

concatenate.pivot.128.:                           ; preds = %entry
  %10 = icmp ult i32 %.decomposed, 128
  br i1 %10, label %concatenate.pivot.64., label %concatenate.pivot.136.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %11 = icmp ult i32 %.decomposed, 64
  br i1 %11, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %12 = shl nuw nsw i32 %4, 6
  %13 = add nuw nsw i32 %12, %.decomposed
  br label %concatenate.10.merge

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  %14 = add nsw i32 %.decomposed, -64
  %15 = shl nuw nsw i32 %4, 6
  %16 = add nuw nsw i32 %14, %15
  br label %concatenate.10.merge

concatenate.pivot.136.:                           ; preds = %concatenate.pivot.128.
  %17 = icmp ult i32 %.decomposed, 136
  %18 = shl nuw nsw i32 %4, 3
  br i1 %17, label %concatenate.pivot.128.2, label %concatenate.pivot.136.3

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  %19 = add nsw i32 %.decomposed, -128
  %20 = add nuw nsw i32 %19, %18
  br label %concatenate.10.merge

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.136.
  %21 = add nsw i32 %.decomposed, -136
  %22 = add nuw nsw i32 %21, %18
  br label %concatenate.10.merge

concatenate.pivot.160.:                           ; preds = %entry
  %23 = icmp ult i32 %.decomposed, 160
  br i1 %23, label %concatenate.pivot.152., label %concatenate.pivot.168.

concatenate.pivot.152.:                           ; preds = %concatenate.pivot.160.
  %24 = icmp ult i32 %.decomposed, 152
  %25 = shl nuw nsw i32 %4, 3
  br i1 %24, label %concatenate.pivot.144.4, label %concatenate.pivot.152.5

concatenate.pivot.144.4:                          ; preds = %concatenate.pivot.152.
  %26 = add nsw i32 %.decomposed, -144
  %27 = add nuw nsw i32 %26, %25
  br label %concatenate.10.merge

concatenate.pivot.152.5:                          ; preds = %concatenate.pivot.152.
  %28 = add nsw i32 %.decomposed, -152
  %29 = add nuw nsw i32 %28, %25
  br label %concatenate.10.merge

concatenate.pivot.168.:                           ; preds = %concatenate.pivot.160.
  %30 = icmp ult i32 %.decomposed, 168
  br i1 %30, label %concatenate.pivot.160.6, label %concatenate.pivot.168.7

concatenate.pivot.160.6:                          ; preds = %concatenate.pivot.168.
  %31 = add nsw i32 %.decomposed, -160
  %32 = shl nuw nsw i32 %4, 3
  %33 = add nuw nsw i32 %31, %32
  br label %concatenate.10.merge

concatenate.pivot.168.7:                          ; preds = %concatenate.pivot.168.
  %34 = add nsw i32 %.decomposed, -168
  %35 = shl nuw nsw i32 %4, 6
  %36 = add nuw nsw i32 %34, %35
  br label %concatenate.10.merge

concatenate.10.merge:                             ; preds = %concatenate.pivot.168.7, %concatenate.pivot.160.6, %concatenate.pivot.152.5, %concatenate.pivot.144.4, %concatenate.pivot.136.3, %concatenate.pivot.128.2, %concatenate.pivot.64.1, %concatenate.pivot.0.
  %.sink89 = phi i32 [ %36, %concatenate.pivot.168.7 ], [ %33, %concatenate.pivot.160.6 ], [ %29, %concatenate.pivot.152.5 ], [ %27, %concatenate.pivot.144.4 ], [ %22, %concatenate.pivot.136.3 ], [ %20, %concatenate.pivot.128.2 ], [ %16, %concatenate.pivot.64.1 ], [ %13, %concatenate.pivot.0. ]
  %arg7.sink = phi ptr addrspace(1) [ %arg7110, %concatenate.pivot.168.7 ], [ %arg6108, %concatenate.pivot.160.6 ], [ %arg5106, %concatenate.pivot.152.5 ], [ %arg4104, %concatenate.pivot.144.4 ], [ %arg3102, %concatenate.pivot.136.3 ], [ %arg2100, %concatenate.pivot.128.2 ], [ %arg198, %concatenate.pivot.64.1 ], [ %arg096, %concatenate.pivot.0. ]
  %37 = zext i32 %.sink89 to i64
  %38 = getelementptr inbounds float, ptr addrspace(1) %arg7.sink, i64 %37
  %39 = load float, ptr addrspace(1) %38, align 4, !invariant.load !30
  %40 = zext i32 %linear_index_base to i64
  %41 = getelementptr float, ptr addrspace(1) %arg8112, i64 %40
  store float %39, ptr addrspace(1) %41, align 16
  %42 = icmp ult i32 %6, 144
  br i1 %42, label %concatenate.pivot.128.18, label %concatenate.pivot.160.25

concatenate.pivot.128.18:                         ; preds = %concatenate.10.merge
  %43 = icmp ult i32 %6, 128
  br i1 %43, label %concatenate.pivot.64.19, label %concatenate.pivot.136.22

concatenate.pivot.64.19:                          ; preds = %concatenate.pivot.128.18
  %44 = icmp ult i32 %6, 64
  br i1 %44, label %concatenate.pivot.0.20, label %concatenate.pivot.64.21

concatenate.pivot.0.20:                           ; preds = %concatenate.pivot.64.19
  %45 = shl nuw nsw i32 %4, 6
  %46 = add nuw nsw i32 %45, %6
  br label %concatenate.10.merge8

concatenate.pivot.64.21:                          ; preds = %concatenate.pivot.64.19
  %47 = add nsw i32 %6, -64
  %48 = shl nuw nsw i32 %4, 6
  %49 = add nuw nsw i32 %47, %48
  br label %concatenate.10.merge8

concatenate.pivot.136.22:                         ; preds = %concatenate.pivot.128.18
  %50 = icmp ult i32 %6, 136
  %51 = shl nuw nsw i32 %4, 3
  br i1 %50, label %concatenate.pivot.128.23, label %concatenate.pivot.136.24

concatenate.pivot.128.23:                         ; preds = %concatenate.pivot.136.22
  %52 = add nsw i32 %6, -128
  %53 = add nuw nsw i32 %52, %51
  br label %concatenate.10.merge8

concatenate.pivot.136.24:                         ; preds = %concatenate.pivot.136.22
  %54 = add nsw i32 %6, -136
  %55 = add nuw nsw i32 %54, %51
  br label %concatenate.10.merge8

concatenate.pivot.160.25:                         ; preds = %concatenate.10.merge
  %56 = icmp ult i32 %6, 160
  br i1 %56, label %concatenate.pivot.152.26, label %concatenate.pivot.168.29

concatenate.pivot.152.26:                         ; preds = %concatenate.pivot.160.25
  %57 = icmp ult i32 %6, 152
  %58 = shl nuw nsw i32 %4, 3
  br i1 %57, label %concatenate.pivot.144.27, label %concatenate.pivot.152.28

concatenate.pivot.144.27:                         ; preds = %concatenate.pivot.152.26
  %59 = add nsw i32 %6, -144
  %60 = add nuw nsw i32 %59, %58
  br label %concatenate.10.merge8

concatenate.pivot.152.28:                         ; preds = %concatenate.pivot.152.26
  %61 = add nsw i32 %6, -152
  %62 = add nuw nsw i32 %61, %58
  br label %concatenate.10.merge8

concatenate.pivot.168.29:                         ; preds = %concatenate.pivot.160.25
  %63 = icmp ult i32 %6, 168
  br i1 %63, label %concatenate.pivot.160.30, label %concatenate.pivot.168.31

concatenate.pivot.160.30:                         ; preds = %concatenate.pivot.168.29
  %64 = add nsw i32 %6, -160
  %65 = shl nuw nsw i32 %4, 3
  %66 = add nuw nsw i32 %64, %65
  br label %concatenate.10.merge8

concatenate.pivot.168.31:                         ; preds = %concatenate.pivot.168.29
  %67 = add nsw i32 %6, -168
  %68 = shl nuw nsw i32 %4, 6
  %69 = add nuw nsw i32 %67, %68
  br label %concatenate.10.merge8

concatenate.10.merge8:                            ; preds = %concatenate.pivot.168.31, %concatenate.pivot.160.30, %concatenate.pivot.152.28, %concatenate.pivot.144.27, %concatenate.pivot.136.24, %concatenate.pivot.128.23, %concatenate.pivot.64.21, %concatenate.pivot.0.20
  %.sink91 = phi i32 [ %69, %concatenate.pivot.168.31 ], [ %66, %concatenate.pivot.160.30 ], [ %62, %concatenate.pivot.152.28 ], [ %60, %concatenate.pivot.144.27 ], [ %55, %concatenate.pivot.136.24 ], [ %53, %concatenate.pivot.128.23 ], [ %49, %concatenate.pivot.64.21 ], [ %46, %concatenate.pivot.0.20 ]
  %arg7.sink90 = phi ptr addrspace(1) [ %arg7110, %concatenate.pivot.168.31 ], [ %arg6108, %concatenate.pivot.160.30 ], [ %arg5106, %concatenate.pivot.152.28 ], [ %arg4104, %concatenate.pivot.144.27 ], [ %arg3102, %concatenate.pivot.136.24 ], [ %arg2100, %concatenate.pivot.128.23 ], [ %arg198, %concatenate.pivot.64.21 ], [ %arg096, %concatenate.pivot.0.20 ]
  %70 = zext i32 %.sink91 to i64
  %71 = getelementptr inbounds float, ptr addrspace(1) %arg7.sink90, i64 %70
  %72 = load float, ptr addrspace(1) %71, align 4, !invariant.load !30
  %73 = getelementptr inbounds float, ptr addrspace(1) %41, i64 1
  store float %72, ptr addrspace(1) %73, align 4
  %74 = icmp ult i32 %7, 144
  br i1 %74, label %concatenate.pivot.128.42, label %concatenate.pivot.160.49

concatenate.pivot.128.42:                         ; preds = %concatenate.10.merge8
  %75 = icmp ult i32 %7, 128
  br i1 %75, label %concatenate.pivot.64.43, label %concatenate.pivot.136.46

concatenate.pivot.64.43:                          ; preds = %concatenate.pivot.128.42
  %76 = icmp ult i32 %7, 64
  br i1 %76, label %concatenate.pivot.0.44, label %concatenate.pivot.64.45

concatenate.pivot.0.44:                           ; preds = %concatenate.pivot.64.43
  %77 = shl nuw nsw i32 %4, 6
  %78 = add nuw nsw i32 %77, %7
  br label %concatenate.10.merge32

concatenate.pivot.64.45:                          ; preds = %concatenate.pivot.64.43
  %79 = add nsw i32 %7, -64
  %80 = shl nuw nsw i32 %4, 6
  %81 = add nuw nsw i32 %79, %80
  br label %concatenate.10.merge32

concatenate.pivot.136.46:                         ; preds = %concatenate.pivot.128.42
  %82 = icmp ult i32 %7, 136
  %83 = shl nuw nsw i32 %4, 3
  br i1 %82, label %concatenate.pivot.128.47, label %concatenate.pivot.136.48

concatenate.pivot.128.47:                         ; preds = %concatenate.pivot.136.46
  %84 = add nsw i32 %7, -128
  %85 = add nuw nsw i32 %84, %83
  br label %concatenate.10.merge32

concatenate.pivot.136.48:                         ; preds = %concatenate.pivot.136.46
  %86 = add nsw i32 %7, -136
  %87 = add nuw nsw i32 %86, %83
  br label %concatenate.10.merge32

concatenate.pivot.160.49:                         ; preds = %concatenate.10.merge8
  %88 = icmp ult i32 %7, 160
  br i1 %88, label %concatenate.pivot.152.50, label %concatenate.pivot.168.53

concatenate.pivot.152.50:                         ; preds = %concatenate.pivot.160.49
  %89 = icmp ult i32 %7, 152
  %90 = shl nuw nsw i32 %4, 3
  br i1 %89, label %concatenate.pivot.144.51, label %concatenate.pivot.152.52

concatenate.pivot.144.51:                         ; preds = %concatenate.pivot.152.50
  %91 = add nsw i32 %7, -144
  %92 = add nuw nsw i32 %91, %90
  br label %concatenate.10.merge32

concatenate.pivot.152.52:                         ; preds = %concatenate.pivot.152.50
  %93 = add nsw i32 %7, -152
  %94 = add nuw nsw i32 %93, %90
  br label %concatenate.10.merge32

concatenate.pivot.168.53:                         ; preds = %concatenate.pivot.160.49
  %95 = icmp ult i32 %7, 168
  br i1 %95, label %concatenate.pivot.160.54, label %concatenate.pivot.168.55

concatenate.pivot.160.54:                         ; preds = %concatenate.pivot.168.53
  %96 = add nsw i32 %7, -160
  %97 = shl nuw nsw i32 %4, 3
  %98 = add nuw nsw i32 %96, %97
  br label %concatenate.10.merge32

concatenate.pivot.168.55:                         ; preds = %concatenate.pivot.168.53
  %99 = add nsw i32 %7, -168
  %100 = shl nuw nsw i32 %4, 6
  %101 = add nuw nsw i32 %99, %100
  br label %concatenate.10.merge32

concatenate.10.merge32:                           ; preds = %concatenate.pivot.168.55, %concatenate.pivot.160.54, %concatenate.pivot.152.52, %concatenate.pivot.144.51, %concatenate.pivot.136.48, %concatenate.pivot.128.47, %concatenate.pivot.64.45, %concatenate.pivot.0.44
  %.sink93 = phi i32 [ %101, %concatenate.pivot.168.55 ], [ %98, %concatenate.pivot.160.54 ], [ %94, %concatenate.pivot.152.52 ], [ %92, %concatenate.pivot.144.51 ], [ %87, %concatenate.pivot.136.48 ], [ %85, %concatenate.pivot.128.47 ], [ %81, %concatenate.pivot.64.45 ], [ %78, %concatenate.pivot.0.44 ]
  %arg7.sink92 = phi ptr addrspace(1) [ %arg7110, %concatenate.pivot.168.55 ], [ %arg6108, %concatenate.pivot.160.54 ], [ %arg5106, %concatenate.pivot.152.52 ], [ %arg4104, %concatenate.pivot.144.51 ], [ %arg3102, %concatenate.pivot.136.48 ], [ %arg2100, %concatenate.pivot.128.47 ], [ %arg198, %concatenate.pivot.64.45 ], [ %arg096, %concatenate.pivot.0.44 ]
  %102 = zext i32 %.sink93 to i64
  %103 = getelementptr inbounds float, ptr addrspace(1) %arg7.sink92, i64 %102
  %104 = load float, ptr addrspace(1) %103, align 4, !invariant.load !30
  %105 = getelementptr inbounds float, ptr addrspace(1) %41, i64 2
  store float %104, ptr addrspace(1) %105, align 8
  %106 = icmp ult i32 %8, 144
  br i1 %106, label %concatenate.pivot.128.66, label %concatenate.pivot.160.73

concatenate.pivot.128.66:                         ; preds = %concatenate.10.merge32
  %107 = icmp ult i32 %8, 128
  br i1 %107, label %concatenate.pivot.64.67, label %concatenate.pivot.136.70

concatenate.pivot.64.67:                          ; preds = %concatenate.pivot.128.66
  %108 = icmp ult i32 %8, 64
  br i1 %108, label %concatenate.pivot.0.68, label %concatenate.pivot.64.69

concatenate.pivot.0.68:                           ; preds = %concatenate.pivot.64.67
  %109 = shl nuw nsw i32 %4, 6
  %110 = add nuw nsw i32 %109, %8
  br label %concatenate.10.merge56

concatenate.pivot.64.69:                          ; preds = %concatenate.pivot.64.67
  %111 = add nsw i32 %8, -64
  %112 = shl nuw nsw i32 %4, 6
  %113 = add nuw nsw i32 %111, %112
  br label %concatenate.10.merge56

concatenate.pivot.136.70:                         ; preds = %concatenate.pivot.128.66
  %114 = icmp ult i32 %8, 136
  %115 = shl nuw nsw i32 %4, 3
  br i1 %114, label %concatenate.pivot.128.71, label %concatenate.pivot.136.72

concatenate.pivot.128.71:                         ; preds = %concatenate.pivot.136.70
  %116 = add nsw i32 %8, -128
  %117 = add nuw nsw i32 %116, %115
  br label %concatenate.10.merge56

concatenate.pivot.136.72:                         ; preds = %concatenate.pivot.136.70
  %118 = add nsw i32 %8, -136
  %119 = add nuw nsw i32 %118, %115
  br label %concatenate.10.merge56

concatenate.pivot.160.73:                         ; preds = %concatenate.10.merge32
  %120 = icmp ult i32 %8, 160
  br i1 %120, label %concatenate.pivot.152.74, label %concatenate.pivot.168.77

concatenate.pivot.152.74:                         ; preds = %concatenate.pivot.160.73
  %121 = icmp ult i32 %8, 152
  %122 = shl nuw nsw i32 %4, 3
  br i1 %121, label %concatenate.pivot.144.75, label %concatenate.pivot.152.76

concatenate.pivot.144.75:                         ; preds = %concatenate.pivot.152.74
  %123 = add nsw i32 %8, -144
  %124 = add nuw nsw i32 %123, %122
  br label %concatenate.10.merge56

concatenate.pivot.152.76:                         ; preds = %concatenate.pivot.152.74
  %125 = add nsw i32 %8, -152
  %126 = add nuw nsw i32 %125, %122
  br label %concatenate.10.merge56

concatenate.pivot.168.77:                         ; preds = %concatenate.pivot.160.73
  %127 = icmp ult i32 %8, 168
  br i1 %127, label %concatenate.pivot.160.78, label %concatenate.pivot.168.79

concatenate.pivot.160.78:                         ; preds = %concatenate.pivot.168.77
  %128 = add nsw i32 %8, -160
  %129 = shl nuw nsw i32 %4, 3
  %130 = add nuw nsw i32 %128, %129
  br label %concatenate.10.merge56

concatenate.pivot.168.79:                         ; preds = %concatenate.pivot.168.77
  %131 = add nsw i32 %8, -168
  %132 = shl nuw nsw i32 %4, 6
  %133 = add nuw nsw i32 %131, %132
  br label %concatenate.10.merge56

concatenate.10.merge56:                           ; preds = %concatenate.pivot.168.79, %concatenate.pivot.160.78, %concatenate.pivot.152.76, %concatenate.pivot.144.75, %concatenate.pivot.136.72, %concatenate.pivot.128.71, %concatenate.pivot.64.69, %concatenate.pivot.0.68
  %.sink95 = phi i32 [ %133, %concatenate.pivot.168.79 ], [ %130, %concatenate.pivot.160.78 ], [ %126, %concatenate.pivot.152.76 ], [ %124, %concatenate.pivot.144.75 ], [ %119, %concatenate.pivot.136.72 ], [ %117, %concatenate.pivot.128.71 ], [ %113, %concatenate.pivot.64.69 ], [ %110, %concatenate.pivot.0.68 ]
  %arg7.sink94 = phi ptr addrspace(1) [ %arg7110, %concatenate.pivot.168.79 ], [ %arg6108, %concatenate.pivot.160.78 ], [ %arg5106, %concatenate.pivot.152.76 ], [ %arg4104, %concatenate.pivot.144.75 ], [ %arg3102, %concatenate.pivot.136.72 ], [ %arg2100, %concatenate.pivot.128.71 ], [ %arg198, %concatenate.pivot.64.69 ], [ %arg096, %concatenate.pivot.0.68 ]
  %134 = zext i32 %.sink95 to i64
  %135 = getelementptr inbounds float, ptr addrspace(1) %arg7.sink94, i64 %134
  %136 = load float, ptr addrspace(1) %135, align 4, !invariant.load !30
  %137 = getelementptr inbounds float, ptr addrspace(1) %41, i64 3
  store float %136, ptr addrspace(1) %137, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_2(ptr noalias nocapture readonly align 16 dereferenceable(155648) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8192) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8192) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(65536) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(237568) %arg4) local_unnamed_addr #0 {
entry:
  %arg412 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg310 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg28 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg16 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg04 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = and i32 %1, 255
  %4 = lshr i32 %linear_index, 8
  %5 = icmp ult i32 %linear_index, 40960
  br i1 %5, label %concatenate.pivot.152., label %concatenate.pivot.168.

concatenate.pivot.152.:                           ; preds = %entry
  %6 = icmp ult i32 %linear_index, 38912
  br i1 %6, label %concatenate.pivot.0., label %concatenate.pivot.152.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.152.
  %7 = zext i32 %4 to i64
  %8 = zext i32 %3 to i64
  %9 = getelementptr inbounds [152 x [256 x float]], ptr addrspace(1) %arg04, i64 0, i64 %7, i64 %8
  br label %concatenate.5.merge

concatenate.pivot.152.1:                          ; preds = %concatenate.pivot.152.
  %10 = zext i32 %3 to i64
  %11 = sext i32 %4 to i64
  %12 = getelementptr [8 x [256 x float]], ptr addrspace(1) %arg16, i64 0, i64 %11, i64 %10
  %13 = getelementptr inbounds float, ptr addrspace(1) %12, i64 -38912
  br label %concatenate.5.merge

concatenate.pivot.168.:                           ; preds = %entry
  %14 = icmp ult i32 %linear_index, 43008
  %15 = zext i32 %3 to i64
  br i1 %14, label %concatenate.pivot.160.2, label %concatenate.pivot.168.3

concatenate.pivot.160.2:                          ; preds = %concatenate.pivot.168.
  %16 = sext i32 %4 to i64
  %17 = getelementptr [8 x [256 x float]], ptr addrspace(1) %arg28, i64 0, i64 %16, i64 %15
  %18 = getelementptr inbounds float, ptr addrspace(1) %17, i64 -40960
  br label %concatenate.5.merge

concatenate.pivot.168.3:                          ; preds = %concatenate.pivot.168.
  %19 = sext i32 %4 to i64
  %20 = getelementptr [64 x [256 x float]], ptr addrspace(1) %arg310, i64 0, i64 %19, i64 %15
  %21 = getelementptr inbounds float, ptr addrspace(1) %20, i64 -43008
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.168.3, %concatenate.pivot.160.2, %concatenate.pivot.152.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %9, %concatenate.pivot.0. ], [ %13, %concatenate.pivot.152.1 ], [ %18, %concatenate.pivot.160.2 ], [ %21, %concatenate.pivot.168.3 ]
  %22 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !30
  %23 = zext i32 %linear_index to i64
  %24 = getelementptr inbounds float, ptr addrspace(1) %arg412, i64 %23
  store float %22, ptr addrspace(1) %24, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(838860800) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg2) local_unnamed_addr #2 {
entry:
  %arg282 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg180 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg078 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !40
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
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
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !30
  %Arg_0.14 = load float, ptr addrspace(1) %scevgep94, align 4, !invariant.load !30
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  %add.10.i = fadd float %partial_reduction_result50.sroa.0.074, %multiply.5
  %52 = add i32 %lsr.iv, %49
  %53 = zext i32 %52 to i64
  %54 = getelementptr [819200 x [256 x float]], ptr addrspace(1) %arg180, i64 0, i64 %53, i64 %9
  %Arg_1.2884 = getelementptr inbounds float, ptr addrspace(1) %54, i64 1
  %Arg_1.29 = load float, ptr addrspace(1) %Arg_1.2884, align 4, !invariant.load !30
  %Arg_0.111 = load float, ptr addrspace(1) %scevgep106, align 4, !invariant.load !30
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
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %57, i64 %58
  store float %add.10.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i64 0, i64 0, i64 0, i64 %58, i64 %57
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

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(13107200) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(13107200) %arg1) local_unnamed_addr #5 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = shl nuw nsw i32 %0, 8
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %linear_index = or i32 %1, %2
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 100
  %4 = mul i32 %3, 100
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = zext i32 %3 to i64
  %6 = zext i32 %.decomposed to i64
  %7 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 0, i64 %6
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !30
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg13, i64 %9
  %11 = getelementptr inbounds float, ptr addrspace(1) %7, i64 100
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !30
  %13 = getelementptr inbounds float, ptr addrspace(1) %7, i64 200
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !30
  %15 = getelementptr inbounds float, ptr addrspace(1) %7, i64 300
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !30
  %17 = insertelement <4 x float> poison, float %8, i32 0
  %18 = insertelement <4 x float> %17, float %12, i32 1
  %19 = insertelement <4 x float> %18, float %14, i32 2
  %20 = insertelement <4 x float> %19, float %16, i32 3
  store <4 x float> %20, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #7

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #4 = { convergent nocallback nounwind }
attributes #5 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25}
!llvm.ident = !{!26}
!llvm.module.flags = !{!27}

!0 = !{ptr @fusion_6, !"kernel", i32 1}
!1 = !{ptr @fusion_6, !"reqntidx", i32 256}
!2 = !{ptr @concatenate_4, !"kernel", i32 1}
!3 = !{ptr @concatenate_4, !"reqntidx", i32 256}
!4 = !{ptr @fusion_5, !"kernel", i32 1}
!5 = !{ptr @fusion_5, !"reqntidx", i32 256}
!6 = !{ptr @fusion_4, !"kernel", i32 1}
!7 = !{ptr @fusion_4, !"reqntidx", i32 96}
!8 = !{ptr @fusion_3, !"kernel", i32 1}
!9 = !{ptr @fusion_3, !"reqntidx", i32 256}
!10 = !{ptr @reduce_102, !"kernel", i32 1}
!11 = !{ptr @reduce_102, !"reqntidx", i32 96}
!12 = !{ptr @fusion_9, !"kernel", i32 1}
!13 = !{ptr @fusion_9, !"reqntidx", i32 96}
!14 = !{ptr @fusion_1, !"kernel", i32 1}
!15 = !{ptr @fusion_1, !"reqntidx", i32 256}
!16 = !{ptr @transpose_219, !"kernel", i32 1}
!17 = !{ptr @transpose_219, !"reqntidx", i32 256}
!18 = !{ptr @fusion_7, !"kernel", i32 1}
!19 = !{ptr @fusion_7, !"reqntidx", i32 256}
!20 = !{ptr @concatenate_2, !"kernel", i32 1}
!21 = !{ptr @concatenate_2, !"reqntidx", i32 1024}
!22 = !{ptr @fusion, !"kernel", i32 1}
!23 = !{ptr @fusion, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_8, !"kernel", i32 1}
!25 = !{ptr @fusion_8, !"reqntidx", i32 256}
!26 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!27 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!28 = !{i32 0, i32 8256}
!29 = !{i32 0, i32 256}
!30 = !{}
!31 = !{i32 0, i32 258}
!32 = !{i32 0, i32 160000}
!33 = !{i32 0, i32 96}
!34 = !{i32 0, i32 1092267}
!35 = !{i32 0, i32 3200}
!36 = !{i32 0, i32 10923}
!37 = !{i32 0, i32 185600}
!38 = !{i32 0, i32 58}
!39 = !{i32 0, i32 1024}
!40 = !{i32 0, i32 32768}
