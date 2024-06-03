Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E5E13D26C
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717442118; cv=none; b=Ju2GwQ5NojcSZ5SaKUhoPdRTJ2BvBYnByzR3c7SddbNqRst+GBe7zFejeBpcVj9tPv8kUuk8sIZ0quuY0OLGCOwMadrfGoRGgh7UM+VItgiszD9KImLxOujzBsA8z999I+AUsf+GY/dFongWQ0BFNq2yWGT/bIuLIIBcGNoa2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717442118; c=relaxed/simple;
	bh=u3t0ocUfsdb3hvZ3j1iQpvNqlGBmE9PoE/Vra50k+lM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r99vd965BzrJPUcBMxxIbRa/NfWM6nU+wivc/f6rbk4GWN0cMoq7S8o41DTWOXd4IbexIp9A++PDYW/FwtZGM4TWjZkjEcnPaRNHzrT29uPfMacQtCf1k7Sem2Z5oOZtBxByAoNNJ05SJ2MnmKbg7PGagzny8j3KiPN2evM98hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=hDlmctC0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="hDlmctC0"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a68e7538cfaso237690466b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jun 2024 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1717442115; x=1718046915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3gYSeR22FHk/H63N5QKIzZFhN7radWE7HTLdWSrTW4=;
        b=hDlmctC0QQgNQQqIpppS/6l+ka0eMmKm5ZpnmXIpYEr2YTmY+9ug3jMw2demcoAe5N
         jh73dUfD61yL1VJumFFXNOXZVoCEov3fc7bj31JkgtNo64MQ+YXnGXmTwuEmwAEN2K0U
         1r0438FkyVVQxpa9EN6LBFZzyG+w4HRWLVcUwMaFyQgpBUK0PHOxwgBOpGE6pqduyTJ2
         CFz0OlkffTpOjuFSLJ6cgmqEXkeWBljS6sBGt7zT1GHdt6XPheVRAFkpA/yb0UT4fO/r
         euX5CC6c3yp5o4TUbqHf3kn2JOIFCwwzB7V6wQUhHdtfgQgIiT2n9t5iOwaTpws4aumC
         S4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717442115; x=1718046915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3gYSeR22FHk/H63N5QKIzZFhN7radWE7HTLdWSrTW4=;
        b=Bb0rapCc8YuZlJ9Jg0+qABEzt2m9Ou55+4fY1TrLwOLWjy4NftRJhNNPfZqgviF3dz
         RMgQc3qvEHcFVAN2GVU+4bQOUGsfD6lG/6vzIH4FjZQLdRHK+FyuKQltx5sEvbIY/40W
         tZ+1fdJAcj+IwkgENle8Me4bdLvhxLnpxJk+cGqIfhQmodtgVtO+RpY0LpO42ZVtBv3T
         03xEsWDSNRgpcfbQ6WO+dsF9wz8E6+tcBDU4lh4T6W7bxItAGlw33pr7nTsmLcgSggZA
         31PMH+YEijUHFQv9nMU2PpUzOJjL2KiStCGJVKPD4M+Ku7JvEpJrIgV/RjCuTKH4KrSk
         K5rA==
X-Forwarded-Encrypted: i=1; AJvYcCVQwbBdGXusn+aRBsKJgRkz/LXC7qzrRA9fNMz5EHtkjwpJRwB4fQxw5I/49oIxc20J2hkp3QgkyR8awk750xeId0UD8EXIU0a7dHjtrn0=
X-Gm-Message-State: AOJu0YyFs03JLJcdHtqbpZXQWImjtQSERkFcCbrPQi1q5iBm1i2m9TI4
	jRf9COl5v5Vc9eCleoSK6i3B17q6mTL+2k0q4+KZrpYYZR5bIqAjrUfbv90BhZs=
X-Google-Smtp-Source: AGHT+IHtgHIBlj0zS7xLzxbXE82m/ijZzbggdzdL/HGAffnhu1YIh6Q7lAgz14EYizsTYU1kolggXw==
X-Received: by 2002:a17:906:ca57:b0:a68:a117:2635 with SMTP id a640c23a62f3a-a68a117287fmr493697166b.22.1717442115351;
        Mon, 03 Jun 2024 12:15:15 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68c38b3803sm362409466b.112.2024.06.03.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 12:15:15 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Hannes Reinecke <hare@suse.de>,
	Ming Lei <ming.lei@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Cc: Andreas Hindborg <a.hindborg@samsung.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Chaitanya Kulkarni <chaitanyak@nvidia.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yexuan Yang <1182282462@bupt.edu.cn>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	Joel Granados <j.granados@samsung.com>,
	"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Niklas Cassel <Niklas.Cassel@wdc.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Conor Dooley <conor@kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	=?UTF-8?q?Matias=20Bj=C3=B8rling?= <m@bjorling.me>,
	open list <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>,
	"gost.dev@samsung.com" <gost.dev@samsung.com>
Subject: [PATCH v5 0/3] Rust block device driver API and null block driver
Date: Mon,  3 Jun 2024 21:14:52 +0200
Message-ID: <20240603191455.968301-1-nmi@metaspace.dk>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Hindborg <a.hindborg@samsung.com>

Hi!

Here is the fifth iteration!. This revision includes a check to validate the
block size in the abstractions rather than in the driver. Also, the `GenDisk`
type state was changed to a builder pattern.

V4 is here [1].

Changes from v4:

 - validate block size in abstractions instead of in driver code
 - refactor `GenDisk` to builder pattern instead of type state
 - refactor `Request::try_end` and `Request::end_ok` methods`
 - fix formatting errors
 - fix and clarify a number of safety comments
 - fix typos in documentation

Thanks to all those who had spare cycles to suggest improvements!

Best regards,
Andreas Hindborg


Link: https://lore.kernel.org/all/20240601134005.621714-1-nmi@metaspace.dk/ [1]


Andreas Hindborg (3):
  rust: block: introduce `kernel::block::mq` module
  rust: block: add rnull, Rust null_blk implementation
  MAINTAINERS: add entry for Rust block device driver API

 MAINTAINERS                        |  14 ++
 drivers/block/Kconfig              |   9 ++
 drivers/block/Makefile             |   3 +
 drivers/block/rnull.rs             |  73 +++++++++
 rust/bindings/bindings_helper.h    |   3 +
 rust/helpers.c                     |  16 ++
 rust/kernel/block.rs               |   5 +
 rust/kernel/block/mq.rs            |  98 +++++++++++
 rust/kernel/block/mq/gen_disk.rs   | 215 ++++++++++++++++++++++++
 rust/kernel/block/mq/operations.rs | 237 +++++++++++++++++++++++++++
 rust/kernel/block/mq/raw_writer.rs |  55 +++++++
 rust/kernel/block/mq/request.rs    | 252 +++++++++++++++++++++++++++++
 rust/kernel/block/mq/tag_set.rs    |  85 ++++++++++
 rust/kernel/error.rs               |   6 +
 rust/kernel/lib.rs                 |   2 +
 15 files changed, 1073 insertions(+)
 create mode 100644 drivers/block/rnull.rs
 create mode 100644 rust/kernel/block.rs
 create mode 100644 rust/kernel/block/mq.rs
 create mode 100644 rust/kernel/block/mq/gen_disk.rs
 create mode 100644 rust/kernel/block/mq/operations.rs
 create mode 100644 rust/kernel/block/mq/raw_writer.rs
 create mode 100644 rust/kernel/block/mq/request.rs
 create mode 100644 rust/kernel/block/mq/tag_set.rs


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.1

