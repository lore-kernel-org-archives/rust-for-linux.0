Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064368;
	b=IUGLHxOV3oTZL0Rr8b7RCf6lrphka/Fz2JdUUVYTDmmYl6OupQSkGC7UB1qmeFO+rs/D
	 osTs8I6Y1Qa0y2Qzr7XcTv4vbD0t++k0V0R8NduxqwmUTJrz5bTRWZQdzgrRZOQ2Avk1a
	 vzEY+7Ax3p3aazlp5mz+uDXObq1HapF8k7gy4WCAhp8RDs1GeBO0PIVsPrj7pVh922wXr
	 A0d0D+8AUDiQ/PBYWDzV+C3Lums0yjR1jl4uT+8ATYBrAxbqcyvszpF7QRTh4PYmBvdR8
	 jsA35qan533jofcEcgBVk5ajt08U6buO9NSuKvHOyf71kPERiksfN9G3yO/wHtYZ1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=94lQ/zLeVCE/Dxl+IWkoK2rsoipFVucH6nX0rc6zU20=;
	b=RMPXspRC4ElWrpmaLsbYpPcbIr/pYC9l+zu154TEYEhodC/yCHeLTiopmGRkooXWceNs
	 Z7YppIrZNCGInlOd9nfjr3NDTzCLbOFy36+e2AohAhfXUnSf9KHcqwVQEzAMsdVyn3oRQ
	 LKTkg2q3XH/h8htmj+5uTmHSedZMq0sIki0FV3CYoChUiteNZ4SNMBNAcFaO4Q5UUBR+l
	 RkH3vumW05svZj+6yj817aZ/wThyVJFpB+cW3ekBPgDqXUApssy1Qq5HoTj23gMdIylo/
	 wZJekm/WYbhyQBFg6s2aLkcy7wT26K0OUK12aBE04mFIIe7RM5O0vGfdlSWQ1ViaewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n1afktS5;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED8606B8A5
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 15:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29ED8606B8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n1afktS5
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so12270085e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Nov 2026 07:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794064366; x=1794669166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=94lQ/zLeVCE/Dxl+IWkoK2rsoipFVucH6nX0rc6zU20=;
        b=n1afktS506R838K88N7naBWLU0ykNyT71xA/YfhgS4qir3tTlJOXbKYhaMjN2AG7fZ
         5EPrUjTUbi1IL/dZMQ3uH1XjdsbewIp3+/qFhZ6mxmF0SnzdUhvqdoz2fczUNfl3vCfp
         45+P6vPTsOHWD+JVQmqZS3H1/aXamvQ0oPizCxtT1uPAzjq4qSHIm4EubaDG8E9ijS0J
         OipztjOdqDFb/LlhiCilavBmB2VuIad/Q6BX7U6U5665R7rRHSLJnsfHeER/H2I2lRZS
         T7qMWS6BApXd86G08nvM6LfnQ8Uvp8bnD1VpFk+Wnk0DPDQ1Z+hb3KInlsbC5qChwd5R
         d6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794064366; x=1794669166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94lQ/zLeVCE/Dxl+IWkoK2rsoipFVucH6nX0rc6zU20=;
        b=RpnUKZwfTuocLFWySKJSu5tMLipxyYpoWJyKmyvUnItXw8tTQrn3ihaUW5Q3NIdRDc
         qSo56UN9CRP/QEpQOz2lLlH/GVxPFnZGd0fZMwR2LrEsbF2x6edcWsaxXeE3hQVaNfPG
         GaQov5DPghQMmzuz4sUUmaLCDStXBB79PNQ4414RtYVQZn2Gk0MEBtI/5yXtLLLplPUq
         1OT1nCGOkcSyZ4SUc9GGXdXS6+1DQ692FoyXiJNprC8Wv/YEr7OWlJttds0GreNHtE3y
         7OK655i1uXPlQIqbm4e+lryfvpl00rJOKDWIOxlp2uXoHk+QJKb/d+Fcm2U4HfVrgOfa
         jAqw==
