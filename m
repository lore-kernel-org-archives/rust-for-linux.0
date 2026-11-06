Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924426;
	b=kday/cDo1rKxhetNcs6qxIvcrE3WPNmP10N7Bk9LbdpSu002ZfCPB66ZBFYJAQ2dg47j
	 dnISRzU8bo9kcQZ38Q5fwQqK+xkcp8DrDXEENeZNKvamAxURxpzyAws5g77kWKZQCbWzv
	 XTUJpu1ZNzFm7dG3Z5EOck+y/nKONW8T+xUB7mibbg9K+6B+jc1+k2FHNNlswR4sWGFhf
	 vMPE4tQJSmT7KQ+IllhKBhrcXT8vGEvKcCWLS1qALj5Rnan7ATlAk4K52Zyp9andEOPE1
	 SumfeeIQuTU/mXgr5Rqr4jY6rQ/9pf7iuHXJJHfvurHBT90NpAR7RC+s2G7uDfMwUHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
	b=LVsG+zVRB2oZxMxc1xY8utXO2Ujlm/h+PxrcZPisH1A32U/UiiSxq92GQBanNaysJZk/
	 OEsOHGhiopZgCwgS2uFZOhv+DSwPAQrRzwPDcgVf2evD7l0NWCp6EIaNY294OlNMQ5iPM
	 SM4y1Wr0DAZQnoMur1/eLbRkc11I9No5phjo95Bv4GsFcF9LVm10R1W7Q3KDCbJegY2l3
	 muSEb6nWbQ7N3pS4R9p7ORoaTWzENlDqUhUIvEZMLzBCGrHn3YJ+96jBGU+q3Gqrx0O8c
	 eHKieUPY5/gRA2HT2WyjfRJheIJqkp7KZdjOOnaR2F51wsVS11gPsnyOUrhmNu8GUEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fay24KIV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67062606A328
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 00:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67062606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fay24KIV
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso43899f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 16:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924425; cv=none;
        d=google.com; s=arc-20260327;
        b=oPkayGucmik41/KYGIUAv8To0kZ3RnB1OJCTwvba22uqI8MJh3j0Mb8wXLCp05mWI4
         XnyCiZgrMDvrLAX45O3HdsHsHTnXtXAMOY9vJ3twqWxqNaaOV4IZA8rNT2Ro52kcm+g6
         +T+EpcKRtaxEia5nvPB6yFlVBd1TUkq38RAYjw3EKnXCSk6zLzyQTK8JqrS4hJPvQrZc
         Cx7d9mm+I7c21bOkaV9upC38vmWfWIH2idtNZVq3XaMRIhd9irro5fw92J8VO0uhnQau
         URrbMLFj0Mn6gfaH061MNkH00GuBH2ERV/fu2EHvtJEOMQnKAraZnpyNbaH2HHtK25RV
         EF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        fh=cHJ/UHHM2944UCgwX8RTzozBJLnWDd2NL86GGlPvbf4=;
        b=kfhEcBr3ki/DjN09ShLnYb4i660c2Kq2Sq8sUi1RYKkltefZgwLoxKpr0AGsn2ZaV1
         mLz4o1zSXagO0kIBoUp6y5YzF94vXT3w8Q0pgg6XZwWYnj104/bzb5gSmG40BO4F++nC
         ONKsjko3kioFYNT5N6pA33wnlsO/DnbzuYS1oqGI6KV8GHrboIswriEiugDYeE4zNnkz
         cTS//+erEDNY3Se2LPacErgeBpCkFCWYu/hUcZcEd+8ui14iepoiksHtEfJV5PyiKSq1
         ElwpqVqSqUQgXBeEqXpZiP4HaYOI5ayp/U3wDvYiJOxt2q/xD0e5enM0BwGWCxW9x3jh
         R23w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924425; x=1794529225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        b=fay24KIVxX1g2XaFUPj+mSXS0xXbKerfwx/+Af3Za6F+v3KzLCVGFA82hk3eVshmQI
         l5D4k/97mNlDjxYLlOZUaKQc+7NUmJlY2NoX4n9hri/6orTNKUxn8wwxy4cxZ9kYH2Hq
         O+puo6RCbSeCUfhHi3T+TA0HKeQ82eLArpjTIQ+uaFN34+nCb5OSArcPlM/Kv6xMLab4
         1QY5Aw7vRJErWJ+KkwRK6hJ2VW2adTKLDsM13sc7EFcMx3tfROJ5LPQ3c0I1QdtAxW8t
         IymtPLLzIfLeQCUkKKz051D2HX3Yy1Xb6F5Ncs3S3+i+DUxWATCarQ0JUC21JHU/L/hA
         w4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924425; x=1794529225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        b=z0XDGZtjhWZCheivzXPsG7UpmXw+xZUkaqb7CrzN7NxxhsuZ+g5dhu+AXD36mprPxw
         gWSBK1vBF5PpcV1Ytn1WXQyCdAKU4nV3OBg2uuBQ2vkNlTrMu6KuR8vLYrEHweaR39/o
         Zlch99lpBaIrwNLZnU7H0JUWQtef9nYrS1vUaKZvyxqQM99IR1vQbiNyan1VkYkpzfJG
         mlxh2gi57qDsIUGeCwmFRXaQNrW5UPiIczhUybov33GjI65XeB8rkUlLOoZ8RX939HOU
         p/v70V+aQ3RnqEYpokZa2vGxj1kwtexAm0REkxkegCmm9TtdPnYNK3E9sluuarosxadC
         yvKw==
