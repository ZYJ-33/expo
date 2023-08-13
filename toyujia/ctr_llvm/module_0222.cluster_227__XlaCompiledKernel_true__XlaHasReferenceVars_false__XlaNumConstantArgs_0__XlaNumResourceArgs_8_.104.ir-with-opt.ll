target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache3 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@buffer_for_constant_1 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\00>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(104857600) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(104857600) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg3, ptr noalias nocapture readonly align 16 dereferenceable(13107200) %arg4, ptr noalias nocapture writeonly align 128 dereferenceable(249036800) %arg5) local_unnamed_addr #0 {
entry:
  %arg576 = addrspacecast ptr %arg5 to ptr addrspace(1)
  %arg474 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg372 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg270 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg168 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg066 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
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
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !20
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
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !20
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
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !20
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
  %88 = load float, ptr addrspace(1) %87, align 4, !invariant.load !20
  %89 = getelementptr inbounds float, ptr addrspace(1) %29, i64 3
  store float %88, ptr addrspace(1) %89, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nounwind
define void @fusion_4(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(419430400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg2) local_unnamed_addr #2 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %2 = lshr i32 %0, 5
  %3 = mul nuw nsw i32 %1, 3
  %4 = add nuw nsw i32 %3, %2
  %5 = icmp ult i32 %4, 1638400
  br i1 %5, label %tile_loop.loop_header6.preheader, label %common.ret

tile_loop.loop_header6.preheader:                 ; preds = %entry
  %6 = and i32 %0, 31
  %7 = shl nuw nsw i32 %4, 6
  %8 = or i32 %6, %7
  %9 = and i32 %7, 192
  %10 = udiv i32 %4, 200
  %11 = or i32 %9, %6
  %12 = zext i32 %10 to i64
  %13 = zext i32 %11 to i64
  %Arg_0.112 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg044, i64 0, i64 %12, i64 %13
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !20
  %14 = zext i32 %8 to i64
  %Arg_1.214 = getelementptr inbounds float, ptr addrspace(1) %arg146, i64 %14
  %Arg_1.215 = load float, ptr addrspace(1) %Arg_1.214, align 4, !invariant.load !20
  %multiply.616 = fmul float %Arg_0.113, %Arg_1.215
  %add.11.i41 = fadd float %multiply.616, 0.000000e+00
  %15 = zext i32 %9 to i64
  %16 = zext i32 %6 to i64
  %17 = add i64 %15, %16
  %18 = getelementptr [8192 x [256 x float]], ptr addrspace(1) %arg044, i64 0, i64 %12, i64 %17
  %Arg_0.112.151 = getelementptr inbounds float, ptr addrspace(1) %18, i64 32
  %Arg_0.113.1 = load float, ptr addrspace(1) %Arg_0.112.151, align 4, !invariant.load !20
  %19 = zext i32 %7 to i64
  %20 = add i64 %16, %19
  %21 = getelementptr float, ptr addrspace(1) %arg146, i64 %20
  %Arg_1.214.153 = getelementptr inbounds float, ptr addrspace(1) %21, i64 32
  %Arg_1.215.1 = load float, ptr addrspace(1) %Arg_1.214.153, align 4, !invariant.load !20
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
  %33 = urem i32 %32, 50
  %34 = zext i32 %31 to i64
  %35 = zext i32 %33 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr addrspace(1) %arg248, i64 0, i64 %12, i64 %34, i64 %35
  %output.then.val = load float, ptr addrspace(3) %29, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

; Function Attrs: nounwind
define void @fusion_7(ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg1) local_unnamed_addr #2 {
entry:
  %arg144 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg042 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !23
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
  %Arg_0.113 = load float, ptr addrspace(1) %Arg_0.112, align 4, !invariant.load !20
  %multiply.514 = fmul float %Arg_0.113, 1.250000e-01
  %10 = fcmp ole float %multiply.514, 0xFFF0000000000000
  %maximum.10.i39 = select i1 %10, float 0xFFF0000000000000, float %multiply.514
  %x_loc10.1 = or i32 %2, 32
  %11 = icmp ult i32 %x_loc10.1, 50
  br i1 %11, label %x_in_tile-true.1, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %12 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %13 = lshr i32 %5, 2
  %14 = zext i32 %13 to i64
  %15 = and i32 %5, 3
  %16 = zext i32 %15 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg144, i64 0, i64 %14, i64 %16
  br i1 %12, label %reduction_write_output-true, label %common.ret

x_in_tile-true.1:                                 ; preds = %tile_loop.loop_header5.preheader
  %17 = zext i32 %7 to i64
  %18 = zext i32 %2 to i64
  %19 = add i64 %18, %17
  %20 = getelementptr float, ptr addrspace(1) %arg042, i64 %19
  %Arg_0.112.147 = getelementptr inbounds float, ptr addrspace(1) %20, i64 32
  %Arg_0.113.1 = load float, ptr addrspace(1) %Arg_0.112.147, align 4, !invariant.load !20
  %multiply.514.1 = fmul float %Arg_0.113.1, 1.250000e-01
  %21 = fcmp oge float %maximum.10.i39, %multiply.514.1
  %22 = fcmp uno float %maximum.10.i39, 0.000000e+00
  %23 = or i1 %22, %21
  %maximum.10.i39.1 = select i1 %23, float %maximum.10.i39, float %multiply.514.1
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.1, %tile_loop.loop_header5.preheader
  %partial_reduction_result.1.1 = phi float [ %maximum.10.i39.1, %x_in_tile-true.1 ], [ %maximum.10.i39, %tile_loop.loop_header5.preheader ]
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.1, i32 16, i32 31)
  %25 = fcmp oge float %partial_reduction_result.1.1, %24
  %26 = fcmp uno float %partial_reduction_result.1.1, 0.000000e+00
  %27 = or i1 %26, %25
  %maximum.10.i = select i1 %27, float %partial_reduction_result.1.1, float %24
  %28 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.10.i, i32 8, i32 31)
  %29 = fcmp oge float %maximum.10.i, %28
  %30 = fcmp uno float %maximum.10.i, 0.000000e+00
  %31 = or i1 %30, %29
  %maximum.10.i35 = select i1 %31, float %maximum.10.i, float %28
  %32 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.10.i35, i32 4, i32 31)
  %33 = fcmp oge float %maximum.10.i35, %32
  %34 = fcmp uno float %maximum.10.i35, 0.000000e+00
  %35 = or i1 %34, %33
  %maximum.10.i36 = select i1 %35, float %maximum.10.i35, float %32
  %36 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.10.i36, i32 2, i32 31)
  %37 = fcmp oge float %maximum.10.i36, %36
  %38 = fcmp uno float %maximum.10.i36, 0.000000e+00
  %39 = or i1 %38, %37
  %maximum.10.i37 = select i1 %39, float %maximum.10.i36, float %36
  %40 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %maximum.10.i37, i32 1, i32 31)
  %41 = icmp eq i32 %2, 0
  %42 = zext i32 %3 to i64
  %43 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %42, i64 0, i64 0
  %44 = fcmp uno float %maximum.10.i37, 0.000000e+00
  %45 = fcmp oge float %maximum.10.i37, %40
  %46 = or i1 %44, %45
  %maximum.10.i38 = select i1 %46, float %maximum.10.i37, float %40
  br i1 %41, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %maximum.10.i38, ptr addrspace(3) %43, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %43, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: nounwind
