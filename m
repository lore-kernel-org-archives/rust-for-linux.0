Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42763115BC
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244152; cv=none; b=meTF19k15ozN0xzopYkpYFGLNIDw2ord1Rrf8/i03KlMkgbYN1EjPD3z+qy/rNboxGCIuj2urjnU7zqBD7Wp8QZxf7q6W+Y3gtMgDkXRChQShjmSN7lDjxmj70KZVUBfueuXhOzq5ZAGNOwT5Lds79Cien0Lw0mSa6xZmHIkSic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244152; c=relaxed/simple;
	bh=4/Cmd5DWvW/xOqkRrHMWmFSn6gxUEPa5rFXuJZw2bfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3pyHBfdp2+WMTpmSJObrg8SXWkTiNCrSYkCfJN5wE+/4tkwDGZiHkTrzVpjb1dpcQvvQB/1IkFymKPG/Uk4pqs7cl05YmuOBNoTr88Ctx1IGXB1MCpKduQegoDXlw1XswOruvtS8xDAu8PdecSWjRIGTNZF4NQLL21cmQviwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=E/xVt26T; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="E/xVt26T"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82c70e4654eso2814589b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1776244150; x=1776848950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUTDp5+Z1gK0rhP4BsT0z2CnEhQfWS+xsZHo8398kwo=;
        b=E/xVt26T9wz4qlxLGppWOIBmd/qPSM2fNFvjR95wGycgftfYNnrQPb3hD99Mk2m9Tj
         LtWeIOle6nhWrZj1mdK6tILA/CUXUUssAc7vWMFX/vfT12vPilxPg1fyKjT6BNMtIkjM
         w4Jmj+/TtSADkvm6hXRcrH9fcayuEl4tFMs+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244150; x=1776848950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUTDp5+Z1gK0rhP4BsT0z2CnEhQfWS+xsZHo8398kwo=;
        b=gPsGi35/S3aWNP5wzJZlvIztEm4Dji7qQbIM4XLm1g7A7Niy/89KvYd+n/ZXStRysb
         icS0KgOQCnZIEoQH5Sz+hA7a1Q4jOUgO19QP69JvO5ofFDw5nMbgMgXxFTUOlIGjGL+H
         zI4OrQLjivXEP1y432cyWCSoUq5LKp/gRoquoMY8JleSeMz8OgGdwLonFCSF2F1kXwgo
         91CAmy9kGakhGu2PA2vf/nKk0VMmlR9lSJF7jb17gb5TSm+1jDenmKbbv46JrQ5pyRYc
         cPPNxnYi2g3KAahC4RHPBMHP3WFU2qDdr7kgmMOCfkXBOhm2pWuJcIhRFsTH1gdvDERq
         cWNA==
X-Forwarded-Encrypted: i=1; AFNElJ+5m0gqudyeshepDLi/wakIeACIflVecSOC7VotT3Uvn94eQq6/CDMJvuMkx/hNzWQHJ+zu2jCVEtRZuycMxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8J+OqdpH9Z6UqFQOncX+XikgsFum6icyng1Kmo0cbl6QbFATA
	WGR+eWHl2BeYLL2BSogpOnaESD9pIcNiMWH/9rgDT3N+Ly/0NAVJVQrPSTZETQcVQN4=
X-Gm-Gg: AeBDies4xv/vgUW/otGkbqejhjbnaJPcDckJOETA35oXIrxVri1U1DNMApXSFivHx42
	Wp81y1i8caHWNHacVVlh7i9DvCBaUNRW/IullIKVTzYKPT2KbLBc+MJKMmQBjWBIa/e4CZGJLkT
	9ArL01P3GpHX3tmhjxwQm12lFlORjkrcQofXzSveMuQ2AIfCuhnkFFvZMPsyMCVfRjM2HKc33wg
	VpRKxtAeEm89t1DhouxX/IYwt/i8SLFqFiUdNomEFOLbIOTZQNiExV8C7DhBq9FabVenwIcX/lK
	T2MZGrcMOCg5OWTLNH7DRRoGm8ymlo5B/5kLnzAIeztZDQT1GySm4JMZY3uVWchBxkWAFO1DHHy
	POC4tLyx1WJmxBSSuNWdOSGBouLESpaif5TylRNhjXtN4/MLMfuZlBwrQJDFexiiBT4U2UkECoq
	fNoXYXvEnyAVldE08T5HcgoZec4AecApodnCHK2ei+usnSYscGCGfKAsU9jHo=
