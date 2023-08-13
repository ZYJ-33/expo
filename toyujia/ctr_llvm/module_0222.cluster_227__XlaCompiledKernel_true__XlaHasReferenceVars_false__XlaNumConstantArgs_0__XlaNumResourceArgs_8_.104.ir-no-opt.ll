target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@1 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF"
@shared_cache1 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@2 = private unnamed_addr constant [4 x i8] c"\00\00\00>"
@3 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@shared_cache2 = private addrspace(3) global [3 x [1 x [1 x float]]] undef
@4 = private unnamed_addr constant [4 x i8] c"\00\00\00>"
@5 = private unnamed_addr constant [4 x i8] c"\00\00\00>"
@6 = private unnamed_addr constant [4 x i8] zeroinitializer
@shared_cache3 = private addrspace(3) global [1 x [2 x [32 x [33 x float]]]] undef
@buffer_for_constant_1 = constant [64 x i8] c"\00\00\00>\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 128

define void @fusion_5(ptr noalias align 16 dereferenceable(104857600) %arg0, ptr noalias align 16 dereferenceable(104857600) %arg1, ptr noalias align 16 dereferenceable(13107200) %arg2, ptr noalias align 16 dereferenceable(13107200) %arg3, ptr noalias align 16 dereferenceable(13107200) %arg4, ptr noalias align 128 dereferenceable(249036800) %arg5) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 15564800
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 152
  %5 = udiv i32 %linear_index_base, 152
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %6 = udiv i32 %linear_index1, 1
  %7 = urem i32 %6, 152
  %8 = udiv i32 %linear_index1, 152
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %9 = udiv i32 %linear_index2, 1
  %10 = urem i32 %9, 152
  %11 = udiv i32 %linear_index2, 152
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %12 = udiv i32 %linear_index3, 1
  %13 = urem i32 %12, 152
  %14 = udiv i32 %linear_index3, 152
  %15 = icmp ult i32 %linear_index_base, 62259200
  br i1 %15, label %fusion_5.in_bounds-true, label %fusion_5.in_bounds-after

fusion_5.in_bounds-after:                         ; preds = %concatenate.6.merge35, %entry
  ret void

fusion_5.in_bounds-true:                          ; preds = %entry
  %16 = mul nuw nsw i32 %4, 1
  %17 = add nuw nsw i32 0, %16
  %18 = udiv i32 %17, 152
  %19 = mul nuw nsw i32 %5, 1
  %20 = add nuw nsw i32 0, %19
  %21 = urem i32 %20, 50
  %22 = udiv i32 %20, 50
  %23 = udiv i32 %22, 8192
  br label %concatenate.pivot.128.

concat_index_from_operand_id0:                    ; preds = %concatenate.pivot.0.
  %24 = phi i32 [ 0, %concatenate.pivot.0. ]
  %25 = sub nsw i32 %17, %24
  %26 = udiv i32 %linear_index_base, 152
  %27 = mul i32 %26, 64
  %28 = add i32 %27, %25
  %29 = udiv i32 %28, 1
  %30 = urem i32 %29, 64
  %31 = udiv i32 %28, 64
  %32 = urem i32 %31, 50
  %33 = udiv i32 %28, 3200
  %34 = getelementptr inbounds float, ptr %arg0, i32 %28
  %35 = load float, ptr %34, align 4, !invariant.load !18
  br label %concatenate.6.merge

concat_index_from_operand_id1:                    ; preds = %concatenate.pivot.64.1
  %36 = phi i32 [ 64, %concatenate.pivot.64.1 ]
  %37 = sub nsw i32 %17, %36
  %38 = udiv i32 %linear_index_base, 152
  %39 = mul i32 %38, 64
  %40 = add i32 %39, %37
  %41 = udiv i32 %40, 1
  %42 = urem i32 %41, 64
  %43 = udiv i32 %40, 64
  %44 = urem i32 %43, 50
  %45 = udiv i32 %40, 3200
  %46 = getelementptr inbounds float, ptr %arg1, i32 %40
  %47 = load float, ptr %46, align 4, !invariant.load !18
  br label %concatenate.6.merge

concat_index_from_operand_id2:                    ; preds = %concatenate.pivot.128.2
  %48 = phi i32 [ 128, %concatenate.pivot.128.2 ]
  %49 = sub nsw i32 %17, %48
  %50 = udiv i32 %linear_index_base, 152
  %51 = mul i32 %50, 8
  %52 = add i32 %51, %49
  %53 = udiv i32 %52, 1
  %54 = urem i32 %53, 8
  %55 = udiv i32 %52, 8
  %56 = urem i32 %55, 50
  %57 = udiv i32 %52, 400
  %58 = getelementptr inbounds float, ptr %arg2, i32 %52
  %59 = load float, ptr %58, align 4, !invariant.load !18
  br label %concatenate.6.merge

concat_index_from_operand_id3:                    ; preds = %concatenate.pivot.136.3
  %60 = phi i32 [ 136, %concatenate.pivot.136.3 ]
  %61 = sub nsw i32 %17, %60
  %62 = udiv i32 %linear_index_base, 152
  %63 = mul i32 %62, 8
  %64 = add i32 %63, %61
  %65 = udiv i32 %64, 1
  %66 = urem i32 %65, 8
  %67 = udiv i32 %64, 8
  %68 = urem i32 %67, 50
  %69 = udiv i32 %64, 400
  %70 = getelementptr inbounds float, ptr %arg3, i32 %64
  %71 = load float, ptr %70, align 4, !invariant.load !18
  br label %concatenate.6.merge

concat_index_from_operand_id4:                    ; preds = %concatenate.pivot.144.4
  %72 = phi i32 [ 144, %concatenate.pivot.144.4 ]
  %73 = sub nsw i32 %17, %72
  %74 = udiv i32 %linear_index_base, 152
  %75 = mul i32 %74, 8
  %76 = add i32 %75, %73
  %77 = udiv i32 %76, 1
  %78 = urem i32 %77, 8
  %79 = udiv i32 %76, 8
  %80 = urem i32 %79, 50
  %81 = udiv i32 %76, 400
  %82 = getelementptr inbounds float, ptr %arg4, i32 %76
  %83 = load float, ptr %82, align 4, !invariant.load !18
  br label %concatenate.6.merge

concatenate.pivot.128.:                           ; preds = %fusion_5.in_bounds-true
  %84 = icmp ult i32 %17, 128
  br i1 %84, label %concatenate.pivot.64., label %concatenate.pivot.136.

concatenate.pivot.64.:                            ; preds = %concatenate.pivot.128.
  %85 = icmp ult i32 %17, 64
  br i1 %85, label %concatenate.pivot.0., label %concatenate.pivot.64.1

concatenate.pivot.0.:                             ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id0

concatenate.pivot.64.1:                           ; preds = %concatenate.pivot.64.
  br label %concat_index_from_operand_id1

concatenate.pivot.136.:                           ; preds = %concatenate.pivot.128.
  %86 = icmp ult i32 %17, 136
  br i1 %86, label %concatenate.pivot.128.2, label %concatenate.pivot.144.

concatenate.pivot.128.2:                          ; preds = %concatenate.pivot.136.
  br label %concat_index_from_operand_id2

concatenate.pivot.144.:                           ; preds = %concatenate.pivot.136.
  %87 = icmp ult i32 %17, 144
  br i1 %87, label %concatenate.pivot.136.3, label %concatenate.pivot.144.4

concatenate.pivot.136.3:                          ; preds = %concatenate.pivot.144.
  br label %concat_index_from_operand_id3

concatenate.pivot.144.4:                          ; preds = %concatenate.pivot.144.
  br label %concat_index_from_operand_id4

concatenate.6.merge:                              ; preds = %concat_index_from_operand_id4, %concat_index_from_operand_id3, %concat_index_from_operand_id2, %concat_index_from_operand_id1, %concat_index_from_operand_id0
  %88 = phi float [ %35, %concat_index_from_operand_id0 ], [ %47, %concat_index_from_operand_id1 ], [ %59, %concat_index_from_operand_id2 ], [ %71, %concat_index_from_operand_id3 ], [ %83, %concat_index_from_operand_id4 ]
  %89 = getelementptr inbounds float, ptr %arg5, i32 %linear_index_base
  store float %88, ptr %89, align 4
  %90 = mul nuw nsw i32 %7, 1
  %91 = add nuw nsw i32 0, %90
  %92 = udiv i32 %91, 152
  %93 = mul nuw nsw i32 %8, 1
  %94 = add nuw nsw i32 0, %93
  %95 = urem i32 %94, 50
  %96 = udiv i32 %94, 50
  %97 = udiv i32 %96, 8192
  br label %concatenate.pivot.128.11

concat_index_from_operand_id06:                   ; preds = %concatenate.pivot.0.13
  %98 = phi i32 [ 0, %concatenate.pivot.0.13 ]
  %99 = sub nsw i32 %91, %98
  %100 = udiv i32 %linear_index1, 152
  %101 = mul i32 %100, 64
  %102 = add i32 %101, %99
  %103 = udiv i32 %102, 1
  %104 = urem i32 %103, 64
  %105 = udiv i32 %102, 64
  %106 = urem i32 %105, 50
  %107 = udiv i32 %102, 3200
  %108 = getelementptr inbounds float, ptr %arg0, i32 %102
  %109 = load float, ptr %108, align 4, !invariant.load !18
  br label %concatenate.6.merge5

