Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88653246760
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Oct 2025 21:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873996; cv=none; b=RW5hS7XyamRxiaR6XoF0IUYYc1GfcyNHLzOvI1vVe/95iebO3YeRX0XSv9y3vC0heZu6RbViruh8AN1wN3akzmcMkOLMxKWBSDEexCMfweSZECnfgmmzZDxQplcpDzoIPR+O2bYe/RAondv0Cwttl43YVbODgN5djVziQh9o+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873996; c=relaxed/simple;
	bh=TjMBIpJuIncye64KaQHjQxNkiHmv0nM5WF2NYhgM1sA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EVLH3I11BrljxVbzbFjOClBK2jsQ/+/OWn+66dmz66rGqwKQYtkQDvv0oY+xzFjA+D542QcQUTxRRpcCTjwkcA6Y+ZBnxo0XMS6/MPQTPgwCQjJi3amWDXQql5BjCeoDy5aP6+YL5R5bAbLZnhdlu4q2n61a8fKv/JKDZCgbLBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVRFCfnD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVRFCfnD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3845537b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Oct 2025 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759873994; x=1760478794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UF4S4+6DAZK2WY4k347BiCLNNSJST0g53tyGQcJmqTg=;
        b=fVRFCfnDqZIGLnU+2Cpkb63qKhdqkfFewNKgWFqh/mwIhIvlcOdjXm3VwuGhKidVyd
         43iOkBoOfZeGWPxCyUkTJYrakAFhfTx1vbEROfVeK9o/1nkBsuZCJLsnHX2CjSJQH6m6
         ezpCeRqHp7618tgZZQzfhjQZnIHtQmKHpVqNUjN6XDjbjCq+VxLmZKBeZoX1OdOCVGTm
         tH61NFLM3On5VgK9BjxLSqyVrvcZIm3Cy6eyXyWcg0Oo5lw74k2ZB83Rlmta1FM2xgNM
         5Jpr5FgHLCLjKxRGKBrH4EjbNzF2T6jPYcuh+vFzrf8TILy5WV9WCPFSaGFR5LThDbTZ
         LI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873994; x=1760478794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UF4S4+6DAZK2WY4k347BiCLNNSJST0g53tyGQcJmqTg=;
        b=JAUSDNoX5ZSeJl4Hhtc4z+BMYDN2K6RyYoqnc75c3D7m+0ONhvG3QjlOwJAUX9lI13
         kIGXZ1D8iwjtDGj23eUGBh43NjE9BnPPKLrYR8PZcyOmYdU9adrLJNhQtPz0Zd3/ML39
         M2GgMX/2Kt5EFQ1XQlaSrMvr9pmr864wB5+ajVZXsQSfNkUYe14MCdtp1+k/9u1jEIqP
         tdizIpTcNQXjJ2VzyJVlVUWJHaVhObeDP7R/s+F01pitM8xxuR00GK11W/bqhqV5U1ly
         reJVTETM6XTU9hvmaDLU0C3pKTKU8ptYGFMJeAVnFbmhWaFs+pQy88EGHscrryW+9FIE
         IdNA==
X-Forwarded-Encrypted: i=1; AJvYcCXuFNpKL1Jqfu5Nh/D16iDm44V53OCmrxRwcYc8pTFZ1n6oO+WxP2c79JiiBIZwdm5pbnT5yw4qEf1TDI2iIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK6ra5rYP5J+zUxNCnUk7x4frmOnYfgxO/fOGyyaJS69KdzsiC
	4el/nEMMRf0NnP8BTdYENYGQ4CRXkVTSyQhpN8HhXgT0eCCv4LwGdZwy
X-Gm-Gg: ASbGncuNH6KhY4lKVzqDGVO8RG5o1R22CAjumg36AZiCwEdHbZ+uImPnk8uDyiUy3ar
	bjbtiZ6GWHR7MmnKPI6QySnNIUtztQOu+YFFC+Kc+MryUWvVNhvIN5HBujTNt7elzd66o/D13Zo
	0UYEXnibS0iUnzgsoNz5ypsO6uL6y+UNQJ+54l8xwxiruJ/2GYer+awaZKQ/mtqYE601bcUl1fB
	L3dqaVGC6DXftLM4m/KdBq50rLEXh7Vw3Y1+0fI7BcMEs6i7yU5jhapNyzZyfLLlc7fLG7hFeHv
	BjtTNyneZmf1Lr4HeIw/4WkLcrmTLYf5HZLClZRtbvq+3VA/K9Qt7D0x25U8Qnxo85oc186Jg+Y
	/UVifrLu/rrRL8ha4QLeebYuTlhFGaAZdhh0EVJREEZ2C
