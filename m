Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9816233937
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047692; cv=none; b=f+vtyZUWFefCrxWnkjC1pQxQV55hCihxn3bBiQpAzZgjicrtkBJv6FSvkoicQZ5HqTdbfL25QI5IJqZI8ZtEPwiUcT//4XajggcpXLkSuuGZO/r328ziT67yXj05JagbHho0Gpbjni7TJa3097Z+pL7dcc9r+inCnP21Z4oeAsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047692; c=relaxed/simple;
	bh=bTT3UewH84oFlv+N91pARaSXy4M1clHs06A4Qw65npk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAUN1RToRP9Wkx6Vw6K5BGJDGSD914cI5tAO6FO8dL0vKp5qjXFCi4Vh0T3vLlz6/M0FPKKoY2+nk5rvcbOoBCdmJV9cjXW0iWzpx4vdrngqzmDwVrl+uFfaAzUMx7+11blNcfYhcdi1vPUWGmzFdxk+3IsgNIfRU3okEi7koIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=yxOymGny; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="yxOymGny"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b77b150aso298235e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047689; x=1783652489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pr/YmJjDdgpK4Qlz5+9N1Q+bYdAf7XuFT6hP4TTZuSg=;
        b=yxOymGnyP7cRwZtVkp2F3iobxcrvaqpQODvKm/dahyvplVURdPynxi1+WyoOz4nBE9
         IzUHq1i2gktL9RZ5K1qjqSggnzxDsTu5AcnF6ti0jqUFEcE740GzPLxoHDdTL3GyS/+9
         wLcJ706qjCZZYkfZlGv7SeqfR4IO+NGK4dxsCv4A+E+kn40/6Q4h0xw1FAnpz3uWeiVv
         JmKgh/9Y8qCJo8lH9r7a9yu8vcuA1av7xbGjIrnhTpJq0Dxq1aw/y5FP8NZ9q+NqH/aY
         qviQMZWLgbyYDqFJMXDK1zfSr2CPcNoxaR+6frhSHnSVlYIscwdgiaC2TDRQAadDlACf
         v/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047689; x=1783652489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pr/YmJjDdgpK4Qlz5+9N1Q+bYdAf7XuFT6hP4TTZuSg=;
        b=oKzppeVzFmTtjXHa/G/kudE7xxQap95VzetKZWuRa7AY5WWmkFbM+Gfc9SVcHisduF
         jzflTjwAfUmL2C9MbMQoMzQyJG6CbjD8N9hr4vtxp7tgh4ygSBlTVToZ/IIm3hWl3dCb
         7HasLt5xsecZZ37sQLE7zXBKzgk4qQulUr+Yq/wjHi6phsaClF6zxD3OvQ8s2FCIPJFw
         RvhcWNAB23zhaT52k8OFieY7UCV549Wr8nsOAhRWUsxeKha9WggI2WNMEdPv36btXgf/
         td48XHrpwucVX2gQbP6jcRpiD0ISICWsfjeHQvF5Evd2rAoncGri0sR6MlP2yS0VYpb9
         X3Gw==
X-Gm-Message-State: AOJu0YzStYA6NJy4WqQ29SIBK57gcOKhgVH055OtyLWkJfkMjxfIDnDn
	G4OArFJ4EKWBbrOpTLp06qDqisGzA1TfNOPPpetwWdyh/qR8V7WW6T3Fy+MtaOt82uVY9iy8f8/
	1iQgwOzRV
X-Gm-Gg: AfdE7clVAHv5t6oxvPaPVXe2HaVRKu0OVrgAPXAFtVreZISoP5cw0x+bsPxKOal/Ydl
	AacUlNQC5TbI2LkweY6RjO7zvRIZw0FetxaTmcxIj/6NLcvY4zmFtCTb2wRiOJZRPF23UvvrQC/
	OVT8RImV2go4Gn7hTmRNAQ2832BR9Ke0Td+cadE8bp8YpwP9zCLv+V/sdR7+4zR+qgvIrLH3dd+
	sCSLWIf+JXbW5nBoT8DyYvfEEdKdBqYJO/zgHO5N++nR0z14sfywtFrNKM/xauTLzUeccllUl7c
	V2MedRrCCT41OfCIgfSZljMwoo/BNkxO4tMv0GveBrJyTcCbn19Tx13Uiqa/sIjJOGK28QUSsTQ
	yf1FTaL2ORciK0ClnrNzUdQo/PYifbZXHMp9+c9tJgKJ2H9lkAD4SH29mPwT7TH9MitWDeP5ds4
	UbDB7Q01t4ehmXWuw3BcPkQ90UpNA6fB/0BFXot1Q4rLrRjIrZ79wLzEdM
