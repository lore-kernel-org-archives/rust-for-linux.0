Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D4372617
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 02:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770861874; cv=none; b=OIvwObFO6MWiZ+35TyfaENbC3Md5z3EYKC2LJvErFm6OdgVrEObMWCDUqLchb1Os6jkWnUOJXQqFd3EDrzSfEO/k0XmOL7koEjTwqzLqUiVMcfa1u+FiY72HxRpXVoGEagOg2HmS0+yYiSryjxGcDzBfdHln7s9KalszuT4QUOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770861874; c=relaxed/simple;
	bh=v+NptFig6DGraFcHTicDUmBzoaS71C6EXCrhYoNck4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C4Bl/I6MC0tOAcoRTV3i+s6W1LeVsiKSwdyGt+FvORj6DBNKhN+65n5zee1GAVKTRkicn3EGP2Q4IXXHj7YmjQqU2MlGoVJPxuzGcYRP10hdijulIbXUb+b8AhafitE/HA17Ha2loqEi7/DwTk4ra2zPBvKpCBZv37TvmFgPKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=RcrEUovY; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="RcrEUovY"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1EF7824002A
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 03:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1770861864; bh=sYcIeMw3E5vaN3wWVxSfiBAIhzlybUT7l4VnyZvDrUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=RcrEUovY+ut0vGsklm1eC9HU+B+odryKECFTTdW1Cfte9Zm0eEjajk3TmHzayLhkV
	 2HkHXrtKirh3tn60fHQQnUys4qJdkEKi1OsJRTbfd6mRwlxKSmtq/urlBRfPKOgVNt
	 k5fXglHeVgFI/2vqG3CpHlAZDq9pGdoj0ZZdeQYyU3+VNgC3lqJHZuw6a5/O5bwzC4
	 GMMXZcgTUZz6K3J7CKF0Q+zOsfYQoyGK+xeoZeEHdYZNGkRfZGbWd+rUnVGwIbMGEp
	 CqxVzFKC1aHNUBixmKq7nqLm2QvrROqwxE0YD77P2V2StFqMdAIN29lril3zVaYGEh
	 B7kdHZ4B5j3nA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fBJWn6Gl1z6tsb;
	Thu, 12 Feb 2026 03:04:21 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com,  aliceryhl@google.com,  dakr@kernel.org,
  airlied@gmail.com,  simona@ffwll.ch,  dri-devel@lists.freedesktop.org,
  linux-kernel@vger.kernel.org,  lgirdwood@gmail.com,  broonie@kernel.org,
  ojeda@kernel.org,  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] drm/tyr: make SRAM supply optional like panthor
In-Reply-To: <20260211195406.289634-1-work@onurozkan.dev>
References: <20260211195406.289634-1-work@onurozkan.dev>
Date: Thu, 12 Feb 2026 02:04:23 +0000
Message-ID: <87bjhu67kr.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Onur =C3=96zkan <work@onurozkan.dev> writes:

