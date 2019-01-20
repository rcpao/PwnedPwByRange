# PwnedPwByRange

Bash shell script to "Check if you have an account that has been compromised in a data breach" via https://haveibeenpwned.com/API/v2#SearchingPwnedPasswordsByRange

WARNING: Make sure you disable shell history before running this or your passwords will be stored in your command line history.  For bash, run: 'set +o history'

Here is an example run for the password "123456" returning 23174662 occurrances:

```
$ set +o history
$ ./PwnedPwByRange.sh 123456
+ '[' 123456 == '' ']'
++ echo -n 123456
++ /usr/bin/sha1sum
++ cut -c 1-40showing
+ SHA1PW=7c4a8d09ca3762af61e59520943dc26494f8941b
++ echo 7c4a8d09ca3762af61e59520943dc26494f8941b
++ cut -c 1-5
+ HashHead=7c4a8
++ echo 7c4a8d09ca3762af61e59520943dc26494f8941b
++ cut -c 6-
+ HashTail=d09ca3762af61e59520943dc26494f8941b
++ mktemp
+ TMPFILE=/tmp/tmp.q2sILGOxqQ
+ curl https://api.pwnedpasswords.com/range/7c4a8
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 20124    0 20124    0     0   108k      0 --:--:-- --:--:-- --:--:--  108k
+ grep -i d09ca3762af61e59520943dc26494f8941b /tmp/tmp.q2sILGOxqQ
D09CA3762AF61E59520943DC26494F8941B:23174662
```
