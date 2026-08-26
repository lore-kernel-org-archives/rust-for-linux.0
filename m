Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9949438034
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756564; cv=pass; b=uxO3sYcRINkFxyXHEP/nXuHxPxXN/oj4+BT7LxU1eQVKLmVRt6OPumR9aqekxlsygLDoIHRl96lzFKKYZDOWypdl9+9SCBOrtpV7wXo9zrJrCzZMHsoQrNq+AImWI/Kqjz3QG04ZiJjxebc/ceskJHEU0X9vD5yUTDDCQoDSOu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756564; c=relaxed/simple;
	bh=/5GEC9MtQECsj84A2/9ukz67BZyUeqSD9PsiFzlZiTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTOK+Lv353J3skSxkVzZbf7Z0aRdroNryrxk3y0keWMMTD/tDjzI/Hp+H7VFDXTXoep99AJEtw/hF3H+iDYrWMwoL+C5cdb/aBsgq3ggDveGdp2RmByE1QhsF2TC1sbIhy348/TfKcTB1l5UX3wXqkgEOvGXyxeUEsaXd+gCRHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8Pupy+C; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8Pupy+C"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cffd93cdedso1544015ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 08:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787756562; cv=none;
        d=google.com; s=arc-20260327;
        b=gosHSeHC+Xt6hrbJVytpbc5JZqukD8dZ8c41XcwQcZteGcFWKw5pwGRWDCztWAQvy6
         K8STFuw3UtFVHpNE20ZErU45cRdaXsFSg4uMTorn3Ku3xIL8GLYbbiSBcCq2FHd9KB81
         WCjxCGIrbm7RNjYyia6aedlPhrzr5ypKHFGCBEVPE+ByncahgP5l5nfvGUU1XKwFI/ZW
         D7KV7PW43JGdcMtnfbwSkLsr1QhLmrVWvZfdobLmsYzxTOTYVZyy4Oix8EwE8/uADJdA
         yaFkr8W1ELSOIkdlYHdb6iG6qHXSV8DFPmQBhdBeWt8gLzqnUoAvIN3/tQV3J6DnMTpc
         Vymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKjFrILSlKMtCa7HCHUu+Qbu0uL60HZCrihH3ZGerxk=;
        fh=hRIzFJMLtBei9KSb1t+2W0mX0yW5hP+byLdn1CdB5IU=;
        b=P81AKF6iaybPpX4pTTlpb5T2bsYqMHGQWPyaiHwLhslsAg20bSQeqwNH/E06QjQEjt
         Vtj6gO1tVyIF7nX/4M8FESo1liGzBjYZIqQfl9LRQvP6M7EO6E3usl1474VtXAl+Vc8a
         wkJvdo4DkpSzX+mr1f0FM1YRGvp3s96CjbkfNYEUQKudAuPoPEhEioJz4IkWtMQmtniA
         QvZ0ieQO5L56HKvA93f27XjnuWe7CNPoWZ/DHynncuyXkJ7fgoJCMbnOR1g13jRmDlTv
         ZoNz7ti9WuZw9wb9eWevPo1GG5xIWgbHkTqdq4HInWSQTIFtNTRHVXQZC8pLR8+3dqQy
         0Wcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787756562; x=1788361362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKjFrILSlKMtCa7HCHUu+Qbu0uL60HZCrihH3ZGerxk=;
        b=m8Pupy+CuZdnIMUlQqvnvg3oS4cQb73XGz0bfGWvZT3QL1Gkq5gfSRajc6P19gDG83
         MH0nJCIRCt1tZWaeTygLEgmGNJ8mXKA8g8yv+0JrngS+qQx7VCh3R/IlSwORnjRpUQlP
         /Qu93BjfgW76s8GzLFYRwquyjDtWHP1vSUHvpE7W4w7Vsh3lU0IRn/tWpof58BOWT9qP
         OLycJJnweLFSU+l4eN5ud0RCcoVV5QQ7NQXr0Pbw4HFlKtMR0ZKNlEf6klXj6ACysBQx
         vhNXc6T2jM4CbB+px1TLwOBIEfQFBiXPT1RJ5y6qiifL4kWdhiYewLtmD07HlyCaqnKi
         t8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756562; x=1788361362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKjFrILSlKMtCa7HCHUu+Qbu0uL60HZCrihH3ZGerxk=;
        b=fYQvsACENjz5/oUzMu4sFAly3NcVqkFVFnxVuPAYdF/zaohf1Pw7a2TOt8tk0LBkNn
         8ym9wXlKVRDZ3e3xjLWumxybnJretHW0julsBgqSmdFUmARyPRjQ/zOlJh8W42ATvlU6
         MWQKWMXzgsiRLYg1O7w1lNOwe+lVp8+G264L6Dyr8NoHEk5fV8BV2HEJ4/aplxKRnQ9V
         iCxNj+scTHhQJTr47GzEsPf4y+PGtSzLM54RKvwJTQC0CzROzM3+7oIA0uwvcx/YI2VA
         5ZURecbY+SrKOlvpjV/dUgcj6KEbNzVSVNJtG+tWfa7NMBDIMNcKTu1xIaveraok+E37
         aeJg==
