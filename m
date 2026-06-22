Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D03B52E4;
	Mon, 22 Jun 2026 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136634; cv=none; b=f4tk7nrA61OTvn04fmnI++mguyqJX85pIxxHA57TZUhfNL8tRFQAh2CfDa3qeWdi6GdgQ/GEH4wO7iyWn8FpPsqc93VkWvYtNFQpFgd4jy/wcBrhX0r9ZNJFgMotbY12733cjhe5uy7AiRA3lNM1a59O3OZ0hQOBia7gJgKhpww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136634; c=relaxed/simple;
	bh=+yVDX2d0DsnukeHuDMtZAXNDfXzQI/JTMuup1mxWUgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3SfJJv9dKyGW86crHQ7zl4P70+ZBwLncC3DgOgamXmO1hrzUW2IN4cHf2oUu8CJab90fuJGn9DMf17I5P4ZgLNaRYNauZUav9ui5O6pU97OJ36xrN/mzxeO/3wPcDVZUA6IPlbMubqFXyQNvEsDmYIxKRrb/G5S1BmeEkZ7iGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRZo6/Q2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRZo6/Q2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7481F00A3A;
	Mon, 22 Jun 2026 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782136633;
	bh=EBsxttHC2/DLBodLweCzlXw/YoBMkYiSD7bRJRJM+hA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fRZo6/Q2a+793MV9qHOPWZrKsODm55wGLV2V9nxP3tfY2O7lTaqvSyztdcQt6o8OM
	 tiBjPkUwkqrxWjOAAcGnZVL2H4ORd/FWCD9VqmUiaiVsiJxY1zm4WVQ2t7YHu5tDyD
	 PRuv5LXNM+J6eX87bYSkN+oAjMTeaktQyrl9Qda/AHqzFaw2aPm4mqf41LMu5qIxsR
	 wT8FGw1GWRJoVwylWX8Og5S6WAHIJADr6LRXB8nknj6alSR6E01CNDaNQYH3ORTvnl
	 QiCm5f1RziVNoWKFNGRAwbvoHO5WJQfxxindRZXW8HrtO43Q2LBdG1JZhJhH26KGLc
	 3cbVQbx48UdfQ==
From: Philipp Stanner <phasta@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Matthew Maurer <mmaurer@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Burak Emir <bqe@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Mirko Adzic <adzicmirko97@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 1/5] rust: types: implement ForeignOwnable for ARef<T>
Date: Mon, 22 Jun 2026 15:56:49 +0200
Message-ID: <20260622135654.334961-3-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622135654.334961-2-phasta@kernel.org>
References: <20260622135654.334961-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Danilo Krummrich <dakr@kernel.org>

Implement ForeignOwnable for ARef<T>, making it possible for C code to
own an ARef<T>.

Since ARef represents shared ownership, BorrowedMut is &T rather than
&mut T, matching the semantics of the underlying reference-counted type.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/aref.rs | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 9989f56d0605..82907383c44b 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -17,6 +17,10 @@
 //! [`Arc`]: crate::sync::Arc
 //! [`Arc<T>`]: crate::sync::Arc
 
+use crate::{
+    prelude::*,
+    types::ForeignOwnable, //
+};
 use core::{marker::PhantomData, mem::ManuallyDrop, ops::Deref, ptr::NonNull};
 
 /// Types that are _always_ reference counted.
@@ -183,6 +187,41 @@ fn eq(&self, other: &ARef<U>) -> bool {
 }
 impl<T: AlwaysRefCounted + Eq> Eq for ARef<T> {}
 
+// SAFETY: `into_foreign` returns a pointer from `NonNull::as_ptr`, so it's non-null. The
+// `ARef` invariant guarantees that `ptr` points to a valid `T`, so it's aligned to `T`.
+unsafe impl<T: AlwaysRefCounted + 'static> ForeignOwnable for ARef<T> {
+    const FOREIGN_ALIGN: usize = core::mem::align_of::<T>();
+
+    type Borrowed<'a> = &'a T;
+    type BorrowedMut<'a> = &'a T;
+
+    fn into_foreign(self) -> *mut c_void {
+        ARef::into_raw(self).as_ptr().cast()
+    }
+
+    unsafe fn from_foreign(ptr: *mut c_void) -> Self {
+        // SAFETY: The safety requirements of this function ensure that `ptr` comes from a previous
+        // call to `Self::into_foreign`.
+        let ptr = unsafe { NonNull::new_unchecked(ptr.cast()) };
+
+        // SAFETY: `ptr` came from `into_foreign`, which consumed an `ARef` without decrementing
+        // the refcount, so we can transfer the ownership to the new `ARef`.
+        unsafe { ARef::from_raw(ptr) }
+    }
+
+    unsafe fn borrow<'a>(ptr: *mut c_void) -> &'a T {
+        // SAFETY: The safety requirements of this method ensure that the object remains alive and
+        // immutable for the duration of 'a.
+        unsafe { &*ptr.cast() }
+    }
+
+    unsafe fn borrow_mut<'a>(ptr: *mut c_void) -> &'a T {
+        // SAFETY: The safety requirements for `borrow_mut` are a superset of the safety
+        // requirements for `borrow`.
+        unsafe { <Self as ForeignOwnable>::borrow(ptr) }
+    }
+}
+
 impl<T, U> PartialEq<&'_ U> for ARef<T>
 where
     T: AlwaysRefCounted + PartialEq<U>,
-- 
2.54.0

