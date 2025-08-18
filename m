Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B9322A3D
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525594; cv=none; b=QpKJFdmEZSSDPaNYgToVkrASItnp0fp+ENzY1egRy4rSIYrzNtIIbwOH5FEgzAY8W5WuEXz6aPkjtFmnBGcBoBcV8FyHDnILCdX3D/6XxuZ0SbzJRFAeJ5YVAa0+spq1iG7/4CStc+ViShnfSCWfX63wJUlXzGKp0kckjr6iJpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525594; c=relaxed/simple;
	bh=Y+NmXte2jVt9vIilx+qaBiTo6qTI0LRZmsoTSTKd/O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZIXYB9kxptyro/gjOe9CCF2G/5xuNB3vL02rdgtW3OrXU2FFPri0RpJego7V5ZXJrN08ih7jv2LCOg2UAzzzypKH0SqQJYy/FSiORewD8YE5s7i/iGiZgCCDlxEZlS4jBnXgx/ssYUe7ouI7lgYvN150whTiEkwmHqnstCmcO/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBM7Zax0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBM7Zax0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755525592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YMRGYhZCgVYyf6TKWipcOATVyFwuIq5BqY8EP2wiQo=;
	b=CBM7Zax0fn2h533+A9GVFzw7XWWlTJJt5OpecVL/grUQUtuLfOuF7jsuflYXdh6srNfSAE
	vXuDJCyNU3ks6sN3FD/U8b69eBoZP1/r+46DwNps6H0BTgiaGEXhWZcgd383VyqVT/39SY
	RXvD2qVwuLy3vKSpFIdA1qF3aU0PBak=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-qSGsaoIZPPCjauNWmjPJZw-1; Mon, 18 Aug 2025 09:59:51 -0400
X-MC-Unique: qSGsaoIZPPCjauNWmjPJZw-1
X-Mimecast-MFC-AGG-ID: qSGsaoIZPPCjauNWmjPJZw_1755525590
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32326e2506aso3959840a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 06:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525590; x=1756130390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YMRGYhZCgVYyf6TKWipcOATVyFwuIq5BqY8EP2wiQo=;
        b=vtHPBKQijWZ5BXw2LLaED/ozKxP2//W4arjh3m/C/5VzVoAsjQg8ML9bUSaWaiGBGP
         Pt6wB3d+F7H+7DL6Lv8buB+zsFfL6xKFSrBN/W/FNSUErULp83Blru/BtOCytET721Kk
         nSFfPEOZrrjo2xn1xB7pLLcBgLlEnnzFyYprWyr83xAitECwdHHFAl1KT36y6PbEuTYi
         NLIAAWB8GvllzeGzLVDmTASre9wQcKB08MuCCkaW3rdXRJsnjzGPe1EuNoTMzl06YyK9
         lOp/CmDV6C9MQfsYb07ZJB2bwjDtLsYbvZQJvGZSeg/YvOCkXoSNvHYc3GJ47f+wBunx
         Lehg==
X-Forwarded-Encrypted: i=1; AJvYcCUuWwuOy7zpPtnzF1vgXPsYuB1BiQBv7NuqiYJNiF0vgkbvdg1COw+4sEPCmnbckze+KI75JJvMcf1cKAk62g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2MVpc74lceawvc0ybLRTqgdhcRXT7t/lnHOVb1sQVZz/U5ge
	I0SXoBgnV3PAe013MnR0qmEyd6aKgBoAmd+Gjj9J6iwg23AU5wK4Vjg6rQjJlzGvEQdgWgGraIQ
	o5yj12RL95axM+5g7EO9UxTIOL17MdSJiaCjW8leq55OsrZiHJeeSvxTf/fiy0mYIfqZR
X-Gm-Gg: ASbGncunC87+EAbizGa3AsHml3Vxe2ztpRG/68/bh68iqpKVZzM0GSiIsJ55gURDFtU
	0/jzbCPizaSjPW6NSKXHOihbXaD7nPFmXPVc7TuZb3N7kGSQzj5stgfo2ALXLxH8uP4djDm7mP0
	/wpgCqnTNKpS9rfWcVqwsfgL2mCoketUkVsAwgGhBAENOW47ZeeDF5kaXUk0ofC+Ijmpqj/5FZ5
	Y2LRkBxPNl3pFaZq61Jwk0VA7fOlleR5NH6XCHgo+3StpglwOx338dGkEq1rDAYAf2EhZFiKuiD
	eHScn/u0q8DzYconwXNTAqiXVZJxAtz4Xg==
