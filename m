Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB92690EC
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533090; cv=none; b=H05XH85tbPenGNHvLpMyMfRn7MidRDlA7q7yW913toqaPSkcRSeh6WRE8BYMM79ppP2X6wRfNt2JA7l7Sn/PVEFom6C02rPDFPQyK2pcq673YxnEJaRwae04oKgJMlFhKAswSU8dmcrVeRCn2PG+2EbiZh6o2ZWsL1C80wVfIUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533090; c=relaxed/simple;
	bh=IpgvUANgAhfD6lZYzPF2w2u9gG68v73hlGQgOQNt358=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oA7o4f1BlXdAvQSzv3yv9Znm1XTyRbjcT0BJABmI1spEzXHZ9ZwcFDysJOTN4nVq0tcPSfEBM9bFWFCWgHCXuA7bYRut4sExve12zr63KQI1l7cZl8QRd9sBsDYnVRFL4G769cAloSj039jPKoTnh2vPBUN3fvxR6PMpR4irVxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU41JGJ5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU41JGJ5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698b6c87884so1679740a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 10:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783533087; x=1784137887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UjTZZD313ojYcs089TFb+HIC3d6T20qOffMkuqQnjpQ=;
        b=TU41JGJ5ZuDa2IIh5dWvaOF/Jcx46I1PfYXJiabs+gI4Rx/QZHEkaWCmeA7me1KPvz
         jDNA+IDZjd1w4DdZePsiIlZoegHvhsbf1cy+ijSr2iNBkOUVKDyAvpCOi5xKpX3AU3Qc
         o2DRz4sWRiqxsq3XEql5WyG5BTZJV6/rOvvtRr2bduSLZC+ifATu43SFpOpLcLl6yS7K
         RO0D736FAzbcnD1ZCywV8nsXvpiX6hp9KlpRKdwMtPVX4auwx4xEFqWfbZB3N2Ic9TvC
         laklVKi2ixWCxRgmkk3BUsaz9nNnnELBmGcImxvaWy9gx+Finm2CIX9vMkxNjB3nWULl
         aTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533087; x=1784137887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjTZZD313ojYcs089TFb+HIC3d6T20qOffMkuqQnjpQ=;
        b=FYo+nc7yXVnhpo+qB4WCcxYSDt9mlXh2YxzbQBfdbX/FjrtVNa8FTqaut5zvVkMfmX
         axhOm9UidXyio7g6l6RQsH6STuXe799Wdfi751XKZKl5JWOz+IH7hfA5R6dJ76FWGevL
         x9MWMK0ykNaxcMbgQuIti/n47obqazx1MNYLfFPwWfvbMlfhSX1/RRN1utoPcJEk+Lrb
         BM83Ki5IukuDORO81A+YqQCDgvmzW1uAVhq0tOrMd9IEwlDTYvYfNXMTyq4rTbwrVNZS
         diam4bRlAUE02raAY65AcmJOeEqJCM4v7Cm87OCaSPiQp/I2GBfcHu/zv6h57QsCRk9V
         zvCA==
X-Forwarded-Encrypted: i=1; AHgh+RpcauNdbdrXW04X3Rena3VW5ezk0/PRthYXlqZomU/kODz+YdATVuIi4+K6X1DPyrFlM+SzVa6W8YPut5yOvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3alC4G1wjnAOjV3nXp6ptF1zpjFOQyGFQQLbKkBAwKW8InO/b
	P0NCHlyr2CFGpMeNeCYq3+rPNY5ReN8SbmEojzYkKF7ONigYUNmSd7I=
X-Gm-Gg: AfdE7cmMQeYUHiknscOHdtKush7EYE32ZNqe5Qn3VPrKnIPM/5ZVV4qVxRvgJGoLvKk
	8cwteIekDN9p/OEsDZbhxA7RgAQjSMnSl0qWtgCglEgnMGa2Cp9DUUeEbEWN8MEr6c9pwvQDlyG
	Tm/0UPpPzRUq/zg3/qQz24NdZXUkfcUqAfF7rknRdsymaQP+S/yoXIPCvEG49yerUIVZ4lv635U
	qaGnXdz6RzKzZc2ugfGAfGGlQjYyujd60B2slLG4igOnLEbSVhA7SQihCHs1t6uLauuxRIiwMpA
	Vx06GV8VW+UeJ4WugWRYnhxfSKXcv/2UOkbS0f40Nj4s3adfrvExVDzBh+CDE+KyBBfKWhrjYkT
	hjHSm436gT0dNOYL//2iPHAPh2DAamDLrPCbd1Jdrc5Yd9bGkujIGvaBHVff8jJhHbgmMHpirdc
	aiSjAylv0o1DAD4NVmyJyhWQc6kVy/qbqKdEa/AZhoydGIAA==
X-Received: by 2002:a05:6402:3816:b0:69a:bfa:cb1c with SMTP id 4fb4d7f45d1cf-69ab44b42c0mr1721116a12.31.1783533087039;
        Wed, 08 Jul 2026 10:51:27 -0700 (PDT)
Received: from HARICS-M-4G70.cisco.com ([2001:420:c0c0:1002::7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3438323a12.29.2026.07.08.10.51.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:51:26 -0700 (PDT)
From: Harish-CS <harish.cs.ss24@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Harish-CS <harish.cs.ss24@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: sync: improve `Arc` documentation links
Date: Wed,  8 Jul 2026 23:21:19 +0530
Message-ID: <20260708175119.18051-1-harish.cs.ss24@gmail.com>
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
Signed-off-by: Harish-CS <harish.cs.ss24@gmail.com>
---
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

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.50.1 (Apple Git-155)

