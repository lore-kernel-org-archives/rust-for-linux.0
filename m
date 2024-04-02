Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B6C79B84
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712060250; cv=none; b=M41otgSq70EoW8PKvbh8gKol16qzs3fPV5SKAUWeZW7BIxJ3a3Cpe0X6tSI2WukFilopxbOAQ5gva8M4uHLu+d5E1ExHOOetPuji4NMsnlB2Zn5fwGafgikJlJa0kQdB67oAvzpCMR3yd8BOtNEgoxms5mw1n9okd1sQ9tHNVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712060250; c=relaxed/simple;
	bh=2PIcpJp9DT7VacmhqXAmL7iXpjNRwDR3ul+Ch/uIEhU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GqGtaI12a20O3d3hNr9LJ0uZ5TPBJNjpWEJ1metO5M3EoQHwSmj5Oy2737mcHQinsusHuJ5CnYBCM/9LutcGyS5AHLawX/UXLr0TNutf+87aSkj/IQd8CVSQ/5U1Zz5sWmh9din4TBJcWNBZ0Sjkp4cqZ/VXAaPk4VZlG6yTFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L0MiRXQ8; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L0MiRXQ8"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60cd62fa1f9so76839037b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Apr 2024 05:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712060247; x=1712665047; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhv4LxRJZ6OxQtv+kEEl5Wq7dqUJQo6ze35BbQzNlO4=;
        b=L0MiRXQ8Eb3NavFDfPltWWVIaCm8iuJHTEkDheibeRReD6LoxuuNl+eabNkcLwumon
         ubYq8OjeGNvD2kWMzK/PrY3ABW6JLteLoDxou9z9x1n2sEW3AOYhPWP7RW1lozNNCesn
         PjTZ+thbP5b+VOFiUakALluDKVhuNjEvCwMkETVQXGOfrG1FZ+lzp4qRKba8uVvSA7w3
         /Y7bg3lPnVWC7sCp3kJOiM7/gtGxx+4wdWc4dAkRimK9HXG6Wq6bXuoSKqtcJMiz0YJY
         rSgMui1Wp/4gSF1DGUJahdvUEyma5Og6Ek9V/iz1FZeCfRUjhBHiE4oIRdmsRkv56q00
         meYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712060247; x=1712665047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhv4LxRJZ6OxQtv+kEEl5Wq7dqUJQo6ze35BbQzNlO4=;
        b=VBumWrpOgMiPv4E06jAlCPKKIL558Ii9xdCf1fXo9P8NYuXVIErveASnsVh2s/xC3+
         wLzhXeqNskwilmaBDCc0CO+Xq4I57nbzCV1v9/8BG5f9qrGYYeKKHctd8EAvezNHkA1M
         CrKPSyOenLWhQDr9uUjEjs1NWZPZAI/c8qV8tjSzoKa9BLQ9fUdG46HtvcGN/qcWpgvW
         tmlzgRnWsWceTzsMODHPrJT1FAUpCxKkGzv1+x/LmViaSm/HlExPwKQjP0RU1bXmKbpN
         mCSTzSgI8VM3VIZm7XfN+Sw4sGyFhux3NtR5/XfKHqf7NkYXBVcXZAjREz8d8St/YE6O
         QyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAP+oIZLpGOHJQveGaqPK3oHXoVj8SwVG3t3nB4llJ0f4H4vJ6v+Yzq00+A2XkytqdwZLnzs3Pxej8qhqukbNLvNiPfIE+m/nnc/YTQEM=
X-Gm-Message-State: AOJu0YyF0Vth27GPzl8BLfbOtIYtzQePr8Rq0aBbsE/Sjz9ESJ5IIx4t
	d+/c4K6yV3uv60oR2UUiqh4qK9VBGW3dngNLeKucB+6CBG+10Ehui+GcI5/PXiZOFtDLMWh+X5d
	HJe0duPeLIRa/0w==
