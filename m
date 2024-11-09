Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3462A19F124
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 20:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731184238; cv=none; b=iQx4oxdbXrDfxoerG1FBGEc0x5brPgLQjUiljDL9Tj73Y8jWd5ynQYLVkdY1MTDTbjUwiR6C0gUt0OArAnU6paAiO1MTJ4SKnall0NyghBgP8qSOrNymwXQ2FlS3Bn3AqTNh32kFSypShIeduZG20Ks176m9GUhlGjh4Zm4oksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731184238; c=relaxed/simple;
	bh=JXTjVbXoIlcAg09YXryvPU+DD2uKtRHxopln9DY/IDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BT5zhCeruYbLoSuS1o5sS3cktJDD52cNAkC5CnFOyHJ5B1YcEC93LKkaftWsDodzM60bM93ePc9fZYKNAuXBWhHiRMNeiKyNN96epwrRf8iLISFj79+Htc/viNzm9B1Rs5nyv4XLCi8SX6f8cpWfAhSI/pDQrZWn0x+GN5n6m88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2trsFrX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2trsFrX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDFC9C4CED4;
	Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731184237;
	bh=JXTjVbXoIlcAg09YXryvPU+DD2uKtRHxopln9DY/IDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=A2trsFrXlDh9/K13ud06LLHYnQbwO4o6eHrUqmZMarUD/hiddRZYFYAR0MZrZYV7I
	 +6sXZZQgmwWhERs/CGN9+IAXoOYeLamaK594vWxFK5lMvXFRF20fpEuC/vPtHdQcwr
	 JQw+IZ5JniY6Me2cjd5JMSuIYHuB6rEy+NUWrPVkrb6rR52+zpPPK7R8nKR9g0gzcu
	 /g0StQdW4Z78E7sd+OKQIIuEkHBubi2TQDNXWCozRvAAYUt4pOhpvBvMDcoT8ixF3s
	 4SZms/9fNpsneNnx/ycjIcI8v82CPcwfuNK/v7uk0JIIgYrOnZ/AqfFSz5mQKAY2Uq
	 BW6jQ3cazvaPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C4BD5E380;
	Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
From: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>
Date: Sat, 09 Nov 2024 21:30:08 +0100
Subject: [PATCH v3 2/3] rust: print: Add pr_*_once macros
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-pr_once_macros-v3-2-6beb24e0cac8@tuta.io>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
In-Reply-To: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Dirk Behme <dirk.behme@gmail.com>, Jens Korinth <jens.korinth@tuta.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731184236; l=3692;
 i=jens.korinth@tuta.io; s=20241107; h=from:subject:message-id;
 bh=OtTNBoLMR8tEZCYVorV6FLpQhsyJ/UjGZp+w8Qly40s=;
 b=JxqISbT5ZYSKgI9N2txVGBeRJabzM+p419f9C2IsCSVrYn+gviS4f39Rmsu/1WY4ewG1DhxUX
 djm7AVGqiH8DGmFS/B7zLvJpJag8c+nS+QTPUtOGCQFyghSY6mRWXGx
X-Developer-Key: i=jens.korinth@tuta.io; a=ed25519;
 pk=bG0q4Zyj3o4d/r326zKL7ym+/tXzyykcjh+U0M13iyc=
X-Endpoint-Received: by B4 Relay for jens.korinth@tuta.io/20241107 with
 auth_id=270
X-Original-From: Jens Korinth <jens.korinth@tuta.io>
Reply-To: jens.korinth@tuta.io

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
functions, which print a message only once.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Jens Korinth <jens.korinth@tuta.io>
---
 rust/kernel/print.rs | 126 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 9c7434b221984ad325138e5dc90ab4340cd0be2e..26542100be1ca843a0f916bd41260e20ec1f1b0e 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -448,3 +448,129 @@ macro_rules! do_once_lite (
         }
     );
 );
+
+/// Prints an emergency-level message (level 0) only once.
+///
+/// Equivalent to the kernel's [`pr_emerg_once`] macro.
+///
+/// [`pr_emerg_once`]: srctree/include/linux/printk.h
+///
+/// # Examples
+///
+/// ```
+/// kernel::pr_emerg_once!("hello {}\n", "there");
+/// ```
+#[macro_export]
+macro_rules! pr_emerg_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!($crate::pr_emerg!($($arg)*))
+    )
+);
+
+/// Prints an alert-level message (level 1) only once.
+///
+/// Equivalent to the kernel's [`pr_alert_once`] macro.
+///
+/// [`pr_alert_once`]: srctree/include/linux/printk.h
+///
+/// # Examples
+///
+/// ```
+/// kernel::pr_alert_once!("hello {}\n", "there");
+/// ```
+#[macro_export]
+macro_rules! pr_alert_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!($crate::pr_alert!($($arg)*))
+    )
+);
+
+/// Prints a critical-level message (level 2) only once.
+///
+/// Equivalent to the kernel's [`pr_crit_once`] macro.
+///
+/// [`pr_crit_once`]: srctree/include/linux/printk.h
+///
+/// # Examples
+///
+/// ```
+/// kernel::pr_crit_once!("hello {}\n", "there");
+/// ```
+#[macro_export]
+macro_rules! pr_crit_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!($crate::pr_crit!($($arg)*))
+    )
+);
+
+/// Prints an error-level message (level 3) only once.
+///
+/// Equivalent to the kernel's [`pr_err_once`] macro.
+///
+/// # Examples
+///
+/// [`pr_err_once`]: srctree/include/linux/printk.h
+///
+/// ```
+/// kernel::pr_err_once!("hello {}\n", "there");
+/// ```
+#[macro_export]
+macro_rules! pr_err_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!($crate::pr_err!($($arg)*))
+    )
+);
+
+/// Prints a warning-level message (level 4) only once.
+///
+/// Equivalent to the kernel's [`pr_warn_once`] macro.
+///
+/// [`pr_warn_once`]: srctree/include/linux/printk.h
+///
+/// # Examples
+///
+/// ```
+/// kernel::pr_warn_once!("hello {}\n", "there");
+/// ```
+#[macro_export]
+macro_rules! pr_warn_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!($crate::pr_warn!($($arg)*))
+    )
+);
+
+/// Prints a notice-level message (level 5) only once.
+///
+/// Equivalent to the kernel's [`pr_notice_once`] macro.
+///
+/// [`pr_notice_once`]: srctree/include/linux/printk.h
+///
+/// # Examples
+///
+/// ```
+/// kernel::pr_notice_once!("hello {}\n", "there");
+/// ```
+#[macro_export]
+macro_rules! pr_notice_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!($crate::pr_notice!($($arg)*))
+    )
+);
+
+/// Prints an info-level message (level 6) only once.
+///
+/// Equivalent to the kernel's [`pr_info_once`] macro.
+///
+/// [`pr_info_once`]: srctree/include/linux/printk.h
+///
+/// # Examples
+///
+/// ```
+/// kernel::pr_info_once!("hello {}\n", "there");
+/// ```
+#[macro_export]
+macro_rules! pr_info_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!($crate::pr_info!($($arg)*))
+    )
+);

-- 
2.44.1


