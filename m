Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BDB20C472
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 23:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744329374; cv=none; b=msA2DI7u4h5xBkaL7WJRgvZWMTD9tytn4bH/inCgcZGRXXQ5grXu2EyllBviED2VoaBlHPraXoFnw7svSzJzZ+OxUwIPhMNpzXaTuBdR7DkwjRa+3ELGZWXmL2pOiiH4huF9HxYe3lsktWqLM9LKGkBj/On2vvczrZIcvCjsS84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744329374; c=relaxed/simple;
	bh=ypD3tbVfNfiKCDvd6kLsFR1P1XnGv4zvSm/5cC9ekJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PksFjKjlQHBU2ahN0rGGDIydCMVFLmsX/+O0ikZa6qB/bIUkBJL5Ohl1i5kEyoEwlIVqpX5PxxSF9q/5gD/REvutjvAUY68tkMeN+Tu4rykNRnOuAH2Ed+RCnxznvpFijSavOoB2+bT8M4eLrdSNOEgW8nzJWPzEgQnTDHgVAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYoDcK7Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYoDcK7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C26C4CEDD;
	Thu, 10 Apr 2025 23:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744329373;
	bh=ypD3tbVfNfiKCDvd6kLsFR1P1XnGv4zvSm/5cC9ekJw=;
	h=From:To:Cc:Subject:Date:From;
	b=dYoDcK7ZQ4Iel6blYUQ1dqHUBz0P5YDChT5uH28/rfRIPnpzQx0zAnRkXrwgDdni6
	 +ATqu46FyIzPBdo54NiGGT4QYyt8LNaKPKquTbuMc3Y8nb3rVsN7Z6k8qMLHLAXi9e
	 VD1DdmdVynOUqEQWPJZCjMCCLZ31u6PCSfAvx9aNlqV0A7XPeNkf+f9XooBAILxLXl
	 slr7WCdkiCstKd9ATBvgEwwyZ4AcMsWK62hQOu7GfOt5z5WWhmtisxvHiAtXuk79j1
	 nATSsuZ71FNEaa8FInSU8Cd3Da/XRxyy4fsnrEYXVQJzDT0rDrlaZl9/d9vnIzX+Uw
	 r7qb8UI1N+2SA==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	lyude@redhat.com,
	lina@asahilina.net,
	daniel.almeida@collabora.com,
	j@jannau.net,
	alyssa@rosenzweig.io
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/8] DRM Rust abstractions
Date: Fri, 11 Apr 2025 01:55:19 +0200
Message-ID: <20250410235546.43736-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the series for the initial DRM Rust abstractions, including DRM device /
driver, IOCTL, File and GEM object abstractions.

Compared to the original work from Lina, the patches in this series contain the
following modifications.

  - "rust: drm: ioctl: Add DRM ioctl abstraction"
      * wrap IOCTL data in Opaque<T> to avoid UB when creating a reference
      * original source archive: https://archive.is/LqHDQ

  - "rust: drm: add driver abstractions" (newly created)
      * Remove unnecessary DRM features
      * add #[expect(unused)] to avoid warnings
      * add sealed trait
      * original source archive: https://archive.is/Pl9ys

  - "rust: drm: add device abstraction" (newly created)
      * full rewrite of the drm::Device abstraction using the subclassing
        pattern
      * original source archive: http://archive.today/5NxBo

  - "rust: drm: add DRM driver registration" (newly created)
      * move VTABLE to drm::Device to prevent use-after-free bugs; VTABLE
        needs to be bound to the lifetime of drm::Device, not the
        drm::Registration
      * combine new() and register() to get rid of the registered boolean
      * remove file_operations
      * move struct drm_device creation to drm::Device
      * introduce Devres
      * original source archive: https://archive.is/Pl9ys

  - "rust: drm: file: Add File abstraction"
      * switch to the Opaque<T> type
      * fix (mutable) references to struct drm_file (which in this
        context is UB)
      * restructure and rename functions to align with common kernel
        schemes
      * write and fix safety and invariant comments
      * remove necessity for and convert 'as' casts
      * original source archive: https://archive.is/GH8oy

  - "rust: drm: gem: Add GEM object abstraction"
       * switch to the Opaque<T> type
       * fix (mutable) references to struct drm_gem_object (which in this
         context is UB)
       * drop all custom reference types in favor of AlwaysRefCounted
       * bunch of minor changes and simplifications (e.g. IntoGEMObject
         trait)
       * write and fix safety and invariant comments
       * remove necessity for and convert 'as' casts
       * original source archive: https://archive.is/dD5SL

A full diff between this series and the original work can be found in [1].

This patch series is also available in [2]; an example usage from nova-drm can
be found in [3].

[1] https://pastebin.com/qLBCfgTc
[2] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/topic/rust-drm
[3] https://gitlab.freedesktop.org/drm/nova/-/tree/staging/nova-drm

Changes in v2:
  - IOCTL: wrap data in Opaque<T> to avoid UB when creating a reference
  - driver: remove unnecessary FEATURE flags
  - driver: remove date field
  - MAINTAINERS: add files to both DRM and DRM MISC
  - change primary authorship of most patches

Asahi Lina (6):
  rust: drm: ioctl: Add DRM ioctl abstraction
  rust: drm: add driver abstractions
  rust: drm: add device abstraction
  rust: drm: add DRM driver registration
  rust: drm: file: Add File abstraction
  rust: drm: gem: Add GEM object abstraction

Danilo Krummrich (2):
  drm: drv: implement __drm_dev_alloc()
  MAINTAINERS: add DRM Rust source files to DRM DRIVERS

 MAINTAINERS                     |   2 +
 drivers/gpu/drm/drm_drv.c       |  58 ++++--
 include/drm/drm_drv.h           |   5 +
 rust/bindings/bindings_helper.h |   6 +
 rust/helpers/drm.c              |  19 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/device.rs       | 195 +++++++++++++++++++
 rust/kernel/drm/driver.rs       | 170 +++++++++++++++++
 rust/kernel/drm/file.rs         |  99 ++++++++++
 rust/kernel/drm/gem/mod.rs      | 321 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/ioctl.rs        | 161 ++++++++++++++++
 rust/kernel/drm/mod.rs          |  19 ++
 rust/kernel/lib.rs              |   2 +
 rust/uapi/uapi_helper.h         |   1 +
 14 files changed, 1043 insertions(+), 16 deletions(-)
 create mode 100644 rust/helpers/drm.c
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/driver.rs
 create mode 100644 rust/kernel/drm/file.rs
 create mode 100644 rust/kernel/drm/gem/mod.rs
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs

-- 
2.49.0

