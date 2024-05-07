Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9277187324
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 20:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715112983; cv=none; b=QR7qUlIh+W8PYnrO7QRRE+of7GOlTYeYTT4qC4g/bN8KRLUy+CiESt55VztcPf9MdhYVY/vnPNVcyfysE2yBMDCuhyijttolmZfRO/RWVtVgAFK/3UJ/r3f3FfWDf0WCjOCZo1EsxVz6rBKuCUAxmznJIDoUDoA5DGDIrx5gfnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715112983; c=relaxed/simple;
	bh=CbQ+SrgEyw/xoFG9XwY+z0DG2oIUiDOnKS0HXMWympU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZVL+jKk8JNPs3HiVHHqILW6/EMLKJaa2pEfSSVQCv8yiJufYqRdvNBQQQiMvHPm6r+xurbWqzDXcVt0hwUbq5Dr3sX3IUyydn/u5aMQlA37jlQvwZRjZQc5+M0GQD4YycX9z5XzHxPGYm6KalitS06uvwIz+0ciOrmwuQ/PuqiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0CZQM6k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0CZQM6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715112980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jr3uEPiDvbc0VFpo5bfmPsYGxvKDjlqpBrKRnD3zaQA=;
	b=X0CZQM6kCBH5o6fkGNILVHoTvFkYLz+GxGPGtpEmjvWb5Ha2UgSbvfqCKVTRcUz61AaQZp
	QtoJYjujUa2q1O8aDFeaYTAYqVdtlKBj+jtcmLXzqZ3FS4u/3DXiwa/RRs+VaNEkgl2NRf
	IFUZhRAFJ8wVaWQSSN+dX0zWQ7QtBrI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-Yd5tfUsiOGa9L0vGPI0XpA-1; Tue, 07 May 2024 16:16:17 -0400
X-MC-Unique: Yd5tfUsiOGa9L0vGPI0XpA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-418a673c191so14563235e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 May 2024 13:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715112976; x=1715717776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jr3uEPiDvbc0VFpo5bfmPsYGxvKDjlqpBrKRnD3zaQA=;
        b=nLlb96uEOKaPSYiXqtA8ueJgs11AbagyGiUSUkgyGo8Hbf8bBlMcW4zp1W5nMSWVci
         9oceseVV3CySoWbRIWdBBOMvQ5PsB2dAAg/EJYloGMvzmr+tTKoncz1BxH9Le7yjo4Qh
         38hm/+EtRbar4CvxL8+QGE6nWSwc9OKf7+eWKbPQtXI8NYWJsYBx7Oj9kKdz5bIubQoG
         lHSM52K4lgN3axiU1E8Fyk9lTBcye0pUYFhtcbktNCaEeNBHI+pE0WoFWOg+yFtjounS
         VYmMw6V7ROfBE4F0dx/jiIQZaqYjXmTDRwSlufAUuLpphlNK8avgnni2JQPvlAVkPJDo
         HxOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVipC8FoPrcg4ifkN1qryb9gzIV3dQWYzLpxfjkUMFe1Fw6EjLPlYs9asHLiKl0S79Ubi27Yu+se39g1TH7xQNbPFvURjn1hBOpUYW/T9A=
X-Gm-Message-State: AOJu0YzCzf3nlhf80HA7adCoq4bhjg/F5zvtxvhf6MCA603JxY1TECF+
	QlMDToBz3zgTvKUEc6BUZa6HgZo8YZMyjt5GdwCwQjaY1xVfymYAvdW9ZX6LZ7e5aGnbW+OaBvR
	QWoYvLkpgyfcJNiHPM+qm/wedpFq60ssgngbmZmfPJL/ZSoqO5qxeu3qxRAKLD83M
X-Received: by 2002:a05:600c:4703:b0:41a:b56c:2929 with SMTP id 5b1f17b1804b1-41f721acb23mr7049085e9.34.1715112976374;
        Tue, 07 May 2024 13:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElCZE1ykp4Rrix4s1DIjSoS/7ZfZ3qxJU5GJ0Ua4lwZthHkBgRkPFxO/RUN9bNxuBgu2xdfw==
X-Received: by 2002:a05:600c:4703:b0:41a:b56c:2929 with SMTP id 5b1f17b1804b1-41f721acb23mr7048895e9.34.1715112975993;
        Tue, 07 May 2024 13:16:15 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id s20-20020a05600c45d400b0041bde8ddce9sm24368055wmo.36.2024.05.07.13.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 13:16:15 -0700 (PDT)
