Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B07284B37
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440558; cv=none; b=MqTLriWa3EZ6sTWqFUWzPmN+9pIxDQuk/NZclNOOHsuuqSKuvMVsrPzvg9PzJvqQFXULdsTsYr0qXCv0CG3dNDVp8z2/mTRFM7uxOBVqHK3ROGyIrTb3bQtKY0t8gU1hpLB4hBVHxFyy6Igtm/vTbeC+J80xaKvIQsgMrC2glPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440558; c=relaxed/simple;
	bh=z8vSwDiyBuH4tzUOiupCYNY/tZi7PjC0kRQc4aVjvic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0pXinIMhWqHoHhq6jlYun/b4G9Pri8LG8owz01fIoB1V49OYzrJBIB+fX9VpNAahUIilk4D/RYawLU88YexObGfY74njVuVXUgpvdKJtduCJ21r29DAL1LEws0OJ9Weo/ySs7PsusVEOpTLTIS1u0EMHq6z9ZOIW/K4doCVG4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUqbIWy3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUqbIWy3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso838979f8f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440555; x=1791045355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pryPTOD4LdiLlKyD0wq6thMQRx5prfhqZidoKen+48=;
        b=QUqbIWy3KG+J+BTI5VvbU+iLioymBJ/bwf3G8mPllDPCUQfuqAosok/upZILgjvCCh
         9pRlTX0XjfNM2hWtl0d+Y5+1VI5WaoEsEZPrbC8MN9TfB0gfvA2NEUt/MpwOvKFu60wG
         ilDH+Kl71zLQmYN5jbOJw6wiqzg75k/+PAtZ4bInFrnP1NrNe68hL5InYA/MwgZFQ6S9
         J0aWEYXne82AwYVk9s+6GWyrD8Pbf20syT9W3rmWpcIfE3jnB3WoRbbfXLU3FenDBHWX
         5j2/ObEQeRBjRIJ2EO1ZSvY2urifxNqaghykzJ6X0jTVXaEoDicQKm+jCx79Up+fYdDY
         7B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440555; x=1791045355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pryPTOD4LdiLlKyD0wq6thMQRx5prfhqZidoKen+48=;
        b=K8gz21x53I1qNiKcpatPYIU94UAzQfHvpgN1OtEQ+fXfE4kezzzDD+Y53ZPZHEC0+U
         A4Y0dx24yMy9dmsuVxhTt4AuNsbpourgzgn5zjRCsJ9b4yXAdD64XR3RLRVVyr/G+Ghz
         5xqFnCftFAwuaccQZmB6P4in5gdAo431IA4vGzfa0Y59MN+0C1KB9qLYKRQDPWYOT1cN
         DKhLM3sjBCgNYTlYvIbDkhQKhi3/kfsCCkxkKljwlH6Jm9pD8Bc+hieodnJ2Z+dHN00z
         zp+ZT59XvHMmXkphUuvUoBzexu7AOR09pdEt8zx4WiOdDzhfTH98TagJFx4xDZWtzSRK
         maFw==
X-Forwarded-Encrypted: i=1; AKwUvByT0TmpVhPaanzaad3Lftq/sBOUX8KEA1/EwzdQoAh1oJOS/5fLQyXeUgtgkcxiCBKmmSEaRMYyOihXZ9dj0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7r5mMDoHK5bHEfciimxFLwsPg8fp2FJc1V3tInWeN5THBLoMG
	ybMTIp9n53rT+tJJnsx5G8pDQeT4u2NF8BFAiBNfyf+yMpuC9Q7WWEtl
X-Gm-Gg: AYBFou0wCTsUKtK1oJmSp62eEQl4D2uZuppBj9nEDif5ovgv9lf5Fz0Ff/FISuuPz8K
	xs2KYZzDzLhnyopqtI9g8bLReswKHsn49kMwssEGnfAFqhHiZ0qUiFoON0cnULBHMZ/pen3XJQF
	P9nWcfai1dWbdReXPWyTQ5mNghG1S8mY5pyBidDao/kyCAou1LhxF7Vv1UnepzvPBGs0t7HGWgR
	GX0iw3VnhOVu550ebjx76F4Fh9um8R7QsdkwOYoIclMRCHDOOxV1ZcX2OR6JIP+O7ulTyjKI3Sf
	NlnJV8TUWMuFhQUwIWDs4C3T9NuA4zYO8s+A4AnshOIUODo8H9qDh5/b34jdzigIiSlRj0OwsSG
	1KXwRoAXE93YfYjlwyZ8XeZusLeSkTlk3be2eXuY6ymx+se2aJaaoANgkWX6beZQJX/ojuctIFF
	QyxUQwISdHV24Vs8IUTsviTZJ001B84btFT5czswhLS6/NlmzXNb25Dcsw4oWAemNSrQ3IWtQN9
	CL1JVNRkcRkHI8ZEXd/ZPE3Ao8w8oVRJ+uwNh7upnXbdx69GKEPiWueLPCvmyp0V10=
X-Received: by 2002:a05:6000:4023:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-488716f4185mr17421912f8f.34.1790440554835;
        Sat, 26 Sep 2026 09:35:54 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:35:54 -0700 (PDT)
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
Subject: [PATCH v2 0/5] rust: add DropGuard
Date: Sat, 26 Sep 2026 19:35:46 +0300
Message-ID: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Rust kernel DropGuard API and migrate the existing ScopeGuard
users in the block, serdev, and locking code.

DropGuard runs a FnOnce callback when dropped and provides dismiss() to
take ownership of the wrapped value without running the cleanup callback.

Changes since v1:
- Split the changes into separate patches for each affected module.
- Added a separate KUnit configuration patch.

The series was tested with:
- make LLVM=1 rustfmtcheck
- make LLVM=1 rustdoc
- make LLVM=1 -j$(nproc)
- git diff --check
- scripts/checkpatch.pl

Mohamed Osama (5):
  rust: add DropGuard KUnit test configuration
  rust: mem: add DropGuard
  rust: block: gen_disk: use DropGuard
  rust: serdev: use DropGuard
  rust: sync: lock: use DropGuard

 rust/kernel/Kconfig.test         |  10 +++
 rust/kernel/block/mq/gen_disk.rs |  11 +--
 rust/kernel/mem.rs               | 123 +++++++++++++++++++++++++++++++
 rust/kernel/serdev.rs            |  10 +--
 rust/kernel/sync/lock.rs         |   5 +-
 5 files changed, 146 insertions(+), 13 deletions(-)

-- 
2.43.0