define void @fusion_8(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #2 {
entry:
  %arg250 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg148 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg046 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !21
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !23
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
  %Arg_1.214 = load float, ptr addrspace(1) %Arg_1.213, align 4, !invariant.load !20
  %multiply.615 = fmul float %Arg_1.214, 1.250000e-01
  %11 = zext i32 %9 to i64
  %Arg_0.116 = getelementptr inbounds float, ptr addrspace(1) %arg046, i64 %11
  %Arg_0.117 = load float, ptr addrspace(1) %Arg_0.116, align 4, !invariant.load !20
  %subtract.818 = fsub float %multiply.615, %Arg_0.117
  %12 = tail call float @llvm.fma.f32(float %subtract.818, float 0x3F777313A0000000, float 5.000000e-01)
  %13 = tail call float @llvm.nvvm.saturate.f(float %12) #2
  %14 = tail call float @llvm.nvvm.fma.rm.f(float %13, float 2.520000e+02, float 0x4168000020000000) #2
  %15 = fadd float %14, 0xC168000FE0000000
  %16 = fneg float %15
  %17 = tail call float @llvm.fma.f32(float %subtract.818, float 0x3FF7154760000000, float %16)
  %18 = tail call float @llvm.fma.f32(float %subtract.818, float 0x3E54AE0C00000000, float %17)
  %19 = bitcast float %14 to i32
  %20 = shl i32 %19, 23
  %21 = bitcast i32 %20 to float
  %22 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %18) #2
  %23 = fmul float %22, %21
  %x_loc11.1 = or i32 %2, 32
  %24 = icmp ult i32 %x_loc11.1, 50
  br i1 %24, label %x_in_tile-true.1, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %25 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %26 = lshr i32 %5, 2
  %27 = zext i32 %26 to i64
  %28 = and i32 %5, 3
  %29 = zext i32 %28 to i64
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr addrspace(1) %arg250, i64 0, i64 %27, i64 %29
  br i1 %25, label %reduction_write_output-true, label %common.ret

