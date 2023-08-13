target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache2 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache3 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache4 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache5 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache6 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@3 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache7 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache8 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache9 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache10 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@4 = private unnamed_addr constant [4 x i8] zeroinitializer
@5 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache11 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@8 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache12 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @fusion_32(ptr noalias align 16 dereferenceable(524288) %arg0, ptr noalias align 128 dereferenceable(524288) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index_base, 512
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 512
  %8 = udiv i32 %linear_index1, 512
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 512
  %11 = udiv i32 %linear_index2, 512
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 512
  %14 = udiv i32 %linear_index3, 512
  %15 = icmp ult i32 %linear_index_base, 131072
  br i1 %15, label %fusion_32.in_bounds-true, label %fusion_32.in_bounds-after

fusion_32.in_bounds-after:                        ; preds = %fusion_32.in_bounds-true, %entry
  ret void

fusion_32.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !46
  %18 = load float, ptr %arg2, align 4, !invariant.load !46
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4
  %multiply.5 = fmul float %18, %20
  %subtract.6 = fsub float %17, %multiply.5
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %subtract.6, ptr %21, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %23 = load float, ptr %22, align 4, !invariant.load !46
  %24 = load float, ptr %arg2, align 4, !invariant.load !46
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4
  %multiply.51 = fmul float %24, %26
  %subtract.62 = fsub float %23, %multiply.51
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %subtract.62, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4, !invariant.load !46
  %30 = load float, ptr %arg2, align 4, !invariant.load !46
  %31 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %32 = load float, ptr %31, align 4
  %multiply.53 = fmul float %30, %32
  %subtract.64 = fsub float %29, %multiply.53
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %subtract.64, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %35 = load float, ptr %34, align 4, !invariant.load !46
  %36 = load float, ptr %arg2, align 4, !invariant.load !46
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %multiply.55 = fmul float %36, %38
  %subtract.66 = fsub float %35, %multiply.55
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %subtract.66, ptr %39, align 4
  br label %fusion_32.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_41(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 16 dereferenceable(8388608) %arg1, ptr noalias align 16 dereferenceable(8388608) %arg2, ptr noalias align 16 dereferenceable(8388608) %arg3, ptr noalias align 16 dereferenceable(8388608) %arg4, ptr noalias align 16 dereferenceable(8388608) %arg5, ptr noalias align 16 dereferenceable(8388608) %arg6, ptr noalias align 16 dereferenceable(8388608) %arg7, ptr noalias align 128 dereferenceable(8388608) %arg8, ptr noalias align 16 dereferenceable(8388608) %arg9, ptr noalias align 128 dereferenceable(8388608) %arg10) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !47
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 524288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %linear_index1, 64
  %11 = urem i32 %10, 4
  %12 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 64
  %15 = udiv i32 %linear_index2, 64
  %16 = urem i32 %15, 4
  %17 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 64
  %20 = udiv i32 %linear_index3, 64
  %21 = urem i32 %20, 4
  %22 = udiv i32 %linear_index3, 256
  %23 = icmp ult i32 %linear_index_base, 2097152
  br i1 %23, label %fusion_41.in_bounds-true, label %fusion_41.in_bounds-after

fusion_41.in_bounds-after:                        ; preds = %fusion_41.in_bounds-true, %entry
  ret void

fusion_41.in_bounds-true:                         ; preds = %entry
  %24 = mul nuw nsw i32 %4, 1
  %25 = add nuw nsw i32 0, %24
  %26 = mul nuw nsw i32 %6, 64
  %27 = add nuw nsw i32 %25, %26
  %28 = udiv i32 %27, 256
  %29 = mul nuw nsw i32 %7, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  %32 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  %33 = load float, ptr %32, align 4, !invariant.load !46
  %34 = getelementptr inbounds float, ptr %arg9, i32 %linear_index_base
  %35 = load float, ptr %34, align 4, !invariant.load !46
  %add.11 = fadd float %33, %35
  %36 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %37 = load float, ptr %36, align 4, !invariant.load !46
  %add.12 = fadd float %add.11, %37
  %38 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %39 = load float, ptr %38, align 4, !invariant.load !46
  %add.13 = fadd float %add.12, %39
  %40 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %41 = load float, ptr %40, align 4, !invariant.load !46
  %add.14 = fadd float %add.13, %41
  %42 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %43 = load float, ptr %42, align 4, !invariant.load !46
  %add.15 = fadd float %add.14, %43
  %44 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %45 = load float, ptr %44, align 4, !invariant.load !46
  %add.16 = fadd float %add.15, %45
  %46 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %47 = load float, ptr %46, align 4, !invariant.load !46
  %add.17 = fadd float %add.16, %47
  %48 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %49 = load float, ptr %48, align 4, !invariant.load !46
  %add.18 = fadd float %add.17, %49
  %50 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %51 = load float, ptr %50, align 4, !invariant.load !46
  %add.19 = fadd float %add.18, %51
  %52 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  store float %add.19, ptr %52, align 4
  %53 = mul nuw nsw i32 %9, 1
  %54 = add nuw nsw i32 0, %53
  %55 = mul nuw nsw i32 %11, 64
  %56 = add nuw nsw i32 %54, %55
  %57 = udiv i32 %56, 256
  %58 = mul nuw nsw i32 %12, 1
  %59 = add nuw nsw i32 0, %58
  %60 = udiv i32 %59, 8192
  %61 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  %62 = load float, ptr %61, align 4, !invariant.load !46
  %63 = getelementptr inbounds float, ptr %arg9, i32 %linear_index1
  %64 = load float, ptr %63, align 4, !invariant.load !46
  %add.111 = fadd float %62, %64
  %65 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %66 = load float, ptr %65, align 4, !invariant.load !46
  %add.122 = fadd float %add.111, %66
  %67 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %68 = load float, ptr %67, align 4, !invariant.load !46
  %add.133 = fadd float %add.122, %68
  %69 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %70 = load float, ptr %69, align 4, !invariant.load !46
  %add.144 = fadd float %add.133, %70
  %71 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %72 = load float, ptr %71, align 4, !invariant.load !46
  %add.155 = fadd float %add.144, %72
  %73 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %74 = load float, ptr %73, align 4, !invariant.load !46
  %add.166 = fadd float %add.155, %74
  %75 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %76 = load float, ptr %75, align 4, !invariant.load !46
  %add.177 = fadd float %add.166, %76
  %77 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %78 = load float, ptr %77, align 4, !invariant.load !46
  %add.188 = fadd float %add.177, %78
  %79 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %80 = load float, ptr %79, align 4, !invariant.load !46
  %add.199 = fadd float %add.188, %80
  %81 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  store float %add.199, ptr %81, align 4
  %82 = mul nuw nsw i32 %14, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %16, 64
  %85 = add nuw nsw i32 %83, %84
  %86 = udiv i32 %85, 256
  %87 = mul nuw nsw i32 %17, 1
  %88 = add nuw nsw i32 0, %87
  %89 = udiv i32 %88, 8192
  %90 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  %91 = load float, ptr %90, align 4, !invariant.load !46
  %92 = getelementptr inbounds float, ptr %arg9, i32 %linear_index2
  %93 = load float, ptr %92, align 4, !invariant.load !46
  %add.1110 = fadd float %91, %93
  %94 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %95 = load float, ptr %94, align 4, !invariant.load !46
  %add.1211 = fadd float %add.1110, %95
  %96 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %97 = load float, ptr %96, align 4, !invariant.load !46
  %add.1312 = fadd float %add.1211, %97
  %98 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %99 = load float, ptr %98, align 4, !invariant.load !46
  %add.1413 = fadd float %add.1312, %99
  %100 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %101 = load float, ptr %100, align 4, !invariant.load !46
  %add.1514 = fadd float %add.1413, %101
  %102 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %103 = load float, ptr %102, align 4, !invariant.load !46
  %add.1615 = fadd float %add.1514, %103
  %104 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %105 = load float, ptr %104, align 4, !invariant.load !46
  %add.1716 = fadd float %add.1615, %105
  %106 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %107 = load float, ptr %106, align 4, !invariant.load !46
  %add.1817 = fadd float %add.1716, %107
  %108 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %109 = load float, ptr %108, align 4, !invariant.load !46
  %add.1918 = fadd float %add.1817, %109
  %110 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  store float %add.1918, ptr %110, align 4
  %111 = mul nuw nsw i32 %19, 1
  %112 = add nuw nsw i32 0, %111
  %113 = mul nuw nsw i32 %21, 64
  %114 = add nuw nsw i32 %112, %113
  %115 = udiv i32 %114, 256
  %116 = mul nuw nsw i32 %22, 1
  %117 = add nuw nsw i32 0, %116
  %118 = udiv i32 %117, 8192
  %119 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  %120 = load float, ptr %119, align 4, !invariant.load !46
  %121 = getelementptr inbounds float, ptr %arg9, i32 %linear_index3
  %122 = load float, ptr %121, align 4, !invariant.load !46
  %add.1119 = fadd float %120, %122
  %123 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %124 = load float, ptr %123, align 4, !invariant.load !46
  %add.1220 = fadd float %add.1119, %124
  %125 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %126 = load float, ptr %125, align 4, !invariant.load !46
  %add.1321 = fadd float %add.1220, %126
  %127 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %128 = load float, ptr %127, align 4, !invariant.load !46
  %add.1422 = fadd float %add.1321, %128
  %129 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %130 = load float, ptr %129, align 4, !invariant.load !46
  %add.1523 = fadd float %add.1422, %130
  %131 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %132 = load float, ptr %131, align 4, !invariant.load !46
  %add.1624 = fadd float %add.1523, %132
  %133 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %134 = load float, ptr %133, align 4, !invariant.load !46
  %add.1725 = fadd float %add.1624, %134
  %135 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %136 = load float, ptr %135, align 4, !invariant.load !46
  %add.1826 = fadd float %add.1725, %136
  %137 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %138 = load float, ptr %137, align 4, !invariant.load !46
  %add.1927 = fadd float %add.1826, %138
  %139 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  store float %add.1927, ptr %139, align 4
  br label %fusion_41.in_bounds-after
}

define void @fusion_40(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1, ptr noalias align 16 dereferenceable(838860800) %arg2, ptr noalias align 128 dereferenceable(838860800) %arg3, ptr noalias align 128 dereferenceable(13107200) %arg4) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %result_from_other_lane34 = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
  %return_buffer30 = alloca float, align 4
  %result_from_other_lane28 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %tile_loop.invar_address11 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !48
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_17_constant_10 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_17_constant_10, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !50
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 3276800
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 3276800
  %15 = udiv i32 %8, 3276800
  %16 = icmp eq i32 %14, 3276799
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 64, i32 512
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = icmp eq i32 512, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit8, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !51

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result26 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer27)
  %22 = load float, ptr %return_buffer27, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result29 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result29, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane28, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane28, ptr %return_buffer30)
  %24 = load float, ptr %return_buffer30, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result32 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane31, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane31, ptr %return_buffer33)
  %26 = load float, ptr %return_buffer33, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result35 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result35, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane34, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane34, ptr %return_buffer36)
  %28 = load float, ptr %return_buffer36, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result38 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane37, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane37, ptr %return_buffer39)
  %30 = load float, ptr %return_buffer39, align 4
  store float %30, ptr %current_output, align 4
  %31 = udiv i32 %thread_id.x, 32
  %32 = icmp eq i32 %lane_id, 0
  br i1 %32, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %33 = icmp eq i32 %31, 0
  br i1 %33, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %34 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %35 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %35, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %36 = icmp eq i32 %tile_loop.indvar, 0
  %37 = mul i32 %tile_loop.indvar, 32
  %38 = add i32 %37, 0
  %x_loc = add i32 %38, %34
  %39 = add i32 %tile_origin.1, %y_in_tile.indvar
  %40 = add i32 %tile_origin.2, %x_loc
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %39, 64
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 209715200
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 256
  %52 = urem i32 %51, 100
  %53 = udiv i32 %46, 25600
  %Arg_1.2 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg1, i32 0, i32 %53, i32 %50, i32 %48
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !46
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %46
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !46
  %multiply.9 = fmul float %Arg_1.23, %Arg_2.34
  store float %multiply.9, ptr %reduction_input_address, align 4
  %54 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11(ptr %54, ptr %reduction_input_address, ptr %return_buffer)
  %55 = load float, ptr %return_buffer, align 4
  store float %55, ptr %54, align 4
  %56 = mul nuw nsw i32 %48, 1
  %57 = add nuw nsw i32 0, %56
  %58 = mul nuw nsw i32 %50, 64
  %59 = add nuw nsw i32 %57, %58
  %60 = udiv i32 %59, 256
  %61 = mul nuw nsw i32 %52, 1
  %62 = add nuw nsw i32 0, %61
  %63 = mul nuw nsw i32 %53, 100
  %64 = add nuw nsw i32 %62, %63
  %65 = udiv i32 %64, 819200
  %66 = mul nuw nsw i32 %59, 1
  %67 = add nuw nsw i32 0, %66
  %68 = urem i32 %67, 64
  %69 = udiv i32 %67, 64
  %70 = udiv i32 %69, 4
  %71 = mul nuw nsw i32 %64, 1
  %72 = add nuw nsw i32 0, %71
  %73 = urem i32 %72, 100
  %74 = udiv i32 %72, 100
  %75 = udiv i32 %74, 8192
  %Arg_1.25 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg1, i32 0, i32 %74, i32 %69, i32 %68
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !46
  %76 = udiv i32 %46, 64
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %76
  %Arg_0.17 = load float, ptr %Arg_0.1, align 4, !invariant.load !46
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  %77 = mul nuw nsw i32 %48, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %50, 64
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 256
  %82 = mul nuw nsw i32 %52, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %53, 100
  %85 = add nuw nsw i32 %83, %84
  %86 = udiv i32 %85, 819200
  %87 = getelementptr inbounds float, ptr %arg3, i32 %46
  store float %multiply.7, ptr %87, align 4
  br label %tile_loop.loop_header, !llvm.loop !53

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %88 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address11, align 4
  br label %tile_loop.loop_header9

tile_loop.loop_header9:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar12 = load i32, ptr %tile_loop.invar_address11, align 4
  %89 = icmp uge i32 %tile_loop.indvar12, 16
  br i1 %89, label %tile_loop.loop_exit8, label %tile_loop.loop_body10

tile_loop.loop_body10:                            ; preds = %tile_loop.loop_header9
  %invar.inc13 = add nuw nsw i32 %tile_loop.indvar12, 1
  store i32 %invar.inc13, ptr %tile_loop.invar_address11, align 4
  %90 = icmp eq i32 %tile_loop.indvar12, 0
  %91 = mul i32 %tile_loop.indvar12, 32
  %92 = add i32 %91, 0
  %x_loc14 = add i32 %92, %88
  %93 = add i32 %tile_origin.1, %y_in_tile.indvar
  %94 = add i32 %tile_origin.2, %x_loc14
  %95 = icmp ult i32 %x_loc14, %tile_bound1
  br i1 %95, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body10
  br label %tile_loop.loop_header9, !llvm.loop !55

tile_loop.loop_exit8:                             ; preds = %tile_loop.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body10
  %96 = mul nuw nsw i32 %94, 1
  %97 = add nuw nsw i32 0, %96
  %98 = mul nuw nsw i32 %93, 64
  %99 = add nuw nsw i32 %97, %98
  %100 = mul nuw nsw i32 %tile_origin.0, 209715200
  %101 = add nuw nsw i32 %99, %100
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 64
  %104 = udiv i32 %101, 64
  %105 = urem i32 %104, 4
  %106 = udiv i32 %101, 256
  %107 = urem i32 %106, 100
  %108 = udiv i32 %101, 25600
  %Arg_1.215 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg1, i32 0, i32 %108, i32 %105, i32 %103
  %Arg_1.216 = load float, ptr %Arg_1.215, align 4, !invariant.load !46
  %Arg_2.317 = getelementptr inbounds float, ptr %arg2, i32 %101
  %Arg_2.318 = load float, ptr %Arg_2.317, align 4, !invariant.load !46
  %multiply.919 = fmul float %Arg_1.216, %Arg_2.318
  store float %multiply.919, ptr %reduction_input_address, align 4
  %109 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11(ptr %109, ptr %reduction_input_address, ptr %return_buffer20)
  %110 = load float, ptr %return_buffer20, align 4
  store float %110, ptr %109, align 4
  %111 = mul nuw nsw i32 %103, 1
  %112 = add nuw nsw i32 0, %111
  %113 = mul nuw nsw i32 %105, 64
  %114 = add nuw nsw i32 %112, %113
  %115 = udiv i32 %114, 256
  %116 = mul nuw nsw i32 %107, 1
  %117 = add nuw nsw i32 0, %116
  %118 = mul nuw nsw i32 %108, 100
  %119 = add nuw nsw i32 %117, %118
  %120 = udiv i32 %119, 819200
  %121 = mul nuw nsw i32 %114, 1
  %122 = add nuw nsw i32 0, %121
  %123 = urem i32 %122, 64
  %124 = udiv i32 %122, 64
  %125 = udiv i32 %124, 4
  %126 = mul nuw nsw i32 %119, 1
  %127 = add nuw nsw i32 0, %126
  %128 = urem i32 %127, 100
  %129 = udiv i32 %127, 100
  %130 = udiv i32 %129, 8192
  %Arg_1.221 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg1, i32 0, i32 %129, i32 %124, i32 %123
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !46
  %131 = udiv i32 %101, 64
  %Arg_0.123 = getelementptr inbounds float, ptr %arg0, i32 %131
  %Arg_0.124 = load float, ptr %Arg_0.123, align 4, !invariant.load !46
  %multiply.725 = fmul float %Arg_1.222, %Arg_0.124
  %132 = mul nuw nsw i32 %103, 1
  %133 = add nuw nsw i32 0, %132
  %134 = mul nuw nsw i32 %105, 64
  %135 = add nuw nsw i32 %133, %134
  %136 = udiv i32 %135, 256
  %137 = mul nuw nsw i32 %107, 1
  %138 = add nuw nsw i32 0, %137
  %139 = mul nuw nsw i32 %108, 100
  %140 = add nuw nsw i32 %138, %139
  %141 = udiv i32 %140, 819200
  %142 = getelementptr inbounds float, ptr %arg3, i32 %101
  store float %multiply.725, ptr %142, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %143 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %144 = addrspacecast ptr addrspace(3) %143 to ptr
  %145 = load float, ptr %current_output, align 4
  store float %145, ptr %144, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %146 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %147 = addrspacecast ptr addrspace(3) %146 to ptr
  store float %region_0_17_constant_10, ptr %initial_value_addr, align 4
  %148 = icmp ult i32 %thread_id.x, 1
  %149 = select i1 %148, ptr %147, ptr %initial_value_addr
  %150 = icmp eq i32 %thread_id.x, 0
  br i1 %150, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %151 = mul i32 %thread_id.x, 1
  %152 = add i32 %tile_origin.1, %thread_id.y
  %153 = add i32 %tile_origin.2, %151
  %154 = add i32 %153, 0
  %155 = udiv i32 %152, 1
  %156 = urem i32 %155, 4
  %157 = udiv i32 %152, 4
  %158 = urem i32 %157, 100
  %159 = udiv i32 %152, 400
  %output_element_address = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg4, i32 0, i32 %159, i32 %156, i32 %158
  %output = load float, ptr %149, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_11(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.14.typed = alloca float, align 4
  %Arg_0.12 = load float, ptr %Arg_0.12.typed, align 4
  %Arg_1.13 = load float, ptr %Arg_1.13.typed, align 4
  %add.14 = fadd float %Arg_0.12, %Arg_1.13
  store float %add.14, ptr %add.14.typed, align 4
  %load_ret_value = load float, ptr %add.14.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define void @fusion_38(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane26 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %result_from_other_lane23 = alloca float, align 4
  %return_buffer22 = alloca float, align 4
  %result_from_other_lane20 = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !48
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_11_constant_5 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_11_constant_5, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 32768
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 32768
  %15 = udiv i32 %8, 32768
  %16 = icmp eq i32 %14, 32767
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 100, i32 512
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = icmp eq i32 512, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !57

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_6(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
  %30 = load float, ptr %return_buffer31, align 4
  store float %30, ptr %current_output, align 4
  %31 = udiv i32 %thread_id.x, 32
  %32 = icmp eq i32 %lane_id, 0
  br i1 %32, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %33 = icmp eq i32 %31, 0
  br i1 %33, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %34 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %35 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %35, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %36 = icmp eq i32 %tile_loop.indvar, 0
  %37 = mul i32 %tile_loop.indvar, 32
  %38 = add i32 %37, 0
  %x_loc = add i32 %38, %34
  %39 = add i32 %tile_origin.1, %y_in_tile.indvar
  %40 = add i32 %tile_origin.2, %x_loc
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %39, 100
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 3276800
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 100
  %49 = udiv i32 %46, 100
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 400
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !46
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !46
  %multiply.4 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.4, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_6(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !58

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %54 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %55 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %55, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %56 = icmp eq i32 %tile_loop.indvar9, 0
  %57 = mul i32 %tile_loop.indvar9, 32
  %58 = add i32 %57, 0
  %x_loc11 = add i32 %58, %54
  %59 = add i32 %tile_origin.1, %y_in_tile.indvar
  %60 = add i32 %tile_origin.2, %x_loc11
  %61 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %61, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !59

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %62 = mul nuw nsw i32 %60, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %59, 100
  %65 = add nuw nsw i32 %63, %64
  %66 = mul nuw nsw i32 %tile_origin.0, 3276800
  %67 = add nuw nsw i32 %65, %66
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 100
  %70 = udiv i32 %67, 100
  %71 = urem i32 %70, 4
  %72 = udiv i32 %67, 400
  %Arg_1.212 = getelementptr inbounds float, ptr %arg1, i32 %67
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !46
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !46
  %multiply.416 = fmul float %Arg_1.213, %Arg_0.115
  store float %multiply.416, ptr %reduction_input_address, align 4
  %73 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_6(ptr %73, ptr %reduction_input_address, ptr %return_buffer17)
  %74 = load float, ptr %return_buffer17, align 4
  store float %74, ptr %73, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %75 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %31
  %76 = addrspacecast ptr addrspace(3) %75 to ptr
  %77 = load float, ptr %current_output, align 4
  store float %77, ptr %76, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %78 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %lane_id
  %79 = addrspacecast ptr addrspace(3) %78 to ptr
  store float %region_0_11_constant_5, ptr %initial_value_addr, align 4
  %80 = icmp ult i32 %thread_id.x, 1
  %81 = select i1 %80, ptr %79, ptr %initial_value_addr
  %82 = icmp eq i32 %thread_id.x, 0
  br i1 %82, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %83 = mul i32 %thread_id.x, 1
  %84 = add i32 %tile_origin.1, %thread_id.y
  %85 = add i32 %tile_origin.2, %83
  %86 = add i32 %85, 0
  %87 = udiv i32 %84, 1
  %88 = urem i32 %87, 4
  %89 = udiv i32 %84, 4
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr %arg2, i32 0, i32 %89, i32 %88
  %output = load float, ptr %81, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_6(ptr dereferenceable(4) %Arg_0.7.typed, ptr dereferenceable(4) %Arg_1.8.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.9.typed = alloca float, align 4
  %Arg_0.7 = load float, ptr %Arg_0.7.typed, align 4
  %Arg_1.8 = load float, ptr %Arg_1.8.typed, align 4
  %add.9 = fadd float %Arg_0.7, %Arg_1.8
  store float %add.9, ptr %add.9.typed, align 4
  %load_ret_value = load float, ptr %add.9.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_37(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(13107200) %arg2, ptr noalias align 128 dereferenceable(13107200) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 819200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 100
  %5 = udiv i32 %linear_index_base, 100
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 100
  %10 = udiv i32 %linear_index1, 100
  %11 = urem i32 %10, 4
  %12 = udiv i32 %linear_index1, 400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 100
  %15 = udiv i32 %linear_index2, 100
  %16 = urem i32 %15, 4
  %17 = udiv i32 %linear_index2, 400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 100
  %20 = udiv i32 %linear_index3, 100
  %21 = urem i32 %20, 4
  %22 = udiv i32 %linear_index3, 400
  %23 = icmp ult i32 %linear_index_base, 3276800
  br i1 %23, label %fusion_37.in_bounds-true, label %fusion_37.in_bounds-after

fusion_37.in_bounds-after:                        ; preds = %fusion_37.in_bounds-true, %entry
  ret void

fusion_37.in_bounds-true:                         ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !46
  %26 = udiv i32 %linear_index_base, 100
  %27 = getelementptr inbounds float, ptr %arg1, i32 %26
  %28 = load float, ptr %27, align 4, !invariant.load !46
  %subtract.6 = fsub float %25, %28
  %29 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %30 = load float, ptr %29, align 4, !invariant.load !46
  %multiply.7 = fmul float %subtract.6, %30
  %31 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %multiply.7, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %33 = load float, ptr %32, align 4, !invariant.load !46
  %34 = udiv i32 %linear_index1, 100
  %35 = getelementptr inbounds float, ptr %arg1, i32 %34
  %36 = load float, ptr %35, align 4, !invariant.load !46
  %subtract.61 = fsub float %33, %36
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %38 = load float, ptr %37, align 4, !invariant.load !46
  %multiply.72 = fmul float %subtract.61, %38
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %multiply.72, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %41 = load float, ptr %40, align 4, !invariant.load !46
  %42 = udiv i32 %linear_index2, 100
  %43 = getelementptr inbounds float, ptr %arg1, i32 %42
  %44 = load float, ptr %43, align 4, !invariant.load !46
  %subtract.63 = fsub float %41, %44
  %45 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %46 = load float, ptr %45, align 4, !invariant.load !46
  %multiply.74 = fmul float %subtract.63, %46
  %47 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %multiply.74, ptr %47, align 4
  %48 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %49 = load float, ptr %48, align 4, !invariant.load !46
  %50 = udiv i32 %linear_index3, 100
  %51 = getelementptr inbounds float, ptr %arg1, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !46
  %subtract.65 = fsub float %49, %52
  %53 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %54 = load float, ptr %53, align 4, !invariant.load !46
  %multiply.76 = fmul float %subtract.65, %54
  %55 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %multiply.76, ptr %55, align 4
  br label %fusion_37.in_bounds-after
}

define void @fusion_30(ptr noalias align 16 dereferenceable(8192) %arg0, ptr noalias align 128 dereferenceable(237568) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(8192) %arg3, ptr noalias align 128 dereferenceable(8192) %arg4, ptr noalias align 128 dereferenceable(8192) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !61
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2048
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 2048
  br i1 %6, label %fusion_30.in_bounds-true, label %fusion_30.in_bounds-after

fusion_30.in_bounds-after:                        ; preds = %fusion_30.in_bounds-true, %entry
  ret void

fusion_30.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !46
  %9 = load float, ptr %arg2, align 4, !invariant.load !46
  %10 = add i32 %5, 152
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [232 x [256 x float]], ptr %arg1, i32 0, i32 %10, i32 %11
  %13 = load float, ptr %12, align 4, !invariant.load !46
  %multiply.7 = fmul float %9, %13
  %subtract.8 = fsub float %8, %multiply.7
  %14 = insertvalue { float, float } undef, float %subtract.8, 0
  %15 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %16 = load float, ptr %15, align 4, !invariant.load !46
  %17 = add i32 %5, 160
  %18 = add i32 %4, 0
  %19 = getelementptr inbounds [232 x [256 x float]], ptr %arg1, i32 0, i32 %17, i32 %18
  %20 = load float, ptr %19, align 4, !invariant.load !46
  %multiply.10 = fmul float %9, %20
  %subtract.11 = fsub float %16, %multiply.10
  %21 = insertvalue { float, float } %14, float %subtract.11, 1
  %22 = extractvalue { float, float } %21, 0
  %23 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %22, ptr %23, align 4
  %24 = extractvalue { float, float } %21, 1
  %25 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %24, ptr %25, align 4
  br label %fusion_30.in_bounds-after
}

define void @fusion_31(ptr noalias align 16 dereferenceable(155648) %arg0, ptr noalias align 128 dereferenceable(237568) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(155648) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !63
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 38912
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 38912
  br i1 %6, label %fusion_31.in_bounds-true, label %fusion_31.in_bounds-after

fusion_31.in_bounds-after:                        ; preds = %fusion_31.in_bounds-true, %entry
  ret void

fusion_31.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !46
  %9 = load float, ptr %arg2, align 4, !invariant.load !46
  %10 = add i32 %5, 0
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [232 x [256 x float]], ptr %arg1, i32 0, i32 %10, i32 %11
  %13 = load float, ptr %12, align 4, !invariant.load !46
  %multiply.6 = fmul float %9, %13
  %subtract.7 = fsub float %8, %multiply.6
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %subtract.7, ptr %14, align 4
  br label %fusion_31.in_bounds-after
}

define void @fusion_23(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 16 dereferenceable(3276800) %arg1, ptr noalias align 16 dereferenceable(3276800) %arg2, ptr noalias align 16 dereferenceable(3276800) %arg3, ptr noalias align 16 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(4) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(13107200) %arg10, ptr noalias align 128 dereferenceable(13107200) %arg11, ptr noalias align 128 dereferenceable(131072) %arg12) {
entry:
  %initial_value_addr185 = alloca float, align 4
  %return_buffer180 = alloca float, align 4
  %result_from_other_lane178 = alloca float, align 4
  %return_buffer177 = alloca float, align 4
  %result_from_other_lane175 = alloca float, align 4
  %return_buffer174 = alloca float, align 4
  %result_from_other_lane172 = alloca float, align 4
  %return_buffer171 = alloca float, align 4
  %result_from_other_lane169 = alloca float, align 4
  %return_buffer168 = alloca float, align 4
  %result_from_other_lane166 = alloca float, align 4
  %initial_value_addr160 = alloca float, align 4
  %return_buffer155 = alloca float, align 4
  %result_from_other_lane153 = alloca float, align 4
  %return_buffer152 = alloca float, align 4
  %result_from_other_lane150 = alloca float, align 4
  %return_buffer149 = alloca float, align 4
  %result_from_other_lane147 = alloca float, align 4
  %return_buffer146 = alloca float, align 4
  %result_from_other_lane144 = alloca float, align 4
  %return_buffer143 = alloca float, align 4
  %result_from_other_lane141 = alloca float, align 4
  %initial_value_addr135 = alloca float, align 4
  %return_buffer130 = alloca float, align 4
  %result_from_other_lane128 = alloca float, align 4
  %return_buffer127 = alloca float, align 4
  %result_from_other_lane125 = alloca float, align 4
  %return_buffer124 = alloca float, align 4
  %result_from_other_lane122 = alloca float, align 4
  %return_buffer121 = alloca float, align 4
  %result_from_other_lane119 = alloca float, align 4
  %return_buffer118 = alloca float, align 4
  %result_from_other_lane116 = alloca float, align 4
  %initial_value_addr110 = alloca float, align 4
  %return_buffer105 = alloca float, align 4
  %result_from_other_lane103 = alloca float, align 4
  %return_buffer102 = alloca float, align 4
  %result_from_other_lane100 = alloca float, align 4
  %return_buffer99 = alloca float, align 4
  %result_from_other_lane97 = alloca float, align 4
  %return_buffer96 = alloca float, align 4
  %result_from_other_lane94 = alloca float, align 4
  %return_buffer93 = alloca float, align 4
  %result_from_other_lane91 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer89 = alloca float, align 4
  %result_from_other_lane87 = alloca float, align 4
  %return_buffer86 = alloca float, align 4
  %result_from_other_lane84 = alloca float, align 4
  %return_buffer83 = alloca float, align 4
  %result_from_other_lane81 = alloca float, align 4
  %return_buffer80 = alloca float, align 4
  %result_from_other_lane78 = alloca float, align 4
  %return_buffer77 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer69 = alloca float, align 4
  %return_buffer66 = alloca float, align 4
  %return_buffer60 = alloca float, align 4
  %return_buffer54 = alloca float, align 4
  %return_buffer48 = alloca float, align 4
  %tile_loop.invar_address39 = alloca i32, align 4
  %return_buffer31 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result11 = alloca float, align 4
  %reduction_input_address10 = alloca float, align 4
  %partial_reduction_result8 = alloca float, align 4
  %reduction_input_address7 = alloca float, align 4
  %partial_reduction_result5 = alloca float, align 4
  %reduction_input_address4 = alloca float, align 4
  %partial_reduction_result2 = alloca float, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !48
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after184, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_51_constant_10 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_51_constant_10, ptr %2, align 4
  %region_0_51_constant_103 = load float, ptr @2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_51_constant_103, ptr %3, align 4
  %region_0_51_constant_106 = load float, ptr @2, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  store float %region_0_51_constant_106, ptr %4, align 4
  %region_0_51_constant_109 = load float, ptr @2, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  store float %region_0_51_constant_109, ptr %5, align 4
  %region_0_51_constant_1012 = load float, ptr @2, align 4
  %6 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  store float %region_0_51_constant_1012, ptr %6, align 4
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %9 = urem i32 %7, 32
  %10 = udiv i32 %7, 32
  %11 = mul i32 %8, 3
  %12 = add i32 %11, %10
  %13 = icmp ult i32 %12, 32768
  br i1 %13, label %14, label %early_return

14:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %9, 32
  %thread_id.y = udiv i32 %9, 32
  %lane_id = urem i32 %9, 32
  %15 = udiv i32 %12, 1
  %16 = urem i32 %15, 1
  %17 = udiv i32 %12, 1
  %18 = urem i32 %17, 32768
  %19 = udiv i32 %12, 32768
  %20 = icmp eq i32 %18, 32767
  %tile_bound = select i1 %20, i32 1, i32 1
  %21 = icmp eq i32 %16, 0
  %tile_bound13 = select i1 %21, i32 100, i32 512
  %tile_origin.0 = mul i32 %19, 1
  %tile_origin.1 = mul i32 %18, 1
  %tile_origin.2 = mul i32 %16, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %14
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %22 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %22, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %23 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %24 = icmp eq i32 512, %tile_bound13
  br i1 %24, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit36, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !64

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result76 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result76, i32 16, i32 31)
  store float %25, ptr %result_from_other_lane, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer77)
  %26 = load float, ptr %return_buffer77, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result79 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result79, i32 8, i32 31)
  store float %27, ptr %result_from_other_lane78, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane78, ptr %return_buffer80)
  %28 = load float, ptr %return_buffer80, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result82 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result82, i32 4, i32 31)
  store float %29, ptr %result_from_other_lane81, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane81, ptr %return_buffer83)
  %30 = load float, ptr %return_buffer83, align 4
  store float %30, ptr %current_output, align 4
  %partial_reduction_result85 = load float, ptr %current_output, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 2, i32 31)
  store float %31, ptr %result_from_other_lane84, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane84, ptr %return_buffer86)
  %32 = load float, ptr %return_buffer86, align 4
  store float %32, ptr %current_output, align 4
  %partial_reduction_result88 = load float, ptr %current_output, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 1, i32 31)
  store float %33, ptr %result_from_other_lane87, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane87, ptr %return_buffer89)
  %34 = load float, ptr %return_buffer89, align 4
  store float %34, ptr %current_output, align 4
  %35 = udiv i32 %thread_id.x, 32
  %36 = icmp eq i32 %lane_id, 0
  br i1 %36, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %37 = icmp eq i32 %35, 0
  br i1 %37, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  %current_output90 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %partial_reduction_result92 = load float, ptr %current_output90, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result92, i32 16, i32 31)
  store float %38, ptr %result_from_other_lane91, align 4
  call void @region_2_19(ptr %current_output90, ptr %result_from_other_lane91, ptr %return_buffer93)
  %39 = load float, ptr %return_buffer93, align 4
  store float %39, ptr %current_output90, align 4
  %partial_reduction_result95 = load float, ptr %current_output90, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result95, i32 8, i32 31)
  store float %40, ptr %result_from_other_lane94, align 4
  call void @region_2_19(ptr %current_output90, ptr %result_from_other_lane94, ptr %return_buffer96)
  %41 = load float, ptr %return_buffer96, align 4
  store float %41, ptr %current_output90, align 4
  %partial_reduction_result98 = load float, ptr %current_output90, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result98, i32 4, i32 31)
  store float %42, ptr %result_from_other_lane97, align 4
  call void @region_2_19(ptr %current_output90, ptr %result_from_other_lane97, ptr %return_buffer99)
  %43 = load float, ptr %return_buffer99, align 4
  store float %43, ptr %current_output90, align 4
  %partial_reduction_result101 = load float, ptr %current_output90, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result101, i32 2, i32 31)
  store float %44, ptr %result_from_other_lane100, align 4
  call void @region_2_19(ptr %current_output90, ptr %result_from_other_lane100, ptr %return_buffer102)
  %45 = load float, ptr %return_buffer102, align 4
  store float %45, ptr %current_output90, align 4
  %partial_reduction_result104 = load float, ptr %current_output90, align 4
  %46 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result104, i32 1, i32 31)
  store float %46, ptr %result_from_other_lane103, align 4
  call void @region_2_19(ptr %current_output90, ptr %result_from_other_lane103, ptr %return_buffer105)
  %47 = load float, ptr %return_buffer105, align 4
  store float %47, ptr %current_output90, align 4
  %48 = udiv i32 %thread_id.x, 32
  %49 = icmp eq i32 %lane_id, 0
  br i1 %49, label %intra_warp_reduce_write-true106, label %intra_warp_reduce_write-after107

