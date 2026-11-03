Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746633;
	b=MvVFzEaN3ir0qftY/3X8ExVBgj6Bffamc7Uwce5n/MJOecZe1XvksuRry2EfX/x6vbk4
	 2EVn8oskB03iAgFM3hdTQPM4WUzEDkbFcjovcdYvGqdih4CFlXvAgepKu9FfdnbSOj6m4
	 DR2IVSVMLyJe3G3S/7sJeASlt73QPxgWQme9WWZP5OtP9gnG+MxkhfxAWdkBWfC7RoW6L
	 LJlG91iLPneEJ5LP/l6CiYM9tNBRchmKAs2uXrxAZyufDMRX9EvyrS/pKA5l6uW0FoCST
	 ss2LXGhMNdSEfMcEm17vSYjlpWMWRLiIQZFr56Q8bdAw/ZNcioY9/WB2J9TSHzqXEPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746633;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=7UfDuvA+DcmTExnwRftrBJzWN7YKIGf3Km/PAUva35s=;
	b=CeO5SsmHoJuipx9p86u5YM+u/zK1WZTPzaAAx39PEh7gQTNjaw4nuvvUzTgIqiSj6wT/
	 gc+NBbYCO0O71NeMRZ4o2KrjNRpIrP4FGjNtyVt0XRTV82zeGYSa+Dm1QIrA2JW87h3+q
	 AiTgimvauiiWXsKS3wse3ZeRS2+4yuj7yaTO8QJ294AHPxZouoWvxgbRzwaWG3BeoRShv
	 UmNrH98OxqmHfe9/LV7b1XxwVcokv11a0kEzkWHNdUvq/s/2pAB3AmkIyE1vK8/KvMaUZ
	 H2RLOHLJrs5HvpjB9q87nAweLclKoW2bWkBjNq4fxql9Genl6Kpc7+saCS/rH3rPL2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=lWd66D4u;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YH8XTJlP;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B3C606A31B
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 22:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B3C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=lWd66D4u;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YH8XTJlP
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 577F51D00135
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 17:57:12 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 03 Nov 2026 17:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793746629;
	 x=1793833029; bh=7UfDuvA+DcmTExnwRftrBJzWN7YKIGf3Km/PAUva35s=; b=
	lWd66D4uxSpYbIeMqGhsLNnBVXONgDJCn/wl3XEoCZ+q92vAMEDCpMjaiIVtoppJ
	mLG6HHgsl4nZbpVhQGkYAe5ors7gzjF+7yEcCt/lWjWThb2frIEWHkyO+WE9X2Nc
	yAnzWUWij+vmHyWZ8MHxUuqLSxTgQp/ZmcaZr9veSFV+on5dCHHS2C9BgXgriyde
	2mAvY+RmukdVKjIr2UuY52amsKtKHIF6gKbwYqmJrcDPbh9l478p4RbYOjypTDDG
	vqdmV1YUak20p9hRj3mbO1fySDNm5MslgQgu5Z1qL0MSBhT/uUiBiA+DXYalY6l5
	fFTRAVpm6ybK3PeaEGLvUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793746629; x=
	1793833029; bh=7UfDuvA+DcmTExnwRftrBJzWN7YKIGf3Km/PAUva35s=; b=Y
	H8XTJlPDy0sTQXGJB76UYhYHNp+FeSYiHVaJcKcgH8NFHoPHvmMhJoyzU0PhoRjk
	KPKKYW6ivjg75j/Y6rOKfDGfNDEjufqHZ6ITqfD0r+doppLTv3Ue06/TKmYNIdPc
	7MrREEBOoTix6ABE6C66iBmjqjpZDr9xNma/FNSh0gX57RUKCe+qgD6wXVRCxWog
	c2GYQBLbq90CpMADbvA2yko7SPC8xVMreJFpC8BXW3l3Tt+Kgh1pF+AbqIpxYxOz
	znd93jtWza/3IVGkaTMkIsMZaxWHuuHZ8R8PS9ESY9TuyHcs5IW8S2+nwI9Ak0nH
	g/pOaL+zTZISkGyCy1+Lw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793746629; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:EF3At49yvgI/3kvRtirllTVyyL04yt3QKmJPevwOvIj6EyM
	R7CEn6YLDGUC5IqB3wvaswW0xSEr9NIGojzhsvGhKIKWviG0NFRf6mdnJ8z0Sd4R
	AMG6KX7EnX0kV4btNrU+7bIwsO2VnSRzaEM7tQtX+gaJi/Fzl6kEEhb2+5Z/NYGe
	n25Wqk0QCGFccZFH3E9MytEvnUuNpptbA0q548FoAk4yVpeDO/DyBeO/6t29GyEc
	Y59pxEx9/zyJAjTGgmBGuYZSA+XynXUtORZdK8HN3ObJjQD8sxyJeuhi5dZHtUzJ
	32ffwj+yVjjPZ4qmkNGU4zofAv7HVNznlgkGmXQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nNQyfHotBFZdmnLf8VBfampmR/3jp0Nty2kPI3VgJeE=:je0xRR9AtCyaD57WTqX/T+P9SmKXGZKhKCtk9KzsgH8=;
