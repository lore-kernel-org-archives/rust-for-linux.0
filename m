Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDCEFBF6
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 04:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752641925; cv=none; b=GpoE7DktG7hiTWUPFxacMcD0ZNhXqayP2Za+HSIXXpQqzom3VbpNg4hu55T7WYe3w1906b8+ThQ1GzM2UFF9mWkDYMzfr6/mji3JqjGjFj4aeamtuYQm46V1ChgKpMI1+xzaOk7sPfTkCoDh8IsHn2XMh1ql1oc3olWT+pKftB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752641925; c=relaxed/simple;
	bh=RpxQjn0T81zoxVu/rfMKIpb0s0xELkOMlMQhav1p4ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J583O5np9DQR0HD0KDT7m1UMSuRSCALDVLT326qXJ8jam23EDKFtEZ7RwcyB7a+XwVaf+n9SXyMxTN/KY851C/Kq9q4rUxz+4xEQcF993Kt1SOg1+lxg3lgaItWgtb1Qzjh8KrKVYPI2fPCavrGXutqC3AHi6Gmqs7Ra9Z1/FOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4YYLt+q; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4YYLt+q"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74b27c1481bso3948696b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 21:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752641924; x=1753246724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVb2wPCBSPQ2Ss9OwH3a/Y+sFpzdnkRNAjdlYA6Qukg=;
        b=D4YYLt+qJWNARHcjmu9uTj8CqF2krFylb3nxjO6MzDN7KmobsDF/CkGSg4536jFDKx
         Oh6tVTs5rClPqzSISy3QFlH2hYjFCZ82cMFRSYfOoYvm0q2q5PeWI+imM3mMkNqNxKah
         MUKIzD3qyznI/pftl+Ra6ceVlYQuS+yHh5xqETOsOC9lmWNq8avyaMkei7rShZru+B6t
         QO2ojitrb/QMqpJWfMOMVvk3qx4vGOhhkMXmUfYdy2vzuIBR5+0WwbFeoxmtOrNZctRn
         LA+rvTWdxQEzN9mkyxVC48/sf3k/3lBhOCvHPPt/BcwOw/rpLIp4sbPyP0a5c2uEYJ8W
         8nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752641924; x=1753246724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVb2wPCBSPQ2Ss9OwH3a/Y+sFpzdnkRNAjdlYA6Qukg=;
        b=Y/ACtP1woyp64MHM/72KEOc0CddEoON1jKK3avDOfw68fIRcOtmZIfusEWUg3r60bx
         jjnjU4sAO2i5yhvhrWB8bjdw3u9JqUutC9xpGsdY24MxJfSVBjXcIFimykg8/SCVbGVp
         4/xbZi/3gmQLQFJ9uxp/3/Ph4zReu+u2lMw8bbnk0+zx/Mc0eoH/Ee1+8oZugaE7Foy1
         Hc9xX4SH11xsljX17AnHHEQWJzcxEv2W8r/pyPtwqFoUQKSp57B9oGk8EhcQYc078RIz
         FQOY2FucGegUw8BU+ZJq8ZdHRKR+mm4R99D2Uw91IVFacbZu+CP6jjv+v99zLCe1CkHq
         Z32A==
X-Gm-Message-State: AOJu0YxvDUk+wOLVBm89enskNd7/6nXOkr8FQc/XQ/9+lNcKiurczpOv
	bnv4qS1J+BjDIqcLE/ZW5qrP3bMTtl4ZAj9WCKgf4ZHPN0elQySY52R2
