Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2441288C0A
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770923895; cv=none; b=pfgr2rdk1IaJk47seURmRL1rJ8nFZIp1oahMG4OIgsVRWnxGL7Ge0MevMDEXFREhppPErOTnELY6vO+ank4ZLv2A6ceo3nSqL0HlMYotNF2eKG7X5S6yCpaNAdCl0OF9RaDOgxV3wuWAI0cBkqN+VyOSPchO750DSBAQC4f+/vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770923895; c=relaxed/simple;
	bh=Dwo6JeQuN03rtqKJJ6ttZV+PoZ7zgPamRHnYZdq+qas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMYzXy8pnnLtzUR7Az9nmvkEZ2Ww1hS1k0mW/GHo6hg35ZyjWgOe+p+J/mP4xZsX9l7Js136ti+uymUFizyfvE6kN4ls+x2sw+704iBKQz9xdbHICTpcALZ4YKnK2IyMZQppPmARH5qhYoIT1y8oshUmN7NbKDylIXUmyNjYhqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONYQfrs9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONYQfrs9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso152753a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 11:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770923892; x=1771528692; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L7fegrrYVrLK7MrY18kiCOAGYiUmZMy3K/iLr1h/Lck=;
        b=ONYQfrs97QEnUk0iNYpINVMY4gqFWQy6/VuZlGkgi3s1SUL1fj8BBKXt/OvjYktDPP
         9LwmL3M7AVXEZQxN1/R9eoLcHt77093FonUmGaJf8oZt1tIMyfS0R3T0kDvfxmugV4/9
         7Z8ymh8uIykc/aZIr87A9xYpiAq/LHMrGnSdEyrLXiMGZiQn3/OhFqANY3DYBdZqq/ar
         6z1eFpG8XalE1dFrM/lYfhTHQo6R7Zdtv7tFM0KAeAFBoehMqFcF2td1KsY3lhWJUZlO
         HGby2HIKk2Id4dGef13cPrUQxLBkpuwBpu4c8Y1MJ6aSeQNAVTbZE6Ajm2hcEwjTOFvQ
         S9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770923892; x=1771528692;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7fegrrYVrLK7MrY18kiCOAGYiUmZMy3K/iLr1h/Lck=;
        b=aXf+kBOdJVefjJ2ZMmKY7RT6wbzWObaW1/uNShFqxcmoSUf0Pc/UCpUMTGybYbHs3S
         oYDwRGOXg5xcPem1GPAQD6kXq1YiWbyoZfu+jnopW5Zdp6owcHMM0+ok89JiYTMPUEBB
         BV3jbr0uprjn/xUN5EplIP5lJkJn72+yCWI6oM5HVkkqgpaceFqObrASzrXA0TcTTato
         1g30Pepffoos8Atf2y//HJAIGoRSYRnk8YHMmyrbHAez/nnB+2Sl++Whb0XUuqwlN+q/
         iwsh96QrK/v0+7cGrqcENXwuAs8nsoDUM6f8sh+eS8aY14UMDicPXfmk01pFFoXMmMuG
         41Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWMTB8LifDi9mPUY7N6f+cgWy7uQXqk5ufIoz1KsH5tfFcJ1vD2e4B/u0XtlW9ByP5BHwPEiPnMhhebKkrvlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsUfpLb/sR+GeciOTsphvHvSJM2dXXV3B0D5ar4d5Dn57zCG5
	NVp/82yq39/7gAWRHw3QSOljHMxJ3anoYQ+t27kVthC7mpmEbghMcTBV
X-Gm-Gg: AZuq6aKtu6Lbct3fYuPxWrYdzfLuwIND+pgmoxKZ5W9w7+AIPmofnA2q+UHeU3YUtTO
	BxDk06TSrfBNOxsF925WsNqzKSzXFat8t0Ly9L43/QCFhQc3A6IxkWtX3TRZoSNc7C+37e0i+ae
	kGbII30ZUqIrVzU1qSnfh/tVsyLiSNFokpoChKbcCjTn44n7vIdHKp9sEArZ8YOql7Bf0ko+ahp
	FKISsrRkLtTNvn2XzLAgVLDPM3jX8rEf/LEHwvZUAxGtrxgggTRbD7REzzu+1L5+OEju0P02fXY
	gsj4Yrb61HaLLQH8ZJrfNQIRg1auwVPbVAyOs2XcTQrzm/zrVB0DD+/xI25wNR6teeFfAYTLopq
	j/90Mn7l6ALaXzkF2zpagXnFp32u/ARMG2UUG9DsoC9buaD55ST8/XhXEsnGfMrjXZPsI1r0BCO
	n5z5mjylocvz68RMnKSKOKxlHz8D+I/gIBFfdAalVmMD1V/tNVCGVeY80A1nPLr6zdRiLvRV6yj
	awMZ/WZEQjIEVo4VfOJbG3IFn0S7f1lf9x3
X-Received: by 2002:a17:907:cd05:b0:b73:9280:2e7 with SMTP id a640c23a62f3a-b8facdcd808mr4941966b.34.1770923892195;
        Thu, 12 Feb 2026 11:18:12 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f7a48890esm162938666b.65.2026.02.12.11.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 11:18:11 -0800 (PST)
Date: Thu, 12 Feb 2026 20:18:09 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1] tools build: Fix rust cross compilation
Message-ID: <jqbrvllvq4w53qkbvk444gtwldsv5zvxpqaxmjsl2qnk6vnt44@ouojmbn4af3i>
References: <20260212185810.648364-1-9erthalion6@gmail.com>
 <CANiq72nmzYkHpLTwWxn71TKKTPxWprjPHxBau7Yat32P0zE3pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nmzYkHpLTwWxn71TKKTPxWprjPHxBau7Yat32P0zE3pA@mail.gmail.com>

> On Thu, Feb 12, 2026 at 08:13:25PM +0100, Miguel Ojeda wrote:
> On Thu, Feb 12, 2026 at 7:58 PM Dmitrii Dolgov <9erthalion6@gmail.com> wrote:
> >
> > Note that CROSS_COMPILE might be different from what rust compiler
> > expects, since it may omit the target vendor value, e.g.
> > "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus provide
> > an explicit RUST_TARGET_ARCH, and if not specified, try to match
> > the CROSS_COMPILE value.
> 
> I would suggest explicitly doing the mapping automatically, rather
> than guessing or requesting users to provide one more variable, like
> we do for the non-tools side.
> 
> Perhaps using a "table" like we do for LLVM and `bindgen` -- see for
> instance `scripts/Makefile.clang`.

Thanks, will try this out.