intra_warp_reduce_write-after107:                 ; preds = %intra_warp_reduce_write-true106, %inter_warp_reduce-after
  call void @llvm.nvvm.barrier0()
  %50 = icmp eq i32 %48, 0
  br i1 %50, label %inter_warp_reduce-true108, label %inter_warp_reduce-after109

inter_warp_reduce-after109:                       ; preds = %reduction_write_output-after112, %intra_warp_reduce_write-after107
  %current_output115 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  %partial_reduction_result117 = load float, ptr %current_output115, align 4
  %51 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result117, i32 16, i32 31)
  store float %51, ptr %result_from_other_lane116, align 4
  call void @region_3_27(ptr %current_output115, ptr %result_from_other_lane116, ptr %return_buffer118)
  %52 = load float, ptr %return_buffer118, align 4
  store float %52, ptr %current_output115, align 4
  %partial_reduction_result120 = load float, ptr %current_output115, align 4
  %53 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result120, i32 8, i32 31)
  store float %53, ptr %result_from_other_lane119, align 4
  call void @region_3_27(ptr %current_output115, ptr %result_from_other_lane119, ptr %return_buffer121)
  %54 = load float, ptr %return_buffer121, align 4
  store float %54, ptr %current_output115, align 4
  %partial_reduction_result123 = load float, ptr %current_output115, align 4
  %55 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result123, i32 4, i32 31)
  store float %55, ptr %result_from_other_lane122, align 4
  call void @region_3_27(ptr %current_output115, ptr %result_from_other_lane122, ptr %return_buffer124)
  %56 = load float, ptr %return_buffer124, align 4
  store float %56, ptr %current_output115, align 4
  %partial_reduction_result126 = load float, ptr %current_output115, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result126, i32 2, i32 31)
  store float %57, ptr %result_from_other_lane125, align 4
  call void @region_3_27(ptr %current_output115, ptr %result_from_other_lane125, ptr %return_buffer127)
  %58 = load float, ptr %return_buffer127, align 4
  store float %58, ptr %current_output115, align 4
  %partial_reduction_result129 = load float, ptr %current_output115, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result129, i32 1, i32 31)
  store float %59, ptr %result_from_other_lane128, align 4
  call void @region_3_27(ptr %current_output115, ptr %result_from_other_lane128, ptr %return_buffer130)
  %60 = load float, ptr %return_buffer130, align 4
  store float %60, ptr %current_output115, align 4
  %61 = udiv i32 %thread_id.x, 32
  %62 = icmp eq i32 %lane_id, 0
  br i1 %62, label %intra_warp_reduce_write-true131, label %intra_warp_reduce_write-after132

intra_warp_reduce_write-after132:                 ; preds = %intra_warp_reduce_write-true131, %inter_warp_reduce-after109
  call void @llvm.nvvm.barrier0()
  %63 = icmp eq i32 %61, 0
  br i1 %63, label %inter_warp_reduce-true133, label %inter_warp_reduce-after134

inter_warp_reduce-after134:                       ; preds = %reduction_write_output-after137, %intra_warp_reduce_write-after132
  %current_output140 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  %partial_reduction_result142 = load float, ptr %current_output140, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result142, i32 16, i32 31)
  store float %64, ptr %result_from_other_lane141, align 4
  call void @region_4_35(ptr %current_output140, ptr %result_from_other_lane141, ptr %return_buffer143)
  %65 = load float, ptr %return_buffer143, align 4
  store float %65, ptr %current_output140, align 4
  %partial_reduction_result145 = load float, ptr %current_output140, align 4
  %66 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result145, i32 8, i32 31)
  store float %66, ptr %result_from_other_lane144, align 4
  call void @region_4_35(ptr %current_output140, ptr %result_from_other_lane144, ptr %return_buffer146)
  %67 = load float, ptr %return_buffer146, align 4
  store float %67, ptr %current_output140, align 4
  %partial_reduction_result148 = load float, ptr %current_output140, align 4
  %68 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result148, i32 4, i32 31)
  store float %68, ptr %result_from_other_lane147, align 4
  call void @region_4_35(ptr %current_output140, ptr %result_from_other_lane147, ptr %return_buffer149)
  %69 = load float, ptr %return_buffer149, align 4
  store float %69, ptr %current_output140, align 4
  %partial_reduction_result151 = load float, ptr %current_output140, align 4
  %70 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result151, i32 2, i32 31)
  store float %70, ptr %result_from_other_lane150, align 4
  call void @region_4_35(ptr %current_output140, ptr %result_from_other_lane150, ptr %return_buffer152)
  %71 = load float, ptr %return_buffer152, align 4
  store float %71, ptr %current_output140, align 4
  %partial_reduction_result154 = load float, ptr %current_output140, align 4
  %72 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result154, i32 1, i32 31)
  store float %72, ptr %result_from_other_lane153, align 4
  call void @region_4_35(ptr %current_output140, ptr %result_from_other_lane153, ptr %return_buffer155)
  %73 = load float, ptr %return_buffer155, align 4
  store float %73, ptr %current_output140, align 4
  %74 = udiv i32 %thread_id.x, 32
  %75 = icmp eq i32 %lane_id, 0
  br i1 %75, label %intra_warp_reduce_write-true156, label %intra_warp_reduce_write-after157

intra_warp_reduce_write-after157:                 ; preds = %intra_warp_reduce_write-true156, %inter_warp_reduce-after134
  call void @llvm.nvvm.barrier0()
  %76 = icmp eq i32 %74, 0
  br i1 %76, label %inter_warp_reduce-true158, label %inter_warp_reduce-after159

inter_warp_reduce-after159:                       ; preds = %reduction_write_output-after162, %intra_warp_reduce_write-after157
  %current_output165 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  %partial_reduction_result167 = load float, ptr %current_output165, align 4
  %77 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result167, i32 16, i32 31)
  store float %77, ptr %result_from_other_lane166, align 4
  call void @region_5_45(ptr %current_output165, ptr %result_from_other_lane166, ptr %return_buffer168)
  %78 = load float, ptr %return_buffer168, align 4
  store float %78, ptr %current_output165, align 4
  %partial_reduction_result170 = load float, ptr %current_output165, align 4
  %79 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result170, i32 8, i32 31)
  store float %79, ptr %result_from_other_lane169, align 4
  call void @region_5_45(ptr %current_output165, ptr %result_from_other_lane169, ptr %return_buffer171)
  %80 = load float, ptr %return_buffer171, align 4
  store float %80, ptr %current_output165, align 4
  %partial_reduction_result173 = load float, ptr %current_output165, align 4
  %81 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result173, i32 4, i32 31)
  store float %81, ptr %result_from_other_lane172, align 4
  call void @region_5_45(ptr %current_output165, ptr %result_from_other_lane172, ptr %return_buffer174)
  %82 = load float, ptr %return_buffer174, align 4
  store float %82, ptr %current_output165, align 4
  %partial_reduction_result176 = load float, ptr %current_output165, align 4
  %83 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result176, i32 2, i32 31)
  store float %83, ptr %result_from_other_lane175, align 4
  call void @region_5_45(ptr %current_output165, ptr %result_from_other_lane175, ptr %return_buffer177)
  %84 = load float, ptr %return_buffer177, align 4
  store float %84, ptr %current_output165, align 4
  %partial_reduction_result179 = load float, ptr %current_output165, align 4
  %85 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result179, i32 1, i32 31)
  store float %85, ptr %result_from_other_lane178, align 4
  call void @region_5_45(ptr %current_output165, ptr %result_from_other_lane178, ptr %return_buffer180)
  %86 = load float, ptr %return_buffer180, align 4
  store float %86, ptr %current_output165, align 4
  %87 = udiv i32 %thread_id.x, 32
  %88 = icmp eq i32 %lane_id, 0
  br i1 %88, label %intra_warp_reduce_write-true181, label %intra_warp_reduce_write-after182

intra_warp_reduce_write-after182:                 ; preds = %intra_warp_reduce_write-true181, %inter_warp_reduce-after159
  call void @llvm.nvvm.barrier0()
  %89 = icmp eq i32 %87, 0
  br i1 %89, label %inter_warp_reduce-true183, label %inter_warp_reduce-after184

inter_warp_reduce-after184:                       ; preds = %reduction_write_output-after187, %intra_warp_reduce_write-after182
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %90 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %91 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %91, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc14 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc14, ptr %tile_loop.invar_address, align 4
  %92 = icmp eq i32 %tile_loop.indvar, 0
  %93 = mul i32 %tile_loop.indvar, 32
  %94 = add i32 %93, 0
  %x_loc = add i32 %94, %90
  %95 = add i32 %tile_origin.1, %y_in_tile.indvar
  %96 = add i32 %tile_origin.2, %x_loc
  %97 = mul nuw nsw i32 %96, 1
  %98 = add nuw nsw i32 0, %97
  %99 = mul nuw nsw i32 %95, 100
  %100 = add nuw nsw i32 %98, %99
  %101 = mul nuw nsw i32 %tile_origin.0, 3276800
  %102 = add nuw nsw i32 %100, %101
  %103 = udiv i32 %102, 1
  %104 = urem i32 %103, 100
  %105 = udiv i32 %102, 100
  %106 = urem i32 %105, 4
  %107 = udiv i32 %102, 400
  %Arg_1.2 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg1, i32 0, i32 %107, i32 %104, i32 0
  %Arg_1.215 = load float, ptr %Arg_1.2, align 4, !invariant.load !46
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.116 = load float, ptr %Arg_0.1, align 4, !invariant.load !46
  %multiply.9 = fmul float %Arg_1.215, %Arg_0.116
  store float %multiply.9, ptr %reduction_input_address, align 4
  %108 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11__1(ptr %108, ptr %reduction_input_address, ptr %return_buffer)
  %109 = load float, ptr %return_buffer, align 4
  store float %109, ptr %108, align 4
  %Arg_2.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg2, i32 0, i32 %107, i32 %104, i32 0
  %Arg_2.317 = load float, ptr %Arg_2.3, align 4, !invariant.load !46
  %Arg_0.118 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !46
  %multiply.18 = fmul float %Arg_2.317, %Arg_0.119
  store float %multiply.18, ptr %reduction_input_address1, align 4
  %110 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_19(ptr %110, ptr %reduction_input_address1, ptr %return_buffer20)
  %111 = load float, ptr %return_buffer20, align 4
  store float %111, ptr %110, align 4
  %Arg_3.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg3, i32 0, i32 %107, i32 %104, i32 0
  %Arg_3.421 = load float, ptr %Arg_3.4, align 4, !invariant.load !46
  %Arg_0.122 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.123 = load float, ptr %Arg_0.122, align 4, !invariant.load !46
  %multiply.26 = fmul float %Arg_3.421, %Arg_0.123
  store float %multiply.26, ptr %reduction_input_address4, align 4
  %112 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_27(ptr %112, ptr %reduction_input_address4, ptr %return_buffer24)
  %113 = load float, ptr %return_buffer24, align 4
  store float %113, ptr %112, align 4
  %Arg_4.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %107, i32 %104, i32 0
  %Arg_4.525 = load float, ptr %Arg_4.5, align 4, !invariant.load !46
  %Arg_0.126 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.127 = load float, ptr %Arg_0.126, align 4, !invariant.load !46
  %multiply.34 = fmul float %Arg_4.525, %Arg_0.127
  store float %multiply.34, ptr %reduction_input_address7, align 4
  %114 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_35(ptr %114, ptr %reduction_input_address7, ptr %return_buffer28)
  %115 = load float, ptr %return_buffer28, align 4
  store float %115, ptr %114, align 4
  %Arg_0.129 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.130 = load float, ptr %Arg_0.129, align 4, !invariant.load !46
  store float %Arg_0.130, ptr %reduction_input_address10, align 4
  %116 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  call void @region_5_45(ptr %116, ptr %reduction_input_address10, ptr %return_buffer31)
  %117 = load float, ptr %return_buffer31, align 4
  store float %117, ptr %116, align 4
  %118 = mul nuw nsw i32 %104, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %106, 100
  %121 = add nuw nsw i32 %119, %120
  %122 = urem i32 %121, 4
  %123 = udiv i32 %121, 4
  %124 = udiv i32 %123, 100
  %125 = mul nuw nsw i32 %107, 1
  %126 = add nuw nsw i32 0, %125
  %127 = udiv i32 %126, 8192
  %Arg_5.6 = load float, ptr %arg5, align 4, !invariant.load !46
  %Arg_0.132 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %126, i32 %122, i32 %123
  %Arg_0.133 = load float, ptr %Arg_0.132, align 4, !invariant.load !46
  %multiply.41 = fmul float %Arg_5.6, %Arg_0.133
  %128 = mul nuw nsw i32 %104, 1
  %129 = add nuw nsw i32 0, %128
  %130 = mul nuw nsw i32 %106, 100
  %131 = add nuw nsw i32 %129, %130
  %132 = mul nuw nsw i32 %107, 400
  %133 = add nuw nsw i32 %131, %132
  %134 = urem i32 %133, 4
  %135 = udiv i32 %133, 4
  %136 = udiv i32 %135, 819200
  %137 = mul nuw nsw i32 %134, 1
  %138 = add nuw nsw i32 0, %137
  %139 = udiv i32 %138, 4
  %140 = mul nuw nsw i32 %135, 1
  %141 = add nuw nsw i32 0, %140
  %142 = urem i32 %141, 100
  %143 = udiv i32 %141, 100
  %144 = udiv i32 %143, 8192
  %Arg_0.134 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %143, i32 %138, i32 %142
  %Arg_0.135 = load float, ptr %Arg_0.134, align 4, !invariant.load !46
  %145 = mul nuw nsw i32 %104, 1
  %146 = add nuw nsw i32 0, %145
  %147 = mul nuw nsw i32 %106, 100
  %148 = add nuw nsw i32 %146, %147
  %149 = mul nuw nsw i32 %107, 400
  %150 = add nuw nsw i32 %148, %149
  %151 = urem i32 %150, 4
  %152 = udiv i32 %150, 4
  %153 = udiv i32 %152, 819200
  %154 = getelementptr inbounds float, ptr %arg11, i32 %102
  store float %Arg_0.135, ptr %154, align 4
  %155 = mul nuw nsw i32 %104, 1
  %156 = add nuw nsw i32 0, %155
  %157 = mul nuw nsw i32 %106, 100
  %158 = add nuw nsw i32 %156, %157
  %159 = urem i32 %158, 4
  %160 = udiv i32 %158, 4
  %161 = udiv i32 %160, 100
  %162 = mul nuw nsw i32 %107, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 8192
  %165 = getelementptr inbounds float, ptr %arg10, i32 %102
  store float %multiply.41, ptr %165, align 4
  br label %tile_loop.loop_header, !llvm.loop !65

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %166 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address39, align 4
  br label %tile_loop.loop_header37

tile_loop.loop_header37:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar40 = load i32, ptr %tile_loop.invar_address39, align 4
  %167 = icmp uge i32 %tile_loop.indvar40, 16
  br i1 %167, label %tile_loop.loop_exit36, label %tile_loop.loop_body38

tile_loop.loop_body38:                            ; preds = %tile_loop.loop_header37
  %invar.inc41 = add nuw nsw i32 %tile_loop.indvar40, 1
  store i32 %invar.inc41, ptr %tile_loop.invar_address39, align 4
  %168 = icmp eq i32 %tile_loop.indvar40, 0
  %169 = mul i32 %tile_loop.indvar40, 32
  %170 = add i32 %169, 0
  %x_loc42 = add i32 %170, %166
  %171 = add i32 %tile_origin.1, %y_in_tile.indvar
  %172 = add i32 %tile_origin.2, %x_loc42
  %173 = icmp ult i32 %x_loc42, %tile_bound13
  br i1 %173, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body38
  br label %tile_loop.loop_header37, !llvm.loop !66

