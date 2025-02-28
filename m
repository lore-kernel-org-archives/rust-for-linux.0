Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D13E26B2C5
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 12:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746411; cv=none; b=N8uRBB0OaYSAzHFOhw9kw8S++hDFd/RsF0+sCqT2pWotl4QRjkLUMDFm0eBCiUbc01accf2RyKTtCIvMY46saL+F+X8u8Le0FO643dGAMlVaeKThVjYQ3wngzS79+GsdEKi2Bbxq5VFp9kEknpLwh4nFUqxa1BJ5VoqoTFgGOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746411; c=relaxed/simple;
	bh=ZcOD6O+e4opbd5kCSvi62otmJFeNmwXLjRXcW+if/rs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CfvhlRwsxnLjnIo93myx3lamQI4nbLh0nRNFE8JsnqvAHl0v6jW57hc5ehRbn2eHdT9W+0jXR3t1OgUQnXcPrtf5s/NBpyrXE3egwGpQPgzqg3wvJLFFjhlKrqIx5I5PbR7XnEgeAagRswmiaW+UkEs9vythB1KUc+AgLjFK37M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eohs6RMb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eohs6RMb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43988b9ecfbso10337805e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 04:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740746408; x=1741351208; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pofL3PjyOttZbsi+AAPKYxkRFtjnFNjm+r6OKyU3Jc=;
        b=Eohs6RMbGF0ws9o3QcDbrYYz/9sLSvJrfMpFrwb3xMOYXES7wZUoQwmfSJMFPgwxnN
         a7jM8b/Hj+Hr4PryaqWKJrkV+8vEnXLIRXikaVw/vQYNKkbHMwCQULm3nT99MjpjtKlN
         FQZ6VAxDfosLKxSMF5UPw2o/ZQ8F1ajae22W01w6V3Cha5eKiTaEEd3sJ9VhgyMDp2Ib
         qF5N65Jh89KOC0WTdKeNIocS9TY+d7MrKZejFRYaHXhfd0XmfTX6xyldKMXFUAUIpwqA
         Nrc8LdcqqeaMf1G8EIzYeUL5jaRoXZ9/VbbISOkEB+YE4KpKMCmqLKrWsiJXhADMTsRf
         tGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746408; x=1741351208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pofL3PjyOttZbsi+AAPKYxkRFtjnFNjm+r6OKyU3Jc=;
        b=VQZOiTWcT7osXUJY+mzGmvQK/xI+5WvJ5tKB8N9UO8UjgShFLLq0/DDzy7bjxX57bx
         L8eaZdgfwfgFSCNgvLZb2oXbAOadevKrOw4kQUXRcaeo7uQY56cHkmrLeLWouuqulLgh
         m/uK64L27hQ7mxdSTBT9D6uHB7nyRzDgQH7GVKjbrO5QWA4O7yzqYuveRcnzRln0PqbB
         ugl3hv+8VeHDEYA17FTRnqhpoWGRVgwe1RsAWBi4x6po1+frj7wc3RvvjVGD4xz1/im1
         LzYgYOyW9d+I8Lt0CD1jwdsQbQRLcBTKYLIAxrHb5HkE8hkqIe/FoRw1VQBJUWWO7QsP
         yjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkThTUWS6yO0T88LV9yZERCbpZsHGZr5Do+BaPYAX2hVywbj5NZkEIiNTReRcIHmV+ewZGPFFHN9OsPaqThA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWOdc6osJk9XBCS8qnWMnAafKIflGI+Lda5Xbv0Md/nWy00wI
	QFoMy1YmSrk1EmfmjDEpUZUNiWdEJymF7onOPOorAlXhQjWtzheJqKDXtaTDxjmJFZy3XZi+f9v
	MDhP3HpcncMTuLQ==
