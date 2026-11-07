Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030004;
	b=hbzogSbrGkPK8Vy9jMC66D7/NHCbMZkvMEPDIY0XW0Q9R1SdJNpSq2aPwJdwP5dR1wrJ
	 uoDO2BeArVoDwK9PbMDTEC8ZYyRPL5a3NUyGCENUloOyYR5ZnhBIXH9lk+IQKy3fVsJ+T
	 C5ryuZ/HhvuvGlZlt+oq7s3NididvpqcPvrD/EcsfrQNsRNyv45YfjVgu96LDRQAm9kEO
	 YjJ1TvR0y6QrgS13nWGXtsOBz81Ai58zC9KMMo9USiMheaNiNWDCSN+8FEGf7GGsGkLiL
	 JHGjmJiTbzwCgAuioMlUsILeKbQ3JZ3KlM08D7Wc5pOhZcSHjDeImGRJecLT2O/XApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5annG2fvVlnsulvtrTFDzAUzwH4cadPN91b6RtVuR1k=;
	b=kMtW3iqlCdsh0LXm3EC6Yks0r7AeatFwOXr44Vp5nkIOtpMw9YI7kAsNIjWF8xPli1R3
	 jl+dtQ4TrnbmVZq56srekHQ4Y9LUV0xqt3lF8CacGlQ/veoT55NUhWIgWRUCbThLNqxXB
	 09jTmAZokhHdChDYMs5hauxfR7BN+rg8dnB/BiF3ijaC7HX1hoODXeiNnJmBIjNklFVtI
	 s6CYR90eP28IH4IVLyqVam63hXhq668hE0rq/t3ZM6nhuogLEFXpGYcxj+JVJkV/AD2fr
	 lcfgSfqe8QfRKOvfRukogO9sKiMnbWCG1RZXfav1FB2qSm9Evh5SlA7Pah7UCNruyOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hExX9b0A;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83D606A32C
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 05:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C83D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hExX9b0A
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso8138355e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 21:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030003; x=1794634803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5annG2fvVlnsulvtrTFDzAUzwH4cadPN91b6RtVuR1k=;
        b=hExX9b0Af+UmHkztr6jmVgIRovMHS/XWW0pYuXiml1i75KIHgDGnSRx2ILMynfoa+Y
         DCK0R+J+nANMRLR/PyF8L9/xyb9sB68+FhzINOCvGmGof1RiWB37RkbEML6tMxdlXAK6
         +MH+fBP20NxWBGkLzQ0fltN+KckJt9PwN14DGVYbZnkalxSITcL22dHTX5MordUYqxGw
         86o6Wq/X00TQLmojrvDD5yDoJt4BybHZijKHNZHgqxxgP4E3O1dWU7GR3gq5z83BcuVO
         Mom1WddpoDZqJTndITedgrtlramzp/0yt63WbdM+dQdVqNSou1R18ZKpNsQiBMbuHrsa
         yZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030003; x=1794634803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5annG2fvVlnsulvtrTFDzAUzwH4cadPN91b6RtVuR1k=;
        b=KTpL7SkuahD/lBCSR0cAMdRQ4q7uQtwfBW5GpKxmE4TP2ZxUKecpc51ekq1Ns8n0ZP
         MBFQAeRmvnp2nfqVX60nIEYyV1Rn69N9OSYxTYZ3gGq3NT/CI3DDSOEIXzGZaDLW9a8V
         CEEFB9uClE6/9f7Z1NOuhMgNv+RUo36daiUp1ozrwellSHiblANRpNe3ZyFjJwQgOm7b
         2gFOtlHMlAjdxjxhpKYgKCZ/6ucJ1uN1hmbevbkl6ICF74apMfqsBmaEpGO3uBTV5d9t
         Rbbs5DzzAo8lYiM8tCL3q5Ca2h4m1F8vINhrDgU/Xs9jeaJfshamA2v9CnzrnFA4IOnV
         23mA==
