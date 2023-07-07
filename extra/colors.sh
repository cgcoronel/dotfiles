
#!/bin/bash

for ((i = 0; i < 256; i++)); do
    printf "\e[48;5;${i}m%03d\e[0m " "${i}"
    if ((i % 16 == 15)); then
        printf "\n"
    fi
done
