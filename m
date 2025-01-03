Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149721F9ED5;
	Fri,  3 Jan 2025 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903343; cv=none; b=LMWgzWeMN4+gMrwFu77VDsQucUw6rFAOY/4BiD/rfL/MkP2hVW8KSoWfTCUpZoZJAS6GgYhNfNI25ywOqKZXi7usxFc0xoeoR5G/yHP+fQDHVKDZ+hSpUUDXPdxhNmbPuuc5S3Ds8TYukAXX8EgMcAJ6CreXpnV69k76cp9O56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903343; c=relaxed/simple;
	bh=Htc8kaHqsahCUvMnZxGcNdpXp9Xx1AAR9B2ePBslPEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P21W/6gRJr7AexXogZSsg4my+6fBw4rW1sbTn7DptO5Wockrn3x1xjzWaSE1Tn8vOjIdqzHqpZoXrgK31oTWHb5x9tRYe7wAcQzXGFZCPKDsde7eAQnj8CBKQyLY2NoiLpWlRLaVgICUo596ejHEEgErQ+9Xa1bmyNpJlbsCcZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nf+Sqpnh; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nf+Sqpnh"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afe2a1849bso7041261137.3;
        Fri, 03 Jan 2025 03:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735903340; x=1736508140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Htc8kaHqsahCUvMnZxGcNdpXp9Xx1AAR9B2ePBslPEQ=;
        b=Nf+SqpnhODt82CwFPpAjTAYZVPysLfJjfPMmb11FjF71pgEWteoRtArdEzXRxURdGM
         jqBI2nuolb/Cygj9bLt3UwJyQ9alq0ajoBuS0qq0q30nWENMp0YjNAk5dEuLaWG4ZCHi
         UPLa2RG8xJgWAKxyMKn9yTU+j/dvQLk0rPaZAEmKoZlotB/Lm8lgkQId2C719y2w30Bq
         n9nigThklEZMTSj64W3YB/+++ZGxUoMN/juhdLgmio/aBO//NFmPbSLTyr8rwG7ksfWg
         fDkVa4FRDsCX89dK9TsZe8kvo0f9FRF2Dn3hzgaHVJOQXNdD+p/uKmPWm3eKHyCFDnKu
         pC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735903340; x=1736508140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Htc8kaHqsahCUvMnZxGcNdpXp9Xx1AAR9B2ePBslPEQ=;
        b=AeCZZBPVcVB19odLh4mjryrQbQYCxnoEb7JEhnk/Cp0qLFAEaoPL8ohF+uUVc0fQeI
         EPsS/twAYtssg9INzlsxWUU7nX1TI1geCyLoUgCP+vPQVTVdJqOmwqqZapsiTyw4xAdB
         GKfIMIMPY8RC/q7X61663m3Fl6xwcy6tzVjWiDYOYAiY+yljGD57xcaKXHjGkpiZOzib
         sqR8MYejaUVG/tMw8Vqqz0lKi5vGHn7vYwSyof9fHUERhnMpr02yrCpxgQ4LUJjKOEi5
         QMB43PKgkDzLh6I6iPPEV5/HhZzAvoZwo5VUCErm3Uh5cOTTr1xwNnBjmUttY+sZIA9x
         jtsg==
X-Forwarded-Encrypted: i=1; AJvYcCUrpc8aeCZuzy+YAhjlwHUHWe/y9uQTmebS7HPFTXV58nvdz3M8G6Fj3aiTQ38KIpYHyJ2+tJnQgiwnx8c=@vger.kernel.org, AJvYcCXDwpWwelNkEPlT7JcytrMzffGxL1RLKc/IzzRzMlo8zp2sw/2QUJX9UsIgkZH5i8RSUy9PnTGrs6IOryCn8Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbmli1AAf138C7lGE/sH2YwUn1sl5ODwtp6JuDnDnTNFq+iBA
	cRlO4GBZ33uEMxT7D6Edco+ae74pHMgBHs+t7u/x5qaid6wvf/6xSmbHtPiAOOlKLe2KcjhSm/w
	vpP6Fwai02Ar4yF17cy0BRj5pnGE=
