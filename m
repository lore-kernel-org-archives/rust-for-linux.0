Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE21448F2
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714989250; cv=none; b=X0NDwVsHHM1+RGJRzDYyAA9KGFvmU/PXmUWh1XhAetPvGpO9Kvjju/cUVs2SsYvg0tMm8rC9cgCSvfCBlbm/cXYiUTwpsuLUunjcXkWaBB+qA5zvg3xPyu1gSqa1J/832a9xcMxX6f30xJWW0Q86QnCTbVeYLmgDjibjjTZbgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714989250; c=relaxed/simple;
	bh=8K9lvD/I7hdBOtJBKpQy5+wPSZSIbLWW5XJdQOsddxI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hNIhz7SwlgqYGDmrFObcnrTCbNhdM7wPZKlc92I12paWVarRLzfliS77hg/egHvKdgXhs5SuVCTatyjXj8POOyYCWuryP51H0/MKXDvJrOZ4s98Bdgq2Ju5zXjEXotwtDAlNvA9kqK8yhjSQtfP6XrpL9BrnZtftb3bb71Aur/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r5s6YMPu; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r5s6YMPu"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de60321ce6cso3578251276.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714989247; x=1715594047; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezJm3dIadEEPgM9AdRrLvcNCS5JPWxEP25Hxucwcvt8=;
        b=r5s6YMPuJewDzHD1BPG11DPogD22jkgCA2aBwcG623xn9fNvkBMMGbJgw7enuQma6N
         iyluknt/cSX1TnyTDuLmYJQsecKh/pS8K/3p4mT/eE1GrC/SVxRN/AWBnloRdrwC3RTk
         WJg4/pIX3T2qjCPDzUCvzRFSIQd2OdgTEDhNj7bhHA9ntlJFZ4cOdk+AHfvG8pzFlzGg
         ZehbuXSsdni2M3+EsX480f7EJGMRGfWVcmo1cuEWUQ/hY1RZXBF5RkaE2Y7gBLYZ/nRh
         ja/ukwu5N9SRQ90PHPEhmTd88fJWRZ9XGHE8NcrwQE7WCNYfaFX1itwf6A+EBYdKf+2V
         UaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989247; x=1715594047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezJm3dIadEEPgM9AdRrLvcNCS5JPWxEP25Hxucwcvt8=;
        b=PhB5tVTFfvwJVIIpdIjkQsVGScv+KX14TCZZxmF8lKS/+MnPMpXpS/9kaybsSt2GL/
         43giLByzgoJHYoTKdEg/9FSS10CPj5w4HzDnyrxT6vEBYMXpoEaVauvJGvcZVexmmzFr
         UsUbouKaeag1rg0mOxm6c5KLgUAjt63EibHCLyoMWKGpcP3DdC74Y6fzqrq1f/uIRGVn
         TtSvYDgrQWZREwsxYEhxLn8fBhpcH5dR4LrOVGRbmQF4nmeoKCrzqWzO5qJHnQUk7d3/
         WDlBPJZq3zBtr2z7AVXs+t910uaoDdSJC7VeaSsA9l0edPJk1kF/o5o8OkN8s8q7tmOL
         d+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxXuY+FS4Fom8s6Fs5A4Kr8CxtuEZtNS4LINCOdBgrXyOEu5POEJpgGgcQbHsb6Ou1+12A7MFAzBv5TVjIQOhi8Xa2wvEPGnOe4YpX0fA=
X-Gm-Message-State: AOJu0YwKt6Nt5x5AjLbPXmwLedEO6j8CmPAyms5V3vqRc7usDU8c+OfJ
	lH2/el9ghqsrDpxFwH5h2asRs+KpFqxccUUhfhFFLdLMNbmQvVkfxj6iUWg2wc73hpEdxdOc2dS
	ezSFwkfx8jIV1wA==
X-Google-Smtp-Source: AGHT+IEBI67b/rlR/RdZhzJYKewslwa1JtIus+jos+eEpIsCwHVg5LbTZzENK6W+28QXdTWd3W+eYA2jlbLqs9g=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:c01:b0:de5:3003:4b7b with SMTP
 id fs1-20020a0569020c0100b00de530034b7bmr3531670ybb.1.1714989246988; Mon, 06
 May 2024 02:54:06 -0700 (PDT)
Date: Mon, 06 May 2024 09:53:28 +0000
In-Reply-To: <20240506-linked-list-v2-0-7b910840c91f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240506-linked-list-v2-0-7b910840c91f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5286; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8K9lvD/I7hdBOtJBKpQy5+wPSZSIbLWW5XJdQOsddxI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmOKimeotMCAb/jQAq50Zc0JLzfCpOkfdGvoLEt
 plupjKUheyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZjiopgAKCRAEWL7uWMY5
 RnZgEACvgLng6XYGSmoMrTF4EohLNct1liNo8X0AoAwOxEw+XDWef8P8u5iqebkPBEMRlcJQnwl
 vUSgi9vD9ImBMfgNvXk7x1gzlMxbrivvYY6lbmfVALcji5zSIyIoyFhlLQRcneOcjbGu0xJo9zG
 DY9Jet6bjWLt+17ebpFFO/DR2dF0sPBJceiFIR8DV/WD0HkgLr+A/Ezp3Db++zJullZpXt3pDF1
 QD5X96ylzPodZgt+EaTgY6ssA89o5kFyXTZsv9QYAk+YML9V0ghC9QU/7B0ax2DyGMRYLYZUQhF
 ynE80SaUDEsgIM2C3mBTxo9LO98iL+rhFXXmA8RULghlXhrOSCu/0JqE41utp9cHLxkQihto41M
 o8sINgaqu41MAsdW7JZAAUkHZc3mUnQ0hu5lUot7Fw78N8XR0CImErFJnB2TB+lih6vBJKdd5Ej
 UhhlPoJ4JioMccgnWlnpKFiyhEXsecNK/rwM8ziKinbJmkx+e3IGrTKKRPi6yoiPrYaULlddrj4
 Xe5L03V4gjX2Hs6uftmgPlIk0lcdHouMca6m5gUUOzoAhEOwrrEteLz29wMLuECi/Pghl8c92KU
 +2ldRgyWLB+tzIaFJIYnu5OMYOnvDbr4S7gbd482WsSWsDWNm2RGFPF06ZZp7DzqcJfYhbbkD11 lGSsBZrrc8cMU7Q==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240506-linked-list-v2-7-7b910840c91f@google.com>
Subject: [PATCH v2 7/9] rust: list: add cursor
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index e36afc7ee44a..641b434e3841 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -438,6 +438,20 @@ pub fn push_all_back(&mut self, other: &mut List<T, ID>) {
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
@@ -512,6 +526,74 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
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
2.45.0.rc1.225.g2a3ae87e7f-goog

