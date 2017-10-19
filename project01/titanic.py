import pandas as pd


#================================================================================================================
# https://campus.datacamp.com/courses/kaggle-python-tutorial-on-machine-learning/getting-started-with-python?ex=2
#================================================================================================================

def load_datasets(save_to_file=True, print_head=True):

    train_url = "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/train.csv"
    test_url = "http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/test.csv"

    train = pd.read_csv(train_url)
    test = pd.read_csv(test_url)

    if save_to_file:
        train.to_csv('titanic_train.csv')
        test.to_csv('titanic_test.csv')

    if print_head:
        print(train.head())
        print('=========================')
        print(test.head())

    return train, test


def read_datasets(train_file='titanic_train.csv', test_file='titanic_test.csv'):

    return pd.read_csv(train_file), pd.read_csv(test_file)


train, test = read_datasets()

# print('TRAIN  ==================>')
# print(train.describe())
# print('====================>')
# print(train.shape)
# print('TEST ====================>')
# print(test.describe())
# print('====================>')
# print(test.shape)
# print('====================>')

# print(train["Survived"].value_counts())
# print(train["Survived"].value_counts(normalize=True))
# print('====================>')
# print(train["Survived"][train['Sex'] == 'male'].value_counts())
# print(train["Survived"][train['Sex'] == 'male'].value_counts(normalize=True))

# https://campus.datacamp.com/courses/kaggle-python-tutorial-on-machine-learning/getting-started-with-python?ex=5

print(train.head(2))

