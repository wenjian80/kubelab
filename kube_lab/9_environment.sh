#add your machine tenancy
#Change to you tenancy of the ocirpass
#Go to developer service->ocir and note down the name
export ocirtenancy=idlicap3m15d


#add your container userName , Password  
#Change to your oracle sso account.
#This is the uid/password to login to container-registry.oracle.com to pull down the images.
#Make sure you have accept the agreement in container-registry.oracle.com website
export ocontaineruser=boonjiantest@gmail.com
export ocontainerpassword=Welc0me1234#


#add your ociruser id 
#Change to user email id and token that is created in the lab
#Put a \ if token has a special chracter Eg \<
export ociruser=$ocirtenancy/oracleidentitycloudservice/boon.jian.lim@oracle.com
export ocirpass="8C1OuDQluSj\(\{e\_\<fRQ\-"

echo  'Set variable to /root/.bashrc'
echo  'export ocontaineruser='$ocontaineruser >> /root/.bashrc
echo  'export ocontainerpassword='$ocontainerpassword >> /root/.bashrc
echo  'export ociruser='$ociruser >> /root/.bashrc
echo  'export ocirpass='$ocirpass >> /root/.bashrc

echo  '#################################################################'
echo  'Run /root/.bashrc which is set in the variables'
echo  '#################################################################'
source /root/.bashrc


echo  '#################################################################'
echo  'Check variables are all exported, they should be no empty values'
echo  '#################################################################'

echo 'ociruser='$ociruser
echo 'ocirpass='$ocirpass
echo 'ocontaineruser='$ocontaineruser
echo 'ocontainerpassword='$ocontainerpassword

echo  '#################################################################'
echo  'Run the command echo $ociruser to see if password is set'
echo  'Run the command echo $ocirpass to see if password is set'
echo  'Run the command echo $ocontaineruser to see if password is set'
echo  'Run the command echo $ocontainerpassword to see if password is set'
echo  '#################################################################'