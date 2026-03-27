Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91981382F0A
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612083; cv=none; b=qTSphoabyIUKJPZiocMUs9OoXFOFVHQz66VFbTcbwEB4ESfp3IwKNWzhmnkD6LGoYNePRH5NmzTzF4gNQr5wV9pbhx3uQOmepkMbNubW3Mk8AJbWuQPxDqc56yGIDTt5CI1S2qpai/eN0BGJbz+iOA6ED5PcB+bRdN6Bd1wL804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612083; c=relaxed/simple;
	bh=6WqNWUbqfb7HlONn5CrSW8B/8IlYYtTlhCxhq+oa1jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcU86Nw634qKU1IMjG/XOs56reKUndXd5oDVaouKHiNMdfgl36yI6ilw/5jnh2kyE7BgQ+Fjy5h06VMJnZoPyD4MlvhAgFonErI67AXeX7XaPKRIB7+wuDaOE792RK+52QI/Tyt52U00et1ENN2X6tSbGpD1W8JCxzvjqg//9HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7xUpI35; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7xUpI35"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8298fad2063so1200993b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612079; x=1775216879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNMzj7FR5eiPcLDxvC3wno+fgNRRz7YkO5bQ1NKOas0=;
        b=s7xUpI35hFW1/JcJzVHe/JJ5Z3quTAzrKUzmUQP9Q6UBTzstOBlGOZgNnqQLLOrNrv
         eNOHVCxYEl7E+Si2lh83He/8VUDlAib16fD1K09Zx4zQci+qPkKv6j+Jv7aot9rWmCY3
         xOb86nBPP/R6z67halz9bF0u0wIvdQ+koSRITuukP5P+Kdoy1qw7CtkD89SB8tc6lleU
         eZUGk+IlX57qGz9DhWV3C07AAMpH9NlaDb/aj8rLDYHAWaO5JrDjEgGyHg0DuhhKBtop
         +I/QtdOr32bWQ+PLHBbvbwiagkfQeW2zcOFXfncLHtYInM4LqxxKJEQMjdRgr/FyV1q7
         UcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612079; x=1775216879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNMzj7FR5eiPcLDxvC3wno+fgNRRz7YkO5bQ1NKOas0=;
        b=Szea4Kwz01EpG6Onfo2OqThSycyedI5KbtrX5n5s0Nj5FDdiLw5z6oyh7fwOdXjtV1
         3/Q1i+/egY2RP+2QSGHanDhzjzIAwDh2mwJILueXKUmP0pKAuKTexw39WAPj3xJ7QMIx
         yI4Pc+YUXC98vwWOJVjOFMKuU9p0FgxGrRcWzocp7q1gTn80PzdX9xKd6S0uBddO1u1G
         gvmTV42oeL4IMKecHzeIM1LWXidLaXp8C7TWc6jzX26BfymcqVcApvF1ZSvdgGTecEUg
         WOKubEcZpkqSEYJRh3iLmMawQfc7E9/Ap7dlJAGQjVgOAA+l+c85nYljKzwWHck6/id+
         WQVg==
X-Forwarded-Encrypted: i=1; AJvYcCVKyNHeFuiDxFkrzOnT2zDiL805kTyCsE2KdxIhiMgi8O5+tnb1f9QvE+L1ZXYPx7kv4Vtp1a5sPTV7fOG1ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBMibaP6CVdB7MYuvJTmZiKFDH0D8A6mkyiPB6n5BUp/0Z3Zf
	WHfBfiUk+dAnqNqsBv4l0gn9wkEWLBW2dU/rKo14qk1aqVWBEGjrRkff
X-Gm-Gg: ATEYQzzeBE5kTJILX+KXxBaQLbKITVMf3VrH9o/XlOICP+++8jRYfqzW/iveuMuYW8i
	2QQiWYK9kBsq0tKoVP6gEoQMBDwBSWxPHnXhqx1LnpidFZMOdZ4yEiCC+H0NXRYSiCQ8me3uHro
	F03YwxTZKvYNezRWURbHf5mPdXCBro54+YXah2Tr/mV+WfWT47upaJm3gukTXknzilUw2ymqVIX
	RUcFw90NDQdHFXWZ1wc5mvOuLJjUfVh4ikFh+H1vzipGgCJI6U5Tl7DnsaOcbNB40stFqcStF5F
	+Z1nM41Tw0ymHMA9hvXvQ2GrHu0IE0vyiLEChxl9AHLCQ/sgKpKg7JWZZWoz0PDYLDbzDl0QK0w
	WaKiAMVUSMgL2nOC8dwJeJdfwBx4JnaQ95+1IJMT+fAcDLK7wWvWoTCb6iyEmIrai8ZmMBKOBU6
	MqOme3OfwQXTSH1IlUrQBv90RDCEkQFL0caS9q53ZZmqwsRRtAc7mgDm37uG5pHmIc