X-ME-Sender: <xms:xWbqasqp0m3z5AqbsNEeRHkSUXUSe9Hmv_6aGh1GHL_wzNwK3_c8lA>
    <xme:xWbqahIF_Ji9rujCbVl88Lq__YpLpAbcRbW297M_H7j89SB5EVLA6YZHVISuyeNdI
    ig5hOXcSgvZn6kT1rT21CtOGeAna-JSzVukDRYKya34JmQPHKjYF5bK>
X-ME-Received: <xmr:xWbqaoBwcE7ACD0_8TosI3unxfHsAPTE68urv1yyIjQvstAPqzg09rzQIQCRpVn48Xu11KAtW0hObH-23-m9ADkz>
X-ME-Proxy-Cause: dmFkZTEL5z/GH+jhqJ+hy5QcDI2QZOuPBjY17Iq+jmtB+p6D+ZwgA207QoViIqmeSArGz2
    919UhKHhWOjWIFPQt+7m65eSzTfd7oJ/Mie6OVIh3WzIBbVtXlZNit1pBeBiK+feCUyUYf
    MiDwaUaFe8EyFNpKm8F4+gU4O/fsYACPdcETBH3tF5M5M3aWNhQbauQIWDHad2pcjzOxVY
    C6A21gNdMq+GezobA/PX/NM4MQMgVKSLdIvdVObnGQTD6vIA96JCXcj6JKK6rpQHVYJuNR
    WXGz6E+Lp/AzHP6s0Gr0UacpcySZFbMfTzlqbRW2Ii7vM2V4tX2Ee4TrU6ilMPLRp/dlk/
    rLqFelI5Lfqx7z1J5oDF6HQHUI6NhRW9iOM8fxypZJh5aF8XVOfRsMIzCRdS1tUfJro//D
    0ARGm2li0e3GzMUlB5xVjH0TiN5PUWmuiZj+/+wZ91rXZ0AIKjdzs+NJI+YYFHs4Jn2bPd
    ODmnNqfCXPjyqTEE5W+krlT4RTzJQZ2z4pQtuQlbAREKquEI/3ygOQ27rJ3wLbjPCeOEi/
    /S9LDWHto9nuFzyjDSpVr9EN9emam5ROI5LfEUFMZ9GR4EchtDe8HcXbTpjIT/4cYSEoHA
    6qPabKswsYrJwh2b7mje/LcXa6jZD98yTvs7FCXTxTlaO6Ii5lehvjYJVQ6A
X-ME-Proxy: <xmx:xWbqaj4yWfLjbtPeFapT5A9kgd5BXNCbKHMthvtNUqxsc-C72Zp_7A>
    <xmx:xWbqakFWRThuXp9EOZuRuM3jTmZkHvzDwXkRixb-dKVPFqnQUm0_Mg>
    <xmx:xWbqauSdKF_WcZ0baplMM6aNx2bRonPnb-KjbD3z-bajXSHoxtBq6Q>
    <xmx:xWbqaucXAyeuMZaupxaa7AIUCPBba7RmDx2pZY_gqo8klIJ5yYkZgg>
    <xmx:xWbqal5OZzXXU_PKcdH52tlbvXd0l5mqPyPdytHbpBGb5OBQQc1ORJWt>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 17:57:05 -0500 (EST)
