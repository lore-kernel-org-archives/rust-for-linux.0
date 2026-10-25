Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792929926;
	b=ot7eZvcAmHEZxlrVrMVkXDMt9ewf8pYftA7aOELxFhcFEzuyGJhTxpK100EIYTZk3y76
	 AgzPH2vxo5moTDzXmOOm+aCrIOaV85ZL34DD24JJvdYNcdunboNB6kw5gpPcZPt3atIc7
	 maUbldVUeWFCBcYWnqksOVVk+9oDryEXxIVrxmWR2O0EcC3kbriw9hSSDXOgPEHUa1IVf
	 Cc3CoNQuLOvEPtVfR6qikz8fnAAz1O6Clb+rO4m7wLVhRpLT0VY7OVvqIDSkTNQij4CfW
	 PLzA9f2TXGBbQH/0uXE3qMeBA/KF6BO7oB3cYtD6BKRHufrLyxawsk08lEmAVHuYO1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792929926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZLCOnd82Q2AmvSjk1g9482NEnoKPBW6l7CpBPhWPtsU=;
	b=vtwp+8c2p8Qlzev/KHL/qPXjen95Ta4iNYSYAito3aUSXxz2WyvqzsiphYaAs/w+ToJH
	 TJt9fERmNsAzamMxCKHhLCj8cyzAlWAR0dxSS05W5gm82LpN+UA1vC+3k8eJMOv0JyBxf
	 SuSIlguxmYgU820nEt5stG3s/2z5oad0R9Osj6PwTA5JGLEc0gj0HPSXcnDgbqbAe2Q5x
	 LbCRSPuocGID6NGZLlN3NXnpkIvj4vnMDSFsDcHBQncWrvchaOjcTJ5y/74O+Lblw+E67
	 p1snnrKaY9sN6hQ1H2qfCa0u68MFK7xWNETrm70TgOXeWnTeO7cLnKztVDjt2tSsT0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GBihmkTC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F9606A31B
	for <rust-for-linux@vger.kernel.org>; Sun, 25 Oct 2026 12:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GBihmkTC
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1068219f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Oct 2026 05:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792929924; cv=none;
        d=google.com; s=arc-20260327;
        b=sg08pvAnlQDEsr9JfndEOylELqmgCq0+PA3s+OzAE3BPC38OWBnpbPviDVQivu/JSK
         BOHpgEGYJlmeaEq+aHxWYzd5ENWBCc+gHWYTAsIBnANjh+vIQHhfMXBAIXEA97vwaTem
         MrIgNMCKy4Htm692o9OJ25fiHDtUdsJ47vOiisYCpREUbjzQFMaSaRGHCCi4F3IZDHWP
         h5HsCQm0OoymeJ8j87EIb+U9Pjnhs4Bp2K9FINQIpWiCCR//AtADbFWmKl7/kziEC555
         OvZ5778BjFiW826PGjtgrn423IBxwPhA7kBh7u6ALNaj4RYsCcbNQILVfwNPUUlAvHcC
         m4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLCOnd82Q2AmvSjk1g9482NEnoKPBW6l7CpBPhWPtsU=;
        fh=XFvozpVDAY5afpb4pzwTgwi13TbE56qBL+i1oJy3HqA=;
        b=PlOk17jcdHCn5/lNk/YCwtlSxgkq9xdTTrc0vOG+mKbg9VBVJYOGX3EN3mv5k7Enr4
         r7kq2l5fSBdH5d17RrFSXSunIEXh84ddHDuRHe6Rpo9xWcuGCpNtRQyk58K02A8/HooM
         QTO5E0IY19IIFUlYWjRcD/8eNQfklpTuZsAAju4XUpwkx9Yngbe9ZwhhLa/4WDbRIVza
         nChnxIQTvIIY/7OKBCTMEuj9RFgAbaoUZCB56Da/cA58jcgmQ0otSTQANBW/TNG1OwFl
         B8ubpaRJzHy/3uqJDzaqzL9R+/MLAvzL5ZWUr9QyulWGTPlHL0Xt8MAMPzCpixCu2l2Y
         KZcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792929924; x=1793534724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLCOnd82Q2AmvSjk1g9482NEnoKPBW6l7CpBPhWPtsU=;
        b=GBihmkTCfHn+bfUYbg5tWYX7ugUcM7fxxWrF/zRRCSXag4BycNDkC0a+lcBBsqSshz
         XvzxWVb5fK0a4IEInLXlS7Stu2IcUSWQtANo8BM/0NEjnkci4hNcju59hcIiBVg3Y6uE
         a0N2YIkj5LXDjERGxAo/qPrz8wW1jU0sd8/2SgkPyXtaVz1895anA0Zfne+0FUp9OlOD
         qyZFWBoiDPWbWEk/Lawl/2zUyQOPJckcrhz7vidhpaAxXRKrRPka43Xtnc5gUxDxlBR8
         0cHdW22MDXuh224/lV8nrSsx7FF6N9IXp3/7PfZSjv70r8rxP3nZQbl3UhAi4rlkacPI
         Q4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792929924; x=1793534724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLCOnd82Q2AmvSjk1g9482NEnoKPBW6l7CpBPhWPtsU=;
        b=oXW0tnn9SZKz90xWHyAY/YH3Ar05DESq9eXhY6q/YT/M+fadnHeLPYHAz/4zHaVJTJ
         nzW9BQ/hnoU+KbvPFrOLndGUzGIVGl+X3ryGrEatRJR0/Nf8ji37EeWSfPy1ipOVXtai
         iUMIzrFCdajuDTojYWlMOCIu90LY4L9T9VA3Mw+m1KukCV8GTBkvoyHqcxCfb/EYi+6z
         ZIwCf1sx40CWjR7Iq7DCu4YH2i2IUf1Hg1Iyg3jfhylfQN61soW9QLOGDHIk++fyGrfk
         1zoj36LsrAGkpQKWk3NZVIlTinbFRitYPH85rPzr7hHSsFY50RAqmiyRRJwaPDu2HIZa
         kfPw==
