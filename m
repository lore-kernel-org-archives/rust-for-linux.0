Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003840;
	b=QK4Araw4F9ZUdhxVoI8VCtq7AxhK2cHS+kjDAnzfb2icV2wz93hUPe2DbQu+4MXc1sfh
	 tulkYCYKi1lekC6XbNrk1+qdOLSnJwBmQ5V6TLRAtmQ3NnnjPC5+qmhMep1cT3sQOy2Ae
	 QLkn1HSpEUuDfnYYpNqFgEP+EXINEa5CMB7LOhS00U/91z4CcP+/dicXfkigIG2aLKHel
	 eWYXSn5D7k+ACcc+/gdHcrQPbkwtW05tSDPx1ilZKcO3WFslZ+DRk7hLjj507eOALcfMT
	 NXBByG8abjL7AitFW4H3Mqmn7UPfiBqXPBIkkdAhDN7T1kuRawN5MwU9n83Xq17xkPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=qj1PLy2yInc0qHugCW7c4uxMVK1VS1mHZtMcI4xn/SA=;
	b=K0WYioWtUi0j/kxCfMcDXYtLnrPSHguebMIxTEPOJqO+tQcInmXEUPo5WOvb9XOsU6wM
	 U5JP8hfUVDHfY3XGG13DMFJOyt89uA+aypeG9ZGq72JpNP6e7NOat1Dg97q2Ay3RO2MDV
	 zQz7xTbe/6xpSz0YnfsjhGIxY+laZ38eWduNmSA/wTq1EN0DhBBDs3jpGDDtRha3VLMkQ
	 7Q0zlCZ/Yn5TB36+EUv+6PZofbQHE+IfRly9AIqD1wdKK2/IVnaHFjdw1CHyze2KpJ3FA
	 vXASH9gasruoqgnzRgj82R0MlcSSLZPo0+BYC6zv1hKaoWNhtFcyItVie48/kdB8D5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bapSOEt2;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41252606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 12:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41252606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bapSOEt2
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so906815f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 04:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795003839; x=1795608639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qj1PLy2yInc0qHugCW7c4uxMVK1VS1mHZtMcI4xn/SA=;
        b=bapSOEt2yW/HPhm5fe3mo9ZKAMuYA6DQELqvDkIA+dKDC9dGShG2nTqoFU8Jx9OyVq
         Pmlk5tfxofX4tZv8Odbtc4K54jbSgz37RmWhGtmzFmJQYhsPTAcSzD5jbiySQ8kAKxmk
         NpB6mhBRbDMnyTbVOYZNU95SguzVcUSD/PyI8H1+KFcMZ5F6+CsqsAvdGMxVRkpd4GnP
         Koa8XbMnnJbTdaLfnEgr1xVMNdzPH88uPIqKx0kR93dFp/t+7+bd2jN0Uz7DLEJLFsUC
         nqT1i+AngkHar8mz/kIvFTgKgmoMwKkOUdksgZTZK20OKLm4y2ixgE1H9kptRSSDXoO1
         ntuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003839; x=1795608639;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qj1PLy2yInc0qHugCW7c4uxMVK1VS1mHZtMcI4xn/SA=;
        b=ihUDm8XZaqe5qWExCu1q+UBng/vfR/+Qln2onKf8eZpHOyoGDIinJ28iU9Ic486Brh
         A7GW0FVNx3n595o8snsrlIS2dg7weFwaTVTtY/CIBiAmY/uWscNyHF/SU7G8dxeSGBXu
         33mu80aJgQ4vzsbNW3dpC2/ulrZyT65sDTKDakfXwRxR1PTFko0VoUny4tto8H4ccPVL
         zseAgNcAx1kH8DF2kCEcEkWGiTk6G1oUUPrZDusDtq9im6gQU9Ok2nkMugPVEMQKfNwq
         67GHRjMk7mJrMmx4ZzwRm1YKJnkS/vwVFshHXyyD8zxTYlS5NtIk50sZ3zdbfdaZTHyl
         9rgg==
X-Forwarded-Encrypted: i=1; AL+hErGGGe5j4SMY908q7GKCUABoz3dHQFJLEhgm5QTEEReojWH7hXiSbyFsPArMdNdsQj6CpjFy8bhGBO3CWIzTfw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aZe3lJPHwpvO6P7aji5pwpmMrWO7wQ6N5Z+Nrz61LPqwCI+Po
	8x2loxbgceeI8/2e7sh0v5XhljAA1fvxfrZd8T50elLzACXgVscEpq0Ibkj5YKcJleZ2EEFEhFT
	HcrqGQP2lPjENxTH90w==
