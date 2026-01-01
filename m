Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C45242D9D
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 05:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767244900; cv=none; b=kGmg4wIrCBhOVdeMB7dQOgQcZUYWd1IFZVIcucKyjTsJD3OSFS2DqMtKzuZjGkFoF7V04aw4s91Ufqnl/pKrdWHtR3k0UctSwDZdf4lruoXo/pHa3UoyzcUjQ3Y8up9ZkZO9Xd35YaWRKEjAIX1qiK6Zt5O947FfsTLV+Bd+5cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767244900; c=relaxed/simple;
	bh=mU7s+7tWle8pm/zSL/diWG1twIvZ0xjTqsG/iAaLFVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2aQ9etPv2Xq6xjdmdiXR4WDAgbu5T/HK0t5hfQq7ThnDc4xANBsLFn0XeLtQ5QjBfL5A1WXaNiqmHXPRjlgSl0oNTogL+AAHlyTbxOETyAXWeh5hBUwR6NiDzHtYjEF5m8unyCeIBVH+JE4yn2/JLdk4zKZGE2jMjuCGYUp188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhsAcM2J; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhsAcM2J"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b99da107cso105102621fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 21:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767244896; x=1767849696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rd8KgyV6F2j/qbBvIqB4YfMbMB7FNH9gnCb0sBOPwfY=;
        b=EhsAcM2JNjP8uGkuj4KLoD3okLmvDAhpRQfXYb6JxePqzeivU3TSoycT5XPqG8HYwL
         a4KBjXCBeZEz3DgRcrI61R2tN9I/op4oFd3pVkKdYOOP99ibeXEUMOISHFOupLfttrhx
         eH/qPGrI0u2a1oUYeUON1+FPFTWiZ3TVspFDY2GnM636HSnIJ8Dqjx8ael7+7xb3tk18
         uJMpwJ48Gv0B5qH8mI8BNYbwk2jv56n+MPqPXbJQsFDryQuKC8KT/0HGeRCZB/kIueeb
         IVLnzaLpfnV6D9Maq/5ZbbExZPhHO0PLhmGQ7HTaskketkp54in57NNy4EEyMEAk5tSU
         MY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767244896; x=1767849696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rd8KgyV6F2j/qbBvIqB4YfMbMB7FNH9gnCb0sBOPwfY=;
        b=WILLV/sIy28MLovSTJ1Wg4us2Cz5uEcYa64mqo/gIZXv4ul/hoba/lXQ/yaxQnbfp6
         A/6ZNIec81+bkOE9xadNcwOL0zQLa0Yn3F4E3Jv0HH0Uz57BEP/LGO0/D2Whvnz+TLNH
         BNUcE4eVl5Ho92kY2rD2ydgm6H9vyC0v6ROcTPiMnoaWcq763vhzCyg8dbFCJA4zuKZv
         ENTPylVmrnpS1WOco3ocCzBSABCCQ+onInp/6xjjvhwS7/QtwdKNF8fHORUhgbSY3mrR
         9lwTR4c7vR1lzpP0WU2JOreTS/cRcBNBFdyVM7oCD8inhWA7nPN/vKWG3JDibaSpGG3M
         9dSw==
X-Forwarded-Encrypted: i=1; AJvYcCVN/MjlvehU2HV5J7zVZbeWwzbYuW9A5/s3K6MrNGtfRS1uF0RSyB2xdpuqlx9ogPSCrP3qy/LpEADBZxM6/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcBy5S6a1KLuCLo48B2IzkhhFRZS4zl9fNQiVUSF7Lxj/Sn2Iy
	CSjxQtnY7Pq/oQf9hLum/CPH7tDCPsY1asSU+Od+dVfiftvZLeGo63wg
