Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB3629C327
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 14:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781444; cv=none; b=gciLcjyBMhmiU8fblsf8mFSqfFVDKWuPTlvfW50NSJMfo1EFJbXjeeMGswcN79NaB/UC/n1ZvBkEB2D9FgqezDWHbp6/cNXkYzTu96XFY/QAhKe4SnLTJCV1X/n+w7xHja9SueecERf2hXyOydWX/sifszLsVjId4ci20nfJLI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781444; c=relaxed/simple;
	bh=TxAHOCI8HJUxNpgz6gqiyVWfmmv2mcGTZ0IO7ZVFrak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DR8JHjoek3kfwvjuiht01MrL6v2WHUVikUqEAmQI9m9BKNzjvUL22sOMMUBVV3iuJx2D6C3C2gqnzBf2P4nXpy9pLUc/O/Xzqe7hyQn7LOb/co3YZ7fpdf85q39VBQ3nINgC03RqPgggxtY6FH5/d2rZNPqteD2maF9Yda6T/xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipUz3N0p; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipUz3N0p"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381216921aaso2065210a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783781442; x=1784386242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjJHYEJ+238MY0pZ1amwdjykbr/wm4kFMSYEYUTKcek=;
        b=ipUz3N0pM4oOfF3iSIGEEvurSklAgDCsSFc9lbrWlKBmUD6Z6kRnZv4x1hEwTqqFdO
         dLILS7BcM4wlGq7W2DD0rc2QNrGOdoC0ZGL83dZmwgp6ybrCTtuv8LwTAt7OJVdG4M6a
         dcGFNO0bjvrQwbWlQIHcRX7mrn5iQWncv3UqHgCLIjoRPlJVaXbp1HgZ3SSJVQ1ZE9ef
         rEi3qxxUFzsMW7UaWt2MvvKQPK5TcwCoNSRveBxkNWXPjgjyoCKBdOx6bWzCSKNdqezu
         KHpyysOKhEpMzw9WKdBZY6dqXGqND/kQSKx1yQKytSGiMByYbL8a6GbLlaeQ9LPmEn8T
         7rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783781442; x=1784386242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjJHYEJ+238MY0pZ1amwdjykbr/wm4kFMSYEYUTKcek=;
        b=GwOfzpqZNV+WZvgWkrOjKaUyIn9uDL5RnEIyOWT2WrlsucNbFFKvj6CD1YXkXAjya/
         zefWpwZ4q5gKXAav1PjP0qEF9QSIhS7S9XJbI9L3vM40T1/vM4GFj8scAhg71zQXM7by
         NgVo73rvOKr7D3d5kG9yck9SY4+6/VUosZZlXyG3qP3F9T2d4tKsoU+D/28MTFiKDdJL
         W5AlcAOMlwtUoTtObf6+vPmTmt5ZQOlSbcpxPPEfAB6sMC2kxZKMCkjtFTt9YjHj94Rj
         AM74Wru1k/jGCCOMJ1KkpkZUSSMOzmKPCOrLQ/mOOySS+Po8sGdNUh1nLrpGF5Y4uryB
         BrOA==
X-Forwarded-Encrypted: i=1; AHgh+RoiVaBSYz8Mum17071JKnqP7ZN00Z8R9N6cFZeTpxqUy/C7BzpMv6J3jEMEU+/21frLHMzf2wcrKXy0nybryw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0haTcIjUMx7qGAtBckuvewBv6XgmtGupBk3EoazreiAP7rgdv
	6sLm+skYXpof7iyJaohs7QBsTWRbMQ1l2g2yxbF87U7pFF1SKWuDYNA=
X-Gm-Gg: AfdE7cllYKyfCs25ysLaW7mVFZr0NQKMo9H3LzM6UnR1m5VD5YJflL/b4wfbafR73p7
	nPj8+EcW6p75susiW88cCa5P04SXD51awLmMf3mAEK3tuqf7aCkTtU8vLWYX86oQGqfeZdO/QUm
	8U29FFE2EQBJurRZ5aJsrrE4H9UvYUnX1QCoYlLDRAe4i8olrYPSm4mBIQxGIarDnIwPiw6FUVf
	j6bzDiNAgBBjZfiFB/StXJbU5d1Q3FfRXf2XrH2lj0M/4Y85Mz4QYQjHz3y8tLwCBEO/J1+zA+r
	G0VvoDnXMbWL5GDtFzytJw3wqzaAbgvz9+DabmD3rfGXety0XzxKIcmMft7WxNwboAd6Z5qSLBs
	sYMyGP6Yep/nwBieL5s7RjddA8JGv94YJodGWLSH4kuwy9I7H2tB5RGAtftMUK0DXwPV6iLUamE
	eiEsHsGCq5r13SSrhqmUcu2sm+Mu0k1mXH+DxP
