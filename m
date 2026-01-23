Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D45523D28C
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769159939; cv=none; b=RrmeC7wIPOnMme6jSsfmyK107Atf4REdIwuyR1J9ju3yT2Paq2HRMGWuuPOb03vNMvcvAb9m/rNhgCC/9BpbaBre1MKYZ9eyW0cqzHMT04d6nJtDXqSd+z45JeLw+lhVAbpv0woO+OM0Pr9NYzK5VhW28YPkOSOUT0nipSdg0T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769159939; c=relaxed/simple;
	bh=rgWiuG9YUCUab1/DHJq8s64XGf1uvWXAsy0fbSRqhdI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OND5s3a8FQ6pZKlf83F9UltJX5J2yq30yqRI8qNXKtQ3cosDwAQd/7Q1kooQPpqpq1/9d/GFYMKQKD1gM9anC/iuE67YFhZRb3GdgbVDlUbqWTEpFocexNvZveOfYwAxjpseK1hS8kVsjsaE/bNcCfnZFsJm1x3szcitompWNVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vQHzZTHY; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vQHzZTHY"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47edc79ff28so12464675e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769159937; x=1769764737; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdFhogTevc2NiNVJCy1e6VQGbYTDXskZxMvL8rxPQKg=;
        b=vQHzZTHYfLa7XqX/qIWUeSyW8f+EpzxuaR7PWIM6S8IHOm8Dsl2Y3swWAKcZCprTTJ
         w22xW7Zo90wHBLEgu27mjtEjHIQVok4ZYYflxmIr1e2ykBBd0JoO794PDQxt9atin1/z
         spC+/Xz30odQpkA7CQMkWLSIbCFMwMFJl8OMC0riRlzZeLIoyThJmvMF+1IFFAYXQ83E
         awQgxgfOCSFM898uCEkyCdEJLkC2ba64i39pk+byLBsYIpFGiFaXrmtZ/eC2qEyjCcre
         f7W573aA+UNf4R6o7C/mSz8E6T60lpqo/EU6nVayDJaBgUOlQG7vqDQjrMghD6aLwRFJ
         39dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769159937; x=1769764737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdFhogTevc2NiNVJCy1e6VQGbYTDXskZxMvL8rxPQKg=;
        b=AJ4868+bmhCFKAB/rPILoyKKO5RVZiCuQVcOXRk3GvM/MpfNuXXcu92SDTDmKYzHA+
         26MP0vrmjtfwz20DyKdcMopf4hrZElRj4EzndutK6v+MnSs21YHFT1S/9LIRHEY/DEHB
         Mr5QoPEmJDzaCe8y+kudhFRczWUSXkbL+AT+e0QaLgfss4fKcoReXmp13MaIBSavIQZ1
         OiTeLzdN4z34y+cnvZfwA/FSFRZdYzdYRST7y8UvfZMvcCl8add+1LevBmHGsWjoSrWK
         CPUpNEr7/QDE2UNbwHfApckWVgtFx8imGkprNJY/4vN9KniIVrdApgw8Sh+M/+6W/vsK
         z5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUVnG+WNv0COVa4HAr5ADipM2xU2YFSZD5l0DhDXVkwDtkq5sufrt9av5dVAhCzyBvyLrnkq8oefESsw3oI4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUNQXSz+KkCaZJJVkhcrHpVvgLQX5w9pG0JdP1xDQnUu9PRsAC
	EnBeV7FQnJ6yvGlFfvq5lo5agxevmGvaHFYLjGFs6g00GC5ABbdSzKqYA2N9eFvp+El6/Pk+liY
	lm6BHmeN/QSVQcR1GYg==
X-Received: from wmbb3.prod.google.com ([2002:a05:600c:5883:b0:47a:7874:d5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5253:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-48051256401mr10649045e9.28.1769159936687;
 Fri, 23 Jan 2026 01:18:56 -0800 (PST)
Date: Fri, 23 Jan 2026 09:18:55 +0000
In-Reply-To: <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com> <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
Message-ID: <aXM8_-8trM6FqQWu@google.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org, 
	miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jan 22, 2026 at 07:32:55PM +0000, Gary Guo wrote:
> On Thu Jan 22, 2026 at 8:42 AM GMT, Alice Ryhl wrote:
> > On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
> >>  #[pin_data]
> >>  struct Regulators {
> >> +    #[allow(dead_code)]
> >>      mali: Regulator<regulator::Enabled>,
> >> +    #[allow(dead_code)]
> >>      sram: Regulator<regulator::Enabled>,
> >
> > I don't think we intend to ever use these fields - they exist only for
> > their destructor. In that case, please prefix them with an underscore
> > instead:
> >
> > #[pin_data]
> > struct Regulators {
> >     _mali: Regulator<regulator::Enabled>,
> >     _sram: Regulator<regulator::Enabled>,
> > }
> 
> I wonder if it makes sense to request a feature to mute `dead_code` lint on
> certain types which we know are there to represent a registration or resource
> enablement.
> 
> Currently rustc's dead_code lint has a builtin exception for `PhantomData`, but
> I think a lot other types should have the same treatment, this can be useful
> even for other core types, e.g `PhantomPinned`.

That'd be an interesting rustc feature. I don't think it's possible
today.

Alice
