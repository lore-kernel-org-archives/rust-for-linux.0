Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5790A274B5F;
	Sun,  1 Mar 2026 01:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330318; cv=none; b=X3gA56PsOSpNYZzwqI9qSocR5R2DuRToYLyrK7MlYpDnImiFSoQNGpLmkuFUmwGUkXS/ChfJtg15Q0fkpNKIh62rrIPVlP8n7zysWHQwx5+TjYSK6NdylpEW439vT3Ykp68bwUPHhzKeKkSXVdqWXHFBKQknFbz7+NClisAHLbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330318; c=relaxed/simple;
	bh=tCwsyKDovDkNw5PFqz89tJGwOOM56/skz94dmiSHxWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aI82YQc/rD9nqlq66Y/TQucMq65e4wHU97NA5dqNnROtDe5jbqf5yh63Lbf6SNOFFWTualujswGNf/KEkBuhRqJ0LrxkLQheyTI0k8pt6HLG1a+CkmScfgu5+5y1YzMKsyekyPhTAg/6bRWWtNIuxZKo4HuMZuvPO5edpSBNAEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4Bm3Avd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4Bm3Avd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87DFC19421;
	Sun,  1 Mar 2026 01:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330318;
	bh=tCwsyKDovDkNw5PFqz89tJGwOOM56/skz94dmiSHxWE=;
	h=From:To:Cc:Subject:Date:From;
	b=D4Bm3Avd1m78Utvp9AlOS5Me3caS87Z3DuFq7EhIbb9Q/5/Ssv/RNKh6YB0ap8qfz
	 JczT/5wLOcGZJWEp1KFS9kt+EF2o6tA+rYVj1ldVVy1SDiB3nxC1zWzI7Gs95h6GtB
	 uGlnGuGiXunm5/t32FmwgJNeaAt772bGQYk6oxxp1Z4mOEZAmx8D0eDxJDUZOlaw3U
	 RH5ako/KawsiXfw2xvCtm2X9TZZsjE/Y6gYSzUtI2QIK1Sm8GSCjlMZGrMX7FjRK7N
	 NBg9rpMm3SA0rtpub6dTLPoYhb8DQ+NUXlqAGzFZYyeqTE/Z0QvHFSKtTGTfGy9OSE
	 kV2V/fpMhbQ7A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lossin@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: FAILED: Patch "rust: pin-init: replace clippy `expect` with `allow`" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:58:36 -0500
Message-ID: <20260301015836.1724150-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
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




