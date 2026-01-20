Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD81436378
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917763; cv=none; b=FNDZR/cBsZlbiPGTzSumHA3hfZTKayzUalrfwfGPrSXoK1jJ5V+NE4xGyhIZerG2RibcxueqeWEkdvDOnyq5PEEfgMSJ5Zi/vStURdc+5pho9Bg/ZPid+CbiJ/n/TUOPKo0ETHskzfvIaVelVwd9uvxzETJOhePFA8jUJsm6J7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917763; c=relaxed/simple;
	bh=xPu9fBuMUhOPCePDz8GtSrWF1C+vSgEjvzKG6Lg96aU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SeRrPQJKvfqSUoYU+J615/zka2/q7kA7q2UlhOTJ+ySrjcgfp8ZREMpNhyIkik1N8dvQQvyALbAu+6prM0iDcZ+mSe/F/vpkVo4R6dqYcr82juNeGfY24x+mFVcireDU433smLjfUcEixNKd8Pur3fVUs8zBxz7neuWoYJge7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr2DLEgk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr2DLEgk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso34252605ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 06:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768917761; x=1769522561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFD71p8fWspU3BL1+X8LZN5zYONG2aaCKcJtMsQB+Vo=;
        b=cr2DLEgk7MTf3awz95Cg7680K1kjdZyZtChH5IuSAjfiSBoSTZxE7ESLhQyfyYSTb9
         PTHCDB0dycyISwyJnnqrsEFo09/6qjEnHbEdcH9+0JiGaNzqqrzJ8Pc/A8GvkB+uLW84
         sswgGbKxyZC09fQMDRiHPOXY+XnqXxOrFXLFay8DiCR/AIgGcbPMsPVbZQaUD/mFwzaW
         JrqFeO2WJpPT9D0bIqBDCF9zBpbdTh3kzYARvR6XFvdFRY5uXem/05nWBxa/tHbwtRwA
         iXA66dSGeNUGBeg0W9LNSa6xSd61deVupZ1cFcGYLT5i1JQb1PPHOobKh43+8OQ/5CMZ
         ezhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917761; x=1769522561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFD71p8fWspU3BL1+X8LZN5zYONG2aaCKcJtMsQB+Vo=;
        b=kroSE0mz2xv3m5WVX2IndOnbpNezoVAO7vBcVDM1GvP793/l0hmap7OhBL3ivH9qgX
         /pexqvXJwddQEvqshEiUxzMVf8ss0kougzLZWfqZSn3NoGZWRlICAl0DJuY7tngfST42
         LmKgYwq9AyS7MEb1pVrAP3Ctb+gVaQtuzRkXwPqyod04XsAbY1HK2KN3yM/PW4D4Rxnm
         bm+qZOPBbDpyEHlyreQyx40jcpprNWHL1OzG8mHAov0awXvF7/PEKnZ3lij6pfc+pL0s
         x0UhFFA9rXCjU7VBggu5VZws97/zJpx8tEGhO7p0KmROf0jebF+xEWlS9+hu7kk4GXKZ
         ePHA==
X-Gm-Message-State: AOJu0YyJhVbMLdE93FJZRuezJVwqr00bmIwnz5+NARJu3J2P5cDcNptq
	AYPbYyDMHOlgyHpJLO/kdlp4Wa1Bkac2ZbKk0FdTee50zLzFs40EBIs/aTWRILHy
X-Gm-Gg: AZuq6aIGW0A/TzCV6NfwvETzTORKC0q1OhqqlQ6qk2rZtQxo3sK2ii8DXQD/UUA/fqr
	kRYs4mtqXxOcrhhMYqEKQH72k5Re3TZr+wB+Uv0AClcUmsVstRRTsnclCW2X9gpuBGxqXIGsaoe
	IWTXrdE/+YKTiHfxjfH5LfJ1WSQuRGX8UmI6vgh5igTC+qnEH1nLfVgPIE6RsmEQhs7X6uTTQaJ
	eOsn64Egji+ZJ5KL15N1p6qGZpS3kZZbG43FgCoqA5tMhhOr5ETMsurm+lprEs6v4MyzJKXidXi
	H9nSe78GKc8GALBTcWO7dHrKMMzsrbI/jEZgKe3YjEyo1fqZu+lBcyrv52Kxl65ghANEsitSPXL
	/XyPfSspspVfk9Nwjtf0JuPWU3DWiLb73Ob0Q8pmwDMg2u6ge4L0eOtjwqoeZR0ZbJXQ4T3AOBs
	mLc3/Q5x92ZDBY+CccsEsEs+dSnIvQFERKCanvrhmVBBGLT2/yI6b9l/AI/60UtKo=
X-Received: by 2002:a17:903:38cf:b0:2a3:628d:dbea with SMTP id d9443c01a7336-2a76a0a673fmr16827585ad.24.1768917760594;
        Tue, 20 Jan 2026 06:02:40 -0800 (PST)
Received: from kailas.hsd1.or.comcast.net ([2601:1c2:1803:3ab0::2e2b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a773d4e5basm17649535ad.94.2026.01.20.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:02:39 -0800 (PST)
From: Ryan Foster <foster.ryan.r@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	linux-fsdevel@vger.kernel.org,
	Ryan Foster <foster.ryan.r@gmail.com>
Subject: [PATCH] rust: replace `kernel::c_str!` with C-Strings in seq_file and device
Date: Tue, 20 Jan 2026 06:02:35 -0800
Message-ID: <20260120140235.126919-1-foster.ryan.r@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

This patch updates seq_file and device modules to use the native
C-string literal syntax (c"...") instead of the kernel::c_str! macro.

Signed-off-by: Ryan Foster <foster.ryan.r@gmail.com>
---
 rust/kernel/device.rs   | 5 +----
 rust/kernel/seq_file.rs | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 71b200df0f40..1c3d1d962d15 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -12,9 +12,6 @@
 };
 use core::{any::TypeId, marker::PhantomData, ptr};
 
-#[cfg(CONFIG_PRINTK)]
-use crate::c_str;
-
 pub mod property;
 
 // Assert that we can `read()` / `write()` a `TypeId` instance from / into `struct driver_type`.
@@ -462,7 +459,7 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             bindings::_dev_printk(
                 klevel.as_ptr().cast::<crate::ffi::c_char>(),
                 self.as_raw(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>(),
             )
         };
diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 855e533813a6..518265558d66 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
 
-use crate::{bindings, c_str, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
+use crate::{bindings, fmt, str::CStrExt as _, types::NotThreadSafe, types::Opaque};
 
 /// A utility for generating the contents of a seq file.
 #[repr(transparent)]
@@ -36,7 +36,7 @@ pub fn call_printf(&self, args: fmt::Arguments<'_>) {
         unsafe {
             bindings::seq_printf(
                 self.inner.get(),
-                c_str!("%pA").as_char_ptr(),
+                c"%pA".as_char_ptr(),
                 core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(),
             );
         }
-- 
2.52.0

