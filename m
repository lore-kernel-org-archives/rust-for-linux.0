Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778777;
	b=cEAz8JSfKqBmbQSbi4lODMIaVn1kXNGL40uGyAJn3Vg0PvbAkY/flkCG9NPEMAAODuZC
	 YKHe7wu8CaBnaT84UT6LUG3aaLt2ZZ5aqA/hh77M1m+AQDYHvUC75k+PYf2oge3Y/caWX
	 8rL2O4eM6Z9Zpnc93MsG0zqCIF8fu0S7/mVpK8Ek+9tqWbVwFGMByW7cgliWZGXYFHfIa
	 8ChiG5XgRvlWLlDjesREUAqkqK3L+o0/+txKoEpff1fOcOvSgNfmfgBn58RptGUij4V09
	 O0AskOeQt5G6m+VSRpbPNEQNIihVl6ZPLVG84eSeyZXja7k64HpqUJbLIrNs22Ep5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OWS8erEqBwwq3aHveLY854LGBihUxBRE7Vkb4G0BYjg=;
	b=pC2InkYH38CFxxlmXKDNnFBwh0DFORkKmYm1tsbiLn0v5h8fGZW2Zb6HCYxhLCVdg155
	 zx9f5Kj+EIrLB7VxuKj1zxm1RzT5eYm3sVfGzg0JIpK1KBoRTfC8+xUOEEhE5zMN7uXc6
	 HKRdIPPq92v7htMjTqB92ceys6rsCLCvitImXkDFrDjZ7+G8WHzuWVeDRKPRgizV9rLf2
	 4OTwWcOaFsGKWCD4wUPR4uMSop4MBSxD3DV1uH1SqyOOd96lT2ywrip5ow9ZqTeLyLuPV
	 a+xG03X34vSz/KnG/0b4sdUnaysh6z++XSWUNOTat/HkmkPVWFg12XAq82KTKwgVFzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gJwhB/0Z";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C94606D818
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 07:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C94606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gJwhB/0Z
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df54150dfso202485f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 23:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778775; x=1794383575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWS8erEqBwwq3aHveLY854LGBihUxBRE7Vkb4G0BYjg=;
        b=gJwhB/0Z6u82SlVgm0Zx0c3oPa7TJuOLdPLclgrK56kXj+0K8e3XvtwasrWQKrgrZq
         pXbr1M8xdBXisb7EBrIraL3PiuLztnPDYR9PPLtJ+zuhIMs+tDKHOrvWig3hPA8uX7tx
         tXovKyNnXVHZbmnr/tvQ9Jy4TMOcWYyjI6BrHpOo+DESyEQY940T+J2oeFaR8XoZo8TQ
         8TIy68Aj9JrPJVbbpcEYG1zQiPh8s0CVcY2DGVZ9IZ1+NGZ8SSVS5Lw4i2XDvYZlIad6
         S1kj9kuPDZt9HeQCVq2wONCalxMdmbLIQjLGzB7kxuT0wMAkdpSbQXbAX1gP3VVM+J0Q
         kwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778775; x=1794383575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWS8erEqBwwq3aHveLY854LGBihUxBRE7Vkb4G0BYjg=;
        b=i54Z450WPiEQzhLD9ytm+Jimmq4U4XW82u2zIz9MzbNUcZU9qQviPVJp8KHsMwQLqx
         yJjLVrJpfsZLduHYx52cO+gngFJVMLLhOpmQ0HcWQrXvCn9maQf7c+EwYo/zKtGH81JF
         06fcy+OOUlUOQeWRah0sSkFGki3t37Zk9Wg1iIlGPkVZk8gSKHeXIIXqUEUAXxtfDWQO
         glxhsv9crOGUiMH24op9lZJTW3Amf6nZqB82MPXso6cecymmBnLPJCgjjWAXrp1wKfSp
         jvzxQpsdfK1DavJLkxObMEaeNqyxEesebElIBWp7CYZEpbNWijCZIyGURX0UjPlztxaS
         cUzw==
