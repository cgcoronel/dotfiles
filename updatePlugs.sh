find plugged -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull \;
