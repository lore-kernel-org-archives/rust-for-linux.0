Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20CC320A04
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742557; cv=pass; b=iQS4OwbeRTDUQ3VMA3eGNT2l0U5z+wrNbXBtfvMJHLXlF//gdBUglD8HwGZqEpUIQi4Gd8kaJ5s+SK4si9t/kXg5n7/tBuvfzIVREckewygaLZg1b82juwPXYc6W6ryBe3ey6LfAhUE+pkoNAEKkuouBbmhLlr2X9vzJKGC8ODI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742557; c=relaxed/simple;
	bh=ZD0OTRZ+0yeUeztBzxx2j0HGa657QgP2cIsXhab59Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4cC+15Cn2u5ZKE5WAo4gByuqLD142gw6qXx4i1MJGdixF9GPD4T7oHwFEYsHvWTdW90F/BApdUJeYgwUyQGP15O96piiwzWw44aHAh8S6JM5LxFEWItk4n+dDC2jpjX3nzrzk5i22GSet+raE18+iy0IvidOBbUhhv17crPUaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnQmCaA2; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnQmCaA2"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-386914b8e81so232011fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 08:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770742555; cv=none;
        d=google.com; s=arc-20240605;
        b=FXSL1x9GOTW8fcoYZstG3T70fjCkCSCxGvZsQVqKUETmdTbVVCLRxmUE7UjLONfAnM
         65a0lifOUhCHSXYOoOq0KoSSV3h8btWK0X2ZBLYas4/UT/ZnyhXUVBXieZj9X4Gt7MUv
         lMMKwfu33Yc8PHgKwFUeQYfe/o3uTd05MrxPoRFKTyKBuu9Cd8Z3/dbGYhv4KyNgWuuY
         Afb2yklvVNL420tmITru+B0SDO9ZeA9gpTrS0Ys/GY03afzqVQ/rR5+P7xTW0GWPmubN
         Wxc5gdH5vQgcNQbVdlbZOl6M0dstvms5M+hjjyS1rIU9pSZ6jdgBlNi8Mkwj0Uww0NLm
         zIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fkE6wX1mSJ65eu9tW2JxtPMNM6UoIxgvLwNvwjU7SoE=;
        fh=Euyys/8AP7BIITUtd9XKgnM6sKxtGOLMOMN3wQhMc/o=;
        b=KE0GIqm5MevLBRKC13a9GaEsIOQnC6iob/ExRhiugKkfXU4GcneNSbcW2Td0C99iFg
         kL5UV2ZWNIZ1vX+iAecE82IJyg5WToI1YeupiEdXkXUKpA3yYF3UQwp/4vbayitd4rnR
         tSJbmC/dH/6CTL6+gJY59AIHQj9cJotj6r7bNR75u8VCupQl9vNv9Hb0K462FjVJwv4A
         9xJI++XayoveJx3xHuxZVMwJ6PLcZ32BsjOGX8Dc1HlFr0NI5/5k1rkQxA1K3oq67hHa
         cwDbZUqukrRDCZGxdAulSmYhZHf2KhQjLHngl6kj/omGzj622z20yOG4ij5lCb7hCqIT
         pw1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770742555; x=1771347355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkE6wX1mSJ65eu9tW2JxtPMNM6UoIxgvLwNvwjU7SoE=;
        b=XnQmCaA2NWgiGIEpE85eT+ed9uKPT+gjFSLncfY6h9+3iKlTqH8dmsm1EP4aKHNcrF
         MSxx8BqzPfbPez0UQ4iwoLpMkcBfmCtVgFm2YBm+1iSCiSAkYNSFGQOCz8BuQI8/wKOP
         j5MQesymeuvkCNhCDBlH+watpMcsueNkgg9tmlixF+NheA6DyF7r6zCC1j0la102/sBR
         oFSdo+0cCPBB2WTamlkqr+Uu0iNDlDp7NzYwNREmNhJlwt8KQwe4xmxqxfVC4IYgZIQ2
         v+Af+rY7xSVUJ1QB6r13C2JBRhJL1aK6IHgdORUm/axGaEa7iJ7MlhQr5PP6Bbssjuoi
         Ytew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770742555; x=1771347355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fkE6wX1mSJ65eu9tW2JxtPMNM6UoIxgvLwNvwjU7SoE=;
        b=s3xGzn+RMYzjGH/pRM89deGfSFFlzTQUP7j2PDHU1V+Zf9rMFNS4GXUVc2o6ZFNQkg
         1UVWendXCz80S6Ri8/vPxM8K7VAi0vjME4dlozxxOh9udzAdeIxeCoynpWybphjzP3pd
         f4mQUWEzSl+MF+mfu6e3b4i8G/Mk5e9Kvi0AqmLrT8m3gxGFgw28euIyWYcOrwbrurOn
         CjkzZEg3G7EQXAIBZYo3o3iPnR5Q2te9uLH4A62fSf5NmCKLVsPbTp9zuKhwNdHZinZj
         LLvVPMR7R0w374uSRvaEdz5YPcU6zcd63GPv209M/Y01cGdWh/l4+Eel5z8ivgsdFYzL
         MUrw==
