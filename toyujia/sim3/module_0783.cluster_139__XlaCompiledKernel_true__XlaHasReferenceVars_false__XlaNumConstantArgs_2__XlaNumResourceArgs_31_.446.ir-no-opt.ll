target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@3 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache1 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef
@4 = private unnamed_addr constant [4 x i8] zeroinitializer
@5 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache2 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@7 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@8 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache3 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache4 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@9 = private unnamed_addr constant [4 x i8] zeroinitializer
@10 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache5 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@buffer_for_constant_4 = constant [64 x i8] c"\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128
@shared_cache6 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache7 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache8 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache9 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache10 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@shared_cache11 = private addrspace(3) global [1 x [1 x [32 x [33 x float]]]] undef

define void @fusion_20(ptr noalias align 16 dereferenceable(4456448) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 128 dereferenceable(557056) %arg2) {
entry:
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !60
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !61
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !62
  %5 = urem i32 %3, 8
  %6 = udiv i32 %3, 8
  %7 = mul i32 %4, 12
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 139264
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 8
  %thread_id.y = udiv i32 %5, 8
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 139264
  %15 = udiv i32 %8, 139264
  %16 = icmp eq i32 %14, 139263
  %tile_bound = select i1 %16, i32 1, i32 1
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 8, i32 128
  %tile_origin.0 = mul i32 %15, 1
  %tile_origin.1 = mul i32 %14, 1
  %tile_origin.2 = mul i32 %12, 128
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
  %20 = icmp eq i32 128, %tile_bound1
  br i1 %20, label %is_full_tile-true, label %is_full_tile-false

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !63

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 4, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 2, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 1, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %27 = udiv i32 %thread_id.x, 32
  %28 = and i32 %thread_id.x, 7
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

is_full_tile-true:                                ; preds = %y_in_tile.loop_body
  %30 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %tile_loop.loop_body, %is_full_tile-true
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %31 = icmp uge i32 %tile_loop.indvar, 16
  br i1 %31, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %32 = icmp eq i32 %tile_loop.indvar, 0
  %33 = mul i32 %tile_loop.indvar, 8
  %34 = add i32 %33, 0
  %x_loc = add i32 %34, %30
  %35 = add i32 %tile_origin.1, %y_in_tile.indvar
  %36 = add i32 %tile_origin.2, %x_loc
  %37 = mul nuw nsw i32 %36, 1
  %38 = add nuw nsw i32 0, %37
  %39 = mul nuw nsw i32 %35, 8
  %40 = add nuw nsw i32 %38, %39
  %41 = mul nuw nsw i32 %tile_origin.0, 1114112
  %42 = add nuw nsw i32 %40, %41
  %43 = udiv i32 %42, 1
  %44 = urem i32 %43, 8
  %45 = udiv i32 %42, 8
  %46 = urem i32 %45, 17
  %47 = udiv i32 %42, 136
  %48 = mul nuw nsw i32 %44, 1
  %49 = add nuw nsw i32 0, %48
  %50 = mul nuw nsw i32 %46, 8
  %51 = add nuw nsw i32 %49, %50
  %52 = udiv i32 %51, 136
  %53 = mul nuw nsw i32 %47, 1
  %54 = add nuw nsw i32 0, %53
  %55 = udiv i32 %54, 8192
  %56 = add i32 %54, 0
  %57 = add i32 %51, 832
  %Arg_1.2 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %56, i32 %57
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !65
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %42
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.5, ptr %reduction_input_address, align 4
  %58 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %58, ptr %reduction_input_address, ptr %return_buffer)
  %59 = load float, ptr %return_buffer, align 4
  store float %59, ptr %58, align 4
  br label %tile_loop.loop_header, !llvm.loop !66

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %60 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %61 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %61, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %62 = icmp eq i32 %tile_loop.indvar9, 0
  %63 = mul i32 %tile_loop.indvar9, 8
  %64 = add i32 %63, 0
  %x_loc11 = add i32 %64, %60
  %65 = add i32 %tile_origin.1, %y_in_tile.indvar
  %66 = add i32 %tile_origin.2, %x_loc11
  %67 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %67, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !68

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %68 = mul nuw nsw i32 %66, 1
  %69 = add nuw nsw i32 0, %68
  %70 = mul nuw nsw i32 %65, 8
  %71 = add nuw nsw i32 %69, %70
  %72 = mul nuw nsw i32 %tile_origin.0, 1114112
  %73 = add nuw nsw i32 %71, %72
  %74 = udiv i32 %73, 1
  %75 = urem i32 %74, 8
  %76 = udiv i32 %73, 8
  %77 = urem i32 %76, 17
  %78 = udiv i32 %73, 136
  %79 = mul nuw nsw i32 %75, 1
  %80 = add nuw nsw i32 0, %79
  %81 = mul nuw nsw i32 %77, 8
  %82 = add nuw nsw i32 %80, %81
  %83 = udiv i32 %82, 136
  %84 = mul nuw nsw i32 %78, 1
  %85 = add nuw nsw i32 0, %84
  %86 = udiv i32 %85, 8192
  %87 = add i32 %85, 0
  %88 = add i32 %82, 832
  %Arg_1.212 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %87, i32 %88
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !65
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %73
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !65
  %multiply.516 = fmul float %Arg_1.213, %Arg_0.115
  store float %multiply.516, ptr %reduction_input_address, align 4
  %89 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %89, ptr %reduction_input_address, ptr %return_buffer17)
  %90 = load float, ptr %return_buffer17, align 4
  store float %90, ptr %89, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %91 = mul i32 %thread_id.x, 1
  %92 = add i32 %tile_origin.1, %thread_id.y
  %93 = add i32 %tile_origin.2, %91
  %94 = add i32 %93, 0
  %95 = udiv i32 %92, 1
  %96 = urem i32 %95, 17
  %97 = udiv i32 %92, 17
  %output_element_address = getelementptr inbounds [8192 x [17 x float]], ptr %arg2, i32 0, i32 %97, i32 %96
  %output = load float, ptr %current_output, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

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

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #1

define void @fusion_21(ptr noalias align 16 dereferenceable(27262976) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 128 dereferenceable(425984) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !60
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !61
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !69
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 106496
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 106496
  %15 = udiv i32 %8, 106496
  %16 = icmp eq i32 %14, 106495
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit5, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !70

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_7__1(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
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
  %43 = mul nuw nsw i32 %39, 64
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 6815744
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 13
  %51 = udiv i32 %46, 832
  %52 = mul nuw nsw i32 %48, 1
  %53 = add nuw nsw i32 0, %52
  %54 = mul nuw nsw i32 %50, 64
  %55 = add nuw nsw i32 %53, %54
  %56 = udiv i32 %55, 832
  %57 = mul nuw nsw i32 %51, 1
  %58 = add nuw nsw i32 0, %57
  %59 = udiv i32 %58, 8192
  %60 = add i32 %58, 0
  %61 = add i32 %55, 0
  %Arg_1.2 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %60, i32 %61
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !65
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.5, ptr %reduction_input_address, align 4
  %62 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7__1(ptr %62, ptr %reduction_input_address, ptr %return_buffer)
  %63 = load float, ptr %return_buffer, align 4
  store float %63, ptr %62, align 4
  br label %tile_loop.loop_header, !llvm.loop !71

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %64 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %65 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %65, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %66 = icmp eq i32 %tile_loop.indvar9, 0
  %67 = mul i32 %tile_loop.indvar9, 32
  %68 = add i32 %67, 0
  %x_loc11 = add i32 %68, %64
  %69 = add i32 %tile_origin.1, %y_in_tile.indvar
  %70 = add i32 %tile_origin.2, %x_loc11
  %71 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %71, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !72

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %72 = mul nuw nsw i32 %70, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %69, 64
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 6815744
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 13
  %82 = udiv i32 %77, 832
  %83 = mul nuw nsw i32 %79, 1
  %84 = add nuw nsw i32 0, %83
  %85 = mul nuw nsw i32 %81, 64
  %86 = add nuw nsw i32 %84, %85
  %87 = udiv i32 %86, 832
  %88 = mul nuw nsw i32 %82, 1
  %89 = add nuw nsw i32 0, %88
  %90 = udiv i32 %89, 8192
  %91 = add i32 %89, 0
  %92 = add i32 %86, 0
  %Arg_1.212 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %91, i32 %92
  %Arg_1.213 = load float, ptr %Arg_1.212, align 4, !invariant.load !65
  %Arg_0.114 = getelementptr inbounds float, ptr %arg0, i32 %77
  %Arg_0.115 = load float, ptr %Arg_0.114, align 4, !invariant.load !65
  %multiply.516 = fmul float %Arg_1.213, %Arg_0.115
  store float %multiply.516, ptr %reduction_input_address, align 4
  %93 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7__1(ptr %93, ptr %reduction_input_address, ptr %return_buffer17)
  %94 = load float, ptr %return_buffer17, align 4
  store float %94, ptr %93, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %95 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %96 = addrspacecast ptr addrspace(3) %95 to ptr
  %97 = load float, ptr %current_output, align 4
  store float %97, ptr %96, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %98 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %99 = addrspacecast ptr addrspace(3) %98 to ptr
  store float %region_0_12_constant_6, ptr %initial_value_addr, align 4
  %100 = icmp ult i32 %thread_id.x, 1
  %101 = select i1 %100, ptr %99, ptr %initial_value_addr
  %102 = icmp eq i32 %thread_id.x, 0
  br i1 %102, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %103 = mul i32 %thread_id.x, 1
  %104 = add i32 %tile_origin.1, %thread_id.y
  %105 = add i32 %tile_origin.2, %103
  %106 = add i32 %105, 0
  %107 = udiv i32 %104, 1
  %108 = urem i32 %107, 13
  %109 = udiv i32 %104, 13
  %output_element_address = getelementptr inbounds [8192 x [13 x float]], ptr %arg2, i32 0, i32 %109, i32 %108
  %output = load float, ptr %101, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_7__1(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
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

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #2

define void @fusion_18(ptr noalias align 16 dereferenceable(983040) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(425984) %arg2, ptr noalias align 128 dereferenceable(557056) %arg3, ptr noalias align 128 dereferenceable(7680) %arg4, ptr noalias align 128 dereferenceable(983040) %arg5) {
entry:
  %return_buffer42 = alloca float, align 4
  %result_from_other_lane40 = alloca float, align 4
  %return_buffer39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %result_from_other_lane34 = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
  %return_buffer30 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !60
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_21_constant_14 = load float, ptr @3, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_21_constant_14, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
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
  %tile_bound1 = select i1 %17, i32 30, i32 32
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

x_in_tile-after:                                  ; preds = %concatenate.5.merge9, %tile_loop.loop_body
  br label %tile_loop.loop_header, !llvm.loop !75

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !76

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %28 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %29 = load float, ptr %current_output, align 4
  store float %29, ptr %28, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [1 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache1, i32 0, i32 %6, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %30 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result29 = load float, ptr %30, align 4
  %31 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result29, i32 16, i32 31)
  store float %31, ptr %result_from_other_lane, align 4
  call void @region_1_15(ptr %30, ptr %result_from_other_lane, ptr %return_buffer30)
  %32 = load float, ptr %return_buffer30, align 4
  store float %32, ptr %30, align 4
  %partial_reduction_result32 = load float, ptr %30, align 4
  %33 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 8, i32 31)
  store float %33, ptr %result_from_other_lane31, align 4
  call void @region_1_15(ptr %30, ptr %result_from_other_lane31, ptr %return_buffer33)
  %34 = load float, ptr %return_buffer33, align 4
  store float %34, ptr %30, align 4
  %partial_reduction_result35 = load float, ptr %30, align 4
  %35 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result35, i32 4, i32 31)
  store float %35, ptr %result_from_other_lane34, align 4
  call void @region_1_15(ptr %30, ptr %result_from_other_lane34, ptr %return_buffer36)
  %36 = load float, ptr %return_buffer36, align 4
  store float %36, ptr %30, align 4
  %partial_reduction_result38 = load float, ptr %30, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 2, i32 31)
  store float %37, ptr %result_from_other_lane37, align 4
  call void @region_1_15(ptr %30, ptr %result_from_other_lane37, ptr %return_buffer39)
  %38 = load float, ptr %return_buffer39, align 4
  store float %38, ptr %30, align 4
  %partial_reduction_result41 = load float, ptr %30, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 1, i32 31)
  store float %39, ptr %result_from_other_lane40, align 4
  call void @region_1_15(ptr %30, ptr %result_from_other_lane40, ptr %return_buffer42)
  %40 = load float, ptr %return_buffer42, align 4
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
  %49 = mul nuw nsw i32 %25, 30
  %50 = add nuw nsw i32 %48, %49
  %51 = mul nuw nsw i32 %tile_origin.0, 3840
  %52 = add nuw nsw i32 %50, %51
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 30
  %55 = udiv i32 %52, 30
  %56 = urem i32 %55, 128
  %57 = udiv i32 %52, 3840
  %58 = mul i32 %thread_id.x, 1
  %59 = sub i32 %x_loc, %58
  %60 = mul nuw nsw i32 %54, 1
  %61 = add nuw nsw i32 0, %60
  %62 = udiv i32 %61, 30
  %63 = mul nuw nsw i32 %56, 1
  %64 = add nuw nsw i32 0, %63
  %65 = mul nuw nsw i32 %57, 128
  %66 = add nuw nsw i32 %64, %65
  %67 = udiv i32 %66, 8192
  br label %concatenate.pivot.13.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %68 = phi i32 [ 0, %concatenate.pivot.0. ]
  %69 = sub nsw i32 %61, %68
  %70 = udiv i32 %52, 30
  %71 = mul i32 %70, 13
  %72 = add i32 %71, %69
  %73 = udiv i32 %72, 1
  %74 = urem i32 %73, 13
  %75 = udiv i32 %72, 13
  %Arg_2.3 = getelementptr inbounds float, ptr %arg2, i32 %72
  %Arg_2.33 = load float, ptr %Arg_2.3, align 4, !invariant.load !65
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.13.5
  %76 = phi i32 [ 13, %concatenate.pivot.13.5 ]
  %77 = sub nsw i32 %61, %76
  %78 = udiv i32 %52, 30
  %79 = mul i32 %78, 17
  %80 = add i32 %79, %77
  %81 = udiv i32 %80, 1
  %82 = urem i32 %81, 17
  %83 = udiv i32 %80, 17
  %Arg_3.4 = getelementptr inbounds float, ptr %arg3, i32 %80
  %Arg_3.44 = load float, ptr %Arg_3.4, align 4, !invariant.load !65
  br label %concatenate.5.merge

concatenate.pivot.13.:                            ; preds = %x_in_tile-true
  %84 = icmp ult i32 %61, 13
  br i1 %84, label %concatenate.pivot.0., label %concatenate.pivot.13.5

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.13.
  br label %concat_index_from_operand_id0

concatenate.pivot.13.5:                           ; preds = %concatenate.pivot.13.
  br label %concat_index_from_operand_id1

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %85 = phi float [ %Arg_2.33, %concat_index_from_operand_id0 ], [ %Arg_3.44, %concat_index_from_operand_id1 ]
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !65
  %multiply.7 = fmul float %85, %Arg_1.2
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.16 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  %multiply.8 = fmul float %multiply.7, %Arg_0.16
  %region_0_21_constant_9 = load float, ptr @2, align 4
  %Arg_0.17 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !65
  %subtract.11 = fsub float %region_0_21_constant_9, %Arg_0.18
  %multiply.12 = fmul float %multiply.8, %subtract.11
  store float %multiply.12, ptr %reduction_input_address, align 4
  %86 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %59
  call void @region_1_15(ptr %86, ptr %reduction_input_address, ptr %return_buffer)
  %87 = load float, ptr %return_buffer, align 4
  store float %87, ptr %86, align 4
  %88 = mul nuw nsw i32 %54, 1
  %89 = add nuw nsw i32 0, %88
  %90 = udiv i32 %89, 30
  %91 = mul nuw nsw i32 %56, 1
  %92 = add nuw nsw i32 0, %91
  %93 = mul nuw nsw i32 %57, 128
  %94 = add nuw nsw i32 %92, %93
  %95 = udiv i32 %94, 8192
  br label %concatenate.pivot.13.16

concat_index_from_operand_id010:                  ; preds = %concatenate.pivot.0.17
  %96 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %97 = sub nsw i32 %89, %96
  %98 = udiv i32 %52, 30
  %99 = mul i32 %98, 13
  %100 = add i32 %99, %97
  %101 = udiv i32 %100, 1
  %102 = urem i32 %101, 13
  %103 = udiv i32 %100, 13
  %Arg_2.311 = getelementptr inbounds float, ptr %arg2, i32 %100
  %Arg_2.312 = load float, ptr %Arg_2.311, align 4, !invariant.load !65
  br label %concatenate.5.merge9

concat_index_from_operand_id113:                  ; preds = %concatenate.pivot.13.18
  %104 = phi i32 [ 13, %concatenate.pivot.13.18 ]
  %105 = sub nsw i32 %89, %104
  %106 = udiv i32 %52, 30
  %107 = mul i32 %106, 17
  %108 = add i32 %107, %105
  %109 = udiv i32 %108, 1
  %110 = urem i32 %109, 17
  %111 = udiv i32 %108, 17
  %Arg_3.414 = getelementptr inbounds float, ptr %arg3, i32 %108
  %Arg_3.415 = load float, ptr %Arg_3.414, align 4, !invariant.load !65
  br label %concatenate.5.merge9

concatenate.pivot.13.16:                          ; preds = %concatenate.5.merge
  %112 = icmp ult i32 %89, 13
  br i1 %112, label %concatenate.pivot.0.17, label %concatenate.pivot.13.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.13.16
  br label %concat_index_from_operand_id010

concatenate.pivot.13.18:                          ; preds = %concatenate.pivot.13.16
  br label %concat_index_from_operand_id113

concatenate.5.merge9:                             ; preds = %concat_index_from_operand_id113, %concat_index_from_operand_id010
  %113 = phi float [ %Arg_2.312, %concat_index_from_operand_id010 ], [ %Arg_3.415, %concat_index_from_operand_id113 ]
  %Arg_1.219 = load float, ptr %arg1, align 4, !invariant.load !65
  %multiply.720 = fmul float %113, %Arg_1.219
  %Arg_0.121 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.122 = load float, ptr %Arg_0.121, align 4, !invariant.load !65
  %multiply.823 = fmul float %multiply.720, %Arg_0.122
  %region_0_21_constant_924 = load float, ptr @2, align 4
  %Arg_0.125 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !65
  %subtract.1127 = fsub float %region_0_21_constant_924, %Arg_0.126
  %multiply.1228 = fmul float %multiply.823, %subtract.1127
  %114 = mul nuw nsw i32 %54, 1
  %115 = add nuw nsw i32 0, %114
  %116 = udiv i32 %115, 30
  %117 = mul nuw nsw i32 %56, 1
  %118 = add nuw nsw i32 0, %117
  %119 = mul nuw nsw i32 %57, 128
  %120 = add nuw nsw i32 %118, %119
  %121 = udiv i32 %120, 8192
  %122 = getelementptr inbounds float, ptr %arg5, i32 %52
  store float %multiply.1228, ptr %122, align 4
  br label %x_in_tile-after

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %123 = mul i32 %thread_id.y, 1
  %124 = add i32 %tile_origin.1, %thread_id.x
  %125 = add i32 %tile_origin.2, %123
  %126 = add i32 %125, 0
  %127 = mul i32 %tile_origin.0, 30
  %128 = add i32 %127, %126
  %129 = udiv i32 %128, 1
  %130 = urem i32 %129, 30
  %131 = udiv i32 %128, 30
  %output_element_address = getelementptr inbounds [64 x [30 x float]], ptr %arg4, i32 0, i32 %131, i32 %130
  %output = load float, ptr %30, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_15(ptr dereferenceable(4) %Arg_0.16.typed, ptr dereferenceable(4) %Arg_1.17.typed, ptr dereferenceable(4) %output_arg) {
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

define void @fusion_14(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 16 dereferenceable(16777216) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2, ptr noalias align 128 dereferenceable(16777216) %arg3) {
entry:
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane50 = alloca float, align 4
  %return_buffer49 = alloca float, align 4
  %result_from_other_lane47 = alloca float, align 4
  %return_buffer46 = alloca float, align 4
  %result_from_other_lane44 = alloca float, align 4
  %return_buffer40 = alloca float, align 4
  %result_from_other_lane38 = alloca float, align 4
  %return_buffer37 = alloca float, align 4
  %result_from_other_lane35 = alloca float, align 4
  %return_buffer34 = alloca float, align 4
  %result_from_other_lane32 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !60
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after60, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_15_constant_8 = load float, ptr @5, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_15_constant_8, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_15_constant_8, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !77
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
  %13 = urem i32 %12, 8
  %14 = udiv i32 %9, 8
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 8
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 128, i32 4096
  %18 = icmp eq i32 %13, 7
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after13, %y_in_tile.loop_body
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
  %x_loc11 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc11
  %33 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %33, label %x_in_tile-true12, label %x_in_tile-after13

x_in_tile-after13:                                ; preds = %x_in_tile-true12, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !78

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !79

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result27 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane, ptr %return_buffer28)
  %38 = load float, ptr %return_buffer28, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result30 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane29, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane29, ptr %return_buffer31)
  %40 = load float, ptr %return_buffer31, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result33 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result33, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane32, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane32, ptr %return_buffer34)
  %42 = load float, ptr %return_buffer34, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result36 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result36, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane35, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane35, ptr %return_buffer37)
  %44 = load float, ptr %return_buffer37, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result39 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result39, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane38, align 4
  call void @region_1_9(ptr %36, ptr %result_from_other_lane38, ptr %return_buffer40)
  %46 = load float, ptr %return_buffer40, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address41 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address41 to ptr
  %current_output42 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output42, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr43 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr43 to ptr
  %partial_reduction_result45 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane44, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane44, ptr %return_buffer46)
  %57 = load float, ptr %return_buffer46, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result48 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result48, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane47, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane47, ptr %return_buffer49)
  %59 = load float, ptr %return_buffer49, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result51 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane50, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane50, ptr %return_buffer52)
  %61 = load float, ptr %return_buffer52, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result54 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane53, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane53, ptr %return_buffer55)
  %63 = load float, ptr %return_buffer55, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result57 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane56, align 4
  call void @region_1_9(ptr %55, ptr %result_from_other_lane56, ptr %return_buffer58)
  %65 = load float, ptr %return_buffer58, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true59, label %reduction_write_output-after60

