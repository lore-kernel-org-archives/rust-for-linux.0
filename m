Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5FA330678
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707536; cv=none; b=gJz0i0OCTK43mGTrTVrUVzVBat71iDsuGEByKMACCzQHRIuSa0yFeQuALHklyb8diekdAfmUn30TMMJLyhDPn8NnyYIcu4ThKnAxBa2Yx+TGLrng2SW3peQ14UJrSQCNr9Odpbh2uc/IXI394o+YJNldCE8hG4oGQlxDC11dJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707536; c=relaxed/simple;
	bh=2+kl6Sx+b1b3jkOuwybxG1g4ZHfGj/c1Kxq/8N42b9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O9RUHfJWVqHzECndotktL2bdi4Z6y+DnhkLeN+Yd6IRwApWU02vjqRMvwzpVoAtzW4aRfrz/p6ozPNS8nwipyBwAKJlt5B7oEk5nznQSZOb3ktTw722UrwsBIc9a/DpMP/EkTlc4C247sZiZsgDvmOtpHDI9dAMhCnpQ+A1uB90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTYsOl7V; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTYsOl7V"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9489d087bcfso326138241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 23:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770707534; x=1771312334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFHY+kwDQdh2yEHJCYn420Oxm2P8lL33JJQBtOkv6/g=;
        b=kTYsOl7VEccM/+8JwL+JSDVz3FV12V08dK/ibRthRVo2nB/L8vdSqQh3WYL6fIHY57
         KQ3b1ZhLhXg3FcVKx/YVt5umosz2PR6PzyLYBxhagG3aYMpbRoF9GhVQXdgKTpeLDSX7
         AuBljOjbIcsR/c6Z0Jv1S54V45+5jlG11t+FsvbReFZaXUhQrmJYaZNKLDP40qP57NPf
         Jgfko9GOkIFQKfi+bc1wl/xDdhy8iAIfE+AR1UuC3tY4Zwxg7BLP4In85ZfPRG8xnZVj
         kLZ0tSdhBZ5W7HQ3FF/Z84HS2q8AF1MGueKHgpWQFkFhxCfcgPvFHkYM8Z6O7ZsF+M97
         YqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770707534; x=1771312334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFHY+kwDQdh2yEHJCYn420Oxm2P8lL33JJQBtOkv6/g=;
        b=nnyNrpsCImtRp2WfKjDpUmZneuWmDxj7DgNRzsRrTUEXVDKWvaRTERPBLGdnd/ViEh
         L4N8ez064w0rIHCO8W5+8YDemgbFXJS+PWeqWIABgpkGfYWcvWHYGqckB/PLCrMCx1r+
         uny4OpiTMFRDGdwEuK9h0/CHj4zxnYa0hPTgmpzNfEUe4aCwxNNb9b7ymWj/2o2zZiwo
         p4tBvYF8a+x2t1j0zbrohPxtg8dA5R8nqvaN3CwXO+gcYMvVDSiRrVyQcufHgq2wMaSY
         TIdacUgBaP+qReZvgEQOpTXLRSrMQYlSYFnr3YQK21LGML7lWlIXs6PxpDuT2vA10AYj
         hsoA==
X-Forwarded-Encrypted: i=1; AJvYcCW9pozd2XirF4zocMmovhdCbdcX6Ut63zrD0CxXlUhPXFKQbwib6v4yfv8jp37MLptZoD7FUFnCNdZBTp7SRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1uH7L10hXSqPnftvu6VaISYv/kZ6udVvqokT8lkWUNU75nuaV
	ldqcH59G6g47e4WZPZiScu12VCpbnCwE6EjkG/+6Y3Sc5G6WOwmhgGHAdHDK9g==
X-Gm-Gg: AZuq6aJ1yn5TqykiHXCz5bnpTHVr6IrSta5Wg4/kbqB43wBuHPdWMMn/TU1pejRSIc2
	LgAcIKzQUaBsEyY4u2oX4/I6wglxc6eHGASb16Xg6Tnlpyc/ja5SjtzYe1F6tjdTDCHBmEstu+3
	uOxAub5PUMrIpRA3ll7n9IxxcvfzHqOB7KroLVPV0/TRbcrDeT7eR/iGtVc7KBjzrs+7mOdqU0i
	P1GKdO8kyd+MIW+Ro8gkpkG/w7xVk+YLG+pOr9Q2wqzb50rxvvmlgY0bToaHJJiJkDlBwTnS24i
	qaJlk5j4kZHp3yz/aTYgxayxqt+DzvaUFQv7aiLGe4ubM7us7tIlo2K59jrHMbdm+3c8Kvocwz+
	lfe0QaLbiaxfebQx2AiJvALaW7X8u/ftYfMEH14w8v7ly0H7YkPkceS9O4c2OTbFgithj75ZAUb
	as3NJQ11aCZnLLM51cq9ociQLp+zGJx9QbexH15XH4sUYgSY+jC1P+zUktqi/JksgXDaLd9qg=
X-Received: by 2002:a05:6a00:770f:b0:823:b6b:4850 with SMTP id d2e1a72fcca58-824416f8d24mr11637215b3a.44.1770701888061;
        Mon, 09 Feb 2026 21:38:08 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm7529056b3a.36.2026.02.09.21.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:38:07 -0800 (PST)
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
Subject: [PATCH V5 0/3] Rust support for powerpc
Date: Tue, 10 Feb 2026 11:07:53 +0530
Message-ID: <20260210053756.2088302-1-mkchauras@gmail.com>
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
V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com/ 

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
 rust/Makefile                         | 10 +++++++++-
 5 files changed, 34 insertions(+), 11 deletions(-)

-- 
2.53.0