concat_index_from_operand_id17:                   ; preds = %concatenate.pivot.64.14
  %110 = phi i32 [ 64, %concatenate.pivot.64.14 ]
  %111 = sub nsw i32 %91, %110
  %112 = udiv i32 %linear_index1, 152
  %113 = mul i32 %112, 64
  %114 = add i32 %113, %111
  %115 = udiv i32 %114, 1
  %116 = urem i32 %115, 64
  %117 = udiv i32 %114, 64
  %118 = urem i32 %117, 50
  %119 = udiv i32 %114, 3200
  %120 = getelementptr inbounds float, ptr %arg1, i32 %114
  %121 = load float, ptr %120, align 4, !invariant.load !18
  br label %concatenate.6.merge5

concat_index_from_operand_id28:                   ; preds = %concatenate.pivot.128.16
  %122 = phi i32 [ 128, %concatenate.pivot.128.16 ]
  %123 = sub nsw i32 %91, %122
  %124 = udiv i32 %linear_index1, 152
  %125 = mul i32 %124, 8
  %126 = add i32 %125, %123
  %127 = udiv i32 %126, 1
  %128 = urem i32 %127, 8
  %129 = udiv i32 %126, 8
  %130 = urem i32 %129, 50
  %131 = udiv i32 %126, 400
  %132 = getelementptr inbounds float, ptr %arg2, i32 %126
  %133 = load float, ptr %132, align 4, !invariant.load !18
  br label %concatenate.6.merge5

concat_index_from_operand_id39:                   ; preds = %concatenate.pivot.136.18
  %134 = phi i32 [ 136, %concatenate.pivot.136.18 ]
  %135 = sub nsw i32 %91, %134
  %136 = udiv i32 %linear_index1, 152
  %137 = mul i32 %136, 8
  %138 = add i32 %137, %135
  %139 = udiv i32 %138, 1
  %140 = urem i32 %139, 8
  %141 = udiv i32 %138, 8
  %142 = urem i32 %141, 50
  %143 = udiv i32 %138, 400
  %144 = getelementptr inbounds float, ptr %arg3, i32 %138
  %145 = load float, ptr %144, align 4, !invariant.load !18
  br label %concatenate.6.merge5

concat_index_from_operand_id410:                  ; preds = %concatenate.pivot.144.19
  %146 = phi i32 [ 144, %concatenate.pivot.144.19 ]
  %147 = sub nsw i32 %91, %146
  %148 = udiv i32 %linear_index1, 152
  %149 = mul i32 %148, 8
  %150 = add i32 %149, %147
  %151 = udiv i32 %150, 1
  %152 = urem i32 %151, 8
  %153 = udiv i32 %150, 8
  %154 = urem i32 %153, 50
  %155 = udiv i32 %150, 400
  %156 = getelementptr inbounds float, ptr %arg4, i32 %150
  %157 = load float, ptr %156, align 4, !invariant.load !18
  br label %concatenate.6.merge5

concatenate.pivot.128.11:                         ; preds = %concatenate.6.merge
  %158 = icmp ult i32 %91, 128
  br i1 %158, label %concatenate.pivot.64.12, label %concatenate.pivot.136.15

concatenate.pivot.64.12:                          ; preds = %concatenate.pivot.128.11
  %159 = icmp ult i32 %91, 64
  br i1 %159, label %concatenate.pivot.0.13, label %concatenate.pivot.64.14

concatenate.pivot.0.13:                           ; preds = %concatenate.pivot.64.12
  br label %concat_index_from_operand_id06

concatenate.pivot.64.14:                          ; preds = %concatenate.pivot.64.12
  br label %concat_index_from_operand_id17

concatenate.pivot.136.15:                         ; preds = %concatenate.pivot.128.11
  %160 = icmp ult i32 %91, 136
  br i1 %160, label %concatenate.pivot.128.16, label %concatenate.pivot.144.17

concatenate.pivot.128.16:                         ; preds = %concatenate.pivot.136.15
  br label %concat_index_from_operand_id28

concatenate.pivot.144.17:                         ; preds = %concatenate.pivot.136.15
  %161 = icmp ult i32 %91, 144
  br i1 %161, label %concatenate.pivot.136.18, label %concatenate.pivot.144.19

concatenate.pivot.136.18:                         ; preds = %concatenate.pivot.144.17
  br label %concat_index_from_operand_id39

concatenate.pivot.144.19:                         ; preds = %concatenate.pivot.144.17
  br label %concat_index_from_operand_id410

concatenate.6.merge5:                             ; preds = %concat_index_from_operand_id410, %concat_index_from_operand_id39, %concat_index_from_operand_id28, %concat_index_from_operand_id17, %concat_index_from_operand_id06
  %162 = phi float [ %109, %concat_index_from_operand_id06 ], [ %121, %concat_index_from_operand_id17 ], [ %133, %concat_index_from_operand_id28 ], [ %145, %concat_index_from_operand_id39 ], [ %157, %concat_index_from_operand_id410 ]
  %163 = getelementptr inbounds float, ptr %arg5, i32 %linear_index1
  store float %162, ptr %163, align 4
  %164 = mul nuw nsw i32 %10, 1
  %165 = add nuw nsw i32 0, %164
  %166 = udiv i32 %165, 152
  %167 = mul nuw nsw i32 %11, 1
  %168 = add nuw nsw i32 0, %167
  %169 = urem i32 %168, 50
  %170 = udiv i32 %168, 50
  %171 = udiv i32 %170, 8192
  br label %concatenate.pivot.128.26

concat_index_from_operand_id021:                  ; preds = %concatenate.pivot.0.28
  %172 = phi i32 [ 0, %concatenate.pivot.0.28 ]
  %173 = sub nsw i32 %165, %172
  %174 = udiv i32 %linear_index2, 152
  %175 = mul i32 %174, 64
  %176 = add i32 %175, %173
  %177 = udiv i32 %176, 1
  %178 = urem i32 %177, 64
  %179 = udiv i32 %176, 64
  %180 = urem i32 %179, 50
  %181 = udiv i32 %176, 3200
  %182 = getelementptr inbounds float, ptr %arg0, i32 %176
  %183 = load float, ptr %182, align 4, !invariant.load !18
  br label %concatenate.6.merge20

concat_index_from_operand_id122:                  ; preds = %concatenate.pivot.64.29
  %184 = phi i32 [ 64, %concatenate.pivot.64.29 ]
  %185 = sub nsw i32 %165, %184
  %186 = udiv i32 %linear_index2, 152
  %187 = mul i32 %186, 64
  %188 = add i32 %187, %185
  %189 = udiv i32 %188, 1
  %190 = urem i32 %189, 64
  %191 = udiv i32 %188, 64
  %192 = urem i32 %191, 50
  %193 = udiv i32 %188, 3200
  %194 = getelementptr inbounds float, ptr %arg1, i32 %188
  %195 = load float, ptr %194, align 4, !invariant.load !18
  br label %concatenate.6.merge20

concat_index_from_operand_id223:                  ; preds = %concatenate.pivot.128.31
  %196 = phi i32 [ 128, %concatenate.pivot.128.31 ]
  %197 = sub nsw i32 %165, %196
  %198 = udiv i32 %linear_index2, 152
  %199 = mul i32 %198, 8
  %200 = add i32 %199, %197
  %201 = udiv i32 %200, 1
  %202 = urem i32 %201, 8
  %203 = udiv i32 %200, 8
  %204 = urem i32 %203, 50
  %205 = udiv i32 %200, 400
  %206 = getelementptr inbounds float, ptr %arg2, i32 %200
  %207 = load float, ptr %206, align 4, !invariant.load !18
  br label %concatenate.6.merge20

concat_index_from_operand_id324:                  ; preds = %concatenate.pivot.136.33
  %208 = phi i32 [ 136, %concatenate.pivot.136.33 ]
  %209 = sub nsw i32 %165, %208
  %210 = udiv i32 %linear_index2, 152
  %211 = mul i32 %210, 8
  %212 = add i32 %211, %209
  %213 = udiv i32 %212, 1
  %214 = urem i32 %213, 8
  %215 = udiv i32 %212, 8
  %216 = urem i32 %215, 50
  %217 = udiv i32 %212, 400
  %218 = getelementptr inbounds float, ptr %arg3, i32 %212
  %219 = load float, ptr %218, align 4, !invariant.load !18
  br label %concatenate.6.merge20

concat_index_from_operand_id425:                  ; preds = %concatenate.pivot.144.34
  %220 = phi i32 [ 144, %concatenate.pivot.144.34 ]
  %221 = sub nsw i32 %165, %220
  %222 = udiv i32 %linear_index2, 152
  %223 = mul i32 %222, 8
  %224 = add i32 %223, %221
  %225 = udiv i32 %224, 1
  %226 = urem i32 %225, 8
  %227 = udiv i32 %224, 8
  %228 = urem i32 %227, 50
  %229 = udiv i32 %224, 400
  %230 = getelementptr inbounds float, ptr %arg4, i32 %224
  %231 = load float, ptr %230, align 4, !invariant.load !18
  br label %concatenate.6.merge20

concatenate.pivot.128.26:                         ; preds = %concatenate.6.merge5
  %232 = icmp ult i32 %165, 128
  br i1 %232, label %concatenate.pivot.64.27, label %concatenate.pivot.136.30