reduction_write_output-after60:                   ; preds = %reduction_write_output-true59, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 512
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 65536
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 512
  %80 = udiv i32 %77, 512
  %81 = urem i32 %80, 128
  %82 = udiv i32 %77, 65536
  %83 = mul i32 %thread_id.x, 2
  %84 = sub i32 %x_loc, %83
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 512
  %88 = mul nuw nsw i32 %81, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 128
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 8192
  %Arg_1.2 = getelementptr inbounds [8192 x [512 x float]], ptr %arg1, i32 0, i32 %91, i32 %86
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !65
  %region_0_15_constant_3 = load float, ptr @4, align 4
  %compare.5 = fcmp ogt float %Arg_1.23, %region_0_15_constant_3
  %93 = zext i1 %compare.5 to i8
  %Arg_0.1 = getelementptr inbounds [8192 x [512 x float]], ptr %arg0, i32 0, i32 %91, i32 %86
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  %94 = trunc i8 %93 to i1
  %95 = select i1 %94, float %Arg_0.14, float %region_0_15_constant_3
  store float %95, ptr %reduction_input_address, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %84
  call void @region_1_9(ptr %96, ptr %reduction_input_address, ptr %return_buffer)
  %97 = load float, ptr %return_buffer, align 4
  store float %97, ptr %96, align 4
  %98 = mul nuw nsw i32 %79, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 512
  %101 = mul nuw nsw i32 %81, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %82, 128
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 8192
  %Arg_1.25 = getelementptr inbounds float, ptr %arg1, i32 %77
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !65
  %region_0_15_constant_37 = load float, ptr @4, align 4
  %compare.58 = fcmp ogt float %Arg_1.26, %region_0_15_constant_37
  %106 = zext i1 %compare.58 to i8
  %Arg_0.19 = getelementptr inbounds float, ptr %arg0, i32 %77
  %Arg_0.110 = load float, ptr %Arg_0.19, align 4, !invariant.load !65
  %107 = trunc i8 %106 to i1
  %108 = select i1 %107, float %Arg_0.110, float %region_0_15_constant_37
  %109 = mul nuw nsw i32 %79, 1
  %110 = add nuw nsw i32 0, %109
  %111 = udiv i32 %110, 512
  %112 = mul nuw nsw i32 %81, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %82, 128
  %115 = add nuw nsw i32 %113, %114
  %116 = udiv i32 %115, 8192
  %117 = getelementptr inbounds [8192 x [512 x float]], ptr %arg3, i32 0, i32 %115, i32 %110
  store float %108, ptr %117, align 4
  br label %x_in_tile-after

x_in_tile-true12:                                 ; preds = %x_in_tile-after
  %118 = mul nuw nsw i32 %32, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %31, 512
  %121 = add nuw nsw i32 %119, %120
  %122 = mul nuw nsw i32 %tile_origin.0, 65536
  %123 = add nuw nsw i32 %121, %122
  %124 = udiv i32 %123, 1
  %125 = urem i32 %124, 512
  %126 = udiv i32 %123, 512
  %127 = urem i32 %126, 128
  %128 = udiv i32 %123, 65536
  %129 = mul i32 %thread_id.x, 2
  %130 = sub i32 %x_loc11, %129
  %131 = mul nuw nsw i32 %125, 1
  %132 = add nuw nsw i32 0, %131
  %133 = udiv i32 %132, 512
  %134 = mul nuw nsw i32 %127, 1
  %135 = add nuw nsw i32 0, %134
  %136 = mul nuw nsw i32 %128, 128
  %137 = add nuw nsw i32 %135, %136
  %138 = udiv i32 %137, 8192
  %Arg_1.214 = getelementptr inbounds [8192 x [512 x float]], ptr %arg1, i32 0, i32 %137, i32 %132
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !65
  %region_0_15_constant_316 = load float, ptr @4, align 4
  %compare.517 = fcmp ogt float %Arg_1.215, %region_0_15_constant_316
  %139 = zext i1 %compare.517 to i8
  %Arg_0.118 = getelementptr inbounds [8192 x [512 x float]], ptr %arg0, i32 0, i32 %137, i32 %132
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !65
  %140 = trunc i8 %139 to i1
  %141 = select i1 %140, float %Arg_0.119, float %region_0_15_constant_316
  store float %141, ptr %reduction_input_address, align 4
  %142 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %130
  call void @region_1_9(ptr %142, ptr %reduction_input_address, ptr %return_buffer20)
  %143 = load float, ptr %return_buffer20, align 4
  store float %143, ptr %142, align 4
  %144 = mul nuw nsw i32 %125, 1
  %145 = add nuw nsw i32 0, %144
  %146 = udiv i32 %145, 512
  %147 = mul nuw nsw i32 %127, 1
  %148 = add nuw nsw i32 0, %147
  %149 = mul nuw nsw i32 %128, 128
  %150 = add nuw nsw i32 %148, %149
  %151 = udiv i32 %150, 8192
  %Arg_1.221 = getelementptr inbounds float, ptr %arg1, i32 %123
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !65
  %region_0_15_constant_323 = load float, ptr @4, align 4
  %compare.524 = fcmp ogt float %Arg_1.222, %region_0_15_constant_323
  %152 = zext i1 %compare.524 to i8
  %Arg_0.125 = getelementptr inbounds float, ptr %arg0, i32 %123
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !65
  %153 = trunc i8 %152 to i1
  %154 = select i1 %153, float %Arg_0.126, float %region_0_15_constant_323
  %155 = mul nuw nsw i32 %125, 1
  %156 = add nuw nsw i32 0, %155
  %157 = udiv i32 %156, 512
  %158 = mul nuw nsw i32 %127, 1
  %159 = add nuw nsw i32 0, %158
  %160 = mul nuw nsw i32 %128, 128
  %161 = add nuw nsw i32 %159, %160
  %162 = udiv i32 %161, 8192
  %163 = getelementptr inbounds [8192 x [512 x float]], ptr %arg3, i32 0, i32 %161, i32 %156
  store float %154, ptr %163, align 4
  br label %x_in_tile-after13

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %164 = mul i32 %thread_id.y, 2
  %165 = add i32 %tile_origin.1, %thread_id.x
  %166 = add i32 %tile_origin.2, %164
  %167 = add i32 %166, 0
  %168 = mul i32 %tile_origin.0, 512
  %169 = add i32 %168, %167
  %170 = udiv i32 %169, 1
  %171 = urem i32 %170, 512
  %172 = udiv i32 %169, 512
  %output_element_address = getelementptr inbounds [64 x [512 x float]], ptr %arg2, i32 0, i32 %172, i32 %171
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true59:                    ; preds = %reduction_write_output-after
  %173 = mul i32 %thread_id.y, 2
  %174 = add i32 %tile_origin.1, %thread_id.x
  %175 = add i32 %tile_origin.2, %173
  %176 = add i32 %175, 1
  %177 = mul i32 %tile_origin.0, 512
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %180 = urem i32 %179, 512
  %181 = udiv i32 %178, 512
  %output_element_address61 = getelementptr inbounds [64 x [512 x float]], ptr %arg2, i32 0, i32 %181, i32 %180
  %output62 = load float, ptr %55, align 4
  store float %output62, ptr %output_element_address61, align 4
  br label %reduction_write_output-after60
}

define internal void @region_1_9(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_5(ptr noalias align 16 dereferenceable(262144) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(262144) %arg3, ptr noalias align 128 dereferenceable(262144) %arg4, ptr noalias align 16 dereferenceable(262144) %arg5, ptr noalias align 128 dereferenceable(262144) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 65536
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 65536
  br i1 %6, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %fusion_5.in_bounds-true, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.9 = fmul float %9, %11
  %subtract.10 = fsub float %8, %multiply.9
  %12 = insertvalue { float, float, float } undef, float %subtract.10, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !65
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.11 = fmul float %9, %16
  %subtract.12 = fsub float %14, %multiply.11
  %17 = insertvalue { float, float, float } %12, float %subtract.12, 1
  %18 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %19 = load float, ptr %18, align 4, !invariant.load !65
  %20 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %21 = load float, ptr %20, align 4
  %multiply.13 = fmul float %9, %21
  %subtract.14 = fsub float %19, %multiply.13
  %22 = insertvalue { float, float, float } %17, float %subtract.14, 2
  %23 = extractvalue { float, float, float } %22, 0
  %24 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %23, ptr %24, align 4
  %25 = extractvalue { float, float, float } %22, 1
  %26 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %25, ptr %26, align 4
  %27 = extractvalue { float, float, float } %22, 2
  %28 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %27, ptr %28, align 4
  br label %fusion_5.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #3

define void @fusion_11(ptr noalias align 16 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(131072) %arg3, ptr noalias align 128 dereferenceable(131072) %arg4, ptr noalias align 16 dereferenceable(131072) %arg5, ptr noalias align 128 dereferenceable(131072) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !80
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 32768
  br i1 %6, label %fusion_11.in_bounds-true, label %fusion_11.in_bounds-after

fusion_11.in_bounds-after:                        ; preds = %fusion_11.in_bounds-true, %entry
  ret void

fusion_11.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.9 = fmul float %9, %11
  %subtract.10 = fsub float %8, %multiply.9
  %12 = insertvalue { float, float, float } undef, float %subtract.10, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !65
  %15 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %16 = load float, ptr %15, align 4
  %multiply.11 = fmul float %9, %16
  %subtract.12 = fsub float %14, %multiply.11
  %17 = insertvalue { float, float, float } %12, float %subtract.12, 1
  %18 = getelementptr inbounds float, ptr %arg5, i32 %linear_index
  %19 = load float, ptr %18, align 4, !invariant.load !65
  %20 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  %21 = load float, ptr %20, align 4
  %multiply.13 = fmul float %9, %21
  %subtract.14 = fsub float %19, %multiply.13
  %22 = insertvalue { float, float, float } %17, float %subtract.14, 2
  %23 = extractvalue { float, float, float } %22, 0
  %24 = getelementptr inbounds float, ptr %arg6, i32 %linear_index
  store float %23, ptr %24, align 4
  %25 = extractvalue { float, float, float } %22, 1
  %26 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %25, ptr %26, align 4
  %27 = extractvalue { float, float, float } %22, 2
  %28 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %27, ptr %28, align 4
  br label %fusion_11.in_bounds-after
}

define void @fusion_25(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(557056) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 16 dereferenceable(2097152) %arg4, ptr noalias align 128 dereferenceable(2097152) %arg5, ptr noalias align 16 dereferenceable(2097152) %arg6, ptr noalias align 128 dereferenceable(2097152) %arg7, ptr noalias align 128 dereferenceable(2097152) %arg8) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !77
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !81
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
  br i1 %15, label %fusion_25.in_bounds-true, label %fusion_25.in_bounds-after

fusion_25.in_bounds-after:                        ; preds = %fusion_25.in_bounds-true, %entry
  ret void

fusion_25.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !65
  %18 = load float, ptr %arg1, align 4, !invariant.load !65
  %19 = add i32 %5, 0
  %20 = add i32 %4, 48
  %21 = mul nuw nsw i32 %20, 1
  %22 = add nuw nsw i32 0, %21
  %23 = urem i32 %22, 8
  %24 = udiv i32 %22, 8
  %25 = udiv i32 %24, 17
  %26 = mul nuw nsw i32 %19, 1
  %27 = add nuw nsw i32 0, %26
  %28 = udiv i32 %27, 8192
  %29 = mul nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 0, %29
  %31 = mul nuw nsw i32 %24, 8
  %32 = add nuw nsw i32 %30, %31
  %33 = udiv i32 %32, 136
  %34 = mul nuw nsw i32 %27, 1
  %35 = add nuw nsw i32 0, %34
  %36 = udiv i32 %35, 8192
  %37 = add i32 %35, 0
  %38 = add i32 %32, 832
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !65
  %41 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %27, i32 %24, i32 0
  %42 = load float, ptr %41, align 4, !invariant.load !65
  %multiply.14 = fmul float %40, %42
  %multiply.17 = fmul float %18, %multiply.14
  %subtract.18 = fsub float %17, %multiply.17
  %43 = insertvalue { float, float, float } undef, float %subtract.18, 0
  %44 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  %45 = load float, ptr %44, align 4, !invariant.load !65
  %46 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %47 = load float, ptr %46, align 4
  %multiply.19 = fmul float %18, %47
  %subtract.20 = fsub float %45, %multiply.19
  %48 = insertvalue { float, float, float } %43, float %subtract.20, 1
  %49 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %50 = load float, ptr %49, align 4, !invariant.load !65
  %51 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  %52 = load float, ptr %51, align 4
  %multiply.21 = fmul float %18, %52
  %subtract.22 = fsub float %50, %multiply.21
  %53 = insertvalue { float, float, float } %48, float %subtract.22, 2
  %54 = extractvalue { float, float, float } %53, 0
  %55 = getelementptr inbounds float, ptr %arg8, i32 %linear_index_base
  store float %54, ptr %55, align 4
  %56 = extractvalue { float, float, float } %53, 1
  %57 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %56, ptr %57, align 4
  %58 = extractvalue { float, float, float } %53, 2
  %59 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %58, ptr %59, align 4
  %60 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %61 = load float, ptr %60, align 4, !invariant.load !65
  %62 = load float, ptr %arg1, align 4, !invariant.load !65
  %63 = add i32 %8, 0
  %64 = add i32 %7, 48
  %65 = mul nuw nsw i32 %64, 1
  %66 = add nuw nsw i32 0, %65
  %67 = urem i32 %66, 8
  %68 = udiv i32 %66, 8
  %69 = udiv i32 %68, 17
  %70 = mul nuw nsw i32 %63, 1
  %71 = add nuw nsw i32 0, %70
  %72 = udiv i32 %71, 8192
  %73 = mul nuw nsw i32 %67, 1
  %74 = add nuw nsw i32 0, %73
  %75 = mul nuw nsw i32 %68, 8
  %76 = add nuw nsw i32 %74, %75
  %77 = udiv i32 %76, 136
  %78 = mul nuw nsw i32 %71, 1
  %79 = add nuw nsw i32 0, %78
  %80 = udiv i32 %79, 8192
  %81 = add i32 %79, 0
  %82 = add i32 %76, 832
  %83 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %81, i32 %82
  %84 = load float, ptr %83, align 4, !invariant.load !65
  %85 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %71, i32 %68, i32 0
  %86 = load float, ptr %85, align 4, !invariant.load !65
  %multiply.141 = fmul float %84, %86
  %multiply.172 = fmul float %62, %multiply.141
  %subtract.183 = fsub float %61, %multiply.172
  %87 = insertvalue { float, float, float } undef, float %subtract.183, 0
  %88 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %89 = load float, ptr %88, align 4, !invariant.load !65
  %90 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %91 = load float, ptr %90, align 4
  %multiply.194 = fmul float %62, %91
  %subtract.205 = fsub float %89, %multiply.194
  %92 = insertvalue { float, float, float } %87, float %subtract.205, 1
  %93 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %94 = load float, ptr %93, align 4, !invariant.load !65
  %95 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  %96 = load float, ptr %95, align 4
  %multiply.216 = fmul float %62, %96
  %subtract.227 = fsub float %94, %multiply.216
  %97 = insertvalue { float, float, float } %92, float %subtract.227, 2
  %98 = extractvalue { float, float, float } %97, 0
  %99 = getelementptr inbounds float, ptr %arg8, i32 %linear_index1
  store float %98, ptr %99, align 4
  %100 = extractvalue { float, float, float } %97, 1
  %101 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %100, ptr %101, align 4
  %102 = extractvalue { float, float, float } %97, 2
  %103 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %102, ptr %103, align 4
  %104 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %105 = load float, ptr %104, align 4, !invariant.load !65
  %106 = load float, ptr %arg1, align 4, !invariant.load !65
  %107 = add i32 %11, 0
  %108 = add i32 %10, 48
  %109 = mul nuw nsw i32 %108, 1
  %110 = add nuw nsw i32 0, %109
  %111 = urem i32 %110, 8
  %112 = udiv i32 %110, 8
  %113 = udiv i32 %112, 17
  %114 = mul nuw nsw i32 %107, 1
  %115 = add nuw nsw i32 0, %114
  %116 = udiv i32 %115, 8192
  %117 = mul nuw nsw i32 %111, 1
  %118 = add nuw nsw i32 0, %117
  %119 = mul nuw nsw i32 %112, 8
  %120 = add nuw nsw i32 %118, %119
  %121 = udiv i32 %120, 136
  %122 = mul nuw nsw i32 %115, 1
  %123 = add nuw nsw i32 0, %122
  %124 = udiv i32 %123, 8192
  %125 = add i32 %123, 0
  %126 = add i32 %120, 832
  %127 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %125, i32 %126
  %128 = load float, ptr %127, align 4, !invariant.load !65
  %129 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %115, i32 %112, i32 0
  %130 = load float, ptr %129, align 4, !invariant.load !65
  %multiply.148 = fmul float %128, %130
  %multiply.179 = fmul float %106, %multiply.148
  %subtract.1810 = fsub float %105, %multiply.179
  %131 = insertvalue { float, float, float } undef, float %subtract.1810, 0
  %132 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %133 = load float, ptr %132, align 4, !invariant.load !65
  %134 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %135 = load float, ptr %134, align 4
  %multiply.1911 = fmul float %106, %135
  %subtract.2012 = fsub float %133, %multiply.1911
  %136 = insertvalue { float, float, float } %131, float %subtract.2012, 1
  %137 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %138 = load float, ptr %137, align 4, !invariant.load !65
  %139 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  %140 = load float, ptr %139, align 4
  %multiply.2113 = fmul float %106, %140
  %subtract.2214 = fsub float %138, %multiply.2113
  %141 = insertvalue { float, float, float } %136, float %subtract.2214, 2
  %142 = extractvalue { float, float, float } %141, 0
  %143 = getelementptr inbounds float, ptr %arg8, i32 %linear_index2
  store float %142, ptr %143, align 4
  %144 = extractvalue { float, float, float } %141, 1
  %145 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %144, ptr %145, align 4
  %146 = extractvalue { float, float, float } %141, 2
  %147 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %146, ptr %147, align 4
  %148 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %149 = load float, ptr %148, align 4, !invariant.load !65
  %150 = load float, ptr %arg1, align 4, !invariant.load !65
  %151 = add i32 %14, 0
  %152 = add i32 %13, 48
  %153 = mul nuw nsw i32 %152, 1
  %154 = add nuw nsw i32 0, %153
  %155 = urem i32 %154, 8
  %156 = udiv i32 %154, 8
  %157 = udiv i32 %156, 17
  %158 = mul nuw nsw i32 %151, 1
  %159 = add nuw nsw i32 0, %158
  %160 = udiv i32 %159, 8192
  %161 = mul nuw nsw i32 %155, 1
  %162 = add nuw nsw i32 0, %161
  %163 = mul nuw nsw i32 %156, 8
  %164 = add nuw nsw i32 %162, %163
  %165 = udiv i32 %164, 136
  %166 = mul nuw nsw i32 %159, 1
  %167 = add nuw nsw i32 0, %166
  %168 = udiv i32 %167, 8192
  %169 = add i32 %167, 0
  %170 = add i32 %164, 832
  %171 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %169, i32 %170
  %172 = load float, ptr %171, align 4, !invariant.load !65
  %173 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %159, i32 %156, i32 0
  %174 = load float, ptr %173, align 4, !invariant.load !65
  %multiply.1415 = fmul float %172, %174
  %multiply.1716 = fmul float %150, %multiply.1415
  %subtract.1817 = fsub float %149, %multiply.1716
  %175 = insertvalue { float, float, float } undef, float %subtract.1817, 0
  %176 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %177 = load float, ptr %176, align 4, !invariant.load !65
  %178 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %179 = load float, ptr %178, align 4
  %multiply.1918 = fmul float %150, %179
  %subtract.2019 = fsub float %177, %multiply.1918
  %180 = insertvalue { float, float, float } %175, float %subtract.2019, 1
  %181 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %182 = load float, ptr %181, align 4, !invariant.load !65
  %183 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  %184 = load float, ptr %183, align 4
  %multiply.2120 = fmul float %150, %184
  %subtract.2221 = fsub float %182, %multiply.2120
  %185 = insertvalue { float, float, float } %180, float %subtract.2221, 2
  %186 = extractvalue { float, float, float } %185, 0
  %187 = getelementptr inbounds float, ptr %arg8, i32 %linear_index3
  store float %186, ptr %187, align 4
  %188 = extractvalue { float, float, float } %185, 1
  %189 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %188, ptr %189, align 4
  %190 = extractvalue { float, float, float } %185, 2
  %191 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %190, ptr %191, align 4
  br label %fusion_25.in_bounds-after
}

define void @fusion_44(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(32768) %arg2, ptr noalias align 16 dereferenceable(2097152) %arg3, ptr noalias align 128 dereferenceable(16384) %arg4, ptr noalias align 128 dereferenceable(2097152) %arg5, ptr noalias align 128 dereferenceable(16384) %arg6, ptr noalias align 128 dereferenceable(2097152) %arg7) {
entry:
  %return_buffer210 = alloca float, align 4
  %result_from_other_lane208 = alloca float, align 4
  %return_buffer207 = alloca float, align 4
  %result_from_other_lane205 = alloca float, align 4
  %return_buffer204 = alloca float, align 4
  %result_from_other_lane202 = alloca float, align 4
  %return_buffer201 = alloca float, align 4
  %result_from_other_lane199 = alloca float, align 4
  %return_buffer198 = alloca float, align 4
  %result_from_other_lane196 = alloca float, align 4
  %return_buffer188 = alloca float, align 4
  %result_from_other_lane186 = alloca float, align 4
  %return_buffer185 = alloca float, align 4
  %result_from_other_lane183 = alloca float, align 4
  %return_buffer182 = alloca float, align 4
  %result_from_other_lane180 = alloca float, align 4
  %return_buffer179 = alloca float, align 4
  %result_from_other_lane177 = alloca float, align 4
  %return_buffer176 = alloca float, align 4
  %result_from_other_lane174 = alloca float, align 4
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
  %result_from_other_lane146 = alloca float, align 4
  %return_buffer145 = alloca float, align 4
  %result_from_other_lane143 = alloca float, align 4
  %return_buffer142 = alloca float, align 4
  %result_from_other_lane140 = alloca float, align 4
  %return_buffer139 = alloca float, align 4
  %result_from_other_lane137 = alloca float, align 4
  %return_buffer136 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer100 = alloca float, align 4
  %return_buffer82 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result2 = alloca float, i32 2, align 4
  %reduction_input_address1 = alloca float, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !60
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after212, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_34_constant_18 = load float, ptr @8, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_34_constant_18, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_34_constant_18, ptr %3, align 4
  %region_0_34_constant_183 = load float, ptr @8, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  store float %region_0_34_constant_183, ptr %4, align 4
  %5 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 1
  store float %region_0_34_constant_183, ptr %5, align 4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after64, %y_in_tile.loop_body
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
  %x_loc62 = add i32 %32, %23
  %33 = add i32 %tile_origin.1, %y_in_tile.indvar
  %34 = add i32 %tile_origin.2, %x_loc62
  %35 = icmp ult i32 %x_loc62, %tile_bound4
  br i1 %35, label %x_in_tile-true63, label %x_in_tile-after64

x_in_tile-after64:                                ; preds = %x_in_tile-true63, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !82

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !83

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %9, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %36 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %37 = load float, ptr %current_output, align 4
  store float %37, ptr %36, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %9, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %38 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result135 = load float, ptr %38, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result135, i32 16, i32 31)
  store float %39, ptr %result_from_other_lane, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane, ptr %return_buffer136)
  %40 = load float, ptr %return_buffer136, align 4
  store float %40, ptr %38, align 4
  %partial_reduction_result138 = load float, ptr %38, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result138, i32 8, i32 31)
  store float %41, ptr %result_from_other_lane137, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane137, ptr %return_buffer139)
  %42 = load float, ptr %return_buffer139, align 4
  store float %42, ptr %38, align 4
  %partial_reduction_result141 = load float, ptr %38, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result141, i32 4, i32 31)
  store float %43, ptr %result_from_other_lane140, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane140, ptr %return_buffer142)
  %44 = load float, ptr %return_buffer142, align 4
  store float %44, ptr %38, align 4
  %partial_reduction_result144 = load float, ptr %38, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result144, i32 2, i32 31)
  store float %45, ptr %result_from_other_lane143, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane143, ptr %return_buffer145)
  %46 = load float, ptr %return_buffer145, align 4
  store float %46, ptr %38, align 4
  %partial_reduction_result147 = load float, ptr %38, align 4
  %47 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result147, i32 1, i32 31)
  store float %47, ptr %result_from_other_lane146, align 4
  call void @region_1_19(ptr %38, ptr %result_from_other_lane146, ptr %return_buffer148)
  %48 = load float, ptr %return_buffer148, align 4
  store float %48, ptr %38, align 4
  %49 = icmp ult i32 %thread_id.x, %tile_bound
  %50 = mul i32 %thread_id.y, 2
  %51 = icmp ult i32 %50, %tile_bound4
  %52 = and i1 %51, %49
  %53 = icmp eq i32 %lane_id, 0
  %54 = and i1 %52, %53
  br i1 %54, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address149 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %9, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %55 = addrspacecast ptr addrspace(3) %shmem_output_address149 to ptr
  %current_output150 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %56 = load float, ptr %current_output150, align 4
  store float %56, ptr %55, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr151 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %9, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %57 = addrspacecast ptr addrspace(3) %shmem_transposed_addr151 to ptr
  %partial_reduction_result153 = load float, ptr %57, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result153, i32 16, i32 31)
  store float %58, ptr %result_from_other_lane152, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane152, ptr %return_buffer154)
  %59 = load float, ptr %return_buffer154, align 4
  store float %59, ptr %57, align 4
  %partial_reduction_result156 = load float, ptr %57, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result156, i32 8, i32 31)
  store float %60, ptr %result_from_other_lane155, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane155, ptr %return_buffer157)
  %61 = load float, ptr %return_buffer157, align 4
  store float %61, ptr %57, align 4
  %partial_reduction_result159 = load float, ptr %57, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result159, i32 4, i32 31)
  store float %62, ptr %result_from_other_lane158, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane158, ptr %return_buffer160)
  %63 = load float, ptr %return_buffer160, align 4
  store float %63, ptr %57, align 4
  %partial_reduction_result162 = load float, ptr %57, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result162, i32 2, i32 31)
  store float %64, ptr %result_from_other_lane161, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane161, ptr %return_buffer163)
  %65 = load float, ptr %return_buffer163, align 4
  store float %65, ptr %57, align 4
  %partial_reduction_result165 = load float, ptr %57, align 4
  %66 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result165, i32 1, i32 31)
  store float %66, ptr %result_from_other_lane164, align 4
  call void @region_1_19(ptr %57, ptr %result_from_other_lane164, ptr %return_buffer166)
  %67 = load float, ptr %return_buffer166, align 4
  store float %67, ptr %57, align 4
  %68 = icmp ult i32 %thread_id.x, %tile_bound
  %69 = mul i32 %thread_id.y, 2
  %70 = icmp ult i32 %69, %tile_bound4
  %71 = and i1 %70, %68
  %72 = icmp eq i32 %lane_id, 0
  %73 = and i1 %71, %72
  br i1 %73, label %reduction_write_output-true167, label %reduction_write_output-after168

