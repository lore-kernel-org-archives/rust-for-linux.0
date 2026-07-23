Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D5B2F7EFF
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823372; cv=none; b=pdmOWl2Pt2ufbCSlFsoABWjjt8utkZ7SdZ9XrRPYD2xwacVr1S+SkQPw0HmDH53DZ5AVtdTB4WFHCdpzcHpNtf0cEEXF1pJvwlZcHh7YwAiy47leuKV4KXco4EDr/rKMDJdulEQzK2RcPMT7nFyoQ5EBvDkIzlfrjwHIptZTvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823372; c=relaxed/simple;
	bh=RhYZhATafjoMD0ZHXlRQHWN9Xd1AxMAMGtvwpmw4tCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOqF/HcvKvXo2EBQvsCzhrbd4gLXD8qXKH4Z/Or/mDsFLDs35Mbx5Eg6nS+aYYe/oyOnlhIrsYsAJaSpx7KMMjQJpsTH7k1UuAkMSTwfShH2nPMAwIsjYlZhtBf2JWvnRa680M/Wg5xFHnHWyjg8IcxI9WWVYRCQZprd48HirIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9Mxu893; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9Mxu893"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so6298081fa.3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823353; x=1785428153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCFBAhStYCbZRWF7EYeTGTDCTAg3SzAm66lZxtMyduE=;
        b=A9Mxu89328xZTb6bSW/2wNnD+XEPmPHz3atfPhfCpmbOOVGSlflpXV4Jqm8nl+QhHh
         7N3M/cilFKg91h9GOQ8CRh60AdSOd4wphKO07Gtin7NnpmNVTlVzWEtl3ycmlzS3HtY5
         cdNuZX43vZUKpuFTo10Ai+KkbS6lzqDgcLbYAyXjez0Ddmix7VS0IHyFgyofPQAtK92q
         sVZ2DeSCeif8AfuWHSVTD/Dchg2oH+QgqWIFY0xfNH2J8Dp/UMTJgOTHIR9TQ69RQlbf
         ieLiBus83V/lNa8A6HcLgmFwmhO8pGIv3ddMtIaZiexwpZWHh4q/W5nSQI2XVeD7Nlb9
         0ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823353; x=1785428153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCFBAhStYCbZRWF7EYeTGTDCTAg3SzAm66lZxtMyduE=;
        b=OoGfUItdmUMAZLOe/bWdRDvxU0g6QhssPWCUFu3CIMKZcpVexo+YZYvpxzMYeWjzTH
         sCjE8pFYp66hIvdad5crwLHYuxTU1OxCne6qL7bifS4zJBeqMaY4yqfsazqQHkttiqAw
         7Fk7CBXqNgMHRfpU+fKXy9S+sJiUnqmGT7jURbR8mbwcLFhkgy7yTW7pC9FY3O4w+RAP
         nk/C+pSufWRNIAhU/72d1f95oaUoQARVAV7PCGdFm+DRWpIIHO2eWjLQsaGb3Hifecx4
         DskdUR3AwZ+U0CHV+PbRCNuQPvG8HBkjHnRor36gkUML0j6Chk5vn1Fo2hPRwGzoBQZl
         Usag==
X-Forwarded-Encrypted: i=1; AHgh+RoImgIGqvkt2/haVKGuNOWCIZ1aVfKD/t0PTUN4p50i9lFzakvU6tDs5WgqvnGURlY29pJ4oINWx+0hZAQd4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi59q1etqteh8LeLXPSobTRwYxHIIWen70bW/lC0IKcQ/DRuB8
	cwSX+BjCjtDmDUMfENdsL9RRvbsExuNHkxdcncAQ30NDmrrSC05I4ETi
X-Gm-Gg: AR+sD11jkHlNi0vV0iEbQVNuF+11WBWnbLFyT1x2d/m4kF7fvqSii+pNjDCeCXdSV6O
	n26boVSV7bZMUfIzjK5ua2kbHn8tHu0ceSqFVxeY84CBVwUiwDSeLXnZZIE3LcSxpnVWcMLZcTE
	gJhBTa0LQjnD3DLwl5KQoH7uN+LT6jhJ4Z/E/z6iNwvGLble6qX9nYsIoAcrHj6Vbt753hSeXrA
	derT8bcjTqFXs7LmNzSIvEhH500DPjcMLyju5Ydi9l6hto0+Et7t71r6ziOOttR0BeDoGpb3+n6
	Fyj1LEUtW5n6jW6cWsjU9fl7d7LIS3mqfrErpy83d9VeTP9AeD0lgYC+0wBxBjChUfBmqxAICsn
	yacG/W58LqsvbS16ZmZ6/KL4NiWPMnh85at2CA7Z70xbw/qIzh3GtS+HQZuLFZxoAWU7eGrMcS/
	wvIQhtEo0r/BISR9odQcdti1963CLxCqIZa5sBNPgpMkCzPhMHGPXs+oD7Og9sJ4lfm/+TO2HLe
	yJC
