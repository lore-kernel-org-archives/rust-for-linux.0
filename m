Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C808E1A314D
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Feb 2025 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953231; cv=none; b=q+nSi58vRzlIRuQW9XVFrpUjJ0aw77axKtd9d78KKlYoIrGajlJozbXVMQJOPth5dQUiTPl2ZgnddHfFo8g3CUdE25izqdVaGs/+hFWODaaul60qwEv17w1JFeh6vznor3JWl6rBGdVGfpn1C09GIKipXH8LmYdX0rmlZ9IOv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953231; c=relaxed/simple;
	bh=nsvreyKbULHQViKCHN8Xzu3sXBSkdh4jaUA6rkaR12A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGeQirjHS+YVEF12ac4E6Wmq8w4Ep22EGwiDAKk9yXXpAwW+t2mNjEOV4n5q1V9kovMdioGdbp9IOIFx+BbsK/YJi0LDQnI+SsH2xvuuJLokemzs/ro+X5TuGqy5ivhsCLi/DZJwUhofBQsiR9RQ3Z/Fp0OidBL8xBWujP+eP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CxFrynVR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CxFrynVR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso430075366b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Feb 2025 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738953226; x=1739558026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LSfjVDdFy380pTqlr6fb1AB4PEji/7GivU8X5uTYCzs=;
        b=CxFrynVRMdYJ1z5ipIOnNZkk5YIZ3nklkzYphTO0Axi/l7+Tmi6R1BwluICDOePOY7
         USEhfp+z9+3uUO+n8YE68Vn+adXRLXlJ0geCvE/CoQGUSbwuGQxGx10y1jOdnEdnbTwg
         W4Ui+ELp9NU9SiHV7VeoewAPcQOMfo8epcnaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738953226; x=1739558026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSfjVDdFy380pTqlr6fb1AB4PEji/7GivU8X5uTYCzs=;
        b=Wd3fb2EPkQqLQRpj2/KgfRcH8f8u87gsyiEy9c1aA2fq6sWmSm5dMzkG2weewnmldu
         6/BGlDEzn5LAr0CrFG9UeJSh2x3ZXvlSy7QPyKQ0iWQPfs3Mbbkz+uQS2bvFNRSWX8+B
         gkBhzesJubbHKlDvK1gRQkE42Jv9rji4Gg1mxpTpPpz3Srjve7Fi6op9RHeq3Si6/iKt
         xOvSXJZdyTyHKjyMw2gxmsoe9sOfAsWT5zvWhuLDCz74o9fGTWs+RjY2c4yMrI04Bo9z
         EZ+qaqGTlRGwJoNmJv23AJeA4EvRL50xkP16TGSdmWSAXhpwovmGrkAczMezLm2Vsk3D
         /98A==
X-Forwarded-Encrypted: i=1; AJvYcCV7SeLa+5cXoxJzUUSi2lGHEP/sZ05mip2ZzUqQylFha8zC5rPKayNwW+TA/K1rYsw4XqcEu2FhOach43+fIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwyJ/ULghuuCYJTQGDKAqkeEPLqfmorKqrAMw3Qi7QyElqWuE
	Yudef5OMvY6rH+9HPiUApakSPe7YUq6Ox3rhquCQdMNOFGatfHyc8sE1kayKJP0sZzVJ0O6cyRu
	16iE=
X-Gm-Gg: ASbGnctDS6FrgD9g9KPEp3gVQdkjO0AB4Y3M9HoxTvQl/+n7A/9cYHdnv1W0w8E8W1G
	MCuqpOP5mQCi9s7Q0vFFoDrM5uUDdCjyeMCcVmsTUa6UKPyxXmyItGfTc+WsZg35MrnYgF6tM9y
	Fkxx+KxJGaXmrAu5gW0affCUldRvsexSGcjVfs6F13OlHMGkJOc1ZqSf0VXizG0ddc308wJgr/E
	6FbnE1rh8iEvA/H9sxEgaJzYOCqBIepk/1LzdVXXSVLnVH9oGnJDfofVoZyasPQE3NKhF/a/GOM
	Kl3jWqqaseX5vEwME/uCdGXPOeDke7i0TLTALuQFK7jOcyJICS032P/oqIWMp5Tnkw==
