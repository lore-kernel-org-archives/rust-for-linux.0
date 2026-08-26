Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57C342538
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761874; cv=none; b=VLqEhGXdyvmNLTBIpG78rtGJBrF/98Wbl5KGppvN5XYme71/WCDvM7GfZEZV6Slroz21xVL/t5EHuLyRfGmyprucL/U7lv/BodaQ2KvxVlpcsPoCnvDqqSDs0AKpXwpE2bpizM6XmO9fUdv7CMrgyfgrhEP8j7krJPg7eU8UNQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761874; c=relaxed/simple;
	bh=js22L9kkegNeyF2N6EUzZPmTxGqw6C/kJ930hsuHuFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbIu5XsY27uhNKM/iCvXezZ8VgSiu65IL0WEl6fNsnM3XklFWiO/UgCqUn5GyOOB5FU4K4DwG5f0wn4IN83WVfL0O+KKxlHAjhx82qEdTL5BVhQIWsYDYucDBEI+Drm/Dp9utM14rni2vnCmoYTUvbqIrD2gxTtxOtlOfRiTA0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=BwfrhT+0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="BwfrhT+0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495437bb891so301505e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761871; x=1788366671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1p4Ix1lIWqwmdxGTuB/bpTq19/XoCgreFlH2DPS6K4=;
        b=BwfrhT+0k3ds5CnU0txQ9qEHl3LGOUuao5dlAUjr2G4WsIlXiPRPsbqaJ8ATQ/+6kx
         Sb3DbLVYRpnlniDYr3VvoDJx9V+zC1QqzRqrppkRREdI6XiVhLfK+Mrxx8IrKnj8mIy4
         CzsJULSA9l0i4l3KS4W91XY0+ULaowstLwJvAMklD8HBknv+CzXVZBnhBuPG/CvNA5MC
         NtkTE7vgW0++s7Np7vXK5vEaWhuvazHqgohsgz0gbr5Mq8me0DtlYCNoBRNRa4vDVQT7
         9llD8JOPLNEeV9FyHhxt4BolSBuhj91T8UoPZqVJ9mFzZBloUkixSh85dHNfr1QNfby1
         LfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761871; x=1788366671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1p4Ix1lIWqwmdxGTuB/bpTq19/XoCgreFlH2DPS6K4=;
        b=r5eQIKx10Ap1QGRVHexeLZ+OXtwwrvXSRd7noElO/B0zhb4KY4w3bcSY3t1hliraEw
         YGTa2pRGna4pwMiJZGo46JNtzqbhsF4RX8Pt2mI8Q1769FAL3FFA6ShqstotPqkXUibr
         WoyKHorrAd83vKl4HvO1PlYuGtbGf3rhp2ZdoAj3N0y71OWdAzH/MEGv30qcZ9lQxLua
         I8V0dRwvmVdagHGgb66TFYXOzzOj58fs315zLCa/VEQdVRqJJeGCTwKhegoYXPRJw25d
         pEh30xuQgn7jDfDr8xQ4BA9onvyga7NjVSSvfA7fYGupfDnSXd2THGW4Pk9pzFs3U36G
         pjDw==
X-Forwarded-Encrypted: i=1; AHgh+RqdfpJYvGCf8CdHoq8sBpKWqL0MG1me7FE5tMokWrJpBFsqTTYyscfVMjt4V0O/y2+60Zga+HA7Qq8u/LkMBw==@vger.kernel.org
X-Gm-Message-State: AFuF++nmfVlbK+Q2Bz+tw3fn8mApvTve/WFMMoqZWvnX1jq2LuNtoPkA
	Amg7lj4Zj4505DVtdZtUHr3rbEU8Yq9lKF+rGH73SbNSmrKEfdlpYePadRJD3qK7kw==
