Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07613D3494
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656855; cv=none; b=r0gGrM59yelgefyXLjqMSheObaYO0F0879Uq0/biBikdaUbGArBR7SX5FtNa9kb1Si0bbtvpcD8JMWKvAfNaM3wWgYlZUYOI8vqclymJpnxMPrpAigS2p3zZGoT2e7rBGYgi6yoXcB2K5Nszoh5qd9zE31o/oAdv3coCII4lMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656855; c=relaxed/simple;
	bh=qJPvaTDkdQnF6GB2/DJhWc0YSkNmMUsm38EVHAmFNn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEiRu4xA2MMjj9K0Q4aXSDJOcpfrUN7HISI8EI5KLhCrPp/9/RWxOzRimd78dSdnnGZYRV9wK4l4CpB7ZAgXRzzEQIO9V3p2dMsnauGSUrVN1n7CU1Zf2lIDEUZoLJTqLqhsE0/MadJ+E5QQLvQWdVpZP7Pj9quEFu0BITrvnXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=PNlUV+I+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="PNlUV+I+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b24fdac394so60844825ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 07:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1775656853; x=1776261653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb7E2CfVk9owGcBqZvU+iKSSUuaUHhRXNpFRwID2YDM=;
        b=PNlUV+I+Ca1UNcyqt0hxPVFYhnCySXEzJPFi+swiEGQ+qJ8KFOmPDTNWVPnYhWGoSW
         L41DtRrz+bdKjyEvwLOCMEXdtEsI3QQelaUHzJyaxu4wTlV6E1FtQ59WQxaTUkMgQEHI
         sZweFaK25pN9SmFWt+Ep29O58KKbVWf0Dgcjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656853; x=1776261653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cb7E2CfVk9owGcBqZvU+iKSSUuaUHhRXNpFRwID2YDM=;
        b=ZKA47azJD48RG2S55BXzuqZ1sI8Qsynapd8cyL0RBnKaJ/lzH0KCRVDp7iSpL23ux2
         KVsdX9mQe1Qmi5OK9YxqvWasNUIB6HFNG5oAqDKSoIR+ZoDiYkT6wqDf94Ptq5UzxqAp
         u70voc2EnyNzsjtCIjNfqEhME6B3fsRu86WPZfd9XDGs1uROtpBaGo8Qq4ouGEnPjM0x
         SarS+QaUEqVOtnq4HdIyY1GjL6Y9Z6CpoVZ5mtyT7BXv32XxsVWi6iEYyJXP3NMSzzjV
         w0AqGI9UlwKWvPqMa9bhYUeeMJS34a7WoabN1JgxoXad1q0m72/PHvsHr/LsxcLlF74+
         eyTw==
X-Forwarded-Encrypted: i=1; AJvYcCVX6HrkicgFltM5Ib3p/o2VeANHnq3sS57vF23KQQ9bYKMIH1xykLe3+om64fkh/qM6AlhQVeB8YKCTj8iq4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8CPXs4Q0T5fHwsDpNHZE7hDz8RaNFmXX3dYSvh7jEkjOPAtkN
	4r5RXASbfQScRFRfn5Y0UJzuUkl1CKiD6XKeObFni/7KjvNKwQMXTRUugYybdzmr8TY=
X-Gm-Gg: AeBDiesFn1XUbTjo8vCTiSoS30oWkDvzDOeumwi91El7fcrW+YEWp2vsPcFRTjnh15t
	qEuLtwFAnoSXf1wnrM72cWSerj4aK5fjDgA8yQuBe/JA/o6b52xMSZrWtCP77OnU7Ey3WvAA696
	by6PWpLnr+UQKEH5Z44Q+jReXFwa3sVQGic1UyofVs6499963dZLg8FOsF9GSTw7nq0VQhjNIPE
	QhjiV2ca3aIxgniUVQTH9OaoaZHYh7R7Kz/2vze8ZD3k4tghic5Yft0Bll0m5l+QsIgw+N6NHzL
	6JZ6eaPWSr5QISujZldyIEyWa1p5o1/1nkYisoPMJDGEc8c387xE9AQYR+kYa6WnaUtM40xYmQi
	9suCbg3pcsulFRg3MpalOuACIG0YV3Oi9DCyWPYB8xx4HwpQO+tC85edbS755Z1jwUgVpR/93vw
	/NIj4s0tk6l4uensuS0Z63FerG3SDUUM8IawuHT+yJQ8EmjYT0m+QAb0u9vjQ=
X-Received: by 2002:a17:903:2ec7:b0:2b0:4554:9c24 with SMTP id d9443c01a7336-2b2817a20e9mr224313505ad.32.1775656853111;
        Wed, 08 Apr 2026 07:00:53 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747612b7sm204465145ad.23.2026.04.08.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:00:52 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v4 4/5] rust: miscdevice: Add `uring_cmd` support
Date: Wed,  8 Apr 2026 14:00:01 +0000
Message-ID: <20260408140007.8401-5-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408140007.8401-1-sidong.yang@furiosa.ai>
References: <20260408140007.8401-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces support for `uring_cmd` to the `miscdevice`
framework. This is achieved by adding a new `uring_cmd` method to the
`MiscDevice` trait and wiring it up to the corresponding
`file_operations` entry.

