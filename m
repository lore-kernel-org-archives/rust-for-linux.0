Received: from forward206b.mail.yandex.net (forward206b.mail.yandex.net [178.154.239.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323CB270576
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359400; cv=none; b=PBxid9cAF/Y3PTt8KvB4tLXaftO4T9YKDMstPN9L1WEXb8rf1p7FL/L6wTajTWGqI0ujCNsdNEfIgCT6SU0TOwoMddxdz1fXXhR6JXyZTzHWcgL3OIhAwtFkxEla5uLfHwQ2h7zgXmFUiBIo15k++8xP+ply1eVco4wGWZ6778A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359400; c=relaxed/simple;
	bh=Wk2F0ZYnUKV2YB+NkwVYvjqJqYIcHwcJ+TXrPkuO1MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTXInLqVFjrrcnvMKiX77wrnBZ6ZwwGr1cuYI5LT409zequsjg3Poe8d9PFSAlmDEFswnlA4kwKcoqkl823lUvkWEz8M1XRmLYSPgibaxve1lOiOfQDGp1mQkUqB4lYFivV6HKtA7DWnLuhS+FZl6RmMmSyOhPHanT8+QpWQu9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=KGdjDeXN; arc=none smtp.client-ip=178.154.239.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="KGdjDeXN"
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
	by forward206b.mail.yandex.net (Yandex) with ESMTPS id A62FC8208E
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 15:43:08 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:2f3c:0:640:7ca0:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 46EACC009E;
	Mon, 13 Oct 2025 15:43:01 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id efN1GCWLNW20-Wqi7We3X;
	Mon, 13 Oct 2025 15:43:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760359380;
	bh=KHmHmni3HvfYWxKQg3GCoE8ST1hDrIXvqzR6BYmAlPA=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=KGdjDeXNRgdu8imqY6EqzIScg5Oe4h2/tLlmiYf/TFpWrDrupWKG22aibeRlt83/r
	 IdTuPQlcjnVzK1GOG8Yztehu8Wey3WABFMni62T5dSFpbhXKuFdnkdIexaa+4zNBGc
	 hjRZbOQSNGppdmB92dHtZfHjkSPADxd7w3buM1ds=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@gmail.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v3 1/2] rust: add `ToResult` trait
Date: Mon, 13 Oct 2025 15:41:38 +0300
Message-ID: <20251013124139.18809-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013124139.18809-1-work@onurozkan.dev>
References: <20251013124139.18809-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds `ToResult` trait to handle integer return values from C
kernel functions.

Example:
    let _value = unsafe { bindings::foo() }.to_result()?;

This will replace the existing `error::to_result` function,
but it will be handled in the next commit to keep the diff
more readable.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/error.rs | 74 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 1c0e0e241daa..dc566b0cef13 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -392,6 +392,80 @@ fn from(e: core::convert::Infallible) -> Error {
 /// [Rust documentation]: https://doc.rust-lang.org/book/ch09-02-recoverable-errors-with-result.html
 pub type Result<T = (), E = Error> = core::result::Result<T, E>;
 
+/// Trait for handling integer return values from C kernel functions by converting
+/// them into idiomatic Rust [`Result`]s.
+pub trait ToResult {
+    /// The unsigned version of the integer type used for successful return values.
+    type Unsigned;
+
+    /// Converts an integer as returned by a C kernel function to a [`Result`].
+    ///
+    /// If the integer is negative, an [`Err`] with an [`Error`] as given by [`Error::from_errno`]
+    /// is returned. This means the integer must be `>= -MAX_ERRNO`.
+    ///
+    /// Otherwise, it returns the original value as an unsigned integer.
+    ///
+    /// It is a bug to pass an out-of-range negative integer. `Err(EINVAL)` is returned
+    /// in such a case.
+    ///
+    /// # Examples
+    ///
+    /// This function may be used to easily perform early returns with the [`?`] operator
+    /// when working with C APIs within Rust abstractions:
+    ///
+    /// ```
+    /// # use kernel::error::ToResult;
+    /// # mod bindings {
+    /// #     #![expect(clippy::missing_safety_doc)]
+    /// #     use kernel::prelude::*;
+    /// #     pub(super) unsafe fn f1() -> c_int { 0 }
+    /// #     pub(super) unsafe fn f2() -> c_int { EINVAL.to_errno() }
+    /// # }
+    /// fn f() -> Result {
+    ///     // SAFETY: ...
+    ///     let _value = unsafe { bindings::f1() }.to_result()?;
+    ///
+    ///     // SAFETY: ...
+    ///     let _value = unsafe { bindings::f2() }.to_result()?;
+    ///
+    ///     // ...
+    ///
+    ///     Ok(())
+    /// }
+    /// # assert_eq!(f(), Err(EINVAL));
+    /// ```
+    ///
+    /// [`?`]: https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator
+    fn to_result(self) -> Result<Self::Unsigned>;
+}
+
+impl ToResult for i32 {
+    type Unsigned = u32;
+
+    fn to_result(self) -> Result<Self::Unsigned> {
+        if self < 0 {
+            Err(Error::from_errno(self))
+        } else {
+            Ok(self as u32)
+        }
+    }
+}
+
+impl ToResult for isize {
+    type Unsigned = usize;
+
+    fn to_result(self) -> Result<Self::Unsigned> {
+        // Try casting into `i32`.
+        let casted: crate::ffi::c_int = self.try_into().map_err(|_| code::EINVAL)?;
+
+        if casted < 0 {
+            Err(Error::from_errno(casted))
+        } else {
+            Ok(self as usize)
+        }
+    }
+}
+
 /// Converts an integer as returned by a C kernel function to a [`Result`].
 ///
 /// If the integer is negative, an [`Err`] with an [`Error`] as given by [`Error::from_errno`] is
-- 
2.51.0

