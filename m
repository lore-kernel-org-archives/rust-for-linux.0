Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001413;
	b=1VCD1xFbf1s+KR9XIfVwIaWf9xIsgGNeywqybfDBZXz7bhrYk9BXLIjPyR6X7jh9WTia
	 35P662yjCT+eOaCKHjj24fyDCoZBSmmCP9/iNuWfW9P+ECucs0AxUeeGHmZCt0luJM/KM
	 GOfqmf46K+t6vFx60DiRr0sf3aya4RbPdspchFlFgHXd7tOTRGhE/t0yY6H7+gPAb7IPx
	 TjXcxpOR4G5i1vgQBanslGSMvDEW/HseFfKz6ATo8RgqgydQ9bObG/lx2Wyggu+k1Y9qG
	 GAtwT2dks8rH2nA+vYVCwCil2R0dxcC+AXmXl0ePmhO39/3QukEuTNjiS4RbLFjq1YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ULFZ+Lz5JFNxqhOdlYorxY6TtGyrAFixmkP/y0AuJlI=;
	b=CKC47HUMWhFhFKz0dr5NM7o2b4hfIKqk9okj0o2ESD0Gy9X9BlRzY5bK6q9JNks8BhYs
	 ehU1SZ70O7M+wRszob25PZpbRvKnkv+hL4HX+IiITbY/YFPPTaA4L822Apy49KNwWMWHU
	 IvG2Ou2pnsUrY/bZASVuNDeHTvx0RkLRKYikOmoR0PHwwySpdl0N6XhYEf0/46Hbw/+gz
	 z9kEsIuX9pTucx3bixlL7H8mqm6T76f8d/bxp+1KlIK+PJF5pbQkhBwq9Tl1ZC2pxZEJE
	 /aqxo9lSviUcw/tg9I7KpozS7vMq9V8juXiATqZY7P09b8H8GaMieOMTR4hQFoZ9V1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGrY5ycN;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451B606A329
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 21:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7451B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGrY5ycN
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso56368f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 13:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794001412; x=1794606212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULFZ+Lz5JFNxqhOdlYorxY6TtGyrAFixmkP/y0AuJlI=;
        b=iGrY5ycN0BualMftXCT/JlkQ3Y+E1QacH7fowGjADHRbF7guYSi+S7CvtTVrhQxCMI
         E16U1pmmaz5yzonEqVxUJ6I28G3vPuDXsGKlD1hkBirfUTWxT246HPDevqLd6HtwF+Bl
         YYmUZtb2636+/EziBwCQwqBr5Cds5v0b/msQBKoH5OEG9QCuc7Hiw6dJKD4UaryU48Ld
         595N+dJiJq8qo75u5GfEJVyDdM5cb4+HXIvru9TuT5AdblD1Nr3DtAMkgMDX0kkr802y
         8NMh57kJ8fBv/AXOWVJA3r2pPfZeLJmCZt92QT5VCjcSuvOwUvim1FijrRMJ0n+j4YuT
         udLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794001412; x=1794606212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULFZ+Lz5JFNxqhOdlYorxY6TtGyrAFixmkP/y0AuJlI=;
        b=tknFThboh4pBytz5BBOZ4bFR8FCfZ6g7Xjiy9YHHmDeVjMuLSwzlFdGH19a+CeOk8d
         iTKL+0zxkS+W3aDxRdursmdkfCYAScfxgiTiwdI/cswnFVpHfr+a/q2zhafNQjx1E7o2
         8R720FS04rfs4RX4FFyujeOUBfm1TYomIRrl6H53hCDt3r19RCXW05leKYDUiWwp56pm
         kMxDl5P4kVLLc3w+bK18S9na7By0doeY8IpCMZQ+Dy++fXQe733a0IorcpTzF7ZOPF88
         71uLn+x/JRTfebvvnbMdC+cGDNiSOw7vk/+VfPIg1IFsRdgWNJYEUzjqCxmRWENO1mV5
         eWCA==
X-Gm-Message-State: APuU4Z9Fz6qbbXYl83atNe5fFE/CdfsZNRYWrwHzfU6IQq37SsT97HkZ
	L6xz5zRdECUreeMwRLK9CKq/1T0IOIFHZ5NC4MhOR+uUProJac96ZIIEzI9jmoP80Or9dARQ
