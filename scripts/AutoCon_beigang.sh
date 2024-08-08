export CUDA_VISIBLE_DEVICES=2

nitr=2

target="4500K1.0S" 
feature="S"

root_path="/git/datasets/beigang_data/${target}"
data_path="runmin_an_factors_4500K1.0S.csv"

for featue in  "S"  "MS"
do 
if [ "$feature" == "S" ]; then
    enc_in=1
elif [ "$feature" == "MS" ]; then
    enc_in=78
else
    echo "Feature is not S or MS"
    exit 1  # 终止脚本执行，并返回非零状态码表示错误
fi



 python   run_optuna.py --AutoCon  --AutoCon_multiscales 336 --AutoCon_wnorm Mean --freq d  --AutoCon_lambda 0.001  --d_model 4 --d_ff 4 --e_layers 1 --target $target --c_out 1 --root_path $root_path --data_path $data_path --model_id ICLR24_CRV --model AutoConNet --data beigang --seq_len 756 --label_len 60 --pred_len 3 --enc_in $enc_in --des 'Exp' --itr $nitr --batch_size 64 --learning_rate 0.0003 --feature $feature --target $target \
--config param_config_long_term_forecast.json 

nohup python -u run_optuna.py --AutoCon  --AutoCon_multiscales 720 --AutoCon_wnorm ReVIN  --AutoCon_lambda 1.0  --d_model 4 --d_ff 4 --e_layers 1 --target $target --c_out 1 --root_path $root_path  --data_path $data_path --model_id ICLR24_CRV --model AutoConNet --data beigang --seq_len 756 --label_len 48 --pred_len 5 --enc_in $enc_in --des 'Exp' --itr $nitr --batch_size 128 --learning_rate 0.0001 --lradj fixed --feature $feature  --target $target \
--config param_config_long_term_forecast.json 

nohup python -u run_optuna.py --AutoCon  --AutoCon_multiscales 336 --AutoCon_wnorm Decomp  --AutoCon_lambda 0.1  --d_model 8 --d_ff 8 --e_layers 2 --target $target --c_out 1 --root_path $root_path  --data_path $data_path --model_id ICLR24_CRV --model AutoConNet --data beigang --seq_len 336 --label_len 48 --pred_len 7 --enc_in $enc_in --des 'Exp' --itr $nitr --batch_size 128 --learning_rate 0.0001 --lradj fixed --feature $feature  --target $target \
--config param_config_long_term_forecast.json 

nohup python -u run_optuna.py --AutoCon  --AutoCon_multiscales 720 --AutoCon_wnorm Decomp  --AutoCon_lambda 0.01  --d_model 8 --d_ff 8 --e_layers 2 --target $target --c_out 1 --root_path $root_path  --data_path $data_path --model_id ICLR24_CRV --model AutoConNet --data beigang --seq_len 336 --label_len 48 --pred_len 10 --enc_in $enc_in --des 'Exp' --itr $nitr --batch_size 128 --learning_rate 0.0001 --lradj fixed --feature $featue  --target $target \
--config param_config_long_term_forecast.json 
done