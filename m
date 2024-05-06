Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F34143C74
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714989241; cv=none; b=bEg9TZx7lqTOHnZHMPH8kXpQ2VtvcI90u/rvVxvlaOqcsb3XFLEWVg1cMT3zzHhJFYeJqdFV7mpnmZYXIdzDGR6ndytt5Jw8xQRzm0b0N/KfMf5c+/jsflRY+yqQwY6E5sG0m1QeLv/q9XXsAkYXa2S9UEHzvSWuC7BxVU2vJBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714989241; c=relaxed/simple;
	bh=AQhfweFhnbUEdO8w4wLgrf3c6x33991wxbRZ8aSauR0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l2aWBu+LNV8YOi1M7Xo77jwUkZt2tct2fZcH6var8R6KIMHRTSryAB3wI05NN4wpD+hPS9P6r1fdsWGOW3Jw3Ce4EgRcyKMTy0OJmCX5TjM751VKpmR6PWL6rgJTWhNhGpConaQEbnu5eCnRVRus/u6dlRsze1lmfB07LNSQ+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PyL+KxPI; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PyL+KxPI"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-2e0b27cc8adso14906191fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714989238; x=1715594038; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HDgKyqrf1g6QA5xH2PIc9zQKl9yIACvI9lzt3McvSs=;
        b=PyL+KxPIMQuvxhVyf4+G7MAxJwbI6mDXKNBzTRjquudc5+Db3mUIrNPqRB6NTuPdT1
         JJwsiyeRMW81rZHs2A4tafeyQEpBz9lj4AQ9zy9m7Q+LQG/UkBl5M6Cfd9qID4iv1DX6
         LY8iU5GfxCXMTiAXfoM9Vk1LlkgVO6cAF4MiqPJS6VVHXa51CduY+SW5LohS7KUUDKtt
         K11QigP2CrOYemHHryCulGspLAnJ3mvEnYMDWXVS001TpMEXkMNkfRb/IIXSntwXX3VC
         Ry2t8KXpxG6ZLbITx8IlU6UTgEIB6EMMEy5XWOFecq6THoDNXZ9+lqsAuspvIWDCYBlm
         HMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989238; x=1715594038;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HDgKyqrf1g6QA5xH2PIc9zQKl9yIACvI9lzt3McvSs=;
        b=BfIiSCWhX4pXe0Fk37+8AXClxRFXOhepYLt1EaEG52nxT3NSOoYBz7FBK5M0EJHqH2
         3Tm/9AasDhk8eYDnHqV5S2HwFdwpbV5q6ICIR4ikE+tMKHlCI/KFrB9qohnK1RxpTqx7
         J7qH2iKWL+TGfoLXvkAL6VSDF3xeDjFG06xV9DO6gAMtH062r9iazXU6iB8jxniwo78A
         BPcATCWB+o64Qo5rnMslxMutugoflC/KmSWh72Ev09OeJfWrOxwNGpsW5QGvaQNXzgOL
         VQR0Z11SVc4gRz30qAkbw6OjdfPSEkS4ytuj1SrWwHQGGyE6bWYg0sjw7Z61IaZxycgI
         dIkA==
X-Forwarded-Encrypted: i=1; AJvYcCV8ri937hHx4x5dLsXesqnxY6m0v3ESU5oL6sLXB3bx46lj1mkMjoWj5UnYnoNmAp1/K16GjIAogonXuc3ogFiRvIvQCJ4O0rpCusjjTLk=
X-Gm-Message-State: AOJu0Yy47N8mqovEazkR0Btc2m5CCxdrKJIMzv9hWIXlbzlx3b3x+8xN
	taoziUFO+4yBEOinSXv+Dr+DgVjjzvdEGXOejep0EGVmtLTswG/Fi+7xh6xzUadc5A3LRR/v2/H
	2dBpiCUACc3XOzQ==
X-Google-Smtp-Source: AGHT+IGNkPUvZDfv8Muh0vJIt7Qzvxw4vZDYmCbaL7a0TKZS5EwrL7++O9rgzIs5//mviQFixGJmJKJl7nRtNGE=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:874f:0:b0:2e2:a85f:f232 with SMTP id
 q15-20020a2e874f000000b002e2a85ff232mr5284ljj.1.1714989237613; Mon, 06 May
 2024 02:53:57 -0700 (PDT)
