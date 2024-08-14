Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644F149016
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723622781; cv=none; b=A3eSv3/mTnZZjIL6OnK0vz2eENDX15euVdEh0bk80epY3qvGVt7Jv1t0nrzMHOA00o2UszW01+DkUl6Wl2jqHt9zpcQYyq7USFUZicbWLqwiYcxmg/l8DW8oQBBL8qBDH8h4pJGwGfKhECPaiHeMt3Wnh1jlL80XIWEL/INUwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723622781; c=relaxed/simple;
	bh=luJNd/MfagCpX5xgyCXvBHu7a6jvo5DfxROIQE96O0Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CgMz5DNCKncRAIrgiMu1GnRT5UKuVuP/Gk55kJzZ6H/UXiP5lo+NFNlr5/99D8Uydbwp1/5+Vb3al4vaUd+hc9z2GgV+dWvPalqCx00pfvFgxIHZIdMUi2W6opKFDcI+jUZ0FyR/GpCcsP7CEmhA/erDrrQ3PISVx78yNmbk0iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RwzMHaCv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RwzMHaCv"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4281310bf7aso45012705e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723622777; x=1724227577; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eU2WZjJDSLa2MV/5GK/awSXKL16LXQcf7wHaBKswmn4=;
        b=RwzMHaCvqXlcqn/4h4mFeJtHoioRGpOJcjBwa7lXGL/4lN9aq6XUGb24jxQEH/cqPw
         KpdSWFQVNuc7ZGFjB7i+DSjdRM02/ld13geDXDGf0G4HO9+pSSYLT7zXb45A5ZBMU9UU
         eBt0n72gSkcAbX3WvyVEMHicDHrn8NW6pqjLNd2SlY3zcgmKdjaWo/gcyWZRyzJ5DVDu
         vPrh3rt/zlUN+bsc1LkH/+aG+7VCaKAsh6ec1US1QTOeb1p9F6rctoIeoyeIk4LBtGve
         o+VB9jM0uGLgTw2JFmCrTD2etTWwc2NOX6bF/+8ajcSTH1dBKsZpnW75mCWjL6ifHGFF
         P/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723622777; x=1724227577;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eU2WZjJDSLa2MV/5GK/awSXKL16LXQcf7wHaBKswmn4=;
        b=ILCxm1yhlWdDj2JEZXIal0FPVS02pG92durJ5NInZ+V0Xadql+9HOBLmSp1CLQvxmP
         pnxsIJmgu8ypFvzdLEoL+FlAyLqlmQLEWVNpHIbisnm3fs9TZfo2YgcRCex8i1E1F52V
         9UB019d5drWL/7Ou6ZwC5W6geKt79s6AUkH20otGg3yENsnzSWDy5F32Zh3qmQevox52
         BejdUio+4k/+6JHIinA8O7QG3E8coCXbOgbVBdUjuuoKQkHBGBZ0nzpOrrFz5DnhGpwf
         swOvZJY7Imqf7cBUFZFsgVWnIP0Yq0ZC84oFR1YPmvB8WwXIflW3PN9UGH00qY//oFa0
         VCNA==
X-Forwarded-Encrypted: i=1; AJvYcCUmmOtAOOORiLuvJfll8S1d6kj8CMf8QI/r0ZmF5a5bmNxON4Lp005DTeDiT1n3YCL8z8uPfe3zlnktUZhucw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGrOIExuizsQ+FQ8cwZSQe6cLEeQGBINNZN5V/WIOo5+P/MzR
	CDfbvqVNXzSAl0qlczRL6Du7ct9SxJbSvasVya/I7dbyM0nA231nsN4W5Mz1kBfXF3DsihkHRRc
	b7ajUwisoxEJ4sA==
X-Google-Smtp-Source: AGHT+IHe21novGmBRhAc1cgxeZ/rnzGM0+Bl4ZHLaMVY4DaNNS190O+pXlPP0izBlxfFWOHjeHfq+Qv3y1Z6Gcw=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:6d48:b0:426:6f38:8990 with SMTP
 id 5b1f17b1804b1-429dd2647eemr40315e9.3.1723622776781; Wed, 14 Aug 2024
 01:06:16 -0700 (PDT)
Date: Wed, 14 Aug 2024 08:05:27 +0000
In-Reply-To: <20240814-linked-list-v5-0-f5f5e8075da0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240814-linked-list-v5-0-f5f5e8075da0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5333; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=luJNd/MfagCpX5xgyCXvBHu7a6jvo5DfxROIQE96O0Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmvGVgRWbQqHhnoystThILzkwOTzoEfhLP4TvEn
 eYN+ni2Hs6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrxlYAAKCRAEWL7uWMY5
 RqvPD/4otcbv3KqvSf+EDcftbS+DTlKRGlweDQfZ8U43+xbUiA3KDeUIYjbqeGHVCnfiJYIVnLZ
 LM5ZtEcWXy82qFs7cEqgTbk0xU+k8w/8ouMAYI87T0w7dlR+5577YbQs7heiKTOuP4FQpEuYk2l
 9svkv0ooW39NFki47X820faJdT/bruKKmymHBm31zhjXuVQ4rKGiGpFNgqhLHUdDoOS4hw4Wwow
 88VrVkMdSevmKHkQFq8FlLXy2TOKAPJwMw7TxqeNyEjix8Ii+y//ZRfpZdCsKNmoLK1id+FeDoy
 Nh1+DQsuIjOt2HljYpfkiOGkgrhbnduyBlKAweL0XGwWHrGzP4UJ//aIyOKaK6opwuR7nv31dwJ
 3r0BaYjfP22xz+WtRbORi6kEBTK2mqvK5K8BhyIVvxFCggS+8Lk6gv6k/3k46hPZfynrh5knrOV
 zGBbXZ7VDfERoYkJo1tfF2auCIk/nNpiOyHaeIkEuMawMzdSDeRDldHlB9QRpAPJ4QnO7m8FR3g
 wC3HUD7nY2ogltx6brpu4OiuXZS7M6VTyh3NEVcTYMcY3mHN0Kh5GaG0idglhcMDXFOwgVbPVIr
 iLlclJAEEEDO97nJIvhP7hBn1pnUB3NrhfxKuTrJfnv51N4zSWg7xle+kB5Tp9kBOaSAtyOuQdg ydxJrHCFQSvXgcQ==