> On rk3588s, `dmesg | grep 'tyr'` logs:
>
>   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
>
> This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> which goes through the non-optional regulator_get() path. If the
> device tree doesn't provide sram-supply, regulator core falls back
> to a dummy regulator and writes that log.
>
> Panthor handles SRAM as optional and tolerates missing sram-supply.
> This patch matches that behavior in Tyr by using optional regulator
> lookup and storing SRAM as Option<Regulator<Enabled>> which avoids
> dummy-regulator fallback/noise when SRAM is not described inside
> the device tree.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/=
573210018
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  drivers/gpu/drm/tyr/driver.rs |  5 +++--
>  rust/kernel/regulator.rs      | 40 +++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 0389c558c036..e0856deb83ec 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -113,7 +113,8 @@ fn probe(
>          coregroup_clk.prepare_enable()?;
>=20=20
>          let mali_regulator =3D Regulator::<regulator::Enabled>::get(pdev=
.as_ref(), c_str!("mali"))?;
> -        let sram_regulator =3D Regulator::<regulator::Enabled>::get(pdev=
.as_ref(), c_str!("sram"))?;
> +        let sram_regulator =3D
> +            Regulator::<regulator::Enabled>::get_optional(pdev.as_ref(),=
 c_str!("sram"))?;
>=20=20
>          let request =3D pdev.io_request_by_index(0).ok_or(ENODEV)?;
>          let iomem =3D Arc::pin_init(request.iomap_sized::<SZ_2M>(), GFP_=
KERNEL)?;
> @@ -201,5 +202,5 @@ struct Clocks {
>  #[pin_data]
>  struct Regulators {
>      mali: Regulator<regulator::Enabled>,
> -    sram: Regulator<regulator::Enabled>,
> +    sram: Option<Regulator<regulator::Enabled>>,
>  }
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> index 2c44827ad0b7..8d95e5e80051 100644
> --- a/rust/kernel/regulator.rs
> +++ b/rust/kernel/regulator.rs
> @@ -283,6 +283,29 @@ fn get_internal(dev: &Device, name: &CStr) -> Result=
<Regulator<T>> {
>          })
>      }
>=20=20
> +    fn get_optional_internal(dev: &Device, name: &CStr) -> Result<Option=
<Regulator<T>>> {
> +        // SAFETY: It is safe to call `regulator_get_optional()`, on a
> +        // device pointer received from the C code.
> +        let inner =3D from_err_ptr(unsafe {
> +            bindings::regulator_get_optional(dev.as_raw(), name.as_char_=
ptr())
> +        });

Hello,

When CONFIG_REGULATOR is disabled, regulator_get_optional() becomes a
static inline stub in consumer.h, and bindgen cannot export it as a
symbol. The other regulator functions all have C helpers for this but
regulator_get_optional() is missing one.

So it causes a E0425 with CONFIG_REGULATOR not set.

  error[E0425]: cannot find function `regulator_get_optional` in crate `bin=
dings`
      --> rust/kernel/regulator.rs:290:23
       |
   290 |             bindings::regulator_get_optional(dev.as_raw(), name.as=
_char_ptr())
       |                       ^^^^^^^^^^^^^^^^^^^^^^ help: a function with=
 a similar name exists: `regulator_get_voltage`

> +
> +        let inner =3D match inner {
> +            Ok(inner) =3D> inner,
> +            Err(ENODEV) =3D> return Ok(None),
> +            Err(err) =3D> return Err(err),
> +        };
> +
> +        // SAFETY: We can safely trust `inner` to be a pointer to a valid
> +        // regulator if `ERR_PTR` was not returned.
> +        let inner =3D unsafe { NonNull::new_unchecked(inner) };
> +
> +        Ok(Some(Self {
> +            inner,
> +            _phantom: PhantomData,
> +        }))
> +    }

The Regulator struct invariant currently says:

  /// - `inner` is a non-null wrapper over a pointer to a `struct
  ///   regulator` obtained from [`regulator_get()`].

Since get_optional_internal() creates a Regulator from
regulator_get_optional(), should we also update it to mention it?


Cheers,
C. Mitrodimas

> +
>      fn enable_internal(&self) -> Result {
>          // SAFETY: Safe as per the type invariants of `Regulator`.
>          to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr(=
)) })
> @@ -300,6 +323,11 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self=
> {
>          Regulator::get_internal(dev, name)
>      }
>=20=20
> +    /// Obtains an optional [`Regulator`] instance from the system.
> +    pub fn get_optional(dev: &Device, name: &CStr) -> Result<Option<Self=
>> {
> +        Regulator::get_optional_internal(dev, name)
> +    }
> +
>      /// Attempts to convert the regulator to an enabled state.
>      pub fn try_into_enabled(self) -> Result<Regulator<Enabled>, Error<Di=
sabled>> {
>          // We will be transferring the ownership of our `regulator_get()=
` count to
> @@ -329,6 +357,18 @@ pub fn get(dev: &Device, name: &CStr) -> Result<Self=
> {
>              .map_err(|error| error.error)
>      }
>=20=20
> +    /// Obtains an optional [`Regulator`] instance from the system and e=
nables it.
> +    pub fn get_optional(dev: &Device, name: &CStr) -> Result<Option<Self=
>> {
> +        match Regulator::<Disabled>::get_optional_internal(dev, name)? {
> +            Some(regulator) =3D> {
> +                let enabled_regulator =3D
> +                    regulator.try_into_enabled().map_err(|error| error.e=
rror)?;
> +                Ok(Some(enabled_regulator))
> +            }
> +            None =3D> Ok(None),
> +        }
> +    }
> +
>      /// Attempts to convert the regulator to a disabled state.
>      pub fn try_into_disabled(self) -> Result<Regulator<Disabled>, Error<=
Enabled>> {
>          // We will be transferring the ownership of our `regulator_get()=
` count
