Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C5F40DFB9
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 06:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100040; cv=none; b=VfccaUpZvwTPu/c6rcg79wnP02HGnpO4yMJXP/qkN8hRheRSPUu6SWLxgyUWc7EZ9T2MIu6+alDQ+vdAdSju5URlJ5y/FxjIb9XJSHAN4rCVBwTygCaqjP1PmvgNBRXJl3B4pxSIXSGCUfGfe9HHd7EGz9Fkwh5mxSvgc3A3WTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100040; c=relaxed/simple;
	bh=CSzvhfCSDZG8fzXqj8hvdB7HLiDXeaxPexGt+fpEwcs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyhuT72EhZ5ow/7D99xZFj0UqGCw7T6rC1/+reKrAqkvyHZZdhVGIpSIssTwNrAIgj9NtFNry2YXqR7+6yBm2hmsCKeL1VYhMxUYD98+40xWkLlL6o7zQTGQJ9cWWfUmoCrE+sUFER334z4ihI57I/tY0KshKjw6qTLd1HpEBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7BEt3EE; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7BEt3EE"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d965648a2so7639820a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 23:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777100039; x=1777704839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSzvhfCSDZG8fzXqj8hvdB7HLiDXeaxPexGt+fpEwcs=;
        b=A7BEt3EEyl20kew/6vYNHHln8M8vJKBG65cLLVgTaPx/Cg8Egr+pStlBOc6FTzmvIi
         kVaL+ZxU7WFYkRofDYE2u1d922NBHAWh9MO+dMM+7vKMxDDvirPps5/B/QqLzPkuXhW7
         3a1SeKOsBom0soZKWWYFKviaze6NDAzQ8XBWgenlRrwe1OgR7lGxfq5TOdBLIw6mLE6c
         gYs4HhRbSGGFJgT+j6QCAu85ZdfhjibhDSTjsEAtLI/OYw9zvKiwJDDVd8A8H8YK0kqN
         mW6+GvEwYoaPzBfsGMlSHnosieiBBxvm6wY874dfvm2Wkd6OuR7ZYPHtsCMzuDA7uyA5
         vfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100039; x=1777704839;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSzvhfCSDZG8fzXqj8hvdB7HLiDXeaxPexGt+fpEwcs=;
        b=BaYqe+2IsSwY9PdJonIeq9EYHp9UbSYjL7ok2JO43rgUM/8I0QG9URQtaqvp199/6J
         x/Nqe8gtwgtLM+/aoKKbXKq1VsqpkS0uAA8i5cDEUA1o8sGcR8T2tlmHOEHIZ/2hW9v0
         cPJ0+/AgEDM06mUTNsjjiEijnN/vFuwISKU9LvC1eRFOx2sajFPmh08d/+MsOG5PcSJC
         zxXdPRt42BVmT+aMBIacdUewwzE1VYoUzUUpab6RA27FDB0LosqsKjVjvTi0wGuqSl1t
         ve5s53lfDiYqe27yOm3IMCbH0hwfRu/YXBkhujr8oyTDcJ/gxru5EVYn1zcKvLvF0/68
         BY8w==
X-Forwarded-Encrypted: i=1; AFNElJ9uTK0gUREQl8/IXRw9hEmsjmCumEVCuMp/OPUprUPSTvqj9bK0WaaLVwfHVSMNguZbsIMOVNb37BIhtCO9aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDByHsbgUwOAagCRJI9t+UdfiL8PtxFCcNmfl//Eqq/GIDQ105
	/0GGVLYUMv2XrR3LsKVIDRdWzw8b/cMoD2u5czeuSNWUlH2Sb0bVk3T7
X-Gm-Gg: AeBDietRuZ+/1MyvIU2zPizXt9j2H+9hY4Ai7IIu9l5R0sH8CF5tnBMdHoEUTx8JVLS
	581daBvWm6QP3XgWqLM54CSR3bi9le67nrEdcSQGUQlqmiGkoullX27cKGr0zu1IQrsBDDRIlr1
	9TBjHAfeoVip6jH8r1kqVNYMnRztHe0g3Ty6yAyxLqn+3Hj9CkbtFUtATEibEXAZ5pX1e5Y6H9y
	O8hD+4fJKfG+O+ThF16BTonzTQTsc+RIOHHlbPBbLfQYO8n4cYYTT3BsdWDfpNZ6xOkCT4n8Nol
	5NlgPAOlt1G3EvCa6Af8b3ZdCEZBaZYeWFip8PGFW+/kFNC62OMmWiBjMo8mQglLH+J92koDuRl
	8R0nu9mp1Uk6bduD1RUGc+r9Rs+0MNLeIFF6gQEPphcTa95Oq5Mk3UP3mseHNXTT0vfH1Zwo8e4
	Tnf2Ms5Ym2UaK+kANHW82a+vujbFI6O6uMlDOiXF480kGgxJs=
X-Received: by 2002:a17:90a:d2c7:b0:35d:935f:2ff with SMTP id 98e67ed59e1d1-361403ade81mr37632682a91.2.1777100038682;
        Fri, 24 Apr 2026 23:53:58 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc575bsm25425055a91.4.2026.04.24.23.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 23:53:58 -0700 (PDT)
Message-ID: <69ec6506.170a0220.b79b6.7d25@mx.google.com>
X-Google-Original-Message-ID: <aexlA2k4NhbBkyJ4@yuwhisper-pc.>
Date: Sat, 25 Apr 2026 14:53:55 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: add doc test for `Vec::extend_with` and fix
 comment
Mail-Followup-To: Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	open list <linux-kernel@vger.kernel.org>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <DI20XVTPLERK.CQ95NC4Y3QXN@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <DI20XVTPLERK.CQ95NC4Y3QXN@nvidia.com>

Hi Alexandre,

On Sat, Apr 25, 2026 at 03:32:57PM +0900, Alexandre Courbot wrote:
>As per the guidelines [1], "A patch should do one thing and one thing
>only".
>
>These should be two separate patches.

You're right, my apologies for bundling two unrelated changes together.

Should I send these as two separate v2 patches, or start fresh with two new patch series?

Thanks,
Hsiu
