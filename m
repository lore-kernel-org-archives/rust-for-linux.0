Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0D1DEFFD
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675767; cv=none; b=u+hkPZoXse8PzIVKY2QJNBIZr2Y0nhwqnObjX26QvxUuT5TKIigCmRdTJN6TFnNj1CWSVNz5s0rvSQakNXlPYGYrn11KCTyl85MIgkaQB7z4nZ47PWN5tbt7gKLwQ9C1c3Mc7qiZWuBTMjKLpw7CQN4DSAkbOGC4smLeP5xBxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675767; c=relaxed/simple;
	bh=WejprDMEIQUzDrArt2ooNXimTyl9N7VACCV0VzTpMyE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X9+kD7aF+Y6x4j9DBLndX7zspIit19wKMQGAaown9qiGMjSVTQzoGGYRUcVQwR9AOraLpiRxYPF+zak2edFV/EyZsi7sg5HJ3A2kAaHthFAFxzrk7U9hJvunGQ0y7aFPQamH0/fEZwJXf51Gft71plOnB3Z+9xyC1j9FyQ8Tax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=okGXItWB; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="okGXItWB"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ba50406fcso2780225e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 09:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740675764; x=1741280564; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M18jgxT7tnSkTmh7oE3ekKDBcrX1GdNxU2BvtBQtbPI=;
        b=okGXItWBt24xfZXeNYRhm/oXMxoYGG/XUskY9gSyWWJ64dxDe+r0DV3R4Xf2A4z9MO
         Z6iXvj1tcdJy593AkfMqq2iVg4S8uxKYtd0WDiCTElGrOXIjBRH9QZmYOm1iGEWZHv6N
         49KzHkpZ6kXRm6bSoM7ojnSkm5+hjgTjRwESxOb65brT5IrMbJCGfJnPOwS/0hk+bOir
         YrYW9vH1+S/TcLTgYYpdVrF0cXDWldgJR/gXBVSScKFZ1inVZIw4+8Jkw2DAYfpSgyZN
         VYpP1ytd+EHi6clLPfMWZ65pQX9KiX0ATYWBu/ehtv79gt7U1epYX2LW+YiWF1y4jXt1
         2eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675764; x=1741280564;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M18jgxT7tnSkTmh7oE3ekKDBcrX1GdNxU2BvtBQtbPI=;
        b=aDdVhSxCBPSwmfoewRyaVnk+AcZerGB4TjyV3RBBDGjWnTne92Q62QbsP/IxvyvLMi
         bWWdrV4auBDoIgYIfCRJliBTskVAS3ctfd0T6Z04/WjXLzq1Kr8FdoJZq/jSUcnKdu6j
         XYrqMam+Jex/Uqeodl+lMY5eAUlBF1mpMlN7OcLRxyWao+ZKng8LdxwS3C+grJhcT81v
         ad3cdRCOBxuPTvnHLGUvzjgDVoQTtRBSUUhIf13pz09Yc94KtGHrgrnnIvZfvtANFZFr
         vwF/+omjasHHLm7iWceSIoiWsEQokw0e0E1kUv4pYk8fjlfIuZAgF6knRGllW7i673Qs
         tGlw==
X-Forwarded-Encrypted: i=1; AJvYcCV2B9EeeGNwAHtgHkgjVX9AaTBZDA+BrHCwx3k75VHmpxyWk9ktsj8Q2L5SOAPph1+lbe6ONrwvW/1v+hk4xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIM6WPOe6KSQPsRFGrhwIUCssNsSDBX+TOGS32i972AVOOPSZr
	Vdfh0D++jmTpOI+xFwkwC38wlnBuNc3uGWiblMLzJpJgOOukAJrD/SENiLKKPVnfLu2uLsupnjX
	KBtG/VlqufrOwiw==
X-Google-Smtp-Source: AGHT+IEphO8gIim2bcuv5Bf2tpO1swqJw4dD5lYIsIGMeeIuuhCWaHMPHVVzXCRHdiC8IK5JFxCh3QT+3OEKqQQ=
X-Received: from wmbfm10.prod.google.com ([2002:a05:600c:c0a:b0:439:81e4:9ca6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3548:b0:439:8a44:1e68 with SMTP id 5b1f17b1804b1-43ab9046de3mr67646995e9.28.1740675764506;
 Thu, 27 Feb 2025 09:02:44 -0800 (PST)
Date: Thu, 27 Feb 2025 17:02:01 +0000
In-Reply-To: <20250227-export-macro-v1-0-948775fc37aa@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=WejprDMEIQUzDrArt2ooNXimTyl9N7VACCV0VzTpMyE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwJqrX4yD0aRuTAEvksdQv/JdAcIIRxq40i3kE
 kyNPKhnnO+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8CaqwAKCRAEWL7uWMY5
 Rk+KD/9OHexlQDh/sjs/LljOilHmTVeqSEG+2/0LGuddjP7sVfDu0w7erVLX6648VhTWE6haCcF
 g4TShRiclyduAp0aO10vRk7Fkji2A9jrcO72I3XNaxERPg1evCBCdGpki/jZA+LVOC+Y52cp4Ed
 r7MLCXFZoBEvRB0uakhQZ0rVRlrm2Ivy87OTSFGmeig7jSUesYHNKZJ5r9Lh5afiGZ6DhEO0qsj
 syioBHPS3ebev2YwjRE1u/1DVQVVhtL2bnRCAm58Du0vf+jhgjksMixBOF0P7anJPaRrigNfbiB
 zLWFdzGj6Xz11k0tRWq1ZaZDXhIdbvHCrc/tTTS1aOVGiQ562ZNG9FpcqOlEalFV31KqM+8B0CL
 AxNwRCvIei+OO6ipfX3C7QcnxTl+VbVzoYhC7w0Sp72ZaCxMjrZ9tZ3Fk+nO56aer0joyjrN5ks
 HI7mJCi3lBW1xybgGuW33YLefNVF9sCndati539VaHz8dKk4mLsa7DI+MCPumLONmhRj5Gs4IAg
 0FkpT84g2ZjvDeLh5LaBnU6ZFed8h6UbYUZ9LkkUSbTLK2hpa2Y/GDG94Wz7tTM43AoMquWx9rz
 WlqcnzFE2KNyq0k2D1qvj7RTz0EDRgv6g72CM1XnEzdORX88UCGzAtljJqx8QR6nMqMKuGPkDL4 rZjpIYrju99OoRw==
X-Mailer: b4 0.14.1
Message-ID: <20250227-export-macro-v1-3-948775fc37aa@google.com>
Subject: [PATCH 3/4] print: use new #[export] macro for rust_fmt_argument
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
index 8551631dedf1..e1a5ff3f34a9 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -10,12 +10,13 @@
 
 use crate::{
     ffi::{c_char, c_void},
+    prelude::*,
     str::RawFormatter,
 };
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]
-#[no_mangle]
+#[export]
 unsafe extern "C" fn rust_fmt_argument(
     buf: *mut c_char,
     end: *mut c_char,

-- 
2.48.1.658.g4767266eb4-goog

