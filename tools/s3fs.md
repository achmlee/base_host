# S3FS Install (Last Updated: 2023.09.04)

* FUSE (Filesystem in Userspace) based files system.
* Avoid bucket names with dots.

```
$ sudo apt install s3fs 

$ sudo mkdir /mnt/s3-mount

# Create /etc/passwd-s3fs (Permissions 600)
# Contents [ACCESS_KEY]:[SECRET_KEY]

# Example:
$ sudo s3fs <BUCKET_NAME> /mnt/s3-mount
$ sudo s3fs mrmikelee-dojj /mnt/s3-mount

# Make available at boot time. Add to /etc/fstab file.
# allow_other: Gives other users access to the mount.sudo apt install s3fs
s3fs#<BUCKET_NAME> /mnt/s3-mount/ fuse _netdev,allow_other,passwd_file=/etc/passwd-s3fs 0 0

$ Test fstab
findmnt --verify --verbose
```