X-Google-Smtp-Source: AGHT+IEB4CLEaJ+qcbV7KVAUJWH8lLFxAEU0yznQEm575/JtfTpZwy4AyFvnI6lctCz2coNH3yp6bCwEPD/9KY0=
X-Received: from wmbgx24.prod.google.com ([2002:a05:600c:8598:b0:439:4366:35c2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c8:0:b0:38f:452f:9fa9 with SMTP id ffacd0b85a97d-390ec7c999fmr2855371f8f.2.1740746407926;
 Fri, 28 Feb 2025 04:40:07 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:30 +0000
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2129; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ZcOD6O+e4opbd5kCSvi62otmJFeNmwXLjRXcW+if/rs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwa6gD60PImwfkkxa2KFpiXq9/w2BWpeDHAYuF
 HY9+9v6Jo6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8GuoAAKCRAEWL7uWMY5
 RlA/D/4xOjjAKDHvotub7uSZH7J7bXp09wrMC83XiONmJ8ooDIBNM40VRIhnD9fsRBHxwRlyWJ2
 Kwti5p3Z3nl4+yLiulPukfaUxTp/Rb3vmImVzX+bcZj4my8iKDQzyA36aQssqbbtH1noQHBC+pG
 Lk4eSHE+kem98SXqPQ6mM+++r5oFHZp7XmddA4VFXjm/RNWheJCcVxddh4pIZaFR0gkCzgKjaoM
 F6ebM3hEUH3i4mk3LT+89cVLV6pUlQ0YeFPIpDmLySdH6qOzv7RPYzVc7D5opfVFo2OkzvUJqah
 eeWLqrufXB1afblwaqI3xSx40Hde+wthgNEmd+wHFJTCM45s+KJNs9q885dspBKBRJSk9qH1qJM
 GM3BDXno6f4+/IlcpjoDqhJxZJiaqLhn6UKP1JRg+YNjvxvmtbaE9zquS5W/zJkF7mr4OvHYzT4
 JTQs3MmMxVtWLjEIpqFUz1sbZFuW1u7QTDUE2xVEtjdupnXBP+dP+geMGIOMK2kHtQOV86Ez2IQ
 OTdEASyuSSy95MldW9457o32AKMWM4/K1TZUlf3XITFOlxrXHn2dzoo6DNZDHS2RejEWdc6kYIU
 UK+N55oBRhryIBOLjNK8l9oNxn+vZ23Bi+oiULFoeSfygjizwNEEZQlxlAhrzXdN3SAlL6I5xNe KMISLLVgrNS99XA==
X-Mailer: b4 0.14.1
Message-ID: <20250228-export-macro-v2-1-569cc7e8926c@google.com>
Subject: [PATCH v2 1/5] rust: fix signature of rust_fmt_argument
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Without this change, the rest of this series will emit the following
error message:

error[E0308]: `if` and `else` have incompatible types
  --> <linux>/rust/kernel/print.rs:22:22
   |
21 | #[export]
   | --------- expected because of this
22 | unsafe extern "C" fn rust_fmt_argument(
   |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
   |
   = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
              found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`

The error may be different depending on the architecture.

To fix this, change the void pointer argument to use a const pointer,
and change the imports to use crate::ffi instead of core::ffi for
integer types.

Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 lib/vsprintf.c       | 2 +-
 rust/kernel/print.rs | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319292..a8ac4c4fffcf 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2285,7 +2285,7 @@ int __init no_hash_pointers_enable(char *str)
 early_param("no_hash_pointers", no_hash_pointers_enable);
 
 /* Used for Rust formatting ('%pA'). */
-char *rust_fmt_argument(char *buf, char *end, void *ptr);
+char *rust_fmt_argument(char *buf, char *end, const void *ptr);
 
 /*
  * Show a '%p' thing.  A kernel extension is that the '%p' is followed
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index b19ee490be58..61ee36c5e5f5 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -6,12 +6,11 @@
 //!
 //! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
 
-use core::{
+use crate::{
     ffi::{c_char, c_void},
-    fmt,
+    str::RawFormatter,
 };
-
-use crate::str::RawFormatter;
+use core::fmt;
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]

-- 
2.48.1.711.g2feabab25a-goog