The `uring_cmd` function provides a mechanism for `io_uring` to issue
commands to a device driver.

The new `uring_cmd` method takes the device, an `IoUringCmd` object,
and issue flags as arguments. The `IoUringCmd` object is a safe Rust
abstraction around the raw `io_uring_cmd` struct.

To enable `uring_cmd` for a specific misc device, the `HAS_URING_CMD`
constant must be set to `true` in the `MiscDevice` implementation.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 rust/kernel/miscdevice.rs | 79 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index c3c2052c9206..7fe6021c2c96 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -14,6 +14,7 @@
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
     fs::{File, Kiocb},
+    io_uring::{self, IoUringCmd, UringCmdAction},
     iov::{IovIterDest, IovIterSource},
     mm::virt::VmaNew,
     prelude::*,
@@ -190,6 +191,29 @@ fn show_fdinfo(
     ) {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
+
+    /// Handler for `uring_cmd`.
+    ///
+    /// Invoked when userspace submits an `IORING_OP_URING_CMD` entry to the
+    /// io-uring submission queue for a file backed by this driver.
+    ///
+    /// The driver must either complete the command synchronously by calling
+    /// [`IoUringCmd::complete`] and returning `Ok(UringCmdAction::Complete(_))`,
+    /// or queue it for asynchronous completion by calling [`IoUringCmd::queue`]
+    /// and returning `Ok(UringCmdAction::Queued(_))`.  In the latter case the
+    /// driver must eventually call [`crate::io_uring::QueuedIoUringCmd::done`]
+    /// to post the completion to userspace.
+    ///
+    /// `issue_flags` carries `IO_URING_F_*` flags (e.g. `IO_URING_F_NONBLOCK`)
+    /// and should be forwarded to [`crate::io_uring::QueuedIoUringCmd::done`]
+    /// unchanged when completing asynchronously.
+    fn uring_cmd(
+        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _io_uring_cmd: IoUringCmd,
+        _issue_flags: u32,
+    ) -> Result<UringCmdAction> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// A vtable for the file operations of a Rust miscdevice.
@@ -387,6 +411,56 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         T::show_fdinfo(device, m, file);
     }
 
+    /// # Safety
+    ///
+    /// - The pointer `ioucmd` is not null and points to a valid `bindings::io_uring_cmd`.
+    unsafe extern "C" fn uring_cmd(
+        ioucmd: *mut bindings::io_uring_cmd,
+        issue_flags: ffi::c_uint,
+    ) -> c_int {
+        // SAFETY: `file` referenced by `ioucmd` is valid pointer. It's assigned in
+        // uring cmd preparation. So dereferencing is safe.
+        let raw_file = unsafe { (*ioucmd).file };
+
+        // SAFETY: `private_data` is guaranteed that it has valid pointer after
+        // this file opened. So dereferencing is safe.
+        let private = unsafe { (*raw_file).private_data }.cast();
+
+        // SAFETY: `ioucmd` is not null and points to valid memory `bindings::io_uring_cmd`
+        // and the memory pointed by `ioucmd` is valid and will not be moved or
+        // freed for the lifetime of returned value `ioucmd`
+        let ioucmd = unsafe { IoUringCmd::from_raw(ioucmd) };
+        let mut ioucmd = match ioucmd {
+            Ok(ioucmd) => ioucmd,
+            Err(e) => {
+                return e.to_errno();
+            }
+        };
+
+        // Zero-initialize the PDU for fresh (non-reissued) commands so that
+        // drivers reading from it always start from a clean state.  On reissue
+        // the PDU retains its contents from the previous attempt, which is the
+        // expected behaviour (e.g. a driver may store state there across
+        // -EAGAIN retries).
+        if (ioucmd.flags() & bindings::IORING_URING_CMD_REISSUE) == 0 {
+            if let Err(e) = ioucmd.write_pdu(&[0u8; io_uring::PDU_SIZE]) {
+                return e.to_errno();
+            }
+        }
+
+        // SAFETY: This call is safe because `private` is returned by
+        // `into_foreign` in [`open`]. And it's guaranteed
+        // that `from_foreign` is called by [`release`] after the end of
+        // the lifetime of `device`
+        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+
+        match T::uring_cmd(device, ioucmd, issue_flags) {
+            Ok(UringCmdAction::Complete(action)) => action.ret(),
+            Ok(UringCmdAction::Queued(_)) => EIOCBQUEUED.to_errno(),
+            Err(e) => e.to_errno(),
+        }
+    }
+
     const VTABLE: bindings::file_operations = bindings::file_operations {
         open: Some(Self::open),
         release: Some(Self::release),
@@ -419,6 +493,11 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         } else {
             None
         },
+        uring_cmd: if T::HAS_URING_CMD {
+            Some(Self::uring_cmd)
+        } else {
+            None
+        },
         ..pin_init::zeroed()
     };
 
-- 
2.43.0

