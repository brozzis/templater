
# for i in selinux yum service firewalld file copy lineinfile sefcontext shell ansible.posix.seboolean

echo "---"
echo "- name: template\n  hosts: all\n  tasks:\n"

for i in $*
do
    ## M=$(ansible-doc -l | grep $i | grep ^ans | awk '{print $1}' 2>/dev/null)
    printf "# $i \n"
    ansible-doc $i | sed -n '/^EXAMPLES/,$p'| sed -n '2,/^$/p' | sed 's/^/  /'
done
