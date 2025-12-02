Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620272F39C7
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704299; cv=none; b=mAi/X92X7myxx0dPLlz0km0AQ6T992lt7nLcKNwNozvFYiwraQjdy76UEHHrkoFx369dIqOeBSzwvZm2iefjLzxC9hf610Hyr996ksYCc3jmglGY10oTvyOXc4yXWfhEngo+1krGKOQZEgAxBnVy4IPW+nRsNy7evAED+tbDg68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704299; c=relaxed/simple;
	bh=O2kUeaQ1UWGIYL7ucqPo81K7xsGx82r05RTFW5fUFa4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MJcTQa9cFifAqtkzHSGqGe/jZI5XweiD1nHjK9KrvvG4laM5zC2O17T0+wTSkZwOdpGZDRQmDpGr24KEQg9PdnBILMK99q5Bo1wKoCI4fdBQMTY4UkEhqX2J7kVbglyik7eCbyTC8kDIJTQkXIJjUDdtU3yDKU0KIOdxPOBsX7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=noHTbZ8x; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="noHTbZ8x"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47775585257so41062945e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704295; x=1765309095; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3MqpU21XnO6rwEHBkLWeoEI2kCAx33Iioejz4be4+GQ=;
        b=noHTbZ8xiS4HhwnxbzhVgxeOA9bWDlFO26dfZ2zLR5X1VGWU8nCaBPMVAaOnfZYHtM
         XLyZYNxmL+i07T0e4wutz6wnWedOsvAexpBZ9UdcgS9CJbfbbOMeGK1Hy5LeJXWPUUt/
         P0NURdRLDm0E1bCGSp3R/f5fnhmNNetBF7QriTj4BX23pvEwO7NMU1gFCnPDt4YoY0sP
         cGsvdvzbGiBG3zu/sqkUn2KDo5jXBYJiIM6KnnKrQrYpAjPQZdkIoY/DvRRsZuv0wBo7
         c4gZWdW+vyXdcAB8mVzV0bzMlF9Jdb77sLb6GqUoK0/Y0alVsK1dAwEVC03L+Afs+XmV
         YWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704295; x=1765309095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MqpU21XnO6rwEHBkLWeoEI2kCAx33Iioejz4be4+GQ=;
        b=feWjBzguYeYCcT9naKonrL1TTrWKpfufkOpFp5etvMPny+l9aGJf/LV0LBDKxq6yQ6
         utxjciWjpXYGawtCT5IR7aw95MMu1UKdroQHdY9Ik5I+Akvi05ef3hVxtGZweVA6MEn1
         4H2mruOaq9EkTTMSFjyiolrx7b0R0nQs/PHrokcelZvV9ECuaKtf74HFUtZcCVCnYMwY
         bOomqI3M+bzxeibKql9qQYHQApb1TV+rxpnmUeJn+kdEEfRCY6KKaR7UU5KuRWwXskaB
         lS3b4ek3uxPah0NCYDh894TifO7ahlw6z5/mzYgO364Z69BW5qcUb253LLM35n1xkL8V
         c7EA==
X-Gm-Message-State: AOJu0YyYaQ75/oSJ0eCdgIkFubbmvNgaR1fZrr8ISKwCcGs/al+89Fbh
	Bm409Dn08AM32EnMV/fHRO6iU9xmccmQIgcmuTvLgMehqFZsCT2C8qj/P86c8oxmgGioEh/EW0f
	3Ru0yay16maXymAeZFCgWIJJth8pJ81/ONllsk1Cm14TjDRgkpqg4uPdyBhb7PTzQNpCETpeKcJ
	N6CIL0PSDm+it3bBlyQswly3jn2bWJffrU2SFRGKOAN12EJig/CwdH6Etno2rIsVY=
X-Google-Smtp-Source: AGHT+IHul91rsN1td8jmOJqBWMMqYY0RN6pfOrenUj4WsZ0i9f/CnRGBva2oLDCkXKcnRZ75Zzo4TP77v8bK9pI=
X-Received: from wmjf3.prod.google.com ([2002:a7b:cd03:0:b0:477:a0e9:dc85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3592:b0:477:9671:3a42 with SMTP id 5b1f17b1804b1-4792a61e75dmr7394645e9.35.1764704294832;
 Tue, 02 Dec 2025 11:38:14 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:45 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=O2kUeaQ1UWGIYL7ucqPo81K7xsGx82r05RTFW5fUFa4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AIWLFS3CmuvxgrVrJmmtAjOgt0QTv6nNg+F
 Ed9xoe7n7WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACAAKCRAEWL7uWMY5
 RnMND/9TyxE+Cz3AUPzMh3bbFqiw5HZwLGE4mAo1qM2XPF2OZILAqG9irNQk++aHtpOLIvdh1Tu
 VQ+g8v/Qz2Na9VwVTtYmwjDF5GOQnQOgYx9WpmYzsgARQCWd6Dwue1QXVcnkZMh7jtCecsBL9g9
 rMseS0t4ZlxdulRWncoTB5gaKz+7BlVvJVSkTR+cVghfWDBcC26fh5eOEgDP1EuEOEXX0+GAQrf
 pNaX3xeYjJQMwaKXAkhZh80wvJCF13JAl6hYHEAZwuVJFPdTOaOYRzG4QiIwGsYUzg0VM2ENBfv
 GdOdqginaypnWsKeibNnGXNgPVZjVlNVo1qtidulqCiIS1DvBpCLMbHsbf9Em5KqIEaDgkQ+OSA
 CuRILs2IxR4cgytrUmTlf8bw93a+xJvRKWiWEyYpW8OOLYsi1naPzBQiKpSC89k1Bpi2mpu36Be
 yTDSYfKAlDc/wWcOpaMK8n4M4DyC+tCvNZQoz30YMiWnDAL1QCvbF7XOy934dZF/mHHWbBULcck
 8oNX5+3UMtQ+UFyU0xCl6rzP9qIEn+1PXrZLJq0M5OAx6dvrIp4xgZqyBFQ38fGHNdT80rMJdLU
 euMMmSKzgm9q5dy1Lpm5WVe/LrUz1WMG0HGimrex1clJ7xOUJS4BinpwbkUR0d2+w7s1jNBWsiq u/cHQ2wM79MwVkw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-21-a2e13cbc17a6@google.com>
Subject: [PATCH 21/46] rust: jump_label: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Jason Baron <jbaron@akamai.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
---
 rust/helpers/jump_label.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/helpers/jump_label.c b/rust/helpers/jump_label.c
index fc1f1e0df08e79c0f06ac46cb6729a08deb7bd41..7ca384e73121820d882fde645a80cf718e6d9fbd 100644
--- a/rust/helpers/jump_label.c
+++ b/rust/helpers/jump_label.c
@@ -7,7 +7,7 @@
 #include <linux/jump_label.h>
 
 #ifndef CONFIG_JUMP_LABEL
-int rust_helper_static_key_count(struct static_key *key)
+__rust_helper int rust_helper_static_key_count(struct static_key *key)
 {
 	return static_key_count(key);
 }

-- 
2.52.0.158.g65b55ccf14-goog

