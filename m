Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D3E25634
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 05:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755493482; cv=none; b=INNo1LzP+LR0q81cYQo5L2JvAl/0LLMdN7tus5LxgW09zXvSRebRXqW+lfdfGPwEBLyq1u4CdBmX4gOdTOsQ6N+Nmm4DgTwEJboyPp/aF2NwUcJmuE9LUHmlAWFqGGy9xoBRcq77+8R+yycd0JRGteXGX8m8P33gsn5M92vX96c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755493482; c=relaxed/simple;
	bh=2utUGL6d2d8ksJuvFN4zy4xAxkMdaBot5juyrSoZplU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugXBD5BryuONy1xv27/wxsgqlFO6uQaBa84Ouf+l8J25+4bY9I+JLGij2U/JA55lQQlOHRQpOG3sweVmFZ40bf+zvlNNmn0zRAaqE8kMIidCTxBt3tVgU3Uu6ympYSVb1EfQ9txNuVn41hTUtbVo21fB96su1cfm+Uxwx94rwe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=dWgl2Usu; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="dWgl2Usu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1755493472; x=1755752672;
	bh=jEQAaK9Pets3hssO/fi53mYdtmA343wdOCnraQfN9/Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dWgl2UsugaJs33UHlsdA1serCGEurYv5KKXy6zSkaYC+C6tAa+BE2crcJlo0H33WZ
	 X4GuXZEgTpTmt7JTmVhoz34VqydfIFPcUDv1i2EZdb7bdrvJz1LCj0BzRaaG/GxCHv
	 sceoPL5+YSAmqIPt9PLL1EP/raKd0KzwxdR6VCeYFeY79UDvAkTvSWb/Le7XMfFP4r
	 fNxTli/Irco62lK8vlMtXRUYxNPT6byxTmDXOxa6tPnX1wqxSUjEUmv16xNVvYA4uW
	 jbfgYotZsN5ePJfFGMkqVzxNxQlTVVTLl1YG0WAQLJMgH+gOfaB9SGd7PUsSJJjWs5
	 uRGA1VWw7GwgA==
Date: Mon, 18 Aug 2025 05:04:28 +0000
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [RFC PATCH 1/3] rust: drm: fix C header references in doc comments
Message-ID: <20250818050251.102399-3-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 44abf02de46a53657233ff0e97434b16d050fe17
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Rust DRM abstractions would incorrectly reference headers using the
non-existent path include/linux/drm. Correct the path to include/drm.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
Fixes: 07c9016085f9 ("rust: drm: add driver abstractions")
Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
Fixes: a98a73be9ee9 ("rust: drm: file: Add File abstraction")
Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")
---
 rust/kernel/drm/device.rs  | 2 +-
 rust/kernel/drm/driver.rs  | 2 +-
 rust/kernel/drm/file.rs    | 2 +-
 rust/kernel/drm/gem/mod.rs | 2 +-
 rust/kernel/drm/ioctl.rs   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3bb7c83966cf..88787a32045f 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -2,7 +2,7 @@
=20
 //! DRM device.
 //!
-//! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm=
/drm_device.h)
+//! C header: [`include/drm/drm_device.h`](srctree/include/drm/drm_device.=
h)
=20
 use crate::{
     bindings, device, drm,
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index fe7e8d06961a..d2dad77274c4 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -2,7 +2,7 @@
=20
 //! DRM driver core.
 //!
-//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/dr=
m_drv.h)
+//! C header: [`include/drm/drm_drv.h`](srctree/include/drm/drm_drv.h)
=20
 use crate::{
     bindings, device, devres, drm,
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index e8789c9110d6..8c46f8d51951 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -2,7 +2,7 @@
=20
 //! DRM File objects.
 //!
-//! C header: [`include/linux/drm/drm_file.h`](srctree/include/linux/drm/d=
rm_file.h)
+//! C header: [`include/drm/drm_file.h`](srctree/include/drm/drm_file.h)
=20
 use crate::{bindings, drm, error::Result, prelude::*, types::Opaque};
 use core::marker::PhantomData;
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index b71821cfb5ea..b9f3248876ba 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -2,7 +2,7 @@
=20
 //! DRM GEM API
 //!
-//! C header: [`include/linux/drm/drm_gem.h`](srctree/include/linux/drm/dr=
m_gem.h)
+//! C header: [`include/drm/drm_gem.h`](srctree/include/drm/drm_gem.h)
=20
 use crate::{
     alloc::flags::*,
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index fdec01c37168..8431cdcd3ae0 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -2,7 +2,7 @@
=20
 //! DRM IOCTL definitions.
 //!
-//! C header: [`include/linux/drm/drm_ioctl.h`](srctree/include/linux/drm/=
drm_ioctl.h)
+//! C header: [`include/drm/drm_ioctl.h`](srctree/include/drm/drm_ioctl.h)
=20
 use crate::ioctl;
=20
--=20
2.49.0


