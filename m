Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184C6346FAE
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057795; cv=none; b=hCbpeB4xj/zZqCbRJydTGxQOO1s7gYSvyK15s0Q6zwwr1Yeb8Z7n/eQ723+M2xVGcR3CnjH32lwQiWXTRXJkAiEmhQyQjSNMOwW+hg07WPGcmIqumXrWe0xyGRhbPzSpJNxMhjooLg8nsAyrGyYq5lHJUwKQK1qmRMRbGhVxano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057795; c=relaxed/simple;
	bh=evAHr1gD6EfPZW8LvM5pPL6GuIcZSSelhlqgoHK4/G4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTSnGrR1xRYxLOlRdHwXR/2REE6/Jk1Y8FmtZTJBlW1T7lSpWBLE51ZsCs4NR3rkp7U1Obh0vEvxMpjBE1cQ+snht21ZjzWpvazAIjSYyBN+4kaYROiIZPeeFvqekljnHkSsl7tP2NQXdgu9OAv5xXgLxf80469IZcqQcEEK8oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jprEPOu0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jprEPOu0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so4853312e87.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 07:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057787; x=1768662587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csZdrKP5V1PNFMXR8xX+/RBApYgeOuQXpn5FzbDjqFQ=;
        b=jprEPOu0JzVzUqPgkTNFG82LEhmBmd8CMiU24akxRrZ81ucHFywlnF2Hxl3iuD+zs8
         ivkU4jY33zar8xxSnocmAIgMNQRMiXOG8xUTVoNOzUIz/5ehNP8Wg2YeGTJ/yJNzXzD2
         LWWTGI/TqEDtS1wxmM7z5IG1KvC7Z5FbCM7BKeGlvwoT5l11RSh5utFkRdvEIMlJwlDI
         jD3nV2IBfdaBJ8IEeTfDsTx5/3cnJsZ/Ftb39BWQuEhdPu1MPXevjtLbOSXy0SfNt8HF
         JDL6NQNEooW+V4RvzzCFw1S1/zeQFpwB+Cp61bgtT9a/4DzZkL4sM2lpKexJ/Sc1bxGM
         Odzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057787; x=1768662587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=csZdrKP5V1PNFMXR8xX+/RBApYgeOuQXpn5FzbDjqFQ=;
        b=ENbEJSSAZS8ckPr8duhTtbg1OLZikUZsFiwTA/vSoAwgqUy8HWJs9KOkYG8s1DixnE
         TATDkKQaKMDHVddsalxMpwCRSlnd//RI0F84qJaK/jUIy57DCfAjy9IbFluO+ZAY9APK
         Edt4BQYHz0SUYK9+x9zkEk4Bjjbv4YwLJ4Qk3L9TEzwmaDSq+cWrD7eeMoyBSWbZqXwD
         VkIbnRCHJngB8czS0iBC9z7CQvfp42S1jmGcXffk1QbSLoPYxP7RWllImsSaZUBlwbrm
         d+InFsrDk/0znXba1d84pdvimg7ikK+q1v0FIhR5yES4Z2zimfYKQGShhOAbNDhYbfuo
         1Vfw==
X-Forwarded-Encrypted: i=1; AJvYcCXQN2Y78fXRvdiuqbXf2WOhO6N0gURA6eGimK2mvqvfBBz1h2o/hRvKZl8JxcXKfMbsA3lMRCCQRjAxPUYMmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywvcsHj26PvXA7QIWwQX7xvu18ztWge32otBSatnGqROC6oFGW
	TkqGTT/FoHnWLKf62u+KizHDs65td+uMPZO3FHlHm6vfbFDxqkcqFlLQ
X-Gm-Gg: AY/fxX4wAuLKD4XtMCQLKZeUVZFb9+d5VVOSiWC7e0QSNnd6chsf63sr7LaX0lsxMKZ
	Afk2v4KF6536d6PnME+QZrQ2giyedr+1yzNE0iyGtloJ4EzwJ1+uGgFVVwlqkWuUjjbNHEqzjqY
	nMyp1YpAZ+I2MAweeTscjQCmr05k+ByUIUzFT2jMkCEooJBX1LSDN5EwGK3Sbc2QNKJv8jmwjiZ
	tsVVKDd1YnewxQJuXYTpk3xpUyaXLDeRAUbR6tOJ/a0NYOPVk2VonZs73z0wzCUSlSdYQXeobiP
	Uz5JMHsp4Llg0O0PaX7PePeQRA1BeiJ1dtJ0uhKvnoQYKlQU3Awq87qzTmLABGe4omaHpgMdWe2
	0/7c1Tt/bxXbf+9/EmbbM6dKXmOB4x58kfIVUqZYsRM9qSmoHfs+2ZSrLn1jwmnu884GIpWWEQI
	bnuAlV/zo99oxa7jl523vAG+9YlTEMYyMZz5L2WVgw9L7lw9yvDhW9Ne4ryE5KWhCcdjX9vs/4
