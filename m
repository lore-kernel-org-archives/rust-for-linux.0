Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794624323;
	b=Amq0rJ+hqL8b8R8Z06SRGyo8yYnrGWnJDsKjri7iK+SHmbBobaQ2A0Vj+omCQo7E2MoM
	 EKurKYTjypI6aFtCMIy0OazeFKt52Pp3t8rPOiRODWH8HFfA+J8/p+3HK9iB5mnHr/HqT
	 5rP+uNmVaUY0pS9eGiR+8kHfDK/T4DbDFIUdWrOYdMoz4fRxKLastP+AymA4A9auuPgCu
	 Zzu+Qec704xob2WXelj8n8UrOLjqqv5v+i2yqLJkf1jzksxoQmYJnMP2l3exjFg9ZAi4U
	 ZX8wWP2lvwnJDBYgI3kZE7vdFYOYJFyjNTKnXsxR+V7wTCx6g8N0EtF48824h9RfZVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794624323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=h48qZYbCl3W7+4kKVvK+3RKM1GhCKZGVnH2TB53H7Ok=;
	b=WbigzR1eIiWHbdQmnePTLUO31BqyHyMShbK9vzBpNRjHsAjthj8A1+Um63CfqHnyO4V3
	 2zW20/72WDtKsEJDiYF1tYP+9gP65XUmTU3Lh+JBZRivmM/f6VLPD1YH5OcgvrCiw1usF
	 zmMWO73KLav2Vx4RkQ9/Q46w6UbkdYOeTdTfla9rOiAGdNG8rTATkkR7OI7FVDR2/2oBH
	 fQVz06F+6Ht+G3CtlLm1BRg2CrGkM1yGhDTSM5sRj7ErqKWjp2QI/GsxVDGKtjmNry+6j
	 N+4t2d+cFb1kut8LROF8g04i7VxBBMBQaCSodpFamtgrRnomFiV58khDwO4I/L1RWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPwQl0P4;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6756606A330
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 02:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6756606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPwQl0P4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so10080395e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 18:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794624321; x=1795229121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h48qZYbCl3W7+4kKVvK+3RKM1GhCKZGVnH2TB53H7Ok=;
        b=gPwQl0P4iPKFNkXXe9HUrsnBEx7x40xFM51ar4QB4iFjpTfG5DVZDXByaVcWSCxZUr
         YaxWnMjxP1mOdIZ1vYrZ6QZQmXOQtGljigPQTM5d1Yl2k7T2Ytu3spr7tCb9Gl8FO3UC
         wJnjq3WCBSjIu3OxUsUs0+gzOuys91c7nV6+vyM2ygwWKeX0CCLepCUyD7NsG8e/c2HM
         U/W7yIqmIav/+HpO9cFl5/79NqJ6P32a/vGekM9M2UGaYZS17AnJtr7hmmqi9NHl+wg4
         85S4yVZ+3EGMAy+/5R8jvYMap3YAyK135atQRnyXfsK2H9WhLJAXdLB6XE3/PmpBaAVb
         lqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794624321; x=1795229121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h48qZYbCl3W7+4kKVvK+3RKM1GhCKZGVnH2TB53H7Ok=;
        b=Yvai2PpSMyLb+XKGLebPkrCnj8oUfPMP9Y7Q8mYRacUrujAk8RYuQIgPAAnTe8baLb
         veloP1digi3txiQjMoy9s1y95EV8I4t+FLerXPQI9hrt+oytneSj8mrhMemXLTcZMd1E
         d8l5H61Ko8GYxYEUUUzeqK5RupIOtN4CeQ0HsCoABuJI4tFLotbej8nKv/MdlArC/rGk
         5g2QBEnZIRc0QrltnBdisn7yfNUn7qx2EGRLVQ2JK24f9aAgpzmD8YG8xRduNLxYamZa
         un2KyVbfbmnMMzvxAyYRIhoRMBtzL78yE6MO1TIu3U+w+DJC2zVORrqqqU+C1coSclhv
         sbmg==
