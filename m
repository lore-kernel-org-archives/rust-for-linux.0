Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793298232;
	b=SpeuNN3ozTaqd5j9ET/g6gi785kJZOFhyegEiMR7QxafqBg+gH+V+2dEaoFAItnGELIz
	 ZBWf9jJGccilXbTtrRlF03udVeRxXm6WrcAduaQ4MhBTM6JusI6mxgGikwUdmX6PwXAWJ
	 WCeA/+I9LT9dLOxt4xiW8pl5/O6UApata9RShk7gcvou8rqjZiJ/MjlqcMhDvKHIp/qPQ
	 sYDJ8XrKHSOSlaYTLe5WlJ8on8DAbJ4lpseQcbqV+oDk6Z+lcfL0UQQPIRegaAeNbXtEE
	 GOeulc7ArtHHrYt5I4getn/+EJ1PtEa8gXzpx98vpZDYu67k0TZ1/R4nnCED/WD4TQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
	b=eNkV5rY+Sqs0y6CR6CkwLxkpAhXHcf2uGwR/VAcffuuGbEnfLq4p6KcI0r82NIHHjhup
	 0EfK478RCM2jIMww6t+3DUmiy69P5JrK3UbOhdNpxv9ih6CoMcgD63ENVJk75/y8LOFWT
	 ZJm2Uen84Jnu5+Qta4oWHK5NXgsYdJ6lqfp90okqsTP3Le35P8YsqYXPpD/ueiZg0WNTD
	 /rMZmaL2FRFpzMs5f/FZHqGBHXFexzBSLQsdcfHpOQllYPO5ljQ5RZwI0I5T3ITH4fStW
	 KV5df53pPcNhaMFh9o01hijLJMFt/27yy0SjYSduA9B8RDhdKBis71LaXoWbN1gV1Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DxY9NYue;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768C606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 18:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6768C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DxY9NYue
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533202fe429so46201cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 11:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793298231; cv=none;
        d=google.com; s=arc-20260327;
        b=jRtOw8f8jL3adfscmPh21bFlHidEySHlGzVRSIItNLhf4YTJafCf6130VNkzmpBKL/
         PXhB4/E2PsVBNpkr2V524gkA1TIMYm9svXrehBiQZh3mD+lI0Y7LabjfIdb3KlANCEva
         539+JsYYgA6J9ASaC/e6JHPGnNMITfrjoaACyM0sNskPtXv6FGGjoNY1W9d0xGkbmbSI
         3+NEB2TPPzJIbMPcNhfP7X/0/AafpiXDAdnS/Tstmty0p7SB0PthPqYhrxMc5C39v9vD
         5L0JokvG1yqHRN/jhXH4N4meG1tHrfI9K6E/fafMG1MaNWfUHjevbkEGTfGYcaT/2R9e
         WlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        fh=GkiVNPCqkRCA7YTYK+OdMYFNFgZnlv1DEm0kQdPMw6I=;
        b=I8lCQ77vGAYGmoRJlk42NMdODMYXMYCeKhiymNgd/FW4FJjRKE4/tBY/HzVZnvtEOh
         EjYZ6/ogENTyIm5bdelZlYwlyqIQDDyAuqnLiE6igIfxlAKPVdoJvIhXNbv6FIjoBxtA
         r7dTwssfW89nfogKHusfXQ5r8+eICAjIZVjFLykLiuRzDd03+wOYdfaJAVayxV6EI2pJ
         sA3vT33hLIEtTMGGGQt8skZjSfMTV9aPz48V6vLmFuowTgiN/WlWGLv48xUSLNVVC+fk
         mWuB4mrEUdryVqzbQAwINeQlomNg9tXm7IV7kpbyCmfrnkd8B6osJApvys897FKqj3JN
         01tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793298231; x=1793903031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        b=DxY9NYueYpPUw54/1LuKABfDp60AROnzubbbXy7OzS6fWMrILGyAPx+k/TBUzTDoQf
         0+estVcf3DGr+NqskgZltpKjiTwBj0vHxfiZlAv1hdCBqEV+qUGB+fKraqRqaZGJI9Ad
         aHuqa1XDAyOvsrzYt4e2fwVCkmevUnXplUQksj+fp6M1ZkXl+zkUCRvmoFsMOA3v0kwz
         Qz991YYvpNKWfDlgqHmAUX1bJTSVeq5mbReuEAT3YssNt+yd0jN+OmcLTEbZqe3twO31
         DfUU2J0jeNSxbzemGGGlU75TQqjY6sTlc87Wxa++VyWhSCCSHud20YoCA1co6FakOgHn
         lsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298231; x=1793903031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kPogFiW6B5fuv9DVpnabZaqR2Qn/IyW3R9/wzN8wTc=;
        b=B6iAh6iT72VK92SLjDOX1SsAMJAqtuFzzzMD7YtYWXVH49zl1AjHoi2S+B2SWWqglk
         5yKzFDfdqr5D1UhcSWB204X0eBVwERfV9x9dhVWzz/PvHrLoRoQjTcA34tlHWwkbB7I1
         m72xFGhAxeilBXhIUDd+SPAxQSrm6zw09C7N5ZzaV8S8SRgrH7z+y/NoNZrBYz/xtBi9
         mTxmkeiCOAFMA2OEtb9klUl2dtA6sCXexcVtGwm54h4XNFqvEIhTzNQ2KNKmGfJt0sEX
         Z7ugiaMbE+L49LgjZiCt1eamS44PBskA2EaCfiD2OnRdIDc23qvplv81XfohXY3g+Oow
         oVuw==
