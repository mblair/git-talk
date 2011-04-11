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
* Made up of commits that point to trees that contain blobs and possibly more trees

!SLIDE
# Objects #

!SLIDE bullets incremental
# Blobs #

* Contain file contents
* **Only** file contents
* These represent the leaves of the trees
* Immutable

!SLIDE bullets incremental
# Immutability #

* Filesystems need to support copying
* Git stores the same content **once**

!SLIDE
# How does it store content? #

!SLIDE bullets incremental
# Ruby #

* (cue demo)

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
# Commits #

* Contain **trees**, and their associated **blobs**
* Can be referred to by **refs**
* Popular ref: `HEAD`
* Another: `master`

!SLIDE code
	@@@sh
	git rev-parse HEAD
	git cat-file -t HEAD
	git cat-file commit HEAD
	git ls-tree HEAD
	git ls-tree [tree sha from cat-file commit]
	find .git/objects -type f | sort
	git cat-file -t [each previous sha]

!SLIDE bullets incremental
# Trees #

* Contain blob metadata & subtrees.
