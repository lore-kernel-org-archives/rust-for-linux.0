Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0EA34D4E6
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770985086; cv=none; b=op0ytR1HCfmvP1fi2SSi1Oy/WwqUX6zKlE51EoKZwxjevszTTnqW3Inx4oQTruJfZ+ss/l0FOTSKusFKOIK3YJ7ILAiLtiGn73en2gUUbFH/icOu7km+7uotwAaCk/aNjQ/Tfzca+aYkx8WD+l1+6+Qo7L6XVpmDyQ6po1nHKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770985086; c=relaxed/simple;
	bh=zJWcTxfnG0dObUscgf5PA0wL77IHDbe6/5EnDU7MIL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdJmr5eKxyJeZka+2zKztu/mAebmEp5GZxh2wYD+fuNHCDnOQElTWSJ4JeBqzokdqpRuav7fIDPC5tq29D/Eiq6x4PghKlisM5+2mz+AbG7/EExaWUxWGPEl8pXTBUB3wcGcFCCKH1COsGvLn6ELEKl3BMN9Jn2Rv/IxdVzeTkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45FEF1576
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 04:17:52 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62E003F632
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 04:17:58 -0800 (PST)
Date: Fri, 13 Feb 2026 12:15:47 +0000
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Mark Brown <broonie@kernel.org>, daniel.almeida@collabora.com,
	aliceryhl@google.com, dakr@kernel.org, airlied@gmail.com,
	simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <aY8V8xlTv0UAdyQz@e142607>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
 <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
 <20260212134601.7760f414@fedora>
 <a76b1e27-87ea-42e0-88f3-0512b2e1ac0b@sirena.org.uk>
 <20260212145134.799bb6fa@fedora>
 <20260212213010.56db1d1d@nimda>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212213010.56db1d1d@nimda>

On Thu, Feb 12, 2026 at 09:30:10PM +0300, Onur Özkan wrote:
> On Thu, 12 Feb 2026 14:51:34 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Thu, 12 Feb 2026 13:13:31 +0000
> > Mark Brown <broonie@kernel.org> wrote:
> > 
> > > On Thu, Feb 12, 2026 at 01:46:01PM +0100, Boris Brezillon wrote:
> > > > Mark Brown <broonie@kernel.org> wrote:  
> > > 
> > > > > The panthor driver is buggy here and should be fixed, the
> > > > > driver should treat the supply as mandatory and let the system
> > > > > integration work out how it's actually made available.  
> > > 
> > > > > Trying to open code this just breaks the error handling.  
> > > 
> > > > Maybe, but the thing is, the DT bindings have been accepted
> > > > already, and it's not something we can easily change. What we can
> > > > do is make this sram-supply mandatory for new compatibles, but we
> > > > can't force it on older/existing SoCs without breaking
> > > > backward-DT compat.  
> > > 
> > > In practice you can because we do sub in a dummy regulator for
> > > missing supplies, it produces a warning but works fine.  If we
> > > didn't do this it'd be basically impossible to add regulator
> > > support to anything at any point after the original merge which is
> > > clearly not reasonable.
> > 
> > Okay, I guess we need to fix panthor then...
> > 
> 
> That + updating the log to something like "sram-supply is missing in
> the DT" would be quite better I think. It would make the issue more
> obvious and convey that the DT file is expected to configure that field
> explicitly. With the current log message, not many people will
> understand the problem at a glance.
> 
> As for the bug I described in this patch, we can proceed with the
> alternative solution (updating the DT file) that I mentioned in the
> Zulip thread (the link is included in the patch). Which is this simple
> diff:
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> index dafad29f9854..a30339fd2c10 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> @@ -177,6 +177,7 @@ &gmac1_rgmii_clk
> 
>  &gpu {
>         mali-supply = <&vdd_gpu_s0>;
> +       sram-supply = <&vdd_gpu_mem_s0>;
>         status = "okay";
>  };
> 
> @@ -537,7 +538,7 @@ rk806_dvs3_null: dvs3-null-pins {
>                 };
> 
>                 regulators {
> -                       vdd_gpu_s0: dcdc-reg1 {
> +                       vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {

You don't need to define a new label, using the same supply for mali-supply and
sram-supply should be fine.

>                                 regulator-name = "vdd_gpu_s0";
>                                 regulator-boot-on;
>                                 regulator-min-microvolt = <550000>;
> 
> Note that this only fixes the issue for the Orange Pi 5. If we want
> to go further, the same approach should be applied to many other boards
> as well. I can generate a list of the DT files (using a simple Python
> script) that need this update over the weekend.

Yes, please, but bias the script towards using the same regulator as mali-supply.

> 
> If we want to go even further and fix all DT files to properly include
> sram-supply we could also enforce that DT files do not omit sram-supply
> in the future. I am not sure this is strictly necessary but it also
> doesn't seem consistent to leave things as they are. Right now, some DT
> files include sram-supply even when there is no separate SRAM rail,
> while others do not. As a result, some boards will continue to print
> that annoying log message.
> 
> It's not very clear which approach is best.

I'm in favor of the proposal here, where we make sram-supply mandatory for non-"mt8196-mali"
SoCs and we patch the DTs to add the sram-supply for those.

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
