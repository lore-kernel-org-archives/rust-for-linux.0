Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22296C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238128AbjFIGyI (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjFIGyH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:07 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A863626AD
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2817; q=dns/txt; s=iport;
  t=1686293645; x=1687503245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UU0E2+JcdWBDuifFC8J0oRKTGuH0HZrRR0fIeys5Q4I=;
  b=VpB3a6TTOIb9liL48mp2eYNrbflpY0+fIf1i/8p3mQqnntmy6+YS3TNK
   0UMydNtl/FSI/5oNm4eVdXGZep9sCHZKJkLySgbdE4SaAh87MYCgEOQNg
   49r3rLcyx0eIiq456Rb/5SeVlUyOBd5JBBd68hYooymcxGdSrecQvU5ru
   c=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508933"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:54 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDo055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:54 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 56/80] rust: file: add methods read_to_end, get_file_size and update_pos to RegularFile
Date:   Fri,  9 Jun 2023 09:30:54 +0300
Message-Id: <20230609063118.24852-57-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
References: <20230609063118.24852-1-amiculas@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas
X-Outbound-SMTP-Client: 10.61.198.236, [10.61.198.236]
X-Outbound-Node: aer-core-5.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/kernel/file.rs | 52 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index 5b119d6c4f72..894ee573d147 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -22,6 +22,7 @@
     types::Opaque,
     user_ptr::{UserSlicePtr, UserSlicePtrReader, UserSlicePtrWriter},
 };
+use alloc::vec::Vec;
 use core::convert::{TryFrom, TryInto};
 use core::{marker, mem, ptr};
 use macros::vtable;
@@ -288,10 +289,61 @@ pub fn read_with_offset(&self, buf: &mut [u8], offset: u64) -> Result<usize> {
         })
     }
 
+    /// Allocate and return a vector containing the contents of the entire file
+    pub fn read_to_end(&self) -> Result<Vec<u8>> {
+        let file_size = self.get_file_size()?;
+        let mut buffer = Vec::try_with_capacity(file_size)?;
+        buffer.try_resize(file_size, 0)?;
+        self.read_with_offset(&mut buffer, 0)?;
+        Ok(buffer)
+    }
+
     /// Get the current file position
     pub fn get_pos(&self) -> u64 {
         self.0.pos()
     }
+
+    fn get_file_size(&self) -> Result<usize> {
+        let mut buf = Vec::new();
+        unsafe {
+            // kernel_read_file expects a pointer to a "void *" buffer
+            let mut ptr_to_buf = buf.as_mut_ptr() as *mut core::ffi::c_void;
+            let mut file_size = 0;
+
+            // SAFETY: all the pointers to kernel_read_file are valid
+            let result = bindings::kernel_read_file(
+                self.0 .0.get(),
+                0,
+                &mut ptr_to_buf,
+                buf.len(),
+                &mut file_size,
+                bindings::kernel_read_file_id_READING_UNKNOWN,
+            );
+
+            // kernel_read_file returns the number of bytes read on success or negative on error.
+            if result < 0 {
+                return Err(Error::from_errno(result.try_into()?));
+            }
+            Ok(file_size)
+        }
+    }
+
+    fn update_pos(&self, where_to: SeekFrom) -> Result<u64> {
+        let (offset, whence): (i64, _) = match where_to {
+            SeekFrom::Start(off) => (off.try_into()?, bindings::SEEK_SET),
+            SeekFrom::Current(off) => (off, bindings::SEEK_CUR),
+            SeekFrom::End(off) => (off, bindings::SEEK_END),
+        };
+
+        let offset =
+            unsafe { bindings::generic_file_llseek(self.0 .0.get(), offset, whence.try_into()?) };
+        if offset < 0 {
+            return Err(Error::from_errno(offset.try_into()?));
+        }
+
+        // we just checked that offset is non negative
+        Ok(offset as u64)
+    }
 }
 
 /// A file descriptor reservation.
-- 
2.40.1

