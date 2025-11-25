Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A7F324714
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079205; cv=none; b=iYb7T/Eu1REkRu+PBKyUPwQkTZsMIh46YWiFjC1Fp3Klppqb8pyssZBdbtDuweSaGPx7/B+UYc8eGQRRamD47zBBTiIT282Du6lclA3U/YKEifQrjNHER3hScDAPYRXyeJzuy+rQ/Sr+mP0g/idnCpTTH8X3YG/Lucwp8LH7wrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079205; c=relaxed/simple;
	bh=H5sQlozQgdTviWcXpdsUawBLLbxV7JUv936dYiLlNyk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VkcYb+/tHmFLwkNd8muUgRzZJjHe1rI39OvFnsEGR875IYJmNgL/tJm3ev5bQBOihAhfLizjEyBElHa3qmlb9WFlRaCIWFErf5SSJpsVGdGU+a9YQULu1lO8w7nIWWV5LPkI+3Yskdt0+wZNF5NiVQZSuaxkgSnjknwbgdhbfNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dn/3CME0; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dn/3CME0"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b767784598dso366527766b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 06:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764079201; x=1764684001; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FGyrSjyLmW1aQxrJ0voWMyUBxAPU9xZJRGnfMgNjx+E=;
        b=dn/3CME0LnyXCiG5ssdDq7Qnb35Tog0pIgYO3306sioF+sF6SVym8/GDcfTIUrpgfZ
         5qMHAHJ3FBNheFiYvSWzrrIwIhcUm/1V7rn3ZolZeBQM3BfZa0bq28i3R1H/29hhDYWK
         xL5Oa3HKYFwuROpJYBAPO3GqBl3iTg7JriMly9sRio3Aq8Huj5wlvksftK2x8vPO/7Cs
         sSjO9GgnKdOV/gI97BvGowMR3ntGfXMM6Cms/lVTYMZ+Tdiw666S7+30HlSP9lcnUjmq
         muXVvfph9Y3ndCHimTzqrvWP+F1Ize7kzhm/xvCvE70aaZo0O6YLpEP+Mgu3ebFo5C56
         45Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079201; x=1764684001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGyrSjyLmW1aQxrJ0voWMyUBxAPU9xZJRGnfMgNjx+E=;
        b=A3fFyzGutJP0YalAoGGGfiwg/ZT5LLimhEuF+dJMyFGZMrPDdImu07b1NqAdYlORYn
         rz8BScZ/l2KVt/kc0jEW3OFzYrKk8CfSuMNRY+QDEKoOYcVUyQKkyXdOhyZ8GvwAjPKx
         PD/5pUJ/CRZpe1zBCASsFMCES0H0n09njFD0PuKCWLbV+OAw7FLMSz7GVUFVXMXpCYgf
         +JGMvBvAkmHJUav4POoqFRug/fZAoxJuBx8UGf7UWRzg2dEHxIr09PN4AScg09kZl9vH
         oaihfK1mZGiFuxHl0I9qfZHUlsQzPuJkuEpyiPV3dDhICp/1nm5UIO2/bWvJ8TNb64Ui
         bpzw==
X-Forwarded-Encrypted: i=1; AJvYcCWhxUCgNDy6VdXyTnrnAHc7p1hwd/uafPUyhg8//rHpaj7D7g5KLKMg9LOQEtrslOYmZtYKbn1bl/sNmrcg7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaznR5MrWtkQBNF90YbaEy1T3pOUWxGeHExHPpbGqNViqDTe8j
	YRYmDDpB2SGHp349NoabcaiyibttyevGJUiNZxacVXono0NJjUSvrf3gk3UfRGsVy4wSKeD6cPQ
	jMiLOzOXGqm+wkonkuA==
