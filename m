Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE27322776
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525590; cv=none; b=ebDHaQf2jTJdzFazVafyqVip8nNsQZIpVj1sHfUyqNa8THcRlAiF5Z6c3jlQagFtPy/QQy92RKwkq9PsjJkDEemNecQiUc9v1rM9+MIuWeN9n0drfHQo6gCu33pe1ZdrEJpWJk4ilckks0rSY2SfO4mjf/C6j7aXneRvNp58Z1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525590; c=relaxed/simple;
	bh=cgwwu95M0/PjQLKh9VcFW9sZO8JImGY2MFIZ04G52J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Dh32/7AzYErocCQ/kOEQ0AE/t7dxPjzpkR91Jo6zLWqrVu8NHbD5eJi7y+aH5ppuFYlUSdPixPRAbbR2Sy+rEgCUFUdd6osHBXe+ml7c0WpwbW9Jb7nd/ExZGtsIOQ0w9dKs2IWEbcGMboacFSilVCK15cx8whi4Vss4uUM/5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JiTPcYiu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JiTPcYiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755525588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2CKq6YUad3/DjmNn/azhMuZRDmF+l+ZwOAVkMKXPNs=;
	b=JiTPcYiuU12H1hPLym1RT6tqmFUE8B68nfdlElsUhvH72d4bLpMDFR3h5GDcpvC0PnolHv
	PZdjvBLpY44SJTgDm1qKDjgxukr0H5DV7wI6gBY9j20VgrSs11b4uVmt0mCfgfV24VcppS
	hIQXyoVnmAMqYSPuOvePR+WIdbhFWL8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-OywncE7uPYip3Npo-Ze8dA-1; Mon, 18 Aug 2025 09:59:46 -0400
X-MC-Unique: OywncE7uPYip3Npo-Ze8dA-1
X-Mimecast-MFC-AGG-ID: OywncE7uPYip3Npo-Ze8dA_1755525586
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4731a95beeso5406216a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 06:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525586; x=1756130386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2CKq6YUad3/DjmNn/azhMuZRDmF+l+ZwOAVkMKXPNs=;
        b=fpSuYfp5TYeP1f/VPjqthsuuDGx3cOKjU/uf1v3IeAleRsmqPZE7Y2hR+dHjfn2RTP
         Mi1JLGNhtzODjsTkCYKyUZgnyjoY/IrvFoGwpOgV5TngTUPMtcvgxraekisFF92tlDuo
         Qs6Whpmpi/3ZOf2yJCwPNWYHwmjIh1QsKMYrbv/5fmEjGu3pJxHZ/H9nHzmwim60sFRz
         lLn1XTjWzVdm/wjQrYE7B3Vdcvv7tFkUwfvVzpiv4VJF+rTfl9DE6smaVMcxLTLgQDnB
         6MK8EKnRrpi5yJgu1rdm4zmQ9QyGv+VgUfZYM+u9EGkP6cS3SdwGf7wP6MiE7NPBPF3s
         +4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWDZ0bwiOGRDTJtIsA8GrIxr2ffAgjCNwhMyEcuJ7pVxSD1lLv1yJY+/8z+aqE3fLKW68e78MW4Fa/ZX8AaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw433cyB2WgylgQkK6P4oh5p3curTqGPP3fIFlm/o0D8i0fIrf2
	ZC0nD1gx2ONNcMtFoJ2O/tlWYJvPeyd7L+xB9dkAOkhx1skUYstKKEQ2pXN6D5krcAIiIzSqY5Z
	ujacsrhJLIanSCz2RiwOrrsSPS1qkT5Q3GVRERgK/bUGRtpFw2zf1MdprjWKk6HQba6Je
X-Gm-Gg: ASbGnctH97pV3vtggd0YK9f1pD9hm4w92uzYoBuk3WrNy9P3pQrd02gGeU/2Kual5R3
	fhddvI6FiNEcb4v/XM4XlaBymZ8By1dxGWKj9VwBS8NFNzgEZj5oVZZB15HKX8eDZBfbzlPUphj
	J0IzF/28ZZIe/IgKvWpjV67T2dQ5R81ZdajB8Z+S1xvpaSJzR26RT3MJQxXnJ8RtqW31D7d7b46
	AIQ8FTLSgIWSZ7q0UWjShBv3G9XPKSrM8iF77YZXsKrRREBc8hafLH67dbA+XMfqqTWkUfvRVaA
	wGU/pkWpPo3+8RkgPCp0GUcue9abwKLxnQ==
X-Received: by 2002:a05:6a20:939f:b0:240:a53:79fc with SMTP id adf61e73a8af0-240d2fb95ffmr17025516637.29.1755525585651;
        Mon, 18 Aug 2025 06:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELiXPnW7YPO4rEF/tv+C6PkkDunFLclnjtOiZ6LrUtYCR63sCROrCmDGY+0H8Di4y4hwCxWg==
X-Received: by 2002:a05:6a20:939f:b0:240:a53:79fc with SMTP id adf61e73a8af0-240d2fb95ffmr17025476637.29.1755525585240;
        Mon, 18 Aug 2025 06:59:45 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d60978fsm8269896a12.26.2025.08.18.06.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:59:44 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	lee@kernel.org
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH rust-next 1/2] rust: miscdevice: add llseek support
Date: Mon, 18 Aug 2025 22:58:38 +0900
Message-ID: <20250818135846.133722-2-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818135846.133722-1-ryasuoka@redhat.com>
References: <20250818135846.133722-1-ryasuoka@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yCAkDwX7rXWz9fbfWODvzn4qML5HinfBOdOXj9wRP-Q_1755525586
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add the ability to write a file_operations->llseek hook in Rust when
using the miscdevice abstraction.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 rust/kernel/miscdevice.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 6373fe183b27..597e7b66e493 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -125,6 +125,16 @@ fn release(device: Self::Ptr, _file: &File) {
         drop(device);
     }
 
+    /// Handler for llseek.
+    fn llseek(
+        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _file: &File,
+        _offset: i64,
+        _whence: i32,
+    ) -> Result<isize> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handle for mmap.
     ///
     /// This function is invoked when a user space process invokes the `mmap` system call on
@@ -245,6 +255,27 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         0
     }
 
+    /// # Safety
+    ///
+    /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
+    unsafe extern "C" fn llseek(file: *mut bindings::file, offset: i64, whence: c_int) -> i64 {
+        // SAFETY: The llseek call of a file can access the private data.
+        let private = unsafe { (*file).private_data };
+        // SAFETY: This is a Rust Miscdevice, so we call `into_foreign` in `open` and
+        // `from_foreign` in `release`, and `fops_llseek` is guaranteed to be called between those
+        // two operations.
+        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        // SAFETY:
+        // * The file is valid for the duration of this call.
+        // * There is no active fdget_pos region on the file on this thread.
+        let file = unsafe { File::from_raw_file(file) };
+
+        match T::llseek(device, file, offset, whence) {
+            Ok(res) => res as i64,
+            Err(err) => i64::from(err.to_errno()),
+        }
+    }
+
     /// # Safety
     ///
     /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
@@ -340,6 +371,11 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
     const VTABLE: bindings::file_operations = bindings::file_operations {
         open: Some(Self::open),
         release: Some(Self::release),
+        llseek: if T::HAS_LLSEEK {
+            Some(Self::llseek)
+        } else {
+            None
+        },
         mmap: if T::HAS_MMAP { Some(Self::mmap) } else { None },
         unlocked_ioctl: if T::HAS_IOCTL {
             Some(Self::ioctl)
-- 
2.50.1