X-Forwarded-Encrypted: i=1; AHgh+RpWNFKcXxQJz9oqXGJXD7shR/EE4hZvjfUT/owIM8o357aOnsKqome35wR56bcOHrDqzrD95jQvVRZqedzkJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kUAIRtK/5KCTSrAHHKSvn1A+Zfm2p44w9t6XBj8xA6wfTNHWIW
	SCf47UtP3IBHfSH14u+Fwn9J+kvpPvCM1cMS53GSoihk3t0BTMt6CFsE1GwLptIKyB8G3aYX/Dg
	08DURlpqHQR2lhlA+ExfXjXvMdITDirU=
X-Gm-Gg: AR+sD10scFNnFoPXumNL1SZX1p7Rm8VWnGIEd9oj9VW+wbSGM50nF1pCGVkhe6YBcCT
	jrmNOFrZgL1lsApirC0JdgqvfRpadsS/XJLClb+oV6riea8nkFlDDIkLPo/65PYooywde0l35k7
	+OgIMhgPnr/rWBSR810VAI5xnmewIXBvfL2ZRjID05gcFUm2gndrgLgjLtcxU+7y+hbWRtLUP5c
	JktDBsHFph7JmIIU68+bNyVPh2x4R7sFv66An4+yWV28Vy2z16U0ZHZHZ3pIEyhxn/upekVHeEC
	x0uGli8AI7kFLv8zaeCSmK/ugWgQNynGG/UXjrEKBVGqIqLPLGt7bDDSfq3rEApG04ncdYy0UnI
	eTRqg47Ku1TyfR7PCEuEMInJbFzjHHcnYwvvLnf3uvYJbJsVJv0IPTvS+vcXULya1l4J5eofO
X-Received: by 2002:a17:902:f691:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d71e4cabcamr9458015ad.3.1787756561747; Wed, 26 Aug 2026
 08:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826145832.42387-1-elouandacostapeixoto@gmail.com>
In-Reply-To: <20260826145832.42387-1-elouandacostapeixoto@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 17:02:29 +0200
X-Gm-Features: AcwNN1VA-WD92RaG1JazLgbFi5wl6plkGePCcziqBYAfDtSGbu5lTLJre33ux2s
Message-ID: <CANiq72=NtS=YHkCbB3ui1vVkHoVpHh2S12XAC=0vqHcurJFX+Q@mail.gmail.com>
Subject: Re: [PATCH] rust: zerocopy-derive: Remove the BoolExt trait
To: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:58=E2=80=AFPM Elouan Da Costa Peixoto
<elouandacostapeixoto@gmail.com> wrote:
>
> FIXME comment was saying that this needed to
> be removed once the MSRV >=3D 1.62.
> The current MSRV is 1.85.0 obtained by using:
> `scripts/min-tool-version.sh rustc` command.
>
> Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>

Thanks for the patch!

This code comes from upstream, i.e. it is intended to be vendored
as-is, so if this were to be taken, then it should be submitted
upstream instead.

Having said that, their MSRV is different than ours:

  https://github.com/google/zerocopy/blob/main/zerocopy/POLICIES.md#msrv

Cheers,
Miguel
