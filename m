Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609E414D711
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721722987; cv=none; b=B8gKXWP1KAowYRMf8e05/+7rD/HbM9XkOhQOV7F7VtZeQ5kkJiCBykfhEg8guLkI7y1qc7lZvQCzm5x5+RkSesFn/MQQ5NsnJNe+pUQT9g2GWBE9A/S8n2NlDwxiiMqwCoS8iU1Y5Cvj6zK6k8emvhelsUUiXLRJnvPGZkWN16Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721722987; c=relaxed/simple;
	bh=UuGb6O3+CicGgR1jFURxIdmSwe0z9XIKmsa42luz5sM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qFjpK7+PmStSwPnuqADdsxWXzTKkci/Gi4YOOqqsqMXUA6+o7lmjKVI4ALxF9mimrPLSHa6l1n0aZxwOXfYgPR+zS4Melt/Kxw3hGAPfqokWoEmJGk3Z1kbsNK6s5KZ/uJrG/AjSbKH+LzNcUr/ns8XfgBVRSodVuXbRXGI7b14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RIOmf+hu; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RIOmf+hu"
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-2ef23ec8dcfso24835261fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 01:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721722983; x=1722327783; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSC5xvhbZTJxyrCczhAEUBkZy+WsSQNfzVek8UHbQHo=;
        b=RIOmf+hu/IR6HCto2mEbMtchb3GNZOWIJikWPUPFUZLYtU6Wcfjuhhj6vX7wtxCty2
         iVwFcEWLTId6S9jK0M374RpSowWV/B0lmRyXsM9XTlP5mbMLf/LcTuI+YWkiZQ7+/wFd
         h+x7m2cK1yM7L7P2IaUBLoOXIXWj2wOKa6gZiMUmH6P3U50hlpglk6G9+uM4k5bYCeIk
         8BH4ofjY85QXuSeiM3dWAhaOTtvU7v9ODfa59uNcdiamfkDED3MDTEvPpejYfiPPwCfu
         pJ1qqG+Ap3pi6yWDi8EmZCYleNZTzgAFAbxT4d6fdaSzukc6FWdyQzdNHjgVwtpc6NtO
         VV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721722983; x=1722327783;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSC5xvhbZTJxyrCczhAEUBkZy+WsSQNfzVek8UHbQHo=;
        b=QfzpWrfb1REn3SKE2cL3WjBYjZML0Y7BpLbf4QGLU3pWhMW927sRbb8JuqMni9p78O
         +pBqb6gyy4lQ//P4R36E0Iv2+j3mQm/JuL3JEbcRESOnZ7zacMJvwq3mxiP/+9lc0WDj
         lK+SdUkXvS0oR3IvQ0fop8cjxCr4IBu0cm7lu0iQuYM7vKrWRZtHZyVs7hkLvYlmqzx1
         jWIHOe31v3f7FSABL/mRKY+svDpW2ODc/zzyKvqkzkvezE3bBVbvkdJRkNpDXJo39bgm
         FM1wkyS0Cjv7dr/Is1K3vfYNbw6wYqoaV/iIG6oWeECmky49N/wbOosgdy0NOLPg5NH5
         9ttg==
X-Forwarded-Encrypted: i=1; AJvYcCXdQ4Msq2ZVv7jWg730Ws20cZD3jIJ8jUjFFAPC/nzur+VG/CbD6F5YnRDMox56whX4fd2iv4Kq5WXwW70r08eLDPq/cKoCa1KEyOO++OA=
X-Gm-Message-State: AOJu0YzQlBMaQQE+sKHthC6AW4VQvUHRWlD9HjaHh9XHvzgl1KZZRUds
	tZHVjqiMW0mGHtxatZrXFxzCkNh3p+lx7TQ8fG9fzqQ9KCh1/PQqhIVqknHOM/+cjc7qRhVjpDo
	wi9dFfOsXGcO1kQ==
