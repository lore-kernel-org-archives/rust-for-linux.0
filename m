Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA40E470458
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762271; cv=none; b=N2ca8GdC5F8DutWkj1Me2hvcNkQ3798p70ckdOGxGKmiXIPIZxkmStEJu70BZDm/zBR6fd8k/dropRsmieTh/A6xvvmKFp7PMB5XbapXfH2CCj9BtHQBae7SsWYijvJLCE3tVdr1W511GCZCxKG57YxoGqp0No4jwMBj+OhBVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762271; c=relaxed/simple;
	bh=8B2TFfI057wykZuicacH8tAGgEjX68YKbGd6fEx7mxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P8xg5Xe1zZ5t2XoHxg0HSxKsp28sQ/Zv+XOvh3ZVkwRU9Mzp18u7eDRzCsKBH4n+nZy9YTo3lACJ6dIyulxHyHWkLxeleVNT6HCA2cIMrVxlo8HnO+hdeJnpYFsFvoW9koRKnvAWq7Ky1UT2ovMasUQzwnKUxMHS2N06XLm5LX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=DAxDMLLL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="DAxDMLLL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso814840f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762245; x=1788367045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9qJ3fgTR4cimq6G1HyqzaxsMwSXV5Ik1jB7vizkJsw=;
        b=DAxDMLLL5tovdJj19wqq4lfhlKytPJRX6PxeDWd0z/eYLg997eFAonLYIFWNKhXLpz
         OrwKzbcjqfaiA0AE6Mcqku7+KAGMyRgqf2nihVNLUFLWBDPD7Gf2Q+sXQGVsElONSmMZ
         SMw7sR1eIX3WROAtOKeHAX5roKQaY3/aXknEbZOtoKpGkCfLmwM1VxMJF7dTeShPtWw2
         ydXUxfB45uily7wThpBLM/1aZ4ZLLHInA2vtqLLMADvnkuRmwnbL3rQaottHiG6vD4UA
         d2SqaOyYS7HsSZ5e7tbD4rJAyoOB0rjqvGk6Ruz53UkYnmD/eB2GQUAouRQQ+fkdCgtm
         n9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762245; x=1788367045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9qJ3fgTR4cimq6G1HyqzaxsMwSXV5Ik1jB7vizkJsw=;
        b=DVpIcWfmnUYzthRk33J8zDrq5+wNY5r0e6nyCkQPneoDnyDEOqJHtAbS+dAXVpwhHA
         0LjmGDbAsXsf4c+8IkuXNw2hVBeVCHLaR2Y6OiuCMz1jGTSgSfbhYI/4CmIeOcb6G2xw
         SRh9iKOXWTbDhxSJCZtzYPvAOZ1ioGBZEJzHiZUQif6qqVet8WtKs6rpK8DrDUFli7f5
         uvAQV3Gr0pZeBrKj1mwrFuRIQEKVLSqRbpS1HM4PzRc0bwcg4yvPsS46QUDA3NA3FEVe
         8dytGKh7v+1j8qARDOZEA/wzHqgyQWPHqRYOhAQeX+K8lJfcOeUEmSmETZb74GYfm8sN
         j/Eg==
X-Forwarded-Encrypted: i=1; AHgh+RqEj1t4YyYCx9ixq+h9LIy78ER2oamZcVnynW/aY0CIHucbw5ZUohqevAeR2sWkLSmcI79MXeXRCEtV572oeQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kC2Leu3opfCZt9dcO5T7PELOSZGdtO9OAim903qwaN9WC72HTi
	9tDkC8D5mjKzwir7NzufiGelTSZ5vtqBCsL1kixwHAzsCBoLk0St3xhl+YsA/10WIw==
