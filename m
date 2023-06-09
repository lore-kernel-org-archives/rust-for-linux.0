Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B292FC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238584AbjFIG40 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237522AbjFIG4I (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:08 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6466D26B2
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1240; q=dns/txt; s=iport;
  t=1686293739; x=1687503339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7nCVXwLMBZbSi70c9nk53TtlLZwf+v5NMh3MHyjNt0A=;
  b=MLmh41Hm6nLE8s8/o/4mnFcyKRJP28ouNJYQRfNGWnsJ7S0XDC61lvDu
   ctzo1IMQnb0EDNxB87+43f73IhQp8RS4XW8FCCq0r4OqTlUfAqn+MFUgv
   bAIvJzG7Yz7gpl651KJjJf7YIpJ8CkPSQowfgJBUTIooFgXEZ1HlQ1NJi
   E=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857219"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:51 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDd055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:51 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 45/80] rust: file: Replace UnsafeCell with Opaque for File
Date:   Fri,  9 Jun 2023 09:30:43 +0300
Message-Id: <20230609063118.24852-46-amiculas@cisco.com>
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
 rust/kernel/file.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index c090a19da9b2..086c62000533 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -17,10 +17,11 @@
     types::ARef,
     types::AlwaysRefCounted,
     types::ForeignOwnable,
+    types::Opaque,
     user_ptr::{UserSlicePtr, UserSlicePtrReader, UserSlicePtrWriter},
 };
 use core::convert::{TryFrom, TryInto};
-use core::{cell::UnsafeCell, marker, mem, ptr};
+use core::{marker, mem, ptr};
 use macros::vtable;
 
 /// Flags associated with a [`File`].
@@ -113,7 +114,7 @@ pub mod flags {
 /// Instances of this type are always ref-counted, that is, a call to `get_file` ensures that the
 /// allocation remains valid at least until the matching call to `fput`.
 #[repr(transparent)]
-pub struct File(pub(crate) UnsafeCell<bindings::file>);
+pub struct File(pub(crate) Opaque<bindings::file>);
 
 // TODO: Accessing fields of `struct file` through the pointer is UB because other threads may be
 // writing to them. However, this is how the C code currently operates: naked reads and writes to
-- 
2.40.1

