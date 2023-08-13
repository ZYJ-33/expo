target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@2 = private unnamed_addr constant [4 x i8] zeroinitializer
@3 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@4 = private unnamed_addr constant [4 x i8] zeroinitializer
@5 = private unnamed_addr constant [4 x i8] c"\00\00\00@"
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@7 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@8 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@9 = private unnamed_addr constant [4 x i8] c"\00\00\00@"
@10 = private unnamed_addr constant [4 x i8] c"\00\00\00@"
@buffer_for_constant_12 = constant [64 x i8] c"\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128

define void @fusion_12(ptr noalias align 16 dereferenceable(1572864) %arg0, ptr noalias align 16 dereferenceable(2097152) %arg1, ptr noalias align 16 dereferenceable(786432) %arg2, ptr noalias align 128 dereferenceable(4456448) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !32
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 278528
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 8
  %5 = udiv i32 %linear_index_base, 8
  %6 = urem i32 %5, 17
  %7 = udiv i32 %linear_index_base, 136
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 8
  %10 = udiv i32 %linear_index1, 8
  %11 = urem i32 %10, 17
  %12 = udiv i32 %linear_index1, 136
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 8
  %15 = udiv i32 %linear_index2, 8
  %16 = urem i32 %15, 17
  %17 = udiv i32 %linear_index2, 136
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 8
  %20 = udiv i32 %linear_index3, 8
  %21 = urem i32 %20, 17
  %22 = udiv i32 %linear_index3, 136
  %23 = icmp ult i32 %linear_index_base, 1114112
  br i1 %23, label %fusion_12.in_bounds-true, label %fusion_12.in_bounds-after

fusion_12.in_bounds-after:                        ; preds = %concatenate.4.merge21, %entry
  ret void

fusion_12.in_bounds-true:                         ; preds = %entry
  %24 = mul nuw nsw i32 %4, 1
  %25 = add nuw nsw i32 0, %24
  %26 = mul nuw nsw i32 %6, 8
  %27 = add nuw nsw i32 %25, %26
  %28 = udiv i32 %27, 136
  %29 = mul nuw nsw i32 %7, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  br label %concatenate.pivot.48.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %32 = phi i32 [ 0, %concatenate.pivot.0. ]
  %33 = sub nsw i32 %27, %32
  %34 = udiv i32 %linear_index_base, 136
  %35 = mul i32 %34, 48
  %36 = add i32 %35, %33
  %37 = udiv i32 %36, 1
  %38 = urem i32 %37, 48
  %39 = udiv i32 %36, 48
  %40 = getelementptr inbounds float, ptr %arg0, i32 %36
  %41 = load float, ptr %40, align 4, !invariant.load !34
  br label %concatenate.4.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.48.1
  %42 = phi i32 [ 48, %concatenate.pivot.48.1 ]
  %43 = sub nsw i32 %27, %42
  %44 = udiv i32 %linear_index_base, 136
  %45 = mul i32 %44, 64
  %46 = add i32 %45, %43
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = getelementptr inbounds float, ptr %arg1, i32 %46
  %51 = load float, ptr %50, align 4, !invariant.load !34
  br label %concatenate.4.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.112.2
  %52 = phi i32 [ 112, %concatenate.pivot.112.2 ]
  %53 = sub nsw i32 %27, %52
  %54 = udiv i32 %linear_index_base, 136
  %55 = mul i32 %54, 24
  %56 = add i32 %55, %53
  %57 = udiv i32 %56, 1
  %58 = urem i32 %57, 24
  %59 = udiv i32 %56, 24
  %60 = getelementptr inbounds float, ptr %arg2, i32 %56
  %61 = load float, ptr %60, align 4, !invariant.load !34
  br label %concatenate.4.merge

concatenate.pivot.48.:                            ; preds = %fusion_12.in_bounds-true
  %62 = icmp ult i32 %27, 48
  br i1 %62, label %concatenate.pivot.0., label %concatenate.pivot.112.

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.48.
  br label %concat_index_from_operand_id0

concatenate.pivot.112.:                           ; preds = %concatenate.pivot.48.
  %63 = icmp ult i32 %27, 112
  br i1 %63, label %concatenate.pivot.48.1, label %concatenate.pivot.112.2

concatenate.pivot.48.1:                           ; preds = %concatenate.pivot.112.
  br label %concat_index_from_operand_id1

concatenate.pivot.112.2:                          ; preds = %concatenate.pivot.112.
  br label %concat_index_from_operand_id2

concatenate.4.merge:                              ; preds = %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %64 = phi float [ %41, %concat_index_from_operand_id0 ], [ %51, %concat_index_from_operand_id1 ], [ %61, %concat_index_from_operand_id2 ]
  %65 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %64, ptr %65, align 4
  %66 = mul nuw nsw i32 %9, 1
  %67 = add nuw nsw i32 0, %66
  %68 = mul nuw nsw i32 %11, 8
  %69 = add nuw nsw i32 %67, %68
  %70 = udiv i32 %69, 136
  %71 = mul nuw nsw i32 %12, 1
  %72 = add nuw nsw i32 0, %71
  %73 = udiv i32 %72, 8192
  br label %concatenate.pivot.48.7

concat_index_from_operand_id04:                   ; preds = %concatenate.pivot.0.8
  %74 = phi i32 [ 0, %concatenate.pivot.0.8 ]
  %75 = sub nsw i32 %69, %74
  %76 = udiv i32 %linear_index1, 136
  %77 = mul i32 %76, 48
  %78 = add i32 %77, %75
  %79 = udiv i32 %78, 1
  %80 = urem i32 %79, 48
  %81 = udiv i32 %78, 48
  %82 = getelementptr inbounds float, ptr %arg0, i32 %78
  %83 = load float, ptr %82, align 4, !invariant.load !34
  br label %concatenate.4.merge3

concat_index_from_operand_id15:                   ; preds = %concatenate.pivot.48.10
  %84 = phi i32 [ 48, %concatenate.pivot.48.10 ]
  %85 = sub nsw i32 %69, %84
  %86 = udiv i32 %linear_index1, 136
  %87 = mul i32 %86, 64
  %88 = add i32 %87, %85
  %89 = udiv i32 %88, 1
  %90 = urem i32 %89, 64
  %91 = udiv i32 %88, 64
  %92 = getelementptr inbounds float, ptr %arg1, i32 %88
  %93 = load float, ptr %92, align 4, !invariant.load !34
  br label %concatenate.4.merge3

concat_index_from_operand_id26:                   ; preds = %concatenate.pivot.112.11
  %94 = phi i32 [ 112, %concatenate.pivot.112.11 ]
  %95 = sub nsw i32 %69, %94
  %96 = udiv i32 %linear_index1, 136
  %97 = mul i32 %96, 24
  %98 = add i32 %97, %95
  %99 = udiv i32 %98, 1
  %100 = urem i32 %99, 24
  %101 = udiv i32 %98, 24
  %102 = getelementptr inbounds float, ptr %arg2, i32 %98
  %103 = load float, ptr %102, align 4, !invariant.load !34
  br label %concatenate.4.merge3

concatenate.pivot.48.7:                           ; preds = %concatenate.4.merge
  %104 = icmp ult i32 %69, 48
  br i1 %104, label %concatenate.pivot.0.8, label %concatenate.pivot.112.9

concatenate.pivot.0.8:                            ; preds = %concatenate.pivot.48.7
  br label %concat_index_from_operand_id04

concatenate.pivot.112.9:                          ; preds = %concatenate.pivot.48.7
  %105 = icmp ult i32 %69, 112
  br i1 %105, label %concatenate.pivot.48.10, label %concatenate.pivot.112.11

concatenate.pivot.48.10:                          ; preds = %concatenate.pivot.112.9
  br label %concat_index_from_operand_id15

concatenate.pivot.112.11:                         ; preds = %concatenate.pivot.112.9
  br label %concat_index_from_operand_id26

concatenate.4.merge3:                             ; preds = %concat_index_from_operand_id26, %concat_index_from_operand_id15, %concat_index_from_operand_id04
  %106 = phi float [ %83, %concat_index_from_operand_id04 ], [ %93, %concat_index_from_operand_id15 ], [ %103, %concat_index_from_operand_id26 ]
  %107 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %106, ptr %107, align 4
  %108 = mul nuw nsw i32 %14, 1
  %109 = add nuw nsw i32 0, %108
  %110 = mul nuw nsw i32 %16, 8
  %111 = add nuw nsw i32 %109, %110
  %112 = udiv i32 %111, 136
  %113 = mul nuw nsw i32 %17, 1
  %114 = add nuw nsw i32 0, %113
  %115 = udiv i32 %114, 8192
  br label %concatenate.pivot.48.16

concat_index_from_operand_id013:                  ; preds = %concatenate.pivot.0.17
  %116 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %117 = sub nsw i32 %111, %116
  %118 = udiv i32 %linear_index2, 136
  %119 = mul i32 %118, 48
  %120 = add i32 %119, %117
  %121 = udiv i32 %120, 1
  %122 = urem i32 %121, 48
  %123 = udiv i32 %120, 48
  %124 = getelementptr inbounds float, ptr %arg0, i32 %120
  %125 = load float, ptr %124, align 4, !invariant.load !34
  br label %concatenate.4.merge12

concat_index_from_operand_id114:                  ; preds = %concatenate.pivot.48.19
  %126 = phi i32 [ 48, %concatenate.pivot.48.19 ]
  %127 = sub nsw i32 %111, %126
  %128 = udiv i32 %linear_index2, 136
  %129 = mul i32 %128, 64
  %130 = add i32 %129, %127
  %131 = udiv i32 %130, 1
  %132 = urem i32 %131, 64
  %133 = udiv i32 %130, 64
  %134 = getelementptr inbounds float, ptr %arg1, i32 %130
  %135 = load float, ptr %134, align 4, !invariant.load !34
  br label %concatenate.4.merge12

concat_index_from_operand_id215:                  ; preds = %concatenate.pivot.112.20
  %136 = phi i32 [ 112, %concatenate.pivot.112.20 ]
  %137 = sub nsw i32 %111, %136
  %138 = udiv i32 %linear_index2, 136
  %139 = mul i32 %138, 24
  %140 = add i32 %139, %137
  %141 = udiv i32 %140, 1
  %142 = urem i32 %141, 24
  %143 = udiv i32 %140, 24
  %144 = getelementptr inbounds float, ptr %arg2, i32 %140
  %145 = load float, ptr %144, align 4, !invariant.load !34
  br label %concatenate.4.merge12

concatenate.pivot.48.16:                          ; preds = %concatenate.4.merge3
  %146 = icmp ult i32 %111, 48
  br i1 %146, label %concatenate.pivot.0.17, label %concatenate.pivot.112.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.48.16
  br label %concat_index_from_operand_id013

concatenate.pivot.112.18:                         ; preds = %concatenate.pivot.48.16
  %147 = icmp ult i32 %111, 112
  br i1 %147, label %concatenate.pivot.48.19, label %concatenate.pivot.112.20

concatenate.pivot.48.19:                          ; preds = %concatenate.pivot.112.18
  br label %concat_index_from_operand_id114

concatenate.pivot.112.20:                         ; preds = %concatenate.pivot.112.18
  br label %concat_index_from_operand_id215

concatenate.4.merge12:                            ; preds = %concat_index_from_operand_id215, %concat_index_from_operand_id114, %concat_index_from_operand_id013
  %148 = phi float [ %125, %concat_index_from_operand_id013 ], [ %135, %concat_index_from_operand_id114 ], [ %145, %concat_index_from_operand_id215 ]
  %149 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %148, ptr %149, align 4
  %150 = mul nuw nsw i32 %19, 1
  %151 = add nuw nsw i32 0, %150
  %152 = mul nuw nsw i32 %21, 8
  %153 = add nuw nsw i32 %151, %152
  %154 = udiv i32 %153, 136
  %155 = mul nuw nsw i32 %22, 1
  %156 = add nuw nsw i32 0, %155
  %157 = udiv i32 %156, 8192
  br label %concatenate.pivot.48.25

concat_index_from_operand_id022:                  ; preds = %concatenate.pivot.0.26
  %158 = phi i32 [ 0, %concatenate.pivot.0.26 ]
  %159 = sub nsw i32 %153, %158
  %160 = udiv i32 %linear_index3, 136
  %161 = mul i32 %160, 48
  %162 = add i32 %161, %159
  %163 = udiv i32 %162, 1
  %164 = urem i32 %163, 48
  %165 = udiv i32 %162, 48
  %166 = getelementptr inbounds float, ptr %arg0, i32 %162
  %167 = load float, ptr %166, align 4, !invariant.load !34
  br label %concatenate.4.merge21

concat_index_from_operand_id123:                  ; preds = %concatenate.pivot.48.28
  %168 = phi i32 [ 48, %concatenate.pivot.48.28 ]
  %169 = sub nsw i32 %153, %168
  %170 = udiv i32 %linear_index3, 136
  %171 = mul i32 %170, 64
  %172 = add i32 %171, %169
  %173 = udiv i32 %172, 1
  %174 = urem i32 %173, 64
  %175 = udiv i32 %172, 64
  %176 = getelementptr inbounds float, ptr %arg1, i32 %172
  %177 = load float, ptr %176, align 4, !invariant.load !34
  br label %concatenate.4.merge21

concat_index_from_operand_id224:                  ; preds = %concatenate.pivot.112.29
  %178 = phi i32 [ 112, %concatenate.pivot.112.29 ]
  %179 = sub nsw i32 %153, %178
  %180 = udiv i32 %linear_index3, 136
  %181 = mul i32 %180, 24
  %182 = add i32 %181, %179
  %183 = udiv i32 %182, 1
  %184 = urem i32 %183, 24
  %185 = udiv i32 %182, 24
  %186 = getelementptr inbounds float, ptr %arg2, i32 %182
  %187 = load float, ptr %186, align 4, !invariant.load !34
  br label %concatenate.4.merge21

concatenate.pivot.48.25:                          ; preds = %concatenate.4.merge12
  %188 = icmp ult i32 %153, 48
  br i1 %188, label %concatenate.pivot.0.26, label %concatenate.pivot.112.27

concatenate.pivot.0.26:                           ; preds = %concatenate.pivot.48.25
  br label %concat_index_from_operand_id022

concatenate.pivot.112.27:                         ; preds = %concatenate.pivot.48.25
  %189 = icmp ult i32 %153, 112
  br i1 %189, label %concatenate.pivot.48.28, label %concatenate.pivot.112.29

concatenate.pivot.48.28:                          ; preds = %concatenate.pivot.112.27
  br label %concat_index_from_operand_id123

concatenate.pivot.112.29:                         ; preds = %concatenate.pivot.112.27
  br label %concat_index_from_operand_id224

concatenate.4.merge21:                            ; preds = %concat_index_from_operand_id224, %concat_index_from_operand_id123, %concat_index_from_operand_id022
  %190 = phi float [ %167, %concat_index_from_operand_id022 ], [ %177, %concat_index_from_operand_id123 ], [ %187, %concat_index_from_operand_id224 ]
  %191 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %190, ptr %191, align 4
  br label %fusion_12.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_13(ptr noalias align 16 dereferenceable(14680064) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 128 dereferenceable(27262976) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1703936
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 64
  %5 = udiv i32 %linear_index_base, 64
  %6 = urem i32 %5, 13
  %7 = udiv i32 %linear_index_base, 832
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 64
  %10 = udiv i32 %linear_index1, 64
  %11 = urem i32 %10, 13
  %12 = udiv i32 %linear_index1, 832
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 64
  %15 = udiv i32 %linear_index2, 64
  %16 = urem i32 %15, 13
  %17 = udiv i32 %linear_index2, 832
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 64
  %20 = udiv i32 %linear_index3, 64
  %21 = urem i32 %20, 13
  %22 = udiv i32 %linear_index3, 832
  %23 = icmp ult i32 %linear_index_base, 6815744
  br i1 %23, label %fusion_13.in_bounds-true, label %fusion_13.in_bounds-after

fusion_13.in_bounds-after:                        ; preds = %concatenate.5.merge28, %entry
  ret void

fusion_13.in_bounds-true:                         ; preds = %entry
  %24 = mul nuw nsw i32 %4, 1
  %25 = add nuw nsw i32 0, %24
  %26 = mul nuw nsw i32 %6, 64
  %27 = add nuw nsw i32 %25, %26
  %28 = udiv i32 %27, 832
  %29 = mul nuw nsw i32 %7, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  br label %concatenate.pivot.576.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %32 = phi i32 [ 0, %concatenate.pivot.0. ]
  %33 = sub nsw i32 %27, %32
  %34 = udiv i32 %linear_index_base, 832
  %35 = mul i32 %34, 448
  %36 = add i32 %35, %33
  %37 = udiv i32 %36, 1
  %38 = urem i32 %37, 448
  %39 = udiv i32 %36, 448
  %40 = getelementptr inbounds float, ptr %arg0, i32 %36
  %41 = load float, ptr %40, align 4, !invariant.load !34
  br label %concatenate.5.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.448.1
  %42 = phi i32 [ 448, %concatenate.pivot.448.1 ]
  %43 = sub nsw i32 %27, %42
  %44 = udiv i32 %linear_index_base, 832
  %45 = mul i32 %44, 128
  %46 = add i32 %45, %43
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 128
  %49 = udiv i32 %46, 128
  %50 = getelementptr inbounds float, ptr %arg1, i32 %46
  %51 = load float, ptr %50, align 4, !invariant.load !34
  br label %concatenate.5.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.576.2
  %52 = phi i32 [ 576, %concatenate.pivot.576.2 ]
  %53 = sub nsw i32 %27, %52
  %54 = udiv i32 %linear_index_base, 832
  %55 = mul i32 %54, 128
  %56 = add i32 %55, %53
  %57 = udiv i32 %56, 1
  %58 = urem i32 %57, 128
  %59 = udiv i32 %56, 128
  %60 = getelementptr inbounds float, ptr %arg2, i32 %56
  %61 = load float, ptr %60, align 4, !invariant.load !34
  br label %concatenate.5.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.704.3
  %62 = phi i32 [ 704, %concatenate.pivot.704.3 ]
  %63 = sub nsw i32 %27, %62
  %64 = udiv i32 %linear_index_base, 832
  %65 = mul i32 %64, 128
  %66 = add i32 %65, %63
  %67 = udiv i32 %66, 1
  %68 = urem i32 %67, 128
  %69 = udiv i32 %66, 128
  %70 = getelementptr inbounds float, ptr %arg3, i32 %66
  %71 = load float, ptr %70, align 4, !invariant.load !34
  br label %concatenate.5.merge

concatenate.pivot.576.:                           ; preds = %fusion_13.in_bounds-true
  %72 = icmp ult i32 %27, 576
  br i1 %72, label %concatenate.pivot.448., label %concatenate.pivot.704.

concatenate.pivot.448.:                           ; preds = %concatenate.pivot.576.
  %73 = icmp ult i32 %27, 448
  br i1 %73, label %concatenate.pivot.0., label %concatenate.pivot.448.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.448.
  br label %concat_index_from_operand_id0

concatenate.pivot.448.1:                          ; preds = %concatenate.pivot.448.
  br label %concat_index_from_operand_id1

concatenate.pivot.704.:                           ; preds = %concatenate.pivot.576.
  %74 = icmp ult i32 %27, 704
  br i1 %74, label %concatenate.pivot.576.2, label %concatenate.pivot.704.3

concatenate.pivot.576.2:                          ; preds = %concatenate.pivot.704.
  br label %concat_index_from_operand_id2

concatenate.pivot.704.3:                          ; preds = %concatenate.pivot.704.
  br label %concat_index_from_operand_id3

concatenate.5.merge:                              ; preds = %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %75 = phi float [ %41, %concat_index_from_operand_id0 ], [ %51, %concat_index_from_operand_id1 ], [ %61, %concat_index_from_operand_id2 ], [ %71, %concat_index_from_operand_id3 ]
  %76 = getelementptr inbounds float, ptr %arg4, i32 %linear_index_base
  store float %75, ptr %76, align 4
  %77 = mul nuw nsw i32 %9, 1
  %78 = add nuw nsw i32 0, %77
  %79 = mul nuw nsw i32 %11, 64
  %80 = add nuw nsw i32 %78, %79
  %81 = udiv i32 %80, 832
  %82 = mul nuw nsw i32 %12, 1
  %83 = add nuw nsw i32 0, %82
  %84 = udiv i32 %83, 8192
  br label %concatenate.pivot.576.9

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.11
  %85 = phi i32 [ 0, %concatenate.pivot.0.11 ]
  %86 = sub nsw i32 %80, %85
  %87 = udiv i32 %linear_index1, 832
  %88 = mul i32 %87, 448
  %89 = add i32 %88, %86
  %90 = udiv i32 %89, 1
  %91 = urem i32 %90, 448
  %92 = udiv i32 %89, 448
  %93 = getelementptr inbounds float, ptr %arg0, i32 %89
  %94 = load float, ptr %93, align 4, !invariant.load !34
  br label %concatenate.5.merge4

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.448.12
  %95 = phi i32 [ 448, %concatenate.pivot.448.12 ]
  %96 = sub nsw i32 %80, %95
  %97 = udiv i32 %linear_index1, 832
  %98 = mul i32 %97, 128
  %99 = add i32 %98, %96
  %100 = udiv i32 %99, 1
  %101 = urem i32 %100, 128
  %102 = udiv i32 %99, 128
  %103 = getelementptr inbounds float, ptr %arg1, i32 %99
  %104 = load float, ptr %103, align 4, !invariant.load !34
  br label %concatenate.5.merge4

concat_index_from_operand_id27:                   ; preds = %concatenate.pivot.576.14
  %105 = phi i32 [ 576, %concatenate.pivot.576.14 ]
  %106 = sub nsw i32 %80, %105
  %107 = udiv i32 %linear_index1, 832
  %108 = mul i32 %107, 128
  %109 = add i32 %108, %106
  %110 = udiv i32 %109, 1
  %111 = urem i32 %110, 128
  %112 = udiv i32 %109, 128
  %113 = getelementptr inbounds float, ptr %arg2, i32 %109
  %114 = load float, ptr %113, align 4, !invariant.load !34
  br label %concatenate.5.merge4

concat_index_from_operand_id38:                   ; preds = %concatenate.pivot.704.15
  %115 = phi i32 [ 704, %concatenate.pivot.704.15 ]
  %116 = sub nsw i32 %80, %115
  %117 = udiv i32 %linear_index1, 832
  %118 = mul i32 %117, 128
  %119 = add i32 %118, %116
  %120 = udiv i32 %119, 1
  %121 = urem i32 %120, 128
  %122 = udiv i32 %119, 128
  %123 = getelementptr inbounds float, ptr %arg3, i32 %119
  %124 = load float, ptr %123, align 4, !invariant.load !34
  br label %concatenate.5.merge4

concatenate.pivot.576.9:                          ; preds = %concatenate.5.merge
  %125 = icmp ult i32 %80, 576
  br i1 %125, label %concatenate.pivot.448.10, label %concatenate.pivot.704.13

concatenate.pivot.448.10:                         ; preds = %concatenate.pivot.576.9
  %126 = icmp ult i32 %80, 448
  br i1 %126, label %concatenate.pivot.0.11, label %concatenate.pivot.448.12

concatenate.pivot.0.11:                           ; preds = %concatenate.pivot.448.10
  br label %concat_index_from_operand_id05

concatenate.pivot.448.12:                         ; preds = %concatenate.pivot.448.10
  br label %concat_index_from_operand_id16

concatenate.pivot.704.13:                         ; preds = %concatenate.pivot.576.9
  %127 = icmp ult i32 %80, 704
  br i1 %127, label %concatenate.pivot.576.14, label %concatenate.pivot.704.15

concatenate.pivot.576.14:                         ; preds = %concatenate.pivot.704.13
  br label %concat_index_from_operand_id27

concatenate.pivot.704.15:                         ; preds = %concatenate.pivot.704.13
  br label %concat_index_from_operand_id38

concatenate.5.merge4:                             ; preds = %concat_index_from_operand_id38, %concat_index_from_operand_id27, %concat_index_from_operand_id16, %concat_index_from_operand_id05
  %128 = phi float [ %94, %concat_index_from_operand_id05 ], [ %104, %concat_index_from_operand_id16 ], [ %114, %concat_index_from_operand_id27 ], [ %124, %concat_index_from_operand_id38 ]
  %129 = getelementptr inbounds float, ptr %arg4, i32 %linear_index1
  store float %128, ptr %129, align 4
  %130 = mul nuw nsw i32 %14, 1
  %131 = add nuw nsw i32 0, %130
  %132 = mul nuw nsw i32 %16, 64
  %133 = add nuw nsw i32 %131, %132
  %134 = udiv i32 %133, 832
  %135 = mul nuw nsw i32 %17, 1
  %136 = add nuw nsw i32 0, %135
  %137 = udiv i32 %136, 8192
  br label %concatenate.pivot.576.21

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.23
  %138 = phi i32 [ 0, %concatenate.pivot.0.23 ]
  %139 = sub nsw i32 %133, %138
  %140 = udiv i32 %linear_index2, 832
  %141 = mul i32 %140, 448
  %142 = add i32 %141, %139
  %143 = udiv i32 %142, 1
  %144 = urem i32 %143, 448
  %145 = udiv i32 %142, 448
  %146 = getelementptr inbounds float, ptr %arg0, i32 %142
  %147 = load float, ptr %146, align 4, !invariant.load !34
  br label %concatenate.5.merge16

concat_index_from_operand_id118:                  ; preds = %concatenate.pivot.448.24
  %148 = phi i32 [ 448, %concatenate.pivot.448.24 ]
  %149 = sub nsw i32 %133, %148
  %150 = udiv i32 %linear_index2, 832
  %151 = mul i32 %150, 128
  %152 = add i32 %151, %149
  %153 = udiv i32 %152, 1
  %154 = urem i32 %153, 128
  %155 = udiv i32 %152, 128
  %156 = getelementptr inbounds float, ptr %arg1, i32 %152
  %157 = load float, ptr %156, align 4, !invariant.load !34
  br label %concatenate.5.merge16

concat_index_from_operand_id219:                  ; preds = %concatenate.pivot.576.26
  %158 = phi i32 [ 576, %concatenate.pivot.576.26 ]
  %159 = sub nsw i32 %133, %158
  %160 = udiv i32 %linear_index2, 832
  %161 = mul i32 %160, 128
  %162 = add i32 %161, %159
  %163 = udiv i32 %162, 1
  %164 = urem i32 %163, 128
  %165 = udiv i32 %162, 128
  %166 = getelementptr inbounds float, ptr %arg2, i32 %162
  %167 = load float, ptr %166, align 4, !invariant.load !34
  br label %concatenate.5.merge16

concat_index_from_operand_id320:                  ; preds = %concatenate.pivot.704.27
  %168 = phi i32 [ 704, %concatenate.pivot.704.27 ]
  %169 = sub nsw i32 %133, %168
  %170 = udiv i32 %linear_index2, 832
  %171 = mul i32 %170, 128
  %172 = add i32 %171, %169
  %173 = udiv i32 %172, 1
  %174 = urem i32 %173, 128
  %175 = udiv i32 %172, 128
  %176 = getelementptr inbounds float, ptr %arg3, i32 %172
  %177 = load float, ptr %176, align 4, !invariant.load !34
  br label %concatenate.5.merge16

concatenate.pivot.576.21:                         ; preds = %concatenate.5.merge4
  %178 = icmp ult i32 %133, 576
  br i1 %178, label %concatenate.pivot.448.22, label %concatenate.pivot.704.25

concatenate.pivot.448.22:                         ; preds = %concatenate.pivot.576.21
  %179 = icmp ult i32 %133, 448
  br i1 %179, label %concatenate.pivot.0.23, label %concatenate.pivot.448.24

concatenate.pivot.0.23:                           ; preds = %concatenate.pivot.448.22
  br label %concat_index_from_operand_id017

concatenate.pivot.448.24:                         ; preds = %concatenate.pivot.448.22
  br label %concat_index_from_operand_id118

concatenate.pivot.704.25:                         ; preds = %concatenate.pivot.576.21
  %180 = icmp ult i32 %133, 704
  br i1 %180, label %concatenate.pivot.576.26, label %concatenate.pivot.704.27

concatenate.pivot.576.26:                         ; preds = %concatenate.pivot.704.25
  br label %concat_index_from_operand_id219

concatenate.pivot.704.27:                         ; preds = %concatenate.pivot.704.25
  br label %concat_index_from_operand_id320

concatenate.5.merge16:                            ; preds = %concat_index_from_operand_id320, %concat_index_from_operand_id219, %concat_index_from_operand_id118, %concat_index_from_operand_id017
  %181 = phi float [ %147, %concat_index_from_operand_id017 ], [ %157, %concat_index_from_operand_id118 ], [ %167, %concat_index_from_operand_id219 ], [ %177, %concat_index_from_operand_id320 ]
  %182 = getelementptr inbounds float, ptr %arg4, i32 %linear_index2
  store float %181, ptr %182, align 4
  %183 = mul nuw nsw i32 %19, 1
  %184 = add nuw nsw i32 0, %183
  %185 = mul nuw nsw i32 %21, 64
  %186 = add nuw nsw i32 %184, %185
  %187 = udiv i32 %186, 832
  %188 = mul nuw nsw i32 %22, 1
  %189 = add nuw nsw i32 0, %188
  %190 = udiv i32 %189, 8192
  br label %concatenate.pivot.576.33

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.35
  %191 = phi i32 [ 0, %concatenate.pivot.0.35 ]
  %192 = sub nsw i32 %186, %191
  %193 = udiv i32 %linear_index3, 832
  %194 = mul i32 %193, 448
  %195 = add i32 %194, %192
  %196 = udiv i32 %195, 1
  %197 = urem i32 %196, 448
  %198 = udiv i32 %195, 448
  %199 = getelementptr inbounds float, ptr %arg0, i32 %195
  %200 = load float, ptr %199, align 4, !invariant.load !34
  br label %concatenate.5.merge28

concat_index_from_operand_id130:                  ; preds = %concatenate.pivot.448.36
  %201 = phi i32 [ 448, %concatenate.pivot.448.36 ]
  %202 = sub nsw i32 %186, %201
  %203 = udiv i32 %linear_index3, 832
  %204 = mul i32 %203, 128
  %205 = add i32 %204, %202
  %206 = udiv i32 %205, 1
  %207 = urem i32 %206, 128
  %208 = udiv i32 %205, 128
  %209 = getelementptr inbounds float, ptr %arg1, i32 %205
  %210 = load float, ptr %209, align 4, !invariant.load !34
  br label %concatenate.5.merge28

concat_index_from_operand_id231:                  ; preds = %concatenate.pivot.576.38
  %211 = phi i32 [ 576, %concatenate.pivot.576.38 ]
  %212 = sub nsw i32 %186, %211
  %213 = udiv i32 %linear_index3, 832
  %214 = mul i32 %213, 128
  %215 = add i32 %214, %212
  %216 = udiv i32 %215, 1
  %217 = urem i32 %216, 128
  %218 = udiv i32 %215, 128
  %219 = getelementptr inbounds float, ptr %arg2, i32 %215
  %220 = load float, ptr %219, align 4, !invariant.load !34
  br label %concatenate.5.merge28

concat_index_from_operand_id332:                  ; preds = %concatenate.pivot.704.39
  %221 = phi i32 [ 704, %concatenate.pivot.704.39 ]
  %222 = sub nsw i32 %186, %221
  %223 = udiv i32 %linear_index3, 832
  %224 = mul i32 %223, 128
  %225 = add i32 %224, %222
  %226 = udiv i32 %225, 1
  %227 = urem i32 %226, 128
  %228 = udiv i32 %225, 128
  %229 = getelementptr inbounds float, ptr %arg3, i32 %225
  %230 = load float, ptr %229, align 4, !invariant.load !34
  br label %concatenate.5.merge28

concatenate.pivot.576.33:                         ; preds = %concatenate.5.merge16
  %231 = icmp ult i32 %186, 576
  br i1 %231, label %concatenate.pivot.448.34, label %concatenate.pivot.704.37

concatenate.pivot.448.34:                         ; preds = %concatenate.pivot.576.33
  %232 = icmp ult i32 %186, 448
  br i1 %232, label %concatenate.pivot.0.35, label %concatenate.pivot.448.36

concatenate.pivot.0.35:                           ; preds = %concatenate.pivot.448.34
  br label %concat_index_from_operand_id029

concatenate.pivot.448.36:                         ; preds = %concatenate.pivot.448.34
  br label %concat_index_from_operand_id130

concatenate.pivot.704.37:                         ; preds = %concatenate.pivot.576.33
  %233 = icmp ult i32 %186, 704
  br i1 %233, label %concatenate.pivot.576.38, label %concatenate.pivot.704.39

concatenate.pivot.576.38:                         ; preds = %concatenate.pivot.704.37
  br label %concat_index_from_operand_id231

concatenate.pivot.704.39:                         ; preds = %concatenate.pivot.704.37
  br label %concat_index_from_operand_id332

concatenate.5.merge28:                            ; preds = %concat_index_from_operand_id332, %concat_index_from_operand_id231, %concat_index_from_operand_id130, %concat_index_from_operand_id029
  %234 = phi float [ %200, %concat_index_from_operand_id029 ], [ %210, %concat_index_from_operand_id130 ], [ %220, %concat_index_from_operand_id231 ], [ %230, %concat_index_from_operand_id332 ]
  %235 = getelementptr inbounds float, ptr %arg4, i32 %linear_index3
  store float %234, ptr %235, align 4
  br label %fusion_13.in_bounds-after
}

define void @concatenate_3(ptr noalias align 16 dereferenceable(262144) %arg0, ptr noalias align 16 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(327680) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 81920
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 640
  %5 = udiv i32 %linear_index, 640
  %6 = icmp ult i32 %linear_index, 81920
  br i1 %6, label %concatenate_3.in_bounds-true, label %concatenate_3.in_bounds-after

concatenate_3.in_bounds-after:                    ; preds = %concatenate.3.merge, %entry
  ret void

concatenate_3.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.512.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %7 = phi i32 [ 0, %concatenate.pivot.0. ]
  %8 = sub nsw i32 %4, %7
  %9 = udiv i32 %linear_index, 640
  %10 = mul i32 %9, 512
  %11 = add i32 %10, %8
  %12 = udiv i32 %11, 1
  %13 = urem i32 %12, 512
  %14 = udiv i32 %11, 512
  %15 = getelementptr inbounds float, ptr %arg0, i32 %11
  %16 = load float, ptr %15, align 4, !invariant.load !34
  br label %concatenate.3.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.512.1
  %17 = phi i32 [ 512, %concatenate.pivot.512.1 ]
  %18 = sub nsw i32 %4, %17
  %19 = udiv i32 %linear_index, 640
  %20 = mul i32 %19, 128
  %21 = add i32 %20, %18
  %22 = udiv i32 %21, 1
  %23 = urem i32 %22, 128
  %24 = udiv i32 %21, 128
  %25 = getelementptr inbounds float, ptr %arg1, i32 %21
  %26 = load float, ptr %25, align 4, !invariant.load !34
  br label %concatenate.3.merge

concatenate.pivot.512.:                           ; preds = %concatenate_3.in_bounds-true
  %27 = icmp ult i32 %4, 512
  br i1 %27, label %concatenate.pivot.0., label %concatenate.pivot.512.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.512.
  br label %concat_index_from_operand_id0

concatenate.pivot.512.1:                          ; preds = %concatenate.pivot.512.
  br label %concat_index_from_operand_id1

concatenate.3.merge:                              ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %28 = phi float [ %16, %concat_index_from_operand_id0 ], [ %26, %concat_index_from_operand_id1 ]
  %29 = getelementptr inbounds float, ptr %arg2, i32 %linear_index
  store float %28, ptr %29, align 4
  br label %concatenate_3.in_bounds-after
}

define void @add_5(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %add_5.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 4194304
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 512
  %7 = udiv i32 %linear_index_plus_base, 512
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 512
  %10 = udiv i32 %linear_index1, 512
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 512
  %13 = udiv i32 %linear_index2, 512
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 512
  %16 = udiv i32 %linear_index3, 512
  %17 = icmp ult i32 %linear_index_plus_base, 4194304
  br i1 %17, label %add_5.in_bounds-true, label %add_5.in_bounds-after

add_5.in_bounds-after:                            ; preds = %add_5.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !40

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

add_5.in_bounds-true:                             ; preds = %loop.loop_body
  %18 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  %21 = load float, ptr %20, align 4, !invariant.load !34
  %add.3 = fadd float %19, %21
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  store float %add.3, ptr %22, align 4
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %24 = load float, ptr %23, align 4
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4, !invariant.load !34
  %add.31 = fadd float %24, %26
  %27 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %add.31, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %31 = load float, ptr %30, align 4, !invariant.load !34
  %add.32 = fadd float %29, %31
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %add.32, ptr %32, align 4
  %33 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %34 = load float, ptr %33, align 4
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %36 = load float, ptr %35, align 4, !invariant.load !34
  %add.33 = fadd float %34, %36
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %add.33, ptr %37, align 4
  br label %add_5.in_bounds-after
}

define void @fusion_17(ptr noalias align 128 dereferenceable(20971520) %arg0, ptr noalias align 128 dereferenceable(20971520) %arg1, ptr noalias align 128 dereferenceable(16777216) %arg2, ptr noalias align 128 dereferenceable(16777216) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !42
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
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
  %15 = icmp ult i32 %linear_index_base, 4194304
  br i1 %15, label %fusion_17.in_bounds-true, label %fusion_17.in_bounds-after

fusion_17.in_bounds-after:                        ; preds = %fusion_17.in_bounds-true, %entry
  ret void

fusion_17.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %19 = load float, ptr %18, align 4, !invariant.load !34
  %add.5 = fadd float %17, %19
  %20 = add i32 %5, 0
  %21 = add i32 %4, 0
  %22 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %20, i32 %21
  %23 = load float, ptr %22, align 4, !invariant.load !34
  %add.7 = fadd float %add.5, %23
  %24 = add i32 %5, 0
  %25 = add i32 %4, 0
  %26 = getelementptr inbounds [8192 x [640 x float]], ptr %arg0, i32 0, i32 %24, i32 %25
  %27 = load float, ptr %26, align 4, !invariant.load !34
  %add.9 = fadd float %add.7, %27
  %28 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %add.9, ptr %28, align 4
  %29 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %30 = load float, ptr %29, align 4
  %31 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %32 = load float, ptr %31, align 4, !invariant.load !34
  %add.51 = fadd float %30, %32
  %33 = add i32 %8, 0
  %34 = add i32 %7, 0
  %35 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %33, i32 %34
  %36 = load float, ptr %35, align 4, !invariant.load !34
  %add.72 = fadd float %add.51, %36
  %37 = add i32 %8, 0
  %38 = add i32 %7, 0
  %39 = getelementptr inbounds [8192 x [640 x float]], ptr %arg0, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !34
  %add.93 = fadd float %add.72, %40
  %41 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %add.93, ptr %41, align 4
  %42 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %43 = load float, ptr %42, align 4
  %44 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %45 = load float, ptr %44, align 4, !invariant.load !34
  %add.54 = fadd float %43, %45
  %46 = add i32 %11, 0
  %47 = add i32 %10, 0
  %48 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %46, i32 %47
  %49 = load float, ptr %48, align 4, !invariant.load !34
  %add.75 = fadd float %add.54, %49
  %50 = add i32 %11, 0
  %51 = add i32 %10, 0
  %52 = getelementptr inbounds [8192 x [640 x float]], ptr %arg0, i32 0, i32 %50, i32 %51
  %53 = load float, ptr %52, align 4, !invariant.load !34
  %add.96 = fadd float %add.75, %53
  %54 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %add.96, ptr %54, align 4
  %55 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %56 = load float, ptr %55, align 4
  %57 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %58 = load float, ptr %57, align 4, !invariant.load !34
  %add.57 = fadd float %56, %58
  %59 = add i32 %14, 0
  %60 = add i32 %13, 0
  %61 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %59, i32 %60
  %62 = load float, ptr %61, align 4, !invariant.load !34
  %add.78 = fadd float %add.57, %62
  %63 = add i32 %14, 0
  %64 = add i32 %13, 0
  %65 = getelementptr inbounds [8192 x [640 x float]], ptr %arg0, i32 0, i32 %63, i32 %64
  %66 = load float, ptr %65, align 4, !invariant.load !34
  %add.99 = fadd float %add.78, %66
  %67 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %add.99, ptr %67, align 4
  br label %fusion_17.in_bounds-after
}

define void @fusion_16(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1, ptr noalias align 128 dereferenceable(16777216) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !42
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
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
  %15 = icmp ult i32 %linear_index_base, 4194304
  br i1 %15, label %fusion_16.in_bounds-true, label %fusion_16.in_bounds-after

fusion_16.in_bounds-after:                        ; preds = %fusion_16.in_bounds-true, %entry
  ret void

fusion_16.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !34
  %18 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !34
  %add.4 = fadd float %17, %19
  %region_0_8_constant_5 = load float, ptr @0, align 4
  %20 = fcmp oge float %add.4, %region_0_8_constant_5
  %21 = fcmp une float %add.4, %add.4
  %22 = or i1 %20, %21
  %maximum.7 = select i1 %22, float %add.4, float %region_0_8_constant_5
  %23 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %maximum.7, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4, !invariant.load !34
  %26 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %7
  %27 = load float, ptr %26, align 4, !invariant.load !34
  %add.41 = fadd float %25, %27
  %region_0_8_constant_52 = load float, ptr @0, align 4
  %28 = fcmp oge float %add.41, %region_0_8_constant_52
  %29 = fcmp une float %add.41, %add.41
  %30 = or i1 %28, %29
  %maximum.73 = select i1 %30, float %add.41, float %region_0_8_constant_52
  %31 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %maximum.73, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4, !invariant.load !34
  %34 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %10
  %35 = load float, ptr %34, align 4, !invariant.load !34
  %add.44 = fadd float %33, %35
  %region_0_8_constant_55 = load float, ptr @0, align 4
  %36 = fcmp oge float %add.44, %region_0_8_constant_55
  %37 = fcmp une float %add.44, %add.44
  %38 = or i1 %36, %37
  %maximum.76 = select i1 %38, float %add.44, float %region_0_8_constant_55
  %39 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %maximum.76, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4, !invariant.load !34
  %42 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %13
  %43 = load float, ptr %42, align 4, !invariant.load !34
  %add.47 = fadd float %41, %43
  %region_0_8_constant_58 = load float, ptr @0, align 4
  %44 = fcmp oge float %add.47, %region_0_8_constant_58
  %45 = fcmp une float %add.47, %add.47
  %46 = or i1 %44, %45
  %maximum.79 = select i1 %46, float %add.47, float %region_0_8_constant_58
  %47 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %maximum.79, ptr %47, align 4
  br label %fusion_16.in_bounds-after
}

define void @fusion_15(ptr noalias align 128 dereferenceable(983040) %arg0, ptr noalias align 16 dereferenceable(120) %arg1, ptr noalias align 128 dereferenceable(983040) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 61440
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 30
  %5 = udiv i32 %linear_index_base, 30
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 30
  %8 = udiv i32 %linear_index1, 30
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 30
  %11 = udiv i32 %linear_index2, 30
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 30
  %14 = udiv i32 %linear_index3, 30
  %15 = icmp ult i32 %linear_index_base, 245760
  br i1 %15, label %fusion_15.in_bounds-true, label %fusion_15.in_bounds-after

fusion_15.in_bounds-after:                        ; preds = %fusion_15.in_bounds-true, %entry
  ret void

fusion_15.in_bounds-true:                         ; preds = %entry
  %region_0_11_constant_3 = load float, ptr @1, align 4
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4, !invariant.load !34
  %18 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !34
  %add.6 = fadd float %17, %19
  %20 = fneg float %add.6
  %21 = call float @__nv_expf(float %20)
  %add.9 = fadd float %region_0_11_constant_3, %21
  %divide.10 = fdiv float %region_0_11_constant_3, %add.9
  %22 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %divide.10, ptr %22, align 4
  %region_0_11_constant_31 = load float, ptr @1, align 4
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %24 = load float, ptr %23, align 4, !invariant.load !34
  %25 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %7
  %26 = load float, ptr %25, align 4, !invariant.load !34
  %add.62 = fadd float %24, %26
  %27 = fneg float %add.62
  %28 = call float @__nv_expf(float %27)
  %add.93 = fadd float %region_0_11_constant_31, %28
  %divide.104 = fdiv float %region_0_11_constant_31, %add.93
  %29 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %divide.104, ptr %29, align 4
  %region_0_11_constant_35 = load float, ptr @1, align 4
  %30 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %31 = load float, ptr %30, align 4, !invariant.load !34
  %32 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %10
  %33 = load float, ptr %32, align 4, !invariant.load !34
  %add.66 = fadd float %31, %33
  %34 = fneg float %add.66
  %35 = call float @__nv_expf(float %34)
  %add.97 = fadd float %region_0_11_constant_35, %35
  %divide.108 = fdiv float %region_0_11_constant_35, %add.97
  %36 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %divide.108, ptr %36, align 4
  %region_0_11_constant_39 = load float, ptr @1, align 4
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %38 = load float, ptr %37, align 4, !invariant.load !34
  %39 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %13
  %40 = load float, ptr %39, align 4, !invariant.load !34
  %add.610 = fadd float %38, %40
  %41 = fneg float %add.610
  %42 = call float @__nv_expf(float %41)
  %add.911 = fadd float %region_0_11_constant_39, %42
  %divide.1012 = fdiv float %region_0_11_constant_39, %add.911
  %43 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %divide.1012, ptr %43, align 4
  br label %fusion_15.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_expf(float) #2

define void @concatenate_7(ptr noalias align 16 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(14680064) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 16 dereferenceable(4194304) %arg4, ptr noalias align 16 dereferenceable(4194304) %arg5, ptr noalias align 16 dereferenceable(1572864) %arg6, ptr noalias align 16 dereferenceable(2097152) %arg7, ptr noalias align 16 dereferenceable(786432) %arg8, ptr noalias align 128 dereferenceable(38010880) %arg9) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 2375680
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1160
  %5 = udiv i32 %linear_index_base, 1160
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 1160
  %8 = udiv i32 %linear_index1, 1160
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 1160
  %11 = udiv i32 %linear_index2, 1160
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 1160
  %14 = udiv i32 %linear_index3, 1160
  %15 = icmp ult i32 %linear_index_base, 9502720
  br i1 %15, label %concatenate_7.in_bounds-true, label %concatenate_7.in_bounds-after

concatenate_7.in_bounds-after:                    ; preds = %concatenate.10.merge63, %entry
  ret void

concatenate_7.in_bounds-true:                     ; preds = %entry
  br label %concatenate.pivot.768.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 1160
  %19 = mul i32 %18, 64
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 64
  %23 = udiv i32 %20, 64
  %24 = getelementptr inbounds float, ptr %arg0, i32 %20
  %25 = load float, ptr %24, align 4, !invariant.load !34
  br label %concatenate.10.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %26 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %27 = sub nsw i32 %4, %26
  %28 = udiv i32 %linear_index_base, 1160
  %29 = mul i32 %28, 128
  %30 = add i32 %29, %27
  %31 = udiv i32 %30, 1
  %32 = urem i32 %31, 128
  %33 = udiv i32 %30, 128
  %34 = getelementptr inbounds float, ptr %arg1, i32 %30
  %35 = load float, ptr %34, align 4, !invariant.load !34
  br label %concatenate.10.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.192.2
  %36 = phi i32 [ 192, %concatenate.pivot.192.2 ]
  %37 = sub nsw i32 %4, %36
  %38 = udiv i32 %linear_index_base, 1160
  %39 = mul i32 %38, 448
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 448
  %43 = udiv i32 %40, 448
  %44 = getelementptr inbounds float, ptr %arg2, i32 %40
  %45 = load float, ptr %44, align 4, !invariant.load !34
  br label %concatenate.10.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.640.3
  %46 = phi i32 [ 640, %concatenate.pivot.640.3 ]
  %47 = sub nsw i32 %4, %46
  %48 = udiv i32 %linear_index_base, 1160
  %49 = mul i32 %48, 128
  %50 = add i32 %49, %47
  %51 = udiv i32 %50, 1
  %52 = urem i32 %51, 128
  %53 = udiv i32 %50, 128
  %54 = getelementptr inbounds float, ptr %arg3, i32 %50
  %55 = load float, ptr %54, align 4, !invariant.load !34
  br label %concatenate.10.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.768.4
  %56 = phi i32 [ 768, %concatenate.pivot.768.4 ]
  %57 = sub nsw i32 %4, %56
  %58 = udiv i32 %linear_index_base, 1160
  %59 = mul i32 %58, 128
  %60 = add i32 %59, %57
  %61 = udiv i32 %60, 1
  %62 = urem i32 %61, 128
  %63 = udiv i32 %60, 128
  %64 = getelementptr inbounds float, ptr %arg4, i32 %60
  %65 = load float, ptr %64, align 4, !invariant.load !34
  br label %concatenate.10.merge

concat_index_from_operand_id5:                    ; preds = %concatenate.pivot.896.5
  %66 = phi i32 [ 896, %concatenate.pivot.896.5 ]
  %67 = sub nsw i32 %4, %66
  %68 = udiv i32 %linear_index_base, 1160
  %69 = mul i32 %68, 128
  %70 = add i32 %69, %67
  %71 = udiv i32 %70, 1
  %72 = urem i32 %71, 128
  %73 = udiv i32 %70, 128
  %74 = getelementptr inbounds float, ptr %arg5, i32 %70
  %75 = load float, ptr %74, align 4, !invariant.load !34
  br label %concatenate.10.merge

concat_index_from_operand_id6:                    ; preds = %concatenate.pivot.1024.6
  %76 = phi i32 [ 1024, %concatenate.pivot.1024.6 ]
  %77 = sub nsw i32 %4, %76
  %78 = udiv i32 %linear_index_base, 1160
  %79 = mul i32 %78, 48
  %80 = add i32 %79, %77
  %81 = udiv i32 %80, 1
  %82 = urem i32 %81, 48
  %83 = udiv i32 %80, 48
  %84 = getelementptr inbounds float, ptr %arg6, i32 %80
  %85 = load float, ptr %84, align 4, !invariant.load !34
  br label %concatenate.10.merge

concat_index_from_operand_id7:                    ; preds = %concatenate.pivot.1072.7
  %86 = phi i32 [ 1072, %concatenate.pivot.1072.7 ]
  %87 = sub nsw i32 %4, %86
  %88 = udiv i32 %linear_index_base, 1160
  %89 = mul i32 %88, 64
  %90 = add i32 %89, %87
  %91 = udiv i32 %90, 1
  %92 = urem i32 %91, 64
  %93 = udiv i32 %90, 64
  %94 = getelementptr inbounds float, ptr %arg7, i32 %90
  %95 = load float, ptr %94, align 4, !invariant.load !34
  br label %concatenate.10.merge

concat_index_from_operand_id8:                    ; preds = %concatenate.pivot.1136.8
  %96 = phi i32 [ 1136, %concatenate.pivot.1136.8 ]
  %97 = sub nsw i32 %4, %96
  %98 = udiv i32 %linear_index_base, 1160
  %99 = mul i32 %98, 24
  %100 = add i32 %99, %97
  %101 = udiv i32 %100, 1
  %102 = urem i32 %101, 24
  %103 = udiv i32 %100, 24
  %104 = getelementptr inbounds float, ptr %arg8, i32 %100
  %105 = load float, ptr %104, align 4, !invariant.load !34
  br label %concatenate.10.merge

concatenate.pivot.768.:                           ; preds = %concatenate_7.in_bounds-true
  %106 = icmp ult i32 %4, 768
  br i1 %106, label %concatenate.pivot.192., label %concatenate.pivot.1024.

concatenate.pivot.192.:                           ; preds = %concatenate.pivot.768.
  %107 = icmp ult i32 %4, 192
  br i1 %107, label %concatenate.pivot.64., label %concatenate.pivot.640.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.192.
  %108 = icmp ult i32 %4, 64
  br i1 %108, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.640.:                           ; preds = %concatenate.pivot.192.
  %109 = icmp ult i32 %4, 640
  br i1 %109, label %concatenate.pivot.192.2, label %concatenate.pivot.640.3

concatenate.pivot.192.2:                          ; preds = %concatenate.pivot.640.
  br label %concat_index_from_operand_id2

concatenate.pivot.640.3:                          ; preds = %concatenate.pivot.640.
  br label %concat_index_from_operand_id3

concatenate.pivot.1024.:                          ; preds = %concatenate.pivot.768.
  %110 = icmp ult i32 %4, 1024
  br i1 %110, label %concatenate.pivot.896., label %concatenate.pivot.1072.

concatenate.pivot.896.:                           ; preds = %concatenate.pivot.1024.
  %111 = icmp ult i32 %4, 896
  br i1 %111, label %concatenate.pivot.768.4, label %concatenate.pivot.896.5

concatenate.pivot.768.4:                          ; preds = %concatenate.pivot.896.
  br label %concat_index_from_operand_id4

concatenate.pivot.896.5:                          ; preds = %concatenate.pivot.896.
  br label %concat_index_from_operand_id5

concatenate.pivot.1072.:                          ; preds = %concatenate.pivot.1024.
  %112 = icmp ult i32 %4, 1072
  br i1 %112, label %concatenate.pivot.1024.6, label %concatenate.pivot.1136.

concatenate.pivot.1024.6:                         ; preds = %concatenate.pivot.1072.
  br label %concat_index_from_operand_id6

concatenate.pivot.1136.:                          ; preds = %concatenate.pivot.1072.
  %113 = icmp ult i32 %4, 1136
  br i1 %113, label %concatenate.pivot.1072.7, label %concatenate.pivot.1136.8

concatenate.pivot.1072.7:                         ; preds = %concatenate.pivot.1136.
  br label %concat_index_from_operand_id7

concatenate.pivot.1136.8:                         ; preds = %concatenate.pivot.1136.
  br label %concat_index_from_operand_id8

concatenate.10.merge:                             ; preds = %concat_index_from_operand_id8, %concat_index_from_operand_id7, %concat_index_from_operand_id6, %concat_index_from_operand_id5, %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %114 = phi float [ %25, %concat_index_from_operand_id0 ], [ %35, %concat_index_from_operand_id1 ], [ %45, %concat_index_from_operand_id2 ], [ %55, %concat_index_from_operand_id3 ], [ %65, %concat_index_from_operand_id4 ], [ %75, %concat_index_from_operand_id5 ], [ %85, %concat_index_from_operand_id6 ], [ %95, %concat_index_from_operand_id7 ], [ %105, %concat_index_from_operand_id8 ]
  %115 = getelementptr inbounds float, ptr %arg9, i32 %linear_index_base
  store float %114, ptr %115, align 4
  br label %concatenate.pivot.768.19

concat_index_from_operand_id010:                  ; preds = %concatenate.pivot.0.22
  %116 = phi i32 [ 0, %concatenate.pivot.0.22 ]
  %117 = sub nsw i32 %7, %116
  %118 = udiv i32 %linear_index1, 1160
  %119 = mul i32 %118, 64
  %120 = add i32 %119, %117
  %121 = udiv i32 %120, 1
  %122 = urem i32 %121, 64
  %123 = udiv i32 %120, 64
  %124 = getelementptr inbounds float, ptr %arg0, i32 %120
  %125 = load float, ptr %124, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concat_index_from_operand_id111:                  ; preds = %concatenate.pivot.64.23
  %126 = phi i32 [ 64, %concatenate.pivot.64.23 ]
  %127 = sub nsw i32 %7, %126
  %128 = udiv i32 %linear_index1, 1160
  %129 = mul i32 %128, 128
  %130 = add i32 %129, %127
  %131 = udiv i32 %130, 1
  %132 = urem i32 %131, 128
  %133 = udiv i32 %130, 128
  %134 = getelementptr inbounds float, ptr %arg1, i32 %130
  %135 = load float, ptr %134, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concat_index_from_operand_id212:                  ; preds = %concatenate.pivot.192.25
  %136 = phi i32 [ 192, %concatenate.pivot.192.25 ]
  %137 = sub nsw i32 %7, %136
  %138 = udiv i32 %linear_index1, 1160
  %139 = mul i32 %138, 448
  %140 = add i32 %139, %137
  %141 = udiv i32 %140, 1
  %142 = urem i32 %141, 448
  %143 = udiv i32 %140, 448
  %144 = getelementptr inbounds float, ptr %arg2, i32 %140
  %145 = load float, ptr %144, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concat_index_from_operand_id313:                  ; preds = %concatenate.pivot.640.26
  %146 = phi i32 [ 640, %concatenate.pivot.640.26 ]
  %147 = sub nsw i32 %7, %146
  %148 = udiv i32 %linear_index1, 1160
  %149 = mul i32 %148, 128
  %150 = add i32 %149, %147
  %151 = udiv i32 %150, 1
  %152 = urem i32 %151, 128
  %153 = udiv i32 %150, 128
  %154 = getelementptr inbounds float, ptr %arg3, i32 %150
  %155 = load float, ptr %154, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concat_index_from_operand_id414:                  ; preds = %concatenate.pivot.768.29
  %156 = phi i32 [ 768, %concatenate.pivot.768.29 ]
  %157 = sub nsw i32 %7, %156
  %158 = udiv i32 %linear_index1, 1160
  %159 = mul i32 %158, 128
  %160 = add i32 %159, %157
  %161 = udiv i32 %160, 1
  %162 = urem i32 %161, 128
  %163 = udiv i32 %160, 128
  %164 = getelementptr inbounds float, ptr %arg4, i32 %160
  %165 = load float, ptr %164, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concat_index_from_operand_id515:                  ; preds = %concatenate.pivot.896.30
  %166 = phi i32 [ 896, %concatenate.pivot.896.30 ]
  %167 = sub nsw i32 %7, %166
  %168 = udiv i32 %linear_index1, 1160
  %169 = mul i32 %168, 128
  %170 = add i32 %169, %167
  %171 = udiv i32 %170, 1
  %172 = urem i32 %171, 128
  %173 = udiv i32 %170, 128
  %174 = getelementptr inbounds float, ptr %arg5, i32 %170
  %175 = load float, ptr %174, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concat_index_from_operand_id616:                  ; preds = %concatenate.pivot.1024.32
  %176 = phi i32 [ 1024, %concatenate.pivot.1024.32 ]
  %177 = sub nsw i32 %7, %176
  %178 = udiv i32 %linear_index1, 1160
  %179 = mul i32 %178, 48
  %180 = add i32 %179, %177
  %181 = udiv i32 %180, 1
  %182 = urem i32 %181, 48
  %183 = udiv i32 %180, 48
  %184 = getelementptr inbounds float, ptr %arg6, i32 %180
  %185 = load float, ptr %184, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concat_index_from_operand_id717:                  ; preds = %concatenate.pivot.1072.34
  %186 = phi i32 [ 1072, %concatenate.pivot.1072.34 ]
  %187 = sub nsw i32 %7, %186
  %188 = udiv i32 %linear_index1, 1160
  %189 = mul i32 %188, 64
  %190 = add i32 %189, %187
  %191 = udiv i32 %190, 1
  %192 = urem i32 %191, 64
  %193 = udiv i32 %190, 64
  %194 = getelementptr inbounds float, ptr %arg7, i32 %190
  %195 = load float, ptr %194, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concat_index_from_operand_id818:                  ; preds = %concatenate.pivot.1136.35
  %196 = phi i32 [ 1136, %concatenate.pivot.1136.35 ]
  %197 = sub nsw i32 %7, %196
  %198 = udiv i32 %linear_index1, 1160
  %199 = mul i32 %198, 24
  %200 = add i32 %199, %197
  %201 = udiv i32 %200, 1
  %202 = urem i32 %201, 24
  %203 = udiv i32 %200, 24
  %204 = getelementptr inbounds float, ptr %arg8, i32 %200
  %205 = load float, ptr %204, align 4, !invariant.load !34
  br label %concatenate.10.merge9

concatenate.pivot.768.19:                         ; preds = %concatenate.10.merge
  %206 = icmp ult i32 %7, 768
  br i1 %206, label %concatenate.pivot.192.20, label %concatenate.pivot.1024.27

concatenate.pivot.192.20:                         ; preds = %concatenate.pivot.768.19
  %207 = icmp ult i32 %7, 192
  br i1 %207, label %concatenate.pivot.64.21, label %concatenate.pivot.640.24

concatenate.pivot.64.21:                          ; preds = %concatenate.pivot.192.20
  %208 = icmp ult i32 %7, 64
  br i1 %208, label %concatenate.pivot.0.22, label %concatenate.pivot.64.23

concatenate.pivot.0.22:                           ; preds = %concatenate.pivot.64.21
  br label %concat_index_from_operand_id010

concatenate.pivot.64.23:                          ; preds = %concatenate.pivot.64.21
  br label %concat_index_from_operand_id111

concatenate.pivot.640.24:                         ; preds = %concatenate.pivot.192.20
  %209 = icmp ult i32 %7, 640
  br i1 %209, label %concatenate.pivot.192.25, label %concatenate.pivot.640.26

concatenate.pivot.192.25:                         ; preds = %concatenate.pivot.640.24
  br label %concat_index_from_operand_id212

concatenate.pivot.640.26:                         ; preds = %concatenate.pivot.640.24
  br label %concat_index_from_operand_id313

concatenate.pivot.1024.27:                        ; preds = %concatenate.pivot.768.19
  %210 = icmp ult i32 %7, 1024
  br i1 %210, label %concatenate.pivot.896.28, label %concatenate.pivot.1072.31

concatenate.pivot.896.28:                         ; preds = %concatenate.pivot.1024.27
  %211 = icmp ult i32 %7, 896
  br i1 %211, label %concatenate.pivot.768.29, label %concatenate.pivot.896.30

concatenate.pivot.768.29:                         ; preds = %concatenate.pivot.896.28
  br label %concat_index_from_operand_id414

concatenate.pivot.896.30:                         ; preds = %concatenate.pivot.896.28
  br label %concat_index_from_operand_id515

concatenate.pivot.1072.31:                        ; preds = %concatenate.pivot.1024.27
  %212 = icmp ult i32 %7, 1072
  br i1 %212, label %concatenate.pivot.1024.32, label %concatenate.pivot.1136.33

concatenate.pivot.1024.32:                        ; preds = %concatenate.pivot.1072.31
  br label %concat_index_from_operand_id616

concatenate.pivot.1136.33:                        ; preds = %concatenate.pivot.1072.31
  %213 = icmp ult i32 %7, 1136
  br i1 %213, label %concatenate.pivot.1072.34, label %concatenate.pivot.1136.35

concatenate.pivot.1072.34:                        ; preds = %concatenate.pivot.1136.33
  br label %concat_index_from_operand_id717

concatenate.pivot.1136.35:                        ; preds = %concatenate.pivot.1136.33
  br label %concat_index_from_operand_id818

concatenate.10.merge9:                            ; preds = %concat_index_from_operand_id818, %concat_index_from_operand_id717, %concat_index_from_operand_id616, %concat_index_from_operand_id515, %concat_index_from_operand_id414, %concat_index_from_operand_id313, %concat_index_from_operand_id212, %concat_index_from_operand_id111, %concat_index_from_operand_id010
  %214 = phi float [ %125, %concat_index_from_operand_id010 ], [ %135, %concat_index_from_operand_id111 ], [ %145, %concat_index_from_operand_id212 ], [ %155, %concat_index_from_operand_id313 ], [ %165, %concat_index_from_operand_id414 ], [ %175, %concat_index_from_operand_id515 ], [ %185, %concat_index_from_operand_id616 ], [ %195, %concat_index_from_operand_id717 ], [ %205, %concat_index_from_operand_id818 ]
  %215 = getelementptr inbounds float, ptr %arg9, i32 %linear_index1
  store float %214, ptr %215, align 4
  br label %concatenate.pivot.768.46

concat_index_from_operand_id037:                  ; preds = %concatenate.pivot.0.49
  %216 = phi i32 [ 0, %concatenate.pivot.0.49 ]
  %217 = sub nsw i32 %10, %216
  %218 = udiv i32 %linear_index2, 1160
  %219 = mul i32 %218, 64
  %220 = add i32 %219, %217
  %221 = udiv i32 %220, 1
  %222 = urem i32 %221, 64
  %223 = udiv i32 %220, 64
  %224 = getelementptr inbounds float, ptr %arg0, i32 %220
  %225 = load float, ptr %224, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concat_index_from_operand_id138:                  ; preds = %concatenate.pivot.64.50
  %226 = phi i32 [ 64, %concatenate.pivot.64.50 ]
  %227 = sub nsw i32 %10, %226
  %228 = udiv i32 %linear_index2, 1160
  %229 = mul i32 %228, 128
  %230 = add i32 %229, %227
  %231 = udiv i32 %230, 1
  %232 = urem i32 %231, 128
  %233 = udiv i32 %230, 128
  %234 = getelementptr inbounds float, ptr %arg1, i32 %230
  %235 = load float, ptr %234, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concat_index_from_operand_id239:                  ; preds = %concatenate.pivot.192.52
  %236 = phi i32 [ 192, %concatenate.pivot.192.52 ]
  %237 = sub nsw i32 %10, %236
  %238 = udiv i32 %linear_index2, 1160
  %239 = mul i32 %238, 448
  %240 = add i32 %239, %237
  %241 = udiv i32 %240, 1
  %242 = urem i32 %241, 448
  %243 = udiv i32 %240, 448
  %244 = getelementptr inbounds float, ptr %arg2, i32 %240
  %245 = load float, ptr %244, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concat_index_from_operand_id340:                  ; preds = %concatenate.pivot.640.53
  %246 = phi i32 [ 640, %concatenate.pivot.640.53 ]
  %247 = sub nsw i32 %10, %246
  %248 = udiv i32 %linear_index2, 1160
  %249 = mul i32 %248, 128
  %250 = add i32 %249, %247
  %251 = udiv i32 %250, 1
  %252 = urem i32 %251, 128
  %253 = udiv i32 %250, 128
  %254 = getelementptr inbounds float, ptr %arg3, i32 %250
  %255 = load float, ptr %254, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concat_index_from_operand_id441:                  ; preds = %concatenate.pivot.768.56
  %256 = phi i32 [ 768, %concatenate.pivot.768.56 ]
  %257 = sub nsw i32 %10, %256
  %258 = udiv i32 %linear_index2, 1160
  %259 = mul i32 %258, 128
  %260 = add i32 %259, %257
  %261 = udiv i32 %260, 1
  %262 = urem i32 %261, 128
  %263 = udiv i32 %260, 128
  %264 = getelementptr inbounds float, ptr %arg4, i32 %260
  %265 = load float, ptr %264, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concat_index_from_operand_id542:                  ; preds = %concatenate.pivot.896.57
  %266 = phi i32 [ 896, %concatenate.pivot.896.57 ]
  %267 = sub nsw i32 %10, %266
  %268 = udiv i32 %linear_index2, 1160
  %269 = mul i32 %268, 128
  %270 = add i32 %269, %267
  %271 = udiv i32 %270, 1
  %272 = urem i32 %271, 128
  %273 = udiv i32 %270, 128
  %274 = getelementptr inbounds float, ptr %arg5, i32 %270
  %275 = load float, ptr %274, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concat_index_from_operand_id643:                  ; preds = %concatenate.pivot.1024.59
  %276 = phi i32 [ 1024, %concatenate.pivot.1024.59 ]
  %277 = sub nsw i32 %10, %276
  %278 = udiv i32 %linear_index2, 1160
  %279 = mul i32 %278, 48
  %280 = add i32 %279, %277
  %281 = udiv i32 %280, 1
  %282 = urem i32 %281, 48
  %283 = udiv i32 %280, 48
  %284 = getelementptr inbounds float, ptr %arg6, i32 %280
  %285 = load float, ptr %284, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concat_index_from_operand_id744:                  ; preds = %concatenate.pivot.1072.61
  %286 = phi i32 [ 1072, %concatenate.pivot.1072.61 ]
  %287 = sub nsw i32 %10, %286
  %288 = udiv i32 %linear_index2, 1160
  %289 = mul i32 %288, 64
  %290 = add i32 %289, %287
  %291 = udiv i32 %290, 1
  %292 = urem i32 %291, 64
  %293 = udiv i32 %290, 64
  %294 = getelementptr inbounds float, ptr %arg7, i32 %290
  %295 = load float, ptr %294, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concat_index_from_operand_id845:                  ; preds = %concatenate.pivot.1136.62
  %296 = phi i32 [ 1136, %concatenate.pivot.1136.62 ]
  %297 = sub nsw i32 %10, %296
  %298 = udiv i32 %linear_index2, 1160
  %299 = mul i32 %298, 24
  %300 = add i32 %299, %297
  %301 = udiv i32 %300, 1
  %302 = urem i32 %301, 24
  %303 = udiv i32 %300, 24
  %304 = getelementptr inbounds float, ptr %arg8, i32 %300
  %305 = load float, ptr %304, align 4, !invariant.load !34
  br label %concatenate.10.merge36

concatenate.pivot.768.46:                         ; preds = %concatenate.10.merge9
  %306 = icmp ult i32 %10, 768
  br i1 %306, label %concatenate.pivot.192.47, label %concatenate.pivot.1024.54

concatenate.pivot.192.47:                         ; preds = %concatenate.pivot.768.46
  %307 = icmp ult i32 %10, 192
  br i1 %307, label %concatenate.pivot.64.48, label %concatenate.pivot.640.51

concatenate.pivot.64.48:                          ; preds = %concatenate.pivot.192.47
  %308 = icmp ult i32 %10, 64
  br i1 %308, label %concatenate.pivot.0.49, label %concatenate.pivot.64.50

concatenate.pivot.0.49:                           ; preds = %concatenate.pivot.64.48
  br label %concat_index_from_operand_id037

concatenate.pivot.64.50:                          ; preds = %concatenate.pivot.64.48
  br label %concat_index_from_operand_id138

concatenate.pivot.640.51:                         ; preds = %concatenate.pivot.192.47
  %309 = icmp ult i32 %10, 640
  br i1 %309, label %concatenate.pivot.192.52, label %concatenate.pivot.640.53

concatenate.pivot.192.52:                         ; preds = %concatenate.pivot.640.51
  br label %concat_index_from_operand_id239

concatenate.pivot.640.53:                         ; preds = %concatenate.pivot.640.51
  br label %concat_index_from_operand_id340

concatenate.pivot.1024.54:                        ; preds = %concatenate.pivot.768.46
  %310 = icmp ult i32 %10, 1024
  br i1 %310, label %concatenate.pivot.896.55, label %concatenate.pivot.1072.58

concatenate.pivot.896.55:                         ; preds = %concatenate.pivot.1024.54
  %311 = icmp ult i32 %10, 896
  br i1 %311, label %concatenate.pivot.768.56, label %concatenate.pivot.896.57

concatenate.pivot.768.56:                         ; preds = %concatenate.pivot.896.55
  br label %concat_index_from_operand_id441

concatenate.pivot.896.57:                         ; preds = %concatenate.pivot.896.55
  br label %concat_index_from_operand_id542

concatenate.pivot.1072.58:                        ; preds = %concatenate.pivot.1024.54
  %312 = icmp ult i32 %10, 1072
  br i1 %312, label %concatenate.pivot.1024.59, label %concatenate.pivot.1136.60

concatenate.pivot.1024.59:                        ; preds = %concatenate.pivot.1072.58
  br label %concat_index_from_operand_id643

concatenate.pivot.1136.60:                        ; preds = %concatenate.pivot.1072.58
  %313 = icmp ult i32 %10, 1136
  br i1 %313, label %concatenate.pivot.1072.61, label %concatenate.pivot.1136.62

concatenate.pivot.1072.61:                        ; preds = %concatenate.pivot.1136.60
  br label %concat_index_from_operand_id744

concatenate.pivot.1136.62:                        ; preds = %concatenate.pivot.1136.60
  br label %concat_index_from_operand_id845

concatenate.10.merge36:                           ; preds = %concat_index_from_operand_id845, %concat_index_from_operand_id744, %concat_index_from_operand_id643, %concat_index_from_operand_id542, %concat_index_from_operand_id441, %concat_index_from_operand_id340, %concat_index_from_operand_id239, %concat_index_from_operand_id138, %concat_index_from_operand_id037
  %314 = phi float [ %225, %concat_index_from_operand_id037 ], [ %235, %concat_index_from_operand_id138 ], [ %245, %concat_index_from_operand_id239 ], [ %255, %concat_index_from_operand_id340 ], [ %265, %concat_index_from_operand_id441 ], [ %275, %concat_index_from_operand_id542 ], [ %285, %concat_index_from_operand_id643 ], [ %295, %concat_index_from_operand_id744 ], [ %305, %concat_index_from_operand_id845 ]
  %315 = getelementptr inbounds float, ptr %arg9, i32 %linear_index2
  store float %314, ptr %315, align 4
  br label %concatenate.pivot.768.73

concat_index_from_operand_id064:                  ; preds = %concatenate.pivot.0.76
  %316 = phi i32 [ 0, %concatenate.pivot.0.76 ]
  %317 = sub nsw i32 %13, %316
  %318 = udiv i32 %linear_index3, 1160
  %319 = mul i32 %318, 64
  %320 = add i32 %319, %317
  %321 = udiv i32 %320, 1
  %322 = urem i32 %321, 64
  %323 = udiv i32 %320, 64
  %324 = getelementptr inbounds float, ptr %arg0, i32 %320
  %325 = load float, ptr %324, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concat_index_from_operand_id165:                  ; preds = %concatenate.pivot.64.77
  %326 = phi i32 [ 64, %concatenate.pivot.64.77 ]
  %327 = sub nsw i32 %13, %326
  %328 = udiv i32 %linear_index3, 1160
  %329 = mul i32 %328, 128
  %330 = add i32 %329, %327
  %331 = udiv i32 %330, 1
  %332 = urem i32 %331, 128
  %333 = udiv i32 %330, 128
  %334 = getelementptr inbounds float, ptr %arg1, i32 %330
  %335 = load float, ptr %334, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concat_index_from_operand_id266:                  ; preds = %concatenate.pivot.192.79
  %336 = phi i32 [ 192, %concatenate.pivot.192.79 ]
  %337 = sub nsw i32 %13, %336
  %338 = udiv i32 %linear_index3, 1160
  %339 = mul i32 %338, 448
  %340 = add i32 %339, %337
  %341 = udiv i32 %340, 1
  %342 = urem i32 %341, 448
  %343 = udiv i32 %340, 448
  %344 = getelementptr inbounds float, ptr %arg2, i32 %340
  %345 = load float, ptr %344, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concat_index_from_operand_id367:                  ; preds = %concatenate.pivot.640.80
  %346 = phi i32 [ 640, %concatenate.pivot.640.80 ]
  %347 = sub nsw i32 %13, %346
  %348 = udiv i32 %linear_index3, 1160
  %349 = mul i32 %348, 128
  %350 = add i32 %349, %347
  %351 = udiv i32 %350, 1
  %352 = urem i32 %351, 128
  %353 = udiv i32 %350, 128
  %354 = getelementptr inbounds float, ptr %arg3, i32 %350
  %355 = load float, ptr %354, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concat_index_from_operand_id468:                  ; preds = %concatenate.pivot.768.83
  %356 = phi i32 [ 768, %concatenate.pivot.768.83 ]
  %357 = sub nsw i32 %13, %356
  %358 = udiv i32 %linear_index3, 1160
  %359 = mul i32 %358, 128
  %360 = add i32 %359, %357
  %361 = udiv i32 %360, 1
  %362 = urem i32 %361, 128
  %363 = udiv i32 %360, 128
  %364 = getelementptr inbounds float, ptr %arg4, i32 %360
  %365 = load float, ptr %364, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concat_index_from_operand_id569:                  ; preds = %concatenate.pivot.896.84
  %366 = phi i32 [ 896, %concatenate.pivot.896.84 ]
  %367 = sub nsw i32 %13, %366
  %368 = udiv i32 %linear_index3, 1160
  %369 = mul i32 %368, 128
  %370 = add i32 %369, %367
  %371 = udiv i32 %370, 1
  %372 = urem i32 %371, 128
  %373 = udiv i32 %370, 128
  %374 = getelementptr inbounds float, ptr %arg5, i32 %370
  %375 = load float, ptr %374, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concat_index_from_operand_id670:                  ; preds = %concatenate.pivot.1024.86
  %376 = phi i32 [ 1024, %concatenate.pivot.1024.86 ]
  %377 = sub nsw i32 %13, %376
  %378 = udiv i32 %linear_index3, 1160
  %379 = mul i32 %378, 48
  %380 = add i32 %379, %377
  %381 = udiv i32 %380, 1
  %382 = urem i32 %381, 48
  %383 = udiv i32 %380, 48
  %384 = getelementptr inbounds float, ptr %arg6, i32 %380
  %385 = load float, ptr %384, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concat_index_from_operand_id771:                  ; preds = %concatenate.pivot.1072.88
  %386 = phi i32 [ 1072, %concatenate.pivot.1072.88 ]
  %387 = sub nsw i32 %13, %386
  %388 = udiv i32 %linear_index3, 1160
  %389 = mul i32 %388, 64
  %390 = add i32 %389, %387
  %391 = udiv i32 %390, 1
  %392 = urem i32 %391, 64
  %393 = udiv i32 %390, 64
  %394 = getelementptr inbounds float, ptr %arg7, i32 %390
  %395 = load float, ptr %394, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concat_index_from_operand_id872:                  ; preds = %concatenate.pivot.1136.89
  %396 = phi i32 [ 1136, %concatenate.pivot.1136.89 ]
  %397 = sub nsw i32 %13, %396
  %398 = udiv i32 %linear_index3, 1160
  %399 = mul i32 %398, 24
  %400 = add i32 %399, %397
  %401 = udiv i32 %400, 1
  %402 = urem i32 %401, 24
  %403 = udiv i32 %400, 24
  %404 = getelementptr inbounds float, ptr %arg8, i32 %400
  %405 = load float, ptr %404, align 4, !invariant.load !34
  br label %concatenate.10.merge63

concatenate.pivot.768.73:                         ; preds = %concatenate.10.merge36
  %406 = icmp ult i32 %13, 768
  br i1 %406, label %concatenate.pivot.192.74, label %concatenate.pivot.1024.81

concatenate.pivot.192.74:                         ; preds = %concatenate.pivot.768.73
  %407 = icmp ult i32 %13, 192
  br i1 %407, label %concatenate.pivot.64.75, label %concatenate.pivot.640.78

concatenate.pivot.64.75:                          ; preds = %concatenate.pivot.192.74
  %408 = icmp ult i32 %13, 64
  br i1 %408, label %concatenate.pivot.0.76, label %concatenate.pivot.64.77

concatenate.pivot.0.76:                           ; preds = %concatenate.pivot.64.75
  br label %concat_index_from_operand_id064

concatenate.pivot.64.77:                          ; preds = %concatenate.pivot.64.75
  br label %concat_index_from_operand_id165

concatenate.pivot.640.78:                         ; preds = %concatenate.pivot.192.74
  %409 = icmp ult i32 %13, 640
  br i1 %409, label %concatenate.pivot.192.79, label %concatenate.pivot.640.80

concatenate.pivot.192.79:                         ; preds = %concatenate.pivot.640.78
  br label %concat_index_from_operand_id266

concatenate.pivot.640.80:                         ; preds = %concatenate.pivot.640.78
  br label %concat_index_from_operand_id367

concatenate.pivot.1024.81:                        ; preds = %concatenate.pivot.768.73
  %410 = icmp ult i32 %13, 1024
  br i1 %410, label %concatenate.pivot.896.82, label %concatenate.pivot.1072.85

concatenate.pivot.896.82:                         ; preds = %concatenate.pivot.1024.81
  %411 = icmp ult i32 %13, 896
  br i1 %411, label %concatenate.pivot.768.83, label %concatenate.pivot.896.84

concatenate.pivot.768.83:                         ; preds = %concatenate.pivot.896.82
  br label %concat_index_from_operand_id468

concatenate.pivot.896.84:                         ; preds = %concatenate.pivot.896.82
  br label %concat_index_from_operand_id569

concatenate.pivot.1072.85:                        ; preds = %concatenate.pivot.1024.81
  %412 = icmp ult i32 %13, 1072
  br i1 %412, label %concatenate.pivot.1024.86, label %concatenate.pivot.1136.87

concatenate.pivot.1024.86:                        ; preds = %concatenate.pivot.1072.85
  br label %concat_index_from_operand_id670

concatenate.pivot.1136.87:                        ; preds = %concatenate.pivot.1072.85
  %413 = icmp ult i32 %13, 1136
  br i1 %413, label %concatenate.pivot.1072.88, label %concatenate.pivot.1136.89

concatenate.pivot.1072.88:                        ; preds = %concatenate.pivot.1136.87
  br label %concat_index_from_operand_id771

concatenate.pivot.1136.89:                        ; preds = %concatenate.pivot.1136.87
  br label %concat_index_from_operand_id872

concatenate.10.merge63:                           ; preds = %concat_index_from_operand_id872, %concat_index_from_operand_id771, %concat_index_from_operand_id670, %concat_index_from_operand_id569, %concat_index_from_operand_id468, %concat_index_from_operand_id367, %concat_index_from_operand_id266, %concat_index_from_operand_id165, %concat_index_from_operand_id064
  %414 = phi float [ %325, %concat_index_from_operand_id064 ], [ %335, %concat_index_from_operand_id165 ], [ %345, %concat_index_from_operand_id266 ], [ %355, %concat_index_from_operand_id367 ], [ %365, %concat_index_from_operand_id468 ], [ %375, %concat_index_from_operand_id569 ], [ %385, %concat_index_from_operand_id670 ], [ %395, %concat_index_from_operand_id771 ], [ %405, %concat_index_from_operand_id872 ]
  %415 = getelementptr inbounds float, ptr %arg9, i32 %linear_index3
  store float %414, ptr %415, align 4
  br label %concatenate_7.in_bounds-after
}

define void @fusion_9(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !42
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1048576
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
  %15 = icmp ult i32 %linear_index_base, 4194304
  br i1 %15, label %fusion_9.in_bounds-true, label %fusion_9.in_bounds-after

fusion_9.in_bounds-after:                         ; preds = %fusion_9.in_bounds-true, %entry
  ret void

fusion_9.in_bounds-true:                          ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !34
  %add.4 = fadd float %17, %19
  %region_0_8_constant_5 = load float, ptr @2, align 4
  %20 = fcmp oge float %add.4, %region_0_8_constant_5
  %21 = fcmp une float %add.4, %add.4
  %22 = or i1 %20, %21
  %maximum.7 = select i1 %22, float %add.4, float %region_0_8_constant_5
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  store float %maximum.7, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4
  %26 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %7
  %27 = load float, ptr %26, align 4, !invariant.load !34
  %add.41 = fadd float %25, %27
  %region_0_8_constant_52 = load float, ptr @2, align 4
  %28 = fcmp oge float %add.41, %region_0_8_constant_52
  %29 = fcmp une float %add.41, %add.41
  %30 = or i1 %28, %29
  %maximum.73 = select i1 %30, float %add.41, float %region_0_8_constant_52
  %31 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %maximum.73, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4
  %34 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %10
  %35 = load float, ptr %34, align 4, !invariant.load !34
  %add.44 = fadd float %33, %35
  %region_0_8_constant_55 = load float, ptr @2, align 4
  %36 = fcmp oge float %add.44, %region_0_8_constant_55
  %37 = fcmp une float %add.44, %add.44
  %38 = or i1 %36, %37
  %maximum.76 = select i1 %38, float %add.44, float %region_0_8_constant_55
  %39 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %maximum.76, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4
  %42 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %13
  %43 = load float, ptr %42, align 4, !invariant.load !34
  %add.47 = fadd float %41, %43
  %region_0_8_constant_58 = load float, ptr @2, align 4
  %44 = fcmp oge float %add.47, %region_0_8_constant_58
  %45 = fcmp une float %add.47, %add.47
  %46 = or i1 %44, %45
  %maximum.79 = select i1 %46, float %add.47, float %region_0_8_constant_58
  %47 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %maximum.79, ptr %47, align 4
  br label %fusion_9.in_bounds-after
}

define void @fusion_8(ptr noalias align 128 dereferenceable(983040) %arg0, ptr noalias align 16 dereferenceable(120) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 61440
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 30
  %5 = udiv i32 %linear_index_base, 30
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 30
  %8 = udiv i32 %linear_index1, 30
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 30
  %11 = udiv i32 %linear_index2, 30
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 30
  %14 = udiv i32 %linear_index3, 30
  %15 = icmp ult i32 %linear_index_base, 245760
  br i1 %15, label %fusion_8.in_bounds-true, label %fusion_8.in_bounds-after

fusion_8.in_bounds-after:                         ; preds = %fusion_8.in_bounds-true, %entry
  ret void

fusion_8.in_bounds-true:                          ; preds = %entry
  %region_0_11_constant_3 = load float, ptr @3, align 4
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !34
  %add.6 = fadd float %17, %19
  %20 = fneg float %add.6
  %21 = call float @__nv_expf(float %20)
  %add.9 = fadd float %region_0_11_constant_3, %21
  %divide.10 = fdiv float %region_0_11_constant_3, %add.9
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  store float %divide.10, ptr %22, align 4
  %region_0_11_constant_31 = load float, ptr @3, align 4
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %24 = load float, ptr %23, align 4
  %25 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %7
  %26 = load float, ptr %25, align 4, !invariant.load !34
  %add.62 = fadd float %24, %26
  %27 = fneg float %add.62
  %28 = call float @__nv_expf(float %27)
  %add.93 = fadd float %region_0_11_constant_31, %28
  %divide.104 = fdiv float %region_0_11_constant_31, %add.93
  %29 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %divide.104, ptr %29, align 4
  %region_0_11_constant_35 = load float, ptr @3, align 4
  %30 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %31 = load float, ptr %30, align 4
  %32 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %10
  %33 = load float, ptr %32, align 4, !invariant.load !34
  %add.66 = fadd float %31, %33
  %34 = fneg float %add.66
  %35 = call float @__nv_expf(float %34)
  %add.97 = fadd float %region_0_11_constant_35, %35
  %divide.108 = fdiv float %region_0_11_constant_35, %add.97
  %36 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %divide.108, ptr %36, align 4
  %region_0_11_constant_39 = load float, ptr @3, align 4
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %39 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %13
  %40 = load float, ptr %39, align 4, !invariant.load !34
  %add.610 = fadd float %38, %40
  %41 = fneg float %add.610
  %42 = call float @__nv_expf(float %41)
  %add.911 = fadd float %region_0_11_constant_39, %42
  %divide.1012 = fdiv float %region_0_11_constant_39, %add.911
  %43 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %divide.1012, ptr %43, align 4
  br label %fusion_8.in_bounds-after
}

define void @add_15(ptr noalias align 128 dereferenceable(31719424) %arg0, ptr noalias align 128 dereferenceable(31719424) %arg1) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %add_15.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 7929856
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !38
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !39
  %4 = mul nuw nsw i32 %2, 128
  %linear_index = add nuw nsw i32 %4, %3
  %linear_index_in_range = icmp ult i32 %linear_index, 110592
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %linear_index_plus_base = add nuw nsw i32 %linear_index_base, %loop.indvar
  %5 = udiv i32 %linear_index_plus_base, 1
  %6 = urem i32 %5, 968
  %7 = udiv i32 %linear_index_plus_base, 968
  %linear_index1 = add nuw nsw i32 %linear_index_plus_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 968
  %10 = udiv i32 %linear_index1, 968
  %linear_index2 = add nuw nsw i32 %linear_index_plus_base, 2
  %11 = udiv i32 %linear_index2, 1
  %12 = urem i32 %11, 968
  %13 = udiv i32 %linear_index2, 968
  %linear_index3 = add nuw nsw i32 %linear_index_plus_base, 3
  %14 = udiv i32 %linear_index3, 1
  %15 = urem i32 %14, 968
  %16 = udiv i32 %linear_index3, 968
  %17 = icmp ult i32 %linear_index_plus_base, 7929856
  br i1 %17, label %add_15.in_bounds-true, label %add_15.in_bounds-after

add_15.in_bounds-after:                           ; preds = %add_15.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !45

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

add_15.in_bounds-true:                            ; preds = %loop.loop_body
  %18 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  %21 = load float, ptr %20, align 4, !invariant.load !34
  %add.3 = fadd float %19, %21
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  store float %add.3, ptr %22, align 4
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %24 = load float, ptr %23, align 4
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4, !invariant.load !34
  %add.31 = fadd float %24, %26
  %27 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %add.31, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %31 = load float, ptr %30, align 4, !invariant.load !34
  %add.32 = fadd float %29, %31
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %add.32, ptr %32, align 4
  %33 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %34 = load float, ptr %33, align 4
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %36 = load float, ptr %35, align 4, !invariant.load !34
  %add.33 = fadd float %34, %36
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %add.33, ptr %37, align 4
  br label %add_15.in_bounds-after
}

