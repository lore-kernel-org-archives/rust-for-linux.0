Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571128EC7A
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948183; cv=none; b=lDyf+f87kCiQoSVf/jVlsJTW2V3YHNwdShUxw5Wk4bwdAWhcYtoetzpAL+l9kaGY8yyT40vXRwaMDcFtNgg/TjvJLdiwcprTnCHFDBMBMynFUKSVw7HVurt2ugTIdSVSPO/1gPI4N5D0soTFd416dhRdvA+HcVZTECCtoODNGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948183; c=relaxed/simple;
	bh=YABlKOR4s3jcHAdrd+4knVVhbkpmpWt8xx350u7Y5JI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YZ0wjIdq7G15QUYxHRaw9ACIyDg3drJomgLBo4yw0oMfWxlZBw4/cZj5fmDvo2uhJjuESydjfEsBwPM2fg7PCfyDfuyA8PFHJFxU6FGKHIcxvuIlzRuoOgKuAz4zclyb4V11b/YH5Gd8sfd9t00CgYkW6AlqJBrMsLH+iXl9y6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4dIIkpTj; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4dIIkpTj"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43624b08181so4454235e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 05:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736948180; x=1737552980; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=81ZLKD3ogzg79yEJn00+1Q3wr2cvrl13TETNOCjT2u4=;
        b=4dIIkpTjJGO6LYcPZjpxsUmCfvxeqfS5x9BnJ3PTkDkpktvuMijnlCgWyLta44O1SA
         bWXfDKi1Sz+Mae01aT9NXKNqExObxyb4ngE8oKkDsHsb78Zyw0dfxaXLyIDXGRxNFHUA
         faCnO/VbrhpgE6JOPNbvPi9TQmp27dazl47Eqc9ldNCOibVKbCuExnoJjH9a24BUcW4m
         lWIySeUgG0OuaSt2SNSP8MsKs9pxffWGZlGTG7az1PkWhF9Q9LWrxYlBbD39RyVyAdkh
         6BdMmvxUwyu16UjXnDsiHJEg37yIPV3eIZLvaB0anhG8KSfjR+PDRTBD0xJAPWWxsY1q
         asTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948180; x=1737552980;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81ZLKD3ogzg79yEJn00+1Q3wr2cvrl13TETNOCjT2u4=;
        b=emaHrykqY9FnWOQBeLCFofNKPzWyaxyQMp5u3ZnAIVPW+AHM/zEAZZ5Us/zlZnE36E
         EgzoiwXzUptIhe/gLo4jdqXySjqqAgsZZy5irK1mpJ4qNIenuH7Er6e+RI6arSppXOUd
         eJ7LMuN7oG7kM9CtPXQvZ/il9TlPi8LH/B/PifSC5nEwQqtdWHvO4mfDgAQZktoETyWO
         RVCE5pCaf5skNPrfwinVTWNqN4AI47K0Eb9L6dlaVbwjRFvnBVXMFZj62lQyOYb5BYbX
         hR+kjSGBqI3pTir4TbFbbEkcB1q9MxRqtFwD19deD65t9vMrDv+TzRVHPkYETHz+T1b0
         EnWw==
X-Forwarded-Encrypted: i=1; AJvYcCWg7PSBV5AEgw145ro7xmWFjw3pYBrVRaJ0IRmkx1RpP2yGzKdUAh0HhLVqZSmJyLyaHthmlry2VyMtlUMVBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7pSIz73ix3iIulenMdXFZytliYzynaNHXxagD4l6pV0rb1G8
	GN/b521xJOlU6E3y7lQBy/hUpy1fmuTHCInM0fhl8Pjt+s0XYPJyispnlHCtbNvwjDZmRGxrquO
	Z7870DXi6EpQEaA==
X-Google-Smtp-Source: AGHT+IHgYgEKSPDdi2P+oyelNydwykWpCSvtY+CbLbji5X9hWCVjK6MNYOAiA3I1gSkw4AjTEKFL2AALGCdOpWg=
X-Received: from wmpz18.prod.google.com ([2002:a05:600c:a12:b0:434:f299:5633])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e29:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-437c6b7b184mr26161955e9.2.1736948180099;
 Wed, 15 Jan 2025 05:36:20 -0800 (PST)
