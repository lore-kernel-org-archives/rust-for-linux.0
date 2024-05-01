Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E074714A8B
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714602722; cv=none; b=HkSpqIUBV1B329c8QwnCVMdIgbsW3pPOFzw+dLaIEP58zXvXZcznUjAsiycOyYQh/1bpDz+UagzjsObLwoDT8my6PMKP+c55C9Y2Cz/31smmFXdtxDaArWjJhPMinbd/Ax9MYQ6AfoM7JuW9o7HS5zJAE8aPOXUiuAXAURmTAmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714602722; c=relaxed/simple;
	bh=RpHbVACVsZPGwV0fDMff/+Li1oS9TvebEM7fsChVexo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=J0pvCMe6Dx8pc1KWikcCD/ixsD1T2lS1g7EQIeSF2vidifQldaawP9TVSn6tU5qMbSzXlebUOpI4lLxhL7YRPwKzzTy9n5Iu8m2puouJwR473IDsu/xL1b7GEdR6OgaGW462VNlafSAoIyAIn9cc0ljXeCe0uOGKP6PcFFsNeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SFSude+/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SFSude+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714602719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbY7ELnFDXRwIchPnKTjaCTYQOvkRNZhZrnZ5fVnHPE=;
	b=SFSude+/aBTN9Fz7qZxYuaa4a9CeciD28LLnr1eZVwj7EnYUsX3WZ00QNcQabWUAZHG9bP
	VpXDM4ZOFo3GRtoi24wGQwu91gEoiihsRxZEN1V3rCeuJiJgE9KuQ5Zr3u58/P2n1+DyNt
	/Z/KNlANpAZO3dE917Pf37Zd0wN2VZc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-z07rcEioPMCfWp8CGltkMQ-1; Wed, 01 May 2024 18:31:58 -0400
X-MC-Unique: z07rcEioPMCfWp8CGltkMQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4167351545cso51036815e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 15:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714602717; x=1715207517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbY7ELnFDXRwIchPnKTjaCTYQOvkRNZhZrnZ5fVnHPE=;
        b=F316TFPEUYkxDF4SPxW0pbhNb7tbFlPETtkVUm/VksMKVM1877JSWHphGXTARRKsAl
         Qq6JDy6jZANiwsaJkVDT7mQSZdKkBBGpy2iMBAQSi/DKMeWWXJljGbv3eHZ0oU/YfTeS
         P2YWoyNxt+6cWiVgdNUUjnAmfB5oe5nXvVq2w+uPPG13qR4AVM3Xge3RzsiL1PLQJ2f4
         vQ56bIfv3S9HWXHWO4qMHpWyxu9dimcA7Fe49lMVBRgAgx0VdHadsrJy5qWNzdh+sCs1
         nfXGvA1zEsfns3k+K3lDxkWxB1OvdH4aOxBhQcgoU7+SjBM9GAuOgyQAccBeJU8odCYL
         ZbZA==
X-Forwarded-Encrypted: i=1; AJvYcCWfq7Qi/FsjXFcwlL5q2cOLcD3xYsFs2OAlXkp5ujhFMX6wFIGCgfss2tZl9tQ3Qbqk+TYrHTP9Cz9Vpkufkx5Gd2DHATaRCxmx7vbOia4=
X-Gm-Message-State: AOJu0Yxdfhf1koRXTPAZv/ryeGyICTTx0vs5ndjhXkY86vLi67iKIib6
	EkPW8bX08wL1mdlyunXBJBYmeU5eLkTVgkL1Afjmld6hCZiJhPqXdNeNYHen6oEzKGDfJKwOLCM
	obCII2SwvThi0rFgl7CUCT7ogD7S7MIescbf5D6ke50zbszPZ7NWqPE5Umdv+VI5u
X-Received: by 2002:a05:600c:3516:b0:41b:eaf2:f7e6 with SMTP id h22-20020a05600c351600b0041beaf2f7e6mr3583831wmq.2.1714602717070;
        Wed, 01 May 2024 15:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn70O0Tdgo6jg3LGL4VWHbtwhzfQEeEeMUCvFwan02jNFmhF2KLWMblCBxoZWfi5o5ilOztQ==
X-Received: by 2002:a05:600c:3516:b0:41b:eaf2:f7e6 with SMTP id h22-20020a05600c351600b0041beaf2f7e6mr3583805wmq.2.1714602716700;
        Wed, 01 May 2024 15:31:56 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d6e84000000b0034def22f93csm1669917wrz.69.2024.05.01.15.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 15:31:56 -0700 (PDT)
Date: Thu, 2 May 2024 00:31:53 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, ajanulgu@redhat.com, zhiw@nvidia.com,
	acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 0/8] Draft: Alternative allocator support
Message-ID: <ZjLC2W5PQt6IrqYy@cassiopeiae>
References: <20240429201202.3490-1-dakr@redhat.com>
 <CANiq72=0BNw-KiURBjosLqfuUEPpjZPbRg1XMFZyobOzBt7aMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANiq72=0BNw-KiURBjosLqfuUEPpjZPbRg1XMFZyobOzBt7aMA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 01, 2024 at 11:32:02PM +0200, Miguel Ojeda wrote:
> On Mon, Apr 29, 2024 at 10:12 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > Please let me know what you think.
> 
> Thanks Danilo for implementing this.
> 
> I think we should explore options that avoid going back to
> `allocator_api` if possible (i.e. like for any other unstable
> feature).
> 
> In particular, `allocator_api` has been unstable for a while and it is
> not completely clear to me what the path forward there will be
> (especially with all the discussions around that particular unstable
> feature and previous efforts to make progress there, e.g. whether it
> would be fine for them to add more `try_*` methods and how to name
> them and the documentation concerns, and whether it may need to wait
> for other features like keyword generics / how exactly to avoid
> duplication of methods, and so on). It is also unclear if they could
> give us support on their side for flags per call site and so on.
> 
> So if we can find a way that does not use it and that does not have a
> performance penalty (or a big ergonomics penalty), then I think it is
> worth avoiding it.

Yes, I fully agree. As discussed, I will explore this option, get something
hacked up, post it and then we can see how it compares to the approach of this
series.

- Danilo

> 
> In fact, I would say what we really need is the flexibility to
> implement our own allocation APIs from scratch, including types like
> `Box`, `Vec`, `Arc`, etc. suited for particular kernel use cases, and
> giving those the methods that make sense in each case (whether or not
> wrapping/newtyping existing `alloc` types), rather than the ability to
> "just" customize the allocator for existing collections. To be fair,
> Rust is already willing to consider solutions for us on these matters,
> like they are doing with e.g. `derive(SmartPointer)`, which we really
> appreciate.
> 
> Cheers,
> Miguel
> 

