#!/bin/bash
pasta="data/bu_imgbu_logjez_rdv_vscmr_2022_1t_RN"

pasta_log="data/arquivo"
save_dir="data/decodificado"

total=$(find "$pasta_log" -type f -name "*.logjez" | wc -l)

counter=0
for file in "$pasta_log"/*/*; do
    if [[ "$file" == *logjez ]]; then
        ((counter++))
        echo "Descodificando ${counter} de ${total}"
        
        nome=$(basename "${file%.logjez}")
        salvar_em=$save_dir/$nome
        #mkdir -p $salvar_em

        yes | 7z x -o$salvar_em "$file" >/dev/null 2>&1

        nome_pasta=$(basename "${file%.logjez}")

        novo_arquivo=${save_dir}/${nome_pasta}
        
        mv ${salvar_em}/logd.dat ${novo_arquivo}.dat
        rm -Rf  ${salvar_em}
        iconv -f ISO-8859-1 -t UTF-8//TRANSLIT ${novo_arquivo}.dat -o ${novo_arquivo}.txt >/dev/null 2>&1
        rm ${novo_arquivo}.dat

    fi

done
