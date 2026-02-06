Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C833B974
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377655; cv=pass; b=URKTUo+zIRkSxc/dar92TSX8cnhdjCK4HYTFwJQCpSOGk33muZ3LA8xcxFzYFss1tQJoRZ7TWq5DycwKy9X5DfrJEiIcNdj57sqhzZBX4ahqG/SiF1sI/mrnansnv4sA/U5L/WtPdp6ynE893BFq7N6WjaWHwBmHcK8Q/+QD2tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377655; c=relaxed/simple;
	bh=7YptLQBpjuElodXPfHFJhvjhJeTpEuDwKWcN0fXNy5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXjrQpwHObNRj41y9GdtE9GnSI3r4T7dbMRR1I6AiJ1E38aSKnXIoZ1wz/6EenUv3wb0YYoC2O9Dyb7/ulbcJwuZ41fE37pmAOvPsomqtMytw2F5tYEKWMa669dss6kLaF4KP57GmgwZvNcuz0bxUKk5Np8LhLu1SBfPyIcPuUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bx80T0i7; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bx80T0i7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43629377370so730623f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 03:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770377654; cv=none;
        d=google.com; s=arc-20240605;
        b=cavyULv7LDa//Kp3LqhC7waq5QznxiFKTH4D+f9dLW13kChVuMaRPepHxVNpY+tTmb
         xBczqAcnOP3hM80fM0TUEoPlUUDhrkTuKKaUgvf8At68V/L1U7aubqwdqh9KgMc1IhX8
         6zxPkdOHCaav7Ecew8BVyAFH44Y9zyH74imxGRPArg/iPiAsSIf2scSpQJPUT/11ThE8
         /HZQeWFc6DHa24hl33xYd3YXOJbKI2aVjiNBcGGASYrmVemr9AJQRbp+rfuTV3kXPbCf
         V/+K887Pr1s2Vo94dnpQBdmh+OANr6t77/cyJxO6l5Gyn+f9Oh3ltcUQbxwKbJwQaXnV
         B8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6VdpjMWDqzoZZNgJcZKDl6I3KU1j7FPhrEM3id3Lik=;
        fh=lxFwUWcGUrpwn2TTxxPrzb5pdkSHYRUoCuGLRUftg/o=;
        b=CFi5yvz19U3h48b3Gfxt1yUhgCBOqRC71lshUbVqQEtCHxj6h5ClI6KryfFB7kcFyF
         bCRFWO8GWhUlHucv6OoyCSU/U1TTe+Yvk2IeuIuCD44AuwdGm5UsdJOQvtfg78LV6LdA
         GLaqfyITImdtsk+pCV8b6OtBMkrcFTq3Y/dW0SCt/x0JLRCEv3HPOWlUYf9bfRkotovq
         qe5POpkgs//0ZzMrbtCcyracIf/oVIlBlsD9Z8iRXq/3N/gF70LKc3WHJt2OY1nXTi+k
         OYdyiQ1GDZ8qllMAhcj9UVZdVFYKyla3ILJgdPl47ic1OsLNSCS/zaHnytiiqc4orwbk
         rB6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770377653; x=1770982453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6VdpjMWDqzoZZNgJcZKDl6I3KU1j7FPhrEM3id3Lik=;
        b=bx80T0i7mUNEU4RIowiPaVBSqHF/CuN/HLbg/qBXEGYh0IF/nS1Qel2r+lRhWrdpNr
         zrOVR/KozmikfMDCREj4RUQE8pxYt842COjDPyh71tkH1v5DcJ5fh+CL7KyxDY2q5vYi
         OoNChcke4ab8gyUCAJEApgZ11igJgdVhdt+98/L+SnH03+49PNIxU0yBFsJmvGI6BgFW
         sqVeAMSe2s6yDRrH3yXlqBX6FdVPdTrTDofuQSBVS2McO9nNvOEpDu5iS3VblYSYV+ob
         j2NNcP3weuNsyDfJfpTfbnVqCYZpRNWhh+9IZKvVv4GshmzZSGdrTuMfF4KziVAzujmr
         OKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377653; x=1770982453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r6VdpjMWDqzoZZNgJcZKDl6I3KU1j7FPhrEM3id3Lik=;
        b=hRX06L+7hiJ9FDjkuflEpZkou9KeAYswhaW49v9x+QmhH6LA/t238cNaln8dNC9H/u
         so533jg1z/7r7IeyiUiJIpWoUl6ulqtW7DMm1d4magnXiZ/G5qKJtCVmO29Z+8hqwNAw
         m2uSyYQHfE588+LU5CQfNijtFliR8Z+BmU/AfYwD4JsIVcV6/RMjuT/iIugcKiUX8HGq
         fD5YLYgLTouuEKKOzZDNcCNCUYgCOzZrp8y/IQAapnYoyaZyfDmBYkBDPYqdnNX6py4H
         m/oOWY1sb7MueMSvBLBbVJmYen1Cux/EShja3QwqRpi2N5heBuP/yt1Uawz+psiU+OaZ
         rjZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgSd0l8LrzqwyHParP2OoqUx5g0J2+6v3jSdaUBbkvilnpMthkzXpvwIhpiKCr5qLha4oF4g2SY8xLSxqH1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfUSOu6dvC3RJaaRqYF+hywvaVr5IHRxtSeo7tTt2cdMAbPZU
	L7aDleFMCNRQQ07MS+K9RmiLEhnIqnL0t5a9voY7YOcS7wvUufUmhnL3f7gLjHK5q2r4y8vXAOM
	7b6/vmTiBhhC9GM6DqCrpFMBc/FF0wPCS8yK+0WCf
