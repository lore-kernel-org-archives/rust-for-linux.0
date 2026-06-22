Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C23101A5
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140324; cv=none; b=fl5K5pbxaWZ0wiL82O9IeZAZ4AVYSQQe7m/1d2yh3k5x8GYyzK3iHY4xttA7R/YywMd04CoksM5q7JCkWIpAkdS+ZZfTqfUPGSYtbsAxw2Dp5VaadeEGBw1JXakRQdm27i0BnLSWXd/JOzbhVtM6PJq105VpQGIYfcj7zjQmb18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140324; c=relaxed/simple;
	bh=kFaJpOvweTrf7dqHJQ8KVk+Qw/ICdIEILNTk/HC7aZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uqMfvRBBMhvxOmphcaJEVslYB/3SxZKTiW+Db0ESKLPxqgzGUM5Xus80d0FByeHanhTqjWSGiR7IRm17NhyMWukXn7LyfzzLsKjZL61PiHAMpLZC8bEeRwaM/nvOntpSK69KhTtTRGKSLsMxVgaMfGcZBy8vhwGxABel+FS6PU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4jRBcds; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4jRBcds"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso37858225ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782140322; x=1782745122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bgy6/tlhwdndpj65fs2+faECMzbDJTKSLOfGWTpUBH8=;
        b=b4jRBcdsS3/t0dbvG4Cse8l6f/bnkhJCTv0zQCciq6Js3PIwomYVJ1gtZMryYh9SNr
         A/VDojRhTVPU09QPMFYZ82PkmUs0Sc2iFd+8khgYIvNkDKIRqGr5ubCCqt+WU6ZD0e4Z
         sw3g6WGmIg6j93COkRWgTqHLBKyCFAfVVImkyhTd31BZqdtWJTVU8XXZ19JRohhtj5bw
         t+aylt2zy3QLc3SYQO1is4ssBFlxGEUjb8KfPsgrIZkfE6H5MV3u95cDrBEdj2mcUMtz
         pCkDehWEvavEQuSdIOo7iwwr0pBW0Rx/g3miXaPzAuHmixr5BTNyTHNqNXH12UKp9RUc
         quOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140322; x=1782745122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bgy6/tlhwdndpj65fs2+faECMzbDJTKSLOfGWTpUBH8=;
        b=YM0xsikR5dHNmPq9la0eDU0WKtNokaQvfykJ2XN9LHa4WdtZ/HuC0PRPFjJrRTGUks
         6YbqhgABwA1y8VOcPbXtf0rTzV9E52OswjMxU92mvR5owcutw/GFvpRkiBnJJSD0UCZb
         hRCmjPe/2qiLDlpwH8CUuW6ZNxRQSXjszkvvUltESSc16QQuP3deYWF4MMpTThqEoun3
         FdBmHjM3GS6h1FpQZ0nDS3Z08gcBYSGKy339SJY5XL52g0Dljb7N8/0k4YVWo+oa/xZs
         uuXjr1HUkinDUdeiodaFUiSJur4cF6Q3k6lG+XgBNNLv23Ttq2IqFewI+0BdpIH/fXwf
         PbsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMfauon//hDcCdBt2cevRKPp2PmgE8sIPConwSWK4Ed+EJOqsOG/kGkLslLMANNySJ4gXZLjhu84hLHwTw9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6d1AnOnvBHsbfgAhhsYrSfv6oSKWMgOGLky0Uj1K2TAeWs+/m
	EDvv/UPFLRjtXdWRS7YtucFXCd+uLOeGjLNoclhzzllJ4BSrcRnSwroD
X-Gm-Gg: AfdE7clsWCvrN2nvUAScUbMredbi3TwlNwds7em6PXmte+S/W7sBQGRaMMXk0AtkSgP
	NiZi6M1ss4FuZeBAhpWtp1Nm1iJLmCD2ViDABj4FUL7t15joB2p6coCDVZdv+L3z1pg9iXzj6AZ
	rnwDtwVMjbNcsvhDYSMEeU89XX9pJ20M4QrCu+ES5k8ETXct5kgw4B6QXsQ35jvmgyIUAtgmMhX
	V8xRxvK54Tf35e1ChMQ2p0BMEOri+i/5l1a7JSMA/owxfpp0ZjssA/u6MCMul4pbIM2Ya+UH4lz
	/VdqOtMn7xsoyVb6j+bH2OsPVCiE9dTIZO6cfXRA9ubZk/PnmhaPHjqYq/xhBAIJb3K1KsFw9bX
	A11cHffaD69BEzbCmwX9opbutWs1boL2oyZMa7zUW2ARevaLS69TsK3u14CvoB6TCy7A9jRU4yf
	vEWww9cLqv4rFeM+dNNuNnRoP8dWt76jGQSQ==
X-Received: by 2002:a17:903:2f84:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c718cc243bmr172793895ad.7.1782140322386;
        Mon, 22 Jun 2026 07:58:42 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.250.238])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d5bd6sm97023705ad.22.2026.06.22.07.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:58:42 -0700 (PDT)
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
Subject: [PATCH v2] rust_binder: reject context manager self-transaction
Date: Mon, 22 Jun 2026 20:28:01 +0530
Message-Id: <20260622145801.344-1-iganschel@gmail.com>
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
Changes in v2:
- Compare the underlying OS process task instead of Rust Binder `Process` object.

 drivers/android/binder/process.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index d09facebddf6..13ecd3048b89 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -901,7 +901,11 @@ pub(crate) fn insert_or_update_handle(
     pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult<NodeRef> {
         // When handle is zero, try to get the context manager.
         if handle == 0 {
-            Ok(self.ctx.get_manager_node(true)?)
+            let node_ref = self.ctx.get_manager_node(true)?;
+            if self.task == node_ref.node.owner.task {
+                return Err(EINVAL.into());
+            }
+            Ok(node_ref)
         } else {
             Ok(self.get_node_from_handle(handle, true)?)
         }
-- 
2.39.5

