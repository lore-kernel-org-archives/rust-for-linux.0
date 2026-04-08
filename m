Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E602C395247
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656844; cv=none; b=AqgTOKHLnma4eHsLapEoH6Zw0jccRLtvfWodwwSYby1kTc94uTJh9C5muCc3GORq49DDFilS6OsabKxiIgh4/OEQRfzqz+U6o8Nx8yx2Sbke4OL6L/gO6MPnsouvJsZLiOT6zcgchO47IWf3YKSgxMUyuzfskq8UboMJZ2d7z+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656844; c=relaxed/simple;
	bh=r652sSnwH2ZU7kpoja/rc5iCFl8wHAEjiyXayjlGerc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mVxFxPuQ3jZdgg2S+J3ERkUsICvaj/Y1OFLisA7gizuTqvWam9hrVvblWM89Tvnp2fTGXD/1U7Qk9hX4UlDcwCbxz2Rpx967mwTUwU0oSo6CIyIVBuwGQiCI7LIwJUV0NXzbGD05TO2aQRHtIftxByldmUyPD4LiJ3BLj/uN2+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=kpgBy20e; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="kpgBy20e"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b23f90f53aso55218085ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1775656842; x=1776261642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ok/+iY3+IvQIxI5ArkrEJvrXI2YUfkN2o45pU0fC2d4=;
        b=kpgBy20eB4iDFUcPBfFE4b1zdS5sbShY2SwEFhrzL3tSYmlXicfCBLM7+1bTbIq+BE
         K/jtnNjz/h6ETlI+5LUy7EDUdxREKWhiIVu9CRbRa/UfSik4PEqkYx43jNMosi0FiEyA
         /zMSV3oim+UXc2+p/z8mBbkI3ACpXfuyCuY74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656842; x=1776261642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok/+iY3+IvQIxI5ArkrEJvrXI2YUfkN2o45pU0fC2d4=;
        b=hsBPzAEToFgNUDruDgvuSILvtMBy/KcrrcjEZCZJ5uvQRUV4JI64ajKrPHbSA5DZtO
         rWnSr72z6uwQRfX+6K05Ex+Wlu3fJ+HI0f6vjxpRTY+6xJGJCSd1FcpTgbN2jZJjYqYv
         1DkBuSgDcdKp52dU4gFWkEDObCtsLTAacwJy84e3fiKoe4rPBjY91D7CaFXjI3T6nA/e
         BXKYmtbwXtcbTwDLrDmR/axOhmfPWm4dKPKaUf7jsSgGzsga55fcM3NWhAiHtu3wh43s
         TL7oPTTVnMawVr1Q+/EXJVx/OHTjQp07DLPYCaQAOh0uIqRQcYLvQMjl3n/Gsj1w2Xhb
         5Qnw==
X-Forwarded-Encrypted: i=1; AJvYcCWYh5z5RGes2ga1i26XVVi/NBebiAOr9wwXKVoDXt+Nw/LpNANzy6lheql2C1+x7JuU9OHB+QzLAWtFKNdvzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR4Jfb7V+yw77sUNN3CYH2D29If8fp4Vbh9ocmky3hoXhZJNg0
	/iFuiE1/UR97RZ57B7LOlWtJQ9tI87xa8v8XgteN6/zfoWnFay9WlxOVhrcNSyCxQlc=
X-Gm-Gg: AeBDiet5VPs5HzlgarsLs1FUQOdZ3aryjln4KlJb1rC1T2zfKogtN4YyfhHmlH0XeMR
	D1RK/twm0pSj6kXTZXTfxYDBEs1NRSg7+VfLRWqT5e5WjtdcLiygH04DAxzn0cKJ9dkmRx40Xo1
	8drKbUCrAmwBriRH3g4z3LaMtVaozhyCfb2QVUH0EadW9Fjqf10OdlBKYl+VYccWPyOzaUx2GU2
	N0YD4QpC/I9cKWdGCIuRvVs3FxlVkN9K4a1/aW9nh7f3couF9ELUqBPPLwlscBDFjfgLpahbzqB
	9iOeJAaKxKFDPj/aKtmSjFPAspWPYll648ZzndI7dgZDD/shBQ0T1QgNVlLIOlNYFRDvtR8E86a
	hd9YE9Co78WwuNPxuhd2VB/9en9ZkErhRCVwt3hGibk/4iUBd+eHrALO/2XUBmGxnnEpUAJOg+T
	62FLnhKYBJJeRjlY830p+OX/HnJlzOJweUMfJmVV76XfLXAYAg30oihGBgGlk=
X-Received: by 2002:a17:903:2c03:b0:2b2:ac6f:f87 with SMTP id d9443c01a7336-2b2ac6f1261mr96625335ad.44.1775656842107;
        Wed, 08 Apr 2026 07:00:42 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747612b7sm204465145ad.23.2026.04.08.07.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:00:41 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Rust io_uring command abstraction for miscdevice
Date: Wed,  8 Apr 2026 13:59:57 +0000
Message-ID: <20260408140007.8401-1-sidong.yang@furiosa.ai>
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
2. Zero-init pdu in io_uring_cmd_prep() to avoid UB from stale data.
3. Core io_uring Rust abstractions (IoUringCmd, QueuedIoUringCmd,
   IoUringSqe, UringCmdAction type-state pattern).
4. MiscDevice trait extension with uring_cmd callback.
5. Sample demonstrating async uring_cmd handling via workqueue.

The sample completes asynchronously using a workqueue rather than
`io_uring_cmd_complete_in_task()`.  The latter is primarily needed
when completion originates from IRQ/softirq context (e.g. NVMe),
whereas workqueue workers already run in process context and can
safely call `io_uring_cmd_done()` directly.  A Rust binding for
`complete_in_task` can be added in a follow-up series.

Copy-based `read_pdu()`/`write_pdu()` are kept instead of returning
`&T`/`&mut T` references because the PDU is a `[u8; 32]` byte array
whose alignment may not satisfy `T`'s requirements.

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

Sidong Yang (5):
  rust: bindings: add io_uring headers in bindings_helper.h
  io_uring/cmd: zero-init pdu in io_uring_cmd_prep() to avoid UB
  rust: io_uring: introduce rust abstraction for io-uring cmd
  rust: miscdevice: Add `uring_cmd` support
  samples: rust: Add `uring_cmd` example to `rust_misc_device`

 io_uring/uring_cmd.c             |   1 +
 rust/bindings/bindings_helper.h  |   2 +
 rust/helpers/helpers.c           |   1 +
 rust/helpers/io_uring.c          |   9 +
 rust/kernel/io_uring.rs          | 457 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs               |   1 +
 rust/kernel/miscdevice.rs        |  79 ++++++
 samples/rust/rust_misc_device.rs |  53 +++-
 8 files changed, 602 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/io_uring.c
 create mode 100644 rust/kernel/io_uring.rs

-- 
2.43.0

