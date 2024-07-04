Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15EC1CF3FD
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112968; cv=none; b=iFbKWpB9Ya1WDVTgsiRzNW/kkt0GX/h7UdKHYYo/3EiJSraxsfpnCoIkXPh9pT0JMI8evm2nZQvdyV/tAG5iDwbR3O488lQiELOoxsTqU430k5rhoN7SXKQWkF/AzGFegciuALhEt0ABe8l2gW8EWFu5GExRbGd/9Q93ofDl4Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112968; c=relaxed/simple;
	bh=unZd8SNo4EyBPZwAOYtJ6SCq7DPMNM2ujfeIqLeIoPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfdsyEdBckRr2JxCanKMiG9iHUGtcqAyVTEI4U3PQ/Qo9fckkjxYYEXjHL1od32xUbYTNhhOxKjisfPzEJnSbhC9Uf0soUfa3cz4ZWrpKw2JjsUmAaSaafaxP+Q7RCOIY7fBq9D+78SiKtWF6lsUgC2nKIYtR8+kI6nLC0nAJDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DtJ4YW1M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DtJ4YW1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0CT3DkkY+yNqCNHJuyWLBFD/Y9xzpFr8fJwqHRElVo=;
	b=DtJ4YW1MzEPM0aX0pP1pvnioJJrJMblkBy1XxDrDe1QXeGwn1vc8QlqXRLATCEXDRrYGmX
	n5TCCiYDlH0rvAbGJtOO0hm+W5iCYsT5cppkgae25rDHkhbuWlc/WkQPrwk6jXXQ1jxQ0F
	a8BA1sVXtSBnB7AZPwR210aeRQS+2kQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-d9EQmyE8NJiDrjCP0ZWUFA-1; Thu, 04 Jul 2024 13:09:24 -0400
X-MC-Unique: d9EQmyE8NJiDrjCP0ZWUFA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4256718144dso8258495e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112963; x=1720717763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0CT3DkkY+yNqCNHJuyWLBFD/Y9xzpFr8fJwqHRElVo=;
        b=Bh0SHgw/kQYBYGKhEZcIJ76i6Q94zF1yB6P+5grNwoucjJCNqHJWSqt9BhzDO6893Y
         aFZqeHjNk34/tCXOa6MCjK5cRCuPmOuIB68MLU2mM8ZV6ec5l8RD3PvWMhGrlOuikFwP
         0yCldlHIEfUHxglhClHUGYeDwwzk7xfyWLZLWUUP7YCw/9KNxoa5r5+TVhh5nR9kyvtz
         FOTH/PZHfvQnq0Z6i9Kds6E+BfZ/W5q9xSKLmgixrUSEfKqfBw0BH7Jh/EuhOBkDpY7N
         KadQNLDqgcydHqPyrjB/45pmZnfhEhfihNKhrUEh2xHR0SpaUBN9eP1l+VLoh76cXzPw
         TVAg==
X-Forwarded-Encrypted: i=1; AJvYcCU9acJOBh0XwapS9eh+7muqUMlAdb7d9lBaQM2+lZXTW+bqWF5IQyZb4lQSgJ+0zIC+1/dx5/7+ICGZLDjzyuIxgZEXbTjKRZ+z3IVigk8=
X-Gm-Message-State: AOJu0Yy7pcfmHvE2AtqFJmbB27n2ESuKNbw4c8CzXmugzwACoG6ojUxd
	twB42AEvXWh4y9wg/BActeGv/gP9/pMixEPBfMdi3ec8P72itOuC6uPelht3PHC0II2f7mlTwL6
	3fL2WmQM6KXjRZtNl9nPM6An7jJii7vFIstMBHIwvTs4CZKV2Psyiqrtwy7FwpruQUTV+AYWu
X-Received: by 2002:a05:600c:12d2:b0:425:73ba:e012 with SMTP id 5b1f17b1804b1-4264a3bc309mr19751745e9.7.1720112963002;
        Thu, 04 Jul 2024 10:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfh6LXgR2Un18etB/U4D4xFPGKtOmoSHMl3k9SXFcepz5JY5ESDnz4WGx8qOXEK4Bv7oGh0Q==
