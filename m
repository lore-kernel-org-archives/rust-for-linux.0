Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2250327C15
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704331; cv=none; b=ZzttiZYtrZS+zxKqZh9d2BPR8zWbqIkyNF08wAjNATYIgj0f8wcnbvyHN5qZ0O7sp3i4mwD9/Pw7S1pXMvQlzQHHT18Acp5Tq1+b+SSr1s/ZPbXLTBG3gRfEAADeqCP4tvDFa1uivPgtNECWvvIdbaA1WgxnB0nWGfb1lPSSnLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704331; c=relaxed/simple;
	bh=9J2MLVDNZYm9xM/OMq0zK+0XZtRU22LQEL0JJo068rA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BjIPcG6a76yxhLUcvHbm3UsKRuiXxaz+EeTIcO1KpHTmGv+qvL9KDMNMK0sZIyAWnDcXaxOkju9IXY/zmhRXjJxrt6Gs2K7s0nAKzY/BQWwlPAjSrU07gZicKkpxXCQbFoK0JDmrLf+Uu/mD92d7bqZLHGAYlJcYNZH8tHBAEmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D7Nuyz91; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D7Nuyz91"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so53763475e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704328; x=1765309128; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIQFzvQj0Y4HZI4kBd8TIFPc4eUfRrW65uunjiND9LM=;
        b=D7Nuyz91rVW44QGaJSv+HByq9UGzQyiK8mWobD6w6PGsUn7adPDRTv5dWPOCEKp2vX
         ZcgHqF8G8bQ9PrV2bRi191whPkC92qtayXtZ8fTsgt74xeT871pjwjhsp58bCaEPy1OJ
         gC8bRHeIUTRfSSEcK0TtgQ+nsmPPVeX4oLHfqrgxAuh/BIYeiWCL8rJYl3qEj8st36Gp
         HzxVcR//c51NuRL9QKaHXAkltkz8U0qoQqyGtBaFTzMz+auO1OmKHJAId8fGoj6GAxRM
         IoGwUIXTEKtfaCXl5cvgLm4DzzQwFvOWQclmcT4tA3JVjIi0/LS7kYKBDRVoZibZReFm
         nycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704328; x=1765309128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cIQFzvQj0Y4HZI4kBd8TIFPc4eUfRrW65uunjiND9LM=;
        b=E7Ld05QQN8OZeamr2w4gUKF02zl/CWJnMg2AaUGiBXZx7DBfTlYcEOdIUcxyemI5R6
         y2x6pkG20MbtvmfZm2yIydbVrR6QTk8uqd+2Neo5oZ+psfHIQ0KD2Z1mQdwd7kf5aCyn
         p3bv0gZmZnE+EtVGhjcz1alv9BKS3Q5yfDZNq/Ma3AB3wtd6JZM9hC4aA0iFG9/jAEtz
         DnreV4js2Krl0vZBSpss1Mi4gun/guUi15AW6imuYUJfrw0UHlAcHbhP8XlK9OjMdjY7
         ybqXjQGuwoYByfDMGOUH7pnbaTzmI4Epzoxt/l58Ol69Kh9aqjdSDt3cYLD4V/dD3n8h
         cRew==
X-Gm-Message-State: AOJu0Yz59oKt1bB/7iVhe/ZFCOKX1cGWhW2f2OzPop9IPxkB9wE3CxUu
	kFGiBInu5CMaUnNGHSK+JadUZbOvmL5v1pDfvUG8bBBoLbbhOwI9jT1ubjJ0GURDd9RKbofvdHt
	tr1oYoRQDupSOYNr4fxxLV2KcUzU2XnJqZvocgjTJ/Znlj7zOO7fTJIna0hLcd8JuCNMSmX52oV
	h21sOu0cjGL0QIAZc9iAxwA3QRSIcYIS0FREH0BO784eH8ozJcT5G+Hn2u9NAqsG0=