X-Gm-Gg: ASbGnctSHVs23D3Ks7cOZMQAu4r5wwlp7EkAheumdsOn+iSDOHSuIOXd1F1/kYVfwLk
	lvyV8IbsK8rucEQQamFXioyYKQgKHHFiOYGhQX68x6NAQfO90llqLHt3KYMNubi7YeFeI
X-Google-Smtp-Source: AGHT+IG3q06LSjroXo6xYdmlM3d0zEmeobn9gTU0s95xIyC0QJgZKJf5zi6fL3/+RRdhpJOrpKqxmBPnzmZsyepOy78=
X-Received: by 2002:a05:6102:26c8:b0:4b1:16f8:efcb with SMTP id
 ada2fe7eead31-4b2cc44cb38mr40873791137.17.1735903339891; Fri, 03 Jan 2025
 03:22:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <yZdXTg82eCLGHsaNBfAwwYZTGa63yzxI2YXoaTndUyJzyVN60hPrWoeQoXdrrh2hnRIeugFXvrb3nbq2bpD6Ag==@protonmail.internalid>
 <20241114005631.818440-1-alistair@alistair23.me> <871pynfv5f.fsf@kernel.org>
 <mgdEr5XBxS-KNBtmRIKsQX4z2uZyhJMYQdRJHIOTpxH7v7Vmt88bfy2EYd8-omqRNgT7lbDMIbEtpwlVJH12Ww==@protonmail.internalid>
 <CAKmqyKN7dP=UFjP0c88wq_FMgaFzPU+5GRDz=X6H-fkc1v1Hpg@mail.gmail.com>
 <87jzbxmij3.fsf@kernel.org> <CAKmqyKOoM5+8ypFSG-mt+ixkhBGVdxjkCrHjP+=Zs5s-GeB_pQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOoM5+8ypFSG-mt+ixkhBGVdxjkCrHjP+=Zs5s-GeB_pQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Jan 2025 21:21:53 +1000
Message-ID: <CAKmqyKNteaaXWCt2WR_YOzFvWRFhkfZvnv+4vjkyo3qESL8SYQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] rust: bindings: Auto-generate inline static functions
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alistair Francis <alistair@alistair23.me>, linux-kernel@vger.kernel.org, 
	benno.lossin@proton.me, boqun.feng@gmail.com, me@kloenk.dev, 
	alex.gaynor@gmail.com, gary@garyguo.net, aliceryhl@google.com, 
	alistair.francis@wdc.com, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 12:55=E2=80=AFPM Alistair Francis <alistair23@gmail=
.com> wrote:
>
> On Wed, Dec 18, 2024 at 7:45=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
> >
> > "Alistair Francis" <alistair23@gmail.com> writes:
> >
> > > On Wed, Dec 4, 2024 at 11:14=E2=80=AFPM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
> > >>
> > >>
> > >> Hi Alistair,
> > >>
> > >> "Alistair Francis" <alistair@alistair23.me> writes:
> > >> >
> > >> > This series adds support for bindgen generating wrappers for inlin=
e statics and
> > >> > then converts the existing helper functions to this new method. Th=
is doesn't
> > >> > work for C macros, so we can't reamove all of the helper functions=
, but we
> > >> > can remove most.
> > >>
> > >> Are you aware of the helper LTO patches by Gary [1]? Can you tell if
> > >
> > > I was not, but that's exciting to see
> > >
> > >> this series will compose with the LTO patches?
> > >
> > > I think it will still work, although it might take some extra effort.
> > >
> > > I assume my series isn't going to be accepted though, so I'm not goin=
g
> > > to try and get the LTO series to work on top of it. It's a lot of wor=
k
> > > to rebase this series as every new binding causes a conflict and it
> > > seems to have stalled
> >
> > I would assume that it _will_ be merged in some form. Why not? It's jus=
t
> > a matter of getting it reviewed and making sure that it is going to wor=
k
> > with the LTO inlining.

I have my patches building with the LTO inlining work. The kernel
still boots and it seems like the inlining is working

You can see it here if you are interested in testing:
https://github.com/alistair23/linux/commit/e6b847324b4f5e904e007c0e288c88d2=
483928a8

Alistair
