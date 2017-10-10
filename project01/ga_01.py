import pandas as pd
from datetime import datetime
import json
from urllib.parse import urlparse
import matplotlib.pyplot as plt


filename = 'data/gender_age_dataset.txt'

print(datetime.today())
df = pd.read_csv(filename, sep='\t')
# print(datetime.today())
# print(df.age.unique())


def unserialize(x):
    return json.loads(x)


def get_time_list(x):
    time_list = []
    for items in x.values():
        for line in items:
            timestamp = str(line['timestamp'])[:10]
            time_list.append(datetime.fromtimestamp(int(timestamp)))
    return time_list


def get_url_list(x):
    url_list = []
    for items in x.values():
        for line in items:
            url = urlparse(line['url'])
            url_list.append(url)
    return url_list


def encode_rf(x):
    x.encode('idna').decode('idna')
    return

ages = {'18-24': 1, '25-34': 2, '>=55': 5, '45-54': 4, '35-44': 3, '-': -1}
genders = {'M': 1, 'F': 0, '-': -1}

df["gender"] = df["gender"].apply(lambda x: genders.get(x))
df["age"] = df["age"].apply(lambda x: ages.get(x))

df['user_unserialize'] = df['user_json'].apply(unserialize)
df['date_time'] = df['user_unserialize'].apply(get_time_list)
df['url_list'] = df['user_unserialize'].apply(get_url_list)
df['url_count'] = df['url_list'].apply(lambda x: len(x))

# print('=======================================================>')
# for index, row in df.iterrows():
#     print(row.age, row.gender, row.url_count)

x = df.age.values
y = df.url_count.values
plt.scatter(x, y, alpha=0.5)
plt.show()











# print(datetime.today())
#
# #df.to_csv('data/01_dataset.txt')
# print(datetime.today())
#
# #df.url_list.to_csv('data/01_dataset.txt')




