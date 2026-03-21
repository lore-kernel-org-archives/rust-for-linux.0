Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195372E88BB
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100044; cv=pass; b=eD9IxOKvRtFOercbhta2Rsl40mjZ7EwGfNZpCq1rjUQGghLRNE5TTPOAStDeVFU1ISzMyMmAEovSUobZ1sZ2cBjPguG4+3Ts1D8dnQbeWglbfSTju2PdcbDzx+a8ETbTPBqf2W+dGELV9l/xtiZnfecNfBwNtO8uijcxid9o1cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100044; c=relaxed/simple;
	bh=Cyfp4MOGbJXMiHT96dfbjAWvJEK/BWWpde8FQ3xTrOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mw5xuXsXxxoH6ztWlhRpXuqynlRW71laMHMHCKNbGtonRJWSnbre/JhX6MI1kQPVFAxMgQt2j0HZT9gQcuRNThJAcV97WNPc982HmK93fDk9sJkcG38dpezLMDT9TXcqUUhUBB8pVhfnGTbnG2Hcvs0nbUJNJ7VP7oSwVM0S25Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajQsRlkL; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajQsRlkL"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0b6f22aa4so184706eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 06:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774100042; cv=none;
        d=google.com; s=arc-20240605;
        b=UUhJRr+zy863LdtRLMgsY5T6GT+J+iayBqQwYqH4gdtyLiLNDjrUr/n8YINYydmTW9
         NkMxU3ZOb7aHSw4CXBU8AklZ0UKgCB9h5rhJHOWiWBGYXEqC/fV+QOnuanEdDL3xJrJH
         ViZOBK9eCQZsN+UPlpkp3xLLhnJadabYf3PyZ95vDxczy5kTTj9jSawJkPFy4iIL/8Ay
         AJoRfaf9MxYgI80SJA7ns7xznv5RX94/DcZj7LAsZgWbPnKSnS8wGulQXB0PAvuQ1ofV
         z2T/O+P4f22kHqfehbJLWTZ352LTJcF8ukXeyecBN4AwGplChqeUC3NCH0VnshmENei8
         1I0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxNYvkoMi8SXclAI7J++tVk47zsDBqwMkV8+EwFN1W0=;
        fh=3YoS7soIjtAMa9ff9zsxY2Dd2j5uLS+Y6xzbvtP+Fgk=;
        b=lzoxAj/mvhloGz4pLuwnrvLVtjRbBgBejiOlGW21hrYE3Y4uuBQrWxI1bMF79iAZfJ
         2cxhC+URYSRNtD+/EV3y8+4VXtsCa8dEZ/Zokj/d+QWJsr/uaXdwpLGBV1cp2nfFXWVP
         eFGcyV9x9w+d1dux/gPCpKEY/mCvn8FwUUu5ekTOJqMGC4WvRMmN6dDnMXYQ6U974KKB
         ryx7iPPNFkwCfmsfNgXodafBSdQD6F9x7FC/kE5j8B1kr3TndiS/1XIEd11VX+PBbYHI
         oFhn9KUzHO2O2WdcvJ12l85rzT6J9aQb95iM1TesiABAaqJWvX/CJOU2f28BhnR1vzYI
         rSJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774100042; x=1774704842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxNYvkoMi8SXclAI7J++tVk47zsDBqwMkV8+EwFN1W0=;
        b=ajQsRlkLYOp7M0Bkc4NRaOUNwqHd6yeWGZc2G7+52x4voUeZJr83WMRJAGwB9ar/Io
         BwPZhXIJWliiGgdwKJ/oEyv5iuyZ7N/i+fDgh6oGSv1L+2SvzDxRIPLAn3m0Wsp53q54
         TF2/lqbObYc1WSrDC7CCz3ql0dOZGUNWW7Ln7fNdqTq5Oj6wNmvZfBGH2s2PECO+je/q
         d+HEFYvoYD1PYm167kh6incxwe0DUPxHOQ1FxYAEMOOaMMu+HhqV2u8IAhk3baOZB16W
         fNJqxZXPwrBy+Hyvohl72GydlR27MEaZW8Slc5IPZEQXjQ8QUV0nHaBKVG1eIH3e8opa
         w8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774100042; x=1774704842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sxNYvkoMi8SXclAI7J++tVk47zsDBqwMkV8+EwFN1W0=;
        b=AfHI5WRs9g7hb2sHCT51V8A99DOBFbhnTErfHYFDvE+kWEVBMSrVZZZyrJQjBZTZ4g
         HVoTLj5sXfk+1pfsYUa5KZLldK9mKdjMVKDW5vJVa5SgGiQg6ItRaNo907bNUoKieBW9
         b0ZwusDArO0O9yyh2QQP7JGkzlM5WWnIjqd2VNKHIJOoue2JyzD+fkRsjifNNJCzpFMO
         zBDEsiZeNHgNBnqpsueuxBCv5c1FgqKEp/FAByJKMNKKIlKQNs2XCDj6rBB//syBXWnZ
         NhWwOKwHZOY2AFLBeqsADyrEFL3WdZWAARAjuEPNEOsdqoFypqRml4464QZIEY8GaHra
         Ja+A==