X-Forwarded-Encrypted: i=1; AKwUvByZ3n2MHUfQNrkCftLXbzbNpgDdbkEzwW5Pk6J14LCDPsXgkoHwGLaLOtIOsd1XD0bVxGPzdJ0hp8Fg7e+07g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9SVKZKpXOZkE0Eti0dhvD+SG2cfy7MQeLfIiaVrshOyBR/UXLE
	GeLDi2PCCJi66JLU+YslURugpv5DRLZpw2O1Dnf82zUPRuo9RQNcgPdz
X-Gm-Gg: AYBFou3oG3pTs5HhUm2XVpvCM2LGkE9dN5QLkLzDlBFlUwHTdWRNutum9r6Y3pBPa3p
	eO8rvDR9C2+QIbMi6Ye8t9MFtsnTUuzDCPeOlq4NXtufcwQu3ok67vPLKkzx+p5dCHsTBNq6dwX
	O6AlllZgRcGKOUzNFY3Ki2ikP9S6kWsNzoZfbce/ugYLoqVQI+ct9dSdyGML2lr+6a2Lpzr2il4
	nDX37B4ssunhWRPmdoGuPg6nbtdKiwtJGmLcZX6B6t+GMru/o61Nnf77TuRfgq7YWFNeXiN2KTF
	/Kn4vj3MAY858uGO+DXXV/inhh8wZtNHysZXmL99VCY2vjdC7Th+vsBFkbBojdkB22LC8wU0u4E
	yRA8wnBuJJAROcm1CjQiYpq/WKT76UGtb9SIH2oKqggbji/CkpoUvX3Mgyp2zETxPix4vczN/Ul
	1L6vQT/pxh1DCHBW9JlZ4NVHdRX0fpqyVvaRh+8+ucNWzjKt4vtLZRh81Wuw9Rref82DB6B04RS
	Yi0Hsiu0JsQYg1MjW+kTJ5knjXDlcXO+oyhX6Qu16II9t8eiZb0kv09z8xlXfpuFWUBHTVfloQd
	RITHuDGBxEWr5BvFAYQtkLDBGC0cEPy6ZqFHY2y9ZyRdos31rDcfRN3DJoFIInEwwRaW8cCgaIR
	ORVuXhKt+SBVocZVQCGKiTw/trNW8amHpmUTrVBuRVwebQMPM
X-Received: by 2002:a05:600c:1391:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4b6dfd97b6cmr98201195e9.29.1794064366182;
        Sat, 07 Nov 2026 07:12:46 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7c49082b6sm32073065e9.2.2026.11.07.07.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:12:45 -0800 (PST)
From: Vecheslav Filatov <harepro29@gmail.com>
To: dmitry.torokhov@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: linux-input@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vecheslav Filatov <harepro29@gmail.com>
Subject: [PATCH v11 0/2] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 20:12:36 +0500
Message-ID: <20261107151238.607451-1-harepro29@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces safe Rust abstractions for Linux input
devices (struct input_dev) and the serio (Serial I/O) bus subsystem,
along with a port of the legacy Gravis Stinger serial gamepad driver
to safe Rust.

Changes in v11:
  - serio: changed Driver::init() parameter from &Device<device::Bound>
    to &Device (i.e. &Device<device::Normal>) and Registration::
    connect_callback() cast to Device, because serio connect callbacks
    run outside driver core really_probe() probe context without devres
    release guarantees on connection failure.
  - joystick/stinger_rust: updated StingerDriver::init() signature to
    accept &serio::Device and removed now-unused device import.

Changes in v10:
  - serio: removed wrapper module and aliases, directly mapping
    Registration::interrupt_callback() to canonical constants
    bindings::irqreturn::IRQ_NONE and bindings::irqreturn::IRQ_HANDLED.

Changes in v9:
  - serio: updated Registration::interrupt_callback() to map IRQ
    return codes using module-level constants.

Changes in v8:
  - serio: simplified IRQ return constants to module-level definitions
    with direct crate::bindings import without extra wrapper modules.

