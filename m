Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAEE21C182
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722952791; cv=none; b=b+h0jjyu6Ycauh6dahdPa6ELwTEop1DcKzgox94Gy2/YpjmV88IBhrR5OvfR1X+JROkFsAATtFpSxuXCALj9E7j8/4tvDMYMfet74LfjECrRQjhkXzXsU78auvpzcRR3ncOZismufUPAxiaRmskLqDEs2VycFc0mKUYYvLdhQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722952791; c=relaxed/simple;
	bh=U1OnWrBrlP25BFBpzAVCMr4UKIx3mPzoMhcGTN/whpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FHZgzCOVoDWU+cN6eXu3v6MWWAmOfnx1vSz3llpcwXaiMFrBSK0p4WsxzWGIGGBbZXNEDc/I5jsiJUhkZko5wxHSeRoomutmkm+8QJdWj1dkR3DgKwJsXlIEqe/wxWUyNSNrJrc88r6KQweFZoxXEgsVNQF/oROR0toQfdXzzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kM/xj0Fz; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kM/xj0Fz"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3687529b63fso400486f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722952787; x=1723557587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JZA3G4fqGlTDhQpwTk3AIW/gAya/39uBmQnmVK3DEuM=;
        b=kM/xj0FzW7fPFD62FlnNCDSEoOI6Xdm+nriltfgIEU40rDJqAUHdV7h4CzC6UjfQE6
         tcovJNvxY6aVELpuOb5yJY9/fVVvMwPLofQw/s4jP6QLuJqd+5dx0b5ctiw0jmQycMB1
         97knkNfHNgu8v5uvMx9bmteoJB+pK2t6J3AwMLnjT+8tlW/cnFyiLW6oRfEQVY6GAC1B
         AMEW1ygG760ZDaSdwJxh/X+CkOaKJNvjQnk3iDAxZNl3ucwOk1g8JXMPwAj4YZ/8sLYr
         Mz/ZFZBQEUAMhrTKK0WGdMdxnLYDS4AGCGXn8lO11O/U8NOeZi1Vk9FDD/C37HmR5EdV
         0FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722952787; x=1723557587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZA3G4fqGlTDhQpwTk3AIW/gAya/39uBmQnmVK3DEuM=;
        b=wUIAKmmqQzJtVFMu+RdY9hlQkqFRDGI13p/+adhoVOF5JIOtb2eqggWP8cMoeT8atO
         DozQeRktGUqeOau6XYxCz2DkCYB2AeK313L5Y88IQJJQJpxOR7OEOjg5g2OLI5IHGA7k
         s7ULCI/L76CrZML/4p9wdAO7XceN25P0KmuNOCFD8ruXjnS6aGJ1K7aBkMq6MQBxGQCb
         3LRi2+tL54cFsvJWryxwSRqc4wkvPqcKg5ssfrhgIHuAXWRcu+uwCzAR9wVYpvzIwueh
         2q2U87sDyzztT+sA++xmUKWpdxp7IvFnRGj+rn6iTcJRhFUgPSK+RMA49JX147bjcOdW
         RdhA==
X-Forwarded-Encrypted: i=1; AJvYcCVLAcnWy3pVYG6gPAYOFaOc3e8W7mHMKHdGKMB3wlVYpzNROr+VWzPnpe3f5nUJIASYKE2EaYiBxeaCfEq95hEmmiZefawcxbkiUYcerYI=
X-Gm-Message-State: AOJu0YwfbOSXmH+IEwgcJpl6HjuiHd5kTO5P1/pICF3MnRfIJwO8Nk1/
	dr4QgrqknYj+E2dt0HeiipZdW6aQOaqGUu+C5rg/32KeYxxmFRTHvFPC+HAQuUlMIOMxtQW+SMn
	RCppOW+jwST8r9A==
X-Google-Smtp-Source: AGHT+IFUqpa4kYAE0Jai9LGsZ0iw7NZR2G2lA87l7DR81DoK1l123eiFEiwOmx62rjwtr4W8x+V71Okc703Z0nc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6000:d91:b0:366:e9fa:36e with SMTP
 id ffacd0b85a97d-36bbc189d6cmr19674f8f.10.1722952787295; Tue, 06 Aug 2024
 06:59:47 -0700 (PDT)
Date: Tue, 06 Aug 2024 13:59:00 +0000
In-Reply-To: <20240806-linked-list-v4-0-23efc510ec92@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806-linked-list-v4-0-23efc510ec92@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5338; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=U1OnWrBrlP25BFBpzAVCMr4UKIx3mPzoMhcGTN/whpk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmsiw7q/7R3ylIYLWLyhQ0XS4gH2HMmHo5fhP7t
 gxuqwODVoeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrIsOwAKCRAEWL7uWMY5
 RjaEEACX6cOLmwlkrkiRLI3de7L2WvmTFxaR2EO3aLbIt+2BXuKyjikAESx3gX00+bqSGdO9INF
 3gl6+2zERiaD9v/wVpktV45bSQNEfT+cmGxU883lU6mTYwd6XKxIfwtIvsyDnMCqsOKtov1zFXP
 GBM7XAKs8RVfTZv/4hzIo7WG+zp81Y6xRi99/Z9C4yzffrQ+BET+IlssD3eaIzwZFbxDmYE35VJ
 1eH6WsU6cyVsnfbqZxkio+Wkfsd1SlB3IPs8/FiJjQy4NEutHCoq43KPcrRoDQeMk962OmzU5b/
 DS5UwUrAjJ1qcM20g6Nuls5DA+hjWP8GnHeJudq6Tx3WHMud3OLw8qCflWBPdxUKBBCqI/BWAVW
 XZMfUYgFgce9XnGc5kfVqBZkkT50t5NCTPU6oYdb0IP1ywmPlHHFZTwaKlmoE1x58Gu3qHDtpIT
 ksjDl+EdgUZwUPYcJusw18taaktSy3cGkI0tORjkatxPsg/zvZbIt/NdyTpFpqhC3b558xMRiSZ
 2oYdM1y5cDPhf4ifBgA8IqtqjObEVufHrjdzACMQ8P4nzf9VxIBDsquOFCG2yndyybC0a+TdCbc
 ogQF9KBOwY6gwLeIZ0Y4ek8VTjsaNT1PE/+uDtPHSG+1AzsA2PWFOD4TnMGzk3rCOHtFMB80r/B cRqyBJP6oGfCphw==
X-Mailer: b4 0.13.0
Message-ID: <20240806-linked-list-v4-8-23efc510ec92@google.com>
Subject: [PATCH v4 08/10] rust: list: add cursor
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
2.46.0.rc2.264.g509ed76dc8-goog