X-Received: by 2002:a2e:3a13:0:b0:39a:e29b:790b with SMTP id 38308e7fff4ca-39f07e96d46mr6427911fa.34.1784823352729;
        Thu, 23 Jul 2026 09:15:52 -0700 (PDT)
Received: from localhost.localdomain (46-138-176-102.dynamic.spd-mgts.ru. [46.138.176.102])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8c40fsm9875561fa.41.2026.07.23.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:15:52 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: linux-watchdog@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ojeda@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	dakr@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	lossin@kernel.org
Subject: [PATCH v2 0/3] rust: add watchdog abstraction and Rust softdog driver
Date: Thu, 23 Jul 2026 19:15:26 +0300
Message-ID: <20260723161529.23759-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Rust abstractions for the watchdog subsystem and a
Rust software watchdog driver functionally equivalent to the core of
the C softdog.

Patch 1 adds the watchdog abstraction: a Device wrapper, an Info
wrapper with option flags, an Options configuration struct, a
#[vtable] WatchdogOps trait with an associated Data type for driver
private data, and a generic Registration that owns the device, the
ops table and the driver data in a single heap allocation.

Patch 2 adds a minimal kernel::reboot module wrapping
emergency_restart(), needed by the softdog driver.

Patch 3 adds the softdog_rs driver: an hrtimer is armed on start and
re-armed on every keepalive ping; if userspace stops pinging, the
timer expires and the system is restarted via emergency_restart().

Changes since v1 [1]:

Most of v2 is a redesign addressing the review feedback from Guenter
(via the Sashiko review [2]), Miguel, and the kernel test robot:

- The ops table is no longer a &'static mut supplied by the driver;
  it is built by the abstraction and embedded in the per-device heap
  allocation, so multiple device instances need no static mutable
  state (Sashiko).
- Driver private data is now supported via an associated Data type;
  every callback receives a reference to it (Sashiko).
- Callbacks now take only shared references and Data must be Sync:
  the watchdog core does not hold its lock on every callback path
  (the first start/ping on open, the reboot notifier stop, and the
  stop on unregistration run without it), so exclusive references
  would be unsound.
- max_hw_heartbeat_ms is configurable and the stop()-or-heartbeat
  registration requirement is documented (Sashiko).
- Removed the Registration::device() accessor that allowed aliasing
  with the references used in callbacks (Sashiko).
- stop_on_reboot is now opt-in and rejected with EINVAL for drivers
  without stop(); nowayout defaults to CONFIG_WATCHDOG_NOWAYOUT
  (Sashiko).
- The watchdog is always stopped on unregistration so no callback can
  run after the driver data is freed.
- softdog_rs now actually bites: it arms an hrtimer and calls
  emergency_restart() on expiry, instead of relying on the (wrong)
  assumption that the core handles expiry (Sashiko).
- Kconfig mutual exclusion fixed to SOFT_WATCHDOG=n; !SOFT_WATCHDOG
  still allowed both drivers as modules (Sashiko).
- C helpers marked __rust_helper (Miguel), and updated for the
  const-qualified watchdog_active()/watchdog_hw_running().
- Fixed rustfmt and clippy issues reported by the kernel test robot.
- Drivers no longer use raw bindings: added the Info wrapper, the
  flags module, and the kernel::reboot module.
- Added the new rust watchdog files to MAINTAINERS.
- Rebased onto current mainline (post-v7.2-rc4).

[1] https://lore.kernel.org/linux-watchdog/20260323195138.5541-1-iprintercanon@gmail.com/
[2] https://sashiko.dev/#/patchset/20260323195138.5541-1-iprintercanon%40gmail.com

Artem Lytkin (3):
  rust: watchdog: add watchdog device abstraction
  rust: reboot: add emergency_restart() wrapper
  watchdog: softdog_rs: add Rust software watchdog driver

 MAINTAINERS                     |   2 +
 drivers/watchdog/Kconfig        |  12 +
 drivers/watchdog/Makefile       |   1 +
 drivers/watchdog/softdog_rs.rs  | 143 +++++++++++
 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/watchdog.c         |  38 +++
 rust/kernel/lib.rs              |   3 +
 rust/kernel/reboot.rs           |  19 ++
 rust/kernel/watchdog.rs         | 522 ++++++++++++++++++++++++++++++++++++++++
 10 files changed, 743 insertions(+)
 create mode 100644 drivers/watchdog/softdog_rs.rs
 create mode 100644 rust/helpers/watchdog.c
 create mode 100644 rust/kernel/reboot.rs
 create mode 100644 rust/kernel/watchdog.rs

-- 
2.43.0