X-Google-Smtp-Source: AGHT+IG4qxKu1H4ug55SkDzT2A1yLqtdJrjsp5VljEFVYagc4yZ99IuhrSEpA65bIZyoU9AMoHMbrA==
X-Received: by 2002:a17:907:7d91:b0:aaf:208:fd3f with SMTP id a640c23a62f3a-ab789ad99f0mr484281066b.13.1738953225875;
        Fri, 07 Feb 2025 10:33:45 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78b4634b7sm161061066b.56.2025.02.07.10.33.44
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 10:33:44 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dcef33eeceso4353915a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Feb 2025 10:33:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUL+4SS29+nZbAYG1KJNbOZGRa+oLaTR7xmoFhU1s5MpRVpTHhGgyf8sz5jE4Fz0sUR8PB/GfXAdPUlHCW4Uw==@vger.kernel.org
X-Received: by 2002:a17:907:3f12:b0:ab6:8fda:3bcf with SMTP id
 a640c23a62f3a-ab789c85e91mr475100466b.56.1738953223934; Fri, 07 Feb 2025
 10:33:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025013030-gummy-cosmic-7927@gregkh> <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh> <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st> <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st> <Z6UPXxEJYpanU9iU@cassiopeiae>
 <4c0a7cf9-26e1-4a19-8a6e-7c30bc3aef86@marcan.st> <20250207-mature-pastel-rottweiler-e6dbd9@lemur>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
In-Reply-To: <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Feb 2025 10:33:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiQUya5_zTwLFNT2XkX-bf_H1vJiJ3zuADnO-3EwOOjVA@mail.gmail.com>
X-Gm-Features: AWEUYZnMc9rrYSL8b5KBAFdfhmKQWSDBm7ZGh4b76ktZGQGeBJNjsWmuQH4lWbE
Message-ID: <CAHk-=wiQUya5_zTwLFNT2XkX-bf_H1vJiJ3zuADnO-3EwOOjVA@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Hector Martin <marcan@marcan.st>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>, 
	phasta@kernel.org, Christoph Hellwig <hch@lst.de>, 
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

On Fri, 7 Feb 2025 at 10:02, Hector Martin <marcan@marcan.st> wrote:
>
> Meanwhile, for better or worse, much of Linux infra *is* centralized -
> for example, the mailing lists themselves, and a lot of the Git hosting.

The mailing lists are mostly on kernel.org, but the git hosting most
certainly is not centralized in any way.

The kernel.org git repositories used to be special in that I didn't
require signed tags for them, because I trusted the user maintenance.
But I was encouraging signed tags even back then, and once it got to
the point where most were signed anyway, I just made it a rule. So now
kernel.org isn't special even in that respect.

Now, kernel.org is very much _convenient_. And you see that in the
stats: of my pulls in the last year, 85% have been from kernel.org.
But that is very much because it is convenient, not because it's
centralized.

But that still leaves the 15% that aren't kernel.org.

Since I did the stats, in case anybody is interested, the top
non-kernel.org hosts for my pulls are github.com, git.samba.org,
gitlab.freedesktop.org, evilpiepirate.org, git.infradead.org and
git.lwn.net (and there's a handful of other ones in there).

(And while I did the stats just for *my* pulls, if you look at total
merges over-all, the non-korg repositories are actually at 20% - I
think my percentages are higher simply because I tend to pull from
mostly top-level maintainers, and those are even more likely to use a
kernel.org account).

More importtantly, not being centralized was very much a basic tenet
of git, so *if* git.kernel.org were to become problematic, it's very
easy to move git repositories anywhere else. Very much by design.

              Linus
