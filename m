Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81A52DFA2D;
	Thu, 12 Feb 2026 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889060; cv=none; b=c1tccn3bVUODdJvt1m1GiWazLnVkrpdodVdmtE/Km12D23/dOLyqin2cltzKgSO1eS4581kthFPwm8F/6gS3PZ888bA2Btx9my64pT4iYdKTWxZvk2GeYT6uQlamI+0NFcNaFLCS/BwEyXigEdiagpdaLfBjUjsCGg8DSoRB3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889060; c=relaxed/simple;
	bh=uk678cBU7Y9S+bp/R4SsWgNONVsaGQ4lQbgTB4WK5qE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BoDRV8m9GIKXT2CoGvJrNz0phLF7YX0SimWqGOLnt9x9DK165HWZMILDqNgf06qsPEZ4EuLcoL71P0QFRDYWAs2OnQwTLBk6pc6crd+13pGD9C8ExSAKOkDXfgbSIj21Rb3tjruvH3jdmge8sW1mV4u5MztXAypnMsJTd9r5X78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=N4zxHgoe; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="N4zxHgoe"
Received: from mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:9407:0:640:8fbc:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id 5F61EC46DC;
	Thu, 12 Feb 2026 12:37:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id PbQlX87GCeA0-UERPmDVy;
	Thu, 12 Feb 2026 12:37:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770889048;
	bh=w39PK5ahU618vaBalKGUKLougqCsZIXwtjYe/AMNTAM=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=N4zxHgoeaeqHqcYQMR8aTQDWvxzWtgEGyYU3WKWdDG1VRRQo6rVEA2ASMgZ5uUABV
	 vgreM03UbtoR20G4uCQ/zo5zn7/YcxQMr/KuTwG909YdXHKDA6QgH5uKyVnB9unM9+
	 RuKqiJ11ynx0aG0E1nthm9DYLqSLAxR/JXAKaUYo=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 12 Feb 2026 12:37:23 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212123723.0d028472@nimda>
In-Reply-To: <87bjhu67kr.fsf@posteo.net>
References: <20260211195406.289634-1-work@onurozkan.dev>
	<87bjhu67kr.fsf@posteo.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Feb 2026 02:04:23 +0000
Charalampos Mitrodimas <charmitro@posteo.net> wrote:

