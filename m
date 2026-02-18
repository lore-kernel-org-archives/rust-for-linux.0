Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD1E30B518
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771414879; cv=pass; b=P3Y/WZuf6IW6f2TM5MyZgPkv8RX2gdLSr4NhPvHVUJNZFeBPZAZ4DC99sd0n7Y43U3i36rATXzkUR4Q/xO1/Ur0Lj+q5fem7Ir2pL++EDIz+7WeeBMSaJhEHOceXT32NZFvdo+4eU5sq1DCFWKN/0NgurgsdTikHOnhcmpR7ZQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771414879; c=relaxed/simple;
	bh=gjdOiWgEgikwhXIhC0rlkUbRroQeExL2YpzUzSCmQtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqYpsac9PXZvN41MYvm9WawhzGm6tSGIRCujU7DGrfb3YuOy+8AL4zcm5+Y0SoCUrZ1xLIrBBabnkJ2X5Wh9aKLYN8LpUpsdWyWKqcCl03a4nlJ1NAxWtPFvtHBfDzNhGwefoiQ4hNuJY32pb61YlBsPr6DV7sgT18ssJ6NDJYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTwXEBVz; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTwXEBVz"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-124b07e5fe4so329513c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 03:41:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771414878; cv=none;
        d=google.com; s=arc-20240605;
        b=XLU1QlFI86jBnuDsFBr7EIshi2FsyzqbGSdiwTTAhym/zkGHR1TdGrAdSe7DzVMHeS
         fC0wSNRcdN+pbuGJUvt9MDh+8/BYnNx8XsT2D3fI9uI3COMzOExV5Ot9ETxToOPccU65
         WcltJvJdbFmqk3Pqm1qEIJS435gMDSXkAPEz03DAN3Dm/LlXDSEqsirxrnxAIceUcf1Y
         rmNdMgYUmlclSEM2rsZc59A5YESL9JSw03EEv7yBOBiwVICGiiIazzdQEhgilZknj8an
         XSuJD08G+gksZhxEX8T7YHaLy6thk1r/TvVEaQT6crNumEDOWIobVRVz64VEcwB51Hix
         M5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KWI2yBEIPJGjVA9CHlFoX3qIQQ07WCxmd9bYX3FXatc=;
        fh=OHSHAtICEDLuqbpOPPcNb5GfgWZ8UYVXp80bsgpn/Rw=;
        b=hiPDhNhqwLoMl+aupejywAxOU5SAt11y98IhGpGoSapnewqCfc3E9N8hyRmlMzXcVl
         5hmh+Hw6k4sX+Tgcr9DmQ7xjkBurD34aKfGDwQz8U+ytBtO2kil8FUSq8gcswSyHe9rB
         VveoUf7n1gkwAD2A2r0sTNE7fuscAWfp/Cv+P4wvJVtojttroBEbSkR+X9c52gEJoEOz
         0k6A17my8gJXPwYRFy3TJOHEyAkK+NwWgyeQdRFmsVUT0AbYIasn+B4MdKQM23Scuwmf
         GOe1edjmKcijYiwcuYbFB/ukJzjdviv2xhA5ofNWZwOytOK7iF2uAKWd/mFApTWpaJy9
         rhPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771414878; x=1772019678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWI2yBEIPJGjVA9CHlFoX3qIQQ07WCxmd9bYX3FXatc=;
        b=gTwXEBVzZnpw9UhWG3FQD8INBdyjMME3v5NVQV6yjC41/jglmEUYX46XRO7qZTBOXl
         V0Zng1t9n8wIeDUQ5Jd2jOskv6Zn4yNWw5TbZDUAALvTy3dRry/Uobig6dtYqg/Hlguj
         wRerKaaiGbSeSnDulBkTrrMbWEdm8VNROUsQeFiDKS01dxUkx1u/473apLuF+5SOO3iJ
         lVngire6wdP5O49nirb+hYocnR4jn4/oNYVUrB5nANOjP0q+HvYUj9yHXScxv6zYADTv
         VoPlfQ/e2T8Wj1KoVggqDTWu/VjSB02HeEsbFDcSBHqhB+t+eMKPx/whK5o0lhxNJ8e6
         hP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771414878; x=1772019678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWI2yBEIPJGjVA9CHlFoX3qIQQ07WCxmd9bYX3FXatc=;
        b=HE2oNidaXJQubsEgNXJXtxFFe1UnWcjNrhJvoEVnzgAfL5qpiZV/r1IDcDNV+LGize
         lz4amSD7nbWbznQmWU1BcaQG7PjB4BEKOZBKTD9TPthc3ZzEaOQ8V/3WQ1V0kLw013Lm
         FGV1bqxQ/QpS2gB6u9NxaJOLDKpBj8sZujlqR0MH566cfAV6uUNuHB4cGPE69uHGHrcI
         E39YWKKfZ1mLTLsbV/ytiHYp3Fw3f32X7UN7UESlpSjGl6pu0RZwgrXa2JAiefhwcrfI
         5PVvwL0K15DPwiAHx/cloAT30YpgPvugZIpSCuLJvhxZ0JS4PVGj9RtS5290Fc2GMESF
         EMvg==
