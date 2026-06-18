Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C613C5DD4
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 12:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784768; cv=none; b=t58BL1q/L8a8A/jDD8i1VQnc3B0p4E8qV2YdZRq/yHfCerPqdPqaUA2njwyVzISf6vHFzRwjSBMg40wYgfQzyvRKXh5vr292VpPZ5vez6vBOJbzoPPMRRua8Yk9hgYMFfRcayLP5e/oJTnBAFa6SooIuBaBQ9WVx8GZki+V+WR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784768; c=relaxed/simple;
	bh=VPh66OoWpZ5Rgj1VncD5ykvvf5wyvhYaQugzh0jKVrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SqtvSjQOTqRDfzwSeV/kUMxDh+Ofl4KLWw4ECeFqQ3kNXfAscS3hON5hD0iHUzrG4oMXT/fMomuWkDMP6/itIN+SbxUTdfMERpXiJujt1cH3clHz4gup2s9tLRVL2xfQRtwkf5OHktC+OibB7LglihUXv0xevd8dcgBtcchASpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IezO2lyg; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IezO2lyg"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6c57c5c07so6448105ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 05:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781784767; x=1782389567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6Csyz0bu0sZ5TbyCujzNrhNywsgaepDXWQhK1Z3N+0=;
        b=IezO2lygsud5R4JrG7SpXNgWQIEQ9/stBVdnHLQEH8yW5FJqL8y7Td3NpltxKVfHyy
         lmtET3vGkNbluZhqCT+UoiUgk19ikAL2UR3dnfp/F3S66WxHgXQP0iqLc8GO1jXyGZl4
         OGsWCPMdimr3at7x6L3tUFTF1rKo9bMdmDAMeVzb9TW2bMd+iJPY1et+liUZfx+PHRbP
         E2KMss1V8v+amL7z6aEwLTfduEudyit6tVC7D735z8gMNZOXA60Y8m9G60n+vbJYQHmA
         XhZYWtX2sA1iWeCD7a2GP7RQYViLv4SNmWOEQ7ZtL48aI2SdJNpsY+C+gpCOVRAH44qp
         O7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784767; x=1782389567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6Csyz0bu0sZ5TbyCujzNrhNywsgaepDXWQhK1Z3N+0=;
        b=rfOYl7dVLXoPGwq4QwOmqYXdr/0HHAOBDSvKgd3ozo4rcvaDtxN9bWxwuf8Lh+ScJn
         v7aAo1tBPdudBAqq7FcLUJLMZHPhQkA1eJSYSU7jRs7hnpbcHxeFNIzTMDqJ0K/NKD1u
         FoLVyouR8OGnfrUYt+C7U5nzsOspZpM4OVNWNcy1NmbAxlbJwKU0Be/jHI8hny3lCMAZ
         WfzY87ohZXYE7wlXWswfJxYafdFqAurxbCmhVByfsIDh0L6GDPunoiujwoI0OJM66EXc
         Ysb/9w9QCZiDM8OwuB3QDCaD0dg6D5SbpF99YQuMW9dMVRc+yjqLd8YjSDMOvbx+lyjU
         ZbEg==
X-Forwarded-Encrypted: i=1; AFNElJ86LPhYiRILB5hoMaZZhxFWeIFIRJVwBc7HVYuRca2cqlYpyOco0+OrAXliPteuTUAFdjyjZTk29FKua6tGiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6lEtB4CjxVWFedq0Xq4P4phz1MlSWlgTksH8nvIf3bqA1gDhf
	lKeuwJnuPQ+lAGNcalnr6CdXaN8bJUaYoWAvTOQVKnPbfPd4NBlDDt5K
X-Gm-Gg: AfdE7ckXKp4P+AIr++c0Q6p9bir+eoc+tJrvXPJZhAF4X8iDvbRUOJzYPOOKwzUpTxX
	MC8E+z+czG+Jf2KYz5nuI1P21obK7gBT64Ft/lhzgb26bxnlKo8Xmw13Gt9estpsPpVIE/iMG7j
	8zg/UYrNpmAFMGbqYQsDz5fKrQIoWlcV0ewirUox4ScHK08AQ0mqv22frEPm+elwF8MczUkiWRx
	DDIHNivYi3AUgDQ6fo8gYA/3t30P8Ifr/1s2ROihznExT7/zIBzjSOl1KhRN4T3OBJ1oujCfya4
	SrEcgKBvxjwQC0l4BdU3ilB/pDUIyO8MFt0LV63Rr0VPrmv0kKpxBFSQ87MBVTZ9SAgLCAbHdCz
	NmRiNuIq05S0fTebDiw5Y3274zCe1fIAyTTfGcWc+yyIZNUobVKSn0QnAIxyqHKZrXSllTFuac2
	kQTPyp3vzZEEQcQU6dOMUYppg4emjYHoapIA==
X-Received: by 2002:a17:903:2b0f:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2c6bc2511a7mr93487925ad.31.1781784766711;
        Thu, 18 Jun 2026 05:12:46 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.251.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433558449sm205858645ad.78.2026.06.18.05.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:12:46 -0700 (PDT)
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
Subject: [PATCH v2] rust_binder: check context manager before creating node
Date: Thu, 18 Jun 2026 17:42:02 +0530
Message-Id: <20260618121202.6258-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260617222030.15189-1-iganschel@gmail.com>
References: <20260617222030.15189-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust Binder currently creates the Binder node before checking whether a
context manager is already registered. If a context manager already exists,
set_manager_node() returns -EBUSY after node state has already been created.

Add a check before creating the node to match the C Binder ordering for
the common already registered case. Keep the final checks in set_manager_node()
so races with another caller are still handled after node creation.

Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
Changes in v2:
- Fix commit message line wrapping.
- Drop pr_warn!() from the pre-check since userspace can trigger it.

 drivers/android/binder/context.rs | 19 +++++++++++++++++++
 drivers/android/binder/process.rs |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index ddddb66b3557..f7ae84074f96 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -4,6 +4,7 @@
 
 use kernel::{
     alloc::kvec::KVVec,
+    cred::Credential,
     error::code::*,
     prelude::*,
     security,
@@ -107,6 +108,24 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
         }
     }
 
+    pub(crate) fn check_manager(&self, cred: &Credential) -> Result {
+        let manager = self.manager.lock();
+        if manager.node.is_some() {
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

