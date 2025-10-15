Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46A62EB844
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 04:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760501015; cv=none; b=SjCvTkghs7JYpRcVJ1wTOrM0xziZjiU7Mhwh4KbAJq3XdBH1SlF+Gpn1TbihIZ1miJ9oKYbYbrPZXOvL4a+uqOfMJL3xt2D9buw5vjVfz4pJIEjPojnBFROMgoJNxCh2b3UsWUxwzzv5RVirfgbI5wDYGdIXr4zJCLAdJ5ekG5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760501015; c=relaxed/simple;
	bh=MUM+uW6qnDu0apC4KR7QWlmonTleTGezmIe8a4nc1Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=qWZUMMCCWRwxqsj9JKk0ynGSSfEbOJtrBUXVSOyaGJXmqEi/mgDpeHXNeJT7JU7xC2WYcyDH+8yq+NSyDlU5umeZMwpWwSssgGC+NSkSQw7OyKGyTjZGivMkjLbtUd48AM9bZangcbJqGcaOcMFVS3t4Q8DFGL/nIMUUUWhPUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PiKIz3G1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PiKIz3G1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760501012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5ohKs6qKbp9M57nvQdcRMhKqmCNN3hHdO4AybKNaC4=;
	b=PiKIz3G1sA5eTw/1YdTtUKfcMeTWKTxZJ2V3lYzwDT6kpjPqtsgisE/VOxFyeUTwYtK+bU
	NWxo9Di/m2rrrvxvS0VrSsVszKhImPvXo02IhFokBncA9TDjUQayq0evk/88Q3is+3/hgv
	xDAYF2f2K/cVIOpMBNH8CJD5jf/s6cc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-GmZdlk7ANT-ZQo49tILfsQ-1; Wed, 15 Oct 2025 00:03:31 -0400
X-MC-Unique: GmZdlk7ANT-ZQo49tILfsQ-1
X-Mimecast-MFC-AGG-ID: GmZdlk7ANT-ZQo49tILfsQ_1760501010
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so9259853a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 21:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760501010; x=1761105810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5ohKs6qKbp9M57nvQdcRMhKqmCNN3hHdO4AybKNaC4=;
        b=plAmG1GACi/rQ1BdEtamr7SUC+9cfsfUtIsJEFt0BZsc8KiVrHZEwewquJ9ZEdVkw0
         PP5Wd0rObbUCGoO746kQaP78MixidlUsyNwv24MupzNdM3vv97MPi5LSXoU1soAQLBJw
         COFSb3xxs6LtjJ1o0buyI9djCKPyHqZ9T7/Q2qF8r/CbYswBEahfMPPnkMzETDWt3GRN
         /4Ch2VZZaWppUAoWHpS8rtS4HQvT5n3txzbQFJmMI0w7esdfk+1CZ0UhdHjlLmzyfMhq
         f3ky9eKlJ1w+eBhOGo4ifRZH2f1meN6/uCQo6Kr2FhEf20fhbjJne2eWXNbqji6XCJcc
         PNnA==
X-Forwarded-Encrypted: i=1; AJvYcCUNycdaLAklH7J1jCFCgRFHG9SVpkfqgHFeNrpraqModuaQCT9kk+pnLiCkAgw0VAf/QANoQlzNEIWUtpi/BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQXeTOfKk9/KQHWkvhxSoBSzmw41qTUmk+mKvm5A239fmwwjT
	0GUFh5+x1lNhSCueBrwCmAvQJZqm0/gzbgkSDnyJX6B+SF/q6xJhxtaom2fpy4b/TJFMTO5Y4aA
	wpyLtga1YIUrOuLCN1cfs62YWe7Glk3rzJsK3GCCux8xNpZjSBySv0wm6s2hMPIpvuGbE
X-Gm-Gg: ASbGnctQrmnDf5XO2D2f9oH22ypdugfGPhXtyuokxBsDEoikgRNbyqHa/T/W9bfqvup
	T4GWrNfyl4jIIw0kJX0KD9w7xlNef5cljmia7aO83uH2fC5Lm6Wdx1rpGqxNn+ufk3M0Fj9ZD7p
	CQg2Hek6FGhSnM3aSu8rTbz2NS3dzx8pDIHVQh2ROIoFKT4xN/oWWpG1BJc5SPErOY78+AhpW7N
	5CAbZCDzC3RBTYyHzsNUXp9PMM6CilLUDDKJy4jUgN8mtlkeW2VAPAWn/U2SOeBDIcAZvQqGRIW
	2SOSsX3sb67B9LMinW3leV7agvEQbAEKHLj4YalRnrwidKO8w3S2k8Zu+mslZA2JOPL+Lw==
