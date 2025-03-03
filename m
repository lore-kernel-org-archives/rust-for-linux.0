Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782E1EE7A5
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991552; cv=none; b=cKV9/28K3aQDVgNsa4a3URRawX8YoXs/RnLA9an1c1FJ7AfCG/sYpTxjOe1uNipDy57Ym7Wgo3BYw3hkyBEQ7uW9uNNUtyurlGnlEPEjqhPgHIpWVBuz/lVb4lIcTw+syouKcxCBapny90pLYqn2ehutSG31U49G/FTaU619rYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991552; c=relaxed/simple;
	bh=rXOlJP2KwbZg6HLcbrBJs+P0GV/Go4oAq5PQVguOe0Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N3+D8xqymy2U6HNs9rwpHFxEY3l5g9GDGaAQv8Sp4vFFRUZA9oFJBdVvMh7idvAjlMhVDmL1e18TSYRRD1B/3nF2VlcIBBqLIJliVOSLv7tjrFcq62F75+07905qoE0CL6bRo6m47g3XLct4fMsTBp7SVYM2vr7VouWBjgSGwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zd3xqMn7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zd3xqMn7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4399a5afcb3so35745045e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740991549; x=1741596349; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uszf9jNzimaGC7A+MjcMbFfOoksGjtwuorOL4my3lD8=;
        b=Zd3xqMn7RXIz8sj1odvqq8+CEJsOSoZJLNB2Mk0FOc/AxFdaA9dcBZsR0EkADQFMkl
         zBGexVf5TILZQrfxMeJ+kqaSG65a29QjrbdUMx79U3PJvJYnSswJDDjZr5lNhhsHFe8b
         5RaX68lichSToLh+xhpfQnx9h2vBC0QTEP/X04Yk8u1xqVTkqtZRGsb80q5LjSyDiycI
         /5Lop8+qSjn0lQaJ/ByD7hfVTBv3Usb8KsW01VuXabMGKnQw98kUC2VuQhSWl+6gbmN8
         dvhiUbflt49sJIkGrtYgLXXp4nP9PODnfUPzTN8LsE6cEIhvLV+ceG4u9Td6KLj528Qq
         oNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991549; x=1741596349;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uszf9jNzimaGC7A+MjcMbFfOoksGjtwuorOL4my3lD8=;
        b=D5En4OrpAqkqxWHwz9Acq3hnTyDUBXhzv6Da7b5RbUwnPkPXwFThl8hWCoEPdRHDPn
         1yeLvWa0wnCvJAZg7QPz/qLnoqlUaJFjUIGgqu5awCdc+w4eF+Dh1Fi0yLFm0wip7UFM
         wq6KCXpVCOW26aIErCwmkNnbU1bX9Y81MQY+zElN3t8iSZjB5xs29r18BVqbkHSPLxNC
         D94mM/5pF9M3k+rObgUHU5Ppv3Lwyo7XLEsGfOhycqeex8+fxfNwb1e9Ep0rFD3zqJ8C
         c0e83zFOMmWiz4tm7yjuRN2ph4sz8DkAHWJv9v/MyVO8KwoAHktcZQw/kDaENafuAMN2
         VcEg==
X-Forwarded-Encrypted: i=1; AJvYcCWAYmbAvUrnwUmFaQ8ZUJE7VIkW+MfnbvVk4eSt/0dOSVZp6IkoC3w3KKQfcER0z1DOHUrHHGd+Ew2ls1Kgdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwesGAsS6frBzHcse/g4tEVg0oJN5oqZd5k0+AmZDkvuS0MXaER
	ekpXtNv3rnMfAXZ90iTco1HkTbyFR5Zhy9A6xc/yQtXlwtL/PLEwcKuuar3gCvkO9A63xpOxXoy
	DmuZSYTVjal4L1g==
X-Google-Smtp-Source: AGHT+IECCbQDp007YY5H9TzV4VTf2BNZ8iJKkXWl3w/rGfL/ku4+FSGRABIL2DQ9M+TCDMAM8FaLElccEauucog=
X-Received: from wmpz20.prod.google.com ([2002:a05:600c:a14:b0:439:80fc:8bce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ca8:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43ba675caafmr134644415e9.30.1740991549163;
 Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Date: Mon, 03 Mar 2025 08:45:12 +0000
In-Reply-To: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=rXOlJP2KwbZg6HLcbrBJs+P0GV/Go4oAq5PQVguOe0Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxWw0XCXyKCpx73jSQ2riTrt89M1w4DSLnlZ1+
 Cb235TozJGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8VsNAAKCRAEWL7uWMY5
 RgRRD/9PrC+8ReqGY3MVcspxlBxm4PzYImTmwadXxvv6K8NDFtqSgszoxEfNsDJXIFFzYRHYa+N
 mJdl98HU7r6JRSNL6VV/+oRKhnoHhYbIAna1gFnE/RYTvvWwyUeyO/3CFv7nowjzYM2AnjxOWtM
 OOmg43zFRY6b/s1XnuR8F/qR30rygGjeSdK7pbE+PygOwoeoXMLh7Yr/UQ0him2uoJXBP0F/4Jt
 NhUEJHPhJV2Uts4nr2e42HpL35fnn8SH+eaBo+nrTG3wXgOEK3ItExaFsD8x6eYCRN9tONisJjH
 xBz+9+5gzepyskX2bOZ0ZhqRPhCSdiZBHxPdJAqs30uzVl7n2MQW5GzBrqu06sCxQ3iY4km60MC
 QkK3CQsguGeSvbMPuYpoIKd+Ld7jxqM27Pe8XJHI2H+nVz+/C5Ps7rZriN2QV4HCqc93vLTtGpB
 bfT33fQo4J5G/ediSmFwtU9NbUEyDlI3/LNY8azVt58TysT3PPWfLU/jtyifkjgDeFs1Tzwlv58
 AoTz7LeIRR8/ZK/Y4q/Nq9NF8+vnZf9gm4eXxu81s7bnfqXUiKc/+UoLzwpoBElajRnbah8+nQ/
 6A9eT6t+gCWE1hGbbP3vLG1gJgVICGT/4nZEhu8Ujark/AVtP1xoIh0B/sjLHEAQDPC8Rc5IGkh NtML/q9eIA2gOFg==
X-Mailer: b4 0.14.1
Message-ID: <20250303-export-macro-v3-1-41fbad85a27f@google.com>
Subject: [PATCH v3 1/5] rust: fix signature of rust_fmt_argument
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
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Alice Ryhl <aliceryhl@google.com>
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
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