X-Gm-Gg: AR+sD118w1P118E/a+DtpCJsdjEjx8X1wW7ZnDJxRnyELHsdpQk4Saw3NW4WjkoobUh
	HWIjPqfy+MFfQb86XGyDkwlFUEnXueqY3ubxorZLB9nMl9lrxarV1Nrqx6QKYQNebDncLnD2HQ7
	NFaEFAjLHd5mcIxekOLfItEUe8se8UrDULAU88trHZJSOVBWfddqrnG5LE6KkyU7PEuRsiS9QGr
	mB5QiTONRIiaKK1dMWTMCz79lLDGx+OP5ojs6r1s1eQE0zyPFFW8C1rOMyN++YvBlE/wqT9htha
	2I4OkLl5iytpDWi/4MN3pu2JajUmICN10vS2rPURtYmhbQvavMV6K6dtBEbu1GGOdAgp9t6X0JJ
	vo1xNcHTps+hpGOjtwNDoeIRAEAwvgOBvntyf4YfVblmoK3Anb2oNzG2VFVO1xSlFb0b6Ygb6zo
	Qjl4Mlueg5csNOGQIQ+2JDiR5Q9bUi+Cb2W1fxdbu6PXJKzkq5T3vq5wANiYU0d4y0zUDog8n35
	7LN7qQkOm2Qc8OvmnQqSZ5CwG6/1jyiv3SeQt5XqUZIXxrG
X-Received: by 2002:a5d:4cc9:0:b0:482:a9d7:7ced with SMTP id ffacd0b85a97d-482e26f2d68mr8304486f8f.14.1787762245027;
        Wed, 26 Aug 2026 09:37:25 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm3350111f8f.8.2026.08.26.09.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:37:23 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/1] rust: firmware: the firmware upload abstraction
Date: Wed, 26 Aug 2026 17:37:14 +0100
Message-ID: <20260826163716.6274-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

request_firmware() covers "pull an image from /lib/firmware".
firmware_upload_register() covers the other half: userspace hands the driver an
image to write. It publishes /sys/class/firmware/<name>/ with the loading and
data handshake plus status, error, remaining_size and cancel, and is what a
driver uses when an image has to be written on demand rather than only when a
newer one happens to be on disk

This adds an Upload trait mirroring struct fw_upload_ops, a Registration that
unregisters on drop, and an Error enum whose values are the fw_upload_err codes
userspace already reads back out of the error attribute

rust: firmware: add request_into_buf() reached drm-rust-next this cycle and is
not a duplicate of this: that is the pull direction, and upstream still has no
binding for the push one

The consumer is the DisplayLink driver at the end of the chain, which writes
dock firmware over DFU. This has not been posted before, so it goes out
unversioned even though that driver is on its third round

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, linux-crypto and rust-for-linux
  https://lore.kernel.org/r/20260826163004.3365-1-mike@fireburn.co.uk
  rust-usb, 5 patches, linux-usb and rust-for-linux
  https://lore.kernel.org/r/20260826163101.4168-1-mike@fireburn.co.uk
  rust-drm, 23 patches, dri-devel and rust-for-linux
  https://lore.kernel.org/r/20260826163359.4998-1-mike@fireburn.co.uk
  rust-firmware, 1 patch, this one
  drm-vino, 13 patches, to dri-devel, not sent yet

Vino is the user for all of them. The abstractions themselves are generic and
carry no knowledge of DisplayLink

The whole thing is one branch, base and prerequisites included, which is the
quickest way to read it:

  git clone -b vino-v3 https://github.com/FireBurn/linux
  cd linux
  make LLVM=1 rustavailable
  make LLVM=1 -j$(nproc)
  make LLVM=1 -j$(nproc) modules

CONFIG_RUST=y and CONFIG_DRM_VINO=m are the two to set; DRM_VINO selects the
rest of what it needs

It is the exact tree these patches were generated from, at 4c9ba407018e, the
drm-rust-next tip of 2026-08-06. drm-next has moved on since, and this follows
drm-rust-next deliberately: the KMS layer underneath this work lives only there,
and that tree picks up drm-next on its own schedule

Two commits on the branch are not in any of the series above, because they
enable no part of Vino: a scheduler call site that stops compiling under the
locking-guard series, and the Kms associated type Tyr needs once the KMS
registration trait requires one

It applies to the base above on its own, with no unmerged work under it, so it
can be taken without waiting for anything else here

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (1):
  rust: firmware: add the firmware upload abstraction

 1 file changed, 237 insertions(+), 0 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
