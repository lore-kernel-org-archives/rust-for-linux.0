Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3883A1E84
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 21:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007887; cv=none; b=HbLywO7vi33FF17oxkoo4ZLSW9T0a2UPQhvW8wNYM1AbfN5V1PCfjOVGl7S6Xt7wBKdFyBCi40yvXZCCV/XwWA2DXrpvRs6PuVMQq0O+UIatklp4l7okkrh2LMhNMXimWkGxjgL/O8SU18a3LgNcKgC4a+UBvk8NZ4PgNvkl8H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007887; c=relaxed/simple;
	bh=JY4fIkcpXeKdWD2V1pPOxVUIrC74+EHbUYwg+Jo3k3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRVthj9S6gf9NVHFhGnpz32jRPAreSgWW80hkxxVGUdm0PGiwhoj9gsi+JwiCT2LYGP2RYXHT7GVZ8LGjTe4JRV7zioX9p+AdUvN2PUhbr+vEJuSWXhnK+9KEcrjDrbd/C8P6L904Ij5osSYLrvA9w2cD7knRWYd4da0+9zvZkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IycxmpOH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IycxmpOH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0d6f647e2so63186425ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766007886; x=1766612686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fd+LcjAJQSJmlQsONHUDihswhWi6iqD7kOIu/ggTBw=;
        b=IycxmpOHRXaKuLVbmGzBHd99RGg9afBkM0ciMwHmnAeZ+dV8vK16oKKeXw/nEfE+Te
         cGasyuBqRLVvzJ66VjYLPuiTfdYgCz3zWzazbkazVYWBb7P3WFtFU5oFAfW7sOuVvy68
         olVRgP3nHscyAiaLPMtJsF0KjhBYAcnh42vEoWAVPt+bhmCwVQN/Bx2PvgjsyGLOVvir
         vbQeCrDQU1wrLMHSbtE/gF6m2cTGTwZMiMGTOzmbKQ41N1P1FYA6oEkxQIEA1hOZP+oo
         vlVNjUVowmpyeqEirhkKmRMe5MaMXjWv46+p6zQ4RnbDE/FQfXCUanWUnPZDVQFlW3nh
         Bh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766007886; x=1766612686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0fd+LcjAJQSJmlQsONHUDihswhWi6iqD7kOIu/ggTBw=;
        b=INE9E/i1O7zTY8DEB3whGgp7UwbzAxcxx3JUmlB+4peQElYRaLysnoLAovzh+p2xCR
         lX63pSytDSPPVh/0nVxgmzHrU9cGHLJlN38WIiZr4Y+TsI4aaRZjkalWCPexMGb+cEU4
         g05d7XACYeX2EwbhaAC05T/b+i9JzN4VQ5jttX42M7+L6HQIHRCYeFI0JjLOSQlQZEdM
         sT6MaSDSOw861g/DgLWhEy9SC4SyNkKnoZ4zmHjJsuf9dw5ylyCeI8QW3kep6hZ/x0i7
         J6eJyV/3H/ryjl93oeNxwJ79leBzL6T+ryxPEVQxKLaWGy3wBDga5dxWqFhjULstdUN6
         /q2A==
X-Forwarded-Encrypted: i=1; AJvYcCWcjlC44NLtZNfIFzAkcYTpkszF91+9b4EdB6K/YT56eGLvVcp9Bd4jSyflkMzKH6ty4Cg7zfzMv9Me+kWPvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRngQxPEFVGlL5zx5kouLHi2uhdfQGl8GCYW+KkQuO22q0H29z
	qQK9rdLOrBmM+brIJBkrZ86/qj4vdPLhU9Hsymv3EVYBXjqqi9gGZY8D
X-Gm-Gg: AY/fxX7yvOuLxgZf6Wr/fQm1l1C5Gjx4H1xFGacl3G2zT9l79UKidE7qciwP6r8T1di
	0jKhTY7bF3HhH0NOK92HL/HVxdZZ/Muayzxwp1ZsRO8T96bBAijpz1RUXTP7cpS1dO5DuPwVQqj
	mmqChdkwt6ujpI7OD6lJ6/0TT2ebTO+xsQzYaeRJ1ZMoOBWxUa3sOt+UbHVS+j0lCLTHK7zOPCE
	+znIc0dtqw+XuhyfBZBg0JosoIrWE+I7zahJgYGQbX0QGyqZ2WaejbzEymbodDicPQhqlQ1ixoN
	QGd/v6o6c+G+qzOmUcbAyURkAfCN9obBN3ZlA36gfCTFicAISbeeA/ztJq7k1m70T75Dpt7lApe
	zOOmyyiDPu2pEt/5Le6SAvFCTSbPDxeEZRNj5BNGhHmODh1N9WQstIFIj7k4kAGvwYNneUJoqR4
	RGL7M3Hi39y382P11FsmKxFcAt0Pc6cKMyCRP9lWfl0C7R2cnXtD4SK3K9h0VO8g==
X-Google-Smtp-Source: AGHT+IGsXA6FsnquoMFbe6qDtJSxwylUtzeH0suUrcdmd+ZV/fC9+zDk8GaxRf/ZynliPRNL144JhQ==
X-Received: by 2002:a17:903:1cc:b0:298:2afa:796d with SMTP id d9443c01a7336-29f23d44e59mr190943535ad.61.1766007885697;
        Wed, 17 Dec 2025 13:44:45 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0888fc8sm3050905ad.26.2025.12.17.13.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:44:45 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 2/4] rust: helpers: Add i8/i16 atomic xchg_acquire helpers
Date: Thu, 18 Dec 2025 06:37:40 +0900
Message-ID: <20251217213742.639812-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217213742.639812-1-fujita.tomonori@gmail.com>
References: <20251217213742.639812-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i8/i16 atomic xchg_acquire helpers that call raw_xchg_acquire()
macro implementing atomic xchg_acquire using architecture-specific
instructions.

x86_64 and loongarch use full-ordering xchg.

arm64 and riscv implement acquire-ordering xchg.

arm v7 only supports relaxed-ordering xchg; __atomic_op_acquire() macro
is used to add barriers after the relaxed xchg.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 66b74111d798..1de75dc0ef90 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -53,3 +53,13 @@ __rust_helper s16 rust_helper_atomic_i16_xchg(s16 *ptr, s16 new)
 {
 	return raw_xchg(ptr, new);
 }
+
+__rust_helper s8 rust_helper_atomic_i8_xchg_acquire(s8 *ptr, s8 new)
+{
+	return raw_xchg_acquire(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg_acquire(s16 *ptr, s16 new)
+{
+	return raw_xchg_acquire(ptr, new);
+}
-- 
2.43.0

