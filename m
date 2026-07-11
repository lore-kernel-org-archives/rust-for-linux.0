Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380762DCC1C
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783754161; cv=none; b=Qz4evZSJx9iirb3SPOi8LHywR0Bth5p3VcjGTMlDxPo0XcKJ1JCjyju2tHBJFm+wbrtJJ7C1uYl2axQRDhUEwhYzjhkvQsDKGYNnZpWflEivEVLXXpDVjOpuUFXJd5pi77beWgmV4tVszP6gsjr0+O4aYg16g6HoMWO8EqifjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783754161; c=relaxed/simple;
	bh=oF9XId8/epPLyP6pJAPVXYa2y1hNfAUoECqKLgQVYiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZpbUfSCXFPpNhp0ffhnuMc37XGRnXJsw9KTGzILA69tpjhKzX+phTn/yF/1G0gdU6IfAKZIh9SmOm9L9/bWKuVi0oO2lDipOJ/0AZPGAYyBssmDP2VgVh1+/PjijiVDnA+/w2vKtwBC/BU9bI/AN3J00JEatRUE9Nccg/8naLR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agy9MxxF; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Agy9MxxF"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51bfad59921so9908121cf.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783754159; x=1784358959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HX4TXEZK8gzteZtAWJ3z6GE/ELMDGpuicsI4UUMhg9s=;
        b=Agy9MxxFQiQKtu3380sxlwK7ysFpvVaVQr9cDzB9BDM1iiT9Ws1lP89FAHS+0ocPLb
         l7Ew9J8x+72of+yz+CBvEtYc4CrVB301Hs9tdQanVfH9ZrCektY6gDBUuqvs5Tj5aZSv
         Sji8t1xBOdQvpxM5WYymJxb1I79XXwHtOwlPjcxVtSFC0F64cjd2kT+rAPKprFpht842
         PM7MG/U8ioGtzXXGhrdBtnjrfDgOEVzIFtNsm6fsuzdZfU4VIly7MRen0t4YDrYxUs3D
         CS1LdzTXr2CsZjtRsp8O5LwuQF79DbNpG41cssqjMhR+c5uwM7f78uuKBXcvxe85Q7G4
         l51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783754159; x=1784358959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HX4TXEZK8gzteZtAWJ3z6GE/ELMDGpuicsI4UUMhg9s=;
        b=rp96j99wqv91KYLGGcwbyoYHt2J7ugXaMicmLD/CNkyIahIS+Mx8ci3xFolrETyl68
         N7mvcs3AAObsVVutcyvXOMgkCodFZL41w6Tp5O+gCX4Mp+Dry5FnWCOLRCtLB6HwCqFU
         gmsEpprQ23nYeyMF/zYDbpZ8XUR6RZId69YydLs3+xQR2Fvfl7Y+58ZIr394iG03imAK
         lfipJfjHrh0vejITwZXD21Qcwk420jpQxv1sfufk3n/1SQYUdy6vX/pM6Ohabtd6vExr
         zLNYQO50KP1llZbEdDMaL8JwHtMPVjFjq9g3JhTJurJsfHYbyoSWEIjEVBrATEU1lzwh
         0bAg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2rZw9N/gRIeIqSEDJSm5Okj4FUBz3MqujPTCD+RhQBHXZfmdQTzMHdLpeFAu552AEHtSoj8SlB8YOhaEH/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxty8x64MeFExJ4vkan0+pYms1yMc5Z6t/8gYNdmnQfJbDHV+LO
	QVQ1LFouTyfNDcnMUBWO7c4Ahv2UJqq8l8cGhRnQKhXj4mHVHnQuUAI3
X-Gm-Gg: AfdE7cnlILvtB90jErjol1jt3ed5hJJHpl0SZ2stmjC9yLuX508DurjrOJEbonovXCa
	GE/qDTPF7wvjuWKvrjmefM7m9y/5wLFpPrandkuLyqSZEUCYtCKtFEklpyqbNqBAw9Q9+Zc2stT
	KYLSe4BDr+FY9vWE8zbT6KAhmGVDhmZkunpTKK9RjDfsVafjCOf6zjpMmAqARMGmQigMFSh/B82
	kj0rSvu36pG3WIWr7kGYf6V0IJeY3Znnh2uJq5ZBcIRLfPYloAZpsN1yjogd/sJIXWNRQOXt7XJ
	Nl483ehaBQ+1Qe+Lmmzef1ZM9y76DS9rSh5AvtdeBsQG4E+9BVvWZsEx/8/iY1d1fu+An/8jgIp
	TiXwgYZvh2O210sf7W/9uXMBQcHhjWTuHcvgO/KpumJt0cjoR2wRAoN8BGkJESTgw9LMYymUugS
	JBRs6DK2ysZBcmJa/+kHYtw3S6gymNbgtxCIlzKkhIje3UlC4sBJ/Jq/vZQj7GEbpbX00ApSn9L
	OAWdYV7/XAtFY1y6bCDWS4F8atSPhZ+/XPjfN7oyN0EPMFw
X-Received: by 2002:a05:622a:a0b:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-51cbf071d8emr21074621cf.5.1783754159122;
        Sat, 11 Jul 2026 00:15:59 -0700 (PDT)
Received: from oracle.tail79e65.ts.net ([129.153.156.79])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caa99a194sm31576121cf.0.2026.07.11.00.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:15:58 -0700 (PDT)
From: kosumi <chankocyo@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: impl_flags: use bit helper in example
Date: Sat, 11 Jul 2026 03:15:51 -0400
Message-ID: <20260711071551.3035420-1-chankocyo@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bit_u32() instead of open-coding shifts in the impl_flags! example.
This demonstrates the checked bit helper and ensures that bit positions
remain within the underlying u32 type.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1244
Assisted-by: OpenCode:openai/gpt-5.6-sol
Signed-off-by: kosumi <chankocyo@gmail.com>
---
 rust/kernel/impl_flags.rs | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index e2bd7639d..fdf44d5ee 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -19,7 +19,10 @@
 /// # Examples
 ///
 /// ```
-/// use kernel::impl_flags;
+/// use kernel::{
+///     bits::bit_u32,
+///     impl_flags, //
+/// };
 ///
 /// impl_flags!(
 ///     /// Represents multiple permissions.
@@ -30,13 +33,13 @@
 ///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 ///     pub enum Permission {
 ///         /// Read permission.
-///         Read = 1 << 0,
+///         Read = bit_u32(0),
 ///
 ///         /// Write permission.
-///         Write = 1 << 1,
+///         Write = bit_u32(1),
 ///
 ///         /// Execute permission.
-///         Execute = 1 << 2,
+///         Execute = bit_u32(2),
 ///     }
 /// );
 ///

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0

