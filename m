Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963C125B2
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767255399; cv=none; b=ZHO7kqbISMsBzppn/cDoujs116lfVjtNer9ad65niH1ou0+VMZSwN85ENQNPEi5VOupQJhlTqil7vnJ2zFa43xC5Gy6mqlbLfX6esawQ2KqcJp0xmOk+vJWJUXh5AKBUmrrLToI0FbKS+MRi5JnfcvQfAB3GJYSsLzuMIxa9kiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767255399; c=relaxed/simple;
	bh=OQplE7dF1ZTiVjJwwpcQGhVeS/smNPFS/wEUJ/O1yUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hfo1l6jFXr/9YkkuGnSh16vmWDafPhV2R9h6Fa0peE67zV7HVeSolP1WYO5oJRIAf+talA/dHwwd+2O3A5l6yJfVyahQYan/ER4g0jXNLbS9qXV+fQDcAtMUBu4T/KI+DeJvQ53Eoxy9b8muL35+C0+1XmL2JM2SFh1ffnfy2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f102b013fso141999855ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 00:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767255397; x=1767860197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CpLC6HHPJO2Rf59E7XvpZ1WvL/pCcNP64FEB9Gzy6y8=;
        b=k/V5VcqHK2g/IrQxuv1zDIh8HzT4PtrpFL17LgE4FqDJ+W63XRsCwRlqXVbxPmE1ec
         Dqm6XCtILBWw6AXa73ImeEKkdaP+6m/CDfsQzb61tQcJDLXP/tkysMkWgjy2TTSXxf9u
         +Zh/Kcq0U2vETZJiwMfhb4UyEKhH7Anmc4SmGHamldRdwfnOP0ve6YLCcefMzirXCarg
         LpAcLTcHWftMXN2N4X2cmckMkp5WtX5sn4huwfQQjqujnMJCC2ehrNFkDfHNhsMSgAY2
         Sdj1TqkE2tpHzanWkEGETBCxDHHq0cXPowxV4R795eFXMM8Bp7sHntEEvLYZZ+6BpA4Y
         hDhA==
X-Forwarded-Encrypted: i=1; AJvYcCURURb8IXWdrJE5dK8MbCP+hdFa5yj920MMSfxX0ZHjI33XDNX6S0/5DZ4MlAvCAiSPfXxJzKeuYhn3tDMycw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQcsnlN3NhN/zGxr/ms0sG5296qsV6mEL2xhAACDwFK8C1B+n
	ERcBE0lnJ9KX/z+ssWXAT0yX2NljthZXihz2+jBYQbpgUQYqCexsawEr
X-Gm-Gg: AY/fxX5D9sSeZU1foQZOH86Zei/3BvaJA//V0q/5xh8nXkkLvrTdKzw89zW6K7lWr6B
	vwUOKAvX5m/JPkn9l2D/6okWFKv5AzE5wSjlUP2sdDbbKswrVC3JHeZ7yMxJhGhG7MsvirO4RBy
	OJ11F+VyZ2MWsGPeFPZBgegsNX0NmzmWlHu9/P6a8p3foac5F+TuCkg8WbGEM5g/DbpYLEwkf0m
	ifLJcDTifXgNs+u9f0riAhEDJgdw1lCW0zjGdqXS1//KsNAbe614XcwG08vQaveikgYvd55S82J
	9FtTkoGO36ap+2+Mq03gJ/rHoEsEps0WhK9/2q3htWsSF2xgZC+FjXv5v9c2oJhd6RITf1NKWKt
	k8PSMesO4FewPNlg2wEFvnc018L5AMuxJo8EIAY/9WpCuxFb9VnWYhVDz7d+zQaWql6YW27nybv
	rSeuTpiEJje9useisq2dCREiJH33V3hZsek6rrbYklCPodT+JMcyFmFo0=
X-Google-Smtp-Source: AGHT+IFPcNAhShy5bPwaui8ScFbV29sqVcYLqw7gFfhFNMhcnVLMYdAF4mU25XXANYPZcPtA1j09eA==
X-Received: by 2002:a17:902:cf08:b0:2a0:f488:24e with SMTP id d9443c01a7336-2a2f2836817mr385688865ad.28.1767255397326;
        Thu, 01 Jan 2026 00:16:37 -0800 (PST)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm342457585ad.3.2026.01.01.00.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 00:16:36 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v8 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
Date: Thu,  1 Jan 2026 16:16:03 +0800
Message-ID: <20260101081605.1300953-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101081605.1300953-1-sunke@kylinos.cn>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make raw pointers (*const T, *mut T) automatically use HashedPtr when
formatted with {:p}, providing safe default behavior for kernel pointers.

This allows users to format raw pointers directly:
    pr_info!("{:p}\n", ptr);  // Automatically hashed

While still allowing explicit use of wrapper types when needed:
    pr_info!("{:p}\n", RawPtr(ptr));

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 64 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..8be185d522c01 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -6,6 +6,11 @@
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
 
+use crate::ptr::{
+    HashedPtr,
+    RawPtr, //
+};
+
 /// Internal adapter used to route allow implementations of formatting traits for foreign types.
 ///
 /// It is inserted automatically by the [`fmt!`] macro and is not meant to be used directly.
@@ -28,7 +33,64 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
 }
 
 use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
+
+// Special handling for Pointer: default to HashedPtr for raw pointers.
+// This overrides the default Pointer implementation for raw pointers to use hashing,
+// which is the safe default behavior for kernel pointers.
+impl<T> Pointer for Adapter<*const T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr(*ptr), f)
+    }
+}
+
+impl<T> Pointer for Adapter<*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr(*ptr), f)
+    }
+}
+
+// Handle references to raw pointers (needed when pointers are passed by reference in macros).
+impl<T> Pointer for Adapter<&*const T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr(**ptr), f)
+    }
+}
+
+impl<T> Pointer for Adapter<&*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr(**ptr), f)
+    }
+}
+
+// For wrapper types that implement Pointer (like HashedPtr, RawPtr),
+// forward to their implementation. This allows explicit wrapper types to use their
+// own formatting logic instead of being converted to HashedPtr.
+macro_rules! impl_pointer_adapter_forward {
+    ($($ty:ident),* $(,)?) => {
+        $(
+            impl<T> Pointer for Adapter<$ty<T>> {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    let Self(t) = self;
+                    Pointer::fmt(t, f)
+                }
+            }
+
+            impl<T> Pointer for Adapter<&$ty<T>> {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    let Self(t) = self;
+                    Pointer::fmt(*t, f)
+                }
+            }
+        )*
+    };
+}
+
+impl_pointer_adapter_forward!(HashedPtr, RawPtr);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
-- 
2.43.0

