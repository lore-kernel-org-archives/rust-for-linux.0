Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2D3382FB
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433193; cv=pass; b=mrlNne3mAPIW6stoodV6t2NC2p34yrrxaceZI3t+nuF13TTeIxwrjPFY9r3+a05kz/4roRJuDxybPuKJS99d4ZqXhQSeNBLahgR4IrJCskyPyD3DwAf8k7n4whMtZnEBk9ERlcge6mnV6fRXzXQiywnbPUJ15ahyg9ZWchtmVDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433193; c=relaxed/simple;
	bh=EJK2lCVsN11osTyh2tALoONR03SwlouN4UIKYzzTW2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTYGpzrumL92QTLdshFv6LSvN0E2S6UrYTHNWAYi7E71A4E22mAuoZkoXfTsOsFrWmG006M/+QWQPh1ak8bCqL4d7OuEyP/R6yx2m4mooWhqnV0iBlNyU2kHPA04q/PMDy6BsP81drUeJcIFcOAPdwe4pWljIzFQ1/9GIv3VCug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFaGeBdj; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFaGeBdj"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94130b88642so3699090241.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769433191; cv=none;
        d=google.com; s=arc-20240605;
        b=AHzIv2Mm6B8iBfzlBuXa7pp2R37uVVoLj3/ymqIYEBYzS453+QF2jWcTLT9aw/WZPS
         Rrij64yPXRoG/Rr3jo6qXSQDljOST3nYcYG3ggfotesFz6kuUqfl1ez55KjiJG6I7nlv
         YmkK8um+uFpLxfzlc5jfYC0M/hjEo9+ehefTbqdfE4oA3oRTmGT3TlbTvNA4ba8U6A/i
         GuDPV5dGFbBGsVBRudQQ/ILRR2fjq50IFex5j8/8/7Y1C4s2BNKBvoCok+rhHDwch7iD
         3cpp9CKrGjXghpCTe1Imqujyv8sS5xhLQnUnVd61ymAzSQrLEIBxrPOCPc8CgWTojPdG
         tJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hts1VbXSAhfHqgvmmsaKIeglK0db4+EFOEtENA3B/W8=;
        fh=R5eQofyOJn255aMxvCA4kxi5kJO9wc6QC/lRtvYd9ag=;
        b=TCBc2FDZZ5CaRk3HZeH1R8GZKFs2L58IXUUXDLQp4UlbhICw9c2Dz8e5eolu81Opjn
         jWSi6B88qj0iYrcrAGYhhe0e5dkiNd5Sx5hvu9EYI30f+EeeypwdgeRhqyKZj4RKgxZ0
         weKZz162PZHUGSnoVwgB5nveX3bi7Aih8vPd2rwB4GPA8p6LZnzHJOQ7rk/mIVlQVuV0
         rfs78OodMjqpT41NR/BGYSnT608RxQf7uNf+3RKUjfPFVE85Q3FQXNEe48YcSJDeeVoP
         nNWpkqTgrwGRcahg2hP+/M1nl7meNR05MvhigTyHgp5cNBdjA+Inwx9GlQBFZ9EALhrm
         H30g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769433191; x=1770037991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hts1VbXSAhfHqgvmmsaKIeglK0db4+EFOEtENA3B/W8=;
        b=bFaGeBdjRwwGrmcS2jAwNkauWfEwi/IcMqctSL9T/kKU7jnZnImnjunCR5cuMAmE8M
         lPYCGnwt3/s9xbwkF/kojHDzoNgKPHArJ6Dt+PlPX79k7FXIKQMUik7NM/VjVXy/XuPD
         aQeqZz59fLK6+35cmK4bxyjuz6seViU3FPXGPUsjj71BBLNds2XxknfsMOWJZk9h8x/P
         LeMjRsCObvrBxbV0wp5pF3uHdpJOFP6K8CCWVwkZrn4onXLeQm68qR5dYfJaUIgsvoAd
         NNSeyRLdEynL9JE0YPI3kcE04nyaJKuM+OY3POEtbQCrO6VmPQbcDH0iwhio7om6DcWE
         XW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769433191; x=1770037991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hts1VbXSAhfHqgvmmsaKIeglK0db4+EFOEtENA3B/W8=;
        b=taApicQjK3+7GvtqUi+xqRHICpbyXM4PYzK7mhQ6uoFuU1dLW5WC5Uq+Bg7pjJFIPg
         hV02WyUcmXAbRlH+jSh6+E7eotdz0Uu6h58BXq8kVEfTqdWxrUS4avJT80b0lZTnVNTi
         ztE1VK2KD3c95ASk+zOzOvMFIDjKTNOi8/6sEv+38+qvYMwzxdnZY0tkJZxI0oNKsSJg
         pd4mu78GgjRLpr6gO/nCumrAVTXQ7tMiPKKbVQwKkVgdvHPqGiy9/nv22xi16F6VZ/yt
         YkSiyZXooVP1BJKBIVuZ0wBZmIO3l8JcCx7wDOq8sRzwVjqW4DsHE5g0rVWbieBSc/bu
         tJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCWoA54/V95GJfSnGY4n4IzZ2OVYqbOd4hut+OIdKadT56mx+05GdfrbOtbzBkrYrxKOwoYX9xaOBzL1Kdjyyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRddl/ZmpqQIPH6UqcZbexxwDk1pPXN+S0wiX5t+B/+KRqUD9s
	wsrdRXQ3vf2i1+Arkf2bIhJXfxOcsu5GcgRJYqZ2mYTnjEIJifn5GVZ+S5sGWILe4Aqp3ooozGD
	hhibN1GFvtN8U1o1JEjMwDWXCawPJtYY=
