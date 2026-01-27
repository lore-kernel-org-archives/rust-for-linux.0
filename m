Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A045D262FEC
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522807; cv=none; b=ruZ7FGPYvnpH7zSwVI2GGdy/6/OSFK3+RzkzOPokD0vDTzgshyMosBjpH6auHxYc09hgub6qQAa752wjpFrAaRW/LHDMPOkCoqxsIcil2YLOctnCUHYRnIsBV7IqIQoHpFKiHrTXjhFR8+sSetyfq4XTyor4jmazU8EEYJJ9rgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522807; c=relaxed/simple;
	bh=xyXn8cyiAzlKXuVNOiFTzEpiO7S4YTBTgM5b2Hrp5LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZwH4m+iTnIcDfcPcuzi7ARxJLNpHP+68zRviQh0BR4y+3eu7ruDFDheWopCl9PrliEfENx/3QE4F3v9bGUGnyKcSBGFdQI3SDIuQ5qH0mnwFRfPXs+MHeau8SidrVji1Co3RGjfBJPCJ0u/W0VNGEgR0Qs81Vme+HiM9MLkw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XB9udGZp; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB9udGZp"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50331ac1fedso4808221cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769522804; x=1770127604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZ7vT2lPy8FgSQDsZLklHZSjzPS3T1P/Yj8mXh5VQf4=;
        b=XB9udGZpmNRB6WtXRQQZZ1zNrXJcrWec5s73fEI2zYV2pmLYCDPdbTFnrGYc6C6gMk
         D8hU8KrTPxRNsqPtSX3uDWPi/YRtb8CTSV/IYPgOueYQPwzCF5TTlu8Hfa3iyXMSu/7Q
         3Cv7VINRtym4Bf56Onm1PYlzNjaFcOlLLwx/JwzZpB1B9l+K1VhUZVeRKPT0ylXUfDYn
         bGXxV8GRYu+A2NGY/ZA20BZiUvRiLbMqaGr/yv3tLxFXECVXLrN5LHRZUa7wQmRyYJGj
         /dXZJ1502vz4GbvU8oHdxwKa1OqgsBwMTl7azAQJ5ZbBTuiO/2I3ogdozaGrR+KEK+0n
         rg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522804; x=1770127604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZ7vT2lPy8FgSQDsZLklHZSjzPS3T1P/Yj8mXh5VQf4=;
        b=ATN2FaW33WdpiCdbE9zuAo7UoVvJqYLLv7NgdUL744AkB4fLfhcNJa8t72qlAD83iR
         kzLUGUIrGOcLXFCLdz4zpyX6LjqLt5hn7ORC0s3RTLwjKBkDB+TKNPk//XHE1ZqKOoir
         Hfhe28LTCRGGlUS1jN+9y+w6PlpVagIiiST7jS5U9VJOiWaMp2wjRi/9uZgxjyGeVXUz
         Ws7NvHxbiXMM3852WawaAf+eOW14ZwbvvlMFocgqDAJ5RBnbjMZO0PZ9M2PkMImTR8t7
         edCKyoos5rfd9cncooTu8NZk6yLdAw1wsmeMcuQm9A+kXQcydPB0evFZAV6K+t6FLbsS
         yVtg==
X-Forwarded-Encrypted: i=1; AJvYcCUBkyaCQbkhKXL2KCcmQYdl+Re0U+CSsCC/CMnAFA6ph6hYbfRZb6k5ByPk8f9sHvEf1aa9TRlG00fqbn/AYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzESfJUMcMN/V4qL6zvEQV7A6mguNIKtS86CG7Ttfpm3Pscx/62
	wFD+7ENHOf5Z4k/DqmlmzRzWzzFVUCqwAH3jqaM35dNxvMRMJOHfMGi3
X-Gm-Gg: AZuq6aLrAcQoS3W+mdpiDJc2E/jsgMwcO0sKDTNoxhSti+1Zsm4AFl8SRMW0zSGzvlU
	MRPysX5TCBpcoSb9r8QktPlIGV+7L5SIMcxwVxs4PPR9e8LxOVaeERjtnQlT2L9QMzBWX8Se+41
	AjCUbqr7qm9LKTlR5c2W/D/t63qKKiIl+seuaAEFU+c+21T8Fg2mDxlSCFi3133ZjMh+FqRGLyl
	JI31dWAHEStgquGi/Iru8dFdyyXhRI3nBv5Wru0xzBNJlHBxX58tC6X3CdydWeo7gYgRvpqVGLk
	w0OfFgBt3yc8UoD9+mLn+WXZy02uOfqICLJ9s/VWeZHxDVlX4aW4u87RSqEYYdYobwdfO9cPGRK
	m7WUrSDCB9iT8xlcceJ6gfnPE7K1D3Mk+n0DZW4nLUn1S26ALSpPLUpnv7qdFp6WJPszQ9ZgYzw
	JYs2ncw7Uhw6vTV5RtT0W4LIEGczJH9cBvGDdXcRGYqkPC5Ybm4JOB5CN6l7eEkMMQTinjd3u64
	fT/1i+1Yrak7Bs=