X-Received: by 2002:a05:600c:34c8:b0:493:a5f9:d345 with SMTP id 5b1f17b1804b1-493c3cf0a35mr114126905e9.26.1783047688971;
        Thu, 02 Jul 2026 20:01:28 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:27 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 00/18] rust: drm: safe KMS mode-object layer + evdi bindings
Date: Fri,  3 Jul 2026 04:00:47 +0100
Message-ID: <20260703030123.2814-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260617150232.2210-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 of this series took the "raw C KMS + Device::as_raw() escape hatch"
route because Lyude Paul's safe Rust KMS mode-object layer wasn't
landable yet. Both Danilo and Miguel pushed back on that in review: work
on the safe abstractions instead, coordinate with Lyude. This v2 does
that -- and in the meantime upstream itself moved: drm::Driver's base
trait now requires a Kms associated type routed through exactly that safe
layer, so the v1 approach doesn't compile against current drm-next at all
any more. Posting the real port is the only way to keep a KMS driver
building.

  1/18 rust: drm: kms: forward-port the safe mode-object layer
  2/18 rust: drm: kms: adapt the port to current drm-next
  3/18 rust: drm: kms: break the Driver* trait well-formedness cycle
  4/18 rust: drm: kms: build the kernel crate clean under -Znext-solver
  5/18 rust: drm: expose <drm/display/drm_hdcp.h> HDCP 2.2 messages
  6/18 rust: drm: kms: add a Framebuffer::vmap() guard
  7/18 rust: drm: kms: add safe accessors for common state and modes
  8/18 rust: drm: tyr: add the Kms associated type
  9/18 rust: drm: add drm_event delivery
 10/18 rust: drm: allow drivers to declare ioctls from their own uAPI module
 11/18 rust: platform: add runtime platform device creation
 12/18 rust: drm: framebuffer: geometry accessors, refcounting, byte-slice vmap
 13/18 rust: i2c: add adapter-provider (bus controller) registration
 14/18 rust: add sysfs device attribute groups
 15/18 rust: drm: support hardware cursor planes (sleepable event delivery)
 16/18 rust: drm: add CRTC gamma LUT and plane rotation property
 17/18 rust: drm: kms: add connector detect() and mode_valid() hooks
 18/18 rust: drm: kms: add plane damage-clip accessors

Patches 1-4 are a from-scratch forward-port of Lyude's rvkms-slim safe
KMS mode-object layer (CRTC/plane/connector/encoder/vblank/atomic state)
onto her newer rust-stuck typestate Device design, which isn't in mainline
yet either -- see the companion "rust: sync/drm: locking and
DRM-registration prerequisites" postings this depends on. It's a
mechanical type-level port with one real problem: the ported mode-object
traits are mutually recursive in a way the (then-current) trait solver
can't evaluate without unbounded memory. Patch 3 pins the associated-state
types to break the infinite projection regress; that trades it for a
coinductive cycle the old solver still can't resolve, which patch 4 fixes
by scoping -Znext-solver to the kernel crate only (core/alloc stay on the
old solver, since core.o ICEs under -Znext-solver on this toolchain).
rust/kernel.o then builds clean, safe KMS layer included.

Patches 5-7 are what vino needed once it started using the ported layer:
patch 5 re-adds the HDCP 2.2 message-ID header v1 carried; patch 6 adds a
Framebuffer::vmap() RAII guard; patch 7 adds safe accessors for the handful
of raw drm_kms fields and helpers a real driver reaches for
(drm::Device::hotplug_event(), CRTC-state mode(), plane-state
crtc_w()/crtc_h(), DisplayMode geometry getters, connector EDID modes) so
vino needs no raw escape hatch at all. v1's Device::as_raw() escape hatch
is dropped entirely.

