#!/usr/bin/env bash

MY=(
    'nadelyaev.dev.crm.rambler-co.ru'
    'nadelyaev.dev.crm.rambler.ru'
)

DEV=(
    'back01.dev.crm.rambler-co.ru'
    'queue01.dev.crm.rambler-co.ru'
    'front01.dev.crm.rambler-co.ru'
    'subs01.dev.crm.rambler-co.ru'
    'storage01.dev.crm.rambler-co.ru'
)

STAGE=(
    'back01.stage.crm.rambler-co.ru'
    'queue01.stage.crm.rambler-co.ru'
    'front01.stage.crm.rambler-co.ru'
    'subs01.stage.crm.rambler-co.ru'
    'storage01.stage.crm.rambler-co.ru'
)

PROD=(
    'back01.crm.rambler-co.ru'
    'back02.crm.rambler-co.ru'
    'queue01.crm.rambler-co.ru'
    'queue02.crm.rambler-co.ru'
    'front01.crm.rambler-co.ru'
    'front02.crm.rambler-co.ru'
    'subs01.crm.rambler-co.ru'
    'subs02.crm.rambler-co.ru'
    'storage01.crm.rambler-co.ru'
    'storage02.crm.rambler-co.ru'
)

QA=(
    'back01.dev.crm.rambler-co.ru'
    'queue01.dev.crm.rambler-co.ru'
    'front01.dev.crm.rambler-co.ru'
    'subs01.dev.crm.rambler-co.ru'
    'storage01.dev.crm.rambler-co.ru'
)

MISC=(
    'mailer.dev.crm.rambler-co.ru'
    'repo.crm.rambler-co.ru'
    'repo02.crm.rambler-co.ru'
)


if [ -z "$1" ]; then

    echo '- MY -'
    for i in ${!MY[*]}
    do
        printf "%d: %s\n" $i ${MY[$i]}
    done

    echo '- DEV -'
    for i in ${!DEV[*]}
    do
        printf "1%d: %s\n" $i ${DEV[$i]}
    done

    echo '- STAGE -'
    for i in ${!STAGE[*]}
    do
        printf "2%d: %s\n" $i ${STAGE[$i]}
    done

    echo '- PROD -'
    for i in ${!PROD[*]}
    do
        printf "3%d: %s\n" $i ${PROD[$i]}
    done

    echo '- QA -'
    for i in ${!QA[*]}
    do
        printf "4%d: %s\n" $i ${QA[$i]}
    done

    echo '-- MISC --'
    for i in ${!MISC[*]}
    do
        printf "5%d: %s\n" $i ${MISC[$i]}
    done

    echo 'CHOICE [with ENTER]:'
    read choice

else

    choice=$1

fi


# MY
if (( $choice >= 0 && $choice <= 9 )); then
    ((choice = choice))
    server=${MY[${choice}]}
fi

# DEV
if (( $choice >= 10 && $choice <= 19 )); then
    ((choice = choice - 10))
    server=${DEV[${choice}]}
fi

# STAGE
if (( $choice >= 20 && $choice <= 29 )); then
    ((choice = choice - 20))
    server=${STAGE[${choice}]}
fi

# PROD
if (( $choice >= 30 && $choice <= 39 )); then
    ((choice = choice - 30))
    server=${PROD[${choice}]}
fi

# QA
if (( $choice >= 40 && $choice <= 49 )); then
    ((choice = choice - 40))
    server=${QA[${choice}]}
fi

# MISC
if (( $choice >= 50 && $choice <= 59 )); then
    ((choice = choice - 50))
    server=${MISC[${choice}]}
fi


# SSH

echo 'GO to' $server

ssh -A nadelyaev@${server}
