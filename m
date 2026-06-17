Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EC44963AA;
	Wed, 17 Jun 2026 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711748; cv=none; b=t27xS18IVUqX5YWipFepMhZtpme0zaZFs7MTGhyGmgekmOrZ4kjZXFFW9RzBHLYssXAOJA9551nQDvizzXbCdCZkPtZj4rE0RcXDpI/Fc4D0C+bH/Wpj4ILNEDrFzqL2ArpXq1ABFzX9dhzJAmJRdVmCXM1tcaY/V+MiaxIFWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711748; c=relaxed/simple;
	bh=UxHXRm9jMwJA5BlesA133RonrTw5FL2lCqSNssk6n7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=fcZOppYjkhrpedwZBJMpkNSq8LfZhtJ7ArZMRISnL+ixchquINQTeRgkbwHbgE+KMZ0yz6nhqak0zpTd1wiSVQCftCyc/ZOfMJB6bjzNjFYW5DaxRl+PyXhCO9jvKv64pTQs21knPPrY4nRrpXQQUsIkA1yw4QCw8VThr2f+cxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGGy4P2c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGGy4P2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91DE1F000E9;
	Wed, 17 Jun 2026 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781711735;
	bh=UxHXRm9jMwJA5BlesA133RonrTw5FL2lCqSNssk6n7k=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=WGGy4P2c+B1NGlSISCV9f3mNdHaajGKcqSU2yJOXPfgvslwrXWUGyTyyMQLs9XnFR
	 hBIKbhMPWPJnX9g+zuqcFSR2Ef+WHR+8j6ilLLJCSGFruSJ1ZRkA4qL/kBUr3lyG7i
	 Eje84tz7bg2kNzP/kghKfOFfJu8bNuWr9ZpZLwRWsj7YadaTBcFvmSQ2X+Odgjc3TN
	 daKEiPDMgC6kTE53cbIPnLAO5RoT3+FmLrZjTY0cWgUkikIYzYOQSh0iLs2Oo6GJ0J
	 Wr5924hCuHSMimLGr60XhhUEYtfj4bltF4bki7dNDvQfCpXAoaViVvuUBBVaClXqOE
	 Ft+62nAh34qzA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 17:55:30 +0200
Message-Id: <DJBG3H7N9GS9.7AMMRJIHGHRN@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>
To: "Mike Lothian" <mike@fireburn.co.uk>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/7] drm/vino: DisplayLink DL3 dock driver (RFC,
 help wanted)
References: <20260617151249.2937-1-mike@fireburn.co.uk>
In-Reply-To: <20260617151249.2937-1-mike@fireburn.co.uk>

(Cc: Lyude)

On Wed Jun 17, 2026 at 5:12 PM CEST, Mike Lothian wrote:
> Vino is a clean-room, in-kernel Rust DRM driver for DisplayLink DL3 USB
> docks (Dell Universal Dock D6000, 17e9:6006), a native replacement for
> the out-of-tree EVDI module plus the proprietary DisplayLinkManager
> userspace daemon.

Interesting project!

> It is built on the in-tree Rust USB, crypto and DRM/KMS bindings, which a=
re
> posted as their own prerequisite series;

The KMS series you refer to is really just including the C headers for bind=
gen,
while the driver messes with all C KMS APIs directly.

Lyude already works on proper KMS infrastructure for Rust; can you please w=
ork
with her to get your driver reworked to use the safe infrastructure?

Also, I recommend looking at this series [1], which should very much simpli=
fy
dealing with device resources.

Thanks,
Danilo

[1] https://lore.kernel.org/dri-devel/20260603011711.2077361-1-dakr@kernel.=
org/
