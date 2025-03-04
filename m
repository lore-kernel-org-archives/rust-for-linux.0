Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03228204095
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089116; cv=none; b=Diw+o73Vd5YRGnghQccj3wQrOrhUBY21f7Igg6od2gxJG3trM4/U7NzsK9BE0UeT5AHA7cfeWXy7mM6v6c1QrAubZeyilHh7V82Bc46dgruy4pZa4KvPYEHIUe5GnPt3B2bTsh0ReI7njMUP5qwtHVUWtRy4VhG5MEiKxzvhxn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089116; c=relaxed/simple;
	bh=6ix7Yh05nsg0+BRkgBinynB7537OSvluG9ZV2/ywotA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mBEbDE216ujfLmz9+XwFLK+AY1HoAcLFo/mRYFDm9SaF4cf1sQuysVY4dqQ6W1quPYSRRYioShmtJZFmd5YTERbCqXPK0wd2Up7YaPcTEYfaHQyfP6NemcuFq3zih9MRYT9jS+PpspGpQV/Xdi6xRaxwBl7Io1IOxYEKVEkcigo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5/Qsoj8; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5/Qsoj8"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bca561111so5286705e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 03:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741089113; x=1741693913; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FL6QF1vf/aSpNg0U7JqjgxuXk5Djy4reKV1N7d1McJg=;
        b=W5/Qsoj8Acu0QNuG5LC8o8uu314wtsjXnqJKqgfiGagaBc0dkI8HAQBKuaFY0wdvX3
         XrlrKJInXT5ejGgbJ9sQk5Yk81FHOvFiYCrAiqowiySTqiRrnI4fTUwaw6gasGA/3Nxb
         ic6KS6s7WL7Qp50fbpVnTwpwDw5X0J8zG+4W8z0dVMn6u2PywrfCBFepJmuUTHReL4/D
         MB8qDZONxSGVVGddYT2PiHehaX4KqOlCOP2rN+l0sB96vDNifUt3BZ1bKlPZEsGfZnOk
         RR1zcAdrZHf2gyNfL/YeZ+Meb+b5uAtEt/WyB7Vtdp/E5wlmmqDVRRpdIC7WseejAXVS
         eJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089113; x=1741693913;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FL6QF1vf/aSpNg0U7JqjgxuXk5Djy4reKV1N7d1McJg=;
        b=VYVwbOaE6fYalIMcq4LQPrVEQkKdwQ/nNnSV5lOzXDKQz/Px3p328kWNeZNEASCEaZ
         gBgz79uZsz2xN3nv/214iCkYRUT+ahheNoP4ZnvNyWBn52y7bdvsCq5Xjhia+egCpqH5
         LPqKbEPwSLbduz8kmzB8pHKxprM/4qNLP8cvRRyQ0t5GqNOxooVWJFyhHD+/O0sxIkHJ
         ZBcRHANcGwzZQGt6qWdv4xAtB4t64fDpv6raegvsU8WPzPYr/N6NAU/WHZ+CTZPEgCif
         StDaMVgHmYJc8StZ3TlKXl5si/nYzP4ouHNLRCoY8K7rYcxaWVgO4wwL0OuauJKDzEDD
         8csg==
X-Forwarded-Encrypted: i=1; AJvYcCU1eKnT4A2k2eCBwT+/Zt3ec5hdZUc3l2hA24Yo01Mi46Kw1g+0+JqTyOENb1joFAy5naShgdU7oDfSvMMVNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6m0xig2Jt8Co0fIY2woWFYcLPwyGJ0aTz734598TB8Se+jUi
	dIt4yGztJsu+Hs8tmdSE85Bcmc6gsu6W1xOuYEaGh/+BHlHzjMjVfvnd6mfyBdddiirAs4wyqPw
	oM7f8XLex7s4iyw==
