Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFC92594BC;
	Fri, 20 Dec 2024 02:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734663341; cv=none; b=S+E/W2kR5z86cEnoDPx2cT60rvU5+vcM7j7gsmRnL4ZENXps/272KtzAHT3aCz5jthJlRFQw74al7cnLtNUO8YTcg/Rf9+fQin/ylm1wC16FPl9VSyV9QQIcs1uYUG5857IlwutXXCJgx0rmxa3kg1Sr0+ARnBuUjgvi8sSHEfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734663341; c=relaxed/simple;
	bh=1g46ON9utGxiFtWFw44M5qqPQLTshggFSK1dNqukZ3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fL+99r/kFX6eYH4QRHQPdDR2hyqDVjx4qZoCNDjU/V0hn3i22ADxvbr+uBhDB1xeOZrezge3OYc06/sNTYSL7zdG6wK8ntfSGExiOUyBulQPZnLdpA+rPj+Xt8SJnLfST8DNKLataLQoZdJOjU09aqyq4EdsvOlLKthlTvlxaqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcLrtTdY; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcLrtTdY"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-518802a1e7eso798591e0c.3;
        Thu, 19 Dec 2024 18:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734663339; x=1735268139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3ZeZnd84tlgKzDbvZyi8X2pe1TN7v0KjS2MbM1e6rI=;
        b=FcLrtTdY7WcTkYNazht+Kkd3oBmNZl8pdMttgPASd0Y+aNgnPmgx+K3tFZVM8YibiT
         vku7g6IPV99T0eB2179LiIGbzOlGVCHH4P6KkV2ODepe9jh+4yKcy/2sZENyd1h9Wynn
         f0gEclkfiX98wnmeBAyjURyqZfpw3Qb22nxJPwyxXjMVWuAhiFo8+Swl1385giELlDU4
         pzyKvLAILYjlU5ZMZdS3X+W0PCQrhVwpLDJGD8mXx6NoDf35CTOD8Ozlg/3ISpmYsHkj
         crzYEdX+M09dH90hJTyuwVt8LDFUZrZ/5f2cgONGvROQg2k4U+9e78CHKD7ts966IEQ3
         F28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734663339; x=1735268139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3ZeZnd84tlgKzDbvZyi8X2pe1TN7v0KjS2MbM1e6rI=;
        b=OLVmdQTolh6qo+S7SEPADJMRlhw9uKuBpBAYgW27hVRR4O7atZz6AilvCGRFL5VUM5
         DrFg2+pcQsESYYcSPaKB1qCP8q7u1o4W7ggi8PZ0wC37akNfE54InScp7D3MleyNvhvt
         3uKWeNDXSeZvfVF1GR2L3pmVqldy2A5dum3KTRPVa19KJiZ5OnR2vAp/1d3AhG6zfSXX
         Zk4Hc1vhGN3uEZ0Lfq2naRxh4EEm71/B2jTEdYlma1NRmpmxYKnPKu/tKtVqtajyJ0T9
         1Ttt3xiZzB4cI6aDx+c11sCPYX+wiNePgzOvKw49GLcnYTmzQ5QC6tyEZtxMe9PiPlj+
         nMaA==
X-Forwarded-Encrypted: i=1; AJvYcCWf4YZFio2jtc4LR+bxwNlrlU3EhwdYnkQWdohXahwrLH5ZDPIlEPDm1jqOE8kJCOxQZtK6Da4SlRHmNYi/W3E=@vger.kernel.org, AJvYcCXopKZygnf8R45X6HLPGfKwoDP50ZIq893weCZ8/G6S3T4yDjPsaMSVyFJ6uoG8HsS2ykkBa016kVuRf70=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvZiltKOUQAiTEWS2IQeUWk7OOwO+miTSggcgAz7O3jr89u41Z
	797K3xwgu8B/2pera2ctkOvv+J8935TummsqjhUue28mY08LkNIb07btUVYOSf3ocInDpnIj0QX
	d7RD3rIz0wtNi0HBVPUGI2CB0Mao=