X-Forwarded-Encrypted: i=1; AKwUvByDVnmsAQk34XblSZfKF9z/6VyKAdTQHx1zZUNYUwgNx1FU752vnxgFUN6irmZg86zKx9DWicrQtx5fYnNKUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9c9wFcjg9bjSJ2VP1uAALDjiQR6+qnumfda9bPQph8bwFvKAO8
	cpzfJDAPiyv5UXz8vOU84Qfs7XmNE5Vlcn9TWfBtsRibyBg925xBFbj3qfiF+mioe8EavZdHvj/
	jp5hextUPvbeN5IFMWfgQx4VUGTFzyvwzpzkPxR8P
X-Gm-Gg: AYBFou2jhcMk9y1hfMQ/WbU7HhUVb1093NiTMWM2uun8Qo4EVVmCes8MpfMPlClmo5l
	wK/l+W5HjTh8FizwvrVtIeYLXkB3xeIrnjA/oZ92yTafn3cP2MCvKvAikJFpe7rhwF37pXO1HSb
	NfjwSXBr5hXakdePebWxK+TsIRxT9Y7PiCrxAREmGluT7Q0gAm0dbTsHwyhgONBYDT7TFGSkNi9
	BmZryJCDc/mFhWNkLViUm8cJ9yhgKLdSyZBc9k4DQURGEf9XmcIRS0EeuX/ELo6L7BjpdShvUnq
	z7WM5IvEX8ak7c8pQe8hhlQZhyoDWwxgU0oVAA1I3ds6SKAeZFoEnZb8aG2Uyu0QP28Kfn6j81m
	CwhFDclZEWJbrC0hU6wbjU3ZGe08E5JWDC55Mp9Tec6Fy9s0wqCUMJ3OrfMLqW8BLdTQEzYpV3y
	qplgnL1rRazfsx7qpwaB4d4z0vb1MyoytzXP6joK6z66P+GtLL13owP0Y/ibhebMo8h/w3yYh+r
	AZUXGEJFEAaPcFRUTcF1xnkNnVacNmj91Ww
X-Received: by 2002:a05:6000:4a03:b0:48e:412:3829 with SMTP id
 ffacd0b85a97d-492764aede3mr2311906f8f.15.1793924423911; Thu, 05 Nov 2026
 16:20:23 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
 <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com> <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
In-Reply-To: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 16:20:12 -0800
X-Gm-Features: AclHuK9ycOqos5AEuWbFkVouFGAMYO4MjJByfnQj2RCd2P8bwTy6_fG6ZmWTcd0
Message-ID: <CAKwvOdme+2Lrm7Ds8vp71WVzDXfW61o2eFRjjtTptpskLTuyeQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>, Rong Xu <xur@google.com>, Yabin Cui <yabinc@google.com>, 
	Yi Kong <yikong@google.com>, Han Shen <shenhan@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, "Sriraman (Sri) Tallam" <tmsriram@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:17=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > > While I haven't looked into this specific bug yet and am unsure if it
> > > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > > to disable Profi for now.
> >
> > Interesting. I can suggest that to the team digging into it and see if
> > it solves the problem. My AI agent says it will though. It claims that
> > the default flipped recently and "-fno-sample-profile-use-profi" will
> > restore the old (tested) behavior.
> >
> > Should I send a patch adding that flag?
>
> I went ahead and posted the patch:
>
> https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2=
e1bafce6370@changeid
>
> Obviously that patch and this patch conflict because they touch the
> same lines of code. If folks think we should still move forward with
> both patches, I'm happy to rebase.
>
>
> > > Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> > > reservations about adding it for the following reasons:
> > > 1.  It is heuristic-based and not enabled by default. I am unsure how
> > > thoroughly it has been tested, so we should assess it further before
> > > enabling it.
> >
> > FWIW, we did find that Android seems to enable this globally across
> > its userspace, which suggests it has been fairly well tested. You can
> > see the change here, which landed about 1.5 years ago.
> >
> > https://android-review.git.corp.google.com/c/platform/build/soong/+/352=
4291
> >
> > A few notes:
> >
> > * That change _also_ adds
> > "--salvage-stale-profile-max-callsites=3D2000". Internally, there has
> > been debate about whether adding that would be a good idea, too.
>
> The conclusion of the internal debate is that, yes, we should add

After Doug sent this email, him, I, Yabin, Rong, and a few others met
and decided we probably want

-fno-sample-profile-use-profi

...but then I stepped out of that meeting and ran into Yi who
extensively tested AutoFDO for Android userspace and suggested _the
opposite_.

i.e. Rong suggested:
yes: -fno-sample-profile-use-profi
no: --mllvm=3D-salvage-stale-profile

Yi suggested:
no: -fno-sample-profile-use-profi
yes: --mllvm=3D-salvage-stale-profile

Yi, can you share with the list why you hold that opinion?

I suspect we'll want to disable "profi" for now, but likely will end
up revisiting these pairs of flags in the near future.

> `--salvage-stale-profile-max-callsites=3D2000` too. So if we decide to
> move forward with this patch, I'll send a v2 that adds that flag as
> well. For now I'll hold off until there is consensus. :-)
>
> -Doug



--=20
Thanks,
~Nick Desaulniers
