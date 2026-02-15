Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC513AA2F;
	Sun, 15 Feb 2026 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771161759; cv=none; b=DUcLO9E04rqhD+T9VAbw72V+PC9uOmHSLCpfU380HK/tx/kikjMsElgidJG4uFA3jnzzqdR4xSAI24UHuXXQdERBHIii5aXE/qjIO1Vqr/xD5wN+R1KyHxM5R2EyO2gs/bVxHiTYRJ0rEzlBoX7KsCVTPA2vo++eVuwKeeKgN3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771161759; c=relaxed/simple;
	bh=ikPFHVCuK3FO5QQ9UkXhhskQppNMbPVcU6xB8DMu+Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g3ijCrNHRpbmOewYfLc+pGuFdvjynFJ1oYN6TSQPt0QRkpI4gkcNM2lE6eRJr1f4siS0y3pDIimAYDF1Ux6/RLd4g/Ocfa6QOXg7SDm0I4ZGP7H4FOJFLJqH5i4bAktgbh/QrpqQFiwbmZYNAVTNIHBLGYdro9kSAXTwIytkupU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QElF+2a+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QElF+2a+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C21C4CEF7;
	Sun, 15 Feb 2026 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771161759;
	bh=ikPFHVCuK3FO5QQ9UkXhhskQppNMbPVcU6xB8DMu+Lo=;
	h=From:To:Cc:Subject:Date:From;
	b=QElF+2a+oXCG8pCRwAnrdagzGRizilRcUg3WcYvTCHXWxzEh58AFc9SAIFSp5g4nT
	 aT+Q0RUi6PCAlS6oGHbePn7xvc7H9FJ0XjkjyNSnb05czvWQkODMx5DHk7PIehZzhW
	 A2XtYiDNYW3ydM7TRxyCPaIWuZxFDBm+dvb5eqYu6ENTsuaxiHvkRDZ5RZB44RW7Bn
	 LbYlibvNPJ6KWfgqzgAlhhXgz30veHJMTJyA6cHLdy2/Bdk2lXBZPMpALvM+dLhd9P
	 BOMn4N4PfK8Rb2Ar2UcRhUNXcOIBfHbwB0Lyy4Q7Wk0RFhleLS3IQZfEVo9xOQOA6p
	 90HmJpnbZC85w==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
Date: Sun, 15 Feb 2026 14:22:30 +0100
Message-ID: <20260215132232.1549861-1-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`clippy` has changed behavior in [1] (Rust 1.95) where it no longer
warns about the `let_and_return` lint when a comment is placed between
the let binding and the return expression. Nightly thus fails to build,
because the expectation is no longer fulfilled.

Thus replace the expectation with an `allow`.

Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 49945fc07f25..fe4c85ae3f02 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1143,13 +1143,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
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
 
@@ -1159,13 +1159,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
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
 

base-commit: ca4ee40bf13dbd3a4be3b40a00c33a1153d487e5
-- 
2.52.0

