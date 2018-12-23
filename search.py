# Using Python 3
import urllib.request
import re

# urlopen does not "encode" the url, so replaced the 
# space between Nintendo and Switch with a %20, which
# is the proper encoding of a space for any url
fp = urllib.request.urlopen("http://encore.slcl.org/iii/encore/search?target=Nintendo%20Switch")
mybytes = fp.read()
html = mybytes.decode("utf-8")
fp.close()

# Python does not have a do / while so
# use a while True with a conditional break command
while True:
	pattern = re.compile(r'(Nintendo\s+Switch :.*\.)')
	for m in re.finditer(pattern,html):
		print(m.group(1))
	match = re.search(r'href="([^"]+)">next<',html)
	if match:
		#print(match.group(1))
		#break
		fp = urllib.request.urlopen("http://encore.slcl.org" \
	      + match.group(1))
		mybytes = fp.read()
		html = mybytes.decode("utf-8")
		fp.close()
	else:
		break
