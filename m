Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256B3B27C1;
	Thu, 18 Jun 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789220; cv=none; b=booUe7ZVeWwZfqC1L1xf/y0LWxEvltXacGz8DUNO6PSlwOCqHk3/P5Wn3MR5dRL25DHG+n8W7PlsE/nk5flqaUVbwPOj3GAGPeWp75FdeNvdYSaX0nIbhUgW8m8kxlDCGsWAgljHulr2zUDcCd8yI9Xtes7/oP7jW/pHZQB05ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789220; c=relaxed/simple;
	bh=iusRewpZ34TnQ5G2HLBSE7H0Lnu251CvtBRxV7HZGC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrRu66OJ4qTKLI67VBfqIErLp4h+jQ0+5s69EwaC0NIjvWxzAwjIGQdPEVpXaXQtL1hzY/SETs5/WE+QbNZ2iQKhwNUomYf1y8hzTq5XIv1bHrikUX5Gfht0MD5T+zKduK4Uz0sUFD2C2T3k4wYIf68fgS0WjPvDtKa+ocf/Uds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/YIjnoD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/YIjnoD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD96A1F000E9;
	Thu, 18 Jun 2026 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789219;
	bh=pDJyMWyNek1/CTCATK0JZj8GklloT+oL+OiV9mbnCoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W/YIjnoDJn9DZfacd5LPgniRpGXVFhZ9OYUQ2ivxpyHNYui3lN0BlVowyQ8/MiUh/
	 oQtZ+l2x7UFpadhXm0N6wahZ3r4vrjh4ra73GLhJONrfFth7SmrtjeVLZGT3BprSA3
	 i1fY6TwU+bAJ0uLZfI0r8Fa16vEspBWpKPOAHm2JY3yEE1VOrrNUJsRGfbHO8V0AYf
	 MI1TtNhzVw+cangHJ1SoYH+HwYfcCu+j9byI8s/Vzzvf+R373m+rgHr4m8BXUiA64t
	 uEhuwHiED8VUR2+lPnPg7NhZB2mKqkt+x8tVYt63BYus3L+vdhE80bHqa0t/bkQcGd
	 BZPEy5XYqIc/w==
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
Subject: [PATCH v3 1/4] rust: types: implement ForeignOwnable for ARef<T>
Date: Thu, 18 Jun 2026 15:26:24 +0200
Message-ID: <20260618132628.3811068-3-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618132628.3811068-2-phasta@kernel.org>
References: <20260618132628.3811068-2-phasta@kernel.org>
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