reduction_write_output-after168:                  ; preds = %reduction_write_output-true167, %reduction_write_output-after
  %shmem_output_address171 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %9, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %74 = addrspacecast ptr addrspace(3) %shmem_output_address171 to ptr
  %current_output172 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 0
  %75 = load float, ptr %current_output172, align 4
  store float %75, ptr %74, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr173 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %9, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %76 = addrspacecast ptr addrspace(3) %shmem_transposed_addr173 to ptr
  %partial_reduction_result175 = load float, ptr %76, align 4
  %77 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result175, i32 16, i32 31)
  store float %77, ptr %result_from_other_lane174, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane174, ptr %return_buffer176)
  %78 = load float, ptr %return_buffer176, align 4
  store float %78, ptr %76, align 4
  %partial_reduction_result178 = load float, ptr %76, align 4
  %79 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result178, i32 8, i32 31)
  store float %79, ptr %result_from_other_lane177, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane177, ptr %return_buffer179)
  %80 = load float, ptr %return_buffer179, align 4
  store float %80, ptr %76, align 4
  %partial_reduction_result181 = load float, ptr %76, align 4
  %81 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result181, i32 4, i32 31)
  store float %81, ptr %result_from_other_lane180, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane180, ptr %return_buffer182)
  %82 = load float, ptr %return_buffer182, align 4
  store float %82, ptr %76, align 4
  %partial_reduction_result184 = load float, ptr %76, align 4
  %83 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result184, i32 2, i32 31)
  store float %83, ptr %result_from_other_lane183, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane183, ptr %return_buffer185)
  %84 = load float, ptr %return_buffer185, align 4
  store float %84, ptr %76, align 4
  %partial_reduction_result187 = load float, ptr %76, align 4
  %85 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result187, i32 1, i32 31)
  store float %85, ptr %result_from_other_lane186, align 4
  call void @region_2_28(ptr %76, ptr %result_from_other_lane186, ptr %return_buffer188)
  %86 = load float, ptr %return_buffer188, align 4
  store float %86, ptr %76, align 4
  %87 = icmp ult i32 %thread_id.x, %tile_bound
  %88 = mul i32 %thread_id.y, 2
  %89 = icmp ult i32 %88, %tile_bound4
  %90 = and i1 %89, %87
  %91 = icmp eq i32 %lane_id, 0
  %92 = and i1 %90, %91
  br i1 %92, label %reduction_write_output-true189, label %reduction_write_output-after190

reduction_write_output-after190:                  ; preds = %reduction_write_output-true189, %reduction_write_output-after168
  %shmem_output_address193 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %9, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %93 = addrspacecast ptr addrspace(3) %shmem_output_address193 to ptr
  %current_output194 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 1
  %94 = load float, ptr %current_output194, align 4
  store float %94, ptr %93, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr195 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache4, i32 0, i32 %9, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %95 = addrspacecast ptr addrspace(3) %shmem_transposed_addr195 to ptr
  %partial_reduction_result197 = load float, ptr %95, align 4
  %96 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result197, i32 16, i32 31)
  store float %96, ptr %result_from_other_lane196, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane196, ptr %return_buffer198)
  %97 = load float, ptr %return_buffer198, align 4
  store float %97, ptr %95, align 4
  %partial_reduction_result200 = load float, ptr %95, align 4
  %98 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result200, i32 8, i32 31)
  store float %98, ptr %result_from_other_lane199, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane199, ptr %return_buffer201)
  %99 = load float, ptr %return_buffer201, align 4
  store float %99, ptr %95, align 4
  %partial_reduction_result203 = load float, ptr %95, align 4
  %100 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result203, i32 4, i32 31)
  store float %100, ptr %result_from_other_lane202, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane202, ptr %return_buffer204)
  %101 = load float, ptr %return_buffer204, align 4
  store float %101, ptr %95, align 4
  %partial_reduction_result206 = load float, ptr %95, align 4
  %102 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result206, i32 2, i32 31)
  store float %102, ptr %result_from_other_lane205, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane205, ptr %return_buffer207)
  %103 = load float, ptr %return_buffer207, align 4
  store float %103, ptr %95, align 4
  %partial_reduction_result209 = load float, ptr %95, align 4
  %104 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result209, i32 1, i32 31)
  store float %104, ptr %result_from_other_lane208, align 4
  call void @region_2_28(ptr %95, ptr %result_from_other_lane208, ptr %return_buffer210)
  %105 = load float, ptr %return_buffer210, align 4
  store float %105, ptr %95, align 4
  %106 = icmp ult i32 %thread_id.x, %tile_bound
  %107 = mul i32 %thread_id.y, 2
  %108 = icmp ult i32 %107, %tile_bound4
  %109 = and i1 %108, %106
  %110 = icmp eq i32 %lane_id, 0
  %111 = and i1 %109, %110
  br i1 %111, label %reduction_write_output-true211, label %reduction_write_output-after212

reduction_write_output-after212:                  ; preds = %reduction_write_output-true211, %reduction_write_output-after190
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %112 = mul nuw nsw i32 %29, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %28, 64
  %115 = add nuw nsw i32 %113, %114
  %116 = mul nuw nsw i32 %tile_origin.0, 8192
  %117 = add nuw nsw i32 %115, %116
  %118 = udiv i32 %117, 1
  %119 = urem i32 %118, 64
  %120 = udiv i32 %117, 64
  %121 = urem i32 %120, 128
  %122 = udiv i32 %117, 8192
  %123 = mul i32 %thread_id.x, 2
  %124 = sub i32 %x_loc, %123
  %125 = mul nuw nsw i32 %119, 1
  %126 = add nuw nsw i32 0, %125
  %127 = udiv i32 %126, 64
  %128 = mul nuw nsw i32 %121, 1
  %129 = add nuw nsw i32 0, %128
  %130 = mul nuw nsw i32 %122, 128
  %131 = add nuw nsw i32 %129, %130
  %132 = udiv i32 %131, 8192
  %Arg_3.4 = getelementptr inbounds [8192 x [64 x float]], ptr %arg3, i32 0, i32 %131, i32 %126
  %Arg_3.46 = load float, ptr %Arg_3.4, align 4, !invariant.load !65
  %region_0_34_constant_5 = load float, ptr @6, align 4
  %compare.7 = fcmp ogt float %Arg_3.46, %region_0_34_constant_5
  %133 = zext i1 %compare.7 to i8
  %Arg_2.3 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %131, i32 0
  %Arg_2.37 = load float, ptr %Arg_2.3, align 4, !invariant.load !65
  %Arg_1.2 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %131, i32 0
  %Arg_1.28 = load float, ptr %Arg_1.2, align 4, !invariant.load !65
  %multiply.8 = fmul float %Arg_2.37, %Arg_1.28
  %region_0_34_constant_9 = load float, ptr @7, align 4
  %Arg_1.29 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %131, i32 0
  %Arg_1.210 = load float, ptr %Arg_1.29, align 4, !invariant.load !65
  %subtract.11 = fsub float %region_0_34_constant_9, %Arg_1.210
  %multiply.12 = fmul float %multiply.8, %subtract.11
  %Arg_0.1 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %131, i32 %126
  %Arg_0.111 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  %multiply.15 = fmul float %multiply.12, %Arg_0.111
  %134 = trunc i8 %133 to i1
  %135 = select i1 %134, float %multiply.15, float %region_0_34_constant_5
  store float %135, ptr %reduction_input_address, align 4
  %136 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %124
  call void @region_1_19(ptr %136, ptr %reduction_input_address, ptr %return_buffer)
  %137 = load float, ptr %return_buffer, align 4
  store float %137, ptr %136, align 4
  %138 = mul nuw nsw i32 %119, 1
  %139 = add nuw nsw i32 0, %138
  %140 = udiv i32 %139, 64
  %141 = mul nuw nsw i32 %121, 1
  %142 = add nuw nsw i32 0, %141
  %143 = mul nuw nsw i32 %122, 128
  %144 = add nuw nsw i32 %142, %143
  %145 = udiv i32 %144, 8192
  %Arg_0.112 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %144, i32 %139
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !65
  %region_0_34_constant_514 = load float, ptr @6, align 4
  %compare.24 = fcmp ogt float %Arg_0.113, %region_0_34_constant_514
  %146 = zext i1 %compare.24 to i8
  %Arg_2.315 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %144, i32 0
  %Arg_2.316 = load float, ptr %Arg_2.315, align 4, !invariant.load !65
  %Arg_1.217 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %144, i32 0
  %Arg_1.218 = load float, ptr %Arg_1.217, align 4, !invariant.load !65
  %multiply.819 = fmul float %Arg_2.316, %Arg_1.218
  %region_0_34_constant_920 = load float, ptr @7, align 4
  %Arg_1.221 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %144, i32 0
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !65
  %subtract.1123 = fsub float %region_0_34_constant_920, %Arg_1.222
  %multiply.1224 = fmul float %multiply.819, %subtract.1123
  %Arg_3.425 = getelementptr inbounds [8192 x [64 x float]], ptr %arg3, i32 0, i32 %144, i32 %139
  %Arg_3.426 = load float, ptr %Arg_3.425, align 4, !invariant.load !65
  %multiply.25 = fmul float %multiply.1224, %Arg_3.426
  %147 = trunc i8 %146 to i1
  %148 = select i1 %147, float %multiply.25, float %region_0_34_constant_514
  store float %148, ptr %reduction_input_address1, align 4
  %149 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %124
  call void @region_2_28(ptr %149, ptr %reduction_input_address1, ptr %return_buffer27)
  %150 = load float, ptr %return_buffer27, align 4
  store float %150, ptr %149, align 4
  %151 = mul nuw nsw i32 %119, 1
  %152 = add nuw nsw i32 0, %151
  %153 = udiv i32 %152, 64
  %154 = mul nuw nsw i32 %121, 1
  %155 = add nuw nsw i32 0, %154
  %156 = mul nuw nsw i32 %122, 128
  %157 = add nuw nsw i32 %155, %156
  %158 = udiv i32 %157, 8192
  %Arg_3.428 = getelementptr inbounds float, ptr %arg3, i32 %117
  %Arg_3.429 = load float, ptr %Arg_3.428, align 4, !invariant.load !65
  %region_0_34_constant_530 = load float, ptr @6, align 4
  %compare.731 = fcmp ogt float %Arg_3.429, %region_0_34_constant_530
  %159 = zext i1 %compare.731 to i8
  %Arg_2.332 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %157, i32 0
  %Arg_2.333 = load float, ptr %Arg_2.332, align 4, !invariant.load !65
  %Arg_1.234 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %157, i32 0
  %Arg_1.235 = load float, ptr %Arg_1.234, align 4, !invariant.load !65
  %multiply.836 = fmul float %Arg_2.333, %Arg_1.235
  %region_0_34_constant_937 = load float, ptr @7, align 4
  %Arg_1.238 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %157, i32 0
  %Arg_1.239 = load float, ptr %Arg_1.238, align 4, !invariant.load !65
  %subtract.1140 = fsub float %region_0_34_constant_937, %Arg_1.239
  %multiply.1241 = fmul float %multiply.836, %subtract.1140
  %Arg_0.142 = getelementptr inbounds float, ptr %arg0, i32 %117
  %Arg_0.143 = load float, ptr %Arg_0.142, align 4, !invariant.load !65
  %multiply.1544 = fmul float %multiply.1241, %Arg_0.143
  %160 = trunc i8 %159 to i1
  %161 = select i1 %160, float %multiply.1544, float %region_0_34_constant_530
  %162 = mul nuw nsw i32 %119, 1
  %163 = add nuw nsw i32 0, %162
  %164 = udiv i32 %163, 64
  %165 = mul nuw nsw i32 %121, 1
  %166 = add nuw nsw i32 0, %165
  %167 = mul nuw nsw i32 %122, 128
  %168 = add nuw nsw i32 %166, %167
  %169 = udiv i32 %168, 8192
  %Arg_0.145 = getelementptr inbounds float, ptr %arg0, i32 %117
  %Arg_0.146 = load float, ptr %Arg_0.145, align 4, !invariant.load !65
  %region_0_34_constant_547 = load float, ptr @6, align 4
  %compare.2448 = fcmp ogt float %Arg_0.146, %region_0_34_constant_547
  %170 = zext i1 %compare.2448 to i8
  %Arg_2.349 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %168, i32 0
  %Arg_2.350 = load float, ptr %Arg_2.349, align 4, !invariant.load !65
  %Arg_1.251 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %168, i32 0
  %Arg_1.252 = load float, ptr %Arg_1.251, align 4, !invariant.load !65
  %multiply.853 = fmul float %Arg_2.350, %Arg_1.252
  %region_0_34_constant_954 = load float, ptr @7, align 4
  %Arg_1.255 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %168, i32 0
  %Arg_1.256 = load float, ptr %Arg_1.255, align 4, !invariant.load !65
  %subtract.1157 = fsub float %region_0_34_constant_954, %Arg_1.256
  %multiply.1258 = fmul float %multiply.853, %subtract.1157
  %Arg_3.459 = getelementptr inbounds float, ptr %arg3, i32 %117
  %Arg_3.460 = load float, ptr %Arg_3.459, align 4, !invariant.load !65
  %multiply.2561 = fmul float %multiply.1258, %Arg_3.460
  %171 = trunc i8 %170 to i1
  %172 = select i1 %171, float %multiply.2561, float %region_0_34_constant_547
  %173 = mul nuw nsw i32 %119, 1
  %174 = add nuw nsw i32 0, %173
  %175 = udiv i32 %174, 64
  %176 = mul nuw nsw i32 %121, 1
  %177 = add nuw nsw i32 0, %176
  %178 = mul nuw nsw i32 %122, 128
  %179 = add nuw nsw i32 %177, %178
  %180 = udiv i32 %179, 8192
  %181 = getelementptr inbounds [8192 x [64 x float]], ptr %arg7, i32 0, i32 %179, i32 %174
  store float %172, ptr %181, align 4
  %182 = mul nuw nsw i32 %119, 1
  %183 = add nuw nsw i32 0, %182
  %184 = udiv i32 %183, 64
  %185 = mul nuw nsw i32 %121, 1
  %186 = add nuw nsw i32 0, %185
  %187 = mul nuw nsw i32 %122, 128
  %188 = add nuw nsw i32 %186, %187
  %189 = udiv i32 %188, 8192
  %190 = getelementptr inbounds [8192 x [64 x float]], ptr %arg5, i32 0, i32 %188, i32 %183
  store float %161, ptr %190, align 4
  br label %x_in_tile-after

x_in_tile-true63:                                 ; preds = %x_in_tile-after
  %191 = mul nuw nsw i32 %34, 1
  %192 = add nuw nsw i32 0, %191
  %193 = mul nuw nsw i32 %33, 64
  %194 = add nuw nsw i32 %192, %193
  %195 = mul nuw nsw i32 %tile_origin.0, 8192
  %196 = add nuw nsw i32 %194, %195
  %197 = udiv i32 %196, 1
  %198 = urem i32 %197, 64
  %199 = udiv i32 %196, 64
  %200 = urem i32 %199, 128
  %201 = udiv i32 %196, 8192
  %202 = mul i32 %thread_id.x, 2
  %203 = sub i32 %x_loc62, %202
  %204 = mul nuw nsw i32 %198, 1
  %205 = add nuw nsw i32 0, %204
  %206 = udiv i32 %205, 64
  %207 = mul nuw nsw i32 %200, 1
  %208 = add nuw nsw i32 0, %207
  %209 = mul nuw nsw i32 %201, 128
  %210 = add nuw nsw i32 %208, %209
  %211 = udiv i32 %210, 8192
  %Arg_3.465 = getelementptr inbounds [8192 x [64 x float]], ptr %arg3, i32 0, i32 %210, i32 %205
  %Arg_3.466 = load float, ptr %Arg_3.465, align 4, !invariant.load !65
  %region_0_34_constant_567 = load float, ptr @6, align 4
  %compare.768 = fcmp ogt float %Arg_3.466, %region_0_34_constant_567
  %212 = zext i1 %compare.768 to i8
  %Arg_2.369 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %210, i32 0
  %Arg_2.370 = load float, ptr %Arg_2.369, align 4, !invariant.load !65
  %Arg_1.271 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %210, i32 0
  %Arg_1.272 = load float, ptr %Arg_1.271, align 4, !invariant.load !65
  %multiply.873 = fmul float %Arg_2.370, %Arg_1.272
  %region_0_34_constant_974 = load float, ptr @7, align 4
  %Arg_1.275 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %210, i32 0
  %Arg_1.276 = load float, ptr %Arg_1.275, align 4, !invariant.load !65
  %subtract.1177 = fsub float %region_0_34_constant_974, %Arg_1.276
  %multiply.1278 = fmul float %multiply.873, %subtract.1177
  %Arg_0.179 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %210, i32 %205
  %Arg_0.180 = load float, ptr %Arg_0.179, align 4, !invariant.load !65
  %multiply.1581 = fmul float %multiply.1278, %Arg_0.180
  %213 = trunc i8 %212 to i1
  %214 = select i1 %213, float %multiply.1581, float %region_0_34_constant_567
  store float %214, ptr %reduction_input_address, align 4
  %215 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %203
  call void @region_1_19(ptr %215, ptr %reduction_input_address, ptr %return_buffer82)
  %216 = load float, ptr %return_buffer82, align 4
  store float %216, ptr %215, align 4
  %217 = mul nuw nsw i32 %198, 1
  %218 = add nuw nsw i32 0, %217
  %219 = udiv i32 %218, 64
  %220 = mul nuw nsw i32 %200, 1
  %221 = add nuw nsw i32 0, %220
  %222 = mul nuw nsw i32 %201, 128
  %223 = add nuw nsw i32 %221, %222
  %224 = udiv i32 %223, 8192
  %Arg_0.183 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %223, i32 %218
  %Arg_0.184 = load float, ptr %Arg_0.183, align 4, !invariant.load !65
  %region_0_34_constant_585 = load float, ptr @6, align 4
  %compare.2486 = fcmp ogt float %Arg_0.184, %region_0_34_constant_585
  %225 = zext i1 %compare.2486 to i8
  %Arg_2.387 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %223, i32 0
  %Arg_2.388 = load float, ptr %Arg_2.387, align 4, !invariant.load !65
  %Arg_1.289 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %223, i32 0
  %Arg_1.290 = load float, ptr %Arg_1.289, align 4, !invariant.load !65
  %multiply.891 = fmul float %Arg_2.388, %Arg_1.290
  %region_0_34_constant_992 = load float, ptr @7, align 4
  %Arg_1.293 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %223, i32 0
  %Arg_1.294 = load float, ptr %Arg_1.293, align 4, !invariant.load !65
  %subtract.1195 = fsub float %region_0_34_constant_992, %Arg_1.294
  %multiply.1296 = fmul float %multiply.891, %subtract.1195
  %Arg_3.497 = getelementptr inbounds [8192 x [64 x float]], ptr %arg3, i32 0, i32 %223, i32 %218
  %Arg_3.498 = load float, ptr %Arg_3.497, align 4, !invariant.load !65
  %multiply.2599 = fmul float %multiply.1296, %Arg_3.498
  %226 = trunc i8 %225 to i1
  %227 = select i1 %226, float %multiply.2599, float %region_0_34_constant_585
  store float %227, ptr %reduction_input_address1, align 4
  %228 = getelementptr inbounds float, ptr %partial_reduction_result2, i32 %203
  call void @region_2_28(ptr %228, ptr %reduction_input_address1, ptr %return_buffer100)
  %229 = load float, ptr %return_buffer100, align 4
  store float %229, ptr %228, align 4
  %230 = mul nuw nsw i32 %198, 1
  %231 = add nuw nsw i32 0, %230
  %232 = udiv i32 %231, 64
  %233 = mul nuw nsw i32 %200, 1
  %234 = add nuw nsw i32 0, %233
  %235 = mul nuw nsw i32 %201, 128
  %236 = add nuw nsw i32 %234, %235
  %237 = udiv i32 %236, 8192
  %Arg_3.4101 = getelementptr inbounds float, ptr %arg3, i32 %196
  %Arg_3.4102 = load float, ptr %Arg_3.4101, align 4, !invariant.load !65
  %region_0_34_constant_5103 = load float, ptr @6, align 4
  %compare.7104 = fcmp ogt float %Arg_3.4102, %region_0_34_constant_5103
  %238 = zext i1 %compare.7104 to i8
  %Arg_2.3105 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %236, i32 0
  %Arg_2.3106 = load float, ptr %Arg_2.3105, align 4, !invariant.load !65
  %Arg_1.2107 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %236, i32 0
  %Arg_1.2108 = load float, ptr %Arg_1.2107, align 4, !invariant.load !65
  %multiply.8109 = fmul float %Arg_2.3106, %Arg_1.2108
  %region_0_34_constant_9110 = load float, ptr @7, align 4
  %Arg_1.2111 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %236, i32 0
  %Arg_1.2112 = load float, ptr %Arg_1.2111, align 4, !invariant.load !65
  %subtract.11113 = fsub float %region_0_34_constant_9110, %Arg_1.2112
  %multiply.12114 = fmul float %multiply.8109, %subtract.11113
  %Arg_0.1115 = getelementptr inbounds float, ptr %arg0, i32 %196
  %Arg_0.1116 = load float, ptr %Arg_0.1115, align 4, !invariant.load !65
  %multiply.15117 = fmul float %multiply.12114, %Arg_0.1116
  %239 = trunc i8 %238 to i1
  %240 = select i1 %239, float %multiply.15117, float %region_0_34_constant_5103
  %241 = mul nuw nsw i32 %198, 1
  %242 = add nuw nsw i32 0, %241
  %243 = udiv i32 %242, 64
  %244 = mul nuw nsw i32 %200, 1
  %245 = add nuw nsw i32 0, %244
  %246 = mul nuw nsw i32 %201, 128
  %247 = add nuw nsw i32 %245, %246
  %248 = udiv i32 %247, 8192
  %Arg_0.1118 = getelementptr inbounds float, ptr %arg0, i32 %196
  %Arg_0.1119 = load float, ptr %Arg_0.1118, align 4, !invariant.load !65
  %region_0_34_constant_5120 = load float, ptr @6, align 4
  %compare.24121 = fcmp ogt float %Arg_0.1119, %region_0_34_constant_5120
  %249 = zext i1 %compare.24121 to i8
  %Arg_2.3122 = getelementptr inbounds [8192 x [1 x float]], ptr %arg2, i32 0, i32 %247, i32 0
  %Arg_2.3123 = load float, ptr %Arg_2.3122, align 4, !invariant.load !65
  %Arg_1.2124 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %247, i32 0
  %Arg_1.2125 = load float, ptr %Arg_1.2124, align 4, !invariant.load !65
  %multiply.8126 = fmul float %Arg_2.3123, %Arg_1.2125
  %region_0_34_constant_9127 = load float, ptr @7, align 4
  %Arg_1.2128 = getelementptr inbounds [8192 x [1 x float]], ptr %arg1, i32 0, i32 %247, i32 0
  %Arg_1.2129 = load float, ptr %Arg_1.2128, align 4, !invariant.load !65
  %subtract.11130 = fsub float %region_0_34_constant_9127, %Arg_1.2129
  %multiply.12131 = fmul float %multiply.8126, %subtract.11130
  %Arg_3.4132 = getelementptr inbounds float, ptr %arg3, i32 %196
  %Arg_3.4133 = load float, ptr %Arg_3.4132, align 4, !invariant.load !65
  %multiply.25134 = fmul float %multiply.12131, %Arg_3.4133
  %250 = trunc i8 %249 to i1
  %251 = select i1 %250, float %multiply.25134, float %region_0_34_constant_5120
  %252 = mul nuw nsw i32 %198, 1
  %253 = add nuw nsw i32 0, %252
  %254 = udiv i32 %253, 64
  %255 = mul nuw nsw i32 %200, 1
  %256 = add nuw nsw i32 0, %255
  %257 = mul nuw nsw i32 %201, 128
  %258 = add nuw nsw i32 %256, %257
  %259 = udiv i32 %258, 8192
  %260 = getelementptr inbounds [8192 x [64 x float]], ptr %arg7, i32 0, i32 %258, i32 %253
  store float %251, ptr %260, align 4
  %261 = mul nuw nsw i32 %198, 1
  %262 = add nuw nsw i32 0, %261
  %263 = udiv i32 %262, 64
  %264 = mul nuw nsw i32 %200, 1
  %265 = add nuw nsw i32 0, %264
  %266 = mul nuw nsw i32 %201, 128
  %267 = add nuw nsw i32 %265, %266
  %268 = udiv i32 %267, 8192
  %269 = getelementptr inbounds [8192 x [64 x float]], ptr %arg5, i32 0, i32 %267, i32 %262
  store float %240, ptr %269, align 4
  br label %x_in_tile-after64

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %270 = mul i32 %thread_id.y, 2
  %271 = add i32 %tile_origin.1, %thread_id.x
  %272 = add i32 %tile_origin.2, %270
  %273 = add i32 %272, 0
  %274 = mul i32 %tile_origin.0, 64
  %275 = add i32 %274, %273
  %276 = udiv i32 %275, 1
  %277 = urem i32 %276, 64
  %278 = udiv i32 %275, 64
  %output_element_address = getelementptr inbounds [64 x [64 x float]], ptr %arg4, i32 0, i32 %278, i32 %277
  %output = load float, ptr %38, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true167:                   ; preds = %reduction_write_output-after
  %279 = mul i32 %thread_id.y, 2
  %280 = add i32 %tile_origin.1, %thread_id.x
  %281 = add i32 %tile_origin.2, %279
  %282 = add i32 %281, 1
  %283 = mul i32 %tile_origin.0, 64
  %284 = add i32 %283, %282
  %285 = udiv i32 %284, 1
  %286 = urem i32 %285, 64
  %287 = udiv i32 %284, 64
  %output_element_address169 = getelementptr inbounds [64 x [64 x float]], ptr %arg4, i32 0, i32 %287, i32 %286
  %output170 = load float, ptr %57, align 4
  store float %output170, ptr %output_element_address169, align 4
  br label %reduction_write_output-after168

