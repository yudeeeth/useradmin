# useradmin
Delta task 1 (remake) along with subtask 2 from task 2
### Tl;dr
### Without Docker
1. Please don't.
### With Docker
1. Build the image using

> docker build . -t <some_random_name>

2. Run the container.

> docker run -it <the same_random_name>

3. Once inside the container, blast of with the aliases.

> userGenerate
> permit
> autoSchedule
> attendance
> nearest
> finalattendance

4. record will only work when su into a troop leader.

> record 4

5. The above command will not give any any output, coz this thing hasnt been running for a week yet,
you can timeslip the program by using  

> ./updateweek.sh

from the /root/userad/ directory as root, now since you timeslipped into next week, you can use record n. (where n 0-7).
If no N is given, it will cat the whole of lastweek's attendance.

### My thoughts
Though the previous version of this task was reviewed and i was told i could use groups alone to give permissions to troop leaders,
i still stuck to ACL because i think it feels a lot cleaner with acl.
##### Additional comments about algorithm used in nearest.sh
I ve used ideas from insertion sort to put back elements into the group. Though the worst case time complexity is the same as selection sort, its best case is better than selection. 
The time complexity of my algorithm is O(kn) where k is 10.

### Task Checklist
- [x] Maintask
- [x] Create accounts and home directories for the following users in the given formats (alias - userGenerate):
ChiefCommander
ArmyGeneral, NavyMarshal and AirForceChief
50 soldiers under each category named in the format: Army1 to Army50, Navy1 to Navy50, and Airforce1 to AirForce50.
- [x] Assign them permissions as follows (alias - permit):

The chief commander can access and modify any directory.
The troop chiefs can access and modify any directory of their own troops and their own directory as well.
The soldiers can only access and modify their own directories.
Troop chiefs should not be able to access or modify any other troop chief's, any other troop soldier’s, or the chief commander's directory.
- [x] You have been given a log file with time-stamps, username and the duty positions allotted to each soldier (position.log). Write a script for the following sub tasks (alias - autoSchedule):

Create a text file named post_allotted in each soldier's home directory.
Each file should have a table with 2 columns: Date and Post.
Every day at 12 am there should be a scheduled update in each soldier’s table with their respective post for the next day.
- [x] Every day each soldier has to report at the post allotted to them. You are given an attendance log of whether the soldier was present. Write a script to automate the given sub tasks (alias - attendance):

Create a text file in every troop chief’s home directory named attendance_record.
This file should have a table with soldiers who were present at the posts allotted to them.
This file should automatically update every morning at 6 am. You have been given another log file with the attendance record. (attendance.log)
- [x] Develop a script for each troop chief to fetch the attendance records of a day in a week (alias – record):

For example, if the troop chief types "record 4" the script will show the attendance records of the 4th day of the previous week, that is Thursday. Set up the script to handle the variable accordingly.
- [x] Hacker Mode
- [x] The Chief Commander, who is in Delhi (28.7041° N, 77.1025° E), has to submit a report to the Ministry of defence every day. Write a script to automate the following tasks.

(alias - finalattendance):

- [x] Create a file named attendance_report in the Chief Commander’s home directory with a table having each troop's attendance records along with the corresponding dates.
(alias – nearest):

- [x] Create a file named nearest10 in the Chief Commander’s home directory.
The file should have a table containing the usernames of 10 army soldiers who had their allotted posts nearest to Delhi from the total list of those who were present, as well as the dates when they were posted there. Develop a suitable algorithm for it.
### Task 2 subtask 2 checklist
- [x] Sub task 2

- [x] Create a Dockerfile to handle all the scripts

- [x] Using Ubuntu as the base image, copy all the scripts to the appropriate locations and run them accordingly

- [x] Execute the alias.sh script inside the container

- [x] The result of this should be that of the first task, and the only difference would be that everything, including the aliases and crontasks, are inside the container.

### Important Note
My setpermi**sss**ions.sh has 3 s's in it
NavyMarshall is called as **NavyMarsall**
I could change this, but I kind of like it this way