define void @fusion_10(ptr noalias align 128 dereferenceable(4456448) %arg0, ptr noalias align 128 dereferenceable(27262976) %arg1, ptr noalias align 128 dereferenceable(983040) %arg2, ptr noalias align 128 dereferenceable(983040) %arg3, ptr noalias align 16 dereferenceable(3872) %arg4, ptr noalias align 128 dereferenceable(31719424) %arg5, ptr noalias align 128 dereferenceable(31719424) %arg6, ptr noalias align 128 dereferenceable(31719424) %arg7) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !46
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 1982464
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 968
  %5 = udiv i32 %linear_index_base, 968
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 968
  %8 = udiv i32 %linear_index1, 968
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 968
  %11 = udiv i32 %linear_index2, 968
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 968
  %14 = udiv i32 %linear_index3, 968
  %15 = icmp ult i32 %linear_index_base, 7929856
  br i1 %15, label %fusion_10.in_bounds-true, label %fusion_10.in_bounds-after

fusion_10.in_bounds-after:                        ; preds = %concatenate.36.merge101, %entry
  ret void

fusion_10.in_bounds-true:                         ; preds = %entry
  br label %concatenate.pivot.832.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %16 = phi i32 [ 0, %concatenate.pivot.0. ]
  %17 = sub nsw i32 %4, %16
  %18 = udiv i32 %linear_index_base, 968
  %19 = mul i32 %18, 832
  %20 = add i32 %19, %17
  %21 = udiv i32 %20, 1
  %22 = urem i32 %21, 832
  %23 = udiv i32 %20, 832
  %24 = mul nuw nsw i32 %17, 1
  %25 = add nuw nsw i32 0, %24
  %26 = urem i32 %25, 64
  %27 = udiv i32 %25, 64
  %28 = udiv i32 %27, 13
  %29 = mul nuw nsw i32 %5, 1
  %30 = add nuw nsw i32 0, %29
  %31 = udiv i32 %30, 8192
  %32 = udiv i32 %20, 64
  %33 = add i32 %30, 0
  %34 = add i32 %27, 0
  %region_0_39_constant_8 = load float, ptr @5, align 4
  %35 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %33, i32 %34
  %36 = load float, ptr %35, align 4, !invariant.load !34
  %multiply.10 = fmul float %region_0_39_constant_8, %36
  %37 = getelementptr inbounds float, ptr %arg1, i32 %20
  %38 = load float, ptr %37, align 4, !invariant.load !34
  %multiply.13 = fmul float %multiply.10, %38
  br label %concatenate.19.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.832.3
  %39 = phi i32 [ 832, %concatenate.pivot.832.3 ]
  %40 = sub nsw i32 %4, %39
  %41 = udiv i32 %linear_index_base, 968
  %42 = mul i32 %41, 136
  %43 = add i32 %42, %40
  %44 = udiv i32 %43, 1
  %45 = urem i32 %44, 136
  %46 = udiv i32 %43, 136
  %47 = mul nuw nsw i32 %40, 1
  %48 = add nuw nsw i32 0, %47
  %49 = urem i32 %48, 8
  %50 = udiv i32 %48, 8
  %51 = udiv i32 %50, 17
  %52 = mul nuw nsw i32 %5, 1
  %53 = add nuw nsw i32 0, %52
  %54 = udiv i32 %53, 8192
  %55 = udiv i32 %43, 8
  %56 = add i32 %53, 0
  %57 = add i32 %50, 13
  %region_0_39_constant_81 = load float, ptr @5, align 4
  %58 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %56, i32 %57
  %59 = load float, ptr %58, align 4, !invariant.load !34
  %multiply.102 = fmul float %region_0_39_constant_81, %59
  %60 = getelementptr inbounds float, ptr %arg0, i32 %43
  %61 = load float, ptr %60, align 4, !invariant.load !34
  %multiply.17 = fmul float %multiply.102, %61
  br label %concatenate.19.merge