reduction_write_output-true189:                   ; preds = %reduction_write_output-after168
  %288 = mul i32 %thread_id.y, 2
  %289 = add i32 %tile_origin.1, %thread_id.x
  %290 = add i32 %tile_origin.2, %288
  %291 = add i32 %290, 0
  %292 = mul i32 %tile_origin.0, 64
  %293 = add i32 %292, %291
  %294 = udiv i32 %293, 1
  %295 = urem i32 %294, 64
  %296 = udiv i32 %293, 64
  %output_element_address191 = getelementptr inbounds [64 x [64 x float]], ptr %arg6, i32 0, i32 %296, i32 %295
  %output192 = load float, ptr %76, align 4
  store float %output192, ptr %output_element_address191, align 4
  br label %reduction_write_output-after190

reduction_write_output-true211:                   ; preds = %reduction_write_output-after190
  %297 = mul i32 %thread_id.y, 2
  %298 = add i32 %tile_origin.1, %thread_id.x
  %299 = add i32 %tile_origin.2, %297
  %300 = add i32 %299, 1
  %301 = mul i32 %tile_origin.0, 64
  %302 = add i32 %301, %300
  %303 = udiv i32 %302, 1
  %304 = urem i32 %303, 64
  %305 = udiv i32 %302, 64
  %output_element_address213 = getelementptr inbounds [64 x [64 x float]], ptr %arg6, i32 0, i32 %305, i32 %304
  %output214 = load float, ptr %95, align 4
  store float %output214, ptr %output_element_address213, align 4
  br label %reduction_write_output-after212
}

define internal void @region_1_19(ptr dereferenceable(4) %Arg_0.20.typed, ptr dereferenceable(4) %Arg_1.21.typed, ptr dereferenceable(4) %output_arg) {
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

define internal void @region_2_28(ptr dereferenceable(4) %Arg_0.29.typed, ptr dereferenceable(4) %Arg_1.30.typed, ptr dereferenceable(4) %output_arg) {
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

define void @fusion_36(ptr noalias align 128 dereferenceable(4194304) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(4194304) %arg3) {
entry:
  %return_buffer58 = alloca float, align 4
  %result_from_other_lane56 = alloca float, align 4
  %return_buffer55 = alloca float, align 4
  %result_from_other_lane53 = alloca float, align 4
  %return_buffer52 = alloca float, align 4
  %result_from_other_lane50 = alloca float, align 4
  %return_buffer49 = alloca float, align 4
  %result_from_other_lane47 = alloca float, align 4
  %return_buffer46 = alloca float, align 4
  %result_from_other_lane44 = alloca float, align 4
  %return_buffer40 = alloca float, align 4
  %result_from_other_lane38 = alloca float, align 4
  %return_buffer37 = alloca float, align 4
  %result_from_other_lane35 = alloca float, align 4
  %return_buffer34 = alloca float, align 4
  %result_from_other_lane32 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane29 = alloca float, align 4
  %return_buffer28 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !60
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after60, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_15_constant_8 = load float, ptr @10, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_15_constant_8, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_15_constant_8, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !84
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 128
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
  %tile_bound = select i1 %17, i32 128, i32 4096
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after13, %y_in_tile.loop_body
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
  %x_loc11 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc11
  %33 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %33, label %x_in_tile-true12, label %x_in_tile-after13

x_in_tile-after13:                                ; preds = %x_in_tile-true12, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !85

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !86

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result27 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane, ptr %return_buffer28)
  %38 = load float, ptr %return_buffer28, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result30 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane29, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane29, ptr %return_buffer31)
  %40 = load float, ptr %return_buffer31, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result33 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result33, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane32, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane32, ptr %return_buffer34)
  %42 = load float, ptr %return_buffer34, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result36 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result36, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane35, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane35, ptr %return_buffer37)
  %44 = load float, ptr %return_buffer37, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result39 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result39, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane38, align 4
  call void @region_1_9__1(ptr %36, ptr %result_from_other_lane38, ptr %return_buffer40)
  %46 = load float, ptr %return_buffer40, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address41 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address41 to ptr
  %current_output42 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output42, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr43 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache5, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr43 to ptr
  %partial_reduction_result45 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result45, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane44, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane44, ptr %return_buffer46)
  %57 = load float, ptr %return_buffer46, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result48 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result48, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane47, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane47, ptr %return_buffer49)
  %59 = load float, ptr %return_buffer49, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result51 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result51, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane50, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane50, ptr %return_buffer52)
  %61 = load float, ptr %return_buffer52, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result54 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result54, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane53, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane53, ptr %return_buffer55)
  %63 = load float, ptr %return_buffer55, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result57 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result57, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane56, align 4
  call void @region_1_9__1(ptr %55, ptr %result_from_other_lane56, ptr %return_buffer58)
  %65 = load float, ptr %return_buffer58, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true59, label %reduction_write_output-after60

reduction_write_output-after60:                   ; preds = %reduction_write_output-true59, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 128
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 16384
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 128
  %80 = udiv i32 %77, 128
  %81 = urem i32 %80, 128
  %82 = udiv i32 %77, 16384
  %83 = mul i32 %thread_id.x, 2
  %84 = sub i32 %x_loc, %83
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = udiv i32 %86, 128
  %88 = mul nuw nsw i32 %81, 1
  %89 = add nuw nsw i32 0, %88
  %90 = mul nuw nsw i32 %82, 128
  %91 = add nuw nsw i32 %89, %90
  %92 = udiv i32 %91, 8192
  %Arg_1.2 = getelementptr inbounds [8192 x [128 x float]], ptr %arg1, i32 0, i32 %91, i32 %86
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !65
  %region_0_15_constant_3 = load float, ptr @9, align 4
  %compare.5 = fcmp ogt float %Arg_1.23, %region_0_15_constant_3
  %93 = zext i1 %compare.5 to i8
  %Arg_0.1 = getelementptr inbounds [8192 x [128 x float]], ptr %arg0, i32 0, i32 %91, i32 %86
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  %94 = trunc i8 %93 to i1
  %95 = select i1 %94, float %Arg_0.14, float %region_0_15_constant_3
  store float %95, ptr %reduction_input_address, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %84
  call void @region_1_9__1(ptr %96, ptr %reduction_input_address, ptr %return_buffer)
  %97 = load float, ptr %return_buffer, align 4
  store float %97, ptr %96, align 4
  %98 = mul nuw nsw i32 %79, 1
  %99 = add nuw nsw i32 0, %98
  %100 = udiv i32 %99, 128
  %101 = mul nuw nsw i32 %81, 1
  %102 = add nuw nsw i32 0, %101
  %103 = mul nuw nsw i32 %82, 128
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 8192
  %Arg_1.25 = getelementptr inbounds float, ptr %arg1, i32 %77
  %Arg_1.26 = load float, ptr %Arg_1.25, align 4, !invariant.load !65
  %region_0_15_constant_37 = load float, ptr @9, align 4
  %compare.58 = fcmp ogt float %Arg_1.26, %region_0_15_constant_37
  %106 = zext i1 %compare.58 to i8
  %Arg_0.19 = getelementptr inbounds float, ptr %arg0, i32 %77
  %Arg_0.110 = load float, ptr %Arg_0.19, align 4, !invariant.load !65
  %107 = trunc i8 %106 to i1
  %108 = select i1 %107, float %Arg_0.110, float %region_0_15_constant_37
  %109 = mul nuw nsw i32 %79, 1
  %110 = add nuw nsw i32 0, %109
  %111 = udiv i32 %110, 128
  %112 = mul nuw nsw i32 %81, 1
  %113 = add nuw nsw i32 0, %112
  %114 = mul nuw nsw i32 %82, 128
  %115 = add nuw nsw i32 %113, %114
  %116 = udiv i32 %115, 8192
  %117 = getelementptr inbounds [8192 x [128 x float]], ptr %arg3, i32 0, i32 %115, i32 %110
  store float %108, ptr %117, align 4
  br label %x_in_tile-after

x_in_tile-true12:                                 ; preds = %x_in_tile-after
  %118 = mul nuw nsw i32 %32, 1
  %119 = add nuw nsw i32 0, %118
  %120 = mul nuw nsw i32 %31, 128
  %121 = add nuw nsw i32 %119, %120
  %122 = mul nuw nsw i32 %tile_origin.0, 16384
  %123 = add nuw nsw i32 %121, %122
  %124 = udiv i32 %123, 1
  %125 = urem i32 %124, 128
  %126 = udiv i32 %123, 128
  %127 = urem i32 %126, 128
  %128 = udiv i32 %123, 16384
  %129 = mul i32 %thread_id.x, 2
  %130 = sub i32 %x_loc11, %129
  %131 = mul nuw nsw i32 %125, 1
  %132 = add nuw nsw i32 0, %131
  %133 = udiv i32 %132, 128
  %134 = mul nuw nsw i32 %127, 1
  %135 = add nuw nsw i32 0, %134
  %136 = mul nuw nsw i32 %128, 128
  %137 = add nuw nsw i32 %135, %136
  %138 = udiv i32 %137, 8192
  %Arg_1.214 = getelementptr inbounds [8192 x [128 x float]], ptr %arg1, i32 0, i32 %137, i32 %132
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !65
  %region_0_15_constant_316 = load float, ptr @9, align 4
  %compare.517 = fcmp ogt float %Arg_1.215, %region_0_15_constant_316
  %139 = zext i1 %compare.517 to i8
  %Arg_0.118 = getelementptr inbounds [8192 x [128 x float]], ptr %arg0, i32 0, i32 %137, i32 %132
  %Arg_0.119 = load float, ptr %Arg_0.118, align 4, !invariant.load !65
  %140 = trunc i8 %139 to i1
  %141 = select i1 %140, float %Arg_0.119, float %region_0_15_constant_316
  store float %141, ptr %reduction_input_address, align 4
  %142 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %130
  call void @region_1_9__1(ptr %142, ptr %reduction_input_address, ptr %return_buffer20)
  %143 = load float, ptr %return_buffer20, align 4
  store float %143, ptr %142, align 4
  %144 = mul nuw nsw i32 %125, 1
  %145 = add nuw nsw i32 0, %144
  %146 = udiv i32 %145, 128
  %147 = mul nuw nsw i32 %127, 1
  %148 = add nuw nsw i32 0, %147
  %149 = mul nuw nsw i32 %128, 128
  %150 = add nuw nsw i32 %148, %149
  %151 = udiv i32 %150, 8192
  %Arg_1.221 = getelementptr inbounds float, ptr %arg1, i32 %123
  %Arg_1.222 = load float, ptr %Arg_1.221, align 4, !invariant.load !65
  %region_0_15_constant_323 = load float, ptr @9, align 4
  %compare.524 = fcmp ogt float %Arg_1.222, %region_0_15_constant_323
  %152 = zext i1 %compare.524 to i8
  %Arg_0.125 = getelementptr inbounds float, ptr %arg0, i32 %123
  %Arg_0.126 = load float, ptr %Arg_0.125, align 4, !invariant.load !65
  %153 = trunc i8 %152 to i1
  %154 = select i1 %153, float %Arg_0.126, float %region_0_15_constant_323
  %155 = mul nuw nsw i32 %125, 1
  %156 = add nuw nsw i32 0, %155
  %157 = udiv i32 %156, 128
  %158 = mul nuw nsw i32 %127, 1
  %159 = add nuw nsw i32 0, %158
  %160 = mul nuw nsw i32 %128, 128
  %161 = add nuw nsw i32 %159, %160
  %162 = udiv i32 %161, 8192
  %163 = getelementptr inbounds [8192 x [128 x float]], ptr %arg3, i32 0, i32 %161, i32 %156
  store float %154, ptr %163, align 4
  br label %x_in_tile-after13

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %164 = mul i32 %thread_id.y, 2
  %165 = add i32 %tile_origin.1, %thread_id.x
  %166 = add i32 %tile_origin.2, %164
  %167 = add i32 %166, 0
  %168 = mul i32 %tile_origin.0, 128
  %169 = add i32 %168, %167
  %170 = udiv i32 %169, 1
  %171 = urem i32 %170, 128
  %172 = udiv i32 %169, 128
  %output_element_address = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %172, i32 %171
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true59:                    ; preds = %reduction_write_output-after
  %173 = mul i32 %thread_id.y, 2
  %174 = add i32 %tile_origin.1, %thread_id.x
  %175 = add i32 %tile_origin.2, %173
  %176 = add i32 %175, 1
  %177 = mul i32 %tile_origin.0, 128
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %180 = urem i32 %179, 128
  %181 = udiv i32 %178, 128
  %output_element_address61 = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %181, i32 %180
  %output62 = load float, ptr %55, align 4
  store float %output62, ptr %output_element_address61, align 4
  br label %reduction_write_output-after60
}

define internal void @region_1_9__1(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_54(ptr noalias align 128 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(32768) %arg2, ptr noalias align 128 dereferenceable(512) %arg3, ptr noalias align 128 dereferenceable(512) %arg4) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !87
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after122, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !65
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %3, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %7 = urem i32 %5, 1024
  %8 = udiv i32 %5, 1024
  %9 = mul i32 %6, 1
  %10 = add i32 %9, %8
  %11 = icmp ult i32 %10, 2
  br i1 %11, label %12, label %early_return

12:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %7, 32
  %thread_id.y = udiv i32 %7, 32
  %lane_id = urem i32 %7, 32
  %13 = udiv i32 %10, 1
  %14 = urem i32 %13, 2
  %15 = udiv i32 %10, 2
  %16 = urem i32 %15, 1
  %17 = udiv i32 %10, 2
  %18 = icmp eq i32 %16, 0
  %tile_bound = select i1 %18, i32 64, i32 4096
  %19 = icmp eq i32 %14, 1
  %tile_bound1 = select i1 %19, i32 64, i32 64
  %tile_origin.0 = mul i32 %17, 1
  %tile_origin.1 = mul i32 %16, 4096
  %tile_origin.2 = mul i32 %14, 64
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
  %22 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %23 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %23, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %24 = icmp eq i32 %tile_loop.indvar, 0
  %25 = mul i32 %tile_loop.indvar, 2
  %26 = add i32 %25, 0
  %x_loc = add i32 %26, %22
  %27 = add i32 %tile_origin.1, %y_in_tile.indvar
  %28 = add i32 %tile_origin.2, %x_loc
  %29 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %29, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %30 = mul i32 %tile_loop.indvar, 2
  %31 = add i32 %30, 1
  %x_loc4 = add i32 %31, %22
  %32 = add i32 %tile_origin.1, %y_in_tile.indvar
  %33 = add i32 %tile_origin.2, %x_loc4
  %34 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %34, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !88

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !89

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %35 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %36 = load float, ptr %current_output, align 4
  store float %36, ptr %35, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %37 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %37, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %38, ptr %result_from_other_lane, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane, ptr %return_buffer11)
  %39 = load float, ptr %return_buffer11, align 4
  store float %39, ptr %37, align 4
  %partial_reduction_result13 = load float, ptr %37, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %40, ptr %result_from_other_lane12, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane12, ptr %return_buffer14)
  %41 = load float, ptr %return_buffer14, align 4
  store float %41, ptr %37, align 4
  %partial_reduction_result16 = load float, ptr %37, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %42, ptr %result_from_other_lane15, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane15, ptr %return_buffer17)
  %43 = load float, ptr %return_buffer17, align 4
  store float %43, ptr %37, align 4
  %partial_reduction_result19 = load float, ptr %37, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %44, ptr %result_from_other_lane18, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane18, ptr %return_buffer20)
  %45 = load float, ptr %return_buffer20, align 4
  store float %45, ptr %37, align 4
  %partial_reduction_result22 = load float, ptr %37, align 4
  %46 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %46, ptr %result_from_other_lane21, align 4
  call void @region_1_4(ptr %37, ptr %result_from_other_lane21, ptr %return_buffer23)
  %47 = load float, ptr %return_buffer23, align 4
  store float %47, ptr %37, align 4
  %48 = icmp ult i32 %thread_id.x, %tile_bound
  %49 = mul i32 %thread_id.y, 2
  %50 = icmp ult i32 %49, %tile_bound1
  %51 = and i1 %50, %48
  %52 = icmp eq i32 %lane_id, 0
  %53 = and i1 %51, %52
  br i1 %53, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %8, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %54 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %55 = load float, ptr %current_output25, align 4
  store float %55, ptr %54, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache6, i32 0, i32 %8, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %56 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %56, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %57, ptr %result_from_other_lane27, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane27, ptr %return_buffer29)
  %58 = load float, ptr %return_buffer29, align 4
  store float %58, ptr %56, align 4
  %partial_reduction_result31 = load float, ptr %56, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %59, ptr %result_from_other_lane30, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane30, ptr %return_buffer32)
  %60 = load float, ptr %return_buffer32, align 4
  store float %60, ptr %56, align 4
  %partial_reduction_result34 = load float, ptr %56, align 4
  %61 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %61, ptr %result_from_other_lane33, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane33, ptr %return_buffer35)
  %62 = load float, ptr %return_buffer35, align 4
  store float %62, ptr %56, align 4
  %partial_reduction_result37 = load float, ptr %56, align 4
  %63 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %63, ptr %result_from_other_lane36, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane36, ptr %return_buffer38)
  %64 = load float, ptr %return_buffer38, align 4
  store float %64, ptr %56, align 4
  %partial_reduction_result40 = load float, ptr %56, align 4
  %65 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %65, ptr %result_from_other_lane39, align 4
  call void @region_1_4(ptr %56, ptr %result_from_other_lane39, ptr %return_buffer41)
  %66 = load float, ptr %return_buffer41, align 4
  store float %66, ptr %56, align 4
  %67 = icmp ult i32 %thread_id.x, %tile_bound
  %68 = mul i32 %thread_id.y, 2
  %69 = icmp ult i32 %68, %tile_bound1
  %70 = and i1 %69, %67
  %71 = icmp eq i32 %lane_id, 0
  %72 = and i1 %70, %71
  br i1 %72, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %73 = mul i32 %thread_id.x, 2
  %74 = sub i32 %x_loc, %73
  %Arg_0.1 = getelementptr inbounds [64 x [128 x float]], ptr %arg0, i32 0, i32 %27, i32 %28
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %74
  call void @region_1_4(ptr %75, ptr %reduction_input_address, ptr %return_buffer)
  %76 = load float, ptr %return_buffer, align 4
  store float %76, ptr %75, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %77 = mul i32 %thread_id.x, 2
  %78 = sub i32 %x_loc4, %77
  %Arg_0.17 = getelementptr inbounds [64 x [128 x float]], ptr %arg0, i32 0, i32 %32, i32 %33
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !65
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %79 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %78
  call void @region_1_4(ptr %79, ptr %reduction_input_address, ptr %return_buffer9)
  %80 = load float, ptr %return_buffer9, align 4
  store float %80, ptr %79, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %81 = mul i32 %thread_id.y, 2
  %82 = add i32 %tile_origin.1, %thread_id.x
  %83 = add i32 %tile_origin.2, %81
  %84 = add i32 %83, 0
  %85 = mul i32 %tile_origin.0, 128
  %86 = add i32 %85, %84
  %87 = udiv i32 %86, 1
  %output_element_address = getelementptr inbounds [128 x float], ptr %arg3, i32 0, i32 %87
  %output = load float, ptr %37, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %88 = mul i32 %thread_id.y, 2
  %89 = add i32 %tile_origin.1, %thread_id.x
  %90 = add i32 %tile_origin.2, %88
  %91 = add i32 %90, 1
  %92 = mul i32 %tile_origin.0, 128
  %93 = add i32 %92, %91
  %94 = udiv i32 %93, 1
  %output_element_address44 = getelementptr inbounds [128 x float], ptr %arg3, i32 0, i32 %94
  %output45 = load float, ptr %56, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.248 = load float, ptr %arg1, align 4, !invariant.load !65
  %95 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  store float %Arg_1.248, ptr %95, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  store float %Arg_1.248, ptr %96, align 4
  %97 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %98 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !87
  %99 = urem i32 %97, 1024
  %100 = udiv i32 %97, 1024
  %101 = mul i32 %98, 1
  %102 = add i32 %101, %100
  %103 = icmp ult i32 %102, 2
  br i1 %103, label %104, label %early_return49

