### B2B


#### Debian

* Debian is a widely used and well-respected Linux distribution known for its stability and reliability. It is used for various purposes, including desktop computing, servers, and embedded system. It uses an Advanced Package Tool (apt) package management system to handle software updates and security patches. The package management system helps keep the system up-to-date and secure by automatically downloading and installing security updates as soon as they are available. This can be executed manually or set up automatically.

* Debian can have a steeper learning curve than other distributions, but it is widely regarded as one of the most flexible and customizable Linux distros. The configuration and setup can be complex, but it also provides excellent control over the system, which can be good for advanced users. The more control we have over a Linux system, the more complex it feels to become. However, it just feels that way compared to the options and possibilities we get. Without learning it with the required depth, we might spend way more time configuring “easy” tasks and processes than when we would learn to use a few commands and tools more in-depth. We will see it in the Filter Contents and Find Files and Directories sections.

* Stability and reliability are key strengths of Debian. The distribution is known for its long-term support releases, which can provide updates and security patches for up to five years. This can be especially important for servers and other systems that must be up and running 24/7. It has had some vulnerabilities, but the development community has quickly released patches and security updates. In addition, Debian has a strong commitment to security and privacy, and the distribution has a well-established security track record. Debian is a versatile and reliable Linux distribution that is widely used for a range of purposes. Its stability, reliability, and commitment to security make it an attractive choice for various use cases, including cyber security.


#### 

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

 
