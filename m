Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A157FBEA
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714584648; cv=none; b=EZJzd44MQhoFUFcjVJSD1N0jUZw/8YEi/4IbgSEbAz941QPSI0FrczZUM4sfhtM7Q+Y2NafCFFclS+AlYhRxzZom2UrtnEBekG9Ag7L7jcr3N3ZhlcValAMKHbJGlNMAgSTxBgQctvzj1GIxQ/EpXK6sIA7VTJGENTbswLnnv6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714584648; c=relaxed/simple;
	bh=UJaJnrreAUDESRHdrpS0xZ0X3HfoMldb0Jx3JmI7dp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mxXeW2MPaVBD8yWDdJOJitoeBcpG6axTnnjVpnFNauniEQuuzeySz8cjoq2YKfmiiA/vwX9hVTRck1s2yiDKg49eL+RqWAIpnriVNIM2jPF2uvbNwx4VH5hpUHTEeg57ykaXVUL81nQdYJe4MVqggxZTrwvTW4w2VpQoiM2MSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bzbpn2ge; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bzbpn2ge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714584646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w5qYizQYzyGU/IBVWBTorM+cObgRuObNdre+tHgwe98=;
	b=Bzbpn2ge1jsVRyM8pE82HnSQ5Mx23NPinnepyE5Dw3pIUML2ATSRVDRZ6CEmys8W8odh1N
	cmSQy5bQqC6l8T8nOmrmQKYUakDI9LZf5aZfCjtwqKKIDeluPFb9Ks7xR1cZIJ/iYWJYRg
	S/1VaxyruzeR39Ei1xcjRhK/gP5lOi4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-l3vJdV0NN5KFQQkdg7az6A-1; Wed, 01 May 2024 13:30:42 -0400
X-MC-Unique: l3vJdV0NN5KFQQkdg7az6A-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2d87f5937fcso63570171fa.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 10:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714584641; x=1715189441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5qYizQYzyGU/IBVWBTorM+cObgRuObNdre+tHgwe98=;
        b=QVHqxI0GeDMracO7PWWunc2kkOJ3B7kbauXRTdAebs+HqIkWIPGvx0GOmUXydeb1M6
         AGttZs58Waa3eM7WI65+P2d06XICXsYG/g+ppLWJZS7iSUH6xDDiNlXvwHuDACsLwdYb
         /Pp2Q65AUyEiYLM6fA4TE4nvAuIthmkaFBvD2KziTLEZdG9ES5l/SBkv+P0IDcGN6skN
         NgWMEkbqY7jhzZ+Ip0+0JLMHN9ahvSYIm8+trPy+9ynPz5loZ9e03E9svKthP6iNppWm
         d1lYR1tVxVPwYoHSF1l/QkfN6IHi4V8TnrOMCpo0n/A2abQ5pHktGQf2ruOEEpR0y+2t
         Ko9w==
X-Forwarded-Encrypted: i=1; AJvYcCWxAcVeXtZ3xqVlLg6hbi7QLFyegiRFR3bmfS1IlMVf6qwSfjDrx8yQmKLkMdopOXSKSHLKjEe/WnOkOnJi8RvWoL9xXonN0dGmi0mfMV8=
X-Gm-Message-State: AOJu0Yyelp3cVmDAiORz6W2FDmKeKD8ywREc8WalZLbRSBgEVrdLj2FU
	1vOE5tjFN25l7gU6s231Og6nq/SlpzBTwZjwtv7HKG8M51boDy4jMluxp83y7zvoECilK/Buwfi
	rX6xfd51F2QlRpngsaOR44rU86n/7T8g1y26L+D3BTHSfsKL+Hl8lfLm0xlwqRap4
X-Received: by 2002:a05:651c:552:b0:2e0:ffea:4298 with SMTP id q18-20020a05651c055200b002e0ffea4298mr2790300ljp.34.1714584641076;
        Wed, 01 May 2024 10:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI2qn9355zXZBSRD8IHu0ewYhlmOyvtO6zuGU5ulT1f9Rb8MAo7nrf0y6cu6cQ6kC7BZtuBA==