X-Google-Smtp-Source: AGHT+IF2Puntj/eKEoW+BjOOwfdx6Hi6RJWJ9337ShucXrIPEpJfEWDgyCzbKBbEoyZebOZYr1FMhJ/i5/uBM3s=
X-Received: from wmon10.prod.google.com ([2002:a05:600c:464a:b0:477:9c96:9fb9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:354b:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-477c0184c45mr416068545e9.9.1764704328135;
 Tue, 02 Dec 2025 11:38:48 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:10 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9J2MLVDNZYm9xM/OMq0zK+0XZtRU22LQEL0JJo068rA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AL1P6xk5iJWRPBNmQbM7bSHOMHh7jJWICIF
 waE9zMDeLOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACwAKCRAEWL7uWMY5
 RvTBD/9Q0mEQj5UCViRNOBAsiVewKwP3L79mXstnuVw4wTobK1OvaptZoaklpIQV8TEkTkdlVpu
 7Dp7i7P9Ad+6Sa/lsYJkMEYL/V4cIEyU0F1MRY7NNiTc79GmqdkY1AIosR5YL12mz8xqnan4Rf7
 n+5vYnTJiGSTjiW2wy4Kg1REQ3dx2NX87tjzAJAFAhlVE5K0SI9/VTwDp448XfP52mG94nwgbKq
 NH+TrWW1YdlXDKM7dmp1f+RGIe4n/EZA15DnUpXMBkGWUO9c7UbVbh0FThV2icXU9/3b7zdGrkC
 mIk/g8R5nkJKOmbSn+t14+7rPkFCLGRUpsh3WvfU38RZMvSGkr+HmYFxUQxHzIXgIm7DIzWacvR
 /BRNtoMZy7saJBMOxJOFx7IMvbOgQ27hqU7vfw19IXkLq0dDKdmXzVJe1/GTMYr0Zs9UjHeTwI3
 7ZNKFb31ffcqo3bsi4iC2mutbbNRNSG01bUytOhya+WcDDQE7melml70NqqTD6rAdh8mLEK6ija
 ZmS0lJmqCBSCFvEgwir1HqVMbVRbgS/US8LqsN3JRecoESfA1FUXdMEs5AfxFXgUNd64FUOkXjm
 GD382J03EVUFoS5KLRUzn8kVAy1OW13x3aHiKielhfKXDl/ERrhEXzIE0NJ+plYZR9/S8X2uYoF G7LUOgiGtxQPRlw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-46-a2e13cbc17a6@google.com>
Subject: [PATCH 46/46] rust: xarray: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Tamir Duberstein <tamird@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
---
 rust/helpers/xarray.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
index 60b299f11451d2c4a75e50e25dec4dac13f143f4..08979b3043410ff89d2adc0b2597825115c5100f 100644
--- a/rust/helpers/xarray.c
+++ b/rust/helpers/xarray.c
@@ -2,27 +2,27 @@
 
 #include <linux/xarray.h>
 
-int rust_helper_xa_err(void *entry)
+__rust_helper int rust_helper_xa_err(void *entry)
 {
 	return xa_err(entry);
 }
 
-void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
+__rust_helper void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
 {
 	return xa_init_flags(xa, flags);
 }
 
-int rust_helper_xa_trylock(struct xarray *xa)
+__rust_helper int rust_helper_xa_trylock(struct xarray *xa)
 {
 	return xa_trylock(xa);
 }
 
-void rust_helper_xa_lock(struct xarray *xa)
+__rust_helper void rust_helper_xa_lock(struct xarray *xa)
 {
 	return xa_lock(xa);
 }
 
-void rust_helper_xa_unlock(struct xarray *xa)
+__rust_helper void rust_helper_xa_unlock(struct xarray *xa)
 {
 	return xa_unlock(xa);
 }

-- 
2.52.0.158.g65b55ccf14-goog

