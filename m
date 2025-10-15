Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164402FBE18
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 04:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760501012; cv=none; b=Z0l93gfEni6uBB4Tu6huxGThIy4Xa/RPjny5gmfKeNYxjayNEvkRxt6BMY8cU+mYTuiE6ODbv8AJPaRv2kcHgUuWlYbMtf8VeFSk7jcHuaIY8B7+5pAHiLhCFNpYgeIL9thyRYrbzN5f8+J6g3wsip08VV9UTnz3In+u/vMClCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760501012; c=relaxed/simple;
	bh=N/Hg0cUpSuxjkf/64ySl79HzvAfeUdFUvUkHgBa06ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Dig+ThWk52L9hAVLz2bDMM+mPt1jvHh29n1G1FaGDO8fkam7vcMRR+J+HHmaw3qgnrM2q6BXalFM7a/Y/x/Xjlb1aKyt5YM87i/6cuKmB2se3Wa6nEA9tL2d6e5ta9taK5+9ht1yv3fWoS1Q45+Qx8MUBj2fce9DTlIKVbe/6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HbS3Lx0K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HbS3Lx0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760501010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cTJtwMXIeLnmZnv2DTXzRty+qoslZ2OR6cifyBicWw=;
	b=HbS3Lx0K9V0uFrqwXO4gq4RDKJKX352g6Iojn1CWRJz5uiXzM0fqV6lQKV6x5lCUWUNlWt
	yfKHs20Mpe0Mu0XEGFOj5G9jfzSyHOoDrnpAxHZyfmTUC4Ls+I9mOBpBFNVfMTG2qNg80U
	geY21HyFQSVEL12yIi6DtEeq69NMocM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-CJgi5aMnM9awD_iu1vfMIA-1; Wed, 15 Oct 2025 00:03:26 -0400
X-MC-Unique: CJgi5aMnM9awD_iu1vfMIA-1
X-Mimecast-MFC-AGG-ID: CJgi5aMnM9awD_iu1vfMIA_1760501006
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so27072990a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 21:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760501006; x=1761105806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cTJtwMXIeLnmZnv2DTXzRty+qoslZ2OR6cifyBicWw=;
        b=vFiXJaLNjW9QTaF9gDL8O66/5ZrOEufUklXkpwECYi2pml4m5i2eOyMEf+NeF8tIVO
         2ZiqGRsM+IZE39slophzSDDX/jNqbp1h2T+snX/84Dbg6bCRYazV03L+LPWDe59aEGUN
         +nTWMyXeno7cIgvRmE1YJVW3UVmqpixQ/NGiCow8CNujpjN4Y5OliDCGA0Gsb2T8k4cX
         L2pfl1lbt5WHL76Ku2htooXQlaWpHlFMprwaW4GXB7NaOFInCy88Dmd1CthKYyogT/dx
         bmPyTCMuk/iPzaJPifgilX8BTcKWHgoU9DXdlZxlx1OsMfWpkdx7WSTAJ5W5wmshHpGh
         tquA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ0KTWp5COumyxiIlmjxamGKT97MOTfK6j0mK5fCjFG2L18FURSC5tRjPP99GzmEP9iiXJMF8AHmI6+0U5tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzcC3iQnBN3onGvxBDmuerHOXG3DwHks+l6zIgfuq4hpP/8gve
	StSlltI7y6wBb0AFAJaxJudWc1gaj05maQC5D6o1iBV19lyl4D8MkZP5jaPDN8bNi6te1E/Bclk
	UVXLQVo1nISDiWgkrMo+DLafATwp4soS25NQqhJj/0QansPy8kC6qOOuSNiH4fYlEh6+0
X-Gm-Gg: ASbGncuKC8KHEzu2AJ+hBZsMlIaMBiA69kb2NnwfNPYg3ADYxv4uEyt2lc2RcjKThv4
	ZSUfCV4oEg0PUJ/LZ0n3FWeqXgmPL6ZHpIPx99YBBrWyVpwlKdIyBDQIXgtrxjR2c/uh5B3czWO
	lbDphaSoKv1ISblkoIim98+0Pfdcn3cP3uhxUvUzsnp8xk96XUzo8NGIVBu+9iIPTk2IbgpA0xF
	M6SgoBbedIvixw8KUJkLJHqzZRXlBS/IERkYpcQDz0XzwgGeFFuq7qzkVZliLh6tTUEtwsB0nBa
	wjnidopENkS8dh38f41oDozACQQHzJiPHn4=
X-Received: by 2002:a17:90b:33cc:b0:338:3789:2e7b with SMTP id 98e67ed59e1d1-33b51118ee0mr34810889a91.13.1760501005664;
        Tue, 14 Oct 2025 21:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRzf7FvM8OpEXrg7e1JvlWOpwl6hxFANdBMkZkYCR63zSreZUiUYv4PdbI0oENdYzK01tTDw==
X-Received: by 2002:a17:90b:33cc:b0:338:3789:2e7b with SMTP id 98e67ed59e1d1-33b51118ee0mr34810857a91.13.1760501005275;
        Tue, 14 Oct 2025 21:03:25 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b978607cfsm608006a91.9.2025.10.14.21.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:03:24 -0700 (PDT)
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
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH rust-next v2 2/3] rust: miscdevice: add llseek support
Date: Wed, 15 Oct 2025 13:02:42 +0900
Message-ID: <20251015040246.151141-3-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015040246.151141-1-ryasuoka@redhat.com>
References: <20251015040246.151141-1-ryasuoka@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gNhpPGsARxJb83QEehXOOZccHbhkC-5wzKHqttWxGFo_1760501006
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
index d698cddcb4a5..2efd0847cde1 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -126,6 +126,16 @@ fn release(device: Self::Ptr, _file: &File) {
         drop(device);
     }
 
+    /// Handler for llseek.
+    fn llseek(
+        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _file: &mut File,
+        _offset: i64,
+        _whence: i32,
+    ) -> Result<isize> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handle for mmap.
     ///
     /// This function is invoked when a user space process invokes the `mmap` system call on
@@ -296,6 +306,27 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         }
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
+        let file = unsafe { File::from_raw_file_mut(file) };
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
@@ -391,6 +422,11 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
     const VTABLE: bindings::file_operations = bindings::file_operations {
         open: Some(Self::open),
         release: Some(Self::release),
+        llseek: if T::HAS_LLSEEK {
+            Some(Self::llseek)
+        } else {
+            None
+        },
         mmap: if T::HAS_MMAP { Some(Self::mmap) } else { None },
         read_iter: if T::HAS_READ_ITER {
             Some(Self::read_iter)
-- 
2.51.0

