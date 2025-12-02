@echo off
:: ========================================================================
:: RDP Wrapper Configuration Sources
:: Version: 1.0
:: Auto-update URL: https://github.com/paulmann/RDP-Wrapper-Autoupdate/raw/main/sources.bat
:: ========================================================================
::
:: Repository configuration for RDP Wrapper Autoupdate script
:: Contains 43 community-maintained sources with priority ranking
:: and error tracking capabilities.
::
:: Format:
::   REPO[index].NAME     - Repository identifier
::   REPO[index].URL      - Direct URL to rdpwrap.ini file
::   REPO[index].PRIORITY - Search priority (1=highest, 4=lowest)
::   REPO[index].ACTIVE   - Repository status (1=active, 0=inactive)
::   REPO[index].ERROR_COUNT - Consecutive download failures
::
:: Repositories with ERROR_COUNT >= 3 are automatically deactivated
:: ========================================================================

set "SOURCES_VERSION=1.0"
set "REPO_COUNT=43"

:: ===== CATEGORY PRIMARY ===== (Priority 1 - Most reliable)
set "REPO[1].NAME=sebaxakerhtc"
set "REPO[1].URL=https://raw.githubusercontent.com/sebaxakerhtc/rdpwrap.ini/master/rdpwrap.ini"
set "REPO[1].PRIORITY=1"
set "REPO[1].ACTIVE=1"
set "REPO[1].ERROR_COUNT=0"

set "REPO[2].NAME=asmtron"
set "REPO[2].URL=https://raw.githubusercontent.com/asmtron/rdpwrap/master/res/rdpwrap.ini"
set "REPO[2].PRIORITY=1"
set "REPO[2].ACTIVE=1"
set "REPO[2].ERROR_COUNT=0"

set "REPO[3].NAME=affinityv"
set "REPO[3].URL=https://raw.githubusercontent.com/affinityv/INI-RDPWRAP/master/rdpwrap.ini"
set "REPO[3].PRIORITY=1"
set "REPO[3].ACTIVE=1"
set "REPO[3].ERROR_COUNT=0"

set "REPO[4].NAME=DrDrrae"
set "REPO[4].URL=https://raw.githubusercontent.com/DrDrrae/rdpwrap/master/res/rdpwrap.ini"
set "REPO[4].PRIORITY=1"
set "REPO[4].ACTIVE=1"
set "REPO[4].ERROR_COUNT=0"

set "REPO[5].NAME=apolope"
set "REPO[5].URL=https://raw.githubusercontent.com/apolope/rdpwrap/master/res/rdpwrap.ini"
set "REPO[5].PRIORITY=1"
set "REPO[5].ACTIVE=1"
set "REPO[5].ERROR_COUNT=0"

:: ===== CATEGORY SECONDARY ===== (Priority 2 - Active community)
set "REPO[6].NAME=UMU618"
set "REPO[6].URL=https://raw.githubusercontent.com/UMU618/rdpwrap.ini/main/rdpwrap.ini"
set "REPO[6].PRIORITY=2"
set "REPO[6].ACTIVE=1"
set "REPO[6].ERROR_COUNT=0"

set "REPO[7].NAME=SniperThrilla"
set "REPO[7].URL=https://raw.githubusercontent.com/SniperThrilla/rdpwrap/main/rdpwrap.ini"
set "REPO[7].PRIORITY=2"
set "REPO[7].ACTIVE=1"
set "REPO[7].ERROR_COUNT=0"

set "REPO[8].NAME=LCW0NJUPT"
set "REPO[8].URL=https://raw.githubusercontent.com/LCW0NJUPT/rdpwrap-autoupdate/master/rdpwrap.ini"
set "REPO[8].PRIORITY=2"
set "REPO[8].ACTIVE=1"
set "REPO[8].ERROR_COUNT=0"

set "REPO[9].NAME=XSR1"
set "REPO[9].URL=https://raw.githubusercontent.com/XSR1/rdpwrap/main/rdpwrap.ini"
set "REPO[9].PRIORITY=2"
set "REPO[9].ACTIVE=1"
set "REPO[9].ERROR_COUNT=0"

set "REPO[10].NAME=saurav-biswas"
set "REPO[10].URL=https://raw.githubusercontent.com/saurav-biswas/rdpwrap-1/patch-1/res/rdpwrap.ini"
set "REPO[10].PRIORITY=2"
set "REPO[10].ACTIVE=1"
set "REPO[10].ERROR_COUNT=0"

:: ===== CATEGORY TERTIARY ===== (Priority 3 - Updated regularly)
set "REPO[11].NAME=fatukah"
set "REPO[11].URL=https://raw.githubusercontent.com/fatukah/rdpwrap/main/rdpwrap.ini"
set "REPO[11].PRIORITY=3"
set "REPO[11].ACTIVE=1"
set "REPO[11].ERROR_COUNT=0"

set "REPO[12].NAME=infowayrs"
set "REPO[12].URL=https://raw.githubusercontent.com/infowayrs/INI-RDPWRAP/master/rdpwrap.ini"
set "REPO[12].PRIORITY=3"
set "REPO[12].ACTIVE=1"
set "REPO[12].ERROR_COUNT=0"

