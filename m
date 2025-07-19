Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD6288CAD
	for <rust-for-linux@vger.kernel.org>; Sat, 19 Jul 2025 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752935661; cv=none; b=cwqQiK6u/ZpwawrD3eL2Z++kgWkY3i9gDheO0CwHoIWzL5xbL5LMh294h1WoGJNtN1k1GWsYQoRph6S4J7AjEVFh+MnAF4gW9Jhxqn6I8K+s81LwU8164zQYu/BvVMwA42KUCSiTEzt5nuj1UkWJkBPjdblPmJiu0ZrmLVe7xtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752935661; c=relaxed/simple;
	bh=R8jGhX8GJtxbiAjtt52NeFBV/TnGPSvZljPJO54V9Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InRejcadg7M4Oc7WGd2uaZ1GFeW4w27JObE2Ep9CFNkSrb/SNcPDAor9LTMmGCdXS1sfFR27s53BSwLL0JhRRKwAkF4/fQax290B6ttonyse9txYlCGRdGzeEnRTiEE1wg+WCNqZJkHZqhKilNFDgXD5QqI8kz+Hh2iZzvrcZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=aJfYuXOx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="aJfYuXOx"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2349f096605so34370225ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 19 Jul 2025 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1752935660; x=1753540460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXkaSAeBjzAQ8y2xwh0Xd1YosILeCAcR4SjyO3knpT8=;
        b=aJfYuXOxg5aGSwJytWRSxA2iVptDm6BSlt+stdfturMsUIiU+oTsmKsEAMyLSlaXqO
         G5TkolIGNV00tg7nANLFhpxuXloH+FwRnvq47kzMKJDEsSy22Q18K+MBRk7NVP3mYCLE
         nbmrHP2KLJhOGX47b3qAg/oVkz0Bny0npGBTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752935660; x=1753540460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXkaSAeBjzAQ8y2xwh0Xd1YosILeCAcR4SjyO3knpT8=;
        b=lChuPd1fAyjF0ujjb4BGVOV0CA1EGZ36fDaeiOWobmcUlj6rS2n7PkNUyMaYmpfozl
         1EzyrmfEWU2xbjgStEKqYzod7g+Au2Yce6rTTQGtsXc6q7PKKTSE5ivYzWgBt1UlPhNi
         IA11LLaTv7jVTjnHPydsmOS4n0+plaRIY9t9NnLJk2tINyi0CiQRh6v0s/m+fkw3ZQBD
         xjwGLCEmOSLRymtIac0Vc28fW41zRN4kHmpsExCLJe8+9ezfLz2RzNgX3YvVie7u5/+p
         dyduA2jcd12yAkbqs5CEZDKLvJdwrzVA3QF9HXzlnIdvdmVBHjNogbwreCrsVwrqU8Qv
         EnTw==
X-Gm-Message-State: AOJu0YzvcB8qLZEg1urYnOBuJzp11yp239rQdGBmcjeoJuPNQ0fZ+Qtw
	42WEybwhuDTMveSTHPA8gyDyGpHS1Cf33sM07kIWTZRTXQfZ31nR7VaSoV9ejGlc71c=
X-Gm-Gg: ASbGncvrspduEnG6kSbht5Wm8xdspUK4Tli1meQHanbM0BkH39QhcM3u8J2EGm3gOuR
	rbmdUv7J6Bm3JqY2Ar02EsdCFYqm1YuccR7NHMIJYF19fiXaaxfz50NetwQ9VzBtQR80YMTtdxq
	OqdEUt+7jCDx49dOHwOySgWGQNr5RfyjTOQwuw2cBH/36K+QUtYw9XUGwtVBd9maJrRtMdC0qqS
	VoQoteLpxUbd3qEcmjxceD8jXIdYpPug++NJeVENw608P1xpEKJmUrtE4xQ0DoMuP6+GkLMs3D0
	X7ovnmCzN4moD9w6U8QX+1bEiNPyLD8BMyBHFQ9p5DqIwb4fWynzruvcsM0BYa48lfIPgAsy7wr
	zTko7m9sxfoM3R+g2n1BFnvDfQ+AjrcMykOC47+59ahe1GGHoA1Un9OVnI8E=
X-Google-Smtp-Source: AGHT+IH1voNmCvwGJvMrZvclPm+sCwPYvCoAW1RlSoHG0ImiAoioy10GrH2F7hsoOibb8Z+aHB5r3g==
X-Received: by 2002:a17:903:1b6c:b0:234:8ec1:4aea with SMTP id d9443c01a7336-23e2579eed1mr218928065ad.52.1752935659962;
        Sat, 19 Jul 2025 07:34:19 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3d4esm30017525ad.23.2025.07.19.07.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 07:34:19 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH 4/4] samples: rust: rust_misc_device: add uring_cmd example
Date: Sat, 19 Jul 2025 14:33:58 +0000
Message-ID: <20250719143358.22363-5-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250719143358.22363-1-sidong.yang@furiosa.ai>
References: <20250719143358.22363-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch makes rust_misc_device handle uring_cmd. Command ops are like
ioctl that set or get values in simple way.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 samples/rust/rust_misc_device.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08..cd0e578231d2 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -101,6 +101,7 @@
     c_str,
     device::Device,
     fs::File,
+    io_uring::IoUringCmd,
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
     miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
@@ -114,6 +115,9 @@
 const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
 const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
 
+const RUST_MISC_DEV_URING_CMD_SET_VALUE: u32 = 0x83;
+const RUST_MISC_DEV_URING_CMD_GET_VALUE: u32 = 0x84;
+
 module! {
     type: RustMiscDeviceModule,
     name: "rust_misc_device",
@@ -190,6 +194,32 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
 
         Ok(0)
     }
+
+    fn uring_cmd(
+        me: Pin<&RustMiscDevice>,
+        _file: &File,
+        io_uring_cmd: &IoUringCmd,
+        _issue_flags: u32,
+    ) -> Result<isize> {
+        dev_info!(me.dev, "UringCmd Rust Misc Device Sample\n");
+        let cmd = io_uring_cmd.cmd_op();
+        let cmd_data = io_uring_cmd.sqe().cmd_data().as_ptr() as *const usize;
+        let addr = unsafe { *cmd_data };
+
+        match cmd {
+            RUST_MISC_DEV_URING_CMD_SET_VALUE => {
+                me.set_value(UserSlice::new(addr, 8).reader())?;
+            }
+            RUST_MISC_DEV_URING_CMD_GET_VALUE => {
+                me.get_value(UserSlice::new(addr, 8).writer())?;
+            }
+            _ => {
+                dev_err!(me.dev, "-> uring_cmd not recognised: {}\n", cmd);
+                return Err(ENOTTY);
+            }
+        }
+        Ok(0)
+    }
 }
 
 #[pinned_drop]
-- 
2.43.0