x_in_tile-true.1:                                 ; preds = %tile_loop.loop_header6.preheader
  %30 = add nuw nsw i32 %x_loc11.1, %7
  %31 = udiv i32 %30, 50
  %32 = zext i32 %7 to i64
  %33 = zext i32 %2 to i64
  %34 = add i64 %33, %32
  %35 = getelementptr float, ptr addrspace(1) %arg148, i64 %34
  %Arg_1.213.153 = getelementptr inbounds float, ptr addrspace(1) %35, i64 32
  %Arg_1.214.1 = load float, ptr addrspace(1) %Arg_1.213.153, align 4, !invariant.load !20
  %multiply.615.1 = fmul float %Arg_1.214.1, 1.250000e-01
  %36 = zext i32 %31 to i64
  %Arg_0.116.1 = getelementptr inbounds float, ptr addrspace(1) %arg046, i64 %36
  %Arg_0.117.1 = load float, ptr addrspace(1) %Arg_0.116.1, align 4, !invariant.load !20
  %subtract.818.1 = fsub float %multiply.615.1, %Arg_0.117.1
  %37 = tail call float @llvm.fma.f32(float %subtract.818.1, float 0x3F777313A0000000, float 5.000000e-01)
  %38 = tail call float @llvm.nvvm.saturate.f(float %37) #2
  %39 = tail call float @llvm.nvvm.fma.rm.f(float %38, float 2.520000e+02, float 0x4168000020000000) #2
  %40 = fadd float %39, 0xC168000FE0000000
  %41 = fneg float %40
  %42 = tail call float @llvm.fma.f32(float %subtract.818.1, float 0x3FF7154760000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %subtract.818.1, float 0x3E54AE0C00000000, float %42)
  %44 = bitcast float %39 to i32
  %45 = shl i32 %44, 23
  %46 = bitcast i32 %45 to float
  %47 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %43) #2
  %48 = fmul float %47, %46
  %add.14.i43.1 = fadd float %23, %48
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.1, %tile_loop.loop_header6.preheader
  %partial_reduction_result.1.1 = phi float [ %add.14.i43.1, %x_in_tile-true.1 ], [ %23, %tile_loop.loop_header6.preheader ]
  %49 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.1, i32 16, i32 31)
  %add.14.i = fadd float %partial_reduction_result.1.1, %49
  %50 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i, i32 8, i32 31)
  %add.14.i39 = fadd float %add.14.i, %50
  %51 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i39, i32 4, i32 31)
  %add.14.i40 = fadd float %add.14.i39, %51
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i40, i32 2, i32 31)
  %add.14.i41 = fadd float %add.14.i40, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.14.i41, i32 1, i32 31)
  %54 = icmp eq i32 %2, 0
  %55 = zext i32 %3 to i64
  %56 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i64 0, i64 %55, i64 0, i64 0
  %add.14.i42 = fadd float %add.14.i41, %53
  br i1 %54, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.14.i42, ptr addrspace(3) %56, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %56, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_1(ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg3) local_unnamed_addr #5 {
