Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915543E482
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 14:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921159; cv=none; b=CuAdY5u79kd6S1u4b0vsKZ/p+1FH9mIrO9GAIdl9zEho/ydzVmchrkAiH/y6X6GeMy5FOt9VnNJ/FZXxvksj/S9wPmZQXG26Jzg6lUXrKmUsk+S4YtbGjIpCXl51kZOFLEjdSZ2sRle4PAE3rdggk8qWKQNjSs1e7Rwn+LsBl78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921159; c=relaxed/simple;
	bh=iolTe2Nv6CXObYVORHv7J+SxOaQNUXJvbYUG0yhxQwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aepRg+oFBV8RcI2ZBNesCj6xWuJIZqkv0Sq8GjUozEDcrxZz91Hokod4xX04HqIz5njHUhbJmebGpmAPgGaR/u1Qq8EDQ3WcRs9fqYLY2bG4KUBLRRqm/JhwlP/w1LUascKG50tJpBN8kdVyO/8OT82rpXRPYabBjvDRSfxV7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+XqgduK; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+XqgduK"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81c72659e6bso4605073b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 06:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921155; x=1769525955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSjlYt7iWy0dHDjMoGOdBEcpp+zSyHhPWpL6L/bevUw=;
        b=f+XqgduKHxlnwiDk+dX72xMItu+7DmPTjYlluGUWCvvYVOar24hE9536pRxkPGjD94
         K3Jh1P91PFKxAqAbgDzjSCmO3Raxi7Q0pjle/B5LO0Q/oS3Bc5MFpO+xA7SpBGHS2tGN
         uU3LDYvPXdsBU5+8dI1BSNnW9jbNEbK56WC1o/RHfOWd6ieaTjAQffKzGb7+nlt4Yc+Z
         E29YF8mCcArvWQDMqvUri7fFKXd2ffhsP6w0qbycosnM75bj7aS295Xz+h18C0EOk49n
         jVmUe/00wYdKLaPQbxtMkuSBePXNMODbOGO/rAfIVIDcmZlkBQH5D0gd+4nkZ5mUsJdY
         ZLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921155; x=1769525955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSjlYt7iWy0dHDjMoGOdBEcpp+zSyHhPWpL6L/bevUw=;
        b=BkT3O0m1CE8VWjK2aTSQIiCXXqCcmrd1fGcisse/PqjWoxxRRh56L54m0yjbVkK9ok
         1Idv6gG2kJgfhbkoI6Neap7jdfYHgt8E7Pu1zQYOlM1Zc9hdhH53jc386MHGrJbFxUGU
         NKyRGJ0tuVMApu2INwJSF/Ebv/GUjTIG+IKCmJUYE4sFFA9ZwKqxH1F4WrQ5bzpY+kwM
         mxbjjmxpeL5F46ju5RylqoelYp2FQlvyf7HPzfIcUA1FZrHzTzWHLnWznq2ntu+XRDIJ
         mwsuB2gmIIf8cHYxzyJwyZpgd9XOZHUdliOoJnRbT1j/u+YlwlNEQ3I00jKg6WPNjMVe
         skhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbwl1bhX2Okxsd499Bb69oCv/wmcaAvnMjGWCzULxk22fJ4lZ7kaZ3xsHweQmhmKPmsQcb06SNwH18LIP11g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2youCXtV/RhGfKPLoGpizWjE3LwpxZ9fdPLbK06vUV7fDjUg
	4C/x5X36ah/C54Qjq06mMkoAXT3xtsHhZFIgpHEHgWhq0quQL39lYGM3
X-Gm-Gg: AY/fxX7bWCBQqhqIfEjqqR7je13MeA1cxZ2sL/rAZFKov+hg4UBDeMd2Dl58+U6CIxU
	9tQwyD0K51mOEdrLWRrfAlbJAASwGYwO+VP0zEG1rTNJvMzUq8dBH+z6aSoTf0yfO3KzORBT32V
	RowYrRDwWU66D8OgnfFab8gIPWJzeAmS9P5GwiRcGo2seRr5lCY5efg14Sxj8qUwsmb2BV1vNMf
	qzGpOdy//h3+Qo/QRyAMp94E+55Xz/27NhbAxJx5ZI7lf3Ba2713+J0j0LrnTvoI9cLlpFhKPEx
	FFdW5vjD1d18OdPWD8H82XqWxTIEnxzkpMnxHNssd5lWFfAQfRgamyAKA4MUZYCXBttRrqcjI9r
	BJfnzJrwMiyDIb5Z2+nBzm12q5k1Dl153CKUX1y1/AjyJuW7d2/E3GgLrROFdsoVW5pzYC1LagF
	RmdQoPuBI7y7xCH72nTOHvXL0icnWt9PDrmYFVOCI1tYyW30oPWR8S
X-Received: by 2002:a05:6a20:918d:b0:38d:eeff:7b1e with SMTP id adf61e73a8af0-38dfe6c1947mr12933114637.34.1768921155419;
        Tue, 20 Jan 2026 06:59:15 -0800 (PST)
Received: from kailas.hsd1.or.comcast.net ([2601:1c2:1803:3ab0::2e2b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf354b3bsm5478104a12.24.2026.01.20.06.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:59:14 -0800 (PST)
From: Ryan Foster <foster.ryan.r@gmail.com>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rafael@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	Ryan Foster <foster.ryan.r@gmail.com>
Subject: [PATCH] rust: replace `kernel::c_str!` with C-Strings in seq_file and device
Date: Tue, 20 Jan 2026 06:59:12 -0800
Message-ID: <20260120145912.281977-1-foster.ryan.r@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <DFTI0P4F3UR9.14CA9H3I19GCB@garyguo.net>
References: <DFTI0P4F3UR9.14CA9H3I19GCB@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

This patch updates seq_file and device modules to use the native
C-string literal syntax (c"...") instead of the kernel::c_str! macro.

While at it, convert imports to the kernel vertical import style.

Signed-off-by: Ryan Foster <foster.ryan.r@gmail.com>
---
 rust/kernel/device.rs   | 19 ++++++++++++-------
 rust/kernel/seq_file.rs | 12 ++++++++++--
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 71b200df0f40..a87350c1a67d 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -5,15 +5,20 @@
 //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
 
 use crate::{
-    bindings, fmt,
+    bindings,
+    fmt,
     prelude::*,
     sync::aref::ARef,
-    types::{ForeignOwnable, Opaque},
+    types::{
+        ForeignOwnable,
+        Opaque, //
+    }, //
+};
+use core::{
+    any::TypeId,
+    marker::PhantomData,
+    ptr, //
 };
-use core::{any::TypeId, marker::PhantomData, ptr};
-
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
 
 pub mod property;
 
@@ -462,7 +467,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             bindings::_dev_printk(
                 klevel.as_ptr().cast::<crate::ffi::c_char>(),
                 self.as_raw(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>(),
             )
         };
diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 855e533813a6..109ad6670907 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -4,7 +4,15 @@
 //!
 //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
 
-use crate::{bindings, c_str, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
+use crate::{
+    bindings,
+    fmt,
+    str::CStrExt as _,
+    types::{
+        NotThreadSafe,
+        Opaque, //
+    }, //
+};
 
 /// A utility for generating the contents of a seq file.
 #[repr(transparent)]
@@ -36,7 +44,7 @@ pub fn call_printf(&self, args: fmt::Arguments<'_>) {
         unsafe {
             bindings::seq_printf(
                 self.inner.get(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(),
             );
         }
-- 
2.52.0

