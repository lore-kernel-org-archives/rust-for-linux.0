Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364C26AF4;
	Thu, 19 Mar 2026 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918517; cv=none; b=pkwx+t5Of8jtiZx4CkQsnHML9qb0ayc6W9sFO1h4rbmfV3N720mMF1zvqyjMStjIFQ+rptm32HoiW8P0vrxMUp2Q5E5vwZJl0qGlaRgkDrruKKQtOWFNmuBPgRFb1kolkSsCeD6ul+iOn0lM+eBjmf05GWgXW+MReg8Hp3fZwNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918517; c=relaxed/simple;
	bh=Z+pvxwULPAJ0NoC3Ncj8v/9V/z4PlztUUfLRSdmoAQk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8jfCg74T1oJo2u6XmaKmBsThDdiO9UbY+qH6PnW0As0zTuQI6lFlR+HWZAyYPqmgSAce4qw8DfdQFszRcLXxfSmWPc0aWLgptyPixh4UumG92KpQZoSBQ23xq0q2rJx12S9qa7ec5LzBc0gHuVCpM7Gz/6qUUHYUHt21/RqFRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WZwO5313; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WZwO5313"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773918514;
	bh=Z+pvxwULPAJ0NoC3Ncj8v/9V/z4PlztUUfLRSdmoAQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WZwO5313OWvF9cfZ+fYEB0eKLkWCD7pmODugEUoCGMcH7J4G9i3i3oWKVeKVmGyxh
	 XLHgVpkdC9seCiAMmeSsmwV9RhMVJM/CVakrjofoOtmRdAXb0Qb2qK9stmoW51wJvl
	 JVBsrJ9JoUnjE1QfHJMj0dDtH6G4Qi4wEanoY8VBsg+D+yBBXd7HGNflVuK9d0QeYd
	 uiibx5tlV3tDtIE7D0LewGgqxsT5G1VjiZZXLUAAMAvUafnxnHUacXqB7H7MCO1DeT
	 q2rPLw4D7PDY+ce5mWZ297vyTEyteWk/RDoM9NvL/1DOPYVeYfnsC6i4S7P/YVwOcT
	 sVaMErzXLd3QQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BECF517E01B1;
	Thu, 19 Mar 2026 12:08:33 +0100 (CET)
Date: Thu, 19 Mar 2026 12:08:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dakr@kernel.org, aliceryhl@google.com,
 daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Deborah
 Brouwer <deborah.brouwer@collabora.com>
Subject: Re: [PATCH v1 RESEND 4/4] drm/tyr: add GPU reset handling
Message-ID: <20260319120828.52736966@fedora>
In-Reply-To: <20260313091646.16938-5-work@onurozkan.dev>
References: <20260313091646.16938-1-work@onurozkan.dev>
	<20260313091646.16938-5-work@onurozkan.dev>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Mar 2026 12:16:44 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> +impl Controller {
> +    /// Creates a [`Controller`] instance.
> +    fn new(pdev: ARef<platform::Device>, iomem: Arc<Devres<IoMem>>) -> R=
esult<Arc<Self>> {
> +        let wq =3D workqueue::OrderedQueue::new(c"tyr-reset-wq", 0)?;
> +
> +        Arc::pin_init(
> +            try_pin_init!(Self {
> +                pdev,
> +                iomem,
> +                pending: Atomic::new(false),
> +                wq,
> +                work <- kernel::new_work!("tyr::reset"),
> +            }),
> +            GFP_KERNEL,
> +        )
> +    }
> +
> +    /// Processes one scheduled reset request.
> +    ///
> +    /// Panthor reference:
> +    /// - drivers/gpu/drm/panthor/panthor_device.c::panthor_device_reset=
_work()
> +    fn reset_work(self: &Arc<Self>) {
> +        dev_info!(self.pdev.as_ref(), "GPU reset work is started.\n");
> +
> +        // SAFETY: `Controller` is part of driver-private data and only =
exists
> +        // while the platform device is bound.
> +        let pdev =3D unsafe { self.pdev.as_ref().as_bound() };
> +        if let Err(e) =3D run_reset(pdev, &self.iomem) {
> +            dev_err!(self.pdev.as_ref(), "GPU reset failed: {:?}\n", e);
> +        } else {
> +            dev_info!(self.pdev.as_ref(), "GPU reset work is done.\n");
> +        }

Unfortunately, the reset operation is not as simple as instructing the
GPU to reset, it's a complex synchronization process where you need to
try to gracefully put various components on hold before you reset, and
then resume those after the reset is effective. Of course, with what we
currently have in-tree, there's not much to suspend/resume, but I think
I'd prefer to design the thing so we can progressively add more
components without changing the reset logic too much.

I would probably start with a Resettable trait that has the
{pre,post}_reset() methods that exist in Panthor.

The other thing we need is a way for those components to know when a
reset is about to happen so they can postpone some actions they were
planning in order to not further delay the reset, or end up with
actions that fail because the HW is already unusable. Not too sure how
we want to handle that though. Panthor is currently sprinkled with
panthor_device_reset_is_pending() calls in key places, but that's still
very manual, maybe we can automate that a bit more in Tyr, dunno.

> +
> +        self.pending.store(false, Release);
> +    }
> +}
