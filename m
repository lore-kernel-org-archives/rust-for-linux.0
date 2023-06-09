Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38C7C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbjFIGyY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238506AbjFIGyO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:14 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B306B30F2
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4054; q=dns/txt; s=iport;
  t=1686293651; x=1687503251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N28o3/aFdUgyYjNVqBSxvWB0Zt2C0hy8XmYnl2hr4ZE=;
  b=RGjQByMMPMoZ4XfvMwvXj3saeqijGVORBG8v+Gru8/gEGfhdQ+r5FLrY
   H2dsFFTUK/oU+8ry6wTJ5hIMSwRrRqj/RyFFjin3jkX9R7/XrvkkdD1LO
   LQ24Ox37OeuZeyYJaDRYjgL8e/Q/FjI0lIqMUguKOQZGqxevh/0kCKmp4
   A=;
X-IPAS-Result: =?us-ascii?q?A0ARAQAixoJklxbLJq1aHgEBCxIMggQLgyRVLhJHjU2IU?=
 =?us-ascii?q?gOda4ElA1YPAQEBDQEBMRMEAQGFBgKFdSY0CQ4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBQEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNhgUDAzIBRhAgMVcZgn4BglwDr?=
 =?us-ascii?q?RmCLIEBhHWaa4FogUKMFoVKQoFJRIEVgTyCLYsGBIkdhRKPKIEpb4EeOWl/A?=
 =?us-ascii?q?gkCEWeBCghcgXNAAg1UCwtjgR2CVQICETwUUmIZHQMHBAKBBRAvBwQyKAYJG?=
 =?us-ascii?q?C8nBlMHFxYkCRMVQgSDWQqBEEAVDhGCXCoCBzZvAwkDBwVJQAMLGA1IESw1F?=
 =?us-ascii?q?B8GQ4EHF2OBfCQknkaDDXsTAYJLGwIRpAagKoQSi3yVBBozqVWYFpZFjRiEL?=
 =?us-ascii?q?wIEBgUCFoFjOjuBIDMaCBsVgyIJSRkPjiwNCYlniWdBMTsCBwsBAQMJi0YBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:Ncj4I6gN0GQeeUwTN8aHgu8+X161ZBAKZh0ujC45NGQN5FlHY01je
 htvXmiBPP3fMGTwfdwkOozj/BsH7MKDndRrTlBq/y9kFCtjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKkYAL/En43HVcMpBsJ00o5wLZn2t4w2rBVPivU0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pDTU2FFEYUd6EPdgKMq
 0kv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOjzAazhHe3JrXO9IDY3VW1TKRm+lB1
 YVstMW8VQN4EKjTzbF1vxlwS0mSPIVP9aWCKn+lvInOiUbHaHDrhf5pCSnaP6VBpb0xWjEIr
 6RDbmpXBvyAr7reLLaTQ+xtjdknJdLDN4IEsXYmxjbcZRojac+THvqUtIEwMDEYoNlKQ+T/Z
 MQle3liLy/CYxxjAA8GB8dr9AuvriCvL2IHwL6PnoIo7mTIywp43pDiN93aftHMTsJQ9m6Cu
 3naumr+GFQeNdqC2RKb/X+2wOzChyX2XMQVDrLQyxJxqFSe3CkSEBoMSR69qOX/gU+lUNUZI
 EsRksYzkUQs3FOhfNijWAW8mU6Z7j8dAtZMF7wU7R7Yn8I4/D2lLmQDSzdAbvkvu8k3WSEm2
 ze1czXBWGwHXFq9FC71y1uEkd+hEXVPdjFTNUfoWSNYuYC58enfmzqVFr5e/LiJYsrdPxWYL
 9qihSw7iq8exfUX3qnTEbvv2mn1+/AloiYb4gjJWWas6A8RWWJEW2BKwQWBhRqjBN/HJrVkg
 JTis5PHhAzpJcvX/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43YpheJW6xO
 x+O6Fk5CHpv0J2CM/Qfj2WZVpRC8EQcPY+Nug38N4AXOcEhKGdrAgk3PB7Lt4wSrKTcufhvZ
 cjEGSpdJX0bEq9ghCGnXPsQ1KRD+8zN7T27eHwP9Dz+ieD2TCfMEd8taQLeBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dwtTcCBmW8mp9KS6tIere2JbJY3oMNeJqZtJRmCvt/49ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:Di2BcK5A3y8QtDhHWwPXwOfXdLJyesId70hD6qm+c3Bom6uj5q
 STdZsguyMc5Ax6ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGMhILrFvAB0WKI+VLd8kPFm9J15O
 NJb7V+BNrsDVJzkMr2pDWjH81I+qjhzEnRv4fjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AqFsj/GkP18gJRZN1DupJmh2sRyHXOWLX/naOJFe?=
 =?us-ascii?q?8MFZ0GJyUEFOM/PJKltU7zg=3D=3D?=