concatenate.pivot.64.27:                          ; preds = %concatenate.pivot.128.26
  %233 = icmp ult i32 %165, 64
  br i1 %233, label %concatenate.pivot.0.28, label %concatenate.pivot.64.29

concatenate.pivot.0.28:                           ; preds = %concatenate.pivot.64.27
  br label %concat_index_from_operand_id021

concatenate.pivot.64.29:                          ; preds = %concatenate.pivot.64.27
  br label %concat_index_from_operand_id122

concatenate.pivot.136.30:                         ; preds = %concatenate.pivot.128.26
  %234 = icmp ult i32 %165, 136
  br i1 %234, label %concatenate.pivot.128.31, label %concatenate.pivot.144.32

concatenate.pivot.128.31:                         ; preds = %concatenate.pivot.136.30
  br label %concat_index_from_operand_id223

concatenate.pivot.144.32:                         ; preds = %concatenate.pivot.136.30
  %235 = icmp ult i32 %165, 144
  br i1 %235, label %concatenate.pivot.136.33, label %concatenate.pivot.144.34

concatenate.pivot.136.33:                         ; preds = %concatenate.pivot.144.32
  br label %concat_index_from_operand_id324

concatenate.pivot.144.34:                         ; preds = %concatenate.pivot.144.32
  br label %concat_index_from_operand_id425

concatenate.6.merge20:                            ; preds = %concat_index_from_operand_id425, %concat_index_from_operand_id324, %concat_index_from_operand_id223, %concat_index_from_operand_id122, %concat_index_from_operand_id021
  %236 = phi float [ %183, %concat_index_from_operand_id021 ], [ %195, %concat_index_from_operand_id122 ], [ %207, %concat_index_from_operand_id223 ], [ %219, %concat_index_from_operand_id324 ], [ %231, %concat_index_from_operand_id425 ]
  %237 = getelementptr inbounds float, ptr %arg5, i32 %linear_index2
  store float %236, ptr %237, align 4
  %238 = mul nuw nsw i32 %13, 1
  %239 = add nuw nsw i32 0, %238
  %240 = udiv i32 %239, 152
  %241 = mul nuw nsw i32 %14, 1
  %242 = add nuw nsw i32 0, %241
  %243 = urem i32 %242, 50
  %244 = udiv i32 %242, 50
  %245 = udiv i32 %244, 8192
  br label %concatenate.pivot.128.41

concat_index_from_operand_id036:                  ; preds = %concatenate.pivot.0.43
  %246 = phi i32 [ 0, %concatenate.pivot.0.43 ]
  %247 = sub nsw i32 %239, %246
  %248 = udiv i32 %linear_index3, 152
  %249 = mul i32 %248, 64
  %250 = add i32 %249, %247
  %251 = udiv i32 %250, 1
  %252 = urem i32 %251, 64
  %253 = udiv i32 %250, 64
  %254 = urem i32 %253, 50
  %255 = udiv i32 %250, 3200
  %256 = getelementptr inbounds float, ptr %arg0, i32 %250
  %257 = load float, ptr %256, align 4, !invariant.load !18
  br label %concatenate.6.merge35

concat_index_from_operand_id137:                  ; preds = %concatenate.pivot.64.44
  %258 = phi i32 [ 64, %concatenate.pivot.64.44 ]
  %259 = sub nsw i32 %239, %258
  %260 = udiv i32 %linear_index3, 152
  %261 = mul i32 %260, 64
  %262 = add i32 %261, %259
  %263 = udiv i32 %262, 1
  %264 = urem i32 %263, 64
  %265 = udiv i32 %262, 64
  %266 = urem i32 %265, 50
  %267 = udiv i32 %262, 3200
  %268 = getelementptr inbounds float, ptr %arg1, i32 %262
  %269 = load float, ptr %268, align 4, !invariant.load !18
  br label %concatenate.6.merge35

concat_index_from_operand_id238:                  ; preds = %concatenate.pivot.128.46
  %270 = phi i32 [ 128, %concatenate.pivot.128.46 ]
  %271 = sub nsw i32 %239, %270
  %272 = udiv i32 %linear_index3, 152
  %273 = mul i32 %272, 8
  %274 = add i32 %273, %271
  %275 = udiv i32 %274, 1
  %276 = urem i32 %275, 8
  %277 = udiv i32 %274, 8
  %278 = urem i32 %277, 50
  %279 = udiv i32 %274, 400
  %280 = getelementptr inbounds float, ptr %arg2, i32 %274
  %281 = load float, ptr %280, align 4, !invariant.load !18
  br label %concatenate.6.merge35

concat_index_from_operand_id339:                  ; preds = %concatenate.pivot.136.48
  %282 = phi i32 [ 136, %concatenate.pivot.136.48 ]
  %283 = sub nsw i32 %239, %282
  %284 = udiv i32 %linear_index3, 152
  %285 = mul i32 %284, 8
  %286 = add i32 %285, %283
  %287 = udiv i32 %286, 1
  %288 = urem i32 %287, 8
  %289 = udiv i32 %286, 8
  %290 = urem i32 %289, 50
  %291 = udiv i32 %286, 400
  %292 = getelementptr inbounds float, ptr %arg3, i32 %286
  %293 = load float, ptr %292, align 4, !invariant.load !18
  br label %concatenate.6.merge35

concat_index_from_operand_id440:                  ; preds = %concatenate.pivot.144.49
  %294 = phi i32 [ 144, %concatenate.pivot.144.49 ]
  %295 = sub nsw i32 %239, %294
  %296 = udiv i32 %linear_index3, 152
  %297 = mul i32 %296, 8
  %298 = add i32 %297, %295
  %299 = udiv i32 %298, 1
  %300 = urem i32 %299, 8
  %301 = udiv i32 %298, 8
  %302 = urem i32 %301, 50
  %303 = udiv i32 %298, 400
  %304 = getelementptr inbounds float, ptr %arg4, i32 %298
  %305 = load float, ptr %304, align 4, !invariant.load !18
  br label %concatenate.6.merge35

concatenate.pivot.128.41:                         ; preds = %concatenate.6.merge20
  %306 = icmp ult i32 %239, 128
  br i1 %306, label %concatenate.pivot.64.42, label %concatenate.pivot.136.45

concatenate.pivot.64.42:                          ; preds = %concatenate.pivot.128.41
  %307 = icmp ult i32 %239, 64
  br i1 %307, label %concatenate.pivot.0.43, label %concatenate.pivot.64.44

concatenate.pivot.0.43:                           ; preds = %concatenate.pivot.64.42
  br label %concat_index_from_operand_id036

concatenate.pivot.64.44:                          ; preds = %concatenate.pivot.64.42
  br label %concat_index_from_operand_id137

concatenate.pivot.136.45:                         ; preds = %concatenate.pivot.128.41
  %308 = icmp ult i32 %239, 136
  br i1 %308, label %concatenate.pivot.128.46, label %concatenate.pivot.144.47

concatenate.pivot.128.46:                         ; preds = %concatenate.pivot.136.45
  br label %concat_index_from_operand_id238

concatenate.pivot.144.47:                         ; preds = %concatenate.pivot.136.45
  %309 = icmp ult i32 %239, 144
  br i1 %309, label %concatenate.pivot.136.48, label %concatenate.pivot.144.49

concatenate.pivot.136.48:                         ; preds = %concatenate.pivot.144.47
  br label %concat_index_from_operand_id339

concatenate.pivot.144.49:                         ; preds = %concatenate.pivot.144.47
  br label %concat_index_from_operand_id440

concatenate.6.merge35:                            ; preds = %concat_index_from_operand_id440, %concat_index_from_operand_id339, %concat_index_from_operand_id238, %concat_index_from_operand_id137, %concat_index_from_operand_id036
  %310 = phi float [ %257, %concat_index_from_operand_id036 ], [ %269, %concat_index_from_operand_id137 ], [ %281, %concat_index_from_operand_id238 ], [ %293, %concat_index_from_operand_id339 ], [ %305, %concat_index_from_operand_id440 ]
  %311 = getelementptr inbounds float, ptr %arg5, i32 %linear_index3
  store float %310, ptr %311, align 4
  br label %fusion_5.in_bounds-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

