function ndi --argument package
	if test -n "$package"
npm install --save-dev $package
else
echo 'Inproper argument, must select package to install...'
end
end
