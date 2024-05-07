Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502EDA5F
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 00:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715042181; cv=none; b=fa2/hdR+ONBlHtPazbJKq8HltkXTPhq7QqytUzPXgyEe8ez4/kcmmx3eNg5MK1TU5kS0EbmUo7Ht2sTSMLTEmxPCBT6+jqHOK5+ePMH8WbGJcPdhW0VWaW3H3e1YGxBXGGSB3eYNA3op3lyBWQaCqnKWK1pL6pe7zVRiDTbpAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715042181; c=relaxed/simple;
	bh=mpF5jkXbAulXTvC9h6GGs20zEGzdED1LyrXOrZsJddc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/F4AWIvkYkrT5XIJFlHTk/vO7oXdfS+HVnmozVKHVZ/S2QI/9PkOR77g8IZhJGeXGwMVItB5Mwnx1eSlQXmjMgMh6gvYrOEL5NqRQ7wzkyFGZBlEs4y4f5fxPBjVi+iUJIWivxykmsm8e0jVRV+faWqLVTMfwJvr8WpGoGQacg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O9sfr4MG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O9sfr4MG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715042178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5LFpTCMWcP1eaJy4wfPjD6EyHt6gD2m+eNr7IWuZXU0=;
	b=O9sfr4MG9fH0fXanUlKnYl1nA9WuNDai0dp/kHZp1KziDQLt5Dc9MmvopzTgpgeOCTMQV7
	diFxWPIsIQcK88DH32kvyGlrg+cjZK7gb8lHwODjC4b7A8tUI9L4Niui1wvCfGzcZHyVCb
	+ge4pMs0AJsMS/y7wiaF1HtX2aRwqmI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-H2jjRVXPNSO5T2vU9OPV6w-1; Mon, 06 May 2024 20:36:16 -0400
X-MC-Unique: H2jjRVXPNSO5T2vU9OPV6w-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5d8df7c5500so2472351a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 17:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715042176; x=1715646976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LFpTCMWcP1eaJy4wfPjD6EyHt6gD2m+eNr7IWuZXU0=;
        b=VmUQtbyXrxy7iX27uO8HKt75KZ9DjTQTI09E2RHUjbybNV887elQlJm8T6MhBYJdps
         /Oh91XqNDQHfft48Sp2fEsR5/qnpMHfpXPsJR5PjCZ8PZf413XNMN1OMAjXK2Nf9/eCE
         44UczGWBeodTNsS86Iwv1bBzMMPK6nuP+yq5DKElqISuuZce5XusVyreJ1GpmqI9UdPw
         ZlJbapAjZ/dUdiLbwWjYfGxIvQ/l3mGszAq6kYThn9rdCIrjjuim70i29JEbJrC/1raX
         jPj3U6gPBLXnnC8b+G2l/B8rW1sAiGGI7szJ6dT7zDj/kAwIX/K77HA4L6qLYoi3j6cN
         1hkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/erVyflhPGa/5sxPBBLmfluI+3pA8ysybLzYk5BbB8CL/yThvl5SOkAZpac+L1u968PvW9ayA3HbUXnqQL8Cxa+TsBDFMqnKFEGu0y2Y=
X-Gm-Message-State: AOJu0Yx24yEcVuE6FvaHcqyDiPS50u1j8zFspViYBMvUCz8iFffDLnwN
	lVzJUGDhHmbF572ka3WLdGC8rNhfNlrm2gX4Z8cJ51hW7s5tSVuy+uZ9coZJrXaxP9ij9+KYWtX
	xYm/fcxUgupNiTkdxsdDFMTF8Ay6t12vHzqjb+b6YeuCMflrhVdnNsyTx4JS/332LR1sVtwjOiY
	3a/sZWdGneyUFn/nv/rDjg9W9ou3AqKJn04GpM8pY=
