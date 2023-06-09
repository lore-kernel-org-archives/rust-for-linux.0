Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF635C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238625AbjFIG4v (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbjFIG4a (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:30 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438B53AA5
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3074; q=dns/txt; s=iport;
  t=1686293774; x=1687503374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BapajQdd1qAEvrGXP3lx5N2O/jTwmKF0CV2TjWQET+4=;
  b=mXogXS+RNz/Plbm78Z15e3fTiy50S4m4L2o5Hilt6zymdApYdY/olMfw
   CFZ3AyX5ICRbvpaqFdhRhE4a7x2eSPB2Mk6zIQgxw6CqqNlnDZAOffMaH
   e4qXQa1DqOtLO5YNyv98DQxodx0Fwz8scln50bLjmbp1tCAuSxlHtGUwE
   I=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279094"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:41 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDC055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:41 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 18/80] rust: kernel: format the rust code
Date:   Fri,  9 Jun 2023 09:30:16 +0300
Message-Id: <20230609063118.24852-19-amiculas@cisco.com>
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
 rust/kernel/file.rs     | 3 ++-
 rust/kernel/fs/param.rs | 2 +-
 rust/kernel/iov_iter.rs | 2 +-
 rust/kernel/mm.rs       | 2 +-
 rust/kernel/pages.rs    | 4 ++--
 rust/kernel/user_ptr.rs | 2 +-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index b3bbbf153925..c090a19da9b2 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -14,9 +14,10 @@
     iov_iter::IovIter,
     mm,
     sync::CondVar,
+    types::ARef,
+    types::AlwaysRefCounted,
     types::ForeignOwnable,
     user_ptr::{UserSlicePtr, UserSlicePtrReader, UserSlicePtrWriter},
-    types::ARef, types::AlwaysRefCounted,
 };
 use core::convert::{TryFrom, TryInto};
 use core::{cell::UnsafeCell, marker, mem, ptr};
diff --git a/rust/kernel/fs/param.rs b/rust/kernel/fs/param.rs
index 1a31130c6d1e..947acf0d217c 100644
--- a/rust/kernel/fs/param.rs
+++ b/rust/kernel/fs/param.rs
@@ -4,7 +4,7 @@
 //!
 //! C headers: [`include/linux/fs_parser.h`](../../../../../include/linux/fs_parser.h)
 
-use crate::{bindings, file, fs, str::CStr, error::Result};
+use crate::{bindings, error::Result, file, fs, str::CStr};
 use core::{marker::PhantomData, ptr};
 
 /// The value of a file system parameter.
diff --git a/rust/kernel/iov_iter.rs b/rust/kernel/iov_iter.rs
index 01c7fa065dba..4602cbd4b49c 100644
--- a/rust/kernel/iov_iter.rs
+++ b/rust/kernel/iov_iter.rs
@@ -7,8 +7,8 @@
 use crate::{
     bindings,
     error::code::*,
-    io_buffer::{IoBufferReader, IoBufferWriter},
     error::Result,
+    io_buffer::{IoBufferReader, IoBufferWriter},
 };
 
 /// Wraps the kernel's `struct iov_iter`.
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index d159c45157a9..72b504c949c1 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/mm.h`](../../../../include/linux/mm.h)
 
-use crate::{bindings, pages, error::to_result, error::Result};
+use crate::{bindings, error::to_result, error::Result, pages};
 
 /// Virtual memory.
 pub mod virt {
diff --git a/rust/kernel/pages.rs b/rust/kernel/pages.rs
index c0c1f9fe03fc..c5630c29cec8 100644
--- a/rust/kernel/pages.rs
+++ b/rust/kernel/pages.rs
@@ -5,8 +5,8 @@
 //! TODO: This module is a work in progress.
 
 use crate::{
-    bindings, error::code::*, io_buffer::IoBufferReader, user_ptr::UserSlicePtrReader, error::Result,
-    PAGE_SIZE,
+    bindings, error::code::*, error::Result, io_buffer::IoBufferReader,
+    user_ptr::UserSlicePtrReader, PAGE_SIZE,
 };
 use core::{marker::PhantomData, ptr};
 
diff --git a/rust/kernel/user_ptr.rs b/rust/kernel/user_ptr.rs
index 9fdacc2826ef..ba00147697ef 100644
--- a/rust/kernel/user_ptr.rs
+++ b/rust/kernel/user_ptr.rs
@@ -7,8 +7,8 @@
 use crate::{
     bindings,
     error::code::*,
-    io_buffer::{IoBufferReader, IoBufferWriter},
     error::Result,
+    io_buffer::{IoBufferReader, IoBufferWriter},
 };
 use alloc::vec::Vec;
 
-- 
2.40.1

