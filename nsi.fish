function nsi --argument package
	if test -n "$package"
npm install --save $package
else
echo 'Inproper argument, must select package to install...'
end
end
