Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE37158A13
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898219; cv=none; b=cn05HoEqB1IH5rsc7kjafObMzkRkX7FjpQjggD9p62wkS0LszpT1PjolYqnOhBDurfNaAPM0n791lTK9LbPR1qsCkFFXkUPKLAes8rrTRwz1qn5fBagbMHqWWYH4NmJTitwQMmGTiupvKhQo7XXU27+RFIyRzMqouWWjcta8WQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898219; c=relaxed/simple;
	bh=2Enhd6cmnVgHNoEaruv8nJGUDXUY2CG66Bw7ifA/0Mw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Of0eAkz2dUJFRdQv/423EaiqhJ2Pfg5KWcBN2kl3++IRNvW/PSMSPUt4BwJALKGNsnEpTeO8a8eeoPaRY7GHbwtzRpHryJaYinMwiKVr9HnXz5UIpBiJtB2mmajC/vaZeiLC2+dhoh6XQRH0nFjPKWLE71K2z5ShsMZUqHObeHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rksHnCbW; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rksHnCbW"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e29097b84c8so6293556276.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 02:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728898216; x=1729503016; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=syzQ0YIA7hiuVBWPGiYek/r3xbiBERARR9zpu8XM3Ak=;
        b=rksHnCbWzrk3uXf+UCwaWdpJAfyhCKpVzXy48MTislmG3Z+3OgQPLiwBUCornRYoms
         ER2HX1lyZVVafwf38rmYjhMSP2mj0AZIoAxtzQ0Edf+kOu9biLK2E2k1MIJPYtFEDWEi
         j/79x976nmxYn+wR5MTCWeJovZOSfMvFr1K8KimTH5aELarRaOGgnTQEKsWypaLTGJln
         vaCNkLxiu+zhIi0bwFI8e+WoeOtSBy3lfe1ha+c5HClgnADPTJ+d3RJrosdnUYEg+4e2
         YbjU9L80fi4Ps3p/fG+mL4h8Ogd9wn6gTEt8H2wuy1uy3zGf2HvPB9WC5+tLCYREjKrp
         pLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728898216; x=1729503016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syzQ0YIA7hiuVBWPGiYek/r3xbiBERARR9zpu8XM3Ak=;
        b=IJwTI5GPUTDVUbiES1dOA+wQFK0qW5ceCA4KnMPCynxJx7Ff7Rp0Ne3KIKfKIcXmyd
         TUv2T5u9MSM94mG6Sx9Va5VBhX8VdsOSgQBm8Jz/1YIGDf/65E5WsqmY/CMVij/uwkJb
         LX5WbCJ4FADTQEOiuoVjsm/3MkIKysrnScHGI74s3aPymQxQNB49Y17knZTlEVeR4KUz
         /LBdRH2hx3AnOL5s6dEBi5R06dRRL2TTIpjLfdfZJYa8/MIwM0CMX/brEw567RjwW1Jv
         0r10wNbHLUuZz11TWfNocRXWShFRHDS0Jx1jGqRVKqvKWHT14OEA2CLstLyE2GpzwQhy
         LS7A==
X-Forwarded-Encrypted: i=1; AJvYcCVzBg0XBFnPlcCBu0yPp/Y3IEAt0ReUScEfZctyOkooc7w9BGgBnYoAnXK7bBOQi2QMoGCaclAVKC6f+j5FiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC/b5LazH2DrwYigUBa/w3T9UYrY0ZEnEWh/DS/e96M0OVouTF
	gop+LCaU6ktozrzUNgAKWJbwIfytDZILmWPkAsqlqRWwMqXUK0mktkGFg9mnEw9Y0QpVBLYVxHa
	LuoS03+7wWdXZZw==
X-Google-Smtp-Source: AGHT+IFP0Yhol+IMXDZsu5DN19fHDcashAEaCkOGsyT7YnCVDy2E1d/hSKxj0g0oPqksGM1biSgJAFHs+8wjIqI=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:6403:0:b0:e13:e11c:507 with SMTP id
 3f1490d57ef6-e29506e5290mr2521276.3.1728898216460; Mon, 14 Oct 2024 02:30:16
 -0700 (PDT)
