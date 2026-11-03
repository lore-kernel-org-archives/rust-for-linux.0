Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722602;
	b=ssdQGd3BabJD+ZbMC+mmF0rRYZzHVI/x5NahS+N1ZwXmJDogGXsdQNm3IdDjKo0STFMz
	 vUoEE+RniTWkNyiUwie7reDsZUF1OSybAhMLnO6nkyg52ZPDKSPtaUKTS/7x5TbKgw5h5
	 493c/kQUpCOlvjj7t1Ea8OMjqPzYP0O8SMWCfgzHbTCGjcQJT6STlSdgySMllJYvYU2gT
	 ivNgJDsHW/fORIgmkHYG9xkMW8z4QE+L30Pq71xfj0044TRr02tU5zfQnBOTVIUsFftur
	 JFDncQIYvz714OzzMgO//Jf9AY/M1dUm25fHtK2TIwwySgQS+vxrXUlhftls5ETnq0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722602;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BSURkJWn0WOY0anZbHcDJ2sPzRJFppuAJJqratEJAWY=;
	b=V48a2c1EoQVZYWhvvm8X1QzL03PJKEZP6FB4LG7zJExb8RPWtRcb7/guzyvRS2y40uPP
	 sJeNWGb5Lp1+6iEginrbmCM99kw/77JiqGI5/Ta7d2V+OGYHPqW1C1L/+UYDc4EP0Wlns
	 5enU4bbZDZJgpXhf9wFGaEYzJk9RTUs+rxvlkwqowMDja+jjSetoH24yCRDTH3ALOEpcN
	 ZMsBOI+L0UTHYrPJQq3c2ml2vVbJZViVMgCS1/jPjenH/F3cTvhtmI2xBbUNQTnQ6ELki
	 gYmKp6xRAtOOWTb1icXy1KkgaihJNXcWntviDrqoGgHiqL48z3CqtZuQFt+W9xuzHGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MOkTSrTI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B254F606D804;
	Tue,  3 Nov 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MOkTSrTI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EDB1F000C1;
	Tue,  3 Nov 2026 16:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722601;
	bh=BSURkJWn0WOY0anZbHcDJ2sPzRJFppuAJJqratEJAWY=;
	h=From:Date:Subject:To:Cc;
	b=MOkTSrTIeM+eTu168yZYd31L2CQqTHYREHA0mjZ2RTauoPD132dnddGqfjNGf6jqk
	 n0T4hVGKXBmHUV1dcw2NXZj7p5t1Js8Juqqapz4epAZ6PO6UDhDtLJovUyg2jKYUN3
	 DpXPNJqeySMwq2EosO9byTSUHxZo3MUTCtZiEbq8XhGDR/2kcMzN9ZGmOHiobowVjT
	 aasPoMQdrX8tIwaGL4FSjeEuCpoUiD5+PTNP5kaMLB9/ENUkzrHfIZ4SM34WgRB1cB
	 d2zZobkPo69q6KfKWVDPPyE/7wKfYHbwIkCi3xaAU22GFz6aqnQ5QgtqjtoDxwF0Qi
	 XwoCR8Xg9I7cw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 03 Nov 2026 17:16:28 +0100
Subject: [PATCH v3] rust: xarray: fix false positive lockdep warnings
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-xarray-lockdep-fix-v3-1-e188bec82003@kernel.org>
X-B4-Tracking: v=1; b=H4sIANsI6moC/33NTQqDMBAF4KuUWTclPyTVrnqP0kWMowbFyKQER
 bx7o5tSKGVW78H7ZoWI5DHC7bQCYfLRhzEHdT6B6+zYIvN1ziC5NFxyw2ZLZBc2BNfXOLHGz0z
 wRjhnCtT1FfJwIsz1gT6eOXc+vgItx48k9vYvlwTLp5TQpRZVocy9RxpxuARqYfeS/BiG65+Gz
 IbUVmte2gpRfRnbtr0B/8uH3vkAAAA=
X-Change-ID: 20260206-xarray-lockdep-fix-10f1cc68e5d7
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6528; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=zW8CTkyLa5/Xfhlku1cMkbmOKZnpkUiI+klPyk+NhXo=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq6gjdBsVxhiVB6uBDIGlVa6URlAS8YvNrGesx3
 JMDoCqkW0KJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauoI3QAKCRD6UCkIqsW9
 0FDyD/9ROvfEc0GytNOQPMYsfGyCck2Ua1VwykH6yuTHUIaj0O/N7ga1X7iUPOQnvNDKluqQhmA
 YmI6+SlcH7u/mdQXEr4y/7jOvZZ6mg9LWMWrOz2ciMqiK2XAcEVc9DhnKZLbvPUYGQZVhMo2YB8
 BxgLqjR6y6u3UIf0trVaCG4KY86z1fywyk+wXWbbnEnEOY6IPaKhZ3I1qhN6nF7HSWdn6redSdd
 cQBrdn63U4QNJihQ261c6naXbk6Fwf1pSYSP1yNMeCjyUJVJ5RZ0pHdoPFG1L7luq0U44jfHHix
 RCmMxmEoOMc5Nbsgcgv4nEOndZTdVuwGDJpTiNOfCfhA0JUkLgxaGt71i8si+fwcgtCS/G3uBhZ
 l3/Xh5qF4ob4F4PRpf4yeNsOmLPTBWJVJsfBg+NMNErrKnFpOauPuDlm+cW2EP4EqDlUJ7VBGyl
 YEUQJ/vSW6gDcDu1APt7VPbRa/ptgPeGaI3kSd2Bwc19JdHv6AKkdajLos8BdXzSwzmY5NyYiNT
 Hav8zziTjx7d97kXZIGYmy01J18MLdfLKXsqz0QyZREVGS+fTjDMZqWVPYZ/U9fmMrBsBxHpDXK
 ohsvDf0VSYxVhbX22c53AuqBk6qlTyoBAUTF4sggArxmgqioEBSjeRzTPkPEah9N0zyq9DIeni3
 DmRyCcTqbSg2wSw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`xa_init_flags()` is a static inline that expands `spin_lock_init()`,
