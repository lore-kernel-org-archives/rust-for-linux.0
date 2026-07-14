Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E263644A6
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784025498; cv=pass; b=MN0yRAQLVDmHSnTfb56CnihShph67of8fk4SKYUi4Izi0n7Z/c3lWgr7W+xLxmbTFiACMRs/qq88c8qMJsRQkDA7/+E1+7S05kfSoI9VyocMK9nHFD5GLu0Ylc3C7sffd10ymqjgJxRl3hiBkNUPDFHaSd7rCd24maagN82/DAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784025498; c=relaxed/simple;
	bh=AHf6aec0xhpXyvZyY0H8SDCiX+h8WgLDyu7N26iZsik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tmw10haUelU72+rsj8doC7LNCAjtzvBrVYklGQDdneA5ekyKo2QOzGsx5atbtbhcdd5qXVB0RaMPr8jmW5p0IrPyFTlFsKY8kHNldlIdwODC/xC6+74nLYKmIxEnKoPKxN4cYpEQL70qK0qK3pGMeLyNoQMsl4xLxgO6uBeviQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zb+ShWDM; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zb+ShWDM"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a32ff53fcso343763b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 03:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784025496; cv=none;
        d=google.com; s=arc-20260327;
        b=RHOvQnfIfOUcndbM+j9s/qfMC31pRRoIk+03qEkPRZWx+jItWVDF0U0V8maPe6Lq6p
         YLhds4gOqRRcSkza+4Jev4ykpNfC/sDCDlRx/AGE4plr9vGAcFlTsBy8oLFXoYVC+g2X
         +LtveL29dIBXfVds4VIDSLGiPDn8NofMlyk04K7mWuZ3GFyEELhp6AYAkPo259j4lbjl
         J7Fi75QTmxNroXNS4gXRFA6azmP6WIY0LudyW7xrQ/7DvUDTaRbgL01VNhUQ9t4FwWLB
         +nlnwDnPjvZAO75N3w9MrIKlAziE9nHSgWA6GA3im6eOpzIFLxE3/y9M8Z9F/muIEB0D
         8kTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AHf6aec0xhpXyvZyY0H8SDCiX+h8WgLDyu7N26iZsik=;
        fh=OuOpYqgCwkip4BtKloiPDwWeATT0mlbD1qMKWQVEYso=;
        b=WJX6dC0CeMOIqiKPqLGqWBOOrhsa/lQfCYyz8hwhowPijP/AITAZwyNEXak+RHdxUz
         SppoGBiGxdumwcshc/1QiDdCvjcpB/w0zERoxqtkFyngdZVjn0HKEc4CaQ0QFxu7Lunt
         zBwjeRtvU92KmMTWHIknDSboTZxAbLMjIOAURXAB/OEaYmj7yUWpdFXLv4h2PEJwoUaU
         9F0qbw6fDvGLkdNvhzuDGLoZuyHbkofxVTEMlB+VOyDfZUdUjjWmVJNW/aFxukKAiKKy
         zaGGkMfjwhQFaZ3dv4e/F6hpri8qSUaZd8A6ITRt8hMs35url+WbTPyd7av8P3nIaVxX
         10fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784025496; x=1784630296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AHf6aec0xhpXyvZyY0H8SDCiX+h8WgLDyu7N26iZsik=;
        b=Zb+ShWDMKH6EmZseDkFg26APP1za53zqodR6gI2lQF2nfU71GRvJcD9eB+olE3qljY
         4l1EE24XAHP8krOjqtKBsxI77RgMjEnpa8JWMKH3U3suWCvPQ1ZzTDVHcOZyMwf7fBR+
         r+LC+CkktGXCQSYDJAOjYWCFwV6UEDlsd2gRKB097T1Hri25FUKZ1xc1TxU1b7P0wFM+
         RsCE4Rg1NArFvtfqeQnDwqq+q5dfTrK4BG2igX4EkKMn7Y25mGFm9fa78kdXTNQA3bbl
         Ha65RQkILAkYqP8KGofvHGjfw1tlKvjZRaijn1RRD0hjDjMZVhXfwJSg8ubgXA675+rj
         3Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784025496; x=1784630296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHf6aec0xhpXyvZyY0H8SDCiX+h8WgLDyu7N26iZsik=;
        b=gwrOYfOZcEnk+gV3BVieqaOrqzUPAhiO23vCoi95OUHoHTxlmH6OCM2PAhXUWI5O64
         zfak1rCdARmapcj2BCz5Vu3/LL3qIT0OimWrgfCkg71PmvPGNBr5tb3zL+JZaVK6LrVg
         08Zw/dHHzdSGoumIjPA5JrgoSAq/dvRmen1zw6LSx/qdqthqEQDVv0Ecm9ekDhWpSfJp
         aAaThTgtIxY+ap4gW0drMKIYMXQ9lAEVD/jf/5Gc7e8ZV9gnSU41drBYeyHwkNzMvNa1
         pPQhS5WfjKVwzjCYfmo5eGyZSnQs2zyW3jV8RXp04lyRFydR0uVjp0HO/QBfRYG9MY3/
         MUIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeZNgXjrEiaVPWmzr3rNnXSMYVfHhK1TJ8Sb2vL9pQKvuwr5RPhqI4iUJ8WDwIouwaBjg3cJd24nT69ExS0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjW2FrnNWvr1V9x+G4A1R2I5za3u+KnqCoXsuZ3yg6Nd0NM0NQ
	vjbVOWO5xCLCBmta4eWQRqzvLljmhsoF3ELLql4W5cdwK1qZmY8Pc5zA8zd1Ng9eQCRlqO6CkET
	v1Z2Heb9I1rFJjNVLdK2pMw6c8eP3B8A=
