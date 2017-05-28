function md --argument flag1 flag2 flag3 flag4 newdir file1 file2 file3 file4 file5 file6 file7 file8
	mkdir $newdir
cd $newdir
for $flag in $argv
switch "$flag"
case -g --git
git init
case -n --npm
npm init -y
case -w --web
touch index.html index.js styles.css
case -f --files
for file in $argv
touch $file
end
end
end
end
