Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74501BBBDD
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Feb 2025 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173977; cv=none; b=g0VH+uqOwIm1SZp/+XrZKGcM1Goimou167n+lwLjE/W9XoInBTQrs2phUg9Z57oK03x+27z/m0RHMd0PJeP1BM+IpIptFHHl2ogg/+QHJWkc5XjdmSovJECefZ70lk33WyZt0HVHCC7BYsLno5BfTV2D6DmrxVe5vy9YDrAOKEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173977; c=relaxed/simple;
	bh=W8zdIY1rYsE45zOuPrzevizg1Izts5KX52qEocX1Sco=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eavzFlliocs9mmq/JpQtnX+u+PrQ045/HJ3q1PGGCg3rFmf01G2qUMxvNJEo5LWTc2lle8zg4dwqkGyBNEYRGQv6eLmqw4axRByTpKAPYXAnN0mCusU6FoxwpyBUZd0sMxWz1iGH33nUb9C8V7RP37FAGhg7f4dQR0xWbclzr8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=g9alD5FC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="g9alD5FC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4368a293339so45046465e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Feb 2025 23:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739173974; x=1739778774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qkfv43O1g5zvAJXOqIcSrZ8ndK2BrDyyauC15WFvoaQ=;
        b=g9alD5FCVL0Ag+3KY7hlP6GzVwTNT1zd8fRru50sDnF3J+wWjJXMdJTncklnrPrD9e
         5t9f3AeC2TECoU16lU92mutiM3TYOREd7Jt5EeIlRZr3AZvvG8Tj6Qquy487ErgiGOu7
         25PxjTc0c6hQGY1oQN36xzToGtxKhtgEUHNz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173974; x=1739778774;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkfv43O1g5zvAJXOqIcSrZ8ndK2BrDyyauC15WFvoaQ=;
        b=nhm/0zxTTVODcuDXueOfbwtft8KUCRTKqJDURcIttXhRK94wJ5BkzT4vwVLei3Zb/1
         TRWnwjqC4eJyVwrKw1zXKYSEm4WSrBk7Hgreig4sQ5tgYmx7qjiX2+PbjlJwcbJ37a0u
         uEH1lnkdB/3s3yzj+/Uc66XYc6Jws6QykuEK3INaQH0sU4K9R4rpJnVtfPO7uleqytSe
         EwAD4ViEDPp1yb+9wYLNJXLdEJ0KDXAXLoOZMoBCBF1SLY5MdwD0iI8bnxTYXu4BkB8v
         KwnWdro2o/UnHwu+Uek+NazNKR6+So4tea6lYuDijAwBR+CLYQh0d/iIBFmafI38gx4t
         nPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnEfHb2bDW1L/kv0p5X3/Ykarn9G7j6S+jyPTMJydF33p/S0X9v2tYWqeo2ag1NAyQp/3NG0DsMLrdycdSjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFkoAOulWBsVvNWH2Z7YQlkA2vnKjdKr4WsjHdCTEtoO1fIwRq
	1pd2qEhD5p5QRxLV5oXWZIlbwtoxI1lotbJ776p8LBIFs6jtc36ahpzJ8oSc48Q=
X-Gm-Gg: ASbGncvVn1xo73w7O4vAgUXzozA6amMz/loYR1oMqoIvjuDYWJi5du764OgA1dEXVJS
	5HQmiho+KDddI0zX2BEVIb1B7PA+VOqXcFNqWXfPrVKgKh9Pif41iHxWnqKgCgkKU7Bhx6SA15K
	rfP719wdR/vlQ4RDwNuWbYMd9f3rN5DMMdL4Mx328yQ8Hj8W4mOQmYTmuz4bFt9dSDrXDQNsK4c
	sCT7rvm2PQC0MD21gLFVZPvBEwWWk5K4xZOWf1MjYvIgKh6DQcYyXtzKQ+emiK/XZIchWht6KNA
	xPFwUEMPOVbeIU0Pc+gxhsntfZ8=
X-Google-Smtp-Source: AGHT+IFDgbl8wGVpble5Zv0abCqTht8o2Ov+/uOG64czyzOx5fpcCwEyGABd1B3TPwQLwmivIDhgfQ==
X-Received: by 2002:a05:600c:4f8e:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-43924989dbbmr123507065e9.11.1739173973845;
        Sun, 09 Feb 2025 23:52:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc565d62dsm10287702f8f.93.2025.02.09.23.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:52:53 -0800 (PST)
Date: Mon, 10 Feb 2025 08:52:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Hector Martin <marcan@marcan.st>, Simona Vetter <simona@ffwll.ch>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z6mwU1Yiy-PQ4lXb@phenom.ffwll.local>
Mail-Followup-To: Hector Martin <marcan@marcan.st>,
	Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	DRI Development <dri-devel@lists.freedesktop.org>
References: <20250130154646.GA2298732@nvidia.com>
 <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <4c143b85-063a-4413-a6ca-e9d80e26da96@marcan.st>
 <c5a49bcb-45cf-4295-80e0-c4b07083df00@marcan.st>
 <Z6YPfsDSNdRUskvp@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6YPfsDSNdRUskvp@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.11-amd64

On Fri, Feb 07, 2025 at 02:49:50PM +0100, Simona Vetter wrote:
> When you're that harmful with your calling out, eventually I'm going to be
> fed up, and you get a live round shot across your bow. And if that then
> causes you to ragequit, because you can't actually deal with the heat
> you've been dishing out coming back around the corner:
> 
> Fuck off.

With some sleep, a w/e and slightly less ill temper: As I'd say in Swiss
German, this was suboptimal wording. Or in plain English, a disaster, I
screwed up.

I do not rescind the sentiment I expressed though. I cannot stand people
who punch where they're stronger, and eschew conflict and fold the moment
someone hits back.

> Or as Dave Airlie put it upthread in this conversation:
> 
> "Being toxic on the right side of an argument is still toxic, [...]"

The irony has not entirely escaped me. Oh well.

Remorsefully, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
