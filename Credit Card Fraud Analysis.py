import pandas as pd

with open("Credit Card Fraud Detection Clean Dataset.csv", "r", encoding="utf-8") as f:
    lines = f.readlines()

data = [line.strip().split(";") for line in lines]

df = pd.DataFrame(data[1:], columns=data[0])

df.columns = [col.replace('"', '') for col in df.columns]

df.to_csv("Fraud_Clean_PowerBI.csv", index=False)

print("File Saved Successfully")
print(df.columns)
print(df.info())
print(df.isnull().sum())
print(df['Class'].value_counts())
fraud_percent = (106420 / 390735) * 100

print("Fraud Percentage:", round(fraud_percent, 2), "%")
total_transactions = len(df)

fraud_count = df['Class'].value_counts()['1']
genuine_count = df['Class'].value_counts()['0']

print("Total Transactions:", total_transactions)
print("Fraud Transactions:", fraud_count)
print("Genuine Transactions:", genuine_count)