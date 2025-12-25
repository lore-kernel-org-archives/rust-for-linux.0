Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8442BE7DC
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766703450; cv=none; b=peRx44Po6WnhnboRDK4r2qoKQ/1KRf7rt/P1YpuAXaQ+IP89rmHo/Uu91oi/BmRWD4wT9/uWsfLhVnm9Ys1ogLAlmQHUssOBhD9fSmAA73KTEXfvVNnYkFg/244Ftta51xYXERXvpWhdew/cYP9uX8u6YTll+RGp6r9vLMvL7Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766703450; c=relaxed/simple;
	bh=xS7tN0nZBAaUr/aJWldMvRwkO1T7NShsMwj+FZwSnZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S44cACs3Sa5i+Pkkrfa0NVlt5QoK/IKIYHriPvjmQSZ2/McMZ+Z+jHQkNwuNOq95rpl+bRG++MIQiTuOBLFIoz15c+9OPKQ4PpO6ncoAWkcaWZTLI2IpxPGEILxUX52s+G3PzLP4HSBqMhU6cK0MNJM4/dbxwsu68+wIC5lSj5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a12ebe4b74so120571795ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 14:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766703448; x=1767308248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqa7cOZsEfWEw2dScROVrrTUcpjqFgkUftbZuVCEalc=;
        b=MNhcFW8coyzLYSBq2xLqyKoqDClJmDTQnUp0UMypN/tPw0QQfZ/4ZovzrvVhTojluS
         aQFw0kOfPNNIV/p7kUFUeoNQI4GppQvlbR/v5ykTI2DhR5bqpyBkITIzMmD8o31YZuNS
         BUuxkigFleFEChQPFDh5W0IH7VZyrt5qPjpPaVYI6++YaQf0JnuVKAO5CAV6cdhKADR1
         +MyzFMyvFNux+vVZV+Z1qmpvOh6fyJltrAmmt+/J+9U6H1DnKx0KdmqJ+8Zrbk/Xarij
         jj8g4Lzgb1H35GXw2cMtV8d5fJ6z1husUqH9AErQPFr318zCAPyyrPsi1Fb4W3jxYvln
         vKiA==
X-Forwarded-Encrypted: i=1; AJvYcCUp7NioiI9P+Bf6oFjW24806LWdU4aCan5fNy9xG6pziX4sYP9z5uPAhkwxKh4ffYeOKh81WjR0bwbJL+65rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMz0tY2kUXfYY2uwLsW057j0XA9od9hMJmLMwqTswzVPyZEmD5
	ShdNm2LjTtKPjPBt6jR2+d2avNKEcwo9vqP246Z7M++O6wEqgHkBMGQc
X-Gm-Gg: AY/fxX5QyfBog2vt1jFEcnU+a0yTHwFj5nqFZR8C80MS8UWnq10hbcN2SA1y+zuswJV
	lfm+33Q1p1gF9M+zKUeJCdhAB0rPUpXmWe08l6b1gwH3BlpdIeq+1EF21d7SDNDUDeWkMoy+yy0
	W6vxStey9JQNSS9dYgpEwDhl7297sFNwYZRdhY19OCNionqAiXZNqwfc5UiKMxRnad5N1oGa3Yt
	9bkfwCpKv96ehvhS7Jv5HLOeTF453cbl5zMbuXf7oFfFbl20zZCdUAqgOqF3cHxfossEJmYVaEL
	ZKIFmOXLkC6lw8g9W/8vtpym3Q780QSOZi4HnFhXw7AsfNPqJ3T1j12GxB3iB1VxwRcLYd0f3LW
	K9Qip6GcYTyHPbosEGX/INzxkeUHplSRXamaxr+NlRsYxqEImFmogJY9GPTEYO51eL3S4vrdq+s
	AZRl4BYC9yjpOiLn3AwYLxErOMHCpMvw==
X-Google-Smtp-Source: AGHT+IGuSIL55EKm61cEsteAp2X9mzDUOAXH6BviJy+ZoDXZ/wrkd6gCi+r58IYHTeoCnbUBBe+bfA==
X-Received: by 2002:a17:902:ce82:b0:2a0:c1ed:d0d9 with SMTP id d9443c01a7336-2a2f29359b3mr217353455ad.46.1766703448488;
        Thu, 25 Dec 2025 14:57:28 -0800 (PST)
Received: from localhost.localdomain ([103.56.52.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm187308755ad.44.2025.12.25.14.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 14:57:28 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Subject: [PATCH v4 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
Date: Fri, 26 Dec 2025 06:57:06 +0800
Message-ID: <20251225225709.3944255-4-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225225709.3944255-1-sunke@kylinos.cn>
References: <20251225225709.3944255-1-sunke@kylinos.cn>
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
 rust/kernel/fmt.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..fe4097de441f4 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -28,7 +28,65 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
 }
 
 use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
+
+use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
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

