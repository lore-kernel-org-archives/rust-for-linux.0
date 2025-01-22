Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9B521421D
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737558046; cv=none; b=fS8avXvYH4bN08f/DEoYCRhT14KSipC5A4BC3qsP5pOSH2jcoCCARGRC2g2iCe290OlSAF2DfhyAJLO0nVZWuqs78BctG6sp9odNADhMzLT+bgX3E7qkdzvW9iA63qwaywRQmzGuieVboFXLrVVU3rvwL2+iKHZYmA9W+CrkZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737558046; c=relaxed/simple;
	bh=07KvXWwT9X3FUu26PatafcUnUgdiuPCMqiW6FbaREys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qS5zV2lnjKanKE3M7APgOcAJnSDTEQaSKaHstUCySGqV07x6kwy3XLPJaTRyTsJPGldMPxACP+VMbXRUN95MAY5k9KjP/+jtwOUHt8PXZJA1i63wPOuI3X0y6r3cyACeR+KZJQ3bATJF2/pGIVUYg1J3/gDsAYyvlNYzi06QBDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qt+mve1b; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qt+mve1b"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-436723db6c4so51411025e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 07:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737558042; x=1738162842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2jyo6F2nIPEWze5+hxsh8zUD5pqGsM2SbdyCSmT9fA=;
        b=Qt+mve1bAHuOOhMxMp1HwaJaeIRaVWlJgfY0Oh7AurSGyoTw5lWvmrrKEscf+Zy1Fx
         w6WAyxoZCIMFtJPDKDCIbpczz3ORkOdlNY3xKc21k49lqRmOdbf8314q1GJht9c0nKSz
         Ku6VWI1Sf8EyLHl83obKKyZ5rOH3a2UsdcM9vdG7ybo8OjTPjXzXv1onm6O0+6qSRRlR
         cuYlrbf/iJKkNh+QUEgzO+Q6l4SesJVSSLo9oGxMvdNqKX+rEDzphmGqgkoqVrsSxR31
         BEg7AXzNL7gv6L6DA+EeKNn9QVyjSoNDwFZjuWfDMMt+5pqnNrwN0DLpBxG8XlKDW6Qf
         vqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737558042; x=1738162842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2jyo6F2nIPEWze5+hxsh8zUD5pqGsM2SbdyCSmT9fA=;
        b=L26ocQ/yayzVQ46TO4BM+ce+YmpaLscMQCHtNvaKWyz/x2W4/OgR78Aag7bEhO77Gf
         c9KhvUGVtaY21b6k/PKUd727aKpVy/xYrGmmAtZpO6WQ9Ci4kDX/brelylnREPpxm8xx
         w9Yt/kCIpxF24ezk+iIBXZEQTF2d57Nurcy0H/nM9Q1KDchVsdqyZsM99loMNUC7kisC
         9f/cyU9dzdNHlgysiN+PPIKhlP+gpb9unLupXbLGOyg6d/w/bTEdvUSR8lwiBmA9b3To
         t89wqg7V85luK9acXOBok2Il/tVSjTFvdz/Pe7Jfyr9JmFy6JXiSVLeiRUKOVYampdAx
         taiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbltqFWf0fPolVxyxvQiYzQPd50qP1p/VX16bWUWJN8G8lMsUHFYFuQRTGWnekl+jT9pHJPgeM3H4Scb1BrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgUjXnNSTHZflzu4Jbn/K2fbG8BVg9jT6weyu7zoEXvh9D0Su9
	bVFzqfk8lOy84d1CSS/JbaYsN6c0be6Enm6TwwWhzB1DCu3ZmCPSbplwIbue5KT+lc/QKmT5JP+
	Pbp8SipScuTEoIQ==
