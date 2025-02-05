### B2B

* **INDIRECTION**
    * “All problems in computer science can be solved by another level of indirection”—David Wheeler.
    * “. . . except for the problem of too many layers of indirection.”—Kevlin Henney.


#### Debian

* Debian is a widely used and well-respected Linux distribution known for its stability and reliability. It is used for various purposes, including desktop computing, servers, and embedded system. It uses an Advanced Package Tool (apt) package management system to handle software updates and security patches. The package management system helps keep the system up-to-date and secure by automatically downloading and installing security updates as soon as they are available. This can be executed manually or set up automatically.

* Debian can have a steeper learning curve than other distributions, but it is widely regarded as one of the most flexible and customizable Linux distros. The configuration and setup can be complex, but it also provides excellent control over the system, which can be good for advanced users. The more control we have over a Linux system, the more complex it feels to become. However, it just feels that way compared to the options and possibilities we get. Without learning it with the required depth, we might spend way more time configuring “easy” tasks and processes than when we would learn to use a few commands and tools more in-depth. We will see it in the Filter Contents and Find Files and Directories sections.

* Stability and reliability are key strengths of Debian. The distribution is known for its long-term support releases, which can provide updates and security patches for up to five years. This can be especially important for servers and other systems that must be up and running 24/7. It has had some vulnerabilities, but the development community has quickly released patches and security updates. In addition, Debian has a strong commitment to security and privacy, and the distribution has a well-established security track record. Debian is a versatile and reliable Linux distribution that is widely used for a range of purposes. Its stability, reliability, and commitment to security make it an attractive choice for various use cases, including cyber security.


### cmd

> To view the history of all the successful login on your system, simply use the command last. **last**

- To creat a user use **useradd** 

- To change the name of user: **usermod -l 'new name' 'old name'**

- **chage** cmd to see the info about user

- **userdel** to remove user add -r to delete it from hom dir


### Special User Accounts

```
Special user accounts are required to run processes associated with certain services. For example, daemon is a user account that is used to run the daemon service.In special user accounts, the UID value for the users will be less than the default UID value, which is 500. Such special users will not have a home directory. You can create a special user account using the useradd -r {special user name} command.

```

#### The chage Command

```
The chage command is used to change a number of settings that relate to the password and status of the user account.

The syntax of the chage command is chage [options] {username}.

When you run the chage command with no options, it will prompt you to set:

Setting

Purpose

 * Minimum Password Age

The minimum number of days that must pass after the user has changed their password before they are allowed to change it again. The default is 0 which means Minimum Password Age is disabled.

 * Maximum Password Age

The maximum number of days the user may use a password before they must change it. The default is 99999 which is over 200 years. Effectively, this means the Maximum Password Age is disabled.

 * Last Password Change

The date on which the user last changed their password.

 * Password Expiration Warning

The number of days before the Maximum Password Age is reached when the user should be warned that their password is going to expire. This reminds the user to change the password a week before the Maximum Password Age is reached.

 * Password Inactive

This setting indicates whether the password is inactive. The default is -1 which means the password is not inactive. If the value is set to 1, the password is inactive and the account is disabled.

 * Account Expiration Date

The last date the account can be used. After the account expiration date has passed, the account is disabled.

The chage command has some options:

 * Option

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
```

#### The userdel Command:
 
* The userdel command allows you to modify the system account files, deleting all entries that refer to the login of an existing user. However, it will not allow you to remove an account if the user is currently logged in. You must kill any running processes that belong to an account before deleting the account.

The syntax of the userdel command is userdel [options] {username}.

The -r Option
	* The -r option will delete the files in the user’s home directory, along with the home directory itself. Files owned by this user and located in other locations will have to be searched for and deleted manually.

#### The usermod Command:

* The usermod command has options that enable you to modify various user account parameters. You can change a user’s name, default groups, UID, or passwords.

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


#### Lock User Login

* In Linux, you can lock a user’s login to temporarily prevent a user from logging in to a system. This is done by disabling the user’s password using the passwd -l or usermod -L command. The user’s login is usually locked as a security measure, to prevent unauthorized usage when the user is unavailable.

#### Default User Accounts

Numerous user accounts are created by default upon system installation. Some of the main user accounts include the following:

 * root

 * bin

 * daemon

 * ftp

 * sshd

 * nfsnobody

 * apache

 * rpc

 * gnome

- The root User
Every Linux system has at least one system administrator whose job is to maintain the system and make it available to users. This user is the root user. The root user can perform any task on the Linux system without restrictions. System administrators are also responsible for adding new users to the system and for setting up their initial environment.


### BIOS 

#### 1. Boot Process Overview