tile_loop.loop_exit36:                            ; preds = %tile_loop.loop_header37
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body38
  %174 = mul nuw nsw i32 %172, 1
  %175 = add nuw nsw i32 0, %174
  %176 = mul nuw nsw i32 %171, 100
  %177 = add nuw nsw i32 %175, %176
  %178 = mul nuw nsw i32 %tile_origin.0, 3276800
  %179 = add nuw nsw i32 %177, %178
  %180 = udiv i32 %179, 1
  %181 = urem i32 %180, 100
  %182 = udiv i32 %179, 100
  %183 = urem i32 %182, 4
  %184 = udiv i32 %179, 400
  %Arg_1.243 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg1, i32 0, i32 %184, i32 %181, i32 0
  %Arg_1.244 = load float, ptr %Arg_1.243, align 4, !invariant.load !46
  %Arg_0.145 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.146 = load float, ptr %Arg_0.145, align 4, !invariant.load !46
  %multiply.947 = fmul float %Arg_1.244, %Arg_0.146
  store float %multiply.947, ptr %reduction_input_address, align 4
  %185 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11__1(ptr %185, ptr %reduction_input_address, ptr %return_buffer48)
  %186 = load float, ptr %return_buffer48, align 4
  store float %186, ptr %185, align 4
  %Arg_2.349 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg2, i32 0, i32 %184, i32 %181, i32 0
  %Arg_2.350 = load float, ptr %Arg_2.349, align 4, !invariant.load !46
  %Arg_0.151 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.152 = load float, ptr %Arg_0.151, align 4, !invariant.load !46
  %multiply.1853 = fmul float %Arg_2.350, %Arg_0.152
  store float %multiply.1853, ptr %reduction_input_address1, align 4
  %187 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_19(ptr %187, ptr %reduction_input_address1, ptr %return_buffer54)
  %188 = load float, ptr %return_buffer54, align 4
  store float %188, ptr %187, align 4
  %Arg_3.455 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg3, i32 0, i32 %184, i32 %181, i32 0
  %Arg_3.456 = load float, ptr %Arg_3.455, align 4, !invariant.load !46
  %Arg_0.157 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.158 = load float, ptr %Arg_0.157, align 4, !invariant.load !46
  %multiply.2659 = fmul float %Arg_3.456, %Arg_0.158
  store float %multiply.2659, ptr %reduction_input_address4, align 4
  %189 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_27(ptr %189, ptr %reduction_input_address4, ptr %return_buffer60)
  %190 = load float, ptr %return_buffer60, align 4
  store float %190, ptr %189, align 4
  %Arg_4.561 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %184, i32 %181, i32 0
  %Arg_4.562 = load float, ptr %Arg_4.561, align 4, !invariant.load !46
  %Arg_0.163 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.164 = load float, ptr %Arg_0.163, align 4, !invariant.load !46
  %multiply.3465 = fmul float %Arg_4.562, %Arg_0.164
  store float %multiply.3465, ptr %reduction_input_address7, align 4
  %191 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_35(ptr %191, ptr %reduction_input_address7, ptr %return_buffer66)
  %192 = load float, ptr %return_buffer66, align 4
  store float %192, ptr %191, align 4
  %Arg_0.167 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.168 = load float, ptr %Arg_0.167, align 4, !invariant.load !46
  store float %Arg_0.168, ptr %reduction_input_address10, align 4
  %193 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  call void @region_5_45(ptr %193, ptr %reduction_input_address10, ptr %return_buffer69)
  %194 = load float, ptr %return_buffer69, align 4
  store float %194, ptr %193, align 4
  %195 = mul nuw nsw i32 %181, 1
  %196 = add nuw nsw i32 0, %195
  %197 = mul nuw nsw i32 %183, 100
  %198 = add nuw nsw i32 %196, %197
  %199 = urem i32 %198, 4
  %200 = udiv i32 %198, 4
  %201 = udiv i32 %200, 100
  %202 = mul nuw nsw i32 %184, 1
  %203 = add nuw nsw i32 0, %202
  %204 = udiv i32 %203, 8192
  %Arg_5.670 = load float, ptr %arg5, align 4, !invariant.load !46
  %Arg_0.171 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %203, i32 %199, i32 %200
  %Arg_0.172 = load float, ptr %Arg_0.171, align 4, !invariant.load !46
  %multiply.4173 = fmul float %Arg_5.670, %Arg_0.172
  %205 = mul nuw nsw i32 %181, 1
  %206 = add nuw nsw i32 0, %205
  %207 = mul nuw nsw i32 %183, 100
  %208 = add nuw nsw i32 %206, %207
  %209 = mul nuw nsw i32 %184, 400
  %210 = add nuw nsw i32 %208, %209
  %211 = urem i32 %210, 4
  %212 = udiv i32 %210, 4
  %213 = udiv i32 %212, 819200
  %214 = mul nuw nsw i32 %211, 1
  %215 = add nuw nsw i32 0, %214
  %216 = udiv i32 %215, 4
  %217 = mul nuw nsw i32 %212, 1
  %218 = add nuw nsw i32 0, %217
  %219 = urem i32 %218, 100
  %220 = udiv i32 %218, 100
  %221 = udiv i32 %220, 8192
  %Arg_0.174 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %220, i32 %215, i32 %219
  %Arg_0.175 = load float, ptr %Arg_0.174, align 4, !invariant.load !46
  %222 = mul nuw nsw i32 %181, 1
  %223 = add nuw nsw i32 0, %222
  %224 = mul nuw nsw i32 %183, 100
  %225 = add nuw nsw i32 %223, %224
  %226 = mul nuw nsw i32 %184, 400
  %227 = add nuw nsw i32 %225, %226
  %228 = urem i32 %227, 4
  %229 = udiv i32 %227, 4
  %230 = udiv i32 %229, 819200
  %231 = getelementptr inbounds float, ptr %arg11, i32 %179
  store float %Arg_0.175, ptr %231, align 4
  %232 = mul nuw nsw i32 %181, 1
  %233 = add nuw nsw i32 0, %232
  %234 = mul nuw nsw i32 %183, 100
  %235 = add nuw nsw i32 %233, %234
  %236 = urem i32 %235, 4
  %237 = udiv i32 %235, 4
  %238 = udiv i32 %237, 100
  %239 = mul nuw nsw i32 %184, 1
  %240 = add nuw nsw i32 0, %239
  %241 = udiv i32 %240, 8192
  %242 = getelementptr inbounds float, ptr %arg10, i32 %179
  store float %multiply.4173, ptr %242, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %243 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %10, i32 0, i32 %35
  %244 = addrspacecast ptr addrspace(3) %243 to ptr
  %245 = load float, ptr %current_output, align 4
  store float %245, ptr %244, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %246 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %10, i32 0, i32 %lane_id
  %247 = addrspacecast ptr addrspace(3) %246 to ptr
  store float %region_0_51_constant_10, ptr %initial_value_addr, align 4
  %248 = icmp ult i32 %thread_id.x, 1
  %249 = select i1 %248, ptr %247, ptr %initial_value_addr
  %250 = icmp eq i32 %thread_id.x, 0
  br i1 %250, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %251 = mul i32 %thread_id.x, 1
  %252 = add i32 %tile_origin.1, %thread_id.y
  %253 = add i32 %tile_origin.2, %251
  %254 = add i32 %253, 0
  %255 = udiv i32 %252, 1
  %256 = urem i32 %255, 4
  %257 = udiv i32 %252, 4
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr %arg6, i32 0, i32 %257, i32 %256
  %output = load float, ptr %249, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

intra_warp_reduce_write-true106:                  ; preds = %inter_warp_reduce-after
  %258 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %10, i32 0, i32 %48
  %259 = addrspacecast ptr addrspace(3) %258 to ptr
  %260 = load float, ptr %current_output90, align 4
  store float %260, ptr %259, align 4
  br label %intra_warp_reduce_write-after107

inter_warp_reduce-true108:                        ; preds = %intra_warp_reduce_write-after107
  %261 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %10, i32 0, i32 %lane_id
  %262 = addrspacecast ptr addrspace(3) %261 to ptr
  store float %region_0_51_constant_103, ptr %initial_value_addr110, align 4
  %263 = icmp ult i32 %thread_id.x, 1
  %264 = select i1 %263, ptr %262, ptr %initial_value_addr110
  %265 = icmp eq i32 %thread_id.x, 0
  br i1 %265, label %reduction_write_output-true111, label %reduction_write_output-after112

reduction_write_output-after112:                  ; preds = %reduction_write_output-true111, %inter_warp_reduce-true108
  br label %inter_warp_reduce-after109

reduction_write_output-true111:                   ; preds = %inter_warp_reduce-true108
  %266 = mul i32 %thread_id.x, 1
  %267 = add i32 %tile_origin.1, %thread_id.y
  %268 = add i32 %tile_origin.2, %266
  %269 = add i32 %268, 0
  %270 = udiv i32 %267, 1
  %271 = urem i32 %270, 4
  %272 = udiv i32 %267, 4
  %output_element_address113 = getelementptr inbounds [8192 x [4 x float]], ptr %arg7, i32 0, i32 %272, i32 %271
  %output114 = load float, ptr %264, align 4
  store float %output114, ptr %output_element_address113, align 4
  br label %reduction_write_output-after112

intra_warp_reduce_write-true131:                  ; preds = %inter_warp_reduce-after109
  %273 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %10, i32 0, i32 %61
  %274 = addrspacecast ptr addrspace(3) %273 to ptr
  %275 = load float, ptr %current_output115, align 4
  store float %275, ptr %274, align 4
  br label %intra_warp_reduce_write-after132

inter_warp_reduce-true133:                        ; preds = %intra_warp_reduce_write-after132
  %276 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %10, i32 0, i32 %lane_id
  %277 = addrspacecast ptr addrspace(3) %276 to ptr
  store float %region_0_51_constant_106, ptr %initial_value_addr135, align 4
  %278 = icmp ult i32 %thread_id.x, 1
  %279 = select i1 %278, ptr %277, ptr %initial_value_addr135
  %280 = icmp eq i32 %thread_id.x, 0
  br i1 %280, label %reduction_write_output-true136, label %reduction_write_output-after137

reduction_write_output-after137:                  ; preds = %reduction_write_output-true136, %inter_warp_reduce-true133
  br label %inter_warp_reduce-after134

reduction_write_output-true136:                   ; preds = %inter_warp_reduce-true133
  %281 = mul i32 %thread_id.x, 1
  %282 = add i32 %tile_origin.1, %thread_id.y
  %283 = add i32 %tile_origin.2, %281
  %284 = add i32 %283, 0
  %285 = udiv i32 %282, 1
  %286 = urem i32 %285, 4
  %287 = udiv i32 %282, 4
  %output_element_address138 = getelementptr inbounds [8192 x [4 x float]], ptr %arg8, i32 0, i32 %287, i32 %286
  %output139 = load float, ptr %279, align 4
  store float %output139, ptr %output_element_address138, align 4
  br label %reduction_write_output-after137

intra_warp_reduce_write-true156:                  ; preds = %inter_warp_reduce-after134
  %288 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %10, i32 0, i32 %74
  %289 = addrspacecast ptr addrspace(3) %288 to ptr
  %290 = load float, ptr %current_output140, align 4
  store float %290, ptr %289, align 4
  br label %intra_warp_reduce_write-after157

inter_warp_reduce-true158:                        ; preds = %intra_warp_reduce_write-after157
  %291 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %10, i32 0, i32 %lane_id
  %292 = addrspacecast ptr addrspace(3) %291 to ptr
  store float %region_0_51_constant_109, ptr %initial_value_addr160, align 4
  %293 = icmp ult i32 %thread_id.x, 1
  %294 = select i1 %293, ptr %292, ptr %initial_value_addr160
  %295 = icmp eq i32 %thread_id.x, 0
  br i1 %295, label %reduction_write_output-true161, label %reduction_write_output-after162

reduction_write_output-after162:                  ; preds = %reduction_write_output-true161, %inter_warp_reduce-true158
  br label %inter_warp_reduce-after159

reduction_write_output-true161:                   ; preds = %inter_warp_reduce-true158
  %296 = mul i32 %thread_id.x, 1
  %297 = add i32 %tile_origin.1, %thread_id.y
  %298 = add i32 %tile_origin.2, %296
  %299 = add i32 %298, 0
  %300 = udiv i32 %297, 1
  %301 = urem i32 %300, 4
  %302 = udiv i32 %297, 4
  %output_element_address163 = getelementptr inbounds [8192 x [4 x float]], ptr %arg9, i32 0, i32 %302, i32 %301
  %output164 = load float, ptr %294, align 4
  store float %output164, ptr %output_element_address163, align 4
  br label %reduction_write_output-after162

intra_warp_reduce_write-true181:                  ; preds = %inter_warp_reduce-after159
  %303 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %10, i32 0, i32 %87
  %304 = addrspacecast ptr addrspace(3) %303 to ptr
  %305 = load float, ptr %current_output165, align 4
  store float %305, ptr %304, align 4
  br label %intra_warp_reduce_write-after182

inter_warp_reduce-true183:                        ; preds = %intra_warp_reduce_write-after182
  %306 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %10, i32 0, i32 %lane_id
  %307 = addrspacecast ptr addrspace(3) %306 to ptr
  store float %region_0_51_constant_1012, ptr %initial_value_addr185, align 4
  %308 = icmp ult i32 %thread_id.x, 1
  %309 = select i1 %308, ptr %307, ptr %initial_value_addr185
  %310 = icmp eq i32 %thread_id.x, 0
  br i1 %310, label %reduction_write_output-true186, label %reduction_write_output-after187

reduction_write_output-after187:                  ; preds = %reduction_write_output-true186, %inter_warp_reduce-true183
  br label %inter_warp_reduce-after184

reduction_write_output-true186:                   ; preds = %inter_warp_reduce-true183
  %311 = mul i32 %thread_id.x, 1
  %312 = add i32 %tile_origin.1, %thread_id.y
  %313 = add i32 %tile_origin.2, %311
  %314 = add i32 %313, 0
  %315 = udiv i32 %312, 1
  %316 = urem i32 %315, 4
  %317 = udiv i32 %312, 4
  %output_element_address188 = getelementptr inbounds [8192 x [4 x float]], ptr %arg12, i32 0, i32 %317, i32 %316
  %output189 = load float, ptr %309, align 4
  store float %output189, ptr %output_element_address188, align 4
  br label %reduction_write_output-after187
}

define internal void @region_1_11__1(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.14.typed = alloca float, align 4
  %Arg_0.12 = load float, ptr %Arg_0.12.typed, align 4
  %Arg_1.13 = load float, ptr %Arg_1.13.typed, align 4
  %add.14 = fadd float %Arg_0.12, %Arg_1.13
  store float %add.14, ptr %add.14.typed, align 4
  %load_ret_value = load float, ptr %add.14.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_19(ptr dereferenceable(4) %Arg_0.20.typed, ptr dereferenceable(4) %Arg_1.21.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.22.typed = alloca float, align 4
  %Arg_0.20 = load float, ptr %Arg_0.20.typed, align 4
  %Arg_1.21 = load float, ptr %Arg_1.21.typed, align 4
  %add.22 = fadd float %Arg_0.20, %Arg_1.21
  store float %add.22, ptr %add.22.typed, align 4
  %load_ret_value = load float, ptr %add.22.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_3_27(ptr dereferenceable(4) %Arg_0.28.typed, ptr dereferenceable(4) %Arg_1.29.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.30.typed = alloca float, align 4
  %Arg_0.28 = load float, ptr %Arg_0.28.typed, align 4
  %Arg_1.29 = load float, ptr %Arg_1.29.typed, align 4
  %add.30 = fadd float %Arg_0.28, %Arg_1.29
  store float %add.30, ptr %add.30.typed, align 4
  %load_ret_value = load float, ptr %add.30.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_4_35(ptr dereferenceable(4) %Arg_0.36.typed, ptr dereferenceable(4) %Arg_1.37.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.38.typed = alloca float, align 4
  %Arg_0.36 = load float, ptr %Arg_0.36.typed, align 4
  %Arg_1.37 = load float, ptr %Arg_1.37.typed, align 4
  %add.38 = fadd float %Arg_0.36, %Arg_1.37
  store float %add.38, ptr %add.38.typed, align 4
  %load_ret_value = load float, ptr %add.38.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_5_45(ptr dereferenceable(4) %Arg_0.46.typed, ptr dereferenceable(4) %Arg_1.47.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.48.typed = alloca float, align 4
  %Arg_0.46 = load float, ptr %Arg_0.46.typed, align 4
  %Arg_1.47 = load float, ptr %Arg_1.47.typed, align 4
  %add.48 = fadd float %Arg_0.46, %Arg_1.47
  store float %add.48, ptr %add.48.typed, align 4
  %load_ret_value = load float, ptr %add.48.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_6(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(1024) %arg4, ptr noalias align 128 dereferenceable(1024) %arg5, ptr noalias align 128 dereferenceable(1024) %arg6, ptr noalias align 128 dereferenceable(1024) %arg7) {
entry:
  %return_buffer166 = alloca float, align 4
  %result_from_other_lane164 = alloca float, align 4
  %return_buffer163 = alloca float, align 4
  %result_from_other_lane161 = alloca float, align 4
  %return_buffer160 = alloca float, align 4
  %result_from_other_lane158 = alloca float, align 4
  %return_buffer157 = alloca float, align 4
  %result_from_other_lane155 = alloca float, align 4
  %return_buffer154 = alloca float, align 4
  %result_from_other_lane152 = alloca float, align 4
  %return_buffer148 = alloca float, align 4
  %tile_loop.invar_address141 = alloca i32, align 4
  %y_in_tile.invar_address135 = alloca i32, align 4
  %partial_reduction_result121 = alloca float, align 4
  %reduction_input_address120 = alloca float, align 4
  %return_buffer115 = alloca float, align 4
  %result_from_other_lane113 = alloca float, align 4
  %return_buffer112 = alloca float, align 4
  %result_from_other_lane110 = alloca float, align 4
  %return_buffer109 = alloca float, align 4
  %result_from_other_lane107 = alloca float, align 4
  %return_buffer106 = alloca float, align 4
  %result_from_other_lane104 = alloca float, align 4
  %return_buffer103 = alloca float, align 4
  %result_from_other_lane101 = alloca float, align 4
  %return_buffer97 = alloca float, align 4
  %tile_loop.invar_address90 = alloca i32, align 4
  %y_in_tile.invar_address84 = alloca i32, align 4
  %partial_reduction_result70 = alloca float, align 4
  %reduction_input_address69 = alloca float, align 4
  %return_buffer64 = alloca float, align 4
  %result_from_other_lane62 = alloca float, align 4
  %return_buffer61 = alloca float, align 4
  %result_from_other_lane59 = alloca float, align 4
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane50 = alloca float, align 4
  %return_buffer46 = alloca float, align 4
  %tile_loop.invar_address39 = alloca i32, align 4
  %y_in_tile.invar_address33 = alloca i32, align 4
  %partial_reduction_result19 = alloca float, align 4
  %reduction_input_address18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane9 = alloca float, align 4
  %return_buffer8 = alloca float, align 4
  %result_from_other_lane6 = alloca float, align 4
  %return_buffer5 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !67
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after66, %reduce-group-0-after
  %3 = icmp eq i32 %0, 2
  br i1 %3, label %reduce-group-2-true, label %reduce-group-2-after

reduce-group-2-after:                             ; preds = %reduction_write_output-after117, %reduce-group-1-after
  %4 = icmp eq i32 %0, 3
  br i1 %4, label %reduce-group-3-true, label %reduce-group-3-after

reduce-group-3-after:                             ; preds = %reduction_write_output-after168, %reduce-group-2-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_31_constant_6 = load float, ptr @3, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_31_constant_6, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %8 = urem i32 %6, 1024
  %9 = udiv i32 %6, 1024
  %10 = mul i32 %7, 1
  %11 = add i32 %10, %9
  %12 = icmp ult i32 %11, 64
  br i1 %12, label %13, label %early_return

13:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %8, 32
  %thread_id.y = udiv i32 %8, 32
  %lane_id = urem i32 %8, 32
  %14 = udiv i32 %11, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %11, 1
  %17 = urem i32 %16, 1
  %18 = udiv i32 %11, 1
  %19 = icmp eq i32 %17, 0
  %tile_bound = select i1 %19, i32 128, i32 4096
  %20 = icmp eq i32 %15, 0
  %tile_bound1 = select i1 %20, i32 4, i32 32
  %tile_origin.0 = mul i32 %18, 1
  %tile_origin.1 = mul i32 %17, 4096
  %tile_origin.2 = mul i32 %15, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %13
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %21 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %21, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %22 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %23 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %24 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %24, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %25 = icmp eq i32 %tile_loop.indvar, 0
  %26 = mul i32 %tile_loop.indvar, 1
  %27 = add i32 %26, 0
  %x_loc = add i32 %27, %23
  %28 = add i32 %tile_origin.1, %y_in_tile.indvar
  %29 = add i32 %tile_origin.2, %x_loc
  %30 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %30, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !69

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !70

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %9, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %31 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %32 = load float, ptr %current_output, align 4
  store float %32, ptr %31, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %9, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %33 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result4 = load float, ptr %33, align 4
  %34 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  store float %34, ptr %result_from_other_lane, align 4
  call void @region_1_7(ptr %33, ptr %result_from_other_lane, ptr %return_buffer5)
  %35 = load float, ptr %return_buffer5, align 4
  store float %35, ptr %33, align 4
  %partial_reduction_result7 = load float, ptr %33, align 4
  %36 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result7, i32 8, i32 31)
  store float %36, ptr %result_from_other_lane6, align 4
  call void @region_1_7(ptr %33, ptr %result_from_other_lane6, ptr %return_buffer8)
  %37 = load float, ptr %return_buffer8, align 4
  store float %37, ptr %33, align 4
  %partial_reduction_result10 = load float, ptr %33, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 4, i32 31)
  store float %38, ptr %result_from_other_lane9, align 4
  call void @region_1_7(ptr %33, ptr %result_from_other_lane9, ptr %return_buffer11)
  %39 = load float, ptr %return_buffer11, align 4
  store float %39, ptr %33, align 4
  %partial_reduction_result13 = load float, ptr %33, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 2, i32 31)
  store float %40, ptr %result_from_other_lane12, align 4
  call void @region_1_7(ptr %33, ptr %result_from_other_lane12, ptr %return_buffer14)
  %41 = load float, ptr %return_buffer14, align 4
  store float %41, ptr %33, align 4
  %partial_reduction_result16 = load float, ptr %33, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 1, i32 31)
  store float %42, ptr %result_from_other_lane15, align 4
  call void @region_1_7(ptr %33, ptr %result_from_other_lane15, ptr %return_buffer17)
  %43 = load float, ptr %return_buffer17, align 4
  store float %43, ptr %33, align 4
  %44 = icmp ult i32 %thread_id.x, %tile_bound
  %45 = mul i32 %thread_id.y, 1
  %46 = icmp ult i32 %45, %tile_bound1
  %47 = and i1 %46, %44
  %48 = icmp eq i32 %lane_id, 0
  %49 = and i1 %47, %48
  br i1 %49, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %50 = mul nuw nsw i32 %29, 1
  %51 = add nuw nsw i32 0, %50
  %52 = mul nuw nsw i32 %28, 4
  %53 = add nuw nsw i32 %51, %52
  %54 = mul nuw nsw i32 %tile_origin.0, 512
  %55 = add nuw nsw i32 %53, %54
  %56 = udiv i32 %55, 1
  %57 = urem i32 %56, 4
  %58 = udiv i32 %55, 4
  %59 = urem i32 %58, 128
  %60 = udiv i32 %55, 512
  %61 = mul i32 %thread_id.x, 1
  %62 = sub i32 %x_loc, %61
  %63 = mul nuw nsw i32 %57, 1
  %64 = add nuw nsw i32 0, %63
  %65 = udiv i32 %64, 4
  %66 = mul nuw nsw i32 %59, 1
  %67 = add nuw nsw i32 0, %66
  %68 = mul nuw nsw i32 %60, 128
  %69 = add nuw nsw i32 %67, %68
  %70 = udiv i32 %69, 8192
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %55
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !46
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %71 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %62
  call void @region_1_7(ptr %71, ptr %reduction_input_address, ptr %return_buffer)
  %72 = load float, ptr %return_buffer, align 4
  store float %72, ptr %71, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %73 = mul i32 %thread_id.y, 1
  %74 = add i32 %tile_origin.1, %thread_id.x
  %75 = add i32 %tile_origin.2, %73
  %76 = add i32 %75, 0
  %77 = mul i32 %tile_origin.0, 4
  %78 = add i32 %77, %76
  %79 = udiv i32 %78, 1
  %80 = urem i32 %79, 4
  %81 = udiv i32 %78, 4
  %output_element_address = getelementptr inbounds [64 x [4 x float]], ptr %arg4, i32 0, i32 %81, i32 %80
  %output = load float, ptr %33, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %region_0_31_constant_620 = load float, ptr @3, align 4
  %82 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 0
  store float %region_0_31_constant_620, ptr %82, align 4
  %83 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %84 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %85 = urem i32 %83, 1024
  %86 = udiv i32 %83, 1024
  %87 = mul i32 %84, 1
  %88 = add i32 %87, %86
  %89 = icmp ult i32 %88, 64
  br i1 %89, label %90, label %early_return21

90:                                               ; preds = %reduce-group-1-true
  %thread_id.x22 = urem i32 %85, 32
  %thread_id.y23 = udiv i32 %85, 32
  %lane_id24 = urem i32 %85, 32
  %91 = udiv i32 %88, 1
  %92 = urem i32 %91, 1
  %93 = udiv i32 %88, 1
  %94 = urem i32 %93, 1
  %95 = udiv i32 %88, 1
  %96 = icmp eq i32 %94, 0
  %tile_bound25 = select i1 %96, i32 128, i32 4096
  %97 = icmp eq i32 %92, 0
  %tile_bound26 = select i1 %97, i32 4, i32 32
  %tile_origin.027 = mul i32 %95, 1
  %tile_origin.128 = mul i32 %94, 4096
  %tile_origin.229 = mul i32 %92, 32
  store i32 %thread_id.y23, ptr %y_in_tile.invar_address33, align 4
  br label %y_in_tile.loop_header31

y_in_tile.loop_header31:                          ; preds = %tile_loop.loop_exit36, %90
  %y_in_tile.indvar34 = load i32, ptr %y_in_tile.invar_address33, align 4
  %98 = icmp uge i32 %y_in_tile.indvar34, %tile_bound25
  br i1 %98, label %y_in_tile.loop_exit30, label %y_in_tile.loop_body32

y_in_tile.loop_body32:                            ; preds = %y_in_tile.loop_header31
  %invar.inc35 = add nuw nsw i32 %y_in_tile.indvar34, 32
  store i32 %invar.inc35, ptr %y_in_tile.invar_address33, align 4
  %99 = icmp eq i32 %y_in_tile.indvar34, %thread_id.y23
  %100 = mul i32 %thread_id.x22, 1
  store i32 0, ptr %tile_loop.invar_address39, align 4
  br label %tile_loop.loop_header37

tile_loop.loop_header37:                          ; preds = %x_in_tile-after44, %y_in_tile.loop_body32
  %tile_loop.indvar40 = load i32, ptr %tile_loop.invar_address39, align 4
  %101 = icmp uge i32 %tile_loop.indvar40, 1
  br i1 %101, label %tile_loop.loop_exit36, label %tile_loop.loop_body38

tile_loop.loop_body38:                            ; preds = %tile_loop.loop_header37
  %invar.inc41 = add nuw nsw i32 %tile_loop.indvar40, 1
  store i32 %invar.inc41, ptr %tile_loop.invar_address39, align 4
  %102 = icmp eq i32 %tile_loop.indvar40, 0
  %103 = mul i32 %tile_loop.indvar40, 1
  %104 = add i32 %103, 0
  %x_loc42 = add i32 %104, %100
  %105 = add i32 %tile_origin.128, %y_in_tile.indvar34
  %106 = add i32 %tile_origin.229, %x_loc42
  %107 = icmp ult i32 %x_loc42, %tile_bound26
  br i1 %107, label %x_in_tile-true43, label %x_in_tile-after44

x_in_tile-after44:                                ; preds = %x_in_tile-true43, %tile_loop.loop_body38
  br label %tile_loop.loop_header37, !llvm.loop !71

tile_loop.loop_exit36:                            ; preds = %tile_loop.loop_header37
  br label %y_in_tile.loop_header31, !llvm.loop !72

y_in_tile.loop_exit30:                            ; preds = %y_in_tile.loop_header31
  %shmem_output_address47 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %86, i32 0, i32 %thread_id.x22, i32 %thread_id.y23
  %108 = addrspacecast ptr addrspace(3) %shmem_output_address47 to ptr
  %current_output48 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 0
  %109 = load float, ptr %current_output48, align 4
  store float %109, ptr %108, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr49 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %86, i32 0, i32 %thread_id.y23, i32 %thread_id.x22
  %110 = addrspacecast ptr addrspace(3) %shmem_transposed_addr49 to ptr
  %partial_reduction_result51 = load float, ptr %110, align 4
  %111 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  store float %111, ptr %result_from_other_lane50, align 4
  call void @region_2_13(ptr %110, ptr %result_from_other_lane50, ptr %return_buffer52)
  %112 = load float, ptr %return_buffer52, align 4
  store float %112, ptr %110, align 4
  %partial_reduction_result54 = load float, ptr %110, align 4
  %113 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 8, i32 31)
  store float %113, ptr %result_from_other_lane53, align 4
  call void @region_2_13(ptr %110, ptr %result_from_other_lane53, ptr %return_buffer55)
  %114 = load float, ptr %return_buffer55, align 4
  store float %114, ptr %110, align 4
  %partial_reduction_result57 = load float, ptr %110, align 4
  %115 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 4, i32 31)
  store float %115, ptr %result_from_other_lane56, align 4
  call void @region_2_13(ptr %110, ptr %result_from_other_lane56, ptr %return_buffer58)
  %116 = load float, ptr %return_buffer58, align 4
  store float %116, ptr %110, align 4
  %partial_reduction_result60 = load float, ptr %110, align 4
  %117 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result60, i32 2, i32 31)
  store float %117, ptr %result_from_other_lane59, align 4
  call void @region_2_13(ptr %110, ptr %result_from_other_lane59, ptr %return_buffer61)
  %118 = load float, ptr %return_buffer61, align 4
  store float %118, ptr %110, align 4
  %partial_reduction_result63 = load float, ptr %110, align 4
  %119 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result63, i32 1, i32 31)
  store float %119, ptr %result_from_other_lane62, align 4
  call void @region_2_13(ptr %110, ptr %result_from_other_lane62, ptr %return_buffer64)
  %120 = load float, ptr %return_buffer64, align 4
  store float %120, ptr %110, align 4
  %121 = icmp ult i32 %thread_id.x22, %tile_bound25
  %122 = mul i32 %thread_id.y23, 1
  %123 = icmp ult i32 %122, %tile_bound26
  %124 = and i1 %123, %121
  %125 = icmp eq i32 %lane_id24, 0
  %126 = and i1 %124, %125
  br i1 %126, label %reduction_write_output-true65, label %reduction_write_output-after66

