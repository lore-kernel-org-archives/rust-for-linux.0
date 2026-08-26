Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483C3AB27F
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761744; cv=none; b=COyGcpiuuZ00GuXrq8nhsyc/qc5yuduae9PHIIweMGVT9XzUuBu1MbyowZDu6J6y2YTnX98mxnTabiagUP8hdLh0aeBe0yHgt5ZHkxobQuRIdUpxTyL5qtpgKWuYdR+8l4HFJG5bSGm7S5RNiCvMWS7qkWdBwRwm9tVXwIYgjRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761744; c=relaxed/simple;
	bh=ArTrpRRy1Jj6m7cEYvnr2wlDFxncs2BPtRXDvhuQqkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=reWQpwBhsOWwJg2TKDsHXHoWzoeqw3Tnl8UuioxFAGM3mG+LYDuK+QHZ1PxVXuXJXUPliJx1MPh2p5KGxFr4cY0Zmr+JzYWIoLeXOd+X9KmKeOeSpkVUelr3racSeCdw3ujwqSMVysthEgH+rv0//mupCMrfps07g7iMF+gjMKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=BbdbQAKZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="BbdbQAKZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so8665355e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761740; x=1788366540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmMPed7R6Cs7sHpgzIBI1b+r7mX9EAuKIVs5oZFmXYo=;
        b=BbdbQAKZS7ihAvrF5vg8qLLd3h5fkaFcojbJAjUsR0NZmdmmKqIbI/nlEfoIKIvRwv
         r+tX9qC0jZycSyp9WjrSNkuHB1fiJOKmyDwFQ8JPZg/Ivz+y3l4P0S7u9lCFGUQvxRhZ
         PEK/Oq9fWgFBkPtwhWfnJYdWHs0N3hkgQTZgm82DFITCdoLUVkf7coRu2KeMVInOzC+h
         d89HEFrkOL6fxAS1AAtLmEJBSMEYIhZz/AES2eTas9tnKOT7eHNUQG5ox4CURX0DH2JR
         +LeNwnfJbFpNs6b5374iq1OtkBD1AujzuX0Lk7gXPS/gEY+FdU6idBtEfrp+63lvmsob
         V9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761740; x=1788366540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmMPed7R6Cs7sHpgzIBI1b+r7mX9EAuKIVs5oZFmXYo=;
        b=bj3jWxUGBF9qj4Xk1oDh03MkgVAjqG1hsOhfB/wALtoN/wunBt9Mmh2mcbJObQ4mY0
         7hFQufD1G5KVnY2qqLzby8qtfSeSayZ6wFxNbCFOnSu090PiO+ulUYdIaLRgJTTi8LM6
         wbj4bPpWl+UpeaQkVdnSnekoGzJQIiHB0gv8wbqQ1Q9mdaUKrSz+I/AOAQGSACPVGMT3
         QPmLINGZfGDKbOzcFxqGvH+8YPnjGPNWziAClLZHv8Q3NneXHExbfDVCmD/EEMKcPZyj
         3+Pv9yykc/qGd+vRQog9vtE8Z8YILRl6ig6V85X3MiKBaBOjuwn1beAYS8Bk/VWkFhtF
         ABog==
X-Gm-Message-State: AFuF++nGHyCGajJcrJ+GYTbDyt/sDqZbumX5nKsyyfrll5InY4DJUIaV
	FDilstTDG2bdqMh99Jl7P4q4bJbOlcxBqPujOQqdtyzH+EdWtixl3u31i0bcSHoNqHXsS7yRcQ6
	Tfohfq028
