Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB02FA0EE
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704309; cv=none; b=NEQzHvv9nh/EhAAyMsJgque7c+ULrltyS3DaPAqaEclaZRlPbJo9+FhQcD55p6wOUmptLC86cOohwpB58kmi7VYgqr+VLCd6Ezzp5gtCz5OMf7Utxfr7hOYWLsGeFNYRCosFXh/nUE+xW999p/0QOlhv7mItFzMIuBisEWMVCmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704309; c=relaxed/simple;
	bh=IoPZCRAlu+5niXg13rPMjj5rO0tLB+4I2hBxtpTXqC4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pEvG/6CEe6ifuhnRkXK3OtnxCuiFSMuze6LcFPjEfuVAVVDhH6lIPRzS4ztD0aPg2v95TtNlt8QzdTn0x36wE0p8P1wz1WhS7HWMg9aqL2f1ZNdlhD9cY8mMHJQuVGOmtvRSSMYhZXlZUKzINSHLqrfYJmD5gFm+BE1whwzvYa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dUNvWvtp; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dUNvWvtp"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477a11d9f89so27272905e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704306; x=1765309106; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXrTBe0/yi4vln6YMJTX73VBhT4PxW6T18C1lUiWqFw=;
        b=dUNvWvtpHrmP2nuvHNnkHzxZngncqtCyfqDJusKeKOYHlV4cSfBCngWMh+IEfTjCiD
         RZ9FTr1TpmO3onkYbroBT8yCcgwgHbLdBLQee/OnZPwSYianH5W5snxcv9ITqZ/KDcSl
         XQqQM8TBJIhPY4Iw4Zt8YwJ/NjkmyDevq8nX9m8aO9XiEBlsOkUWo5VRqWtQZfBzbPft
         4viZYcXhwYt+IU0o/7YJjDg9mrN1W6sQhQzQ8MOnWy8ccxATQUxrfwDeZe8fJKBCg46t
         +VKbmnn43OVdSr7Vm3e8aOdz1azwyqFZitBSCyE8u4ogn8IDz2X59Zsj3EErECogMc7b
         0BWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704306; x=1765309106;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXrTBe0/yi4vln6YMJTX73VBhT4PxW6T18C1lUiWqFw=;
        b=DlBDoZ+AVg96f+IWli0baL5J4FXCVl958eL9LPshtTW1svemYJXzYtP0uAVCjepQN7
         uq/BK8s7m/Tj0B3kjlPde2D69kyEHtvJ8aoBb5wV9UpF03YgSKVyKx/RR2BMkM+AZ5Xf
         +M19XfMwieC+njqpekTCTqf+qOaDm6/X1rKbTeM76xkllTsv3bdV5+/qGcWbGvE10wHc
         kEI5bkwjYbIlRTIOVG1ujuCkhez0ZJU6qVj84X9SCod11vn0G/bKymtz7tctVeEXeob4
         ZKiRxAFOunXrAd3wHYmMDakf/VR52PRADFP6Xd081SbAgekacslPtglaGD1kmDl0I2pp
         mU8w==
X-Gm-Message-State: AOJu0Yzw3Ul6oMC8xcearebADc5Q0/fdgu41a1uKM1A+Sh7guwgsNIqA
	cMAUA2uAG3LT7EzxqVjbjLF5p0moukaftYmkSbNVHwWVysf/BR290QFMn6b4x6PjU/m5lRBr9dp
	q97XUMpmQw3bc2ddrrqcmNQAp0lxAdWjiGsRUjejgvjYN06XV3wih8Ct1kKFQ72jNnbUvTccxtP
	WBnx2X4APPXa+XsZE91IroeexxJMuqtWtvbQEKGFcQqEPqSp4Pio9zv5oDk2bhufQ=
X-Google-Smtp-Source: AGHT+IEaMGSM4+v4OqSb59ixQJ0QCnzyg3QbzTM3G/b8iTqU2mxSpcp/IhlUclwVO2H6tGDEFQNjOaQB9evZ0eo=
X-Received: from wmcn10.prod.google.com ([2002:a05:600c:c0ca:b0:477:a338:214b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b05:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-477c00e7900mr470383425e9.0.1764704306230;
 Tue, 02 Dec 2025 11:38:26 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:54 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=IoPZCRAlu+5niXg13rPMjj5rO0tLB+4I2hBxtpTXqC4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AKOn4LXIPmetQmN3+SEL+dLYQVefcNacAj+
 ThJ3pn8tLSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACgAKCRAEWL7uWMY5
 RuyID/4gbpPJyRVoyPXCRuIhwQz5gImVsvOBXZ0gBsprVc3Lnjp5/+S8jG+KhBIdpjonUeSEYqm
 o5lnIXVWgKJXnv9kYUtqrG+bHqPLLJb7TuCJz/lLxhlWGQxPENetxjrY9INaLO1QKPypUXcBbgw
 r0RXPTwmSgEI5Q7Xv2XCv0oc1G2mwxTYmQT4tvk2SyxaF6GQIVOapVkJCWovrmUe0eTQY0MvMEP
 oXl7jymEtjVJAxXmAzZTaKdguadrlOvXrniUhgRACk1pMRVnR0RPvv6nHq4sMlRHnPFZH8D+6DW
 H+g7v4dZ8d7Vj1d6wgq1Ad5/R+QrD9lTEpub/GDk3/ESL8xkpdWupPLSxt/SIr+YSgvGvFK8D6a
 NEPj89jhkttdlnDOs69xid8AfudehMimZu1Zq05uFfm9/D60PlaZZQDglEzDWRHfJqWBneT+Mbn
 eFs1S0Vk15pxES03/K6GJl3pXmnqXwKpZVzUUYlrGSjqWmMVzgwV+zzNZSI5vE3dupndjbNfGDz
 G7uYWRx4eO8IXcFUojqdZ6k9BRLTlhiRn28Lhc+88OdBGDdHkCe6B8dtd2+ya39JXsyACDwf254
 q39Cml2JtfpiYEX3fYo4AF9eVb4EwjVKhkF2wMLCWtHacRgvTHKf3CnokcFyqh+fOZ6pQ97nci9 qzFQZ81ife4ffkQ==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-30-a2e13cbc17a6@google.com>
Subject: [PATCH 30/46] rust: processor: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/helpers/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/processor.c b/rust/helpers/processor.c
index d41355e14d6eb593beb018b5709118afe855c852..76fadbb647c5592db4526569fb1ed6b04ed17e87 100644
--- a/rust/helpers/processor.c
+++ b/rust/helpers/processor.c
@@ -2,7 +2,7 @@
 
 #include <linux/processor.h>
 
-void rust_helper_cpu_relax(void)
+__rust_helper void rust_helper_cpu_relax(void)
 {
 	cpu_relax();
 }

-- 
2.52.0.158.g65b55ccf14-goog

