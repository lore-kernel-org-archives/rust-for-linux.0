Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602C0384CEE
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790505935; cv=none; b=IGcWRf7a9W4FqTBquwq77LnOsoFlPBhfEsVEGZabLWF7j8jpUrIDv0hilCZJx9GWSPO2qU/zz4IEv/l6EoPc9S7cfWtJV5bt9cdKapchWK09NRVftdDd+6TVAniOvFOthGjyw1q1NJIZA5AZHOuRUpRmPnt0ZJwxfPwLuuF6iPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790505935; c=relaxed/simple;
	bh=E51DzdcULzRpdMmr1jtr31t0PUWLCjXdu2/DDghqgsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IL6ds7vWOxZ5yQhszI9Ktfb9iYZBBw+XNtztBtamhk0lvK8uzOQgsQ9EWzTi/hx6HkwxuMwZWRHnMFUFTcMvO6pLeWW++GPbmnq5h/rGf/TSaLPcHNAtVIFGjttqNO9KzhIa4haUF+HfqvfWHKBUYdegmVM6Z6/2X+wSxMMo298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF732jaA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF732jaA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so16879085e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790505931; x=1791110731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfJP6yt1DXJx4cKd4gNx9tniZWIU3EM+Tzk+BM3HamA=;
        b=bF732jaALJFqlUdyPcCLlGUxstiCcmpPUlPHD4GBFB2i/K0BrjyIOP4DwoJQY/50wH
         GSZdjbbubmcOMxk/m2T7/JG3ctFKcNh0dh0T0MpBbml18a9Ro07IfZJqqDMb4CSWunCc
         bcqN4Nm283SNP3PhcQURgTTTU26BgFf75xJGAE49Ndw+nbZ3pBOOmdhyOnfRTXI3/O4H
         HrhoB/Rz9G0MWdu7hQ8IVQA2xahRVQDr4kVCZI0nXhVdbl8EcmDpCL91knjR8x3wzjcX
         3zyiI7xgu8sFsOSUA5KUCU2ZqLepJe2o+zBCVNGnSA0v9ghxDb/fcSJUy4f4cYkfThmJ
         YKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790505931; x=1791110731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfJP6yt1DXJx4cKd4gNx9tniZWIU3EM+Tzk+BM3HamA=;
        b=HwngP00Ux3sQBjX3+UGXLCezq842g4sdPil2BsadyaOrt/RTM7GOGDna3yx1efEoNC
         qLkjlcUcQ30AiiNj7Ru4mfjaYHsz7qSm7vlGDzCnMlAmtleLHBg7mRQK1/DEF2m921SP
         tTWq4AgONh7xP0gVxWEHugUkhWjR2celAFMsj+2To8zF/wqpxA7BzUPtmdJLoRCBy8tb
         LcYizbqLZi6pnHLN59UTyR3vmkyycIx5op/zKatj95hipnBuh5RzrWc0aneBIhzjjeu+
         3BZTjcUzcWQAl6JjB2IjqY7FPzGemqLgdjG8csRdLy0A7bA+GgwnAdT4JyvHCXISMkSg
         uhng==
X-Forwarded-Encrypted: i=1; AKwUvByEFmhh+WZGmsnn64+RMppxE3maNQ9mQmhDwI3aEWnpkjD5juUEggYAuIePT+LsMZjdDgFBvLdy+LrZLUzjOA==@vger.kernel.org
X-Gm-Message-State: AFuF++mm/3WGNu/2MrPsRDJECwbVPiAQkyKms2Vm5FcP38WokaER9kIH
	Jfy7xTgoXoQOVK2KSE661j5j3CIxUYd8hrIwa1JXsDtGGKU8q+76y0VM
X-Gm-Gg: AYBFou0Okh2F1GwqnROi5WmtmKTrLNH2BakisNMygT3GOuEFUIWOwKrX7d1J6a1/ZEE
	259LwR6CVomGarVAwcyhmh7c4fHlB586XIMu6AdyJKp2jWNkaQnxG4kXP3iNDyf9OH5Y6FX54nn
	12G6B6aY/C1TuMlVJuUxxMcBMs13C5Tc0Ru1fIxyHZjy8E+8+d4wR9npJCcNaS7IU137Qg1Rh+K
	6xCDHPZ800kfi0kIsu2U9oe5ZOEF4tiTCcwWQQF+wmOkpCqclt/cSPpIv82qAWBaxXcIqi2a53R
	LKkwXvCX5h0cJoDav7QWTklQGVZVUr/Ugqea8X28ZcRDGcaZ3SkDf5QPd8wm+9tnfB8W/PUx28+
	QghFNoDvuKs//rjDyuK1mftM18SLv020qfE/6nM4m8LbW+K/e6KBpTyEVhNrApJkbURRLqDA98w
	kWtt5MsVycw/P52pI8mTDgBqnpWJ6A5HtN8spZpKTNLaHfOpCez+XKKcDPUbcLg6UVlROVAs79T
	kk0KsaodKAixad2UKF/e9ORdidwM1rqcwPC+7FJpQRvt0vJ9kHHWrEptcrArvqvd1Q=
X-Received: by 2002:a05:600c:3ba5:b0:49f:fe79:62f9 with SMTP id 5b1f17b1804b1-49ffe796457mr53954805e9.25.1790505931369;
        Sun, 27 Sep 2026 03:45:31 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001915fc2sm46005195e9.14.2026.09.27.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:45:30 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
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
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] rust: introduce DropGuard
Date: Sun, 27 Sep 2026 13:45:24 +0300
Message-ID: <20260927104528.103881-1-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the Rust kernel DropGuard API and migrates existing
cleanup guards in the block, serdev, and locking code to use it.

DropGuard is vendored from the Rust standard library and re-exported
through kernel::mem.

Changes since v3:
- Vendor DropGuard in rust/kernel/std_vendor.rs and re-export it from
  kernel::mem, following Gary Guo's review.
- Remove the DropGuard KUnit tests and Kconfig option since the
  implementation is vendored from the standard library.
- Keep the existing ScopeGuard API unchanged.

Testing:
- make LLVM=1 rustfmtcheck
- make LLVM=1 -j$(nproc)

Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>

Mohamed Osama (4):
  rust: mem: add DropGuard
  rust: block: gen_disk: use DropGuard
  rust: serdev: use DropGuard
  rust: sync: lock: use DropGuard

 rust/kernel/block/mq/gen_disk.rs | 11 ++--
 rust/kernel/mem.rs               |  2 +
 rust/kernel/serdev.rs            | 10 ++--
 rust/kernel/std_vendor.rs        | 87 ++++++++++++++++++++++++++++++++
 rust/kernel/sync/lock.rs         |  5 +-
 5 files changed, 102 insertions(+), 13 deletions(-)

-- 
2.43.0

