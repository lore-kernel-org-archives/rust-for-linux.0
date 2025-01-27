Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A71922C4;
	Mon, 27 Jan 2025 19:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738006631; cv=none; b=uvbRTiVUR1mlrHb1sUOgcBiVMGgmlNVKdY3Qw+dcV9E5yT/oDtN3nwKla3nucPJt6RhYlmBRDgUbXz+fU8pOtRc5CnwjKIY4H1iAosKvlt6tgNFew9BrFAGqkYsZ1CBfN7OXIhGnHW6xAqw//TDLsk4i1DBdE2kv60vmglPzx3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738006631; c=relaxed/simple;
	bh=aspYQodIOsASH81q6vfQ9ZANESRBw754U6WbZGaPlRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enQkFS2lrGgoIkeJKRvaLSnoihwAcWeSW5PPd5WJIwAEv6q7h8cbNp1E3VTsiB1bqd9CK5S2vRpaCitZCVWTH8L7L9he56Cwg3V4YH1+TyWc1hoBnhpbS6F0XZzMbRWXBDKCVLJ3dJuVepA1wUiD4o+IjKR+ladp4ptd8/gfUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/aOdPC1; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/aOdPC1"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd420f82e2so61490556d6.1;
        Mon, 27 Jan 2025 11:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738006629; x=1738611429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0ToixAfq6gQz7QhMKLfytUT3gyityDNzyR9zHuPjbI=;
        b=L/aOdPC1R0GuvdYDg2RmqenSr/Ikywvj83cKGC3nXx5j6XaUV0hDZJ1Z0WY4TPerCM
         Lf/1MLN/zeyQeqEgoMwNI1MDLBB3ayyi3az/6zSBAYzdFiw77cB6K6EUWVcsM8kaswvX
         PgtVwd1RJY7ClyaEvgqZYSVu1hd35FrhEFe7KixPO+cUzxah4dXg0fOc9T700XjwHjiu
         vNbC8zjJdIkQKIGY4e+jtqjXa8SDEcCUtKYcT/+ZnMN526ou5cFyMuGZcXZ9Ef8hFYQY
         uM97s2Q/SVduMoPyp86vZSyI+/c0DRev+o6CV4myxLokW/mITwF1m995qqtpltXlWQ1j
         +hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738006629; x=1738611429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0ToixAfq6gQz7QhMKLfytUT3gyityDNzyR9zHuPjbI=;
        b=gnxdPbmi7DhzDvk3xsc1L9Orqy+IMtpBpkiXelbAIpB9lw5SQFxpF4N4SF6UQhmC/R
         +ynj5ooglaNIprCIgAzIyDPovlMKPqEi/Sy9nr/Mev8BFLYnzNrodb11XsxdaDoPIDkx
         uIJz44m2OY7YWlvM+9ZW6je2Aicuj3lyCRqbCM+tmgWww/M+WMOZE9xpp/6tY4oq09aK
         Mn43tiUvBM9CbYFThc94/JpNXL+RcA2YOwazN1WaBcvtBJzrwSYSLMsrPEGl3W4KfXJJ
         gJw1mdGgsZo1jirxV84Esx8GqZk4dgLjtTm1LjkpZcOlh7AzZuGfKWni4s5VDTfZlELT
         +wyA==
X-Forwarded-Encrypted: i=1; AJvYcCUY/Wn+3o2tFVmFVqGIYCxdn9sl6FkCr4wLqpE2Cm46BQS4cLVB8mWL+Qqfe192dmHvABYIh2wiJTiCh4M=@vger.kernel.org, AJvYcCWtSWriSH8MBPx4RNhkyrmr/ghgtke9HYN2JuVF5p849KCBk9fOhzKQFTAN4MjauzYUo6zbozfciFhWRJh3B3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAiuuuXLJ6eGgpgB4UPXOmCBjz3YZUhEmnZuVVwIgHkLNLCoGw
	UQ5+FDSuczuy54pErv1RjHAAc8p3nYs5pfHpEysNE9/vD+JzJHub
X-Gm-Gg: ASbGncs31ivRTINJ++iI/KqOAq33rYL23c4J9pNuQEK6b1+TX8qj5fbT3+XR7wtgB3N
	n44Jhp2AJe/fkq3gHpf77JR1g6ICRUxYKR+jcUl5myxyhAtSpOJKMwu7uPHbUz7rvIhaGDAu3pO
	Bk/xJx+s2e756zfR/mX7NNdELSiDFtNpv0AZouDSQhBuUoPPIToAIWHUEvyZWrDFGk7+nfJKdUc
	JIVxxEDAHUJJvOMrxjqkgXIEc9x8YrNS7/1PFVz5i7hFrkbTozIUWCn1s1y/kbmkpoW7zJRKgx/
	opNKCOrU88M2OaMfN9pPG3hXvdXo2fu0GDAJovzsSgm4nxFmlZD7ThuPiGRSheIhHDcn5sM=
X-Google-Smtp-Source: AGHT+IEHao9uh0T/xjPL/a8jVvCwsURvzYbLFWGC6I+YUmDdM/v3xY6aDyntff1+HetPFnZFp+8bXw==
X-Received: by 2002:a05:6214:2aa6:b0:6d4:e0a:230e with SMTP id 6a1803df08f44-6e1b217922bmr662265516d6.16.1738006628687;
        Mon, 27 Jan 2025 11:37:08 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e20514ededsm37468166d6.35.2025.01.27.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 11:37:08 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 786F51200076;
	Mon, 27 Jan 2025 14:37:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 27 Jan 2025 14:37:07 -0500
