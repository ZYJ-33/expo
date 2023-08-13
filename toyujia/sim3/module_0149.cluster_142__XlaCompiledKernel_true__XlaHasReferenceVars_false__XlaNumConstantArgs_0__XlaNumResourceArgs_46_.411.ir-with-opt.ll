target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_11(ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(48496640) %arg3) local_unnamed_addr #0 {
entry:
  %arg352 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 1480
  %5 = mul i32 %4, 1480
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 1480
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 1480
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 1480
  %9 = icmp ult i32 %.decomposed, 968
  br i1 %9, label %concatenate.pivot.0., label %concatenate.pivot.1224.

concatenate.pivot.0.:                             ; preds = %entry
  %10 = udiv i32 %linear_index_base, 1480
  %11 = mul nuw nsw i32 %10, 968
  %12 = add nuw nsw i32 %11, %.decomposed
  br label %concatenate.4.merge

concatenate.pivot.1224.:                          ; preds = %entry
  %13 = icmp ult i32 %.decomposed, 1224
  %14 = udiv i32 %linear_index_base, 1480
  %15 = shl nuw nsw i32 %14, 8
  br i1 %13, label %concatenate.pivot.968.1, label %concatenate.pivot.1224.2

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.1224.
  %16 = add nsw i32 %.decomposed, -968
  %17 = add nuw nsw i32 %16, %15
  br label %concatenate.4.merge

concatenate.pivot.1224.2:                         ; preds = %concatenate.pivot.1224.
  %18 = add nsw i32 %.decomposed, -1224
  %19 = add nuw nsw i32 %18, %15
  br label %concatenate.4.merge

concatenate.4.merge:                              ; preds = %concatenate.pivot.1224.2, %concatenate.pivot.968.1, %concatenate.pivot.0.
  %.sink39 = phi i32 [ %19, %concatenate.pivot.1224.2 ], [ %17, %concatenate.pivot.968.1 ], [ %12, %concatenate.pivot.0. ]
  %arg2.sink = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.1224.2 ], [ %arg148, %concatenate.pivot.968.1 ], [ %arg046, %concatenate.pivot.0. ]
  %20 = zext i32 %.sink39 to i64
  %21 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink, i64 %20
  %22 = load float, ptr addrspace(1) %21, align 4, !invariant.load !40
  %23 = zext i32 %linear_index_base to i64
  %24 = getelementptr float, ptr addrspace(1) %arg352, i64 %23
  store float %22, ptr addrspace(1) %24, align 16
  %25 = icmp ult i32 %6, 968
  br i1 %25, label %concatenate.pivot.0.8, label %concatenate.pivot.1224.9

concatenate.pivot.0.8:                            ; preds = %concatenate.4.merge
  %26 = udiv i32 %linear_index_base, 1480
  %27 = mul nuw nsw i32 %26, 968
  %28 = add nuw nsw i32 %27, %6
  br label %concatenate.4.merge3

concatenate.pivot.1224.9:                         ; preds = %concatenate.4.merge
  %29 = icmp ult i32 %6, 1224
  %30 = udiv i32 %linear_index_base, 1480
  %31 = shl nuw nsw i32 %30, 8
  br i1 %29, label %concatenate.pivot.968.10, label %concatenate.pivot.1224.11

concatenate.pivot.968.10:                         ; preds = %concatenate.pivot.1224.9
  %32 = add nsw i32 %6, -968
  %33 = add nuw nsw i32 %32, %31
  br label %concatenate.4.merge3

concatenate.pivot.1224.11:                        ; preds = %concatenate.pivot.1224.9
  %34 = add nsw i32 %6, -1224
  %35 = add nuw nsw i32 %34, %31
  br label %concatenate.4.merge3

concatenate.4.merge3:                             ; preds = %concatenate.pivot.1224.11, %concatenate.pivot.968.10, %concatenate.pivot.0.8
  %.sink41 = phi i32 [ %35, %concatenate.pivot.1224.11 ], [ %33, %concatenate.pivot.968.10 ], [ %28, %concatenate.pivot.0.8 ]
  %arg2.sink40 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.1224.11 ], [ %arg148, %concatenate.pivot.968.10 ], [ %arg046, %concatenate.pivot.0.8 ]
  %36 = zext i32 %.sink41 to i64
  %37 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink40, i64 %36
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !40
  %39 = getelementptr inbounds float, ptr addrspace(1) %24, i64 1
  store float %38, ptr addrspace(1) %39, align 4
  %40 = icmp ult i32 %7, 968
  br i1 %40, label %concatenate.pivot.0.17, label %concatenate.pivot.1224.18

concatenate.pivot.0.17:                           ; preds = %concatenate.4.merge3
  %41 = udiv i32 %linear_index_base, 1480
  %42 = mul nuw nsw i32 %41, 968
  %43 = add nuw nsw i32 %42, %7
  br label %concatenate.4.merge12

concatenate.pivot.1224.18:                        ; preds = %concatenate.4.merge3
  %44 = icmp ult i32 %7, 1224
  %45 = udiv i32 %linear_index_base, 1480
  %46 = shl nuw nsw i32 %45, 8
  br i1 %44, label %concatenate.pivot.968.19, label %concatenate.pivot.1224.20

concatenate.pivot.968.19:                         ; preds = %concatenate.pivot.1224.18
  %47 = add nsw i32 %7, -968
  %48 = add nuw nsw i32 %47, %46
  br label %concatenate.4.merge12

concatenate.pivot.1224.20:                        ; preds = %concatenate.pivot.1224.18
  %49 = add nsw i32 %7, -1224
  %50 = add nuw nsw i32 %49, %46
  br label %concatenate.4.merge12

concatenate.4.merge12:                            ; preds = %concatenate.pivot.1224.20, %concatenate.pivot.968.19, %concatenate.pivot.0.17
  %.sink43 = phi i32 [ %50, %concatenate.pivot.1224.20 ], [ %48, %concatenate.pivot.968.19 ], [ %43, %concatenate.pivot.0.17 ]
  %arg2.sink42 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.1224.20 ], [ %arg148, %concatenate.pivot.968.19 ], [ %arg046, %concatenate.pivot.0.17 ]
  %51 = zext i32 %.sink43 to i64
  %52 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink42, i64 %51
  %53 = load float, ptr addrspace(1) %52, align 4, !invariant.load !40
  %54 = getelementptr inbounds float, ptr addrspace(1) %24, i64 2
  store float %53, ptr addrspace(1) %54, align 8
  %55 = icmp ult i32 %8, 968
  br i1 %55, label %concatenate.pivot.0.26, label %concatenate.pivot.1224.27

concatenate.pivot.0.26:                           ; preds = %concatenate.4.merge12
  %56 = udiv i32 %linear_index_base, 1480
  %57 = mul nuw nsw i32 %56, 968
  %58 = add nuw nsw i32 %57, %8
  br label %concatenate.4.merge21

concatenate.pivot.1224.27:                        ; preds = %concatenate.4.merge12
  %59 = icmp ult i32 %8, 1224
  %60 = shl nuw nsw i32 %4, 8
  br i1 %59, label %concatenate.pivot.968.28, label %concatenate.pivot.1224.29

concatenate.pivot.968.28:                         ; preds = %concatenate.pivot.1224.27
  %61 = add nsw i32 %8, -968
  %62 = add nuw nsw i32 %61, %60
  br label %concatenate.4.merge21

concatenate.pivot.1224.29:                        ; preds = %concatenate.pivot.1224.27
  %63 = add nsw i32 %8, -1224
  %64 = add nuw nsw i32 %63, %60
  br label %concatenate.4.merge21

concatenate.4.merge21:                            ; preds = %concatenate.pivot.1224.29, %concatenate.pivot.968.28, %concatenate.pivot.0.26
  %.sink45 = phi i32 [ %64, %concatenate.pivot.1224.29 ], [ %62, %concatenate.pivot.968.28 ], [ %58, %concatenate.pivot.0.26 ]
  %arg2.sink44 = phi ptr addrspace(1) [ %arg250, %concatenate.pivot.1224.29 ], [ %arg148, %concatenate.pivot.968.28 ], [ %arg046, %concatenate.pivot.0.26 ]
  %65 = zext i32 %.sink45 to i64
  %66 = getelementptr inbounds float, ptr addrspace(1) %arg2.sink44, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4, !invariant.load !40
  %68 = getelementptr inbounds float, ptr addrspace(1) %24, i64 3
  store float %67, ptr addrspace(1) %68, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_7(ptr noalias nocapture readonly align 16 dereferenceable(262144) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(46080) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(3072) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(314368) %arg4) local_unnamed_addr #0 {
entry:
  %arg414 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg06 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !41
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !42
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 614
  %4 = mul i32 %3, 614
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = icmp ult i32 %linear_index, 78592
  br i1 %5, label %concatenate.pivot.602., label %concatenate_7.in_bounds-after

concatenate_7.in_bounds-after:                    ; preds = %concatenate.5.merge, %entry
  ret void

concatenate.pivot.602.:                           ; preds = %entry
  %6 = icmp ult i32 %.decomposed, 602
  br i1 %6, label %concatenate.pivot.512., label %concatenate.pivot.608.

concatenate.pivot.512.:                           ; preds = %concatenate.pivot.602.
  %7 = icmp ult i32 %.decomposed, 512
  br i1 %7, label %concatenate.pivot.0., label %concatenate.pivot.512.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.512.
  %8 = udiv i32 %linear_index, 614
  %9 = shl nuw nsw i32 %8, 9
  %10 = add nuw nsw i32 %9, %.decomposed
  br label %concatenate.5.merge

concatenate.pivot.512.1:                          ; preds = %concatenate.pivot.512.
  %11 = add nsw i32 %.decomposed, -512
  %12 = udiv i32 %linear_index, 614
  %13 = mul nuw nsw i32 %12, 90
  %14 = add nuw nsw i32 %11, %13
  br label %concatenate.5.merge

concatenate.pivot.608.:                           ; preds = %concatenate.pivot.602.
  %15 = icmp ult i32 %.decomposed, 608
  %16 = mul nuw nsw i32 %3, 6
  br i1 %15, label %concatenate.pivot.602.2, label %concatenate.pivot.608.3

concatenate.pivot.602.2:                          ; preds = %concatenate.pivot.608.
  %17 = add nsw i32 %.decomposed, -602
  %18 = add nuw nsw i32 %17, %16
  br label %concatenate.5.merge

concatenate.pivot.608.3:                          ; preds = %concatenate.pivot.608.
  %19 = add nsw i32 %.decomposed, -608
  %20 = add nuw nsw i32 %19, %16
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.608.3, %concatenate.pivot.602.2, %concatenate.pivot.512.1, %concatenate.pivot.0.
  %.sink5 = phi i32 [ %20, %concatenate.pivot.608.3 ], [ %18, %concatenate.pivot.602.2 ], [ %14, %concatenate.pivot.512.1 ], [ %10, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg312, %concatenate.pivot.608.3 ], [ %arg210, %concatenate.pivot.602.2 ], [ %arg18, %concatenate.pivot.512.1 ], [ %arg06, %concatenate.pivot.0. ]
  %21 = zext i32 %.sink5 to i64
  %22 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %21
  %23 = load float, ptr addrspace(1) %22, align 4, !invariant.load !40
  %24 = zext i32 %linear_index to i64
  %25 = getelementptr inbounds float, ptr addrspace(1) %arg414, i64 %24
  store float %23, ptr addrspace(1) %25, align 4
  br label %concatenate_7.in_bounds-after
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_29(ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg0, ptr noalias nocapture align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg2) local_unnamed_addr #2 {
entry:
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = lshr i32 %linear_index_base, 9
  %5 = and i32 %linear_index3, 511
  %linear_index2 = or i32 %linear_index_base, 2
  %6 = and i32 %linear_index2, 510
  %linear_index1 = or i32 %linear_index_base, 1
  %7 = and i32 %linear_index1, 509
  %8 = and i32 %3, 508
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg118, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = zext i32 %4 to i64
  %17 = zext i32 %8 to i64
  %18 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg220, i64 0, i64 %16, i64 %17
  %19 = load <2 x float>, ptr addrspace(1) %18, align 8, !invariant.load !40
  %20 = extractelement <2 x float> %19, i32 0
  %21 = extractelement <2 x float> %19, i32 1
  %add.5 = fadd float %12, %20
  %22 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %17
  %23 = load <2 x float>, ptr addrspace(1) %22, align 16, !invariant.load !40
  %24 = extractelement <2 x float> %23, i32 0
  %25 = extractelement <2 x float> %23, i32 1
  %add.7 = fadd float %add.5, %24
  %.inv = fcmp olt float %add.7, 0.000000e+00
  %maximum.10 = select i1 %.inv, float 0.000000e+00, float %add.7
  %26 = zext i32 %7 to i64
  %add.51 = fadd float %13, %21
  %add.72 = fadd float %add.51, %25
  %.inv13 = fcmp olt float %add.72, 0.000000e+00
  %maximum.104 = select i1 %.inv13, float 0.000000e+00, float %add.72
  %27 = zext i32 %6 to i64
  %28 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg220, i64 0, i64 %16, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !40
  %add.55 = fadd float %14, %29
  %30 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %27
  %31 = load float, ptr addrspace(1) %30, align 8, !invariant.load !40
  %add.76 = fadd float %add.55, %31
  %.inv14 = fcmp olt float %add.76, 0.000000e+00
  %maximum.108 = select i1 %.inv14, float 0.000000e+00, float %add.76
  %32 = zext i32 %5 to i64
  %33 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg220, i64 0, i64 %16, i64 %32
  %34 = load float, ptr addrspace(1) %33, align 4, !invariant.load !40
  %add.59 = fadd float %15, %34
  %35 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %32
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !40
  %add.710 = fadd float %add.59, %36
  %.inv15 = fcmp olt float %add.710, 0.000000e+00
  %maximum.1012 = select i1 %.inv15, float 0.000000e+00, float %add.710
  %37 = insertelement <4 x float> poison, float %maximum.10, i32 0
  %38 = insertelement <4 x float> %37, float %maximum.104, i32 1
  %39 = insertelement <4 x float> %38, float %maximum.108, i32 2
  %40 = insertelement <4 x float> %39, float %maximum.1012, i32 3
  store <4 x float> %40, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_27(ptr noalias nocapture readonly align 16 dereferenceable(2048) %arg0, ptr noalias nocapture align 128 dereferenceable(16777216) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(16777216) %arg2) local_unnamed_addr #2 {
entry:
  %arg220 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg118 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg016 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = and i32 %linear_index3, 511
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = and i32 %linear_index2, 510
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = and i32 %linear_index1, 509
  %7 = and i32 %3, 508
  %8 = zext i32 %linear_index_base to i64
  %9 = getelementptr float, ptr addrspace(1) %arg118, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = getelementptr float, ptr addrspace(1) %arg220, i64 %8
  %16 = load <4 x float>, ptr addrspace(1) %15, align 16, !invariant.load !40
  %17 = extractelement <4 x float> %16, i32 0
  %18 = extractelement <4 x float> %16, i32 1
  %19 = extractelement <4 x float> %16, i32 2
  %20 = extractelement <4 x float> %16, i32 3
  %add.4 = fadd float %11, %17
  %21 = zext i32 %7 to i64
  %22 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %21
  %23 = load <2 x float>, ptr addrspace(1) %22, align 16, !invariant.load !40
  %24 = extractelement <2 x float> %23, i32 0
  %25 = extractelement <2 x float> %23, i32 1
  %add.6 = fadd float %add.4, %24
  %.inv = fcmp olt float %add.6, 0.000000e+00
  %maximum.9 = select i1 %.inv, float 0.000000e+00, float %add.6
  %add.41 = fadd float %12, %18
  %26 = zext i32 %6 to i64
  %add.62 = fadd float %add.41, %25
  %.inv13 = fcmp olt float %add.62, 0.000000e+00
  %maximum.94 = select i1 %.inv13, float 0.000000e+00, float %add.62
  %add.45 = fadd float %13, %19
  %27 = zext i32 %5 to i64
  %28 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 8, !invariant.load !40
  %add.66 = fadd float %add.45, %29
  %.inv14 = fcmp olt float %add.66, 0.000000e+00
  %maximum.98 = select i1 %.inv14, float 0.000000e+00, float %add.66
  %add.49 = fadd float %14, %20
  %30 = zext i32 %4 to i64
  %31 = getelementptr inbounds [512 x float], ptr addrspace(1) %arg016, i64 0, i64 %30
  %32 = load float, ptr addrspace(1) %31, align 4, !invariant.load !40
  %add.610 = fadd float %add.49, %32
  %.inv15 = fcmp olt float %add.610, 0.000000e+00
  %maximum.912 = select i1 %.inv15, float 0.000000e+00, float %add.610
  %33 = insertelement <4 x float> poison, float %maximum.9, i32 0
  %34 = insertelement <4 x float> %33, float %maximum.94, i32 1
  %35 = insertelement <4 x float> %34, float %maximum.98, i32 2
  %36 = insertelement <4 x float> %35, float %maximum.912, i32 3
  store <4 x float> %36, ptr addrspace(1) %9, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_45(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg4, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg5, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg6, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg7, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg8, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg9, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg10, ptr noalias nocapture readonly align 16 dereferenceable(1024) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg17) local_unnamed_addr #2 {