set "REPO[13].NAME=smallerxie"
set "REPO[13].URL=https://raw.githubusercontent.com/smallerxie/rdpwrap-ini-dll/master/rdpwrap.ini"
set "REPO[13].PRIORITY=3"
set "REPO[13].ACTIVE=1"
set "REPO[13].ERROR_COUNT=0"

set "REPO[14].NAME=MarkusLuan"
set "REPO[14].URL=https://raw.githubusercontent.com/MarkusLuan/rdpwrap_update/master/rdpwrap.ini"
set "REPO[14].PRIORITY=3"
set "REPO[14].ACTIVE=1"
set "REPO[14].ERROR_COUNT=0"

set "REPO[15].NAME=tstaudte"
set "REPO[15].URL=https://raw.githubusercontent.com/tstaudte/rdpwrap/main/rdpwrap.ini"
set "REPO[15].PRIORITY=3"
set "REPO[15].ACTIVE=1"
set "REPO[15].ERROR_COUNT=0"

:: ===== CATEGORY LEGACY ===== (Priority 4 - Verification needed)
set "REPO[16].NAME=fre4kyC0de"
set "REPO[16].URL=https://raw.githubusercontent.com/fre4kyC0de/rdpwrap/master/rdpwrap.ini"
set "REPO[16].PRIORITY=4"
set "REPO[16].ACTIVE=1"
set "REPO[16].ERROR_COUNT=0"

set "REPO[17].NAME=karloskar"
set "REPO[17].URL=https://raw.githubusercontent.com/karloskar/rcs-rdpwrap/master/rdpwrap.ini"
set "REPO[17].PRIORITY=4"
set "REPO[17].ACTIVE=1"
set "REPO[17].ERROR_COUNT=0"

set "REPO[18].NAME=mamiksik"
set "REPO[18].URL=https://raw.githubusercontent.com/mamiksik/rdpwrap/master/rdpwrap.ini"
set "REPO[18].PRIORITY=4"
set "REPO[18].ACTIVE=1"
set "REPO[18].ERROR_COUNT=0"

set "REPO[19].NAME=ANYK3Y"
set "REPO[19].URL=https://raw.githubusercontent.com/ANYK3Y/rdpwrap/master/rdpwrap.ini"
set "REPO[19].PRIORITY=4"
set "REPO[19].ACTIVE=1"
set "REPO[19].ERROR_COUNT=0"

set "REPO[20].NAME=0xatom"
set "REPO[20].URL=https://raw.githubusercontent.com/0xatom/rdpwrap/master/rdpwrap.ini"
set "REPO[20].PRIORITY=4"
set "REPO[20].ACTIVE=1"
set "REPO[20].ERROR_COUNT=0"

set "REPO[21].NAME=rdpwrap-org"
set "REPO[21].URL=https://raw.githubusercontent.com/rdpwrap/rdpwrap/master/res/rdpwrap.ini"
set "REPO[21].PRIORITY=4"
set "REPO[21].ACTIVE=1"
set "REPO[21].ERROR_COUNT=0"

set "REPO[22].NAME=andyacer"
set "REPO[22].URL=https://raw.githubusercontent.com/andyacer/rdpwrap/master/rdpwrap.ini"
set "REPO[22].PRIORITY=4"
set "REPO[22].ACTIVE=1"
set "REPO[22].ERROR_COUNT=0"

set "REPO[23].NAME=CyberAndrii"
set "REPO[23].URL=https://raw.githubusercontent.com/CyberAndrii/rdpwrap/master/rdpwrap.ini"
set "REPO[23].PRIORITY=4"
set "REPO[23].ACTIVE=1"
set "REPO[23].ERROR_COUNT=0"

set "REPO[24].NAME=dzmdmd"
set "REPO[24].URL=https://raw.githubusercontent.com/dzmdmd/rdpwrap/master/rdpwrap.ini"
set "REPO[24].PRIORITY=4"
set "REPO[24].ACTIVE=1"
set "REPO[24].ERROR_COUNT=0"

set "REPO[25].NAME=immense"
set "REPO[25].URL=https://raw.githubusercontent.com/immense/rdpwrap/master/rdpwrap.ini"
set "REPO[25].PRIORITY=4"
set "REPO[25].ACTIVE=1"
set "REPO[25].ERROR_COUNT=0"

set "REPO[26].NAME=jetspiking"
set "REPO[26].URL=https://raw.githubusercontent.com/jetspiking/rdpwrap/master/rdpwrap.ini"
set "REPO[26].PRIORITY=4"
set "REPO[26].ACTIVE=1"
set "REPO[26].ERROR_COUNT=0"

set "REPO[27].NAME=kkkgo"
set "REPO[27].URL=https://raw.githubusercontent.com/kkkgo/rdpwrap/master/rdpwrap.ini"
set "REPO[27].PRIORITY=4"
set "REPO[27].ACTIVE=1"
set "REPO[27].ERROR_COUNT=0"