X-Google-Smtp-Source: AGHT+IEEAp8zbzW+oweQ62B2PauNM+6chBML5rrFj3kEC2Ce+RRKkoXiSkljEfXTQ11HO5U11MJwjzYkdTLISkc=
X-Received: from ejcrm13.prod.google.com ([2002:a17:907:6b0d:b0:b73:7130:3880])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72c6:b0:b73:8759:62f6 with SMTP id a640c23a62f3a-b7671a52051mr1832541666b.60.1764079201065;
 Tue, 25 Nov 2025 06:00:01 -0800 (PST)
Date: Tue, 25 Nov 2025 13:59:41 +0000
In-Reply-To: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4864; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=H5sQlozQgdTviWcXpdsUawBLLbxV7JUv936dYiLlNyk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpJbZYbcchNTH2JmYGWm49+hAseDKMgJBR+0DJh
 V8ZgkJLLCuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSW2WAAKCRAEWL7uWMY5
 RlwdD/4skWmtrLw53OsM6+KwIO1lo04b0MiJ2bN7l79IRUMlg8smzHpbVMxs5+/A9+8xqeTIDCW
 FcwOCWyit/4grQp+Ro8m0SQUYDdnRkZPbseaMobFgk3wikwy27fEpggFYhFCpbnAbyRu+yRMzuA
 PDlI/oKkm0i9kpJay78qpMRI6Mx1KZKSKqsDZx2LvJsms4sGijVDyN/k/HOqGuPXDi7K1sqgTdp
 FnhMDody9uEFiqJAnZDyEYfHJFHtUgFEH1RBwmj/WrpZx+JMRr7FJEZivDGzoKJvKBXPDNITRmk
 6pimRRxCNtx6Z7nkI8VuiqEU9Hd3lU0Lkm2SO2L09/KMvPE9fvziovCxpb9IUqQJLU6a+o+R9uL
 0udXYqc9sd5TwuScDiUReeBLwt14cjC4we5rqWdX7QstHZfWK9hvjT8yILNCW+qjO2w1CgYj4dE
 HHsstY0zFxu1J6KPsLwdkWfTZI1J3VLiNq4o/AZQ73fNQDd+re/FUdete13sv40tGYZep2zNA9T
 rfCD16asrIr11qumv6rcu3J8XkRFwGpv3FQ51x4sJvB7JHciJlIgFCCIbEGoIAA40N2oQLDzhII
 KSBqROZqnZVf+JH5I6Le9r9B+M3UUupMue4UuOxgYIkFH+rCQcTpxyYKN9f90IkMAdfeGDej8Eq usIOVn4mBARy7Ww==
X-Mailer: b4 0.14.2
Message-ID: <20251125-binder-bitmap-v6-5-dedaf1d05a98@google.com>
Subject: [PATCH v6 5/6] rust: id_pool: do not immediately acquire new ids
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When Rust Binder assigns a new ID, it performs various fallible
operations before it "commits" to actually using the new ID. To support
this pattern, change acquire_next_id() so that it does not immediately
call set_bit(), but instead returns an object that may be used to call
set_bit() later.

The UnusedId type holds a exclusive reference to the IdPool, so it's
guaranteed that nobody else can call find_unused_id() while the UnusedId
object is live.

Reviewed-by: Burak Emir <bqe@google.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/id_pool.rs | 75 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index 1adec2c6fdb0b80515f9b64c67218efa864ce580..a4c37d6a0971699d1ea42facc68aa3dd2b44a0ca 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -23,8 +23,8 @@
 /// Basic usage
 ///
 /// ```
-/// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
-/// use kernel::id_pool::IdPool;
+/// use kernel::alloc::AllocError;
+/// use kernel::id_pool::{IdPool, UnusedId};
 ///
 /// let mut pool = IdPool::with_capacity(64, GFP_KERNEL)?;
 /// for i in 0..64 {
@@ -32,13 +32,13 @@
 /// }
 ///
 /// pool.release_id(23);
-/// assert_eq!(23, pool.acquire_next_id(0).ok_or(ENOSPC)?);
+/// assert_eq!(23, pool.find_unused_id(0).ok_or(ENOSPC)?.acquire());
 ///
