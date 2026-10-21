Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575498;
	b=BLdKzYA4OrMT4YCT4+1o1TcnFadbIAfW1C9Xq8bivnLTQAuCkGwP4RIJzqSdmiRYF2FH
	 TRs26+j7753o343k7uX0Zu+GFOy1r0Zo7cmEG13QYPNI0HqR9KUTzikvOpQmu4ajNZKEP
	 QqGis9kdDGOaX3meCnNF32HkLazH5bh8LvJJQoGcQ+avmSp5dgS0R7lmvnDCDZ5FheqJ5
	 F/tzZY2mi6GJvb5E57Pg+7H+MAk0Xi+fW074G/DZ2dvhmtkKt7tvhmLXYaJp2L7jYal9G
	 Op1tlCo2u9DfJLmC2ULsZa8KpOktg8JaWmoCcMvXI0rermyVa8SElZDXE7DXT+cw4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=DMEarNjccdTmA6jkwGLogCoUkmgNrujCfqG0VHqUqZ0=;
	b=WgCWi/KiogMPu6dZ4SYDluFSC+mMGiRJ86OT+telTmfC/CSwBnJJG5Ap7JuicKmcpOCR
	 1Rqi26qg/fbM2wWADugmumjboal3e4sWXxhyJsg990/y5YJNW24G5fawGi04G2iDETKlP
	 9PNc8ADjk/gcZNSH3jUIgHMjKz08IRw6QuP6G6KwAQHT6P5wVrd8NOQMrAoNgCY7GagSa
	 4hjlneYBH+EYQ32rP5LMwcuIxQDByxxnssAKhDfk+kdUBYCRFeBGSbx7n0rVgBAiSTjNS
	 dBp7e9MqagxRaWxuuBEK6Q/EhPmINAC4O250dpY0gNc545eDnKMpwHAZwbHCNODlkxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fsZgqehe;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE5606A31B
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BE5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fsZgqehe
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1e672580aso3558485e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792575496; x=1793180296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DMEarNjccdTmA6jkwGLogCoUkmgNrujCfqG0VHqUqZ0=;
        b=fsZgqeheiv0RIdAR84vZtdUXPTLyDINb3a1D8w141uuL0dqh8VGYlH0FqG2+lQ2fHL
         t56sKssJcbTljcPyBpGjln760D1KYiq+ozTLJS3OZDSIxkvwsuLXyGmx/776ggtSa+r2
         eE+1UX0B3sZLRMbELxavrXhs9QTKoclD5xgORykE1uNoqj4gCwHol5dJE2Bm14lfmOE6
         442uChcvZY3RqdZ41GZcORbaliRWtnFDTXn6Pb0i1APjZkvAGpEJCp+f3P5Cr9dGEg1V
         E8ruupPSbmJn9qYc5RyB5Wlk1vn1JN7LWUz0ZhapMFmpu77UhmGtK60axuJEOqqx17Ye
         /oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575496; x=1793180296;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMEarNjccdTmA6jkwGLogCoUkmgNrujCfqG0VHqUqZ0=;
        b=fNCpVIOdItQlPrGFFqFlMHquq0Kp45/5/+PVkkJGxBsEqGvOopNoy9OCDb5vm7vEsv
         sdxSc7SDwsOlTIpOcfNHpUblZCQcLt2jcVlSCRX2+zS7qxowgZxf7ektnjJ3F8qmJZQ9
         MmUhYOjnMufKCliXrIJaIOs4c6On5jRuM4Tw3Qj0v9Bq3v9+4f/uwjxuD1wC4lNH2sd4
         /J3OgTAGxJOWKw6fc2Ctq2cJyD9YeTxMK4atGzbAtvUITFVVFX5uJ6hlxoic6Q/hkT32
         v/jjrrOozG3FjEcjslnG3PHhdyxCHPCJBjmlwhrLpnjg6DGcB4B7SmNCumtwcQBUQ7RO
         JqfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL5XsPGuGiyZ4WDFe6QSs3XYzBh7k1CkGp/4f1BWdaPrcEqnWA7+N8l4ebWm6EUfh7x3/CN24iMjyQ4XlZYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJH/fzf7Wg4m7AwIhxLYwcF2NsBqOmJ6encbH8JZpkhFHA4FBuT
	fc5St7Kz7g58sITXIvSPs5qM2L0J6J6UMqWsTZHfLT0punWJT0I7ylb3IrvoewrWm8EnS58fzdi
	PQ4Go03gt8Wknoo4xDw==