X-Gm-Gg: ASbGncvauIejzztxW2KSG5a0HypLpoEZ8Iw3D4uykf6c3P64f7OTzdkGS8XzaD8UJPO
	wkzlNQSr73WXldXUzwEMCzhoZdB/1jRtAQ/LWZRmpB1lIE1RVYNLWU0UpniLvvPV4TU3/
X-Google-Smtp-Source: AGHT+IFyLLTNpn+yMHo/B2LS1n0SMFPBmCgEi5F7G1SMYrF7lqu1Cvr4Zr3hmYvztH6tjz6Whz5iU1BI6P3nUeog+gM=
X-Received: by 2002:a05:6122:3209:b0:515:daa7:ed0b with SMTP id
 71dfb90a1353d-51b75ac3e35mr1462480e0c.0.1734663339024; Thu, 19 Dec 2024
 18:55:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <yZdXTg82eCLGHsaNBfAwwYZTGa63yzxI2YXoaTndUyJzyVN60hPrWoeQoXdrrh2hnRIeugFXvrb3nbq2bpD6Ag==@protonmail.internalid>
 <20241114005631.818440-1-alistair@alistair23.me> <871pynfv5f.fsf@kernel.org>
 <mgdEr5XBxS-KNBtmRIKsQX4z2uZyhJMYQdRJHIOTpxH7v7Vmt88bfy2EYd8-omqRNgT7lbDMIbEtpwlVJH12Ww==@protonmail.internalid>
 <CAKmqyKN7dP=UFjP0c88wq_FMgaFzPU+5GRDz=X6H-fkc1v1Hpg@mail.gmail.com> <87jzbxmij3.fsf@kernel.org>
In-Reply-To: <87jzbxmij3.fsf@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Dec 2024 12:55:13 +1000
Message-ID: <CAKmqyKOoM5+8ypFSG-mt+ixkhBGVdxjkCrHjP+=Zs5s-GeB_pQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] rust: bindings: Auto-generate inline static functions
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alistair Francis <alistair@alistair23.me>, linux-kernel@vger.kernel.org, 
	benno.lossin@proton.me, boqun.feng@gmail.com, me@kloenk.dev, 
	alex.gaynor@gmail.com, gary@garyguo.net, aliceryhl@google.com, 
	alistair.francis@wdc.com, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 7:45=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alistair Francis" <alistair23@gmail.com> writes:
>
> > On Wed, Dec 4, 2024 at 11:14=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >>
> >> Hi Alistair,
> >>
> >> "Alistair Francis" <alistair@alistair23.me> writes:
> >> >
> >> > This series adds support for bindgen generating wrappers for inline =
statics and
> >> > then converts the existing helper functions to this new method. This=
 doesn't
> >> > work for C macros, so we can't reamove all of the helper functions, =
but we
> >> > can remove most.
> >>
> >> Are you aware of the helper LTO patches by Gary [1]? Can you tell if
> >
> > I was not, but that's exciting to see
> >
> >> this series will compose with the LTO patches?
> >
> > I think it will still work, although it might take some extra effort.
> >
> > I assume my series isn't going to be accepted though, so I'm not going
> > to try and get the LTO series to work on top of it. It's a lot of work
> > to rebase this series as every new binding causes a conflict and it
> > seems to have stalled
>
> I would assume that it _will_ be merged in some form. Why not? It's just
> a matter of getting it reviewed and making sure that it is going to work
> with the LTO inlining.

Ah, I just haven't heard a lot of feedback, which seems like there
isn't interest in this.

I tried to apply the LTO patches, but I do see build failures, I get
errors like this:

ld.lld: error: duplicate symbol: RUST_CONST_HELPER_ARCH_SLAB_MINALIGN
>>> defined at llvm-link
>>>            rust/kernel.o:(RUST_CONST_HELPER_ARCH_SLAB_MINALIGN) in arch=
ive vmlinux.a
>>> defined at llvm-link
>>>            drivers/b

It seems like all of the const's in rust/bindings/bindings_helper.h
are failing to link, but I'm not sure why

Alistair

>
> The less boiler plate code we have to write by hand, the better!
>
>
> Best regards,
> Andreas Hindborg
>
>
>
