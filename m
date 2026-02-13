Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267335F8C1;
	Fri, 13 Feb 2026 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770987602; cv=none; b=QrNBYKFomhFaD2FUSsRKl8e8mLlbQTCiZPYcluRG9wWZttFdbpFsGNGHW/NShE0QaUnukUOVpLT06UY94v4mJfSmfrzrhRhlOdRo3u721CeBdNptU9JFlpnGXQ4dGoA+y3odIqPacfsb9b9HvdMaDMZ61Nmsypz8Jtk1nxa/iUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770987602; c=relaxed/simple;
	bh=Hrhw8TC11HGLq3uH4nhiVhcLose1CA132M6D2gTu0vM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A5jyh+Bk0VYDeB+6XAQ9m+8yAUQdn9Xu+KpWYUvhrgOIBat2AqydvG0FKxftTU6kznLUCYlS9CveoJasdyPUYa6DsrcagAFunur1RINXFSluc8BQSt5vW7YJStC9DoxUyYfB9Mno9+MNfZOASHn0p68GiXDWxaJDO7qFGXsJESo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=iRmv0cPc; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="iRmv0cPc"
Received: from mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:26c5:0:640:cf7d:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 3502681843;
	Fri, 13 Feb 2026 15:59:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id dxUIeKAG3Ko0-udXHb25h;
	Fri, 13 Feb 2026 15:59:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770987590;
	bh=bVOFIhQfpDCGlLUg2TBpjjHroakH1TlhqdpD+dl/bhg=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=iRmv0cPclwdf9gwYYXyqBEjUdzx6Dl3rsqKP8FTEND8I1EdcUXaU/jHDHCFDnSejz
	 rtmHbs7MybU/aFjg3jQw6HSU2Q7TOoZXi2QX/G3Ohr8fRTxQdD7PP95fWOH1viL9ik
	 +6auUtOUphIEXj3Ue8QtvaIQkXZdjCmi651Vh93o=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Fri, 13 Feb 2026 15:59:37 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Mark Brown
 <broonie@kernel.org>, daniel.almeida@collabora.com, aliceryhl@google.com,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260213155937.6af75786@nimda>
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
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Liviu,

Thank you for reviewing this.

On Fri, 13 Feb 2026 12:15:47 +0000
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> On Thu, Feb 12, 2026 at 09:30:10PM +0300, Onur =C3=96zkan wrote:
> > On Thu, 12 Feb 2026 14:51:34 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >=20
> > > On Thu, 12 Feb 2026 13:13:31 +0000
> > > Mark Brown <broonie@kernel.org> wrote:
> > >=20
> > > > On Thu, Feb 12, 2026 at 01:46:01PM +0100, Boris Brezillon wrote:
> > > > > Mark Brown <broonie@kernel.org> wrote: =20
> > > >=20
> > > > > > The panthor driver is buggy here and should be fixed, the
> > > > > > driver should treat the supply as mandatory and let the
> > > > > > system integration work out how it's actually made
> > > > > > available. =20
> > > >=20
> > > > > > Trying to open code this just breaks the error handling. =20
> > > >=20
> > > > > Maybe, but the thing is, the DT bindings have been accepted
> > > > > already, and it's not something we can easily change. What we
> > > > > can do is make this sram-supply mandatory for new
> > > > > compatibles, but we can't force it on older/existing SoCs
> > > > > without breaking backward-DT compat. =20
> > > >=20
> > > > In practice you can because we do sub in a dummy regulator for
> > > > missing supplies, it produces a warning but works fine.  If we
> > > > didn't do this it'd be basically impossible to add regulator
> > > > support to anything at any point after the original merge which
> > > > is clearly not reasonable.
> > >=20
> > > Okay, I guess we need to fix panthor then...
> > >=20
> >=20
> > That + updating the log to something like "sram-supply is missing in
> > the DT" would be quite better I think. It would make the issue more
> > obvious and convey that the DT file is expected to configure that
> > field explicitly. With the current log message, not many people will
> > understand the problem at a glance.
> >=20
> > As for the bug I described in this patch, we can proceed with the
> > alternative solution (updating the DT file) that I mentioned in the
> > Zulip thread (the link is included in the patch). Which is this
> > simple diff:
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
> > +                       vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
>=20
> You don't need to define a new label, using the same supply for
> mali-supply and sram-supply should be fine.
>

That also works but I never seen that usage (sram-supply =3D
<&vdd_gpu_s0>) anywhere in the tree and I wanted to follow the
current standard.
=20
> >                                 regulator-name =3D "vdd_gpu_s0";
> >                                 regulator-boot-on;
> >                                 regulator-min-microvolt =3D <550000>;
> >=20
> > Note that this only fixes the issue for the Orange Pi 5. If we want
> > to go further, the same approach should be applied to many other
> > boards as well. I can generate a list of the DT files (using a
> > simple Python script) that need this update over the weekend.
>=20
> Yes, please, but bias the script towards using the same regulator as
> mali-supply.
>=20
> >=20
> > If we want to go even further and fix all DT files to properly
> > include sram-supply we could also enforce that DT files do not omit
> > sram-supply in the future. I am not sure this is strictly necessary
> > but it also doesn't seem consistent to leave things as they are.
> > Right now, some DT files include sram-supply even when there is no
> > separate SRAM rail, while others do not. As a result, some boards
> > will continue to print that annoying log message.
> >=20
> > It's not very clear which approach is best.
>=20
> I'm in favor of the proposal here, where we make sram-supply
> mandatory for non-"mt8196-mali" SoCs and we patch the DTs to add the
> sram-supply for those.
>=20

Cool!=20

Regards,
Onur

> Best regards,
> Liviu
>=20
>=20