concatenate.pivot.832.:                           ; preds = %fusion_10.in_bounds-true
  %62 = icmp ult i32 %4, 832
  br i1 %62, label %concatenate.pivot.0., label %concatenate.pivot.832.3

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.832.
  br label %concat_index_from_operand_id0

concatenate.pivot.832.3:                          ; preds = %concatenate.pivot.832.
  br label %concat_index_from_operand_id1

concatenate.19.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %63 = phi float [ %multiply.13, %concat_index_from_operand_id0 ], [ %multiply.17, %concat_index_from_operand_id1 ]
  %64 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %65 = load float, ptr %64, align 4
  %66 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %67 = load float, ptr %66, align 4
  %add.20 = fadd float %65, %67
  %68 = getelementptr inbounds [968 x float], ptr %arg4, i32 0, i32 %4
  %69 = load float, ptr %68, align 4, !invariant.load !34
  %add.22 = fadd float %add.20, %69
  %region_0_39_constant_23 = load float, ptr @4, align 4
  %70 = fcmp oge float %add.22, %region_0_39_constant_23
  %71 = fcmp une float %add.22, %add.22
  %72 = or i1 %70, %71
  %maximum.25 = select i1 %72, float %add.22, float %region_0_39_constant_23
  %add.26 = fadd float %63, %maximum.25
  %73 = insertvalue { float, float, float } undef, float %add.26, 0
  br label %concatenate.pivot.832.9