X-Google-Smtp-Source: AGHT+IFPeL2qwx829ZFPHGJYFkffe6dJwQ4bXNP9dPoxKP7o36b6Dqs5va8TK6Yn0yc6KOKjxZjuDd8dBh5Krq4=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:1883:b0:dce:30f5:6bc5 with SMTP
 id cj3-20020a056902188300b00dce30f56bc5mr954191ybb.4.1712060247742; Tue, 02
 Apr 2024 05:17:27 -0700 (PDT)
Date: Tue, 02 Apr 2024 12:17:00 +0000
In-Reply-To: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5967; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=2PIcpJp9DT7VacmhqXAmL7iXpjNRwDR3ul+Ch/uIEhU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmC/dJexiium8UT/OewJm7DPd0VgrTKGLZevB6+
 tW4etfZDoKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZgv3SQAKCRAEWL7uWMY5
 RpazD/4/uDlpm2FRIQJKp/aRWdG4z3cc4Dmds/xdrritb9hgsytKePUaWn43aBKudy+TqUgwywk
 GLl8g2S675hNtyAfEO8ppFQU3sRVRiGtSouPyeacJzW5hw63j+PLHznz6BP09t+Sl/k8eGpF/oT
 febc7azfxUrpOV44CT5JAxXeGhca7ebYsQpoO3YlidgHhB5BelV8EFX000wMym4AZKrxtIJUHT+
 +WCxUjO9+HE4R1XVqlhZEI8TpTbTYNJ9TzNnzWxnvWgS5RXNMRisaSiC3QMh4jsHRb0nccO7sD3
 G8eB7g4I5wf794iKi7K9GflmCAsBV9N/H7dNRydlvvLY6lRrK/epaVGxPcb77MXieVkxDUDVrao
 7YyGR0HpsQjqjoapiXpNyAMUNr1jAjHthEmxtO0kWEAGBvps4P+mOvVpOoXNTHYqkG6kiM/kif9
 CZ6Zu5ra6Mpvd/CGjYujV43z8srPvbwCFelbZ4tl7XH9FmByJtcvQqZxX+exfkroG51/Uzq+j4P
 Hu2mmdwBslps6ShnZEQO6gBwL74lBFkKaEcnglZqQk7WUoEOvGs4TjLU+oYgXyr949TPln6cFCP
 IYWl/aDxUxumQnPwbtiy8Y45H7NIBIQ/Y7F31UJum8wRdW58zIIDcEDNp10cDhhTk9ewm14oK73 qzMwlEqoZ7kITaw==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240402-linked-list-v1-3-b1c59ba7ae3b@google.com>
Subject: [PATCH 3/9] rust: list: add struct with prev/next pointers
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
index c5caa0f6105c..76597c49fa56 100644
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
+/// Implementers must ensure that they provide the guarantees documented on the three methods
+/// below.
+///
+/// [`ListArc<Self>`]: ListArc
+pub unsafe trait ListItem<const ID: u64 = 0>: ListArcSafe<ID> {
+    /// Views the [`ListLinks`] for this value.
+    ///
+    /// # Guarantees
+    ///
+    /// * If there is a currently active call to `prepare_to_insert`, then this returns the same
+    ///   pointer as the one returned by the currently active call to `prepare_to_insert`.
+    /// * If there is no currently active call to `prepare_to_insert`, then the returned pointer
+    ///   points at a read-only [`ListLinks`] with two null pointers.
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
+    /// * Returns the same pointer as the one passed to the previous call to `prepare_to_insert`.
+    /// * The returned pointer is valid until the next call to `post_remove`.
+    ///
+    /// # Safety
+    ///
+    /// * The provided pointer must originate from the previous call to `prepare_to_insert`, or
+    ///   from a call to `view_links` that happened after the previous call to `prepare_to_insert`.
+    /// * Since the previous call to `prepare_to_insert`, the `post_remove` method must not have
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
+    /// The caller is free to recreate the `ListArc` after this call.
+    ///
+    /// # Safety
+    ///
+    /// The provided pointer must be the pointer returned by the previous call to
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
2.44.0.478.gd926399ef9-goog

