Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2403F7AAB
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796732; cv=none; b=Vbspxwh7Z9C54L7DmLXlsy6z+czOKbknjycPlAUmZBsEvejvDn9RuoMhoF6aW5cUEelTceQbszPWP9Z44Jt9gmovTwimIwdlO4KuXKQx0wL2790H9uHVl6IZ4Aabu3OeDz6EbrxFqrK2Ms0hVMXzI9Uy0eEZhrSnmpG6YKENZf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796732; c=relaxed/simple;
	bh=OJ+7WARB6N+fmIk2dER+UhbV1OiqJ7xjdzGz3EOuTHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZoGE5Ljdfwv9UWA7jnAvP6ycVJc9R6tZbGILiABOB3YAkNKAl4Jfhec9NdVoO7Pfi4j/ffMgYirA9pAWszfF7oBxJSF/HH4WtO83H7M4tKqSL6Zq43tyJcUXeTnZlc2D6jq1yzwWZoKWb7GFAmdbIid8mpsWfGy6ZPI4O/RoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCAg474F; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCAg474F"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c80291e6237so7314184a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 04:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779796724; x=1780401524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8unaYiQY+V8GcRg3BTBUGdma2PqnW6N3aPu9s5QNeI=;
        b=VCAg474Fd+bBrUCGMThU6H+s4Qc3gjtWXsT/tP9X3JEZZqWnfjSqxyZXgrr9R+Tuds
         dBt6Kh4yOYE3MpzEs6VjMA+hylJ5tOgtUdvHbW47/PHDJ+llj7NXz4/djUn4SikbNQ8y
         S+lRn+r+kCOpnDIIZLddjIg5fkfyWPV5FZJiDfZmCDKjHHuldWm4IUppKMSQyKixo3HN
         Vf94vx5yCML9mixc5EzPcDRMfVyPh3pwVM3k+a0IXiCju/JDIGUkjgkVW50SZEoK/Rxd
         rhHp3eY2t6XYaaYU3AgGsGAyvjyEP+c0pvweZYzgNbPsiOIMJFuGr8itbUcFljJDFD4E
         OuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796724; x=1780401524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8unaYiQY+V8GcRg3BTBUGdma2PqnW6N3aPu9s5QNeI=;
        b=qu07C2tahKNo44gqegX3LJF2ZWUGNL6Vvk0Tt+2H8CMzKxJbl0yx9IPXdRN3SwxRhR
         rIdGYrMd0RY8dk+b6rtuv/2hI9UiTKdiJdEK+4U53XFgvaVV+0vOY7Y+a0DoVUIntoJI
         u32mjYF2LZBk/RLk7OK16r5RvgyhgYGo63k16pQIw3r1JHp8Qa8TGAdNmqA43lmrvARR
         Hi9zrdGcwxSBZO/e7rXXRtVcdwjWzWq6AFq99qF0tOI+HAHaU8ATCueq+gpr16fODMzf
         knA867Zato1WlzCjI4Zbp5Xin9X3lkJZP14dP5vI+setcEPMjBR1Yg4fkANSikaCPwvH
         9WSw==
X-Forwarded-Encrypted: i=1; AFNElJ86ka5ao47oV+nLQDl2C74R0/mUosqws1a8gHKb2LIAf9DIg+cmolovD5PPYByFIjpq3E+Sg/F5v1UZc09NVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDv/MjjWqbml8S0Ollbfxk9Q6pi8m0qfqK6KKMmL93JT2fDwkL
	rpyVvvl2i6w+MsfuiSkg5+SwUQp2ZUdR/vFy12FESXMMHV09/aJGWmqYucK7E7qSi+Q=
X-Gm-Gg: Acq92OFMBlxbQH/L53wKcEEM3OgqzDw62JfMBIDQ/G9zQZEXI072EaCnA2m5mppaNKx
	INhetlGZFq0hlz6vhZHymlM/SnbinSJc5RMJaVPH6xpXLRPL9jajiZbNFGbrZMj30IZZBql5nke
	ovy5FJbME+rFJX2RsWIXGokUXtfcCAlDF8NRScVO5yqNvL49OWiFApCrg2Hm7aO1FpQDy3lIvuN
	OCkDAnOPv2Wglw/TP34oBT95w58IbY1z5nu/prn5QDYBWGF1xJqYWBi6fCJ7jiTewePI/NhRXSp
	m8XOr7RLcdNehouCS9QqkrkkTkrqMz+SIxVrtlnfVeI0cEDjcuPJ0TC0mRdF8NeW5qvVjIfwooF
	dGh+ntYrOmtu/fKk0q3MDR4BeYYhDoEMgZDXTLDzdm8fcUUbIq9lFhmL3O46MfqtjgRT7Un0n6o
	V+YoW8elEqYgbBvLIPgfsVXIMWhwGqfONM2y7esN8EU+9+eOXYV9ltankivuE4ARE4X9BUyHwBO
	YbtBNF4dq/6HnyjEA==
