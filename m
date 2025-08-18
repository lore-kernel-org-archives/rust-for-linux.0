Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B725634
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 05:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755493475; cv=none; b=QTlrqnUvg8r44pYdXzyosznuiPeesW0ozuFYQJuSEJL9o1N+FXk4n6CA7fsJoHpObVhKnsSZlnNKl9OF/i5p8AQokcIiliu7AUB49c+ycozcB+hiu2yc/Ynll3Eiyok63+erIsAbKTkuo1/sw/vEnZiR0aYFcyO4WoqvVIRi6YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755493475; c=relaxed/simple;
	bh=5DT0TTxnSJYWrXkBAaXqbdasxEPlE6BlNMTiaGo5PD0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=erSsKKySDvTXfCFQRvSi2WRdGNsYY+xJqEzw1IHnfCY9hztWcY8s16HTlK35dqAso2b0e7q/ue5vfnzym4KXUjh62wisvYUbpNF4hcnRf6tagFHcLfuKbhNuq2vMiSjNACsAqAMcTpDWNV7Im+3YzUx92U6IhrItmsXDzGrHdsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=xI8Ts6V1; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="xI8Ts6V1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1755493464; x=1755752664;
	bh=lNf04PH1oyVeq9ZzyB07yjbxbYxrle6upabdw3beabg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=xI8Ts6V1NDi/iQcFH+kb9Mz22+mjdz964bhGaQumzePuxz78iZpxFem6hgltLwPtK
	 s0Hc74e/p4fFY1IXbY6D3bBG92Qzep4Ps6NMMKbcONCRM1TKTPo9YbgQiB2hnXwOCO
	 OTjbvHfAPW23k0jsvtN80wstMs77Rs+AWvifqqzMww7GVHfYClsr9jnzPCSrYxEyXZ
	 qPcW3iQRYCZcZu1icKKAI3FjImJitvklcUrUW4X3tCLno35G/cB16tUZwu4CGlqFYM
	 m2TxFpXrmU2fp6RTqOs6xgYWxu3+uotty5R6UCN8xZEWgh6B21kja6Jv8jl/lJyrNh
	 nVieGxPDMfvmQ==
Date: Mon, 18 Aug 2025 05:04:15 +0000
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector APIs in Rust
Message-ID: <20250818050251.102399-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: f939127a71b651c6c0437cb2cc227612b69b9a0b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I am working on a drm_connector scoped backlight API in Rust. I have been
looking through Hans de Goede's previous efforts on this topic to help
guide my design. My hope is to enable backlight control over external
displays through DDC or USB Monitor Control Class while also supporting
internal panels. In parallel, I would like to improve the driver
probing/selection mechanism when there are different candidates for driving
a backlight device. This initial RFC is mainly intended to sanity check
that the plumbing I have chosen for extending the DRM connector
functionality in Rust seems reasonable.

I did toss in two doc comment cleanup patches in the mix. If these need to
be re-sent individually or split due to the multiple Fixes: tags, do not
hesitate to let me know.

Thanks,
Rahul Rameshbabu

Link: https://lore.kernel.org/rust-for-linux/20250808061223.3770-1-sergeant=
sagara@protonmail.com/
Link: https://binary-eater.github.io/tags/usb-monitor-control/
Link: https://lpc.events/event/16/contributions/1390/attachments/990/1916/k=
ernel-recipes-backlight-2022-16x9.pdf

Rahul Rameshbabu (3):
  rust: drm: fix C header references in doc comments
  rust: pci: fix incorrect platform references in doc comments
  rust: drm: Introduce a Connector abstraction

 drivers/gpu/drm/drm_connector.c |   9 +++
 include/drm/drm_connector.h     |  20 +++++++
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/connector.rs    | 103 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/device.rs       |   2 +-
 rust/kernel/drm/driver.rs       |   2 +-
 rust/kernel/drm/file.rs         |   2 +-
 rust/kernel/drm/gem/mod.rs      |   2 +-
 rust/kernel/drm/ioctl.rs        |   2 +-
 rust/kernel/drm/mod.rs          |   2 +
 rust/kernel/pci.rs              |   6 +-
 11 files changed, 143 insertions(+), 8 deletions(-)
 create mode 100644 rust/kernel/drm/connector.rs


base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
--=20
2.49.0


