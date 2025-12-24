#!/bin/bash

# Задаем длительность работы контейнера, если она не указана при запуске
DURATION=${1:-60}

echo "====== Docker Practice Container ======"
echo "Start time: $(date)"
echo "Duration: ${DURATION} seconds"
echo "========================================"

# Вывод информации о системе
echo "System Information:"
uname -a  # Информация о системе
echo "Available Memory: $(free -h | grep Mem)"  # Доступная память
echo "CPU Info:"
nproc  # Информация о процессорах

# Генерируем логи и нагрузку на ресурсы
counter=0
while [ $counter -lt $DURATION ]; do
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iteration $((counter + 1))/$DURATION"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Memory usage: $(ps aux | awk '{sum+=$6} END {print sum/1024 " MB"}')"  # Использование памяти

    # Имитация работы приложения
    sleep 5  # Пауза в 5 секунд
    counter=$((counter + 5))  # Увеличиваем счетчик
done

echo "====== Container Shutdown ======"
echo "End time: $(date)"
echo "Container completed successfully"

