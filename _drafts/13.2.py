import json
import urllib

url = raw_input('Enter url: ')

#if len(url) < 1 : break

print 'Retrieving', url

uh = urllib.urlopen(url)
data = uh.read()
print 'Retrieved',len(data),'characters'
#print data

info = json.loads(data)
print 'User count:', len(info)
#print info
items = info['comments']


n = 0
sum = 0
for item in items:
    n += 1
    sum += int(item['count'])

print 'Count: ', n
print 'Sum', sum

