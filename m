Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A0713D531
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723622773; cv=none; b=Gw3zBvYqrUt0sA6fSBEjNO3RJUVp0CCta62gy1aSL3PtS5MiHaJK/p4Q8JB4nBtBO8VTXn9ZYoMQdWz9XJ27U8gcG20FX57XBAEBVnyIdu+JGnZvm7iw1ieasTe46ODe/ICFUZm0/NHKbW8RPBOUu5Y55g37xtcSl0I//8Ov7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723622773; c=relaxed/simple;
	bh=qdxse/zQeBUwN7La6igBJ4pZmUKkwuTv3eH6GZBk19Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ptuYfdKMH9OkQvjdtOhzzjpMEJqTJEQ5xHcwjSArnx+tfemPmorXW7pWCKlSkgqeFrx3nc9rP+IIl/vtNZz4+SYk2dZJ6I+oCLRxa8wwc5fTyaiqJs9mSXkwhC5GnfakGLP4eYPXNxfB5l+GYVLg4Fj+5HE49fOVVBCH2h8FTNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NqaUpLIl; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NqaUpLIl"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-36873a449dfso360990f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 01:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723622769; x=1724227569; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSEMDEujkX2rv1p5gjNHkGYbhQ0hRO1KR3+H5BUTJx0=;
        b=NqaUpLIl5pbzfMLF4U0DsgRtdygLIRQFAG2a4RLXnkmpj9wpfY9Lr7GCeGIpBMy3Ou
         I6z3X4phhv6cZppXCtmlruZjdwD8mFh2nalrJ0syUWcMjwfuDzv9i3Xz9ma6EnIUX4J9
         5P0/oIILWyt3ZTLYVgkZbvtQWghRKLpkwhy6bm1grQEto1lZ5QksEUZbH+QvQC/2lo17
         Mn8LLwcQclv+ireF4w7NyKRJFDqY8X+xbhZRItOMyuIGzJY63aF5GInwhfKOFaCoWV8y
         q9rh7C8+Q7WHpBJmlfw4r5RaXsiyzB6WX+3L2hWoC6xm05gbM314XfngfMzXnpbHQdWx
         sVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723622769; x=1724227569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSEMDEujkX2rv1p5gjNHkGYbhQ0hRO1KR3+H5BUTJx0=;
        b=l9gIMYKFpeeoZsF77cf3ySgikYcuvOIn7v6lW/pLM0zQ6lc0CuspX+OWOa8s+aECgY
         RWUji9QFmhTjtblbrhKnEqmc7JUqWXL/wdpGsDncsCkNnGGKfdCLIb22QUDENof5EClT
         nx24fRD864tk4ZyJVjx0jusjYoLIifZjqaYnYdVyRW82OaPf+jNcdjUARPH0wbvlr/G4
         E6zFymapOpsFFQLlpaMzWmcTdQd+VVK6RV7cBji9LqfuXg7AUUHEdhj94jZtywqR1qzs
         DJfEIfjJTLKh6Cy2CDYD7cqvIouYdPl3Wa1a8cddiDb7NuY6DxEN73ZxajBNuv7Il5Z5
         WuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq2AklqAXw8gyBDFoiAH8SalbOLfFEjRFvntrUG+RWOJG/BRL70V1jqUiWGuUHlJh3EfrqEXd6dpscakD4RvednNZoBNyJ3xlI66naGPk=
X-Gm-Message-State: AOJu0Yw7veSUBDuMjm5j1E0l/hdtyLUbjiyv/fEofkxceIuZxe5BUgNe
	Mw3UyS6h0FsPQG+4mCA1XyibIKK3jVedf7dogPDmCHS2NuVSzNa0hcpHTlkS9CwJzSYgU2wzJ/a
	EeBRYx+MM+3oOIA==
X-Google-Smtp-Source: AGHT+IHw1++eC7xuLFCD4Ims9QPf6ZV/bQLzTGyuizcstn5dXz3b7oKHTFwMTFwF7RmkyElXV16fxZPPCv7x+x4=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a5d:680d:0:b0:360:7198:6ca0 with SMTP id
 ffacd0b85a97d-371774f636emr11365f8f.2.1723622769130; Wed, 14 Aug 2024
 01:06:09 -0700 (PDT)
Date: Wed, 14 Aug 2024 08:05:24 +0000
In-Reply-To: <20240814-linked-list-v5-0-f5f5e8075da0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240814-linked-list-v5-0-f5f5e8075da0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8517; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qdxse/zQeBUwN7La6igBJ4pZmUKkwuTv3eH6GZBk19Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmvGVeb+JBrhpDAp3hv8qGZdOwgc6cgA2tH/7pl
 o6RSRCer/6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrxlXgAKCRAEWL7uWMY5
 RmBoD/0UWq88uX47dTn9LvTUT/ggWRhQ7qX92urGpJmyP4GKksYgKAkyWLeltyR801HaDpWac8G
 5B6N4NODJksRz1dZgKub9SLbvjpiHrdrSfG/aVOb3zoZBiQywL4NanoTfoau7BzdzEH71yPWlOp
 SQkjS7AzU5NmqXJiWmKpcnt2uo4DB7Ebi/ygi1KOVdZYgJkV/Bi1j+LKGj+jBTipYHncB65kUjM
 BLmZvlbuqgX4HkcNv8NFzXRqT2izBOAKfUYt28wsS+vf2/i70Hhe6Nyv84KV27F2YrCuEn4n5Ui
 f9sgrSoZ0+ZoNyN4TCzScVkVk6HkE/8qZvys5Z+AWewX03G4eg9gcqmKVMRoQMpxNKj81mgKyzM
 Jwt0qLEzzvfbngiJNIMgRuLXHkaNFvdE8UCn9hd/Jtq1meH9qdvzOc2YMAHUcKqebighKlC++A0
 DVg9y+FiiCx0u6BV4uEGuTdHInEzIAwH3WDOsYxuR2M9Sjj3sjIp1XCOfvaZONS3HA4oqrhZO+W
 4SdHRPdESF7XCOBboaAF8xKRtaCJmsri/rgvm+mxA7WEB1ZWWk67M1J5BdFvcrRsjqqn4i7EL2E
 4mKm4C9xugUtxKBG2VSYZorxKSMVrKK8iXjVXdV1VXke/2YteUZ9usE+EmXtDWyg7bMAxTl5XUo WaTplHoANHjzOVg==
X-Mailer: b4 0.13.0
Message-ID: <20240814-linked-list-v5-5-f5f5e8075da0@google.com>
Subject: [PATCH v5 05/10] rust: list: add macro for implementing ListItem
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

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
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
index 000000000000..1bcb14774aeb
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
+/// The behavior of `raw_get_list_links` must not be changed.
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
+        // The behavior of `raw_get_list_links` is not changed since the `addr_of_mut!` macro is
+        // equivalent to the pointer offset operation in the trait definition.
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
2.46.0.76.ge559c4bf1a-goog

