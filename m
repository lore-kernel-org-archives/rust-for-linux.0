Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6334E275AFD
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766836827; cv=none; b=piqmu7OAHfBi4hTI4+5eqd6WCTRn0rhJsEA+c79PPLxHnRbB0crtIB0GfUOFH7G5/6t7GDlalSBLVnR9OhO5rnoQObZZY1sGRPHkPWJcATaPP+nJaDvEePe3cyxk9QAw/D05N4k4Nbz50BalMpsEFcx7oPgH74TeRR/+6qdGRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766836827; c=relaxed/simple;
	bh=kQZdT8uUPHSe/dzSYVg9uu1G8iQ4QIfebKVRvfCtR3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/BM3EfxTWzRMHhbgQTu27aJaqzdEm5gFH+H9A+jBZSkFyLeMp50IE+PGhANxKIV8VTMwG+cz8Ht9LkMEFxwA/X7IE27jwbMiCRBVjLM1lueW99/cPefTNYegODqoN+8slnSG/GUL3YPVSRWksh0N6Hy2q3IlGwGxnwZawUO6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwuPjEhw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwuPjEhw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f0f875bc5so114636965ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 04:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766836826; x=1767441626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GqLeAfU9Xo+cqKfof/vWwBJRWGkSTKrPAXLP8+Y6zB4=;
        b=hwuPjEhw2K4B7j3nKgh10z2pLI3pZH+0xmJ+DB1SLcbOfj88a/zjKGarQi3Oe72n9s
         tgp4fnSXlHtsYLH396UOP2TJqmSEFV24s5PbcRdIPvli8w9SNd36Y+pe2iE/AZlpX9Lb
         NUdobbqg33OCOL4EsDbxWu7s7Pp9RiUwQ4x8OMvWVQXE2i3AolivNYcTE3JswDxkgfvc
         JdTckNl5/ch7C6KFndwfysAVGcpIETbKMAzE6ClxpnIcJnqK5HFowthZ4kKD5T1dODLG
         Qwwdo19oBxrnydTYqXcU8p1AcMVKo+OdKZb8Ve1JpDP/Hk0g1T6yeump1Q8/SBjOgm5w
         uL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766836826; x=1767441626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqLeAfU9Xo+cqKfof/vWwBJRWGkSTKrPAXLP8+Y6zB4=;
        b=O+hb5m8QE0vr46BBvv6khPyarSsXhUBjnitbhxDzXGm6LUv5uLshAHJVMUo1usnHhm
         dj6FXkmYbx9bCoeuAZPVTYXOtCZMFamRG0m0HDUnirXfs8nFzHxUcLJz1KF/zBzl7Yq/
         60SNIihvzq8nzo//LHQ0RTaYPaSlJha7JvhYGIS4cwGrMlpD7DM68ln2zutuzL4xYP1f
         SK+8usvZCcRoQqFiO1Ar3YGdb7T5clEp8KVvhgVk92gBT06HyS+CkfaHJlE/N4JvX8ud
         RE4/OELTB5Jqra/XJT+m7xorbK7bPW0C3ooLx/Nif8IgVcGqeSQTRdmePgUEF7fArkTv
         XZdA==
X-Forwarded-Encrypted: i=1; AJvYcCXM38wmde/Mwer2Mg3828890PWzV9UKktZ/aKlcsQgH2yoGF2nGRQFWUQYKYscL92X1vC1urYnqz3/YMwbJpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5sLNO3Y84tiGY0f1fZFL3wgvLoHfCb1M+7LNCLVdIAbXdwLjq
	jXhdTPThLI5SzSctUXXVfGmfDVkPY2lyq9uDFGXZ0TZGQ6IkKBVqrI3v
X-Gm-Gg: AY/fxX7R10w+nWmpXFH2gS/PxHM9Zs/JxxS+lPL9I8wvLLmADSQES0f/nS3yKt0RkRs
	xMasP9W8rgASSKTiAvaEQp2nsAt/l3/lhQLeu+uBvKgHCqIthfTH45fixENVPV2HkEkxtPHC++T
	BIX4fkMRc/FeCNE50XwSNxZgKWaY/qPQWeyxKBs+EG33+Rxq7N3FTHxpt5O1Jxr03WO0ZkjnE/+
	gLCzNZyaDO38LLodQJAyygD39zY3CtfH36Xs+MkVyC/yTs+EiZ3XNT5yJIkv52u2ktzKW9ZPDAJ
	z7y9IjhKf3WeK+wuioEmxZcKr2N03anlDK1jVP871fxIrO9l4XUbJQygNCVnKvifMCGGrsxAB6L
	TPK8aub6/3Pwqpw6uEz2a02HbM6G5jMmMxd+a+/ecx/+qx+sZ4PKHquXIO65jfHZosBv4vRhEjB
	JkR6GoLX/ZPRM3fslItHpSrsvqWYEudlJxAizzD9lNNVMRqNE4fm66Q4TzWij3hQ==
X-Google-Smtp-Source: AGHT+IFGUTcorGykjnyxafmjxJwRXcwp+7UqaNbZgZ5ZtGZ4+MIvTAbGHFIfiyLgwMxAjhTe0yR1UA==
X-Received: by 2002:a17:903:2445:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a2f27365edmr265642305ad.30.1766836825413;
        Sat, 27 Dec 2025 04:00:25 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbcfsm231033165ad.50.2025.12.27.04.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:00:24 -0800 (PST)
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
Subject: [PATCH v1 0/4] rust: Add i8/i16 atomic try_cmpxchg helpers
Date: Sat, 27 Dec 2025 20:59:47 +0900
Message-ID: <20251227115951.1424458-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This series adds Rust helpers for atomic try_cmpxchg on i8/i16 with
full, acquire, release, and relaxed orderings in preparation for
supporting Rust-side cmpxchg on those types.

Rust atomic cmpxchg is implemented on top of the kernel C APIs,
try_cmpxchg.

On architectures that support Rust today, the kernel already provides
try_cmpxchg implementations that work for i8/i16, using
architecture-specific instructions.

Tested on QEMU (86_64, arm64, riscv, loongarch, and armv7).

Follow-up patches will add Rust users of these helpers.

Boqun, feel free to drop the ordering-related notes from each patch.

FUJITA Tomonori (4):
  rust: helpers: Add i8/i16 atomic try_cmpxchg helpers
  rust: helpers: Add i8/i16 atomic try_cmpxchg_acquire helpers
  rust: helpers: Add i8/i16 atomic try_cmpxchg_release helpers
  rust: helpers: Add i8/i16 atomic try_cmpxchg_relaxed helpers

 rust/helpers/atomic_ext.c | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)


base-commit: 30f5de001fb2ffacdb61e82c8626cae2d68b4d03
-- 
2.43.0

