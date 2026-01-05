Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621F233CEAF
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616998; cv=none; b=YtFmH2WSTDGZ+y5CxQQHwTT4Pu8MI09D55xvCBpnl5wEt6T143I+G6jmJ9LRxSms7bTWcq5LdBumKYSFUdK6AeRHAIimJHUcvvfOfcuBdJ5oFW84dUQzdVgz4qJSc1fuff6AlZFlFpLHIBJsNgzhVmpTT0fWONt34hnqiWk2QbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616998; c=relaxed/simple;
	bh=otlLyVDzkUAMP1OY4eKzeJJxqAkaXTV7lyQMF4Eovo0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dg1OkFKupWk1YjWyRN78paoLYhhIco8wwxcbh36mASzzX1/l75BJ/vMEZktJ5l6Dd1ZgZWknb8E7qn9IyIVE84KAIFP7jFQvDp7dZkKQ0eIFB7tvFTRe4/IfxEE/ysrZErYNJwwGoHOmICBqR3d46/LiG86uNgSSW7uPprmWy7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vsLloxDR; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vsLloxDR"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42fd46385c0so7539542f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616994; x=1768221794; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5q2QBFaDvD9xVwt2eaS2BVLwfihwB5o+cPHw/9/HFE=;
        b=vsLloxDRk/tYjW2jYZy6bxl5GChD6xTtMJ8HBs/MKHBaxi+PTN6fdzbuDab7eef+Os
         ylaJOCQlcNaC82JR34+xl1pyPpiWKl0HAO0V/HWWj75XLHzLoZSWwKmzYgOIDANE0O6h
         KSqOyz7DueT6zn/LgYYaZPRXZELRKZdD7z964TBs4V9SaVReRJ+vwX39HyYhZZtH+HPd
         1trTLKDrABKI/SHSFoEfnXSnYcyMSlZIo+XQGkWUzWCuuzH7cTe9TWOmw9I3qTRhV2cM
         tl/f4p6+dZbJPwmg8YJPlGWtF2xmsEFfvg63Ul3FD46/LkoNTcPhRJrAD54y4jpWzX5c
         LJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616994; x=1768221794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5q2QBFaDvD9xVwt2eaS2BVLwfihwB5o+cPHw/9/HFE=;
        b=rgda/9qko7QiE2QXkubm3wk92IvRFDiTo7T5jwmhfN6kWO7fyCkQzJ07exFHRQKNAF
         /I04KURyJb1M3yl7L07mU2u6oq6ZFsX5hMZ2a0wEGtnqrxaKuOCaKbki36kq+FVRp/Uc
         uweDEWm9tLdj2mDGrWhLLLiwze33PMUNCp8zELxXIESktrW/tQGLkV/l8xaqRGL3Wy4y
         iNQ4VGAo8AqRgj/DieBqYQntXyy9POgbrl7reonHreZPg9iGub4RxzcFEXbK+53jG+8O
         Bg/J112RBx/8a20wr/sp63sSDUIekQnSDfAd/YEQvNSRLaJACXfmccESwaCyZe8c0lUg
         ebWg==
X-Gm-Message-State: AOJu0YyHKNB5S7dimHctLzRy51jvBqGHsDiXtDNcaQd1uiN138S4+o01
	5N2WY0eTVFfng9tsx+5lke4nF/VVawfrwF8088/VtBeQd+CRXYDchh/uGmA9F3DRHVusqeWVp1I
	Y8lhZ4seMQW+fIVj5SdCA6KZ0Wcoqj1j3sshSqTSMQeSbknQp27IdttFGm7LaJ+DRKyvOmDXrbg
	nejJgDQeLFf6itdD32reQHqxC5w83a76EaF7bH/5g3xsCLEQXIIQShwnq1Vm3YqEU=
X-Google-Smtp-Source: AGHT+IHvT+4kWABn3Eh+LHad9nDDqTFKF0l5xVSN4Y9Wh0iG7+6TinVrYeEt5ejaUF7Ddyt4mcnwEsUj3zP97m8=
X-Received: from wrbhb22.prod.google.com ([2002:a05:6000:4916:b0:42f:bc24:1400])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f49:0:b0:42b:3dfb:644c with SMTP id ffacd0b85a97d-4324e4c157fmr61721326f8f.10.1767616994341;
 Mon, 05 Jan 2026 04:43:14 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:39 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=otlLyVDzkUAMP1OY4eKzeJJxqAkaXTV7lyQMF4Eovo0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G9AiPaalsh8VyetdgUVJX3ZWsDcS2ZyJrt/
 pybQx87ASiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvQAKCRAEWL7uWMY5
 RiuhD/0cWzw0lQAKBxeEUw0KJboUbHK2MKPtSDoZ+fXMzzYS/OAFSJPn12BT3DkpyuiR+SL3ESX
 ltnmcSfJZyN/bSDulT8k2BXkD72nku0nYI0eN1oldnL3zh2+pX0Pp3XysZGiFk85hDovO/WgxDn
 TAIUYGGWnbldayMGTrOUAC+L6y+oiGX20VqkNoc0p5AP313LgcXZcaeg+3/coQuY/qpPrxmXmJq
 GpAzGmPiPfWW9+GEifB4FpqSgW2WPqvs+FN0/iRoL1oJSWMerdv3hHDR15D5fNleUiAKQs/F4XS
 jyw1N3a56KMg1AcTnzIcX6qfZHbnubtCvXfbn8ih2kk93nkSQ98H/fJISf8zh0pCP9yg4ZCeLbC
 QZDVmiUxvADWkXOqVaMXqrkLqnLVReeKOAUlKvQH/CyWiO46IKH3z19u1rald8EIqGcSP9Q815E
 6Mni3V4LVeCvVp//wJxE2O1YR7HoqOxBD3MxmuwFBPSCFt/53/Gg7XjyFUdLg6gJH4xTy3lUb14
 YUHwZhvpFFSsW30z8u5KTh2W+o43V2/ULc04gMBPk43Pc1vKnZO6i3DpcCLq+qHOv2MdLHIySvp
 jBXq6RCiozuSE1W8KT5hM644FGEiRd7B2Pk4B29L/MWZnlV85vkoiIlMCGAXQRrP6VVnjRO/sw0 LDOD09ufz9Feu8A==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-26-51da5f454a67@google.com>
Subject: [PATCH v2 26/27] rust: workqueue: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
---
 rust/helpers/workqueue.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index b2b82753509bf5dbd0f4ddebb96a95a51e5976b1..ce1c3a5b215028cc04e2f4a7d9c9c60931792e07 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -2,9 +2,11 @@
 
 #include <linux/workqueue.h>
 
-void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
-				    bool onstack, const char *name,
-				    struct lock_class_key *key)
+__rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
+						  work_func_t func,
+						  bool onstack,
+						  const char *name,
+						  struct lock_class_key *key)
 {
 	__init_work(work, onstack);
 	work->data = (atomic_long_t)WORK_DATA_INIT();

-- 
2.52.0.351.gbe84eed79e-goog

