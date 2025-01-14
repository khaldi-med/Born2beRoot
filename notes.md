- to creat a user use **useradd** 

- to change the name of user: **usermod -l 'new name' 'old name'**

- **chage** cmd to see the info about user

- **userdel** to remove user add -r to delete it from hom dir

- Special User Accounts

```Special user accounts are required to run processes associated with certain services. For example, daemon is a user account that is used to run the daemon service.In special user accounts, the UID value for the users will be less than the default UID value, which is 500. Such special users will not have a home directory. You can create a special user account using the useradd -r {special user name} command.```

```
The chage Command
The chage command is used to change a number of settings that relate to the password and status of the user account.

The syntax of the chage command is chage [options] {username}.

When you run the chage command with no options, it will prompt you to set:

Setting

Purpose

Minimum Password Age

The minimum number of days that must pass after the user has changed their password before they are allowed to change it again. The default is 0 which means Minimum Password Age is disabled.

Maximum Password Age

The maximum number of days the user may use a password before they must change it. The default is 99999 which is over 200 years. Effectively, this means the Maximum Password Age is disabled.

Last Password Change

The date on which the user last changed their password.

Password Expiration Warning

The number of days before the Maximum Password Age is reached when the user should be warned that their password is going to expire. This reminds the user to change the password a week before the Maximum Password Age is reached.

Password Inactive

This setting indicates whether the password is inactive. The default is -1 which means the password is not inactive. If the value is set to 1, the password is inactive and the account is disabled.

Account Expiration Date

The last date the account can be used. After the account expiration date has passed, the account is disabled.

The chage command has some options:

Option

Allows You To

chage -d {yyyy-mm-dd} {user name}

Sets the date of the last password change to the date specified.

chage -E {yyyy-mm-dd} {user name}

Sets the date when the account should expire.

chage -m {number} {user name}

Sets the Minimum Password Age to the number of days specified. Specifying zero will allow the user to change their password immediately.

chage -M {number} {user name}

Sets the Maximum Password Age to the number of days specified. Specifying 99999 will set the password to never expire.

chage -I {number} {user name}

Sets the number of days the account will be inactive after the password expires. During the inactive period, the user can use the expired password to log in to change the password. After the inactive period expires, the user will not be able to change their own password to reactivate the account.

chage -W {number} {user name}

Sets the warning period to the number of days specified. The user will be warned this number of days in advance of the password expiration date that they should change their password.

chage -l {user name}

Lists the password aging information for the specified user.


The userdel Command
The userdel command allows you to modify the system account files, deleting all entries that refer to the login of an existing user. However, it will not allow you to remove an account if the user is currently logged in. You must kill any running processes that belong to an account before deleting the account.

The syntax of the userdel command is userdel [options] {username}.


The -r Option
The -r option will delete the files in the user’s home directory, along with the home directory itself. Files owned by this user and located in other locations will have to be searched for and deleted manually.


The usermod Command
The usermod command has options that enable you to modify various user account parameters. You can change a user’s name, default groups, UID, or passwords.

The syntax of the usermod command is usermod [options] {username}.

Some of the common usermod command options and their descriptions are given in the following table.

Option

Allows You To

usermod -l{new_username} {oldusername}

Modify the login name of the user.

usermod -c “First Last” username

Modify the user’s full name.

usermod -f {number of days} {login}

Modify the number of days for a password to expire and to disable the account permanently.

usermod -u {new unique user ID} {login}

Modify the numerical value of a user’s ID, which has to be unique.

usermod -d {new login directory} login

Modify the user’s default home directory.

usermod -L {user name}

Lock the password and suspend the user account temporarily. However, if the user has some other authentication method configured, they will still be able to log in.

usermod -U {user name}

Unlock the password.

usermod -e {yyyy-mm-dd} {user name}

Change the expiration date for the user account. After the expiration date, the account will be disabled. Expired accounts can be re-enabled by setting a new expiration date. If you use “” as the expiration date, the account will be enabled indefinitely with no expiration date. Example: usermod -e “” user If you use 1 as the expiration date, the account will immediately expire and be disabled. Example: usermod -e 1 user

Usermod -G {group name} {user name}

Adds the user to the specified group.


Lock User Login
In Linux, you can lock a user’s login to temporarily prevent a user from logging in to a system. This is done by disabling the user’s password using the passwd -l or usermod -L command. The user’s login is usually locked as a security measure, to prevent unauthorized usage when the user is unavailable.
```

- Default User Accounts

```
Numerous user accounts are created by default upon system installation. Some of the main user accounts include the following:

root

bin

daemon

ftp

sshd

nfsnobody

apache

rpc

gnome

The root User
Every Linux system has at least one system administrator whose job is to maintain the system and make it available to users. This user is the root user. The root user can perform any task on the Linux system without restrictions. System administrators are also responsible for adding new users to the system and for setting up their initial environment.
``
### BIOS 