X-Gm-Gg: AfdE7cmYIo+p/VRuIIaL+Fx4UlEVMp100cGKqsfVq/TbnoS0LUwc8eLdpQGNl6zVy4S
	S2Q381CwMF9Z8gVIySRBT02KO53Mc4dVVoHrt6QCekHuuLy5KiKjMRs7Dz732n1r1+uj1tDSDq+
	f2JFhBpqKUiTE8YLzXo512mHDMMdtzuT048zVcLFkVM85uNRxM+wrlS+RMKSDsHvjWaiD/j/ugC
	UJD86jKKeFSrkgMD9FD4orj9f51mah1EJPrmhIirMbaH+n/2VVt/aCXsQGRBaSnu4gGSbWoFaIs
	Tck5tHVJiACUQZgCCRTRVtIjGrbsTjSiJlzJ/+ZNBRjJuHJQe/Easu9aIWg9ZVVtIlFhIDfYv2v
	A8TIj1Ycurm7F
X-Received: by 2002:a17:90b:3b8d:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-38dc7b2d49emr10554055a91.3.1784025495909; Tue, 14 Jul 2026
 03:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713225235.3243480-1-tomo@flapping.org> <CANiq72kMWjfk9u_HiYsGWYGnKaF-oOn2w-kH=ap0wO9QccZYEg@mail.gmail.com>
 <20260714.191642.1103024240790648142.tomo@flapping.org>
In-Reply-To: <20260714.191642.1103024240790648142.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 12:38:03 +0200
X-Gm-Features: AUfX_mzN46iaPZAQum5V2Y9KwhiveXxmXsQjyRqbz-lKFVYBPHWlD6MhJaHs7uU
Message-ID: <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
To: FUJITA Tomonori <tomo@flapping.org>, a.hindborg@kernel.org
Cc: ojeda@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com, 
	sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 12:16=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> I can send a patch but as I recall, the last time I posted a patch
> like that, Andreas was opposed to that kind approach?
>
> https://lore.kernel.org/rust-for-linux/20250701001809.496389-1-fujita.tom=
onori@gmail.com/

Ah, that explains why I had the feeling I already mentioned this in
the past... Thanks for linking it! :)

My reading at the end of that thread was that he would open to it as
long as the constants had a name or computed relative to something
else, which is a good idea regardless, and I replied with agreement --
so I don't think Andreas was completely opposed to doing so?

We should anyway be consistent about this treewide. What we have been
doing (or at least my intention) was to document an example of each
possible return path / edge case. That is, we don't want every single
test in examples, but for instance here at the very least I would
expect to see 1) a normal case, 2) a saturating case, 3) the behavior
of that with negatives; but perhaps we don't want to have every single
test we may have about each of those "groups".

Sometimes it can also help for readability to split the groups with a
comment and a newline, e.g. `// Negative numbers.`, especially if we
have several on each "group".

In any case, one way or another, let's please not have those
examples/tests be forgotten... Andreas?

Cheers,
Miguel
