Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876FD2DB7B0;
	Fri,  6 Feb 2026 17:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770397865; cv=none; b=KbmgnaANnrohln9yvipc8XpZnNr89qiYCFy1CSiXqZnXOqvteblyBBM7A8XZnPr47W2DoE1uFrtCqeZqGtsmQcBvBC47BaBbTua/zSGXX6shW2YnkLq3FLRLW2NbA2vY8AAdKL+YxA+AhXsY9TdgTRV2eOM3VgUkTNYNWKf7VkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770397865; c=relaxed/simple;
	bh=gmjqrEbxxdGkv5kHhDNMaeFccnJBmW6pLzhmWhZ00TA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Nk3B0XDsJvfXZSxf+eKQEI7vyqZkCvhjfSZKiwdQW7ENQ4SR1Qo4IsXuRfLpDeEs0Q5UO9lIsirWYyyR5ycB9Y4mEwKLh08v0xDa60iUqyRUFZzqPXJTu9ROv7snnYagHw2nNHrazszYZKupIZdURbdhq7HnqY2hisSj/Fq9G1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlqrUTo3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlqrUTo3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB62C116C6;
	Fri,  6 Feb 2026 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770397865;
	bh=gmjqrEbxxdGkv5kHhDNMaeFccnJBmW6pLzhmWhZ00TA=;
	h=From:Date:Subject:To:Cc:From;
	b=AlqrUTo3T+8vluGBiUH+3ZlpxvmK4yJrZfClxiG5nF76FU9pdiUTtNo8sN8sL/cZn
	 khGI8o5nIGoAH9m5SUuFo123nNU/5m4+8F17aX0T0zPRTSowyXKORAVhWduyIhBHtr
	 HFNxNqa+V2ua8eZmsw9qptMg1K/CiqdCUJfTGLAKrPKOvcIsBVbzwLL2JKG8usp5+9
	 f60GkFVnAXS+xizClUuV4C5ircZ7ArSoOa8aHWXCzMBxyCvgMolb4qZd2OsCZTYTaR
	 tWksSF+nD+gy1PDuAwYUe0M0QuB9Um5/FNYSND+jHgV9bqXpcR2x/3yKz//XG98RCT
	 AVxcSjpBsT6eQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 18:10:45 +0100
Subject: [PATCH] rust: xarray: fix false positive lockdep warnings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-lockdep-fix-v1-1-13315951b836@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJQghmkC/x2MQQqAIBAAvyJ7bkGFLPpKdBBdaylKVogi+nvSc
 QZmHigkTAUG9YDQyYWPvYJpFITF7zMhx8pgtXXaaoeXF/E3bkdYI2VMfKHRyYTgempjBzXMQlX
 /03F63w/WrI+SZAAAAA==
X-Change-ID: 20260206-xarray-lockdep-fix-10f1cc68e5d7
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4891; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=gmjqrEbxxdGkv5kHhDNMaeFccnJBmW6pLzhmWhZ00TA=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphiCZ38K1dwIjclPlYU0B2jEId7rEhceqfCh+e
 IbZq4woWzaJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYYgmQAKCRDhuBo+eShj
 dymREACdM7J4fIHBRYyyjidK0s698BTjOYKXyq0LCyxRtBePwbyJHFNndhOpA8ieF05kcM0Iaab
 fCleQaZ6sPNrwN3AgMc0xkMGCqdeTox24oYSjxjvsVSIC2G22JP3yl8HlQ24M/Kgk+cNm6+BRDa
 WhpGvoZMykTGHIUlTuQkcGWVwW0OoQWNx0Ia945pwhfCPKp+G57DeM4c99tYuOIGNb38RDg6dOs
 4VAX2UrnVVQXEPUjSGt1Yq7UuZGHWknnp6zAEsv87L3oYwRwATJEbFn6kip1koh1YSQ5h01ahTP
 RJo76n/62P0K+3p/cGs5kls+qHOi6StdJdUYrxVBO0YSa9cAgKpAzJCJKoyTmt/toanLNVNm57z
 nvyD6Gx7bGRNwMSu4r/jltu41ATm1WxtXlxJ81dhaemYgW8Z//XbGK2ozDegL8ZkGfof/cZeDDc
 SX7BEBZuZ8bnVr42SQ0Evb1Izok2EhzCnBHXvns8M/Syzi55b2s4IzissllWC+Egr0Qnm4lCcLr
 bvDwOQ31gj8EzWjITd5dCRbzhi9ejwmOp/hcClqcW/i1c0zVP+igh+f1n7kvi8gz81eD9iIXisY
 Tg88zdXuo8QYORdcohIHDbdsOxn+WqvmOYkB3ACAGzZN+ZbvHrCYUCDd+Eit6EeFe7mEVDyFxWl
 4TiHGROVE3E0UPg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Replace the `xa_init_flags` helper with direct initialization of XArray
