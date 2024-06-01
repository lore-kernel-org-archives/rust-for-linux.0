Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773DC152163
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717249237; cv=none; b=dIlVcRPAoJ1oKzuENA3ljpXU2XM/3Fi39nphzlrtSItM70q3hDofEOeGfS22aRo5FgVX3Ql1pvVHNb+F9VlK+LMCjHBaovgWoUq05u2CpZCLJl7j6OyQ2unhV/yE+8k6PB5ZXal8hXDm6cEM3RpdkJKsgNWP43BuQf2RzQC2m2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717249237; c=relaxed/simple;
	bh=aQ38ZhHYsrlwdR3vgqyHxmlopGuks4yflq18E5jTA4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UuWJhabBb8DiRXht9oi+SaUDczKVFsugoWgwX2lCXUYFUhnDOdV9umr2EZtTFZxmmi+JzRMvmv6amMAaBgP0yXt5cq7zI++XJSBK+x5zMQLxsmibY61XjcytfVIRcNkAgGRUcDYg6VK6ZZghKUe9BJBpMl9PVLniXRsi2v8kFsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=1tz+sqM+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="1tz+sqM+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-578676a1b57so1631402a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 01 Jun 2024 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1717249234; x=1717854034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KyzuF3brQQkovopkloODG73sB5o5CxxgafSs5PeVkB4=;
        b=1tz+sqM+WGfQjUidz0FZkYuN7/Su8sMNGeEaEay9fkm5i7bVXjMyCBREh3x6sDAXZU
         HBjycbEPF45v8fcCgdRDwDY3/Sh+6tyiLuTqXwyDt7W1ZeaW7yd1Sam6c5KL8+nD0keR
         2+irnhxXySMeRmEyFx28cYRxKuNZ+IF/kUlfqCsCos34fIQwE32jQ+Ui2RYaiuFd9esW
         pcybF17AJ+qXlaGvTa1eNU8jl1tuRTDY+UdWDrFMIRmwIKTxZh2FhTtOOiW0X1yQUONk
         v5PvsBeMjxcGr08EFcUX93XyrKAgYy3ZR/RmRD+JBxV5AUFAoGq7r5sHPFtI/ChmhVzL
         Qmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717249234; x=1717854034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyzuF3brQQkovopkloODG73sB5o5CxxgafSs5PeVkB4=;
        b=B7CtPoTFs65BlofKBA8TbBBQ3zwLkibI5rnwMaWH5xqlkrVgXwtfQrxt0N854dF+n9
         AzFUaJAvTB27DH6KzJDEpeSCXXssqDTtmwdPL7urfdM1jpzVOp5Hu2uB7tlCO7jxsDtV
         tgbzA+BOyOVuW2l5as2BiL0XqQ/HHJOZLLbTDa29H7JeqqvzBgHVmNu5FbjRT3vfRc+b
         vDKGxzQCL0NxD27aJoi1admemwuGHLwL6q1oS5i8/C/740kXiFqjtA2IblNZq0FLFu5v
         trENOqBHn5LhDko1i9Ne97WOglzizhEUGProMCIGYxXA4aRskhekwBw9zkaotkcpbviR
         mlWg==
X-Forwarded-Encrypted: i=1; AJvYcCX4YXB9HpCH87Az4KleaPRSGLvIZY9cdjWybP9vnCeTaLBqr6uuNtl3KcseZs+2HOnr2BEOO8zpK4NWDnVOo/hcQKPwYCYlgkOvt6FMQi4=
X-Gm-Message-State: AOJu0YzdbXr6YTk5F7/id0FKnttqSrw2ZlaDpF6JzNU7ZSAKwKh9e/Ql
	ItajJQ3nubAElKDniApirC2ndPijXz9Gd/cqn4e4a/2xNRrQF8KNQJsS6p/MjeQ=
X-Google-Smtp-Source: AGHT+IHm6iJQ5zWo9gmL/sApCYvn87FeI3FVoS60Bcoobcm9QG6YgSoaJbUyMU8f1sqs0HvKYas+uA==
X-Received: by 2002:a50:d7da:0:b0:57a:22b1:b02c with SMTP id 4fb4d7f45d1cf-57a363ffeffmr3839471a12.27.1717249233833;
        Sat, 01 Jun 2024 06:40:33 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9d5d5sm2234736a12.95.2024.06.01.06.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 06:40:33 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Rust block device driver API and null block driver
Date: Sat,  1 Jun 2024 15:40:02 +0200
Message-ID: <20240601134005.621714-1-nmi@metaspace.dk>
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

A few more fixes based on input from Benno. Earlier version here [1].

Changes from v3:

 - mq: rewrite `atomic_relaxed_op_unless` in terms of `atomicu64::fetch_update`
 - mq: fix docs for `atomic_relaxed_op_unless`
 - mq: rewrite initialization of `TagSet` to be more idiomatic
 - rnull: add a comment for error path
 - rnull: move a ? operator


Best regards,
Andreas Hindborg


Link: https://lore.kernel.org/all/20240601081806.531954-1-nmi@metaspace.dk/


Andreas Hindborg (3):
  rust: block: introduce `kernel::block::mq` module
  rust: block: add rnull, Rust null_blk implementation
  MAINTAINERS: add entry for Rust block device driver API

 MAINTAINERS                        |  14 ++
 drivers/block/Kconfig              |   9 ++
 drivers/block/Makefile             |   3 +
 drivers/block/rnull.rs             |  81 ++++++++++
 rust/bindings/bindings_helper.h    |   2 +
 rust/helpers.c                     |  16 ++
 rust/kernel/block.rs               |   5 +
 rust/kernel/block/mq.rs            |  97 ++++++++++++
 rust/kernel/block/mq/gen_disk.rs   | 222 ++++++++++++++++++++++++++
 rust/kernel/block/mq/operations.rs | 233 ++++++++++++++++++++++++++++
 rust/kernel/block/mq/raw_writer.rs |  55 +++++++
 rust/kernel/block/mq/request.rs    | 241 +++++++++++++++++++++++++++++
 rust/kernel/block/mq/tag_set.rs    |  85 ++++++++++
 rust/kernel/error.rs               |   6 +
 rust/kernel/lib.rs                 |   2 +
 15 files changed, 1071 insertions(+)
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

