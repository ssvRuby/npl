import pandas as pd
from datetime import datetime as dt
from datetime import timezone
from urllib import request as req




data_dir = 'data'
filename = 'gender_age_dataset.txt'
file_path = '/'.join([data_dir, filename])
url = 'http://data.newprolab.com/data-newprolab-com/project01/' + filename

#=========================================================================
#req.urlretrieve(url, file_path)
#=========================================================================

# big_df = pd.read_csv(file_path, sep='\t')
# print(big_df.head())
# print(big_df.iloc[0].user_json)

print(dt.fromtimestamp(int('1419717886')))
print(dt.fromtimestamp(int('1419717884')))
print(dt.fromtimestamp(int('1417548310')))
print(dt.fromtimestamp(int('1417544282')))
print(dt.fromtimestamp(int('1417544045')))