entry:
  %arg1797 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1695 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1593 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1491 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1389 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1287 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1185 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1083 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg981 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg879 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg777 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg675 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg573 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg471 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg369 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg267 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg165 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg063 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
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
  %9 = getelementptr float, ptr addrspace(1) %arg063, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16, !invariant.load !40
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %7 to i64
  %16 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg165, i64 0, i64 %15
  %17 = load <2 x float>, ptr addrspace(1) %16, align 16, !invariant.load !40
  %18 = extractelement <2 x float> %17, i32 0
  %19 = extractelement <2 x float> %17, i32 1
  %add.14 = fadd float %11, %18
  %.inv = fcmp olt float %add.14, 0.000000e+00
  %maximum.17 = select i1 %.inv, float 0.000000e+00, float %add.14
  %20 = getelementptr float, ptr addrspace(1) %arg267, i64 %8
  %21 = load <4 x float>, ptr addrspace(1) %20, align 16, !invariant.load !40
  %22 = extractelement <4 x float> %21, i32 0
  %23 = extractelement <4 x float> %21, i32 1
  %24 = extractelement <4 x float> %21, i32 2
  %25 = extractelement <4 x float> %21, i32 3
  %26 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg369, i64 0, i64 %15
  %27 = load <2 x float>, ptr addrspace(1) %26, align 16, !invariant.load !40
  %28 = extractelement <2 x float> %27, i32 0
  %29 = extractelement <2 x float> %27, i32 1
  %add.19 = fadd float %22, %28
  %.inv40 = fcmp olt float %add.19, 0.000000e+00
  %maximum.20 = select i1 %.inv40, float 0.000000e+00, float %add.19
  %30 = getelementptr float, ptr addrspace(1) %arg471, i64 %8
  %31 = load <4 x float>, ptr addrspace(1) %30, align 16, !invariant.load !40
  %32 = extractelement <4 x float> %31, i32 0
  %33 = extractelement <4 x float> %31, i32 1
  %34 = extractelement <4 x float> %31, i32 2
  %35 = extractelement <4 x float> %31, i32 3
  %36 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg573, i64 0, i64 %15
  %37 = load <2 x float>, ptr addrspace(1) %36, align 16, !invariant.load !40
  %38 = extractelement <2 x float> %37, i32 0
  %39 = extractelement <2 x float> %37, i32 1
  %add.22 = fadd float %32, %38
  %.inv41 = fcmp olt float %add.22, 0.000000e+00
  %maximum.23 = select i1 %.inv41, float 0.000000e+00, float %add.22
  %40 = getelementptr float, ptr addrspace(1) %arg675, i64 %8
  %41 = load <4 x float>, ptr addrspace(1) %40, align 16, !invariant.load !40
  %42 = extractelement <4 x float> %41, i32 0
  %43 = extractelement <4 x float> %41, i32 1
  %44 = extractelement <4 x float> %41, i32 2
  %45 = extractelement <4 x float> %41, i32 3
  %46 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg777, i64 0, i64 %15
  %47 = load <2 x float>, ptr addrspace(1) %46, align 16, !invariant.load !40
  %48 = extractelement <2 x float> %47, i32 0
  %49 = extractelement <2 x float> %47, i32 1
  %add.25 = fadd float %42, %48
  %.inv42 = fcmp olt float %add.25, 0.000000e+00
  %maximum.26 = select i1 %.inv42, float 0.000000e+00, float %add.25
  %50 = getelementptr float, ptr addrspace(1) %arg879, i64 %8
  %51 = load <4 x float>, ptr addrspace(1) %50, align 16, !invariant.load !40
  %52 = extractelement <4 x float> %51, i32 0
  %53 = extractelement <4 x float> %51, i32 1
  %54 = extractelement <4 x float> %51, i32 2
  %55 = extractelement <4 x float> %51, i32 3
  %56 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg981, i64 0, i64 %15
  %57 = load <2 x float>, ptr addrspace(1) %56, align 16, !invariant.load !40
  %58 = extractelement <2 x float> %57, i32 0
  %59 = extractelement <2 x float> %57, i32 1
  %add.28 = fadd float %52, %58
  %.inv43 = fcmp olt float %add.28, 0.000000e+00
  %maximum.29 = select i1 %.inv43, float 0.000000e+00, float %add.28
  %60 = getelementptr float, ptr addrspace(1) %arg1083, i64 %8
  %61 = load <4 x float>, ptr addrspace(1) %60, align 16, !invariant.load !40
  %62 = extractelement <4 x float> %61, i32 0
  %63 = extractelement <4 x float> %61, i32 1
  %64 = extractelement <4 x float> %61, i32 2
  %65 = extractelement <4 x float> %61, i32 3
  %66 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg1185, i64 0, i64 %15
  %67 = load <2 x float>, ptr addrspace(1) %66, align 16, !invariant.load !40
  %68 = extractelement <2 x float> %67, i32 0
  %69 = extractelement <2 x float> %67, i32 1
  %add.31 = fadd float %62, %68
  %.inv44 = fcmp olt float %add.31, 0.000000e+00
  %maximum.32 = select i1 %.inv44, float 0.000000e+00, float %add.31
  %70 = getelementptr float, ptr addrspace(1) %arg1287, i64 %8
  %71 = getelementptr float, ptr addrspace(1) %arg1389, i64 %8
  %72 = getelementptr float, ptr addrspace(1) %arg1491, i64 %8
  %73 = getelementptr float, ptr addrspace(1) %arg1593, i64 %8
  %74 = getelementptr float, ptr addrspace(1) %arg1695, i64 %8
  %75 = getelementptr float, ptr addrspace(1) %arg1797, i64 %8
  %76 = zext i32 %6 to i64
  %add.141 = fadd float %12, %19
  %.inv45 = fcmp olt float %add.141, 0.000000e+00
  %maximum.173 = select i1 %.inv45, float 0.000000e+00, float %add.141
  %add.194 = fadd float %23, %29
  %.inv46 = fcmp olt float %add.194, 0.000000e+00
  %maximum.205 = select i1 %.inv46, float 0.000000e+00, float %add.194
  %add.226 = fadd float %33, %39
  %.inv47 = fcmp olt float %add.226, 0.000000e+00
  %maximum.237 = select i1 %.inv47, float 0.000000e+00, float %add.226
  %add.258 = fadd float %43, %49
  %.inv48 = fcmp olt float %add.258, 0.000000e+00
  %maximum.269 = select i1 %.inv48, float 0.000000e+00, float %add.258
  %add.2810 = fadd float %53, %59
  %.inv49 = fcmp olt float %add.2810, 0.000000e+00
  %maximum.2911 = select i1 %.inv49, float 0.000000e+00, float %add.2810
  %add.3112 = fadd float %63, %69
  %.inv50 = fcmp olt float %add.3112, 0.000000e+00
  %maximum.3213 = select i1 %.inv50, float 0.000000e+00, float %add.3112
  %77 = zext i32 %5 to i64
  %78 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg165, i64 0, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 8, !invariant.load !40
  %add.1414 = fadd float %13, %79
  %.inv51 = fcmp olt float %add.1414, 0.000000e+00
  %maximum.1716 = select i1 %.inv51, float 0.000000e+00, float %add.1414
  %80 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg369, i64 0, i64 %77
  %81 = load float, ptr addrspace(1) %80, align 8, !invariant.load !40
  %add.1917 = fadd float %24, %81
  %.inv52 = fcmp olt float %add.1917, 0.000000e+00
  %maximum.2018 = select i1 %.inv52, float 0.000000e+00, float %add.1917
  %82 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg573, i64 0, i64 %77
  %83 = load float, ptr addrspace(1) %82, align 8, !invariant.load !40
  %add.2219 = fadd float %34, %83
  %.inv53 = fcmp olt float %add.2219, 0.000000e+00
  %maximum.2320 = select i1 %.inv53, float 0.000000e+00, float %add.2219
  %84 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg777, i64 0, i64 %77
  %85 = load float, ptr addrspace(1) %84, align 8, !invariant.load !40
  %add.2521 = fadd float %44, %85
  %.inv54 = fcmp olt float %add.2521, 0.000000e+00
  %maximum.2622 = select i1 %.inv54, float 0.000000e+00, float %add.2521
  %86 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg981, i64 0, i64 %77
  %87 = load float, ptr addrspace(1) %86, align 8, !invariant.load !40
  %add.2823 = fadd float %54, %87
  %.inv55 = fcmp olt float %add.2823, 0.000000e+00
  %maximum.2924 = select i1 %.inv55, float 0.000000e+00, float %add.2823
  %88 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg1185, i64 0, i64 %77
  %89 = load float, ptr addrspace(1) %88, align 8, !invariant.load !40
  %add.3125 = fadd float %64, %89
  %.inv56 = fcmp olt float %add.3125, 0.000000e+00
  %maximum.3226 = select i1 %.inv56, float 0.000000e+00, float %add.3125
  %90 = zext i32 %4 to i64
  %91 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg165, i64 0, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4, !invariant.load !40
  %add.1427 = fadd float %14, %92
  %.inv57 = fcmp olt float %add.1427, 0.000000e+00
  %maximum.1729 = select i1 %.inv57, float 0.000000e+00, float %add.1427
  %93 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg369, i64 0, i64 %90
  %94 = load float, ptr addrspace(1) %93, align 4, !invariant.load !40
  %add.1930 = fadd float %25, %94
  %.inv58 = fcmp olt float %add.1930, 0.000000e+00
  %maximum.2031 = select i1 %.inv58, float 0.000000e+00, float %add.1930
  %95 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg573, i64 0, i64 %90
  %96 = load float, ptr addrspace(1) %95, align 4, !invariant.load !40
  %add.2232 = fadd float %35, %96
  %.inv59 = fcmp olt float %add.2232, 0.000000e+00
  %maximum.2333 = select i1 %.inv59, float 0.000000e+00, float %add.2232
  %97 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg777, i64 0, i64 %90
  %98 = load float, ptr addrspace(1) %97, align 4, !invariant.load !40
  %add.2534 = fadd float %45, %98
  %.inv60 = fcmp olt float %add.2534, 0.000000e+00
  %maximum.2635 = select i1 %.inv60, float 0.000000e+00, float %add.2534
  %99 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg981, i64 0, i64 %90
  %100 = load float, ptr addrspace(1) %99, align 4, !invariant.load !40
  %add.2836 = fadd float %55, %100
  %.inv61 = fcmp olt float %add.2836, 0.000000e+00
  %maximum.2937 = select i1 %.inv61, float 0.000000e+00, float %add.2836
  %101 = getelementptr inbounds [256 x float], ptr addrspace(1) %arg1185, i64 0, i64 %90
  %102 = load float, ptr addrspace(1) %101, align 4, !invariant.load !40
  %add.3138 = fadd float %65, %102
  %.inv62 = fcmp olt float %add.3138, 0.000000e+00
  %maximum.3239 = select i1 %.inv62, float 0.000000e+00, float %add.3138
  %103 = insertelement <4 x float> poison, float %maximum.17, i32 0
  %104 = insertelement <4 x float> %103, float %maximum.173, i32 1
  %105 = insertelement <4 x float> %104, float %maximum.1716, i32 2
  %106 = insertelement <4 x float> %105, float %maximum.1729, i32 3
  store <4 x float> %106, ptr addrspace(1) %70, align 16
  %107 = insertelement <4 x float> poison, float %maximum.20, i32 0
  %108 = insertelement <4 x float> %107, float %maximum.205, i32 1
  %109 = insertelement <4 x float> %108, float %maximum.2018, i32 2
  %110 = insertelement <4 x float> %109, float %maximum.2031, i32 3
  store <4 x float> %110, ptr addrspace(1) %71, align 16
  %111 = insertelement <4 x float> poison, float %maximum.23, i32 0
  %112 = insertelement <4 x float> %111, float %maximum.237, i32 1
  %113 = insertelement <4 x float> %112, float %maximum.2320, i32 2
  %114 = insertelement <4 x float> %113, float %maximum.2333, i32 3
  store <4 x float> %114, ptr addrspace(1) %72, align 16
  %115 = insertelement <4 x float> poison, float %maximum.26, i32 0
  %116 = insertelement <4 x float> %115, float %maximum.269, i32 1
  %117 = insertelement <4 x float> %116, float %maximum.2622, i32 2
  %118 = insertelement <4 x float> %117, float %maximum.2635, i32 3
  store <4 x float> %118, ptr addrspace(1) %73, align 16
  %119 = insertelement <4 x float> poison, float %maximum.29, i32 0
  %120 = insertelement <4 x float> %119, float %maximum.2911, i32 1
  %121 = insertelement <4 x float> %120, float %maximum.2924, i32 2
  %122 = insertelement <4 x float> %121, float %maximum.2937, i32 3
  store <4 x float> %122, ptr addrspace(1) %74, align 16
  %123 = insertelement <4 x float> poison, float %maximum.32, i32 0
  %124 = insertelement <4 x float> %123, float %maximum.3213, i32 1
  %125 = insertelement <4 x float> %124, float %maximum.3226, i32 2
  %126 = insertelement <4 x float> %125, float %maximum.3239, i32 3
  store <4 x float> %126, ptr addrspace(1) %75, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_17(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg3, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg4, ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(50331648) %arg6) local_unnamed_addr #0 {
entry:
  %arg681 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg579 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg477 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg375 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg273 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg171 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg069 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !45
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %4 = and i32 %3, 252
  %5 = lshr i32 %linear_index_base, 8
  %.lhs.trunc = trunc i32 %5 to i16
  %6 = urem i16 %.lhs.trunc, 6
  %.zext = zext i16 %6 to i32
  %7 = udiv i32 %linear_index_base, 1536
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = and i32 %linear_index1, 253
  %linear_index2 = or i32 %linear_index_base, 2
  %9 = and i32 %linear_index2, 254
  %linear_index3 = or i32 %linear_index_base, 3
  %10 = and i32 %linear_index3, 255
  %11 = icmp ult i16 %6, 3
  br i1 %11, label %concatenate.pivot.1., label %concatenate.pivot.4.

concatenate.pivot.1.:                             ; preds = %entry
  switch i32 %.zext, label %concatenate.pivot.2.2 [
    i32 0, label %concatenate.pivot.0.
    i32 1, label %concatenate.pivot.1.1
  ]

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.1.
  %12 = zext i32 %7 to i64
  %13 = zext i32 %4 to i64
  %14 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg579, i64 0, i64 %12, i64 %13
  br label %concatenate.13.merge

concatenate.pivot.1.1:                            ; preds = %concatenate.pivot.1.
  %15 = zext i32 %7 to i64
  %16 = zext i32 %4 to i64
  %17 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg477, i64 0, i64 %15, i64 %16
  br label %concatenate.13.merge

concatenate.pivot.2.2:                            ; preds = %concatenate.pivot.1.
  %18 = zext i32 %7 to i64
  %19 = zext i32 %4 to i64
  %20 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg375, i64 0, i64 %18, i64 %19
  br label %concatenate.13.merge

concatenate.pivot.4.:                             ; preds = %entry
  %21 = icmp eq i16 %6, 3
  br i1 %21, label %concatenate.pivot.3.3, label %concatenate.pivot.5.

concatenate.pivot.3.3:                            ; preds = %concatenate.pivot.4.
  %22 = zext i32 %7 to i64
  %23 = zext i32 %4 to i64
  %24 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg273, i64 0, i64 %22, i64 %23
  br label %concatenate.13.merge

concatenate.pivot.5.:                             ; preds = %concatenate.pivot.4.
  %25 = icmp ult i16 %6, 5
  %26 = zext i32 %7 to i64
  %27 = zext i32 %4 to i64
  br i1 %25, label %concatenate.pivot.4.4, label %concatenate.pivot.5.5

concatenate.pivot.4.4:                            ; preds = %concatenate.pivot.5.
  %28 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg171, i64 0, i64 %26, i64 %27
  br label %concatenate.13.merge

concatenate.pivot.5.5:                            ; preds = %concatenate.pivot.5.
  %29 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %26, i64 %27
  br label %concatenate.13.merge

concatenate.13.merge:                             ; preds = %concatenate.pivot.5.5, %concatenate.pivot.4.4, %concatenate.pivot.3.3, %concatenate.pivot.2.2, %concatenate.pivot.1.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %14, %concatenate.pivot.0. ], [ %17, %concatenate.pivot.1.1 ], [ %20, %concatenate.pivot.2.2 ], [ %24, %concatenate.pivot.3.3 ], [ %28, %concatenate.pivot.4.4 ], [ %29, %concatenate.pivot.5.5 ]
  %30 = icmp ult i16 %6, 3
  %31 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !40
  %32 = zext i32 %linear_index_base to i64
  %33 = getelementptr float, ptr addrspace(1) %arg681, i64 %32
  store float %31, ptr addrspace(1) %33, align 16
  br i1 %30, label %concatenate.pivot.1.14, label %concatenate.pivot.4.19

concatenate.pivot.1.14:                           ; preds = %concatenate.13.merge
  switch i32 %.zext, label %concatenate.pivot.2.18 [
    i32 0, label %concatenate.pivot.0.15
    i32 1, label %concatenate.pivot.1.17
  ]

concatenate.pivot.0.15:                           ; preds = %concatenate.pivot.1.14
  %34 = zext i32 %7 to i64
  %35 = zext i32 %8 to i64
  %36 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg579, i64 0, i64 %34, i64 %35
  br label %concatenate.13.merge6

concatenate.pivot.1.17:                           ; preds = %concatenate.pivot.1.14
  %37 = zext i32 %7 to i64
  %38 = zext i32 %8 to i64
  %39 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg477, i64 0, i64 %37, i64 %38
  br label %concatenate.13.merge6

concatenate.pivot.2.18:                           ; preds = %concatenate.pivot.1.14
  %40 = zext i32 %7 to i64
  %41 = zext i32 %8 to i64
  %42 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg375, i64 0, i64 %40, i64 %41
  br label %concatenate.13.merge6

concatenate.pivot.4.19:                           ; preds = %concatenate.13.merge
  %43 = icmp eq i16 %6, 3
  br i1 %43, label %concatenate.pivot.3.20, label %concatenate.pivot.5.21

concatenate.pivot.3.20:                           ; preds = %concatenate.pivot.4.19
  %44 = zext i32 %7 to i64
  %45 = zext i32 %8 to i64
  %46 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg273, i64 0, i64 %44, i64 %45
  br label %concatenate.13.merge6

concatenate.pivot.5.21:                           ; preds = %concatenate.pivot.4.19
  %47 = icmp ult i16 %6, 5
  %48 = zext i32 %7 to i64
  %49 = zext i32 %8 to i64
  br i1 %47, label %concatenate.pivot.4.22, label %concatenate.pivot.5.23

concatenate.pivot.4.22:                           ; preds = %concatenate.pivot.5.21
  %50 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg171, i64 0, i64 %48, i64 %49
  br label %concatenate.13.merge6

concatenate.pivot.5.23:                           ; preds = %concatenate.pivot.5.21
  %51 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %48, i64 %49
  br label %concatenate.13.merge6

concatenate.13.merge6:                            ; preds = %concatenate.pivot.5.23, %concatenate.pivot.4.22, %concatenate.pivot.3.20, %concatenate.pivot.2.18, %concatenate.pivot.1.17, %concatenate.pivot.0.15
  %.in66 = phi ptr addrspace(1) [ %36, %concatenate.pivot.0.15 ], [ %39, %concatenate.pivot.1.17 ], [ %42, %concatenate.pivot.2.18 ], [ %46, %concatenate.pivot.3.20 ], [ %50, %concatenate.pivot.4.22 ], [ %51, %concatenate.pivot.5.23 ]
  %52 = icmp ult i16 %6, 3
  %53 = load float, ptr addrspace(1) %.in66, align 4, !invariant.load !40
  %54 = getelementptr inbounds float, ptr addrspace(1) %33, i64 1
  store float %53, ptr addrspace(1) %54, align 4
  br i1 %52, label %concatenate.pivot.1.32, label %concatenate.pivot.4.37

concatenate.pivot.1.32:                           ; preds = %concatenate.13.merge6
  switch i32 %.zext, label %concatenate.pivot.2.36 [
    i32 0, label %concatenate.pivot.0.33
    i32 1, label %concatenate.pivot.1.35
  ]

concatenate.pivot.0.33:                           ; preds = %concatenate.pivot.1.32
  %55 = zext i32 %7 to i64
  %56 = zext i32 %9 to i64
  %57 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg579, i64 0, i64 %55, i64 %56
  br label %concatenate.13.merge24

concatenate.pivot.1.35:                           ; preds = %concatenate.pivot.1.32
  %58 = zext i32 %7 to i64
  %59 = zext i32 %9 to i64
  %60 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg477, i64 0, i64 %58, i64 %59
  br label %concatenate.13.merge24

concatenate.pivot.2.36:                           ; preds = %concatenate.pivot.1.32
  %61 = zext i32 %7 to i64
  %62 = zext i32 %9 to i64
  %63 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg375, i64 0, i64 %61, i64 %62
  br label %concatenate.13.merge24

concatenate.pivot.4.37:                           ; preds = %concatenate.13.merge6
  %64 = icmp eq i16 %6, 3
  br i1 %64, label %concatenate.pivot.3.38, label %concatenate.pivot.5.39

concatenate.pivot.3.38:                           ; preds = %concatenate.pivot.4.37
  %65 = zext i32 %7 to i64
  %66 = zext i32 %9 to i64
  %67 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg273, i64 0, i64 %65, i64 %66
  br label %concatenate.13.merge24

concatenate.pivot.5.39:                           ; preds = %concatenate.pivot.4.37
  %68 = icmp ult i16 %6, 5
  %69 = zext i32 %7 to i64
  %70 = zext i32 %9 to i64
  br i1 %68, label %concatenate.pivot.4.40, label %concatenate.pivot.5.41

concatenate.pivot.4.40:                           ; preds = %concatenate.pivot.5.39
  %71 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg171, i64 0, i64 %69, i64 %70
  br label %concatenate.13.merge24

concatenate.pivot.5.41:                           ; preds = %concatenate.pivot.5.39
  %72 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %69, i64 %70
  br label %concatenate.13.merge24

concatenate.13.merge24:                           ; preds = %concatenate.pivot.5.41, %concatenate.pivot.4.40, %concatenate.pivot.3.38, %concatenate.pivot.2.36, %concatenate.pivot.1.35, %concatenate.pivot.0.33
  %.in67 = phi ptr addrspace(1) [ %57, %concatenate.pivot.0.33 ], [ %60, %concatenate.pivot.1.35 ], [ %63, %concatenate.pivot.2.36 ], [ %67, %concatenate.pivot.3.38 ], [ %71, %concatenate.pivot.4.40 ], [ %72, %concatenate.pivot.5.41 ]
  %73 = icmp ult i16 %6, 3
  %74 = load float, ptr addrspace(1) %.in67, align 4, !invariant.load !40
  %75 = getelementptr inbounds float, ptr addrspace(1) %33, i64 2
  store float %74, ptr addrspace(1) %75, align 8
  br i1 %73, label %concatenate.pivot.1.50, label %concatenate.pivot.4.55

concatenate.pivot.1.50:                           ; preds = %concatenate.13.merge24
  switch i32 %.zext, label %concatenate.pivot.2.54 [
    i32 0, label %concatenate.pivot.0.51
    i32 1, label %concatenate.pivot.1.53
  ]

concatenate.pivot.0.51:                           ; preds = %concatenate.pivot.1.50
  %76 = zext i32 %7 to i64
  %77 = zext i32 %10 to i64
  %78 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg579, i64 0, i64 %76, i64 %77
  br label %concatenate.13.merge42

concatenate.pivot.1.53:                           ; preds = %concatenate.pivot.1.50
  %79 = zext i32 %7 to i64
  %80 = zext i32 %10 to i64
  %81 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg477, i64 0, i64 %79, i64 %80
  br label %concatenate.13.merge42

concatenate.pivot.2.54:                           ; preds = %concatenate.pivot.1.50
  %82 = zext i32 %7 to i64
  %83 = zext i32 %10 to i64
  %84 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg375, i64 0, i64 %82, i64 %83
  br label %concatenate.13.merge42

