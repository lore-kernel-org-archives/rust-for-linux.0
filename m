Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA881B47CD
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720112955; cv=none; b=W6VFYY6hsFOCVGNhecfOLwCDszayUZumDlcQ6+VaRrnRfIclGCAQjxGS4Ke5C1oCZyPM9AII5E2QLgH6S/qstBMlHAFeKbaPQImd1hPu/88VJEHaA6i8B9GKwEmInAEwX2cWT28oGahTwsgA42EjGyfLvfEfBDm7/aHkrOI5ttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720112955; c=relaxed/simple;
	bh=CPyHMERj1twQjcjGyBr1Olj39ha/kHj+F1ifWXerf6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=naEfBOg/IlYYhsvJTqOACUd7F6JTOLzdnEj4wU0lLhvcRRn9DMSv+qrfVKmOfcMpdYDZNE8h1dZw5bx9EUdPwwpA27DCU/AnrEyjP2Xr7CXgpksQ13q16vryFvnlcwfoLt/zPWQZaI+CHqAgJ+W4F9Nuk/crxl7V1RBO6fKiIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MgdWjznC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgdWjznC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720112953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fpg1faBr5ekWLp/A+ticofxlpAUVrowaMF9N+c1VH5Y=;
	b=MgdWjznCTbf1hkY4QL0OQClZbxH8eGXUCsadWY/JK9Zlb6Pe9MQHBbP7cDj2TN/Z+XDmST
	Cjo7rhQAHJonLy+gBbGLHX/8Lt27WYNEWWRzpLmKFGCz3W+duXBgj+LyPlqFx23lGzrflM
	9pu8Wq7xz7V3U70nGmh47ITAjUfoxx8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-1-vG63pyOiOEmKOvSwIGog-1; Thu, 04 Jul 2024 13:09:12 -0400
X-MC-Unique: 1-vG63pyOiOEmKOvSwIGog-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4256569a4faso10627465e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 10:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720112951; x=1720717751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpg1faBr5ekWLp/A+ticofxlpAUVrowaMF9N+c1VH5Y=;
        b=Vv7zy8cI+BBFEbtIlzXst/sJOpNvqv9wZSqIpoQXMXTcC+YtfvtTozil1ZL0Q3g8nl
         0J6CRPqKfGSS2OxssSlxIXvcLFqcUuycbxAan8KhPA/5nDvFC9gsaNnTNDH9v5srpMG+
         B9bsqf9Xce/iq1nbPDGPn6KjrYFxJchXLPbT3mNVt+jYO84AwjQfQbn96OqAPI8t4at6
         tK7WM/1KEL6kS/fNVy2hfHWMbv9oumEyuPDWk54Fdlp8TjjSFORKu5yU1whtmN+of1TM
         C4XFn+9HDFBModBVw/D39OTQ1evMm5hpuFfM+0EB2xWw6Dfwtc4JGhLMegiNBlwOspjg
         ru/A==
X-Forwarded-Encrypted: i=1; AJvYcCW9wES5bVEtMhr2eGdMfbDuaMiVkHnTAAhga36O/qDApHRnbADAXvfmJBVPxNalNCYhG1zDpMRvPI7WY9C4WLPEZ2QCM1pda/pQEKfFVII=
X-Gm-Message-State: AOJu0Yw6D7243Y5zvzHJNs67cugzgHneBtIoCTOwrD9tzwBbB0Hd93T5
	g2mwlah2kaWz0eiRpU2j7EpcJrfHa0G74CPJyQVwpfWfiyOEpHgXj7IRVFyjPbMcxN1RtZMGS5x
	QBamMKlYlZxJ2SApNKAEF9peD5EzIVczyPKn19C3ftpdOde/IKyH6ICjcKjjJrbJk
X-Received: by 2002:a05:600c:3547:b0:425:7aa7:e490 with SMTP id 5b1f17b1804b1-4264b0c50ecmr19778945e9.3.1720112950787;
        Thu, 04 Jul 2024 10:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKM4G6SCFeJEZtSOhy82Z2Ed8yGmNU3aqSb//nIUjwTmhfzTkmvAH30VJp4ZwrSb2S0rxzfA==
X-Received: by 2002:a05:600c:3547:b0:425:7aa7:e490 with SMTP id 5b1f17b1804b1-4264b0c50ecmr19778665e9.3.1720112950454;
        Thu, 04 Jul 2024 10:09:10 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d165bsm31228875e9.4.2024.07.04.10.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:09:09 -0700 (PDT)
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
Subject: [PATCH 14/20] rust: alloc: implement `IntoIterator` for `KVec`
Date: Thu,  4 Jul 2024 19:06:42 +0200
Message-ID: <20240704170738.3621-15-dakr@redhat.com>
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

Implement `IntoIterator` for `KVec`, `KVec`'s `IntoIter` type, as well
as `Iterator` for `IntoIter`.

`KVec::into_iter` disassembles the `KVec` into its raw parts;
additionally, `IntoIter` keeps track of a separate pointer, which is
incremented correspondingsly as the iterator advances, while the length,
or the count of elements, is decremented.

This also means that `IntoIter` takes the ownership of the backing
buffer and is responsible to drop the remaining elements and free the
backing buffer, if it's dropped.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/alloc.rs      |   1 +
 rust/kernel/alloc/kvec.rs | 177 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 177 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 3a0195d23bb4..e6a5d65e0c48 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -15,6 +15,7 @@
 pub use self::allocator_test as allocator;
 
 pub use self::kbox::KBox;
+pub use self::kvec::IntoIter;
 pub use self::kvec::KVec;
 
 /// Indicates an allocation error.
diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 7ec898657832..ece48930966e 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -11,7 +11,9 @@
     ops::DerefMut,
     ops::Index,
     ops::IndexMut,
-    ptr, slice,
+    ptr,
+    ptr::NonNull,
+    slice,
     slice::SliceIndex,
 };
 
@@ -603,3 +605,176 @@ fn eq(&self, other: &$rhs) -> bool { self[..] == other[..] }
 __impl_slice_eq! { [A: Allocator] [T], KVec<U, A> }
 __impl_slice_eq! { [A: Allocator, const N: usize] KVec<T, A>, [U; N] }
 __impl_slice_eq! { [A: Allocator, const N: usize] KVec<T, A>, &[U; N] }
+
+impl<'a, T, A> IntoIterator for &'a KVec<T, A>
+where
+    A: Allocator,
+{
+    type Item = &'a T;
+    type IntoIter = slice::Iter<'a, T>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        self.iter()
+    }
+}
+
+impl<'a, T, A: Allocator> IntoIterator for &'a mut KVec<T, A>
+where
+    A: Allocator,
+{
+    type Item = &'a mut T;
+    type IntoIter = slice::IterMut<'a, T>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        self.iter_mut()
+    }
+}
+
+/// An iterator that moves out of a vector.
+///
+/// This `struct` is created by the `into_iter` method on [`KVec`] (provided by the [`IntoIterator`]
+/// trait).
+///
+/// # Examples
+///
+/// ```
+/// let v = kernel::kvec![0, 1, 2]?;
+/// let iter: kernel::alloc::IntoIter<_> = v.into_iter();
+///
+/// # Ok::<(), Error>(())
+/// ```
+pub struct IntoIter<T, A: Allocator = Kmalloc> {
+    ptr: *mut T,
+    buf: NonNull<T>,
+    len: usize,
+    cap: usize,
+    alloc: A,
+}
+
+impl<T, A> IntoIter<T, A>
+where
+    A: Allocator,
+{
+    fn as_raw_mut_slice(&mut self) -> *mut [T] {
+        ptr::slice_from_raw_parts_mut(self.ptr, self.len)
+    }
+}
+
+impl<T, A> Iterator for IntoIter<T, A>
+where
+    A: Allocator,
+{
+    type Item = T;
+
+    /// # Examples
+    ///
+    /// ```
+    /// let v = kernel::kvec![1, 2, 3]?;
+    /// let mut it = v.into_iter();
+    ///
+    /// assert_eq!(it.next(), Some(1));
+    /// assert_eq!(it.next(), Some(2));
+    /// assert_eq!(it.next(), Some(3));
+    /// assert_eq!(it.next(), None);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    fn next(&mut self) -> Option<T> {
+        if self.len == 0 {
+            return None;
+        }
+
+        let ptr = self.ptr;
+        if !KVec::<T>::is_zst() {
+            // SAFETY: We can't overflow; `end` is guaranteed to mark the end of the buffer.
+            unsafe { self.ptr = self.ptr.add(1) };
+        } else {
+            // For ZST `ptr` has to stay where it is to remain aligned, so we just reduce `self.len`
+            // by 1.
+        }
+        self.len -= 1;
+
+        // SAFETY: `ptr` is guaranteed to point at a valid element within the buffer.
+        Some(unsafe { ptr.read() })
+    }
+
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::KVec;
+    ///
+    /// let v: KVec<u32, _> = kernel::kvec![1, 2, 3]?;
+    /// let mut iter = v.into_iter();
+    /// let size = iter.size_hint().0;
+    ///
+    /// iter.next();
+    /// assert_eq!(iter.size_hint().0, size - 1);
+    ///
+    /// iter.next();
+    /// assert_eq!(iter.size_hint().0, size - 2);
+    ///
+    /// iter.next();
+    /// assert_eq!(iter.size_hint().0, size - 3);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    fn size_hint(&self) -> (usize, Option<usize>) {
+        (self.len, Some(self.len))
+    }
+}
+
+impl<T, A> Drop for IntoIter<T, A>
+where
+    A: Allocator,
+{
+    fn drop(&mut self) {
+        // SAFETY: Drop the remaining vector's elements in place, before we free the backing
+        // memory.
+        unsafe { ptr::drop_in_place(self.as_raw_mut_slice()) };
+
+        // If `cap == 0` we never allocated any memory in the first place.
+        if self.cap != 0 {
+            // SAFETY: `self.buf` was previously allocated with `self.alloc`.
+            unsafe { self.alloc.free(self.buf.as_ptr().cast()) };
+        }
+    }
+}
+
+impl<T, A> IntoIterator for KVec<T, A>
+where
+    A: Allocator,
+{
+    type Item = T;
+    type IntoIter = IntoIter<T, A>;
+
+    /// Creates a consuming iterator, that is, one that moves each value out of
+    /// the vector (from start to end). The vector cannot be used after calling
+    /// this.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let v = kernel::kvec![1, 2]?;
+    /// let mut v_iter = v.into_iter();
+    ///
+    /// let first_element: Option<u32> = v_iter.next();
+    ///
+    /// assert_eq!(first_element, Some(1));
+    /// assert_eq!(v_iter.next(), Some(2));
+    /// assert_eq!(v_iter.next(), None);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    fn into_iter(self) -> Self::IntoIter {
+        let (ptr, len, cap, alloc) = self.into_raw_parts_alloc();
+
+        IntoIter {
+            ptr,
+            buf: unsafe { NonNull::new_unchecked(ptr) },
+            len,
+            cap,
+            alloc,
+        }
+    }
+}
-- 
2.45.2

