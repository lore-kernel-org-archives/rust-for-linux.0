Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782C73161BB
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772351086; cv=none; b=PXwZcXR7vSn3ANZnPbaza+QOZDvoIBrCd5gTfoeZEeDyyBpf83kK4p9pnmiAr6vAJghON5cG1OgmhT7hCYXBtR0SAoDCM2kTw8vVzoNE9s6EoKpvJMTEGz7fmy+t6xVD9tOi/bnddIYgEz2shaiVjz4jLVGUSVQOmrxpXueDg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772351086; c=relaxed/simple;
	bh=J9z9bh9c06iWNDRF5OCoQ6ZSl5Mj8OBKTYo+DFzcsmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeA6OJYRnB8CtA257ge0nBrSOtlIxwyWLdrIMz0Togn9u68C4K9l7ygRZ4PA9TJvF8UVMTgBmowMM9kKVREqILkC1IDV+F5oSO1CJA+mom0wa/RxgI7nxRmjAjBLDH7QQxi1a4wCOPHb6SPgqgW0UORXt5VsdY1NodmjDqPVRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fyRNXKKf; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fyRNXKKf"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b939cfc1e83so63572566b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 23:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772351083; x=1772955883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HBu57SPUbDu82uKzpzyoVii6f3eIGOPB5czImSZMDC4=;
        b=fyRNXKKfgVBlbIvCDX3nkZnOVHtK4eGSMQZ6AuaCmCPCLHwSdKh+3T1hP1FhqE28Zr
         D2h/hTb/xgalUKfASbFRIJAb1G8DnWGpAZF33O8ta1yCny8NaVeHIwQ6Avkby6Vp57z6
         430ZKN87Ymlc6MTg9htybnz7OrPFDFiq4SMwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772351083; x=1772955883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBu57SPUbDu82uKzpzyoVii6f3eIGOPB5czImSZMDC4=;
        b=n+3WckeY98W3nf5crLEFkEIT/+OQcGpVKD0bjK9wVBHPvOAyVkiXLJtlRfLRfxmO7o
         r4Jb1dLZx5CqYLQnMesUwRvvg2BMSHzvX8mN1bhmKIjI7MUdPY715fVDMwOHprH3zDbh
         PK8Z+HwnTPOdbFP1MJ2tviSba4Jn0Tj+milStxN6O3XHf57N2r+gMv0GHnVraRc9sLIe
         Znj8jJ0j+bZml2u/AvCH1VK5GVeO8Qaznu7hYIVxQml13tYOkcZVOHLQLG69E4IKPMFb
         Ja7nhbOWdYVua/qm5N6LOzKmt8egtkuKsEAr8AQz5Oydz2q1ukPCGYc3HIzc0y7iEb/+
         HwhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmheBUK6W0LEznIfoYH6sxnLwAvkl+oXSfHR0sVorKrqJtae4hvhRfHMylfxGOvzBsqbDQ4So+g/ecOO52zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB2Z0oiVOWt7hxElnvm9BxpauF/7ubqqViJem9AFE69XjvybHp
	DFhTFJ1G/ma3cype9mI7eQekrgo4A0Nd2ttDpFgrBigvMO4VxpbqlR7BNrAKnPBgowTfIWu2DNx
	kwFePjbc=
X-Gm-Gg: ATEYQzxoifdALpvE4yZFtZgCnXxyRu6+2q5pvq32zWYdsgeDgT+LHnhFP9a7VvTEuhg
	ydHIeJSyiWBpztlGLKC+qavq7XQWUfhMM4MuGkfJGnWAzEyU7iFjTg/kW9KcNXrUvW6kQgsLfoj
	/M+vL9l1AAmzlaJdKVcc2uzE7aGQkxGqBsusJKVKgMoRGS6cSNJc7pZyXdBv0OpyFApPUsFfnZb
	MVMmb2CNEHVKN7zIxwP3V2fNNYNCMa4r5/MkThg21sD/XSrckw630bl2ZScxDYrKdObF13UUDNe
	wX9LuD7nnztZ6WLxUdn0IsWU/u9EvJjOUD0iTBUkY0GbTD2mVshbbyvWCVyGFWpgouFHLpgew4C
	L6tByudznSg91CON2upw5qgezLsunRXOLnqAmyfupMWNXczsHuWGqy8xYpSGPX+SpxJuNpFLvP2
	Zsq5Mvj2WiDK4VbeOfKPLVCaU52cuHaTgh7zY7tKFTEbOwIumwXIo+8wWG2pFYjTXSPaw0vzUV
X-Received: by 2002:a17:907:97c6:b0:b72:58b6:b263 with SMTP id a640c23a62f3a-b93765c7e06mr545586866b.60.1772351082540;
        Sat, 28 Feb 2026 23:44:42 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm331900666b.61.2026.02.28.23.44.42
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 23:44:42 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b934fdced05so458534266b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 23:44:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzX2/rmm9mIzWsPsesHgqNhtnzegVO0lkPBnKOLs2XthgCE6DcZgyhYNtmi/UXKa9xnoARXnF+bIvG9rxxaQ==@vger.kernel.org
X-Received: by 2002:a17:907:6d03:b0:b73:8639:cd96 with SMTP id
 a640c23a62f3a-b93763b709bmr502876266b.24.1772351081725; Sat, 28 Feb 2026
 23:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
In-Reply-To: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Feb 2026 23:44:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
X-Gm-Features: AaiRm51AXIo-CzgV1FfzAgAuXtJDcOCQPj10yj93D5oHz1MjThSp6lmu827woIY
Message-ID: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Feb 2026 at 15:04, Danilo Krummrich <dakr@kernel.org> wrote:
>
> Driver core changes for 7.0-rc1
>
> - Bus:
>   - Ensure bus->match() is consistently called with the device lock held

So I'm coming back to this, because it turns out this sounds like a
horrible mistake in the end.

You document it as being about consistent locking, but it appears this
change is what made the "firewire oops at driver attach" turn an oops
into just a silently dead machine.

In other words, it makes fragile drivers go from "you get an oops" to
something much worse. The oops becomes unrecoverable - with typically
a black screen at boot - because the probe is holding a lock that then
makes everything else come to a grinding halt when the driver fails.

And yes, this obviously only happens for buggy driver and doesn't
matter for _correct_ code, but about half of the kernel code is
drivers, and that half of the kernel code is also the typically the
most badly tested and often questionably implemented half.

No, not all drivers a bad, but there are a lot of drivers, and some of
them have problems.

So if a driver problem causes problems for the whole machine, the
driver core design is bad.

I really think this should be re-thought. Perhaps just reverted
outright. Instead of saying

  "This inconsistency means that
    bus match() callbacks are not guaranteed to be called with the lock
    held"

as if it's automatically a bad thing, just don't depend on the device
match having to be called with a lock held if that lock has this
problem.

It's not clear why anybody should *care* about the lock at driver
attach time, when nothing else can access the device that hasn't been
brought up yet.

Put another way: the downsides seem worse than the upsides.
"Consistency" is not an upside if it causes problems.

             Linus
