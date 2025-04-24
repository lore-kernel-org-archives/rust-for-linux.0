Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469518FC89
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501981; cv=none; b=iPnbIC/6iQaE8hwwjUsiYxMoEv/oTOyx7Js89I3VTPsHu6DDeGNelxlIiq3tE6kvZALMO4RDLppA46fJkn6plttH9jgr/EyJvNtmM3oVEGX1Giw9NWQoyE0Gu6H4FBR1hfag9MaqVvgLA1XeMjDA8uXi+lZ79UKCKrLRvAZbMto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501981; c=relaxed/simple;
	bh=tup9ty6E85TqqyX4LCy5mGsqmAz3JKnWrm9yplFxREs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsKF/P0n78fkFvslJTpaDdOcTf3dSnaOA/LPl6bJneg8/BSlANxty/zNGVx0pdaaUKlBCd0A2N9tWzS4dYuOLPP+jciP1C0ewU+wG677YfxVxFTDuTstGXKQTfP7gWnj2LfqlddWea9TkSdGEB7nZNNXzYHCjWME7gYJCs5Eq2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com; spf=none smtp.mailfrom=hefring.com; dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b=RkcTqaFL; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hefring.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="RkcTqaFL"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5ba363f1aso147006485a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1745501978; x=1746106778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YWMfkI1WRY3cYf9FnHsr+03ZRcmNsaavRSb0tETeg20=;
        b=RkcTqaFLlKfIMClVvKHUFRqYE1s6UAF1PYLqIRcpssd0Q0dPvphfiK2UinAGdEQ5kj
         iVtGK29SfsS1M7J+Yyje5dYe7Oz0KhImyfnCIAyREkY+90AqQPjDwNLdSNWPyTIRiN17
         xiKmrJCDGwJmpvr43edyppNT0HC03S9Uvif3T8nLgzKKxua7PCV2uGCfLwGSlBw+zbaC
         ZaRncUTqGAIeFkZdSbpy1Tj8H9JcNGYAuRRRho1jcuDofkeOy2CgpepaYDncUmE/AvIY
         Uum1mdEMvX5c1p7ZlVzNvsO/2cmElIxsOsV9fOeuWOsso3945xE16uY4TEytIzM3dfWi
         7C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501978; x=1746106778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWMfkI1WRY3cYf9FnHsr+03ZRcmNsaavRSb0tETeg20=;
        b=lx95SKxXgDqNqmAo0OXeMTc5QkrdK4YyUZTe3p17Yy+J/OyDVoF3aq90ersn/No7Ml
         CF5RXAPOS33xlbCF/ZC3eka9grlJwpSP2zCulQeTJBoDrZVFX34QcR21nJJGZ7W1aNV8
         TYaFL2sJbrzRS1Zlbrfxf/khS7Vi6K4g/W1haVK5tUiBLWF/I0NtLL/9BrEPdTRBu0br
         pqlRPt9jPQ22xBs+1mCmwFhPgTrQF/eUYCQveiYF2zBnteuCsR3h+Zq+Paw/2NRg6ldk
         gPCO1DJRzcQftmMum2i8XzbnAq0UYWSADru8NS9RxkdtfsVVEqsh3yDzw67MBd/jmODP
         JOsA==
X-Forwarded-Encrypted: i=1; AJvYcCVMVE+mQdSu7vgKBDDmqvC+2ijL4mR/bMZ31R7Ug2eyQM9H4gU/A/9ghKq8xiW1vQsF1rEakdYGrIxpg2cB5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Ro7Sc7ZDpy10+bAihTuzylSti3yVIrsR9JiBEhU6JvQ7jedh
	GwFIO0P8axIh/g7pk3KCx11gnnCDw0JVDIYtbkDj41ePo8EtHpHRrD2pAGI/X2U=
X-Gm-Gg: ASbGncvt90yvpUw+da4E2WToiygFuUPjvKlz6Ucdd3Q2cdLdASHOkbaZdK8HitlJU0P
	YOFBfFNtjVtwG6TO0isDGzipoUvcqx0QBJKsiHOAWAmS0sLqTQH/W1Zb9q3tEnAtOAjexgbLLH4
	oBSBVuadBmPrE6k2laujSGQZX1okkPSKLABWaQGIU3IsZL5Tri6XGR9Y6xO2sFMbLaLZzfsJ30v
	n1Ph7U6rkak286z9Xv+e79AoMERE1+qZfGaFjP/2sm1EJBWmI+L/0H6OxIQ5/9YmnvKyqGj++fR
	arqGBu92XB873STFQEnzPutdsX8P1ZFp72vpjuCtBfluwpKFhCCWbu9UJw==
X-Google-Smtp-Source: AGHT+IGBbcE518ngciGGF0+eLjyFAC+mlK6EuUeB14SDh6Nm7kNgxryaWfeo2bDtyypKwASpBUSZdQ==
X-Received: by 2002:a05:620a:1a07:b0:7c5:4c6d:7fa9 with SMTP id af79cd13be357-7c956f4aadcmr432561485a.49.1745501978313;
        Thu, 24 Apr 2025 06:39:38 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c9589cc670sm89847585a.0.2025.04.24.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:39:37 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:39:35 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Christian Schrrefl <chrisi.schrefl@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
	laura.nao@collabora.com, linux-kernel@vger.kernel.org,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	rust-for-linux@vger.kernel.org, torvalds@linux-foundation.org,
	Nick Clifton <nickc@redhat.com>,
	Richard Earnshaw <richard.earnshaw@arm.com>,
	Ramana Radhakrishnan <ramanara@nvidia.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
Message-ID: <aAo_F_UP1Gd4jHlZ@dell-precision-5540>
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org>
 <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
 <aAKrq2InExQk7f_k@dell-precision-5540>
 <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>

On Sat, Apr 19, 2025 at 12:30:01AM +0200, Miguel Ojeda wrote:
> Thanks a lot for the details!
> 
> To clarify, this is for GCC kernel builds: skipping the flag is done
> for libclang under GCC builds (because `bindgen` always uses libclang,
> and `bindgen` is used by Rust to understand C headers).
> 
> So GCC will get the flag for the C side of the kernel builds, but
> libclang will not get the flag because Clang doesn't recognize it.
> Thus, if Clang vs. GCC differ in how they compute the layout of some
> type, then we would have an issue "mixing" them.
> 
> As you can imagine, GCC kernel builds with Rust enabled are a hack due
> to that, and it would be ideal to get `bindgen` to somehow be able to
> understand C headers as GCC does:
> 
>     https://github.com/rust-lang/rust-bindgen/issues/1949

-mno-fdpic disables a GCC feature that we don't want for kernel builds.
clang does not support this feature, so it always behaves as though
-mno-fdpic is passed. Therefore, it should be fine to mix the two, at
least as far as FDPIC is concerned.

Ben