X-Gm-Gg: AY/fxX40tiFSws8gNbkj47WyyvIGwZt3Nllpu3e8UzPGphJaxjXFQBD5WSw5Ey2pphz
	09YYD8GKFaDYTQgHQrStrRST86IGCqViyKCOSNUpcCnaefs88VrLuYlJ7RPf9qCihodejzcNQUW
	6mPGxp6QohLn7M5Dqdk3H7ALx6j+pbz1SbH927yTH/KpQCiYMrtT+Hl/lHJ8lYcALIQaobAPUip
	YzDFNQzcP98spb5ZGgF7a46SanW4FdAjB4j6B8pKdk4ngYLPMiBHIAAHmwpq7Dt9LXAoIKRfnZ/
	RrtrJAWRWhUQowJzFPnFb/OAQe8HOk3DpzdIJH1boTvJlAQdv+HbcgWC31HRZKpj+KY2/UcWij6
	hW4iTGADS9IptO/T9FeeCPBgX9Limiev29faZxQJPrOhwgoiQ0rwYY7p6wcRWE3SXTLKa8aBjc+
	vG9FBnExSbTGo+dFzhuNQBxymJZO4kgaeikfVBkqsBRAR3jkWAbXY8FDN8oFEjAAMR0hRRpZxPY
	QPO0NMcT0xSkqdP
