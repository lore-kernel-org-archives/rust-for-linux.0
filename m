Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1252702A6
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 23:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611838; cv=none; b=pE47WBNgvXIu66uFpCVo+uJUMoX0/jDKESPXE/SPCPGAuCBnIBSlBPw97GHrdKQbwj5gExN3/518wxlXosC3Q2s6fCSWXc4xoA1Dw+6bZwKWI7/czElg0Gy+xySEd06u6Jf85eyT9R/dJ/jgHYAJZ2/SpALB41muUXS20Pzmot8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611838; c=relaxed/simple;
	bh=XarU5AoRc1EC+DeSSkq4KJpi/IJAWCVURI1rN1QDT3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ribZxFx5hQUeozOMAkBRFxn85txGFSW4n/Q1jBZXe1iMwsgyPaJiqdCf+9Nz/mc/mFbEyxvSd1xI+ztJaLqQ2/ziIWqStYmavoBR954flWnvwNo02bBSSZ7IX5ufwGiMBOX2o7dUe/K4zZh0Ai/6DiGhpKo7e4lxnetqm+jgVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EpaYAVlM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EpaYAVlM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso373878a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 15:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740611834; x=1741216634; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IuzhV/0JqnZbj1q0brkRQlbfU2Wt+k1TRbEteuusQss=;
        b=EpaYAVlMfVI+nFCeZO/U1d0+vUb4XBi6aV0tZmEZbihu7VHX2oeAdFZjwqvQxuvzSH
         A9QQNrn0/FKOD1WcihsG87BUnDEj5CDtCSQEneL6sHOdignvTEnSxKS54abCuzzV2dWo
         D7qOTQkkD633dUY+N9euauqMOE2NNKIzy8PMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611834; x=1741216634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuzhV/0JqnZbj1q0brkRQlbfU2Wt+k1TRbEteuusQss=;
        b=vELw/ybVjQX1V6SuiQvBwNT+MswdnpUZes69c5Vd64gyz3z8inexsrP2qTbGIKoR53
         CXvsbiyTPhK/cZlVVr/2jN/jdP8P0hcgvnzDmlmRIBq+9x5ylbOco7FWglT9xi8KrTHd
         P2jbVVvYh8rqZQJh8PJsO2PcKddWSUtyz/Jx/1G2ioID8s6B5dZKHBUKw+WkwB7SlHnf
         ymroJS4eTHeCx5fCQU4HK8Iw7sPABnOdg4MqeH3CytxRx0H9E+SZbb7/YycyeVr8rUUx
         vrGYihfbB967H+VtJ61SnvZpG7knfkf+odrAJ/UgCBXKJFdSMjOvlHQqv0EoflJARpcN
         4LRA==
X-Forwarded-Encrypted: i=1; AJvYcCXawtMOY9eaUW3Py2xAfhS7CAAHEWASqc5yigCtbnH5mZRjpBe1bYkkLOSaFJEaPsTlxRuVUosHJxyM5QzPyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws3PiNaASvmU3ohhBVtGeM5SuxyGwOivHrQk3LK1gn3KsQagDV
	rDoMfXF1LrbDNE/aLZBnWGiX1+W0lM6eejFzH3lIBjLW7098msPyEYqhiLlxaonLsUPuUWyx1H/
	NxxqFZg==
X-Gm-Gg: ASbGnctwNfddP1o/cc51mVRk9kbQf50/jUdu9wp69/ooqEZBM+jBB7z3kCrQJ3Y8tU1
	teutwJRGS+T16cW7/o+lypIvi/Le1FjlJQ0cCmhpmu1OZAt9qd734cxqVpZwQBkrP3ptjeH17Bd
	rGWgTCc8slK6lolNAuB66nbx6oGudxwGlUgjApTSG6yhuDLrS4KziOfgsM8K2PIvQknFFC9g3hX
	VwqeLELGyNqQeWOBgUA0G9e7cWPmYcBUJdH56sycxrgB+zIeKY6lABYr4gS7wZI4tfnu5+lx6t5
	MnK65qq/yCCid3IPWIprLyTntSXM2NVzKUtZkeiKzKOmZ7uqj4LozKwIT9HZXwLRpIqwbVdogPK
	4
X-Google-Smtp-Source: AGHT+IGWuIqI/9krfAon3X3WiuLoDSUECEnHqSNzt00lmP9eyU/PLUKceA/VqbCzuPfyaf17nk+c8A==
X-Received: by 2002:a05:6402:4409:b0:5e0:8c55:504 with SMTP id 4fb4d7f45d1cf-5e0b70bf3a7mr24214010a12.7.1740611833935;
        Wed, 26 Feb 2025 15:17:13 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6cfdcsm174213a12.29.2025.02.26.15.17.11
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 15:17:13 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso45290666b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 15:17:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMAX9+8s8wgxDfqK776gh70MHAg1NK9PEoM4+ZCuD+kSbbE//nCUH8oUH6gD0V5dmaUCGRcAVlfNHwE1Y+2A==@vger.kernel.org
X-Received: by 2002:a17:907:7758:b0:abb:519e:d395 with SMTP id
 a640c23a62f3a-abc0d9da124mr1995246666b.20.1740611831430; Wed, 26 Feb 2025
 15:17:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com> <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
In-Reply-To: <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 15:16:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
X-Gm-Features: AQ5f1JoyIv-1_glEa7tZi4ZthcHRhGP_dyEjdVPws-Ir7Wz4fXVxNYINjV-KbP0
Message-ID: <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 14:27, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> This is another one that's entirely eliminated due to W^X references.

Are you saying rust cannot have global flags?

That seems unlikely. And broken if so.

> IOW: if you're writing code where rematerializing reads is even a
> _concern_ in Rust, then you had to drop to unsafe {} to do it - and your
> code is broken, and yes it will have UB.

If you need to drop to unsafe mode just to read a global flag that may
be set concurrently, you're doing something wrong as a language
designer.

And if your language then rematerializes reads, the language is shit.

Really.

             Linus
