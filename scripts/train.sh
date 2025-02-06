#!/bin/bash


echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 1/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 1 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 1 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 2/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 2 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 2 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 3/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 3 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 3 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 4/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 4 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 4 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 5/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 5 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 5 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 6/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 6 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 6 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 7/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 7 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 7 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 8/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 8 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 8 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 9/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 9 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 9 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 10/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 10 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 10 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 11/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 11 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 11 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 12/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 12 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 12 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 13/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 13 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 13 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 14/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 14 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 14 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 15/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 15 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 15 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 16/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 16 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 16 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 17/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 17 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 17 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 18/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 18 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 18 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 19/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 19 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 19 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 20/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 20 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 20 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 21/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 21 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 21 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 22/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 22 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 22 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 23/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 23 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 23 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 24/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 24 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 24 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 25/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 25 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 25 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 26/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 26 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 26 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 27/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 27 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 27 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 28/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 28 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 28 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 29/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 29 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 29 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 30/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 30 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 30 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 31/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 31 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 31 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 32/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 32 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 32 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 33/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 33 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 33 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 34/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 34 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 34 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 35/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 35 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 35 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 36/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 36 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 36 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 37/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale100_Split91_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale100_Split91_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 37 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 37 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 38/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale1_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs16_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale1_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs16_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 38 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 38 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 39/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale2_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs17_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale2_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs17_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 39 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 39 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 40/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs20_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs20_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 40 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 40 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 41/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 41 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 41 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 42/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 42 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 42 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 43/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/HE_Scale4_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs14_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/HE_Scale4_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs14_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 43 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 43 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 44/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale0.25_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs14_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale0.25_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs14_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 44 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 44 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 45/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale0.5_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale0.5_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 45 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 45 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 46/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 46 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 46 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 47/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 47 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 47 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 48/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 48 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 48 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 49/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 49 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 49 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 50/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 50 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 50 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 51/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 51 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 51 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 52/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 52 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 52 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 53/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 53 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 53 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 54/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 54 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 54 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 55/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 55 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 55 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 56/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 56 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 56 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 57/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 57 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 57 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 58/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 58 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 58 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 59/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 59 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 59 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 60/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 60 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 60 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 61/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 61 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 61 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 62/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 62 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 62 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 63/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 63 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 63 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 64/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 64 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 64 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 65/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 65 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 65 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 66/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 66 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 66 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 67/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 67 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 67 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 68/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 68 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 68 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 69/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 69 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 69 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 70/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 70 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 70 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 71/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 71 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 71 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 72/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 72 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 72 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 73/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 73 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 73 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 74/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 74 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 74 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 75/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 75 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 75 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 76/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 76 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 76 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 77/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 77 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 77 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 78/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 78 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 78 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 79/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 79 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 79 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 80/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 80 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 80 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 81/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 81 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 81 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 82/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs8_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs8_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 82 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 82 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 83/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 83 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 83 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 84/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs20_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs20_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 84 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 84 task failed." >> logs/process.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') Start training task 85/85." | tee -a logs/process.log >> logs/output.log
echo "llamafactory-cli train config/MC_Scale1_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml" | tee -a logs/process.log >> logs/output.log
CUDA_VISIBLE_DEVICES=0 llamafactory-cli train config/MC_Scale1_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml > logs/output.log 2>&1 &
pid=$!

# Wait for task 85 to complete
wait $pid
if [ $? -ne 0 ]; then
     echo "The 85 task failed." >> logs/process.log
fi
