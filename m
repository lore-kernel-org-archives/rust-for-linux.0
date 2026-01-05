Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDAE33AD99
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616985; cv=none; b=gG2cl8cG9OTZ1RIeC3Y6j2Pb6jzgNmNH4u7DjsMXuGtCWlYDcgNamID45zs62ZffX+Kdv5Wr8FCIzfFx2iTAIJ+9K3h9VlVD2eQylTVNg2ymvsZ3u0kHL+MHjbYhFrthMtlZl37AUQ4A1KSOsZ7H4o7tCSp2s80CcAFO3VvemfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616985; c=relaxed/simple;
	bh=JcYQ1omeY6gJv6l+RACx70Ju3nHpWHznVfksxuSUcYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V/1rn9IgPwTUFcGLWGoY2L6bKNWFFGU41CrSvF6vrvm4BUKpFOorBspFIJySxCKhLjUDDBGW4EAPAXPKcL7bSymL8HaamDn/SYyq27lv7o9X/hkz87WEHUMxUVowK97U929c4Vr7Lsk7A74BXljCB3SL64mwVicg04cUSvtW5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZI5Un5Sz; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZI5Un5Sz"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b841fc79f3eso32889866b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616981; x=1768221781; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2uiDz9ykHuG/rMfuTRKUmorkVYWdMOdX6papOab2pSA=;
        b=ZI5Un5Sz5h6G/OosqrOGmjJMddyNmsa5W1bpaIVuOKG1+dohB33EYYNlaHJWi96UYs
         kRi9DuFvXxtiUZ++a4CKN7oGwy0Sq3uzWvRHpd+DlnOYMIXbd8h2LsbemcUNjVgX6Ip6
         xR8vx/+zqeWWneyp3LwCnJwe5ypsnSfihoD7gWk2JNFTV7WYyXoOma0UwWShuzGwttbb
         GFLVnosBuxn0hmtpxhq9qGIw0Q4nkIJCoBWPxcQB1CJzfo5Jo2viZ7JLITzdOFCpAuVz
         y0aX10LhFiiByyeFWIN1bWcs2UC/iTQgpmsNN/iYBJvsHm0XXB2VIlse+8VuzzN1CVKY
         5/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616981; x=1768221781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uiDz9ykHuG/rMfuTRKUmorkVYWdMOdX6papOab2pSA=;
        b=TfN6sSrp4UAGRZDc06OYO6jXbaC/Waz6sb7giBXq8mDq8VqekgHr/rALm4DJvQv9QD
         RSr/1djB7+THntCHdjfL+R55LkM/CON4e77ch0Br3tyd0VeUeqDZEdm4QEhphFfsEEVc
         g6LakSQ4pp5kwbsnS96xOrWv8On9rIL/O2vbJlVe68GylezLxoPhzqRJlJXEINdtJTEf
         6r+0DQNqmWHmIrVnrzfEDH/9Cc4xmlCS/QMt6wY4m5USTWXbEM3dFwwnyvLUvjmv1+M7
         EXSxT/WSHfmoBrQYoqlnwFjXkWSiokzSA0cQd3lNEXISOpbwgh0E4GIadqaiRnfR5xuy
         VpOg==
X-Gm-Message-State: AOJu0YyovBpXPg3BKIfmcNhgC4SwlTapgb7yPCYBNjNPieAUzxvWvE9L
	6cJTOoGR1hp7z1P40DlaaSPuxuNVJDXoJQ0EQe+fPDkuymU9VzccmRK9jrZ+xak045agdK1UyU9
	CD88xTLgT9KWXvJSUf4EWYOpaLvua2mMO9W1/i/6FnNRHZzH/2hGcOgKjxjFdkjpH9Jq1PlD4kK
	fOuGJCuIH9D2UYpMBH1TytHyqFQHHDbdjlEsuTHu/Uqly6sFIaWAIPtfq8CD/8ETo=