Date: Tue, 7 May 2024 22:16:13 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: David Airlie <airlied@redhat.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: some aside maintainer advice (was Re: [PATCH v3] rust: alloc:
 fix dangling pointer in VecExt<T>::reserve())
Message-ID: <ZjqMDWmaOyK054ow@cassiopeiae>
References: <20240501134834.22323-1-dakr@redhat.com>
 <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
 <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com>
 <CANeycqppeewOc+OH_KPLOdbPLx1BMGMcmuye=uKM2-K80J7Vwg@mail.gmail.com>
 <CAMwc25oNYPkHTm2NoCiP2Yc0K1J_JVPpv3gS5+9O2kwveLYgCw@mail.gmail.com>
 <CANeycqq6KBqBiX-ckm9MEGW+JcynvjAw2TJa0K2-mGgN5snZsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANeycqq6KBqBiX-ckm9MEGW+JcynvjAw2TJa0K2-mGgN5snZsA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2024 at 11:33:31PM -0300, Wedson Almeida Filho wrote:
> On Mon, 6 May 2024 at 21:36, David Airlie <airlied@redhat.com> wrote:
> >
> > > On Mon, 6 May 2024 at 12:22, Danilo Krummrich <dakr@redhat.com> wrote:
> > > >
> > > > On 5/6/24 16:11, Wedson Almeida Filho wrote:
> [snip]
> > > > > I still think this should be an `if`.
> > > >
> > > > Is there any benefit using an if here, or is that your personal preference?
> > >
> > > Readability.
> > >
> > > I don't remember ever seeing anyone implement a != 0 comparison with a
> > > match or switch.
> > >
> > > But if you insist on innovating on what seems poor style to me, go
> > > ahead. I'll fix it later.
> >
> > I'd like to just respond with a bit of maintainer experience here,
> > please try and use less suggestive language and more requirements
> > language in reviews if you want to see something change.
> 
> Thanks for the advice.
> 
> I don't want to be intransigent though: if there's a real need for
> this to be a 'match', I of course wouldn't mind it (though I don't
> believe one exists).
> 
> > "I still think this should be an 'if'" allows for disagreement and
> > discussion, but clearly in some cases you want to directly inform the
> > patch submitter of some maintainer requirement, I consider stylistic
> > preference one of those cases.
> 
> By any chance, have you seen the thread that precedes this comment (in
> v2)? In case you haven't, check it out here:
> https://lore.kernel.org/rust-for-linux/ZjFq1uVXi4k1jjQc@pollux/
> 
> Between sending this response and sending a v3 that completely ignores
> the discussion, he waited a grand total of 16 hours.
> 
> > If you are in the position as a code maintainer that you say "do
> > whatever, I'll just fix it up myself later", it comes across as
> > passive aggressive, whereas you could just have said that in the
> > initial review,  "change this to an if for consistent style" or
> > because of maintainer preference it leaves out any ambiguity that you
> > want to be see the change in order to merge it. In my experience most
> > contributors will just make changes and move on, and are happy with
> > less ambiguity.
> 
> The latest exchange didn't lead me to believe this contributor "would

While I also don't agree with some other points in this context, I only want to
focus on the following two aspects.

I don't appreciate being referred to as "this contributor". If you want to refer
to me, please do so by using my name. Doing otherwise feels like a gesture of
disrespect to me and hence doesn't provide a foundation for working together.

> just make changes and move on" (as you suggest above), so I had two
> options: reject the patch or accept it and change the style later.
> Since I obviously want the fix and for him to be properly credited (as
> he deserves and insisted that it be by means of his own commit -- see

I also don't appreciate spreading false information here.

Please note that I was only sharing that my experience has been that people
typically do care whether their own patch or the code of their patch squashed
into an existing one is landing.

I did not say that I personally insist on the former. I even explicitly said the
opposite:

"Even though I wouldn't mind personally, my experience has been that people do
care about the difference." [1]

[1] https://lore.kernel.org/rust-for-linux/ZjEfW6QpErDDnntk@pollux/

> the discussion in v1, of which I wasn't part), I chose the second
> option because Miguel and I want to finalize the changes for 6.10 now.
> 
> > I'd suggest if we wanted to establish conventions and rules around if
> > vs match we should hash it out on zulip and update some docs
> > somewhere, or we can just leave it as is and have maintainers state
> > their requirements to avoid ambiguity.
> 
> Zulip? :)
> 
> Cheers,
> -Wedson
> 

