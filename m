Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A33D3D05
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656860; cv=none; b=jDKfPImdhQp+urLanuU8zZ1THdC34rFbwiKTpxKW1eC5vAZHwK8njoC6+bxx/wnCATWe5u9lH3VU1WOefup3yPbUAxYXRUamskmtqbuaFH8F8YkWQp8LdF9Dvm6dhYimkF4o18oNbRUlYBa0GvyDuT2cdKSY/ldpp3zF77mn3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656860; c=relaxed/simple;
	bh=1RUauL2RCVFelsgWteX9fUSv4uF/cElWij5jQkbisA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trxMaZYUL1eMnymfivyb09iKp9pgTgErH0/GKWusjJ1PzuYvo0t2GUPZgjEtpFzoOCD6ORkOm9YGL2evImU4h+D3RHjD1k7YRtwOIa9rhwIq9CfnS5TLYC45KLIbcpUbQ98JJ60x+vxFUXg7h85kwWdi29Ls+SZvrev5p7Zr/X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=CetpzWbf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="CetpzWbf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad9516a653so31458495ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1775656857; x=1776261657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrpY2TRUYM3HpI2L60VlYb3B/Pcn97Bimqdq+op4nJ8=;
        b=CetpzWbfA8Q/tx2hmjRdyI3utdBF3O4M8YWcee1L0opioeYfO7iA6sUsbqLl63GS21
         Yi2PR5JqiL14rNtcMa/k50flMyTNEsuyLLs/SMlRBlsHqQEJJbOsZ1wfVgQvaYKFzd/G
         pQsfivdVWBmwSrg/4x2ADdxt8GkDbvEU1TeWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656857; x=1776261657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vrpY2TRUYM3HpI2L60VlYb3B/Pcn97Bimqdq+op4nJ8=;
        b=lO277VUZ55gnbF4qGK3mGNgiFCwHxW+u9EnHX00GLuPrKzJNwRQxMFUBq+gf1xKTOS
         aUfCsU8V0m0r/a4aX9mqhkxTBq+/OdScQsN+X34VhuZwtBfBo11n6ocUkZvWEcAiQhRF
         og7kp0MFWCQky8AeNKG1b6Nf9EwfLm9aOH42tzq8yPy4oOrAQor4Q9vnU3OfmDxhdeuS
         /GJpCDFx7Jkb9KvB0VrVHD3do+E4GcBR25/Rc/7C/2dcP82tRYPqLApU2Ka84KTNaCAT
         cHfJYv8fsP4dPs0G8Mu1beMh+TZ7OnHkmKHRxIG1srwCEg8h7z708xsBBYSev93XntEf
         7HaA==
X-Forwarded-Encrypted: i=1; AJvYcCW873mXJCC+sP9Oe4qYv6SmHHZ8X7HyDu4XjCulHXB4gyMSnOkZ2UaZOlOm57YojaozOGfxTY+9vTKhgZBNpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0w1iGbHm6a6vqAO1ju+4FjreIJivwujkvyYOgyHD7BK6iwth
	a51ZL7rMWGQ8ZjJH0m1NMjt5mKIha8gUAVQRs8job773d2wekfjT5MDNRV01quSn7rI=
X-Gm-Gg: AeBDievllmlH8KGoQIe4gQLNFy1oRnMAGpf30LaUhxU7DLbD9bX5yi7P3E+yQ5kfbWJ
	9+lzvRGxCl/Bd2IZprNTbblq5LnYxSv3QvsLiEM11q7e0oeEIh3LhB+LOY7/7HuYNuwJocLS2e7
	poRSLW41Z6z2fOAmufVEuvf7O6JDSgG0RUF8i8CgKadIshMK0CLEjbwXjzbgcEXQPkemKsrxu0Q
	uAc2jH21NlnTxiL9biE/tnYwXWG9umQZy1rgRYG2gJmSRRBVLvN0BJTVD/n6c23GF6iCaFz64j6
	vE5hAz4AUEqx4Af8EeXT7ovzFT72r0X/bapa9cECMyeFvPRBv9ccRrLJu1nmQT9IC5F55asT1dp
	R76FcXxaNMDd0j3Opj/W2FsE/GBBvddJ6UJP6qEap08+v3gQwCYcoyzZhzaJJkpQXGbjNHP/S/r
	EpQortFoQU4N8vb0ElCg3BrOMwimAKmGdzQoyPxTUYgwAHVgvblA9BM8KQzLc=
