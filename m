Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C863366DAC
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Feb 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770038510; cv=none; b=GGAZaUeHRGe9r5Zb2b5FjpXrgpUs59pakp5St1vPcBgl5UDp6M//eRB3xJU0r0XRE1Tvf5N/OPL/LjHe/i8jQOwI2wBWO1eICfCj4Z/kxBkzIJ+GDL2UJiHI+HkYLaB0ppbY6sOls7iYedYWKpvnwVSEDe7o7Dojf/mxYQFJq8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770038510; c=relaxed/simple;
	bh=FqXQYRZYmqIBixULrrVa+eEZKmy3PXhlCAE3r5OaLEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQDmp2onITboGxOQm+je6mLqUyCv2J2jGkLUTaXgaOfDea0RsJZvfadexKhmBck0skmXIvjGjz2rEcmuJcpT3sotGWVY0/qTVOFpSplrQDx9+ioJkNFk68akmkQbNSYARw0pGEDbhNIXmI1SAB3XJ4ptWOMUbdXs8V2TriwTMvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T30zEBDb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T30zEBDb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f30233d8aso28231375ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 05:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770038509; x=1770643309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HucOyefr0+DyglbTjyjmO2oyIxVd3mwUnC9ssIIiMtI=;
        b=T30zEBDbCp/amjBeUxmfuFp6GNx4nihecdA/y8tFdiiEHcn8XQorzw/7M7VjaobMf5
         Yy5586gkzq740Uwryzpqa3A/026YZc3ce0RJ4rCD5PXADXkLXJu6sUdT9TXj2s3uYc1/
         4M24b7ILEMVoa0TOV+WS3Mbu//cGtWrYEvE0kd6KyyfI1LcGVLCLrUc7Lmv62r/pMmR4
         L5dlGEkm5APXCi55CjQRCZKffdiLJlP3dsIavOfGQsxfc7FspI08/uRwPrhb7zA7qPSi
         KVkrwnHdeFIWkzOU0t3usVfiy/TxJ7TV098af7uPGOvyU1K8GILmTruiiB2CivN4+YJd
         KwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770038509; x=1770643309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HucOyefr0+DyglbTjyjmO2oyIxVd3mwUnC9ssIIiMtI=;
        b=U6nvk3bqNZhx1SMrD79UikzZe7C+bRorl+9Y0S23d6IYmdcCze5pRQT757+pr3a9wE
         6oNWjA7VFozC2i4LyQACo2lQHmszSB36o3dPcnp5LsaV6eyNq8OyBfVYG09os8dzmFmN
         A5Vyhvozw5dtIbf2Rzzhx5/ylF+wiB5Q3jAOcYUcEECC+Xx7DRR9CW1pM9SmGbIbbGrr
         Bg7QuntrJJwYki+qRBisoA4y9PgmcwbqSRJOehMCIOHn1mtQVOAlmHes/I75qM6ewhcx
         SrE+y8/UU2Ip3+xe1dAl8QPOlmj5+JWGOxr9jzaSIk1gX1R7WBv3+uy0LQA7j3nA0zK3
         uYVw==
X-Forwarded-Encrypted: i=1; AJvYcCUQAelYzqnHm7ORtmrrP1gHHBYkv5tgON/T97amTjEM5PZMBknJqSpl00FxNAut5PITCef+tFzKK8/kCJIwMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxutGxMW3Br/HtrHL5jb0v5nomT5VvrSFubqjl0X/1eDOYK/4GU
	4wj65X9BXyCb3L1PsQFSEpM2Bs22U9lW2nUgCP4P94P+0iCoDZDEg4ec
X-Gm-Gg: AZuq6aJ0DqxUi+M9bomRbj80FIKaEOOsRRBr2mVYoTlPbYANKqtv2AhA1BdSo3qc/Nz
	VI1A8ZMtd4ur/QevAbjGngGQsG1MIOx+XG4ESkhKzZp0ylihBwcZReBxOZuoqLgPyZX/nrW9NPs
	o8hXHWremuxDG26u037RalKXcvHzb1oRG2+04POE6ccLJcsMYQ7F2e+fTvk1NWDLvkkMYZCAnKH
	Dw58ciS/kaDOPeQfDT9EU27BEZtF2lQhFsUEIGFHXJh6N9k4KPcY5FR5pzpvfGj30QIUdluIboa
	imJTC+Wj8EjJ6i74YOpya57LsFopWQ8kUMWAQp1o2Dy2BPqBkeYto5RhquU1+Sdi89JAFzD7PBi
	uoIUYtlVc8dQAm1BngokGzs/c18M7gKaQ504nQhqNWOZLSEvfQxe2LloXXyzXevC9eoY9M+Z6Fg
	1bQ9nMSh1XQqgDwA==
X-Received: by 2002:a17:902:e801:b0:2a0:d59e:3c9e with SMTP id d9443c01a7336-2a8d80382dfmr121202625ad.33.1770038508821;
        Mon, 02 Feb 2026 05:21:48 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8c3a23e40sm119569895ad.90.2026.02.02.05.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:21:48 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: ojeda@kernel.org
Cc: boqun@google.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HeeSu Kim <mlksvender@gmail.com>
Subject: [PATCH] rust: Makefile: apply fixed-x18 workaround only on arm64
Date: Tue,  3 Feb 2026 07:21:44 +0900
Message-ID: <20260202222144.2689495-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `-Cunsafe-allow-abi-mismatch=fixed-x18` option is a workaround for
a rustdoc issue (rust-lang/rust#144521) where target modifiers were not
properly saved. This affects both rustdoc and doctests builds.

However, `fixed-x18` is an ARM64-specific ABI modifier related to the
x18 register reservation (used for Shadow Call Stack). Currently, this
workaround is applied unconditionally on all architectures, which is
incorrect and may cause issues on non-ARM64 builds.

Restrict the workaround to only apply when building for arm64
(SRCARCH=arm64).

Fixes: 68e8e79e1bdc ("rust: fix `rustdoc` target modifiers")
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5c0155b83..2bd547611 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -136,7 +136,8 @@ pin_init-flags := \
 
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
-rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
+# The `fixed-x18` modifier is ARM64-specific, so only apply it there.
+rustdoc_modifiers_workaround := $(if $(filter arm64,$(SRCARCH)),$(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18))
 
 # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
 doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
-- 
2.52.0

