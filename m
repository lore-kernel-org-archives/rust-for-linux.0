Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA61BD01F;
	Thu, 23 Jan 2025 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737616699; cv=none; b=KfHiQrtJl/QbZCtJ1aL8/lWV3X8S0nRhvfGXu/oHAOc+5WuzLMZnLQKKCHoPcLXIs1sZViDX9puSwZ63+/3DcrIwN7EQX+AMRG0iSsRFnaROvZT5w6ClK1HhgHrKGJ6t5k3TT7JpHjoiAyhr4ZJNRYWR6TLJ4jHgY5VH38jty4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737616699; c=relaxed/simple;
	bh=euq3CiomAIC93+63pHqOCnawEQTF0Yy+Mx0xe51zmy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQcpoHGXZXEcTO5anIHveCHVq0AjnjGM1p6UrdOqYLbkIDpfKU4Uq0094n6Y8i3w3fXwgYr9rkBwYuRr28Jk+PKH0KrI2Wlp2cLfT90ZVlud5v6dG+s0gKXXTZKa65vhXk738fE3xarLVAMhXYSEnmpxCvb9sU/5tjLlZ8bWn2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6+NpF3K; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6+NpF3K"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b98a2e3b3eso27888585a.2;
        Wed, 22 Jan 2025 23:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737616695; x=1738221495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g/1frNBbfWqLS9S3KVXPmBoE1O+YiMFDgEk0SEF3FU=;
        b=g6+NpF3KzDdyTo36/w0v2siIyP3EdOGJs/zwakAlRTbjfmZd7/j//YGPnzmfxQqhH2
         uhlWmayT3IGui2okyK68O+PfKnTb1uXDdl0xaB6CYCyvztZ9+QPXKkzhg1kmoM1Z0Tx2
         OVisF2hlleBefBUICJz3VSluu1uRPf5FAhbNRDgi6yYs/fV+CKYukWTFkK8UFEd8647v
         NUI64UwSA6rx9kHEYXHNPLWHGIcq5mSjtE9EbekY5cFtXpxuJU1b7yDSD/G9nh0DDHVT
         NPzQbzQj20NUxnixP4qXVYVmVfVJ2w9EzfTkaAKSaKPFijv9jSNxdTgnRFEzjBUQ/oUJ
         SmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737616695; x=1738221495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g/1frNBbfWqLS9S3KVXPmBoE1O+YiMFDgEk0SEF3FU=;
        b=m82kf/fa9932wGmuMZPtIh6/CFNpxju2q8t1sCQ/Z9JhxZtFkX4zPNzj2RFe+h3f1+
         k49VM//4CPBx3gNeMsl3qbJehONcpivzAzFuSEPIkveCIsEuHgefhAilG9N5LJqkQJmX
         t8dbaWXOQiNw99KDEc2hL+4n8So9ughUgdjmUIrBoorYhEcdlTcXClivy+kQeAOp0uHA
         2PWWgthmN89hKgeSpQM0qRotNSRfPrFeTUTajI9Y+y6CcAr12sc2tkHtIaZ1wU9bEPPR
         /sJptfqfyQPWcKxZj4321c/Juj/TE7dWBr5ObLQFlGrt8GCf7rxQ3WotF+d9eER2ZimK
         JUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5OCygP4yxOu03kCDWyQLCVujTKdWtqg+IR4M1OnziTpdaH9mLEGAbMtHWt81hWvL5WuPO8PQ3dKFayLI6ZMA=@vger.kernel.org, AJvYcCWUoVC2WH2j7kwZF2WNbXXbSbJM3GpwqONJFC2DAQBNpLiUs1W8X6hiJcUTj4yzDphSj1UonN/zP3I7Vcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsIX8V6DCMG8D+8eiuPm4xO5T21mBKpDlyFu6ss4nu4vLcYaHU
	cxHJM9ailTtYfmrKPKJrLXp1er/lPQGmoGfkanGxItmdYGRl9rzx
X-Gm-Gg: ASbGncu3Tjk+rQTEt4s2apYNgJuoGHBqEw3engmuHQ0yczwVq/mbI3H8Q/6EpySzoL9
	rKtE3N1T4+Rw1bEDbgb1aokUQ4Bmv5/YjaRO4ICmW9wvl7GgxGGB20/gnClWgGu0rr6ApPdb5fC
	o9knQFnZqv/to6Ltacci9BkTKp5QCdvWiKMiiDt3/fMAsuRcX/xT5x0jhYH0BjtB2fsY5JTezPP
	4kv5oialnxWrykBkhGPlQTBgTbdjrwPv64B5mW8CNsHW6ZFS5FtZkGTT6TGkK7Gnc+CYsodC3O4
	MIBVnKmpmkApXRoW4vPL7Q4ZJwANXCLZrfdn3zaVKnq01TkUIYdkKbfSANEhOvT7eilS1Qo=
