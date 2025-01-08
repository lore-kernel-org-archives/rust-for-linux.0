Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF991F76CD;
	Wed,  8 Jan 2025 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339200; cv=none; b=hBbeemfGnKQC4CFt1qtL/lcAoF7EikDicD0Oz5rgn7YlDDYSA+tGK6cS+FwBw5hAUgIjs+eg9l9sd+VS3SQwMgJ+wx5yLSTgm6P0uodBV81TnqmC1PnPA6c+RabJXUcg/SeUr7zgPKyjgFsUCerBNuIBc24up/enpFXFAu0f3LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339200; c=relaxed/simple;
	bh=5KYg9/0yJZNBhIV0w7CJaMYU/vNi2eZZd1DkVtRdQQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sL0OTWuG+cqERc3HsUo6iz4K2nWi4+DUf0pYSzkmhK5k23uwLSLFnj42vMpopETGsjVD5cPpAHg/jdWJ9UkCxifM9ZTyktqOrangIC+SRROODFeE7bOb3TVJTScGSjkQ2Tpb5c0h2kRWQZj/Rpeo9v2kMDZAIsCpkFrJxxsebzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwjBJo8c; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwjBJo8c"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c52000fso16544181e87.2;
        Wed, 08 Jan 2025 04:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736339197; x=1736943997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0gfeN+SuCgEzLzAVq2P0LR/0PNaBIiceVwqkkIzMjw=;
        b=fwjBJo8czoOzmgWStTb66uol/j2J77zgmRz0myQP6JztJekWaUkXGun7vUvSrllNLO
         GGQ9WqlyAo5wIeo2lnDB+bS81+OwAMgAxdaBsxKQ2EzrRCsRG+JBOH4ugr9TvXz5VpTX
         krpvTDkwr8+ZQyu3ZYMOsP2hpFf62CkNDHFyURVpoWDpA/k3NCGu/HZv7ztmyTm/168j
         H9eAE3C19KAJ3OQ+g6pd3kiz79l/AMpJ3sEhu1VaOaEp8ZYLjVcPT2JlqJ0ePHGCXhXZ
         ARbzAUUAZF2M6DynJ+G4ZdonlmceXqRkO/sY7cQztA8mgXamxVrF6dJsMpRFgH9rqg5a
         CRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339197; x=1736943997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0gfeN+SuCgEzLzAVq2P0LR/0PNaBIiceVwqkkIzMjw=;
        b=LsLkocOabaD2YOWJvOUixo3aaCEsZA7WG+jUuUZ5LSNtnETEaJ8B3TWgORYxd4DBsf
         FLDvOVGsWorOJbeBfg5mMcAg9XAIS9/ZkXmwGudhow7Lp/3abw2tNVkxWD5t62iXGEVu
         LE21oG9F4AZqw/Xuuuc/XodunZNUXEtmSwdMO2i+/q9MsQ+rFpyO9YLaBd1D1XF7fGQE
         6E82tyMFAQOkTmmyfDO2HYsPs1utYF+mmidvk5tvG/8CG2WeOimrVQ5COxfZWLf3xp1h
         LOPog1JcmOKCDmvhJURlrKLsKEE0YZrNCP/t3nzDxpWCVxIKdxjlyiq34rlRxh0kUBg8
         azJw==
X-Forwarded-Encrypted: i=1; AJvYcCXsSlpAPY2PKr/d9hecqEFNyOTA+vfWJvOvdx6Se6c6STqvBwJsm+KQZLXfD9KZN0XK54+cZWDjUtitb0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFqolDo9Hn5NQwHZ+jOb8aaFfzz/DqGzdX6gaPQOuLI4hDxGa0
	lew0rQ9Nj3nAd2hYIP59TYIFO8JC+20juHsAWI49TNotH2vGH2hy
X-Gm-Gg: ASbGnctfV9LYH9qFYOXxLVKB3/QwOksUGGLTdpp1pmMPatQGyvqhScroBSoaNXsSR2a
	oAK8jFy7jkOo+5KQ+eoltL7Uqfnpt5REGwZZlCtGF5Vx+bf1qjupP/+pkcA9okMx/4uzecrHi7d
	gYEMyl2P9khueT3QXEB6RgOUTMLbVB2yDHSOIDIpTuH2SSThUXcpwCy1CQqQLXX8V2ylCW00XOP
	WhDVMTFpYt2kuy4CTsFJ5LK0T/Iy5Nkn3rEDbXHhLRWO71xaWsVzPWMhqn4btpxTDyVWG0C1ktj
	bvFvQKhj0qndYbDj3M++9eweV7w=
X-Google-Smtp-Source: AGHT+IHvQlmIb7RLno4uHBOmUskv+F4p+BSpZBj6A8Ym0/fvkduXlIkPMZ4yidM7h8v5qd/h576RyQ==
X-Received: by 2002:a05:6512:3da9:b0:53f:f074:801c with SMTP id 2adb3069b0e04-54284815c7dmr808380e87.41.1736339196661;
        Wed, 08 Jan 2025 04:26:36 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813692sm5397107e87.125.2025.01.08.04.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:26:35 -0800 (PST)
Message-ID: <0af017a8-8796-4552-aa16-bf2735f7b4ac@gmail.com>
Date: Wed, 8 Jan 2025 14:26:34 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] rust: add dma coherent allocator abstraction.
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
References: <20241210221603.3174929-1-abdiel.janulgue@gmail.com>
 <20241210221603.3174929-3-abdiel.janulgue@gmail.com>
 <7c8e84e7-a212-445f-bc4e-ef65dae7fb29@gmail.com> <87ikrflxxg.fsf@kernel.org>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <87ikrflxxg.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 19/12/2024 13:22, Andreas Hindborg wrote:
> If you include the `Allocator` trait and the `Pool` it would make my
> life a lot easier when rebasing nvme. For now I'm just going to use out
> of tree patches that include the dma pool.
> 
> If you do not have a user for dma pool, maybe just include the
> `Allocator` trait and indicate that it is there to support other dma
> allocators in the future?
> 
> 

Would it be okay with you to have the basic functionality merged first? 
Once this is done, I will send up a follow-up patch that would then 
include the allocator trait and the pool.

Thanks!

Cheers,
Abdiel
