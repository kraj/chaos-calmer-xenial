SSH_ENV="/tmp/ssh-agent.pid"
if [ ! -e ${SSH_ENV} ] ; then
  /usr/bin/ssh-agent > ${SSH_ENV}
fi
. "${SSH_ENV}"
/usr/bin/ssh-add