X-Forwarded-Encrypted: i=1; AJvYcCVOO+xSS9kx/ej6TEGRpYWr537+B9pG7+DJSRlIf9XXIBR3jNEy1AMk7iQhGOtPNZ33BBylml0J3tGexWATDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB5DBcCfjYRLrD2P3AZ3IxGUKZNxGkocDq8S/xejNjVPrKQEi1
	ZZ5Vbq5YfAtsRoalTdn02zaTtczC0qmffhESp2juBTU1+pyxdcUS0EtFWVhtRC+BawnlrF5VhRR
	L4ec3j3FXm54lzIojYHD4PJexn2tgQHE=
X-Gm-Gg: AZuq6aLYeLo7XbItrM7W4x8yk+ceFE4DIKcGrZWt1rWwSzb75U1Q1ffwowv6K5L+jmg
	oMthekOEhtvh9AamE54ozCH4NNGKgLMQFgEiaWtrvRsqTRoK1iIeWrMda4VjjqZCsPFbUSmXM4R
	Jt9EVkHqr3poU7t2slPLFKDSF3Lk23F2gY+mZn92k/Wlltv9AXCrPr6F1vMk/fLmEN0hfsn+Vfe
	vRCmU8CVs55j7zoWyKoo9QAGdJk5yn5ZjzeAHsqb9ohiyAIRbtYnplp4eK5c6SBVShfv28wiDwn
	0tE4jzrqaLD+bE6xr3F8lO/23wLqCgkgSp/vxa74Lz61eQR2TvLrSyzxV+HchoBx2wRh9mqEVee
	DIGiK1CaGqf6fDvxUW4XB
X-Received: by 2002:a2e:a99c:0:b0:385:c15f:6bd with SMTP id
 38308e7fff4ca-386ee5df4afmr10380621fa.10.1770742554544; Tue, 10 Feb 2026
 08:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-2-f777c65b8ae2@kernel.org> <aYr-gyQN_AaIJkSH@macos>
In-Reply-To: <aYr-gyQN_AaIJkSH@macos>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 10 Feb 2026 11:55:17 -0500
X-Gm-Features: AZwV_Qj3n2_xEKJZHh_pbAQqJQF7fvAcEJlcOkIYSsdo9vdtJYW7WyHeI0xwRFg
Message-ID: <CAJ-ks9k5=jGFWRsTmHbsvzJF3YTYzbDTQ43-uUNe8gaZfsnc8w@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] rust: xarray: add debug format for `StoreError`
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 8:45=E2=80=AFAM Daniel Gomez <da.gomez@kernel.org> =
wrote:
>
> On 2026-02-09 15:38, Andreas Hindborg wrote:
> > Add a `Debug` implementation for `StoreError<T>` to enable better error
> > reporting and debugging. The implementation only displays the `error`
> > field and omits the `value` field, as `T` may not implement `Debug`.
> >
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> > Acked-by: Tamir Duberstein <tamird@gmail.com>
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> > ---
> >  rust/kernel/xarray.rs | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> > index 88625c9abf4ef..d9762c6bef19c 100644
> > --- a/rust/kernel/xarray.rs
> > +++ b/rust/kernel/xarray.rs
> > @@ -193,6 +193,14 @@ pub struct StoreError<T> {
> >      pub value: T,
> >  }
> >
> > +impl<T> core::fmt::Debug for StoreError<T> {
> > +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Resu=
lt {
> > +        f.debug_struct("StoreError")
> > +            .field("error", &self.error)
> > +            .finish()
> > +    }
> > +}
> > +
>
> Is there any best practice for when to include use core::fmt::*, so you c=
an
> avoid being verbose here?
>
> I see other cases like this, but I couldn't find anything in the code
> guidelines.

It would probably be better to use kernel::fmt::* rather than
core::fmt so that we can interpose our own trait in the future, if we
want.
