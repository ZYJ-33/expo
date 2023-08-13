target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@buffer_for_constant_3 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_8(ptr noalias nocapture readonly align 16 dereferenceable(104857600) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(104857600) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(249036800) %arg5) local_unnamed_addr #0 {
entry:
  %arg576 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg474 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg372 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg270 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg066 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
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
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !18
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
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !18
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
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !18
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
  %88 = load float, ptr addrspace(1) %87, align 4, !invariant.load !18
  %89 = getelementptr inbounds float, ptr addrspace(1) %29, i64 3
  store float %88, ptr addrspace(1) %89, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_9(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1) local_unnamed_addr #2 {
entry:
  %arg171 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg069 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !19
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
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
  %18 = load float, ptr addrspace(1) %17, align 4, !invariant.load !18
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
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !18
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
  %37 = load float, ptr addrspace(1) %36, align 4, !invariant.load !18
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
  %45 = load float, ptr addrspace(1) %44, align 4, !invariant.load !18
  %46 = getelementptr inbounds float, ptr addrspace(1) %20, i64 3
  store float %45, ptr addrspace(1) %46, align 4
  ret void
}

; Function Attrs: nounwind
define void @fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(419430400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(419430400) %arg3) local_unnamed_addr #3 {
entry:
  %arg391 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg289 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg187 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg085 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 1638400
  br i1 %6, label %tile_loop.loop_header15.preheader, label %common.ret

tile_loop.loop_header15.preheader:                ; preds = %entry
  %7 = shl nuw nsw i32 %5, 6
  %8 = or i32 %2, %7
  %9 = udiv i32 %5, 50
  %10 = and i32 %9, 8191
  %11 = udiv i32 %5, 409600
  %12 = zext i32 %11 to i64
  %13 = zext i32 %10 to i64
  %14 = zext i32 %2 to i64
  %Arg_0.121 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg085, i64 0, i64 %12, i64 %13, i64 0, i64 %14
  %Arg_0.122 = load float, ptr addrspace(1) %Arg_0.121, align 4, !invariant.load !18
  %15 = icmp ult i32 %8, 52428800
  br i1 %15, label %concatenate.pivot.1.37, label %concatenate.pivot.3.40

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %concatenate.14.merge23.1
  %16 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %16, label %reduction_write_output-true, label %common.ret

concatenate.pivot.3.40.1:                         ; preds = %concatenate.14.merge23
  %17 = icmp ult i32 %51, 78643200
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
  %22 = icmp ult i32 %51, 26214400
  %23 = or i32 %0, 96
  %24 = zext i32 %23 to i64
  br i1 %22, label %concatenate.14.merge23.1, label %concatenate.pivot.1.39.1

concatenate.pivot.1.39.1:                         ; preds = %concatenate.pivot.1.37.1
  br label %concatenate.14.merge23.1

concatenate.14.merge23.1:                         ; preds = %concatenate.pivot.1.37.1, %concatenate.pivot.1.39.1, %concatenate.pivot.2.41.1, %concatenate.pivot.3.42.1
  %.sink81 = phi i64 [ %24, %concatenate.pivot.1.39.1 ], [ %21, %concatenate.pivot.2.41.1 ], [ %19, %concatenate.pivot.3.42.1 ], [ %52, %concatenate.pivot.1.37.1 ]
  %.sink.in = urem i32 %5, 409600
  %.sink = zext i32 %.sink.in to i64
  %Arg_1.225.1 = getelementptr inbounds [409600 x [256 x float]], ptr addrspace(1) %arg187, i64 0, i64 %.sink, i64 %.sink81
  %25 = load float, ptr addrspace(1) %Arg_1.225.1, align 4, !invariant.load !18
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
  %38 = icmp ult i32 %8, 26214400
  %39 = or i32 %2, 64
  %40 = zext i32 %39 to i64
  br i1 %38, label %concatenate.14.merge23, label %concatenate.pivot.1.39

concatenate.pivot.1.39:                           ; preds = %concatenate.pivot.1.37
  br label %concatenate.14.merge23

