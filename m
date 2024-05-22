Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B677117
	for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379481; cv=none; b=LNzYauP++2+xWv2DvaHN79u9pn1HEQcifyDGzN4Pys4om8EmtWu7fwAikcKX3bt7j2ZunO8yFGKTbj51Bx6cmynIeOdSUeGtIWWn6dC4P2RbLqtmRq6IbzX3ZBnoSs8BrDO/S1D1+yHyiEmhbjidmQGH38hb23r3dIyin5TIr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379481; c=relaxed/simple;
	bh=fJ/sPbihNIxW9vhVKiEEJLhbBXtMIxgSC7LmYq5fVq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0P1mGmyg6MPsoYNG3+galAhV5TkW1jDJy7lURQHe5EQTehbZbl9AYIJOernSAJ2Ck19qbrEEDQXqEAntUnAlhIV44XGzGuANh/UGabHgTu3RoOFAdsie+go2Ni0dCQF1BIDgvez4rlXpGT0bioclbF5CP65v4kDZ2qUz/x9Mfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZBfgrCD; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZBfgrCD"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df4e1f0f315so645206276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 05:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716379479; x=1716984279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwVDi/8SRhVuR/ROIz62XO09PzGSpT74QeSqHhAGKNQ=;
        b=QZBfgrCD4R76mewrRnKpDJwzRNFupU6WkLxgU0y5sbQA9/oRThLwqNAhitjOJwWLYd
         iOFBFpzXMVnc0PTFH0SYQLoBxqAkgV4SD4UllgUOHZVvyFVvk7nmkjVhF7K5oQJStUT4
         Y2JeGfb67bsBO4KdfBo1mWvwbYm/kuJ+GS1fG+iyU2cHbQP+OfCiFurK8lXG4JDFRrBk
         DO73diypj1Pxwsv4obscte1oILRz6AsUMalf7aeDtAayxqtzMhUhnVOxRTTfeYf+u2Tx
         +sgYzk49AFaWuR20DB929SOrde+kBS2dvfzBGz/OvOy9XplVUhphEdUnyUCPMzQMNER9
         XPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716379479; x=1716984279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwVDi/8SRhVuR/ROIz62XO09PzGSpT74QeSqHhAGKNQ=;
        b=FbPOqFeLCGyh1lKNE6yMlFhzMN7Cf1o7slzQoC0Ps9Z3vcidMhG8O7BpV2OYqJr4U1
         9J1gi0X/ppbBMocvpEBnzihdeTgL6wlFx2rvWT3GRCeCoSDw/VZWmdDXZZqKeBYaJ31D
         YH5+uOCKRS5F32RoqMBP8ZFtAfxWkL5K8BE4DEXrDypStrSQ08pXDHdPRkrU850olQQR
         PSRGikJguCbkq/0p2rbXJHQWzKUtgzPt4L5Q43y2prixlGMI2YaIQnzKoVNhCxEKtfxz
         gST4j9Yzut47pfAiyNxDAotcBU5d0/l83W8083l4bHespzmWJaytM8X1F8q7xH+h3bad
         E/NA==
X-Forwarded-Encrypted: i=1; AJvYcCWOuiZvYVCNsy54tOZX5Kcuz3u+s2fuKxnsM3W1sfguzHLhrIfSO9n/JtrFf4g4+MEXMBg2UxUYLkrxA96J4iVuc9Ue9Jsedi0CELYJdmg=
X-Gm-Message-State: AOJu0YxW+b0LdYKOiwxzdISi5ZU6qXMdqBKFvHMW0yWqTY7PprlivMVu
	TyDxddEkOX2tuenZwP4vE2RttbXRz6gLMsJ4KqQ8MdRPCbYtSgQZUReGkBohQq3Feq1OlhCZjLt
	KtWpYEVZkBCBcr4E2+NqVfhlGCpQ=
X-Google-Smtp-Source: AGHT+IEXJRWjp7QtN/BAX5Hc+CkffG6+PUFVeJrjSgUO/NRzhFd/rUXq1/CKupZwlcpTVRb1p5kA8upror8e8bO69+w=
X-Received: by 2002:a25:4ec4:0:b0:dcf:c299:2467 with SMTP id
 3f1490d57ef6-df4e0a6e694mr1858941276.5.1716379479295; Wed, 22 May 2024
 05:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org> <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
 <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org> <D1FIPA4YAU84.M7Z9VMR4P739@kernel.org>
 <D1FJUW4RPWYR.38P76LESQMV4L@kernel.org>