X-Received: by 2002:ac8:5914:0:b0:4f5:fd34:bb02 with SMTP id d75a77b69052e-5032fa1b725mr17902391cf.57.1769522803996;
        Tue, 27 Jan 2026 06:06:43 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50335bcfd1esm506441cf.30.2026.01.27.06.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:06:43 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 082B7F40090;
	Tue, 27 Jan 2026 09:06:43 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 27 Jan 2026 09:06:43 -0500
X-ME-Sender: <xms:csZ4aRZ4GFQau_NGS3Bc-kMA0gmg0Pj5QmaaXrUd-whebsOndbsxTg>
    <xme:csZ4ae6EBPiK6SrKpBecEB7SaGToruvcj6zyNDQ8dQ846981u38TRrb3Rq7fCqpQh
    4zcAykodt3JDUECnDskGSXkd1XoG-8m902hd-bXH6UEbU9IimTFNw>
X-ME-Received: <xmr:csZ4aR94rDF3ylgsATTpYA8RiKRm3PowsnMie6TQ2nJXLuhIzDjTFqpniv5PRTmmquy9tyOFeaJhC2ous6eskqDpnm29aQYt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedtjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepthgrmhhirhgusehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhosh
    hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:csZ4aSZLmcZTslfcBwf_apOsrW2QuBXY7B4zrIzpJf547DD1aVvI_Q>
    <xmx:csZ4aS4Gv_04iOHhN5IO2gDEWkMDoCk6MqmQ5SfWcIDN3tPoEMJSsA>
    <xmx:csZ4afnoEN42c7stMeGB6MDXNJ_FgYZEsKEPi6X2-u72hYfBxEyfJw>
    <xmx:csZ4aaE1hjmML2mg6Z0XQBMfNgFCj_I7LGVa8JNfnMEo8MNI1W_Gjg>
    <xmx:c8Z4aQjDP1FMQ1x943zP7cCP4_p39NhFxs1WCpdJvtP1NHwS2Sz4EYiN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 09:06:42 -0500 (EST)
Date: Tue, 27 Jan 2026 06:06:41 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL][PATCH 0/1] Fixes for Rust synchronization PR of v7.0
Message-ID: <aXjGccnQ5mj-Lwb0@tardis.local>
References: <aXAnTVnprfDnj7se@tardis-2.local>
 <20260123054624.8226-1-boqun.feng@gmail.com>
 <20260127083014.GT171111@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127083014.GT171111@noisy.programming.kicks-ass.net>

On Tue, Jan 27, 2026 at 09:30:14AM +0100, Peter Zijlstra wrote:
> On Thu, Jan 22, 2026 at 09:46:23PM -0800, Boqun Feng wrote:
> > Hi Peter,
> > 
> > Although we chatted about this over IRC, but I figured it might be
> > better for me to just send a fix PR for this, so here is it.
> > 
> > Thanks!
> > 
> > Regards,
> > Boqun
> > 
> > --------------------------------->8
> > The following changes since commit ccf9e070116a81d29aae30db501d562c8efd1ed8:
> > 
> >   rust: sync: Inline various lock related methods (2026-01-10 10:53:46 +0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sync-fixes-for-v7.0-pr
> > 
> > for you to fetch changes up to 6583920e15fc567109e1c64ca58c917f52f40736:
> > 
> >   rust: sync: Replace `kernel::c_str!` with C-Strings (2026-01-22 21:36:57 -0800)
> > 
> > ----------------------------------------------------------------
> > Fixes for Rust sync v7.0 PR:
> > 
> > - Remove the usage of `c_str!()` in the example of static_lock_class!()
> 
> So I'm notoriously bad at keeping track of version numbers; but I'm
> thinking you want this in tip/locking/urgent, right? Thing is, it

No, it's targeting tip/locking/core, it's a fix to the PR that is going
into v7.0. Or I guess I could just say it's a "part 2" for the PR to
reduce ambiguity?

Regards,
Boqun

> doesn't apply :/
