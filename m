Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600BD33E361;
	Fri, 13 Feb 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770986549; cv=none; b=muzLRt2dZue/5jx8Il0WUv5Yqt+5XGuQr1p/Ob/ZRvuOYoiECfBIiDugIiOWWE2p32WFjXDt6AyLpd+ywjhCAhVr56KQ5tiMxC3mLRS2yYY7kzIh56iauOojW4nrS7v5qnx2I2NvCj0pgjRBmbQ1Oysqhyo0mLsBUYKXAqp9JiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770986549; c=relaxed/simple;
	bh=izEpIw/KB9kubFDz9uQfuvRTCBTsInmFoaHhC+AejMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xr0TB3tIjEuFN5svvtErX/08nIZ2wd0S4VQ2JUJfYsvDyUELDADI+WPqrdExdaHEEdDAHDLnr1jG6H29JQUd70/Xu+MEu2/eb/0lmuMkGwOOxeXWJfMBIyIO7XhGBq53arjhtLjsElhge73QU1pkQrFX1DQI4wd9tcFtoWo9w0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Frtcg4KL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Frtcg4KL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770986541;
	bh=izEpIw/KB9kubFDz9uQfuvRTCBTsInmFoaHhC+AejMQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Frtcg4KLJw858ZVUurXgIJ9l8/Po+WwnTMcCXlAqrdKypl1EyPQnwo9ahWX7fdsJz
	 gOljecH8T27TxFLgU0+TqO7R1/e/y6gVM2HPbbhX9DE2Kw2CH/+LJUPwzdzYt8JoxD
	 H7dCyXdpUYF3HuuYu7s1voJfVRCTOnh+aM6qhLV3ai619cfjR+3z5NippwkWASnDkv
	 ic3w/geF21yV2hNUe1SOyPvXkTf2jixbJZOn2ss35TRR335Rzhcff1hM2ZeRkg65cz
	 /V12Y/KmP0nsWJK62GCN0ks0AiT2q6dk0U0phGUhhUP+ZNoxHUFySRI/mzwydp+dx4
	 eEn3nJpNX+Qag==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9AEC17E12C6;
	Fri, 13 Feb 2026 13:42:20 +0100 (CET)
Date: Fri, 13 Feb 2026 13:42:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mark Brown
 <broonie@kernel.org>, daniel.almeida@collabora.com, aliceryhl@google.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260213134215.27141dfe@fedora>
In-Reply-To: <aY8V8xlTv0UAdyQz@e142607>
References: <20260212100538.170445-1-work@onurozkan.dev>
	<20260212100538.170445-2-work@onurozkan.dev>
	<4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
	<20260212151644.4c179594@nimda>
	<6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
	<20260212134601.7760f414@fedora>
	<a76b1e27-87ea-42e0-88f3-0512b2e1ac0b@sirena.org.uk>
	<20260212145134.799bb6fa@fedora>
	<20260212213010.56db1d1d@nimda>
	<aY8V8xlTv0UAdyQz@e142607>
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

Hi,

On Fri, 13 Feb 2026 12:15:47 +0000
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> On Thu, Feb 12, 2026 at 09:30:10PM +0300, Onur =C3=96zkan wrote:
> > On Thu, 12 Feb 2026 14:51:34 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >  =20
> > > On Thu, 12 Feb 2026 13:13:31 +0000
> > > Mark Brown <broonie@kernel.org> wrote:
> > >  =20
> > > > On Thu, Feb 12, 2026 at 01:46:01PM +0100, Boris Brezillon wrote: =20
> > > > > Mark Brown <broonie@kernel.org> wrote:   =20
> > > >  =20
> > > > > > The panthor driver is buggy here and should be fixed, the
> > > > > > driver should treat the supply as mandatory and let the system
> > > > > > integration work out how it's actually made available.   =20
> > > >  =20
> > > > > > Trying to open code this just breaks the error handling.   =20
> > > >  =20
> > > > > Maybe, but the thing is, the DT bindings have been accepted
> > > > > already, and it's not something we can easily change. What we can
> > > > > do is make this sram-supply mandatory for new compatibles, but we
> > > > > can't force it on older/existing SoCs without breaking
> > > > > backward-DT compat.   =20
> > > >=20
> > > > In practice you can because we do sub in a dummy regulator for
> > > > missing supplies, it produces a warning but works fine.  If we
> > > > didn't do this it'd be basically impossible to add regulator
> > > > support to anything at any point after the original merge which is
> > > > clearly not reasonable. =20
> > >=20
> > > Okay, I guess we need to fix panthor then...
> > >  =20
> >=20
> > That + updating the log to something like "sram-supply is missing in
> > the DT" would be quite better I think. It would make the issue more
> > obvious and convey that the DT file is expected to configure that field
> > explicitly. With the current log message, not many people will
> > understand the problem at a glance.
> >=20
> > As for the bug I described in this patch, we can proceed with the
> > alternative solution (updating the DT file) that I mentioned in the
> > Zulip thread (the link is included in the patch). Which is this simple
> > diff:
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > index dafad29f9854..a30339fd2c10 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> > @@ -177,6 +177,7 @@ &gmac1_rgmii_clk
> >=20
> >  &gpu {
> >         mali-supply =3D <&vdd_gpu_s0>;
> > +       sram-supply =3D <&vdd_gpu_mem_s0>;
> >         status =3D "okay";
> >  };
> >=20
> > @@ -537,7 +538,7 @@ rk806_dvs3_null: dvs3-null-pins {
> >                 };
> >=20
> >                 regulators {
> > -                       vdd_gpu_s0: dcdc-reg1 {
> > +                       vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 { =20
>=20
> You don't need to define a new label, using the same supply for mali-supp=
ly and
> sram-supply should be fine.
>=20
> >                                 regulator-name =3D "vdd_gpu_s0";
> >                                 regulator-boot-on;
> >                                 regulator-min-microvolt =3D <550000>;
> >=20
> > Note that this only fixes the issue for the Orange Pi 5. If we want
> > to go further, the same approach should be applied to many other boards
> > as well. I can generate a list of the DT files (using a simple Python
> > script) that need this update over the weekend. =20
>=20
> Yes, please, but bias the script towards using the same regulator as mali=
-supply.
>=20
> >=20
> > If we want to go even further and fix all DT files to properly include
> > sram-supply we could also enforce that DT files do not omit sram-supply
> > in the future. I am not sure this is strictly necessary but it also
> > doesn't seem consistent to leave things as they are. Right now, some DT
> > files include sram-supply even when there is no separate SRAM rail,
> > while others do not. As a result, some boards will continue to print
> > that annoying log message.
> >=20
> > It's not very clear which approach is best. =20
>=20
> I'm in favor of the proposal here, where we make sram-supply mandatory fo=
r non-"mt8196-mali"
> SoCs and we patch the DTs to add the sram-supply for those.

Works for me. Thanks for chiming in Liviu.

Regards,

Boris
