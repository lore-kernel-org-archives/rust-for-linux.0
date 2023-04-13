Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69162C77B6E
	for <rust-for-linux@archiver.kernel.org>; Thu, 13 Apr 2023 14:02:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjDMOCT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 13 Apr 2023 10:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjDMOCQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 13 Apr 2023 10:02:16 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26F5127
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 07:02:13 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94a34a0b9e2so289179866b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Apr 2023 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681394532; x=1683986532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oC4nTW0Mj8MKE7+D/N6YP7igJlNc+C1yC0JUBzYNNFk=;
        b=UgjZjWN1foizvde9jx4PhvnWFUeZl8ry4M3d41H3bMCuffnwJR4ncvZuELLARbu0CT
         GiWoX1v2dtGkekz+pRbUcybvw6rWDRlMMeaNjqF6nofyZfKJSxjFkrAbRSREt0oxTgoV
         dDUruHgeYuunJifv/WcPLLVFtyX/w20wRdNNsuNjzFppDfisRWk5ITbn63SE9OKsqKTv
         wZYZA5CaneB226O4KpIyzSi9QEIlobrnEhrafoMVLcSM4qK1ehaEG2JK9kMSJy/aqO8K
         2mLTexA1mUUQE6OYcj5XaGxguMLtmWNMuHE4pkmED7VYRkNGQH8uIA+38zzmbThBAfBw
         jafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681394532; x=1683986532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC4nTW0Mj8MKE7+D/N6YP7igJlNc+C1yC0JUBzYNNFk=;
        b=gBWme0zz63yYNxgb7aJ01BuBiEn65BHB3tTYpiXNb/T7+FaX9qXVfdL0S/Rxw4JcB7
         spWdIVYPiDH2oFrUhi2+p/Z713jdiRV8Xe/n+BldZ8aUyWY370bwMW564/OmZE22sEfp
         mOAa3Km54uKsNHmgHk8oQa8fc8bhNfBAT8bgpJOYziJGJuWAUx+ETpcrsme19koRKcRK
         3EUdeQjw7pkMUa9QEqovvTsWsHDv98QeGyqnFn+vFHKQs7KMc678Fnz0gJnmqYscyPGZ
         9WO0nC4L9JDMKuplOjsytY6GrTJPVc5LMbxg+uwfEKwEehWSI+RHpH8n50fRbDWYIcKT
         aSSQ==
X-Gm-Message-State: AAQBX9csHdRf3/J9yBiMHfQvXKZ/fDLYHmapM4G737VxxMzk08ZeZZ1G
        o02L+/H3jUCmj2oIfJmcO+1dOUa8V6A=
X-Google-Smtp-Source: AKy350Zj8UZtle2oFeK9KTfbbh933sRcsvd6DVhPgSUCSJ+siO2ApQD7FjKlEWdyUjFxY5OYCVNVxQ==
X-Received: by 2002:aa7:db50:0:b0:504:e176:8d22 with SMTP id n16-20020aa7db50000000b00504e1768d22mr3293835edt.4.1681394530509;
        Thu, 13 Apr 2023 07:02:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:a00:be00:2b39:ba6c:ccd1:f7e2])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7d5ca000000b004c0239e41d8sm837831eds.81.2023.04.13.07.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 07:02:10 -0700 (PDT)
From:   Ariel Miculas <ariel.miculas@gmail.com>
X-Google-Original-From: Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH] rust: Add functions to create and modify an Inode
Date:   Thu, 13 Apr 2023 17:01:38 +0300
Message-Id: <20230413140138.348137-1-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Add try_new_inode function associated to SuperBlock which allocates a
new inode and implement a few setter functions for INode.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/kernel/fs.rs | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index 1ba01629e9cd..58c281123c28 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -707,6 +707,18 @@ pub struct SuperBlock<T: Type + ?Sized>(
     PhantomData<T>,
 );
 
+impl<T: Type + ?Sized> SuperBlock<T> {
+    /// Create a new inode
+    pub fn try_new_inode(&self) -> Result<INode> {
+        let inode = unsafe { bindings::new_inode(self.0.get()) };
+        if inode.is_null() {
+            return Err(ENOMEM);
+        }
+        // SAFETY: We've just allocated a new inode and checked that it's not null
+        Ok(INode(UnsafeCell::new(unsafe { *inode })))
+    }
+}
+
 /// Wraps the kernel's `struct inode`.
 ///
 /// # Invariants
@@ -716,6 +728,35 @@ pub struct SuperBlock<T: Type + ?Sized>(
 #[repr(transparent)]
 pub struct INode(pub(crate) UnsafeCell<bindings::inode>);
 
+impl INode {
+    /// set the field i_mode of the inode
+    pub fn set_mode(&mut self, mode: u16) {
+        self.0.get_mut().i_mode = mode;
+    }
+    /// set the field i_ino of the inode
+    pub fn set_ino(&mut self, ino: u64) {
+        self.0.get_mut().i_ino = ino;
+    }
+
+    /// set the current time in the atime, ctime and mtime fields of the inode
+    pub fn set_current_time(&mut self) {
+        let time = unsafe { bindings::current_time(self.0.get()) };
+        self.0.get_mut().i_atime = time;
+        self.0.get_mut().i_ctime = time;
+        self.0.get_mut().i_mtime = time;
+    }
+
+    /// set the field i_fop of the inode
+    pub fn set_fop(&mut self, fop: *const bindings::file_operations) {
+        self.0.get_mut().__bindgen_anon_3.i_fop = fop;
+    }
+
+    /// set the field i_op of the inode
+    pub fn set_op(&mut self, fop: *const bindings::inode_operations) {
+        self.0.get_mut().i_op = fop;
+    }
+}
+
 // SAFETY: The type invariants guarantee that `INode` is always ref-counted.
 unsafe impl AlwaysRefCounted for INode {
     fn inc_ref(&self) {
-- 
2.40.0