concat_index_from_operand_id04:                   ; preds = %concatenate.pivot.0.10
  %74 = phi i32 [ 0, %concatenate.pivot.0.10 ]
  %75 = sub nsw i32 %4, %74
  %76 = udiv i32 %linear_index_base, 968
  %77 = mul i32 %76, 832
  %78 = add i32 %77, %75
  %79 = udiv i32 %78, 1
  %80 = urem i32 %79, 832
  %81 = udiv i32 %78, 832
  %82 = mul nuw nsw i32 %75, 1
  %83 = add nuw nsw i32 0, %82
  %84 = urem i32 %83, 64
  %85 = udiv i32 %83, 64
  %86 = udiv i32 %85, 13
  %87 = mul nuw nsw i32 %5, 1
  %88 = add nuw nsw i32 0, %87
  %89 = udiv i32 %88, 8192
  %90 = udiv i32 %78, 64
  %91 = add i32 %88, 0
  %92 = add i32 %85, 0
  %93 = getelementptr inbounds [8192 x [30 x float]], ptr %arg3, i32 0, i32 %91, i32 %92
  %94 = load float, ptr %93, align 4, !invariant.load !34
  %region_0_39_constant_85 = load float, ptr @5, align 4
  %multiply.27 = fmul float %94, %region_0_39_constant_85
  %95 = getelementptr inbounds float, ptr %arg1, i32 %78
  %96 = load float, ptr %95, align 4, !invariant.load !34
  %multiply.30 = fmul float %multiply.27, %96
  br label %concatenate.36.merge

