Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C75271440;
	Thu, 12 Feb 2026 18:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770921501; cv=none; b=TwyULzWRPZsCmi5yaPghwkLklc6BMYdty4qnbGptWf1Z1rMkwSd/V3NJoPa/H1ehCNZpGYxWdrSmdytcbvNUgHrmLBUt8PDDbDLuBjbkK2AWTAqHq/rb37tJbknS0oYu+477DIcLOPAKcXJxhiXUEMp7gWfj5V/7sdPalOwANgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770921501; c=relaxed/simple;
	bh=mm6dK2xHHTgAphJ8RKc+fYugGjllxOCor2r0dUYhC14=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iL1PKhjdTQ7C3ZRLBBLmLaeAbkyEpub0zbPzOa7HJsU1pUS49Jgwkqypz/3IG1dHTEkT9hnolAGnFSulAiVf5g0FNH4vT/j+2j72LwHcSrx4aYD69IrVmdHoCTV4pb/dxnek6ZBGQLCeaBwOhenvknzADRkq+iFdjPW+6Za0sX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=LOeb/DNA; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="LOeb/DNA"
Received: from mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3cca:0:640:f0e1:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id AF055C124B;
	Thu, 12 Feb 2026 21:30:17 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id CUZN5e0GuCg0-zq4VRrB7;
	Thu, 12 Feb 2026 21:30:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770921017;
	bh=M4YvMAkTJP8B12seetkzf4oSg1vwKwdO9St0DGXCR78=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=LOeb/DNAFZzkaix10hhb81Ke2HHov99I9ftIETHkcLezhQR8UxXAmWx2BBOtwNjGD
	 tkGirgt5+3/o6FkN5yY7HXOSnlb7BWMeHoJz5Pq1JLGX48g1+AZj32v2X9Tvf2yAXF
	 Ws7pIlWyayhSRMp9JaUqewJ5KblDhMCwxRwwVXAQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 12 Feb 2026 21:30:10 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, daniel.almeida@collabora.com,
 aliceryhl@google.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <20260212213010.56db1d1d@nimda>
In-Reply-To: <20260212145134.799bb6fa@fedora>
References: <20260212100538.170445-1-work@onurozkan.dev>
	<20260212100538.170445-2-work@onurozkan.dev>
	<4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
	<20260212151644.4c179594@nimda>
	<6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
	<20260212134601.7760f414@fedora>
	<a76b1e27-87ea-42e0-88f3-0512b2e1ac0b@sirena.org.uk>
	<20260212145134.799bb6fa@fedora>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Feb 2026 14:51:34 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 12 Feb 2026 13:13:31 +0000
> Mark Brown <broonie@kernel.org> wrote:
> 
> > On Thu, Feb 12, 2026 at 01:46:01PM +0100, Boris Brezillon wrote:
> > > Mark Brown <broonie@kernel.org> wrote:  
> > 
> > > > The panthor driver is buggy here and should be fixed, the
> > > > driver should treat the supply as mandatory and let the system
> > > > integration work out how it's actually made available.  
> > 
> > > > Trying to open code this just breaks the error handling.  
> > 
> > > Maybe, but the thing is, the DT bindings have been accepted
> > > already, and it's not something we can easily change. What we can
> > > do is make this sram-supply mandatory for new compatibles, but we
> > > can't force it on older/existing SoCs without breaking
> > > backward-DT compat.  
> > 
> > In practice you can because we do sub in a dummy regulator for
> > missing supplies, it produces a warning but works fine.  If we
> > didn't do this it'd be basically impossible to add regulator
> > support to anything at any point after the original merge which is
> > clearly not reasonable.
> 
> Okay, I guess we need to fix panthor then...
> 

That + updating the log to something like "sram-supply is missing in
the DT" would be quite better I think. It would make the issue more
obvious and convey that the DT file is expected to configure that field
explicitly. With the current log message, not many people will
understand the problem at a glance.

As for the bug I described in this patch, we can proceed with the
alternative solution (updating the DT file) that I mentioned in the
Zulip thread (the link is included in the patch). Which is this simple
diff:

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..a30339fd2c10 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -177,6 +177,7 @@ &gmac1_rgmii_clk

 &gpu {
        mali-supply = <&vdd_gpu_s0>;
+       sram-supply = <&vdd_gpu_mem_s0>;
        status = "okay";
 };

@@ -537,7 +538,7 @@ rk806_dvs3_null: dvs3-null-pins {
                };

                regulators {
-                       vdd_gpu_s0: dcdc-reg1 {
+                       vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
                                regulator-name = "vdd_gpu_s0";
                                regulator-boot-on;
                                regulator-min-microvolt = <550000>;

Note that this only fixes the issue for the Orange Pi 5. If we want
to go further, the same approach should be applied to many other boards
as well. I can generate a list of the DT files (using a simple Python
script) that need this update over the weekend.

If we want to go even further and fix all DT files to properly include
sram-supply we could also enforce that DT files do not omit sram-supply
in the future. I am not sure this is strictly necessary but it also
doesn't seem consistent to leave things as they are. Right now, some DT
files include sram-supply even when there is no separate SRAM rail,
while others do not. As a result, some boards will continue to print
that annoying log message.

It's not very clear which approach is best.