concatenate.pivot.3.40:                           ; preds = %tile_loop.loop_header15.preheader
  %41 = icmp ult i32 %8, 78643200
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
  %46 = udiv i32 %.frozen, 409600
  %47 = mul i32 %46, 409600
  %.sink82.in.decomposed = sub i32 %.frozen, %47
  %.sink82 = zext i32 %.sink82.in.decomposed to i64
  %Arg_1.234 = getelementptr inbounds [409600 x [256 x float]], ptr addrspace(1) %arg187, i64 0, i64 %.sink82, i64 %.sink83
  %48 = load float, ptr addrspace(1) %Arg_1.234, align 4, !invariant.load !18
  %multiply.1543 = fmul float %Arg_0.122, %48
  %add.20.i71 = fadd float %multiply.1543, 0.000000e+00
  %49 = zext i32 %8 to i64
  %50 = getelementptr inbounds float, ptr addrspace(1) %arg391, i64 %49
  store float %48, ptr addrspace(1) %50, align 4
  %x_loc20.1 = or i32 %2, 32
  %51 = or i32 %x_loc20.1, %7
  %52 = zext i32 %x_loc20.1 to i64
  %Arg_0.121.195 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.121, i64 32
  %Arg_0.122.1 = load float, ptr addrspace(1) %Arg_0.121.195, align 4, !invariant.load !18
  %53 = icmp ult i32 %51, 52428800
  br i1 %53, label %concatenate.pivot.1.37.1, label %concatenate.pivot.3.40.1

intra_warp_reduce_write-true:                     ; preds = %concatenate.14.merge23.1
  store float %add.20.i70, ptr addrspace(3) %37, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %54 = udiv i32 %.frozen, 50
  %55 = mul i32 %54, 50
  %.decomposed = sub i32 %.frozen, %55
  %56 = and i32 %54, 8191
  %57 = zext i32 %46 to i64
  %58 = zext i32 %56 to i64
  %59 = zext i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg289, i64 0, i64 %57, i64 %58, i64 %59
  %output.then.val = load float, ptr addrspace(3) %37, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #4

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #5

; Function Attrs: nounwind
define void @fusion_10(ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg1) local_unnamed_addr #3 {
entry:
  %arg144 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg042 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header5.preheader, label %common.ret

tile_loop.loop_header5.preheader:                 ; preds = %entry
  %7 = mul nuw nsw i32 %5, 50
  %8 = add nuw nsw i32 %2, %7
  %9 = zext i32 %8 to i64
  %Arg_0.112 = getelementptr inbounds float, ptr addrspace(1) %arg042, i64 %9
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !18
  %multiply.414 = fmul float %Arg_0.113, 1.250000e-01
  %10 = fcmp ole float %multiply.414, 0xFFF0000000000000
  %maximum.9.i39 = select i1 %10, float 0xFFF0000000000000, float %multiply.414
  %x_loc10.1 = or i32 %2, 32
  %11 = icmp ult i32 %x_loc10.1, 50
  br i1 %11, label %x_in_tile-true.1, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %12 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %13 = lshr i32 %5, 13
  %14 = zext i32 %13 to i64
  %15 = and i32 %5, 8191
  %16 = zext i32 %15 to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr addrspace(1) %arg144, i64 0, i64 %14, i64 %16
  br i1 %12, label %reduction_write_output-true, label %common.ret

