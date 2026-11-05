Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920633;
	b=LhyiQY1lI31VOzLbLU+QjpOsL58QvFXACCCchiP5pJ1dlcbXWPr22hZB1/utvA1DIrZu
	 HoieoZsP9PIcvwvtVjbd4nL+cZNRrZ7gwbS8lldDnGyIawcU8Hx7DXMb8alWa8XuccOB5
	 DJisYdt1bJE6mPUQUfrSySP7/ZP/N8IYm4qwcOhtR+bdYuiDOyAKhIrxFCYAdGGiTU8J4
	 nAaqsXZADsOCSKjPxyasQ3ZKGMn6EWvhJJ2JqbMzUH9LEuDusseOHeaps4nOSPE233DPL
	 508WC3Css1yEG+RrEKi73cFKj0n9vk/uePMj6hwG1C6PVZOPAq9bHG0+6Usgv6aVpwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
	b=gGi7/avqjRMAVyampTN1C65yH1VQ+EYdUoh2Ro3iLhHrqg4/qTMZMtV4WOI6G5WsJ29z
	 rvR14FaN/Qt8HdDizcQ5gAoA93t+TOn6sqCfWgktfZ5y1n55CvWGZp2V7lGTeLgMzH3v7
	 5c5xaGo89AgMFr4YFsjZI3/hoN4YYEam8IladEADuaorgspIp6+cbbUETdv462XXaLx9h
	 LxmKzhRjtsasyRZC0XVUSbnvSxxLq+AGC/8xjZEthyn6wLbpH/TH6fJd45ugf0cqWJE41
	 a0zT/y8KRyhiMQU+MKg13I86iNzCuAMDdM5On8EUSyK1bnL06k5htDo60DNgTPg6xBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rh8zWQ5c;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54F606A328
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 23:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B54F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rh8zWQ5c
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so30609a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 15:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793920631; x=1794525431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
        b=Rh8zWQ5cbqRsIud6qVhgd7unpuEXXQmz4PUH+SnOR7OkKkrNGrLwQRz9O0VviFbxXv
         ZGU40WTR1I1+KjZtNPFbrIoMqG7TZirBEAzCWAipljG+GZV3b/9yPK+TXVtAZjkpLV38
         tvQWTislLUHqkFp7APDKCFLrMVbUgwGUGj3Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920631; x=1794525431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
        b=OmCF5TZ8jgM3Ia3KVZ84mRVD+mbBD8pddkx7cu3VGC8g9tpTpZPr+uh2BMfjcvzmMM
         tj6fWemehuNZexEv/zTBVvqk/pFHl8vrWRQEpveSAbWi8YfA3TXC30UCl13TaoNQv/4O
         ncaqk2ptC68O0JWmkSktc8uREGh2vqVODzdQ76p0YVkkk9eo1SJVSto3fBqQw9HTFa5D
         mVSR774ZHAum9JF1PtuA+5Bjp+r/I3nakIkOxQ1ROEz1Lhs9JA268Ei1Xskn07W99PoP
         05JmyR9d8wfuGLyiVLn/jXN6mJT9EjT3dW5fhyHCDGqHiXlgF76QQjE14MEemAxQKbKg
         thUg==
X-Forwarded-Encrypted: i=1; AKwUvBy0+q3JgYCYbAJTNVuef3RfXlR0u4oodXH4QqxFPMx2kYZLrXIa9xk3dT4mTNJicgueRyZoNP7SHCPiB7HhZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8eR80C4PQPwhB2v2Pe4kM5SWrbUZa21JhAmyYAYuapVqWJXT4D
	3gbyrTR2fLr5lcl7q8ysCMzaxNDMrXZNhjjOkez6D4oPuxSXZ0No8Eq99IXg8VYTr806s2Iicxj
	H7N/mRep0