104:                                              ; preds = %reduce-group-1-true
  %thread_id.x50 = urem i32 %99, 32
  %thread_id.y51 = udiv i32 %99, 32
  %lane_id52 = urem i32 %99, 32
  %105 = udiv i32 %102, 1
  %106 = urem i32 %105, 2
  %107 = udiv i32 %102, 2
  %108 = urem i32 %107, 1
  %109 = udiv i32 %102, 2
  %110 = icmp eq i32 %108, 0
  %tile_bound53 = select i1 %110, i32 64, i32 4096
  %111 = icmp eq i32 %106, 1
  %tile_bound54 = select i1 %111, i32 64, i32 64
  %tile_origin.055 = mul i32 %109, 1
  %tile_origin.156 = mul i32 %108, 4096
  %tile_origin.257 = mul i32 %106, 64
  store i32 %thread_id.y51, ptr %y_in_tile.invar_address61, align 4
  br label %y_in_tile.loop_header59

y_in_tile.loop_header59:                          ; preds = %tile_loop.loop_exit64, %104
  %y_in_tile.indvar62 = load i32, ptr %y_in_tile.invar_address61, align 4
  %112 = icmp uge i32 %y_in_tile.indvar62, %tile_bound53
  br i1 %112, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_body60:                            ; preds = %y_in_tile.loop_header59
  %invar.inc63 = add nuw nsw i32 %y_in_tile.indvar62, 32
  store i32 %invar.inc63, ptr %y_in_tile.invar_address61, align 4
  %113 = icmp eq i32 %y_in_tile.indvar62, %thread_id.y51
  %114 = mul i32 %thread_id.x50, 2
  store i32 0, ptr %tile_loop.invar_address67, align 4
  br label %tile_loop.loop_header65

tile_loop.loop_header65:                          ; preds = %x_in_tile-after77, %y_in_tile.loop_body60
  %tile_loop.indvar68 = load i32, ptr %tile_loop.invar_address67, align 4
  %115 = icmp uge i32 %tile_loop.indvar68, 1
  br i1 %115, label %tile_loop.loop_exit64, label %tile_loop.loop_body66

tile_loop.loop_body66:                            ; preds = %tile_loop.loop_header65
  %invar.inc69 = add nuw nsw i32 %tile_loop.indvar68, 1
  store i32 %invar.inc69, ptr %tile_loop.invar_address67, align 4
  %116 = icmp eq i32 %tile_loop.indvar68, 0
  %117 = mul i32 %tile_loop.indvar68, 2
  %118 = add i32 %117, 0
  %x_loc70 = add i32 %118, %114
  %119 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %120 = add i32 %tile_origin.257, %x_loc70
  %121 = icmp ult i32 %x_loc70, %tile_bound54
  br i1 %121, label %x_in_tile-true71, label %x_in_tile-after72

x_in_tile-after72:                                ; preds = %x_in_tile-true71, %tile_loop.loop_body66
  %122 = mul i32 %tile_loop.indvar68, 2
  %123 = add i32 %122, 1
  %x_loc75 = add i32 %123, %114
  %124 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %125 = add i32 %tile_origin.257, %x_loc75
  %126 = icmp ult i32 %x_loc75, %tile_bound54
  br i1 %126, label %x_in_tile-true76, label %x_in_tile-after77

x_in_tile-after77:                                ; preds = %x_in_tile-true76, %x_in_tile-after72
  br label %tile_loop.loop_header65, !llvm.loop !90

tile_loop.loop_exit64:                            ; preds = %tile_loop.loop_header65
  br label %y_in_tile.loop_header59, !llvm.loop !91

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_header59
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %100, i32 0, i32 %thread_id.x50, i32 %thread_id.y51
  %127 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  %128 = load float, ptr %current_output82, align 4
  store float %128, ptr %127, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %100, i32 0, i32 %thread_id.y51, i32 %thread_id.x50
  %129 = addrspacecast ptr addrspace(3) %shmem_transposed_addr83 to ptr
  %partial_reduction_result85 = load float, ptr %129, align 4
  %130 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  store float %130, ptr %result_from_other_lane84, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane84, ptr %return_buffer86)
  %131 = load float, ptr %return_buffer86, align 4
  store float %131, ptr %129, align 4
  %partial_reduction_result88 = load float, ptr %129, align 4
  %132 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 8, i32 31)
  store float %132, ptr %result_from_other_lane87, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane87, ptr %return_buffer89)
  %133 = load float, ptr %return_buffer89, align 4
  store float %133, ptr %129, align 4
  %partial_reduction_result91 = load float, ptr %129, align 4
  %134 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result91, i32 4, i32 31)
  store float %134, ptr %result_from_other_lane90, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane90, ptr %return_buffer92)
  %135 = load float, ptr %return_buffer92, align 4
  store float %135, ptr %129, align 4
  %partial_reduction_result94 = load float, ptr %129, align 4
  %136 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result94, i32 2, i32 31)
  store float %136, ptr %result_from_other_lane93, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane93, ptr %return_buffer95)
  %137 = load float, ptr %return_buffer95, align 4
  store float %137, ptr %129, align 4
  %partial_reduction_result97 = load float, ptr %129, align 4
  %138 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result97, i32 1, i32 31)
  store float %138, ptr %result_from_other_lane96, align 4
  call void @region_2_9(ptr %129, ptr %result_from_other_lane96, ptr %return_buffer98)
  %139 = load float, ptr %return_buffer98, align 4
  store float %139, ptr %129, align 4
  %140 = icmp ult i32 %thread_id.x50, %tile_bound53
  %141 = mul i32 %thread_id.y51, 2
  %142 = icmp ult i32 %141, %tile_bound54
  %143 = and i1 %142, %140
  %144 = icmp eq i32 %lane_id52, 0
  %145 = and i1 %143, %144
  br i1 %145, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %y_in_tile.loop_exit58
  %shmem_output_address103 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %100, i32 1, i32 %thread_id.x50, i32 %thread_id.y51
  %146 = addrspacecast ptr addrspace(3) %shmem_output_address103 to ptr
  %current_output104 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  %147 = load float, ptr %current_output104, align 4
  store float %147, ptr %146, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache7, i32 0, i32 %100, i32 1, i32 %thread_id.y51, i32 %thread_id.x50
  %148 = addrspacecast ptr addrspace(3) %shmem_transposed_addr105 to ptr
  %partial_reduction_result107 = load float, ptr %148, align 4
  %149 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  store float %149, ptr %result_from_other_lane106, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane106, ptr %return_buffer108)
  %150 = load float, ptr %return_buffer108, align 4
  store float %150, ptr %148, align 4
  %partial_reduction_result110 = load float, ptr %148, align 4
  %151 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result110, i32 8, i32 31)
  store float %151, ptr %result_from_other_lane109, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane109, ptr %return_buffer111)
  %152 = load float, ptr %return_buffer111, align 4
  store float %152, ptr %148, align 4
  %partial_reduction_result113 = load float, ptr %148, align 4
  %153 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result113, i32 4, i32 31)
  store float %153, ptr %result_from_other_lane112, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane112, ptr %return_buffer114)
  %154 = load float, ptr %return_buffer114, align 4
  store float %154, ptr %148, align 4
  %partial_reduction_result116 = load float, ptr %148, align 4
  %155 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result116, i32 2, i32 31)
  store float %155, ptr %result_from_other_lane115, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane115, ptr %return_buffer117)
  %156 = load float, ptr %return_buffer117, align 4
  store float %156, ptr %148, align 4
  %partial_reduction_result119 = load float, ptr %148, align 4
  %157 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result119, i32 1, i32 31)
  store float %157, ptr %result_from_other_lane118, align 4
  call void @region_2_9(ptr %148, ptr %result_from_other_lane118, ptr %return_buffer120)
  %158 = load float, ptr %return_buffer120, align 4
  store float %158, ptr %148, align 4
  %159 = icmp ult i32 %thread_id.x50, %tile_bound53
  %160 = mul i32 %thread_id.y51, 2
  %161 = icmp ult i32 %160, %tile_bound54
  %162 = and i1 %161, %159
  %163 = icmp eq i32 %lane_id52, 0
  %164 = and i1 %162, %163
  br i1 %164, label %reduction_write_output-true121, label %reduction_write_output-after122

reduction_write_output-after122:                  ; preds = %reduction_write_output-true121, %reduction_write_output-after100
  br label %reduce-group-1-after

early_return49:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true71:                                 ; preds = %tile_loop.loop_body66
  %165 = mul i32 %thread_id.x50, 2
  %166 = sub i32 %x_loc70, %165
  %Arg_2.3 = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %119, i32 %120
  %Arg_2.373 = load float, ptr %Arg_2.3, align 4, !invariant.load !65
  store float %Arg_2.373, ptr %reduction_input_address46, align 4
  %167 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %166
  call void @region_2_9(ptr %167, ptr %reduction_input_address46, ptr %return_buffer74)
  %168 = load float, ptr %return_buffer74, align 4
  store float %168, ptr %167, align 4
  br label %x_in_tile-after72

x_in_tile-true76:                                 ; preds = %x_in_tile-after72
  %169 = mul i32 %thread_id.x50, 2
  %170 = sub i32 %x_loc75, %169
  %Arg_2.378 = getelementptr inbounds [64 x [128 x float]], ptr %arg2, i32 0, i32 %124, i32 %125
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !65
  store float %Arg_2.379, ptr %reduction_input_address46, align 4
  %171 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %170
  call void @region_2_9(ptr %171, ptr %reduction_input_address46, ptr %return_buffer80)
  %172 = load float, ptr %return_buffer80, align 4
  store float %172, ptr %171, align 4
  br label %x_in_tile-after77

reduction_write_output-true99:                    ; preds = %y_in_tile.loop_exit58
  %173 = mul i32 %thread_id.y51, 2
  %174 = add i32 %tile_origin.156, %thread_id.x50
  %175 = add i32 %tile_origin.257, %173
  %176 = add i32 %175, 0
  %177 = mul i32 %tile_origin.055, 128
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %output_element_address101 = getelementptr inbounds [128 x float], ptr %arg4, i32 0, i32 %179
  %output102 = load float, ptr %129, align 4
  store float %output102, ptr %output_element_address101, align 4
  br label %reduction_write_output-after100

reduction_write_output-true121:                   ; preds = %reduction_write_output-after100
  %180 = mul i32 %thread_id.y51, 2
  %181 = add i32 %tile_origin.156, %thread_id.x50
  %182 = add i32 %tile_origin.257, %180
  %183 = add i32 %182, 1
  %184 = mul i32 %tile_origin.055, 128
  %185 = add i32 %184, %183
  %186 = udiv i32 %185, 1
  %output_element_address123 = getelementptr inbounds [128 x float], ptr %arg4, i32 0, i32 %186
  %output124 = load float, ptr %148, align 4
  store float %output124, ptr %output_element_address123, align 4
  br label %reduction_write_output-after122
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

define internal void @region_2_9(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_38(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 128 dereferenceable(512) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(512) %arg3, ptr noalias align 128 dereferenceable(512) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !84
  %2 = mul nuw nsw i32 %0, 128
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 128
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 128
  br i1 %4, label %fusion_38.in_bounds-true, label %fusion_38.in_bounds-after

fusion_38.in_bounds-after:                        ; preds = %fusion_38.in_bounds-true, %entry
  ret void

fusion_38.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !65
  %7 = load float, ptr %arg2, align 4, !invariant.load !65
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.7 = fmul float %7, %9
  %subtract.8 = fsub float %6, %multiply.7
  %10 = insertvalue { float, float } undef, float %subtract.8, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !65
  %13 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %14 = load float, ptr %13, align 4
  %multiply.9 = fmul float %7, %14
  %subtract.10 = fsub float %12, %multiply.9
  %15 = insertvalue { float, float } %10, float %subtract.10, 1
  %16 = extractvalue { float, float } %15, 0
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %16, ptr %17, align 4
  %18 = extractvalue { float, float } %15, 1
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %18, ptr %19, align 4
  br label %fusion_38.in_bounds-after
}

define void @fusion_51(ptr noalias align 16 dereferenceable(425984) %arg0, ptr noalias align 16 dereferenceable(31719424) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 16 dereferenceable(4) %arg3, ptr noalias align 128 dereferenceable(4194304) %arg4, ptr noalias align 128 dereferenceable(4194304) %arg5, ptr noalias align 128 dereferenceable(4194304) %arg6) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !73
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !81
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 262144
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
  %15 = icmp ult i32 %linear_index_base, 1048576
  br i1 %15, label %fusion_51.in_bounds-true, label %fusion_51.in_bounds-after

fusion_51.in_bounds-after:                        ; preds = %fusion_51.in_bounds-true, %entry
  ret void

fusion_51.in_bounds-true:                         ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 704
  %18 = mul nuw nsw i32 %17, 1
  %19 = add nuw nsw i32 0, %18
  %20 = urem i32 %19, 64
  %21 = udiv i32 %19, 64
  %22 = udiv i32 %21, 13
  %23 = mul nuw nsw i32 %16, 1
  %24 = add nuw nsw i32 0, %23
  %25 = udiv i32 %24, 8192
  %26 = mul nuw nsw i32 %20, 1
  %27 = add nuw nsw i32 0, %26
  %28 = mul nuw nsw i32 %21, 64
  %29 = add nuw nsw i32 %27, %28
  %30 = udiv i32 %29, 832
  %31 = mul nuw nsw i32 %24, 1
  %32 = add nuw nsw i32 0, %31
  %33 = udiv i32 %32, 8192
  %34 = add i32 %32, 0
  %35 = add i32 %29, 0
  %36 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %34, i32 %35
  %37 = load float, ptr %36, align 4, !invariant.load !65
  %38 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %24, i32 %21, i32 0
  %39 = load float, ptr %38, align 4, !invariant.load !65
  %multiply.9 = fmul float %37, %39
  %40 = insertvalue { float, float, float } undef, float %multiply.9, 0
  %41 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %42 = load float, ptr %41, align 4, !invariant.load !65
  %43 = load float, ptr %arg3, align 4, !invariant.load !65
  %44 = add i32 %5, 0
  %45 = add i32 %4, 448
  %46 = mul nuw nsw i32 %45, 1
  %47 = add nuw nsw i32 0, %46
  %48 = urem i32 %47, 64
  %49 = udiv i32 %47, 64
  %50 = udiv i32 %49, 13
  %51 = mul nuw nsw i32 %44, 1
  %52 = add nuw nsw i32 0, %51
  %53 = udiv i32 %52, 8192
  %54 = mul nuw nsw i32 %48, 1
  %55 = add nuw nsw i32 0, %54
  %56 = mul nuw nsw i32 %49, 64
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 832
  %59 = mul nuw nsw i32 %52, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 8192
  %62 = add i32 %60, 0
  %63 = add i32 %57, 0
  %64 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %62, i32 %63
  %65 = load float, ptr %64, align 4, !invariant.load !65
  %66 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %52, i32 %49, i32 0
  %67 = load float, ptr %66, align 4, !invariant.load !65
  %multiply.91 = fmul float %65, %67
  %multiply.14 = fmul float %43, %multiply.91
  %subtract.15 = fsub float %42, %multiply.14
  %68 = insertvalue { float, float, float } %40, float %subtract.15, 1
  %69 = add i32 %5, 0
  %70 = add i32 %4, 576
  %71 = mul nuw nsw i32 %70, 1
  %72 = add nuw nsw i32 0, %71
  %73 = urem i32 %72, 64
  %74 = udiv i32 %72, 64
  %75 = udiv i32 %74, 13
  %76 = mul nuw nsw i32 %69, 1
  %77 = add nuw nsw i32 0, %76
  %78 = udiv i32 %77, 8192
  %79 = mul nuw nsw i32 %73, 1
  %80 = add nuw nsw i32 0, %79
  %81 = mul nuw nsw i32 %74, 64
  %82 = add nuw nsw i32 %80, %81
  %83 = udiv i32 %82, 832
  %84 = mul nuw nsw i32 %77, 1
  %85 = add nuw nsw i32 0, %84
  %86 = udiv i32 %85, 8192
  %87 = add i32 %85, 0
  %88 = add i32 %82, 0
  %89 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %87, i32 %88
  %90 = load float, ptr %89, align 4, !invariant.load !65
  %91 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %77, i32 %74, i32 0
  %92 = load float, ptr %91, align 4, !invariant.load !65
  %multiply.92 = fmul float %90, %92
  %93 = insertvalue { float, float, float } %68, float %multiply.92, 2
  %94 = extractvalue { float, float, float } %93, 0
  %95 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %94, ptr %95, align 4
  %96 = extractvalue { float, float, float } %93, 1
  %97 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %96, ptr %97, align 4
  %98 = extractvalue { float, float, float } %93, 2
  %99 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %98, ptr %99, align 4
  %100 = add i32 %8, 0
  %101 = add i32 %7, 704
  %102 = mul nuw nsw i32 %101, 1
  %103 = add nuw nsw i32 0, %102
  %104 = urem i32 %103, 64
  %105 = udiv i32 %103, 64
  %106 = udiv i32 %105, 13
  %107 = mul nuw nsw i32 %100, 1
  %108 = add nuw nsw i32 0, %107
  %109 = udiv i32 %108, 8192
  %110 = mul nuw nsw i32 %104, 1
  %111 = add nuw nsw i32 0, %110
  %112 = mul nuw nsw i32 %105, 64
  %113 = add nuw nsw i32 %111, %112
  %114 = udiv i32 %113, 832
  %115 = mul nuw nsw i32 %108, 1
  %116 = add nuw nsw i32 0, %115
  %117 = udiv i32 %116, 8192
  %118 = add i32 %116, 0
  %119 = add i32 %113, 0
  %120 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %118, i32 %119
  %121 = load float, ptr %120, align 4, !invariant.load !65
  %122 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %108, i32 %105, i32 0
  %123 = load float, ptr %122, align 4, !invariant.load !65
  %multiply.93 = fmul float %121, %123
  %124 = insertvalue { float, float, float } undef, float %multiply.93, 0
  %125 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %126 = load float, ptr %125, align 4, !invariant.load !65
  %127 = load float, ptr %arg3, align 4, !invariant.load !65
  %128 = add i32 %8, 0
  %129 = add i32 %7, 448
  %130 = mul nuw nsw i32 %129, 1
  %131 = add nuw nsw i32 0, %130
  %132 = urem i32 %131, 64
  %133 = udiv i32 %131, 64
  %134 = udiv i32 %133, 13
  %135 = mul nuw nsw i32 %128, 1
  %136 = add nuw nsw i32 0, %135
  %137 = udiv i32 %136, 8192
  %138 = mul nuw nsw i32 %132, 1
  %139 = add nuw nsw i32 0, %138
  %140 = mul nuw nsw i32 %133, 64
  %141 = add nuw nsw i32 %139, %140
  %142 = udiv i32 %141, 832
  %143 = mul nuw nsw i32 %136, 1
  %144 = add nuw nsw i32 0, %143
  %145 = udiv i32 %144, 8192
  %146 = add i32 %144, 0
  %147 = add i32 %141, 0
  %148 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %146, i32 %147
  %149 = load float, ptr %148, align 4, !invariant.load !65
  %150 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %136, i32 %133, i32 0
  %151 = load float, ptr %150, align 4, !invariant.load !65
  %multiply.94 = fmul float %149, %151
  %multiply.145 = fmul float %127, %multiply.94
  %subtract.156 = fsub float %126, %multiply.145
  %152 = insertvalue { float, float, float } %124, float %subtract.156, 1
  %153 = add i32 %8, 0
  %154 = add i32 %7, 576
  %155 = mul nuw nsw i32 %154, 1
  %156 = add nuw nsw i32 0, %155
  %157 = urem i32 %156, 64
  %158 = udiv i32 %156, 64
  %159 = udiv i32 %158, 13
  %160 = mul nuw nsw i32 %153, 1
  %161 = add nuw nsw i32 0, %160
  %162 = udiv i32 %161, 8192
  %163 = mul nuw nsw i32 %157, 1
  %164 = add nuw nsw i32 0, %163
  %165 = mul nuw nsw i32 %158, 64
  %166 = add nuw nsw i32 %164, %165
  %167 = udiv i32 %166, 832
  %168 = mul nuw nsw i32 %161, 1
  %169 = add nuw nsw i32 0, %168
  %170 = udiv i32 %169, 8192
  %171 = add i32 %169, 0
  %172 = add i32 %166, 0
  %173 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %171, i32 %172
  %174 = load float, ptr %173, align 4, !invariant.load !65
  %175 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %161, i32 %158, i32 0
  %176 = load float, ptr %175, align 4, !invariant.load !65
  %multiply.97 = fmul float %174, %176
  %177 = insertvalue { float, float, float } %152, float %multiply.97, 2
  %178 = extractvalue { float, float, float } %177, 0
  %179 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %178, ptr %179, align 4
  %180 = extractvalue { float, float, float } %177, 1
  %181 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %180, ptr %181, align 4
  %182 = extractvalue { float, float, float } %177, 2
  %183 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %182, ptr %183, align 4
  %184 = add i32 %11, 0
  %185 = add i32 %10, 704
  %186 = mul nuw nsw i32 %185, 1
  %187 = add nuw nsw i32 0, %186
  %188 = urem i32 %187, 64
  %189 = udiv i32 %187, 64
  %190 = udiv i32 %189, 13
  %191 = mul nuw nsw i32 %184, 1
  %192 = add nuw nsw i32 0, %191
  %193 = udiv i32 %192, 8192
  %194 = mul nuw nsw i32 %188, 1
  %195 = add nuw nsw i32 0, %194
  %196 = mul nuw nsw i32 %189, 64
  %197 = add nuw nsw i32 %195, %196
  %198 = udiv i32 %197, 832
  %199 = mul nuw nsw i32 %192, 1
  %200 = add nuw nsw i32 0, %199
  %201 = udiv i32 %200, 8192
  %202 = add i32 %200, 0
  %203 = add i32 %197, 0
  %204 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %202, i32 %203
  %205 = load float, ptr %204, align 4, !invariant.load !65
  %206 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %192, i32 %189, i32 0
  %207 = load float, ptr %206, align 4, !invariant.load !65
  %multiply.98 = fmul float %205, %207
  %208 = insertvalue { float, float, float } undef, float %multiply.98, 0
  %209 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %210 = load float, ptr %209, align 4, !invariant.load !65
  %211 = load float, ptr %arg3, align 4, !invariant.load !65
  %212 = add i32 %11, 0
  %213 = add i32 %10, 448
  %214 = mul nuw nsw i32 %213, 1
  %215 = add nuw nsw i32 0, %214
  %216 = urem i32 %215, 64
  %217 = udiv i32 %215, 64
  %218 = udiv i32 %217, 13
  %219 = mul nuw nsw i32 %212, 1
  %220 = add nuw nsw i32 0, %219
  %221 = udiv i32 %220, 8192
  %222 = mul nuw nsw i32 %216, 1
  %223 = add nuw nsw i32 0, %222
  %224 = mul nuw nsw i32 %217, 64
  %225 = add nuw nsw i32 %223, %224
  %226 = udiv i32 %225, 832
  %227 = mul nuw nsw i32 %220, 1
  %228 = add nuw nsw i32 0, %227
  %229 = udiv i32 %228, 8192
  %230 = add i32 %228, 0
  %231 = add i32 %225, 0
  %232 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %230, i32 %231
  %233 = load float, ptr %232, align 4, !invariant.load !65
  %234 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %220, i32 %217, i32 0
  %235 = load float, ptr %234, align 4, !invariant.load !65
  %multiply.99 = fmul float %233, %235
  %multiply.1410 = fmul float %211, %multiply.99
  %subtract.1511 = fsub float %210, %multiply.1410
  %236 = insertvalue { float, float, float } %208, float %subtract.1511, 1
  %237 = add i32 %11, 0
  %238 = add i32 %10, 576
  %239 = mul nuw nsw i32 %238, 1
  %240 = add nuw nsw i32 0, %239
  %241 = urem i32 %240, 64
  %242 = udiv i32 %240, 64
  %243 = udiv i32 %242, 13
  %244 = mul nuw nsw i32 %237, 1
  %245 = add nuw nsw i32 0, %244
  %246 = udiv i32 %245, 8192
  %247 = mul nuw nsw i32 %241, 1
  %248 = add nuw nsw i32 0, %247
  %249 = mul nuw nsw i32 %242, 64
  %250 = add nuw nsw i32 %248, %249
  %251 = udiv i32 %250, 832
  %252 = mul nuw nsw i32 %245, 1
  %253 = add nuw nsw i32 0, %252
  %254 = udiv i32 %253, 8192
  %255 = add i32 %253, 0
  %256 = add i32 %250, 0
  %257 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %255, i32 %256
  %258 = load float, ptr %257, align 4, !invariant.load !65
  %259 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %245, i32 %242, i32 0
  %260 = load float, ptr %259, align 4, !invariant.load !65
  %multiply.912 = fmul float %258, %260
  %261 = insertvalue { float, float, float } %236, float %multiply.912, 2
  %262 = extractvalue { float, float, float } %261, 0
  %263 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %262, ptr %263, align 4
  %264 = extractvalue { float, float, float } %261, 1
  %265 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %264, ptr %265, align 4
  %266 = extractvalue { float, float, float } %261, 2
  %267 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %266, ptr %267, align 4
  %268 = add i32 %14, 0
  %269 = add i32 %13, 704
  %270 = mul nuw nsw i32 %269, 1
  %271 = add nuw nsw i32 0, %270
  %272 = urem i32 %271, 64
  %273 = udiv i32 %271, 64
  %274 = udiv i32 %273, 13
  %275 = mul nuw nsw i32 %268, 1
  %276 = add nuw nsw i32 0, %275
  %277 = udiv i32 %276, 8192
  %278 = mul nuw nsw i32 %272, 1
  %279 = add nuw nsw i32 0, %278
  %280 = mul nuw nsw i32 %273, 64
  %281 = add nuw nsw i32 %279, %280
  %282 = udiv i32 %281, 832
  %283 = mul nuw nsw i32 %276, 1
  %284 = add nuw nsw i32 0, %283
  %285 = udiv i32 %284, 8192
  %286 = add i32 %284, 0
  %287 = add i32 %281, 0
  %288 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %286, i32 %287
  %289 = load float, ptr %288, align 4, !invariant.load !65
  %290 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %276, i32 %273, i32 0
  %291 = load float, ptr %290, align 4, !invariant.load !65
  %multiply.913 = fmul float %289, %291
  %292 = insertvalue { float, float, float } undef, float %multiply.913, 0
  %293 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %294 = load float, ptr %293, align 4, !invariant.load !65
  %295 = load float, ptr %arg3, align 4, !invariant.load !65
  %296 = add i32 %14, 0
  %297 = add i32 %13, 448
  %298 = mul nuw nsw i32 %297, 1
  %299 = add nuw nsw i32 0, %298
  %300 = urem i32 %299, 64
  %301 = udiv i32 %299, 64
  %302 = udiv i32 %301, 13
  %303 = mul nuw nsw i32 %296, 1
  %304 = add nuw nsw i32 0, %303
  %305 = udiv i32 %304, 8192
  %306 = mul nuw nsw i32 %300, 1
  %307 = add nuw nsw i32 0, %306
  %308 = mul nuw nsw i32 %301, 64
  %309 = add nuw nsw i32 %307, %308
  %310 = udiv i32 %309, 832
  %311 = mul nuw nsw i32 %304, 1
  %312 = add nuw nsw i32 0, %311
  %313 = udiv i32 %312, 8192
  %314 = add i32 %312, 0
  %315 = add i32 %309, 0
  %316 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %314, i32 %315
  %317 = load float, ptr %316, align 4, !invariant.load !65
  %318 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %304, i32 %301, i32 0
  %319 = load float, ptr %318, align 4, !invariant.load !65
  %multiply.914 = fmul float %317, %319
  %multiply.1415 = fmul float %295, %multiply.914
  %subtract.1516 = fsub float %294, %multiply.1415
  %320 = insertvalue { float, float, float } %292, float %subtract.1516, 1
  %321 = add i32 %14, 0
  %322 = add i32 %13, 576
  %323 = mul nuw nsw i32 %322, 1
  %324 = add nuw nsw i32 0, %323
  %325 = urem i32 %324, 64
  %326 = udiv i32 %324, 64
  %327 = udiv i32 %326, 13
  %328 = mul nuw nsw i32 %321, 1
  %329 = add nuw nsw i32 0, %328
  %330 = udiv i32 %329, 8192
  %331 = mul nuw nsw i32 %325, 1
  %332 = add nuw nsw i32 0, %331
  %333 = mul nuw nsw i32 %326, 64
  %334 = add nuw nsw i32 %332, %333
  %335 = udiv i32 %334, 832
  %336 = mul nuw nsw i32 %329, 1
  %337 = add nuw nsw i32 0, %336
  %338 = udiv i32 %337, 8192
  %339 = add i32 %337, 0
  %340 = add i32 %334, 0
  %341 = getelementptr inbounds [8192 x [968 x float]], ptr %arg1, i32 0, i32 %339, i32 %340
  %342 = load float, ptr %341, align 4, !invariant.load !65
  %343 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg0, i32 0, i32 %329, i32 %326, i32 0
  %344 = load float, ptr %343, align 4, !invariant.load !65
  %multiply.917 = fmul float %342, %344
  %345 = insertvalue { float, float, float } %320, float %multiply.917, 2
  %346 = extractvalue { float, float, float } %345, 0
  %347 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %346, ptr %347, align 4
  %348 = extractvalue { float, float, float } %345, 1
  %349 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %348, ptr %349, align 4
  %350 = extractvalue { float, float, float } %345, 2
  %351 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %350, ptr %351, align 4
  br label %fusion_51.in_bounds-after
}