X-Gm-Gg: AR+sD11/qLpNv+sDYJgZFhZgIJuvEw+pPexL/qJcfGFE+g4klO2MAT2tUgQ+vEfBxx3
	uQS82t+T0vTNpLy3Y8L9QIO+6OK45h5x3SZ3bTHqc+klJbntJUEIac057ohW/qThGBEYC9CbVX4
	295YqnT+7e2hbKc8SsgEacTP8U4F7VXlQKv0uskNVfkCMlBevtV0RUqoJGytgr+bon8vIBCN3kK
	HVyZGnfY/22WoCKxLQhA1MCVrOpVrE4qIuogXXxwXGczyX7QwiFZSt5pwLZamx/wOrl8ZjuHb8D
	L5uhuAVcmNsHzGcDsZgSL/nZMT3KPLLjjFO9C97oEqD0HZWzaAlhBYPyvnnjcyA87iMjjkqczd0
	hvAkgBVdWXI1Ucrd15I5puLHuB3CVu4k+gNhU90QYTAOAXlBc5u11LlG0WVaTdh13YWTM0XW8FG
	W+a/zPEs6ch55ojWpe0IN7OhNg/7RJCuPIhXOnVMrdyZ7xM7ZHZFela1PsLsHd+q2hR+ZDX2C3I
	24zIcbccPqv5iXg0NYnfey6J+upYqTeOh5JOQ==
X-Received: by 2002:a05:600c:3e83:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-499dc823a01mr79538685e9.14.1787761740102;
        Wed, 26 Aug 2026 09:29:00 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:28:58 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
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
	llvm@lists.linux.dev
Subject: [PATCH 0/9] rust: core abstractions for a USB display driver
Date: Wed, 26 Aug 2026 17:28:34 +0100
Message-ID: <20260826162851.2497-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Core Rust abstractions a USB display driver needs. They are separated from the
driver because none of them are display specific: each one covers a kernel
facility that has C callers today and no Rust binding

  sync: single-shot and timed completions
  hrtimer: restart an ArcHrTimerHandle, and read the interrupt state inside a
    hard callback
  random, xxhash, time: safe wrappers over get_random_bytes(), xxh64() and
    ktime_get_real_seconds()
  workqueue: make OwnedQueue thread safe
  io: offset copy helpers that check the bounds they are given
  error: expose EPROTO

None of these nine has been posted before, so this goes out unversioned even
though the drivers it feeds are on their third round. A runtime platform-device
creator and a root-device attribute group went out inside the rust: drm v2
series, where they did not belong, and they are not here either, because the
consumer that needed them is not part of this posting

It is small on purpose. Every patch has a caller in the driver at the end of the
chain, and nothing is here on the argument that it might be useful to somebody
later

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, this one
  rust-crypto, 2 patches, to linux-crypto and rust-for-linux, not sent yet
  rust-usb, 5 patches, to linux-usb and rust-for-linux, not sent yet
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

  Alice Ryhl, Creation of workqueues in Rust, plus Onur Ozkan's cancel_sync
  https://lore.kernel.org/r/20260312-create-workqueue-v4-0-ea39c351c38f@google.com

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

Danilo Krummrich's OwnedQueue, ScopedQueue and ScopedWork series supersedes part
of the workqueue work carried here, and is the better answer: Vino calls
Work::cancel_sync() in seven places to make teardown wait for its own work
items, and ScopedWork cancels on drop, which is that idiom done properly

  https://lore.kernel.org/r/20260807165252.3849875-1-dakr@kernel.org

It was still moving when this was cut, so this uses what is available today.
When it lands the swap goes in as one commit moving the prerequisites and the
call sites together, since either half alone leaves the tree not building

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (9):
  rust: sync: completion: add single-shot and timed operations
  rust: hrtimer: add ArcHrTimerHandle::restart
  rust: random: add a safe get_random_bytes wrapper
  rust: xxhash: add a safe xxh64 wrapper
  rust: workqueue: make OwnedQueue thread-safe
  rust: io: add checked offset copy helpers
  rust: hrtimer: expose interrupt state in hard callbacks
  rust: error: expose EPROTO
  rust: time: add ktime_get_real_seconds

 11 files changed, 243 insertions(+), 2 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
prerequisite-message-id: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