structures using `__spin_lock_init`. This allows each XArray to have
its own lock class key for lockdep, preventing false positive warnings
about lock ordering violations.

Add a `new_xarray!` macro that automatically generates a unique lock
class key for each XArray instantiation site. The macro accepts an
optional name parameter and uses the `optional_name!` and
`static_lock_class!` macros to generate appropriate names and lock
classes.

Update the `XArray::new` method signature to accept explicit name and
lock class key parameters. This enables proper lockdep tracking while
maintaining flexibility for advanced use cases.

Remove `rust_helper_xa_init_flags` as it is now dead code.

This was previously part of the series at [1]

Link: https://lore.kernel.org/r/20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org [1]
Fixes: 210b81578efbe ("rust: xarray: Add an abstraction for XArray")
Acked-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/xarray.c |  5 -----
 rust/kernel/xarray.rs | 43 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
index 60b299f11451d..644b8b35b1bee 100644
--- a/rust/helpers/xarray.c
+++ b/rust/helpers/xarray.c
@@ -7,11 +7,6 @@ int rust_helper_xa_err(void *entry)
 	return xa_err(entry);
 }
 
-void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
-{
-	return xa_init_flags(xa, flags);
-}
-
 int rust_helper_xa_trylock(struct xarray *xa)
 {
 	return xa_trylock(xa);
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index a49d6db288458..62a2b2ebfb0bf 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -8,11 +8,31 @@
     alloc, bindings, build_assert,
     error::{Error, Result},
     ffi::c_void,
+    str::CStr,
+    sync::LockClassKey,
     types::{ForeignOwnable, NotThreadSafe, Opaque},
 };
-use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
+use core::{
+    iter,
+    marker::PhantomData,
+    pin::Pin,
+    ptr::{null_mut, NonNull},
+};
 use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
 
+/// Creates a [`XArray`] initialiser with the given name and a newly-created lock class.
+///
+/// It uses the name if one is given, otherwise it generates one based on the file name and line
+/// number.
+#[macro_export]
+macro_rules! new_xarray {
+    ($kind:expr $(, $name:literal)? $(,)?) => {
+        $crate::xarray::XArray::new(
+            $kind, $crate::optional_name!($($name)?), $crate::static_lock_class!())
+    };
+}
+pub use new_xarray;
+
 /// An array which efficiently maps sparse integer indices to owned objects.
 ///
 /// This is similar to a [`crate::alloc::kvec::Vec<Option<T>>`], but more efficient when there are
@@ -27,9 +47,10 @@
 ///
 /// ```rust
 /// use kernel::alloc::KBox;
-/// use kernel::xarray::{AllocKind, XArray};
+/// use kernel::xarray::{new_xarray, AllocKind, XArray};
 ///
-/// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc1), GFP_KERNEL)?;
+/// let xa: Pin<KBox<XArray<KBox<u32>>>> =
+///     KBox::pin_init(new_xarray!(AllocKind::Alloc1), GFP_KERNEL)?;
 ///
 /// let dead = KBox::new(0xdead, GFP_KERNEL)?;
 /// let beef = KBox::new(0xbeef, GFP_KERNEL)?;
@@ -86,7 +107,11 @@ pub enum AllocKind {
 
 impl<T: ForeignOwnable> XArray<T> {
     /// Creates a new initializer for this type.
-    pub fn new(kind: AllocKind) -> impl PinInit<Self> {
+    pub fn new(
+        kind: AllocKind,
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+    ) -> impl PinInit<Self> {
         let flags = match kind {
             AllocKind::Alloc => bindings::XA_FLAGS_ALLOC,
             AllocKind::Alloc1 => bindings::XA_FLAGS_ALLOC1,
@@ -95,8 +120,14 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
             // SAFETY: `xa` is valid while the closure is called.
             //
             // INVARIANT: `xa` is initialized here to an empty, valid [`bindings::xarray`].
-            xa <- Opaque::ffi_init(|xa| unsafe {
-                bindings::xa_init_flags(xa, flags)
+            xa <- Opaque::ffi_init(|xa: *mut bindings::xarray| unsafe {
+                bindings::__spin_lock_init(
+                    &raw mut (*xa).xa_lock,
+                    name.as_ptr().cast(),
+                    key.as_ptr(),
+                );
+                (*xa).xa_flags = flags;
+                (*xa).xa_head = null_mut();
             }),
             _p: PhantomData,
         })

---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260206-xarray-lockdep-fix-10f1cc68e5d7

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


