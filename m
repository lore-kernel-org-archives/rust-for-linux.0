Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B89B22A4E1
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 03:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766028441; cv=none; b=Eeg9xjIz4gzYYz4BVRh3/6Jnm9YYjZMhBItkHYvKCUB3e2rSlsFWkS2umdyT4RDC6K2kepR6Sp0ew2hgOadB0BqSfL5iVMjy7kUkFG/KfxGOnxCzUte4DaDK2FlMPK1QT4dsqPr0+ROjNlgk3m+XZ1cTcJygETXam8LE8irhBo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766028441; c=relaxed/simple;
	bh=s1Igz2HWhLX0HzksA5HhUjzhBjNL0VJmxvPxlhBHNGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oHi/asn3E6ZMUy+Z7JRvdmDBDFaPyGun3JSHcNLJM9LXYAs/H9A6THaAVqqoV0nvFbevyGl35oG2e9Q5EQSjWN7D8l3smAbig+oQK+eoYijvx3ZhApEUQiQZSNdSPuN3KC9lG836bGUwI0ihoXrEFbO4QUN+XlJ6xgznjkwys2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d6f647e2so2943495ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 19:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766028440; x=1766633240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qN4Qhd+BtZVyX/azUXh6nWsHf7iGIIf/Y55LWrTs3kE=;
        b=Ts7CobbogBkYg6UuBLGXsXvv4eMOxeFWee9iLWyf/v7we0YyrMlGU9DFQzxriBcDeR
         dHQIi2xJWfyd+Ne5DXqOwkjP0fo7FRDGy/YwmVfC6vuqQLg2GhbViDIJffWgUPfTO4VD
         EF+lGFDiaF5GnY17BPWPurQhZbiJFgF6PBGbdQ4LW4pvxKNZArpZ4CtEubu7dfYEMI7N
         KDoPgZFZ9Kj1w4Knf6PNAvBH1ABW5JCPhsfRnZ40++JwkUDekPbv52MBAFrqKKwR3HMH
         wyfOvlile3Lr7z5zJA6aHkkD3frfs+3m5SOJkKUxHQcXX9QtcsqGda+AqLW75e8UosQp
         +7ew==
X-Forwarded-Encrypted: i=1; AJvYcCXLs5roIeEvFtpwCLZ0GW1pGkOrVo9TMPONvkBBxokEzx44YtNXq6Suf6m//J7WB6ZGK757BjT6l7vkH4AKKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO0TEgbJQp/tWYSl5M/WvEV2d9sHerSJnIr252XcskPvwEBbtS
	v7Y7VGvBuPYi16tCjNzBjvzivih3FRcDJfl03t5QLvJ7Ozw7cbmPkZ6F
X-Gm-Gg: AY/fxX6TcMkyV7gaCe/4w+y+CnhzkvNr1LpvA+EdEWere0d+KfdgUjTsScN+pCvnOAc
	AhmFp80ezYLn21X1AnYkgoMi1ZHIPO5lZ2QnjbJvg1SZ1TOII0u0s/T1sJQKFOKnV36CRLv0sEa
	+N1+MjY/SbsGFi96BUh/RGh0CLaK/hFr+G42tEE5rtWmH9FOVBwv0DfaxKaWMiT1rnwe4/jVGi2
	MHnMHYAuN1HpcU0iaAgnaU9Nl112IMh3K0163a5IA/rspcZgMSTABcWEBB8o58s26HY9sTOiu1k
	CPY/LJZrYQrP2BUsNAdaf318tOMuKTBYb3dF1KPJQSamqa1rGL5RQ5xegO9yCUhyNBCozK/nMDe
	y1DQZg03E6z9mHmNO/+h+0MUIx7vYXUuc45vDWG3tXXg1QSBDHSo0uk+D7y8Xgp/kDI/egy3nio
	Xd3Y0vEJkIgh2StlF57tB9Tw==
X-Google-Smtp-Source: AGHT+IGw+ikvvveltoHhdNQjDwVPKSrO+Gvb8vPFoPoVgn8vdj3ssoqZFTRV8EsRST5p8a6hUlyWYQ==
X-Received: by 2002:a17:902:c40f:b0:298:6a9b:238b with SMTP id d9443c01a7336-29f23d12fd6mr185190235ad.51.1766028439551;
        Wed, 17 Dec 2025 19:27:19 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0888f8csm8067115ad.33.2025.12.17.19.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 19:27:19 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH] rust: fmt: fix {:p} formatting for raw pointers
Date: Thu, 18 Dec 2025 11:27:09 +0800
Message-ID: <20251218032709.2184890-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fmt! macro wraps arguments as Adapter(&arg), causing raw pointers
to be wrapped as Adapter(&*mut T). The generic Pointer implementation
then formats the reference address (stack address of the variable)
instead of the pointer value.

Add specialized Pointer implementations for Adapter<&*mut T> and
Adapter<&*const T> that dereference before formatting.

Example:
    let ptr: *mut SomeStruct = 0x12345678 as *mut _;
    dev_info!(dev, "ptr: {:p}", ptr);

Before (wrong): prints stack address of `ptr` variable, e.g. 0xffffc90001234560
After (correct): prints pointer value, e.g. 0x12345678

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 84d634201d90a..2aebc782fedf9 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -28,7 +28,27 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
 }
 
 use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
-impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
+
+// Special handling for raw pointers: when Adapter wraps a reference to a raw pointer,
+// we want to print the pointer value itself, not the reference's address.
+// This fixes the issue where {:p} prints the stack address of the pointer variable
+// instead of the address the pointer points to.
+impl<T> Pointer for Adapter<&*mut T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(t) = self;
+        // Dereference the reference to get the raw pointer, then format it
+        Pointer::fmt(*t, f)
+    }
+}
+
+impl<T> Pointer for Adapter<&*const T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(t) = self;
+        // Dereference the reference to get the raw pointer, then format it
+        Pointer::fmt(*t, f)
+    }
+}
 
 /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
 ///
-- 
2.43.0

