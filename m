Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7618329C43
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564023; cv=none; b=Ko2wSu4osJOJ0T/irZtwmOWJcHDuNaGzSRR+GwQq/QerDnxoINuCFK1QecG6pyQTzXFrjT8QkITu/S5jN1cHbz8OFfKicuzrd0OlB85YjhmIq/7gXveS3X69N/oli8DOCYETp+PUsFfgMzMYToV/X+Zs4PNe1mwsWPO3a0EB9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564023; c=relaxed/simple;
	bh=N3A5p87ULiZ9foKmA+c6dZkACgWEZs0z+QvYnQ1zmmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/CRI6NNuQ+ubC/fS/01jNPI9gPeLqF62f1yvl/5CuGYGaGLrw78ilrZBd4a7nMXOiSwxI7dD1u32mifZuWC6b9OG/xf8WnW/VVQbhggvbF9HO5WTClAujR2u+hTOOul15Ef02nkrAIDQ+JOFbzYZxBBCHa7w7rla228wgeGmyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0ac29fca1so50617665ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 00:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564021; x=1767168821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5o+40RKy8x8gvTohUlLSAxfIdcC0/iY/ArVyMejkKvw=;
        b=YwF3ZVHFZzK3GC5s3dlB+YE1hMf99XpPxWZz4LBeX2PwyJgR+JeO4fyN/9EYaUx+EA
         niO14B8Wk9Bz4lwduEdfUFnT73BoLi3v65dDpgAnmrHmqiZhAHeLcqJ5LoP4KsIYec4j
         ZFA0WtDGgddiTuPSRhFDgrx54GLYBEzuGE510ZPp9lhGWEu2d4JQ4P5uJNG/pcVik72g
         xwngJZ2RtjeZgVl0lEQF0xLLyoU4tAuqQBM0nQpEwDl4rqm01M9v1BLgyMQWOzgA7IpV
         tTlyz1I+BlxQD2tdOpPlY6CWNCK2FLkjPOBHvM+QwlbudbBlepY5yhueJRiMqjAw7qFJ
         4yKg==
X-Forwarded-Encrypted: i=1; AJvYcCXN6hRhlV2a54MAoVSIvnI9zvmZXP/kOCKmuPliOLHY4zn1pZJsBHVzObcCb1vNeLRZFJ6l3mu7qG2W35gmeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WtViGXjGPXpYvzKMH/lXD3fcb7OF3SNK22vFssu9wXQgbgIS
	Ear1a1cjPAKV2Cl5Gl5N7oTtn0C/ANXvCXOtpy6TYQobLlNaW1cul3Lb
X-Gm-Gg: AY/fxX508hCpwwEuJFEiNGUnQWSFq89WlcmLKfZoyjM5U7D+8iaUB6kATY+oOtgXFgh
	aRuJ42HiXDWiMG5yu0o4EjDlv8y542OMdXvm1hyyoPijxev/qVk+PspU63Al3x4PP5F2I0RxmQa
	XNcjiYhylVLB+WlNi7uSXfOHzj+N4qc44zEUWvABatsbmjhLXQarH+KWHUlLNU/CesZwjmtbsfU
	oiHh5VzvCqB/cESIV7Ua1Xppcia4E17uI7e60kIIAVdiI3RHSovV3QGSeTalWnq+7Qb2aGrQIaO
	JEU5mZw1bzev1sUObW2VQ4486HU6jkeOhcFZt75GUHvbOgfdtu/uxVsDykEe2jU4QgqnhrRbx8z
	d4j9l9QjknKfydYAea+H4hk23VMPMgsuLz36koZgS17znl2S0wwAn6Y+GSkDEwjCei9KJuzA55H
	IVozxsob2pvebVUXu5f1dP0MGHzUzFCnjVp+/kSYo0UMkRe+3y0Mrduas=
X-Google-Smtp-Source: AGHT+IHXz9hEX75hlyytPnyRnk+v0fEgMaZSfhb03gNfRCqYLf5YV8shCW3yX0EqB3wvxMhAQnSGzA==
X-Received: by 2002:a17:902:f60c:b0:2a0:8966:7c94 with SMTP id d9443c01a7336-2a2f22262e1mr162205145ad.20.1766564020958;
        Wed, 24 Dec 2025 00:13:40 -0800 (PST)
Received: from localhost.localdomain (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c88d0asm146462895ad.40.2025.12.24.00.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:13:40 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v3 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
Date: Wed, 24 Dec 2025 16:13:12 +0800
Message-ID: <20251224081315.729684-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224081315.729684-1-sunke@kylinos.cn>
References: <20251224081315.729684-1-sunke@kylinos.cn>
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

Changes:
- Remove Pointer from impl_fmt_adapter_forward! macro
- Add explicit Pointer implementations for Adapter<*const T> and
  Adapter<*mut T> that default to HashedPtr
- Add Pointer implementations for references to raw pointers
- Add impl_pointer_adapter_forward! macro to forward Pointer trait
  for wrapper types (HashedPtr, RestrictedPtr, RawPtr)

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..66493682bc7ca 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -28,7 +28,65 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
 }
 
 use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
+
+use crate::ptr::{HashedPtr, RestrictedPtr, RawPtr};
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
+// For wrapper types that implement Pointer (like HashedPtr, RestrictedPtr, RawPtr),
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
+impl_pointer_adapter_forward!(HashedPtr, RestrictedPtr, RawPtr);
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
-- 
2.43.0