concat_index_from_operand_id16:                   ; preds = %concatenate.pivot.832.11
  %97 = phi i32 [ 832, %concatenate.pivot.832.11 ]
  %98 = sub nsw i32 %4, %97
  %99 = udiv i32 %linear_index_base, 968
  %100 = mul i32 %99, 136
  %101 = add i32 %100, %98
  %102 = udiv i32 %101, 1
  %103 = urem i32 %102, 136
  %104 = udiv i32 %101, 136
  %105 = mul nuw nsw i32 %98, 1
  %106 = add nuw nsw i32 0, %105
  %107 = urem i32 %106, 8
  %108 = udiv i32 %106, 8
  %109 = udiv i32 %108, 17
  %110 = mul nuw nsw i32 %5, 1
  %111 = add nuw nsw i32 0, %110
  %112 = udiv i32 %111, 8192
  %113 = udiv i32 %101, 8
  %114 = add i32 %111, 0
  %115 = add i32 %108, 13
  %116 = getelementptr inbounds [8192 x [30 x float]], ptr %arg3, i32 0, i32 %114, i32 %115
  %117 = load float, ptr %116, align 4, !invariant.load !34
  %region_0_39_constant_87 = load float, ptr @5, align 4
  %multiply.278 = fmul float %117, %region_0_39_constant_87
  %118 = getelementptr inbounds float, ptr %arg0, i32 %101
  %119 = load float, ptr %118, align 4, !invariant.load !34
  %multiply.34 = fmul float %multiply.278, %119
  br label %concatenate.36.merge

concatenate.pivot.832.9:                          ; preds = %concatenate.19.merge
  %120 = icmp ult i32 %4, 832
  br i1 %120, label %concatenate.pivot.0.10, label %concatenate.pivot.832.11

