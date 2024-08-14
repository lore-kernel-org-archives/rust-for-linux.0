Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B291428E8
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723622769; cv=none; b=SID8O731JC8H1g4s81WeEsBPIpoB81kw/slpGi01fAiaucX2ThFCJWNtFy44Ju6ok+SXxFq7bKJ66Y7CuhtaRBS5Wb0/DNAykAy8mCsYVR6t1SPzdBHQ1kZuevJZEb+8xsMxBIy1Q6Jn1DeweoreavDmAHHZH50+T6GYtPFyryw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723622769; c=relaxed/simple;
	bh=ZGRtM04u3g5Up6WlihqLvzD2O+qnfmGpQGoUaB/u7j0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H9wUJYJeowDJ5eKvbx2MLy5SCPaCL7jlPEWtjm89fuVaLB5KViM7oWNfWyCa/hFj4GVfHn7Jm+e6Q9eldJ6ERqZDP7G2eYM5WjkujLGYajQlSsowiocU8RMIlmFiCFpR9ZvXeEY5Rs4tQrTWNloRhdgqTlTfUApvZlI612obxuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqEeTCmi; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqEeTCmi"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ad97b9a0fbso6017017b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723622767; x=1724227567; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/RqOCLiFdemdAlZLK6KKO29T4r+56k9VFtBAkRLaRo=;
        b=UqEeTCmivf+wpaG6EkUiLUV8eXPh7WaunGryBXDE8QVbGRdurvsxiG7lny54EX0oQ8
         KHWeXQ0UwXZx8upYcdyydhWbPvCtVhNwwGqvAG/RNroYrmeAxWtU/nAeWhF72hAylDzy
         sS2RkWopt+qOcMv7b0O7qfh2HLMaxeUHFr8YIduBqK0imDlXtH2izPuEbb1YpwWf4Kgz
         grKyM775yv9WWxcWtnowrnBA1UxCYvxsAymnqihO1KbqMJQPVgOHr4CgHJ/nsj6Pglzb
         FDE2G9hJWxz+JuIybAMZc6oCOwozM3yHWFrHqMXKJFaKDDcnP4JATO/MNxhE409Ro0np
         9ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723622767; x=1724227567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/RqOCLiFdemdAlZLK6KKO29T4r+56k9VFtBAkRLaRo=;
        b=vaIq1LlNa5RpmIT6/EsWcATHbkWUEyZBjYnpsirG/xtrXo2DCY51zeYezzI8+EZkx5
         y+ppXxnBzR4Z/dfWH7rPRgVdK/aKqa9bSFWxjfiLn63MNcl+UZO+yJBPJfY5rQU2sncf
         sjdV9Aou5qHiXtU/aLBs30vjHKTc13Ns124LnbrUIyV0BRbnNg1rc10buUHvPz+oSkQv
         hdyvKZbI5Uknf1jeO/PLYEFN24t6u/oY0XADNPP0qxSDL3KXu5q1u3WxcRcR0KlYDODS
         nfLKrJT3hoehFjJOKwtH1qNBzIxbdHzCr94uGqkpsywhmrVGNt4sySjdP4rnKpN+UWRK
         fR0w==
X-Forwarded-Encrypted: i=1; AJvYcCU/DPF7Gxp6MgriPDAJibBLi6J2B9JWfqTqVgKoWkW35w/O2i3Htj1f+m7Vqs4RpUoD9nErJMrClnJKAW1aQf2kgAipiPDd8ImsbfXofHU=
X-Gm-Message-State: AOJu0YydaVnFVAljqo2RwywMDy4UU/IVcEzfjYT4/jKKY0Nwmcx4upW9
	sWucG2egMtcfNoa7IWrFHmeRY7DSOi04JzS259O/WKeqWty/bFxPBAtgs3eeZliSnETxURkYCi6
	NXMJS1OxqiXga3w==
X-Google-Smtp-Source: AGHT+IGESfcd3ZtITp1JXLds/mxHvLWIRxSoRx+UcHnTvQKMVxNmpKT2THk9RSjcdG/X/Qyd1hg538pgt3hD+RU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:2608:0:b0:e0e:445b:606 with SMTP id
 3f1490d57ef6-e115586755amr4662276.0.1723622766668; Wed, 14 Aug 2024 01:06:06
 -0700 (PDT)
Date: Wed, 14 Aug 2024 08:05:23 +0000
In-Reply-To: <20240814-linked-list-v5-0-f5f5e8075da0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240814-linked-list-v5-0-f5f5e8075da0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6274; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ZGRtM04u3g5Up6WlihqLvzD2O+qnfmGpQGoUaB/u7j0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmvGVd6JArS/zg3Cb/LIJe3ugUi6A1hNKOrkLt9
 XZXxL9k452JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrxlXQAKCRAEWL7uWMY5
 RpEDD/9uiAnUQ4xE/rNDmHVsxO4N+QMSR/YJPRL/+dhnjQllgHHoiebDcfg4nofwswRXAouyki8
 oBk7XKjEuv17WmEzxvYy9WxIDxS6WUn5c+kIWNn/XsITHBKA8VU+Z4cC61gbS3fsM+RUJVPzDdk
 GkYYCmw1AH5ijrhsKmCOZz3SnMswOjTpLxpQZzMtSDf0OJZAjH/Cn6LONYF/CSjcZMuUqg7REkk
 V1s/g98OWmyPZNeR8yIPXEeoFR5jN8ytYCCaA5QB2+CZ5GxGbeiGuoZPzYtj1nWdRej1BuNlAph
 YdVAVtxK5rehoNoXoxgPJKspizOmJt3/5ntjO5Hqkh5/FP/XX4yTx+g+Q9EPzFr/Vk7YuA+VZct
 4T6GQqa448xSDNDdcjCcymNB+sjwWC542o/19MO0i3YYAzQj4k8DgA07pBFpo+wx4JGCg+LPCKs
 5QjoL79K2uhVFe7n8ugnhXDgVsoQI2r9CMgcGqkY82CUZhtyzfOF9aTDqekq07z3mSP6tdB2N6F
 VPsPLm7KcQ9Hf6PPkQL/shVrRVrZdJtBMeJANF5nvS3TTphSiFegJD1RqInvY97aqPHtWF5UUpy
 gVtbZ4xAfXO26uNUjY08TqyK4uIe+SqCWJ09eeHNgI9pxqVigwxIdTiFHBmx3/Db2Jr9r7pfWip RhwPrvELPaN+vKw==
X-Mailer: b4 0.13.0
Message-ID: <20240814-linked-list-v5-4-f5f5e8075da0@google.com>
Subject: [PATCH v5 04/10] rust: list: add struct with prev/next pointers
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

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 8e1533ee987b..074ae863ff5a 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -4,5 +4,124 @@
 
 //! A linked list implementation.
 
+use crate::init::PinInit;
+use crate::types::Opaque;
+use core::ptr;
+
 mod arc;
 pub use self::arc::{impl_list_arc_safe, AtomicTracker, ListArc, ListArcSafe, TryNewListArc};
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
+    // This type is `!Unpin` for aliasing reasons as the pointers are part of an intrusive linked
+    // list.
+    #[allow(dead_code)]
+    inner: Opaque<ListLinksFields>,
+}
+
+// SAFETY: The only way to access/modify the pointers inside of `ListLinks<ID>` is via holding the
+// associated `ListArc<T, ID>`. Since that type correctly implements `Send`, it is impossible to
+// move this an instance of this type to a different thread if the pointees are `!Send`.
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
2.46.0.76.ge559c4bf1a-goog