X-Google-Smtp-Source: AGHT+IEVHIDdB7yliuGbqSlS5enlFT6fAyIS/QRlFDzV15rkzjy74HKakPNSqSZH6zNk61ODtZr2WP6TVk59mZ4=
X-Received: from ejcvx1.prod.google.com ([2002:a17:907:a781:b0:b80:fa2:42e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:da2:b0:b80:1348:226e with SMTP id a640c23a62f3a-b80371a2bc2mr5313078166b.33.1767616981603;
 Mon, 05 Jan 2026 04:43:01 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:30 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JcYQ1omeY6gJv6l+RACx70Ju3nHpWHznVfksxuSUcYk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G84ONv1K3k7ysWcmV40CkzmkbJD+CDIXOPD
 owSL02oVxWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvAAKCRAEWL7uWMY5
 Rl3QEACP03W8+przBhcRFQG5g0TM+aEI7zoQRW8kSqTNbOCUxhckUbMFfWLjCyoMFUrofGhQapj
 9p/AoDpxuW2x0qfBeuKqUhwjCHj+eP2fwRLFAgqz+FKQR0TMmHRZuKGLgkmzMAGL50XnlHS8fz+
 5eMNHdMYcG8+0uEYVFIdKV/ReiX3x1EXz4l+98Gqmiv6EDdU0/JMNejcqJf4thVnTpjLvaj5GGr
 sW/Lgz3EjfriZN5Ty1hKkHY5Y7liNd6Sw+O9vLn1wMOxo5yCrr1JTXfCPoJisO2iBHF1pYoZetO
 bBtLKMMWfDaqWhqfmPJrxiRjX8vr1xuWlLQqclChSgEa5JSrdKYjbqDjRnMdouXR1NV640elZbO
 /ET17g/M/i6Ay+8A1NmCuCYJbh2VO4WYk3nVhgbZGVrmBFBmsgqK2XgHreekmliiPulCrpYP01c
 gp1tZQtLgASg3zeWMmvDbqFJNPcpM0ZiwBXL49iIwZXX9tRtec+f2v5UgXUyU0Kd9CYogQCHcCV
 aa/WyOrECLT6ZxClV04i6o0Jms8/bWMQEjeS3onvsYGbPbKtfS+BF3pcid0zEmewJdescA3XXPJ
 MVaRZ+IEGd8zc6eeqkYuiLcck7z6zFFzgJGE1kurHbEzZVIFLLjdg7Pv5X/rjv8T4qKku5SnTnz 5Vj7iVFBz2e6EzQ==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-17-51da5f454a67@google.com>
Subject: [PATCH v2 17/27] rust: refcount: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Fiona Behrens <me@kloenk.dev>, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Fiona Behrens <me@kloenk.dev>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
---
 rust/helpers/refcount.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
index d175898ad7b81ee9da3d9d125764db02e837da52..36334a674ee42eb46792210903a0e3cf9debd9a1 100644
--- a/rust/helpers/refcount.c
+++ b/rust/helpers/refcount.c
@@ -2,27 +2,27 @@
 
 #include <linux/refcount.h>
 
-refcount_t rust_helper_REFCOUNT_INIT(int n)
+__rust_helper refcount_t rust_helper_REFCOUNT_INIT(int n)
 {
 	return (refcount_t)REFCOUNT_INIT(n);
 }
 
-void rust_helper_refcount_set(refcount_t *r, int n)
+__rust_helper void rust_helper_refcount_set(refcount_t *r, int n)
 {
 	refcount_set(r, n);
 }
 
-void rust_helper_refcount_inc(refcount_t *r)
+__rust_helper void rust_helper_refcount_inc(refcount_t *r)
 {
 	refcount_inc(r);
 }
 
-void rust_helper_refcount_dec(refcount_t *r)
+__rust_helper void rust_helper_refcount_dec(refcount_t *r)
 {
 	refcount_dec(r);
 }
 
-bool rust_helper_refcount_dec_and_test(refcount_t *r)
+__rust_helper bool rust_helper_refcount_dec_and_test(refcount_t *r)
 {
 	return refcount_dec_and_test(r);
 }

-- 
2.52.0.351.gbe84eed79e-goog

