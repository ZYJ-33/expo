target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@1 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@2 = private unnamed_addr constant [4 x i8] c"\00\00\00@"
@3 = private unnamed_addr constant [4 x i8] zeroinitializer
@4 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@5 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@6 = private unnamed_addr constant [4 x i8] c"\00\00\00@"
@buffer_for_constant_9 = constant [64 x i8] c"\00\00\00@\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128

define void @fusion_7(ptr noalias align 16 dereferenceable(1572864) %arg0, ptr noalias align 16 dereferenceable(2097152) %arg1, ptr noalias align 16 dereferenceable(786432) %arg2, ptr noalias align 128 dereferenceable(4456448) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !24
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
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
  br i1 %23, label %fusion_7.in_bounds-true, label %fusion_7.in_bounds-after

fusion_7.in_bounds-after:                         ; preds = %concatenate.4.merge21, %entry
  ret void

fusion_7.in_bounds-true:                          ; preds = %entry
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
  %41 = load float, ptr %40, align 4, !invariant.load !26
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
  %51 = load float, ptr %50, align 4, !invariant.load !26
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
  %61 = load float, ptr %60, align 4, !invariant.load !26
  br label %concatenate.4.merge

concatenate.pivot.48.:                            ; preds = %fusion_7.in_bounds-true
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
  %83 = load float, ptr %82, align 4, !invariant.load !26
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
  %93 = load float, ptr %92, align 4, !invariant.load !26
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
  %103 = load float, ptr %102, align 4, !invariant.load !26
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
  %125 = load float, ptr %124, align 4, !invariant.load !26
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
  %135 = load float, ptr %134, align 4, !invariant.load !26
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
  %145 = load float, ptr %144, align 4, !invariant.load !26
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
  %167 = load float, ptr %166, align 4, !invariant.load !26
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
  %177 = load float, ptr %176, align 4, !invariant.load !26
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
  %187 = load float, ptr %186, align 4, !invariant.load !26
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
  br label %fusion_7.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_8(ptr noalias align 16 dereferenceable(14680064) %arg0, ptr noalias align 16 dereferenceable(4194304) %arg1, ptr noalias align 16 dereferenceable(4194304) %arg2, ptr noalias align 16 dereferenceable(4194304) %arg3, ptr noalias align 128 dereferenceable(27262976) %arg4) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !27
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
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
  br i1 %23, label %fusion_8.in_bounds-true, label %fusion_8.in_bounds-after

fusion_8.in_bounds-after:                         ; preds = %concatenate.5.merge28, %entry
  ret void

fusion_8.in_bounds-true:                          ; preds = %entry
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
  %41 = load float, ptr %40, align 4, !invariant.load !26
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
  %51 = load float, ptr %50, align 4, !invariant.load !26
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
  %61 = load float, ptr %60, align 4, !invariant.load !26
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
  %71 = load float, ptr %70, align 4, !invariant.load !26
  br label %concatenate.5.merge

concatenate.pivot.576.:                           ; preds = %fusion_8.in_bounds-true
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
  %94 = load float, ptr %93, align 4, !invariant.load !26
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
  %104 = load float, ptr %103, align 4, !invariant.load !26
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
  %114 = load float, ptr %113, align 4, !invariant.load !26
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
  %124 = load float, ptr %123, align 4, !invariant.load !26
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
  %147 = load float, ptr %146, align 4, !invariant.load !26
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
  %157 = load float, ptr %156, align 4, !invariant.load !26
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
  %167 = load float, ptr %166, align 4, !invariant.load !26
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
  %177 = load float, ptr %176, align 4, !invariant.load !26
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
  %200 = load float, ptr %199, align 4, !invariant.load !26
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
  %210 = load float, ptr %209, align 4, !invariant.load !26
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
  %220 = load float, ptr %219, align 4, !invariant.load !26
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
  %230 = load float, ptr %229, align 4, !invariant.load !26
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
  br label %fusion_8.in_bounds-after
}