Date: Wed, 15 Jan 2025 13:35:10 +0000
In-Reply-To: <20250115-vma-v12-0-375099ae017a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250115-vma-v12-0-375099ae017a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3771; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=YABlKOR4s3jcHAdrd+4knVVhbkpmpWt8xx350u7Y5JI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnh7nAleiDJcaQtJuPa+I8hS1lU1tl1JfuAuv6C
 fM9qXyv8SiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ4e5wAAKCRAEWL7uWMY5
 RjKWD/963spEQDrIssZkZ3POnDl7uN2xDsLrbFE7PWw0knySvUIAaNYgn/o5eNYUfpxiQLaCKkD
 CXGxsKIuf60CrxosESAo+b4ZUrA3IUYF+nX7NShS9KEgo62sv6MnBwZclUyx1Gj55nj3aNveugE
 fy0OodhenOJTHWSU7N4gbqJlMKsNFxFMoLCMphn2Mle3wqHMGd4jGi9IRXspxNU3pWa6ccMfYo3
 LqkkBCs65pX3GBKgCt9OByOiUNBtC84SEfpNjTar6ZqPx1wR+7nJO6U8hxO+jc1KdErXJ1KwxZS
 mSQXRQDKLpBln8f9ZazAF73LtchsKtETNLrTD18PNCkfZkh5wxnb7cHNkK8CC9ULX6quxyPzmCH
 QO0rDKnCD2fPfoyJWdf1xnjS4Z4PKm+TesBB3ihfWES2VoSsoD34cnbq6uE/opRmhvNYUhQvfAu
 CV1nQnnDyugFYDTO4gGC3FmJ8dWJNPy2DYEtQSMhbyHFqI/pGeTc2+CLwWlrsBob7NPgw+KPJR1
 vwl2jg1bbS0MmLM0UKpUFO+RYxBg6HaNBwdr0R5RLmkmuJkqWdEk3wOajCyuMxCP1IWmmLymZya
 qtAJCN8TF+CkyYnG99EOWqEe/MlfaHTX38XNA0sreMyoYwYAsBgayLu4dFvPIME3w8Cko/T6+o8 +ejB8bK+Cslj+dw==
X-Mailer: b4 0.13.0
Message-ID: <20250115-vma-v12-7-375099ae017a@google.com>
Subject: [PATCH v12 7/8] rust: miscdevice: add mmap support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Add the ability to write a file_operations->mmap hook in Rust when using
the miscdevice abstraction. The `vma` argument to the `mmap` hook uses
the `VmAreaNew` type from the previous commit; this type provides the
correct set of operations for a file_operations->mmap hook.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 7e2a79b3ae26..0a0ef172304c 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -11,6 +11,8 @@
 use crate::{
     bindings,
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
+    fs::File,
+    mm::virt::VmAreaNew,
     prelude::*,
     str::CStr,
     types::{ForeignOwnable, Opaque},
@@ -110,6 +112,22 @@ fn release(device: Self::Ptr) {
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
+        _vma: &VmAreaNew,
+    ) -> Result {
+        kernel::build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handler for ioctls.
     ///
     /// The `cmd` argument is usually manipulated using the utilties in [`kernel::ioctl`].
@@ -156,6 +174,7 @@ impl<T: MiscDevice> VtableHelper<T> {
         const VTABLE: bindings::file_operations = bindings::file_operations {
             open: Some(fops_open::<T>),
             release: Some(fops_release::<T>),
+            mmap: maybe_fn(T::HAS_MMAP, fops_mmap::<T>),
             unlocked_ioctl: maybe_fn(T::HAS_IOCTL, fops_ioctl::<T>),
             #[cfg(CONFIG_COMPAT)]
             compat_ioctl: if T::HAS_COMPAT_IOCTL {
@@ -216,6 +235,32 @@ impl<T: MiscDevice> VtableHelper<T> {
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
+    let area = unsafe { VmAreaNew::from_raw(vma) };
+    // SAFETY:
+    // * The file is valid for the duration of this call.
+    // * There is no active fdget_pos region on the file on this thread.
+    let file = unsafe { File::from_raw_file(file) };
+
+    match T::mmap(device, file, area) {
+        Ok(()) => 0,
+        Err(err) => err.to_errno() as c_int,
+    }
+}
+
 /// # Safety
 ///
 /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.

-- 
2.48.0.rc2.279.g1de40edade-goog