define void @fusion_4(ptr noalias align 128 dereferenceable(8388608) %arg0, ptr noalias align 128 dereferenceable(419430400) %arg1, ptr noalias align 128 dereferenceable(6553600) %arg2) {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !19
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_13_constant_7 = load float, ptr @0, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_13_constant_7, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %5 = urem i32 %3, 32
  %6 = udiv i32 %3, 32
  %7 = mul i32 %4, 3
  %8 = add i32 %7, %6
  %9 = icmp ult i32 %8, 1638400
  br i1 %9, label %10, label %early_return

10:                                               ; preds = %reduce-group-0-true
  %thread_id.x = urem i32 %5, 32
  %thread_id.y = udiv i32 %5, 32
  %lane_id = urem i32 %5, 32
  %11 = udiv i32 %8, 1
  %12 = urem i32 %11, 1
  %13 = udiv i32 %8, 1
  %14 = urem i32 %13, 1638400
  %15 = udiv i32 %8, 1638400
  %16 = icmp eq i32 %14, 1638399
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
  br label %y_in_tile.loop_header, !llvm.loop !22

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result18 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result18, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer19)
  %22 = load float, ptr %return_buffer19, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result21 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result21, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane20, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane20, ptr %return_buffer22)
  %24 = load float, ptr %return_buffer22, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result24 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result24, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane23, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane23, ptr %return_buffer25)
  %26 = load float, ptr %return_buffer25, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result27 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result27, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane26, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane26, ptr %return_buffer28)
  %28 = load float, ptr %return_buffer28, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result30 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result30, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane29, align 4
  call void @region_1_8(ptr %current_output, ptr %result_from_other_lane29, ptr %return_buffer31)
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
  %45 = mul nuw nsw i32 %tile_origin.0, 104857600
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 64
  %49 = udiv i32 %46, 64
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 256
  %52 = urem i32 %51, 50
  %53 = udiv i32 %46, 12800
  %54 = mul nuw nsw i32 %48, 1
  %55 = add nuw nsw i32 0, %54
  %56 = mul nuw nsw i32 %50, 64
  %57 = add nuw nsw i32 %55, %56
  %58 = udiv i32 %57, 256
  %59 = mul nuw nsw i32 %53, 1
  %60 = add nuw nsw i32 0, %59
  %61 = udiv i32 %60, 8192
  %Arg_0.1 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %60, i32 %57
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !18
  %62 = mul nuw nsw i32 %48, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %50, 64
  %65 = add nuw nsw i32 %63, %64
  %66 = udiv i32 %65, 256
  %67 = mul nuw nsw i32 %52, 1
  %68 = add nuw nsw i32 0, %67
  %69 = mul nuw nsw i32 %53, 50
  %70 = add nuw nsw i32 %68, %69
  %71 = udiv i32 %70, 409600
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.24 = load float, ptr %Arg_1.2, align 4, !invariant.load !18
  %multiply.6 = fmul float %Arg_0.13, %Arg_1.24
  store float %multiply.6, ptr %reduction_input_address, align 4
  %72 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_8(ptr %72, ptr %reduction_input_address, ptr %return_buffer)
  %73 = load float, ptr %return_buffer, align 4
  store float %73, ptr %72, align 4
  br label %tile_loop.loop_header, !llvm.loop !24

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %74 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %75 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %75, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %76 = icmp eq i32 %tile_loop.indvar9, 0
  %77 = mul i32 %tile_loop.indvar9, 32
  %78 = add i32 %77, 0
  %x_loc11 = add i32 %78, %74
  %79 = add i32 %tile_origin.1, %y_in_tile.indvar
  %80 = add i32 %tile_origin.2, %x_loc11
  %81 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %81, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !26

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %82 = mul nuw nsw i32 %80, 1
  %83 = add nuw nsw i32 0, %82
  %84 = mul nuw nsw i32 %79, 64
  %85 = add nuw nsw i32 %83, %84
  %86 = mul nuw nsw i32 %tile_origin.0, 104857600
  %87 = add nuw nsw i32 %85, %86
  %88 = udiv i32 %87, 1
  %89 = urem i32 %88, 64
  %90 = udiv i32 %87, 64
  %91 = urem i32 %90, 4
  %92 = udiv i32 %87, 256
  %93 = urem i32 %92, 50
  %94 = udiv i32 %87, 12800
  %95 = mul nuw nsw i32 %89, 1
  %96 = add nuw nsw i32 0, %95
  %97 = mul nuw nsw i32 %91, 64
  %98 = add nuw nsw i32 %96, %97
  %99 = udiv i32 %98, 256
  %100 = mul nuw nsw i32 %94, 1
  %101 = add nuw nsw i32 0, %100
  %102 = udiv i32 %101, 8192
  %Arg_0.112 = getelementptr inbounds [8192 x [256 x float]], ptr %arg0, i32 0, i32 %101, i32 %98
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !18
  %103 = mul nuw nsw i32 %89, 1
  %104 = add nuw nsw i32 0, %103
  %105 = mul nuw nsw i32 %91, 64
  %106 = add nuw nsw i32 %104, %105
  %107 = udiv i32 %106, 256
  %108 = mul nuw nsw i32 %93, 1
  %109 = add nuw nsw i32 0, %108
  %110 = mul nuw nsw i32 %94, 50
  %111 = add nuw nsw i32 %109, %110
  %112 = udiv i32 %111, 409600
  %Arg_1.214 = getelementptr inbounds float, ptr %arg1, i32 %87
  %Arg_1.215 = load float, ptr %Arg_1.214, align 4, !invariant.load !18
  %multiply.616 = fmul float %Arg_0.113, %Arg_1.215
  store float %multiply.616, ptr %reduction_input_address, align 4
  %113 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_8(ptr %113, ptr %reduction_input_address, ptr %return_buffer17)
  %114 = load float, ptr %return_buffer17, align 4
  store float %114, ptr %113, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %115 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %31
  %116 = addrspacecast ptr addrspace(3) %115 to ptr
  %117 = load float, ptr %current_output, align 4
  store float %117, ptr %116, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %118 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache, i32 0, i32 %6, i32 0, i32 %lane_id
  %119 = addrspacecast ptr addrspace(3) %118 to ptr
  store float %region_0_13_constant_7, ptr %initial_value_addr, align 4
  %120 = icmp ult i32 %thread_id.x, 1
  %121 = select i1 %120, ptr %119, ptr %initial_value_addr
  %122 = icmp eq i32 %thread_id.x, 0
  br i1 %122, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %123 = mul i32 %thread_id.x, 1
  %124 = add i32 %tile_origin.1, %thread_id.y
  %125 = add i32 %tile_origin.2, %123
  %126 = add i32 %125, 0
  %127 = udiv i32 %124, 1
  %128 = urem i32 %127, 4
  %129 = udiv i32 %124, 4
  %130 = urem i32 %129, 50
  %131 = udiv i32 %124, 200
  %output_element_address = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg2, i32 0, i32 %131, i32 %128, i32 %130
  %output = load float, ptr %121, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #0

define internal void @region_1_8(ptr dereferenceable(4) %Arg_0.9.typed, ptr dereferenceable(4) %Arg_1.10.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %add.11.typed = alloca float, align 4
  %Arg_0.9 = load float, ptr %Arg_0.9.typed, align 4
  %Arg_1.10 = load float, ptr %Arg_1.10.typed, align 4
  %add.11 = fadd float %Arg_0.9, %Arg_1.10
  store float %add.11, ptr %add.11.typed, align 4
  %load_ret_value = load float, ptr %add.11.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.nvvm.shfl.sync.down.f32(i32, float, i32, i32) #2

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier0() #3

define void @fusion_7(ptr noalias align 128 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer29 = alloca float, align 4
  %result_from_other_lane27 = alloca float, align 4
  %return_buffer26 = alloca float, align 4
  %result_from_other_lane24 = alloca float, align 4
  %return_buffer23 = alloca float, align 4
  %result_from_other_lane21 = alloca float, align 4
  %return_buffer20 = alloca float, align 4
  %result_from_other_lane18 = alloca float, align 4
  %return_buffer17 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer15 = alloca float, align 4
  %tile_loop.invar_address7 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !19
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @1, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !27
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
  %tile_bound1 = select i1 %17, i32 50, i32 512
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

is_full_tile-after:                               ; preds = %tile_loop.loop_exit4, %tile_loop.loop_exit
  br label %y_in_tile.loop_header, !llvm.loop !28

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result16 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result16, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer17)
  %22 = load float, ptr %return_buffer17, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result19 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result19, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane18, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane18, ptr %return_buffer20)
  %24 = load float, ptr %return_buffer20, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result22 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result22, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane21, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane21, ptr %return_buffer23)
  %26 = load float, ptr %return_buffer23, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result25 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result25, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane24, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane24, ptr %return_buffer26)
  %28 = load float, ptr %return_buffer26, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result28 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result28, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane27, align 4
  call void @region_1_7(ptr %current_output, ptr %result_from_other_lane27, ptr %return_buffer29)
  %30 = load float, ptr %return_buffer29, align 4
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
  %43 = mul nuw nsw i32 %39, 50
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 1638400
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 50
  %49 = udiv i32 %46, 50
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 200
  %region_0_12_constant_2 = load float, ptr @2, align 4
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %46
  %Arg_0.13 = load float, ptr %Arg_0.1, align 4, !invariant.load !18
  %multiply.5 = fmul float %region_0_12_constant_2, %Arg_0.13
  store float %multiply.5, ptr %reduction_input_address, align 4
  %52 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %52, ptr %reduction_input_address, ptr %return_buffer)
  %53 = load float, ptr %return_buffer, align 4
  store float %53, ptr %52, align 4
  br label %tile_loop.loop_header, !llvm.loop !29

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %54 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address7, align 4
  br label %tile_loop.loop_header5

tile_loop.loop_header5:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar8 = load i32, ptr %tile_loop.invar_address7, align 4
  %55 = icmp uge i32 %tile_loop.indvar8, 16
  br i1 %55, label %tile_loop.loop_exit4, label %tile_loop.loop_body6

