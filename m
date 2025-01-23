Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4720DD79
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630106; cv=none; b=dTi/M6+0WZ8VeJZl81+8d8QunbQK9jq3/DqzxbZVKOK08Cdzyx3VnpRxLoji2tbbD/GW443yZSh1L8La+clD0/85UxSu9izsBsKExA+Wu8UmON73fbQG6IwOHnzddsnrgvKCBa97ouqRmVm70wxQtMFeFqzouYI8nIOxGS0kopc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630106; c=relaxed/simple;
	bh=ttAjlADe2z9qvjo9BjzNh0c6cDOy6zkyaaJyDb6M7mE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EiLxJaB95mahxeg4zIHZH1gEBQ1lhRiJsCz7ffvFOIs4sauVyZBkOOC5XNVGm2FYyfjnIn6KPVPUDw6/H5syplOwMlBZga461Xr1Ju74TfW0Q67Gpd+8lGetyQP2lxYCrDsh3DGmRLrZNP7SXpR0PmCvkjCTrgctj9tjvppfzNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NzBjoqGK; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NzBjoqGK"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-385d6ee042eso560810f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737630103; x=1738234903; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+dndn/M1tpjjYj5fSrp/cB2j25FLB5R2IYqQNLwoLE8=;
        b=NzBjoqGK40bFjLOrKE49tcMhP+UjyhD9SHoUsohjQ+GlzCZB1eAbl+Li6JHdEsjSPr
         RxKKpyrqPI8+bEr42dTsJJqrTjHtHKGpmWy/WnEia5d/usWSfLo7GtoDlGyaL4XcDVvz
         WMTnedzOHlsgk/StOoeani2FKRYKZZmyrnIyl4IL7a5EEQ6DIkSRRPv+sEE2r1JWcmQ2
         J3ngy8SYVWidTYNEHfTKhUs8YMVduex3y5e0m9YesL2ftNXOUawX137Ad8Ot9+iNTdrd
         b19WGGAem7o/Qy9T389ASSCc46NemPb+Sf8VLS/MuYRl2Twkx77WMtHL+L3NLvKyrOlR
         BJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630103; x=1738234903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dndn/M1tpjjYj5fSrp/cB2j25FLB5R2IYqQNLwoLE8=;
        b=NzMms/KTg7YOWSw/AXscVOP1O/weDwBDoLpdAuahtcLp8wCaQNe2WBYdptEoze9IxU
         FyQG/SGLmjx/F9SaTvJDhC4ssEaVP4U7Qv40/fc96xL7iCid3GdLp9D84dvPyVgzQbWk
         1CSQb/plfYOmrP+hUovebMHVY64dxX45p0EWwnqFy5AXLd9i65W1aeuLI0A6RcFMD4Th
         azLqvHRhX0TDTjxGNsij5LzepTNlp1hVRP5bgqQs3WbUcMZhW4wNS5cdsxka8yxmVLab
         /p605MnVt6gJa+b5PjBa8s1liRUxWQL03zUhTiik66bCcXwIWGbZvc1Hktuslg2ATHHe
         U4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeoOW9Z+dSoxNYiiuUZCxn9w3RN149ZIbclf8KT9yR51iSIT4OK31qHS/4uGwjaI1cINrZjuRMf/s+xN182A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbeu01mbhBxyAtqNWs8el8/iMylcSDn+kAAXG/R0C08fYsCGKi
	KA2e6RhjAKQOqkg/X2NaePQHWhmP7rY5cBV8rdOdX8nCrZ6a7jKTi5SN/71Iz7xq4QNu5dhLlqe
	ij9lQQnDEc3RrGg==
X-Google-Smtp-Source: AGHT+IFcs1NysCk7NTXt1fPRf4X8MeFSRHghuPWe4NuWV9VPmxI5sbdWCwMoJN2N9m3N3ouEjegtdl3e3AGopJE=
X-Received: from wmo11.prod.google.com ([2002:a05:600c:230b:b0:434:fe2b:fea7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64a1:0:b0:385:f44a:a53 with SMTP id ffacd0b85a97d-38bf5655b07mr19847881f8f.4.1737630103125;
 Thu, 23 Jan 2025 03:01:43 -0800 (PST)
Date: Thu, 23 Jan 2025 11:01:08 +0000
In-Reply-To: <20250123-cursor-between-v4-0-cb06698db94c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250123-cursor-between-v4-0-cb06698db94c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5247; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ttAjlADe2z9qvjo9BjzNh0c6cDOy6zkyaaJyDb6M7mE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnkiGR9pgp4rz9AM9cR7S7X9DMcbuThaKSZozy0
 GzAVhD7tFOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ5IhkQAKCRAEWL7uWMY5
 RjVqD/91c9X6u2GDownNFNq7HuXmbGZP2azaKllUkWXG8Fwniz5/bNCPWopMNZ3occ9Ce71bKjw
 IDqDDTiA88XTTO5uSVm1izMiwjrM5GDxL1EXlV6yVEVkA0wcKlmoa8Z1Izj/6PehbfvCIOQn097
 Biebmwt6l34XOQBoLaDXzzzAjdl8AQdytQzQd0vtw2PVin+XRnu2F5FUnuT3993JGdg/ZQAF7d0
 HkPepBc+WIX6eSFx1D1ZsZ0DVH8v5HGMZMoJyLW02P84zajTPxxSjXHZO+OVDcsoMqOqUtEfsR2
 G3TVQ2/qr6jz0Rtmaope/DKKPyWnr/HvwzTSkIlgmpvfad9Kppo0ly/x+bzLsYtEbia3FDujAYa
 IlK4UochJXh0tYSJFWuOk2tsUbNVh6zI3tSpfu9JbU/gynYCwq36t9S5zh23xuIA7IXtK0SkpPX
 ZhRoPdElE3OrKt6D0wMdBrTJyZWmom8TWoqWRPv9/OhqRHv8CJSnQxRt/Ldde1LF9k4Mx5U+ppw
 BUjymF8KYgz1/XAIs1QmTGgIWr66zm7q5pGj9J76n7V+9sbG0WuElG61cG3cagzEzeWcjK5dvf8
 +eoNudGRBkL91SdXVhiX3YRMzEXfhv2jeyEJbhHjoSIMWB89/e8tfHXRDqGWakaagLF4U7eEWt1 cD4sKgtCLhCKqWw==
X-Mailer: b4 0.13.0
Message-ID: <20250123-cursor-between-v4-1-cb06698db94c@google.com>
Subject: [PATCH v4 1/2] rust: list: extract common code for insertion
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
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
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
2.48.1.262.g85cc9f2d1e-goog

