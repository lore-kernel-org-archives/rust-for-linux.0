Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA72C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238501AbjFIGyO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238431AbjFIGyJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:09 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C8D26AD
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2405; q=dns/txt; s=iport;
  t=1686293648; x=1687503248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O0RTRvjgCmAp2LLm/3TEFV38lBEQzJbfXNseh10YJtk=;
  b=UGAtSsAOu+KeW2OIRyehPNYiRh5q/db/iU3cn4pSExlnKPJI3xq9MW/7
   +Px/27Zut5AdBWJ0q9RNY+b6Eu6fpzP4N3KVQofGdWpnESFCNh+pdqjXp
   6Gn9obKr26DJA35nZYBQ7OtFgFJljuDBitf9/rNDoS3mjszDLnSDMbriA
   0=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857705"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:54 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDp055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:54 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 57/80] rust: file: define a minimal Read trait and implement it for RegularFile
Date:   Fri,  9 Jun 2023 09:30:55 +0300
Message-Id: <20230609063118.24852-58-amiculas@cisco.com>
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
 rust/kernel/file.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index 894ee573d147..e51675823724 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -204,6 +204,40 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
 
+/// adapted from https://doc.rust-lang.org/std/io/trait.Read.html
+pub trait Read {
+    // Required method
+    /// Pull some bytes from this source into the specified buffer, returning how many bytes were read.
+    /// See https://doc.rust-lang.org/std/io/trait.Read.html#tymethod.read for details
+    /// This is the equivalent of read from std::io::Read::read, but in kernel space instead of user space
+    /// The buffer is a kernel-allocated buffer
+    fn read(&mut self, buf: &mut [u8]) -> Result<usize>;
+
+    // Provided methods
+
+    // Implementation adapted from https://github.com/rust-lang/rust/blob/80917360d350fb55aebf383e7ff99efea41f63fd/library/std/src/io/mod.rs#L465
+    /// Read the exact number of bytes required to fill buf.
+    /// See https://doc.rust-lang.org/std/io/trait.Read.html#method.read_exact for details
+    fn read_exact(&mut self, mut buf: &mut [u8]) -> Result<()> {
+        while !buf.is_empty() {
+            match self.read(buf) {
+                Ok(0) => break,
+                Ok(n) => {
+                    let tmp = buf;
+                    buf = &mut tmp[n..];
+                }
+                Err(e) => return Err(e),
+            }
+        }
+
+        if !buf.is_empty() {
+            Err(EINVAL)
+        } else {
+            Ok(())
+        }
+    }
+}
+
 /// A newtype over file, specific to regular files
 pub struct RegularFile(ARef<File>);
 impl RegularFile {
@@ -346,6 +380,14 @@ fn update_pos(&self, where_to: SeekFrom) -> Result<u64> {
     }
 }
 
+impl Read for &mut RegularFile {
+    fn read(&mut self, buf: &mut [u8]) -> Result<usize> {
+        let nr_bytes_read = self.read_with_offset(buf, self.get_pos())?;
+        self.update_pos(SeekFrom::Current(nr_bytes_read.try_into()?))?;
+        Ok(nr_bytes_read)
+    }
+}
+
 /// A file descriptor reservation.
 ///
 /// This allows the creation of a file descriptor in two steps: first, we reserve a slot for it,
-- 
2.40.1

