Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0341B26E622
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746418; cv=none; b=gNrgNwD6ZmMIIsHJ1v/lD/qfHtMpX4MEWaSUbGdfKmd5T9EybzVBmOgygxruZrBQxagT6VZIl4ipj6chVLiLpoGtGXTZk6j8owVI7h11Yi0WGMZkZX0LV2Pn5U3I67l0YzY47I1dvxG2oIEUkp8YV115Kpmm29tZeprNO2omFDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746418; c=relaxed/simple;
	bh=r7jgVsiiJzFKABmvsoHtJDihUf1aN5aOfGCQnlUXLR8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZpaLCKKuLb0KlOUXGGxpmKjRYf7lvTjqwJ/LESc8Ie2thU7YV8dEL7QPb/63UCStO6addL1h1sa9GtMxDIAZbCTn2OQuy8JFlGmA8pKS1yqqD/4Mz7OnVClaVAvjYp9ranp3rBLuwz0iU5Sv/Tik2WLr4ka/J3dSOzz5BntQD9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bzm1HW/W; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bzm1HW/W"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ba50406fbso12847495e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 04:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740746414; x=1741351214; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G+5gHFsUk/zR3QwRdy/hSALMqHlURbjWQTJYZwElRBw=;
        b=Bzm1HW/WaiU8mt0VN/aGZLpWWHwT6ZzHUwCAZzA9IhOjKIzWMUhjGl7aLfBJ0U9OtT
         0fFlTIFaV/AR1aruvNuzKRwgQ1yMI/ah/WpbRMya5Q1ZooHG+SXz0FTteIQ3/JJOlHMM
         wTDDYBRM1y5wqTnOMUZXuzVXAglFCDDIhksj+3VwBwSHwy/wnjIqyV9FLfxjkwMm4Dpz
         Cld4/hNOi2hhVqkCy9Dq4sAH/N8+S6nRtcVzHMOcvOOzCeyjd8skKzRyHpExGuvI3Vto
         pZELgW8lR8qPtNyyutNoC3YQaHQmR5keP1HexIbiGUKZWZ4RgM83Gsajt0NOPk3NnOPU
         5bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746414; x=1741351214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+5gHFsUk/zR3QwRdy/hSALMqHlURbjWQTJYZwElRBw=;
        b=v+AIsR09pitJWCENKnWDNNqALFRN3mNQn+8fsGd7+Ne+8ltRlobW4OXBWcHpLWVOS8
         BbpS807GAM66xNKMxodT0Svp+mI9GNgFNeAHlI8QJcXHnj9lV7novd5VldWZcsX56ZgI
         cm2ULGcJNA2sElwaJmv3WDazEi2NhX/+YkuzzXAkNEkh2TTVsERTHm76bzmSXP7riG/k
         cBke1z5JtZtvtizh6eaCS+RMoK4l/tgoUiol0qJbAQH+1ib44B8RKk/VDQUEaCPwUI0p
         KOAmoy3eeHhrxpYLA3EAAxhwcaKTC4AXjE23+DZcd1a9ci5J68qdhlIq8SbNHSkjnudT
         YI1w==
X-Forwarded-Encrypted: i=1; AJvYcCXIwWIrA3DGYmsC+voIqYEtU0uyGxzn5cFDVuO7tkl/94eFZBy61SK7FJQz5OGmNAdeFJd9xoBYEDna9UiE8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQmHSBodB5wLbJ8f/aHoWiNOO3wWB/6PiE1ginbwcAsGAbpcjo
	NUBPVAwLt/IsiJ2wVuXiX7pHFhIAZqmQw6WKcSWY3iuPlkjqV+OrqjIVIYQHVduGvfRBBC27U5p
	Vo5dg+ltABh8iLQ==
