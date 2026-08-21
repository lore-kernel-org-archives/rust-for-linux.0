Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9C832AAA0
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787331379; cv=pass; b=S/Y8P4kkzCxcy3NCm7TUGVXLsDhQtUHmXbnWK5tP/wp20TWB4LxgN/hEGHyjbmls+4DzrPHkwKs0XU/gblwgIbX3VpoKj8lLWh5saAdxB9eqKidzd2a8wpLwzWsODIGAs7Tr33ARYCGBdAfn7c7EnmZEwx+j92pa8nuNZ4z/9bQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787331379; c=relaxed/simple;
	bh=h1BJ8TU5vP80zzDCoTURV2b2SzrkzqoC5BW8rzFmNNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MW505wytUamPA5/+8vjKYO7VuGSM7WTYQLKs1vs1rRnffXP30c4vihtiWOU39pUdV9FwD2Y0ldsuMI9NEAjwDa6OrKWI1tAhXI0fdGsjbSZHDQA1eMKjUgOmLz1TuYy+KWARo8hLcboxPANUmyvU5tQBdaBsr2cQE/HNPDcCc/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYwz4CO0; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYwz4CO0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d319b84213so2025555ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 09:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787331378; cv=none;
        d=google.com; s=arc-20260327;
        b=MfAb0hk9RDF9r6bjFEFcOaxshmBZijQVYdvk3bPW160H0nP4OVBhTfWtCmqRreg7qi
         uMwxJUEm4NZ0pfW+Nn8nVNo2sDQLyo10kl+TPHEwx13OjBjupqSkXXoxChw0FH1+upok
         5HdcxtW9E+1CgXE9Im0PeLK0+EMkKBuc+zug/i6AWfv6CQ0fQxXppcIBD1Mdvn7Bve2D
         H4uTVcjeWEMtNPj8/a86JF9E3C0HiHJpwLhUnCwFhvpStnV2ws+ooBdQJFKy59u5Nyh0
         tiPEC8aPu1CBkj4ujaKfO/fu9BExTUriQA75uuvaLcJencX2iZp1HYFRIDf5syIn67+U
         lC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h1BJ8TU5vP80zzDCoTURV2b2SzrkzqoC5BW8rzFmNNs=;
        fh=fGLjQFt1FNAk8i+NkAFzUwtqIiEFakLW2W1z+43n62o=;
        b=GTRe5cUFPfvXAVL/0cLNifEx+bESerhpiX5Ul9d7htKQhSU81jw7efEr8H3y/4KnUi
         0QaAsiMfgBe/9CIXlGG5DwrJQ7XaTHYnZiq2VtJeoFhOq5qwltUG5A+JcTx3hlIP0d0c
         3ZCv7kkQm6Tecr4QMUsQlhvfmgW99RUZBJ/dBklA66S/vhtU4v0XlQ+TYoZwtvAUw44p
         /R9Gx+5HerqU5M4BzFdOJEyetvV0G58/QSYygoXFv0u62cJJexWNcUS6X7mbK812Qb4j
         31Rx/QowCMApa3uKCrpy380LHAC/aPcwVI2/BNol+WNL9GxVWtGM0C31AbK5uRoRTzH3
         LiWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787331378; x=1787936178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h1BJ8TU5vP80zzDCoTURV2b2SzrkzqoC5BW8rzFmNNs=;
        b=jYwz4CO0v/m4afxF65Zo9rW8iqaiAd3vswZY1fdjXJ9kw2aCx5nZt3G+t4tLE0x9Cc
         hysZSUbSWLBFwBnFvOPp1u4gekcbxG/uZTjUOmqvDN/xwVjbZBs/a3h24K5kSEsgrrhw
         IrPW/jtyIlbQLO3hmBpLau6+9+AYDmIZZiO7/3qUA7kHQKkluE07YX+Nnfwc/8HL/2Iv
         x2+dp4uVrLccQh3aAGuoZffNntTlia6zrefulXEi1L7VC5TuXuDQjxY1Nl4x8yglQMuU
         527pPHv+jcR9s7UpJQREljmEDIFu5CATYW8X1oBtdgNjHyDIQzw1kikLgp6o1ITnnCHi
         l85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787331378; x=1787936178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1BJ8TU5vP80zzDCoTURV2b2SzrkzqoC5BW8rzFmNNs=;
        b=HyL6j4WmvEO9k+t9qsY0YVMDDCFaTURuuU8tJuqWGeJoodIU27/SlcjCriXAacZHjZ
         HnDJ1oIzP+gUqZUCpR6dMkg3CFudv/q8aJ3RNClnHTAdlwPBUSqFtc13RVU1UNgVJ7a/
         PV1HnmEzJz/x7HbFY83IbPHKuk+hxkxl1A8gajZKlcQEpkme2ecc9ACSSh/VtdRWYgqc
         ANoAUxiPTsbeFJEGdZwgqysD1INHav8bKuiRzIbJNBAwlryUK/FzS74HnG7RpGXZSP/5
         XIkxyAwgFhZjwyYs1uYVKP/10BbIbVrEHtCT7y4lBQCqBg9O6Qege8Mys3HPyFc5j7Sj
         6SQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjXY5HlY4dClWzRlQTD02j2TYZjk58NRJmfRoCAkABi3suUSliQjF7/GuiHl6CvgY8c2NGBhyYviFjHXlH4w==@vger.kernel.org