X-Google-Smtp-Source: AGHT+IFYbxCcTc1tDhHXGe1RXgH8ceXy4oTaoEh00Tiq0z7+C2qi5X12WI3y1o8uxGTjgYA4NeNgDQ==
X-Received: by 2002:a05:6a20:3ca7:b0:32b:6e08:e545 with SMTP id adf61e73a8af0-32da839f237mr1455108637.36.1759873993430;
        Tue, 07 Oct 2025 14:53:13 -0700 (PDT)
Received: from fedora ([2405:201:5501:4861:363c:cb7e:a622:4141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053767sm16687579b3a.52.2025.10.07.14.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 14:53:12 -0700 (PDT)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v6] rust: kernel: introduce `unsafe_precondition_assert!` macro
Date: Wed,  8 Oct 2025 03:20:28 +0530
Message-ID: <20251007215034.213779-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a new `safety` module containing `unsafe_precondition_assert!`
macro. It is a wrapper around `debug_assert!`, intended for validating
pre-conditions of unsafe function.

When `CONFIG_RUST_DEBUG_ASSERTIONS` flag is enabled, this macro performs
runtime checks to ensure that the preconditions for unsafe function hold.
Otherwise, the macro is a no-op.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1162
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/topic/.60unsafe_precondition_assert.60.20macro/with/528457452
Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---

Changes in v6:
 - Move variable names into format arguments in the doc example.
 - Move closing brace ('}') to new line in the macro.
 - Link to v5: https://lore.kernel.org/rust-for-linux/20250827060013.6874-1-ritvikfoss@gmail.com/

Changes in v5:
 - Change doc example
 - Use re-exported `kernel::prelude::fmt!` instead of `core::format_args!`
 - Link to v4: https://lore.kernel.org/rust-for-linux/20250808192005.209188-1-ritvikfoss@gmail.com/

Changes in v4:
 - Change doc example
 - Add `no_run` attribute to the doc example
 - Link to v3: https://lore.kernel.org/rust-for-linux/20250731111234.28602-1-ritvikfoss@gmail.com/

Changes in v3:
 - Change doc example
 - Link to v2: https://lore.kernel.org/all/20250730181420.6979b4f1@eugeo/T/#m9cd35a8fc02a18bd03934c7ecdcffe8667b5fbbd

Changes in v2:
 - Wrap `debug_assert!` internally instead of using `pr_err!` with `assert!` + `cfg!(debug_assertions)
 - Print “unsafe precondition(s) violated” only on assertion failure (no longer always printed)
 - Use `# Safety` section instead of comment in the example
 - Rename module-level doc
 - Link to v1: https://lore.kernel.org/rust-for-linux/20250716045957.39732-1-ritvikfoss@gmail.com/

---
 rust/kernel/lib.rs    |  1 +
 rust/kernel/safety.rs | 53 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 rust/kernel/safety.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..40c82d227314 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -124,6 +124,7 @@
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
+pub mod safety;
 pub mod scatterlist;
 pub mod security;
 pub mod seq_file;
diff --git a/rust/kernel/safety.rs b/rust/kernel/safety.rs
new file mode 100644
index 000000000000..3ff78cef2e02
--- /dev/null
+++ b/rust/kernel/safety.rs
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Safety related APIs.
+
+/// Checks that preconditions of an unsafe function are followed.
+///
+/// The check is enabled at runtime if debug assertions (`CONFIG_RUST_DEBUG_ASSERTIONS`)
+/// are enabled. Otherwise, this macro is no-op.
+///
+/// # Examples
+///
+/// ```no_run
+/// use kernel::unsafe_precondition_assert;
+///
+/// struct RawBuffer<T: Copy, const N: usize> {
+///     data: [T; N],
+/// }
+///
+/// impl<T: Copy, const N: usize> RawBuffer<T, N> {
+///     /// # Safety
+///     ///
+///     /// The caller must ensure that `index` is less than `N`
+///     unsafe fn set_unchecked(&mut self, index: usize, value: T) {
+///         unsafe_precondition_assert!(
+///             index < N,
+///             "RawBuffer::set_unchecked requires index ({index}) < N ({N})"
+///         );
+///
+///         // SAFETY: By the safety requirements of this function, `index` is valid
+///         unsafe {
+///             *self.data.get_unchecked_mut(index) = value;
+///         }
+///     }
+/// }
+/// ```
+///
+/// # Panics
+///
+/// Panics if the expression is evaluated to `false` at runtime.
+#[macro_export]
+macro_rules! unsafe_precondition_assert {
+    ($cond:expr $(,)?) => {
+        $crate::unsafe_precondition_assert!(@inner $cond, ::core::stringify!($cond))
+    };
+
+    ($cond:expr, $($arg:tt)+) => {
+        $crate::unsafe_precondition_assert!(@inner $cond, $crate::prelude::fmt!($($arg)+))
+    };
+
+    (@inner $cond:expr, $msg:expr) => {
+        ::core::debug_assert!($cond, "unsafe precondition(s) violated: {}", $msg)
+    };
+}

base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
-- 
2.51.0