-/// assert_eq!(None, pool.acquire_next_id(0));  // time to realloc.
+/// assert!(pool.find_unused_id(0).is_none());  // time to realloc.
 /// let resizer = pool.grow_request().ok_or(ENOSPC)?.realloc(GFP_KERNEL)?;
 /// pool.grow(resizer);
 ///
-/// assert_eq!(pool.acquire_next_id(0), Some(64));
+/// assert_eq!(pool.find_unused_id(0).ok_or(ENOSPC)?.acquire(), 64);
 /// # Ok::<(), Error>(())
 /// ```
 ///
@@ -52,8 +52,8 @@
 /// fn get_id_maybe_realloc(guarded_pool: &SpinLock<IdPool>) -> Result<usize, AllocError> {
 ///     let mut pool = guarded_pool.lock();
 ///     loop {
-///         match pool.acquire_next_id(0) {
-///             Some(index) => return Ok(index),
+///         match pool.find_unused_id(0) {
+///             Some(index) => return Ok(index.acquire()),
 ///             None => {
 ///                 let alloc_request = pool.grow_request();
 ///                 drop(pool);
@@ -221,18 +221,18 @@ pub fn grow(&mut self, mut resizer: PoolResizer) {
         self.map = resizer.new;
     }
 
-    /// Acquires a new ID by finding and setting the next zero bit in the
-    /// bitmap.
+    /// Finds an unused ID in the bitmap.
     ///
     /// Upon success, returns its index. Otherwise, returns [`None`]
     /// to indicate that a [`Self::grow_request`] is needed.
     #[inline]
-    pub fn acquire_next_id(&mut self, offset: usize) -> Option<usize> {
-        let next_zero_bit = self.map.next_zero_bit(offset);
-        if let Some(nr) = next_zero_bit {
-            self.map.set_bit(nr);
-        }
-        next_zero_bit
+    #[must_use]
+    pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'_>> {
+        // INVARIANT: `next_zero_bit()` returns None or an integer less than `map.len()`
+        Some(UnusedId {
+            id: self.map.next_zero_bit(offset)?,
+            pool: self,
+        })
     }
 
     /// Releases an ID.
@@ -242,6 +242,51 @@ pub fn release_id(&mut self, id: usize) {
     }
 }
 
+/// Represents an unused id in an [`IdPool`].
+///
+/// # Invariants
+///
+/// The value of `id` is less than `pool.map.len()`.
+pub struct UnusedId<'pool> {
+    id: usize,
+    pool: &'pool mut IdPool,
+}
+
+impl<'pool> UnusedId<'pool> {
+    /// Get the unused id as an usize.
+    ///
+    /// Be aware that the id has not yet been acquired in the pool. The
+    /// [`acquire`] method must be called to prevent others from taking the id.
+    ///
+    /// [`acquire`]: UnusedId::acquire()
+    #[inline]
+    #[must_use]
+    pub fn as_usize(&self) -> usize {
+        self.id
+    }
+
+    /// Get the unused id as an u32.
+    ///
+    /// Be aware that the id has not yet been acquired in the pool. The
+    /// [`acquire`] method must be called to prevent others from taking the id.
+    ///
+    /// [`acquire`]: UnusedId::acquire()
+    #[inline]
+    #[must_use]
+    pub fn as_u32(&self) -> u32 {
+        // CAST: By the type invariants:
+        // `self.id < pool.map.len() <= BitmapVec::MAX_LEN = i32::MAX`.
+        self.id as u32
+    }
+
+    /// Acquire the unused id.
+    #[inline]
+    pub fn acquire(self) -> usize {
+        self.pool.map.set_bit(self.id);
+        self.id
+    }
+}
+
 impl Default for IdPool {
     #[inline]
     fn default() -> Self {

-- 
2.52.0.460.gd25c4c69ec-goog