X-Mailer: b4 0.13.0
Message-ID: <20240814-linked-list-v5-8-f5f5e8075da0@google.com>
Subject: [PATCH v5 08/10] rust: list: add cursor
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

The cursor is very similar to the list iterator, but it has one
important feature that the iterator doesn't: it can be used to remove
items from the linked list.

This feature cannot be added to the iterator because the references you
get from the iterator are considered borrows of the original list,
rather than borrows of the iterator. This means that there's no way to
prevent code like this:

let item = iter.next();
iter.remove();
use(item);

If `iter` was a cursor instead of an iterator, then `item` will be
considered a borrow of `iter`. Since `remove` destroys `iter`, this
means that the borrow-checker will prevent uses of `item` after the call
to `remove`.

So there is a trade-off between supporting use in traditional for loops,
and supporting removal of elements as you iterate. Iterators and cursors
represents two different choices on that spectrum.

Rust Binder needs cursors for the list of death notifications that a
process is currently handling. When userspace tells Binder that it has
finished processing the death notification, Binder will iterate the list
to search for the relevant item and remove it.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 0d680156b8b1..904cfa454dff 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -440,6 +440,20 @@ pub fn push_all_back(&mut self, other: &mut List<T, ID>) {
         other.first = ptr::null_mut();
     }
 
+    /// Returns a cursor to the first element of the list.
+    ///
+    /// If the list is empty, this returns `None`.
+    pub fn cursor_front(&mut self) -> Option<Cursor<'_, T, ID>> {
+        if self.first.is_null() {
+            None
+        } else {
+            Some(Cursor {
+                current: self.first,
+                list: self,
+            })
+        }
+    }
+
     /// Creates an iterator over the list.
     pub fn iter(&self) -> Iter<'_, T, ID> {
         // INVARIANT: If the list is empty, both pointers are null. Otherwise, both pointers point
@@ -514,6 +528,74 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
     }
 }
 
+/// A cursor into a [`List`].
+///
+/// # Invariants
+///
+/// The `current` pointer points a value in `list`.
+pub struct Cursor<'a, T: ?Sized + ListItem<ID>, const ID: u64 = 0> {
+    current: *mut ListLinksFields,
+    list: &'a mut List<T, ID>,
+}
+
+impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> Cursor<'a, T, ID> {
+    /// Access the current element of this cursor.
+    pub fn current(&self) -> ArcBorrow<'_, T> {
+        // SAFETY: The `current` pointer points a value in the list.
+        let me = unsafe { T::view_value(ListLinks::from_fields(self.current)) };
+        // SAFETY:
+        // * All values in a list are stored in an `Arc`.
+        // * The value cannot be removed from the list for the duration of the lifetime annotated
+        //   on the returned `ArcBorrow`, because removing it from the list would require mutable
+        //   access to the cursor or the list. However, the `ArcBorrow` holds an immutable borrow
+        //   on the cursor, which in turn holds a mutable borrow on the list, so any such
+        //   mutable access requires first releasing the immutable borrow on the cursor.
+        // * Values in a list never have a `UniqueArc` reference, because the list has a `ListArc`
+        //   reference, and `UniqueArc` references must be unique.
+        unsafe { ArcBorrow::from_raw(me) }
+    }
+
+    /// Move the cursor to the next element.
+    pub fn next(self) -> Option<Cursor<'a, T, ID>> {
+        // SAFETY: The `current` field is always in a list.
+        let next = unsafe { (*self.current).next };
+
+        if next == self.list.first {
+            None
+        } else {
+            // INVARIANT: Since `self.current` is in the `list`, its `next` pointer is also in the
+            // `list`.
+            Some(Cursor {
+                current: next,
+                list: self.list,
+            })
+        }
+    }
+
+    /// Move the cursor to the previous element.
+    pub fn prev(self) -> Option<Cursor<'a, T, ID>> {
+        // SAFETY: The `current` field is always in a list.
+        let prev = unsafe { (*self.current).prev };
+
+        if self.current == self.list.first {
+            None
+        } else {
+            // INVARIANT: Since `self.current` is in the `list`, its `prev` pointer is also in the
+            // `list`.
+            Some(Cursor {
+                current: prev,
+                list: self.list,
+            })
+        }
+    }
+
+    /// Remove the current element from the list.
+    pub fn remove(self) -> ListArc<T, ID> {
+        // SAFETY: The `current` pointer always points at a member of the list.
+        unsafe { self.list.remove_internal(self.current) }
+    }
+}
+
 impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> FusedIterator for Iter<'a, T, ID> {}
 
 impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> IntoIterator for &'a List<T, ID> {

-- 
2.46.0.76.ge559c4bf1a-goog

