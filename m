Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B2C329E6A
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244160; cv=none; b=CTTXND546MkQVHOBkuMAupOvpMYf66fwAMEHCHOIytlr/4X0Rqk3zT6aZSma5QD0occb+xnfyBPzGDsfNxNEuxl8TK9ul+GA+HhA6NdK1ZbRauXMNPsXM9MQ4uiLw5BHNFeJ5SZ6qIDVbIj9Ph0ummZnfTLUC4TT/AVMDwosflo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244160; c=relaxed/simple;
	bh=Bll4HoxZRoadw3eBKwz/4mSEumf8EkZvc3IvUn6eioY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSl2D+9Q3eYM/wla4kxUhHDs9m9m8+LAIKmIjNkkNBLreigiZYxqR8xsI9zgJHp6xFdwq/RH9xMl1RatPKJCuflZEErNK4XI+FgS3LAR0QCKnmiayskZM9fkfyKCPquL0SefE6tKEFRg3z/rgsxA0pO/38Xkg6RzwyEQl4MGyqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=LPLKD0tK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="LPLKD0tK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f2385724aso2675152b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 02:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1776244158; x=1776848958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POyxFYQ+V9mFipVgPFkvK5v/sTQB318bLmjeylTNt7s=;
        b=LPLKD0tKgKfPh8vYiiiYqBgk+kP9aHC9CBsLSaTb9840FRjN04bDdXPAXnPf0MhEkW
         MENYRxzu5C3YWfBDjHXOFRx1egzSnOT79SC/P4YdizmLiuPC8puMHFKdeC+G+Fuy3Ky7
         RxoFL9qO83yVasKwLWxoWPSNIzRPyI+yC/K3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244158; x=1776848958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=POyxFYQ+V9mFipVgPFkvK5v/sTQB318bLmjeylTNt7s=;
        b=VSjW3R1KNSRo4CZjgStjeguDG6KlGbkU3gxU9Y8RDhkcNYu2leIfahMXKFoa18honb
         awdUXRGeqoomJAxVp4zg2wE0V9YOiC0BJWWsDwkG6xLN0h1RZrvHcbfBma4ktJGbPP+q
         t+87y+stJc7nS0HoaKoAmHI0AgDAgGw+kRkZVk/7L/FAqhInQvpjNHRkvSoN4wxGkjpf
         Usj0b57+BLIKg90SUyz2NHDJAYmHSTVNR/gQbuae6W7XKblb6CWlqS5kiCZxKIqO6STF
         RgLPVCII9m3zKkPQYZIYjX18KH4W/BhppDPL3LJV5X/e7f2ccPZZ8V+TjjeQlZA6tcvU
         U21g==
X-Forwarded-Encrypted: i=1; AFNElJ98DJr4kV8gHFii1m3Pf1aVTbvXFP+p+FCRj+t9nYAooRbqAMki5IRRvelHdPTrFlAQaPPl9UMhJX1WPxcoHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDteAnte1w/L/PuHQ7MP8oWncsO1M/XEJg9Xbp0tpwOcFT9MRu
	xKCdSIrVb5PuDqEwpHhquSDvVSiR8FCU2na5P5ZQtboOQS9cYvhXg0BztuFyXJoPc4A=
X-Gm-Gg: AeBDieuIrP+lL7zEgSWLe106x4+v/uHsEo1oksiNhIgBQ+lfHw4wsOIfq1GQpq81Yif
	16DE5hF/pM5o88A+NkKM7mbIR6kZfOeYQBWKFMI6IP0hKMwz9+/1ydeosuaYoLZ5Ijj/pKrqm2o
	HMBCYJtdg65/FELlZQBeASbPVHdyzImH/+ZGYSKUOUWuOP1em5tt0JdLCZPjWjyFikJEyMdr/hi
	tXcYayA+bK7X8bTefzNSlVFKB79QcEbOr7pwDyRA1MviOJgBFmfXpZ/A4+U6HOk/ZP3CVZx2lkQ
	WVv834DgX3C+jB/LPiPfhvWoRENqWdAavcbIpHLhl/iYKzkn0VV9sVn9tTH00+Gr9pHvLn+czKz
	H8awJ79BpExYIs4TmERL7oA4iIMK4Ucqy1C7/upkCoeAcI6U6kgGCiYnJjP5/Qta44z/70t/q2d
	mIar6E/y4l9eUDimq/U4sZv3Ni0Tab3kn0a+neeO2/wz6p/Ot1BrgKE2KpS9A=
X-Received: by 2002:a05:6300:210d:b0:39f:c48d:fcd2 with SMTP id adf61e73a8af0-39fe3ddd0bdmr22715132637.27.1776244158271;
        Wed, 15 Apr 2026 02:09:18 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1074619a12.1.2026.04.15.02.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:09:17 -0700 (PDT)
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
Subject: [PATCH v5 3/4] rust: miscdevice: Add `uring_cmd` support
Date: Wed, 15 Apr 2026 09:02:14 +0000
Message-ID: <20260415090851.4897-4-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415090851.4897-1-sidong.yang@furiosa.ai>
References: <20260415090851.4897-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a uring_cmd method to the MiscDevice trait and wire it up to
file_operations, allowing Rust misc device drivers to handle
IORING_OP_URING_CMD submissions from io_uring.

The vtable wrapper zero-initialises the PDU for fresh (non-reissued)
commands so that drivers always start from a clean state.  On reissue
the PDU retains its contents from the previous attempt.

To enable uring_cmd for a specific misc device, set HAS_URING_CMD
to true in the MiscDevice implementation.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 rust/kernel/miscdevice.rs | 81 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index c3c2052c9206..549693e6aea0 100644
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
@@ -190,6 +191,31 @@ fn show_fdinfo(
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
+    /// describing the current execution context.  When completing
+    /// asynchronously, do **not** forward this value to
+    /// [`crate::io_uring::QueuedIoUringCmd::done`]; see its documentation for
+    /// the correct flags to use in each completion context.
+    fn uring_cmd(
+        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _io_uring_cmd: IoUringCmd,
+        _issue_flags: u32,
+    ) -> Result<UringCmdAction> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// A vtable for the file operations of a Rust miscdevice.
@@ -387,6 +413,56 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
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
@@ -419,6 +495,11 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
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