X-Received: by 2002:a17:90b:4a45:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-33b5111731amr37028099a91.3.1760501009929;
        Tue, 14 Oct 2025 21:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuLhwfwk717yOcd8hPJjqG2qML+HfCGwgfNoBL1CNQBuD1WSe9rogLQkLlfQFnzLiekkeHRA==
X-Received: by 2002:a17:90b:4a45:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-33b5111731amr37028057a91.3.1760501009473;
        Tue, 14 Oct 2025 21:03:29 -0700 (PDT)
Received: from zeus ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b978607cfsm608006a91.9.2025.10.14.21.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:03:28 -0700 (PDT)
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
Subject: [PATCH rust-next v2 3/3] rust: samples: miscdevice: add lseek samples
Date: Wed, 15 Oct 2025 13:02:43 +0900
Message-ID: <20251015040246.151141-4-ryasuoka@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Gtt2N-nCyhqA5lqcfB0Pl2ZxhM2PsNMhdD-YRCb0fLg_1760501010
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add lseek samples in Rust MiscDevice samples

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 samples/rust/rust_misc_device.rs | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index d69bc33dbd99..7f227deef69d 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -12,6 +12,7 @@
 //! #include <errno.h>
 //! #include <fcntl.h>
 //! #include <unistd.h>
+//! #include <string.h>
 //! #include <sys/ioctl.h>
 //!
 //! #define RUST_MISC_DEV_FAIL _IO('|', 0)
@@ -19,9 +20,11 @@
 //! #define RUST_MISC_DEV_GET_VALUE _IOR('|', 0x81, int)
 //! #define RUST_MISC_DEV_SET_VALUE _IOW('|', 0x82, int)
 //!
+//! #define BUF_SIZE 16
 //! int main() {
 //!   int value, new_value;
 //!   int fd, ret;
+//!   char *buf[BUF_SIZE];
 //!
 //!   // Open the device file
 //!   printf("Opening /dev/rust-misc-device for reading and writing\n");
@@ -86,6 +89,40 @@
 //!     return -1;
 //!   }
 //!
+//!   // Write values to the buffer
+//!   char *w_buf = "ABCDEFG";
+//!   ret = write(fd, w_buf, strlen(w_buf));
+//!   if (ret < 0) {
+//!     perror("write");
+//!     close(fd);
+//!     return errno;
+//!   }
+//!   printf("Write values to the buffer: %.*s\n", ret, w_buf);
+//!
+//!   // Read values from the buffer
+//!   lseek(fd, 0, SEEK_SET);
+//!   ret = read(fd, buf, BUF_SIZE - 1);
+//!   if (ret < 0) {
+//!   	perror("read");
+//! 	close(fd);
+//! 	return errno;
+//!   }
+//!   buf[ret] = '\0';
+//!   printf("Read values from the buffer: %s\n", buf);
+//!
+//!   // Read value from the middle of the buffer
+//!   memset(buf, 0, sizeof(buf));
+//!   lseek(fd, 1, SEEK_SET);
+//!   lseek(fd, 2, SEEK_CUR);
+//!   ret = read(fd, buf, BUF_SIZE - 1);
+//!   if (ret < 0) {
+//!   	perror("read");
+//! 	close(fd);
+//! 	return errno;
+//!   }
+//!   buf[ret] = '\0';
+//!   printf("Read values from the middle of the buffer: %s\n", buf);
+//!
 //!   // Close the device file
 //!   printf("Closing /dev/rust-misc-device\n");
 //!   close(fd);
@@ -114,6 +151,9 @@
 const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
 const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
 
+const SEEK_SET: i32 = 0;
+const SEEK_CUR: i32 = 1;
+
 module! {
     type: RustMiscDeviceModule,
     name: "rust_misc_device",
@@ -204,6 +244,34 @@ fn write_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterSource<'_>) -> R
         Ok(len)
     }
 
+    fn llseek(
+        me: Pin<&RustMiscDevice>,
+        file: &mut File,
+        offset: i64,
+        whence: i32,
+    ) -> Result<isize> {
+        dev_info!(me.dev, "LLSEEK Rust Misc Device Sample\n");
+        let pos: i64 = file.pos();
+
+        let new_pos = match whence {
+            SEEK_SET => offset,
+            SEEK_CUR => pos + offset,
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
+        *file.pos_mut() = new_pos;
+
+        Ok(new_pos as isize)
+    }
+
     fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
         dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
 
-- 
2.51.0

