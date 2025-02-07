Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFDE1624D0
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Feb 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738938314; cv=none; b=H8nw1H7s+T79SZZF3ywqVuOUM75K+YG6tKCOH53xQ6hfUN2lsUkAcN/jtwN8KYU4v8wRPIcmUauIKyI5J3OmqKm9wIKNGD8HPdsJtvctejdOs7XU0ubzW+ULwpA7FygIyYOFXULFP5sHnCTDJt9k/1To0mDqSE1ITsDLZ9dOIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738938314; c=relaxed/simple;
	bh=8BLkP6oM0PyZMh8Aw2+/+YzjcztUWJhB7P4+VX9tBls=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oz4dXD3+CdgTGY7iUd0kHcXul73pOmz+caYN24H4RGZufsj2H4EWYlB3Dtuag8y9DqNSRu9gXxuEWcDeblqH81IBOKb+Lly7byEsM4Wl2PyLF0Y1r9JVQjUyWnQI5Hwij0ZOF357GhN/3uo1Vm9m38/9zl5V9KJ1zghZtDSOh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=hlsUZzme; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hlsUZzme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738938310; x=1739197510;
	bh=b9hUS5l0idSDZLGkhHmqyfMhDUxHxDa13O/mCvvsvo0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=hlsUZzmepTpZo5B4be0ymya9aXF7C1a0VzjvEHtWHHlLwiTIrdx+EddyhabY87RCS
	 rM/f44eLvookAkT8jdmfD3vIvHqL5TNIfvYwi0KU2CNT8khw/vwnKa+Hds2+3R1uoK
	 ehFPlOUmUD/8k7HSc+wct7/BEx/0MjjUgrdMQfrXgv1ww7PO6v3XxDGfVmFeJHT6Wv
	 Ko000fRf9Vy8CsVHHMyonTOzutQWmlIe8NsbKYA5pkY8SVIUlgYDzr4IPLFqs3BZxl
	 KZ5J7v6M84+qJdW+kt4JtqzNhbIp4kFT6yVp2iofsbFd13Q7RuRr9mLyPLk5vVRocx
	 JZSgOdkDWHWhg==
Date: Fri, 07 Feb 2025 14:25:07 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Borys Tyran <borys.tyran@protonmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, Borys Tyran <borys.tyran@protonmail.com>
Subject: [PATCH] rust: docs: clean lifetimes markup
Message-ID: <20250207142437.112435-1-borys.tyran@protonmail.com>
Feedback-ID: 9378373:user:proton
X-Pm-Message-ID: 364f444eae82e6d05417576f6ff0a836809bea16
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Clean lifetimes markup e.g:

- /// ... 'a ... -> /// ... `'a` ...

This will make lifetimes display as code span with Markdown and make it
more consistent with rest of the docs.

Closes: https://github.com/Rust-for-Linux/linux/issues/1138
Signed-off-by: Borys Tyran <borys.tyran@protonmail.com>
---
 rust/kernel/fs/file.rs   | 4 ++--
 rust/kernel/rbtree.rs    | 6 +++---
 rust/kernel/seq_file.rs  | 2 +-
 rust/kernel/sync/poll.rs | 4 ++--
 rust/kernel/types.rs     | 6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index e03dbe14d62a..ed57e0137cdb 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -267,7 +267,7 @@ pub fn fget(fd: u32) -> Result<ARef<LocalFile>, BadFdEr=