X-Gm-Gg: AZuq6aJh+exWJLIIzlnHnhsT3wXd3LTLn1ogdv36UTahHVHpighFHDKcJv/9bF6cwvw
	cG97KupHfixI5pc1Vg/B2Oeb0FEtTNW2SxQHdF6KPVl6WHUeXTeNyUIswEbekwI7YO4XMQenN4f
	WliZ3a6Xg1myqqmWXT633ZnPsCLyA5Is6w/bP6QHHsj8L5NJm1UiOvwpkZ0H36KU3GDoxilF58e
	qJTEaT5dx3CtxUs3ZN9eLvCLk6KNg50lEOT9IqB9YSf4pOJ2BzRY7bplyqkOUSKUycj7egcvs5Z
	XVTAUYY1LOBaYL0A7Ij/pRSPeg==
X-Received: by 2002:a05:6000:1ac7:b0:432:5bac:3915 with SMTP id
 ffacd0b85a97d-4362938b240mr3694852f8f.39.1770377653424; Fri, 06 Feb 2026
 03:34:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205224706.91996-2-dakr@kernel.org> <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
In-Reply-To: <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Feb 2026 12:34:01 +0100
X-Gm-Features: AZwV_QgJME1Kspjjx-OC11f72D4HzejOVCq7NwRJPxhLlFNoLtq63JefHlgoVAg
Message-ID: <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 12:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri Feb 6, 2026 at 12:04 PM CET, Greg KH wrote:
> > On Fri, Feb 06, 2026 at 11:43:48AM +0100, Danilo Krummrich wrote:
> >> On Thu Feb 5, 2026 at 11:31 PM CET, Danilo Krummrich wrote:
> >> > +EXPORT_SYMBOL_GPL(devres_node_init);
> >>
> >> I actually intended to use a Rust helper instead of exporting those sy=
mbols
> >> directly, but forgot to do it eventually.
> >>
> >
> > I don't understand, does that mean we do not need to export these?
> > Shouldn't the rust bindings just export these symbols are rust exports,
> > and the C exports are not needed?
> >
> > We "only" want these symbols to go to the rust binding, not to any
> > module at all, which is what this patch series does, and is probably no=
t
> > a good idea.
>
> Correct, I just forgot to replace the exports with a Rust helper.
>
> The Rust compiler might inline some of the core code into modules (e.g. d=
ue to
> generics), thus requiring an export.
>
> But, instead of adding
>
>         EXPORT_SYMBOL_GPL(devres_node_init)
>
> in drivers/base/devres.c, I actually intended to create a Rust helper in
> rust/helpers/devres.c:
>
>         __rust_helper void rust_helper_devres_node_init(struct devres_nod=
e *node,
>                                                         dr_node_release_t=
 release,
>                                                         dr_node_free_t fr=
ee_node)
>         {
>                 devres_nod_init(node, release, free_node);
>         }
>
> This will automatically create:
>
>         EXPORT_SYMBOL_RUST_GPL(rust_helper_devres_node_init)
>
> behind the scenes.

That doesn't work if this option is enabled:
https://lore.kernel.org/all/20260203-inline-helpers-v2-0-beb8547a03c9@googl=
e.com/

then the helper is linked into the module, so it still has a direct
call to devres_nod_init.

Alice