entry:
  %arg319 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg217 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg115 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg013 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index3, 50
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = udiv i32 %linear_index2, 50
  %6 = udiv i32 %linear_index_base, 50
  %7 = zext i32 %linear_index_base to i64
  %8 = getelementptr float, ptr addrspace(1) %arg217, i64 %7
  %9 = load <4 x float>, ptr addrspace(1) %8, align 16, !invariant.load !20
  %10 = extractelement <4 x float> %9, i32 0
  %11 = extractelement <4 x float> %9, i32 1
  %12 = extractelement <4 x float> %9, i32 2
  %13 = extractelement <4 x float> %9, i32 3
  %multiply.7 = fmul float %10, 1.250000e-01
  %14 = zext i32 %6 to i64
  %15 = getelementptr inbounds float, ptr addrspace(1) %arg115, i64 %14
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !20
  %subtract.9 = fsub float %multiply.7, %16
  %17 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3F777313A0000000, float 5.000000e-01)
  %18 = tail call float @llvm.nvvm.saturate.f(float %17) #2
  %19 = tail call float @llvm.nvvm.fma.rm.f(float %18, float 2.520000e+02, float 0x4168000020000000) #2
  %20 = fadd float %19, 0xC168000FE0000000
  %21 = fneg float %20
  %22 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3FF7154760000000, float %21)
  %23 = tail call float @llvm.fma.f32(float %subtract.9, float 0x3E54AE0C00000000, float %22)
  %24 = bitcast float %19 to i32
  %25 = shl i32 %24, 23
  %26 = bitcast i32 %25 to float
  %27 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %23) #2
  %28 = fmul float %27, %26
  %29 = getelementptr inbounds float, ptr addrspace(1) %arg013, i64 %14
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !20
  %divide.12 = fdiv float %28, %30
  %31 = getelementptr float, ptr addrspace(1) %arg319, i64 %7
  %multiply.72 = fmul float %11, 1.250000e-01
  %subtract.93 = fsub float %multiply.72, %16
  %32 = tail call float @llvm.fma.f32(float %subtract.93, float 0x3F777313A0000000, float 5.000000e-01)
  %33 = tail call float @llvm.nvvm.saturate.f(float %32) #2
  %34 = tail call float @llvm.nvvm.fma.rm.f(float %33, float 2.520000e+02, float 0x4168000020000000) #2
  %35 = fadd float %34, 0xC168000FE0000000
  %36 = fneg float %35
  %37 = tail call float @llvm.fma.f32(float %subtract.93, float 0x3FF7154760000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %subtract.93, float 0x3E54AE0C00000000, float %37)
  %39 = bitcast float %34 to i32
  %40 = shl i32 %39, 23
  %41 = bitcast i32 %40 to float
  %42 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %38) #2
  %43 = fmul float %42, %41
  %divide.124 = fdiv float %43, %30
  %multiply.76 = fmul float %12, 1.250000e-01
  %44 = zext i32 %5 to i64
  %45 = getelementptr inbounds float, ptr addrspace(1) %arg115, i64 %44
  %46 = load float, ptr addrspace(1) %45, align 4, !invariant.load !20
  %subtract.97 = fsub float %multiply.76, %46
  %47 = tail call float @llvm.fma.f32(float %subtract.97, float 0x3F777313A0000000, float 5.000000e-01)
  %48 = tail call float @llvm.nvvm.saturate.f(float %47) #2
  %49 = tail call float @llvm.nvvm.fma.rm.f(float %48, float 2.520000e+02, float 0x4168000020000000) #2
  %50 = fadd float %49, 0xC168000FE0000000
  %51 = fneg float %50
  %52 = tail call float @llvm.fma.f32(float %subtract.97, float 0x3FF7154760000000, float %51)
  %53 = tail call float @llvm.fma.f32(float %subtract.97, float 0x3E54AE0C00000000, float %52)
  %54 = bitcast float %49 to i32
  %55 = shl i32 %54, 23
  %56 = bitcast i32 %55 to float
  %57 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %53) #2
  %58 = fmul float %57, %56
  %59 = getelementptr inbounds float, ptr addrspace(1) %arg013, i64 %44
  %60 = load float, ptr addrspace(1) %59, align 4, !invariant.load !20
  %divide.128 = fdiv float %58, %60
  %multiply.710 = fmul float %13, 1.250000e-01
  %61 = zext i32 %4 to i64
  %62 = getelementptr inbounds float, ptr addrspace(1) %arg115, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4, !invariant.load !20
  %subtract.911 = fsub float %multiply.710, %63
  %64 = tail call float @llvm.fma.f32(float %subtract.911, float 0x3F777313A0000000, float 5.000000e-01)
  %65 = tail call float @llvm.nvvm.saturate.f(float %64) #2
  %66 = tail call float @llvm.nvvm.fma.rm.f(float %65, float 2.520000e+02, float 0x4168000020000000) #2
  %67 = fadd float %66, 0xC168000FE0000000
  %68 = fneg float %67
  %69 = tail call float @llvm.fma.f32(float %subtract.911, float 0x3FF7154760000000, float %68)
  %70 = tail call float @llvm.fma.f32(float %subtract.911, float 0x3E54AE0C00000000, float %69)
  %71 = bitcast float %66 to i32
  %72 = shl i32 %71, 23
  %73 = bitcast i32 %72 to float
  %74 = tail call float @llvm.nvvm.ex2.approx.ftz.f(float %70) #2
  %75 = fmul float %74, %73
  %76 = getelementptr inbounds float, ptr addrspace(1) %arg013, i64 %61
  %77 = load float, ptr addrspace(1) %76, align 4, !invariant.load !20
  %divide.1212 = fdiv float %75, %77
  %78 = insertelement <4 x float> poison, float %divide.12, i32 0
  %79 = insertelement <4 x float> %78, float %divide.124, i32 1
  %80 = insertelement <4 x float> %79, float %divide.128, i32 2
  %81 = insertelement <4 x float> %80, float %divide.1212, i32 3
  store <4 x float> %81, ptr addrspace(1) %31, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @transpose(ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg1) local_unnamed_addr #5 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
  %1 = shl nuw nsw i32 %0, 8
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %linear_index = or i32 %1, %2
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 50
  %4 = mul i32 %3, 50
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = zext i32 %3 to i64
  %6 = zext i32 %.decomposed to i64
  %7 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 0, i64 %6
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !20
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg13, i64 %9
  %11 = getelementptr inbounds float, ptr addrspace(1) %7, i64 50
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !20
  %13 = getelementptr inbounds float, ptr addrspace(1) %7, i64 100
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !20
  %15 = getelementptr inbounds float, ptr addrspace(1) %7, i64 150
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !20
  %17 = insertelement <4 x float> poison, float %8, i32 0
  %18 = insertelement <4 x float> %17, float %12, i32 1
  %19 = insertelement <4 x float> %18, float %14, i32 2
  %20 = insertelement <4 x float> %19, float %16, i32 3
  store <4 x float> %20, ptr addrspace(1) %10, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion(ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(419430400) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg2) local_unnamed_addr #2 {
