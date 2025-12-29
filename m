Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4BC317701
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 07:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992947; cv=none; b=TYLfyLmjEN8bYH1EF5TqqC+bRpzbG62k1lf8MdwXMmywd6Ou/F0Yl4l4HbvsblmueldT4VGWDV0E3WWjHOmomRTSEl0a9G32FodZdfxyzrNC/A1qTV5H0UCTsI/GBvLXGZzl6CqQScHYYDH+TEZ6dfK9ct5rdTKeaHePJoCbrI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992947; c=relaxed/simple;
	bh=GwHFQihY56h+73dPg2u17+HuZuz9EC8ejVHi+ZETqQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amta7Z6Fo5ScB54kTkYDjuW3Ys6KsGrwVqSj88F6TM4W94HcyLMdT/gyaD8EKsvnXQSzMLoqhiiTegEOyNIxh4o8MqHSlZM5ekNVqww2PqY0ML3xh2bdxY3w7TlwPSk5avCxdd+b9odCntYFzbOvEX7kpxzENjcM0TCwu5c1xK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-803474aaa8bso2961386b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 23:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766992945; x=1767597745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJZG6D8tt0XaN9lJEeJBStcBkiPXa85keCqsqb3lDWI=;
        b=TDmyOdjbB+46rfPMhYNeUN2ew81qYlW+Qg0KAhKnBWvV+wLbEvTNRiZcoWU2ZZGH1M
         K8eEuXYcgFB5N6aJmWLqfRMOAqMzrAzjpfDzECyAgfMNBZ7BlrUezbJDj1ZSJJsNcb/f
         H3kdwzVmTw0b13kxfs140I2S4K229+jPqKNrAcW2v7dZ23LmOWgJcMnmArqL/D/+hklB
         iMLntLqLDq4f/I0YaXhH8QBHzzGDwG/SiATktr5Ht+7nJhTZtv0t7YicrJJQ6ir07jJJ
         R7eLJBGKjMighlQxZ9KG5GjAspqo26X0Nc4xZOPE9BnxuNBadtI1yJ4XWDDTQd00jDuR
         T0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjFjK2ElHXYVD6Z/O+lHekR2YeW34b+C5so0vEsvNv05kEue1K4FFVS5u6A1LDrL0R1vdaNmSggJvJDkl5TA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz26FKA0Mb4MxIETnhU8e7GBTJlb1vSqM9i3Iq5kiLpaS0BamIG
	FcZFbQnx/ManvAGq4S+IjixOqmQGZbQzweAqWG3UrQMRIAYZGhSHdvtF
X-Gm-Gg: AY/fxX5hR9/UzffpG5AztUuVuR+v4XtsleVLQsHJfYx2p3OC4Cgvk6/ikAm6NSCg1yf
	sr5FG1FOfsNXBQbow6hB9mypL2rAzgW6F3FIIN6Kftf2GW8yBO0TalXySFCJ3ot6dPfJu75CM2G
	JpiMWTntFPLBYtBTY2Im8JfxphV6QI33BwA+HxLtLv/p3fOYfLB5c6G8Nm5C51YXRxWQEx/toCn
	Ip9MUkQPWurYl/VRRVX4dic+2CxLnAMwmygDWf7pMayXgSyMpHrEtMlt6La/bIBIZXIxwZLZAEj
	SBvPDOxtCErCaJOdEAh0YUQu0VzGucHQaYoQ0qqZxOXDETF2WFmY+/O6X4jM810NOtqFotJJt5W
	Jltx8ZbEZ3LHBvH1bOMpNMjlEIjBrv+XYoHbikEz9ay7M+jYpOvvVBjrKgITYd+j2BkDbH3zGA9
	SIgKh5GE/Jt1WcFEsqoOPHpfOwUo8Nj9CDIl4VjncdkZzWpMClFU8eoCw=
X-Google-Smtp-Source: AGHT+IEexj0dFmA966Hl8/3VnZhfUyZRA9cYl+IgfN4zpj+gJ5OOFY5z3Lu3l8nCJRteR+41g2OOqQ==
X-Received: by 2002:a05:6a00:a210:b0:7ab:2c18:34eb with SMTP id d2e1a72fcca58-7fe0c0fd913mr31214109b3a.12.1766992945448;
        Sun, 28 Dec 2025 23:22:25 -0800 (PST)
Received: from localhost.localdomain (61-221-120-114.hinet-ip.hinet.net. [61.221.120.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm29021863b3a.45.2025.12.28.23.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:22:25 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v7 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
Date: Mon, 29 Dec 2025 15:21:21 +0800
Message-ID: <20251229072157.3857053-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229072157.3857053-1-sunke@kylinos.cn>
References: <20251229072157.3857053-1-sunke@kylinos.cn>
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
    pr_info!("{:p}\n", RestrictedPtr::from(ptr));
    pr_info!("{:p}\n", RawPtr::from(ptr));

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 69 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..197687261b4e9 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -6,6 +6,12 @@
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
 
+use crate::ptr::{
+    HashedPtr,
+    RawPtr,
+    RestrictedPtr, //
+};
+
 /// Internal adapter used to route allow implementations of formatting traits for foreign types.
 ///
 /// It is inserted automatically by the [`fmt!`] macro and is not meant to be used directly.
@@ -28,7 +34,68 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
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
+        Pointer::fmt(&HashedPtr::from(*ptr), f)
+    }
+}
+
+impl<T> Pointer for Adapter<*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr::from_mut(*ptr), f)
+    }
+}
+
+// Handle references to raw pointers (needed when pointers are passed by reference in macros).
+impl<T> Pointer for Adapter<&*const T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr::from(**ptr), f)
+    }
+}
+
+impl<T> Pointer for Adapter<&*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(ptr) = self;
+        Pointer::fmt(&HashedPtr::from_mut(**ptr), f)
+    }
+}
+
+// For wrapper types that implement Pointer (like HashedPtr, RawPtr, RestrictedPtr),
+// forward to their implementation. This allows explicit wrapper types to use their
+// own formatting logic instead of being converted to HashedPtr.
+macro_rules! impl_pointer_adapter_forward {
+    ($($ty:ty),* $(,)?) => {
+        $(
+            impl Pointer for Adapter<$ty> {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    let Self(t) = self;
+                    Pointer::fmt(t, f)
+                }
+            }
+
+            impl Pointer for Adapter<&$ty> {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    let Self(t) = self;
+                    Pointer::fmt(*t, f)
+                }
+            }
+        )*
+    };
+}
+
+impl_pointer_adapter_forward!(
+    HashedPtr,
+    RawPtr,
+    RestrictedPtr, //
+);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
-- 
2.43.0

