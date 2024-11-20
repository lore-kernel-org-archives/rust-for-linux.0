Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD241DE8AD
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114596; cv=none; b=HkNldJBwh57P59fMP+egFQ8w7z2SuE8E/LzR+/yOtN8v7P8f59mLtrWBX5GbZTir4gbLIUB/2wZOtSw4q0Cb9MML84EEOpvSIIdOb7h94K1jA4XBpSPdFgK6XD0XyiIqkWeznHq2lr/cqJQ7k2a67TdSlMv6/M+PHYbqHvqjdMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114596; c=relaxed/simple;
	bh=GSw09bqyA6K1PcCK8gagOT2XwF7uH8Q/0z1wyixcHDs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WfSFc68JHUxCkxX1imOn3f8bMlGGpYTR5QYF44ZkXSVOtYNMFw8QKJORyiwBDO7YD5/0uj1Fm3aLsrhevAFoCI0BFx2+pSVC9FRZCgiqUWJmez9flIYvSstpZJ1nxwDhqb8dBTkmRTwzddj+nQShxFd9U6XDtawNJkxI8eg1ick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2FNQqq9; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2FNQqq9"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-382428c2564so2219428f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 06:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732114593; x=1732719393; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBJMJ0qYrky91mwQ0u5syokhvobq81rvT/hL+9f8jt4=;
        b=u2FNQqq9bZTA3zzHIX9y/qMMAYIC1agoD2biJiFH/RJh4wDWrLYlK5ncZ5H2R7dJzT
         HkEzkjqR1U3i7yD9I0rO6/FqZFsOUuT1od8YS4SQAAbzttsZeXIsy2Dwf2qQZY6gHA9a
         kDo4uJkP8GRzfwqcKzn9OH3ZNSjwSXvaIZYC9qFVdPPP62B2nVfa9VO/YhKHnE5oSi4/
         iDTz+4fe6WSfT2yzZFMCBL8eCahI0K+5vzidvaTVnEvDmu6ywiLFmpHjVPTB8bFjZdwS
         zOuyKNocKhkVsXzp5AFFgJExdJiRHSaW1JEpsXT9caZ6dgyNOAcbDaLddfg1+ix8bfYE
         qi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114593; x=1732719393;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBJMJ0qYrky91mwQ0u5syokhvobq81rvT/hL+9f8jt4=;
        b=bW1UereYsprXra29XNw1bJRQ7cYVGXVaIt9DoqU0TE4AiFtDTD7UTK4Xlx0ShgbknB
         CpR2NKPSAJvM5u6aCCztqOdbZOlHy0Lh4O5vOp/1AIOxs80A+zbOn8ZejqRJt9p9mq0L
         PnlXxdEOXhsiseQEBzWccCMcipNbM14aij+pv3SrRDh2LmuyKylnfqq61xrfc7nOOunj
         9+oAnTmrvdgZsGmKgL68zhNRef2HKexZWeCdKSukNGmkTTwsAFyl38Pq4ujR/ETyJ/vs
         xcniJ8GDN11HRGON9xj76WlOZUA9z/SxO9cq75La49wa+OeQEcFxIxI48bhxDKTbRT8q
         5fkA==
X-Forwarded-Encrypted: i=1; AJvYcCURy7BSd0AvwnpnKtTP4U1QklAGKWDtekK4PcSfTJDCD+FZRGWgcszIjsrdymiFO9pdEbgDVJJrvSr5IqFL3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCmg+MZLuuBSCMRX4uqF5fAW1vtyqW5AoPeoNsibpxW6VJUDu
	D10R66ms1bXAVkzrK+57Z02aVbtE00vG2YTXfwXz8g5Fwdwz7K9TLnEJNYiQOlUFWoBGPlW3huw
	+eok1Js96RX9QcA==
X-Google-Smtp-Source: AGHT+IHg6gC2fHXTfoa8HybdbCejL4Hw2wCXFWVyfLSy/FMj3wKsyFBkjC9iLS8+VOnYGq57+fL7fZy03dC8naI=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:68:fe9:ac10:f29e])
 (user=aliceryhl job=sendgmr) by 2002:a05:6000:148:b0:382:3745:e843 with SMTP
 id ffacd0b85a97d-38254a8593dmr859f8f.0.1732114592756; Wed, 20 Nov 2024
 06:56:32 -0800 (PST)
Date: Wed, 20 Nov 2024 14:50:01 +0000
In-Reply-To: <20241120-vma-v8-0-eb31425da66b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241120-vma-v8-0-eb31425da66b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2667; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=GSw09bqyA6K1PcCK8gagOT2XwF7uH8Q/0z1wyixcHDs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnPfiM46FQ43oKCfz0YbqQO2Vr66Kdgk66Jo5tx
 JPUulsyfy+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZz34jAAKCRAEWL7uWMY5
 RkXqEACEB7yn2mFW0lgsKxYBQ4qe2+54UutRvkGiIwc8wfu0WgQ+1KUd04XtaEmpyHADZ+itLu4
 w1PUr+Qf3HccuAeWtsE12ckyvdIacsnpDEl73ajj1jGwJsZwDgM27DJB3Pe9OaB8FTOZAPbaLEZ
 JOmLqMLXCULYc26n3q9/Yb/FMwV41XYcxFPovNlq16vpbsQ0PTY9A//QKAhhINkxA+HD6etiNf+
 bMN7aL4D5wJW9KHNeA+ubufEouX8yDKZF21ft/+ZyGHSs2bL6qlhwG2ZUly0H8wtI6G0XHciaNh
 xe2agSElixu2sn+THcpulk9QebWT0nAW3alVucVH8TVZPzXB04MQdA1cMzSxg8yHCSlRdWdCtAi
 jJfO979h+KcrnKE2+KMi6YV1lr9SEcLHt8q12IeUWIZDUD7Bb8JAC9zi5B67xB11hl2HA4kfdZm
 jo5jJp9K3lAgAmFrxIhr5PhOpPUauxswnhtFQLl40gmlHRUFh6eOngHO/oMoCLRqKY3hRlw8nv2
 MIK9KFyNCYT2SFWifeBNJ575bVLcsnE9ESTUpSgsQU1V1SfWI+UENNWsPrxUd+sIY4rYkGrSTn4
 1ptpfZuhqYA6ZNOY9B2j2hhTh0rf1jOBrWFkm0AuSio6VJCdcqB3J4dmzMR4zSY6VslhXm/+yV+ q10Bd9/rJyXui7A==
X-Mailer: b4 0.13.0
Message-ID: <20241120-vma-v8-7-eb31425da66b@google.com>
Subject: [PATCH v8 7/7] rust: miscdevice: add mmap support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
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