define void @concatenate_3(ptr noalias align 16 dereferenceable(262144) %arg0, ptr noalias align 16 dereferenceable(65536) %arg1, ptr noalias align 128 dereferenceable(327680) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !28
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
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
  %16 = load float, ptr %15, align 4, !invariant.load !26
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
  %26 = load float, ptr %25, align 4, !invariant.load !26
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

define void @add_4(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 128 dereferenceable(16777216) %arg1) {
entry:
  %loop.invar_address = alloca i32, align 4
  store i32 0, ptr %loop.invar_address, align 4
  br label %loop.loop_header

loop.loop_header:                                 ; preds = %add_4.in_bounds-after, %entry
  %loop.indvar = load i32, ptr %loop.invar_address, align 4
  %0 = icmp uge i32 %loop.indvar, 4194304
  br i1 %0, label %loop.loop_exit, label %loop.loop_body

loop.loop_body:                                   ; preds = %loop.loop_header
  %invar.inc = add nuw nsw i32 %loop.indvar, 442368
  store i32 %invar.inc, ptr %loop.invar_address, align 4
  %1 = icmp eq i32 %loop.indvar, 0
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !30
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !31
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
  br i1 %17, label %add_4.in_bounds-true, label %add_4.in_bounds-after

add_4.in_bounds-after:                            ; preds = %add_4.in_bounds-true, %loop.loop_body
  br label %loop.loop_header, !llvm.loop !32

loop.loop_exit:                                   ; preds = %loop.loop_header
  ret void

add_4.in_bounds-true:                             ; preds = %loop.loop_body
  %18 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_plus_base
  %21 = load float, ptr %20, align 4, !invariant.load !26
  %add.3 = fadd float %19, %21
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_plus_base
  store float %add.3, ptr %22, align 4
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %24 = load float, ptr %23, align 4
  %25 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  %26 = load float, ptr %25, align 4, !invariant.load !26
  %add.31 = fadd float %24, %26
  %27 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %add.31, ptr %27, align 4
  %28 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %29 = load float, ptr %28, align 4
  %30 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  %31 = load float, ptr %30, align 4, !invariant.load !26
  %add.32 = fadd float %29, %31
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %add.32, ptr %32, align 4
  %33 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %34 = load float, ptr %33, align 4
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  %36 = load float, ptr %35, align 4, !invariant.load !26
  %add.33 = fadd float %34, %36
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %add.33, ptr %37, align 4
  br label %add_4.in_bounds-after
}

define void @fusion_12(ptr noalias align 128 dereferenceable(20971520) %arg0, ptr noalias align 128 dereferenceable(20971520) %arg1, ptr noalias align 128 dereferenceable(16777216) %arg2, ptr noalias align 128 dereferenceable(16777216) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
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
  br i1 %15, label %fusion_12.in_bounds-true, label %fusion_12.in_bounds-after

fusion_12.in_bounds-after:                        ; preds = %fusion_12.in_bounds-true, %entry
  ret void

fusion_12.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  %19 = load float, ptr %18, align 4, !invariant.load !26
  %add.5 = fadd float %17, %19
  %20 = add i32 %5, 0
  %21 = add i32 %4, 0
  %22 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %20, i32 %21
  %23 = load float, ptr %22, align 4, !invariant.load !26
  %add.7 = fadd float %add.5, %23
  %24 = add i32 %5, 0
  %25 = add i32 %4, 0
  %26 = getelementptr inbounds [8192 x [640 x float]], ptr %arg0, i32 0, i32 %24, i32 %25
  %27 = load float, ptr %26, align 4, !invariant.load !26
  %add.9 = fadd float %add.7, %27
  %28 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %add.9, ptr %28, align 4
  %29 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %30 = load float, ptr %29, align 4
  %31 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  %32 = load float, ptr %31, align 4, !invariant.load !26
  %add.51 = fadd float %30, %32
  %33 = add i32 %8, 0
  %34 = add i32 %7, 0
  %35 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %33, i32 %34
  %36 = load float, ptr %35, align 4, !invariant.load !26
  %add.72 = fadd float %add.51, %36
  %37 = add i32 %8, 0
  %38 = add i32 %7, 0
  %39 = getelementptr inbounds [8192 x [640 x float]], ptr %arg0, i32 0, i32 %37, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !26
  %add.93 = fadd float %add.72, %40
  %41 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %add.93, ptr %41, align 4
  %42 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %43 = load float, ptr %42, align 4
  %44 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  %45 = load float, ptr %44, align 4, !invariant.load !26
  %add.54 = fadd float %43, %45
  %46 = add i32 %11, 0
  %47 = add i32 %10, 0
  %48 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %46, i32 %47
  %49 = load float, ptr %48, align 4, !invariant.load !26
  %add.75 = fadd float %add.54, %49
  %50 = add i32 %11, 0
  %51 = add i32 %10, 0
  %52 = getelementptr inbounds [8192 x [640 x float]], ptr %arg0, i32 0, i32 %50, i32 %51
  %53 = load float, ptr %52, align 4, !invariant.load !26
  %add.96 = fadd float %add.75, %53
  %54 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %add.96, ptr %54, align 4
  %55 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %56 = load float, ptr %55, align 4
  %57 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  %58 = load float, ptr %57, align 4, !invariant.load !26
  %add.57 = fadd float %56, %58
  %59 = add i32 %14, 0
  %60 = add i32 %13, 0
  %61 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %59, i32 %60
  %62 = load float, ptr %61, align 4, !invariant.load !26
  %add.78 = fadd float %add.57, %62
  %63 = add i32 %14, 0
  %64 = add i32 %13, 0
  %65 = getelementptr inbounds [8192 x [640 x float]], ptr %arg0, i32 0, i32 %63, i32 %64
  %66 = load float, ptr %65, align 4, !invariant.load !26
  %add.99 = fadd float %add.78, %66
  %67 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  store float %add.99, ptr %67, align 4
  br label %fusion_12.in_bounds-after
}

define void @fusion_11(ptr noalias align 128 dereferenceable(16777216) %arg0, ptr noalias align 16 dereferenceable(2048) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
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
  br i1 %15, label %fusion_11.in_bounds-true, label %fusion_11.in_bounds-after

fusion_11.in_bounds-after:                        ; preds = %fusion_11.in_bounds-true, %entry
  ret void

fusion_11.in_bounds-true:                         ; preds = %entry
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !26
  %add.4 = fadd float %17, %19
  %region_0_8_constant_5 = load float, ptr @0, align 4
  %20 = fcmp oge float %add.4, %region_0_8_constant_5
  %21 = fcmp une float %add.4, %add.4
  %22 = or i1 %20, %21
  %maximum.7 = select i1 %22, float %add.4, float %region_0_8_constant_5
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  store float %maximum.7, ptr %23, align 4
  %24 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %25 = load float, ptr %24, align 4
  %26 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %7
  %27 = load float, ptr %26, align 4, !invariant.load !26
  %add.41 = fadd float %25, %27
  %region_0_8_constant_52 = load float, ptr @0, align 4
  %28 = fcmp oge float %add.41, %region_0_8_constant_52
  %29 = fcmp une float %add.41, %add.41
  %30 = or i1 %28, %29
  %maximum.73 = select i1 %30, float %add.41, float %region_0_8_constant_52
  %31 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %maximum.73, ptr %31, align 4
  %32 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %33 = load float, ptr %32, align 4
  %34 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %10
  %35 = load float, ptr %34, align 4, !invariant.load !26
  %add.44 = fadd float %33, %35
  %region_0_8_constant_55 = load float, ptr @0, align 4
  %36 = fcmp oge float %add.44, %region_0_8_constant_55
  %37 = fcmp une float %add.44, %add.44
  %38 = or i1 %36, %37
  %maximum.76 = select i1 %38, float %add.44, float %region_0_8_constant_55
  %39 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %maximum.76, ptr %39, align 4
  %40 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %41 = load float, ptr %40, align 4
  %42 = getelementptr inbounds [512 x float], ptr %arg1, i32 0, i32 %13
  %43 = load float, ptr %42, align 4, !invariant.load !26
  %add.47 = fadd float %41, %43
  %region_0_8_constant_58 = load float, ptr @0, align 4
  %44 = fcmp oge float %add.47, %region_0_8_constant_58
  %45 = fcmp une float %add.47, %add.47
  %46 = or i1 %44, %45
  %maximum.79 = select i1 %46, float %add.47, float %region_0_8_constant_58
  %47 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %maximum.79, ptr %47, align 4
  br label %fusion_11.in_bounds-after
}

define void @fusion_10(ptr noalias align 128 dereferenceable(983040) %arg0, ptr noalias align 16 dereferenceable(120) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
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
  br i1 %15, label %fusion_10.in_bounds-true, label %fusion_10.in_bounds-after

fusion_10.in_bounds-after:                        ; preds = %fusion_10.in_bounds-true, %entry
  ret void

fusion_10.in_bounds-true:                         ; preds = %entry
  %region_0_11_constant_3 = load float, ptr @1, align 4
  %16 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  %17 = load float, ptr %16, align 4
  %18 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %4
  %19 = load float, ptr %18, align 4, !invariant.load !26
  %add.6 = fadd float %17, %19
  %20 = fneg float %add.6
  %21 = call float @__nv_expf(float %20)
  %add.9 = fadd float %region_0_11_constant_3, %21
  %divide.10 = fdiv float %region_0_11_constant_3, %add.9
  %22 = getelementptr inbounds float, ptr %arg0, i32 %linear_index_base
  store float %divide.10, ptr %22, align 4
  %region_0_11_constant_31 = load float, ptr @1, align 4
  %23 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  %24 = load float, ptr %23, align 4
  %25 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %7
  %26 = load float, ptr %25, align 4, !invariant.load !26
  %add.62 = fadd float %24, %26
  %27 = fneg float %add.62
  %28 = call float @__nv_expf(float %27)
  %add.93 = fadd float %region_0_11_constant_31, %28
  %divide.104 = fdiv float %region_0_11_constant_31, %add.93
  %29 = getelementptr inbounds float, ptr %arg0, i32 %linear_index1
  store float %divide.104, ptr %29, align 4
  %region_0_11_constant_35 = load float, ptr @1, align 4
  %30 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  %31 = load float, ptr %30, align 4
  %32 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %10
  %33 = load float, ptr %32, align 4, !invariant.load !26
  %add.66 = fadd float %31, %33
  %34 = fneg float %add.66
  %35 = call float @__nv_expf(float %34)
  %add.97 = fadd float %region_0_11_constant_35, %35
  %divide.108 = fdiv float %region_0_11_constant_35, %add.97
  %36 = getelementptr inbounds float, ptr %arg0, i32 %linear_index2
  store float %divide.108, ptr %36, align 4
  %region_0_11_constant_39 = load float, ptr @1, align 4
  %37 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  %38 = load float, ptr %37, align 4
  %39 = getelementptr inbounds [30 x float], ptr %arg1, i32 0, i32 %13
  %40 = load float, ptr %39, align 4, !invariant.load !26
  %add.610 = fadd float %38, %40
  %41 = fneg float %add.610
  %42 = call float @__nv_expf(float %41)
  %add.911 = fadd float %region_0_11_constant_39, %42
  %divide.1012 = fdiv float %region_0_11_constant_39, %add.911
  %43 = getelementptr inbounds float, ptr %arg0, i32 %linear_index3
  store float %divide.1012, ptr %43, align 4
  br label %fusion_10.in_bounds-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_expf(float) #2

define void @fusion_6(ptr noalias align 128 dereferenceable(4456448) %arg0, ptr noalias align 128 dereferenceable(27262976) %arg1, ptr noalias align 128 dereferenceable(983040) %arg2, ptr noalias align 128 dereferenceable(31719424) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
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
  br i1 %15, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %concatenate.15.merge28, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
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
  %35 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %33, i32 %34
  %36 = load float, ptr %35, align 4, !invariant.load !26
  %region_0_16_constant_4 = load float, ptr @2, align 4
  %multiply.6 = fmul float %36, %region_0_16_constant_4
  %37 = getelementptr inbounds float, ptr %arg1, i32 %20
  %38 = load float, ptr %37, align 4, !invariant.load !26
  %multiply.9 = fmul float %multiply.6, %38
  br label %concatenate.15.merge

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
  %58 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %56, i32 %57
  %59 = load float, ptr %58, align 4, !invariant.load !26
  %region_0_16_constant_41 = load float, ptr @2, align 4
  %multiply.62 = fmul float %59, %region_0_16_constant_41
  %60 = getelementptr inbounds float, ptr %arg0, i32 %43
  %61 = load float, ptr %60, align 4, !invariant.load !26
  %multiply.13 = fmul float %multiply.62, %61
  br label %concatenate.15.merge

concatenate.pivot.832.:                           ; preds = %fusion_6.in_bounds-true
  %62 = icmp ult i32 %4, 832
  br i1 %62, label %concatenate.pivot.0., label %concatenate.pivot.832.3

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.832.
  br label %concat_index_from_operand_id0

concatenate.pivot.832.3:                          ; preds = %concatenate.pivot.832.
  br label %concat_index_from_operand_id1

concatenate.15.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %63 = phi float [ %multiply.9, %concat_index_from_operand_id0 ], [ %multiply.13, %concat_index_from_operand_id1 ]
  %64 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %63, ptr %64, align 4
  br label %concatenate.pivot.832.13

concat_index_from_operand_id05:                   ; preds = %concatenate.pivot.0.14
  %65 = phi i32 [ 0, %concatenate.pivot.0.14 ]
  %66 = sub nsw i32 %7, %65
  %67 = udiv i32 %linear_index1, 968
  %68 = mul i32 %67, 832
  %69 = add i32 %68, %66
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 832
  %72 = udiv i32 %69, 832
  %73 = mul nuw nsw i32 %66, 1
  %74 = add nuw nsw i32 0, %73
  %75 = urem i32 %74, 64
  %76 = udiv i32 %74, 64
  %77 = udiv i32 %76, 13
  %78 = mul nuw nsw i32 %8, 1
  %79 = add nuw nsw i32 0, %78
  %80 = udiv i32 %79, 8192
  %81 = udiv i32 %69, 64
  %82 = add i32 %79, 0
  %83 = add i32 %76, 0
  %84 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %82, i32 %83
  %85 = load float, ptr %84, align 4, !invariant.load !26
  %region_0_16_constant_46 = load float, ptr @2, align 4
  %multiply.67 = fmul float %85, %region_0_16_constant_46
  %86 = getelementptr inbounds float, ptr %arg1, i32 %69
  %87 = load float, ptr %86, align 4, !invariant.load !26
  %multiply.98 = fmul float %multiply.67, %87
  br label %concatenate.15.merge4

concat_index_from_operand_id19:                   ; preds = %concatenate.pivot.832.15
  %88 = phi i32 [ 832, %concatenate.pivot.832.15 ]
  %89 = sub nsw i32 %7, %88
  %90 = udiv i32 %linear_index1, 968
  %91 = mul i32 %90, 136
  %92 = add i32 %91, %89
  %93 = udiv i32 %92, 1
  %94 = urem i32 %93, 136
  %95 = udiv i32 %92, 136
  %96 = mul nuw nsw i32 %89, 1
  %97 = add nuw nsw i32 0, %96
  %98 = urem i32 %97, 8
  %99 = udiv i32 %97, 8
  %100 = udiv i32 %99, 17
  %101 = mul nuw nsw i32 %8, 1
  %102 = add nuw nsw i32 0, %101
  %103 = udiv i32 %102, 8192
  %104 = udiv i32 %92, 8
  %105 = add i32 %102, 0
  %106 = add i32 %99, 13
  %107 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %105, i32 %106
  %108 = load float, ptr %107, align 4, !invariant.load !26
  %region_0_16_constant_410 = load float, ptr @2, align 4
  %multiply.611 = fmul float %108, %region_0_16_constant_410
  %109 = getelementptr inbounds float, ptr %arg0, i32 %92
  %110 = load float, ptr %109, align 4, !invariant.load !26
  %multiply.1312 = fmul float %multiply.611, %110
  br label %concatenate.15.merge4

concatenate.pivot.832.13:                         ; preds = %concatenate.15.merge
  %111 = icmp ult i32 %7, 832
  br i1 %111, label %concatenate.pivot.0.14, label %concatenate.pivot.832.15

concatenate.pivot.0.14:                           ; preds = %concatenate.pivot.832.13
  br label %concat_index_from_operand_id05

concatenate.pivot.832.15:                         ; preds = %concatenate.pivot.832.13
  br label %concat_index_from_operand_id19

concatenate.15.merge4:                            ; preds = %concat_index_from_operand_id19, %concat_index_from_operand_id05
  %112 = phi float [ %multiply.98, %concat_index_from_operand_id05 ], [ %multiply.1312, %concat_index_from_operand_id19 ]
  %113 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %112, ptr %113, align 4
  br label %concatenate.pivot.832.25

concat_index_from_operand_id017:                  ; preds = %concatenate.pivot.0.26
  %114 = phi i32 [ 0, %concatenate.pivot.0.26 ]
  %115 = sub nsw i32 %10, %114
  %116 = udiv i32 %linear_index2, 968
  %117 = mul i32 %116, 832
  %118 = add i32 %117, %115
  %119 = udiv i32 %118, 1
  %120 = urem i32 %119, 832
  %121 = udiv i32 %118, 832
  %122 = mul nuw nsw i32 %115, 1
  %123 = add nuw nsw i32 0, %122
  %124 = urem i32 %123, 64
  %125 = udiv i32 %123, 64
  %126 = udiv i32 %125, 13
  %127 = mul nuw nsw i32 %11, 1
  %128 = add nuw nsw i32 0, %127
  %129 = udiv i32 %128, 8192
  %130 = udiv i32 %118, 64
  %131 = add i32 %128, 0
  %132 = add i32 %125, 0
  %133 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %131, i32 %132
  %134 = load float, ptr %133, align 4, !invariant.load !26
  %region_0_16_constant_418 = load float, ptr @2, align 4
  %multiply.619 = fmul float %134, %region_0_16_constant_418
  %135 = getelementptr inbounds float, ptr %arg1, i32 %118
  %136 = load float, ptr %135, align 4, !invariant.load !26
  %multiply.920 = fmul float %multiply.619, %136
  br label %concatenate.15.merge16

concat_index_from_operand_id121:                  ; preds = %concatenate.pivot.832.27
  %137 = phi i32 [ 832, %concatenate.pivot.832.27 ]
  %138 = sub nsw i32 %10, %137
  %139 = udiv i32 %linear_index2, 968
  %140 = mul i32 %139, 136
  %141 = add i32 %140, %138
  %142 = udiv i32 %141, 1
  %143 = urem i32 %142, 136
  %144 = udiv i32 %141, 136
  %145 = mul nuw nsw i32 %138, 1
  %146 = add nuw nsw i32 0, %145
  %147 = urem i32 %146, 8
  %148 = udiv i32 %146, 8
  %149 = udiv i32 %148, 17
  %150 = mul nuw nsw i32 %11, 1
  %151 = add nuw nsw i32 0, %150
  %152 = udiv i32 %151, 8192
  %153 = udiv i32 %141, 8
  %154 = add i32 %151, 0
  %155 = add i32 %148, 13
  %156 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %154, i32 %155
  %157 = load float, ptr %156, align 4, !invariant.load !26
  %region_0_16_constant_422 = load float, ptr @2, align 4
  %multiply.623 = fmul float %157, %region_0_16_constant_422
  %158 = getelementptr inbounds float, ptr %arg0, i32 %141
  %159 = load float, ptr %158, align 4, !invariant.load !26
  %multiply.1324 = fmul float %multiply.623, %159
  br label %concatenate.15.merge16

concatenate.pivot.832.25:                         ; preds = %concatenate.15.merge4
  %160 = icmp ult i32 %10, 832
  br i1 %160, label %concatenate.pivot.0.26, label %concatenate.pivot.832.27

concatenate.pivot.0.26:                           ; preds = %concatenate.pivot.832.25
  br label %concat_index_from_operand_id017

concatenate.pivot.832.27:                         ; preds = %concatenate.pivot.832.25
  br label %concat_index_from_operand_id121

concatenate.15.merge16:                           ; preds = %concat_index_from_operand_id121, %concat_index_from_operand_id017
  %161 = phi float [ %multiply.920, %concat_index_from_operand_id017 ], [ %multiply.1324, %concat_index_from_operand_id121 ]
  %162 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %161, ptr %162, align 4
  br label %concatenate.pivot.832.37

concat_index_from_operand_id029:                  ; preds = %concatenate.pivot.0.38
  %163 = phi i32 [ 0, %concatenate.pivot.0.38 ]
  %164 = sub nsw i32 %13, %163
  %165 = udiv i32 %linear_index3, 968
  %166 = mul i32 %165, 832
  %167 = add i32 %166, %164
  %168 = udiv i32 %167, 1
  %169 = urem i32 %168, 832
  %170 = udiv i32 %167, 832
  %171 = mul nuw nsw i32 %164, 1
  %172 = add nuw nsw i32 0, %171
  %173 = urem i32 %172, 64
  %174 = udiv i32 %172, 64
  %175 = udiv i32 %174, 13
  %176 = mul nuw nsw i32 %14, 1
  %177 = add nuw nsw i32 0, %176
  %178 = udiv i32 %177, 8192
  %179 = udiv i32 %167, 64
  %180 = add i32 %177, 0
  %181 = add i32 %174, 0
  %182 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %180, i32 %181
  %183 = load float, ptr %182, align 4, !invariant.load !26
  %region_0_16_constant_430 = load float, ptr @2, align 4
  %multiply.631 = fmul float %183, %region_0_16_constant_430
  %184 = getelementptr inbounds float, ptr %arg1, i32 %167
  %185 = load float, ptr %184, align 4, !invariant.load !26
  %multiply.932 = fmul float %multiply.631, %185
  br label %concatenate.15.merge28

concat_index_from_operand_id133:                  ; preds = %concatenate.pivot.832.39
  %186 = phi i32 [ 832, %concatenate.pivot.832.39 ]
  %187 = sub nsw i32 %13, %186
  %188 = udiv i32 %linear_index3, 968
  %189 = mul i32 %188, 136
  %190 = add i32 %189, %187
  %191 = udiv i32 %190, 1
  %192 = urem i32 %191, 136
  %193 = udiv i32 %190, 136
  %194 = mul nuw nsw i32 %187, 1
  %195 = add nuw nsw i32 0, %194
  %196 = urem i32 %195, 8
  %197 = udiv i32 %195, 8
  %198 = udiv i32 %197, 17
  %199 = mul nuw nsw i32 %14, 1
  %200 = add nuw nsw i32 0, %199
  %201 = udiv i32 %200, 8192
  %202 = udiv i32 %190, 8
  %203 = add i32 %200, 0
  %204 = add i32 %197, 13
  %205 = getelementptr inbounds [8192 x [30 x float]], ptr %arg2, i32 0, i32 %203, i32 %204
  %206 = load float, ptr %205, align 4, !invariant.load !26
  %region_0_16_constant_434 = load float, ptr @2, align 4
  %multiply.635 = fmul float %206, %region_0_16_constant_434
  %207 = getelementptr inbounds float, ptr %arg0, i32 %190
  %208 = load float, ptr %207, align 4, !invariant.load !26
  %multiply.1336 = fmul float %multiply.635, %208
  br label %concatenate.15.merge28

concatenate.pivot.832.37:                         ; preds = %concatenate.15.merge16
  %209 = icmp ult i32 %13, 832
  br i1 %209, label %concatenate.pivot.0.38, label %concatenate.pivot.832.39

concatenate.pivot.0.38:                           ; preds = %concatenate.pivot.832.37
  br label %concat_index_from_operand_id029

concatenate.pivot.832.39:                         ; preds = %concatenate.pivot.832.37
  br label %concat_index_from_operand_id133

concatenate.15.merge28:                           ; preds = %concat_index_from_operand_id133, %concat_index_from_operand_id029
  %210 = phi float [ %multiply.932, %concat_index_from_operand_id029 ], [ %multiply.1336, %concat_index_from_operand_id133 ]
  %211 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %210, ptr %211, align 4
  br label %fusion_6.in_bounds-after
}

define void @fusion_3(ptr noalias align 16 dereferenceable(512) %arg0, ptr noalias align 128 dereferenceable(20971520) %arg1, ptr noalias align 128 dereferenceable(4194304) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !29
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !25
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
  %19 = load float, ptr %18, align 4, !invariant.load !26
  %20 = getelementptr inbounds [128 x float], ptr %arg0, i32 0, i32 %4
  %21 = load float, ptr %20, align 4, !invariant.load !26
  %add.5 = fadd float %19, %21
  %region_0_9_constant_6 = load float, ptr @3, align 4
  %22 = fcmp oge float %add.5, %region_0_9_constant_6
  %23 = fcmp une float %add.5, %add.5
  %24 = or i1 %22, %23
  %maximum.8 = select i1 %24, float %add.5, float %region_0_9_constant_6
  %25 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  store float %maximum.8, ptr %25, align 4
  %26 = add i32 %8, 0
  %27 = add i32 %7, 512
  %28 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %26, i32 %27
  %29 = load float, ptr %28, align 4, !invariant.load !26
  %30 = getelementptr inbounds [128 x float], ptr %arg0, i32 0, i32 %7
  %31 = load float, ptr %30, align 4, !invariant.load !26
  %add.51 = fadd float %29, %31
  %region_0_9_constant_62 = load float, ptr @3, align 4
  %32 = fcmp oge float %add.51, %region_0_9_constant_62
  %33 = fcmp une float %add.51, %add.51
  %34 = or i1 %32, %33
  %maximum.83 = select i1 %34, float %add.51, float %region_0_9_constant_62
  %35 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  store float %maximum.83, ptr %35, align 4
  %36 = add i32 %11, 0
  %37 = add i32 %10, 512
  %38 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %36, i32 %37
  %39 = load float, ptr %38, align 4, !invariant.load !26
  %40 = getelementptr inbounds [128 x float], ptr %arg0, i32 0, i32 %10
  %41 = load float, ptr %40, align 4, !invariant.load !26
  %add.54 = fadd float %39, %41
  %region_0_9_constant_65 = load float, ptr @3, align 4
  %42 = fcmp oge float %add.54, %region_0_9_constant_65
  %43 = fcmp une float %add.54, %add.54
  %44 = or i1 %42, %43
  %maximum.86 = select i1 %44, float %add.54, float %region_0_9_constant_65
  %45 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  store float %maximum.86, ptr %45, align 4
  %46 = add i32 %14, 0
  %47 = add i32 %13, 512
  %48 = getelementptr inbounds [8192 x [640 x float]], ptr %arg1, i32 0, i32 %46, i32 %47
  %49 = load float, ptr %48, align 4, !invariant.load !26
  %50 = getelementptr inbounds [128 x float], ptr %arg0, i32 0, i32 %13
  %51 = load float, ptr %50, align 4, !invariant.load !26
  %add.57 = fadd float %49, %51
  %region_0_9_constant_68 = load float, ptr @3, align 4
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !37
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_20_constant_7 = load float, ptr @4, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_20_constant_7, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !38
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !39
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
  br label %y_in_tile.loop_header, !llvm.loop !40

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
  %Arg_2.33 = load float, ptr %Arg_2.3, align 4, !invariant.load !26
  %Arg_3.4 = getelementptr inbounds [64 x float], ptr %arg3, i32 0, i32 %40
  %Arg_3.44 = load float, ptr %Arg_3.4, align 4, !invariant.load !26
  %add.6 = fadd float %Arg_2.33, %Arg_3.44
  %region_0_20_constant_75 = load float, ptr @4, align 4
  %41 = fcmp oge float %add.6, %region_0_20_constant_75
  %42 = fcmp une float %add.6, %add.6
  %43 = or i1 %41, %42
  %maximum.9 = select i1 %43, float %add.6, float %region_0_20_constant_75
  %Arg_0.1 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %39, i32 %40
  %Arg_0.16 = load float, ptr %Arg_0.1, align 4, !invariant.load !26
  %Arg_1.2 = getelementptr inbounds [64 x float], ptr %arg1, i32 0, i32 %40
  %Arg_1.27 = load float, ptr %Arg_1.2, align 4, !invariant.load !26
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
  %49 = getelementptr inbounds [8192 x [64 x float]], ptr %arg6, i32 0, i32 %39, i32 %40
  store float %maximum.9, ptr %49, align 4
  %50 = getelementptr inbounds [8192 x [64 x float]], ptr %arg5, i32 0, i32 %39, i32 %40
  store float %maximum.12, ptr %50, align 4
  br label %tile_loop.loop_header, !llvm.loop !41

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
  br label %tile_loop.loop_header9, !llvm.loop !43

tile_loop.loop_exit8:                             ; preds = %tile_loop.loop_header9
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body10
  %Arg_2.315 = getelementptr inbounds [8192 x [64 x float]], ptr %arg2, i32 0, i32 %56, i32 %57
  %Arg_2.316 = load float, ptr %Arg_2.315, align 4, !invariant.load !26
  %Arg_3.417 = getelementptr inbounds [64 x float], ptr %arg3, i32 0, i32 %57
  %Arg_3.418 = load float, ptr %Arg_3.417, align 4, !invariant.load !26
  %add.619 = fadd float %Arg_2.316, %Arg_3.418
  %region_0_20_constant_720 = load float, ptr @4, align 4
  %59 = fcmp oge float %add.619, %region_0_20_constant_720
  %60 = fcmp une float %add.619, %add.619
  %61 = or i1 %59, %60
  %maximum.921 = select i1 %61, float %add.619, float %region_0_20_constant_720
  %Arg_0.122 = getelementptr inbounds [8192 x [64 x float]], ptr %arg0, i32 0, i32 %56, i32 %57
  %Arg_0.123 = load float, ptr %Arg_0.122, align 4, !invariant.load !26
  %Arg_1.224 = getelementptr inbounds [64 x float], ptr %arg1, i32 0, i32 %57
  %Arg_1.225 = load float, ptr %Arg_1.224, align 4, !invariant.load !26
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
  %67 = getelementptr inbounds [8192 x [64 x float]], ptr %arg6, i32 0, i32 %56, i32 %57
  store float %maximum.921, ptr %67, align 4
  %68 = getelementptr inbounds [8192 x [64 x float]], ptr %arg5, i32 0, i32 %56, i32 %57
  store float %maximum.1227, ptr %68, align 4
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !44
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
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
  %region_0_9_constant_2 = load float, ptr @5, align 4
  %7 = getelementptr inbounds float, ptr %arg0, i32 %linear_index
  %8 = load float, ptr %7, align 4, !invariant.load !26
  %9 = fneg float %8
  %10 = call float @__nv_expf(float %9)
  %add.6 = fadd float %region_0_9_constant_2, %10
  %divide.7 = fdiv float %region_0_9_constant_2, %add.6
  %11 = getelementptr inbounds float, ptr %arg1, i32 %linear_index
  store float %divide.7, ptr %11, align 4
  br label %fusion.in_bounds-after
}

define void @fusion_15(ptr noalias align 128 dereferenceable(983040) %arg0, ptr noalias align 128 dereferenceable(425984) %arg1, ptr noalias align 128 dereferenceable(557056) %arg2) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !35
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !29
  %2 = mul nuw nsw i32 %0, 1024
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 245760
  call void @llvm.assume(i1 %linear_index_in_range)
  %3 = udiv i32 %linear_index, 1
  %4 = icmp ult i32 %linear_index, 245760
  br i1 %4, label %fusion_15.in_bounds-true, label %fusion_15.in_bounds-after

fusion_15.in_bounds-after:                        ; preds = %slice1-after, %entry
  ret void

fusion_15.in_bounds-true:                         ; preds = %entry
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
  %15 = load float, ptr %14, align 4, !invariant.load !26
  %region_0_15_constant_2 = load float, ptr @6, align 4
  %multiply.4 = fmul float %15, %region_0_15_constant_2
  br label %concatenate.11.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.106496.3
  %16 = phi i32 [ 106496, %concatenate.pivot.106496.3 ]
  %17 = sub nsw i32 %3, %16
  %18 = mul nuw nsw i32 %17, 1
  %19 = add nuw nsw i32 0, %18
  %20 = urem i32 %19, 17
  %21 = udiv i32 %19, 17
  %22 = udiv i32 %21, 8192
  %23 = add i32 %21, 0
  %24 = add i32 %20, 13
  %25 = getelementptr inbounds [8192 x [30 x float]], ptr %arg0, i32 0, i32 %23, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !26
  %region_0_15_constant_21 = load float, ptr @6, align 4
  %multiply.42 = fmul float %26, %region_0_15_constant_21
  br label %concatenate.11.merge

concatenate.pivot.106496.:                        ; preds = %fusion_15.in_bounds-true
  %27 = icmp ult i32 %3, 106496
  br i1 %27, label %concatenate.pivot.0., label %concatenate.pivot.106496.3

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.106496.
  br label %concat_index_from_operand_id0

concatenate.pivot.106496.3:                       ; preds = %concatenate.pivot.106496.
  br label %concat_index_from_operand_id1

concatenate.11.merge:                             ; preds = %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %28 = phi float [ %multiply.4, %concat_index_from_operand_id0 ], [ %multiply.42, %concat_index_from_operand_id1 ]
  %29 = icmp sge i32 %3, 0
  %30 = icmp slt i32 %3, 106496
  %31 = and i1 %29, %30
  br i1 %31, label %slice0-true, label %slice0-after

slice0-after:                                     ; preds = %slice0-true, %concatenate.11.merge
  %32 = icmp sge i32 %3, 106496
  %33 = icmp slt i32 %3, 245760
  %34 = and i1 %32, %33
  br i1 %34, label %slice1-true, label %slice1-after

slice1-after:                                     ; preds = %slice1-true, %slice0-after
  br label %fusion_15.in_bounds-after

slice0-true:                                      ; preds = %concatenate.11.merge
  %35 = sub i32 %3, 0
  %36 = getelementptr inbounds [106496 x float], ptr %arg1, i32 0, i32 %35
  store float %28, ptr %36, align 4
  br label %slice0-after

slice1-true:                                      ; preds = %slice0-after
  %37 = sub i32 %3, 106496
  %38 = getelementptr inbounds [139264 x float], ptr %arg2, i32 0, i32 %37
  store float %28, ptr %38, align 4
  br label %slice1-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #4 = { convergent nocallback nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23}

!0 = !{ptr @fusion_7, !"kernel", i32 1}
!1 = !{ptr @fusion_7, !"reqntidx", i32 256}
!2 = !{ptr @fusion_8, !"kernel", i32 1}
!3 = !{ptr @fusion_8, !"reqntidx", i32 256}
!4 = !{ptr @concatenate_3, !"kernel", i32 1}
!5 = !{ptr @concatenate_3, !"reqntidx", i32 1024}
!6 = !{ptr @add_4, !"kernel", i32 1}
!7 = !{ptr @add_4, !"reqntidx", i32 128}
!8 = !{ptr @fusion_12, !"kernel", i32 1}
!9 = !{ptr @fusion_12, !"reqntidx", i32 256}
!10 = !{ptr @fusion_11, !"kernel", i32 1}
!11 = !{ptr @fusion_11, !"reqntidx", i32 256}
!12 = !{ptr @fusion_10, !"kernel", i32 1}
!13 = !{ptr @fusion_10, !"reqntidx", i32 256}
!14 = !{ptr @fusion_6, !"kernel", i32 1}
!15 = !{ptr @fusion_6, !"reqntidx", i32 256}
!16 = !{ptr @fusion_3, !"kernel", i32 1}
!17 = !{ptr @fusion_3, !"reqntidx", i32 256}
!18 = !{ptr @fusion_1, !"kernel", i32 1}
!19 = !{ptr @fusion_1, !"reqntidx", i32 96}
!20 = !{ptr @fusion, !"kernel", i32 1}
!21 = !{ptr @fusion, !"reqntidx", i32 1024}
!22 = !{ptr @fusion_15, !"kernel", i32 1}
!23 = !{ptr @fusion_15, !"reqntidx", i32 1024}
!24 = !{i32 0, i32 1088}
!25 = !{i32 0, i32 256}
!26 = !{}
!27 = !{i32 0, i32 6656}
!28 = !{i32 0, i32 80}
!29 = !{i32 0, i32 1024}
!30 = !{i32 0, i32 864}
!31 = !{i32 0, i32 128}
!32 = distinct !{!32, !33}
!33 = !{!"llvm.loop.vectorize.enable", i1 false}
!34 = !{i32 0, i32 4096}
!35 = !{i32 0, i32 240}
!36 = !{i32 0, i32 7744}
!37 = !{i32 0, i32 1}
!38 = !{i32 0, i32 96}
!39 = !{i32 0, i32 2731}
!40 = distinct !{!40, !33}
!41 = distinct !{!41, !33, !42}
!42 = !{!"llvm.loop.unroll.full"}
!43 = distinct !{!43, !33, !42}
!44 = !{i32 0, i32 8}
