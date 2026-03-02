Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F988426ECA;
	Mon,  2 Mar 2026 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469783; cv=none; b=lqv20y5UX9ShePTUwDbQUPg9MDc0fpAzPFUlWRHLuKyQLRFZiK6ebgKV8RQottAaxa8QCQMccmQcFjVVX/DNmBjz7HdJagdPONSpS9HqosqLSzdBBUU7LeA1JhqcPKkKQYagZ7VVf+PIyXXIs9pF6GqQDsvsHFlx3/mTGIwERVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469783; c=relaxed/simple;
	bh=Bat5/UbI97QmEVUYqRLQQyPdlPPgdVcziv2nwTLqUic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtEPKB8AiPHLerMc5yEr4hpuUwur2U7n4QyD54SwW+heAGoCv+bFcXGwFOs9aNx6PT7eb5c3gIBCRNsbBo9hp5Bokckg30SyIrd4jTQwaCfb8Ak88bjI61vXpR57LPjFD9VyVXA8XMkBKVW5xAXETJ/FwWulUkGEp8AdGElcdYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9vXuHSl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9vXuHSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADCEC19423;
	Mon,  2 Mar 2026 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469783;
	bh=Bat5/UbI97QmEVUYqRLQQyPdlPPgdVcziv2nwTLqUic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=f9vXuHSlSAwFe288BV6EACdlBZT4N/JzawOcGml1y6GfDmp39cvcUFf9PhzOTyCxO
	 JVF0SRK6GjdXZhmuVFZB78V/XZaND+HYDp57bucjV4rRkJotgqMAgY0NUoSR51LAsT
	 TKCNq3F7Nxadw45/iRJnsevPoGZxCzqF6iJcShgEOpv/3/zE+FK0hc7pmPK1yaTfAs
	 V8SDl9HRw6BV7FWg1Q+TUG6SGzYTogTKskk2npO+yTisvwTRDy+EkIL8xtyLszeiPg
	 cVbK4U6uGsTGiCDrI7JvFLLp4kl0MmriFyclzv5MOabQsHeD+JM9oAZlIk3Ho63g+V
	 oexxfbNlL/Oyw==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] rust: ptr: add `KnownSize` trait to support DST size info extraction
Date: Mon,  2 Mar 2026 16:42:34 +0000
Message-ID: <20260302164239.284084-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260302164239.284084-1-gary@kernel.org>
References: <20260302164239.284084-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Add a `KnownSize` trait which is used obtain a size from a raw pointer's
metadata. This makes it possible to obtain size information on a raw slice
pointer. This is similar to Rust `core::mem::size_of_val_raw` which is not
yet stable.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/ptr.rs | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..510cc7fe4961 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -20,6 +20,7 @@
 #![feature(generic_nonzero)]
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
+#![feature(slice_ptr_len)]
 //
 // Stable since Rust 1.80.0.
 #![feature(slice_flatten)]
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fe..cf980a103acf 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,7 +2,10 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::mem::align_of;
+use core::mem::{
+    align_of,
+    size_of, //
+};
 use core::num::NonZero;
 
 /// Type representing an alignment, which is always a power of two.
@@ -225,3 +228,25 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Trait to represent compile-time known size information.
+///
+/// This is a generalization of what [`size_of`] which works for dynamically sized types.
+pub trait KnownSize {
+    /// Get the size of an object of this type in bytes, with the metadata of the given pointer.
+    fn size(p: *const Self) -> usize;
+}
+
+impl<T> KnownSize for T {
+    #[inline(always)]
+    fn size(_: *const Self) -> usize {
+        size_of::<T>()
+    }
+}
+
+impl<T> KnownSize for [T] {
+    #[inline(always)]
+    fn size(p: *const Self) -> usize {
+        p.len() * size_of::<T>()
+    }
+}
-- 
2.51.2

