Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1211EF08A
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454499; cv=none; b=MPflyIRvHpVwhrvMf5SgGaZsInqGqpp4LOcxEnAItH7nMP8KvLeFDKW87rxnFfqpuR0p5ps8GtfLpkP/Gyl39SYOa6lQt6zwy0hjGcibj0eEIWvsDX19yH9MzCPOu75NlFcr96oEsGKTRttOD8rHFOPF5eNXj9Jpo4OzRoV3sKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454499; c=relaxed/simple;
	bh=QcvMePb01qsI3uDCbJIiUKFZQvo7bTT+ZxSEpObE9CA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rbv9Ovm/wk5RGoJ/QOgBgMcbuTsFt80WOrt3MhdryWWixdH4PiVLqTIfE486+2I+X/yJ4RPgECJqGH3ltcTPMISuqzHs44tSStDdODVZmFGh6t1P6+rpOlUdPAlMC1cFyDNqbZQo+XU/6sHVZY3NVFlUOjOjE0Fvl56iZoIdbu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mV2u46R/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mV2u46R/"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-436219070b4so26737595e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jan 2025 02:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737454496; x=1738059296; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9QT/leOgkzm+5YCLe0q+PoCNw1wR649abqBqykClqDg=;
        b=mV2u46R/yJmug6gkc8+KrR7Iij6ZZ7rTdh3A5hYVHVGvD/yZH4HJtSBIOKsZKSoX2y
         Ci4k07u2AEe6gr/vgIA6WIe2Lci6Iq4ruRcgxLA3dttnb5b4xQz/bCaMKINfbgyT0Oxm
         JUtwMWQoIEOKzUFqDRb9PJvRsQQuFnOdsbOsAFzJH7qoRXXibbm3vhX98eNE25mfL9xh
         7Ij4bdpSNRvEAc7hklZlKaHSZrJ6HpoBjoMXiLIaozECAh4nJ151R7J/A5BKQNSG5lCd
         bs69Ua1H3QVXnrClB4GEDZc5QGAn4zW1h8o5Jn5cHzshFqgJneJUL2fKOZpH/Qz4l7In
         Jc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454496; x=1738059296;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QT/leOgkzm+5YCLe0q+PoCNw1wR649abqBqykClqDg=;
        b=IFy3u9f3go9LLi2o/WFFmaW20iq2zNyW4kDk6gSmed8OVdJOy39S+kMVUyev+knMm/
         QmgudvvUcS46ULqBzq0oawdjBqoC73cD+1eO70bXj/HGLoAL72T8sSduieqTvxojyQSo
         gKHZZ7gGak6JUEUhJf94sJkZK5zpgz6bbZ1kd0ihEoXE1DSMeUWchYhLun6G85sSbE8G
         DidBMdmodgF7MOHK+cJFTOvGdl0kHkuvbxR323j8c/2BM4XLtCBwrJgCjT6qpA9Emsa1
         MZIxd763fznTJvT8ofVmncdX72lrJAWAgyuBHjgHEUWLBE7a2g54XGjUQ9czDJu2Chr/
         kjwg==
X-Forwarded-Encrypted: i=1; AJvYcCUmyyK7xnoefKVfEpd8PHCnxAlXfxnwIan8Y22O5Mqn68DP/u7pEvI9S1qfBGJs1hO2WxTg/8VMOQ6969iE8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFvJ7H23Xq8HGVecwaYNjAbKaVoeVhTxaRUuv1V4UthEfT/2SS
	BJQykCa5wsPKFxv0FvePBZHzpSjt1BZKKNUyCj1Ti0XcxhXn/rGi+NixxzkTQPgMEGs+ykwmbBL
	iMr/p2V/OZpwNlQ==
X-Google-Smtp-Source: AGHT+IGAUonogQFaQBQyAo/7xnuOYmVSLh876dgCFpC+TJFN3LLkuSlpp0Gdz/d57A82Abr9Ui+X2mDUkliYI3Y=
X-Received: from wmbe24.prod.google.com ([2002:a05:600c:5918:b0:436:7123:f80a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c21:b0:434:fd01:2e5f with SMTP id 5b1f17b1804b1-438914391bbmr161655435e9.29.1737454496385;
 Tue, 21 Jan 2025 02:14:56 -0800 (PST)
Date: Tue, 21 Jan 2025 10:14:23 +0000
In-Reply-To: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5148; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QcvMePb01qsI3uDCbJIiUKFZQvo7bTT+ZxSEpObE9CA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnj3OaZ7fiB0Cn8y/oE8RCThYSe73mEvafaqVKF
 jtF2Ulb0diJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ49zmgAKCRAEWL7uWMY5
 RhqqD/9uurj4xTaNFCDM699pbobOVw4NN+RkB+Xx+qLQgr+ru6XnIqfJqnsitee7LGQqaEhmtlO
 BfrZgbzNgf9eGkY3MemRA7ZA3EY+KBWAAMfYDKqbgsP8JDeKVqUutcaLggueNc/UuRiM/3Xbg5L
 XVWb5lIIRWZ+X9/3g9OciY8f8ihG1UrkT3KgbZlj3hWOfO0vLLTGb5FaX9K6V5owBgWpQBqZoM7
 EZqUniAid2MzE57ZnRSbq+/VVyWwWOS+UQPPSlEIXGJnCmM5DGbxoyIpBIT2Z+VTDD8qsGjwcCv
 HjD+W241r4OM5GHkmsDc7oak3XEauQEMFR7gy0RgFuJFB5QLvC6iubQW379SOXOpCkAlc8sgGRo
 2zX+fflk34UmtrG244FLSOa4VybaZ1if/AW8q13cD+l75+V/7K5zAymTS7EsA3V5msnUDjNeQnc
 8rF7rVbUTRJF7ABuFOvrFTMO4rwO1zRTA+VUbSbX6oCZAt6QXX1OKV1i5O1yVrd06hpgpv+tfoy
 j18+NNZWQE4gHxy2ADGZr16ZOwTWZqI7/IA7FVePdbNPjuaE0JnIL1JzV0XZn7/p4ntO54Nd/XK
 EXw3pg8APLqZCGleHiE6jjMjuxTIsRyo/ra1WPDI7ytSshejBEsuqiz11SUTZF9kvaPUxf0qXVD SsP7kaz1TxVffBA==
X-Mailer: b4 0.13.0
Message-ID: <20250121-cursor-between-v2-1-1b24cd377618@google.com>
Subject: [PATCH v2 1/2] rust: list: extract common code for insertion
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