X-Gm-Gg: AZuq6aKTXnXHyujZqYQ7q8Vy99m6XITSwHtAUHEf0uwRpVM5AT7CcPMGnlkwE+e27Du
	ynar3jjaQkuleLzADDRl0tnOy7ShFT94hCCvrB/vFVG8+U+9eP3lkI2gOpnKBRJxXb3SYYGiW1x
	0gzh8xgXs6bc7/J+RGwLD9TX9vBIM5c2EoRNJY4vFBaYPV8jorAR+zjaoNtNw5H0EvXZpoXHNjL
	j8K/CsdptoUtjBvo6HGbN5hcozYQz0E/zVjzqqAZwZ5GsQBhQ/6tiuwElWzn6HMnauKBcf6yCW0
	SA+b/yb82tlC3IlQgHZ28ViZK3fsE9C6Qo07744WL59knOIW5v3Be6XpiLyVD13ZL6ti3AMEfYL
	5eXwazAuMk8mX
X-Received: by 2002:a05:6102:2920:b0:5f5:2ab7:cefc with SMTP id
 ada2fe7eead31-5f576514c47mr1439180137.41.1769433191081; Mon, 26 Jan 2026
 05:13:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com> <2026012652-case-subsector-f671@gregkh>
In-Reply-To: <2026012652-case-subsector-f671@gregkh>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Mon, 26 Jan 2026 22:13:00 +0900
X-Gm-Features: AZwV_QgQ1Z3Rd4KQ7Rp2euLnZfmQXxco4CcOfImenRlQsmjEQKSEWlE9Ob9sZIc
Message-ID: <CAGAB667vN1jR4UX4iw_sDHCMWLOfrbVKop-f7FXy7UTH_fpCuA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] rust: tty: introduce TTY subsystem abstractions
 and rttyprintk
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 1=EC=9B=94 26=EC=9D=BC (=EC=9B=94) PM 9:48, Greg Kroah-Hartma=
n <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Jan 26, 2026 at 12:22:07PM +0000, SeungJong Ha via B4 Relay wrote=
:
> > Hello,
> >
> > This RFC patch series introduces Rust abstractions for the
> > TTY subsystem and implements a sample driver, rttyprintk.
> >
> > Currently, TTY abstractions are missing in the
> > Rust for Linux implementation. This series aims to fill that gap.
> >
> > It consists of two main parts:
> > - Rust TTY abstractions
>
> What type of new tty driver are you writing that you need these
> bindings?  The need for new tty drivers is quite low based on the lack
> of new ones being added to the tree anymore.  Are you sure you just
> don't want a serial port driver instead?
>

To answer your question directly: I do not have a plan to implement a speci=
fic
serial port driver at this moment.
My motivation for this patch series was simply to fill the missing TTY subs=
ystem
gap in the Rust for Linux project. I believed that providing these abstract=
ions
would be valuable as foundational infrastructure, enabling future developer=
s to
write TTY-related drivers in Rust.

> > - The rttyprintk driver
> > rttyprintk serves as the first example of a Rust TTY driver.
> > I chose to port ttyprintk because its simplicity makes it and
> > ideal candidate for validating the new abstractions and demonstrating
> > their usage.
>
> I would want to see a real need for this before going any further.  It's
> great that you created these bindings, but without a need, I don't see
> why this should even be reviewed.
>
> thanks,
>
> greg k-h

I understand your concern about adding code without a "real need" or an
active user in the tree.

If you believe that these abstractions are premature or unnecessary without
a concrete driver implementation to back them up, I fully accept that decis=
ion.
In that case, I am content with leaving this work as a reference implementa=
tion
for those who might be interested in the future.

Thanks,

SeungJong Ha