In-Reply-To: <D1FJUW4RPWYR.38P76LESQMV4L@kernel.org>
From: Alex Gaynor <alex.gaynor@gmail.com>
Date: Wed, 22 May 2024 08:04:27 -0400
Message-ID: <CAFRnB2Vxez-i7Trxe-5ErAWGszVRt6MSvN7Ed-XOcSLVp8piRQ@mail.gmail.com>
Subject: Re: ASN.1
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

I'm one of the maintainers of https://crates.io/crates/asn1/. Based on
that experience, if you want to implement a DER encoder in Rust, I
think it'd make more sense to write the type-code in Rust, and then
expose symbols to C like `encode_rsa_pub_key`. This should be simpler,
but also more efficient (fewer allocations).

For what it's worth, rust-asn1 is _intended_ to be usable from the
kernel/embedded targets. It's no_std. It currently relies on alloc,
but I'd be happy to accept PRs to make it work with the kernel's
approach to fallible allocation (it currently does support fallible
allocation, but using the reserve APIs).

Alex

On Tue, May 21, 2024 at 2:55=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Tue May 21, 2024 at 9:01 PM EEST, Jarkko Sakkinen wrote:
> > On Tue May 21, 2024 at 6:20 PM EEST, Jarkko Sakkinen wrote:
> > > On Tue May 21, 2024 at 5:52 PM EEST, Miguel Ojeda wrote:
> > > In this case I could imagine loading ASN.1 blob by calling Rust
> > > functions. But yeah more like "immediate mode" API rather than "retai=
ned
> > > mode" style ;-)
> >
> > Hey, sorry I was mixing things a bit so let me clear this up!
> >
> > The decoder works as follows. There is a compiler, which generates
> > bytecode object linked to vmlinux and a header with symbol declaration.
> > Then there is a asn1_ber_decoder(), which runs the bytecode through a
> > trivial interpreter with e.g. a key blob as parameter.
> >
> > And this part is great and it does not really get in the way. All of
> > kernel uses it to parse ber/der/cer blobs in, and it is somewhat stable=
,
> > and super well tested. For decoder the value of Rust is not that great.
> >
> > Encoder (asn1_encoder.c) is just a set of basic functions, like one
> > function per tagged type to serialize that type. Most valuable asset
> > would be to replicate this set in Rust with better defined contraints
> > etc.
> >
> > Sorry for longish explanation, just wanted to clear up this story :-)
> > I.e encoder is higher value asset than the decoder as far as I'm
> > concerned, despite being much more trivial to implement.
>
> For the patch set I'm working on I do have good solution. I only need to
> encode this:
>
> RsaPubKey ::=3D SEQUENCE {
>         n INTEGER ({ rsa_get_n }),
>         e INTEGER ({ rsa_get_e })
> }
>
> And nice thing is that e is always 65537 and length of e is always 3
> i.e. {3} serialized so it is serialized as
>
>         static const u8 EXPONENT[5] =3D {0x02, 1, 0x01, 0x01, 0x01};
>
> Sequence and n can be expressed along the lines of
>
>         /* Last two bytes are filled with 16-bit big-endian length: */
>         u8 sequence[] =3D {0x30, 0x82, 0x00, 0x00};
>         u8 n_head[] =3D {0x02, 0x82, 0x00, 0x00};
>
> So I just copy stuff in order:
>
> 1. sequence
> 2. n_head
> 3. n (contents)
> 4. e
>
> And this is along the line what I'm actually going to do because it is
> stable for the use case. However, it would be nice that instead of such
> sudoku there would be super stable Rust functions to take care of
> writing these. This particular use case is sorted and I'll be fine, but
> these pop up from time to time in different situations.
>
> The problem with encoders I found for Rust from crates.io is that they
> are like too bounded to the type system of Rust by implementing
> conversion traits (From, Into etc.) available. Instead of this approach
> for it might be more feasible to have dummy functions with no mangling
> in the symbols like encode_sequence, encode_integer etc. You can always
> use these dummy global functions to implement those fancy traits and
> provide bridge for C at the same time and direct as possible access to
> the actual functionality.
>
> I think this is simple but very nice and usable pattern for bridging
> from C to Rust provided services.
>
> BR, Jarkko
>


--=20
All that is necessary for evil to succeed is for good people to do nothing.