X-Received: by 2002:a05:600c:12d2:b0:425:73ba:e012 with SMTP id 5b1f17b1804b1-4264a3bc309mr19751375e9.7.1720112962569;
        Thu, 04 Jul 2024 10:09:22 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2fc8bcsm30974125e9.44.2024.07.04.10.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:09:22 -0700 (PDT)
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
Subject: [PATCH 17/20] rust: alloc: remove `VecExt` extension
Date: Thu,  4 Jul 2024 19:06:45 +0200
Message-ID: <20240704170738.3621-18-dakr@redhat.com>
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

Now that all existing `Vec` users were moved to `KVec`, remove the
`VecExt` extension.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc.rs         |   1 -
 rust/kernel/alloc/vec_ext.rs | 185 -----------------------------------
 rust/kernel/prelude.rs       |   5 +-
 3 files changed, 1 insertion(+), 190 deletions(-)
 delete mode 100644 rust/kernel/alloc/vec_ext.rs

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index e6a5d65e0c48..178f556aa7b0 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -6,7 +6,6 @@
 pub mod allocator;
 pub mod kbox;
 pub mod kvec;
-pub mod vec_ext;
 
 #[cfg(any(test, testlib))]
 pub mod allocator_test;
diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
deleted file mode 100644
index bf277976ed38..000000000000
--- a/rust/kernel/alloc/vec_ext.rs
+++ /dev/null
@@ -1,185 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! Extensions to [`Vec`] for fallible allocations.
-
-use super::{AllocError, Flags};
-use alloc::vec::Vec;
-use core::ptr;
-
-/// Extensions to [`Vec`].
-pub trait VecExt<T>: Sized {
-    /// Creates a new [`Vec`] instance with at least the given capacity.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// let v = Vec::<u32>::with_capacity(20, GFP_KERNEL)?;
-    ///
-    /// assert!(v.capacity() >= 20);
-    /// # Ok::<(), Error>(())
-    /// ```
-    fn with_capacity(capacity: usize, flags: Flags) -> Result<Self, AllocError>;
-
-    /// Appends an element to the back of the [`Vec`] instance.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// let mut v = Vec::new();
-    /// v.push(1, GFP_KERNEL)?;
-    /// assert_eq!(&v, &[1]);
-    ///
-    /// v.push(2, GFP_KERNEL)?;
-    /// assert_eq!(&v, &[1, 2]);
-    /// # Ok::<(), Error>(())
-    /// ```
-    fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError>;
-
-    /// Pushes clones of the elements of slice into the [`Vec`] instance.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// let mut v = Vec::new();
-    /// v.push(1, GFP_KERNEL)?;
-    ///
-    /// v.extend_from_slice(&[20, 30, 40], GFP_KERNEL)?;
-    /// assert_eq!(&v, &[1, 20, 30, 40]);
-    ///
-    /// v.extend_from_slice(&[50, 60], GFP_KERNEL)?;
-    /// assert_eq!(&v, &[1, 20, 30, 40, 50, 60]);
-    /// # Ok::<(), Error>(())
-    /// ```
-    fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocError>
-    where
-        T: Clone;
-
-    /// Ensures that the capacity exceeds the length by at least `additional` elements.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// let mut v = Vec::new();
-    /// v.push(1, GFP_KERNEL)?;
-    ///
-    /// v.reserve(10, GFP_KERNEL)?;
-    /// let cap = v.capacity();
-    /// assert!(cap >= 10);
-    ///
-    /// v.reserve(10, GFP_KERNEL)?;
-    /// let new_cap = v.capacity();
-    /// assert_eq!(new_cap, cap);
-    ///
-    /// # Ok::<(), Error>(())
-    /// ```
-    fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>;
-}
-
-impl<T> VecExt<T> for Vec<T> {
-    fn with_capacity(capacity: usize, flags: Flags) -> Result<Self, AllocError> {
-        let mut v = Vec::new();
-        <Self as VecExt<_>>::reserve(&mut v, capacity, flags)?;
-        Ok(v)
-    }
-
-    fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
-        <Self as VecExt<_>>::reserve(self, 1, flags)?;
-        let s = self.spare_capacity_mut();
-        s[0].write(v);
-
-        // SAFETY: We just initialised the first spare entry, so it is safe to increase the length
-        // by 1. We also know that the new length is <= capacity because of the previous call to
-        // `reserve` above.
-        unsafe { self.set_len(self.len() + 1) };
-        Ok(())
-    }
-
-    fn extend_from_slice(&mut self, other: &[T], flags: Flags) -> Result<(), AllocError>
-    where
-        T: Clone,
-    {
-        <Self as VecExt<_>>::reserve(self, other.len(), flags)?;
-        for (slot, item) in core::iter::zip(self.spare_capacity_mut(), other) {
-            slot.write(item.clone());
-        }
-
-        // SAFETY: We just initialised the `other.len()` spare entries, so it is safe to increase
-        // the length by the same amount. We also know that the new length is <= capacity because
-        // of the previous call to `reserve` above.
-        unsafe { self.set_len(self.len() + other.len()) };
-        Ok(())
-    }
-
-    #[cfg(any(test, testlib))]
-    fn reserve(&mut self, additional: usize, _flags: Flags) -> Result<(), AllocError> {
-        Vec::reserve(self, additional);
-        Ok(())
-    }
-
-    #[cfg(not(any(test, testlib)))]
-    fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError> {
-        let alloc: &dyn super::Allocator = &super::allocator::Kmalloc;
-        let len = self.len();
-        let cap = self.capacity();
-
-        if cap - len >= additional {
-            return Ok(());
-        }
-
-        if core::mem::size_of::<T>() == 0 {
-            // The capacity is already `usize::MAX` for SZTs, we can't go higher.
-            return Err(AllocError);
-        }
-
-        // We know cap is <= `isize::MAX` because `Layout::array` fails if the resulting byte size
-        // is greater than `isize::MAX`. So the multiplication by two won't overflow.
-        let new_cap = core::cmp::max(cap * 2, len.checked_add(additional).ok_or(AllocError)?);
-        let layout = core::alloc::Layout::array::<T>(new_cap).map_err(|_| AllocError)?;
-
-        let (old_ptr, len, cap) = destructure(self);
-
-        // We need to make sure that `ptr` is either NULL or comes from a previous call to
-        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
-        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>`'s capacity
-        // to be zero if no memory has been allocated yet.
-        let ptr = if cap == 0 { ptr::null_mut() } else { old_ptr };
-
-        // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
-        // `krealloc_aligned`. We also verified that the type is not a ZST.
-        match unsafe { alloc.realloc(ptr.cast(), cap, layout, flags) } {
-            Ok(ptr) => {
-                // SAFETY: `ptr` has been reallocated with the layout for `new_cap` elements.
-                // `new_cap` is greater than `cap`, so it continues to be >= `len`.
-                unsafe { rebuild(self, ptr.as_ptr().cast(), len, new_cap) };
-                Ok(())
-            }
-            Err(err) => {
-                // SAFETY: We are just rebuilding the existing `Vec` with no changes.
-                unsafe { rebuild(self, old_ptr, len, cap) };
-                Err(err)
-            }
-        }
-    }
-}
-
-#[cfg(not(any(test, testlib)))]
-fn destructure<T>(v: &mut Vec<T>) -> (*mut T, usize, usize) {
-    let mut tmp = Vec::new();
-    core::mem::swap(&mut tmp, v);
-    let mut tmp = core::mem::ManuallyDrop::new(tmp);
-    let len = tmp.len();
-    let cap = tmp.capacity();
-    (tmp.as_mut_ptr(), len, cap)
-}
-
-/// Rebuilds a `Vec` from a pointer, length, and capacity.
-///
-/// # Safety
-///
-/// The same as [`Vec::from_raw_parts`].
-#[cfg(not(any(test, testlib)))]
-unsafe fn rebuild<T>(v: &mut Vec<T>, ptr: *mut T, len: usize, cap: usize) {
-    // SAFETY: The safety requirements from this function satisfy those of `from_raw_parts`.
-    let mut tmp = unsafe { Vec::from_raw_parts(ptr, len, cap) };
-    core::mem::swap(&mut tmp, v);
-}
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 0ee3f0d203e2..0836394ddab8 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -14,10 +14,7 @@
 #[doc(no_inline)]
 pub use core::pin::Pin;
 
-pub use crate::alloc::{flags::*, vec_ext::VecExt, KBox, KVec};
-
-#[doc(no_inline)]
-pub use alloc::vec::Vec;
+pub use crate::alloc::{flags::*, KBox, KVec};
 
 #[doc(no_inline)]
 pub use macros::{module, pin_data, pinned_drop, vtable, Zeroable};
-- 
2.45.2

