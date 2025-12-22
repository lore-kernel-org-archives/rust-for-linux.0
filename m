Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE602EC558
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 12:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766407458; cv=none; b=GoGjXAfJSOOoGCninEKOpPeXmWXSfaCDBrcvM6PYYHNCvo1sPgaC9UC58MSRlaySruBrTQepUL3dAUB1nVSHs6UxGVsxj/qtDJg0kbXCmInK/C+Llf/16m1W0z/iooTp3IXRyaU8Vt01yWvfGEiHH96acsI/VRVblaFoy7UlQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766407458; c=relaxed/simple;
	bh=YzMYLFwzXGrFaVcYRsUOgTd0YQUr6sWmXmb4dEyXtoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InWv6Gg7voZ0r1c0ezLVpOTU7atH/ms4vwjpgtBOFaY9maxyzHTAzsRYmfqSKi9mSprhUtgsQGPgBFFtThHZKN/t4jIlfAM1zrcuEYXQYu4uhIHCbe0oNdQtjbKHMdy5eKWKPcF0jCDmV6K9zH3Ocl0Lsyr24LEIG9Tq6ufgPak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeJlsERp; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeJlsERp"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-595819064cdso6304203e87.0
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 04:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766407455; x=1767012255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzMYLFwzXGrFaVcYRsUOgTd0YQUr6sWmXmb4dEyXtoc=;
        b=PeJlsERpl32kzj6S5YYi8w5TAJCZxp3uLzPXbBQadqGO+gRaGd5HZ6wFhqkcpDrwUQ
         n3sy4c5D/Tj+8lnT+UYmSERd7xPG9DX8kvot8rIkar7TAXcIIido8zxdIvDWfAPsNgmr
         f/02YrcULXl8ylrUuRsorV+ka3auaBqoSMKfSl85iHA23OEQRVzb8yK8GX4y3H8iiAHX
         vg6VG0tcCeK9Df7gvCbM18tzjRkax4nqJw3UkQqIVnfBpCDmLk7ZK72FsRe5iSujel5K
         6gh2pPUmVtJ3sVdBdLgwb+xgzThg3isig5PTJ2yOt6vC1jF5r9OGg95D/tRpC6k1VJnQ
         CNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766407455; x=1767012255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YzMYLFwzXGrFaVcYRsUOgTd0YQUr6sWmXmb4dEyXtoc=;
        b=AishXEhmInnccvr/6MYzduCi/41aYE1SQ1WpZ1juAIIsSUSx41zcnH7vqQ6715BPJq
         VaJtCCrN91Sn9JGQjuZKPvkmZlMByaORfIVGsAzy3/WurR+UG+jSMldCh9OpZ+yBkLjW
         r+kyFJlyn7MDNrbG5sYw0hZYg5FgA2gZvQRwa0vt8Zi1eTeLFclqAIZJo8Vu80e/jOHA
         U3ptA2CVbgjsqnQOEDnKsThu4OBPVRJ1IQtvLdWPXhz5Al7ZvJKhURon6fzD+gIxSE/P
         sWCJJg6R8ybfbDYxq26EUaj2s8uq7w5LfEyZJqIWYl/gwqbRPZfMn2Al8W7kurwJyV5G
         BAvw==
X-Forwarded-Encrypted: i=1; AJvYcCUAORSLHRuo/nEx5+AUTjMHiql7OAyIli670Kjehyfq6iLLWurOg8/ntOprwZnkBi1/acpGblZkpYVyc+cNyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+PPc1MALH/I23jjU4SqNshMe1KIpZBS2uKBf9spXReUKgQaW
	tFUUXeAWdQovKtntiXDxRhMp1eozlvhnmmhyaZCgvPzRwYX/EVj5ycbQfmPTHU27dotIuzLE55J
	+tYI6gZ+RB9OV/0bvk3rN2VaSq23R1HM=
X-Gm-Gg: AY/fxX7UUs8nuQSzRIisaiAEmc4bIbiQ+WchhLy4EqdurrMiUlOTPBr+6BI7dHBP45u
	zBwygqXbAmy1PpHSozBWdz9zp2DvXxaWj5kOt/tcWaHmLTy+JBMPe1GBhO1GtZJrQquOfS2LPK4
	t42or6WLV0ufkxA5kZ1552dvXRLQPVsU4YcOgBoS2SXa9U3XNbL9+rd2UR4kdDqAIx1N6/DyDxB
	DagUZUmit6d95g93VFsDsFPyBRTZfGx+zHMfChVLfFEd2I/KSEX+NKfW1EQHPns3y6miniOMglR
	g0ujCn/rxzwEK7LELdYr3c9GmlVJqntV3N8DyQvwtxjsGIImaU5+h/+oSTV9jSUHRNPzvZljpTD
	ILoWcD48=
X-Google-Smtp-Source: AGHT+IEXTeT/dVEEe6+fAfNNMyFuEy8oKrfoXeEeXyxNR9H3tYHxwTddXqP7uOwFLepQgh1UdC5ZwSi26fWxmhrhtRY=
X-Received: by 2002:a05:6512:220d:b0:59a:108a:c8bb with SMTP id
 2adb3069b0e04-59a126e5014mr4485725e87.12.1766407454924; Mon, 22 Dec 2025
 04:44:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319-pin-init-internal-quote-v1-1-19de6a33a257@gmail.com>
 <D8L34IUZGXWX.D2LSS2S2NAN7@proton.me> <CAJ-ks9nTmno12ZC4DnLxV_b0NLUK5Kn5K+cRi4BEvKtveQzJjg@mail.gmail.com>
 <D8L5JXRXHX0N.UIFZ5M15FB3S@proton.me> <CAJ-ks9mwNiJbr4MN5jfr7KCJc8j=B5=MUfX9XfhPg6yeRiFK=g@mail.gmail.com>
In-Reply-To: <CAJ-ks9mwNiJbr4MN5jfr7KCJc8j=B5=MUfX9XfhPg6yeRiFK=g@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 22 Dec 2025 13:43:38 +0100
X-Gm-Features: AQt7F2rWjvBnMUS-3l-QbEUEKjvUJeTxcawwQqfgYG9jlI0zJGpQjp1G-NPHl6Y
Message-ID: <CAJ-ks9n6wtA45+sJ2ZiL4KJ4MK0eaWomoDTN6d04oseJ-gmavw@mail.gmail.com>
Subject: Re: [PATCH] rust: pin_init_internal: fix rust-analyzer `mod quote`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 3:15=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Thu, Mar 20, 2025 at 10:10=E2=80=AFAM Benno Lossin <benno.lossin@proto=
n.me> wrote:
> >
> > On Thu Mar 20, 2025 at 2:31 PM CET, Tamir Duberstein wrote:
> > > On Thu, Mar 20, 2025 at 8:16=E2=80=AFAM Benno Lossin <benno.lossin@pr=
oton.me> wrote:
> > >> I'd rather not have this change, since this will introduce a danglin=
g
> > >> symlink upstream [1].
> > >>
> > >> [1]: https://github.com/rust-for-Linux/pin-init
> > >
> > > I agree it's aesthetically displeasing. I'm not aware of any
> > > alternative that fixes the development workflow of this crate in the
> > > kernel.
> >
> > I don't think it's too bad, and this code is going away soon-ish
> > anyways.
>
> What would Andreas say? :)
>
> I don't think the going away soon argument is relevant in this case -
> the same applies to the dangling symlink.

9 months later, this code is still here. What would make it go away?
