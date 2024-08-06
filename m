Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C69A205E25
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722952783; cv=none; b=A0QQRHaCRgSltblLZGqhMxFkb7lgvtEoiodZfBobkrKWssf8BJARTFbWFuhsO5Xew7Rblf2LtWq0Mnk4DmSXoyWPtVmAO3/dn7Io2amiRFFzXffENjtKsg+uARIdt5W8t77zcH3h+7hijq6nudlw1fn8V86R8uoUqN03RGAbD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722952783; c=relaxed/simple;
	bh=rtZ/Cz0nmdTIH2ZRYlFWyz7pI2Orl32ZaW2okmlCPYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fqbAQeK3aIkmvOl/Ln1xTAlgeuic0u38aCCQAq8LkGneBPZ9GIe9rxLOadUXwZVy/Z98SPNYUR/RGKUsISj5Nq5cttZgxXBchIIq8z6li3LIxisJ+dn7sFTD93SgjIJLOsHYbZTyr8FA1gWn7dpBDSHsIccWs0ZsmauaFPMwLuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xgeC2B6E; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xgeC2B6E"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-426624f4ce3so4077105e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722952780; x=1723557580; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OPK5aP9P7TQo98Jo6W3QAlh4MbCdd1UBTLXW9ITb2R0=;
        b=xgeC2B6Es9XE4T1rMCXbgIWWvB/UvS0ECujZQvOLOGCDmDWJ5Xpcp8sMsqbn8HUQfE
         IeSOTkIjf9ObCHLGsJ8Q4ZM7p5Ybsz8WkDK2D1OGvdEzmoue3lHMqGLGbHI2qEK+7CbH
         YSkBneCRjoO/obkhiPt+cA8U3xYIcAhwbO6y4GosdfGQAyvHhJ4lxgdpSmsh7pbWygXT
         ItOnQh5bVN/GPFu3bfeDYjnKGuiqlrta70PB0KK4vMxhgBCHZXWmaAxcNuaCYalR4nmm
         PSgbwDqmDch8A7y8zBe+kNepfBIYhUAApTB/wNdn5OGniLnyzo9ECdTVjPX9NRnwn+AY
         2w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722952780; x=1723557580;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPK5aP9P7TQo98Jo6W3QAlh4MbCdd1UBTLXW9ITb2R0=;
        b=qUGUQ7dnbKEmo81AZ+o60noYgdzAJVyx69R4zgPI71r+mp0H/Sp2cLSG3EYacUTshJ
         0aG5Qe3CvL2kg7cg92742+l2kS4amKiMOrE2y8gDyUPtX3edHeoQ5/f5cFn600HhXx0L
         Af/sPKu8t6A2IcnDXhSgm1FraDJeSsnZCbi+t2eCl7eGPlO+0Oz64Dbi30QR1nze/IPo
         MhnUf6lsoGc5YBkBo+ilpk1Ja2cTCJx6+Qdx9/4dO/3WNuPdXRoP0O1g8O1FFlkDUZYL
         Gv9bMvGa0MRG3hkOZEztJb3FSihXARQzDQ+UMmQkOKUSJvY1FKF/s7R2a/53oIartiGF
         Vs8w==
X-Forwarded-Encrypted: i=1; AJvYcCUGdRv3X38frqlmFDM+YzGh0kJpvWvIOHmsc46Rrl15gO5Qel2CmuJ8YD8J314uareqN/pHpYNBDjnivD+q9x8eemKTVdAdsFQW2hrt5X4=
X-Gm-Message-State: AOJu0Yx/PUz8DZJblGblkgm4jgdX8NQz/st8DMxKV7q2+ZqDYc2IdFuX
	kVlP9AGlpjgZsDneKSFJOnzZtFvG9VuepiGyAVU1TrkD37M/cR/REgy0nlNXI8wy4EFS8vakqkH
	NoRJ6MZTVGABX2g==
X-Google-Smtp-Source: AGHT+IHV8qNwHdDlfHIWoDVm4mlg7YXGKo/s4jvnPCT3nJds1Vw7MEM9rwkMUaiAlAZh/jygn45OMFsoMIFT9Gc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:5108:b0:428:192f:c99e with SMTP
 id 5b1f17b1804b1-428f59a1389mr220005e9.4.1722952779639; Tue, 06 Aug 2024
 06:59:39 -0700 (PDT)
