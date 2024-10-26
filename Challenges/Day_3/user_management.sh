#!/usr/bin/bash

if [[ "$#" -gt 1 ]]; then
	echo "Too many arguments passed"
	exit
fi

create_user(){
	
	read -p "Enter Username:" username
	read -s -p "Enter Password:" password
	echo ""
	if id "$username" &>/dev/null; then
		echo "User already exists"
		exit
	fi
	
	sudo useradd -m $username
	echo "$username:$password" | sudo chpasswd

	echo "User ${username} created successfully"	

}

delete_user(){
	
	read -p "Enter Username:" username
	echo ""
	if ! id "$username" &>/dev/null; then
		echo "Username does not exist"
		exit
	fi

	sudo userdel -r -f $username
	
	echo "User ${username} deleted successfully"

}

reset_user(){
	
	read -p "Enter Username:" username
	read -s -p "Enter New Password:" password
	echo ""

	if ! id $username &>/dev/null; then
	       echo "User does not exist"
	       exit
        fi

	echo "$username:$password" | sudo chpasswd
	
	echo "Password updated successfully"	
}

list_user(){
	users=$(sudo awk -F: '{ print $1}' /etc/passwd)
	echo "List of Users:"

	echo "$users"
}

help(){
	echo "Usage: ./user_management.sh  [OPTIONS]"
	echo "Options:"
	echo "    -c | --create : create new user"
	echo "    -d | --delete : delete user"
	echo "    -r | --reset  : reset password of user"
	echo "    -l | --list   : list all users"
	echo "    -h | --help   : help page"	
}

case $1 in
	--create | -c)
		create_user
		;;
	--delete | -d)
		delete_user
		;;
	--reset | -r)
		reset_user
		;;
	--list | -l)
		list_user
		;;
	--help | -h)
		help
		;;
	*)
		echo "Unknown Parameter"
		exit
		;;
esac








