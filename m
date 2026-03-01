Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6ED1DF271;
	Sun,  1 Mar 2026 01:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329693; cv=none; b=Ymby2vz0BVn7zdjX0gVB0s7okoRlc2HB8hsT6/s0RRp9FuZu1/xhYSq8V8xfnWoOoEm+Yuc8A4kawSzF05FcJ3P+ffU3hQQanOIFOix3opwuMGA52v2lf+qjAgVHSUtTV2wU0Bd1CQSLwBJJ+HaRYnav8k0seVaFO9ioKfUBlIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329693; c=relaxed/simple;
	bh=jk93HuT9c8dezRQZAu4yZ3ALgYBKhr0sM2ZmVwDJr28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ks2AnARkCUBcUFMiyP0YNElC99pg4ifVJTTC08IreMKTrWVP/w5Q06AB3o1b8QtN4O0Kt/0uNLBEmevQGxcH86ZNJbBth9juZjRbug0R2qSwmq9qic8ipDd6oDIEXRQU8v2LxBcDl4A+tFfSNuUMuardK2wexjNS02i5UR8tf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilvV9Egx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilvV9Egx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC8FC19421;
	Sun,  1 Mar 2026 01:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329693;
	bh=jk93HuT9c8dezRQZAu4yZ3ALgYBKhr0sM2ZmVwDJr28=;
	h=From:To:Cc:Subject:Date:From;
	b=ilvV9Egx/L8CGVo62CIl11G8VpxDJle4vHQu4CtUv/H21wNVWU1XKdXFT/LYLt248
	 GlNLc/kPZ7yCJwUiFAkJKCbT6Dw3xH2fqU6YzDVYsH3dJbsSllswvloxzP1Wxr9DHI
	 0F4k5XdH3FBLLsWfdO+N0uulAEteLggMHKU8b43yA/xfBIAzQe+YhPYxHZ4vedRMID
	 opnPRGiEUfX2YIXA3y2w77VKQz3J6m7p4uA5Pvf0gTNWBp8/1rc9hVxLhOSVTn3p8T
	 9/RD55SI1eo8dgRJF790Y3tB1+Fo0EbFMJztpeKC1X6OiQQsQ4axYEEfnxQQ+Q2Q4O
	 UdHr8OeXtEr9w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lossin@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: FAILED: Patch "rust: pin-init: replace clippy `expect` with `allow`" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:48:11 -0500
Message-ID: <20260301014811.1712317-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a58b8764aed9648357b1c5b6368c9943ba33b7f9 Mon Sep 17 00:00:00 2001
From: Benno Lossin <lossin@kernel.org>
Date: Sun, 15 Feb 2026 14:22:30 +0100
Subject: [PATCH] rust: pin-init: replace clippy `expect` with `allow`

`clippy` has changed behavior in [1] (Rust 1.95) where it no longer
warns about the `let_and_return` lint when a comment is placed between
the let binding and the return expression. Nightly thus fails to build,
because the expectation is no longer fulfilled.

Thus replace the expectation with an `allow`.

[ The errors were:

      error: this lint expectation is unfulfilled
          --> rust/pin-init/src/lib.rs:1279:10
           |
      1279 | #[expect(clippy::let_and_return)]
           |          ^^^^^^^^^^^^^^^^^^^^^^
           |
           = note: `-D unfulfilled-lint-expectations` implied by `-D warnings`
           = help: to override `-D warnings` add `#[allow(unfulfilled_lint_expectations)]`

      error: this lint expectation is unfulfilled
          --> rust/pin-init/src/lib.rs:1295:10
           |
      1295 | #[expect(clippy::let_and_return)]
           |          ^^^^^^^^^^^^^^^^^^^^^^

    - Miguel ]

Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
Signed-off-by: Benno Lossin <lossin@kernel.org>
Cc: stable@vger.kernel.org # Needed in 6.18.y and later.
Link: https://patch.msgid.link/20260215132232.1549861-1-lossin@kernel.org
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/pin-init/src/lib.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 8dc9dd5ac6fd3..3da65db9e2dd3 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1276,13 +1276,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 ///
 /// - `*mut U` must be castable to `*mut T` and any value of type `T` written through such a
 ///   pointer must result in a valid `U`.
-#[expect(clippy::let_and_return)]
 pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) -> impl PinInit<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
     let res = unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) };
     // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
     // cycle when computing the type returned by this function)
+    #[allow(clippy::let_and_return)]
     res
 }
 
@@ -1292,13 +1292,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
 ///
 /// - `*mut U` must be castable to `*mut T` and any value of type `T` written through such a
 ///   pointer must result in a valid `U`.
-#[expect(clippy::let_and_return)]
 pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
     let res = unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) };
     // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
     // cycle when computing the type returned by this function)
+    #[allow(clippy::let_and_return)]
     res
 }
 
-- 
2.51.0