Date: Tue, 06 Aug 2024 13:58:57 +0000
In-Reply-To: <20240806-linked-list-v4-0-23efc510ec92@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806-linked-list-v4-0-23efc510ec92@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8482; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=rtZ/Cz0nmdTIH2ZRYlFWyz7pI2Orl32ZaW2okmlCPYA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmsiw5GcWX+66OuYPUTv78Aag/LHFwoDBvQ58sO
 qO4duJRgPOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrIsOQAKCRAEWL7uWMY5
 Rn7/D/48VM+WdeuVsx+cTPqhRwnpbdew/l3fa+6gNcqpNQScWs9H9Dkvi+f99caoq+tNaWXiHDD
 GOzoXd8ZqabQk5P98nEBwapAeRs+/1fzJHroBb7RtmfkJRsIiZhNpB6eVdkmrOiAVt8RRGc0/3x
 3QRZrLOZVGJRokoBzUHmO3KbNpze5MJMQAl4BQMJof5ReFA/JmOkbjuz+04f/t/sqoRv6iwbBTr
 937Hww9DNztnOKZlfEk07qMQhaEOrXpigAwIsOoc2VaZWZkE5aDo9ySZ3czGlE7iyCbDqCyt1G2
 b0lGJ1wE9FxtPxhRirn3wo1EwQsvzlvTofP05ysEVHftVqk5jiufJObUVzLTy3r/6LfvIQI5o11
 2LcLWzOi7960pP+7+Jg+zmOd9TBjDRVyztvPBG3+RYsi+yQBBrudd61AaIJvo1iaiZrq99QyTye
 FahV+AP6i+THdCPsc1vH4zl/mTMgx3cu2KMHkZ5/p0nHQaK+jF5PAEiE9PJOq57pJ/onCUTWg02
 LoLVB/PLe7USLZ12dCYw5EszmWv3aYQ2mTBGoZx3Sw/7Ld1VJZYH0H6i1YltTEY+fqNVVLox6Mo
 QdKVnXAn1Eb6e785ROQeIzo9QDpZ2r4Uos1RyoQY+aw2Zu3Ve+iR/YrfB9aB4g99zs27PlG3xHM JVJkLK0lzzZBmZQ==
X-Mailer: b4 0.13.0
Message-ID: <20240806-linked-list-v4-5-23efc510ec92@google.com>
Subject: [PATCH v4 05/10] rust: list: add macro for implementing ListItem
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, Coly Li <colyli@suse.de>, 
	Paolo Abeni <pabeni@redhat.com>, Pierre Gondois <pierre.gondois@arm.com>, 
	Ingo Molnar <mingo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="utf-8"

Adds a macro for safely implementing the ListItem trait. As part of the
implementation of the macro, we also provide a HasListLinks trait
similar to the workqueue's HasWorkItem trait.

The HasListLinks trait is only necessary if you are implementing
ListItem using the impl_list_item macro.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs                    |   3 +
 rust/kernel/list/impl_list_item_mod.rs | 143 +++++++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 074ae863ff5a..670d53989b8f 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -8,6 +8,9 @@
 use crate::types::Opaque;
 use core::ptr;
 
+mod impl_list_item_mod;
+pub use self::impl_list_item_mod::{impl_has_list_links, impl_list_item, HasListLinks};
+
 mod arc;
 pub use self::arc::{impl_list_arc_safe, AtomicTracker, ListArc, ListArcSafe, TryNewListArc};
 
diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
new file mode 100644
index 000000000000..30886e64b8ef
--- /dev/null
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Helpers for implementing list traits safely.
+
+use crate::list::ListLinks;
+
+/// Declares that this type has a `ListLinks<ID>` field at a fixed offset.
+///
+/// This trait is only used to help implement `ListItem` safely. If `ListItem` is implemented
+/// manually, then this trait is not needed. Use the [`impl_has_list_links!`] macro to implement
+/// this trait.
+///
+/// # Safety
+///
+/// All values of this type must have a `ListLinks<ID>` field at the given offset.
+///
+/// The implementation of `raw_get_list_links` must not be changed.
+pub unsafe trait HasListLinks<const ID: u64 = 0> {
+    /// The offset of the `ListLinks` field.
+    const OFFSET: usize;
+
+    /// Returns a pointer to the [`ListLinks<T, ID>`] field.
+    ///
+    /// # Safety
+    ///
+    /// The provided pointer must point at a valid struct of type `Self`.
+    ///
+    /// [`ListLinks<T, ID>`]: ListLinks
+    // We don't really need this method, but it's necessary for the implementation of
+    // `impl_has_list_links!` to be correct.
+    #[inline]
+    unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut ListLinks<ID> {
+        // SAFETY: The caller promises that the pointer is valid. The implementer promises that the
+        // `OFFSET` constant is correct.
+        unsafe { (ptr as *mut u8).add(Self::OFFSET) as *mut ListLinks<ID> }
+    }
+}
+
+/// Implements the [`HasListLinks`] trait for the given type.
+#[macro_export]
+macro_rules! impl_has_list_links {
+    ($(impl$(<$($implarg:ident),*>)?
+       HasListLinks$(<$id:tt>)?
+       for $self:ident $(<$($selfarg:ty),*>)?
+       { self$(.$field:ident)* }
+    )*) => {$(
+        // SAFETY: The implementation of `raw_get_list_links` only compiles if the field has the
+        // right type.
+        //
+        // The implementation of `raw_get_list_links` is not changed since the `addr_of_mut!` macro
+        // is equivalent to the pointer offset operation in the trait definition.
+        unsafe impl$(<$($implarg),*>)? $crate::list::HasListLinks$(<$id>)? for
+            $self $(<$($selfarg),*>)?
+        {
+            const OFFSET: usize = ::core::mem::offset_of!(Self, $($field).*) as usize;
+
+            #[inline]
+            unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$id>)? {
+                // SAFETY: The caller promises that the pointer is not dangling. We know that this
+                // expression doesn't follow any pointers, as the `offset_of!` invocation above
+                // would otherwise not compile.
+                unsafe { ::core::ptr::addr_of_mut!((*ptr)$(.$field)*) }
+            }
+        }
+    )*};
+}
+pub use impl_has_list_links;
+
+/// Implements the [`ListItem`] trait for the given type.
+///
+/// Requires that the type implements [`HasListLinks`]. Use the [`impl_has_list_links!`] macro to
+/// implement that trait.
+///
+/// [`ListItem`]: crate::list::ListItem
+#[macro_export]
+macro_rules! impl_list_item {
+    (
+        $(impl$({$($generics:tt)*})? ListItem<$num:tt> for $t:ty {
+            using ListLinks;
+        })*
+    ) => {$(
+        // SAFETY: See GUARANTEES comment on each method.
+        unsafe impl$(<$($generics)*>)? $crate::list::ListItem<$num> for $t {
+            // GUARANTEES:
+            // * This returns the same pointer as `prepare_to_insert` because `prepare_to_insert`
+            //   is implemented in terms of `view_links`.
+            // * By the type invariants of `ListLinks`, the `ListLinks` has two null pointers when
+            //   this value is not in a list.
+            unsafe fn view_links(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
+                // SAFETY: The caller guarantees that `me` points at a valid value of type `Self`.
+                unsafe {
+                    <Self as $crate::list::HasListLinks<$num>>::raw_get_list_links(me.cast_mut())
+                }
+            }
+
+            // GUARANTEES:
+            // * `me` originates from the most recent call to `prepare_to_insert`, which just added
+            //   `offset` to the pointer passed to `prepare_to_insert`. This method subtracts
+            //   `offset` from `me` so it returns the pointer originally passed to
+            //   `prepare_to_insert`.
+            // * The pointer remains valid until the next call to `post_remove` because the caller
+            //   of the most recent call to `prepare_to_insert` promised to retain ownership of the
+            //   `ListArc` containing `Self` until the next call to `post_remove`. The value cannot
+            //   be destroyed while a `ListArc` reference exists.
+            unsafe fn view_value(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
+                let offset = <Self as $crate::list::HasListLinks<$num>>::OFFSET;
+                // SAFETY: `me` originates from the most recent call to `prepare_to_insert`, so it
+                // points at the field at offset `offset` in a value of type `Self`. Thus,
+                // subtracting `offset` from `me` is still in-bounds of the allocation.
+                unsafe { (me as *const u8).sub(offset) as *const Self }
+            }
+
+            // GUARANTEES:
+            // This implementation of `ListItem` will not give out exclusive access to the same
+            // `ListLinks` several times because calls to `prepare_to_insert` and `post_remove`
+            // must alternate and exclusive access is given up when `post_remove` is called.
+            //
+            // Other invocations of `impl_list_item!` also cannot give out exclusive access to the
+            // same `ListLinks` because you can only implement `ListItem` once for each value of
+            // `ID`, and the `ListLinks` fields only work with the specified `ID`.
+            unsafe fn prepare_to_insert(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
+                // SAFETY: The caller promises that `me` points at a valid value.
+                unsafe { <Self as $crate::list::ListItem<$num>>::view_links(me) }
+            }
+
+            // GUARANTEES:
+            // * `me` originates from the most recent call to `prepare_to_insert`, which just added
+            //   `offset` to the pointer passed to `prepare_to_insert`. This method subtracts
+            //   `offset` from `me` so it returns the pointer originally passed to
+            //   `prepare_to_insert`.
+            unsafe fn post_remove(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
+                let offset = <Self as $crate::list::HasListLinks<$num>>::OFFSET;
+                // SAFETY: `me` originates from the most recent call to `prepare_to_insert`, so it
+                // points at the field at offset `offset` in a value of type `Self`. Thus,
+                // subtracting `offset` from `me` is still in-bounds of the allocation.
+                unsafe { (me as *const u8).sub(offset) as *const Self }
+            }
+        }
+    )*};
+}
+pub use impl_list_item;

-- 
2.46.0.rc2.264.g509ed76dc8-goog

