Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034820;
	b=qnXkXVRajzTgE/vjXAWzvhvE64bAEY7X0cWbnfpT+VghP2DqnKC5y/Xx0twrTCklFrAl
	 NYcfPREw3Ll4YneDqBJoHoGg5LbhlLvyqyN+zYgcfnD95b6HMyGjyPz/tiFrIIIkAxAPA
	 ZklELgqRXMlNTjemiuIdIkXzpCJjlR4p/bT2vXh0zgVe6G1AGxoj01s/oiqRKepbbeqwF
	 lyYZLbu79w+ZmwoycSGr8dWmij4pAQM6B44xQgBB3xgWhn8mlPWocEwGVO4uSlIdY0z8h
	 FVhAaU7xbTu86CNbVeCEMxaTijBwJds8K1HQflVRImXuNrKkVvKSGsq5MeF/HIzeJuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=42bIYp6+6g1fxqiPQpAO+0GfA6XUN3szuMxUueVcz8A=;
	b=KERfwUU4ABbBVTbdQKnSXtoWjbnS15XwVsnzA3NR1kAOZa7Dy0WOWPM0GUhRUnsWLNZC
	 EccmuWpd9VR4UcpMxxjJzxkFYKD3peOzUHDvjNZObNDppqHG1MLPmRG9iPpMHq+y81ZnN
	 qv3S0OqYCaLJRT+eyskny4DrZ31uXIWHBI97XiOj1dv2YwqkX740Xs6oQVgIqSM1fmV6Z
	 fOzjjKWIkESoq9YuGGAw4QsLJtqxWxwUWhpD1r6DNB4EFVgYwB4N1lU4R1FOEgAAW9CLW
	 g5hHraI9ZLBwT1MkBGTFpbZ91kCARoJMfgdfIkZ5wWULmod4wdmYKCH8iErfwF2yXLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujjQwt1l;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD72606A32D
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 07:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD72606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujjQwt1l
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a215e64962so14791685e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 23:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794034818; x=1794639618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=42bIYp6+6g1fxqiPQpAO+0GfA6XUN3szuMxUueVcz8A=;
        b=ujjQwt1lE+vBF3GmZrvT5byjvqAYfB/8H1OmTqWVn+xBBak1+63ENHfyRmHX8mogn3
         5uqJDXf1LOfHXFno/mahL+/c1+71Edk8rehEHv1+z4bdLDEMR077HCS3Dewk2r25/4ut
         jbb0+ZtBcJpC807uygeZNJZm13Pc6mLEVCQcNl/jGc/NJF3sprlko+StE5O+aKQL7dHX
         mJZq+6WQCi/Cs7ALv1lIhjGqOH71mV0ItSqTMAHNiK6mqXog0q3tIJq0VlDdhm9gO1iG
         Pm94lP+1Wzm2g8B70g2tKw/wazfeZEgsDZJKLy5DM1CfPhtccPz4haHlgjqSfEy0V4xM
         5KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794034818; x=1794639618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42bIYp6+6g1fxqiPQpAO+0GfA6XUN3szuMxUueVcz8A=;
        b=oGg0H/p/dpGtwjvBKfckPXNTIMdAd30BaBRfykJPMUHV2BOsjGWvLKvBBzgEhtVVHr
         BHdoNkd7rEr1sXetzQjqnHMPjC+eKiqjikLFtzf7d4rzAMRJZRIfXSW5L2h1jdGVtubw
         eydEff921WiNuJqjTkwtWqEkcHGQEvGhfO0vFcmZKwGkxF60izzxV1tUeUIHOSkBl7ar
         8Lx6Dp5nkNxF03LszE4OsEmggvscZY3hio8tH0KViqqCthJxyT1YooM5UGOlwerydj8w
         fDdAG3eblFHnsSPaV5Jt4dD9Asgx63jOKzSGHEqrDN2m7gb1bvxtL8EmgxhFFE1j+sbz
         lrrw==
X-Gm-Message-State: APuU4Z8ui/eSER8ePdzTEOJUGuj/1HeO5TbVoamQLRSIHTgfIeJWDyuO
	zDqfPQhqO6kyqoxCutgMRv2Ba6sl5L8kCW8ZwfBQDR7GCO5QHVhE889TaxvpbMI9tdpXAwqA
X-Gm-Gg: AYBFou3bM82zul6CmwkGHqRF73lBkrxgSUKsVujAiTF2BuY/FkICMSyIVThI89sgBSM
	hADE5+jRvG5/Y2YSwFxvuF82YDfT+DPRb3x5Hz8aqeVRsB0Wi4GCLyoVismHzqcIM75LPtcDG9D
	TgnA7QLwiCGnZhsdLxak5w4beiVp3ISeZlNjOml2h5PxHRKq7d3nt4dOlECPLQHi9FHpr4mO65t
	5sdVGLPvCyuY8Bo9evB2m3oT5A3MIRbOJ6VtDtW4okvj8laSMTqDkuZXwJ97NXvm+OzvvHaQURT
	9bApKkCIXo9K5f15hBSAhSWVo5ilW2o3BkKTH8X+2FOS8T0FgQ0ffVtmZ5z+2STVdvogqQQt//Q
	TiaUWkTeWVzKXGKjqvqwgGSRJV8EPi6bhaMSuwZ/gQNVR1LMF7DNsTEWQrBaPHq0se10yKOs5gz
	FHBB9Pskyi7heQoARadZmku2qjIx4iG9t06WE/ID+cpMymspT6t9y8wytt53Niipf0oxxp+72TW
	mvzl5OQUMyeGgKyJb0KNQ8g1LEuUS5TfXMgrrpA0bKwDRxDpZ1yo4CLcFKpc3fisksUALzje/HR
	hnp7IpNEkAXOvV81zrZeAEA7YoGLivcVab1vtMhBJpbk+OOvAhpwzJUEnRIkOHJrPbH7OzhfBFW
	OHyfcAHBk4FP38XU41IESCVV4+P4sexf6ZGDlhRlbf9rkR7Iu
X-Received: by 2002:a05:600c:45d3:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4b6e0454e58mr79432555e9.35.1794034817950;
        Fri, 06 Nov 2026 23:00:17 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7a0e1f298sm31506415e9.4.2026.11.06.23.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 23:00:17 -0800 (PST)
From: Vecheslav Filatov <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	Vecheslav Filatov <harepro29@gmail.com>
Subject: [PATCH v8 0/2] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 12:00:08 +0500
Message-ID: <20261107070010.500128-1-harepro29@gmail.com>
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
    the Developer's Certificate of Origin (DCO).

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
 drivers/input/joystick/stinger_rust.rs | 191 +++++++++++++++
 rust/bindings/bindings_helper.h        |   2 +
 rust/helpers/helpers.c                 |   2 +
 rust/helpers/input.c                   |  22 ++
 rust/helpers/serio.c                   |  27 ++
 rust/kernel/input.rs                   | 253 +++++++++++++++++++
 rust/kernel/lib.rs                     |   4 +
 rust/kernel/serio.rs                   | 335 +++++++++++++++++++++++++
 10 files changed, 854 insertions(+)
 create mode 100644 drivers/input/joystick/stinger_rust.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0
