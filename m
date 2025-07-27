Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEAB21CC5B
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753628674; cv=none; b=kd4jaDAWTege42dSQ1H2w0yJflBA5bNQLoB9eJ5OjnJUmpjJN1LwnWLDEfbT3dPMrQYPOaDsXjOeMeIvdhy1jdHu0H+5pe6NvzH0Z5dLG8lxsMndZYnfqaF5mYVtHKisi0MG1gOhvk82h8J6LE8xTUjHbPMTkmnpzEl84kOydOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753628674; c=relaxed/simple;
	bh=LYz4BJjEcxej4a2hfZQjwwKXuLLfa6KFrpaj5RCmjU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIS8CEEKUjlTAOIDW2A50wi6Ijc7hd793PsG5ShWLZwkMa4slf8hjKGTjGBm8csWxw7Dnvu4z7opmsX1FMve6V6c+6e6XdMH6oTiLAeR/La/ZFt9itmGZHZT6yD1caHmZb96EbuWpZFZd7FJxfR52SVOSR9pRtNI5wUOAJRKQkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=oYvpybBo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="oYvpybBo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24014cd385bso3901075ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753628672; x=1754233472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF8dNyFHhR5n7ctm1h4dvcd/FHv92TBiu95SBZTfIhs=;
        b=oYvpybBozPeNGcX9sJTU7BAvYgyef8KzlEzqS72ym5+zHa0LXdxdWXDMjZExT3q3Ht
         wN4kArx/GmqEUXs6VdgDze9FWxp4bLm2t9lobECX1fV6XdG0nGRwzhmRnJevvuX+McHH
         Unjpe6rXvWlPPAMUGlhntd4Iu6bxmslgI9NZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753628672; x=1754233472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF8dNyFHhR5n7ctm1h4dvcd/FHv92TBiu95SBZTfIhs=;
        b=I50A/xYo+p126YwZKLY20UARI223t3qVjguLZLSfpyB/NsT7lk+92JC2tHVRWHzOOu
         J3hTkSDgfQLfKDWa7HaCR4eX7iNg+P5gtyB4Rmzyvo4I69ZrFZVrsxoK63ZpXeVKJnO6
         bymVYfHGNsj1D/MWbJhDY1Hm8RUhSRwRPfVebn7dFDififGM+vsqjx2mY6MXdYdgmqp9
         8Hfu5DeGluK4Nnq1zOTVcdPoS+8mcZInJCo1wY4t99+kZ1ScVdpBOJCskZgyjVSk6uOP
         8srUxLsfG2KZeLKBySVgR72zMruHwpM7OyC38mqvIoFAq2EYF/wyTDL88T/H+Owbxys9
         ew+g==
X-Forwarded-Encrypted: i=1; AJvYcCWfjX6LECuw0QBbV44IsGP+ep2CcrgskkqddsCyU0tFfNM61iTN6voxMpptjGZ6hfm79KBNfwpc+25pYneYsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBrGCsTL+Th3x6yomsfmwhJ6H4WemwBarq/ye0x38HK3I1eE5S
	sChbrlEvvIdadN2eZbeeXg8Hb1fnN7zwZhDupDG94N24jYQcKeIsVFMmaxdhkDSLJf8=
X-Gm-Gg: ASbGncvLCWIFB+ZtuK5BtqIgwCBl+ztTyhtSGuaTcEXaHvoSYFVzNF04VxQmuystcqM
	tHQD9KYkZgai6Z95NAu4aIQvMpSKc9PlFJOvNodcNWkcdMXjeFl9lEHo844TlpGXHy7uFlUHUzJ
	p2gw8RLHj7+1snshTMrIidlvU4+tBQuhwmtsKZxjxC8yYzjmEeKYONOu+edl5LHWiO4yUW+XCNg
	6qiU5HHbpngQmJ1tnFuA1AMrD6GiFUma1d4hLGavj7pRiC07dV1k1FvPcGzFdR8kQTGzHxmwwFu
	NhZKneofWaRGUnC+F8mmroIRRicx0VG/HW7TV5637dddcpYu2jK+I1olMAfEvxq3DkfYFbeKP6i
	vz8IIrD9L+JAmU3w0B5FvitKxv3e0XjZOlp62PPRigKTaABc5yJy+9sC0F4oTb5CVwNcK5r5F
X-Google-Smtp-Source: AGHT+IFB6M/iK5b+VX6qsLhQzXTdgj2DRxrKstCfZsGXDnZr07n3sQDXtrRVVzTp4bMKr/agcoYYRA==
X-Received: by 2002:a17:902:ccc9:b0:240:2eb6:d5cc with SMTP id d9443c01a7336-2402eb6d9e9mr6477695ad.17.1753628672438;
        Sun, 27 Jul 2025 08:04:32 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffdec96aesm15381965ad.165.2025.07.27.08.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 08:04:32 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/4] rust: miscdevice: add uring_cmd() for MiscDevice trait
Date: Sun, 27 Jul 2025 15:03:28 +0000
Message-ID: <20250727150329.27433-4-sidong.yang@furiosa.ai>
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

This patch adds uring_cmd() function for MiscDevice trait and its
callback implementation. It uses IoUringCmd that io_uring_cmd rust
abstraction.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 rust/kernel/miscdevice.rs | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 288f40e79906..54be866ea7ff 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -14,6 +14,7 @@
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
     fs::File,
+    io_uring::IoUringCmd,
     mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
@@ -175,6 +176,19 @@ fn show_fdinfo(
     ) {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
+
+    /// Handler for uring_cmd.
+    ///
+    /// This function is invoked when userspace process submits the uring_cmd op
+    /// on io_uring submission queue. The `io_uring_cmd` would be used for get
+    /// arguments cmd_op, sqe, cmd_data.
+    fn uring_cmd(
+        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _io_uring_cmd: Pin<&mut IoUringCmd>,
+        _issue_flags: u32,
+    ) -> Result<i32> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// A vtable for the file operations of a Rust miscdevice.
@@ -332,6 +346,28 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         T::show_fdinfo(device, m, file);
     }
 
+    /// # Safety
+    ///
+    /// `ioucmd` is not null and points to a valid `bindings::io_uring_cmd`.
+    unsafe extern "C" fn uring_cmd(
+        ioucmd: *mut bindings::io_uring_cmd,
+        issue_flags: ffi::c_uint,
+    ) -> ffi::c_int {
+        // SAFETY: The file is valid for the duration of this call.
+        let ioucmd = unsafe { IoUringCmd::from_raw(ioucmd) };
+        let file = ioucmd.file();
+
+        // SAFETY: The file is valid for the duration of this call.
+        let private = unsafe { (*file.as_ptr()).private_data }.cast();
+        // SAFETY: uring_cmd calls can borrow the private data of the file.
+        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+
+        match T::uring_cmd(device, ioucmd, issue_flags) {
+            Ok(ret) => ret as ffi::c_int,
+            Err(err) => err.to_errno() as ffi::c_int,
+        }
+    }
+
     const VTABLE: bindings::file_operations = bindings::file_operations {
         open: Some(Self::open),
         release: Some(Self::release),
@@ -354,6 +390,11 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         } else {
             None
         },
+        uring_cmd: if T::HAS_URING_CMD {
+            Some(Self::uring_cmd)
+        } else {
+            None
+        },
         // SAFETY: All zeros is a valid value for `bindings::file_operations`.
         ..unsafe { MaybeUninit::zeroed().assume_init() }
     };
-- 
2.43.0