reduction_write_output-after66:                   ; preds = %reduction_write_output-true65, %y_in_tile.loop_exit30
  br label %reduce-group-1-after

early_return21:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true43:                                 ; preds = %tile_loop.loop_body38
  %127 = mul nuw nsw i32 %106, 1
  %128 = add nuw nsw i32 0, %127
  %129 = mul nuw nsw i32 %105, 4
  %130 = add nuw nsw i32 %128, %129
  %131 = mul nuw nsw i32 %tile_origin.027, 512
  %132 = add nuw nsw i32 %130, %131
  %133 = udiv i32 %132, 1
  %134 = urem i32 %133, 4
  %135 = udiv i32 %132, 4
  %136 = urem i32 %135, 128
  %137 = udiv i32 %132, 512
  %138 = mul i32 %thread_id.x22, 1
  %139 = sub i32 %x_loc42, %138
  %140 = mul nuw nsw i32 %134, 1
  %141 = add nuw nsw i32 0, %140
  %142 = udiv i32 %141, 4
  %143 = mul nuw nsw i32 %136, 1
  %144 = add nuw nsw i32 0, %143
  %145 = mul nuw nsw i32 %137, 128
  %146 = add nuw nsw i32 %144, %145
  %147 = udiv i32 %146, 8192
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %132
  %Arg_1.245 = load float, ptr %Arg_1.2, align 4, !invariant.load !46
  store float %Arg_1.245, ptr %reduction_input_address18, align 4
  %148 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 %139
  call void @region_2_13(ptr %148, ptr %reduction_input_address18, ptr %return_buffer46)
  %149 = load float, ptr %return_buffer46, align 4
  store float %149, ptr %148, align 4
  br label %x_in_tile-after44

reduction_write_output-true65:                    ; preds = %y_in_tile.loop_exit30
  %150 = mul i32 %thread_id.y23, 1
  %151 = add i32 %tile_origin.128, %thread_id.x22
  %152 = add i32 %tile_origin.229, %150
  %153 = add i32 %152, 0
  %154 = mul i32 %tile_origin.027, 4
  %155 = add i32 %154, %153
  %156 = udiv i32 %155, 1
  %157 = urem i32 %156, 4
  %158 = udiv i32 %155, 4
  %output_element_address67 = getelementptr inbounds [64 x [4 x float]], ptr %arg5, i32 0, i32 %158, i32 %157
  %output68 = load float, ptr %110, align 4
  store float %output68, ptr %output_element_address67, align 4
  br label %reduction_write_output-after66

reduce-group-2-true:                              ; preds = %reduce-group-1-after
  %region_0_31_constant_671 = load float, ptr @3, align 4
  %159 = getelementptr inbounds float, ptr %partial_reduction_result70, i32 0
  store float %region_0_31_constant_671, ptr %159, align 4
  %160 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %161 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %162 = urem i32 %160, 1024
  %163 = udiv i32 %160, 1024
  %164 = mul i32 %161, 1
  %165 = add i32 %164, %163
  %166 = icmp ult i32 %165, 64
  br i1 %166, label %167, label %early_return72

167:                                              ; preds = %reduce-group-2-true
  %thread_id.x73 = urem i32 %162, 32
  %thread_id.y74 = udiv i32 %162, 32
  %lane_id75 = urem i32 %162, 32
  %168 = udiv i32 %165, 1
  %169 = urem i32 %168, 1
  %170 = udiv i32 %165, 1
  %171 = urem i32 %170, 1
  %172 = udiv i32 %165, 1
  %173 = icmp eq i32 %171, 0
  %tile_bound76 = select i1 %173, i32 128, i32 4096
  %174 = icmp eq i32 %169, 0
  %tile_bound77 = select i1 %174, i32 4, i32 32
  %tile_origin.078 = mul i32 %172, 1
  %tile_origin.179 = mul i32 %171, 4096
  %tile_origin.280 = mul i32 %169, 32
  store i32 %thread_id.y74, ptr %y_in_tile.invar_address84, align 4
  br label %y_in_tile.loop_header82

y_in_tile.loop_header82:                          ; preds = %tile_loop.loop_exit87, %167
  %y_in_tile.indvar85 = load i32, ptr %y_in_tile.invar_address84, align 4
  %175 = icmp uge i32 %y_in_tile.indvar85, %tile_bound76
  br i1 %175, label %y_in_tile.loop_exit81, label %y_in_tile.loop_body83

y_in_tile.loop_body83:                            ; preds = %y_in_tile.loop_header82
  %invar.inc86 = add nuw nsw i32 %y_in_tile.indvar85, 32
  store i32 %invar.inc86, ptr %y_in_tile.invar_address84, align 4
  %176 = icmp eq i32 %y_in_tile.indvar85, %thread_id.y74
  %177 = mul i32 %thread_id.x73, 1
  store i32 0, ptr %tile_loop.invar_address90, align 4
  br label %tile_loop.loop_header88

tile_loop.loop_header88:                          ; preds = %x_in_tile-after95, %y_in_tile.loop_body83
  %tile_loop.indvar91 = load i32, ptr %tile_loop.invar_address90, align 4
  %178 = icmp uge i32 %tile_loop.indvar91, 1
  br i1 %178, label %tile_loop.loop_exit87, label %tile_loop.loop_body89

tile_loop.loop_body89:                            ; preds = %tile_loop.loop_header88
  %invar.inc92 = add nuw nsw i32 %tile_loop.indvar91, 1
  store i32 %invar.inc92, ptr %tile_loop.invar_address90, align 4
  %179 = icmp eq i32 %tile_loop.indvar91, 0
  %180 = mul i32 %tile_loop.indvar91, 1
  %181 = add i32 %180, 0
  %x_loc93 = add i32 %181, %177
  %182 = add i32 %tile_origin.179, %y_in_tile.indvar85
  %183 = add i32 %tile_origin.280, %x_loc93
  %184 = icmp ult i32 %x_loc93, %tile_bound77
  br i1 %184, label %x_in_tile-true94, label %x_in_tile-after95

x_in_tile-after95:                                ; preds = %x_in_tile-true94, %tile_loop.loop_body89
  br label %tile_loop.loop_header88, !llvm.loop !73

tile_loop.loop_exit87:                            ; preds = %tile_loop.loop_header88
  br label %y_in_tile.loop_header82, !llvm.loop !74

y_in_tile.loop_exit81:                            ; preds = %y_in_tile.loop_header82
  %shmem_output_address98 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %163, i32 0, i32 %thread_id.x73, i32 %thread_id.y74
  %185 = addrspacecast ptr addrspace(3) %shmem_output_address98 to ptr
  %current_output99 = getelementptr inbounds float, ptr %partial_reduction_result70, i32 0
  %186 = load float, ptr %current_output99, align 4
  store float %186, ptr %185, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr100 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %163, i32 0, i32 %thread_id.y74, i32 %thread_id.x73
  %187 = addrspacecast ptr addrspace(3) %shmem_transposed_addr100 to ptr
  %partial_reduction_result102 = load float, ptr %187, align 4
  %188 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result102, i32 16, i32 31)
  store float %188, ptr %result_from_other_lane101, align 4
  call void @region_3_19(ptr %187, ptr %result_from_other_lane101, ptr %return_buffer103)
  %189 = load float, ptr %return_buffer103, align 4
  store float %189, ptr %187, align 4
  %partial_reduction_result105 = load float, ptr %187, align 4
  %190 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result105, i32 8, i32 31)
  store float %190, ptr %result_from_other_lane104, align 4
  call void @region_3_19(ptr %187, ptr %result_from_other_lane104, ptr %return_buffer106)
  %191 = load float, ptr %return_buffer106, align 4
  store float %191, ptr %187, align 4
  %partial_reduction_result108 = load float, ptr %187, align 4
  %192 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result108, i32 4, i32 31)
  store float %192, ptr %result_from_other_lane107, align 4
  call void @region_3_19(ptr %187, ptr %result_from_other_lane107, ptr %return_buffer109)
  %193 = load float, ptr %return_buffer109, align 4
  store float %193, ptr %187, align 4
  %partial_reduction_result111 = load float, ptr %187, align 4
  %194 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result111, i32 2, i32 31)
  store float %194, ptr %result_from_other_lane110, align 4
  call void @region_3_19(ptr %187, ptr %result_from_other_lane110, ptr %return_buffer112)
  %195 = load float, ptr %return_buffer112, align 4
  store float %195, ptr %187, align 4
  %partial_reduction_result114 = load float, ptr %187, align 4
  %196 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result114, i32 1, i32 31)
  store float %196, ptr %result_from_other_lane113, align 4
  call void @region_3_19(ptr %187, ptr %result_from_other_lane113, ptr %return_buffer115)
  %197 = load float, ptr %return_buffer115, align 4
  store float %197, ptr %187, align 4
  %198 = icmp ult i32 %thread_id.x73, %tile_bound76
  %199 = mul i32 %thread_id.y74, 1
  %200 = icmp ult i32 %199, %tile_bound77
  %201 = and i1 %200, %198
  %202 = icmp eq i32 %lane_id75, 0
  %203 = and i1 %201, %202
  br i1 %203, label %reduction_write_output-true116, label %reduction_write_output-after117

reduction_write_output-after117:                  ; preds = %reduction_write_output-true116, %y_in_tile.loop_exit81
  br label %reduce-group-2-after

early_return72:                                   ; preds = %reduce-group-2-true
  ret void

x_in_tile-true94:                                 ; preds = %tile_loop.loop_body89
  %204 = mul nuw nsw i32 %183, 1
  %205 = add nuw nsw i32 0, %204
  %206 = mul nuw nsw i32 %182, 4
  %207 = add nuw nsw i32 %205, %206
  %208 = mul nuw nsw i32 %tile_origin.078, 512
  %209 = add nuw nsw i32 %207, %208
  %210 = udiv i32 %209, 1
  %211 = urem i32 %210, 4
  %212 = udiv i32 %209, 4
  %213 = urem i32 %212, 128
  %214 = udiv i32 %209, 512
  %215 = mul i32 %thread_id.x73, 1
  %216 = sub i32 %x_loc93, %215
  %217 = mul nuw nsw i32 %211, 1
  %218 = add nuw nsw i32 0, %217
  %219 = udiv i32 %218, 4
  %220 = mul nuw nsw i32 %213, 1
  %221 = add nuw nsw i32 0, %220
  %222 = mul nuw nsw i32 %214, 128
  %223 = add nuw nsw i32 %221, %222
  %224 = udiv i32 %223, 8192
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %209
  %Arg_2.396 = load float, ptr %Arg_2.3, align 4, !invariant.load !46
  store float %Arg_2.396, ptr %reduction_input_address69, align 4
  %225 = getelementptr inbounds float, ptr %partial_reduction_result70, i32 %216
  call void @region_3_19(ptr %225, ptr %reduction_input_address69, ptr %return_buffer97)
  %226 = load float, ptr %return_buffer97, align 4
  store float %226, ptr %225, align 4
  br label %x_in_tile-after95

reduction_write_output-true116:                   ; preds = %y_in_tile.loop_exit81
  %227 = mul i32 %thread_id.y74, 1
  %228 = add i32 %tile_origin.179, %thread_id.x73
  %229 = add i32 %tile_origin.280, %227
  %230 = add i32 %229, 0
  %231 = mul i32 %tile_origin.078, 4
  %232 = add i32 %231, %230
  %233 = udiv i32 %232, 1
  %234 = urem i32 %233, 4
  %235 = udiv i32 %232, 4
  %output_element_address118 = getelementptr inbounds [64 x [4 x float]], ptr %arg6, i32 0, i32 %235, i32 %234
  %output119 = load float, ptr %187, align 4
  store float %output119, ptr %output_element_address118, align 4
  br label %reduction_write_output-after117

reduce-group-3-true:                              ; preds = %reduce-group-2-after
  %region_0_31_constant_6122 = load float, ptr @3, align 4
  %236 = getelementptr inbounds float, ptr %partial_reduction_result121, i32 0
  store float %region_0_31_constant_6122, ptr %236, align 4
  %237 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %238 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %239 = urem i32 %237, 1024
  %240 = udiv i32 %237, 1024
  %241 = mul i32 %238, 1
  %242 = add i32 %241, %240
  %243 = icmp ult i32 %242, 64
  br i1 %243, label %244, label %early_return123

244:                                              ; preds = %reduce-group-3-true
  %thread_id.x124 = urem i32 %239, 32
  %thread_id.y125 = udiv i32 %239, 32
  %lane_id126 = urem i32 %239, 32
  %245 = udiv i32 %242, 1
  %246 = urem i32 %245, 1
  %247 = udiv i32 %242, 1
  %248 = urem i32 %247, 1
  %249 = udiv i32 %242, 1
  %250 = icmp eq i32 %248, 0
  %tile_bound127 = select i1 %250, i32 128, i32 4096
  %251 = icmp eq i32 %246, 0
  %tile_bound128 = select i1 %251, i32 4, i32 32
  %tile_origin.0129 = mul i32 %249, 1
  %tile_origin.1130 = mul i32 %248, 4096
  %tile_origin.2131 = mul i32 %246, 32
  store i32 %thread_id.y125, ptr %y_in_tile.invar_address135, align 4
  br label %y_in_tile.loop_header133

y_in_tile.loop_header133:                         ; preds = %tile_loop.loop_exit138, %244
  %y_in_tile.indvar136 = load i32, ptr %y_in_tile.invar_address135, align 4
  %252 = icmp uge i32 %y_in_tile.indvar136, %tile_bound127
  br i1 %252, label %y_in_tile.loop_exit132, label %y_in_tile.loop_body134

y_in_tile.loop_body134:                           ; preds = %y_in_tile.loop_header133
  %invar.inc137 = add nuw nsw i32 %y_in_tile.indvar136, 32
  store i32 %invar.inc137, ptr %y_in_tile.invar_address135, align 4
  %253 = icmp eq i32 %y_in_tile.indvar136, %thread_id.y125
  %254 = mul i32 %thread_id.x124, 1
  store i32 0, ptr %tile_loop.invar_address141, align 4
  br label %tile_loop.loop_header139

tile_loop.loop_header139:                         ; preds = %x_in_tile-after146, %y_in_tile.loop_body134
  %tile_loop.indvar142 = load i32, ptr %tile_loop.invar_address141, align 4
  %255 = icmp uge i32 %tile_loop.indvar142, 1
  br i1 %255, label %tile_loop.loop_exit138, label %tile_loop.loop_body140

tile_loop.loop_body140:                           ; preds = %tile_loop.loop_header139
  %invar.inc143 = add nuw nsw i32 %tile_loop.indvar142, 1
  store i32 %invar.inc143, ptr %tile_loop.invar_address141, align 4
  %256 = icmp eq i32 %tile_loop.indvar142, 0
  %257 = mul i32 %tile_loop.indvar142, 1
  %258 = add i32 %257, 0
  %x_loc144 = add i32 %258, %254
  %259 = add i32 %tile_origin.1130, %y_in_tile.indvar136
  %260 = add i32 %tile_origin.2131, %x_loc144
  %261 = icmp ult i32 %x_loc144, %tile_bound128
  br i1 %261, label %x_in_tile-true145, label %x_in_tile-after146

x_in_tile-after146:                               ; preds = %x_in_tile-true145, %tile_loop.loop_body140
  br label %tile_loop.loop_header139, !llvm.loop !75

tile_loop.loop_exit138:                           ; preds = %tile_loop.loop_header139
  br label %y_in_tile.loop_header133, !llvm.loop !76

y_in_tile.loop_exit132:                           ; preds = %y_in_tile.loop_header133
  %shmem_output_address149 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %240, i32 0, i32 %thread_id.x124, i32 %thread_id.y125
  %262 = addrspacecast ptr addrspace(3) %shmem_output_address149 to ptr
  %current_output150 = getelementptr inbounds float, ptr %partial_reduction_result121, i32 0
  %263 = load float, ptr %current_output150, align 4
  store float %263, ptr %262, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr151 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %240, i32 0, i32 %thread_id.y125, i32 %thread_id.x124
  %264 = addrspacecast ptr addrspace(3) %shmem_transposed_addr151 to ptr
  %partial_reduction_result153 = load float, ptr %264, align 4
  %265 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result153, i32 16, i32 31)
  store float %265, ptr %result_from_other_lane152, align 4
  call void @region_4_25(ptr %264, ptr %result_from_other_lane152, ptr %return_buffer154)
  %266 = load float, ptr %return_buffer154, align 4
  store float %266, ptr %264, align 4
  %partial_reduction_result156 = load float, ptr %264, align 4
  %267 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result156, i32 8, i32 31)
  store float %267, ptr %result_from_other_lane155, align 4
  call void @region_4_25(ptr %264, ptr %result_from_other_lane155, ptr %return_buffer157)
  %268 = load float, ptr %return_buffer157, align 4
  store float %268, ptr %264, align 4
  %partial_reduction_result159 = load float, ptr %264, align 4
  %269 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result159, i32 4, i32 31)
  store float %269, ptr %result_from_other_lane158, align 4
  call void @region_4_25(ptr %264, ptr %result_from_other_lane158, ptr %return_buffer160)
  %270 = load float, ptr %return_buffer160, align 4
  store float %270, ptr %264, align 4
  %partial_reduction_result162 = load float, ptr %264, align 4
  %271 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result162, i32 2, i32 31)
  store float %271, ptr %result_from_other_lane161, align 4
  call void @region_4_25(ptr %264, ptr %result_from_other_lane161, ptr %return_buffer163)
  %272 = load float, ptr %return_buffer163, align 4
  store float %272, ptr %264, align 4
  %partial_reduction_result165 = load float, ptr %264, align 4
  %273 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result165, i32 1, i32 31)
  store float %273, ptr %result_from_other_lane164, align 4
  call void @region_4_25(ptr %264, ptr %result_from_other_lane164, ptr %return_buffer166)
  %274 = load float, ptr %return_buffer166, align 4
  store float %274, ptr %264, align 4
  %275 = icmp ult i32 %thread_id.x124, %tile_bound127
  %276 = mul i32 %thread_id.y125, 1
  %277 = icmp ult i32 %276, %tile_bound128
  %278 = and i1 %277, %275
  %279 = icmp eq i32 %lane_id126, 0
  %280 = and i1 %278, %279
  br i1 %280, label %reduction_write_output-true167, label %reduction_write_output-after168

reduction_write_output-after168:                  ; preds = %reduction_write_output-true167, %y_in_tile.loop_exit132
  br label %reduce-group-3-after

early_return123:                                  ; preds = %reduce-group-3-true
  ret void

x_in_tile-true145:                                ; preds = %tile_loop.loop_body140
  %281 = mul nuw nsw i32 %260, 1
  %282 = add nuw nsw i32 0, %281
  %283 = mul nuw nsw i32 %259, 4
  %284 = add nuw nsw i32 %282, %283
  %285 = mul nuw nsw i32 %tile_origin.0129, 512
  %286 = add nuw nsw i32 %284, %285
  %287 = udiv i32 %286, 1
  %288 = urem i32 %287, 4
  %289 = udiv i32 %286, 4
  %290 = urem i32 %289, 128
  %291 = udiv i32 %286, 512
  %292 = mul i32 %thread_id.x124, 1
  %293 = sub i32 %x_loc144, %292
  %294 = mul nuw nsw i32 %288, 1
  %295 = add nuw nsw i32 0, %294
  %296 = udiv i32 %295, 4
  %297 = mul nuw nsw i32 %290, 1
  %298 = add nuw nsw i32 0, %297
  %299 = mul nuw nsw i32 %291, 128
  %300 = add nuw nsw i32 %298, %299
  %301 = udiv i32 %300, 8192
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %286
  %Arg_3.4147 = load float, ptr %Arg_3.4, align 4, !invariant.load !46
  store float %Arg_3.4147, ptr %reduction_input_address120, align 4
  %302 = getelementptr inbounds float, ptr %partial_reduction_result121, i32 %293
  call void @region_4_25(ptr %302, ptr %reduction_input_address120, ptr %return_buffer148)
  %303 = load float, ptr %return_buffer148, align 4
  store float %303, ptr %302, align 4
  br label %x_in_tile-after146

reduction_write_output-true167:                   ; preds = %y_in_tile.loop_exit132
  %304 = mul i32 %thread_id.y125, 1
  %305 = add i32 %tile_origin.1130, %thread_id.x124
  %306 = add i32 %tile_origin.2131, %304
  %307 = add i32 %306, 0
  %308 = mul i32 %tile_origin.0129, 4
  %309 = add i32 %308, %307
  %310 = udiv i32 %309, 1
  %311 = urem i32 %310, 4
  %312 = udiv i32 %309, 4
  %output_element_address169 = getelementptr inbounds [64 x [4 x float]], ptr %arg7, i32 0, i32 %312, i32 %311
  %output170 = load float, ptr %264, align 4
  store float %output170, ptr %output_element_address169, align 4
  br label %reduction_write_output-after168
}

