Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E943D300D
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924713; cv=none; b=BUhkyoKllJa6ABcvM6Y+PEpuNP6eJJ5b0rv9VCznb+KfTWRI+pCEP/7Zy0neKsHSB4yyk+akGcoaaR1mHQpdRfMiPfyIAB34eIOwQlZaE5A9Ram5Q/t2X5o2SOG6883E8Irm2CblD35z8TP8fhjDVrfJhuWbXqnE7LafazSH6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924713; c=relaxed/simple;
	bh=qHjC2z3D3xgcNbVbjQxUQ5M6MCkMPcFl0j5nBbG2C0E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GcMzaDHisHmyKXaOiGQJ2wni/YQiyDVG/Np7jWRznZzOxImPeDvgBDwMuh1SWrzPQ/GA8h8t9b99Gr11QhLVFPeMSoy/0GdX7b/UwcIN2QKSg/E0lQXCtAe7IycEUw0N1H+fYUwiBToPGJqaL10NEqZ8TQDAZplrxksZNUk0Z2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=NGi2Kb1c; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="NGi2Kb1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1773924697; x=1774183897;
	bh=GqKdxHffuSWlXrX74Ie5nvW4sg5ME6U452+cB9VCml8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NGi2Kb1cFQustv3/7NhZDcSnEaNO5c71BLUwCUiaIq73vuZ3uh9v8J1ZY5sY3eb0I
	 pg05bj6joNqFXVZvdQLwzSPNz5KEgHWEW/mlepcWD6S5l4TQNnm3SIm0vAd0ziRukB
	 L2GHA4wOH9PXNR5wS0zjd3jCBC/FnVv3zuFyojlmzBp+RAmnyWlMpdrVs2sKs/eImK
	 bqjZl1jhBtfEEsg7CIuGOmAsfcwUL2HxsrsuPOyYp3qTh2mF6JwG+iwFNYXC001UG0
	 y5QH5DGvaluQmKZmyaxasnsO3aCjfzeQ88syGzfevpl3smMAUeA8obWaQbDAZfoMKM
	 OGTQOt2HOmKWg==
X-Pm-Submission-Id: 4fc5DR6fkJz2ScPc
Date: Thu, 19 Mar 2026 15:51:35 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, dakr@kernel.org, aliceryhl@google.com,
 daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Deborah
 Brouwer <deborah.brouwer@collabora.com>
Subject: Re: [PATCH v1 RESEND 4/4] drm/tyr: add GPU reset handling
Message-ID: <20260319155135.18f87a1b@nimda>
In-Reply-To: <20260319120828.52736966@fedora>
References: <20260313091646.16938-1-work@onurozkan.dev>
	<20260313091646.16938-5-work@onurozkan.dev>
	<20260319120828.52736966@fedora>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Thu, 19 Mar 2026 12:08:28 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 13 Mar 2026 12:16:44 +0300
> Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> > +impl Controller {
> > +    /// Creates a [`Controller`] instance.
> > +    fn new(pdev: ARef<platform::Device>, iomem:
> > Arc<Devres<IoMem>>) -> Result<Arc<Self>> {
> > +        let wq =3D workqueue::OrderedQueue::new(c"tyr-reset-wq", 0)?;
> > +
> > +        Arc::pin_init(
> > +            try_pin_init!(Self {
> > +                pdev,
> > +                iomem,
> > +                pending: Atomic::new(false),
> > +                wq,
> > +                work <- kernel::new_work!("tyr::reset"),
> > +            }),
> > +            GFP_KERNEL,
> > +        )
> > +    }
> > +
> > +    /// Processes one scheduled reset request.
> > +    ///
> > +    /// Panthor reference:
> > +    /// -
> > drivers/gpu/drm/panthor/panthor_device.c::panthor_device_reset_work()
> > +    fn reset_work(self: &Arc<Self>) {
> > +        dev_info!(self.pdev.as_ref(), "GPU reset work is
> > started.\n"); +
> > +        // SAFETY: `Controller` is part of driver-private data and
> > only exists
> > +        // while the platform device is bound.
> > +        let pdev =3D unsafe { self.pdev.as_ref().as_bound() };
> > +        if let Err(e) =3D run_reset(pdev, &self.iomem) {
> > +            dev_err!(self.pdev.as_ref(), "GPU reset failed:
> > {:?}\n", e);
> > +        } else {
> > +            dev_info!(self.pdev.as_ref(), "GPU reset work is
> > done.\n");
> > +        }
>=20
> Unfortunately, the reset operation is not as simple as instructing the
> GPU to reset, it's a complex synchronization process where you need to
> try to gracefully put various components on hold before you reset, and
> then resume those after the reset is effective. Of course, with what
> we currently have in-tree, there's not much to suspend/resume, but I
> think I'd prefer to design the thing so we can progressively add more
> components without changing the reset logic too much.
>=20
> I would probably start with a Resettable trait that has the
> {pre,post}_reset() methods that exist in Panthor.

Yeah, I checked Panthor and it has these functions for the reset logic.
I will implement that in v2 and will dig further to see if there is
anything else to cover in regards to proper syncing.

>=20
> The other thing we need is a way for those components to know when a
> reset is about to happen so they can postpone some actions they were
> planning in order to not further delay the reset, or end up with
> actions that fail because the HW is already unusable. Not too sure how
> we want to handle that though. Panthor is currently sprinkled with
> panthor_device_reset_is_pending() calls in key places, but that's
> still very manual, maybe we can automate that a bit more in Tyr,
> dunno.
>

Hmm, sounds like a perfect guard use-case. Is it possible to require
users to access the hw behind a guard (e.g., try_access_hw())? We would
then check if a reset is in progress and hold the user or return an
error until the reset is complete.

Thanks,
Onur

> > +
> > +        self.pending.store(false, Release);
> > +    }
> > +}