X-Received: from wrpe7.prod.google.com ([2002:adf:f347:0:b0:496:d435:25e5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e05:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb7da03dfemr41829965e9.11.1795003838418;
 Wed, 18 Nov 2026 04:10:38 -0800 (PST)
Date: Wed, 18 Nov 2026 12:10:37 +0000
In-Reply-To: <20261113-tyr-reset-impl-v8-2-2ee298ac9808@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev> <20261113-tyr-reset-impl-v8-2-2ee298ac9808@onurozkan.dev>
Message-ID: <av2VvS0bRJYVwdUz@google.com>
Subject: Re: [PATCH v8 2/3] drm/tyr: add GPU reset infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 05:32:27PM +0300, Onur =C3=96zkan wrote:
> +    /// Processes one scheduled reset request.
> +    ///
> +    /// If the pending reset cannot be claimed, the worker returns immed=
iately.
> +    ///
> +    /// It first claims [`ResetState::Pending`], then waits for earlier =
hardware
> +    /// accesses to complete before issuing the reset and returning the =
worker
> +    /// state to [`ResetState::Idle`].
> +    ///
> +    /// Panthor reference:
> +    /// - drivers/gpu/drm/panthor/panthor_device.c::panthor_device_reset=
_work()
> +    fn reset_work(&self) {
> +        if !self.try_transition(ResetState::Pending, ResetState::InProgr=
ess) {
> +            return;
> +        }
> +
> +        dev_dbg!(self.pdev, "Starting GPU reset.\n");
> +
> +        // Wait for current hardware accesses to finish before resetting=
.
> +        let reset_guard =3D self.hw.close();
> +        let reset_result =3D run_reset(self.pdev.as_ref(), &self.iomem);
> +        drop(reset_guard);
> +
> +        if let Err(e) =3D reset_result {
> +            dev_err!(self.pdev, "GPU reset failed: {:?}\n", e);
> +
> +            // TODO: Unplug the GPU.
> +            // There is no API for unplugging the GPU and this is unreac=
hable
> +            // for now since there are no hardware users for reset API.
> +        } else {
> +            dev_dbg!(self.pdev, "GPU reset completed.\n");
> +        }
> +
> +        let _ =3D self.try_transition(ResetState::InProgress, ResetState=
::Idle);

I'm pretty sure this needs to happen before drop(reset_guard).

> +    /// Creates [`ResetHandle`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The returned handle must not be leaked or otherwise prevented fr=
om
> +    /// running [`Drop`], since it owns work that may borrow from `'rese=
t`.
> +    pub(crate) unsafe fn new(
> +        pdev: &'reset platform::Device<Bound>,
> +        iomem: ArcBorrow<'_, IoMem<'reset>>,
> +    ) -> Result<impl PinInit<Self, Error>> {
> +        let iomem =3D iomem.into();
> +
> +        Ok(try_pin_init!(Self {
> +            // SAFETY: The caller guarantees the handle is dropped.
> +            controller <- unsafe {
> +                kernel::new_scoped_work!("tyr::reset", Controller::new(p=
dev, iomem))
> +            },
> +            wq: Queue::new_ordered().build(c"tyr-reset-wq")?,
> +        }))

The Result is not needed. This can simplify to:

	) -> impl PinInit<Self, Error> {
	    let iomem =3D iomem.into();
=09
	    try_pin_init!(Self {
	        // SAFETY: The caller guarantees the handle is dropped.
	        controller <- unsafe {
	            kernel::new_scoped_work!("tyr::reset", Controller::new(pdev, i=
omem))
	        },
	        wq: Queue::new_ordered().build(c"tyr-reset-wq")?,
	    })

> +    }
> +
> +    /// Schedules a GPU reset on the dedicated workqueue.
> +    ///
> +    /// If a reset is already pending or in progress the call is a no-op=
.
> +    #[expect(dead_code)]
> +    pub(crate) fn schedule(&'reset self) {
> +        // TODO: Similar to `panthor_device_schedule_reset()` in Panthor=
, add a
> +        // power management check once Tyr supports it.
> +
> +        if self
> +            .controller
> +            .try_transition(ResetState::Idle, ResetState::Pending)
> +        {
> +            let _ =3D self.wq.enqueue_scoped(&self.controller);
> +        }

Because this type is invariant over 'reset, it's impossible to call a
method that takes &'reset self.

I think you can just change this to &self.

Alice