entry:
  %arg282 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg180 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg078 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !26
  %thread_id.x = and i32 %1, 31
  %thread_id.y51 = lshr i32 %1, 5
  %2 = lshr i32 %0, 2
  %3 = shl nuw nsw i32 %0, 6
  %tile_origin.2 = and i32 %3, 192
  %4 = shl nuw nsw i32 %thread_id.x, 1
  %5 = mul nuw nsw i32 %2, 12800
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
  %28 = udiv i64 %lsr.iv90, 12800
  %29 = mul nuw nsw i64 %28, 800
  %30 = udiv i64 %lsr.iv92, 50
  %31 = mul nuw nsw i64 %30, 800
  %32 = sub i64 %29, %31
  %scevgep94 = getelementptr i8, ptr addrspace(1) %lsr.iv88, i64 %32
  %33 = udiv i32 %lsr113, 12800
  %34 = mul nuw nsw i32 %33, 50
  %35 = add i32 %21, %34
  %36 = udiv i32 %lsr.iv97, 50
  %37 = mul nuw nsw i32 %36, 50
  %38 = sub i32 %35, %37
  %39 = udiv i64 %lsr.iv102, 12800
  %40 = mul nuw nsw i64 %39, 800
  %41 = udiv i64 %lsr.iv104, 50
  %42 = mul nuw nsw i64 %41, 800
  %43 = sub i64 %40, %42
  %scevgep106 = getelementptr i8, ptr addrspace(1) %lsr.iv100, i64 %43
  %44 = udiv i32 %lsr111, 12800
  %45 = mul nuw nsw i32 %44, 50
  %46 = add i32 %27, %45
  %47 = udiv i32 %lsr.iv109, 50
  %48 = mul nuw nsw i32 %47, 50
  %49 = sub i32 %46, %48
  %50 = add i32 %lsr.iv, %38
  %51 = zext i32 %50 to i64
  %Arg_1.2 = getelementptr inbounds [409600 x [256 x float]], ptr addrspace(1) %arg180, i64 0, i64 %51, i64 %9
  %Arg_1.23 = load float, ptr addrspace(1) %Arg_1.2, align 8, !invariant.load !20
  %Arg_0.14 = load float, ptr addrspace(1) %scevgep94, align 4, !invariant.load !20
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  %add.10.i = fadd float %partial_reduction_result50.sroa.0.074, %multiply.5
  %52 = add i32 %lsr.iv, %49
  %53 = zext i32 %52 to i64
  %54 = getelementptr [409600 x [256 x float]], ptr addrspace(1) %arg180, i64 0, i64 %53, i64 %9
  %Arg_1.2884 = getelementptr inbounds float, ptr addrspace(1) %54, i64 1
  %Arg_1.29 = load float, ptr addrspace(1) %Arg_1.2884, align 4, !invariant.load !20
  %Arg_0.111 = load float, ptr addrspace(1) %scevgep106, align 4, !invariant.load !20
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
  %56 = icmp ugt i32 %55, 17
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
define void @fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg1) local_unnamed_addr #5 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
  %1 = shl nuw nsw i32 %0, 8
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !19
  %linear_index = or i32 %1, %2
  %linear_index_base = shl nuw nsw i32 %linear_index, 2
  %linear_index.frozen = freeze i32 %linear_index
  %3 = udiv i32 %linear_index.frozen, 50
  %4 = mul i32 %3, 50
  %.decomposed = sub i32 %linear_index.frozen, %4
  %5 = zext i32 %3 to i64
  %6 = zext i32 %.decomposed to i64
  %7 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr addrspace(1) %arg01, i64 0, i64 %5, i64 0, i64 %6
  %8 = load float, ptr addrspace(1) %7, align 4, !invariant.load !20
  %9 = zext i32 %linear_index_base to i64
  %10 = getelementptr float, ptr addrspace(1) %arg13, i64 %9
  %11 = getelementptr inbounds float, ptr addrspace(1) %7, i64 50
  %12 = load float, ptr addrspace(1) %11, align 4, !invariant.load !20
  %13 = getelementptr inbounds float, ptr addrspace(1) %7, i64 100
  %14 = load float, ptr addrspace(1) %13, align 4, !invariant.load !20
  %15 = getelementptr inbounds float, ptr addrspace(1) %7, i64 150
  %16 = load float, ptr addrspace(1) %15, align 4, !invariant.load !20
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

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}
!llvm.module.flags = !{!17}

