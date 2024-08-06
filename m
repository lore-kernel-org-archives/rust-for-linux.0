Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879921C168
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722952788; cv=none; b=LYG+IF7OnCTXzoMI7lxLZ9AR/l2uo1JdlFYtPMhIS0EF8ahpmd7S7fkzGI+w0A+hbmtwTDa3ScSpJPrjV/HTge9hpy3kg8U9Yg15MszY1Jv4BzJn64WQ5QXigSMqKEwBfB9lqfwWy1I1Wqx+Eurid7qWIXVXWSawX1IpDZpTDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722952788; c=relaxed/simple;
	bh=5Auobud/qkfPgqEK9dIDGdnYH2b2+TiVd76QFukYtuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iu9gPQjopqeoFiAOVm/TNi92islbz7SyYu2NkJmEfppSSppdXwQWu7PWnkSAp6O+dAC6oUfhB0VaEM9V/osgJh/EIDVSK4tWzrLbQQosaH5iV+kU9iT8kRnVi9uIjzOtM7QIu0ygdDit4IDUaKgEQylMaxn+s1w2pyinl2zQesc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hE2xQx4s; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hE2xQx4s"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-428e0d30911so5646915e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722952785; x=1723557585; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mBtLq8vMW6E0NPD2YscCzJYeLwsvhgk+uQjC+zS8n/A=;
        b=hE2xQx4sIRttx0tPcfu8GAShAcHEStbeUykwcTns2QeKFj1n48rvfc5DAO0za087oG
         UcCKpdGs0adhmT8mCt3EV/vkG0c27Bxw48KNi2ddbkesdHfwxjvSHPzMEyzS2UPijJlx
         vA3QJxEpAQHboslORuPNKqcNOLfTIjc9ZDywYrnsShKtRhJZ0/Jr2Gxz+tJWfDWGj/oK
         i7EmZSTpzQP3lczVnpoJbye7nD0eu/mqh3qHLlnLkBDjw5DQvRwwbNRgj3ZHuwROve+t
         pZDljORFqEcbe+zwQX2GNP77GyR1d/2xxfqXmuU8EYOUpYubP5TWC59lonBcDzCNjlpP
         U7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722952785; x=1723557585;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBtLq8vMW6E0NPD2YscCzJYeLwsvhgk+uQjC+zS8n/A=;
        b=IKVRrBi2ZzgSYefjjS4ZrrbE0krjJVnBvV1twpQesOYORFCjhEJScCNEmbCOwh49je
         6crWYl3m3A8jocY+bf2gGRLgwktPRMVx12FD193qkDOR1KDhk6hs9cDXZkZlzvw16JYH
         xQXX/2y+FdbHJSQWa020itjsDTTnDj/QPcxPZ2C5c1k9TM+5QME64k6gh3tW7eFYz6eT
         Ug2CuWWvJoqv68c8hQj+GzoeKo8yJFfVJe8WFf7kNDYNcAKsHNsgv4e5ydQY8DiNUpgF
         x3haL/wSe6goJjQMvYNIU5NvB/udXdzPQ5nW5ZnK7cozdsYq0E4GBigrEPK615jgvXyI
         8aMw==
X-Forwarded-Encrypted: i=1; AJvYcCWrmI1TwtItSxWTx6Zf+BrbksH55j/vxM2PnGIs6HkptaSr3/F9YYsPNvkNtAlIR9bloN90zFLF0k2TmnX8RkvI8sPno67kjBdPw5JxeuU=
X-Gm-Message-State: AOJu0YwikxSQGjPlV1m63ExK4/YUL8l/j/xoujVRmZ/j3/X1eYvblfqw
	UKBXA9j4qELwM3jGoSp1rdmRsj3pgfEDTy0ehKr2FIrVwdloeRsbmoMk87wxLruP+SwhCwk9iyM
	mMj9Svu77cNeOTQ==