```
Now that we've gotten a pretty good grasp at some of the important components of Linux, let's piece them altogether by learning about how the system boots. When you turn on your machine, it does some neat things like show you the logo screen, run through some different messages and then at the end you're prompted with a login window. Well there is actually a ton of stuff happening between when you push the power button to when you login and we'll discuss those in this course.

The Linux boot process can be broken down in 4 simple stages:

1. BIOS

The BIOS (stands for "Basic Input/Output System") initializes the hardware and makes sure with a Power-on self test (POST) that all the hardware is good to go. The main job of the BIOS is to load up the bootloader.

2. Bootloader

The bootloader loads the kernel into memory and then starts the kernel with a set of kernel parameters. One of the most common bootloaders is GRUB, which is a universal Linux standard.

3. Kernel

When the kernel is loaded, it immediately initializes devices and memory. The main job of the kernel is to load up the init process.

4. Init

Remember the init process is the first process that gets started, init starts and stops essential service process on the system. There are three major implementations of init in Linux distributions. We will go over them briefly and then dive into them in another course.

There it is, the (very) simple explanation of the Linux boot process. We will go into more detail about these stages in the next lessons.

```

#### 2. Boot Process: BIOS

```
The first step in the Linux boot process is the BIOS which performs system integrity checks. The BIOS is a firmware that comes most common in IBM PC compatible computers, the dominant type of computers out there today. You've probably used the BIOS firmware to change the boot order of your harddisks, check system time, your machine's mac address, etc. The BIOS's main goal is to find the system bootloader.

So once the BIOS boots up the hard drive, it searches for the boot block to figure out how to boot up the system. Depending on how you partition your disk, it will look to the master boot record (MBR) or GPT. The MBR is located in the first sector of the hard drive, the first 512 bytes. The MBR contains the code to load another program somewhere on the disk, this program in turn actually loads up our bootloader.

Now if you partitioned your disk with GPT, the location of the bootloader changes a bit.

UEFI

There is another way to boot up your system instead of using BIOS and that is with UEFI (stands for "Unified extensible firmware interface"). UEFI was designed to be successor to BIOS, most hardware out there today comes with UEFI firmware built in. Macintosh machines have been using EFI booting for years now and Windows has mostly moved all of their stuff over to UEFI booting. The GPT format was intended for use with EFI. You don't necessarily need EFI if you are booting a GPT disk. The first sector of a GPT disk is reserved for a "protective MBR" to make it possible to boot a BIOS-based machine.

UEFI stores all the information about startup in an .efi file. This file is stored on a special partition called EFI system partition on the hardware. Inside this partition it will contain the bootloader. UEFI comes with many improvements from the traditional BIOS firmware. However, since we are using Linux, the majority of us are using BIOS. So all of these lessons will be going along with that pretense.
```

#### 3. Boot Process: Bootloader

```
The bootloader's main responsibilities are:

Booting into an operating system, it can also be used to boot to non-Linux operating systems
Select a kernel to use
Specify kernel parameters
The most common bootloader for Linux is GRUB, you are most likely using it on your system. There are many other bootloaders that you can use such as LILO, efilinux, coreboot, SYSLINUX and more. However, we will just be working with GRUB as our bootloader.

So we know that the bootloader's main goal is to load up the kernel, but where does it find the kernel? To find it, we will need to look at our kernel parameters. The parameters can be found by going into the GRUB menu on startup using the 'e' key. If you don't have GRUB no worries, we'll go through the boot parameters that you will see:

initrd - Specifies the location of initial RAM disk (we'll talk more about this in the next lesson).
BOOT_IMAGE - This is where the kernel image is located
root - The location of the root filesystem, the kernel searches inside this location to find init. It is often represented by it's UUID or the device name such as /dev/sda1.
ro - This parameter is pretty standard, it mounts the fileystem as read-only mode.
quiet - This is added so that you don't see display messages that are going on in the background during boot.
splash - This lets the splash screen be shown.
```

#### 4. Boot Process: Kernel

```
So now that our bootloader has passed on the necessary parameters, let's see how it get's started:

Initrd vs Initramfs

There is a bit of a chicken and egg problem when we talk about the kernel bootup. The kernel manages our systems hardware, however not all drivers are available to the kernel during bootup. So we depend on a temporary root filesystem that contains just the essential modules that the kernel needs to get to the rest of the hardware. In older versions of Linux, this job was given to the initrd (initial ram disk). The kernel would mount the initrd, get the necessary bootup drivers, then when it was done loading everything it needed, it would replace the initrd with the actual root filesystem. These days, we have something called the initramfs, this is a temporary root filesystem that is built into the kernel itself to load all the necessary drivers for the real root filesystem, so no more locating the initrd file.

Mounting the root filesystem

Now the kernel has all the modules it needs to create a root device and mount the root partition. Before you go any further though, the root partition is actually mounted in read-only mode first so that fsck can run safely and check for system integrity. Afterwards it remounts the root filesystem in read-write mode. Then the kernel locates the init program and executes it.
```


