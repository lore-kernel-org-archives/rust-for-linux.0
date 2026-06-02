Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5693D8910
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397383; cv=none; b=ZyTx2GuT/nFHlTyjUJSzi+S5gV9zbOS7Bax1KIWuYV1eDWeJid3V5f0bqsQFuvbTeB8/dKYtd2UthtrN08EUaEeXW1YCkpAivpiwqfhfaZ28fVH2z0Yqo2rf0D+T4t/HErxZ5+UymU03CgW/BeuKXurH5+0d1i0Xc8DlLTcc8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397383; c=relaxed/simple;
	bh=dda2g0AOA+F5AMlYixnPmuaXdYO4GO3Dd+j+NDDNWxE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=OyTL/kZAUkkz4qUFHSmYdQ1yA8Oro7cHEuXqiPsnHqGD/q61Jl97kF+Y3IIidnWHf9KcWvT8Nmme0TCJexuv2xPfgBqfMLJSOgo7OyqZfhZOfYZn4oj9WRQLPZKF08BEdnapEvyCzKewGS2vw2l/GZhbtcwBPf1vPRrAaK7pPuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDQG78iy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDQG78iy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32301F00893;
	Tue,  2 Jun 2026 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780397381;
	bh=dda2g0AOA+F5AMlYixnPmuaXdYO4GO3Dd+j+NDDNWxE=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=YDQG78iyxFxfFlfIM6CdZNi6ypYywtLJs8DYlBpEiptosw36TiVv5Yp0yc5BkCIHH
	 ycf5o1u87MaFuGwaKVnSFNuDqHAo97VVTpvr/UTmyfmqVhV7T9cMZ+jTclNOuKwTCf
	 vlrok6v4r23A1/bG9IhE6vGzQJlaeRfY9qYhRY0GHkB0vic8egs6Sw/WKTjYjWL/cp
	 pjJ78+TZMC46sen9aTi6VlCk6VSVqxDKzMROnHElei4ykspkSfhoBWYUKSHSyP4giK
	 s24p7UE9PoO4L8XE8o7+v5qkitI+muhjMLiyuMlZwBuZFHmJ/ggG45a0w4UkcUjxTg
	 MKN1/DoyWTo+w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 12:49:38 +0200
Message-Id: <DIYI74CF465A.259FWQ2ZT6Y1Y@kernel.org>
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <boris.brezillon@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/tyr: use IoMem directly instead of Devres
References: <20260529000106.2257996-1-dakr@kernel.org>
 <20260529000106.2257996-3-dakr@kernel.org> <ah1SSN8_dCEA4Osz@google.com>
 <ah4t8IPo1L6XZMy_@um790> <DIYHW8MAG0AY.FJ96EJ5RDZK7@garyguo.net>
In-Reply-To: <DIYHW8MAG0AY.FJ96EJ5RDZK7@garyguo.net>

On Tue Jun 2, 2026 at 12:35 PM CEST, Gary Guo wrote:
> I am not sure what the distinction even mean for a class device?
>
> There's 1 device per registration, so they're equal. Am I missing somethi=
ng?

The existing DRM device private data's lifetime is tied to the lifetime of =
the
DRM device itself, which makes sense as long as IOCTLs are not guarded agai=
nst
driver unbind and can still reach into the driver after driver unbind.

Once that is changed, this doesn't make sense anymore, the driver structure=
s are
then tied to the lifetime of the Registration.

Any handles that userspace may keep open beyond this should be handled by t=
he
subsystem; at this point there is no more HW state the driver would need to=
 take
care of.

Thus, the private data tied to the lifetime of the DRM device won't be need=
ed
anymore, see also [1].

[1] https://lore.kernel.org/dri-devel/DIXMEKSYML5D.1JUXO9CW10RY8@kernel.org=
/