X-Google-Smtp-Source: AGHT+IEnOiHkCOHi2/ZvX182Z3Vx6VpDDTGFycvS8d6sAimKDc5nhlbt4anIYknUahr3/fqJJ0KpfA==
X-Received: by 2002:a05:620a:1916:b0:7b6:e98e:ad15 with SMTP id af79cd13be357-7be6320d09cmr3545175885a.34.1737616695166;
        Wed, 22 Jan 2025 23:18:15 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614ef214sm735590085a.104.2025.01.22.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 23:18:14 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 445E61200068;
	Thu, 23 Jan 2025 02:18:14 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 23 Jan 2025 02:18:14 -0500
X-ME-Sender: <xms:Nu2RZylrgxTy_LlZ3cExJd6cbfij2djPzBxeGGY9S7jnyscRQjKn9Q>
    <xme:Nu2RZ52S_W3hLoPEhtBLPId0EFJFT7_9tg0wQQdbrinPnZVWTIMlF7Hh4vGOXG6Th
    -KCf-RT3w7I21wNgg>
X-ME-Received: <xmr:Nu2RZwrTzOzRb7y0fL9WsiIygz9kzE-p93gGipFGc1bpF7e808nHVBnxBUI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtoh
    hllhgrsghorhgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtth
    hopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhh
    sehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinh
    esphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtth
    hopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Nu2RZ2lD7FYKqNKqRa76_XZWIpVAuFRC_aHgOKixMh5Ok2RtDaP4gA>
    <xmx:Nu2RZw3OOLaYDgl2d9mC60JzwAX7tN0m_Yxy3jL8jOp8rPq-m8U4kw>
    <xmx:Nu2RZ9sFMlpcHv6R09p3OQK8cUdkBBVXSxo_xvi228Fup8vUtW5NvQ>
    <xmx:Nu2RZ8XREBtpmsvilH-kj4t0bUalqbK2k-2U4UJs3ZBwywzF0DcERQ>
    <xmx:Nu2RZ70b7eJ3xB63sKMQ0yEnvrZ_oKlaAeQ0t4nbFmGGgbi9gT_psl0s>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 02:18:13 -0500 (EST)
Date: Wed, 22 Jan 2025 23:17:49 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
Message-ID: <Z5HtHVMipAdNvOcj@boqun-archlinux>
References: <20250122163932.46697-1-daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122163932.46697-1-daniel.almeida@collabora.com>

On Wed, Jan 22, 2025 at 01:39:30PM -0300, Daniel Almeida wrote:
> Add support for registering IRQ handlers in Rust.
> 
> IRQ handlers are extensively used in drivers when some peripheral wants to
> obtain the CPU attention. Registering a handler will make the system invoke the
> passed-in function whenever the chosen IRQ line is triggered.
> 
> Both regular and threaded IRQ handlers are supported through a Handler (or
> ThreadedHandler) trait that is meant to be implemented by a type that:
> 
> a) provides a function to be run by the system when the IRQ fires and,
> 
> b) holds the shared data (i.e.: `T`) between process and IRQ contexts.
> 
> The requirement that T is Sync derives from the fact that handlers might run
> concurrently with other processes executing the same driver, creating the
> potential for data races.
> 
> Ideally, some interior mutability must be in place if T is to be mutated. This
> should usually be done through the in-flight SpinLockIrq type.
> 
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
> 
> Changes from v1:
> 
> - Added Co-developed-by tag to account for the work that Alice did in order to
> figure out how to do this without Opaque<T> (Thanks!)
> - Removed Opaque<T> in favor of plain T

Hmmm...

[...]

> +#[pin_data(PinnedDrop)]
> +pub struct Registration<T: Handler> {
> +    irq: u32,
> +    #[pin]
> +    handler: T,

I think you still need to make `handler` as `!Unpin` because compilers
can assume a `&mut T` from a `Pin<&mut Registration>`, am I missing
something here?

Regards,
Boqun

> +    #[pin]
> +    /// Pinned because we need address stability so that we can pass a pointer
> +    /// to the callback.
> +    _pin: PhantomPinned,
> +}
> +

[...]