X-Received: by 2002:a17:90b:4a4b:b0:37f:e8d6:72c0 with SMTP id 98e67ed59e1d1-38dc73c3657mr3168007a91.1.1783781441952;
        Sat, 11 Jul 2026 07:50:41 -0700 (PDT)
Received: from HARICS-M-4G70.cisco.com ([2001:420:c0e0:1002::60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm42065865eec.20.2026.07.11.07.50.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 07:50:41 -0700 (PDT)
From: Harish C S <harish.cs.ss24@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	aliceryhl@google.com,
	lyude@redhat.com,
	daniel.almeida@collabora.com,
	work@onurozkan.dev,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	tamird@kernel.org,
	acourbot@nvidia.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: sync: improve `Arc` documentation links
Date: Sat, 11 Jul 2026 20:20:33 +0530
Message-ID: <20260711145033.39649-1-harish.cs.ss24@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Arc` documentation has a few mentions that do not follow the
surrounding style: a plain `Arc` without an intra-doc link and a
lower-case "arc".

Use intra-doc links for rustdoc references to `Arc` and spell internal
comments consistently as `Arc`, matching nearby docs.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1240
Signed-off-by: Harish C S <harish.cs.ss24@gmail.com>
---
Changes in v2:
- Use full name in the patch author and Signed-off-by trailer.

 rust/kernel/sync/arc.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 5ac4961b7cd2..76a153e01283 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -154,7 +154,7 @@ impl<T: ?Sized> ArcInner<T> {
     ///
     /// # Safety
     ///
-    /// `ptr` must have been returned by a previous call to [`Arc::into_raw`], and the `Arc` must
+    /// `ptr` must have been returned by a previous call to [`Arc::into_raw`], and the [`Arc`] must
     /// not yet have been destroyed.
     unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
         let refcount_layout = Layout::new::<Refcount>();
@@ -253,7 +253,7 @@ unsafe fn from_inner(inner: NonNull<ArcInner<T>>) -> Self {
 
     /// Convert the [`Arc`] into a raw pointer.
     ///
-    /// The raw pointer has ownership of the refcount that this Arc object owned.
+    /// The raw pointer has ownership of the refcount that this [`Arc`] object owned.
     pub fn into_raw(self) -> *const T {
         let ptr = self.ptr.as_ptr();
         core::mem::forget(self);
@@ -261,7 +261,7 @@ pub fn into_raw(self) -> *const T {
         unsafe { core::ptr::addr_of!((*ptr).data) }
     }
 
-    /// Return a raw pointer to the data in this arc.
+    /// Return a raw pointer to the data in this [`Arc`].
     pub fn as_ptr(this: &Self) -> *const T {
         let ptr = this.ptr.as_ptr();
 
@@ -305,7 +305,7 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
 
     /// Converts this [`Arc`] into a [`UniqueArc`], or destroys it if it is not unique.
     ///
-    /// When this destroys the `Arc`, it does so while properly avoiding races. This means that
+    /// When this destroys the [`Arc`], it does so while properly avoiding races. This means that
     /// this method will never call the destructor of the value.
     ///
     /// # Examples
@@ -345,11 +345,11 @@ pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
 
         // If the refcount reaches a non-zero value, then we have destroyed this `Arc` and will
         // return without further touching the `Arc`. If the refcount reaches zero, then there are
-        // no other arcs, and we can create a `UniqueArc`.
+        // no other `Arc`s, and we can create a `UniqueArc`.
         if refcount.dec_and_test() {
             refcount.set(1);
 
-            // INVARIANT: We own the only refcount to this arc, so we may create a `UniqueArc`. We
+            // INVARIANT: We own the only refcount to this `Arc`, so we may create a `UniqueArc`. We
             // must pin the `UniqueArc` because the values was previously in an `Arc`, and they pin
             // their values.
             Some(Pin::from(UniqueArc {
-- 
2.50.1 (Apple Git-155)