X-Forwarded-Encrypted: i=1; AJvYcCUDWNLHgrTljyPwpDHTquoIzZx8sDObyDZ/+UOeZ3fKbmUBZJsKFGa4HhUf8LKQzfuzNmMyjVux/427u/72MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD+n6HgU2VYrAgmYhWWzhMBc+IkTt1rmn+cMa1aYma0bjWxwMJ
	C/eB4Q4LjUSjrnEg7HnX5wd18jHdFWutoUC5C1rHjmjp0fifBIUUGYWjBHpGEDJkWBcKdHZ/fqC
	OORw/7vbTJYEIBzOC4PmecKIYRhZMw8U=
X-Gm-Gg: AZuq6aLbmmU0XyNevBi4eG3Cb4D2t1GMJkQPx4ztFWu9IxJWFOwFdEDPfjFxIQCJnP5
	HbhHRh+e39QTPSihALYjMa1a0YJ3VUSWPY9C7tlbH2HLeaSNQ2ScMS6j8ZmqFvOlMLiYhNCCbJ4
	+VPCXJ8efoRnfMoE/uEhJBPbi4zoFI0yMUqHKGdZk0FLpVmmYqEtVePbSE4GpNYtAVGtGBwlZ7F
	x/wtnAh02TYZ+lAy234p/usoYYB5zwehqYVah5zkA895LqHpAfVfeFJc8jC6lyCMuDePFVlCOvU
	0R4Ai3nbnM+oyHVFm2yScFmiVNmh56qalIdqob7aGGVYZDqfumu4RXZaVVbxPEkWNXQ067iH7L/
	ipQY1QilcbWKf3B3Gh/YQJ1yG
X-Received: by 2002:a05:7300:d709:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2baba03c364mr4070873eec.3.1771414877472; Wed, 18 Feb 2026
 03:41:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
 <20260215-page-additions-v1-2-4827790a9bc4@kernel.org> <g4ihY-XQwSZ3ysINoU0v3jFzzJG7Uzonq0b6C-EYEYDx4pbJWHHJ1hYmQsmGATIDzexHv6NFea8YNikY6zXq6w==@protonmail.internalid>
 <CANiq72kovxkiF1Kj66yVyQYKx1OijjtTGB6UN5M35th57UFFeQ@mail.gmail.com>
 <87ldgteftm.fsf@t14s.mail-host-address-is-not-set> <RHTfcS8-6wqboBRd0aNAk2RG-phiMsedyL_E78rwI1FbLtNzmdCAlk5Es1KyQMPV_-KAtJw_-ImmDchI0Mp0Gg==@protonmail.internalid>
 <CANiq72kZQiu9DbQgkHXDDjHORwUdTm7oOhZOE4Tr8eHiyW7RbQ@mail.gmail.com> <87v7fubdeg.fsf@kernel.org>
In-Reply-To: <87v7fubdeg.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Feb 2026 12:41:05 +0100
X-Gm-Features: AaiRm51hD4BfD-fBvJQ5turW2JocX7sPSRpb2NYOD_IsynfSnDIKMk_bFB-5v0E
Message-ID: <CANiq72=cf=p-ORX6BO8LPhFK06TRS-o6PiYHxcPQhLAkrdCgaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: page: add method to copy data between safe pages
To: Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 10:37=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> If we picked a style for documenting argument lists, perhaps we should
> add it to Documentation/rust/coding-guidelines.rst?

Sure, I will. (In general, I recommend following the overall style,
i.e. only 3 places in the kernel use such an argument list, vs. all
the others we have.)

> I disagree that the bullets should be swapped. The second bullet at the
> call site:
>
>   // - By type invariant and existence of shared reference, there are no =
other writes to
>   //   `src` during this call.
>
> Maps to the second bullet in the callee safety requirements:
>
>   /// * Callers must ensure that there are no concurrent writes to the so=
urce memory region.

Ah, I see what happens now -- that second bullet is not in mainline,
but I see you are referring to this one you introduce here:

  https://lore.kernel.org/rust-for-linux/20260213-page-volatile-io-v3-1-d60=
487b04d40@kernel.org/

Is that new bullet needed though? Don't we already exclude data races
when we state "valid for reads"?

  https://doc.rust-lang.org/std/ptr/index.html#safety

I asked Benno about this -- let me put him in the To: so that he is in the =
loop.

If "extra clarifications" are needed, then we could put them in the
safety standard (Benno already has a table there with the shorthands
etc.), rather than introducing redundancy in `# Safety` sections which
can be quite confusing.

Cheers,
Miguel
