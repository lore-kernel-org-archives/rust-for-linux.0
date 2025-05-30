Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F54235051
	for <rust-for-linux@vger.kernel.org>; Fri, 30 May 2025 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616630; cv=none; b=ds/7FtPgZg+T5sm5oeH2FKQofrOiPCjBiS0wj8r56+A88WuSHseskowFV6r9T8k+HxSaorzQZVwDuHyK8u0u/ngIrfkvXvQfmzvfacSrMI41t9xjFNzMOvFvEBCWeJrrlZuMneQ4F/cmFxQKTRNjKbzJ+KOcVdBz69XDmZl0N3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616630; c=relaxed/simple;
	bh=HGRPVLu6Tlbf8okATr/kZX+v/mGty5hiwEauJPQTAPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X78SgZe3ufhlpd5FHP5FRiXJXHiqq9ymMAU1pg4T5k2r0irmpMAv7gAqzX1YfwSZZFkuP7YhttzAr8tCftx+IhSaJOUkXGx8jVJiqXfWzxpfusenwfRdhpFU8ZLwHli3aCSj4Wk7ClAHlAp6wEAzEWdsWztelFooP4QYlQ4yZC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=cdQa92cF; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="cdQa92cF"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47698757053so28070331cf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 May 2025 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748616628; x=1749221428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGRPVLu6Tlbf8okATr/kZX+v/mGty5hiwEauJPQTAPw=;
        b=cdQa92cFW/+gA+NDpewrLR97AQmQIDcgezLiVt+ujh1pHkAihFNYU8/sW6sgmasQ6J
         5xiR/yd1qZik03THBuDcdXGIGUtuMX/Gqi1ee8zT0uuyOoCPubFzeXc6yyxkfaFmK3D3
         qps4nrlDM3KBLkthn2DXlKHr/cCVnHnEd3wfpnFnZm3OYjrMapmw6SNYsgD0KW00r3uI
         XPmGrpvMY7Z9tihWwIOV2jnoM3E7LT+mQb8gDoPav3mPwNS8HbdABG+pa+mXHa4xIj5R
         SL2YdWZvet+uGiRcLjgd3suvbWZkdpJDhEeBACh4ybfJUGxeqvz41uL7QRyq744kPwrF
         U7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748616628; x=1749221428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGRPVLu6Tlbf8okATr/kZX+v/mGty5hiwEauJPQTAPw=;
        b=QTgD/G/9FLMivWRKgTUZH8F0eyycmI2zwLPmYy8D8FZZ62xJOqhbDVTGGXeT/ExyT5
         SGm3z7biAm8PIpSZONUbh9BSBVaFPpCQcxwxavDM8dPhw5oB1o8/xDhOnl7gyOovnk8M
         qByCrHsemL6BHVqz8GUK7o5g8K7nPWoJTH7zu/KftXfhqBp+gIH06Jmaau3lBRw/j4vn
         ASpZx6CnTNl4e5EWv7OUHX0JkRNTqzBxUGwUelglULG7NRkVcZ6Tn5dIsb/Lr+aQ6Q4c
         v6Eaj+fadxRAM1R0L203YeC5otTP6dLazE5hbN3BAHV+TKqxX8hzLdltD+gaR14cUYba
         mXCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1Xv/Bqa5ejnctMtpfbM0zoCg+aC8ei87N4odtPI2CwpTLAupq3vuuymbPap4/NtfQxYiomlxWC9ai8C/SOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvePi86QM0HMIfJHcQSIDpHDiYSHCZdUmXpqQMqjbbAzBiVkWK
	hjp6URT9xuXhfxU//Ok6Wmqb/vWRpWIJGLfUAYCTSJMR0l5wO0JifvS60eRP/Ktb0BQ=
X-Gm-Gg: ASbGncvQ6fGaAPRtoWhxnP7EZmWabzfMQKcu139e+Mw6vRO6vBqFz3Ibr0F2JZM9J0M
	N5oXeg10+CBWU+WLNtm9itlyBI2sU/cCHUo3BsI4sPQg0unlPF+tqhETx5jZ5kfRFIqlIFDFvuQ
	Onj4iwa/47fbb12lB2S26Z+RSlSzRICfk36bQE24Q964Zv/7nTAa5zv+QDjLLB4vfdl93MZ/yWu
	yNyZO7QU62i7iv3BIQlxSlcTGHgzgYH8WelwcYnLpO4zzc1bGVtL2gkO4CAb8h6Gd6cveFgSk5J
	dRjucsTkCCbooywjARY2pUpnQ+3tSED1mM1LYN5B9BXe8rpJFsGFfdvS7S8pNbt7OI9m2rurgVI
	ZA6c7GxYj0dQzdFZ8OjYz5wTaqKQPzat1PIg+0w==
X-Google-Smtp-Source: AGHT+IGBTeaFU7Lun0cxRzLoVYefmxYGwMLzyx7A2cdWFaW7Vade0KEgRRURnWiOg3n4NiLrm3GLmQ==
X-Received: by 2002:a05:622a:229f:b0:476:8f9e:44af with SMTP id d75a77b69052e-4a440074887mr56369431cf.29.1748616627920;
        Fri, 30 May 2025 07:50:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358ada69sm21450411cf.29.2025.05.30.07.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:50:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uL13y-00000001F0K-31WA;
	Fri, 30 May 2025 11:50:26 -0300
Date: Fri, 30 May 2025 11:50:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, dakr@kernel.org,
	lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
Message-ID: <20250530145026.GB293473@ziepe.ca>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <20250530141419.GA292183@ziepe.ca>
 <DA9KQF9CY77R.77PBMU8Y1FPY@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9KQF9CY77R.77PBMU8Y1FPY@nvidia.com>

On Fri, May 30, 2025 at 11:44:26PM +0900, Alexandre Courbot wrote:

> I would be fully on board with a simpler design, definitely. The reason
> why I've tried to keep some doors open is that as you mentioned
> scatterlist is used in many different ways, and I am not familiar enough
> with all these uses to draw a line and say "we will never ever need to
> do that".

I think it would be better to grow as needed. It is hard to speculate.

We also have the new two step DMA API, so it may very well be the only
use for this stuff is very simple mappings of VVec like things for
DMA, and maybe this all gets rewritten to use the new DMA API and not
scatterlist.

Having a rust user facing API that allows for that would be a great
thing.

IOW I would maybe reframe the task here, it is not to create simple
naive wrappers around scatterlist but to provide a nice rust API to go
from VVec/etc to DMA mapping of that VVec/etc.

> Like unmapping a buffer and remapping it later sounds like a plausible
> use (say, if the device's own DMA space is limited), so preserving at
> least 2 states sounds sensible.

I don't think so, there is no such thing as a "device's own DMA space
is limited" in modern HW, and if it was a problem you wouldn't solve
it by swapping the same scatterlist in and out..

Jason
