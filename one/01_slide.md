!SLIDE
# Git Internals & Tricks #
# 4/11/11 #

!SLIDE bullets incremental
# Matt Blair #

* Started with hg
* Used hg-git constantly
* ^ don't do this.
* Switched to Git
* <3 Git

!SLIDE bullets incremental
# Survey #

* How many of you use version control?
* How many use **distributed** version control?
* How many use **Git**?

!SLIDE bullets incremental
# Storage #

* Similar to a UNIX filesystem
* Duh, because Linus wrote it.
* Made up of trees that contain subtrees and leaves

!SLIDE
# Units #

!SLIDE bullets incremental
# Blobs #

* Contain file contents
* **Only** file contents
* These are the leaves
* Immutable

!SLIDE bullets incremental
# Immutability #

* Filesystems need to support copying
* Git stores the same content **once**

!SLIDE
# How does it store content? #

!SLIDE
# Ruby #

!SLIDE
# Git #

!SLIDE code
	@@@sh
	echo "Hi LUGSB!" > greeting
	git hash-object greeting

	git init
	git add greeting
	git commit -m 'initial'

	git cat-file -t [sha]

	git cat-file blob [sha]

!SLIDE bullets incremental
# Trees #

* Contain blob metadata & subtrees.