define void @fusion_22(ptr noalias align 16 dereferenceable(4194304) %arg0, ptr noalias align 128 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 128 dereferenceable(4194304) %arg4) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %fusion_22.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 1048576
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !92
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !84
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 128
  %7 = udiv i32 %linear_index_plus_base, 128
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 128
  %10 = udiv i32 %linear_index1, 128
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 128
  %13 = udiv i32 %linear_index2, 128
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 128
  %16 = udiv i32 %linear_index3, 128
  %17 = icmp ult i32 %linear_index_plus_base, 1048576
  br i1 %17, label %fusion_22.in_bounds-true, label %fusion_22.in_bounds-after

fusion_22.in_bounds-after:                        ; preds = %fusion_22.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !93

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

fusion_22.in_bounds-true:                         ; preds = %loop.loop_body
  %18 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  %19 = load float, ptr %18, align 4, !invariant.load !65
  %20 = load float, ptr %arg2, align 4, !invariant.load !65
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  %22 = load float, ptr %21, align 4
  %multiply.7 = fmul float %20, %22
  %subtract.8 = fsub float %19, %multiply.7
  %23 = insertvalue { float, float } undef, float %subtract.8, 0
  %24 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_plus_base
  %25 = load float, ptr %24, align 4, !invariant.load !65
  %26 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_plus_base
  %27 = load float, ptr %26, align 4
  %multiply.9 = fmul float %20, %27
  %subtract.10 = fsub float %25, %multiply.9
  %28 = insertvalue { float, float } %23, float %subtract.10, 1
  %29 = extractvalue { float, float } %28, 0
  %30 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_plus_base
  store float %29, ptr %30, align 4
  %31 = extractvalue { float, float } %28, 1
  %32 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  store float %31, ptr %32, align 4
  %33 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %34 = load float, ptr %33, align 4, !invariant.load !65
  %35 = load float, ptr %arg2, align 4, !invariant.load !65
  %36 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %37 = load float, ptr %36, align 4
  %multiply.71 = fmul float %35, %37
  %subtract.82 = fsub float %34, %multiply.71
  %38 = insertvalue { float, float } undef, float %subtract.82, 0
  %39 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %40 = load float, ptr %39, align 4, !invariant.load !65
  %41 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  %42 = load float, ptr %41, align 4
  %multiply.93 = fmul float %35, %42
  %subtract.104 = fsub float %40, %multiply.93
  %43 = insertvalue { float, float } %38, float %subtract.104, 1
  %44 = extractvalue { float, float } %43, 0
  %45 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %44, ptr %45, align 4
  %46 = extractvalue { float, float } %43, 1
  %47 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %46, ptr %47, align 4
  %48 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %49 = load float, ptr %48, align 4, !invariant.load !65
  %50 = load float, ptr %arg2, align 4, !invariant.load !65
  %51 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %52 = load float, ptr %51, align 4
  %multiply.75 = fmul float %50, %52
  %subtract.86 = fsub float %49, %multiply.75
  %53 = insertvalue { float, float } undef, float %subtract.86, 0
  %54 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %55 = load float, ptr %54, align 4, !invariant.load !65
  %56 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  %57 = load float, ptr %56, align 4
  %multiply.97 = fmul float %50, %57
  %subtract.108 = fsub float %55, %multiply.97
  %58 = insertvalue { float, float } %53, float %subtract.108, 1
  %59 = extractvalue { float, float } %58, 0
  %60 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %59, ptr %60, align 4
  %61 = extractvalue { float, float } %58, 1
  %62 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %61, ptr %62, align 4
  %63 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %64 = load float, ptr %63, align 4, !invariant.load !65
  %65 = load float, ptr %arg2, align 4, !invariant.load !65
  %66 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %67 = load float, ptr %66, align 4
  %multiply.79 = fmul float %65, %67
  %subtract.810 = fsub float %64, %multiply.79
  %68 = insertvalue { float, float } undef, float %subtract.810, 0
  %69 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %70 = load float, ptr %69, align 4, !invariant.load !65
  %71 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  %72 = load float, ptr %71, align 4
  %multiply.911 = fmul float %65, %72
  %subtract.1012 = fsub float %70, %multiply.911
  %73 = insertvalue { float, float } %68, float %subtract.1012, 1
  %74 = extractvalue { float, float } %73, 0
  %75 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %74, ptr %75, align 4
  %76 = extractvalue { float, float } %73, 1
  %77 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %76, ptr %77, align 4
  br label %fusion_22.in_bounds-after
}

define void @fusion_6(ptr noalias align 16 dereferenceable(917504) %arg0, ptr noalias align 128 dereferenceable(917504) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !94
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !81
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 57344
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
  %15 = icmp ult i32 %linear_index_base, 229376
  br i1 %15, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %fusion_6.in_bounds-true, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !65
  %18 = load float, ptr %arg2, align 4, !invariant.load !65
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  %20 = load float, ptr %19, align 4
  %multiply.5 = fmul float %18, %20
  %subtract.6 = fsub float %17, %multiply.5
  %21 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %subtract.6, ptr %21, align 4
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %23 = load float, ptr %22, align 4, !invariant.load !65
  %24 = load float, ptr %arg2, align 4, !invariant.load !65
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4
  %multiply.51 = fmul float %24, %26
  %subtract.62 = fsub float %23, %multiply.51
  %27 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %subtract.62, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4, !invariant.load !65
  %30 = load float, ptr %arg2, align 4, !invariant.load !65
  %31 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %32 = load float, ptr %31, align 4
  %multiply.53 = fmul float %30, %32
  %subtract.64 = fsub float %29, %multiply.53
  %33 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %subtract.64, ptr %33, align 4
  %34 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %35 = load float, ptr %34, align 4, !invariant.load !65
  %36 = load float, ptr %arg2, align 4, !invariant.load !65
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %multiply.55 = fmul float %36, %38
  %subtract.66 = fsub float %35, %multiply.55
  %39 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %subtract.66, ptr %39, align 4
  br label %fusion_6.in_bounds-after
}

define void @fusion_8(ptr noalias align 16 dereferenceable(262144) %arg0, ptr noalias align 128 dereferenceable(262144) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !74
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 65536
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 8
  %5 = udiv i32 %linear_index, 8
  %6 = icmp ult i32 %linear_index, 65536
  br i1 %6, label %fusion_8.in_bounds-true, label %fusion_8.in_bounds-after

fusion_8.in_bounds-after:                         ; preds = %fusion_8.in_bounds-true, %entry
  ret void

fusion_8.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_8.in_bounds-after
}

define void @fusion_2(ptr noalias align 16 dereferenceable(98304) %arg0, ptr noalias align 128 dereferenceable(98304) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !95
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 24576
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 24576
  br i1 %6, label %fusion_2.in_bounds-true, label %fusion_2.in_bounds-after

fusion_2.in_bounds-after:                         ; preds = %fusion_2.in_bounds-true, %entry
  ret void

fusion_2.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_2.in_bounds-after
}

define void @fusion(ptr noalias align 16 dereferenceable(49152) %arg0, ptr noalias align 128 dereferenceable(49152) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !96
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 12288
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 12288
  br i1 %6, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion.in_bounds-after
}

define void @fusion_7(ptr noalias align 16 dereferenceable(16384) %arg0, ptr noalias align 128 dereferenceable(16384) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !97
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 4096
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 512
  %5 = udiv i32 %linear_index, 512
  %6 = icmp ult i32 %linear_index, 4096
  br i1 %6, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %fusion_7.in_bounds-true, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_7.in_bounds-after
}

define void @fusion_52(ptr noalias align 128 dereferenceable(16384) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(16384) %arg2, ptr noalias align 128 dereferenceable(256) %arg3, ptr noalias align 128 dereferenceable(256) %arg4) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !87
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  %2 = icmp eq i32 %0, 1
  br i1 %2, label %reduce-group-1-true, label %reduce-group-1-after

reduce-group-1-after:                             ; preds = %reduction_write_output-after122, %reduce-group-0-after
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !65
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %3, align 4
  %4 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %4, align 4
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %7 = urem i32 %5, 1024
  %8 = udiv i32 %5, 1024
  %9 = mul i32 %6, 1
  %10 = add i32 %9, %8
  %11 = icmp ult i32 %10, 1
  br i1 %11, label %12, label %early_return

12:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %7, 32
  %thread_id.y = udiv i32 %7, 32
  %lane_id = urem i32 %7, 32
  %13 = udiv i32 %10, 1
  %14 = urem i32 %13, 1
  %15 = udiv i32 %10, 1
  %16 = urem i32 %15, 1
  %17 = udiv i32 %10, 1
  %18 = icmp eq i32 %16, 0
  %tile_bound = select i1 %18, i32 64, i32 4096
  %19 = icmp eq i32 %14, 0
  %tile_bound1 = select i1 %19, i32 64, i32 64
  %tile_origin.0 = mul i32 %17, 1
  %tile_origin.1 = mul i32 %16, 4096
  %tile_origin.2 = mul i32 %14, 64
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
  %22 = mul i32 %thread_id.x, 2
  store i32 0, ptr %tile_loop.invar_address, align 4
  br label %tile_loop.loop_header

tile_loop.loop_header:                            ; preds = %x_in_tile-after6, %y_in_tile.loop_body
  %tile_loop.indvar = load i32, ptr %tile_loop.invar_address, align 4
  %23 = icmp uge i32 %tile_loop.indvar, 1
  br i1 %23, label %tile_loop.loop_exit, label %tile_loop.loop_body

tile_loop.loop_body:                              ; preds = %tile_loop.loop_header
  %invar.inc2 = add nuw nsw i32 %tile_loop.indvar, 1
  store i32 %invar.inc2, ptr %tile_loop.invar_address, align 4
  %24 = icmp eq i32 %tile_loop.indvar, 0
  %25 = mul i32 %tile_loop.indvar, 2
  %26 = add i32 %25, 0
  %x_loc = add i32 %26, %22
  %27 = add i32 %tile_origin.1, %y_in_tile.indvar
  %28 = add i32 %tile_origin.2, %x_loc
  %29 = icmp ult i32 %x_loc, %tile_bound1
  br i1 %29, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body
  %30 = mul i32 %tile_loop.indvar, 2
  %31 = add i32 %30, 1
  %x_loc4 = add i32 %31, %22
  %32 = add i32 %tile_origin.1, %y_in_tile.indvar
  %33 = add i32 %tile_origin.2, %x_loc4
  %34 = icmp ult i32 %x_loc4, %tile_bound1
  br i1 %34, label %x_in_tile-true5, label %x_in_tile-after6

x_in_tile-after6:                                 ; preds = %x_in_tile-true5, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !98

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !99

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %8, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %35 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %36 = load float, ptr %current_output, align 4
  store float %36, ptr %35, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %8, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %37 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result10 = load float, ptr %37, align 4
  %38 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result10, i32 16, i32 31)
  store float %38, ptr %result_from_other_lane, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane, ptr %return_buffer11)
  %39 = load float, ptr %return_buffer11, align 4
  store float %39, ptr %37, align 4
  %partial_reduction_result13 = load float, ptr %37, align 4
  %40 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result13, i32 8, i32 31)
  store float %40, ptr %result_from_other_lane12, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane12, ptr %return_buffer14)
  %41 = load float, ptr %return_buffer14, align 4
  store float %41, ptr %37, align 4
  %partial_reduction_result16 = load float, ptr %37, align 4
  %42 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 4, i32 31)
  store float %42, ptr %result_from_other_lane15, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane15, ptr %return_buffer17)
  %43 = load float, ptr %return_buffer17, align 4
  store float %43, ptr %37, align 4
  %partial_reduction_result19 = load float, ptr %37, align 4
  %44 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 2, i32 31)
  store float %44, ptr %result_from_other_lane18, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane18, ptr %return_buffer20)
  %45 = load float, ptr %return_buffer20, align 4
  store float %45, ptr %37, align 4
  %partial_reduction_result22 = load float, ptr %37, align 4
  %46 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 1, i32 31)
  store float %46, ptr %result_from_other_lane21, align 4
  call void @region_1_4__1(ptr %37, ptr %result_from_other_lane21, ptr %return_buffer23)
  %47 = load float, ptr %return_buffer23, align 4
  store float %47, ptr %37, align 4
  %48 = icmp ult i32 %thread_id.x, %tile_bound
  %49 = mul i32 %thread_id.y, 2
  %50 = icmp ult i32 %49, %tile_bound1
  %51 = and i1 %50, %48
  %52 = icmp eq i32 %lane_id, 0
  %53 = and i1 %51, %52
  br i1 %53, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %8, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %54 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %55 = load float, ptr %current_output25, align 4
  store float %55, ptr %54, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache8, i32 0, i32 %8, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %56 = addrspacecast ptr addrspace(3) %shmem_transposed_addr26 to ptr
  %partial_reduction_result28 = load float, ptr %56, align 4
  %57 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 16, i32 31)
  store float %57, ptr %result_from_other_lane27, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane27, ptr %return_buffer29)
  %58 = load float, ptr %return_buffer29, align 4
  store float %58, ptr %56, align 4
  %partial_reduction_result31 = load float, ptr %56, align 4
  %59 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result31, i32 8, i32 31)
  store float %59, ptr %result_from_other_lane30, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane30, ptr %return_buffer32)
  %60 = load float, ptr %return_buffer32, align 4
  store float %60, ptr %56, align 4
  %partial_reduction_result34 = load float, ptr %56, align 4
  %61 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result34, i32 4, i32 31)
  store float %61, ptr %result_from_other_lane33, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane33, ptr %return_buffer35)
  %62 = load float, ptr %return_buffer35, align 4
  store float %62, ptr %56, align 4
  %partial_reduction_result37 = load float, ptr %56, align 4
  %63 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result37, i32 2, i32 31)
  store float %63, ptr %result_from_other_lane36, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane36, ptr %return_buffer38)
  %64 = load float, ptr %return_buffer38, align 4
  store float %64, ptr %56, align 4
  %partial_reduction_result40 = load float, ptr %56, align 4
  %65 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result40, i32 1, i32 31)
  store float %65, ptr %result_from_other_lane39, align 4
  call void @region_1_4__1(ptr %56, ptr %result_from_other_lane39, ptr %return_buffer41)
  %66 = load float, ptr %return_buffer41, align 4
  store float %66, ptr %56, align 4
  %67 = icmp ult i32 %thread_id.x, %tile_bound
  %68 = mul i32 %thread_id.y, 2
  %69 = icmp ult i32 %68, %tile_bound1
  %70 = and i1 %69, %67
  %71 = icmp eq i32 %lane_id, 0
  %72 = and i1 %70, %71
  br i1 %72, label %reduction_write_output-true42, label %reduction_write_output-after43

reduction_write_output-after43:                   ; preds = %reduction_write_output-true42, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %73 = mul i32 %thread_id.x, 2
  %74 = sub i32 %x_loc, %73
  %Arg_0.1 = getelementptr inbounds [64 x [64 x float]], ptr %arg0, i32 0, i32 %27, i32 %28
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %75 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %74
  call void @region_1_4__1(ptr %75, ptr %reduction_input_address, ptr %return_buffer)
  %76 = load float, ptr %return_buffer, align 4
  store float %76, ptr %75, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %77 = mul i32 %thread_id.x, 2
  %78 = sub i32 %x_loc4, %77
  %Arg_0.17 = getelementptr inbounds [64 x [64 x float]], ptr %arg0, i32 0, i32 %32, i32 %33
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !65
  store float %Arg_0.18, ptr %reduction_input_address, align 4
  %79 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %78
  call void @region_1_4__1(ptr %79, ptr %reduction_input_address, ptr %return_buffer9)
  %80 = load float, ptr %return_buffer9, align 4
  store float %80, ptr %79, align 4
  br label %x_in_tile-after6

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %81 = mul i32 %thread_id.y, 2
  %82 = add i32 %tile_origin.1, %thread_id.x
  %83 = add i32 %tile_origin.2, %81
  %84 = add i32 %83, 0
  %85 = mul i32 %tile_origin.0, 64
  %86 = add i32 %85, %84
  %87 = udiv i32 %86, 1
  %output_element_address = getelementptr inbounds [64 x float], ptr %arg3, i32 0, i32 %87
  %output = load float, ptr %37, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %88 = mul i32 %thread_id.y, 2
  %89 = add i32 %tile_origin.1, %thread_id.x
  %90 = add i32 %tile_origin.2, %88
  %91 = add i32 %90, 1
  %92 = mul i32 %tile_origin.0, 64
  %93 = add i32 %92, %91
  %94 = udiv i32 %93, 1
  %output_element_address44 = getelementptr inbounds [64 x float], ptr %arg3, i32 0, i32 %94
  %output45 = load float, ptr %56, align 4
  store float %output45, ptr %output_element_address44, align 4
  br label %reduction_write_output-after43