concatenate.pivot.0.10:                           ; preds = %concatenate.pivot.832.9
  br label %concat_index_from_operand_id04

concatenate.pivot.832.11:                         ; preds = %concatenate.pivot.832.9
  br label %concat_index_from_operand_id16

concatenate.36.merge:                             ; preds = %concat_index_from_operand_id16, %concat_index_from_operand_id04
  %121 = phi float [ %multiply.30, %concat_index_from_operand_id04 ], [ %multiply.34, %concat_index_from_operand_id16 ]
  %122 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  %123 = load float, ptr %122, align 4
  %124 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  %125 = load float, ptr %124, align 4
  %add.2012 = fadd float %123, %125
  %126 = getelementptr inbounds [968 x float], ptr %arg4, i32 0, i32 %4
  %127 = load float, ptr %126, align 4, !invariant.load !34
  %add.2213 = fadd float %add.2012, %127
  %region_0_39_constant_2314 = load float, ptr @4, align 4
  %128 = fcmp oge float %add.2213, %region_0_39_constant_2314
  %129 = fcmp une float %add.2213, %add.2213
  %130 = or i1 %128, %129
  %maximum.2515 = select i1 %130, float %add.2213, float %region_0_39_constant_2314
  %add.37 = fadd float %121, %maximum.2515
  %131 = insertvalue { float, float, float } %73, float %add.37, 1
  %132 = insertvalue { float, float, float } %131, float %maximum.2515, 2
  %133 = extractvalue { float, float, float } %132, 0
  %134 = getelementptr inbounds float, ptr %arg7, i32 %linear_index_base
  store float %133, ptr %134, align 4
  %135 = extractvalue { float, float, float } %132, 1
  %136 = getelementptr inbounds float, ptr %arg6, i32 %linear_index_base
  store float %135, ptr %136, align 4
  %137 = extractvalue { float, float, float } %132, 2
  %138 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %137, ptr %138, align 4
  br label %concatenate.pivot.832.25

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.26
  %139 = phi i32 [ 0, %concatenate.pivot.0.26 ]
  %140 = sub nsw i32 %7, %139
  %141 = udiv i32 %linear_index1, 968
  %142 = mul i32 %141, 832
  %143 = add i32 %142, %140
  %144 = udiv i32 %143, 1
  %145 = urem i32 %144, 832
  %146 = udiv i32 %143, 832
  %147 = mul nuw nsw i32 %140, 1
  %148 = add nuw nsw i32 0, %147
  %149 = urem i32 %148, 64
  %150 = udiv i32 %148, 64
  %151 = udiv i32 %150, 13
  %152 = mul nuw nsw i32 %8, 1
  %153 = add nuw nsw i32 0, %152
  %154 = udiv i32 %153, 8192
  %155 = udiv i32 %143, 64
  %156 = add i32 %153, 0
  %157 = add i32 %150, 0
  %region_0_39_constant_818 = load float, ptr @5, align 4
  %158 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %156, i32 %157
  %159 = load float, ptr %158, align 4, !invariant.load !34
  %multiply.1019 = fmul float %region_0_39_constant_818, %159
  %160 = getelementptr inbounds float, ptr %arg1, i32 %143
  %161 = load float, ptr %160, align 4, !invariant.load !34
  %multiply.1320 = fmul float %multiply.1019, %161
  br label %concatenate.19.merge16

concat_index_from_operand_id121:                  ; preds = %concatenate.pivot.832.27
  %162 = phi i32 [ 832, %concatenate.pivot.832.27 ]
  %163 = sub nsw i32 %7, %162
  %164 = udiv i32 %linear_index1, 968
  %165 = mul i32 %164, 136
  %166 = add i32 %165, %163
  %167 = udiv i32 %166, 1
  %168 = urem i32 %167, 136
  %169 = udiv i32 %166, 136
  %170 = mul nuw nsw i32 %163, 1
  %171 = add nuw nsw i32 0, %170
  %172 = urem i32 %171, 8
  %173 = udiv i32 %171, 8
  %174 = udiv i32 %173, 17
  %175 = mul nuw nsw i32 %8, 1
  %176 = add nuw nsw i32 0, %175
  %177 = udiv i32 %176, 8192
  %178 = udiv i32 %166, 8
  %179 = add i32 %176, 0
  %180 = add i32 %173, 13
  %region_0_39_constant_822 = load float, ptr @5, align 4
  %181 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %179, i32 %180
  %182 = load float, ptr %181, align 4, !invariant.load !34
  %multiply.1023 = fmul float %region_0_39_constant_822, %182
  %183 = getelementptr inbounds float, ptr %arg0, i32 %166
  %184 = load float, ptr %183, align 4, !invariant.load !34
  %multiply.1724 = fmul float %multiply.1023, %184
  br label %concatenate.19.merge16

concatenate.pivot.832.25:                         ; preds = %concatenate.36.merge
  %185 = icmp ult i32 %7, 832
  br i1 %185, label %concatenate.pivot.0.26, label %concatenate.pivot.832.27

concatenate.pivot.0.26:                           ; preds = %concatenate.pivot.832.25
  br label %concat_index_from_operand_id017

concatenate.pivot.832.27:                         ; preds = %concatenate.pivot.832.25
  br label %concat_index_from_operand_id121

concatenate.19.merge16:                           ; preds = %concat_index_from_operand_id121, %concat_index_from_operand_id017
  %186 = phi float [ %multiply.1320, %concat_index_from_operand_id017 ], [ %multiply.1724, %concat_index_from_operand_id121 ]
  %187 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %188 = load float, ptr %187, align 4
  %189 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %190 = load float, ptr %189, align 4
  %add.2028 = fadd float %188, %190
  %191 = getelementptr inbounds [968 x float], ptr %arg4, i32 0, i32 %7
  %192 = load float, ptr %191, align 4, !invariant.load !34
  %add.2229 = fadd float %add.2028, %192
  %region_0_39_constant_2330 = load float, ptr @4, align 4
  %193 = fcmp oge float %add.2229, %region_0_39_constant_2330
  %194 = fcmp une float %add.2229, %add.2229
  %195 = or i1 %193, %194
  %maximum.2531 = select i1 %195, float %add.2229, float %region_0_39_constant_2330
  %add.2632 = fadd float %186, %maximum.2531
  %196 = insertvalue { float, float, float } undef, float %add.2632, 0
  br label %concatenate.pivot.832.42

concat_index_from_operand_id034:                  ; preds = %concatenate.pivot.0.43
  %197 = phi i32 [ 0, %concatenate.pivot.0.43 ]
  %198 = sub nsw i32 %7, %197
  %199 = udiv i32 %linear_index1, 968
  %200 = mul i32 %199, 832
  %201 = add i32 %200, %198
  %202 = udiv i32 %201, 1
  %203 = urem i32 %202, 832
  %204 = udiv i32 %201, 832
  %205 = mul nuw nsw i32 %198, 1
  %206 = add nuw nsw i32 0, %205
  %207 = urem i32 %206, 64
  %208 = udiv i32 %206, 64
  %209 = udiv i32 %208, 13
  %210 = mul nuw nsw i32 %8, 1
  %211 = add nuw nsw i32 0, %210
  %212 = udiv i32 %211, 8192
  %213 = udiv i32 %201, 64
  %214 = add i32 %211, 0
  %215 = add i32 %208, 0
  %216 = getelementptr inbounds [8192 x [30 x float]], ptr %arg3, i32 0, i32 %214, i32 %215
  %217 = load float, ptr %216, align 4, !invariant.load !34
  %region_0_39_constant_835 = load float, ptr @5, align 4
  %multiply.2736 = fmul float %217, %region_0_39_constant_835
  %218 = getelementptr inbounds float, ptr %arg1, i32 %201
  %219 = load float, ptr %218, align 4, !invariant.load !34
  %multiply.3037 = fmul float %multiply.2736, %219
  br label %concatenate.36.merge33

concat_index_from_operand_id138:                  ; preds = %concatenate.pivot.832.44
  %220 = phi i32 [ 832, %concatenate.pivot.832.44 ]
  %221 = sub nsw i32 %7, %220
  %222 = udiv i32 %linear_index1, 968
  %223 = mul i32 %222, 136
  %224 = add i32 %223, %221
  %225 = udiv i32 %224, 1
  %226 = urem i32 %225, 136
  %227 = udiv i32 %224, 136
  %228 = mul nuw nsw i32 %221, 1
  %229 = add nuw nsw i32 0, %228
  %230 = urem i32 %229, 8
  %231 = udiv i32 %229, 8
  %232 = udiv i32 %231, 17
  %233 = mul nuw nsw i32 %8, 1
  %234 = add nuw nsw i32 0, %233
  %235 = udiv i32 %234, 8192
  %236 = udiv i32 %224, 8
  %237 = add i32 %234, 0
  %238 = add i32 %231, 13
  %239 = getelementptr inbounds [8192 x [30 x float]], ptr %arg3, i32 0, i32 %237, i32 %238
  %240 = load float, ptr %239, align 4, !invariant.load !34
  %region_0_39_constant_839 = load float, ptr @5, align 4
  %multiply.2740 = fmul float %240, %region_0_39_constant_839
  %241 = getelementptr inbounds float, ptr %arg0, i32 %224
  %242 = load float, ptr %241, align 4, !invariant.load !34
  %multiply.3441 = fmul float %multiply.2740, %242
  br label %concatenate.36.merge33

concatenate.pivot.832.42:                         ; preds = %concatenate.19.merge16
  %243 = icmp ult i32 %7, 832
  br i1 %243, label %concatenate.pivot.0.43, label %concatenate.pivot.832.44

concatenate.pivot.0.43:                           ; preds = %concatenate.pivot.832.42
  br label %concat_index_from_operand_id034

concatenate.pivot.832.44:                         ; preds = %concatenate.pivot.832.42
  br label %concat_index_from_operand_id138

concatenate.36.merge33:                           ; preds = %concat_index_from_operand_id138, %concat_index_from_operand_id034
  %244 = phi float [ %multiply.3037, %concat_index_from_operand_id034 ], [ %multiply.3441, %concat_index_from_operand_id138 ]
  %245 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  %246 = load float, ptr %245, align 4
  %247 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  %248 = load float, ptr %247, align 4
  %add.2045 = fadd float %246, %248
  %249 = getelementptr inbounds [968 x float], ptr %arg4, i32 0, i32 %7
  %250 = load float, ptr %249, align 4, !invariant.load !34
  %add.2246 = fadd float %add.2045, %250
  %region_0_39_constant_2347 = load float, ptr @4, align 4
  %251 = fcmp oge float %add.2246, %region_0_39_constant_2347
  %252 = fcmp une float %add.2246, %add.2246
  %253 = or i1 %251, %252
  %maximum.2548 = select i1 %253, float %add.2246, float %region_0_39_constant_2347
  %add.3749 = fadd float %244, %maximum.2548
  %254 = insertvalue { float, float, float } %196, float %add.3749, 1
  %255 = insertvalue { float, float, float } %254, float %maximum.2548, 2
  %256 = extractvalue { float, float, float } %255, 0
  %257 = getelementptr inbounds float, ptr %arg7, i32 %linear_index1
  store float %256, ptr %257, align 4
  %258 = extractvalue { float, float, float } %255, 1
  %259 = getelementptr inbounds float, ptr %arg6, i32 %linear_index1
  store float %258, ptr %259, align 4
  %260 = extractvalue { float, float, float } %255, 2
  %261 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %260, ptr %261, align 4
  br label %concatenate.pivot.832.59

concat_index_from_operand_id051:                  ; preds = %concatenate.pivot.0.60
  %262 = phi i32 [ 0, %concatenate.pivot.0.60 ]
  %263 = sub nsw i32 %10, %262
  %264 = udiv i32 %linear_index2, 968
  %265 = mul i32 %264, 832
  %266 = add i32 %265, %263
  %267 = udiv i32 %266, 1
  %268 = urem i32 %267, 832
  %269 = udiv i32 %266, 832
  %270 = mul nuw nsw i32 %263, 1
  %271 = add nuw nsw i32 0, %270
  %272 = urem i32 %271, 64
  %273 = udiv i32 %271, 64
  %274 = udiv i32 %273, 13
  %275 = mul nuw nsw i32 %11, 1
  %276 = add nuw nsw i32 0, %275
  %277 = udiv i32 %276, 8192
  %278 = udiv i32 %266, 64
  %279 = add i32 %276, 0
  %280 = add i32 %273, 0
  %region_0_39_constant_852 = load float, ptr @5, align 4
  %281 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %279, i32 %280
  %282 = load float, ptr %281, align 4, !invariant.load !34
  %multiply.1053 = fmul float %region_0_39_constant_852, %282
  %283 = getelementptr inbounds float, ptr %arg1, i32 %266
  %284 = load float, ptr %283, align 4, !invariant.load !34
  %multiply.1354 = fmul float %multiply.1053, %284
  br label %concatenate.19.merge50

concat_index_from_operand_id155:                  ; preds = %concatenate.pivot.832.61
  %285 = phi i32 [ 832, %concatenate.pivot.832.61 ]
  %286 = sub nsw i32 %10, %285
  %287 = udiv i32 %linear_index2, 968
  %288 = mul i32 %287, 136
  %289 = add i32 %288, %286
  %290 = udiv i32 %289, 1
  %291 = urem i32 %290, 136
  %292 = udiv i32 %289, 136
  %293 = mul nuw nsw i32 %286, 1
  %294 = add nuw nsw i32 0, %293
  %295 = urem i32 %294, 8
  %296 = udiv i32 %294, 8
  %297 = udiv i32 %296, 17
  %298 = mul nuw nsw i32 %11, 1
  %299 = add nuw nsw i32 0, %298
  %300 = udiv i32 %299, 8192
  %301 = udiv i32 %289, 8
  %302 = add i32 %299, 0
  %303 = add i32 %296, 13
  %region_0_39_constant_856 = load float, ptr @5, align 4
  %304 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %302, i32 %303
  %305 = load float, ptr %304, align 4, !invariant.load !34
  %multiply.1057 = fmul float %region_0_39_constant_856, %305
  %306 = getelementptr inbounds float, ptr %arg0, i32 %289
  %307 = load float, ptr %306, align 4, !invariant.load !34
  %multiply.1758 = fmul float %multiply.1057, %307
  br label %concatenate.19.merge50

concatenate.pivot.832.59:                         ; preds = %concatenate.36.merge33
  %308 = icmp ult i32 %10, 832
  br i1 %308, label %concatenate.pivot.0.60, label %concatenate.pivot.832.61

concatenate.pivot.0.60:                           ; preds = %concatenate.pivot.832.59
  br label %concat_index_from_operand_id051

concatenate.pivot.832.61:                         ; preds = %concatenate.pivot.832.59
  br label %concat_index_from_operand_id155

concatenate.19.merge50:                           ; preds = %concat_index_from_operand_id155, %concat_index_from_operand_id051
  %309 = phi float [ %multiply.1354, %concat_index_from_operand_id051 ], [ %multiply.1758, %concat_index_from_operand_id155 ]
  %310 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %311 = load float, ptr %310, align 4
  %312 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %313 = load float, ptr %312, align 4
  %add.2062 = fadd float %311, %313
  %314 = getelementptr inbounds [968 x float], ptr %arg4, i32 0, i32 %10
  %315 = load float, ptr %314, align 4, !invariant.load !34
  %add.2263 = fadd float %add.2062, %315
  %region_0_39_constant_2364 = load float, ptr @4, align 4
  %316 = fcmp oge float %add.2263, %region_0_39_constant_2364
  %317 = fcmp une float %add.2263, %add.2263
  %318 = or i1 %316, %317
  %maximum.2565 = select i1 %318, float %add.2263, float %region_0_39_constant_2364
  %add.2666 = fadd float %309, %maximum.2565
  %319 = insertvalue { float, float, float } undef, float %add.2666, 0
  br label %concatenate.pivot.832.76

concat_index_from_operand_id068:                  ; preds = %concatenate.pivot.0.77
  %320 = phi i32 [ 0, %concatenate.pivot.0.77 ]
  %321 = sub nsw i32 %10, %320
  %322 = udiv i32 %linear_index2, 968
  %323 = mul i32 %322, 832
  %324 = add i32 %323, %321
  %325 = udiv i32 %324, 1
  %326 = urem i32 %325, 832
  %327 = udiv i32 %324, 832
  %328 = mul nuw nsw i32 %321, 1
  %329 = add nuw nsw i32 0, %328
  %330 = urem i32 %329, 64
  %331 = udiv i32 %329, 64
  %332 = udiv i32 %331, 13
  %333 = mul nuw nsw i32 %11, 1
  %334 = add nuw nsw i32 0, %333
  %335 = udiv i32 %334, 8192
  %336 = udiv i32 %324, 64
  %337 = add i32 %334, 0
  %338 = add i32 %331, 0
  %339 = getelementptr inbounds [8192 x [30 x float]], ptr %arg3, i32 0, i32 %337, i32 %338
  %340 = load float, ptr %339, align 4, !invariant.load !34
  %region_0_39_constant_869 = load float, ptr @5, align 4
  %multiply.2770 = fmul float %340, %region_0_39_constant_869
  %341 = getelementptr inbounds float, ptr %arg1, i32 %324
  %342 = load float, ptr %341, align 4, !invariant.load !34
  %multiply.3071 = fmul float %multiply.2770, %342
  br label %concatenate.36.merge67

concat_index_from_operand_id172:                  ; preds = %concatenate.pivot.832.78
  %343 = phi i32 [ 832, %concatenate.pivot.832.78 ]
  %344 = sub nsw i32 %10, %343
  %345 = udiv i32 %linear_index2, 968
  %346 = mul i32 %345, 136
  %347 = add i32 %346, %344
  %348 = udiv i32 %347, 1
  %349 = urem i32 %348, 136
  %350 = udiv i32 %347, 136
  %351 = mul nuw nsw i32 %344, 1
  %352 = add nuw nsw i32 0, %351
  %353 = urem i32 %352, 8
  %354 = udiv i32 %352, 8
  %355 = udiv i32 %354, 17
  %356 = mul nuw nsw i32 %11, 1
  %357 = add nuw nsw i32 0, %356
  %358 = udiv i32 %357, 8192
  %359 = udiv i32 %347, 8
  %360 = add i32 %357, 0
  %361 = add i32 %354, 13
  %362 = getelementptr inbounds [8192 x [30 x float]], ptr %arg3, i32 0, i32 %360, i32 %361
  %363 = load float, ptr %362, align 4, !invariant.load !34
  %region_0_39_constant_873 = load float, ptr @5, align 4
  %multiply.2774 = fmul float %363, %region_0_39_constant_873
  %364 = getelementptr inbounds float, ptr %arg0, i32 %347
  %365 = load float, ptr %364, align 4, !invariant.load !34
  %multiply.3475 = fmul float %multiply.2774, %365
  br label %concatenate.36.merge67

concatenate.pivot.832.76:                         ; preds = %concatenate.19.merge50
  %366 = icmp ult i32 %10, 832
  br i1 %366, label %concatenate.pivot.0.77, label %concatenate.pivot.832.78

concatenate.pivot.0.77:                           ; preds = %concatenate.pivot.832.76
  br label %concat_index_from_operand_id068

concatenate.pivot.832.78:                         ; preds = %concatenate.pivot.832.76
  br label %concat_index_from_operand_id172