set "REPO[28].NAME=maximusvalor"
set "REPO[28].URL=https://raw.githubusercontent.com/maximusvalor/rdpwrap/master/rdpwrap.ini"
set "REPO[28].PRIORITY=4"
set "REPO[28].ACTIVE=1"
set "REPO[28].ERROR_COUNT=0"

set "REPO[29].NAME=nomosher"
set "REPO[29].URL=https://raw.githubusercontent.com/nomosher/rdpwrap/master/rdpwrap.ini"
set "REPO[29].PRIORITY=4"
set "REPO[29].ACTIVE=1"
set "REPO[29].ERROR_COUNT=0"

set "REPO[30].NAME=rasta-mouse"
set "REPO[30].URL=https://raw.githubusercontent.com/rasta-mouse/rdpwrap/master/rdpwrap.ini"
set "REPO[30].PRIORITY=4"
set "REPO[30].ACTIVE=1"
set "REPO[30].ERROR_COUNT=0"

set "REPO[31].NAME=sailor67-master"
set "REPO[31].URL=https://raw.githubusercontent.com/sailor67/rdpwrap/master/rdpwrap.ini"
set "REPO[31].PRIORITY=4"
set "REPO[31].ACTIVE=1"
set "REPO[31].ERROR_COUNT=0"

set "REPO[32].NAME=sailor67-res"
set "REPO[32].URL=https://raw.githubusercontent.com/sailor67/rdpwrap/master/res/rdpwrap.ini"
set "REPO[32].PRIORITY=4"
set "REPO[32].ACTIVE=1"
set "REPO[32].ERROR_COUNT=0"

set "REPO[33].NAME=snakefoot"
set "REPO[33].URL=https://raw.githubusercontent.com/snakefoot/rdpwrap/master/rdpwrap.ini"
set "REPO[33].PRIORITY=4"
set "REPO[33].ACTIVE=1"
set "REPO[33].ERROR_COUNT=0"

set "REPO[34].NAME=vcla"
set "REPO[34].URL=https://raw.githubusercontent.com/vcla/rdpwrap/master/rdpwrap.ini"
set "REPO[34].PRIORITY=4"
set "REPO[34].ACTIVE=1"
set "REPO[34].ERROR_COUNT=0"

set "REPO[35].NAME=williamwilling"
set "REPO[35].URL=https://raw.githubusercontent.com/williamwilling/rdpwrap/master/rdpwrap.ini"
set "REPO[35].PRIORITY=4"
set "REPO[35].ACTIVE=1"
set "REPO[35].ERROR_COUNT=0"

set "REPO[36].NAME=xushuduo"
set "REPO[36].URL=https://raw.githubusercontent.com/xushuduo/rdpwrap/master/rdpwrap.ini"
set "REPO[36].PRIORITY=4"
set "REPO[36].ACTIVE=1"
set "REPO[36].ERROR_COUNT=0"

set "REPO[37].NAME=yui0"
set "REPO[37].URL=https://raw.githubusercontent.com/yui0/rdpwrap/master/rdpwrap.ini"
set "REPO[37].PRIORITY=4"
set "REPO[37].ACTIVE=1"
set "REPO[37].ERROR_COUNT=0"

set "REPO[38].NAME=z3APA3A"
set "REPO[38].URL=https://raw.githubusercontent.com/z3APA3A/rdpwrap/master/rdpwrap.ini"
set "REPO[38].PRIORITY=4"
set "REPO[38].ACTIVE=1"
set "REPO[38].ERROR_COUNT=0"

set "REPO[39].NAME=ajkhoury"
set "REPO[39].URL=https://raw.githubusercontent.com/ajkhoury/rdpwrap/master/rdpwrap.ini"
set "REPO[39].PRIORITY=4"
set "REPO[39].ACTIVE=1"
set "REPO[39].ERROR_COUNT=0"

set "REPO[40].NAME=border"
set "REPO[40].URL=https://raw.githubusercontent.com/border/rdpwrap/master/rdpwrap.ini"
set "REPO[40].PRIORITY=4"
set "REPO[40].ACTIVE=1"
set "REPO[40].ERROR_COUNT=0"

set "REPO[41].NAME=custom-dev"
set "REPO[41].URL=https://raw.githubusercontent.com/custom-dev/rdpwrap/master/rdpwrap.ini"
set "REPO[41].PRIORITY=4"
set "REPO[41].ACTIVE=1"
set "REPO[41].ERROR_COUNT=0"

set "REPO[42].NAME=danielkucera"
set "REPO[42].URL=https://raw.githubusercontent.com/danielkucera/rdpwrap/master/rdpwrap.ini"
set "REPO[42].PRIORITY=4"
set "REPO[42].ACTIVE=1"
set "REPO[42].ERROR_COUNT=0"

set "REPO[43].NAME=desktop"
set "REPO[43].URL=https://raw.githubusercontent.com/desktop/rdpwrap/master/rdpwrap.ini"
set "REPO[43].PRIORITY=4"
set "REPO[43].ACTIVE=1"
set "REPO[43].ERROR_COUNT=0"