tile_loop.loop_body6:                             ; preds = %tile_loop.loop_header5
  %invar.inc9 = add nuw nsw i32 %tile_loop.indvar8, 1
  store i32 %invar.inc9, ptr %tile_loop.invar_address7, align 4
  %56 = icmp eq i32 %tile_loop.indvar8, 0
  %57 = mul i32 %tile_loop.indvar8, 32
  %58 = add i32 %57, 0
  %x_loc10 = add i32 %58, %54
  %59 = add i32 %tile_origin.1, %y_in_tile.indvar
  %60 = add i32 %tile_origin.2, %x_loc10
  %61 = icmp ult i32 %x_loc10, %tile_bound1
  br i1 %61, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body6
  br label %tile_loop.loop_header5, !llvm.loop !30

tile_loop.loop_exit4:                             ; preds = %tile_loop.loop_header5
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body6
  %62 = mul nuw nsw i32 %60, 1
  %63 = add nuw nsw i32 0, %62
  %64 = mul nuw nsw i32 %59, 50
  %65 = add nuw nsw i32 %63, %64
  %66 = mul nuw nsw i32 %tile_origin.0, 1638400
  %67 = add nuw nsw i32 %65, %66
  %68 = udiv i32 %67, 1
  %69 = urem i32 %68, 50
  %70 = udiv i32 %67, 50
  %71 = urem i32 %70, 4
  %72 = udiv i32 %67, 200
  %region_0_12_constant_211 = load float, ptr @2, align 4
  %Arg_0.112 = getelementptr inbounds float, ptr %arg0, i32 %67
  %Arg_0.113 = load float, ptr %Arg_0.112, align 4, !invariant.load !18
  %multiply.514 = fmul float %region_0_12_constant_211, %Arg_0.113
  store float %multiply.514, ptr %reduction_input_address, align 4
  %73 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_7(ptr %73, ptr %reduction_input_address, ptr %return_buffer15)
  %74 = load float, ptr %return_buffer15, align 4
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
  store float %region_0_12_constant_6, ptr %initial_value_addr, align 4
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
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr %arg1, i32 0, i32 %89, i32 %88
  %output = load float, ptr %81, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

define internal void @region_1_7(ptr dereferenceable(4) %Arg_0.8.typed, ptr dereferenceable(4) %Arg_1.9.typed, ptr dereferenceable(4) %output_arg) {
entry:
  %maximum.10.typed = alloca float, align 4
  %Arg_0.8 = load float, ptr %Arg_0.8.typed, align 4
  %Arg_1.9 = load float, ptr %Arg_1.9.typed, align 4
  %0 = fcmp oge float %Arg_0.8, %Arg_1.9
  %1 = fcmp une float %Arg_0.8, %Arg_0.8
  %2 = or i1 %0, %1
  %maximum.10 = select i1 %2, float %Arg_0.8, float %Arg_1.9
  store float %maximum.10, ptr %maximum.10.typed, align 4
  %load_ret_value = load float, ptr %maximum.10.typed, align 4
  store float %load_ret_value, ptr %output_arg, align 4
  ret void
}

define void @fusion_8(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(6553600) %arg1, ptr noalias align 128 dereferenceable(131072) %arg2) {
entry:
  %initial_value_addr = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
  %return_buffer30 = alloca float, align 4
  %result_from_other_lane28 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %result_from_other_lane22 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer19 = alloca float, align 4
  %tile_loop.invar_address8 = alloca i32, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !19
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %inter_warp_reduce-after, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_16_constant_10 = load float, ptr @3, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_16_constant_10, ptr %2, align 4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !20
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !27
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
  %tile_bound1 = select i1 %17, i32 50, i32 512
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
  br label %y_in_tile.loop_header, !llvm.loop !31

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %partial_reduction_result20 = load float, ptr %current_output, align 4
  %21 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 16, i32 31)
  store float %21, ptr %result_from_other_lane, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane, ptr %return_buffer21)
  %22 = load float, ptr %return_buffer21, align 4
  store float %22, ptr %current_output, align 4
  %partial_reduction_result23 = load float, ptr %current_output, align 4
  %23 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 8, i32 31)
  store float %23, ptr %result_from_other_lane22, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane22, ptr %return_buffer24)
  %24 = load float, ptr %return_buffer24, align 4
  store float %24, ptr %current_output, align 4
  %partial_reduction_result26 = load float, ptr %current_output, align 4
  %25 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 4, i32 31)
  store float %25, ptr %result_from_other_lane25, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane25, ptr %return_buffer27)
  %26 = load float, ptr %return_buffer27, align 4
  store float %26, ptr %current_output, align 4
  %partial_reduction_result29 = load float, ptr %current_output, align 4
  %27 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result29, i32 2, i32 31)
  store float %27, ptr %result_from_other_lane28, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane28, ptr %return_buffer30)
  %28 = load float, ptr %return_buffer30, align 4
  store float %28, ptr %current_output, align 4
  %partial_reduction_result32 = load float, ptr %current_output, align 4
  %29 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 1, i32 31)
  store float %29, ptr %result_from_other_lane31, align 4
  call void @region_1_11(ptr %current_output, ptr %result_from_other_lane31, ptr %return_buffer33)
  %30 = load float, ptr %return_buffer33, align 4
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
  %43 = mul nuw nsw i32 %39, 50
  %44 = add nuw nsw i32 %42, %43
  %45 = mul nuw nsw i32 %tile_origin.0, 1638400
  %46 = add nuw nsw i32 %44, %45
  %47 = udiv i32 %46, 1
  %48 = urem i32 %47, 50
  %49 = udiv i32 %46, 50
  %50 = urem i32 %49, 4
  %51 = udiv i32 %46, 200
  %region_0_16_constant_3 = load float, ptr @4, align 4
  %Arg_1.2 = getelementptr inbounds float, ptr %arg1, i32 %46
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !18
  %multiply.6 = fmul float %region_0_16_constant_3, %Arg_1.23
  %52 = udiv i32 %46, 50
  %Arg_0.1 = getelementptr inbounds float, ptr %arg0, i32 %52
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !18
  %subtract.8 = fsub float %multiply.6, %Arg_0.14
  %53 = call float @__nv_expf(float %subtract.8)
  store float %53, ptr %reduction_input_address, align 4
  %54 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11(ptr %54, ptr %reduction_input_address, ptr %return_buffer)
  %55 = load float, ptr %return_buffer, align 4
  store float %55, ptr %54, align 4
  br label %tile_loop.loop_header, !llvm.loop !32

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %is_full_tile-after

is_full_tile-false:                               ; preds = %y_in_tile.loop_body
  %56 = mul i32 %thread_id.x, 1
  store i32 0, ptr %tile_loop.invar_address8, align 4
  br label %tile_loop.loop_header6

tile_loop.loop_header6:                           ; preds = %x_in_tile-after, %is_full_tile-false
  %tile_loop.indvar9 = load i32, ptr %tile_loop.invar_address8, align 4
  %57 = icmp uge i32 %tile_loop.indvar9, 16
  br i1 %57, label %tile_loop.loop_exit5, label %tile_loop.loop_body7

tile_loop.loop_body7:                             ; preds = %tile_loop.loop_header6
  %invar.inc10 = add nuw nsw i32 %tile_loop.indvar9, 1
  store i32 %invar.inc10, ptr %tile_loop.invar_address8, align 4
  %58 = icmp eq i32 %tile_loop.indvar9, 0
  %59 = mul i32 %tile_loop.indvar9, 32
  %60 = add i32 %59, 0
  %x_loc11 = add i32 %60, %56
  %61 = add i32 %tile_origin.1, %y_in_tile.indvar
  %62 = add i32 %tile_origin.2, %x_loc11
  %63 = icmp ult i32 %x_loc11, %tile_bound1
  br i1 %63, label %x_in_tile-true, label %x_in_tile-after

x_in_tile-after:                                  ; preds = %x_in_tile-true, %tile_loop.loop_body7
  br label %tile_loop.loop_header6, !llvm.loop !33

tile_loop.loop_exit5:                             ; preds = %tile_loop.loop_header6
  br label %is_full_tile-after

x_in_tile-true:                                   ; preds = %tile_loop.loop_body7
  %64 = mul nuw nsw i32 %62, 1
  %65 = add nuw nsw i32 0, %64
  %66 = mul nuw nsw i32 %61, 50
  %67 = add nuw nsw i32 %65, %66
  %68 = mul nuw nsw i32 %tile_origin.0, 1638400
  %69 = add nuw nsw i32 %67, %68
  %70 = udiv i32 %69, 1
  %71 = urem i32 %70, 50
  %72 = udiv i32 %69, 50
  %73 = urem i32 %72, 4
  %74 = udiv i32 %69, 200
  %region_0_16_constant_312 = load float, ptr @4, align 4
  %Arg_1.213 = getelementptr inbounds float, ptr %arg1, i32 %69
  %Arg_1.214 = load float, ptr %Arg_1.213, align 4, !invariant.load !18
  %multiply.615 = fmul float %region_0_16_constant_312, %Arg_1.214
  %75 = udiv i32 %69, 50
  %Arg_0.116 = getelementptr inbounds float, ptr %arg0, i32 %75
  %Arg_0.117 = load float, ptr %Arg_0.116, align 4, !invariant.load !18
  %subtract.818 = fsub float %multiply.615, %Arg_0.117
  %76 = call float @__nv_expf(float %subtract.818)
  store float %76, ptr %reduction_input_address, align 4
  %77 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  call void @region_1_11(ptr %77, ptr %reduction_input_address, ptr %return_buffer19)
  %78 = load float, ptr %return_buffer19, align 4
  store float %78, ptr %77, align 4
  br label %x_in_tile-after