X-Forwarded-Encrypted: i=1; AKwUvBzuqKzDhFnk+UQYSDoqfYNRz3aXdfx8hvJFtLB99/luSfc7cjOCAhCw45C/QH3vQenyte5jV8hEC7s+gF66Ig==@vger.kernel.org
X-Gm-Message-State: APuU4Z9iyAUGnYXRXzvrNHCxImF8KoapMv88D60jsAhLNIbsz4LZkDFG
	wZYSatzkC/MZI/zw0r6MKD6nQYgCZvn3+41jTKWq5AXIHCSg98sy7/1N
X-Gm-Gg: AYBFou3Zvwaqz2btj0OjFl/BI47bkWeGM2ReGwAbiad7rcNDFrwc/MHR8HJqLCx0u8P
	4X3jxdliHhWTifm94jaf4rXlfpoPxkKFTOA0zrabhLGEtiMGxMY7f4+GnCgOXmGMTKgYluZ6ZAy
	JY2UlbvfY/ac18480rMghDmVEyFT97wg6qO+MdgoU+UfdwbEiS7nUqZmAY8PUYFtj6SnxqyxAeD
	hK8ZJCdvr8p5aZTa/XWOnM3l6mvhMg5oAnYM6aHnNOkvQ80a6YJh9HJYPX/O6TU+qWkG6HPxo+s
	leZkoGv9YVsuaWbogKS3zIaGqrVmEf1AEUsqf/UrtTPY9FABfIj87xsP9fbh9kf0RgE2U6dFLVQ
	COq/KSEuzFcztveMUggy2IW47mSVlDuifWSX4IKeHWAgiGj59yRs3l1SKkDcOI4UZSs+9iYIkRM
	aVL78QIFf4Vp0BZ5T6cAohTtRkoN6cyon5ADMYndH+KLwGUE4ThBwSgWs5m0SN0QKAYI8+6839K
	Fxv387YQ3jGh6OPhNJz3PgbyVVyMsnmoPZAtuJ6mfCzDyaoULkrvD+1MMFqcVK2AoaGgQtMHy4k
	WE5lv3l3YaTRBy/rwz3QoeIrUNGH3pVem7XLqmJV4GfSldCA8DTvGTatOVJXp0+/5mOajt8CJcY
	NJpjutkAr7Q/qjIvXmTb0MhFS42I+4TSowERpJc/ZB7og7RvHbbWo
X-Received: by 2002:a5d:538d:0:b0:487:197a:5c1f with SMTP id ffacd0b85a97d-48e6e4f8ebcmr26263132f8f.49.1793778775414;
        Tue, 03 Nov 2026 23:52:55 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm2200785f8f.52.2026.11.03.23.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:52:53 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 04 Nov 2026 08:52:41 +0100
Subject: [PATCH v2 3/3] drm/panthor: Bump the driver version to 1.10
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-panthor-fault-info-v2-v2-3-673b31f3840c@igalia.com>
References: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
In-Reply-To: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>
Cc: Lukas Zapolskas <lukas.zapolskas@arm.com>, 
 Paul Toadere <paul.toadere@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

VM_GET_STATE now reports the last VM fault and GROUP_GET_STATE reports
the fatal error of each queue. Bump the driver version so userspace
can detect this.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fb5fdf848dec..139654628ec4 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1803,6 +1803,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.8 - extends DEV_QUERY_TIMESTAMP_INFO with flags
  * - 1.9 - adds DRM_PANTHOR_DEV_QUERY_MMU_INFO query
  *       - adds DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE flag
+ * - 1.10 - extends VM_GET_STATE with the last unhandled VM fault
+ *        - extends GROUP_GET_STATE with the fatal error of each queue
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1816,7 +1818,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 9,
+	.minor = 10,
 
 	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
 	.gem_prime_import = panthor_gem_prime_import,

-- 
2.56.0