X-Google-Smtp-Source: AGHT+IFEqJ0FlEIEvxMSETiYqlJJ0W522Nh4qV0BfqtWSXzyR9SKwiyAjstR3yqNxweYjHzyIs8dujHwU7UEhh4=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:6986:b0:424:a3d1:bdc5 with SMTP
 id 5b1f17b1804b1-428e6a603a4mr651055e9.0.1722952784877; Tue, 06 Aug 2024
 06:59:44 -0700 (PDT)
Date: Tue, 06 Aug 2024 13:58:59 +0000
In-Reply-To: <20240806-linked-list-v4-0-23efc510ec92@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806-linked-list-v4-0-23efc510ec92@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5030; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=5Auobud/qkfPgqEK9dIDGdnYH2b2+TiVd76QFukYtuo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmsiw7FowwYrZejcypbzdQRWrZDJ2Ax/ZGPWDpJ
 Qipg8CgP5SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrIsOwAKCRAEWL7uWMY5
 Rn6fD/4qX5qT6tv/rYHGx4RP6YWw0w8sZR44fApGeEeHWpXtRigu0T1OvVbFCZUBAy/rPOpa+CF
 kBple4Bk0B7EoOXu05JfFWU+WAIPPb6kMFRUqXJZ58LViN2tFoRSPjW5e2WEqpJh5JL0iCypaSs
 CDnF02W4KE1GnWwOBrQ7taTGm5U69NAgqvKDdKJ9UFcOgQc8osbqulMRP3wGiidcroV2u6SuJDm
 Nczfm0yTwmLVmT9pOsVw8tR6ZeK0CIozQkn+TZBs7qmfsBeb+efhz/TKxnNj1NuFc0l7qaJGtI4
 YcaelbKk2MpiaAG+i8k5Nfx2NyUxmNuq1y08VpcS7V1okVMxTS5e8lS6Zme4zQlf2G5esiQHHNM
 TqsgA+BebfDFT0ObUhH71yZzDABmkQ3Yn633zYmkwTLyBB+iCzPcDmSwWsb2DNX+SQNK8xCaX7k
 ydN7RpprqLpCkrg/KXMraHy553zMzGLoXXU5KXZj2brOR/ytT1HUhhQEFpduCHJHIJX/BP+UgJV
 xRiTouCNDmO9GCH3YSgtVQ+2yfmaupc8DLk21g5OZfRPDayll8mUCNy3l5oLSZn7bYhzNzJd03M
 ZgWXlWduCrV370Zo3QXezg+yx44hwOhTwhREmnH2vfUNUIquNtoECYO8hJ6kIaNI1CUPeXulyfg 4IVyAlEANyb/Dag==
X-Mailer: b4 0.13.0
Message-ID: <20240806-linked-list-v4-7-23efc510ec92@google.com>
Subject: [PATCH v4 07/10] rust: list: add iterators
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

Rust Binder has lists containing stuff such as all contexts or all
processes, and sometimes needs to iterate over them. This patch enables
Rust Binder to do that using a normal for loop.

The iterator returns the ArcBorrow type, so it is possible to grab a
refcount to values while iterating.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 102 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 551c46a2401b..0d680156b8b1 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -5,7 +5,9 @@
 //! A linked list implementation.
 
 use crate::init::PinInit;
+use crate::sync::ArcBorrow;
 use crate::types::Opaque;
+use core::iter::{DoubleEndedIterator, FusedIterator};
 use core::marker::PhantomData;
 use core::ptr;
 
@@ -437,6 +439,17 @@ pub fn push_all_back(&mut self, other: &mut List<T, ID>) {
         // INVARIANT: The other list is now empty, so update its pointer.
         other.first = ptr::null_mut();
     }