X-Received: by 2002:a17:903:37ce:b0:2b2:4697:78f3 with SMTP id d9443c01a7336-2b2817b3469mr224774545ad.34.1775656857085;
        Wed, 08 Apr 2026 07:00:57 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747612b7sm204465145ad.23.2026.04.08.07.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:00:55 -0700 (PDT)
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
Subject: [PATCH v4 5/5] samples: rust: Add `uring_cmd` example to `rust_misc_device`
Date: Wed,  8 Apr 2026 14:00:02 +0000
Message-ID: <20260408140007.8401-6-sidong.yang@furiosa.ai>
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

This patch extends the `rust_misc_device` sample to demonstrate how to
use the `uring_cmd` interface for asynchronous device operations.

The new implementation handles two `uring_cmd` operations:

*   `RUST_MISC_DEV_URING_CMD_SET_VALUE`: Sets a value in the device.
*   `RUST_MISC_DEV_URING_CMD_GET_VALUE`: Gets a value from the device.

To use this new functionality, users can submit `IORING_OP_URING_CMD`
operations to the `rust_misc_device` character device.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 samples/rust/rust_misc_device.rs | 53 +++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 87a1fe63533a..ef506e8b26fe 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -98,13 +98,15 @@
 use kernel::{
     device::Device,
     fs::{File, Kiocb},
+    io_uring::{IoUringCmd, QueuedIoUringCmd, UringCmdAction},
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
     iov::{IovIterDest, IovIterSource},
     miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
-    sync::{aref::ARef, Mutex},
+    sync::{Arc, aref::ARef, Mutex},
     uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
+    workqueue::{impl_has_work, new_work, HasWork},
 };
 
 const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
@@ -151,6 +153,42 @@ struct RustMiscDevice {
     dev: ARef<Device>,
 }
 
+#[pin_data]
+struct IoUringCmdWork {
+    #[pin]
+    ioucmd: Mutex<Option<(QueuedIoUringCmd, u32)>>,
+    #[pin]
+    work: kernel::workqueue::Work<IoUringCmdWork>,
+}
+
+impl_has_work! {
+    impl HasWork<Self> for IoUringCmdWork { self.work }
+}
+
+impl kernel::workqueue::WorkItem for IoUringCmdWork {
+    type Pointer = Arc<IoUringCmdWork>;
+
+    fn run(work: Arc<IoUringCmdWork>) {
+        pr_info!("IoUringCmdWork::run()");
+
+        if let Some((ioucmd, issue_flags)) = work.ioucmd.lock().take() {
+            ioucmd.done(Ok(0), 0, issue_flags);
+        }
+    }
+}
+
+impl IoUringCmdWork {
+    fn new(ioucmd: QueuedIoUringCmd, issue_flags: u32) -> Result<Arc<Self>> {
+        Arc::pin_init(
+            pin_init!(Self {
+                ioucmd <- new_mutex!(Some((ioucmd, issue_flags))),
+                work <- new_work!("IoUringCmdWork::work"),
+            }),
+            GFP_KERNEL,
+        )
+    }
+}
+
 #[vtable]
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
@@ -220,6 +258,19 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
 
         Ok(0)
     }
+
+    fn uring_cmd(
+        me: Pin<&RustMiscDevice>,
+        ioucmd: IoUringCmd,
+        issue_flags: u32,
+    ) -> Result<UringCmdAction> {
+        dev_info!(me.dev, "UringCmd Rust Misc Device Sample\n");
+
+        let (action, queued_ioucmd) = ioucmd.queue();
+        let work = IoUringCmdWork::new(queued_ioucmd, issue_flags)?;
+        let _ = kernel::workqueue::system().enqueue(work);
+        Ok(action)
+    }
 }
 
 #[pinned_drop]
-- 
2.43.0