Changes in v7:
  - serio: scoped the lifetime of borrowed mut data inside
    connect_callback() to drop before calling serio_continue_rx(),
    preventing aliasing violations with incoming interrupts.
  - joystick: added RUSTFLAGS_stinger_rust.o := --crate-name stinger
    in Makefile to ensure built-in modpost device table aliases match
    the canonical module name "stinger".

Changes in v6:
  - Developer identity: updated author and Signed-off-by to developer's
    real name (Vecheslav Filatov) across all commits in compliance with
    the Developer Certificate of Origin (DCO).

Changes in v5:
  - serio: decoupled child device allocation and publication in Driver
    lifecycle (init -> start -> attach). Child input devices are
    allocated and configured before opening the port, but only registered
    via Driver::start() after serio_open() succeeds. This prevents
    premature registration and spurious uevents on probe failures.
  - serio: added C wrappers rust_helper_serio_pause_rx() and
    rust_helper_serio_continue_rx() to safely attach child devices in
    Driver::attach() under hardware RX pause, eliminating races with
    concurrent interrupts without sleeping.
  - serio: removed redundant Device::as_device() method and made
    Device::as_raw() crate-private (pub(crate)), relying on the standard
    AsRef<device::Device> implementation.

Changes in v4:
  - Makefile: restored analog.o and db9.o in joystick Makefile
    that were inadvertently removed during previous revisions.
  - serio: eliminated concurrent borrow_mut() and aliasing data races
    between connect_callback() and interrupt_callback() by initializing
    and registering the input device prior to serio_open().
  - serio: mapped interrupt return codes without missing constants.
  - serio & stinger: formatted all module imports in strict vertical
    style with trailing // comments.
  - serio: annotated Registration::drop() and Driver::disconnect() with
    #[inline].

Changes in v3:
  - input: added AllocatedDevice::set_phys_from_parent() to dynamically
    format the physical device path ("%s/input0") in an owned kernel
    heap buffer.
  - input: managed parent device reference counts in set_parent(), drop(),
    and register() using get_device()/put_device() to avoid dangling
    pointers and reference leaks.
  - input: eliminated manual cleanup duplication in register() by checking
    to_result() before mem::forget(self).
  - input: implemented Send and Sync for AllocatedDevice, added #[inline]
    on small methods, and formatted imports vertically.
  - serio: integrated serio::Device with kernel device abstractions via
    AsBusDevice, impl_device_context_deref!, and AsRef<device::Device>.
  - stinger: restored userspace-visible device name ("Gravis Stinger")
    and dynamic phys path, preserving udev and EVIOCGNAME compatibility.
  - stinger: maintained module name "stinger.ko" using Kbuild object
    aliasing under CONFIG_JOYSTICK_STINGER_RUST.

Changes in v2:
  - Combined serio subsystem abstractions and Gravis Stinger driver
    port into a single patch (2/2).
  - Retained original C driver (stinger.c) under CONFIG_JOYSTICK_STINGER
    and introduced CONFIG_JOYSTICK_STINGER_RUST to avoid regressions on
    architectures and configurations without Rust support.
  - Ensured IS_REACHABLE() guards for C helpers and #[cfg(CONFIG_* = "y")]
    for rust/kernel modules to prevent unresolved symbols.

Vecheslav Filatov (2):
  rust: input: add input device abstractions
  rust: serio: add serio bus abstractions and port Gravis Stinger driver

 drivers/input/joystick/Kconfig         |  14 ++
 drivers/input/joystick/Makefile        |   4 +
 drivers/input/joystick/stinger_rust.rs | 190 ++++++++++++++
 rust/bindings/bindings_helper.h        |   2 +
 rust/helpers/helpers.c                 |   2 +
 rust/helpers/input.c                   |  22 ++
 rust/helpers/serio.c                   |  27 ++
 rust/kernel/input.rs                   | 253 +++++++++++++++++++
 rust/kernel/lib.rs                     |   4 +
 rust/kernel/serio.rs                   | 331 +++++++++++++++++++++++++
 10 files changed, 849 insertions(+)
 create mode 100644 drivers/input/joystick/stinger_rust.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0

