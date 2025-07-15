Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C38A137C52
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563024; cv=none; b=t49lCEOeoRzfenue5W4QY+mn7lA2LPbgkpBqkn9RMQrzbJbgJ9g1yw6AQQQZdH551ZOrAxjdiR8Rj71jGD1JO+1CJ1HZYqyTTo4sw3IyVG2SCp1FsvosDzgAsVYxrqqPf386hYIjXBalgxKEnhnEKe6lsuzxIhN2QmWGKjqrgho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563024; c=relaxed/simple;
	bh=jGIHWJIRk9i2hR7tXdegBVyUzLtZws4m098Ez8HCiu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMBiebjGzqXzI7ht4YolwGD1FvYVcxf4tjml6uQKiEZNkModP9LekYOG7p9i0jZu6SytcjP2qoFernJ3QbGGuHOXPYWozYIJwqVvM+NzT/98R1l6vt9titlgt+qnbiq/w/TlKG2+jInjRJaG19Ra6e57d3brJ2XuiDjd7sWcTGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p6di1us/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p6di1us/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a582e09144so2961367f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 00:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752563020; x=1753167820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt/6M57mZgMPhITvF8HdLS12vV1vFn0N4xhHPTTFoy0=;
        b=p6di1us/YOoA1lZHdJKciAn/weTVp3gueuCxxgxq0vox0P1weH/XwtFqEzh7VG8rdE
         z/8Ok3qMaemxdgDCx3iENLGbHdvgZD8fsioGrTK8eWKyVl8EXeXjT87ZyNXwOgV0xjr/
         1ptF1Bzg65wX4mYOInpU7lCCH8mgq1sWxn9UB2X8VvhX2NmQuXyPja6UF8r+sJaUyaR4
         Lsejui+EiNRyPQDOtDghE81neDRuCYhPB/mp71EX3Ne7pCdRiqjyCItgH6awQjiTqH0S
         0seB7xl69ukokxhyGUBRrOnW7Zw+qODHBzgsbnqdy2qrnnYqCMJCtSpWF5aa0MnT5nPu
         edGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563020; x=1753167820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jt/6M57mZgMPhITvF8HdLS12vV1vFn0N4xhHPTTFoy0=;
        b=LEEHpakz8CW6cGtfwnpQ4JrMGcN2vbFegHKdvY+vvuiPiGvcVIHe5m70TKmVGvPcxx
         nsYSKjNrmv1HqCqm9WRRpXfqrfLQQW71D3d4EtT1JDohNTVqjWkm8DtacP5o0//m5GOR
         /vQNloRE3ZKzasI9YXvPcJTTAG0UGTeqMBF0OhIK0jvBsPA8lyoKdXtBTbEhbWpR4YXj
         WfHVWxZnMWPaB0MdZY3x74FfBDvPkM+owrCfRkScR6Ww+mPyEqWI8177/mqeUYM84ydZ
         HGjxV/5JWb2TEPQ1reb1C41N5LvgTivfrOaFrMxmflE/Y3ZF1Q0IUh/0VZWp8sJS4DX8
         O2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV/AI2yA2gxQGzO3Vx2wDg1y7CwmzLd7QlIezzisPxDl1hszewHnMqzbbsBGEH6WOHxhcFcfycHqgufZaBgKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrg768q3lYHijHtVqvqpbD2vdeyjttWBnVG3X9XJSMa+4mVoyp
	Sezny2E10tN5FumcqcF7naaGREakSrzp+lnmRB5CM1s9YwP3MWG0fFypG8rFX6Te+GYdfFgcIYt
	3XYSh4sMVDBjnQYrOV2n/N4wR8GffQRFVA3mUJe87
X-Gm-Gg: ASbGncvZadFm4wCZRIBriGd0f6cKrafa79tx1aMR1Z8BH+aNizQ4Z+Uq8BSvEqa0fxK
	cJUm6YayNTDEIuIgjye1CvGdndJnLLNQibYYl7rvRNYISTc9QWXSDzAnu3eyjxSV321OYlUgf4A
	LBo4Ki/EX+0zbivoCmzHGu+82aSR2o6ELARUJJoZ/9NMBw3nkjk3u90S0LQIzM+m6TAsKoNkPFd
	sySiGXv
X-Google-Smtp-Source: AGHT+IE1/MY0RQcecLFoHvQZdO+7sZGnb0kcJHS9oa/ewG1ZdNmenXVcPC2k1yhTjRTUuDq69k9FOq7rxEcXnfgllNg=
X-Received: by 2002:a05:6000:1a86:b0:3a4:eda1:6c39 with SMTP id
 ffacd0b85a97d-3b5f2dc216dmr10969220f8f.13.1752563020324; Tue, 15 Jul 2025
 00:03:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709172345.1031907-1-vitaly.wool@konsulko.se>
 <20250709172441.1032006-1-vitaly.wool@konsulko.se> <aHDSLyHZ8b1ELeWe@hyeyoo>
 <5bc89531-ab09-4690-aae4-a44f9ddb4a68@suse.cz> <3AD3F7B5-679F-4DC8-968F-9FE991B56A5C@konsulko.se>
 <1dedcee0-c5a2-47b3-ae13-315ad437ae1a@suse.cz>