x_in_tile-true.1:                                 ; preds = %tile_loop.loop_header5.preheader
  %17 = zext i32 %7 to i64
  %18 = zext i32 %2 to i64
  %19 = add i64 %18, %17
  %20 = getelementptr float, ptr addrspace(1) %arg042, i64 %19
  %Arg_0.112.147 = getelementptr inbounds float, ptr addrspace(1) %20, i64 32
  %Arg_0.113.1 = load float, ptr addrspace(1) %Arg_0.112.147, align 4, !invariant.load !18
  %multiply.414.1 = fmul float %Arg_0.113.1, 1.250000e-01
  %21 = fcmp oge float %maximum.9.i39, %multiply.414.1
  %22 = fcmp uno float %maximum.9.i39, 0.000000e+00
  %23 = or i1 %22, %21
  %maximum.9.i39.1 = select i1 %23, float %maximum.9.i39, float %multiply.414.1
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.1, %tile_loop.loop_header5.preheader
  %partial_reduction_result.1.1 = phi float [ %maximum.9.i39.1, %x_in_tile-true.1 ], [ %maximum.9.i39, %tile_loop.loop_header5.preheader ]
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.1, i32 16, i32 31)
  %25 = fcmp oge float %partial_reduction_result.1.1, %24
  %26 = fcmp uno float %partial_reduction_result.1.1, 0.000000e+00
  %27 = or i1 %26, %25
  %maximum.9.i = select i1 %27, float %partial_reduction_result.1.1, float %24
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.9.i, i32 8, i32 31)
  %29 = fcmp oge float %maximum.9.i, %28
  %30 = fcmp uno float %maximum.9.i, 0.000000e+00
  %31 = or i1 %30, %29
  %maximum.9.i35 = select i1 %31, float %maximum.9.i, float %28
  %32 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.9.i35, i32 4, i32 31)
  %33 = fcmp oge float %maximum.9.i35, %32
  %34 = fcmp uno float %maximum.9.i35, 0.000000e+00
  %35 = or i1 %34, %33
  %maximum.9.i36 = select i1 %35, float %maximum.9.i35, float %32
  %36 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.9.i36, i32 2, i32 31)
  %37 = fcmp oge float %maximum.9.i36, %36
  %38 = fcmp uno float %maximum.9.i36, 0.000000e+00
  %39 = or i1 %38, %37
  %maximum.9.i37 = select i1 %39, float %maximum.9.i36, float %36
  %40 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.9.i37, i32 1, i32 31)
  %41 = icmp eq i32 %2, 0
  %42 = zext i32 %3 to i64
  %43 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %42, i64 0, i64 0
  %44 = fcmp uno float %maximum.9.i37, 0.000000e+00
  %45 = fcmp oge float %maximum.9.i37, %40
  %46 = or i1 %44, %45
  %maximum.9.i38 = select i1 %46, float %maximum.9.i37, float %40
  br i1 %41, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %maximum.9.i38, ptr addrspace(3) %43, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %43, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_3(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #3 {
entry:
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 32768
  br i1 %6, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %entry
  %7 = mul nuw nsw i32 %5, 50
  %8 = add nuw nsw i32 %2, %7
  %9 = udiv i32 %8, 50
  %10 = zext i32 %8 to i64
  %Arg_1.213 = getelementptr inbounds float, ptr addrspace(1) %arg148, i64 %10
  %Arg_1.214 = load float, ptr addrspace(1) %Arg_1.213, align 4, !invariant.load !18
  %multiply.515 = fmul float %Arg_1.214, 1.250000e-01
  %11 = zext i32 %9 to i64
  %Arg_0.116 = getelementptr inbounds float, ptr addrspace(1) %arg046, i64 %11
  %Arg_0.117 = load float, ptr addrspace(1) %Arg_0.116, align 4, !invariant.load !18
  %subtract.818 = fsub float %multiply.515, %Arg_0.117
  %12 = tail call float @llvm.fma.f32(float %subtract.818, float 0x3F777313A0000000, float 5.000000e-01)
  %13 = tail call float @llvm.nvvm.saturate.f(float %12) #3
  %14 = tail call float @llvm.nvvm.fma.rm.f(float %13, float 2.520000e+02, float 0x4168000020000000) #3
  %15 = fadd float %14, 0xC168000FE0000000
  %16 = fneg float %15
  %17 = tail call float @llvm.fma.f32(float %subtract.818, float 0x3FF7154760000000, float %16)
  %18 = tail call float @llvm.fma.f32(float %subtract.818, float 0x3E54AE0C00000000, float %17)
  %19 = bitcast float %14 to i32
  %20 = shl i32 %19, 23
  %21 = bitcast i32 %20 to float
  %22 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %18) #3
  %23 = fmul float %22, %21
  %x_loc11.1 = or i32 %2, 32
  %24 = icmp ult i32 %x_loc11.1, 50
  br i1 %24, label %x_in_tile-true.1, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %25 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %26 = lshr i32 %5, 13
  %27 = zext i32 %26 to i64
  %28 = and i32 %5, 8191
  %29 = zext i32 %28 to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr addrspace(1) %arg250, i64 0, i64 %27, i64 %29
  br i1 %25, label %reduction_write_output-true, label %common.ret

