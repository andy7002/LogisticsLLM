#!/bin/bash

echo "$(date '+%Y-%m-%d %H:%M:%S') The 1/85 task starting: HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 1 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 2/85 task starting: HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 2 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 3/85 task starting: HE_Scale100_Split82_DistOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 3 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 4/85 task starting: HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 4 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 5/85 task starting: HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 5 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 6/85 task starting: HE_Scale100_Split82_DistOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 6 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 7/85 task starting: HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 7 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 8/85 task starting: HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 8 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 9/85 task starting: HE_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 9 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 10/85 task starting: HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 10 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 11/85 task starting: HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 11 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 12/85 task starting: HE_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 12 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 13/85 task starting: HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 13 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 14/85 task starting: HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 14 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 15/85 task starting: HE_Scale100_Split82_InitOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 15 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 16/85 task starting: HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 16 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 17/85 task starting: HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 17 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 18/85 task starting: HE_Scale100_Split82_InitOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 18 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 19/85 task starting: HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 19 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 20/85 task starting: HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 20 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 21/85 task starting: HE_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 21 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 22/85 task starting: HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 22 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 23/85 task starting: HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 23 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 24/85 task starting: HE_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 24 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 25/85 task starting: HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 25 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 26/85 task starting: HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 26 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 27/85 task starting: HE_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 27 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 28/85 task starting: HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 28 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 29/85 task starting: HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 29 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 30/85 task starting: HE_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 30 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 31/85 task starting: HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 31 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 32/85 task starting: HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 32 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 33/85 task starting: HE_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 33 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 34/85 task starting: HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 34 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 35/85 task starting: HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 35 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 36/85 task starting: HE_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 36 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 37/85 task starting: HE_Scale100_Split91_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=91 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=91 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 37 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 38/85 task starting: HE_Scale1_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs16_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=16 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=1"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=16 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=1 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 38 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 39/85 task starting: HE_Scale2_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs17_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=17 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=2"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=17 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=2 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 39 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 40/85 task starting: HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs20_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=20 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=40"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=20 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=40 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 40 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 41/85 task starting: HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=40"
nohup python llm_logistics.py --dataset=HE --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=40 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 41 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 42/85 task starting: HE_Scale40_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=40"
nohup python llm_logistics.py --dataset=HE --model_name=Qwen2.5-7B-Instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=40 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 42 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 43/85 task starting: HE_Scale4_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs14_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=14 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=4"
nohup python llm_logistics.py --dataset=HE --model_name=GLM4-9b-chat --epoch=14 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=4 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 43 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 44/85 task starting: MC_Scale0.25_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs14_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=14 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=0.25"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=14 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=0.25 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 44 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 45/85 task starting: MC_Scale0.5_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=0.5"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=0.5 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 45 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 46/85 task starting: MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 46 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 47/85 task starting: MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 47 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 48/85 task starting: MC_Scale100_Split82_DistOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 48 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 49/85 task starting: MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 49 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 50/85 task starting: MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 50 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 51/85 task starting: MC_Scale100_Split82_DistOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 51 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 52/85 task starting: MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 52 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 53/85 task starting: MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 53 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 54/85 task starting: MC_Scale100_Split82_DistOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 54 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 55/85 task starting: MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 55 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 56/85 task starting: MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 56 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 57/85 task starting: MC_Scale100_Split82_DistOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=DistOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 57 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 58/85 task starting: MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 58 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 59/85 task starting: MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 59 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 60/85 task starting: MC_Scale100_Split82_InitOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 60 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 61/85 task starting: MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 61 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 62/85 task starting: MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 62 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 63/85 task starting: MC_Scale100_Split82_InitOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 63 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 64/85 task starting: MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 64 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 65/85 task starting: MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 65 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 66/85 task starting: MC_Scale100_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 66 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 67/85 task starting: MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 67 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 68/85 task starting: MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 68 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 69/85 task starting: MC_Scale100_Split82_InitOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 69 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 70/85 task starting: MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 70 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 71/85 task starting: MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 71 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 72/85 task starting: MC_Scale100_Split82_SeqeOrd_JsonSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=JsonSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 72 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 73/85 task starting: MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 73 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 74/85 task starting: MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 74 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 75/85 task starting: MC_Scale100_Split82_SeqeOrd_ListTempSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ListTempSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 75 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 76/85 task starting: MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 76 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 77/85 task starting: MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 77 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 78/85 task starting: MC_Scale100_Split82_SeqeOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=NamedFeatSeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 78 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 79/85 task starting: MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_GLM4-9b-chat_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 79 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 80/85 task starting: MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_llama-3-8b-instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 80 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 81/85 task starting: MC_Scale100_Split82_SeqeOrd_ValueOnlySeq_Cot0_Qwen2.5-7B-Instruct_Epochs5_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=5 --loss_fun=cross --mode=test --split=82 --order_strategy=SeqeOrd --sequence=ValueOnlySeq --cot=0 --scale=100 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 81 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 82/85 task starting: MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs8_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=8 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=10"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=8 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=10 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 82 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 83/85 task starting: MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_llama-3-8b-instruct_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=10"
nohup python llm_logistics.py --dataset=MC --model_name=llama-3-8b-instruct --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=10 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 83 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 84/85 task starting: MC_Scale10_Split82_InitOrd_NamedFeatSeq_Cot0_Qwen2.5-7B-Instruct_Epochs20_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=20 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=10"
nohup python llm_logistics.py --dataset=MC --model_name=Qwen2.5-7B-Instruct --epoch=20 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=10 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 84 task failed." >> logs/output.log
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') The 85/85 task starting: MC_Scale1_Split82_InitOrd_NamedFeatSeq_Cot0_GLM4-9b-chat_Epochs15_En.yaml." | tee -a logs/process.log >> logs/output.log
echo "llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=1"
nohup python llm_logistics.py --dataset=MC --model_name=GLM4-9b-chat --epoch=15 --loss_fun=cross --mode=test --split=82 --order_strategy=InitOrd --sequence=NamedFeatSeq --cot=0 --scale=1 > logs/output.log 2>&1 &
pid=$!
wait $pid
if [ $? -ne 0 ]; then
    echo "The 85 task failed." >> logs/output.log
fi

echo "-----------------------" >> result/metrics/metrics_$(date +%Y%m%d).csv