Date: Mon, 06 May 2024 09:53:25 +0000
In-Reply-To: <20240506-linked-list-v2-0-7b910840c91f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240506-linked-list-v2-0-7b910840c91f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5039; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=AQhfweFhnbUEdO8w4wLgrf3c6x33991wxbRZ8aSauR0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmOKikDG5fFa1vHK0LfQrvwgWciUW8TFr1x2Kk7
 v7KeahV8muJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZjiopAAKCRAEWL7uWMY5
 Rs9xD/0R8N8eEZPros8IjHgRQIWEHkiNNlUd7igWD9IBbfnkALm7gfUMrH2IW+u3XET8IATQoE7
 3LV38vurNu3Kvce25pDQY9P72MYAOtDWuYt+OgxzTwSg0NCpWJBHljdjrezy9eOxXa5eSnslfsz
 LntlV7zuncAJNPVcPLGoH0QSx/UeybxjsUXA/CV6R0XS/PBXRd7ymfc1MqTv6dEmDR0H0XS9Gsx
 VV3T2hY7gsxdHPtvwYc0opJewYGqnBwzaGaBgJCMdHbLI2DkSBufqviq1j+fc6CNOnsjxR1uFQn
 UTnwXi/26INj4vZD/g8N349nL1A4EXrTdop2Pp8/Rd+RjLjZw9w11YCKLa84fj2JtKe6mFLO98H
 zOqoe+pUwQCSxsBXHEMR9mc6bnIIFQ0UxUHn7c+lYk0UiND4qqtKx5gONDjA1XNanpSiJfoYDRn
 C24kIfNtVjxxEtX+kgK/avwtf34neLv7sSmCcEYQ4BdQVwuDb3yMcWe7qxze8qMm8lb13L7uBp4
 yvvEGCSeTx6jlpSw0wCuOuLW29kKQSTV5WpmKHeTebQNSC0AqeCH9ThfdcYM1o+VwlasLzJSWdb
 dwZT3CGiCU9g5JUxGA0TAE8REB9Wa0YKXFYXtI65+TXNjt2sSwLuJXOxTIZtcrAahMiy0ac/DN4 yVaTGpI12GkDxfQ==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240506-linked-list-v2-4-7b910840c91f@google.com>
Subject: [PATCH v2 4/9] rust: list: add macro for implementing ListItem
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, 
	Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Adds a macro for safely implementing the ListItem trait. As part of the
implementation of the macro, we also provide a HasListLinks trait
similar to the workqueue's HasWorkItem trait.

The HasListLinks trait is only necessary if you are implementing
ListItem using the impl_list_item macro.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs                    |  3 ++
 rust/kernel/list/impl_list_item_mod.rs | 99 ++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index b5cfbb96a392..f2eca542e090 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -8,6 +8,9 @@
 use crate::types::Opaque;
 use core::ptr;
 
+mod impl_list_item_mod;
+pub use self::impl_list_item_mod::{impl_has_list_links, impl_list_item, HasListLinks};
+
 mod arc;
 pub use self::arc::{
     impl_list_arc_safe, AtomicListArcTracker, ListArc, ListArcSafe, TryNewListArc,
diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
new file mode 100644
index 000000000000..3ff483be89d1
--- /dev/null
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -0,0 +1,99 @@
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
+/// manually, then this trait is not needed.
+///
+/// # Safety
+///
+/// All values of this type must have a `ListLinks<ID>` field at the given offset.
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
+    // `impl_has_work!` to be correct.
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
+        unsafe impl$(<$($implarg),*>)? $crate::list::HasListLinks$(<$id>)? for
+            $self $(<$($selfarg),*>)?
+        {
+            const OFFSET: usize = ::core::mem::offset_of!(Self, $($field).*) as usize;
+
+            #[inline]
+            unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$id>)? {
+                // SAFETY: The caller promises that the pointer is not dangling.
+                unsafe {
+                    ::core::ptr::addr_of_mut!((*ptr)$(.$field)*)
+                }
+            }
+        }
+    )*};
+}
+pub use impl_has_list_links;
+
+/// Implements the [`ListItem`] trait for the given type.
+///
+/// Assumes that the type implements [`HasListLinks`].
+///
+/// [`ListItem`]: crate::list::ListItem
+#[macro_export]
+macro_rules! impl_list_item {
+    (
+        impl$({$($generics:tt)*})? $crate::list::ListItem<$num:tt> for $t:ty {
+            using ListLinks;
+        } $($rest:tt)*
+    ) => {
+        unsafe impl$(<$($generics)*>)? $crate::list::ListItem<$num> for $t {
+            unsafe fn view_links(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
+                unsafe {
+                    <Self as $crate::list::HasListLinks<$num>>::raw_get_list_links(me.cast_mut())
+                }
+            }
+
+            unsafe fn view_value(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
+                let offset = <Self as $crate::list::HasListLinks<$num>>::OFFSET;
+                unsafe { (me as *const u8).sub(offset) as *const Self }
+            }
+
+            unsafe fn prepare_to_insert(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
+                unsafe { <Self as $crate::list::ListItem<$num>>::view_links(me) }
+            }
+
+            unsafe fn post_remove(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
+                unsafe { <Self as $crate::list::ListItem<$num>>::view_value(me) }
+            }
+        }
+    };
+}
+pub use impl_list_item;

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

