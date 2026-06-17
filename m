Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123912EEE74
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781734871; cv=none; b=t3dyXcMfUyW2PtV7lAN7rUYWafercLEjH4DczLk37eimDMi8uCubdOSAZYg6DuumkF1PZIzXlhoW50zo5FDFQ4wqaqFnDhoJaSn1whouKCjVHw0r+f/FO7Y/x35Q9gApD0D4rCYSU7xeXBcA7QVaA1dXcVVol0zXjTd4/AKzRVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781734871; c=relaxed/simple;
	bh=bS0M69pLW5nNr8CnRSLKfXmNPiMqndmz5nY6By+n/Z8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lFbg/sKgKtLJxv+bDilsLuVxvPCcW2RpaSA5oB4Hg8RE3jUWuQcA6rVvEELz04hGQ+nkdJrCEZwtCzOjxq56P+a3GwQCZ5ClAdTQc3qLRl3APWbKeZ430pW3uLAs7ck3RDSBR8xTQLDsXyJsZTyMpr9spkfGDocdC5kEek1/dvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJwdRW4Z; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJwdRW4Z"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c89636920a3so774a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781734869; x=1782339669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQh4Om30hKfslky9yA/JMElL6tQQZ4ZZt3o5EqmRpQA=;
        b=oJwdRW4Z3Bs2HRA5XWuj7VxmoVZx7kYf80rXwW0vSMauxpOJuWNktai/kJBLdv3icn
         TbePgxsoo5gCtGMrxlhyd8+8tOmcdPvlBWLMptfZrnlwwqHe6OAdh3yAVhgXGcL1oy9E
         oNbWP0Qd4tYDKF9suQLglAtRwcg1Pmt2qK4zh05+NhpHQXIYJ395SXuSPNDRv322cHoL
         2LFrnHgNa5rqRjA0lvagcjY2LGHg93fjJ7zOIzrqPF3QbYEIbVkRkYh0Z3tsR/+j2cjW
         gOvzj1l0ALFPLnFXxZzupd0JZ/CMtsCxohAqs06knPyifARxjiWtjezulCMOuBTSFPth
         1v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781734869; x=1782339669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQh4Om30hKfslky9yA/JMElL6tQQZ4ZZt3o5EqmRpQA=;
        b=Q7/8W07HhHik0/ZQWI0IvXCmtn5yv43tQO4e+pZrjpQ7Iq+pn2f9LtOD7ixoQt8srV
         gU0my5ZW7Q8dqTysOS7OtJIVLoWNL0dvGXjLbs5BnH2InNFbTJv89de+p4GeqdU4lNvj
         /BG+mSl81R/fr8RVxJ7YkJ+3rRGyY4vof8Wu+NHapkqCwCu2iUauhI/m1tOgmGv6YCXL
         tsQf9guQKdnTfyHnVAFZd9XbEzVP2i2Uv5AK/J9DHKR+JkiMxzI9p3m+gGLwHolk7NBh
         49veMe7tzMzUCDQIh9MvqcQpS/5dGkQyvC8A0XIsDPZCig8bT3J63paao8W/3CFFaaDK
         334g==
X-Forwarded-Encrypted: i=1; AFNElJ93/W7o1yu5ugbO8XE/8nvLEoBOA96dRY4LVeanB899ksOJBscF0lbhd8PqZ85u7aeAKdTaT4cg1eQl2aro6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9igcBDDaL/H+/MVoV6NDmX/BhGCymf1eRGyBQMmhzEL7+1tc
	mx9r5s+WIhypqkMKmbBDzl1ZOs8bWa65NTc+rVzMkszUCXLBNS/Ae5vQ
X-Gm-Gg: Acq92OGeXFnn5xf0VL+KuRSRikZPHHVLrtE7pXyuudjdSIaCb6GPOd5m7/KhRrtapwS
	gsO7jvlVCPHO2XEelCFVG05TVMNY9jlniyAkto3oALVD1FAMhjO13aRgj6sNSQ2gv74p9LmPcCf
	1dNDJq53Gx9uh4goSZ2wCyDSR8zu9hwEia1+kM22h1MdvzKzYIptGFViY6ijQ8MThD9LlR7PJTL
	BCT2fk3JAlQu/uJN+q8KoTu+kVid/k0uWQyqRGPPHL2KP71KjvWeOIRxYNdcYG/CTh1D25+JTbw
	B56a2IBxPnb5k6sFD8VZdTXYvS1876BK6DUZRsBN3o8nQ8yskQIi+oHcwoACXty9GSHw1/nw3bj
	wUnCpkME98pxVIqTy5hzxdDFdvMLDvQKj1dWNiC95UiYfMHKqEQS2xxcIbVXs9pYcZ0Gccj1gos
	doKqFtLxSDdEBJWeGWUyiEjZCYNTG8vdal2zHMkgw/LHQV
X-Received: by 2002:a05:6a21:4688:b0:3b4:6a31:6d0f with SMTP id adf61e73a8af0-3b8b7ef5ca8mr5868738637.41.1781734869347;
        Wed, 17 Jun 2026 15:21:09 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.251.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186828sm14126000a12.21.2026.06.17.15.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 15:21:08 -0700 (PDT)
From: Keshav Verma <iganschel@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Keshav Verma <iganschel@gmail.com>
Subject: [PATCH] rust_binder: check context manager before creating node
Date: Thu, 18 Jun 2026 03:50:30 +0530
Message-Id: <20260617222030.15189-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust Binder currently creates the Binder node before checking
whether a context manager is already registered. If a context manager already
exists, set_manager_node() returns -EBUSY after node state has already been
created.

Add a check before creating the node to match the C Binder ordering for
the common already registered case. Keep the final checks in set_manager_node()
so races with another caller are still handled after node creation.

Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
 drivers/android/binder/context.rs | 20 ++++++++++++++++++++
 drivers/android/binder/process.rs |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index ddddb66b3557..562fb339b31f 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -4,6 +4,7 @@
 
 use kernel::{
     alloc::kvec::KVVec,
+    cred::Credential,
     error::code::*,
     prelude::*,
     security,
@@ -107,6 +108,25 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
         }
     }
 
+    pub(crate) fn check_manager(&self, cred: &Credential) -> Result {
+        let manager = self.manager.lock();
+        if manager.node.is_some() {
+            pr_warn!("BINDER_SET_CONTEXT_MGR already set");
+            return Err(EBUSY);
+        }
+        security::binder_set_context_mgr(cred)?;
+
+        // If the context manager has been set before, ensure that we use the same euid.
+        let caller_uid = Kuid::current_euid();
+        if let Some(ref uid) = manager.uid {
+            if *uid != caller_uid {
+                return Err(EPERM);
+            }
+        }
+
+        Ok(())
+    }
+
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {
         let mut manager = self.manager.lock();
         if manager.node.is_some() {
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 96b8440ceac6..d09facebddf6 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -741,6 +741,7 @@ fn set_as_manager(
         } else {
             (0, 0, 0)
         };
+        self.ctx.check_manager(&self.cred)?;
         let node_ref = self.get_node(ptr, cookie, flags as _, true, thread)?;
         let node = node_ref.node.clone();
         self.ctx.set_manager_node(node_ref)?;
-- 
2.39.5

