Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BC9C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238622AbjFIG42 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236946AbjFIG4L (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:11 -0400
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186503A92
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2534; q=dns/txt; s=iport;
  t=1686293742; x=1687503342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X0aayzUt7ylscgzgynqqllbj5lVifE57jGNtJn508oc=;
  b=iZH8SWToFuvt1k/YMFzF1mADL2xbOSJeBvY5WFWayJwMG/2ViAQgz3bk
   Q64sQ7FAPic/N8rDjKX/KM74r119qSCU75g4ruYWx2WmtDXuQkKmLHu/T
   IWmXbJ9RgfOTCYzSgn42knJowkh80/vhc50iSZol1w7u1M9UThSMvJhk7
   k=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7820466"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:48 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDV055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:47 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 37/80] rust: kernel: fix compile errors after rebase to rust-next
Date:   Fri,  9 Jun 2023 09:30:35 +0300
Message-Id: <20230609063118.24852-38-amiculas@cisco.com>
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
 rust/kernel/iov_iter.rs | 2 +-
 rust/kernel/mm.rs       | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/iov_iter.rs b/rust/kernel/iov_iter.rs
index 4602cbd4b49c..78d573e03175 100644
--- a/rust/kernel/iov_iter.rs
+++ b/rust/kernel/iov_iter.rs
@@ -23,7 +23,7 @@ pub struct IovIter {
 impl IovIter {
     fn common_len(&self) -> usize {
         // SAFETY: `IovIter::ptr` is guaranteed to be valid by the type invariants.
-        unsafe { (*self.ptr).count }
+        unsafe { (*self.ptr).__bindgen_anon_2.__bindgen_anon_1.count }
     }
 
     /// Constructs a new [`struct iov_iter`] wrapper.
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 72b504c949c1..edd022762aaa 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -38,7 +38,7 @@ pub(crate) unsafe fn from_ptr(vma: *mut bindings::vm_area_struct) -> Self {
         /// The possible flags are a combination of the constants in [`flags`].
         pub fn flags(&self) -> usize {
             // SAFETY: `self.vma` is valid by the type invariants.
-            unsafe { (*self.vma).__bindgen_anon_1.vm_flags as _ }
+            unsafe { (*self.vma).__bindgen_anon_2.vm_flags as _ }
         }
 
         /// Sets the flags associated with the virtual memory area.
@@ -46,19 +46,19 @@ pub fn flags(&self) -> usize {
         /// The possible flags are a combination of the constants in [`flags`].
         pub fn set_flags(&mut self, flags: usize) {
             // SAFETY: `self.vma` is valid by the type invariants.
-            unsafe { (*self.vma).__bindgen_anon_1.vm_flags = flags as _ };
+            unsafe { (*self.vma).__bindgen_anon_2.vm_flags = flags as _ };
         }
 
         /// Returns the start address of the virtual memory area.
         pub fn start(&self) -> usize {
             // SAFETY: `self.vma` is valid by the type invariants.
-            unsafe { (*self.vma).vm_start as _ }
+            unsafe { (*self.vma).__bindgen_anon_1.__bindgen_anon_1.vm_start as _ }
         }
 
         /// Returns the end address of the virtual memory area.
         pub fn end(&self) -> usize {
             // SAFETY: `self.vma` is valid by the type invariants.
-            unsafe { (*self.vma).vm_end as _ }
+            unsafe { (*self.vma).__bindgen_anon_1.__bindgen_anon_1.vm_end as _ }
         }
 
         /// Maps a single page at the given address within the virtual memory area.
-- 
2.40.1

