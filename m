Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA044C8E
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225675; cv=none; b=KPMe6U6WjFlMHcCzRWqaS7QkZ0UTQ32Hi7gPmJYtkPXEUyxDLW9QtiA/LWW4pMq9E3DQuTWjQFUBzmzsdlxEa8bAq3DUGJpdXHUXhItKcq+7GDFH6FI2+DuCisThVloUZzYYnKSDqnyPMlpznuTX5K+VCb2OpOq1tAuiPqJkHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225675; c=relaxed/simple;
	bh=bq0qOa1bx4MXNm/M8T7FasWCgtXC4EIVgotK7Zq3/Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LyRoKJpQe3FPXFHwMlrJCQqUIFI8G3UD6f7Rw8lGm9Ha2wsthi37p3p/jguA8nkCwHMxgNKdmcNcieo3tJ7kb9ATVE6XO38y/fDerANuOCQRhFlka9t1EMTFT/JXnNHmdH6CxqG7Fo8Y9MJKmRMxlkJyFuQrpb1zlYArz932b/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bpvs6RuV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bpvs6RuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716225672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cfW1XgmcrKJYEA6UaMsvxWFMCmPNu6LpNNS8FXQNwd8=;
	b=Bpvs6RuVm6ZSTzQ4jx3IdcYmC6EQXabG9RC8Pnt++ObfjDt4eX6T/C76PyOQooZ9vtydAT
	u9gZe/34xc3v8utolefz2YeGZjjk6qBOCspb3y0K8T6dzrE1jiGVwurg83tKAKni3ayC82
	aiUMxnKpD+lbZ972m4yLnLGcguIFcK8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-zNvn7xHwOLaAQSD9fOa9yQ-1; Mon, 20 May 2024 13:21:09 -0400
X-MC-Unique: zNvn7xHwOLaAQSD9fOa9yQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4200ef4fb81so44793045e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225668; x=1716830468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfW1XgmcrKJYEA6UaMsvxWFMCmPNu6LpNNS8FXQNwd8=;
        b=gP7cS32RN/en5mnujq2fKheuw1LIFS3lyBdagibGX6mo28xDba3p2sEeA3xOkIhMLi
         FtbGRevRnquPa91tdL2OGKpwN8iB9Syxf/jGgG1wCV2CDJMM0NO+JXh81C9Scga7n3xG
         vb0f7xpcds5ShLlCwJJhZW+jPi9UKHttvBAa1tEAmirhqZOv2xgOHzA7rsUDBc84WOZk
         r3j4fmbzjlBujERU8UG3Aa+piR4du4KOmuqtozLFUccRfkYy8tKiAar7+YOU86PB+pXE
         1CBUGtE8MOYfGO6FuMYJgcqC6dd6XVEMpvAj+LM4IhH+rNTNS9y9sHwz7Nrr65/h1SfG
         R6BQ==
X-Gm-Message-State: AOJu0Yy8chDmZTEkdwQF5MC1x6cqqY7i4hvPNS5+mQKnuKZ9Qj8YBG4G
	9QwWUy2zlyjde/TK8KIHdXJwawzjujhQ1gXAhCPhg0CEdOlzW+FWy6H8TaEERHUfaIfJjaljHLr
	8k8hzyH2f92ZsZDE/djZhFz0VM5tPq+qY6eVgL2JPrmArrFWaCsFp1rTDKMaEsVmq
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id 5b1f17b1804b1-420e19e46d4mr57894755e9.9.1716225668282;
        Mon, 20 May 2024 10:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhCFvLZoaDI3iSTKmLdqM1qyoeVh6xl/L8p8pe/aTnEVlkPoxeJ/ek4U0dG5zhg8lX2LhW0A==
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id 5b1f17b1804b1-420e19e46d4mr57894335e9.9.1716225667729;
        Mon, 20 May 2024 10:21:07 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe36f373fsm407299905e9.20.2024.05.20.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:21:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	fujita.tomonori@gmail.com,
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 0/8] [RFC] DRM Rust abstractions and Nova
Date: Mon, 20 May 2024 19:20:47 +0200
Message-ID: <20240520172059.181256-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch series implements some basic DRM Rust abstractions and a stub
implementation of the Nova GPU driver.

Nova is intended to be developed upstream, starting out with just a stub driver
to lift some initial required infrastructure upstream. A more detailed
explanation can be found in [1].

This patch series is based on the "Device / Driver and PCI Rust abstractions"
series [2].

The DRM bits can also be found in [3] and the Nova bits in [4].

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
[3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Asahi Lina (5):
  rust: drm: ioctl: Add DRM ioctl abstraction
  rust: Add a Sealed trait
  rust: drm: Add Device and Driver abstractions
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (3):
  rust: drm: implement `AsRef` for DRM device
  rust: add firmware abstractions
  nova: add initial driver stub

 MAINTAINERS                     |  10 +
 drivers/gpu/drm/Kconfig         |   2 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/nova/Kconfig    |  11 +
 drivers/gpu/drm/nova/Makefile   |   3 +
 drivers/gpu/drm/nova/driver.rs  | 110 +++++++++
 drivers/gpu/drm/nova/file.rs    |  71 ++++++
 drivers/gpu/drm/nova/gem.rs     |  50 ++++
 drivers/gpu/drm/nova/gpu.rs     | 172 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs    |  20 ++
 include/uapi/drm/nova_drm.h     | 101 ++++++++
 rust/bindings/bindings_helper.h |   6 +
 rust/helpers.c                  |  23 ++
 rust/kernel/drm/device.rs       |  95 ++++++++
 rust/kernel/drm/drv.rs          | 321 +++++++++++++++++++++++++
 rust/kernel/drm/file.rs         | 113 +++++++++
 rust/kernel/drm/gem/mod.rs      | 406 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
 rust/kernel/drm/mod.rs          |   9 +
 rust/kernel/firmware.rs         |  74 ++++++
 rust/kernel/lib.rs              |   8 +
 rust/uapi/uapi_helper.h         |   2 +
 22 files changed, 1761 insertions(+)
 create mode 100644 drivers/gpu/drm/nova/Kconfig
 create mode 100644 drivers/gpu/drm/nova/Makefile
 create mode 100644 drivers/gpu/drm/nova/driver.rs
 create mode 100644 drivers/gpu/drm/nova/file.rs
 create mode 100644 drivers/gpu/drm/nova/gem.rs
 create mode 100644 drivers/gpu/drm/nova/gpu.rs
 create mode 100644 drivers/gpu/drm/nova/nova.rs
 create mode 100644 include/uapi/drm/nova_drm.h
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/drv.rs
 create mode 100644 rust/kernel/drm/file.rs
 create mode 100644 rust/kernel/drm/gem/mod.rs
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs
 create mode 100644 rust/kernel/firmware.rs


base-commit: 4a67fc8e2330cbd57b49d8ea703ffbf7292ef828
-- 
2.45.1

