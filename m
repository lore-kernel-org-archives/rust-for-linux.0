Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA602DECD3
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316578; cv=none; b=OcDmIu0TA6j1r3Eg5zWZq5VRMQhNyetlXz6GLi9/kJYSZ7t2VhRcVYYEmOIynMNC8iRgpIRO3mKmIKcV8G7hTV+MO79WsCHeZs0LyNxTuU5U600VvDW4UHKQSnaeBFl06ZXZ/2g/3fPel25AsIsZ9G4SvAfuyoLt2PBN/+BcBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316578; c=relaxed/simple;
	bh=j9YvxgBnTjVJotxsZaz59b64frSQ5OWTlyiLqZ4fyTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLK1jeAYcJqAMcaA9gMLAvgB6DWaUQq7h32fu48GcJ3IYA6lMuzaF3E4a1NHxxmc1MYcGzIhuOnJZGusRWs2Os5LgVzN98C0oIbLUWgo+HMDDsGW17kmdsg05IxntoCyGt0ZdziTRG1VIXkudBLOvLKP0osiKzwOmTBBCmEHVXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iETzEx0F; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iETzEx0F"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8876d1a39bso443045566b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 00:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771316576; x=1771921376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9YvxgBnTjVJotxsZaz59b64frSQ5OWTlyiLqZ4fyTQ=;
        b=iETzEx0FcOsuVVzz8mVK1eDqkUxZyB5ytUJQuyQkplTJGVpUvyiLbQax0p9Tsbz7I5
         tywFAq2G2Jd9jaRPBvV+ipvpOkJxput82HpEV8dL0W2I6i+Z5SirXDHvhktQaWx6UYGW
         vVtTLqU9BmYTFlBGgRHcZyJXpTJ59Ei3M/CinQLa5ZU1X9vDpIgk6TLMOPxOac+abEAP
         5TECHq8jV/lCTGvxok3M5HesgJjLA7qqJHGInD5CQYz9pQY9OA+LQdQsSlQurioN59i9
         QH/LDeViMKabCHiy3p41867iBoVlX0zzicaSnDi7nc6YDp5902yggszVMR1hYUNPiBhN
         M1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771316576; x=1771921376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9YvxgBnTjVJotxsZaz59b64frSQ5OWTlyiLqZ4fyTQ=;
        b=jRDOPLNIn7/yrrueBul0L8HmUxDqxSf0synspuAIzFMDqogfAYzxe9S12tUAlpZpig
         1wTCYsIYT4aCbbgKnbbzkf99YB2u8Bh3ZZALmf4mPC5sWozFCHlSG5B+9HYPJuaO9v3N
         IY2UCwjaucU9glXJ7Sp9/myRewgVP8iN2QACrECtpwIAiAWpLdWsZgLvuIfMpjyxSyNB
         aCcJKAbUuF430SaglZ2EwFeLIZvsoxlAdx3bTaQsJKWQ/JAPmb8vXHPbhzjlBr1CbvIz
         NmxYCjTq0AyqOcaSjP0+sBndSOnrNHX4QhcCDw0c3ZzDSZPPT3cEXeN7m/9NDixh3Hf4
         bbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsjig5+Vk4KRmuSp7VTgbil4eF8m3rhCYwhp0uiXqi2GRz128ncvGVYpIavA/QcpdUjiU5WaGwv+7uxQAzFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA/Cw1QYXFVn4vdPmjdL29FjlCqCxRlGW90ejwxk6ztpfUaS6T
	USzR/3jvxEJBiPiy0hDfaG+S+T0NuOmlF0E1SadnE94ffKhk9N75FEAM
X-Gm-Gg: AZuq6aLRxfSvU55FoV/5dxpk46OqCp2uO6NmukTNdir5cLp95g3nRZi20roeXOXXRUg
	iF5ke2+pF4Mrk9sBqE4RvVvIG1+tGmHY3idLL7TfvnBWmiOaaigJK8zQUHiGC1iM+c8DS2WLgWU
	cRNJM/wYfsqNwOO7KYbhmfkeTKEbAoL0bP15a2Cn+2CfPElNtGKC/8i7kFTOLOJhZvPHwuz5HO2
	n8NW2RPxlVENca3qBRE7LoSJbAlYv6K5dnxJl202aTzTh/6PbAsuYyMmloIo9QfoJ+CzvASE4iG
	iWrTvtUEs5eOteBj4DeLVwbnscdRimhmcsR9wzzdZ4MHhtQF++gF8/8ePv5AdtwJBn7IoUB68wL
	wpXuIRcBK86IHYuROBMeLaeaHGQcr6OPHkhAZpW5tjMZttdFiccUe26/WvlCD7o8umjaDYvZdzX
	YlTRegCs+eYJOEi/DoZWBv/9+HvPeaLwSQyAJr5ULBQcX6xcYS1Jzw5FCIVENRDlrdQEO35E7g6
	2mUwuPKVAA15fgcWAS/Ay0b4RGAnsPw4q2l
X-Received: by 2002:a17:907:7fa4:b0:b88:241e:693c with SMTP id a640c23a62f3a-b8fc3c7fa23mr672213466b.31.1771316575433;
        Tue, 17 Feb 2026 00:22:55 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385d80sm325883366b.16.2026.02.17.00.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:22:54 -0800 (PST)
Date: Tue, 17 Feb 2026 09:22:52 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v1] tools build: Fix rust cross compilation
Message-ID: <nebqi6txwrsgztbsx5g7npptbsoyocbn6r2ebmzmwtigt2z27w@nh2xbmk3bp2e>
References: <20260213191212.33328-1-9erthalion6@gmail.com>
 <CANiq72n3FPOBVbR83-Vp6uetu8RnazMuu6MhzG_hA=_j18_BTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n3FPOBVbR83-Vp6uetu8RnazMuu6MhzG_hA=_j18_BTA@mail.gmail.com>

> On Mon, Feb 16, 2026 at 09:41:34PM +0100, Miguel Ojeda wrote:
> I think this was meant to v2.

Yep, I forgot to change the version (it was a bad idea to send it out
Friday evenig).

> By the way, should this have a Fixes: tag? i.e. since it sounds like
> this fixes an issue. Perhaps to 6a32fa5ccd33 ("tools build: Add a
> feature test for rust compiler"), or something else? I also usually
> recommend showing the error message in the commit message.

Right, I can add an example what happens.

> (Also, you can use "Link: ... [1]" for the link.)

Got it, thanks!
