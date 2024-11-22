Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A1A1DFE0D
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 15:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732290082; cv=none; b=RJaHb9vukm1naGcWlDIk+7fRptslMsR9oqS2IX1gvpKu2u/t1ioPgDCbKwTo9C3IasbknaXkMveMqy4rkxXQhgV2/2ySGmcaxug/jgTN6RCxfUKMM4oMMc0q4dVyaDRo9K0bO7A+O9kZVwfnA8CeitoC39btYZzrTftMy9e8Dz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732290082; c=relaxed/simple;
	bh=CackrY4N4HrwWKJd4mh44KeNaf6Y+uJ77q1hA2gtWCE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aGv17SS5mHMA81dXmQBjM/LOwg/7Bjj9aMPDyF2F9n05EFjcysf/OYJa/Lj2AZiG0LD4Q1QA4I/HYFzfyhh1LYF0+Ts0vy4VqaQyqJjwL2lXIkUP7+O0SjxLTD/9t4SZQVaCFu+ThFBnH+4VbTsHL5pXuMfCm6JDXw7RJLPZHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xt6GL1pd; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xt6GL1pd"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38240c98b68so977817f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732290078; x=1732894878; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn+jmdJoGY3YsjVzLAxhBr/vpe9LejwdH758cgsIixQ=;
        b=xt6GL1pdPdxqiROk6TQ0Q5Ur21pHnbBtA8ZLODwpb8nyrHljLeaGvfZ8i2AItsBnAc
         x47e3sIdrah7cfoabC0rc4+6fHjqj3PM8ZZDPUSGIntU98B5Qu275ce9twYlhJ4g/QE4
         qm+WdE26c+Lz2l5vTQppifI3yj8xuDKOdR7+lpKfkoTBhZ97Y5k/IWqQ04+rKILDaR23
         8cHcK/JPQdku7gLPjWihlPNGMQ7iE5y3jRn8trJ7alvgXex8VjFSZrx0euU2St08V3R+
         OT+mu4KkUMvcSZ8JxqWY4tQ5MZpS9efKENQrzINm5/9CG7f3wdtjZ/o9gAKI/QUkoqTn
         y8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732290078; x=1732894878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn+jmdJoGY3YsjVzLAxhBr/vpe9LejwdH758cgsIixQ=;
        b=kxoDtkfrghzWtl7lWgLFkpt38QVGXpV5goMsHo0EqbCElZiyeDVG+QwEBlgaOkDSjj
         mXnXWXVkD4fE6orBGVWFcq+71CG6KKjpMqugLs2q3lu1wUcP4FDhjE6G1FWiG53zZLsL
         SgxhFEVCUDZuPnJCT1RS2hfOuUbhFjI8Vms0604xuRU5VgfHQ5pFJhMcudiTKo7sFHxk
         lvgCmMida52EtWwOkb+m3F8E6BHA3bBPf38udnRbifQpz6E58WN+KfJxZeqflDSc+96+
         vfOaYs0ptlABmv5YxMgkjk0oSZX3RL9Y2OhLNRUpVLQl6S98hSm/whUc9boZ/xsj2m+2
         7ohQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeQImw9+q5w2pntbYFFvKtydfO+IgYAXi4C/MqebpF30UeyxZE8XVU/y9f9zpRbsZheEdEx8XqNc5/Ac/xuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/ijUxwkEY5lCPBgIiTnd4WLuCq4jJ8ZQ/ISCFPjFFffFsnjH
	vPsmdwe/tpmhg+CEyzSy+Cs67BzKHfOIC67kM9Khh468h9DJcZ1Q0AAk9Bf482xFrV1U7Z0K4mK
	exwLkYp7dWgJD1g==
X-Google-Smtp-Source: AGHT+IEDL6wyaXq4KVeCa+5cSaT1eT6HwgjeW/qH+ytywyB3jjXDr+R/rDF3sLSLr/FXsbnoKOvq0/msM05k6g4=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a5d:468d:0:b0:374:c0b5:565 with SMTP id
 ffacd0b85a97d-38260bdfb03mr927f8f.9.1732290078524; Fri, 22 Nov 2024 07:41:18
 -0800 (PST)
Date: Fri, 22 Nov 2024 15:40:32 +0000
In-Reply-To: <20241122-vma-v9-0-7127bfcdd54e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=CackrY4N4HrwWKJd4mh44KeNaf6Y+uJ77q1hA2gtWCE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnQKYKX/KFzHUB/ScZLT3bwuduBq3gubqN9dGbb
 zhWJO4uzlqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ0CmCgAKCRAEWL7uWMY5
 RmMND/9qq+Sg908pb5iHFBsP7RY9cC5qNfZFzfWuBMKlhj48SWuaTddtGzGW+uv7CCplsCcgeHt
 HAc286bLeHj6SasQPWO5wZ1yfZ9lc/TEdx2iQTqII9TNxR36DXtL5SZprMoBXYVjQ2Tywws7lHY
 xlQMpm1oy10QRFyuA3mbbrIGpz9LxAx+SNJ3AXDcKnehoHsIxXQiGSTN2db7DA+AuFl2jYjV5lB
 VIMg44+BKCwfbBhCZtkpUj0U/EHsDy7A5LhsBKv1rFUGccDleWk7uPBbj/LXktuYJ6nYsCBxS9s
 h5j4yvM/qN4whXwUmWP0Go6PcPTEATyx+1v5ekMf+mhLwWf3qCcpStayFbm0BNFi07zT+4nsZvM
 E228lqBxIZHtoO2z91VI8fJpZPMSi41fki2pzwndXccNGEL+EyHY7OyKAhtunktx6JOtW+TYRCP
 mWZ7+rFxasmzyRndH3DcUNWreRDBKAAr2m0cX5l/2Mx2kQRt+ZbWLBDlSp1fcGwHy9p15TDDLPD
 SEPyL8FilnUErOT3rB+EoH3cywn1kC5I4rTeacyutzbqiCk6fcOTZ0bA8ZjX1uo5vgrXQrfcHqt
 BBIvXbcN36yINaxKYxh30yS6jPryfIoudkn5gxuUKV7Oo3BewdDxanK/Wgrg2EZeqqo5PeQTEMl mqmg/Y0+Mk6IEMA==
X-Mailer: b4 0.13.0
Message-ID: <20241122-vma-v9-7-7127bfcdd54e@google.com>
Subject: [PATCH v9 7/8] rust: miscdevice: add mmap support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="utf-8"

Add the ability to write a file_operations->mmap hook in Rust when using
the miscdevice abstraction. The `vma` argument to the `mmap` hook uses
the `VmAreaNew` type from the previous commit; this type provides the
correct set of operations for a file_operations->mmap hook.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 7e2a79b3ae26..4e4b9476e092 100644
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
@@ -216,6 +223,27 @@ impl<T: MiscDevice> VtableHelper<T> {
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
+    // SAFETY: Mmap calls can borrow the private data of the file.
+    let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+    // SAFETY: The caller provides a vma that is undergoing initial VMA setup.
+    let area = unsafe { VmAreaNew::from_raw(vma) };
+
+    match T::mmap(device, area) {
+        Ok(()) => 0,
+        Err(err) => err.to_errno() as c_int,
+    }
+}
+
 /// # Safety
 ///
 /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.

-- 
2.47.0.371.ga323438b13-goog