#### 5. Boot Process: Init

```
We've discussed init in previous lessons and know that it is the first process that gets started and it starts all the other essential services on our system. But how?

There are actually three major implementations of init in Linux:

    * System V init (sysv)

This is the traditional init system. It sequentially starts and stops processes, based on startup scripts. The state of the machine is denoted by runlevels, each runlevel starts or stops a machine in a different way.

    * Upstart

This is the init you'll find on older Ubuntu installations. Upstart uses the idea of jobs and events and works by starting jobs that performs certain actions in response to events.

    * Systemd

This is the new standard for init, it is goal oriented. Basically you have a goal that you want to achieve and systemd tries to satisfy the goal's dependencies to complete the goal.

We have an entire course on Init systems where we will dive into each of these systems in more detail.
```

#### System Calls

```
Remember Britney in the previous lesson? Let's say we want to see her and get some drinks together, how do we get from standing outside in the crowds of people to inside her innermost circle? We would use system calls. System calls are like the VIP passes that get you to a secret side door that leads directly to Britney.

System calls (syscall) provide user space processes a way to request the kernel to do something for us. The kernel makes certain services available through the system call API. These services allow us to read or write to a file, modify memory usage, modify our network, etc. The amount of services are fixed, so you can't be adding system calls nilly willy, your system already has a table of what system calls exist and each system call has a unique ID.

I won't get into specifics of system calls, as that will require you to know a bit of C, but the basics is that when you call a program like ls, the code inside this program contains a system call wrapper (so not the actual system call yet). Inside this wrapper it invokes the system call which will execute a trap, this trap then gets caught by the system call handler and then references the system call in the system call table. Let's say we are trying to call the stat() system call, it's identified by a syscall ID and the purpose of the stat() system call is to query the status of a file. Now remember, you were running the ls program in non-privilege mode. So now it sees you're trying to make a syscall, it then switches you over to kernel mode, there it does lots of things but most importantly it looks up your syscall number, finds it in a table based on the syscall ID and then executes the function you wanted to run. Once it's done, it will return back to user mode and your process will receive a return status if it was successful or if it had an error. The inner workings of syscalls get really detailed, I would recommend looking at information online if you want to learn more.

You can actually view the system calls that a process makes with the strace command. The strace command is useful for debugging how a program executed.
```
> $ strace ls **view the system calls that a process makes**

> $ lsmod **View a list of currently loaded modules**


### Services

* Services
A Linux service is an application or set of applications that perform tasks in the background. The services running on a Linux system range from basic services to server services. Services can be broadly classified as critical services and noncritical services. Critical services are the core services that are vital for the functioning of the Linux system. Noncritical services are services that are initiated by applications installed on the system.


* The service Command
The service command allows you to manage services running on your system. The syntax of the service command is:**service {service name} {options}**.


* Daemons
A daemon is a program that runs in the background without the need for human intervention, often handling commands delivered for remote command execution. It lies dormant until an event triggers it into activity. Some daemons operate at regular intervals. Most daemons are started when the system boots. Daemons are started by the operating system, by applications, or manually.

There are slight differences between services and daemons, but in practice they are usually the same thing. The term “service” is the only word used to describe these background applications in Microsoft Windows. The term “daemon” is exclusively used in Unix and Linux.


* lpd
The Line Printer Daemon, or lpd, controls the flow of print jobs to a printer. It works in the background and sends the output to the printer without affecting other processes that a user is working on at that time.


* Init and Runlevels

    - Init is the first process run on boot and is responsible for managing the runlevel of your system. The init is the system and session manager. In Ubuntu, the init is called the Upstart Init Daemon.

    - The runlevel specifies the group of processes that are started, stopped, and otherwise managed on Linux systems. You can change the current runlevel by using the telinit command.


Init and Systemd Runlevels Table
The following table describes the processes that can run at each init level.

* SysVinitRunlevel

```
Systemd Target 


0 

poweroff.target

Halts the system 

1 

rescue.target

Single-user mode 

2 

multi-user.target

Multiuser mode without networking 

3 

multi-user.target

Multiuser mode with networking 

4 

multi-user.target

User configurable 

5 

graphical.target

Used for the GUI (X11 multiuser mode) 

6 

reboot.target

Reboots the system
```

* The Upstart Init Daemon
The Upstart Init Daemon is event-based rather than runlevel-based. Event-based means that jobs will be automatically started and stopped by changes to the system’s state. The Upstart Init Daemon doesn’t track runlevels. Runlevels are tracked by the runlevel event generated by telinit or shutdown. The init daemon sets two environment variables from the runlevel event: RUNLEVEL and PREVLEVEL. These environment variables are the current runlevel and the previous runlevel. Upstart’s list of configuration files is located in the /etc/init directory.


