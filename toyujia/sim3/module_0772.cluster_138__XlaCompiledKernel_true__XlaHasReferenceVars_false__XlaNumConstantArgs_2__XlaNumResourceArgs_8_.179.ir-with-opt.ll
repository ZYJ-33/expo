target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@shared_cache = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache1 = private unnamed_addr addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache2 = private unnamed_addr addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_15(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1) local_unnamed_addr #0 {
entry:
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
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
  %16 = load <2 x float>, ptr addrspace(1) %15, align 16, !invariant.load !23
  %17 = extractelement <2 x float> %16, i32 0
  %18 = extractelement <2 x float> %16, i32 1
  %19 = zext i32 %linear_index_base to i64
  %20 = getelementptr float, ptr addrspace(1) %arg13, i64 %19
  %21 = or i32 %8, %11
  %22 = zext i32 %21 to i64
  %23 = or i32 %7, %11
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %24
  %26 = load float, ptr addrspace(1) %25, align 8, !invariant.load !23
  %27 = or i32 %6, %11
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds [8192 x [256 x float]], ptr addrspace(1) %arg01, i64 0, i64 %13, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !23
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

; Function Attrs: nounwind
define void @fusion_14(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 16 dereferenceable(6553600) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(419430400) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(419430400) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg4) local_unnamed_addr #2 {
entry:
  %arg4108 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3106 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2104 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1102 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0100 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !25
  %2 = and i32 %0, 31
  %3 = lshr i32 %0, 5
  %4 = mul nuw nsw i32 %1, 3
  %5 = add nuw nsw i32 %4, %3
  %6 = icmp ult i32 %5, 1638400
  br i1 %6, label %tile_loop.loop_header27.preheader, label %common.ret

tile_loop.loop_header27.preheader:                ; preds = %entry
  %7 = shl nuw nsw i32 %5, 6
  %8 = or i32 %2, %7
  %9 = urem i32 %5, 50
  %10 = udiv i32 %5, 50
  %11 = and i32 %10, 8191
  %12 = udiv i32 %5, 409600
  %13 = zext i32 %12 to i64
  %14 = zext i32 %11 to i64
  %15 = zext i32 %2 to i64
  %Arg_0.133 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 %13, i64 %14, i64 %15
  %Arg_0.134 = load float, ptr addrspace(1) %Arg_0.133, align 4, !invariant.load !23
  %16 = zext i32 %8 to i64
  %Arg_2.335 = getelementptr inbounds float, ptr addrspace(1) %arg2104, i64 %16
  %Arg_2.336 = load float, ptr addrspace(1) %Arg_2.335, align 4, !invariant.load !23
  %multiply.1837 = fmul float %Arg_0.134, %Arg_2.336
  %add.23.i97 = fadd float %multiply.1837, 0.000000e+00
  %17 = shl nuw nsw i32 %9, 6
  %18 = or i32 %17, %2
  %19 = mul nuw nsw i32 %11, 3200
  %20 = add nuw nsw i32 %18, %19
  %21 = mul nuw nsw i32 %12, 26214400
  %22 = add nuw nsw i32 %20, %21
  %23 = and i32 %20, 255
  %24 = lshr i32 %22, 8
  %25 = urem i32 %24, 50
  %26 = udiv i32 %22, 12800
  %27 = icmp ult i32 %23, 128
  br i1 %27, label %concatenate.pivot.64.65, label %concatenate.pivot.192.68

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %concatenate.16.merge39.1
  %28 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  br i1 %28, label %reduction_write_output-true, label %common.ret

concatenate.pivot.192.68.1:                       ; preds = %concatenate.16.merge39
  %29 = icmp ult i32 %88, 192
  %30 = zext i32 %91 to i64
  %31 = zext i32 %90 to i64
  br i1 %29, label %concatenate.pivot.128.69.1, label %concatenate.pivot.192.70.1