X-Gm-Message-State: AFuF++mFTvV0CS5CPMq7tNsv0Rhdgjesxq+dWd2Cmrbwd8unHJlEp+kI
	KKgDDrW/2EuMRfaXOnXPNyaf+ml5CIyqocX2a0WtvchYisSFcpsqAYrCZZmWDTHuH8evCG5ctc8
	KUzVlBAHG4h+yPF5Q4lVQvpqSyeei+E0=
X-Gm-Gg: AR+sD11UaXy5s3vvI+CMYPdLBNDYXiXkedgNoozRbgfYqyMYQGcN15brighg+v04MsV
	pgfab6O1wbwbxfJax+A0BdHbwSfNnbrNEpr6OB9XG8m0MBCl9AVDczVzG7md+/2zOTNZPuuMVrn
	GEFQ57fudHqrnZQbvhFCRJLqWWN4N95tA2xWnEeSeNbLnBJH9tNOfTchQIFp2X2Lo1p8XHeLI0m
	ft9C0B1ISuGhRSbQexPwd018FQeNg03Kx+CFm9sdBsVi4FNxrkLNHxSynhR10tA4CK3HoPEtjao
	b5yQgI9bWA22b+PCPxP2xXDNT/COIR6N5zj/fe/RoKWPAu382eTXEbj1nLdDhrkpZOu1WDNAgQw
	XfNLh6URQZ6fkizphwtrFyY7qgzqkeO9Fc2ToqVCbyiOtxgjZHEkhid4+buNU
X-Received: by 2002:a17:902:e945:b0:2d5:cbd3:8eb1 with SMTP id
 d9443c01a7336-2d64b162c6dmr70531775ad.3.1787331377760; Fri, 21 Aug 2026
 09:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818105350.361218-1-ojeda@kernel.org> <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net> <20260818132022.GC5432@nvidia.com>
 <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk> <20260818142300.GE5432@nvidia.com>
 <CANiq72mOqWw0gxCCcJSyWRVC_OXSt92g5HmAOx6OL4xp3fcC1w@mail.gmail.com> <20260818204621.GB61595@nvidia.com>
In-Reply-To: <20260818204621.GB61595@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 18:56:05 +0200
X-Gm-Features: AcwNN1UPPo1HjSlbQdYsVq1-8l_CCc_BwGMrEvcWp7isi9phs1jBKNG1davq0E0
Message-ID: <CANiq72nS2zDKShxyxcO2EyV6R_6F8x2Pzj_Fs0n86wXBBx6E3Q@mail.gmail.com>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with `raw_try_init`
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Dave Jiang <dave.jiang@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	linux-next@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 10:46=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> It is fine, just give it some thought. Your PR has a list of
> conflicts, and I saw one other of these pin ones there as well.
>
> Imagine adoption making it 10x and it won't scale. If there are things
> to adjust in Rust or process or whatever now is probably a good time
> to work on it.
>
> You don't want to end up stuck later on where you can't do the
> refactorings you want to do because of unmanageable merge conflicts!

Semantic conflicts are fairly rare for us so far -- this cycle we
happened to have two reworks going on at the same time. Normal
conflicts have also been fine and not too onerous either.

Given the treewide nature of the Rust tree, I think it is bound to
happen from time to time, i.e. even in years from now. Part of the
idea of the tree was precisely to handle this sort of change. It is
also why sometimes I close the tree late.

Of course, I agree that if it multiplies wildly, then it doesn't
scale. But we have been able to handle those in different ways so far.

At the end of the day, it is about striking a good balance. For things
like this instance, where we have a couple one-liner conflicts, then
it can be simpler to just close the change than a staged approach that
we did other times, as long as Linus and Mark are OK with it (a year
or two ago I asked Linus about possibly doing this kind of rework in a
different manner, but we didn't need it so far).

In fact, the only "surprise" here was really the fwctl change that
arrived after the merge window had already opened. Otherwise, this
cycle would have been business as usual.

Cheers,
Miguel