ror> {
     /// # Safety
     ///
     /// * The caller must ensure that `ptr` points at a valid file and tha=
t the file's refcount is
-    ///   positive for the duration of 'a.
+    ///   positive for the duration of `'a`.
     /// * The caller must ensure that if there is an active call to `fdget=
_pos` that did not take
     ///   the `f_pos_lock` mutex, then that call is on the current thread.
     #[inline]
@@ -341,7 +341,7 @@ impl File {
     /// # Safety
     ///
     /// * The caller must ensure that `ptr` points at a valid file and tha=
t the file's refcount is
-    ///   positive for the duration of 'a.
+    ///   positive for the duration of `'a`.
     /// * The caller must ensure that if there are active `fdget_pos` call=
s on this file, then they
     ///   took the `f_pos_lock` mutex.
     #[inline]
diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index ee2731dad72d..c869e3c36e88 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -886,7 +886,7 @@ fn get_neighbor_raw(&self, direction: Direction) -> Opt=
ion<NonNull<bindings::rb_
     /// # Safety
     ///
     /// - `node` must be a valid pointer to a node in an [`RBTree`].
-    /// - The caller has immutable access to `node` for the duration of 'b=
.
+    /// - The caller has immutable access to `node` for the duration of `'=
b`.
     unsafe fn to_key_value<'b>(node: NonNull<bindings::rb_node>) -> (&'b K=
, &'b V) {
         // SAFETY: the caller guarantees that `node` is a valid pointer in=
 an `RBTree`.
         let (k, v) =3D unsafe { Self::to_key_value_raw(node) };
@@ -897,7 +897,7 @@ unsafe fn to_key_value<'b>(node: NonNull<bindings::rb_n=
ode>) -> (&'b K, &'b V) {
     /// # Safety
     ///
     /// - `node` must be a valid pointer to a node in an [`RBTree`].
-    /// - The caller has mutable access to `node` for the duration of 'b.
+    /// - The caller has mutable access to `node` for the duration of `'b`=
.
     unsafe fn to_key_value_mut<'b>(node: NonNull<bindings::rb_node>) -> (&=
'b K, &'b mut V) {
         // SAFETY: the caller guarantees that `node` is a valid pointer in=
 an `RBTree`.
         let (k, v) =3D unsafe { Self::to_key_value_raw(node) };
@@ -908,7 +908,7 @@ unsafe fn to_key_value_mut<'b>(node: NonNull<bindings::=
rb_node>) -> (&'b K, &'b
     /// # Safety
     ///
     /// - `node` must be a valid pointer to a node in an [`RBTree`].
-    /// - The caller has immutable access to the key for the duration of '=
b.
+    /// - The caller has immutable access to the key for the duration of `=
'b`.
     unsafe fn to_key_value_raw<'b>(node: NonNull<bindings::rb_node>) -> (&=
'b K, *mut V) {
         // SAFETY: By the type invariant of `Self`, all non-null `rb_node`=
 pointers stored in `self`
         // point to the links field of `Node<K, V>` objects.
diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 04947c672979..4c03881a9eba 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -18,7 +18,7 @@ impl SeqFile {
     ///
     /// # Safety
     ///
-    /// The caller must ensure that for the duration of 'a the following i=
s satisfied:
+    /// The caller must ensure that for the duration of `'a` the following=
 is satisfied:
     /// * The pointer points at a valid `struct seq_file`.
     /// * The `struct seq_file` is not accessed from any other thread.
     pub unsafe fn from_raw<'a>(ptr: *mut bindings::seq_file) -> &'a SeqFil=
e {
diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
index d5f17153b424..e105477a3cb1 100644
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@ -43,11 +43,11 @@ impl PollTable {
     ///
     /// # Safety
     ///
-    /// The caller must ensure that for the duration of 'a, the pointer wi=
ll point at a valid poll
+    /// The caller must ensure that for the duration of `'a`, the pointer =
will point at a valid poll
     /// table (as defined in the type invariants).
     ///
     /// The caller must also ensure that the `poll_table` is only accessed=
 via the returned
-    /// reference for the duration of 'a.
+    /// reference for the duration of `'a`.
     pub unsafe fn from_ptr<'a>(ptr: *mut bindings::poll_table) -> &'a mut =
PollTable {
         // SAFETY: The safety requirements guarantee the validity of the d=
ereference, while the
         // `PollTable` type being transparent makes the cast ok.
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 2bbaab83b9d6..9cb573d39c34 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -77,7 +77,7 @@ unsafe fn try_from_foreign(ptr: *mut crate::ffi::c_void) =
-> Option<Self> {
     ///
     /// The provided pointer must have been returned by a previous call to=
 [`into_foreign`], and if
     /// the pointer is ever passed to [`from_foreign`], then that call mus=
t happen after the end of
-    /// the lifetime 'a.
+    /// the lifetime `'a`.
     ///
     /// [`into_foreign`]: Self::into_foreign
     /// [`from_foreign`]: Self::from_foreign
@@ -100,9 +100,9 @@ unsafe fn try_from_foreign(ptr: *mut crate::ffi::c_void=
) -> Option<Self> {
     ///
     /// The provided pointer must have been returned by a previous call to=
 [`into_foreign`], and if
     /// the pointer is ever passed to [`from_foreign`], then that call mus=
t happen after the end of
-    /// the lifetime 'a.
+    /// the lifetime `'a`.
     ///
-    /// The lifetime 'a must not overlap with the lifetime of any other ca=
ll to [`borrow`] or
+    /// The lifetime `'a` must not overlap with the lifetime of any other =
call to [`borrow`] or
     /// `borrow_mut` on the same object.
     ///
     /// [`into_foreign`]: Self::into_foreign

base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
--=20
2.48.1


