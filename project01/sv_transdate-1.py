from datetime import datetime
from datetime import timedelta


def guid_to_date(guid, check_returning_date=True):

    str_16 = guid[15:18] + guid[9:13] + guid[0:8]
    capasity = len(str_16)
    sec_value = 0.0
    for i in range(0, capasity - 1):
        sec_value = sec_value + ("123456789abcdef".find(str_16[i]) + 1) * pow(16, capasity - (i + 1))
    sec_value = sec_value / 10000000
    guid_date = datetime(1582, 10, 15) + timedelta(seconds=int(sec_value))

    if check_returning_date:
        if guid_date > datetime.today():
            guid_date = None

    return guid_date


def timestamp_to_datetime(ts, check_returning_date=True):

    ts_date = datetime.fromtimestamp(int(ts))
    if check_returning_date:
        if ts_date > datetime.today():
            ts_date = None

    return ts_date