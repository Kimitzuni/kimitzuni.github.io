#!/bin/bash

for i in $(find | grep 'php'); do
	PHP_Source="$i"
	HTML_Dest="$(echo "$i" | sed 's/.php/.html/')"

	printf "Creating \033[1;96m$HTML_Dest\033[0m\n"
	php $PHP_Source > $HTML_Dest
done

rm navbar.html global-head.html -f