reduce-group-1-true:                              ; preds = %reduce-group-0-after
  %Arg_1.248 = load float, ptr %arg1, align 4, !invariant.load !65
  %95 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  store float %Arg_1.248, ptr %95, align 4
  %96 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  store float %Arg_1.248, ptr %96, align 4
  %97 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %98 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %99 = urem i32 %97, 1024
  %100 = udiv i32 %97, 1024
  %101 = mul i32 %98, 1
  %102 = add i32 %101, %100
  %103 = icmp ult i32 %102, 1
  br i1 %103, label %104, label %early_return49

104:                                              ; preds = %reduce-group-1-true
  %thread_id.x50 = urem i32 %99, 32
  %thread_id.y51 = udiv i32 %99, 32
  %lane_id52 = urem i32 %99, 32
  %105 = udiv i32 %102, 1
  %106 = urem i32 %105, 1
  %107 = udiv i32 %102, 1
  %108 = urem i32 %107, 1
  %109 = udiv i32 %102, 1
  %110 = icmp eq i32 %108, 0
  %tile_bound53 = select i1 %110, i32 64, i32 4096
  %111 = icmp eq i32 %106, 0
  %tile_bound54 = select i1 %111, i32 64, i32 64
  %tile_origin.055 = mul i32 %109, 1
  %tile_origin.156 = mul i32 %108, 4096
  %tile_origin.257 = mul i32 %106, 64
  store i32 %thread_id.y51, ptr %y_in_tile.invar_address61, align 4
  br label %y_in_tile.loop_header59

y_in_tile.loop_header59:                          ; preds = %tile_loop.loop_exit64, %104
  %y_in_tile.indvar62 = load i32, ptr %y_in_tile.invar_address61, align 4
  %112 = icmp uge i32 %y_in_tile.indvar62, %tile_bound53
  br i1 %112, label %y_in_tile.loop_exit58, label %y_in_tile.loop_body60

y_in_tile.loop_body60:                            ; preds = %y_in_tile.loop_header59
  %invar.inc63 = add nuw nsw i32 %y_in_tile.indvar62, 32
  store i32 %invar.inc63, ptr %y_in_tile.invar_address61, align 4
  %113 = icmp eq i32 %y_in_tile.indvar62, %thread_id.y51
  %114 = mul i32 %thread_id.x50, 2
  store i32 0, ptr %tile_loop.invar_address67, align 4
  br label %tile_loop.loop_header65

tile_loop.loop_header65:                          ; preds = %x_in_tile-after77, %y_in_tile.loop_body60
  %tile_loop.indvar68 = load i32, ptr %tile_loop.invar_address67, align 4
  %115 = icmp uge i32 %tile_loop.indvar68, 1
  br i1 %115, label %tile_loop.loop_exit64, label %tile_loop.loop_body66

tile_loop.loop_body66:                            ; preds = %tile_loop.loop_header65
  %invar.inc69 = add nuw nsw i32 %tile_loop.indvar68, 1
  store i32 %invar.inc69, ptr %tile_loop.invar_address67, align 4
  %116 = icmp eq i32 %tile_loop.indvar68, 0
  %117 = mul i32 %tile_loop.indvar68, 2
  %118 = add i32 %117, 0
  %x_loc70 = add i32 %118, %114
  %119 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %120 = add i32 %tile_origin.257, %x_loc70
  %121 = icmp ult i32 %x_loc70, %tile_bound54
  br i1 %121, label %x_in_tile-true71, label %x_in_tile-after72

x_in_tile-after72:                                ; preds = %x_in_tile-true71, %tile_loop.loop_body66
  %122 = mul i32 %tile_loop.indvar68, 2
  %123 = add i32 %122, 1
  %x_loc75 = add i32 %123, %114
  %124 = add i32 %tile_origin.156, %y_in_tile.indvar62
  %125 = add i32 %tile_origin.257, %x_loc75
  %126 = icmp ult i32 %x_loc75, %tile_bound54
  br i1 %126, label %x_in_tile-true76, label %x_in_tile-after77

x_in_tile-after77:                                ; preds = %x_in_tile-true76, %x_in_tile-after72
  br label %tile_loop.loop_header65, !llvm.loop !100

tile_loop.loop_exit64:                            ; preds = %tile_loop.loop_header65
  br label %y_in_tile.loop_header59, !llvm.loop !101

y_in_tile.loop_exit58:                            ; preds = %y_in_tile.loop_header59
  %shmem_output_address81 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %100, i32 0, i32 %thread_id.x50, i32 %thread_id.y51
  %127 = addrspacecast ptr addrspace(3) %shmem_output_address81 to ptr
  %current_output82 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 0
  %128 = load float, ptr %current_output82, align 4
  store float %128, ptr %127, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr83 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %100, i32 0, i32 %thread_id.y51, i32 %thread_id.x50
  %129 = addrspacecast ptr addrspace(3) %shmem_transposed_addr83 to ptr
  %partial_reduction_result85 = load float, ptr %129, align 4
  %130 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result85, i32 16, i32 31)
  store float %130, ptr %result_from_other_lane84, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane84, ptr %return_buffer86)
  %131 = load float, ptr %return_buffer86, align 4
  store float %131, ptr %129, align 4
  %partial_reduction_result88 = load float, ptr %129, align 4
  %132 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result88, i32 8, i32 31)
  store float %132, ptr %result_from_other_lane87, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane87, ptr %return_buffer89)
  %133 = load float, ptr %return_buffer89, align 4
  store float %133, ptr %129, align 4
  %partial_reduction_result91 = load float, ptr %129, align 4
  %134 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result91, i32 4, i32 31)
  store float %134, ptr %result_from_other_lane90, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane90, ptr %return_buffer92)
  %135 = load float, ptr %return_buffer92, align 4
  store float %135, ptr %129, align 4
  %partial_reduction_result94 = load float, ptr %129, align 4
  %136 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result94, i32 2, i32 31)
  store float %136, ptr %result_from_other_lane93, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane93, ptr %return_buffer95)
  %137 = load float, ptr %return_buffer95, align 4
  store float %137, ptr %129, align 4
  %partial_reduction_result97 = load float, ptr %129, align 4
  %138 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result97, i32 1, i32 31)
  store float %138, ptr %result_from_other_lane96, align 4
  call void @region_2_9__1(ptr %129, ptr %result_from_other_lane96, ptr %return_buffer98)
  %139 = load float, ptr %return_buffer98, align 4
  store float %139, ptr %129, align 4
  %140 = icmp ult i32 %thread_id.x50, %tile_bound53
  %141 = mul i32 %thread_id.y51, 2
  %142 = icmp ult i32 %141, %tile_bound54
  %143 = and i1 %142, %140
  %144 = icmp eq i32 %lane_id52, 0
  %145 = and i1 %143, %144
  br i1 %145, label %reduction_write_output-true99, label %reduction_write_output-after100

reduction_write_output-after100:                  ; preds = %reduction_write_output-true99, %y_in_tile.loop_exit58
  %shmem_output_address103 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %100, i32 1, i32 %thread_id.x50, i32 %thread_id.y51
  %146 = addrspacecast ptr addrspace(3) %shmem_output_address103 to ptr
  %current_output104 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 1
  %147 = load float, ptr %current_output104, align 4
  store float %147, ptr %146, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr105 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache9, i32 0, i32 %100, i32 1, i32 %thread_id.y51, i32 %thread_id.x50
  %148 = addrspacecast ptr addrspace(3) %shmem_transposed_addr105 to ptr
  %partial_reduction_result107 = load float, ptr %148, align 4
  %149 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result107, i32 16, i32 31)
  store float %149, ptr %result_from_other_lane106, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane106, ptr %return_buffer108)
  %150 = load float, ptr %return_buffer108, align 4
  store float %150, ptr %148, align 4
  %partial_reduction_result110 = load float, ptr %148, align 4
  %151 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result110, i32 8, i32 31)
  store float %151, ptr %result_from_other_lane109, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane109, ptr %return_buffer111)
  %152 = load float, ptr %return_buffer111, align 4
  store float %152, ptr %148, align 4
  %partial_reduction_result113 = load float, ptr %148, align 4
  %153 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result113, i32 4, i32 31)
  store float %153, ptr %result_from_other_lane112, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane112, ptr %return_buffer114)
  %154 = load float, ptr %return_buffer114, align 4
  store float %154, ptr %148, align 4
  %partial_reduction_result116 = load float, ptr %148, align 4
  %155 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result116, i32 2, i32 31)
  store float %155, ptr %result_from_other_lane115, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane115, ptr %return_buffer117)
  %156 = load float, ptr %return_buffer117, align 4
  store float %156, ptr %148, align 4
  %partial_reduction_result119 = load float, ptr %148, align 4
  %157 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result119, i32 1, i32 31)
  store float %157, ptr %result_from_other_lane118, align 4
  call void @region_2_9__1(ptr %148, ptr %result_from_other_lane118, ptr %return_buffer120)
  %158 = load float, ptr %return_buffer120, align 4
  store float %158, ptr %148, align 4
  %159 = icmp ult i32 %thread_id.x50, %tile_bound53
  %160 = mul i32 %thread_id.y51, 2
  %161 = icmp ult i32 %160, %tile_bound54
  %162 = and i1 %161, %159
  %163 = icmp eq i32 %lane_id52, 0
  %164 = and i1 %162, %163
  br i1 %164, label %reduction_write_output-true121, label %reduction_write_output-after122

reduction_write_output-after122:                  ; preds = %reduction_write_output-true121, %reduction_write_output-after100
  br label %reduce-group-1-after

early_return49:                                   ; preds = %reduce-group-1-true
  ret void

x_in_tile-true71:                                 ; preds = %tile_loop.loop_body66
  %165 = mul i32 %thread_id.x50, 2
  %166 = sub i32 %x_loc70, %165
  %Arg_2.3 = getelementptr inbounds [64 x [64 x float]], ptr %arg2, i32 0, i32 %119, i32 %120
  %Arg_2.373 = load float, ptr %Arg_2.3, align 4, !invariant.load !65
  store float %Arg_2.373, ptr %reduction_input_address46, align 4
  %167 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %166
  call void @region_2_9__1(ptr %167, ptr %reduction_input_address46, ptr %return_buffer74)
  %168 = load float, ptr %return_buffer74, align 4
  store float %168, ptr %167, align 4
  br label %x_in_tile-after72

x_in_tile-true76:                                 ; preds = %x_in_tile-after72
  %169 = mul i32 %thread_id.x50, 2
  %170 = sub i32 %x_loc75, %169
  %Arg_2.378 = getelementptr inbounds [64 x [64 x float]], ptr %arg2, i32 0, i32 %124, i32 %125
  %Arg_2.379 = load float, ptr %Arg_2.378, align 4, !invariant.load !65
  store float %Arg_2.379, ptr %reduction_input_address46, align 4
  %171 = getelementptr inbounds float, ptr %partial_reduction_result47, i32 %170
  call void @region_2_9__1(ptr %171, ptr %reduction_input_address46, ptr %return_buffer80)
  %172 = load float, ptr %return_buffer80, align 4
  store float %172, ptr %171, align 4
  br label %x_in_tile-after77

reduction_write_output-true99:                    ; preds = %y_in_tile.loop_exit58
  %173 = mul i32 %thread_id.y51, 2
  %174 = add i32 %tile_origin.156, %thread_id.x50
  %175 = add i32 %tile_origin.257, %173
  %176 = add i32 %175, 0
  %177 = mul i32 %tile_origin.055, 64
  %178 = add i32 %177, %176
  %179 = udiv i32 %178, 1
  %output_element_address101 = getelementptr inbounds [64 x float], ptr %arg4, i32 0, i32 %179
  %output102 = load float, ptr %129, align 4
  store float %output102, ptr %output_element_address101, align 4
  br label %reduction_write_output-after100

reduction_write_output-true121:                   ; preds = %reduction_write_output-after100
  %180 = mul i32 %thread_id.y51, 2
  %181 = add i32 %tile_origin.156, %thread_id.x50
  %182 = add i32 %tile_origin.257, %180
  %183 = add i32 %182, 1
  %184 = mul i32 %tile_origin.055, 64
  %185 = add i32 %184, %183
  %186 = udiv i32 %185, 1
  %output_element_address123 = getelementptr inbounds [64 x float], ptr %arg4, i32 0, i32 %186
  %output124 = load float, ptr %148, align 4
  store float %output124, ptr %output_element_address123, align 4
  br label %reduction_write_output-after122
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