X-Forwarded-Encrypted: i=1; AJvYcCVrYbFtn/ueyXRUTjaUwM2YEHs0m4nNeoIL98d2gjo9BAMwUYQ+4WbHL6PumHmilUN+3k8igNu0g753N0lg3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3iBbkFaHmdW3cWI6PCDLOOwVcwdEFkbCTRitBrK3vEODHvhe
	94n1Nyxcf4Wtr9MYruCKWtIAvyj7r/SQpmPgt3xphQjKkTIgiUW9SZvHuBJV2S0kT3Q6oszKbF5
	ESFMu067Njy8F1v5voUKQaQbQtsWU7Bs=
X-Gm-Gg: ATEYQzwNSA4PEne8sXGE1bEKwBWDIZLRM0FhXV2NKC+p5CXcUqrwy6RUZCD5MG8jRpA
	zYgN/7X3grto/0kIseT944oPL7mLMkP7/qaVFp5rWTQWvc0+lDm134iVgj2pVLAyYQUMG0S5CZU
	S08IIJKcnGfoAg0brqQCmkkmr5NNruv5jxF204amglIldDeD8SLwLCs6v7K6eVmpE5+R++c5phv
	bnPluwmUzxdxNxFofim2pLQ9kPTC9ZeWQ13wnMRHOPTAh2jrEsos88F99fm5W0pq5dgEgN7cNFv
	Un5P9WUdZuptFFSE00kMmiVSrz5A4bLC4wDXj7g3hkzbMxxLFt9mk3Nhj6f0uH6csmM/Dm9+X9y
	rOcJjHF7iiiHlsCPci061mVg=
X-Received: by 2002:a05:7300:4306:b0:2b6:f2d5:2923 with SMTP id
 5a478bee46e88-2c1098861afmr1462939eec.7.1774100042177; Sat, 21 Mar 2026
 06:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1f94cf47-9898-405d-bdf2-29e21cd87528@nvidia.com> <87ldfmtfk7.fsf@linux.dev>
In-Reply-To: <87ldfmtfk7.fsf@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Mar 2026 14:33:49 +0100
X-Gm-Features: AaiRm537phjdHidGVAf1007v_8W_3H-qjtaFgpcsDGtT1PP8A_h_Ukclbw-WOxo
Message-ID: <CANiq72=HYHj4ZhFWqTJk3DhVEoOqFKah6yA9ROfC+Z797SwUZw@mail.gmail.com>
Subject: Re: Sashiko.dev for Rust for Linux
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 9:24=E2=80=AFPM Roman Gushchin <roman.gushchin@linu=
x.dev> wrote:
>
> Yes, I'm going to add rust-for-linux (will appear ~tomorrow), but a
> bunch of patchsets which cc'ed lkml have already been reviewed, please,
> take a look.

I see the list there:

  https://sashiko.dev/#/?list=3Dorg.kernel.vger.rust-for-linux

I have just added a link to it from rust-for-linux.com (in the menu
bar, where I keep many links to resources etc.), and announced it in
our Zulip and the mailing list (I guess this thread is short enough
that could have served the purpose too).

> We don't need any rules/skills to get *some* reviews, but we certainly
> might need some prompts to get *better* reviews, both in terms of bug
> discovery and false positives. If you'll master something, I'm more than
> happy to give it a try.

Yeah, we should definitely add some context (and possibly skills like
Coccinelle for Rust to match the recently merged Coccinelle one
eventually).

I see Gary already replied -- I was going to mention that he has been
playing around with it for some days indeed!

Thanks a lot!

Cheers,
Miguel