X-Gm-Gg: AYBFou2So9PM1/CnWw5wUFjSYsNYTj4ywNpVE9l51wsjdFpd/Flylkyzl7GVJC7rMhF
	AMvhW2EMAGyBV4YnBg0pNxXlmcDgRAfQDT58Rd3bg+qF/1GuqHKX0XgvV+zla6l5ZJ24X/XvMnl
	5Qnq15GHr69eKMCFNXdMFO47KeegZ7GAPVvPTca0fF6XpzFmWBQ2eVi5QF0gTZ7NcpNEB9sScyp
	aLvBURz0DtyG4KHz4C4hQUGu9YRK5/0xXLhoRM3efRvWNzUArMjnARkXnhdpwhgGOlsrMitqtIh
	Ov0MmgXRY/Q5KLcow4tWGpW5eoPtAwRIRuuPNm36vq208rfLoDbYXKH5ENOydqo4tVBdHrBAK1U
	mkEAM3OuUcxe2RDLShm4885AOAiDPBrvmOWmK9EZKegWLjZpOXtT8iP+IRFBO8CBzOc/Rxul7gq
	OsnqobD9Ip++r4OYTYc8DzJGAqcrddph0QbHGTwi6mQsC0/5yYjbt+GUhzPA2ifeGxYAzN0TZUW
	9U1cZvKF0ZFYNN8IFl+9WpwwImdxE50HDm7XWbn+gk6vn56s6hNmoXjozwDrwkixxu7PzGk38Ke
	0cCAh7EsL1tXkTQx15Rl9voldAtnnk9/OLWWdABatTbGJ+YE1ATNgS6V08YIUYA1lnn2kiK8H7b
	vve2kpL7X20Bp2wBQDON0coEoa4GGJDPeMcHv7QbmDNcqtPF1
X-Received: by 2002:a05:6000:2c0e:b0:491:e477:6820 with SMTP id ffacd0b85a97d-49421bdacebmr415904f8f.20.1794001411624;
        Fri, 06 Nov 2026 13:43:31 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6187sm5799505f8f.46.2026.11.06.13.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:43:31 -0800 (PST)
From: clicedvly768 <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	clicedvly768 <harepro29@gmail.com>
Subject: [PATCH v4 0/2] rust: input: add input/serio abstractions and port Gravis Stinger driver
Date: Sat,  7 Nov 2026 02:43:20 +0500
Message-ID: <20261106214322.421869-1-harepro29@gmail.com>
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

Changes in v4:
  - Makefile: restored analog.o and db9.o in joystick Makefile
    that were inadvertently removed during previous revisions.
  - serio: eliminated concurrent borrow_mut() and aliasing data races
    between connect_callback() and interrupt_callback() by initializing
    and registering the input device prior to serio_open(), removing
    the problematic start() hook.
  - serio: mapped interrupt return codes via bindings::irqreturn_t(..)
    without referencing missing bindings constants.
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
    AsBusDevice, impl_device_context_deref!, and as_device().
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

clicedvly768 (2):
  rust: input: add input device abstractions
  rust: serio: add serio bus abstractions and port Gravis Stinger driver

 drivers/input/joystick/Kconfig         |  14 ++
 drivers/input/joystick/Makefile        |   3 +
 drivers/input/joystick/stinger_rust.rs | 184 +++++++++++++++
 rust/bindings/bindings_helper.h        |   2 +
 rust/helpers/helpers.c                 |   2 +
 rust/helpers/input.c                   |  22 ++
 rust/helpers/serio.c                   |  17 ++
 rust/kernel/input.rs                   | 253 ++++++++++++++++++++
 rust/kernel/lib.rs                     |   4 +
 rust/kernel/serio.rs                   | 306 +++++++++++++++++++++++++
 10 files changed, 807 insertions(+)
 create mode 100644 drivers/input/joystick/stinger_rust.rs
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/helpers/serio.c
 create mode 100644 rust/kernel/input.rs
 create mode 100644 rust/kernel/serio.rs

-- 
2.56.0
