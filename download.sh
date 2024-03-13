#!/bin/bash
data_folder="data/zip"
link="https://cdn.tse.jus.br/estatistica/sead/eleicoes/eleicoes2022/arqurnatot/bu_imgbu_logjez_rdv_vscmr_2022_1t_RN.zip"
mkdir -p $data_folder
wget  $link  -P $data_folder/