define internal void @region_1_7(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.10.typed = alloca float, align 4
  %Arg_0.8 = load float, ptr %Arg_0.8.typed, align 4
  %Arg_1.9 = load float, ptr %Arg_1.9.typed, align 4
  %add.10 = fadd float %Arg_0.8, %Arg_1.9
  store float %add.10, ptr %add.10.typed, align 4
  %load_ret_value = load float, ptr %add.10.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_13(ptr dereferenceable(4) %Arg_0.14.typed, ptr dereferenceable(4) %Arg_1.15.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.16.typed = alloca float, align 4
  %Arg_0.14 = load float, ptr %Arg_0.14.typed, align 4
  %Arg_1.15 = load float, ptr %Arg_1.15.typed, align 4
  %add.16 = fadd float %Arg_0.14, %Arg_1.15
  store float %add.16, ptr %add.16.typed, align 4
  %load_ret_value = load float, ptr %add.16.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_3_19(ptr dereferenceable(4) %Arg_0.20.typed, ptr dereferenceable(4) %Arg_1.21.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.22.typed = alloca float, align 4
  %Arg_0.20 = load float, ptr %Arg_0.20.typed, align 4
  %Arg_1.21 = load float, ptr %Arg_1.21.typed, align 4
  %add.22 = fadd float %Arg_0.20, %Arg_1.21
  store float %add.22, ptr %add.22.typed, align 4
  %load_ret_value = load float, ptr %add.22.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_4_25(ptr dereferenceable(4) %Arg_0.26.typed, ptr dereferenceable(4) %Arg_1.27.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.28.typed = alloca float, align 4
  %Arg_0.26 = load float, ptr %Arg_0.26.typed, align 4
  %Arg_1.27 = load float, ptr %Arg_1.27.typed, align 4
  %add.28 = fadd float %Arg_0.26, %Arg_1.27
  store float %add.28, ptr %add.28.typed, align 4
  %load_ret_value = load float, ptr %add.28.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_5(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(1024) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 128 dereferenceable(1024) %arg4, ptr noalias align 16 dereferenceable(16) %arg5, ptr noalias align 128 dereferenceable(1024) %arg6, ptr noalias align 16 dereferenceable(16) %arg7, ptr noalias align 128 dereferenceable(1024) %arg8, ptr noalias align 128 dereferenceable(16) %arg9, ptr noalias align 128 dereferenceable(16) %arg10, ptr noalias align 128 dereferenceable(16) %arg11, ptr noalias align 128 dereferenceable(16) %arg12) {
entry:
  %return_buffer19 = alloca float, align 4
  %parameter_buffer18 = alloca float, align 4
  %parameter_buffer17 = alloca float, align 4
  %reduce.40.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_014 = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %parameter_buffer12 = alloca float, align 4
  %parameter_buffer11 = alloca float, align 4
  %reduce.32.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_08 = alloca float, align 4
  %return_buffer7 = alloca float, align 4
  %parameter_buffer6 = alloca float, align 4
  %parameter_buffer5 = alloca float, align 4
  %reduce.24.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_02 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.16.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !67
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index, 4
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %reduce.40.inner.loop_exit.reduction_dim.0, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !46
  %9 = load float, ptr %arg2, align 4, !invariant.load !46
  %region_0_45_constant_11 = load float, ptr @4, align 4
  store float %region_0_45_constant_11, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.16.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.16.inner.loop_header.reduction_dim.0

reduce.16.inner.loop_header.reduction_dim.0:      ; preds = %reduce.16.inner.loop_body.reduction_dim.0, %fusion_5.in_bounds-true
  %reduce.16.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.16.inner.invar_address.reduction_dim.0, align 4
  %10 = icmp uge i32 %reduce.16.inner.indvar.reduction_dim.0, 64
  br i1 %10, label %reduce.16.inner.loop_exit.reduction_dim.0, label %reduce.16.inner.loop_body.reduction_dim.0

reduce.16.inner.loop_body.reduction_dim.0:        ; preds = %reduce.16.inner.loop_header.reduction_dim.0
  %11 = load float, ptr %accumulator_0, align 4
  %12 = getelementptr inbounds [64 x [4 x float]], ptr %arg1, i32 0, i32 %reduce.16.inner.indvar.reduction_dim.0, i32 %4
  %13 = load float, ptr %12, align 4, !invariant.load !46
  store float %11, ptr %parameter_buffer, align 4
  store float %13, ptr %parameter_buffer1, align 4
  call void @region_1_12(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %14 = load float, ptr %return_buffer, align 4
  store float %14, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.16.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.16.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.16.inner.loop_header.reduction_dim.0

reduce.16.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.16.inner.loop_header.reduction_dim.0
  %15 = load float, ptr %accumulator_0, align 4
  %multiply.17 = fmul float %9, %15
  %subtract.19 = fsub float %8, %multiply.17
  %16 = insertvalue { float, float, float, float } undef, float %subtract.19, 0
  %17 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %18 = load float, ptr %17, align 4, !invariant.load !46
  %19 = load float, ptr %arg2, align 4, !invariant.load !46
  %region_0_45_constant_113 = load float, ptr @4, align 4
  store float %region_0_45_constant_113, ptr %accumulator_02, align 4
  store i32 0, ptr %reduce.24.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.24.inner.loop_header.reduction_dim.0

reduce.24.inner.loop_header.reduction_dim.0:      ; preds = %reduce.24.inner.loop_body.reduction_dim.0, %reduce.16.inner.loop_exit.reduction_dim.0
  %reduce.24.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.24.inner.invar_address.reduction_dim.0, align 4
  %20 = icmp uge i32 %reduce.24.inner.indvar.reduction_dim.0, 64
  br i1 %20, label %reduce.24.inner.loop_exit.reduction_dim.0, label %reduce.24.inner.loop_body.reduction_dim.0

reduce.24.inner.loop_body.reduction_dim.0:        ; preds = %reduce.24.inner.loop_header.reduction_dim.0
  %21 = load float, ptr %accumulator_02, align 4
  %22 = getelementptr inbounds [64 x [4 x float]], ptr %arg4, i32 0, i32 %reduce.24.inner.indvar.reduction_dim.0, i32 %4
  %23 = load float, ptr %22, align 4, !invariant.load !46
  store float %21, ptr %parameter_buffer5, align 4
  store float %23, ptr %parameter_buffer6, align 4
  call void @region_2_20(ptr %parameter_buffer5, ptr %parameter_buffer6, ptr %return_buffer7)
  %24 = load float, ptr %return_buffer7, align 4
  store float %24, ptr %accumulator_02, align 4
  %invar.inc4 = add nuw nsw i32 %reduce.24.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc4, ptr %reduce.24.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.24.inner.loop_header.reduction_dim.0

reduce.24.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.24.inner.loop_header.reduction_dim.0
  %25 = load float, ptr %accumulator_02, align 4
  %multiply.25 = fmul float %19, %25
  %subtract.27 = fsub float %18, %multiply.25
  %26 = insertvalue { float, float, float, float } %16, float %subtract.27, 1
  %27 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %28 = load float, ptr %27, align 4, !invariant.load !46
  %29 = load float, ptr %arg2, align 4, !invariant.load !46
  %region_0_45_constant_119 = load float, ptr @4, align 4
  store float %region_0_45_constant_119, ptr %accumulator_08, align 4
  store i32 0, ptr %reduce.32.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.0

reduce.32.inner.loop_header.reduction_dim.0:      ; preds = %reduce.32.inner.loop_body.reduction_dim.0, %reduce.24.inner.loop_exit.reduction_dim.0
  %reduce.32.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.32.inner.invar_address.reduction_dim.0, align 4
  %30 = icmp uge i32 %reduce.32.inner.indvar.reduction_dim.0, 64
  br i1 %30, label %reduce.32.inner.loop_exit.reduction_dim.0, label %reduce.32.inner.loop_body.reduction_dim.0

reduce.32.inner.loop_body.reduction_dim.0:        ; preds = %reduce.32.inner.loop_header.reduction_dim.0
  %31 = load float, ptr %accumulator_08, align 4
  %32 = getelementptr inbounds [64 x [4 x float]], ptr %arg6, i32 0, i32 %reduce.32.inner.indvar.reduction_dim.0, i32 %4
  %33 = load float, ptr %32, align 4, !invariant.load !46
  store float %31, ptr %parameter_buffer11, align 4
  store float %33, ptr %parameter_buffer12, align 4
  call void @region_3_28(ptr %parameter_buffer11, ptr %parameter_buffer12, ptr %return_buffer13)
  %34 = load float, ptr %return_buffer13, align 4
  store float %34, ptr %accumulator_08, align 4
  %invar.inc10 = add nuw nsw i32 %reduce.32.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc10, ptr %reduce.32.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.32.inner.loop_header.reduction_dim.0

reduce.32.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.32.inner.loop_header.reduction_dim.0
  %35 = load float, ptr %accumulator_08, align 4
  %multiply.33 = fmul float %29, %35
  %subtract.35 = fsub float %28, %multiply.33
  %36 = insertvalue { float, float, float, float } %26, float %subtract.35, 2
  %37 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %38 = load float, ptr %37, align 4, !invariant.load !46
  %39 = load float, ptr %arg2, align 4, !invariant.load !46
  %region_0_45_constant_1115 = load float, ptr @4, align 4
  store float %region_0_45_constant_1115, ptr %accumulator_014, align 4
  store i32 0, ptr %reduce.40.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.40.inner.loop_header.reduction_dim.0

reduce.40.inner.loop_header.reduction_dim.0:      ; preds = %reduce.40.inner.loop_body.reduction_dim.0, %reduce.32.inner.loop_exit.reduction_dim.0
  %reduce.40.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.40.inner.invar_address.reduction_dim.0, align 4
  %40 = icmp uge i32 %reduce.40.inner.indvar.reduction_dim.0, 64
  br i1 %40, label %reduce.40.inner.loop_exit.reduction_dim.0, label %reduce.40.inner.loop_body.reduction_dim.0

reduce.40.inner.loop_body.reduction_dim.0:        ; preds = %reduce.40.inner.loop_header.reduction_dim.0
  %41 = load float, ptr %accumulator_014, align 4
  %42 = getelementptr inbounds [64 x [4 x float]], ptr %arg8, i32 0, i32 %reduce.40.inner.indvar.reduction_dim.0, i32 %4
  %43 = load float, ptr %42, align 4, !invariant.load !46
  store float %41, ptr %parameter_buffer17, align 4
  store float %43, ptr %parameter_buffer18, align 4
  call void @region_4_36(ptr %parameter_buffer17, ptr %parameter_buffer18, ptr %return_buffer19)
  %44 = load float, ptr %return_buffer19, align 4
  store float %44, ptr %accumulator_014, align 4
  %invar.inc16 = add nuw nsw i32 %reduce.40.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc16, ptr %reduce.40.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.40.inner.loop_header.reduction_dim.0

reduce.40.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.40.inner.loop_header.reduction_dim.0
  %45 = load float, ptr %accumulator_014, align 4
  %multiply.41 = fmul float %39, %45
  %subtract.43 = fsub float %38, %multiply.41
  %46 = insertvalue { float, float, float, float } %36, float %subtract.43, 3
  %47 = extractvalue { float, float, float, float } %46, 0
  %48 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  store float %47, ptr %48, align 4
  %49 = extractvalue { float, float, float, float } %46, 1
  %50 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %49, ptr %50, align 4
  %51 = extractvalue { float, float, float, float } %46, 2
  %52 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %51, ptr %52, align 4
  %53 = extractvalue { float, float, float, float } %46, 3
  %54 = getelementptr inbounds float, ptr %arg12, i32 %linear_index
  store float %53, ptr %54, align 4
  br label %fusion_5.in_bounds-after
}

define internal void @region_1_12(ptr dereferenceable(4) %Arg_0.13.typed, ptr dereferenceable(4) %Arg_1.14.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.15.typed = alloca float, align 4
  %Arg_0.13 = load float, ptr %Arg_0.13.typed, align 4
  %Arg_1.14 = load float, ptr %Arg_1.14.typed, align 4
  %add.15 = fadd float %Arg_0.13, %Arg_1.14
  store float %add.15, ptr %add.15.typed, align 4
  %load_ret_value = load float, ptr %add.15.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_20(ptr dereferenceable(4) %Arg_0.21.typed, ptr dereferenceable(4) %Arg_1.22.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.23.typed = alloca float, align 4
  %Arg_0.21 = load float, ptr %Arg_0.21.typed, align 4
  %Arg_1.22 = load float, ptr %Arg_1.22.typed, align 4
  %add.23 = fadd float %Arg_0.21, %Arg_1.22
  store float %add.23, ptr %add.23.typed, align 4
  %load_ret_value = load float, ptr %add.23.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_3_28(ptr dereferenceable(4) %Arg_0.29.typed, ptr dereferenceable(4) %Arg_1.30.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.31.typed = alloca float, align 4
  %Arg_0.29 = load float, ptr %Arg_0.29.typed, align 4
  %Arg_1.30 = load float, ptr %Arg_1.30.typed, align 4
  %add.31 = fadd float %Arg_0.29, %Arg_1.30
  store float %add.31, ptr %add.31.typed, align 4
  %load_ret_value = load float, ptr %add.31.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_4_36(ptr dereferenceable(4) %Arg_0.37.typed, ptr dereferenceable(4) %Arg_1.38.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.39.typed = alloca float, align 4
  %Arg_0.37 = load float, ptr %Arg_0.37.typed, align 4
  %Arg_1.38 = load float, ptr %Arg_1.38.typed, align 4
  %add.39 = fadd float %Arg_0.37, %Arg_1.38
  store float %add.39, ptr %add.39.typed, align 4
  %load_ret_value = load float, ptr %add.39.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_25(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(1024) %arg1) {
entry:
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane9 = alloca float, align 4
  %return_buffer8 = alloca float, align 4
  %result_from_other_lane6 = alloca float, align 4
  %return_buffer5 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !48
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_9_constant_3 = load float, ptr @5, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_9_constant_3, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !68
  %5 = urem i32 %3, 1024
  %6 = udiv i32 %3, 1024
  %7 = mul i32 %4, 1
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 64
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 1
  %15 = udiv i32 %8, 1
  %16 = icmp eq i32 %14, 0
  %tile_bound = select i1 %16, i32 128, i32 4096
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 4, i32 32
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 4096
  %tile_origin.2 = mul i32 %12, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %10
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %18 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %18, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %19 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %20 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %21 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %21, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %22 = icmp eq i32 %tile_loop.indvar, 0
  %23 = mul i32 %tile_loop.indvar, 1
  %24 = add i32 %23, 0
  %x_loc = add i32 %24, %20
  %25 = add i32 %tile_origin.1, %y_in_tile.indvar
  %26 = add i32 %tile_origin.2, %x_loc
  %27 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %27, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !77

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !78

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i32 0, i32 %6, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %28 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %29 = load float, ptr %current_output, align 4
  store float %29, ptr %28, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i32 0, i32 %6, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %30 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result4 = load float, ptr %30, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  store float %31, ptr %result_from_other_lane, align 4
  call void @region_1_4(ptr %30, ptr %result_from_other_lane, ptr %return_buffer5)
  %32 = load float, ptr %return_buffer5, align 4
  store float %32, ptr %30, align 4
  %partial_reduction_result7 = load float, ptr %30, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result7, i32 8, i32 31)
  store float %33, ptr %result_from_other_lane6, align 4
  call void @region_1_4(ptr %30, ptr %result_from_other_lane6, ptr %return_buffer8)
  %34 = load float, ptr %return_buffer8, align 4
  store float %34, ptr %30, align 4
  %partial_reduction_result10 = load float, ptr %30, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 4, i32 31)
  store float %35, ptr %result_from_other_lane9, align 4
  call void @region_1_4(ptr %30, ptr %result_from_other_lane9, ptr %return_buffer11)
  %36 = load float, ptr %return_buffer11, align 4
  store float %36, ptr %30, align 4
  %partial_reduction_result13 = load float, ptr %30, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 2, i32 31)
  store float %37, ptr %result_from_other_lane12, align 4
  call void @region_1_4(ptr %30, ptr %result_from_other_lane12, ptr %return_buffer14)
  %38 = load float, ptr %return_buffer14, align 4
  store float %38, ptr %30, align 4
  %partial_reduction_result16 = load float, ptr %30, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 1, i32 31)
  store float %39, ptr %result_from_other_lane15, align 4
  call void @region_1_4(ptr %30, ptr %result_from_other_lane15, ptr %return_buffer17)
  %40 = load float, ptr %return_buffer17, align 4
  store float %40, ptr %30, align 4
  %41 = icmp ult i32 %thread_id.x, %tile_bound
  %42 = mul i32 %thread_id.y, 1
  %43 = icmp ult i32 %42, %tile_bound1
  %44 = and i1 %43, %41
  %45 = icmp eq i32 %lane_id, 0
  %46 = and i1 %44, %45
  br i1 %46, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %47 = mul nuw nsw i32 %26, 1
  %48 = add nuw nsw i32 0, %47
  %49 = mul nuw nsw i32 %25, 4
  %50 = add nuw nsw i32 %48, %49
  %51 = mul nuw nsw i32 %tile_origin.0, 512
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 4
  %55 = udiv i32 %52, 4
  %56 = urem i32 %55, 128
  %57 = udiv i32 %52, 512
  %58 = mul i32 %thread_id.x, 1
  %59 = sub i32 %x_loc, %58
  %60 = mul nuw nsw i32 %54, 1
  %61 = add nuw nsw i32 0, %60
  %62 = udiv i32 %61, 4
  %63 = mul nuw nsw i32 %56, 1
  %64 = add nuw nsw i32 0, %63
  %65 = mul nuw nsw i32 %57, 128
  %66 = add nuw nsw i32 %64, %65
  %67 = udiv i32 %66, 8192
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !46
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %68 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %59
  call void @region_1_4(ptr %68, ptr %reduction_input_address, ptr %return_buffer)
  %69 = load float, ptr %return_buffer, align 4
  store float %69, ptr %68, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %70 = mul i32 %thread_id.y, 1
  %71 = add i32 %tile_origin.1, %thread_id.x
  %72 = add i32 %tile_origin.2, %70
  %73 = add i32 %72, 0
  %74 = mul i32 %tile_origin.0, 4
  %75 = add i32 %74, %73
  %76 = udiv i32 %75, 1
  %77 = urem i32 %76, 4
  %78 = udiv i32 %75, 4
  %output_element_address = getelementptr inbounds [64 x [4 x float]], ptr %arg1, i32 0, i32 %78, i32 %77
  %output = load float, ptr %30, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_4(ptr dereferenceable(4) %Arg_0.5.typed, ptr dereferenceable(4) %Arg_1.6.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.7.typed = alloca float, align 4
  %Arg_0.5 = load float, ptr %Arg_0.5.typed, align 4
  %Arg_1.6 = load float, ptr %Arg_1.6.typed, align 4
  %add.7 = fadd float %Arg_0.5, %Arg_1.6
  store float %add.7, ptr %add.7.typed, align 4
  %load_ret_value = load float, ptr %add.7.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_24(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(1024) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(16) %arg3) {
entry:
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.10.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !48
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !67
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %fusion_24.in_bounds-true, label %fusion_24.in_bounds-after

fusion_24.in_bounds-after:                        ; preds = %reduce.10.inner.loop_exit.reduction_dim.0, %entry
  ret void

fusion_24.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !46
  %7 = load float, ptr %arg2, align 4, !invariant.load !46
  %region_0_13_constant_5 = load float, ptr @6, align 4
  store float %region_0_13_constant_5, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.10.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.10.inner.loop_header.reduction_dim.0

reduce.10.inner.loop_header.reduction_dim.0:      ; preds = %reduce.10.inner.loop_body.reduction_dim.0, %fusion_24.in_bounds-true
  %reduce.10.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.10.inner.invar_address.reduction_dim.0, align 4
  %8 = icmp uge i32 %reduce.10.inner.indvar.reduction_dim.0, 64
  br i1 %8, label %reduce.10.inner.loop_exit.reduction_dim.0, label %reduce.10.inner.loop_body.reduction_dim.0

reduce.10.inner.loop_body.reduction_dim.0:        ; preds = %reduce.10.inner.loop_header.reduction_dim.0
  %9 = load float, ptr %accumulator_0, align 4
  %10 = getelementptr inbounds [64 x [4 x float]], ptr %arg1, i32 0, i32 %reduce.10.inner.indvar.reduction_dim.0, i32 %3
  %11 = load float, ptr %10, align 4, !invariant.load !46
  store float %9, ptr %parameter_buffer, align 4
  store float %11, ptr %parameter_buffer1, align 4
  call void @region_1_6__1(ptr %parameter_buffer, ptr %parameter_buffer1, ptr %return_buffer)
  %12 = load float, ptr %return_buffer, align 4
  store float %12, ptr %accumulator_0, align 4
  %invar.inc = add nuw nsw i32 %reduce.10.inner.indvar.reduction_dim.0, 1
  store i32 %invar.inc, ptr %reduce.10.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.10.inner.loop_header.reduction_dim.0

reduce.10.inner.loop_exit.reduction_dim.0:        ; preds = %reduce.10.inner.loop_header.reduction_dim.0
  %13 = load float, ptr %accumulator_0, align 4
  %multiply.11 = fmul float %7, %13
  %subtract.12 = fsub float %6, %multiply.11
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %subtract.12, ptr %14, align 4
  br label %fusion_24.in_bounds-after
}

define internal void @region_1_6__1(ptr dereferenceable(4) %Arg_0.7.typed, ptr dereferenceable(4) %Arg_1.8.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.9.typed = alloca float, align 4
  %Arg_0.7 = load float, ptr %Arg_0.7.typed, align 4
  %Arg_1.8 = load float, ptr %Arg_1.8.typed, align 4
  %add.9 = fadd float %Arg_0.7, %Arg_1.8
  store float %add.9, ptr %add.9.typed, align 4
  %load_ret_value = load float, ptr %add.9.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_19(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 16 dereferenceable(16) %arg1, ptr noalias align 16 dereferenceable(16) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 16 dereferenceable(16) %arg4, ptr noalias align 128 dereferenceable(3276800) %arg5, ptr noalias align 128 dereferenceable(3276800) %arg6, ptr noalias align 128 dereferenceable(3276800) %arg7, ptr noalias align 128 dereferenceable(3276800) %arg8) {
entry:
  %return_buffer90 = alloca float, align 4
  %result_from_other_lane88 = alloca float, align 4
  %return_buffer87 = alloca float, align 4
  %result_from_other_lane85 = alloca float, align 4
  %return_buffer79 = alloca float, align 4
  %result_from_other_lane77 = alloca float, align 4
  %return_buffer76 = alloca float, align 4
  %result_from_other_lane74 = alloca float, align 4
  %return_buffer68 = alloca float, align 4
  %result_from_other_lane66 = alloca float, align 4
  %return_buffer65 = alloca float, align 4
  %result_from_other_lane63 = alloca float, align 4
  %return_buffer61 = alloca float, align 4
  %result_from_other_lane59 = alloca float, align 4
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer56 = alloca float, align 4
  %return_buffer50 = alloca float, align 4
  %return_buffer44 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %tile_loop.invar_address29 = alloca i32, align 4
  %return_buffer25 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result8 = alloca float, align 4
  %reduction_input_address7 = alloca float, align 4
  %partial_reduction_result5 = alloca float, align 4
  %reduction_input_address4 = alloca float, align 4
  %partial_reduction_result2 = alloca float, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !48
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after92, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_40_constant_9 = load float, ptr @7, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_40_constant_9, ptr %2, align 4
  %region_0_40_constant_93 = load float, ptr @7, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_40_constant_93, ptr %3, align 4
  %region_0_40_constant_96 = load float, ptr @7, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  store float %region_0_40_constant_96, ptr %4, align 4
  %region_0_40_constant_99 = load float, ptr @7, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  store float %region_0_40_constant_99, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !49
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !79
  %8 = urem i32 %6, 4
  %9 = udiv i32 %6, 4
  %10 = mul i32 %7, 24
  %11 = add i32 %10, %9
  %12 = icmp ult i32 %11, 819200
  br i1 %12, label %13, label %early_return

13:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %8, 4
  %thread_id.y = udiv i32 %8, 4
  %lane_id = urem i32 %8, 32
  %14 = udiv i32 %11, 1
  %15 = urem i32 %14, 1
  %16 = udiv i32 %11, 1
  %17 = urem i32 %16, 819200
  %18 = udiv i32 %11, 819200
  %19 = icmp eq i32 %17, 819199
  %tile_bound = select i1 %19, i32 1, i32 1
  %20 = icmp eq i32 %15, 0
  %tile_bound10 = select i1 %20, i32 4, i32 64
  %tile_origin.0 = mul i32 %18, 1
  %tile_origin.1 = mul i32 %17, 1
  %tile_origin.2 = mul i32 %15, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %13
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %21 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %21, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %22 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %23 = icmp eq i32 64, %tile_bound10
  br i1 %23, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit26, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !80

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result57 = load float, ptr %current_output, align 4
  %24 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 2, i32 31)
  store float %24, ptr %result_from_other_lane, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer58)
  %25 = load float, ptr %return_buffer58, align 4
  store float %25, ptr %current_output, align 4
  %partial_reduction_result60 = load float, ptr %current_output, align 4
  %26 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result60, i32 1, i32 31)
  store float %26, ptr %result_from_other_lane59, align 4
  call void @region_1_10(ptr %current_output, ptr %result_from_other_lane59, ptr %return_buffer61)
  %27 = load float, ptr %return_buffer61, align 4
  store float %27, ptr %current_output, align 4
  %28 = udiv i32 %thread_id.x, 32
  %29 = and i32 %thread_id.x, 3
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %current_output62 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %partial_reduction_result64 = load float, ptr %current_output62, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result64, i32 2, i32 31)
  store float %31, ptr %result_from_other_lane63, align 4
  call void @region_2_18(ptr %current_output62, ptr %result_from_other_lane63, ptr %return_buffer65)
  %32 = load float, ptr %return_buffer65, align 4
  store float %32, ptr %current_output62, align 4
  %partial_reduction_result67 = load float, ptr %current_output62, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 1, i32 31)
  store float %33, ptr %result_from_other_lane66, align 4
  call void @region_2_18(ptr %current_output62, ptr %result_from_other_lane66, ptr %return_buffer68)
  %34 = load float, ptr %return_buffer68, align 4
  store float %34, ptr %current_output62, align 4
  %35 = udiv i32 %thread_id.x, 32
  %36 = and i32 %thread_id.x, 3
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %reduction_write_output-true69, label %reduction_write_output-after70

reduction_write_output-after70:                   ; preds = %reduction_write_output-true69, %reduction_write_output-after
  %current_output73 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  %partial_reduction_result75 = load float, ptr %current_output73, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result75, i32 2, i32 31)
  store float %38, ptr %result_from_other_lane74, align 4
  call void @region_3_26(ptr %current_output73, ptr %result_from_other_lane74, ptr %return_buffer76)
  %39 = load float, ptr %return_buffer76, align 4
  store float %39, ptr %current_output73, align 4
  %partial_reduction_result78 = load float, ptr %current_output73, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result78, i32 1, i32 31)
  store float %40, ptr %result_from_other_lane77, align 4
  call void @region_3_26(ptr %current_output73, ptr %result_from_other_lane77, ptr %return_buffer79)
  %41 = load float, ptr %return_buffer79, align 4
  store float %41, ptr %current_output73, align 4
  %42 = udiv i32 %thread_id.x, 32
  %43 = and i32 %thread_id.x, 3
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %reduction_write_output-true80, label %reduction_write_output-after81

reduction_write_output-after81:                   ; preds = %reduction_write_output-true80, %reduction_write_output-after70
  %current_output84 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  %partial_reduction_result86 = load float, ptr %current_output84, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result86, i32 2, i32 31)
  store float %45, ptr %result_from_other_lane85, align 4
  call void @region_4_34(ptr %current_output84, ptr %result_from_other_lane85, ptr %return_buffer87)
  %46 = load float, ptr %return_buffer87, align 4
  store float %46, ptr %current_output84, align 4
  %partial_reduction_result89 = load float, ptr %current_output84, align 4
  %47 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result89, i32 1, i32 31)
  store float %47, ptr %result_from_other_lane88, align 4
  call void @region_4_34(ptr %current_output84, ptr %result_from_other_lane88, ptr %return_buffer90)
  %48 = load float, ptr %return_buffer90, align 4
  store float %48, ptr %current_output84, align 4
  %49 = udiv i32 %thread_id.x, 32
  %50 = and i32 %thread_id.x, 3
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %reduction_write_output-true91, label %reduction_write_output-after92

reduction_write_output-after92:                   ; preds = %reduction_write_output-true91, %reduction_write_output-after81
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %52 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %53 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %53, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc11 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc11, ptr %tile_loop.invar_address, align 4
  %54 = icmp eq i32 %tile_loop.indvar, 0
  %55 = mul i32 %tile_loop.indvar, 4
  %56 = add i32 %55, 0
  %x_loc = add i32 %56, %52
  %57 = add i32 %tile_origin.1, %y_in_tile.indvar
  %58 = add i32 %tile_origin.2, %x_loc
  %Arg_0.1 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %57, i32 %58
  %Arg_0.112 = load float, ptr %Arg_0.1, align 4, !invariant.load !46
  %Arg_1.2 = getelementptr inbounds [1 x [4 x float]], ptr %arg1, i32 0, i32 0, i32 %58
  %Arg_1.213 = load float, ptr %Arg_1.2, align 4, !invariant.load !46
  %multiply.8 = fmul float %Arg_0.112, %Arg_1.213
  store float %multiply.8, ptr %reduction_input_address, align 4
  %59 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10(ptr %59, ptr %reduction_input_address, ptr %return_buffer)
  %60 = load float, ptr %return_buffer, align 4
  store float %60, ptr %59, align 4
  %Arg_0.114 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %57, i32 %58
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !46
  %Arg_2.3 = getelementptr inbounds [1 x [4 x float]], ptr %arg2, i32 0, i32 0, i32 %58
  %Arg_2.316 = load float, ptr %Arg_2.3, align 4, !invariant.load !46
  %multiply.17 = fmul float %Arg_0.115, %Arg_2.316
  store float %multiply.17, ptr %reduction_input_address1, align 4
  %61 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_18(ptr %61, ptr %reduction_input_address1, ptr %return_buffer17)
  %62 = load float, ptr %return_buffer17, align 4
  store float %62, ptr %61, align 4
  %Arg_0.118 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %57, i32 %58
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !46
  %Arg_3.4 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %58
  %Arg_3.420 = load float, ptr %Arg_3.4, align 4, !invariant.load !46
  %multiply.25 = fmul float %Arg_0.119, %Arg_3.420
  store float %multiply.25, ptr %reduction_input_address4, align 4
  %63 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_26(ptr %63, ptr %reduction_input_address4, ptr %return_buffer21)
  %64 = load float, ptr %return_buffer21, align 4
  store float %64, ptr %63, align 4
  %Arg_0.122 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %57, i32 %58
  %Arg_0.123 = load float, ptr %Arg_0.122, align 4, !invariant.load !46
  %Arg_4.5 = getelementptr inbounds [1 x [4 x float]], ptr %arg4, i32 0, i32 0, i32 %58
  %Arg_4.524 = load float, ptr %Arg_4.5, align 4, !invariant.load !46
  %multiply.33 = fmul float %Arg_0.123, %Arg_4.524
  store float %multiply.33, ptr %reduction_input_address7, align 4
  %65 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_34(ptr %65, ptr %reduction_input_address7, ptr %return_buffer25)
  %66 = load float, ptr %return_buffer25, align 4
  store float %66, ptr %65, align 4
  br label %tile_loop.loop_header, !llvm.loop !81

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %67 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address29, align 4
  br label %tile_loop.loop_header27

tile_loop.loop_header27:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar30 = load i32, ptr %tile_loop.invar_address29, align 4
  %68 = icmp uge i32 %tile_loop.indvar30, 16
  br i1 %68, label %tile_loop.loop_exit26, label %tile_loop.loop_body28

tile_loop.loop_body28:                            ; preds = %tile_loop.loop_header27
  %invar.inc31 = add nuw nsw i32 %tile_loop.indvar30, 1
  store i32 %invar.inc31, ptr %tile_loop.invar_address29, align 4
  %69 = icmp eq i32 %tile_loop.indvar30, 0
  %70 = mul i32 %tile_loop.indvar30, 4
  %71 = add i32 %70, 0
  %x_loc32 = add i32 %71, %67
  %72 = add i32 %tile_origin.1, %y_in_tile.indvar
  %73 = add i32 %tile_origin.2, %x_loc32
  %74 = icmp ult i32 %x_loc32, %tile_bound10
  br i1 %74, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body28
  br label %tile_loop.loop_header27, !llvm.loop !82

