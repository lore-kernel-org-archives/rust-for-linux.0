Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B279E21D5B5
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753628678; cv=none; b=hzssmHkQ03iBoMsWNXgWO4jXxOGQMIwGjTz4fVnW1iFdKVydMGOfUH71D3O6OQe/Bz5GmLxDE1TmPkQ1tU9sEpYQtgIQsuVdlalXdZF6IF8cxujwAMwcdQq8qTI6gZS5nqsAFQBUP4h1xxZPVuRBoC0kBMuVwfvHu4r5pM0Rrd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753628678; c=relaxed/simple;
	bh=jNgn+CIvun+R8VfNUxSXEoyphazpmnbHYWrUF62SfyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlMVahhltvCtaFovePccI8oKoftfLdoXjdE7OuY+PvM7b3s776LfPdOWZond/y396DY3yGD7exbu6eFFHtn52/Fxz8LzTeROgB+0yrvInWQG5AcoUixHH5nhytEyqoqkAY+AXsa/YXFJkl7hwtNQMY0XtKkZV8MYTh89YI8Xhi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=ir2XY/E5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="ir2XY/E5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2401b855980so1820785ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753628676; x=1754233476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeNP/PP8zrdwI/UScK/RcuZJZ4ARpjDlW5AwHswNcR4=;
        b=ir2XY/E5gcnilqBBkpD/V/9/SfBhZ7t9ruUs6al5TzEx9aAlEQVjHbnT7fZMytQ3B7
         ThmxRCNLpXgdlsxhk3Lv2VBKvY9YL0bD40MMMOh2YDgEPrQ0/TsJIiOpiF7H1aEVSXnQ
         tTnl/W6Ite76U7giSmcpHIo5y2CdiWO8cA6pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753628676; x=1754233476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeNP/PP8zrdwI/UScK/RcuZJZ4ARpjDlW5AwHswNcR4=;
        b=aQC71orUlikrdncOHlDc0pKT6LCad/ql/q0iao1a2U3gPUZ3eZLeAiuu/ui+lqttEV
         q39fY81wh+pRWfOqhXCUM7kv7zyc14JKxrcRuyoiD/GpNf22x/2JCXvIAXhGMP1OWWLa
         U/btVXGNFzpNX3f4caCNHRvFQVWzaXOAOosoQGTwBoKXrgOrZwF89xhdELQJlotf3y97
         AuMvGP9ge7H4ju0ePoiUl0BtR12v6YaVjADnTHzrwLgcFO+AVJvEly5akjgnLQI6CDLY
         gYkVIFeE50olJCFyjFcNwTGwPkdciDXGm4o+EedMDJPHz0NjUMVB64Bpxc4WSdcTi0IX
         xOKw==
X-Forwarded-Encrypted: i=1; AJvYcCX82mGF2va/ApNzukoUAowdSSiZzaSC5MG2BwhWhhJKZJUluNHUAkbl1wjSYuGNK5iMX5klqCcxehAog4uUjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdhk6z780jhmYkbVXXRpTjd5RdEJHlXtvDakhAvFR5XzJeenpR
	IwTrldG3VCilrvvrF+TkpDI1OnKFJ+J4gETtL/JiwDdSaOZTXfVspzSWu2gVdPQw8Hw=
X-Gm-Gg: ASbGncvmaFZZT5KfANVzJsRGapHETcpXrocrZp8OOTjfUUw3bA+ZrT3szYZiYzsOPDt
	KDH7H7VnDfctR7BLeW9ln6zL0v+7vamo6IGJleGs6IEH0hzzDrFBu0iCg7ARzmr6UDDAdFU7IYW
	bwmqvjT5GH7VngR78h9FoteSdc+rMwx/i7zN8UCkFn2RxCG40rRYLULvpjF+NjhK1VT71m7j7ix
	XRDepUl4CHDTmVkynkflHHohr4vsGJ2LKTi9FKY2je+zhNFeIVjOthKzlAa1Eq5UTkxpI17yALL
	QplRe8PQr7F+EbRi+5ueFlODcF4EwLRswqK0UCSuy7zFBehJBy74Nqy0YzKJ+YIwYhQ9YGg5/RF
	erFkY4RJWiOmujiv2ihYkfSvea2yB4lpSRUrFKh1xA3z6DsD7H4rXK04KFXdv+Q==
X-Google-Smtp-Source: AGHT+IEcwUGTvIwSkq572UO1/rKsozpV5VbkWfGTO1wB9NAisfgejoLG5RhSTngcNuD/suDu9l8M6g==
X-Received: by 2002:a17:903:3c4d:b0:234:c8f6:1afb with SMTP id d9443c01a7336-23fb2ee8a67mr118373005ad.0.1753628675847;
        Sun, 27 Jul 2025 08:04:35 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffdec96aesm15381965ad.165.2025.07.27.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 08:04:35 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [RFC PATCH v2 4/4] samples: rust: rust_misc_device: add uring_cmd example
Date: Sun, 27 Jul 2025 15:03:29 +0000
Message-ID: <20250727150329.27433-5-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727150329.27433-1-sidong.yang@furiosa.ai>
References: <20250727150329.27433-1-sidong.yang@furiosa.ai>
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
 samples/rust/rust_misc_device.rs | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08..1044bde86e8d 100644
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
 
+const RUST_MISC_DEV_URING_CMD_SET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x83);
+const RUST_MISC_DEV_URING_CMD_GET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x84);
+
 module! {
     type: RustMiscDeviceModule,
     name: "rust_misc_device",
@@ -190,6 +194,36 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
 
         Ok(0)
     }
+
+    fn uring_cmd(
+        me: Pin<&RustMiscDevice>,
+        io_uring_cmd: Pin<&mut IoUringCmd>,
+        _issue_flags: u32,
+    ) -> Result<i32> {
+        dev_info!(me.dev, "UringCmd Rust Misc Device Sample\n");
+
+        let cmd = io_uring_cmd.cmd_op();
+        let cmd_data = io_uring_cmd.sqe().cmd_data().as_ptr() as *const usize;
+
+        // SAFETY: `cmd_data` is guaranteed to be a valid pointer to the command data
+        // within the SQE structure.
+        // FIXME: switch to read_once() when it's available.
+        let addr = unsafe { core::ptr::read_volatile(cmd_data) };
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

