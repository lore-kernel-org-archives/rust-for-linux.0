Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C6A44999B
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781251; cv=none; b=uV8hawE19DNRJIob/YKytJlYfqACoZSAkZu6mmbywTv0AuDwi0exV/7a5WHwKUxC2iTiRUum6U8AfimUDTAYygdm3PrM0EKN5/rTJeIwFLxCyn/1P1aA1i4OkiIPgxmUbdBq4xBI4EUc6t0GLilTAiVjoC3r+v2ElWLU7OCj7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781251; c=relaxed/simple;
	bh=TxAHOCI8HJUxNpgz6gqiyVWfmmv2mcGTZ0IO7ZVFrak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MqY+pDm3DAnUJxxXbUW3/8D5d4GOgT3auy8WY/ofm0dw1VOI5TAqdOFa7PXqh9sTyBnporP+RlbTriquW+Xl/TO/ujcW4EtIBul4KtaJOMlIf8hd7//lzvflemfY9MItk/Qh4pegxt4Lb6ngJK/3TFg05qGF3o6maI9F21reD4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyd8kLhG; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyd8kLhG"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso2102107a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 07:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783781250; x=1784386050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjJHYEJ+238MY0pZ1amwdjykbr/wm4kFMSYEYUTKcek=;
        b=hyd8kLhGr6bAlZiqL7wsS/XhELDml6STsYliZyuYr6n/kFzDSjtE+/w93d0eqLi00L
         nv2Hj4KLVYAAxTsYzuPiFXXlrDU2s5aL1JFSfM2md6s1eEZmXOaQ68UVX38J9LLT1vN5
         2QAtQUOBfM6ZYMuplEaX3HqJmIbs1CtT89tF5zb+lh6qVI0NR6jb8q+3s8DRkvMDVVD9
         COvED4rJjp3JvahURSC0OVDni1AiLK0TnPQ3paHjfL6OnepTgl43JDLrT6ugj2w6MdOw
         iaKI1vp+4FJdSJ6zs+BXCm86Nc0WF6WvF9c0E00XMZscx+D96fq3kXc7PU0szKkkjvam
         VGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783781250; x=1784386050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjJHYEJ+238MY0pZ1amwdjykbr/wm4kFMSYEYUTKcek=;
        b=glwexfuIwGp9X4NF5fdOA8OqaG+TMoM0vpenVf6tdCbG5WJ0iu3hJwKdPFvKoSea8/
         JJg3UMcWeYjpb6hOe5ilssn5UTmKHERAzM2zfa9farwxFGyJTq/FTjdiv0Y2d0p8ZDSO
         V6hUHZLIrYdoHy1jljXAEfBkCpq87cGq4UnaCCUqB0mfQ/BQ/+PR7CcjFpuObulG5T1D
         NRgfbh9BAJ2kovtdE11aDye0f9lu62FeCoB7wMY48H7As4fqWaA3LaorPXRJxmj+F0b0
         0zAnHBhOoOKCsL/76YsEgfmpWdzuAlVG+tuDCwdrBMYsEY1hcwX7ivlei+3pW7fEMI2S
         OGoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsE4KoRDTrjI8OlqoMPFHtSlEIUmPU4FvFN6SB4NthPJ/fvzSrkBE4AUEGgX6t2a4wcpKCHBuV/Smdld/lOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypgiBdAO6UoeqVrp+S3JACABwwXdgRe9uCbzTIfXU7YX44QRCF
	2+OTUQfZ6tlOjBXPenJnUKEjZV1EetP+As4rc9NzaqCk4z4tcvcUW3M=
X-Gm-Gg: AfdE7cmJaXiQf5BY3t5uxF30kJR3MEhBuOKxJHPMRuqWdnIcw4XqZW6wW5/RP9D4ruG
	S19xKBBUT/xBKfy0qzA0jmad455PGcEoD8SnrUp52FvmdEvXd0cCzlX7pL9qxd4Ri9L5UC7zJgC
	JoWu8/pipOJwq+Z8ymHQ7PFNSppp4XKm5Gx7LSZ02aR3tqXBsMwM9W79oWjmW5ifxIbpr+Sm+c8
	ppQY9ARlvlCDFeJUBM5yUt848pmx9bzWmr1uiyWUvs0E2zUPtjH5cAMyUSa7C2FRDZlsGiaphTj
	dUqpKx62qLdQD3+qvAe0mSWhWh0Fv0vli3/62GbgnQBU4mnwfX0kDZPZXJLza5ZdlUCzf512ipo
	31H/OHAii6NXJzPJjAn5PcO79DYSG8WaopFs3DBFqUf8DJniFiZyfSEKdmWmc2RPSN8X/2zv8GB
	JoHHu/J4v+KulDEUMUpZih1s5JyJzjPO+ezRJd
X-Received: by 2002:a17:90b:4a4e:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-38dc77ee812mr3079624a91.24.1783781249545;
        Sat, 11 Jul 2026 07:47:29 -0700 (PDT)
Received: from HARICS-M-4G70.cisco.com ([2001:420:c0e0:1002::60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm55367633eec.27.2026.07.11.07.47.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 07:47:28 -0700 (PDT)
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
Date: Sat, 11 Jul 2026 20:17:21 +0530
Message-ID: <20260711144721.39185-1-harish.cs.ss24@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708175119.18051-1-harish.cs.ss24@gmail.com>
References: <20260708175119.18051-1-harish.cs.ss24@gmail.com>
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