X-Google-Smtp-Source: AGHT+IGFga6vKO4UbX5LF+DHLWLeuoKVJRWbTO3jngPxrxHzKVLwzO4KrhUfVJrX9g2BGGOKNoHyrsQJW94aD2A=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:97d2:0:b0:2ef:2308:a8f8 with SMTP id
 38308e7fff4ca-2f01eab8f33mr28131fa.3.1721722983398; Tue, 23 Jul 2024 01:23:03
 -0700 (PDT)
Date: Tue, 23 Jul 2024 08:22:05 +0000
In-Reply-To: <20240723-linked-list-v3-0-89db92c7dbf4@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240723-linked-list-v3-0-89db92c7dbf4@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5924; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=UuGb6O3+CicGgR1jFURxIdmSwe0z9XIKmsa42luz5sM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmn2hTRbkqpsFwnVQKNEr5/qhfC38vwGN6BeSEW
 5jKwfwvqxmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZp9oUwAKCRAEWL7uWMY5
 RrCgEACsfXrKLDL7MQrYr53otFLMkVld6REhp0SDSelAOrupk4IW4ZpInTkdY162j3zATfaSkMo
 Gg1V6jwX2E+p0LcFBuavtwwgdSB1b4WyEjsOWgCdEsIswh3etWVCtwwNq02jUif3C+HIdIoF4jb
 OOlYjr4rV69QDUmoILa5CPwFnn8TwgiXk96d3EpTTOu96r72iU5nfAYIKiHI64XrTNJ9DMuVCre
 DoLvHVxVJXBXubGFLdMpK37IVdpzInWZ0czHJWEOnZRZXkjxtnPc/gM/N8jWM0aJEH9aHOSMH7C
 uSnMh/ZEkObEI7QyLEMIqnha06sSOhOp1oeZviTm9/plp0esI2YVHcZFcONrgnMpqZdu0s1x4BL
 KKDvkAwqTlgNUzMpS5R8dTcmGo2K7mqr91eUuaN76yxlizfWPYH0H80tjDG/hOsNChsDQeHn3jJ
 efe4AJYN2J0QgTBoNJqalj6WIFV4LrqekbIsOECRL/3TtoL9I3ef4bj2SdV7i9fwFfYSTB9ulih
 X3toNgR4cz+nYqZAWROJFwpBHwv7+YQsrpENK7kdNev64CHvbPVDIzLHPCKr+4GeW0Lmm9KQ/RL
 a5XlwuA/2WU/nfpDaMHmMplnw46TqK56RhvHxve+Nf48shf3XNu+GDklpJy+0F2c5/JKvt4Ujs5 neibA+rAP7+4qoA==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240723-linked-list-v3-4-89db92c7dbf4@google.com>
Subject: [PATCH v3 04/10] rust: list: add struct with prev/next pointers
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

Define the ListLinks struct, which wraps the prev/next pointers that
will be used to insert values into a List in a future patch. Also
define the ListItem trait, which is implemented by structs that have a
ListLinks field.

The ListItem trait provides four different methods that are all
essentially container_of or the reverse of container_of. Two of them are
used before inserting/after removing an item from the list, and the two
others are used when looking at a value without changing whether it is
in a list. This distinction is introduced because it is needed for the
patch that adds support for heterogeneous lists, which are implemented
by adding a third pointer field with a fat pointer to the full struct.
When inserting into the heterogeneous list, the pointer-to-self is
updated to have the right vtable, and the container_of operation is
implemented by just returning that pointer instead of using the real
container_of operation.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 115 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index c5caa0f6105c..63e6f6a47964 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -4,7 +4,122 @@
 
 //! A linked list implementation.
 
+use crate::init::PinInit;
+use crate::types::Opaque;
+use core::ptr;
+
 mod arc;
 pub use self::arc::{
     impl_list_arc_safe, AtomicListArcTracker, ListArc, ListArcSafe, TryNewListArc,
 };