intra_warp_reduce_write-true:                     ; preds = %y_in_tile.loop_exit
  %79 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %6, i32 0, i32 %31
  %80 = addrspacecast ptr addrspace(3) %79 to ptr
  %81 = load float, ptr %current_output, align 4
  store float %81, ptr %80, align 4
  br label %intra_warp_reduce_write-after

inter_warp_reduce-true:                           ; preds = %intra_warp_reduce_write-after
  %82 = getelementptr inbounds [3 x [1 x [1 x float]]], ptr addrspace(3) @shared_cache2, i32 0, i32 %6, i32 0, i32 %lane_id
  %83 = addrspacecast ptr addrspace(3) %82 to ptr
  store float %region_0_16_constant_10, ptr %initial_value_addr, align 4
  %84 = icmp ult i32 %thread_id.x, 1
  %85 = select i1 %84, ptr %83, ptr %initial_value_addr
  %86 = icmp eq i32 %thread_id.x, 0
  br i1 %86, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %inter_warp_reduce-true
  br label %inter_warp_reduce-after

reduction_write_output-true:                      ; preds = %inter_warp_reduce-true
  %87 = mul i32 %thread_id.x, 1
  %88 = add i32 %tile_origin.1, %thread_id.y
  %89 = add i32 %tile_origin.2, %87
  %90 = add i32 %89, 0
  %91 = udiv i32 %88, 1
  %92 = urem i32 %91, 4
  %93 = udiv i32 %88, 4
  %output_element_address = getelementptr inbounds [8192 x [4 x float]], ptr %arg2, i32 0, i32 %93, i32 %92
  %output = load float, ptr %85, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after
}

; Function Attrs: nounwind memory(none)
declare float @__nv_expf(float) #4

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

define void @fusion_1(ptr noalias align 128 dereferenceable(131072) %arg0, ptr noalias align 128 dereferenceable(131072) %arg1, ptr noalias align 128 dereferenceable(6553600) %arg2, ptr noalias align 128 dereferenceable(6553600) %arg3) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 409600
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 50
  %5 = udiv i32 %linear_index_base, 50
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 50
  %10 = udiv i32 %linear_index1, 50
  %11 = urem i32 %10, 4
  %12 = udiv i32 %linear_index1, 200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 50
  %15 = udiv i32 %linear_index2, 50
  %16 = urem i32 %15, 4
  %17 = udiv i32 %linear_index2, 200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 50
  %20 = udiv i32 %linear_index3, 50
  %21 = urem i32 %20, 4
  %22 = udiv i32 %linear_index3, 200
  %23 = icmp ult i32 %linear_index_base, 1638400
  br i1 %23, label %fusion_1.in_bounds-true, label %fusion_1.in_bounds-after

fusion_1.in_bounds-after:                         ; preds = %fusion_1.in_bounds-true, %entry
  ret void

fusion_1.in_bounds-true:                          ; preds = %entry
  %region_0_13_constant_4 = load float, ptr @5, align 4
  %24 = getelementptr inbounds float, ptr %arg2, i32 %linear_index_base
  %25 = load float, ptr %24, align 4, !invariant.load !18
  %multiply.7 = fmul float %region_0_13_constant_4, %25
  %26 = udiv i32 %linear_index_base, 50
  %27 = getelementptr inbounds float, ptr %arg1, i32 %26
  %28 = load float, ptr %27, align 4, !invariant.load !18
  %subtract.9 = fsub float %multiply.7, %28
  %29 = call float @__nv_expf(float %subtract.9)
  %30 = udiv i32 %linear_index_base, 50
  %31 = getelementptr inbounds float, ptr %arg0, i32 %30
  %32 = load float, ptr %31, align 4, !invariant.load !18
  %divide.12 = fdiv float %29, %32
  %33 = getelementptr inbounds float, ptr %arg3, i32 %linear_index_base
  store float %divide.12, ptr %33, align 4
  %region_0_13_constant_41 = load float, ptr @5, align 4
  %34 = getelementptr inbounds float, ptr %arg2, i32 %linear_index1
  %35 = load float, ptr %34, align 4, !invariant.load !18
  %multiply.72 = fmul float %region_0_13_constant_41, %35
  %36 = udiv i32 %linear_index1, 50
  %37 = getelementptr inbounds float, ptr %arg1, i32 %36
  %38 = load float, ptr %37, align 4, !invariant.load !18
  %subtract.93 = fsub float %multiply.72, %38
  %39 = call float @__nv_expf(float %subtract.93)
  %40 = udiv i32 %linear_index1, 50
  %41 = getelementptr inbounds float, ptr %arg0, i32 %40
  %42 = load float, ptr %41, align 4, !invariant.load !18
  %divide.124 = fdiv float %39, %42
  %43 = getelementptr inbounds float, ptr %arg3, i32 %linear_index1
  store float %divide.124, ptr %43, align 4
  %region_0_13_constant_45 = load float, ptr @5, align 4
  %44 = getelementptr inbounds float, ptr %arg2, i32 %linear_index2
  %45 = load float, ptr %44, align 4, !invariant.load !18
  %multiply.76 = fmul float %region_0_13_constant_45, %45
  %46 = udiv i32 %linear_index2, 50
  %47 = getelementptr inbounds float, ptr %arg1, i32 %46
  %48 = load float, ptr %47, align 4, !invariant.load !18
  %subtract.97 = fsub float %multiply.76, %48
  %49 = call float @__nv_expf(float %subtract.97)
  %50 = udiv i32 %linear_index2, 50
  %51 = getelementptr inbounds float, ptr %arg0, i32 %50
  %52 = load float, ptr %51, align 4, !invariant.load !18
  %divide.128 = fdiv float %49, %52
  %53 = getelementptr inbounds float, ptr %arg3, i32 %linear_index2
  store float %divide.128, ptr %53, align 4
  %region_0_13_constant_49 = load float, ptr @5, align 4
  %54 = getelementptr inbounds float, ptr %arg2, i32 %linear_index3
  %55 = load float, ptr %54, align 4, !invariant.load !18
  %multiply.710 = fmul float %region_0_13_constant_49, %55
  %56 = udiv i32 %linear_index3, 50
  %57 = getelementptr inbounds float, ptr %arg1, i32 %56
  %58 = load float, ptr %57, align 4, !invariant.load !18
  %subtract.911 = fsub float %multiply.710, %58
  %59 = call float @__nv_expf(float %subtract.911)
  %60 = udiv i32 %linear_index3, 50
  %61 = getelementptr inbounds float, ptr %arg0, i32 %60
  %62 = load float, ptr %61, align 4, !invariant.load !18
  %divide.1212 = fdiv float %59, %62
  %63 = getelementptr inbounds float, ptr %arg3, i32 %linear_index3
  store float %divide.1212, ptr %63, align 4
  br label %fusion_1.in_bounds-after
}

define void @transpose(ptr noalias align 128 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(6553600) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 409600
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 4
  %5 = udiv i32 %linear_index_base, 4
  %6 = urem i32 %5, 50
  %7 = udiv i32 %linear_index_base, 200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %8 = udiv i32 %linear_index1, 1
  %9 = urem i32 %8, 4
  %10 = udiv i32 %linear_index1, 4
  %11 = urem i32 %10, 50
  %12 = udiv i32 %linear_index1, 200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %13 = udiv i32 %linear_index2, 1
  %14 = urem i32 %13, 4
  %15 = udiv i32 %linear_index2, 4
  %16 = urem i32 %15, 50
  %17 = udiv i32 %linear_index2, 200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %18 = udiv i32 %linear_index3, 1
  %19 = urem i32 %18, 4
  %20 = udiv i32 %linear_index3, 4
  %21 = urem i32 %20, 50
  %22 = udiv i32 %linear_index3, 200
  %23 = icmp ult i32 %linear_index_base, 1638400
  br i1 %23, label %transpose.in_bounds-true, label %transpose.in_bounds-after

transpose.in_bounds-after:                        ; preds = %transpose.in_bounds-true, %entry
  ret void

transpose.in_bounds-true:                         ; preds = %entry
  %24 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %7, i32 %4, i32 %6
  %25 = load float, ptr %24, align 4, !invariant.load !18
  %26 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %25, ptr %26, align 4
  %27 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %12, i32 %9, i32 %11
  %28 = load float, ptr %27, align 4, !invariant.load !18
  %29 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %28, ptr %29, align 4
  %30 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %17, i32 %14, i32 %16
  %31 = load float, ptr %30, align 4, !invariant.load !18
  %32 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %31, ptr %32, align 4
  %33 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %22, i32 %19, i32 %21
  %34 = load float, ptr %33, align 4, !invariant.load !18
  %35 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %34, ptr %35, align 4
  br label %transpose.in_bounds-after
}