> Onur =C3=96zkan <work@onurozkan.dev> writes:
>=20
> > On rk3588s, `dmesg | grep 'tyr'` logs:
> >
> >   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
> >
> > This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> > which goes through the non-optional regulator_get() path. If the
> > device tree doesn't provide sram-supply, regulator core falls back
> > to a dummy regulator and writes that log.
> >
> > Panthor handles SRAM as optional and tolerates missing sram-supply.
> > This patch matches that behavior in Tyr by using optional regulator
> > lookup and storing SRAM as Option<Regulator<Enabled>> which avoids
> > dummy-regulator fallback/noise when SRAM is not described inside
> > the device tree.
> >
> > Link:
> > https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/5732=
10018
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev> ---
> >  drivers/gpu/drm/tyr/driver.rs |  5 +++--
> >  rust/kernel/regulator.rs      | 40
> > +++++++++++++++++++++++++++++++++++ 2 files changed, 43
> > insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tyr/driver.rs
> > b/drivers/gpu/drm/tyr/driver.rs index 0389c558c036..e0856deb83ec
> > 100644 --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -113,7 +113,8 @@ fn probe(
> >          coregroup_clk.prepare_enable()?;
> > =20
> >          let mali_regulator =3D
> > Regulator::<regulator::Enabled>::get(pdev.as_ref(),
> > c_str!("mali"))?;
> > -        let sram_regulator =3D
> > Regulator::<regulator::Enabled>::get(pdev.as_ref(),
> > c_str!("sram"))?;
> > +        let sram_regulator =3D
> > +
> > Regulator::<regulator::Enabled>::get_optional(pdev.as_ref(),
> > c_str!("sram"))?; let request =3D
> > pdev.io_request_by_index(0).ok_or(ENODEV)?; let iomem =3D
> > Arc::pin_init(request.iomap_sized::<SZ_2M>(), GFP_KERNEL)?; @@
> > -201,5 +202,5 @@ struct Clocks { #[pin_data]
> >  struct Regulators {
> >      mali: Regulator<regulator::Enabled>,
> > -    sram: Regulator<regulator::Enabled>,
> > +    sram: Option<Regulator<regulator::Enabled>>,
> >  }
> > diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> > index 2c44827ad0b7..8d95e5e80051 100644
> > --- a/rust/kernel/regulator.rs
> > +++ b/rust/kernel/regulator.rs
> > @@ -283,6 +283,29 @@ fn get_internal(dev: &Device, name: &CStr) ->
> > Result<Regulator<T>> { })
> >      }
> > =20
> > +    fn get_optional_internal(dev: &Device, name: &CStr) ->
> > Result<Option<Regulator<T>>> {
> > +        // SAFETY: It is safe to call `regulator_get_optional()`,
> > on a
> > +        // device pointer received from the C code.
> > +        let inner =3D from_err_ptr(unsafe {
> > +            bindings::regulator_get_optional(dev.as_raw(),
> > name.as_char_ptr())
> > +        });
>=20
> Hello,
>=20
> When CONFIG_REGULATOR is disabled, regulator_get_optional() becomes a
> static inline stub in consumer.h, and bindgen cannot export it as a
> symbol. The other regulator functions all have C helpers for this but
> regulator_get_optional() is missing one.
>=20
> So it causes a E0425 with CONFIG_REGULATOR not set.
>=20
>   error[E0425]: cannot find function `regulator_get_optional` in
> crate `bindings` --> rust/kernel/regulator.rs:290:23
>        |
>    290 |             bindings::regulator_get_optional(dev.as_raw(),
> name.as_char_ptr()) |                       ^^^^^^^^^^^^^^^^^^^^^^
> help: a function with a similar name exists: `regulator_get_voltage`

Yeah, I missed that.

>=20
> > +
> > +        let inner =3D match inner {
> > +            Ok(inner) =3D> inner,
> > +            Err(ENODEV) =3D> return Ok(None),
> > +            Err(err) =3D> return Err(err),
> > +        };
> > +
> > +        // SAFETY: We can safely trust `inner` to be a pointer to
> > a valid
> > +        // regulator if `ERR_PTR` was not returned.
> > +        let inner =3D unsafe { NonNull::new_unchecked(inner) };
> > +
> > +        Ok(Some(Self {
> > +            inner,
> > +            _phantom: PhantomData,
> > +        }))
> > +    }
>=20
> The Regulator struct invariant currently says:
>=20
>   /// - `inner` is a non-null wrapper over a pointer to a `struct
>   ///   regulator` obtained from [`regulator_get()`].
>=20
> Since get_optional_internal() creates a Regulator from
> regulator_get_optional(), should we also update it to mention it?

I think we should, will send v2 and cover both changes.

Thanks,
Onur

>=20
>=20
> Cheers,
> C. Mitrodimas
>=20
> > +
> >      fn enable_internal(&self) -> Result {
> >          // SAFETY: Safe as per the type invariants of `Regulator`.
> >          to_result(unsafe {
> > bindings::regulator_enable(self.inner.as_ptr()) }) @@ -300,6
> > +323,11 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
> > Regulator::get_internal(dev, name) }
> > =20
> > +    /// Obtains an optional [`Regulator`] instance from the system.
> > +    pub fn get_optional(dev: &Device, name: &CStr) ->
> > Result<Option<Self>> {
> > +        Regulator::get_optional_internal(dev, name)
> > +    }
> > +
> >      /// Attempts to convert the regulator to an enabled state.
> >      pub fn try_into_enabled(self) -> Result<Regulator<Enabled>,
> > Error<Disabled>> { // We will be transferring the ownership of our
> > `regulator_get()` count to @@ -329,6 +357,18 @@ pub fn get(dev:
> > &Device, name: &CStr) -> Result<Self> { .map_err(|error|
> > error.error) }
> > =20
> > +    /// Obtains an optional [`Regulator`] instance from the system
> > and enables it.
> > +    pub fn get_optional(dev: &Device, name: &CStr) ->
> > Result<Option<Self>> {
> > +        match Regulator::<Disabled>::get_optional_internal(dev,
> > name)? {
> > +            Some(regulator) =3D> {
> > +                let enabled_regulator =3D
> > +                    regulator.try_into_enabled().map_err(|error|
> > error.error)?;
> > +                Ok(Some(enabled_regulator))
> > +            }
> > +            None =3D> Ok(None),
> > +        }
> > +    }
> > +
> >      /// Attempts to convert the regulator to a disabled state.
> >      pub fn try_into_disabled(self) -> Result<Regulator<Disabled>,
> > Error<Enabled>> { // We will be transferring the ownership of our
> > `regulator_get()` count

