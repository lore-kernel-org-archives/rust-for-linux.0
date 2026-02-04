Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F43AE703
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227820; cv=none; b=YHWl805+3JjTanSiQhONvP7WgWzCr2QTZH/5n8AlfF9dpV85/xDzhhAja2BERx6l+uUZlVAcn6OZiakOFmDR3b0R2mnRtfejS2WEPVYhE4ki5McaFEBhEDXCVDYzsuvBvh2bHCSIUjR86V4HJE8jPNHBvZFvX+7U1JAaVNfN2lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227820; c=relaxed/simple;
	bh=g/DecqvuFJyw1Ly1GdjoDlkRpaj8IFIhJom+NSNKplk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sABpe9l1JlPvbOQ8YKYwgetzUelnIHU4u3ODrudi+JePgO/Qtv32E0C2zyhvzDHYdPsu/Vh8s9UzpIJgqUNU90F3o+qRMYuObS9/jqFf2bZAD4E/QwlKOdxsOiADio9yLgfr980jwXA79sB9pxppF9VZT4OiVSFEMoXyPrGYegY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liJHF0CO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liJHF0CO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so997135ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 09:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227819; x=1770832619; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YsaxEo1afPg+Rotp0Xp7sr+H2iiL8qecJpuRH+ktCAU=;
        b=liJHF0CO1QAhmyt01ulp3GkOHD/r2Ha8t47OqUHwdHndL58v/CW5fa0KsEqR6QAJhw
         iI/Nxg3QeOEwMa/TU3IxqnddIYBGyjqXH0MJBhOVljqb8DMgWn7uqldDMr5DdKrW+pPH
         TR0/XzO7R5P94Ls99CD/KEhRFQdnDoYGZeue0Mi7V1WW610epabehre/OxSqEg4+vLuj
         q8kcaJljhi+AfpHSRdhue/O1InNVE5rmXY6ZoLp1DOPmewqIzePD62IYNn3TR4UiIeeK
         Rh3hOwes5Br6tdphIdurR+6vLPEO84+M+O8IMx/y7thIdxmzf3IBOrWGiiJwmAVKEavL
         ylgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227819; x=1770832619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsaxEo1afPg+Rotp0Xp7sr+H2iiL8qecJpuRH+ktCAU=;
        b=rC5FdE0Kx97tAc3wjlPGZwoQNGyD8TEcluGCwPTdxruAvw/OyxLvjC1ha390Ed9qkM
         PL/GoXK4FmKw9T8Ggz83fo16FCXsnOw372mOfpwiWThL051A1hgTj26Skk75tb2WHZKn
         Ut9KrXrnQgCjbnqdAaGwEynHmKrHkRgnWUa0cWcl77BqDW02SVHFvBB6ALawdBRHK0yi
         QrbipLSfn5L3ldBGpSLIzXH3qXhGTpgTIF9M3DTHD25XRz+39CvXArpjgtQoXMAhOp4N
         Ss32QWXoJ6wHBP9WFpBk8JXLpj4eYECR/ej9Ng1zInR2BwnqAq2bV/sELEgmAFYXfaeQ
         100w==
X-Forwarded-Encrypted: i=1; AJvYcCW9dWg+btXDTzoFASNaQExwXXWsMKtAn5YzOmxGb0n3MyOlguoBtJQ/5AKOWJB70gGX+e3Ya1RPTu7UKRdhFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh86uh5kz3k3BaMEiOsrskd31MRVraFHToSWhV6gc19D+Qbzwc
	fAQET5dYBHHqCQblOQMdVvnVicf7USDGTC0Qa0/KVTQpzPHkbHMwTguf
X-Gm-Gg: AZuq6aJLMvUBVJJYyVs2kvsa3YFjT2zSDag2EH+CDyef3zOPZy1PQegQHcf3X1dltEP
	GRBuMIsxSHMCG0YqKiw4ZFULvJDW1+8BSP3ywgidrWpsKVfRwjszjrsz8sC4shidKG1lArd5Tfx
	jJy18iWz+/YPiDG9WJ6IMeB2jtPsCGzLgN0Lg6x6G+6UvKMY09OtxSFU7jGPh11X/+dnOks7731
	msGI6JapQyL86qohKrbtNuA99BTQhXpxdlJEUQUG0BUzQQsPKsyTDFo+sHs5JtNvAROUMYyH04M
	tlgzHt5m36S+A7b+hh+ajZ2cdQBUH4TLdRMLT4muRJBPYAcXoC8qBMY9DSXfmX+fs1lGJLpSy/5
	c5LAM4w6veFq9u7xOakYSG5gylAfwsAlJhn1C9jSyXWqviq+MYM64yZoleiXpRfDYX507fHzryH
	pMh6LuvwaK7zOnG4LgWa4KpZvBCW2KCLSoSbJpZBONm42Uv9cDUnh2ONKtUpk=
X-Received: by 2002:a17:903:faf:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a933d1f2b1mr33270555ad.24.1770227819453;
        Wed, 04 Feb 2026 09:56:59 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93397c472sm29066135ad.89.2026.02.04.09.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:56:59 -0800 (PST)
Date: Wed, 4 Feb 2026 23:26:48 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] powerpc: Enable Rust for ppc64le
Message-ID: <aYOIG0HSunq6-Vii@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204042417.83903-1-mkchauras@gmail.com>
 <CANiq72k41tCq7-LccTz2NNpUF-0sOqPvbj-z+Qz0msud3O-3AQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k41tCq7-LccTz2NNpUF-0sOqPvbj-z+Qz0msud3O-3AQ@mail.gmail.com>

On Wed, Feb 04, 2026 at 06:49:23PM +0100, Miguel Ojeda wrote:
> On Wed, Feb 4, 2026 at 6:54 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > +    } else if cfg.has("PPC64") {
> 
> Can this be done via flags, i.e. avoiding the `target.json`?
> 
yeah sure. I'll do that.
> We are trying to avoid adding new custom targets, since the idea is to
> remove our reliance on `target.json`.
> 
> If it is not possible to do it via flags only, then we should talk to
> upstream to add the needed flags or perhaps a new built-in target.
> 
> Thanks!
> 
> (By the way, Michael back in 2021 did the original integration of
> ppc64le before Rust was merged into mainline -- he may want to take a
> look at this :) I see he is in Cc).
> 
> Cheers,
> Miguel
