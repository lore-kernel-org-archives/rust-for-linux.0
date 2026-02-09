Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E4136829E
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770634508; cv=none; b=qDjpqXlOrv1HRBXt3BH8tF+9zJgCxF0NSRvJ3eXxTEI1c28y5Ryi9yh/M86k3Y2IEKYzqq4pH8fAVafTwrPTMR6uMBKi3mzKrDycHuLU1hztYclv6aD37LWCctJi+ExsG27JtZx+BxQqotSGBSSatlZpmdF6/57HDGpjFQLETh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770634508; c=relaxed/simple;
	bh=1eLU8G1BLPMcyqLdbIe/q+DIa1xk84N2EQx0B+Jda2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gBlDWMN64omW+U8U4jHgmitAZHg+3TPg6ssxVYfjjfgNjmARKUDtHViEBP4vngx+NVXOE7moTMsfgqRLHoYzJdsUL5B0CIvbe7c0xmnyQWlbKiVjDp5HVdRuH0oqJvy10+YT9Z3XPBeaqF3H6m+JxyVzuoVwpn4Z+l2IG84/qTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjWBdGuA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjWBdGuA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a79ded11a2so29229965ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634508; x=1771239308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNqlTbhyZ28IS/AUv7WMI6I0SLBfjfBNRSCAUq4S/FA=;
        b=BjWBdGuAl6GBQUWK6A3v3iwrldwbNszaCSBKk5DfGqvao2biDc1UdyaGpL0SjFVq1+
         Sxt3ySwVDgQ0XMPmQRTKz7ucWB9CCi+jItJdDsMfRIFbKmoIFnh81fS7+GygBMDtqZ18
         pqTLV4eXxND4EHxMpO9tBjK4dxNMH0LedVUi8yeHNI80e6AxybPdvcLumX+aGeUIRDEn
         VL2dt0196n/2AgZhTLsZC/lRhp8OysuGP/oP46jAHzRTxW6m+leV9nCTnn1mH4QJOfZ7
         bDFDE/VO2uCPdd5QGulqHgpQEC9Cq8RbwqnUBw8dzrvh/W/nixre3/ahRSdp7LkvJnhB
         9f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634508; x=1771239308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNqlTbhyZ28IS/AUv7WMI6I0SLBfjfBNRSCAUq4S/FA=;
        b=E0O4o46kF6PW4gIwv6y0B0WXlry5iW3kekVh+tdSu1y1lEWfXNOpneIHSUuh64LoNr
         dBd7hFmoLA/cMwzqslZTVsLbtbr/lWaw6SqgSu5HxSFcanAtRG6qtYIy6nu55FX7jYmp
         /HdYY0c6u0eEAtYotEvZnn6qwUFHFMm8si8tAZZwPTHbIUmy3SE8b2dlzscSI/+hvANY
         ep06HktecpV/zkli6AkksX18Zw3EKEk4y9to6kV9hiY7UmOH2fjFkIKpFUbtjxi9DMpP
         djXCNbKfXRTAgYr2eXpF+Ekj2rf/7bdkoANfmUHI2qHYK/s9YIImTdhHflsE7cQasMlx
         dYQw==
X-Forwarded-Encrypted: i=1; AJvYcCUsqqnt2uW3nvnJbkNHnvmAcK55/1emh/c7PksEYuZKFLXIEcvhJzczDu+xx1CMrsnDmgYRS0cQNC3yS6pBag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYSiifdoj3VU49TFcQTzirZbG5pVbJtohqTXxgMsHQ6/Ouu54E
	PR5OtO8/sM5pDWLi96tXSVwQzPWN8GCOkzWgZ/9HuHaw0TZFTnw26ZwP
X-Gm-Gg: AZuq6aLNjebhgC8TzRiYQY/42OgBCmY5/2uqfjp/6dNwk3J1hAn8slDl8axwLY4HPv1
	YSzaPpCNAdBX80CRtnaQrxfhe+2p2F9cm8QeSA0cUgzR226VMCozh/AqjPosbeq9o0MKJLoUSAp
	BaMG237L7wPR+Mdrti+hbvT3JJJug5DDYhLV9fdBOxHC0uedZQhqon32ZpOg5zdyaKYJUx7HnMH
	vQlf9PRSxuZNFMZdPlERCEONlnqHRVKAJyBYkWLbU8EmG3KcBVEq/LhQUg9xN44WjSwwDR9o2fb
	c5AD2rEGMGox+5It9qOGVpKD5IsLc9UWDv7ijK4+w4HZPIA0bH9c043uAsKGZD2djjWqYylPd0K
	tSWd2ZEq0L5AcASa2JNuN2nLOIt7BU6Yp/yTgxenl/HYKb5k5bur/45tvEl+GHS3VwQPQCLY5J1
	rSpVDi7nOyumEGjG8NnMZht8UPqPMSOnjaLP7l21qFxjLbk8sXUvh22SHXH7E=
X-Received: by 2002:a17:903:3c68:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2a9516d5821mr101672885ad.29.1770634507668;
        Mon, 09 Feb 2026 02:55:07 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b31c2sm10635974b3a.50.2026.02.09.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:55:07 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V4 0/3] Rust support for powerpc
Date: Mon,  9 Feb 2026 16:24:53 +0530
Message-ID: <20260209105456.1551677-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been 
merged over it. ppc32 needs some toolchain fixes mentioned in the patch 
`rust: Add PowerPC support` and the discussion for that is done here[1]. 

This has been tested on powernv9 hardware and power10 pseries qemu. I
I request Link to test the ppc32 part as i don't have a hardware to test
it out. 

[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 Documentation/rust/arch-support.rst   |  1 +
 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  9 +++++++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         | 12 +++++++++++-
 5 files changed, 36 insertions(+), 11 deletions(-)

-- 
2.53.0