X-Talos-MUID: 9a23:kLWC+QmJ0YkxQ7kcKi5zdnpELcM28YWtBnwf0phFgMuENABKYyaS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857696"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:37 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VICt055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:36 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 01/80] rust: add definitions for ref-counted inodes and dentries
Date:   Fri,  9 Jun 2023 09:29:59 +0300
Message-Id: <20230609063118.24852-2-amiculas@cisco.com>
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

From: Wedson Almeida Filho <wedsonaf@google.com>

This is in preparation for adding support for the implementation of file
systems in Rust.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers.c                  |  7 +++++
 rust/kernel/fs.rs               | 53 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 62 insertions(+)
 create mode 100644 rust/kernel/fs.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 50e7a76d5455..eeb5b7c0528a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/refcount.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
+#include <linux/fs.h>
 
 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
diff --git a/rust/helpers.c b/rust/helpers.c
index 81e80261d597..e00c53c94c43 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -26,6 +26,7 @@
 #include <linux/spinlock.h>
 #include <linux/sched/signal.h>
 #include <linux/wait.h>
+#include <linux/fs_parser.h>
 
 __noreturn void rust_helper_BUG(void)
 {
@@ -128,6 +129,12 @@ void rust_helper_put_task_struct(struct task_struct *t)
 }
 EXPORT_SYMBOL_GPL(rust_helper_put_task_struct);
 
+struct dentry *rust_helper_dget(struct dentry *dentry)
+{
+	return dget(dentry);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dget);
+
 /*
  * We use `bindgen`'s `--size_t-is-usize` option to bind the C `size_t` type
  * as the Rust `usize` type, so we can use it in contexts where Rust
diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
new file mode 100644
index 000000000000..157fdb917ad1
--- /dev/null
+++ b/rust/kernel/fs.rs
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! File systems.
+//!
+//! C headers: [`include/linux/fs.h`](../../../../include/linux/fs.h)
+
+use crate::{bindings};
+use crate::types::AlwaysRefCounted;
+use core::{cell::UnsafeCell, ptr};
+
+/// Wraps the kernel's `struct inode`.
+///
+/// # Invariants
+///
+/// Instances of this type are always ref-counted, that is, a call to `ihold` ensures that the
+/// allocation remains valid at least until the matching call to `iput`.
+#[repr(transparent)]
+pub struct INode(pub(crate) UnsafeCell<bindings::inode>);
+
+// SAFETY: The type invariants guarantee that `INode` is always ref-counted.
+unsafe impl AlwaysRefCounted for INode {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
+        unsafe { bindings::ihold(self.0.get()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::iput(obj.cast().as_ptr()) }
+    }
+}
+
+/// Wraps the kernel's `struct dentry`.
+///
+/// # Invariants
+///
+/// Instances of this type are always ref-counted, that is, a call to `dget` ensures that the
+/// allocation remains valid at least until the matching call to `dput`.
+#[repr(transparent)]
+pub struct DEntry(pub(crate) UnsafeCell<bindings::dentry>);
+
+// SAFETY: The type invariants guarantee that `DEntry` is always ref-counted.
+unsafe impl AlwaysRefCounted for DEntry {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
+        unsafe { bindings::dget(self.0.get()) };
+    }
+
+    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::dput(obj.cast().as_ptr()) }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 85b261209977..486f60912132 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -30,6 +30,7 @@
 #[cfg(not(test))]
 #[cfg(not(testlib))]
 mod allocator;
+pub mod fs;
 mod build_assert;
 pub mod error;
 pub mod init;
-- 
2.40.1