X-Received: by 2002:a17:90b:5303:b0:31f:1744:e7fd with SMTP id 98e67ed59e1d1-32342121790mr15990088a91.31.1755525589658;
        Mon, 18 Aug 2025 06:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu7vo2Z28+oGIgafdRKdRRdnXgn+83ZqnfwYDbcN4yit1cp5xdUDY79kWLpeCIOW3hf6Uyng==
X-Received: by 2002:a17:90b:5303:b0:31f:1744:e7fd with SMTP id 98e67ed59e1d1-32342121790mr15990028a91.31.1755525589147;
        Mon, 18 Aug 2025 06:59:49 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d60978fsm8269896a12.26.2025.08.18.06.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:59:48 -0700 (PDT)
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
Subject: [PATCH rust-next 2/2] rust: samples: miscdevice: add lseek samples
Date: Mon, 18 Aug 2025 22:58:39 +0900
Message-ID: <20250818135846.133722-3-ryasuoka@redhat.com>
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
X-Mimecast-MFC-PROC-ID: LKQiA-XeKMBzceyxa19bbLfBvXXVXsp2SQybq0qraTw_1755525590
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add lseek samples in Rust MiscDevice samples

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 samples/rust/rust_misc_device.rs | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index e7ab77448f75..991a59a3ea16 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -86,6 +86,33 @@
 //!     return -1;
 //!   }
 //!
+//!   // Set a file offset
+//!   printf("Call lseek SEEK_SET\n");
+//!   ret = lseek(fd, 10, SEEK_SET);
+//!   if (ret == 10)
+//!     printf("lseek: Succeed to SEEK_SET\n");
+//!   else
+//!     printf("lseek: Failed to SEEK_SET\n");
+//!
+//!   // Change the file offset from the initial value
+//!   printf("Call lseek SEEK_CUR\n");
+//!   ret = lseek(fd, 10, SEEK_CUR);
+//!   if (ret == 20)
+//!     printf("lseek: Succeed to SEEK_CUR\n");
+//!   else
+//!     printf("lseek: Failed to SEEK_CUR\n");
+//!
+//!   // i_size is 0. So the following task always should fail.
+//!   printf("Call lseek SEEK_END\n");
+//!   ret = lseek(fd, -10, SEEK_END);
+//!   if (ret < 0)
+//!     perror("lseek: Succeeded to fail - this was expected");
+//!   else {
+//!     printf("lseek: Failed to fail SEEK_END\n");
+//!     close(fd);
+//!     return -1;
+//!   }
+//!
 //!   // Close the device file
 //!   printf("Closing /dev/rust-misc-device\n");
 //!   close(fd);
@@ -114,6 +141,10 @@
 const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
 const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
 
+const SEEK_SET: i32 = 0;
+const SEEK_CUR: i32 = 1;
+const SEEK_END: i32 = 2;
+
 module! {
     type: RustMiscDeviceModule,
     name: "rust_misc_device",
@@ -173,6 +204,43 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         )
     }
 
+    fn llseek(me: Pin<&RustMiscDevice>, file: &File, offset: i64, whence: i32) -> Result<isize> {
+        dev_info!(me.dev, "LLSEEK Rust Misc Device Sample\n");
+        let pos: i64;
+        let eof: i64;
+
+        // SAFETY:
+        // * The file is valid for the duration of this call.
+        // * f_inode must be valid while the file is valid.
+        unsafe {
+            pos = (*file.as_ptr()).f_pos;
+            eof = (*(*file.as_ptr()).f_inode).i_size;
+        }
+
+        let new_pos = match whence {
+            SEEK_SET => offset,
+            SEEK_CUR => pos + offset,
+            SEEK_END => eof + offset,
+            _ => {
+                dev_err!(me.dev, "LLSEEK does not recognised: {}.\n", whence);
+                return Err(EINVAL);
+            }
+        };
+
+        if new_pos < 0 {
+            dev_err!(me.dev, "The file offset becomes negative: {}.\n", new_pos);
+            return Err(EINVAL);
+        }
+
+        // SAFETY: The file is valid for the duration of this call.
+        let ret: isize = unsafe {
+            (*file.as_ptr()).f_pos = new_pos;
+            new_pos as isize
+        };
+
+        Ok(ret)
+    }
+
     fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
         dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
 
-- 
2.50.1