define void @fusion(ptr noalias align 128 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(419430400) %arg1, ptr noalias align 128 dereferenceable(8388608) %arg2) {
entry:
  %return_buffer45 = alloca float, align 4
  %result_from_other_lane43 = alloca float, align 4
  %return_buffer42 = alloca float, align 4
  %result_from_other_lane40 = alloca float, align 4
  %return_buffer39 = alloca float, align 4
  %result_from_other_lane37 = alloca float, align 4
  %return_buffer36 = alloca float, align 4
  %result_from_other_lane34 = alloca float, align 4
  %return_buffer33 = alloca float, align 4
  %result_from_other_lane31 = alloca float, align 4
  %return_buffer27 = alloca float, align 4
  %result_from_other_lane25 = alloca float, align 4
  %return_buffer24 = alloca float, align 4
  %result_from_other_lane22 = alloca float, align 4
  %return_buffer21 = alloca float, align 4
  %result_from_other_lane19 = alloca float, align 4
  %return_buffer18 = alloca float, align 4
  %result_from_other_lane16 = alloca float, align 4
  %return_buffer15 = alloca float, align 4
  %result_from_other_lane = alloca float, align 4
  %return_buffer13 = alloca float, align 4
  %return_buffer = alloca float, align 4
  %tile_loop.invar_address = alloca i32, align 4
  %y_in_tile.invar_address = alloca i32, align 4
  %partial_reduction_result = alloca float, i32 2, align 4
  %reduction_input_address = alloca float, align 4
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !range !19
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %reduce-group-0-true, label %reduce-group-0-after

reduce-group-0-after:                             ; preds = %reduction_write_output-after47, %entry
  ret void

reduce-group-0-true:                              ; preds = %entry
  %region_0_12_constant_6 = load float, ptr @6, align 4
  %2 = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  store float %region_0_12_constant_6, ptr %2, align 4
  %3 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  store float %region_0_12_constant_6, ptr %3, align 4
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !35
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !36
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
  %tile_bound = select i1 %17, i32 50, i32 4096
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

tile_loop.loop_header:                            ; preds = %x_in_tile-after7, %y_in_tile.loop_body
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
  %x_loc5 = add i32 %30, %21
  %31 = add i32 %tile_origin.1, %y_in_tile.indvar
  %32 = add i32 %tile_origin.2, %x_loc5
  %33 = icmp ult i32 %x_loc5, %tile_bound1
  br i1 %33, label %x_in_tile-true6, label %x_in_tile-after7

x_in_tile-after7:                                 ; preds = %x_in_tile-true6, %x_in_tile-after
  br label %tile_loop.loop_header, !llvm.loop !37

tile_loop.loop_exit:                              ; preds = %tile_loop.loop_header
  br label %y_in_tile.loop_header, !llvm.loop !38

y_in_tile.loop_exit:                              ; preds = %y_in_tile.loop_header
  %shmem_output_address = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 0, i32 %thread_id.x, i32 %thread_id.y
  %34 = addrspacecast ptr addrspace(3) %shmem_output_address to ptr
  %current_output = getelementptr inbounds float, ptr %partial_reduction_result, i32 0
  %35 = load float, ptr %current_output, align 4
  store float %35, ptr %34, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 0, i32 %thread_id.y, i32 %thread_id.x
  %36 = addrspacecast ptr addrspace(3) %shmem_transposed_addr to ptr
  %partial_reduction_result14 = load float, ptr %36, align 4
  %37 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result14, i32 16, i32 31)
  store float %37, ptr %result_from_other_lane, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane, ptr %return_buffer15)
  %38 = load float, ptr %return_buffer15, align 4
  store float %38, ptr %36, align 4
  %partial_reduction_result17 = load float, ptr %36, align 4
  %39 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result17, i32 8, i32 31)
  store float %39, ptr %result_from_other_lane16, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane16, ptr %return_buffer18)
  %40 = load float, ptr %return_buffer18, align 4
  store float %40, ptr %36, align 4
  %partial_reduction_result20 = load float, ptr %36, align 4
  %41 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result20, i32 4, i32 31)
  store float %41, ptr %result_from_other_lane19, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane19, ptr %return_buffer21)
  %42 = load float, ptr %return_buffer21, align 4
  store float %42, ptr %36, align 4
  %partial_reduction_result23 = load float, ptr %36, align 4
  %43 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result23, i32 2, i32 31)
  store float %43, ptr %result_from_other_lane22, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane22, ptr %return_buffer24)
  %44 = load float, ptr %return_buffer24, align 4
  store float %44, ptr %36, align 4
  %partial_reduction_result26 = load float, ptr %36, align 4
  %45 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result26, i32 1, i32 31)
  store float %45, ptr %result_from_other_lane25, align 4
  call void @region_1_7__1(ptr %36, ptr %result_from_other_lane25, ptr %return_buffer27)
  %46 = load float, ptr %return_buffer27, align 4
  store float %46, ptr %36, align 4
  %47 = icmp ult i32 %thread_id.x, %tile_bound
  %48 = mul i32 %thread_id.y, 2
  %49 = icmp ult i32 %48, %tile_bound1
  %50 = and i1 %49, %47
  %51 = icmp eq i32 %lane_id, 0
  %52 = and i1 %50, %51
  br i1 %52, label %reduction_write_output-true, label %reduction_write_output-after

reduction_write_output-after:                     ; preds = %reduction_write_output-true, %y_in_tile.loop_exit
  %shmem_output_address28 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 1, i32 %thread_id.x, i32 %thread_id.y
  %53 = addrspacecast ptr addrspace(3) %shmem_output_address28 to ptr
  %current_output29 = getelementptr inbounds float, ptr %partial_reduction_result, i32 1
  %54 = load float, ptr %current_output29, align 4
  store float %54, ptr %53, align 4
  call void @llvm.nvvm.barrier0()
  %shmem_transposed_addr30 = getelementptr inbounds [1 x [2 x [32 x [33 x float]]]], ptr addrspace(3) @shared_cache3, i32 0, i32 %7, i32 1, i32 %thread_id.y, i32 %thread_id.x
  %55 = addrspacecast ptr addrspace(3) %shmem_transposed_addr30 to ptr
  %partial_reduction_result32 = load float, ptr %55, align 4
  %56 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result32, i32 16, i32 31)
  store float %56, ptr %result_from_other_lane31, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane31, ptr %return_buffer33)
  %57 = load float, ptr %return_buffer33, align 4
  store float %57, ptr %55, align 4
  %partial_reduction_result35 = load float, ptr %55, align 4
  %58 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result35, i32 8, i32 31)
  store float %58, ptr %result_from_other_lane34, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane34, ptr %return_buffer36)
  %59 = load float, ptr %return_buffer36, align 4
  store float %59, ptr %55, align 4
  %partial_reduction_result38 = load float, ptr %55, align 4
  %60 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result38, i32 4, i32 31)
  store float %60, ptr %result_from_other_lane37, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane37, ptr %return_buffer39)
  %61 = load float, ptr %return_buffer39, align 4
  store float %61, ptr %55, align 4
  %partial_reduction_result41 = load float, ptr %55, align 4
  %62 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result41, i32 2, i32 31)
  store float %62, ptr %result_from_other_lane40, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane40, ptr %return_buffer42)
  %63 = load float, ptr %return_buffer42, align 4
  store float %63, ptr %55, align 4
  %partial_reduction_result44 = load float, ptr %55, align 4
  %64 = call float @llvm.nvvm.shfl.sync.down.f32(i32 -1, float %partial_reduction_result44, i32 1, i32 31)
  store float %64, ptr %result_from_other_lane43, align 4
  call void @region_1_7__1(ptr %55, ptr %result_from_other_lane43, ptr %return_buffer45)
  %65 = load float, ptr %return_buffer45, align 4
  store float %65, ptr %55, align 4
  %66 = icmp ult i32 %thread_id.x, %tile_bound
  %67 = mul i32 %thread_id.y, 2
  %68 = icmp ult i32 %67, %tile_bound1
  %69 = and i1 %68, %66
  %70 = icmp eq i32 %lane_id, 0
  %71 = and i1 %69, %70
  br i1 %71, label %reduction_write_output-true46, label %reduction_write_output-after47

reduction_write_output-after47:                   ; preds = %reduction_write_output-true46, %reduction_write_output-after
  br label %reduce-group-0-after

early_return:                                     ; preds = %reduce-group-0-true
  ret void

x_in_tile-true:                                   ; preds = %tile_loop.loop_body
  %72 = mul nuw nsw i32 %27, 1
  %73 = add nuw nsw i32 0, %72
  %74 = mul nuw nsw i32 %26, 256
  %75 = add nuw nsw i32 %73, %74
  %76 = mul nuw nsw i32 %tile_origin.0, 12800
  %77 = add nuw nsw i32 %75, %76
  %78 = udiv i32 %77, 1
  %79 = urem i32 %78, 64
  %80 = udiv i32 %77, 64
  %81 = urem i32 %80, 4
  %82 = udiv i32 %77, 256
  %83 = urem i32 %82, 50
  %84 = udiv i32 %77, 12800
  %85 = mul i32 %thread_id.x, 2
  %86 = sub i32 %x_loc, %85
  %87 = mul nuw nsw i32 %79, 1
  %88 = add nuw nsw i32 0, %87
  %89 = mul nuw nsw i32 %81, 64
  %90 = add nuw nsw i32 %88, %89
  %91 = udiv i32 %90, 256
  %92 = mul nuw nsw i32 %83, 1
  %93 = add nuw nsw i32 0, %92
  %94 = mul nuw nsw i32 %84, 50
  %95 = add nuw nsw i32 %93, %94
  %96 = udiv i32 %95, 409600
  %Arg_1.2 = getelementptr inbounds [409600 x [256 x float]], ptr %arg1, i32 0, i32 %95, i32 %90
  %Arg_1.23 = load float, ptr %Arg_1.2, align 4, !invariant.load !18
  %Arg_0.1 = getelementptr inbounds [8192 x [50 x [4 x float]]], ptr %arg0, i32 0, i32 %84, i32 %83, i32 %81
  %Arg_0.14 = load float, ptr %Arg_0.1, align 4, !invariant.load !18
  %multiply.5 = fmul float %Arg_1.23, %Arg_0.14
  store float %multiply.5, ptr %reduction_input_address, align 4
  %97 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %86
  call void @region_1_7__1(ptr %97, ptr %reduction_input_address, ptr %return_buffer)
  %98 = load float, ptr %return_buffer, align 4
  store float %98, ptr %97, align 4
  br label %x_in_tile-after