X-Forwarded-Encrypted: i=1; AKwUvByKhJJbp9iavlXRG/jk5LlyJz/0Auc7J0PX8D4mvVgi7b9JjS22DL5IZTYyPUwcnhgTEvYNTln41l/h5PGCcw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0YNtNVSuhO/7wRgROySxFdu1fsJeXMBcm65x24j4y+YUgelRK
	bPbS3Q/RhSV12RaIsi+qcljC2d6ALwCJGAFS+JLBN7miyPl8Ot1SWi6QkG6/qiz/1MIyRDJqRAt
	7bbuYrphC7UDsPEZC/xSPILhPoj3lpVFma3v/Tjjw
X-Gm-Gg: AYBFou0gEOt4F8m5IoxSPa/dalyu6breWctYUhpfjBo1jyUvki8FWS9D9VVO+cOO97Q
	TFAY9BRqsjbcK3i8Q/VVzdwy9aJoDXTTa958u6ZTDsCSqXlYxx2lqKltxfueSpJOg9ZNi1yxJMs
	ydT2m6t9YQ6gyhafKSrALm26dKYHWMLFBbb7LCZM4QUwD2JxmfmOJytNJm5SUBghzFPTojuTzht
	LY/LZCbJ6g8LBc3H7kOJYiVYwDwDgA0Y0fMLLc3uOXBxAIfq0i1GOkFSsCxN4pYhtxZUDUjMVMC
	cDbOhsZ24JO68Ogj6MazpXU28rsb4sjRnVOi5j9aQupLWI+rNnDUhjQXoXm+VHumtksxF8COlob
	RHnqreTTmdH8W/WAlbDJcrnQMaN2QrkZDQOHvV4meVVueemw+gRBStXCdLlLXwU2GwLVDMh+6EP
	sWx5tEOMyBJtOdyg==
X-Received: by 2002:a5d:5f44:0:b0:48b:10af:f85c with SMTP id
 ffacd0b85a97d-48e3eb9da68mr6693615f8f.37.1792929923496; Sun, 25 Oct 2026
 05:05:23 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev>
 <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev>
 <20261021093808.1128449-1-aliceryhl@google.com> <20261025112341.60054-1-work@onurozkan.dev>