tile_loop.loop_exit26:                            ; preds = %tile_loop.loop_header27
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body28
  %Arg_0.133 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %72, i32 %73
  %Arg_0.134 = load float, ptr %Arg_0.133, align 4, !invariant.load !46
  %Arg_1.235 = getelementptr inbounds [1 x [4 x float]], ptr %arg1, i32 0, i32 0, i32 %73
  %Arg_1.236 = load float, ptr %Arg_1.235, align 4, !invariant.load !46
  %multiply.837 = fmul float %Arg_0.134, %Arg_1.236
  store float %multiply.837, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10(ptr %75, ptr %reduction_input_address, ptr %return_buffer38)
  %76 = load float, ptr %return_buffer38, align 4
  store float %76, ptr %75, align 4
  %Arg_0.139 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %72, i32 %73
  %Arg_0.140 = load float, ptr %Arg_0.139, align 4, !invariant.load !46
  %Arg_2.341 = getelementptr inbounds [1 x [4 x float]], ptr %arg2, i32 0, i32 0, i32 %73
  %Arg_2.342 = load float, ptr %Arg_2.341, align 4, !invariant.load !46
  %multiply.1743 = fmul float %Arg_0.140, %Arg_2.342
  store float %multiply.1743, ptr %reduction_input_address1, align 4
  %77 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_18(ptr %77, ptr %reduction_input_address1, ptr %return_buffer44)
  %78 = load float, ptr %return_buffer44, align 4
  store float %78, ptr %77, align 4
  %Arg_0.145 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %72, i32 %73
  %Arg_0.146 = load float, ptr %Arg_0.145, align 4, !invariant.load !46
  %Arg_3.447 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %73
  %Arg_3.448 = load float, ptr %Arg_3.447, align 4, !invariant.load !46
  %multiply.2549 = fmul float %Arg_0.146, %Arg_3.448
  store float %multiply.2549, ptr %reduction_input_address4, align 4
  %79 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_26(ptr %79, ptr %reduction_input_address4, ptr %return_buffer50)
  %80 = load float, ptr %return_buffer50, align 4
  store float %80, ptr %79, align 4
  %Arg_0.151 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %72, i32 %73
  %Arg_0.152 = load float, ptr %Arg_0.151, align 4, !invariant.load !46
  %Arg_4.553 = getelementptr inbounds [1 x [4 x float]], ptr %arg4, i32 0, i32 0, i32 %73
  %Arg_4.554 = load float, ptr %Arg_4.553, align 4, !invariant.load !46
  %multiply.3355 = fmul float %Arg_0.152, %Arg_4.554
  store float %multiply.3355, ptr %reduction_input_address7, align 4
  %81 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_34(ptr %81, ptr %reduction_input_address7, ptr %return_buffer56)
  %82 = load float, ptr %return_buffer56, align 4
  store float %82, ptr %81, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %83 = mul i32 %thread_id.x, 1
  %84 = add i32 %tile_origin.1, %thread_id.y
  %85 = add i32 %tile_origin.2, %83
  %86 = add i32 %85, 0
  %87 = udiv i32 %84, 1
  %output_element_address = getelementptr inbounds [819200 x float], ptr %arg5, i32 0, i32 %87
  %output = load float, ptr %current_output, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true69:                    ; preds = %reduction_write_output-after
  %88 = mul i32 %thread_id.x, 1
  %89 = add i32 %tile_origin.1, %thread_id.y
  %90 = add i32 %tile_origin.2, %88
  %91 = add i32 %90, 0
  %92 = udiv i32 %89, 1
  %output_element_address71 = getelementptr inbounds [819200 x float], ptr %arg6, i32 0, i32 %92
  %output72 = load float, ptr %current_output62, align 4
  store float %output72, ptr %output_element_address71, align 4
  br label %reduction_write_output-after70

reduction_write_output-true80:                    ; preds = %reduction_write_output-after70
  %93 = mul i32 %thread_id.x, 1
  %94 = add i32 %tile_origin.1, %thread_id.y
  %95 = add i32 %tile_origin.2, %93
  %96 = add i32 %95, 0
  %97 = udiv i32 %94, 1
  %output_element_address82 = getelementptr inbounds [819200 x float], ptr %arg7, i32 0, i32 %97
  %output83 = load float, ptr %current_output73, align 4
  store float %output83, ptr %output_element_address82, align 4
  br label %reduction_write_output-after81

reduction_write_output-true91:                    ; preds = %reduction_write_output-after81
  %98 = mul i32 %thread_id.x, 1
  %99 = add i32 %tile_origin.1, %thread_id.y
  %100 = add i32 %tile_origin.2, %98
  %101 = add i32 %100, 0
  %102 = udiv i32 %99, 1
  %output_element_address93 = getelementptr inbounds [819200 x float], ptr %arg8, i32 0, i32 %102
  %output94 = load float, ptr %current_output84, align 4
  store float %output94, ptr %output_element_address93, align 4
  br label %reduction_write_output-after92
}

