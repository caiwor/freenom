######################  账户配置  #########################
# Freenom 账户
export FN_ID=
# Freenom 密码
export FN_PW=
######################  end 账户配置  #########################

######################   TG 机器人   #########################
# 给 @getidsbot 发送 /start 获取到的纯数字 ID, 如 1434078534
#export TG_USER_ID=
# 申请 @BotFather 的 Token, 如 10xxx4:AAFcqxxxxgER5uw
#export TG_BOT_TOKEN=
# 代理类型为 http, 比如您代理是 http://127.0.0.1:1080 , 则填写 127.0.0.1 , 有密码例子: username:password@127.0.0.1
#export TG_PROXY_IP=
# 代理端口号, 代理类型为 http, 比如您代理是 http://127.0.0.1:1080 , 则填写 1080
#export TG_PROXY_PORT=
###################### end TG 机器人 #########################

######################    企业微信    #########################
# 依次填入 corpid, corpsecret, touser(注: 多个成员ID使用 | 隔开), agentid, media_id(选填, 不填默认文本消息类型)
#export QYWX_AM=
######################  end 企业微信  #########################

######################    Server酱   #########################
# server 酱推送, 填写 SCKEY 代码即可
#export PUSH_KEY=
###################### end Server酱 #########################

######################  Bark 送信  #########################
# BARK 推送使用, 填写 URL 即可, 例如: https://api.day.app/DxHcxxxxxRxxxxxxcm/
#export BARK=
###################### end Bark 送信 #########################

###################### 钉钉通知  #########################
# 钉钉推送, 只需 https://oapi.dingtalk.com/robot/send?access_token=XXX 等于符号后面的 XXX
#export DD_BOT_TOKEN=
# 钉钉推送密钥, 机器人安全设置页面, 加签一栏下面显示的 SEC 开头的字符串, 注: 填写了 DD_BOT_TOKEN 和 DD_BOT_SECRET , 钉钉机器人安全设置只需勾选加签即可, 其他选项不要勾选
#export DD_BOT_SECRET=
######################  end 钉钉通知  #########################

##检查更新
LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
CURRENT_DIR=$(cd $(dirname $0); pwd)
#更新FNplus.py
wget --no-check-certificate -qO- "https://raw.githubusercontent.com/Oreomeow/freenom-py/main/FNplus.py" -O "$CURRENT_DIR/nFNplus.py"
nFNPmd5=$(md5sum $CURRENT_DIR/nFNplus.py|awk '{print$1}')
oFNPmd5=$(md5sum $CURRENT_DIR/FNplus.py|awk '{print$1}')
if [ "$nFNPmd5" != "$oFNPmd5" ]; then
  echo "[$LOGTIME] 正在更新FNplus.py"
  rm $CURRENT_DIR/FNplus.py
  cp $CURRENT_DIR/nFNplus.py $CURRENT_DIR/FNplus.py
else 
  echo "[$LOGTIME] FNplus.py为最新版"
fi
rm $CURRENT_DIR/nFNplus.py
#更新notify.py
wget --no-check-certificate -qO- "https://raw.githubusercontent.com/whyour/qinglong/master/sample/notify.py" -O "$CURRENT_DIR/nNotify.py"
nNTYmd5=$(md5sum $CURRENT_DIR/nNotify.py|awk '{print$1}')
oNTYmd5=$(md5sum $CURRENT_DIR/notify.py|awk '{print$1}')
if [ "$nNTYmd5" != "$oNTYmd5" ]; then
  echo "[$LOGTIME] 正在更新notify.py"
  rm $CURRENT_DIR/notify.py
  cp $CURRENT_DIR/nNotify.py $CURRENT_DIR/notify.py
else 
  echo "[$LOGTIME] Ncotify.py为最新版"
fi
rm $CURRENT_DIR/nNotify.py

##执行续订
python3 $CURRENT_DIR/FNplus.py

##删除Easy-cron-log
rm -rf $CURRENT_DIR/easy-cron-log