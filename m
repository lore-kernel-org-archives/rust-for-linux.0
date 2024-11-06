Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110D020D50C
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730935744; cv=none; b=bKe+yfynlNRkSYrtt1PEik5CRdCQCptKKCssZ8ogyv5uPce5Wn3vYm8ZSU22q8D+3cGywH3meQdjW7pt06zUcc8FJlUFdrsmIIpXoBRABrLPB94X1HRhhQp3PYOIQJmk+wkJMSQe3Yh6vrRadfKxBugABcnXLr8jz+UMebbx85o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730935744; c=relaxed/simple;
	bh=1VXfwh8WaHJSmw0wKYo9irhx2sS5IwKiAAFSaYNlDIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ml/8mfwpUA01KEt9DfIcOGPaUR982Tdr1Np/Wo/owo+gFw/s32SxYTIqjWNo251IFqtkeMg4jujLMKwFm77RJv5Uhtpv6r19wnPFAMio573BSv2kvhNSb025B2TfjTZC1gZy1sl4S9UyNXpKrXNTZRO0u3fC/eIQ3huovfDQtpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSAa0R3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSAa0R3m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B55C5C4CED2;
	Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730935743;
	bh=1VXfwh8WaHJSmw0wKYo9irhx2sS5IwKiAAFSaYNlDIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CSAa0R3mJ+NoHNIMHxby1PwHsowSt5UwARmnkSDrs6DI7ujZvO2XCWzrKoGbXvCLT
	 YhPk7drJDUgaZ2hKRSa/Ro9WlLaVurUItF196Zked3Oh7Nem5k97aJG5bD4Pv77Xu8
	 xkvdJGI8JP9ebNXhRQ2khH9Ha/0CiDuaotLpR8Z3n9cGEvKrexiyA4k6fb4thcoFkJ
	 D1nqOBxyqUGrM1iBNQxYK4J/FXbdG14GNowuoPtYEIii27/ocenDEWG5DHPIajKGPr
	 RQ/rAAKZ1vc5yBJIAd5YgW3N4du0WbVi/Zni1FGwXiEsuWNi23HCTFDzCbO6WFwD+8
	 sehNcUP0JlaAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB17FD59F7F;
	Wed,  6 Nov 2024 23:29:03 +0000 (UTC)
From: Jens Korinth via B4 Relay <devnull+jens.korinth.tuta.io@kernel.org>
Date: Thu, 07 Nov 2024 00:28:31 +0100
Subject: [PATCH v2 1/3] rust: print: Add do_once_lite macro
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-pr_once_macros-v2-1-dc0317ff301e@tuta.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730935742; l=1737;
 i=jens.korinth@tuta.io; s=20241107; h=from:subject:message-id;
 bh=XAaxx9JmqKS+Pe6xMJnXcJZk36ZsLXSLNP4nDUqpGWQ=;
 b=nlo7tRq3zFwZSaKfoh2qn6IK8kzCzxDKbH8xIpf4z5UJL/fZtWhMG3GZ599jVImoik7A/dFDP
 JSxC2eEEyAzCDxybfZKNsgLSjw5p1N2hmIP62lxAGr2QNw+KZEJ+X5v
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


