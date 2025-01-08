Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE9419E992;
	Wed,  8 Jan 2025 15:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736349392; cv=none; b=BifN27TzUd/GGAWGEKr6nYxYloAPqXGAoI0u126ZW+pF7fkak5jzg7d6IOxbbMM90cTaTiAxjwwOvbZSGdKMf8/l+cL1SgyDggJjP2P/8/8ds7weNU6ADFJTUr+Tik5IOwxK3EioC1yvs7CWxYfrTEBys/92ICV1Jks4ygdhrcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736349392; c=relaxed/simple;
	bh=/eiXBVHDTwGJJtJlHteOUmsq2tGFc2YykiondSQFJKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEXU919QFbVDBnE1UMt+IfNSgK8rziqQHaR35oqAeirTTTrBHKrRGeaP+J/JorcCnEU+inkPJV1/G8ZSLPKBDoOhwexd3RukzRe1iku+hI1zE5FwMZ5bPhojO6sc9Foc+kkdKv3VrQCKDbolMZGR6GxOFX+SIu9s9QxIRvBkxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVqFo1d+; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVqFo1d+"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f45244a81fso3364616a91.1;
        Wed, 08 Jan 2025 07:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736349391; x=1736954191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eiXBVHDTwGJJtJlHteOUmsq2tGFc2YykiondSQFJKg=;
        b=DVqFo1d+GAeln3vwsKiRkqdFP10oFfgbRXPXQgCOoptDZilcLDaZv4ibalrV/7rjf3
         2avCmE8c1SSw/3asGJP7m+ia7c/MC/gzJ4Rimt9LXSMvtcoL1TkFpWy8zGXSgG4pdq9o
         YHFpKbnH4LutqKglv0LAWcVBHFsMIFNmVlV9+19VF2Le/4qji2h+aSA6ZX+cVq7IcW9Y
         ZQyfSauAJR1vsBXEzKTsKlgPE8Q5XBLa3sUTKIEyMi4l6kFvvvnK6Zo8pMaSeeVEnJv1
         cf1uxriBhdcpTouzYo6+MO9mUlMvmsrcln4N+BP+S5vc7B46Okidcxxsmf8cSwcxJaJP
         JBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349391; x=1736954191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eiXBVHDTwGJJtJlHteOUmsq2tGFc2YykiondSQFJKg=;
        b=GNXubNwy+PMIhUtCASPqXUbHc9mjc14QZmaTNmot5i7WAZdhLlrdvW8E7gFOoHnMpV
         jtGK1SlMeIt31QxBQeRKIqPyPEv9orrQmiSesdUtuGu3yI3krIW1y7EdG0r79UdUTL3e
         AGCdvl/PcIfOa52DCxQZMKC6wyT0NhbDfxcejEFmpGp89gP++KgWo78BKqXisYvXEcRa
         EgR+KbIXN2nowxQlAREaX0dlcuvVekqfq6L1d+ZUxPwqPnbIfQ9RluL1qjL1u9SrPxVn
         aS5dF03tfTFrb0kdCX5MAULyH8yt6QZjMb8ZGp3XFiEZw1F/cOGBmfDTE4wwAnHt8Wyx
         cHEw==
X-Forwarded-Encrypted: i=1; AJvYcCVcbXhp65whccYcg3sP1p8Pe6vh8hs66DFDzvNBLMBJ7dgIbdp6q1NcWvXu+bDlJb5CSNXEpB4ItnJG8ts=@vger.kernel.org, AJvYcCXybyCnq3E2pUQ0vwB53kJ2LEPg8CsophA1VqNG5n/fM4K76zXYZdolf8JDrfb0LCRwfIGtgNLbxziJ+dX6OV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzn0nPut5J61p6zubHS1WjFnk9agOTHvXOAZvxsAN0HIhughnB
	LBJJmfVM5ttei/XMivzwMUI7/JRl7erwZ9Nt7/oFqJ1UR+OoGSSx02au7JYQSZkSZo/ylk5UKue
	qXvWPIZkwXb6Rqgs8wmeSSAC2rHY=
X-Gm-Gg: ASbGncuz3X7FfaCeezzoiS2drjrYeTGeXDoKvFdTJ2ylqGl8N2EePPI9q9iKlVLyz+k
	Fc9/tLMXKY8d4QlV0hczZNNL16ddhdFPXS2dz4g==
X-Google-Smtp-Source: AGHT+IHYSKFeCNvilE4F1uTmI/sDWQgh4GcbgkQPlcT30Ii5QRvkif1y52wxlNJho0Z+03oQIwxSVCdYCMjwHnxiEcU=
X-Received: by 2002:a17:90b:2808:b0:2ea:bb3a:8f09 with SMTP id
 98e67ed59e1d1-2f548db69e5mr1674633a91.0.1736349390695; Wed, 08 Jan 2025
 07:16:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com> <20250108135951.GA18074@lst.de>
In-Reply-To: <20250108135951.GA18074@lst.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jan 2025 16:16:18 +0100
X-Gm-Features: AbW1kvZxuTppS-rhRq1TCeSvgDf9A3MtNpdv0SsX_92MLs1JDa4MriVw-bUoNAY
Message-ID: <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Christoph Hellwig <hch@lst.de>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 3:00=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrote=
:
>
> No rust code in kernel/dma, please.

What do you suggest?

Thanks!

Cheers,
Miguel
