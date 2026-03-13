Received: from forward500a.mail.yandex.net (forward500a.mail.yandex.net [178.154.239.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D0C34D398;
	Fri, 13 Mar 2026 11:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400827; cv=none; b=G3GAe5Wv7RKuZVEBwag/cUYTMfo7fC+TRaOtp+gIX3/JtQQKCOZWinpoTwsE4og0u3MFVep68IaiBgQPHrM3SyqDBg3nvpstwyszGepYNa9YFZA/PspyRvd+RStVDf5AhuVZd+HxAZxpXcKeVI6toz+RJw5rBu4IrLwtdPrUS3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400827; c=relaxed/simple;
	bh=+LHCdfl2nNeamhjvn8vrHuQB7OyQVMranvkY6pilt0A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WnNEu5EFsGQ8UAZE5AV5iNqz1Zq9cbIr4oGKU6Ck8St/Nd19R1CcO/3v4IvmiGrAZQ5W+mT/+wLI4OI36LssYOHo5jAQY7cmdPYVRA3MxNWRmUQyoAEiLq6mW4lJpecfjqtBBjBM60Z9spga6XlUeEqiptbVl+daTXn+GGHBRqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=OykvkDFp; arc=none smtp.client-ip=178.154.239.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="OykvkDFp"
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:1311:0:640:df31:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTPS id 0E87BC1658;
	Fri, 13 Mar 2026 14:12:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id VCGALhUGjKo0-yTrYElGY;
	Fri, 13 Mar 2026 14:12:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1773400354;
	bh=n/6CrdwNTFgseiseMa2NwOis6OgxeynifyilFoeJCHE=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=OykvkDFpx5uGzQIyHa5G2lbEMX38zX697fL1KkiC7O8XYucrHHoLZUnnaPi8CtUeK
	 RtipEcBLx3iA6zY/Ux1V7Ith58sgdAlSGO6MHH4frGekm/oVGcGHQfhVN1A7HlD5vB
	 Gw0pDX98U/mST/buhMmH+FZSrBu3m9ZjsubHhAq0=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Fri, 13 Mar 2026 14:12:28 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 RESEND 0/4] drm/tyr: implement GPU reset API
Message-ID: <20260313141228.36ad6e43@nimda>
In-Reply-To: <abPeUBWpTB3mQRQs@google.com>
References: <20260313091646.16938-1-work@onurozkan.dev>
	<abPeUBWpTB3mQRQs@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Mar 2026 09:52:16 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Mar 13, 2026 at 12:16:40PM +0300, Onur =C3=96zkan wrote:
> > This series adds GPU reset handling support for Tyr in a new module
> > drivers/gpu/drm/tyr/driver.rs which encapsulates the low-level reset
> > controller internals and exposes a ResetHandle API to the driver.
> >=20
> > The reset module owns reset state, queueing and execution ordering
> > through OrderedQueue and handles duplicate/concurrent reset requests
> > with a pending flag.
> >=20
> > Apart from the reset module, the first 3 patches:
> >=20
> > - Fixes a potential reset-complete stale state bug by clearing
> > completed state before doing soft reset.
> > - Adds Work::disable_sync() (wrapper of
> > bindings::disable_work_sync).
> > - Adds OrderedQueue support.
> >=20
> > Runtime tested on hardware by Deborah Brouwer (see [1]) and myself.
> >=20
> > [1]:
> > https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/63#note_=
3364131
> >=20
> > Link: https://gitlab.freedesktop.org/panfrost/linux/-/issues/28
> > ---
> >=20
> > Onur =C3=96zkan (4):
> >   drm/tyr: clear reset IRQ before soft reset
> >   rust: add Work::disable_sync
> >   rust: add ordered workqueue wrapper
>=20
> I actually added ordered workqueue support here:
> https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@g=
oogle.com/
>=20
> Alice

That's cool. I guess this will wait until your patch lands unless we
want to combine them into a single series.

- Onur