!0 = !{ptr @fusion_5, !"kernel", i32 1}
!1 = !{ptr @fusion_5, !"reqntidx", i32 256}
!2 = !{ptr @fusion_4, !"kernel", i32 1}
!3 = !{ptr @fusion_4, !"reqntidx", i32 96}
!4 = !{ptr @fusion_7, !"kernel", i32 1}
!5 = !{ptr @fusion_7, !"reqntidx", i32 96}
!6 = !{ptr @fusion_8, !"kernel", i32 1}
!7 = !{ptr @fusion_8, !"reqntidx", i32 96}
!8 = !{ptr @fusion_1, !"kernel", i32 1}
!9 = !{ptr @fusion_1, !"reqntidx", i32 256}
!10 = !{ptr @transpose, !"kernel", i32 1}
!11 = !{ptr @transpose, !"reqntidx", i32 256}
!12 = !{ptr @fusion, !"kernel", i32 1}
!13 = !{ptr @fusion, !"reqntidx", i32 1024}
!14 = !{ptr @fusion_6, !"kernel", i32 1}
!15 = !{ptr @fusion_6, !"reqntidx", i32 256}
!16 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!17 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!18 = !{i32 0, i32 60800}
!19 = !{i32 0, i32 256}
!20 = !{}
!21 = !{i32 0, i32 96}
!22 = !{i32 0, i32 546134}
!23 = !{i32 0, i32 10923}
!24 = !{i32 0, i32 1600}
!25 = !{i32 0, i32 32768}
!26 = !{i32 0, i32 1024}
