Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C3227FD59
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767727818; cv=none; b=Ltr5lTkOaGcEdHgrYqoMKZMBT2wZOh2CiqNJY7W3mqVIgLMtt49jGwbWNl94zTjlth9XG4NMlSu2XgFoLNbHI9lhgfQftEA6uXlkdRH7ytiNQMzdMpYcfvs6GCPwmK9/r6s4w9THZkfiC6y8SKhAePLN7higrf+nE+yxZZlMa1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767727818; c=relaxed/simple;
	bh=6PEsWTJf0Vop6Q+1C1+DQ9N0VfM6GSa6BS4JsqEp9/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tszPQH+EWHUyJ1dfnf+0bMRGGsiAK3zew14BCjzTgiTQ0GLGfCiyRIhvNZKaSitQ98uiS58GP8tdD00aCC++1jFd6bR2nTdCxLFVUaXGhixFM2y5gO/ecwIXwCUQm28JuEI4SsJlSEqk2NIXebPRq5BANEoxWKGVeqiHVKXU64k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXhRQfOy; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXhRQfOy"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3e7f68df436so113947fac.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 11:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767727815; x=1768332615; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ovwe6jVk+HZeAM9NHqCv6Ojkd+cynp9coM0xfvK8awk=;
        b=BXhRQfOylGTfPBHj4tgZEL6jTu3rKpt1axeH70JrZ3gXvAK4mSijwkje2j9VVUA93g
         5drr12eIRL3u56hrlYGtex6eS1tuKvseklcEssjC9u+SGjujL53jd1uheUlPc4hHmSit
         mNZXJ66sZztxrIYp5yUtjTx96ghOfW+Divv8i7a3vyZp2fBjoHnO93ud2ybor71A95cj
         xxsb49meuyrdjPUD7VrUoGJXqJ2fn3SpLvtHHZkGqQhXawS8AULJFcxft2cf/dgj9hjQ
         T31VZXTg3WRYTo4dkMK5G+52Q6rS6lWUsahq4k1zhVxzKUXDkeWhIqXGSykQYFON1rtz
         QVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727815; x=1768332615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovwe6jVk+HZeAM9NHqCv6Ojkd+cynp9coM0xfvK8awk=;
        b=PRKNyKxjPZ75UVkrp83TFixu9EUaO6g3LUYWN2B6fpiEdrzw4RlbrHQz2P8qTKJK5Q
         Y7hfahOYtwFeT7BTyWQGrQYbE9evW7PY7eJoJPXuChZMPDMoUrz3eQUaK048xT7aeG6Q
         BhL0C/WQbuMvRnlbGhM52T8DMWAknxsEkGICJvwo6BiY3GKuliUmj/FDbfUQbuH/I5NS
         AyCxVxWDFz+q596Wo8sgWDoqswWZasQ//2suDsPqwoJfFx4kap+OBxtlIFKRXOIlsHds
         WHDQcgPa4uLbgbfAc0BNspD/77M5c8kXrCLVETokb11Y7h4MpZ2OM6G7dldgnE5PT7/o
         6t3w==
X-Forwarded-Encrypted: i=1; AJvYcCXTFvDdWZp9AEEyt3FI2UGWPYWRd+vIN83mW+zecEZzoVxqFKc6YIVY5vcy8YcDi/bBgcOzjke4j74bn4YKXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ7/rEJLR6YKzXHt93tKty2mtIAlWJNvjcvjwjHjjuJvXENlo5
	5tKDbMT019Npgtd83xkVuVYyIZsKMUdIzIfCk3vFG9G4WRvhDYfvjdi2FS0c9Q==
X-Gm-Gg: AY/fxX5+Z/DZd/SKLeAe2Wc9CZz1TKEjw2a8x8QZjTriAJ7LiCoGIVp9tSck4jNZMeO
	Z3v7xDT2Mx62nzDceXCfCA4MuaQK/zBY96hKaLETdVNTXScBpl2W89E66i5cZCDkdLlVpPjBlGg
	f5hmhrXl2GEcmn7F6icdqV9/WWI3vSBthn+bldLKsKPIfrEctTjzixWTyGEL1qncwvKj84Zsw7n
	O7MxMtMmAKQGkW96yxj5oDccokjOhdDMJicJfehfOdm7sfn19whbKelY2YmnLXA+Y0UMOucc+hd
	ijWE1wzqz/Y3O1BgANh0Xp3G2yu0qCWI9gPoWrzAZE/0HDmUeRTIy+nVoXVr1qh0UaW0vMymsKa
	2BS6swPjY9q2e3NwJSX60zraXNgtQqJmaFxy9U938MA7C8pIGhldMi2DNauqHGQQ8SmL9gtxIf7
	ML3IQA49o=
