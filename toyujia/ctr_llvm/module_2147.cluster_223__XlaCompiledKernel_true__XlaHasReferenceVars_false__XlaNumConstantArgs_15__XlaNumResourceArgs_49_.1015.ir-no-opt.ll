target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_18 = constant [64 x i8] c"\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@buffer_for_constant_10 = constant [64 x i8] zeroinitializer, align 128
@tr_tile_0 = private addrspace(3) global [1 x [32 x [33 x float]]] undef
@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache2 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@shared_cache3 = private addrspace(3) global [1 x [1 x [1 x float]]] undef
@3 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache4 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache5 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache6 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache7 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@shared_cache8 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@4 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache9 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache10 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache11 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache12 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@5 = private unnamed_addr constant [4 x i8] zeroinitializer
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache13 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@8 = private unnamed_addr constant [4 x i8] zeroinitializer
@9 = private unnamed_addr constant [4 x i8] c"1\0C\C3;"
@10 = private unnamed_addr constant [4 x i8] c"\00\00\00\BF"
@11 = private unnamed_addr constant [4 x i8] c"\00\00\00@"
@12 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache14 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache15 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache16 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache17 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache18 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache19 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@13 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@14 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache20 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache21 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@15 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache22 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache23 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache24 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache25 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache26 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache27 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@16 = private unnamed_addr constant [4 x i8] zeroinitializer
@17 = private unnamed_addr constant [4 x i8] zeroinitializer
@18 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache28 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@shared_cache29 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@19 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache30 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef

define void @fusion_98(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 16 dereferenceable(8388608) %arg1, ptr noalias align 16 dereferenceable(8388608) %arg2, ptr noalias align 128 dereferenceable(8388608) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
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
  br i1 %23, label %fusion_98.in_bounds-true, label %fusion_98.in_bounds-after

fusion_98.in_bounds-after:                        ; preds = %fusion_98.in_bounds-true, %entry
  ret void

fusion_98.in_bounds-true:                         ; preds = %entry
  %24 = mul nuw nsw i32 %4, 1
  %25 = add nuw nsw i32 0, %24
  %26 = mul nuw nsw i32 %6, 64
  %27 = add nuw nsw i32 %25, %26
  %28 = udiv i32 %27, 256
  %29 = mul nuw nsw i32 %7, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  %32 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %33 = load float, ptr %32, align 4, !invariant.load !98
  %34 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %35 = load float, ptr %34, align 4, !invariant.load !98
  %add.4 = fadd float %33, %35
  %36 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %37 = load float, ptr %36, align 4, !invariant.load !98
  %add.5 = fadd float %add.4, %37
  %38 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %add.5, ptr %38, align 4
  %39 = mul nuw nsw i32 %9, 1
  %40 = add nuw nsw i32 0, %39
  %41 = mul nuw nsw i32 %11, 64
  %42 = add nuw nsw i32 %40, %41
  %43 = udiv i32 %42, 256
  %44 = mul nuw nsw i32 %12, 1
  %45 = add nuw nsw i32 0, %44
  %46 = udiv i32 %45, 8192
  %47 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %48 = load float, ptr %47, align 4, !invariant.load !98
  %49 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %50 = load float, ptr %49, align 4, !invariant.load !98
  %add.41 = fadd float %48, %50
  %51 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %52 = load float, ptr %51, align 4, !invariant.load !98
  %add.52 = fadd float %add.41, %52
  %53 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %add.52, ptr %53, align 4
  %54 = mul nuw nsw i32 %14, 1
  %55 = add nuw nsw i32 0, %54
  %56 = mul nuw nsw i32 %16, 64
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 256
  %59 = mul nuw nsw i32 %17, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 8192
  %62 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %63 = load float, ptr %62, align 4, !invariant.load !98
  %64 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %65 = load float, ptr %64, align 4, !invariant.load !98
  %add.43 = fadd float %63, %65
  %66 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %67 = load float, ptr %66, align 4, !invariant.load !98
  %add.54 = fadd float %add.43, %67
  %68 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %add.54, ptr %68, align 4
  %69 = mul nuw nsw i32 %19, 1
  %70 = add nuw nsw i32 0, %69
  %71 = mul nuw nsw i32 %21, 64
  %72 = add nuw nsw i32 %70, %71
  %73 = udiv i32 %72, 256
  %74 = mul nuw nsw i32 %22, 1
  %75 = add nuw nsw i32 0, %74
  %76 = udiv i32 %75, 8192
  %77 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %78 = load float, ptr %77, align 4, !invariant.load !98
  %79 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %80 = load float, ptr %79, align 4, !invariant.load !98
  %add.45 = fadd float %78, %80
  %81 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %82 = load float, ptr %81, align 4, !invariant.load !98
  %add.56 = fadd float %add.45, %82
  %83 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %add.56, ptr %83, align 4
  br label %fusion_98.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_21(ptr noalias align 16 dereferenceable(33554432) %arg0, ptr noalias align 128 dereferenceable(33554432) %arg1) {
entry:
  %tile_loop.invar_address13 = alloca i32, align 4
  %y_in_tile.invar_address7 = alloca i32, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !99
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !100
  %2 = urem i32 %0, 128
  %3 = udiv i32 %0, 128
  %4 = mul i32 %1, 1
  %5 = add i32 %4, %3
  %6 = icmp ult i32 %5, 8192
  br i1 %6, label %7, label %early_return

7:                                                ; preds = %entry
  %thread_id.x = urem i32 %2, 32
  %thread_id.y = udiv i32 %2, 32
  %lane_id = urem i32 %2, 32
  %8 = udiv i32 %5, 1
  %9 = urem i32 %8, 1
  %10 = udiv i32 %5, 1
  %11 = urem i32 %10, 512
  %12 = udiv i32 %5, 512
  %13 = icmp eq i32 %11, 511
  %tile_bound = select i1 %13, i32 32, i32 32
  %14 = icmp eq i32 %9, 0
  %tile_bound1 = select i1 %14, i32 32, i32 32
  %tile_origin.0 = mul i32 %11, 32
  %tile_origin.1 = mul i32 %12, 1
  %tile_origin.2 = mul i32 %9, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %7
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %15 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %15, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 4
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %16 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %17 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %18 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %18, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %19 = icmp eq i32 %tile_loop.indvar, 0
  %20 = mul i32 %tile_loop.indvar, 1
  %21 = add i32 %20, 0
  %x_loc = add i32 %21, %17
  %22 = add i32 %tile_origin.0, %y_in_tile.indvar
  %23 = add i32 %tile_origin.2, %x_loc
  %24 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %24, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !101

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !104

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  call void @llvm.nvvm.barrier0()
  store i32 %thread_id.y, ptr %y_in_tile.invar_address7, align 4
  br label %y_in_tile.loop_header5

y_in_tile.loop_header5:                           ; preds = %tile_loop.loop_exit10, %y_in_tile.loop_exit
  %y_in_tile.indvar8 = load i32, ptr %y_in_tile.invar_address7, align 4
  %25 = icmp uge i32 %y_in_tile.indvar8, %tile_bound1
  br i1 %25, label %y_in_tile.loop_exit4, label %y_in_tile.loop_body6

y_in_tile.loop_body6:                             ; preds = %y_in_tile.loop_header5
  %invar.inc9 = add nuw nsw i32 %y_in_tile.indvar8, 4
  store i32 %invar.inc9, ptr %y_in_tile.invar_address7, align 4
  %26 = icmp eq i32 %y_in_tile.indvar8, %thread_id.y
  %27 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address13, align 4
  br label %tile_loop.loop_header11

tile_loop.loop_header11:                          ; preds = %x_in_tile-after18, %y_in_tile.loop_body6
  %tile_loop.indvar14 = load i32, ptr %tile_loop.invar_address13, align 4
  %28 = icmp uge i32 %tile_loop.indvar14, 1
  br i1 %28, label %tile_loop.loop_exit10, label %tile_loop.loop_body12

tile_loop.loop_body12:                            ; preds = %tile_loop.loop_header11
  %invar.inc15 = add nuw nsw i32 %tile_loop.indvar14, 1
  store i32 %invar.inc15, ptr %tile_loop.invar_address13, align 4
  %29 = icmp eq i32 %tile_loop.indvar14, 0
  %30 = mul i32 %tile_loop.indvar14, 1
  %31 = add i32 %30, 0
  %x_loc16 = add i32 %31, %27
  %32 = add i32 %tile_origin.2, %y_in_tile.indvar8
  %33 = add i32 %tile_origin.0, %x_loc16
  %34 = icmp ult i32 %x_loc16, %tile_bound
  br i1 %34, label %x_in_tile-true17, label %x_in_tile-after18

x_in_tile-after18:                                ; preds = %x_in_tile-true17, %tile_loop.loop_body12
  br label %tile_loop.loop_header11, !llvm.loop !105

tile_loop.loop_exit10:                            ; preds = %tile_loop.loop_header11
  br label %y_in_tile.loop_header5, !llvm.loop !106

y_in_tile.loop_exit4:                             ; preds = %y_in_tile.loop_header5
  ret void

early_return:                                     ; preds = %entry
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %35 = mul nuw nsw i32 %23, 1
  %36 = add nuw nsw i32 0, %35
  %37 = mul nuw nsw i32 %tile_origin.1, 32
  %38 = add nuw nsw i32 %36, %37
  %39 = mul nuw nsw i32 %22, 512
  %40 = add nuw nsw i32 %38, %39
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 32
  %43 = udiv i32 %40, 32
  %44 = urem i32 %43, 16
  %45 = udiv i32 %40, 512
  %46 = urem i32 %45, 8192
  %47 = udiv i32 %40, 4194304
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %40
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  %48 = getelementptr inbounds [1 x [32 x [33 x float]]], ptr addrspace(3) @tr_tile_0, i32 0, i32 %3, i32 %y_in_tile.indvar, i32 %x_loc
  %49 = addrspacecast ptr addrspace(3) %48 to ptr
  store float %Arg_0.13, ptr %49, align 4
  br label %x_in_tile-after

x_in_tile-true17:                                 ; preds = %tile_loop.loop_body12
  %50 = mul nuw nsw i32 %33, 1
  %51 = add nuw nsw i32 0, %50
  %52 = mul nuw nsw i32 %tile_origin.1, 16384
  %53 = add nuw nsw i32 %51, %52
  %54 = mul nuw nsw i32 %32, 262144
  %55 = add nuw nsw i32 %53, %54
  %56 = udiv i32 %55, 1
  %57 = urem i32 %56, 8192
  %58 = udiv i32 %55, 8192
  %59 = urem i32 %58, 2
  %60 = udiv i32 %55, 16384
  %61 = urem i32 %60, 16
  %62 = udiv i32 %55, 262144
  %63 = getelementptr inbounds [1 x [32 x [33 x float]]], ptr addrspace(3) @tr_tile_0, i32 0, i32 %3, i32 %x_loc16, i32 %y_in_tile.indvar8
  %64 = addrspacecast ptr addrspace(3) %63 to ptr
  %tiled_buffer = load float, ptr %64, align 4
  %65 = mul nuw nsw i32 %57, 1
  %66 = add nuw nsw i32 0, %65
  %67 = mul nuw nsw i32 %59, 8192
  %68 = add nuw nsw i32 %66, %67
  %69 = mul nuw nsw i32 %61, 16384
  %70 = add nuw nsw i32 %68, %69
  %71 = udiv i32 %70, 262144
  %72 = mul nuw nsw i32 %62, 1
  %73 = add nuw nsw i32 0, %72
  %74 = udiv i32 %73, 32
  %75 = mul nuw nsw i32 %70, 1
  %76 = add nuw nsw i32 0, %75
  %77 = urem i32 %76, 8192
  %78 = udiv i32 %76, 8192
  %79 = urem i32 %78, 2
  %80 = udiv i32 %78, 2
  %81 = udiv i32 %80, 16
  %82 = mul nuw nsw i32 %73, 1
  %83 = add nuw nsw i32 0, %82
  %84 = udiv i32 %83, 32
  %85 = getelementptr inbounds float, ptr %arg1, i32 %55
  store float %tiled_buffer, ptr %85, align 4
  br label %x_in_tile-after18
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

define void @fusion_97(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(8388608) %arg1, ptr noalias align 16 dereferenceable(838860800) %arg2, ptr noalias align 128 dereferenceable(838860800) %arg3, ptr noalias align 128 dereferenceable(13107200) %arg4) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_17_constant_10 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_17_constant_10, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !108
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !109
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
  br label %y_in_tile.loop_header, !llvm.loop !110

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
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %46
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
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
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !98
  %76 = udiv i32 %46, 64
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %76
  %Arg_0.17 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
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
  br label %tile_loop.loop_header, !llvm.loop !111

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
  br label %tile_loop.loop_header9, !llvm.loop !112

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
  %Arg_1.216 = load float, ptr %Arg_1.215, align 4, !invariant.load !98
  %Arg_2.317 = getelementptr inbounds float, ptr %arg2, i32 %101
  %Arg_2.318 = load float, ptr %Arg_2.317, align 4, !invariant.load !98
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
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !98
  %131 = udiv i32 %101, 64
  %Arg_0.123 = getelementptr inbounds float, ptr %arg0, i32 %131
  %Arg_0.124 = load float, ptr %Arg_0.123, align 4, !invariant.load !98
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
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

define void @fusion_93(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_11_constant_5 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_11_constant_5, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !108
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !113
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
  br label %y_in_tile.loop_header, !llvm.loop !114

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
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  %multiply.4 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.4, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_6(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !115

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
  br label %tile_loop.loop_header6, !llvm.loop !116

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
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !98
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !98
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

define void @fusion_92(ptr noalias align 16 dereferenceable(13107200) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(13107200) %arg2, ptr noalias align 128 dereferenceable(13107200) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !117
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
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
  br i1 %23, label %fusion_92.in_bounds-true, label %fusion_92.in_bounds-after

fusion_92.in_bounds-after:                        ; preds = %fusion_92.in_bounds-true, %entry
  ret void

fusion_92.in_bounds-true:                         ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !98
  %26 = udiv i32 %linear_index_base, 100
  %27 = getelementptr inbounds float, ptr %arg1, i32 %26
  %28 = load float, ptr %27, align 4, !invariant.load !98
  %subtract.6 = fsub float %25, %28
  %29 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %30 = load float, ptr %29, align 4, !invariant.load !98
  %multiply.7 = fmul float %subtract.6, %30
  %31 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %multiply.7, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %33 = load float, ptr %32, align 4, !invariant.load !98
  %34 = udiv i32 %linear_index1, 100
  %35 = getelementptr inbounds float, ptr %arg1, i32 %34
  %36 = load float, ptr %35, align 4, !invariant.load !98
  %subtract.61 = fsub float %33, %36
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %38 = load float, ptr %37, align 4, !invariant.load !98
  %multiply.72 = fmul float %subtract.61, %38
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %multiply.72, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %41 = load float, ptr %40, align 4, !invariant.load !98
  %42 = udiv i32 %linear_index2, 100
  %43 = getelementptr inbounds float, ptr %arg1, i32 %42
  %44 = load float, ptr %43, align 4, !invariant.load !98
  %subtract.63 = fsub float %41, %44
  %45 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %46 = load float, ptr %45, align 4, !invariant.load !98
  %multiply.74 = fmul float %subtract.63, %46
  %47 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %multiply.74, ptr %47, align 4
  %48 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %49 = load float, ptr %48, align 4, !invariant.load !98
  %50 = udiv i32 %linear_index3, 100
  %51 = getelementptr inbounds float, ptr %arg1, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !98
  %subtract.65 = fsub float %49, %52
  %53 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %54 = load float, ptr %53, align 4, !invariant.load !98
  %multiply.76 = fmul float %subtract.65, %54
  %55 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %multiply.76, ptr %55, align 4
  br label %fusion_92.in_bounds-after
}

define void @fusion_95(ptr noalias align 16 dereferenceable(40960) %arg0, ptr noalias align 128 dereferenceable(172032) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(40960) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !118
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 10240
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 10240
  br i1 %6, label %fusion_95.in_bounds-true, label %fusion_95.in_bounds-after

fusion_95.in_bounds-after:                        ; preds = %fusion_95.in_bounds-true, %entry
  ret void

fusion_95.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = add i32 %5, 128
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [168 x [256 x float]], ptr %arg1, i32 0, i32 %10, i32 %11
  %13 = load float, ptr %12, align 4, !invariant.load !98
  %multiply.6 = fmul float %9, %13
  %subtract.7 = fsub float %8, %multiply.6
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %subtract.7, ptr %14, align 4
  br label %fusion_95.in_bounds-after
}

define void @fusion_52(ptr noalias align 16 dereferenceable(88080384) %arg0, ptr noalias align 16 dereferenceable(672) %arg1, ptr noalias align 128 dereferenceable(550502400) %arg2, ptr noalias align 16 dereferenceable(524288) %arg3, ptr noalias align 128 dereferenceable(524288) %arg4, ptr noalias align 128 dereferenceable(524288) %arg5) {
entry:
  %initial_value_addr65 = alloca float, align 4
  %return_buffer60 = alloca float, align 4
  %result_from_other_lane58 = alloca float, align 4
  %return_buffer57 = alloca float, align 4
  %result_from_other_lane55 = alloca float, align 4
  %return_buffer54 = alloca float, align 4
  %result_from_other_lane52 = alloca float, align 4
  %return_buffer51 = alloca float, align 4
  %result_from_other_lane49 = alloca float, align 4
  %return_buffer48 = alloca float, align 4
  %result_from_other_lane46 = alloca float, align 4
  %initial_value_addr = alloca float, align 4
  %return_buffer44 = alloca float, align 4
  %result_from_other_lane42 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer30 = alloca float, align 4
  %return_buffer26 = alloca float, align 4
  %tile_loop.invar_address14 = alloca i32, align 4
  %return_buffer10 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result2 = alloca float, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after64, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_26_constant_10 = load float, ptr @2, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_26_constant_10, ptr %2, align 4
  %region_0_26_constant_103 = load float, ptr @2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_26_constant_103, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !120
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !121
  %6 = urem i32 %4, 32
  %7 = udiv i32 %4, 32
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 131072
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 1
  %14 = udiv i32 %9, 1
  %15 = urem i32 %14, 131072
  %16 = udiv i32 %9, 131072
  %17 = icmp eq i32 %15, 131071
  %tile_bound = select i1 %17, i32 1, i32 1
  %18 = icmp eq i32 %13, 0
  %tile_bound4 = select i1 %18, i32 168, i32 512
  %tile_origin.0 = mul i32 %16, 1
  %tile_origin.1 = mul i32 %15, 1
  %tile_origin.2 = mul i32 %13, 512
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %is_full_tile-after, %11
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %19 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %19, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 1
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %20 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %21 = icmp eq i32 512, %tile_bound4
  br i1 %21, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit11, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !122

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result31 = load float, ptr %current_output, align 4
  %22 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 16, i32 31)
  store float %22, ptr %result_from_other_lane, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer32)
  %23 = load float, ptr %return_buffer32, align 4
  store float %23, ptr %current_output, align 4
  %partial_reduction_result34 = load float, ptr %current_output, align 4
  %24 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 8, i32 31)
  store float %24, ptr %result_from_other_lane33, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane33, ptr %return_buffer35)
  %25 = load float, ptr %return_buffer35, align 4
  store float %25, ptr %current_output, align 4
  %partial_reduction_result37 = load float, ptr %current_output, align 4
  %26 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 4, i32 31)
  store float %26, ptr %result_from_other_lane36, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane36, ptr %return_buffer38)
  %27 = load float, ptr %return_buffer38, align 4
  store float %27, ptr %current_output, align 4
  %partial_reduction_result40 = load float, ptr %current_output, align 4
  %28 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 2, i32 31)
  store float %28, ptr %result_from_other_lane39, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane39, ptr %return_buffer41)
  %29 = load float, ptr %return_buffer41, align 4
  store float %29, ptr %current_output, align 4
  %partial_reduction_result43 = load float, ptr %current_output, align 4
  %30 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result43, i32 1, i32 31)
  store float %30, ptr %result_from_other_lane42, align 4
  call void @region_1_11__1(ptr %current_output, ptr %result_from_other_lane42, ptr %return_buffer44)
  %31 = load float, ptr %return_buffer44, align 4
  store float %31, ptr %current_output, align 4
  %32 = udiv i32 %thread_id.x, 32
  %33 = icmp eq i32 %lane_id, 0
  br i1 %33, label %intra_warp_reduce_write-true, label %intra_warp_reduce_write-after

intra_warp_reduce_write-after:                    ; preds = %intra_warp_reduce_write-true, %y_in_tile.loop_exit
  call void @llvm.nvvm.barrier0()
  %34 = icmp eq i32 %32, 0
  br i1 %34, label %inter_warp_reduce-true, label %inter_warp_reduce-after

inter_warp_reduce-after:                          ; preds = %reduction_write_output-after, %intra_warp_reduce_write-after
  %current_output45 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %partial_reduction_result47 = load float, ptr %current_output45, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result47, i32 16, i32 31)
  store float %35, ptr %result_from_other_lane46, align 4
  call void @region_2_20(ptr %current_output45, ptr %result_from_other_lane46, ptr %return_buffer48)
  %36 = load float, ptr %return_buffer48, align 4
  store float %36, ptr %current_output45, align 4
  %partial_reduction_result50 = load float, ptr %current_output45, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result50, i32 8, i32 31)
  store float %37, ptr %result_from_other_lane49, align 4
  call void @region_2_20(ptr %current_output45, ptr %result_from_other_lane49, ptr %return_buffer51)
  %38 = load float, ptr %return_buffer51, align 4
  store float %38, ptr %current_output45, align 4
  %partial_reduction_result53 = load float, ptr %current_output45, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result53, i32 4, i32 31)
  store float %39, ptr %result_from_other_lane52, align 4
  call void @region_2_20(ptr %current_output45, ptr %result_from_other_lane52, ptr %return_buffer54)
  %40 = load float, ptr %return_buffer54, align 4
  store float %40, ptr %current_output45, align 4
  %partial_reduction_result56 = load float, ptr %current_output45, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result56, i32 2, i32 31)
  store float %41, ptr %result_from_other_lane55, align 4
  call void @region_2_20(ptr %current_output45, ptr %result_from_other_lane55, ptr %return_buffer57)
  %42 = load float, ptr %return_buffer57, align 4
  store float %42, ptr %current_output45, align 4
  %partial_reduction_result59 = load float, ptr %current_output45, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result59, i32 1, i32 31)
  store float %43, ptr %result_from_other_lane58, align 4
  call void @region_2_20(ptr %current_output45, ptr %result_from_other_lane58, ptr %return_buffer60)
  %44 = load float, ptr %return_buffer60, align 4
  store float %44, ptr %current_output45, align 4
  %45 = udiv i32 %thread_id.x, 32
  %46 = icmp eq i32 %lane_id, 0
  br i1 %46, label %intra_warp_reduce_write-true61, label %intra_warp_reduce_write-after62

intra_warp_reduce_write-after62:                  ; preds = %intra_warp_reduce_write-true61, %inter_warp_reduce-after
  call void @llvm.nvvm.barrier0()
  %47 = icmp eq i32 %45, 0
  br i1 %47, label %inter_warp_reduce-true63, label %inter_warp_reduce-after64

inter_warp_reduce-after64:                        ; preds = %reduction_write_output-after67, %intra_warp_reduce_write-after62
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %48 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %49 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %49, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc5 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc5, ptr %tile_loop.invar_address, align 4
  %50 = icmp eq i32 %tile_loop.indvar, 0
  %51 = mul i32 %tile_loop.indvar, 32
  %52 = add i32 %51, 0
  %x_loc = add i32 %52, %48
  %53 = add i32 %tile_origin.1, %y_in_tile.indvar
  %54 = add i32 %tile_origin.2, %x_loc
  %55 = mul nuw nsw i32 %54, 1
  %56 = add nuw nsw i32 0, %55
  %57 = mul nuw nsw i32 %53, 168
  %58 = add nuw nsw i32 %56, %57
  %59 = mul nuw nsw i32 %tile_origin.0, 22020096
  %60 = add nuw nsw i32 %58, %59
  %61 = udiv i32 %60, 1
  %62 = urem i32 %61, 168
  %63 = udiv i32 %60, 168
  %64 = urem i32 %63, 16
  %65 = udiv i32 %60, 2688
  %66 = add i32 %65, 0
  %67 = add i32 %64, 0
  %68 = add i32 %62, 0
  %69 = mul nuw nsw i32 %68, 1
  %70 = add nuw nsw i32 0, %69
  %71 = udiv i32 %70, 168
  %72 = mul nuw nsw i32 %67, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %66, 100
  %75 = add nuw nsw i32 %73, %74
  %76 = udiv i32 %75, 819200
  %Arg_2.3 = getelementptr inbounds [819200 x [168 x float]], ptr %arg2, i32 0, i32 %75, i32 %70
  %Arg_2.36 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
  %Arg_1.2 = getelementptr inbounds [168 x float], ptr %arg1, i32 0, i32 %62
  %Arg_1.27 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %multiply.8 = fmul float %Arg_2.36, %Arg_1.27
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %60
  %Arg_0.18 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  %multiply.9 = fmul float %multiply.8, %Arg_0.18
  store float %multiply.9, ptr %reduction_input_address, align 4
  %77 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11__1(ptr %77, ptr %reduction_input_address, ptr %return_buffer)
  %78 = load float, ptr %return_buffer, align 4
  store float %78, ptr %77, align 4
  %79 = udiv i32 %60, 168
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %79
  %Arg_3.49 = load float, ptr %Arg_3.4, align 4, !invariant.load !98
  %multiply.18 = fmul float %multiply.8, %Arg_3.49
  %80 = fneg float %multiply.18
  store float %80, ptr %reduction_input_address1, align 4
  %81 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_20(ptr %81, ptr %reduction_input_address1, ptr %return_buffer10)
  %82 = load float, ptr %return_buffer10, align 4
  store float %82, ptr %81, align 4
  br label %tile_loop.loop_header, !llvm.loop !123

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %83 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address14, align 4
  br label %tile_loop.loop_header12

tile_loop.loop_header12:                          ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar15 = load i32, ptr %tile_loop.invar_address14, align 4
  %84 = icmp uge i32 %tile_loop.indvar15, 16
  br i1 %84, label %tile_loop.loop_exit11, label %tile_loop.loop_body13

tile_loop.loop_body13:                            ; preds = %tile_loop.loop_header12
  %invar.inc16 = add nuw nsw i32 %tile_loop.indvar15, 1
  store i32 %invar.inc16, ptr %tile_loop.invar_address14, align 4
  %85 = icmp eq i32 %tile_loop.indvar15, 0
  %86 = mul i32 %tile_loop.indvar15, 32
  %87 = add i32 %86, 0
  %x_loc17 = add i32 %87, %83
  %88 = add i32 %tile_origin.1, %y_in_tile.indvar
  %89 = add i32 %tile_origin.2, %x_loc17
  %90 = icmp ult i32 %x_loc17, %tile_bound4
  br i1 %90, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body13
  br label %tile_loop.loop_header12, !llvm.loop !124

tile_loop.loop_exit11:                            ; preds = %tile_loop.loop_header12
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body13
  %91 = mul nuw nsw i32 %89, 1
  %92 = add nuw nsw i32 0, %91
  %93 = mul nuw nsw i32 %88, 168
  %94 = add nuw nsw i32 %92, %93
  %95 = mul nuw nsw i32 %tile_origin.0, 22020096
  %96 = add nuw nsw i32 %94, %95
  %97 = udiv i32 %96, 1
  %98 = urem i32 %97, 168
  %99 = udiv i32 %96, 168
  %100 = urem i32 %99, 16
  %101 = udiv i32 %96, 2688
  %102 = add i32 %101, 0
  %103 = add i32 %100, 0
  %104 = add i32 %98, 0
  %105 = mul nuw nsw i32 %104, 1
  %106 = add nuw nsw i32 0, %105
  %107 = udiv i32 %106, 168
  %108 = mul nuw nsw i32 %103, 1
  %109 = add nuw nsw i32 0, %108
  %110 = mul nuw nsw i32 %102, 100
  %111 = add nuw nsw i32 %109, %110
  %112 = udiv i32 %111, 819200
  %Arg_2.318 = getelementptr inbounds [819200 x [168 x float]], ptr %arg2, i32 0, i32 %111, i32 %106
  %Arg_2.319 = load float, ptr %Arg_2.318, align 4, !invariant.load !98
  %Arg_1.220 = getelementptr inbounds [168 x float], ptr %arg1, i32 0, i32 %98
  %Arg_1.221 = load float, ptr %Arg_1.220, align 4, !invariant.load !98
  %multiply.822 = fmul float %Arg_2.319, %Arg_1.221
  %Arg_0.123 = getelementptr inbounds float, ptr %arg0, i32 %96
  %Arg_0.124 = load float, ptr %Arg_0.123, align 4, !invariant.load !98
  %multiply.925 = fmul float %multiply.822, %Arg_0.124
  store float %multiply.925, ptr %reduction_input_address, align 4
  %113 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11__1(ptr %113, ptr %reduction_input_address, ptr %return_buffer26)
  %114 = load float, ptr %return_buffer26, align 4
  store float %114, ptr %113, align 4
  %115 = udiv i32 %96, 168
  %Arg_3.427 = getelementptr inbounds float, ptr %arg3, i32 %115
  %Arg_3.428 = load float, ptr %Arg_3.427, align 4, !invariant.load !98
  %multiply.1829 = fmul float %multiply.822, %Arg_3.428
  %116 = fneg float %multiply.1829
  store float %116, ptr %reduction_input_address1, align 4
  %117 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_20(ptr %117, ptr %reduction_input_address1, ptr %return_buffer30)
  %118 = load float, ptr %return_buffer30, align 4
  store float %118, ptr %117, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %119 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 0, i32 %32
  %120 = addrspacecast ptr addrspace(3) %119 to ptr
  %121 = load float, ptr %current_output, align 4
  store float %121, ptr %120, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %122 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 0, i32 %lane_id
  %123 = addrspacecast ptr addrspace(3) %122 to ptr
  store float %region_0_26_constant_10, ptr %initial_value_addr, align 4
  %124 = icmp ult i32 %thread_id.x, 1
  %125 = select i1 %124, ptr %123, ptr %initial_value_addr
  %126 = icmp eq i32 %thread_id.x, 0
  br i1 %126, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %127 = mul i32 %thread_id.x, 1
  %128 = add i32 %tile_origin.1, %thread_id.y
  %129 = add i32 %tile_origin.2, %127
  %130 = add i32 %129, 0
  %131 = udiv i32 %128, 1
  %132 = urem i32 %131, 16
  %133 = udiv i32 %128, 16
  %output_element_address = getelementptr inbounds [8192 x [16 x float]], ptr %arg4, i32 0, i32 %133, i32 %132
  %output = load float, ptr %125, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

intra_warp_reduce_write-true61:                   ; preds = %inter_warp_reduce-after
  %134 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 0, i32 %45
  %135 = addrspacecast ptr addrspace(3) %134 to ptr
  %136 = load float, ptr %current_output45, align 4
  store float %136, ptr %135, align 4
  br label %intra_warp_reduce_write-after62

inter_warp_reduce-true63:                         ; preds = %intra_warp_reduce_write-after62
  %137 = getelementptr inbounds [1 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 0, i32 %lane_id
  %138 = addrspacecast ptr addrspace(3) %137 to ptr
  store float %region_0_26_constant_103, ptr %initial_value_addr65, align 4
  %139 = icmp ult i32 %thread_id.x, 1
  %140 = select i1 %139, ptr %138, ptr %initial_value_addr65
  %141 = icmp eq i32 %thread_id.x, 0
  br i1 %141, label %reduction_write_output-true66, label %reduction_write_output-after67

reduction_write_output-after67:                   ; preds = %reduction_write_output-true66, %inter_warp_reduce-true63
  br label %inter_warp_reduce-after64

reduction_write_output-true66:                    ; preds = %inter_warp_reduce-true63
  %142 = mul i32 %thread_id.x, 1
  %143 = add i32 %tile_origin.1, %thread_id.y
  %144 = add i32 %tile_origin.2, %142
  %145 = add i32 %144, 0
  %146 = udiv i32 %143, 1
  %147 = urem i32 %146, 16
  %148 = udiv i32 %143, 16
  %output_element_address68 = getelementptr inbounds [8192 x [16 x float]], ptr %arg5, i32 0, i32 %148, i32 %147
  %output69 = load float, ptr %140, align 4
  store float %output69, ptr %output_element_address68, align 4
  br label %reduction_write_output-after67
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

define void @fusion_84(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 16 dereferenceable(3276800) %arg1, ptr noalias align 16 dereferenceable(3276800) %arg2, ptr noalias align 16 dereferenceable(3276800) %arg3, ptr noalias align 16 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(4) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 128 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 128 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(13107200) %arg10, ptr noalias align 128 dereferenceable(13107200) %arg11, ptr noalias align 128 dereferenceable(131072) %arg12) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after184, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_51_constant_10 = load float, ptr @3, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_51_constant_10, ptr %2, align 4
  %region_0_51_constant_103 = load float, ptr @3, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_51_constant_103, ptr %3, align 4
  %region_0_51_constant_106 = load float, ptr @3, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  store float %region_0_51_constant_106, ptr %4, align 4
  %region_0_51_constant_109 = load float, ptr @3, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  store float %region_0_51_constant_109, ptr %5, align 4
  %region_0_51_constant_1012 = load float, ptr @3, align 4
  %6 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  store float %region_0_51_constant_1012, ptr %6, align 4
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !108
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !113
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
  br label %y_in_tile.loop_header, !llvm.loop !125

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result76 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result76, i32 16, i32 31)
  store float %25, ptr %result_from_other_lane, align 4
  call void @region_1_11__2(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer77)
  %26 = load float, ptr %return_buffer77, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result79 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result79, i32 8, i32 31)
  store float %27, ptr %result_from_other_lane78, align 4
  call void @region_1_11__2(ptr %current_output, ptr %result_from_other_lane78, ptr %return_buffer80)
  %28 = load float, ptr %return_buffer80, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result82 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result82, i32 4, i32 31)
  store float %29, ptr %result_from_other_lane81, align 4
  call void @region_1_11__2(ptr %current_output, ptr %result_from_other_lane81, ptr %return_buffer83)
  %30 = load float, ptr %return_buffer83, align 4
  store float %30, ptr %current_output, align 4
  %partial_reduction_result85 = load float, ptr %current_output, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 2, i32 31)
  store float %31, ptr %result_from_other_lane84, align 4
  call void @region_1_11__2(ptr %current_output, ptr %result_from_other_lane84, ptr %return_buffer86)
  %32 = load float, ptr %return_buffer86, align 4
  store float %32, ptr %current_output, align 4
  %partial_reduction_result88 = load float, ptr %current_output, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 1, i32 31)
  store float %33, ptr %result_from_other_lane87, align 4
  call void @region_1_11__2(ptr %current_output, ptr %result_from_other_lane87, ptr %return_buffer89)
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
  %Arg_1.215 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.116 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  %multiply.9 = fmul float %Arg_1.215, %Arg_0.116
  store float %multiply.9, ptr %reduction_input_address, align 4
  %108 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11__2(ptr %108, ptr %reduction_input_address, ptr %return_buffer)
  %109 = load float, ptr %return_buffer, align 4
  store float %109, ptr %108, align 4
  %Arg_2.3 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg2, i32 0, i32 %107, i32 %104, i32 0
  %Arg_2.317 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
  %Arg_0.118 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !98
  %multiply.18 = fmul float %Arg_2.317, %Arg_0.119
  store float %multiply.18, ptr %reduction_input_address1, align 4
  %110 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_19(ptr %110, ptr %reduction_input_address1, ptr %return_buffer20)
  %111 = load float, ptr %return_buffer20, align 4
  store float %111, ptr %110, align 4
  %Arg_3.4 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg3, i32 0, i32 %107, i32 %104, i32 0
  %Arg_3.421 = load float, ptr %Arg_3.4, align 4, !invariant.load !98
  %Arg_0.122 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.123 = load float, ptr %Arg_0.122, align 4, !invariant.load !98
  %multiply.26 = fmul float %Arg_3.421, %Arg_0.123
  store float %multiply.26, ptr %reduction_input_address4, align 4
  %112 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_27(ptr %112, ptr %reduction_input_address4, ptr %return_buffer24)
  %113 = load float, ptr %return_buffer24, align 4
  store float %113, ptr %112, align 4
  %Arg_4.5 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %107, i32 %104, i32 0
  %Arg_4.525 = load float, ptr %Arg_4.5, align 4, !invariant.load !98
  %Arg_0.126 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.127 = load float, ptr %Arg_0.126, align 4, !invariant.load !98
  %multiply.34 = fmul float %Arg_4.525, %Arg_0.127
  store float %multiply.34, ptr %reduction_input_address7, align 4
  %114 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_35(ptr %114, ptr %reduction_input_address7, ptr %return_buffer28)
  %115 = load float, ptr %return_buffer28, align 4
  store float %115, ptr %114, align 4
  %Arg_0.129 = getelementptr inbounds float, ptr %arg0, i32 %102
  %Arg_0.130 = load float, ptr %Arg_0.129, align 4, !invariant.load !98
  store float %Arg_0.130, ptr %reduction_input_address10, align 4
  %116 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  call void @region_5_45(ptr %116, ptr %reduction_input_address10, ptr %return_buffer31)
  %117 = load float, ptr %return_buffer31, align 4
  store float %117, ptr %116, align 4
  %118 = mul nuw nsw i32 %104, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %106, 100
  %121 = add nuw nsw i32 %119, %120
  %122 = mul nuw nsw i32 %107, 400
  %123 = add nuw nsw i32 %121, %122
  %124 = urem i32 %123, 4
  %125 = udiv i32 %123, 4
  %126 = udiv i32 %125, 819200
  %127 = mul nuw nsw i32 %124, 1
  %128 = add nuw nsw i32 0, %127
  %129 = udiv i32 %128, 4
  %130 = mul nuw nsw i32 %125, 1
  %131 = add nuw nsw i32 0, %130
  %132 = urem i32 %131, 100
  %133 = udiv i32 %131, 100
  %134 = udiv i32 %133, 8192
  %Arg_0.132 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %133, i32 %128, i32 %132
  %Arg_0.133 = load float, ptr %Arg_0.132, align 4, !invariant.load !98
  %135 = mul nuw nsw i32 %104, 1
  %136 = add nuw nsw i32 0, %135
  %137 = mul nuw nsw i32 %106, 100
  %138 = add nuw nsw i32 %136, %137
  %139 = urem i32 %138, 4
  %140 = udiv i32 %138, 4
  %141 = udiv i32 %140, 100
  %142 = mul nuw nsw i32 %107, 1
  %143 = add nuw nsw i32 0, %142
  %144 = udiv i32 %143, 8192
  %Arg_5.6 = load float, ptr %arg5, align 4, !invariant.load !98
  %Arg_0.134 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %143, i32 %139, i32 %140
  %Arg_0.135 = load float, ptr %Arg_0.134, align 4, !invariant.load !98
  %multiply.43 = fmul float %Arg_5.6, %Arg_0.135
  %145 = mul nuw nsw i32 %104, 1
  %146 = add nuw nsw i32 0, %145
  %147 = mul nuw nsw i32 %106, 100
  %148 = add nuw nsw i32 %146, %147
  %149 = mul nuw nsw i32 %107, 400
  %150 = add nuw nsw i32 %148, %149
  %151 = urem i32 %150, 4
  %152 = udiv i32 %150, 4
  %153 = udiv i32 %152, 819200
  %154 = getelementptr inbounds float, ptr %arg10, i32 %102
  store float %Arg_0.133, ptr %154, align 4
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
  %165 = getelementptr inbounds float, ptr %arg11, i32 %102
  store float %multiply.43, ptr %165, align 4
  br label %tile_loop.loop_header, !llvm.loop !126

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
  br label %tile_loop.loop_header37, !llvm.loop !127

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
  %Arg_1.244 = load float, ptr %Arg_1.243, align 4, !invariant.load !98
  %Arg_0.145 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.146 = load float, ptr %Arg_0.145, align 4, !invariant.load !98
  %multiply.947 = fmul float %Arg_1.244, %Arg_0.146
  store float %multiply.947, ptr %reduction_input_address, align 4
  %185 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11__2(ptr %185, ptr %reduction_input_address, ptr %return_buffer48)
  %186 = load float, ptr %return_buffer48, align 4
  store float %186, ptr %185, align 4
  %Arg_2.349 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg2, i32 0, i32 %184, i32 %181, i32 0
  %Arg_2.350 = load float, ptr %Arg_2.349, align 4, !invariant.load !98
  %Arg_0.151 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.152 = load float, ptr %Arg_0.151, align 4, !invariant.load !98
  %multiply.1853 = fmul float %Arg_2.350, %Arg_0.152
  store float %multiply.1853, ptr %reduction_input_address1, align 4
  %187 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_19(ptr %187, ptr %reduction_input_address1, ptr %return_buffer54)
  %188 = load float, ptr %return_buffer54, align 4
  store float %188, ptr %187, align 4
  %Arg_3.455 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg3, i32 0, i32 %184, i32 %181, i32 0
  %Arg_3.456 = load float, ptr %Arg_3.455, align 4, !invariant.load !98
  %Arg_0.157 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.158 = load float, ptr %Arg_0.157, align 4, !invariant.load !98
  %multiply.2659 = fmul float %Arg_3.456, %Arg_0.158
  store float %multiply.2659, ptr %reduction_input_address4, align 4
  %189 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_27(ptr %189, ptr %reduction_input_address4, ptr %return_buffer60)
  %190 = load float, ptr %return_buffer60, align 4
  store float %190, ptr %189, align 4
  %Arg_4.561 = getelementptr inbounds [8192 x [100 x [1 x float]]], ptr %arg4, i32 0, i32 %184, i32 %181, i32 0
  %Arg_4.562 = load float, ptr %Arg_4.561, align 4, !invariant.load !98
  %Arg_0.163 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.164 = load float, ptr %Arg_0.163, align 4, !invariant.load !98
  %multiply.3465 = fmul float %Arg_4.562, %Arg_0.164
  store float %multiply.3465, ptr %reduction_input_address7, align 4
  %191 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_35(ptr %191, ptr %reduction_input_address7, ptr %return_buffer66)
  %192 = load float, ptr %return_buffer66, align 4
  store float %192, ptr %191, align 4
  %Arg_0.167 = getelementptr inbounds float, ptr %arg0, i32 %179
  %Arg_0.168 = load float, ptr %Arg_0.167, align 4, !invariant.load !98
  store float %Arg_0.168, ptr %reduction_input_address10, align 4
  %193 = getelementptr inbounds float, ptr %partial_reduction_result11, i32 0
  call void @region_5_45(ptr %193, ptr %reduction_input_address10, ptr %return_buffer69)
  %194 = load float, ptr %return_buffer69, align 4
  store float %194, ptr %193, align 4
  %195 = mul nuw nsw i32 %181, 1
  %196 = add nuw nsw i32 0, %195
  %197 = mul nuw nsw i32 %183, 100
  %198 = add nuw nsw i32 %196, %197
  %199 = mul nuw nsw i32 %184, 400
  %200 = add nuw nsw i32 %198, %199
  %201 = urem i32 %200, 4
  %202 = udiv i32 %200, 4
  %203 = udiv i32 %202, 819200
  %204 = mul nuw nsw i32 %201, 1
  %205 = add nuw nsw i32 0, %204
  %206 = udiv i32 %205, 4
  %207 = mul nuw nsw i32 %202, 1
  %208 = add nuw nsw i32 0, %207
  %209 = urem i32 %208, 100
  %210 = udiv i32 %208, 100
  %211 = udiv i32 %210, 8192
  %Arg_0.170 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %210, i32 %205, i32 %209
  %Arg_0.171 = load float, ptr %Arg_0.170, align 4, !invariant.load !98
  %212 = mul nuw nsw i32 %181, 1
  %213 = add nuw nsw i32 0, %212
  %214 = mul nuw nsw i32 %183, 100
  %215 = add nuw nsw i32 %213, %214
  %216 = urem i32 %215, 4
  %217 = udiv i32 %215, 4
  %218 = udiv i32 %217, 100
  %219 = mul nuw nsw i32 %184, 1
  %220 = add nuw nsw i32 0, %219
  %221 = udiv i32 %220, 8192
  %Arg_5.672 = load float, ptr %arg5, align 4, !invariant.load !98
  %Arg_0.173 = getelementptr inbounds [8192 x [4 x [100 x float]]], ptr %arg0, i32 0, i32 %220, i32 %216, i32 %217
  %Arg_0.174 = load float, ptr %Arg_0.173, align 4, !invariant.load !98
  %multiply.4375 = fmul float %Arg_5.672, %Arg_0.174
  %222 = mul nuw nsw i32 %181, 1
  %223 = add nuw nsw i32 0, %222
  %224 = mul nuw nsw i32 %183, 100
  %225 = add nuw nsw i32 %223, %224
  %226 = mul nuw nsw i32 %184, 400
  %227 = add nuw nsw i32 %225, %226
  %228 = urem i32 %227, 4
  %229 = udiv i32 %227, 4
  %230 = udiv i32 %229, 819200
  %231 = getelementptr inbounds float, ptr %arg10, i32 %179
  store float %Arg_0.171, ptr %231, align 4
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
  %242 = getelementptr inbounds float, ptr %arg11, i32 %179
  store float %multiply.4375, ptr %242, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %243 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %10, i32 0, i32 %35
  %244 = addrspacecast ptr addrspace(3) %243 to ptr
  %245 = load float, ptr %current_output, align 4
  store float %245, ptr %244, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %246 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %10, i32 0, i32 %lane_id
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
  %258 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %10, i32 0, i32 %48
  %259 = addrspacecast ptr addrspace(3) %258 to ptr
  %260 = load float, ptr %current_output90, align 4
  store float %260, ptr %259, align 4
  br label %intra_warp_reduce_write-after107

inter_warp_reduce-true108:                        ; preds = %intra_warp_reduce_write-after107
  %261 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %10, i32 0, i32 %lane_id
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
  %273 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %10, i32 0, i32 %61
  %274 = addrspacecast ptr addrspace(3) %273 to ptr
  %275 = load float, ptr %current_output115, align 4
  store float %275, ptr %274, align 4
  br label %intra_warp_reduce_write-after132

inter_warp_reduce-true133:                        ; preds = %intra_warp_reduce_write-after132
  %276 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %10, i32 0, i32 %lane_id
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
  %288 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %10, i32 0, i32 %74
  %289 = addrspacecast ptr addrspace(3) %288 to ptr
  %290 = load float, ptr %current_output140, align 4
  store float %290, ptr %289, align 4
  br label %intra_warp_reduce_write-after157

inter_warp_reduce-true158:                        ; preds = %intra_warp_reduce_write-after157
  %291 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %10, i32 0, i32 %lane_id
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
  %303 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %10, i32 0, i32 %87
  %304 = addrspacecast ptr addrspace(3) %303 to ptr
  %305 = load float, ptr %current_output165, align 4
  store float %305, ptr %304, align 4
  br label %intra_warp_reduce_write-after182

inter_warp_reduce-true183:                        ; preds = %intra_warp_reduce_write-after182
  %306 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %10, i32 0, i32 %lane_id
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

define void @fusion_78(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(1024) %arg4, ptr noalias align 128 dereferenceable(1024) %arg5, ptr noalias align 128 dereferenceable(1024) %arg6, ptr noalias align 128 dereferenceable(1024) %arg7) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !128
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
  %region_0_31_constant_6 = load float, ptr @4, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_31_constant_6, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !129
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
  br label %tile_loop.loop_header, !llvm.loop !130

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !131

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %9, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %31 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %32 = load float, ptr %current_output, align 4
  store float %32, ptr %31, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %9, i32 0, i32 %thread_id.y, i32 %thread_id.x
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
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
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
  %region_0_31_constant_620 = load float, ptr @4, align 4
  %82 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 0
  store float %region_0_31_constant_620, ptr %82, align 4
  %83 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %84 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !129
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
  br label %tile_loop.loop_header37, !llvm.loop !132

tile_loop.loop_exit36:                            ; preds = %tile_loop.loop_header37
  br label %y_in_tile.loop_header31, !llvm.loop !133

y_in_tile.loop_exit30:                            ; preds = %y_in_tile.loop_header31
  %shmem_output_address47 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %86, i32 0, i32 %thread_id.x22, i32 %thread_id.y23
  %108 = addrspacecast ptr addrspace(3) %shmem_output_address47 to ptr
  %current_output48 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 0
  %109 = load float, ptr %current_output48, align 4
  store float %109, ptr %108, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr49 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %86, i32 0, i32 %thread_id.y23, i32 %thread_id.x22
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
  %Arg_1.245 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
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
  %region_0_31_constant_671 = load float, ptr @4, align 4
  %159 = getelementptr inbounds float, ptr %partial_reduction_result70, i32 0
  store float %region_0_31_constant_671, ptr %159, align 4
  %160 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %161 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !129
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
  br label %tile_loop.loop_header88, !llvm.loop !134

tile_loop.loop_exit87:                            ; preds = %tile_loop.loop_header88
  br label %y_in_tile.loop_header82, !llvm.loop !135

y_in_tile.loop_exit81:                            ; preds = %y_in_tile.loop_header82
  %shmem_output_address98 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i32 0, i32 %163, i32 0, i32 %thread_id.x73, i32 %thread_id.y74
  %185 = addrspacecast ptr addrspace(3) %shmem_output_address98 to ptr
  %current_output99 = getelementptr inbounds float, ptr %partial_reduction_result70, i32 0
  %186 = load float, ptr %current_output99, align 4
  store float %186, ptr %185, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr100 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache11, i32 0, i32 %163, i32 0, i32 %thread_id.y74, i32 %thread_id.x73
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
  %Arg_2.396 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
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
  %region_0_31_constant_6122 = load float, ptr @4, align 4
  %236 = getelementptr inbounds float, ptr %partial_reduction_result121, i32 0
  store float %region_0_31_constant_6122, ptr %236, align 4
  %237 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %238 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !129
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
  br label %tile_loop.loop_header139, !llvm.loop !136

tile_loop.loop_exit138:                           ; preds = %tile_loop.loop_header139
  br label %y_in_tile.loop_header133, !llvm.loop !137

y_in_tile.loop_exit132:                           ; preds = %y_in_tile.loop_header133
  %shmem_output_address149 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %240, i32 0, i32 %thread_id.x124, i32 %thread_id.y125
  %262 = addrspacecast ptr addrspace(3) %shmem_output_address149 to ptr
  %current_output150 = getelementptr inbounds float, ptr %partial_reduction_result121, i32 0
  %263 = load float, ptr %current_output150, align 4
  store float %263, ptr %262, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr151 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache12, i32 0, i32 %240, i32 0, i32 %thread_id.y125, i32 %thread_id.x124
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
  %Arg_3.4147 = load float, ptr %Arg_3.4, align 4, !invariant.load !98
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

define void @fusion_77(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(1024) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 128 dereferenceable(1024) %arg4, ptr noalias align 16 dereferenceable(16) %arg5, ptr noalias align 128 dereferenceable(1024) %arg6, ptr noalias align 16 dereferenceable(16) %arg7, ptr noalias align 128 dereferenceable(1024) %arg8, ptr noalias align 128 dereferenceable(16) %arg9, ptr noalias align 128 dereferenceable(16) %arg10, ptr noalias align 128 dereferenceable(16) %arg11, ptr noalias align 128 dereferenceable(16) %arg12) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !128
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index, 4
  %6 = icmp ult i32 %linear_index, 4
  br i1 %6, label %fusion_77.in_bounds-true, label %fusion_77.in_bounds-after

fusion_77.in_bounds-after:                        ; preds = %reduce.40.inner.loop_exit.reduction_dim.0, %entry
  ret void

fusion_77.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %region_0_45_constant_11 = load float, ptr @5, align 4
  store float %region_0_45_constant_11, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.16.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.16.inner.loop_header.reduction_dim.0

reduce.16.inner.loop_header.reduction_dim.0:      ; preds = %reduce.16.inner.loop_body.reduction_dim.0, %fusion_77.in_bounds-true
  %reduce.16.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.16.inner.invar_address.reduction_dim.0, align 4
  %10 = icmp uge i32 %reduce.16.inner.indvar.reduction_dim.0, 64
  br i1 %10, label %reduce.16.inner.loop_exit.reduction_dim.0, label %reduce.16.inner.loop_body.reduction_dim.0

reduce.16.inner.loop_body.reduction_dim.0:        ; preds = %reduce.16.inner.loop_header.reduction_dim.0
  %11 = load float, ptr %accumulator_0, align 4
  %12 = getelementptr inbounds [64 x [4 x float]], ptr %arg1, i32 0, i32 %reduce.16.inner.indvar.reduction_dim.0, i32 %4
  %13 = load float, ptr %12, align 4, !invariant.load !98
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
  %18 = load float, ptr %17, align 4, !invariant.load !98
  %19 = load float, ptr %arg2, align 4, !invariant.load !98
  %region_0_45_constant_113 = load float, ptr @5, align 4
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
  %23 = load float, ptr %22, align 4, !invariant.load !98
  store float %21, ptr %parameter_buffer5, align 4
  store float %23, ptr %parameter_buffer6, align 4
  call void @region_2_20__1(ptr %parameter_buffer5, ptr %parameter_buffer6, ptr %return_buffer7)
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
  %28 = load float, ptr %27, align 4, !invariant.load !98
  %29 = load float, ptr %arg2, align 4, !invariant.load !98
  %region_0_45_constant_119 = load float, ptr @5, align 4
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
  %33 = load float, ptr %32, align 4, !invariant.load !98
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
  %38 = load float, ptr %37, align 4, !invariant.load !98
  %39 = load float, ptr %arg2, align 4, !invariant.load !98
  %region_0_45_constant_1115 = load float, ptr @5, align 4
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
  %43 = load float, ptr %42, align 4, !invariant.load !98
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
  br label %fusion_77.in_bounds-after
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

define internal void @region_2_20__1(ptr dereferenceable(4) %Arg_0.21.typed, ptr dereferenceable(4) %Arg_1.22.typed, ptr dereferenceable(4) %output_arg) {
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

define void @fusion_91(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(1024) %arg1) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_9_constant_3 = load float, ptr @6, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_9_constant_3, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !129
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
  br label %tile_loop.loop_header, !llvm.loop !138

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !139

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i32 0, i32 %6, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %28 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %29 = load float, ptr %current_output, align 4
  store float %29, ptr %28, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache13, i32 0, i32 %6, i32 0, i32 %thread_id.y, i32 %thread_id.x
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
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
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

define void @fusion_90(ptr noalias align 16 dereferenceable(16) %arg0, ptr noalias align 128 dereferenceable(1024) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(16) %arg3) {
entry:
  %return_buffer = alloca float, align 4
  %parameter_buffer1 = alloca float, align 4
  %parameter_buffer = alloca float, align 4
  %reduce.10.inner.invar_address.reduction_dim.0 = alloca i32, align 4
  %accumulator_0 = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !128
  %2 = mul nuw nsw i32 %0, 4
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 4
  br i1 %4, label %fusion_90.in_bounds-true, label %fusion_90.in_bounds-after

fusion_90.in_bounds-after:                        ; preds = %reduce.10.inner.loop_exit.reduction_dim.0, %entry
  ret void

fusion_90.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !98
  %7 = load float, ptr %arg2, align 4, !invariant.load !98
  %region_0_13_constant_5 = load float, ptr @7, align 4
  store float %region_0_13_constant_5, ptr %accumulator_0, align 4
  store i32 0, ptr %reduce.10.inner.invar_address.reduction_dim.0, align 4
  br label %reduce.10.inner.loop_header.reduction_dim.0

reduce.10.inner.loop_header.reduction_dim.0:      ; preds = %reduce.10.inner.loop_body.reduction_dim.0, %fusion_90.in_bounds-true
  %reduce.10.inner.indvar.reduction_dim.0 = load i32, ptr %reduce.10.inner.invar_address.reduction_dim.0, align 4
  %8 = icmp uge i32 %reduce.10.inner.indvar.reduction_dim.0, 64
  br i1 %8, label %reduce.10.inner.loop_exit.reduction_dim.0, label %reduce.10.inner.loop_body.reduction_dim.0

reduce.10.inner.loop_body.reduction_dim.0:        ; preds = %reduce.10.inner.loop_header.reduction_dim.0
  %9 = load float, ptr %accumulator_0, align 4
  %10 = getelementptr inbounds [64 x [4 x float]], ptr %arg1, i32 0, i32 %reduce.10.inner.indvar.reduction_dim.0, i32 %3
  %11 = load float, ptr %10, align 4, !invariant.load !98
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
  br label %fusion_90.in_bounds-after
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

define void @fusion_86(ptr noalias align 128 dereferenceable(13107200) %arg0, ptr noalias align 16 dereferenceable(16) %arg1, ptr noalias align 16 dereferenceable(16) %arg2, ptr noalias align 16 dereferenceable(16) %arg3, ptr noalias align 16 dereferenceable(16) %arg4, ptr noalias align 128 dereferenceable(3276800) %arg5, ptr noalias align 128 dereferenceable(3276800) %arg6, ptr noalias align 128 dereferenceable(3276800) %arg7, ptr noalias align 128 dereferenceable(3276800) %arg8) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after92, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_40_constant_9 = load float, ptr @8, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_40_constant_9, ptr %2, align 4
  %region_0_40_constant_93 = load float, ptr @8, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_40_constant_93, ptr %3, align 4
  %region_0_40_constant_96 = load float, ptr @8, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  store float %region_0_40_constant_96, ptr %4, align 4
  %region_0_40_constant_99 = load float, ptr @8, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  store float %region_0_40_constant_99, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !108
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !140
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
  br label %y_in_tile.loop_header, !llvm.loop !141

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
  %Arg_0.112 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  %Arg_1.2 = getelementptr inbounds [1 x [4 x float]], ptr %arg1, i32 0, i32 0, i32 %58
  %Arg_1.213 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %multiply.8 = fmul float %Arg_0.112, %Arg_1.213
  store float %multiply.8, ptr %reduction_input_address, align 4
  %59 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10(ptr %59, ptr %reduction_input_address, ptr %return_buffer)
  %60 = load float, ptr %return_buffer, align 4
  store float %60, ptr %59, align 4
  %Arg_0.114 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %57, i32 %58
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !98
  %Arg_2.3 = getelementptr inbounds [1 x [4 x float]], ptr %arg2, i32 0, i32 0, i32 %58
  %Arg_2.316 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
  %multiply.17 = fmul float %Arg_0.115, %Arg_2.316
  store float %multiply.17, ptr %reduction_input_address1, align 4
  %61 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_18(ptr %61, ptr %reduction_input_address1, ptr %return_buffer17)
  %62 = load float, ptr %return_buffer17, align 4
  store float %62, ptr %61, align 4
  %Arg_0.118 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %57, i32 %58
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !98
  %Arg_3.4 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %58
  %Arg_3.420 = load float, ptr %Arg_3.4, align 4, !invariant.load !98
  %multiply.25 = fmul float %Arg_0.119, %Arg_3.420
  store float %multiply.25, ptr %reduction_input_address4, align 4
  %63 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_26(ptr %63, ptr %reduction_input_address4, ptr %return_buffer21)
  %64 = load float, ptr %return_buffer21, align 4
  store float %64, ptr %63, align 4
  %Arg_0.122 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %57, i32 %58
  %Arg_0.123 = load float, ptr %Arg_0.122, align 4, !invariant.load !98
  %Arg_4.5 = getelementptr inbounds [1 x [4 x float]], ptr %arg4, i32 0, i32 0, i32 %58
  %Arg_4.524 = load float, ptr %Arg_4.5, align 4, !invariant.load !98
  %multiply.33 = fmul float %Arg_0.123, %Arg_4.524
  store float %multiply.33, ptr %reduction_input_address7, align 4
  %65 = getelementptr inbounds float, ptr %partial_reduction_result8, i32 0
  call void @region_4_34(ptr %65, ptr %reduction_input_address7, ptr %return_buffer25)
  %66 = load float, ptr %return_buffer25, align 4
  store float %66, ptr %65, align 4
  br label %tile_loop.loop_header, !llvm.loop !142

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
  br label %tile_loop.loop_header27, !llvm.loop !143

tile_loop.loop_exit26:                            ; preds = %tile_loop.loop_header27
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body28
  %Arg_0.133 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %72, i32 %73
  %Arg_0.134 = load float, ptr %Arg_0.133, align 4, !invariant.load !98
  %Arg_1.235 = getelementptr inbounds [1 x [4 x float]], ptr %arg1, i32 0, i32 0, i32 %73
  %Arg_1.236 = load float, ptr %Arg_1.235, align 4, !invariant.load !98
  %multiply.837 = fmul float %Arg_0.134, %Arg_1.236
  store float %multiply.837, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_10(ptr %75, ptr %reduction_input_address, ptr %return_buffer38)
  %76 = load float, ptr %return_buffer38, align 4
  store float %76, ptr %75, align 4
  %Arg_0.139 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %72, i32 %73
  %Arg_0.140 = load float, ptr %Arg_0.139, align 4, !invariant.load !98
  %Arg_2.341 = getelementptr inbounds [1 x [4 x float]], ptr %arg2, i32 0, i32 0, i32 %73
  %Arg_2.342 = load float, ptr %Arg_2.341, align 4, !invariant.load !98
  %multiply.1743 = fmul float %Arg_0.140, %Arg_2.342
  store float %multiply.1743, ptr %reduction_input_address1, align 4
  %77 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  call void @region_2_18(ptr %77, ptr %reduction_input_address1, ptr %return_buffer44)
  %78 = load float, ptr %return_buffer44, align 4
  store float %78, ptr %77, align 4
  %Arg_0.145 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %72, i32 %73
  %Arg_0.146 = load float, ptr %Arg_0.145, align 4, !invariant.load !98
  %Arg_3.447 = getelementptr inbounds [1 x [4 x float]], ptr %arg3, i32 0, i32 0, i32 %73
  %Arg_3.448 = load float, ptr %Arg_3.447, align 4, !invariant.load !98
  %multiply.2549 = fmul float %Arg_0.146, %Arg_3.448
  store float %multiply.2549, ptr %reduction_input_address4, align 4
  %79 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  call void @region_3_26(ptr %79, ptr %reduction_input_address4, ptr %return_buffer50)
  %80 = load float, ptr %return_buffer50, align 4
  store float %80, ptr %79, align 4
  %Arg_0.151 = getelementptr inbounds [819200 x [4 x float]], ptr %arg0, i32 0, i32 %72, i32 %73
  %Arg_0.152 = load float, ptr %Arg_0.151, align 4, !invariant.load !98
  %Arg_4.553 = getelementptr inbounds [1 x [4 x float]], ptr %arg4, i32 0, i32 0, i32 %73
  %Arg_4.554 = load float, ptr %Arg_4.553, align 4, !invariant.load !98
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

define void @fusion_85(ptr noalias align 16 dereferenceable(3276800) %arg0, ptr noalias align 128 dereferenceable(3276800) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(3276800) %arg3, ptr noalias align 128 dereferenceable(3276800) %arg4, ptr noalias align 16 dereferenceable(3276800) %arg5, ptr noalias align 128 dereferenceable(3276800) %arg6, ptr noalias align 16 dereferenceable(3276800) %arg7, ptr noalias align 128 dereferenceable(3276800) %arg8, ptr noalias align 128 dereferenceable(3276800) %arg9, ptr noalias align 128 dereferenceable(3276800) %arg10, ptr noalias align 128 dereferenceable(3276800) %arg11, ptr noalias align 128 dereferenceable(3276800) %arg12) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !144
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
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
  br i1 %23, label %fusion_85.in_bounds-true, label %fusion_85.in_bounds-after

fusion_85.in_bounds-after:                        ; preds = %fusion_85.in_bounds-true, %entry
  ret void

fusion_85.in_bounds-true:                         ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !98
  %26 = mul nuw nsw i32 %4, 1
  %27 = add nuw nsw i32 0, %26
  %28 = mul nuw nsw i32 %6, 1
  %29 = add nuw nsw i32 0, %28
  %30 = mul nuw nsw i32 %7, 100
  %31 = add nuw nsw i32 %29, %30
  %32 = udiv i32 %31, 819200
  %33 = load float, ptr %arg2, align 4, !invariant.load !98
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %35 = load float, ptr %34, align 4, !invariant.load !98
  %multiply.11 = fmul float %33, %35
  %subtract.13 = fsub float %25, %multiply.11
  %36 = insertvalue { float, float, float, float } undef, float %subtract.13, 0
  %37 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %38 = load float, ptr %37, align 4, !invariant.load !98
  %39 = mul nuw nsw i32 %4, 1
  %40 = add nuw nsw i32 0, %39
  %41 = mul nuw nsw i32 %6, 1
  %42 = add nuw nsw i32 0, %41
  %43 = mul nuw nsw i32 %7, 100
  %44 = add nuw nsw i32 %42, %43
  %45 = udiv i32 %44, 819200
  %46 = load float, ptr %arg2, align 4, !invariant.load !98
  %47 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %48 = load float, ptr %47, align 4, !invariant.load !98
  %multiply.14 = fmul float %46, %48
  %subtract.16 = fsub float %38, %multiply.14
  %49 = insertvalue { float, float, float, float } %36, float %subtract.16, 1
  %50 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %51 = load float, ptr %50, align 4, !invariant.load !98
  %52 = mul nuw nsw i32 %4, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %6, 1
  %55 = add nuw nsw i32 0, %54
  %56 = mul nuw nsw i32 %7, 100
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 819200
  %59 = load float, ptr %arg2, align 4, !invariant.load !98
  %60 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %61 = load float, ptr %60, align 4, !invariant.load !98
  %multiply.17 = fmul float %59, %61
  %subtract.19 = fsub float %51, %multiply.17
  %62 = insertvalue { float, float, float, float } %49, float %subtract.19, 2
  %63 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %64 = load float, ptr %63, align 4, !invariant.load !98
  %65 = mul nuw nsw i32 %4, 1
  %66 = add nuw nsw i32 0, %65
  %67 = mul nuw nsw i32 %6, 1
  %68 = add nuw nsw i32 0, %67
  %69 = mul nuw nsw i32 %7, 100
  %70 = add nuw nsw i32 %68, %69
  %71 = udiv i32 %70, 819200
  %72 = load float, ptr %arg2, align 4, !invariant.load !98
  %73 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  %74 = load float, ptr %73, align 4, !invariant.load !98
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
  %85 = load float, ptr %84, align 4, !invariant.load !98
  %86 = mul nuw nsw i32 %9, 1
  %87 = add nuw nsw i32 0, %86
  %88 = mul nuw nsw i32 %11, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %12, 100
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 819200
  %93 = load float, ptr %arg2, align 4, !invariant.load !98
  %94 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %95 = load float, ptr %94, align 4, !invariant.load !98
  %multiply.111 = fmul float %93, %95
  %subtract.132 = fsub float %85, %multiply.111
  %96 = insertvalue { float, float, float, float } undef, float %subtract.132, 0
  %97 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %98 = load float, ptr %97, align 4, !invariant.load !98
  %99 = mul nuw nsw i32 %9, 1
  %100 = add nuw nsw i32 0, %99
  %101 = mul nuw nsw i32 %11, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %12, 100
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 819200
  %106 = load float, ptr %arg2, align 4, !invariant.load !98
  %107 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %108 = load float, ptr %107, align 4, !invariant.load !98
  %multiply.143 = fmul float %106, %108
  %subtract.164 = fsub float %98, %multiply.143
  %109 = insertvalue { float, float, float, float } %96, float %subtract.164, 1
  %110 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %111 = load float, ptr %110, align 4, !invariant.load !98
  %112 = mul nuw nsw i32 %9, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %11, 1
  %115 = add nuw nsw i32 0, %114
  %116 = mul nuw nsw i32 %12, 100
  %117 = add nuw nsw i32 %115, %116
  %118 = udiv i32 %117, 819200
  %119 = load float, ptr %arg2, align 4, !invariant.load !98
  %120 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %121 = load float, ptr %120, align 4, !invariant.load !98
  %multiply.175 = fmul float %119, %121
  %subtract.196 = fsub float %111, %multiply.175
  %122 = insertvalue { float, float, float, float } %109, float %subtract.196, 2
  %123 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %124 = load float, ptr %123, align 4, !invariant.load !98
  %125 = mul nuw nsw i32 %9, 1
  %126 = add nuw nsw i32 0, %125
  %127 = mul nuw nsw i32 %11, 1
  %128 = add nuw nsw i32 0, %127
  %129 = mul nuw nsw i32 %12, 100
  %130 = add nuw nsw i32 %128, %129
  %131 = udiv i32 %130, 819200
  %132 = load float, ptr %arg2, align 4, !invariant.load !98
  %133 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  %134 = load float, ptr %133, align 4, !invariant.load !98
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
  %145 = load float, ptr %144, align 4, !invariant.load !98
  %146 = mul nuw nsw i32 %14, 1
  %147 = add nuw nsw i32 0, %146
  %148 = mul nuw nsw i32 %16, 1
  %149 = add nuw nsw i32 0, %148
  %150 = mul nuw nsw i32 %17, 100
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 819200
  %153 = load float, ptr %arg2, align 4, !invariant.load !98
  %154 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %155 = load float, ptr %154, align 4, !invariant.load !98
  %multiply.119 = fmul float %153, %155
  %subtract.1310 = fsub float %145, %multiply.119
  %156 = insertvalue { float, float, float, float } undef, float %subtract.1310, 0
  %157 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %158 = load float, ptr %157, align 4, !invariant.load !98
  %159 = mul nuw nsw i32 %14, 1
  %160 = add nuw nsw i32 0, %159
  %161 = mul nuw nsw i32 %16, 1
  %162 = add nuw nsw i32 0, %161
  %163 = mul nuw nsw i32 %17, 100
  %164 = add nuw nsw i32 %162, %163
  %165 = udiv i32 %164, 819200
  %166 = load float, ptr %arg2, align 4, !invariant.load !98
  %167 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %168 = load float, ptr %167, align 4, !invariant.load !98
  %multiply.1411 = fmul float %166, %168
  %subtract.1612 = fsub float %158, %multiply.1411
  %169 = insertvalue { float, float, float, float } %156, float %subtract.1612, 1
  %170 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %171 = load float, ptr %170, align 4, !invariant.load !98
  %172 = mul nuw nsw i32 %14, 1
  %173 = add nuw nsw i32 0, %172
  %174 = mul nuw nsw i32 %16, 1
  %175 = add nuw nsw i32 0, %174
  %176 = mul nuw nsw i32 %17, 100
  %177 = add nuw nsw i32 %175, %176
  %178 = udiv i32 %177, 819200
  %179 = load float, ptr %arg2, align 4, !invariant.load !98
  %180 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %181 = load float, ptr %180, align 4, !invariant.load !98
  %multiply.1713 = fmul float %179, %181
  %subtract.1914 = fsub float %171, %multiply.1713
  %182 = insertvalue { float, float, float, float } %169, float %subtract.1914, 2
  %183 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %184 = load float, ptr %183, align 4, !invariant.load !98
  %185 = mul nuw nsw i32 %14, 1
  %186 = add nuw nsw i32 0, %185
  %187 = mul nuw nsw i32 %16, 1
  %188 = add nuw nsw i32 0, %187
  %189 = mul nuw nsw i32 %17, 100
  %190 = add nuw nsw i32 %188, %189
  %191 = udiv i32 %190, 819200
  %192 = load float, ptr %arg2, align 4, !invariant.load !98
  %193 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  %194 = load float, ptr %193, align 4, !invariant.load !98
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
  %205 = load float, ptr %204, align 4, !invariant.load !98
  %206 = mul nuw nsw i32 %19, 1
  %207 = add nuw nsw i32 0, %206
  %208 = mul nuw nsw i32 %21, 1
  %209 = add nuw nsw i32 0, %208
  %210 = mul nuw nsw i32 %22, 100
  %211 = add nuw nsw i32 %209, %210
  %212 = udiv i32 %211, 819200
  %213 = load float, ptr %arg2, align 4, !invariant.load !98
  %214 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %215 = load float, ptr %214, align 4, !invariant.load !98
  %multiply.1117 = fmul float %213, %215
  %subtract.1318 = fsub float %205, %multiply.1117
  %216 = insertvalue { float, float, float, float } undef, float %subtract.1318, 0
  %217 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %218 = load float, ptr %217, align 4, !invariant.load !98
  %219 = mul nuw nsw i32 %19, 1
  %220 = add nuw nsw i32 0, %219
  %221 = mul nuw nsw i32 %21, 1
  %222 = add nuw nsw i32 0, %221
  %223 = mul nuw nsw i32 %22, 100
  %224 = add nuw nsw i32 %222, %223
  %225 = udiv i32 %224, 819200
  %226 = load float, ptr %arg2, align 4, !invariant.load !98
  %227 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %228 = load float, ptr %227, align 4, !invariant.load !98
  %multiply.1419 = fmul float %226, %228
  %subtract.1620 = fsub float %218, %multiply.1419
  %229 = insertvalue { float, float, float, float } %216, float %subtract.1620, 1
  %230 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %231 = load float, ptr %230, align 4, !invariant.load !98
  %232 = mul nuw nsw i32 %19, 1
  %233 = add nuw nsw i32 0, %232
  %234 = mul nuw nsw i32 %21, 1
  %235 = add nuw nsw i32 0, %234
  %236 = mul nuw nsw i32 %22, 100
  %237 = add nuw nsw i32 %235, %236
  %238 = udiv i32 %237, 819200
  %239 = load float, ptr %arg2, align 4, !invariant.load !98
  %240 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %241 = load float, ptr %240, align 4, !invariant.load !98
  %multiply.1721 = fmul float %239, %241
  %subtract.1922 = fsub float %231, %multiply.1721
  %242 = insertvalue { float, float, float, float } %229, float %subtract.1922, 2
  %243 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %244 = load float, ptr %243, align 4, !invariant.load !98
  %245 = mul nuw nsw i32 %19, 1
  %246 = add nuw nsw i32 0, %245
  %247 = mul nuw nsw i32 %21, 1
  %248 = add nuw nsw i32 0, %247
  %249 = mul nuw nsw i32 %22, 100
  %250 = add nuw nsw i32 %248, %249
  %251 = udiv i32 %250, 819200
  %252 = load float, ptr %arg2, align 4, !invariant.load !98
  %253 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  %254 = load float, ptr %253, align 4, !invariant.load !98
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
  br label %fusion_85.in_bounds-after
}

define void @fusion_48(ptr noalias align 16 dereferenceable(524288) %arg0, ptr noalias align 16 dereferenceable(672) %arg1, ptr noalias align 128 dereferenceable(550502400) %arg2, ptr noalias align 128 dereferenceable(524288) %arg3, ptr noalias align 16 dereferenceable(88080384) %arg4, ptr noalias align 16 dereferenceable(524288) %arg5, ptr noalias align 128 dereferenceable(524288) %arg6, ptr noalias align 16 dereferenceable(88080384) %arg7, ptr noalias align 128 dereferenceable(172032) %arg8, ptr noalias align 128 dereferenceable(88080384) %arg9, ptr noalias align 128 dereferenceable(172032) %arg10, ptr noalias align 128 dereferenceable(172032) %arg11) {
entry:
  %return_buffer120 = alloca float, align 4
  %result_from_other_lane118 = alloca float, align 4
  %return_buffer117 = alloca float, align 4
  %result_from_other_lane115 = alloca float, align 4
  %return_buffer114 = alloca float, align 4
  %result_from_other_lane112 = alloca float, align 4
  %return_buffer111 = alloca float, align 4
  %result_from_other_lane109 = alloca float, align 4
  %return_buffer108 = alloca float, align 4
  %result_from_other_lane106 = alloca float, align 4
  %return_buffer98 = alloca float, align 4
  %result_from_other_lane96 = alloca float, align 4
  %return_buffer95 = alloca float, align 4
  %result_from_other_lane93 = alloca float, align 4
  %return_buffer92 = alloca float, align 4
  %result_from_other_lane90 = alloca float, align 4
  %return_buffer89 = alloca float, align 4
  %result_from_other_lane87 = alloca float, align 4
  %return_buffer86 = alloca float, align 4
  %result_from_other_lane84 = alloca float, align 4
  %return_buffer80 = alloca float, align 4
  %result_from_other_lane78 = alloca float, align 4
  %return_buffer77 = alloca float, align 4
  %result_from_other_lane75 = alloca float, align 4
  %return_buffer74 = alloca float, align 4
  %result_from_other_lane72 = alloca float, align 4
  %return_buffer71 = alloca float, align 4
  %result_from_other_lane69 = alloca float, align 4
  %return_buffer68 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %return_buffer25 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result5 = alloca float, align 4
  %reduction_input_address4 = alloca float, align 4
  %partial_reduction_result2 = alloca float, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after122, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_61_constant_41 = load float, ptr @12, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_61_constant_41, ptr %2, align 4
  %region_0_61_constant_413 = load float, ptr @12, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_61_constant_413, ptr %3, align 4
  %region_0_61_constant_416 = load float, ptr @12, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  store float %region_0_61_constant_416, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !145
  %7 = urem i32 %5, 1024
  %8 = udiv i32 %5, 1024
  %9 = mul i32 %6, 1
  %10 = add i32 %9, %8
  %11 = icmp ult i32 %10, 1536
  br i1 %11, label %12, label %early_return

12:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %7, 32
  %thread_id.y = udiv i32 %7, 32
  %lane_id = urem i32 %7, 32
  %13 = udiv i32 %10, 1
  %14 = urem i32 %13, 6
  %15 = udiv i32 %10, 6
  %16 = urem i32 %15, 1
  %17 = udiv i32 %10, 6
  %18 = icmp eq i32 %16, 0
  %tile_bound = select i1 %18, i32 512, i32 4096
  %19 = icmp eq i32 %14, 5
  %tile_bound7 = select i1 %19, i32 8, i32 32
  %tile_origin.0 = mul i32 %17, 1
  %tile_origin.1 = mul i32 %16, 4096
  %tile_origin.2 = mul i32 %14, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %12
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %20 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %20, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %21 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %22 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %23 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %23, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc8 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc8, ptr %tile_loop.invar_address, align 4
  %24 = icmp eq i32 %tile_loop.indvar, 0
  %25 = mul i32 %tile_loop.indvar, 1
  %26 = add i32 %25, 0
  %x_loc = add i32 %26, %22
  %27 = add i32 %tile_origin.1, %y_in_tile.indvar
  %28 = add i32 %tile_origin.2, %x_loc
  %29 = icmp ult i32 %x_loc, %tile_bound7
  br i1 %29, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !146

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !147

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %30 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %31 = load float, ptr %current_output, align 4
  store float %31, ptr %30, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache14, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %32 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result67 = load float, ptr %32, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result67, i32 16, i32 31)
  store float %33, ptr %result_from_other_lane, align 4
  call void @region_1_42(ptr %32, ptr %result_from_other_lane, ptr %return_buffer68)
  %34 = load float, ptr %return_buffer68, align 4
  store float %34, ptr %32, align 4
  %partial_reduction_result70 = load float, ptr %32, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result70, i32 8, i32 31)
  store float %35, ptr %result_from_other_lane69, align 4
  call void @region_1_42(ptr %32, ptr %result_from_other_lane69, ptr %return_buffer71)
  %36 = load float, ptr %return_buffer71, align 4
  store float %36, ptr %32, align 4
  %partial_reduction_result73 = load float, ptr %32, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result73, i32 4, i32 31)
  store float %37, ptr %result_from_other_lane72, align 4
  call void @region_1_42(ptr %32, ptr %result_from_other_lane72, ptr %return_buffer74)
  %38 = load float, ptr %return_buffer74, align 4
  store float %38, ptr %32, align 4
  %partial_reduction_result76 = load float, ptr %32, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result76, i32 2, i32 31)
  store float %39, ptr %result_from_other_lane75, align 4
  call void @region_1_42(ptr %32, ptr %result_from_other_lane75, ptr %return_buffer77)
  %40 = load float, ptr %return_buffer77, align 4
  store float %40, ptr %32, align 4
  %partial_reduction_result79 = load float, ptr %32, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result79, i32 1, i32 31)
  store float %41, ptr %result_from_other_lane78, align 4
  call void @region_1_42(ptr %32, ptr %result_from_other_lane78, ptr %return_buffer80)
  %42 = load float, ptr %return_buffer80, align 4
  store float %42, ptr %32, align 4
  %43 = icmp ult i32 %thread_id.x, %tile_bound
  %44 = mul i32 %thread_id.y, 1
  %45 = icmp ult i32 %44, %tile_bound7
  %46 = and i1 %45, %43
  %47 = icmp eq i32 %lane_id, 0
  %48 = and i1 %46, %47
  br i1 %48, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address81 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %49 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %50 = load float, ptr %current_output82, align 4
  store float %50, ptr %49, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache15, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %51 = addrspacecast ptr addrspace(3) %shmem_transposed_addr83 to ptr
  %partial_reduction_result85 = load float, ptr %51, align 4
  %52 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  store float %52, ptr %result_from_other_lane84, align 4
  call void @region_2_48(ptr %51, ptr %result_from_other_lane84, ptr %return_buffer86)
  %53 = load float, ptr %return_buffer86, align 4
  store float %53, ptr %51, align 4
  %partial_reduction_result88 = load float, ptr %51, align 4
  %54 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 8, i32 31)
  store float %54, ptr %result_from_other_lane87, align 4
  call void @region_2_48(ptr %51, ptr %result_from_other_lane87, ptr %return_buffer89)
  %55 = load float, ptr %return_buffer89, align 4
  store float %55, ptr %51, align 4
  %partial_reduction_result91 = load float, ptr %51, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result91, i32 4, i32 31)
  store float %56, ptr %result_from_other_lane90, align 4
  call void @region_2_48(ptr %51, ptr %result_from_other_lane90, ptr %return_buffer92)
  %57 = load float, ptr %return_buffer92, align 4
  store float %57, ptr %51, align 4
  %partial_reduction_result94 = load float, ptr %51, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result94, i32 2, i32 31)
  store float %58, ptr %result_from_other_lane93, align 4
  call void @region_2_48(ptr %51, ptr %result_from_other_lane93, ptr %return_buffer95)
  %59 = load float, ptr %return_buffer95, align 4
  store float %59, ptr %51, align 4
  %partial_reduction_result97 = load float, ptr %51, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result97, i32 1, i32 31)
  store float %60, ptr %result_from_other_lane96, align 4
  call void @region_2_48(ptr %51, ptr %result_from_other_lane96, ptr %return_buffer98)
  %61 = load float, ptr %return_buffer98, align 4
  store float %61, ptr %51, align 4
  %62 = icmp ult i32 %thread_id.x, %tile_bound
  %63 = mul i32 %thread_id.y, 1
  %64 = icmp ult i32 %63, %tile_bound7
  %65 = and i1 %64, %62
  %66 = icmp eq i32 %lane_id, 0
  %67 = and i1 %65, %66
  br i1 %67, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %reduction_write_output-after
  %shmem_output_address103 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache16, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %68 = addrspacecast ptr addrspace(3) %shmem_output_address103 to ptr
  %current_output104 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 0
  %69 = load float, ptr %current_output104, align 4
  store float %69, ptr %68, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache16, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %70 = addrspacecast ptr addrspace(3) %shmem_transposed_addr105 to ptr
  %partial_reduction_result107 = load float, ptr %70, align 4
  %71 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  store float %71, ptr %result_from_other_lane106, align 4
  call void @region_3_55(ptr %70, ptr %result_from_other_lane106, ptr %return_buffer108)
  %72 = load float, ptr %return_buffer108, align 4
  store float %72, ptr %70, align 4
  %partial_reduction_result110 = load float, ptr %70, align 4
  %73 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result110, i32 8, i32 31)
  store float %73, ptr %result_from_other_lane109, align 4
  call void @region_3_55(ptr %70, ptr %result_from_other_lane109, ptr %return_buffer111)
  %74 = load float, ptr %return_buffer111, align 4
  store float %74, ptr %70, align 4
  %partial_reduction_result113 = load float, ptr %70, align 4
  %75 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result113, i32 4, i32 31)
  store float %75, ptr %result_from_other_lane112, align 4
  call void @region_3_55(ptr %70, ptr %result_from_other_lane112, ptr %return_buffer114)
  %76 = load float, ptr %return_buffer114, align 4
  store float %76, ptr %70, align 4
  %partial_reduction_result116 = load float, ptr %70, align 4
  %77 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result116, i32 2, i32 31)
  store float %77, ptr %result_from_other_lane115, align 4
  call void @region_3_55(ptr %70, ptr %result_from_other_lane115, ptr %return_buffer117)
  %78 = load float, ptr %return_buffer117, align 4
  store float %78, ptr %70, align 4
  %partial_reduction_result119 = load float, ptr %70, align 4
  %79 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result119, i32 1, i32 31)
  store float %79, ptr %result_from_other_lane118, align 4
  call void @region_3_55(ptr %70, ptr %result_from_other_lane118, ptr %return_buffer120)
  %80 = load float, ptr %return_buffer120, align 4
  store float %80, ptr %70, align 4
  %81 = icmp ult i32 %thread_id.x, %tile_bound
  %82 = mul i32 %thread_id.y, 1
  %83 = icmp ult i32 %82, %tile_bound7
  %84 = and i1 %83, %81
  %85 = icmp eq i32 %lane_id, 0
  %86 = and i1 %84, %85
  br i1 %86, label %reduction_write_output-true121, label %reduction_write_output-after122

reduction_write_output-after122:                  ; preds = %reduction_write_output-true121, %reduction_write_output-after100
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %87 = mul nuw nsw i32 %28, 1
  %88 = add nuw nsw i32 0, %87
  %89 = mul nuw nsw i32 %27, 168
  %90 = add nuw nsw i32 %88, %89
  %91 = mul nuw nsw i32 %tile_origin.0, 86016
  %92 = add nuw nsw i32 %90, %91
  %93 = udiv i32 %92, 1
  %94 = urem i32 %93, 168
  %95 = udiv i32 %92, 168
  %96 = urem i32 %95, 512
  %97 = udiv i32 %92, 86016
  %98 = mul i32 %thread_id.x, 1
  %99 = sub i32 %x_loc, %98
  %100 = mul nuw nsw i32 %94, 1
  %101 = add nuw nsw i32 0, %100
  %102 = udiv i32 %101, 168
  %103 = mul nuw nsw i32 %96, 1
  %104 = add nuw nsw i32 0, %103
  %105 = mul nuw nsw i32 %97, 512
  %106 = add nuw nsw i32 %104, %105
  %107 = urem i32 %106, 16
  %108 = udiv i32 %106, 16
  %109 = udiv i32 %108, 8192
  %110 = udiv i32 %92, 168
  %region_0_61_constant_9 = load float, ptr @11, align 4
  %region_0_61_constant_11 = load float, ptr @9, align 4
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %110
  %Arg_0.19 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  %Arg_0.110 = getelementptr inbounds float, ptr %arg0, i32 %110
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !98
  %multiply.13 = fmul float %Arg_0.19, %Arg_0.111
  %Arg_0.112 = getelementptr inbounds float, ptr %arg0, i32 %110
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !98
  %multiply.14 = fmul float %multiply.13, %Arg_0.113
  %Arg_6.7 = getelementptr inbounds float, ptr %arg6, i32 %110
  %Arg_6.714 = load float, ptr %Arg_6.7, align 4, !invariant.load !98
  %region_0_61_constant_15 = load float, ptr @10, align 4
  %multiply.17 = fmul float %Arg_6.714, %region_0_61_constant_15
  %multiply.19 = fmul float %multiply.14, %multiply.17
  %multiply.20 = fmul float %region_0_61_constant_11, %multiply.19
  %multiply.21 = fmul float %region_0_61_constant_9, %multiply.20
  %Arg_4.5 = getelementptr inbounds float, ptr %arg4, i32 %92
  %Arg_4.515 = load float, ptr %Arg_4.5, align 4, !invariant.load !98
  %111 = udiv i32 %92, 168
  %Arg_5.6 = getelementptr inbounds float, ptr %arg5, i32 %111
  %Arg_5.616 = load float, ptr %Arg_5.6, align 4, !invariant.load !98
  %subtract.26 = fsub float %Arg_4.515, %Arg_5.616
  %multiply.27 = fmul float %multiply.21, %subtract.26
  %112 = udiv i32 %92, 168
  %region_0_61_constant_1117 = load float, ptr @9, align 4
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %112
  %Arg_3.418 = load float, ptr %Arg_3.4, align 4, !invariant.load !98
  %multiply.29 = fmul float %region_0_61_constant_1117, %Arg_3.418
  %add.31 = fadd float %multiply.27, %multiply.29
  %113 = add i32 %108, 0
  %114 = add i32 %107, 0
  %115 = add i32 %101, 0
  %116 = mul nuw nsw i32 %115, 1
  %117 = add nuw nsw i32 0, %116
  %118 = udiv i32 %117, 168
  %119 = mul nuw nsw i32 %114, 1
  %120 = add nuw nsw i32 0, %119
  %121 = mul nuw nsw i32 %113, 100
  %122 = add nuw nsw i32 %120, %121
  %123 = udiv i32 %122, 819200
  %Arg_2.3 = getelementptr inbounds [819200 x [168 x float]], ptr %arg2, i32 0, i32 %122, i32 %117
  %Arg_2.319 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
  %Arg_1.2 = getelementptr inbounds [168 x float], ptr %arg1, i32 0, i32 %101
  %Arg_1.220 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %multiply.35 = fmul float %Arg_2.319, %Arg_1.220
  %124 = udiv i32 %92, 168
  %Arg_0.121 = getelementptr inbounds float, ptr %arg0, i32 %124
  %Arg_0.122 = load float, ptr %Arg_0.121, align 4, !invariant.load !98
  %multiply.38 = fmul float %multiply.35, %Arg_0.122
  %add.39 = fadd float %add.31, %multiply.38
  store float %add.39, ptr %reduction_input_address, align 4
  %125 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %99
  call void @region_1_42(ptr %125, ptr %reduction_input_address, ptr %return_buffer)
  %126 = load float, ptr %return_buffer, align 4
  store float %126, ptr %125, align 4
  %127 = mul nuw nsw i32 %94, 1
  %128 = add nuw nsw i32 0, %127
  %129 = udiv i32 %128, 168
  %130 = mul nuw nsw i32 %96, 1
  %131 = add nuw nsw i32 0, %130
  %132 = mul nuw nsw i32 %97, 512
  %133 = add nuw nsw i32 %131, %132
  %134 = urem i32 %133, 16
  %135 = udiv i32 %133, 16
  %136 = udiv i32 %135, 8192
  %137 = add i32 %135, 0
  %138 = add i32 %134, 0
  %139 = add i32 %128, 0
  %140 = mul nuw nsw i32 %139, 1
  %141 = add nuw nsw i32 0, %140
  %142 = udiv i32 %141, 168
  %143 = mul nuw nsw i32 %138, 1
  %144 = add nuw nsw i32 0, %143
  %145 = mul nuw nsw i32 %137, 100
  %146 = add nuw nsw i32 %144, %145
  %147 = udiv i32 %146, 819200
  %Arg_2.323 = getelementptr inbounds [819200 x [168 x float]], ptr %arg2, i32 0, i32 %146, i32 %141
  %Arg_2.324 = load float, ptr %Arg_2.323, align 4, !invariant.load !98
  store float %Arg_2.324, ptr %reduction_input_address1, align 4
  %148 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %99
  call void @region_2_48(ptr %148, ptr %reduction_input_address1, ptr %return_buffer25)
  %149 = load float, ptr %return_buffer25, align 4
  store float %149, ptr %148, align 4
  %150 = mul nuw nsw i32 %94, 1
  %151 = add nuw nsw i32 0, %150
  %152 = udiv i32 %151, 168
  %153 = mul nuw nsw i32 %96, 1
  %154 = add nuw nsw i32 0, %153
  %155 = mul nuw nsw i32 %97, 512
  %156 = add nuw nsw i32 %154, %155
  %157 = urem i32 %156, 16
  %158 = udiv i32 %156, 16
  %159 = udiv i32 %158, 8192
  %160 = add i32 %158, 0
  %161 = add i32 %157, 0
  %162 = add i32 %151, 0
  %163 = mul nuw nsw i32 %162, 1
  %164 = add nuw nsw i32 0, %163
  %165 = udiv i32 %164, 168
  %166 = mul nuw nsw i32 %161, 1
  %167 = add nuw nsw i32 0, %166
  %168 = mul nuw nsw i32 %160, 100
  %169 = add nuw nsw i32 %167, %168
  %170 = udiv i32 %169, 819200
  %Arg_2.326 = getelementptr inbounds [819200 x [168 x float]], ptr %arg2, i32 0, i32 %169, i32 %164
  %Arg_2.327 = load float, ptr %Arg_2.326, align 4, !invariant.load !98
  %Arg_7.8 = getelementptr inbounds float, ptr %arg7, i32 %92
  %Arg_7.828 = load float, ptr %Arg_7.8, align 4, !invariant.load !98
  %multiply.53 = fmul float %Arg_2.327, %Arg_7.828
  store float %multiply.53, ptr %reduction_input_address4, align 4
  %171 = getelementptr inbounds float, ptr %partial_reduction_result5, i32 %99
  call void @region_3_55(ptr %171, ptr %reduction_input_address4, ptr %return_buffer29)
  %172 = load float, ptr %return_buffer29, align 4
  store float %172, ptr %171, align 4
  %173 = mul nuw nsw i32 %94, 1
  %174 = add nuw nsw i32 0, %173
  %175 = udiv i32 %174, 168
  %176 = mul nuw nsw i32 %96, 1
  %177 = add nuw nsw i32 0, %176
  %178 = mul nuw nsw i32 %97, 512
  %179 = add nuw nsw i32 %177, %178
  %180 = urem i32 %179, 16
  %181 = udiv i32 %179, 16
  %182 = udiv i32 %181, 8192
  %183 = udiv i32 %92, 168
  %region_0_61_constant_930 = load float, ptr @11, align 4
  %region_0_61_constant_1131 = load float, ptr @9, align 4
  %Arg_0.132 = getelementptr inbounds float, ptr %arg0, i32 %183
  %Arg_0.133 = load float, ptr %Arg_0.132, align 4, !invariant.load !98
  %Arg_0.134 = getelementptr inbounds float, ptr %arg0, i32 %183
  %Arg_0.135 = load float, ptr %Arg_0.134, align 4, !invariant.load !98
  %multiply.1336 = fmul float %Arg_0.133, %Arg_0.135
  %Arg_0.137 = getelementptr inbounds float, ptr %arg0, i32 %183
  %Arg_0.138 = load float, ptr %Arg_0.137, align 4, !invariant.load !98
  %multiply.1439 = fmul float %multiply.1336, %Arg_0.138
  %Arg_6.740 = getelementptr inbounds float, ptr %arg6, i32 %183
  %Arg_6.741 = load float, ptr %Arg_6.740, align 4, !invariant.load !98
  %region_0_61_constant_1542 = load float, ptr @10, align 4
  %multiply.1743 = fmul float %Arg_6.741, %region_0_61_constant_1542
  %multiply.1944 = fmul float %multiply.1439, %multiply.1743
  %multiply.2045 = fmul float %region_0_61_constant_1131, %multiply.1944
  %multiply.2146 = fmul float %region_0_61_constant_930, %multiply.2045
  %Arg_4.547 = getelementptr inbounds float, ptr %arg4, i32 %92
  %Arg_4.548 = load float, ptr %Arg_4.547, align 4, !invariant.load !98
  %184 = udiv i32 %92, 168
  %Arg_5.649 = getelementptr inbounds float, ptr %arg5, i32 %184
  %Arg_5.650 = load float, ptr %Arg_5.649, align 4, !invariant.load !98
  %subtract.2651 = fsub float %Arg_4.548, %Arg_5.650
  %multiply.2752 = fmul float %multiply.2146, %subtract.2651
  %185 = udiv i32 %92, 168
  %region_0_61_constant_1153 = load float, ptr @9, align 4
  %Arg_3.454 = getelementptr inbounds float, ptr %arg3, i32 %185
  %Arg_3.455 = load float, ptr %Arg_3.454, align 4, !invariant.load !98
  %multiply.2956 = fmul float %region_0_61_constant_1153, %Arg_3.455
  %add.3157 = fadd float %multiply.2752, %multiply.2956
  %186 = add i32 %181, 0
  %187 = add i32 %180, 0
  %188 = add i32 %174, 0
  %189 = mul nuw nsw i32 %188, 1
  %190 = add nuw nsw i32 0, %189
  %191 = udiv i32 %190, 168
  %192 = mul nuw nsw i32 %187, 1
  %193 = add nuw nsw i32 0, %192
  %194 = mul nuw nsw i32 %186, 100
  %195 = add nuw nsw i32 %193, %194
  %196 = udiv i32 %195, 819200
  %Arg_2.358 = getelementptr inbounds [819200 x [168 x float]], ptr %arg2, i32 0, i32 %195, i32 %190
  %Arg_2.359 = load float, ptr %Arg_2.358, align 4, !invariant.load !98
  %Arg_1.260 = getelementptr inbounds [168 x float], ptr %arg1, i32 0, i32 %174
  %Arg_1.261 = load float, ptr %Arg_1.260, align 4, !invariant.load !98
  %multiply.3562 = fmul float %Arg_2.359, %Arg_1.261
  %197 = udiv i32 %92, 168
  %Arg_0.163 = getelementptr inbounds float, ptr %arg0, i32 %197
  %Arg_0.164 = load float, ptr %Arg_0.163, align 4, !invariant.load !98
  %multiply.3865 = fmul float %multiply.3562, %Arg_0.164
  %add.3966 = fadd float %add.3157, %multiply.3865
  %198 = mul nuw nsw i32 %94, 1
  %199 = add nuw nsw i32 0, %198
  %200 = udiv i32 %199, 168
  %201 = mul nuw nsw i32 %96, 1
  %202 = add nuw nsw i32 0, %201
  %203 = mul nuw nsw i32 %97, 512
  %204 = add nuw nsw i32 %202, %203
  %205 = urem i32 %204, 16
  %206 = udiv i32 %204, 16
  %207 = udiv i32 %206, 8192
  %208 = getelementptr inbounds float, ptr %arg9, i32 %92
  store float %add.3966, ptr %208, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %209 = mul i32 %thread_id.y, 1
  %210 = add i32 %tile_origin.1, %thread_id.x
  %211 = add i32 %tile_origin.2, %209
  %212 = add i32 %211, 0
  %213 = mul i32 %tile_origin.0, 168
  %214 = add i32 %213, %212
  %215 = udiv i32 %214, 1
  %216 = urem i32 %215, 168
  %217 = udiv i32 %214, 168
  %output_element_address = getelementptr inbounds [256 x [168 x float]], ptr %arg8, i32 0, i32 %217, i32 %216
  %output = load float, ptr %32, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true99:                    ; preds = %reduction_write_output-after
  %218 = mul i32 %thread_id.y, 1
  %219 = add i32 %tile_origin.1, %thread_id.x
  %220 = add i32 %tile_origin.2, %218
  %221 = add i32 %220, 0
  %222 = mul i32 %tile_origin.0, 168
  %223 = add i32 %222, %221
  %224 = udiv i32 %223, 1
  %225 = urem i32 %224, 168
  %226 = udiv i32 %223, 168
  %output_element_address101 = getelementptr inbounds [256 x [168 x float]], ptr %arg10, i32 0, i32 %226, i32 %225
  %output102 = load float, ptr %51, align 4
  store float %output102, ptr %output_element_address101, align 4
  br label %reduction_write_output-after100

reduction_write_output-true121:                   ; preds = %reduction_write_output-after100
  %227 = mul i32 %thread_id.y, 1
  %228 = add i32 %tile_origin.1, %thread_id.x
  %229 = add i32 %tile_origin.2, %227
  %230 = add i32 %229, 0
  %231 = mul i32 %tile_origin.0, 168
  %232 = add i32 %231, %230
  %233 = udiv i32 %232, 1
  %234 = urem i32 %233, 168
  %235 = udiv i32 %232, 168
  %output_element_address123 = getelementptr inbounds [256 x [168 x float]], ptr %arg11, i32 0, i32 %235, i32 %234
  %output124 = load float, ptr %70, align 4
  store float %output124, ptr %output_element_address123, align 4
  br label %reduction_write_output-after122
}

define internal void @region_1_42(ptr dereferenceable(4) %Arg_0.43.typed, ptr dereferenceable(4) %Arg_1.44.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.45.typed = alloca float, align 4
  %Arg_0.43 = load float, ptr %Arg_0.43.typed, align 4
  %Arg_1.44 = load float, ptr %Arg_1.44.typed, align 4
  %add.45 = fadd float %Arg_0.43, %Arg_1.44
  store float %add.45, ptr %add.45.typed, align 4
  %load_ret_value = load float, ptr %add.45.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_48(ptr dereferenceable(4) %Arg_0.49.typed, ptr dereferenceable(4) %Arg_1.50.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.51.typed = alloca float, align 4
  %Arg_0.49 = load float, ptr %Arg_0.49.typed, align 4
  %Arg_1.50 = load float, ptr %Arg_1.50.typed, align 4
  %add.51 = fadd float %Arg_0.49, %Arg_1.50
  store float %add.51, ptr %add.51.typed, align 4
  %load_ret_value = load float, ptr %add.51.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_3_55(ptr dereferenceable(4) %Arg_0.56.typed, ptr dereferenceable(4) %Arg_1.57.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.58.typed = alloca float, align 4
  %Arg_0.56 = load float, ptr %Arg_0.56.typed, align 4
  %Arg_1.57 = load float, ptr %Arg_1.57.typed, align 4
  %add.58 = fadd float %Arg_0.56, %Arg_1.57
  store float %add.58, ptr %add.58.typed, align 4
  %load_ret_value = load float, ptr %add.58.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_101(ptr noalias align 128 dereferenceable(172032) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(172032) %arg2, ptr noalias align 128 dereferenceable(172032) %arg3, ptr noalias align 128 dereferenceable(672) %arg4, ptr noalias align 128 dereferenceable(672) %arg5, ptr noalias align 128 dereferenceable(672) %arg6) {
entry:
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !148
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after66, %reduce-group-0-after
  %3 = icmp eq i32 %0, 2
  br i1 %3, label %reduce-group-2-true, label %reduce-group-2-after

reduce-group-2-after:                             ; preds = %reduction_write_output-after117, %reduce-group-1-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !98
  %4 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !149
  %7 = urem i32 %5, 1024
  %8 = udiv i32 %5, 1024
  %9 = mul i32 %6, 1
  %10 = add i32 %9, %8
  %11 = icmp ult i32 %10, 6
  br i1 %11, label %12, label %early_return

12:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %7, 32
  %thread_id.y = udiv i32 %7, 32
  %lane_id = urem i32 %7, 32
  %13 = udiv i32 %10, 1
  %14 = urem i32 %13, 6
  %15 = udiv i32 %10, 6
  %16 = urem i32 %15, 1
  %17 = udiv i32 %10, 6
  %18 = icmp eq i32 %16, 0
  %tile_bound = select i1 %18, i32 256, i32 4096
  %19 = icmp eq i32 %14, 5
  %tile_bound1 = select i1 %19, i32 8, i32 32
  %tile_origin.0 = mul i32 %17, 1
  %tile_origin.1 = mul i32 %16, 4096
  %tile_origin.2 = mul i32 %14, 32
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %12
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %20 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %20, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %21 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %22 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %23 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %23, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %24 = icmp eq i32 %tile_loop.indvar, 0
  %25 = mul i32 %tile_loop.indvar, 1
  %26 = add i32 %25, 0
  %x_loc = add i32 %26, %22
  %27 = add i32 %tile_origin.1, %y_in_tile.indvar
  %28 = add i32 %tile_origin.2, %x_loc
  %29 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %29, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !150

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !151

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache17, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %30 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %31 = load float, ptr %current_output, align 4
  store float %31, ptr %30, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache17, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %32 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result4 = load float, ptr %32, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  store float %33, ptr %result_from_other_lane, align 4
  call void @region_1_5(ptr %32, ptr %result_from_other_lane, ptr %return_buffer5)
  %34 = load float, ptr %return_buffer5, align 4
  store float %34, ptr %32, align 4
  %partial_reduction_result7 = load float, ptr %32, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result7, i32 8, i32 31)
  store float %35, ptr %result_from_other_lane6, align 4
  call void @region_1_5(ptr %32, ptr %result_from_other_lane6, ptr %return_buffer8)
  %36 = load float, ptr %return_buffer8, align 4
  store float %36, ptr %32, align 4
  %partial_reduction_result10 = load float, ptr %32, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 4, i32 31)
  store float %37, ptr %result_from_other_lane9, align 4
  call void @region_1_5(ptr %32, ptr %result_from_other_lane9, ptr %return_buffer11)
  %38 = load float, ptr %return_buffer11, align 4
  store float %38, ptr %32, align 4
  %partial_reduction_result13 = load float, ptr %32, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 2, i32 31)
  store float %39, ptr %result_from_other_lane12, align 4
  call void @region_1_5(ptr %32, ptr %result_from_other_lane12, ptr %return_buffer14)
  %40 = load float, ptr %return_buffer14, align 4
  store float %40, ptr %32, align 4
  %partial_reduction_result16 = load float, ptr %32, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 1, i32 31)
  store float %41, ptr %result_from_other_lane15, align 4
  call void @region_1_5(ptr %32, ptr %result_from_other_lane15, ptr %return_buffer17)
  %42 = load float, ptr %return_buffer17, align 4
  store float %42, ptr %32, align 4
  %43 = icmp ult i32 %thread_id.x, %tile_bound
  %44 = mul i32 %thread_id.y, 1
  %45 = icmp ult i32 %44, %tile_bound1
  %46 = and i1 %45, %43
  %47 = icmp eq i32 %lane_id, 0
  %48 = and i1 %46, %47
  br i1 %48, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %49 = mul i32 %thread_id.x, 1
  %50 = sub i32 %x_loc, %49
  %Arg_0.1 = getelementptr inbounds [256 x [168 x float]], ptr %arg0, i32 0, i32 %27, i32 %28
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %51 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %50
  call void @region_1_5(ptr %51, ptr %reduction_input_address, ptr %return_buffer)
  %52 = load float, ptr %return_buffer, align 4
  store float %52, ptr %51, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %53 = mul i32 %thread_id.y, 1
  %54 = add i32 %tile_origin.1, %thread_id.x
  %55 = add i32 %tile_origin.2, %53
  %56 = add i32 %55, 0
  %57 = mul i32 %tile_origin.0, 168
  %58 = add i32 %57, %56
  %59 = udiv i32 %58, 1
  %output_element_address = getelementptr inbounds [168 x float], ptr %arg4, i32 0, i32 %59
  %output = load float, ptr %32, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.220 = load float, ptr %arg1, align 4, !invariant.load !98
  %60 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 0
  store float %Arg_1.220, ptr %60, align 4
  %61 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %62 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !149
  %63 = urem i32 %61, 1024
  %64 = udiv i32 %61, 1024
  %65 = mul i32 %62, 1
  %66 = add i32 %65, %64
  %67 = icmp ult i32 %66, 6
  br i1 %67, label %68, label %early_return21

68:                                               ; preds = %reduce-group-1-true
  %thread_id.x22 = urem i32 %63, 32
  %thread_id.y23 = udiv i32 %63, 32
  %lane_id24 = urem i32 %63, 32
  %69 = udiv i32 %66, 1
  %70 = urem i32 %69, 6
  %71 = udiv i32 %66, 6
  %72 = urem i32 %71, 1
  %73 = udiv i32 %66, 6
  %74 = icmp eq i32 %72, 0
  %tile_bound25 = select i1 %74, i32 256, i32 4096
  %75 = icmp eq i32 %70, 5
  %tile_bound26 = select i1 %75, i32 8, i32 32
  %tile_origin.027 = mul i32 %73, 1
  %tile_origin.128 = mul i32 %72, 4096
  %tile_origin.229 = mul i32 %70, 32
  store i32 %thread_id.y23, ptr %y_in_tile.invar_address33, align 4
  br label %y_in_tile.loop_header31

y_in_tile.loop_header31:                          ; preds = %tile_loop.loop_exit36, %68
  %y_in_tile.indvar34 = load i32, ptr %y_in_tile.invar_address33, align 4
  %76 = icmp uge i32 %y_in_tile.indvar34, %tile_bound25
  br i1 %76, label %y_in_tile.loop_exit30, label %y_in_tile.loop_body32

y_in_tile.loop_body32:                            ; preds = %y_in_tile.loop_header31
  %invar.inc35 = add nuw nsw i32 %y_in_tile.indvar34, 32
  store i32 %invar.inc35, ptr %y_in_tile.invar_address33, align 4
  %77 = icmp eq i32 %y_in_tile.indvar34, %thread_id.y23
  %78 = mul i32 %thread_id.x22, 1
  store i32 0, ptr %tile_loop.invar_address39, align 4
  br label %tile_loop.loop_header37

tile_loop.loop_header37:                          ; preds = %x_in_tile-after44, %y_in_tile.loop_body32
  %tile_loop.indvar40 = load i32, ptr %tile_loop.invar_address39, align 4
  %79 = icmp uge i32 %tile_loop.indvar40, 1
  br i1 %79, label %tile_loop.loop_exit36, label %tile_loop.loop_body38

tile_loop.loop_body38:                            ; preds = %tile_loop.loop_header37
  %invar.inc41 = add nuw nsw i32 %tile_loop.indvar40, 1
  store i32 %invar.inc41, ptr %tile_loop.invar_address39, align 4
  %80 = icmp eq i32 %tile_loop.indvar40, 0
  %81 = mul i32 %tile_loop.indvar40, 1
  %82 = add i32 %81, 0
  %x_loc42 = add i32 %82, %78
  %83 = add i32 %tile_origin.128, %y_in_tile.indvar34
  %84 = add i32 %tile_origin.229, %x_loc42
  %85 = icmp ult i32 %x_loc42, %tile_bound26
  br i1 %85, label %x_in_tile-true43, label %x_in_tile-after44

x_in_tile-after44:                                ; preds = %x_in_tile-true43, %tile_loop.loop_body38
  br label %tile_loop.loop_header37, !llvm.loop !152

tile_loop.loop_exit36:                            ; preds = %tile_loop.loop_header37
  br label %y_in_tile.loop_header31, !llvm.loop !153

y_in_tile.loop_exit30:                            ; preds = %y_in_tile.loop_header31
  %shmem_output_address47 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache18, i32 0, i32 %64, i32 0, i32 %thread_id.x22, i32 %thread_id.y23
  %86 = addrspacecast ptr addrspace(3) %shmem_output_address47 to ptr
  %current_output48 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 0
  %87 = load float, ptr %current_output48, align 4
  store float %87, ptr %86, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr49 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache18, i32 0, i32 %64, i32 0, i32 %thread_id.y23, i32 %thread_id.x22
  %88 = addrspacecast ptr addrspace(3) %shmem_transposed_addr49 to ptr
  %partial_reduction_result51 = load float, ptr %88, align 4
  %89 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 16, i32 31)
  store float %89, ptr %result_from_other_lane50, align 4
  call void @region_2_10(ptr %88, ptr %result_from_other_lane50, ptr %return_buffer52)
  %90 = load float, ptr %return_buffer52, align 4
  store float %90, ptr %88, align 4
  %partial_reduction_result54 = load float, ptr %88, align 4
  %91 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 8, i32 31)
  store float %91, ptr %result_from_other_lane53, align 4
  call void @region_2_10(ptr %88, ptr %result_from_other_lane53, ptr %return_buffer55)
  %92 = load float, ptr %return_buffer55, align 4
  store float %92, ptr %88, align 4
  %partial_reduction_result57 = load float, ptr %88, align 4
  %93 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 4, i32 31)
  store float %93, ptr %result_from_other_lane56, align 4
  call void @region_2_10(ptr %88, ptr %result_from_other_lane56, ptr %return_buffer58)
  %94 = load float, ptr %return_buffer58, align 4
  store float %94, ptr %88, align 4
  %partial_reduction_result60 = load float, ptr %88, align 4
  %95 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result60, i32 2, i32 31)
  store float %95, ptr %result_from_other_lane59, align 4
  call void @region_2_10(ptr %88, ptr %result_from_other_lane59, ptr %return_buffer61)
  %96 = load float, ptr %return_buffer61, align 4
  store float %96, ptr %88, align 4
  %partial_reduction_result63 = load float, ptr %88, align 4
  %97 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result63, i32 1, i32 31)
  store float %97, ptr %result_from_other_lane62, align 4
  call void @region_2_10(ptr %88, ptr %result_from_other_lane62, ptr %return_buffer64)
  %98 = load float, ptr %return_buffer64, align 4
  store float %98, ptr %88, align 4
  %99 = icmp ult i32 %thread_id.x22, %tile_bound25
  %100 = mul i32 %thread_id.y23, 1
  %101 = icmp ult i32 %100, %tile_bound26
  %102 = and i1 %101, %99
  %103 = icmp eq i32 %lane_id24, 0
  %104 = and i1 %102, %103
  br i1 %104, label %reduction_write_output-true65, label %reduction_write_output-after66

reduction_write_output-after66:                   ; preds = %reduction_write_output-true65, %y_in_tile.loop_exit30
  br label %reduce-group-1-after

early_return21:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true43:                                 ; preds = %tile_loop.loop_body38
  %105 = mul i32 %thread_id.x22, 1
  %106 = sub i32 %x_loc42, %105
  %Arg_2.3 = getelementptr inbounds [256 x [168 x float]], ptr %arg2, i32 0, i32 %83, i32 %84
  %Arg_2.345 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
  store float %Arg_2.345, ptr %reduction_input_address18, align 4
  %107 = getelementptr inbounds float, ptr %partial_reduction_result19, i32 %106
  call void @region_2_10(ptr %107, ptr %reduction_input_address18, ptr %return_buffer46)
  %108 = load float, ptr %return_buffer46, align 4
  store float %108, ptr %107, align 4
  br label %x_in_tile-after44

reduction_write_output-true65:                    ; preds = %y_in_tile.loop_exit30
  %109 = mul i32 %thread_id.y23, 1
  %110 = add i32 %tile_origin.128, %thread_id.x22
  %111 = add i32 %tile_origin.229, %109
  %112 = add i32 %111, 0
  %113 = mul i32 %tile_origin.027, 168
  %114 = add i32 %113, %112
  %115 = udiv i32 %114, 1
  %output_element_address67 = getelementptr inbounds [168 x float], ptr %arg5, i32 0, i32 %115
  %output68 = load float, ptr %88, align 4
  store float %output68, ptr %output_element_address67, align 4
  br label %reduction_write_output-after66

reduce-group-2-true:                              ; preds = %reduce-group-1-after
  %Arg_1.271 = load float, ptr %arg1, align 4, !invariant.load !98
  %116 = getelementptr inbounds float, ptr %partial_reduction_result70, i32 0
  store float %Arg_1.271, ptr %116, align 4
  %117 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %118 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !149
  %119 = urem i32 %117, 1024
  %120 = udiv i32 %117, 1024
  %121 = mul i32 %118, 1
  %122 = add i32 %121, %120
  %123 = icmp ult i32 %122, 6
  br i1 %123, label %124, label %early_return72

124:                                              ; preds = %reduce-group-2-true
  %thread_id.x73 = urem i32 %119, 32
  %thread_id.y74 = udiv i32 %119, 32
  %lane_id75 = urem i32 %119, 32
  %125 = udiv i32 %122, 1
  %126 = urem i32 %125, 6
  %127 = udiv i32 %122, 6
  %128 = urem i32 %127, 1
  %129 = udiv i32 %122, 6
  %130 = icmp eq i32 %128, 0
  %tile_bound76 = select i1 %130, i32 256, i32 4096
  %131 = icmp eq i32 %126, 5
  %tile_bound77 = select i1 %131, i32 8, i32 32
  %tile_origin.078 = mul i32 %129, 1
  %tile_origin.179 = mul i32 %128, 4096
  %tile_origin.280 = mul i32 %126, 32
  store i32 %thread_id.y74, ptr %y_in_tile.invar_address84, align 4
  br label %y_in_tile.loop_header82

y_in_tile.loop_header82:                          ; preds = %tile_loop.loop_exit87, %124
  %y_in_tile.indvar85 = load i32, ptr %y_in_tile.invar_address84, align 4
  %132 = icmp uge i32 %y_in_tile.indvar85, %tile_bound76
  br i1 %132, label %y_in_tile.loop_exit81, label %y_in_tile.loop_body83

y_in_tile.loop_body83:                            ; preds = %y_in_tile.loop_header82
  %invar.inc86 = add nuw nsw i32 %y_in_tile.indvar85, 32
  store i32 %invar.inc86, ptr %y_in_tile.invar_address84, align 4
  %133 = icmp eq i32 %y_in_tile.indvar85, %thread_id.y74
  %134 = mul i32 %thread_id.x73, 1
  store i32 0, ptr %tile_loop.invar_address90, align 4
  br label %tile_loop.loop_header88

tile_loop.loop_header88:                          ; preds = %x_in_tile-after95, %y_in_tile.loop_body83
  %tile_loop.indvar91 = load i32, ptr %tile_loop.invar_address90, align 4
  %135 = icmp uge i32 %tile_loop.indvar91, 1
  br i1 %135, label %tile_loop.loop_exit87, label %tile_loop.loop_body89

tile_loop.loop_body89:                            ; preds = %tile_loop.loop_header88
  %invar.inc92 = add nuw nsw i32 %tile_loop.indvar91, 1
  store i32 %invar.inc92, ptr %tile_loop.invar_address90, align 4
  %136 = icmp eq i32 %tile_loop.indvar91, 0
  %137 = mul i32 %tile_loop.indvar91, 1
  %138 = add i32 %137, 0
  %x_loc93 = add i32 %138, %134
  %139 = add i32 %tile_origin.179, %y_in_tile.indvar85
  %140 = add i32 %tile_origin.280, %x_loc93
  %141 = icmp ult i32 %x_loc93, %tile_bound77
  br i1 %141, label %x_in_tile-true94, label %x_in_tile-after95

x_in_tile-after95:                                ; preds = %x_in_tile-true94, %tile_loop.loop_body89
  br label %tile_loop.loop_header88, !llvm.loop !154

tile_loop.loop_exit87:                            ; preds = %tile_loop.loop_header88
  br label %y_in_tile.loop_header82, !llvm.loop !155

y_in_tile.loop_exit81:                            ; preds = %y_in_tile.loop_header82
  %shmem_output_address98 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache19, i32 0, i32 %120, i32 0, i32 %thread_id.x73, i32 %thread_id.y74
  %142 = addrspacecast ptr addrspace(3) %shmem_output_address98 to ptr
  %current_output99 = getelementptr inbounds float, ptr %partial_reduction_result70, i32 0
  %143 = load float, ptr %current_output99, align 4
  store float %143, ptr %142, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr100 = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache19, i32 0, i32 %120, i32 0, i32 %thread_id.y74, i32 %thread_id.x73
  %144 = addrspacecast ptr addrspace(3) %shmem_transposed_addr100 to ptr
  %partial_reduction_result102 = load float, ptr %144, align 4
  %145 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result102, i32 16, i32 31)
  store float %145, ptr %result_from_other_lane101, align 4
  call void @region_3_15(ptr %144, ptr %result_from_other_lane101, ptr %return_buffer103)
  %146 = load float, ptr %return_buffer103, align 4
  store float %146, ptr %144, align 4
  %partial_reduction_result105 = load float, ptr %144, align 4
  %147 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result105, i32 8, i32 31)
  store float %147, ptr %result_from_other_lane104, align 4
  call void @region_3_15(ptr %144, ptr %result_from_other_lane104, ptr %return_buffer106)
  %148 = load float, ptr %return_buffer106, align 4
  store float %148, ptr %144, align 4
  %partial_reduction_result108 = load float, ptr %144, align 4
  %149 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result108, i32 4, i32 31)
  store float %149, ptr %result_from_other_lane107, align 4
  call void @region_3_15(ptr %144, ptr %result_from_other_lane107, ptr %return_buffer109)
  %150 = load float, ptr %return_buffer109, align 4
  store float %150, ptr %144, align 4
  %partial_reduction_result111 = load float, ptr %144, align 4
  %151 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result111, i32 2, i32 31)
  store float %151, ptr %result_from_other_lane110, align 4
  call void @region_3_15(ptr %144, ptr %result_from_other_lane110, ptr %return_buffer112)
  %152 = load float, ptr %return_buffer112, align 4
  store float %152, ptr %144, align 4
  %partial_reduction_result114 = load float, ptr %144, align 4
  %153 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result114, i32 1, i32 31)
  store float %153, ptr %result_from_other_lane113, align 4
  call void @region_3_15(ptr %144, ptr %result_from_other_lane113, ptr %return_buffer115)
  %154 = load float, ptr %return_buffer115, align 4
  store float %154, ptr %144, align 4
  %155 = icmp ult i32 %thread_id.x73, %tile_bound76
  %156 = mul i32 %thread_id.y74, 1
  %157 = icmp ult i32 %156, %tile_bound77
  %158 = and i1 %157, %155
  %159 = icmp eq i32 %lane_id75, 0
  %160 = and i1 %158, %159
  br i1 %160, label %reduction_write_output-true116, label %reduction_write_output-after117

reduction_write_output-after117:                  ; preds = %reduction_write_output-true116, %y_in_tile.loop_exit81
  br label %reduce-group-2-after

early_return72:                                   ; preds = %reduce-group-2-true
  ret void

x_in_tile-true94:                                 ; preds = %tile_loop.loop_body89
  %161 = mul i32 %thread_id.x73, 1
  %162 = sub i32 %x_loc93, %161
  %Arg_3.4 = getelementptr inbounds [256 x [168 x float]], ptr %arg3, i32 0, i32 %139, i32 %140
  %Arg_3.496 = load float, ptr %Arg_3.4, align 4, !invariant.load !98
  store float %Arg_3.496, ptr %reduction_input_address69, align 4
  %163 = getelementptr inbounds float, ptr %partial_reduction_result70, i32 %162
  call void @region_3_15(ptr %163, ptr %reduction_input_address69, ptr %return_buffer97)
  %164 = load float, ptr %return_buffer97, align 4
  store float %164, ptr %163, align 4
  br label %x_in_tile-after95

reduction_write_output-true116:                   ; preds = %y_in_tile.loop_exit81
  %165 = mul i32 %thread_id.y74, 1
  %166 = add i32 %tile_origin.179, %thread_id.x73
  %167 = add i32 %tile_origin.280, %165
  %168 = add i32 %167, 0
  %169 = mul i32 %tile_origin.078, 168
  %170 = add i32 %169, %168
  %171 = udiv i32 %170, 1
  %output_element_address118 = getelementptr inbounds [168 x float], ptr %arg6, i32 0, i32 %171
  %output119 = load float, ptr %144, align 4
  store float %output119, ptr %output_element_address118, align 4
  br label %reduction_write_output-after117
}

define internal void @region_1_5(ptr dereferenceable(4) %Arg_0.6.typed, ptr dereferenceable(4) %Arg_1.7.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.8.typed = alloca float, align 4
  %Arg_0.6 = load float, ptr %Arg_0.6.typed, align 4
  %Arg_1.7 = load float, ptr %Arg_1.7.typed, align 4
  %add.8 = fadd float %Arg_0.6, %Arg_1.7
  store float %add.8, ptr %add.8.typed, align 4
  %load_ret_value = load float, ptr %add.8.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_2_10(ptr dereferenceable(4) %Arg_0.11.typed, ptr dereferenceable(4) %Arg_1.12.typed, ptr dereferenceable(4) %output_arg) {
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

define internal void @region_3_15(ptr dereferenceable(4) %Arg_0.16.typed, ptr dereferenceable(4) %Arg_1.17.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.18.typed = alloca float, align 4
  %Arg_0.16 = load float, ptr %Arg_0.16.typed, align 4
  %Arg_1.17 = load float, ptr %Arg_1.17.typed, align 4
  %add.18 = fadd float %Arg_0.16, %Arg_1.17
  store float %add.18, ptr %add.18.typed, align 4
  %load_ret_value = load float, ptr %add.18.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_88(ptr noalias align 16 dereferenceable(672) %arg0, ptr noalias align 128 dereferenceable(672) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(672) %arg3, ptr noalias align 128 dereferenceable(672) %arg4, ptr noalias align 16 dereferenceable(672) %arg5, ptr noalias align 128 dereferenceable(672) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !156
  %2 = mul nuw nsw i32 %0, 168
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 168
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 168
  br i1 %4, label %fusion_88.in_bounds-true, label %fusion_88.in_bounds-after

fusion_88.in_bounds-after:                        ; preds = %fusion_88.in_bounds-true, %entry
  ret void

fusion_88.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !98
  %7 = load float, ptr %arg2, align 4, !invariant.load !98
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.9 = fmul float %7, %9
  %subtract.10 = fsub float %6, %multiply.9
  %10 = insertvalue { float, float, float } undef, float %subtract.10, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !98
  %13 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %14 = load float, ptr %13, align 4
  %multiply.11 = fmul float %7, %14
  %subtract.12 = fsub float %12, %multiply.11
  %15 = insertvalue { float, float, float } %10, float %subtract.12, 1
  %16 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !98
  %18 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %19 = load float, ptr %18, align 4
  %multiply.13 = fmul float %7, %19
  %subtract.14 = fsub float %17, %multiply.13
  %20 = insertvalue { float, float, float } %15, float %subtract.14, 2
  %21 = extractvalue { float, float, float } %20, 0
  %22 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %21, ptr %22, align 4
  %23 = extractvalue { float, float, float } %20, 1
  %24 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %23, ptr %24, align 4
  %25 = extractvalue { float, float, float } %20, 2
  %26 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %25, ptr %26, align 4
  br label %fusion_88.in_bounds-after
}

define void @fusion_46(ptr noalias align 16 dereferenceable(172032) %arg0, ptr noalias align 128 dereferenceable(172032) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !157
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 43008
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 168
  %5 = udiv i32 %linear_index, 168
  %6 = icmp ult i32 %linear_index, 43008
  br i1 %6, label %fusion_46.in_bounds-true, label %fusion_46.in_bounds-after

fusion_46.in_bounds-after:                        ; preds = %fusion_46.in_bounds-true, %entry
  ret void

fusion_46.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_46.in_bounds-after
}

define void @fusion_44(ptr noalias align 16 dereferenceable(134217728) %arg0, ptr noalias align 128 dereferenceable(134217728) %arg1, ptr noalias align 16 dereferenceable(134217728) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(134217728) %arg4, ptr noalias align 128 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(134217728) %arg6) {
entry:
  %return_buffer150 = alloca float, align 4
  %result_from_other_lane148 = alloca float, align 4
  %return_buffer147 = alloca float, align 4
  %result_from_other_lane145 = alloca float, align 4
  %return_buffer144 = alloca float, align 4
  %result_from_other_lane142 = alloca float, align 4
  %return_buffer141 = alloca float, align 4
  %result_from_other_lane139 = alloca float, align 4
  %return_buffer138 = alloca float, align 4
  %result_from_other_lane136 = alloca float, align 4
  %return_buffer128 = alloca float, align 4
  %result_from_other_lane126 = alloca float, align 4
  %return_buffer125 = alloca float, align 4
  %result_from_other_lane123 = alloca float, align 4
  %return_buffer122 = alloca float, align 4
  %result_from_other_lane120 = alloca float, align 4
  %return_buffer119 = alloca float, align 4
  %result_from_other_lane117 = alloca float, align 4
  %return_buffer116 = alloca float, align 4
  %result_from_other_lane114 = alloca float, align 4
  %return_buffer106 = alloca float, align 4
  %result_from_other_lane104 = alloca float, align 4
  %return_buffer103 = alloca float, align 4
  %result_from_other_lane101 = alloca float, align 4
  %return_buffer100 = alloca float, align 4
  %result_from_other_lane98 = alloca float, align 4
  %return_buffer97 = alloca float, align 4
  %result_from_other_lane95 = alloca float, align 4
  %return_buffer94 = alloca float, align 4
  %result_from_other_lane92 = alloca float, align 4
  %return_buffer88 = alloca float, align 4
  %result_from_other_lane86 = alloca float, align 4
  %return_buffer85 = alloca float, align 4
  %result_from_other_lane83 = alloca float, align 4
  %return_buffer82 = alloca float, align 4
  %result_from_other_lane80 = alloca float, align 4
  %return_buffer79 = alloca float, align 4
  %result_from_other_lane77 = alloca float, align 4
  %return_buffer76 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer56 = alloca float, align 4
  %return_buffer50 = alloca float, align 4
  %return_buffer15 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result2 = alloca float, i32 2, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after152, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_25_constant_11 = load float, ptr @14, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_25_constant_11, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_25_constant_11, ptr %3, align 4
  %region_0_25_constant_113 = load float, ptr @14, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_25_constant_113, ptr %4, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 1
  store float %region_0_25_constant_113, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !119
  %8 = urem i32 %6, 1024
  %9 = udiv i32 %6, 1024
  %10 = mul i32 %7, 1
  %11 = add i32 %10, %9
  %12 = icmp ult i32 %11, 1024
  br i1 %12, label %13, label %early_return

13:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %8, 32
  %thread_id.y = udiv i32 %8, 32
  %lane_id = urem i32 %8, 32
  %14 = udiv i32 %11, 1
  %15 = urem i32 %14, 4
  %16 = udiv i32 %11, 4
  %17 = urem i32 %16, 1
  %18 = udiv i32 %11, 4
  %19 = icmp eq i32 %17, 0
  %tile_bound = select i1 %19, i32 512, i32 4096
  %20 = icmp eq i32 %15, 3
  %tile_bound4 = select i1 %20, i32 64, i32 64
  %tile_origin.0 = mul i32 %18, 1
  %tile_origin.1 = mul i32 %17, 4096
  %tile_origin.2 = mul i32 %15, 64
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
  %23 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after36, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %24 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %24, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc5 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc5, ptr %tile_loop.invar_address, align 4
  %25 = icmp eq i32 %tile_loop.indvar, 0
  %26 = mul i32 %tile_loop.indvar, 2
  %27 = add i32 %26, 0
  %x_loc = add i32 %27, %23
  %28 = add i32 %tile_origin.1, %y_in_tile.indvar
  %29 = add i32 %tile_origin.2, %x_loc
  %30 = icmp ult i32 %x_loc, %tile_bound4
  br i1 %30, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %31 = mul i32 %tile_loop.indvar, 2
  %32 = add i32 %31, 1
  %x_loc34 = add i32 %32, %23
  %33 = add i32 %tile_origin.1, %y_in_tile.indvar
  %34 = add i32 %tile_origin.2, %x_loc34
  %35 = icmp ult i32 %x_loc34, %tile_bound4
  br i1 %35, label %x_in_tile-true35, label %x_in_tile-after36

x_in_tile-after36:                                ; preds = %x_in_tile-true35, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !158

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !159

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache20, i32 0, i32 %9, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %36 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %37 = load float, ptr %current_output, align 4
  store float %37, ptr %36, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache20, i32 0, i32 %9, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %38 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result75 = load float, ptr %38, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result75, i32 16, i32 31)
  store float %39, ptr %result_from_other_lane, align 4
  call void @region_1_12__1(ptr %38, ptr %result_from_other_lane, ptr %return_buffer76)
  %40 = load float, ptr %return_buffer76, align 4
  store float %40, ptr %38, align 4
  %partial_reduction_result78 = load float, ptr %38, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result78, i32 8, i32 31)
  store float %41, ptr %result_from_other_lane77, align 4
  call void @region_1_12__1(ptr %38, ptr %result_from_other_lane77, ptr %return_buffer79)
  %42 = load float, ptr %return_buffer79, align 4
  store float %42, ptr %38, align 4
  %partial_reduction_result81 = load float, ptr %38, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result81, i32 4, i32 31)
  store float %43, ptr %result_from_other_lane80, align 4
  call void @region_1_12__1(ptr %38, ptr %result_from_other_lane80, ptr %return_buffer82)
  %44 = load float, ptr %return_buffer82, align 4
  store float %44, ptr %38, align 4
  %partial_reduction_result84 = load float, ptr %38, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result84, i32 2, i32 31)
  store float %45, ptr %result_from_other_lane83, align 4
  call void @region_1_12__1(ptr %38, ptr %result_from_other_lane83, ptr %return_buffer85)
  %46 = load float, ptr %return_buffer85, align 4
  store float %46, ptr %38, align 4
  %partial_reduction_result87 = load float, ptr %38, align 4
  %47 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result87, i32 1, i32 31)
  store float %47, ptr %result_from_other_lane86, align 4
  call void @region_1_12__1(ptr %38, ptr %result_from_other_lane86, ptr %return_buffer88)
  %48 = load float, ptr %return_buffer88, align 4
  store float %48, ptr %38, align 4
  %49 = icmp ult i32 %thread_id.x, %tile_bound
  %50 = mul i32 %thread_id.y, 2
  %51 = icmp ult i32 %50, %tile_bound4
  %52 = and i1 %51, %49
  %53 = icmp eq i32 %lane_id, 0
  %54 = and i1 %52, %53
  br i1 %54, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address89 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache20, i32 0, i32 %9, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %55 = addrspacecast ptr addrspace(3) %shmem_output_address89 to ptr
  %current_output90 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %56 = load float, ptr %current_output90, align 4
  store float %56, ptr %55, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr91 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache20, i32 0, i32 %9, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %57 = addrspacecast ptr addrspace(3) %shmem_transposed_addr91 to ptr
  %partial_reduction_result93 = load float, ptr %57, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result93, i32 16, i32 31)
  store float %58, ptr %result_from_other_lane92, align 4
  call void @region_1_12__1(ptr %57, ptr %result_from_other_lane92, ptr %return_buffer94)
  %59 = load float, ptr %return_buffer94, align 4
  store float %59, ptr %57, align 4
  %partial_reduction_result96 = load float, ptr %57, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result96, i32 8, i32 31)
  store float %60, ptr %result_from_other_lane95, align 4
  call void @region_1_12__1(ptr %57, ptr %result_from_other_lane95, ptr %return_buffer97)
  %61 = load float, ptr %return_buffer97, align 4
  store float %61, ptr %57, align 4
  %partial_reduction_result99 = load float, ptr %57, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result99, i32 4, i32 31)
  store float %62, ptr %result_from_other_lane98, align 4
  call void @region_1_12__1(ptr %57, ptr %result_from_other_lane98, ptr %return_buffer100)
  %63 = load float, ptr %return_buffer100, align 4
  store float %63, ptr %57, align 4
  %partial_reduction_result102 = load float, ptr %57, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result102, i32 2, i32 31)
  store float %64, ptr %result_from_other_lane101, align 4
  call void @region_1_12__1(ptr %57, ptr %result_from_other_lane101, ptr %return_buffer103)
  %65 = load float, ptr %return_buffer103, align 4
  store float %65, ptr %57, align 4
  %partial_reduction_result105 = load float, ptr %57, align 4
  %66 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result105, i32 1, i32 31)
  store float %66, ptr %result_from_other_lane104, align 4
  call void @region_1_12__1(ptr %57, ptr %result_from_other_lane104, ptr %return_buffer106)
  %67 = load float, ptr %return_buffer106, align 4
  store float %67, ptr %57, align 4
  %68 = icmp ult i32 %thread_id.x, %tile_bound
  %69 = mul i32 %thread_id.y, 2
  %70 = icmp ult i32 %69, %tile_bound4
  %71 = and i1 %70, %68
  %72 = icmp eq i32 %lane_id, 0
  %73 = and i1 %71, %72
  br i1 %73, label %reduction_write_output-true107, label %reduction_write_output-after108

reduction_write_output-after108:                  ; preds = %reduction_write_output-true107, %reduction_write_output-after
  %shmem_output_address111 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache21, i32 0, i32 %9, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %74 = addrspacecast ptr addrspace(3) %shmem_output_address111 to ptr
  %current_output112 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %75 = load float, ptr %current_output112, align 4
  store float %75, ptr %74, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr113 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache21, i32 0, i32 %9, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %76 = addrspacecast ptr addrspace(3) %shmem_transposed_addr113 to ptr
  %partial_reduction_result115 = load float, ptr %76, align 4
  %77 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result115, i32 16, i32 31)
  store float %77, ptr %result_from_other_lane114, align 4
  call void @region_2_19__1(ptr %76, ptr %result_from_other_lane114, ptr %return_buffer116)
  %78 = load float, ptr %return_buffer116, align 4
  store float %78, ptr %76, align 4
  %partial_reduction_result118 = load float, ptr %76, align 4
  %79 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result118, i32 8, i32 31)
  store float %79, ptr %result_from_other_lane117, align 4
  call void @region_2_19__1(ptr %76, ptr %result_from_other_lane117, ptr %return_buffer119)
  %80 = load float, ptr %return_buffer119, align 4
  store float %80, ptr %76, align 4
  %partial_reduction_result121 = load float, ptr %76, align 4
  %81 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result121, i32 4, i32 31)
  store float %81, ptr %result_from_other_lane120, align 4
  call void @region_2_19__1(ptr %76, ptr %result_from_other_lane120, ptr %return_buffer122)
  %82 = load float, ptr %return_buffer122, align 4
  store float %82, ptr %76, align 4
  %partial_reduction_result124 = load float, ptr %76, align 4
  %83 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result124, i32 2, i32 31)
  store float %83, ptr %result_from_other_lane123, align 4
  call void @region_2_19__1(ptr %76, ptr %result_from_other_lane123, ptr %return_buffer125)
  %84 = load float, ptr %return_buffer125, align 4
  store float %84, ptr %76, align 4
  %partial_reduction_result127 = load float, ptr %76, align 4
  %85 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result127, i32 1, i32 31)
  store float %85, ptr %result_from_other_lane126, align 4
  call void @region_2_19__1(ptr %76, ptr %result_from_other_lane126, ptr %return_buffer128)
  %86 = load float, ptr %return_buffer128, align 4
  store float %86, ptr %76, align 4
  %87 = icmp ult i32 %thread_id.x, %tile_bound
  %88 = mul i32 %thread_id.y, 2
  %89 = icmp ult i32 %88, %tile_bound4
  %90 = and i1 %89, %87
  %91 = icmp eq i32 %lane_id, 0
  %92 = and i1 %90, %91
  br i1 %92, label %reduction_write_output-true129, label %reduction_write_output-after130

reduction_write_output-after130:                  ; preds = %reduction_write_output-true129, %reduction_write_output-after108
  %shmem_output_address133 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache21, i32 0, i32 %9, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %93 = addrspacecast ptr addrspace(3) %shmem_output_address133 to ptr
  %current_output134 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 1
  %94 = load float, ptr %current_output134, align 4
  store float %94, ptr %93, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr135 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache21, i32 0, i32 %9, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %95 = addrspacecast ptr addrspace(3) %shmem_transposed_addr135 to ptr
  %partial_reduction_result137 = load float, ptr %95, align 4
  %96 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result137, i32 16, i32 31)
  store float %96, ptr %result_from_other_lane136, align 4
  call void @region_2_19__1(ptr %95, ptr %result_from_other_lane136, ptr %return_buffer138)
  %97 = load float, ptr %return_buffer138, align 4
  store float %97, ptr %95, align 4
  %partial_reduction_result140 = load float, ptr %95, align 4
  %98 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result140, i32 8, i32 31)
  store float %98, ptr %result_from_other_lane139, align 4
  call void @region_2_19__1(ptr %95, ptr %result_from_other_lane139, ptr %return_buffer141)
  %99 = load float, ptr %return_buffer141, align 4
  store float %99, ptr %95, align 4
  %partial_reduction_result143 = load float, ptr %95, align 4
  %100 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result143, i32 4, i32 31)
  store float %100, ptr %result_from_other_lane142, align 4
  call void @region_2_19__1(ptr %95, ptr %result_from_other_lane142, ptr %return_buffer144)
  %101 = load float, ptr %return_buffer144, align 4
  store float %101, ptr %95, align 4
  %partial_reduction_result146 = load float, ptr %95, align 4
  %102 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result146, i32 2, i32 31)
  store float %102, ptr %result_from_other_lane145, align 4
  call void @region_2_19__1(ptr %95, ptr %result_from_other_lane145, ptr %return_buffer147)
  %103 = load float, ptr %return_buffer147, align 4
  store float %103, ptr %95, align 4
  %partial_reduction_result149 = load float, ptr %95, align 4
  %104 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result149, i32 1, i32 31)
  store float %104, ptr %result_from_other_lane148, align 4
  call void @region_2_19__1(ptr %95, ptr %result_from_other_lane148, ptr %return_buffer150)
  %105 = load float, ptr %return_buffer150, align 4
  store float %105, ptr %95, align 4
  %106 = icmp ult i32 %thread_id.x, %tile_bound
  %107 = mul i32 %thread_id.y, 2
  %108 = icmp ult i32 %107, %tile_bound4
  %109 = and i1 %108, %106
  %110 = icmp eq i32 %lane_id, 0
  %111 = and i1 %109, %110
  br i1 %111, label %reduction_write_output-true151, label %reduction_write_output-after152

reduction_write_output-after152:                  ; preds = %reduction_write_output-true151, %reduction_write_output-after130
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %112 = mul nuw nsw i32 %29, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %28, 256
  %115 = add nuw nsw i32 %113, %114
  %116 = mul nuw nsw i32 %tile_origin.0, 131072
  %117 = add nuw nsw i32 %115, %116
  %118 = udiv i32 %117, 1
  %119 = urem i32 %118, 256
  %120 = udiv i32 %117, 256
  %121 = urem i32 %120, 512
  %122 = udiv i32 %117, 131072
  %123 = mul i32 %thread_id.x, 2
  %124 = sub i32 %x_loc, %123
  %125 = mul nuw nsw i32 %119, 1
  %126 = add nuw nsw i32 0, %125
  %127 = udiv i32 %126, 256
  %128 = mul nuw nsw i32 %121, 1
  %129 = add nuw nsw i32 0, %128
  %130 = mul nuw nsw i32 %122, 512
  %131 = add nuw nsw i32 %129, %130
  %132 = udiv i32 %131, 131072
  %Arg_1.2 = getelementptr inbounds [131072 x [256 x float]], ptr %arg1, i32 0, i32 %131, i32 %126
  %Arg_1.26 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %Arg_2.3 = getelementptr inbounds [131072 x [256 x float]], ptr %arg2, i32 0, i32 %131, i32 %126
  %Arg_2.37 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
  %multiply.4 = fmul float %Arg_1.26, %Arg_2.37
  %Arg_0.1 = getelementptr inbounds [131072 x [256 x float]], ptr %arg0, i32 0, i32 %131, i32 %126
  %Arg_0.18 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  %multiply.5 = fmul float %multiply.4, %Arg_0.18
  %region_0_25_constant_6 = load float, ptr @13, align 4
  %Arg_0.19 = getelementptr inbounds [131072 x [256 x float]], ptr %arg0, i32 0, i32 %131, i32 %126
  %Arg_0.110 = load float, ptr %Arg_0.19, align 4, !invariant.load !98
  %subtract.8 = fsub float %region_0_25_constant_6, %Arg_0.110
  %multiply.9 = fmul float %multiply.5, %subtract.8
  store float %multiply.9, ptr %reduction_input_address, align 4
  %133 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %124
  call void @region_1_12__1(ptr %133, ptr %reduction_input_address, ptr %return_buffer)
  %134 = load float, ptr %return_buffer, align 4
  store float %134, ptr %133, align 4
  %135 = mul nuw nsw i32 %119, 1
  %136 = add nuw nsw i32 0, %135
  %137 = udiv i32 %136, 256
  %138 = mul nuw nsw i32 %121, 1
  %139 = add nuw nsw i32 0, %138
  %140 = mul nuw nsw i32 %122, 512
  %141 = add nuw nsw i32 %139, %140
  %142 = udiv i32 %141, 131072
  %Arg_1.211 = getelementptr inbounds [131072 x [256 x float]], ptr %arg1, i32 0, i32 %141, i32 %136
  %Arg_1.212 = load float, ptr %Arg_1.211, align 4, !invariant.load !98
  %Arg_0.113 = getelementptr inbounds [131072 x [256 x float]], ptr %arg0, i32 0, i32 %141, i32 %136
  %Arg_0.114 = load float, ptr %Arg_0.113, align 4, !invariant.load !98
  %multiply.17 = fmul float %Arg_1.212, %Arg_0.114
  store float %multiply.17, ptr %reduction_input_address1, align 4
  %143 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %124
  call void @region_2_19__1(ptr %143, ptr %reduction_input_address1, ptr %return_buffer15)
  %144 = load float, ptr %return_buffer15, align 4
  store float %144, ptr %143, align 4
  %145 = mul nuw nsw i32 %119, 1
  %146 = add nuw nsw i32 0, %145
  %147 = udiv i32 %146, 256
  %148 = mul nuw nsw i32 %121, 1
  %149 = add nuw nsw i32 0, %148
  %150 = mul nuw nsw i32 %122, 512
  %151 = add nuw nsw i32 %149, %150
  %152 = udiv i32 %151, 131072
  %Arg_1.216 = getelementptr inbounds float, ptr %arg1, i32 %117
  %Arg_1.217 = load float, ptr %Arg_1.216, align 4, !invariant.load !98
  %Arg_2.318 = getelementptr inbounds float, ptr %arg2, i32 %117
  %Arg_2.319 = load float, ptr %Arg_2.318, align 4, !invariant.load !98
  %multiply.420 = fmul float %Arg_1.217, %Arg_2.319
  %Arg_0.121 = getelementptr inbounds float, ptr %arg0, i32 %117
  %Arg_0.122 = load float, ptr %Arg_0.121, align 4, !invariant.load !98
  %multiply.523 = fmul float %multiply.420, %Arg_0.122
  %region_0_25_constant_624 = load float, ptr @13, align 4
  %Arg_0.125 = getelementptr inbounds float, ptr %arg0, i32 %117
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !98
  %subtract.827 = fsub float %region_0_25_constant_624, %Arg_0.126
  %multiply.928 = fmul float %multiply.523, %subtract.827
  %153 = mul nuw nsw i32 %119, 1
  %154 = add nuw nsw i32 0, %153
  %155 = udiv i32 %154, 256
  %156 = mul nuw nsw i32 %121, 1
  %157 = add nuw nsw i32 0, %156
  %158 = mul nuw nsw i32 %122, 512
  %159 = add nuw nsw i32 %157, %158
  %160 = udiv i32 %159, 131072
  %Arg_1.229 = getelementptr inbounds float, ptr %arg1, i32 %117
  %Arg_1.230 = load float, ptr %Arg_1.229, align 4, !invariant.load !98
  %Arg_0.131 = getelementptr inbounds float, ptr %arg0, i32 %117
  %Arg_0.132 = load float, ptr %Arg_0.131, align 4, !invariant.load !98
  %multiply.1733 = fmul float %Arg_1.230, %Arg_0.132
  %161 = mul nuw nsw i32 %119, 1
  %162 = add nuw nsw i32 0, %161
  %163 = udiv i32 %162, 256
  %164 = mul nuw nsw i32 %121, 1
  %165 = add nuw nsw i32 0, %164
  %166 = mul nuw nsw i32 %122, 512
  %167 = add nuw nsw i32 %165, %166
  %168 = udiv i32 %167, 131072
  %169 = getelementptr inbounds [131072 x [256 x float]], ptr %arg4, i32 0, i32 %167, i32 %162
  store float %multiply.928, ptr %169, align 4
  %170 = mul nuw nsw i32 %119, 1
  %171 = add nuw nsw i32 0, %170
  %172 = udiv i32 %171, 256
  %173 = mul nuw nsw i32 %121, 1
  %174 = add nuw nsw i32 0, %173
  %175 = mul nuw nsw i32 %122, 512
  %176 = add nuw nsw i32 %174, %175
  %177 = udiv i32 %176, 131072
  %178 = getelementptr inbounds [131072 x [256 x float]], ptr %arg6, i32 0, i32 %176, i32 %171
  store float %multiply.1733, ptr %178, align 4
  br label %x_in_tile-after

x_in_tile-true35:                                 ; preds = %x_in_tile-after
  %179 = mul nuw nsw i32 %34, 1
  %180 = add nuw nsw i32 0, %179
  %181 = mul nuw nsw i32 %33, 256
  %182 = add nuw nsw i32 %180, %181
  %183 = mul nuw nsw i32 %tile_origin.0, 131072
  %184 = add nuw nsw i32 %182, %183
  %185 = udiv i32 %184, 1
  %186 = urem i32 %185, 256
  %187 = udiv i32 %184, 256
  %188 = urem i32 %187, 512
  %189 = udiv i32 %184, 131072
  %190 = mul i32 %thread_id.x, 2
  %191 = sub i32 %x_loc34, %190
  %192 = mul nuw nsw i32 %186, 1
  %193 = add nuw nsw i32 0, %192
  %194 = udiv i32 %193, 256
  %195 = mul nuw nsw i32 %188, 1
  %196 = add nuw nsw i32 0, %195
  %197 = mul nuw nsw i32 %189, 512
  %198 = add nuw nsw i32 %196, %197
  %199 = udiv i32 %198, 131072
  %Arg_1.237 = getelementptr inbounds [131072 x [256 x float]], ptr %arg1, i32 0, i32 %198, i32 %193
  %Arg_1.238 = load float, ptr %Arg_1.237, align 4, !invariant.load !98
  %Arg_2.339 = getelementptr inbounds [131072 x [256 x float]], ptr %arg2, i32 0, i32 %198, i32 %193
  %Arg_2.340 = load float, ptr %Arg_2.339, align 4, !invariant.load !98
  %multiply.441 = fmul float %Arg_1.238, %Arg_2.340
  %Arg_0.142 = getelementptr inbounds [131072 x [256 x float]], ptr %arg0, i32 0, i32 %198, i32 %193
  %Arg_0.143 = load float, ptr %Arg_0.142, align 4, !invariant.load !98
  %multiply.544 = fmul float %multiply.441, %Arg_0.143
  %region_0_25_constant_645 = load float, ptr @13, align 4
  %Arg_0.146 = getelementptr inbounds [131072 x [256 x float]], ptr %arg0, i32 0, i32 %198, i32 %193
  %Arg_0.147 = load float, ptr %Arg_0.146, align 4, !invariant.load !98
  %subtract.848 = fsub float %region_0_25_constant_645, %Arg_0.147
  %multiply.949 = fmul float %multiply.544, %subtract.848
  store float %multiply.949, ptr %reduction_input_address, align 4
  %200 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %191
  call void @region_1_12__1(ptr %200, ptr %reduction_input_address, ptr %return_buffer50)
  %201 = load float, ptr %return_buffer50, align 4
  store float %201, ptr %200, align 4
  %202 = mul nuw nsw i32 %186, 1
  %203 = add nuw nsw i32 0, %202
  %204 = udiv i32 %203, 256
  %205 = mul nuw nsw i32 %188, 1
  %206 = add nuw nsw i32 0, %205
  %207 = mul nuw nsw i32 %189, 512
  %208 = add nuw nsw i32 %206, %207
  %209 = udiv i32 %208, 131072
  %Arg_1.251 = getelementptr inbounds [131072 x [256 x float]], ptr %arg1, i32 0, i32 %208, i32 %203
  %Arg_1.252 = load float, ptr %Arg_1.251, align 4, !invariant.load !98
  %Arg_0.153 = getelementptr inbounds [131072 x [256 x float]], ptr %arg0, i32 0, i32 %208, i32 %203
  %Arg_0.154 = load float, ptr %Arg_0.153, align 4, !invariant.load !98
  %multiply.1755 = fmul float %Arg_1.252, %Arg_0.154
  store float %multiply.1755, ptr %reduction_input_address1, align 4
  %210 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %191
  call void @region_2_19__1(ptr %210, ptr %reduction_input_address1, ptr %return_buffer56)
  %211 = load float, ptr %return_buffer56, align 4
  store float %211, ptr %210, align 4
  %212 = mul nuw nsw i32 %186, 1
  %213 = add nuw nsw i32 0, %212
  %214 = udiv i32 %213, 256
  %215 = mul nuw nsw i32 %188, 1
  %216 = add nuw nsw i32 0, %215
  %217 = mul nuw nsw i32 %189, 512
  %218 = add nuw nsw i32 %216, %217
  %219 = udiv i32 %218, 131072
  %Arg_1.257 = getelementptr inbounds float, ptr %arg1, i32 %184
  %Arg_1.258 = load float, ptr %Arg_1.257, align 4, !invariant.load !98
  %Arg_2.359 = getelementptr inbounds float, ptr %arg2, i32 %184
  %Arg_2.360 = load float, ptr %Arg_2.359, align 4, !invariant.load !98
  %multiply.461 = fmul float %Arg_1.258, %Arg_2.360
  %Arg_0.162 = getelementptr inbounds float, ptr %arg0, i32 %184
  %Arg_0.163 = load float, ptr %Arg_0.162, align 4, !invariant.load !98
  %multiply.564 = fmul float %multiply.461, %Arg_0.163
  %region_0_25_constant_665 = load float, ptr @13, align 4
  %Arg_0.166 = getelementptr inbounds float, ptr %arg0, i32 %184
  %Arg_0.167 = load float, ptr %Arg_0.166, align 4, !invariant.load !98
  %subtract.868 = fsub float %region_0_25_constant_665, %Arg_0.167
  %multiply.969 = fmul float %multiply.564, %subtract.868
  %220 = mul nuw nsw i32 %186, 1
  %221 = add nuw nsw i32 0, %220
  %222 = udiv i32 %221, 256
  %223 = mul nuw nsw i32 %188, 1
  %224 = add nuw nsw i32 0, %223
  %225 = mul nuw nsw i32 %189, 512
  %226 = add nuw nsw i32 %224, %225
  %227 = udiv i32 %226, 131072
  %Arg_1.270 = getelementptr inbounds float, ptr %arg1, i32 %184
  %Arg_1.271 = load float, ptr %Arg_1.270, align 4, !invariant.load !98
  %Arg_0.172 = getelementptr inbounds float, ptr %arg0, i32 %184
  %Arg_0.173 = load float, ptr %Arg_0.172, align 4, !invariant.load !98
  %multiply.1774 = fmul float %Arg_1.271, %Arg_0.173
  %228 = mul nuw nsw i32 %186, 1
  %229 = add nuw nsw i32 0, %228
  %230 = udiv i32 %229, 256
  %231 = mul nuw nsw i32 %188, 1
  %232 = add nuw nsw i32 0, %231
  %233 = mul nuw nsw i32 %189, 512
  %234 = add nuw nsw i32 %232, %233
  %235 = udiv i32 %234, 131072
  %236 = getelementptr inbounds [131072 x [256 x float]], ptr %arg4, i32 0, i32 %234, i32 %229
  store float %multiply.969, ptr %236, align 4
  %237 = mul nuw nsw i32 %186, 1
  %238 = add nuw nsw i32 0, %237
  %239 = udiv i32 %238, 256
  %240 = mul nuw nsw i32 %188, 1
  %241 = add nuw nsw i32 0, %240
  %242 = mul nuw nsw i32 %189, 512
  %243 = add nuw nsw i32 %241, %242
  %244 = udiv i32 %243, 131072
  %245 = getelementptr inbounds [131072 x [256 x float]], ptr %arg6, i32 0, i32 %243, i32 %238
  store float %multiply.1774, ptr %245, align 4
  br label %x_in_tile-after36

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %246 = mul i32 %thread_id.y, 2
  %247 = add i32 %tile_origin.1, %thread_id.x
  %248 = add i32 %tile_origin.2, %246
  %249 = add i32 %248, 0
  %250 = mul i32 %tile_origin.0, 256
  %251 = add i32 %250, %249
  %252 = udiv i32 %251, 1
  %253 = urem i32 %252, 256
  %254 = udiv i32 %251, 256
  %output_element_address = getelementptr inbounds [256 x [256 x float]], ptr %arg3, i32 0, i32 %254, i32 %253
  %output = load float, ptr %38, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true107:                   ; preds = %reduction_write_output-after
  %255 = mul i32 %thread_id.y, 2
  %256 = add i32 %tile_origin.1, %thread_id.x
  %257 = add i32 %tile_origin.2, %255
  %258 = add i32 %257, 1
  %259 = mul i32 %tile_origin.0, 256
  %260 = add i32 %259, %258
  %261 = udiv i32 %260, 1
  %262 = urem i32 %261, 256
  %263 = udiv i32 %260, 256
  %output_element_address109 = getelementptr inbounds [256 x [256 x float]], ptr %arg3, i32 0, i32 %263, i32 %262
  %output110 = load float, ptr %57, align 4
  store float %output110, ptr %output_element_address109, align 4
  br label %reduction_write_output-after108

reduction_write_output-true129:                   ; preds = %reduction_write_output-after108
  %264 = mul i32 %thread_id.y, 2
  %265 = add i32 %tile_origin.1, %thread_id.x
  %266 = add i32 %tile_origin.2, %264
  %267 = add i32 %266, 0
  %268 = mul i32 %tile_origin.0, 256
  %269 = add i32 %268, %267
  %270 = udiv i32 %269, 1
  %271 = urem i32 %270, 256
  %272 = udiv i32 %269, 256
  %output_element_address131 = getelementptr inbounds [256 x [256 x float]], ptr %arg5, i32 0, i32 %272, i32 %271
  %output132 = load float, ptr %76, align 4
  store float %output132, ptr %output_element_address131, align 4
  br label %reduction_write_output-after130

reduction_write_output-true151:                   ; preds = %reduction_write_output-after130
  %273 = mul i32 %thread_id.y, 2
  %274 = add i32 %tile_origin.1, %thread_id.x
  %275 = add i32 %tile_origin.2, %273
  %276 = add i32 %275, 1
  %277 = mul i32 %tile_origin.0, 256
  %278 = add i32 %277, %276
  %279 = udiv i32 %278, 1
  %280 = urem i32 %279, 256
  %281 = udiv i32 %278, 256
  %output_element_address153 = getelementptr inbounds [256 x [256 x float]], ptr %arg5, i32 0, i32 %281, i32 %280
  %output154 = load float, ptr %95, align 4
  store float %output154, ptr %output_element_address153, align 4
  br label %reduction_write_output-after152
}

define internal void @region_1_12__1(ptr dereferenceable(4) %Arg_0.13.typed, ptr dereferenceable(4) %Arg_1.14.typed, ptr dereferenceable(4) %output_arg) {
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

define internal void @region_2_19__1(ptr dereferenceable(4) %Arg_0.20.typed, ptr dereferenceable(4) %Arg_1.21.typed, ptr dereferenceable(4) %output_arg) {
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

define void @fusion_38(ptr noalias align 128 dereferenceable(67108864) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1) {
entry:
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer9 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_9_constant_3 = load float, ptr @15, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_9_constant_3, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_9_constant_3, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !160
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 512
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 2
  %14 = udiv i32 %9, 2
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 2
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 512, i32 4096
  %18 = icmp eq i32 %13, 1
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
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
  %x_loc4 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc4
  %33 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %33, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !161

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !162

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache22, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache22, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_4__1(ptr %36, ptr %result_from_other_lane, ptr %return_buffer11)
  %38 = load float, ptr %return_buffer11, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result13 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane12, align 4
  call void @region_1_4__1(ptr %36, ptr %result_from_other_lane12, ptr %return_buffer14)
  %40 = load float, ptr %return_buffer14, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result16 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane15, align 4
  call void @region_1_4__1(ptr %36, ptr %result_from_other_lane15, ptr %return_buffer17)
  %42 = load float, ptr %return_buffer17, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result19 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane18, align 4
  call void @region_1_4__1(ptr %36, ptr %result_from_other_lane18, ptr %return_buffer20)
  %44 = load float, ptr %return_buffer20, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result22 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane21, align 4
  call void @region_1_4__1(ptr %36, ptr %result_from_other_lane21, ptr %return_buffer23)
  %46 = load float, ptr %return_buffer23, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache22, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output25, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache22, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane27, align 4
  call void @region_1_4__1(ptr %55, ptr %result_from_other_lane27, ptr %return_buffer29)
  %57 = load float, ptr %return_buffer29, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result31 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane30, align 4
  call void @region_1_4__1(ptr %55, ptr %result_from_other_lane30, ptr %return_buffer32)
  %59 = load float, ptr %return_buffer32, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result34 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane33, align 4
  call void @region_1_4__1(ptr %55, ptr %result_from_other_lane33, ptr %return_buffer35)
  %61 = load float, ptr %return_buffer35, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result37 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane36, align 4
  call void @region_1_4__1(ptr %55, ptr %result_from_other_lane36, ptr %return_buffer38)
  %63 = load float, ptr %return_buffer38, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result40 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane39, align 4
  call void @region_1_4__1(ptr %55, ptr %result_from_other_lane39, ptr %return_buffer41)
  %65 = load float, ptr %return_buffer41, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 128
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 65536
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 128
  %80 = udiv i32 %77, 128
  %81 = urem i32 %80, 512
  %82 = udiv i32 %77, 65536
  %83 = mul i32 %thread_id.x, 2
  %84 = sub i32 %x_loc, %83
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 128
  %88 = mul nuw nsw i32 %81, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 512
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 131072
  %Arg_0.1 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %91, i32 %86
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %93 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %84
  call void @region_1_4__1(ptr %93, ptr %reduction_input_address, ptr %return_buffer)
  %94 = load float, ptr %return_buffer, align 4
  store float %94, ptr %93, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %95 = mul nuw nsw i32 %32, 1
  %96 = add nuw nsw i32 0, %95
  %97 = mul nuw nsw i32 %31, 128
  %98 = add nuw nsw i32 %96, %97
  %99 = mul nuw nsw i32 %tile_origin.0, 65536
  %100 = add nuw nsw i32 %98, %99
  %101 = udiv i32 %100, 1
  %102 = urem i32 %101, 128
  %103 = udiv i32 %100, 128
  %104 = urem i32 %103, 512
  %105 = udiv i32 %100, 65536
  %106 = mul i32 %thread_id.x, 2
  %107 = sub i32 %x_loc4, %106
  %108 = mul nuw nsw i32 %102, 1
  %109 = add nuw nsw i32 0, %108
  %110 = udiv i32 %109, 128
  %111 = mul nuw nsw i32 %104, 1
  %112 = add nuw nsw i32 0, %111
  %113 = mul nuw nsw i32 %105, 512
  %114 = add nuw nsw i32 %112, %113
  %115 = udiv i32 %114, 131072
  %Arg_0.17 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %114, i32 %109
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !98
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %116 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %107
  call void @region_1_4__1(ptr %116, ptr %reduction_input_address, ptr %return_buffer9)
  %117 = load float, ptr %return_buffer9, align 4
  store float %117, ptr %116, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %118 = mul i32 %thread_id.y, 2
  %119 = add i32 %tile_origin.1, %thread_id.x
  %120 = add i32 %tile_origin.2, %118
  %121 = add i32 %120, 0
  %122 = mul i32 %tile_origin.0, 128
  %123 = add i32 %122, %121
  %124 = udiv i32 %123, 1
  %125 = urem i32 %124, 128
  %126 = udiv i32 %123, 128
  %output_element_address = getelementptr inbounds [256 x [128 x float]], ptr %arg1, i32 0, i32 %126, i32 %125
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %127 = mul i32 %thread_id.y, 2
  %128 = add i32 %tile_origin.1, %thread_id.x
  %129 = add i32 %tile_origin.2, %127
  %130 = add i32 %129, 1
  %131 = mul i32 %tile_origin.0, 128
  %132 = add i32 %131, %130
  %133 = udiv i32 %132, 1
  %134 = urem i32 %133, 128
  %135 = udiv i32 %132, 128
  %output_element_address44 = getelementptr inbounds [256 x [128 x float]], ptr %arg1, i32 0, i32 %135, i32 %134
  %output45 = load float, ptr %55, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43
}

define internal void @region_1_4__1(ptr dereferenceable(4) %Arg_0.5.typed, ptr dereferenceable(4) %Arg_1.6.typed, ptr dereferenceable(4) %output_arg) {
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

define void @reduce_541(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(512) %arg2) {
entry:
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer9 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !98
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 2
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 2
  %14 = udiv i32 %9, 2
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 2
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 256, i32 4096
  %18 = icmp eq i32 %13, 1
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
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
  %x_loc4 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc4
  %33 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %33, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !164

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !165

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache23, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache23, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane, ptr %return_buffer11)
  %38 = load float, ptr %return_buffer11, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result13 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane12, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane12, ptr %return_buffer14)
  %40 = load float, ptr %return_buffer14, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result16 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane15, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane15, ptr %return_buffer17)
  %42 = load float, ptr %return_buffer17, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result19 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane18, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane18, ptr %return_buffer20)
  %44 = load float, ptr %return_buffer20, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result22 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane21, align 4
  call void @region_1_3(ptr %36, ptr %result_from_other_lane21, ptr %return_buffer23)
  %46 = load float, ptr %return_buffer23, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache23, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output25, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache23, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane27, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane27, ptr %return_buffer29)
  %57 = load float, ptr %return_buffer29, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result31 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane30, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane30, ptr %return_buffer32)
  %59 = load float, ptr %return_buffer32, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result34 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane33, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane33, ptr %return_buffer35)
  %61 = load float, ptr %return_buffer35, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result37 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane36, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane36, ptr %return_buffer38)
  %63 = load float, ptr %return_buffer38, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result40 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane39, align 4
  call void @region_1_3(ptr %55, ptr %result_from_other_lane39, ptr %return_buffer41)
  %65 = load float, ptr %return_buffer41, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul i32 %thread_id.x, 2
  %73 = sub i32 %x_loc, %72
  %Arg_0.1 = getelementptr inbounds [256 x [128 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %74 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %73
  call void @region_1_3(ptr %74, ptr %reduction_input_address, ptr %return_buffer)
  %75 = load float, ptr %return_buffer, align 4
  store float %75, ptr %74, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %76 = mul i32 %thread_id.x, 2
  %77 = sub i32 %x_loc4, %76
  %Arg_0.17 = getelementptr inbounds [256 x [128 x float]], ptr %arg0, i32 0, i32 %31, i32 %32
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !98
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %78 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %77
  call void @region_1_3(ptr %78, ptr %reduction_input_address, ptr %return_buffer9)
  %79 = load float, ptr %return_buffer9, align 4
  store float %79, ptr %78, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %80 = mul i32 %thread_id.y, 2
  %81 = add i32 %tile_origin.1, %thread_id.x
  %82 = add i32 %tile_origin.2, %80
  %83 = add i32 %82, 0
  %84 = mul i32 %tile_origin.0, 128
  %85 = add i32 %84, %83
  %86 = udiv i32 %85, 1
  %output_element_address = getelementptr inbounds [128 x float], ptr %arg2, i32 0, i32 %86
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %87 = mul i32 %thread_id.y, 2
  %88 = add i32 %tile_origin.1, %thread_id.x
  %89 = add i32 %tile_origin.2, %87
  %90 = add i32 %89, 1
  %91 = mul i32 %tile_origin.0, 128
  %92 = add i32 %91, %90
  %93 = udiv i32 %92, 1
  %output_element_address44 = getelementptr inbounds [128 x float], ptr %arg2, i32 0, i32 %93
  %output45 = load float, ptr %55, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43
}

define internal void @region_1_3(ptr dereferenceable(4) %Arg_0.4.typed, ptr dereferenceable(4) %Arg_1.5.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.6.typed = alloca float, align 4
  %Arg_0.4 = load float, ptr %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, ptr %Arg_1.5.typed, align 4
  %add.6 = fadd float %Arg_0.4, %Arg_1.5
  store float %add.6, ptr %add.6.typed, align 4
  %load_ret_value = load float, ptr %add.6.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_37(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 128 dereferenceable(512) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !99
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 128
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 128
  br i1 %4, label %fusion_37.in_bounds-true, label %fusion_37.in_bounds-after

fusion_37.in_bounds-after:                        ; preds = %fusion_37.in_bounds-true, %entry
  ret void

fusion_37.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !98
  %7 = load float, ptr %arg2, align 4, !invariant.load !98
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.5 = fmul float %7, %9
  %subtract.6 = fsub float %6, %multiply.5
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %10, align 4
  br label %fusion_37.in_bounds-after
}

define void @fusion_36(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !120
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_36.in_bounds-true, label %fusion_36.in_bounds-after

fusion_36.in_bounds-after:                        ; preds = %fusion_36.in_bounds-true, %entry
  ret void

fusion_36.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_36.in_bounds-after
}

define void @fusion_104(ptr noalias align 128 dereferenceable(262144) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(262144) %arg2, ptr noalias align 128 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 128 dereferenceable(1024) %arg5, ptr noalias align 128 dereferenceable(1024) %arg6, ptr noalias align 128 dereferenceable(1024) %arg7, ptr noalias align 128 dereferenceable(1024) %arg8) {
entry:
  %return_buffer278 = alloca float, align 4
  %result_from_other_lane276 = alloca float, align 4
  %return_buffer275 = alloca float, align 4
  %result_from_other_lane273 = alloca float, align 4
  %return_buffer272 = alloca float, align 4
  %result_from_other_lane270 = alloca float, align 4
  %return_buffer269 = alloca float, align 4
  %result_from_other_lane267 = alloca float, align 4
  %return_buffer266 = alloca float, align 4
  %result_from_other_lane264 = alloca float, align 4
  %return_buffer256 = alloca float, align 4
  %result_from_other_lane254 = alloca float, align 4
  %return_buffer253 = alloca float, align 4
  %result_from_other_lane251 = alloca float, align 4
  %return_buffer250 = alloca float, align 4
  %result_from_other_lane248 = alloca float, align 4
  %return_buffer247 = alloca float, align 4
  %result_from_other_lane245 = alloca float, align 4
  %return_buffer244 = alloca float, align 4
  %result_from_other_lane242 = alloca float, align 4
  %return_buffer238 = alloca float, align 4
  %return_buffer232 = alloca float, align 4
  %tile_loop.invar_address225 = alloca i32, align 4
  %y_in_tile.invar_address219 = alloca i32, align 4
  %partial_reduction_result205 = alloca float, i32 2, align 4
  %reduction_input_address204 = alloca float, align 4
  %return_buffer199 = alloca float, align 4
  %result_from_other_lane197 = alloca float, align 4
  %return_buffer196 = alloca float, align 4
  %result_from_other_lane194 = alloca float, align 4
  %return_buffer193 = alloca float, align 4
  %result_from_other_lane191 = alloca float, align 4
  %return_buffer190 = alloca float, align 4
  %result_from_other_lane188 = alloca float, align 4
  %return_buffer187 = alloca float, align 4
  %result_from_other_lane185 = alloca float, align 4
  %return_buffer177 = alloca float, align 4
  %result_from_other_lane175 = alloca float, align 4
  %return_buffer174 = alloca float, align 4
  %result_from_other_lane172 = alloca float, align 4
  %return_buffer171 = alloca float, align 4
  %result_from_other_lane169 = alloca float, align 4
  %return_buffer168 = alloca float, align 4
  %result_from_other_lane166 = alloca float, align 4
  %return_buffer165 = alloca float, align 4
  %result_from_other_lane163 = alloca float, align 4
  %return_buffer159 = alloca float, align 4
  %return_buffer153 = alloca float, align 4
  %tile_loop.invar_address146 = alloca i32, align 4
  %y_in_tile.invar_address140 = alloca i32, align 4
  %partial_reduction_result126 = alloca float, i32 2, align 4
  %reduction_input_address125 = alloca float, align 4
  %return_buffer120 = alloca float, align 4
  %result_from_other_lane118 = alloca float, align 4
  %return_buffer117 = alloca float, align 4
  %result_from_other_lane115 = alloca float, align 4
  %return_buffer114 = alloca float, align 4
  %result_from_other_lane112 = alloca float, align 4
  %return_buffer111 = alloca float, align 4
  %result_from_other_lane109 = alloca float, align 4
  %return_buffer108 = alloca float, align 4
  %result_from_other_lane106 = alloca float, align 4
  %return_buffer98 = alloca float, align 4
  %result_from_other_lane96 = alloca float, align 4
  %return_buffer95 = alloca float, align 4
  %result_from_other_lane93 = alloca float, align 4
  %return_buffer92 = alloca float, align 4
  %result_from_other_lane90 = alloca float, align 4
  %return_buffer89 = alloca float, align 4
  %result_from_other_lane87 = alloca float, align 4
  %return_buffer86 = alloca float, align 4
  %result_from_other_lane84 = alloca float, align 4
  %return_buffer80 = alloca float, align 4
  %return_buffer74 = alloca float, align 4
  %tile_loop.invar_address67 = alloca i32, align 4
  %y_in_tile.invar_address61 = alloca i32, align 4
  %partial_reduction_result47 = alloca float, i32 2, align 4
  %reduction_input_address46 = alloca float, align 4
  %return_buffer41 = alloca float, align 4
  %result_from_other_lane39 = alloca float, align 4
  %return_buffer38 = alloca float, align 4
  %result_from_other_lane36 = alloca float, align 4
  %return_buffer35 = alloca float, align 4
  %result_from_other_lane33 = alloca float, align 4
  %return_buffer32 = alloca float, align 4
  %result_from_other_lane30 = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane15 = alloca float, align 4
  %return_buffer14 = alloca float, align 4
  %result_from_other_lane12 = alloca float, align 4
  %return_buffer11 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer9 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !128
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after122, %reduce-group-0-after
  %3 = icmp eq i32 %0, 2
  br i1 %3, label %reduce-group-2-true, label %reduce-group-2-after

reduce-group-2-after:                             ; preds = %reduction_write_output-after201, %reduce-group-1-after
  %4 = icmp eq i32 %0, 3
  br i1 %4, label %reduce-group-3-true, label %reduce-group-3-after

reduce-group-3-after:                             ; preds = %reduction_write_output-after280, %reduce-group-2-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !98
  %5 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %5, align 4
  %6 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %6, align 4
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !128
  %9 = urem i32 %7, 1024
  %10 = udiv i32 %7, 1024
  %11 = mul i32 %8, 1
  %12 = add i32 %11, %10
  %13 = icmp ult i32 %12, 4
  br i1 %13, label %14, label %early_return

14:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %9, 32
  %thread_id.y = udiv i32 %9, 32
  %lane_id = urem i32 %9, 32
  %15 = udiv i32 %12, 1
  %16 = urem i32 %15, 4
  %17 = udiv i32 %12, 4
  %18 = urem i32 %17, 1
  %19 = udiv i32 %12, 4
  %20 = icmp eq i32 %18, 0
  %tile_bound = select i1 %20, i32 256, i32 4096
  %21 = icmp eq i32 %16, 3
  %tile_bound1 = select i1 %21, i32 64, i32 64
  %tile_origin.0 = mul i32 %19, 1
  %tile_origin.1 = mul i32 %18, 4096
  %tile_origin.2 = mul i32 %16, 64
  store i32 %thread_id.y, ptr %y_in_tile.invar_address, align 4
  br label %y_in_tile.loop_header

y_in_tile.loop_header:                            ; preds = %tile_loop.loop_exit, %14
  %y_in_tile.indvar = load i32, ptr %y_in_tile.invar_address, align 4
  %22 = icmp uge i32 %y_in_tile.indvar, %tile_bound
  br i1 %22, label %y_in_tile.loop_exit, label %y_in_tile.loop_body

y_in_tile.loop_body:                              ; preds = %y_in_tile.loop_header
  %invar.inc = add nuw nsw i32 %y_in_tile.indvar, 32
  store i32 %invar.inc, ptr %y_in_tile.invar_address, align 4
  %23 = icmp eq i32 %y_in_tile.indvar, %thread_id.y
  %24 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %25 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %25, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %26 = icmp eq i32 %tile_loop.indvar, 0
  %27 = mul i32 %tile_loop.indvar, 2
  %28 = add i32 %27, 0
  %x_loc = add i32 %28, %24
  %29 = add i32 %tile_origin.1, %y_in_tile.indvar
  %30 = add i32 %tile_origin.2, %x_loc
  %31 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %31, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %32 = mul i32 %tile_loop.indvar, 2
  %33 = add i32 %32, 1
  %x_loc4 = add i32 %33, %24
  %34 = add i32 %tile_origin.1, %y_in_tile.indvar
  %35 = add i32 %tile_origin.2, %x_loc4
  %36 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %36, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !166

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !167

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache24, i32 0, i32 %10, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %37 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %38 = load float, ptr %current_output, align 4
  store float %38, ptr %37, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache24, i32 0, i32 %10, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %39 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %39, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %40, ptr %result_from_other_lane, align 4
  call void @region_1_6__2(ptr %39, ptr %result_from_other_lane, ptr %return_buffer11)
  %41 = load float, ptr %return_buffer11, align 4
  store float %41, ptr %39, align 4
  %partial_reduction_result13 = load float, ptr %39, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %42, ptr %result_from_other_lane12, align 4
  call void @region_1_6__2(ptr %39, ptr %result_from_other_lane12, ptr %return_buffer14)
  %43 = load float, ptr %return_buffer14, align 4
  store float %43, ptr %39, align 4
  %partial_reduction_result16 = load float, ptr %39, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %44, ptr %result_from_other_lane15, align 4
  call void @region_1_6__2(ptr %39, ptr %result_from_other_lane15, ptr %return_buffer17)
  %45 = load float, ptr %return_buffer17, align 4
  store float %45, ptr %39, align 4
  %partial_reduction_result19 = load float, ptr %39, align 4
  %46 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %46, ptr %result_from_other_lane18, align 4
  call void @region_1_6__2(ptr %39, ptr %result_from_other_lane18, ptr %return_buffer20)
  %47 = load float, ptr %return_buffer20, align 4
  store float %47, ptr %39, align 4
  %partial_reduction_result22 = load float, ptr %39, align 4
  %48 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %48, ptr %result_from_other_lane21, align 4
  call void @region_1_6__2(ptr %39, ptr %result_from_other_lane21, ptr %return_buffer23)
  %49 = load float, ptr %return_buffer23, align 4
  store float %49, ptr %39, align 4
  %50 = icmp ult i32 %thread_id.x, %tile_bound
  %51 = mul i32 %thread_id.y, 2
  %52 = icmp ult i32 %51, %tile_bound1
  %53 = and i1 %52, %50
  %54 = icmp eq i32 %lane_id, 0
  %55 = and i1 %53, %54
  br i1 %55, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache24, i32 0, i32 %10, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %56 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %57 = load float, ptr %current_output25, align 4
  store float %57, ptr %56, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache24, i32 0, i32 %10, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %58 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %58, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %59, ptr %result_from_other_lane27, align 4
  call void @region_1_6__2(ptr %58, ptr %result_from_other_lane27, ptr %return_buffer29)
  %60 = load float, ptr %return_buffer29, align 4
  store float %60, ptr %58, align 4
  %partial_reduction_result31 = load float, ptr %58, align 4
  %61 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %61, ptr %result_from_other_lane30, align 4
  call void @region_1_6__2(ptr %58, ptr %result_from_other_lane30, ptr %return_buffer32)
  %62 = load float, ptr %return_buffer32, align 4
  store float %62, ptr %58, align 4
  %partial_reduction_result34 = load float, ptr %58, align 4
  %63 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %63, ptr %result_from_other_lane33, align 4
  call void @region_1_6__2(ptr %58, ptr %result_from_other_lane33, ptr %return_buffer35)
  %64 = load float, ptr %return_buffer35, align 4
  store float %64, ptr %58, align 4
  %partial_reduction_result37 = load float, ptr %58, align 4
  %65 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %65, ptr %result_from_other_lane36, align 4
  call void @region_1_6__2(ptr %58, ptr %result_from_other_lane36, ptr %return_buffer38)
  %66 = load float, ptr %return_buffer38, align 4
  store float %66, ptr %58, align 4
  %partial_reduction_result40 = load float, ptr %58, align 4
  %67 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %67, ptr %result_from_other_lane39, align 4
  call void @region_1_6__2(ptr %58, ptr %result_from_other_lane39, ptr %return_buffer41)
  %68 = load float, ptr %return_buffer41, align 4
  store float %68, ptr %58, align 4
  %69 = icmp ult i32 %thread_id.x, %tile_bound
  %70 = mul i32 %thread_id.y, 2
  %71 = icmp ult i32 %70, %tile_bound1
  %72 = and i1 %71, %69
  %73 = icmp eq i32 %lane_id, 0
  %74 = and i1 %72, %73
  br i1 %74, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %75 = mul i32 %thread_id.x, 2
  %76 = sub i32 %x_loc, %75
  %Arg_0.1 = getelementptr inbounds [256 x [256 x float]], ptr %arg0, i32 0, i32 %29, i32 %30
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %77 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %76
  call void @region_1_6__2(ptr %77, ptr %reduction_input_address, ptr %return_buffer)
  %78 = load float, ptr %return_buffer, align 4
  store float %78, ptr %77, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %79 = mul i32 %thread_id.x, 2
  %80 = sub i32 %x_loc4, %79
  %Arg_0.17 = getelementptr inbounds [256 x [256 x float]], ptr %arg0, i32 0, i32 %34, i32 %35
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !98
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %81 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %80
  call void @region_1_6__2(ptr %81, ptr %reduction_input_address, ptr %return_buffer9)
  %82 = load float, ptr %return_buffer9, align 4
  store float %82, ptr %81, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %83 = mul i32 %thread_id.y, 2
  %84 = add i32 %tile_origin.1, %thread_id.x
  %85 = add i32 %tile_origin.2, %83
  %86 = add i32 %85, 0
  %87 = mul i32 %tile_origin.0, 256
  %88 = add i32 %87, %86
  %89 = udiv i32 %88, 1
  %output_element_address = getelementptr inbounds [256 x float], ptr %arg5, i32 0, i32 %89
  %output = load float, ptr %39, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %90 = mul i32 %thread_id.y, 2
  %91 = add i32 %tile_origin.1, %thread_id.x
  %92 = add i32 %tile_origin.2, %90
  %93 = add i32 %92, 1
  %94 = mul i32 %tile_origin.0, 256
  %95 = add i32 %94, %93
  %96 = udiv i32 %95, 1
  %output_element_address44 = getelementptr inbounds [256 x float], ptr %arg5, i32 0, i32 %96
  %output45 = load float, ptr %58, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.248 = load float, ptr %arg1, align 4, !invariant.load !98
  %97 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  store float %Arg_1.248, ptr %97, align 4
  %98 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  store float %Arg_1.248, ptr %98, align 4
  %99 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %100 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !128
  %101 = urem i32 %99, 1024
  %102 = udiv i32 %99, 1024
  %103 = mul i32 %100, 1
  %104 = add i32 %103, %102
  %105 = icmp ult i32 %104, 4
  br i1 %105, label %106, label %early_return49

106:                                              ; preds = %reduce-group-1-true
  %thread_id.x50 = urem i32 %101, 32
  %thread_id.y51 = udiv i32 %101, 32
  %lane_id52 = urem i32 %101, 32
  %107 = udiv i32 %104, 1
  %108 = urem i32 %107, 4
  %109 = udiv i32 %104, 4
  %110 = urem i32 %109, 1
  %111 = udiv i32 %104, 4
  %112 = icmp eq i32 %110, 0
  %tile_bound53 = select i1 %112, i32 256, i32 4096
  %113 = icmp eq i32 %108, 3
  %tile_bound54 = select i1 %113, i32 64, i32 64
  %tile_origin.055 = mul i32 %111, 1
  %tile_origin.156 = mul i32 %110, 4096
  %tile_origin.257 = mul i32 %108, 64
  store i32 %thread_id.y51, ptr %y_in_tile.invar_address61, align 4
  br label %y_in_tile.loop_header59

y_in_tile.loop_header59:                          ; preds = %tile_loop.loop_exit64, %106
  %y_in_tile.indvar62 = load i32, ptr %y_in_tile.invar_address61, align 4
  %114 = icmp uge i32 %y_in_tile.indvar62, %tile_bound53
  br i1 %114, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_body60:                            ; preds = %y_in_tile.loop_header59
  %invar.inc63 = add nuw nsw i32 %y_in_tile.indvar62, 32
  store i32 %invar.inc63, ptr %y_in_tile.invar_address61, align 4
  %115 = icmp eq i32 %y_in_tile.indvar62, %thread_id.y51
  %116 = mul i32 %thread_id.x50, 2
  store i32 0, ptr %tile_loop.invar_address67, align 4
  br label %tile_loop.loop_header65

tile_loop.loop_header65:                          ; preds = %x_in_tile-after77, %y_in_tile.loop_body60
  %tile_loop.indvar68 = load i32, ptr %tile_loop.invar_address67, align 4
  %117 = icmp uge i32 %tile_loop.indvar68, 1
  br i1 %117, label %tile_loop.loop_exit64, label %tile_loop.loop_body66

tile_loop.loop_body66:                            ; preds = %tile_loop.loop_header65
  %invar.inc69 = add nuw nsw i32 %tile_loop.indvar68, 1
  store i32 %invar.inc69, ptr %tile_loop.invar_address67, align 4
  %118 = icmp eq i32 %tile_loop.indvar68, 0
  %119 = mul i32 %tile_loop.indvar68, 2
  %120 = add i32 %119, 0
  %x_loc70 = add i32 %120, %116
  %121 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %122 = add i32 %tile_origin.257, %x_loc70
  %123 = icmp ult i32 %x_loc70, %tile_bound54
  br i1 %123, label %x_in_tile-true71, label %x_in_tile-after72

x_in_tile-after72:                                ; preds = %x_in_tile-true71, %tile_loop.loop_body66
  %124 = mul i32 %tile_loop.indvar68, 2
  %125 = add i32 %124, 1
  %x_loc75 = add i32 %125, %116
  %126 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %127 = add i32 %tile_origin.257, %x_loc75
  %128 = icmp ult i32 %x_loc75, %tile_bound54
  br i1 %128, label %x_in_tile-true76, label %x_in_tile-after77

x_in_tile-after77:                                ; preds = %x_in_tile-true76, %x_in_tile-after72
  br label %tile_loop.loop_header65, !llvm.loop !168

tile_loop.loop_exit64:                            ; preds = %tile_loop.loop_header65
  br label %y_in_tile.loop_header59, !llvm.loop !169

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_header59
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache25, i32 0, i32 %102, i32 0, i32 %thread_id.x50, i32 %thread_id.y51
  %129 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  %130 = load float, ptr %current_output82, align 4
  store float %130, ptr %129, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache25, i32 0, i32 %102, i32 0, i32 %thread_id.y51, i32 %thread_id.x50
  %131 = addrspacecast ptr addrspace(3) %shmem_transposed_addr83 to ptr
  %partial_reduction_result85 = load float, ptr %131, align 4
  %132 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  store float %132, ptr %result_from_other_lane84, align 4
  call void @region_2_11(ptr %131, ptr %result_from_other_lane84, ptr %return_buffer86)
  %133 = load float, ptr %return_buffer86, align 4
  store float %133, ptr %131, align 4
  %partial_reduction_result88 = load float, ptr %131, align 4
  %134 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 8, i32 31)
  store float %134, ptr %result_from_other_lane87, align 4
  call void @region_2_11(ptr %131, ptr %result_from_other_lane87, ptr %return_buffer89)
  %135 = load float, ptr %return_buffer89, align 4
  store float %135, ptr %131, align 4
  %partial_reduction_result91 = load float, ptr %131, align 4
  %136 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result91, i32 4, i32 31)
  store float %136, ptr %result_from_other_lane90, align 4
  call void @region_2_11(ptr %131, ptr %result_from_other_lane90, ptr %return_buffer92)
  %137 = load float, ptr %return_buffer92, align 4
  store float %137, ptr %131, align 4
  %partial_reduction_result94 = load float, ptr %131, align 4
  %138 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result94, i32 2, i32 31)
  store float %138, ptr %result_from_other_lane93, align 4
  call void @region_2_11(ptr %131, ptr %result_from_other_lane93, ptr %return_buffer95)
  %139 = load float, ptr %return_buffer95, align 4
  store float %139, ptr %131, align 4
  %partial_reduction_result97 = load float, ptr %131, align 4
  %140 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result97, i32 1, i32 31)
  store float %140, ptr %result_from_other_lane96, align 4
  call void @region_2_11(ptr %131, ptr %result_from_other_lane96, ptr %return_buffer98)
  %141 = load float, ptr %return_buffer98, align 4
  store float %141, ptr %131, align 4
  %142 = icmp ult i32 %thread_id.x50, %tile_bound53
  %143 = mul i32 %thread_id.y51, 2
  %144 = icmp ult i32 %143, %tile_bound54
  %145 = and i1 %144, %142
  %146 = icmp eq i32 %lane_id52, 0
  %147 = and i1 %145, %146
  br i1 %147, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %y_in_tile.loop_exit58
  %shmem_output_address103 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache25, i32 0, i32 %102, i32 1, i32 %thread_id.x50, i32 %thread_id.y51
  %148 = addrspacecast ptr addrspace(3) %shmem_output_address103 to ptr
  %current_output104 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  %149 = load float, ptr %current_output104, align 4
  store float %149, ptr %148, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache25, i32 0, i32 %102, i32 1, i32 %thread_id.y51, i32 %thread_id.x50
  %150 = addrspacecast ptr addrspace(3) %shmem_transposed_addr105 to ptr
  %partial_reduction_result107 = load float, ptr %150, align 4
  %151 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  store float %151, ptr %result_from_other_lane106, align 4
  call void @region_2_11(ptr %150, ptr %result_from_other_lane106, ptr %return_buffer108)
  %152 = load float, ptr %return_buffer108, align 4
  store float %152, ptr %150, align 4
  %partial_reduction_result110 = load float, ptr %150, align 4
  %153 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result110, i32 8, i32 31)
  store float %153, ptr %result_from_other_lane109, align 4
  call void @region_2_11(ptr %150, ptr %result_from_other_lane109, ptr %return_buffer111)
  %154 = load float, ptr %return_buffer111, align 4
  store float %154, ptr %150, align 4
  %partial_reduction_result113 = load float, ptr %150, align 4
  %155 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result113, i32 4, i32 31)
  store float %155, ptr %result_from_other_lane112, align 4
  call void @region_2_11(ptr %150, ptr %result_from_other_lane112, ptr %return_buffer114)
  %156 = load float, ptr %return_buffer114, align 4
  store float %156, ptr %150, align 4
  %partial_reduction_result116 = load float, ptr %150, align 4
  %157 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result116, i32 2, i32 31)
  store float %157, ptr %result_from_other_lane115, align 4
  call void @region_2_11(ptr %150, ptr %result_from_other_lane115, ptr %return_buffer117)
  %158 = load float, ptr %return_buffer117, align 4
  store float %158, ptr %150, align 4
  %partial_reduction_result119 = load float, ptr %150, align 4
  %159 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result119, i32 1, i32 31)
  store float %159, ptr %result_from_other_lane118, align 4
  call void @region_2_11(ptr %150, ptr %result_from_other_lane118, ptr %return_buffer120)
  %160 = load float, ptr %return_buffer120, align 4
  store float %160, ptr %150, align 4
  %161 = icmp ult i32 %thread_id.x50, %tile_bound53
  %162 = mul i32 %thread_id.y51, 2
  %163 = icmp ult i32 %162, %tile_bound54
  %164 = and i1 %163, %161
  %165 = icmp eq i32 %lane_id52, 0
  %166 = and i1 %164, %165
  br i1 %166, label %reduction_write_output-true121, label %reduction_write_output-after122

reduction_write_output-after122:                  ; preds = %reduction_write_output-true121, %reduction_write_output-after100
  br label %reduce-group-1-after

early_return49:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true71:                                 ; preds = %tile_loop.loop_body66
  %167 = mul i32 %thread_id.x50, 2
  %168 = sub i32 %x_loc70, %167
  %Arg_2.3 = getelementptr inbounds [256 x [256 x float]], ptr %arg2, i32 0, i32 %121, i32 %122
  %Arg_2.373 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
  store float %Arg_2.373, ptr %reduction_input_address46, align 4
  %169 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %168
  call void @region_2_11(ptr %169, ptr %reduction_input_address46, ptr %return_buffer74)
  %170 = load float, ptr %return_buffer74, align 4
  store float %170, ptr %169, align 4
  br label %x_in_tile-after72

x_in_tile-true76:                                 ; preds = %x_in_tile-after72
  %171 = mul i32 %thread_id.x50, 2
  %172 = sub i32 %x_loc75, %171
  %Arg_2.378 = getelementptr inbounds [256 x [256 x float]], ptr %arg2, i32 0, i32 %126, i32 %127
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !98
  store float %Arg_2.379, ptr %reduction_input_address46, align 4
  %173 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %172
  call void @region_2_11(ptr %173, ptr %reduction_input_address46, ptr %return_buffer80)
  %174 = load float, ptr %return_buffer80, align 4
  store float %174, ptr %173, align 4
  br label %x_in_tile-after77

reduction_write_output-true99:                    ; preds = %y_in_tile.loop_exit58
  %175 = mul i32 %thread_id.y51, 2
  %176 = add i32 %tile_origin.156, %thread_id.x50
  %177 = add i32 %tile_origin.257, %175
  %178 = add i32 %177, 0
  %179 = mul i32 %tile_origin.055, 256
  %180 = add i32 %179, %178
  %181 = udiv i32 %180, 1
  %output_element_address101 = getelementptr inbounds [256 x float], ptr %arg6, i32 0, i32 %181
  %output102 = load float, ptr %131, align 4
  store float %output102, ptr %output_element_address101, align 4
  br label %reduction_write_output-after100

reduction_write_output-true121:                   ; preds = %reduction_write_output-after100
  %182 = mul i32 %thread_id.y51, 2
  %183 = add i32 %tile_origin.156, %thread_id.x50
  %184 = add i32 %tile_origin.257, %182
  %185 = add i32 %184, 1
  %186 = mul i32 %tile_origin.055, 256
  %187 = add i32 %186, %185
  %188 = udiv i32 %187, 1
  %output_element_address123 = getelementptr inbounds [256 x float], ptr %arg6, i32 0, i32 %188
  %output124 = load float, ptr %150, align 4
  store float %output124, ptr %output_element_address123, align 4
  br label %reduction_write_output-after122

reduce-group-2-true:                              ; preds = %reduce-group-1-after
  %Arg_1.2127 = load float, ptr %arg1, align 4, !invariant.load !98
  %189 = getelementptr inbounds float, ptr %partial_reduction_result126, i32 0
  store float %Arg_1.2127, ptr %189, align 4
  %190 = getelementptr inbounds float, ptr %partial_reduction_result126, i32 1
  store float %Arg_1.2127, ptr %190, align 4
  %191 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %192 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !128
  %193 = urem i32 %191, 1024
  %194 = udiv i32 %191, 1024
  %195 = mul i32 %192, 1
  %196 = add i32 %195, %194
  %197 = icmp ult i32 %196, 4
  br i1 %197, label %198, label %early_return128

198:                                              ; preds = %reduce-group-2-true
  %thread_id.x129 = urem i32 %193, 32
  %thread_id.y130 = udiv i32 %193, 32
  %lane_id131 = urem i32 %193, 32
  %199 = udiv i32 %196, 1
  %200 = urem i32 %199, 4
  %201 = udiv i32 %196, 4
  %202 = urem i32 %201, 1
  %203 = udiv i32 %196, 4
  %204 = icmp eq i32 %202, 0
  %tile_bound132 = select i1 %204, i32 256, i32 4096
  %205 = icmp eq i32 %200, 3
  %tile_bound133 = select i1 %205, i32 64, i32 64
  %tile_origin.0134 = mul i32 %203, 1
  %tile_origin.1135 = mul i32 %202, 4096
  %tile_origin.2136 = mul i32 %200, 64
  store i32 %thread_id.y130, ptr %y_in_tile.invar_address140, align 4
  br label %y_in_tile.loop_header138

y_in_tile.loop_header138:                         ; preds = %tile_loop.loop_exit143, %198
  %y_in_tile.indvar141 = load i32, ptr %y_in_tile.invar_address140, align 4
  %206 = icmp uge i32 %y_in_tile.indvar141, %tile_bound132
  br i1 %206, label %y_in_tile.loop_exit137, label %y_in_tile.loop_body139

y_in_tile.loop_body139:                           ; preds = %y_in_tile.loop_header138
  %invar.inc142 = add nuw nsw i32 %y_in_tile.indvar141, 32
  store i32 %invar.inc142, ptr %y_in_tile.invar_address140, align 4
  %207 = icmp eq i32 %y_in_tile.indvar141, %thread_id.y130
  %208 = mul i32 %thread_id.x129, 2
  store i32 0, ptr %tile_loop.invar_address146, align 4
  br label %tile_loop.loop_header144

tile_loop.loop_header144:                         ; preds = %x_in_tile-after156, %y_in_tile.loop_body139
  %tile_loop.indvar147 = load i32, ptr %tile_loop.invar_address146, align 4
  %209 = icmp uge i32 %tile_loop.indvar147, 1
  br i1 %209, label %tile_loop.loop_exit143, label %tile_loop.loop_body145

tile_loop.loop_body145:                           ; preds = %tile_loop.loop_header144
  %invar.inc148 = add nuw nsw i32 %tile_loop.indvar147, 1
  store i32 %invar.inc148, ptr %tile_loop.invar_address146, align 4
  %210 = icmp eq i32 %tile_loop.indvar147, 0
  %211 = mul i32 %tile_loop.indvar147, 2
  %212 = add i32 %211, 0
  %x_loc149 = add i32 %212, %208
  %213 = add i32 %tile_origin.1135, %y_in_tile.indvar141
  %214 = add i32 %tile_origin.2136, %x_loc149
  %215 = icmp ult i32 %x_loc149, %tile_bound133
  br i1 %215, label %x_in_tile-true150, label %x_in_tile-after151

x_in_tile-after151:                               ; preds = %x_in_tile-true150, %tile_loop.loop_body145
  %216 = mul i32 %tile_loop.indvar147, 2
  %217 = add i32 %216, 1
  %x_loc154 = add i32 %217, %208
  %218 = add i32 %tile_origin.1135, %y_in_tile.indvar141
  %219 = add i32 %tile_origin.2136, %x_loc154
  %220 = icmp ult i32 %x_loc154, %tile_bound133
  br i1 %220, label %x_in_tile-true155, label %x_in_tile-after156

x_in_tile-after156:                               ; preds = %x_in_tile-true155, %x_in_tile-after151
  br label %tile_loop.loop_header144, !llvm.loop !170

tile_loop.loop_exit143:                           ; preds = %tile_loop.loop_header144
  br label %y_in_tile.loop_header138, !llvm.loop !171

y_in_tile.loop_exit137:                           ; preds = %y_in_tile.loop_header138
  %shmem_output_address160 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache26, i32 0, i32 %194, i32 0, i32 %thread_id.x129, i32 %thread_id.y130
  %221 = addrspacecast ptr addrspace(3) %shmem_output_address160 to ptr
  %current_output161 = getelementptr inbounds float, ptr %partial_reduction_result126, i32 0
  %222 = load float, ptr %current_output161, align 4
  store float %222, ptr %221, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr162 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache26, i32 0, i32 %194, i32 0, i32 %thread_id.y130, i32 %thread_id.x129
  %223 = addrspacecast ptr addrspace(3) %shmem_transposed_addr162 to ptr
  %partial_reduction_result164 = load float, ptr %223, align 4
  %224 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result164, i32 16, i32 31)
  store float %224, ptr %result_from_other_lane163, align 4
  call void @region_3_16(ptr %223, ptr %result_from_other_lane163, ptr %return_buffer165)
  %225 = load float, ptr %return_buffer165, align 4
  store float %225, ptr %223, align 4
  %partial_reduction_result167 = load float, ptr %223, align 4
  %226 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result167, i32 8, i32 31)
  store float %226, ptr %result_from_other_lane166, align 4
  call void @region_3_16(ptr %223, ptr %result_from_other_lane166, ptr %return_buffer168)
  %227 = load float, ptr %return_buffer168, align 4
  store float %227, ptr %223, align 4
  %partial_reduction_result170 = load float, ptr %223, align 4
  %228 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result170, i32 4, i32 31)
  store float %228, ptr %result_from_other_lane169, align 4
  call void @region_3_16(ptr %223, ptr %result_from_other_lane169, ptr %return_buffer171)
  %229 = load float, ptr %return_buffer171, align 4
  store float %229, ptr %223, align 4
  %partial_reduction_result173 = load float, ptr %223, align 4
  %230 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result173, i32 2, i32 31)
  store float %230, ptr %result_from_other_lane172, align 4
  call void @region_3_16(ptr %223, ptr %result_from_other_lane172, ptr %return_buffer174)
  %231 = load float, ptr %return_buffer174, align 4
  store float %231, ptr %223, align 4
  %partial_reduction_result176 = load float, ptr %223, align 4
  %232 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result176, i32 1, i32 31)
  store float %232, ptr %result_from_other_lane175, align 4
  call void @region_3_16(ptr %223, ptr %result_from_other_lane175, ptr %return_buffer177)
  %233 = load float, ptr %return_buffer177, align 4
  store float %233, ptr %223, align 4
  %234 = icmp ult i32 %thread_id.x129, %tile_bound132
  %235 = mul i32 %thread_id.y130, 2
  %236 = icmp ult i32 %235, %tile_bound133
  %237 = and i1 %236, %234
  %238 = icmp eq i32 %lane_id131, 0
  %239 = and i1 %237, %238
  br i1 %239, label %reduction_write_output-true178, label %reduction_write_output-after179

reduction_write_output-after179:                  ; preds = %reduction_write_output-true178, %y_in_tile.loop_exit137
  %shmem_output_address182 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache26, i32 0, i32 %194, i32 1, i32 %thread_id.x129, i32 %thread_id.y130
  %240 = addrspacecast ptr addrspace(3) %shmem_output_address182 to ptr
  %current_output183 = getelementptr inbounds float, ptr %partial_reduction_result126, i32 1
  %241 = load float, ptr %current_output183, align 4
  store float %241, ptr %240, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr184 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache26, i32 0, i32 %194, i32 1, i32 %thread_id.y130, i32 %thread_id.x129
  %242 = addrspacecast ptr addrspace(3) %shmem_transposed_addr184 to ptr
  %partial_reduction_result186 = load float, ptr %242, align 4
  %243 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result186, i32 16, i32 31)
  store float %243, ptr %result_from_other_lane185, align 4
  call void @region_3_16(ptr %242, ptr %result_from_other_lane185, ptr %return_buffer187)
  %244 = load float, ptr %return_buffer187, align 4
  store float %244, ptr %242, align 4
  %partial_reduction_result189 = load float, ptr %242, align 4
  %245 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result189, i32 8, i32 31)
  store float %245, ptr %result_from_other_lane188, align 4
  call void @region_3_16(ptr %242, ptr %result_from_other_lane188, ptr %return_buffer190)
  %246 = load float, ptr %return_buffer190, align 4
  store float %246, ptr %242, align 4
  %partial_reduction_result192 = load float, ptr %242, align 4
  %247 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result192, i32 4, i32 31)
  store float %247, ptr %result_from_other_lane191, align 4
  call void @region_3_16(ptr %242, ptr %result_from_other_lane191, ptr %return_buffer193)
  %248 = load float, ptr %return_buffer193, align 4
  store float %248, ptr %242, align 4
  %partial_reduction_result195 = load float, ptr %242, align 4
  %249 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result195, i32 2, i32 31)
  store float %249, ptr %result_from_other_lane194, align 4
  call void @region_3_16(ptr %242, ptr %result_from_other_lane194, ptr %return_buffer196)
  %250 = load float, ptr %return_buffer196, align 4
  store float %250, ptr %242, align 4
  %partial_reduction_result198 = load float, ptr %242, align 4
  %251 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result198, i32 1, i32 31)
  store float %251, ptr %result_from_other_lane197, align 4
  call void @region_3_16(ptr %242, ptr %result_from_other_lane197, ptr %return_buffer199)
  %252 = load float, ptr %return_buffer199, align 4
  store float %252, ptr %242, align 4
  %253 = icmp ult i32 %thread_id.x129, %tile_bound132
  %254 = mul i32 %thread_id.y130, 2
  %255 = icmp ult i32 %254, %tile_bound133
  %256 = and i1 %255, %253
  %257 = icmp eq i32 %lane_id131, 0
  %258 = and i1 %256, %257
  br i1 %258, label %reduction_write_output-true200, label %reduction_write_output-after201

reduction_write_output-after201:                  ; preds = %reduction_write_output-true200, %reduction_write_output-after179
  br label %reduce-group-2-after

early_return128:                                  ; preds = %reduce-group-2-true
  ret void

x_in_tile-true150:                                ; preds = %tile_loop.loop_body145
  %259 = mul i32 %thread_id.x129, 2
  %260 = sub i32 %x_loc149, %259
  %Arg_3.4 = getelementptr inbounds [256 x [256 x float]], ptr %arg3, i32 0, i32 %213, i32 %214
  %Arg_3.4152 = load float, ptr %Arg_3.4, align 4, !invariant.load !98
  store float %Arg_3.4152, ptr %reduction_input_address125, align 4
  %261 = getelementptr inbounds float, ptr %partial_reduction_result126, i32 %260
  call void @region_3_16(ptr %261, ptr %reduction_input_address125, ptr %return_buffer153)
  %262 = load float, ptr %return_buffer153, align 4
  store float %262, ptr %261, align 4
  br label %x_in_tile-after151

x_in_tile-true155:                                ; preds = %x_in_tile-after151
  %263 = mul i32 %thread_id.x129, 2
  %264 = sub i32 %x_loc154, %263
  %Arg_3.4157 = getelementptr inbounds [256 x [256 x float]], ptr %arg3, i32 0, i32 %218, i32 %219
  %Arg_3.4158 = load float, ptr %Arg_3.4157, align 4, !invariant.load !98
  store float %Arg_3.4158, ptr %reduction_input_address125, align 4
  %265 = getelementptr inbounds float, ptr %partial_reduction_result126, i32 %264
  call void @region_3_16(ptr %265, ptr %reduction_input_address125, ptr %return_buffer159)
  %266 = load float, ptr %return_buffer159, align 4
  store float %266, ptr %265, align 4
  br label %x_in_tile-after156

reduction_write_output-true178:                   ; preds = %y_in_tile.loop_exit137
  %267 = mul i32 %thread_id.y130, 2
  %268 = add i32 %tile_origin.1135, %thread_id.x129
  %269 = add i32 %tile_origin.2136, %267
  %270 = add i32 %269, 0
  %271 = mul i32 %tile_origin.0134, 256
  %272 = add i32 %271, %270
  %273 = udiv i32 %272, 1
  %output_element_address180 = getelementptr inbounds [256 x float], ptr %arg7, i32 0, i32 %273
  %output181 = load float, ptr %223, align 4
  store float %output181, ptr %output_element_address180, align 4
  br label %reduction_write_output-after179

reduction_write_output-true200:                   ; preds = %reduction_write_output-after179
  %274 = mul i32 %thread_id.y130, 2
  %275 = add i32 %tile_origin.1135, %thread_id.x129
  %276 = add i32 %tile_origin.2136, %274
  %277 = add i32 %276, 1
  %278 = mul i32 %tile_origin.0134, 256
  %279 = add i32 %278, %277
  %280 = udiv i32 %279, 1
  %output_element_address202 = getelementptr inbounds [256 x float], ptr %arg7, i32 0, i32 %280
  %output203 = load float, ptr %242, align 4
  store float %output203, ptr %output_element_address202, align 4
  br label %reduction_write_output-after201

reduce-group-3-true:                              ; preds = %reduce-group-2-after
  %Arg_1.2206 = load float, ptr %arg1, align 4, !invariant.load !98
  %281 = getelementptr inbounds float, ptr %partial_reduction_result205, i32 0
  store float %Arg_1.2206, ptr %281, align 4
  %282 = getelementptr inbounds float, ptr %partial_reduction_result205, i32 1
  store float %Arg_1.2206, ptr %282, align 4
  %283 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %284 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !128
  %285 = urem i32 %283, 1024
  %286 = udiv i32 %283, 1024
  %287 = mul i32 %284, 1
  %288 = add i32 %287, %286
  %289 = icmp ult i32 %288, 4
  br i1 %289, label %290, label %early_return207

290:                                              ; preds = %reduce-group-3-true
  %thread_id.x208 = urem i32 %285, 32
  %thread_id.y209 = udiv i32 %285, 32
  %lane_id210 = urem i32 %285, 32
  %291 = udiv i32 %288, 1
  %292 = urem i32 %291, 4
  %293 = udiv i32 %288, 4
  %294 = urem i32 %293, 1
  %295 = udiv i32 %288, 4
  %296 = icmp eq i32 %294, 0
  %tile_bound211 = select i1 %296, i32 256, i32 4096
  %297 = icmp eq i32 %292, 3
  %tile_bound212 = select i1 %297, i32 64, i32 64
  %tile_origin.0213 = mul i32 %295, 1
  %tile_origin.1214 = mul i32 %294, 4096
  %tile_origin.2215 = mul i32 %292, 64
  store i32 %thread_id.y209, ptr %y_in_tile.invar_address219, align 4
  br label %y_in_tile.loop_header217

y_in_tile.loop_header217:                         ; preds = %tile_loop.loop_exit222, %290
  %y_in_tile.indvar220 = load i32, ptr %y_in_tile.invar_address219, align 4
  %298 = icmp uge i32 %y_in_tile.indvar220, %tile_bound211
  br i1 %298, label %y_in_tile.loop_exit216, label %y_in_tile.loop_body218

y_in_tile.loop_body218:                           ; preds = %y_in_tile.loop_header217
  %invar.inc221 = add nuw nsw i32 %y_in_tile.indvar220, 32
  store i32 %invar.inc221, ptr %y_in_tile.invar_address219, align 4
  %299 = icmp eq i32 %y_in_tile.indvar220, %thread_id.y209
  %300 = mul i32 %thread_id.x208, 2
  store i32 0, ptr %tile_loop.invar_address225, align 4
  br label %tile_loop.loop_header223

tile_loop.loop_header223:                         ; preds = %x_in_tile-after235, %y_in_tile.loop_body218
  %tile_loop.indvar226 = load i32, ptr %tile_loop.invar_address225, align 4
  %301 = icmp uge i32 %tile_loop.indvar226, 1
  br i1 %301, label %tile_loop.loop_exit222, label %tile_loop.loop_body224

tile_loop.loop_body224:                           ; preds = %tile_loop.loop_header223
  %invar.inc227 = add nuw nsw i32 %tile_loop.indvar226, 1
  store i32 %invar.inc227, ptr %tile_loop.invar_address225, align 4
  %302 = icmp eq i32 %tile_loop.indvar226, 0
  %303 = mul i32 %tile_loop.indvar226, 2
  %304 = add i32 %303, 0
  %x_loc228 = add i32 %304, %300
  %305 = add i32 %tile_origin.1214, %y_in_tile.indvar220
  %306 = add i32 %tile_origin.2215, %x_loc228
  %307 = icmp ult i32 %x_loc228, %tile_bound212
  br i1 %307, label %x_in_tile-true229, label %x_in_tile-after230

x_in_tile-after230:                               ; preds = %x_in_tile-true229, %tile_loop.loop_body224
  %308 = mul i32 %tile_loop.indvar226, 2
  %309 = add i32 %308, 1
  %x_loc233 = add i32 %309, %300
  %310 = add i32 %tile_origin.1214, %y_in_tile.indvar220
  %311 = add i32 %tile_origin.2215, %x_loc233
  %312 = icmp ult i32 %x_loc233, %tile_bound212
  br i1 %312, label %x_in_tile-true234, label %x_in_tile-after235

x_in_tile-after235:                               ; preds = %x_in_tile-true234, %x_in_tile-after230
  br label %tile_loop.loop_header223, !llvm.loop !172

tile_loop.loop_exit222:                           ; preds = %tile_loop.loop_header223
  br label %y_in_tile.loop_header217, !llvm.loop !173

y_in_tile.loop_exit216:                           ; preds = %y_in_tile.loop_header217
  %shmem_output_address239 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache27, i32 0, i32 %286, i32 0, i32 %thread_id.x208, i32 %thread_id.y209
  %313 = addrspacecast ptr addrspace(3) %shmem_output_address239 to ptr
  %current_output240 = getelementptr inbounds float, ptr %partial_reduction_result205, i32 0
  %314 = load float, ptr %current_output240, align 4
  store float %314, ptr %313, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr241 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache27, i32 0, i32 %286, i32 0, i32 %thread_id.y209, i32 %thread_id.x208
  %315 = addrspacecast ptr addrspace(3) %shmem_transposed_addr241 to ptr
  %partial_reduction_result243 = load float, ptr %315, align 4
  %316 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result243, i32 16, i32 31)
  store float %316, ptr %result_from_other_lane242, align 4
  call void @region_4_21(ptr %315, ptr %result_from_other_lane242, ptr %return_buffer244)
  %317 = load float, ptr %return_buffer244, align 4
  store float %317, ptr %315, align 4
  %partial_reduction_result246 = load float, ptr %315, align 4
  %318 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result246, i32 8, i32 31)
  store float %318, ptr %result_from_other_lane245, align 4
  call void @region_4_21(ptr %315, ptr %result_from_other_lane245, ptr %return_buffer247)
  %319 = load float, ptr %return_buffer247, align 4
  store float %319, ptr %315, align 4
  %partial_reduction_result249 = load float, ptr %315, align 4
  %320 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result249, i32 4, i32 31)
  store float %320, ptr %result_from_other_lane248, align 4
  call void @region_4_21(ptr %315, ptr %result_from_other_lane248, ptr %return_buffer250)
  %321 = load float, ptr %return_buffer250, align 4
  store float %321, ptr %315, align 4
  %partial_reduction_result252 = load float, ptr %315, align 4
  %322 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result252, i32 2, i32 31)
  store float %322, ptr %result_from_other_lane251, align 4
  call void @region_4_21(ptr %315, ptr %result_from_other_lane251, ptr %return_buffer253)
  %323 = load float, ptr %return_buffer253, align 4
  store float %323, ptr %315, align 4
  %partial_reduction_result255 = load float, ptr %315, align 4
  %324 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result255, i32 1, i32 31)
  store float %324, ptr %result_from_other_lane254, align 4
  call void @region_4_21(ptr %315, ptr %result_from_other_lane254, ptr %return_buffer256)
  %325 = load float, ptr %return_buffer256, align 4
  store float %325, ptr %315, align 4
  %326 = icmp ult i32 %thread_id.x208, %tile_bound211
  %327 = mul i32 %thread_id.y209, 2
  %328 = icmp ult i32 %327, %tile_bound212
  %329 = and i1 %328, %326
  %330 = icmp eq i32 %lane_id210, 0
  %331 = and i1 %329, %330
  br i1 %331, label %reduction_write_output-true257, label %reduction_write_output-after258

reduction_write_output-after258:                  ; preds = %reduction_write_output-true257, %y_in_tile.loop_exit216
  %shmem_output_address261 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache27, i32 0, i32 %286, i32 1, i32 %thread_id.x208, i32 %thread_id.y209
  %332 = addrspacecast ptr addrspace(3) %shmem_output_address261 to ptr
  %current_output262 = getelementptr inbounds float, ptr %partial_reduction_result205, i32 1
  %333 = load float, ptr %current_output262, align 4
  store float %333, ptr %332, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr263 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache27, i32 0, i32 %286, i32 1, i32 %thread_id.y209, i32 %thread_id.x208
  %334 = addrspacecast ptr addrspace(3) %shmem_transposed_addr263 to ptr
  %partial_reduction_result265 = load float, ptr %334, align 4
  %335 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result265, i32 16, i32 31)
  store float %335, ptr %result_from_other_lane264, align 4
  call void @region_4_21(ptr %334, ptr %result_from_other_lane264, ptr %return_buffer266)
  %336 = load float, ptr %return_buffer266, align 4
  store float %336, ptr %334, align 4
  %partial_reduction_result268 = load float, ptr %334, align 4
  %337 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result268, i32 8, i32 31)
  store float %337, ptr %result_from_other_lane267, align 4
  call void @region_4_21(ptr %334, ptr %result_from_other_lane267, ptr %return_buffer269)
  %338 = load float, ptr %return_buffer269, align 4
  store float %338, ptr %334, align 4
  %partial_reduction_result271 = load float, ptr %334, align 4
  %339 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result271, i32 4, i32 31)
  store float %339, ptr %result_from_other_lane270, align 4
  call void @region_4_21(ptr %334, ptr %result_from_other_lane270, ptr %return_buffer272)
  %340 = load float, ptr %return_buffer272, align 4
  store float %340, ptr %334, align 4
  %partial_reduction_result274 = load float, ptr %334, align 4
  %341 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result274, i32 2, i32 31)
  store float %341, ptr %result_from_other_lane273, align 4
  call void @region_4_21(ptr %334, ptr %result_from_other_lane273, ptr %return_buffer275)
  %342 = load float, ptr %return_buffer275, align 4
  store float %342, ptr %334, align 4
  %partial_reduction_result277 = load float, ptr %334, align 4
  %343 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result277, i32 1, i32 31)
  store float %343, ptr %result_from_other_lane276, align 4
  call void @region_4_21(ptr %334, ptr %result_from_other_lane276, ptr %return_buffer278)
  %344 = load float, ptr %return_buffer278, align 4
  store float %344, ptr %334, align 4
  %345 = icmp ult i32 %thread_id.x208, %tile_bound211
  %346 = mul i32 %thread_id.y209, 2
  %347 = icmp ult i32 %346, %tile_bound212
  %348 = and i1 %347, %345
  %349 = icmp eq i32 %lane_id210, 0
  %350 = and i1 %348, %349
  br i1 %350, label %reduction_write_output-true279, label %reduction_write_output-after280

reduction_write_output-after280:                  ; preds = %reduction_write_output-true279, %reduction_write_output-after258
  br label %reduce-group-3-after

early_return207:                                  ; preds = %reduce-group-3-true
  ret void

x_in_tile-true229:                                ; preds = %tile_loop.loop_body224
  %351 = mul i32 %thread_id.x208, 2
  %352 = sub i32 %x_loc228, %351
  %Arg_4.5 = getelementptr inbounds [256 x [256 x float]], ptr %arg4, i32 0, i32 %305, i32 %306
  %Arg_4.5231 = load float, ptr %Arg_4.5, align 4, !invariant.load !98
  store float %Arg_4.5231, ptr %reduction_input_address204, align 4
  %353 = getelementptr inbounds float, ptr %partial_reduction_result205, i32 %352
  call void @region_4_21(ptr %353, ptr %reduction_input_address204, ptr %return_buffer232)
  %354 = load float, ptr %return_buffer232, align 4
  store float %354, ptr %353, align 4
  br label %x_in_tile-after230

x_in_tile-true234:                                ; preds = %x_in_tile-after230
  %355 = mul i32 %thread_id.x208, 2
  %356 = sub i32 %x_loc233, %355
  %Arg_4.5236 = getelementptr inbounds [256 x [256 x float]], ptr %arg4, i32 0, i32 %310, i32 %311
  %Arg_4.5237 = load float, ptr %Arg_4.5236, align 4, !invariant.load !98
  store float %Arg_4.5237, ptr %reduction_input_address204, align 4
  %357 = getelementptr inbounds float, ptr %partial_reduction_result205, i32 %356
  call void @region_4_21(ptr %357, ptr %reduction_input_address204, ptr %return_buffer238)
  %358 = load float, ptr %return_buffer238, align 4
  store float %358, ptr %357, align 4
  br label %x_in_tile-after235

reduction_write_output-true257:                   ; preds = %y_in_tile.loop_exit216
  %359 = mul i32 %thread_id.y209, 2
  %360 = add i32 %tile_origin.1214, %thread_id.x208
  %361 = add i32 %tile_origin.2215, %359
  %362 = add i32 %361, 0
  %363 = mul i32 %tile_origin.0213, 256
  %364 = add i32 %363, %362
  %365 = udiv i32 %364, 1
  %output_element_address259 = getelementptr inbounds [256 x float], ptr %arg8, i32 0, i32 %365
  %output260 = load float, ptr %315, align 4
  store float %output260, ptr %output_element_address259, align 4
  br label %reduction_write_output-after258

reduction_write_output-true279:                   ; preds = %reduction_write_output-after258
  %366 = mul i32 %thread_id.y209, 2
  %367 = add i32 %tile_origin.1214, %thread_id.x208
  %368 = add i32 %tile_origin.2215, %366
  %369 = add i32 %368, 1
  %370 = mul i32 %tile_origin.0213, 256
  %371 = add i32 %370, %369
  %372 = udiv i32 %371, 1
  %output_element_address281 = getelementptr inbounds [256 x float], ptr %arg8, i32 0, i32 %372
  %output282 = load float, ptr %334, align 4
  store float %output282, ptr %output_element_address281, align 4
  br label %reduction_write_output-after280
}

define internal void @region_1_6__2(ptr dereferenceable(4) %Arg_0.7.typed, ptr dereferenceable(4) %Arg_1.8.typed, ptr dereferenceable(4) %output_arg) {
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

define internal void @region_2_11(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
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

define internal void @region_3_16(ptr dereferenceable(4) %Arg_0.17.typed, ptr dereferenceable(4) %Arg_1.18.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.19.typed = alloca float, align 4
  %Arg_0.17 = load float, ptr %Arg_0.17.typed, align 4
  %Arg_1.18 = load float, ptr %Arg_1.18.typed, align 4
  %add.19 = fadd float %Arg_0.17, %Arg_1.18
  store float %add.19, ptr %add.19.typed, align 4
  %load_ret_value = load float, ptr %add.19.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define internal void @region_4_21(ptr dereferenceable(4) %Arg_0.22.typed, ptr dereferenceable(4) %Arg_1.23.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.24.typed = alloca float, align 4
  %Arg_0.22 = load float, ptr %Arg_0.22.typed, align 4
  %Arg_1.23 = load float, ptr %Arg_1.23.typed, align 4
  %add.24 = fadd float %Arg_0.22, %Arg_1.23
  store float %add.24, ptr %add.24.typed, align 4
  %load_ret_value = load float, ptr %add.24.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_43(ptr noalias align 16 dereferenceable(1024) %arg0, ptr noalias align 128 dereferenceable(1024) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(1024) %arg3, ptr noalias align 128 dereferenceable(1024) %arg4, ptr noalias align 16 dereferenceable(1024) %arg5, ptr noalias align 128 dereferenceable(1024) %arg6, ptr noalias align 16 dereferenceable(1024) %arg7, ptr noalias align 128 dereferenceable(1024) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 256
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 256
  br i1 %4, label %fusion_43.in_bounds-true, label %fusion_43.in_bounds-after

fusion_43.in_bounds-after:                        ; preds = %fusion_43.in_bounds-true, %entry
  ret void

fusion_43.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !98
  %7 = load float, ptr %arg2, align 4, !invariant.load !98
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.11 = fmul float %7, %9
  %subtract.12 = fsub float %6, %multiply.11
  %10 = insertvalue { float, float, float, float } undef, float %subtract.12, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !98
  %13 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %14 = load float, ptr %13, align 4
  %multiply.13 = fmul float %7, %14
  %subtract.14 = fsub float %12, %multiply.13
  %15 = insertvalue { float, float, float, float } %10, float %subtract.14, 1
  %16 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %17 = load float, ptr %16, align 4, !invariant.load !98
  %18 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %19 = load float, ptr %18, align 4
  %multiply.15 = fmul float %7, %19
  %subtract.16 = fsub float %17, %multiply.15
  %20 = insertvalue { float, float, float, float } %15, float %subtract.16, 2
  %21 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %22 = load float, ptr %21, align 4, !invariant.load !98
  %23 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %24 = load float, ptr %23, align 4
  %multiply.17 = fmul float %7, %24
  %subtract.18 = fsub float %22, %multiply.17
  %25 = insertvalue { float, float, float, float } %20, float %subtract.18, 3
  %26 = extractvalue { float, float, float, float } %25, 0
  %27 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  store float %26, ptr %27, align 4
  %28 = extractvalue { float, float, float, float } %25, 1
  %29 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %28, ptr %29, align 4
  %30 = extractvalue { float, float, float, float } %25, 2
  %31 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %30, ptr %31, align 4
  %32 = extractvalue { float, float, float, float } %25, 3
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %32, ptr %33, align 4
  br label %fusion_43.in_bounds-after
}

define void @fusion_96(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(172032) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6, ptr noalias align 16 dereferenceable(131072) %arg7, ptr noalias align 128 dereferenceable(131072) %arg8, ptr noalias align 16 dereferenceable(131072) %arg9, ptr noalias align 128 dereferenceable(131072) %arg10, ptr noalias align 128 dereferenceable(131072) %arg11) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !120
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_96.in_bounds-true, label %fusion_96.in_bounds-after

fusion_96.in_bounds-after:                        ; preds = %fusion_96.in_bounds-true, %entry
  ret void

fusion_96.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = add i32 %5, 0
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [168 x [256 x float]], ptr %arg1, i32 0, i32 %10, i32 %11
  %13 = load float, ptr %12, align 4, !invariant.load !98
  %multiply.14 = fmul float %9, %13
  %subtract.15 = fsub float %8, %multiply.14
  %14 = insertvalue { float, float, float, float, float } undef, float %subtract.15, 0
  %15 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %16 = load float, ptr %15, align 4, !invariant.load !98
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %18 = load float, ptr %17, align 4
  %multiply.16 = fmul float %9, %18
  %subtract.17 = fsub float %16, %multiply.16
  %19 = insertvalue { float, float, float, float, float } %14, float %subtract.17, 1
  %20 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %21 = load float, ptr %20, align 4, !invariant.load !98
  %22 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %23 = load float, ptr %22, align 4
  %multiply.18 = fmul float %9, %23
  %subtract.19 = fsub float %21, %multiply.18
  %24 = insertvalue { float, float, float, float, float } %19, float %subtract.19, 2
  %25 = getelementptr inbounds float, ptr %arg7, i32 %linear_index
  %26 = load float, ptr %25, align 4, !invariant.load !98
  %27 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  %28 = load float, ptr %27, align 4
  %multiply.20 = fmul float %9, %28
  %subtract.21 = fsub float %26, %multiply.20
  %29 = insertvalue { float, float, float, float, float } %24, float %subtract.21, 3
  %30 = getelementptr inbounds float, ptr %arg9, i32 %linear_index
  %31 = load float, ptr %30, align 4, !invariant.load !98
  %32 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  %33 = load float, ptr %32, align 4
  %multiply.22 = fmul float %9, %33
  %subtract.23 = fsub float %31, %multiply.22
  %34 = insertvalue { float, float, float, float, float } %29, float %subtract.23, 4
  %35 = extractvalue { float, float, float, float, float } %34, 0
  %36 = getelementptr inbounds float, ptr %arg11, i32 %linear_index
  store float %35, ptr %36, align 4
  %37 = extractvalue { float, float, float, float, float } %34, 1
  %38 = getelementptr inbounds float, ptr %arg10, i32 %linear_index
  store float %37, ptr %38, align 4
  %39 = extractvalue { float, float, float, float, float } %34, 2
  %40 = getelementptr inbounds float, ptr %arg8, i32 %linear_index
  store float %39, ptr %40, align 4
  %41 = extractvalue { float, float, float, float, float } %34, 3
  %42 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %41, ptr %42, align 4
  %43 = extractvalue { float, float, float, float, float } %34, 4
  %44 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %43, ptr %44, align 4
  br label %fusion_96.in_bounds-after
}

define void @fusion_28(ptr noalias align 128 dereferenceable(67108864) %arg0, ptr noalias align 128 dereferenceable(67108864) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !174
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4194304
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 16
  %7 = udiv i32 %linear_index_base, 1024
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 8388608
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 64
  %12 = udiv i32 %linear_index1, 64
  %13 = urem i32 %12, 16
  %14 = udiv i32 %linear_index1, 1024
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 8388608
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 64
  %19 = udiv i32 %linear_index2, 64
  %20 = urem i32 %19, 16
  %21 = udiv i32 %linear_index2, 1024
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 8388608
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 64
  %26 = udiv i32 %linear_index3, 64
  %27 = urem i32 %26, 16
  %28 = udiv i32 %linear_index3, 1024
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 8388608
  %31 = icmp ult i32 %linear_index_base, 16777216
  br i1 %31, label %fusion_28.in_bounds-true, label %fusion_28.in_bounds-after

fusion_28.in_bounds-after:                        ; preds = %fusion_28.in_bounds-true, %entry
  ret void

fusion_28.in_bounds-true:                         ; preds = %entry
  %32 = mul nuw nsw i32 %4, 1
  %33 = add nuw nsw i32 0, %32
  %34 = mul nuw nsw i32 %9, 64
  %35 = add nuw nsw i32 %33, %34
  %36 = udiv i32 %35, 128
  %37 = mul nuw nsw i32 %6, 1
  %38 = add nuw nsw i32 0, %37
  %39 = mul nuw nsw i32 %8, 16
  %40 = add nuw nsw i32 %38, %39
  %41 = udiv i32 %40, 131072
  %42 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %40, i32 %35
  %43 = load float, ptr %42, align 4, !invariant.load !98
  %44 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %43, ptr %44, align 4
  %45 = mul nuw nsw i32 %11, 1
  %46 = add nuw nsw i32 0, %45
  %47 = mul nuw nsw i32 %16, 64
  %48 = add nuw nsw i32 %46, %47
  %49 = udiv i32 %48, 128
  %50 = mul nuw nsw i32 %13, 1
  %51 = add nuw nsw i32 0, %50
  %52 = mul nuw nsw i32 %15, 16
  %53 = add nuw nsw i32 %51, %52
  %54 = udiv i32 %53, 131072
  %55 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %53, i32 %48
  %56 = load float, ptr %55, align 4, !invariant.load !98
  %57 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %56, ptr %57, align 4
  %58 = mul nuw nsw i32 %18, 1
  %59 = add nuw nsw i32 0, %58
  %60 = mul nuw nsw i32 %23, 64
  %61 = add nuw nsw i32 %59, %60
  %62 = udiv i32 %61, 128
  %63 = mul nuw nsw i32 %20, 1
  %64 = add nuw nsw i32 0, %63
  %65 = mul nuw nsw i32 %22, 16
  %66 = add nuw nsw i32 %64, %65
  %67 = udiv i32 %66, 131072
  %68 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %66, i32 %61
  %69 = load float, ptr %68, align 4, !invariant.load !98
  %70 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %69, ptr %70, align 4
  %71 = mul nuw nsw i32 %25, 1
  %72 = add nuw nsw i32 0, %71
  %73 = mul nuw nsw i32 %30, 64
  %74 = add nuw nsw i32 %72, %73
  %75 = udiv i32 %74, 128
  %76 = mul nuw nsw i32 %27, 1
  %77 = add nuw nsw i32 0, %76
  %78 = mul nuw nsw i32 %29, 16
  %79 = add nuw nsw i32 %77, %78
  %80 = udiv i32 %79, 131072
  %81 = getelementptr inbounds [131072 x [128 x float]], ptr %arg0, i32 0, i32 %79, i32 %74
  %82 = load float, ptr %81, align 4, !invariant.load !98
  %83 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %82, ptr %83, align 4
  br label %fusion_28.in_bounds-after
}

define void @fusion_27(ptr noalias align 128 dereferenceable(67108864) %arg0, ptr noalias align 128 dereferenceable(67108864) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !174
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4194304
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 128
  %8 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 128
  %11 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 128
  %14 = udiv i32 %linear_index3, 128
  %15 = icmp ult i32 %linear_index_base, 16777216
  br i1 %15, label %fusion_27.in_bounds-true, label %fusion_27.in_bounds-after

fusion_27.in_bounds-after:                        ; preds = %concatenate.6.merge14, %entry
  ret void

fusion_27.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 128
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 16
  %22 = udiv i32 %20, 16
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.64.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 128
  %27 = mul i32 %26, 64
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 64
  %31 = udiv i32 %28, 64
  %32 = urem i32 %31, 16
  %33 = udiv i32 %28, 1024
  %34 = add i32 %22, 0
  %35 = add i32 %21, 0
  %36 = add i32 %25, 0
  %37 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 0, i32 %34, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !98
  br label %concatenate.6.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %39 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %40 = sub nsw i32 %17, %39
  %41 = udiv i32 %linear_index_base, 128
  %42 = mul i32 %41, 64
  %43 = add i32 %42, %40
  %44 = udiv i32 %43, 1
  %45 = urem i32 %44, 64
  %46 = udiv i32 %43, 64
  %47 = urem i32 %46, 16
  %48 = udiv i32 %43, 1024
  %49 = add i32 %22, 0
  %50 = add i32 %21, 0
  %51 = add i32 %40, 0
  %52 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 1, i32 %49, i32 %50, i32 %51
  %53 = load float, ptr %52, align 4, !invariant.load !98
  br label %concatenate.6.merge

concatenate.pivot.64.:                            ; preds = %fusion_27.in_bounds-true
  %54 = icmp ult i32 %17, 64
  br i1 %54, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.6.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %55 = phi float [ %38, %concat_index_from_operand_id0 ], [ %53, %concat_index_from_operand_id1 ]
  %56 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %55, ptr %56, align 4
  %57 = mul nuw nsw i32 %7, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 128
  %60 = mul nuw nsw i32 %8, 1
  %61 = add nuw nsw i32 0, %60
  %62 = urem i32 %61, 16
  %63 = udiv i32 %61, 16
  %64 = udiv i32 %63, 8192
  br label %concatenate.pivot.64.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %65 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %66 = sub nsw i32 %58, %65
  %67 = udiv i32 %linear_index1, 128
  %68 = mul i32 %67, 64
  %69 = add i32 %68, %66
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 64
  %72 = udiv i32 %69, 64
  %73 = urem i32 %72, 16
  %74 = udiv i32 %69, 1024
  %75 = add i32 %63, 0
  %76 = add i32 %62, 0
  %77 = add i32 %66, 0
  %78 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 0, i32 %75, i32 %76, i32 %77
  %79 = load float, ptr %78, align 4, !invariant.load !98
  br label %concatenate.6.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.64.7
  %80 = phi i32 [ 64, %concatenate.pivot.64.7 ]
  %81 = sub nsw i32 %58, %80
  %82 = udiv i32 %linear_index1, 128
  %83 = mul i32 %82, 64
  %84 = add i32 %83, %81
  %85 = udiv i32 %84, 1
  %86 = urem i32 %85, 64
  %87 = udiv i32 %84, 64
  %88 = urem i32 %87, 16
  %89 = udiv i32 %84, 1024
  %90 = add i32 %63, 0
  %91 = add i32 %62, 0
  %92 = add i32 %81, 0
  %93 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 1, i32 %90, i32 %91, i32 %92
  %94 = load float, ptr %93, align 4, !invariant.load !98
  br label %concatenate.6.merge2

concatenate.pivot.64.5:                           ; preds = %concatenate.6.merge
  %95 = icmp ult i32 %58, 64
  br i1 %95, label %concatenate.pivot.0.6, label %concatenate.pivot.64.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.64.5
  br label %concat_index_from_operand_id03

concatenate.pivot.64.7:                           ; preds = %concatenate.pivot.64.5
  br label %concat_index_from_operand_id14

concatenate.6.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %96 = phi float [ %79, %concat_index_from_operand_id03 ], [ %94, %concat_index_from_operand_id14 ]
  %97 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %96, ptr %97, align 4
  %98 = mul nuw nsw i32 %10, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 128
  %101 = mul nuw nsw i32 %11, 1
  %102 = add nuw nsw i32 0, %101
  %103 = urem i32 %102, 16
  %104 = udiv i32 %102, 16
  %105 = udiv i32 %104, 8192
  br label %concatenate.pivot.64.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %106 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %107 = sub nsw i32 %99, %106
  %108 = udiv i32 %linear_index2, 128
  %109 = mul i32 %108, 64
  %110 = add i32 %109, %107
  %111 = udiv i32 %110, 1
  %112 = urem i32 %111, 64
  %113 = udiv i32 %110, 64
  %114 = urem i32 %113, 16
  %115 = udiv i32 %110, 1024
  %116 = add i32 %104, 0
  %117 = add i32 %103, 0
  %118 = add i32 %107, 0
  %119 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 0, i32 %116, i32 %117, i32 %118
  %120 = load float, ptr %119, align 4, !invariant.load !98
  br label %concatenate.6.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.64.13
  %121 = phi i32 [ 64, %concatenate.pivot.64.13 ]
  %122 = sub nsw i32 %99, %121
  %123 = udiv i32 %linear_index2, 128
  %124 = mul i32 %123, 64
  %125 = add i32 %124, %122
  %126 = udiv i32 %125, 1
  %127 = urem i32 %126, 64
  %128 = udiv i32 %125, 64
  %129 = urem i32 %128, 16
  %130 = udiv i32 %125, 1024
  %131 = add i32 %104, 0
  %132 = add i32 %103, 0
  %133 = add i32 %122, 0
  %134 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 1, i32 %131, i32 %132, i32 %133
  %135 = load float, ptr %134, align 4, !invariant.load !98
  br label %concatenate.6.merge8

concatenate.pivot.64.11:                          ; preds = %concatenate.6.merge2
  %136 = icmp ult i32 %99, 64
  br i1 %136, label %concatenate.pivot.0.12, label %concatenate.pivot.64.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.64.11
  br label %concat_index_from_operand_id09

concatenate.pivot.64.13:                          ; preds = %concatenate.pivot.64.11
  br label %concat_index_from_operand_id110

concatenate.6.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %137 = phi float [ %120, %concat_index_from_operand_id09 ], [ %135, %concat_index_from_operand_id110 ]
  %138 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %137, ptr %138, align 4
  %139 = mul nuw nsw i32 %13, 1
  %140 = add nuw nsw i32 0, %139
  %141 = udiv i32 %140, 128
  %142 = mul nuw nsw i32 %14, 1
  %143 = add nuw nsw i32 0, %142
  %144 = urem i32 %143, 16
  %145 = udiv i32 %143, 16
  %146 = udiv i32 %145, 8192
  br label %concatenate.pivot.64.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %147 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %148 = sub nsw i32 %140, %147
  %149 = udiv i32 %linear_index3, 128
  %150 = mul i32 %149, 64
  %151 = add i32 %150, %148
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 64
  %154 = udiv i32 %151, 64
  %155 = urem i32 %154, 16
  %156 = udiv i32 %151, 1024
  %157 = add i32 %145, 0
  %158 = add i32 %144, 0
  %159 = add i32 %148, 0
  %160 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 0, i32 %157, i32 %158, i32 %159
  %161 = load float, ptr %160, align 4, !invariant.load !98
  br label %concatenate.6.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.64.19
  %162 = phi i32 [ 64, %concatenate.pivot.64.19 ]
  %163 = sub nsw i32 %140, %162
  %164 = udiv i32 %linear_index3, 128
  %165 = mul i32 %164, 64
  %166 = add i32 %165, %163
  %167 = udiv i32 %166, 1
  %168 = urem i32 %167, 64
  %169 = udiv i32 %166, 64
  %170 = urem i32 %169, 16
  %171 = udiv i32 %166, 1024
  %172 = add i32 %145, 0
  %173 = add i32 %144, 0
  %174 = add i32 %163, 0
  %175 = getelementptr inbounds [2 x [8192 x [16 x [64 x float]]]], ptr %arg0, i32 0, i32 1, i32 %172, i32 %173, i32 %174
  %176 = load float, ptr %175, align 4, !invariant.load !98
  br label %concatenate.6.merge14

concatenate.pivot.64.17:                          ; preds = %concatenate.6.merge8
  %177 = icmp ult i32 %140, 64
  br i1 %177, label %concatenate.pivot.0.18, label %concatenate.pivot.64.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.64.17
  br label %concat_index_from_operand_id015

concatenate.pivot.64.19:                          ; preds = %concatenate.pivot.64.17
  br label %concat_index_from_operand_id116

concatenate.6.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %178 = phi float [ %161, %concat_index_from_operand_id015 ], [ %176, %concat_index_from_operand_id116 ]
  %179 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %178, ptr %179, align 4
  br label %fusion_27.in_bounds-after
}

define void @fusion_26(ptr noalias align 16 dereferenceable(86016) %arg0, ptr noalias align 128 dereferenceable(86016) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !175
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 21504
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 21504
  br i1 %6, label %fusion_26.in_bounds-true, label %fusion_26.in_bounds-after

fusion_26.in_bounds-after:                        ; preds = %fusion_26.in_bounds-true, %entry
  ret void

fusion_26.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_26.in_bounds-after
}

define void @fusion_25(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 16 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(1048576) %arg2) {
entry:
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_10_constant_4 = load float, ptr @16, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_10_constant_4, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !108
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !176
  %5 = urem i32 %3, 16
  %6 = udiv i32 %3, 16
  %7 = mul i32 %4, 6
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 262144
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 16
  %thread_id.y = udiv i32 %5, 16
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 262144
  %15 = udiv i32 %8, 262144
  %16 = icmp eq i32 %14, 262143
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 16, i32 256
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 256
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
  %20 = icmp eq i32 256, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !177

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 8, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_5__1(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 4, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_5__1(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 2, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_5__1(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 1, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_5__1(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %29 = udiv i32 %thread_id.x, 32
  %30 = and i32 %thread_id.x, 15
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %32 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %33 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %33, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %34 = icmp eq i32 %tile_loop.indvar, 0
  %35 = mul i32 %tile_loop.indvar, 16
  %36 = add i32 %35, 0
  %x_loc = add i32 %36, %32
  %37 = add i32 %tile_origin.1, %y_in_tile.indvar
  %38 = add i32 %tile_origin.2, %x_loc
  %39 = mul nuw nsw i32 %38, 1
  %40 = add nuw nsw i32 0, %39
  %41 = mul nuw nsw i32 %37, 16
  %42 = add nuw nsw i32 %40, %41
  %43 = mul nuw nsw i32 %tile_origin.0, 4194304
  %44 = add nuw nsw i32 %42, %43
  %45 = udiv i32 %44, 1
  %46 = urem i32 %45, 16
  %47 = udiv i32 %44, 16
  %48 = urem i32 %47, 16
  %49 = udiv i32 %44, 256
  %50 = urem i32 %49, 8192
  %51 = udiv i32 %44, 2097152
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %44
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %44
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %multiply.3 = fmul float %Arg_0.13, %Arg_1.24
  store float %multiply.3, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_5__1(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !178

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
  %57 = mul i32 %tile_loop.indvar9, 16
  %58 = add i32 %57, 0
  %x_loc11 = add i32 %58, %54
  %59 = add i32 %tile_origin.1, %y_in_tile.indvar
  %60 = add i32 %tile_origin.2, %x_loc11
  %61 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %61, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !179

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %62 = mul nuw nsw i32 %60, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %59, 16
  %65 = add nuw nsw i32 %63, %64
  %66 = mul nuw nsw i32 %tile_origin.0, 4194304
  %67 = add nuw nsw i32 %65, %66
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 16
  %70 = udiv i32 %67, 16
  %71 = urem i32 %70, 16
  %72 = udiv i32 %67, 256
  %73 = urem i32 %72, 8192
  %74 = udiv i32 %67, 2097152
  %Arg_0.112 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !98
  %Arg_1.214 = getelementptr inbounds float, ptr %arg1, i32 %67
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !98
  %multiply.316 = fmul float %Arg_0.113, %Arg_1.215
  store float %multiply.316, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_5__1(ptr %75, ptr %reduction_input_address, ptr %return_buffer17)
  %76 = load float, ptr %return_buffer17, align 4
  store float %76, ptr %75, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %77 = mul i32 %thread_id.x, 1
  %78 = add i32 %tile_origin.1, %thread_id.y
  %79 = add i32 %tile_origin.2, %77
  %80 = add i32 %79, 0
  %81 = udiv i32 %78, 1
  %82 = urem i32 %81, 16
  %83 = udiv i32 %78, 16
  %84 = urem i32 %83, 8192
  %85 = udiv i32 %78, 131072
  %output_element_address = getelementptr inbounds [2 x [8192 x [16 x float]]], ptr %arg2, i32 0, i32 %85, i32 %84, i32 %82
  %output = load float, ptr %current_output, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_5__1(ptr dereferenceable(4) %Arg_0.6.typed, ptr dereferenceable(4) %Arg_1.7.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.8.typed = alloca float, align 4
  %Arg_0.6 = load float, ptr %Arg_0.6.typed, align 4
  %Arg_1.7 = load float, ptr %Arg_1.7.typed, align 4
  %add.8 = fadd float %Arg_0.6, %Arg_1.7
  store float %add.8, ptr %add.8.typed, align 4
  %load_ret_value = load float, ptr %add.8.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_24(ptr noalias align 16 dereferenceable(16777216) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(1048576) %arg2, ptr noalias align 16 dereferenceable(16777216) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !180
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 16
  %5 = udiv i32 %linear_index_base, 16
  %6 = urem i32 %5, 16
  %7 = udiv i32 %linear_index_base, 256
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 2097152
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 16
  %12 = udiv i32 %linear_index1, 16
  %13 = urem i32 %12, 16
  %14 = udiv i32 %linear_index1, 256
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 2097152
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 16
  %19 = udiv i32 %linear_index2, 16
  %20 = urem i32 %19, 16
  %21 = udiv i32 %linear_index2, 256
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 2097152
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 16
  %26 = udiv i32 %linear_index3, 16
  %27 = urem i32 %26, 16
  %28 = udiv i32 %linear_index3, 256
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 2097152
  %31 = icmp ult i32 %linear_index_base, 4194304
  br i1 %31, label %fusion_24.in_bounds-true, label %fusion_24.in_bounds-after

fusion_24.in_bounds-after:                        ; preds = %fusion_24.in_bounds-true, %entry
  ret void

fusion_24.in_bounds-true:                         ; preds = %entry
  %32 = getelementptr inbounds [2 x [16 x [8192 x [16 x float]]]], ptr %arg3, i32 0, i32 %9, i32 %4, i32 %8, i32 %6
  %33 = load float, ptr %32, align 4, !invariant.load !98
  %region_0_13_constant_6 = load float, ptr @17, align 4
  %compare.8 = fcmp ogt float %33, %region_0_13_constant_6
  %34 = zext i1 %compare.8 to i8
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %36 = load float, ptr %35, align 4
  %37 = udiv i32 %linear_index_base, 16
  %38 = getelementptr inbounds float, ptr %arg2, i32 %37
  %39 = load float, ptr %38, align 4, !invariant.load !98
  %subtract.10 = fsub float %36, %39
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %41 = load float, ptr %40, align 4, !invariant.load !98
  %multiply.11 = fmul float %subtract.10, %41
  %42 = trunc i8 %34 to i1
  %43 = select i1 %42, float %multiply.11, float %region_0_13_constant_6
  %44 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %43, ptr %44, align 4
  %45 = getelementptr inbounds [2 x [16 x [8192 x [16 x float]]]], ptr %arg3, i32 0, i32 %16, i32 %11, i32 %15, i32 %13
  %46 = load float, ptr %45, align 4, !invariant.load !98
  %region_0_13_constant_61 = load float, ptr @17, align 4
  %compare.82 = fcmp ogt float %46, %region_0_13_constant_61
  %47 = zext i1 %compare.82 to i8
  %48 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %49 = load float, ptr %48, align 4
  %50 = udiv i32 %linear_index1, 16
  %51 = getelementptr inbounds float, ptr %arg2, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !98
  %subtract.103 = fsub float %49, %52
  %53 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %54 = load float, ptr %53, align 4, !invariant.load !98
  %multiply.114 = fmul float %subtract.103, %54
  %55 = trunc i8 %47 to i1
  %56 = select i1 %55, float %multiply.114, float %region_0_13_constant_61
  %57 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %56, ptr %57, align 4
  %58 = getelementptr inbounds [2 x [16 x [8192 x [16 x float]]]], ptr %arg3, i32 0, i32 %23, i32 %18, i32 %22, i32 %20
  %59 = load float, ptr %58, align 4, !invariant.load !98
  %region_0_13_constant_65 = load float, ptr @17, align 4
  %compare.86 = fcmp ogt float %59, %region_0_13_constant_65
  %60 = zext i1 %compare.86 to i8
  %61 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %62 = load float, ptr %61, align 4
  %63 = udiv i32 %linear_index2, 16
  %64 = getelementptr inbounds float, ptr %arg2, i32 %63
  %65 = load float, ptr %64, align 4, !invariant.load !98
  %subtract.107 = fsub float %62, %65
  %66 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %67 = load float, ptr %66, align 4, !invariant.load !98
  %multiply.118 = fmul float %subtract.107, %67
  %68 = trunc i8 %60 to i1
  %69 = select i1 %68, float %multiply.118, float %region_0_13_constant_65
  %70 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %69, ptr %70, align 4
  %71 = getelementptr inbounds [2 x [16 x [8192 x [16 x float]]]], ptr %arg3, i32 0, i32 %30, i32 %25, i32 %29, i32 %27
  %72 = load float, ptr %71, align 4, !invariant.load !98
  %region_0_13_constant_69 = load float, ptr @17, align 4
  %compare.810 = fcmp ogt float %72, %region_0_13_constant_69
  %73 = zext i1 %compare.810 to i8
  %74 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %75 = load float, ptr %74, align 4
  %76 = udiv i32 %linear_index3, 16
  %77 = getelementptr inbounds float, ptr %arg2, i32 %76
  %78 = load float, ptr %77, align 4, !invariant.load !98
  %subtract.1011 = fsub float %75, %78
  %79 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %80 = load float, ptr %79, align 4, !invariant.load !98
  %multiply.1112 = fmul float %subtract.1011, %80
  %81 = trunc i8 %73 to i1
  %82 = select i1 %81, float %multiply.1112, float %region_0_13_constant_69
  %83 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %82, ptr %83, align 4
  br label %fusion_24.in_bounds-after
}

define void @fusion_23(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 128 dereferenceable(16777216) %arg2) {
entry:
  %return_buffer19 = alloca float, align 4
  %result_from_other_lane17 = alloca float, align 4
  %return_buffer16 = alloca float, align 4
  %result_from_other_lane14 = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %result_from_other_lane11 = alloca float, align 4
  %return_buffer10 = alloca float, align 4
  %result_from_other_lane8 = alloca float, align 4
  %return_buffer7 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_3 = load float, ptr @18, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_3, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !160
  %5 = urem i32 %3, 1024
  %6 = udiv i32 %3, 1024
  %7 = mul i32 %4, 1
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 512
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
  %tile_bound = select i1 %16, i32 512, i32 4096
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 16, i32 32
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
  br label %tile_loop.loop_header, !llvm.loop !181

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !182

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache28, i32 0, i32 %6, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %28 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %29 = load float, ptr %current_output, align 4
  store float %29, ptr %28, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache28, i32 0, i32 %6, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %30 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result6 = load float, ptr %30, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result6, i32 16, i32 31)
  store float %31, ptr %result_from_other_lane, align 4
  call void @region_1_4__2(ptr %30, ptr %result_from_other_lane, ptr %return_buffer7)
  %32 = load float, ptr %return_buffer7, align 4
  store float %32, ptr %30, align 4
  %partial_reduction_result9 = load float, ptr %30, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result9, i32 8, i32 31)
  store float %33, ptr %result_from_other_lane8, align 4
  call void @region_1_4__2(ptr %30, ptr %result_from_other_lane8, ptr %return_buffer10)
  %34 = load float, ptr %return_buffer10, align 4
  store float %34, ptr %30, align 4
  %partial_reduction_result12 = load float, ptr %30, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result12, i32 4, i32 31)
  store float %35, ptr %result_from_other_lane11, align 4
  call void @region_1_4__2(ptr %30, ptr %result_from_other_lane11, ptr %return_buffer13)
  %36 = load float, ptr %return_buffer13, align 4
  store float %36, ptr %30, align 4
  %partial_reduction_result15 = load float, ptr %30, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result15, i32 2, i32 31)
  store float %37, ptr %result_from_other_lane14, align 4
  call void @region_1_4__2(ptr %30, ptr %result_from_other_lane14, ptr %return_buffer16)
  %38 = load float, ptr %return_buffer16, align 4
  store float %38, ptr %30, align 4
  %partial_reduction_result18 = load float, ptr %30, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 1, i32 31)
  store float %39, ptr %result_from_other_lane17, align 4
  call void @region_1_4__2(ptr %30, ptr %result_from_other_lane17, ptr %return_buffer19)
  %40 = load float, ptr %return_buffer19, align 4
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
  %49 = mul nuw nsw i32 %25, 16
  %50 = add nuw nsw i32 %48, %49
  %51 = mul nuw nsw i32 %tile_origin.0, 8192
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 16
  %55 = udiv i32 %52, 16
  %56 = urem i32 %55, 512
  %57 = udiv i32 %52, 8192
  %58 = mul i32 %thread_id.x, 1
  %59 = sub i32 %x_loc, %58
  %60 = mul nuw nsw i32 %54, 1
  %61 = add nuw nsw i32 0, %60
  %62 = udiv i32 %61, 16
  %63 = mul nuw nsw i32 %56, 1
  %64 = add nuw nsw i32 0, %63
  %65 = mul nuw nsw i32 %57, 512
  %66 = add nuw nsw i32 %64, %65
  %67 = urem i32 %66, 16
  %68 = udiv i32 %66, 16
  %69 = urem i32 %68, 8192
  %70 = udiv i32 %68, 8192
  %71 = udiv i32 %70, 2
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %72 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %59
  call void @region_1_4__2(ptr %72, ptr %reduction_input_address, ptr %return_buffer)
  %73 = load float, ptr %return_buffer, align 4
  store float %73, ptr %72, align 4
  %74 = mul nuw nsw i32 %54, 1
  %75 = add nuw nsw i32 0, %74
  %76 = udiv i32 %75, 16
  %77 = mul nuw nsw i32 %56, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %57, 512
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 262144
  %82 = mul nuw nsw i32 %75, 1
  %83 = add nuw nsw i32 0, %82
  %84 = udiv i32 %83, 16
  %85 = mul nuw nsw i32 %80, 1
  %86 = add nuw nsw i32 0, %85
  %87 = urem i32 %86, 8192
  %88 = udiv i32 %86, 8192
  %89 = urem i32 %88, 2
  %90 = udiv i32 %88, 2
  %91 = udiv i32 %90, 16
  %Arg_0.14 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 %89, i32 %87, i32 %90, i32 %83
  %Arg_0.15 = load float, ptr %Arg_0.14, align 4, !invariant.load !98
  %92 = mul nuw nsw i32 %54, 1
  %93 = add nuw nsw i32 0, %92
  %94 = udiv i32 %93, 16
  %95 = mul nuw nsw i32 %56, 1
  %96 = add nuw nsw i32 0, %95
  %97 = mul nuw nsw i32 %57, 512
  %98 = add nuw nsw i32 %96, %97
  %99 = udiv i32 %98, 262144
  %100 = getelementptr inbounds float, ptr %arg2, i32 %52
  store float %Arg_0.15, ptr %100, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %101 = mul i32 %thread_id.y, 1
  %102 = add i32 %tile_origin.1, %thread_id.x
  %103 = add i32 %tile_origin.2, %101
  %104 = add i32 %103, 0
  %105 = mul i32 %tile_origin.0, 16
  %106 = add i32 %105, %104
  %107 = udiv i32 %106, 1
  %108 = urem i32 %107, 16
  %109 = udiv i32 %106, 16
  %output_element_address = getelementptr inbounds [512 x [16 x float]], ptr %arg1, i32 0, i32 %109, i32 %108
  %output = load float, ptr %30, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_4__2(ptr dereferenceable(4) %Arg_0.5.typed, ptr dereferenceable(4) %Arg_1.6.typed, ptr dereferenceable(4) %output_arg) {
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

define void @reduce_615(ptr noalias align 128 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(64) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !98
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %5 = urem i32 %3, 1024
  %6 = udiv i32 %3, 1024
  %7 = mul i32 %4, 1
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 1
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
  %tile_bound = select i1 %16, i32 512, i32 4096
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 16, i32 32
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
  br label %tile_loop.loop_header, !llvm.loop !183

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !184

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache29, i32 0, i32 %6, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %28 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %29 = load float, ptr %current_output, align 4
  store float %29, ptr %28, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache29, i32 0, i32 %6, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %30 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result4 = load float, ptr %30, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result4, i32 16, i32 31)
  store float %31, ptr %result_from_other_lane, align 4
  call void @region_1_3__1(ptr %30, ptr %result_from_other_lane, ptr %return_buffer5)
  %32 = load float, ptr %return_buffer5, align 4
  store float %32, ptr %30, align 4
  %partial_reduction_result7 = load float, ptr %30, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result7, i32 8, i32 31)
  store float %33, ptr %result_from_other_lane6, align 4
  call void @region_1_3__1(ptr %30, ptr %result_from_other_lane6, ptr %return_buffer8)
  %34 = load float, ptr %return_buffer8, align 4
  store float %34, ptr %30, align 4
  %partial_reduction_result10 = load float, ptr %30, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 4, i32 31)
  store float %35, ptr %result_from_other_lane9, align 4
  call void @region_1_3__1(ptr %30, ptr %result_from_other_lane9, ptr %return_buffer11)
  %36 = load float, ptr %return_buffer11, align 4
  store float %36, ptr %30, align 4
  %partial_reduction_result13 = load float, ptr %30, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 2, i32 31)
  store float %37, ptr %result_from_other_lane12, align 4
  call void @region_1_3__1(ptr %30, ptr %result_from_other_lane12, ptr %return_buffer14)
  %38 = load float, ptr %return_buffer14, align 4
  store float %38, ptr %30, align 4
  %partial_reduction_result16 = load float, ptr %30, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 1, i32 31)
  store float %39, ptr %result_from_other_lane15, align 4
  call void @region_1_3__1(ptr %30, ptr %result_from_other_lane15, ptr %return_buffer17)
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
  %47 = mul i32 %thread_id.x, 1
  %48 = sub i32 %x_loc, %47
  %Arg_0.1 = getelementptr inbounds [512 x [16 x float]], ptr %arg0, i32 0, i32 %25, i32 %26
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %49 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %48
  call void @region_1_3__1(ptr %49, ptr %reduction_input_address, ptr %return_buffer)
  %50 = load float, ptr %return_buffer, align 4
  store float %50, ptr %49, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %51 = mul i32 %thread_id.y, 1
  %52 = add i32 %tile_origin.1, %thread_id.x
  %53 = add i32 %tile_origin.2, %51
  %54 = add i32 %53, 0
  %55 = mul i32 %tile_origin.0, 16
  %56 = add i32 %55, %54
  %57 = udiv i32 %56, 1
  %output_element_address = getelementptr inbounds [16 x float], ptr %arg2, i32 0, i32 %57
  %output = load float, ptr %30, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_3__1(ptr dereferenceable(4) %Arg_0.4.typed, ptr dereferenceable(4) %Arg_1.5.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.6.typed = alloca float, align 4
  %Arg_0.4 = load float, ptr %Arg_0.4.typed, align 4
  %Arg_1.5 = load float, ptr %Arg_1.5.typed, align 4
  %add.6 = fadd float %Arg_0.4, %Arg_1.5
  store float %add.6, ptr %add.6.typed, align 4
  %load_ret_value = load float, ptr %add.6.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_22(ptr noalias align 16 dereferenceable(64) %arg0, ptr noalias align 128 dereferenceable(64) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !185
  %2 = mul nuw nsw i32 %0, 16
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 16
  br i1 %4, label %fusion_22.in_bounds-true, label %fusion_22.in_bounds-after

fusion_22.in_bounds-after:                        ; preds = %fusion_22.in_bounds-true, %entry
  ret void

fusion_22.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !98
  %7 = load float, ptr %arg2, align 4, !invariant.load !98
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.5 = fmul float %7, %9
  %subtract.6 = fsub float %6, %multiply.5
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %10, align 4
  br label %fusion_22.in_bounds-after
}

define void @fusion_19(ptr noalias align 16 dereferenceable(2048) %arg0, ptr noalias align 128 dereferenceable(2048) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !107
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !160
  %2 = mul nuw nsw i32 %0, 512
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 512
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 16
  %5 = udiv i32 %linear_index, 16
  %6 = icmp ult i32 %linear_index, 512
  br i1 %6, label %fusion_19.in_bounds-true, label %fusion_19.in_bounds-after

fusion_19.in_bounds-after:                        ; preds = %fusion_19.in_bounds-true, %entry
  ret void

fusion_19.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_19.in_bounds-after
}

define void @fusion_18(ptr noalias align 16 dereferenceable(4) %arg0, ptr noalias align 128 dereferenceable(33554432) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(16777216) %arg3, ptr noalias align 128 dereferenceable(16777216) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !180
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 16
  %5 = udiv i32 %linear_index_base, 16
  %6 = urem i32 %5, 16
  %7 = udiv i32 %linear_index_base, 256
  %8 = urem i32 %7, 8192
  %9 = udiv i32 %linear_index_base, 2097152
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 16
  %12 = udiv i32 %linear_index1, 16
  %13 = urem i32 %12, 16
  %14 = udiv i32 %linear_index1, 256
  %15 = urem i32 %14, 8192
  %16 = udiv i32 %linear_index1, 2097152
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 16
  %19 = udiv i32 %linear_index2, 16
  %20 = urem i32 %19, 16
  %21 = udiv i32 %linear_index2, 256
  %22 = urem i32 %21, 8192
  %23 = udiv i32 %linear_index2, 2097152
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 16
  %26 = udiv i32 %linear_index3, 16
  %27 = urem i32 %26, 16
  %28 = udiv i32 %linear_index3, 256
  %29 = urem i32 %28, 8192
  %30 = udiv i32 %linear_index3, 2097152
  %31 = icmp ult i32 %linear_index_base, 4194304
  br i1 %31, label %fusion_18.in_bounds-true, label %fusion_18.in_bounds-after

fusion_18.in_bounds-after:                        ; preds = %fusion_18.in_bounds-true, %entry
  ret void

fusion_18.in_bounds-true:                         ; preds = %entry
  %32 = add i32 %9, 0
  %33 = add i32 %8, 0
  %34 = add i32 %6, 0
  %35 = add i32 %4, 16
  %36 = mul nuw nsw i32 %35, 1
  %37 = add nuw nsw i32 0, %36
  %38 = udiv i32 %37, 32
  %39 = mul nuw nsw i32 %34, 1
  %40 = add nuw nsw i32 0, %39
  %41 = mul nuw nsw i32 %33, 16
  %42 = add nuw nsw i32 %40, %41
  %43 = mul nuw nsw i32 %32, 131072
  %44 = add nuw nsw i32 %42, %43
  %45 = udiv i32 %44, 262144
  %46 = getelementptr inbounds [262144 x [32 x float]], ptr %arg1, i32 0, i32 %44, i32 %37
  %47 = load float, ptr %46, align 4, !invariant.load !98
  %48 = load float, ptr %arg0, align 4, !invariant.load !98
  %multiply.7 = fmul float %47, %48
  %49 = insertvalue { float, float } undef, float %multiply.7, 0
  %50 = add i32 %9, 0
  %51 = add i32 %8, 0
  %52 = add i32 %6, 0
  %53 = add i32 %4, 0
  %54 = mul nuw nsw i32 %53, 1
  %55 = add nuw nsw i32 0, %54
  %56 = udiv i32 %55, 32
  %57 = mul nuw nsw i32 %52, 1
  %58 = add nuw nsw i32 0, %57
  %59 = mul nuw nsw i32 %51, 16
  %60 = add nuw nsw i32 %58, %59
  %61 = mul nuw nsw i32 %50, 131072
  %62 = add nuw nsw i32 %60, %61
  %63 = udiv i32 %62, 262144
  %64 = getelementptr inbounds [262144 x [32 x float]], ptr %arg1, i32 0, i32 %62, i32 %55
  %65 = load float, ptr %64, align 4, !invariant.load !98
  %66 = load float, ptr %arg2, align 4, !invariant.load !98
  %multiply.10 = fmul float %65, %66
  %67 = insertvalue { float, float } %49, float %multiply.10, 1
  %68 = extractvalue { float, float } %67, 0
  %69 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %68, ptr %69, align 4
  %70 = extractvalue { float, float } %67, 1
  %71 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %70, ptr %71, align 4
  %72 = add i32 %16, 0
  %73 = add i32 %15, 0
  %74 = add i32 %13, 0
  %75 = add i32 %11, 16
  %76 = mul nuw nsw i32 %75, 1
  %77 = add nuw nsw i32 0, %76
  %78 = udiv i32 %77, 32
  %79 = mul nuw nsw i32 %74, 1
  %80 = add nuw nsw i32 0, %79
  %81 = mul nuw nsw i32 %73, 16
  %82 = add nuw nsw i32 %80, %81
  %83 = mul nuw nsw i32 %72, 131072
  %84 = add nuw nsw i32 %82, %83
  %85 = udiv i32 %84, 262144
  %86 = getelementptr inbounds [262144 x [32 x float]], ptr %arg1, i32 0, i32 %84, i32 %77
  %87 = load float, ptr %86, align 4, !invariant.load !98
  %88 = load float, ptr %arg0, align 4, !invariant.load !98
  %multiply.71 = fmul float %87, %88
  %89 = insertvalue { float, float } undef, float %multiply.71, 0
  %90 = add i32 %16, 0
  %91 = add i32 %15, 0
  %92 = add i32 %13, 0
  %93 = add i32 %11, 0
  %94 = mul nuw nsw i32 %93, 1
  %95 = add nuw nsw i32 0, %94
  %96 = udiv i32 %95, 32
  %97 = mul nuw nsw i32 %92, 1
  %98 = add nuw nsw i32 0, %97
  %99 = mul nuw nsw i32 %91, 16
  %100 = add nuw nsw i32 %98, %99
  %101 = mul nuw nsw i32 %90, 131072
  %102 = add nuw nsw i32 %100, %101
  %103 = udiv i32 %102, 262144
  %104 = getelementptr inbounds [262144 x [32 x float]], ptr %arg1, i32 0, i32 %102, i32 %95
  %105 = load float, ptr %104, align 4, !invariant.load !98
  %106 = load float, ptr %arg2, align 4, !invariant.load !98
  %multiply.102 = fmul float %105, %106
  %107 = insertvalue { float, float } %89, float %multiply.102, 1
  %108 = extractvalue { float, float } %107, 0
  %109 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %108, ptr %109, align 4
  %110 = extractvalue { float, float } %107, 1
  %111 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %110, ptr %111, align 4
  %112 = add i32 %23, 0
  %113 = add i32 %22, 0
  %114 = add i32 %20, 0
  %115 = add i32 %18, 16
  %116 = mul nuw nsw i32 %115, 1
  %117 = add nuw nsw i32 0, %116
  %118 = udiv i32 %117, 32
  %119 = mul nuw nsw i32 %114, 1
  %120 = add nuw nsw i32 0, %119
  %121 = mul nuw nsw i32 %113, 16
  %122 = add nuw nsw i32 %120, %121
  %123 = mul nuw nsw i32 %112, 131072
  %124 = add nuw nsw i32 %122, %123
  %125 = udiv i32 %124, 262144
  %126 = getelementptr inbounds [262144 x [32 x float]], ptr %arg1, i32 0, i32 %124, i32 %117
  %127 = load float, ptr %126, align 4, !invariant.load !98
  %128 = load float, ptr %arg0, align 4, !invariant.load !98
  %multiply.73 = fmul float %127, %128
  %129 = insertvalue { float, float } undef, float %multiply.73, 0
  %130 = add i32 %23, 0
  %131 = add i32 %22, 0
  %132 = add i32 %20, 0
  %133 = add i32 %18, 0
  %134 = mul nuw nsw i32 %133, 1
  %135 = add nuw nsw i32 0, %134
  %136 = udiv i32 %135, 32
  %137 = mul nuw nsw i32 %132, 1
  %138 = add nuw nsw i32 0, %137
  %139 = mul nuw nsw i32 %131, 16
  %140 = add nuw nsw i32 %138, %139
  %141 = mul nuw nsw i32 %130, 131072
  %142 = add nuw nsw i32 %140, %141
  %143 = udiv i32 %142, 262144
  %144 = getelementptr inbounds [262144 x [32 x float]], ptr %arg1, i32 0, i32 %142, i32 %135
  %145 = load float, ptr %144, align 4, !invariant.load !98
  %146 = load float, ptr %arg2, align 4, !invariant.load !98
  %multiply.104 = fmul float %145, %146
  %147 = insertvalue { float, float } %129, float %multiply.104, 1
  %148 = extractvalue { float, float } %147, 0
  %149 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %148, ptr %149, align 4
  %150 = extractvalue { float, float } %147, 1
  %151 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %150, ptr %151, align 4
  %152 = add i32 %30, 0
  %153 = add i32 %29, 0
  %154 = add i32 %27, 0
  %155 = add i32 %25, 16
  %156 = mul nuw nsw i32 %155, 1
  %157 = add nuw nsw i32 0, %156
  %158 = udiv i32 %157, 32
  %159 = mul nuw nsw i32 %154, 1
  %160 = add nuw nsw i32 0, %159
  %161 = mul nuw nsw i32 %153, 16
  %162 = add nuw nsw i32 %160, %161
  %163 = mul nuw nsw i32 %152, 131072
  %164 = add nuw nsw i32 %162, %163
  %165 = udiv i32 %164, 262144
  %166 = getelementptr inbounds [262144 x [32 x float]], ptr %arg1, i32 0, i32 %164, i32 %157
  %167 = load float, ptr %166, align 4, !invariant.load !98
  %168 = load float, ptr %arg0, align 4, !invariant.load !98
  %multiply.75 = fmul float %167, %168
  %169 = insertvalue { float, float } undef, float %multiply.75, 0
  %170 = add i32 %30, 0
  %171 = add i32 %29, 0
  %172 = add i32 %27, 0
  %173 = add i32 %25, 0
  %174 = mul nuw nsw i32 %173, 1
  %175 = add nuw nsw i32 0, %174
  %176 = udiv i32 %175, 32
  %177 = mul nuw nsw i32 %172, 1
  %178 = add nuw nsw i32 0, %177
  %179 = mul nuw nsw i32 %171, 16
  %180 = add nuw nsw i32 %178, %179
  %181 = mul nuw nsw i32 %170, 131072
  %182 = add nuw nsw i32 %180, %181
  %183 = udiv i32 %182, 262144
  %184 = getelementptr inbounds [262144 x [32 x float]], ptr %arg1, i32 0, i32 %182, i32 %175
  %185 = load float, ptr %184, align 4, !invariant.load !98
  %186 = load float, ptr %arg2, align 4, !invariant.load !98
  %multiply.106 = fmul float %185, %186
  %187 = insertvalue { float, float } %169, float %multiply.106, 1
  %188 = extractvalue { float, float } %187, 0
  %189 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %188, ptr %189, align 4
  %190 = extractvalue { float, float } %187, 1
  %191 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %190, ptr %191, align 4
  br label %fusion_18.in_bounds-after
}

define void @fusion_15(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !180
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 32
  %5 = udiv i32 %linear_index_base, 32
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 32
  %8 = udiv i32 %linear_index1, 32
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 32
  %11 = udiv i32 %linear_index2, 32
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 32
  %14 = udiv i32 %linear_index3, 32
  %15 = icmp ult i32 %linear_index_base, 4194304
  br i1 %15, label %fusion_15.in_bounds-true, label %fusion_15.in_bounds-after

fusion_15.in_bounds-after:                        ; preds = %concatenate.6.merge14, %entry
  ret void

fusion_15.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 32
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 16
  %22 = udiv i32 %20, 16
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.16.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 32
  %27 = mul i32 %26, 16
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 16
  %31 = udiv i32 %28, 16
  %32 = urem i32 %31, 16
  %33 = udiv i32 %28, 256
  %34 = add i32 %22, 0
  %35 = add i32 %21, 0
  %36 = add i32 %25, 0
  %37 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 0, i32 %34, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !98
  br label %concatenate.6.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.16.1
  %39 = phi i32 [ 16, %concatenate.pivot.16.1 ]
  %40 = sub nsw i32 %17, %39
  %41 = udiv i32 %linear_index_base, 32
  %42 = mul i32 %41, 16
  %43 = add i32 %42, %40
  %44 = udiv i32 %43, 1
  %45 = urem i32 %44, 16
  %46 = udiv i32 %43, 16
  %47 = urem i32 %46, 16
  %48 = udiv i32 %43, 256
  %49 = add i32 %22, 0
  %50 = add i32 %21, 0
  %51 = add i32 %40, 0
  %52 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 1, i32 %49, i32 %50, i32 %51
  %53 = load float, ptr %52, align 4, !invariant.load !98
  br label %concatenate.6.merge

concatenate.pivot.16.:                            ; preds = %fusion_15.in_bounds-true
  %54 = icmp ult i32 %17, 16
  br i1 %54, label %concatenate.pivot.0., label %concatenate.pivot.16.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id0

concatenate.pivot.16.1:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id1

concatenate.6.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %55 = phi float [ %38, %concat_index_from_operand_id0 ], [ %53, %concat_index_from_operand_id1 ]
  %56 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %55, ptr %56, align 4
  %57 = mul nuw nsw i32 %7, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 32
  %60 = mul nuw nsw i32 %8, 1
  %61 = add nuw nsw i32 0, %60
  %62 = urem i32 %61, 16
  %63 = udiv i32 %61, 16
  %64 = udiv i32 %63, 8192
  br label %concatenate.pivot.16.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %65 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %66 = sub nsw i32 %58, %65
  %67 = udiv i32 %linear_index1, 32
  %68 = mul i32 %67, 16
  %69 = add i32 %68, %66
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 16
  %72 = udiv i32 %69, 16
  %73 = urem i32 %72, 16
  %74 = udiv i32 %69, 256
  %75 = add i32 %63, 0
  %76 = add i32 %62, 0
  %77 = add i32 %66, 0
  %78 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 0, i32 %75, i32 %76, i32 %77
  %79 = load float, ptr %78, align 4, !invariant.load !98
  br label %concatenate.6.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.16.7
  %80 = phi i32 [ 16, %concatenate.pivot.16.7 ]
  %81 = sub nsw i32 %58, %80
  %82 = udiv i32 %linear_index1, 32
  %83 = mul i32 %82, 16
  %84 = add i32 %83, %81
  %85 = udiv i32 %84, 1
  %86 = urem i32 %85, 16
  %87 = udiv i32 %84, 16
  %88 = urem i32 %87, 16
  %89 = udiv i32 %84, 256
  %90 = add i32 %63, 0
  %91 = add i32 %62, 0
  %92 = add i32 %81, 0
  %93 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 1, i32 %90, i32 %91, i32 %92
  %94 = load float, ptr %93, align 4, !invariant.load !98
  br label %concatenate.6.merge2

concatenate.pivot.16.5:                           ; preds = %concatenate.6.merge
  %95 = icmp ult i32 %58, 16
  br i1 %95, label %concatenate.pivot.0.6, label %concatenate.pivot.16.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.16.5
  br label %concat_index_from_operand_id03

concatenate.pivot.16.7:                           ; preds = %concatenate.pivot.16.5
  br label %concat_index_from_operand_id14

concatenate.6.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %96 = phi float [ %79, %concat_index_from_operand_id03 ], [ %94, %concat_index_from_operand_id14 ]
  %97 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %96, ptr %97, align 4
  %98 = mul nuw nsw i32 %10, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 32
  %101 = mul nuw nsw i32 %11, 1
  %102 = add nuw nsw i32 0, %101
  %103 = urem i32 %102, 16
  %104 = udiv i32 %102, 16
  %105 = udiv i32 %104, 8192
  br label %concatenate.pivot.16.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %106 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %107 = sub nsw i32 %99, %106
  %108 = udiv i32 %linear_index2, 32
  %109 = mul i32 %108, 16
  %110 = add i32 %109, %107
  %111 = udiv i32 %110, 1
  %112 = urem i32 %111, 16
  %113 = udiv i32 %110, 16
  %114 = urem i32 %113, 16
  %115 = udiv i32 %110, 256
  %116 = add i32 %104, 0
  %117 = add i32 %103, 0
  %118 = add i32 %107, 0
  %119 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 0, i32 %116, i32 %117, i32 %118
  %120 = load float, ptr %119, align 4, !invariant.load !98
  br label %concatenate.6.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.16.13
  %121 = phi i32 [ 16, %concatenate.pivot.16.13 ]
  %122 = sub nsw i32 %99, %121
  %123 = udiv i32 %linear_index2, 32
  %124 = mul i32 %123, 16
  %125 = add i32 %124, %122
  %126 = udiv i32 %125, 1
  %127 = urem i32 %126, 16
  %128 = udiv i32 %125, 16
  %129 = urem i32 %128, 16
  %130 = udiv i32 %125, 256
  %131 = add i32 %104, 0
  %132 = add i32 %103, 0
  %133 = add i32 %122, 0
  %134 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 1, i32 %131, i32 %132, i32 %133
  %135 = load float, ptr %134, align 4, !invariant.load !98
  br label %concatenate.6.merge8

concatenate.pivot.16.11:                          ; preds = %concatenate.6.merge2
  %136 = icmp ult i32 %99, 16
  br i1 %136, label %concatenate.pivot.0.12, label %concatenate.pivot.16.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.16.11
  br label %concat_index_from_operand_id09

concatenate.pivot.16.13:                          ; preds = %concatenate.pivot.16.11
  br label %concat_index_from_operand_id110

concatenate.6.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %137 = phi float [ %120, %concat_index_from_operand_id09 ], [ %135, %concat_index_from_operand_id110 ]
  %138 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %137, ptr %138, align 4
  %139 = mul nuw nsw i32 %13, 1
  %140 = add nuw nsw i32 0, %139
  %141 = udiv i32 %140, 32
  %142 = mul nuw nsw i32 %14, 1
  %143 = add nuw nsw i32 0, %142
  %144 = urem i32 %143, 16
  %145 = udiv i32 %143, 16
  %146 = udiv i32 %145, 8192
  br label %concatenate.pivot.16.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %147 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %148 = sub nsw i32 %140, %147
  %149 = udiv i32 %linear_index3, 32
  %150 = mul i32 %149, 16
  %151 = add i32 %150, %148
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 16
  %154 = udiv i32 %151, 16
  %155 = urem i32 %154, 16
  %156 = udiv i32 %151, 256
  %157 = add i32 %145, 0
  %158 = add i32 %144, 0
  %159 = add i32 %148, 0
  %160 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 0, i32 %157, i32 %158, i32 %159
  %161 = load float, ptr %160, align 4, !invariant.load !98
  br label %concatenate.6.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.16.19
  %162 = phi i32 [ 16, %concatenate.pivot.16.19 ]
  %163 = sub nsw i32 %140, %162
  %164 = udiv i32 %linear_index3, 32
  %165 = mul i32 %164, 16
  %166 = add i32 %165, %163
  %167 = udiv i32 %166, 1
  %168 = urem i32 %167, 16
  %169 = udiv i32 %166, 16
  %170 = urem i32 %169, 16
  %171 = udiv i32 %166, 256
  %172 = add i32 %145, 0
  %173 = add i32 %144, 0
  %174 = add i32 %163, 0
  %175 = getelementptr inbounds [2 x [8192 x [16 x [16 x float]]]], ptr %arg0, i32 0, i32 1, i32 %172, i32 %173, i32 %174
  %176 = load float, ptr %175, align 4, !invariant.load !98
  br label %concatenate.6.merge14

concatenate.pivot.16.17:                          ; preds = %concatenate.6.merge8
  %177 = icmp ult i32 %140, 16
  br i1 %177, label %concatenate.pivot.0.18, label %concatenate.pivot.16.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.16.17
  br label %concat_index_from_operand_id015

concatenate.pivot.16.19:                          ; preds = %concatenate.pivot.16.17
  br label %concat_index_from_operand_id116

concatenate.6.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %178 = phi float [ %161, %concat_index_from_operand_id015 ], [ %176, %concat_index_from_operand_id116 ]
  %179 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %178, ptr %179, align 4
  br label %fusion_15.in_bounds-after
}

define void @fusion_16(ptr noalias align 16 dereferenceable(5120) %arg0, ptr noalias align 128 dereferenceable(5120) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(5120) %arg3, ptr noalias align 128 dereferenceable(5120) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2048
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 32
  %5 = udiv i32 %linear_index, 32
  %6 = icmp ult i32 %linear_index, 1280
  br i1 %6, label %fusion_16.in_bounds-true, label %fusion_16.in_bounds-after

fusion_16.in_bounds-after:                        ; preds = %fusion_16.in_bounds-true, %entry
  ret void

fusion_16.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !98
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.9 = fmul float %9, %16
  %subtract.10 = fsub float %14, %multiply.9
  %17 = insertvalue { float, float } %12, float %subtract.10, 1
  %18 = extractvalue { float, float } %17, 0
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %18, ptr %19, align 4
  %20 = extractvalue { float, float } %17, 1
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %20, ptr %21, align 4
  br label %fusion_16.in_bounds-after
}

define void @fusion_10(ptr noalias align 128 dereferenceable(33554432) %arg0, ptr noalias align 128 dereferenceable(33554432) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !100
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2097152
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
  %15 = icmp ult i32 %linear_index_base, 8388608
  br i1 %15, label %fusion_10.in_bounds-true, label %fusion_10.in_bounds-after

fusion_10.in_bounds-after:                        ; preds = %concatenate.6.merge14, %entry
  ret void

fusion_10.in_bounds-true:                         ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 64
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 16
  %22 = udiv i32 %20, 16
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.32.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 64
  %27 = mul i32 %26, 32
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 32
  %31 = udiv i32 %28, 32
  %32 = urem i32 %31, 16
  %33 = udiv i32 %28, 512
  %34 = add i32 %22, 0
  %35 = add i32 %21, 0
  %36 = add i32 %25, 0
  %37 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr %arg0, i32 0, i32 0, i32 %34, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !98
  br label %concatenate.6.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.32.1
  %39 = phi i32 [ 32, %concatenate.pivot.32.1 ]
  %40 = sub nsw i32 %17, %39
  %41 = udiv i32 %linear_index_base, 64
  %42 = mul i32 %41, 32
  %43 = add i32 %42, %40
  %44 = udiv i32 %43, 1
  %45 = urem i32 %44, 32
  %46 = udiv i32 %43, 32
  %47 = urem i32 %46, 16
  %48 = udiv i32 %43, 512
  %49 = add i32 %22, 0
  %50 = add i32 %21, 0
  %51 = add i32 %40, 0
  %52 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr %arg0, i32 0, i32 1, i32 %49, i32 %50, i32 %51
  %53 = load float, ptr %52, align 4, !invariant.load !98
  br label %concatenate.6.merge

concatenate.pivot.32.:                            ; preds = %fusion_10.in_bounds-true
  %54 = icmp ult i32 %17, 32
  br i1 %54, label %concatenate.pivot.0., label %concatenate.pivot.32.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.32.
  br label %concat_index_from_operand_id0

concatenate.pivot.32.1:                           ; preds = %concatenate.pivot.32.
  br label %concat_index_from_operand_id1

concatenate.6.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %55 = phi float [ %38, %concat_index_from_operand_id0 ], [ %53, %concat_index_from_operand_id1 ]
  %56 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %55, ptr %56, align 4
  %57 = mul nuw nsw i32 %7, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 64
  %60 = mul nuw nsw i32 %8, 1
  %61 = add nuw nsw i32 0, %60
  %62 = urem i32 %61, 16
  %63 = udiv i32 %61, 16
  %64 = udiv i32 %63, 8192
  br label %concatenate.pivot.32.5

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.6
  %65 = phi i32 [ 0, %concatenate.pivot.0.6 ]
  %66 = sub nsw i32 %58, %65
  %67 = udiv i32 %linear_index1, 64
  %68 = mul i32 %67, 32
  %69 = add i32 %68, %66
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 32
  %72 = udiv i32 %69, 32
  %73 = urem i32 %72, 16
  %74 = udiv i32 %69, 512
  %75 = add i32 %63, 0
  %76 = add i32 %62, 0
  %77 = add i32 %66, 0
  %78 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr %arg0, i32 0, i32 0, i32 %75, i32 %76, i32 %77
  %79 = load float, ptr %78, align 4, !invariant.load !98
  br label %concatenate.6.merge2

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.32.7
  %80 = phi i32 [ 32, %concatenate.pivot.32.7 ]
  %81 = sub nsw i32 %58, %80
  %82 = udiv i32 %linear_index1, 64
  %83 = mul i32 %82, 32
  %84 = add i32 %83, %81
  %85 = udiv i32 %84, 1
  %86 = urem i32 %85, 32
  %87 = udiv i32 %84, 32
  %88 = urem i32 %87, 16
  %89 = udiv i32 %84, 512
  %90 = add i32 %63, 0
  %91 = add i32 %62, 0
  %92 = add i32 %81, 0
  %93 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr %arg0, i32 0, i32 1, i32 %90, i32 %91, i32 %92
  %94 = load float, ptr %93, align 4, !invariant.load !98
  br label %concatenate.6.merge2

concatenate.pivot.32.5:                           ; preds = %concatenate.6.merge
  %95 = icmp ult i32 %58, 32
  br i1 %95, label %concatenate.pivot.0.6, label %concatenate.pivot.32.7

concatenate.pivot.0.6:                            ; preds = %concatenate.pivot.32.5
  br label %concat_index_from_operand_id03

concatenate.pivot.32.7:                           ; preds = %concatenate.pivot.32.5
  br label %concat_index_from_operand_id14

concatenate.6.merge2:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id03
  %96 = phi float [ %79, %concat_index_from_operand_id03 ], [ %94, %concat_index_from_operand_id14 ]
  %97 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %96, ptr %97, align 4
  %98 = mul nuw nsw i32 %10, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 64
  %101 = mul nuw nsw i32 %11, 1
  %102 = add nuw nsw i32 0, %101
  %103 = urem i32 %102, 16
  %104 = udiv i32 %102, 16
  %105 = udiv i32 %104, 8192
  br label %concatenate.pivot.32.11

concat_index_from_operand_id09:                   ; preds = %concatenate.pivot.0.12
  %106 = phi i32 [ 0, %concatenate.pivot.0.12 ]
  %107 = sub nsw i32 %99, %106
  %108 = udiv i32 %linear_index2, 64
  %109 = mul i32 %108, 32
  %110 = add i32 %109, %107
  %111 = udiv i32 %110, 1
  %112 = urem i32 %111, 32
  %113 = udiv i32 %110, 32
  %114 = urem i32 %113, 16
  %115 = udiv i32 %110, 512
  %116 = add i32 %104, 0
  %117 = add i32 %103, 0
  %118 = add i32 %107, 0
  %119 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr %arg0, i32 0, i32 0, i32 %116, i32 %117, i32 %118
  %120 = load float, ptr %119, align 4, !invariant.load !98
  br label %concatenate.6.merge8

concat_index_from_operand_id110:                  ; preds = %concatenate.pivot.32.13
  %121 = phi i32 [ 32, %concatenate.pivot.32.13 ]
  %122 = sub nsw i32 %99, %121
  %123 = udiv i32 %linear_index2, 64
  %124 = mul i32 %123, 32
  %125 = add i32 %124, %122
  %126 = udiv i32 %125, 1
  %127 = urem i32 %126, 32
  %128 = udiv i32 %125, 32
  %129 = urem i32 %128, 16
  %130 = udiv i32 %125, 512
  %131 = add i32 %104, 0
  %132 = add i32 %103, 0
  %133 = add i32 %122, 0
  %134 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr %arg0, i32 0, i32 1, i32 %131, i32 %132, i32 %133
  %135 = load float, ptr %134, align 4, !invariant.load !98
  br label %concatenate.6.merge8

concatenate.pivot.32.11:                          ; preds = %concatenate.6.merge2
  %136 = icmp ult i32 %99, 32
  br i1 %136, label %concatenate.pivot.0.12, label %concatenate.pivot.32.13

concatenate.pivot.0.12:                           ; preds = %concatenate.pivot.32.11
  br label %concat_index_from_operand_id09

concatenate.pivot.32.13:                          ; preds = %concatenate.pivot.32.11
  br label %concat_index_from_operand_id110

concatenate.6.merge8:                             ; preds = %concat_index_from_operand_id110, %concat_index_from_operand_id09
  %137 = phi float [ %120, %concat_index_from_operand_id09 ], [ %135, %concat_index_from_operand_id110 ]
  %138 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %137, ptr %138, align 4
  %139 = mul nuw nsw i32 %13, 1
  %140 = add nuw nsw i32 0, %139
  %141 = udiv i32 %140, 64
  %142 = mul nuw nsw i32 %14, 1
  %143 = add nuw nsw i32 0, %142
  %144 = urem i32 %143, 16
  %145 = udiv i32 %143, 16
  %146 = udiv i32 %145, 8192
  br label %concatenate.pivot.32.17

concat_index_from_operand_id015:                  ; preds = %concatenate.pivot.0.18
  %147 = phi i32 [ 0, %concatenate.pivot.0.18 ]
  %148 = sub nsw i32 %140, %147
  %149 = udiv i32 %linear_index3, 64
  %150 = mul i32 %149, 32
  %151 = add i32 %150, %148
  %152 = udiv i32 %151, 1
  %153 = urem i32 %152, 32
  %154 = udiv i32 %151, 32
  %155 = urem i32 %154, 16
  %156 = udiv i32 %151, 512
  %157 = add i32 %145, 0
  %158 = add i32 %144, 0
  %159 = add i32 %148, 0
  %160 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr %arg0, i32 0, i32 0, i32 %157, i32 %158, i32 %159
  %161 = load float, ptr %160, align 4, !invariant.load !98
  br label %concatenate.6.merge14

concat_index_from_operand_id116:                  ; preds = %concatenate.pivot.32.19
  %162 = phi i32 [ 32, %concatenate.pivot.32.19 ]
  %163 = sub nsw i32 %140, %162
  %164 = udiv i32 %linear_index3, 64
  %165 = mul i32 %164, 32
  %166 = add i32 %165, %163
  %167 = udiv i32 %166, 1
  %168 = urem i32 %167, 32
  %169 = udiv i32 %166, 32
  %170 = urem i32 %169, 16
  %171 = udiv i32 %166, 512
  %172 = add i32 %145, 0
  %173 = add i32 %144, 0
  %174 = add i32 %163, 0
  %175 = getelementptr inbounds [2 x [8192 x [16 x [32 x float]]]], ptr %arg0, i32 0, i32 1, i32 %172, i32 %173, i32 %174
  %176 = load float, ptr %175, align 4, !invariant.load !98
  br label %concatenate.6.merge14

concatenate.pivot.32.17:                          ; preds = %concatenate.6.merge8
  %177 = icmp ult i32 %140, 32
  br i1 %177, label %concatenate.pivot.0.18, label %concatenate.pivot.32.19

concatenate.pivot.0.18:                           ; preds = %concatenate.pivot.32.17
  br label %concat_index_from_operand_id015

concatenate.pivot.32.19:                          ; preds = %concatenate.pivot.32.17
  br label %concat_index_from_operand_id116

concatenate.6.merge14:                            ; preds = %concat_index_from_operand_id116, %concat_index_from_operand_id015
  %178 = phi float [ %161, %concat_index_from_operand_id015 ], [ %176, %concat_index_from_operand_id116 ]
  %179 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %178, ptr %179, align 4
  br label %fusion_10.in_bounds-after
}

define void @fusion_11(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !186
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index, 64
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_11.in_bounds-true, label %fusion_11.in_bounds-after

fusion_11.in_bounds-after:                        ; preds = %fusion_11.in_bounds-true, %entry
  ret void

fusion_11.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !98
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.9 = fmul float %9, %16
  %subtract.10 = fsub float %14, %multiply.9
  %17 = insertvalue { float, float } %12, float %subtract.10, 1
  %18 = extractvalue { float, float } %17, 0
  %19 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %18, ptr %19, align 4
  %20 = extractvalue { float, float } %17, 1
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %20, ptr %21, align 4
  br label %fusion_11.in_bounds-after
}

define void @fusion_60(ptr noalias align 16 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(13107200) %arg1, ptr noalias align 16 dereferenceable(838860800) %arg2, ptr noalias align 128 dereferenceable(838860800) %arg3, ptr noalias align 128 dereferenceable(8388608) %arg4) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !107
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after55, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_17_constant_10 = load float, ptr @19, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_17_constant_10, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_17_constant_10, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !187
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
  br label %tile_loop.loop_header, !llvm.loop !188

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !189

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache30, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache30, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result22 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_11__3(ptr %36, ptr %result_from_other_lane, ptr %return_buffer23)
  %38 = load float, ptr %return_buffer23, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result25 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result25, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane24, align 4
  call void @region_1_11__3(ptr %36, ptr %result_from_other_lane24, ptr %return_buffer26)
  %40 = load float, ptr %return_buffer26, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result28 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane27, align 4
  call void @region_1_11__3(ptr %36, ptr %result_from_other_lane27, ptr %return_buffer29)
  %42 = load float, ptr %return_buffer29, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result31 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane30, align 4
  call void @region_1_11__3(ptr %36, ptr %result_from_other_lane30, ptr %return_buffer32)
  %44 = load float, ptr %return_buffer32, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result34 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane33, align 4
  call void @region_1_11__3(ptr %36, ptr %result_from_other_lane33, ptr %return_buffer35)
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
  %shmem_output_address36 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache30, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address36 to ptr
  %current_output37 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output37, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr38 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache30, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr38 to ptr
  %partial_reduction_result40 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane39, align 4
  call void @region_1_11__3(ptr %55, ptr %result_from_other_lane39, ptr %return_buffer41)
  %57 = load float, ptr %return_buffer41, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result43 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result43, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane42, align 4
  call void @region_1_11__3(ptr %55, ptr %result_from_other_lane42, ptr %return_buffer44)
  %59 = load float, ptr %return_buffer44, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result46 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result46, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane45, align 4
  call void @region_1_11__3(ptr %55, ptr %result_from_other_lane45, ptr %return_buffer47)
  %61 = load float, ptr %return_buffer47, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result49 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result49, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane48, align 4
  call void @region_1_11__3(ptr %55, ptr %result_from_other_lane48, ptr %return_buffer50)
  %63 = load float, ptr %return_buffer50, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result52 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result52, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane51, align 4
  call void @region_1_11__3(ptr %55, ptr %result_from_other_lane51, ptr %return_buffer53)
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
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !98
  %Arg_2.3 = getelementptr inbounds [8192 x [100 x [4 x [64 x float]]]], ptr %arg2, i32 0, i32 %84, i32 %83, i32 %81, i32 %79
  %Arg_2.34 = load float, ptr %Arg_2.3, align 4, !invariant.load !98
  %multiply.9 = fmul float %Arg_1.23, %Arg_2.34
  store float %multiply.9, ptr %reduction_input_address, align 4
  %87 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %86
  call void @region_1_11__3(ptr %87, ptr %reduction_input_address, ptr %return_buffer)
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
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !98
  %Arg_0.1 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr %arg0, i32 0, i32 %107, i32 0, i32 %102, i32 %101
  %Arg_0.17 = load float, ptr %Arg_0.1, align 4, !invariant.load !98
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
  %Arg_1.212 = load float, ptr %Arg_1.211, align 4, !invariant.load !98
  %Arg_2.313 = getelementptr inbounds [8192 x [100 x [4 x [64 x float]]]], ptr %arg2, i32 0, i32 %133, i32 %132, i32 %130, i32 %128
  %Arg_2.314 = load float, ptr %Arg_2.313, align 4, !invariant.load !98
  %multiply.915 = fmul float %Arg_1.212, %Arg_2.314
  store float %multiply.915, ptr %reduction_input_address, align 4
  %136 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %135
  call void @region_1_11__3(ptr %136, ptr %reduction_input_address, ptr %return_buffer16)
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
  %Arg_1.218 = load float, ptr %Arg_1.217, align 4, !invariant.load !98
  %Arg_0.119 = getelementptr inbounds [8192 x [1 x [4 x [64 x float]]]], ptr %arg0, i32 0, i32 %156, i32 0, i32 %151, i32 %150
  %Arg_0.120 = load float, ptr %Arg_0.119, align 4, !invariant.load !98
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

define internal void @region_1_11__3(ptr dereferenceable(4) %Arg_0.12.typed, ptr dereferenceable(4) %Arg_1.13.typed, ptr dereferenceable(4) %output_arg) {
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

define void @fusion_59(ptr noalias align 16 dereferenceable(204800) %arg0, ptr noalias align 128 dereferenceable(204800) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !190
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 51200
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 51200
  br i1 %6, label %fusion_59.in_bounds-true, label %fusion_59.in_bounds-after

fusion_59.in_bounds-after:                        ; preds = %fusion_59.in_bounds-true, %entry
  ret void

fusion_59.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_59.in_bounds-after
}

define void @fusion_56(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 128 dereferenceable(1056768) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(65536) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !185
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !119
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 256
  %5 = udiv i32 %linear_index, 256
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %fusion_56.in_bounds-true, label %fusion_56.in_bounds-after

fusion_56.in_bounds-after:                        ; preds = %fusion_56.in_bounds-true, %entry
  ret void

fusion_56.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !98
  %9 = load float, ptr %arg2, align 4, !invariant.load !98
  %10 = add i32 %5, 968
  %11 = add i32 %4, 0
  %12 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %10, i32 %11
  %13 = load float, ptr %12, align 4, !invariant.load !98
  %multiply.6 = fmul float %9, %13
  %subtract.7 = fsub float %8, %multiply.6
  %14 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  store float %subtract.7, ptr %14, align 4
  br label %fusion_56.in_bounds-after
}

define void @fusion_57(ptr noalias align 16 dereferenceable(991232) %arg0, ptr noalias align 128 dereferenceable(1056768) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 128 dereferenceable(991232) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !191
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
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
  br i1 %15, label %fusion_57.in_bounds-true, label %fusion_57.in_bounds-after

fusion_57.in_bounds-after:                        ; preds = %fusion_57.in_bounds-true, %entry
  ret void

fusion_57.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !98
  %18 = load float, ptr %arg2, align 4, !invariant.load !98
  %19 = add i32 %5, 0
  %20 = add i32 %4, 0
  %21 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %19, i32 %20
  %22 = load float, ptr %21, align 4, !invariant.load !98
  %multiply.6 = fmul float %18, %22
  %subtract.7 = fsub float %17, %multiply.6
  %23 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %subtract.7, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4, !invariant.load !98
  %26 = load float, ptr %arg2, align 4, !invariant.load !98
  %27 = add i32 %8, 0
  %28 = add i32 %7, 0
  %29 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %27, i32 %28
  %30 = load float, ptr %29, align 4, !invariant.load !98
  %multiply.61 = fmul float %26, %30
  %subtract.72 = fsub float %25, %multiply.61
  %31 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %subtract.72, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4, !invariant.load !98
  %34 = load float, ptr %arg2, align 4, !invariant.load !98
  %35 = add i32 %11, 0
  %36 = add i32 %10, 0
  %37 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %35, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !98
  %multiply.63 = fmul float %34, %38
  %subtract.74 = fsub float %33, %multiply.63
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %subtract.74, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4, !invariant.load !98
  %42 = load float, ptr %arg2, align 4, !invariant.load !98
  %43 = add i32 %14, 0
  %44 = add i32 %13, 0
  %45 = getelementptr inbounds [1032 x [256 x float]], ptr %arg1, i32 0, i32 %43, i32 %44
  %46 = load float, ptr %45, align 4, !invariant.load !98
  %multiply.65 = fmul float %42, %46
  %subtract.76 = fsub float %41, %multiply.65
  %47 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %subtract.76, ptr %47, align 4
  br label %fusion_57.in_bounds-after
}

define void @fusion_54(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(2097152) %arg1, ptr noalias align 16 dereferenceable(2097152) %arg2, ptr noalias align 128 dereferenceable(33816576) %arg3, ptr noalias align 16 dereferenceable(4) %arg4, ptr noalias align 128 dereferenceable(2097152) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !160
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
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
  br i1 %15, label %fusion_54.in_bounds-true, label %fusion_54.in_bounds-after

fusion_54.in_bounds-after:                        ; preds = %fusion_54.in_bounds-true, %entry
  ret void

fusion_54.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !98
  %18 = load float, ptr %arg4, align 4, !invariant.load !98
  %19 = add i32 %5, 0
  %20 = add i32 %4, 968
  %21 = getelementptr inbounds [8192 x [1032 x float]], ptr %arg3, i32 0, i32 %19, i32 %20
  %22 = load float, ptr %21, align 4, !invariant.load !98
  %23 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %24 = load float, ptr %23, align 4, !invariant.load !98
  %add.10 = fadd float %22, %24
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %26 = load float, ptr %25, align 4, !invariant.load !98
  %add.11 = fadd float %add.10, %26
  %multiply.12 = fmul float %18, %add.11
  %subtract.13 = fsub float %17, %multiply.12
  %27 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %subtract.13, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %29 = load float, ptr %28, align 4, !invariant.load !98
  %30 = load float, ptr %arg4, align 4, !invariant.load !98
  %31 = add i32 %8, 0
  %32 = add i32 %7, 968
  %33 = getelementptr inbounds [8192 x [1032 x float]], ptr %arg3, i32 0, i32 %31, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !98
  %35 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %36 = load float, ptr %35, align 4, !invariant.load !98
  %add.101 = fadd float %34, %36
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %38 = load float, ptr %37, align 4, !invariant.load !98
  %add.112 = fadd float %add.101, %38
  %multiply.123 = fmul float %30, %add.112
  %subtract.134 = fsub float %29, %multiply.123
  %39 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %subtract.134, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %41 = load float, ptr %40, align 4, !invariant.load !98
  %42 = load float, ptr %arg4, align 4, !invariant.load !98
  %43 = add i32 %11, 0
  %44 = add i32 %10, 968
  %45 = getelementptr inbounds [8192 x [1032 x float]], ptr %arg3, i32 0, i32 %43, i32 %44
  %46 = load float, ptr %45, align 4, !invariant.load !98
  %47 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %48 = load float, ptr %47, align 4, !invariant.load !98
  %add.105 = fadd float %46, %48
  %49 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %50 = load float, ptr %49, align 4, !invariant.load !98
  %add.116 = fadd float %add.105, %50
  %multiply.127 = fmul float %42, %add.116
  %subtract.138 = fsub float %41, %multiply.127
  %51 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %subtract.138, ptr %51, align 4
  %52 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %53 = load float, ptr %52, align 4, !invariant.load !98
  %54 = load float, ptr %arg4, align 4, !invariant.load !98
  %55 = add i32 %14, 0
  %56 = add i32 %13, 968
  %57 = getelementptr inbounds [8192 x [1032 x float]], ptr %arg3, i32 0, i32 %55, i32 %56
  %58 = load float, ptr %57, align 4, !invariant.load !98
  %59 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %60 = load float, ptr %59, align 4, !invariant.load !98
  %add.109 = fadd float %58, %60
  %61 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %62 = load float, ptr %61, align 4, !invariant.load !98
  %add.1110 = fadd float %add.109, %62
  %multiply.1211 = fmul float %54, %add.1110
  %subtract.1312 = fsub float %53, %multiply.1211
  %63 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %subtract.1312, ptr %63, align 4
  br label %fusion_54.in_bounds-after
}

define void @fusion(ptr noalias align 16 dereferenceable(26214400) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(655360000) %arg2, ptr noalias align 128 dereferenceable(550502400) %arg3, ptr noalias align 128 dereferenceable(20971520) %arg4, ptr noalias align 128 dereferenceable(88080384) %arg5, ptr noalias align 16 dereferenceable(26214400) %arg6, ptr noalias align 16 dereferenceable(26214400) %arg7, ptr noalias align 16 dereferenceable(26214400) %arg8, ptr noalias align 16 dereferenceable(26214400) %arg9, ptr noalias align 16 dereferenceable(26214400) %arg10, ptr noalias align 16 dereferenceable(26214400) %arg11, ptr noalias align 16 dereferenceable(26214400) %arg12, ptr noalias align 16 dereferenceable(26214400) %arg13, ptr noalias align 16 dereferenceable(26214400) %arg14, ptr noalias align 16 dereferenceable(26214400) %arg15, ptr noalias align 16 dereferenceable(26214400) %arg16, ptr noalias align 128 dereferenceable(26214400) %arg17, ptr noalias align 128 dereferenceable(26214400) %arg18, ptr noalias align 128 dereferenceable(26214400) %arg19, ptr noalias align 128 dereferenceable(26214400) %arg20, ptr noalias align 128 dereferenceable(26214400) %arg21, ptr noalias align 128 dereferenceable(26214400) %arg22, ptr noalias align 128 dereferenceable(26214400) %arg23, ptr noalias align 128 dereferenceable(26214400) %arg24) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !192
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
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
  br i1 %23, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %concatenate.30.merge191, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !98
  %26 = load float, ptr %arg1, align 4, !invariant.load !98
  %27 = add i32 %7, 0
  %28 = add i32 %6, 0
  %29 = add i32 %4, 128
  %30 = mul nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 200
  %33 = mul nuw nsw i32 %28, 1
  %34 = add nuw nsw i32 0, %33
  %35 = mul nuw nsw i32 %27, 100
  %36 = add nuw nsw i32 %34, %35
  %37 = udiv i32 %36, 819200
  %38 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %36, i32 %31
  %39 = load float, ptr %38, align 4, !invariant.load !98
  %40 = add i32 %7, 0
  %41 = add i32 %6, 0
  %42 = add i32 %4, 0
  br label %concatenate.pivot.16.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %43 = phi i32 [ 0, %concatenate.pivot.0. ]
  %44 = sub nsw i32 %41, %43
  %45 = mul nuw nsw i32 %42, 1
  %46 = add nuw nsw i32 0, %45
  %47 = udiv i32 %46, 40
  %48 = mul nuw nsw i32 %44, 1
  %49 = add nuw nsw i32 0, %48
  %50 = mul nuw nsw i32 %40, 16
  %51 = add nuw nsw i32 %49, %50
  %52 = udiv i32 %51, 131072
  %53 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %51, i32 %46
  %54 = load float, ptr %53, align 4, !invariant.load !98
  %55 = mul nuw nsw i32 %46, 1
  %56 = add nuw nsw i32 0, %55
  %57 = udiv i32 %56, 40
  %58 = mul nuw nsw i32 %51, 1
  %59 = add nuw nsw i32 0, %58
  %60 = urem i32 %59, 16
  %61 = udiv i32 %59, 16
  %62 = udiv i32 %61, 8192
  %63 = add i32 %61, 0
  %64 = add i32 %60, 0
  %65 = add i32 %56, 128
  %66 = mul nuw nsw i32 %65, 1
  %67 = add nuw nsw i32 0, %66
  %68 = udiv i32 %67, 168
  %69 = mul nuw nsw i32 %64, 1
  %70 = add nuw nsw i32 0, %69
  %71 = mul nuw nsw i32 %63, 16
  %72 = add nuw nsw i32 %70, %71
  %73 = udiv i32 %72, 131072
  %74 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %72, i32 %67
  %75 = load float, ptr %74, align 4, !invariant.load !98
  %add.24 = fadd float %54, %75
  %76 = add i32 %40, 0
  %77 = add i32 %44, 0
  %78 = add i32 %42, 128
  %79 = mul nuw nsw i32 %78, 1
  %80 = add nuw nsw i32 0, %79
  %81 = udiv i32 %80, 168
  %82 = mul nuw nsw i32 %77, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %76, 100
  %85 = add nuw nsw i32 %83, %84
  %86 = udiv i32 %85, 819200
  %87 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %85, i32 %80
  %88 = load float, ptr %87, align 4, !invariant.load !98
  %add.28 = fadd float %add.24, %88
  br label %concatenate.30.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.16.1
  %89 = phi i32 [ 16, %concatenate.pivot.16.1 ]
  %90 = sub nsw i32 %41, %89
  %91 = add i32 %40, 0
  %92 = add i32 %90, 16
  %93 = add i32 %42, 128
  %94 = mul nuw nsw i32 %93, 1
  %95 = add nuw nsw i32 0, %94
  %96 = udiv i32 %95, 168
  %97 = mul nuw nsw i32 %92, 1
  %98 = add nuw nsw i32 0, %97
  %99 = mul nuw nsw i32 %91, 100
  %100 = add nuw nsw i32 %98, %99
  %101 = udiv i32 %100, 819200
  %102 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %100, i32 %95
  %103 = load float, ptr %102, align 4, !invariant.load !98
  br label %concatenate.30.merge

concatenate.pivot.16.:                            ; preds = %fusion.in_bounds-true
  %104 = icmp ult i32 %41, 16
  br i1 %104, label %concatenate.pivot.0., label %concatenate.pivot.16.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id0

concatenate.pivot.16.1:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id1

concatenate.30.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %105 = phi float [ %add.28, %concat_index_from_operand_id0 ], [ %103, %concat_index_from_operand_id1 ]
  %add.32 = fadd float %39, %105
  %multiply.33 = fmul float %26, %add.32
  %subtract.34 = fsub float %25, %multiply.33
  %106 = insertvalue { float, float, float, float, float, float, float, float } undef, float %subtract.34, 0
  %107 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %108 = load float, ptr %107, align 4, !invariant.load !98
  %109 = load float, ptr %arg1, align 4, !invariant.load !98
  %110 = add i32 %7, 0
  %111 = add i32 %6, 0
  %112 = add i32 %4, 16
  br label %concatenate.pivot.16.7

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.8
  %113 = phi i32 [ 0, %concatenate.pivot.0.8 ]
  %114 = sub nsw i32 %111, %113
  %115 = mul nuw nsw i32 %112, 1
  %116 = add nuw nsw i32 0, %115
  %117 = udiv i32 %116, 40
  %118 = mul nuw nsw i32 %114, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %110, 16
  %121 = add nuw nsw i32 %119, %120
  %122 = udiv i32 %121, 131072
  %123 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %121, i32 %116
  %124 = load float, ptr %123, align 4, !invariant.load !98
  %125 = mul nuw nsw i32 %116, 1
  %126 = add nuw nsw i32 0, %125
  %127 = udiv i32 %126, 40
  %128 = mul nuw nsw i32 %121, 1
  %129 = add nuw nsw i32 0, %128
  %130 = urem i32 %129, 16
  %131 = udiv i32 %129, 16
  %132 = udiv i32 %131, 8192
  %133 = add i32 %131, 0
  %134 = add i32 %130, 0
  %135 = add i32 %126, 128
  %136 = mul nuw nsw i32 %135, 1
  %137 = add nuw nsw i32 0, %136
  %138 = udiv i32 %137, 168
  %139 = mul nuw nsw i32 %134, 1
  %140 = add nuw nsw i32 0, %139
  %141 = mul nuw nsw i32 %133, 16
  %142 = add nuw nsw i32 %140, %141
  %143 = udiv i32 %142, 131072
  %144 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %142, i32 %137
  %145 = load float, ptr %144, align 4, !invariant.load !98
  %add.244 = fadd float %124, %145
  %146 = add i32 %110, 0
  %147 = add i32 %114, 0
  %148 = add i32 %112, 128
  %149 = mul nuw nsw i32 %148, 1
  %150 = add nuw nsw i32 0, %149
  %151 = udiv i32 %150, 168
  %152 = mul nuw nsw i32 %147, 1
  %153 = add nuw nsw i32 0, %152
  %154 = mul nuw nsw i32 %146, 100
  %155 = add nuw nsw i32 %153, %154
  %156 = udiv i32 %155, 819200
  %157 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %155, i32 %150
  %158 = load float, ptr %157, align 4, !invariant.load !98
  %add.285 = fadd float %add.244, %158
  br label %concatenate.30.merge2

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.16.9
  %159 = phi i32 [ 16, %concatenate.pivot.16.9 ]
  %160 = sub nsw i32 %111, %159
  %161 = add i32 %110, 0
  %162 = add i32 %160, 16
  %163 = add i32 %112, 128
  %164 = mul nuw nsw i32 %163, 1
  %165 = add nuw nsw i32 0, %164
  %166 = udiv i32 %165, 168
  %167 = mul nuw nsw i32 %162, 1
  %168 = add nuw nsw i32 0, %167
  %169 = mul nuw nsw i32 %161, 100
  %170 = add nuw nsw i32 %168, %169
  %171 = udiv i32 %170, 819200
  %172 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %170, i32 %165
  %173 = load float, ptr %172, align 4, !invariant.load !98
  br label %concatenate.30.merge2

concatenate.pivot.16.7:                           ; preds = %concatenate.30.merge
  %174 = icmp ult i32 %111, 16
  br i1 %174, label %concatenate.pivot.0.8, label %concatenate.pivot.16.9

concatenate.pivot.0.8:                            ; preds = %concatenate.pivot.16.7
  br label %concat_index_from_operand_id03

concatenate.pivot.16.9:                           ; preds = %concatenate.pivot.16.7
  br label %concat_index_from_operand_id16

concatenate.30.merge2:                            ; preds = %concat_index_from_operand_id16, %concat_index_from_operand_id03
  %175 = phi float [ %add.285, %concat_index_from_operand_id03 ], [ %173, %concat_index_from_operand_id16 ]
  %multiply.36 = fmul float %109, %175
  %subtract.37 = fsub float %108, %multiply.36
  %176 = insertvalue { float, float, float, float, float, float, float, float } %106, float %subtract.37, 1
  %177 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %178 = load float, ptr %177, align 4, !invariant.load !98
  %179 = load float, ptr %arg1, align 4, !invariant.load !98
  %180 = add i32 %7, 0
  %181 = add i32 %6, 0
  %182 = add i32 %4, 8
  br label %concatenate.pivot.16.15

concat_index_from_operand_id011:                  ; preds = %concatenate.pivot.0.16
  %183 = phi i32 [ 0, %concatenate.pivot.0.16 ]
  %184 = sub nsw i32 %181, %183
  %185 = mul nuw nsw i32 %182, 1
  %186 = add nuw nsw i32 0, %185
  %187 = udiv i32 %186, 40
  %188 = mul nuw nsw i32 %184, 1
  %189 = add nuw nsw i32 0, %188
  %190 = mul nuw nsw i32 %180, 16
  %191 = add nuw nsw i32 %189, %190
  %192 = udiv i32 %191, 131072
  %193 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %191, i32 %186
  %194 = load float, ptr %193, align 4, !invariant.load !98
  %195 = mul nuw nsw i32 %186, 1
  %196 = add nuw nsw i32 0, %195
  %197 = udiv i32 %196, 40
  %198 = mul nuw nsw i32 %191, 1
  %199 = add nuw nsw i32 0, %198
  %200 = urem i32 %199, 16
  %201 = udiv i32 %199, 16
  %202 = udiv i32 %201, 8192
  %203 = add i32 %201, 0
  %204 = add i32 %200, 0
  %205 = add i32 %196, 128
  %206 = mul nuw nsw i32 %205, 1
  %207 = add nuw nsw i32 0, %206
  %208 = udiv i32 %207, 168
  %209 = mul nuw nsw i32 %204, 1
  %210 = add nuw nsw i32 0, %209
  %211 = mul nuw nsw i32 %203, 16
  %212 = add nuw nsw i32 %210, %211
  %213 = udiv i32 %212, 131072
  %214 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %212, i32 %207
  %215 = load float, ptr %214, align 4, !invariant.load !98
  %add.2412 = fadd float %194, %215
  %216 = add i32 %180, 0
  %217 = add i32 %184, 0
  %218 = add i32 %182, 128
  %219 = mul nuw nsw i32 %218, 1
  %220 = add nuw nsw i32 0, %219
  %221 = udiv i32 %220, 168
  %222 = mul nuw nsw i32 %217, 1
  %223 = add nuw nsw i32 0, %222
  %224 = mul nuw nsw i32 %216, 100
  %225 = add nuw nsw i32 %223, %224
  %226 = udiv i32 %225, 819200
  %227 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %225, i32 %220
  %228 = load float, ptr %227, align 4, !invariant.load !98
  %add.2813 = fadd float %add.2412, %228
  br label %concatenate.30.merge10

concat_index_from_operand_id114:                  ; preds = %concatenate.pivot.16.17
  %229 = phi i32 [ 16, %concatenate.pivot.16.17 ]
  %230 = sub nsw i32 %181, %229
  %231 = add i32 %180, 0
  %232 = add i32 %230, 16
  %233 = add i32 %182, 128
  %234 = mul nuw nsw i32 %233, 1
  %235 = add nuw nsw i32 0, %234
  %236 = udiv i32 %235, 168
  %237 = mul nuw nsw i32 %232, 1
  %238 = add nuw nsw i32 0, %237
  %239 = mul nuw nsw i32 %231, 100
  %240 = add nuw nsw i32 %238, %239
  %241 = udiv i32 %240, 819200
  %242 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %240, i32 %235
  %243 = load float, ptr %242, align 4, !invariant.load !98
  br label %concatenate.30.merge10

concatenate.pivot.16.15:                          ; preds = %concatenate.30.merge2
  %244 = icmp ult i32 %181, 16
  br i1 %244, label %concatenate.pivot.0.16, label %concatenate.pivot.16.17

concatenate.pivot.0.16:                           ; preds = %concatenate.pivot.16.15
  br label %concat_index_from_operand_id011

concatenate.pivot.16.17:                          ; preds = %concatenate.pivot.16.15
  br label %concat_index_from_operand_id114

concatenate.30.merge10:                           ; preds = %concat_index_from_operand_id114, %concat_index_from_operand_id011
  %245 = phi float [ %add.2813, %concat_index_from_operand_id011 ], [ %243, %concat_index_from_operand_id114 ]
  %multiply.39 = fmul float %179, %245
  %subtract.40 = fsub float %178, %multiply.39
  %246 = insertvalue { float, float, float, float, float, float, float, float } %176, float %subtract.40, 2
  %247 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  %248 = load float, ptr %247, align 4, !invariant.load !98
  %249 = load float, ptr %arg1, align 4, !invariant.load !98
  %250 = add i32 %7, 0
  %251 = add i32 %6, 0
  %252 = add i32 %4, 24
  br label %concatenate.pivot.16.23

concat_index_from_operand_id019:                  ; preds = %concatenate.pivot.0.24
  %253 = phi i32 [ 0, %concatenate.pivot.0.24 ]
  %254 = sub nsw i32 %251, %253
  %255 = mul nuw nsw i32 %252, 1
  %256 = add nuw nsw i32 0, %255
  %257 = udiv i32 %256, 40
  %258 = mul nuw nsw i32 %254, 1
  %259 = add nuw nsw i32 0, %258
  %260 = mul nuw nsw i32 %250, 16
  %261 = add nuw nsw i32 %259, %260
  %262 = udiv i32 %261, 131072
  %263 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %261, i32 %256
  %264 = load float, ptr %263, align 4, !invariant.load !98
  %265 = mul nuw nsw i32 %256, 1
  %266 = add nuw nsw i32 0, %265
  %267 = udiv i32 %266, 40
  %268 = mul nuw nsw i32 %261, 1
  %269 = add nuw nsw i32 0, %268
  %270 = urem i32 %269, 16
  %271 = udiv i32 %269, 16
  %272 = udiv i32 %271, 8192
  %273 = add i32 %271, 0
  %274 = add i32 %270, 0
  %275 = add i32 %266, 128
  %276 = mul nuw nsw i32 %275, 1
  %277 = add nuw nsw i32 0, %276
  %278 = udiv i32 %277, 168
  %279 = mul nuw nsw i32 %274, 1
  %280 = add nuw nsw i32 0, %279
  %281 = mul nuw nsw i32 %273, 16
  %282 = add nuw nsw i32 %280, %281
  %283 = udiv i32 %282, 131072
  %284 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %282, i32 %277
  %285 = load float, ptr %284, align 4, !invariant.load !98
  %add.2420 = fadd float %264, %285
  %286 = add i32 %250, 0
  %287 = add i32 %254, 0
  %288 = add i32 %252, 128
  %289 = mul nuw nsw i32 %288, 1
  %290 = add nuw nsw i32 0, %289
  %291 = udiv i32 %290, 168
  %292 = mul nuw nsw i32 %287, 1
  %293 = add nuw nsw i32 0, %292
  %294 = mul nuw nsw i32 %286, 100
  %295 = add nuw nsw i32 %293, %294
  %296 = udiv i32 %295, 819200
  %297 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %295, i32 %290
  %298 = load float, ptr %297, align 4, !invariant.load !98
  %add.2821 = fadd float %add.2420, %298
  br label %concatenate.30.merge18

concat_index_from_operand_id122:                  ; preds = %concatenate.pivot.16.25
  %299 = phi i32 [ 16, %concatenate.pivot.16.25 ]
  %300 = sub nsw i32 %251, %299
  %301 = add i32 %250, 0
  %302 = add i32 %300, 16
  %303 = add i32 %252, 128
  %304 = mul nuw nsw i32 %303, 1
  %305 = add nuw nsw i32 0, %304
  %306 = udiv i32 %305, 168
  %307 = mul nuw nsw i32 %302, 1
  %308 = add nuw nsw i32 0, %307
  %309 = mul nuw nsw i32 %301, 100
  %310 = add nuw nsw i32 %308, %309
  %311 = udiv i32 %310, 819200
  %312 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %310, i32 %305
  %313 = load float, ptr %312, align 4, !invariant.load !98
  br label %concatenate.30.merge18

concatenate.pivot.16.23:                          ; preds = %concatenate.30.merge10
  %314 = icmp ult i32 %251, 16
  br i1 %314, label %concatenate.pivot.0.24, label %concatenate.pivot.16.25

concatenate.pivot.0.24:                           ; preds = %concatenate.pivot.16.23
  br label %concat_index_from_operand_id019

concatenate.pivot.16.25:                          ; preds = %concatenate.pivot.16.23
  br label %concat_index_from_operand_id122

concatenate.30.merge18:                           ; preds = %concat_index_from_operand_id122, %concat_index_from_operand_id019
  %315 = phi float [ %add.2821, %concat_index_from_operand_id019 ], [ %313, %concat_index_from_operand_id122 ]
  %multiply.42 = fmul float %249, %315
  %subtract.43 = fsub float %248, %multiply.42
  %316 = insertvalue { float, float, float, float, float, float, float, float } %246, float %subtract.43, 3
  %317 = getelementptr inbounds float, ptr %arg9, i32 %linear_index_base
  %318 = load float, ptr %317, align 4, !invariant.load !98
  %319 = load float, ptr %arg1, align 4, !invariant.load !98
  %320 = add i32 %7, 0
  %321 = add i32 %6, 0
  %322 = add i32 %4, 32
  br label %concatenate.pivot.16.31

concat_index_from_operand_id027:                  ; preds = %concatenate.pivot.0.32
  %323 = phi i32 [ 0, %concatenate.pivot.0.32 ]
  %324 = sub nsw i32 %321, %323
  %325 = mul nuw nsw i32 %322, 1
  %326 = add nuw nsw i32 0, %325
  %327 = udiv i32 %326, 40
  %328 = mul nuw nsw i32 %324, 1
  %329 = add nuw nsw i32 0, %328
  %330 = mul nuw nsw i32 %320, 16
  %331 = add nuw nsw i32 %329, %330
  %332 = udiv i32 %331, 131072
  %333 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %331, i32 %326
  %334 = load float, ptr %333, align 4, !invariant.load !98
  %335 = mul nuw nsw i32 %326, 1
  %336 = add nuw nsw i32 0, %335
  %337 = udiv i32 %336, 40
  %338 = mul nuw nsw i32 %331, 1
  %339 = add nuw nsw i32 0, %338
  %340 = urem i32 %339, 16
  %341 = udiv i32 %339, 16
  %342 = udiv i32 %341, 8192
  %343 = add i32 %341, 0
  %344 = add i32 %340, 0
  %345 = add i32 %336, 128
  %346 = mul nuw nsw i32 %345, 1
  %347 = add nuw nsw i32 0, %346
  %348 = udiv i32 %347, 168
  %349 = mul nuw nsw i32 %344, 1
  %350 = add nuw nsw i32 0, %349
  %351 = mul nuw nsw i32 %343, 16
  %352 = add nuw nsw i32 %350, %351
  %353 = udiv i32 %352, 131072
  %354 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %352, i32 %347
  %355 = load float, ptr %354, align 4, !invariant.load !98
  %add.2428 = fadd float %334, %355
  %356 = add i32 %320, 0
  %357 = add i32 %324, 0
  %358 = add i32 %322, 128
  %359 = mul nuw nsw i32 %358, 1
  %360 = add nuw nsw i32 0, %359
  %361 = udiv i32 %360, 168
  %362 = mul nuw nsw i32 %357, 1
  %363 = add nuw nsw i32 0, %362
  %364 = mul nuw nsw i32 %356, 100
  %365 = add nuw nsw i32 %363, %364
  %366 = udiv i32 %365, 819200
  %367 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %365, i32 %360
  %368 = load float, ptr %367, align 4, !invariant.load !98
  %add.2829 = fadd float %add.2428, %368
  br label %concatenate.30.merge26

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.16.33
  %369 = phi i32 [ 16, %concatenate.pivot.16.33 ]
  %370 = sub nsw i32 %321, %369
  %371 = add i32 %320, 0
  %372 = add i32 %370, 16
  %373 = add i32 %322, 128
  %374 = mul nuw nsw i32 %373, 1
  %375 = add nuw nsw i32 0, %374
  %376 = udiv i32 %375, 168
  %377 = mul nuw nsw i32 %372, 1
  %378 = add nuw nsw i32 0, %377
  %379 = mul nuw nsw i32 %371, 100
  %380 = add nuw nsw i32 %378, %379
  %381 = udiv i32 %380, 819200
  %382 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %380, i32 %375
  %383 = load float, ptr %382, align 4, !invariant.load !98
  br label %concatenate.30.merge26

concatenate.pivot.16.31:                          ; preds = %concatenate.30.merge18
  %384 = icmp ult i32 %321, 16
  br i1 %384, label %concatenate.pivot.0.32, label %concatenate.pivot.16.33

concatenate.pivot.0.32:                           ; preds = %concatenate.pivot.16.31
  br label %concat_index_from_operand_id027

concatenate.pivot.16.33:                          ; preds = %concatenate.pivot.16.31
  br label %concat_index_from_operand_id130

concatenate.30.merge26:                           ; preds = %concat_index_from_operand_id130, %concat_index_from_operand_id027
  %385 = phi float [ %add.2829, %concat_index_from_operand_id027 ], [ %383, %concat_index_from_operand_id130 ]
  %multiply.45 = fmul float %319, %385
  %subtract.46 = fsub float %318, %multiply.45
  %386 = insertvalue { float, float, float, float, float, float, float, float } %316, float %subtract.46, 4
  %387 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  %388 = load float, ptr %387, align 4, !invariant.load !98
  %389 = load float, ptr %arg1, align 4, !invariant.load !98
  %390 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  %391 = load float, ptr %390, align 4, !invariant.load !98
  %multiply.47 = fmul float %389, %391
  %subtract.48 = fsub float %388, %multiply.47
  %392 = insertvalue { float, float, float, float, float, float, float, float } %386, float %subtract.48, 5
  %393 = getelementptr inbounds float, ptr %arg12, i32 %linear_index_base
  %394 = load float, ptr %393, align 4, !invariant.load !98
  %395 = getelementptr inbounds float, ptr %arg13, i32 %linear_index_base
  %396 = load float, ptr %395, align 4, !invariant.load !98
  %multiply.49 = fmul float %389, %396
  %subtract.50 = fsub float %394, %multiply.49
  %397 = insertvalue { float, float, float, float, float, float, float, float } %392, float %subtract.50, 6
  %398 = getelementptr inbounds float, ptr %arg14, i32 %linear_index_base
  %399 = load float, ptr %398, align 4, !invariant.load !98
  %400 = getelementptr inbounds float, ptr %arg15, i32 %linear_index_base
  %401 = load float, ptr %400, align 4, !invariant.load !98
  %402 = getelementptr inbounds float, ptr %arg16, i32 %linear_index_base
  %403 = load float, ptr %402, align 4, !invariant.load !98
  %add.51 = fadd float %401, %403
  %multiply.52 = fmul float %389, %add.51
  %subtract.53 = fsub float %399, %multiply.52
  %404 = insertvalue { float, float, float, float, float, float, float, float } %397, float %subtract.53, 7
  %405 = extractvalue { float, float, float, float, float, float, float, float } %404, 0
  %406 = getelementptr inbounds float, ptr %arg17, i32 %linear_index_base
  store float %405, ptr %406, align 4
  %407 = extractvalue { float, float, float, float, float, float, float, float } %404, 1
  %408 = getelementptr inbounds float, ptr %arg18, i32 %linear_index_base
  store float %407, ptr %408, align 4
  %409 = extractvalue { float, float, float, float, float, float, float, float } %404, 2
  %410 = getelementptr inbounds float, ptr %arg19, i32 %linear_index_base
  store float %409, ptr %410, align 4
  %411 = extractvalue { float, float, float, float, float, float, float, float } %404, 3
  %412 = getelementptr inbounds float, ptr %arg20, i32 %linear_index_base
  store float %411, ptr %412, align 4
  %413 = extractvalue { float, float, float, float, float, float, float, float } %404, 4
  %414 = getelementptr inbounds float, ptr %arg21, i32 %linear_index_base
  store float %413, ptr %414, align 4
  %415 = extractvalue { float, float, float, float, float, float, float, float } %404, 5
  %416 = getelementptr inbounds float, ptr %arg22, i32 %linear_index_base
  store float %415, ptr %416, align 4
  %417 = extractvalue { float, float, float, float, float, float, float, float } %404, 6
  %418 = getelementptr inbounds float, ptr %arg23, i32 %linear_index_base
  store float %417, ptr %418, align 4
  %419 = extractvalue { float, float, float, float, float, float, float, float } %404, 7
  %420 = getelementptr inbounds float, ptr %arg24, i32 %linear_index_base
  store float %419, ptr %420, align 4
  %421 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %422 = load float, ptr %421, align 4, !invariant.load !98
  %423 = load float, ptr %arg1, align 4, !invariant.load !98
  %424 = add i32 %12, 0
  %425 = add i32 %11, 0
  %426 = add i32 %9, 128
  %427 = mul nuw nsw i32 %426, 1
  %428 = add nuw nsw i32 0, %427
  %429 = udiv i32 %428, 200
  %430 = mul nuw nsw i32 %425, 1
  %431 = add nuw nsw i32 0, %430
  %432 = mul nuw nsw i32 %424, 100
  %433 = add nuw nsw i32 %431, %432
  %434 = udiv i32 %433, 819200
  %435 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %433, i32 %428
  %436 = load float, ptr %435, align 4, !invariant.load !98
  %437 = add i32 %12, 0
  %438 = add i32 %11, 0
  %439 = add i32 %9, 0
  br label %concatenate.pivot.16.39

concat_index_from_operand_id035:                  ; preds = %concatenate.pivot.0.40
  %440 = phi i32 [ 0, %concatenate.pivot.0.40 ]
  %441 = sub nsw i32 %438, %440
  %442 = mul nuw nsw i32 %439, 1
  %443 = add nuw nsw i32 0, %442
  %444 = udiv i32 %443, 40
  %445 = mul nuw nsw i32 %441, 1
  %446 = add nuw nsw i32 0, %445
  %447 = mul nuw nsw i32 %437, 16
  %448 = add nuw nsw i32 %446, %447
  %449 = udiv i32 %448, 131072
  %450 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %448, i32 %443
  %451 = load float, ptr %450, align 4, !invariant.load !98
  %452 = mul nuw nsw i32 %443, 1
  %453 = add nuw nsw i32 0, %452
  %454 = udiv i32 %453, 40
  %455 = mul nuw nsw i32 %448, 1
  %456 = add nuw nsw i32 0, %455
  %457 = urem i32 %456, 16
  %458 = udiv i32 %456, 16
  %459 = udiv i32 %458, 8192
  %460 = add i32 %458, 0
  %461 = add i32 %457, 0
  %462 = add i32 %453, 128
  %463 = mul nuw nsw i32 %462, 1
  %464 = add nuw nsw i32 0, %463
  %465 = udiv i32 %464, 168
  %466 = mul nuw nsw i32 %461, 1
  %467 = add nuw nsw i32 0, %466
  %468 = mul nuw nsw i32 %460, 16
  %469 = add nuw nsw i32 %467, %468
  %470 = udiv i32 %469, 131072
  %471 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %469, i32 %464
  %472 = load float, ptr %471, align 4, !invariant.load !98
  %add.2436 = fadd float %451, %472
  %473 = add i32 %437, 0
  %474 = add i32 %441, 0
  %475 = add i32 %439, 128
  %476 = mul nuw nsw i32 %475, 1
  %477 = add nuw nsw i32 0, %476
  %478 = udiv i32 %477, 168
  %479 = mul nuw nsw i32 %474, 1
  %480 = add nuw nsw i32 0, %479
  %481 = mul nuw nsw i32 %473, 100
  %482 = add nuw nsw i32 %480, %481
  %483 = udiv i32 %482, 819200
  %484 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %482, i32 %477
  %485 = load float, ptr %484, align 4, !invariant.load !98
  %add.2837 = fadd float %add.2436, %485
  br label %concatenate.30.merge34

concat_index_from_operand_id138:                  ; preds = %concatenate.pivot.16.41
  %486 = phi i32 [ 16, %concatenate.pivot.16.41 ]
  %487 = sub nsw i32 %438, %486
  %488 = add i32 %437, 0
  %489 = add i32 %487, 16
  %490 = add i32 %439, 128
  %491 = mul nuw nsw i32 %490, 1
  %492 = add nuw nsw i32 0, %491
  %493 = udiv i32 %492, 168
  %494 = mul nuw nsw i32 %489, 1
  %495 = add nuw nsw i32 0, %494
  %496 = mul nuw nsw i32 %488, 100
  %497 = add nuw nsw i32 %495, %496
  %498 = udiv i32 %497, 819200
  %499 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %497, i32 %492
  %500 = load float, ptr %499, align 4, !invariant.load !98
  br label %concatenate.30.merge34

concatenate.pivot.16.39:                          ; preds = %concatenate.30.merge26
  %501 = icmp ult i32 %438, 16
  br i1 %501, label %concatenate.pivot.0.40, label %concatenate.pivot.16.41

concatenate.pivot.0.40:                           ; preds = %concatenate.pivot.16.39
  br label %concat_index_from_operand_id035

concatenate.pivot.16.41:                          ; preds = %concatenate.pivot.16.39
  br label %concat_index_from_operand_id138

concatenate.30.merge34:                           ; preds = %concat_index_from_operand_id138, %concat_index_from_operand_id035
  %502 = phi float [ %add.2837, %concat_index_from_operand_id035 ], [ %500, %concat_index_from_operand_id138 ]
  %add.3242 = fadd float %436, %502
  %multiply.3343 = fmul float %423, %add.3242
  %subtract.3444 = fsub float %422, %multiply.3343
  %503 = insertvalue { float, float, float, float, float, float, float, float } undef, float %subtract.3444, 0
  %504 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %505 = load float, ptr %504, align 4, !invariant.load !98
  %506 = load float, ptr %arg1, align 4, !invariant.load !98
  %507 = add i32 %12, 0
  %508 = add i32 %11, 0
  %509 = add i32 %9, 16
  br label %concatenate.pivot.16.50

concat_index_from_operand_id046:                  ; preds = %concatenate.pivot.0.51
  %510 = phi i32 [ 0, %concatenate.pivot.0.51 ]
  %511 = sub nsw i32 %508, %510
  %512 = mul nuw nsw i32 %509, 1
  %513 = add nuw nsw i32 0, %512
  %514 = udiv i32 %513, 40
  %515 = mul nuw nsw i32 %511, 1
  %516 = add nuw nsw i32 0, %515
  %517 = mul nuw nsw i32 %507, 16
  %518 = add nuw nsw i32 %516, %517
  %519 = udiv i32 %518, 131072
  %520 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %518, i32 %513
  %521 = load float, ptr %520, align 4, !invariant.load !98
  %522 = mul nuw nsw i32 %513, 1
  %523 = add nuw nsw i32 0, %522
  %524 = udiv i32 %523, 40
  %525 = mul nuw nsw i32 %518, 1
  %526 = add nuw nsw i32 0, %525
  %527 = urem i32 %526, 16
  %528 = udiv i32 %526, 16
  %529 = udiv i32 %528, 8192
  %530 = add i32 %528, 0
  %531 = add i32 %527, 0
  %532 = add i32 %523, 128
  %533 = mul nuw nsw i32 %532, 1
  %534 = add nuw nsw i32 0, %533
  %535 = udiv i32 %534, 168
  %536 = mul nuw nsw i32 %531, 1
  %537 = add nuw nsw i32 0, %536
  %538 = mul nuw nsw i32 %530, 16
  %539 = add nuw nsw i32 %537, %538
  %540 = udiv i32 %539, 131072
  %541 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %539, i32 %534
  %542 = load float, ptr %541, align 4, !invariant.load !98
  %add.2447 = fadd float %521, %542
  %543 = add i32 %507, 0
  %544 = add i32 %511, 0
  %545 = add i32 %509, 128
  %546 = mul nuw nsw i32 %545, 1
  %547 = add nuw nsw i32 0, %546
  %548 = udiv i32 %547, 168
  %549 = mul nuw nsw i32 %544, 1
  %550 = add nuw nsw i32 0, %549
  %551 = mul nuw nsw i32 %543, 100
  %552 = add nuw nsw i32 %550, %551
  %553 = udiv i32 %552, 819200
  %554 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %552, i32 %547
  %555 = load float, ptr %554, align 4, !invariant.load !98
  %add.2848 = fadd float %add.2447, %555
  br label %concatenate.30.merge45

concat_index_from_operand_id149:                  ; preds = %concatenate.pivot.16.52
  %556 = phi i32 [ 16, %concatenate.pivot.16.52 ]
  %557 = sub nsw i32 %508, %556
  %558 = add i32 %507, 0
  %559 = add i32 %557, 16
  %560 = add i32 %509, 128
  %561 = mul nuw nsw i32 %560, 1
  %562 = add nuw nsw i32 0, %561
  %563 = udiv i32 %562, 168
  %564 = mul nuw nsw i32 %559, 1
  %565 = add nuw nsw i32 0, %564
  %566 = mul nuw nsw i32 %558, 100
  %567 = add nuw nsw i32 %565, %566
  %568 = udiv i32 %567, 819200
  %569 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %567, i32 %562
  %570 = load float, ptr %569, align 4, !invariant.load !98
  br label %concatenate.30.merge45

concatenate.pivot.16.50:                          ; preds = %concatenate.30.merge34
  %571 = icmp ult i32 %508, 16
  br i1 %571, label %concatenate.pivot.0.51, label %concatenate.pivot.16.52

concatenate.pivot.0.51:                           ; preds = %concatenate.pivot.16.50
  br label %concat_index_from_operand_id046

concatenate.pivot.16.52:                          ; preds = %concatenate.pivot.16.50
  br label %concat_index_from_operand_id149

concatenate.30.merge45:                           ; preds = %concat_index_from_operand_id149, %concat_index_from_operand_id046
  %572 = phi float [ %add.2848, %concat_index_from_operand_id046 ], [ %570, %concat_index_from_operand_id149 ]
  %multiply.3653 = fmul float %506, %572
  %subtract.3754 = fsub float %505, %multiply.3653
  %573 = insertvalue { float, float, float, float, float, float, float, float } %503, float %subtract.3754, 1
  %574 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %575 = load float, ptr %574, align 4, !invariant.load !98
  %576 = load float, ptr %arg1, align 4, !invariant.load !98
  %577 = add i32 %12, 0
  %578 = add i32 %11, 0
  %579 = add i32 %9, 8
  br label %concatenate.pivot.16.60

concat_index_from_operand_id056:                  ; preds = %concatenate.pivot.0.61
  %580 = phi i32 [ 0, %concatenate.pivot.0.61 ]
  %581 = sub nsw i32 %578, %580
  %582 = mul nuw nsw i32 %579, 1
  %583 = add nuw nsw i32 0, %582
  %584 = udiv i32 %583, 40
  %585 = mul nuw nsw i32 %581, 1
  %586 = add nuw nsw i32 0, %585
  %587 = mul nuw nsw i32 %577, 16
  %588 = add nuw nsw i32 %586, %587
  %589 = udiv i32 %588, 131072
  %590 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %588, i32 %583
  %591 = load float, ptr %590, align 4, !invariant.load !98
  %592 = mul nuw nsw i32 %583, 1
  %593 = add nuw nsw i32 0, %592
  %594 = udiv i32 %593, 40
  %595 = mul nuw nsw i32 %588, 1
  %596 = add nuw nsw i32 0, %595
  %597 = urem i32 %596, 16
  %598 = udiv i32 %596, 16
  %599 = udiv i32 %598, 8192
  %600 = add i32 %598, 0
  %601 = add i32 %597, 0
  %602 = add i32 %593, 128
  %603 = mul nuw nsw i32 %602, 1
  %604 = add nuw nsw i32 0, %603
  %605 = udiv i32 %604, 168
  %606 = mul nuw nsw i32 %601, 1
  %607 = add nuw nsw i32 0, %606
  %608 = mul nuw nsw i32 %600, 16
  %609 = add nuw nsw i32 %607, %608
  %610 = udiv i32 %609, 131072
  %611 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %609, i32 %604
  %612 = load float, ptr %611, align 4, !invariant.load !98
  %add.2457 = fadd float %591, %612
  %613 = add i32 %577, 0
  %614 = add i32 %581, 0
  %615 = add i32 %579, 128
  %616 = mul nuw nsw i32 %615, 1
  %617 = add nuw nsw i32 0, %616
  %618 = udiv i32 %617, 168
  %619 = mul nuw nsw i32 %614, 1
  %620 = add nuw nsw i32 0, %619
  %621 = mul nuw nsw i32 %613, 100
  %622 = add nuw nsw i32 %620, %621
  %623 = udiv i32 %622, 819200
  %624 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %622, i32 %617
  %625 = load float, ptr %624, align 4, !invariant.load !98
  %add.2858 = fadd float %add.2457, %625
  br label %concatenate.30.merge55

concat_index_from_operand_id159:                  ; preds = %concatenate.pivot.16.62
  %626 = phi i32 [ 16, %concatenate.pivot.16.62 ]
  %627 = sub nsw i32 %578, %626
  %628 = add i32 %577, 0
  %629 = add i32 %627, 16
  %630 = add i32 %579, 128
  %631 = mul nuw nsw i32 %630, 1
  %632 = add nuw nsw i32 0, %631
  %633 = udiv i32 %632, 168
  %634 = mul nuw nsw i32 %629, 1
  %635 = add nuw nsw i32 0, %634
  %636 = mul nuw nsw i32 %628, 100
  %637 = add nuw nsw i32 %635, %636
  %638 = udiv i32 %637, 819200
  %639 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %637, i32 %632
  %640 = load float, ptr %639, align 4, !invariant.load !98
  br label %concatenate.30.merge55

concatenate.pivot.16.60:                          ; preds = %concatenate.30.merge45
  %641 = icmp ult i32 %578, 16
  br i1 %641, label %concatenate.pivot.0.61, label %concatenate.pivot.16.62

concatenate.pivot.0.61:                           ; preds = %concatenate.pivot.16.60
  br label %concat_index_from_operand_id056

concatenate.pivot.16.62:                          ; preds = %concatenate.pivot.16.60
  br label %concat_index_from_operand_id159

concatenate.30.merge55:                           ; preds = %concat_index_from_operand_id159, %concat_index_from_operand_id056
  %642 = phi float [ %add.2858, %concat_index_from_operand_id056 ], [ %640, %concat_index_from_operand_id159 ]
  %multiply.3963 = fmul float %576, %642
  %subtract.4064 = fsub float %575, %multiply.3963
  %643 = insertvalue { float, float, float, float, float, float, float, float } %573, float %subtract.4064, 2
  %644 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  %645 = load float, ptr %644, align 4, !invariant.load !98
  %646 = load float, ptr %arg1, align 4, !invariant.load !98
  %647 = add i32 %12, 0
  %648 = add i32 %11, 0
  %649 = add i32 %9, 24
  br label %concatenate.pivot.16.70

concat_index_from_operand_id066:                  ; preds = %concatenate.pivot.0.71
  %650 = phi i32 [ 0, %concatenate.pivot.0.71 ]
  %651 = sub nsw i32 %648, %650
  %652 = mul nuw nsw i32 %649, 1
  %653 = add nuw nsw i32 0, %652
  %654 = udiv i32 %653, 40
  %655 = mul nuw nsw i32 %651, 1
  %656 = add nuw nsw i32 0, %655
  %657 = mul nuw nsw i32 %647, 16
  %658 = add nuw nsw i32 %656, %657
  %659 = udiv i32 %658, 131072
  %660 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %658, i32 %653
  %661 = load float, ptr %660, align 4, !invariant.load !98
  %662 = mul nuw nsw i32 %653, 1
  %663 = add nuw nsw i32 0, %662
  %664 = udiv i32 %663, 40
  %665 = mul nuw nsw i32 %658, 1
  %666 = add nuw nsw i32 0, %665
  %667 = urem i32 %666, 16
  %668 = udiv i32 %666, 16
  %669 = udiv i32 %668, 8192
  %670 = add i32 %668, 0
  %671 = add i32 %667, 0
  %672 = add i32 %663, 128
  %673 = mul nuw nsw i32 %672, 1
  %674 = add nuw nsw i32 0, %673
  %675 = udiv i32 %674, 168
  %676 = mul nuw nsw i32 %671, 1
  %677 = add nuw nsw i32 0, %676
  %678 = mul nuw nsw i32 %670, 16
  %679 = add nuw nsw i32 %677, %678
  %680 = udiv i32 %679, 131072
  %681 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %679, i32 %674
  %682 = load float, ptr %681, align 4, !invariant.load !98
  %add.2467 = fadd float %661, %682
  %683 = add i32 %647, 0
  %684 = add i32 %651, 0
  %685 = add i32 %649, 128
  %686 = mul nuw nsw i32 %685, 1
  %687 = add nuw nsw i32 0, %686
  %688 = udiv i32 %687, 168
  %689 = mul nuw nsw i32 %684, 1
  %690 = add nuw nsw i32 0, %689
  %691 = mul nuw nsw i32 %683, 100
  %692 = add nuw nsw i32 %690, %691
  %693 = udiv i32 %692, 819200
  %694 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %692, i32 %687
  %695 = load float, ptr %694, align 4, !invariant.load !98
  %add.2868 = fadd float %add.2467, %695
  br label %concatenate.30.merge65

concat_index_from_operand_id169:                  ; preds = %concatenate.pivot.16.72
  %696 = phi i32 [ 16, %concatenate.pivot.16.72 ]
  %697 = sub nsw i32 %648, %696
  %698 = add i32 %647, 0
  %699 = add i32 %697, 16
  %700 = add i32 %649, 128
  %701 = mul nuw nsw i32 %700, 1
  %702 = add nuw nsw i32 0, %701
  %703 = udiv i32 %702, 168
  %704 = mul nuw nsw i32 %699, 1
  %705 = add nuw nsw i32 0, %704
  %706 = mul nuw nsw i32 %698, 100
  %707 = add nuw nsw i32 %705, %706
  %708 = udiv i32 %707, 819200
  %709 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %707, i32 %702
  %710 = load float, ptr %709, align 4, !invariant.load !98
  br label %concatenate.30.merge65

concatenate.pivot.16.70:                          ; preds = %concatenate.30.merge55
  %711 = icmp ult i32 %648, 16
  br i1 %711, label %concatenate.pivot.0.71, label %concatenate.pivot.16.72

concatenate.pivot.0.71:                           ; preds = %concatenate.pivot.16.70
  br label %concat_index_from_operand_id066

concatenate.pivot.16.72:                          ; preds = %concatenate.pivot.16.70
  br label %concat_index_from_operand_id169

concatenate.30.merge65:                           ; preds = %concat_index_from_operand_id169, %concat_index_from_operand_id066
  %712 = phi float [ %add.2868, %concat_index_from_operand_id066 ], [ %710, %concat_index_from_operand_id169 ]
  %multiply.4273 = fmul float %646, %712
  %subtract.4374 = fsub float %645, %multiply.4273
  %713 = insertvalue { float, float, float, float, float, float, float, float } %643, float %subtract.4374, 3
  %714 = getelementptr inbounds float, ptr %arg9, i32 %linear_index1
  %715 = load float, ptr %714, align 4, !invariant.load !98
  %716 = load float, ptr %arg1, align 4, !invariant.load !98
  %717 = add i32 %12, 0
  %718 = add i32 %11, 0
  %719 = add i32 %9, 32
  br label %concatenate.pivot.16.80

concat_index_from_operand_id076:                  ; preds = %concatenate.pivot.0.81
  %720 = phi i32 [ 0, %concatenate.pivot.0.81 ]
  %721 = sub nsw i32 %718, %720
  %722 = mul nuw nsw i32 %719, 1
  %723 = add nuw nsw i32 0, %722
  %724 = udiv i32 %723, 40
  %725 = mul nuw nsw i32 %721, 1
  %726 = add nuw nsw i32 0, %725
  %727 = mul nuw nsw i32 %717, 16
  %728 = add nuw nsw i32 %726, %727
  %729 = udiv i32 %728, 131072
  %730 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %728, i32 %723
  %731 = load float, ptr %730, align 4, !invariant.load !98
  %732 = mul nuw nsw i32 %723, 1
  %733 = add nuw nsw i32 0, %732
  %734 = udiv i32 %733, 40
  %735 = mul nuw nsw i32 %728, 1
  %736 = add nuw nsw i32 0, %735
  %737 = urem i32 %736, 16
  %738 = udiv i32 %736, 16
  %739 = udiv i32 %738, 8192
  %740 = add i32 %738, 0
  %741 = add i32 %737, 0
  %742 = add i32 %733, 128
  %743 = mul nuw nsw i32 %742, 1
  %744 = add nuw nsw i32 0, %743
  %745 = udiv i32 %744, 168
  %746 = mul nuw nsw i32 %741, 1
  %747 = add nuw nsw i32 0, %746
  %748 = mul nuw nsw i32 %740, 16
  %749 = add nuw nsw i32 %747, %748
  %750 = udiv i32 %749, 131072
  %751 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %749, i32 %744
  %752 = load float, ptr %751, align 4, !invariant.load !98
  %add.2477 = fadd float %731, %752
  %753 = add i32 %717, 0
  %754 = add i32 %721, 0
  %755 = add i32 %719, 128
  %756 = mul nuw nsw i32 %755, 1
  %757 = add nuw nsw i32 0, %756
  %758 = udiv i32 %757, 168
  %759 = mul nuw nsw i32 %754, 1
  %760 = add nuw nsw i32 0, %759
  %761 = mul nuw nsw i32 %753, 100
  %762 = add nuw nsw i32 %760, %761
  %763 = udiv i32 %762, 819200
  %764 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %762, i32 %757
  %765 = load float, ptr %764, align 4, !invariant.load !98
  %add.2878 = fadd float %add.2477, %765
  br label %concatenate.30.merge75

concat_index_from_operand_id179:                  ; preds = %concatenate.pivot.16.82
  %766 = phi i32 [ 16, %concatenate.pivot.16.82 ]
  %767 = sub nsw i32 %718, %766
  %768 = add i32 %717, 0
  %769 = add i32 %767, 16
  %770 = add i32 %719, 128
  %771 = mul nuw nsw i32 %770, 1
  %772 = add nuw nsw i32 0, %771
  %773 = udiv i32 %772, 168
  %774 = mul nuw nsw i32 %769, 1
  %775 = add nuw nsw i32 0, %774
  %776 = mul nuw nsw i32 %768, 100
  %777 = add nuw nsw i32 %775, %776
  %778 = udiv i32 %777, 819200
  %779 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %777, i32 %772
  %780 = load float, ptr %779, align 4, !invariant.load !98
  br label %concatenate.30.merge75

concatenate.pivot.16.80:                          ; preds = %concatenate.30.merge65
  %781 = icmp ult i32 %718, 16
  br i1 %781, label %concatenate.pivot.0.81, label %concatenate.pivot.16.82

concatenate.pivot.0.81:                           ; preds = %concatenate.pivot.16.80
  br label %concat_index_from_operand_id076

concatenate.pivot.16.82:                          ; preds = %concatenate.pivot.16.80
  br label %concat_index_from_operand_id179

concatenate.30.merge75:                           ; preds = %concat_index_from_operand_id179, %concat_index_from_operand_id076
  %782 = phi float [ %add.2878, %concat_index_from_operand_id076 ], [ %780, %concat_index_from_operand_id179 ]
  %multiply.4583 = fmul float %716, %782
  %subtract.4684 = fsub float %715, %multiply.4583
  %783 = insertvalue { float, float, float, float, float, float, float, float } %713, float %subtract.4684, 4
  %784 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  %785 = load float, ptr %784, align 4, !invariant.load !98
  %786 = load float, ptr %arg1, align 4, !invariant.load !98
  %787 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  %788 = load float, ptr %787, align 4, !invariant.load !98
  %multiply.4785 = fmul float %786, %788
  %subtract.4886 = fsub float %785, %multiply.4785
  %789 = insertvalue { float, float, float, float, float, float, float, float } %783, float %subtract.4886, 5
  %790 = getelementptr inbounds float, ptr %arg12, i32 %linear_index1
  %791 = load float, ptr %790, align 4, !invariant.load !98
  %792 = getelementptr inbounds float, ptr %arg13, i32 %linear_index1
  %793 = load float, ptr %792, align 4, !invariant.load !98
  %multiply.4987 = fmul float %786, %793
  %subtract.5088 = fsub float %791, %multiply.4987
  %794 = insertvalue { float, float, float, float, float, float, float, float } %789, float %subtract.5088, 6
  %795 = getelementptr inbounds float, ptr %arg14, i32 %linear_index1
  %796 = load float, ptr %795, align 4, !invariant.load !98
  %797 = getelementptr inbounds float, ptr %arg15, i32 %linear_index1
  %798 = load float, ptr %797, align 4, !invariant.load !98
  %799 = getelementptr inbounds float, ptr %arg16, i32 %linear_index1
  %800 = load float, ptr %799, align 4, !invariant.load !98
  %add.5189 = fadd float %798, %800
  %multiply.5290 = fmul float %786, %add.5189
  %subtract.5391 = fsub float %796, %multiply.5290
  %801 = insertvalue { float, float, float, float, float, float, float, float } %794, float %subtract.5391, 7
  %802 = extractvalue { float, float, float, float, float, float, float, float } %801, 0
  %803 = getelementptr inbounds float, ptr %arg17, i32 %linear_index1
  store float %802, ptr %803, align 4
  %804 = extractvalue { float, float, float, float, float, float, float, float } %801, 1
  %805 = getelementptr inbounds float, ptr %arg18, i32 %linear_index1
  store float %804, ptr %805, align 4
  %806 = extractvalue { float, float, float, float, float, float, float, float } %801, 2
  %807 = getelementptr inbounds float, ptr %arg19, i32 %linear_index1
  store float %806, ptr %807, align 4
  %808 = extractvalue { float, float, float, float, float, float, float, float } %801, 3
  %809 = getelementptr inbounds float, ptr %arg20, i32 %linear_index1
  store float %808, ptr %809, align 4
  %810 = extractvalue { float, float, float, float, float, float, float, float } %801, 4
  %811 = getelementptr inbounds float, ptr %arg21, i32 %linear_index1
  store float %810, ptr %811, align 4
  %812 = extractvalue { float, float, float, float, float, float, float, float } %801, 5
  %813 = getelementptr inbounds float, ptr %arg22, i32 %linear_index1
  store float %812, ptr %813, align 4
  %814 = extractvalue { float, float, float, float, float, float, float, float } %801, 6
  %815 = getelementptr inbounds float, ptr %arg23, i32 %linear_index1
  store float %814, ptr %815, align 4
  %816 = extractvalue { float, float, float, float, float, float, float, float } %801, 7
  %817 = getelementptr inbounds float, ptr %arg24, i32 %linear_index1
  store float %816, ptr %817, align 4
  %818 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %819 = load float, ptr %818, align 4, !invariant.load !98
  %820 = load float, ptr %arg1, align 4, !invariant.load !98
  %821 = add i32 %17, 0
  %822 = add i32 %16, 0
  %823 = add i32 %14, 128
  %824 = mul nuw nsw i32 %823, 1
  %825 = add nuw nsw i32 0, %824
  %826 = udiv i32 %825, 200
  %827 = mul nuw nsw i32 %822, 1
  %828 = add nuw nsw i32 0, %827
  %829 = mul nuw nsw i32 %821, 100
  %830 = add nuw nsw i32 %828, %829
  %831 = udiv i32 %830, 819200
  %832 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %830, i32 %825
  %833 = load float, ptr %832, align 4, !invariant.load !98
  %834 = add i32 %17, 0
  %835 = add i32 %16, 0
  %836 = add i32 %14, 0
  br label %concatenate.pivot.16.97

concat_index_from_operand_id093:                  ; preds = %concatenate.pivot.0.98
  %837 = phi i32 [ 0, %concatenate.pivot.0.98 ]
  %838 = sub nsw i32 %835, %837
  %839 = mul nuw nsw i32 %836, 1
  %840 = add nuw nsw i32 0, %839
  %841 = udiv i32 %840, 40
  %842 = mul nuw nsw i32 %838, 1
  %843 = add nuw nsw i32 0, %842
  %844 = mul nuw nsw i32 %834, 16
  %845 = add nuw nsw i32 %843, %844
  %846 = udiv i32 %845, 131072
  %847 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %845, i32 %840
  %848 = load float, ptr %847, align 4, !invariant.load !98
  %849 = mul nuw nsw i32 %840, 1
  %850 = add nuw nsw i32 0, %849
  %851 = udiv i32 %850, 40
  %852 = mul nuw nsw i32 %845, 1
  %853 = add nuw nsw i32 0, %852
  %854 = urem i32 %853, 16
  %855 = udiv i32 %853, 16
  %856 = udiv i32 %855, 8192
  %857 = add i32 %855, 0
  %858 = add i32 %854, 0
  %859 = add i32 %850, 128
  %860 = mul nuw nsw i32 %859, 1
  %861 = add nuw nsw i32 0, %860
  %862 = udiv i32 %861, 168
  %863 = mul nuw nsw i32 %858, 1
  %864 = add nuw nsw i32 0, %863
  %865 = mul nuw nsw i32 %857, 16
  %866 = add nuw nsw i32 %864, %865
  %867 = udiv i32 %866, 131072
  %868 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %866, i32 %861
  %869 = load float, ptr %868, align 4, !invariant.load !98
  %add.2494 = fadd float %848, %869
  %870 = add i32 %834, 0
  %871 = add i32 %838, 0
  %872 = add i32 %836, 128
  %873 = mul nuw nsw i32 %872, 1
  %874 = add nuw nsw i32 0, %873
  %875 = udiv i32 %874, 168
  %876 = mul nuw nsw i32 %871, 1
  %877 = add nuw nsw i32 0, %876
  %878 = mul nuw nsw i32 %870, 100
  %879 = add nuw nsw i32 %877, %878
  %880 = udiv i32 %879, 819200
  %881 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %879, i32 %874
  %882 = load float, ptr %881, align 4, !invariant.load !98
  %add.2895 = fadd float %add.2494, %882
  br label %concatenate.30.merge92

concat_index_from_operand_id196:                  ; preds = %concatenate.pivot.16.99
  %883 = phi i32 [ 16, %concatenate.pivot.16.99 ]
  %884 = sub nsw i32 %835, %883
  %885 = add i32 %834, 0
  %886 = add i32 %884, 16
  %887 = add i32 %836, 128
  %888 = mul nuw nsw i32 %887, 1
  %889 = add nuw nsw i32 0, %888
  %890 = udiv i32 %889, 168
  %891 = mul nuw nsw i32 %886, 1
  %892 = add nuw nsw i32 0, %891
  %893 = mul nuw nsw i32 %885, 100
  %894 = add nuw nsw i32 %892, %893
  %895 = udiv i32 %894, 819200
  %896 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %894, i32 %889
  %897 = load float, ptr %896, align 4, !invariant.load !98
  br label %concatenate.30.merge92

concatenate.pivot.16.97:                          ; preds = %concatenate.30.merge75
  %898 = icmp ult i32 %835, 16
  br i1 %898, label %concatenate.pivot.0.98, label %concatenate.pivot.16.99

concatenate.pivot.0.98:                           ; preds = %concatenate.pivot.16.97
  br label %concat_index_from_operand_id093

concatenate.pivot.16.99:                          ; preds = %concatenate.pivot.16.97
  br label %concat_index_from_operand_id196

concatenate.30.merge92:                           ; preds = %concat_index_from_operand_id196, %concat_index_from_operand_id093
  %899 = phi float [ %add.2895, %concat_index_from_operand_id093 ], [ %897, %concat_index_from_operand_id196 ]
  %add.32100 = fadd float %833, %899
  %multiply.33101 = fmul float %820, %add.32100
  %subtract.34102 = fsub float %819, %multiply.33101
  %900 = insertvalue { float, float, float, float, float, float, float, float } undef, float %subtract.34102, 0
  %901 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %902 = load float, ptr %901, align 4, !invariant.load !98
  %903 = load float, ptr %arg1, align 4, !invariant.load !98
  %904 = add i32 %17, 0
  %905 = add i32 %16, 0
  %906 = add i32 %14, 16
  br label %concatenate.pivot.16.108

concat_index_from_operand_id0104:                 ; preds = %concatenate.pivot.0.109
  %907 = phi i32 [ 0, %concatenate.pivot.0.109 ]
  %908 = sub nsw i32 %905, %907
  %909 = mul nuw nsw i32 %906, 1
  %910 = add nuw nsw i32 0, %909
  %911 = udiv i32 %910, 40
  %912 = mul nuw nsw i32 %908, 1
  %913 = add nuw nsw i32 0, %912
  %914 = mul nuw nsw i32 %904, 16
  %915 = add nuw nsw i32 %913, %914
  %916 = udiv i32 %915, 131072
  %917 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %915, i32 %910
  %918 = load float, ptr %917, align 4, !invariant.load !98
  %919 = mul nuw nsw i32 %910, 1
  %920 = add nuw nsw i32 0, %919
  %921 = udiv i32 %920, 40
  %922 = mul nuw nsw i32 %915, 1
  %923 = add nuw nsw i32 0, %922
  %924 = urem i32 %923, 16
  %925 = udiv i32 %923, 16
  %926 = udiv i32 %925, 8192
  %927 = add i32 %925, 0
  %928 = add i32 %924, 0
  %929 = add i32 %920, 128
  %930 = mul nuw nsw i32 %929, 1
  %931 = add nuw nsw i32 0, %930
  %932 = udiv i32 %931, 168
  %933 = mul nuw nsw i32 %928, 1
  %934 = add nuw nsw i32 0, %933
  %935 = mul nuw nsw i32 %927, 16
  %936 = add nuw nsw i32 %934, %935
  %937 = udiv i32 %936, 131072
  %938 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %936, i32 %931
  %939 = load float, ptr %938, align 4, !invariant.load !98
  %add.24105 = fadd float %918, %939
  %940 = add i32 %904, 0
  %941 = add i32 %908, 0
  %942 = add i32 %906, 128
  %943 = mul nuw nsw i32 %942, 1
  %944 = add nuw nsw i32 0, %943
  %945 = udiv i32 %944, 168
  %946 = mul nuw nsw i32 %941, 1
  %947 = add nuw nsw i32 0, %946
  %948 = mul nuw nsw i32 %940, 100
  %949 = add nuw nsw i32 %947, %948
  %950 = udiv i32 %949, 819200
  %951 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %949, i32 %944
  %952 = load float, ptr %951, align 4, !invariant.load !98
  %add.28106 = fadd float %add.24105, %952
  br label %concatenate.30.merge103

concat_index_from_operand_id1107:                 ; preds = %concatenate.pivot.16.110
  %953 = phi i32 [ 16, %concatenate.pivot.16.110 ]
  %954 = sub nsw i32 %905, %953
  %955 = add i32 %904, 0
  %956 = add i32 %954, 16
  %957 = add i32 %906, 128
  %958 = mul nuw nsw i32 %957, 1
  %959 = add nuw nsw i32 0, %958
  %960 = udiv i32 %959, 168
  %961 = mul nuw nsw i32 %956, 1
  %962 = add nuw nsw i32 0, %961
  %963 = mul nuw nsw i32 %955, 100
  %964 = add nuw nsw i32 %962, %963
  %965 = udiv i32 %964, 819200
  %966 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %964, i32 %959
  %967 = load float, ptr %966, align 4, !invariant.load !98
  br label %concatenate.30.merge103

concatenate.pivot.16.108:                         ; preds = %concatenate.30.merge92
  %968 = icmp ult i32 %905, 16
  br i1 %968, label %concatenate.pivot.0.109, label %concatenate.pivot.16.110

concatenate.pivot.0.109:                          ; preds = %concatenate.pivot.16.108
  br label %concat_index_from_operand_id0104

concatenate.pivot.16.110:                         ; preds = %concatenate.pivot.16.108
  br label %concat_index_from_operand_id1107

concatenate.30.merge103:                          ; preds = %concat_index_from_operand_id1107, %concat_index_from_operand_id0104
  %969 = phi float [ %add.28106, %concat_index_from_operand_id0104 ], [ %967, %concat_index_from_operand_id1107 ]
  %multiply.36111 = fmul float %903, %969
  %subtract.37112 = fsub float %902, %multiply.36111
  %970 = insertvalue { float, float, float, float, float, float, float, float } %900, float %subtract.37112, 1
  %971 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %972 = load float, ptr %971, align 4, !invariant.load !98
  %973 = load float, ptr %arg1, align 4, !invariant.load !98
  %974 = add i32 %17, 0
  %975 = add i32 %16, 0
  %976 = add i32 %14, 8
  br label %concatenate.pivot.16.118

concat_index_from_operand_id0114:                 ; preds = %concatenate.pivot.0.119
  %977 = phi i32 [ 0, %concatenate.pivot.0.119 ]
  %978 = sub nsw i32 %975, %977
  %979 = mul nuw nsw i32 %976, 1
  %980 = add nuw nsw i32 0, %979
  %981 = udiv i32 %980, 40
  %982 = mul nuw nsw i32 %978, 1
  %983 = add nuw nsw i32 0, %982
  %984 = mul nuw nsw i32 %974, 16
  %985 = add nuw nsw i32 %983, %984
  %986 = udiv i32 %985, 131072
  %987 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %985, i32 %980
  %988 = load float, ptr %987, align 4, !invariant.load !98
  %989 = mul nuw nsw i32 %980, 1
  %990 = add nuw nsw i32 0, %989
  %991 = udiv i32 %990, 40
  %992 = mul nuw nsw i32 %985, 1
  %993 = add nuw nsw i32 0, %992
  %994 = urem i32 %993, 16
  %995 = udiv i32 %993, 16
  %996 = udiv i32 %995, 8192
  %997 = add i32 %995, 0
  %998 = add i32 %994, 0
  %999 = add i32 %990, 128
  %1000 = mul nuw nsw i32 %999, 1
  %1001 = add nuw nsw i32 0, %1000
  %1002 = udiv i32 %1001, 168
  %1003 = mul nuw nsw i32 %998, 1
  %1004 = add nuw nsw i32 0, %1003
  %1005 = mul nuw nsw i32 %997, 16
  %1006 = add nuw nsw i32 %1004, %1005
  %1007 = udiv i32 %1006, 131072
  %1008 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %1006, i32 %1001
  %1009 = load float, ptr %1008, align 4, !invariant.load !98
  %add.24115 = fadd float %988, %1009
  %1010 = add i32 %974, 0
  %1011 = add i32 %978, 0
  %1012 = add i32 %976, 128
  %1013 = mul nuw nsw i32 %1012, 1
  %1014 = add nuw nsw i32 0, %1013
  %1015 = udiv i32 %1014, 168
  %1016 = mul nuw nsw i32 %1011, 1
  %1017 = add nuw nsw i32 0, %1016
  %1018 = mul nuw nsw i32 %1010, 100
  %1019 = add nuw nsw i32 %1017, %1018
  %1020 = udiv i32 %1019, 819200
  %1021 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1019, i32 %1014
  %1022 = load float, ptr %1021, align 4, !invariant.load !98
  %add.28116 = fadd float %add.24115, %1022
  br label %concatenate.30.merge113

concat_index_from_operand_id1117:                 ; preds = %concatenate.pivot.16.120
  %1023 = phi i32 [ 16, %concatenate.pivot.16.120 ]
  %1024 = sub nsw i32 %975, %1023
  %1025 = add i32 %974, 0
  %1026 = add i32 %1024, 16
  %1027 = add i32 %976, 128
  %1028 = mul nuw nsw i32 %1027, 1
  %1029 = add nuw nsw i32 0, %1028
  %1030 = udiv i32 %1029, 168
  %1031 = mul nuw nsw i32 %1026, 1
  %1032 = add nuw nsw i32 0, %1031
  %1033 = mul nuw nsw i32 %1025, 100
  %1034 = add nuw nsw i32 %1032, %1033
  %1035 = udiv i32 %1034, 819200
  %1036 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1034, i32 %1029
  %1037 = load float, ptr %1036, align 4, !invariant.load !98
  br label %concatenate.30.merge113

concatenate.pivot.16.118:                         ; preds = %concatenate.30.merge103
  %1038 = icmp ult i32 %975, 16
  br i1 %1038, label %concatenate.pivot.0.119, label %concatenate.pivot.16.120

concatenate.pivot.0.119:                          ; preds = %concatenate.pivot.16.118
  br label %concat_index_from_operand_id0114

concatenate.pivot.16.120:                         ; preds = %concatenate.pivot.16.118
  br label %concat_index_from_operand_id1117

concatenate.30.merge113:                          ; preds = %concat_index_from_operand_id1117, %concat_index_from_operand_id0114
  %1039 = phi float [ %add.28116, %concat_index_from_operand_id0114 ], [ %1037, %concat_index_from_operand_id1117 ]
  %multiply.39121 = fmul float %973, %1039
  %subtract.40122 = fsub float %972, %multiply.39121
  %1040 = insertvalue { float, float, float, float, float, float, float, float } %970, float %subtract.40122, 2
  %1041 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  %1042 = load float, ptr %1041, align 4, !invariant.load !98
  %1043 = load float, ptr %arg1, align 4, !invariant.load !98
  %1044 = add i32 %17, 0
  %1045 = add i32 %16, 0
  %1046 = add i32 %14, 24
  br label %concatenate.pivot.16.128

concat_index_from_operand_id0124:                 ; preds = %concatenate.pivot.0.129
  %1047 = phi i32 [ 0, %concatenate.pivot.0.129 ]
  %1048 = sub nsw i32 %1045, %1047
  %1049 = mul nuw nsw i32 %1046, 1
  %1050 = add nuw nsw i32 0, %1049
  %1051 = udiv i32 %1050, 40
  %1052 = mul nuw nsw i32 %1048, 1
  %1053 = add nuw nsw i32 0, %1052
  %1054 = mul nuw nsw i32 %1044, 16
  %1055 = add nuw nsw i32 %1053, %1054
  %1056 = udiv i32 %1055, 131072
  %1057 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %1055, i32 %1050
  %1058 = load float, ptr %1057, align 4, !invariant.load !98
  %1059 = mul nuw nsw i32 %1050, 1
  %1060 = add nuw nsw i32 0, %1059
  %1061 = udiv i32 %1060, 40
  %1062 = mul nuw nsw i32 %1055, 1
  %1063 = add nuw nsw i32 0, %1062
  %1064 = urem i32 %1063, 16
  %1065 = udiv i32 %1063, 16
  %1066 = udiv i32 %1065, 8192
  %1067 = add i32 %1065, 0
  %1068 = add i32 %1064, 0
  %1069 = add i32 %1060, 128
  %1070 = mul nuw nsw i32 %1069, 1
  %1071 = add nuw nsw i32 0, %1070
  %1072 = udiv i32 %1071, 168
  %1073 = mul nuw nsw i32 %1068, 1
  %1074 = add nuw nsw i32 0, %1073
  %1075 = mul nuw nsw i32 %1067, 16
  %1076 = add nuw nsw i32 %1074, %1075
  %1077 = udiv i32 %1076, 131072
  %1078 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %1076, i32 %1071
  %1079 = load float, ptr %1078, align 4, !invariant.load !98
  %add.24125 = fadd float %1058, %1079
  %1080 = add i32 %1044, 0
  %1081 = add i32 %1048, 0
  %1082 = add i32 %1046, 128
  %1083 = mul nuw nsw i32 %1082, 1
  %1084 = add nuw nsw i32 0, %1083
  %1085 = udiv i32 %1084, 168
  %1086 = mul nuw nsw i32 %1081, 1
  %1087 = add nuw nsw i32 0, %1086
  %1088 = mul nuw nsw i32 %1080, 100
  %1089 = add nuw nsw i32 %1087, %1088
  %1090 = udiv i32 %1089, 819200
  %1091 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1089, i32 %1084
  %1092 = load float, ptr %1091, align 4, !invariant.load !98
  %add.28126 = fadd float %add.24125, %1092
  br label %concatenate.30.merge123

concat_index_from_operand_id1127:                 ; preds = %concatenate.pivot.16.130
  %1093 = phi i32 [ 16, %concatenate.pivot.16.130 ]
  %1094 = sub nsw i32 %1045, %1093
  %1095 = add i32 %1044, 0
  %1096 = add i32 %1094, 16
  %1097 = add i32 %1046, 128
  %1098 = mul nuw nsw i32 %1097, 1
  %1099 = add nuw nsw i32 0, %1098
  %1100 = udiv i32 %1099, 168
  %1101 = mul nuw nsw i32 %1096, 1
  %1102 = add nuw nsw i32 0, %1101
  %1103 = mul nuw nsw i32 %1095, 100
  %1104 = add nuw nsw i32 %1102, %1103
  %1105 = udiv i32 %1104, 819200
  %1106 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1104, i32 %1099
  %1107 = load float, ptr %1106, align 4, !invariant.load !98
  br label %concatenate.30.merge123

concatenate.pivot.16.128:                         ; preds = %concatenate.30.merge113
  %1108 = icmp ult i32 %1045, 16
  br i1 %1108, label %concatenate.pivot.0.129, label %concatenate.pivot.16.130

concatenate.pivot.0.129:                          ; preds = %concatenate.pivot.16.128
  br label %concat_index_from_operand_id0124

concatenate.pivot.16.130:                         ; preds = %concatenate.pivot.16.128
  br label %concat_index_from_operand_id1127

concatenate.30.merge123:                          ; preds = %concat_index_from_operand_id1127, %concat_index_from_operand_id0124
  %1109 = phi float [ %add.28126, %concat_index_from_operand_id0124 ], [ %1107, %concat_index_from_operand_id1127 ]
  %multiply.42131 = fmul float %1043, %1109
  %subtract.43132 = fsub float %1042, %multiply.42131
  %1110 = insertvalue { float, float, float, float, float, float, float, float } %1040, float %subtract.43132, 3
  %1111 = getelementptr inbounds float, ptr %arg9, i32 %linear_index2
  %1112 = load float, ptr %1111, align 4, !invariant.load !98
  %1113 = load float, ptr %arg1, align 4, !invariant.load !98
  %1114 = add i32 %17, 0
  %1115 = add i32 %16, 0
  %1116 = add i32 %14, 32
  br label %concatenate.pivot.16.138

concat_index_from_operand_id0134:                 ; preds = %concatenate.pivot.0.139
  %1117 = phi i32 [ 0, %concatenate.pivot.0.139 ]
  %1118 = sub nsw i32 %1115, %1117
  %1119 = mul nuw nsw i32 %1116, 1
  %1120 = add nuw nsw i32 0, %1119
  %1121 = udiv i32 %1120, 40
  %1122 = mul nuw nsw i32 %1118, 1
  %1123 = add nuw nsw i32 0, %1122
  %1124 = mul nuw nsw i32 %1114, 16
  %1125 = add nuw nsw i32 %1123, %1124
  %1126 = udiv i32 %1125, 131072
  %1127 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %1125, i32 %1120
  %1128 = load float, ptr %1127, align 4, !invariant.load !98
  %1129 = mul nuw nsw i32 %1120, 1
  %1130 = add nuw nsw i32 0, %1129
  %1131 = udiv i32 %1130, 40
  %1132 = mul nuw nsw i32 %1125, 1
  %1133 = add nuw nsw i32 0, %1132
  %1134 = urem i32 %1133, 16
  %1135 = udiv i32 %1133, 16
  %1136 = udiv i32 %1135, 8192
  %1137 = add i32 %1135, 0
  %1138 = add i32 %1134, 0
  %1139 = add i32 %1130, 128
  %1140 = mul nuw nsw i32 %1139, 1
  %1141 = add nuw nsw i32 0, %1140
  %1142 = udiv i32 %1141, 168
  %1143 = mul nuw nsw i32 %1138, 1
  %1144 = add nuw nsw i32 0, %1143
  %1145 = mul nuw nsw i32 %1137, 16
  %1146 = add nuw nsw i32 %1144, %1145
  %1147 = udiv i32 %1146, 131072
  %1148 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %1146, i32 %1141
  %1149 = load float, ptr %1148, align 4, !invariant.load !98
  %add.24135 = fadd float %1128, %1149
  %1150 = add i32 %1114, 0
  %1151 = add i32 %1118, 0
  %1152 = add i32 %1116, 128
  %1153 = mul nuw nsw i32 %1152, 1
  %1154 = add nuw nsw i32 0, %1153
  %1155 = udiv i32 %1154, 168
  %1156 = mul nuw nsw i32 %1151, 1
  %1157 = add nuw nsw i32 0, %1156
  %1158 = mul nuw nsw i32 %1150, 100
  %1159 = add nuw nsw i32 %1157, %1158
  %1160 = udiv i32 %1159, 819200
  %1161 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1159, i32 %1154
  %1162 = load float, ptr %1161, align 4, !invariant.load !98
  %add.28136 = fadd float %add.24135, %1162
  br label %concatenate.30.merge133

concat_index_from_operand_id1137:                 ; preds = %concatenate.pivot.16.140
  %1163 = phi i32 [ 16, %concatenate.pivot.16.140 ]
  %1164 = sub nsw i32 %1115, %1163
  %1165 = add i32 %1114, 0
  %1166 = add i32 %1164, 16
  %1167 = add i32 %1116, 128
  %1168 = mul nuw nsw i32 %1167, 1
  %1169 = add nuw nsw i32 0, %1168
  %1170 = udiv i32 %1169, 168
  %1171 = mul nuw nsw i32 %1166, 1
  %1172 = add nuw nsw i32 0, %1171
  %1173 = mul nuw nsw i32 %1165, 100
  %1174 = add nuw nsw i32 %1172, %1173
  %1175 = udiv i32 %1174, 819200
  %1176 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1174, i32 %1169
  %1177 = load float, ptr %1176, align 4, !invariant.load !98
  br label %concatenate.30.merge133

concatenate.pivot.16.138:                         ; preds = %concatenate.30.merge123
  %1178 = icmp ult i32 %1115, 16
  br i1 %1178, label %concatenate.pivot.0.139, label %concatenate.pivot.16.140

concatenate.pivot.0.139:                          ; preds = %concatenate.pivot.16.138
  br label %concat_index_from_operand_id0134

concatenate.pivot.16.140:                         ; preds = %concatenate.pivot.16.138
  br label %concat_index_from_operand_id1137

concatenate.30.merge133:                          ; preds = %concat_index_from_operand_id1137, %concat_index_from_operand_id0134
  %1179 = phi float [ %add.28136, %concat_index_from_operand_id0134 ], [ %1177, %concat_index_from_operand_id1137 ]
  %multiply.45141 = fmul float %1113, %1179
  %subtract.46142 = fsub float %1112, %multiply.45141
  %1180 = insertvalue { float, float, float, float, float, float, float, float } %1110, float %subtract.46142, 4
  %1181 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  %1182 = load float, ptr %1181, align 4, !invariant.load !98
  %1183 = load float, ptr %arg1, align 4, !invariant.load !98
  %1184 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  %1185 = load float, ptr %1184, align 4, !invariant.load !98
  %multiply.47143 = fmul float %1183, %1185
  %subtract.48144 = fsub float %1182, %multiply.47143
  %1186 = insertvalue { float, float, float, float, float, float, float, float } %1180, float %subtract.48144, 5
  %1187 = getelementptr inbounds float, ptr %arg12, i32 %linear_index2
  %1188 = load float, ptr %1187, align 4, !invariant.load !98
  %1189 = getelementptr inbounds float, ptr %arg13, i32 %linear_index2
  %1190 = load float, ptr %1189, align 4, !invariant.load !98
  %multiply.49145 = fmul float %1183, %1190
  %subtract.50146 = fsub float %1188, %multiply.49145
  %1191 = insertvalue { float, float, float, float, float, float, float, float } %1186, float %subtract.50146, 6
  %1192 = getelementptr inbounds float, ptr %arg14, i32 %linear_index2
  %1193 = load float, ptr %1192, align 4, !invariant.load !98
  %1194 = getelementptr inbounds float, ptr %arg15, i32 %linear_index2
  %1195 = load float, ptr %1194, align 4, !invariant.load !98
  %1196 = getelementptr inbounds float, ptr %arg16, i32 %linear_index2
  %1197 = load float, ptr %1196, align 4, !invariant.load !98
  %add.51147 = fadd float %1195, %1197
  %multiply.52148 = fmul float %1183, %add.51147
  %subtract.53149 = fsub float %1193, %multiply.52148
  %1198 = insertvalue { float, float, float, float, float, float, float, float } %1191, float %subtract.53149, 7
  %1199 = extractvalue { float, float, float, float, float, float, float, float } %1198, 0
  %1200 = getelementptr inbounds float, ptr %arg17, i32 %linear_index2
  store float %1199, ptr %1200, align 4
  %1201 = extractvalue { float, float, float, float, float, float, float, float } %1198, 1
  %1202 = getelementptr inbounds float, ptr %arg18, i32 %linear_index2
  store float %1201, ptr %1202, align 4
  %1203 = extractvalue { float, float, float, float, float, float, float, float } %1198, 2
  %1204 = getelementptr inbounds float, ptr %arg19, i32 %linear_index2
  store float %1203, ptr %1204, align 4
  %1205 = extractvalue { float, float, float, float, float, float, float, float } %1198, 3
  %1206 = getelementptr inbounds float, ptr %arg20, i32 %linear_index2
  store float %1205, ptr %1206, align 4
  %1207 = extractvalue { float, float, float, float, float, float, float, float } %1198, 4
  %1208 = getelementptr inbounds float, ptr %arg21, i32 %linear_index2
  store float %1207, ptr %1208, align 4
  %1209 = extractvalue { float, float, float, float, float, float, float, float } %1198, 5
  %1210 = getelementptr inbounds float, ptr %arg22, i32 %linear_index2
  store float %1209, ptr %1210, align 4
  %1211 = extractvalue { float, float, float, float, float, float, float, float } %1198, 6
  %1212 = getelementptr inbounds float, ptr %arg23, i32 %linear_index2
  store float %1211, ptr %1212, align 4
  %1213 = extractvalue { float, float, float, float, float, float, float, float } %1198, 7
  %1214 = getelementptr inbounds float, ptr %arg24, i32 %linear_index2
  store float %1213, ptr %1214, align 4
  %1215 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %1216 = load float, ptr %1215, align 4, !invariant.load !98
  %1217 = load float, ptr %arg1, align 4, !invariant.load !98
  %1218 = add i32 %22, 0
  %1219 = add i32 %21, 0
  %1220 = add i32 %19, 128
  %1221 = mul nuw nsw i32 %1220, 1
  %1222 = add nuw nsw i32 0, %1221
  %1223 = udiv i32 %1222, 200
  %1224 = mul nuw nsw i32 %1219, 1
  %1225 = add nuw nsw i32 0, %1224
  %1226 = mul nuw nsw i32 %1218, 100
  %1227 = add nuw nsw i32 %1225, %1226
  %1228 = udiv i32 %1227, 819200
  %1229 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %1227, i32 %1222
  %1230 = load float, ptr %1229, align 4, !invariant.load !98
  %1231 = add i32 %22, 0
  %1232 = add i32 %21, 0
  %1233 = add i32 %19, 0
  br label %concatenate.pivot.16.155

concat_index_from_operand_id0151:                 ; preds = %concatenate.pivot.0.156
  %1234 = phi i32 [ 0, %concatenate.pivot.0.156 ]
  %1235 = sub nsw i32 %1232, %1234
  %1236 = mul nuw nsw i32 %1233, 1
  %1237 = add nuw nsw i32 0, %1236
  %1238 = udiv i32 %1237, 40
  %1239 = mul nuw nsw i32 %1235, 1
  %1240 = add nuw nsw i32 0, %1239
  %1241 = mul nuw nsw i32 %1231, 16
  %1242 = add nuw nsw i32 %1240, %1241
  %1243 = udiv i32 %1242, 131072
  %1244 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %1242, i32 %1237
  %1245 = load float, ptr %1244, align 4, !invariant.load !98
  %1246 = mul nuw nsw i32 %1237, 1
  %1247 = add nuw nsw i32 0, %1246
  %1248 = udiv i32 %1247, 40
  %1249 = mul nuw nsw i32 %1242, 1
  %1250 = add nuw nsw i32 0, %1249
  %1251 = urem i32 %1250, 16
  %1252 = udiv i32 %1250, 16
  %1253 = udiv i32 %1252, 8192
  %1254 = add i32 %1252, 0
  %1255 = add i32 %1251, 0
  %1256 = add i32 %1247, 128
  %1257 = mul nuw nsw i32 %1256, 1
  %1258 = add nuw nsw i32 0, %1257
  %1259 = udiv i32 %1258, 168
  %1260 = mul nuw nsw i32 %1255, 1
  %1261 = add nuw nsw i32 0, %1260
  %1262 = mul nuw nsw i32 %1254, 16
  %1263 = add nuw nsw i32 %1261, %1262
  %1264 = udiv i32 %1263, 131072
  %1265 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %1263, i32 %1258
  %1266 = load float, ptr %1265, align 4, !invariant.load !98
  %add.24152 = fadd float %1245, %1266
  %1267 = add i32 %1231, 0
  %1268 = add i32 %1235, 0
  %1269 = add i32 %1233, 128
  %1270 = mul nuw nsw i32 %1269, 1
  %1271 = add nuw nsw i32 0, %1270
  %1272 = udiv i32 %1271, 168
  %1273 = mul nuw nsw i32 %1268, 1
  %1274 = add nuw nsw i32 0, %1273
  %1275 = mul nuw nsw i32 %1267, 100
  %1276 = add nuw nsw i32 %1274, %1275
  %1277 = udiv i32 %1276, 819200
  %1278 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1276, i32 %1271
  %1279 = load float, ptr %1278, align 4, !invariant.load !98
  %add.28153 = fadd float %add.24152, %1279
  br label %concatenate.30.merge150

concat_index_from_operand_id1154:                 ; preds = %concatenate.pivot.16.157
  %1280 = phi i32 [ 16, %concatenate.pivot.16.157 ]
  %1281 = sub nsw i32 %1232, %1280
  %1282 = add i32 %1231, 0
  %1283 = add i32 %1281, 16
  %1284 = add i32 %1233, 128
  %1285 = mul nuw nsw i32 %1284, 1
  %1286 = add nuw nsw i32 0, %1285
  %1287 = udiv i32 %1286, 168
  %1288 = mul nuw nsw i32 %1283, 1
  %1289 = add nuw nsw i32 0, %1288
  %1290 = mul nuw nsw i32 %1282, 100
  %1291 = add nuw nsw i32 %1289, %1290
  %1292 = udiv i32 %1291, 819200
  %1293 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1291, i32 %1286
  %1294 = load float, ptr %1293, align 4, !invariant.load !98
  br label %concatenate.30.merge150

concatenate.pivot.16.155:                         ; preds = %concatenate.30.merge133
  %1295 = icmp ult i32 %1232, 16
  br i1 %1295, label %concatenate.pivot.0.156, label %concatenate.pivot.16.157

concatenate.pivot.0.156:                          ; preds = %concatenate.pivot.16.155
  br label %concat_index_from_operand_id0151

concatenate.pivot.16.157:                         ; preds = %concatenate.pivot.16.155
  br label %concat_index_from_operand_id1154

concatenate.30.merge150:                          ; preds = %concat_index_from_operand_id1154, %concat_index_from_operand_id0151
  %1296 = phi float [ %add.28153, %concat_index_from_operand_id0151 ], [ %1294, %concat_index_from_operand_id1154 ]
  %add.32158 = fadd float %1230, %1296
  %multiply.33159 = fmul float %1217, %add.32158
  %subtract.34160 = fsub float %1216, %multiply.33159
  %1297 = insertvalue { float, float, float, float, float, float, float, float } undef, float %subtract.34160, 0
  %1298 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %1299 = load float, ptr %1298, align 4, !invariant.load !98
  %1300 = load float, ptr %arg1, align 4, !invariant.load !98
  %1301 = add i32 %22, 0
  %1302 = add i32 %21, 0
  %1303 = add i32 %19, 16
  br label %concatenate.pivot.16.166

concat_index_from_operand_id0162:                 ; preds = %concatenate.pivot.0.167
  %1304 = phi i32 [ 0, %concatenate.pivot.0.167 ]
  %1305 = sub nsw i32 %1302, %1304
  %1306 = mul nuw nsw i32 %1303, 1
  %1307 = add nuw nsw i32 0, %1306
  %1308 = udiv i32 %1307, 40
  %1309 = mul nuw nsw i32 %1305, 1
  %1310 = add nuw nsw i32 0, %1309
  %1311 = mul nuw nsw i32 %1301, 16
  %1312 = add nuw nsw i32 %1310, %1311
  %1313 = udiv i32 %1312, 131072
  %1314 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %1312, i32 %1307
  %1315 = load float, ptr %1314, align 4, !invariant.load !98
  %1316 = mul nuw nsw i32 %1307, 1
  %1317 = add nuw nsw i32 0, %1316
  %1318 = udiv i32 %1317, 40
  %1319 = mul nuw nsw i32 %1312, 1
  %1320 = add nuw nsw i32 0, %1319
  %1321 = urem i32 %1320, 16
  %1322 = udiv i32 %1320, 16
  %1323 = udiv i32 %1322, 8192
  %1324 = add i32 %1322, 0
  %1325 = add i32 %1321, 0
  %1326 = add i32 %1317, 128
  %1327 = mul nuw nsw i32 %1326, 1
  %1328 = add nuw nsw i32 0, %1327
  %1329 = udiv i32 %1328, 168
  %1330 = mul nuw nsw i32 %1325, 1
  %1331 = add nuw nsw i32 0, %1330
  %1332 = mul nuw nsw i32 %1324, 16
  %1333 = add nuw nsw i32 %1331, %1332
  %1334 = udiv i32 %1333, 131072
  %1335 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %1333, i32 %1328
  %1336 = load float, ptr %1335, align 4, !invariant.load !98
  %add.24163 = fadd float %1315, %1336
  %1337 = add i32 %1301, 0
  %1338 = add i32 %1305, 0
  %1339 = add i32 %1303, 128
  %1340 = mul nuw nsw i32 %1339, 1
  %1341 = add nuw nsw i32 0, %1340
  %1342 = udiv i32 %1341, 168
  %1343 = mul nuw nsw i32 %1338, 1
  %1344 = add nuw nsw i32 0, %1343
  %1345 = mul nuw nsw i32 %1337, 100
  %1346 = add nuw nsw i32 %1344, %1345
  %1347 = udiv i32 %1346, 819200
  %1348 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1346, i32 %1341
  %1349 = load float, ptr %1348, align 4, !invariant.load !98
  %add.28164 = fadd float %add.24163, %1349
  br label %concatenate.30.merge161

concat_index_from_operand_id1165:                 ; preds = %concatenate.pivot.16.168
  %1350 = phi i32 [ 16, %concatenate.pivot.16.168 ]
  %1351 = sub nsw i32 %1302, %1350
  %1352 = add i32 %1301, 0
  %1353 = add i32 %1351, 16
  %1354 = add i32 %1303, 128
  %1355 = mul nuw nsw i32 %1354, 1
  %1356 = add nuw nsw i32 0, %1355
  %1357 = udiv i32 %1356, 168
  %1358 = mul nuw nsw i32 %1353, 1
  %1359 = add nuw nsw i32 0, %1358
  %1360 = mul nuw nsw i32 %1352, 100
  %1361 = add nuw nsw i32 %1359, %1360
  %1362 = udiv i32 %1361, 819200
  %1363 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1361, i32 %1356
  %1364 = load float, ptr %1363, align 4, !invariant.load !98
  br label %concatenate.30.merge161

concatenate.pivot.16.166:                         ; preds = %concatenate.30.merge150
  %1365 = icmp ult i32 %1302, 16
  br i1 %1365, label %concatenate.pivot.0.167, label %concatenate.pivot.16.168

concatenate.pivot.0.167:                          ; preds = %concatenate.pivot.16.166
  br label %concat_index_from_operand_id0162

concatenate.pivot.16.168:                         ; preds = %concatenate.pivot.16.166
  br label %concat_index_from_operand_id1165

concatenate.30.merge161:                          ; preds = %concat_index_from_operand_id1165, %concat_index_from_operand_id0162
  %1366 = phi float [ %add.28164, %concat_index_from_operand_id0162 ], [ %1364, %concat_index_from_operand_id1165 ]
  %multiply.36169 = fmul float %1300, %1366
  %subtract.37170 = fsub float %1299, %multiply.36169
  %1367 = insertvalue { float, float, float, float, float, float, float, float } %1297, float %subtract.37170, 1
  %1368 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %1369 = load float, ptr %1368, align 4, !invariant.load !98
  %1370 = load float, ptr %arg1, align 4, !invariant.load !98
  %1371 = add i32 %22, 0
  %1372 = add i32 %21, 0
  %1373 = add i32 %19, 8
  br label %concatenate.pivot.16.176

concat_index_from_operand_id0172:                 ; preds = %concatenate.pivot.0.177
  %1374 = phi i32 [ 0, %concatenate.pivot.0.177 ]
  %1375 = sub nsw i32 %1372, %1374
  %1376 = mul nuw nsw i32 %1373, 1
  %1377 = add nuw nsw i32 0, %1376
  %1378 = udiv i32 %1377, 40
  %1379 = mul nuw nsw i32 %1375, 1
  %1380 = add nuw nsw i32 0, %1379
  %1381 = mul nuw nsw i32 %1371, 16
  %1382 = add nuw nsw i32 %1380, %1381
  %1383 = udiv i32 %1382, 131072
  %1384 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %1382, i32 %1377
  %1385 = load float, ptr %1384, align 4, !invariant.load !98
  %1386 = mul nuw nsw i32 %1377, 1
  %1387 = add nuw nsw i32 0, %1386
  %1388 = udiv i32 %1387, 40
  %1389 = mul nuw nsw i32 %1382, 1
  %1390 = add nuw nsw i32 0, %1389
  %1391 = urem i32 %1390, 16
  %1392 = udiv i32 %1390, 16
  %1393 = udiv i32 %1392, 8192
  %1394 = add i32 %1392, 0
  %1395 = add i32 %1391, 0
  %1396 = add i32 %1387, 128
  %1397 = mul nuw nsw i32 %1396, 1
  %1398 = add nuw nsw i32 0, %1397
  %1399 = udiv i32 %1398, 168
  %1400 = mul nuw nsw i32 %1395, 1
  %1401 = add nuw nsw i32 0, %1400
  %1402 = mul nuw nsw i32 %1394, 16
  %1403 = add nuw nsw i32 %1401, %1402
  %1404 = udiv i32 %1403, 131072
  %1405 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %1403, i32 %1398
  %1406 = load float, ptr %1405, align 4, !invariant.load !98
  %add.24173 = fadd float %1385, %1406
  %1407 = add i32 %1371, 0
  %1408 = add i32 %1375, 0
  %1409 = add i32 %1373, 128
  %1410 = mul nuw nsw i32 %1409, 1
  %1411 = add nuw nsw i32 0, %1410
  %1412 = udiv i32 %1411, 168
  %1413 = mul nuw nsw i32 %1408, 1
  %1414 = add nuw nsw i32 0, %1413
  %1415 = mul nuw nsw i32 %1407, 100
  %1416 = add nuw nsw i32 %1414, %1415
  %1417 = udiv i32 %1416, 819200
  %1418 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1416, i32 %1411
  %1419 = load float, ptr %1418, align 4, !invariant.load !98
  %add.28174 = fadd float %add.24173, %1419
  br label %concatenate.30.merge171

concat_index_from_operand_id1175:                 ; preds = %concatenate.pivot.16.178
  %1420 = phi i32 [ 16, %concatenate.pivot.16.178 ]
  %1421 = sub nsw i32 %1372, %1420
  %1422 = add i32 %1371, 0
  %1423 = add i32 %1421, 16
  %1424 = add i32 %1373, 128
  %1425 = mul nuw nsw i32 %1424, 1
  %1426 = add nuw nsw i32 0, %1425
  %1427 = udiv i32 %1426, 168
  %1428 = mul nuw nsw i32 %1423, 1
  %1429 = add nuw nsw i32 0, %1428
  %1430 = mul nuw nsw i32 %1422, 100
  %1431 = add nuw nsw i32 %1429, %1430
  %1432 = udiv i32 %1431, 819200
  %1433 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1431, i32 %1426
  %1434 = load float, ptr %1433, align 4, !invariant.load !98
  br label %concatenate.30.merge171

concatenate.pivot.16.176:                         ; preds = %concatenate.30.merge161
  %1435 = icmp ult i32 %1372, 16
  br i1 %1435, label %concatenate.pivot.0.177, label %concatenate.pivot.16.178

concatenate.pivot.0.177:                          ; preds = %concatenate.pivot.16.176
  br label %concat_index_from_operand_id0172

concatenate.pivot.16.178:                         ; preds = %concatenate.pivot.16.176
  br label %concat_index_from_operand_id1175

concatenate.30.merge171:                          ; preds = %concat_index_from_operand_id1175, %concat_index_from_operand_id0172
  %1436 = phi float [ %add.28174, %concat_index_from_operand_id0172 ], [ %1434, %concat_index_from_operand_id1175 ]
  %multiply.39179 = fmul float %1370, %1436
  %subtract.40180 = fsub float %1369, %multiply.39179
  %1437 = insertvalue { float, float, float, float, float, float, float, float } %1367, float %subtract.40180, 2
  %1438 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  %1439 = load float, ptr %1438, align 4, !invariant.load !98
  %1440 = load float, ptr %arg1, align 4, !invariant.load !98
  %1441 = add i32 %22, 0
  %1442 = add i32 %21, 0
  %1443 = add i32 %19, 24
  br label %concatenate.pivot.16.186

concat_index_from_operand_id0182:                 ; preds = %concatenate.pivot.0.187
  %1444 = phi i32 [ 0, %concatenate.pivot.0.187 ]
  %1445 = sub nsw i32 %1442, %1444
  %1446 = mul nuw nsw i32 %1443, 1
  %1447 = add nuw nsw i32 0, %1446
  %1448 = udiv i32 %1447, 40
  %1449 = mul nuw nsw i32 %1445, 1
  %1450 = add nuw nsw i32 0, %1449
  %1451 = mul nuw nsw i32 %1441, 16
  %1452 = add nuw nsw i32 %1450, %1451
  %1453 = udiv i32 %1452, 131072
  %1454 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %1452, i32 %1447
  %1455 = load float, ptr %1454, align 4, !invariant.load !98
  %1456 = mul nuw nsw i32 %1447, 1
  %1457 = add nuw nsw i32 0, %1456
  %1458 = udiv i32 %1457, 40
  %1459 = mul nuw nsw i32 %1452, 1
  %1460 = add nuw nsw i32 0, %1459
  %1461 = urem i32 %1460, 16
  %1462 = udiv i32 %1460, 16
  %1463 = udiv i32 %1462, 8192
  %1464 = add i32 %1462, 0
  %1465 = add i32 %1461, 0
  %1466 = add i32 %1457, 128
  %1467 = mul nuw nsw i32 %1466, 1
  %1468 = add nuw nsw i32 0, %1467
  %1469 = udiv i32 %1468, 168
  %1470 = mul nuw nsw i32 %1465, 1
  %1471 = add nuw nsw i32 0, %1470
  %1472 = mul nuw nsw i32 %1464, 16
  %1473 = add nuw nsw i32 %1471, %1472
  %1474 = udiv i32 %1473, 131072
  %1475 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %1473, i32 %1468
  %1476 = load float, ptr %1475, align 4, !invariant.load !98
  %add.24183 = fadd float %1455, %1476
  %1477 = add i32 %1441, 0
  %1478 = add i32 %1445, 0
  %1479 = add i32 %1443, 128
  %1480 = mul nuw nsw i32 %1479, 1
  %1481 = add nuw nsw i32 0, %1480
  %1482 = udiv i32 %1481, 168
  %1483 = mul nuw nsw i32 %1478, 1
  %1484 = add nuw nsw i32 0, %1483
  %1485 = mul nuw nsw i32 %1477, 100
  %1486 = add nuw nsw i32 %1484, %1485
  %1487 = udiv i32 %1486, 819200
  %1488 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1486, i32 %1481
  %1489 = load float, ptr %1488, align 4, !invariant.load !98
  %add.28184 = fadd float %add.24183, %1489
  br label %concatenate.30.merge181

concat_index_from_operand_id1185:                 ; preds = %concatenate.pivot.16.188
  %1490 = phi i32 [ 16, %concatenate.pivot.16.188 ]
  %1491 = sub nsw i32 %1442, %1490
  %1492 = add i32 %1441, 0
  %1493 = add i32 %1491, 16
  %1494 = add i32 %1443, 128
  %1495 = mul nuw nsw i32 %1494, 1
  %1496 = add nuw nsw i32 0, %1495
  %1497 = udiv i32 %1496, 168
  %1498 = mul nuw nsw i32 %1493, 1
  %1499 = add nuw nsw i32 0, %1498
  %1500 = mul nuw nsw i32 %1492, 100
  %1501 = add nuw nsw i32 %1499, %1500
  %1502 = udiv i32 %1501, 819200
  %1503 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1501, i32 %1496
  %1504 = load float, ptr %1503, align 4, !invariant.load !98
  br label %concatenate.30.merge181

concatenate.pivot.16.186:                         ; preds = %concatenate.30.merge171
  %1505 = icmp ult i32 %1442, 16
  br i1 %1505, label %concatenate.pivot.0.187, label %concatenate.pivot.16.188

concatenate.pivot.0.187:                          ; preds = %concatenate.pivot.16.186
  br label %concat_index_from_operand_id0182

concatenate.pivot.16.188:                         ; preds = %concatenate.pivot.16.186
  br label %concat_index_from_operand_id1185

concatenate.30.merge181:                          ; preds = %concat_index_from_operand_id1185, %concat_index_from_operand_id0182
  %1506 = phi float [ %add.28184, %concat_index_from_operand_id0182 ], [ %1504, %concat_index_from_operand_id1185 ]
  %multiply.42189 = fmul float %1440, %1506
  %subtract.43190 = fsub float %1439, %multiply.42189
  %1507 = insertvalue { float, float, float, float, float, float, float, float } %1437, float %subtract.43190, 3
  %1508 = getelementptr inbounds float, ptr %arg9, i32 %linear_index3
  %1509 = load float, ptr %1508, align 4, !invariant.load !98
  %1510 = load float, ptr %arg1, align 4, !invariant.load !98
  %1511 = add i32 %22, 0
  %1512 = add i32 %21, 0
  %1513 = add i32 %19, 32
  br label %concatenate.pivot.16.196

concat_index_from_operand_id0192:                 ; preds = %concatenate.pivot.0.197
  %1514 = phi i32 [ 0, %concatenate.pivot.0.197 ]
  %1515 = sub nsw i32 %1512, %1514
  %1516 = mul nuw nsw i32 %1513, 1
  %1517 = add nuw nsw i32 0, %1516
  %1518 = udiv i32 %1517, 40
  %1519 = mul nuw nsw i32 %1515, 1
  %1520 = add nuw nsw i32 0, %1519
  %1521 = mul nuw nsw i32 %1511, 16
  %1522 = add nuw nsw i32 %1520, %1521
  %1523 = udiv i32 %1522, 131072
  %1524 = getelementptr inbounds [131072 x [40 x float]], ptr %arg4, i32 0, i32 %1522, i32 %1517
  %1525 = load float, ptr %1524, align 4, !invariant.load !98
  %1526 = mul nuw nsw i32 %1517, 1
  %1527 = add nuw nsw i32 0, %1526
  %1528 = udiv i32 %1527, 40
  %1529 = mul nuw nsw i32 %1522, 1
  %1530 = add nuw nsw i32 0, %1529
  %1531 = urem i32 %1530, 16
  %1532 = udiv i32 %1530, 16
  %1533 = udiv i32 %1532, 8192
  %1534 = add i32 %1532, 0
  %1535 = add i32 %1531, 0
  %1536 = add i32 %1527, 128
  %1537 = mul nuw nsw i32 %1536, 1
  %1538 = add nuw nsw i32 0, %1537
  %1539 = udiv i32 %1538, 168
  %1540 = mul nuw nsw i32 %1535, 1
  %1541 = add nuw nsw i32 0, %1540
  %1542 = mul nuw nsw i32 %1534, 16
  %1543 = add nuw nsw i32 %1541, %1542
  %1544 = udiv i32 %1543, 131072
  %1545 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %1543, i32 %1538
  %1546 = load float, ptr %1545, align 4, !invariant.load !98
  %add.24193 = fadd float %1525, %1546
  %1547 = add i32 %1511, 0
  %1548 = add i32 %1515, 0
  %1549 = add i32 %1513, 128
  %1550 = mul nuw nsw i32 %1549, 1
  %1551 = add nuw nsw i32 0, %1550
  %1552 = udiv i32 %1551, 168
  %1553 = mul nuw nsw i32 %1548, 1
  %1554 = add nuw nsw i32 0, %1553
  %1555 = mul nuw nsw i32 %1547, 100
  %1556 = add nuw nsw i32 %1554, %1555
  %1557 = udiv i32 %1556, 819200
  %1558 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1556, i32 %1551
  %1559 = load float, ptr %1558, align 4, !invariant.load !98
  %add.28194 = fadd float %add.24193, %1559
  br label %concatenate.30.merge191

concat_index_from_operand_id1195:                 ; preds = %concatenate.pivot.16.198
  %1560 = phi i32 [ 16, %concatenate.pivot.16.198 ]
  %1561 = sub nsw i32 %1512, %1560
  %1562 = add i32 %1511, 0
  %1563 = add i32 %1561, 16
  %1564 = add i32 %1513, 128
  %1565 = mul nuw nsw i32 %1564, 1
  %1566 = add nuw nsw i32 0, %1565
  %1567 = udiv i32 %1566, 168
  %1568 = mul nuw nsw i32 %1563, 1
  %1569 = add nuw nsw i32 0, %1568
  %1570 = mul nuw nsw i32 %1562, 100
  %1571 = add nuw nsw i32 %1569, %1570
  %1572 = udiv i32 %1571, 819200
  %1573 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %1571, i32 %1566
  %1574 = load float, ptr %1573, align 4, !invariant.load !98
  br label %concatenate.30.merge191

concatenate.pivot.16.196:                         ; preds = %concatenate.30.merge181
  %1575 = icmp ult i32 %1512, 16
  br i1 %1575, label %concatenate.pivot.0.197, label %concatenate.pivot.16.198

concatenate.pivot.0.197:                          ; preds = %concatenate.pivot.16.196
  br label %concat_index_from_operand_id0192

concatenate.pivot.16.198:                         ; preds = %concatenate.pivot.16.196
  br label %concat_index_from_operand_id1195

concatenate.30.merge191:                          ; preds = %concat_index_from_operand_id1195, %concat_index_from_operand_id0192
  %1576 = phi float [ %add.28194, %concat_index_from_operand_id0192 ], [ %1574, %concat_index_from_operand_id1195 ]
  %multiply.45199 = fmul float %1510, %1576
  %subtract.46200 = fsub float %1509, %multiply.45199
  %1577 = insertvalue { float, float, float, float, float, float, float, float } %1507, float %subtract.46200, 4
  %1578 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  %1579 = load float, ptr %1578, align 4, !invariant.load !98
  %1580 = load float, ptr %arg1, align 4, !invariant.load !98
  %1581 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  %1582 = load float, ptr %1581, align 4, !invariant.load !98
  %multiply.47201 = fmul float %1580, %1582
  %subtract.48202 = fsub float %1579, %multiply.47201
  %1583 = insertvalue { float, float, float, float, float, float, float, float } %1577, float %subtract.48202, 5
  %1584 = getelementptr inbounds float, ptr %arg12, i32 %linear_index3
  %1585 = load float, ptr %1584, align 4, !invariant.load !98
  %1586 = getelementptr inbounds float, ptr %arg13, i32 %linear_index3
  %1587 = load float, ptr %1586, align 4, !invariant.load !98
  %multiply.49203 = fmul float %1580, %1587
  %subtract.50204 = fsub float %1585, %multiply.49203
  %1588 = insertvalue { float, float, float, float, float, float, float, float } %1583, float %subtract.50204, 6
  %1589 = getelementptr inbounds float, ptr %arg14, i32 %linear_index3
  %1590 = load float, ptr %1589, align 4, !invariant.load !98
  %1591 = getelementptr inbounds float, ptr %arg15, i32 %linear_index3
  %1592 = load float, ptr %1591, align 4, !invariant.load !98
  %1593 = getelementptr inbounds float, ptr %arg16, i32 %linear_index3
  %1594 = load float, ptr %1593, align 4, !invariant.load !98
  %add.51205 = fadd float %1592, %1594
  %multiply.52206 = fmul float %1580, %add.51205
  %subtract.53207 = fsub float %1590, %multiply.52206
  %1595 = insertvalue { float, float, float, float, float, float, float, float } %1588, float %subtract.53207, 7
  %1596 = extractvalue { float, float, float, float, float, float, float, float } %1595, 0
  %1597 = getelementptr inbounds float, ptr %arg17, i32 %linear_index3
  store float %1596, ptr %1597, align 4
  %1598 = extractvalue { float, float, float, float, float, float, float, float } %1595, 1
  %1599 = getelementptr inbounds float, ptr %arg18, i32 %linear_index3
  store float %1598, ptr %1599, align 4
  %1600 = extractvalue { float, float, float, float, float, float, float, float } %1595, 2
  %1601 = getelementptr inbounds float, ptr %arg19, i32 %linear_index3
  store float %1600, ptr %1601, align 4
  %1602 = extractvalue { float, float, float, float, float, float, float, float } %1595, 3
  %1603 = getelementptr inbounds float, ptr %arg20, i32 %linear_index3
  store float %1602, ptr %1603, align 4
  %1604 = extractvalue { float, float, float, float, float, float, float, float } %1595, 4
  %1605 = getelementptr inbounds float, ptr %arg21, i32 %linear_index3
  store float %1604, ptr %1605, align 4
  %1606 = extractvalue { float, float, float, float, float, float, float, float } %1595, 5
  %1607 = getelementptr inbounds float, ptr %arg22, i32 %linear_index3
  store float %1606, ptr %1607, align 4
  %1608 = extractvalue { float, float, float, float, float, float, float, float } %1595, 6
  %1609 = getelementptr inbounds float, ptr %arg23, i32 %linear_index3
  store float %1608, ptr %1609, align 4
  %1610 = extractvalue { float, float, float, float, float, float, float, float } %1595, 7
  %1611 = getelementptr inbounds float, ptr %arg24, i32 %linear_index3
  store float %1610, ptr %1611, align 4
  br label %fusion.in_bounds-after
}

define void @fusion_1(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(655360000) %arg2, ptr noalias align 128 dereferenceable(550502400) %arg3, ptr noalias align 128 dereferenceable(67108864) %arg4, ptr noalias align 128 dereferenceable(88080384) %arg5, ptr noalias align 16 dereferenceable(209715200) %arg6, ptr noalias align 16 dereferenceable(209715200) %arg7, ptr noalias align 16 dereferenceable(209715200) %arg8, ptr noalias align 16 dereferenceable(209715200) %arg9, ptr noalias align 16 dereferenceable(209715200) %arg10, ptr noalias align 16 dereferenceable(209715200) %arg11, ptr noalias align 16 dereferenceable(209715200) %arg12, ptr noalias align 128 dereferenceable(209715200) %arg13, ptr noalias align 128 dereferenceable(209715200) %arg14, ptr noalias align 128 dereferenceable(209715200) %arg15, ptr noalias align 128 dereferenceable(209715200) %arg16) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !193
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
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
  br i1 %23, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %concatenate.26.merge77, %entry
  ret void

fusion_1.in_bounds-true:                          ; preds = %entry
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !98
  %26 = load float, ptr %arg1, align 4, !invariant.load !98
  %27 = add i32 %7, 0
  %28 = add i32 %6, 0
  %29 = add i32 %4, 64
  %30 = mul nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 200
  %33 = mul nuw nsw i32 %28, 1
  %34 = add nuw nsw i32 0, %33
  %35 = mul nuw nsw i32 %27, 100
  %36 = add nuw nsw i32 %34, %35
  %37 = udiv i32 %36, 819200
  %38 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %36, i32 %31
  %39 = load float, ptr %38, align 4, !invariant.load !98
  %40 = add i32 %7, 0
  %41 = add i32 %6, 0
  %42 = add i32 %4, 64
  br label %concatenate.pivot.16.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %43 = phi i32 [ 0, %concatenate.pivot.0. ]
  %44 = sub nsw i32 %41, %43
  %45 = mul nuw nsw i32 %42, 1
  %46 = add nuw nsw i32 0, %45
  %47 = udiv i32 %46, 128
  %48 = mul nuw nsw i32 %44, 1
  %49 = add nuw nsw i32 0, %48
  %50 = mul nuw nsw i32 %40, 16
  %51 = add nuw nsw i32 %49, %50
  %52 = udiv i32 %51, 131072
  %53 = getelementptr inbounds [131072 x [128 x float]], ptr %arg4, i32 0, i32 %51, i32 %46
  %54 = load float, ptr %53, align 4, !invariant.load !98
  %55 = mul nuw nsw i32 %46, 1
  %56 = add nuw nsw i32 0, %55
  %57 = udiv i32 %56, 128
  %58 = mul nuw nsw i32 %51, 1
  %59 = add nuw nsw i32 0, %58
  %60 = urem i32 %59, 16
  %61 = udiv i32 %59, 16
  %62 = udiv i32 %61, 8192
  %63 = add i32 %61, 0
  %64 = add i32 %60, 0
  %65 = add i32 %56, 0
  %66 = mul nuw nsw i32 %65, 1
  %67 = add nuw nsw i32 0, %66
  %68 = udiv i32 %67, 168
  %69 = mul nuw nsw i32 %64, 1
  %70 = add nuw nsw i32 0, %69
  %71 = mul nuw nsw i32 %63, 16
  %72 = add nuw nsw i32 %70, %71
  %73 = udiv i32 %72, 131072
  %74 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %72, i32 %67
  %75 = load float, ptr %74, align 4, !invariant.load !98
  %add.20 = fadd float %54, %75
  %76 = add i32 %40, 0
  %77 = add i32 %44, 0
  %78 = add i32 %42, 0
  %79 = mul nuw nsw i32 %78, 1
  %80 = add nuw nsw i32 0, %79
  %81 = udiv i32 %80, 168
  %82 = mul nuw nsw i32 %77, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %76, 100
  %85 = add nuw nsw i32 %83, %84
  %86 = udiv i32 %85, 819200
  %87 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %85, i32 %80
  %88 = load float, ptr %87, align 4, !invariant.load !98
  %add.24 = fadd float %add.20, %88
  br label %concatenate.26.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.16.1
  %89 = phi i32 [ 16, %concatenate.pivot.16.1 ]
  %90 = sub nsw i32 %41, %89
  %91 = add i32 %40, 0
  %92 = add i32 %90, 16
  %93 = add i32 %42, 0
  %94 = mul nuw nsw i32 %93, 1
  %95 = add nuw nsw i32 0, %94
  %96 = udiv i32 %95, 168
  %97 = mul nuw nsw i32 %92, 1
  %98 = add nuw nsw i32 0, %97
  %99 = mul nuw nsw i32 %91, 100
  %100 = add nuw nsw i32 %98, %99
  %101 = udiv i32 %100, 819200
  %102 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %100, i32 %95
  %103 = load float, ptr %102, align 4, !invariant.load !98
  br label %concatenate.26.merge

concatenate.pivot.16.:                            ; preds = %fusion_1.in_bounds-true
  %104 = icmp ult i32 %41, 16
  br i1 %104, label %concatenate.pivot.0., label %concatenate.pivot.16.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id0

concatenate.pivot.16.1:                           ; preds = %concatenate.pivot.16.
  br label %concat_index_from_operand_id1

concatenate.26.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %105 = phi float [ %add.24, %concat_index_from_operand_id0 ], [ %103, %concat_index_from_operand_id1 ]
  %add.28 = fadd float %39, %105
  %multiply.29 = fmul float %26, %add.28
  %subtract.30 = fsub float %25, %multiply.29
  %106 = insertvalue { float, float, float, float } undef, float %subtract.30, 0
  %107 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %108 = load float, ptr %107, align 4, !invariant.load !98
  %109 = load float, ptr %arg1, align 4, !invariant.load !98
  %110 = add i32 %7, 0
  %111 = add i32 %6, 0
  %112 = add i32 %4, 0
  %113 = mul nuw nsw i32 %112, 1
  %114 = add nuw nsw i32 0, %113
  %115 = udiv i32 %114, 200
  %116 = mul nuw nsw i32 %111, 1
  %117 = add nuw nsw i32 0, %116
  %118 = mul nuw nsw i32 %110, 100
  %119 = add nuw nsw i32 %117, %118
  %120 = udiv i32 %119, 819200
  %121 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %119, i32 %114
  %122 = load float, ptr %121, align 4, !invariant.load !98
  %123 = add i32 %7, 0
  %124 = add i32 %6, 0
  %125 = add i32 %4, 0
  br label %concatenate.pivot.16.7

concat_index_from_operand_id03:                   ; preds = %concatenate.pivot.0.8
  %126 = phi i32 [ 0, %concatenate.pivot.0.8 ]
  %127 = sub nsw i32 %124, %126
  %128 = mul nuw nsw i32 %125, 1
  %129 = add nuw nsw i32 0, %128
  %130 = udiv i32 %129, 128
  %131 = mul nuw nsw i32 %127, 1
  %132 = add nuw nsw i32 0, %131
  %133 = mul nuw nsw i32 %123, 16
  %134 = add nuw nsw i32 %132, %133
  %135 = udiv i32 %134, 131072
  %136 = getelementptr inbounds [131072 x [128 x float]], ptr %arg4, i32 0, i32 %134, i32 %129
  %137 = load float, ptr %136, align 4, !invariant.load !98
  %138 = mul nuw nsw i32 %129, 1
  %139 = add nuw nsw i32 0, %138
  %140 = udiv i32 %139, 128
  %141 = mul nuw nsw i32 %134, 1
  %142 = add nuw nsw i32 0, %141
  %143 = urem i32 %142, 16
  %144 = udiv i32 %142, 16
  %145 = udiv i32 %144, 8192
  %146 = add i32 %144, 0
  %147 = add i32 %143, 0
  %148 = add i32 %139, 0
  %149 = mul nuw nsw i32 %148, 1
  %150 = add nuw nsw i32 0, %149
  %151 = udiv i32 %150, 168
  %152 = mul nuw nsw i32 %147, 1
  %153 = add nuw nsw i32 0, %152
  %154 = mul nuw nsw i32 %146, 16
  %155 = add nuw nsw i32 %153, %154
  %156 = udiv i32 %155, 131072
  %157 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %155, i32 %150
  %158 = load float, ptr %157, align 4, !invariant.load !98
  %add.204 = fadd float %137, %158
  %159 = add i32 %123, 0
  %160 = add i32 %127, 0
  %161 = add i32 %125, 0
  %162 = mul nuw nsw i32 %161, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 168
  %165 = mul nuw nsw i32 %160, 1
  %166 = add nuw nsw i32 0, %165
  %167 = mul nuw nsw i32 %159, 100
  %168 = add nuw nsw i32 %166, %167
  %169 = udiv i32 %168, 819200
  %170 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %168, i32 %163
  %171 = load float, ptr %170, align 4, !invariant.load !98
  %add.245 = fadd float %add.204, %171
  br label %concatenate.26.merge2

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.16.9
  %172 = phi i32 [ 16, %concatenate.pivot.16.9 ]
  %173 = sub nsw i32 %124, %172
  %174 = add i32 %123, 0
  %175 = add i32 %173, 16
  %176 = add i32 %125, 0
  %177 = mul nuw nsw i32 %176, 1
  %178 = add nuw nsw i32 0, %177
  %179 = udiv i32 %178, 168
  %180 = mul nuw nsw i32 %175, 1
  %181 = add nuw nsw i32 0, %180
  %182 = mul nuw nsw i32 %174, 100
  %183 = add nuw nsw i32 %181, %182
  %184 = udiv i32 %183, 819200
  %185 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %183, i32 %178
  %186 = load float, ptr %185, align 4, !invariant.load !98
  br label %concatenate.26.merge2

concatenate.pivot.16.7:                           ; preds = %concatenate.26.merge
  %187 = icmp ult i32 %124, 16
  br i1 %187, label %concatenate.pivot.0.8, label %concatenate.pivot.16.9

concatenate.pivot.0.8:                            ; preds = %concatenate.pivot.16.7
  br label %concat_index_from_operand_id03

concatenate.pivot.16.9:                           ; preds = %concatenate.pivot.16.7
  br label %concat_index_from_operand_id16

concatenate.26.merge2:                            ; preds = %concat_index_from_operand_id16, %concat_index_from_operand_id03
  %188 = phi float [ %add.245, %concat_index_from_operand_id03 ], [ %186, %concat_index_from_operand_id16 ]
  %add.33 = fadd float %122, %188
  %multiply.34 = fmul float %109, %add.33
  %subtract.35 = fsub float %108, %multiply.34
  %189 = insertvalue { float, float, float, float } %106, float %subtract.35, 1
  %190 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %191 = load float, ptr %190, align 4, !invariant.load !98
  %192 = load float, ptr %arg1, align 4, !invariant.load !98
  %193 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  %194 = load float, ptr %193, align 4, !invariant.load !98
  %195 = getelementptr inbounds float, ptr %arg9, i32 %linear_index_base
  %196 = load float, ptr %195, align 4, !invariant.load !98
  %add.36 = fadd float %194, %196
  %multiply.37 = fmul float %192, %add.36
  %subtract.38 = fsub float %191, %multiply.37
  %197 = insertvalue { float, float, float, float } %189, float %subtract.38, 2
  %198 = getelementptr inbounds float, ptr %arg10, i32 %linear_index_base
  %199 = load float, ptr %198, align 4, !invariant.load !98
  %200 = getelementptr inbounds float, ptr %arg11, i32 %linear_index_base
  %201 = load float, ptr %200, align 4, !invariant.load !98
  %202 = getelementptr inbounds float, ptr %arg12, i32 %linear_index_base
  %203 = load float, ptr %202, align 4, !invariant.load !98
  %add.39 = fadd float %201, %203
  %multiply.40 = fmul float %192, %add.39
  %subtract.41 = fsub float %199, %multiply.40
  %204 = insertvalue { float, float, float, float } %197, float %subtract.41, 3
  %205 = extractvalue { float, float, float, float } %204, 0
  %206 = getelementptr inbounds float, ptr %arg13, i32 %linear_index_base
  store float %205, ptr %206, align 4
  %207 = extractvalue { float, float, float, float } %204, 1
  %208 = getelementptr inbounds float, ptr %arg14, i32 %linear_index_base
  store float %207, ptr %208, align 4
  %209 = extractvalue { float, float, float, float } %204, 2
  %210 = getelementptr inbounds float, ptr %arg15, i32 %linear_index_base
  store float %209, ptr %210, align 4
  %211 = extractvalue { float, float, float, float } %204, 3
  %212 = getelementptr inbounds float, ptr %arg16, i32 %linear_index_base
  store float %211, ptr %212, align 4
  %213 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %214 = load float, ptr %213, align 4, !invariant.load !98
  %215 = load float, ptr %arg1, align 4, !invariant.load !98
  %216 = add i32 %12, 0
  %217 = add i32 %11, 0
  %218 = add i32 %9, 64
  %219 = mul nuw nsw i32 %218, 1
  %220 = add nuw nsw i32 0, %219
  %221 = udiv i32 %220, 200
  %222 = mul nuw nsw i32 %217, 1
  %223 = add nuw nsw i32 0, %222
  %224 = mul nuw nsw i32 %216, 100
  %225 = add nuw nsw i32 %223, %224
  %226 = udiv i32 %225, 819200
  %227 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %225, i32 %220
  %228 = load float, ptr %227, align 4, !invariant.load !98
  %229 = add i32 %12, 0
  %230 = add i32 %11, 0
  %231 = add i32 %9, 64
  br label %concatenate.pivot.16.15

concat_index_from_operand_id011:                  ; preds = %concatenate.pivot.0.16
  %232 = phi i32 [ 0, %concatenate.pivot.0.16 ]
  %233 = sub nsw i32 %230, %232
  %234 = mul nuw nsw i32 %231, 1
  %235 = add nuw nsw i32 0, %234
  %236 = udiv i32 %235, 128
  %237 = mul nuw nsw i32 %233, 1
  %238 = add nuw nsw i32 0, %237
  %239 = mul nuw nsw i32 %229, 16
  %240 = add nuw nsw i32 %238, %239
  %241 = udiv i32 %240, 131072
  %242 = getelementptr inbounds [131072 x [128 x float]], ptr %arg4, i32 0, i32 %240, i32 %235
  %243 = load float, ptr %242, align 4, !invariant.load !98
  %244 = mul nuw nsw i32 %235, 1
  %245 = add nuw nsw i32 0, %244
  %246 = udiv i32 %245, 128
  %247 = mul nuw nsw i32 %240, 1
  %248 = add nuw nsw i32 0, %247
  %249 = urem i32 %248, 16
  %250 = udiv i32 %248, 16
  %251 = udiv i32 %250, 8192
  %252 = add i32 %250, 0
  %253 = add i32 %249, 0
  %254 = add i32 %245, 0
  %255 = mul nuw nsw i32 %254, 1
  %256 = add nuw nsw i32 0, %255
  %257 = udiv i32 %256, 168
  %258 = mul nuw nsw i32 %253, 1
  %259 = add nuw nsw i32 0, %258
  %260 = mul nuw nsw i32 %252, 16
  %261 = add nuw nsw i32 %259, %260
  %262 = udiv i32 %261, 131072
  %263 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %261, i32 %256
  %264 = load float, ptr %263, align 4, !invariant.load !98
  %add.2012 = fadd float %243, %264
  %265 = add i32 %229, 0
  %266 = add i32 %233, 0
  %267 = add i32 %231, 0
  %268 = mul nuw nsw i32 %267, 1
  %269 = add nuw nsw i32 0, %268
  %270 = udiv i32 %269, 168
  %271 = mul nuw nsw i32 %266, 1
  %272 = add nuw nsw i32 0, %271
  %273 = mul nuw nsw i32 %265, 100
  %274 = add nuw nsw i32 %272, %273
  %275 = udiv i32 %274, 819200
  %276 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %274, i32 %269
  %277 = load float, ptr %276, align 4, !invariant.load !98
  %add.2413 = fadd float %add.2012, %277
  br label %concatenate.26.merge10

concat_index_from_operand_id114:                  ; preds = %concatenate.pivot.16.17
  %278 = phi i32 [ 16, %concatenate.pivot.16.17 ]
  %279 = sub nsw i32 %230, %278
  %280 = add i32 %229, 0
  %281 = add i32 %279, 16
  %282 = add i32 %231, 0
  %283 = mul nuw nsw i32 %282, 1
  %284 = add nuw nsw i32 0, %283
  %285 = udiv i32 %284, 168
  %286 = mul nuw nsw i32 %281, 1
  %287 = add nuw nsw i32 0, %286
  %288 = mul nuw nsw i32 %280, 100
  %289 = add nuw nsw i32 %287, %288
  %290 = udiv i32 %289, 819200
  %291 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %289, i32 %284
  %292 = load float, ptr %291, align 4, !invariant.load !98
  br label %concatenate.26.merge10

concatenate.pivot.16.15:                          ; preds = %concatenate.26.merge2
  %293 = icmp ult i32 %230, 16
  br i1 %293, label %concatenate.pivot.0.16, label %concatenate.pivot.16.17

concatenate.pivot.0.16:                           ; preds = %concatenate.pivot.16.15
  br label %concat_index_from_operand_id011

concatenate.pivot.16.17:                          ; preds = %concatenate.pivot.16.15
  br label %concat_index_from_operand_id114

concatenate.26.merge10:                           ; preds = %concat_index_from_operand_id114, %concat_index_from_operand_id011
  %294 = phi float [ %add.2413, %concat_index_from_operand_id011 ], [ %292, %concat_index_from_operand_id114 ]
  %add.2818 = fadd float %228, %294
  %multiply.2919 = fmul float %215, %add.2818
  %subtract.3020 = fsub float %214, %multiply.2919
  %295 = insertvalue { float, float, float, float } undef, float %subtract.3020, 0
  %296 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %297 = load float, ptr %296, align 4, !invariant.load !98
  %298 = load float, ptr %arg1, align 4, !invariant.load !98
  %299 = add i32 %12, 0
  %300 = add i32 %11, 0
  %301 = add i32 %9, 0
  %302 = mul nuw nsw i32 %301, 1
  %303 = add nuw nsw i32 0, %302
  %304 = udiv i32 %303, 200
  %305 = mul nuw nsw i32 %300, 1
  %306 = add nuw nsw i32 0, %305
  %307 = mul nuw nsw i32 %299, 100
  %308 = add nuw nsw i32 %306, %307
  %309 = udiv i32 %308, 819200
  %310 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %308, i32 %303
  %311 = load float, ptr %310, align 4, !invariant.load !98
  %312 = add i32 %12, 0
  %313 = add i32 %11, 0
  %314 = add i32 %9, 0
  br label %concatenate.pivot.16.26

concat_index_from_operand_id022:                  ; preds = %concatenate.pivot.0.27
  %315 = phi i32 [ 0, %concatenate.pivot.0.27 ]
  %316 = sub nsw i32 %313, %315
  %317 = mul nuw nsw i32 %314, 1
  %318 = add nuw nsw i32 0, %317
  %319 = udiv i32 %318, 128
  %320 = mul nuw nsw i32 %316, 1
  %321 = add nuw nsw i32 0, %320
  %322 = mul nuw nsw i32 %312, 16
  %323 = add nuw nsw i32 %321, %322
  %324 = udiv i32 %323, 131072
  %325 = getelementptr inbounds [131072 x [128 x float]], ptr %arg4, i32 0, i32 %323, i32 %318
  %326 = load float, ptr %325, align 4, !invariant.load !98
  %327 = mul nuw nsw i32 %318, 1
  %328 = add nuw nsw i32 0, %327
  %329 = udiv i32 %328, 128
  %330 = mul nuw nsw i32 %323, 1
  %331 = add nuw nsw i32 0, %330
  %332 = urem i32 %331, 16
  %333 = udiv i32 %331, 16
  %334 = udiv i32 %333, 8192
  %335 = add i32 %333, 0
  %336 = add i32 %332, 0
  %337 = add i32 %328, 0
  %338 = mul nuw nsw i32 %337, 1
  %339 = add nuw nsw i32 0, %338
  %340 = udiv i32 %339, 168
  %341 = mul nuw nsw i32 %336, 1
  %342 = add nuw nsw i32 0, %341
  %343 = mul nuw nsw i32 %335, 16
  %344 = add nuw nsw i32 %342, %343
  %345 = udiv i32 %344, 131072
  %346 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %344, i32 %339
  %347 = load float, ptr %346, align 4, !invariant.load !98
  %add.2023 = fadd float %326, %347
  %348 = add i32 %312, 0
  %349 = add i32 %316, 0
  %350 = add i32 %314, 0
  %351 = mul nuw nsw i32 %350, 1
  %352 = add nuw nsw i32 0, %351
  %353 = udiv i32 %352, 168
  %354 = mul nuw nsw i32 %349, 1
  %355 = add nuw nsw i32 0, %354
  %356 = mul nuw nsw i32 %348, 100
  %357 = add nuw nsw i32 %355, %356
  %358 = udiv i32 %357, 819200
  %359 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %357, i32 %352
  %360 = load float, ptr %359, align 4, !invariant.load !98
  %add.2424 = fadd float %add.2023, %360
  br label %concatenate.26.merge21

concat_index_from_operand_id125:                  ; preds = %concatenate.pivot.16.28
  %361 = phi i32 [ 16, %concatenate.pivot.16.28 ]
  %362 = sub nsw i32 %313, %361
  %363 = add i32 %312, 0
  %364 = add i32 %362, 16
  %365 = add i32 %314, 0
  %366 = mul nuw nsw i32 %365, 1
  %367 = add nuw nsw i32 0, %366
  %368 = udiv i32 %367, 168
  %369 = mul nuw nsw i32 %364, 1
  %370 = add nuw nsw i32 0, %369
  %371 = mul nuw nsw i32 %363, 100
  %372 = add nuw nsw i32 %370, %371
  %373 = udiv i32 %372, 819200
  %374 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %372, i32 %367
  %375 = load float, ptr %374, align 4, !invariant.load !98
  br label %concatenate.26.merge21

concatenate.pivot.16.26:                          ; preds = %concatenate.26.merge10
  %376 = icmp ult i32 %313, 16
  br i1 %376, label %concatenate.pivot.0.27, label %concatenate.pivot.16.28

concatenate.pivot.0.27:                           ; preds = %concatenate.pivot.16.26
  br label %concat_index_from_operand_id022

concatenate.pivot.16.28:                          ; preds = %concatenate.pivot.16.26
  br label %concat_index_from_operand_id125

concatenate.26.merge21:                           ; preds = %concat_index_from_operand_id125, %concat_index_from_operand_id022
  %377 = phi float [ %add.2424, %concat_index_from_operand_id022 ], [ %375, %concat_index_from_operand_id125 ]
  %add.3329 = fadd float %311, %377
  %multiply.3430 = fmul float %298, %add.3329
  %subtract.3531 = fsub float %297, %multiply.3430
  %378 = insertvalue { float, float, float, float } %295, float %subtract.3531, 1
  %379 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %380 = load float, ptr %379, align 4, !invariant.load !98
  %381 = load float, ptr %arg1, align 4, !invariant.load !98
  %382 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  %383 = load float, ptr %382, align 4, !invariant.load !98
  %384 = getelementptr inbounds float, ptr %arg9, i32 %linear_index1
  %385 = load float, ptr %384, align 4, !invariant.load !98
  %add.3632 = fadd float %383, %385
  %multiply.3733 = fmul float %381, %add.3632
  %subtract.3834 = fsub float %380, %multiply.3733
  %386 = insertvalue { float, float, float, float } %378, float %subtract.3834, 2
  %387 = getelementptr inbounds float, ptr %arg10, i32 %linear_index1
  %388 = load float, ptr %387, align 4, !invariant.load !98
  %389 = getelementptr inbounds float, ptr %arg11, i32 %linear_index1
  %390 = load float, ptr %389, align 4, !invariant.load !98
  %391 = getelementptr inbounds float, ptr %arg12, i32 %linear_index1
  %392 = load float, ptr %391, align 4, !invariant.load !98
  %add.3935 = fadd float %390, %392
  %multiply.4036 = fmul float %381, %add.3935
  %subtract.4137 = fsub float %388, %multiply.4036
  %393 = insertvalue { float, float, float, float } %386, float %subtract.4137, 3
  %394 = extractvalue { float, float, float, float } %393, 0
  %395 = getelementptr inbounds float, ptr %arg13, i32 %linear_index1
  store float %394, ptr %395, align 4
  %396 = extractvalue { float, float, float, float } %393, 1
  %397 = getelementptr inbounds float, ptr %arg14, i32 %linear_index1
  store float %396, ptr %397, align 4
  %398 = extractvalue { float, float, float, float } %393, 2
  %399 = getelementptr inbounds float, ptr %arg15, i32 %linear_index1
  store float %398, ptr %399, align 4
  %400 = extractvalue { float, float, float, float } %393, 3
  %401 = getelementptr inbounds float, ptr %arg16, i32 %linear_index1
  store float %400, ptr %401, align 4
  %402 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %403 = load float, ptr %402, align 4, !invariant.load !98
  %404 = load float, ptr %arg1, align 4, !invariant.load !98
  %405 = add i32 %17, 0
  %406 = add i32 %16, 0
  %407 = add i32 %14, 64
  %408 = mul nuw nsw i32 %407, 1
  %409 = add nuw nsw i32 0, %408
  %410 = udiv i32 %409, 200
  %411 = mul nuw nsw i32 %406, 1
  %412 = add nuw nsw i32 0, %411
  %413 = mul nuw nsw i32 %405, 100
  %414 = add nuw nsw i32 %412, %413
  %415 = udiv i32 %414, 819200
  %416 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %414, i32 %409
  %417 = load float, ptr %416, align 4, !invariant.load !98
  %418 = add i32 %17, 0
  %419 = add i32 %16, 0
  %420 = add i32 %14, 64
  br label %concatenate.pivot.16.43

concat_index_from_operand_id039:                  ; preds = %concatenate.pivot.0.44
  %421 = phi i32 [ 0, %concatenate.pivot.0.44 ]
  %422 = sub nsw i32 %419, %421
  %423 = mul nuw nsw i32 %420, 1
  %424 = add nuw nsw i32 0, %423
  %425 = udiv i32 %424, 128
  %426 = mul nuw nsw i32 %422, 1
  %427 = add nuw nsw i32 0, %426
  %428 = mul nuw nsw i32 %418, 16
  %429 = add nuw nsw i32 %427, %428
  %430 = udiv i32 %429, 131072
  %431 = getelementptr inbounds [131072 x [128 x float]], ptr %arg4, i32 0, i32 %429, i32 %424
  %432 = load float, ptr %431, align 4, !invariant.load !98
  %433 = mul nuw nsw i32 %424, 1
  %434 = add nuw nsw i32 0, %433
  %435 = udiv i32 %434, 128
  %436 = mul nuw nsw i32 %429, 1
  %437 = add nuw nsw i32 0, %436
  %438 = urem i32 %437, 16
  %439 = udiv i32 %437, 16
  %440 = udiv i32 %439, 8192
  %441 = add i32 %439, 0
  %442 = add i32 %438, 0
  %443 = add i32 %434, 0
  %444 = mul nuw nsw i32 %443, 1
  %445 = add nuw nsw i32 0, %444
  %446 = udiv i32 %445, 168
  %447 = mul nuw nsw i32 %442, 1
  %448 = add nuw nsw i32 0, %447
  %449 = mul nuw nsw i32 %441, 16
  %450 = add nuw nsw i32 %448, %449
  %451 = udiv i32 %450, 131072
  %452 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %450, i32 %445
  %453 = load float, ptr %452, align 4, !invariant.load !98
  %add.2040 = fadd float %432, %453
  %454 = add i32 %418, 0
  %455 = add i32 %422, 0
  %456 = add i32 %420, 0
  %457 = mul nuw nsw i32 %456, 1
  %458 = add nuw nsw i32 0, %457
  %459 = udiv i32 %458, 168
  %460 = mul nuw nsw i32 %455, 1
  %461 = add nuw nsw i32 0, %460
  %462 = mul nuw nsw i32 %454, 100
  %463 = add nuw nsw i32 %461, %462
  %464 = udiv i32 %463, 819200
  %465 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %463, i32 %458
  %466 = load float, ptr %465, align 4, !invariant.load !98
  %add.2441 = fadd float %add.2040, %466
  br label %concatenate.26.merge38

concat_index_from_operand_id142:                  ; preds = %concatenate.pivot.16.45
  %467 = phi i32 [ 16, %concatenate.pivot.16.45 ]
  %468 = sub nsw i32 %419, %467
  %469 = add i32 %418, 0
  %470 = add i32 %468, 16
  %471 = add i32 %420, 0
  %472 = mul nuw nsw i32 %471, 1
  %473 = add nuw nsw i32 0, %472
  %474 = udiv i32 %473, 168
  %475 = mul nuw nsw i32 %470, 1
  %476 = add nuw nsw i32 0, %475
  %477 = mul nuw nsw i32 %469, 100
  %478 = add nuw nsw i32 %476, %477
  %479 = udiv i32 %478, 819200
  %480 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %478, i32 %473
  %481 = load float, ptr %480, align 4, !invariant.load !98
  br label %concatenate.26.merge38

concatenate.pivot.16.43:                          ; preds = %concatenate.26.merge21
  %482 = icmp ult i32 %419, 16
  br i1 %482, label %concatenate.pivot.0.44, label %concatenate.pivot.16.45

concatenate.pivot.0.44:                           ; preds = %concatenate.pivot.16.43
  br label %concat_index_from_operand_id039

concatenate.pivot.16.45:                          ; preds = %concatenate.pivot.16.43
  br label %concat_index_from_operand_id142

concatenate.26.merge38:                           ; preds = %concat_index_from_operand_id142, %concat_index_from_operand_id039
  %483 = phi float [ %add.2441, %concat_index_from_operand_id039 ], [ %481, %concat_index_from_operand_id142 ]
  %add.2846 = fadd float %417, %483
  %multiply.2947 = fmul float %404, %add.2846
  %subtract.3048 = fsub float %403, %multiply.2947
  %484 = insertvalue { float, float, float, float } undef, float %subtract.3048, 0
  %485 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %486 = load float, ptr %485, align 4, !invariant.load !98
  %487 = load float, ptr %arg1, align 4, !invariant.load !98
  %488 = add i32 %17, 0
  %489 = add i32 %16, 0
  %490 = add i32 %14, 0
  %491 = mul nuw nsw i32 %490, 1
  %492 = add nuw nsw i32 0, %491
  %493 = udiv i32 %492, 200
  %494 = mul nuw nsw i32 %489, 1
  %495 = add nuw nsw i32 0, %494
  %496 = mul nuw nsw i32 %488, 100
  %497 = add nuw nsw i32 %495, %496
  %498 = udiv i32 %497, 819200
  %499 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %497, i32 %492
  %500 = load float, ptr %499, align 4, !invariant.load !98
  %501 = add i32 %17, 0
  %502 = add i32 %16, 0
  %503 = add i32 %14, 0
  br label %concatenate.pivot.16.54

concat_index_from_operand_id050:                  ; preds = %concatenate.pivot.0.55
  %504 = phi i32 [ 0, %concatenate.pivot.0.55 ]
  %505 = sub nsw i32 %502, %504
  %506 = mul nuw nsw i32 %503, 1
  %507 = add nuw nsw i32 0, %506
  %508 = udiv i32 %507, 128
  %509 = mul nuw nsw i32 %505, 1
  %510 = add nuw nsw i32 0, %509
  %511 = mul nuw nsw i32 %501, 16
  %512 = add nuw nsw i32 %510, %511
  %513 = udiv i32 %512, 131072
  %514 = getelementptr inbounds [131072 x [128 x float]], ptr %arg4, i32 0, i32 %512, i32 %507
  %515 = load float, ptr %514, align 4, !invariant.load !98
  %516 = mul nuw nsw i32 %507, 1
  %517 = add nuw nsw i32 0, %516
  %518 = udiv i32 %517, 128
  %519 = mul nuw nsw i32 %512, 1
  %520 = add nuw nsw i32 0, %519
  %521 = urem i32 %520, 16
  %522 = udiv i32 %520, 16
  %523 = udiv i32 %522, 8192
  %524 = add i32 %522, 0
  %525 = add i32 %521, 0
  %526 = add i32 %517, 0
  %527 = mul nuw nsw i32 %526, 1
  %528 = add nuw nsw i32 0, %527
  %529 = udiv i32 %528, 168
  %530 = mul nuw nsw i32 %525, 1
  %531 = add nuw nsw i32 0, %530
  %532 = mul nuw nsw i32 %524, 16
  %533 = add nuw nsw i32 %531, %532
  %534 = udiv i32 %533, 131072
  %535 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %533, i32 %528
  %536 = load float, ptr %535, align 4, !invariant.load !98
  %add.2051 = fadd float %515, %536
  %537 = add i32 %501, 0
  %538 = add i32 %505, 0
  %539 = add i32 %503, 0
  %540 = mul nuw nsw i32 %539, 1
  %541 = add nuw nsw i32 0, %540
  %542 = udiv i32 %541, 168
  %543 = mul nuw nsw i32 %538, 1
  %544 = add nuw nsw i32 0, %543
  %545 = mul nuw nsw i32 %537, 100
  %546 = add nuw nsw i32 %544, %545
  %547 = udiv i32 %546, 819200
  %548 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %546, i32 %541
  %549 = load float, ptr %548, align 4, !invariant.load !98
  %add.2452 = fadd float %add.2051, %549
  br label %concatenate.26.merge49

concat_index_from_operand_id153:                  ; preds = %concatenate.pivot.16.56
  %550 = phi i32 [ 16, %concatenate.pivot.16.56 ]
  %551 = sub nsw i32 %502, %550
  %552 = add i32 %501, 0
  %553 = add i32 %551, 16
  %554 = add i32 %503, 0
  %555 = mul nuw nsw i32 %554, 1
  %556 = add nuw nsw i32 0, %555
  %557 = udiv i32 %556, 168
  %558 = mul nuw nsw i32 %553, 1
  %559 = add nuw nsw i32 0, %558
  %560 = mul nuw nsw i32 %552, 100
  %561 = add nuw nsw i32 %559, %560
  %562 = udiv i32 %561, 819200
  %563 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %561, i32 %556
  %564 = load float, ptr %563, align 4, !invariant.load !98
  br label %concatenate.26.merge49

concatenate.pivot.16.54:                          ; preds = %concatenate.26.merge38
  %565 = icmp ult i32 %502, 16
  br i1 %565, label %concatenate.pivot.0.55, label %concatenate.pivot.16.56

concatenate.pivot.0.55:                           ; preds = %concatenate.pivot.16.54
  br label %concat_index_from_operand_id050

concatenate.pivot.16.56:                          ; preds = %concatenate.pivot.16.54
  br label %concat_index_from_operand_id153

concatenate.26.merge49:                           ; preds = %concat_index_from_operand_id153, %concat_index_from_operand_id050
  %566 = phi float [ %add.2452, %concat_index_from_operand_id050 ], [ %564, %concat_index_from_operand_id153 ]
  %add.3357 = fadd float %500, %566
  %multiply.3458 = fmul float %487, %add.3357
  %subtract.3559 = fsub float %486, %multiply.3458
  %567 = insertvalue { float, float, float, float } %484, float %subtract.3559, 1
  %568 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %569 = load float, ptr %568, align 4, !invariant.load !98
  %570 = load float, ptr %arg1, align 4, !invariant.load !98
  %571 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  %572 = load float, ptr %571, align 4, !invariant.load !98
  %573 = getelementptr inbounds float, ptr %arg9, i32 %linear_index2
  %574 = load float, ptr %573, align 4, !invariant.load !98
  %add.3660 = fadd float %572, %574
  %multiply.3761 = fmul float %570, %add.3660
  %subtract.3862 = fsub float %569, %multiply.3761
  %575 = insertvalue { float, float, float, float } %567, float %subtract.3862, 2
  %576 = getelementptr inbounds float, ptr %arg10, i32 %linear_index2
  %577 = load float, ptr %576, align 4, !invariant.load !98
  %578 = getelementptr inbounds float, ptr %arg11, i32 %linear_index2
  %579 = load float, ptr %578, align 4, !invariant.load !98
  %580 = getelementptr inbounds float, ptr %arg12, i32 %linear_index2
  %581 = load float, ptr %580, align 4, !invariant.load !98
  %add.3963 = fadd float %579, %581
  %multiply.4064 = fmul float %570, %add.3963
  %subtract.4165 = fsub float %577, %multiply.4064
  %582 = insertvalue { float, float, float, float } %575, float %subtract.4165, 3
  %583 = extractvalue { float, float, float, float } %582, 0
  %584 = getelementptr inbounds float, ptr %arg13, i32 %linear_index2
  store float %583, ptr %584, align 4
  %585 = extractvalue { float, float, float, float } %582, 1
  %586 = getelementptr inbounds float, ptr %arg14, i32 %linear_index2
  store float %585, ptr %586, align 4
  %587 = extractvalue { float, float, float, float } %582, 2
  %588 = getelementptr inbounds float, ptr %arg15, i32 %linear_index2
  store float %587, ptr %588, align 4
  %589 = extractvalue { float, float, float, float } %582, 3
  %590 = getelementptr inbounds float, ptr %arg16, i32 %linear_index2
  store float %589, ptr %590, align 4
  %591 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %592 = load float, ptr %591, align 4, !invariant.load !98
  %593 = load float, ptr %arg1, align 4, !invariant.load !98
  %594 = add i32 %22, 0
  %595 = add i32 %21, 0
  %596 = add i32 %19, 64
  %597 = mul nuw nsw i32 %596, 1
  %598 = add nuw nsw i32 0, %597
  %599 = udiv i32 %598, 200
  %600 = mul nuw nsw i32 %595, 1
  %601 = add nuw nsw i32 0, %600
  %602 = mul nuw nsw i32 %594, 100
  %603 = add nuw nsw i32 %601, %602
  %604 = udiv i32 %603, 819200
  %605 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %603, i32 %598
  %606 = load float, ptr %605, align 4, !invariant.load !98
  %607 = add i32 %22, 0
  %608 = add i32 %21, 0
  %609 = add i32 %19, 64
  br label %concatenate.pivot.16.71

concat_index_from_operand_id067:                  ; preds = %concatenate.pivot.0.72
  %610 = phi i32 [ 0, %concatenate.pivot.0.72 ]
  %611 = sub nsw i32 %608, %610
  %612 = mul nuw nsw i32 %609, 1
  %613 = add nuw nsw i32 0, %612
  %614 = udiv i32 %613, 128
  %615 = mul nuw nsw i32 %611, 1
  %616 = add nuw nsw i32 0, %615
  %617 = mul nuw nsw i32 %607, 16
  %618 = add nuw nsw i32 %616, %617
  %619 = udiv i32 %618, 131072
  %620 = getelementptr inbounds [131072 x [128 x float]], ptr %arg4, i32 0, i32 %618, i32 %613
  %621 = load float, ptr %620, align 4, !invariant.load !98
  %622 = mul nuw nsw i32 %613, 1
  %623 = add nuw nsw i32 0, %622
  %624 = udiv i32 %623, 128
  %625 = mul nuw nsw i32 %618, 1
  %626 = add nuw nsw i32 0, %625
  %627 = urem i32 %626, 16
  %628 = udiv i32 %626, 16
  %629 = udiv i32 %628, 8192
  %630 = add i32 %628, 0
  %631 = add i32 %627, 0
  %632 = add i32 %623, 0
  %633 = mul nuw nsw i32 %632, 1
  %634 = add nuw nsw i32 0, %633
  %635 = udiv i32 %634, 168
  %636 = mul nuw nsw i32 %631, 1
  %637 = add nuw nsw i32 0, %636
  %638 = mul nuw nsw i32 %630, 16
  %639 = add nuw nsw i32 %637, %638
  %640 = udiv i32 %639, 131072
  %641 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %639, i32 %634
  %642 = load float, ptr %641, align 4, !invariant.load !98
  %add.2068 = fadd float %621, %642
  %643 = add i32 %607, 0
  %644 = add i32 %611, 0
  %645 = add i32 %609, 0
  %646 = mul nuw nsw i32 %645, 1
  %647 = add nuw nsw i32 0, %646
  %648 = udiv i32 %647, 168
  %649 = mul nuw nsw i32 %644, 1
  %650 = add nuw nsw i32 0, %649
  %651 = mul nuw nsw i32 %643, 100
  %652 = add nuw nsw i32 %650, %651
  %653 = udiv i32 %652, 819200
  %654 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %652, i32 %647
  %655 = load float, ptr %654, align 4, !invariant.load !98
  %add.2469 = fadd float %add.2068, %655
  br label %concatenate.26.merge66

concat_index_from_operand_id170:                  ; preds = %concatenate.pivot.16.73
  %656 = phi i32 [ 16, %concatenate.pivot.16.73 ]
  %657 = sub nsw i32 %608, %656
  %658 = add i32 %607, 0
  %659 = add i32 %657, 16
  %660 = add i32 %609, 0
  %661 = mul nuw nsw i32 %660, 1
  %662 = add nuw nsw i32 0, %661
  %663 = udiv i32 %662, 168
  %664 = mul nuw nsw i32 %659, 1
  %665 = add nuw nsw i32 0, %664
  %666 = mul nuw nsw i32 %658, 100
  %667 = add nuw nsw i32 %665, %666
  %668 = udiv i32 %667, 819200
  %669 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %667, i32 %662
  %670 = load float, ptr %669, align 4, !invariant.load !98
  br label %concatenate.26.merge66

concatenate.pivot.16.71:                          ; preds = %concatenate.26.merge49
  %671 = icmp ult i32 %608, 16
  br i1 %671, label %concatenate.pivot.0.72, label %concatenate.pivot.16.73

concatenate.pivot.0.72:                           ; preds = %concatenate.pivot.16.71
  br label %concat_index_from_operand_id067

concatenate.pivot.16.73:                          ; preds = %concatenate.pivot.16.71
  br label %concat_index_from_operand_id170

concatenate.26.merge66:                           ; preds = %concat_index_from_operand_id170, %concat_index_from_operand_id067
  %672 = phi float [ %add.2469, %concat_index_from_operand_id067 ], [ %670, %concat_index_from_operand_id170 ]
  %add.2874 = fadd float %606, %672
  %multiply.2975 = fmul float %593, %add.2874
  %subtract.3076 = fsub float %592, %multiply.2975
  %673 = insertvalue { float, float, float, float } undef, float %subtract.3076, 0
  %674 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %675 = load float, ptr %674, align 4, !invariant.load !98
  %676 = load float, ptr %arg1, align 4, !invariant.load !98
  %677 = add i32 %22, 0
  %678 = add i32 %21, 0
  %679 = add i32 %19, 0
  %680 = mul nuw nsw i32 %679, 1
  %681 = add nuw nsw i32 0, %680
  %682 = udiv i32 %681, 200
  %683 = mul nuw nsw i32 %678, 1
  %684 = add nuw nsw i32 0, %683
  %685 = mul nuw nsw i32 %677, 100
  %686 = add nuw nsw i32 %684, %685
  %687 = udiv i32 %686, 819200
  %688 = getelementptr inbounds [819200 x [200 x float]], ptr %arg2, i32 0, i32 %686, i32 %681
  %689 = load float, ptr %688, align 4, !invariant.load !98
  %690 = add i32 %22, 0
  %691 = add i32 %21, 0
  %692 = add i32 %19, 0
  br label %concatenate.pivot.16.82

concat_index_from_operand_id078:                  ; preds = %concatenate.pivot.0.83
  %693 = phi i32 [ 0, %concatenate.pivot.0.83 ]
  %694 = sub nsw i32 %691, %693
  %695 = mul nuw nsw i32 %692, 1
  %696 = add nuw nsw i32 0, %695
  %697 = udiv i32 %696, 128
  %698 = mul nuw nsw i32 %694, 1
  %699 = add nuw nsw i32 0, %698
  %700 = mul nuw nsw i32 %690, 16
  %701 = add nuw nsw i32 %699, %700
  %702 = udiv i32 %701, 131072
  %703 = getelementptr inbounds [131072 x [128 x float]], ptr %arg4, i32 0, i32 %701, i32 %696
  %704 = load float, ptr %703, align 4, !invariant.load !98
  %705 = mul nuw nsw i32 %696, 1
  %706 = add nuw nsw i32 0, %705
  %707 = udiv i32 %706, 128
  %708 = mul nuw nsw i32 %701, 1
  %709 = add nuw nsw i32 0, %708
  %710 = urem i32 %709, 16
  %711 = udiv i32 %709, 16
  %712 = udiv i32 %711, 8192
  %713 = add i32 %711, 0
  %714 = add i32 %710, 0
  %715 = add i32 %706, 0
  %716 = mul nuw nsw i32 %715, 1
  %717 = add nuw nsw i32 0, %716
  %718 = udiv i32 %717, 168
  %719 = mul nuw nsw i32 %714, 1
  %720 = add nuw nsw i32 0, %719
  %721 = mul nuw nsw i32 %713, 16
  %722 = add nuw nsw i32 %720, %721
  %723 = udiv i32 %722, 131072
  %724 = getelementptr inbounds [131072 x [168 x float]], ptr %arg5, i32 0, i32 %722, i32 %717
  %725 = load float, ptr %724, align 4, !invariant.load !98
  %add.2079 = fadd float %704, %725
  %726 = add i32 %690, 0
  %727 = add i32 %694, 0
  %728 = add i32 %692, 0
  %729 = mul nuw nsw i32 %728, 1
  %730 = add nuw nsw i32 0, %729
  %731 = udiv i32 %730, 168
  %732 = mul nuw nsw i32 %727, 1
  %733 = add nuw nsw i32 0, %732
  %734 = mul nuw nsw i32 %726, 100
  %735 = add nuw nsw i32 %733, %734
  %736 = udiv i32 %735, 819200
  %737 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %735, i32 %730
  %738 = load float, ptr %737, align 4, !invariant.load !98
  %add.2480 = fadd float %add.2079, %738
  br label %concatenate.26.merge77

concat_index_from_operand_id181:                  ; preds = %concatenate.pivot.16.84
  %739 = phi i32 [ 16, %concatenate.pivot.16.84 ]
  %740 = sub nsw i32 %691, %739
  %741 = add i32 %690, 0
  %742 = add i32 %740, 16
  %743 = add i32 %692, 0
  %744 = mul nuw nsw i32 %743, 1
  %745 = add nuw nsw i32 0, %744
  %746 = udiv i32 %745, 168
  %747 = mul nuw nsw i32 %742, 1
  %748 = add nuw nsw i32 0, %747
  %749 = mul nuw nsw i32 %741, 100
  %750 = add nuw nsw i32 %748, %749
  %751 = udiv i32 %750, 819200
  %752 = getelementptr inbounds [819200 x [168 x float]], ptr %arg3, i32 0, i32 %750, i32 %745
  %753 = load float, ptr %752, align 4, !invariant.load !98
  br label %concatenate.26.merge77

concatenate.pivot.16.82:                          ; preds = %concatenate.26.merge66
  %754 = icmp ult i32 %691, 16
  br i1 %754, label %concatenate.pivot.0.83, label %concatenate.pivot.16.84

concatenate.pivot.0.83:                           ; preds = %concatenate.pivot.16.82
  br label %concat_index_from_operand_id078

concatenate.pivot.16.84:                          ; preds = %concatenate.pivot.16.82
  br label %concat_index_from_operand_id181

concatenate.26.merge77:                           ; preds = %concat_index_from_operand_id181, %concat_index_from_operand_id078
  %755 = phi float [ %add.2480, %concat_index_from_operand_id078 ], [ %753, %concat_index_from_operand_id181 ]
  %add.3385 = fadd float %689, %755
  %multiply.3486 = fmul float %676, %add.3385
  %subtract.3587 = fsub float %675, %multiply.3486
  %756 = insertvalue { float, float, float, float } %673, float %subtract.3587, 1
  %757 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %758 = load float, ptr %757, align 4, !invariant.load !98
  %759 = load float, ptr %arg1, align 4, !invariant.load !98
  %760 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  %761 = load float, ptr %760, align 4, !invariant.load !98
  %762 = getelementptr inbounds float, ptr %arg9, i32 %linear_index3
  %763 = load float, ptr %762, align 4, !invariant.load !98
  %add.3688 = fadd float %761, %763
  %multiply.3789 = fmul float %759, %add.3688
  %subtract.3890 = fsub float %758, %multiply.3789
  %764 = insertvalue { float, float, float, float } %756, float %subtract.3890, 2
  %765 = getelementptr inbounds float, ptr %arg10, i32 %linear_index3
  %766 = load float, ptr %765, align 4, !invariant.load !98
  %767 = getelementptr inbounds float, ptr %arg11, i32 %linear_index3
  %768 = load float, ptr %767, align 4, !invariant.load !98
  %769 = getelementptr inbounds float, ptr %arg12, i32 %linear_index3
  %770 = load float, ptr %769, align 4, !invariant.load !98
  %add.3991 = fadd float %768, %770
  %multiply.4092 = fmul float %759, %add.3991
  %subtract.4193 = fsub float %766, %multiply.4092
  %771 = insertvalue { float, float, float, float } %764, float %subtract.4193, 3
  %772 = extractvalue { float, float, float, float } %771, 0
  %773 = getelementptr inbounds float, ptr %arg13, i32 %linear_index3
  store float %772, ptr %773, align 4
  %774 = extractvalue { float, float, float, float } %771, 1
  %775 = getelementptr inbounds float, ptr %arg14, i32 %linear_index3
  store float %774, ptr %775, align 4
  %776 = extractvalue { float, float, float, float } %771, 2
  %777 = getelementptr inbounds float, ptr %arg15, i32 %linear_index3
  store float %776, ptr %777, align 4
  %778 = extractvalue { float, float, float, float } %771, 3
  %779 = getelementptr inbounds float, ptr %arg16, i32 %linear_index3
  store float %778, ptr %779, align 4
  br label %fusion_1.in_bounds-after
}

define void @fusion_55(ptr noalias align 16 dereferenceable(209715200) %arg0, ptr noalias align 16 dereferenceable(209715200) %arg1, ptr noalias align 16 dereferenceable(209715200) %arg2, ptr noalias align 16 dereferenceable(4) %arg3, ptr noalias align 128 dereferenceable(655360000) %arg4, ptr noalias align 128 dereferenceable(209715200) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !193
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !97
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 13107200
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 6400
  %5 = udiv i32 %linear_index_base, 6400
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 6400
  %8 = udiv i32 %linear_index1, 6400
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 6400
  %11 = udiv i32 %linear_index2, 6400
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 6400
  %14 = udiv i32 %linear_index3, 6400
  %15 = icmp ult i32 %linear_index_base, 52428800
  br i1 %15, label %fusion_55.in_bounds-true, label %fusion_55.in_bounds-after

fusion_55.in_bounds-after:                        ; preds = %fusion_55.in_bounds-true, %entry
  ret void

fusion_55.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !98
  %18 = mul nuw nsw i32 %4, 1
  %19 = add nuw nsw i32 0, %18
  %20 = urem i32 %19, 64
  %21 = udiv i32 %19, 64
  %22 = udiv i32 %21, 100
  %23 = mul nuw nsw i32 %5, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 8192
  %26 = load float, ptr %arg3, align 4, !invariant.load !98
  %27 = add i32 %24, 0
  %28 = add i32 %21, 0
  %29 = add i32 %20, 136
  %30 = mul nuw nsw i32 %29, 1
  %31 = add nuw nsw i32 0, %30
  %32 = udiv i32 %31, 200
  %33 = mul nuw nsw i32 %28, 1
  %34 = add nuw nsw i32 0, %33
  %35 = mul nuw nsw i32 %27, 100
  %36 = add nuw nsw i32 %34, %35
  %37 = udiv i32 %36, 819200
  %38 = getelementptr inbounds [819200 x [200 x float]], ptr %arg4, i32 0, i32 %36, i32 %31
  %39 = load float, ptr %38, align 4, !invariant.load !98
  %40 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %41 = load float, ptr %40, align 4, !invariant.load !98
  %add.9 = fadd float %39, %41
  %42 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %43 = load float, ptr %42, align 4, !invariant.load !98
  %add.10 = fadd float %add.9, %43
  %multiply.11 = fmul float %26, %add.10
  %subtract.13 = fsub float %17, %multiply.11
  %44 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %subtract.13, ptr %44, align 4
  %45 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %46 = load float, ptr %45, align 4, !invariant.load !98
  %47 = mul nuw nsw i32 %7, 1
  %48 = add nuw nsw i32 0, %47
  %49 = urem i32 %48, 64
  %50 = udiv i32 %48, 64
  %51 = udiv i32 %50, 100
  %52 = mul nuw nsw i32 %8, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 8192
  %55 = load float, ptr %arg3, align 4, !invariant.load !98
  %56 = add i32 %53, 0
  %57 = add i32 %50, 0
  %58 = add i32 %49, 136
  %59 = mul nuw nsw i32 %58, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 200
  %62 = mul nuw nsw i32 %57, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %56, 100
  %65 = add nuw nsw i32 %63, %64
  %66 = udiv i32 %65, 819200
  %67 = getelementptr inbounds [819200 x [200 x float]], ptr %arg4, i32 0, i32 %65, i32 %60
  %68 = load float, ptr %67, align 4, !invariant.load !98
  %69 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %70 = load float, ptr %69, align 4, !invariant.load !98
  %add.91 = fadd float %68, %70
  %71 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %72 = load float, ptr %71, align 4, !invariant.load !98
  %add.102 = fadd float %add.91, %72
  %multiply.113 = fmul float %55, %add.102
  %subtract.134 = fsub float %46, %multiply.113
  %73 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %subtract.134, ptr %73, align 4
  %74 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %75 = load float, ptr %74, align 4, !invariant.load !98
  %76 = mul nuw nsw i32 %10, 1
  %77 = add nuw nsw i32 0, %76
  %78 = urem i32 %77, 64
  %79 = udiv i32 %77, 64
  %80 = udiv i32 %79, 100
  %81 = mul nuw nsw i32 %11, 1
  %82 = add nuw nsw i32 0, %81
  %83 = udiv i32 %82, 8192
  %84 = load float, ptr %arg3, align 4, !invariant.load !98
  %85 = add i32 %82, 0
  %86 = add i32 %79, 0
  %87 = add i32 %78, 136
  %88 = mul nuw nsw i32 %87, 1
  %89 = add nuw nsw i32 0, %88
  %90 = udiv i32 %89, 200
  %91 = mul nuw nsw i32 %86, 1
  %92 = add nuw nsw i32 0, %91
  %93 = mul nuw nsw i32 %85, 100
  %94 = add nuw nsw i32 %92, %93
  %95 = udiv i32 %94, 819200
  %96 = getelementptr inbounds [819200 x [200 x float]], ptr %arg4, i32 0, i32 %94, i32 %89
  %97 = load float, ptr %96, align 4, !invariant.load !98
  %98 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %99 = load float, ptr %98, align 4, !invariant.load !98
  %add.95 = fadd float %97, %99
  %100 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %101 = load float, ptr %100, align 4, !invariant.load !98
  %add.106 = fadd float %add.95, %101
  %multiply.117 = fmul float %84, %add.106
  %subtract.138 = fsub float %75, %multiply.117
  %102 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %subtract.138, ptr %102, align 4
  %103 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %104 = load float, ptr %103, align 4, !invariant.load !98
  %105 = mul nuw nsw i32 %13, 1
  %106 = add nuw nsw i32 0, %105
  %107 = urem i32 %106, 64
  %108 = udiv i32 %106, 64
  %109 = udiv i32 %108, 100
  %110 = mul nuw nsw i32 %14, 1
  %111 = add nuw nsw i32 0, %110
  %112 = udiv i32 %111, 8192
  %113 = load float, ptr %arg3, align 4, !invariant.load !98
  %114 = add i32 %111, 0
  %115 = add i32 %108, 0
  %116 = add i32 %107, 136
  %117 = mul nuw nsw i32 %116, 1
  %118 = add nuw nsw i32 0, %117
  %119 = udiv i32 %118, 200
  %120 = mul nuw nsw i32 %115, 1
  %121 = add nuw nsw i32 0, %120
  %122 = mul nuw nsw i32 %114, 100
  %123 = add nuw nsw i32 %121, %122
  %124 = udiv i32 %123, 819200
  %125 = getelementptr inbounds [819200 x [200 x float]], ptr %arg4, i32 0, i32 %123, i32 %118
  %126 = load float, ptr %125, align 4, !invariant.load !98
  %127 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %128 = load float, ptr %127, align 4, !invariant.load !98
  %add.99 = fadd float %126, %128
  %129 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %130 = load float, ptr %129, align 4, !invariant.load !98
  %add.1010 = fadd float %add.99, %130
  %multiply.1111 = fmul float %113, %add.1010
  %subtract.1312 = fsub float %104, %multiply.1111
  %131 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %subtract.1312, ptr %131, align 4
  br label %fusion_55.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95}

!0 = !{ptr @fusion_98, !"kernel", i32 1}
!1 = !{ptr @fusion_98, !"reqntidx", i32 256}
!2 = !{ptr @fusion_21, !"kernel", i32 1}
!3 = !{ptr @fusion_21, !"reqntidx", i32 128}
!4 = !{ptr @fusion_97, !"kernel", i32 1}
!5 = !{ptr @fusion_97, !"reqntidx", i32 96}
!6 = !{ptr @fusion_93, !"kernel", i32 1}
!7 = !{ptr @fusion_93, !"reqntidx", i32 96}
!8 = !{ptr @fusion_92, !"kernel", i32 1}
!9 = !{ptr @fusion_92, !"reqntidx", i32 256}
!10 = !{ptr @fusion_95, !"kernel", i32 1}
!11 = !{ptr @fusion_95, !"reqntidx", i32 1024}
!12 = !{ptr @fusion_52, !"kernel", i32 1}
!13 = !{ptr @fusion_52, !"reqntidx", i32 32}
!14 = !{ptr @fusion_84, !"kernel", i32 1}
!15 = !{ptr @fusion_84, !"reqntidx", i32 96}
!16 = !{ptr @fusion_78, !"kernel", i32 1}
!17 = !{ptr @fusion_78, !"reqntidx", i32 1024}
!18 = !{ptr @fusion_77, !"kernel", i32 1}
!19 = !{ptr @fusion_77, !"reqntidx", i32 4}
!20 = !{ptr @fusion_91, !"kernel", i32 1}
!21 = !{ptr @fusion_91, !"reqntidx", i32 1024}
!22 = !{ptr @fusion_90, !"kernel", i32 1}
!23 = !{ptr @fusion_90, !"reqntidx", i32 4}
!24 = !{ptr @fusion_86, !"kernel", i32 1}
!25 = !{ptr @fusion_86, !"reqntidx", i32 96}
!26 = !{ptr @fusion_85, !"kernel", i32 1}
!27 = !{ptr @fusion_85, !"reqntidx", i32 256}
!28 = !{ptr @fusion_48, !"kernel", i32 1}
!29 = !{ptr @fusion_48, !"reqntidx", i32 1024}
!30 = !{ptr @fusion_101, !"kernel", i32 1}
!31 = !{ptr @fusion_101, !"reqntidx", i32 1024}
!32 = !{ptr @fusion_88, !"kernel", i32 1}
!33 = !{ptr @fusion_88, !"reqntidx", i32 168}
!34 = !{ptr @fusion_46, !"kernel", i32 1}
!35 = !{ptr @fusion_46, !"reqntidx", i32 1024}
!36 = !{ptr @fusion_44, !"kernel", i32 1}
!37 = !{ptr @fusion_44, !"reqntidx", i32 1024}
!38 = !{ptr @fusion_38, !"kernel", i32 1}
!39 = !{ptr @fusion_38, !"reqntidx", i32 1024}
!40 = !{ptr @reduce_541, !"kernel", i32 1}
!41 = !{ptr @reduce_541, !"reqntidx", i32 1024}
!42 = !{ptr @fusion_37, !"kernel", i32 1}
!43 = !{ptr @fusion_37, !"reqntidx", i32 128}
!44 = !{ptr @fusion_36, !"kernel", i32 1}
!45 = !{ptr @fusion_36, !"reqntidx", i32 1024}
!46 = !{ptr @fusion_104, !"kernel", i32 1}
!47 = !{ptr @fusion_104, !"reqntidx", i32 1024}
!48 = !{ptr @fusion_43, !"kernel", i32 1}
!49 = !{ptr @fusion_43, !"reqntidx", i32 256}
!50 = !{ptr @fusion_96, !"kernel", i32 1}
!51 = !{ptr @fusion_96, !"reqntidx", i32 1024}
!52 = !{ptr @fusion_28, !"kernel", i32 1}
!53 = !{ptr @fusion_28, !"reqntidx", i32 256}
!54 = !{ptr @fusion_27, !"kernel", i32 1}
!55 = !{ptr @fusion_27, !"reqntidx", i32 256}
!56 = !{ptr @fusion_26, !"kernel", i32 1}
!57 = !{ptr @fusion_26, !"reqntidx", i32 1024}
!58 = !{ptr @fusion_25, !"kernel", i32 1}
!59 = !{ptr @fusion_25, !"reqntidx", i32 96}
!60 = !{ptr @fusion_24, !"kernel", i32 1}
!61 = !{ptr @fusion_24, !"reqntidx", i32 256}
!62 = !{ptr @fusion_23, !"kernel", i32 1}
!63 = !{ptr @fusion_23, !"reqntidx", i32 1024}
!64 = !{ptr @reduce_615, !"kernel", i32 1}
!65 = !{ptr @reduce_615, !"reqntidx", i32 1024}
!66 = !{ptr @fusion_22, !"kernel", i32 1}
!67 = !{ptr @fusion_22, !"reqntidx", i32 16}
!68 = !{ptr @fusion_19, !"kernel", i32 1}
!69 = !{ptr @fusion_19, !"reqntidx", i32 512}
!70 = !{ptr @fusion_18, !"kernel", i32 1}
!71 = !{ptr @fusion_18, !"reqntidx", i32 256}
!72 = !{ptr @fusion_15, !"kernel", i32 1}
!73 = !{ptr @fusion_15, !"reqntidx", i32 256}
!74 = !{ptr @fusion_16, !"kernel", i32 1}
!75 = !{ptr @fusion_16, !"reqntidx", i32 1024}
!76 = !{ptr @fusion_10, !"kernel", i32 1}
!77 = !{ptr @fusion_10, !"reqntidx", i32 256}
!78 = !{ptr @fusion_11, !"kernel", i32 1}
!79 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!80 = !{ptr @fusion_60, !"kernel", i32 1}
!81 = !{ptr @fusion_60, !"reqntidx", i32 1024}
!82 = !{ptr @fusion_59, !"kernel", i32 1}
!83 = !{ptr @fusion_59, !"reqntidx", i32 1024}
!84 = !{ptr @fusion_56, !"kernel", i32 1}
!85 = !{ptr @fusion_56, !"reqntidx", i32 1024}
!86 = !{ptr @fusion_57, !"kernel", i32 1}
!87 = !{ptr @fusion_57, !"reqntidx", i32 256}
!88 = !{ptr @fusion_54, !"kernel", i32 1}
!89 = !{ptr @fusion_54, !"reqntidx", i32 256}
!90 = !{ptr @fusion, !"kernel", i32 1}
!91 = !{ptr @fusion, !"reqntidx", i32 256}
!92 = !{ptr @fusion_1, !"kernel", i32 1}
!93 = !{ptr @fusion_1, !"reqntidx", i32 256}
!94 = !{ptr @fusion_55, !"kernel", i32 1}
!95 = !{ptr @fusion_55, !"reqntidx", i32 256}
!96 = !{i32 0, i32 2048}
!97 = !{i32 0, i32 256}
!98 = !{}
!99 = !{i32 0, i32 128}
!100 = !{i32 0, i32 8192}
!101 = distinct !{!101, !102, !103}
!102 = !{!"llvm.loop.vectorize.enable", i1 false}
!103 = !{!"llvm.loop.unroll.full"}
!104 = distinct !{!104, !102}
!105 = distinct !{!105, !102, !103}
!106 = distinct !{!106, !102}
!107 = !{i32 0, i32 1}
!108 = !{i32 0, i32 96}
!109 = !{i32 0, i32 1092267}
!110 = distinct !{!110, !102}
!111 = distinct !{!111, !102, !103}
!112 = distinct !{!112, !102, !103}
!113 = !{i32 0, i32 10923}
!114 = distinct !{!114, !102}
!115 = distinct !{!115, !102, !103}
!116 = distinct !{!116, !102, !103}
!117 = !{i32 0, i32 3200}
!118 = !{i32 0, i32 10}
!119 = !{i32 0, i32 1024}
!120 = !{i32 0, i32 32}
!121 = !{i32 0, i32 131072}
!122 = distinct !{!122, !102}
!123 = distinct !{!123, !102, !103}
!124 = distinct !{!124, !102, !103}
!125 = distinct !{!125, !102}
!126 = distinct !{!126, !102, !103}
!127 = distinct !{!127, !102, !103}
!128 = !{i32 0, i32 4}
!129 = !{i32 0, i32 64}
!130 = distinct !{!130, !102, !103}
!131 = distinct !{!131, !102}
!132 = distinct !{!132, !102, !103}
!133 = distinct !{!133, !102}
!134 = distinct !{!134, !102, !103}
!135 = distinct !{!135, !102}
!136 = distinct !{!136, !102, !103}
!137 = distinct !{!137, !102}
!138 = distinct !{!138, !102, !103}
!139 = distinct !{!139, !102}
!140 = !{i32 0, i32 34134}
!141 = distinct !{!141, !102}
!142 = distinct !{!142, !102, !103}
!143 = distinct !{!143, !102, !103}
!144 = !{i32 0, i32 800}
!145 = !{i32 0, i32 1536}
!146 = distinct !{!146, !102, !103}
!147 = distinct !{!147, !102}
!148 = !{i32 0, i32 3}
!149 = !{i32 0, i32 6}
!150 = distinct !{!150, !102, !103}
!151 = distinct !{!151, !102}
!152 = distinct !{!152, !102, !103}
!153 = distinct !{!153, !102}
!154 = distinct !{!154, !102, !103}
!155 = distinct !{!155, !102}
!156 = !{i32 0, i32 168}
!157 = !{i32 0, i32 42}
!158 = distinct !{!158, !102, !103}
!159 = distinct !{!159, !102}
!160 = !{i32 0, i32 512}
!161 = distinct !{!161, !102, !103}
!162 = distinct !{!162, !102}
!163 = !{i32 0, i32 2}
!164 = distinct !{!164, !102, !103}
!165 = distinct !{!165, !102}
!166 = distinct !{!166, !102, !103}
!167 = distinct !{!167, !102}
!168 = distinct !{!168, !102, !103}
!169 = distinct !{!169, !102}
!170 = distinct !{!170, !102, !103}
!171 = distinct !{!171, !102}
!172 = distinct !{!172, !102, !103}
!173 = distinct !{!173, !102}
!174 = !{i32 0, i32 16384}
!175 = !{i32 0, i32 21}
!176 = !{i32 0, i32 43691}
!177 = distinct !{!177, !102}
!178 = distinct !{!178, !102, !103}
!179 = distinct !{!179, !102, !103}
!180 = !{i32 0, i32 4096}
!181 = distinct !{!181, !102, !103}
!182 = distinct !{!182, !102}
!183 = distinct !{!183, !102, !103}
!184 = distinct !{!184, !102}
!185 = !{i32 0, i32 16}
!186 = !{i32 0, i32 8}
!187 = !{i32 0, i32 32768}
!188 = distinct !{!188, !102, !103}
!189 = distinct !{!189, !102}
!190 = !{i32 0, i32 50}
!191 = !{i32 0, i32 242}
!192 = !{i32 0, i32 6400}
!193 = !{i32 0, i32 51200}
