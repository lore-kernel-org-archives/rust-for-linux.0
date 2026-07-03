Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0F31F993
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047776; cv=none; b=g9xWZEA+Kyeem4zz0CgLhlCwLqJovbUDxgb1jGONqCoC8sgyEiYPTyCrjjFWuoZbrlq7pxMd3uYOrvsaH3Jbr20DcqhtnRnnhSkKG77YrL5j5XHYju3JcvV+PXjaWU+c4Fkl0R80+TAAVqDQgr20aW77Puz8xCITg6au682gBB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047776; c=relaxed/simple;
	bh=nF64UwhporF7U6qqmdurvgbovD/XpRm+5EeiwCtGd/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqwXB/+n86NGk9YJrW14siioEXQ56xzDZPI+T/IFQh7PfN31npFavEA4pVrVX36V4JkjFwy8A/wCNbMIMXx7FL1JqSkexanEkuzdHFBT0opD2bAR3pEeBvWlO/xMi4bdIgle98Jkl0LIaRiwsWUq5XIR5oaxQ8cZeVPEfQD2yHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=iEZDjnzg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="iEZDjnzg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47640541585so53032f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047773; x=1783652573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QnRIGpd9LFK9d5U1y9xNKUj2Bxx5+4E/zuaNAi10W6o=;
        b=iEZDjnzg5RoYHDvh1qhQi7H4SXbZWTb0jdoR4EP7YBkM9mL0XnYSaALEQQ5GeVqfAY
         cXlhpnJIqsyUrhBii2FXt2zlnh7cHHhyCLyYyODLljYxR7crN3Q6O4qVx7GGrZ8qVS5C
         IG1AyqU6tOQEb8HCCcF4s7Srjf5NQdj9HUreiQGuJsKhXrUDcYfcmG30aS6qZ5F2/c1z
         jPXhqN4UFZharLwjIJIgZlp2XoWDox55jjOSJoR/lpoaRB4eHVwqv41xOaANg1nWjDPr
         Tr2Vm1SrxhpA+AS0PmUQ/dOP8R9nWWZfhxPIjHvRcR9cNQFpPTdxYU7G6Qk/HImVIuCJ
         xigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047773; x=1783652573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnRIGpd9LFK9d5U1y9xNKUj2Bxx5+4E/zuaNAi10W6o=;
        b=F6WwkMy9Kgyl7bwJsYIGoWAKH7gfaFNtJyPQAqVpGgnWihCWvnDq2ZDHndRWym6CMe
         2zu91jd4LcbD6HevFFmPEXsLNhwXieZLaWMfD4kV3ZYzC7+qi5jyF6zHd4Gx4wuoGuS6
         PLyXXdCB+A6eHngDmaDgkaKbMwm2vOBk9mrswCeUGPnP7AVf47Fa8geClgGMlULipnXl
         xGHrf3UHL6XfcvDnAiBL0/0Fg33INTrWysqJ8q3XvNJnnIp1GLirhacqPdRVWeFShBnf
         SkrIvK8VRRgyyHceccLjK3IIEzO5V3rxBalhhh8/GAt0RefLDiT0U4/0tYvuJZy1Odvv
         vXwA==
X-Gm-Message-State: AOJu0Yw7oXxX+Q3VPze0RLJAwXcF/va+FjsumTqXpqJuiz03uGJ9XuBA
	S1IODuSCiWiCLUNonbskXI3fs2JvVsHSxz5BwcIkgL1/vKMf7lnTTFcc3C5TBNROh6tUG1kQOix
	5oyozlkeI
X-Gm-Gg: AfdE7cnYYbLf+U+/jjfFFA3ECSwDVsO9KK2u7d7vi4bSdZPD55FS5A6zjFDK7DLDslE
	/xvvxT81Ohs+OLhTthdRzlcE8hxMtyczFj2jvmFzeIbErZ4ttDqHypDgrDOQtYNNmwepEPukpxI
	k8Y9nL8LiRG+Kd0OPsW10dEaN1fjNVsSBh/mjKLRHXu7l6du78ekteNNgxP43MWgNptfItArIIJ
	9+kKoLd4CGp2xsGYFecnJvjCbeW2gOEDpd5ojLdJN014GPV5dG3W6vj7l0M59lnMtOFKBa0y+Lm
	UmkHtAN9Znom3zqJYdPrzJgYWDJQE//l0GnuEXR3q1x/3NBPb5C32ppbil+u9+oaSioQoQfKmL8
	RgC98J7lBSOBF0ic7ptzqqHfbQErF7kD+AkL5XE6F9aA+4f4Dq3oloPPt0uKvekq5HhGWyX0Hd8
	GtM82OScYgw4Xd8To7hSbtHehjytOi+MJQFrYkGsmFFBMRH0tHrFFtTLI5