X-Google-Smtp-Source: AGHT+IEbARtwYBCflrCWKTw53xNWRQrwwKMztLSlcqOR+PG0C4vOryHl1746rHcmK2MtQJpFKJixLQ==
X-Received: by 2002:a05:690c:ed5:b0:787:a126:5619 with SMTP id 00721157ae682-790a962f54emr28940977b3.11.1767721117146;
        Tue, 06 Jan 2026 09:38:37 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:6398:4432:5113:2b75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790ae603282sm5749857b3.13.2026.01.06.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:38:36 -0800 (PST)
Date: Tue, 6 Jan 2026 12:38:36 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Burak Emir <bqe@google.com>, Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] rust: bitops: fix missing _find_* functions on 32-bit
 ARM
Message-ID: <aV1InE2bnTLYnMAC@yury>
References: <20260105-bitops-find-helper-v2-1-ae70b4fc9ecc@google.com>
 <aVvu3zF2rYKR3XC0@yury>
 <CAH5fLgjtXHH40Pcw=ZoOKPzvJzDA8fohNtC6W6DsfkcE-6vtrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjtXHH40Pcw=ZoOKPzvJzDA8fohNtC6W6DsfkcE-6vtrQ@mail.gmail.com>

On Tue, Jan 06, 2026 at 10:03:10AM +0100, Alice Ryhl wrote:
> On Mon, Jan 5, 2026 at 6:03 PM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > On Mon, Jan 05, 2026 at 10:44:06AM +0000, Alice Ryhl wrote:
> > > atus: O
> > > Content-Length: 4697
> > > Lines: 121
> > >
> > > On 32-bit ARM, you may encounter linker errors such as this one:
> > >
> > >       ld.lld: error: undefined symbol: _find_next_zero_bit
> > >       >>> referenced by rust_binder_main.43196037ba7bcee1-cgu.0
> > >       >>>               drivers/android/binder/rust_binder_main.o:(<rust_binder_main::process::Process>::insert_or_update_handle) in archive vmlinux.a
> > >       >>> referenced by rust_binder_main.43196037ba7bcee1-cgu.0
> > >       >>>               drivers/android/binder/rust_binder_main.o:(<rust_binder_main::process::Process>::insert_or_update_handle) in archive vmlinux.a
> > >
> > > This error occurs because even though the functions are declared by
> > > include/linux/find.h, the definition is #ifdef'd out on 32-bit ARM. This
> > > is because arch/arm/include/asm/bitops.h contains:
> > >
> > >       #define find_first_zero_bit(p,sz)       _find_first_zero_bit_le(p,sz)
> > >       #define find_next_zero_bit(p,sz,off)    _find_next_zero_bit_le(p,sz,off)
> > >       #define find_first_bit(p,sz)            _find_first_bit_le(p,sz)
> > >       #define find_next_bit(p,sz,off)         _find_next_bit_le(p,sz,off)
> > >
> > > And the underscore-prefixed function is conditional on #ifndef of the
> > > non-underscore-prefixed name, but the declaration in find.h is *not*
> > > conditional on that #ifndef.
> > >
> > > To fix the linker error, we ensure that the symbols in question exist
> > > when compiling Rust code. We do this by definining them in rust/helpers/
> > > whenever the normal definition is #ifndef'd out.
> > >
> > > Note that these helpers are somewhat unusual in that they do not have
> > > the rust_helper_ prefix that most helpers have. Adding the rust_helper_
> > > prefix does not compile, as 'bindings::_find_next_zero_bit()' will
> > > result in a call to a symbol called _find_next_zero_bit as defined by
> > > include/linux/find.h rather than a symbol with the rust_helper_ prefix.
> > > This is because when a symbol is present in both include/ and
> > > rust/helpers/, the one from include/ wins under the assumption that the
> > > current configuration is one where that helper is unnecessary. This
> > > heuristic fails for _find_next_zero_bit() because the header file always
> > > declares it even if the symbol does not exist.
> > >
> > > The functions still use the __rust_helper annotation. This lets the
> > > wrapper function be inlined into Rust code even if full kernel LTO is
> > > not used once the patch series for that feature lands.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 6cf93a9ed39e ("rust: add bindings for bitops.h")
> > > Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> > > Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561677301
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >
> > Which means, you're running active testing, which in turn means that
> > Rust is in a good shape indeed. Thanks to you and Andreas for the work.
> 
> I've put together this collection of GitHub actions jobs that build
> and test a few common configurations, which I used to test this:
> https://github.com/Darksonn/linux
> 
> > Before I merge it, can you also test m68k build? Arm and m68k are the
> > only arches implementing custom API there.
> 
> I ran a gcc build for m68k with these patches applied and it built
> successfully for me.

Thanks, Alice! Added in -next for testing. I'm going to send PR with the
next -rc as it's a real build fix.

Dirk and everyone, please send your tags before the end of the week, if
you want.

Thanks,
Yury