X-Gm-Gg: AR+sD11Dp06H48amFOCFEpvU0cyzQTznv2FFZ+gZQ56NeUpH9kRLGJY2io3Gfq1mFHv
	z8o7CIaFwBJ5BH8Ax+fLqMNEsN31vVeX2KBS8uzZQs3kvthXcF9+9dtKXNBN9RRHVxiKJp7Fhlq
	hPltZxfRoB/Bi30jlG4jGUIuXZ1BEK4BmTbDLmiJAiRgDlZ7mzcnRLUQRJxZWX0lacxHx812BpJ
	1XeR6oKM/0kbRuiFD4wQNmeqQl4SOVfzamf9NCV8W+4bUUFLgdvj6cmOBi2umIatqsrfXCp1o8+
	+9+6DiGry4Z7ATEwpOog+hIZ5Po+EVZz8qAW0vjjyvdhs17JcoWfQ4jx+SFWihPm1PlSNU6/ucF
	CLNhMEI8bXcBd5xyZe47tw84DuXeus+liBncieswpMSH1GGZj43RmN/66TaLoFlK1n4F/iyIXh3
	gSRCR368LBM/8gxj4ZVQAJtTA5sN2nmuBV1YkvBQDNk/zWOFNGWfcsdll8Qdt6YPkkbK/iF66wU
	o/g9Uad0FJMj88cofx2kb973gMcBzGuTM5i
X-Received: by 2002:a05:600c:3151:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-49b0deb14d0mr4628125e9.3.1787761870622;
        Wed, 26 Aug 2026 09:31:10 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:09 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
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
Subject: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Wed, 26 Aug 2026 17:30:36 +0100
Message-ID: <20260826163101.4168-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Host-side USB abstractions for a driver whose device is a bulk-endpoint pipe
rather than a class device

  Revocable typed interface I/O, so an interface cannot be used after the core
    has taken it back
  Reusable URBs and persistent bulk queues, which is what keeps a video stream
    in flight without allocating per transfer
  The device descriptor fields a driver needs to identify hardware before it
    decides to drive it, and a queue-readiness check
  A device id constructor matching on vendor together with interface class,
    subclass and protocol, for a composite device whose function is not
    identified by the product id alone
  Letting a driver keep its interface usable while unbinding, so teardown can
    still talk to the device it is releasing

Changes since v2:

  v2 10/11, "keep usb::Device private and gate ...", is dropped entirely.
    Oliver Neukum was right that it was conceptually wrong: USB does device
    level operations, and hiding that behind an interface is a layering
    violation. Device stays public
  as_bound() is gone from both the binding and the driver. Danilo Krummrich's
    point stands: needing an unsafe as_bound() means the design or the
    infrastructure is wrong, not that the escape hatch is needed
  reset_configuration() is gone, and set_interface() now exists in two
    correctly scoped forms, one on Interface<Bound> taking an altsetting and
    one on Device taking interface plus altsetting
  What replaces the concealment is lifecycle gating: an adapter-owned,
    revocable I/O window that is valid across probe, suspend, reset, resume and
    disconnect and invalid outside them. That is the interval in which I/O is
    legal, which is narrower than "the interface is bound"
  There is no private URB implementation. Colin Braun's URB RFC is carried
    unchanged as the foundation and this builds on it
  A topology walk and a device-removal notifier were written after v2 and are
    not here. They existed for a second consumer that is not part of this
    posting, so nothing in what is sent would call them

Alan Stern's lifecycle point is what makes device access from an interface
sound, and is worth restating because the whole shape depends on it: an
unconfigured device has no interfaces, so an interface that exists implies a
configured device

v2: https://lore.kernel.org/r/20260703030020.2694-1-mike@fireburn.co.uk

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, linux-crypto and rust-for-linux
  https://lore.kernel.org/r/20260826163004.3365-1-mike@fireburn.co.uk
  rust-usb, 5 patches, this one
  rust-drm, 23 patches, to dri-devel and rust-for-linux, not sent yet
  rust-firmware, 1 patch, to linux-kernel and rust-for-linux, not sent yet
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

It applies to the base above plus this, and nothing else:

  Colin Braun, rust: usb: add usb request block abstractions
  https://lore.kernel.org/r/20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (5):
  rust: usb: add revocable typed interface I/O
  rust: usb: add reusable URBs and persistent bulk queues
  rust: usb: expose device descriptor fields and queue readiness
  rust: usb: add a vendor-and-interface-info device id constructor
  rust: usb: let a driver keep its interface usable while unbinding

 3 files changed, 1553 insertions(+), 26 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
prerequisite-message-id: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
