Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3779A20E003
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730935744; cv=none; b=aCV2COTQoJwWHhWRKrtmOpP/XGUnJKpgAmbCPxmEp9+7A9uPx/f1pny2B579kr3Cqrk5CrC7PdAhdnct16zK9w4jZGnwjPevCrQgjEamC2/AQ1q889gDqug9hq47GWMGMziuJGa+cd6hI86a5B0G72qGt5ROgSRhA7VCDSwxYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730935744; c=relaxed/simple;
	bh=GvMxnbEK/5Q/eoDuUKQVUfs6I8KX4QtM87TFJlcg44A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IuZPI7Tdex2G9duMzI0mnObS7h524GIv7lWBftFNBcMMIqMtEb1wv56zfQ6uX00eRrr1dxj+RqJcoNAxpzRNvl38EFN8ZPWKVIu1n2PCici9gqcNRqI6MMT2AHN+/JRWMuyp+y61q1hJY6I2DBeP8Xu25rJcDv7vLAOlHybtM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWyFccr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWyFccr6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C414FC4CED0;
	Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730935743;
	bh=GvMxnbEK/5Q/eoDuUKQVUfs6I8KX4QtM87TFJlcg44A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mWyFccr6YkA258HGDVb3cTnDW7Q7jJgSfCqisb32QRLkxhIenv6wTwqay6HOTAQsq
	 6FCLZYsp7uN/BkgQo3YDd5FGCKykAyYcrH0Nm+eB2jc+Feujdj+YDH5t/f6pyXgUH8
	 MXadtqn+8VJ7JRRcwCtYA74DxCfArRpGDcO8JrFIGEZhFKTQBQIsDgryayXiw1BfIt
	 634OfJZJ1niCOAT1i1I9hc+brd2bto9IIi6d7fGnngD6tLVS9VsCXsXrF3xDzJljxY
	 7fM23ayv3oyx16a2JfgwE6DJNdJ2KyoCOocC19aN4vCE7LZWbFF7dxRev/WmCDHhag
	 FDrGu2uVnecYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE47D29FBB;
	Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
From: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>
Date: Thu, 07 Nov 2024 00:28:32 +0100
Subject: [PATCH v2 2/3] rust: print: Add pr_*_once macros
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io>
References: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io>
In-Reply-To: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730935742; l=3184;
 i=jens.korinth@tuta.io; s=20241107; h=from:subject:message-id;
 bh=Rg1rypxBencBoEZtWK4hZLUSI1PWK1BKSu1RHVkwVHM=;
 b=wk3Uqyn/sTIMMzwwm1IEMbAksk8AGV1PKFEK7OZ2X1sL4LpoUn++GKWq69bzyupStr0DCAA4Q
 dun0o2vcIfYDYJxwoq3LmF4a4rNs3NBVn3S/E3YtMJnFRGkDkqNiOdD
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
---
 rust/kernel/print.rs | 109 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 9c7434b221984ad325138e5dc90ab4340cd0be2e..3c7414f99934359112b39d01392029feda8802e8 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -448,3 +448,112 @@ macro_rules! do_once_lite (
         }
     );
 );
+
+/// Prints an emergency-level message (level 0) only once.
+///
+/// Equivalent to the kernel's [`pr_emerg_once`] macro.
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
+/// ```
+/// pr_err_once!("hello {}\n", "there");
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
+/// # Examples
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
+/// # Examples
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
+/// # Examples
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