concatenate.pivot.4.55:                           ; preds = %concatenate.13.merge24
  %85 = icmp eq i16 %6, 3
  br i1 %85, label %concatenate.pivot.3.56, label %concatenate.pivot.5.57

concatenate.pivot.3.56:                           ; preds = %concatenate.pivot.4.55
  %86 = zext i32 %7 to i64
  %87 = zext i32 %10 to i64
  %88 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg273, i64 0, i64 %86, i64 %87
  br label %concatenate.13.merge42

concatenate.pivot.5.57:                           ; preds = %concatenate.pivot.4.55
  %89 = icmp ult i16 %6, 5
  %90 = zext i32 %7 to i64
  %91 = zext i32 %10 to i64
  br i1 %89, label %concatenate.pivot.4.58, label %concatenate.pivot.5.59

concatenate.pivot.4.58:                           ; preds = %concatenate.pivot.5.57
  %92 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg171, i64 0, i64 %90, i64 %91
  br label %concatenate.13.merge42

concatenate.pivot.5.59:                           ; preds = %concatenate.pivot.5.57
  %93 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg069, i64 0, i64 %90, i64 %91
  br label %concatenate.13.merge42

concatenate.13.merge42:                           ; preds = %concatenate.pivot.5.59, %concatenate.pivot.4.58, %concatenate.pivot.3.56, %concatenate.pivot.2.54, %concatenate.pivot.1.53, %concatenate.pivot.0.51
  %.in68 = phi ptr addrspace(1) [ %78, %concatenate.pivot.0.51 ], [ %81, %concatenate.pivot.1.53 ], [ %84, %concatenate.pivot.2.54 ], [ %88, %concatenate.pivot.3.56 ], [ %92, %concatenate.pivot.4.58 ], [ %93, %concatenate.pivot.5.59 ]
  %94 = load float, ptr addrspace(1) %.in68, align 4, !invariant.load !40
  %95 = getelementptr inbounds float, ptr addrspace(1) %33, i64 3
  store float %94, ptr addrspace(1) %95, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_8(ptr noalias nocapture readonly align 16 dereferenceable(31719424) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(524288) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(49020928) %arg4) local_unnamed_addr #0 {
entry:
  %arg464 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg362 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg260 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg158 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg056 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 1496
  %5 = mul i32 %4, 1496
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %6 = urem i32 %linear_index1, 1496
  %linear_index2 = or i32 %linear_index_base, 2
  %7 = urem i32 %linear_index2, 1496
  %linear_index3 = or i32 %linear_index_base, 3
  %8 = urem i32 %linear_index3, 1496
  %9 = icmp ult i32 %.decomposed, 1224
  br i1 %9, label %concatenate.pivot.968., label %concatenate.pivot.1480.

concatenate.pivot.968.:                           ; preds = %entry
  %10 = icmp ult i32 %.decomposed, 968
  br i1 %10, label %concatenate.pivot.0., label %concatenate.pivot.968.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.968.
  %11 = udiv i32 %linear_index_base, 1496
  %12 = mul nuw nsw i32 %11, 968
  %13 = add nuw nsw i32 %12, %.decomposed
  br label %concatenate.5.merge

concatenate.pivot.968.1:                          ; preds = %concatenate.pivot.968.
  %14 = add nsw i32 %.decomposed, -968
  %15 = udiv i32 %linear_index_base, 1496
  %16 = shl nuw nsw i32 %15, 8
  %17 = add nuw nsw i32 %14, %16
  br label %concatenate.5.merge

concatenate.pivot.1480.:                          ; preds = %entry
  %18 = icmp ult i32 %.decomposed, 1480
  %19 = udiv i32 %linear_index_base, 1496
  br i1 %18, label %concatenate.pivot.1224.2, label %concatenate.pivot.1480.3

concatenate.pivot.1224.2:                         ; preds = %concatenate.pivot.1480.
  %20 = add nsw i32 %.decomposed, -1224
  %21 = shl nuw nsw i32 %19, 8
  %22 = add nuw nsw i32 %20, %21
  br label %concatenate.5.merge

concatenate.pivot.1480.3:                         ; preds = %concatenate.pivot.1480.
  %23 = add nsw i32 %.decomposed, -1480
  %24 = shl nuw nsw i32 %19, 4
  %25 = add nuw nsw i32 %23, %24
  br label %concatenate.5.merge

concatenate.5.merge:                              ; preds = %concatenate.pivot.1480.3, %concatenate.pivot.1224.2, %concatenate.pivot.968.1, %concatenate.pivot.0.
  %.sink49 = phi i32 [ %25, %concatenate.pivot.1480.3 ], [ %22, %concatenate.pivot.1224.2 ], [ %17, %concatenate.pivot.968.1 ], [ %13, %concatenate.pivot.0. ]
  %arg3.sink = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.1480.3 ], [ %arg260, %concatenate.pivot.1224.2 ], [ %arg158, %concatenate.pivot.968.1 ], [ %arg056, %concatenate.pivot.0. ]
  %26 = zext i32 %.sink49 to i64
  %27 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !40
  %29 = zext i32 %linear_index_base to i64
  %30 = getelementptr float, ptr addrspace(1) %arg464, i64 %29
  store float %28, ptr addrspace(1) %30, align 16
  %31 = icmp ult i32 %6, 1224
  br i1 %31, label %concatenate.pivot.968.10, label %concatenate.pivot.1480.13

concatenate.pivot.968.10:                         ; preds = %concatenate.5.merge
  %32 = icmp ult i32 %6, 968
  br i1 %32, label %concatenate.pivot.0.11, label %concatenate.pivot.968.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.968.10
  %33 = udiv i32 %linear_index_base, 1496
  %34 = mul nuw nsw i32 %33, 968
  %35 = add nuw nsw i32 %34, %6
  br label %concatenate.5.merge4

concatenate.pivot.968.12:                         ; preds = %concatenate.pivot.968.10
  %36 = add nsw i32 %6, -968
  %37 = udiv i32 %linear_index_base, 1496
  %38 = shl nuw nsw i32 %37, 8
  %39 = add nuw nsw i32 %36, %38
  br label %concatenate.5.merge4

concatenate.pivot.1480.13:                        ; preds = %concatenate.5.merge
  %40 = icmp ult i32 %6, 1480
  %41 = udiv i32 %linear_index_base, 1496
  br i1 %40, label %concatenate.pivot.1224.14, label %concatenate.pivot.1480.15

concatenate.pivot.1224.14:                        ; preds = %concatenate.pivot.1480.13
  %42 = add nsw i32 %6, -1224
  %43 = shl nuw nsw i32 %41, 8
  %44 = add nuw nsw i32 %42, %43
  br label %concatenate.5.merge4

concatenate.pivot.1480.15:                        ; preds = %concatenate.pivot.1480.13
  %45 = add nsw i32 %6, -1480
  %46 = shl nuw nsw i32 %41, 4
  %47 = add nuw nsw i32 %45, %46
  br label %concatenate.5.merge4

concatenate.5.merge4:                             ; preds = %concatenate.pivot.1480.15, %concatenate.pivot.1224.14, %concatenate.pivot.968.12, %concatenate.pivot.0.11
  %.sink51 = phi i32 [ %47, %concatenate.pivot.1480.15 ], [ %44, %concatenate.pivot.1224.14 ], [ %39, %concatenate.pivot.968.12 ], [ %35, %concatenate.pivot.0.11 ]
  %arg3.sink50 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.1480.15 ], [ %arg260, %concatenate.pivot.1224.14 ], [ %arg158, %concatenate.pivot.968.12 ], [ %arg056, %concatenate.pivot.0.11 ]
  %48 = zext i32 %.sink51 to i64
  %49 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink50, i64 %48
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !40
  %51 = getelementptr inbounds float, ptr addrspace(1) %30, i64 1
  store float %50, ptr addrspace(1) %51, align 4
  %52 = icmp ult i32 %7, 1224
  br i1 %52, label %concatenate.pivot.968.22, label %concatenate.pivot.1480.25

concatenate.pivot.968.22:                         ; preds = %concatenate.5.merge4
  %53 = icmp ult i32 %7, 968
  br i1 %53, label %concatenate.pivot.0.23, label %concatenate.pivot.968.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.968.22
  %54 = udiv i32 %linear_index_base, 1496
  %55 = mul nuw nsw i32 %54, 968
  %56 = add nuw nsw i32 %55, %7
  br label %concatenate.5.merge16

concatenate.pivot.968.24:                         ; preds = %concatenate.pivot.968.22
  %57 = add nsw i32 %7, -968
  %58 = udiv i32 %linear_index_base, 1496
  %59 = shl nuw nsw i32 %58, 8
  %60 = add nuw nsw i32 %57, %59
  br label %concatenate.5.merge16

concatenate.pivot.1480.25:                        ; preds = %concatenate.5.merge4
  %61 = icmp ult i32 %7, 1480
  %62 = udiv i32 %linear_index_base, 1496
  br i1 %61, label %concatenate.pivot.1224.26, label %concatenate.pivot.1480.27

concatenate.pivot.1224.26:                        ; preds = %concatenate.pivot.1480.25
  %63 = add nsw i32 %7, -1224
  %64 = shl nuw nsw i32 %62, 8
  %65 = add nuw nsw i32 %63, %64
  br label %concatenate.5.merge16

concatenate.pivot.1480.27:                        ; preds = %concatenate.pivot.1480.25
  %66 = add nsw i32 %7, -1480
  %67 = shl nuw nsw i32 %62, 4
  %68 = add nuw nsw i32 %66, %67
  br label %concatenate.5.merge16

concatenate.5.merge16:                            ; preds = %concatenate.pivot.1480.27, %concatenate.pivot.1224.26, %concatenate.pivot.968.24, %concatenate.pivot.0.23
  %.sink53 = phi i32 [ %68, %concatenate.pivot.1480.27 ], [ %65, %concatenate.pivot.1224.26 ], [ %60, %concatenate.pivot.968.24 ], [ %56, %concatenate.pivot.0.23 ]
  %arg3.sink52 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.1480.27 ], [ %arg260, %concatenate.pivot.1224.26 ], [ %arg158, %concatenate.pivot.968.24 ], [ %arg056, %concatenate.pivot.0.23 ]
  %69 = zext i32 %.sink53 to i64
  %70 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink52, i64 %69
  %71 = load float, ptr addrspace(1) %70, align 4, !invariant.load !40
  %72 = getelementptr inbounds float, ptr addrspace(1) %30, i64 2
  store float %71, ptr addrspace(1) %72, align 8
  %73 = icmp ult i32 %8, 1224
  br i1 %73, label %concatenate.pivot.968.34, label %concatenate.pivot.1480.37

concatenate.pivot.968.34:                         ; preds = %concatenate.5.merge16
  %74 = icmp ult i32 %8, 968
  br i1 %74, label %concatenate.pivot.0.35, label %concatenate.pivot.968.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.968.34
  %75 = udiv i32 %linear_index_base, 1496
  %76 = mul nuw nsw i32 %75, 968
  %77 = add nuw nsw i32 %76, %8
  br label %concatenate.5.merge28

concatenate.pivot.968.36:                         ; preds = %concatenate.pivot.968.34
  %78 = add nsw i32 %8, -968
  %79 = udiv i32 %linear_index_base, 1496
  %80 = shl nuw nsw i32 %79, 8
  %81 = add nuw nsw i32 %78, %80
  br label %concatenate.5.merge28

concatenate.pivot.1480.37:                        ; preds = %concatenate.5.merge16
  %82 = icmp ult i32 %8, 1480
  br i1 %82, label %concatenate.pivot.1224.38, label %concatenate.pivot.1480.39

concatenate.pivot.1224.38:                        ; preds = %concatenate.pivot.1480.37
  %83 = add nsw i32 %8, -1224
  %84 = shl nuw nsw i32 %4, 8
  %85 = add nuw nsw i32 %83, %84
  br label %concatenate.5.merge28

concatenate.pivot.1480.39:                        ; preds = %concatenate.pivot.1480.37
  %86 = add nsw i32 %8, -1480
  %87 = shl nuw nsw i32 %4, 4
  %88 = add nuw nsw i32 %86, %87
  br label %concatenate.5.merge28

concatenate.5.merge28:                            ; preds = %concatenate.pivot.1480.39, %concatenate.pivot.1224.38, %concatenate.pivot.968.36, %concatenate.pivot.0.35
  %.sink55 = phi i32 [ %88, %concatenate.pivot.1480.39 ], [ %85, %concatenate.pivot.1224.38 ], [ %81, %concatenate.pivot.968.36 ], [ %77, %concatenate.pivot.0.35 ]
  %arg3.sink54 = phi ptr addrspace(1) [ %arg362, %concatenate.pivot.1480.39 ], [ %arg260, %concatenate.pivot.1224.38 ], [ %arg158, %concatenate.pivot.968.36 ], [ %arg056, %concatenate.pivot.0.35 ]
  %89 = zext i32 %.sink55 to i64
  %90 = getelementptr inbounds float, ptr addrspace(1) %arg3.sink54, i64 %89
  %91 = load float, ptr addrspace(1) %90, align 4, !invariant.load !40
  %92 = getelementptr inbounds float, ptr addrspace(1) %30, i64 3
  store float %91, ptr addrspace(1) %92, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice_10(ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(2949120) %arg1) local_unnamed_addr #2 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %4 = udiv i32 %linear_index3.frozen, 90
  %5 = mul i32 %4, 90
  %.decomposed = sub i32 %linear_index3.frozen, %5
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %6 = udiv i32 %linear_index2.frozen, 90
  %7 = mul i32 %6, 90
  %.decomposed1 = sub i32 %linear_index2.frozen, %7
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %8 = udiv i32 %linear_index_base.frozen, 90
  %9 = urem i32 %linear_index1, 90
  %10 = mul i32 %8, 90
  %.decomposed2 = sub i32 %linear_index_base.frozen, %10
  %11 = or i32 %.decomposed2, 512
  %12 = zext i32 %8 to i64
  %13 = zext i32 %11 to i64
  %14 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %12, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !40
  %16 = zext i32 %linear_index_base to i64
  %17 = getelementptr float, ptr addrspace(1) %arg15, i64 %16
  %18 = zext i32 %9 to i64
  %19 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %12, i64 %18
  %20 = getelementptr inbounds float, ptr addrspace(1) %19, i64 512
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !40
  %22 = or i32 %.decomposed1, 512
  %23 = zext i32 %6 to i64
  %24 = zext i32 %22 to i64
  %25 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %23, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 4, !invariant.load !40
  %27 = or i32 %.decomposed, 512
  %28 = zext i32 %4 to i64
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %28, i64 %29
  %31 = load float, ptr addrspace(1) %30, align 4, !invariant.load !40
  %32 = insertelement <4 x float> poison, float %15, i32 0
  %33 = insertelement <4 x float> %32, float %21, i32 1
  %34 = insertelement <4 x float> %33, float %26, i32 2
  %35 = insertelement <4 x float> %34, float %31, i32 3
  store <4 x float> %35, ptr addrspace(1) %17, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_41(ptr noalias nocapture readonly align 128 dereferenceable(2949120) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(360) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(491520) %arg2) local_unnamed_addr #2 {
