Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253B3CEBA9
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384012; cv=none; b=kmB/NWqIHdESY8hPDIkQdx7qnr2PVlC1wb67cfBfnbeSnFTYuLHbgPHCJuJ/MhQe1tRSKQwnakPqlLp9BzDbjx2Cv1+XB5X/QNa3fdqAHxQY4pcSg77Pb0LRw8lxO3DtjX3W0f7JACmL5+f8s5w9D2voxDu+OvUucO0YpPO5NF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384012; c=relaxed/simple;
	bh=fLV/Apk8nhLE8N8tK9A9Ko2e1YAugrN3KrQ/bytl+qA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OjHaKAOtSgQsipJr0S3PZZ3DZQSZ1tixauhorJsHVKvqgpwujoBTG085ZWqjgBGqiskXE4DVJv85hOF9r1RhCKi4TbzlOsGLrpNf+bjSFzehTPxuQc7OHgui/AuJw+iVn4muy1b3ppJXUSDfyYbVJamxvOnzUKFrzUyIVBUAvak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOFQayXl; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOFQayXl"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30c713f37c2so715836eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384010; x=1782988810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeQiwaW0YOQBW43VE6fvPFO1ZL4w+aRT9FKJgJoAzPg=;
        b=NOFQayXlEH50TkPpS23aakS3izoMfSoZNE5x9vA8lhhPkJ4H8lSlnruC0g/j6IOT35
         DaH6QpTD1yMS+QztMCFWBkImqnhFm7wKdO/ZAkUHV6gxmtKuQ8wR/YCAtg7mQ/wmJgdC
         5ivxX4T/AlBowwV2L4NyP3HKBmYh9VI37j8HH7S9tUgSAZ1LRINS6ioGytwRV9AR0gK0
         6SCHkUSSFOlAsrRRYFWZC97WRokyLvvsq1y1viKMgD6DVuzKUBEPiDEu09PP+Dfz8K9m
         6ghYVuozhG5KXMQ9LBJEuRDQh4DYhq3Zl4rsq/Db0yYeG8hoAm6nRt+cKTRB5Xrs8wAI
         q+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384010; x=1782988810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HeQiwaW0YOQBW43VE6fvPFO1ZL4w+aRT9FKJgJoAzPg=;
        b=drRRm+RKMxmuZF8tNswCfU/djS67JvvNczOC8I4kUZ1s9JM93CF8Cc/FU5mchpjL+P
         0cAd9EneMOlHldEEcuSCcL5otwRiUz13tUUAp8jdXdLRh/MFyoUthlQHWciFKm9u7Pr7
         SZSEvnNwbFDx0SNhyont7wlAtYtfL3Gg4E84D6ybpk5ggAeRspu1wPdFTyw9vgYyd/9c
         fKFfIXHXmHdSRf1+XwU2K214cacCDIZG5db0H3g9kxB8D8CTcbNp2YHaR3QcmeyJBImt
         9aGmuYqCjw1O51ra5yZE9Z427LJTkaqj/avGlIet0bHIjRHu0f7dZbpSyRTLEPJkkq/C
         BWNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+PCvaMZjp70AAhEm7ZRyfmqcFPyFOS2JOr9nuxCYMvgOA2WIBJidapvJZnr/IJICK1haJGij6YGXdislGrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcclAZ9PETDTUHwkfYVwM7msE+o84VunXmZ9k4ruYJ5s6fv0fA
	yuf4jHdl+jNlBzRUYWle1lJeRvhw2sI2G9oVl6MJ6wro8vRLkjgQ3U0r
X-Gm-Gg: AfdE7ckgxPZKJjkB6c1lMDAOw6HyQCrY35cHcnHy5IFyv+SXYfRS7JzBme+Kzf+tXYb
	pkni5xKbaGNFAHqVXH5EnJDENVvQcZ2QkDGbIPejFnthT310j3E7PbT3NOMTlBFpiC6QF5nZGmW
	h/3TaqfLmsT8ts/JqGGED5+cIJz5LocJ5/BXS6ApGpD1lI3BnILECrKTEWCHKM3IOICFsEIORLI
	VVJ2CVA5ouUNDHNtMb6sTqO70ufYCvtwl6duz4t7/fqs9EQEhq9nUppgVxlLDxL/cv9IGSdXqe6
	OgTtXZ+cAUpnWAXiUJvDR6VyoKGQnPhyMQt3PFL+6VqdHxd1biTt2Ypp13QQ74aiOf994R3s//i
	oIJtXusD1+B6NnJqMYFky7rPXFDMUeN4+WftKBdzlBrsjfxOCH3RpEDXKFzR9MIzD50yY+LZ5vG
	jHUIVuU1rSdsM3REzOoiXpe+44ePyTMJyNVA==
X-Received: by 2002:a05:7300:641a:b0:2ed:a58c:942 with SMTP id 5a478bee46e88-30c858d7d0dmr2224686eec.8.1782384009524;
        Thu, 25 Jun 2026 03:40:09 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.250.238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c9f166dsm6945944eec.22.2026.06.25.03.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:40:09 -0700 (PDT)
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
	Keshav Verma <iganschel@gmail.com>,
	stable@kernel.org
Subject: [PATCH v3] rust_binder: reject context manager self-transaction
Date: Thu, 25 Jun 2026 16:09:57 +0530
Message-Id: <20260625103957.730-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260621210134.441-1-iganschel@gmail.com>
References: <20260621210134.441-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust binder resolved handle 0 to the context manager node, but it does not
reject the case where the caller owns the same node.

The C binder driver rejects transactions from the context-manager process
to handle 0 after resolving the target node. Match that behavior in Rust
Binder by rejecting handle 0 transactions when the resolved context-manager
node is owned by the calling process.

This applies to both synchronous and oneway transactions because both paths
resolve the target through Process::get_transaction_node().

Cc: stable@kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
Changes in v3:
- Keep the check scoped to the Binder Process object, allowing transactions
  between different binder fds owned by the same OS process.

Changes in v2:
- Compare the underlying OS process task instead of Rust Binder Process object.

 drivers/android/binder/process.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index d09facebddf6..5befff9cf5b9 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -901,7 +901,11 @@ pub(crate) fn insert_or_update_handle(
     pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult<NodeRef> {
         // When handle is zero, try to get the context manager.
         if handle == 0 {
-            Ok(self.ctx.get_manager_node(true)?)
+            let node_ref = self.ctx.get_manager_node(true)?;
+            if core::ptr::eq(self, &*node_ref.node.owner) {
+                return Err(EINVAL.into());
+            }
+            Ok(node_ref)
         } else {
             Ok(self.get_node_from_handle(handle, true)?)
         }
-- 
2.39.5

