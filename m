Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A735E1C0;
	Tue,  8 Sep 2026 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854802; cv=none; b=gA4eKx9hh6UaWE0bHMCMIGwkBWlK+4bREww2KDPKGaLVInc9Xz6W7jnVX63i0hKW9Wyy4owz93piqZxqNXFCZKb9G1tfeix6Vg0bhEbMwOqRHB/nsHcPMXF0BDDWGoQrfnm4Ok0epIKvETkMmxN9iQAOsZlNyFBcg3KrhyzOUGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854802; c=relaxed/simple;
	bh=1LNdn2DsFwH2jWJWGOv9b4qwkxvpmnmbyfdbFz/ZxiI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=BDfGtcgEhFcq+wwKYElGIE2z/dX66hKGhwCLnZqt4SMQacZ0RweEsm6lslJMgB49GUVjraEf4gaRIa2h/8A42Lfi+kZHEtf2ezl/42aEGVOtOQYrLrqm0uVMHyfCRnqyNa6vYAjU7Ef8KAZTmSqZlCYXyBYl60w2iL/bjU53vvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=LO2NSogM; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="LO2NSogM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788854796; bh=y1uTVxb9Gwa8hEjghU+MfLH1UYxda7+i6VRFQveA3F8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LO2NSogM8dxl1OO/I/JruzPfOktq7Ggg0tTrH0vWdvUhk4jcGNjSwubc3mItW50Rg
	 EKt59fPrn00DFR+ILxSgCCBIwxyLZoAGbHJhUJq8CxlpHn2WOKvswB4A1HZtM/gE2B
	 a2nDWYUxqf+loXw/ifC1ZUIOISQUPIjJv8J9n7Ss=
Received: from localhost.localdomain ([106.114.216.75])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 185190A2; Tue, 08 Sep 2026 16:06:05 +0800
X-QQ-mid: xmsmtpt1788854791t2biivmd5
Message-ID: <tencent_DD1EF416B64C6088DB85E0AE3F9F0FCCEB07@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G4q9zHqrX04L5YCvnivhOktp5B/tow4dzNi8d415buZCs8o9djs
	 Q01yyi0roSfTjIHwrERHbYo2WGFpuL2DoITKDYxXjo0DD4J1cQSRYVLNlCPMSzn4srZc8bdeIey1
	 bP5lqxKk0Vwn+FWiG0R1y8jkE0qBmKF9Rx/OcotUkR1umYQKcYH8Qg21T4J77ielxUAG5shJUGlk
	 9s1YKlQEchvYRggrjLb3pRXKAXcKrkPJn7oYnWCpDfbtZ3/rAlv6CqlwyT/r1jO2+oVX+BLwAKSw
	 BvplsXQCvNL0KhRHtMWm+OJmCNFHF804I+gH2cGrgKfOsF4rL8EQbXYukkTAXdjNojfD8bhvM+qM
	 Apu9LI5rvsUxFlFZ831Q5byPa2VzKheIq4j+JK+7cvl34Q9wciNnVNoNbSRJ34puQ/ewWtdw6fy4
	 SGjogAL/v2RneDByQnGmCv3RRprsDDo3CtzBWOpmxWcFEUfzE+kfVJYpANZdBz8qCFOvMNTgzMyX
	 +hI/BcvrGRpZ7mITUcdV/JHWvtY0Ve9GIThzy61eARAmMRnFC47v73NwieY3vbv1dO+5ML48NSep
	 7wz5uINMdLofQS8mSJ4Vw2KgnGnwdG/EArNA4ENjlr8bRi1wKMV6YQJWqIYvsj52P9bR0FwhTbqM
	 uXG22QgNnGuTefcNim9O70S9Wmk9/23lBb9+lqa6Yk1qE6iymVDyHAx37k6EPPY/Jd2gTDr6FMKR
	 HlGC2HwYJEEjeekWl3vbtL9zD0LoYA2JogqeVOwOrLU5bPZuSjDiW+ap6fR3Y21OURpN/SxqsNxf
	 taBBrMzAvLthRfJfXPXTy6T5aCORCLMVKi23OUDQ1BBlNdBksDODSl0vYmOAc9wh9zlexX4RYfjd
	 51bhFHXGgUxkn5hvRVYuM2+2YbbaqMHX9Ermf6W6T11kYGqv1HERr5VBgtLcCYid9tEaLhcBUZ6S
	 1JUO0rJIlxrUzBPg1zbGIdw9DcodPgtJzH+LSAIA8xdDn2GlwHSccdjIM5SbIZXrdRabRfSFTz2T
	 LdUW2RE1/hIpOzISZotdpUQoTwWJSL/gWB6C3vUg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: JX <1239989762@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: make unsafe_precondition_assert! const compatible
Date: Tue,  8 Sep 2026 16:06:02 +0800
X-OQ-MSGID: <20260908080604.34070-2-1239989762@qq.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908080604.34070-1-1239989762@qq.com>
References: <20260908080604.34070-1-1239989762@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The no-message form of unsafe_precondition_assert! routes the
stringified condition through the formatting machinery. This prevents
the macro from being used in const unsafe functions.

Build its static diagnostic with concat! instead. This preserves the
message while allowing the no-message form in const contexts. Keep the
custom-message form unchanged since it intentionally supports runtime
formatting.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1232
Signed-off-by: JX <1239989762@qq.com>
---
 rust/kernel/safety.rs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/safety.rs b/rust/kernel/safety.rs
index c1c6bd0fa2..a45a574709 100644
--- a/rust/kernel/safety.rs
+++ b/rust/kernel/safety.rs
@@ -7,6 +7,8 @@
 /// The check is enabled at runtime if debug assertions (`CONFIG_RUST_DEBUG_ASSERTIONS`)
 /// are enabled. Otherwise, this macro is a no-op.
 ///
+/// The form without a custom message can be used in const contexts.
+///
 /// # Examples
 ///
 /// ```no_run
@@ -40,7 +42,13 @@
 #[macro_export]
 macro_rules! unsafe_precondition_assert {
     ($cond:expr $(,)?) => {
-        $crate::unsafe_precondition_assert!(@inner $cond, ::core::stringify!($cond))
+        ::core::debug_assert!(
+            $cond,
+            ::core::concat!(
+                "unsafe precondition violated: ",
+                ::core::stringify!($cond),
+            ),
+        )
     };
 
     ($cond:expr, $($arg:tt)+) => {
-- 
2.54.0