+
+/// Implemented by types where a [`ListArc<Self>`] can be inserted into a `List`.
+///
+/// # Safety
+///
+/// Implementers must ensure that they provide the guarantees documented on methods provided by
+/// this trait.
+///
+/// [`ListArc<Self>`]: ListArc
+pub unsafe trait ListItem<const ID: u64 = 0>: ListArcSafe<ID> {
+    /// Views the [`ListLinks`] for this value.
+    ///
+    /// # Guarantees
+    ///
+    /// If there is a previous call to `prepare_to_insert` and there is no call to `post_remove`
+    /// since the most recent such call, then this returns the same pointer as the one returned by
+    /// the most recent call to `prepare_to_insert`.
+    ///
+    /// Otherwise, the returned pointer points at a read-only [`ListLinks`] with two null pointers.
+    ///
+    /// # Safety
+    ///
+    /// The provided pointer must point at a valid value. (It need not be in an `Arc`.)
+    unsafe fn view_links(me: *const Self) -> *mut ListLinks<ID>;
+
+    /// View the full value given its [`ListLinks`] field.
+    ///
+    /// Can only be used when the value is in a list.
+    ///
+    /// # Guarantees
+    ///
+    /// * Returns the same pointer as the one passed to the most recent call to `prepare_to_insert`.
+    /// * The returned pointer is valid until the next call to `post_remove`.
+    ///
+    /// # Safety
+    ///
+    /// * The provided pointer must originate from the most recent call to `prepare_to_insert`, or
+    ///   from a call to `view_links` that happened after the most recent call to
+    ///   `prepare_to_insert`.
+    /// * Since the most recent call to `prepare_to_insert`, the `post_remove` method must not have
+    ///   been called.
+    unsafe fn view_value(me: *mut ListLinks<ID>) -> *const Self;
+
+    /// This is called when an item is inserted into a `List`.
+    ///
+    /// # Guarantees
+    ///
+    /// The caller is granted exclusive access to the returned [`ListLinks`] until `post_remove` is
+    /// called.
+    ///
+    /// # Safety
+    ///
+    /// * The provided pointer must point at a valid value in an [`Arc`].
+    /// * Calls to `prepare_to_insert` and `post_remove` on the same value must alternate.
+    /// * The caller must own the [`ListArc`] for this value.
+    /// * The caller must not give up ownership of the [`ListArc`] unless `post_remove` has been
+    ///   called after this call to `prepare_to_insert`.
+    ///
+    /// [`Arc`]: crate::sync::Arc
+    unsafe fn prepare_to_insert(me: *const Self) -> *mut ListLinks<ID>;
+
+    /// This undoes a previous call to `prepare_to_insert`.
+    ///
+    /// # Guarantees
+    ///
+    /// The returned pointer is the pointer that was originally passed to `prepare_to_insert`.
+    ///
+    /// # Safety
+    ///
+    /// The provided pointer must be the pointer returned by the most recent call to
+    /// `prepare_to_insert`.
+    unsafe fn post_remove(me: *mut ListLinks<ID>) -> *const Self;
+}
+
+#[repr(C)]
+#[derive(Copy, Clone)]
+struct ListLinksFields {
+    next: *mut ListLinksFields,
+    prev: *mut ListLinksFields,
+}
+
+/// The prev/next pointers for an item in a linked list.
+///
+/// # Invariants
+///
+/// The fields are null if and only if this item is not in a list.
+#[repr(transparent)]
+pub struct ListLinks<const ID: u64 = 0> {
+    #[allow(dead_code)]
+    inner: Opaque<ListLinksFields>,
+}
+
+// SAFETY: The next/prev fields of a ListLinks can be moved across thread boundaries.
+unsafe impl<const ID: u64> Send for ListLinks<ID> {}
+// SAFETY: The type is opaque so immutable references to a ListLinks are useless. Therefore, it's
+// okay to have immutable access to a ListLinks from several threads at once.
+unsafe impl<const ID: u64> Sync for ListLinks<ID> {}
+
+impl<const ID: u64> ListLinks<ID> {
+    /// Creates a new initializer for this type.
+    pub fn new() -> impl PinInit<Self> {
+        // INVARIANT: Pin-init initializers can't be used on an existing `Arc`, so this value will
+        // not be constructed in an `Arc` that already has a `ListArc`.
+        ListLinks {
+            inner: Opaque::new(ListLinksFields {
+                prev: ptr::null_mut(),
+                next: ptr::null_mut(),
+            }),
+        }
+    }
+}

-- 
2.45.2.1089.g2a221341d9-goog