+
+    /// Creates an iterator over the list.
+    pub fn iter(&self) -> Iter<'_, T, ID> {
+        // INVARIANT: If the list is empty, both pointers are null. Otherwise, both pointers point
+        // at the first element of the same list.
+        Iter {
+            current: self.first,
+            stop: self.first,
+            _ty: PhantomData,
+        }
+    }
 }
 
 impl<T: ?Sized + ListItem<ID>, const ID: u64> Default for List<T, ID> {
@@ -452,3 +465,92 @@ fn drop(&mut self) {
         }
     }
 }
+
+/// An iterator over a [`List`].
+///
+/// # Invariants
+///
+/// * There must be a [`List`] that is immutably borrowed for the duration of `'a`.
+/// * The `current` pointer is null or points at a value in that [`List`].
+/// * The `stop` pointer is equal to the `first` field of that [`List`].
+#[derive(Clone)]
+pub struct Iter<'a, T: ?Sized + ListItem<ID>, const ID: u64 = 0> {
+    current: *mut ListLinksFields,
+    stop: *mut ListLinksFields,
+    _ty: PhantomData<&'a ListArc<T, ID>>,
+}
+
+impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> Iterator for Iter<'a, T, ID> {
+    type Item = ArcBorrow<'a, T>;
+
+    fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
+        if self.current.is_null() {
+            return None;
+        }
+
+        let current = self.current;
+
+        // SAFETY: We just checked that `current` is not null, so it is in a list, and hence not
+        // dangling. There's no race because the iterator holds an immutable borrow to the list.
+        let next = unsafe { (*current).next };
+        // INVARIANT: If `current` was the last element of the list, then this updates it to null.
+        // Otherwise, we update it to the next element.
+        self.current = if next != self.stop {
+            next
+        } else {
+            ptr::null_mut()
+        };
+
+        // SAFETY: The `current` pointer points at a value in the list.
+        let item = unsafe { T::view_value(ListLinks::from_fields(current)) };
+        // SAFETY:
+        // * All values in a list are stored in an `Arc`.
+        // * The value cannot be removed from the list for the duration of the lifetime annotated
+        //   on the returned `ArcBorrow`, because removing it from the list would require mutable
+        //   access to the list. However, the `ArcBorrow` is annotated with the iterator's
+        //   lifetime, and the list is immutably borrowed for that lifetime.
+        // * Values in a list never have a `UniqueArc` reference.
+        Some(unsafe { ArcBorrow::from_raw(item) })
+    }
+}
+
+impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> FusedIterator for Iter<'a, T, ID> {}
+
+impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> IntoIterator for &'a List<T, ID> {
+    type IntoIter = Iter<'a, T, ID>;
+    type Item = ArcBorrow<'a, T>;
+
+    fn into_iter(self) -> Iter<'a, T, ID> {
+        self.iter()
+    }
+}
+
+/// An owning iterator into a [`List`].
+pub struct IntoIter<T: ?Sized + ListItem<ID>, const ID: u64 = 0> {
+    list: List<T, ID>,
+}
+
+impl<T: ?Sized + ListItem<ID>, const ID: u64> Iterator for IntoIter<T, ID> {
+    type Item = ListArc<T, ID>;
+
+    fn next(&mut self) -> Option<ListArc<T, ID>> {
+        self.list.pop_front()
+    }
+}
+
+impl<T: ?Sized + ListItem<ID>, const ID: u64> FusedIterator for IntoIter<T, ID> {}
+
+impl<T: ?Sized + ListItem<ID>, const ID: u64> DoubleEndedIterator for IntoIter<T, ID> {
+    fn next_back(&mut self) -> Option<ListArc<T, ID>> {
+        self.list.pop_back()
+    }
+}
+
+impl<T: ?Sized + ListItem<ID>, const ID: u64> IntoIterator for List<T, ID> {
+    type IntoIter = IntoIter<T, ID>;
+    type Item = ListArc<T, ID>;
+
+    fn into_iter(self) -> IntoIter<T, ID> {
+        IntoIter { list: self }
+    }
+}

-- 
2.46.0.rc2.264.g509ed76dc8-goog

