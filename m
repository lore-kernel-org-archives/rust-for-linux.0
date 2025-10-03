Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC5A263C8E
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Oct 2025 23:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759534579; cv=none; b=lgpLgIK6WrKWlgLaZWV6Vho7/8QH3ql1GHN7JTnDRRIwyxDuDqI6R7ouD0dTh4WBSPdNStkhPUUX+kqpa+wHDdyFmTAQ5ped2cvyIPKpuAIA3kbqSGJNAop4C5vy+j1q/Q/EfIqvd+O2RuBgXSqk3iYN8A6Actly96+IN42Q1s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759534579; c=relaxed/simple;
	bh=Gbof0DN7JF5p105jMZVnBGv2h+BjlLOUNDm0BMgxVr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKxwV7J2BR3KYly4oDEip/PQmLW4DaHCgVDIHmL7BVmmqPQRhtMV9UmXoKzaJ03GUBhLcqZHRPzP40jk4Zj0xiwzPISr1IsTwMttWA4yhRK3179fOfinHgftHWFRuFowLJKg+V9FNFCmeAZLaGPK8TQi8GDbcdSK21uRitW5oqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DdjeKQuY; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DdjeKQuY"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-634cc96ccaeso2020a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Oct 2025 16:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759534576; x=1760139376; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8xlz79RMNPM4u+3ojQF5w7+rAjiGlNcGaeeLKf0ALHE=;
        b=DdjeKQuYepQYrGP0UxMAk+UPOT1xxEblPxGwHVLWlAZ0elM0tKLdXjopX1e//mZ+vk
         mopsstIwYAvfIfhS6AQcvd7Er5MoQKheKX09/AZf0WS4FfwdoW31qiSL6DyJWtnvJOqh
         VeQId1/x6sTmgYqI8wgLqmEjvbQdisntBHVruNWKRvxKq4VzfmlKblvyOwG6h2qeyG3g
         IO06po2Q+6cL/q4wB5AigOOLrUsvkNlIOmOzCnILhdt4BlJndqVSoMg0O+qsGuPEdyoZ
         86WkrDFsPqaTmlIYJBZolpMM5A53ImPq7HHZVb/C5UkSiiJbdyTm2hEfyqUFYCuSZiVO
         HFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759534576; x=1760139376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xlz79RMNPM4u+3ojQF5w7+rAjiGlNcGaeeLKf0ALHE=;
        b=MDS/XGkV0ORsllR9M8RojIyu4FqeGbcT0EQf7ssVtasCxx/gE6HLpvfi9km/NOWPGJ
         ZohPGKOX/OU/nvmCl70QpjFAaAoM2GoG/NjdfkybjFVPgzD3A89dJbhg34SWkqN81kz6
         DpPWFz2lrObmCxltUR3E83nuUG5FsBBHvj3YjfSNBZUGC8BK4vmaCXrUhdJ49aj4Z6JV
         ZuIqmOQPXBCIakJLWyabcOdikLzTK6AQyIu/g0HcT77PQQMmkG6H8/8zhOYV98bhKEOd
         VUvSM2mm+ysLKFnKkJhgSGYOipVbRPvEVVTYF9GH0sYrnWJlr3EPYAawEpeiGNdUK2XG
         N9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWza+hDNRe47i+oRDHyPHYdIuyy3uXqYsLX9UoiugkzW2JwUWEwkoxxlULRftTyzInJfX8DjmlQYoH/xXKI8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ShpKKnCDaZL2PlUMoX3Jqd0362uVqdR8fTlrZcOYtL+Kh7oC
	T05dhCxo/4ZhxwC9F55b9qOZh/FviHfETcz7uxFwZ9S+uG5MiCyALB3Hf/k0dn6LWu78bNS8uZM
	7JppNknFaHtowG8GaeUnm82NZMRpkFDBqlyVdlnq1
X-Gm-Gg: ASbGncswnPFEYdlZ0XuKeqZ4Dfd55GC0IK5JrkdsXt+vuoJVcXpHG47aBM/SxXAHY0H
	yny4PxK5rcneJp6b6Md9dzdASxegYvdi1Zf71XaB4GhKjgPGG/gKsgCTOq86Y7wuqdGhqjH2r5i
	KY0NRFM4hcOzPwVusAeF5plhKEaSDPC1kLbj/bZMCsKuw+C7c5oRGXgrRv3GCUFZm8E+iDYqgVe
	SZ+oEXqiRdQUJetQbTmn0qLsHuB5pKzp3/b7zBIH7emd5pVFkDcxct/KtL0fDhnHiepp3A19YlG
	Qg==
X-Google-Smtp-Source: AGHT+IG9l/axkIR8NnMwZTrEmZ+43uvm/E3ERF/DwpGH3AQfrbOVJvfA0No74R6/aDWs9Nt5pgQhX7avAJQ3GJg5i3k=
X-Received: by 2002:a50:bb41:0:b0:62f:a20d:5a92 with SMTP id
 4fb4d7f45d1cf-63962ef1d42mr45430a12.4.1759534575811; Fri, 03 Oct 2025
 16:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003222729.322059-1-dakr@kernel.org> <20251003222729.322059-5-dakr@kernel.org>
 <CAGSQo02ASwf3Wn21jgB804LMLi3qivhtZuo7SmmD9O4m5O_Qfw@mail.gmail.com> <DD92QHU14T9S.14AE7Z1UWJ6ZT@kernel.org>
In-Reply-To: <DD92QHU14T9S.14AE7Z1UWJ6ZT@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 3 Oct 2025 16:36:04 -0700
X-Gm-Features: AS18NWA9Hl7HhL1dvCIncsYxz81lkFTamM-h0jDFaN4h87Gn9FqfvNmTJly51Wo
Message-ID: <CAGSQo01ssCYA2vxkbDmEnoSegH5ks_V=07LC3yE2Zp4eFDXiFw@mail.gmail.com>
Subject: Re: [PATCH 4/7] rust: debugfs: support blobs from smart pointers
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> I think this way around is not compatible with scoped API.
>
I thought you'd just be able to deref inside the callback, but perhaps
I'm wrong. I'll try to find a chance to pull down the patch and check.

> >> +// Delegate for `Vec<T, A>`: Support a `Vec<T, A>` with an outer lock.
> >> +impl<T, A> BinaryReaderMut for Vec<T, A>
> >> +where
> >> +    T: AsBytes + FromBytes,
> >> +    A: Allocator,
> >> +{
> >> +    fn read_from_slice_mut(
> >> +        &mut self,
> >> +        reader: &mut UserSliceReader,
> >> +        offset: usize,
> >> +    ) -> Result<usize> {
> >> +        let slice = self.as_mut_slice();
> >> +
> >
> > Nit: This is safe, but it also requires `FromBytes`, and is &mut, &mut
>
> It already requires T: AsBytes + FromBytes above. Or do you mean something else?

I mean the safety comment. Your code is right, the comment needs to be updated.