x_in_tile-true.1:                                 ; preds = %tile_loop.loop_header6.preheader
  %30 = add nuw nsw i32 %x_loc11.1, %7
  %31 = udiv i32 %30, 50
  %32 = zext i32 %7 to i64
  %33 = zext i32 %2 to i64
  %34 = add i64 %33, %32
  %35 = getelementptr float, ptr addrspace(1) %arg148, i64 %34
  %Arg_1.213.153 = getelementptr inbounds float, ptr addrspace(1) %35, i64 32
  %Arg_1.214.1 = load float, ptr addrspace(1) %Arg_1.213.153, align 4, !invariant.load !18
  %multiply.515.1 = fmul float %Arg_1.214.1, 1.250000e-01
  %36 = zext i32 %31 to i64
  %Arg_0.116.1 = getelementptr inbounds float, ptr addrspace(1) %arg046, i64 %36
  %Arg_0.117.1 = load float, ptr addrspace(1) %Arg_0.116.1, align 4, !invariant.load !18
  %subtract.818.1 = fsub float %multiply.515.1, %Arg_0.117.1
  %37 = tail call float @llvm.fma.f32(float %subtract.818.1, float 0x3F777313A0000000, float 5.000000e-01)
  %38 = tail call float @llvm.nvvm.saturate.f(float %37) #3
  %39 = tail call float @llvm.nvvm.fma.rm.f(float %38, float 2.520000e+02, float 0x4168000020000000) #3
  %40 = fadd float %39, 0xC168000FE0000000
  %41 = fneg float %40
  %42 = tail call float @llvm.fma.f32(float %subtract.818.1, float 0x3FF7154760000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %subtract.818.1, float 0x3E54AE0C00000000, float %42)
  %44 = bitcast float %39 to i32
  %45 = shl i32 %44, 23
  %46 = bitcast i32 %45 to float
  %47 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %43) #3
  %48 = fmul float %47, %46
  %add.15.i43.1 = fadd float %23, %48
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.1, %tile_loop.loop_header6.preheader
  %partial_reduction_result.1.1 = phi float [ %add.15.i43.1, %x_in_tile-true.1 ], [ %23, %tile_loop.loop_header6.preheader ]
  %49 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.1, i32 16, i32 31)
  %add.15.i = fadd float %partial_reduction_result.1.1, %49
  %50 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i, i32 8, i32 31)
  %add.15.i39 = fadd float %add.15.i, %50
  %51 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i39, i32 4, i32 31)
  %add.15.i40 = fadd float %add.15.i39, %51
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i40, i32 2, i32 31)
  %add.15.i41 = fadd float %add.15.i40, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.15.i41, i32 1, i32 31)
  %54 = icmp eq i32 %2, 0
  %55 = zext i32 %3 to i64
  %56 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 %55, i64 0, i64 0
  %add.15.i42 = fadd float %add.15.i41, %53
  br i1 %54, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.15.i42, ptr addrspace(3) %56, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %56, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_2(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg3) local_unnamed_addr #2 {