X-Gm-Message-State: APuU4Z/jbunh76WNddlgF0eOQ+VzhBSc8a845y69NhnCd7qsRajH6DTb
	jWJOkBnntXxsNBgewpUS5gy6HKu8N41Wpm5FMsX46VK9DxLXag6g9CTV
X-Gm-Gg: AYBFou29ktXJkiftd+Fpc8sx9BWnTAXUsHCpHAA1srWaxG7K9pi7Vk+7M9yojBZ5v0Q
	4n61ECf5of5Q8ByNTfZd5ZdQJpASL/C0kaes7jsPIbIhJNIA9sy9hFJkqN3Dy9R0PQEx1jnQAG4
	ML71yZI/fTBjdkODHvW0Kjs7yjAkA1wtBeXxTQsF92AAIhK9rTC4z2IYLTldAXRU9ygqhqBINcH
	UqG2plYf3+Y7LnaMiOPCNgkQuQyblNh0RhcFNa6I8aAtMC0tquP6FcSnJuNobqbAupybIOgv8zF
	1hF8avlIA/lPkd5m6ZOO/4o5IF/+xV44qJVI7LTZrm3OzC9GyFV4JeLCf3tFPpv8Dd1vx5jk1qB
	TlZ7Rp65vzRIydq5Wg5MZXLwiHhfb8ByOGAGKXCBrYIt9yWUEjmJb+oiMC6YqHRX/yAXQN9n/GT
	+L0/4ysNBqH0OQ0QAaU+MxDt4mcI7QSDlalpynkL+CU5e8OxwIavNzPVghVdmbsl3VXwOK75OnN
	wOVTBSZtsS+PBvsVmlcJxelq/5NFcQAildQk9pyavZqu/AFsDI+Yw5G1Md9awbFcYmN65XEH4O5
	TDelqSQboXloBnxIoQhMXcODZOp3MSrq/SRm0CzeG7soWVGFmNlePAulXFIPKT1V8eVR8fPLLie
	y+3OFhmBuP0mFpt1GQdE0RwGzi06r7N0ZWbSl4+pjhwUbWCTgJCkYjAeOHz5fEx/MEfWqMxq5hU
	HogMJy7AqbDqZC6cPZxvOhcrSIWm0Zeri2TuO2Imu8b/gJGjmZLKSxFCP/OuGlSu2ygeEaO/8D1
	rZb
X-Received: by 2002:a05:600c:512:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb55a5d7bamr69903025e9.6.1794624320958;
        Fri, 13 Nov 2026 18:45:20 -0800 (PST)
Received: from martell.martell0x1 ([41.239.125.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm8198455f8f.12.2026.11.13.18.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:45:20 -0800 (PST)
From: Marwan Mohamed Zein <marawanzein222@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamir@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	martell0x1 <marawanzein222@gmail.com>,
	spidermana <xuyiwen14@gmail.com>
Subject: [PATCH] rust: kernel: fix lifetime of copy_from_iter_raw
Date: Sat, 14 Nov 2026 04:45:15 +0200
Message-ID: <20261114024515.1000882-1-marawanzein222@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: martell0x1 <marawanzein222@gmail.com>

The returned slice is derived from `out`, but lifetime elision
ties it to `self` because this is a method. Explicitly bind the
return lifetime to `out` so the returned slice cannot outlive
its backing buffer.

Reported-by: spidermana <xuyiwen14@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1265
Signed-off-by: martell0x1 <marawanzein222@gmail.com>
---
 rust/kernel/iov.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/iov.rs b/rust/kernel/iov.rs
index 43bae8923..8caf04518 100644
--- a/rust/kernel/iov.rs
+++ b/rust/kernel/iov.rs
@@ -161,7 +161,7 @@ pub fn copy_from_iter_vec<A: Allocator>(
     ///
     /// This will never write uninitialized bytes to the provided buffer.
     #[inline]
-    pub fn copy_from_iter_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> &mut [u8] {
+    pub fn copy_from_iter_raw<'a>(&mut self, out: &'a mut [MaybeUninit<u8>]) -> &'a mut [u8] {
         let capacity = out.len();
         let out = out.as_mut_ptr().cast::<u8>();
 

base-commit: ee83899302a0457a3ba47464a13e8682bd7ba27d
-- 
2.47.3

