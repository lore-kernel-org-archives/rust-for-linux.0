Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DC71849C0
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 23:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753618; cv=none; b=vEVPoOGzr/4FdXX9Kbv6mqnzGI5/c7/DaEcIJKDbn4WrRi2cBe6hKOmtPMKixaTi6v23RYuypiW6YYU4+I6tBQDoD05N8sYOheY1NsspW1jEMDktrcERUNs37TcbFxrh19UvRR7+T2zwdm1kKNS+zIZbhoJLWHfe7jivSuSj6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753618; c=relaxed/simple;
	bh=wHAOmyM6zIEFYXWTtBMHO6EDxZvNh8iO9wG20GQSFIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qB/paBp/9Z4fYHRSM2CoPbMkEk47581ecaqS3fA/aHk6qGbGzTg84eoXl309eC3iMB68dS1L2EKtKXnrb5TMAMsZ81iiURBnTXZ6PP2/Es7biqzXpGbAfC19/BctV+VjPTceU6e2QT3aUc4prZ6R2B0603+ZmDVUbPcrz25SMOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JuyqtTNW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JuyqtTNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718753615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z3Fqi+/51BFxiyJqNYjzcwItBXkMYypkwQiZX7xgnOk=;
	b=JuyqtTNWfAdfVXnAbFQO9DLDAeoSXErlizwkuHsg5Y6DPa1Aw/wmtYYlGpQxzktbP7NblT
	RlhlN9WgehJDdJR83RfP6RG0b+6eRNn2nQGQVeAP3yK52Xn6yj0rqHqhVbW+0tUpvmEHu4
	piQ6eg6VLGq+yPyFQnTBrPPFHqaoslo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-YXiL2db0MqyONQ6EZhhJFg-1; Tue, 18 Jun 2024 19:33:32 -0400
X-MC-Unique: YXiL2db0MqyONQ6EZhhJFg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4218447b900so1496565e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 16:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718753611; x=1719358411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3Fqi+/51BFxiyJqNYjzcwItBXkMYypkwQiZX7xgnOk=;
        b=XXFTkCGvILBsVSuH2Uv5i3xEGWzYlbHM/0U8rQ/5HM2bFZRVXNUCVv/UB6oMEYO56J
         uRCyTADoSw8RS0vD0es1h5WqivW1kELtWf4YHIXxHJZUdBSQzOCjJXHC0SBUA2QDKLkE
         tdfJcQPxoc9V+Q3XPWdHHNkquTcadYiBbSi1hNlEersL5PYfg0IYkQ8335eDHDmN+00q
         WBaz6JvFJVFwYeUcOkscBU4/uMzF0tXDjSyIHgMrd9kou9Lj2M6CpTpxmJH8JELwGRXY
         0Nspei3Qk2k+9C9R4Wgqv+/suCECd/hrYqpgEhwhn66NoRoPFhyND+ss6N0wtWxaPpSx
         /d8w==
X-Gm-Message-State: AOJu0YyVTvxHD0ht1PRJXrxxmTnbZmOctvq/hIULITbVIPBU11BDJlCJ
	RpufWK2i7BT1iHNgRXDtLMmcXnhpGxxQYOKFrboU/+crgPW0SMc+9uEfe0WbwJVI62JWip0ML57
	UN5COXO2mMa5SXlIesBd51f+PLy+zHXllGvMlxEKuAKyHOWg5gWuVCteOkNaG5ekJ
X-Received: by 2002:a05:600c:4a25:b0:421:7ab8:59c with SMTP id 5b1f17b1804b1-42474d1ea69mr11067755e9.10.1718753610847;
        Tue, 18 Jun 2024 16:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkDTEXBpqJptvcXNzTpmzKVYUnQPN3GfP3sjrNY2yNnULq62acJnzYZiRMKe8J42NVExH3mQ==
X-Received: by 2002:a05:600c:4a25:b0:421:7ab8:59c with SMTP id 5b1f17b1804b1-42474d1ea69mr11067625e9.10.1718753610465;
        Tue, 18 Jun 2024 16:33:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de646sm246271855e9.35.2024.06.18.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 16:33:29 -0700 (PDT)
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
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 0/8] DRM Rust abstractions and Nova
Date: Wed, 19 Jun 2024 01:31:36 +0200
Message-ID: <20240618233324.14217-1-dakr@redhat.com>
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

Changes in v2:
==============
- split up the DRM device / driver abstractions in three separate commits
- separate `struct drm_device` abstraction in a separte source file more
  cleanly
- switch `struct drm_driver` and `struct file_operations` to 'static const'
  allocations
- implement `Registration::new_foreign_owned` (using `Devres`), such that we
  don't need to keep the `Registration` alive on the Rust side, but
  automatically revoke it on device unbind
- add missing DRM driver features (Rob)
- use `module_pci_driver!` macro in Nova
- use a const sized `pci::Bar` in Nova
- increase the total amount of Documentation, rephrase some safety comments and
  commit messages for less ambiguity
- fix compilation issues with some documentation example

[1] https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u
[2] Reply to this mail titled "Device / Driver and PCI Rust abstractions".
[3] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[4] https://gitlab.freedesktop.org/drm/nova/-/tree/nova-next

Asahi Lina (4):
  rust: drm: ioctl: Add DRM ioctl abstraction
  rust: Add a Sealed trait
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (4):
  rust: drm: add driver abstractions
  rust: drm: add device abstraction
  rust: drm: add DRM driver registration
  nova: add initial driver stub

 MAINTAINERS                     |  10 +
 drivers/gpu/drm/Kconfig         |   2 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/nova/Kconfig    |  12 +
 drivers/gpu/drm/nova/Makefile   |   3 +
 drivers/gpu/drm/nova/driver.rs  |  85 +++++++
 drivers/gpu/drm/nova/file.rs    |  70 ++++++
 drivers/gpu/drm/nova/gem.rs     |  50 ++++
 drivers/gpu/drm/nova/gpu.rs     | 173 ++++++++++++++
 drivers/gpu/drm/nova/nova.rs    |  18 ++
 include/uapi/drm/nova_drm.h     | 101 ++++++++
 rust/bindings/bindings_helper.h |   5 +
 rust/helpers.c                  |  23 ++
 rust/kernel/drm/device.rs       | 182 ++++++++++++++
 rust/kernel/drm/drv.rs          | 199 ++++++++++++++++
 rust/kernel/drm/file.rs         | 116 +++++++++
 rust/kernel/drm/gem/mod.rs      | 409 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 153 ++++++++++++
 rust/kernel/drm/mod.rs          |   9 +
 rust/kernel/lib.rs              |   7 +
 rust/uapi/uapi_helper.h         |   2 +
 21 files changed, 1630 insertions(+)
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


base-commit: 6646240d29b11de3177f71ff777d0ae683c32623
-- 
2.45.1

