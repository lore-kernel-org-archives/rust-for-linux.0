Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C3145348;
	Fri, 16 Jan 2026 14:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575410; cv=none; b=VxpG+YY8x5Gw2Ig7S6+du73PvUSY+tcPKH3WAz3rRWJ+0u1bjPbbJyv/J8UsjX19Vvdf8qaTkcusLLhJviC552CwUp/kGjMkR+k8f8WTWK45umnPa4/klrBvpBoUAXC23sEvLqVRj9yBlMU2OUQUPmlCWyXBY97rYmDuvj24Qmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575410; c=relaxed/simple;
	bh=2JoClbec96BY85VamADJFdjLrX1U0JIvrcFE4hjLJp8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=QJ4NWz/F6+5w5cRhNTYN9DoDbqCNr/Xv1WnpsIQ5Aj0qcVmJLSaUCUkdDlxfQ+6Ph0Y01PCM/VeV/an0eO+/cEBHvhg7sl7uOw1vNlku48ADAc9ITz8r2Ctt8z8AqnwdlxLgMCWEl8rsZgGWR3DwNVbeS2bOS/wAy01NL/KO0Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faZdeaNk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faZdeaNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ABF7C19421;
	Fri, 16 Jan 2026 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575410;
	bh=2JoClbec96BY85VamADJFdjLrX1U0JIvrcFE4hjLJp8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=faZdeaNk+CybF1zgQ+kYHKH3wxZBlpWkubvhzGMIasBt6yjniPCuaZoEHEN/cCAxH
	 XOdCIsWHiLMecrt0kr3LM0CA3Q8qoAnOhaR/MJO03Zr+xcCP+rnpwmeAaQqmKR9Iq4
	 HBWPMzvKFjQqZGW4UCY27PLiAwMa0ShwS16EE5MDq0weSzECIHVnfEaNYIBHw01vQa
	 kqv8qKRfIgDY6+C1QDGtNQv5A1na7pCIHTxxC6Lyvvb3sl//ucz187AGW+pQfgdW3m
	 UzIMz824HcUuP7O2/wuGzxWksKtxJCwCMYQj3Z51pVtEnk1wLyOPWbwZYHSaY95a1N
	 gKV8YldDsJv3A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 15:56:44 +0100
Message-Id: <DFQ3NOFEAIRC.3V5QZUXJJ7CMA@kernel.org>
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
Cc: "Dirk Behme" <Dirk.Behme@de.bosch.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Steven Price" <steven.price@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <fdc39008-ba4a-4170-b7ce-cca2deda5652@de.bosch.com>
 <1EF6A3B7-216F-47C3-8631-25C38994BAC1@collabora.com>
In-Reply-To: <1EF6A3B7-216F-47C3-8631-25C38994BAC1@collabora.com>

On Fri Jan 16, 2026 at 1:26 PM CET, Daniel Almeida wrote:
> +cc Alex,
>
>
>>>> +    31:0    l2_pwractive_hi as u32, "Bitmap of L2 caches active (high=
er 32 bits)";
>>>> +});
>>>> +
>>>>  pub(crate) const MCU_CONTROL_ENABLE: u32 =3D 1;
>>>>  pub(crate) const MCU_CONTROL_AUTO: u32 =3D 2;
>>>>  pub(crate) const MCU_CONTROL_DISABLE: u32 =3D 0;
>>>>  -pub(crate) const MCU_STATUS: Register<0x704> =3D Register;
>>>> +register!(McuControl @ 0x700, "Controls the execution state of the MC=
U subsystem" {
>>>> +    1:0     req as u32, "Request state change";
>>>> +});
>>> Any reason why req is a u32 and not a u8? Same for some other places.
>>> And would it be an option to move the const MCU_CONTROL* to an =C3=ACmp=
l
>>> McuControl Same for STATUS below.
>>=20
>> Just fyi something like [1] builds for me.
>>=20
>> This is inspired by
>>=20
>> https://lore.kernel.org/rust-for-linux/20251003154748.1687160-6-joelagne=
lf@nvidia.com/
>>=20
>> Best regards
>>=20
>> Dirk
>>=20
>> [1]
>>=20
>> #[repr(u32)]
>> #[derive(Debug, Default, Clone, Copy, PartialEq)]
>> enum McuControl {
>>    #[default]
>>    Disable =3D 0,
>>    Enable =3D 1,
>>    Auto =3D 2,
>> }
>>=20
>> impl From<McuControl> for u8 {
>>    fn from(ctrl: McuControl) -> Self {
>>        ctrl as u8
>>    }
>> }
>>=20
>> impl From<u8> for McuControl {
>>    fn from(req: u8) -> Self {
>>        match req & 0x3 {
>>            0 =3D> McuControl::Disable,
>>            1 =3D> McuControl::Enable,
>>            2 =3D> McuControl::Auto,
>>            _ =3D> McuControl::Disable,
>>        }
>>    }
>> }
>>=20
>> register!(MCUCONTROL @ 0x700, "Controls the execution state of the MCU s=
ubsystem" {
>>    1:0     req as u8 =3D> McuControl, "Request state change";
>> });
>
> Alex, looking at the above, I wonder if a =E2=80=9Cas Foo=E2=80=9D would =
be a good
> addition to the macro? That would then invoke a TryFrom implementation, i=
.e.:
>
>
> register!(MCUCONTROL @ 0x700, "Controls the execution state of the MCU su=
bsystem" {
>    1:0     req as McuControl =3D> McuControl, "Request state change";
> });

This would imply the assumption that req is treated as u8 by register!()
automatically before calling the TryFrom impl.

One could argue that this is reasonable, since the value is only two bits w=
ide,
but it might not always be desired. I think keeping this explict is better.