X-Gm-Gg: ASbGncue3llKE5KeMVPZC1xwczPavvsjPyce89w80NI98PuqYqIIUTGGWWeqDzwsbdz
	BggDOFd2kYqw1LL8wbPIm2sQdoChpMNop8m4Wqq8wtAiERF/zaNH5f7adE4zvFiecqs5ub6yVue
	YYqkXexNSrOejwpHnSK63kWzTKPBGrjiPwqx6nqfoQC4arQrV3XnTyhrzqYRO0DE7TlCKoAIrOp
	Py+Pgrz6VYoqnIhsKVCRH9eT1sVk+9bT7eQ8aBQNZdiDXgiTVUxvyxjxZVTbdsJlzWTbK6209eW
	+83VXT2BfB/bS28nqh7Vsnwo9nJkpoTjE0eRYk/3U+tgRZdyapKmM/U2a+wKw2nkdVceCUzpe57
	qAM1cHJzFmTeiif7k7pM=
X-Google-Smtp-Source: AGHT+IEz+emx/3fj44jvsqSDxYKM7sigeFnnkeai8yTZWqJ3w6QVh+jXVroQzvNo4HWstX5HwG8+wg==
X-Received: by 2002:a05:6a21:62c9:b0:232:817c:4c84 with SMTP id adf61e73a8af0-237d701a6e0mr3641182637.24.1752641923515;
        Tue, 15 Jul 2025 21:58:43 -0700 (PDT)
Received: from fedora ([2405:201:5501:4085:eece:e0ff:6b68:de2e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bc0fa6609sm10933430a12.60.2025.07.15.21.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 21:58:42 -0700 (PDT)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] rust: kernel: introduce `unsafe_precondition_assert!` macro
Date: Wed, 16 Jul 2025 10:29:57 +0530
Message-ID: <20250716045957.39732-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `safety` module containing `unsafe_precondition_assert!`
macro. It is a wrapper around `debug_assert!`, intended for validating
pre-conditions of unsafe code blocks and functions.

When `CONFIG_RUST_DEBUG_ASSERTIONS` flag is enabled, this macro
performs runtime checks to ensure that the pre-conditions for unsafe
blocks hold. In release builds, the macro is a no-op.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1162
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/topic/.60unsafe_precondition_assert.60.20macro/with/528457452
Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 rust/kernel/lib.rs    |  1 +
 rust/kernel/safety.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 rust/kernel/safety.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f61ac6f81f5d..a242f993f89b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -101,6 +101,7 @@
 pub mod print;
 pub mod rbtree;
 pub mod revocable;
+pub mod safety;
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
diff --git a/rust/kernel/safety.rs b/rust/kernel/safety.rs
new file mode 100644
index 000000000000..a115faa52539
--- /dev/null
+++ b/rust/kernel/safety.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! This module contains the kernel APIs for verifying invariants
+//! required by the unsafe code.
+
+/// Checks that preconditions of an unsafe code are followed.
+///
+/// The check is enabled at runtime if debug assertions (`CONFIG_RUST_DEBUG_ASSERTIONS`)
+/// are enabled. In release builds, this macro is no-op.
+///
+/// # Examples
+///
+/// ```
+/// // SAFETY: The caller ensures the size and alignment
+/// unsafe fn transmute_array<const N: usize, T: Copy, U: Copy>(input: [T; N]) -> [U; N] {
+///     unsafe_precondition_assert!(
+///         core::mem::size_of::<T>() == core::mem::size_of::<U>(),
+///         "src and dst must have the same size"
+///     );
+///
+///     unsafe_precondition_assert!(
+///         core::mem::align_of::<T>() >= core::mem::align_of::<U>(),
+///         "src alignment must be compatible with dst alignment"
+///     );
+///
+///     core::mem::transmute_copy(&input)
+/// }
+/// ```
+///
+/// # Panics
+///
+/// This will invoke the [`panic!`] macro if the provided expression cannot be evaluated
+/// to true at runtime.
+#[macro_export]
+macro_rules! unsafe_precondition_assert {
+    ($($arg:tt)*) => {
+        if cfg!(debug_assertions) {
+            crate::pr_err!("unsafe precondition(s) violated");
+            ::core::assert!($($arg)*);
+        }
+    };
+}

base-commit: 8ecb65b7b68ea48350833ba59c1257718e859768
-- 
2.50.1