X-Google-Smtp-Source: AGHT+IFBX48hY3Q9PVP8SQO8XCpmSVoMleJSOwz7zkGOzjVdL6fPS2OSYcR91pM3G3FgTl60Yxo2Rg==
X-Received: by 2002:a05:6512:3da7:b0:594:253c:209f with SMTP id 2adb3069b0e04-59b6f03520dmr4616760e87.39.1768057786509;
        Sat, 10 Jan 2026 07:09:46 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-148-7.bb.dnainternet.fi. [37.33.148.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75543a64sm2137059e87.49.2026.01.10.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:09:45 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 10 Jan 2026 17:08:13 +0200
Subject: [PATCH RFC v3 15/15] rust: remove old version of ThisModule
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-this_module_fix-v3-15-97a3d9c14e8b@gmail.com>
References: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
In-Reply-To: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768057742; l=3438;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=evAHr1gD6EfPZW8LvM5pPL6GuIcZSSelhlqgoHK4/G4=;
 b=PFKAsdYOgAKKCPm1WVwlkXpmaaN/dpAj9cbBEmgQyEeJJ4usBhD6p46VpXhsFr7jQVDIR8GLy
 nz5qXpoXcCEDRCygmv7YowFfq5KDSq1Gvbqm9IS5/ewHkyP6TQswkse
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

There are now users anymore which use old ThisModule. Also new
ThisModule did have couple quirks which where there only to probide
fucntionality what old ThisModule provided. Those also are not needed
anymore.

Closes: https://github.com/Rust-for-Linux/linux/issues/212
Closes: https://github.com/Rust-for-Linux/linux/issues/1176
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/lib.rs     | 47 -----------------------------------------------
 rust/kernel/prelude.rs |  2 +-
 2 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3acc60a83b09..e709f85ec4b5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -201,32 +201,6 @@ fn init() -> impl pin_init::PinInit<Self, error::Error> {
     }
 }
 
-/// Equivalent to `THIS_MODULE` in the C API.
-///
-/// C header: [`include/linux/init.h`](srctree/include/linux/init.h)
-pub struct ThisModule(*mut bindings::module);
-
-// SAFETY: `THIS_MODULE` may be used from all threads within a module.
-unsafe impl Sync for ThisModule {}
-
-impl ThisModule {
-    /// Creates a [`ThisModule`] given the `THIS_MODULE` pointer.
-    ///
-    /// # Safety
-    ///
-    /// The pointer must be equal to the right `THIS_MODULE`.
-    pub const unsafe fn from_ptr(ptr: *mut bindings::module) -> ThisModule {
-        ThisModule(ptr)
-    }
-
-    /// Access the raw pointer for this module.
-    ///
-    /// It is up to the user to use it correctly.
-    pub const fn as_ptr(&self) -> *mut bindings::module {
-        self.0
-    }
-}
-
 pub mod this_module {
     //! Access to the module identity and ownership information.
     //!
@@ -360,27 +334,6 @@ impl THIS_MODULE {
                 pub const fn name() -> &'static ::kernel::str::CStr {
                     $crate::c_str!($name)
                 }
-
-                // TODO: Temporary to provide functionality old `THIS_MODULE` provided.
-                // SAFETY: `__this_module` is constructed by the kernel at load time and
-                // will not be freed until the module is unloaded.
-                const ThisModule: ::kernel::ThisModule = unsafe {{
-                    ::kernel::ThisModule::from_ptr(
-                        <Self as ::kernel::this_module::ThisModule>::OWNER.as_ptr()
-                    )
-                }};
-
-                /// Gets a pointer to the underlying `struct module`.
-                // TODO: Temporary to provide functionality old `THIS_MODULE` provided.
-                pub const fn as_ptr(&self) -> *mut ::kernel::bindings::module {{
-                    Self::ThisModule.as_ptr()
-                }}
-
-                /// Gets a reference to the underlying `ThisModule`.
-                /// TODO: Temporary to provide functionality old `THIS_MODULE` provided.
-                pub const fn as_ref(&self) -> &'static ::kernel::ThisModule {{
-                    &Self::ThisModule
-                }}
             }
         };
     }
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 2877e3f7b6d3..66974ec20ef4 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -43,7 +43,7 @@
 
 pub use super::error::{code::*, Error, Result};
 
-pub use super::{str::CStrExt as _, ThisModule};
+pub use super::str::CStrExt as _;
 
 pub use super::init::InPlaceInit;
 

-- 
2.43.0

