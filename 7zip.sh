#!/bin/bash
pasta="data/bu_imgbu_logjez_rdv_vscmr_2022_1t_RN"

counter=0
mkdir data/texto
for file in "$pasta"/*; do
    if [[ "$file" == *logjez ]]; then
        echo "$file"
        yes | 7z x -odata/7zip/$(basename ${file%.logjez}) "$file" >/dev/null 2>&1

        nome_pasta=$(basename "${file%.logjez}")
        mv data/7zip/${nome_pasta}/logd.dat data/7zip/${nome_pasta}.dat
        iconv -f ISO-8859-1 -t UTF-8//TRANSLIT data/7zip/${nome_pasta}.dat -o data/texto/${nome_pasta} >/dev/null 2>&1
        rm -Rf data/7zip/${nome_pasta}

        ((counter++))
        if [ "$counter" -eq 500 ]; then
        break
    fi
    
    fi
done
