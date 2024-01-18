#!/bin/bash
#
# This script just creates a blank blog post that I can then write in.
# 
# This has also got to be one of the worst ways of doing this that I could possibly
# imagine. There's probably a more efficient way.

##
## VARIABLES
##
DateFormat="$(date +'%-d_%-m_%Y')"
BlogDateFormat="$(date +'%A, %-d %B, %Y')"
BlogEntryFormat="$(date +'%-d %B, %Y')"

##
## FUNCTIONS
##
create() {
	printf "Blog Title: "
	read BlogTitle

	printf "Blog Description: "
	read BlogDescription

	BlogFileName="$(echo "${DateFormat}__${BlogTitle}.html" | tr ' ' '_')"

	printf "<li><a href=\"$BlogFileName\">$BlogTitle</a></li>" | xclip -i -selection clipboard
	printf ">>> Add the following to \033[1;96mblog/index.html\033[0m:\n"
	cat << EOF

<li><b>$BlogEntryFormat</b> &mdash; <a href="blog/$BlogFileName">$BlogTitle</a></li>

This has been copied to the clipboard.
EOF

	cat << EOF > blog/$BlogFileName
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="$BlogDescription" />
		<meta name="author" content="Rebecca White" />

		<link rel="stylesheet" href="/assets/css/base.css" />
		<title>$BlogTitle | Rebecca White</title>
	</head>

	<body>
		<h1>Rebecca White</h1>
		<div class="left">
			<h2>$BlogTitle</h2>
			<p class="blog-info">$BlogDateFormat</p>
			<hr>

		</div>

		<div class="right">
			<h2>Navigation</h2>

			<ul>
				<li>Website Navigation</li>
				<ul>
					<li><a href="/">Home</a></li>
					<li><a href="/blog/">Blog</a></li>
					<li><a href="/blog/rss.xml">Blog RSS Feed</a></li>
				</ul>

				<li>Links</li>
				<ul>
					<li><a href="mailto:rtw@null.net">Email</a></li>
					<li><a href="https://github.com/Kimitzuni">GitHub</a></li>
					<li><a href="https://gitlab.com/Kimitzuni">GitLab</a></li>
					<li><a href="https://youtube.com/@rtiannew">YouTube</a></li>
					<li><a href="https://odysee.com/@rtiannew:e">Odysee</a></li>
				</ul>
			</ul>
		</div>
	</body>
</html>
EOF
}

create
