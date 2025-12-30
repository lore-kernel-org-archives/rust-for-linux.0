Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8DC257845
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 04:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767070243; cv=none; b=L0snWIIIto8P4Ej5RLlp0Wzd/RlbrckF6qVbrdZCDBNGrMzEb5p4m5J6AoGWdRR+gNTi4NPZx2DbmSGk2iCb6k1TtaV2Id4RNMi3Li3qXpOQV7dpaWV7pELv3QQ03EIwQ/rgzsb8ZoRzgtSnq9S2jM0fnuV0+mZ21+FZxheoqDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767070243; c=relaxed/simple;
	bh=Hp8DN7D/yTHZZuYL6cvL6rGmqaVhTJhqpDL41o8WHio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmyjNRAxz0JDYGJ8rv+6mgKMGnyVaPLzv5S85nxHOmi06bB4ElFy23/jQ5r5eGRlbYmvoITdGqxvRd0wdgIQHGhCJeAQgXgSslbLmTB4DdhdjPuXicYTMe5GTR4OAsPdMSvIiLXdIj0TNFEkNidTxXsiDOiQnurciSuqvntUW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fgv6dLCe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fgv6dLCe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso9819981b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 20:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767070241; x=1767675041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTgqKg/NyZLs05GYEiIMrHKONV7wwa4BNTXrO2B8hPs=;
        b=Fgv6dLCeQO++tv5hKfxJWXgPc5IgcFLT3FNEsRSIcU/zgTvdhiq6UeC36mz2eiSj4u
         zTmnw7zubC9R2YCyc33IHN2RRpEeOpF9smbEpV84VY6bao4HyoUIuJb4LLchx9ynHsFb
         HUIYltWR8Bv5+7RgnUdVK7c6yqVO3a8KPhvBJFyd0owW9CktB/aaPRdcLmIt7gyjrGRG
         AMWtEICiKGED+Gjy7v4uw6/NVv385Wo6Mwlv+PqmPlMrKXDIr4zUDGWFsJ6QPDk3wNzK
         8ftJSvjPFtrvgVJBqYxDOtCN1LJ6hFQgGfMtIXUxzDvGUXDmMhTyWPoFVwfSY/RRnKBq
         qykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767070241; x=1767675041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UTgqKg/NyZLs05GYEiIMrHKONV7wwa4BNTXrO2B8hPs=;
        b=dhgbAMO8y7KTArKYyWdGOr9QUruMlPr3Ni7MYW6iWH50ZU/U1YMjWCyEQdMjyCV7kr
         pkZpWGat/INlSHmM8GH9BBHPcdhs48s2k29NuTxHdJFT5rYsrDabc8p/mu7T+XWvduCz
         SCCay3zXLWAufuq77EiV7GLXoSLC0lOmLzPjpNMLbLl3L9tb0OAF55T3ytk3YM4soUZC
         vjyygECniR7Sua89ouAC59aPF36PCztuy3T06w4CcfAdIV1m608nLUhqIElMcBKj2PKC
         bE4/NDDTjyEjsse7j+6Ye3uK7mHxMhaIoLv7dNXF3th3vKhJ2IdFaE/Sn0K3ako+prBi
         O9gg==
X-Forwarded-Encrypted: i=1; AJvYcCWX15lE5TPhojTg1BqJVClK/Tmalrxn+dddutL2Rk+KDRqluNMoM+ruPnU0QoVczm6OqLaBNDg4aVFB2ucKXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfvvGHFfoAzTVnP4uXsprCAAR1DQ2HMdBbMomoD+z3pGCkkE00
	9RA1nuoFu+UizYL3ZDMQ3ekCoV3o3/xrg8fG1PasfqZ5OXIMNGy3dH0g
X-Gm-Gg: AY/fxX6Jrcsh6y3dIpjQ7lOTmW+l9TxUiTPSp9ewYk0R4GuqAK8rqoerkp0hTixxCDf
	GRwUCC5SvCmw8nOjPVz56zcAtWigWHjZiLXorf2lNzFZUAr12NtWt0Pz989aqQKMC7rybA9AkeQ
	LSEAWW2mMT46XMiVp6sc/ZAF3vPiJ5Xdp5aWZjb2Ltu59SbpoJEA8hc0LlJP6nF0lOascbqiZ27
	JXO+D0feYU53Bk1YFRelSEVarHTdrAZbFx5oaq0eE85zeyVwJ43mkWiQUPX8racorV6rFBaYDa0
	MGuYghdmo2WeB5dorZjauxDG1fITZ6dCSaVZrvHgFxWHmddfb+Rvtdyj2hWtT0oKW7NgeG8ASF/
	MFKF9uFyMVV3oARejyymIE+t5spInD6KfKb8eCUNtJx8Y2s6CsETQB4SBBgYPlIzdTcouk/xQFS
	H+0nNiVYI0R1dH/U5p8a176se+PqY79T0pJz20ctMP6E2///umfmaoiTz9DFQEkg==
X-Google-Smtp-Source: AGHT+IFp/furovjQLO4bXBkp4xN3goFxeJ8eFSrn0cqg2OMY1aa1X8jUq7WSnLEQmATL6Ib38PpzvA==
X-Received: by 2002:a05:6a00:140f:b0:807:c2b9:38ec with SMTP id d2e1a72fcca58-807c2b93f63mr13436515b3a.15.1767070241311;
        Mon, 29 Dec 2025 20:50:41 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa328basm31100194b3a.11.2025.12.29.20.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 20:50:40 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v1 2/2] rust: sync: atomic: Add atomic bool tests
Date: Tue, 30 Dec 2025 13:50:28 +0900
Message-ID: <20251230045028.1773445-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230045028.1773445-1-fujita.tomonori@gmail.com>
References: <20251230045028.1773445-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add tests for Atomic<bool> operations.

Atomic<bool> does not fit into the existing u8/16/32/64 tests so
introduce a dedicated tests for it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 3fc99174b086..42067c6a266c 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -199,4 +199,20 @@ fn atomic_arithmetic_tests() {
             assert_eq!(v + 25, x.load(Relaxed));
         });
     }
+
+    #[test]
+    fn atomic_bool_tests() {
+        let x = Atomic::new(false);
+
+        assert_eq!(false, x.load(Relaxed));
+        x.store(true, Relaxed);
+        assert_eq!(true, x.load(Relaxed));
+
+        assert_eq!(true, x.xchg(false, Relaxed));
+        assert_eq!(false, x.load(Relaxed));
+
+        assert_eq!(Err(false), x.cmpxchg(true, true, Relaxed));
+        assert_eq!(false, x.load(Relaxed));
+        assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
+    }
 }
-- 
2.43.0