X-Gm-Gg: AYBFou1Ftt8ngSgxqu8qaHILyNYtifft1bsZ1f+va2oVE02Fic157H8o7iWOpNfh/G8
	3k11eEsaX65i71wUzYfo4wWFuDQ7bSBHfE3H8GPty5WShWI3fsmB+l9+3L7uiGcihETk4Fp/5fI
	g3s2HJFplKAp7L/UkEdvahWM+AcHLerDG6OGNoxK54jdjX+2I94bMpOg7Jkw6NW4YVTsLFrwaJ7
	7rdAwsmrOmcH3CwZQfClTSPeqDvpSjoUCYWuJJ9dcGKy9KRokuukkd59gDwlXu52z1T8CF7bHFK
	JrbcFZ4If0zuEMnxmRniquzfZ58/epyEfkBqGyYqfgtWn57SwEJ9w1D+kX7RuCbQF3vQPZqI3WZ
	LhiUYfxaJ6MafX4k4wvLiClUu0ktWRg4ihAAakpA2DYEgG2qh9VfZC/ZSGM2tzCfxqji3NrLSwo
	2hvKhLR+wjix32VYB/oTtv7NvroYtNNveAsQsC1YLIONC3Jfn80IRr0JsSNyENC9blvLz/XnLW9
	45yCUdMdANthL3X7B7y7UJj/+qu94XuZusIucSDS8wDnYEd4pjH5zUt5o2JLZlbDgXkWbW6Hy4d
	4Ah8UT5UjzJStzyKt2D9rlrPIB1T5aSA0h4jK2ybF2fG5jRRXU5gSxgw8CWMkaQL3sw=
X-Received: by 2002:a05:6402:4148:b0:6ac:73f8:2e5e with SMTP id 4fb4d7f45d1cf-6b5978159cemr488969a12.39.1793920630886;
        Thu, 05 Nov 2026 15:17:10 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664afbc12sm1299a12.22.2026.11.05.15.17.08
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:17:10 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so554155e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 15:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz8Gu179NEdwnZLCgnogfCg6EWls4ER0OojvfUgsTpdwsr0PmEd/GLEaOwlvhDIKJjx6CdVoIG7yFxOGDVXlg==@vger.kernel.org
X-Received: by 2002:a05:600c:4e14:b0:4a9:18f4:925e with SMTP id
 5b1f17b1804b1-4b6df8c9443mr8848245e9.18.1793920627925; Thu, 05 Nov 2026
 15:17:07 -0800 (PST)
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
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 15:16:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
X-Gm-Features: AclHuK979bKOyfBMwiTt2PX8WJCz_unHupEnRKfbNiYMNWMSzKi0DQ3cEAIAtrs
Message-ID: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> > While I haven't looked into this specific bug yet and am unsure if it
> > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > to disable Profi for now.
>
> Interesting. I can suggest that to the team digging into it and see if
> it solves the problem. My AI agent says it will though. It claims that
> the default flipped recently and "-fno-sample-profile-use-profi" will
> restore the old (tested) behavior.
>
> Should I send a patch adding that flag?

I went ahead and posted the patch:

https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1=
bafce6370@changeid

Obviously that patch and this patch conflict because they touch the
same lines of code. If folks think we should still move forward with
both patches, I'm happy to rebase.


> > Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> > reservations about adding it for the following reasons:
> > 1.  It is heuristic-based and not enabled by default. I am unsure how
> > thoroughly it has been tested, so we should assess it further before
> > enabling it.
>
> FWIW, we did find that Android seems to enable this globally across
> its userspace, which suggests it has been fairly well tested. You can
> see the change here, which landed about 1.5 years ago.
>
> https://android-review.git.corp.google.com/c/platform/build/soong/+/35242=
91
>
> A few notes:
>
> * That change _also_ adds
> "--salvage-stale-profile-max-callsites=3D2000". Internally, there has
> been debate about whether adding that would be a good idea, too.

The conclusion of the internal debate is that, yes, we should add
`--salvage-stale-profile-max-callsites=3D2000` too. So if we decide to
move forward with this patch, I'll send a v2 that adds that flag as
well. For now I'll hold off until there is consensus. :-)

-Doug