Date: Mon, 14 Oct 2024 09:29:52 +0000
In-Reply-To: <20241014-vma-v7-0-01e32f861195@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014-vma-v7-0-01e32f861195@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=2Enhd6cmnVgHNoEaruv8nJGUDXUY2CG66Bw7ifA/0Mw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnDOSgpJa1Paui3iee9sSjZR4NEdc4yfCvkJU1x
 YJUtF++TbCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwzkoAAKCRAEWL7uWMY5
 RrWmD/9uUc7/jFNoMvSWwLQAbbqfprAp4SkfBDb1GaQjPkU7kASucap/tIcLMDy8BoZAAoj9LYu
 pC4iGkCqTkMk5yRVXVlRxP5+qmaSROczJENdn9zZLkrGqNEO4KGaOdwqe42053x9tvFk37d7TFp
 /3xALRF7ln1OzIuP8Afd12JVhjCo7QIeb2lOnegG/KqD7aVr8XZnC42SDzFMe1NZeFuD4Vivgzt
 +v/k+1q3DfbFXcDOD0kjiytiJEVE8s2StSX8ghmHUpBDjfPpvidTfuoYRYwxuxgNl26WlXXal1P
 HRYxmh5qmHZCTBd7RylTXzkY3FlmQFP1C9N2NxrlTUuES38WIscX3o2MTBh7QRn4JP7zMUqd8s7
 DknHT7HA39J2w1k5cpxgb0i+SsIb0ndBiwvNj48BHwsxWFAv0KkKQ+C9lYw2lrk0ormwrsYJYS4
 x4rxnMQ1x1OdvN+jQQ1fSSYIS7zEvayfJZrVXDuTnNg1KHEhGtihtu9X88Al2Ubp6/IheTevnDV
 Mf/J3GH6DwWCNmzsT9T5DXA6VGU43QLi0KMmnGAyHXFSQmYJRposkrzhoo5l+ZkoRhl3loX5flq
 XicoyN3dqVDFHZdLCqh6lPyNdrwLa1t1cwf1qKy8mKRWM0M1Rt/ZXRnQAKsbcnlOZVUx2A6ZuXA nmUACYPEoAAGHzg==
X-Mailer: b4 0.13.0
Message-ID: <20241014-vma-v7-2-01e32f861195@google.com>
Subject: [PATCH v7 2/2] rust: miscdevice: add mmap support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="utf-8"

Using the vma support introduced by the previous commit, introduce mmap
support for miscdevices. The mmap call is given a vma that is undergoing
initial setup, so the VmAreaNew type is used.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index cbd5249b5b45..c9428a6154e3 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -11,6 +11,7 @@
 use crate::{
     bindings,
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
+    mm::virt::VmAreaNew,
     prelude::*,
     str::CStr,
     types::{ForeignOwnable, Opaque},
@@ -110,6 +111,11 @@ fn release(device: Self::Ptr) {
         drop(device);
     }
 
+    /// Handle for mmap.
+    fn mmap(_device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>, _vma: &VmAreaNew) -> Result {
+        kernel::build_error(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handler for ioctls.
     ///
     /// The `cmd` argument is usually manipulated using the utilties in [`kernel::ioctl`].
@@ -156,6 +162,7 @@ impl<T: MiscDevice> VtableHelper<T> {
         const VTABLE: bindings::file_operations = bindings::file_operations {
             open: Some(fops_open::<T>),
             release: Some(fops_release::<T>),
+            mmap: maybe_fn(T::HAS_MMAP, fops_mmap::<T>),
             unlocked_ioctl: maybe_fn(T::HAS_IOCTL, fops_ioctl::<T>),
             #[cfg(CONFIG_COMPAT)]
             compat_ioctl: if T::HAS_COMPAT_IOCTL {
@@ -207,6 +214,23 @@ impl<T: MiscDevice> VtableHelper<T> {
     0
 }
 
+unsafe extern "C" fn fops_mmap<T: MiscDevice>(
+    file: *mut bindings::file,
+    vma: *mut bindings::vm_area_struct,
+) -> c_int {
+    // SAFETY: The mmap call of a file can access the private data.
+    let private = unsafe { (*file).private_data };
+    // SAFETY: Mmap calls can borrow the private data of the file.
+    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+    // SAFETY: The caller provides a vma that is undergoing initial VMA setup.
+    let area = unsafe { kernel::mm::virt::VmAreaNew::from_raw(vma) };
+
+    match T::mmap(device, area) {
+        Ok(()) => 0,
+        Err(err) => err.to_errno() as c_int,
+    }
+}
+
 unsafe extern "C" fn fops_ioctl<T: MiscDevice>(
     file: *mut bindings::file,
     cmd: c_uint,

-- 
2.47.0.rc1.288.g06298d1525-goog