X-ME-Sender: <xms:Y-CXZ1LOxAwj6KqAYibtkdY7_FEf1cxIosysKtVOprtj0v-bCjFeYw>
    <xme:Y-CXZxKht9hkf02MRmh54NYbwGZydBRG-_VcmI-qYqcIpjLGNdVwuG30pHxcO-9oP
    ZT_x3B-t1kpHWmIOA>
X-ME-Received: <xmr:Y-CXZ9sY3lAS8rFgQOC-tnVR6fajY1_SMsO14gWCftdnCeUO9JHnMTKnzL5_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudegtdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeetgfehvdeihfehffetgeffffelvdehudek
    geektdduhefhleeuhfevuedtjeffgfenucffohhmrghinhepohhpvghnqdhsthgurdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsgho
    qhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqd
    dujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihm
    vgdrnhgrmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepuggr
    khhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrsgguihgvlhdrjhgrnhhulhhguh
    gvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiug
    grsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprhhosghinhdrmhhurhhphhih
    segrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehg
    rghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:Y-CXZ2bDrBFBchlAtM6-QMGWZNjtVLvAdB8fAdyfLPBbyIjDXFbLBw>
    <xmx:Y-CXZ8aaaJD6uo0TuLe73ImNh3bSgDNOnqzNth7cgpvlTTntfBR9Wg>
    <xmx:Y-CXZ6BmBlvdJfaw8AW4mVLNxknYlSQl1GxRtGCsLH9avr6cShztCA>
    <xmx:Y-CXZ6YDC1A-9LXF1qBqTbgzkDhT1BiNSAQbhpwxkOWhFy3CBioaQw>
    <xmx:Y-CXZ4p-sFPN-PkzGNaVky1eqaoErVnYZ_J3hia834k1-e4_6BeZ8dtX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jan 2025 14:37:06 -0500 (EST)
Date: Mon, 27 Jan 2025 11:37:06 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
	robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
Message-ID: <Z5fgYtIdOudE3ELF@tardis.local>
References: <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <Z5dh6cSnNxwbefJX@pollux>
 <CAH5fLggMSiHZwHJ3md0eH7smyDNVL3L=Sre7F0SXSSnPrJiO-A@mail.gmail.com>
 <Z5e7Xv4Y9007Ia0a@tardis.local>
 <CAH5fLgh6_+yT36KQTML6wZTiKXO10HsueCDM5LvEbsD-8Wo6Jg@mail.gmail.com>
 <Z5fSrgLO0nO67p-U@tardis.local>
 <CAH5fLggQuuOfp19tqxYr=U-R+fyqgygYV8MeybvHLChk_eHPMw@mail.gmail.com>
 <Z5fYAGxXymV1xTFL@tardis.local>
 <CAH5fLgjys9wkSy=YSnw6QoOw_rbfgkLr5nNSGhh_+CSOUcaWkg@mail.gmail.com>
 <Z5fc0EFCUdXlkpWB@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5fc0EFCUdXlkpWB@tardis.local>

On Mon, Jan 27, 2025 at 11:21:52AM -0800, Boqun Feng wrote:
[...]
> > > Depending on the granularity that tearing can happen, if .foo is an enum
> > > (or any other type that not all bit combinations are valid) and tearing
> > > can happen at byte levels, then a racing dma_read() may read invalid
> > > data.
> > 
> > T: FromBytes + ToBytes is already required for these types. You can't
> > use these operations with such an enum.
> > 
> 
> I was talking about a wider problem, but fine ;-) So the assumption is
> the read_volatile() or copy_nonoverlapping() provide byte-level
> atomicity? Although unlikely, but if tearing happens at sub-byte level,
> then even if `T: FromBytes + ToBytes` you can still get invalid data.
> 

OK, `FromBytes + ToBytes` should tolerate sub-byte level tearing, so I
was wrong on this.

> > > I think it's fine to expect read_volatile() and write_volatile()
> > > themselves don't trigger UB, but we will need to be careful about the
> > > atomic granularity that we can expect on them. It would be more clear if
> > > we use the atomic API here (and implementation can be read_volatile()
> > > and write_volatile()), and it can avoid coding based on tribal knowledge
> > > such as "in kernel, read_volatile() and write_volatile() imply atomic".
> > 
> > Why should we use atomics for operations that don't need to be atomic?

And yes, given the `FromBytes + ToBytes`, it looks like you don't need
any atomicity for the basic DMA read/write operation.

Regards,
Boqun

> > Most of the time, dma memory is not *actually* changed while you read
> > it.
> > 
> 
> Because the requirement here actually needs atomic at byte level, it's
> similar to:
> 
> 	https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2022/p1478r8.html
> 
> also, notice that for byte level atomic, it's actually free on most of
> the architectures (i.e. no extra cost). Again, it's more of a "how do we
> express our assumption" question. If indeed we expect byte-level
> atomicity, then I see no harm to use atomic API here.
> 
> Regards,
> Boqun
> 
> > Alice
