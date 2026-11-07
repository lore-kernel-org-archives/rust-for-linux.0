Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033330;
	b=I/z6UnSrhVt8pZfmyGlFXfZh9qVkYi6s2lKq/qF0yaImbDVRC3DpcN7bzo/fBFm2dHV4
	 5PLvd//FH4UBJ8WSK1+jjDXbPuCehoklAiu/LGBzSXPKh09cTLxEgpras1C0+zjRV/D5N
	 1D0wT5C3zFsGAulywRFnlqHgpzqjawTRlDvN7eMTnZNc566ZNK0rVybZNtodxOQFo9u3z
	 2Olgftz0yfFTtX5kd7P2DL4dZsNU/Mcu2VgkBmmwX9aBL3bsVwY59T6PS0BJx0vkiesF4
	 5bXNVNtuu6M2KqeaGdCGwGlax3yBENvKxal17D3TAVtoKC45lqzlq+1IMSQmv8/8UaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PeiovD1XuxWqfD0XNRLRX5QSPyRdhh58GujWtqQnqv8=;
	b=P5m2x8/FcQ6M0u+nT6lYwjMFuEIROc602zy+1/ELizKEVN748F+xvX7SJtMjRcLC6Hv2
	 GwuGViHKlhqxEzK/PNCZn7pE5d0bMoRJSQC3hH9HWU9TTctV7CM/dHrX63F6kH+XnQAPn
	 D49A+R8Pd+LiOv0oqXjmI8ptMVC2DsSdYhy8BDv4rrgnB2AZEAHsFAzAn+/er7ORwNm9w
	 6L1RrpchH/m300x6f0pGRhHdxn5XtOB7E8GF9GKQgnrou6uUbIJYzR8FxjvSUXrIPqwmi
	 gdxGVTN8d9uRvO1KFinfEbZJv7ttggUvTFNfFPGZ1i0tfBkkvPsNwu0s0UgzTXvTWZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VvQikJke;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B81606A326
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 06:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B81606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VvQikJke
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1168356f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 22:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033328; x=1794638128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PeiovD1XuxWqfD0XNRLRX5QSPyRdhh58GujWtqQnqv8=;
        b=VvQikJken5svri7SHXvAT/PYxOkNvZtbBdgZs5xawzzM7a1AMG447LWNThqA5rPef2
         vTpNnj6/l16jS2SXlbeOFX3ZWFBqdrGjtqvAkZ8dQq2Y5vgnlVQrcAyVon37h+vrfkI6
         V7BrMMjrn22kqY+/WNBCJN6Xn3F0Z+cYKmz5dZtRkI743tBb01ZRzcBvbgJUaHkjeo/r
         cvtz5oqHpFYY/Y7a29TyWSOeoFYzYxJmKXnsbkGWEh920HQ180vA28T3201MM98WHnLO
         6V34HoUUsarGYbxIdG1L8HipD5mnTLS9tmXnMblezhQ+jbhOcr8N8yEFsggK2hT5wHLT
         E42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033328; x=1794638128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeiovD1XuxWqfD0XNRLRX5QSPyRdhh58GujWtqQnqv8=;
        b=moIp+L7k8xaqdoihFKA3kKp46m2kNZ0en3jQ6VOHExRy6t3gzzqN3Ne0mwtkcaCNnv
         HSwU1rISvbyiT6WWYksPkQDipQs6Lh1sJmEN6s1oWA2B6eK9qzlFfSStOfSGCwZMXv+K
         Yi4qz46Sn2XgG7C/by9Vc14E2itT3aNRa3iau5FuJ8th2BdGPWx+e1hBB/9TnNyv1o6c
         HRnVb+ZC9DyjgE28DXsp3pdAM2DkLQuY8W9MYaXQTNOVtJudLwhNgV0pzv+nlECjaBhH
         Jr81syYjSwKya1yO92Ycvikm1DOziJq+CNBWV8FqfcEhyZozN8eWhOupjAWnuSX/pK0d
         8ZmA==
X-Gm-Message-State: APuU4Z9TKk78nj+9IqcQpPYfvZaT400rdk89SikxBfeFqeddgMtyItum
	8xJtss/D6BRczSjzva00gW+rafccNTfrbKE2TA2ka1tVlzHpj3L41iq6
X-Gm-Gg: AYBFou0/DBeTlKke0c99BC5tQK5Uo8UlTbcqLUHUh+VAdEuDKZ81GofDw4dVq0AWf6F
	8HPhDBW/n/L1ofJuVG2/O7gW+uVgk40y6f/fLRfHHk5p8vv8EQYPTem/PtPF+n5Edd71k7XOhwF
	/Z2Qbf9g3f1n/OLdiKdGgnSQcHM3NGcV+Vrz8alT9oFurGXn+hwjkTuB5ks97RRq0g4aLQ067SX
	vSEFcrF/wIvwhtalnlGS8Y1FL4SbwTsNuSG6BUZfhSB5noPSF9KzTny0+ouX94Fzu9KqoQFPqzf
	0bposdkEbLsT7/YGAdC1XpIHDPQj/AiUpRmVz4qC9ISUtBEqNVPzYxNJAvdUP2v8R549Y3aAttb
	XMfugkKaKe8WCv69YZVIyqGC9eBNMUyH/UQZtK36Nu2sxwRTd08LLE6YOiWxCg7/PWsq9rL2gPb
	xWSkRBUccSODHzQcaYhnNKjMVEJ++p0z6sqKMuEHfz5Gv27gxxKOvbeYOECY3sEdGLxsyIXLaWi
	uCq4fFm8l4AVFszErihjb9E25nO3ROkXg4+o8gWwZoitMWV+Wqttyme7P+Q024cOrfW85MvZwCL
	WlIwyCM9TW4lUaAEHrTkYv8PF+Z6gm+XnucefDhgJiFMGeTgvrekkao46LbVSh0c6+NZENeyM2n
	zrTBN9IvCWgT4N16D0ltiTMmyExYOTnlhQSNmhX/hoodTDW2b
X-Received: by 2002:a5d:5f04:0:b0:491:68e2:bf2f with SMTP id ffacd0b85a97d-49278174603mr8568203f8f.52.1794033327979;
        Fri, 06 Nov 2026 22:35:27 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d837e3f5sm7916903f8f.56.2026.11.06.22.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:35:27 -0800 (PST)
From: Vecheslav Filatov <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	Vecheslav Filatov <harepro29@gmail.com>
Subject: [PATCH v7 0/2] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 11:35:17 +0500
Message-ID: <20261107063520.489958-1-harepro29@gmail.com>
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

Changes in v7:
  - serio: updated interrupt_callback() to return flat constants
    bindings::irqreturn_IRQ_NONE and bindings::irqreturn_IRQ_HANDLED.
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
 rust/kernel/serio.rs                   | 340 +++++++++++++++++++++++++
 10 files changed, 859 insertions(+)
 create mode 100644 drivers/input/joystick/stinger_rust.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0