X-Google-Smtp-Source: AGHT+IEoWiIvAlur5jxITETpHeyb+Ehmgm5n8/TjIJE2NU/IWIuxFg+LEF2EiOqPe3lJLQGAZZ8AeRlDx5OgsfU=
X-Received: from wmbjx7.prod.google.com ([2002:a05:600c:5787:b0:435:4bd2:1dcd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1d:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-4389141c211mr177008575e9.24.1737558041903;
 Wed, 22 Jan 2025 07:00:41 -0800 (PST)
Date: Wed, 22 Jan 2025 15:00:17 +0000
In-Reply-To: <20250122-cursor-between-v3-0-aaafbd8af14d@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250122-cursor-between-v3-0-aaafbd8af14d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5203; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=07KvXWwT9X3FUu26PatafcUnUgdiuPCMqiW6FbaREys=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnkQgUK6HVjT1u9zVRNmfzxMwNEZjwekmFbdMeS
 81uEKFZZqWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5EIFAAKCRAEWL7uWMY5
 RgjjD/0RuCjox/EbkI2wszt67IkPXUKJZ2PNDPNzfx7H0DPxjhkyGQJ1JK2QP8J+KqPDQ/iygvg
 BUkomVcUP1Dm+G8ZCpZnNbaiLw9jsd3FiaGhd3c+IvNSNEhi68JufIAAbcd7F6w7hFo6ZQBYonJ
 bDAWIKnoA8u4umKJZJ7MqcjqIxTMWIkxaSF3B2i5tbibzUUvmusPs9gFhDL7MBHyEUgfD3PrUkr
 Uox5wc86exgdeac4V44bsSAXTkwgtJvO0AGhecglkTOLeFQdXgI8AWo8SlRsJDVAbuMeqFIBvW1
 MoOZ2wYvJmwyI0LJLhE2iWkazFZ1wIAfImKO12JHM4AcpUDiVl55GAb4qG6tTuS2x6iwQ71S8jE
 hPt2GHsIQs+wL7T19g/yC3aB5cIFpZrLTv8rtlKSW/bdy8gjTZrPRnM53ZYqNJDGbuwYra+o3ML
 jSPPtbdHXwvu2fXoBS5lYbcUs62veCqCJeb88b8JCx06dwp9pyxbSQRw4JKk5XK4Se3VNt6wPY5
 7kKNotXyKzftjqTOAB74XDO654/Gbebhr4RBmrvvVD5/6gnu3zOA+tlZs6HoIRkrAY+mvl4S8Vh
 26t95FNgIAVoutRludhizKsva3qrdRuTNTCBQmGZbapJddCxCxLk05NQemKCgfX9z6ODzEYyJ52 orkhBsR1M42hUsQ==
X-Mailer: b4 0.13.0
Message-ID: <20250122-cursor-between-v3-1-aaafbd8af14d@google.com>
Subject: [PATCH v3 1/2] rust: list: extract common code for insertion
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To prepare for a new cursor API that has the ability to insert elements
into the list, extract the common code needed for this operation into a
new `insert_inner` method.

Both `push_back` and `push_front` are updated to use the new function.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/list.rs | 70 ++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index fb93330f4af4..97b3599b7207 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -245,8 +245,20 @@ pub fn is_empty(&self) -> bool {
         self.first.is_null()
     }
 
-    /// Add the provided item to the back of the list.
-    pub fn push_back(&mut self, item: ListArc<T, ID>) {
+    /// Inserts `item` before `next` in the cycle.
+    ///
+    /// Returns a pointer to the newly inserted element. Never changes `self.first` unless the list
+    /// is empty.
+    ///
+    /// # Safety
+    ///
+    /// * `next` must be an element in this list or null.
+    /// * if `next` is null, then the list must be empty.
+    unsafe fn insert_inner(
+        &mut self,
+        item: ListArc<T, ID>,
+        next: *mut ListLinksFields,
+    ) -> *mut ListLinksFields {
         let raw_item = ListArc::into_raw(item);
         // SAFETY:
         // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
@@ -259,16 +271,16 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
         // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
         let item = unsafe { ListLinks::fields(list_links) };
 
-        if self.first.is_null() {
-            self.first = item;
+        // Check if the list is empty.
+        if next.is_null() {
             // SAFETY: The caller just gave us ownership of these fields.
             // INVARIANT: A linked list with one item should be cyclic.
             unsafe {
                 (*item).next = item;
                 (*item).prev = item;
             }
+            self.first = item;
         } else {
-            let next = self.first;
             // SAFETY: By the type invariant, this pointer is valid or null. We just checked that
             // it's not null, so it must be valid.
             let prev = unsafe { (*next).prev };
@@ -282,45 +294,27 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
                 (*next).prev = item;
             }
         }
+
+        item
+    }
+
+    /// Add the provided item to the back of the list.
+    pub fn push_back(&mut self, item: ListArc<T, ID>) {
+        // SAFETY:
+        // * `self.first` is null or in the list.
+        // * `self.first` is only null if the list is empty.
+        unsafe { self.insert_inner(item, self.first) };
     }
 
     /// Add the provided item to the front of the list.
     pub fn push_front(&mut self, item: ListArc<T, ID>) {
-        let raw_item = ListArc::into_raw(item);
         // SAFETY:
-        // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
-        // * If this requirement is violated, then the previous caller of `prepare_to_insert`
-        //   violated the safety requirement that they can't give up ownership of the `ListArc`
-        //   until they call `post_remove`.
-        // * We own the `ListArc`.
-        // * Removing items] from this list is always done using `remove_internal_inner`, which
-        //   calls `post_remove` before giving up ownership.
-        let list_links = unsafe { T::prepare_to_insert(raw_item) };
-        // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
-        let item = unsafe { ListLinks::fields(list_links) };
+        // * `self.first` is null or in the list.
+        // * `self.first` is only null if the list is empty.
+        let new_elem = unsafe { self.insert_inner(item, self.first) };
 
-        if self.first.is_null() {
-            // SAFETY: The caller just gave us ownership of these fields.
-            // INVARIANT: A linked list with one item should be cyclic.
-            unsafe {
-                (*item).next = item;
-                (*item).prev = item;
-            }
-        } else {
-            let next = self.first;
-            // SAFETY: We just checked that `next` is non-null.
-            let prev = unsafe { (*next).prev };
-            // SAFETY: Pointers in a linked list are never dangling, and the caller just gave us
-            // ownership of the fields on `item`.
-            // INVARIANT: This correctly inserts `item` between `prev` and `next`.
-            unsafe {
-                (*item).next = next;
-                (*item).prev = prev;
-                (*prev).next = item;
-                (*next).prev = item;
-            }
-        }
-        self.first = item;
+        // INVARIANT: `new_elem` is in the list because we just inserted it.
+        self.first = new_elem;
     }
 
     /// Removes the last item from this list.

-- 
2.48.0.rc2.279.g1de40edade-goog

