Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E60194A67
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Feb 2025 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864737; cv=none; b=u6+H2NgiOG7P3FDt/OxsVanh7IcHAt8Yy9IAeROFuMe9vVts1gEMu/dmk5uh+k4binWQfyQKSAFksOPF68FIMLx6QzwdLttsP7ILF1JN6HRsVf1+y4Lr1fYvjpJIZB+Vbtmv97ydFX8g9hz/SpMyVOXhTvrsJ/gR+WV52us3eWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864737; c=relaxed/simple;
	bh=LA6Op/VaTOhJKe72M7oQe6NRQa7SxDnVNr8EdMbdizM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA1dm6ePLEofidgtdTPdUHp6PSu2+SJ48Mh0HlbsF2FkdUHBDK8sD7gsBCN13d5P1SVbx/fThHVLU134e9uvAIdsUjHHTnR9LUwqMyTDM8xkR8uiVp8H4St6EZlTmvdgDaVyTaIzEaUeku387DksL+zDUIaMFcHr8wEOPVhWkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F8D+WlzC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F8D+WlzC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab698eae2d9so218887866b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Feb 2025 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738864733; x=1739469533; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5VkJ1I/mpTOj70lVolwV2vn4N+hDhU0UEmqKxlKybuw=;
        b=F8D+WlzCnAKjefIj2n5Sd9BrnK8hnGqM6a2t3gN9wgHPubugcTuZu6Uyox1jzn2ggM
         QAevCc0LVreq9dq/ztWtwpNoa7ZbT1tmXPZ4hhfUddxNjnyI1lvR9uDCbbUzVbZ0aGkq
         OhDnNNKE6XgDJ6J3Klhs1Yws89Nd6bCImbbQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864733; x=1739469533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VkJ1I/mpTOj70lVolwV2vn4N+hDhU0UEmqKxlKybuw=;
        b=NMIbr6zfsY2A7YiTm+GWRhlLgWJAU2uCldhBWVwWMY753qU4NLxB698Dy1TkA2TwUB
         a8OFUBk6Iwrw4VU8+npicI4a4PCxZ+3lEa4gtuyHgiDTVXiNAef7yRECNT7yI8iY1wvE
         vy0v0cMInn+CcMy3LBnDs+qfM/XHyawng75+JmIXNUIi9ZNBa1OGUXcX70H+YjKzNKHY
         GE81LvXO5nbQwvWIaNJLWB1IeFW4KwD4kXySzRf652RQvvB8BpBqzOWu+W6IYXYLF9bO
         blUqKORL/JKkjeE9hZ9sXRYEEyLE8You8WscnLrB2XBNE34qu+VOEW+lKb8m39zPTXLn
         Ctvg==
X-Forwarded-Encrypted: i=1; AJvYcCWX5BZAYcCdnddYZ0ArDou+MYV2evsZYSRH72IU9IBsD9YCy4slFQRZhJNMTVlYwgi78o92EBvIonZ4ykUSUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8cy6BXKCMySPQJw8YSN4OUie5ZVadW6DmKWRPOXHlh0wq/3P6
	C7IY4/Vx2AeT3z8aTM7c+Mf0KvN9b10bzadd8P8RGrzDFfBGbjuNnNXVEHcHIGo7U3JH9GuoxlN
	38IE=
X-Gm-Gg: ASbGnctNaUEB/Gfri020Px41+KMGmvvLj3TBtqGOxuovI+Tt45ZyVyVlIxz/h/sdV2K
	chSE4Rt1ZAabuSyx2R3SRBQktax6Vjkdzx7z23HQKJ6OUf76IpX19kRD7/hY43birF8zVqmnLiA
	NfhWMBAmHTK/BPSgtxGW2Yh9SdUu4aD6A+83lhTrKSVeSXB1FNXRMWPZUzQ1STw6o/zncWBOD7/
	PK27h65lSK5hY9Hd30B0KetVEgnBvt1hUjvPOvpyChpishy+s/c1Q1+1Rc4Y3nmW/BJFIujo5/z
	f7XTf+B5666f56WeGlXU1tE8ftdnQYxBqBNJ0MmD2m1hctWlyyFSEZjmX1nbE1QBPA==
X-Google-Smtp-Source: AGHT+IHPAVa20ZmkCsU04bHXaUH4nF8uy7NRBfkxKhNt85ThDULxWV6qUGfGGnoby7fe9BBLoWvVRg==
X-Received: by 2002:a17:907:d90:b0:ab6:621a:f87e with SMTP id a640c23a62f3a-ab75e2f2a83mr1076510366b.41.1738864732919;
        Thu, 06 Feb 2025 09:58:52 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e7166sm133173566b.90.2025.02.06.09.58.52
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:58:52 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab737e5674bso224284466b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Feb 2025 09:58:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFrU90rVAtUGEMbQpNWNvm6D2ZDSi7ZufEA0MaBBrJcCjRaXZckUc36aW1/4IJGx3R9nMDUWqDjfW3Jja5WQ==@vger.kernel.org
X-Received: by 2002:a17:907:7f0f:b0:ab6:d6c3:f1e4 with SMTP id
 a640c23a62f3a-ab75e2f2393mr881845566b.38.1738864732223; Thu, 06 Feb 2025
 09:58:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z4D5a5NYrAbNxUL6@pollux> <Z4kG5AcVeQKegLnb@pollux>
 <20250128092334.GA28548@lst.de> <293df3d54bad446e8fd527f204c6dc301354e340.camel@mailbox.org>
 <20250130154646.GA2298732@nvidia.com> <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com> <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com> <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local> <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
In-Reply-To: <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Feb 2025 09:58:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
X-Gm-Features: AWEUYZkS6oHFUn-g-IGnkz4FJ-irLv59VoaubaKbNOcXpu9gE5INymKIQSe6irw
Message-ID: <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Hector Martin <marcan@marcan.st>
Cc: Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org, 
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	airlied@redhat.com, "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, 
	DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 01:19, Hector Martin <marcan@marcan.st> wrote:
>
> If shaming on social media does not work, then tell me what does,
> because I'm out of ideas.

How about you accept the fact that maybe the problem is you.

You think you know better. But the current process works.

It has problems, but problems are a fact of life.  There is no perfect.

However, I will say that the social media brigading just makes me not
want to have anything at all to do with your approach.

Because if we have issues in the kernel development model, then social
media sure as hell isn't the solution. The same way it sure as hell
wasn't the solution to politics.

Technical patches and discussions matter. Social media brigading - no
than\k you.

                 Linus