X-Received: by 2002:a05:6a00:600a:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82c956c2ef1mr2401030b3a.0.1774612078684;
        Fri, 27 Mar 2026 04:47:58 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c289dsm5235572b3a.47.2026.03.27.04.47.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Mar 2026 04:47:57 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: axboe@kernel.dk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [RFC 0/2] block: Introduce a BPF-based I/O scheduler
Date: Fri, 27 Mar 2026 19:47:39 +0800
Message-ID: <20260327114741.91500-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

I have been working on adding a new BPF-based I/O scheduler. It has both
kernel and user-space parts. In kernel space, using per-ctx, I implemented
a simple elevator that exposes a set of BPF hooks. The goal is to move the
policy side of I/O scheduling out of the kernel and into user space, which
should greatly increase flexibility and applicability. To verify that the
whole stack works end to end, I wrote a simple BPF example program. I am
calling this feature the UFQ (User-programmable Flexible Queueing) I/O
scheduler.

This patch depends on new BPF functionality that I have already posted to
the BPF community but that is not yet in mainline. Details are in these
two threads:

https://lore.kernel.org/all/20260214124042.62229-1-pilgrimtao@gmail.com/
https://lore.kernel.org/all/20260316112843.78657-1-pilgrimtao@gmail.com/

To try it, you need to apply the patches from those series first.

Note: This is still somewhat experimental. I have only done basic testing,
there may be bugs or security issues, which I plan to address in follow-up
work. I am also looking for community feedback on whether this direction
and the implementation approach make sense, and what else we should
consider.

Kaitao Cheng (2):
  block: Introduce the UFQ I/O scheduler
  tools/ufq_iosched: add BPF example scheduler and build scaffolding

 block/Kconfig.iosched                         |   8 +
 block/Makefile                                |   1 +
 block/blk-merge.c                             |  49 +-
 block/blk-mq-sched.h                          |   4 +
 block/blk-mq.c                                |   8 +-
 block/blk-mq.h                                |   2 +-
 block/blk.h                                   |   2 +
 block/ufq-bpfops.c                            | 213 +++++++
 block/ufq-iosched.c                           | 526 ++++++++++++++++++
 block/ufq-iosched.h                           |  38 ++
 block/ufq-kfunc.c                             |  91 +++
 tools/ufq_iosched/.gitignore                  |   2 +
 tools/ufq_iosched/Makefile                    | 262 +++++++++
 tools/ufq_iosched/README.md                   | 136 +++++
 .../include/bpf-compat/gnu/stubs.h            |  12 +
 tools/ufq_iosched/include/ufq/common.bpf.h    |  73 +++
 tools/ufq_iosched/include/ufq/common.h        |  91 +++
 tools/ufq_iosched/include/ufq/simple_stat.h   |  21 +
 tools/ufq_iosched/ufq_simple.bpf.c            | 445 +++++++++++++++
 tools/ufq_iosched/ufq_simple.c                | 118 ++++
 20 files changed, 2094 insertions(+), 8 deletions(-)
 create mode 100644 block/ufq-bpfops.c
 create mode 100644 block/ufq-iosched.c
 create mode 100644 block/ufq-iosched.h
 create mode 100644 block/ufq-kfunc.c
 create mode 100644 tools/ufq_iosched/.gitignore
 create mode 100644 tools/ufq_iosched/Makefile
 create mode 100644 tools/ufq_iosched/README.md
 create mode 100644 tools/ufq_iosched/include/bpf-compat/gnu/stubs.h
 create mode 100644 tools/ufq_iosched/include/ufq/common.bpf.h
 create mode 100644 tools/ufq_iosched/include/ufq/common.h
 create mode 100644 tools/ufq_iosched/include/ufq/simple_stat.h
 create mode 100644 tools/ufq_iosched/ufq_simple.bpf.c
 create mode 100644 tools/ufq_iosched/ufq_simple.c

-- 
2.43.0