* The Systemd Init Daemon
Systemd is a system and session manager used in some distributions of Linux, including Ubuntu. Its job is to start the rest of the system. If daemons and services were instruments in an orchestra, systemd would be the conductor.


* The systemctl Command
The systemctl command enables control over the Systemd Init process. You can view running services, manage (enable/disable) services to run at boot or in the current session, determine the status of these services, and manage the system runlevel. 

The syntax of the systemctl command is: 
> $ systemctl [options] [command]


#### Restarting a Suspended Job

* The bg command, with the syntax **bg {%#}** (where # is the job number) can be used to restart a specified background job that has been suspended. If there is only one job running in the background, then you do not have to specify the number. You can type bg % to restart it.

#### Bringing a Job to the Foreground

* If you need to bring a job from the background to the foreground, use the fg command, with the syntax fg {%#}(where # is the job number). You do not have to enter a number after the percent sign if there is only one job running in the background.

> kill {%job number} "Terminate the specified process."

#### ps command 

* The ps commnd supports several options. Some of the important options are listed here.

* Description 

```
a 

Lists all user-triggered processes. 

-e 

Lists all processes. 

-l 

A job that is killed. Lists processes using a long listing format. 

u 

Lists processes along with the user name and start time. 

r 

Excludes processes that are not running currently. 

x 

Includes processes without a terminal. 

T 

Excludes processes that were started by any terminal other than the current one. 

-U {user name}

Display the processes based on the specified user.

-p {PID}

Display only the specified process associated with the PID.

-C {command}

Display all processes by command name.

--tty {terminal number}

Display all processes running on the specified terminal.
```

> The **pstree** command enables you to list the processes running on a Linux system in a tree-like format.

> pidof[options] {string}

    * Displays the PID of the process whose name is specified and can be used only when the name of the process is known. However, it is recommended that a full path name of the process be given because more than one process could run with the same name. The syntax of this command is pidof[options] {string}. 

> pgrep[options] {process name}

 * Displays the PID of processes that match any given criteria such as the name or UID of the user who invoked it, the start time, the parent PID, and so on. 

#### Signals

* Signals are messages sent to a process to perform certain actions. They are used to suspend or terminate processes. Signals may affect only the process specified and its child processes. Signals may be executed, caught, blocked, or ignored by processes. 

#### kill Commands

* Different commands are used to send signals to processes to end or “kill” them.

- kill 

Sends any specified signal, or by default the termination signal, to one or more processes. The PID must be specified as the argument. The syntax of this command is kill[options] {PID}. 

- pkill

Signals processes based on the name and other identifiers as in the pgrep command. The syntax of this command is pkill[options] {command}. 

- killall

- Kills all processes by the name specified. The syntax of this command is killall[options] {command}. 

> Note: The kill command accepts either the PID or the job number as an argument. So, this command can also be used as a job control tool.


* Kill Signal Options
You can either use the kill signal option or its corresponding numerical value to send a signal to terminate a process. The following table lists the most frequently used kill signal options and their description.

- SIGKILL or 9 

    Send the kill signal to a process. 

- SIGTERM or 15 

    Send the termination signal to a process. 

- SIGSTOP or 19 

    Stop a process.

* Using the PID Number to Terminate Processes
You can use the kill command with the process table to end processes. By entering kill followed by the PID, you can terminate specific processes. 

* When you use the kill command with the jobs table, you are working only with the jobs that you started. However, the process table may display processes that do not belong to you. As a user, you can use the kill command only with processes that you own. As root, you can kill anyone’s processes.

* There are many options available with the kill command. These options are referred to as kill signals. Some processes cannot be eliminated by the kill command. To terminate these processes, **use the kill command with the -9 signal.** This terminates the processes immediately.

> $ top command lists all tasks running on a Linux system. 

> $ The nice command allows you to assign a priority level to a process. 

> The renice command enables you to alter the scheduling priority of a running process.

#### Delayed and Detached Jobs

* Delayed and detached jobs are job processes that enable users to put off the start of a job.


* Delayed Jobs
A delayed job is one that can be run at some specified time after you issue the command. For example, a CPU-intensive job that can slow down the system is one that you may want to delay for off-peak work hours.


* Detached Jobs
A detached job is a job that can be set to run after you log out of the system. For example, a task that will not be completed until after you leave can be set to continue running after you log out of the system.

* To delay the start of a job, use the sleep command followed by the delay in seconds and the command name. The sleep command suspends any action upon the specified command for the specified number of seconds and then the command specified is executed. The delay can be up to 2,147,483,647 seconds. This is roughly 596,523 hours; 24,855 days; or 68 years so that the amount of time can easily be customized. You may also use the at command to run a command at a specified date and time.


> The **nohup** Command
The nohup (no hangup) command tells a program to ignore the hangup signal that was sent while disconnecting. The nohup.out file stores the output of the nohup command, which will normally be displayed on the terminal.

* If you have a task that cannot be completed until after you leave work, or if you have a task that is CPU-intensive and may slow the system, you can start the task before you leave and specify that it continues even after you log out of the system. You can do this by using the nohup (no hangup) command. The nohup command should run in the background so that it does not tie up your terminal. To enable a command to run in the background after you have logged out, use the syntax **nohup [command] &**.


* The screen Command
* The GNU screen command is a full-screen window manager that multiplexes a physical terminal between several processes, typically interactive shells. The screen command is another way that you can leave work running after you leave the system, which can then be resumed at a later point by reconnecting to your active screen session.

* If you have a task that cannot be completed until after you leave work, or if you have a task that is CPU-intensive and may slow the system, you can start the task before you leave and specify that it continues even after you log out of the system. You can do this by using the screen command. The screen command will continue to keep the interactive shell open and run your program in the background so that it does not tie up your terminal. When you next connect to your server, you can restore the active screen session via the screen -r command.

> Note: The screen command is not installed by default. To install it, use the sudo apt-get install screen command.


#### Cron

* Cron is a daemon that runs in the background on a Linux system and executes specified tasks at a designated time or date. Cron is normally used to schedule periodically executed tasks defined in the crontab file.


> The syntax of the cron daemon is **cron [option] {mail command}**.


* If you want to run a shell script for a frequency other than hourly, daily, weekly, or monthly, you need to place the script in the **cron.d directory.

* The format of a crontab entry is: **{minute} {hour} {day of month} {month} {day of week} {user command}**. 

```
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.daily; }
47 6    * * 7   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.weekly; }
52 6    1 * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.monthly; }
```

#### The tmpreaper Command
* The tmpreaper command can be run as a daily cron job that is used to delete files, such as the files in the /tmp directory, which have not been accessed for some time and are utilizing disk space. 

The syntax of the tmpreaper command is tmpreaper [options] {hours}.

The tmpreaper command has the following options.

Enables You To 

-c 

Delete files according to the time they were created or the permissions were changed. 

-m 

Delete files according to the time they were modified. 

-a 

Remove all file types, including directories. 

-f 

Remove files forcefully, overriding all access regulations. 

--showdeleted

Show what files and directories are deleted. 


#### The logrotate Command

* The logrotate command is run as a daily cron job that is used to compress, delete, or mail log files. It may be configured to run on a weekly or monthly basis depending on the log size. The configuration file for logrotate is /etc/logrotate.conf. 

The logrotate command has the following options.


Enables You To 

-d 

Turn on debug mode to disable any change from being made to the logs. 

-f 

Force log rotation by deleting old files irrespective of their importance and create new ones. 

-m {subject} {recipient} 

Mail the logs to the recipient. The default syntax is /bin/mail -s. 

Most Linux applications and commands store their log files in the /var/log directory. This is frequently where log files and their archives are managed, rotated, and archived.


#### The logwatch Utility

* The logwatch utility is run as a daily cron job that is used to monitor logs. It is fully customizable via the /etc/logwatch/conf/logwatch.conf file. The utility searches logs and reports suspicious messages, and enables you to set detail levels for reports. 10, 5, and 0, correspond to high, medium, and low level details, respectively.

The logwatch command may not be installed by default. In that case, you can use the command sudo apt install logwatch to install it.

The logwatch utility has the following options.

Enables You To 

--detail {level} 

Set the detail level of the log report. 

--print 

Print the report generated by the command. 

--range {range} 

Set the range for analysis. It can accept any value among 

--mailto {address} 

Mail the results to the recipient's mail ID. 

save {file name} 

Save the output to a file instead of displaying it.

#### System crontab Files

* System crontab files are the configuration files for the cron utility. They are stored in the /etc/crontab file. The name of the user running the command is indicated in the sixth field of the file. When you create a crontab entry for a specific user, the sixth field contains the command that needs to be run at the specified time. System crontab files can be edited by the root user.


* User crontab Files
In addition to system-level cron jobs, individual users can schedule cron jobs. Unlike the system- level crontab, users have their own crontab files. The format of entries in this file is the same as that of the system-level crontab, with the exception of the user field. Because the entire crontab file is dedicated to a single user, the user field is not included. While the /etc/crontab file can be edited directly, user crontab files are best edited via the crontab utility.


#### The at Command
The at command executes a given set of commands at a specified time. This command is useful for executing a set of commands only once. Using either the -f option or input redirection, the at command reads the list of commands from a file. This file needs to be an executable shell script. 

The syntax of the at command is at [options] {time}.

The following table lists some frequently used at command options and their descriptions.

Option

Enables You To 

atq

Display the job queue of all users except the superuser. 

atq -V 

Display the version number. 

at -q [a-z] 

Display the jobs in the specified queue. 

at -m 

Send mail to the user when the job is complete. 

at -f {file name} 

Read the job from the file rather than the standard input. 

at -l 

Print all the jobs queued for the user. 

at -v 

Display the time that the job will be executed before reading the job.

If the at command is not installed, you can use the sudo apt install at command to install it.


Specifying Time Using the at Command
There are a number of common time formats. Some of the common time formats in which you can schedule a job are given in the following table.

Time Format 

Description 

HH:MM A.M. or HH:MM P.M. 

Specifies the hour and minute. 

MMDDYY or MM/DD/YY or DD.MM.YY 

Specifies the day, month, and year. 

JAN or FEB or MAR 

Specifies the month. 

SUN or MON or TUE 

Specifies the day of the week.


#### Anacron

* Anacron is a daemon that executes jobs at intervals, which are specified in days, without requiring the system to be running continuously. Anacron is used to control the execution of daily, weekly, or monthly jobs.

The /etc/anacrontab file is the configuration file for the anacron utility. This file has four fields. The first field displays the number of days the job has not been run, the second field displays the time after which the job has to be run (after reboot), the third field displays the job identifier, and the fourth field displays the job to be run by the anacron utility.


### LVM

* The underlying physical storage unit of an LVM logical volume is a block device such as a partition or whole disk. This device is initialized as an LVM physical volume (PV).
To create an LVM logical volume, the physical volumes are combined into a volume group (VG). This creates a pool of disk space out of which LVM logical volumes (LVs) can be allocated.

> A logical volume is used by file systems and applications (such as databases).

#### Lighttpd 

* (prescribed pronunciation: **"lighty"**) is an open-source web server optimized for speed-critical environments while remaining standards-compliant, secure and flexible.


* The Network Time Protocol (NTP)
Network Time Protocol (NTP) is a standard Internet protocol for synchronizing the internal system clock with the true time or the average time on a number of high accuracy clocks around the world. NTP is used for transmitting and receiving time on Transmission Control Protocol/Internet Protocol (TCP/IP) networks. NTP is also used to set the clock of one computer to match that of another and synchronize it with the network clock.


#### Starting and Stopping Linux

*  Type **runlevel** and press Enter to verify that you’re in **single-user mode**. Verify that the command shows 5 1, which indicates that we were previously at runlevel 5 and are now at runlevel 1. (To return to the default graphical target, which is runlevel 5, you could enter **systemctl isolate graphical** or you could use the **telinit 5** command.)

* To reboot the computer immediately, type **shutdown -r now** and press Enter.

#### Changing the Hostname

> sudo hostnamectl set-hostname **<new_hostname>**

#### Group Management

> groupadd : creates a new group.
> gpasswd -a : adds a user to a group.
> gpasswd -d : removes a user from a group.
> groupdel : deletes a group.
> groups : displays the groups of a user.
> id -g : shows a user’s main group ID.
> getent group : displays a list of all users in a group.

#### kill job

> to kill a job use **kill %'Nunber of job'**

> You want to move the job to sleep for 250 seconds to the foreground. Type fg %'Number of proc' and press Enter

> You want to restart the suspended job. Type bg %'Number of proc' and press Enter.

> To terminate the process running the sleep command, type kill [PID] where [PID] is the PID noted earlier.

> To view all processes run by users, type ps xl | less 


### File Systems

* File Systems
    A file system is a method that is used by an operating system to store, retrieve, organize, and manage files and directories on mass storage devices. A file system maintains information, such as the date of creation and modification of individual files, their file size, file type, and permissions. It also provides a structured form for data storage. A file system by itself does not interpret the data contained in files because this task is handled by specific applications. File systems vary depending on several parameters, such as the purpose of the file systems, the information they store about individual files, the way they store data, and data security.


* File System Labels
    File system labels are assigned to file systems for easy identification. The labels may be up to 16 characters long and can be displayed or changed using the e2label command.

The syntax for setting file system labels is e2label /dev/{device name}{partition number} {label name}. They can also be set using the tune2fs -L {volume label} {device} command.


* File System Types
    Linux supports many common file system types. Some are described in the following table.

- ext2 
    This used to be the native Linux file system of some of the previous releases. It is still supported in the current releases of Linux.

- ext3 
    This is an improved version of ext2. In case of an abrupt system shutdown, ext3 is faster in recovering data and better ensures data integrity. You can easily upgrade your file system from ext2 to ext3. 

- ext4 
    The newest default file system for Linux distributions. It is backwards- compatible with the ext2 and ext3 file systems. Among ext4’s improvements over ext3 are journaling, support of volumes of up to one exbibyte (EiB), and files up to 16 TiB in size. Ext4 is the default filesystem for CentOS/RHEL 7 and Ubuntu installations. 

- XFS 
    This is a 64-bit, high-performance journaling file system that provides fast recovery and can handle large files efficiently. XFS is the default file system for CentOS/RHEL 7 installations. 

- ReiserFS
    This can handle small files efficiently. It handles files smaller than 1K and is faster than ext2 and ext3. If appropriately configured, it can store more data than ext2. 

- vfat
    This is a 32-bit file system and supports long file names. It is compatible with the FAT file system of Microsoft Windows XP and Microsoft Windows NT.

- JFS
    This is a 64-bit journaling file system that is fast and reliable. It is better equipped to handle power failures and system crashes. 

- swap
    This is not a true file system, but rather is a portion of the hard disk that is used in situations when Linux runs out of physical memory and needs more of it. Linux pushes some of the unused files from RAM to “swap” to free up memory. 

- ISO 9660
    This is a file system standard defined by the International Organization for Standardization (ISO), and is also called a CDFS (Compact Disc File System). Linux allows you to access DVDs and CDs that use this file system. 

- btrfs (Better FS) 
    This is a modern copy on write (CoW) file system for Linux aimed at implementing advanced features while also focusing on fault tolerance, repair, and easy administration. btrfs is licensed under the GPL. 


* Access to Other File Systems
    Linux allows you to access other file systems and mount them when required. However, you cannot install Linux on these file systems.

* File System 

- FAT 
    The FAT (File Allocation Table) file system is compatible with different operating systems, including all versions of Windows, MS-DOS, and UNIX. It is primarily used for formatting floppy disks.

- NTFS
    NTFS (New Technology File System) is the recommended file system for Windows-based computers. NTFS provides many enhanced features over FAT or vfat, including file- and folder-level security, file encryption, disk compression, and scalability to very large drives and files. 

### Partitions

* Partitions
    A partition is a section of the hard disk that logically acts as a separate disk. Partitions enable you to convert a large hard disk to smaller manageable chunks, leading to better organization of information. A partition must be formatted and assigned a filesystem before data can be stored on it. Partitions are identified using a partition table, which is stored in the boot record. The partition table can contain entries for a maximum of four primary partitions. The size of each partition can vary but cannot exceed the total free space of the hard disk.


* Hard Disk Size Specification
    Before proceeding with the installation process, you need to plan the hard disk layout based on your requirements. Each partition has a recommended size specification. The following table lists the recommended size specification for partitions.

* Partition 

**Recommended Size**

/ 

Minimum 1 GB. 

/boot

100 MB. 

swap 

Double the RAM size. 

/var

Minimum 250 MB. If the possibility of the installation of many applications exists in the future, allocate the appropriate size. 

/home

Varies based on the number of users. 


* Disk Partitioning
    Most operating systems, including Linux, use disk partitions. Data of different types can be stored in separate locations on the hard disk. The partition size can be specified by a user. However, the filesystem size must be considered before specifying the partition size. Disk partitioning enables the user to separate system files from user accessible ones. Corrupted partitions do not affect the other partitions, and they can be recovered separately.

* Partition Type 

* Primary 
    A disk partition that can contain one filesystem or logical drive and is sometimes referred to as volumes. A maximum of four primary partitions are allowed. The swap filesystem and the boot partition are normally created in a primary partition. 

* Extended 
    An extended partition can contain several filesystems, which are referred to as logical disks or logical drives. There can be only one extended partition, which can be further subdivided. This partition type does not contain any data and has a separate partition table. 

* Logical 
    A part of a physical disk drive that has been partitioned and allocated as an independent unit and functions as a separate drive. A logical partition is created within an extended partition. There is no restriction on the number of logical partitions, but it is advisable to limit it to 12 logical partitions per disk drive.


### Mount Points
    
* A mount point is an access point to information stored on a local or remote storage device. The mount point is typically an empty directory on which a filesystem is loaded, or mounted, to make the filesystem accessible to users. If the directory already has content, the content becomes invisible to the users until the mounted filesystem is unmounted.

- Note: You can use the /etc/fstab file to list the filesystem to be mounted and unmounted when the Linux system boots and shuts down, respectively.


* The mount Command
    - In Linux, a file system cannot be accessed directly. It has to be associated with a directory to make it accessible to users. This association is brought about by loading, or mounting, the filesystem in a directory by using the mount command. After using the file system, it needs to be disassociated from the directory by unloading, or unmounting, the file system using the umount command.

You can specify various mount options for a filesystem.

Option

Enables You To

auto

Specify that the device has to be mounted automatically.

noauto

Specify that the device need not be mounted automatically.

nouser

Specify that only the root user can mount a device or a filesystem.

user

Specify that all users can mount a device or a filesystem.

exec

Allow binaries in a filesystem to be executed.

noexec

Prevent binaries in a filesystem from being executed.

ro

Mount a filesystem as read-only.

rw

Mount a filesystem with read and write permissions.

sync

Specify that input and output operations in a filesystem should be done synchronously.

async

Specify that input and output operations in a filesystem should be done asynchronously.

### ATAPI

- AT Attachment Packet Interface (ATAPI) is a protocol for controlling mass storage devices. ATAPI provides commands that are used for hard disks, CD-ROM drives, tape drives, and other devices.


### File System Maintenance Commands------------------------------------------------------------------------------------------------------

> `sudo fdisk -l /dev/sda "show disck info"`

> `The fsck Command`

* The fsck command is used to check the integrity of a file system. File system integrity refers to the correctness and validity of a file system. Most systems automatically run the fsck command at boot time so that errors, if any, are detected and corrected before the system is used. File system errors are usually caused by power failures, hardware failures, or improper shutdown of the system.

Note: The fsck command is similar in concept to the chkdsk and scandisk commands you may be familiar with from DOS and Windows-based systems.

The syntax of the fsck command is fsck -t {filesystem type} [options].


Repair File Systems
You can use the fsck -r/dev/{filesystem} command to repair a file system. The command will prompt you to confirm your actions. If you are simultaneously checking multiple file systems, you should not use this option because it allows you to repair only a single file system at a time.


The e2fsck Command
The e2fsck command allows you to check ext2, ext3, and ext4 file systems, and is identical to running the fsck command with ext2, ext3, or ext4 specified as the file system type. You need to unmount the file system before running the e2fsck command to prevent damage to the file system.

The syntax of the e2fsck command is e2fsck /dev/{filesystem}.


The xfs_repair Command
The xfs_repair command allows you to check an XFS file system. As with the fsck and e2fsck commands, you need to unmount the file system before running the xfs_repair command to prevent damage to the file system.

The syntax of the xfs_repair command is xfs_repair [options]/dev/{filesystem}.


The tune2fs Utility
The tune2fs utility helps tuning parameters associated with a Linux file system. Using this utility, a journal can be added to an existing ext2 or ext3 file system. If the file system is already mounted, the journal will be visible in the root directory of the file system. If the file system is not mounted, the journal will be hidden. The tune2fs utility is available with most Linux distributions.


Tunable Parameters
Using the tune2fs utility, you can adjust the parameters of the extended file systems, such as ext2, ext3, and ext4, that can be tuned on a Linux machine even after installation. Tunable parameters allow you to remove reserved blocks; alter reserved block count; and specify the number of mounts between checks, the time interval between checks, and the behavior of the kernel code, among others.

The syntax of the tune2fs utility is tune2fs [options] {device name}.

The tune2fs utility has various options.

Use This Option

To Do This

-j {partition}

Convert the existing file system to an ext3 file system.

-id|m|w

Specify the maximum time interval between file system checks in days, months, or weeks.

-c maximum mounts count

Specify the maximum number of mounts between file system checks.

-C mount count

Specify the number of times the file system can be mounted.

-r reserved blocks count

Specify the number of reserved file system blocks.

-e continue|remount-ro|panic

Specify the behavior of the kernel code, whether the file system should continue with normal execution, remount the file system in read-only mode, or cause a kernel panic, when errors are detected.

-l

List the contents within the superblock of the file system.

-U UUID

Set the specified Universally Unique Identifier (UUID) for the file system.


The xfs_admin Command
The xfs_admin command allows you to manage the parameters of an XFS file system. As with the tune2fs command, you need to unmount the file system before using the xfs_admin command to change parameters.

The syntax of the xfs_admin command is xfs_admin [options] /dev/{filesystem}.

The dumpe2fs Utility

The dumpe2fs utility is used for managing ext2, ext3, and ext4 (extended) file systems. It dumps the status of the extended file system onto the standard output device and prints the block group information for the selected device.

The syntax of the dumpe2fs command is dumpe2fs [options] [block size] {device name}.

The dumpe2fs utility has various options.

Option

Enables You To

-l

Print a detailed report about block numbers in the file system.

-b

Print the bad blocks in the file system.

-f

Force the utility to display the file system status irrespective of the file system flags.

-i

Display file system data from an image file created using the e2image utility.


The debugfs Utility
The debugfs utility allows you to examine and modify ext2, ext3, and ext4 file systems. When executed, the debugfs utility opens an interactive shell that can be used to examine and modify the extended file system.

The table provides some common commands supported by the debugfs utility in the interactive shell.

If You Need To

Use This Command

Open a file system

Convert the existing file system to an ext3 file system.

Close the file system

close

View the file system information

stats

Find a free block

ffb


xfs Tools
There are many xfs tools that allow you to work with the XFS file system.

xfs Tool

Enables You To

To remove the prior mount points, type sudo rmdir /morning /evening and press Enter.

