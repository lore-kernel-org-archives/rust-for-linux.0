Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459ED1B47DF
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112960; cv=none; b=URCa4p3kByQkIKPE2MhSQK28PQ53ngY3zXLxZoj5imocGaIVaSMq1gTaLthBsCEjg9DfnlKS/dp17MPiabWByK7k5NwfDC4kmNpORa6gdhCzC53moPPDSe8NYkL/mPFWXYvSFCIoAtcIEGh8viOnP/j2Qe1iCF+FzP8fb7bOoec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112960; c=relaxed/simple;
	bh=XUc7v1nO5kUdQAl7vZK4cJjjtrbiSJ6BexnC7Evs9nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6lHgiRVmeFWP8FmIfvJKphzwWp9XpSTsaLRZ5sXZsa8ENoEYJAS0VaYEsD5PHIg6WhKL/rkO7F5j5PZZjImRmzJyPPpx+E9TTUETCJqrDUjO2C7fd/GHNUYWbfUtVEUrgHHK+fkNE06T78Bmpy8QhPvnXGj43UzJc+05AgyY1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CWgjE/OX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CWgjE/OX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZPhE3XC9UV6OvChFdMEzQxeZVNAagRt/GzQJe2dQ8k=;
	b=CWgjE/OX491muEYLDMfI2ifl6psxqtcLApG3EdUq702jeiHL+N5xJPf+yi8cQLJanEpHqn
	PQPL9RmFQ7tS8wyTTOlU28PoxSyDr5DoTMha9SrYnT+eeZfyUs62LckUXq934b/vdTge1F
	PIjZdRtVw35Gpx9YTE15/4zhz2lx3Oc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-cT8fcQomN5yW8ffWcc3iBQ-1; Thu, 04 Jul 2024 13:09:16 -0400
X-MC-Unique: cT8fcQomN5yW8ffWcc3iBQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-424a5a5f024so5497845e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112955; x=1720717755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZPhE3XC9UV6OvChFdMEzQxeZVNAagRt/GzQJe2dQ8k=;
        b=qqZLgrcLGcNm0PGVmSup2O+owF5N8JFZhNjt2aO6+4wNCWnPiizzwsVxhkBkJRUGMY
         OVZiWnEdxdnStm7v1IPHVncrTBUA3+4YgKVYCbF330dfV5m64FdQ8j8kpajxhwVRcvGu
         gpaoO1dZIEqmRCDy6Cw3/4x8ABpRlDjo0nRKVCL9TjsiNyhfY2BugMYZjXjPf2wJM/k2
         yM+dj8SBD9oz2s+LV7ar5qVMDmpslWvkxtJumyqXPQnA8GiAFBEaPZ/rWXvGoPpTt/dM
         5LXp41aowoEShgmUIEqykdFU4jY8mAfGuVdMaU/ILUqTuwD8B5wHNBzWM7W1RzwudAbf
         AtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXok1YveQJqb0/Jp52bEkJo/7Cmrcof1qAHb49NWcr9ORGaRDScO2aAtOPYhI5ANgnQvoUEHpOjkQJo51PVm0U8MRyLiTqba1U+MS+We8=
X-Gm-Message-State: AOJu0Yxeut4/5ukFqkG0+RN6Z+PS9Kp+2D3Ei502Jc+8qqlgWXx7a+91
	WvpFueD6MvJFYVY+wnG8VQpi5gCTBhCAfMTQ2gQprGvwOacoZHR/ixGm2Rsu9pn9HXybytaj4oh
	xON22gLnBeZgn+PSsR+NNkjiouLuWJUeXQ8jS5K5BT6uG+I7TxbbUsjwTSzd48QyR
X-Received: by 2002:a7b:c8d4:0:b0:423:6b7:55eb with SMTP id 5b1f17b1804b1-4264a3e1d00mr19233225e9.14.1720112954940;
        Thu, 04 Jul 2024 10:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm7N1rZxpiePn941cG0nEN6av+LSSyouCyLUvG8v66AJo5NSOJhREMWyUxMtjj/QKi8dkOYQ==
X-Received: by 2002:a7b:c8d4:0:b0:423:6b7:55eb with SMTP id 5b1f17b1804b1-4264a3e1d00mr19232875e9.14.1720112954604;
        Thu, 04 Jul 2024 10:09:14 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d510bsm31761725e9.3.2024.07.04.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:09:14 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com
Cc: daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com,
	lina@asahilina.net,
	mcanal@igalia.com,
	zhiw@nvidia.com,
	acurrid@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	airlied@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 15/20] rust: alloc: implement `collect` for `IntoIter`