X-Received: from wmix23-n2.prod.google.com ([2002:a05:600c:e557:20b0:4a1:f553:f96b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5391:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4a1fdd23e21mr30007175e9.19.1792575495499;
 Wed, 21 Oct 2026 02:38:15 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:38:07 +0000
In-Reply-To: <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev> <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021093808.1128449-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/2] drm/tyr: unplug the GPU when reset fails
From: Alice Ryhl <aliceryhl@google.com>
To: "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, airlied@gmail.com, 
	simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 01:50:08PM +0300, Onur =C3=96zkan wrote:
> @@ -56,7 +57,7 @@ pub(crate) struct TyrPlatformDriverData<'bound> {
>      // ensure the correct drop order.
>      #[pin]
>      _reset: reset::ResetHandle<'bound>,
> -    _reg: drm::Registration<'bound, TyrDrmDriver>,
> +    _reg: Arc<Revocable<drm::Registration<'bound, TyrDrmDriver>>>,
>      _device: ARef<TyrDrmDevice>,
>  }
> =20
> @@ -161,17 +162,18 @@ fn probe<'bound>(
>                      gpu_info,
>              });
> =20
> -            // SAFETY: `reg` is stored in the platform driver data and i=
s not leaked or
> -            // forgotten, so it is dropped before the `'bound` registrat=
ion data can become
> -            // invalid.
> +            // SAFETY: `reg` is wrapped in a `Revocable` owned by the pl=
atform driver
> +            // data and its reset handle. Neither is leaked or forgotten=
, so `reg` is
> +            // dropped before the `'bound` registration data can become =
invalid.
>              let reg =3D
>                  unsafe { drm::Registration::new_with_lt(pdev.as_ref(), u=
nreg_dev, reg_data, 0)? };
>              let device =3D reg.device().into();
> +            let reg =3D Arc::pin_init(Revocable::new(reg), GFP_KERNEL)?;

`drm::Registration::new` requires that the `Registration` is dropped
before `'bound` expires so that `drm_dev_unplug()` runs and
`TyrDrmRegistrationData<'bound>` is dropped while `'bound` is still
valid. Wrapping it in an `Arc` makes this invariant fragile: if any
`Arc` clone outlives `TyrPlatformDriverData` or is leaked,
`drm::Registration` will not be dropped on platform unbind and
`TyrDrmRegistrationData<'bound>` will outlive `'bound`.

With `pin-init`'s new safe self-referential struct support in `rust-next`
(see e.g. [1]), you can avoid both `Arc` and raw pointers altogether by
storing `_reg: Revocable<drm::Registration<'bound, TyrDrmDriver>>`
directly as a `#[pin]` field of `TyrPlatformDriverData<'bound>` and
having `_reset` borrow it via field + existential lifetimes:

    #[pin_data]
    pub(crate) struct TyrPlatformDriverData<'bound> {
        #[pin]
        #[uses('_reg: invariant)]
        _reset: reset::ResetHandle<'_reg>,
        #[pin]
        _reg: Revocable<drm::Registration<'bound, TyrDrmDriver>>,
    }

and in `reset.rs`:

    #[pin_data]
    struct Controller<'ctrl>
    where
        exists<'bound>: 'ctrl,
    {
        pdev: &'ctrl platform::Device<Bound>,
        state: Atomic<ResetState>,
        hw: Arc<HwGate<'ctrl>>,
        #[uses('bound: invariant)]
        registration:
            Pin<&'ctrl Revocable<drm::Registration<'bound, TyrDrmDriver>>>,
    }

Then `probe()` simply initializes `_reg` first and passes `_reg` to
`ResetHandle::new(pdev, hw, _reg)?`, `reset_work()` calls
`self.with_registration(|reg| reg.revoke())`, and `#[pin_data]`
statically checks that `_reset` drops before `_reg`.

Also, as a heads-up for rebasing onto `drm-rust-next`:
`_device: ARef<TyrDrmDevice>` has been removed from
`TyrPlatformDriverData` (along with the empty `PinnedDrop` impl), and
`drm::Registration::new()` now returns `impl PinInit<Self, Error>`
directly without the `flags` argument, so `_reg` can be initialized in
place via `Revocable::new(unsafe { drm::Registration::new(...) })`.

[1] https://lore.kernel.org/r/20261019133647.1279779-1-gary@kernel.org

Alice