Patch 8 is base drift: tyr predates the Kms associated type becoming
required and needed PhantomData<Self> added, same as nova already had.

Patches 9-18 are new in v2: generic bindings a *second* DRM driver needs
beyond the safe KMS layer. Alongside vino we are rewriting DisplayLink's
out-of-tree evdi module in Rust (it presents virtual displays whose
scanout is pulled by a userspace daemon over a drm_event + ioctl ABI), and
patches 9-15 are the seven things it needs that the layer did not provide,
none of them evdi-specific:

  9/18  drm::event -- a safe EventChannel/EventPayload for delivering
        drm_events to a userspace client, with the receiver drm_file only
        ever touched under the device event_lock so a send can't race a
        file close (the classic NULL/UAF flush bug). event_lock() moves to
        the core drm::Device since events are DRM-core, not KMS.
 10/18  declare_drm_ioctls_ext! -- declare_drm_ioctls! resolves argument
        types and numbers from the in-tree kernel::uapi crate, which an
        out-of-tree driver with its own ioctl range can't extend; the _ext
        variant takes the type and number per entry instead. The original
        macro is untouched.
 11/18  platform::RegisteredDevice -- the provider side of the platform
        bus (create/register a platform_device at runtime), so a virtual
        driver can spawn its own devices; platform.rs previously only bound
        to existing ones.
 12/18  Framebuffer geometry accessors, reference counting (ARef via
        drm_framebuffer_get/put helpers) and FramebufferVmap::as_bytes(),
        so a driver can hold a flipped-in framebuffer and read its pixels
        back without unsafe -- what evdi's GRABPIX does.
 13/18  i2c::BusController/BusAdapter -- the controller (provider) side of
        the I2C bus, so a driver can present a virtual bus and service the
        transfers; i2c.rs previously only registered I2C client drivers.
        Both evdi and vino use it for their DDC/CI channel.
 14/18  sysfs::DeviceAttributes/AttributeGroup -- expose sysfs control files
        on a root device with name-dispatched show/store; evdi uses it for
        its /sys/devices/evdi/{count,add,remove_all} card-lifecycle files.
 15/18  hardware cursor support -- rework drm::event to guard the receiver
        with a mutex so a GEM handle for the cursor bitmap can be created
        for the client (sleepable), plus plane position/hotspot and
        framebuffer format/handle accessors; both evdi and vino advertise a
        cursor plane.