X-Google-Smtp-Source: AGHT+IGmelcITCLSxHDM+ol2aAuW+SX1n24peFVEH2jDRbxRitIa4L9bodIVhVTmWM6MYSThFc/JIyzqdk61KPY=
X-Received: from wmsp23.prod.google.com ([2002:a05:600c:1d97:b0:43b:c59f:5eb4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:511e:b0:439:6017:6689 with SMTP id 5b1f17b1804b1-43ba66e0bf5mr134523075e9.9.1741089113515;
 Tue, 04 Mar 2025 03:51:53 -0800 (PST)
Date: Tue, 04 Mar 2025 11:49:58 +0000
In-Reply-To: <20250304-vma-v15-0-5c641b31980a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250304-vma-v15-0-5c641b31980a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4010; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6ix7Yh05nsg0+BRkgBinynB7537OSvluG9ZV2/ywotA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxulG4bX1vws8nKbvRQGg/HqDRGItXCMIy067J
 UtrjP8bcg2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8bpRgAKCRAEWL7uWMY5
 Ri5ND/4qzKj39WFiIJmDQtStg/DTeOLhovy/f+nq4dxxKjIfPkCXN7mCBwdVuyaZ9IzpZiig/Pr
 JjlUejmUYiv7GpXNwQ5fevvLnl2gcsS1Ww7K77rmGyLn0NSzhVvcqZcao+XO/4XJt6+XVtvMz1V
 WBioMluf2e0EYFq9tTgyMbxs30d2OPKQTdMBKNpgYFXQT8S/Ce2+TokcsxSrswN6WzxBaSXwFs4
 vRooNosfXpQ9rl/CMycHIVLQyQ5+Jt7zL6o/RMAu+HbDp97x7c3D0vNJ8COJNYSNkfQyjRZOH+u
 F8SnH4QGOnzt/WmfwjdLOWZZAMqop2kISubcoSUSqZjRykmfS/498SXFXeXyeaUaVWHDH4qcZX9
 A+xW9AB1b1Pwo1yR2dF1KkC668o9aBCnVWc+OC68hEn7PoO3wGTMwMjr/Dy48ASSh5hmdk0yVJU
 R2KomJV44m9VI3/5Xh8pJWvqS3z0BqUe4Kav9e4WepTAk4ez1a7Kr/jk9guvCkT/EuW9+kf3vqO
 lEMYpTjt8VuhMEqFGnTSDh3AiPQCgKVDPpLIaRdvE+uPl9AvDfpkrtdwg14IX3dnHQYUDC1L20f
 74KnV/YeVER1hTZMagxWLY/LsEtTbKcOy/w81SF+BaH/9ihcVLAzKHC+ETYboYoKrzb64CNSBdM TUDoUxIAgm/EwsA==
X-Mailer: b4 0.14.2
Message-ID: <20250304-vma-v15-7-5c641b31980a@google.com>
Subject: [PATCH v15 7/9] rust: miscdevice: add mmap support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Add the ability to write a file_operations->mmap hook in Rust when using
the miscdevice abstraction. The `vma` argument to the `mmap` hook uses
the `VmaNew` type from the previous commit; this type provides the
correct set of operations for a file_operations->mmap hook.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index e14433b2ab9d8fa391474b2ad7e3ed55c64b4d91..e4a2c599683243ac955b7c95e0645b8c1010b25f 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -14,6 +14,7 @@
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
     fs::File,
+    mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
     str::CStr,
@@ -119,6 +120,22 @@ fn release(device: Self::Ptr, _file: &File) {
         drop(device);
     }
 
+    /// Handle for mmap.
+    ///
+    /// This function is invoked when a user space process invokes the `mmap` system call on
+    /// `file`. The function is a callback that is part of the VMA initializer. The kernel will do
+    /// initial setup of the VMA before calling this function. The function can then interact with
+    /// the VMA initialization by calling methods of `vma`. If the function does not return an
+    /// error, the kernel will complete initialization of the VMA according to the properties of
+    /// `vma`.
+    fn mmap(
+        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _vma: &VmaNew,
+    ) -> Result {
+        kernel::build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handler for ioctls.
     ///
     /// The `cmd` argument is usually manipulated using the utilties in [`kernel::ioctl`].
@@ -176,6 +193,7 @@ impl<T: MiscDevice> VtableHelper<T> {
         const VTABLE: bindings::file_operations = bindings::file_operations {
             open: Some(fops_open::<T>),
             release: Some(fops_release::<T>),
+            mmap: maybe_fn(T::HAS_MMAP, fops_mmap::<T>),
             unlocked_ioctl: maybe_fn(T::HAS_IOCTL, fops_ioctl::<T>),
             #[cfg(CONFIG_COMPAT)]
             compat_ioctl: if T::HAS_COMPAT_IOCTL {
@@ -257,6 +275,32 @@ impl<T: MiscDevice> VtableHelper<T> {
     0
 }
 
+/// # Safety
+///
+/// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
+/// `vma` must be a vma that is currently being mmap'ed with this file.
+unsafe extern "C" fn fops_mmap<T: MiscDevice>(
+    file: *mut bindings::file,
+    vma: *mut bindings::vm_area_struct,
+) -> c_int {
+    // SAFETY: The mmap call of a file can access the private data.
+    let private = unsafe { (*file).private_data };
+    // SAFETY: This is a Rust Miscdevice, so we call `into_foreign` in `open` and `from_foreign` in
+    // `release`, and `fops_mmap` is guaranteed to be called between those two operations.
+    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+    // SAFETY: The caller provides a vma that is undergoing initial VMA setup.
+    let area = unsafe { VmaNew::from_raw(vma) };
+    // SAFETY:
+    // * The file is valid for the duration of this call.
+    // * There is no active fdget_pos region on the file on this thread.
+    let file = unsafe { File::from_raw_file(file) };
+
+    match T::mmap(device, file, area) {
+        Ok(()) => 0,
+        Err(err) => err.to_errno(),
+    }
+}
+
 /// # Safety
 ///
 /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.

-- 
2.48.1.711.g2feabab25a-goog