concatenate.pivot.192.70.1:                       ; preds = %concatenate.pivot.192.68.1
  %32 = add nsw i32 %88, -192
  %33 = getelementptr [4 x [8192 x [1 x [50 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %30, i64 0, i64 %31
  %Arg_1.259.1110 = getelementptr inbounds float, ptr addrspace(1) %33, i64 1228800
  %34 = zext i32 %32 to i64
  %35 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %30, i64 %34
  %Arg_0.161.1111 = getelementptr inbounds float, ptr addrspace(1) %35, i64 1572864
  br label %concatenate.16.merge39.1

concatenate.pivot.128.69.1:                       ; preds = %concatenate.pivot.192.68.1
  %36 = add nsw i32 %88, -128
  %37 = getelementptr [4 x [8192 x [1 x [50 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %30, i64 0, i64 %31
  %Arg_1.253.1112 = getelementptr inbounds float, ptr addrspace(1) %37, i64 819200
  %38 = zext i32 %36 to i64
  %39 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %30, i64 %38
  %Arg_0.155.1113 = getelementptr inbounds float, ptr addrspace(1) %39, i64 1048576
  br label %concatenate.16.merge39.1

concatenate.pivot.64.65.1:                        ; preds = %concatenate.16.merge39
  %40 = icmp ult i32 %88, 64
  br i1 %40, label %concatenate.pivot.0.66.1, label %concatenate.pivot.64.67.1

concatenate.pivot.64.67.1:                        ; preds = %concatenate.pivot.64.65.1
  %41 = add nsw i32 %88, -64
  %42 = zext i32 %91 to i64
  %43 = zext i32 %90 to i64
  %44 = getelementptr [4 x [8192 x [1 x [50 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %42, i64 0, i64 %43
  %Arg_1.247.1114 = getelementptr inbounds float, ptr addrspace(1) %44, i64 409600
  %45 = zext i32 %41 to i64
  %46 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %42, i64 %45
  %Arg_0.149.1115 = getelementptr inbounds float, ptr addrspace(1) %46, i64 524288
  br label %concatenate.16.merge39.1

concatenate.pivot.0.66.1:                         ; preds = %concatenate.pivot.64.65.1
  %47 = zext i32 %91 to i64
  %48 = zext i32 %90 to i64
  %Arg_1.241.1 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %47, i64 0, i64 %48
  %49 = zext i32 %88 to i64
  %Arg_0.143.1 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %47, i64 %49
  br label %concatenate.16.merge39.1

concatenate.16.merge39.1:                         ; preds = %concatenate.pivot.0.66.1, %concatenate.pivot.64.67.1, %concatenate.pivot.128.69.1, %concatenate.pivot.192.70.1
  %Arg_0.143.1.sink = phi ptr addrspace(1) [ %Arg_0.143.1, %concatenate.pivot.0.66.1 ], [ %Arg_0.149.1115, %concatenate.pivot.64.67.1 ], [ %Arg_0.155.1113, %concatenate.pivot.128.69.1 ], [ %Arg_0.161.1111, %concatenate.pivot.192.70.1 ]
  %Arg_1.242.1.sink.in = phi ptr addrspace(1) [ %Arg_1.241.1, %concatenate.pivot.0.66.1 ], [ %Arg_1.247.1114, %concatenate.pivot.64.67.1 ], [ %Arg_1.253.1112, %concatenate.pivot.128.69.1 ], [ %Arg_1.259.1110, %concatenate.pivot.192.70.1 ]
  %Arg_1.242.1.sink = load float, ptr addrspace(1) %Arg_1.242.1.sink.in, align 4, !invariant.load !23
  %Arg_0.144.1 = load float, ptr addrspace(1) %Arg_0.143.1.sink, align 4, !invariant.load !23
  %multiply.745.1 = fmul float %Arg_1.242.1.sink, %Arg_0.144.1
  %50 = getelementptr float, ptr addrspace(1) %arg3106, i64 %83
  %51 = getelementptr inbounds float, ptr addrspace(1) %50, i64 32
  store float %multiply.745.1, ptr addrspace(1) %51, align 4
  %52 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i97.1, i32 16, i32 31)
  %add.23.i = fadd float %add.23.i97.1, %52
  %53 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i, i32 8, i32 31)
  %add.23.i93 = fadd float %add.23.i, %53
  %54 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i93, i32 4, i32 31)
  %add.23.i94 = fadd float %add.23.i93, %54
  %55 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i94, i32 2, i32 31)
  %add.23.i95 = fadd float %add.23.i94, %55
  %56 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i95, i32 1, i32 31)
  %57 = icmp eq i32 %2, 0
  %58 = zext i32 %3 to i64
  %59 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i64 0, i64 %58, i64 0, i64 0
  %add.23.i96 = fadd float %add.23.i95, %56
  br i1 %57, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

concatenate.pivot.64.65:                          ; preds = %tile_loop.loop_header27.preheader
  %60 = icmp ult i32 %23, 64
  br i1 %60, label %concatenate.pivot.0.66, label %concatenate.pivot.64.67

concatenate.pivot.0.66:                           ; preds = %concatenate.pivot.64.65
  %61 = zext i32 %26 to i64
  %62 = zext i32 %25 to i64
  %Arg_1.241 = getelementptr inbounds [4 x [8192 x [1 x [50 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %61, i64 0, i64 %62
  %63 = zext i32 %23 to i64
  %Arg_0.143 = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %61, i64 %63
  br label %concatenate.16.merge39

concatenate.pivot.64.67:                          ; preds = %concatenate.pivot.64.65
  %64 = add nsw i32 %23, -64
  %65 = zext i32 %26 to i64
  %66 = zext i32 %25 to i64
  %67 = getelementptr [4 x [8192 x [1 x [50 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %65, i64 0, i64 %66
  %Arg_1.247117 = getelementptr inbounds float, ptr addrspace(1) %67, i64 409600
  %68 = zext i32 %64 to i64
  %69 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %65, i64 %68
  %Arg_0.149118 = getelementptr inbounds float, ptr addrspace(1) %69, i64 524288
  br label %concatenate.16.merge39

concatenate.pivot.192.68:                         ; preds = %tile_loop.loop_header27.preheader
  %70 = icmp ult i32 %23, 192
  %71 = zext i32 %26 to i64
  %72 = zext i32 %25 to i64
  br i1 %70, label %concatenate.pivot.128.69, label %concatenate.pivot.192.70

concatenate.pivot.128.69:                         ; preds = %concatenate.pivot.192.68
  %73 = add nsw i32 %23, -128
  %74 = getelementptr [4 x [8192 x [1 x [50 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %71, i64 0, i64 %72
  %Arg_1.253119 = getelementptr inbounds float, ptr addrspace(1) %74, i64 819200
  %75 = zext i32 %73 to i64
  %76 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %71, i64 %75
  %Arg_0.155120 = getelementptr inbounds float, ptr addrspace(1) %76, i64 1048576
  br label %concatenate.16.merge39

concatenate.pivot.192.70:                         ; preds = %concatenate.pivot.192.68
  %77 = add nsw i32 %23, -192
  %78 = getelementptr [4 x [8192 x [1 x [50 x float]]]], ptr addrspace(1) %arg1102, i64 0, i64 0, i64 %71, i64 0, i64 %72
  %Arg_1.259121 = getelementptr inbounds float, ptr addrspace(1) %78, i64 1228800
  %79 = zext i32 %77 to i64
  %80 = getelementptr [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg0100, i64 0, i64 0, i64 %71, i64 %79
  %Arg_0.161122 = getelementptr inbounds float, ptr addrspace(1) %80, i64 1572864
  br label %concatenate.16.merge39

concatenate.16.merge39:                           ; preds = %concatenate.pivot.192.70, %concatenate.pivot.128.69, %concatenate.pivot.64.67, %concatenate.pivot.0.66
  %Arg_0.161.sink = phi ptr addrspace(1) [ %Arg_0.161122, %concatenate.pivot.192.70 ], [ %Arg_0.155120, %concatenate.pivot.128.69 ], [ %Arg_0.149118, %concatenate.pivot.64.67 ], [ %Arg_0.143, %concatenate.pivot.0.66 ]
  %Arg_1.260.sink.in = phi ptr addrspace(1) [ %Arg_1.259121, %concatenate.pivot.192.70 ], [ %Arg_1.253119, %concatenate.pivot.128.69 ], [ %Arg_1.247117, %concatenate.pivot.64.67 ], [ %Arg_1.241, %concatenate.pivot.0.66 ]
  %Arg_1.260.sink = load float, ptr addrspace(1) %Arg_1.260.sink.in, align 4, !invariant.load !23
  %Arg_0.162 = load float, ptr addrspace(1) %Arg_0.161.sink, align 4, !invariant.load !23
  %multiply.763 = fmul float %Arg_1.260.sink, %Arg_0.162
  %81 = getelementptr inbounds float, ptr addrspace(1) %arg3106, i64 %16
  store float %multiply.763, ptr addrspace(1) %81, align 4
  %x_loc32.1 = or i32 %2, 32
  %Arg_0.133.1124 = getelementptr inbounds float, ptr addrspace(1) %Arg_0.133, i64 32
  %Arg_0.134.1 = load float, ptr addrspace(1) %Arg_0.133.1124, align 4, !invariant.load !23
  %82 = zext i32 %7 to i64
  %83 = add i64 %15, %82
  %84 = getelementptr float, ptr addrspace(1) %arg2104, i64 %83
  %Arg_2.335.1126 = getelementptr inbounds float, ptr addrspace(1) %84, i64 32
  %Arg_2.336.1 = load float, ptr addrspace(1) %Arg_2.335.1126, align 4, !invariant.load !23
  %multiply.1837.1 = fmul float %Arg_0.134.1, %Arg_2.336.1
  %add.23.i97.1 = fadd float %add.23.i97, %multiply.1837.1
  %85 = or i32 %17, %x_loc32.1
  %86 = add nuw nsw i32 %85, %19
  %87 = add nuw nsw i32 %86, %21
  %88 = and i32 %86, 255
  %89 = lshr i32 %87, 8
  %90 = urem i32 %89, 50
  %91 = udiv i32 %87, 12800
  %92 = icmp ult i32 %88, 128
  br i1 %92, label %concatenate.pivot.64.65.1, label %concatenate.pivot.192.68.1

intra_warp_reduce_write-true:                     ; preds = %concatenate.16.merge39.1
  store float %add.23.i96, ptr addrspace(3) %59, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %.frozen = freeze i32 %5
  %93 = udiv i32 %.frozen, 50
  %94 = mul i32 %93, 50
  %.decomposed = sub i32 %.frozen, %94
  %95 = and i32 %93, 8191
  %96 = zext i32 %95 to i64
  %97 = zext i32 %.decomposed to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg4108, i64 0, i64 %13, i64 %96, i64 %97
  %output.then.val = load float, ptr addrspace(3) %59, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

; Function Attrs: nounwind
define void @fusion_11(ptr noalias nocapture readonly align 16 dereferenceable(6553600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg1, ptr noalias nocapture writeonly align 128 dereferenceable(131072) %arg2) local_unnamed_addr #2 {
entry:
  %arg248 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg146 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg044 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !24
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !26
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
  %Arg_1.213 = load float, ptr addrspace(1) %Arg_1.212, align 4, !invariant.load !23
  %Arg_0.115 = load float, ptr addrspace(1) %Arg_0.114, align 4, !invariant.load !23
  %multiply.416 = fmul float %Arg_1.213, %Arg_0.115
  %add.10.i41 = fadd float %multiply.416, 0.000000e+00
  %x_loc11.1 = or i32 %2, 32
  %10 = icmp ult i32 %x_loc11.1, 50
  br i1 %10, label %x_in_tile-true.1, label %x_in_tile-after.15

common.ret:                                       ; preds = %intra_warp_reduce_write-after, %reduction_write_output-true, %entry
  ret void

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %x_in_tile-after.15
  %11 = icmp eq i32 %2, 0
  tail call void @llvm.nvvm.barrier0()
  %12 = lshr i32 %5, 13
  %13 = zext i32 %12 to i64
  %14 = and i32 %5, 8191
  %15 = zext i32 %14 to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x float]], ptr addrspace(1) %arg248, i64 0, i64 %13, i64 %15
  br i1 %11, label %reduction_write_output-true, label %common.ret

x_in_tile-true.1:                                 ; preds = %tile_loop.loop_header6.preheader
  %16 = zext i32 %7 to i64
  %17 = zext i32 %2 to i64
  %18 = add i64 %17, %16
  %19 = getelementptr float, ptr addrspace(1) %arg044, i64 %18
  %Arg_0.114.151 = getelementptr inbounds float, ptr addrspace(1) %19, i64 32
  %20 = getelementptr float, ptr addrspace(1) %arg146, i64 %18
  %Arg_1.212.153 = getelementptr inbounds float, ptr addrspace(1) %20, i64 32
  %Arg_1.213.1 = load float, ptr addrspace(1) %Arg_1.212.153, align 4, !invariant.load !23
  %Arg_0.115.1 = load float, ptr addrspace(1) %Arg_0.114.151, align 4, !invariant.load !23
  %multiply.416.1 = fmul float %Arg_1.213.1, %Arg_0.115.1
  %add.10.i41.1 = fadd float %add.10.i41, %multiply.416.1
  br label %x_in_tile-after.15

x_in_tile-after.15:                               ; preds = %x_in_tile-true.1, %tile_loop.loop_header6.preheader
  %partial_reduction_result.1.1 = phi float [ %add.10.i41.1, %x_in_tile-true.1 ], [ %add.10.i41, %tile_loop.loop_header6.preheader ]
  %21 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result.1.1, i32 16, i32 31)
  %add.10.i = fadd float %partial_reduction_result.1.1, %21
  %22 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i, i32 8, i32 31)
  %add.10.i37 = fadd float %add.10.i, %22
  %23 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i37, i32 4, i32 31)
  %add.10.i38 = fadd float %add.10.i37, %23
  %24 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i38, i32 2, i32 31)
  %add.10.i39 = fadd float %add.10.i38, %24
  %25 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.10.i39, i32 1, i32 31)
  %26 = icmp eq i32 %2, 0
  %27 = zext i32 %3 to i64
  %28 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i64 0, i64 %27, i64 0, i64 0
  %add.10.i40 = fadd float %add.10.i39, %25
  br i1 %26, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-true:                     ; preds = %x_in_tile-after.15
  store float %add.10.i40, ptr addrspace(3) %28, align 4
  br label %intra_warp_reduce_write-after

reduction_write_output-true:                      ; preds = %intra_warp_reduce_write-after
  %output.then.val = load float, ptr addrspace(3) %28, align 4
  store float %output.then.val, ptr addrspace(1) %output_element_address, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_10(ptr noalias nocapture readonly align 16 dereferenceable(6553600) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(131072) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(6553600) %arg4) local_unnamed_addr #0 {
entry:
  %arg418 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg316 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg214 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg112 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg010 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !27
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %linear_index3 = or i32 %linear_index_base, 3
  %4 = udiv i32 %linear_index3, 50
  %linear_index2 = or i32 %linear_index_base, 2
  %5 = udiv i32 %linear_index2, 50
  %6 = udiv i32 %linear_index_base, 50
  %7 = load float, ptr addrspace(1) %arg214, align 16, !invariant.load !23
  %8 = zext i32 %linear_index_base to i64
  %9 = getelementptr float, ptr addrspace(1) %arg316, i64 %8
  %10 = load <4 x float>, ptr addrspace(1) %9, align 16, !invariant.load !23
  %11 = extractelement <4 x float> %10, i32 0
  %12 = extractelement <4 x float> %10, i32 1
  %13 = extractelement <4 x float> %10, i32 2
  %14 = extractelement <4 x float> %10, i32 3
  %15 = zext i32 %6 to i64
  %16 = getelementptr inbounds float, ptr addrspace(1) %arg112, i64 %15
  %17 = load float, ptr addrspace(1) %16, align 4, !invariant.load !23
  %subtract.8 = fsub float %11, %17
  %multiply.9 = fmul float %7, %subtract.8
  %18 = getelementptr float, ptr addrspace(1) %arg010, i64 %8
  %19 = load <4 x float>, ptr addrspace(1) %18, align 16, !invariant.load !23
  %20 = extractelement <4 x float> %19, i32 0
  %21 = extractelement <4 x float> %19, i32 1
  %22 = extractelement <4 x float> %19, i32 2
  %23 = extractelement <4 x float> %19, i32 3
  %multiply.10 = fmul float %20, %multiply.9
  %24 = getelementptr float, ptr addrspace(1) %arg418, i64 %8
  %subtract.81 = fsub float %12, %17
  %multiply.92 = fmul float %7, %subtract.81
  %multiply.103 = fmul float %21, %multiply.92
  %25 = zext i32 %5 to i64
  %26 = getelementptr inbounds float, ptr addrspace(1) %arg112, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !23
  %subtract.84 = fsub float %13, %27
  %multiply.95 = fmul float %7, %subtract.84
  %multiply.106 = fmul float %22, %multiply.95
  %28 = zext i32 %4 to i64
  %29 = getelementptr inbounds float, ptr addrspace(1) %arg112, i64 %28
  %30 = load float, ptr addrspace(1) %29, align 4, !invariant.load !23
  %subtract.87 = fsub float %14, %30
  %multiply.98 = fmul float %7, %subtract.87
  %multiply.109 = fmul float %23, %multiply.98
  %31 = insertelement <4 x float> poison, float %multiply.10, i32 0
  %32 = insertelement <4 x float> %31, float %multiply.103, i32 1
  %33 = insertelement <4 x float> %32, float %multiply.106, i32 2
  %34 = insertelement <4 x float> %33, float %multiply.109, i32 3
  store <4 x float> %34, ptr addrspace(1) %24, align 16
  ret void
}

; Function Attrs: nounwind
define void @fusion_9(ptr noalias nocapture readonly align 16 dereferenceable(8388608) %arg0, ptr noalias nocapture readonly align 128 dereferenceable(6553600) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(419430400) %arg2, ptr noalias nocapture writeonly align 128 dereferenceable(419430400) %arg3, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg4) local_unnamed_addr #2 {
entry:
  %arg4142 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg3140 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg2138 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg1136 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg0134 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %thread_id.x = and i32 %1, 31
  %thread_id.y107 = lshr i32 %1, 5
  %2 = shl nuw nsw i32 %thread_id.x, 1
  %3 = mul nuw nsw i32 %0, 3200
  %4 = add nuw nsw i32 %thread_id.y107, -32
  %5 = shl nuw nsw i32 %thread_id.y107, 6
  %6 = add i32 %3, %5
  %7 = add i32 %6, %2
  %8 = add i32 %7, 1
  %9 = lshr i32 %8, 6
  %10 = shl nuw nsw i32 %9, 6
  %11 = add i32 %10, 1
  %12 = zext i32 %7 to i64
  %13 = add nuw nsw i64 %12, 1
  %14 = lshr i64 %13, 6
  %15 = shl nuw nsw i64 %14, 8
  %16 = trunc i32 %1 to i5
  %17 = zext i5 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add i64 %15, %18
  %20 = add i64 %19, 4
  %scevgep = getelementptr i8, ptr addrspace(1) %arg2138, i64 %20
  %21 = shl nuw nsw i64 %14, 2
  %scevgep173 = getelementptr i8, ptr addrspace(1) %arg1136, i64 %21
  %22 = lshr i32 %7, 6
  %23 = shl nuw nsw i32 %22, 6
  %24 = lshr i64 %12, 6
  %25 = shl nuw nsw i64 %24, 2
  %scevgep183 = getelementptr i8, ptr addrspace(1) %arg1136, i64 %25
  %26 = shl nuw nsw i64 %24, 8
  %27 = add i64 %26, %18
  %scevgep191 = getelementptr i8, ptr addrspace(1) %arg2138, i64 %27
  br label %y_in_tile.loop_body

common.ret:                                       ; preds = %reduction_write_output-after, %reduction_write_output-true99
  ret void

y_in_tile.loop_body:                              ; preds = %entry, %concatenate.16.merge35
  %lsr.iv192 = phi ptr addrspace(1) [ %scevgep191, %entry ], [ %scevgep193, %concatenate.16.merge35 ]
  %lsr.iv188 = phi i64 [ %24, %entry ], [ %lsr.iv.next189, %concatenate.16.merge35 ]
  %lsr.iv186 = phi i64 [ %12, %entry ], [ %lsr.iv.next187, %concatenate.16.merge35 ]
  %lsr.iv184 = phi ptr addrspace(1) [ %scevgep183, %entry ], [ %scevgep185, %concatenate.16.merge35 ]
  %lsr.iv181 = phi i32 [ %22, %entry ], [ %lsr.iv.next182, %concatenate.16.merge35 ]
  %lsr.iv174 = phi ptr addrspace(1) [ %scevgep173, %entry ], [ %scevgep175, %concatenate.16.merge35 ]
  %lsr.iv170 = phi i64 [ %14, %entry ], [ %lsr.iv.next171, %concatenate.16.merge35 ]
  %lsr.iv168 = phi i64 [ %13, %entry ], [ %lsr.iv.next169, %concatenate.16.merge35 ]
  %lsr.iv166 = phi ptr addrspace(1) [ %scevgep, %entry ], [ %scevgep167, %concatenate.16.merge35 ]
  %lsr.iv164 = phi i32 [ %9, %entry ], [ %lsr.iv.next165, %concatenate.16.merge35 ]
  %lsr.iv160 = phi i32 [ 0, %entry ], [ %lsr.iv.next161, %concatenate.16.merge35 ]
  %lsr.iv = phi i32 [ %4, %entry ], [ %lsr.iv.next, %concatenate.16.merge35 ]
  %partial_reduction_result106.sroa.0.0131 = phi float [ 0.000000e+00, %entry ], [ %add.23.i, %concatenate.16.merge35 ]
  %partial_reduction_result106.sroa.4.0130 = phi float [ 0.000000e+00, %entry ], [ %add.23.i129, %concatenate.16.merge35 ]
  %lsr197 = trunc i64 %lsr.iv168 to i32
  %lsr195 = trunc i64 %lsr.iv186 to i32
  %28 = udiv i32 %lsr197, 3200
  %29 = trunc i32 %28 to i13
  %30 = zext i13 %29 to i32
  %31 = mul nuw nsw i32 %30, 3200
  %32 = add i32 %11, %31
  %33 = udiv i32 %lsr.iv164, 50
  %34 = mul nuw nsw i32 %33, 3200
  %35 = sub i32 %32, %34
  %36 = udiv i32 %lsr197, 26214400
  %37 = mul nuw nsw i32 %36, 26214400
  %38 = add i32 %11, %37
  %39 = add i32 %38, %31
  %40 = sub i32 %39, %34
  %41 = udiv i64 %lsr.iv168, 26214400
  %42 = mul nuw nsw i64 %41, 104857600
  %43 = zext i13 %29 to i64
  %44 = mul nuw nsw i64 %43, 12800
  %45 = add i64 %42, %44
  %46 = udiv i64 %lsr.iv170, 50
  %47 = mul nuw nsw i64 %46, 12800
  %48 = sub i64 %45, %47
  %scevgep172 = getelementptr i8, ptr addrspace(1) %lsr.iv166, i64 %48
  %49 = mul nuw nsw i64 %41, 1638400
  %50 = mul nuw nsw i64 %43, 200
  %51 = add i64 %49, %50
  %52 = mul nuw nsw i64 %46, 200
  %53 = sub i64 %51, %52
  %scevgep176 = getelementptr i8, ptr addrspace(1) %lsr.iv174, i64 %53
  %54 = udiv i32 %lsr195, 3200
  %55 = trunc i32 %54 to i13
  %56 = zext i13 %55 to i32
  %57 = mul nuw nsw i32 %56, 3200
  %58 = add i32 %23, %57
  %59 = udiv i32 %lsr.iv181, 50
  %60 = mul nuw nsw i32 %59, 3200
  %61 = sub i32 %58, %60
  %62 = udiv i32 %lsr195, 26214400
  %63 = mul nuw nsw i32 %62, 26214400
  %64 = add i32 %23, %63
  %65 = add i32 %64, %57
  %66 = sub i32 %65, %60
  %67 = udiv i64 %lsr.iv186, 26214400
  %68 = mul nuw nsw i64 %67, 1638400
  %69 = zext i13 %55 to i64
  %70 = mul nuw nsw i64 %69, 200
  %71 = add i64 %68, %70
  %72 = udiv i64 %lsr.iv188, 50
  %73 = mul nuw nsw i64 %72, 200
  %74 = sub i64 %71, %73
  %scevgep190 = getelementptr i8, ptr addrspace(1) %lsr.iv184, i64 %74
  %75 = mul nuw nsw i64 %67, 104857600
  %76 = mul nuw nsw i64 %69, 12800
  %77 = add i64 %75, %76
  %78 = mul nuw nsw i64 %72, 12800
  %79 = sub i64 %77, %78
  %scevgep194 = getelementptr i8, ptr addrspace(1) %lsr.iv192, i64 %79
  %Arg_1.23 = load float, ptr addrspace(1) %scevgep190, align 4, !invariant.load !23
  %Arg_2.34 = load float, ptr addrspace(1) %scevgep194, align 8, !invariant.load !23
  %multiply.18 = fmul float %Arg_1.23, %Arg_2.34
  %add.23.i = fadd float %partial_reduction_result106.sroa.0.0131, %multiply.18
  %80 = add i32 %2, %lsr.iv160
  %81 = add i32 %80, %61
  %82 = add i32 %80, %66
  %83 = and i32 %81, 255
  %84 = lshr i32 %82, 8
  %85 = urem i32 %84, 50
  %86 = udiv i32 %82, 12800
  %87 = icmp ult i32 %83, 128
  br i1 %87, label %concatenate.pivot.64., label %concatenate.pivot.192.

y_in_tile.loop_exit:                              ; preds = %concatenate.16.merge35
  %88 = zext i32 %thread_id.x to i64
  %89 = zext i32 %thread_id.y107 to i64
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %88, i64 %89
  store float %add.23.i, ptr addrspace(3) %shmem_output_address, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i64 0, i64 0, i64 0, i64 %89, i64 %88
  %partial_reduction_result67 = load float, ptr addrspace(3) %shmem_transposed_addr, align 4
  %90 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 16, i32 31)
  %add.23.i119 = fadd float %partial_reduction_result67, %90
  %91 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i119, i32 8, i32 31)
  %add.23.i120 = fadd float %add.23.i119, %91
  %92 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i120, i32 4, i32 31)
  %add.23.i121 = fadd float %add.23.i120, %92
  %93 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i121, i32 2, i32 31)
  %add.23.i122 = fadd float %add.23.i121, %93
  %94 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i122, i32 1, i32 31)
  %add.23.i123 = fadd float %add.23.i122, %94
  store float %add.23.i123, ptr addrspace(3) %shmem_transposed_addr, align 4
  %95 = shl nuw nsw i32 %thread_id.y107, 1
  %96 = icmp eq i32 %thread_id.x, 0
  %97 = lshr i32 %0, 13
  %98 = zext i32 %97 to i64
  %99 = and i32 %0, 8191
  %100 = zext i32 %99 to i64
  %101 = zext i32 %95 to i64
  %output_element_address = getelementptr inbounds [4 x [8192 x [64 x float]]], ptr addrspace(1) %arg4142, i64 0, i64 %98, i64 %100, i64 %101
  br i1 %96, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %102 = icmp eq i32 %thread_id.x, 0
  %shmem_output_address81144 = getelementptr inbounds float, ptr addrspace(3) %shmem_output_address, i64 1056
  store float %add.23.i129, ptr addrspace(3) %shmem_output_address81144, align 4
  tail call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83145 = getelementptr inbounds float, ptr addrspace(3) %shmem_transposed_addr, i64 1056
  %partial_reduction_result85 = load float, ptr addrspace(3) %shmem_transposed_addr83145, align 4
  %103 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  %add.23.i124 = fadd float %partial_reduction_result85, %103
  %104 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i124, i32 8, i32 31)
  %add.23.i125 = fadd float %add.23.i124, %104
  %105 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i125, i32 4, i32 31)
  %add.23.i126 = fadd float %add.23.i125, %105
  %106 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i126, i32 2, i32 31)
  %add.23.i127 = fadd float %add.23.i126, %106
  %107 = tail call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %add.23.i127, i32 1, i32 31)
  %add.23.i128 = fadd float %add.23.i127, %107
  store float %add.23.i128, ptr addrspace(3) %shmem_transposed_addr83145, align 4
  br i1 %102, label %reduction_write_output-true99, label %common.ret

concatenate.pivot.64.:                            ; preds = %y_in_tile.loop_body
  %108 = icmp ult i32 %83, 64
  br i1 %108, label %concatenate.pivot.0., label %concatenate.pivot.64.23

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  %109 = zext i32 %86 to i64
  %110 = zext i32 %85 to i64
  %Arg_1.25 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg1136, i64 0, i64 0, i64 %109, i64 %110
  %Arg_1.26 = load float, ptr addrspace(1) %Arg_1.25, align 4, !invariant.load !23
  %111 = zext i32 %83 to i64
  %Arg_0.1 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0134, i64 0, i64 0, i64 %109, i64 0, i64 %111
  %Arg_0.17 = load float, ptr addrspace(1) %Arg_0.1, align 8, !invariant.load !23
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  br label %concatenate.16.merge

concatenate.pivot.64.23:                          ; preds = %concatenate.pivot.64.
  %112 = add nsw i32 %83, -64
  %113 = zext i32 %86 to i64
  %114 = zext i32 %85 to i64
  %115 = getelementptr [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg1136, i64 0, i64 0, i64 %113, i64 %114
  %Arg_1.28146 = getelementptr inbounds float, ptr addrspace(1) %115, i64 409600
  %Arg_1.29 = load float, ptr addrspace(1) %Arg_1.28146, align 4, !invariant.load !23
  %116 = zext i32 %112 to i64
  %117 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0134, i64 0, i64 0, i64 %113, i64 0, i64 %116
  %Arg_0.110147 = getelementptr inbounds float, ptr addrspace(1) %117, i64 524288
  %Arg_0.111 = load float, ptr addrspace(1) %Arg_0.110147, align 4, !invariant.load !23
  %multiply.712 = fmul float %Arg_1.29, %Arg_0.111
  br label %concatenate.16.merge

concatenate.pivot.192.:                           ; preds = %y_in_tile.loop_body
  %118 = icmp ult i32 %83, 192
  %119 = zext i32 %86 to i64
  %120 = zext i32 %85 to i64
  br i1 %118, label %concatenate.pivot.128.24, label %concatenate.pivot.192.25

concatenate.pivot.128.24:                         ; preds = %concatenate.pivot.192.
  %121 = add nsw i32 %83, -128
  %122 = getelementptr [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg1136, i64 0, i64 0, i64 %119, i64 %120
  %Arg_1.213148 = getelementptr inbounds float, ptr addrspace(1) %122, i64 819200
  %Arg_1.214 = load float, ptr addrspace(1) %Arg_1.213148, align 4, !invariant.load !23
  %123 = zext i32 %121 to i64
  %124 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0134, i64 0, i64 0, i64 %119, i64 0, i64 %123
  %Arg_0.115149 = getelementptr inbounds float, ptr addrspace(1) %124, i64 1048576
  %Arg_0.116 = load float, ptr addrspace(1) %Arg_0.115149, align 4, !invariant.load !23
  %multiply.717 = fmul float %Arg_1.214, %Arg_0.116
  br label %concatenate.16.merge

concatenate.pivot.192.25:                         ; preds = %concatenate.pivot.192.
  %125 = add nsw i32 %83, -192
  %126 = getelementptr [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg1136, i64 0, i64 0, i64 %119, i64 %120
  %Arg_1.218150 = getelementptr inbounds float, ptr addrspace(1) %126, i64 1228800
  %Arg_1.219 = load float, ptr addrspace(1) %Arg_1.218150, align 4, !invariant.load !23
  %127 = zext i32 %125 to i64
  %128 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0134, i64 0, i64 0, i64 %119, i64 0, i64 %127
  %Arg_0.120151 = getelementptr inbounds float, ptr addrspace(1) %128, i64 1572864
  %Arg_0.121 = load float, ptr addrspace(1) %Arg_0.120151, align 4, !invariant.load !23
  %multiply.722 = fmul float %Arg_1.219, %Arg_0.121
  br label %concatenate.16.merge

concatenate.16.merge:                             ; preds = %concatenate.pivot.192.25, %concatenate.pivot.128.24, %concatenate.pivot.64.23, %concatenate.pivot.0.
  %129 = phi float [ %multiply.7, %concatenate.pivot.0. ], [ %multiply.712, %concatenate.pivot.64.23 ], [ %multiply.717, %concatenate.pivot.128.24 ], [ %multiply.722, %concatenate.pivot.192.25 ]
  %130 = zext i32 %84 to i64
  %131 = zext i32 %83 to i64
  %132 = getelementptr inbounds [409600 x [256 x float]], ptr addrspace(1) %arg3140, i64 0, i64 %130, i64 %131
  store float %129, ptr addrspace(1) %132, align 8
  %Arg_1.230 = load float, ptr addrspace(1) %scevgep176, align 4, !invariant.load !23
  %Arg_2.332 = load float, ptr addrspace(1) %scevgep172, align 4, !invariant.load !23
  %multiply.1833 = fmul float %Arg_1.230, %Arg_2.332
  %add.23.i129 = fadd float %partial_reduction_result106.sroa.4.0130, %multiply.1833
  %133 = add i32 %80, %35
  %134 = add i32 %80, %40
  %135 = and i32 %133, 255
  %136 = lshr i32 %134, 8
  %137 = urem i32 %136, 50
  %138 = udiv i32 %134, 12800
  %139 = icmp ult i32 %135, 128
  br i1 %139, label %concatenate.pivot.64.61, label %concatenate.pivot.192.64

concatenate.pivot.64.61:                          ; preds = %concatenate.16.merge
  %140 = icmp ult i32 %135, 64
  br i1 %140, label %concatenate.pivot.0.62, label %concatenate.pivot.64.63

concatenate.pivot.0.62:                           ; preds = %concatenate.pivot.64.61
  %141 = zext i32 %138 to i64
  %142 = zext i32 %137 to i64
  %Arg_1.237 = getelementptr inbounds [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg1136, i64 0, i64 0, i64 %141, i64 %142
  %143 = zext i32 %135 to i64
  %Arg_0.139 = getelementptr inbounds [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0134, i64 0, i64 0, i64 %141, i64 0, i64 %143
  br label %concatenate.16.merge35

concatenate.pivot.64.63:                          ; preds = %concatenate.pivot.64.61
  %144 = add nsw i32 %135, -64
  %145 = zext i32 %138 to i64
  %146 = zext i32 %137 to i64
  %147 = getelementptr [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg1136, i64 0, i64 0, i64 %145, i64 %146
  %Arg_1.243153 = getelementptr inbounds float, ptr addrspace(1) %147, i64 409600
  %148 = zext i32 %144 to i64
  %149 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0134, i64 0, i64 0, i64 %145, i64 0, i64 %148
  %Arg_0.145154 = getelementptr inbounds float, ptr addrspace(1) %149, i64 524288
  br label %concatenate.16.merge35

concatenate.pivot.192.64:                         ; preds = %concatenate.16.merge
  %150 = icmp ult i32 %135, 192
  %151 = zext i32 %138 to i64
  %152 = zext i32 %137 to i64
  br i1 %150, label %concatenate.pivot.128.65, label %concatenate.pivot.192.66

concatenate.pivot.128.65:                         ; preds = %concatenate.pivot.192.64
  %153 = add nsw i32 %135, -128
  %154 = getelementptr [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg1136, i64 0, i64 0, i64 %151, i64 %152
  %Arg_1.249155 = getelementptr inbounds float, ptr addrspace(1) %154, i64 819200
  %155 = zext i32 %153 to i64
  %156 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0134, i64 0, i64 0, i64 %151, i64 0, i64 %155
  %Arg_0.151156 = getelementptr inbounds float, ptr addrspace(1) %156, i64 1048576
  br label %concatenate.16.merge35

concatenate.pivot.192.66:                         ; preds = %concatenate.pivot.192.64
  %157 = add nsw i32 %135, -192
  %158 = getelementptr [4 x [8192 x [50 x float]]], ptr addrspace(1) %arg1136, i64 0, i64 0, i64 %151, i64 %152
  %Arg_1.255157 = getelementptr inbounds float, ptr addrspace(1) %158, i64 1228800
  %159 = zext i32 %157 to i64
  %160 = getelementptr [4 x [8192 x [1 x [64 x float]]]], ptr addrspace(1) %arg0134, i64 0, i64 0, i64 %151, i64 0, i64 %159
  %Arg_0.157158 = getelementptr inbounds float, ptr addrspace(1) %160, i64 1572864
  br label %concatenate.16.merge35

concatenate.16.merge35:                           ; preds = %concatenate.pivot.192.66, %concatenate.pivot.128.65, %concatenate.pivot.64.63, %concatenate.pivot.0.62
  %Arg_0.157.sink = phi ptr addrspace(1) [ %Arg_0.157158, %concatenate.pivot.192.66 ], [ %Arg_0.151156, %concatenate.pivot.128.65 ], [ %Arg_0.145154, %concatenate.pivot.64.63 ], [ %Arg_0.139, %concatenate.pivot.0.62 ]
  %Arg_1.256.sink.in = phi ptr addrspace(1) [ %Arg_1.255157, %concatenate.pivot.192.66 ], [ %Arg_1.249155, %concatenate.pivot.128.65 ], [ %Arg_1.243153, %concatenate.pivot.64.63 ], [ %Arg_1.237, %concatenate.pivot.0.62 ]
  %Arg_1.256.sink = load float, ptr addrspace(1) %Arg_1.256.sink.in, align 4, !invariant.load !23
  %Arg_0.158 = load float, ptr addrspace(1) %Arg_0.157.sink, align 4, !invariant.load !23
  %multiply.759 = fmul float %Arg_1.256.sink, %Arg_0.158
  %161 = zext i32 %136 to i64
  %162 = zext i32 %135 to i64
  %163 = getelementptr inbounds [409600 x [256 x float]], ptr addrspace(1) %arg3140, i64 0, i64 %161, i64 %162
  store float %multiply.759, ptr addrspace(1) %163, align 4
  %lsr.iv.next = add nsw i32 %lsr.iv, 32
  %lsr.iv.next161 = add nuw nsw i32 %lsr.iv160, 2048
  %lsr.iv.next169 = add nuw nsw i64 %lsr.iv168, 2048
  %lsr.iv.next165 = add nuw nsw i32 %lsr.iv164, 32
  %scevgep167 = getelementptr i8, ptr addrspace(1) %lsr.iv166, i64 8192
  %lsr.iv.next171 = add nuw nsw i64 %lsr.iv170, 32
  %scevgep175 = getelementptr i8, ptr addrspace(1) %lsr.iv174, i64 128
  %lsr.iv.next187 = add nuw nsw i64 %lsr.iv186, 2048
  %lsr.iv.next182 = add nuw nsw i32 %lsr.iv181, 32
  %scevgep185 = getelementptr i8, ptr addrspace(1) %lsr.iv184, i64 128
  %lsr.iv.next189 = add nuw nsw i64 %lsr.iv188, 32
  %scevgep193 = getelementptr i8, ptr addrspace(1) %lsr.iv192, i64 8192
  %164 = icmp ugt i32 %lsr.iv.next, 17
  br i1 %164, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  store float %add.23.i123, ptr addrspace(1) %output_element_address, align 8
  br label %reduction_write_output-after

reduction_write_output-true99:                    ; preds = %reduction_write_output-after
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %output_element_address, i64 4
  store float %add.23.i128, ptr addrspace(1) %sunkaddr, align 4
  br label %common.ret
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define void @fusion_6(ptr noalias nocapture readonly align 128 dereferenceable(8388608) %arg0, ptr noalias nocapture writeonly align 128 dereferenceable(8388608) %arg1) local_unnamed_addr #5 {
entry:
  %arg151 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg049 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %1 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
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
  %29 = load float, ptr addrspace(1) %.in, align 4, !invariant.load !23
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
  %52 = load float, ptr addrspace(1) %.in46, align 4, !invariant.load !23
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
  %74 = load float, ptr addrspace(1) %.in47, align 4, !invariant.load !23
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
  %96 = load float, ptr addrspace(1) %.in48, align 4, !invariant.load !23
  %97 = getelementptr inbounds float, ptr addrspace(1) %31, i64 3
  store float %96, ptr addrspace(1) %97, align 4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: readwrite)
define void @fusion_5(ptr noalias nocapture readonly align 16 dereferenceable(991232) %arg0, ptr noalias nocapture align 128 dereferenceable(991232) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2) local_unnamed_addr #0 {
entry:
  %arg211 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg19 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg07 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
  %3 = shl nuw nsw i32 %2, 2
  %linear_index_base = or i32 %1, %3
  %4 = zext i32 %linear_index_base to i64
  %5 = getelementptr float, ptr addrspace(1) %arg07, i64 %4
  %6 = load <4 x float>, ptr addrspace(1) %5, align 16, !invariant.load !23
  %7 = extractelement <4 x float> %6, i32 0
  %8 = extractelement <4 x float> %6, i32 1
  %9 = extractelement <4 x float> %6, i32 2
  %10 = extractelement <4 x float> %6, i32 3
  %11 = load float, ptr addrspace(1) %arg211, align 16, !invariant.load !23
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
define void @fusion_13(ptr noalias nocapture readonly align 16 dereferenceable(155648) %arg0, ptr noalias nocapture align 128 dereferenceable(155648) %arg1, ptr noalias nocapture readonly align 16 dereferenceable(4) %arg2, ptr noalias nocapture readonly align 16 dereferenceable(155648) %arg3, ptr noalias nocapture align 128 dereferenceable(155648) %arg4) local_unnamed_addr #0 {
entry:
  %arg49 = addrspacecast ptr %arg4 to ptr addrspace(1)
  %arg37 = addrspacecast ptr %arg3 to ptr addrspace(1)
  %arg25 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %arg13 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %arg01 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !31
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %linear_index = or i32 %1, %2
  %3 = zext i32 %linear_index to i64
  %4 = getelementptr inbounds float, ptr addrspace(1) %arg01, i64 %3
  %5 = load float, ptr addrspace(1) %4, align 4, !invariant.load !23
  %6 = load float, ptr addrspace(1) %arg25, align 16, !invariant.load !23
  %7 = getelementptr inbounds float, ptr addrspace(1) %arg13, i64 %3
  %8 = load float, ptr addrspace(1) %7, align 4
  %multiply.7 = fmul float %6, %8
  %subtract.8 = fsub float %5, %multiply.7
  %9 = getelementptr inbounds float, ptr addrspace(1) %arg37, i64 %3
  %10 = load float, ptr addrspace(1) %9, align 4, !invariant.load !23
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !32
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
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
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !23
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %18 = load float, ptr addrspace(1) %arg121, align 16, !invariant.load !23
  %19 = mul nuw nsw i32 %4, 50
  %20 = add nuw nsw i32 %6, %19
  %21 = zext i32 %20 to i64
  %22 = zext i32 %10 to i64
  %23 = getelementptr [409600 x [152 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %22
  %24 = getelementptr inbounds float, ptr addrspace(1) %23, i64 144
  %25 = load <2 x float>, ptr addrspace(1) %24, align 16, !invariant.load !23
  %26 = extractelement <2 x float> %25, i32 0
  %27 = extractelement <2 x float> %25, i32 1
  %multiply.9 = fmul float %18, %26
  %subtract.10 = fsub float %14, %multiply.9
  %28 = getelementptr float, ptr addrspace(1) %arg325, i64 %11
  %29 = load <4 x float>, ptr addrspace(1) %28, align 16, !invariant.load !23
  %30 = extractelement <4 x float> %29, i32 0
  %31 = extractelement <4 x float> %29, i32 1
  %32 = extractelement <4 x float> %29, i32 2
  %33 = extractelement <4 x float> %29, i32 3
  %34 = getelementptr inbounds float, ptr addrspace(1) %23, i64 136
  %35 = load <2 x float>, ptr addrspace(1) %34, align 16, !invariant.load !23
  %36 = extractelement <2 x float> %35, i32 0
  %37 = extractelement <2 x float> %35, i32 1
  %multiply.12 = fmul float %18, %36
  %subtract.13 = fsub float %30, %multiply.12
  %38 = getelementptr float, ptr addrspace(1) %arg427, i64 %11
  %39 = load <4 x float>, ptr addrspace(1) %38, align 16, !invariant.load !23
  %40 = extractelement <4 x float> %39, i32 0
  %41 = extractelement <4 x float> %39, i32 1
  %42 = extractelement <4 x float> %39, i32 2
  %43 = extractelement <4 x float> %39, i32 3
  %44 = getelementptr inbounds float, ptr addrspace(1) %23, i64 128
  %45 = load <2 x float>, ptr addrspace(1) %44, align 16, !invariant.load !23
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
  %56 = load float, ptr addrspace(1) %55, align 8, !invariant.load !23
  %multiply.97 = fmul float %18, %56
  %subtract.108 = fsub float %16, %multiply.97
  %57 = getelementptr inbounds float, ptr addrspace(1) %54, i64 136
  %58 = load float, ptr addrspace(1) %57, align 8, !invariant.load !23
  %multiply.129 = fmul float %18, %58
  %subtract.1310 = fsub float %32, %multiply.129
  %59 = getelementptr inbounds float, ptr addrspace(1) %54, i64 128
  %60 = load float, ptr addrspace(1) %59, align 8, !invariant.load !23
  %multiply.1511 = fmul float %18, %60
  %subtract.1612 = fsub float %42, %multiply.1511
  %61 = zext i32 %7 to i64
  %62 = getelementptr [409600 x [152 x float]], ptr addrspace(1) %arg223, i64 0, i64 %21, i64 %61
  %63 = getelementptr inbounds float, ptr addrspace(1) %62, i64 144
  %64 = load float, ptr addrspace(1) %63, align 4, !invariant.load !23
  %multiply.913 = fmul float %18, %64
  %subtract.1014 = fsub float %17, %multiply.913
  %65 = getelementptr inbounds float, ptr addrspace(1) %62, i64 136
  %66 = load float, ptr addrspace(1) %65, align 4, !invariant.load !23
  %multiply.1215 = fmul float %18, %66
  %subtract.1316 = fsub float %33, %multiply.1215
  %67 = getelementptr inbounds float, ptr addrspace(1) %62, i64 128
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !23
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
  %0 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !33
  %1 = shl nuw nsw i32 %0, 10
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !22
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
  %13 = load <4 x float>, ptr addrspace(1) %12, align 16, !invariant.load !23
  %14 = extractelement <4 x float> %13, i32 0
  %15 = extractelement <4 x float> %13, i32 1
  %16 = extractelement <4 x float> %13, i32 2
  %17 = extractelement <4 x float> %13, i32 3
  %18 = load float, ptr addrspace(1) %arg115, align 16, !invariant.load !23
  %19 = mul nuw nsw i32 %4, 50
  %20 = add nuw nsw i32 %6, %19
  %21 = zext i32 %20 to i64
  %22 = zext i32 %10 to i64
  %23 = getelementptr inbounds [409600 x [152 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %22
  %24 = load <2 x float>, ptr addrspace(1) %23, align 16, !invariant.load !23
  %25 = extractelement <2 x float> %24, i32 0
  %26 = extractelement <2 x float> %24, i32 1
  %multiply.8 = fmul float %18, %25
  %subtract.9 = fsub float %14, %multiply.8
  %27 = getelementptr float, ptr addrspace(1) %arg319, i64 %11
  %28 = load <4 x float>, ptr addrspace(1) %27, align 16, !invariant.load !23
  %29 = extractelement <4 x float> %28, i32 0
  %30 = extractelement <4 x float> %28, i32 1
  %31 = extractelement <4 x float> %28, i32 2
  %32 = extractelement <4 x float> %28, i32 3
  %33 = getelementptr inbounds float, ptr addrspace(1) %23, i64 64
  %34 = load <2 x float>, ptr addrspace(1) %33, align 16, !invariant.load !23
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
  %43 = load float, ptr addrspace(1) %42, align 8, !invariant.load !23
  %multiply.85 = fmul float %18, %43
  %subtract.96 = fsub float %16, %multiply.85
  %44 = getelementptr inbounds float, ptr addrspace(1) %42, i64 64
  %45 = load float, ptr addrspace(1) %44, align 8, !invariant.load !23
  %multiply.117 = fmul float %18, %45
  %subtract.128 = fsub float %31, %multiply.117
  %46 = zext i32 %7 to i64
  %47 = getelementptr inbounds [409600 x [152 x float]], ptr addrspace(1) %arg217, i64 0, i64 %21, i64 %46
  %48 = load float, ptr addrspace(1) %47, align 4, !invariant.load !23
  %multiply.89 = fmul float %18, %48
  %subtract.910 = fsub float %17, %multiply.89
  %49 = getelementptr inbounds float, ptr addrspace(1) %47, i64 64
  %50 = load float, ptr addrspace(1) %49, align 4, !invariant.load !23
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
attributes #5 = { mustprogress nofree nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19}
!llvm.module.flags = !{!20}

!0 = !{ptr @fusion_15, !"kernel", i32 1}
!1 = !{ptr @fusion_15, !"reqntidx", i32 256}
!2 = !{ptr @fusion_14, !"kernel", i32 1}
!3 = !{ptr @fusion_14, !"reqntidx", i32 96}
!4 = !{ptr @fusion_11, !"kernel", i32 1}
!5 = !{ptr @fusion_11, !"reqntidx", i32 96}
!6 = !{ptr @fusion_10, !"kernel", i32 1}
!7 = !{ptr @fusion_10, !"reqntidx", i32 256}
!8 = !{ptr @fusion_9, !"kernel", i32 1}
!9 = !{ptr @fusion_9, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_6, !"kernel", i32 1}
!11 = !{ptr @fusion_6, !"reqntidx", i32 256}
!12 = !{ptr @fusion_5, !"kernel", i32 1}
!13 = !{ptr @fusion_5, !"reqntidx", i32 256}
!14 = !{ptr @fusion_13, !"kernel", i32 1}
!15 = !{ptr @fusion_13, !"reqntidx", i32 1024}
!16 = !{ptr @fusion, !"kernel", i32 1}
!17 = !{ptr @fusion, !"reqntidx", i32 256}
!18 = !{ptr @fusion_4, !"kernel", i32 1}
!19 = !{ptr @fusion_4, !"reqntidx", i32 256}
!20 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!21 = !{i32 0, i32 2048}
!22 = !{i32 0, i32 256}
!23 = !{}
!24 = !{i32 0, i32 96}
!25 = !{i32 0, i32 546134}
!26 = !{i32 0, i32 10923}
!27 = !{i32 0, i32 1600}
!28 = !{i32 0, i32 32768}
!29 = !{i32 0, i32 1024}
!30 = !{i32 0, i32 242}
!31 = !{i32 0, i32 38}
!32 = !{i32 0, i32 3200}
!33 = !{i32 0, i32 25600}
