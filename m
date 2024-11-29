Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6759F1A070E
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 16:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732897990; cv=none; b=MVGhBTWN8O6IHTdix7qKcdMwm1emAVnBzViFvleFlp0OGPhaXYgDvurl+w3BINIeOzvIe1rhey6caYD75PVir9O8qzTPdAVjEYu5rTVTQA7LLVe6ClhTCh5NvLPjEuS6pOg8kbq9cNbV8wKYzjcIh+LH+woORNzNoGjQr/ETOEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732897990; c=relaxed/simple;
	bh=IrZvUF0XzNLQMwbfZ0pN4UXzZJ4vVLLu+S9qv3H24zI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GV085SnjxL3Hw/hogF0LnYWFOQYU694GO4DiIE4seiUk3kyNvUr5cKXiW9TyzEHwRhiVdY5m/uBnVCb6KEg7jDa8rrlzbJIXl6szsNcl0qhO8r4k5XNv2B8LgixeNzKjyKTSNXBTIc6I9KxjPmTfbSqRlRCxQqwCNWjMXucHyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mAFngJ98; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mAFngJ98"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-434a9861222so16344535e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 08:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732897987; x=1733502787; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UnhyEorAiAZu+6K7VI1xMGROpYDgIW3AxkwRW5dHmBI=;
        b=mAFngJ98XJGkitYMf9/9Ry8J3xaTIfRhJdrgzSF/b8IbYhyy0qOI/PIbCzsYc6Db8r
         rkM465v1QwzelgEd3M2zordSFlqdNpRUGkYG5KCDf68M/zQRcsG3uid0AaGAXPXUuI6T
         AlXjIcoCRTBOq2NVju1hZNhGuSspUbwfS1p0Gf+dO/WppifTOL0uxydQiEFZAV5ak+iM
         E/fAuSpDBO1okQ56JUeluBzFmmM7khs9Mr4he0Qqi/XAcdxyojHwWHd7nG/gXx9uZ5XH
         bslhAwiMDhhf2iDXXqnmIk00hUA2MOJkn0/bv4NZBasF65icQEM8O6O0kj2X4/lof/u0
         oKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732897987; x=1733502787;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnhyEorAiAZu+6K7VI1xMGROpYDgIW3AxkwRW5dHmBI=;
        b=i5QZP2WDcV/KgzpiSt5yht7PPbTQ1Gduz/ywBrrNgLdus/hSJC5H6JtvNfq/y6SNK0
         /YAyssBDBj3ghrdXoQHQcbyssbc4yPHePv6/rc7sO/NHT2Th+w0g4sFfeCYZmpe9GxjJ
         AfVMhOc6RUtRMjVHB3UXxtbnSzcgmSP0WU94kE4wk3ANtyoDkxMl2FB+8R542XXsDEq1
         mPUloLVIvloLWbzzAhlmR3W/5cXR+FCQ60Wn1cU0R3fmb9hRlVcXpmjy1Q1A6V7+TFTz
         PlJPablD2TzdceYyB6jTQ8S/v1OTcisai7F0tojJPehQQaSfvKNFUdV1V1Iu1bxlfdIR
         aqUA==
X-Forwarded-Encrypted: i=1; AJvYcCXWYa37AHGlMIp3mLGwGo+JECVZENiDvn0R5FQUICvG+vIkosotJEjbaqw28P0RYo0Mvo1E4HQia4NlO2KURQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3a+5cX7KxRKCWQ3kZS+aVl+1LtYRb+Vju8hsO4qIICZSeEyZS
	qGc+a9edChZ7CzL9mNGbFSXbKOQeQCoAvgMb4mkQu+CgE8oZVGlKPMbU7LZ7D8G9wtx/14WTj0i
	ckTg66+nf2AiCww==
X-Google-Smtp-Source: AGHT+IEIkhciFv/SoLFFHF6Vxq9iGEQEsrBvyMo5yav6t96an9Wy9B+lJz1jJamwd+Gu4sliNPoz0+xpNLIZ01E=
X-Received: from wmlv12.prod.google.com ([2002:a05:600c:214c:b0:434:9de6:413a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b24:b0:434:a754:661c with SMTP id 5b1f17b1804b1-434a9db83acmr109938695e9.7.1732897987022;
 Fri, 29 Nov 2024 08:33:07 -0800 (PST)
Date: Fri, 29 Nov 2024 16:32:40 +0000
In-Reply-To: <20241129-vma-v10-0-4dfff05ba927@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241129-vma-v10-0-4dfff05ba927@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2822; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=IrZvUF0XzNLQMwbfZ0pN4UXzZJ4vVLLu+S9qv3H24zI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnSeyx3XZetGy5dEQOShQaSbbMRUwJxGEEMjLw8
 9RdWQXDUSaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ0nssQAKCRAEWL7uWMY5
 Ri8ZD/wLIEpXUXaIuGN7hRbJCy7O1J4CbcrlTxrSVyF9E7xofr8DGwiW2NYtspHF6JvEA9vEbKZ
 VEUdDED+X/G1IXI86Qv4eEGCrNHUL6+idMjPfMaYJw55Rci+8r0Ewi+h9QePeYJNaw53q74kjpT
 szaSueywBq6/KA0AMbekbkpvM/Mlz3sBAqf0pd4McgQOuj3tp0+ApxmJf6lh4+52AoMeKLT2HdV
 ceUq8pZjoh+KV4CJIX5olRuJzxOgYXDI3Dtg/eMH/XM8EjyEzWTBUmdFn2REX8ei8h4BqWYrX3A
 ztvAOHVQjzOO8cHP1ew5/ExWAXiOZGn5/ZYVpWMQngFnorTAyaag3wK17LHrOZUbkx7YffpqrBN
 +97cJ1Myn4/bRhJoAB1V1MYxrQG+8hsaoddXg0IjCtfQi2p1o1aLqkjw6QO3U3q+q5v3ONXSzV3
 K65OLwOalr42aJNfyYeQJafHoTzHvpeJ56/O0bGWqaxqVVd59t/l4NjCAb3vHdZasnVmz4W6Ag1
 pcPQWa5L+SzCdE2TxRKYKm5+WXtXUbtC30SMhq+MoPqmFStspXIk/CJ60nyzvxG0hgL8P+ji6Po
 U7yv2fwSlp1YrDsHbvR2mQe0lh39+/0PLppp8PGqkRDBRuKk8s3ccdhTh6/8QiMsuyTda/Hp5g4 rC86Q3qz2t7SDcA==
X-Mailer: b4 0.13.0
Message-ID: <20241129-vma-v10-7-4dfff05ba927@google.com>
Subject: [PATCH v10 7/8] rust: miscdevice: add mmap support
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
 rust/kernel/miscdevice.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 7e2a79b3ae26..99e076338f39 100644
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
+        kernel::build_error!(VTABLE_DEFAULT_ERROR)
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
2.47.0.338.g60cca15819-goog

