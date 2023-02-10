import os
import re
import hashlib
import requests

##执行续订
os.system("chmod +x FNplus.sh")
os.system("bash FNplus.sh")

##添加定时任务
#Easy-cron添加可执行权限
os.system("chmod +x easy-cron")
#修改config.yaml文件
conf_str = open('config.yaml', 'r', encoding='utf-8').read().strip('\n')
opath = re.search(r'\/home\/runner\/.*?\/', conf_str).group(0)
npath = os.popen("pwd").read().strip('\n')+'/'
nconf_str = conf_str.replace(opath, npath)
config = open('config.yaml', 'w', encoding="utf-8")
config.write(nconf_str)
config.close()
os.popen("./easy-cron").read()