entry:
  %arg260 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg158 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg056 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 15
  %5 = mul i32 %4, 15
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index1.frozen = freeze i32 %linear_index1
  %6 = udiv i32 %linear_index1.frozen, 15
  %7 = mul i32 %6, 15
  %.decomposed53 = sub i32 %linear_index1.frozen, %7
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %8 = udiv i32 %linear_index2.frozen, 15
  %9 = mul i32 %8, 15
  %.decomposed54 = sub i32 %linear_index2.frozen, %9
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %10 = udiv i32 %linear_index3.frozen, 15
  %11 = mul i32 %10, 15
  %.decomposed55 = sub i32 %linear_index3.frozen, %11
  %12 = mul nuw nsw i32 %.decomposed, 6
  %13 = zext i32 %4 to i64
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg056, i64 0, i64 %13, i64 %14
  %16 = load <2 x float>, ptr addrspace(1) %15, align 8, !invariant.load !40
  %17 = extractelement <2 x float> %16, i32 0
  %18 = extractelement <2 x float> %16, i32 1
  %19 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg158, i64 0, i64 %14
  %20 = load <2 x float>, ptr addrspace(1) %19, align 8, !invariant.load !40
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %add.4 = fadd float %17, %21
  %23 = fcmp ole float %add.4, 0xFFF0000000000000
  %maximum.10.i = select i1 %23, float 0xFFF0000000000000, float %add.4
  %add.4.1 = fadd float %18, %22
  %24 = fcmp oge float %maximum.10.i, %add.4.1
  %25 = fcmp uno float %maximum.10.i, 0.000000e+00
  %26 = or i1 %25, %24
  %maximum.10.i.1 = select i1 %26, float %maximum.10.i, float %add.4.1
  %27 = getelementptr inbounds float, ptr addrspace(1) %15, i64 2
  %28 = load <2 x float>, ptr addrspace(1) %27, align 8, !invariant.load !40
  %29 = extractelement <2 x float> %28, i32 0
  %30 = extractelement <2 x float> %28, i32 1
  %31 = getelementptr inbounds float, ptr addrspace(1) %19, i64 2
  %32 = load <2 x float>, ptr addrspace(1) %31, align 8, !invariant.load !40
  %33 = extractelement <2 x float> %32, i32 0
  %34 = extractelement <2 x float> %32, i32 1
  %add.4.2 = fadd float %29, %33
  %35 = fcmp oge float %maximum.10.i.1, %add.4.2
  %36 = fcmp uno float %maximum.10.i.1, 0.000000e+00
  %37 = or i1 %36, %35
  %maximum.10.i.2 = select i1 %37, float %maximum.10.i.1, float %add.4.2
  %add.4.3 = fadd float %30, %34
  %38 = fcmp oge float %maximum.10.i.2, %add.4.3
  %39 = fcmp uno float %maximum.10.i.2, 0.000000e+00
  %40 = or i1 %39, %38
  %maximum.10.i.3 = select i1 %40, float %maximum.10.i.2, float %add.4.3
  %41 = getelementptr inbounds float, ptr addrspace(1) %15, i64 4
  %42 = load <2 x float>, ptr addrspace(1) %41, align 8, !invariant.load !40
  %43 = extractelement <2 x float> %42, i32 0
  %44 = extractelement <2 x float> %42, i32 1
  %45 = getelementptr inbounds float, ptr addrspace(1) %19, i64 4
  %46 = load <2 x float>, ptr addrspace(1) %45, align 8, !invariant.load !40
  %47 = extractelement <2 x float> %46, i32 0
  %48 = extractelement <2 x float> %46, i32 1
  %add.4.4 = fadd float %43, %47
  %49 = fcmp oge float %maximum.10.i.3, %add.4.4
  %50 = fcmp uno float %maximum.10.i.3, 0.000000e+00
  %51 = or i1 %50, %49
  %maximum.10.i.4 = select i1 %51, float %maximum.10.i.3, float %add.4.4
  %add.4.5 = fadd float %44, %48
  %52 = fcmp oge float %maximum.10.i.4, %add.4.5
  %53 = fcmp uno float %maximum.10.i.4, 0.000000e+00
  %54 = or i1 %53, %52
  %maximum.10.i.5 = select i1 %54, float %maximum.10.i.4, float %add.4.5
  %55 = zext i32 %linear_index_base to i64
  %56 = getelementptr float, ptr addrspace(1) %arg260, i64 %55
  %57 = mul nuw nsw i32 %.decomposed53, 6
  %58 = zext i32 %6 to i64
  %59 = zext i32 %57 to i64
  %60 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg056, i64 0, i64 %58, i64 %59
  %61 = load <2 x float>, ptr addrspace(1) %60, align 8, !invariant.load !40
  %62 = extractelement <2 x float> %61, i32 0
  %63 = extractelement <2 x float> %61, i32 1
  %64 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg158, i64 0, i64 %59
  %65 = load <2 x float>, ptr addrspace(1) %64, align 8, !invariant.load !40
  %66 = extractelement <2 x float> %65, i32 0
  %67 = extractelement <2 x float> %65, i32 1
  %add.410 = fadd float %62, %66
  %68 = fcmp ole float %add.410, 0xFFF0000000000000
  %maximum.10.i42 = select i1 %68, float 0xFFF0000000000000, float %add.410
  %add.410.1 = fadd float %63, %67
  %69 = fcmp oge float %maximum.10.i42, %add.410.1
  %70 = fcmp uno float %maximum.10.i42, 0.000000e+00
  %71 = or i1 %70, %69
  %maximum.10.i42.1 = select i1 %71, float %maximum.10.i42, float %add.410.1
  %72 = getelementptr inbounds float, ptr addrspace(1) %60, i64 2
  %73 = load <2 x float>, ptr addrspace(1) %72, align 8, !invariant.load !40
  %74 = extractelement <2 x float> %73, i32 0
  %75 = extractelement <2 x float> %73, i32 1
  %76 = getelementptr inbounds float, ptr addrspace(1) %64, i64 2
  %77 = load <2 x float>, ptr addrspace(1) %76, align 8, !invariant.load !40
  %78 = extractelement <2 x float> %77, i32 0
  %79 = extractelement <2 x float> %77, i32 1
  %add.410.2 = fadd float %74, %78
  %80 = fcmp oge float %maximum.10.i42.1, %add.410.2
  %81 = fcmp uno float %maximum.10.i42.1, 0.000000e+00
  %82 = or i1 %81, %80
  %maximum.10.i42.2 = select i1 %82, float %maximum.10.i42.1, float %add.410.2
  %add.410.3 = fadd float %75, %79
  %83 = fcmp oge float %maximum.10.i42.2, %add.410.3
  %84 = fcmp uno float %maximum.10.i42.2, 0.000000e+00
  %85 = or i1 %84, %83
  %maximum.10.i42.3 = select i1 %85, float %maximum.10.i42.2, float %add.410.3
  %86 = getelementptr inbounds float, ptr addrspace(1) %60, i64 4
  %87 = load <2 x float>, ptr addrspace(1) %86, align 8, !invariant.load !40
  %88 = extractelement <2 x float> %87, i32 0
  %89 = extractelement <2 x float> %87, i32 1
  %90 = getelementptr inbounds float, ptr addrspace(1) %64, i64 4
  %91 = load <2 x float>, ptr addrspace(1) %90, align 8, !invariant.load !40
  %92 = extractelement <2 x float> %91, i32 0
  %93 = extractelement <2 x float> %91, i32 1
  %add.410.4 = fadd float %88, %92
  %94 = fcmp oge float %maximum.10.i42.3, %add.410.4
  %95 = fcmp uno float %maximum.10.i42.3, 0.000000e+00
  %96 = or i1 %95, %94
  %maximum.10.i42.4 = select i1 %96, float %maximum.10.i42.3, float %add.410.4
  %add.410.5 = fadd float %89, %93
  %97 = fcmp oge float %maximum.10.i42.4, %add.410.5
  %98 = fcmp uno float %maximum.10.i42.4, 0.000000e+00
  %99 = or i1 %98, %97
  %maximum.10.i42.5 = select i1 %99, float %maximum.10.i42.4, float %add.410.5
  %100 = mul nuw nsw i32 %.decomposed54, 6
  %101 = zext i32 %8 to i64
  %102 = zext i32 %100 to i64
  %103 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg056, i64 0, i64 %101, i64 %102
  %104 = load <2 x float>, ptr addrspace(1) %103, align 8, !invariant.load !40
  %105 = extractelement <2 x float> %104, i32 0
  %106 = extractelement <2 x float> %104, i32 1
  %107 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg158, i64 0, i64 %102
  %108 = load <2 x float>, ptr addrspace(1) %107, align 8, !invariant.load !40
  %109 = extractelement <2 x float> %108, i32 0
  %110 = extractelement <2 x float> %108, i32 1
  %add.422 = fadd float %105, %109
  %111 = fcmp ole float %add.422, 0xFFF0000000000000
  %maximum.10.i43 = select i1 %111, float 0xFFF0000000000000, float %add.422
  %add.422.1 = fadd float %106, %110
  %112 = fcmp oge float %maximum.10.i43, %add.422.1
  %113 = fcmp uno float %maximum.10.i43, 0.000000e+00
  %114 = or i1 %113, %112
  %maximum.10.i43.1 = select i1 %114, float %maximum.10.i43, float %add.422.1
  %115 = getelementptr inbounds float, ptr addrspace(1) %103, i64 2
  %116 = load <2 x float>, ptr addrspace(1) %115, align 8, !invariant.load !40
  %117 = extractelement <2 x float> %116, i32 0
  %118 = extractelement <2 x float> %116, i32 1
  %119 = getelementptr inbounds float, ptr addrspace(1) %107, i64 2
  %120 = load <2 x float>, ptr addrspace(1) %119, align 8, !invariant.load !40
  %121 = extractelement <2 x float> %120, i32 0
  %122 = extractelement <2 x float> %120, i32 1
  %add.422.2 = fadd float %117, %121
  %123 = fcmp oge float %maximum.10.i43.1, %add.422.2
  %124 = fcmp uno float %maximum.10.i43.1, 0.000000e+00
  %125 = or i1 %124, %123
  %maximum.10.i43.2 = select i1 %125, float %maximum.10.i43.1, float %add.422.2
  %add.422.3 = fadd float %118, %122
  %126 = fcmp oge float %maximum.10.i43.2, %add.422.3
  %127 = fcmp uno float %maximum.10.i43.2, 0.000000e+00
  %128 = or i1 %127, %126
  %maximum.10.i43.3 = select i1 %128, float %maximum.10.i43.2, float %add.422.3
  %129 = getelementptr inbounds float, ptr addrspace(1) %103, i64 4
  %130 = load <2 x float>, ptr addrspace(1) %129, align 8, !invariant.load !40
  %131 = extractelement <2 x float> %130, i32 0
  %132 = extractelement <2 x float> %130, i32 1
  %133 = getelementptr inbounds float, ptr addrspace(1) %107, i64 4
  %134 = load <2 x float>, ptr addrspace(1) %133, align 8, !invariant.load !40
  %135 = extractelement <2 x float> %134, i32 0
  %136 = extractelement <2 x float> %134, i32 1
  %add.422.4 = fadd float %131, %135
  %137 = fcmp oge float %maximum.10.i43.3, %add.422.4
  %138 = fcmp uno float %maximum.10.i43.3, 0.000000e+00
  %139 = or i1 %138, %137
  %maximum.10.i43.4 = select i1 %139, float %maximum.10.i43.3, float %add.422.4
  %add.422.5 = fadd float %132, %136
  %140 = fcmp oge float %maximum.10.i43.4, %add.422.5
  %141 = fcmp uno float %maximum.10.i43.4, 0.000000e+00
  %142 = or i1 %141, %140
  %maximum.10.i43.5 = select i1 %142, float %maximum.10.i43.4, float %add.422.5
  %143 = mul nuw nsw i32 %.decomposed55, 6
  %144 = zext i32 %10 to i64
  %145 = zext i32 %143 to i64
  %146 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg056, i64 0, i64 %144, i64 %145
  %147 = load <2 x float>, ptr addrspace(1) %146, align 8, !invariant.load !40
  %148 = extractelement <2 x float> %147, i32 0
  %149 = extractelement <2 x float> %147, i32 1
  %150 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg158, i64 0, i64 %145
  %151 = load <2 x float>, ptr addrspace(1) %150, align 8, !invariant.load !40
  %152 = extractelement <2 x float> %151, i32 0
  %153 = extractelement <2 x float> %151, i32 1
  %add.434 = fadd float %148, %152
  %154 = fcmp ole float %add.434, 0xFFF0000000000000
  %maximum.10.i44 = select i1 %154, float 0xFFF0000000000000, float %add.434
  %add.434.1 = fadd float %149, %153
  %155 = fcmp oge float %maximum.10.i44, %add.434.1
  %156 = fcmp uno float %maximum.10.i44, 0.000000e+00
  %157 = or i1 %156, %155
  %maximum.10.i44.1 = select i1 %157, float %maximum.10.i44, float %add.434.1
  %158 = getelementptr inbounds float, ptr addrspace(1) %146, i64 2
  %159 = load <2 x float>, ptr addrspace(1) %158, align 8, !invariant.load !40
  %160 = extractelement <2 x float> %159, i32 0
  %161 = extractelement <2 x float> %159, i32 1
  %162 = getelementptr inbounds float, ptr addrspace(1) %150, i64 2
  %163 = load <2 x float>, ptr addrspace(1) %162, align 8, !invariant.load !40
  %164 = extractelement <2 x float> %163, i32 0
  %165 = extractelement <2 x float> %163, i32 1
  %add.434.2 = fadd float %160, %164
  %166 = fcmp oge float %maximum.10.i44.1, %add.434.2
  %167 = fcmp uno float %maximum.10.i44.1, 0.000000e+00
  %168 = or i1 %167, %166
  %maximum.10.i44.2 = select i1 %168, float %maximum.10.i44.1, float %add.434.2
  %add.434.3 = fadd float %161, %165
  %169 = fcmp oge float %maximum.10.i44.2, %add.434.3
  %170 = fcmp uno float %maximum.10.i44.2, 0.000000e+00
  %171 = or i1 %170, %169
  %maximum.10.i44.3 = select i1 %171, float %maximum.10.i44.2, float %add.434.3
  %172 = getelementptr inbounds float, ptr addrspace(1) %146, i64 4
  %173 = load <2 x float>, ptr addrspace(1) %172, align 8, !invariant.load !40
  %174 = extractelement <2 x float> %173, i32 0
  %175 = extractelement <2 x float> %173, i32 1
  %176 = getelementptr inbounds float, ptr addrspace(1) %150, i64 4
  %177 = load <2 x float>, ptr addrspace(1) %176, align 8, !invariant.load !40
  %178 = extractelement <2 x float> %177, i32 0
  %179 = extractelement <2 x float> %177, i32 1
  %add.434.4 = fadd float %174, %178
  %180 = fcmp oge float %maximum.10.i44.3, %add.434.4
  %181 = fcmp uno float %maximum.10.i44.3, 0.000000e+00
  %182 = or i1 %181, %180
  %maximum.10.i44.4 = select i1 %182, float %maximum.10.i44.3, float %add.434.4
  %add.434.5 = fadd float %175, %179
  %183 = fcmp oge float %maximum.10.i44.4, %add.434.5
  %184 = fcmp uno float %maximum.10.i44.4, 0.000000e+00
  %185 = or i1 %184, %183
  %maximum.10.i44.5 = select i1 %185, float %maximum.10.i44.4, float %add.434.5
  %186 = insertelement <4 x float> poison, float %maximum.10.i.5, i32 0
  %187 = insertelement <4 x float> %186, float %maximum.10.i42.5, i32 1
  %188 = insertelement <4 x float> %187, float %maximum.10.i43.5, i32 2
  %189 = insertelement <4 x float> %188, float %maximum.10.i44.5, i32 3
  store <4 x float> %189, ptr addrspace(1) %56, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_42(ptr noalias nocapture readonly align 128 dereferenceable(491520) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(2949120) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(360) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(491520) %arg3) local_unnamed_addr #2 {