X-Gm-Message-State: APuU4Z+TfeDqGgqix64QvsJfCK5jnIgekh74IvI/sSDxA47XG5ccCZJf
	lDpaewFVEPhrOaGF9uiXG+clSxjIF52EE2Y9Lsc/e/CjYOoW+Peu2tWtBBKxceCCuyXMMTZR
X-Gm-Gg: AYBFou2M9hFSqFa9ToC8TJav/OMLVnWXFQz8b5B2Uv1kikewNySZitjfld5r/nA89G/
	lo/P/eqYAwnUHt2QdtxKFunVvHypKO0ihfeMcf60umhDr1d2x9cm2D4wMb7OxA+KYVZONcndPe0
	oigH72sNMvlxuxqXIChQohHdFkIzAZ3oCCSZuCesKgn8OWpzdi2gjqWHeCo9N0OLuWflFWzEEgw
	PYsKKN9xeQ4Ytcf8JbLmdTTpFvBGlRmovjsN4YYzfNsEoOK5NEzTNSO3RczQoJBfoT4mTkh1HNu
	ODW9C+GeU9MrjGEb2Gqmy15IFW0ewh8DCkcv7i3e+IB5gfTGwrg6HZ+JZDukYFtXdtAcTqDkn0C
	qqrwLj6lJRgMeGma2o4H6np5vNH1ioy4fOWU13pB9Sgd6mNkmG2gIj9v8DYG1yOP2zQV8O87PWh
	Klcm+MatTS9doaQe54URhgFTzp+IbMNGN1ICe3d7SpY88vcBzj5ttEUPNMKNgUcO1BHB2KXsdgm
	PL3L+KJT1Ud+GadncwRZwJq6iNZncKVvtu+RvYzbxMJJonUYUbVdLh9T6kAVlru1GnqXw1jaiZn
	Z1r8xr2Le6gRGcwAGcXcrzUyysuYqkyiAXJOng1EDdxsMtzajj6JepPB1+dAwadWoigeatt3vX2
	+AwywwQGlNnq7qIywcxNBBy0g09WG7O8LezTF27eMfj57bzrW
X-Received: by 2002:a05:600c:4f4a:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4b6e017248dmr80520265e9.30.1794030002378;
        Fri, 06 Nov 2026 21:40:02 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7bcfcbfsm7712057f8f.43.2026.11.06.21.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:40:01 -0800 (PST)
From: Vecheslav Filatov <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	Vecheslav Filatov <harepro29@gmail.com>
Subject: [PATCH v6 0/2] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 10:39:51 +0500
Message-ID: <20261107053953.471972-1-harepro29@gmail.com>
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

Changes in v6:
  - Developer identity: updated author and Signed-off-by to developer's
    real name (Vecheslav Filatov) across all commits to adhere to the
    Linux Kernel Developer's Certificate of Origin (DCO).
  - serio: eliminated constructor function-call syntax for
    bindings::irqreturn by directly pattern-matching Driver::interrupt()
    return values to canonical constants bindings::irqreturn::IRQ_NONE
    and bindings::irqreturn::IRQ_HANDLED, ensuring flawless compilation
    across all bindgen configurations (both type-alias and newtype).

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
 drivers/input/joystick/Makefile        |   3 +
 drivers/input/joystick/stinger_rust.rs | 191 +++++++++++++++
 rust/bindings/bindings_helper.h        |   2 +
 rust/helpers/helpers.c                 |   2 +
 rust/helpers/input.c                   |  22 ++
 rust/helpers/serio.c                   |  27 ++
 rust/kernel/input.rs                   | 253 +++++++++++++++++++
 rust/kernel/lib.rs                     |   4 +
 rust/kernel/serio.rs                   | 328 +++++++++++++++++++++++++
 10 files changed, 846 insertions(+)
 create mode 100644 drivers/input/joystick/stinger_rust.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0