X-Received: by 2002:a05:6a21:164a:b0:3a2:bd1d:d679 with SMTP id adf61e73a8af0-3b328fd02e8mr19252415637.48.1779796724176;
        Tue, 26 May 2026 04:58:44 -0700 (PDT)
Received: from Zenbook-Duo.tailc6e68.ts.net ([2401:4900:884c:3eef:47fa:897:ce83:6985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe0bb8sm11355693b3a.51.2026.05.26.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:58:43 -0700 (PDT)
From: Aary Milind Kinge <kingeaary@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aary Milind Kinge <kingeaary@gmail.com>
Subject: [PATCH v2] rust: devres: optimize type name allocation and fix truncation
Date: Tue, 26 May 2026 17:28:25 +0530
Message-ID: <20260526115825.1480768-1-kingeaary@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260526094329.533943-1-kingeaary@gmail.com>
References: <20260526094329.533943-1-kingeaary@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The unconditional 128-byte const array allocation for every unique
`Devres<T>` caused unnecessary .rodata bloat in production builds,
and type names exceeding 127 bytes were silently truncated without
any indication in debug logs.

Gate the `TYPE_NAME`, `TYPE_NAME_BUF`, and `TYPE_NAME_CSTR` constants
behind `#[cfg(CONFIG_DEBUG_DEVRES)]` so the 128-byte buffer is only
allocated when device resource debugging is enabled. For production
builds, use `crate::c_str!("")` as a zero-cost empty C-string fallback.

When the type name is too long to fit in the 127-byte buffer (plus null
terminator), the copy routine now appends "..." at the end — copying
only the first 124 bytes — to clearly indicate truncation rather than
silently dropping trailing characters.

Signed-off-by: Aary Milind Kinge <kingeaary@gmail.com>
---
 rust/kernel/devres.rs | 55 ++++++++++++++++++++++++++++++++++++++++---
 rust/kernel/lib.rs    |  1 +
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 9e5f93aed20c..79cfe7d9a415 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -185,6 +185,57 @@ pub(super) unsafe fn devres_node_remove(
 }
 
 impl<T: Send> Devres<T> {
+    #[cfg(CONFIG_DEBUG_DEVRES)]
+    const TYPE_NAME: &'static str = core::any::type_name::<T>();
+
+    #[cfg(CONFIG_DEBUG_DEVRES)]
+    const TYPE_NAME_BUF: [u8; 128] = {
+        let bytes = Self::TYPE_NAME.as_bytes();
+        let mut buf = [0u8; 128];
+        let mut i = 0;
+
+        if bytes.len() > 127 {
+            // Copy exactly 124 bytes, then append '...' to clearly indicate truncation
+            while i < 124 {
+                buf[i] = bytes[i];
+                i += 1;
+            }
+            buf[124] = b'.';
+            buf[125] = b'.';
+            buf[126] = b'.';
+            buf[127] = 0; // Null terminator
+        } else {
+            // Copy normally
+            while i < bytes.len() {
+                buf[i] = bytes[i];
+                i += 1;
+            }
+            buf[i] = 0; // Null terminator
+        }
+        buf
+    };
+
+    #[cfg(CONFIG_DEBUG_DEVRES)]
+    const TYPE_NAME_CSTR: &'static crate::str::CStr = {
+        let static_buf: &'static [u8; 128] = &Self::TYPE_NAME_BUF;
+
+        let mut len = 0;
+        while len < 128 && static_buf[len] != 0 {
+            len += 1;
+        }
+
+        // SAFETY: `static_buf` is promoted to static memory, and we verified the null byte.
+        unsafe {
+            crate::str::CStr::from_bytes_with_nul_unchecked(core::slice::from_raw_parts(
+                static_buf.as_ptr(),
+                len + 1,
+            ))
+        }
+    };
+
+    #[cfg(not(CONFIG_DEBUG_DEVRES))]
+    const TYPE_NAME_CSTR: &'static crate::str::CStr = crate::c_str!("");
+
     /// Creates a new [`Devres`] instance of the given `data`.
     ///
     /// The `data` encapsulated within the returned `Devres` instance' `data` will be
@@ -209,9 +260,7 @@ pub fn new<E>(dev: &Device<Bound>, data: impl PinInit<T, E>) -> Result<Self>
                     unsafe {
                         base::devres_set_node_dbginfo(
                             node,
-                            // TODO: Use `core::any::type_name::<T>()` once it is a `const fn`,
-                            // such that we can convert the `&str` to a `&CStr` at compile-time.
-                            c"Devres<T>".as_char_ptr(),
+                            Self::TYPE_NAME_CSTR.as_char_ptr(),
                             core::mem::size_of::<Revocable<T>>(),
                         )
                     };
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b72b2fbe046d..48df181788f6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -22,6 +22,7 @@
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 #![feature(derive_coerce_pointee)]
+#![feature(const_type_name)]
 //
 // To be determined.
 #![feature(used_with_arg)]
-- 
2.51.0

