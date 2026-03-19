Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47A23EAB3;
	Thu, 19 Mar 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913232; cv=none; b=jWZx4B4iFi+n/pM75QsX6kLgZ5FCMKYuM20m0uqeIJjmT/wfr7VqyBbaoxFnV46wq1BW/8S5R79jqSYsiSrJ+zIOBHPjINQUpT4OPvVJCmNXKIGJ/2VANM0L1yXRwSIexaq0AZrwMRSq6qdHqBRqrmmj1fF4CJZogNuQYS6T9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913232; c=relaxed/simple;
	bh=YaF+OICTJ1mo/CQH/n7jQzhusMl3Va9prqroq274jCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKaf7Y0eO4omHJvY2yNFr/z0NbkAgCAxEb6GFO19pFUyfGSLe4V1uxm+Bn44rP8prmGSqKa6ksdNSiz2WiBWBgTJP3wV8dzIuA2iYSbFFAUBm70wkcvPtk/64/STe9JoQEKXLAdG5M8ug8PiJSal3xSYDPBZQ+zSwmBFYUxTlhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2GZCzT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2GZCzT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1AFC2BCB1;
	Thu, 19 Mar 2026 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913231;
	bh=YaF+OICTJ1mo/CQH/n7jQzhusMl3Va9prqroq274jCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s2GZCzT0vUUzksXqg1Nsihxf2auQ3HTeJCmk0e6IR3N5ObgAflQZSJtBOSSbI8+wz
	 j61+yw2cMH8fgu2KAwV223Qu+IjGIOTI6/27H9hcRFviftpNwUSZVUgWI08wriJO4x
	 jGZJsMdGQReFoRIRKMQMolgXTyoOfnAghQS39rzhYSwyrGx2tuK6Pguiiu9aHEZvz6
	 9WuOZbYKRBQ78o8c0Q6YUjZc2jjbtmilf8MdHEjGXT6Bnior6Wf2PqMDe9X99sHk70
	 gKDge4nQP0emShNLpJJSkXwdZoiIAy3yWtvm8xeTl1trPCqpK9GWiD8bzmYDPsaaX9
	 63ttsyWfNPgXw==
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
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Oleksandr Babak <alexanderbabak@proton.me>
Cc: Hamdan-Khan <hamdankhan212@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] rust: pin-init: implement ZeroableOption for NonZero* integer types
Date: Thu, 19 Mar 2026 10:35:27 +0100
Message-ID: <20260319093542.3756606-5-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319093542.3756606-1-lossin@kernel.org>
References: <20260319093542.3756606-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hamdan-Khan <hamdankhan212@gmail.com>

Add a macro for implementing `ZeroableOption` for `NonZero*` types.

`Option<NonZero*>` now automatically implements `Zeroable` trait  by
implementing `ZeroableOption` for `NonZero*` types, which serves as a
blanket impl.

Closes: https://github.com/Rust-for-Linux/pin-init/issues/95
Signed-off-by: Hamdan-Khan <hamdankhan212@gmail.com>
Link: https://github.com/Rust-for-Linux/pin-init/commit/74f772641cd9670848fa360f4ebfd20fdb40bf78
[ Fixed a typo in the commit message. - Benno ]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 7e79f75089df..d09e7fe97eae 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1615,13 +1615,6 @@ macro_rules! impl_zeroable {
     // SAFETY: `T: Zeroable` and `UnsafeCell` is `repr(transparent)`.
     {<T: ?Sized + Zeroable>} UnsafeCell<T>,
 
-    // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee:
-    // <https://doc.rust-lang.org/stable/std/option/index.html#representation>).
-    Option<NonZeroU8>, Option<NonZeroU16>, Option<NonZeroU32>, Option<NonZeroU64>,
-    Option<NonZeroU128>, Option<NonZeroUsize>,
-    Option<NonZeroI8>, Option<NonZeroI16>, Option<NonZeroI32>, Option<NonZeroI64>,
-    Option<NonZeroI128>, Option<NonZeroIsize>,
-
     // SAFETY: `null` pointer is valid.
     //
     // We cannot use `T: ?Sized`, since the VTABLE pointer part of fat pointers is not allowed to be
@@ -1681,6 +1674,20 @@ unsafe impl<$ret, $($rest),*> ZeroableOption for $($prefix)* fn($($rest),*) -> $
 
 impl_fn_zeroable_option!(["Rust", "C"] { A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U });
 
+macro_rules! impl_non_zero_int_zeroable_option {
+    ($($int:ty),* $(,)?) => {
+        // SAFETY: Safety comment written in the macro invocation.
+        $(unsafe impl ZeroableOption for $int {})*
+    };
+}
+
+impl_non_zero_int_zeroable_option! {
+    // SAFETY: All zeros is equivalent to `None` (option layout optimization guarantee:
+    // <https://doc.rust-lang.org/stable/std/option/index.html#representation>).
+    NonZeroU8, NonZeroU16, NonZeroU32, NonZeroU64, NonZeroU128, NonZeroUsize,
+    NonZeroI8, NonZeroI16, NonZeroI32, NonZeroI64, NonZeroI128, NonZeroIsize,
+}
+
 /// This trait allows creating an instance of `Self` which contains exactly one
 /// [structurally pinned value](https://doc.rust-lang.org/std/pin/index.html#projections-and-structural-pinning).
 ///
-- 
2.53.0