X-Received: by 2002:a05:651c:552:b0:2e0:ffea:4298 with SMTP id q18-20020a05651c055200b002e0ffea4298mr2790281ljp.34.1714584640631;
        Wed, 01 May 2024 10:30:40 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id q4-20020a05600000c400b0034dfede0071sm546199wrx.46.2024.05.01.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:30:40 -0700 (PDT)
Date: Wed, 1 May 2024 19:30:38 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com,
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 6/8] rust: alloc: implement BoxExtAlloc
Message-ID: <ZjJ8Poo9OYIPnUO3@cassiopeiae>
References: <20240429201202.3490-1-dakr@redhat.com>
 <20240429201202.3490-7-dakr@redhat.com>
 <2324d22f-984d-4f92-8302-5c866f3387ac@proton.me>
 <ZjI-XkWfMfozaQ4F@pollux>
 <45f53c48-efa5-4f97-9fb2-72aaded3c260@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <45f53c48-efa5-4f97-9fb2-72aaded3c260@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 01, 2024 at 03:46:31PM +0000, Benno Lossin wrote:
> On 01.05.24 15:06, Danilo Krummrich wrote:
> > On Wed, May 01, 2024 at 08:53:51AM +0000, Benno Lossin wrote:
> >> On 29.04.24 22:11, Danilo Krummrich wrote:
> >>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> >>> ---
> >>>   rust/kernel/alloc/box_ext.rs | 40 +++++++++++++++++++++++++++++++++++-
> >>>   1 file changed, 39 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.rs
> >>> index 76653d6f4257..74d6bb24e965 100644
> >>> --- a/rust/kernel/alloc/box_ext.rs
> >>> +++ b/rust/kernel/alloc/box_ext.rs
> >>> @@ -2,7 +2,7 @@
> >>>
> >>>   //! Extensions to [`Box`] for fallible allocations.
> >>>
> >>> -use super::Flags;
> >>> +use super::{AllocatorWithFlags, Flags};
> >>>   use alloc::boxed::Box;
> >>>   use core::alloc::AllocError;
> >>>   use core::mem::MaybeUninit;
> >>> @@ -21,6 +21,19 @@ pub trait BoxExt<T>: Sized {
> >>>       fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocError>;
> >>>   }
> >>>
> >>> +/// Extensions to [`Box`].
> >>> +pub trait BoxExtAlloc<T, A: AllocatorWithFlags>: Sized {
> >>
> >> I think it would be better to put all of this stuff into the `BoxExt`
> >> trait. Otherwise we will end up with even more extension traits...
> > 
> > That was my inital idea as well, but it wasn't quite obvious for me how to make
> > this happen.
> > 
> > I think for BoxExt<T>, it's rather easy, since we don't need an implementation
> > for Box<T, A>. What do you think about this [1]?
> 
> In the `.._in` functions you're not passing the allocator to the `Box`.
> This will lead to problems, since it will use the global allocator to
> deallocate the value when you drop the `Box`.

Indeed, good catch.

> 
> > For VecExt<T>, I'm not quite sure how this can work though, since we'd need to
> > implement VecExt<T> for both Vec<T> and Vec<T, A>.
> > 
> > For instance, VecExt<T>::reserve() needs to be implemented for both Vec<T> and
> > Vec<T, A>, but VecExt<T>::with_capacity() can only be implemented for Vec<T> and
> > VecExt<T>::with_capacity_in() can only be implemented for Vec<T, A>. But we have
> > to implement all trait functions for both types.
> > 
> > Do I miss something here?
> 
> You're right, we need two traits for that...

Ok, so I guess we keep BoxExt<T> for everthing and just separate VecExt<T> and
VecExtAlloc<T, A>.

- Danilo

> 
> -- 
> Cheers,
> Benno
> 
> > [1] https://gitlab.freedesktop.org/drm/nova/-/snippets/7784
> 