entry:
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !23
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index3, 50
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = udiv i32 %linear_index2, 50
  %6 = udiv i32 %linear_index_base, 50
  %7 = zext i32 %linear_index_base to i64
  %8 = getelementptr float, ptr addrspace(1) %arg217, i64 %7
  %9 = load <4 x float>, ptr addrspace(1) %8, align 16, !invariant.load !18
  %10 = extractelement <4 x float> %9, i32 0
  %11 = extractelement <4 x float> %9, i32 1
  %12 = extractelement <4 x float> %9, i32 2
  %13 = extractelement <4 x float> %9, i32 3
  %multiply.6 = fmul float %10, 1.250000e-01
  %14 = zext i32 %6 to i64
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg115, i64 %14
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !18
  %subtract.9 = fsub float %multiply.6, %16
  %17 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3F777313A0000000, float 5.000000e-01)
  %18 = tail call float @llvm.nvvm.saturate.f(float %17) #3
  %19 = tail call float @llvm.nvvm.fma.rm.f(float %18, float 2.520000e+02, float 0x4168000020000000) #3
  %20 = fadd float %19, 0xC168000FE0000000
  %21 = fneg float %20
  %22 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3FF7154760000000, float %21)
  %23 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3E54AE0C00000000, float %22)
  %24 = bitcast float %19 to i32
  %25 = shl i32 %24, 23
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %23) #3
  %28 = fmul float %27, %26
  %29 = getelementptr inbounds float, ptr addrspace(1) %arg013, i64 %14
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !18
  %divide.12 = fdiv float %28, %30
  %31 = getelementptr float, ptr addrspace(1) %arg319, i64 %7
  %multiply.62 = fmul float %11, 1.250000e-01
  %subtract.93 = fsub float %multiply.62, %16
  %32 = tail call float @llvm.fma.f32(float %subtract.93, float 0x3F777313A0000000, float 5.000000e-01)
  %33 = tail call float @llvm.nvvm.saturate.f(float %32) #3
  %34 = tail call float @llvm.nvvm.fma.rm.f(float %33, float 2.520000e+02, float 0x4168000020000000) #3
  %35 = fadd float %34, 0xC168000FE0000000
  %36 = fneg float %35
  %37 = tail call float @llvm.fma.f32(float %subtract.93, float 0x3FF7154760000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %subtract.93, float 0x3E54AE0C00000000, float %37)
  %39 = bitcast float %34 to i32
  %40 = shl i32 %39, 23
  %41 = bitcast i32 %40 to float
  %42 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %38) #3
  %43 = fmul float %42, %41
  %divide.124 = fdiv float %43, %30
  %multiply.66 = fmul float %12, 1.250000e-01
  %44 = zext i32 %5 to i64
  %45 = getelementptr inbounds float, ptr addrspace(1) %arg115, i64 %44
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !18
  %subtract.97 = fsub float %multiply.66, %46
  %47 = tail call float @llvm.fma.f32(float %subtract.97, float 0x3F777313A0000000, float 5.000000e-01)
  %48 = tail call float @llvm.nvvm.saturate.f(float %47) #3
  %49 = tail call float @llvm.nvvm.fma.rm.f(float %48, float 2.520000e+02, float 0x4168000020000000) #3
  %50 = fadd float %49, 0xC168000FE0000000
  %51 = fneg float %50
  %52 = tail call float @llvm.fma.f32(float %subtract.97, float 0x3FF7154760000000, float %51)
  %53 = tail call float @llvm.fma.f32(float %subtract.97, float 0x3E54AE0C00000000, float %52)
  %54 = bitcast float %49 to i32
  %55 = shl i32 %54, 23
  %56 = bitcast i32 %55 to float
  %57 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %53) #3
  %58 = fmul float %57, %56
  %59 = getelementptr inbounds float, ptr addrspace(1) %arg013, i64 %44
  %60 = load float, ptr addrspace(1) %59, align 4, !invariant.load !18
  %divide.128 = fdiv float %58, %60
  %multiply.610 = fmul float %13, 1.250000e-01
  %61 = zext i32 %4 to i64
  %62 = getelementptr inbounds float, ptr addrspace(1) %arg115, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4, !invariant.load !18
  %subtract.911 = fsub float %multiply.610, %63
  %64 = tail call float @llvm.fma.f32(float %subtract.911, float 0x3F777313A0000000, float 5.000000e-01)
  %65 = tail call float @llvm.nvvm.saturate.f(float %64) #3
  %66 = tail call float @llvm.nvvm.fma.rm.f(float %65, float 2.520000e+02, float 0x4168000020000000) #3
  %67 = fadd float %66, 0xC168000FE0000000
  %68 = fneg float %67
  %69 = tail call float @llvm.fma.f32(float %subtract.911, float 0x3FF7154760000000, float %68)
  %70 = tail call float @llvm.fma.f32(float %subtract.911, float 0x3E54AE0C00000000, float %69)
  %71 = bitcast float %66 to i32
  %72 = shl i32 %71, 23
  %73 = bitcast i32 %72 to float
  %74 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %70) #3
  %75 = fmul float %74, %73
  %76 = getelementptr inbounds float, ptr addrspace(1) %arg013, i64 %61
  %77 = load float, ptr addrspace(1) %76, align 4, !invariant.load !18
  %divide.1212 = fdiv float %75, %77
  %78 = insertelement <4 x float> poison, float %divide.12, i32 0
  %79 = insertelement <4 x float> %78, float %divide.124, i32 1
  %80 = insertelement <4 x float> %79, float %divide.128, i32 2
  %81 = insertelement <4 x float> %80, float %divide.1212, i32 3
  store <4 x float> %81, ptr addrspace(1) %31, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion(ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(419430400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(419430400) %arg3) local_unnamed_addr #3 {
entry:
  %arg3120 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2118 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1116 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0114 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
  %thread_id.x = and i32 %1, 31
  %thread_id.y82 = lshr i32 %1, 5
  %2 = shl nuw nsw i32 %thread_id.x, 1
  %3 = mul nuw nsw i32 %0, 3200
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
  %32 = udiv i64 %lsr.iv129, 26214400
  %33 = mul nuw nsw i64 %32, 104857600
  %34 = udiv i32 %lsr158, 3200
  %35 = trunc i32 %34 to i13
  %36 = zext i13 %35 to i64
  %37 = mul nuw nsw i64 %36, 12800
  %38 = add i64 %33, %37
  %39 = udiv i64 %lsr.iv131, 50
  %40 = mul nuw nsw i64 %39, 12800
  %41 = sub i64 %38, %40
  %scevgep133 = getelementptr i8, ptr addrspace(1) %lsr.iv127, i64 %41
  %42 = mul nuw nsw i64 %32, 1638400
  %43 = mul nuw nsw i64 %36, 200
  %44 = add i64 %42, %43
  %45 = mul nuw nsw i64 %39, 200
  %46 = sub i64 %44, %45
  %scevgep137 = getelementptr i8, ptr addrspace(1) %lsr.iv135, i64 %46
  %47 = zext i13 %35 to i32
  %48 = mul nuw nsw i32 %47, 50
  %49 = add i32 %24, %48
  %50 = udiv i32 %lsr.iv138, 50
  %51 = mul nuw nsw i32 %50, 50
  %52 = sub i32 %49, %51
  %53 = udiv i64 %lsr.iv143, 26214400
  %54 = mul nuw nsw i64 %53, 1638400
  %55 = udiv i32 %lsr156, 3200
  %56 = trunc i32 %55 to i13
  %57 = zext i13 %56 to i64
  %58 = mul nuw nsw i64 %57, 200
  %59 = add i64 %54, %58
  %60 = udiv i64 %lsr.iv147, 50
  %61 = mul nuw nsw i64 %60, 200
  %62 = sub i64 %59, %61
  %scevgep149 = getelementptr i8, ptr addrspace(1) %lsr.iv141, i64 %62
  %63 = mul nuw nsw i64 %53, 104857600
  %64 = mul nuw nsw i64 %57, 12800
  %65 = add i64 %63, %64
  %66 = mul nuw nsw i64 %60, 12800
  %67 = sub i64 %65, %66
  %scevgep153 = getelementptr i8, ptr addrspace(1) %lsr.iv151, i64 %67
  %68 = zext i13 %56 to i32
  %69 = mul nuw nsw i32 %68, 50
  %70 = add i32 %29, %69
  %71 = udiv i32 %lsr.iv154, 50
  %72 = mul nuw nsw i32 %71, 50
  %73 = sub i32 %70, %72
  %74 = add i32 %lsr158, -1
  %Arg_0.13 = load float, ptr addrspace(1) %scevgep149, align 4, !invariant.load !18
  %75 = icmp ult i32 %74, 52428800
  %76 = add i32 %lsr.iv, %73
  %77 = zext i32 %76 to i64
  %78 = icmp ult i32 %74, 26214400
  %. = select i1 %78, i64 %6, i64 %5
  %79 = icmp ult i32 %74, 78643200
  %.110.v.v = select i1 %79, i32 128, i32 192
  %.110.v = or i32 %30, %.110.v.v
  %.110 = zext i32 %.110.v to i64
  %.sink = select i1 %75, i64 %., i64 %.110
  %Arg_1.29 = getelementptr inbounds [409600 x [256 x float]], ptr addrspace(1) %arg1116, i64 0, i64 %77, i64 %.sink
  %80 = load float, ptr addrspace(1) %Arg_1.29, align 8, !invariant.load !18
  %multiply.15 = fmul float %Arg_0.13, %80
  %add.20.i104 = fadd float %partial_reduction_result81.sroa.0.0107, %multiply.15
  store float %80, ptr addrspace(1) %scevgep153, align 8
  %Arg_0.118 = load float, ptr addrspace(1) %scevgep137, align 4, !invariant.load !18
  %81 = icmp ult i32 %lsr158, 52428800
  %82 = add i32 %lsr.iv, %52
  %83 = zext i32 %82 to i64
  %84 = icmp ult i32 %lsr158, 26214400
  %.112.v = select i1 %84, i32 %7, i32 %8
  %85 = icmp ult i32 %lsr158, 78643200
  %.113.v.v = select i1 %85, i32 129, i32 193
  %.113.v = or i32 %31, %.113.v.v
  %.sink111.v = select i1 %81, i32 %.112.v, i32 %.113.v
  %.sink111 = zext i32 %.sink111.v to i64
  %Arg_1.230 = getelementptr inbounds [409600 x [256 x float]], ptr addrspace(1) %arg1116, i64 0, i64 %83, i64 %.sink111
  %86 = load float, ptr addrspace(1) %Arg_1.230, align 4, !invariant.load !18
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
  %88 = icmp ugt i32 %87, 17
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
attributes #2 = { mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind }
attributes #4 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #5 = { convergent nocallback nounwind }
attributes #6 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}
!llvm.module.flags = !{!15}

!0 = !{ptr @fusion_8, !"kernel", i32 1}
!1 = !{ptr @fusion_8, !"reqntidx", i32 256}
!2 = !{ptr @fusion_9, !"kernel", i32 1}
!3 = !{ptr @fusion_9, !"reqntidx", i32 256}
!4 = !{ptr @fusion_6, !"kernel", i32 1}
!5 = !{ptr @fusion_6, !"reqntidx", i32 96}
!6 = !{ptr @fusion_10, !"kernel", i32 1}
!7 = !{ptr @fusion_10, !"reqntidx", i32 96}
!8 = !{ptr @fusion_3, !"kernel", i32 1}
!9 = !{ptr @fusion_3, !"reqntidx", i32 96}
!10 = !{ptr @fusion_2, !"kernel", i32 1}
!11 = !{ptr @fusion_2, !"reqntidx", i32 256}
!12 = !{ptr @fusion, !"kernel", i32 1}
!13 = !{ptr @fusion, !"reqntidx", i32 1024}
!14 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!15 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!16 = !{i32 0, i32 60800}
!17 = !{i32 0, i32 256}
!18 = !{}
!19 = !{i32 0, i32 2048}
!20 = !{i32 0, i32 96}
!21 = !{i32 0, i32 546134}
!22 = !{i32 0, i32 10923}
!23 = !{i32 0, i32 1600}
!24 = !{i32 0, i32 32768}
!25 = !{i32 0, i32 1024}