concatenate.36.merge67:                           ; preds = %concat_index_from_operand_id172, %concat_index_from_operand_id068
  %367 = phi float [ %multiply.3071, %concat_index_from_operand_id068 ], [ %multiply.3475, %concat_index_from_operand_id172 ]
  %368 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  %369 = load float, ptr %368, align 4
  %370 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  %371 = load float, ptr %370, align 4
  %add.2079 = fadd float %369, %371
  %372 = getelementptr inbounds [968 x float], ptr %arg4, i32 0, i32 %10
  %373 = load float, ptr %372, align 4, !invariant.load !34
  %add.2280 = fadd float %add.2079, %373
  %region_0_39_constant_2381 = load float, ptr @4, align 4
  %374 = fcmp oge float %add.2280, %region_0_39_constant_2381
  %375 = fcmp une float %add.2280, %add.2280
  %376 = or i1 %374, %375
  %maximum.2582 = select i1 %376, float %add.2280, float %region_0_39_constant_2381
  %add.3783 = fadd float %367, %maximum.2582
  %377 = insertvalue { float, float, float } %319, float %add.3783, 1
  %378 = insertvalue { float, float, float } %377, float %maximum.2582, 2
  %379 = extractvalue { float, float, float } %378, 0
  %380 = getelementptr inbounds float, ptr %arg7, i32 %linear_index2
  store float %379, ptr %380, align 4
  %381 = extractvalue { float, float, float } %378, 1
  %382 = getelementptr inbounds float, ptr %arg6, i32 %linear_index2
  store float %381, ptr %382, align 4
  %383 = extractvalue { float, float, float } %378, 2
  %384 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %383, ptr %384, align 4
  br label %concatenate.pivot.832.93

concat_index_from_operand_id085:                  ; preds = %concatenate.pivot.0.94
  %385 = phi i32 [ 0, %concatenate.pivot.0.94 ]
  %386 = sub nsw i32 %13, %385
  %387 = udiv i32 %linear_index3, 968
  %388 = mul i32 %387, 832
  %389 = add i32 %388, %386
  %390 = udiv i32 %389, 1
  %391 = urem i32 %390, 832
  %392 = udiv i32 %389, 832
  %393 = mul nuw nsw i32 %386, 1
  %394 = add nuw nsw i32 0, %393
  %395 = urem i32 %394, 64
  %396 = udiv i32 %394, 64
  %397 = udiv i32 %396, 13
  %398 = mul nuw nsw i32 %14, 1
  %399 = add nuw nsw i32 0, %398
  %400 = udiv i32 %399, 8192
  %401 = udiv i32 %389, 64
  %402 = add i32 %399, 0
  %403 = add i32 %396, 0
  %region_0_39_constant_886 = load float, ptr @5, align 4
  %404 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %402, i32 %403
  %405 = load float, ptr %404, align 4, !invariant.load !34
  %multiply.1087 = fmul float %region_0_39_constant_886, %405
  %406 = getelementptr inbounds float, ptr %arg1, i32 %389
  %407 = load float, ptr %406, align 4, !invariant.load !34
  %multiply.1388 = fmul float %multiply.1087, %407
  br label %concatenate.19.merge84

concat_index_from_operand_id189:                  ; preds = %concatenate.pivot.832.95
  %408 = phi i32 [ 832, %concatenate.pivot.832.95 ]
  %409 = sub nsw i32 %13, %408
  %410 = udiv i32 %linear_index3, 968
  %411 = mul i32 %410, 136
  %412 = add i32 %411, %409
  %413 = udiv i32 %412, 1
  %414 = urem i32 %413, 136
  %415 = udiv i32 %412, 136
  %416 = mul nuw nsw i32 %409, 1
  %417 = add nuw nsw i32 0, %416
  %418 = urem i32 %417, 8
  %419 = udiv i32 %417, 8
  %420 = udiv i32 %419, 17
  %421 = mul nuw nsw i32 %14, 1
  %422 = add nuw nsw i32 0, %421
  %423 = udiv i32 %422, 8192
  %424 = udiv i32 %412, 8
  %425 = add i32 %422, 0
  %426 = add i32 %419, 13
  %region_0_39_constant_890 = load float, ptr @5, align 4
  %427 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %425, i32 %426
  %428 = load float, ptr %427, align 4, !invariant.load !34
  %multiply.1091 = fmul float %region_0_39_constant_890, %428
  %429 = getelementptr inbounds float, ptr %arg0, i32 %412
  %430 = load float, ptr %429, align 4, !invariant.load !34
  %multiply.1792 = fmul float %multiply.1091, %430
  br label %concatenate.19.merge84

concatenate.pivot.832.93:                         ; preds = %concatenate.36.merge67
  %431 = icmp ult i32 %13, 832
  br i1 %431, label %concatenate.pivot.0.94, label %concatenate.pivot.832.95

concatenate.pivot.0.94:                           ; preds = %concatenate.pivot.832.93
  br label %concat_index_from_operand_id085

concatenate.pivot.832.95:                         ; preds = %concatenate.pivot.832.93
  br label %concat_index_from_operand_id189

concatenate.19.merge84:                           ; preds = %concat_index_from_operand_id189, %concat_index_from_operand_id085
  %432 = phi float [ %multiply.1388, %concat_index_from_operand_id085 ], [ %multiply.1792, %concat_index_from_operand_id189 ]
  %433 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %434 = load float, ptr %433, align 4
  %435 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %436 = load float, ptr %435, align 4
  %add.2096 = fadd float %434, %436
  %437 = getelementptr inbounds [968 x float], ptr %arg4, i32 0, i32 %13
  %438 = load float, ptr %437, align 4, !invariant.load !34
  %add.2297 = fadd float %add.2096, %438
  %region_0_39_constant_2398 = load float, ptr @4, align 4
  %439 = fcmp oge float %add.2297, %region_0_39_constant_2398
  %440 = fcmp une float %add.2297, %add.2297
  %441 = or i1 %439, %440
  %maximum.2599 = select i1 %441, float %add.2297, float %region_0_39_constant_2398
  %add.26100 = fadd float %432, %maximum.2599
  %442 = insertvalue { float, float, float } undef, float %add.26100, 0
  br label %concatenate.pivot.832.110

concat_index_from_operand_id0102:                 ; preds = %concatenate.pivot.0.111
  %443 = phi i32 [ 0, %concatenate.pivot.0.111 ]
  %444 = sub nsw i32 %13, %443
  %445 = udiv i32 %linear_index3, 968
  %446 = mul i32 %445, 832
  %447 = add i32 %446, %444
  %448 = udiv i32 %447, 1
  %449 = urem i32 %448, 832
  %450 = udiv i32 %447, 832
  %451 = mul nuw nsw i32 %444, 1
  %452 = add nuw nsw i32 0, %451
  %453 = urem i32 %452, 64
  %454 = udiv i32 %452, 64
  %455 = udiv i32 %454, 13
  %456 = mul nuw nsw i32 %14, 1
  %457 = add nuw nsw i32 0, %456
  %458 = udiv i32 %457, 8192
  %459 = udiv i32 %447, 64
  %460 = add i32 %457, 0
  %461 = add i32 %454, 0
  %462 = getelementptr inbounds [8192 x [30 x float]], ptr %arg3, i32 0, i32 %460, i32 %461
  %463 = load float, ptr %462, align 4, !invariant.load !34
  %region_0_39_constant_8103 = load float, ptr @5, align 4
  %multiply.27104 = fmul float %463, %region_0_39_constant_8103
  %464 = getelementptr inbounds float, ptr %arg1, i32 %447
  %465 = load float, ptr %464, align 4, !invariant.load !34
  %multiply.30105 = fmul float %multiply.27104, %465
  br label %concatenate.36.merge101

concat_index_from_operand_id1106:                 ; preds = %concatenate.pivot.832.112
  %466 = phi i32 [ 832, %concatenate.pivot.832.112 ]
  %467 = sub nsw i32 %13, %466
  %468 = udiv i32 %linear_index3, 968
  %469 = mul i32 %468, 136
  %470 = add i32 %469, %467
  %471 = udiv i32 %470, 1
  %472 = urem i32 %471, 136
  %473 = udiv i32 %470, 136
  %474 = mul nuw nsw i32 %467, 1
  %475 = add nuw nsw i32 0, %474
  %476 = urem i32 %475, 8
  %477 = udiv i32 %475, 8
  %478 = udiv i32 %477, 17
  %479 = mul nuw nsw i32 %14, 1
  %480 = add nuw nsw i32 0, %479
  %481 = udiv i32 %480, 8192
  %482 = udiv i32 %470, 8
  %483 = add i32 %480, 0
  %484 = add i32 %477, 13
  %485 = getelementptr inbounds [8192 x [30 x float]], ptr %arg3, i32 0, i32 %483, i32 %484
  %486 = load float, ptr %485, align 4, !invariant.load !34
  %region_0_39_constant_8107 = load float, ptr @5, align 4
  %multiply.27108 = fmul float %486, %region_0_39_constant_8107
  %487 = getelementptr inbounds float, ptr %arg0, i32 %470
  %488 = load float, ptr %487, align 4, !invariant.load !34
  %multiply.34109 = fmul float %multiply.27108, %488
  br label %concatenate.36.merge101

concatenate.pivot.832.110:                        ; preds = %concatenate.19.merge84
  %489 = icmp ult i32 %13, 832
  br i1 %489, label %concatenate.pivot.0.111, label %concatenate.pivot.832.112

concatenate.pivot.0.111:                          ; preds = %concatenate.pivot.832.110
  br label %concat_index_from_operand_id0102

concatenate.pivot.832.112:                        ; preds = %concatenate.pivot.832.110
  br label %concat_index_from_operand_id1106

concatenate.36.merge101:                          ; preds = %concat_index_from_operand_id1106, %concat_index_from_operand_id0102
  %490 = phi float [ %multiply.30105, %concat_index_from_operand_id0102 ], [ %multiply.34109, %concat_index_from_operand_id1106 ]
  %491 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  %492 = load float, ptr %491, align 4
  %493 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  %494 = load float, ptr %493, align 4
  %add.20113 = fadd float %492, %494
  %495 = getelementptr inbounds [968 x float], ptr %arg4, i32 0, i32 %13
  %496 = load float, ptr %495, align 4, !invariant.load !34
  %add.22114 = fadd float %add.20113, %496
  %region_0_39_constant_23115 = load float, ptr @4, align 4
  %497 = fcmp oge float %add.22114, %region_0_39_constant_23115
  %498 = fcmp une float %add.22114, %add.22114
  %499 = or i1 %497, %498
  %maximum.25116 = select i1 %499, float %add.22114, float %region_0_39_constant_23115
  %add.37117 = fadd float %490, %maximum.25116
  %500 = insertvalue { float, float, float } %442, float %add.37117, 1
  %501 = insertvalue { float, float, float } %500, float %maximum.25116, 2
  %502 = extractvalue { float, float, float } %501, 0
  %503 = getelementptr inbounds float, ptr %arg7, i32 %linear_index3
  store float %502, ptr %503, align 4
  %504 = extractvalue { float, float, float } %501, 1
  %505 = getelementptr inbounds float, ptr %arg6, i32 %linear_index3
  store float %504, ptr %505, align 4
  %506 = extractvalue { float, float, float } %501, 2
  %507 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %506, ptr %507, align 4
  br label %fusion_10.in_bounds-after
}

define void @fusion_3(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 128 dereferenceable(20971520) %arg1, ptr noalias align 128 dereferenceable(4194304) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !37
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !33
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
  br i1 %15, label %fusion_3.in_bounds-true, label %fusion_3.in_bounds-after

fusion_3.in_bounds-after:                         ; preds = %fusion_3.in_bounds-true, %entry
  ret void

fusion_3.in_bounds-true:                          ; preds = %entry
  %16 = add i32 %5, 0
  %17 = add i32 %4, 512
  %18 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %16, i32 %17
  %19 = load float, ptr %18, align 4, !invariant.load !34
  %20 = getelementptr inbounds [128 x float], ptr %arg0, i32 0, i32 %4
  %21 = load float, ptr %20, align 4, !invariant.load !34
  %add.5 = fadd float %19, %21
  %region_0_9_constant_6 = load float, ptr @6, align 4
  %22 = fcmp oge float %add.5, %region_0_9_constant_6
  %23 = fcmp une float %add.5, %add.5
  %24 = or i1 %22, %23
  %maximum.8 = select i1 %24, float %add.5, float %region_0_9_constant_6
  %25 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %maximum.8, ptr %25, align 4
  %26 = add i32 %8, 0
  %27 = add i32 %7, 512
  %28 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !34
  %30 = getelementptr inbounds [128 x float], ptr %arg0, i32 0, i32 %7
  %31 = load float, ptr %30, align 4, !invariant.load !34
  %add.51 = fadd float %29, %31
  %region_0_9_constant_62 = load float, ptr @6, align 4
  %32 = fcmp oge float %add.51, %region_0_9_constant_62
  %33 = fcmp une float %add.51, %add.51
  %34 = or i1 %32, %33
  %maximum.83 = select i1 %34, float %add.51, float %region_0_9_constant_62
  %35 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %maximum.83, ptr %35, align 4
  %36 = add i32 %11, 0
  %37 = add i32 %10, 512
  %38 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %36, i32 %37
  %39 = load float, ptr %38, align 4, !invariant.load !34
  %40 = getelementptr inbounds [128 x float], ptr %arg0, i32 0, i32 %10
  %41 = load float, ptr %40, align 4, !invariant.load !34
  %add.54 = fadd float %39, %41
  %region_0_9_constant_65 = load float, ptr @6, align 4
  %42 = fcmp oge float %add.54, %region_0_9_constant_65
  %43 = fcmp une float %add.54, %add.54
  %44 = or i1 %42, %43
  %maximum.86 = select i1 %44, float %add.54, float %region_0_9_constant_65
  %45 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %maximum.86, ptr %45, align 4
  %46 = add i32 %14, 0
  %47 = add i32 %13, 512
  %48 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %46, i32 %47
  %49 = load float, ptr %48, align 4, !invariant.load !34
  %50 = getelementptr inbounds [128 x float], ptr %arg0, i32 0, i32 %13
  %51 = load float, ptr %50, align 4, !invariant.load !34
  %add.57 = fadd float %49, %51
  %region_0_9_constant_68 = load float, ptr @6, align 4
  %52 = fcmp oge float %add.57, %region_0_9_constant_68
  %53 = fcmp une float %add.57, %add.57
  %54 = or i1 %52, %53
  %maximum.89 = select i1 %54, float %add.57, float %region_0_9_constant_68
  %55 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %maximum.89, ptr %55, align 4
  br label %fusion_3.in_bounds-after
}

define void @fusion_1(ptr noalias align 128 dereferenceable(2097152) %arg0, ptr noalias align 16 dereferenceable(256) %arg1, ptr noalias align 128 dereferenceable(2097152) %arg2, ptr noalias align 16 dereferenceable(256) %arg3, ptr noalias align 128 dereferenceable(32768) %arg4, ptr noalias align 128 dereferenceable(2097152) %arg5, ptr noalias align 128 dereferenceable(2097152) %arg6) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer43 = alloca float, align 4
  %result_from_other_lane41 = alloca float, align 4
  %return_buffer40 = alloca float, align 4
  %result_from_other_lane38 = alloca float, align 4
  %return_buffer37 = alloca float, align 4
  %result_from_other_lane35 = alloca float, align 4
  %return_buffer34 = alloca float, align 4
  %result_from_other_lane32 = alloca float, align 4
  %return_buffer31 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %tile_loop.invar_address11 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !47
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_20_constant_7 = load float, ptr @7, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_20_constant_7, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !48
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !49
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 8192
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 8192
  %15 = udiv i32 %8, 8192
  %16 = icmp eq i32 %14, 8191
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
  br label %y_in_tile.loop_header, !llvm.loop !50

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer31)
  %22 = load float, ptr %return_buffer31, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result33 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result33, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane32, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane32, ptr %return_buffer34)
  %24 = load float, ptr %return_buffer34, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result36 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result36, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane35, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane35, ptr %return_buffer37)
  %26 = load float, ptr %return_buffer37, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result39 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result39, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane38, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane38, ptr %return_buffer40)
  %28 = load float, ptr %return_buffer40, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result42 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result42, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane41, align 4
  call void @region_1_14(ptr %current_output, ptr %result_from_other_lane41, ptr %return_buffer43)
  %30 = load float, ptr %return_buffer43, align 4
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
  %Arg_2.3 = getelementptr inbounds [8192 x [64 x float]], ptr %arg2, i32 0, i32 %39, i32 %40
  %Arg_2.33 = load float, ptr %Arg_2.3, align 4, !invariant.load !34
  %Arg_3.4 = getelementptr inbounds [64 x float], ptr %arg3, i32 0, i32 %40
  %Arg_3.44 = load float, ptr %Arg_3.4, align 4, !invariant.load !34
  %add.6 = fadd float %Arg_2.33, %Arg_3.44
  %region_0_20_constant_75 = load float, ptr @7, align 4
  %41 = fcmp oge float %add.6, %region_0_20_constant_75
  %42 = fcmp une float %add.6, %add.6
  %43 = or i1 %41, %42
  %maximum.9 = select i1 %43, float %add.6, float %region_0_20_constant_75
  %Arg_0.1 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %39, i32 %40
  %Arg_0.16 = load float, ptr %Arg_0.1, align 4, !invariant.load !34
  %Arg_1.2 = getelementptr inbounds [64 x float], ptr %arg1, i32 0, i32 %40
  %Arg_1.27 = load float, ptr %Arg_1.2, align 4, !invariant.load !34
  %add.11 = fadd float %Arg_0.16, %Arg_1.27
  %44 = fcmp oge float %add.11, %region_0_20_constant_75
  %45 = fcmp une float %add.11, %add.11
  %46 = or i1 %44, %45
  %maximum.12 = select i1 %46, float %add.11, float %region_0_20_constant_75
  %multiply.13 = fmul float %maximum.9, %maximum.12
  store float %multiply.13, ptr %reduction_input_address, align 4
  %47 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_14(ptr %47, ptr %reduction_input_address, ptr %return_buffer)
  %48 = load float, ptr %return_buffer, align 4
  store float %48, ptr %47, align 4
  %49 = getelementptr inbounds [8192 x [64 x float]], ptr %arg5, i32 0, i32 %39, i32 %40
  store float %maximum.12, ptr %49, align 4
  %50 = getelementptr inbounds [8192 x [64 x float]], ptr %arg6, i32 0, i32 %39, i32 %40
  store float %maximum.9, ptr %50, align 4
  br label %tile_loop.loop_header, !llvm.loop !51

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %51 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address11, align 4
  br label %tile_loop.loop_header9

tile_loop.loop_header9:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar12 = load i32, ptr %tile_loop.invar_address11, align 4
  %52 = icmp uge i32 %tile_loop.indvar12, 16
  br i1 %52, label %tile_loop.loop_exit8, label %tile_loop.loop_body10

tile_loop.loop_body10:                            ; preds = %tile_loop.loop_header9
  %invar.inc13 = add nuw nsw i32 %tile_loop.indvar12, 1
  store i32 %invar.inc13, ptr %tile_loop.invar_address11, align 4
  %53 = icmp eq i32 %tile_loop.indvar12, 0
  %54 = mul i32 %tile_loop.indvar12, 32
  %55 = add i32 %54, 0
  %x_loc14 = add i32 %55, %51
  %56 = add i32 %tile_origin.1, %y_in_tile.indvar
  %57 = add i32 %tile_origin.2, %x_loc14
  %58 = icmp ult i32 %x_loc14, %tile_bound1
  br i1 %58, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body10
  br label %tile_loop.loop_header9, !llvm.loop !53