entry:
  %arg365 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg263 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg161 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg059 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 15
  %5 = mul i32 %4, 15
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %linear_index1 = or i32 %linear_index_base, 1
  %linear_index1.frozen = freeze i32 %linear_index1
  %6 = udiv i32 %linear_index1.frozen, 15
  %7 = mul i32 %6, 15
  %.decomposed56 = sub i32 %linear_index1.frozen, %7
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %8 = udiv i32 %linear_index2.frozen, 15
  %9 = mul i32 %8, 15
  %.decomposed57 = sub i32 %linear_index2.frozen, %9
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %10 = udiv i32 %linear_index3.frozen, 15
  %11 = mul i32 %10, 15
  %.decomposed58 = sub i32 %linear_index3.frozen, %11
  %12 = mul nuw nsw i32 %.decomposed, 6
  %13 = zext i32 %4 to i64
  %14 = zext i32 %.decomposed to i64
  %15 = getelementptr inbounds [8192 x [15 x float]], ptr addrspace(1) %arg059, i64 0, i64 %13, i64 %14
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !40
  %17 = zext i32 %12 to i64
  %18 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg161, i64 0, i64 %13, i64 %17
  %19 = load <2 x float>, ptr addrspace(1) %18, align 8, !invariant.load !40
  %20 = extractelement <2 x float> %19, i32 0
  %21 = extractelement <2 x float> %19, i32 1
  %22 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg263, i64 0, i64 %17
  %23 = load <2 x float>, ptr addrspace(1) %22, align 8, !invariant.load !40
  %24 = extractelement <2 x float> %23, i32 0
  %25 = extractelement <2 x float> %23, i32 1
  %add.5 = fadd float %20, %24
  %subtract.8 = fsub float %add.5, %16
  %26 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3F777313A0000000, float 5.000000e-01)
  %27 = tail call float @llvm.nvvm.saturate.f(float %26) #5
  %28 = tail call float @llvm.nvvm.fma.rm.f(float %27, float 2.520000e+02, float 0x4168000020000000) #5
  %29 = fadd float %28, 0xC168000FE0000000
  %30 = fneg float %29
  %31 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3FF7154760000000, float %30)
  %32 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3E54AE0C00000000, float %31)
  %33 = bitcast float %28 to i32
  %34 = shl i32 %33, 23
  %35 = bitcast i32 %34 to float
  %36 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %32) #5
  %37 = fmul float %36, %35
  %add.5.1 = fadd float %21, %25
  %subtract.8.1 = fsub float %add.5.1, %16
  %38 = tail call float @llvm.fma.f32(float %subtract.8.1, float 0x3F777313A0000000, float 5.000000e-01)
  %39 = tail call float @llvm.nvvm.saturate.f(float %38) #5
  %40 = tail call float @llvm.nvvm.fma.rm.f(float %39, float 2.520000e+02, float 0x4168000020000000) #5
  %41 = fadd float %40, 0xC168000FE0000000
  %42 = fneg float %41
  %43 = tail call float @llvm.fma.f32(float %subtract.8.1, float 0x3FF7154760000000, float %42)
  %44 = tail call float @llvm.fma.f32(float %subtract.8.1, float 0x3E54AE0C00000000, float %43)
  %45 = bitcast float %40 to i32
  %46 = shl i32 %45, 23
  %47 = bitcast i32 %46 to float
  %48 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %44) #5
  %49 = fmul float %48, %47
  %add.14.i.1 = fadd float %37, %49
  %50 = getelementptr inbounds float, ptr addrspace(1) %18, i64 2
  %51 = load <2 x float>, ptr addrspace(1) %50, align 8, !invariant.load !40
  %52 = extractelement <2 x float> %51, i32 0
  %53 = extractelement <2 x float> %51, i32 1
  %54 = getelementptr inbounds float, ptr addrspace(1) %22, i64 2
  %55 = load <2 x float>, ptr addrspace(1) %54, align 8, !invariant.load !40
  %56 = extractelement <2 x float> %55, i32 0
  %57 = extractelement <2 x float> %55, i32 1
  %add.5.2 = fadd float %52, %56
  %subtract.8.2 = fsub float %add.5.2, %16
  %58 = tail call float @llvm.fma.f32(float %subtract.8.2, float 0x3F777313A0000000, float 5.000000e-01)
  %59 = tail call float @llvm.nvvm.saturate.f(float %58) #5
  %60 = tail call float @llvm.nvvm.fma.rm.f(float %59, float 2.520000e+02, float 0x4168000020000000) #5
  %61 = fadd float %60, 0xC168000FE0000000
  %62 = fneg float %61
  %63 = tail call float @llvm.fma.f32(float %subtract.8.2, float 0x3FF7154760000000, float %62)
  %64 = tail call float @llvm.fma.f32(float %subtract.8.2, float 0x3E54AE0C00000000, float %63)
  %65 = bitcast float %60 to i32
  %66 = shl i32 %65, 23
  %67 = bitcast i32 %66 to float
  %68 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %64) #5
  %69 = fmul float %68, %67
  %add.14.i.2 = fadd float %add.14.i.1, %69
  %add.5.3 = fadd float %53, %57
  %subtract.8.3 = fsub float %add.5.3, %16
  %70 = tail call float @llvm.fma.f32(float %subtract.8.3, float 0x3F777313A0000000, float 5.000000e-01)
  %71 = tail call float @llvm.nvvm.saturate.f(float %70) #5
  %72 = tail call float @llvm.nvvm.fma.rm.f(float %71, float 2.520000e+02, float 0x4168000020000000) #5
  %73 = fadd float %72, 0xC168000FE0000000
  %74 = fneg float %73
  %75 = tail call float @llvm.fma.f32(float %subtract.8.3, float 0x3FF7154760000000, float %74)
  %76 = tail call float @llvm.fma.f32(float %subtract.8.3, float 0x3E54AE0C00000000, float %75)
  %77 = bitcast float %72 to i32
  %78 = shl i32 %77, 23
  %79 = bitcast i32 %78 to float
  %80 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %76) #5
  %81 = fmul float %80, %79
  %add.14.i.3 = fadd float %add.14.i.2, %81
  %82 = getelementptr inbounds float, ptr addrspace(1) %18, i64 4
  %83 = load <2 x float>, ptr addrspace(1) %82, align 8, !invariant.load !40
  %84 = extractelement <2 x float> %83, i32 0
  %85 = extractelement <2 x float> %83, i32 1
  %86 = getelementptr inbounds float, ptr addrspace(1) %22, i64 4
  %87 = load <2 x float>, ptr addrspace(1) %86, align 8, !invariant.load !40
  %88 = extractelement <2 x float> %87, i32 0
  %89 = extractelement <2 x float> %87, i32 1
  %add.5.4 = fadd float %84, %88
  %subtract.8.4 = fsub float %add.5.4, %16
  %90 = tail call float @llvm.fma.f32(float %subtract.8.4, float 0x3F777313A0000000, float 5.000000e-01)
  %91 = tail call float @llvm.nvvm.saturate.f(float %90) #5
  %92 = tail call float @llvm.nvvm.fma.rm.f(float %91, float 2.520000e+02, float 0x4168000020000000) #5
  %93 = fadd float %92, 0xC168000FE0000000
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %subtract.8.4, float 0x3FF7154760000000, float %94)
  %96 = tail call float @llvm.fma.f32(float %subtract.8.4, float 0x3E54AE0C00000000, float %95)
  %97 = bitcast float %92 to i32
  %98 = shl i32 %97, 23
  %99 = bitcast i32 %98 to float
  %100 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %96) #5
  %101 = fmul float %100, %99
  %add.14.i.4 = fadd float %add.14.i.3, %101
  %add.5.5 = fadd float %85, %89
  %subtract.8.5 = fsub float %add.5.5, %16
  %102 = tail call float @llvm.fma.f32(float %subtract.8.5, float 0x3F777313A0000000, float 5.000000e-01)
  %103 = tail call float @llvm.nvvm.saturate.f(float %102) #5
  %104 = tail call float @llvm.nvvm.fma.rm.f(float %103, float 2.520000e+02, float 0x4168000020000000) #5
  %105 = fadd float %104, 0xC168000FE0000000
  %106 = fneg float %105
  %107 = tail call float @llvm.fma.f32(float %subtract.8.5, float 0x3FF7154760000000, float %106)
  %108 = tail call float @llvm.fma.f32(float %subtract.8.5, float 0x3E54AE0C00000000, float %107)
  %109 = bitcast float %104 to i32
  %110 = shl i32 %109, 23
  %111 = bitcast i32 %110 to float
  %112 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %108) #5
  %113 = fmul float %112, %111
  %add.14.i.5 = fadd float %add.14.i.4, %113
  %114 = zext i32 %linear_index_base to i64
  %115 = getelementptr float, ptr addrspace(1) %arg365, i64 %114
  %116 = mul nuw nsw i32 %.decomposed56, 6
  %117 = zext i32 %6 to i64
  %118 = zext i32 %.decomposed56 to i64
  %119 = getelementptr inbounds [8192 x [15 x float]], ptr addrspace(1) %arg059, i64 0, i64 %117, i64 %118
  %120 = load float, ptr addrspace(1) %119, align 4, !invariant.load !40
  %121 = zext i32 %116 to i64
  %122 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg161, i64 0, i64 %117, i64 %121
  %123 = load <2 x float>, ptr addrspace(1) %122, align 8, !invariant.load !40
  %124 = extractelement <2 x float> %123, i32 0
  %125 = extractelement <2 x float> %123, i32 1
  %126 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg263, i64 0, i64 %121
  %127 = load <2 x float>, ptr addrspace(1) %126, align 8, !invariant.load !40
  %128 = extractelement <2 x float> %127, i32 0
  %129 = extractelement <2 x float> %127, i32 1
  %add.510 = fadd float %124, %128
  %subtract.811 = fsub float %add.510, %120
  %130 = tail call float @llvm.fma.f32(float %subtract.811, float 0x3F777313A0000000, float 5.000000e-01)
  %131 = tail call float @llvm.nvvm.saturate.f(float %130) #5
  %132 = tail call float @llvm.nvvm.fma.rm.f(float %131, float 2.520000e+02, float 0x4168000020000000) #5
  %133 = fadd float %132, 0xC168000FE0000000
  %134 = fneg float %133
  %135 = tail call float @llvm.fma.f32(float %subtract.811, float 0x3FF7154760000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %subtract.811, float 0x3E54AE0C00000000, float %135)
  %137 = bitcast float %132 to i32
  %138 = shl i32 %137, 23
  %139 = bitcast i32 %138 to float
  %140 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %136) #5
  %141 = fmul float %140, %139
  %add.510.1 = fadd float %125, %129
  %subtract.811.1 = fsub float %add.510.1, %120
  %142 = tail call float @llvm.fma.f32(float %subtract.811.1, float 0x3F777313A0000000, float 5.000000e-01)
  %143 = tail call float @llvm.nvvm.saturate.f(float %142) #5
  %144 = tail call float @llvm.nvvm.fma.rm.f(float %143, float 2.520000e+02, float 0x4168000020000000) #5
  %145 = fadd float %144, 0xC168000FE0000000
  %146 = fneg float %145
  %147 = tail call float @llvm.fma.f32(float %subtract.811.1, float 0x3FF7154760000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %subtract.811.1, float 0x3E54AE0C00000000, float %147)
  %149 = bitcast float %144 to i32
  %150 = shl i32 %149, 23
  %151 = bitcast i32 %150 to float
  %152 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %148) #5
  %153 = fmul float %152, %151
  %add.14.i45.1 = fadd float %141, %153
  %154 = getelementptr inbounds float, ptr addrspace(1) %122, i64 2
  %155 = load <2 x float>, ptr addrspace(1) %154, align 8, !invariant.load !40
  %156 = extractelement <2 x float> %155, i32 0
  %157 = extractelement <2 x float> %155, i32 1
  %158 = getelementptr inbounds float, ptr addrspace(1) %126, i64 2
  %159 = load <2 x float>, ptr addrspace(1) %158, align 8, !invariant.load !40
  %160 = extractelement <2 x float> %159, i32 0
  %161 = extractelement <2 x float> %159, i32 1
  %add.510.2 = fadd float %156, %160
  %subtract.811.2 = fsub float %add.510.2, %120
  %162 = tail call float @llvm.fma.f32(float %subtract.811.2, float 0x3F777313A0000000, float 5.000000e-01)
  %163 = tail call float @llvm.nvvm.saturate.f(float %162) #5
  %164 = tail call float @llvm.nvvm.fma.rm.f(float %163, float 2.520000e+02, float 0x4168000020000000) #5
  %165 = fadd float %164, 0xC168000FE0000000
  %166 = fneg float %165
  %167 = tail call float @llvm.fma.f32(float %subtract.811.2, float 0x3FF7154760000000, float %166)
  %168 = tail call float @llvm.fma.f32(float %subtract.811.2, float 0x3E54AE0C00000000, float %167)
  %169 = bitcast float %164 to i32
  %170 = shl i32 %169, 23
  %171 = bitcast i32 %170 to float
  %172 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %168) #5
  %173 = fmul float %172, %171
  %add.14.i45.2 = fadd float %add.14.i45.1, %173
  %add.510.3 = fadd float %157, %161
  %subtract.811.3 = fsub float %add.510.3, %120
  %174 = tail call float @llvm.fma.f32(float %subtract.811.3, float 0x3F777313A0000000, float 5.000000e-01)
  %175 = tail call float @llvm.nvvm.saturate.f(float %174) #5
  %176 = tail call float @llvm.nvvm.fma.rm.f(float %175, float 2.520000e+02, float 0x4168000020000000) #5
  %177 = fadd float %176, 0xC168000FE0000000
  %178 = fneg float %177
  %179 = tail call float @llvm.fma.f32(float %subtract.811.3, float 0x3FF7154760000000, float %178)
  %180 = tail call float @llvm.fma.f32(float %subtract.811.3, float 0x3E54AE0C00000000, float %179)
  %181 = bitcast float %176 to i32
  %182 = shl i32 %181, 23
  %183 = bitcast i32 %182 to float
  %184 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %180) #5
  %185 = fmul float %184, %183
  %add.14.i45.3 = fadd float %add.14.i45.2, %185
  %186 = getelementptr inbounds float, ptr addrspace(1) %122, i64 4
  %187 = load <2 x float>, ptr addrspace(1) %186, align 8, !invariant.load !40
  %188 = extractelement <2 x float> %187, i32 0
  %189 = extractelement <2 x float> %187, i32 1
  %190 = getelementptr inbounds float, ptr addrspace(1) %126, i64 4
  %191 = load <2 x float>, ptr addrspace(1) %190, align 8, !invariant.load !40
  %192 = extractelement <2 x float> %191, i32 0
  %193 = extractelement <2 x float> %191, i32 1
  %add.510.4 = fadd float %188, %192
  %subtract.811.4 = fsub float %add.510.4, %120
  %194 = tail call float @llvm.fma.f32(float %subtract.811.4, float 0x3F777313A0000000, float 5.000000e-01)
  %195 = tail call float @llvm.nvvm.saturate.f(float %194) #5
  %196 = tail call float @llvm.nvvm.fma.rm.f(float %195, float 2.520000e+02, float 0x4168000020000000) #5
  %197 = fadd float %196, 0xC168000FE0000000
  %198 = fneg float %197
  %199 = tail call float @llvm.fma.f32(float %subtract.811.4, float 0x3FF7154760000000, float %198)
  %200 = tail call float @llvm.fma.f32(float %subtract.811.4, float 0x3E54AE0C00000000, float %199)
  %201 = bitcast float %196 to i32
  %202 = shl i32 %201, 23
  %203 = bitcast i32 %202 to float
  %204 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %200) #5
  %205 = fmul float %204, %203
  %add.14.i45.4 = fadd float %add.14.i45.3, %205
  %add.510.5 = fadd float %189, %193
  %subtract.811.5 = fsub float %add.510.5, %120
  %206 = tail call float @llvm.fma.f32(float %subtract.811.5, float 0x3F777313A0000000, float 5.000000e-01)
  %207 = tail call float @llvm.nvvm.saturate.f(float %206) #5
  %208 = tail call float @llvm.nvvm.fma.rm.f(float %207, float 2.520000e+02, float 0x4168000020000000) #5
  %209 = fadd float %208, 0xC168000FE0000000
  %210 = fneg float %209
  %211 = tail call float @llvm.fma.f32(float %subtract.811.5, float 0x3FF7154760000000, float %210)
  %212 = tail call float @llvm.fma.f32(float %subtract.811.5, float 0x3E54AE0C00000000, float %211)
  %213 = bitcast float %208 to i32
  %214 = shl i32 %213, 23
  %215 = bitcast i32 %214 to float
  %216 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %212) #5
  %217 = fmul float %216, %215
  %add.14.i45.5 = fadd float %add.14.i45.4, %217
  %218 = mul nuw nsw i32 %.decomposed57, 6
  %219 = zext i32 %8 to i64
  %220 = zext i32 %.decomposed57 to i64
  %221 = getelementptr inbounds [8192 x [15 x float]], ptr addrspace(1) %arg059, i64 0, i64 %219, i64 %220
  %222 = load float, ptr addrspace(1) %221, align 4, !invariant.load !40
  %223 = zext i32 %218 to i64
  %224 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg161, i64 0, i64 %219, i64 %223
  %225 = load <2 x float>, ptr addrspace(1) %224, align 8, !invariant.load !40
  %226 = extractelement <2 x float> %225, i32 0
  %227 = extractelement <2 x float> %225, i32 1
  %228 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg263, i64 0, i64 %223
  %229 = load <2 x float>, ptr addrspace(1) %228, align 8, !invariant.load !40
  %230 = extractelement <2 x float> %229, i32 0
  %231 = extractelement <2 x float> %229, i32 1
  %add.523 = fadd float %226, %230
  %subtract.824 = fsub float %add.523, %222
  %232 = tail call float @llvm.fma.f32(float %subtract.824, float 0x3F777313A0000000, float 5.000000e-01)
  %233 = tail call float @llvm.nvvm.saturate.f(float %232) #5
  %234 = tail call float @llvm.nvvm.fma.rm.f(float %233, float 2.520000e+02, float 0x4168000020000000) #5
  %235 = fadd float %234, 0xC168000FE0000000
  %236 = fneg float %235
  %237 = tail call float @llvm.fma.f32(float %subtract.824, float 0x3FF7154760000000, float %236)
  %238 = tail call float @llvm.fma.f32(float %subtract.824, float 0x3E54AE0C00000000, float %237)
  %239 = bitcast float %234 to i32
  %240 = shl i32 %239, 23
  %241 = bitcast i32 %240 to float
  %242 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %238) #5
  %243 = fmul float %242, %241
  %add.523.1 = fadd float %227, %231
  %subtract.824.1 = fsub float %add.523.1, %222
  %244 = tail call float @llvm.fma.f32(float %subtract.824.1, float 0x3F777313A0000000, float 5.000000e-01)
  %245 = tail call float @llvm.nvvm.saturate.f(float %244) #5
  %246 = tail call float @llvm.nvvm.fma.rm.f(float %245, float 2.520000e+02, float 0x4168000020000000) #5
  %247 = fadd float %246, 0xC168000FE0000000
  %248 = fneg float %247
  %249 = tail call float @llvm.fma.f32(float %subtract.824.1, float 0x3FF7154760000000, float %248)
  %250 = tail call float @llvm.fma.f32(float %subtract.824.1, float 0x3E54AE0C00000000, float %249)
  %251 = bitcast float %246 to i32
  %252 = shl i32 %251, 23
  %253 = bitcast i32 %252 to float
  %254 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %250) #5
  %255 = fmul float %254, %253
  %add.14.i46.1 = fadd float %243, %255
  %256 = getelementptr inbounds float, ptr addrspace(1) %224, i64 2
  %257 = load <2 x float>, ptr addrspace(1) %256, align 8, !invariant.load !40
  %258 = extractelement <2 x float> %257, i32 0
  %259 = extractelement <2 x float> %257, i32 1
  %260 = getelementptr inbounds float, ptr addrspace(1) %228, i64 2
  %261 = load <2 x float>, ptr addrspace(1) %260, align 8, !invariant.load !40
  %262 = extractelement <2 x float> %261, i32 0
  %263 = extractelement <2 x float> %261, i32 1
  %add.523.2 = fadd float %258, %262
  %subtract.824.2 = fsub float %add.523.2, %222
  %264 = tail call float @llvm.fma.f32(float %subtract.824.2, float 0x3F777313A0000000, float 5.000000e-01)
  %265 = tail call float @llvm.nvvm.saturate.f(float %264) #5
  %266 = tail call float @llvm.nvvm.fma.rm.f(float %265, float 2.520000e+02, float 0x4168000020000000) #5
  %267 = fadd float %266, 0xC168000FE0000000
  %268 = fneg float %267
  %269 = tail call float @llvm.fma.f32(float %subtract.824.2, float 0x3FF7154760000000, float %268)
  %270 = tail call float @llvm.fma.f32(float %subtract.824.2, float 0x3E54AE0C00000000, float %269)
  %271 = bitcast float %266 to i32
  %272 = shl i32 %271, 23
  %273 = bitcast i32 %272 to float
  %274 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %270) #5
  %275 = fmul float %274, %273
  %add.14.i46.2 = fadd float %add.14.i46.1, %275
  %add.523.3 = fadd float %259, %263
  %subtract.824.3 = fsub float %add.523.3, %222
  %276 = tail call float @llvm.fma.f32(float %subtract.824.3, float 0x3F777313A0000000, float 5.000000e-01)
  %277 = tail call float @llvm.nvvm.saturate.f(float %276) #5
  %278 = tail call float @llvm.nvvm.fma.rm.f(float %277, float 2.520000e+02, float 0x4168000020000000) #5
  %279 = fadd float %278, 0xC168000FE0000000
  %280 = fneg float %279
  %281 = tail call float @llvm.fma.f32(float %subtract.824.3, float 0x3FF7154760000000, float %280)
  %282 = tail call float @llvm.fma.f32(float %subtract.824.3, float 0x3E54AE0C00000000, float %281)
  %283 = bitcast float %278 to i32
  %284 = shl i32 %283, 23
  %285 = bitcast i32 %284 to float
  %286 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %282) #5
  %287 = fmul float %286, %285
  %add.14.i46.3 = fadd float %add.14.i46.2, %287
  %288 = getelementptr inbounds float, ptr addrspace(1) %224, i64 4
  %289 = load <2 x float>, ptr addrspace(1) %288, align 8, !invariant.load !40
  %290 = extractelement <2 x float> %289, i32 0
  %291 = extractelement <2 x float> %289, i32 1
  %292 = getelementptr inbounds float, ptr addrspace(1) %228, i64 4
  %293 = load <2 x float>, ptr addrspace(1) %292, align 8, !invariant.load !40
  %294 = extractelement <2 x float> %293, i32 0
  %295 = extractelement <2 x float> %293, i32 1
  %add.523.4 = fadd float %290, %294
  %subtract.824.4 = fsub float %add.523.4, %222
  %296 = tail call float @llvm.fma.f32(float %subtract.824.4, float 0x3F777313A0000000, float 5.000000e-01)
  %297 = tail call float @llvm.nvvm.saturate.f(float %296) #5
  %298 = tail call float @llvm.nvvm.fma.rm.f(float %297, float 2.520000e+02, float 0x4168000020000000) #5
  %299 = fadd float %298, 0xC168000FE0000000
  %300 = fneg float %299
  %301 = tail call float @llvm.fma.f32(float %subtract.824.4, float 0x3FF7154760000000, float %300)
  %302 = tail call float @llvm.fma.f32(float %subtract.824.4, float 0x3E54AE0C00000000, float %301)
  %303 = bitcast float %298 to i32
  %304 = shl i32 %303, 23
  %305 = bitcast i32 %304 to float
  %306 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %302) #5
  %307 = fmul float %306, %305
  %add.14.i46.4 = fadd float %add.14.i46.3, %307
  %add.523.5 = fadd float %291, %295
  %subtract.824.5 = fsub float %add.523.5, %222
  %308 = tail call float @llvm.fma.f32(float %subtract.824.5, float 0x3F777313A0000000, float 5.000000e-01)
  %309 = tail call float @llvm.nvvm.saturate.f(float %308) #5
  %310 = tail call float @llvm.nvvm.fma.rm.f(float %309, float 2.520000e+02, float 0x4168000020000000) #5
  %311 = fadd float %310, 0xC168000FE0000000
  %312 = fneg float %311
  %313 = tail call float @llvm.fma.f32(float %subtract.824.5, float 0x3FF7154760000000, float %312)
  %314 = tail call float @llvm.fma.f32(float %subtract.824.5, float 0x3E54AE0C00000000, float %313)
  %315 = bitcast float %310 to i32
  %316 = shl i32 %315, 23
  %317 = bitcast i32 %316 to float
  %318 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %314) #5
  %319 = fmul float %318, %317
  %add.14.i46.5 = fadd float %add.14.i46.4, %319
  %320 = mul nuw nsw i32 %.decomposed58, 6
  %321 = zext i32 %10 to i64
  %322 = zext i32 %.decomposed58 to i64
  %323 = getelementptr inbounds [8192 x [15 x float]], ptr addrspace(1) %arg059, i64 0, i64 %321, i64 %322
  %324 = load float, ptr addrspace(1) %323, align 4, !invariant.load !40
  %325 = zext i32 %320 to i64
  %326 = getelementptr inbounds [8192 x [90 x float]], ptr addrspace(1) %arg161, i64 0, i64 %321, i64 %325
  %327 = load <2 x float>, ptr addrspace(1) %326, align 8, !invariant.load !40
  %328 = extractelement <2 x float> %327, i32 0
  %329 = extractelement <2 x float> %327, i32 1
  %330 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg263, i64 0, i64 %325
  %331 = load <2 x float>, ptr addrspace(1) %330, align 8, !invariant.load !40
  %332 = extractelement <2 x float> %331, i32 0
  %333 = extractelement <2 x float> %331, i32 1
  %add.536 = fadd float %328, %332
  %subtract.837 = fsub float %add.536, %324
  %334 = tail call float @llvm.fma.f32(float %subtract.837, float 0x3F777313A0000000, float 5.000000e-01)
  %335 = tail call float @llvm.nvvm.saturate.f(float %334) #5
  %336 = tail call float @llvm.nvvm.fma.rm.f(float %335, float 2.520000e+02, float 0x4168000020000000) #5
  %337 = fadd float %336, 0xC168000FE0000000
  %338 = fneg float %337
  %339 = tail call float @llvm.fma.f32(float %subtract.837, float 0x3FF7154760000000, float %338)
  %340 = tail call float @llvm.fma.f32(float %subtract.837, float 0x3E54AE0C00000000, float %339)
  %341 = bitcast float %336 to i32
  %342 = shl i32 %341, 23
  %343 = bitcast i32 %342 to float
  %344 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %340) #5
  %345 = fmul float %344, %343
  %add.536.1 = fadd float %329, %333
  %subtract.837.1 = fsub float %add.536.1, %324
  %346 = tail call float @llvm.fma.f32(float %subtract.837.1, float 0x3F777313A0000000, float 5.000000e-01)
  %347 = tail call float @llvm.nvvm.saturate.f(float %346) #5
  %348 = tail call float @llvm.nvvm.fma.rm.f(float %347, float 2.520000e+02, float 0x4168000020000000) #5
  %349 = fadd float %348, 0xC168000FE0000000
  %350 = fneg float %349
  %351 = tail call float @llvm.fma.f32(float %subtract.837.1, float 0x3FF7154760000000, float %350)
  %352 = tail call float @llvm.fma.f32(float %subtract.837.1, float 0x3E54AE0C00000000, float %351)
  %353 = bitcast float %348 to i32
  %354 = shl i32 %353, 23
  %355 = bitcast i32 %354 to float
  %356 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %352) #5
  %357 = fmul float %356, %355
  %add.14.i47.1 = fadd float %345, %357
  %358 = getelementptr inbounds float, ptr addrspace(1) %326, i64 2
  %359 = load <2 x float>, ptr addrspace(1) %358, align 8, !invariant.load !40
  %360 = extractelement <2 x float> %359, i32 0
  %361 = extractelement <2 x float> %359, i32 1
  %362 = getelementptr inbounds float, ptr addrspace(1) %330, i64 2
  %363 = load <2 x float>, ptr addrspace(1) %362, align 8, !invariant.load !40
  %364 = extractelement <2 x float> %363, i32 0
  %365 = extractelement <2 x float> %363, i32 1
  %add.536.2 = fadd float %360, %364
  %subtract.837.2 = fsub float %add.536.2, %324
  %366 = tail call float @llvm.fma.f32(float %subtract.837.2, float 0x3F777313A0000000, float 5.000000e-01)
  %367 = tail call float @llvm.nvvm.saturate.f(float %366) #5
  %368 = tail call float @llvm.nvvm.fma.rm.f(float %367, float 2.520000e+02, float 0x4168000020000000) #5
  %369 = fadd float %368, 0xC168000FE0000000
  %370 = fneg float %369
  %371 = tail call float @llvm.fma.f32(float %subtract.837.2, float 0x3FF7154760000000, float %370)
  %372 = tail call float @llvm.fma.f32(float %subtract.837.2, float 0x3E54AE0C00000000, float %371)
  %373 = bitcast float %368 to i32
  %374 = shl i32 %373, 23
  %375 = bitcast i32 %374 to float
  %376 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %372) #5
  %377 = fmul float %376, %375
  %add.14.i47.2 = fadd float %add.14.i47.1, %377
  %add.536.3 = fadd float %361, %365
  %subtract.837.3 = fsub float %add.536.3, %324
  %378 = tail call float @llvm.fma.f32(float %subtract.837.3, float 0x3F777313A0000000, float 5.000000e-01)
  %379 = tail call float @llvm.nvvm.saturate.f(float %378) #5
  %380 = tail call float @llvm.nvvm.fma.rm.f(float %379, float 2.520000e+02, float 0x4168000020000000) #5
  %381 = fadd float %380, 0xC168000FE0000000
  %382 = fneg float %381
  %383 = tail call float @llvm.fma.f32(float %subtract.837.3, float 0x3FF7154760000000, float %382)
  %384 = tail call float @llvm.fma.f32(float %subtract.837.3, float 0x3E54AE0C00000000, float %383)
  %385 = bitcast float %380 to i32
  %386 = shl i32 %385, 23
  %387 = bitcast i32 %386 to float
  %388 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %384) #5
  %389 = fmul float %388, %387
  %add.14.i47.3 = fadd float %add.14.i47.2, %389
  %390 = getelementptr inbounds float, ptr addrspace(1) %326, i64 4
  %391 = load <2 x float>, ptr addrspace(1) %390, align 8, !invariant.load !40
  %392 = extractelement <2 x float> %391, i32 0
  %393 = extractelement <2 x float> %391, i32 1
  %394 = getelementptr inbounds float, ptr addrspace(1) %330, i64 4
  %395 = load <2 x float>, ptr addrspace(1) %394, align 8, !invariant.load !40
  %396 = extractelement <2 x float> %395, i32 0
  %397 = extractelement <2 x float> %395, i32 1
  %add.536.4 = fadd float %392, %396
  %subtract.837.4 = fsub float %add.536.4, %324
  %398 = tail call float @llvm.fma.f32(float %subtract.837.4, float 0x3F777313A0000000, float 5.000000e-01)
  %399 = tail call float @llvm.nvvm.saturate.f(float %398) #5
  %400 = tail call float @llvm.nvvm.fma.rm.f(float %399, float 2.520000e+02, float 0x4168000020000000) #5
  %401 = fadd float %400, 0xC168000FE0000000
  %402 = fneg float %401
  %403 = tail call float @llvm.fma.f32(float %subtract.837.4, float 0x3FF7154760000000, float %402)
  %404 = tail call float @llvm.fma.f32(float %subtract.837.4, float 0x3E54AE0C00000000, float %403)
  %405 = bitcast float %400 to i32
  %406 = shl i32 %405, 23
  %407 = bitcast i32 %406 to float
  %408 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %404) #5
  %409 = fmul float %408, %407
  %add.14.i47.4 = fadd float %add.14.i47.3, %409
  %add.536.5 = fadd float %393, %397
  %subtract.837.5 = fsub float %add.536.5, %324
  %410 = tail call float @llvm.fma.f32(float %subtract.837.5, float 0x3F777313A0000000, float 5.000000e-01)
  %411 = tail call float @llvm.nvvm.saturate.f(float %410) #5
  %412 = tail call float @llvm.nvvm.fma.rm.f(float %411, float 2.520000e+02, float 0x4168000020000000) #5
  %413 = fadd float %412, 0xC168000FE0000000
  %414 = fneg float %413
  %415 = tail call float @llvm.fma.f32(float %subtract.837.5, float 0x3FF7154760000000, float %414)
  %416 = tail call float @llvm.fma.f32(float %subtract.837.5, float 0x3E54AE0C00000000, float %415)
  %417 = bitcast float %412 to i32
  %418 = shl i32 %417, 23
  %419 = bitcast i32 %418 to float
  %420 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %416) #5
  %421 = fmul float %420, %419
  %add.14.i47.5 = fadd float %add.14.i47.4, %421
  %422 = insertelement <4 x float> poison, float %add.14.i.5, i32 0
  %423 = insertelement <4 x float> %422, float %add.14.i45.5, i32 1
  %424 = insertelement <4 x float> %423, float %add.14.i46.5, i32 2
  %425 = insertelement <4 x float> %424, float %add.14.i47.5, i32 3
  store <4 x float> %425, ptr addrspace(1) %115, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_38(ptr noalias nocapture readonly align 128 dereferenceable(491520) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(491520) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(2949120) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(360) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(2949120) %arg4) local_unnamed_addr #2 {