define internal void @region_1_10(ptr dereferenceable(4) %Arg_0.11.typed, ptr dereferenceable(4) %Arg_1.12.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.13.typed = alloca float, align 4
  %Arg_0.11 = load float, ptr %Arg_0.11.typed, align 4
  %Arg_1.12 = load float, ptr %Arg_1.12.typed, align 4
  %add.13 = fadd float %Arg_0.11, %Arg_1.12
  store float %add.13, ptr %add.13.typed, align 4
  %load_ret_value = load float, ptr %add.13.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_18(ptr dereferenceable(4) %Arg_0.19.typed, ptr dereferenceable(4) %Arg_1.20.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.21.typed = alloca float, align 4
  %Arg_0.19 = load float, ptr %Arg_0.19.typed, align 4
  %Arg_1.20 = load float, ptr %Arg_1.20.typed, align 4
  %add.21 = fadd float %Arg_0.19, %Arg_1.20
  store float %add.21, ptr %add.21.typed, align 4
  %load_ret_value = load float, ptr %add.21.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_3_26(ptr dereferenceable(4) %Arg_0.27.typed, ptr dereferenceable(4) %Arg_1.28.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.29.typed = alloca float, align 4
  %Arg_0.27 = load float, ptr %Arg_0.27.typed, align 4
  %Arg_1.28 = load float, ptr %Arg_1.28.typed, align 4
  %add.29 = fadd float %Arg_0.27, %Arg_1.28
  store float %add.29, ptr %add.29.typed, align 4
  %load_ret_value = load float, ptr %add.29.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_4_34(ptr dereferenceable(4) %Arg_0.35.typed, ptr dereferenceable(4) %Arg_1.36.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.37.typed = alloca float, align 4
  %Arg_0.35 = load float, ptr %Arg_0.35.typed, align 4
  %Arg_1.36 = load float, ptr %Arg_1.36.typed, align 4
  %add.37 = fadd float %Arg_0.35, %Arg_1.36
  store float %add.37, ptr %add.37.typed, align 4
  %load_ret_value = load float, ptr %add.37.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_18(ptr noalias align 16 dereferenceable(3276800) %arg0, ptr noalias align 128 dereferenceable(3276800) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(3276800) %arg3, ptr noalias align 128 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(3276800) %arg5, ptr noalias align 128 dereferenceable(3276800) %arg6, ptr noalias align 16 dereferenceable(3276800) %arg7, ptr noalias align 128 dereferenceable(3276800) %arg8, ptr noalias align 128 dereferenceable(3276800) %arg9, ptr noalias align 128 dereferenceable(3276800) %arg10, ptr noalias align 128 dereferenceable(3276800) %arg11, ptr noalias align 128 dereferenceable(3276800) %arg12) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !83
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 204800
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index_base, 1
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 100
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 100
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 1
  %15 = udiv i32 %linear_index2, 1
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 100
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 1
  %20 = udiv i32 %linear_index3, 1
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 100
  %23 = icmp ult i32 %linear_index_base, 819200
  br i1 %23, label %fusion_18.in_bounds-true, label %fusion_18.in_bounds-after

fusion_18.in_bounds-after:                        ; preds = %fusion_18.in_bounds-true, %entry
  ret void

fusion_18.in_bounds-true:                         ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !46
  %26 = mul nuw nsw i32 %4, 1
  %27 = add nuw nsw i32 0, %26
  %28 = mul nuw nsw i32 %6, 1
  %29 = add nuw nsw i32 0, %28
  %30 = mul nuw nsw i32 %7, 100
  %31 = add nuw nsw i32 %29, %30
  %32 = udiv i32 %31, 819200
  %33 = load float, ptr %arg2, align 4, !invariant.load !46
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %35 = load float, ptr %34, align 4, !invariant.load !46
  %multiply.11 = fmul float %33, %35
  %subtract.13 = fsub float %25, %multiply.11
  %36 = insertvalue { float, float, float, float } undef, float %subtract.13, 0
  %37 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %38 = load float, ptr %37, align 4, !invariant.load !46
  %39 = mul nuw nsw i32 %4, 1
  %40 = add nuw nsw i32 0, %39
  %41 = mul nuw nsw i32 %6, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %7, 100
  %44 = add nuw nsw i32 %42, %43
  %45 = udiv i32 %44, 819200
  %46 = load float, ptr %arg2, align 4, !invariant.load !46
  %47 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %48 = load float, ptr %47, align 4, !invariant.load !46
  %multiply.14 = fmul float %46, %48
  %subtract.16 = fsub float %38, %multiply.14
  %49 = insertvalue { float, float, float, float } %36, float %subtract.16, 1
  %50 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %51 = load float, ptr %50, align 4, !invariant.load !46
  %52 = mul nuw nsw i32 %4, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %6, 1
  %55 = add nuw nsw i32 0, %54
  %56 = mul nuw nsw i32 %7, 100
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 819200
  %59 = load float, ptr %arg2, align 4, !invariant.load !46
  %60 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %61 = load float, ptr %60, align 4, !invariant.load !46
  %multiply.17 = fmul float %59, %61
  %subtract.19 = fsub float %51, %multiply.17
  %62 = insertvalue { float, float, float, float } %49, float %subtract.19, 2
  %63 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %64 = load float, ptr %63, align 4, !invariant.load !46
  %65 = mul nuw nsw i32 %4, 1
  %66 = add nuw nsw i32 0, %65
  %67 = mul nuw nsw i32 %6, 1
  %68 = add nuw nsw i32 0, %67
  %69 = mul nuw nsw i32 %7, 100
  %70 = add nuw nsw i32 %68, %69
  %71 = udiv i32 %70, 819200
  %72 = load float, ptr %arg2, align 4, !invariant.load !46
  %73 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  %74 = load float, ptr %73, align 4, !invariant.load !46
  %multiply.20 = fmul float %72, %74
  %subtract.22 = fsub float %64, %multiply.20
  %75 = insertvalue { float, float, float, float } %62, float %subtract.22, 3
  %76 = extractvalue { float, float, float, float } %75, 0
  %77 = getelementptr inbounds float, ptr %arg9, i32 %linear_index_base
  store float %76, ptr %77, align 4
  %78 = extractvalue { float, float, float, float } %75, 1
  %79 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  store float %78, ptr %79, align 4
  %80 = extractvalue { float, float, float, float } %75, 2
  %81 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  store float %80, ptr %81, align 4
  %82 = extractvalue { float, float, float, float } %75, 3
  %83 = getelementptr inbounds float, ptr %arg12, i32 %linear_index_base
  store float %82, ptr %83, align 4
  %84 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %85 = load float, ptr %84, align 4, !invariant.load !46
  %86 = mul nuw nsw i32 %9, 1
  %87 = add nuw nsw i32 0, %86
  %88 = mul nuw nsw i32 %11, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %12, 100
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 819200
  %93 = load float, ptr %arg2, align 4, !invariant.load !46
  %94 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %95 = load float, ptr %94, align 4, !invariant.load !46
  %multiply.111 = fmul float %93, %95
  %subtract.132 = fsub float %85, %multiply.111
  %96 = insertvalue { float, float, float, float } undef, float %subtract.132, 0
  %97 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %98 = load float, ptr %97, align 4, !invariant.load !46
  %99 = mul nuw nsw i32 %9, 1
  %100 = add nuw nsw i32 0, %99
  %101 = mul nuw nsw i32 %11, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %12, 100
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 819200
  %106 = load float, ptr %arg2, align 4, !invariant.load !46
  %107 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %108 = load float, ptr %107, align 4, !invariant.load !46
  %multiply.143 = fmul float %106, %108
  %subtract.164 = fsub float %98, %multiply.143
  %109 = insertvalue { float, float, float, float } %96, float %subtract.164, 1
  %110 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %111 = load float, ptr %110, align 4, !invariant.load !46
  %112 = mul nuw nsw i32 %9, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %11, 1
  %115 = add nuw nsw i32 0, %114
  %116 = mul nuw nsw i32 %12, 100
  %117 = add nuw nsw i32 %115, %116
  %118 = udiv i32 %117, 819200
  %119 = load float, ptr %arg2, align 4, !invariant.load !46
  %120 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %121 = load float, ptr %120, align 4, !invariant.load !46
  %multiply.175 = fmul float %119, %121
  %subtract.196 = fsub float %111, %multiply.175
  %122 = insertvalue { float, float, float, float } %109, float %subtract.196, 2
  %123 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %124 = load float, ptr %123, align 4, !invariant.load !46
  %125 = mul nuw nsw i32 %9, 1
  %126 = add nuw nsw i32 0, %125
  %127 = mul nuw nsw i32 %11, 1
  %128 = add nuw nsw i32 0, %127
  %129 = mul nuw nsw i32 %12, 100
  %130 = add nuw nsw i32 %128, %129
  %131 = udiv i32 %130, 819200
  %132 = load float, ptr %arg2, align 4, !invariant.load !46
  %133 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  %134 = load float, ptr %133, align 4, !invariant.load !46
  %multiply.207 = fmul float %132, %134
  %subtract.228 = fsub float %124, %multiply.207
  %135 = insertvalue { float, float, float, float } %122, float %subtract.228, 3
  %136 = extractvalue { float, float, float, float } %135, 0
  %137 = getelementptr inbounds float, ptr %arg9, i32 %linear_index1
  store float %136, ptr %137, align 4
  %138 = extractvalue { float, float, float, float } %135, 1
  %139 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  store float %138, ptr %139, align 4
  %140 = extractvalue { float, float, float, float } %135, 2
  %141 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  store float %140, ptr %141, align 4
  %142 = extractvalue { float, float, float, float } %135, 3
  %143 = getelementptr inbounds float, ptr %arg12, i32 %linear_index1
  store float %142, ptr %143, align 4
  %144 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %145 = load float, ptr %144, align 4, !invariant.load !46
  %146 = mul nuw nsw i32 %14, 1
  %147 = add nuw nsw i32 0, %146
  %148 = mul nuw nsw i32 %16, 1
  %149 = add nuw nsw i32 0, %148
  %150 = mul nuw nsw i32 %17, 100
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 819200
  %153 = load float, ptr %arg2, align 4, !invariant.load !46
  %154 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %155 = load float, ptr %154, align 4, !invariant.load !46
  %multiply.119 = fmul float %153, %155
  %subtract.1310 = fsub float %145, %multiply.119
  %156 = insertvalue { float, float, float, float } undef, float %subtract.1310, 0
  %157 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %158 = load float, ptr %157, align 4, !invariant.load !46
  %159 = mul nuw nsw i32 %14, 1
  %160 = add nuw nsw i32 0, %159
  %161 = mul nuw nsw i32 %16, 1
  %162 = add nuw nsw i32 0, %161
  %163 = mul nuw nsw i32 %17, 100
  %164 = add nuw nsw i32 %162, %163
  %165 = udiv i32 %164, 819200
  %166 = load float, ptr %arg2, align 4, !invariant.load !46
  %167 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %168 = load float, ptr %167, align 4, !invariant.load !46
  %multiply.1411 = fmul float %166, %168
  %subtract.1612 = fsub float %158, %multiply.1411
  %169 = insertvalue { float, float, float, float } %156, float %subtract.1612, 1
  %170 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %171 = load float, ptr %170, align 4, !invariant.load !46
  %172 = mul nuw nsw i32 %14, 1
  %173 = add nuw nsw i32 0, %172
  %174 = mul nuw nsw i32 %16, 1
  %175 = add nuw nsw i32 0, %174
  %176 = mul nuw nsw i32 %17, 100
  %177 = add nuw nsw i32 %175, %176
  %178 = udiv i32 %177, 819200
  %179 = load float, ptr %arg2, align 4, !invariant.load !46
  %180 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %181 = load float, ptr %180, align 4, !invariant.load !46
  %multiply.1713 = fmul float %179, %181
  %subtract.1914 = fsub float %171, %multiply.1713
  %182 = insertvalue { float, float, float, float } %169, float %subtract.1914, 2
  %183 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %184 = load float, ptr %183, align 4, !invariant.load !46
  %185 = mul nuw nsw i32 %14, 1
  %186 = add nuw nsw i32 0, %185
  %187 = mul nuw nsw i32 %16, 1
  %188 = add nuw nsw i32 0, %187
  %189 = mul nuw nsw i32 %17, 100
  %190 = add nuw nsw i32 %188, %189
  %191 = udiv i32 %190, 819200
  %192 = load float, ptr %arg2, align 4, !invariant.load !46
  %193 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  %194 = load float, ptr %193, align 4, !invariant.load !46
  %multiply.2015 = fmul float %192, %194
  %subtract.2216 = fsub float %184, %multiply.2015
  %195 = insertvalue { float, float, float, float } %182, float %subtract.2216, 3
  %196 = extractvalue { float, float, float, float } %195, 0
  %197 = getelementptr inbounds float, ptr %arg9, i32 %linear_index2
  store float %196, ptr %197, align 4
  %198 = extractvalue { float, float, float, float } %195, 1
  %199 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  store float %198, ptr %199, align 4
  %200 = extractvalue { float, float, float, float } %195, 2
  %201 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  store float %200, ptr %201, align 4
  %202 = extractvalue { float, float, float, float } %195, 3
  %203 = getelementptr inbounds float, ptr %arg12, i32 %linear_index2
  store float %202, ptr %203, align 4
  %204 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %205 = load float, ptr %204, align 4, !invariant.load !46
  %206 = mul nuw nsw i32 %19, 1
  %207 = add nuw nsw i32 0, %206
  %208 = mul nuw nsw i32 %21, 1
  %209 = add nuw nsw i32 0, %208
  %210 = mul nuw nsw i32 %22, 100
  %211 = add nuw nsw i32 %209, %210
  %212 = udiv i32 %211, 819200
  %213 = load float, ptr %arg2, align 4, !invariant.load !46
  %214 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %215 = load float, ptr %214, align 4, !invariant.load !46
  %multiply.1117 = fmul float %213, %215
  %subtract.1318 = fsub float %205, %multiply.1117
  %216 = insertvalue { float, float, float, float } undef, float %subtract.1318, 0
  %217 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %218 = load float, ptr %217, align 4, !invariant.load !46
  %219 = mul nuw nsw i32 %19, 1
  %220 = add nuw nsw i32 0, %219
  %221 = mul nuw nsw i32 %21, 1
  %222 = add nuw nsw i32 0, %221
  %223 = mul nuw nsw i32 %22, 100
  %224 = add nuw nsw i32 %222, %223
  %225 = udiv i32 %224, 819200
  %226 = load float, ptr %arg2, align 4, !invariant.load !46
  %227 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %228 = load float, ptr %227, align 4, !invariant.load !46
  %multiply.1419 = fmul float %226, %228
  %subtract.1620 = fsub float %218, %multiply.1419
  %229 = insertvalue { float, float, float, float } %216, float %subtract.1620, 1
  %230 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %231 = load float, ptr %230, align 4, !invariant.load !46
  %232 = mul nuw nsw i32 %19, 1
  %233 = add nuw nsw i32 0, %232
  %234 = mul nuw nsw i32 %21, 1
  %235 = add nuw nsw i32 0, %234
  %236 = mul nuw nsw i32 %22, 100
  %237 = add nuw nsw i32 %235, %236
  %238 = udiv i32 %237, 819200
  %239 = load float, ptr %arg2, align 4, !invariant.load !46
  %240 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %241 = load float, ptr %240, align 4, !invariant.load !46
  %multiply.1721 = fmul float %239, %241
  %subtract.1922 = fsub float %231, %multiply.1721
  %242 = insertvalue { float, float, float, float } %229, float %subtract.1922, 2
  %243 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %244 = load float, ptr %243, align 4, !invariant.load !46
  %245 = mul nuw nsw i32 %19, 1
  %246 = add nuw nsw i32 0, %245
  %247 = mul nuw nsw i32 %21, 1
  %248 = add nuw nsw i32 0, %247
  %249 = mul nuw nsw i32 %22, 100
  %250 = add nuw nsw i32 %248, %249
  %251 = udiv i32 %250, 819200
  %252 = load float, ptr %arg2, align 4, !invariant.load !46
  %253 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  %254 = load float, ptr %253, align 4, !invariant.load !46
  %multiply.2023 = fmul float %252, %254
  %subtract.2224 = fsub float %244, %multiply.2023
  %255 = insertvalue { float, float, float, float } %242, float %subtract.2224, 3
  %256 = extractvalue { float, float, float, float } %255, 0
  %257 = getelementptr inbounds float, ptr %arg9, i32 %linear_index3
  store float %256, ptr %257, align 4
  %258 = extractvalue { float, float, float, float } %255, 1
  %259 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  store float %258, ptr %259, align 4
  %260 = extractvalue { float, float, float, float } %255, 2
  %261 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  store float %260, ptr %261, align 4
  %262 = extractvalue { float, float, float, float } %255, 3
  %263 = getelementptr inbounds float, ptr %arg12, i32 %linear_index3
  store float %262, ptr %263, align 4
  br label %fusion_18.in_bounds-after
}

define void @fusion_27(ptr noalias align 16 dereferenceable(26214400) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(760217600) %arg2, ptr noalias align 16 dereferenceable(26214400) %arg3, ptr noalias align 128 dereferenceable(26214400) %arg4, ptr noalias align 128 dereferenceable(26214400) %arg5, ptr noalias align 128 dereferenceable(26214400) %arg6, ptr noalias align 128 dereferenceable(26214400) %arg7, ptr noalias align 128 dereferenceable(26214400) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1638400
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 8
  %5 = udiv i32 %linear_index_base, 8
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 800
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 8
  %10 = udiv i32 %linear_index1, 8
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 800
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 8
  %15 = udiv i32 %linear_index2, 8
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 800
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 8
  %20 = udiv i32 %linear_index3, 8
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 800
  %23 = icmp ult i32 %linear_index_base, 6553600
  br i1 %23, label %fusion_27.in_bounds-true, label %fusion_27.in_bounds-after

fusion_27.in_bounds-after:                        ; preds = %fusion_27.in_bounds-true, %entry
  ret void

fusion_27.in_bounds-true:                         ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !46
  %26 = load float, ptr %arg1, align 4, !invariant.load !46
  %27 = add i32 %7, 0
  %28 = add i32 %6, 0
  %29 = add i32 %4, 152
  %30 = mul nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 232
  %33 = mul nuw nsw i32 %28, 1
  %34 = add nuw nsw i32 0, %33
  %35 = mul nuw nsw i32 %27, 100
  %36 = add nuw nsw i32 %34, %35
  %37 = udiv i32 %36, 819200
  %38 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %36, i32 %31
  %39 = load float, ptr %38, align 4, !invariant.load !46
  %multiply.8 = fmul float %26, %39
  %subtract.9 = fsub float %25, %multiply.8
  %40 = insertvalue { float, float, float, float, float } undef, float %subtract.9, 0
  %41 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %42 = load float, ptr %41, align 4, !invariant.load !46
  %43 = add i32 %7, 0
  %44 = add i32 %6, 0
  %45 = add i32 %4, 160
  %46 = mul nuw nsw i32 %45, 1
  %47 = add nuw nsw i32 0, %46
  %48 = udiv i32 %47, 232
  %49 = mul nuw nsw i32 %44, 1
  %50 = add nuw nsw i32 0, %49
  %51 = mul nuw nsw i32 %43, 100
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 819200
  %54 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %52, i32 %47
  %55 = load float, ptr %54, align 4, !invariant.load !46
  %multiply.11 = fmul float %26, %55
  %subtract.12 = fsub float %42, %multiply.11
  %56 = insertvalue { float, float, float, float, float } %40, float %subtract.12, 1
  %57 = add i32 %7, 0
  %58 = add i32 %6, 0
  %59 = add i32 %4, 144
  %60 = mul nuw nsw i32 %59, 1
  %61 = add nuw nsw i32 0, %60
  %62 = udiv i32 %61, 232
  %63 = mul nuw nsw i32 %58, 1
  %64 = add nuw nsw i32 0, %63
  %65 = mul nuw nsw i32 %57, 100
  %66 = add nuw nsw i32 %64, %65
  %67 = udiv i32 %66, 819200
  %68 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %66, i32 %61
  %69 = load float, ptr %68, align 4, !invariant.load !46
  %70 = insertvalue { float, float, float, float, float } %56, float %69, 2
  %71 = add i32 %7, 0
  %72 = add i32 %6, 0
  %73 = add i32 %4, 136
  %74 = mul nuw nsw i32 %73, 1
  %75 = add nuw nsw i32 0, %74
  %76 = udiv i32 %75, 232
  %77 = mul nuw nsw i32 %72, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %71, 100
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 819200
  %82 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %80, i32 %75
  %83 = load float, ptr %82, align 4, !invariant.load !46
  %84 = insertvalue { float, float, float, float, float } %70, float %83, 3
  %85 = add i32 %7, 0
  %86 = add i32 %6, 0
  %87 = add i32 %4, 128
  %88 = mul nuw nsw i32 %87, 1
  %89 = add nuw nsw i32 0, %88
  %90 = udiv i32 %89, 232
  %91 = mul nuw nsw i32 %86, 1
  %92 = add nuw nsw i32 0, %91
  %93 = mul nuw nsw i32 %85, 100
  %94 = add nuw nsw i32 %92, %93
  %95 = udiv i32 %94, 819200
  %96 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %94, i32 %89
  %97 = load float, ptr %96, align 4, !invariant.load !46
  %98 = insertvalue { float, float, float, float, float } %84, float %97, 4
  %99 = extractvalue { float, float, float, float, float } %98, 0
  %100 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %99, ptr %100, align 4
  %101 = extractvalue { float, float, float, float, float } %98, 1
  %102 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %101, ptr %102, align 4
  %103 = extractvalue { float, float, float, float, float } %98, 2
  %104 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %103, ptr %104, align 4
  %105 = extractvalue { float, float, float, float, float } %98, 3
  %106 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %105, ptr %106, align 4
  %107 = extractvalue { float, float, float, float, float } %98, 4
  %108 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  store float %107, ptr %108, align 4
  %109 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %110 = load float, ptr %109, align 4, !invariant.load !46
  %111 = load float, ptr %arg1, align 4, !invariant.load !46
  %112 = add i32 %12, 0
  %113 = add i32 %11, 0
  %114 = add i32 %9, 152
  %115 = mul nuw nsw i32 %114, 1
  %116 = add nuw nsw i32 0, %115
  %117 = udiv i32 %116, 232
  %118 = mul nuw nsw i32 %113, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %112, 100
  %121 = add nuw nsw i32 %119, %120
  %122 = udiv i32 %121, 819200
  %123 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %121, i32 %116
  %124 = load float, ptr %123, align 4, !invariant.load !46
  %multiply.81 = fmul float %111, %124
  %subtract.92 = fsub float %110, %multiply.81
  %125 = insertvalue { float, float, float, float, float } undef, float %subtract.92, 0
  %126 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %127 = load float, ptr %126, align 4, !invariant.load !46
  %128 = add i32 %12, 0
  %129 = add i32 %11, 0
  %130 = add i32 %9, 160
  %131 = mul nuw nsw i32 %130, 1
  %132 = add nuw nsw i32 0, %131
  %133 = udiv i32 %132, 232
  %134 = mul nuw nsw i32 %129, 1
  %135 = add nuw nsw i32 0, %134
  %136 = mul nuw nsw i32 %128, 100
  %137 = add nuw nsw i32 %135, %136
  %138 = udiv i32 %137, 819200
  %139 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %137, i32 %132
  %140 = load float, ptr %139, align 4, !invariant.load !46
  %multiply.113 = fmul float %111, %140
  %subtract.124 = fsub float %127, %multiply.113
  %141 = insertvalue { float, float, float, float, float } %125, float %subtract.124, 1
  %142 = add i32 %12, 0
  %143 = add i32 %11, 0
  %144 = add i32 %9, 144
  %145 = mul nuw nsw i32 %144, 1
  %146 = add nuw nsw i32 0, %145
  %147 = udiv i32 %146, 232
  %148 = mul nuw nsw i32 %143, 1
  %149 = add nuw nsw i32 0, %148
  %150 = mul nuw nsw i32 %142, 100
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 819200
  %153 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %151, i32 %146
  %154 = load float, ptr %153, align 4, !invariant.load !46
  %155 = insertvalue { float, float, float, float, float } %141, float %154, 2
  %156 = add i32 %12, 0
  %157 = add i32 %11, 0
  %158 = add i32 %9, 136
  %159 = mul nuw nsw i32 %158, 1
  %160 = add nuw nsw i32 0, %159
  %161 = udiv i32 %160, 232
  %162 = mul nuw nsw i32 %157, 1
  %163 = add nuw nsw i32 0, %162
  %164 = mul nuw nsw i32 %156, 100
  %165 = add nuw nsw i32 %163, %164
  %166 = udiv i32 %165, 819200
  %167 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %165, i32 %160
  %168 = load float, ptr %167, align 4, !invariant.load !46
  %169 = insertvalue { float, float, float, float, float } %155, float %168, 3
  %170 = add i32 %12, 0
  %171 = add i32 %11, 0
  %172 = add i32 %9, 128
  %173 = mul nuw nsw i32 %172, 1
  %174 = add nuw nsw i32 0, %173
  %175 = udiv i32 %174, 232
  %176 = mul nuw nsw i32 %171, 1
  %177 = add nuw nsw i32 0, %176
  %178 = mul nuw nsw i32 %170, 100
  %179 = add nuw nsw i32 %177, %178
  %180 = udiv i32 %179, 819200
  %181 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %179, i32 %174
  %182 = load float, ptr %181, align 4, !invariant.load !46
  %183 = insertvalue { float, float, float, float, float } %169, float %182, 4
  %184 = extractvalue { float, float, float, float, float } %183, 0
  %185 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %184, ptr %185, align 4
  %186 = extractvalue { float, float, float, float, float } %183, 1
  %187 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %186, ptr %187, align 4
  %188 = extractvalue { float, float, float, float, float } %183, 2
  %189 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %188, ptr %189, align 4
  %190 = extractvalue { float, float, float, float, float } %183, 3
  %191 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %190, ptr %191, align 4
  %192 = extractvalue { float, float, float, float, float } %183, 4
  %193 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  store float %192, ptr %193, align 4
  %194 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %195 = load float, ptr %194, align 4, !invariant.load !46
  %196 = load float, ptr %arg1, align 4, !invariant.load !46
  %197 = add i32 %17, 0
  %198 = add i32 %16, 0
  %199 = add i32 %14, 152
  %200 = mul nuw nsw i32 %199, 1
  %201 = add nuw nsw i32 0, %200
  %202 = udiv i32 %201, 232
  %203 = mul nuw nsw i32 %198, 1
  %204 = add nuw nsw i32 0, %203
  %205 = mul nuw nsw i32 %197, 100
  %206 = add nuw nsw i32 %204, %205
  %207 = udiv i32 %206, 819200
  %208 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %206, i32 %201
  %209 = load float, ptr %208, align 4, !invariant.load !46
  %multiply.85 = fmul float %196, %209
  %subtract.96 = fsub float %195, %multiply.85
  %210 = insertvalue { float, float, float, float, float } undef, float %subtract.96, 0
  %211 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %212 = load float, ptr %211, align 4, !invariant.load !46
  %213 = add i32 %17, 0
  %214 = add i32 %16, 0
  %215 = add i32 %14, 160
  %216 = mul nuw nsw i32 %215, 1
  %217 = add nuw nsw i32 0, %216
  %218 = udiv i32 %217, 232
  %219 = mul nuw nsw i32 %214, 1
  %220 = add nuw nsw i32 0, %219
  %221 = mul nuw nsw i32 %213, 100
  %222 = add nuw nsw i32 %220, %221
  %223 = udiv i32 %222, 819200
  %224 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %222, i32 %217
  %225 = load float, ptr %224, align 4, !invariant.load !46
  %multiply.117 = fmul float %196, %225
  %subtract.128 = fsub float %212, %multiply.117
  %226 = insertvalue { float, float, float, float, float } %210, float %subtract.128, 1
  %227 = add i32 %17, 0
  %228 = add i32 %16, 0
  %229 = add i32 %14, 144
  %230 = mul nuw nsw i32 %229, 1
  %231 = add nuw nsw i32 0, %230
  %232 = udiv i32 %231, 232
  %233 = mul nuw nsw i32 %228, 1
  %234 = add nuw nsw i32 0, %233
  %235 = mul nuw nsw i32 %227, 100
  %236 = add nuw nsw i32 %234, %235
  %237 = udiv i32 %236, 819200
  %238 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %236, i32 %231
  %239 = load float, ptr %238, align 4, !invariant.load !46
  %240 = insertvalue { float, float, float, float, float } %226, float %239, 2
  %241 = add i32 %17, 0
  %242 = add i32 %16, 0
  %243 = add i32 %14, 136
  %244 = mul nuw nsw i32 %243, 1
  %245 = add nuw nsw i32 0, %244
  %246 = udiv i32 %245, 232
  %247 = mul nuw nsw i32 %242, 1
  %248 = add nuw nsw i32 0, %247
  %249 = mul nuw nsw i32 %241, 100
  %250 = add nuw nsw i32 %248, %249
  %251 = udiv i32 %250, 819200
  %252 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %250, i32 %245
  %253 = load float, ptr %252, align 4, !invariant.load !46
  %254 = insertvalue { float, float, float, float, float } %240, float %253, 3
  %255 = add i32 %17, 0
  %256 = add i32 %16, 0
  %257 = add i32 %14, 128
  %258 = mul nuw nsw i32 %257, 1
  %259 = add nuw nsw i32 0, %258
  %260 = udiv i32 %259, 232
  %261 = mul nuw nsw i32 %256, 1
  %262 = add nuw nsw i32 0, %261
  %263 = mul nuw nsw i32 %255, 100
  %264 = add nuw nsw i32 %262, %263
  %265 = udiv i32 %264, 819200
  %266 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %264, i32 %259
  %267 = load float, ptr %266, align 4, !invariant.load !46
  %268 = insertvalue { float, float, float, float, float } %254, float %267, 4
  %269 = extractvalue { float, float, float, float, float } %268, 0
  %270 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %269, ptr %270, align 4
  %271 = extractvalue { float, float, float, float, float } %268, 1
  %272 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %271, ptr %272, align 4
  %273 = extractvalue { float, float, float, float, float } %268, 2
  %274 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %273, ptr %274, align 4
  %275 = extractvalue { float, float, float, float, float } %268, 3
  %276 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %275, ptr %276, align 4
  %277 = extractvalue { float, float, float, float, float } %268, 4
  %278 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  store float %277, ptr %278, align 4
  %279 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %280 = load float, ptr %279, align 4, !invariant.load !46
  %281 = load float, ptr %arg1, align 4, !invariant.load !46
  %282 = add i32 %22, 0
  %283 = add i32 %21, 0
  %284 = add i32 %19, 152
  %285 = mul nuw nsw i32 %284, 1
  %286 = add nuw nsw i32 0, %285
  %287 = udiv i32 %286, 232
  %288 = mul nuw nsw i32 %283, 1
  %289 = add nuw nsw i32 0, %288
  %290 = mul nuw nsw i32 %282, 100
  %291 = add nuw nsw i32 %289, %290
  %292 = udiv i32 %291, 819200
  %293 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %291, i32 %286
  %294 = load float, ptr %293, align 4, !invariant.load !46
  %multiply.89 = fmul float %281, %294
  %subtract.910 = fsub float %280, %multiply.89
  %295 = insertvalue { float, float, float, float, float } undef, float %subtract.910, 0
  %296 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %297 = load float, ptr %296, align 4, !invariant.load !46
  %298 = add i32 %22, 0
  %299 = add i32 %21, 0
  %300 = add i32 %19, 160
  %301 = mul nuw nsw i32 %300, 1
  %302 = add nuw nsw i32 0, %301
  %303 = udiv i32 %302, 232
  %304 = mul nuw nsw i32 %299, 1
  %305 = add nuw nsw i32 0, %304
  %306 = mul nuw nsw i32 %298, 100
  %307 = add nuw nsw i32 %305, %306
  %308 = udiv i32 %307, 819200
  %309 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %307, i32 %302
  %310 = load float, ptr %309, align 4, !invariant.load !46
  %multiply.1111 = fmul float %281, %310
  %subtract.1212 = fsub float %297, %multiply.1111
  %311 = insertvalue { float, float, float, float, float } %295, float %subtract.1212, 1
  %312 = add i32 %22, 0
  %313 = add i32 %21, 0
  %314 = add i32 %19, 144
  %315 = mul nuw nsw i32 %314, 1
  %316 = add nuw nsw i32 0, %315
  %317 = udiv i32 %316, 232
  %318 = mul nuw nsw i32 %313, 1
  %319 = add nuw nsw i32 0, %318
  %320 = mul nuw nsw i32 %312, 100
  %321 = add nuw nsw i32 %319, %320
  %322 = udiv i32 %321, 819200
  %323 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %321, i32 %316
  %324 = load float, ptr %323, align 4, !invariant.load !46
  %325 = insertvalue { float, float, float, float, float } %311, float %324, 2
  %326 = add i32 %22, 0
  %327 = add i32 %21, 0
  %328 = add i32 %19, 136
  %329 = mul nuw nsw i32 %328, 1
  %330 = add nuw nsw i32 0, %329
  %331 = udiv i32 %330, 232
  %332 = mul nuw nsw i32 %327, 1
  %333 = add nuw nsw i32 0, %332
  %334 = mul nuw nsw i32 %326, 100
  %335 = add nuw nsw i32 %333, %334
  %336 = udiv i32 %335, 819200
  %337 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %335, i32 %330
  %338 = load float, ptr %337, align 4, !invariant.load !46
  %339 = insertvalue { float, float, float, float, float } %325, float %338, 3
  %340 = add i32 %22, 0
  %341 = add i32 %21, 0
  %342 = add i32 %19, 128
  %343 = mul nuw nsw i32 %342, 1
  %344 = add nuw nsw i32 0, %343
  %345 = udiv i32 %344, 232
  %346 = mul nuw nsw i32 %341, 1
  %347 = add nuw nsw i32 0, %346
  %348 = mul nuw nsw i32 %340, 100
  %349 = add nuw nsw i32 %347, %348
  %350 = udiv i32 %349, 819200
  %351 = getelementptr inbounds [819200 x [232 x float]], ptr %arg2, i32 0, i32 %349, i32 %344
  %352 = load float, ptr %351, align 4, !invariant.load !46
  %353 = insertvalue { float, float, float, float, float } %339, float %352, 4
  %354 = extractvalue { float, float, float, float, float } %353, 0
  %355 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %354, ptr %355, align 4
  %356 = extractvalue { float, float, float, float, float } %353, 1
  %357 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %356, ptr %357, align 4
  %358 = extractvalue { float, float, float, float, float } %353, 2
  %359 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %358, ptr %359, align 4
  %360 = extractvalue { float, float, float, float, float } %353, 3
  %361 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %360, ptr %361, align 4
  %362 = extractvalue { float, float, float, float, float } %353, 4
  %363 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  store float %362, ptr %363, align 4
  br label %fusion_27.in_bounds-after
}

define void @fusion_35(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 16 dereferenceable(838860800) %arg2, ptr noalias align 128 dereferenceable(838860800) %arg3, ptr noalias align 128 dereferenceable(8388608) %arg4) {
entry:
  %return_buffer53 = alloca float, align 4
  %result_from_other_lane51 = alloca float, align 4
  %return_buffer50 = alloca float, align 4
  %result_from_other_lane48 = alloca float, align 4
  %return_buffer47 = alloca float, align 4
  %result_from_other_lane45 = alloca float, align 4
  %return_buffer44 = alloca float, align 4
  %result_from_other_lane42 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer26 = alloca float, align 4
  %result_from_other_lane24 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer16 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !48
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after55, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_17_constant_10 = load float, ptr @8, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_17_constant_10, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_17_constant_10, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 32768
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 4
  %14 = udiv i32 %9, 4
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 4
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 100, i32 4096
  %18 = icmp eq i32 %13, 3
  %tile_bound1 = select i1 %18, i32 64, i32 64
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 4096
  %tile_origin.2 = mul i32 %13, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after10, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %22 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %22, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %23 = icmp eq i32 %tile_loop.indvar, 0
  %24 = mul i32 %tile_loop.indvar, 2
  %25 = add i32 %24, 0
  %x_loc = add i32 %25, %21
  %26 = add i32 %tile_origin.1, %y_in_tile.indvar
  %27 = add i32 %tile_origin.2, %x_loc
  %28 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %28, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %29 = mul i32 %tile_loop.indvar, 2
  %30 = add i32 %29, 1
  %x_loc8 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc8
  %33 = icmp ult i32 %x_loc8, %tile_bound1
  br i1 %33, label %x_in_tile-true9, label %x_in_tile-after10

x_in_tile-after10:                                ; preds = %x_in_tile-true9, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !86

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !87

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result22 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_11__2(ptr %36, ptr %result_from_other_lane, ptr %return_buffer23)
  %38 = load float, ptr %return_buffer23, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result25 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result25, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane24, align 4
  call void @region_1_11__2(ptr %36, ptr %result_from_other_lane24, ptr %return_buffer26)
  %40 = load float, ptr %return_buffer26, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result28 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane27, align 4
  call void @region_1_11__2(ptr %36, ptr %result_from_other_lane27, ptr %return_buffer29)
  %42 = load float, ptr %return_buffer29, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result31 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane30, align 4
  call void @region_1_11__2(ptr %36, ptr %result_from_other_lane30, ptr %return_buffer32)
  %44 = load float, ptr %return_buffer32, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result34 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane33, align 4
  call void @region_1_11__2(ptr %36, ptr %result_from_other_lane33, ptr %return_buffer35)
  %46 = load float, ptr %return_buffer35, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address36 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address36 to ptr
  %current_output37 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output37, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr38 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr38 to ptr
  %partial_reduction_result40 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane39, align 4
  call void @region_1_11__2(ptr %55, ptr %result_from_other_lane39, ptr %return_buffer41)
  %57 = load float, ptr %return_buffer41, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result43 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result43, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane42, align 4
  call void @region_1_11__2(ptr %55, ptr %result_from_other_lane42, ptr %return_buffer44)
  %59 = load float, ptr %return_buffer44, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result46 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result46, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane45, align 4
  call void @region_1_11__2(ptr %55, ptr %result_from_other_lane45, ptr %return_buffer47)
  %61 = load float, ptr %return_buffer47, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result49 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result49, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane48, align 4
  call void @region_1_11__2(ptr %55, ptr %result_from_other_lane48, ptr %return_buffer50)
  %63 = load float, ptr %return_buffer50, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result52 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result52, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane51, align 4
  call void @region_1_11__2(ptr %55, ptr %result_from_other_lane51, ptr %return_buffer53)
  %65 = load float, ptr %return_buffer53, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true54, label %reduction_write_output-after55

reduction_write_output-after55:                   ; preds = %reduction_write_output-true54, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 256
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 25600
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 4
  %82 = udiv i32 %77, 256
  %83 = urem i32 %82, 100
  %84 = udiv i32 %77, 25600
  %85 = mul i32 %thread_id.x, 2
  %86 = sub i32 %x_loc, %85
  %Arg_1.2 = getelementptr inbounds [8192 x [100 x [4 x float]]], ptr %arg1, i32 0, i32 %84, i32 %83, i32 %81
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !46
  %Arg_2.3 = getelementptr inbounds [8192 x [100 x [4 x [64 x float]]]], ptr %arg2, i32 0, i32 %84, i32 %83, i32 %81, i32 %79
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !46
  %multiply.9 = fmul float %Arg_1.23, %Arg_2.34
  store float %multiply.9, ptr %reduction_input_address, align 4
  %87 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %86
  call void @region_1_11__2(ptr %87, ptr %reduction_input_address, ptr %return_buffer)
  %88 = load float, ptr %return_buffer, align 4
  store float %88, ptr %87, align 4
  %89 = mul nuw nsw i32 %79, 1
  %90 = add nuw nsw i32 0, %89
  %91 = mul nuw nsw i32 %81, 64
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 256
  %94 = mul nuw nsw i32 %83, 1
  %95 = add nuw nsw i32 0, %94
  %96 = mul nuw nsw i32 %84, 100
  %97 = add nuw nsw i32 %95, %96
  %98 = udiv i32 %97, 819200
  %99 = mul nuw nsw i32 %92, 1
  %100 = add nuw nsw i32 0, %99
  %101 = urem i32 %100, 64
  %102 = udiv i32 %100, 64
  %103 = udiv i32 %102, 4
  %104 = mul nuw nsw i32 %97, 1
  %105 = add nuw nsw i32 0, %104
  %106 = urem i32 %105, 100
  %107 = udiv i32 %105, 100
  %108 = udiv i32 %107, 8192
  %109 = udiv i32 %77, 64
  %Arg_1.25 = getelementptr inbounds float, ptr %arg1, i32 %109
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !46
  %Arg_0.1 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr %arg0, i32 0, i32 %107, i32 0, i32 %102, i32 %101
  %Arg_0.17 = load float, ptr %Arg_0.1, align 4, !invariant.load !46
  %multiply.7 = fmul float %Arg_1.26, %Arg_0.17
  %110 = mul nuw nsw i32 %79, 1
  %111 = add nuw nsw i32 0, %110
  %112 = mul nuw nsw i32 %81, 64
  %113 = add nuw nsw i32 %111, %112
  %114 = udiv i32 %113, 256
  %115 = mul nuw nsw i32 %83, 1
  %116 = add nuw nsw i32 0, %115
  %117 = mul nuw nsw i32 %84, 100
  %118 = add nuw nsw i32 %116, %117
  %119 = udiv i32 %118, 819200
  %120 = getelementptr inbounds [819200 x [256 x float]], ptr %arg3, i32 0, i32 %118, i32 %113
  store float %multiply.7, ptr %120, align 4
  br label %x_in_tile-after

x_in_tile-true9:                                  ; preds = %x_in_tile-after
  %121 = mul nuw nsw i32 %32, 1
  %122 = add nuw nsw i32 0, %121
  %123 = mul nuw nsw i32 %31, 256
  %124 = add nuw nsw i32 %122, %123
  %125 = mul nuw nsw i32 %tile_origin.0, 25600
  %126 = add nuw nsw i32 %124, %125
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 64
  %129 = udiv i32 %126, 64
  %130 = urem i32 %129, 4
  %131 = udiv i32 %126, 256
  %132 = urem i32 %131, 100
  %133 = udiv i32 %126, 25600
  %134 = mul i32 %thread_id.x, 2
  %135 = sub i32 %x_loc8, %134
  %Arg_1.211 = getelementptr inbounds [8192 x [100 x [4 x float]]], ptr %arg1, i32 0, i32 %133, i32 %132, i32 %130
  %Arg_1.212 = load float, ptr %Arg_1.211, align 4, !invariant.load !46
  %Arg_2.313 = getelementptr inbounds [8192 x [100 x [4 x [64 x float]]]], ptr %arg2, i32 0, i32 %133, i32 %132, i32 %130, i32 %128
  %Arg_2.314 = load float, ptr %Arg_2.313, align 4, !invariant.load !46
  %multiply.915 = fmul float %Arg_1.212, %Arg_2.314
  store float %multiply.915, ptr %reduction_input_address, align 4
  %136 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %135
  call void @region_1_11__2(ptr %136, ptr %reduction_input_address, ptr %return_buffer16)
  %137 = load float, ptr %return_buffer16, align 4
  store float %137, ptr %136, align 4
  %138 = mul nuw nsw i32 %128, 1
  %139 = add nuw nsw i32 0, %138
  %140 = mul nuw nsw i32 %130, 64
  %141 = add nuw nsw i32 %139, %140
  %142 = udiv i32 %141, 256
  %143 = mul nuw nsw i32 %132, 1
  %144 = add nuw nsw i32 0, %143
  %145 = mul nuw nsw i32 %133, 100
  %146 = add nuw nsw i32 %144, %145
  %147 = udiv i32 %146, 819200
  %148 = mul nuw nsw i32 %141, 1
  %149 = add nuw nsw i32 0, %148
  %150 = urem i32 %149, 64
  %151 = udiv i32 %149, 64
  %152 = udiv i32 %151, 4
  %153 = mul nuw nsw i32 %146, 1
  %154 = add nuw nsw i32 0, %153
  %155 = urem i32 %154, 100
  %156 = udiv i32 %154, 100
  %157 = udiv i32 %156, 8192
  %158 = udiv i32 %126, 64
  %Arg_1.217 = getelementptr inbounds float, ptr %arg1, i32 %158
  %Arg_1.218 = load float, ptr %Arg_1.217, align 4, !invariant.load !46
  %Arg_0.119 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr %arg0, i32 0, i32 %156, i32 0, i32 %151, i32 %150
  %Arg_0.120 = load float, ptr %Arg_0.119, align 4, !invariant.load !46
  %multiply.721 = fmul float %Arg_1.218, %Arg_0.120
  %159 = mul nuw nsw i32 %128, 1
  %160 = add nuw nsw i32 0, %159
  %161 = mul nuw nsw i32 %130, 64
  %162 = add nuw nsw i32 %160, %161
  %163 = udiv i32 %162, 256
  %164 = mul nuw nsw i32 %132, 1
  %165 = add nuw nsw i32 0, %164
  %166 = mul nuw nsw i32 %133, 100
  %167 = add nuw nsw i32 %165, %166
  %168 = udiv i32 %167, 819200
  %169 = getelementptr inbounds [819200 x [256 x float]], ptr %arg3, i32 0, i32 %167, i32 %162
  store float %multiply.721, ptr %169, align 4
  br label %x_in_tile-after10

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %170 = mul i32 %thread_id.y, 2
  %171 = add i32 %tile_origin.1, %thread_id.x
  %172 = add i32 %tile_origin.2, %170
  %173 = add i32 %172, 0
  %174 = mul i32 %tile_origin.0, 256
  %175 = add i32 %174, %173
  %176 = udiv i32 %175, 1
  %177 = urem i32 %176, 64
  %178 = udiv i32 %175, 64
  %179 = urem i32 %178, 4
  %180 = udiv i32 %175, 256
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg4, i32 0, i32 %180, i32 %179, i32 %177
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true54:                    ; preds = %reduction_write_output-after
  %181 = mul i32 %thread_id.y, 2
  %182 = add i32 %tile_origin.1, %thread_id.x
  %183 = add i32 %tile_origin.2, %181
  %184 = add i32 %183, 1
  %185 = mul i32 %tile_origin.0, 256
  %186 = add i32 %185, %184
  %187 = udiv i32 %186, 1
  %188 = urem i32 %187, 64
  %189 = udiv i32 %186, 64
  %190 = urem i32 %189, 4
  %191 = udiv i32 %186, 256
  %output_element_address56 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg4, i32 0, i32 %191, i32 %190, i32 %188
  %output57 = load float, ptr %55, align 4
  store float %output57, ptr %output_element_address56, align 4
  br label %reduction_write_output-after55
}

define internal void @region_1_11__2(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.14.typed = alloca float, align 4
  %Arg_0.12 = load float, ptr %Arg_0.12.typed, align 4
  %Arg_1.13 = load float, ptr %Arg_1.13.typed, align 4
  %add.14 = fadd float %Arg_0.12, %Arg_1.13
  store float %add.14, ptr %add.14.typed, align 4
  %load_ret_value = load float, ptr %add.14.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_2(ptr noalias align 16 dereferenceable(204800) %arg0, ptr noalias align 128 dereferenceable(204800) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !88
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 51200
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 51200
  br i1 %6, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %fusion_2.in_bounds-true, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !46
  %9 = load float, ptr %arg2, align 4, !invariant.load !46
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_2.in_bounds-after
}

define void @fusion_28(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 128 dereferenceable(237568) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(1056768) %arg4, ptr noalias align 128 dereferenceable(65536) %arg5, ptr noalias align 128 dereferenceable(65536) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !89
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !62
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %fusion_28.in_bounds-true, label %fusion_28.in_bounds-after

fusion_28.in_bounds-after:                        ; preds = %fusion_28.in_bounds-true, %entry
  ret void

fusion_28.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !46
  %9 = load float, ptr %arg2, align 4, !invariant.load !46
  %10 = add i32 %5, 168
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [232 x [256 x float]], ptr %arg1, i32 0, i32 %10, i32 %11
  %13 = load float, ptr %12, align 4, !invariant.load !46
  %multiply.8 = fmul float %9, %13
  %subtract.9 = fsub float %8, %multiply.8
  %14 = insertvalue { float, float } undef, float %subtract.9, 0
  %15 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %16 = load float, ptr %15, align 4, !invariant.load !46
  %17 = add i32 %5, 968
  %18 = add i32 %4, 0
  %19 = getelementptr inbounds [1032 x [256 x float]], ptr %arg4, i32 0, i32 %17, i32 %18
  %20 = load float, ptr %19, align 4, !invariant.load !46
  %multiply.11 = fmul float %9, %20
  %subtract.12 = fsub float %16, %multiply.11
  %21 = insertvalue { float, float } %14, float %subtract.12, 1
  %22 = extractvalue { float, float } %21, 0
  %23 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  store float %22, ptr %23, align 4
  %24 = extractvalue { float, float } %21, 1
  %25 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %24, ptr %25, align 4
  br label %fusion_28.in_bounds-after
}

define void @fusion_1(ptr noalias align 16 dereferenceable(991232) %arg0, ptr noalias align 128 dereferenceable(1056768) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(991232) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !90
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 61952
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index_base, 256
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 256
  %8 = udiv i32 %linear_index1, 256
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 256
  %11 = udiv i32 %linear_index2, 256
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 256
  %14 = udiv i32 %linear_index3, 256
  %15 = icmp ult i32 %linear_index_base, 247808
  br i1 %15, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %fusion_1.in_bounds-true, %entry
  ret void

fusion_1.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !46
  %18 = load float, ptr %arg2, align 4, !invariant.load !46
  %19 = add i32 %5, 0
  %20 = add i32 %4, 0
  %21 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %19, i32 %20
  %22 = load float, ptr %21, align 4, !invariant.load !46
  %multiply.6 = fmul float %18, %22
  %subtract.7 = fsub float %17, %multiply.6
  %23 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %subtract.7, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4, !invariant.load !46
  %26 = load float, ptr %arg2, align 4, !invariant.load !46
  %27 = add i32 %8, 0
  %28 = add i32 %7, 0
  %29 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %27, i32 %28
  %30 = load float, ptr %29, align 4, !invariant.load !46
  %multiply.61 = fmul float %26, %30
  %subtract.72 = fsub float %25, %multiply.61
  %31 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %subtract.72, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4, !invariant.load !46
  %34 = load float, ptr %arg2, align 4, !invariant.load !46
  %35 = add i32 %11, 0
  %36 = add i32 %10, 0
  %37 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !46
  %multiply.63 = fmul float %34, %38
  %subtract.74 = fsub float %33, %multiply.63
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %subtract.74, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4, !invariant.load !46
  %42 = load float, ptr %arg2, align 4, !invariant.load !46
  %43 = add i32 %14, 0
  %44 = add i32 %13, 0
  %45 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %43, i32 %44
  %46 = load float, ptr %45, align 4, !invariant.load !46
  %multiply.65 = fmul float %42, %46
  %subtract.76 = fsub float %41, %multiply.65
  %47 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %subtract.76, ptr %47, align 4
  br label %fusion_1.in_bounds-after
}

define void @fusion_33(ptr noalias align 128 dereferenceable(33816576) %arg0, ptr noalias align 128 dereferenceable(2097152) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !91
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 131072
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 64
  %8 = udiv i32 %linear_index1, 64
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 64
  %11 = udiv i32 %linear_index2, 64
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 64
  %14 = udiv i32 %linear_index3, 64
  %15 = icmp ult i32 %linear_index_base, 524288
  br i1 %15, label %fusion_33.in_bounds-true, label %fusion_33.in_bounds-after

fusion_33.in_bounds-after:                        ; preds = %fusion_33.in_bounds-true, %entry
  ret void

fusion_33.in_bounds-true:                         ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 968
  %18 = getelementptr inbounds [8192 x [1032 x float]], ptr %arg0, i32 0, i32 %16, i32 %17
  %19 = load float, ptr %18, align 4, !invariant.load !46
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %19, ptr %20, align 4
  %21 = add i32 %8, 0
  %22 = add i32 %7, 968
  %23 = getelementptr inbounds [8192 x [1032 x float]], ptr %arg0, i32 0, i32 %21, i32 %22
  %24 = load float, ptr %23, align 4, !invariant.load !46
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %24, ptr %25, align 4
  %26 = add i32 %11, 0
  %27 = add i32 %10, 968
  %28 = getelementptr inbounds [8192 x [1032 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !46
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %29, ptr %30, align 4
  %31 = add i32 %14, 0
  %32 = add i32 %13, 968
  %33 = getelementptr inbounds [8192 x [1032 x float]], ptr %arg0, i32 0, i32 %31, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !46
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %34, ptr %35, align 4
  br label %fusion_33.in_bounds-after
}

define void @fusion_45(ptr noalias align 128 dereferenceable(655360000) %arg0, ptr noalias align 128 dereferenceable(26214400) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1638400
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 8
  %5 = udiv i32 %linear_index_base, 8
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 800
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 8
  %10 = udiv i32 %linear_index1, 8
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 800
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 8
  %15 = udiv i32 %linear_index2, 8
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 800
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 8
  %20 = udiv i32 %linear_index3, 8
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 800
  %23 = icmp ult i32 %linear_index_base, 6553600
  br i1 %23, label %fusion_45.in_bounds-true, label %fusion_45.in_bounds-after

fusion_45.in_bounds-after:                        ; preds = %fusion_45.in_bounds-true, %entry
  ret void

fusion_45.in_bounds-true:                         ; preds = %entry
  %24 = add i32 %7, 0
  %25 = add i32 %6, 0
  %26 = add i32 %4, 128
  %27 = mul nuw nsw i32 %26, 1
  %28 = add nuw nsw i32 0, %27
  %29 = udiv i32 %28, 200
  %30 = mul nuw nsw i32 %25, 1
  %31 = add nuw nsw i32 0, %30
  %32 = mul nuw nsw i32 %24, 100
  %33 = add nuw nsw i32 %31, %32
  %34 = udiv i32 %33, 819200
  %35 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %33, i32 %28
  %36 = load float, ptr %35, align 4, !invariant.load !46
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %36, ptr %37, align 4
  %38 = add i32 %12, 0
  %39 = add i32 %11, 0
  %40 = add i32 %9, 128
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = udiv i32 %42, 200
  %44 = mul nuw nsw i32 %39, 1
  %45 = add nuw nsw i32 0, %44
  %46 = mul nuw nsw i32 %38, 100
  %47 = add nuw nsw i32 %45, %46
  %48 = udiv i32 %47, 819200
  %49 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %47, i32 %42
  %50 = load float, ptr %49, align 4, !invariant.load !46
  %51 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %50, ptr %51, align 4
  %52 = add i32 %17, 0
  %53 = add i32 %16, 0
  %54 = add i32 %14, 128
  %55 = mul nuw nsw i32 %54, 1
  %56 = add nuw nsw i32 0, %55
  %57 = udiv i32 %56, 200
  %58 = mul nuw nsw i32 %53, 1
  %59 = add nuw nsw i32 0, %58
  %60 = mul nuw nsw i32 %52, 100
  %61 = add nuw nsw i32 %59, %60
  %62 = udiv i32 %61, 819200
  %63 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %61, i32 %56
  %64 = load float, ptr %63, align 4, !invariant.load !46
  %65 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %64, ptr %65, align 4
  %66 = add i32 %22, 0
  %67 = add i32 %21, 0
  %68 = add i32 %19, 128
  %69 = mul nuw nsw i32 %68, 1
  %70 = add nuw nsw i32 0, %69
  %71 = udiv i32 %70, 200
  %72 = mul nuw nsw i32 %67, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %66, 100
  %75 = add nuw nsw i32 %73, %74
  %76 = udiv i32 %75, 819200
  %77 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %75, i32 %70
  %78 = load float, ptr %77, align 4, !invariant.load !46
  %79 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %78, ptr %79, align 4
  br label %fusion_45.in_bounds-after
}

define void @fusion_52(ptr noalias align 128 dereferenceable(655360000) %arg0, ptr noalias align 128 dereferenceable(760217600) %arg1, ptr noalias align 128 dereferenceable(209715200) %arg2, ptr noalias align 128 dereferenceable(209715200) %arg3, ptr noalias align 128 dereferenceable(209715200) %arg4, ptr noalias align 128 dereferenceable(209715200) %arg5, ptr noalias align 128 dereferenceable(209715200) %arg6, ptr noalias align 128 dereferenceable(209715200) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !92
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !45
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 13107200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 100
  %7 = udiv i32 %linear_index_base, 6400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %linear_index1, 64
  %11 = urem i32 %10, 100
  %12 = udiv i32 %linear_index1, 6400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 64
  %15 = udiv i32 %linear_index2, 64
  %16 = urem i32 %15, 100
  %17 = udiv i32 %linear_index2, 6400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 64
  %20 = udiv i32 %linear_index3, 64
  %21 = urem i32 %20, 100
  %22 = udiv i32 %linear_index3, 6400
  %23 = icmp ult i32 %linear_index_base, 52428800
  br i1 %23, label %fusion_52.in_bounds-true, label %fusion_52.in_bounds-after

fusion_52.in_bounds-after:                        ; preds = %fusion_52.in_bounds-true, %entry
  ret void

fusion_52.in_bounds-true:                         ; preds = %entry
  %24 = add i32 %7, 0
  %25 = add i32 %6, 0
  %26 = add i32 %4, 0
  %27 = mul nuw nsw i32 %26, 1
  %28 = add nuw nsw i32 0, %27
  %29 = udiv i32 %28, 200
  %30 = mul nuw nsw i32 %25, 1
  %31 = add nuw nsw i32 0, %30
  %32 = mul nuw nsw i32 %24, 100
  %33 = add nuw nsw i32 %31, %32
  %34 = udiv i32 %33, 819200
  %35 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %33, i32 %28
  %36 = load float, ptr %35, align 4, !invariant.load !46
  %37 = insertvalue { float, float, float, float, float, float } undef, float %36, 0
  %38 = add i32 %7, 0
  %39 = add i32 %6, 0
  %40 = add i32 %4, 136
  %41 = mul nuw nsw i32 %40, 1
  %42 = add nuw nsw i32 0, %41
  %43 = udiv i32 %42, 200
  %44 = mul nuw nsw i32 %39, 1
  %45 = add nuw nsw i32 0, %44
  %46 = mul nuw nsw i32 %38, 100
  %47 = add nuw nsw i32 %45, %46
  %48 = udiv i32 %47, 819200
  %49 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %47, i32 %42
  %50 = load float, ptr %49, align 4, !invariant.load !46
  %51 = insertvalue { float, float, float, float, float, float } %37, float %50, 1
  %52 = add i32 %7, 0
  %53 = add i32 %6, 0
  %54 = add i32 %4, 64
  %55 = mul nuw nsw i32 %54, 1
  %56 = add nuw nsw i32 0, %55
  %57 = udiv i32 %56, 200
  %58 = mul nuw nsw i32 %53, 1
  %59 = add nuw nsw i32 0, %58
  %60 = mul nuw nsw i32 %52, 100
  %61 = add nuw nsw i32 %59, %60
  %62 = udiv i32 %61, 819200
  %63 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %61, i32 %56
  %64 = load float, ptr %63, align 4, !invariant.load !46
  %65 = insertvalue { float, float, float, float, float, float } %51, float %64, 2
  %66 = add i32 %7, 0
  %67 = add i32 %6, 0
  %68 = add i32 %4, 168
  %69 = mul nuw nsw i32 %68, 1
  %70 = add nuw nsw i32 0, %69
  %71 = udiv i32 %70, 232
  %72 = mul nuw nsw i32 %67, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %66, 100
  %75 = add nuw nsw i32 %73, %74
  %76 = udiv i32 %75, 819200
  %77 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %75, i32 %70
  %78 = load float, ptr %77, align 4, !invariant.load !46
  %79 = insertvalue { float, float, float, float, float, float } %65, float %78, 3
  %80 = add i32 %7, 0
  %81 = add i32 %6, 0
  %82 = add i32 %4, 64
  %83 = mul nuw nsw i32 %82, 1
  %84 = add nuw nsw i32 0, %83
  %85 = udiv i32 %84, 232
  %86 = mul nuw nsw i32 %81, 1
  %87 = add nuw nsw i32 0, %86
  %88 = mul nuw nsw i32 %80, 100
  %89 = add nuw nsw i32 %87, %88
  %90 = udiv i32 %89, 819200
  %91 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %89, i32 %84
  %92 = load float, ptr %91, align 4, !invariant.load !46
  %93 = insertvalue { float, float, float, float, float, float } %79, float %92, 4
  %94 = add i32 %7, 0
  %95 = add i32 %6, 0
  %96 = add i32 %4, 0
  %97 = mul nuw nsw i32 %96, 1
  %98 = add nuw nsw i32 0, %97
  %99 = udiv i32 %98, 232
  %100 = mul nuw nsw i32 %95, 1
  %101 = add nuw nsw i32 0, %100
  %102 = mul nuw nsw i32 %94, 100
  %103 = add nuw nsw i32 %101, %102
  %104 = udiv i32 %103, 819200
  %105 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %103, i32 %98
  %106 = load float, ptr %105, align 4, !invariant.load !46
  %107 = insertvalue { float, float, float, float, float, float } %93, float %106, 5
  %108 = extractvalue { float, float, float, float, float, float } %107, 0
  %109 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %108, ptr %109, align 4
  %110 = extractvalue { float, float, float, float, float, float } %107, 1
  %111 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %110, ptr %111, align 4
  %112 = extractvalue { float, float, float, float, float, float } %107, 2
  %113 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %112, ptr %113, align 4
  %114 = extractvalue { float, float, float, float, float, float } %107, 3
  %115 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %114, ptr %115, align 4
  %116 = extractvalue { float, float, float, float, float, float } %107, 4
  %117 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %116, ptr %117, align 4
  %118 = extractvalue { float, float, float, float, float, float } %107, 5
  %119 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %118, ptr %119, align 4
  %120 = add i32 %12, 0
  %121 = add i32 %11, 0
  %122 = add i32 %9, 0
  %123 = mul nuw nsw i32 %122, 1
  %124 = add nuw nsw i32 0, %123
  %125 = udiv i32 %124, 200
  %126 = mul nuw nsw i32 %121, 1
  %127 = add nuw nsw i32 0, %126
  %128 = mul nuw nsw i32 %120, 100
  %129 = add nuw nsw i32 %127, %128
  %130 = udiv i32 %129, 819200
  %131 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %129, i32 %124
  %132 = load float, ptr %131, align 4, !invariant.load !46
  %133 = insertvalue { float, float, float, float, float, float } undef, float %132, 0
  %134 = add i32 %12, 0
  %135 = add i32 %11, 0
  %136 = add i32 %9, 136
  %137 = mul nuw nsw i32 %136, 1
  %138 = add nuw nsw i32 0, %137
  %139 = udiv i32 %138, 200
  %140 = mul nuw nsw i32 %135, 1
  %141 = add nuw nsw i32 0, %140
  %142 = mul nuw nsw i32 %134, 100
  %143 = add nuw nsw i32 %141, %142
  %144 = udiv i32 %143, 819200
  %145 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %143, i32 %138
  %146 = load float, ptr %145, align 4, !invariant.load !46
  %147 = insertvalue { float, float, float, float, float, float } %133, float %146, 1
  %148 = add i32 %12, 0
  %149 = add i32 %11, 0
  %150 = add i32 %9, 64
  %151 = mul nuw nsw i32 %150, 1
  %152 = add nuw nsw i32 0, %151
  %153 = udiv i32 %152, 200
  %154 = mul nuw nsw i32 %149, 1
  %155 = add nuw nsw i32 0, %154
  %156 = mul nuw nsw i32 %148, 100
  %157 = add nuw nsw i32 %155, %156
  %158 = udiv i32 %157, 819200
  %159 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %157, i32 %152
  %160 = load float, ptr %159, align 4, !invariant.load !46
  %161 = insertvalue { float, float, float, float, float, float } %147, float %160, 2
  %162 = add i32 %12, 0
  %163 = add i32 %11, 0
  %164 = add i32 %9, 168
  %165 = mul nuw nsw i32 %164, 1
  %166 = add nuw nsw i32 0, %165
  %167 = udiv i32 %166, 232
  %168 = mul nuw nsw i32 %163, 1
  %169 = add nuw nsw i32 0, %168
  %170 = mul nuw nsw i32 %162, 100
  %171 = add nuw nsw i32 %169, %170
  %172 = udiv i32 %171, 819200
  %173 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %171, i32 %166
  %174 = load float, ptr %173, align 4, !invariant.load !46
  %175 = insertvalue { float, float, float, float, float, float } %161, float %174, 3
  %176 = add i32 %12, 0
  %177 = add i32 %11, 0
  %178 = add i32 %9, 64
  %179 = mul nuw nsw i32 %178, 1
  %180 = add nuw nsw i32 0, %179
  %181 = udiv i32 %180, 232
  %182 = mul nuw nsw i32 %177, 1
  %183 = add nuw nsw i32 0, %182
  %184 = mul nuw nsw i32 %176, 100
  %185 = add nuw nsw i32 %183, %184
  %186 = udiv i32 %185, 819200
  %187 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %185, i32 %180
  %188 = load float, ptr %187, align 4, !invariant.load !46
  %189 = insertvalue { float, float, float, float, float, float } %175, float %188, 4
  %190 = add i32 %12, 0
  %191 = add i32 %11, 0
  %192 = add i32 %9, 0
  %193 = mul nuw nsw i32 %192, 1
  %194 = add nuw nsw i32 0, %193
  %195 = udiv i32 %194, 232
  %196 = mul nuw nsw i32 %191, 1
  %197 = add nuw nsw i32 0, %196
  %198 = mul nuw nsw i32 %190, 100
  %199 = add nuw nsw i32 %197, %198
  %200 = udiv i32 %199, 819200
  %201 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %199, i32 %194
  %202 = load float, ptr %201, align 4, !invariant.load !46
  %203 = insertvalue { float, float, float, float, float, float } %189, float %202, 5
  %204 = extractvalue { float, float, float, float, float, float } %203, 0
  %205 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %204, ptr %205, align 4
  %206 = extractvalue { float, float, float, float, float, float } %203, 1
  %207 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %206, ptr %207, align 4
  %208 = extractvalue { float, float, float, float, float, float } %203, 2
  %209 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %208, ptr %209, align 4
  %210 = extractvalue { float, float, float, float, float, float } %203, 3
  %211 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %210, ptr %211, align 4
  %212 = extractvalue { float, float, float, float, float, float } %203, 4
  %213 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %212, ptr %213, align 4
  %214 = extractvalue { float, float, float, float, float, float } %203, 5
  %215 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %214, ptr %215, align 4
  %216 = add i32 %17, 0
  %217 = add i32 %16, 0
  %218 = add i32 %14, 0
  %219 = mul nuw nsw i32 %218, 1
  %220 = add nuw nsw i32 0, %219
  %221 = udiv i32 %220, 200
  %222 = mul nuw nsw i32 %217, 1
  %223 = add nuw nsw i32 0, %222
  %224 = mul nuw nsw i32 %216, 100
  %225 = add nuw nsw i32 %223, %224
  %226 = udiv i32 %225, 819200
  %227 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %225, i32 %220
  %228 = load float, ptr %227, align 4, !invariant.load !46
  %229 = insertvalue { float, float, float, float, float, float } undef, float %228, 0
  %230 = add i32 %17, 0
  %231 = add i32 %16, 0
  %232 = add i32 %14, 136
  %233 = mul nuw nsw i32 %232, 1
  %234 = add nuw nsw i32 0, %233
  %235 = udiv i32 %234, 200
  %236 = mul nuw nsw i32 %231, 1
  %237 = add nuw nsw i32 0, %236
  %238 = mul nuw nsw i32 %230, 100
  %239 = add nuw nsw i32 %237, %238
  %240 = udiv i32 %239, 819200
  %241 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %239, i32 %234
  %242 = load float, ptr %241, align 4, !invariant.load !46
  %243 = insertvalue { float, float, float, float, float, float } %229, float %242, 1
  %244 = add i32 %17, 0
  %245 = add i32 %16, 0
  %246 = add i32 %14, 64
  %247 = mul nuw nsw i32 %246, 1
  %248 = add nuw nsw i32 0, %247
  %249 = udiv i32 %248, 200
  %250 = mul nuw nsw i32 %245, 1
  %251 = add nuw nsw i32 0, %250
  %252 = mul nuw nsw i32 %244, 100
  %253 = add nuw nsw i32 %251, %252
  %254 = udiv i32 %253, 819200
  %255 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %253, i32 %248
  %256 = load float, ptr %255, align 4, !invariant.load !46
  %257 = insertvalue { float, float, float, float, float, float } %243, float %256, 2
  %258 = add i32 %17, 0
  %259 = add i32 %16, 0
  %260 = add i32 %14, 168
  %261 = mul nuw nsw i32 %260, 1
  %262 = add nuw nsw i32 0, %261
  %263 = udiv i32 %262, 232
  %264 = mul nuw nsw i32 %259, 1
  %265 = add nuw nsw i32 0, %264
  %266 = mul nuw nsw i32 %258, 100
  %267 = add nuw nsw i32 %265, %266
  %268 = udiv i32 %267, 819200
  %269 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %267, i32 %262
  %270 = load float, ptr %269, align 4, !invariant.load !46
  %271 = insertvalue { float, float, float, float, float, float } %257, float %270, 3
  %272 = add i32 %17, 0
  %273 = add i32 %16, 0
  %274 = add i32 %14, 64
  %275 = mul nuw nsw i32 %274, 1
  %276 = add nuw nsw i32 0, %275
  %277 = udiv i32 %276, 232
  %278 = mul nuw nsw i32 %273, 1
  %279 = add nuw nsw i32 0, %278
  %280 = mul nuw nsw i32 %272, 100
  %281 = add nuw nsw i32 %279, %280
  %282 = udiv i32 %281, 819200
  %283 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %281, i32 %276
  %284 = load float, ptr %283, align 4, !invariant.load !46
  %285 = insertvalue { float, float, float, float, float, float } %271, float %284, 4
  %286 = add i32 %17, 0
  %287 = add i32 %16, 0
  %288 = add i32 %14, 0
  %289 = mul nuw nsw i32 %288, 1
  %290 = add nuw nsw i32 0, %289
  %291 = udiv i32 %290, 232
  %292 = mul nuw nsw i32 %287, 1
  %293 = add nuw nsw i32 0, %292
  %294 = mul nuw nsw i32 %286, 100
  %295 = add nuw nsw i32 %293, %294
  %296 = udiv i32 %295, 819200
  %297 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %295, i32 %290
  %298 = load float, ptr %297, align 4, !invariant.load !46
  %299 = insertvalue { float, float, float, float, float, float } %285, float %298, 5
  %300 = extractvalue { float, float, float, float, float, float } %299, 0
  %301 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %300, ptr %301, align 4
  %302 = extractvalue { float, float, float, float, float, float } %299, 1
  %303 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %302, ptr %303, align 4
  %304 = extractvalue { float, float, float, float, float, float } %299, 2
  %305 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %304, ptr %305, align 4
  %306 = extractvalue { float, float, float, float, float, float } %299, 3
  %307 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %306, ptr %307, align 4
  %308 = extractvalue { float, float, float, float, float, float } %299, 4
  %309 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %308, ptr %309, align 4
  %310 = extractvalue { float, float, float, float, float, float } %299, 5
  %311 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %310, ptr %311, align 4
  %312 = add i32 %22, 0
  %313 = add i32 %21, 0
  %314 = add i32 %19, 0
  %315 = mul nuw nsw i32 %314, 1
  %316 = add nuw nsw i32 0, %315
  %317 = udiv i32 %316, 200
  %318 = mul nuw nsw i32 %313, 1
  %319 = add nuw nsw i32 0, %318
  %320 = mul nuw nsw i32 %312, 100
  %321 = add nuw nsw i32 %319, %320
  %322 = udiv i32 %321, 819200
  %323 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %321, i32 %316
  %324 = load float, ptr %323, align 4, !invariant.load !46
  %325 = insertvalue { float, float, float, float, float, float } undef, float %324, 0
  %326 = add i32 %22, 0
  %327 = add i32 %21, 0
  %328 = add i32 %19, 136
  %329 = mul nuw nsw i32 %328, 1
  %330 = add nuw nsw i32 0, %329
  %331 = udiv i32 %330, 200
  %332 = mul nuw nsw i32 %327, 1
  %333 = add nuw nsw i32 0, %332
  %334 = mul nuw nsw i32 %326, 100
  %335 = add nuw nsw i32 %333, %334
  %336 = udiv i32 %335, 819200
  %337 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %335, i32 %330
  %338 = load float, ptr %337, align 4, !invariant.load !46
  %339 = insertvalue { float, float, float, float, float, float } %325, float %338, 1
  %340 = add i32 %22, 0
  %341 = add i32 %21, 0
  %342 = add i32 %19, 64
  %343 = mul nuw nsw i32 %342, 1
  %344 = add nuw nsw i32 0, %343
  %345 = udiv i32 %344, 200
  %346 = mul nuw nsw i32 %341, 1
  %347 = add nuw nsw i32 0, %346
  %348 = mul nuw nsw i32 %340, 100
  %349 = add nuw nsw i32 %347, %348
  %350 = udiv i32 %349, 819200
  %351 = getelementptr inbounds [819200 x [200 x float]], ptr %arg0, i32 0, i32 %349, i32 %344
  %352 = load float, ptr %351, align 4, !invariant.load !46
  %353 = insertvalue { float, float, float, float, float, float } %339, float %352, 2
  %354 = add i32 %22, 0
  %355 = add i32 %21, 0
  %356 = add i32 %19, 168
  %357 = mul nuw nsw i32 %356, 1
  %358 = add nuw nsw i32 0, %357
  %359 = udiv i32 %358, 232
  %360 = mul nuw nsw i32 %355, 1
  %361 = add nuw nsw i32 0, %360
  %362 = mul nuw nsw i32 %354, 100
  %363 = add nuw nsw i32 %361, %362
  %364 = udiv i32 %363, 819200
  %365 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %363, i32 %358
  %366 = load float, ptr %365, align 4, !invariant.load !46
  %367 = insertvalue { float, float, float, float, float, float } %353, float %366, 3
  %368 = add i32 %22, 0
  %369 = add i32 %21, 0
  %370 = add i32 %19, 64
  %371 = mul nuw nsw i32 %370, 1
  %372 = add nuw nsw i32 0, %371
  %373 = udiv i32 %372, 232
  %374 = mul nuw nsw i32 %369, 1
  %375 = add nuw nsw i32 0, %374
  %376 = mul nuw nsw i32 %368, 100
  %377 = add nuw nsw i32 %375, %376
  %378 = udiv i32 %377, 819200
  %379 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %377, i32 %372
  %380 = load float, ptr %379, align 4, !invariant.load !46
  %381 = insertvalue { float, float, float, float, float, float } %367, float %380, 4
  %382 = add i32 %22, 0
  %383 = add i32 %21, 0
  %384 = add i32 %19, 0
  %385 = mul nuw nsw i32 %384, 1
  %386 = add nuw nsw i32 0, %385
  %387 = udiv i32 %386, 232
  %388 = mul nuw nsw i32 %383, 1
  %389 = add nuw nsw i32 0, %388
  %390 = mul nuw nsw i32 %382, 100
  %391 = add nuw nsw i32 %389, %390
  %392 = udiv i32 %391, 819200
  %393 = getelementptr inbounds [819200 x [232 x float]], ptr %arg1, i32 0, i32 %391, i32 %386
  %394 = load float, ptr %393, align 4, !invariant.load !46
  %395 = insertvalue { float, float, float, float, float, float } %381, float %394, 5
  %396 = extractvalue { float, float, float, float, float, float } %395, 0
  %397 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %396, ptr %397, align 4
  %398 = extractvalue { float, float, float, float, float, float } %395, 1
  %399 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %398, ptr %399, align 4
  %400 = extractvalue { float, float, float, float, float, float } %395, 2
  %401 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %400, ptr %401, align 4
  %402 = extractvalue { float, float, float, float, float, float } %395, 3
  %403 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %402, ptr %403, align 4
  %404 = extractvalue { float, float, float, float, float, float } %395, 4
  %405 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %404, ptr %405, align 4
  %406 = extractvalue { float, float, float, float, float, float } %395, 5
  %407 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %406, ptr %407, align 4
  br label %fusion_52.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43}

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
!44 = !{i32 0, i32 128}
!45 = !{i32 0, i32 256}
!46 = !{}
!47 = !{i32 0, i32 2048}
!48 = !{i32 0, i32 1}
!49 = !{i32 0, i32 96}
!50 = !{i32 0, i32 1092267}
!51 = distinct !{!51, !52}
!52 = !{!"llvm.loop.vectorize.enable", i1 false}
!53 = distinct !{!53, !52, !54}
!54 = !{!"llvm.loop.unroll.full"}
!55 = distinct !{!55, !52, !54}
!56 = !{i32 0, i32 10923}
!57 = distinct !{!57, !52}
!58 = distinct !{!58, !52, !54}
!59 = distinct !{!59, !52, !54}
!60 = !{i32 0, i32 3200}
!61 = !{i32 0, i32 2}
!62 = !{i32 0, i32 1024}
!63 = !{i32 0, i32 38}
!64 = distinct !{!64, !52}
!65 = distinct !{!65, !52, !54}
!66 = distinct !{!66, !52, !54}
!67 = !{i32 0, i32 4}
!68 = !{i32 0, i32 64}
!69 = distinct !{!69, !52, !54}
!70 = distinct !{!70, !52}
!71 = distinct !{!71, !52, !54}
!72 = distinct !{!72, !52}
!73 = distinct !{!73, !52, !54}
!74 = distinct !{!74, !52}
!75 = distinct !{!75, !52, !54}
!76 = distinct !{!76, !52}
!77 = distinct !{!77, !52, !54}
!78 = distinct !{!78, !52}
!79 = !{i32 0, i32 34134}
!80 = distinct !{!80, !52}
!81 = distinct !{!81, !52, !54}
!82 = distinct !{!82, !52, !54}
!83 = !{i32 0, i32 800}
!84 = !{i32 0, i32 6400}
!85 = !{i32 0, i32 32768}
!86 = distinct !{!86, !52, !54}
!87 = distinct !{!87, !52}
!88 = !{i32 0, i32 50}
!89 = !{i32 0, i32 16}
!90 = !{i32 0, i32 242}
!91 = !{i32 0, i32 512}
!92 = !{i32 0, i32 51200}