X-Google-Smtp-Source: AGHT+IGRQFvH4f88ZR5TKWqHF2jFP4khZugE+rhqFElCpV/e1k3ApZo6w/n7a0Bu3kCAQWxd13ewgg==
X-Received: by 2002:a05:651c:30ca:b0:382:60a5:331e with SMTP id 38308e7fff4ca-38260a537b8mr69604671fa.28.1767244895673;
        Wed, 31 Dec 2025 21:21:35 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (84-253-216-54.bb.dnainternet.fi. [84.253.216.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382861ef4ccsm37064921fa.23.2025.12.31.21.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 21:21:33 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Thu, 01 Jan 2026 07:20:46 +0200
Subject: [PATCH RFC 2/6] rust: WIP: Introduce ThisModule trait and
 THIS_MODULE impl
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-this_module_fix-v1-2-46ae3e5605a0@gmail.com>
References: <20260101-this_module_fix-v1-0-46ae3e5605a0@gmail.com>
In-Reply-To: <20260101-this_module_fix-v1-0-46ae3e5605a0@gmail.com>
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
 Jens Axboe <axboe@kernel.dk>, Kari Argillander <kari.argillander@gmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767244881; l=5717;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=mU7s+7tWle8pm/zSL/diWG1twIvZ0xjTqsG/iAaLFVs=;
 b=/GQEca3eN2s3ciSbXCmGhgObb8BIPcjCfeRRMtC0Uh/y5Lr4prsvIJqfmeLcMLuXGTf8x3FF7
 C3/y0olv51EDa8VyGRLe5r57ole2bM00+sMDk4fEy7Tk2SwHQg4FAbp
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

---
 rust/kernel/lib.rs    | 61 +++++++++++++++++++++++++++++++++++----------------
 rust/macros/module.rs | 36 ++++++++++++++++++------------
 2 files changed, 64 insertions(+), 33 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 69a798fbb563..224410745734 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -205,31 +205,54 @@ pub trait ModuleMetadata {
     const NAME: &'static crate::str::CStr;
 }
 
-/// Equivalent to `THIS_MODULE` in the C API.
-///
-/// C header: [`include/linux/init.h`](srctree/include/linux/init.h)
-pub struct ThisModule(*mut bindings::module);
+pub mod this_module {
+    //! TODO
+    //!
+    //! # For driver cretors
+    //!
+    //! For each module we define own custom THIS_MODULE in
+    //! [`macros::module::module`]. Mechanism is equivalent to `THIS_MODULE` in
+    //! the [C API](srctree/include/linux/init.h).
+    //!
+    //! TODO
+    //!
+    //! # For abstraction creators
+    //!
+    //! TODO
 
-// SAFETY: `THIS_MODULE` may be used from all threads within a module.
-unsafe impl Sync for ThisModule {}
+    /// See [`this_module`]
+    pub trait ThisModule {
+        /// TODO Doc
+        const OWNER: ModuleWrapper;
+    }
 
-impl ThisModule {
-    /// Creates a [`ThisModule`] given the `THIS_MODULE` pointer.
-    ///
-    /// # Safety
-    ///
-    /// The pointer must be equal to the right `THIS_MODULE`.
-    pub const unsafe fn from_ptr(ptr: *mut bindings::module) -> ThisModule {
-        ThisModule(ptr)
+    /// See [`this_module`]
+    pub struct ModuleWrapper {
+        ptr: *mut bindings::module,
     }
 
-    /// Access the raw pointer for this module.
-    ///
-    /// It is up to the user to use it correctly.
-    pub const fn as_ptr(&self) -> *mut bindings::module {
-        self.0
+    impl ModuleWrapper {
+        /// Get the raw pointer to the underlying `struct module`.
+        ///
+        /// TODO: Should be only available for kernel create.
+        pub const fn as_ptr(&self) -> *mut bindings::module {
+            self.ptr
+        }
+
+        /// Only meant to use in [`macros::module::module`].
+        ///
+        /// # Safety
+        ///
+        /// - Only modules are allowed to create non null `ModuleWrapper`s.
+        /// - The pointer must point to a valid `struct module` provided by the
+        ///   kernel.
+        #[doc(hidden)]
+        pub const unsafe fn from_ptr(ptr: *mut bindings::module) -> Self {
+            ModuleWrapper { ptr }
+        }
     }
 }
+pub use this_module::*;
 
 #[cfg(not(testlib))]
 #[panic_handler]
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 80cb9b16f5aa..6b8753d122cc 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -371,20 +371,28 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             /// Used by the printing macros, e.g. [`info!`].
             const __LOG_PREFIX: &[u8] = b\"{name}\\0\";
 
-            // SAFETY: `__this_module` is constructed by the kernel at load time and will not be
-            // freed until the module is unloaded.
-            #[cfg(MODULE)]
-            static THIS_MODULE: ::kernel::ThisModule = unsafe {{
-                extern \"C\" {{
-                    static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
-                }}
+            /// THIS_MODULE for \"{name}\". See more at [`kernel::this_module`].
+            #[allow(non_camel_case_types)]
+            pub struct THIS_MODULE;
+
+            impl ::kernel::prelude::ThisModule for THIS_MODULE {{
+                #[cfg(not(MODULE))] 
+                const OWNER: ::kernel::this_module::ModuleWrapper = unsafe {{
+                    ::kernel::this_module::ModuleWrapper::from_ptr(::core::ptr::null_mut())
+                }};
 
-                ::kernel::ThisModule::from_ptr(__this_module.get())
-            }};
-            #[cfg(not(MODULE))]
-            static THIS_MODULE: ::kernel::ThisModule = unsafe {{
-                ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
-            }};
+                #[cfg(MODULE)]
+                // SAFETY:
+                // - `__this_module` is constructed by the kernel at module load time.
+                // - We use check that we are module so we can create non-null ModuleWrapper.
+                const OWNER: ::kernel::this_module::ModuleWrapper = unsafe {{
+                    extern \"C\" {{
+                        static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
+                    }}
+                    
+                    ::kernel::this_module::ModuleWrapper::from_ptr(__this_module.get())
+                }};
+            }}
 
             /// The `LocalModule` type is the type of the module created by `module!`,
             /// `module_pci_driver!`, `module_platform_driver!`, etc.
@@ -502,7 +510,7 @@ mod __module_init {{
                     /// This function must only be called once.
                     unsafe fn __init() -> ::kernel::ffi::c_int {{
                         let initer =
-                            <{type_} as ::kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
+                            <{type_} as ::kernel::InPlaceModule>::init::<super::super::THIS_MODULE>();
                         // SAFETY: No data race, since `__MOD` can only be accessed by this module
                         // and there only `__init` and `__exit` access it. These functions are only
                         // called once and `__exit` cannot be called before or during `__init`.

-- 
2.43.0