X-Google-Smtp-Source: AGHT+IHbIphIQcEXilOr7Ntw6WaNAr5phX1XmvUcyGqxwt+X3Cd6rOdQsMiRHilLofVXJl6ZHWfjzIcpQ0HSDVU=
X-Received: from wmcn18-n1.prod.google.com ([2002:a05:600c:c0d2:10b0:436:fdb2:fa5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3507:b0:439:3d5c:8c19 with SMTP id 5b1f17b1804b1-43ba674c911mr25914985e9.24.1740746414470;
 Fri, 28 Feb 2025 04:40:14 -0800 (PST)
Date: Fri, 28 Feb 2025 12:39:33 +0000
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=r7jgVsiiJzFKABmvsoHtJDihUf1aN5aOfGCQnlUXLR8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwa6iZBH4LXAf1My/2Bb4bMU2tOy+URmQaqy+I
 0YgolPCIOyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8GuogAKCRAEWL7uWMY5
 RntsEAC4uGdMp+3gOxWauz1JDyiZzR/Atujxvqo0jIjAoxK2HzkZY9QWUrC7RzFUKejI9Kba7dK
 6I3yW8hwYThfVdITfDRhoegt/cJ4p/rBCktrQ/bDhIz0Gtg8Je8371Rg+tfgNJW15cdXD4eWKBf
 UUPBZLV/CtFQyCyhALtXPzhVfZrWxTqko8eE5bZP7rDrNZcPCUqqdGmYDLf2uyuSUkeW/L139bb
 DZqLXQ8oIjoGwuT6lvqTCQtZiBc9csEB0JKTywoJAO96QK8BmySRWsEBoBsBeoL5wUWrfk3Vd9b
 SSMMVT8XIJqKL/DxtvnppRQWiXZbdRaTaNVmh4hFbeOKPp9W2mbYaLlkXBqX/rRrYoOBE1jYoD7
 n6MAIRSn4PoKhXOjfHr2ZqZFlEqrVpbZ33bzuIFnXnA0kzjTyO5QCwUIXghkuHdS6FjHa+yaAtV
 M2OIf2DAn0roOnGvIAu8HKCa/RY2fc7oItuhyF727kP4bWhnRUpm+0vi4O5Sdveq0W77yQgQS2B
 hqWpZba4ARnFFAT0uSS+CpMVdFPYwqhpREFLcw7qXmfVWTUYcjEMYxnrHoHf7qqtOhKE4Vc3QSS
 aCIyd8EwbEPwOybRVuVFiJMrTqtMEI+50Fm7LZ5wFZLOOevDJSvKQbuJlzgVE+zHoTuJxhz0ijN QgT9cliZsSNsMag==
X-Mailer: b4 0.14.1
Message-ID: <20250228-export-macro-v2-4-569cc7e8926c@google.com>
Subject: [PATCH v2 4/5] print: use new #[export] macro for rust_fmt_argument
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

This moves the rust_fmt_argument function over to use the new #[export]
macro, which will verify at compile-time that the function signature
matches what is in the header file.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
I'm not sure which header file to put this in. Any advice?
---
 include/linux/sprintf.h | 3 +++
 lib/vsprintf.c          | 3 ---
 rust/kernel/print.rs    | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
index 33dcbec71925..029ad83efd74 100644
--- a/include/linux/sprintf.h
+++ b/include/linux/sprintf.h
@@ -24,4 +24,7 @@ __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
 extern bool no_hash_pointers;
 int no_hash_pointers_enable(char *str);
 
+/* Used for Rust formatting ('%pA'). */
+char *rust_fmt_argument(char *buf, char *end, const void *ptr);
+
 #endif	/* _LINUX_KERNEL_SPRINTF_H */
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a8ac4c4fffcf..1da61c3e011f 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2284,9 +2284,6 @@ int __init no_hash_pointers_enable(char *str)
 }
 early_param("no_hash_pointers", no_hash_pointers_enable);
 
-/* Used for Rust formatting ('%pA'). */
-char *rust_fmt_argument(char *buf, char *end, const void *ptr);
-
 /*
  * Show a '%p' thing.  A kernel extension is that the '%p' is followed
  * by an extra set of alphanumeric characters that are extended format
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 61ee36c5e5f5..cf4714242e14 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -8,13 +8,14 @@
 
 use crate::{
     ffi::{c_char, c_void},
+    prelude::*,
     str::RawFormatter,
 };
 use core::fmt;
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]
-#[no_mangle]
+#[export]
 unsafe extern "C" fn rust_fmt_argument(
     buf: *mut c_char,
     end: *mut c_char,

-- 
2.48.1.711.g2feabab25a-goog

