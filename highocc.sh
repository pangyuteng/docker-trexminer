export DISPLAY=:0

read -d "\0" -a number_of_gpus < <(nvidia-smi --query-gpu=count --format=csv,noheader,nounits)
printf "%s\n" "found ${number_of_gpus[0]} gpu[s]..."
index=$(( number_of_gpus[0] - 1 ))
for i in $(seq 0 $index)
do
    if nvidia-smi -i $i --query-gpu=name --format=csv,noheader,nounits | grep -E "1070" 1> /dev/null
    then
    printf "%s\n" "found GeForce GTX 1070 at index $i..."
    nvidia-smi -i $i -pm 1
    nvidia-smi -i $i -pl 125
    sudo DISPLAY=:0 XAUTHORITY=/run/user/121/gdm/Xauthority nvidia-settings -a [gpu:${i}]/GPUFanControlState=1 -V all
    sudo DISPLAY=:0 XAUTHORITY=/run/user/121/gdm/Xauthority nvidia-settings -a [fan:${i}]/GPUTargetFanSpeed=80 -V all
    sudo DISPLAY=:0 XAUTHORITY=/run/user/121/gdm/Xauthority nvidia-settings -a [gpu:${i}]/GPUGraphicsClockOffset[3]=0 -V all
    sudo DISPLAY=:0 XAUTHORITY=/run/user/121/gdm/Xauthority nvidia-settings -a [gpu:${i}]/GPUMemoryTransferRateOffset[3]=1400 -V all
    elif nvidia-smi -i $i --query-gpu=name --format=csv,noheader,nounits | grep -E "1080" 1> /dev/null
    then 
    printf "%s\n" "found GeForce GTX 1080 at index $i..."
    sudo nvidia-smi -i $i -pm 1
    sudo nvidia-smi -i $i -pl 200
    sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [gpu:${i}]/GPUFanControlState=1 -V all
    sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [fan:${i}]/GPUTargetFanSpeed=50 -V all
    sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [gpu:${i}]/GPUGraphicsClockOffset[3]=100 -V all
    sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [gpu:${i}]/GPUMemoryTransferRateOffset[3]=750 -V all
    fi 
done