X-Received: by 2002:a05:6000:2410:b0:465:81cb:bb20 with SMTP id ffacd0b85a97d-477571cb83emr12354121f8f.9.1783047773100;
        Thu, 02 Jul 2026 20:02:53 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dde1a4fdsm15198199f8f.26.2026.07.02.20.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:02:52 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH 0/2] drm/evdi: a Rust EVDI virtual display (a working KMS consumer)
Date: Fri,  3 Jul 2026 04:02:45 +0100
Message-ID: <20260703030249.2949-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

evdi ("revdi" as a project) is a from-scratch Rust rewrite of DisplayLink's
out-of-tree evdi module: it presents virtual DRM/KMS displays whose scanout
is pulled by a userspace daemon over a drm_event + ioctl ABI, rather than
scanned out to local hardware. It identifies itself to userspace as "evdi"
for compatibility with the existing libevdi / DisplayLinkManager stack (an
ABI-compatible Rust rewrite of libevdi lives in the standalone project and
is not part of this posting).

Why post it as an RFC now: it is a *second, working* consumer of the safe
Rust KMS mode-object layer and the evdi/KMS bindings in the companion
series ("[RFC PATCH v2 00/18] rust: drm: safe KMS mode-object layer + evdi
bindings"). The other consumer posted alongside it, the vino DisplayLink
DL3 driver, is blocked at the dock's content-protection wall -- it never
gets the dock to engage its encrypted control plane, so it cannot prove
pixels actually flow on real hardware. evdi drives real monitors end to end
*today* under KWin/Wayland: multi-head output, live delta-damage updates,
a hardware cursor, DDC/CI, and clean teardown on unplug. So where vino
exercises this binding surface but can't demonstrate it, evdi does -- it is
the working validation of the same abstractions.

  1/2  drm/kms: three fixes to the safe Rust KMS layer, shaken out while
       bringing evdi up (a dangling mode_config vtable crash [RIP=0x9], a
       stale-cache coherency gap in the Framebuffer::vmap() guard, and a
       leaked-connector teardown). All are equally correct for vino and any
       other KmsDriver.
  2/2  the driver itself, under drivers/gpu/drm/evdi/.

NOT FOR MERGE AS POSTED: this depends on the not-yet-merged Rust DRM/KMS
bindings (the companion "rust: drm" series and the sync/DRM-registration
prerequisites it in turn depends on), so it does not build against mainline
as posted. It is sent to validate the binding surface with a driver that
works, and for review of the approach. Source:
  https://github.com/FireBurn/linux/tree/vino
  https://gitlab.freedesktop.org/FireBurn/linux/-/tree/vino

Mike Lothian (2):
  drm/kms: rust: fixes for a virtual KMS consumer
  drm/evdi: add the Rust EVDI virtual-display driver

 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/evdi/Kconfig       |  20 +
 drivers/gpu/drm/evdi/Makefile      |   2 +
 drivers/gpu/drm/evdi/ddcci.rs      |  43 +++
 drivers/gpu/drm/evdi/evdi.rs       | 405 ++++++++++++++++++++
 drivers/gpu/drm/evdi/ioctl.rs      | 248 ++++++++++++
 drivers/gpu/drm/evdi/kms.rs        | 589 +++++++++++++++++++++++++++++
 drivers/gpu/drm/evdi/painter.rs    | 199 ++++++++++
 drivers/gpu/drm/evdi/uapi.rs       | 210 ++++++++++
 rust/kernel/drm/driver.rs          |  24 +-
 rust/kernel/drm/kms.rs             |  12 +-
 rust/kernel/drm/kms/framebuffer.rs |  24 ++
 13 files changed, 1764 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/evdi/Kconfig
 create mode 100644 drivers/gpu/drm/evdi/Makefile
 create mode 100644 drivers/gpu/drm/evdi/ddcci.rs
 create mode 100644 drivers/gpu/drm/evdi/evdi.rs
 create mode 100644 drivers/gpu/drm/evdi/ioctl.rs
 create mode 100644 drivers/gpu/drm/evdi/kms.rs
 create mode 100644 drivers/gpu/drm/evdi/painter.rs
 create mode 100644 drivers/gpu/drm/evdi/uapi.rs

-- 
2.55.0