x_in_tile-true6:                                  ; preds = %x_in_tile-after
  %99 = mul nuw nsw i32 %32, 1
  %100 = add nuw nsw i32 0, %99
  %101 = mul nuw nsw i32 %31, 256
  %102 = add nuw nsw i32 %100, %101
  %103 = mul nuw nsw i32 %tile_origin.0, 12800
  %104 = add nuw nsw i32 %102, %103
  %105 = udiv i32 %104, 1
  %106 = urem i32 %105, 64
  %107 = udiv i32 %104, 64
  %108 = urem i32 %107, 4
  %109 = udiv i32 %104, 256
  %110 = urem i32 %109, 50
  %111 = udiv i32 %104, 12800
  %112 = mul i32 %thread_id.x, 2
  %113 = sub i32 %x_loc5, %112
  %114 = mul nuw nsw i32 %106, 1
  %115 = add nuw nsw i32 0, %114
  %116 = mul nuw nsw i32 %108, 64
  %117 = add nuw nsw i32 %115, %116
  %118 = udiv i32 %117, 256
  %119 = mul nuw nsw i32 %110, 1
  %120 = add nuw nsw i32 0, %119
  %121 = mul nuw nsw i32 %111, 50
  %122 = add nuw nsw i32 %120, %121
  %123 = udiv i32 %122, 409600
  %Arg_1.28 = getelementptr inbounds [409600 x [256 x float]], ptr %arg1, i32 0, i32 %122, i32 %117
  %Arg_1.29 = load float, ptr %Arg_1.28, align 4, !invariant.load !18
  %Arg_0.110 = getelementptr inbounds [8192 x [50 x [4 x float]]], ptr %arg0, i32 0, i32 %111, i32 %110, i32 %108
  %Arg_0.111 = load float, ptr %Arg_0.110, align 4, !invariant.load !18
  %multiply.512 = fmul float %Arg_1.29, %Arg_0.111
  store float %multiply.512, ptr %reduction_input_address, align 4
  %124 = getelementptr inbounds float, ptr %partial_reduction_result, i32 %113
  call void @region_1_7__1(ptr %124, ptr %reduction_input_address, ptr %return_buffer13)
  %125 = load float, ptr %return_buffer13, align 4
  store float %125, ptr %124, align 4
  br label %x_in_tile-after7

reduction_write_output-true:                      ; preds = %y_in_tile.loop_exit
  %126 = mul i32 %thread_id.y, 2
  %127 = add i32 %tile_origin.1, %thread_id.x
  %128 = add i32 %tile_origin.2, %126
  %129 = add i32 %128, 0
  %130 = mul i32 %tile_origin.0, 256
  %131 = add i32 %130, %129
  %132 = udiv i32 %131, 1
  %133 = urem i32 %132, 64
  %134 = udiv i32 %131, 64
  %135 = urem i32 %134, 4
  %136 = udiv i32 %131, 256
  %output_element_address = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg2, i32 0, i32 %136, i32 %135, i32 %133
  %output = load float, ptr %36, align 4
  store float %output, ptr %output_element_address, align 4
  br label %reduction_write_output-after

reduction_write_output-true46:                    ; preds = %reduction_write_output-after
  %137 = mul i32 %thread_id.y, 2
  %138 = add i32 %tile_origin.1, %thread_id.x
  %139 = add i32 %tile_origin.2, %137
  %140 = add i32 %139, 1
  %141 = mul i32 %tile_origin.0, 256
  %142 = add i32 %141, %140
  %143 = udiv i32 %142, 1
  %144 = urem i32 %143, 64
  %145 = udiv i32 %142, 64
  %146 = urem i32 %145, 4
  %147 = udiv i32 %142, 256
  %output_element_address48 = getelementptr inbounds [8192 x [4 x [64 x float]]], ptr %arg2, i32 0, i32 %147, i32 %146, i32 %144
  %output49 = load float, ptr %55, align 4
  store float %output49, ptr %output_element_address48, align 4
  br label %reduction_write_output-after47
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

define void @fusion_6(ptr noalias align 128 dereferenceable(6553600) %arg0, ptr noalias align 128 dereferenceable(6553600) %arg1) {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !34
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !17
  %2 = mul nuw nsw i32 %0, 256
  %linear_index = add nuw nsw i32 %2, %1
  %linear_index_in_range = icmp ult i32 %linear_index, 409600
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index_base = mul nuw nsw i32 %linear_index, 4
  %3 = udiv i32 %linear_index_base, 1
  %4 = urem i32 %3, 1
  %5 = udiv i32 %linear_index_base, 1
  %6 = urem i32 %5, 4
  %7 = udiv i32 %linear_index_base, 4
  %8 = urem i32 %7, 50
  %9 = udiv i32 %linear_index_base, 200
  %linear_index1 = add nuw nsw i32 %linear_index_base, 1
  %10 = udiv i32 %linear_index1, 1
  %11 = urem i32 %10, 1
  %12 = udiv i32 %linear_index1, 1
  %13 = urem i32 %12, 4
  %14 = udiv i32 %linear_index1, 4
  %15 = urem i32 %14, 50
  %16 = udiv i32 %linear_index1, 200
  %linear_index2 = add nuw nsw i32 %linear_index_base, 2
  %17 = udiv i32 %linear_index2, 1
  %18 = urem i32 %17, 1
  %19 = udiv i32 %linear_index2, 1
  %20 = urem i32 %19, 4
  %21 = udiv i32 %linear_index2, 4
  %22 = urem i32 %21, 50
  %23 = udiv i32 %linear_index2, 200
  %linear_index3 = add nuw nsw i32 %linear_index_base, 3
  %24 = udiv i32 %linear_index3, 1
  %25 = urem i32 %24, 1
  %26 = udiv i32 %linear_index3, 1
  %27 = urem i32 %26, 4
  %28 = udiv i32 %linear_index3, 4
  %29 = urem i32 %28, 50
  %30 = udiv i32 %linear_index3, 200
  %31 = icmp ult i32 %linear_index_base, 1638400
  br i1 %31, label %fusion_6.in_bounds-true, label %fusion_6.in_bounds-after

fusion_6.in_bounds-after:                         ; preds = %fusion_6.in_bounds-true, %entry
  ret void

fusion_6.in_bounds-true:                          ; preds = %entry
  %32 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %9, i32 %6, i32 %8
  %33 = load float, ptr %32, align 4, !invariant.load !18
  %34 = getelementptr inbounds float, ptr %arg1, i32 %linear_index_base
  store float %33, ptr %34, align 4
  %35 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %16, i32 %13, i32 %15
  %36 = load float, ptr %35, align 4, !invariant.load !18
  %37 = getelementptr inbounds float, ptr %arg1, i32 %linear_index1
  store float %36, ptr %37, align 4
  %38 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %23, i32 %20, i32 %22
  %39 = load float, ptr %38, align 4, !invariant.load !18
  %40 = getelementptr inbounds float, ptr %arg1, i32 %linear_index2
  store float %39, ptr %40, align 4
  %41 = getelementptr inbounds [8192 x [4 x [50 x float]]], ptr %arg0, i32 0, i32 %30, i32 %27, i32 %29
  %42 = load float, ptr %41, align 4, !invariant.load !18
  %43 = getelementptr inbounds float, ptr %arg1, i32 %linear_index3
  store float %42, ptr %43, align 4
  br label %fusion_6.in_bounds-after
}

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #3 = { convergent nocallback nounwind }
attributes #4 = { nounwind memory(none) }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15}

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
!16 = !{i32 0, i32 60800}
!17 = !{i32 0, i32 256}
!18 = !{}
!19 = !{i32 0, i32 1}
!20 = !{i32 0, i32 96}
!21 = !{i32 0, i32 546134}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.vectorize.enable", i1 false}
!24 = distinct !{!24, !23, !25}
!25 = !{!"llvm.loop.unroll.full"}
!26 = distinct !{!26, !23, !25}
!27 = !{i32 0, i32 10923}
!28 = distinct !{!28, !23}
!29 = distinct !{!29, !23, !25}
!30 = distinct !{!30, !23, !25}
!31 = distinct !{!31, !23}
!32 = distinct !{!32, !23, !25}
!33 = distinct !{!33, !23, !25}
!34 = !{i32 0, i32 1600}
!35 = !{i32 0, i32 1024}
!36 = !{i32 0, i32 32768}
!37 = distinct !{!37, !23, !25}
!38 = distinct !{!38, !23}
