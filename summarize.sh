
HTML_EXTRACTOR='chrome-extract-html.script'
HTMLTXT=$(osascript $HTML_EXTRACTOR | htmlq -t -r "[type='text/css']" -r "script" -r "link" -r "style" -r "img" -w | awk 'NF>=4')

# cat <<EOF  | python3 llm-summarize.py > summary.txt
# Please summarize the following with a few bullet points:
cat <<EOF  | python3 llm-summarize.py 
$HTMLTXT
EOF  

# qlmanage -p summary.txt