which generates a single static `lock_class_key` per compilation unit.
When used through the Rust binding helper, every Rust `XArray`
instance ends up sharing that single key. Lockdep then sees concurrent
locking of distinct Rust `XArray`s as recursive locking on the same
class and emits false-positive lock-ordering reports.

Add a custom helper `xa_init_flags_with_key()` that mirrors
`xa_init_flags()` but takes an explicit name and `struct
lock_class_key` from the caller. Update `XArray::new` to take a name
and a `LockClassKey`, and add a `new_xarray!` macro that uses
`optional_name!` and `static_lock_class!` to generate a unique class
per instantiation site.

Remove the now unused `rust_helper_xa_init_flags`.

This was previously part of the series at [1].

Link: https://lore.kernel.org/r/20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org [1]
Fixes: 210b81578efbe ("rust: xarray: Add an abstraction for XArray")
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
This now mirrors `init_work_with_key()` in `rust/helpers/workqueue.c`,
which takes a name and a `struct lock_class_key` from the caller for
exactly the same reason: the C initializer it replaces produces one static
lock class per call site, so routing every Rust caller through a single
helper would collapse them all onto one class.

Changes in v3:
- Rebase on v7.4-rc1.
- Reword the comment on `xa_init_flags_with_key()` to describe the helper
  for its caller rather than its implementation (Tamir).
- Drop the unnecessary type ascription in the `XArray` example (Tamir).
- Link to v2: https://msgid.link/20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org

Changes in v2:
- Use a C helper `xa_init_flags_with_key()` that calls
  `lockdep_set_class_and_name()` to install the caller-supplied key,
  rather than calling `__spin_lock_init()` from Rust. Mirrors the
  `init_work_with_key()` pattern in `rust/helpers/workqueue.c`
  (suggested by Alice Ryhl, seconded by Tamir Duberstein).
- Add `Suggested-by: Alice Ryhl <aliceryhl@google.com>`.
- Correct Tamir's `Acked-by:` email to `tamird@kernel.org`.
- Rebase on v7.1-rc2.
- Link to v1: https://msgid.link/20260206-xarray-lockdep-fix-v1-1-13315951b836@kernel.org
---
 rust/helpers/xarray.c | 17 +++++++++++++++--
 rust/kernel/xarray.rs | 27 +++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
index 08979b304341..f6cc05b26cc0 100644
--- a/rust/helpers/xarray.c
+++ b/rust/helpers/xarray.c
@@ -7,9 +7,22 @@ __rust_helper int rust_helper_xa_err(void *entry)
 	return xa_err(entry);
 }
 
-__rust_helper void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
+/*
+ * Initialize `xa` with `flags` and register its internal spinlock with the
+ * caller-supplied lockdep class `key` and name `name`, both of which must
+ * live for the lifetime of `xa`.
+ *
+ * `xa_init_flags()` cannot be used instead: it expands `spin_lock_init()`,
+ * which yields one static lockdep class per compilation unit, so every
+ * caller reaching it through a Rust helper would share a single class.
+ */
+__rust_helper void rust_helper_xa_init_flags_with_key(struct xarray *xa,
+						      gfp_t flags,
+						      const char *name,
+						      struct lock_class_key *key)
 {
-	return xa_init_flags(xa, flags);
+	xa_init_flags(xa, flags);
+	lockdep_set_class_and_name(&xa->xa_lock, key, name);
 }
 
 __rust_helper int rust_helper_xa_trylock(struct xarray *xa)
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 987c9c0c2198..84e7fb051612 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -10,6 +10,8 @@
     build_assert::build_assert,
     error::{Error, Result},
     ffi::c_void,
+    str::{CStr, CStrExt},
+    sync::LockClassKey,
     types::{
         ForeignOwnable,
         NotThreadSafe,
@@ -19,6 +21,19 @@
 use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
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
@@ -33,9 +48,9 @@
 ///
 /// ```rust
 /// use kernel::alloc::KBox;
-/// use kernel::xarray::{AllocKind, XArray};
+/// use kernel::xarray::{new_xarray, AllocKind, XArray};
 ///
-/// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc1), GFP_KERNEL)?;
+/// let xa = KBox::pin_init(new_xarray!(AllocKind::Alloc1), GFP_KERNEL)?;
 ///
 /// let dead = KBox::new(0xdead, GFP_KERNEL)?;
 /// let beef = KBox::new(0xbeef, GFP_KERNEL)?;
@@ -92,7 +107,11 @@ pub enum AllocKind {
 
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
@@ -102,7 +121,7 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
             //
             // INVARIANT: `xa` is initialized here to an empty, valid [`bindings::xarray`].
             xa <- Opaque::ffi_init(|xa| unsafe {
-                bindings::xa_init_flags(xa, flags)
+                bindings::xa_init_flags_with_key(xa, flags, name.as_char_ptr(), key.as_ptr())
             }),
             _p: PhantomData,
         })

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260206-xarray-lockdep-fix-10f1cc68e5d7

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


