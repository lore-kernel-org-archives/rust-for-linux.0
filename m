Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16C8271476
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898341; cv=none; b=OiZxBq2LnWYwClUoYVo/O/Z++UwEwfoIY0RkHNaHYXr6LICpQuTNcSQ5/mwmt4PVXIewCDHNS0yCcESaKr0Ur9gUBrCOP8aoiGmgzybrekeNlODlVee21ssXQhmY9I+gDPY6D7JbxhghJJKt00MNr3WxQPh3KeA6RNAtoA3PDQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898341; c=relaxed/simple;
	bh=cqq+Huc2Qg/MFOXkyJQm4PpW6eaLmYuyhRgeB+xNM90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b3DnoD6UgRmV1x1tFLdd8iJzk74I7g1rUbdQ1SoQZaEMPtGP3UUX5bjW04rYqWD2qFvTNqP9uSfTCcRx79ZW0izk27dAcDHVQmX0bnCriMknI0VtnnW2s0PVYqOypb/OH5WrpR5qpFL1BiY1CUgwgDss6LS1gcurmwiKrrtYCN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so50652175ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898339; x=1769503139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jaDzyJBzI8CanNRf1i6FlHF4mVMi/qYa4tLLAKxRL4Q=;
        b=ox1P5vpTvz8ss8X0CiOI9LXV15STIHJchtuTdhSl2SGQyeo3XZDpd4Ep/nDOYFpYjV
         XCvc3YsEswNj6YdNEdji5aMzZw3C2SgP1FQE5jLofeGX2HQUJR/39bgFB1e9i77JenLH
         j4Bl2LrH9SJ6gQfzmhGtTfoh6e+hyQluSqhte9ZxR9BPhU18uLpOczHDERGZYNafs8TY
         n7ZpXqjM0tiAopqHWJZGI5Dv2feF6fdQy586Lmn3xt8zHIJ45QWcJ6f2nKoGh0tUFLB8
         S4lmTtDVTKWRSmNumg75Ab/nWaRWgSEUUTxi4jvl4oCUIMbUG5R9qByZGfxVzRT0NAFY
         Zqkg==
X-Gm-Message-State: AOJu0YyeKGFF5iBVa4yM4pseIpAhbPa4L6X/48rn+tZojn8KNbDXjBO4
	WN6am8WAES6C+lZNow8GSKNdhHn5yHhU0UFGNmAVNiQN/kp2Tfw3E3wywy5Vzg==
X-Gm-Gg: AZuq6aJZXoKQmQH/oySsW/y031b8XHgL39+pTp41hpSvp4bmV2+30QMl4UVJujyp4sE
	/3CjWzQ6mWls19YWqEhuDI/7n1WaPQa4XOLpiriTYcyEfJS/GGAzrCepUNtA20gShbceDGRh1jQ
	s+sQit+rwg4mR88gAicoRmuo4VEVCwkJKoDbM2M2pKfgeCL6faN1Mnh+2v7ea0hUKhm7ymXvmBj
	GfcaldJ1tDsA0qrQ/MHVj4xm/ihRXVY7fbECmuZ2MTHwv3C6DEHepIlokmXh6J+Snm0ai2lWkMD
	Q3QEKcgiDcFszlViz4e4fSwmv+MQgtyiDatsPGMUbP7cwd2eJC04uaQdjr5Xvevl6bWKx+EMFGn
	giJFngGg0lhVi57ycO39wlfSqGUYCLJxePdExxrEHA04pf3ZPG/Dgm8rV4jwm5r7PEXRD27flGO
	Z6HZr4kPgjxWiYGNB9Kx4=
X-Received: by 2002:a17:902:e74c:b0:2a0:97d2:a25d with SMTP id d9443c01a7336-2a717516415mr125136515ad.15.1768898338649;
        Tue, 20 Jan 2026 00:38:58 -0800 (PST)
Received: from localhost.localdomain ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm115114625ad.23.2026.01.20.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:38:58 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v2 5/7] rust: of: use pin_init::zeroed() instead of unsafe zeroed
Date: Tue, 20 Jan 2026 16:38:21 +0800
Message-ID: <20260120083824.477339-6-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
of_device_id initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/of.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 58b20c367f993..8ae49282a09c5 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -36,8 +36,7 @@ impl DeviceId {
     pub const fn new(compatible: &'static CStr) -> Self {
         let src = compatible.to_bytes_with_nul();
         // Replace with `bindings::of_device_id::default()` once stabilized for `const`.
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut of: bindings::of_device_id = unsafe { core::mem::zeroed() };
+        let mut of: bindings::of_device_id = pin_init::zeroed();
 
         // TODO: Use `copy_from_slice` once stabilized for `const`.
         let mut i = 0;
-- 
2.43.0

