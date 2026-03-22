Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB55140DFD8
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 00:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774138104; cv=none; b=quxhmnxY8atmlGDSb9C1BOXMjcCnSLRQBnYVhQ2OZnzQkndy4uW6BG/JjFZfslwNY7ELEINQwTR1Knr42USMm2S5fG3LQ3veg5RVHkEnYXXm6NtxjSopqHtNTp1HZKxO+oqC4Z3+uKfA9joIQhjeNOIfvp/WvyUMl1vGs0WP7c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774138104; c=relaxed/simple;
	bh=TuWcUmDyaBjwtbfDOhGgL+CldTk9DOO4/WJ+HK3pfL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F19zkFtW7YBO3XPqiUewaqYb2VBGYat5azQ1+j9Df3z4cf9ldnDL6g1AiMTCvdCW36zhArPGsTkW0JoG05lkWA66ELTQ1LRX5+XMtAQKg5NjzOTX2MbHU11UrGtEIdEOKlbzy7xBFVmozdSvJFdlrL7XNkm80h2u7MFleuOwQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WyUrv7XM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WyUrv7XM"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f97c626aaso501027866b.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 17:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774138101; x=1774742901; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qIHi/rtedwS5kgXEYJglLohUmohpmToRP3VRHLB96Dw=;
        b=WyUrv7XMbXmA/ppD1A9NZ7S9TT7JTz+TEcfOPUZKmrswRjmKjjjZzZXW70NX4Sgqtj
         I7QDxuk8KHNgDjNL9F9JD/tnbM9r5PdkKrakxTjddsCvMgrtyD/tm/cpsx02mtpTvmmF
         +l9qaK6Sd9dxmWeaY4J3Ijt3EoiZEHK0ZNk4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774138101; x=1774742901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIHi/rtedwS5kgXEYJglLohUmohpmToRP3VRHLB96Dw=;
        b=od13X25mRB68jzq7paUSFF52qJ3sWj37KnQTJEjb/6S5uhpl3YOcOee67MubKSuEnz
         AV9qf1+M5Ui22xMTSWNOsc8pMdal1vC8OKkMqmaNrXMsBL/cLdqOCwNCkMtBOljtrnZS
         FfRYknjGZif//5UPEXYQndJ/fzEwUpjiZjhjmUe1AeHLjU/qMv2uY2d28gy06cxqllKc
         r+hpsAkBNmIeBOvSZgK99jqaU4HaMwynpV8b0fyPmlfNLF6cH4w1+8h/o9oeOL2b94Ve
         JXez6rcnBCvcOUKK7SAE8v7twY+nvl0o7QB3HGl1da4n2eMQ0nu5Kxaiz/dZTUVDNDKS
         0Fkg==
X-Forwarded-Encrypted: i=1; AJvYcCWbfcaEwsg7AslD8ep+AdpLwVCohwKmPpzjQv5O60SVl2QSNL8tGMFrtKIVvosYmGTsdr7fjlI3WnbRpNyQQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCISlXVtCTjWmBBTlo+ACzm1rSJC0r4ixKHKoSKMs7KkUhkQKU
	TiaM7vPwWeHxhxn9ZmW3AvjfzYekRGNofYEMG0F14Cls6PvcaXSuoE/YlMUMSHSyxd7FKg9nnTI
	bgzdjMAs=
X-Gm-Gg: ATEYQzyE8HOcg7/zzCvdgTAdTnESYM1wU60De2h8VLLsCaUs0GFvuxLOmpEzSNXXrQ6
	tFZXSY7ZNo8GNuH95jY5B23aF/PWqgxNVOgHzd7EsgMf0950IxktAh9/kwJGNWAaKg5CIEVSDqT
	hpS21Ympee66AeIFqecxo9qOfx17buGM/F15OjaREjrKTZi+GNh+QuK125IwegfOvQeVRFIQR3+
	/URWwXYl6xdcVqzuTL9GjE0ayceXbZCU+v5tRgwJCoQIzK8MBe82zm7bp5Q1hZl90tdRo/P+gJV
	gyPi32xHKLAzTB5f0k2YEqhARzrIg7x3u9qmjuhrPR3Fdbjjs6xBNZJqKtvzh+IZWghwzL+ax97
	xbxUUZHds5HyCxwLUJnWG6i4VdLBhLBI42oC7IzeUhduVv02xE0ur8N+zte4HvJlljMV8qFkZCW
	N2ie6lU61855JP04/QxctqF+HxGGmhUPAyDq0enJzsdsUhJECU7W8na4xnWBGbO7Ow/80rPqC8
X-Received: by 2002:a17:907:8749:b0:b97:cbb9:2290 with SMTP id a640c23a62f3a-b982f1ed20cmr515478966b.11.1774138100759;
        Sat, 21 Mar 2026 17:08:20 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398d82dsm310683566b.62.2026.03.21.17.08.20
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 17:08:20 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b886fc047d5so511215866b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 17:08:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2Uclh1k/PnvCW9LA7LlSFhL0fl6uByJ+fx20obZIhZdXtWOYVHIsCqFuTOPdlgXKlIGvvCuCh8nR0MtrN2g==@vger.kernel.org
X-Received: by 2002:a17:906:c3a5:b0:b97:1d24:bfd7 with SMTP id
 a640c23a62f3a-b982f1ed74bmr379165766b.6.1774138099842; Sat, 21 Mar 2026
 17:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
In-Reply-To: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 21 Mar 2026 17:08:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjA2mOM=hCGBiS9r7+5KCmTd3KMrTTZQsE=rRLqqKMTyg@mail.gmail.com>
X-Gm-Features: AaiRm51soCXnGU_aRbVUfhugrP3yYxGTYz4MnUj8rH_f3S9jQUe-5gA2enuHVm8
Message-ID: <CAHk-=wjA2mOM=hCGBiS9r7+5KCmTd3KMrTTZQsE=rRLqqKMTyg@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core fixes for 7.0-rc5
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Mar 2026 at 15:46, Danilo Krummrich <dakr@kernel.org> wrote:
>
> (I will send out fixes for the remaining busses subsequently, so they can reach
> you through the corresponding subsystem trees -- treewide commit [1] for
> reference.)

I'm not convinced there are advantages to going through individual
trees - these are just buses working around driver core interface
issues, not some "bus X does bus X things".

That said, I'm also not convinced this is all really -rc material in
the first place. This issue is neither new nor does the UAF seem to be
triggerable in any actual realistic scenario, and requires root
privileges to trigger even in the unrealistic case.

IOW, why isn't this just left until the next merge window? And then
done as a "just clean everything up" instead of trying to push things
through individual driver trees that almost certainly don't care about
this anyway?

                 Linus