tile_loop.loop_exit8:                             ; preds = %tile_loop.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body10
  %Arg_2.315 = getelementptr inbounds [8192 x [64 x float]], ptr %arg2, i32 0, i32 %56, i32 %57
  %Arg_2.316 = load float, ptr %Arg_2.315, align 4, !invariant.load !34
  %Arg_3.417 = getelementptr inbounds [64 x float], ptr %arg3, i32 0, i32 %57
  %Arg_3.418 = load float, ptr %Arg_3.417, align 4, !invariant.load !34
  %add.619 = fadd float %Arg_2.316, %Arg_3.418
  %region_0_20_constant_720 = load float, ptr @7, align 4
  %59 = fcmp oge float %add.619, %region_0_20_constant_720
  %60 = fcmp une float %add.619, %add.619
  %61 = or i1 %59, %60
  %maximum.921 = select i1 %61, float %add.619, float %region_0_20_constant_720
  %Arg_0.122 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %56, i32 %57
  %Arg_0.123 = load float, ptr %Arg_0.122, align 4, !invariant.load !34
  %Arg_1.224 = getelementptr inbounds [64 x float], ptr %arg1, i32 0, i32 %57
  %Arg_1.225 = load float, ptr %Arg_1.224, align 4, !invariant.load !34
  %add.1126 = fadd float %Arg_0.123, %Arg_1.225
  %62 = fcmp oge float %add.1126, %region_0_20_constant_720
  %63 = fcmp une float %add.1126, %add.1126
  %64 = or i1 %62, %63
  %maximum.1227 = select i1 %64, float %add.1126, float %region_0_20_constant_720
  %multiply.1328 = fmul float %maximum.921, %maximum.1227
  store float %multiply.1328, ptr %reduction_input_address, align 4
  %65 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_14(ptr %65, ptr %reduction_input_address, ptr %return_buffer29)
  %66 = load float, ptr %return_buffer29, align 4
  store float %66, ptr %65, align 4
  %67 = getelementptr inbounds [8192 x [64 x float]], ptr %arg5, i32 0, i32 %56, i32 %57
  store float %maximum.1227, ptr %67, align 4
  %68 = getelementptr inbounds [8192 x [64 x float]], ptr %arg6, i32 0, i32 %56, i32 %57
  store float %maximum.921, ptr %68, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %69 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %70 = addrspacecast ptr addrspace(3) %69 to ptr
  %71 = load float, ptr %current_output, align 4
  store float %71, ptr %70, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %72 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %73 = addrspacecast ptr addrspace(3) %72 to ptr
  store float %region_0_20_constant_7, ptr %initial_value_addr, align 4
  %74 = icmp ult i32 %thread_id.x, 1
  %75 = select i1 %74, ptr %73, ptr %initial_value_addr
  %76 = icmp eq i32 %thread_id.x, 0
  br i1 %76, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %77 = mul i32 %thread_id.x, 1
  %78 = add i32 %tile_origin.1, %thread_id.y
  %79 = add i32 %tile_origin.2, %77
  %80 = add i32 %79, 0
  %81 = udiv i32 %78, 1
  %output_element_address = getelementptr inbounds [8192 x float], ptr %arg4, i32 0, i32 %81
  %output = load float, ptr %75, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_14(ptr dereferenceable(4) %Arg_0.15.typed, ptr dereferenceable(4) %Arg_1.16.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.17.typed = alloca float, align 4
  %Arg_0.15 = load float, ptr %Arg_0.15.typed, align 4
  %Arg_1.16 = load float, ptr %Arg_1.16.typed, align 4
  %add.17 = fadd float %Arg_0.15, %Arg_1.16
  store float %add.17, ptr %add.17.typed, align 4
  %load_ret_value = load float, ptr %add.17.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #4

define void @fusion(ptr noalias align 128 dereferenceable(32768) %arg0, ptr noalias align 128 dereferenceable(32768) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !54
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 8192
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index, 1
  %6 = icmp ult i32 %linear_index, 8192
  br i1 %6, label %fusion.in_bounds-true, label %fusion.in_bounds-after

fusion.in_bounds-after:                           ; preds = %fusion.in_bounds-true, %entry
  ret void

fusion.in_bounds-true:                            ; preds = %entry
  %region_0_9_constant_2 = load float, ptr @8, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !34
  %9 = fneg float %8
  %10 = call float @__nv_expf(float %9)
  %add.6 = fadd float %region_0_9_constant_2, %10
  %divide.7 = fdiv float %region_0_9_constant_2, %add.6
  %11 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %divide.7, ptr %11, align 4
  br label %fusion.in_bounds-after
}

define void @copy_fusion(ptr noalias align 128 dereferenceable(983040) %arg0, ptr noalias align 128 dereferenceable(983040) %arg1, ptr noalias align 128 dereferenceable(425984) %arg2, ptr noalias align 128 dereferenceable(425984) %arg3, ptr noalias align 128 dereferenceable(557056) %arg4, ptr noalias align 128 dereferenceable(557056) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !43
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !37
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 245760
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 245760
  br i1 %4, label %copy_fusion.in_bounds-true, label %copy_fusion.in_bounds-after

copy_fusion.in_bounds-after:                      ; preds = %slice3-after, %entry
  ret void

copy_fusion.in_bounds-true:                       ; preds = %entry
  br label %concatenate.pivot.106496.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %5 = phi i32 [ 0, %concatenate.pivot.0. ]
  %6 = sub nsw i32 %3, %5
  %7 = mul nuw nsw i32 %6, 1
  %8 = add nuw nsw i32 0, %7
  %9 = urem i32 %8, 13
  %10 = udiv i32 %8, 13
  %11 = udiv i32 %10, 8192
  %12 = add i32 %10, 0
  %13 = add i32 %9, 0
  %14 = getelementptr inbounds [8192 x [30 x float]], ptr %arg0, i32 0, i32 %12, i32 %13
  %15 = load float, ptr %14, align 4, !invariant.load !34
  %region_0_30_constant_3 = load float, ptr @10, align 4
  %multiply.5 = fmul float %15, %region_0_30_constant_3
  br label %concatenate.15.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.106496.1
  %16 = phi i32 [ 106496, %concatenate.pivot.106496.1 ]
  %17 = sub nsw i32 %3, %16
  %18 = mul nuw nsw i32 %17, 1
  %19 = add nuw nsw i32 0, %18
  %20 = urem i32 %19, 17
  %21 = udiv i32 %19, 17
  %22 = udiv i32 %21, 8192
  %23 = add i32 %21, 0
  %24 = add i32 %20, 13
  %25 = getelementptr inbounds [8192 x [30 x float]], ptr %arg0, i32 0, i32 %23, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !34
  %region_0_30_constant_9 = load float, ptr @9, align 4
  %multiply.11 = fmul float %26, %region_0_30_constant_9
  br label %concatenate.15.merge

concatenate.pivot.106496.:                        ; preds = %copy_fusion.in_bounds-true
  %27 = icmp ult i32 %3, 106496
  br i1 %27, label %concatenate.pivot.0., label %concatenate.pivot.106496.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.106496.
  br label %concat_index_from_operand_id0

concatenate.pivot.106496.1:                       ; preds = %concatenate.pivot.106496.
  br label %concat_index_from_operand_id1

concatenate.15.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %28 = phi float [ %multiply.5, %concat_index_from_operand_id0 ], [ %multiply.11, %concat_index_from_operand_id1 ]
  br label %concatenate.pivot.106496.6

concat_index_from_operand_id02:                   ; preds = %concatenate.pivot.0.7
  %29 = phi i32 [ 0, %concatenate.pivot.0.7 ]
  %30 = sub nsw i32 %3, %29
  %31 = mul nuw nsw i32 %30, 1
  %32 = add nuw nsw i32 0, %31
  %33 = urem i32 %32, 13
  %34 = udiv i32 %32, 13
  %35 = udiv i32 %34, 8192
  %36 = add i32 %34, 0
  %37 = add i32 %33, 0
  %region_0_30_constant_33 = load float, ptr @10, align 4
  %38 = getelementptr inbounds [8192 x [30 x float]], ptr %arg1, i32 0, i32 %36, i32 %37
  %39 = load float, ptr %38, align 4, !invariant.load !34
  %multiply.17 = fmul float %region_0_30_constant_33, %39
  br label %concatenate.25.merge

concat_index_from_operand_id14:                   ; preds = %concatenate.pivot.106496.8
  %40 = phi i32 [ 106496, %concatenate.pivot.106496.8 ]
  %41 = sub nsw i32 %3, %40
  %42 = mul nuw nsw i32 %41, 1
  %43 = add nuw nsw i32 0, %42
  %44 = urem i32 %43, 17
  %45 = udiv i32 %43, 17
  %46 = udiv i32 %45, 8192
  %47 = add i32 %45, 0
  %48 = add i32 %44, 13
  %region_0_30_constant_95 = load float, ptr @9, align 4
  %49 = getelementptr inbounds [8192 x [30 x float]], ptr %arg1, i32 0, i32 %47, i32 %48
  %50 = load float, ptr %49, align 4, !invariant.load !34
  %multiply.21 = fmul float %region_0_30_constant_95, %50
  br label %concatenate.25.merge

concatenate.pivot.106496.6:                       ; preds = %concatenate.15.merge
  %51 = icmp ult i32 %3, 106496
  br i1 %51, label %concatenate.pivot.0.7, label %concatenate.pivot.106496.8

concatenate.pivot.0.7:                            ; preds = %concatenate.pivot.106496.6
  br label %concat_index_from_operand_id02

concatenate.pivot.106496.8:                       ; preds = %concatenate.pivot.106496.6
  br label %concat_index_from_operand_id14

concatenate.25.merge:                             ; preds = %concat_index_from_operand_id14, %concat_index_from_operand_id02
  %52 = phi float [ %multiply.17, %concat_index_from_operand_id02 ], [ %multiply.21, %concat_index_from_operand_id14 ]
  br label %concatenate.pivot.106496.16

concat_index_from_operand_id010:                  ; preds = %concatenate.pivot.0.17
  %53 = phi i32 [ 0, %concatenate.pivot.0.17 ]
  %54 = sub nsw i32 %3, %53
  %55 = mul nuw nsw i32 %54, 1
  %56 = add nuw nsw i32 0, %55
  %57 = urem i32 %56, 13
  %58 = udiv i32 %56, 13
  %59 = udiv i32 %58, 8192
  %60 = add i32 %58, 0
  %61 = add i32 %57, 0
  %62 = getelementptr inbounds [8192 x [30 x float]], ptr %arg0, i32 0, i32 %60, i32 %61
  %63 = load float, ptr %62, align 4, !invariant.load !34
  %region_0_30_constant_311 = load float, ptr @10, align 4
  %multiply.512 = fmul float %63, %region_0_30_constant_311
  br label %concatenate.15.merge9

concat_index_from_operand_id113:                  ; preds = %concatenate.pivot.106496.18
  %64 = phi i32 [ 106496, %concatenate.pivot.106496.18 ]
  %65 = sub nsw i32 %3, %64
  %66 = mul nuw nsw i32 %65, 1
  %67 = add nuw nsw i32 0, %66
  %68 = urem i32 %67, 17
  %69 = udiv i32 %67, 17
  %70 = udiv i32 %69, 8192
  %71 = add i32 %69, 0
  %72 = add i32 %68, 13
  %73 = getelementptr inbounds [8192 x [30 x float]], ptr %arg0, i32 0, i32 %71, i32 %72
  %74 = load float, ptr %73, align 4, !invariant.load !34
  %region_0_30_constant_914 = load float, ptr @9, align 4
  %multiply.1115 = fmul float %74, %region_0_30_constant_914
  br label %concatenate.15.merge9

concatenate.pivot.106496.16:                      ; preds = %concatenate.25.merge
  %75 = icmp ult i32 %3, 106496
  br i1 %75, label %concatenate.pivot.0.17, label %concatenate.pivot.106496.18

concatenate.pivot.0.17:                           ; preds = %concatenate.pivot.106496.16
  br label %concat_index_from_operand_id010

concatenate.pivot.106496.18:                      ; preds = %concatenate.pivot.106496.16
  br label %concat_index_from_operand_id113

concatenate.15.merge9:                            ; preds = %concat_index_from_operand_id113, %concat_index_from_operand_id010
  %76 = phi float [ %multiply.512, %concat_index_from_operand_id010 ], [ %multiply.1115, %concat_index_from_operand_id113 ]
  br label %concatenate.pivot.106496.26

concat_index_from_operand_id020:                  ; preds = %concatenate.pivot.0.27
  %77 = phi i32 [ 0, %concatenate.pivot.0.27 ]
  %78 = sub nsw i32 %3, %77
  %79 = mul nuw nsw i32 %78, 1
  %80 = add nuw nsw i32 0, %79
  %81 = urem i32 %80, 13
  %82 = udiv i32 %80, 13
  %83 = udiv i32 %82, 8192
  %84 = add i32 %82, 0
  %85 = add i32 %81, 0
  %region_0_30_constant_321 = load float, ptr @10, align 4
  %86 = getelementptr inbounds [8192 x [30 x float]], ptr %arg1, i32 0, i32 %84, i32 %85
  %87 = load float, ptr %86, align 4, !invariant.load !34
  %multiply.1722 = fmul float %region_0_30_constant_321, %87
  br label %concatenate.25.merge19

concat_index_from_operand_id123:                  ; preds = %concatenate.pivot.106496.28
  %88 = phi i32 [ 106496, %concatenate.pivot.106496.28 ]
  %89 = sub nsw i32 %3, %88
  %90 = mul nuw nsw i32 %89, 1
  %91 = add nuw nsw i32 0, %90
  %92 = urem i32 %91, 17
  %93 = udiv i32 %91, 17
  %94 = udiv i32 %93, 8192
  %95 = add i32 %93, 0
  %96 = add i32 %92, 13
  %region_0_30_constant_924 = load float, ptr @9, align 4
  %97 = getelementptr inbounds [8192 x [30 x float]], ptr %arg1, i32 0, i32 %95, i32 %96
  %98 = load float, ptr %97, align 4, !invariant.load !34
  %multiply.2125 = fmul float %region_0_30_constant_924, %98
  br label %concatenate.25.merge19

concatenate.pivot.106496.26:                      ; preds = %concatenate.15.merge9
  %99 = icmp ult i32 %3, 106496
  br i1 %99, label %concatenate.pivot.0.27, label %concatenate.pivot.106496.28

concatenate.pivot.0.27:                           ; preds = %concatenate.pivot.106496.26
  br label %concat_index_from_operand_id020

concatenate.pivot.106496.28:                      ; preds = %concatenate.pivot.106496.26
  br label %concat_index_from_operand_id123

concatenate.25.merge19:                           ; preds = %concat_index_from_operand_id123, %concat_index_from_operand_id020
  %100 = phi float [ %multiply.1722, %concat_index_from_operand_id020 ], [ %multiply.2125, %concat_index_from_operand_id123 ]
  %101 = icmp sge i32 %3, 0
  %102 = icmp slt i32 %3, 106496
  %103 = and i1 %101, %102
  br i1 %103, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.25.merge19
  %104 = icmp sge i32 %3, 0
  %105 = icmp slt i32 %3, 106496
  %106 = and i1 %104, %105
  br i1 %106, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  %107 = icmp sge i32 %3, 106496
  %108 = icmp slt i32 %3, 245760
  %109 = and i1 %107, %108
  br i1 %109, label %slice2-true, label %slice2-after

slice2-after:                                     ; preds = %slice2-true, %slice1-after
  %110 = icmp sge i32 %3, 106496
  %111 = icmp slt i32 %3, 245760
  %112 = and i1 %110, %111
  br i1 %112, label %slice3-true, label %slice3-after

slice3-after:                                     ; preds = %slice3-true, %slice2-after
  br label %copy_fusion.in_bounds-after

slice0-true:                                      ; preds = %concatenate.25.merge19
  %113 = sub i32 %3, 0
  %114 = getelementptr inbounds [106496 x float], ptr %arg2, i32 0, i32 %113
  store float %28, ptr %114, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %115 = sub i32 %3, 0
  %116 = getelementptr inbounds [106496 x float], ptr %arg3, i32 0, i32 %115
  store float %52, ptr %116, align 4
  br label %slice1-after

slice2-true:                                      ; preds = %slice1-after
  %117 = sub i32 %3, 106496
  %118 = getelementptr inbounds [139264 x float], ptr %arg4, i32 0, i32 %117
  store float %76, ptr %118, align 4
  br label %slice2-after

slice3-true:                                      ; preds = %slice2-after
  %119 = sub i32 %3, 106496
  %120 = getelementptr inbounds [139264 x float], ptr %arg5, i32 0, i32 %119
  store float %100, ptr %120, align 4
  br label %slice3-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #4 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31}

!0 = !{ptr @fusion_12, !"kernel", i32 1}
!1 = !{ptr @fusion_12, !"reqntidx", i32 256}
!2 = !{ptr @fusion_13, !"kernel", i32 1}
!3 = !{ptr @fusion_13, !"reqntidx", i32 256}
!4 = !{ptr @concatenate_3, !"kernel", i32 1}
!5 = !{ptr @concatenate_3, !"reqntidx", i32 1024}
!6 = !{ptr @add_5, !"kernel", i32 1}
!7 = !{ptr @add_5, !"reqntidx", i32 128}
!8 = !{ptr @fusion_17, !"kernel", i32 1}
!9 = !{ptr @fusion_17, !"reqntidx", i32 256}
!10 = !{ptr @fusion_16, !"kernel", i32 1}
!11 = !{ptr @fusion_16, !"reqntidx", i32 256}
!12 = !{ptr @fusion_15, !"kernel", i32 1}
!13 = !{ptr @fusion_15, !"reqntidx", i32 256}
!14 = !{ptr @concatenate_7, !"kernel", i32 1}
!15 = !{ptr @concatenate_7, !"reqntidx", i32 256}
!16 = !{ptr @fusion_9, !"kernel", i32 1}
!17 = !{ptr @fusion_9, !"reqntidx", i32 256}
!18 = !{ptr @fusion_8, !"kernel", i32 1}
!19 = !{ptr @fusion_8, !"reqntidx", i32 256}
!20 = !{ptr @add_15, !"kernel", i32 1}
!21 = !{ptr @add_15, !"reqntidx", i32 128}
!22 = !{ptr @fusion_10, !"kernel", i32 1}
!23 = !{ptr @fusion_10, !"reqntidx", i32 256}
!24 = !{ptr @fusion_3, !"kernel", i32 1}
!25 = !{ptr @fusion_3, !"reqntidx", i32 256}
!26 = !{ptr @fusion_1, !"kernel", i32 1}
!27 = !{ptr @fusion_1, !"reqntidx", i32 96}
!28 = !{ptr @fusion, !"kernel", i32 1}
!29 = !{ptr @fusion, !"reqntidx", i32 1024}
!30 = !{ptr @copy_fusion, !"kernel", i32 1}
!31 = !{ptr @copy_fusion, !"reqntidx", i32 1024}
!32 = !{i32 0, i32 1088}
!33 = !{i32 0, i32 256}
!34 = !{}
!35 = !{i32 0, i32 6656}
!36 = !{i32 0, i32 80}
!37 = !{i32 0, i32 1024}
!38 = !{i32 0, i32 864}
!39 = !{i32 0, i32 128}
!40 = distinct !{!40, !41}
!41 = !{!"llvm.loop.vectorize.enable", i1 false}
!42 = !{i32 0, i32 4096}
!43 = !{i32 0, i32 240}
!44 = !{i32 0, i32 9280}
!45 = distinct !{!45, !41}
!46 = !{i32 0, i32 7744}
!47 = !{i32 0, i32 1}
!48 = !{i32 0, i32 96}
!49 = !{i32 0, i32 2731}
!50 = distinct !{!50, !41}
!51 = distinct !{!51, !41, !52}
!52 = !{!"llvm.loop.unroll.full"}
!53 = distinct !{!53, !41, !52}
!54 = !{i32 0, i32 8}