X-Received: by 2002:a05:6a20:7486:b0:39c:c07:144a with SMTP id adf61e73a8af0-39fe3f8aad4mr23349665637.36.1776244150289;
        Wed, 15 Apr 2026 02:09:10 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1074619a12.1.2026.04.15.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:09:09 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 0/4] Rust io_uring command abstraction for miscdevice
Date: Wed, 15 Apr 2026 09:02:11 +0000
Message-ID: <20260415090851.4897-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces Rust abstractions for io_uring commands
(`IORING_OP_URING_CMD`) and wires them up to the miscdevice framework,
allowing Rust drivers to handle io_uring passthrough commands.

The series is structured as follows:

1. Add io_uring C headers to Rust bindings.
2. Core io_uring Rust abstractions (IoUringCmd, QueuedIoUringCmd,
   IoUringSqe, UringCmdAction type-state pattern, IoUringTaskWork trait).
3. MiscDevice trait extension with uring_cmd callback.
4. Sample demonstrating async uring_cmd handling via workqueue.

The sample completes asynchronously using a workqueue combined with
`complete_in_task()`, which schedules task_work in the submitter's task
context before calling `io_uring_cmd_done()`.  This two-step approach
ensures that completion always runs in the correct context regardless
of where the driver decides to finish the operation.

Copy-based `read_pdu()`/`write_pdu()` are kept instead of returning
`&T`/`&mut T` references because the PDU is a `[u8; 32]` byte array
whose alignment may not satisfy `T`'s requirements.

Changes since v4:
- Dropped patch 2/5 (C-side zero-init of PDU in io_uring_cmd_prep);
  zero-initialisation is handled in the Rust miscdevice vtable wrapper
  instead. (Greg)
- Placed io_uring headers in alphabetical order in
  bindings_helper.h. (Miguel)
- Used `.cast()` / `core::ptr::from_ref()` instead of `as` pointer
  casts throughout. (Daniel)
- Fixed workqueue completion bug: calling `io_uring_cmd_done()` directly
  from a workqueue is unsafe because the worker does not hold uring_lock.
  Added `complete_in_task()` / `IoUringTaskWork` trait so drivers
  schedule task_work first, then call `done()` with the correct
  `TASK_WORK_ISSUE_FLAGS` from the submitter's context.
- Removed `issue_flags` forwarding from sample; the workqueue now calls
  `complete_in_task()` instead of `done()` directly.
- Improved all commit messages.

Changes since v3:
- read_pdu(): replaced MaybeUninit + copy_nonoverlapping(c_void) with
  read_unaligned (Caleb, Benno).
- write_pdu(): fixed c_void cast to u8 in copy_nonoverlapping (Benno).
- IoUringSqe::opcode(): use read_volatile for SQE field access (Caleb).
- IoUringSqe::cmd_data(): removed unnecessary runtime opcode check;
  safety is guaranteed by construction since IoUringSqe can only be
  obtained from IoUringCmd::sqe() inside a uring_cmd callback (Caleb).
- Removed unused mut in sample WorkItem::run() (compiler warning).

Changes since v2:
- Adopted type-state pattern for IoUringCmd (IoUringCmd -> QueuedIoUringCmd)
  to enforce correct completion flow at compile time.
- UringCmdAction enum with Complete/Queued variants prevents returning
  Queued without holding a QueuedIoUringCmd handle.
- Fixed error code handling (use proper kernel error types).
- Suppressed unused result warning with `let _ = ...enqueue(work)`.

Sidong Yang (4):
  rust: bindings: add io_uring headers in bindings_helper.h
  rust: io_uring: introduce rust abstraction for io-uring cmd
  rust: miscdevice: Add `uring_cmd` support
  samples: rust: Add `uring_cmd` example to `rust_misc_device`

 rust/bindings/bindings_helper.h  |   2 +
 rust/helpers/helpers.c           |   1 +
 rust/helpers/io_uring.c          |  15 +
 rust/kernel/io_uring.rs          | 522 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   1 +
 rust/kernel/miscdevice.rs        |  81 +++++
 samples/rust/rust_misc_device.rs |  62 +++-
 7 files changed, 683 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/io_uring.c
 create mode 100644 rust/kernel/io_uring.rs

--
2.43.0