In-Reply-To: <20261025112341.60054-1-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 25 Oct 2026 13:05:09 +0100
X-Gm-Features: AclHuK_vlq1pG_e9KogyCUhHCbMVS-gy1nu0YhyrawGdRf1hO7SrcpUQY2i8IzE
Message-ID: <CAH5fLghQAGskFzEOAQwjO9eDoKU51nG4L0C8EHNOtugWov4hHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/tyr: unplug the GPU when reset fails
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:23=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> On Wed, 21 Oct 2026 09:38:07 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Sun, Aug 23, 2026 at 01:50:08PM +0300, Onur =C3=96zkan wrote:
> > > @@ -56,7 +57,7 @@ pub(crate) struct TyrPlatformDriverData<'bound> {
> > >      // ensure the correct drop order.
> > >      #[pin]
> > >      _reset: reset::ResetHandle<'bound>,
> > > -    _reg: drm::Registration<'bound, TyrDrmDriver>,
> > > +    _reg: Arc<Revocable<drm::Registration<'bound, TyrDrmDriver>>>,
> > >      _device: ARef<TyrDrmDevice>,
> > >  }
> > >
> > > @@ -161,17 +162,18 @@ fn probe<'bound>(
> > >                      gpu_info,
> > >              });
> > >
> > > -            // SAFETY: `reg` is stored in the platform driver data a=
nd is not leaked or
> > > -            // forgotten, so it is dropped before the `'bound` regis=
tration data can become
> > > -            // invalid.
> > > +            // SAFETY: `reg` is wrapped in a `Revocable` owned by th=
e platform driver
> > > +            // data and its reset handle. Neither is leaked or forgo=
tten, so `reg` is
> > > +            // dropped before the `'bound` registration data can bec=
ome invalid.
> > >              let reg =3D
> > >                  unsafe { drm::Registration::new_with_lt(pdev.as_ref(=
), unreg_dev, reg_data, 0)? };
> > >              let device =3D reg.device().into();
> > > +            let reg =3D Arc::pin_init(Revocable::new(reg), GFP_KERNE=
L)?;
> >
> > `drm::Registration::new` requires that the `Registration` is dropped
> > before `'bound` expires so that `drm_dev_unplug()` runs and
> > `TyrDrmRegistrationData<'bound>` is dropped while `'bound` is still
> > valid. Wrapping it in an `Arc` makes this invariant fragile: if any
> > `Arc` clone outlives `TyrPlatformDriverData` or is leaked,
> > `drm::Registration` will not be dropped on platform unbind and
> > `TyrDrmRegistrationData<'bound>` will outlive `'bound`.
> >
> > With `pin-init`'s new safe self-referential struct support in `rust-nex=
t`
> > (see e.g. [1]), you can avoid both `Arc` and raw pointers altogether by
> > storing `_reg: Revocable<drm::Registration<'bound, TyrDrmDriver>>`
> > directly as a `#[pin]` field of `TyrPlatformDriverData<'bound>` and
> > having `_reset` borrow it via field + existential lifetimes:
> >
> >     #[pin_data]
> >     pub(crate) struct TyrPlatformDriverData<'bound> {
> >         #[pin]
> >         #[uses('_reg: invariant)]
> >         _reset: reset::ResetHandle<'_reg>,
> >         #[pin]
> >         _reg: Revocable<drm::Registration<'bound, TyrDrmDriver>>,
> >     }
> >
> > and in `reset.rs`:
> >
> >     #[pin_data]
> >     struct Controller<'ctrl>
> >     where
> >         exists<'bound>: 'ctrl,
> >     {
> >         pdev: &'ctrl platform::Device<Bound>,
> >         state: Atomic<ResetState>,
> >         hw: Arc<HwGate<'ctrl>>,
> >         #[uses('bound: invariant)]
> >         registration:
> >             Pin<&'ctrl Revocable<drm::Registration<'bound, TyrDrmDriver=
>>>,
> >     }
> >
> > Then `probe()` simply initializes `_reg` first and passes `_reg` to
> > `ResetHandle::new(pdev, hw, _reg)?`, `reset_work()` calls
> > `self.with_registration(|reg| reg.revoke())`, and `#[pin_data]`
> > statically checks that `_reset` drops before `_reg`.
> >
> > Also, as a heads-up for rebasing onto `drm-rust-next`:
> > `_device: ARef<TyrDrmDevice>` has been removed from
> > `TyrPlatformDriverData` (along with the empty `PinnedDrop` impl), and
> > `drm::Registration::new()` now returns `impl PinInit<Self, Error>`
> > directly without the `flags` argument, so `_reg` can be initialized in
> > place via `Revocable::new(unsafe { drm::Registration::new(...) })`.
> >
> > [1] https://lore.kernel.org/r/20261019133647.1279779-1-gary@kernel.org
> >
> > Alice
>
> Any idea when will we push drm-rust-next changes into rust-next?

We are currently in the merge window, so drm-rust-next and rust-next
are both being pushed into Linus's tree. Once the merge window is
over, drm-rust-next will have everything that was pushed to Linus's
tree available.

Alice