Date: Thu,  4 Jul 2024 19:06:43 +0200
Message-ID: <20240704170738.3621-16-dakr@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704170738.3621-1-dakr@redhat.com>
References: <20240704170738.3621-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Currently, we can't implement `FromIterator`. There are a couple of
issues with this trait in the kernel, namely:

  - Rust's specialization feature is unstable. This prevents us to
    optimze for the special case where `I::IntoIter` equals `KVec`'s
    `IntoIter` type.
  - We also can't use `I::IntoIter`'s type ID either to work around this,
    since `FromIterator` doesn't require this type to be `'static`.
  - `FromIterator::from_iter` does return `Self` instead of
    `Result<Self, AllocError>`, hence we can't properly handle allocation
    failures.
  - Neither `Iterator::collect` nor `FromIterator::from_iter` can handle
    additional allocation flags.

Instead, provide `IntoIter::collect`, such that we can at least convert
`IntoIter` into a `KVec` again.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc/kvec.rs | 83 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ece48930966e..463c8910c23c 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -2,7 +2,7 @@
 
 //! Implementation of [`KVec`].
 
-use super::{allocator::Kmalloc, AllocError, Allocator, Flags};
+use super::{allocator::Kmalloc, flags::*, AllocError, Allocator, Flags};
 use crate::types::Unique;
 use core::{
     fmt,
@@ -658,6 +658,87 @@ impl<T, A> IntoIter<T, A>
     fn as_raw_mut_slice(&mut self) -> *mut [T] {
         ptr::slice_from_raw_parts_mut(self.ptr, self.len)
     }
+
+    fn allocator(&self) -> &A {
+        &self.alloc
+    }
+
+    fn into_raw_parts(self) -> (*mut T, NonNull<T>, usize, usize, A) {
+        let me = ManuallyDrop::new(self);
+        let ptr = me.ptr;
+        let buf = me.buf;
+        let len = me.len;
+        let cap = me.cap;
+        let alloc = unsafe { ptr::read(me.allocator()) };
+        (ptr, buf, len, cap, alloc)
+    }
+
+    /// Same as `Iterator::collect` but specialized for `KVec`'s `IntoIter`.
+    ///
+    /// Currently, we can't implement `FromIterator`. There are a couple of issues with this trait
+    /// in the kernel, namely:
+    ///
+    /// - Rust's specialization feature is unstable. This prevents us to optimze for the special
+    ///   case where `I::IntoIter` equals `KVec`'s `IntoIter` type.
+    /// - We also can't use `I::IntoIter`'s type ID either to work around this, since `FromIterator`
+    ///   doesn't require this type to be `'static`.
+    /// - `FromIterator::from_iter` does return `Self` instead of `Result<Self, AllocError>`, hence
+    ///   we can't properly handle allocation failures.
+    /// - Neither `Iterator::collect` nor `FromIterator::from_iter` can handle additional allocation
+    ///   flags.
+    ///
+    /// Instead, provide `IntoIter::collect`, such that we can at least convert a `IntoIter` into a
+    /// `KVec` again.
+    ///
+    /// Note that `IntoIter::collect` doesn't require `Flags`, since it re-uses the existing backing
+    /// buffer. However, this backing buffer may be shrunk to the actual count of elements.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let v = kernel::kvec![1, 2, 3]?;
+    /// let mut it = v.into_iter();
+    ///
+    /// assert_eq!(it.next(), Some(1));
+    ///
+    /// let v = it.collect()?;
+    /// assert_eq!(v, [2, 3]);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn collect(self) -> Result<KVec<T, A>, AllocError> {
+        let (mut ptr, buf, len, mut cap, alloc) = self.into_raw_parts();
+        let has_advanced = ptr != buf.as_ptr();
+
+        if has_advanced {
+            // SAFETY: Copy the contents we have advanced to at the beginning of the buffer.
+            // `ptr` is guaranteed to be between `buf` and `buf.add(cap)` and `ptr.add(len)` is
+            // guaranteed to be smaller than `buf.add(cap)`.
+            unsafe { ptr::copy(ptr, buf.as_ptr(), len) };
+            ptr = buf.as_ptr();
+        }
+
+        // Do not allow for too much spare capacity.
+        if len < cap / 2 {
+            let layout = core::alloc::Layout::array::<T>(len).map_err(|_| AllocError)?;
+            // SAFETY: `ptr` points to the start of the backing buffer, `cap` is the capacity of
+            // the original `KVec` and `len` is guaranteed to be smaller than `cap`. Depending on
+            // `alloc` this operation may shrink the buffer or leaves it as it is.
+            ptr = unsafe {
+                alloc.realloc(ptr.cast(), KVec::<T>::buffer_size(cap)?, layout, GFP_KERNEL)
+            }?
+            .as_ptr()
+            .cast();
+            cap = len;
+        }
+
+        // SAFETY: If the iterator has been advanced, the advanced elements have been copied to
+        // the beginning of the buffer and `len` has been adjusted accordingly. `ptr` is guaranteed
+        // to point to the start of the backing buffer. `cap` is either the original capacity or,
+        // after shrinking the buffer, equal to `len`. `alloc` is guaranteed to be unchanged since
+        // `into_iter` has been called on the original `KVec`.
+        Ok(unsafe { KVec::from_raw_parts_alloc(ptr, len, cap, alloc) })
+    }
 }
 
 impl<T, A> Iterator for IntoIter<T, A>
-- 
2.45.2

