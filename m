Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EAC19007D
	for <rust-for-linux@vger.kernel.org>; Fri, 16 May 2025 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747412017; cv=none; b=a+73SPICpj5423KiGTNx9WDcnVBtzUJYV20aKMVTJ8PDirBYZo2v7lzf4m4CZtHfB6A7fnEp+HxhaAhlb5+w11SfqLVMQCvRV9tSu5jN6eXqXsdabQd0YSqKB0X5//KpA/XlY9K6NKbVkSgl1U9QZtxCDbI7aaPrPlOVyKIGVqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747412017; c=relaxed/simple;
	bh=9P1+jTbwVXosxLyIAH8N3hBYwS2bNN24xtek80rU0xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XveEwNlnObk5FfACaYh91T1W1K+QkxCspmtl+buVDYoV9uZO4cj/Z+S6L6IFPHEzcKGRh7u6XgnZB42iv6IHUOzP/g12vPWtvXQG7n2y1QHQfR5Bt99m7PCuKWOVorUbdlvSMyQ1ROeGxQ2FhNFl34bu25nk5pMOZF5lwIS6Rzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OWrQ/E9y; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OWrQ/E9y"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fbf52aad74so6429907a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 May 2025 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747412013; x=1748016813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GUHk+mLN9wCUmOIy98ic92M1EtSWfUZlafBbykfM/JM=;
        b=OWrQ/E9y7IH7qjGeyT7eNPV5xD3LjKpARztKm/4zMh04iF3/m1hKW5NNfNjKVkgscV
         L8/6U0WGyFZvW8tKyhRAimn3m7T6scTRlvHLa1g66Lck2DXl4pgAzJnrOihj9oNBtTVd
         lCATgjfACA28hIbZ3dL5LsoGccN/wIB+hQnzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747412013; x=1748016813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUHk+mLN9wCUmOIy98ic92M1EtSWfUZlafBbykfM/JM=;
        b=akKGfBGj6gq4shK0kuTWo3uYClVNXNcD695C6ATZtb0FJKd6wklJDtuBlSc2n0VU7y
         ha8ax87vBaWpFR0Xv3Yt4BL4BmMicVdNkjTMwZUIvMa3f6yILj7b9+8N3Aha3af8PBLv
         z0abxMCg0SYLFQOfWhDGNImOuRqx6u+0xP53dOAm3p5l1UD4zaCrr5n+2bJY1n4VxS8T
         QBdBP3Pb01UvmFGYcx0rG52fJmUTyc5mxWVvWoHnTYOwo7hrruJ84RV1T97/B4N0ipri
         zj9+izW/T3+EpyJH/IUZpuyYKoiTouWFjidVEIL8ZdzsMLQHSqR2KnozKKIZbbDLbRLz
         yORg==
X-Forwarded-Encrypted: i=1; AJvYcCVaEsnsTz7xoC0YXSuW5tVMa6b/6xv5Y5no/qEdz9/XjFz2cS7x7k8AYK+nYo0tPgYlJD455zd7ALkHwMnODA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaunqF39wt4+6HCN/9dmyQr3u0NOM98LYsH4S87Y27rmJ3+cRC
	VgI++xggA8kfXspI8DTSV0Z+wnRJSV+sVSqbp6HHCrBhgN/0PwpH3Lh9lZ9xGPJewQU4xDNhP9P
	3D+YRS2Y=
X-Gm-Gg: ASbGnctCJW/JztKeDdcf1W0x4VU9Rhsv5tifAtnKZVJfca4G+4UrsISe/yd6B7RNwbO
	HYZg5qUfhNcsr5IZ5F2iP777YLKRhDfPZK9nxXQsuPFFRlsxPWDjltIQKD/uVjsnJZxlpISqZZK
	9MEb2ZRvZD8Q3hrk4aAORXYW3+9+ciITmzZzcBlI0L9tdMKV6kfr6dEVUhEmcbPguzgS8QUFpMr
	UNAhEAEcYCvY1Jl6uBvcsjCD89anovVj7C5FDp603HgNdjnomge+ccsCInnRT371J2Pp/Z8Ej4d
	sCiCZaXkXU/H1bED9vtmulxvtRZphOSE7o2UO57wwx+ERDhJ/hHnpRUwDj24Z4vRhbeNqbr4v15
	7lWo8n2dmnoRpPpU0K6/B1z0O5Q==
X-Google-Smtp-Source: AGHT+IFeTwLZW6ZDKufxXnK27ZfrSmchSdzSvf5LlWiAIVye9Ij/fb7NO+vPDMbMXgxdzXPePmBCkQ==
X-Received: by 2002:a05:6402:5216:b0:600:129:444e with SMTP id 4fb4d7f45d1cf-6008a3912f7mr3617083a12.4.1747412013565;
        Fri, 16 May 2025 09:13:33 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3b279sm1658369a12.77.2025.05.16.09.13.32
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 09:13:32 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbcd9088a7so3085723a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 May 2025 09:13:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1G7xhx52f/IUyEnz8mniuZN5juUSgy1v78Ei2MJoKN8nCwRnZtgwjntbtwS86Zbqp0mYkJJir8GRflfj9/Q==@vger.kernel.org
X-Received: by 2002:a05:6402:210b:b0:601:9586:8fe3 with SMTP id
 4fb4d7f45d1cf-6019586930emr978668a12.16.1747412012273; Fri, 16 May 2025
 09:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <871psp56yb.fsf@kernel.org>
In-Reply-To: <871psp56yb.fsf@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 16 May 2025 09:13:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whXcQu-TcP8q7xpYsADyXSN8GSX8sV3-chjQOo-SK59Ng@mail.gmail.com>
X-Gm-Features: AX0GCFtELJDcm4uocIJ51dUy47z0Fuppeouo-29gMxYswtmtUoCWpz6c6Jgr0Ns
Message-ID: <CAHk-=whXcQu-TcP8q7xpYsADyXSN8GSX8sV3-chjQOo-SK59Ng@mail.gmail.com>
Subject: Re: [GIT PULL] configfs for v6.16
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 May 2025 at 00:51, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
> This is my first pull request after picking up configfs [1], and my
> first pull request to you. I hope I got everything right!

From a quick look everything looks fine. Proper signed tag that
verifies ok, and the pull request looks good.

I've obviously not actually merged it, but it's in my queue for when
the merge window opens.

Thanks,
               Linus