X-Forwarded-Encrypted: i=1; AKwUvBxWcPaPzMbsd2g+7xncPtkAg7sUpXmsVfFhH3nCsyD8tYXTc9s53+JZNsvJL6c2FkMqrOgyrViLeOBCqW+HzA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZu+RBWUNlxsnPnFF0eHYer0h3ltQmnILIgFi4XG4eyOK41hen
	h4kNXrr7ngT4F6PyRnLHPGgxb1FCG2oqayKy9HH/58lw6Od2oD3BLju3tgCOH5qiTpqfNwsgOEi
	Him2hM89eoOU+U5JXNsekhiVl3wtHslnMR6p1vTul
X-Gm-Gg: AYBFou3MOxl5uH8bm2ikP1sOEUEheyYrggLAjniEU9+S6P07BdAbDn+JGWmRn9a4Chm
	9bHHxd85wKXXUzAzTVULfGfCGAF3DbyurYmUyrWB1d6V/Tlcqxos4TGpcKyDfeMsYCN3enCW1C/
	14qe/6V487uqJejNiPHeW1A6+Xj3gShuNO4L8HQ9P6w2esQlTD1HTUVe6c3CI/LXe8Qti/RFX1X
	z9GEGjXze9yHFnaTJrAQFeGZFEi1HGgie7oWftmffkqQH+I/3blctR/Dfc37vui8bJB4laScTBQ
	9MuPhVNH39OsI9XYL8YUK1JtgyOJiJzkChWwDOx8I+SOg1Iktedq3qBuxQglCsw5ldeWporyHPO
	7WT01VgFSZXVELiHQG5sDnksaez8J9dzRXPXoBiNHqzPTLX9G+az1/bxpSLVvu0nDxA==
X-Received: by 2002:a05:622a:2b45:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5414ebdf590mr23748491cf.14.1793298230692; Thu, 29 Oct 2026
 11:23:50 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com> <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
In-Reply-To: <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 Oct 2026 11:23:39 -0700
X-Gm-Features: AclHuK8I2R6ZBL0M8gpXX54gY1Y2jQq5EjXVV3xSH1Vs5_u0FZ2MTRQeP10WsJs
Message-ID: <CAP-5=fU8K4as51_Vi2vKAC-kGMVEFn1LDjCg1WvP8R0Y=8SbcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure
 and prefer zlib-rs
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 5:30=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > 1. **tools build: Add Rust library build infrastructure and zlib-rs fea=
ture test**:
> >    - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crat=
e
> >      sources in distro (`/usr/share/cargo/registry`) or local Cargo
> >      registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites =
to
>
> When we were discussing whether to vendor crates for the normal build
> or whether to fetch them locally from the registry a couple years ago,
> we discussed approaches like this one, i.e. picking a version from the
> registry by folder name etc.
>
> But that doesn't work too well. For instance, the graph of
> dependencies may change, there may be several versions available (and
> the highest may not be the proper one to pick), there may be different
> major versions available (i.e. not backwards compatible), they may
> change the build scripts, etc. Even picking the highest major wouldn't
> always be correct, from what I recall.
>
> I also asked a few distributions how they felt about it, and they
> indeed said that it wasn't a great idea without querying properly the
> registry.
>
> So one should really ask Cargo for the right information about the
> local registry (i.e. offline). It has been a while, so Cargo (or maybe
> `pkg-config` or whatever) may have better support for querying it
> nowadays too -- I would suggest checking that first (e.g. `cargo
> metadata`).
>
> I think depending on Cargo for this, especially nowadays and for
> `tools/`, should be fine (we were considering even back then and for
> the normal build).
>
> By the way, checking Cargo's cache sounds very strange to me: that
> means the version that gets picked is even more "uncontrolled".
>
> I hope that helps!
>
> [ In the end, for normal kernel crates, we decided to vendor for other
> reasons, e.g. we wanted to pin the versions, to customize sometimes,
> and most importantly to avoid any possible user misconfiguration that
> could lead to a subtly incorrect kernel. But for `tools/` it makes way
> more sense, of course. ]

Hi Miguel,

This is great feedback, and it's why I thought this was an RFC series,
rather than a full blown series intended for immediate merging. I
think the other obvious point of contention is preferring zlib-rs over
zlib. I'll incorporate your feedback into v2 along with addressing the
large amount of feedback Sashiko has given, which may become
irrelevant if we trust in Cargo more.

Thanks,
Ian

> Cheers,
> Miguel