X-Received: by 2002:a05:6a20:6f8a:b0:1aa:59ff:5d31 with SMTP id gv10-20020a056a206f8a00b001aa59ff5d31mr13182319pzb.0.1715042175661;
        Mon, 06 May 2024 17:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv6PnHgfLBBL0IoGyfSTU6sRpdwRJpR2sO5o3zn41WNN14VLicYRW6zwzV1wQmoRv7tbHBTUV/NnMzTh0LP/k=
X-Received: by 2002:a05:6a20:6f8a:b0:1aa:59ff:5d31 with SMTP id
 gv10-20020a056a206f8a00b001aa59ff5d31mr13182302pzb.0.1715042175105; Mon, 06
 May 2024 17:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501134834.22323-1-dakr@redhat.com> <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
 <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com> <CANeycqppeewOc+OH_KPLOdbPLx1BMGMcmuye=uKM2-K80J7Vwg@mail.gmail.com>
In-Reply-To: <CANeycqppeewOc+OH_KPLOdbPLx1BMGMcmuye=uKM2-K80J7Vwg@mail.gmail.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 7 May 2024 10:36:03 +1000
Message-ID: <CAMwc25oNYPkHTm2NoCiP2Yc0K1J_JVPpv3gS5+9O2kwveLYgCw@mail.gmail.com>
Subject: some aside maintainer advice (was Re: [PATCH v3] rust: alloc: fix
 dangling pointer in VecExt<T>::reserve())
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> On Mon, 6 May 2024 at 12:22, Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On 5/6/24 16:11, Wedson Almeida Filho wrote:
> > > On Wed, 1 May 2024 at 10:48, Danilo Krummrich <dakr@redhat.com> wrote:
> > >>
> > >> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > >> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > >> passing a dangling pointer (instead of NULL) to krealloc() whenever a new
> > >> Vec<T>'s backing storage is allocated through VecExt<T> extension
> > >> functions.
> > >>
> > >> This only works as long as align_of::<T>(), used by Unique::dangling() to
> > >> derive the dangling pointer, resolves to a value between 0x0 and
> > >> ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
> > >> pointer however.
> > >>
> > >> This isn't a case we should rely on, since there may be types whose
> > >> alignment may exceed the range still covered by krealloc(), plus other
> > >> kernel allocators are not as tolerant either.
> > >>
> > >> Instead, pass a real NULL pointer to krealloc_aligned() if Vec<T>'s
> > >> capacity is zero.
> > >>
> > >> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > >> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > >> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> > >> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > >> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > >
> > > Reviewed-by: Wedson Almeida Filho <walmeida@microsoft.com>
> > >
> > >> +
> > >> +        // We need to make sure that `ptr` is either NULL or comes from a previous call to
> > >> +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
> > >> +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>`'s capacity
> > >> +        // to be zero if no memory has been allocated yet.
> > >> +        let ptr = match cap {
> > >> +            0 => ptr::null_mut(),
> > >> +            _ => old_ptr,
> > >> +        };
> > >
> > > I still think this should be an `if`.
> >
> > Is there any benefit using an if here, or is that your personal preference?
>
> Readability.
>
> I don't remember ever seeing anyone implement a != 0 comparison with a
> match or switch.
>
> But if you insist on innovating on what seems poor style to me, go
> ahead. I'll fix it later.

I'd like to just respond with a bit of maintainer experience here,
please try and use less suggestive language and more requirements
language in reviews if you want to see something change.

"I still think this should be an 'if'" allows for disagreement and
discussion, but clearly in some cases you want to directly inform the
patch submitter of some maintainer requirement, I consider stylistic
preference one of those cases.

If you are in the position as a code maintainer that you say "do
whatever, I'll just fix it up myself later", it comes across as
passive aggressive, whereas you could just have said that in the
initial review,  "change this to an if for consistent style" or
because of maintainer preference it leaves out any ambiguity that you
want to be see the change in order to merge it. In my experience most
contributors will just make changes and move on, and are happy with
less ambiguity.

I'd suggest if we wanted to establish conventions and rules around if
vs match we should hash it out on zulip and update some docs
somewhere, or we can just leave it as is and have maintainers state
their requirements to avoid ambiguity.

Dave.