In-Reply-To: <1dedcee0-c5a2-47b3-ae13-315ad437ae1a@suse.cz>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Jul 2025 09:03:27 +0200
X-Gm-Features: Ac12FXx5pgrLnvLVllVwWAxwc6ktT76M5E8OvULeGL7H3WltRDY_yqdMh5SmBiA
Message-ID: <CAH5fLggV2Y+N7k=+b5z=Hy5a556VomEZEa3bGhufvKBU+Fd=Ug@mail.gmail.com>
Subject: Re: [PATCH v12 2/4] mm/slub: allow to set node and align in k[v]realloc
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	Uladzislau Rezki <urezki@gmail.com>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, linux-bcachefs@vger.kernel.org, 
	bpf@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 10:14=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 7/12/25 14:43, Vitaly Wool wrote:
> >
> >
> >> On Jul 11, 2025, at 5:43=E2=80=AFPM, Vlastimil Babka <vbabka@suse.cz> =
wrote:
> >>
> >> On 7/11/25 10:58, Harry Yoo wrote:
> >>> On Wed, Jul 09, 2025 at 07:24:41PM +0200, Vitaly Wool wrote:
> >>>> static __always_inline __realloc_size(2) void *
> >>>> -__do_krealloc(const void *p, size_t new_size, gfp_t flags)
> >>>> +__do_krealloc(const void *p, size_t new_size, unsigned long align, =
gfp_t flags, int nid)
> >>>> {
> >>>> void *ret;
> >>>> size_t ks =3D 0;
> >>>> @@ -4859,6 +4859,20 @@ __do_krealloc(const void *p, size_t new_size,=
 gfp_t flags)
> >>>> if (!kasan_check_byte(p))
> >>>> return NULL;
> >>>>
> >>>> + /* refuse to proceed if alignment is bigger than what kmalloc() pr=
ovides */
> >>>> + if (!IS_ALIGNED((unsigned long)p, align) || new_size < align)
> >>>> + return NULL;
> >>>
> >>> Hmm but what happens if `p` is aligned to `align`, but the new object=
 is not?
> >>>
> >>> For example, what will happen if we  allocate object with size=3D64, =
align=3D64
> >>> and then do krealloc with size=3D96, align=3D64...
> >>>
> >>> Or am I missing something?
> >>
> >> Good point. We extended the alignment guarantees in commit ad59baa3169=
5
> >> ("slab, rust: extend kmalloc() alignment guarantees to remove Rust pad=
ding")
> >> for rust in a way that size 96 gives you alignment of 32. It assumes t=
hat
> >> rust side will ask for alignments that are power-of-two and sizes that=
 are
> >> multiples of alignment. I think if that assumption is still honored th=
an
> >> this will keep working, but the check added above (is it just a sanity=
 check
> >> or something the rust side relies on?) doesn't seem correct?
> >>
> >
> > It is a sanity check and it should have looked like this:
> >
> >         if (!IS_ALIGNED((unsigned long)p, align) && new_size <=3D ks)
> >                 return NULL;
> >
> > and the reasoning for this is the following: if we don=E2=80=99t intend=
 to reallocate (new size is not bigger than the original size), but the use=
r requests a larger alignment, it=E2=80=99s a miss. Does that sound reasona=
ble?
>
> So taking a step back indeed the align passed to krealloc is indeed used
> only for this check. If it's really just a sanity check, then I'd rather =
not
> add this parameter to krealloc functions at all - kmalloc() itself also
> doesn't have it, so it's inconsistent that krealloc() would have it - but
> only to return NULL and not e.g. try to reallocate for alignment.
>
> If it's not just a sanity check, it means it's expected that for some
> sequence of valid kvrealloc_node_align() calls it can return NULL and the=
n
> rely on the fallback to vmalloc. That would be rather wasteful for the ca=
ses
> like going from 64 to 96 bytes etc. So in that case it would be better if
> krealloc did the reallocation, same as in cases when size increases. Of
> course it would still have to rely on the documented alignment guarantees
> only and not provide anything arbitrary. aligned_size() in
> rust/kernel/alloc/allocator.rs is responsible for that, AFAIK.
>
> And I think it's not a sanity check but the latter - if the following is =
a
> valid k(v)realloc sequence (from Rust POV). The individual size+align
> combinations AFAIK are, but if it's valid to make them follow one another
> them like this, I don't know.
>
> krealloc(size=3D96, align=3D32) -> can give object with 32 alignment only
> krealloc(size=3D64, align=3D64) -> doesn't increase size but wants alignm=
ent 64

On the Rust side, you specify what the old size/align was, and what
you which size/align you want after the call, and they can be anything
including that combination.

Alice
