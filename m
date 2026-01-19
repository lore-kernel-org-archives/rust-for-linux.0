Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F59500972;
	Mon, 19 Jan 2026 23:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768865728; cv=none; b=JEmuMBIwr4DMYkBNtAJnXmX1IiLIh+l821IIsecSk8KXTXY/lpXh+PDfA0gHXtqN/DE+SLula02RihKA8fnNG0vG6/UMiwLzNKWbn6QVxCAdy82LR/gAfuJfDKMhsG7uavj+Vg//yedAeyu1gsJkopgJSR8OaQsx4+zM04d9EJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768865728; c=relaxed/simple;
	bh=A88efyBerG2kFCEntsoGVcNKXAjR7S2vi2d1WI2tu5c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NO4RoHqihBMempm5dozMa0nTbrlkOj+d3Unu7Lofgry6fGjUg+uJrESGaIw0WfGHfj9FTBWxoskluiqFibVHYCHOgVjEadi2NpK9frldt2UZCGDTSgvSRvZ3DBIYMS+t8dwAejOKHC0NQJLCsr0w/JN5xnoeDjK9hHkR9PuiPfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kl6VCdx+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kl6VCdx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768865719;
	bh=A88efyBerG2kFCEntsoGVcNKXAjR7S2vi2d1WI2tu5c=;
	h=From:Subject:Date:To:Cc:From;
	b=kl6VCdx+SzkUkLXxiyyYUFXyqRI4waoxC+qP91ZVSGdsGvuxIN0+3rFNLN6FB/LlR
	 myHVS1S/f/LlW09DGFaye8SPQvGy4wBVFijbujjrFuQtwODrag6ajr8j2hJD9yconX
	 WNC30g+1QeP5StywSrfC1kBMIZt75zmBSOgqVh5K1pxeSvBjp8QxXPSE5Yku+nCAy6
	 iJcmWapwA1WjohduBnZP1XELn2ffhz5uIi5NDgsUrgVjv5Cod6QvAGx5rijPLLnHgi
	 kvuu9s9zU3RJ6VMy3c7QGm2QwVNyroarWaBDrba+dV83a8V8Gsz/rrsKRyhE/niPk9
	 rQuYGIEPyYqNw==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 31EED17E07FA;
	Tue, 20 Jan 2026 00:35:17 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/2] DRM 'feature' support for DRM drivers
Date: Mon, 19 Jan 2026 20:34:45 -0300
Message-Id: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJW/bmkC/x3MMQqAMAxG4atIZguNaBCvIg5ifzWDVVIQQXp3i
 +M3vPdSgikSDdVLhluTnrGA64qWfY4bnIZianwjnllcsMMZYoA59B2EO2l5FSrBZVj1+WfjlPM
 HZtLWeVwAAAA=
X-Change-ID: 20260116-drm-render-e85e615641f6
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailer: b4 0.14.3

This series introduces feature support for DRM drivers, as this will soon
be needed by Tyr and rvkms.

Patch 1 introduces the unsafe DriverFeatures trait. It underpins the design
by forcing drivers to comply with its safety requirements when enabling
features. It also introduces the compute_features() helper in order to
centralize the decision of which features to enable based on the value of
FeatureFoo::ENABLED.

Patch two showcases the design by implementing FEAT_RENDER. This adds a
safety requirement to the DriverFeatures trait that applies when the
corresponding feature is enabled. It is enabled on Tyr while Nova defaults
to NoRender, as it's unclear whether it's something that they want to
enable at the moment. This has the bonus of highlighting how features can
be disabled in a given driver in a non-disruptive manner.

Optionally, features can require that additional traits be implemented.
These traits may come with their own safety requirements and the type
system will ensure that they're indeed implemented if the feature is
enabled by the driver.

The commit message for patch one describes how this can be achieved in
rough terms. It's not a reference, though, as a lot of the boilerplate was
omitted for brevity. In any case, I tested an imaginary "ModesetOps" trait
in both Tyr and Nova and everything seems to work from a type system's
perspective.

Finally, the current approach is extensible as new features can be
described with traits and types without disrupting existing ones. They can
also convey their own safety requirements and even their own API, as
described above.

Please feel free to suggest new names for any of the types or patterns
used. They're somewhat illustrative and not intended as final.

---
Daniel Almeida (2):
      rust: drm: add support for driver features
      rust: drm: add FeatureRender

 drivers/gpu/drm/nova/driver.rs |  7 ++++++
 drivers/gpu/drm/tyr/driver.rs  | 11 +++++++++
 rust/kernel/drm/device.rs      | 14 +++++++++++-
 rust/kernel/drm/driver.rs      | 52 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 82 insertions(+), 2 deletions(-)
---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260116-drm-render-e85e615641f6

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

