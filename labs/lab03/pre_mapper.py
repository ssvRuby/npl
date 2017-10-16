from urllib.parse import urlparse
from urllib.parse import unquote
import sys


def url2domain(url):

    clear_url = ''
    unquoted_url = urlparse(unquote(url))

    if unquoted_url.scheme in ['http', 'https']:
        clear_url = unquoted_url.netloc.replace('www.', '').strip()

    return clear_url.lower()


categories = [u'cars.ru', u'avto-russia.ru', u'bmwclub.ru',
              u'zakon.kz', u'egov.kz', u'makler.md',
              u'russianfood.com', u'psychologies.ru', u'gotovim.ru',
              u'books.imhonet.ru', u'zhurnaly.biz', u'zvukobook.ru']

for line in sys.stdin:

    try:
        uid, ts, url = line.split('\t')
    except ValueError:
        continue

    url = url2domain(url)
    if url == '' or uid == '' or url == '\t' or uid == '\t':
        continue

    if url not in categories:
        continue

    print(uid, '\t', url)