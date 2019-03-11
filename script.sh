#!/bin/bash
cd /
mkdir /Projects
cd /Projects/
mkdir Proj{1..3}
#Developers
i=1
while [[ "$i" -lt "6" ]]
do
    if id R$i >/dev/null 2>&1; then
    userdel R$i
    rm -r /home/R$i
    fi
   useradd -m -s /bin/bash R$i
   echo -e "Temp_Pass$i\nTemp_Pass$i" | passwd R$i
   let "i++"
done
setfacl -Rm u:R2:rwx,u:R3:rwx,u:R5:rwx Proj1
setfacl -Rm u:R1:rwx,u:R5:rwx Proj2
setfacl -Rm u:R1:rwx,u:R2:rwx,u:R4:rwx Proj3
setfacl -Rdm u:R2:rwx,u:R3:rwx,u:R5:rwx Proj1
setfacl -Rdm u:R1:rwx,u:R5:rwx Proj2
setfacl -Rdm u:R1:rwx,u:R2:rwx,u:R4:rwx Proj3
#Managers
i=1
while [[ "$i" -lt "4" ]]
do
    if id I$i >/dev/null 2>&1; then
    userdel I$i
    rm -r /home/I$i
    fi
   useradd -m -s /bin/bash I$i
   echo -e "Temp_Pass$i\nTemp_Pass$i" | passwd I$i
   let "i++"
done
setfacl -Rm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj1
setfacl -Rm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj2
setfacl -Rm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj3
setfacl -Rdm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj1
setfacl -Rdm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj2
setfacl -Rdm u:I1:-wx,u:I2:-w-,u:I3:-w- Proj3
#Analysts
i=1
while [[ "$i" -lt "5" ]]
do
    if id A$i >/dev/null 2>&1; then
    userdel A$i
    rm -r /home/A$i
    fi
   useradd -m -s /bin/bash A$i
   echo -e "Temp_Pass$i\nTemp_Pass$i" | passwd A$i
   let "i++"
done
setfacl -Rm u:A1:rwx,u:A4:rx Proj1
setfacl -Rm u:A1:rwx,u:A2:rx,u:A3:rx Proj2
setfacl -Rm u:A2:rwx,u:A1:rx,u:A4:rx Proj3
setfacl -Rdm u:A1:rwx,u:A4:rx Proj1
setfacl -Rdm u:A1:rwx,u:A2:rx,u:A3:rx Proj2
setfacl -Rdm u:A2:rwx,u:A1:rx,u:A4:rx Proj3