entry:
  %arg420 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg318 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg216 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg114 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg012 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index3, 6
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = udiv i32 %linear_index2, 6
  %6 = udiv i32 %linear_index_base, 6
  %7 = urem i32 %6, 15
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = urem i32 %linear_index1, 6
  %urem = urem i32 %linear_index_base, 90
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg216, i64 %9
  %11 = load <4 x float>, ptr addrspace(1) %10, align 16, !invariant.load !40
  %12 = extractelement <4 x float> %11, i32 0
  %13 = extractelement <4 x float> %11, i32 1
  %14 = extractelement <4 x float> %11, i32 2
  %15 = extractelement <4 x float> %11, i32 3
  %16 = zext i32 %urem to i64
  %17 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg318, i64 0, i64 %16
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !40
  %add.6 = fadd float %12, %18
  %19 = zext i32 %6 to i64
  %20 = getelementptr inbounds float, ptr addrspace(1) %arg114, i64 %19
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !40
  %subtract.9 = fsub float %add.6, %21
  %22 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3F777313A0000000, float 5.000000e-01)
  %23 = tail call float @llvm.nvvm.saturate.f(float %22) #5
  %24 = tail call float @llvm.nvvm.fma.rm.f(float %23, float 2.520000e+02, float 0x4168000020000000) #5
  %25 = fadd float %24, 0xC168000FE0000000
  %26 = fneg float %25
  %27 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3FF7154760000000, float %26)
  %28 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3E54AE0C00000000, float %27)
  %29 = bitcast float %24 to i32
  %30 = shl i32 %29, 23
  %31 = bitcast i32 %30 to float
  %32 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %28) #5
  %33 = fmul float %32, %31
  %34 = getelementptr inbounds float, ptr addrspace(1) %arg012, i64 %19
  %35 = load float, ptr addrspace(1) %34, align 4, !invariant.load !40
  %divide.12 = fdiv float %33, %35
  %36 = getelementptr float, ptr addrspace(1) %arg420, i64 %9
  %37 = mul nuw nsw i32 %7, 6
  %38 = add nuw nsw i32 %37, %8
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg318, i64 0, i64 %39
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !40
  %add.61 = fadd float %13, %41
  %subtract.92 = fsub float %add.61, %21
  %42 = tail call float @llvm.fma.f32(float %subtract.92, float 0x3F777313A0000000, float 5.000000e-01)
  %43 = tail call float @llvm.nvvm.saturate.f(float %42) #5
  %44 = tail call float @llvm.nvvm.fma.rm.f(float %43, float 2.520000e+02, float 0x4168000020000000) #5
  %45 = fadd float %44, 0xC168000FE0000000
  %46 = fneg float %45
  %47 = tail call float @llvm.fma.f32(float %subtract.92, float 0x3FF7154760000000, float %46)
  %48 = tail call float @llvm.fma.f32(float %subtract.92, float 0x3E54AE0C00000000, float %47)
  %49 = bitcast float %44 to i32
  %50 = shl i32 %49, 23
  %51 = bitcast i32 %50 to float
  %52 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %48) #5
  %53 = fmul float %52, %51
  %divide.123 = fdiv float %53, %35
  %urem10 = urem i32 %linear_index2, 90
  %54 = zext i32 %urem10 to i64
  %55 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg318, i64 0, i64 %54
  %56 = load float, ptr addrspace(1) %55, align 4, !invariant.load !40
  %add.64 = fadd float %14, %56
  %57 = zext i32 %5 to i64
  %58 = getelementptr inbounds float, ptr addrspace(1) %arg114, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4, !invariant.load !40
  %subtract.95 = fsub float %add.64, %59
  %60 = tail call float @llvm.fma.f32(float %subtract.95, float 0x3F777313A0000000, float 5.000000e-01)
  %61 = tail call float @llvm.nvvm.saturate.f(float %60) #5
  %62 = tail call float @llvm.nvvm.fma.rm.f(float %61, float 2.520000e+02, float 0x4168000020000000) #5
  %63 = fadd float %62, 0xC168000FE0000000
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %subtract.95, float 0x3FF7154760000000, float %64)
  %66 = tail call float @llvm.fma.f32(float %subtract.95, float 0x3E54AE0C00000000, float %65)
  %67 = bitcast float %62 to i32
  %68 = shl i32 %67, 23
  %69 = bitcast i32 %68 to float
  %70 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %66) #5
  %71 = fmul float %70, %69
  %72 = getelementptr inbounds float, ptr addrspace(1) %arg012, i64 %57
  %73 = load float, ptr addrspace(1) %72, align 4, !invariant.load !40
  %divide.126 = fdiv float %71, %73
  %urem11 = urem i32 %linear_index3, 90
  %74 = zext i32 %urem11 to i64
  %75 = getelementptr inbounds [90 x float], ptr addrspace(1) %arg318, i64 0, i64 %74
  %76 = load float, ptr addrspace(1) %75, align 4, !invariant.load !40
  %add.67 = fadd float %15, %76
  %77 = zext i32 %4 to i64
  %78 = getelementptr inbounds float, ptr addrspace(1) %arg114, i64 %77
  %79 = load float, ptr addrspace(1) %78, align 4, !invariant.load !40
  %subtract.98 = fsub float %add.67, %79
  %80 = tail call float @llvm.fma.f32(float %subtract.98, float 0x3F777313A0000000, float 5.000000e-01)
  %81 = tail call float @llvm.nvvm.saturate.f(float %80) #5
  %82 = tail call float @llvm.nvvm.fma.rm.f(float %81, float 2.520000e+02, float 0x4168000020000000) #5
  %83 = fadd float %82, 0xC168000FE0000000
  %84 = fneg float %83
  %85 = tail call float @llvm.fma.f32(float %subtract.98, float 0x3FF7154760000000, float %84)
  %86 = tail call float @llvm.fma.f32(float %subtract.98, float 0x3E54AE0C00000000, float %85)
  %87 = bitcast float %82 to i32
  %88 = shl i32 %87, 23
  %89 = bitcast i32 %88 to float
  %90 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %86) #5
  %91 = fmul float %90, %89
  %92 = getelementptr inbounds float, ptr addrspace(1) %arg012, i64 %77
  %93 = load float, ptr addrspace(1) %92, align 4, !invariant.load !40
  %divide.129 = fdiv float %91, %93
  %94 = insertelement <4 x float> poison, float %divide.12, i32 0
  %95 = insertelement <4 x float> %94, float %divide.123, i32 1
  %96 = insertelement <4 x float> %95, float %divide.126, i32 2
  %97 = insertelement <4 x float> %96, float %divide.129, i32 3
  store <4 x float> %97, ptr addrspace(1) %36, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice_12(ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(196608) %arg1) local_unnamed_addr #2 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !49
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !42
  %linear_index = or i32 %1, %2
  %.lhs.trunc = trunc i32 %linear_index to i16
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %3 = udiv i16 %.lhs.trunc.frozen, 6
  %4 = mul i16 %3, 6
  %.decomposed = sub i16 %.lhs.trunc.frozen, %4
  %5 = or i16 %.decomposed, 608
  %6 = zext i16 %3 to i64
  %7 = zext i16 %5 to i64
  %8 = getelementptr inbounds [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %6, i64 %7
  %9 = load float, ptr addrspace(1) %8, align 4, !invariant.load !40
  %10 = zext i32 %linear_index to i64
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg15, i64 %10
  store float %9, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_44(ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(24) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(32768) %arg2) local_unnamed_addr #2 {
entry:
  %arg29 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg17 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg05 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !42
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds [8192 x [6 x float]], ptr addrspace(1) %arg05, i64 0, i64 %3, i64 0
  %5 = load <2 x float>, ptr addrspace(1) %4, align 8, !invariant.load !40
  %6 = extractelement <2 x float> %5, i32 0
  %7 = extractelement <2 x float> %5, i32 1
  %8 = load <4 x float>, ptr addrspace(1) %arg17, align 16, !invariant.load !40
  %9 = extractelement <4 x float> %8, i32 0
  %10 = extractelement <4 x float> %8, i32 1
  %11 = extractelement <4 x float> %8, i32 2
  %12 = extractelement <4 x float> %8, i32 3
  %add.4 = fadd float %6, %9
  %13 = fcmp ole float %add.4, 0xFFF0000000000000
  %maximum.9.i = select i1 %13, float 0xFFF0000000000000, float %add.4
  %add.4.1 = fadd float %7, %10
  %14 = fcmp oge float %maximum.9.i, %add.4.1
  %15 = fcmp uno float %maximum.9.i, 0.000000e+00
  %16 = or i1 %15, %14
  %maximum.9.i.1 = select i1 %16, float %maximum.9.i, float %add.4.1
  %17 = getelementptr inbounds float, ptr addrspace(1) %4, i64 2
  %18 = load <2 x float>, ptr addrspace(1) %17, align 8, !invariant.load !40
  %19 = extractelement <2 x float> %18, i32 0
  %20 = extractelement <2 x float> %18, i32 1
  %add.4.2 = fadd float %19, %11
  %21 = fcmp oge float %maximum.9.i.1, %add.4.2
  %22 = fcmp uno float %maximum.9.i.1, 0.000000e+00
  %23 = or i1 %22, %21
  %maximum.9.i.2 = select i1 %23, float %maximum.9.i.1, float %add.4.2
  %add.4.3 = fadd float %20, %12
  %24 = fcmp oge float %maximum.9.i.2, %add.4.3
  %25 = fcmp uno float %maximum.9.i.2, 0.000000e+00
  %26 = or i1 %25, %24
  %maximum.9.i.3 = select i1 %26, float %maximum.9.i.2, float %add.4.3
  %27 = getelementptr inbounds float, ptr addrspace(1) %4, i64 4
  %28 = load <2 x float>, ptr addrspace(1) %27, align 8, !invariant.load !40
  %29 = extractelement <2 x float> %28, i32 0
  %30 = extractelement <2 x float> %28, i32 1
  %31 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg17, i64 0, i64 4
  %32 = load <2 x float>, ptr addrspace(1) %31, align 16, !invariant.load !40
  %33 = extractelement <2 x float> %32, i32 0
  %34 = extractelement <2 x float> %32, i32 1
  %add.4.4 = fadd float %29, %33
  %35 = fcmp oge float %maximum.9.i.3, %add.4.4
  %36 = fcmp uno float %maximum.9.i.3, 0.000000e+00
  %37 = or i1 %36, %35
  %maximum.9.i.4 = select i1 %37, float %maximum.9.i.3, float %add.4.4
  %add.4.5 = fadd float %30, %34
  %38 = fcmp oge float %maximum.9.i.4, %add.4.5
  %39 = fcmp uno float %maximum.9.i.4, 0.000000e+00
  %40 = or i1 %39, %38
  %maximum.9.i.5 = select i1 %40, float %maximum.9.i.4, float %add.4.5
  %41 = getelementptr inbounds float, ptr addrspace(1) %arg29, i64 %3
  store float %maximum.9.i.5, ptr addrspace(1) %41, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_30(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(24) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(196608) %arg3) local_unnamed_addr #2 {
entry:
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !49
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !42
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %.lhs.trunc = trunc i32 %linear_index to i16
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %3 = udiv i16 %.lhs.trunc.frozen, 6
  %4 = mul i16 %3, 6
  %.decomposed = sub i16 %.lhs.trunc.frozen, %4
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg111, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !40
  %8 = zext i16 %.decomposed to i64
  %9 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg213, i64 0, i64 %8
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !40
  %11 = zext i16 %3 to i64
  %12 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg09, i64 0, i64 %11
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !40
  %14 = getelementptr inbounds [8192 x [6 x float]], ptr addrspace(1) %arg111, i64 0, i64 %11, i64 0
  %15 = load <2 x float>, ptr addrspace(1) %14, align 8, !invariant.load !40
  %16 = extractelement <2 x float> %15, i32 0
  %17 = extractelement <2 x float> %15, i32 1
  %18 = load <4 x float>, ptr addrspace(1) %arg213, align 16, !invariant.load !40
  %19 = extractelement <4 x float> %18, i32 0
  %20 = extractelement <4 x float> %18, i32 1
  %21 = extractelement <4 x float> %18, i32 2
  %22 = extractelement <4 x float> %18, i32 3
  %add.51 = fadd float %16, %19
  %subtract.82 = fsub float %add.51, %13
  %23 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3F777313A0000000, float 5.000000e-01)
  %24 = tail call float @llvm.nvvm.saturate.f(float %23) #5
  %25 = tail call float @llvm.nvvm.fma.rm.f(float %24, float 2.520000e+02, float 0x4168000020000000) #5
  %26 = fadd float %25, 0xC168000FE0000000
  %27 = fneg float %26
  %28 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3FF7154760000000, float %27)
  %29 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3E54AE0C00000000, float %28)
  %30 = bitcast float %25 to i32
  %31 = shl i32 %30, 23
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %29) #5
  %34 = fmul float %33, %32
  %add.51.1 = fadd float %17, %20
  %subtract.82.1 = fsub float %add.51.1, %13
  %35 = tail call float @llvm.fma.f32(float %subtract.82.1, float 0x3F777313A0000000, float 5.000000e-01)
  %36 = tail call float @llvm.nvvm.saturate.f(float %35) #5
  %37 = tail call float @llvm.nvvm.fma.rm.f(float %36, float 2.520000e+02, float 0x4168000020000000) #5
  %38 = fadd float %37, 0xC168000FE0000000
  %39 = fneg float %38
  %40 = tail call float @llvm.fma.f32(float %subtract.82.1, float 0x3FF7154760000000, float %39)
  %41 = tail call float @llvm.fma.f32(float %subtract.82.1, float 0x3E54AE0C00000000, float %40)
  %42 = bitcast float %37 to i32
  %43 = shl i32 %42, 23
  %44 = bitcast i32 %43 to float
  %45 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %41) #5
  %46 = fmul float %45, %44
  %add.15.i.1 = fadd float %34, %46
  %47 = getelementptr inbounds float, ptr addrspace(1) %14, i64 2
  %48 = load <2 x float>, ptr addrspace(1) %47, align 8, !invariant.load !40
  %49 = extractelement <2 x float> %48, i32 0
  %50 = extractelement <2 x float> %48, i32 1
  %add.51.2 = fadd float %49, %21
  %subtract.82.2 = fsub float %add.51.2, %13
  %51 = tail call float @llvm.fma.f32(float %subtract.82.2, float 0x3F777313A0000000, float 5.000000e-01)
  %52 = tail call float @llvm.nvvm.saturate.f(float %51) #5
  %53 = tail call float @llvm.nvvm.fma.rm.f(float %52, float 2.520000e+02, float 0x4168000020000000) #5
  %54 = fadd float %53, 0xC168000FE0000000
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %subtract.82.2, float 0x3FF7154760000000, float %55)
  %57 = tail call float @llvm.fma.f32(float %subtract.82.2, float 0x3E54AE0C00000000, float %56)
  %58 = bitcast float %53 to i32
  %59 = shl i32 %58, 23
  %60 = bitcast i32 %59 to float
  %61 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %57) #5
  %62 = fmul float %61, %60
  %add.15.i.2 = fadd float %add.15.i.1, %62
  %add.51.3 = fadd float %50, %22
  %subtract.82.3 = fsub float %add.51.3, %13
  %63 = tail call float @llvm.fma.f32(float %subtract.82.3, float 0x3F777313A0000000, float 5.000000e-01)
  %64 = tail call float @llvm.nvvm.saturate.f(float %63) #5
  %65 = tail call float @llvm.nvvm.fma.rm.f(float %64, float 2.520000e+02, float 0x4168000020000000) #5
  %66 = fadd float %65, 0xC168000FE0000000
  %67 = fneg float %66
  %68 = tail call float @llvm.fma.f32(float %subtract.82.3, float 0x3FF7154760000000, float %67)
  %69 = tail call float @llvm.fma.f32(float %subtract.82.3, float 0x3E54AE0C00000000, float %68)
  %70 = bitcast float %65 to i32
  %71 = shl i32 %70, 23
  %72 = bitcast i32 %71 to float
  %73 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %69) #5
  %74 = fmul float %73, %72
  %add.15.i.3 = fadd float %add.15.i.2, %74
  %75 = getelementptr inbounds float, ptr addrspace(1) %14, i64 4
  %76 = load <2 x float>, ptr addrspace(1) %75, align 8, !invariant.load !40
  %77 = extractelement <2 x float> %76, i32 0
  %78 = extractelement <2 x float> %76, i32 1
  %79 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg213, i64 0, i64 4
  %80 = load <2 x float>, ptr addrspace(1) %79, align 16, !invariant.load !40
  %81 = extractelement <2 x float> %80, i32 0
  %82 = extractelement <2 x float> %80, i32 1
  %add.51.4 = fadd float %77, %81
  %subtract.82.4 = fsub float %add.51.4, %13
  %83 = tail call float @llvm.fma.f32(float %subtract.82.4, float 0x3F777313A0000000, float 5.000000e-01)
  %84 = tail call float @llvm.nvvm.saturate.f(float %83) #5
  %85 = tail call float @llvm.nvvm.fma.rm.f(float %84, float 2.520000e+02, float 0x4168000020000000) #5
  %86 = fadd float %85, 0xC168000FE0000000
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %subtract.82.4, float 0x3FF7154760000000, float %87)
  %89 = tail call float @llvm.fma.f32(float %subtract.82.4, float 0x3E54AE0C00000000, float %88)
  %90 = bitcast float %85 to i32
  %91 = shl i32 %90, 23
  %92 = bitcast i32 %91 to float
  %93 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %89) #5
  %94 = fmul float %93, %92
  %add.15.i.4 = fadd float %add.15.i.3, %94
  %add.51.5 = fadd float %78, %82
  %subtract.82.5 = fsub float %add.51.5, %13
  %95 = tail call float @llvm.fma.f32(float %subtract.82.5, float 0x3F777313A0000000, float 5.000000e-01)
  %96 = tail call float @llvm.nvvm.saturate.f(float %95) #5
  %97 = tail call float @llvm.nvvm.fma.rm.f(float %96, float 2.520000e+02, float 0x4168000020000000) #5
  %98 = fadd float %97, 0xC168000FE0000000
  %99 = fneg float %98
  %100 = tail call float @llvm.fma.f32(float %subtract.82.5, float 0x3FF7154760000000, float %99)
  %101 = tail call float @llvm.fma.f32(float %subtract.82.5, float 0x3E54AE0C00000000, float %100)
  %102 = bitcast float %97 to i32
  %103 = shl i32 %102, 23
  %104 = bitcast i32 %103 to float
  %105 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %101) #5
  %106 = fmul float %105, %104
  %add.15.i.5 = fadd float %add.15.i.4, %106
  %add.5 = fadd float %7, %10
  %subtract.8 = fsub float %add.5, %13
  %107 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3F777313A0000000, float 5.000000e-01)
  %108 = tail call float @llvm.nvvm.saturate.f(float %107) #5
  %109 = tail call float @llvm.nvvm.fma.rm.f(float %108, float 2.520000e+02, float 0x4168000020000000) #5
  %110 = fadd float %109, 0xC168000FE0000000
  %111 = fneg float %110
  %112 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3FF7154760000000, float %111)
  %113 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3E54AE0C00000000, float %112)
  %114 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %113) #5
  %115 = bitcast float %109 to i32
  %116 = shl i32 %115, 23
  %117 = bitcast i32 %116 to float
  %118 = fmul float %114, %117
  %divide.18 = fdiv float %118, %add.15.i.5
  %119 = getelementptr inbounds float, ptr addrspace(1) %arg315, i64 %5
  store float %divide.18, ptr addrspace(1) %119, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @slice_11(ptr noalias nocapture readonly align 128 dereferenceable(20119552) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(196608) %arg1) local_unnamed_addr #2 {