Date: Wed, 04 Nov 2026 07:57:02 +0900 (JST)
Message-Id: <20261104.075702.612319673416199209.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, gary@garyguo.net, ojeda@kernel.org,
 a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, lossin@kernel.org, tamird@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
References: <20261009224626.1331914-1-tomo@flapping.org>
	<CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 11:54:26 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Sat, Oct 10, 2026 at 12:46 AM FUJITA Tomonori <tomo@flapping.org> wrote:
>>
>> +$(obj)/kernel.o: private rustc_objcopy = -w -W '__rust__*'
> 
> Hmm... I am a bit worried about doing this here, in `kernel`, because
> it is a big crate with many other things around. The pattern shouldn't
> match something else, though.

Agreed. In v5, I will move the stubs to a separate, small crate, as
you suggested below.

> By the way, since this is here (in `kernel`), do we need then the
> original one in `compiler_builtins`?

No. With this patch, compiler_builtins.rs is empty, so I will drop it.

> Actually, taking a look at that, I don't think we needed it (for the
> original reason, at least) after commit
> 
>   cb7d9defdafb ("rust: compiler_builtins: make stubs non-global")

Right, the stubs have the __rust prefix, so that reason is gone.

> And now, here, in `kernel`, we don't seem to need it either for the
> original reason, except for the `objtool`, but also for yet another
> reason: if they weren't weak, they would be exported
> (`EXPORT_SYMBOL_RUST_GPL`). Which again points to the fact that we
> should probably clarify all this with a good comment or that we should
> do this sort of thing in another way, e.g. in a separate, small crate.

Right. The new crate is not in exports.c, so the stubs are not
exported. Then the weakening is needed only for objtool. I tried the
new crate. Without the weakening, I got an objtool warning with
CONFIG_X86_KERNEL_IBT=y:

  vmlinux.o: warning: objtool: _RNvNtNtCshy5ABSPeoCG_4core3fmt3num8exp_u128+0x381: __rust__udivti3() missing __noreturn in .c/.h or NORETURN() in noreturns.h

> So this paragraph we have (please see below) was outdated anyway
> already, no? i.e. this one:
> 
>> -//! In any case, all these symbols are weakened to ensure we do not override
>> -//! those that may be provided by the rest of the kernel.
> 
> So we should probably move this weakening explanation somewhere else
> if we still need to do it (e.g. to the top of the new `-W` or to the
> new file).

Yes. I will explain the weakening (for objtool) in the new file.

> And if we didn't actually need to weaken the symbols after
> cb7d9defdafb, and it was just about `objtool`, then we could consider
> doing something else, e.g. an exception in `objtool` for this set of
> symbols. (Of course, that can be a different patch, but we should
> understand that part above for this one anyway).

Yeah, Josh's objtool series would solve this, I guess.

>> +//! Since we do not need the vast majority of them, we avoid the dependency.
>> +//! But `rustc` still needs a `#![compiler_builtins]` crate for every crate it
>> +//! builds, so this crate is provided and left empty. The few builtins that
>> +//! `core` needs are in the `kernel` crate (`rust/kernel/core_builtins.rs`).
> 
> I was going to say we should say "why" here, e.g.
> 
>     //! ....... so that `panic!` works as usual, without getting converted into
>     //! `core::intrinsics::abort`, i.e. a trap, by the compiler
>     //! (https://github.com/rust-lang/rust/pull/122580).
> 
> but part of this is in the other file -- so maybe here we can just add:
> 
>     //!  -- please see the details there.
> 
> (But please see below)
> 
>> +//! The stubs are here and not in `compiler_builtins`, because code in a
>> +//! `#![compiler_builtins]` crate cannot link to functions in other crates.
>> +//! There, `rustc` turns a call to [`panic!`] into a trap that prints no
>> +//! message.
> 
> I think this explanation may be helped by mentioning the PR link, and
> perhaps shifting it to say it is a decision by the compiler, e.g.

Makes sense. I will update the comments as you suggested, with links
to the PR and to the new issue (rust-lang/rust#165399).
