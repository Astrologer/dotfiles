#!/bin/bash
function get_color() {
    local colour=colour2
    if [ $1 -gt 50 ]; then colour="colour3"; fi
    if [ $1 -gt 80 ]; then colour="colour1"; fi
    if [ $1 -gt 95 ]; then killall chrome; fi
    echo $colour
}
#mem=$(free --b | grep Mem | awk '{printf  "%.2d", 100 - 100 * $7 / $2}')
#cpu=$(mpstat  | grep all | awk '{printf "%.2d", 100 - $12}')
#echo  "#[fg=$(get_color $cpu)]#$cpu%/#[fg=$(get_color $mem)]$mem%#[fg=colour8]"

total_mem=$(sysctl -n hw.memsize)
page_size=$(sysctl -n hw.pagesize)

total_pages=$(($total_mem / $page_size))
pageable_pages=$(sysctl -n vm.page_pageable_internal_count)
purgable_pages=$(sysctl -n vm.page_purgeable_count)
wired_pages=$(vm_stat | grep 'Pages wired down' | gsed 's/.*:\s*//' | sed 's/\.//')

compressed=$(sysctl -n vm.compressor_bytes_used)
compressed_pages=$(($compressed / $page_size))

#echo App $(($pageable_pages - $purgable_pages))
#echo Wire $wired_pages
#echo Comp $compressed_pages

mem=$(( 100 * ($pageable_pages - $purgable_pages + $wired_pages + $compressed_pages) / $total_pages ))

echo  "#[fg=$(get_color $mem)]$mem%#[fg=colour8]"