Patches 16-18 round out the KMS feature set with more generic mode-object
support the pre-safe-KMS vino driver had that the ported layer didn't:
patch 16 a CRTC GAMMA_LUT (drm_crtc_enable_color_mgmt + a gamma_lut()
state accessor) and a plane rotation property
(drm_plane_create_rotation_property + rotation()/placement accessors);
patch 17 optional connector detect()/mode_valid() hooks (report hotplug
state, prune modes the driver can't drive), gated in the vtable like the
plane/CRTC optionals; patch 18 the RawPlaneState::damage_merged() and
for_each_damage_clip() accessors over drm_atomic_helper_damage_merged() /
drm_atomic_helper_damage_iter() so a driver can repaint only the region(s)
a client marked dirty. All three are generic KMS, not vino-specific.

vino uses patches 1-8 and 16-18; 9-15 are included here (rather than a
separate series) because they are small DRM/platform/i2c/sysfs binding
additions of the same kind and share this series' base. The evdi driver is
posted as a separate companion series ("[RFC PATCH] drm/evdi: a Rust EVDI
virtual display") -- a second, working consumer of these same bindings.

Known gaps, not fixed here: the connector layer has no detect_ctx()/
writeback support; no per-plane alpha/blend-mode property yet.

The primary consumer is drm/vino, posted alongside ("[RFC PATCH v2 00/9]
drm/vino: DisplayLink DL3 dock driver"). Source:
  https://github.com/FireBurn/vino-scripts
  https://github.com/FireBurn/linux/tree/vino
  https://gitlab.freedesktop.org/FireBurn/linux/-/tree/vino

Changes since v1:
 - Dropped the raw C KMS approach (FEAT_MODESET/FEAT_ATOMIC, drm_edid.h,
   drm_blend.h, Device::as_raw()); replaced by the safe KMS layer
   (patches 1-4), Framebuffer::vmap() (6) and safe accessors (7).
 - Kept the HDCP header (patch 5).
 - Added the evdi/vino bindings (patches 9-18): drm_event delivery,
   out-of-uAPI ioctls, platform-device creation, framebuffer accessors,
   i2c adapter-provider, sysfs attributes, hardware cursor, CRTC gamma /
   plane rotation, connector detect()/mode_valid(), and plane damage-clip
   accessors.

Mike Lothian (18):
  rust: drm: kms: forward-port the safe mode-object layer onto the
    typestate device
  rust: drm: kms: adapt the port to current drm-next
  rust: drm: kms: break the Driver* trait well-formedness cycle
  rust: drm: kms: build the kernel crate clean under -Znext-solver
  rust: drm: expose <drm/display/drm_hdcp.h> HDCP 2.2 message
    definitions
  rust: drm: kms: add a Framebuffer::vmap() guard
  rust: drm: kms: add safe accessors for common state and connector
    modes
  rust: drm: tyr: add the Kms associated type
  rust: drm: add drm_event delivery
  rust: drm: allow drivers to declare ioctls from their own uAPI module
  rust: platform: add runtime platform device creation
  rust: drm: framebuffer: add geometry accessors, refcounting and a
    byte-slice vmap
  rust: i2c: add adapter-provider (bus controller) registration
  rust: add sysfs device attribute groups
  rust: drm: support hardware cursor planes with sleepable event
    delivery
  rust: drm: add CRTC gamma LUT and plane rotation property bindings
  rust: drm: kms: add connector detect() and mode_valid() hooks
  rust: drm: kms: add plane damage-clip accessors

 drivers/gpu/drm/tyr/driver.rs      |    1 +
 rust/Makefile                      |    6 +-
 rust/bindings/bindings_helper.h    |   11 +
 rust/helpers/drm/atomic.c          |   32 +
 rust/helpers/drm/drm.c             |    3 +
 rust/helpers/drm/framebuffer.c     |   13 +
 rust/helpers/drm/vblank.c          |    8 +
 rust/kernel/drm/device.rs          |   31 +-
 rust/kernel/drm/driver.rs          |    8 +-
 rust/kernel/drm/event.rs           |  216 +++++
 rust/kernel/drm/ioctl.rs           |   86 ++
 rust/kernel/drm/kms.rs             |  432 +++++++++-
 rust/kernel/drm/kms/atomic.rs      |  865 +++++++++++++++++++
 rust/kernel/drm/kms/connector.rs   | 1109 +++++++++++++++++++++++++
 rust/kernel/drm/kms/crtc.rs        | 1152 ++++++++++++++++++++++++++
 rust/kernel/drm/kms/encoder.rs     |  409 +++++++++
 rust/kernel/drm/kms/framebuffer.rs |  217 +++++
 rust/kernel/drm/kms/modes.rs       |  151 ++++
 rust/kernel/drm/kms/plane.rs       | 1230 ++++++++++++++++++++++++++++
 rust/kernel/drm/kms/vblank.rs      |  461 +++++++++++
 rust/kernel/drm/mod.rs             |    1 +
 rust/kernel/i2c.rs                 |  192 +++++
 rust/kernel/lib.rs                 |    1 +
 rust/kernel/platform.rs            |   77 ++
 rust/kernel/sysfs.rs               |  245 ++++++
 25 files changed, 6930 insertions(+), 27 deletions(-)
 create mode 100644 rust/helpers/drm/atomic.c
 create mode 100644 rust/helpers/drm/framebuffer.c
 create mode 100644 rust/helpers/drm/vblank.c
 create mode 100644 rust/kernel/drm/event.rs
 create mode 100644 rust/kernel/drm/kms/atomic.rs
 create mode 100644 rust/kernel/drm/kms/connector.rs
 create mode 100644 rust/kernel/drm/kms/crtc.rs
 create mode 100644 rust/kernel/drm/kms/encoder.rs
 create mode 100644 rust/kernel/drm/kms/framebuffer.rs
 create mode 100644 rust/kernel/drm/kms/modes.rs
 create mode 100644 rust/kernel/drm/kms/plane.rs
 create mode 100644 rust/kernel/drm/kms/vblank.rs
 create mode 100644 rust/kernel/sysfs.rs

-- 
2.55.0

