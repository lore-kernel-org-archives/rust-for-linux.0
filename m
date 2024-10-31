Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6671A302E
	for <rust-for-linux@vger.kernel.org>; Thu, 31 Oct 2024 20:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730404844; cv=none; b=XjKm/1ujO0pKSaean2x+2fOoL17bZp5jgV933TFX+S3u2pqhqKVOtqks+KC8dbMQYN9SgnYNNxObuKZhl4LVDkOP0VijYyw8pa9FG+wm5/VnAzgL1QOJ2NyPC0O8UzLIDwiZS/5JaKnE6997wTsXVmuUeoQgcU+I52Vd4C2v4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730404844; c=relaxed/simple;
	bh=iDAzPgn9vQQIclwk4KVakaDzMOUp56nE/SfuLH3hk08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8To0/gG5y1hkkPF+aSGn39X0+uJtNSxpuuJ+CXtK3NiCq6qQRj5JyXGCuMID7ed5Za//M/q/S7ODQgxnx9Lwxi+hCay7e+oMDFljKnYFZOPHoFFhT2rOT7dVLQpVRXPnDtZLcolSWVgDR6j8IgspRkQxMvFTNnr8KHzLUYN4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qmx5JRG/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qmx5JRG/"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e681ba70so1168e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 31 Oct 2024 13:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730404841; x=1731009641; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jkl3TjMzcf3dryOCaAILRFpWIEyfiit3GjcJM3g5SKw=;
        b=Qmx5JRG/WvY08/igfKnIIa69WHbuc/1HW5WvS5i20r3Ai+ppafazCqQLnE8dxX3FV/
         I1QY/ye7Og5rWWfPTtdXqbccGBxEQvnAIAtzkeScYnWZVCNygPnvCJOWOUpUssjqO+5K
         J8IlybxA+IqOYd5c37tHWU3SA9S/jl3m9lCBrcJe1/sBRyWLLSqRMBuuTxT5mJdNZZni
         sYo1izj3l6ptsaTZYCuLpfUgDNZtKLGPa4ysJdfV5Yvc+mML/5RElZfFbvGazsTh5qD1
         E6+msdA1dxmRntK4BMjPS4x7RmgG+P/nlzQxMX0kWVcwLMeoVdnoCNY0AR4fsA6bEyaD
         i5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404841; x=1731009641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkl3TjMzcf3dryOCaAILRFpWIEyfiit3GjcJM3g5SKw=;
        b=YRa1TUvZx+q8ta2euXLGBV9skK1aVrV81nOQNrasMIrgMdiHl9s0JqJPgvgmf5yKVH
         Jk+3YpfWuqJIcwOdu+FTlgWyrmpYpnzHptvQcsiFWGCW/96cBq0bfvZreLQIM2OtCybE
         j+TE8DR60cm1UPrhkgQAERedxHzDZtryfiUVOLxBprWGbDH5PxxFoQleHoxRHar+2Vi9
         HxYAXlVcCNC0OUwITZCwHFE7OUwWeBYtRqFOMPjAIlJc83KngwiKtKRnnZFrSxk2ukg3
         NifxhSMMmGiO/LBRvRnp/BRi/Z+91AtLEJSivr64GSkoiUxMxNWGA9AL6vsQIigtdYdT
         hdtw==
X-Forwarded-Encrypted: i=1; AJvYcCVRbmCQXddjrFNKBGWInprrPQadrIlCw/bKloDlGzehGl34ZOJeH6rOIHDFp2pJ7nEB+pJzCZEFF7ezKrHdFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkv5iWJrfRv8iWUSwBSOHSQFbDbZRB8iyUZO+oY1CgD6mhCGyh
	yC5VrvsBULgtEA3pqtWd3he2yVDHMfUPF/zQFhi3oZwgeFjk6zCmb7j6WVlieiCDL02ob0+mSGb
	BCG0xDohUO9coviPtPLmIY2a8SPf8JrC2xyLf
X-Gm-Gg: ASbGncv3xvmWc2i/k0/ksaYGEWZJERbJXCS1wjNmgVSOYm7YIUiEpXnGAxqLCeqr9Ja
	Zp9Iw2BgX5H5dXs/XoXNbJCGc2ytyF6Kc10XmV+aFJP+O+Lc5n39IN2Man1tpZQ==
X-Google-Smtp-Source: AGHT+IEW2y5lzn/VGPepBdOsO+AzXleOvvzprjMKDOQXm2ENavWPeRp4bswreZ8MVte2QFNa89v1fS8lAyebQn8YFdc=
X-Received: by 2002:a05:6512:4024:b0:53b:5ae5:a9c8 with SMTP id
 2adb3069b0e04-53c7bb8e9f5mr385129e87.7.1730404840475; Thu, 31 Oct 2024
 13:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com> <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
In-Reply-To: <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 31 Oct 2024 13:00:28 -0700
Message-ID: <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The question is, if only extended moversions are used, what new tooling
> requirements are there? Can you test using only extended modversions?
>
>   Luis

I'm not sure precisely what you're asking for. Do you want:
1. A kconfig that suppresses the emission of today's MODVERSIONS
format? This would be fairly easy to do, but I was leaving it enabled
for compatibility's sake, at least until extended modversions become
more common. This way existing `kmod` tools and kernels would continue
to be able to load new-style modules.
2. libkmod support for parsing the new format? I can do that fairly
easily too, but wanted the format actually decided on and accepted
before I started modifying things that read modversions.
3. Something else? Maybe I'm not understanding your comment?