define internal void @region_2_9__1(ptr dereferenceable(4) %Arg_0.10.typed, ptr dereferenceable(4) %Arg_1.11.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.12.typed = alloca float, align 4
  %Arg_0.10 = load float, ptr %Arg_0.10.typed, align 4
  %Arg_1.11 = load float, ptr %Arg_1.11.typed, align 4
  %add.12 = fadd float %Arg_0.10, %Arg_1.11
  store float %add.12, ptr %add.12.typed, align 4
  %load_ret_value = load float, ptr %add.12.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_46(ptr noalias align 16 dereferenceable(256) %arg0, ptr noalias align 128 dereferenceable(256) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(256) %arg3, ptr noalias align 128 dereferenceable(256) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !74
  %2 = mul nuw nsw i32 %0, 64
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 64
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 64
  br i1 %4, label %fusion_46.in_bounds-true, label %fusion_46.in_bounds-after

fusion_46.in_bounds-after:                        ; preds = %fusion_46.in_bounds-true, %entry
  ret void

fusion_46.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !65
  %7 = load float, ptr %arg2, align 4, !invariant.load !65
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.7 = fmul float %7, %9
  %subtract.8 = fsub float %6, %multiply.7
  %10 = insertvalue { float, float } undef, float %subtract.8, 0
  %11 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %12 = load float, ptr %11, align 4, !invariant.load !65
  %13 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  %14 = load float, ptr %13, align 4
  %multiply.9 = fmul float %7, %14
  %subtract.10 = fsub float %12, %multiply.9
  %15 = insertvalue { float, float } %10, float %subtract.10, 1
  %16 = extractvalue { float, float } %15, 0
  %17 = getelementptr inbounds float, ptr %arg4, i32 %linear_index
  store float %16, ptr %17, align 4
  %18 = extractvalue { float, float } %15, 1
  %19 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %18, ptr %19, align 4
  br label %fusion_46.in_bounds-after
}

define void @fusion_34(ptr noalias align 16 dereferenceable(65536) %arg0, ptr noalias align 128 dereferenceable(65536) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(65536) %arg3, ptr noalias align 128 dereferenceable(65536) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !102
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 16384
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 128
  %5 = udiv i32 %linear_index, 128
  %6 = icmp ult i32 %linear_index, 16384
  br i1 %6, label %fusion_34.in_bounds-true, label %fusion_34.in_bounds-after

fusion_34.in_bounds-after:                        ; preds = %fusion_34.in_bounds-true, %entry
  ret void

fusion_34.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !65
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
  br label %fusion_34.in_bounds-after
}

define void @fusion_42(ptr noalias align 16 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1, ptr noalias align 16 dereferenceable(4) %arg2, ptr noalias align 16 dereferenceable(32768) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !103
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index, 64
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion_42.in_bounds-true, label %fusion_42.in_bounds-after

fusion_42.in_bounds-after:                        ; preds = %fusion_42.in_bounds-true, %entry
  ret void

fusion_42.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.7 = fmul float %9, %11
  %subtract.8 = fsub float %8, %multiply.7
  %12 = insertvalue { float, float } undef, float %subtract.8, 0
  %13 = getelementptr inbounds float, ptr %arg3, i32 %linear_index
  %14 = load float, ptr %13, align 4, !invariant.load !65
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
  br label %fusion_42.in_bounds-after
}

define void @reduce_290(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(2048) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !60
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after43, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !65
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %Arg_1.2, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !103
  %6 = urem i32 %4, 1024
  %7 = udiv i32 %4, 1024
  %8 = mul i32 %5, 1
  %9 = add i32 %8, %7
  %10 = icmp ult i32 %9, 8
  br i1 %10, label %11, label %early_return

11:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %6, 32
  %thread_id.y = udiv i32 %6, 32
  %lane_id = urem i32 %6, 32
  %12 = udiv i32 %9, 1
  %13 = urem i32 %12, 8
  %14 = udiv i32 %9, 8
  %15 = urem i32 %14, 1
  %16 = udiv i32 %9, 8
  %17 = icmp eq i32 %15, 0
  %tile_bound = select i1 %17, i32 64, i32 4096
  %18 = icmp eq i32 %13, 7
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
  br label %tile_loop.loop_header, !llvm.loop !104

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !105

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
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
  %shmem_output_address24 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address24 to ptr
  %current_output25 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output25, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr26 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache10, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
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
  %Arg_0.1 = getelementptr inbounds [64 x [512 x float]], ptr %arg0, i32 0, i32 %26, i32 %27
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
  store float %Arg_0.13, ptr %reduction_input_address, align 4
  %74 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %73
  call void @region_1_3(ptr %74, ptr %reduction_input_address, ptr %return_buffer)
  %75 = load float, ptr %return_buffer, align 4
  store float %75, ptr %74, align 4
  br label %x_in_tile-after

x_in_tile-true5:                                  ; preds = %x_in_tile-after
  %76 = mul i32 %thread_id.x, 2
  %77 = sub i32 %x_loc4, %76
  %Arg_0.17 = getelementptr inbounds [64 x [512 x float]], ptr %arg0, i32 0, i32 %31, i32 %32
  %Arg_0.18 = load float, ptr %Arg_0.17, align 4, !invariant.load !65
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
  %84 = mul i32 %tile_origin.0, 512
  %85 = add i32 %84, %83
  %86 = udiv i32 %85, 1
  %output_element_address = getelementptr inbounds [512 x float], ptr %arg2, i32 0, i32 %86
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true42:                    ; preds = %reduction_write_output-after
  %87 = mul i32 %thread_id.y, 2
  %88 = add i32 %tile_origin.1, %thread_id.x
  %89 = add i32 %tile_origin.2, %87
  %90 = add i32 %89, 1
  %91 = mul i32 %tile_origin.0, 512
  %92 = add i32 %91, %90
  %93 = udiv i32 %92, 1
  %output_element_address44 = getelementptr inbounds [512 x float], ptr %arg2, i32 0, i32 %93
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

define void @fusion_13(ptr noalias align 16 dereferenceable(2048) %arg0, ptr noalias align 128 dereferenceable(2048) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !77
  %2 = mul nuw nsw i32 %0, 512
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 512
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 512
  br i1 %4, label %fusion_13.in_bounds-true, label %fusion_13.in_bounds-after

fusion_13.in_bounds-after:                        ; preds = %fusion_13.in_bounds-true, %entry
  ret void

fusion_13.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !65
  %7 = load float, ptr %arg2, align 4, !invariant.load !65
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.5 = fmul float %7, %9
  %subtract.6 = fsub float %6, %multiply.5
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %10, align 4
  br label %fusion_13.in_bounds-after
}

define void @fusion_16(ptr noalias align 16 dereferenceable(61440) %arg0, ptr noalias align 128 dereferenceable(61440) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !106
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 15360
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 30
  %5 = udiv i32 %linear_index, 30
  %6 = icmp ult i32 %linear_index, 15360
  br i1 %6, label %fusion_16.in_bounds-true, label %fusion_16.in_bounds-after

fusion_16.in_bounds-after:                        ; preds = %fusion_16.in_bounds-true, %entry
  ret void

fusion_16.in_bounds-true:                         ; preds = %entry
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !65
  %9 = load float, ptr %arg2, align 4, !invariant.load !65
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %11 = load float, ptr %10, align 4
  %multiply.5 = fmul float %9, %11
  %subtract.6 = fsub float %8, %multiply.5
  %12 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %12, align 4
  br label %fusion_16.in_bounds-after
}

define void @reduce_273(ptr noalias align 128 dereferenceable(7680) %arg0, ptr noalias align 128 dereferenceable(4) %arg1, ptr noalias align 128 dereferenceable(120) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !60
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %Arg_1.2 = load float, ptr %arg1, align 4, !invariant.load !65
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %Arg_1.2, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !73
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
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
  %tile_bound = select i1 %16, i32 64, i32 4096
  %17 = icmp eq i32 %12, 0
  %tile_bound1 = select i1 %17, i32 30, i32 32
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
  br label %tile_loop.loop_header, !llvm.loop !107

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !108

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
  %Arg_0.1 = getelementptr inbounds [64 x [30 x float]], ptr %arg0, i32 0, i32 %25, i32 %26
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !65
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
  %55 = mul i32 %tile_origin.0, 30
  %56 = add i32 %55, %54
  %57 = udiv i32 %56, 1
  %output_element_address = getelementptr inbounds [30 x float], ptr %arg2, i32 0, i32 %57
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

define void @fusion_17(ptr noalias align 16 dereferenceable(120) %arg0, ptr noalias align 128 dereferenceable(120) %arg1, ptr noalias align 16 dereferenceable(4) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !60
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !109
  %2 = mul nuw nsw i32 %0, 30
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 30
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 30
  br i1 %4, label %fusion_17.in_bounds-true, label %fusion_17.in_bounds-after

fusion_17.in_bounds-after:                        ; preds = %fusion_17.in_bounds-true, %entry
  ret void

fusion_17.in_bounds-true:                         ; preds = %entry
  %5 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %6 = load float, ptr %5, align 4, !invariant.load !65
  %7 = load float, ptr %arg2, align 4, !invariant.load !65
  %8 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  %9 = load float, ptr %8, align 4
  %multiply.5 = fmul float %7, %9
  %subtract.6 = fsub float %6, %multiply.5
  %10 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %subtract.6, ptr %10, align 4
  br label %fusion_17.in_bounds-after
}

define void @fusion_30(ptr noalias align 16 dereferenceable(14680064) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(425984) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 128 dereferenceable(14680064) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !110
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !81
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 917504
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 448
  %5 = udiv i32 %linear_index_base, 448
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 448
  %8 = udiv i32 %linear_index1, 448
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 448
  %11 = udiv i32 %linear_index2, 448
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 448
  %14 = udiv i32 %linear_index3, 448
  %15 = icmp ult i32 %linear_index_base, 3670016
  br i1 %15, label %fusion_30.in_bounds-true, label %fusion_30.in_bounds-after

fusion_30.in_bounds-after:                        ; preds = %fusion_30.in_bounds-true, %entry
  ret void

fusion_30.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !65
  %18 = load float, ptr %arg1, align 4, !invariant.load !65
  %19 = add i32 %5, 0
  %20 = add i32 %4, 0
  %21 = mul nuw nsw i32 %20, 1
  %22 = add nuw nsw i32 0, %21
  %23 = urem i32 %22, 64
  %24 = udiv i32 %22, 64
  %25 = udiv i32 %24, 13
  %26 = mul nuw nsw i32 %19, 1
  %27 = add nuw nsw i32 0, %26
  %28 = udiv i32 %27, 8192
  %29 = mul nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 0, %29
  %31 = mul nuw nsw i32 %24, 64
  %32 = add nuw nsw i32 %30, %31
  %33 = udiv i32 %32, 832
  %34 = mul nuw nsw i32 %27, 1
  %35 = add nuw nsw i32 0, %34
  %36 = udiv i32 %35, 8192
  %37 = add i32 %35, 0
  %38 = add i32 %32, 0
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !65
  %41 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg2, i32 0, i32 %27, i32 %24, i32 0
  %42 = load float, ptr %41, align 4, !invariant.load !65
  %multiply.10 = fmul float %40, %42
  %multiply.13 = fmul float %18, %multiply.10
  %subtract.14 = fsub float %17, %multiply.13
  %43 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %subtract.14, ptr %43, align 4
  %44 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %45 = load float, ptr %44, align 4, !invariant.load !65
  %46 = load float, ptr %arg1, align 4, !invariant.load !65
  %47 = add i32 %8, 0
  %48 = add i32 %7, 0
  %49 = mul nuw nsw i32 %48, 1
  %50 = add nuw nsw i32 0, %49
  %51 = urem i32 %50, 64
  %52 = udiv i32 %50, 64
  %53 = udiv i32 %52, 13
  %54 = mul nuw nsw i32 %47, 1
  %55 = add nuw nsw i32 0, %54
  %56 = udiv i32 %55, 8192
  %57 = mul nuw nsw i32 %51, 1
  %58 = add nuw nsw i32 0, %57
  %59 = mul nuw nsw i32 %52, 64
  %60 = add nuw nsw i32 %58, %59
  %61 = udiv i32 %60, 832
  %62 = mul nuw nsw i32 %55, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 8192
  %65 = add i32 %63, 0
  %66 = add i32 %60, 0
  %67 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %65, i32 %66
  %68 = load float, ptr %67, align 4, !invariant.load !65
  %69 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg2, i32 0, i32 %55, i32 %52, i32 0
  %70 = load float, ptr %69, align 4, !invariant.load !65
  %multiply.101 = fmul float %68, %70
  %multiply.132 = fmul float %46, %multiply.101
  %subtract.143 = fsub float %45, %multiply.132
  %71 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %subtract.143, ptr %71, align 4
  %72 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %73 = load float, ptr %72, align 4, !invariant.load !65
  %74 = load float, ptr %arg1, align 4, !invariant.load !65
  %75 = add i32 %11, 0
  %76 = add i32 %10, 0
  %77 = mul nuw nsw i32 %76, 1
  %78 = add nuw nsw i32 0, %77
  %79 = urem i32 %78, 64
  %80 = udiv i32 %78, 64
  %81 = udiv i32 %80, 13
  %82 = mul nuw nsw i32 %75, 1
  %83 = add nuw nsw i32 0, %82
  %84 = udiv i32 %83, 8192
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = mul nuw nsw i32 %80, 64
  %88 = add nuw nsw i32 %86, %87
  %89 = udiv i32 %88, 832
  %90 = mul nuw nsw i32 %83, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 8192
  %93 = add i32 %91, 0
  %94 = add i32 %88, 0
  %95 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %93, i32 %94
  %96 = load float, ptr %95, align 4, !invariant.load !65
  %97 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg2, i32 0, i32 %83, i32 %80, i32 0
  %98 = load float, ptr %97, align 4, !invariant.load !65
  %multiply.104 = fmul float %96, %98
  %multiply.135 = fmul float %74, %multiply.104
  %subtract.146 = fsub float %73, %multiply.135
  %99 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %subtract.146, ptr %99, align 4
  %100 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %101 = load float, ptr %100, align 4, !invariant.load !65
  %102 = load float, ptr %arg1, align 4, !invariant.load !65
  %103 = add i32 %14, 0
  %104 = add i32 %13, 0
  %105 = mul nuw nsw i32 %104, 1
  %106 = add nuw nsw i32 0, %105
  %107 = urem i32 %106, 64
  %108 = udiv i32 %106, 64
  %109 = udiv i32 %108, 13
  %110 = mul nuw nsw i32 %103, 1
  %111 = add nuw nsw i32 0, %110
  %112 = udiv i32 %111, 8192
  %113 = mul nuw nsw i32 %107, 1
  %114 = add nuw nsw i32 0, %113
  %115 = mul nuw nsw i32 %108, 64
  %116 = add nuw nsw i32 %114, %115
  %117 = udiv i32 %116, 832
  %118 = mul nuw nsw i32 %111, 1
  %119 = add nuw nsw i32 0, %118
  %120 = udiv i32 %119, 8192
  %121 = add i32 %119, 0
  %122 = add i32 %116, 0
  %123 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %121, i32 %122
  %124 = load float, ptr %123, align 4, !invariant.load !65
  %125 = getelementptr inbounds [8192 x [13 x [1 x float]]], ptr %arg2, i32 0, i32 %111, i32 %108, i32 0
  %126 = load float, ptr %125, align 4, !invariant.load !65
  %multiply.107 = fmul float %124, %126
  %multiply.138 = fmul float %102, %multiply.107
  %subtract.149 = fsub float %101, %multiply.138
  %127 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %subtract.149, ptr %127, align 4
  br label %fusion_30.in_bounds-after
}

define void @fusion_26(ptr noalias align 16 dereferenceable(1572864) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(557056) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 128 dereferenceable(1572864) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !111
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !81
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 98304
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 48
  %5 = udiv i32 %linear_index_base, 48
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 48
  %8 = udiv i32 %linear_index1, 48
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 48
  %11 = udiv i32 %linear_index2, 48
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 48
  %14 = udiv i32 %linear_index3, 48
  %15 = icmp ult i32 %linear_index_base, 393216
  br i1 %15, label %fusion_26.in_bounds-true, label %fusion_26.in_bounds-after

fusion_26.in_bounds-after:                        ; preds = %fusion_26.in_bounds-true, %entry
  ret void

fusion_26.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !65
  %18 = load float, ptr %arg1, align 4, !invariant.load !65
  %19 = add i32 %5, 0
  %20 = add i32 %4, 0
  %21 = mul nuw nsw i32 %20, 1
  %22 = add nuw nsw i32 0, %21
  %23 = urem i32 %22, 8
  %24 = udiv i32 %22, 8
  %25 = udiv i32 %24, 17
  %26 = mul nuw nsw i32 %19, 1
  %27 = add nuw nsw i32 0, %26
  %28 = udiv i32 %27, 8192
  %29 = mul nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 0, %29
  %31 = mul nuw nsw i32 %24, 8
  %32 = add nuw nsw i32 %30, %31
  %33 = udiv i32 %32, 136
  %34 = mul nuw nsw i32 %27, 1
  %35 = add nuw nsw i32 0, %34
  %36 = udiv i32 %35, 8192
  %37 = add i32 %35, 0
  %38 = add i32 %32, 832
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !65
  %41 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %27, i32 %24, i32 0
  %42 = load float, ptr %41, align 4, !invariant.load !65
  %multiply.10 = fmul float %40, %42
  %multiply.13 = fmul float %18, %multiply.10
  %subtract.14 = fsub float %17, %multiply.13
  %43 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %subtract.14, ptr %43, align 4
  %44 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %45 = load float, ptr %44, align 4, !invariant.load !65
  %46 = load float, ptr %arg1, align 4, !invariant.load !65
  %47 = add i32 %8, 0
  %48 = add i32 %7, 0
  %49 = mul nuw nsw i32 %48, 1
  %50 = add nuw nsw i32 0, %49
  %51 = urem i32 %50, 8
  %52 = udiv i32 %50, 8
  %53 = udiv i32 %52, 17
  %54 = mul nuw nsw i32 %47, 1
  %55 = add nuw nsw i32 0, %54
  %56 = udiv i32 %55, 8192
  %57 = mul nuw nsw i32 %51, 1
  %58 = add nuw nsw i32 0, %57
  %59 = mul nuw nsw i32 %52, 8
  %60 = add nuw nsw i32 %58, %59
  %61 = udiv i32 %60, 136
  %62 = mul nuw nsw i32 %55, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 8192
  %65 = add i32 %63, 0
  %66 = add i32 %60, 832
  %67 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %65, i32 %66
  %68 = load float, ptr %67, align 4, !invariant.load !65
  %69 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %55, i32 %52, i32 0
  %70 = load float, ptr %69, align 4, !invariant.load !65
  %multiply.101 = fmul float %68, %70
  %multiply.132 = fmul float %46, %multiply.101
  %subtract.143 = fsub float %45, %multiply.132
  %71 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %subtract.143, ptr %71, align 4
  %72 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %73 = load float, ptr %72, align 4, !invariant.load !65
  %74 = load float, ptr %arg1, align 4, !invariant.load !65
  %75 = add i32 %11, 0
  %76 = add i32 %10, 0
  %77 = mul nuw nsw i32 %76, 1
  %78 = add nuw nsw i32 0, %77
  %79 = urem i32 %78, 8
  %80 = udiv i32 %78, 8
  %81 = udiv i32 %80, 17
  %82 = mul nuw nsw i32 %75, 1
  %83 = add nuw nsw i32 0, %82
  %84 = udiv i32 %83, 8192
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = mul nuw nsw i32 %80, 8
  %88 = add nuw nsw i32 %86, %87
  %89 = udiv i32 %88, 136
  %90 = mul nuw nsw i32 %83, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 8192
  %93 = add i32 %91, 0
  %94 = add i32 %88, 832
  %95 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %93, i32 %94
  %96 = load float, ptr %95, align 4, !invariant.load !65
  %97 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %83, i32 %80, i32 0
  %98 = load float, ptr %97, align 4, !invariant.load !65
  %multiply.104 = fmul float %96, %98
  %multiply.135 = fmul float %74, %multiply.104
  %subtract.146 = fsub float %73, %multiply.135
  %99 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %subtract.146, ptr %99, align 4
  %100 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %101 = load float, ptr %100, align 4, !invariant.load !65
  %102 = load float, ptr %arg1, align 4, !invariant.load !65
  %103 = add i32 %14, 0
  %104 = add i32 %13, 0
  %105 = mul nuw nsw i32 %104, 1
  %106 = add nuw nsw i32 0, %105
  %107 = urem i32 %106, 8
  %108 = udiv i32 %106, 8
  %109 = udiv i32 %108, 17
  %110 = mul nuw nsw i32 %103, 1
  %111 = add nuw nsw i32 0, %110
  %112 = udiv i32 %111, 8192
  %113 = mul nuw nsw i32 %107, 1
  %114 = add nuw nsw i32 0, %113
  %115 = mul nuw nsw i32 %108, 8
  %116 = add nuw nsw i32 %114, %115
  %117 = udiv i32 %116, 136
  %118 = mul nuw nsw i32 %111, 1
  %119 = add nuw nsw i32 0, %118
  %120 = udiv i32 %119, 8192
  %121 = add i32 %119, 0
  %122 = add i32 %116, 832
  %123 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %121, i32 %122
  %124 = load float, ptr %123, align 4, !invariant.load !65
  %125 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %111, i32 %108, i32 0
  %126 = load float, ptr %125, align 4, !invariant.load !65
  %multiply.107 = fmul float %124, %126
  %multiply.138 = fmul float %102, %multiply.107
  %subtract.149 = fsub float %101, %multiply.138
  %127 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %subtract.149, ptr %127, align 4
  br label %fusion_26.in_bounds-after
}

define void @fusion_24(ptr noalias align 16 dereferenceable(786432) %arg0, ptr noalias align 16 dereferenceable(4) %arg1, ptr noalias align 16 dereferenceable(557056) %arg2, ptr noalias align 16 dereferenceable(31719424) %arg3, ptr noalias align 128 dereferenceable(786432) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !112
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !81
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 49152
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 24
  %5 = udiv i32 %linear_index_base, 24
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 24
  %8 = udiv i32 %linear_index1, 24
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 24
  %11 = udiv i32 %linear_index2, 24
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 24
  %14 = udiv i32 %linear_index3, 24
  %15 = icmp ult i32 %linear_index_base, 196608
  br i1 %15, label %fusion_24.in_bounds-true, label %fusion_24.in_bounds-after

fusion_24.in_bounds-after:                        ; preds = %fusion_24.in_bounds-true, %entry
  ret void

fusion_24.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !65
  %18 = load float, ptr %arg1, align 4, !invariant.load !65
  %19 = add i32 %5, 0
  %20 = add i32 %4, 112
  %21 = mul nuw nsw i32 %20, 1
  %22 = add nuw nsw i32 0, %21
  %23 = urem i32 %22, 8
  %24 = udiv i32 %22, 8
  %25 = udiv i32 %24, 17
  %26 = mul nuw nsw i32 %19, 1
  %27 = add nuw nsw i32 0, %26
  %28 = udiv i32 %27, 8192
  %29 = mul nuw nsw i32 %23, 1
  %30 = add nuw nsw i32 0, %29
  %31 = mul nuw nsw i32 %24, 8
  %32 = add nuw nsw i32 %30, %31
  %33 = udiv i32 %32, 136
  %34 = mul nuw nsw i32 %27, 1
  %35 = add nuw nsw i32 0, %34
  %36 = udiv i32 %35, 8192
  %37 = add i32 %35, 0
  %38 = add i32 %32, 832
  %39 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !65
  %41 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %27, i32 %24, i32 0
  %42 = load float, ptr %41, align 4, !invariant.load !65
  %multiply.10 = fmul float %40, %42
  %multiply.13 = fmul float %18, %multiply.10
  %subtract.14 = fsub float %17, %multiply.13
  %43 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %subtract.14, ptr %43, align 4
  %44 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %45 = load float, ptr %44, align 4, !invariant.load !65
  %46 = load float, ptr %arg1, align 4, !invariant.load !65
  %47 = add i32 %8, 0
  %48 = add i32 %7, 112
  %49 = mul nuw nsw i32 %48, 1
  %50 = add nuw nsw i32 0, %49
  %51 = urem i32 %50, 8
  %52 = udiv i32 %50, 8
  %53 = udiv i32 %52, 17
  %54 = mul nuw nsw i32 %47, 1
  %55 = add nuw nsw i32 0, %54
  %56 = udiv i32 %55, 8192
  %57 = mul nuw nsw i32 %51, 1
  %58 = add nuw nsw i32 0, %57
  %59 = mul nuw nsw i32 %52, 8
  %60 = add nuw nsw i32 %58, %59
  %61 = udiv i32 %60, 136
  %62 = mul nuw nsw i32 %55, 1
  %63 = add nuw nsw i32 0, %62
  %64 = udiv i32 %63, 8192
  %65 = add i32 %63, 0
  %66 = add i32 %60, 832
  %67 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %65, i32 %66
  %68 = load float, ptr %67, align 4, !invariant.load !65
  %69 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %55, i32 %52, i32 0
  %70 = load float, ptr %69, align 4, !invariant.load !65
  %multiply.101 = fmul float %68, %70
  %multiply.132 = fmul float %46, %multiply.101
  %subtract.143 = fsub float %45, %multiply.132
  %71 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %subtract.143, ptr %71, align 4
  %72 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %73 = load float, ptr %72, align 4, !invariant.load !65
  %74 = load float, ptr %arg1, align 4, !invariant.load !65
  %75 = add i32 %11, 0
  %76 = add i32 %10, 112
  %77 = mul nuw nsw i32 %76, 1
  %78 = add nuw nsw i32 0, %77
  %79 = urem i32 %78, 8
  %80 = udiv i32 %78, 8
  %81 = udiv i32 %80, 17
  %82 = mul nuw nsw i32 %75, 1
  %83 = add nuw nsw i32 0, %82
  %84 = udiv i32 %83, 8192
  %85 = mul nuw nsw i32 %79, 1
  %86 = add nuw nsw i32 0, %85
  %87 = mul nuw nsw i32 %80, 8
  %88 = add nuw nsw i32 %86, %87
  %89 = udiv i32 %88, 136
  %90 = mul nuw nsw i32 %83, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 8192
  %93 = add i32 %91, 0
  %94 = add i32 %88, 832
  %95 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %93, i32 %94
  %96 = load float, ptr %95, align 4, !invariant.load !65
  %97 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %83, i32 %80, i32 0
  %98 = load float, ptr %97, align 4, !invariant.load !65
  %multiply.104 = fmul float %96, %98
  %multiply.135 = fmul float %74, %multiply.104
  %subtract.146 = fsub float %73, %multiply.135
  %99 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %subtract.146, ptr %99, align 4
  %100 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %101 = load float, ptr %100, align 4, !invariant.load !65
  %102 = load float, ptr %arg1, align 4, !invariant.load !65
  %103 = add i32 %14, 0
  %104 = add i32 %13, 112
  %105 = mul nuw nsw i32 %104, 1
  %106 = add nuw nsw i32 0, %105
  %107 = urem i32 %106, 8
  %108 = udiv i32 %106, 8
  %109 = udiv i32 %108, 17
  %110 = mul nuw nsw i32 %103, 1
  %111 = add nuw nsw i32 0, %110
  %112 = udiv i32 %111, 8192
  %113 = mul nuw nsw i32 %107, 1
  %114 = add nuw nsw i32 0, %113
  %115 = mul nuw nsw i32 %108, 8
  %116 = add nuw nsw i32 %114, %115
  %117 = udiv i32 %116, 136
  %118 = mul nuw nsw i32 %111, 1
  %119 = add nuw nsw i32 0, %118
  %120 = udiv i32 %119, 8192
  %121 = add i32 %119, 0
  %122 = add i32 %116, 832
  %123 = getelementptr inbounds [8192 x [968 x float]], ptr %arg3, i32 0, i32 %121, i32 %122
  %124 = load float, ptr %123, align 4, !invariant.load !65
  %125 = getelementptr inbounds [8192 x [17 x [1 x float]]], ptr %arg2, i32 0, i32 %111, i32 %108, i32 0
  %126 = load float, ptr %125, align 4, !invariant.load !65
  %multiply.107 = fmul float %124, %126
  %multiply.138 = fmul float %102, %multiply.107
  %subtract.149 = fsub float %101, %multiply.138
  %127 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %subtract.149, ptr %127, align 4
  br label %fusion_24.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59}

!0 = !{ptr @fusion_20, !"kernel", i32 1}
!1 = !{ptr @fusion_20, !"reqntidx", i32 96}
!2 = !{ptr @fusion_21, !"kernel", i32 1}
!3 = !{ptr @fusion_21, !"reqntidx", i32 96}
!4 = !{ptr @fusion_18, !"kernel", i32 1}
!5 = !{ptr @fusion_18, !"reqntidx", i32 1024}
!6 = !{ptr @fusion_14, !"kernel", i32 1}
!7 = !{ptr @fusion_14, !"reqntidx", i32 1024}
!8 = !{ptr @fusion_5, !"kernel", i32 1}
!9 = !{ptr @fusion_5, !"reqntidx", i32 1024}
!10 = !{ptr @fusion_11, !"kernel", i32 1}
!11 = !{ptr @fusion_11, !"reqntidx", i32 1024}
!12 = !{ptr @fusion_25, !"kernel", i32 1}
!13 = !{ptr @fusion_25, !"reqntidx", i32 256}
!14 = !{ptr @fusion_44, !"kernel", i32 1}
!15 = !{ptr @fusion_44, !"reqntidx", i32 1024}
!16 = !{ptr @fusion_36, !"kernel", i32 1}
!17 = !{ptr @fusion_36, !"reqntidx", i32 1024}
!18 = !{ptr @fusion_54, !"kernel", i32 1}
!19 = !{ptr @fusion_54, !"reqntidx", i32 1024}
!20 = !{ptr @fusion_38, !"kernel", i32 1}
!21 = !{ptr @fusion_38, !"reqntidx", i32 128}
!22 = !{ptr @fusion_51, !"kernel", i32 1}
!23 = !{ptr @fusion_51, !"reqntidx", i32 256}
!24 = !{ptr @fusion_22, !"kernel", i32 1}
!25 = !{ptr @fusion_22, !"reqntidx", i32 128}
!26 = !{ptr @fusion_6, !"kernel", i32 1}
!27 = !{ptr @fusion_6, !"reqntidx", i32 256}
!28 = !{ptr @fusion_8, !"kernel", i32 1}
!29 = !{ptr @fusion_8, !"reqntidx", i32 1024}
!30 = !{ptr @fusion_2, !"kernel", i32 1}
!31 = !{ptr @fusion_2, !"reqntidx", i32 1024}
!32 = !{ptr @fusion, !"kernel", i32 1}
!33 = !{ptr @fusion, !"reqntidx", i32 1024}
!34 = !{ptr @fusion_7, !"kernel", i32 1}
!35 = !{ptr @fusion_7, !"reqntidx", i32 1024}
!36 = !{ptr @fusion_52, !"kernel", i32 1}
!37 = !{ptr @fusion_52, !"reqntidx", i32 1024}
!38 = !{ptr @fusion_46, !"kernel", i32 1}
!39 = !{ptr @fusion_46, !"reqntidx", i32 64}
!40 = !{ptr @fusion_34, !"kernel", i32 1}
!41 = !{ptr @fusion_34, !"reqntidx", i32 1024}
!42 = !{ptr @fusion_42, !"kernel", i32 1}
!43 = !{ptr @fusion_42, !"reqntidx", i32 1024}
!44 = !{ptr @reduce_290, !"kernel", i32 1}
!45 = !{ptr @reduce_290, !"reqntidx", i32 1024}
!46 = !{ptr @fusion_13, !"kernel", i32 1}
!47 = !{ptr @fusion_13, !"reqntidx", i32 512}
!48 = !{ptr @fusion_16, !"kernel", i32 1}
!49 = !{ptr @fusion_16, !"reqntidx", i32 1024}
!50 = !{ptr @reduce_273, !"kernel", i32 1}
!51 = !{ptr @reduce_273, !"reqntidx", i32 1024}
!52 = !{ptr @fusion_17, !"kernel", i32 1}
!53 = !{ptr @fusion_17, !"reqntidx", i32 30}
!54 = !{ptr @fusion_30, !"kernel", i32 1}
!55 = !{ptr @fusion_30, !"reqntidx", i32 256}
!56 = !{ptr @fusion_26, !"kernel", i32 1}
!57 = !{ptr @fusion_26, !"reqntidx", i32 256}
!58 = !{ptr @fusion_24, !"kernel", i32 1}
!59 = !{ptr @fusion_24, !"reqntidx", i32 256}
!60 = !{i32 0, i32 1}
!61 = !{i32 0, i32 96}
!62 = !{i32 0, i32 11606}
!63 = distinct !{!63, !64}
!64 = !{!"llvm.loop.vectorize.enable", i1 false}
!65 = !{}
!66 = distinct !{!66, !64, !67}
!67 = !{!"llvm.loop.unroll.full"}
!68 = distinct !{!68, !64, !67}
!69 = !{i32 0, i32 35499}
!70 = distinct !{!70, !64}
!71 = distinct !{!71, !64, !67}
!72 = distinct !{!72, !64, !67}
!73 = !{i32 0, i32 1024}
!74 = !{i32 0, i32 64}
!75 = distinct !{!75, !64, !67}
!76 = distinct !{!76, !64}
!77 = !{i32 0, i32 512}
!78 = distinct !{!78, !64, !67}
!79 = distinct !{!79, !64}
!80 = !{i32 0, i32 32}
!81 = !{i32 0, i32 256}
!82 = distinct !{!82, !64, !67}
!83 = distinct !{!83, !64}
!84 = !{i32 0, i32 128}
!85 = distinct !{!85, !64, !67}
!86 = distinct !{!86, !64}
!87 = !{i32 0, i32 2}
!88 = distinct !{!88, !64, !67}
!89 = distinct !{!89, !64}
!90 = distinct !{!90, !64, !67}
!91 = distinct !{!91, !64}
!92 = !{i32 0, i32 864}
!93 = distinct !{!93, !64}
!94 = !{i32 0, i32 224}
!95 = !{i32 0, i32 24}
!96 = !{i32 0, i32 12}
!97 = !{i32 0, i32 4}
!98 = distinct !{!98, !64, !67}
!99 = distinct !{!99, !64}
!100 = distinct !{!100, !64, !67}
!101 = distinct !{!101, !64}
!102 = !{i32 0, i32 16}
!103 = !{i32 0, i32 8}
!104 = distinct !{!104, !64, !67}
!105 = distinct !{!105, !64}
!106 = !{i32 0, i32 15}
!107 = distinct !{!107, !64, !67}
!108 = distinct !{!108, !64}
!109 = !{i32 0, i32 30}
!110 = !{i32 0, i32 3584}
!111 = !{i32 0, i32 384}
!112 = !{i32 0, i32 192}