entry:
  %arg15 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg03 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !49
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !42
  %linear_index = or i32 %1, %2
  %.lhs.trunc = trunc i32 %linear_index to i16
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %3 = udiv i16 %.lhs.trunc.frozen, 6
  %4 = mul i16 %3, 6
  %.decomposed = sub i16 %.lhs.trunc.frozen, %4
  %5 = zext i16 %3 to i64
  %6 = zext i16 %.decomposed to i64
  %7 = getelementptr [8192 x [614 x float]], ptr addrspace(1) %arg03, i64 0, i64 %5, i64 %6
  %8 = getelementptr inbounds float, ptr addrspace(1) %7, i64 602
  %9 = load float, ptr addrspace(1) %8, align 4, !invariant.load !40
  %10 = zext i32 %linear_index to i64
  %11 = getelementptr inbounds float, ptr addrspace(1) %arg15, i64 %10
  store float %9, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_34(ptr noalias nocapture readonly align 128 dereferenceable(32768) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(24) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(196608) %arg3) local_unnamed_addr #2 {
entry:
  %arg315 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg213 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg111 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg09 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !49
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !42
  %2 = shl nuw nsw i32 %0, 10
  %linear_index = or i32 %2, %1
  %.lhs.trunc = trunc i32 %linear_index to i16
  %.lhs.trunc.frozen = freeze i16 %.lhs.trunc
  %3 = udiv i16 %.lhs.trunc.frozen, 6
  %4 = mul i16 %3, 6
  %.decomposed = sub i16 %.lhs.trunc.frozen, %4
  %5 = zext i32 %linear_index to i64
  %6 = getelementptr inbounds float, ptr addrspace(1) %arg111, i64 %5
  %7 = load float, ptr addrspace(1) %6, align 4, !invariant.load !40
  %8 = zext i16 %.decomposed to i64
  %9 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg213, i64 0, i64 %8
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !40
  %11 = zext i16 %3 to i64
  %12 = getelementptr inbounds [8192 x float], ptr addrspace(1) %arg09, i64 0, i64 %11
  %13 = load float, ptr addrspace(1) %12, align 4, !invariant.load !40
  %14 = getelementptr inbounds [8192 x [6 x float]], ptr addrspace(1) %arg111, i64 0, i64 %11, i64 0
  %15 = load <2 x float>, ptr addrspace(1) %14, align 8, !invariant.load !40
  %16 = extractelement <2 x float> %15, i32 0
  %17 = extractelement <2 x float> %15, i32 1
  %18 = load <4 x float>, ptr addrspace(1) %arg213, align 16, !invariant.load !40
  %19 = extractelement <4 x float> %18, i32 0
  %20 = extractelement <4 x float> %18, i32 1
  %21 = extractelement <4 x float> %18, i32 2
  %22 = extractelement <4 x float> %18, i32 3
  %add.51 = fadd float %16, %19
  %subtract.82 = fsub float %add.51, %13
  %23 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3F777313A0000000, float 5.000000e-01)
  %24 = tail call float @llvm.nvvm.saturate.f(float %23) #5
  %25 = tail call float @llvm.nvvm.fma.rm.f(float %24, float 2.520000e+02, float 0x4168000020000000) #5
  %26 = fadd float %25, 0xC168000FE0000000
  %27 = fneg float %26
  %28 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3FF7154760000000, float %27)
  %29 = tail call float @llvm.fma.f32(float %subtract.82, float 0x3E54AE0C00000000, float %28)
  %30 = bitcast float %25 to i32
  %31 = shl i32 %30, 23
  %32 = bitcast i32 %31 to float
  %33 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %29) #5
  %34 = fmul float %33, %32
  %add.51.1 = fadd float %17, %20
  %subtract.82.1 = fsub float %add.51.1, %13
  %35 = tail call float @llvm.fma.f32(float %subtract.82.1, float 0x3F777313A0000000, float 5.000000e-01)
  %36 = tail call float @llvm.nvvm.saturate.f(float %35) #5
  %37 = tail call float @llvm.nvvm.fma.rm.f(float %36, float 2.520000e+02, float 0x4168000020000000) #5
  %38 = fadd float %37, 0xC168000FE0000000
  %39 = fneg float %38
  %40 = tail call float @llvm.fma.f32(float %subtract.82.1, float 0x3FF7154760000000, float %39)
  %41 = tail call float @llvm.fma.f32(float %subtract.82.1, float 0x3E54AE0C00000000, float %40)
  %42 = bitcast float %37 to i32
  %43 = shl i32 %42, 23
  %44 = bitcast i32 %43 to float
  %45 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %41) #5
  %46 = fmul float %45, %44
  %add.15.i.1 = fadd float %34, %46
  %47 = getelementptr inbounds float, ptr addrspace(1) %14, i64 2
  %48 = load <2 x float>, ptr addrspace(1) %47, align 8, !invariant.load !40
  %49 = extractelement <2 x float> %48, i32 0
  %50 = extractelement <2 x float> %48, i32 1
  %add.51.2 = fadd float %49, %21
  %subtract.82.2 = fsub float %add.51.2, %13
  %51 = tail call float @llvm.fma.f32(float %subtract.82.2, float 0x3F777313A0000000, float 5.000000e-01)
  %52 = tail call float @llvm.nvvm.saturate.f(float %51) #5
  %53 = tail call float @llvm.nvvm.fma.rm.f(float %52, float 2.520000e+02, float 0x4168000020000000) #5
  %54 = fadd float %53, 0xC168000FE0000000
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %subtract.82.2, float 0x3FF7154760000000, float %55)
  %57 = tail call float @llvm.fma.f32(float %subtract.82.2, float 0x3E54AE0C00000000, float %56)
  %58 = bitcast float %53 to i32
  %59 = shl i32 %58, 23
  %60 = bitcast i32 %59 to float
  %61 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %57) #5
  %62 = fmul float %61, %60
  %add.15.i.2 = fadd float %add.15.i.1, %62
  %add.51.3 = fadd float %50, %22
  %subtract.82.3 = fsub float %add.51.3, %13
  %63 = tail call float @llvm.fma.f32(float %subtract.82.3, float 0x3F777313A0000000, float 5.000000e-01)
  %64 = tail call float @llvm.nvvm.saturate.f(float %63) #5
  %65 = tail call float @llvm.nvvm.fma.rm.f(float %64, float 2.520000e+02, float 0x4168000020000000) #5
  %66 = fadd float %65, 0xC168000FE0000000
  %67 = fneg float %66
  %68 = tail call float @llvm.fma.f32(float %subtract.82.3, float 0x3FF7154760000000, float %67)
  %69 = tail call float @llvm.fma.f32(float %subtract.82.3, float 0x3E54AE0C00000000, float %68)
  %70 = bitcast float %65 to i32
  %71 = shl i32 %70, 23
  %72 = bitcast i32 %71 to float
  %73 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %69) #5
  %74 = fmul float %73, %72
  %add.15.i.3 = fadd float %add.15.i.2, %74
  %75 = getelementptr inbounds float, ptr addrspace(1) %14, i64 4
  %76 = load <2 x float>, ptr addrspace(1) %75, align 8, !invariant.load !40
  %77 = extractelement <2 x float> %76, i32 0
  %78 = extractelement <2 x float> %76, i32 1
  %79 = getelementptr inbounds [6 x float], ptr addrspace(1) %arg213, i64 0, i64 4
  %80 = load <2 x float>, ptr addrspace(1) %79, align 16, !invariant.load !40
  %81 = extractelement <2 x float> %80, i32 0
  %82 = extractelement <2 x float> %80, i32 1
  %add.51.4 = fadd float %77, %81
  %subtract.82.4 = fsub float %add.51.4, %13
  %83 = tail call float @llvm.fma.f32(float %subtract.82.4, float 0x3F777313A0000000, float 5.000000e-01)
  %84 = tail call float @llvm.nvvm.saturate.f(float %83) #5
  %85 = tail call float @llvm.nvvm.fma.rm.f(float %84, float 2.520000e+02, float 0x4168000020000000) #5
  %86 = fadd float %85, 0xC168000FE0000000
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %subtract.82.4, float 0x3FF7154760000000, float %87)
  %89 = tail call float @llvm.fma.f32(float %subtract.82.4, float 0x3E54AE0C00000000, float %88)
  %90 = bitcast float %85 to i32
  %91 = shl i32 %90, 23
  %92 = bitcast i32 %91 to float
  %93 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %89) #5
  %94 = fmul float %93, %92
  %add.15.i.4 = fadd float %add.15.i.3, %94
  %add.51.5 = fadd float %78, %82
  %subtract.82.5 = fsub float %add.51.5, %13
  %95 = tail call float @llvm.fma.f32(float %subtract.82.5, float 0x3F777313A0000000, float 5.000000e-01)
  %96 = tail call float @llvm.nvvm.saturate.f(float %95) #5
  %97 = tail call float @llvm.nvvm.fma.rm.f(float %96, float 2.520000e+02, float 0x4168000020000000) #5
  %98 = fadd float %97, 0xC168000FE0000000
  %99 = fneg float %98
  %100 = tail call float @llvm.fma.f32(float %subtract.82.5, float 0x3FF7154760000000, float %99)
  %101 = tail call float @llvm.fma.f32(float %subtract.82.5, float 0x3E54AE0C00000000, float %100)
  %102 = bitcast float %97 to i32
  %103 = shl i32 %102, 23
  %104 = bitcast i32 %103 to float
  %105 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %101) #5
  %106 = fmul float %105, %104
  %add.15.i.5 = fadd float %add.15.i.4, %106
  %add.5 = fadd float %7, %10
  %subtract.8 = fsub float %add.5, %13
  %107 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3F777313A0000000, float 5.000000e-01)
  %108 = tail call float @llvm.nvvm.saturate.f(float %107) #5
  %109 = tail call float @llvm.nvvm.fma.rm.f(float %108, float 2.520000e+02, float 0x4168000020000000) #5
  %110 = fadd float %109, 0xC168000FE0000000
  %111 = fneg float %110
  %112 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3FF7154760000000, float %111)
  %113 = tail call float @llvm.fma.f32(float %subtract.8, float 0x3E54AE0C00000000, float %112)
  %114 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %113) #5
  %115 = bitcast float %109 to i32
  %116 = shl i32 %115, 23
  %117 = bitcast i32 %116 to float
  %118 = fmul float %114, %117
  %divide.18 = fdiv float %118, %add.15.i.5
  %119 = getelementptr inbounds float, ptr addrspace(1) %arg315, i64 %5
  store float %divide.18, ptr addrspace(1) %119, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @concatenate_9(ptr noalias nocapture readonly align 128 dereferenceable(2949120) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(196608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(3342336) %arg3) local_unnamed_addr #0 {
entry:
  %arg347 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg245 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg143 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg041 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !51
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %2 = shl nuw nsw i32 %0, 10
  %3 = shl nuw nsw i32 %1, 2
  %linear_index_base = or i32 %2, %3
  %linear_index_base.frozen = freeze i32 %linear_index_base
  %4 = udiv i32 %linear_index_base.frozen, 6
  %5 = mul i32 %4, 6
  %.decomposed = sub i32 %linear_index_base.frozen, %5
  %6 = urem i32 %4, 17
  %7 = udiv i32 %linear_index_base, 102
  %linear_index1 = or i32 %linear_index_base, 1
  %8 = urem i32 %linear_index1, 6
  %linear_index2 = or i32 %linear_index_base, 2
  %linear_index2.frozen = freeze i32 %linear_index2
  %9 = udiv i32 %linear_index2.frozen, 6
  %10 = mul i32 %9, 6
  %.decomposed39 = sub i32 %linear_index2.frozen, %10
  %11 = urem i32 %9, 17
  %12 = udiv i32 %linear_index2, 102
  %linear_index3 = or i32 %linear_index_base, 3
  %linear_index3.frozen = freeze i32 %linear_index3
  %13 = udiv i32 %linear_index3.frozen, 6
  %14 = mul i32 %13, 6
  %.decomposed40 = sub i32 %linear_index3.frozen, %14
  %15 = urem i32 %13, 17
  %16 = udiv i32 %linear_index3, 102
  %17 = icmp ult i32 %6, 15
  %18 = zext i32 %.decomposed to i64
  br i1 %17, label %concatenate.pivot.0., label %concatenate.pivot.16.

concatenate.pivot.0.:                             ; preds = %entry
  %19 = zext i32 %7 to i64
  %20 = zext i32 %6 to i64
  %21 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr addrspace(1) %arg041, i64 0, i64 %19, i64 %20, i64 %18
  br label %concatenate.4.merge

concatenate.pivot.16.:                            ; preds = %entry
  %22 = icmp eq i32 %6, 15
  %23 = zext i32 %7 to i64
  br i1 %22, label %concatenate.pivot.15.1, label %concatenate.pivot.16.2

concatenate.pivot.15.1:                           ; preds = %concatenate.pivot.16.
  %24 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg143, i64 0, i64 %23, i64 0, i64 %18
  br label %concatenate.4.merge

concatenate.pivot.16.2:                           ; preds = %concatenate.pivot.16.
  %25 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %23, i64 0, i64 %18
  br label %concatenate.4.merge

concatenate.4.merge:                              ; preds = %concatenate.pivot.16.2, %concatenate.pivot.15.1, %concatenate.pivot.0.
  %.in = phi ptr addrspace(1) [ %21, %concatenate.pivot.0. ], [ %24, %concatenate.pivot.15.1 ], [ %25, %concatenate.pivot.16.2 ]
  %26 = icmp ult i32 %6, 15
  %27 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !40
  %28 = zext i32 %linear_index_base to i64
  %29 = getelementptr float, ptr addrspace(1) %arg347, i64 %28
  store float %27, ptr addrspace(1) %29, align 16
  %30 = zext i32 %8 to i64
  br i1 %26, label %concatenate.pivot.0.8, label %concatenate.pivot.16.9

concatenate.pivot.0.8:                            ; preds = %concatenate.4.merge
  %31 = zext i32 %7 to i64
  %32 = zext i32 %6 to i64
  %33 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr addrspace(1) %arg041, i64 0, i64 %31, i64 %32, i64 %30
  br label %concatenate.4.merge3

concatenate.pivot.16.9:                           ; preds = %concatenate.4.merge
  %34 = icmp eq i32 %6, 15
  %35 = zext i32 %7 to i64
  br i1 %34, label %concatenate.pivot.15.10, label %concatenate.pivot.16.11

concatenate.pivot.15.10:                          ; preds = %concatenate.pivot.16.9
  %36 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg143, i64 0, i64 %35, i64 0, i64 %30
  br label %concatenate.4.merge3

concatenate.pivot.16.11:                          ; preds = %concatenate.pivot.16.9
  %37 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %35, i64 0, i64 %30
  br label %concatenate.4.merge3

concatenate.4.merge3:                             ; preds = %concatenate.pivot.16.11, %concatenate.pivot.15.10, %concatenate.pivot.0.8
  %.in36 = phi ptr addrspace(1) [ %33, %concatenate.pivot.0.8 ], [ %36, %concatenate.pivot.15.10 ], [ %37, %concatenate.pivot.16.11 ]
  %38 = load float, ptr addrspace(1) %.in36, align 4, !invariant.load !40
  %39 = getelementptr inbounds float, ptr addrspace(1) %29, i64 1
  store float %38, ptr addrspace(1) %39, align 4
  %40 = icmp ult i32 %11, 15
  %41 = zext i32 %.decomposed39 to i64
  br i1 %40, label %concatenate.pivot.0.17, label %concatenate.pivot.16.18

concatenate.pivot.0.17:                           ; preds = %concatenate.4.merge3
  %42 = zext i32 %12 to i64
  %43 = zext i32 %11 to i64
  %44 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr addrspace(1) %arg041, i64 0, i64 %42, i64 %43, i64 %41
  br label %concatenate.4.merge12

concatenate.pivot.16.18:                          ; preds = %concatenate.4.merge3
  %45 = icmp eq i32 %11, 15
  %46 = zext i32 %12 to i64
  br i1 %45, label %concatenate.pivot.15.19, label %concatenate.pivot.16.20

concatenate.pivot.15.19:                          ; preds = %concatenate.pivot.16.18
  %47 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg143, i64 0, i64 %46, i64 0, i64 %41
  br label %concatenate.4.merge12

concatenate.pivot.16.20:                          ; preds = %concatenate.pivot.16.18
  %48 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %46, i64 0, i64 %41
  br label %concatenate.4.merge12

concatenate.4.merge12:                            ; preds = %concatenate.pivot.16.20, %concatenate.pivot.15.19, %concatenate.pivot.0.17
  %.in37 = phi ptr addrspace(1) [ %44, %concatenate.pivot.0.17 ], [ %47, %concatenate.pivot.15.19 ], [ %48, %concatenate.pivot.16.20 ]
  %49 = load float, ptr addrspace(1) %.in37, align 4, !invariant.load !40
  %50 = getelementptr inbounds float, ptr addrspace(1) %29, i64 2
  store float %49, ptr addrspace(1) %50, align 8
  %51 = icmp ult i32 %15, 15
  %52 = zext i32 %.decomposed40 to i64
  br i1 %51, label %concatenate.pivot.0.26, label %concatenate.pivot.16.27

concatenate.pivot.0.26:                           ; preds = %concatenate.4.merge12
  %53 = zext i32 %16 to i64
  %54 = zext i32 %15 to i64
  %55 = getelementptr inbounds [8192 x [15 x [6 x float]]], ptr addrspace(1) %arg041, i64 0, i64 %53, i64 %54, i64 %52
  br label %concatenate.4.merge21

concatenate.pivot.16.27:                          ; preds = %concatenate.4.merge12
  %56 = icmp eq i32 %15, 15
  %57 = zext i32 %16 to i64
  br i1 %56, label %concatenate.pivot.15.28, label %concatenate.pivot.16.29

concatenate.pivot.15.28:                          ; preds = %concatenate.pivot.16.27
  %58 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg143, i64 0, i64 %57, i64 0, i64 %52
  br label %concatenate.4.merge21

concatenate.pivot.16.29:                          ; preds = %concatenate.pivot.16.27
  %59 = getelementptr inbounds [8192 x [1 x [6 x float]]], ptr addrspace(1) %arg245, i64 0, i64 %57, i64 0, i64 %52
  br label %concatenate.4.merge21

concatenate.4.merge21:                            ; preds = %concatenate.pivot.16.29, %concatenate.pivot.15.28, %concatenate.pivot.0.26
  %.in38 = phi ptr addrspace(1) [ %55, %concatenate.pivot.0.26 ], [ %58, %concatenate.pivot.15.28 ], [ %59, %concatenate.pivot.16.29 ]
  %60 = load float, ptr addrspace(1) %.in38, align 4, !invariant.load !40
  %61 = getelementptr inbounds float, ptr addrspace(1) %29, i64 3
  store float %60, ptr addrspace(1) %61, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_16(ptr noalias readonly align 128 dereferenceable(142606336) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg5, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg6, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg7, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg8, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg9, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg10, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg11, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg12, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg13, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg14, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg15, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg16, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg17) local_unnamed_addr #2 {
entry:
  %arg1740 = addrspacecast ptr %arg17 to ptr addrspace(1)
  %arg1638 = addrspacecast ptr %arg16 to ptr addrspace(1)
  %arg1536 = addrspacecast ptr %arg15 to ptr addrspace(1)
  %arg1434 = addrspacecast ptr %arg14 to ptr addrspace(1)
  %arg1332 = addrspacecast ptr %arg13 to ptr addrspace(1)
  %arg1230 = addrspacecast ptr %arg12 to ptr addrspace(1)
  %arg1128 = addrspacecast ptr %arg11 to ptr addrspace(1)
  %arg1026 = addrspacecast ptr %arg10 to ptr addrspace(1)
  %arg924 = addrspacecast ptr %arg9 to ptr addrspace(1)
  %arg822 = addrspacecast ptr %arg8 to ptr addrspace(1)
  %arg720 = addrspacecast ptr %arg7 to ptr addrspace(1)
  %arg618 = addrspacecast ptr %arg6 to ptr addrspace(1)
  %arg516 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg414 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg312 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg210 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg18 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
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
  %11 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 0, i64 %10
  %12 = load <2 x float>, ptr addrspace(1) %11, align 16, !invariant.load !40
  %13 = extractelement <2 x float> %12, i32 0
  %14 = extractelement <2 x float> %12, i32 1
  %15 = getelementptr inbounds float, ptr addrspace(1) %11, i64 256
  %16 = load <2 x float>, ptr addrspace(1) %15, align 16, !invariant.load !40
  %17 = extractelement <2 x float> %16, i32 0
  %18 = extractelement <2 x float> %16, i32 1
  %19 = getelementptr inbounds float, ptr addrspace(1) %11, i64 512
  %20 = load <2 x float>, ptr addrspace(1) %19, align 16, !invariant.load !40
  %21 = extractelement <2 x float> %20, i32 0
  %22 = extractelement <2 x float> %20, i32 1
  %23 = getelementptr inbounds float, ptr addrspace(1) %11, i64 768
  %24 = load <2 x float>, ptr addrspace(1) %23, align 16, !invariant.load !40
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %27 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1024
  %28 = load <2 x float>, ptr addrspace(1) %27, align 16, !invariant.load !40
  %29 = extractelement <2 x float> %28, i32 0
  %30 = extractelement <2 x float> %28, i32 1
  %31 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1280
  %32 = load <2 x float>, ptr addrspace(1) %31, align 16, !invariant.load !40
  %33 = extractelement <2 x float> %32, i32 0
  %34 = extractelement <2 x float> %32, i32 1
  %35 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1536
  %36 = load <2 x float>, ptr addrspace(1) %35, align 16, !invariant.load !40
  %37 = extractelement <2 x float> %36, i32 0
  %38 = extractelement <2 x float> %36, i32 1
  %39 = getelementptr inbounds float, ptr addrspace(1) %11, i64 1792
  %40 = load <2 x float>, ptr addrspace(1) %39, align 16, !invariant.load !40
  %41 = extractelement <2 x float> %40, i32 0
  %42 = extractelement <2 x float> %40, i32 1
  %43 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2048
  %44 = load <2 x float>, ptr addrspace(1) %43, align 16, !invariant.load !40
  %45 = extractelement <2 x float> %44, i32 0
  %46 = extractelement <2 x float> %44, i32 1
  %47 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2304
  %48 = load <2 x float>, ptr addrspace(1) %47, align 16, !invariant.load !40
  %49 = extractelement <2 x float> %48, i32 0
  %50 = extractelement <2 x float> %48, i32 1
  %51 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2560
  %52 = load <2 x float>, ptr addrspace(1) %51, align 16, !invariant.load !40
  %53 = extractelement <2 x float> %52, i32 0
  %54 = extractelement <2 x float> %52, i32 1
  %55 = getelementptr inbounds float, ptr addrspace(1) %11, i64 2816
  %56 = load <2 x float>, ptr addrspace(1) %55, align 16, !invariant.load !40
  %57 = extractelement <2 x float> %56, i32 0
  %58 = extractelement <2 x float> %56, i32 1
  %59 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3072
  %60 = load <2 x float>, ptr addrspace(1) %59, align 16, !invariant.load !40
  %61 = extractelement <2 x float> %60, i32 0
  %62 = extractelement <2 x float> %60, i32 1
  %63 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3328
  %64 = load <2 x float>, ptr addrspace(1) %63, align 16, !invariant.load !40
  %65 = extractelement <2 x float> %64, i32 0
  %66 = extractelement <2 x float> %64, i32 1
  %67 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3584
  %68 = load <2 x float>, ptr addrspace(1) %67, align 16, !invariant.load !40
  %69 = extractelement <2 x float> %68, i32 0
  %70 = extractelement <2 x float> %68, i32 1
  %71 = getelementptr inbounds float, ptr addrspace(1) %11, i64 3840
  %72 = load <2 x float>, ptr addrspace(1) %71, align 16, !invariant.load !40
  %73 = extractelement <2 x float> %72, i32 0
  %74 = extractelement <2 x float> %72, i32 1
  %75 = getelementptr inbounds float, ptr addrspace(1) %11, i64 4096
  %76 = load <2 x float>, ptr addrspace(1) %75, align 16, !invariant.load !40
  %77 = extractelement <2 x float> %76, i32 0
  %78 = extractelement <2 x float> %76, i32 1
  %79 = zext i32 %linear_index_base to i64
  %80 = getelementptr float, ptr addrspace(1) %arg18, i64 %79
  %81 = getelementptr float, ptr addrspace(1) %arg210, i64 %79
  %82 = getelementptr float, ptr addrspace(1) %arg312, i64 %79
  %83 = getelementptr float, ptr addrspace(1) %arg414, i64 %79
  %84 = getelementptr float, ptr addrspace(1) %arg516, i64 %79
  %85 = getelementptr float, ptr addrspace(1) %arg618, i64 %79
  %86 = getelementptr float, ptr addrspace(1) %arg720, i64 %79
  %87 = getelementptr float, ptr addrspace(1) %arg822, i64 %79
  %88 = getelementptr float, ptr addrspace(1) %arg924, i64 %79
  %89 = getelementptr float, ptr addrspace(1) %arg1026, i64 %79
  %90 = getelementptr float, ptr addrspace(1) %arg1128, i64 %79
  %91 = getelementptr float, ptr addrspace(1) %arg1230, i64 %79
  %92 = getelementptr float, ptr addrspace(1) %arg1332, i64 %79
  %93 = getelementptr float, ptr addrspace(1) %arg1434, i64 %79
  %94 = getelementptr float, ptr addrspace(1) %arg1536, i64 %79
  %95 = getelementptr float, ptr addrspace(1) %arg1638, i64 %79
  %96 = getelementptr float, ptr addrspace(1) %arg1740, i64 %79
  %97 = zext i32 %7 to i64
  %98 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 0, i64 %97
  %99 = zext i32 %6 to i64
  %100 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 0, i64 %99
  %101 = load float, ptr addrspace(1) %100, align 8, !invariant.load !40
  %102 = getelementptr inbounds float, ptr addrspace(1) %100, i64 256
  %103 = load float, ptr addrspace(1) %102, align 8, !invariant.load !40
  %104 = getelementptr inbounds float, ptr addrspace(1) %100, i64 512
  %105 = load float, ptr addrspace(1) %104, align 8, !invariant.load !40
  %106 = getelementptr inbounds float, ptr addrspace(1) %100, i64 768
  %107 = load float, ptr addrspace(1) %106, align 8, !invariant.load !40
  %108 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1024
  %109 = load float, ptr addrspace(1) %108, align 8, !invariant.load !40
  %110 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1280
  %111 = load float, ptr addrspace(1) %110, align 8, !invariant.load !40
  %112 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1536
  %113 = load float, ptr addrspace(1) %112, align 8, !invariant.load !40
  %114 = getelementptr inbounds float, ptr addrspace(1) %100, i64 1792
  %115 = load float, ptr addrspace(1) %114, align 8, !invariant.load !40
  %116 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2048
  %117 = load float, ptr addrspace(1) %116, align 8, !invariant.load !40
  %118 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2304
  %119 = load float, ptr addrspace(1) %118, align 8, !invariant.load !40
  %120 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2560
  %121 = load float, ptr addrspace(1) %120, align 8, !invariant.load !40
  %122 = getelementptr inbounds float, ptr addrspace(1) %100, i64 2816
  %123 = load float, ptr addrspace(1) %122, align 8, !invariant.load !40
  %124 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3072
  %125 = load float, ptr addrspace(1) %124, align 8, !invariant.load !40
  %126 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3328
  %127 = load float, ptr addrspace(1) %126, align 8, !invariant.load !40
  %128 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3584
  %129 = load float, ptr addrspace(1) %128, align 8, !invariant.load !40
  %130 = getelementptr inbounds float, ptr addrspace(1) %100, i64 3840
  %131 = load float, ptr addrspace(1) %130, align 8, !invariant.load !40
  %132 = getelementptr inbounds float, ptr addrspace(1) %100, i64 4096
  %133 = load float, ptr addrspace(1) %132, align 8, !invariant.load !40
  %134 = zext i32 %5 to i64
  %135 = getelementptr inbounds [8192 x [17 x [256 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %9, i64 0, i64 %134
  %136 = load float, ptr addrspace(1) %135, align 4, !invariant.load !40
  %137 = getelementptr inbounds float, ptr addrspace(1) %135, i64 256
  %138 = load float, ptr addrspace(1) %137, align 4, !invariant.load !40
  %139 = getelementptr inbounds float, ptr addrspace(1) %135, i64 512
  %140 = load float, ptr addrspace(1) %139, align 4, !invariant.load !40
  %141 = getelementptr inbounds float, ptr addrspace(1) %135, i64 768
  %142 = load float, ptr addrspace(1) %141, align 4, !invariant.load !40
  %143 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1024
  %144 = load float, ptr addrspace(1) %143, align 4, !invariant.load !40
  %145 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1280
  %146 = load float, ptr addrspace(1) %145, align 4, !invariant.load !40
  %147 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1536
  %148 = load float, ptr addrspace(1) %147, align 4, !invariant.load !40
  %149 = getelementptr inbounds float, ptr addrspace(1) %135, i64 1792
  %150 = load float, ptr addrspace(1) %149, align 4, !invariant.load !40
  %151 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2048
  %152 = load float, ptr addrspace(1) %151, align 4, !invariant.load !40
  %153 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2304
  %154 = load float, ptr addrspace(1) %153, align 4, !invariant.load !40
  %155 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2560
  %156 = load float, ptr addrspace(1) %155, align 4, !invariant.load !40
  %157 = getelementptr inbounds float, ptr addrspace(1) %135, i64 2816
  %158 = load float, ptr addrspace(1) %157, align 4, !invariant.load !40
  %159 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3072
  %160 = load float, ptr addrspace(1) %159, align 4, !invariant.load !40
  %161 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3328
  %162 = load float, ptr addrspace(1) %161, align 4, !invariant.load !40
  %163 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3584
  %164 = load float, ptr addrspace(1) %163, align 4, !invariant.load !40
  %165 = getelementptr inbounds float, ptr addrspace(1) %135, i64 3840
  %166 = load float, ptr addrspace(1) %165, align 4, !invariant.load !40
  %167 = getelementptr inbounds float, ptr addrspace(1) %135, i64 4096
  %168 = load float, ptr addrspace(1) %167, align 4, !invariant.load !40
  %169 = insertelement <4 x float> poison, float %13, i32 0
  %170 = insertelement <4 x float> %169, float %14, i32 1
  %171 = insertelement <4 x float> %170, float %101, i32 2
  %172 = insertelement <4 x float> %171, float %136, i32 3
  store <4 x float> %172, ptr addrspace(1) %80, align 16
  %173 = insertelement <4 x float> poison, float %17, i32 0
  %174 = insertelement <4 x float> %173, float %18, i32 1
  %175 = insertelement <4 x float> %174, float %103, i32 2
  %176 = insertelement <4 x float> %175, float %138, i32 3
  store <4 x float> %176, ptr addrspace(1) %81, align 16
  %177 = insertelement <4 x float> poison, float %21, i32 0
  %178 = insertelement <4 x float> %177, float %22, i32 1
  %179 = insertelement <4 x float> %178, float %105, i32 2
  %180 = insertelement <4 x float> %179, float %140, i32 3
  store <4 x float> %180, ptr addrspace(1) %82, align 16
  %181 = insertelement <4 x float> poison, float %25, i32 0
  %182 = insertelement <4 x float> %181, float %26, i32 1
  %183 = insertelement <4 x float> %182, float %107, i32 2
  %184 = insertelement <4 x float> %183, float %142, i32 3
  store <4 x float> %184, ptr addrspace(1) %83, align 16
  %185 = insertelement <4 x float> poison, float %29, i32 0
  %186 = insertelement <4 x float> %185, float %30, i32 1
  %187 = insertelement <4 x float> %186, float %109, i32 2
  %188 = insertelement <4 x float> %187, float %144, i32 3
  store <4 x float> %188, ptr addrspace(1) %84, align 16
  %189 = insertelement <4 x float> poison, float %33, i32 0
  %190 = insertelement <4 x float> %189, float %34, i32 1
  %191 = insertelement <4 x float> %190, float %111, i32 2
  %192 = insertelement <4 x float> %191, float %146, i32 3
  store <4 x float> %192, ptr addrspace(1) %85, align 16
  %193 = insertelement <4 x float> poison, float %37, i32 0
  %194 = insertelement <4 x float> %193, float %38, i32 1
  %195 = insertelement <4 x float> %194, float %113, i32 2
  %196 = insertelement <4 x float> %195, float %148, i32 3
  store <4 x float> %196, ptr addrspace(1) %86, align 16
  %197 = insertelement <4 x float> poison, float %41, i32 0
  %198 = insertelement <4 x float> %197, float %42, i32 1
  %199 = insertelement <4 x float> %198, float %115, i32 2
  %200 = insertelement <4 x float> %199, float %150, i32 3
  store <4 x float> %200, ptr addrspace(1) %87, align 16
  %201 = insertelement <4 x float> poison, float %45, i32 0
  %202 = insertelement <4 x float> %201, float %46, i32 1
  %203 = insertelement <4 x float> %202, float %117, i32 2
  %204 = insertelement <4 x float> %203, float %152, i32 3
  store <4 x float> %204, ptr addrspace(1) %88, align 16
  %205 = insertelement <4 x float> poison, float %49, i32 0
  %206 = insertelement <4 x float> %205, float %50, i32 1
  %207 = insertelement <4 x float> %206, float %119, i32 2
  %208 = insertelement <4 x float> %207, float %154, i32 3
  store <4 x float> %208, ptr addrspace(1) %89, align 16
  %209 = insertelement <4 x float> poison, float %53, i32 0
  %210 = insertelement <4 x float> %209, float %54, i32 1
  %211 = insertelement <4 x float> %210, float %121, i32 2
  %212 = insertelement <4 x float> %211, float %156, i32 3
  store <4 x float> %212, ptr addrspace(1) %90, align 16
  %213 = insertelement <4 x float> poison, float %57, i32 0
  %214 = insertelement <4 x float> %213, float %58, i32 1
  %215 = insertelement <4 x float> %214, float %123, i32 2
  %216 = insertelement <4 x float> %215, float %158, i32 3
  store <4 x float> %216, ptr addrspace(1) %91, align 16
  %217 = insertelement <4 x float> poison, float %61, i32 0
  %218 = insertelement <4 x float> %217, float %62, i32 1
  %219 = insertelement <4 x float> %218, float %125, i32 2
  %220 = insertelement <4 x float> %219, float %160, i32 3
  store <4 x float> %220, ptr addrspace(1) %92, align 16
  %221 = insertelement <4 x float> poison, float %65, i32 0
  %222 = insertelement <4 x float> %221, float %66, i32 1
  %223 = insertelement <4 x float> %222, float %127, i32 2
  %224 = insertelement <4 x float> %223, float %162, i32 3
  store <4 x float> %224, ptr addrspace(1) %93, align 16
  %225 = insertelement <4 x float> poison, float %69, i32 0
  %226 = insertelement <4 x float> %225, float %70, i32 1
  %227 = insertelement <4 x float> %226, float %129, i32 2
  %228 = insertelement <4 x float> %227, float %164, i32 3
  store <4 x float> %228, ptr addrspace(1) %94, align 16
  %229 = insertelement <4 x float> poison, float %73, i32 0
  %230 = insertelement <4 x float> %229, float %74, i32 1
  %231 = insertelement <4 x float> %230, float %131, i32 2
  %232 = insertelement <4 x float> %231, float %166, i32 3
  store <4 x float> %232, ptr addrspace(1) %95, align 16
  %233 = insertelement <4 x float> poison, float %77, i32 0
  %234 = insertelement <4 x float> %233, float %78, i32 1
  %235 = insertelement <4 x float> %234, float %133, i32 2
  %236 = insertelement <4 x float> %235, float %168, i32 3
  store <4 x float> %236, ptr addrspace(1) %96, align 16
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.saturate.f(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.nvvm.fma.rm.f(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.ex2.approx.ftz.f(float) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #4

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35}
!llvm.ident = !{!36}
!llvm.module.flags = !{!37}

!0 = !{ptr @concatenate_11, !"kernel", i32 1}
!1 = !{ptr @concatenate_11, !"reqntidx", i32 256}
!2 = !{ptr @concatenate_7, !"kernel", i32 1}
!3 = !{ptr @concatenate_7, !"reqntidx", i32 1024}
!4 = !{ptr @fusion_29, !"kernel", i32 1}
!5 = !{ptr @fusion_29, !"reqntidx", i32 256}
!6 = !{ptr @fusion_27, !"kernel", i32 1}
!7 = !{ptr @fusion_27, !"reqntidx", i32 256}
!8 = !{ptr @fusion_45, !"kernel", i32 1}
!9 = !{ptr @fusion_45, !"reqntidx", i32 256}
!10 = !{ptr @fusion_17, !"kernel", i32 1}
!11 = !{ptr @fusion_17, !"reqntidx", i32 256}
!12 = !{ptr @concatenate_8, !"kernel", i32 1}
!13 = !{ptr @concatenate_8, !"reqntidx", i32 256}
!14 = !{ptr @slice_10, !"kernel", i32 1}
!15 = !{ptr @slice_10, !"reqntidx", i32 256}
!16 = !{ptr @fusion_41, !"kernel", i32 1}
!17 = !{ptr @fusion_41, !"reqntidx", i32 256}
!18 = !{ptr @fusion_42, !"kernel", i32 1}
!19 = !{ptr @fusion_42, !"reqntidx", i32 256}
!20 = !{ptr @fusion_38, !"kernel", i32 1}
!21 = !{ptr @fusion_38, !"reqntidx", i32 256}
!22 = !{ptr @slice_12, !"kernel", i32 1}
!23 = !{ptr @slice_12, !"reqntidx", i32 1024}
!24 = !{ptr @fusion_44, !"kernel", i32 1}
!25 = !{ptr @fusion_44, !"reqntidx", i32 1024}
!26 = !{ptr @fusion_30, !"kernel", i32 1}
!27 = !{ptr @fusion_30, !"reqntidx", i32 1024}
!28 = !{ptr @slice_11, !"kernel", i32 1}
!29 = !{ptr @slice_11, !"reqntidx", i32 1024}
!30 = !{ptr @fusion_34, !"kernel", i32 1}
!31 = !{ptr @fusion_34, !"reqntidx", i32 1024}
!32 = !{ptr @concatenate_9, !"kernel", i32 1}
!33 = !{ptr @concatenate_9, !"reqntidx", i32 256}
!34 = !{ptr @fusion_16, !"kernel", i32 1}
!35 = !{ptr @fusion_16, !"reqntidx", i32 256}
!36 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!37 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!38 = !{i32 0, i32 11840}
!39 = !{i32 0, i32 256}
!40 = !{}
!41 = !{i32 0, i32 77}
!42 = !{i32 0, i32 1024}
!43 = !{i32 0, i32 4096}
!44 = !{i32 0, i32 2048}
!45 = !{i32 0, i32 12288}
!46 = !{i32 0, i32 11968}
!47 = !{i32 0, i32 720}
!48 = !{i32 0, i32 120}
!49 = !{i32 0, i32 48}
!50 = !{i32 0, i32 8}
!51 = !{i32 0, i32 816}
