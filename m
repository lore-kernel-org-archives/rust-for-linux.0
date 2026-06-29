Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC437E2EE
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 04:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707975; cv=none; b=k5/cgzJyxPlrKGmNqREQzYZ1ff8ipV4vehelyJk4/p+PebeFghynjj2twIFa0HInupJ0YbT7OMJQ0kXj5fNsHjFQJORxaGsJ6K25EgPQFkf7lpUi8tGQbDL6ouMwD4zcmN1W6+ySt1eIZRkpO1LeShDeuvNWEZARWL0BIi5jN+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707975; c=relaxed/simple;
	bh=1eU+2bDqdzNluinyylphYvQVh/IYBb3LxR6xoSyK7UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tk7Gt215LEoJMK4CjWdLUx4DcDMLEz9bhmc9Sm/IISYcUDu5yjkBa3OeT50gD8AkCF8CFGwhROo2Ad19OrdytvNAgeLOqATPCRo/48334GNgJ7Sy9N0KCL6aG8ZFSuIAfjHHVKGNJTnbao0u+pbkSj4vFF7R8RwqEZibfpHlMiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hn+E1MsJ; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hn+E1MsJ"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so1381662eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Jun 2026 21:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782707973; x=1783312773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tAkDY+MQvqYfr4IaXyrXZrjWk09q7w3/qlUx+mpeOiI=;
        b=hn+E1MsJrcDHw4L7JMBDRGaEVWJGa0ETOsmQqVkAezoHqRNCzAOGRuGGIvFIzzgKAj
         5WbmJiHasrXBsw2nHoHF1trp0cS9knpAh085FbvxF1XlG/DPaHrEmcR5qOONpWipekTI
         b2pmR3DACgvrHz+t5K24F1Klul23PedHMKZDFVxRkjraR01Q2lZwnkB4VEOAS38x302C
         RZiSAD2L8UPyAhNhq9GeEbgcAxM6bpc8M18GprrNeMR9TQXwcNyYWNbEZe2Iplh0nXwf
         JkyvAD/bQHrPjowwEaqS8/fiHVxRV9+9F+3y+wWGAbHlMLR/ZbracNqgYEj3tkzGnPPZ
         Cm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707973; x=1783312773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAkDY+MQvqYfr4IaXyrXZrjWk09q7w3/qlUx+mpeOiI=;
        b=Q3AA3zIwdG6lFeG9hQWisRL/h8xj/sP2dwQoDf2Wl9XdDQFgNklPGt1NtpDBXKw3A9
         QmnN0UpNSW9kYemh/gteOqW+ybz+TWVcJKeCQmXI1rYstRSyP5jbokZBhxEQYk419kN1
         PItsrPhJXWVJe21VsV6RsYk4m9N6UfHauD8XWqAFRQ7ohWEU6NGbb9/sxUkjp77RlGZH
         capbcBWdpNtI8nLfoD+OBb7GjAq/GzDYat6aA7AVi8kXDvrW/UBB5meCo1CNBxiaLgrG
         /3PHfVPbL3tb59H6FJNKwqqsR9i/749pA/GJ2pECufMo6nZjWCkHio0Uh3CLIHIIUuKt
         XFsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rru0l0xCS3CBfS1CMeBvsZNmA2Zl7eV+EDc8IsBUkKBflLug0apcZxdixCWARdeiiXXhRVaGyP5B8/pLftV6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzby/mv8FVoR0duqZLJJcXzFGBQm1ZfoXiaQ0ZIH9aQD2Y49fTZ
	PYKlFevJwu8vFZ+CaVWIgxTa+WAIK8Iqvx4qIxn/CWKqe68suNMDcJd+8Nx+x7Hv9WI=
X-Gm-Gg: AfdE7ckZIuC7ittNT4BXXuM2ZCk3uf8uSkFEWP8dDj/HQ9Zxl5nMI5xJlJyM3yQ5Gdw
	foRRFkIo7gi3SmcgsM7/xrAuIyrk2O1p+VyQviAsks7ZWcbac2WngR6QWZIe2k577jZOtMlR0yG
	lEXhnf2r10UeKW/ACTQRQ87sUR5ZJ1+khovgcRaxY/4DY0w1o7s1JQPmCj0JNrad/SX0t/hfIY9
	SOkXVfWxdBD0+5TiIxga8uqPnjgZXtgYZFxYlB78FarNDtCfysCltc7ZPEgWUjACH2MEpHdBqDc
	9OSbOTtAAyqgW0Z/pZ0stMTAofslciOz2W13E92KRcn4He4wimS5rnzmGlO/gamGkzyldScFc+Y
	fKiOWRJAb2PST1hIgX7DNWPJljbaSl9K44cGV3Q9ACs7nvuNeX7y+v+Ofb4Mv1hF8h1VOot7kys
	SJrz4NR9SewBfs
X-Received: by 2002:a05:7300:5341:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-30c84f3cb8emr16773092eec.16.1782707972936;
        Sun, 28 Jun 2026 21:39:32 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30cac1b9751sm23319860eec.3.2026.06.28.21.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:39:31 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:09:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Trevor Chan <trev@trevrosa.dev>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	ojeda@kernel.org, a.hindborg@kernel.org, paul@paul-moore.com, aliceryhl@google.com, 
	airlied@gmail.com, simona@ffwll.ch, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	igor.korotin@linux.dev, vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, 
	m.wilczynski@samsung.com, boqun@kernel.org, gary@garyguo.net, axboe@kernel.dk, 
	daniel.almeida@collabora.com, shankari.ak0208@gmail.com, lyude@redhat.com, j@jananu.net, 
	lossin@kernel.org, acourbot@nvidia.com, markus.probst@posteo.de, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	david.m.ertman@intel.com, iweiny@kernel.org, leon@kernel.org, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, sergeh@kernel.org, 
	matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, jack@suse.cz, ljs@kernel.org, 
	liam@infradead.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	ptikhomirov@virtuozzo.com
Subject: Re: [PATCH v7] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
Message-ID: <xak7wil2w2wdnmkfh4e4ijhlgnudzuh5y3ltlo72454e52tocv@434kdjz2eupv>
References: <20260628100731.64885-1-trev@trevrosa.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628100731.64885-1-trev@trevrosa.dev>

On 28-06-26, 18:07, Trevor Chan wrote:
> diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
> index 62e44676125d..84802f22b652 100644
> --- a/rust/kernel/opp.rs
> +++ b/rust/kernel/opp.rs
> @@ -1043,9 +1043,9 @@ unsafe impl Sync for OPP {}
>  /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
>  unsafe impl AlwaysRefCounted for OPP {
>      #[inline]
> -    fn inc_ref(&self) {
> +    fn inc_ref(obj: &Self) {
>          // SAFETY: The existence of a shared reference means that the refcount is nonzero.
> -        unsafe { bindings::dev_pm_opp_get(self.0.get()) };
> +        unsafe { bindings::dev_pm_opp_get(obj.0.get()) };
>      }
>  
>      #[inline]

For OPP:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
