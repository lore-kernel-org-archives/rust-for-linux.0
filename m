Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53FC13BC12
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731184238; cv=none; b=FmLFmCxtUy3lErVZ6sVmFm49QoI+KQPkGs+gl7kdR6KwHkGdKo0MDZqdfzGUHa9ox/pRUooQYsjjd+0HwN9hQpQoCOsKzlgIk1CK0qc68p6XdO69A74EDUzLJZg7hpo6S6UMHt7ikkDLgX17/mkvRhO0PiqMnalJvhR24fX+t2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731184238; c=relaxed/simple;
	bh=1VXfwh8WaHJSmw0wKYo9irhx2sS5IwKiAAFSaYNlDIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qx5eJa8+mLM+d/1qyiaYhTd85PMGBYpuvC+XfPR826S1+3ZL4uEv/vWkykIzlS6d2zM6uvu069MZo2QgSJdTiNjz/Rfwe7fHmg0AJjN6qcNs0bt8dPnJDJ2nuDzf8HhvBxEBU4ujAmAXfquTz/cbk1Xg0WCBYpTIeB2hVgbkf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlvHO4vM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlvHO4vM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7738C4CECF;
	Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731184237;
	bh=1VXfwh8WaHJSmw0wKYo9irhx2sS5IwKiAAFSaYNlDIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PlvHO4vMvoSdrdpSgxHZjdHacJLV8DFow3a0BTR1V++vMHzzBgrykHsQ7HIk/HLW2
	 PgJtI/necTRZyW1V6rNh6q6Eu/Mz4BnzNP0B16YARlV9BZkASaEyA2FQPSw4fCIQML
	 amRe1kQ6Uhf4jPn6Tb1QiJrajdBE3nCO1oQne8CJ87szBNWgdzAZzfSSjzSQWONw66
	 xSW0BqjWeTdHPO9O/TKExer4Mbv9sPG4LqTNzMJzQVGODCQFsUSdGv/fCvw3JKIAzs
	 jHYk5z34qpW4CZfWBNYoBxA54d+oji+ygeoEj/4KDpdi6pbAX+nMAm9WVF7ysW6uqE
	 uNeev8ksuCg9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40EED5E37F;
	Sat,  9 Nov 2024 20:30:37 +0000 (UTC)
From: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>
Date: Sat, 09 Nov 2024 21:30:07 +0100
Subject: [PATCH v3 1/3] rust: print: Add do_once_lite macro
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731184236; l=1737;
 i=jens.korinth@tuta.io; s=20241107; h=from:subject:message-id;
 bh=XAaxx9JmqKS+Pe6xMJnXcJZk36ZsLXSLNP4nDUqpGWQ=;
 b=3UK44y6189t7LKtQxa+ZwrZ52UJkDtqvkf0w+FbYyWfBJ84RriNzLCre1wree67goQ6hAzxTL
 Oy0hlBzfykHATUmMObzWKzq5ecjHtxlD1cKH3bdP3FHuxwX3/rF1Nmn
X-Developer-Key: i=jens.korinth@tuta.io; a=ed25519;
 pk=bG0q4Zyj3o4d/r326zKL7ym+/tXzyykcjh+U0M13iyc=
X-Endpoint-Received: by B4 Relay for jens.korinth@tuta.io/20241107 with
 auth_id=270
X-Original-From: Jens Korinth <jens.korinth@tuta.io>
Reply-To: jens.korinth@tuta.io

From: Jens Korinth <jens.korinth@tuta.io>

Add do_once_lite macro that executes code only once.
Has two rules, one with a condition to replace [`do_once_lite_if`] in
the kernel, and one without.

Signed-off-by: Jens Korinth <jens.korinth@tuta.io>
---
 rust/kernel/print.rs | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index a28077a7cb301193dcca293befb096b2dd153202..9c7434b221984ad325138e5dc90ab4340cd0be2e 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -414,3 +414,37 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// Executes code only once.
+///
+/// Equivalent to the kernel's [`do_once_lite_if`] macro when called with
+/// a condition expression.
+/// Public but hidden since it should only be used from public macros.
+///
+/// # Examples
+///
+/// ```
+/// kernel::do_once_lite!(pr_warn!("warn once"));
+/// kernel::do_once_lite!({ /* perform_complex_test() */ true }, pr_warn!("warn only once"));
+/// ```
+#[doc(hidden)]
+#[macro_export]
+macro_rules! do_once_lite (
+    ($e:expr) => (
+         $crate::do_once_lite!(true, $e);
+    );
+    ($condition:expr, $e:expr) => (
+        {
+            #[link_section = ".data.once"]
+            static ALREADY_DONE: core::sync::atomic::AtomicBool =
+                core::sync::atomic::AtomicBool::new(false);
+
+            if !ALREADY_DONE.load(core::sync::atomic::Ordering::Relaxed)
+                && $condition
+                && !ALREADY_DONE.swap(true, core::sync::atomic::Ordering::Relaxed)
+            {
+                $e;
+            }
+        }
+    );
+);

-- 
2.44.1


