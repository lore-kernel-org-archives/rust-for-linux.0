Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C5D307AE1
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867414; cv=none; b=mGNShKxlUveSke4UUMFCPzKnGb2qFdjV7Oe9WKg5G9VI51ryfHUhp0W/RssMQy+1g9XQG96qz6YlOpdeJQF8+EUcjJxGqtmT5aan5qc3gyoty6H3yrQgcknYb99Bt2O40lwUaMaiH0ovhaV4E3z0U1/tWzT+mSgkHQ0Z8CtoKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867414; c=relaxed/simple;
	bh=jDvtrC5CYptCtxvl1U1Uu8QRkjqDfNI+DFDh7ZSPlf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OB9zi+Ta7Y4WqoOl1W2kyzI/AueXUdNEvI4y/6LK8hc+BgzUmX3+l0kwpeM52e0kPm7g/lqzXv/7Ny7TEq+7KZytgCdcPn9XprBawj9y38M0h4RWHKTs8VGii20drgAPnrUYjYmjOomYymU1LNRCHMe2v+U4qSYN3UdujnlSQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=jhgwxhRh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="jhgwxhRh"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1951555b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1755867413; x=1756472213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXCktcs4uaU2hiRFJow79+DYdsVC7eWvfPeFta3o3tc=;
        b=jhgwxhRhJ50Lutz1dhkRQLf4/yEHXMm6f+B7VFIw1Rk6gldvVYPMYe57LHmaQwWg4b
         0vyZDhFUoT3nSVKLQTZRn9M/24iBgVNyrl0iJzgNj/tvcuK8rMLu4+ECv8IQH2xDcpUh
         qrTEWA70pmMjfbsRObwEwZhDhoJNBvHEeHG9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755867413; x=1756472213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXCktcs4uaU2hiRFJow79+DYdsVC7eWvfPeFta3o3tc=;
        b=GkHLGfaKXck6s+AD28Msp2LTjB4wy9OJ4YbKiNGre8nSQ4+twSY/wdBsN41hL3YPwi
         NIVi/yCuhwhRx/QuVnTQcLpIHphSfGpWnJfQTZNTyud67uZDgMwCA3/t4IQdEhPDwbQH
         EbDUfzeKHKQ+vsszvOhpV0eTXaDVQmkBFErHecTQ5xuizUN48TS+6hX2ehIQIhcZop6q
         uRVPrG1p+lW9aKueJMmVkGpZ/S/ppg1AILz9rBDxDiU8Xk5eBMbF6dVyD/nwphvh7R1H
         fRm3Aq4+aBd2VMKrCpWJchX+cFtteYzbF74chBpCTrFUnTJYfWqwbde4I2u7seN0lKKp
         0DcA==
X-Forwarded-Encrypted: i=1; AJvYcCWNcb2gKWN6WmW2ej6QhbAnLJGyt0GGAtsJLW8tPNrhoFY7/DiHXwFw3ZjmGJoiw8HNygDDxMVOqBUbzbY7Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkunqJAU7R7VTmIn1ZiWBhYF0dUQ5L+GzojLRSLp+C9XwBB80x
	ZP52/uzTI3W5nzUoN/GsPqfEACg7gOvHoNISukTSpZzSOk7uNK/nKXKYxK4YWTJOcX4=
X-Gm-Gg: ASbGnct8M6kD7FNlx4taFGwpdaDzrjflP+YDrq+1JeVPMr4BFkf3/EjUd3i/e7SWdRp
	kVa0qVw0vMGknjg7FkhqyTA/o0epzwczlTL/BWKqZgWyg6Ztu+oNpHzZg0Xshc5E9grjIeM0QdB
	qYa2lzx1Jj5uKH1sxZ+uiP6h8rtXkLaEmE7E8gTs8aEN6oNf9eoa2mV+NWOm7U8h2KTP+6yt5SF
	YNNNHsZLEW4rbIdVilhFTqlZUnxHSbK/ed/2DpCxmJhh+HUsMPXXLWZgf4z3APwJA/xE1T7RPyb
	VUdOmxQCr7ot3UqdoWE76ZCaYKkCOAarrFe4ih+zgiKR1q+ABaikeTKF87TEAuX3kRvd2oedBGj
	dku4ES1BAQKANsoxSLk3CjbyqFSM5NsE7ITauBzpaJJ2WaLgZwJcXUtdAv0/z5CMpYpDW+/YC
X-Google-Smtp-Source: AGHT+IFGbkRU2SiqYXwwtNzw8KR7yGF/eBcv+rngOtyo7AEtcczOr+DJBGYp8ZsX+UVe04WKTVUGEQ==
X-Received: by 2002:a05:6a20:1585:b0:232:7c7b:1c7b with SMTP id adf61e73a8af0-24340c429e2mr4973342637.14.1755867412700;
        Fri, 22 Aug 2025 05:56:52 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4764003537sm7194544a12.25.2025.08.22.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:56:52 -0700 (PDT)
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
Subject: [RFC PATCH v3 5/5] samples: rust: Add `uring_cmd` example to `rust_misc_device`
Date: Fri, 22 Aug 2025 12:55:55 +0000
Message-ID: <20250822125555.8620-6-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822125555.8620-1-sidong.yang@furiosa.ai>
References: <20250822125555.8620-1-sidong.yang@furiosa.ai>
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
 samples/rust/rust_misc_device.rs | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index e7ab77448f75..1f25d2b1f4d8 100644
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
@@ -192,6 +196,29 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
 
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
+        let addr: usize = io_uring_cmd.sqe().cmd_data()?;
+        let user_ptr = UserPtr::from_addr(addr);
+        let user_slice = UserSlice::new(user_ptr, 8);
+
+        match cmd {
+            RUST_MISC_DEV_URING_CMD_SET_VALUE => me.set_value(user_slice.reader())?,
+            RUST_MISC_DEV_URING_CMD_GET_VALUE => me.get_value(user_slice.writer())?,
+            _ => {
+                dev_err!(me.dev, "-> uring_cmd not recognised: {}\n", cmd);
+                return Err(ENOTTY);
+            }
+        };
+        Ok(0)
+    }
 }
 
 #[pinned_drop]
-- 
2.43.0

