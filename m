Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A51732827D
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766163792; cv=none; b=RN+0HfhYh8Vbty0Bxiy6lLgIxV7DBSvr2smE+9qU0Imp4debT+bMZik7SCSyY7V4u+PFzp0xhc46KjzvGgLe8CalrFnXWlwH/6KiKR9SPU2+rTDOwm+aJdkQtH3Gyxu4Xpgs7eewDsMl516tEjvfRIe4E+Lh+pcQZs5gOJnv4Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766163792; c=relaxed/simple;
	bh=egoZVQFjPWXGAtIOxW8GGJxkfc1zdWWNBbnwf9mSVYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MFVXTnXIjjtbTX2j6h7tmdlIWGZmeeOxioQhC5WZy5hOLunvKC/s2PWjs5kZKhL2Ob07CmLqI+f2DtBLKZt61NoPAP/1aDMuPeoTovzWbERxwaUh9D76ilGi26lUoezAnb5oMr+1cPs1LDeA53zh+43ArL0R0k59l24Yw0mH7LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkW8clCe; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkW8clCe"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5942b58ac81so1721631e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766163788; x=1766768588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma36rwIjBKTPa9sms/UpO3LEYEw0JfjoZI+1B4sWIu8=;
        b=lkW8clCecQtiCA9bBuGNyAV22GNNKiOyDSdF7e/INllEh8Cd85PxlUtNG3xN/ZzQwz
         WZBnTdSlNH4zd+9QiZf1dljq57mxvXQDBzQHWD9Y8R4zkiFywMQCbMgGREZ85ZH1rg+Z
         wM35vQyjMPcAyowENVmFLrHf/LDQWuFTZODmVQ4TYygnVTZcCmzVDUyfdaksaR5wAFsC
         LF6JHeX1AyPhXHrlDu7JsDep0JsnoroPoxbP2Lzj8ENNs4fR9jXv4nruVHP1bhACjPBN
         367d+Fii89tV8UNmPOg4wrMRCbmhosvUWgMtaug61HR6LeQwWPgkKHtM0HRyGAdZGprG
         g1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766163788; x=1766768588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ma36rwIjBKTPa9sms/UpO3LEYEw0JfjoZI+1B4sWIu8=;
        b=m7ZBlMFu7uGHOAKqUD1lrfSfDMAwc5SWVhcpOt4cgcjjMqNGJrt/E3KZmYEi2+KM62
         iYhd5UHvIVwnOI2tazLQ719hfvyeKb0qatfOfv+ciJUsAxyaNEdFQB8KcdeLccB/sBLE
         p9hKde1LyKFBzAQ6uxU2beGYlG3kK3eJ48qcxlYUU5ktnJJwJRuQcx0pfSPxh+iKA8bH
         irtzI8kgPDT8DDk5pS7NMRuBsPNNwpdxRbbVAvlN0HdeJWsPTwe7b9WefxfchPt4URH9
         lMF649Ygi6cGu67ujvDXsudHQuXPvBkyJiSiZs6yXcriIdL2+rICAXeGkNBKX0F0E6hz
         yFiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFGsxnzk1j2yh8CmJNarYT1mKjadS8w4NP5dgw52jMoGapI9oHAmLicxY9+ZsPWib+inOrGaVOO4aC7vqqZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFaviOerEf1eDI0zIhji7z3JknvWoPBtLP0Q+AuuPqImmcflps
	rEii0MuaQusUZD2bzn8IfRY+qDKxwLtSUYkCIlcRefUUybxyl2NlB31Z
X-Gm-Gg: AY/fxX4uWH8y7b9MO7P1YBLZRnI/i0mRtQrQ81lvaVIJesjKU8gu+JYrooK0BjdI77J
	LdxHPi9i3/lUo7qLtUvCH8gP7giLsy0xaBIN+IQNBGjUx7Ax0R+9hxM1fi3XVDoUdsJSe1pSMME
	OkeS+lU2o5vavnec6nkSgqgWaQBFpMe4KiAIGOkWLo3oA/4kebkIOU6A1rZ7133MvtdJmCq7t/E
	bMGGLUTdYTwVuKGnSE7m9e2t6YJxfTklKrxBQvF/MI07Z99neHkFSgP++GyNY4djsFOaOVUxvMN
	CEIvu+jEnzuMhF4iepeLP5+mo7vkqwpS4xhoOdDa5ScAm48N4+o+VBUxDoRpzC76Z3V96da7gzi
	tfOeARXNIXTT2NNeiIIRw0hf3uRH1WMNe+s6qiRBsexQOZVZ15UjC4ZWyiGteg5K3UB9Z7j4Dhb
	9tcIo4owFyQL2ufiuWs0P0ABgwmp9LVo3zL7vqEUe3m4vlBiB4PUZY/rakuf3PbEbBOnXwOAtzt
	lQZXA==
X-Google-Smtp-Source: AGHT+IHPLj4Rik2hLkTATs3YXSZ7zfCQNkBcE6S2phkIRux+ZDXsQmQ96eqxP9mRVz4A0fUxd1NEGA==
X-Received: by 2002:a05:6512:3c8b:b0:595:81e1:2d00 with SMTP id 2adb3069b0e04-59a17d1c2d7mr1454976e87.0.1766163788384;
        Fri, 19 Dec 2025 09:03:08 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (84-253-208-48.bb.dnainternet.fi. [84.253.208.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d6fsm828449e87.65.2025.12.19.09.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:03:07 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 19 Dec 2025 19:02:51 +0200
Subject: [PATCH 1/2] rust: pwm: Fix potential memory leak on init error
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-pwm-rust-v1-1-46873e19679d@gmail.com>
References: <20251219-pwm-rust-v1-0-46873e19679d@gmail.com>
In-Reply-To: <20251219-pwm-rust-v1-0-46873e19679d@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766163785; l=1470;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=egoZVQFjPWXGAtIOxW8GGJxkfc1zdWWNBbnwf9mSVYw=;
 b=0GKkMQPkd6eS4+0/cMSPxm7esjCifgCh9/TrrsM6cbCbcR9aV9MJTyvbp7Ndmbqd+z0nUJoll
 Hyk1uTz02AACSJin1ixFVu0sI/nIrry5tctiEiNE5zQzD2Ec7rdwuHU
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

When initializing a PWM chip using pwmchip_alloc(), the allocated device
owns an initial reference that must be released on all error paths.

If __pinned_init() were to fail, the allocated pwm_chip would currently
leak because the error path returned without calling pwmchip_put().

While __pinned_init() does not currently have any failure paths in code
base, this change makes the ownership transfer explicit and keeps the
code correct if failure paths are added in the future.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/pwm.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 2dd72a39acb5..4b6a3b5ef929 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -607,7 +607,12 @@ pub fn new<'a>(
         let drvdata_ptr = unsafe { bindings::pwmchip_get_drvdata(c_chip_ptr) };
 
         // SAFETY: We construct the `T` object in-place in the allocated private memory.
-        unsafe { data.__pinned_init(drvdata_ptr.cast())? };
+        if let Err(e) = unsafe { data.__pinned_init(drvdata_ptr.cast()) } {
+            // SAFETY: It is safe to call `pwmchip_put()` with a valid pointer
+            // obtained from `pwmchip_alloc()`.
+            unsafe { bindings::pwmchip_put(c_chip_ptr) };
+            return Err(e);
+        }
 
         // SAFETY: `c_chip_ptr` points to a valid chip.
         unsafe {

-- 
2.43.0

