reveal: 
	pandoc -t html5 --template=reveal_template.html \
	--standalone --section-divs \
	--variable theme="black" \
	--variable transition="linear" \
	training.md -o training.html

