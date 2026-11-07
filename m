Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060724;
	b=x+3WVHnw8g9i9GyrTsUP4IVz5ALwbx8GcXoocVqJ6BFyou1yJxKAz2n+yt6V1fsyrZJj
	 hfEzB6rZLGGEaYLNGYZfSJ2A3vI4ZFiyjYY4PNWTDrqnQPXOTN/1YtP+Q83aypxFiLQeK
	 aumG+DS+OI7MkMn8Phrt+lhBS7XeBv4yIsIQEx6cP+QJkyQN5OOHKYYvPaTe8adEcXI4Z
	 sSlB7WuWDRCGsaNtdQnDSLpuqbMGAkX3URo0cGGat9NwJxDuFAYzVJJCgfk8XLYD6TF9T
	 yOu4bmnNoMwORPzoLl+FVpoV91Rhg1/77IAwmLeBWN+mPfy+ehPQPJ5xn1/WFAKoBFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=N7oNzfxnPM1b9iq8PjBkau8djf/0wkMbcjPct0Hzu0M=;
	b=ecdYVDBuuANnTHDunuut6x7AyasTPWZQ1AYeWTOp5j3vuZBxmwJ+GXjt1qsqAWzzV9I8
	 fz7hKTb0FBzqszfGLkkJreZrZ+DdvysF9gVrp69skk03OA+Oqr+kw6TLfiPBZt7zb2ce7
	 7dm3iRMZLrvWzch+JxklGOr4xLGRC+uKJLR2L4H6d3PPS7NH+R7mjP4IlrhhnwmlHd65Z
	 ycDqTwDkb0HHd/9UyAWojQwXID3O8OaPjqCJh9qMXJNLIYlej/I2NZpTteUsF2GepBxtH
	 5ZEikAR9odPjkrgnCU2xs00gX9bAbqozOv2HVgToz2DDH0OfUg+zzlM8lC4c+OutIdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LW4FW7cD;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034DE606A32D
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 14:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 034DE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LW4FW7cD
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso9459205e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Nov 2026 06:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060722; x=1794665522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7oNzfxnPM1b9iq8PjBkau8djf/0wkMbcjPct0Hzu0M=;
        b=LW4FW7cD+jZcHT7uQVYRyo3ICGNS03dPqayGgBVmcrYdpiTkCln0qBqhDm+abH3url
         iCg19+nIrV7WTLeDG8XCs0+Ohd/I0APYJvnKc9ztJZNgEqUBi8lThtOq7UshZeaB2v+K
         EQ6FndwVnxEtkIb4l/chDZEX4DRTOCYU3RAplyfSuEBG8ooPP//7qnv0ZgQuhbFje+f0
         NYgncEAJq7diCAWSDraKPWefMgQHTZA/B5/+gZrjQE43NlW9hLfaUuZA4Nwt13urKl8K
         0omQF4aiUC5FZQPJLrI76zh58NcJ42Wc9Q44NyuRO+wmFBxRL+KVgpTsq17HJPo22/ju
         I5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060722; x=1794665522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7oNzfxnPM1b9iq8PjBkau8djf/0wkMbcjPct0Hzu0M=;
        b=gypml5N5yxrE/8XqXHkdnQWedjIwH/FqqKFtJ1VEWvgF063BcFrTVgonE+1oguvNkr
         CTyq6OoEK+QDkpLgOBZalCODk9v0cyHHg1+zYnlFGJA76+Fql+LsOqpoFSGT8ID5ZkBk
         OwH4CXxWA75aAsaRKfmjYXorq8/kE/XVyMPdxhuT8g9XUZqlhgkmtLcWz/c4MmYjvzSt
         +gaP1rDzGFKnPjQt0OevJ9E4qQjApc3qWP7k92YYfhZI51j8opDGHz/0LSy53c8IFF4B
         sXasaoEdYAKJHEsBzVM+U0J2ECwy9CIv7elBWuE1E7tGAu8hhOyuAgqKFeeVIRzlFzeN
         A5Ow==
X-Gm-Message-State: APuU4Z+mHqLG+L8uikJQkMbUkjgAmwGLW+px7XDfxkoTbxw6RvG2H5c3
	NaBhYgNWk7sxk48ecU+rdUd8sj1UfZ4B9if8o2O5C4sMSClJIr/QBOPks4ktwfYkAY4qxNeh
X-Gm-Gg: AYBFou10tRUYDVjldV0wE7rSvpFit8lR5jk+drimX2+oeFoX3tve3tSQBec9ZfvjXbj
	nVC0vNhELQ7coMC0GWp+HMCXFA4kZelfn4CcglMUr8/9tuGFr16riJjPk7/zRKtNoYIh2K0G+ym
	b9mesX1Rzqbob5Pc/Yo0KwfJMC0xXpZKNHjHxOvjgOelceE0OmOUTWzpuZhbtGar/SL8G/kTE/m
	3o/ZzpFQvhLRfVqhlUwetJNS0AV28Qk4k4SzG+TkhtWhE2VHsLmr9Y3CZNMMTaVa/J7xIKgJ+QL
	X1w9KJdtYo9qEGxcbg488p9mue4lH6ygoq/bPeuMYAOXwZCAG229Cf1P8NnDEBOpz7GrA38mc2R
	7P127VNYUw2Nd2fu3jp6I6rTqAwfV1kvkuDgrTb8M5HmelCM3E1JcHwE3h5fuY8sXzKHnI4+IYn
	CHGooDyUbLFJjT+mLaCPt12ZXyRd4SytVCGo0k1pPICkxb8kWdj5XcG0pZQ8F5+ezSh2E5CsWEd
	eC2ZvaryJxMHINupHd0fxwqxXnQ2SqRdon/qDbPVEDkm9ap86Le9qoXDaZHPOCOgGskChPYX3Ai
	WuZS4RVOMpoYXk+Td4dJM3LTke0oGb8j3xYe0/TbD9v6ZOmW5OKUokzzxSj24ZVp28p0ioXG+zU
	ZDQ5ADsNKlo72x/O9iV0yrymICP7layxQRq0Q9fBVW11IXgMt
X-Received: by 2002:a05:600c:a015:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4b6df028f04mr101869655e9.14.1794060722177;
        Sat, 07 Nov 2026 06:12:02 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809dae9sm9313327f8f.52.2026.11.07.06.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:12:01 -0800 (PST)
From: Vecheslav Filatov <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	Vecheslav Filatov <harepro29@gmail.com>
Subject: [PATCH v10 0/2] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 19:11:54 +0500
Message-ID: <20261107141156.591711-1-harepro29@gmail.com>
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
 rust/kernel/serio.rs                   | 331 +++++++++++++++++++++++++
 10 files changed, 850 insertions(+)
 create mode 100644 drivers/input/joystick/stinger_rust.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0
