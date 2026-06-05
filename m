Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9E4C0401;
	Fri,  5 Jun 2026 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650908; cv=none; b=d8vivr9M5q69fxXFHeXVhHRQvrOh/u8VW8ctEbinxByq1VM7ErX5gycMCoQKGfqIDE0CKyZ527uXZnQwP/eDJVyHfZAhURuyWKZYZ6i4zyg8PZOGAuiNMYqBU4TP9GX1fblU4cJoeIOa3zso8bBnkZ9G2jU8G23xjmjM+9U/GAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650908; c=relaxed/simple;
	bh=8tltnEr8XjVsKpx38NIEVAY7qKZtBaa3YgfWVbHMZfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r3MOFwEUabVJE2XoOjBVXKKSRzTMmia3lw+2ywxDLyYzyq6WQgkamLQm5jkyYWuyjaKsN9fKei8XpCuszOvDjx5jKoGLsY1MTAMd7KpUSAdOeT0knlP9taIS7HKNSk6GEx3OMVG8yECxi8k9nxerb565upcOuG/7jStlZ038OJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Efwxesgb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Efwxesgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E2D1F00893;
	Fri,  5 Jun 2026 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780650906;
	bh=JabTjfSHIifxe/Oj7hYsS3QmkNpCEJzGw1HwQUZZB7o=;
	h=From:Date:Subject:To:Cc;
	b=Efwxesgbwk5xPwduleM3/SYbyTYClldIRiiBz6Q/8ymR/WruR4zJI/8cxb463ewnU
	 r1u8rZ6UTGi3aihg5yTgo/nn6RPSqPjmEd+nunqmXGESwaE0iS3Wkp+jemMm10n2O5
	 hDx3pC2vDAOSQLk6eQuUC6Q7x1frw9vo7DpaGFJ4j1rNo2xsDtKHjOjryWMl3nuC/0
	 VMbI5DTAbVKe7OsF3lLiHpeeMV41soBR/Yq5BeSBgbHVChNABaTLrSRslPmlOJ3rdd
	 D9zmNDiGWZGYMxXHw7j3CRuO1ApXIhSk8gWGjDVC62gS9JeGSdCmXBm+/LZUNPFrh5
	 WsNZO0++65rKQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 11:14:29 +0200
Subject: [PATCH v2] rust: xarray: fix false positive lockdep warnings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHSTImoC/32NTQqDMBSEryJv3ZT8kNR21XsUF2ny1KAk8lJEk
 dy9qQcos/oG5psDMlLADI/mAMI15JBiBXlpwI02DsiCrwySS8MlN2yzRHZnc3KTx4X1YWOC98I
 506L2N6jDhbDWp/TVVR5D/iTaz49V/Nq/ulWwGqWEvmvxbpV5TkgR52uiAbpSyhcVpfq8tQAAA
 A==
X-Change-ID: 20260206-xarray-lockdep-fix-10f1cc68e5d7
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6290; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=8tltnEr8XjVsKpx38NIEVAY7qKZtBaa3YgfWVbHMZfQ=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIpN42HKuRNf62TL4NFNlXAIUvAQ+zUEHtVW89
 XJ4Fxm3p6aJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiKTeAAKCRD6UCkIqsW9
 0GiJEACAfAN7O3XfY1VdX3KZtDhdSsuWnnIhVsiafdTSfxfMWFtqsUex4q82EuQ8lq+R7bikSc7
 /naBvTj9zRR5PnVBnMdByZSHdOLsh/wKnYe7bAC3CQ/zJcdPVc7UuqM74unJNlQeMt4vvzYKxma
 10It7zmMMPDgfVpvBX8ONXewc5alC95LUHggGRpzKUJ8WFuJr+rbANsg2yH1UkP+5iynLLa6M0o
 HhtL60jtTJFANBMPY7s/aQz8pg1FZU1GrhUckmah12Ys33naPJaiqjqhfKfse3jZBLtw9t3bYDI
 jlbgfGCYvUKOtyk8fDSl4DS+RhZ0WZL0Dz/lhFs48AlTkoh/0fth8Lbs92GLbTLb07mFyGqcKyW
 iO5yHLWUrzCYVH+SMxUTwMSDK7nzKdtTUWde63fR2GaEtvTMKR7NP5V78v8ZInO1CZxfQwxzJEM
 CyzI0UYmLjy1BTTaUTNsm2gNYWP2GVoT3ASEGnt/FsvZqVXZdiXhXfDDQ4tJlm9CUB8ckTL2G8z
 GwhCLl2cEb1NNELD6WSbarxdIq+s/TMrfbb7A+nD3lacfKtjgqIOHCFPCO1LerHCewnJ2xzhbvh
 Bl5tqGvUJ+cjLZIip6WBQPb3OBjU2fFk6PW7V/E3yQKiW8p/G0HqqAUyA/5k2LU3loweNr4rF3U
 cPKHm8U8wdhS9DQ==
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
Acked-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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

To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 rust/helpers/xarray.c | 16 ++++++++++++++--
 rust/kernel/xarray.rs | 28 ++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
index 08979b304341..dce8b36492e6 100644
--- a/rust/helpers/xarray.c
+++ b/rust/helpers/xarray.c
@@ -7,9 +7,21 @@ __rust_helper int rust_helper_xa_err(void *entry)
 	return xa_err(entry);
 }
 
-__rust_helper void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
+/*
+ * `xa_init_flags()` expands `spin_lock_init()`, which generates one static
+ * `lock_class_key` per compilation unit. Going through a single Rust binding
+ * helper would make every Rust `XArray` instance share that one key, causing
+ * false-positive lock-ordering reports from lockdep. Re-register the
+ * spinlock's lockdep class with a key supplied by the caller so each Rust
+ * instantiation site can have its own.
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
index 46e5f43223fe..78c9fbe8f0aa 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -8,11 +8,26 @@
     alloc, bindings, build_assert,
     error::{Error, Result},
     ffi::c_void,
+    str::{CStr, CStrExt},
+    sync::LockClassKey,
     types::{ForeignOwnable, NotThreadSafe, Opaque},
 };
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
@@ -27,9 +42,10 @@
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
@@ -86,7 +102,11 @@ pub enum AllocKind {
 
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
@@ -96,7 +116,7 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
             //
             // INVARIANT: `xa` is initialized here to an empty, valid [`bindings::xarray`].
             xa <- Opaque::ffi_init(|xa| unsafe {
-                bindings::xa_init_flags(xa, flags)
+                bindings::xa_init_flags_with_key(xa, flags, name.as_char_ptr(), key.as_ptr())
             }),
             _p: PhantomData,
         })

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260206-xarray-lockdep-fix-10f1cc68e5d7

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


